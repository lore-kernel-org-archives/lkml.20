Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792535311;
	b=uKaDAOasXb+G3Ayw+h3IJLhr+srxyjBAPr+l50g3sAc00vad8oKbAGzBnJkzbUgP1/Wv
	 +tbIMpYSs9u67fWnM4Q5jFMfO5SMESLYGjhLjbA8/+F2g0QpAEmZUakVQSRZa6RGgGqq1
	 X7hLkPK664tALrYskGq4GdLLbew9YRaNMYBW0tbVirKR2wiXTeVwEgKfeQJkLesrGwIPs
	 XOVSKICyfpPyxZNfj7ykvETnP7nBpkDopx45lsnpqV4RU0PA72GrNzYKWwYdZ8qwg4f9x
	 H+MA3vI8UtnIYMTshWkhGh0dR6qYvoimuJAdocjRA7lRANtx778kcBne8S//xGuFupw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792535311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=2hhU02INeiLDlugLYSQ1HT9ECkkZkvz9I+ml1ZnNGcc=;
	b=gH9TalCrU0Aw1V1KLDBfTBmb/ymNS7HRalETBJ5vzsy2i6kVXATucTHE1NxpC4gsxk9T
	 G3R8ktEPRCP5gpofkZUYe+Rd/5V56lEq1wxRDSlqAZGomk4Vc2tE/myMM22EmutiwQPhZ
	 F0bJqX6cGk/4FexRn7A7ldJZwClT70Jo/uDO4ct9MDPvcHjbajBcxL2XV11k3R5sOEF0i
	 niBq7opy4DKaThSqapDWTuYtzITS22+xhVLSM+4WErUUfZc3TRhym2UnntS1a8DtkjfJ4
	 M6wVztu7GL75pldmsXwWeFei1eipcdkiO5lUGrQkUhMkQMbzgCwbeSG3och248zKHgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Y/mgETZH";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF362606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF362606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y/mgETZH
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso320535e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792535309; x=1793140109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2hhU02INeiLDlugLYSQ1HT9ECkkZkvz9I+ml1ZnNGcc=;
        b=Y/mgETZH3WvzzGFNg6JipbiSWc4iwLTh6Nvx4qSEGTbUYIfspRiCiOUSP6+Y+qyKsS
         YqF/FeAtJVRH+dUj6TBT+gLM0JWBRgkm5uKETc4fQFE/ibRhy4xLG3+UbLwY66P1R3OY
         ZgMNH2IJMFG58nHOHaljR9ImPa4BTmXN/LqAc6/4XbgImLnN6KOumKXS9gptIKcghfDZ
         K1yoGVO78kOsZTRitWfCWGLdGMzScZhddDbMIkBXQrC+506vRvPJ+FzE4U3aW18EbC4b
         Fc6y44sC+361lT5G8C4WrAq1VIzdlbhXxxK5KDulDL5gB89GKlxPABhCF8oE6LPPG7Uh
         1FIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792535309; x=1793140109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2hhU02INeiLDlugLYSQ1HT9ECkkZkvz9I+ml1ZnNGcc=;
        b=ZjGO2tWd5HT3hqZSLFvLqHYxc6KVbU3Av/G8p2yKw2wIGGRa2KVXvnRRrATVp+Z+dw
         /DRks50FZR0LgD1xh1dhIc0s69qjRDMBFbiPo3tYH3f9LiB9xbzg5rp2zR+TmTymxNMM
         88kt5cEIkqtXqwIviuxWxdoRGxCfO0zBYHqv2VC5Cs7WyPgJvqLaIrZlAXCkH7aM/zVa
         J2yXK/nKi/1mENPcYKcI8IDNaSjvjegdj6fSTQFJzc90I7HZAC4Kq6LS8Reb0jGPFCTO
         50NXerDTxOiCyEcwDs0syTtfhy2e3PNTtABMGiTcKusDsTBDh7cy/sbwS5xAJw/9k50t
         Tksw==
