Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6894718DC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789076622; cv=pass; b=mGvl6QSGxq5n3IUkgyhoavMo+/KTSFFBJ5oZnyeFZGPLF4urkqRAXnXZjVhC4+9pDMzn8Dg9my9vLSizga4+bZ4oFzSqpMY5QiJ7xLrOhACutZsA3lcXA4VsmwoFPXMoxH9S5DjgUbigDnzSrgMZt07yHnme6n7pWT2cheqaOJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789076622; c=relaxed/simple;
	bh=K+M1hRC3J1lPZHVkwlbZglylwWv5qUa1oz6hH/E7ZNU=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=WnaQZ6GVz7Ga0zLHS8ynKc6gMISIISlUCxmDB4GKiNPXJSBV0ZPFKHUKko8C3igt2iTMPLOhW7vtnvF8Xs5WxZzMxgjD3xv/IS8MoTEwssoy7kXqcXit9WSVovoUGbrpNocWhtr9E8jZbAzgJJls+LiYPkjEpri27ZeYEGoTXSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=AK5sON+n; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="AK5sON+n"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2dcff8f44f2so2677135ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:43:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789076620; cv=none;
        d=google.com; s=arc-20260327;
        b=eN6D4jkHMOc4py2ulcRifsq2NzS5kCUbze/RL2sgUGo6grqDj2KQHlHw0ILFXxBETR
         Meua7Hx35BEpIuCvzivzoe3boHv8sIGiO0X0WM7153gVPrj93ETdOjAOwrsyTX5LprcF
         mQDisrUhX4JpeDP/9IDbO2F+iEGKoscr65mK3LYSCh6Holl28tzTMVIF83PnWqCwLaY2
         EHYqu4Dz7j4FaQPBFQb5YzxheDfzWljeNTLs7qr4xJYJ60Us3l7EGJCBKoHtKkhfX1o5
         ff7mnUolb3T1Yq6bwa2Q50nIXPA0+fAuxqHtUQxyF1fq3272pa6G6Q4xgBSiPnnyvBq/
         ojwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=3ni5Or1iizW0Oi2Q/TkK3TNnNcK6Qg+mAIz5hPJ11Q8=;
        fh=KtozXeD66elW7kN8iG2XLwomoBmJp7A6lqpxXhgSVS4=;
        b=o8s0iEQbQfhbE3j5GEuMcI1SLMgXh8dNDbmZ8tZuwrGEraneFOFNclzQFbEDGWjOtf
         V8RQ6dTbfVgV+UJ0iULDHgU++UesHT+NnJRgWa06ljyB196NlxuRyHXqEHb1J71p5GaI
         hiZLgxmxHd2ark29niQsy0RBLYqObeMbSJzOEIIMCl2Kv7cPQ1flXBqKXbbw6ImkIHId
         LzpQPThvH+Vj80ASr5ccQ5F7vRcSQFp5DKTX5npx7fAlFmqva5VdmUhR3H8ZxMgFQfCw
         kl1yf3xo3fqNKwFfzkSSsQ2DupLtPHuRxFSODm8F+xgx76vDSLl/DvYfpuJ2EroqV+Ac
         3kGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789076620; x=1789681420; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ni5Or1iizW0Oi2Q/TkK3TNnNcK6Qg+mAIz5hPJ11Q8=;
        b=AK5sON+njgSc5wcqjmSsmaUWKGg/uAstOFTNUh/RSnHI8SVH63uyIXRWrRrGBrl87s
         ffUFhRZ8adL1cnF+p0ATOtOnOwWqWpL+rR956sVEbt/ordhNpq+esL3vXGMqmqzbPyj1
         S/w2YCYrMIZha+AI5/XoSovJxfBmfI4Jsc2qQnv0CG0Rhj4aeDnVzasrGJa64tgW9Ge6
         lejmGiEtOu3e6eSDIBvXUoMbBUsO+npFNgPD2CzGRoWujy/vLygBq9pEseUl6ay7aUyt
         jzmuBlYPQbw/VuXiRXb1w47gDLVS17i2ALG12MkTCvTlaR9ZEtin6dQNyh+le0F+rX6j
         AtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789076620; x=1789681420;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3ni5Or1iizW0Oi2Q/TkK3TNnNcK6Qg+mAIz5hPJ11Q8=;
        b=YLek2gcK1WMBzwTYMerMJzP6kkh3sU03QnxqY+pik6Z75nJ+eEu2rPiFsvS+Fpj9bs
         Awqg50eNi0NFR6ceEkKB9UNb8ttX3d9YuGZcR5ALX6GKeoPdSTjguf2Q9+PJ8CKEzXMx
         OMCsnz2T5TvoQ0dF8yS6xNNQ8A7ZahrrXSaD8990ZaDiQVzG29oyny+/JSRgIBfFcIL6
         WH21AVMha5ZKsO0J6BDwbWZfiIamYlmq8ol5SnDlyGV01vfquqoOS+nUeAvMG/7++dkv
         qr2E+DSOL5Lh4YHMYVJ0uU1wl0T9nyrKCRh/i2dWUlMLvYoE26fsHiOxvYNFYtBxrGm3
         mgWw==
