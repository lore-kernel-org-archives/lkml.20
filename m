Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746E25172F3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788372; cv=none; b=LD1wpPAp1OtQVsDnt1qf9clfIwLZPfgo74dbiUzbeICkmBJXgZUyCzFSPU7Sja7k/x/Za/msrNVrnHdfEGm+ru9DU1gTk9yNbXtqCzJO9kTbkNH5jOBu30A4u2lCBUxMmuBeDpue/4Cc/7n1qiODiMB6JA55HheY6OGKsZQTAH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788372; c=relaxed/simple;
	bh=y3S9btysFhmyj0XZ91haKB9K3DUP7qVJalcptDQPz5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qHiJL07Eqe9zjPRpOcny6PtSxw5/oKG8rzMMPPONZwqRlV2B+xCrK4ZmOX8Rnr8noXSuxzwHv8B7mkZCNQVVrzHzeJMGtTP71ospzpy7I5ULdM23Fb5VKSYjRKMocACZJKYI1c17+5yCMaYa6BXTNFzRIMg28ZFFfJ6P8fDm5bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dchr5MK2; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dchr5MK2"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso2810769b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790788370; x=1791393170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RHz85aSKwRxYDyKJz8uKbf3jnYwT8k8pej0Gb0dBQc=;
        b=Dchr5MK24O4pZBFPIY5gZtmd9gGOwpJR8AYAcY5kmU30ge5ROdrdju6msRGGSCcv2p
         aSi1Br+a1dR4hqSv389F79IOxsloumJlpFIEaIVNSg3njaqJpI66jHUgW0eYv0C/Ha8+
         N2Sc8TVoOLoKuB7tAM5OgcyvnR38erXTK6gtT3MPbGXQUmnxYcUngKgHqXPVFm6ZBU0U
         qgSo+oPtOGPzJ4+fN5NolgZ7gdOlNFKunnrEcZMGXqR8tXb94FfyQBfuQJP19mUwqqNy
         dQGPxQhaps0825cQ9886bH90wvqyfWaIid8XEN/s8kL7heUG9YD2M8zbj40kFKGXww3S
         a8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790788370; x=1791393170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7RHz85aSKwRxYDyKJz8uKbf3jnYwT8k8pej0Gb0dBQc=;
        b=V931ZROOy1jXZvXTzrrMkb3MBJXUOPWFJgA8hZLwqw/q5G0B5SZtvKx+CbfrN1/ZiA
         5NdDj4pmoFQJrAHipgICleMC8iIMNT/bU/7jUyLCjjdtV3TV+os2dDLWlcR1pR7PB1VJ
         FEIbfS5vkY16CZM3rLW8zbx8vU14+/dMx0uYX8vi+6DWDdGiuZedNxE9TK4/CqzJdLzu
         e+6kmAHoyeYh6dL3aYRd4EBlsskwgTAbWOpODhySD+apKkssY0Y0Qayo6shNrlFr3EWV
         ga7lT5HhuPW+r5lSIijc76C7qZGPR/IimEKSY2998K3EnuzSJZy6Mn1NF1UwWWYCd1Bm
         kK4g==
X-Forwarded-Encrypted: i=1; AKwUvBzhmqosTHq2OJArDTPdEDhyETJpLraQTtGdQTNS5O7RjkBhxh1qX1r2jTXlFiKBWtLmyQY6gwf76Rakn18=@vger.kernel.org
X-Gm-Message-State: AFuF++lW6+0NqxS9VocH+OD2QxN2F13DPmW5ql6NI4hV7MsmM9GWMT+N
	tUhE40TkCdrThXm7gHD4hFf29p15cTdAhESVkIesvURqZequNEZ8FM7O
X-Gm-Gg: AYBFou3pdoMnF8bOkQF/rH9mwV93jdLguUXKXVp+ZRd0IUTV+9Q3CKJOD6ydXo7vi5I
	Kbuaunu3m9xmDbcrQns8v/0HYuzOkjIeioOazBIHSyhvKzpoPghuUonm8mT84hkbeLifhaLOh96
	UENfuXgk+Ii8dmU6fvgHxq6K8xKNo51TERlNcxGX9XFGkGhYqCksHr402HLsRKr63UfwX4IZ97t
	3TxOAU1tWlSJP5rwe3zJ5niXOu5j0n/Aqb0s5kMvsaNfdsJwm21hNuHfK+ZcDvEPa89G6BXpW05
	2lCnGvHa4jfT2yx5Ye09yVbpzfb0klH716g8gQBuNw0+d2nbCFnLCJeMUCjL/VHzpNrlk+owS7S
	a2VKIjecZ24e5eW9FAY2sU21MSDrC7rQOgpwWShS0xArT5YYEZXRlg4ff11s+rKcoVYTYTRCelU
	FK9aUWtMoEtAvh8cIMcD86xJhdsfpM/c0eRs+OLDy8c8d7ByoeVXUHINngEkZ3gU6uZ9uLrFnNK
	DS+WgJ4eLy2DKe+Ip8IEcQ2Rvnt389Glv+YMek8WcVFFVoQ+w==
X-Received: by 2002:a05:6a00:1a03:b0:888:71e:1695 with SMTP id d2e1a72fcca58-888071e1ff0mr106338b3a.44.1790788369803;
        Wed, 30 Sep 2026 10:12:49 -0700 (PDT)
Received: from debian.ari ([152.58.182.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887bc2bd404sm636872b3a.46.2026.09.30.10.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 10:12:49 -0700 (PDT)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v5 07/10] iio: adc: ti-ads1015: use devm_mutex_init()
Date: Wed, 30 Sep 2026 22:42:01 +0530
Message-Id: <20260930171204.12863-8-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260930171204.12863-1-architanant5@gmail.com>
References: <20260930171204.12863-1-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert mutex_init() to devm_mutex_init(). This ensures that the
mutex is automatically destroyed when the device is unbound, and
simplifies error handling.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 6637c42e0506..a790f694a1a9 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -959,7 +959,9 @@ static int ads1015_probe(struct i2c_client *client)
 	data = iio_priv(indio_dev);
 	i2c_set_clientdata(client, indio_dev);
 
-	mutex_init(&data->lock);
+	ret = devm_mutex_init(dev, &data->lock);
+	if (ret)
+		return ret;
 
 	indio_dev->name = ADS1015_DRV_NAME;
 	indio_dev->modes = INDIO_DIRECT_MODE;
-- 
2.39.5

