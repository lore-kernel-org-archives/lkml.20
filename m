Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5928741B36E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902418; cv=none; b=KgIz8HPAhDA9PFi+F5slo/1Ezeuwj+0Ik36qdJE3GQiX+Xji9hgAbwz/7Gq2rdes4GYf/7XezFC5P5SJ/F2cFDW6BV+SMISTFTU00ByzJpu+Lk96zRJ4DZoZx01hgaY4IcN6oVFRgD99Zu8mKT+G/ElPpfi9UyyfumthkLWmgUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902418; c=relaxed/simple;
	bh=z93uA9eVPPPE+/UYifdKtIesam0NYWgxTBqS3zlFsM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ctn6ncmSqk6Njf09fvhfNEdh8ctLKumQ5gfqN6yo4gjqwSwul64tT6XnE/RMEg7RlWLk3kdMEBIuNW4VEVySIdoYc1JOS/P05A6qsQM3ojffVEtHuaSXMBCik+HTX8vfdYMIpP5JhhTLPJTiVNO6WOlXWFL2lhi831Le4TCtR3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dssAprsj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dssAprsj"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1af482519so5677175e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791902415; x=1792507215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o7sT85pHsC4yeFSJp9w6DFVT3d+NHjHi+Irj3RfF2og=;
        b=dssAprsjoeKf6hg3Gv0rzc2rbo0NHWVnELEZIKT87O577M0DlRlJpolldaEovutbJH
         t2nmrQqlVzzeOev/1gTB3PR86ltkl1cuaKnl9+un5VS0StMa4wTJYfb44V3vHDIEyvhv
         FBJzOjM2wcDrOY4fCEGLGb+3gmQMD0T3V4l3DZc/djzV7JL5iJB3fVMWhwM9yXXfFpuE
         /qF0tbaAyCvrAq6Lp2Oxs28wcODUFyx1OcvOxNI2K9anWNZWcyjQk+lOqMUP4751LIpp
         x/6MwaqaPxZhUE1Pe0loyhzSkjS63660rFfSR6g65/ZPbX3JQRxhQJ2a9wePscCjLtit
         r7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902415; x=1792507215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7sT85pHsC4yeFSJp9w6DFVT3d+NHjHi+Irj3RfF2og=;
        b=Y3r/rJ3JnS4/QTVcBqjKcZbE8eVdrhV2IVTYUn6GOprp3JrmYLADQuAezqm6G6KVGN
         ukn5VLcLflXIT1heWjscBgp/SmZfSJIi6oFGopvTdW72AlZyvoE1lcLMjWgxzWtv2mfP
         3r6PavDOA4Nuf0g6oZ2t65fgNLhtJQ2x1FOC4GkwIaSb4z8eArwDZsqwxKfdVOJewtdV
         tI7cPicmjb4qp3jqifIYiM36cyaF2eels6tROhkUQ/pLtfKq7ghfQFZY+ptiVD2oT0kz
         KsVbv+/wIRqtXo53+6zr9aenFRIV7Ku5X/fTbz9YrFKbcjgABOzPKIRuOl7xGC3W3z+m
         kjfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwW+h299FBBUdBR3aTylm2po9JXzowptZcqfqwGpvs3FkoPJRS1ZFgUqdApZgjRiWKcx9d8+tMl2F93lI4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlooNhvdIvg0rPnyz6ZQkzbddgFd6a04M9hOMie/8uljqBdDAR
	kUDkG19bjyd9oHFo8El00BcXqh/IQu53HxYTaICcjA3Jw4E9VLD18MM3
X-Gm-Gg: AYBFou1bQT2LESbrRYAnWw/l+XBuMQkxk/22bx9tDpe+X1zTKiv2ICxAhOA0CgPs37I
	BNIYop7heN8IUzmbxvt4Q0w+osQjy+ZsXxlfRemd1D1jLX5YVUKBhU0VNBkyHOo3k61cSj1aTg0
	FGRn9wkzvK6sSrNICVo/uDTCIF+pPxP8KanITsWYF74n4b49+LxNGs4n8sQvhdm+K7ZpyiRgwQD
	wreWbKckQyRmjzQbFtrQOLtXWZeUSbQqIjsVAtoG/7WjTXW6qijqJpTP2dO1UbSXzYg7Yu6hdYF
	xGDE1XBJ8/S99MQkRX7xoVsHbtKibPpKOT+n+eh6E6ap416Kqb+eMItOdCM63jGXFMb230Hx0Pu
	+94153cZtkfsFoda3Ap2jMnYiQ7Dy9t0gQcxEMjk67A8Fv1XlpB7TijSeposTaWN6kNR+rSrbB0
	1VLpwax+AJn/gpusQVWF45bhALCYh2Z0DTAI6rl0q6WzfUW3GaqnyVCfrGpogcn40TymGUt55KI
	HCj9nzopq1WiYMmMRrfHo4s1jxbhr1GMg==
X-Received: by 2002:a05:600c:1d0a:b0:4a1:7f96:9b42 with SMTP id 5b1f17b1804b1-4a18e4a94f3mr236923185e9.15.1791902415551;
        Tue, 13 Oct 2026 07:40:15 -0700 (PDT)
Received: from mm-ntb-00805 (ip-94-113-240-150.net.vodafone.cz. [94.113.240.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6b3cbsm294892585e9.0.2026.10.13.07.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:40:14 -0700 (PDT)
From: Jan Remes <ciakval@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joe Sandom <joe.g.sandom@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jan Remes <jan.remes@mycroftmind.com>
Subject: [PATCH 0/4] iio: light: tsl2591: fix lux calculation and precision, add I2C ID table, report saturation
Date: Tue, 13 Oct 2026 16:39:39 +0200
Message-ID: <20261013143943.436816-1-ciakval@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jan Remes <jan.remes@mycroftmind.com>

This series fixes several issues found while using the TSL2591 in
company products (Raspberry Pi CM5) and when testing (x86_64 laptops
with MCP2221 USB-I2C bridge).

The original field report found that the illumination value has always
been 0.0 (caused by division by zero on ARM).

Patch 1 fixes divisions by zero in the lux calculation, which occur with
LOW gain and short integration times, or in darkness when CH0 = 0.

Patch 2 adds an i2c_device_id table so the driver can be probed on systems
without CONFIG_OF.

Patch 3 makes the driver return an error instead of a bogus value when the
sensor is saturated.

Patch 4 improves the formula for calculating lux values to make the
returned value more accurate.

Patches 3 and 4 change existing behavior, I am OK with splitting the
series into two, if that makes things better.

AI assistance: Claude Code (Claude Opus 5.5) was used for research on
sensor behavior, datasheets and Adafruit library, to compare results
produced by old and new formula, to draft some code for patches 1 and 4.
I reviewed all of it and tested it on x86_64.

Jan Remes (4):
  iio: light: tsl2591: don't divide by zero
  iio: light: tsl2591: add I2C device ID table
  iio: light: tsl2591: report saturation
  iio: light: tsl2591: improve lux calculation precision

 drivers/iio/light/tsl2591.c | 58 +++++++++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 16 deletions(-)


base-commit: a22dc7ebb21a6bd4c8b63bc2c1dd46a24945aae7
-- 
2.53.0

