Received: from mail-ed2-f36.google.com (mail-ed2-f36.google.com [74.125.228.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F98489FDA
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939304; cv=none; b=Rkr67PMbSvMa0vOxzQQuMO8vQlVS4LpS2reXwcvX+8/XAOuqxXBQB0BT31Z1huEDTFoxpfURav1BYovMaWrmldpl/m5XOhEdIdH381foWcbwH/HxcWbgsZUuVb43ztiyFTqvc7634B3D9vDBHobSGKcBwQ+LWSyvbVJ7DI2Kfsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939304; c=relaxed/simple;
	bh=WcCYelFSOhbeoMxtjGueNhLN0g0ypi6G7QGQ89YUic4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TOPrY1G/g4to9GexzIals0LTTQus82Nw/Vx0JFthkXs4ad0BAnBQCS9y6Af8wfA7iVZs5IelEyO3PQVESJ0iZ98OzK6DL3QqL9/occCe9ZyBOS0fCEXUdm+V0PvIrXA7b3hfgcrgCCfhzHKvOp7tgZXQb+pN4/mgdMAsYE0WUjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJDh3NHu; arc=none smtp.client-ip=74.125.228.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJDh3NHu"
Received: by mail-ed2-f36.google.com with SMTP id 4fb4d7f45d1cf-6ad59dfd3a7so502460a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 04:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790939297; x=1791544097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a/U30FypKXGiK+JknnhSRfyksD6iky5csMYxiBRiMgs=;
        b=cJDh3NHuYRLE5NHQCTjdWq7syE5si5MGNZ/L6+lARtOex+Mz7AGrkOFGF3Rfv26fkh
         9gT5/J+C0IVjouiFqa50Qw65NCnUeCLvPfdDHew5Tb46snFzM1dLoZj2wdaZF1n+ftOb
         uPZJKLgb9HXNipE+x7Jw2zHT982b09d65VfAEFj3r3PgSLlGhn1nLVas8zJ7lPKb/pcD
         j6ozhq/kS4T4aVNhgLpqzhFhMgPMvUfaaM7F1yoDwqGovygAyzwMCG/suFyzNBQhCUSl
         ZQoi9jx0zf/IKDMh+0Y+bYd3kVsjOBZ/OolPc5dN6fVf78Jtb+I2hSRzkousR/53Gs7F
         21xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939297; x=1791544097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/U30FypKXGiK+JknnhSRfyksD6iky5csMYxiBRiMgs=;
        b=AqcPwXAyXRPac6vLZ8Fc0/ImQZjke0Tgvh3uyv+O1zyqjDV4eu2REwK5coCgtpngxy
         /YYupl2zFvZCl5B+01RFAimEJZyIoV7kNmo7kgrKn/lZWcZgayHxZSD68uafhzw2Y3U1
         kd6IaUizTXiDwWEEZdF+l1GSaQBQSQUH9127y6giNbPvddvkM86FAgPFvRULAQmY03a8
         gbb3fW/RPIt81Tox4LlECgWNekI8Wt4eNS/RCDu9oT2yEH3jHbGvkecPtJAn+Rnu+g7p
         WNFy2eGMiUKCT61wpnny9pe830lgdPQfw/ICMVdHzeMViZgVD0AEMkoTSQ0ozhBp8Exv
         hUWw==
X-Forwarded-Encrypted: i=1; AKwUvBw8UMldjGGS0JZnWMLtJhRGmPdlJj/uOtFzlS671scPkzeCCucdI2Oz9Oaxofsh6nQkQ0+juMkl5lKgqAY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMFW8gcTlxhTch4C1Pk/7Rq/3VcoAn61UC3wXiF2shMrXSQXEa
	pEqxpErzEimCjIHaQrZ+eaCX6AbnFT5coM2HOH4+96SSyUDp58knSWhc
X-Gm-Gg: AYBFou1Pgx5pK1BkdNs3Lm7SrFHLe4ItAsAgYofZ+6xdPLPdL96zocmr87JwWewlcpW
	n2bvedIjjal3bfsHqparRmOWiMRQgZk704Mi3pt69X7++05WOuOdXMmhT6Gxj152n75jeJ3o0wL
	CGL4OIatfLVihDVwqaipse+E8g0SwVHsJV21m1ZsGf90HIUAy/SV0RcSUk+1jBsWKtD3WtIOSTV
	FcFZytRH5et5QYRZrzSRGlAvM+AmWSYumH2/F7pz+hHVf2LkB5sZadR6kS0UaKMPTOoe9Wstv7S
	jjM1I2GqFkC0sm81credGgSBtgrnkWFHEgkvGcY8MGsCBFT1VbuFQ0+D/7ge0Wjn6KndIDDBn3Z
	bUdxTNto1jr9a8Ibx8jy2dx1OrEC41hKqxJST4zol0+VF9MTq1Fd0nvv3LcXt0ycGAxe6+G0BmQ
	3tbq0nAHLuOwJeEirXrG2XHjIMsxV8VAY0YWdqcD2uoDV7HJtBHRGmM7IfiqSxGrXLmPmpGclKg
	xPEp/ao8/6w0BBbvsXecWntiVSAIM5GXrWO0wPEfJjW/rMANRUzvpvPg803owsUUhfIhWXclxf2
	3i8g
X-Received: by 2002:a05:6402:210e:b0:6ac:c1dc:fa1d with SMTP id 4fb4d7f45d1cf-6af9de987efmr1696666a12.0.1790939296938;
        Fri, 02 Oct 2026 04:08:16 -0700 (PDT)
Received: from localhost.localdomain (ip-80-113-107-207.ip.prioritytelecom.net. [80.113.107.207])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6af9dabbe89sm846216a12.34.2026.10.02.04.08.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 04:08:16 -0700 (PDT)
From: Jesse Jeronimus <jesse.jeronimus@gmail.com>
To: broonie@kernel.org,
	corbet@lwn.net
Cc: Jesse Jeronimus <jesse.jeronimus@gmail.com>,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	dlechner@baylibre.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-spi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: devres: Remove non-existent SPI register helpers
Date: Fri,  2 Oct 2026 13:06:46 +0200
Message-ID: <20261002110752.89529-1-jesse.jeronimus@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 9b894d65e978 ("Documentation: devres: add missing SPI helpers")
added devm_spi_register_host() and devm_spi_register_target() to the
list of managed interfaces. These functions do not exist and never
existed in the tree. The only managed SPI register helper is
devm_spi_register_controller(), which is already in the list.

Remove the two entries.

Fixes: 9b894d65e978 ("Documentation: devres: add missing SPI helpers")
Signed-off-by: Jesse Jeronimus <jesse.jeronimus@gmail.com>
---
 Documentation/driver-api/driver-model/devres.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 5067500ded5c..4f0b90e7e138 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -460,8 +460,6 @@ SPI
   devm_spi_alloc_target()
   devm_spi_optimize_message()
   devm_spi_register_controller()
-  devm_spi_register_host()
-  devm_spi_register_target()
 
 WATCHDOG
   devm_watchdog_register_device()
-- 
2.54.0 (Apple Git-157)

