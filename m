Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6564AEBF7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441708; cv=none; b=mpVd5hRJJwwJr9u8aCkokIe64IzzGjtg+21MabYt7j5DgpStJXbBkazNDMOXW8M8ecJnvHK+z1kaCOitjb093FjfQIu58y6OruGlpkFSr+wAObuOaj6YSfFVG5BUrf9J3UH3EjkmEFA45gNIcBuc3qyjA5HCJZbuEmpAAKtXnEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441708; c=relaxed/simple;
	bh=LcC+HWGmQ0fxOx852bK2NBNN5pdJT5DHV6NP5L+DVDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LGDeZmBN9RoN/MgMMItTfzbcpaPZrixUjSX+akEnSLqDzqfIzKwmy8n5GpUK9NExqbKEkBvq2qySZCCbi1NTOXdLAljDuK3VZRXNPPlNorcbHKvFLEU6CYkVeGpKE/N0IWjLbw7TtBnD2qHw+fMESkVMSmjnkYKl9gFSOjPPXE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hX0gS96V; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hX0gS96V"
Received: by mail-pj2-f7.google.com with SMTP id d9443c01a7336-2d903e972efso8741115ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788441702; x=1789046502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vk9WaqzesBjxVgmVKCYftfsQtIYr0wVV0kPu69zMKBA=;
        b=hX0gS96VdHHxs+hxktlIU8UsOFkWS3ghHJQW7MfDiqtOgX9GKEIOsdLhhz3g8Nvkjf
         Aj7WNi8U9/mWl1XNILLDS4trMDFMd1K5dGIUBOXEctvhA4uqaf7Bni5TlFgIiT4Zfjg5
         4NOVHItsY0CXRnJSw7avhLlUSpFUjFmYTGxtbz6xjM9ZbZDq51gP5SGpLLRuzNOrdhNe
         +wovyjihi1vtECiVHqtitGr/cNXivQb7AfTzJTu2cxhRTFCy0KKYDhqJtYP5LpPwijhY
         PQ7PaPKcDAnVsOdSwOeSxEgD+VSyteTZ/GObd8LNU6pqKPXdo9hdpNsAmImSo+OI9kTz
         3WGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441702; x=1789046502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vk9WaqzesBjxVgmVKCYftfsQtIYr0wVV0kPu69zMKBA=;
        b=IlXi0C1SZou48d4VPdZeIBDfa6fLVR/bBQsuP6HEmzY0F24/J82DYpm9+5ziuy8VDa
         d57HDRLgkNzg5xcinad0BUrbbQEMexK31MjSEQdtv/DOf7s4B39n7macjWSg2w8fXPV4
         wjOMn0PrjlyAm0uoasYcz8BGEfT/5n3QYVi7ncGZyCeHheDHCcnWF/t8iEVGtr/kymvT
         OzaPOpehAhqYpP640PJH4oUkX+X6sNTZVBV/R8FvuGObSH6pPg/lsRydZfB75RjSS7VS
         OGtn5THbY7TQZYxbY7ULwvo4JCvn0sG/lw8ZIrkpD9KJf2B0gaLt1xfbssLUIpM3ebG+
         QRpg==
X-Forwarded-Encrypted: i=1; AKwUvBxYJXuC8hq5JyWVKbSxMHW2HUYUuDTvO/RBWJBG1dhX9KiOfL+FNBIWBcUebsH8awaCi7JWLX8eVHQ0tfM=@vger.kernel.org
X-Gm-Message-State: AFuF++loiJnytd9WDoRgvNVIdlKZZtCquUpFhtNmsxD+yE2O/L8524f0
	2qM7XbtzOuJ41c5cMKjQvE+oLp196q77bZ6KJ5vfoi1anNgO+8nVhiOF
X-Gm-Gg: AYBFou2zc5usNRoJGkd1MThK9lWFkgdac+f4pv86PtuNCHrGxRgYefW5TaIPZkumXPP
	RQUMJ0aAknLgsyIAFLawRQZHpCTyQ/jhvsTAFatLo/zeD3UFc3V/ZA/B/pmtV2k8u+lpnVlB3eq
	JLprQye50Qf+/MUfbr50YM2FfPeOohsr9Ma/bDV32dIo8ogJ/JXpE/BUzKz3S5tnlAB1ZqFMpG1
	XruTtNR+fCWqBAF4lxis8qDcQcTe1s3Qrg9BHp79XHwb29ozhUSxHGCZPbsX05pPEhKpmuT8+CQ
	8N4MmXJmHJEWKtEV7BpOgbk4H+C9yA7z/LHedYCysiKR8BQ8n40rbuFcFk+oecI7S8+duroBb3E
	2SGUT2TujdxqogQ5MqP4xQAkhD8B0nioIknVu8juUg2j0wMGoltdeBHNblPRpLcrPhXjle10JyW
	B3TZUTfxnkALKHhqWywfOvbiJ+tx6ZaFhjFWGwW91bsVGtMMPNCZ1ieuy2zhQvK2m6OOcSsv9jW
	zYf2GkbrOuEECVFoDQ=
X-Received: by 2002:a17:90a:dfcd:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39aee1ad8edmr20448584a91.23.1788441701703;
        Thu, 03 Sep 2026 06:21:41 -0700 (PDT)
Received: from hyperV.. (KD059132155222.au-net.ne.jp. [59.132.155.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0861e54csm5744537a91.10.2026.09.03.06.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:21:40 -0700 (PDT)
From: yangfeng <yangfeng.lucky@gmail.com>
To: tglx@kernel.org
Cc: radu@rendec.net,
	linux-kernel@vger.kernel.org,
	yangfeng <yangfeng.lucky@gmail.com>
Subject: [PATCH] irq/debug: implement missing FIXME in print_irq_desc()
Date: Thu,  3 Sep 2026 22:19:15 +0900
Message-ID: <20260903131916.61329-1-yangfeng.lucky@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original code ___PD(f) left a FIXME, so fix it.
The maximum length of a macro is 15, so modify the printk().

Signed-off-by: yangfeng <yangfeng.lucky@gmail.com>
---
 kernel/irq/debug.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/kernel/irq/debug.h b/kernel/irq/debug.h
index 8ccb326d2977..aa233cbeea38 100644
--- a/kernel/irq/debug.h
+++ b/kernel/irq/debug.h
@@ -5,8 +5,7 @@
 
 #define ___P(f) if (desc->status_use_accessors & f) printk("%14s set\n", #f)
 #define ___PS(f) if (desc->istate & f) printk("%14s set\n", #f)
-/* FIXME */
-#define ___PD(f) do { } while (0)
+#define ___PD(f) if (ACCESS_PRIVATE((&(desc->irq_data))->common, state_use_accessors) & f) printk("%14s set\n", #f)
 
 static inline void print_irq_desc(unsigned int irq, struct irq_desc *desc)
 {
@@ -39,9 +38,9 @@ static inline void print_irq_desc(unsigned int irq, struct irq_desc *desc)
 	___PS(IRQS_WAITING);
 	___PS(IRQS_PENDING);
 
-	___PD(IRQS_INPROGRESS);
-	___PD(IRQS_DISABLED);
-	___PD(IRQS_MASKED);
+	___PD(IRQD_IRQ_INPROGRESS);
+	___PD(IRQD_IRQ_DISABLED);
+	___PD(IRQD_IRQ_MASKED);
 }
 
 #undef ___P
-- 
2.43.0

