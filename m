Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2594FDE4F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801581; cv=none; b=R6ipgXUWYjia03AvN01lcl5HVlXBxNcxHDqDa2ylcJ9mdnrFZpcdFVW9mLlIHEvbK4ZpF5hDJakXSclLKJlRBKL8CHbR3L+ihT5UeWHAveEgT8gLvW5P/Kuadr/rsdzAgOTzkO+2fUeVhjxhWhEUZ1h50OMlYUDAGJiORXNDZWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801581; c=relaxed/simple;
	bh=3aB790zGiVOG/HfZGHcb/tIqTnzy3lfiYNqJ4SlcI7Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YdHc9jCggaxiU0FD7spnsLM1OWVZKz2vXJ7Iqdr4QfvKbnRwoiQmn7ME0JzPb/Ou1puqRbTLC7JtLJ6dj510z9HugnSiaGTz2oxuzAc6EfAqAKV+K5LfXZX2q1XEtBHFevqwxrgeWl8pGqw7ZCOUDD8QJoysp5x+T2RDgDBnnTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sebastianene.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c5+NQAIt; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sebastianene.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c5+NQAIt"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49d156c917cso5637075e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788801578; x=1789406378; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nteL4njDpbIytNAvu2VP8USt+sQ1w/IhgUr/WfH7fOI=;
        b=c5+NQAItnRJg6iiodjs6EcloBlQ1d3x+4jOPs/oo9HTx6GBG/jNqw4JYr3z+2tEXDE
         zTpWMYHsiJQhIHoJV6PIOiWL9qqqaJHTXlXLoNtjh+ZAvgmONl74cVl/MhebBkSKjmuj
         EApXbUh2dz3naDoscK5lbbdnaxd7DHzlSghZtv7eu/P2jZCG0VXFjo4BM5U3Vucy/sB5
         KEg2fJTovbDwl0xfN1WAERgBv+Ux4q+sHe/cRUHfkwChSCliJAIS3e/vcAG3lO5MM5Zw
         NiLnVUKXmEyyfi2uIfXb7eLe6rzjlgNJXo2HQiwWgApvLO+Th09MlbiJnKXUB6HbrTxh
         4f+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788801578; x=1789406378;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nteL4njDpbIytNAvu2VP8USt+sQ1w/IhgUr/WfH7fOI=;
        b=F2tsrHtKD0eOLf9K2IMg5WWlUCtsyW9cPlLxclJxS5dhCzSs/NDMzqSdJ5mQYMU0N9
         U5LlvdyiWBWW5JBd7LI0ruTs8HqFf7AMzH2oHLCymT+ODIHXGnOoYtAx7WKl7FyowQMi
         39Y4y3NE2L/hnOkRuL4AenDw/eAlGT7XkywtdtxTdXqKHof36rzqxq39iWRpFvFBe7Vf
         reCAP1x8qJlWoyRxd4YI/vL3NpZ040h16SHORYfsgBCu99vLUs+MeQ5+JHfYBgCogWwx
         bRv5ZTmNc5G+U+lf8JvQG0Gg3nZ5ZfyP8Qmk03o2p80o8be1eFJyRebZ4tJS6xzKxAfy
         j/ow==
X-Forwarded-Encrypted: i=1; AKwUvBwIXJlrHUaKbJHvJ1BoK3worHEHDLvj4m121cRrhDmssWRUslekD9cyyu4442ewaTJ3s4KdPHUtudKs4QQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mCAzUOTwoYToa/UUt/AHHF9xl4DlGzWJQLF4JjThzxeqQnTRke
	6xywQ7sas0L/nW5RyMlCe6zrLmCq0ZcYHgT5PswzlP4McHWrCUVLklFQgcy8or9HSbhvLnQgpbF
	oguHAfpfuDqx9++k8hfNxjWaiAyegfg==
X-Received: from wmpw23.prod.google.com ([2002:a05:600c:997:b0:49d:74b:4e06])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fd6:b0:49b:4eb6:6ffd with SMTP id 5b1f17b1804b1-49d1754ecbfmr25030805e9.5.1788801577617;
 Mon, 07 Sep 2026 10:19:37 -0700 (PDT)
Date: Mon,  7 Sep 2026 17:19:23 +0000
In-Reply-To: <20260907171930.4037166-1-sebastianene@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260907171930.4037166-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260907171930.4037166-2-sebastianene@google.com>
Subject: [PATCH v9 1/7] KVM: arm64: Forward FFA_NOTIFICATION_BITMAP calls to Trustzone
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	fuad.tabba@linux.dev, will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"

Allow FF-A notification bitmap messages to be forwarded to
Trustzone from the host kernel driver and enforce the host vmid
check.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index a327c2bbb6b6..aa82c58380a8 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -692,8 +692,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_BITMAP_CREATE:
-	case FFA_NOTIFICATION_BITMAP_DESTROY:
 	case FFA_NOTIFICATION_BIND:
 	case FFA_NOTIFICATION_UNBIND:
 	case FFA_NOTIFICATION_SET:
@@ -878,6 +876,21 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 	hyp_spin_unlock(&host_buffers.lock);
 }
 
+static void do_ffa_notif_bitmap(struct arm_smccc_1_2_regs *res,
+				struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, vmid, ctxt, 1);
+	struct arm_smccc_1_2_regs *args;
+
+	if (vmid != HOST_FFA_ID) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	args = (void *)&ctxt->regs.regs[0];
+	hyp_smccc_1_2_smc(args, res);
+}
+
 bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 {
 	struct arm_smccc_1_2_regs res = {0};
@@ -936,6 +949,10 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_PARTITION_INFO_GET:
 		do_ffa_part_get(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_BITMAP_CREATE:
+	case FFA_NOTIFICATION_BITMAP_DESTROY:
+		do_ffa_notif_bitmap(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.979.g7e5102b832-goog

