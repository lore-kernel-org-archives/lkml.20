Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080951;
	b=YdL76NxcZBnDdNQpPUFmzJlij+z5kzwqydLdTY9JLk+HVoJ7cVn0O+9eYbyJ4Z6vR6wz
	 ErpR47tWUfew0HRwXyYhbADXKyGZMCIwPGtrRZPfr2RcuvC2SNmESZ5X90yE+MzyaGDoj
	 pYJZViRU52WCBh8KuYqYovpPhMGK4TFV8eCzVYV+tHde258hKnI2cga/oI+uIUqXbq9Wl
	 QOg9ZLsDfNRRx6OaWIGBlqxIXV/OmFOSRSShoteHvgJPlWoFOklJt5XXoYsEB6aranTg8
	 INuOG7DsOzu+DgXKp+9R1UpWaChKOozlzRTjccXC1tWvoRG/80IX4G+fS5FUF+HtC2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ej1HgTe/KHrLI49Kdk60bqEOZh+J6lt5Sf/YAb1bqN0=;
	b=Yk+iorDTaq3oitcmagjsKg06QK+ILgGDJWGnGmF5JIPOTw9Vc6pB+hQTWo5RgYy/etWQ
	 3uwM+DRtzOJpDCkE1sdEF+NP3jMs1E2rIpZUrastFaVLIVb5U9ISDOWCe9SEIG/HVHWTl
	 0EtQ6kPiVozsPrx1da9zt1+gxW12OhoAuDw5mA63X4B/tSLkgxeaEM1dLMVZtTlX4X8sI
	 iNHMBV/gSg7q4Sc9kgEbocPpujUXpFxkNMp4nK5z5CRL6nkMQTMBJdRMfItxpQvIbkGrm
	 VUmAx+Va5Nu8LDipQcXgRNIDtP+68EH50G/P+DEeG7dGEp0axEir3yfr8lS2N3DrFvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W8y3TrE3;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577FB606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 577FB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W8y3TrE3
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso18299745e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793080949; x=1793685749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ej1HgTe/KHrLI49Kdk60bqEOZh+J6lt5Sf/YAb1bqN0=;
        b=W8y3TrE31cqe2qsF8kCxCq0+Jbdq2zr66wZCiOcKow35sZtPu/4uKjnkfQ2NkYkl8j
         3/zR6rpa9epY1pWY1xhl5CBYJsTe4TXvPheEwrXoaM1B9os/1eYBFt/On1lnzGtLrdRl
         KrD6aJq0WmcHAouPYZtl0+6Q77AJ6Wt2MSIHqvpiXGn1ug16gtU4lqTB6ijt6hVEFoY3
         P0Fp8plI6IuMjhswIOL6VjwsgvPR3dcobioA9KBZPXQhnpfs6wmt9F8J7P34WbBHgqFB
         5XE5dVV3cXPUrJ+m8a1F1kutjkR+tjY1v0KPu1ADg7PWfRGgypDUeJ8fmH095U5b0LrL
         EiKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080949; x=1793685749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ej1HgTe/KHrLI49Kdk60bqEOZh+J6lt5Sf/YAb1bqN0=;
        b=NwUEd0KfjRZzaVJQwdP9mAdcm/KQZys+mPbXZU8okOyY38iDkh/nv3RDaFNhD1c1a3
         SMvHvftX4VlIATVXJ4kdqnw3gcNg/hQSJnMpjdtvqwt54TFkXCJPVLwn+Cxzm9VAihsH
         0pUcJFY7/jhEcoBGgpE4GiTVVLKcCCQoPJfdGILTQgbjRnvbvMXWZFxqREe+xyOnJE0V
         9y2PhcToLRh+0maSaR760bmfVEuwBysIMKJjVRLcx8hiEJukjczBfnHAbTvL/H1vchKz
         3XAhT0uDjttky2woy8awyk/PBZywVgQD7ti6ARoUZkse93NRND1N0SBxYrnlcZzXEFGZ
         KSGA==
X-Forwarded-Encrypted: i=1; AKwUvBxJHCL++RBShvRfyEmh+UOZExD6L179K8v6Bt5wv9VmfO08URQn/U7YX2cp4YZA9NvsmFtgxwOs2ErbhAc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQHX07Dw6cK5GIg4by5zDMVlfBIbKpPPDHIsELqBnJvjnlHdGr
	brf4vZ6jdmck3ErvtFS1WRWGJhlZAMdcCZEwUOvaSZIGnbacoUKX8x7D
