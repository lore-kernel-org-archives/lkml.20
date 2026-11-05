Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793864579;
	b=Sw56YqYO9fPH1/U2w1gE62Aj7oOM1w7omcAx07O6ZOVmkhldg2oEQO0zzuVOwMO+ZdPj
	 pNO4dEqpcfSZPp+zLBW4hLcNZKWW9wEosnFbLxiPINhIiZSha+B71IDhb0Uqz8kU3Trc1
	 VLVfq8diNtJuk1erBDdYhIvgqjAv/64libj2P0YRMflItZXUWZiz4/5t3xLYcT2qGRO3y
	 /yq0pctd/empeihDbnaSks0cRS4zOBdu31DdBDptUy7VYGpMHr7rv2OnwL8jxT6+RiOCZ
	 6mQeH40B17UjyDo7uSmm4WryrCSuYcRVbvMOzE4oJBZdN9y5On8F9jzThNUAjithdIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793864579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e4YnTjIG+CDujm7r7VgOZzRW8vqo6YF7xuCzjl3AIV0=;
	b=q1j0EXnLKAjai871GUvQTq8QTIOHn3B4sSJ4PcAE4fycqCDDui8ZR5z0cHPlYNLoHIFD
	 SS3a/X/xUHHVaQz05CCpNAj9bZDyYHs0mDiS9NvhagawHW83LoJnZ1cHUIbUOnGAVP17H
	 XMEMLKygba/6Wo+PHlNojMYaRF7ivhGWhZR1aUv9JA2t0agDNaRL9ZDLE3jjjDYVoJUC1
	 L57W94c05gPbcANjoBnqjQnqPaISKVveA3gE69fpxfL7oVdK3blrALM9OLHXgrfxX12Z6
	 At6qEd/TjTWwek5iSqfcKiKzVf7HwMis5alYuTquJ0whdhtpe5kGQR/QfprDOIa/E5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lf5ovjXP;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A515606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A515606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lf5ovjXP
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ed0b03ce3eso5430225ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793864578; x=1794469378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e4YnTjIG+CDujm7r7VgOZzRW8vqo6YF7xuCzjl3AIV0=;
        b=lf5ovjXPfiAwfRtwPVaQ/Y2DiVU/A608Fb2fb9QbOIArj2CV3NIcqyYnedI8inTMfE
         Z8oBVQk/nt/o8B6ieR01uqnGyhVYvwBNMZBAL2atEyhil5qiMrAXGPCVrhMelX8cABaK
         ywPFOqm6HeEuFOsOvtnblmyfbzzSmTfR0t/pPvIkMCe0YCaRgJ5+Aif5ZGg7pwCSXb2I
         pqKLj5GVv9oOsqUi7k51ITOlgA+ZsrnXf5d+5xaKOhFbDGi9oj3x1yvPWa87Qz5BYhws
         ifpUhREziSygdoeAeTpL1KBBkedn7Pz5gbgH2rCMYYasVX/puA72ianyJVKc59KwRQWA
         9oSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793864578; x=1794469378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4YnTjIG+CDujm7r7VgOZzRW8vqo6YF7xuCzjl3AIV0=;
        b=a3NEs2JowgrsEXYytdxOtmPCskeUecqIyKnmk6JKGXCywfUHI0JnSs78RlTw7Q83st
         VqLBydWuE6cf3udjGp8owN6gvt+tsTgMDT/VMHAL5KIqutalZE0iObRXUw4sg4jGcwpN
         o8vkcN03lOvBsMjPcJhAU/IPMiLK9Sus/laiuzaqPgm6dEnHUhU3mvKhQT30b8/EFKop
         670btAV5yhK5dOSw+6zh0l/2TtUqN+ghFIleB0IdfQdyH68+jyDIofiXMyOjO5zgO/q6
         WDs7NuslPz8KXxaT4kQ6ZBkJoFc5pX+4f4RKFsmLRnw7bcspXOeRH/pnECMhCCu5yw+l
         gBkw==
