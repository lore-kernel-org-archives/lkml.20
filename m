Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794050252;
	b=W+1wsf+vkMO4q8LV/uT7BfLStEIEZohKInwNTGf1nKAKPWLS1+c3M2iaNFDS8Hr6d+qw
	 IO0QO45pLvOnk72CiaF1jjjsvALLX+2AR4ZGx9v2Muk0iDlkzY/qk8/0X2ws86w24NzAJ
	 Tx8oDSrxStw3l1roSYspGUw75SxZn8vGqgI9d+QZLXgl32w0YSuv5bk7dNFQVP+tfZpcC
	 YOvoIA5vhU2PDXh8Y3IMRhq6WtpllPXioL11tdBfp9eEswiAXJ2IsYRGturYCr2XDhEqd
	 rYVBzxlufpsaMHGZ+U1X8HXa3OmoeleM94Q8oH0/qRIbS7EEhB021lP7DWfO6gd7c/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794050252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zaZSGZGlIIPoCOd1I0ste11xtmQPi8WmEaIUIAvrRn8=;
	b=TGGCrlVetRki6Jk0QLsWZS9qT5UJD1GaX8QRkhYgGSylX0rgbEWnBlaqOGfXFAnyWXnh
	 bEnh9R0096YyxBx0m3ad81nhvkLt1x2vkk9MLN++wzHBHLwu3JfeoD2ujl3cGl9UYcbef
	 4fKJYq1YxpDDB5MFM36/Rhg3GE6/StGFC5TPYAhWUlp0zHngHhkobMDazlqbvwLOwshaY
	 FhdV0HJVQ1bOZev+TUowY3YQ1DhNAG/hlVDtHTdzeG1ceyqLj+1T1zDb1WTK0BGROpuYM
	 lBh598OBgpLozBJYIqkUMk9cqWGkvUFZ5T12cJpz/VsyvPq7ZnlIdcs40lnELwyTBFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cx0p7bDA;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67AB606A332
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 11:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C67AB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cx0p7bDA
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36fb88ea38cso556895eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 03:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794050251; x=1794655051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaZSGZGlIIPoCOd1I0ste11xtmQPi8WmEaIUIAvrRn8=;
        b=Cx0p7bDA3F8PbgKgZFuQLORgMamvoHdpZDwGVHJOu1VynlCJsRppkzT+DduzZs3f/A
         luv+JhYbCBICt6ovhd/jYYzWA32azLdiwpjS6cOZ2F8HzP8N5JTCzpm+RSJnsLkd5iTk
         BetYDQbMfipGXaJDzqdzBEVhya2MfMyo64ryYp8UySXsHowGzhNYKcE4VjtGIWt7EVHF
         Z7IYnIodIXoG+F3vRCIJE9SKhuU8uPM+li2k/ZdGU0iJ4o5X0ODQ7YMir8tBrW5nXudr
         uBSS8ObNLHws+lt2r3WmrZYZcr3J/mj6guz+PxmwLlDylDtauBPbeqrhswh0njsopGea
         G1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794050251; x=1794655051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zaZSGZGlIIPoCOd1I0ste11xtmQPi8WmEaIUIAvrRn8=;
        b=hTZxHr8tCmkvrgcoFBtivagBq+9YrZ5w6OYnHVTQIDpyCZegshgNljXdW99mJWCZTv
         Bz6ka3er+LOw90d0PdoaEoVfGTH3R3IBLOjG9JOtzw6ShTWK/ZMjgrNC91Tnosfewhgn
         ane762VZ5SfSj6rHSEWt8OHYQl1u/DgfgaaUiePHf28KIVNxkEmFTNYBhlfsPCvUvkgo
         HZCotVgAA8sDh2NtQHAdaCHNGIxBqqTffePyKSuSgN3IW8PHHGTwWKRDG/QnXSUzRGBE
         hYzA5WBsaPP8rVeqjZz01IQ/4oHMShebPFZQjuhZlLokn/Md3kmXP1VOFNkJM2FwKuk3
         CIQA==
X-Forwarded-Encrypted: i=1; AL+hErEfSUTXKBHS+/xjQ54a25kLXGRFn+9rGH0NWznUD1Tr09OUghz6BbtgrE3FLvprkMW+4XOxHx0SCjX8RJs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HAUeox4qk5oUOWyIkRDmewKGLCfSNOorCCrZFmWvn7lrxUZkA
	hob4uAij0vrEXJ5P3HJJ5A8t1D/nY4NXDpg8P6a5hcqkNB3z1LjVzO4K
