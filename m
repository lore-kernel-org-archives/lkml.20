Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794456120;
	b=ZZTGke2lJmegzYrY6jk7b+eIyfgymBr5fFmcu5W6r4/oMW35TPdBTUDeTuVo+r+7GsYF
	 4LuRSoHOOYqkSirLqBw7jh9DgoNoMvVnM03HpH0kTL9EEcumG0zJXaausP6Lwm4OMlnQA
	 Tl8kc3hXZ9yK5sH9Au3egjCkiNXpi9KD2NIEyO9/FJspgmkxu/XFrIMh2QARD9ovAr7nE
	 Xaj+m8FSFDptOcasgg+U6VOBJrHTHKT0TPDZNqAsfpIpLd5NJ399r3uZgzYOPGkH7u2Tr
	 zCizzkori6iyoB+DhGRb8UgsuB4En4mgSaqCia+qnyI59EPcQ0J9H6vJlmzW3uOTXDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794456120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=N2LLM4DBtKMrmpo5mqaQsURV/pMMXl4CIcJIhacgRMA=;
	b=xoNGBKkfgqdDQFfdpGIP68IQ3UNHqXzu76u25Dw/MDJqAB3Manu2cMUJWa8Hk7ARX+m5
	 nnO4e4bF4RwL+O1RF+IunhpYc/xCWH6nep+hb0NzNkqH8a5Md5H/dCvgPZp2phmvz2m0t
	 a5f7+r42lZtTZnFq43uFnXuovmvchHfjJ2sJsdStTZ+P+eRDVUuEGgmF4EOK92+l0z/Rp
	 efIwiSLS+k6r79X1Y2SuzewhmKfEWXowv0+PwTi7VVCGEDxpSio3IHOaeNq84iVAeaCW9
	 KYmJeucL5iB5HMrlDssnyA+khaDrpsslXFRmtFpo3auJfGYZmikQ2e25mg1tlC+vT4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dankook.ac.kr;
	spf=pass smtp.mailfrom=dankook.ac.kr;
	dkim=pass header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=p6rzSpGT;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4340A606A336
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4340A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=p6rzSpGT
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b354d27917so34286337b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dankook-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794456119; x=1795060919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2LLM4DBtKMrmpo5mqaQsURV/pMMXl4CIcJIhacgRMA=;
        b=p6rzSpGTWjDKZ5kW7CKjycwevukvA1AatisbmTOSXHIfaxwHXooaIOzxVqinLZoHUg
         Z/m0bvPwkvrTrngcSjB15O7QToMN/D+DfVedWOdvADX/uuVQgRsKiIXuL+8vzcV7QVL+
         w0qgkHsh7nrWVkhL4d5GOVs+Q5x6kufe48ag2l8iavzrGmDl/4lDupGl98UJ8NdP4IG+
         QC7lz2Rv3NhE9HJkX2bF3jlQsziOy1I4lMefS4AnJigxUwMwOSioDPApyvVEjACETMQN
         kQYfwX+EpT3iRr0HYViFCCzJYeKQiSbWnzOWpnLpFPSubuOkhjMrbMum6nmrfmMbS6n5
         Lacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794456119; x=1795060919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N2LLM4DBtKMrmpo5mqaQsURV/pMMXl4CIcJIhacgRMA=;
        b=niwKqQBiGAZ8cC+o4H91FtKDPdpNNVZl62+bvmzL+qxpuASlQrnY58T2PfFK4qw/wN
         IziexpAgVaXxAZPnSmbX1lrabB/JT99SPtW6Xf7t/SOa43NP4EbkLvDEUR+SaqBvNXz/
         BRIsbmyUnqTn5CIatnsQlmp5RT/u4pHLS05rvmRKN30mN3n8lqE9CcPoLhCq66yvHwOK
         0VgF4a4j87Jsu4p+mdLCtluCVLFKdWo1Mq6W/XBkwmNVxUR1hzf2pr2fkod+yNQH5l1d
         yJJL2H8gWHd0dWc9goFVJTzhTVDUg046Jh9X3sSQNLNCjuo/m6XeNied5Xlsz5KC8Cjq
         Ntaw==
