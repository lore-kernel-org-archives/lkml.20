Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793345817;
	b=dQbSpM9yrE2ekBM5+Qpske7iE33bWy1vmarC6CVUntwtHeX7tXWH+ZFCdBLnvffcJczd
	 GB5dNvVZszE6BYLrmHZqzG8yfdAHRUGNcSR9c8Vf0vYbTgPdtKgzx/hjWbb/eLCKgASkO
	 HwZ9Pos13vQb/KEIwNi8B1KiMMktpG6H0ADgsXTvB9+pgcLgDF+dEOJ8k6kO8Y3cZfS8F
	 NCm9OQIfdXPpOptR/Mgkc2fNTFfPYv8FMCpdxOLLEp81ODj38iSkPShlIHVV1e4XtM1eC
	 6N682QIFi5sdNK+vMz6wqHJpNSkvBH0aCAFHHveACdw0uKDPFve00KgCJt3Qua541Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=rMrhFGMaQbGuT+vysC+EnDo30wy5e48snLTrR+oGc/Y=;
	b=SdbI6eHOudauZDmcPNEukxy5eraMNCgoWIzju/esF7MfDNahRXk33kbxPwd7YMeeilvI
	 gViFLH//qIadOssMfZhBp3npn0xPpVTABuSiLxk6bCTNePqrysH4XLV2NdUQrmPnC0ur2
	 wWYCPZExNi56IV9qNzgWMATeJwsQ7uKiREBEJ1689tq/Bnptx7oRxkc9WDX6DZlUonm1u
	 +PSo6JmMNJvadllm/EdxY/Dx+UuVzh9C8SsUJgaZ+4ir4xM+4q4f7O8BAw4OLXWUHXo5X
	 LqjxO0lKJB7XjKavPQ6twZ6en+wCeZDs678/Vm9Efdvbq7Pbulo+Y9NuVfz63YPx+Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SBaeWEAV;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B2F606A327
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2B2F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SBaeWEAV
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so2290455e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793345815; x=1793950615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rMrhFGMaQbGuT+vysC+EnDo30wy5e48snLTrR+oGc/Y=;
        b=SBaeWEAV1WqnHA3sFFlwCnAkHQGY7W86ZDX0toJdiEp0Q9ABgjW8dZ2iYd2RqQU+l3
         YlzyHWUIXYj1xOhQpYuJ0Wrskk91Jpd2MnucskMKoRCt0gLPl7odPhMySRoWeE0ek083
         3QZ3PUr+4Skt33VqeiwVNYZVbXqnCDOtOAz1mKKVIKE+Qf/+8RcHFDL0JTQlyhSf/k1r
         5L8CD7lBi7dXgnUmf/za8K52SycqTQZvbDuJ5sV/xFYAMQOCbcH7wZ9+xtdUuAFK0Cax
         lcSIFpieBGIK2lmzMxJ6+wowxN/B09REkfpdJNs0TM69ikkOZYD5Kfd+lkxixL3ymBM/
         iodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345815; x=1793950615;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rMrhFGMaQbGuT+vysC+EnDo30wy5e48snLTrR+oGc/Y=;
        b=VVulCxZhfZhSyaA1G20fagMF7hoWm03xT7Hd7kFCzKJMGFQNTfBDTWQSwz9YCIZB7i
         3c2Jw0/mTotM1+l9SpN0ZkNjgtc7qqSPoNdD+R7PkAOVhaiNFkxuYjtuIBg1iZZno5Hw
         1RddacVHYdDlADjSfdRfX6Ltl0XeplwHYdnMDzzAExacGJkMnLQONxNidTfYtI59kAKp
         4c+D2mv9EYqbsTusOvmvNKWrRGAgSKpZc8smLSqWT6FXXxd/B9qeCy6G6ssVR/P4RAcO
         87jUPwZX2ptATLKC7A9I8d/HHTjRMO0RH0NFHvPPs64cIgf8GlfdBpmsq0B2MRy/nlHR
         vaBg==
X-Forwarded-Encrypted: i=1; AKwUvBw8r2yamyeJ2vGhuXaXbBa6XZkz8TpaaRe+kGy3GWfy2YREYPUZXB8G/VXBAXJAg9r1pC+jUb7iqeV0xT8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeONKDb+hHswSc37hev1QoA+PH9eRxaXEJPQzZkmXSKOmKkXxt
	78dx4lumbeSrY+HJaGcH5hzJ+FLnxIeDbKeipeW8d23yQ9uToxKBy/AXYJAzAi1Q43I=
