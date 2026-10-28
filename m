Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186528;
	b=QD7plzGsefpj3GtkYLFT2q9fl+AgWR0owJLDtlij02x88DLBOtfnYQWhpwJTW5YrWM1U
	 LETIN+gAVA712KLNKnD4sEWkd3RaPcTVHHWh9ge6Vk2BFSn5mv3nhhWvIt54z7xCjb6DH
	 RjEE4rA5LFqLzSZoUEo7/PvWgDtpecysrE6g6C1WZetHd4UhL3c9wero4cP++SjWpvnRN
	 bhUbrNeiYMiK7J4B5f+zX9AF1AUb8zARhKHW3j0Q6HDHCiHxJkan0JTHop+r0rW3IP8dx
	 ajKWoAUmh9rgVAoPFGKK04Pi7d19uUPssOm7I4dhjyCOJNAEtCuS2ScWyutc1Dn+qrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N8wCDFeaIH13nv1WMwNEX03I4UQOkkD+G2yHtGzR8mA=;
	b=PlciZL20gOz48MN915QEumjkGgqE1t0d1mCd9ybhktPCW90bkRvPbmuBQ+ZwW25ENDJJ
	 oi9ha1ILGP/ZkdwMNU+4xmjq9FNPZwIIRo0tMmh+6Znr96tOGfe7o0E4+aqMWsrpxYLxM
	 iIBlU1dFO/qT4puKy93AaqdWTxowNZLeaPIFK3xTutx9MTKNNrLb8vq5XAbklYruE9Lrz
	 96SWha7amc3Dk1qM5HQRDBJ1JQF9gdcFlSdhdwa+/U6jxWd/ig88XwR9Q0ht5qLjtQYpP
	 JeaQv7O0mIRVq72Sr4Hsn32oNdLf5Q9Y7Hr8CYcvtPkbzdTWlU0ICjNn6ZV2Zd6MVJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NsnqZgcn;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CF0606A331
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3CF0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NsnqZgcn
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9deceda30so1037385ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186527; x=1793791327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8wCDFeaIH13nv1WMwNEX03I4UQOkkD+G2yHtGzR8mA=;
        b=NsnqZgcnIs/O85VX0kiYvYvBaYhjZHEKVg/xz6C26htcqQnQBX4HlhHBXLudG7DjtF
         cmSRsq68Jx/rAJJ8bHnanrZvyldTe9FlRqSspbThw/fmB4KcT6D3twIwHG5JjO+NPIvm
         eOziSkaKNxKPwbM/gINT8Z5w5zohaw5IAY2YokCnCcv4VsRg5VtjJNimS4S1CNdoaMeh
         aQKlMaV4XmyYIFrPyhfCJJ8q/LQepUIlV5mg+VSQeP8WN4JPZXRo55cvICZJgiiby9aV
         LMYDrHPiZjLvPAuOMXWyqAgJ5ltN4krMtX5JQwIOJHEzHMz49L5JcYm00ibT1w0h1bPP
         0hWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186527; x=1793791327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N8wCDFeaIH13nv1WMwNEX03I4UQOkkD+G2yHtGzR8mA=;
        b=F9q4NTD/8ChgZZSOLpJwbMOQlmScF1fQhUmUcLMAA8Fn8+fA2ISniCNRJx4SU/h9V5
         dY+rsFZmKCDQeDM55DZAS3FAFQb7KsEoHye2CY9jHSxPCwylcHq0QtgsMB1/Rc4/yYOA
         ckO43F8OZkTAOEzzDgOzB+wartHtSIEMNhpqaJ8nEUht2M0vitLNxvagHrK5Pwin6Ti6
         ipXc9UBe2IpJdDvc191MUmwdKuyp/oE4AA2Ttw7SU1lUPYK/wVejAgWLNFxouroNtfvU
         lvOrr9dfKgGcaBjf5rtgfpArN0lz5RuiiSOl3QbIJ2CJwryUkww8WYmB2nzWQsHUMj3s
         3Ugg==
X-Forwarded-Encrypted: i=1; AKwUvByPdV2O6WOkAU+Qefe+8iJC+SZ5jifeYzoqgVPHgvg0s+dUipgkA1uZ245tivos1ww5lnDe8D3TrmYAxe0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJOhjyFiW8Ms2uq3+2qJowyUkZSpz0fSHu1BSx5YJrLr6u378m
	eR7Bd4tqEQfjWfolygEEtyFfyWLgTDbQ9jTdwLD5HaEeSAaPzscLsalX