X-Forwarded-Encrypted: i=1; AL+hErGCe1wBKkWm0uzmKz3ZJ4FTRFrB7Pmo9gWfYqI+uOTJEEOle/BPp6W2ok22rT1RKkN6GIv0Utb1rF3AA3U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AVJHWqWQqhU39McgP0dGDvoJhIZGSecphaEyBuM9Fq6D/P+bl
	44UfkpKe4PqfVydMTrw0NjWjCH+LRyoSSgf9ikLTFNHfK49cQddX/W2srTY0LBZgqf4=
X-Gm-Gg: AYBFou27vw9NhSNKpVbVVY8kcbRROwiVhln9BWF2DVImVJKtwi9eyIQLGIgvpUWFOKj
	X3QC/i3bdGr/Tga7maplo0/ifLrQwvZkdUjwoSHUb2ogwnpGUmQH39wnqfmsLyEMB79nFuklKyW
	LMH/S4ITFpQfOL8odDMu0KTS8Rfe69amkG+bTtVO/D7CKdSd0wDMf0ptbE9Aewbc2U5cO60/Du1
	aOD83RQTBK9/P6Ea3G4k9AbQbz4ceAN6s/UIMc13MxCpYNYLlNwfbS0tzGeW3mOCprrn6OlJWZi
	VntjLK+zlqFgNloWVnOdfMZ4aOjQuBiLpF1RdajM7vAad3OQmZID2tAqcV9zWyBM5EzWHicNCcu
	TLFLHS37+OCt7l3fujO1aT98BnAJUkIeUo+DT1axO61eLY7GplHzJtWOh1CVVl3nrF97Og1fPM9
	r90carflwMWIFqsPFSgPZhmwDSDyHXE2V663eIkqMIHD17kXTtIo4mnvgm2XFn0WXX9j8ve90t3
	TtV/LvEDYstT5mdjr4PVqZZLeN7a8LLRmgIcBP0HlnW5qguIVLS5AH2hENBhDgIADXAJ5cqpF9q
	bVdDxLQ4ISJhoglSrSHxx6rqy9t92ZquCZVuSLpd2urqWg==
X-Received: by 2002:a05:690e:4196:b0:675:6228:2fdd with SMTP id 956f58d0204a3-67c67c9274amr3017796d50.4.1794456119201;
        Wed, 11 Nov 2026 20:01:59 -0800 (PST)
