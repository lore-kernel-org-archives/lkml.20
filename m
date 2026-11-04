Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818217;
	b=Gj9zIvx6aS5zOGgpbGuImqCliKXMxwHygbWqfRWXS4K55l2TCkGr+58/ynOjyt46AiJg
	 9zwgow7UXX/Hi10c+t5y7gA2Z6/yIp8F0UtdsP4arwItUAKY2mCUF1GeDiHY9wslA0gXB
	 wNTrCN2rqTXVbdbyNfiP+snRR7uaGFalCReU2MUAzhgiqD0zwZ6oM9YVDr2nU4SEyg8PZ
	 noKQXSZ6j4YTIdqPBEzeqpF0XURkVIcmFpMpCe5ZJkHnO2d/KtffV7UFVp8U2aPHevIk6
	 fpxwRYgzP6roFOhSWhCZZNuwW1woqcNnIsYEB6kKE36VMbE9U4YxgZyWIuwv6tHU7gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hgpz0Pnzy6Bfb4EoHwUzOVn72wSYeBzOC2xJFHZCiaw=;
	b=Qa/ED6tMSCEfWrolLtSj1RQPQScxdZT2cpxXMAo25Zot2H81w7EL8ed4RiaH6Z0iXPei
	 UCttp5E7vUMc8vO29rMJwe6VFg0cAALTXjLR5lYgzUmLerT1J5VgqyQB6sIHbAXjjMQbO
	 8iPSxruliLDS+lZx/lu4OQCxfvhaXs6zZO3GQifHdUeTKSofltbQxhoSCNxb4bLyNKmtd
	 oX2vhpYRmlqrX5YtTnH/4FTMnTKpgZZm3iuTSND8eZFZXcJg6Oum+ptzSe1ZMZVQ2BJC7
	 NHp2ymmccddA1QsLfv5E0YYrzzJZ2FK7Qew4RVQQKFFVsbbeKnKxZeYMjml1dek43TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YotFc647;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84010606EEAB
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84010606EEAB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YotFc647
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3514b90bb89so1964750eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818215; x=1794423015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgpz0Pnzy6Bfb4EoHwUzOVn72wSYeBzOC2xJFHZCiaw=;
        b=YotFc647PWWOSnqtkGAJO+BwusgiJSDM0B4ngFBzpTRO1s6hMLg9u56bImThbZw3BJ
         w78BuBiIuPBCzbkhE7v1jBaf/RmNb06NvLwvmekA4lM3nrBmq4YhgzM0StGIUMiOpY8v
         sxvph2MFnawEm1jX28LOZpzneWAUeuYrk97Hgz8o9EGBi2bo+NeyDbLBsQpcGpJj0On2
         1jKLCZJa9nj/LpemUhv2OdrsmhGuplVd0L2wVYQTf9+fUem+YjVSLFvrPs7LE4pNpkiH
         4q/Mc3NXV0ndQJXxVo5dHePVqPaNy+DVRytdUtyY1e2k+vENVM3gyGv7j4wclkahHwYS
         fIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818215; x=1794423015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hgpz0Pnzy6Bfb4EoHwUzOVn72wSYeBzOC2xJFHZCiaw=;
        b=mOARtB/Cp/SZ0JlbVlrVYGuK7JCpOkP39IRTCB6SFi7daijDsuKW5FNX3Q2gZh5V41
         4ay/LYUL7djoChrH+KJwMr0XcS4KaIF1qXz0QZ8hiSW/yKq97YmV1xIzwRqjn8uEy0J7
         6JEq1409zvQyf3tPP8OGEDHD13P+eXoaXy1EWWR86rRSNov89//PucAFjjCPNV4pkzAm
         fpNsOxmi0iZCpxhIeksPA8RW6hT8qH+8ktqAXU4haaKpMdXj2qkT6lStGSNgfEY0dZTe
         qGiJIuT2sWzPsJlmwpHLfgYKFs7npaUpBzbdv7JVOU/E+DPGBZSnkJdI+AafMCcv23sg
         ycEw==
X-Forwarded-Encrypted: i=1; AKwUvBzXaPQXsTpOw4zK8e1Yu/XlAh1oxj+Vx0WVcOCz74ySD7LYCfBxOpvHRovbcrlApO5H5xdnn0RTHAw0pCs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BoBEIfZrY4KheQOCwqX8KiW82JtNDOcfYBCpBYQnJpK3eXZrs
	TQ/YDNQNVinhuGEk5r7tt3tNGLxoYM5Ws8XqUt2lf+2mQNvEaTkZ8jhO
