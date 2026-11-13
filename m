Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567721;
	b=fbBb4th4q6DTnEVwTUUUGjOQcIMEyCr4xWnrWZJP3TPaYTuIGLxwhy4xMNmcAGBwa5Rn
	 2XQu02M1bH0Rsha6fFjjaWSTA469JsPXV0b0hD9otXJ6QFch+PRrJE0Ls7sCxmU1O/W3R
	 rGhRZpTDK4Rm8VoSAAPZUgLjKEA9u8UhAXwOQGuDUYz/SqY0FbZfzACany36sSPkMDSfH
	 7u3ULlxWkDoK+ghdmzSMQ+wG48T1PZOykGDdYS+NSZaK+6ic+gleDF/XjLLlJmtLMOQ4F
	 HXhGgQIlwBw6gCu+cPg3QwgOCqxKurIoX+Tz77C+D0efrHejtgUm1jlXR0UsAcK48Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XrQXIIJcWWHsCurNHxzIBKzj+WWkbswf8BCsQIq75cU=;
	b=iuKGkjMRzrqyrY186pd1XDL1/ySPFPFRa+7LtBbBw3FipoqLXy1Xr4QvYbJ9lOOKVpvt
	 sg7mIYcB5FMZA5K3nVIECXKtabNDU8289CQh6u8m6zlJDZTmOIggE8eOGNg+fPTjlbTmi
	 uhHSjHBDk5WV9uaqu/Gq0O1v78AzPf5/vk4wSaWKUgUPE2fZXStA6vEOLgyX6tcnUCI3I
	 uzskjNwhqWbDdvz8TApu2xIuAXXeU/7isBAEy5SMXJxwm19EPdkKw0kxd0z+qGNRFTWz5
	 lXaPvUXNrOPqWmQcCknqDZxTOT0n60mS2GZEwGywMu67pDSIqsFw7Jhb+W7jadiythA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QoScEWo5;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D6E606A8A5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1D6E606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QoScEWo5
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so1036856eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794567720; x=1795172520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XrQXIIJcWWHsCurNHxzIBKzj+WWkbswf8BCsQIq75cU=;
        b=QoScEWo5v5xuUnykj2i71ZG+ixB3qmy6gmDh7j7qPyzKZvXBsWfvMPfrLtSxyebLTT
         ghm6WSr7XDsuwPgIK7yq45JM4MHJ2vIE+/8wAaeeBtsZ9l0jEgqqIlq/rP2GWnm+fRPi
         JObAx1icFUlLtPFfEwLZloJ+W9ju50CTzX/l7uck2J4xciCb6OQqqEKgSxnDt02I9UUl
         CIEx+fsRa6YcOn8RgWCnHYDvaqFMjbOrZpfGYY1kQ84KU0XAHN7lbbLIvBm3xcuZArlD
         y3/wUPhhAP+D/Ar+qdspq5R7dEffAak32FxHfC8Z+RSODqd3vJdb1un6Z7R85iGfqCz/
         yA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567720; x=1795172520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrQXIIJcWWHsCurNHxzIBKzj+WWkbswf8BCsQIq75cU=;
        b=Ypfn5jA0x7lQyv9d17CRpG4K+A0hrz1xqnsZj/i1Fmodz7hs73+Wwg3K5WCAw7dM6I
         YwuMMbubsQi1m6RKYSz+KjSr1KJDr/1vc0jRHkPofz3OXlcRQvbg/xMUWWuUuNBOfak4
         dMtvojhv5t33188szy6/PX64gm29G05oMoH4Fbh1FUANuR68ZnLaoWMs9wIskK8aakr8
         vg275ChRePTNjCJCRJh0oCPRophzzWU6ivvG8PhIMmId/k8zIB2SQBsgR8cIX+F7G8YK
         iG/Rno0+e4+LRW6Bns0XwzI/fRhzniswgosSwaPSod8du47DGfdu8W0i2esR135rGDLA
         CduQ==
