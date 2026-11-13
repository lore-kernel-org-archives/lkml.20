Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608784;
	b=ehsgliHbJ3/MLwW/1bblG8FYh9WsNa0LngnOZ/HgQpJY0Mz++JxAVFUq7O8U0Wy7Cz+7
	 Jcm9wD5u03ajmhGtzgcHvo6EBPPRyK9jYvg4n4Z11PL7rgICeVD/Mfz1TYoMQ6qSk0nbs
	 0KL93LM1sYJfDcOei8gwZ3IdOIKzSPNxlETRpzxKhK+TheUsyznxatoqBPAZcuodtIRUh
	 hoXmr/bj1PsYLV6XJn7LQoTYdd4DeGYu56XWqI2DQ70ZJa/p3M4C/uC3oEiPxmRqtKB3X
	 MRRZgyDxPRisKlB/w7MK8/2Bmfm73PKAK87oqe7vmOhikqLcM1mLLC3gy/a0qKMu5qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FJtZRjKgFg90uSeT2CbjH35DbAO/VLflNjScs874eM0=;
	b=JIqJRtxNfGY3198a9/BGtMFu9Ytw7lFzyb756x4SC4BDQxs6YdRwi+UD4RPeJZrx99js
	 sdZAr2kz9ga7CIGl5eAoutn1nOusnRx2ctk9NVP4jltOWezpsshbdKMyVV87Obcw7z63Y
	 OdH9R4y2eqEnvGA/pBQYtVodgsA4v2Ds8xhqko7dsO3z0B02tP9l3rSfrqfURDMD2oqye
	 8NGICgFPv/s6H3/lV/9QdYahsm3YnTDxP1MjNvkB6DpTOpsWdz18HvmEgKHlwSvkoq8Sl
	 G5UJo60EDp4eiWIww/mRseYVPcotpRymPdyxhS0WcRT2vY64AhAlsWi+mK3AHepz6mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LW7hNVN1;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEEF606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBEEF606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LW7hNVN1
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so1536097eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794608783; x=1795213583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FJtZRjKgFg90uSeT2CbjH35DbAO/VLflNjScs874eM0=;
        b=LW7hNVN1/QnvVg3UkSRF0jxLpcaRrLGgFRFHtoTIp+6N3hBqKASEMnp3c3ONAYNXIB
         7jBo9XudgJ8EIkIEllsKdLrMfSlZRyLVJdZ8ZTm4YPL9UDgC5a86mS9iNltY3TeJoPQq
         VIYQCAoJTy5pBvL9AXkZaPvnWvf5MWdM2LDqxvOyDnAgJn+LxqCq0jRm+igqA7BFh9ee
         4rIw+phy0fECX1Kjyis2LvKy5JFSMAIsW9ExuxQ4LGct2uLxK5UdUYSNoDKGAeGQwdAY
         qsBhs3qGX8pZeKwd/bXuBSewMym9Ays/JuRaznUEQdh1lliYtVopM+5/hBAuCyf0gjTl
         Beuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608783; x=1795213583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJtZRjKgFg90uSeT2CbjH35DbAO/VLflNjScs874eM0=;
        b=D4zdBXugRHViFv2U3kmugUVeI/3MqhjiqUIAKygtuKateIqtQIKqAJ7bMtXakJG6dv
         R5uIyVr9BrkRJ550bt3AsiD1P2drP1hg4OCnZJN0bcKpUW/9oeWYAm63Wt0fTJj3CWPR
         Xmka3fgb1HTH53w6ZdC9Ik9P1tzrqsUIvolQm7pN9RHPkrTp9HmJ8lnMEI8QjX3T5VVP
         a+nDeVmb9dVyr25SBezT0DX9r1ZFgoCc9Q7uUFyhsuBFGrOjMlkZQLD/ZPJ03GEBh0uI
         zc+x16IlUiGCBdLneuTrZP6eLiWEsNia+/9xOAogsfS9KS+5DpVWP1PL+cJaJed44zaA
         uQZQ==
X-Forwarded-Encrypted: i=1; AL+hErFBVY5pc2D3ReoTz6nIQ+51XiHOf/SslceitM8BRvJv2V3E6YrPCsYlFihTNY1wYriiKozNVmU69ARqei8=@vger.kernel.org
X-Gm-Message-State: APuU4Z81JHHHQwDiBTsBsTr+ndDjtu8WjSVujnEl2pABIiXfR6ZL8plM
	sEsKJgbj1iJt1ymchu4A4leVoifB9PKjS08O3hwXO2tLqplzdH+ucB+U
X-Gm-Gg: AYBFou0AHZ5PQxCGMsyxzj6tbTMe/OVxKYuWUimcbkJ5iyrADa5E1kRDLaHz9Y+ZEHq
	u0c9urrTwNOasnXtAQwK6kMTMT/fex7LsjNy2GZubvVXSi15FVAN/swVNLZHA5SZZB4JJ7obUp3
	6UgaOblLRJyZDWwHU43ApRRcBomDFxJDUguTxuuZG0JA810m/+GqkCdjO7pVh9J2AgsH14+KXOV
	ai5ttxNP/gsFi5H8+5SZ9sVMp5i+7Bf4/WMvQRq1K++c9Cb6LElZgvpZXTWzEKTz1P2sJG142HA
	/z+NXUMr4iLeyCx3kyWAgqZ5qRk4hLTYesIDXzQ/vDDc4xzMQNAxgedmIKgUf8QumhRbxQiKwJQ
	X6aJu81CtY8V5sQZjA8VsiXO/ML/d4tiZblk8YxJSYYj8EnQAaeKotJ5u+Lwkdlq0QL8UdT3NwW
	b+k1S8QJd4XQ50ML7XI3lPdGxjsLRcRyIObNpwBkmNs0rHivnwj1nhb4g2H2UgyuMcZE8WYV35y
	fcFknSboK0zawdvLAFHhY3GY4o//WLyJAOomKEl2ZUZ0fkXHrXBgQhOSy0g3NfkoO2Iabo/7Jjx
	J1fCkmQ9E4xqxvvZ5/fA9nVNkET82Etfz9DAekTvrUGl9VgZF2xGo1CWHyATM2owGfjtJTSXlXv
	pnP1oK3G7bXqtAzm71eDSur4Pgc3dAlXaFnnB/tsdlaN8Mi2Q+62ATcbkfXk=
X-Received: by 2002:a05:693c:3e0a:b0:36b:d3dd:2e9d with SMTP id 5a478bee46e88-37966192e10mr3194904eec.19.1794608782828;
        Fri, 13 Nov 2026 14:26:22 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm17151380eec.21.2026.11.13.14.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 14:26:22 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Parthiban Nallathambi <parthiban@linumiz.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] iio: light: vcnl4035: Fix swapped raw channel readings
Date: Fri, 13 Nov 2026 22:26:09 +0000
Message-ID: <20261113222609.97564-1-dennylin0707@gmail.com>
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

Table 13 of the VCNL4035X01 datasheet [1] lists 0x0b as the ALS
data register and 0x0c as the white data register.

Select the ALS data register for IIO_LIGHT and the white data register
for the intensity channel.

Fixes: 55707294c4eb ("iio: light: Add support for vishay vcnl4035")
Link: https://www.vishay.com/docs/84251/vcnl4035x01.pdf [1]
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Reference the datasheet's register table in the commit message.

v1: https://lore.kernel.org/r/20261113110123.96084-1-dennylin0707@gmail.com/

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