X-Gm-Gg: AYBFou2IcYUNZbJ3TxtkCj0JN2LCXjSyJeBNwOl6NL9dFg8li3m1+xsJSskxZwy2MNc
	0zAwJpjpvRuX58KYGH3ySHA3z33DO6Qyz0askXEIMv4rN+ek1Q7Ha7FQTK2LgSZOJ1ScOlWrza1
	XsSR52xT34lbxrow6DLMO+ePEpqQCpGKvQMA9HS2IDOeGkaqFny4m4u9sroPqOEbwukkFXUOImP
	kMPt1MOc2MPcRmOFklvYl18vzSVBYiM5Z3irWxGMZfS6Yqu3NgQB5t6P7hO4bKpK3lZA9WQpP22
	jfe7K3C2eHSVDR2m+0D4UZvA8SYHPyAp+mbWNiPqXce4CgS2LUqHZ0H3rUnQOomDvzsggMFKkdG
	M8oSZhyVUHbNXBzK3hgOh7LHl9EihaV5hbY/FvRVPxDpnAkhpQ3XVMBYGflf3LDSWFEA/3myl+/
	UfXAYjpC+b8oQqrQnGB2CLHhVu1TClhL20A/Q1IXY+CrUYy5lzzdWU+LZO+8HxyZP2naMnOI9BL
	Dxq5isu2uUvAvAk/nsJLcquJWPrPXsMsVBZxpX9216Kq1pZ1k+OHDQm3z80iSkpcr9LDMRTz2ML
	LNeP7E1a09w2EnU/XNlcLB0I/sZUgt1H2JTH+4HqZ8jeh6PRo5bQBzChOXg=
X-Received: by 2002:a05:7022:29b:b0:151:94a6:6f5f with SMTP id a92af1059eb24-1ac5c3699aamr23820953c88.10.1793818215406;
        Wed, 04 Nov 2026 10:50:15 -0800 (PST)
Received: from homik.search.charter.net ([2603:8002:ad40:56f0:81ac:fee7:f533:3879])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm11330186c88.22.2026.11.04.10.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:50:14 -0800 (PST)
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org,
	justinstitt@google.com,
	morbo@google.com,
	alx@kernel.org,
	shlomojune6@gmail.com,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>
Subject: [PATCH v2] media: siano: Replace strlcat() with snprintf() in sms_ir_init()
Date: Wed,  4 Nov 2026 10:50:08 -0800
Message-ID: <20261104185009.319191-1-nikitash.mariiaw@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>
References: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>
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

In preparation for removing the deprecated strlcat() API[1],
replace the strscpy() and strlcat() calls with a single snprintf()
call to construct the IR device path.

The return values are unused. This preserves the resulting
string, including truncation behavior.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Reviewed-by: Alejandro Colomar <alx@kernel.org>
Reviewed-by: Shihuang Liu <shlomojune6@gmail.com>
---

Changes in v2:
- No code changes.
- Remove the statement about buffer capacities
  from the commit message.
- Add Reviewed-by tags from Alejandro Colomar and Shihuang Liu.

 drivers/media/common/siano/smsir.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/siano/smsir.c b/drivers/media/common/siano/smsir.c
index 283770d583d5..636ff228108b 100644
--- a/drivers/media/common/siano/smsir.c
+++ b/drivers/media/common/siano/smsir.c
@@ -55,8 +55,8 @@ int sms_ir_init(struct smscore_device_t *coredev)
 	snprintf(coredev->ir.name, sizeof(coredev->ir.name),
 		 "SMS IR (%s)", sms_get_board(board_id)->name);
 
-	strscpy(coredev->ir.phys, coredev->devpath, sizeof(coredev->ir.phys));
-	strlcat(coredev->ir.phys, "/ir0", sizeof(coredev->ir.phys));
+	snprintf(coredev->ir.phys, sizeof(coredev->ir.phys),
+		 "%s/ir0", coredev->devpath);
 
 	dev->device_name = coredev->ir.name;
 	dev->input_phys = coredev->ir.phys;
-- 
2.43.0
