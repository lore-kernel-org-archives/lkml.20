Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793433529;
	b=YaIlWrNGLY0uLTwxJGGwK+cl38QbpveVv0bEdJI/LOeRCf94u6NztyTkPIlwloxdrbRa
	 iKEyPzLFLW7yXSHBP4S+cwnu+7qbgdBxSyTF/PfX2Tbakxv8Hc3FhhG0lu4ksAtNtvikQ
	 tfLWwwv47LJ5JpXoFKaUzd2U84efqoXqfn1TVFwyGzWb8aAEnQVULznKr/4ljUxKeEKgz
	 kH2iDFpRZC5/0olM7wl4bfUbenvCGcM2lc/d/xjpecDBXZHpBXS0c0KjCvlUZuCtIfdTS
	 ravkG916OzpkcsjqLAxqE3eRrasF4W9jh+5jROVlJFlDgncy/eMPT6v1nVu6eeAcTnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793433529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YkC7yBaZrE2XAa9kIglc92DWg36i3099yYhR26+EG0M=;
	b=1bgy4pWcydOkHljrR8ZFtCbyiHT5TsMa6X74CZYZUXxt/iYPkzgMAzXwex9C5hROKfgG
	 T842y3NMUSO+JlS85Kj1j4TduO/HVJyGIQHG7E6YVaQtHIUVQcd3GZMWVQeG3IAypvlnf
	 AbhiT5IAZ17XeFPPc57W1meapKZ1raofpD9eDlCnGuprNXEelxwIE52NoZZ42AqWiZ2pF
	 LquVV7YJYt7RLh8xFdBNvo/sCk/38CFoK09fywwtHfCjmhq39ohCGvDmZiE05OTUnuG5H
	 6jeDtQwV5MjUKxoOvGuPPQABx9AWAN6XVtuGelgE7oZXl8PcttkqUzNjQOFK8Hu/iDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H0G3eb09;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAFC606A320
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AAFC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H0G3eb09
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-369f33df08eso2955327eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793433529; x=1794038329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YkC7yBaZrE2XAa9kIglc92DWg36i3099yYhR26+EG0M=;
        b=H0G3eb09ygcaFWSjKKmNKV+YORd7Smdlry6rmKBzidUhveLgb4ch9hs0W1HQ0lWXkf
         gpd59b93tk00qK4wRbOUf965w/GrwfhPnl0QW23PhLC4Q7C/mLgJfdTXtWzP+JAhTbYY
         zqX5vROdDRBoe+/qKApKHMCjsvHh/0sziWaSDGbIyUBANR55u+GwsdBcEDM6Jb/ayZHW
         yU4frhxTLGADCvBWMwtMZh00efdFSzLGAtq0gWVbgKkzcYrpDAh2ZPV9nleVWECwZEDj
         4qs4KYVpOsihEX9QCVonpWWVRtJjuS8xWlszLDMntU38l4OMZxg+/zNRCGOLBxVf8+4i
         F9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793433529; x=1794038329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YkC7yBaZrE2XAa9kIglc92DWg36i3099yYhR26+EG0M=;
        b=SvG2zYEkDTAkKvIT0+sUFveWL+0z4dqr4EVyXJZvHAZZCfP9CIAR5+vJYgyGrgvMLz
         lMs2/iP+F+ZXlHKxxGZ1pHoNOFyZIAqMi3P1sE8ES9AL5OCHSSZD7xzjVZqdIn1tLmUN
         g5FjtOP0wQ4diNwAA+OLwsv1WTf/IyarN80jmRx3cDotDwVl6pzME+Z4iM3IdNu4ZeH0
         4YVnKfE+6NlN9txUF0QJKSx91FeA2LtDTRT5W3gqLaJLBEGLdLyhEcq9G6IjJh0FMrBE
         hPW6YQ6wGJBWyg4jNBX492SmNXHnlK9RV0DHM/WqLVuBC1X0IppCQFWtr37NXN2It0qa
         5Rbw==
