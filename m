Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27704499F13
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791208972; cv=none; b=iaLSiTpD07a/xcWz4EmxlLwlOEQ+w0TIaBThcOSz1o/BOH3tD/dBHiTEZHSq4sGAAruPEpo2qydGUNW5bjH6GfpBbmsV0CWVRvx0LXiz5CO/Y2JWfQ675r3J0KGahuBDBydsexYcJZ98VjmPGN+Hm061euXeTI65UjCwCiwZzM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791208972; c=relaxed/simple;
	bh=+eIdFQGujeAk7EsZ4toE8ZIpbEW9KfEh6uQCbQzHc7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E0FtW8SZgVho8Je0HvOP4xKqEBT2Q0AABb0QSovCHrnVDrdITRz6l/PHgIOGNf0FrwIykb5D7LFivE55LOEwRr2e9UjKS13N1tffCfZwhKknZOXr80FvA69+RhqIwro2TYAzDPm8DcLXifGCvx8adujBXKUXPwLXgbTma+utq8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=pY9tcwy0; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="pY9tcwy0"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a1706a2b24so8335325e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1791208967; x=1791813767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BkNKKOXr/p1BVwzQGdB5FcUA+YuUVaqEOoZvmlHjUWo=;
        b=pY9tcwy0VbxZ5IDCLzgsXiN9jzcVdqHv/gxdcwxUkmU6onkIiOCNKTUZXevg+foQkT
         uA2/XrwyWZz2v0j/yEwY7ygaP6Efi9zJHtvseZism1ftdA8+HKge/MWJeq4dBVTbtoyZ
         PSiSoZeaQ1tzMQXb1147oKRz8VfNC25rvlkyMSNFg3v8Mt/XSv9oe7Wj2UZIyGU0CtMv
         DADpLVvH5nmeGlp12M5Lk7vSnn/ddxPE1UXK8k1x9Ge6aCcUG3gvBqFGGdmPfZcuImfU
         cPOolCEUg0z49AiG4z4gcS6wP3R4fm5KlSP3KlIi8qLCvPlItZ0mgwqyifI/R+GRBNby
         7YFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791208967; x=1791813767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkNKKOXr/p1BVwzQGdB5FcUA+YuUVaqEOoZvmlHjUWo=;
        b=jrzdi5lFXOHVHLKY3VodWQHFn2Yf0Tzr1qP7U3qX8Sid4pZZ4iUrahM4nyhQgpt+s9
         STfrSOztX7OMk2ddUo+n1OIRVIjCfd3rtMIwvYvdhN2P4cyeF1WgoDcbP3PcAo8keAJ2
         of+rc9S+YCFhaZByiPhyU7S3RtoHxuu2ToN6ys1GfsAipn+oNLGSJoH/vltzw/YnxA2F
         0azmEpfkdAuArfEbtepqxVia6k59bwanvnN6LeJoKAjj1s7pDRenFypMMCWbwNQjJBjm
         U0Vc7+E9HNj96LL4mfE6BnXOqwBS4EcpXA5tYGQhGYH2wN6r/U6pQ7F1NBU13WTqfli4
         /e4w==
X-Forwarded-Encrypted: i=1; AKwUvBzoOJcQQh05YEV3HM7V9picU3AlUU+6n4PGisbx8i2YyOiY9VBB+0CXpADIu9YFu815JmJrRV5FKTXvsXA=@vger.kernel.org
X-Gm-Message-State: AFuF++lQRwAvPLuLxWmimHWaJCs/ci/Gtc+BWuU0GN+M9ri2PqUV6ZLr
	jyCLXx5vCIQlDaPlg+rXeqFkAgZVpbKJVrrRt4XtvgmV5amKG7VKb+t7w1FS4q8zCTDyisWqhTv
	KJChOw7t58w==
X-Gm-Gg: AYBFou35+fabmS0fXPDTyojGyk2IX992HuSch6moNESLFVIYPwB2E8bELsIFoar/nXG
	c5MIJ6MyIFbMMBb3Yvf+YyNVq/2kwiINpZwyASjyWu4KsUI3VCosv0Z+vYjPpMR8NKCKNDiYVLU
	lJAVxM+4tFTDf3BzTBzwt7Ruje8ZyZeY6RT1UD3+r8qvBahVwV4LEoZjJUzQdm9Y3TPcGOdRBmZ
	zP6i2k5TFWeNWdk04diGwxlxS6x5mZZgs0Ce+ZhuTJc+GRzD++34YwJzZR6W/q9cVXbFZptFwHI
	vF77UgX20t7R2s1HkoUTtf2ZDuY5mEwjQYEpXoO16Eu1djMKUan+QgcpDEcBlJa+tyGpa4qEv3c
	dBTcVtoFjPYJvKxapF7tVfMI2rhYWRKakrlm7oOjBJhERtFGrW/wwVoUsP3Em+LRilRfrKexx4j
	heTz6ng7KAGOaB6znvfn2aZHWG1O+GWRu6wS8iGXrF6YeNNrN24njobzFap68yhm6l6czzqDCa5
	5CoOlL+kstHvb1Gj62+1V1W
X-Received: by 2002:a05:600c:6212:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4a0275432f7mr170039935e9.9.1791208966464;
        Mon, 05 Oct 2026 07:02:46 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:9c1b:24c4:d43:125f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a162e867e8sm324052715e9.15.2026.10.05.07.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:02:46 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 05 Oct 2026 15:02:00 +0100
Subject: [PATCH 04/12] iio: gyro: bmg160_i2c: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-acpi-iio-v1-4-2796f713945a@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791208959; l=813;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=+eIdFQGujeAk7EsZ4toE8ZIpbEW9KfEh6uQCbQzHc7c=;
 b=OftuUn60HBnkz6FP7ud92U3gDinybTTUMLfjIrV6j7ukuBXsEzoawStXJGDRXSXhFilLuqnmg
 PEVKUbGAFzxA9d6ncAkJk6Smwa5lVU2Cgv9caNI9PDY0Ynd3eYHI5Oe
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/iio/gyro/bmg160_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/gyro/bmg160_i2c.c b/drivers/iio/gyro/bmg160_i2c.c
index be3cfbd286aa..e4ebd0318494 100644
--- a/drivers/iio/gyro/bmg160_i2c.c
+++ b/drivers/iio/gyro/bmg160_i2c.c
@@ -39,7 +39,7 @@ static void bmg160_i2c_remove(struct i2c_client *client)
 }
 
 static const struct acpi_device_id bmg160_acpi_match[] = {
-	{"BMG0160", 0},
+	{ .id = "BMG0160" },
 	{ }
 };
 

-- 
2.53.0

