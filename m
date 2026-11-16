Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862438;
	b=3jSQGcnD+uhAKb72g2tAz7cYCKm/Fud2e6GPQJudYbv7ygaGClrhvfj5va3PQEmRf1oy
	 yV0ti7cBv0jxLZPEEhwA821MXSUBiX5wWloEQ6ogSRavmlY7Fg6XEjTT0wyfCUGeOvjg1
	 rLOg2NXb5sp9DsWC/vKJQYbTQGVznD9ysAYRW2BcMKosIlD8yYJWVPC2mRl0jD6/FWQDI
	 FVqH87zwmx+Pj7nGcynTxVq5tselsrpkv05lEsB2Las+PwzxdMqAaS59GKpcsCCr6/ob5
	 P+ev1anR7edPZt0I7fE6P6sTFVO7Hq3ExRo7Snw8DvAo0OWIj6TkodLupD6ijtWzmYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ljvyR0WuHX+wTiGEcCFlcGHOJ6URbUYTzcXzcdYxpLw=;
	b=UF1qno1+T3rSPLwlAgRKln112YY6vlmvMXcFqjhgw8wX7k/sLX4c+O3BTLEFpwSWWfIA
	 NrIHCCLLHKPihs2r802R5JP+AhPYsxuJkcS04vNeec9G5gHKTaklcp+AAuHGrYYG1dUtx
	 pVGirqolAarDi/nn8PYd7Mz06yKksSD3U3Pefxt0dukKBd3SQr04CESX00adIu3CCX8M7
	 wwWorc4TmbqOeeHgURpjUsoQ7cwoUK4WnxwGgaafTgC14yeOcwC3A15cAKygibaiTGn3c
	 jWIhp5RUdUuSwhrXLlGu7La7b1VA0Qz5ZhLeI9Js9crgcAYuhMqI598MXkGFW78FIdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YAnC5pjD;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215F7606A889
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 215F7606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YAnC5pjD
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b244fb7fffso4689811c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794862437; x=1795467237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ljvyR0WuHX+wTiGEcCFlcGHOJ6URbUYTzcXzcdYxpLw=;
        b=YAnC5pjDk1mPYDsTC2lRlCBPfbMyvkSuH9z3Tw9hwVmf8dOU4IAskT7fjlTtIPnA/X
         NzJ3EHjwxpyPBcW/+2g5EzSOzATzaKEhxIR74PiXekxsVM2/ZWE+Lz2ZklxrTuBT1bom
         MHWfjof6NY3apTZeUiLgoSj5LTSOPKD7MUlEWmVz11K6gA+3RgFw6IycG1X+bKWGfPLH
         UKp7/YNqbcixdPUUEfKMWNclykcXfBqba5jnrk8k8phrNzYe1IUqur50faM6wtzjEvm7
         WVEOucJt77aqZNVP8Sjc88AvuTIILfLqfbwICG7XfuInG8E0jXkUiny0L0yyPbibc1dp
         fyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862437; x=1795467237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ljvyR0WuHX+wTiGEcCFlcGHOJ6URbUYTzcXzcdYxpLw=;
        b=VY12o6Z7xGBVmeLlaAVdEdxboNC/qGJ4vSibL0HwBim2MantmKSeV1e1jwwmZl1YwP
         KKD7Py6R/EUojytMzY9V6MGEjMBfoX/BiMqSKokW6ChGC/wwaklD6DOf4FkLbjCSQTVm
         8xH4i5YN92bzDu0XO1v12EBwI7su/eKU0wh4mm/tjLw94GofRNDAI/WwGJEx816Jxwy2
         4rnGeZspD+QSlveWhRuECl/Bae5puWKAovlYsIIL5GcGC2L4DwwucyJT2mQ4nvV5KTVQ
         hFPUbRHV6XSywhcqk8JH/yEmFwLwTI7Sjhtarh/q55gjwdxNXH6dmNrAPQIrLqiED9NP
         1Fhw==
X-Forwarded-Encrypted: i=1; AL+hErHXmzJVxLrwfbUjrsiDal0Smj1OzK9qgHQ2YCs3Bow10eEvXvAPfBeuUee6SoqtDZyJuNW+Xd/Bx7E8Bhc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cQWnV8D/A3L2/tSfrnMqw2rnHqeuJHCtm/auCHUvFGJjwXkMU
	dIuhfDlV5d3/Tsm5tFA5+ylejCRscai8JBqUMFzdODu4fskuWhiQEIQe