X-Gm-Gg: AYBFou2KgVOi3vRh+yhdT08dlyYUm8NuraGeAOjp7tKc8Oeqn05j3Kn1ZHl7jsslHFR
	GUgXwObpcey/8MKdx3PVN+z+GgDbwBEaIBaIDUDL2XsVsGYTPyCqsnQ9fBIzU7hoS1ZjnfOsjPS
	KZI4bwzQnvVF+RZLpFyXe3SL6IrBp/FvruknYLrKmdFh21sfUHNB01wmFnvfGQjcZ2mP7Kp6cww
	UtAMMSJP+UFR3bJSKFjuWdgre1xple8QO+77G+zxPJ+os2LAFEisOVsZb/rnQVACtHwDnglV0tR
	a41bJ/D31T+wWP8E6sJJ2uOEWs0QQr1sqTAa47hR3tNN8s8wy8R1y0ItqDyqRPujuTj94uavreF
	lVZbk+sP5XvzKrZj9TfWaOwPZ5WzHOlUx2A8N6wjND7+K7h7g6xnv7Og3JJJj11cmRINIz4CXpD
	RW+c67+/uPfIGpnC2eTcoZHbfDLOVEQGCgVAZLd0D+qdZqhSMNUP5TYMpMudmQSHBLHsrKtUXTi
	6bmLt+uG//Rrmdu7GHDXX/Fd0S+rALfE6wpVFq92ZOqxGXwPzbdysvlUWRPNLopsnwiVGIjKaVB
	vD3Tc61xOh+D9T8fQdgyuUYUn0cMnLyQLXB4qN45ZGnFEH1qtvPiwIVFaRaQobnoxlRfO/paiKk
	FMOwoYvXvvKyhTSEu5MD/w75LoQxLHG03pUYRbaZBLYy8uuOeA21vOpkON4fKn2qaS2C4tosTsm
	/BiTh/qYLzWBFsu2Ec7vZGLCMzjYzQRQXUN3EfnRtdZNU=
X-Received: by 2002:a05:7301:719b:b0:36c:a39e:fcf9 with SMTP id 5a478bee46e88-370f5150135mr2891995eec.8.1794050250700;
        Sat, 07 Nov 2026 03:17:30 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9fd0000sm13284120eec.21.2026.11.07.03.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:17:30 -0800 (PST)
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
Subject: [PATCH 2/2] iio: proximity: sx9360: reject unsupported hardware gain values
Date: Sat,  7 Nov 2026 16:47:04 +0530
Message-ID: <20261107111710.442318-3-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107111710.442318-1-kapoorarnav43@gmail.com>
References: <20261107111710.442318-1-kapoorarnav43@gmail.com>
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

sx9360_write_gain() passes any value from userspace to ilog2() and then
FIELD_PREP() into the 3-bit PROX_CTRL0 gain field without checking it.
Only gains of 1, 2, 4 and 8 are supported (and listed in
hardwaregain_available), but other values are not rejected:

  - 3, 5, 6, 7 are rounded down to the next power of two;
  - 16 to 128 write gain codes 4 to 7, which the driver does not
    advertise, and the next read reports gains of 16 to 128;
  - 256 and larger wrap around in the field, e.g. 256 sets a gain of 1;
  - 0 and negative values write code 7 (read back as 128), because
    ilog2(0) is -1 and a negative int becomes a large unsigned value.

The write returns success in every case.

Return -EINVAL for anything other than 1, 2, 4 or 8.

Fixes: 1cdb4c47f7f5 ("iio:proximity:sx9360: Add sx9360 support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9360.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iio/proximity/sx9360.c b/drivers/iio/proximity/sx9360.c
index 2a9b37df8f62..c6e5b3e557bb 100644
--- a/drivers/iio/proximity/sx9360.c
+++ b/drivers/iio/proximity/sx9360.c
@@ -625,6 +625,9 @@ static int sx9360_write_gain(struct sx_common_data *data,
 {
 	unsigned int gain, reg;
 
+	if (val <= 0 || val > 8 || !is_power_of_2(val))
+		return -EINVAL;
+
 	gain = ilog2(val);
 	reg = SX9360_REG_PROX_CTRL0_PHR + chan->channel;
 	gain = FIELD_PREP(SX9360_REG_PROX_CTRL0_GAIN_MASK, gain);
-- 
2.53.0