X-Gm-Gg: AYBFou2uFkhBW/O6Y3kUwU20drL47pjJM4upsKk0mGPOe6LWyUGMXL1Ylt8uj6Kcig5
	bTCPKrj8BbhHs1CPi2EhLreCzHj4MrwZvTP+s2fgDPp+/KkCFmZidwkm5dGKLVPW4tsuQT1hji6
	Vou7pe5hk/Po64yoc6Hsca9QC2oZ+caKB88fBlfhznVrxxpVkPzNdN/97L35W0Re9PUvbW63rHp
	q9IjoQXwTTWmFIg1FVnRFO2hxG1qM4dls6ch92wD+RO8aO0nWNdH1+AXPpidkbkuvvbuxiYeUNN
	SRl7LZ/VvVb3evUd6SpZlt3VWsVC+Mr+DJuicaK2CEgiXx5ZuueaWM8q8bdJ+tgGZYpeJX1nMaC
	+DuJsgTO5JZ5XeX+D4DUGo+0uNhTFGRHm1wWk8Pu3ZNOQUaBY/RgHzZErJOnRS/HyJeGbZG3mjy
	1vbElh+7hdehlh2KpDBAq5zWqmYnsGYu/DaaBVjhCUnawoIzw9g4FotDPLQC3HlGwBdKGVozjAP
	Pb9cosyut4XN4LpAlnuvoUJlkJkji4pLgumqDZYlpR1sswUCK/VVTZuwmWEJr7HFhDkm9Q+Wfqf
	6MB84+pH4+b1ZdPu1F9Gyjo86RtBRtd4pTd0G6ZDApmKXXUeMLvuClCLbaHQWY2jI+2ltJtIEQP
	ePzNK4n9072dO1nY0UcfwoiaXuXEtc2r2CGh738NpRO4ZLAmtAWbyHv+AzJfN4G7IvLwehlNlFU
	xBO9Vh19js6003VfyXcBU=
X-Received: by 2002:a17:903:244a:b0:2e9:d00d:1307 with SMTP id d9443c01a7336-2eb003ba0b5mr32081025ad.3.1793186527150;
        Wed, 28 Oct 2026 04:22:07 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eafcdb52e6sm10157945ad.74.2026.10.28.04.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:22:06 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 3/9] media: i2c: ov7251: Report the pixel array rate for both link frequencies
Date: Wed, 28 Oct 2026 20:21:48 +0900
Message-ID: <20261028112154.855185-4-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112154.855185-1-antoine.pichot@gmail.com>
References: <20261028112154.855185-1-antoine.pichot@gmail.com>
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

pixel_rates[] gives V4L2_CID_PIXEL_RATE 48 MHz for the 240 MHz link and
63.84 MHz for the 319.2 MHz link, which is the CSI-2 bus rate of each
link (one lane, 10 bits per pixel). The control is the pixel array rate,
and Documentation/driver-api/media/tx-rx.rst says the bus rate "is not
the same thing as the pixel rate on the camera sensor's pixel array
which is indicated by the V4L2_CID_PIXEL_RATE control".

The pixel array runs from PLL2's 48 MHz system clock at both link
frequencies: the PLL2 registers are the same in both tables, and the
measured frame rate is 48000000 / (928 x VTS) with either link. On a
Surface Book 2 at 319.2 MHz, VTS 1724 gives 30.0 fps; 63.84 MHz would
give 39.9 fps. A Surface Pro 7+ measures 30.01, 60.16 and 90.45 fps at
VTS 1724, 860 and 572, the same 48 MHz. Dave Stevenson saw the same on
a Raspberry Pi with a 24 MHz clock, where libcamera asked for 100 fps
and got 75, the ratio of the two rates.

Report 48 MHz for both link frequencies and drop the table.

Fixes: ed9566ce1946 ("media: i2c: Add support for new frequencies to ov7251")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/linux-media/CAPY8ntBFJJPg3y46gC=bNq_55QifC7mKmeq8+pAEDVN42fGUXw@mail.gmail.com/
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/i2c/ov7251.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 1f30a01c85b3..2db6c28a6e34 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -22,6 +22,9 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
+/* PLL2 sys_clk: the pixel array clock at both link frequencies */
+#define OV7251_PIXEL_CLOCK 48000000
+
 #define OV7251_SC_MODE_SELECT		0x0100
 #define OV7251_SC_MODE_SELECT_SW_STANDBY	0x0
 #define OV7251_SC_MODE_SELECT_STREAMING		0x1
@@ -633,11 +636,6 @@ static const s64 link_freq[] = {
 	[OV7251_LINK_FREQ_319_2_MHZ] = 319200000,
 };
 
-static const s64 pixel_rates[] = {
-	[OV7251_LINK_FREQ_240_MHZ] = 48000000,
-	[OV7251_LINK_FREQ_319_2_MHZ] = 63840000,
-};
-
 static const struct ov7251_mode_info ov7251_mode_info_data[] = {
 	{
 		.width = 640,
@@ -1567,7 +1565,6 @@ static int ov7251_detect_chip(struct ov7251 *ov7251)
 static int ov7251_init_ctrls(struct ov7251 *ov7251)
 {
 	int vblank_max, vblank_def;
-	s64 pixel_rate;
 	int hblank;
 
 	v4l2_ctrl_handler_init(&ov7251->ctrls, 7);
@@ -1586,12 +1583,12 @@ static int ov7251_init_ctrls(struct ov7251 *ov7251)
 				     ARRAY_SIZE(ov7251_test_pattern_menu) - 1,
 				     0, 0, ov7251_test_pattern_menu);
 
-	pixel_rate = pixel_rates[ov7251->link_freq_idx];
 	ov7251->pixel_clock = v4l2_ctrl_new_std(&ov7251->ctrls,
 						&ov7251_ctrl_ops,
 						V4L2_CID_PIXEL_RATE,
-						pixel_rate, INT_MAX,
-						pixel_rate, pixel_rate);
+						OV7251_PIXEL_CLOCK, INT_MAX,
+						OV7251_PIXEL_CLOCK,
+						OV7251_PIXEL_CLOCK);
 	ov7251->link_freq = v4l2_ctrl_new_int_menu(&ov7251->ctrls,
 						   &ov7251_ctrl_ops,
 						   V4L2_CID_LINK_FREQ,
-- 
2.56.0

