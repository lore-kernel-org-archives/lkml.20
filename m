Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690471;
	b=vfVuj+dZI4VXFx+y53ZKFcdME7QuWt84JJIYoMaHmCJf193+p/HaW01tCnOeQVwGoeSW
	 GX4Ui+7+mv4els/6GgExNJB1/D7ULwRC3TFRZinyteD74+/u3ebkAFo1bAo7QQ9hbCOQb
	 BI+kN486cMsOA8yIbM8E7/1+1OuMeuWLzoAQsy2OvzRX23TqyCEojwXefmS8k2KW9r5PW
	 IslyWYggq/PZaxBU+ZYVGkMq4OaDmbWMllbiavHaPKPFr5jFROu3cU0J73s5zojbYcOK7
	 uRd8G5nmZYSkzywyivbUdCcmnfk3jGmULv+grjrCFUOcylsWkAcK4WPqlb/WO+Uvorg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=g2Q9s7RMNeWpcW6ZkkIYUa+Y/Qr4kaBiQvLPfc53Zu8=;
	b=zFqdE8CyBRufhBAt7Pl3SKiOiAvXw7qEoYUZM6rLFB5cpvhuN4GbkdYPWtshBARz49+q
	 +9honnQ6G+EQmQO8OGve0wt5/Nn3DlZi7MDHWLVoH8MBUg1nEs6JhPWgTnhIkKzBG6QK8
	 DyOqTWMcygyqD0x7CYmiDVmkAx83/y8NWNXeidJJQ0uWAMzJs39PEKC2K4auoxRhivxWg
	 LQIpTSdxyXeWIE+DCmsFQ2LRMKrAX6Z0vlI0wJwXdyeVfq6En1Wmo10iQ1wQadp3H6O/T
	 3hmmtMQSKRATuVjGpWZp4brNv8BaiEA1XLzx6lS122CqizFECTr+dWGAIIGhpFqRGgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=bgas6k85;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3063E606A326
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3063E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=bgas6k85
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afbd2c386so28811f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690469; x=1793295269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2Q9s7RMNeWpcW6ZkkIYUa+Y/Qr4kaBiQvLPfc53Zu8=;
        b=bgas6k85plq4qK7o8D+nY+Q1OOUJLT2FZsMDezlnz8GaTMY9Eg3NesEQ8SYQ0/1HmA
         BJPsgtKjU3nFeqc1sZlOiinJI/gMiF+9/JbxChw2ENC17eLFXb4VbBdCSst9+Bens5S2
         S8XpoTXqLee+MDHs6RNM6h1hWSpE68Rwk/5+R6sg2gOfab7t0PWr0+cIgVcYfC+IY4pA
         KeCqH9nuQUbxGWDVeBp+xXiz7lgbkQVQoFX+tIOkci4OSp9u9fU2Mq2flMACj/72nyMa
         Yb63uggzRSgJ0fvla8CP4OMy+P3S/upPLJsCwTXspu8eDfLJ4GBDotIzhRitJLdRSS5h
         7qTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690469; x=1793295269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2Q9s7RMNeWpcW6ZkkIYUa+Y/Qr4kaBiQvLPfc53Zu8=;
        b=xKTEn2s6DMfa3Cl4Q9U1vOJCOEOtQ8uSMTVlT+0qEMzkB7sWQvW9QShTr6bzfCWdVM
         bd1r7Hs0ZoXtqsHnscma0pbi+YlYj6euLxqAIqs4Jf+VOdM3vuc4vjYWzjg5SKit6T94
         +WIAQg87nlLp3fS+2i48lnGi9xMX0dsf3j8PYjGdNAHJkoTR7enWcWQ9Aw99qDtEE46V
         setG/+8YuIm+80LUrcWUqxMvC5lyJ+EuyFFMBNZI+Seqzej4gwM+gbhUZaKfIxvqcVau
         KW70/1FLgVlR2/t0xwHRcBYa7lF2NpGWU6JtqI6CwXZSTM1Uvh9G3E44igNoc9/ywlPg
         4wpQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9YbpiWO8g5yBH6YVFhgNmpZ6ws1XdtFR+bWOodO8GsA8e6zxjF22N9Q11ggCXOx0+1c9WMorLL7LZVLc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMOELhuAVV5r1hLVtbgl2CUGCIpyKmCdL49m1v2I6JOjeUmL7q
	8LoaKOt7AQGLMpn2Pdxvuij8q/HIyfTtP090RoJbeN/DFQqjpoCpxWi3W5V2ORgPZdM=
