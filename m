Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062133;
	b=24N+3JSjgYfcapsHdtpQHmCfZ/vODNYG9MRrcGzOgfy4+fgPRZE27r8CkC8Fb6Ph/2vY
	 W0S5RkyC5pdC6y9fRxN7kPB++McYxrOXIpvpfBJhozv1gwK+nzpSQ7EA3CYS0GY2hI0QB
	 0hy12Y8v1pVAfLR8gXkmUlMEEvzpergFgv+1+WlYOfBIfne0vlJ2L8UdlnSxbWjrG7iqp
	 yeaPvfId+6NspfoJzVltwjTPN6t3+7gJLyfdQ0Im6nksGeCiLgkgZk+vOv4Xz+kXJX8Vd
	 enjTjT7pzyEGswap7kw4TByW/8r8Vevq98o+JWujjTRn5GALemLd+UF6JyqjBjktozg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=om0lfBri/dXE7qTmJH3bJ/Ln1rG6l10M7qtS9OoQ7+Q=;
	b=K6wU5Qf2GNzpr7GFE3fAR57aMVK9aNcuoLwpF6t5ALMnbs8pI5oe5wdRACAaAX4RvSdl
	 YRq/Pfk5p6qKgP4ouxo1FrQhxoaOmUOYpLFp1AZAHxmza2KBroyVUsU50sFAyNaHkKDLa
	 43JfDwTw640wEwd9Zmgcl2vCAJReya4yozNrR7bvi5WfwY5LXh5/R535J5u4PmGO6CdSK
	 KAPJoO7tNo2Hq/rmkDDZp3hC74xtlXDDMLaPtgSooWKnItxlhKm1Gjerm6DPDhzHpkJXE
	 U62O28w7PsjzLn/kn8B+F9enQjFhAKl6kuTcV6sQYRecGvdzN2Ze7YcnlMG1ff1zztw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ziGVGLMN;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170AE60A6F6F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 170AE60A6F6F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ziGVGLMN
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a315ed211so611920eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794062132; x=1794666932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=om0lfBri/dXE7qTmJH3bJ/Ln1rG6l10M7qtS9OoQ7+Q=;
        b=ziGVGLMNqUXQ8U1VTnRfThG3jVh8zg93kbmZORlw+G00NUSv2Xyn9S6KehkD0MkNf8
         g0DxZTEgo+8pZNX4yv49xVvnm0/ERfrS6fOmz5CrYcpTLDcCE3V+HWbZtzItXWG2YNCo
         l8KairNlDZJ7wUe6LyMgxJuJXRxAd7lhJDrU49ly9tP7uqhAbsIF+gLESXnAad2nR8fy
         LiyPbL3RkoFfX4x3N2CcXX83TP6XvwahBaV5AyHjdaJ97gDoP6r8X3AvqGOa6JoyXBvN
         QhMxhPSGPK0Zla344a+w1/06khlHjhAH8cgYsX9xgaVLPx0Tsgd/NPVXdvyuURQ5cFbP
         sxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794062132; x=1794666932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=om0lfBri/dXE7qTmJH3bJ/Ln1rG6l10M7qtS9OoQ7+Q=;
        b=WRocauid6wt/qVceT8cqY66R4+2SwmFToVPrAEfwJ6tz+8CMz/f0B2fDkcCFRqHk3j
         xxYITC8+lgiOIP6M3AQl8BJ5AD7sKoEjYxZie4qZNXU8iZdivU0nVSYdPUDOFGgp/W87
         oAM3xTo2dXrpZBd2soa6RYBZfg0KLYPjr4hOzRieJxWBH+dRYAyMjTi/j8eD8wiQYa/+
         cHrZ+LrFqqaODjGirPqeNPl2Xkp9m89LsxLid0lrTovMJBrC2CeenRviUEvtOH0RAhET
         VCbC6dPREZgyXlPJkm5m8ruoXTxYkCvMbDFh4YH+W4exvWBnc6U1yt+70TsfdxILKYdQ
         CDDA==
X-Forwarded-Encrypted: i=1; AKwUvByENKTeWYcAgEu0cvvUmjTrIWpBAmQa34tQEFVDZgnPYBJtnMfL5Z0Luz2FhOH0lWgD61NFmWb3q4UjPM0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/T08/bB1XnFKRWAqMe7pnmZJFHBHx4DjAsFGnEfS5t8eMYEECx
	WvZ40kQ4HXOzDffGvf+Hjsr4PFzjnCb6qty8OfbJOOGIGRtkiIFpw5YH
