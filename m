Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243142;
	b=aVpaCNHRyGCqKXugZWMF1CLc+d3PPVaDf3H+rHbd6yqJrZoW0RQvcKCJf3KeOB8vhnzY
	 OmlWgNY1N5c41Q+7NN/RXipFG0KCBZfW2v7dUamcNp+gL2UP3Vo5TJkSAynY+QxOwk3QZ
	 f0hTdfIQVJOsVYTQlPZC4sIUh4h1X6DZqteszZCXrfm7g9humllbzb3hQGunW5LVi41h6
	 QK9r3w1S53lWhJ7YRXDo4TmHmkFqdT5l+xJu5K9Cs6WC04qGKFMlRGcH4DRiDqTfv8Cbj
	 +F2BMkDVv+uyVgUA1IjJXlM5iO4DAD7eUVL126BIZ4S2xIkjeZscG6wGJtqUttHJM1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ySvK1Qww1m+6lBZm5Vkp2gRHrdkHvyjpb9ej1XMBokk=;
	b=Kv5Em9IH4lc3InFaD/8/JDz3KrU/d6hktu4t8eLfiq+R7uSG2iGUoAwgIak39Eh6MVfC
	 f9nKTBRG+hlZgoi4NJSIuo/4jzsNFL1MEcmf6lsuU8flkVniI1GXOb3fek8v85B6SaoSw
	 LnuxOQfkNZubkFUVu1wxFA8wjbCbV4cRbJM9jh5pwmNrNXC0mZqmxfwP8uH9AaCn19UHo
	 Zz6sKwAzj9EFAJxTD7IwVCYw/Fm4FrQPX5wT0yB09TXvkJiqfFjHJSjdleOQFDy1MC8V0
	 XL14RdITbfTZ+Badf/uYt3wmMiRy5JipQexCGuV1VKtP3fsyCaVhGEpeuqQANo2IR/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ieth6GAC;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42795606A33F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42795606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ieth6GAC
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-170135e43c7so1518173c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243141; x=1794847941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySvK1Qww1m+6lBZm5Vkp2gRHrdkHvyjpb9ej1XMBokk=;
        b=ieth6GACgAFU7Z++EedxO+r8dfIKama+UF4MIItnmJTMx2iBemeTr2SBX05lH/Vzl0
         EyXkX0FcgtltyDll3mo+iLBLoU83SmQ5azPBhnX0jOD8lsfk2G36X88BHu2L2p9OZlbj
         DIOkRKMvPt++9eApOA1l5sA3LfeWB6ph2NAT+NHlQht1rHt3hDZw88GaJOGJTTdeb9hv
         eFcVV0ApzhmLT/2BvKiaKw7FYhki7cA+V4yNsyS9iyzKJTarB3t3pkqyeoSN8quC352O
         dOotmaPPpPQgqko2W/X9DUa48dWrerHMbfZNxkOPvGEIQzZNFslYDDGKDhWoLGp20wy8
         d4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243141; x=1794847941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ySvK1Qww1m+6lBZm5Vkp2gRHrdkHvyjpb9ej1XMBokk=;
        b=LNd5HeSJuk+ajNbTA5ov7V1SplLN+PSTiARFzRnfsFGizVL1+fFGOP+2Y0MMocmmFT
         4v9Dxf1m0gggwdXg9PfzpAVInsAdJX34Ohvy0bDeNB+3jDdM8SG39wYO7DDHxFqKLzqb
         ITUpt6OY8vOOMWu4RMdseZBav8Q6VImkD9r1/IBmsXQ7rA811gIT0vpu6HCKyOaICpI0
         fMjVFmmQP+ZrascFCRL1FM6zfwP4Qc3NXuhSaUgohsQxg8PxU67CQWsfI9kXJSw8yRqn
         0t2qW4lLgfs5uGmmvcHNUDIbyjeriTwls4Cj2OV1N0GSf3L18doFqjdJnJ056D0pJnnq
         54Xw==
X-Forwarded-Encrypted: i=1; AL+hErG3+VGy9OJVPMx9XM0y0bs5hSWTR0S8nxis+vSM4r0HNFFwt4MhTlaiWjliG7Hi6u1qXkB61mZ3ghLyMkE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fV9FQ+RqVzEcY5anZdPuECzSRjwfX1j96o0lgEgHQBmP/Yhmt
	VuXH7soDl5CNS19izUhvvk5dULKXYQIQU0djWUkwIzjv3DsC8bhQu3Mi