X-Forwarded-Encrypted: i=1; AKwUvBz6gwsoi+NM6r+NzTM0lU5MLDw6w2/5QF4p7gf9mAjfxNc9foJv9CLic9FhI60UwozEZwc1zWSVgZfilcQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbdpCjpzVA2/6m0/iQOk1VcobmNQ8QFwF77HFnrvIcCNILgseF
	xz7OAeIz1Y4hFQvVEYnAuEZBycP/P1Sox4aBb9QETfRIu2BGtYmKY8f0
X-Gm-Gg: AYBFou3iwzNdKt5+23aYCoBN0L708UqBsrsXF87VaRETii/1DMvAqvf3hLeg9TRBS5a
	2IyLei4j6vc38VcvOTdPOFFkUIJ9rGOk6YYDqs4x36e+uLXP1hGBEuL25qQ8OPXspK9+urTIAL8
	x94wL6P5BE4nlvoSLioXNbtPQyHXF87rOny4mNmbPpI8Y+XShyBCm0UJxM8iOdW+xnA637ae9Eo
	P8lL8Q6B9Sg2XYRxd5sVLu+QiUjjTdTj6nV8/5LY7OgBs5+Cuj0BOTchZTT5Hj2gdWotHBBmnrd
	nV/rYjgk1Z/Vd+90U0ZFD4jIbVi+jRUDAz7J3PneVMYmTEyLJ7zaGTt6RluGzM4zEL7eXhQ3FT6
	f6yexwa3glFVM2KrbbealC9utG4IweRwsBOsaThAojrU2hpsJk8q/ITtO9nABlKnXuQg71KF0aN
	vlmx3znnXeCt1e6yP/8KpgfnOpY5yVfvaW12oibptQ52PyNYFmIG4rfDKBL/PAvFsEyYV2YmOD2
	0aFv+vHLoEmditF61LKJO5CMCLImvVo9L2R7OOxUJbdMCrH9CgGwIoKgnKyjXKt0haEzQUMIg==
X-Received: by 2002:a05:600c:3b24:b0:4a1:f736:79d1 with SMTP id 5b1f17b1804b1-4a1fdb20d04mr1918375e9.16.1792535304480;
        Tue, 20 Oct 2026 15:28:24 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd629bbsm9661935e9.5.2026.10.20.15.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:28:24 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	vsethi@nvidia.com,
	maz@kernel.org,
	sdonthineni@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v4 2/2] irqchip: gic-v3: only select HAVE_ARM_SMCCC_DISCOVERY on arm64
Date: Tue, 20 Oct 2026 23:28:17 +0100
Message-ID: <20261020222817.1231643-3-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020222817.1231643-1-julianbraha@gmail.com>
References: <20261020222817.1231643-1-julianbraha@gmail.com>
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

ARM_PSCI_FW is always enabled for arm64, and the GICv3 driver only
uses HAVE_ARM_SMCCC_DISCOVERY to identify the NVIDIA T241, which is
arm64 anyway.

For ARM_GIC_V3, let's only select HAVE_ARM_SMCCC_DISCOVERY on arm64.

Fixes: 35727af2b15d ("irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
---
Changes since v3:
- reorder patches to prevent build failure for 32bit ARM without PSCI

Link to v3:
https://lore.kernel.org/all/20261014123539.2259230-1-julianbraha@gmail.com/

Changes since v2:
- split out changes into two patches

Link to v2:
https://lore.kernel.org/all/20260823180832.1246363-1-julianbraha@gmail.com/

Changes since v1:
- remove select and dependency on ARM_PSCI_FW,
- make the HAVE_ARM_SMCCC_DISCOVERY 'select' conditional on arm64

Link to v1: https://lore.kernel.org/all/20260801212235.2692694-1-julianbraha@gmail.com/
---
 drivers/irqchip/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 136bab41f801..ca915fca0ef5 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -37,7 +37,7 @@ config ARM_GIC_V3
 	bool
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
-	select HAVE_ARM_SMCCC_DISCOVERY
+	select HAVE_ARM_SMCCC_DISCOVERY if ARM64
 	select IRQ_MSI_IOMMU
 
 config ARM_GIC_ITS_PARENT
-- 
2.55.0