X-Forwarded-Encrypted: i=1; AKwUvByDXfj8838zUd2lbyIwH79bRslQE7Gy5sMy1AqKb7Rk20G+s4GiBv52XQNOqET1DTX2IC27DPk6tv3Qu1M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjBHQd9S4Fixg8sWoTmYdZHIxBEzPiALJd4bU9tgFFtWRYLm4c
	fG4r41udpwY5EWHtl+1eoi9nQBJX4HHHg5Mv2QNQIOVV8Or+hP9QL9YS
X-Gm-Gg: AYBFou2j2MA3DKIW2BHETJjmuTdo3ct3UEVPfX3dcabuKoM0nLd2SwAYnsKC8M2X3Ua
	R2KVK7BrJ+DNlx111Xj4TdgbC/yiu71SSdDbB2Yh+z/HNhBEEqAliPJ0Jy9v02wy1QMLKJCa1rY
	SVbCVIzGHQuA0Zjd/UUvxxn3HEv/OO+fVudXOAHxPirnnnJ2ySeub3ai64Gt4BfCNzv40J6m16G
	uuaQ5it5+vs1ddN9PE4Ppd4TF1uhiJs4iANRJto8cgbpoLfnQO1aj60wB2k+x+2XfRp04BZl6G6
	V5Zosx9cXn6LaqtVPFsPvriIHrqlekbkT3IJRBO3wxlLQW+8ZQozFjP88nrA3kwbJFHCAwdhChA
	yH7iLMphfVAk+bLcbnz8NTrpUYQQ1FYYXPQhFvwfJtAHK5sC69rTinKEv/lJOSzHUi1F09A61BV
	Sl7viDEcymXzRPYsDIMW3QxoyG++WBrFl13ui/mUq0720sw9ipi24OvHhsWyfZjW/K7Z44jxnWQ
	MKYcojXDaeSgSU/xoMdD1xDXOUAnApAQZnhYEvrDWlCmYOejTHsJaRqcwsCJYd9Oi5Ab3gQAT19
	3p0H11TB95+3iCSWLbSZaZvRMmbAu4LPGFNyOZjqWm4zFqRxZ/2FAlcC0g==
X-Received: by 2002:a05:693c:894f:20b0:369:d992:e3 with SMTP id 5a478bee46e88-36a4242b2ebmr6391012eec.32.1793433528497;
        Sat, 31 Oct 2026 00:58:48 -0700 (PDT)
Received: from archlinux ([2401:4900:ccca:8aae:db4f:18dc:62fa:a502])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af91bsm14275467eec.8.2026.10.31.00.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 00:58:48 -0700 (PDT)
From: Nithishvelan M <mnithishvelan@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux@analog.com,
	Nithishvelan M <mnithishvelan@gmail.com>
Subject: [PATCH RESEND] staging: iio: frequency: ad9832: use devm_mutex_init()
Date: Sat, 31 Oct 2026 13:28:14 +0530
Message-ID: <20261031075814.34379-1-mnithishvelan@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Replace mutex_init() with devm_mutex_init() in ad9832_probe() and
check its return value. The driver already uses devm_* helpers for
its other resources and has no remove() callback, so this ensures
the mutex is destroyed automatically on teardown when mutex
debugging is enabled.

No functional change intended. Compile-tested only.

Signed-off-by: Nithishvelan M <mnithishvelan@gmail.com>
---
Resending because the first mail carried the patch as an attachment
instead of inline. No changes to the patch itself.

 drivers/staging/iio/frequency/ad9832.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 35f823f24f..a90ee89803 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -325,7 +325,9 @@ static int ad9832_probe(struct spi_device *spi)
 		return PTR_ERR(st->mclk);
 
 	st->spi = spi;
-	mutex_init(&st->lock);
+	ret = devm_mutex_init(&spi->dev, &st->lock);
+	if (ret)
+		return ret;
 
 	indio_dev->name = spi_get_device_id(spi)->name;
 	indio_dev->info = &ad9832_info;
-- 
2.56.0

