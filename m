Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA40521205
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801588; cv=none; b=uPwiLh8l0xbFMSpJ4SUjqY/vlMvsgotosqzVZCLX5Dd+/ZoS03ARuvg09/ZtX9h7JYRuN4cdJyrl5hAzRrlzaOVonhLKgID1cD4AZhw2cSsXAqEndM1ZjkDt6qNMgVXVu2+WirnR6+5xBPyGEq8vf4VjtwHcA/2Q4NPr201PHzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801588; c=relaxed/simple;
	bh=BVQs2KMfxV/tT9rQPMbT3YixzDlqI/g+6wdyT9j5U6Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uMZ3fwkzUin2EthteFY/sJQqAbbsJIPek26flHef5lp1kZ8CJCbkgQcqGyzYBZ+ItUBMXhA7Zsrsw/RI4MEMVji8OvyVekNFHN1bg+oIN3eilI23qS5MrCD4OFLjZqcCk9eOLx7TEUe31p5XLhZKGTQAmcrSJfjcTc0kTWz905Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sebastianene.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tQ6Qco0F; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sebastianene.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tQ6Qco0F"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49b7c1dcc82so22591795e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788801585; x=1789406385; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pgNVIw8B8D8cs9XgDbUZbP9oPGN4jX1fGCXxaqN5ORM=;
        b=tQ6Qco0FoM7+VsQdLU+dciRBdgJ+NnF+cxLnqdfkZ9/wJ/ENnv5RK15dR/OQl4TbID
         hJNt/AjnKF9cfrRcsEjCmDAXGd9s8rjxcsJFysRttzWqqBq3ia1w9YESgybIdAgJtTK7
         yF17T7unKUlFvw85pOVHw8mAtmgb72AWNXFattSSqZ8jXWCTnvnAyZgWLktvk3CSzHjA
         ZnjY63moxmWo4NytkodyvXlHXHEt1UF6i8TVbUiljpJtxQSJmEg1vvQ3l8esPHQoE9M2
         yZjOUpAxaHR9OSBs7vE0O+En5QXnjR79ZKVjMkhjIhyH7EyEeTOYKMhoLietFgny1u9I
         BURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788801585; x=1789406385;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pgNVIw8B8D8cs9XgDbUZbP9oPGN4jX1fGCXxaqN5ORM=;
        b=FbwSlLQMf9RFfkKF5ge8fbIWGekt/xzxn94/g1EGSuUmYAcQdFG8Zj67uNu0LZHIJJ
         LFat4HTQK4DaGfDhdvihCESgtx3biGgUUk0Ll78cAz80g5TtUdiWDjNRhcfAgTTbHBMY
         K3+1Dv6731wbxKPOqsjNwwYALVgHQLonA+5o8MyBZLeblJHuwic3zM1sH8TuHMWujgnn
         53AfSbV0UQ3mTr0B3sZ8zgV2BRHN9/R24mlXUb15AegXzzQpFXOUg/GycLQDJjaFFoAp
         BP2FQBwHRLXou5p4tU0JkNywbGCJMlzsVzKTPrUgcPek+Bs/HpFe/7DGcJb2HB651cAY
         FC2A==
X-Forwarded-Encrypted: i=1; AKwUvBzG21EmuBT+BwgXGWck8D2b4/+GewPjfoWyzjUrJvyMczhWvRRWdG1toBub937dwN4Sl65W5Bp6k3rLFqo=@vger.kernel.org
X-Gm-Message-State: AFuF++kGJqTd+DtkTnjKP2CdKlSh8r8zb6BtXZCFvvF7BPmy91dce0NC
	5TvHieP/fHD//pu4DuXsB+cT0HcXkn7eBq10X8kZm55p1OIaHNS9IFR1CgYZEHjDIa99x8X5R8W
	2gj+TAEZUMbERm7zy2w/9+xM40tPKgw==
X-Received: from wmbgx24.prod.google.com ([2002:a05:600c:8598:b0:499:bb2f:becf])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:864a:10b0:49c:fc89:59cb with SMTP id 5b1f17b1804b1-49cfc8960ccmr150937795e9.5.1788801584621;
 Mon, 07 Sep 2026 10:19:44 -0700 (PDT)
Date: Mon,  7 Sep 2026 17:19:28 +0000
In-Reply-To: <20260907171930.4037166-1-sebastianene@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260907171930.4037166-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260907171930.4037166-7-sebastianene@google.com>
Subject: [PATCH v9 6/7] KVM: arm64: Support FFA_NOTIFICATION_INFO_GET in host handler
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	fuad.tabba@linux.dev, will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"

Allow the host to send FF-A notification queries to Trustzone and proxy
these messages from pKVM.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index e11fb06df63d..2281ac2e42fc 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -694,8 +694,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_RXTX_MAP:
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
-       /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
 	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
 	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
-- 
2.55.0.979.g7e5102b832-goog