X-Forwarded-Encrypted: i=1; AKwUvBwUySk1Ula3VurmFMXM4Te1xHj52lQDrxgICVqhjbpVHfi/alnKRL02aeMJHqp/sn0SbTn7K6HOFK4eypk=@vger.kernel.org
X-Gm-Message-State: AFuF++khstbEYy+vX/2VhQ2XFc4+6/XzwrUAMWrpYxpn14lxnGMixo2Z
	ufEREUxyJVjHBBz3vEFcattEV0FjqxuJ4whwI8NXQhR9lHJNVJdQSPOZAEyf30/oC0wt+BdF0m4
	XIhLxOGzAMwGN7L9uhbSJjfNjyE1HODxCxZvhRdnY
X-Gm-Gg: AYBFou1/z1ISvGdZ466LqFpGvl6s5os8YACmIMbvmLYFWf/uruTxuhG4STbBQ0UAxmI
	IjF5wusY0v4XqdbG7CEO1+nk2tOyJtnLAuTsl6EI7LZgETQ2S/CnaDZX+0VzBNq6s6rNYMuCC+9
	WPopEAc92bvC0fPy4unBNlk9pcRdUQPyAkG+cM+wFA22+mj40KdqEDiV9z2S3CVJblMZUL2BvcN
	/LR1eNpOIoM1+kxkRvP6QZgCmNVT8mEE8kzf45+2FTWKcVVMV61nUg9TUGgP7tt+0e3ZCOTTMo2
	b1EERojUAoYUmw/Zrnre5Ol3fX1iPj8QzcdcIoYLnKIof1y9Ioykx3CbAE9XOCWmE33SahYTZ8Z
	Ef8xKe0CxwLCyolnRaN43zNI2CRSKmP3cjRtwzQl/uFI=
X-Received: by 2002:a17:903:4b4b:b0:2d0:cc92:f7ae with SMTP id
 d9443c01a7336-2dd2a1c425fmr23721295ad.3.1789076619207; Thu, 10 Sep 2026
 14:43:39 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 21:43:38 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 21:43:38 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 10 Sep 2026 21:43:38 +0000
X-Gm-Features: AcwNN1W35qNEJEtjTaS5E6l35yvlHx_w4ZWX3F9ageKJTtnwfUEo-YSxtu_pIPk
Message-ID: <CA+0ovCivEREvoy=Z-D5TSddgTfFknhFrCBPON3a7QD2Kne=MTA@mail.gmail.com>
Subject: [PATCH] spi: dln2: validate chip select count reported by the device
To: Mark Brown <broonie@kernel.org>
Cc: falemi@asu.edu, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

dln2_spi_get_cs_num() stores the chip select count reported by the device
straight into host->num_chipselect, and dln2_spi_cs_enable_all() then
evaluates GENMASK(num_chipselect - 1, 0), whose shift exponent is out of
bounds whenever that count is zero or larger than BITS_PER_LONG. The
resulting mask is handed back to the device in a u8 field, so any count
outside 1..8 is invalid regardless. Reject such counts with -EPROTO in
dln2_spi_get_cs_num(), where the value is first read.

Closes: https://lore.kernel.org/all/CA+0ovCioY634b646jDcs2cFmg_1q2UMN4wuTQ1V26Gy+Dm_c+A@mail.gmail.com/
Signed-off-by: Farhad Alemi <farhad.alemi@berkeley.edu>
---
The device was emulated.

--- a/drivers/spi/spi-dln2.c
+++ b/drivers/spi/spi-dln2.c
@@ -71,6 +71,8 @@
 #define DLN2_SPI_GET_MAX_DELAY_BETWEEN_FRAMES	DLN2_SPI_CMD(0x4C)

 #define DLN2_SPI_MAX_XFER_SIZE			256
+/* The CS bitmask is carried in a u8 on the wire, so 8 lines is the ceiling. */
+#define DLN2_SPI_MAX_CS				8
 #define DLN2_SPI_BUF_SIZE			(DLN2_SPI_MAX_XFER_SIZE + 16)
 #define DLN2_SPI_ATTR_LEAVE_SS_LOW		BIT(0)
 #define DLN2_TRANSFERS_WAIT_COMPLETE		1
@@ -201,6 +203,8 @@ static int dln2_spi_get_cs_num(struct dln2_spi
*dln2, u16 *cs_num)
 		return -EPROTO;

 	*cs_num = le16_to_cpu(rx.cs_count);
+	if (*cs_num == 0 || *cs_num > DLN2_SPI_MAX_CS)
+		return -EPROTO;

 	dev_dbg(&dln2->pdev->dev, "cs_num = %d\n", *cs_num);
