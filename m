Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BD9502D5B
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 23:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791328821; cv=none; b=cuvgFZqqdmRxQR9NnrCFH2hp0dAfVMz9OEaqi4YzDkz9To45as6QsIJQxAMte7lTWnoXg7diBiD1ahbkfAJUszuckbktRbI7uNY7KyQ3XGL3DzpHHcx+bFzxBhvzxB75qGsY9G5yGxca1EcUBYNZqUKbjHOI/kdXm2FqaWqS2No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791328821; c=relaxed/simple;
	bh=sjuSJIbwK+9pC3HVLoTkORP6Bqh+nlExjwmlTCp9g3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JMVZjgZuGRX9NGLLjDUdjO0ZM7JewpvJDlx8kkWIOY+hMsXb/ZFA1NIm+dbcHeFdJuhbyC+zWflA4aBaqngmUstAW9/89hbgRJ+pws28jE68pylQnhBasJ9T15xjFWIdySDGnneO/v905GwJ6NS/kYg1ZVDK4Vew7l6gZOwzFWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aGJhZRdD; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aGJhZRdD"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-34c4a0868b6so2973691eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 16:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791328800; x=1791933600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5PkD2yI0m8nq8ghTI9DLQE4m/ducagwKY3yX77vxrJc=;
        b=aGJhZRdDW5eLrX3v2DjljrW3xgONcUlq8NldUS/3tefLi689DpcrTfqS6LqK/oOAnf
         8xsIQqWGYkTypydnKyCO2RAfkRto9DW5yyaucFEyPvAASZwbcaMMG3hdcMDoS1PTNrI4
         AyiGqsYxCmRfnAI8ajwuyxF5skbvtNg3N9v08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791328800; x=1791933600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5PkD2yI0m8nq8ghTI9DLQE4m/ducagwKY3yX77vxrJc=;
        b=qsC1OO/jHNXbR4Rlv6Tm0TyyaZrnyGcTXHSrA4xevJ3SxpO3yCtlZzKvaA3htl3Ep8
         +zhUSz0FeMTrP7okHViLuwmuAmwdG55qsxzzT/h4r/jd2ywCkWMIXcT+orm7usWK1FXs
         s/cB7xsMSqngDe6nAx5TZagdnCspmv63yRGSdeugA3MVz06345Nnda+NgyDyKT6ubbaF
         wREg9M5CT4d4tUfmD7qMHsmEE/O72of8fRgbLWv/gReMKjl79+w5W3TiZhN+cGNVNzTh
         g0bHt/3JGuJoxvH7GjYDFvYFV9JwF6fKMgGqzIDoPxQDtiTJhmdT+Qt/aDvhR3zJ+ltR
         RXww==
X-Forwarded-Encrypted: i=1; AKwUvBwYJg8uNTsBlxpAxHaM/JAgqGZEzySiVpBMXGUwCA6IfbEc2d+xw6mELZJW5+5BTxTd3YGZOp+0nsKAZeI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsYvR8AgWMETEbz4W24RnjjAr6hObHO6cEI4JGgfkg2IZd6gJS
	LFXrIFoKJ4Y04E0lhfDmU4RIgPPUAdEIMBz+9ieM0mLkoNv+IBspZBoUfNdp29w4xA==
X-Gm-Gg: AYBFou1e1vGdR8uXRJMc0GrWJUWQYU99oWEMZbi81x2q9i02dfUeK3PtiefNKAV6rjz
	kOqBDydxg0g8djXKJf8JC+xr/OW+oeQly/7B0044d6l6ziu//8dF4hBQH1WaCr3z9Vgx8Z45ROz
	7hK1NpzuVEk/e+AsCv1nJQL+5hjg4vJWAOGBjBdbmfNoWOFPLAh06egFPlyMsQt8DkJQpL12FHY
	SiE5769YuHILt6QHz3s+BTCLhh8bYIz2nyFYVMe/njw4YLCLtSLR1BYa4/pZpAw9bd/ZqiTXvux
	59PafbhWAgFAfN51xLaYG2yG4MDnN6xEL/E1eNtZja2h5ympueauLhzJlp4ubJcdiBMEItem6iG
	oHpVcK8o7ihQgcFV0wbxDwJCxPbkLiInlnOxxnx1mE+xYqe+xyh6KaSxlbkG0lE9UHq0OruXJhF
	JpTs08sJCHKl9tlv/H3MFSGD79lGjL0Y9M+VspVYdGIt8wV0MamCJEu3ZJARU90WQYSAieUhUKK
	hbTMWrunmKZooxA5pEURRu/0WgY6rxgCc/auA==
X-Received: by 2002:a05:693c:839b:10b0:351:4708:9b61 with SMTP id 5a478bee46e88-35147089d49mr4409223eec.19.1791328799286;
        Tue, 06 Oct 2026 16:19:59 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:63eb:e7f9:1d47:7d47])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3515af511a5sm1977457eec.15.2026.10.06.16.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 16:19:58 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org
Subject: [PATCH 06/13] spi: ti-qspi: Discard pm_runtime_put_autosuspend() return value
Date: Tue,  6 Oct 2026 16:13:34 -0700
Message-ID: <20261006161337.6.Ia678a25bddd5942c7f3e11ff0eb807754d7e2aa2@changeid>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
In-Reply-To: <20261006231900.3230373-1-briannorris@chromium.org>
References: <20261006231900.3230373-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Failing SPI setup due to pm_runtime_put_autosuspend() returning a
negative value is not particularly useful.

Returning an error code from pm_runtime_put_autosuspend() merely means
that it has not queued up a timer or work item to check whether or not
the device can be suspended and there are many perfectly valid
situations in which that can happen, like after writing "on" to the
device's runtime PM "control" attribute in sysfs for one example.

Accordingly, update ti_qspi_setup() to simply discard the return value
of pm_runtime_put_autosuspend().

This will facilitate a planned change of the
pm_runtime_put_autosuspend() return type to void in the future, similar
to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
type to void").

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
This patch is independent of the rest of the series, except for the end
(changing the return type). I expect it can be applied by individual
maintainers, and we pick up the end once the dust is settled.

 drivers/spi/spi-ti-qspi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
index 34b154922ff2..63b9098ec8a2 100644
--- a/drivers/spi/spi-ti-qspi.c
+++ b/drivers/spi/spi-ti-qspi.c
@@ -158,11 +158,7 @@ static int ti_qspi_setup(struct spi_device *spi)
 		return ret;
 	}
 
-	ret = pm_runtime_put_autosuspend(qspi->dev);
-	if (ret < 0) {
-		dev_err(qspi->dev, "pm_runtime_put_autosuspend() failed\n");
-		return ret;
-	}
+	pm_runtime_put_autosuspend(qspi->dev);
 
 	return 0;
 }
-- 
2.56.0.360.g66cac248cb-goog

