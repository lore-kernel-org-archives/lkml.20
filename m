Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65D949E14A
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791642352; cv=none; b=Xg6eXFO7Twc0fcird62JZaiCSebYdjpCoLqiFOHSg+tIIVBFMJRsjLLd2KdpQn0gLK5nPVS16/NkhwNBjItC6PGcXSRV4iAoTl6DrHCwMGVIIZBWlMuiXu+fQBsB3DSw7r4y2qGMSTLtkVMYzFk6VNLu1bHfbvp10hIgPQ8B3cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791642352; c=relaxed/simple;
	bh=cXkMIq8q0zl3V52rVeK1piAZiIn6KlSymnHMZWG51BE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L8+9B+/ugf50D0Perx/h0ZFM2N2gttcxlBPMx03N2ZZHc10bTtIP9ONyhE81h/7ylK14NZOlB+oZwhZcI+fnMIbKZaW99Ue6hdEqndiDZo0fL1RWyhFFO3Ccvcwul0YcfF+bx7vCwDftL+hl3Tu+ZzGsT01YZ3I6+LJ50iBfhqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNXJOjxW; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNXJOjxW"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so966911a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791642349; x=1792247149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVnDfPQWDbfz+z7bzr+fAeI6gucp+XBlKaScYOwyp+I=;
        b=HNXJOjxW0ptz1QlJo8zynhmXR0GJJtNxcWpblcUqt8avQoc2GwYVOF70fkE79RDOt/
         e0nC56VchERHygXPmmBTosRZpZ5NJrQ9Le5pBw/UbqPsqXWP75XHKfYq5t5NemCCmE/P
         00FWiiqTFvp1KupAK7OxRtWvqbiyqu9gq+EGZB3+h4eHwS1lt8ujekvLylZazUSA8DW4
         z5l+ay5iFow6KdVtcKjmEsGCOjsQQlHAK+En9lfmqLtsbcW/xuXIkUffqO1jCg5lxLPz
         fSNymp4BkbIcfDS6C9Ywn7NKAtni8sGtUP90Btn3R3RIhKmmxwZx0DI6gi3pRobrJqm3
         JLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791642349; x=1792247149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cVnDfPQWDbfz+z7bzr+fAeI6gucp+XBlKaScYOwyp+I=;
        b=Vd3AnYSk+eetDlA6THO8QvQIbiT21tvaDLDUI4Ca+W4YNH+D26+6CstrVEUY1V0YwJ
         4cDRy4uEenpWi241334zSWPs71nyqDcZwcu2iFZVkRqDaLvCzxMMimMIBsDxd/iHTjZI
         19WKNxiWPiRB2T7+UU1wqYzdhhfJTcffnnoLyu65j54B8LEQ07UqK2f7eyKM1inErBWf
         AdfYmdk8ja+9Vfyepct/izmTdlAsNZokn0F4OXjDHXVwg1x4n/iKjvQomFoBRGDXGod6
         +pnPcEajoK0wlwAw3/6L5duwut60rfAr4DCZLsObaQLOuYOL7pFUmpaFJpRgX/FLB8Se
         BjPw==
X-Forwarded-Encrypted: i=1; AKwUvBypnZ4bs+MQatRzpnOOzHJZ8Ut4H5xEw1Nwxj54HyS+ZKcmM+3fPY9CexkVjWSiyRHYYKDcUFbEwoBnaMc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOEvwu2E04gJY+efqeFd5aiGQF2GC1Gac5j9BQ8IAg+tWuqVwq
	bpVD0MCr2y/g26emYCxv2mJugHdm1VTwYySN9bHtonGBzmlmfynHNt10
X-Gm-Gg: AYBFou1nK1mmR3OVmHglKs6QHdhU4KbjgXbVKpDnqTFNIshV9AZr8gaz14G12dWaYe2
	1si9bc38GtFw+FLG7IFTpHOpCWQczAIkpTrJuTSrJrJNDa2MBRtlkjMwz+52BVwyzkMlcg3EE65
	56xLZ5BTLrTy7Y+83xREKyWwRL1yMoFmr71+xg79q0cl1zRrnxvoTgQ6BLlw6J8x8c1ODEqTxgG
	hFHOY+/JR5KY/2kvJv1zIwxv72ycKkWb0jhpWq30CRWWkgKF+DYmcdUpW8R3gZhCslcKbJR3Lzc
	LNVSDnCOFbGm9QI/slJziy96ocvIaoVXbAUyAu1DIEVIGhWbBxARkGB+Rr8+BGzhZpkhjnYv/iq
	ZneLq6maMcte7H5jP3ILMxHj4HD7iXCPInqdsWuMbIBgRrjOU+9Hfa1bTa4IJPBPIAfWKX15k9/
	1n7rBfNPZ0sJrEFhs4LwGqbuZW+DIAHAqN4+okUF/dmGioYEqK9IkV176G6Yx40MifW/+Ofq0uZ
	JxNU+oNCRP+OU8vFSV2tNZYFkOtDVfjZTV2/QA8
X-Received: by 2002:a05:6402:5189:b0:6aa:f809:ef44 with SMTP id 4fb4d7f45d1cf-6b17c296a4bmr4478915a12.19.1791642348794;
        Sat, 10 Oct 2026 07:25:48 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dfff40sm2635586a12.34.2026.10.10.07.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:25:46 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v5 3/8] alpha: only use a targeted tbi() when the target mm is really current
Date: Sat, 10 Oct 2026 16:24:29 +0200
Message-ID: <20261010142533.974797-4-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010142533.974797-1-linmag7@gmail.com>
References: <20261010142533.974797-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipi_flush_tlb_page() gates a targeted tbi() on current->active_mm.
tbi() acts on the address space context currently loaded on the CPU, so
it is only guaranteed to reach an mm's translations when a thread of
that mm is running there. current->active_mm is not sufficient: under
lazy TLB an idle or kernel task keeps an mm as its active_mm while a
different ASN is loaded, so the invalidate is issued against the wrong
context and the stale entry can survive. Nothing retires the old ASN
afterwards either, mm->context[cpu] still being valid, so the resuming
thread can reuse it.

Test current->mm instead and otherwise fall back to flush_tlb_other(),
which clears mm->context[cpu] and forces a fresh ASN at the next switch
whatever is loaded now.

For an mm borrowed through kthread_use_mm(), patch 1 of this series
installs the context before the task can take a shootdown IPI. The
current->mm test therefore covers that case as well.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reviewed-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/smp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index ed06367ece57..1ad448105201 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -669,7 +669,8 @@ ipi_flush_tlb_page(void *x)
 	struct flush_tlb_page_struct *data = x;
 	struct mm_struct * mm = data->mm;
 
-	if (mm == current->active_mm && !asn_locked())
+	/* A targeted tbi() needs a thread of MM to be current.  */
+	if (mm == current->mm && !asn_locked())
 		flush_tlb_current_page(mm, data->vma, data->addr);
 	else
 		flush_tlb_other(mm);
-- 
2.43.0

