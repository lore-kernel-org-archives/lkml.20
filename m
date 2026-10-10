Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C30636E467
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791643590; cv=none; b=aEJelR+ZXp+DfegX09rjTcq4u7BqrRpaQZFLujM4sfnWNIkd/hWICsJEiz3JGscK7Wl4Av/V0nacROX4MTV3las5St/oU3lKYPYrbDRC+LYXOMKPayx/uEjkdzHS9AV9fzUR8sgci6UPI81QGodbevGB5CsQeRb9o5topawiDEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791643590; c=relaxed/simple;
	bh=Wvi//AU9aUa0xv2xAKbaSl8hbCy/X/0aBofKQo00tnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GSbfU02e96YrOFMx/dR2vEnagdXDL7A3YWEF1wo5mLzncNC2xHjNTHZaPPBxZq9+e6ziyUSl1oHC9e0JGQ/t/nhmTa2vA6dnswIgmgVcxEur2TgFhBpiwRnF2aUsSGCv6LgP/TuqLW14/6dCYjgZmGZotx8oPD+HF79UrDG53sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rz7lt6pJ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rz7lt6pJ"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2dc63f8d8aso117278666b.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791643586; x=1792248386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOzUK8aXNK95MikIEjp1tQfOk1H/IJqCnHMejxcL9r4=;
        b=rz7lt6pJmvAN5eaZKH43tNAKlFYOYBP07WBMlV/D+kLzvp0ySCRg4cqqwd/rufv8QB
         VFro7YP9CNKzeUCzyTDf9GWKHPLh8bzBa/E0WVfeJ+ECY4AsQ3jsBfASS1+mzxdugqaC
         mWzkR7yASVEwELV6/dk8+2pIOBtgUFI8LDa6XszVamO8YxuVIB/vIsBP4KHJtDts6ix1
         Czf63XTKbVBYg9QJXHwO7I1pBx2lL2sUOS+MStYDiGq7LVxc2EX7/wgkYUrY57K1/qCS
         2j/tkAJn5cZna6Az1nzKzo0MqwMdyPWcasIEmINSFb/E+GzMdWCFqOQd+oE/ae6gwVGC
         Ykcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791643586; x=1792248386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UOzUK8aXNK95MikIEjp1tQfOk1H/IJqCnHMejxcL9r4=;
        b=UTuaFKunLblWRqhnSQHWyXNckizUn/q74WgLP1LWB8niletYzWwg6lc8T5vTT3u56b
         P1xSg4uz1b91m8MCGpdrEdE83ug3jHgwgdEeuyjYuEpGHD/4sO8qziDmJ5WJXgsK/M3M
         /w/bgk2mVhxZ93b32uyum3N4wW+fF8CG6uk+gaslg19DmqvrDm0UMWQam4LdynfGdZOx
         HjhcrihHopsNEAYXpS1SvXLYmGdvVUp/diFufFL1i4Qoy1MeZOrRw0Al+XKInZOIZDin
         ucfAM559lF79si1nnI+tRjb6l93ZODoOGbEqvjpJO2cvkQ0uHcDTkWrwQrga9LQfPnlh
         t0Fg==
X-Forwarded-Encrypted: i=1; AKwUvBwzkZ93DlDk5Tsx4q1Rz5ms8stn4Pkm5XLqI8XYzscLicZ51MsmxTnR9Jflld8ZiZqN/TsG3Ylq/LjmJYI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2YMJGG91TTkuL9IMea9bX64bQCFvXi4xs/YMKYN7cEZDHaono
	OIDgy80lZ1YtSaeonXkb6z7cH3/Jn5LzJDCI2FeJIYgRKh+l1E4hPwXn