X-Gm-Gg: AYBFou24AGvjfB3YUEci/vZKY3JoEIpi56jqhoPOn3wpYTJ4lo/YHK7H3mM3ANHn9rL
	4ReYgmPD60a0cbCIbJsDr6N56LB4kSxju/oSe8QkatyRUJ+2mXhWPv0ztiUnjnz5fViikxQRE8z
	uBIvbTCnd+06mmi14/hFKJ60cU+dge28W1rbhS4Wy1RGSHUVPhbRlPBclV2FZHI2bOl4yjAKK26
	HVNfi2NMqNtC5ZwkiiDfS4fZlHXaRQnCT0dG1mfen8xSpJW2/6HLIsQuy0OKEcmcdn6FGOB94wi
	qEbNclRB7LnNPKhfU6R9LTJhLd9+B54XLiQuYLGhPGbq2OYorfrHYuu8UEeJtGBmjl8PXZa1/BV
	yis6MG9TS0EZxy5O2cCUOM9tXmv6KklaBqeRoXiMo/ggPPCZdIY74Z3U7atOMgqsNT+qLamH1MY
	qdxhFlGlcq1Y7mIXJfI7AzkaDtw2wlO4r0CJBylJXHpE+vLbThqQeAEgKB1JW3M6SJE0DxOO1+T
	RH/UWiyDkvGYvvOQ09kb8clM8N0qnG1HjW7RNNFf41BfbBZayfd8FnGIAD3KoOPeRVbDvkv1Eqr
	q8XwATtEQpuxwrYmxUc3uya1i94tscl8xKe5RtC4uSlVP+E4VNtlPA+oDv82oYMwintJ8XoEDUB
	e5bngvOur7yobf2Od7S/kWkRQ1GcrcrYyBZkBkDX4QnxRmCnsrH7z0CyuQE4pJ/BpE2D9SRKxnx
	msgHZBYV7cvqAyZmAw6UAl2nX1qXZOqJgAMwR01MC9jXI=
X-Received: by 2002:a05:701a:ca05:b0:143:5266:48ee with SMTP id a92af1059eb24-1b3b6025e09mr15837c88.42.1794243141357;
        Mon, 09 Nov 2026 08:52:21 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm307041c88.3.2026.11.09.08.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:52:20 -0800 (PST)
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
Subject: [PATCH v2 2/2] iio: proximity: sx9360: reject out-of-range hardware gain values
Date: Mon,  9 Nov 2026 22:21:53 +0530
Message-ID: <20261109165200.305266-3-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109165200.305266-1-kapoorarnav43@gmail.com>
References: <20261109165200.305266-1-kapoorarnav43@gmail.com>
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

sx9360_write_gain() passes the value from userspace to ilog2() and then
FIELD_PREP() into the 3-bit PROX_CTRL0 gain field without checking it,
so some values silently program a gain unrelated to the one requested,
and the write still reports success:

  - 16 to 255 write gain codes 4 to 7, which the driver does not
    advertise, and the next read reports gains of 16 to 128;
  - 256 and larger wrap around in the field, e.g. 256 sets a gain of 1;
  - 0 and negative values write code 7 (read back as 128), because
    ilog2(0) is -1 and a negative int becomes a large unsigned value.

Return -EINVAL for values <= 0 and for values above the gain of 8 code.
FIELD_FIT() is not enough here, as the field also holds codes 4 to 7,
which the driver doesn't support. Values between the supported gains
of 1, 2, 4 and 8 are still rounded down, as before.

Fixes: 1cdb4c47f7f5 ("iio:proximity:sx9360: Add sx9360 support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9360.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iio/proximity/sx9360.c b/drivers/iio/proximity/sx9360.c
index 2a9b37df8f62..ede20dfcdd80 100644
--- a/drivers/iio/proximity/sx9360.c
+++ b/drivers/iio/proximity/sx9360.c
@@ -68,6 +68,7 @@
 #define SX9360_REG_PROX_CTRL0_PHM	0x41
 #define SX9360_REG_PROX_CTRL0_GAIN_MASK	GENMASK(5, 3)
 #define SX9360_REG_PROX_CTRL0_GAIN_1		0x80
+#define SX9360_REG_PROX_CTRL0_GAIN_8		0x3
 #define SX9360_REG_PROX_CTRL0_RAWFILT_MASK	GENMASK(2, 0)
 #define SX9360_REG_PROX_CTRL0_RAWFILT_1P50	0x01
 #define SX9360_REG_PROX_CTRL1		0x42
@@ -625,7 +626,13 @@ static int sx9360_write_gain(struct sx_common_data *data,
 {
 	unsigned int gain, reg;
 
+	if (val <= 0)
+		return -EINVAL;
+
 	gain = ilog2(val);
+	if (gain > SX9360_REG_PROX_CTRL0_GAIN_8)
+		return -EINVAL;
+
 	reg = SX9360_REG_PROX_CTRL0_PHR + chan->channel;
 	gain = FIELD_PREP(SX9360_REG_PROX_CTRL0_GAIN_MASK, gain);
 
-- 
2.53.0

