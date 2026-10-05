Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E6E49AA27
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791208988; cv=none; b=qKhdgoq3lzxXo1BaIEA7gsAgVmZ5DLCWhkzyj42Loi2IMW0ww9UchdOznkttqW5Um/e45HdbYkKIjnUD3Pau+3NvKlgmsG1LWRA2s/6DDfJfnElybxyqOUEuAAfkjsoWp8UB4etwaOWQdpnWuTpQF42aobiF9m/cFOoflpXg7es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791208988; c=relaxed/simple;
	bh=Qq9oFMkGPJxvvai60/CUpO2YME3h+UjujaXI34TG6dY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XhwWcOQfYZhvKgTvC/2EldqG3LLmQl/YYbtJ62qOeraWBPjuUPy5XYU+75pT6DqPaOGdrN11ZDJPnVGJC4XhewNIUFe96S67jmwKdxt+NrfpkjL4zDcbLd0Z4u7qBXWKoZ0cl/s/+EYf0y3Y4BtFuFMwAaI4mozWOVMg+KpzWQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=iSdQVvhk; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="iSdQVvhk"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a0280d4f56so11168495e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1791208982; x=1791813782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZPlOW9otWArJ3z7Z0QJtdUkMSDpE2ldYYoD+0/Ks+U=;
        b=iSdQVvhkaJI1f7/R2Ye4roF4drtjwVIG1QoSTHQn7qzeJrhnaTKXIXuIv1v8GofGAf
         TLAJXcamP2hxBbVn2+HB8wEQzrKa6J/b8ZVol88/aK6+UNVgm/o1kFRxc7ueKTea+E9W
         M74FbCPx+q1cG76Pk+oCQ/0viMnUgvQsbk/MmKHVk2xUfOu3SmQTPupTrO3tarBvWkTf
         14TyR48m/t8cXYFfao3l1qymfA/R+s3afKfFPHLmSYGrB6JPcWZCjO7GnzHsT7W1Vjnh
         3kD6+qT6y3dmkvSGKFHqUo9njHP6gocKdkDwcctq7cerB74XmjWDVsGJdxpFBXKISc/B
         fgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791208982; x=1791813782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZPlOW9otWArJ3z7Z0QJtdUkMSDpE2ldYYoD+0/Ks+U=;
        b=qcXkCd5Z5fFGiRL2dQUcUqJs3abO1On30t5+7MkxsLvMfa0qrWQ3yNo7KCNgznOwhG
         3Q3B4YvrpsEKSkdIlvEF1jFkOoohNyVyG7t3HiZ6Ym1E9RyxbEiYciq/YpsyQdYtVU/o
         aZY9wyCVv4q2CPajV77HOlGmBUtOhCBAh9EeulPRuopZJpT/74LLZRDlgwxyM9qNoAxD
         QbjgA5BSEroRdA6gxac99GzFzTzyNrXLsSzoEigo/ivSC7bxFqVk5AlrKVMrV9gU2UtT
         GUOQAWeuor3mkXB4Yow1doB+aiqNOC8Nz3HsliGLxSPsZUJeCOPVg8lw4mF2tlUpbbes
         sukw==
X-Forwarded-Encrypted: i=1; AKwUvBxTjov3A4ma+bpui9r9n0kbJEK/a+9GkWBA336K0m9Y/m3iWvuHQleODK1CIqVxfUm8prqpM11gsOxRWSs=@vger.kernel.org
X-Gm-Message-State: AFuF++nf3jar6cJ0iA0oBPuxTJcXBWzhb6VypOs6mi0VPeRWr4PLTpgn
	Id/TEwyY94PHvuSo2BB9ePNk5tazdwZyDYStqs4N2Jfztse1mi5fGZ5d6zNN6oznvJxdzyaQpdK
	tvKfik/JNNw==
X-Gm-Gg: AYBFou1qoHikKCsBox2/QFkRo/c3+WVo8koxgM9Do+h/qpeeZTrudql0NLIxACO5jg+
	Z66WsxtRvSNLM9Du4QBCCNp6HFuJKwjs5LCzaUqogyZq8dZBIZcGwJN6BiE4i1p7UZRwdjn0hxK
	BJxhUI63fQDd/bOd2YBB8KKdTzJh9k92/lUiJWUSDnsf6W9ZqxcrwKgsSJc/0d/xJFqzMHdcX6V
	ZU0WFA0uKe47iqrYd5u239WbGTrPdr4Z2V/5mJa5HPgYSspbnjJe+L0ErOhHheBFa1SmjN9ud3B
	SfFkHda9q7M86ug4wTFwe71kRH9GFh9uN/4xwdinprm7vsPBc4Zg1iQ4qUcZ3d0ruaietV1ql5X
	cvWRMS0NDbxySvYkdxKXldxiFVAsqO3VJN7PR8E+FmxrAqkwYTvwJAIumVwkjHAEtyHj33/5rqU
	/iSTf57GDZIip72Bbz65N3oeLRKPtehX9Af5bMpmLKb/Qd1ummrs0Bz30t/Hb40OWAnRSF2G88b
	oJ24Ste95q+fQ==
X-Received: by 2002:a05:600c:8b30:b0:4a0:2644:80db with SMTP id 5b1f17b1804b1-4a0276c0b12mr155667565e9.35.1791208981928;
        Mon, 05 Oct 2026 07:03:01 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:9c1b:24c4:d43:125f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a162e867e8sm324052715e9.15.2026.10.05.07.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:03:00 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 05 Oct 2026 15:02:08 +0100
Subject: [PATCH 12/12] iio: temperature: max30208: use named initializers
 for acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-acpi-iio-v1-12-2796f713945a@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791208959; l=869;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=Qq9oFMkGPJxvvai60/CUpO2YME3h+UjujaXI34TG6dY=;
 b=De6+blcgayS2Qb0tICdtW3aFJq5x5m3NlprcwPCyYpo5hh0irEkwWgeY+3+sX2zTWNyS0q00a
 rrqXkVPurTWA+TCI/tMGgYh2llH4RReA2u8v5Vm/oB3wxPEndXraQDN
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/iio/temperature/max30208.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/temperature/max30208.c b/drivers/iio/temperature/max30208.c
index 6172abc6d533..80c148da1723 100644
--- a/drivers/iio/temperature/max30208.c
+++ b/drivers/iio/temperature/max30208.c
@@ -224,7 +224,7 @@ static const struct i2c_device_id max30208_id_table[] = {
 MODULE_DEVICE_TABLE(i2c, max30208_id_table);
 
 static const struct acpi_device_id max30208_acpi_match[] = {
-	{ "MAX30208" },
+	{ .id = "MAX30208" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, max30208_acpi_match);

-- 
2.53.0

