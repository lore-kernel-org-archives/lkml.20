Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792896323;
	b=QYeuqEkE506HN+VzWKqx3gp9s+83+RYtW6rkXaoA9FlENpVWgCVV7RDj7W/epEsiPfoj
	 TGuXfao2is6e1NNVvqEq5w2XKzC7pst6uvA3VQXfmC3xFSpBTtjuulpreAwC830bs5Dif
	 ua2lpI6QW77Z6Jicpji97SfPo8mc4r6FW+iMInU3WAhNBBWBwPe8dlwsPN01+keHOynxL
	 TVK45PIPB/OnDTA7wjO4h2JuhNDwWL++IBb1qM+Z7dJfDDRU6BgCWmQuwFLwTdg/NZXxV
	 hd3Bkn3deIi9OpqJeqBfPPyxjefgQ9DBpWOSvmoQ9kwtLz/4KDHP8Jjd7wSuyNRsh8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792896323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=WpjUZLKhw/tvYFR10QM0neivX8YIU0hqUruPnucpBLM=;
	b=YvDbV0D0w4cLwgaoBnEEW9Xa0r6nr8ADcQYQvWcxnHD8fb6NiXXN2Yw1fB0QpERK/E5x
	 hA/Mrc2+b8THoCGE5nMcmYIezz42g9dKOERC4tbqXpX8Yag3hkh5yCJ/A0Q6iCFZq+aeo
	 T+6yZ7iLnrxoPofcSbexaLQmQSj2EhskCpRpRdNja+H7ouq1ybp9cav6s7WvGhtRyWhT0
	 CTz2i7O0wuAgqFBsoPGFSbGg+mod/0Q9lhR+7Ot29EClgRTfI0FHMqn9THtfzhIqOARcP
	 aWq8DHn4p7F7+FCwB0vhyOO8lbsXixOZOI8J68zwdmCctcyZw0X/NxeXKP5cVLCeogw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=UH3J3HMQ;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C321606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C321606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=UH3J3HMQ
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35f036b17easo4765873eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1792896321; x=1793501121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WpjUZLKhw/tvYFR10QM0neivX8YIU0hqUruPnucpBLM=;
        b=UH3J3HMQv99pAPAW9zP0r0Dle71wXTqYA9LOtYNu0eUbeqCEGlT8pKDCXzawBl7P5G
         IvcwqAEAosh51YDiFpDB0St7pHDQVo97VhQBGwz6HxRmphyNwdD1fIeFs25qAYqt1hgb
         QoY/41OqHxEt82dTDER6IvhEGxwcXxbHJGrwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792896321; x=1793501121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WpjUZLKhw/tvYFR10QM0neivX8YIU0hqUruPnucpBLM=;
        b=ylWn20ZAPb/AGrxLFOXxxMRvpduWh+FdbTfmz4SCdpgQqfWrXk7MPQf7gX57eqFPK2
         wQUvVNRLqyFaY/RSe30XMVAqJGZ4PLBkRByGzkN1iGgW9lIPdukMmOsE2iI8xsYRu6OH
         op3T1f9cStjyJ1QZ1OpxzdpLXKWZ1+HbjM7ukdM1Jo6oZk3Ucy/3BjT/zPUyyCW/KdQV
         WaFU+uhW76pCXGIR0vY4m/xz52pfyibQuxMTEkdNGdEQaRLFrOzN/Qjry6Q/oOV9Cqf1
         UhYJC1F/lpgKNHKy8aYnHBOwyjIty7Sn5zmv1rvM9wmyH6oiMgpg5Z/pqugSkRc/sBak
         BsQA==
X-Gm-Message-State: AFq9FYLsImzURjIYv0ONAjHFoDhhy3itY+QXam95H43ORttxIa8SRBRl
	K9G2kxK1I1BBKK0BqjuCpxxOUx+kTxMyRyO36K7+JQgykju9TNMtcx9sKo3zlDDVZv4=