X-Gm-Gg: AYBFou0Oko9/4nocQCfBHndb1F0tHbBySXfOSzXmRaV3Qnpi5BOgjyKVlK9c6zPUX5v
	02CDrHQtZYmaAOZfwpgDhMAzB6bfDkn7Eys0NPt/XHTiMejK1dxKDQxOLWRQ4twbDWbjgTl3WZ3
	ToJYb4WY7WGfstdUelA6AwRFePjyzOvJHG82n6vbKSUbZFFkGA1IJ7pRCx6mmjLSYkY0DhwcYQQ
	2XgZwzObgsotUQO8z4502Pk8ryaON8LOA9qcyZyXP5vQuk4O3IfrXRmM+izfUtUjEcnrRFxJH2P
	hKi9DD2j602dNAOg2T46YijZzRBN3oomOj17zvg26XvFutcbpbZymNQeBAbY5U95d1Bk6qlYb83
	8K/VU+SnByz6hjfYWFbZf6PqE/8z74q5PaokobwaGzh+Lg4SstKoHvzM1g+Fmp6nkMpqyp0o171
	Zbck9EDthiUZ9OQzqBCbmN2rMDwy5AOTNKcj/IZ2h4r13XJbKVk6YgNSWQsDUt/B2MLp5iftzi6
	GXabs8Db2Q1P9SUv07LAe6TlI6UWVhcmR8ppsnZkETTWPEflYwVac5h/RpRSfwNFnWkdDxdeo5J
	pOxcqTBDIfdoyiImHAhb9FxW3YKww2BnUoj7D8Dg765FAvN2xbJOxVqbXW/zo6ARrZquIh3rdG2
	47PFQZ+41UaweQ0/XcILp5/Rhvzkvc/3h6fnxuyuvmm/7JE1PXoN/H6nDzL6tAmw5NrYRwjbsYR
	ie7KRi0aKCt3BHoJAw9qzoNqUNxnYOiVIGBJAFtgc2ug==
X-Received: by 2002:a05:701a:ccd9:10b0:1b5:32d6:677f with SMTP id a92af1059eb24-1b532d667b7mr2676150c88.34.1794862437187;
        Mon, 16 Nov 2026 12:53:57 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b524049e0asm15293497c88.4.2026.11.16.12.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:56 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH 5/6] iio: proximity: sx9360: fix proximity threshold writes
Date: Tue, 17 Nov 2026 02:23:13 +0530
Message-ID: <20261116205320.26070-6-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116205320.26070-1-kapoorarnav43@gmail.com>
References: <20261116205320.26070-1-kapoorarnav43@gmail.com>
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

sx9360_read_thresh() reports a PROX_THRESH code r as r for r <= 1 and as
r * r / 2 otherwise, but sx9360_write_thresh() converts back with
int_sqrt(2 * val). For odd r the read value is (r * r - 1) / 2, so
writing back the value that was just read programs r - 1: setting the
threshold to the value it already has lowers it, for 127 of the 256
codes (3, 5, 7, ...).

The int to unsigned int conversion also lets some negative values
through: 2 * val wraps, so e.g. INT_MIN is written as 0 and values just
above INT_MIN as small thresholds instead of being rejected.

Reject negative values and use int_sqrt(2 * val + 1), which picks the
largest code whose reported threshold does not exceed the requested
value and makes read_thresh() and write_thresh() inverses of each
other for all 256 codes.

Fixes: 1cdb4c47f7f5 ("iio:proximity:sx9360: Add sx9360 support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9360.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/sx9360.c b/drivers/iio/proximity/sx9360.c
index 9ba967a33c98..26190f9c6c1f 100644
--- a/drivers/iio/proximity/sx9360.c
+++ b/drivers/iio/proximity/sx9360.c
@@ -510,8 +510,12 @@ static int sx9360_write_thresh(struct sx_common_data *data, int _val)
 {
 	unsigned int val = _val;
 
+	if (_val < 0)
+		return -EINVAL;
+
+	/* Inverse of read_thresh(), so that writing back a read value is a no-op */
 	if (val >= 1)
-		val = int_sqrt(2 * val);
+		val = int_sqrt(2 * val + 1);
 
 	if (val > 0xff)
 		return -EINVAL;
-- 
2.53.0