X-Gm-Gg: AYBFou146bF4VbjmB++KXanQUkffuyk9woBBsWKhFQ/D/0Yy2+bamOS+oRdUZpIRLoM
	H+3/os1PqPQqTY/dKwEygI6viAFLF35lTVCKuWqEjdRnCzlT0JqAxLQ7TjGnDCyzhvEtsVZN2zZ
	nGn8PlWYQQPnBUljOcGQq0ticd/gaeyFAd/e8i0vPBmhE6XkCM4y+FTRCSOWllIN1/VaqX35Ife
	ZjXiQXUkLZReyixTxZHNpOs6YR9o7VrNIezma97sOwApj//oD9HNgPYrdX86uirEaMo3vJjN7NW
	byuP12PEC3H2qpByIUDRUyERWwDrR1QVO4Y3uDXyTq7KO00ORBYRroz0p1NNOFVwB/jlNWirpE+
	me6YbDaydPEPL1CQb2veWwu0Ik+efxJTQJqF+ZRwW5eJ6kMC3GA+2uZJ2TvaeQhTqLF2vke4qTO
	/8p0NyeayKm1M4aYq/Uf8CUrrRL/bCPWpOw9ZkNChemiB3l6RXjwIc9e2EWG4KP7buLyatR5zA5
	UyPAD2A588DWoGLuvXDM5qeH866xeZhJizTFO8iTaIX+U+xjLr7ViNbumJrKh9Okh5+vdifEnzD
	xrtioppEDWte4vFVIrBRHZNIuk3dCNtYGL455NzeAHKeyRPiQo2vgIGbXRkB9KvG7V4Z+hK34MH
	Tt8dQejWg23nYA9dc/Qqa9nSqFXtfO7bOmZt4Aa+UEusdGSJySdOJj2r6s4dv1oPTtDna/VNyr/
	Y6bWWqbs8NYYgWth2V62ZPT/hLkxj3Z/OQhPXDTUWUvA==
X-Received: by 2002:a05:7300:ce88:b0:36c:a351:fb31 with SMTP id 5a478bee46e88-370f6115d60mr3052748eec.7.1794062132061;
        Sat, 07 Nov 2026 06:35:32 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faac86a96sm16732990eec.29.2026.11.07.06.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:35:31 -0800 (PST)
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
Subject: [PATCH] iio: proximity: sx9310: fix semtech,proxraw-strength = <0>
Date: Sat,  7 Nov 2026 20:05:20 +0530
Message-ID: <20261107143523.465188-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The binding allows semtech,proxraw-strength values of 0, 2, 4 and 8,
where 0 turns the PROXRAW filter off and the others select a strength of
1 - 1/N, i.e. register codes 1 to 3.

sx9310_get_default_reg() converts the property with ilog2(raw). For 0,
ilog2() returns -1, which FIELD_PREP() masks to 3 in the 2-bit RAWFILT
field. A board that asks for the filter to be off therefore gets the
strongest filter, the same as semtech,proxraw-strength = <8>.

Keep 0 as register code 0.

Fixes: 5b19ca2c78a0 ("iio: sx9310: Set various settings from DT")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
No in-tree DT uses semtech,proxraw-strength = <0> (sc7180-trogdor-lazor
uses 8), so this only affects out-of-tree boards. I checked the
mapping with a userspace copy of the ilog2()/FIELD_PREP() conversion:
0 and 8 both give RAWFILT = 3 before this patch, 0 gives 0 after it.

Compile-tested only (W=1); I don't have SX9310 hardware.

 drivers/iio/proximity/sx9310.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index 2585b9c6fb69..a39277237d39 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -855,7 +855,8 @@ sx9310_get_default_reg(struct device *dev, int idx,
 		if (ret) {
 			raw = FIELD_GET(SX9310_REG_PROX_CTRL5_RAWFILT_MASK,
 					reg_def->def);
-		} else {
+		} else if (raw) {
+			/* 0 means off; 2, 4 and 8 are codes 1 to 3. */
 			raw = ilog2(raw);
 		}
 

base-commit: 340d44bdf9db0f095f99845b5ad8628781d79b6f
-- 
2.53.0