X-Gm-Gg: AYBFou1Hm75gur5yuM6RoA5Sw8BZ4F8BRafRfdlO+edRLxV6lbOo9HZSL/uvnTWpY4n
	siCDskP4UFt/D/Iy3lOy+w53qIxeax5ExZTheEgIxp7XkS+g/LXnARUij4fFyhw/+mjLG0Is6/X
	sEsk4vWrV0P7tAtTgW/Pz7lpcSc7HLO0wEd+hlbx0uQksRqhk71obfSSL4B09liL28ppKH+k9FY
	lCAgbNKvqjY3Dtupd3FX758W8PcBZDcJhCT1XYqTAPsW3EysrtduMsRtsM89uLYbBaTkb3KdoQ+
	74a6xhfe2UnBsd97zzhE/0lIc6h1lTHC2PT9AxiFliPyzbpEtSV8WqW4RLIeEzY7rXXQsOR+Oz2
	fOEURxCjAHbtMcHc66eKpc4tDpKeKKyFiatm+n31Z7fzEgBB5zGWAGlc+HFRGhpwvCMJVlSLA6A
	LboE2ZMkGmmyN+GS0bTeSaR8H8fiRbsVAUoYfd2LL2M7MY9U1Mvoz++xKiktsP90uEy6gwSAp0K
	orCizEhZJX7kkosfrGcR3GZT9WUhQXK9rTy60g5EEFhkwS86CxVwVL2tdXam9AWOlo/NuWs0Dvw
	keu/DdlAachyoOQyz9miyPVbskVkBqsu8jR+qiJOWCibxFNI1l847JBhCERuX7g9pIT7sl85LCn
	L8axc/XzHIH9kH0Z54vE=
X-Received: by 2002:a05:600c:8b62:b0:4a2:150f:1610 with SMTP id 5b1f17b1804b1-4a35acd5f91mr148820065e9.23.1793080948450;
        Mon, 26 Oct 2026 23:02:28 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb90dsm19124482f8f.22.2026.10.26.23.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:02:28 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: OCTEON: use the free memory below the kernel
Date: Tue, 27 Oct 2026 06:02:27 +0000
Message-ID: <20261027060227.2687979-1-orgads@gmail.com>
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
Content-Transfer-Encoding: 8bit

plat_mem_setup() asks bootmem only for memory above _end. The kernel
is loaded at 0x1100000, so whatever bootmem has free below _text is
never added to memblock. On a CN6335 board with the Cavium bootloader
that is 14MB, 0x200000-0xffffff:

  before: node 0: [mem 0x0000000001100000-0x0000000001cc6fff]
  after:  node 0: [mem 0x0000000000200000-0x0000000000ffffff]
          node 0: [mem 0x0000000001100000-0x0000000001cc6fff]

Claim it before the main loop, in 1MB pieces since the holes there are
small and unaligned. It counts towards max_memory like the rest, and a
piece inside the crash kernel range, which is added on its own, is
skipped as the main loop does. bootmem never hands out what the
bootloader reserved (the exception vectors, its named blocks, the
kernel image itself), so only free memory is claimed.

Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
Tested on mips-next with cavium_octeon_defconfig (KEXEC=y, CRASH_DUMP=n)
on a CN6335 board, 4GB, Cavium U-Boot 1.1.1: "Memory:" goes from
4023588K/4169492K to 4037924K/4183828K available. Built with KEXEC=n
and CRASH_DUMP=y as well.

 arch/mips/cavium-octeon/setup.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 7497be7b9431..2b1bc8fafac5 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -1022,6 +1022,27 @@ void __init plat_mem_setup(void)
 	 * which is handled by memblock
 	 */
 	cvmx_bootmem_lock();
+	/*
+	 * The loop below only takes memory above the kernel. Claim what
+	 * bootmem has free below it as well, 1MB at a time: the holes the
+	 * bootloader leaves there are small and not aligned to
+	 * mem_alloc_size.
+	 */
+	while (total < max_memory) {
+		memory = cvmx_bootmem_phy_alloc(0x100000, 0,
+						__pa_symbol(&_text),
+						0x100000,
+						CVMX_BOOTMEM_FLAG_NO_LOCKING);
+		if (memory < 0)
+			break;
+#ifdef CONFIG_KEXEC
+		/* The crash kernel range is already added */
+		if (memory < crashk_end && memory + 0x100000 > crashk_base)
+			continue;
+#endif
+		memblock_add(memory, 0x100000);
+		total += 0x100000;
+	}
 	while (total < max_memory) {
 		memory = cvmx_bootmem_phy_alloc(mem_alloc_size,
 						__pa_symbol(&_end), -1,
-- 
2.53.0