X-Forwarded-Encrypted: i=1; AKwUvBxQyqFrl0VE1aPRhEKJj313oJMikzBxae9j8k2ds2z1m4OStD/e5rsPUBoUO8AgSCRNqAs/8oarFOAo0Ac=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nMB2MYSFfwiWwSgdgBktbcR7X3tGtE3tB94CkzqT7N3COXoEr
	+KNvO5r/2YoNwE73DDN3zLlblgN3qJ+riXkDJ14Ml1K6WSsWuFeQSGY=
X-Gm-Gg: AYBFou1NtbYiqSfkLvH9SieGg2mxyLH3rP/UEWwjGdJ4ywp3pAEUJEEPqVoXoTUdQV/
	PoPr6qBdPrqt+glOD4piDxQP9brMDZUE/wxSJMuAZOwuYcPv6pBjliqPJotgWmOIq5Yo0TQArqs
	ADW2311g0V1E8gQHEM1TYGP/49QadypjGFYv1lg3/HMRk7HApE3MNINNcC45KO6vAtXab50Ws67
	rwjCfhU9/5aTGaPiULr2x7d+zFCHCJPO00GL0yY9umh1SDlVmpa35ge1ddB0NWGmC6PidV0GpMn
	baMVfpvaYQ1cnMPj4fgjmsldKtlEVCO6qfLZdqX7/iz3Cw6TPLXzMKQypfzXTokxk2EZsjfJQl9
	Otfi5eHOYNjvHEFTLaYKhvCOfrD/e5PcV7j+nPHWU5ghcMKMSDbYFYE9ERykDud03HvsptmlZNW
	RqgQFI3lw9KfoXLDAV5w7bn1gHIWc5hMWgaNJf2Zt53kuKAbVokRdNoYXQJdzkR7RcpoUbUvWKI
	F82uoRXGCkqAf3WgEhqMzfxrXeQ+wNKDtQlaYZ0ymz/AkFC6CgJdUp8pGbyh8c+u5VSIs1PE8jZ
	Q8LtXfl5PCHJgv+vIu+36jywZgps4dO1ESfcuJasbkKIRGhfFrzqXTEi4w==
X-Received: by 2002:a17:903:3205:b0:2e9:5714:608b with SMTP id d9443c01a7336-2eb364b11ffmr182159575ad.34.1793864577662;
        Wed, 04 Nov 2026 23:42:57 -0800 (PST)
Received: from localhost.localdomain ([202.51.247.22])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed091c83d5sm14942345ad.66.2026.11.04.23.42.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:42:57 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH] i2c: qup: Release DMA channels if interconnect lookup fails
Date: Thu,  5 Nov 2026 15:42:44 +0800
Message-ID: <rc-review-20261105-vc-48-dbf6a486c74f@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qup_i2c_probe() acquires both BAM DMA channels before getting its
interconnect path. If devm_of_icc_get() fails, the direct return
skips fail_dma and leaks both channels, including when probe is
deferred. A later probe can no longer acquire those channels.

Keep the reported error code and jump to fail_dma to release the
channels. This avoids the clock and MMIO cleanup, which have not
been initialized at this point.

Fixes: d4f35233a634 ("i2c: qup: Vote for interconnect bandwidth to DRAM")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261102 (2637bdec0535).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
Baseline and patched target objects built from this exact base.
No full kernel/module-link, hardware or runtime test was performed.
AI assistance was used for analysis and patch preparation.

The error needs an interconnect provider failure/defer after DMA setup.
No in-tree QUP I2C DT with the needed interconnects property was identified.

 drivers/i2c/busses/i2c-qup.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index ce30634e1f40..671bc41a5abf 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1786,9 +1786,11 @@ static int qup_i2c_probe(struct platform_device *pdev)
 		qup->is_dma = true;
 
 		qup->icc_path = devm_of_icc_get(&pdev->dev, NULL);
-		if (IS_ERR(qup->icc_path))
-			return dev_err_probe(&pdev->dev, PTR_ERR(qup->icc_path),
-					     "failed to get interconnect path\n");
+		if (IS_ERR(qup->icc_path)) {
+			ret = dev_err_probe(&pdev->dev, PTR_ERR(qup->icc_path),
+					    "failed to get interconnect path\n");
+			goto fail_dma;
+		}
 	}
 
 nodma:

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
