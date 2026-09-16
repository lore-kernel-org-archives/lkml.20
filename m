Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08729368D51
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789538518; cv=none; b=n6FV2kIBnFxNWdJxHJ0hv9S7HaF2Nal6koSQWCLxho3RHltxX+X6sfUwsjmcDN9olDuG017Lv1XCRKIesxw623XTN4SqXFszeIcBGTNWB+kY/wpjpIJItYM2vA161Z9HMFAPa7NXmy03VMOX09Jzu/aabOPsHncXpx6gLNcmfo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789538518; c=relaxed/simple;
	bh=bMlyefeZy1oYp1vQJXlNNt86+odm9DEd0tpgl/S9jjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ftPG8R/cFZ6h4x8Ip+NscAZW8IpCWvA/TFCHlvtrYTEMn/FFwwFIsI5ir+kyE4w1Z/WeikouX1XfVQpLxtNQ1xDBnO+IrhcilSwGm2tMRClNgV2FXHLmIqmQo1Wv+ESf9Vv6XzxcCMsgunmyQmXl9wymc9V390Cm9TOn9FHOG68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTnn0pID; arc=none smtp.client-ip=74.125.231.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTnn0pID"
Received: by mail-oo2-f0.google.com with SMTP id 006d021491bc7-6a3900cb2b5so2284612eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789538516; x=1790143316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f0l0dOxlq9FIh83bio/Qt5t25oXlLyhJQqJEQz9jJzI=;
        b=JTnn0pIDeRzQ7R2pCNHq5Io2Jkuk4nJpHpgBWYbVlAe4+5Tijjt8tf5/Ve1w/WRoim
         KfNH2k5WR0j50pqgfy4HBodc2RUzjpU0KnbN7Yah6bQpBYqkhfnLnk9gmnsnzJ+vI57R
         LXPjc5W/AUTid3xwP/KcyqVx99htkrqYfrXHKaMfw3NUU4YgDnJdh6nKl1GMiijsz5Pe
         qRDEfd8FKoZZ5ObBdbeLxMf5hp2qFHSUSTREjZKIPhk3ST8L4xmCYqUAcE80GkcApmpD
         8k+bfVCJ2B974tlPgUDlzlaGuDBsmGqJeCUYLD3RtdOkU1gDFDo2gcZY4tKGd48Xwqu/
         xSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538516; x=1790143316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f0l0dOxlq9FIh83bio/Qt5t25oXlLyhJQqJEQz9jJzI=;
        b=lNm4FB51Cvys6wvZgUop30UZVTddQM7XgeYjZBltPTHQpsY5H9Ss22XZdJq+natCLM
         WJK15QtUoa4zrWPvNzjKXyRudjzraxrpsDED73+kfqe8UFeb6WCyFsi2uFtg/g4aCvzg
         VqY/TVjYrF+PfxhYNw5ULF9bXFKJtE4ms603bZZlyV89Y361hUjDQZXDKWCwEIg9ZqMf
         LwL259/GjHCguMhNoQoTUdQXEO8hiG4M0Bv3Lv/XvxkHNR82Kml4G7B2MMwnQYnf9DPs
         9Xsp12vBGWa9vhYI1QncMBF/+R+lIlZgMijlESIETBpqbsIJO88JGwHaPuXXSX1kVqLu
         +/FA==
X-Forwarded-Encrypted: i=1; AKwUvBwED/TNUZ1wRV+SO2JG86hDrSEFqY05xSj/+QkPzZBHrfBJmNwzkuIMgset1CZM6JlglXl9pPJG4jKTrN4=@vger.kernel.org
X-Gm-Message-State: AFuF++libsBhop2UjvVg5qxofhBGOP1FvJotE4FJreIbLUWQbkxE0sLL
	tPwONMIqqnlgluRYLJx6rgPlrhOwq0M7UNNQySiGnmkRXxy6hd7DhNqIgxn1DVkoOoA=
X-Gm-Gg: AYBFou2NpHq3utk2Om2qjDg3N+RM6504KzajnxWPSC+dMy5BHezVzBKImTV4ilvJAIv
	xYRV+h32mfaOPKk4xzfOHs2lPWMU8GZknhP8tAegO2FASGA2D4STFi3CoFi//9aaNH3Wj3I0UNK
	Ue/loD2Feui22CNQIn/Hi3CIBadYWeBrzReteDB0BqsNU4zUoNBrG0UFsI6YX5QxLhJItGUx6fC
	e6Ltdl4GEbTYgfSh7cAiRt8qHenBoVuRXHdBdxit4idWDJMX+H376+Pm9S1Lq8zexQK2mjXsJeL
	KaCjzeVKYxTuiZXAt7XvWHMBbyoJvxFAJdymFKGbkJxO9QkgQoWHdBwByp1KQnoWRsHIfhoN2vV
	RJwOpQW3a0SXrQnX3jdVQPKoPkH1QWtmWJmmjXrXl4Hg3NT7NUI4kCyNuX25XJ2KnD9yNBQak+z
	+efWq18QhFgRGPklPvCEckyIOwZTDso/TcI1WDnz0qI/acTvaf5thsmx8lMYQJn5r8214D6oFrc
	hVrPnp9mLqbhF4THaRv+4tJF6FGSA==
X-Received: by 2002:a4a:ee0c:0:b0:6b7:8415:d78b with SMTP id 006d021491bc7-6c7d3206a47mr1566149eaf.54.1789538515822;
        Tue, 15 Sep 2026 23:01:55 -0700 (PDT)
Received: from DESKTOP-M0MLFVC.localdomain ([165.99.41.153])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm5150929eec.14.2026.09.15.23.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:01:55 -0700 (PDT)
From: Shehryar Ahmad <shehryar.amd@gmail.com>
To: linux-iio@vger.kernel.org,
	linux@analog.com,
	linux-kernel@vger.kernel.org
Cc: Shehryar Ahmad <shehryar.amd@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>
Subject: [PATCH v3 3/7] iio: accel: adis16201: add OF device ID table
Date: Wed, 16 Sep 2026 10:55:33 +0500
Message-ID: <20260916055547.15206-4-shehryar.amd@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916055547.15206-1-shehryar.amd@gmail.com>
References: <20260916055547.15206-1-shehryar.amd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add of_device_id table for adis16201 and register it with
MODULE_DEVICE_TABLE() to enable device tree based matching.

Signed-off-by: Shehryar Ahmad <shehryar.amd@gmail.com>
---
 drivers/iio/accel/adis16201.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iio/accel/adis16201.c b/drivers/iio/accel/adis16201.c
index 2b76a6b3d..cbac23d4d 100644
--- a/drivers/iio/accel/adis16201.c
+++ b/drivers/iio/accel/adis16201.c
@@ -288,6 +288,12 @@ static int adis16201_probe(struct spi_device *spi)
 	return devm_iio_device_register(&spi->dev, indio_dev);
 }
 
+static const struct of_device_id adis16201_of_match[] = {
+	{ .compatible = "adi,adis16201" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, adis16201_of_match);
+
 static const struct spi_device_id adis16201_ids[] = {
 	{ .name = "adis16201" },
 	{ }
@@ -297,6 +303,7 @@ MODULE_DEVICE_TABLE(spi, adis16201_ids);
 static struct spi_driver adis16201_driver = {
 	.driver = {
 		.name = "adis16201",
+		.of_match_table = adis16201_of_match,
 	},
 	.probe = adis16201_probe,
 	.id_table = adis16201_ids,
-- 
2.43.0