X-Gm-Gg: AYBFou1Ejg7Bft4adIyxOAUlsW3T4EM4BiWOImiBba4brfkl5VycD3HQC8N5nSb4rWb
	xt+NglAOZb0unC7aDV4S/q08dMyNB/P2QLhdlZAuoQLiUZWOepaBl9mWTghbrt157SK6ouRaNA5
	XcK58Vm47FSL/oEQNjB3qEEt/qYVtAX5ggBSOIL+KvBWKCQ5eerBl5ro0ExefAUHnm0Sc9Cs4qm
	VvxHK5ZGM/W8+bVc7eVcj+tB6a3xrlSRpgktNcPk8a5nzkitYni2OeWgffUEOAfYMo1kFcZ8mFl
	XwMz69xUE6poUYy0+6t2tOmhnjwxuXk8+JVSyEBm8E7HOzMXM6fo371eavQrY7BhTeeGbRMppzn
	26+ZYVN9qPsKyb9Ivu/iS1wk3yFqE4qb7kpVW4PFjh/0Rwpw6r71ndgnHXV3wHdYhKht8CJKMxO
	bAUbgL9PjYhnWT/JxzhStNE6lOaFNsj9Lk0S7agm1yR8vyA0baRCiZVjfTy++c/HU6q/jQffy2h
	EDgl9yiw//uKxa8S5fPV8VyzcafHMi8N7So7fm9Um3dUVrDtkywM7kQH1GzINZw2m04WBGuIzhs
	ffYUbLTpYwVUf5XkEewojMz12a7lt0qGbIc=
X-Received: by 2002:a05:600c:19d1:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4ac1970b9f7mr28877715e9.34.1793345815331;
        Fri, 30 Oct 2026 00:36:55 -0700 (PDT)
Received: from thinkpad.hgw.local ([159.146.110.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80306sm1884497f8f.33.2026.10.30.00.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:36:54 -0700 (PDT)
From: =?UTF-8?q?Yal=C3=A7=C4=B1n=20Can?= <ylcncn@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: rockchip: rk3066: set soc_remap before starting secondary cores
Date: Fri, 30 Oct 2026 10:36:47 +0300
Message-ID: <20261030073647.164416-1-ylcncn@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A Cortex-A9 core on the rk3066 starts at address 0 when it is powered up.
The SMP code copies a trampoline to the start of the internal sram and
relies on GRF_SOC_CON0 soc_remap (bit 12) mapping the sram at address 0.
The vendor loader sets that bit before starting the kernel, but a boot
loader started directly by the bootrom leaves it cleared. The core then
runs the bootrom instead, which parks it and also writes into the start of
the sram, so the trampoline's target word is overwritten as well, and the
boot logs "CPU1: failed to come online".

Set soc_remap after the secondary cores have been powered down and before
the trampoline is copied. The rk3188 shares these smp operations; its grf
has a different compatible and is left alone.

Tested on an RK3066a board (MK808B) with U-Boot started from the NAND ID
blocks by the bootrom: before, CPU1 never came online (GRF_SOC_CON0 bit 12
clear, sram+4 read 0x00000001 instead of the physical address of
secondary_startup); with this patch both cores come up at boot, three
offline/online cycles of cpu1 work, and the board restarts normally after
a reboot and after a forced panic. Booting through the vendor loader, which
already sets the bit, is unchanged. Not tested on rk3188.

Fixes: a7a2b3118b41 ("ARM: rockchip: add smp bringup code")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yalçın Can <ylcncn@gmail.com>
---
 arch/arm/mach-rockchip/platsmp.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/mach-rockchip/platsmp.c b/arch/arm/mach-rockchip/platsmp.c
index f659d894b..2edd0fa46 100644
--- a/arch/arm/mach-rockchip/platsmp.c
+++ b/arch/arm/mach-rockchip/platsmp.c
@@ -198,6 +198,29 @@ static int __init rockchip_smp_prepare_sram(struct device_node *node)
 	return 0;
 }
 
+#define RK3066_GRF_SOC_CON0	0x150
+#define RK3066_SOC_REMAP	BIT(12)
+
+/*
+ * A starting core fetches its first instruction from address 0. Only with
+ * soc_remap set is that the on-chip sram holding the trampoline; otherwise it
+ * is the bootrom, which parks the core and writes into the start of the sram.
+ * The vendor loader sets the remap, other loaders (e.g. U-Boot started from
+ * the bootrom) leave it cleared. The secondary cores are powered down here.
+ * Only the rk3066 is handled; other socs using these smp ops are left alone.
+ */
+static void __init rockchip_smp_remap_sram(void)
+{
+	struct regmap *grf;
+
+	grf = syscon_regmap_lookup_by_compatible("rockchip,rk3066-grf");
+	if (IS_ERR(grf))
+		return;
+
+	regmap_write(grf, RK3066_GRF_SOC_CON0,
+		     RK3066_SOC_REMAP | (RK3066_SOC_REMAP << 16));
+}
+
 static const struct regmap_config rockchip_pmu_regmap_config = {
 	.name = "rockchip-pmu",
 	.reg_bits = 32,
@@ -321,6 +344,8 @@ static void __init rockchip_smp_prepare_cpus(unsigned int max_cpus)
 		pmu_set_power_domain(0 + i, false);
 
 	if (read_cpuid_part() == ARM_CPU_PART_CORTEX_A9) {
+		rockchip_smp_remap_sram();
+
 		if (rockchip_smp_prepare_sram(node)) {
 			of_node_put(node);
 			return;
-- 
2.47.3

