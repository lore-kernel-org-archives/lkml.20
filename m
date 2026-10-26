Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003453;
	b=0s6MOcf2uI86XhvkqQyG4QvXopEK52mSf+h7QaCaVzsAxCX6uFMoWHMCydL0Vmoe1bIQ
	 YHwjZV0Kaz4VC+xkKkCeALqQ9ZJ8dHykCthT04nl7DU22+AZWBc/tjJhDU2yyqv4QyYvE
	 N3q9yq5Dpb4KFCEVTAVN288hBdCbnFvW+BSLRGMRKwlm/EtXP/f+uPkFqDxgm9xm/harq
	 15yNIvRFm9iMXg4wW5tmyQfPiMp+QW1kCyOi0o49LQv7y1lvKCa5xqB2cJm2w06vvYB9D
	 lF0PQYRwaA3JQuC4FLc1Sjxal896/Y5BlKIGg1HY1eSkWaNF4y3awXs/G6UPKo/rl4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/7TxP0v0CwRMpmnuZd6/tuNx/k5bWUFvFfdUCTCmnjo=;
	b=EOFSdUFRLv+KdVMy4cguJy9NBJxokK7GiYBi0wnSe0bBAY/JQrrwRrMQe1d8aLhL108m
	 rCy6h0rhRtHSti++4mYAxwfmXMSJ+WUmyPZeo2xdDfN/CPOmNM6k7m2Ss7FRuIzl4r/6I
	 2J6ktsYmNEVBzlryF3BSnjiDUv3hroSkoCLLze30pisIITmzpCOLxRxAP1MRUpi1EpDMN
	 2Lm2GCJB8Lt5yfOeA0dZNJ6usFxnijes5zCbg5xe1kqyRvDtbTwxEnfsd3n7gg/WdoO+4
	 5Qiq756j9Vs87Hc0zZtju17P3cOqyTsLcpKd/NtCayKnlNZsLIY5P+hLd/jY1tdW7Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qAvD4XZE;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9910E606A325
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9910E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qAvD4XZE
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e5378b281aso18365345ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793003452; x=1793608252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/7TxP0v0CwRMpmnuZd6/tuNx/k5bWUFvFfdUCTCmnjo=;
        b=qAvD4XZE4lDyXVZfGlRec+31mDHK+yBDOxa07rhGV7u1dQaJxSweK/VxGCqd9NM3Kl
         NUNqYwtczRP0TAiTVQ+znqCAsrLArktdEzE0YIGwikiCGpRMMofQtyJmHFtppmVvea0C
         4YXWB/kMpoaeQwSKnZ51sUKb+1nxqVw79gUs9spBZ6goknRJYWqYMNTO1Ef47F9xsYFJ
         ycjDvpttjYP/bHhyD0lMhYiDV5Ejtqw9+a5AqEzoX81AlSrMP2bW2wze3Kvn/0/TKXz8
         p/t6nhvUk+trz7t+35jX96tVyJ/uR5C8okZBOGpQKXgDWXKL5puJibdjiQ42CqUZXWId
         BHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003452; x=1793608252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/7TxP0v0CwRMpmnuZd6/tuNx/k5bWUFvFfdUCTCmnjo=;
        b=yF7LfKux7vUWTEmktmwKQB0zWXuAyjmVfDR8I7fMdEDktOwp8MiKImtMfodG/5wuPZ
         7k6FwB2xRB/9Uelne7t0t7LEi564gPe0coi4j0MQOO7XJwARpVTx0BEDd59HXRdkLUv4
         kMZ0HQGP9ms+xF7OOz7VaV4DXPiafyNcRdHNl77isCDiVzWni9zmqpGwYnHevdN+bPR1
         8AdDdF69m1rsia6WDFnHb/YK2+GOrRLO7lxY8Jls/fd3hf55eQsHH40mgJTi32YsJi+R
         YnCuW8SuryKihWfan/7h5joKYoPEkgo9uBFEex+fFKtFVDvM0RQPb9FzdqMPKsUVEXJr
         2qlA==
X-Forwarded-Encrypted: i=1; AKwUvBzWwAvx3fDSetqGcyqtq+GcbmveXUmLSCQg7pxD8Q0rXwNvHYVqFGw0oJ2g/ThIdhsDbXbLEPVYZPV+twU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIt0h6c2TQZIYb0FkjuRGDdo66wB7U8A2vUjpRygMyXqa0N7ZAe
	0L1DLCTvPAwmJ5IR6bWdWcIrY8u4dNQizUdCWsaTy85ZEAYI3X5EpfSx
X-Gm-Gg: AYBFou3mziN107Nm0EcGYW6RDShooJ7ts+85PGD0fyjFtzIpBteLji/5Km989qvrCG/
	JAWVlJ5UaT6TiUZMtHSfYhJgCNXRG2IcBjws3ieu+8yMyyoDIp8bFg32TqXXDYWlZV0AcCInzzX
	VAaMZCotnPrVqVa6eZ1/1unA/voisbqs2u/8QoD+aGteWi/jWjgs3PH6ogWSunuiifjjX7kkIm4
	vbOz1XWQKhM0bpDU/fZwyJLMaq1UdnpqvRakww5cBl3R45Zt1Cte0WmJVTwCc71v6h+nC2QAbTi
	4CZ6tUCNHWd1hWRyp4CVOHJsPvl+Gdi0XH/gOFPQrt8ybfSJZl6qMdAM0rILYUip0BVi+Askrex
	1tGD75VBAOEO5l2aHP4sV4qRw7Tw12ifHB9L1Puz0c+LzbB2kvg5EvTkU5MjBX+yB3ReBXv4XGq
	8rnpbH04V6YBO3z8n4mzpbMCGGfAr8BEGexXRfxd6Fbric5x/2ikfYIlx+tDAXxLMXpozJpne8Y
	Ng+3ydLZ7F2L/Bj64r2jDpT+HAp0RSQzg7yKjjH0tw8+zsMo+pEbA==
X-Received: by 2002:a17:903:b85:b0:2df:9497:3c89 with SMTP id d9443c01a7336-2ea9c953f2fmr49737205ad.59.1793003451901;
        Mon, 26 Oct 2026 01:30:51 -0700 (PDT)
Received: from lgs.. ([101.76.249.61])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eac37ba924sm5584415ad.49.2026.10.26.01.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:30:50 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Azael Avalos <coproscefalo@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Darren Hart <dvhart@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] platform/x86: toshiba_acpi: fix UAF after IIO registration failure
Date: Mon, 26 Oct 2026 16:30:42 +0800
Message-ID: <20261026083042.3982005-1-lgs201920130244@gmail.com>
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

When iio_device_register() fails, the error path frees dev->indio_dev
but leaves the pointer non-NULL. Since the probe continues, a later
driver removal or a subsequent probe failure can reach
toshiba_acpi_remove(), which may call iio_device_unregister() and
iio_device_free() through the dangling pointer.

Set dev->indio_dev to NULL after freeing it so the remove path skips
the already-freed IIO device.

This issue was found by our static analysis tool under development.

Fixes: 98010f1ea0cc ("toshiba_acpi: Add IIO interface for accelerometer axis data")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index a0b8060836d0..7a7afae0fe45 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -3493,6 +3493,7 @@ static int toshiba_acpi_probe(struct platform_device *pdev)
 		if (ret < 0) {
 			pr_err("Unable to register iio device\n");
 			iio_device_free(dev->indio_dev);
+			dev->indio_dev = NULL;
 		}
 	}
 iio_error:
-- 
2.43.0

