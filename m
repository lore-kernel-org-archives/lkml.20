Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862422;
	b=G3g0E8AB4O8+xxUF1eX/vCZYViP8WLYQtFGZE/UWVgB/eY7N+9sszV8cmIUlQtQJG0c0
	 GceeI/SPaoV0Ez/EYv9q7qwYLX/Tvqt1/S1Gb+qdq6ym/4oiSQccZLjl/rQiwIdERZ+/p
	 mADj006yDAKt7LkTf25kr7Mtu6CIBIy3BoAkrAG7S8zfC4P4bTF4jCY4f68/rUD39QR3D
	 G0c+hM5LRIh+0zwfYPbpgujsQAyRS31fOOez+PQkt51GI/Nbfa9BD5uQy75hl/L3NOY6y
	 l4dna791S9cAKIK7uO8ou99xxZbHpRNZQk8RepGVGnfLfFnZfttwOQ0z8qAJ+Q/jfiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=et8BZDPK3IqwhJJygWhGMdcldXGkpkfpRn1M7UllLC8=;
	b=myrwkPJMvU1ze3Sg7gF9sgZ72xZ932F+riQZwNn+c9PJj4hqUd0NQfjc5VuBJcX4wWeD
	 MCNGVYiHfBz6uOlaoE31l//wcluhlsWG7RejFi9ueyUVAwol+otKtL4luK6T6fxmexXVD
	 O9fjHGNRvvuSThw7PgAhZFIzErAbbfSnRob6GJ1pNWo+8NSR2gH0EQjy+YjRCeQaeLtZU
	 PwoRS+UuTgyx/PVd13sxNODuTreUjzMF6vy6YT/SuSdYe5gIIsyide7GSb79iOeyBTA+g
	 A/ua5FVq79wxPXYHZgT/gHautZ0IkEOpB9275qjkG/X0n4EwLsjIWkbrKIWVT9Oh9cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zmpao8n3;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78AE606A338
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E78AE606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zmpao8n3
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b244fb7fffso4689465c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794862421; x=1795467221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=et8BZDPK3IqwhJJygWhGMdcldXGkpkfpRn1M7UllLC8=;
        b=zmpao8n3WNOs4kj5j6g6PlfLwITwpUjUxRTaTPV2pqSkv5rzZ2LJMWIZyVeM3Bm90z
         Wq8kumxBJnmunE+koK0CQN8uJogAyX2rNbAu39ZrrX5M/+nsjMPjqkEV2LWKyJKGeSTQ
         A7qfZV3/Fkht06AwfGV2sRU9u2DxHR4GbQJQnbxIly/hEF1AeBvCNcquXNeAZYzRx8br
         M6M1aQvDwYwWXfye6wSXJ790fl6qD17Ahwtv+vMn1j7imSlmI6b/Kc/PU2Gk5uVv31HF
         j2BM0PLPH8cctkt091hBpw6dd1S2aewoyeD35Lkd1gj61K/pG8ovRNmIW4dcYIYeZfKf
         UKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862421; x=1795467221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=et8BZDPK3IqwhJJygWhGMdcldXGkpkfpRn1M7UllLC8=;
        b=KY45OxW9iEKwaTe51ie6yPhTzRTbJreWE0QrP/FNLU3C2nun5aClhoofIM57ZmifUj
         WP39Kcb38oO6RC//2FoHqbAS9WhfHolfMoSqv1q3hiUEJ2YSJDPsFnejEfXseXAFbqmV
         molzU4Fb8oBQ1+2BRDrTCHdLTY4gfJxsqbCRAPfPvDhcXA+mqp0o78uMLMm8ejp65Aie
         TPogQUlC+l6TDAFdxjfsTX5rIQBLx4qqPTHW1U/XEgvTj9ziFBPlqATre+owVcLQMaVS
         ywrqS2IBCNLg2jbvoRTl580NopePcGttrnPinbKm/SFXTXb41Ag6Tztl5verxhkjEOsd
         r6eg==
X-Forwarded-Encrypted: i=1; AL+hErG3ODcde/FdGsz1AYOJb4X3rW4MfT0l6LpfGlaZlP0yvx/U63ks8m4eSDv1Zz0HBYm5CnrMHhp8r2NwJwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ki1sGqzwd0P7tgsif25rH9wHwCNzVJN/vkjhWZyW8462GyXa4
	ulod6MrrCnzgY91l4uIYMSVaOsbDSzGExCO+f1HXS9PtFVStbNOha4Jh
X-Gm-Gg: AYBFou3hNhBsP3JctjKPkFGfu52yLh1Ugi2JjnBr+MpHLSG4Fs+m9auhAqlSxI93FoO
	ak3Ihzn9KSxhFjrcmyyKxGFLHCee4AgG2iAPShmv+JdUYBaRjsPnqxsvtjrK6SN9aH9ArhZx7F5
	C3gpS/bLQ1X1m46c58RstswXtn579PoW6662iq3qab+SkD2yq30cw471aj7JLRVBmUsAJMbiFqU
	KCZTeQgc/TwMoQfhDkPVH8o1baUKAoAWqCqPpBF7PGI0gh2UM4kcmCCfoq+Ya4BJTL4mEfdF0+h
	mwNWyGRyluGkW97oE74g6EG4WfprWsImQYIul++hDFEHfywi3Cx+CwQifac03jk/fSfohT5WLG4
	gw0sdT8ItK7OxPD8fgoVExbxsRva0I3PavVF3yU0cHLzAtKloxjJvpOml2fywmDlSxS/8W2WYAH
	POdYVf+eSS+FuppXBLszm0dQ9AbvQklijTiUYFDagWFHsG1b5vwndTtpAerCGlEhRizsh2Gb/qh
	HWERldBKyK644ZZ7qcNqS21Uemzp31wHf1bQOMxZJI2kxM2cPHPX9+smHdvHYlJNfYWiIXlziyg
	LhlRUwqmSVzkfl4cb4z9tDhI8DQGIE8gAm1+17fuxafOrviOmsFfO+/GBbS3FLyW4LRr9DdxA2m
	NFOWi9uVFnSiVTLB/21Yi1Z2pAaf67+obVItflPBaDhd6HXjddkKnI3TmO3JFmfncRDXr3jG3n2
	FiuRrD3Llq5ziFeb/YamScBD37EgJqqaxr9cy7k2XbWg==
X-Received: by 2002:a05:701b:2608:b0:1b3:a22c:7f68 with SMTP id a92af1059eb24-1b50311d3d5mr9990641c88.29.1794862420977;
        Mon, 16 Nov 2026 12:53:40 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b524049e0asm15293497c88.4.2026.11.16.12.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:40 -0800 (PST)
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
Subject: [PATCH 2/6] iio: proximity: sx9324: fix proximity threshold writes
Date: Tue, 17 Nov 2026 02:23:10 +0530
Message-ID: <20261116205320.26070-3-kapoorarnav43@gmail.com>
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

sx9324_read_thresh() reports a PROX_THRESH code r as r for r <= 1 and as
r * r / 2 otherwise, but sx9324_write_thresh() converts back with
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

Fixes: 4c18a890dff8 ("iio:proximity:sx9324: Add SX9324 support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9324.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/sx9324.c b/drivers/iio/proximity/sx9324.c
index 93f9577bbda7..39760c92552b 100644
--- a/drivers/iio/proximity/sx9324.c
+++ b/drivers/iio/proximity/sx9324.c
@@ -617,8 +617,12 @@ static int sx9324_write_thresh(struct sx_common_data *data,
 
 	reg = SX9324_REG_PROX_CTRL6 + chan->channel / 2;
 
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