X-Gm-Gg: AYBFou0ws+iHfWnWLVN43VED63SbU1Zh5bYj4+jJT3kp+ukV56KWhPPGcbLNrYFJfAg
	HDIbTFBxZ/DbKGo/ZcKYK3BWX1BT7b0Nlw8cOnZ5csnP5CE58Qup41xHxuUaFtA7vQCGz3KZQOD
	TJNwJXeFPa05jM9jvcKce/8MaI3rs7NqJ1kagzPHM3WKulB5kb7NVQTYzQKF163Sx5ZV/8Oo1Uh
	oN7u8q3igsCcdHTJutTlyyKJHuCwL7Ahl1J3T8J2ewNeHXnqecSVFyGQoBfjslhk7wEVzw8wmQT
	amwOTdL9xziA10w2op7cGyger+FZpWPslfIlUO61nhLzf4NoMXuqQZnapMHRcDyZqKXeHvHU/5/
	RrBEKKPiuQop7BOr8szV6zE5XwaDHxCEU6ULAR5TfcxT15qABKTNBDH64Pt7cf0hpo+F+YsTKzd
	t6toBLrsAOQX3xPMwNjIwnJNJXYlvDBwmyF24iGS2xAihmJGT66EJaT6s8Xy+NXaxNtg+v6r5nB
	Wg+nY4RlsVUn74ITlnqFx0pvpmX2tWUOv+HOu3vBGtjfJ6EtwQ=
X-Received: by 2002:a17:907:a4ca:b0:c29:f5d8:9c82 with SMTP id a640c23a62f3a-c31aa0dc185mr510677266b.49.1791643586117;
        Sat, 10 Oct 2026 07:46:26 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9767227sm247286566b.11.2026.10.10.07.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:46:25 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v4 1/2] alpha: do not clear remote MMU contexts in migrate_flush_tlb_page()
Date: Sat, 10 Oct 2026 16:33:10 +0200
Message-ID: <20261010144621.974850-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010144621.974850-1-linmag7@gmail.com>
References: <20261010144621.974850-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the on_each_cpu() rendezvous, migrate_flush_tlb_page() walks the
other CPUs and zeroes their mm->context[cpu] when mm_users is at most one,
described as mimicking flush_tlb_mm()'s mm_users<=1 optimization.

It is not one. flush_tlb_mm() tests mm_users before deciding whether to
send the IPIs; here every CPU has already been visited and waited for, so
nothing is saved. The callback has also just set each CPU's own slot
correctly, so the loop only overwrites it, and does so while that CPU may
still be running in the address space.

Remove it. The shootdown shortcuts in flush_tlb_mm(), flush_tlb_page()
and flush_icache_user_page() clear remote slots too; once the next patch
removes those as well, every runtime update of mm->context[cpu] is made by
CPU cpu itself. That patch relies on the invariant when it reads those
slots to decide whether a shootdown can be skipped, so this one is tagged
for stable as its prerequisite.

Fixes: dd5712f3379c ("alpha: fix user-space corruption during memory compaction")
Cc: stable@vger.kernel.org
Reviewed-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/mm/tlbflush.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/alpha/mm/tlbflush.c b/arch/alpha/mm/tlbflush.c
index ccbc317b9a34..239c72b8a741 100644
--- a/arch/alpha/mm/tlbflush.c
+++ b/arch/alpha/mm/tlbflush.c
@@ -90,22 +90,6 @@ void migrate_flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 	 */
 	preempt_disable();
 	on_each_cpu(ipi_flush_mm_and_page, &d, 1);
-
-	/*
-	 * mimic flush_tlb_mm()'s mm_users<=1 optimization.
-	 */
-	if (atomic_read(&mm->mm_users) <= 1) {
-
-		int cpu, this_cpu;
-		this_cpu = smp_processor_id();
-
-		for (cpu = 0; cpu < NR_CPUS; cpu++) {
-			if (!cpu_online(cpu) || cpu == this_cpu)
-				continue;
-			if (READ_ONCE(mm->context[cpu]))
-				WRITE_ONCE(mm->context[cpu], 0);
-		}
-	}
 	preempt_enable();
 }
 
-- 
2.43.0