X-Forwarded-Encrypted: i=1; AL+hErGT1oi4ZEtgsPRuW8w1JlhfDXp3pzvne8lCmgJTcjK6HOLjXVSNyo761LhELeBDIbLMl6fjqTj+sQvAc+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HBSxqWjh8MUqzMuc4Vxx31JFeGXZ+5OiAZdl/LG0D8fZ1r+6H
	b+ZGKzrF6UAc8JDXf4MZl4qyhupv4yWoCaRFOm2phOLba2AddaUevx5d
X-Gm-Gg: AYBFou1vSehT+ylP9TaXGmh1ze7i6eB/JZBf4cdmGBvwDYRhom6dErkTiayPFd3lJlb
	KNbCM2x+0hCyHX8G9Yx4MEr68fUIZkgrhcN5fhhTDUc5AqkznU987AGn2H5JexAbn/6BJodoXvo
	HkL5e/uiHEBIw95JqySZ1LHimrnS34/IkwKvMm/XBRt8abLn4Glh32nBgWYxN9kNDjJmjIANr6/
	981huhKzV/HwYZ1dEszKz3wlXCumUacMNOK04PDBFzu9hmRnN+Bw/gtwGqH3p5KmImxdW+jEtHu
	8qugADKd97L6IUA5baZYI0TiFv91GdloVd/4wbqQg8Hq/sCGWixU3PCR9K73Tg9aBBJaDkpzO+4
	nkWP+LubV355+5dY9EbeDINWE8h9oQIHdI0v2HY4BXlT3hKdtLHO7PIKNOUQ1kNE3gcjlqsE3Dc
	4THAfHPhfgC7a7KzincAmLCdlaGE9gwRe8uXicS4Z/MIT0t3JrBtOIyMHoijhyIUZcbn3XElXPD
	9cMm1YMo7yk5i0tWN9dIauSmraGg23yhPny2XOr6wl/DO9bYefliS0qWllA8yhMMDgm+RKe02RO
	g6+PfNGWKXYtEtpVGaliZ0RoCSYgjP5qqNHiURgmzx5iQjs4Dy+eIWtDaX3MDVgALIdiFEPRv30
	wkp2jrVcUiynpIXSlRKs8Q5yXg1lCRZYm7mE3rA==
X-Received: by 2002:a05:7300:f794:b0:351:207d:bff4 with SMTP id 5a478bee46e88-37963376965mr1902056eec.4.1794567718572;
        Fri, 13 Nov 2026 03:01:58 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm6461589eec.10.2026.11.13.03.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:01:58 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Parthiban Nallathambi <pn@denx.de>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] iio: light: vcnl4035: Fix swapped raw channel readings
Date: Fri, 13 Nov 2026 11:01:23 +0000
Message-ID: <20261113110123.96084-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The IIO_LIGHT channel has channel number 0 and the IIO_INTENSITY
channel has channel number 1. vcnl4035_read_info_raw() selects the ALS
register for a nonzero channel number, so in_illuminance_raw returns
the white-channel sample and in_intensity_both_raw returns the ALS
sample. This also causes the illuminance scale to be applied to a
white-channel sample.

Select the ALS data register for IIO_LIGHT and the white data register
for the intensity channel.

Fixes: 55707294c4eb ("iio: light: Add support for vishay vcnl4035")
Link: https://www.vishay.com/docs/84251/vcnl4035x01.pdf
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/iio/light/vcnl4035.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/light/vcnl4035.c b/drivers/iio/light/vcnl4035.c
index f1cc75245001..4bbb3b458eb5 100644
--- a/drivers/iio/light/vcnl4035.c
+++ b/drivers/iio/light/vcnl4035.c
@@ -156,7 +156,7 @@ static int vcnl4035_read_info_raw(struct iio_dev *indio_dev,
 	if (!iio_device_claim_direct(indio_dev))
 		return -EBUSY;
 
-	if (chan->channel)
+	if (chan->type == IIO_LIGHT)
 		reg = VCNL4035_ALS_DATA;
 	else
 		reg = VCNL4035_WHITE_DATA;

base-commit: 9752760146e642f3e4a2ec860f8767fa72030d2c