Received: from myarch ([220.149.255.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589cf1fcsm6209654d50.13.2026.11.11.20.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:01:58 -0800 (PST)
From: fixca <jaehoon1744@dankook.ac.kr>
X-Google-Original-From: fixca <jaehoon1744@gmail.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org,
	Vijendar.Mukunda@amd.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	JaeHoon Kim <jaehoon1744@dankook.ac.kr>
Subject: [PATCH RFC 1/1] ASoC: rt1320: Use the BIOS init values on LG gram 16Z95U
Date: Thu, 12 Nov 2026 13:01:43 +0900
Message-ID: <20261112040143.6945-2-jaehoon1744@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112040143.6945-1-jaehoon1744@gmail.com>
References: <20261111013953.4011-1-jaehoon1744@gmail.com>
 <20261112040143.6945-1-jaehoon1744@gmail.com>
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

From: JaeHoon Kim <jaehoon1744@dankook.ac.kr>

On the LG gram 16 (16Z95U, AMD ACP 7.2, SSID 1854:056c) the RT1320
speaker amplifier on SoundWire link 1 accepts the playback stream
without any error but stays completely silent with
rt1320_vc_blind_write[], even at 0 dB.

The BIOS describes a board specific "mipi-sdca-function-initialization-table"
for the SmartAmp function (SW23, function 4, 5627 writes). It follows
the same sequence as rt1320_vc_blind_write[] but differs in about 50
registers: clock setup (0xc5c2-0xc5d0), 0xc050-0xc063, 0xc582, 0xc60b,
0xc682, 0xdc20, 0xcd00, 0xcf02, 0xc900/0xc901, 0xce1b-0xce44,
0xd471/0xd479, the L/R mapping in 0x1000db15-0x1000db23 (swapped
compared to the driver) and the final 0xdb00-0xdb1b values.

Use that sequence on this machine, without the table's bulk areas
(0xe000-0xe7ff, 0x10007000-, 0x1000d000-, 0x2000xxxx). The MCU patch is
still loaded from linux-firmware at 0x3fc2bf83, and registers the table
does not touch but rt1320_vc_blind_write[] does are kept.

With this change the internal speakers work: normal music playback at
0 dB amplifier gain and 50% system volume, correct left/right, no
distortion or noticeable heating.

Not intended for merging as is: it changes ~50 registers at once and I
do not know which of them are actually required. DSP firmware / RAE
files are still not loaded on this machine.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: JaeHoon Kim <jaehoon1744@dankook.ac.kr>
---
 sound/soc/codecs/rt1320-sdw.c | 214 +++++++++++++++++++++++++++++++++-
 1 file changed, 210 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 42acb6c..14d07c6 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -1805,15 +1805,221 @@ static void rt1320_load_dspfw_work(struct work_struct *work)
 	rt1320_dspfw_load_code(rt1320);
 }
 
+/*
+ * LG gram 16 16Z95U: the BIOS provides a board specific SDCA function
+ * initialization table for the RT1320 SmartAmp (SW23 AF04). This is that
+ * table without its bulk RAM/patch areas (0xe000-0xe7ff, 0x10007000-,
+ * 0x1000d000-, 0x2000xxxx); the MCU patch is still loaded from
+ * linux-firmware at 0x3fc2bf83 as in rt1320_vc_blind_write[]. Registers
+ * that the table does not touch but rt1320_vc_blind_write[] does are kept
+ * and marked "drv".
+ */
+static const struct reg_sequence rt1320_vc_lg_16z95u_blind_write[] = {
+	{ 0xc003, 0xe0 },
+	{ 0xe80a, 0x01 },
+	{ 0xc01b, 0xfc },
+	{ 0xc5c3, 0xf2 },
+	{ 0xc5c2, 0x00 },
+	{ 0xc5c6, 0x10 },
+	{ 0xc5c4, 0x12 },
+	{ 0xc5c8, 0x03 },
+	{ 0xc5d8, 0x0a },
+	{ 0xc5d0, 0x09 },
+	{ 0xc5d1, 0x89 },
+	{ 0xdc20, 0x30 },
+	{ 0xc582, 0x01 },
+	{ 0xc60b, 0xb1 },
+	{ 0xc682, 0x60 },
+	{ 0xc057, 0x51 },
+	{ 0xc054, 0x35 },
+	{ 0xc053, 0x55 },
+	{ 0xc052, 0x55 },
+	{ 0xc051, 0x13 },
+	{ 0xc050, 0x15 },
+	{ 0xc060, 0x99 },
+	{ 0xc061, 0x55 },
+	{ 0xc063, 0x55 },
+	{ 0xc065, 0xa5 },
+	{ 0xc06b, 0x0a },
+	{ 0xca05, 0xd6 },
+	{ 0xca07, 0x07 },
+	{ 0xca25, 0xd6 },
+	{ 0xca27, 0x07 },
+	{ 0xcd00, 0x05 },
+	{ 0xcf02, 0x0f },
+	{ 0xc604, 0x40 },
+	{ 0xc609, 0x40 },
+	{ 0xc046, 0xff },
+	{ 0xc045, 0xff },
+	{ 0xc044, 0xff },
+	{ 0xc043, 0xff },
+	{ 0xc042, 0xff },
+	{ 0xc041, 0x7f },
+	{ 0xc040, 0xff },
+	{ 0xcc10, 0x01 },
+	{ 0xc700, 0xf0 },
+	{ 0xc701, 0x13 },
+	{ 0xc901, 0x09 },
+	{ 0xc900, 0xd0 },
+	{ 0xce44, 0x1c },
+	{ 0xce1b, 0x88 },
+	{ 0xce31, 0x0d },
+	{ 0xce30, 0xae },
+	{ 0xce37, 0x0b },
+	{ 0xce36, 0xd2 },
+	{ 0xce39, 0x04 },
+	{ 0xce38, 0x80 },
+	{ 0xce3f, 0x00 },
+	{ 0xce3e, 0x00 },
+	{ 0xde03, 0x05 },
+	{ 0xc570, 0x08 },
+	{ 0xc086, 0x02 },
+	{ 0xc085, 0x7f },
+	{ 0xc084, 0x00 },
+	{ 0xc081, 0xfe },
+	{ 0xf084, 0x0f },
+	{ 0xf083, 0xff },
+	{ 0xf082, 0xff },
+	{ 0xf081, 0xff },
+	{ 0xf080, 0xff },
+	{ 0xe801, 0x01 },
+	{ 0xe802, 0xf8 },
+	{ 0xe803, 0xbe },
+	{ 0xc003, 0xc0 },
+	{ 0xd470, 0xec },
+	{ 0xd471, 0xba },
+	{ 0xd474, 0x11 },
+	{ 0xd475, 0x32 },
+	{ 0xd478, 0xff },
+	{ 0xd479, 0x40 },
+	{ 0xd47a, 0x10 },
+	{ 0xd47c, 0xff },	/* drv */
+	{ 0xc019, 0x10 },
+	{ 0xd487, 0x0b },
+	{ 0xd487, 0x3b },
+	{ 0xd486, 0xc3 },
+	{ 0xc598, 0x04 },	/* drv */
+	{ 0xd500, 0x00 },	/* drv */
+	{ 0xd500, 0x17 },	/* drv */
+	{ 0xd600, 0x01 },	/* drv */
+	{ 0xd601, 0x02 },	/* drv */
+	{ 0xd602, 0x03 },	/* drv */
+	{ 0xd603, 0x04 },	/* drv */
+	{ 0xd64c, 0x03 },	/* drv */
+	{ 0xd64d, 0x03 },	/* drv */
+	{ 0xd64e, 0x03 },	/* drv */
+	{ 0xd64f, 0x03 },	/* drv */
+	{ 0xd650, 0x03 },	/* drv */
+	{ 0xd651, 0x03 },	/* drv */
+	{ 0xd652, 0x03 },	/* drv */
+	{ 0xd610, 0x01 },	/* drv */
+	{ 0xd608, 0x03 },	/* drv */
+	{ 0xd609, 0x00 },	/* drv */
+	{ 0x3fc2bf83, 0x00 },
+	{ 0x3fc2bf82, 0x00 },
+	{ 0x3fc2bf81, 0x00 },
+	{ 0x3fc2bf80, 0x00 },
+	{ 0x3fc2bfc7, 0x00 },
+	{ 0x3fc2bfc6, 0x00 },
+	{ 0x3fc2bfc5, 0x00 },
+	{ 0x3fc2bfc4, 0x00 },
+	{ 0x3fc2bfc3, 0x00 },
+	{ 0x3fc2bfc2, 0x00 },
+	{ 0x3fc2bfc1, 0x00 },
+	{ 0x3fc2bfc0, 0x07 },
+	{ 0x1000cc46, 0x00 },
+	{ 0xd486, 0x43 },
+	{ 0x1000db00, 0x07 },
+	{ 0x1000db01, 0x00 },
+	{ 0x1000db02, 0x11 },
+	{ 0x1000db03, 0x00 },
+	{ 0x1000db04, 0x00 },
+	{ 0x1000db05, 0x82 },
+	{ 0x1000db06, 0x04 },
+	{ 0x1000db07, 0xf1 },
+	{ 0x1000db08, 0x00 },
+	{ 0x1000db09, 0x00 },
+	{ 0x1000db0a, 0x40 },
+	{ 0x1000db0b, 0x02 },
+	{ 0x1000db0c, 0xf2 },
+	{ 0x1000db0d, 0x00 },
+	{ 0x1000db0e, 0x00 },
+	{ 0x1000db0f, 0xe0 },
+	{ 0x1000db10, 0x00 },
+	{ 0x1000db11, 0x10 },
+	{ 0x1000db12, 0x00 },
+	{ 0x1000db13, 0x00 },
+	{ 0x1000db14, 0x45 },
+	{ 0x1000db15, 0x12 },
+	{ 0x1000db16, 0x09 },
+	{ 0x1000db17, 0x00 },
+	{ 0x1000db18, 0x00 },
+	{ 0x1000db19, 0x00 },
+	{ 0x1000db1a, 0x13 },
+	{ 0x1000db1b, 0x09 },
+	{ 0x1000db1c, 0x00 },
+	{ 0x1000db1d, 0x00 },
+	{ 0x1000db1e, 0x00 },
+	{ 0x1000db1f, 0x0d },
+	{ 0x1000db20, 0x01 },
+	{ 0x1000db21, 0x00 },
+	{ 0x1000db22, 0x00 },
+	{ 0x1000db23, 0xbf },
+	{ 0xd540, 0x21 },
+	{ 0xc5c3, 0xf2 },
+	{ 0xc5c8, 0x03 },
+	{ 0xd471, 0xba },
+	{ 0xdd0b, 0x0d },
+	{ 0xdd0a, 0xff },
+	{ 0xdd09, 0x0d },
+	{ 0xdd08, 0xff },
+	{ 0xdb03, 0xf0 },
+	{ 0xdb08, 0xe7 },
+	{ 0xdb09, 0x00 },
+	{ 0xdb19, 0x02 },
+	{ 0xdb02, 0x73 },
+	{ 0xdb01, 0x00 },
+	{ 0xdb04, 0x00 },
+	{ 0xdb07, 0x00 },
+	{ 0xdb00, 0x00 },
+	{ 0xdb05, 0x00 },
+	{ 0xdb06, 0x00 },
+	{ 0xdb1a, 0x00 },
+	{ 0xdb1b, 0x00 },
+	{ 0xc5f7, 0x22 },	/* drv */
+	{ 0xc5f6, 0x22 },	/* drv */
+	{ 0xd172, 0x2a },	/* drv */
+	{ 0xc5d6, 0x01 },	/* drv */
+};
+
+static const struct dmi_system_id rt1320_lg_16z95u_dmi[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
+		},
+	},
+	{}
+};
+
 static void rt1320_vc_preset(struct rt1320_sdw_priv *rt1320)
 {
 	struct sdw_slave *slave = rt1320->sdw_slave;
+	const struct reg_sequence *seq = rt1320_vc_blind_write;
+	unsigned int num = ARRAY_SIZE(rt1320_vc_blind_write);
 	unsigned int i, reg, val, delay, retry, tmp;
 
-	for (i = 0; i < ARRAY_SIZE(rt1320_vc_blind_write); i++) {
-		reg = rt1320_vc_blind_write[i].reg;
-		val = rt1320_vc_blind_write[i].def;
-		delay = rt1320_vc_blind_write[i].delay_us;
+	if (dmi_check_system(rt1320_lg_16z95u_dmi)) {
+		seq = rt1320_vc_lg_16z95u_blind_write;
+		num = ARRAY_SIZE(rt1320_vc_lg_16z95u_blind_write);
+		dev_info(&slave->dev, "%s: using LG 16Z95U init sequence (%u writes)\n",
+			 __func__, num);
+	}
+
+	for (i = 0; i < num; i++) {
+		reg = seq[i].reg;
+		val = seq[i].def;
+		delay = seq[i].delay_us;
 
 		if (reg == 0x3fc2bf83)
 			rt1320_load_mcu_patch(rt1320);
-- 
2.43.0

