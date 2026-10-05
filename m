Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F3C49B5BC
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791208978; cv=none; b=J4+X1qW8bwdFhHHQEwxOTlxHCq9K7a2kVT5Ko5Rntm5nLetFaMd2VVVrQc+lQESGIcmXDKaOo6TpaKsQE/FV2E8ipCA/nBqvyFaGmOq5REv4zbEDWTFlZFim/Yg68vpVnKh6C4VpoLoqzhkfzVX38L+fQ3savbV8B05C34M4r+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791208978; c=relaxed/simple;
	bh=f58Keg7a5kVB9OlAfVBDqD+fiMMWBO8vgSKBr4jApL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mud8cizqUnuhMc+mHryugZxwwYdZpXPHmVTmA/w6+pgUj5y4Jlxx2w9vUvrd9dkpoNVf3BJfckYh1lNjZv8C1BSaU/zaNON3vMciU4/GRjaoirwpRMqKzqJf4nd1tWD02cK5Gm7HpZG1nTO/mL/z8UpA5R2VNQBQd7VZT0VroGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=0WqdpdI8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="0WqdpdI8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1728d8dfcso9077335e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1791208974; x=1791813774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BD6Yq/3o0OLJRpcfZaMdRAV3LFVZk0ziQSXXEEMncUU=;
        b=0WqdpdI8l2M+gy7zPnwGx6Mr69gBD+Xk356dSpTwvvosE9Gb2ULmAO643IYQ//VH8h
         bYlmbouce2skGU28IYuCUaGqEECmtA137xeTaaoQGpBwpIMHNr0zoMBTNfjehLBUptpG
         cH9YsrpQATyKfYXkkVLoP1cxrhY7ccKWRCI+CgT5AwJVIem5TWSQD2z5LUOjLBPqRrVj
         RROZgCvZgr2NembPpVSJdiKHxQFNO7wFQcbVUjlct37X23aEzy+IRnPfGzrYfIh7bfB8
         8Uv2nm8h6wQP6BCQmv4HUxS4Ofs5zuBMJ18FRLPaP6YG8MHHyNzQ0cjim9fNO9dRI+Zp
         OEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791208974; x=1791813774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BD6Yq/3o0OLJRpcfZaMdRAV3LFVZk0ziQSXXEEMncUU=;
        b=ayJ7cQHiAuRk7J03mAVP7ELF+DVFVtqpdlGZRbyms2xWkkNRQmWxUvqih1zIytqH1I
         3HIg/AdhXeYM78IFqZ27p6bZcW4RxfBLzJrFRSiOLUkfXCoX5j59Zk9b63dp5zWgUXkz
         huODUPV3zKFY8tQhv9bMUxAUTncz678h/uarFGgOqehOusfqncV5LNxDkcPTHBP7WeSU
         YvGHr8GCyNEKjDsYSU9Y/aJHRQoyuexN3TzQgfNN63EPcjZBMg+BP3mgsHLjzonjHX0a
         YChXnneddYNJEWOjh4V8cRVOgFy8+xGAqYclV4gZGYGIwsy4X0wMxrLo6Zq93dcKoS4N
         JNuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWlElu5NqFlkjWueoBSfdR0t63L+OiwHmKW7lGXkUVy7IdrIAMhQG3A7VeZvfrJstDHsNLYaEh5+SVKlM=@vger.kernel.org
X-Gm-Message-State: AFuF++moilk9Z6hAc+CpKT/qkAkODACvrQMSawu8ueZa8KcW6EgjeLjz
	LLn3Mme1jPgjCuIfvqCT/zZLHnSlclC++bTRwE+nJ1s+8NVq7A3uCfcCY68jCZ3WRdaIG54ku8R
	RD7j0SWBRpg==
X-Gm-Gg: AYBFou1oNajoN58yeIPyFmIWwXcYESfUA+AUX3YhYKLENSZrgao/ID4+chKfIwkyfkn
	a+YYVNPaxl+zkW+6RZhms5Y2m3M+HuHRJ2aD4nHAl30FCZVOF1O4dpcI1OImJgs4KmC8UyM0zJk
	BVBgjhURGcuDF2AzywTNSchl9PLBgmJVRtLSIr/QbmZuto8pNdMxn9GcRVXl0b55N9U/fMx5NJV
	ut6+vDTW4XfXWyWc2UPg821LhN9dGi7Nl5ppqI9V/jrNkFaM5rYfsUI+04FDNwH6qoeH2Ensg1A
	wg8NuOVMFFF5X31VUEqoFH1M+qTvirQpZ7ErnCsuQOipaJ69E+SV51zegdiKG2yoF7D4AjCmXLH
	Ytm4W8U2x/HE6eiZtHzVKr5WlM6x9UzKup2KxxCCww+U0DHQD9jhgxvM99A9R8DRbGXeMfAELTE
	koctGbeSB0iEZKPTv17CWGj6ETNNbQcoV0LvGL80vQUzPrbYSvqWEBxmKYkbW2Q4F/3Rde1q9WY
	XHQTYYHJTWxBA==
X-Received: by 2002:a05:600c:4f4b:b0:4a1:6dca:51e3 with SMTP id 5b1f17b1804b1-4a16dca51eamr105862775e9.3.1791208974197;
        Mon, 05 Oct 2026 07:02:54 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:9c1b:24c4:d43:125f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a162e867e8sm324052715e9.15.2026.10.05.07.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:02:53 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 05 Oct 2026 15:02:05 +0100
Subject: [PATCH 09/12] iio: potentiometer: max5487: use named initializers
 for acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-acpi-iio-v1-9-2796f713945a@thegoodpenguin.co.uk>
References: <20261005-acpi-iio-v1-0-2796f713945a@thegoodpenguin.co.uk>
In-Reply-To: <20261005-acpi-iio-v1-0-2796f713945a@thegoodpenguin.co.uk>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Petre Rodan <petre.rodan@subdimension.ro>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Marius Cristea <marius.cristea@microchip.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Alex Lanzano <lanzano.alex@gmail.com>, 
 Jagath Jog J <jagathjog1996@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Kevin Tsai <ktsai@capellamicro.com>, Eddie James <eajames@linux.ibm.com>, 
 Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: linux@analog.com, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791208959; l=1017;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=f58Keg7a5kVB9OlAfVBDqD+fiMMWBO8vgSKBr4jApL4=;
 b=DA3sSVcKo/WFpLSYhZ9czfdAZf7ap9SF7XaJwnMvSAC+5G20VFHM4AEp5IbBghRAQgMzzYgGM
 v0lnabHO1CdDsFKOcnHGvy8P3lKJJvL44E9Igo0qHW5JHP9IA5ahovt
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/iio/potentiometer/max5487.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/potentiometer/max5487.c b/drivers/iio/potentiometer/max5487.c
index 1f0d0056f412..d1eb0309d123 100644
--- a/drivers/iio/potentiometer/max5487.c
+++ b/drivers/iio/potentiometer/max5487.c
@@ -133,9 +133,9 @@ static const struct spi_device_id max5487_id[] = {
 MODULE_DEVICE_TABLE(spi, max5487_id);
 
 static const struct acpi_device_id max5487_acpi_match[] = {
-	{ "MAX5487", 10 },
-	{ "MAX5488", 50 },
-	{ "MAX5489", 100 },
+	{ .id = "MAX5487", .driver_data = 10 },
+	{ .id = "MAX5488", .driver_data = 50 },
+	{ .id = "MAX5489", .driver_data = 100 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, max5487_acpi_match);

-- 
2.53.0