X-Gm-Gg: AYBFou0kP57nljQFa2tviVktwIg6feBqsux3v5N9utGRYyX3lEL+akLG/YsBfAmrjEy
	PfGVbdDgUJXgHApkbHpb2yKDoVZSfGLQHOSoqZIhKb1KgrjfGQsNOiiSBp6LaYcd6oTxnC+WMc7
	ulocOq83FyqNTEnTjUme2tiiSh1CbHjfAEd0nI7M6BSHIYhE4J2jxyvP9/hijY8sr1cVvJbcTHV
	kD8NFFrKKlUQtfwcmL0SsnyAHpbn+lJZ0djL/0AndM61QYj5JBMwJnc+igv7GU9Exa84zhagJ5z
	eSXuBPUvK6oMJzLYdHeH9tQwTxYt+RJ0Novp2ILnAdAhPVIVAGuO3So3QSYepi44Coa73jzzjgd
	wLLZ0bK2ljkoL4p9I1t5Q2+dT4JnS9IvwLEovzVa43y+AMlRV7Ld10WhRvKAgX/yAK+9+MhO3Nk
	1BUyIZX4sQHBuHiXjGSGkfgIo+Aqg6YJYC8PQ1lHk/gAztoQm17s6zxW4l3G0fFAfsUVdgxkSGC
	7lcbIV+POWMBUs2AfqHbzZ3VkyVWbDlL4+xbp7NEkyMQHu1v/gJj6wmlHIkpb/ac2aOnOCCO/GB
	690AQ+TjyB5yA4PlRJdWRUpgBeuDpbk=
X-Received: by 2002:a5d:40cb:0:b0:48c:7037:aee9 with SMTP id ffacd0b85a97d-48e264e01dbmr9492451f8f.50.1792690469507;
        Thu, 22 Oct 2026 10:34:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:28 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:33:55 +0100
Subject: [PATCH v6 02/18] media: sony-starvis2: Reorder link frequencies to
 remove lookup
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-media-starvis2-v6-2-374343f55fd3@raspberrypi.com>
References: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
In-Reply-To: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

link_freqs_reg_value is table that just reverses the order of the
link frequency enum.

Reverse the order of the link frequencies so that the table is
redundant, and remove it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index e62cde583324..134fececac5c 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -187,25 +187,14 @@ enum starvis2_lanemode {
 
 /* Link frequency setup (DDR: lane rate = 2 x link freq) */
 enum {
-	STARVIS2_LINK_FREQ_297MHZ,
-	STARVIS2_LINK_FREQ_360MHZ,
-	STARVIS2_LINK_FREQ_445MHZ,
-	STARVIS2_LINK_FREQ_594MHZ,
-	STARVIS2_LINK_FREQ_720MHZ,
-	STARVIS2_LINK_FREQ_891MHZ,
-	STARVIS2_LINK_FREQ_1039MHZ,
-	STARVIS2_LINK_FREQ_1188MHZ,
-};
-
-static const u8 link_freqs_reg_value[] = {
-	[STARVIS2_LINK_FREQ_297MHZ]  = 0x07,
-	[STARVIS2_LINK_FREQ_360MHZ]  = 0x06,
-	[STARVIS2_LINK_FREQ_445MHZ]  = 0x05,
-	[STARVIS2_LINK_FREQ_594MHZ]  = 0x04,
-	[STARVIS2_LINK_FREQ_720MHZ]  = 0x03,
-	[STARVIS2_LINK_FREQ_891MHZ]  = 0x02,
-	[STARVIS2_LINK_FREQ_1039MHZ] = 0x01,
-	[STARVIS2_LINK_FREQ_1188MHZ] = 0x00,
+	STARVIS2_LINK_FREQ_1188MHZ = 0x00,
+	STARVIS2_LINK_FREQ_1039MHZ = 0x01,
+	STARVIS2_LINK_FREQ_891MHZ = 0x02,
+	STARVIS2_LINK_FREQ_720MHZ = 0x03,
+	STARVIS2_LINK_FREQ_594MHZ = 0x04,
+	STARVIS2_LINK_FREQ_445MHZ = 0x05,
+	STARVIS2_LINK_FREQ_360MHZ = 0x06,
+	STARVIS2_LINK_FREQ_297MHZ = 0x07,
 };
 
 static const u64 link_freqs[] = {
@@ -914,7 +903,7 @@ static int starvis2_write_common(struct starvis2 *starvis2)
 	cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
 		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL,
-		  link_freqs_reg_value[__ffs(starvis2->link_freq_bitmap)],
+		  __fls(starvis2->link_freq_bitmap),
 		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_LANEMODE, starvis2->lane_mode,
 		  &ret);
@@ -1177,7 +1166,7 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	const u32 hmax_4lane =
-			min_hmax_4lane[__ffs(starvis2->link_freq_bitmap)];
+			min_hmax_4lane[__fls(starvis2->link_freq_bitmap)];
 	const u32 lane_scale =
 			starvis2->lane_mode == STARVIS2_LANEMODE_2L ? 2 : 1;
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);

-- 
2.34.1