X-Gm-Gg: AYBFou3QEzPHxWunSfhbdnM4GLJJuvX2JM3dDIAOB9GCmbQoXBPOyR9uW6mHaO9geu6
	Z7UzhRcB7VONUy33w8WK1KsREIKZza5/B1wZlaIcPGVk2yIWyd2ori3LatIv//vO5F1iAzSS3il
	IHcnHsPR0aNYKWy49Hp4oI2W4c9vEtvyHgBkKoMQEg1RtkDthJmQQtBL0++PShH/TCSu3T/J2VO
	P0NWyEIJ0iI7scP3HdEm0GEOhqyJXcIJ45OXQadYL/1QRl1yn4tLlgEJlBJCHpm0IeeEA2K4pi0
	VDMZO9dgR9t/V7gp3ZQGMHil5v9BrtyfuLLzsW/5PCjnk9joMf8iToPqAv7kgl5f66oAoFXyT4B
	JHoALd5BBI5RmIICDYxwBU4JWXnRbaC6BTJfRickRDqvurG1TDtV8Hroyvsnp9GqfyaE1oDTCxn
	iYfw8/S/w+TttonUHnhJr9KT29gwmG+Tzp3BtNSHJ0run5e7gTj5MG6dEaCgV/sFoXbRr5lkMS5
	P/LPH64UaXxUISBNcKkNaG/pPV3jmF788K6JvldaLLC6UV1PKVr21Qv1WhrXAPvKuxIrD4pry9i
	1IBzinSFQeok5lRvY64=
X-Received: by 2002:a05:7300:2442:b0:358:2e30:8e5 with SMTP id 5a478bee46e88-369e836b382mr5953999eec.1.1792896320943;
        Sat, 24 Oct 2026 19:45:20 -0700 (PDT)
Received: from shiro (p1469046-ipxg00b01sizuokaden.shizuoka.ocn.ne.jp. [153.223.97.46])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm23813952eec.23.2026.10.24.19.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:45:20 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Daniel Palmer <daniel@0x0f.com>,
	Denis Ahrens <denis@h3q.com>
Subject: [PATCH] net: i825xx: 82596: use MMIO accessors for the MVME16x PORT/CA registers
Date: Sun, 25 Oct 2026 11:45:14 +0900
Message-ID: <20261025024514.802862-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
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

On the MVME16x the two port registers need to be written in order to latch
the correct 32bit value.

The way the code is currently written means that modern GCC can decide to
optimize the writes and break that latching.

Convert the MVME16x specific register accesses to use the proper io
accessors to restore the latching and make the driver functional again.

Reported-by: Denis Ahrens <denis@h3q.com>
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---

Denis emailed me with his fix for this issue which added volatile to
the struct members to stop the compiler getting too clever. This is
my version of the fix. Dennis, please test it actually works :).

Also, this driver is old and does need to be converted over to being
a platform driver etc. I have a set of patches to do this. I'd like
to just fix the driver first so it works again so the conversion to
a platform driver is working against a working driver.

 drivers/net/ethernet/i825xx/82596.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/i825xx/82596.c b/drivers/net/ethernet/i825xx/82596.c
index 773d7aa29ef5..bb8798b0d3ae 100644
--- a/drivers/net/ethernet/i825xx/82596.c
+++ b/drivers/net/ethernet/i825xx/82596.c
@@ -196,11 +196,10 @@ enum commands {
 #define TX_TIMEOUT	(HZ/20)
 
 
-struct i596_reg {
-	unsigned short porthi;
-	unsigned short portlo;
-	unsigned long ca;
-};
+/* MVME16x: the 82596 PORT and CA registers */
+#define MVME_I596_PORT_HI	0x00
+#define MVME_I596_PORT_LO	0x02
+#define MVME_I596_CA		0x04
 
 #define EOF		0x8000
 #define SIZE_MASK	0x3fff
@@ -375,7 +374,9 @@ static inline void CA(struct net_device *dev)
 {
 #ifdef ENABLE_MVME16x_NET
 	if (MACH_IS_MVME16x) {
-		((struct i596_reg *) dev->base_addr)->ca = 1;
+		void __iomem *regs = (void __iomem *)dev->base_addr;
+
+		__raw_writel(1, regs + MVME_I596_CA);
 	}
 #endif
 #ifdef ENABLE_BVME6000_NET
@@ -392,9 +393,15 @@ static inline void MPU_PORT(struct net_device *dev, int c, volatile void *x)
 {
 #ifdef ENABLE_MVME16x_NET
 	if (MACH_IS_MVME16x) {
-		struct i596_reg *p = (struct i596_reg *) (dev->base_addr);
-		p->porthi = ((c) | (u32) (x)) & 0xffff;
-		p->portlo = ((c) | (u32) (x)) >> 16;
+		void __iomem *regs = (void __iomem *)dev->base_addr;
+		u32 v = (u32)c | (u32)x;
+
+		/*
+		 * The 32bit value is latched on the write of the lo register,
+		 * so the 16bit writes must happen in this order.
+		 */
+		__raw_writew(v & 0xffff, regs + MVME_I596_PORT_HI);
+		__raw_writew(v >> 16, regs + MVME_I596_PORT_LO);
 	}
 #endif
 #ifdef ENABLE_BVME6000_NET
-- 
2.55.0

