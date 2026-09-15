Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DC5370D43
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459205; cv=none; b=bEQXUy2IvWN/RuSVsOCQPWgrEsai63WSeTUdxXcJxRJNOb54n/2czwIBIxjTKBvoX3Jnr7+vUC73JDiSTiTO+KrSczcY7MbW31A49cksXUhTgDNkCSyjuPBCjs3JXml8kGuvJ76dKCGkay73QZy2refe5WgOillJYyTM6Ihh6NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459205; c=relaxed/simple;
	bh=GILNLQIt4Kvkzuaw/uizZLn8SlGgfvSI7pdRyWR4a7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r9F35MvZDh3gu/LJ7egCO7tuXVLw5VS9jFqa0yPMT6QrfdpE5B7MK03qkoHpmec/Yh0xw8Yqx0VFde73w5XLLQEMaiIQD0LZ1WfRjXyIsi0MNJPJ+LRyso1qmJA4BHoQsIHBrgweavfvO9I9KiD5VAXkhljIGo9FEYvzpKdrIhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXntUWX/; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXntUWX/"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so66165e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459201; x=1790064001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0lHkGbv3xQAD2AcFEaHFNC5cNK+7NTF1uSPhL3tTLDI=;
        b=eXntUWX/2NmuT3oyAmiXdtbNrFyaJd6PdR/1zXy2C7vDVNy5Vse7rOn0kNBA9pIb2u
         tUf6Sjq8I8VAD4sb8fLcJDwh6P+9+F87r8bUkVRMzEnHUX/GiiRE2uu6F0Y0dBrwKXTA
         njksgifG9qA4RLuTsrcP0ylgSRZ3LsIP2q94UDv1OJSx6zB1cu8YoknSPL6c+lIgz+Pn
         N8qNLs4js0ZLxy3oBVVfu9C2YKPg9Gu115xitO6rzN/r1ZJ+50xJJNey09CjudjdtW0V
         XD3nTioCTbgoRBl678as7e5NpnYVAVbNDqPavQ+WxZKZFds6u+0BaGa5D6WpfXSKqUaS
         8UMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459201; x=1790064001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lHkGbv3xQAD2AcFEaHFNC5cNK+7NTF1uSPhL3tTLDI=;
        b=Tw5plSMd16rM7SbRIPL7C9ZXtBvNjtpxRG3TP5/2UupdiWu66IJPZR105Bq7B2GVPO
         z6OTKhnWoS+LJ+ivt8N7mvuPtXJZBghoRjzm2Mrmzf9LOarhH1eQyy0Ee826J1Q5SdL2
         J/10+AndYO2tyQQRd92A6rozftd6nUaW5fs/bgVRtJr2AJe4gwNXUjGNFdL412zpIDaB
         5Ot12IjH1GoVteBDg9fm28DsAn62pFp0+XYYaeh0m8fYXqL2qGO2pGxwtDuZHvIq8kbp
         yVMKBvXl689AnQhcoZ2l2To5QVBw5/qd+4dWQKOo6qQQym8Id/PvC8Tsl5H22LX2F8cj
         ZxjQ==
X-Forwarded-Encrypted: i=1; AKwUvByAZMWjhqa3xx9wrQQE2jqzSjB5LlgkFzPsUzRkvDgxCm0Fj/Y0SsbY4nIRhRoFMv8K9cFIu8x9YavCJAk=@vger.kernel.org
X-Gm-Message-State: AFuF++lNyfpadCe4seyxmz8rvlsFJsBEhfF773TfSqkUJFNq185TDEX0
	4uChk87yfGSpQe9pnBrRmhKZqdViqRoLDkMC+Yhm6e2QH+N2TQFTWXaX
X-Gm-Gg: AYBFou2dHWAp6EXOlAoO5e0TaFJ25IZn9wCuTzQrMQh2JX1jkVSCGhn3o5zvMKpKJSJ
	B965BInvwzfBBZV5vd3KeJZ5QAMWNkOocEgs2zMZ130NVW/Apph1nxHdEw62y2xur8i3aSjCc3n
	cUkMhZenI0fPU4IAFEEvUBSUoZ3uyv0ZUL2jJy92awxFkiiv+ZBGw9Rm8OA8eryFxi4e+IAt1Tu
	3+fvU+XNt4KPoJjGgeDMJ7GZ4E97JTJ5OthPYFTqMADgJpIHrNdM5QdafoUVAze+T4CvozwaKK9
	XzZjOquQepUYaU0s5ird5fhZya63dQkIZX1gJtAEs6pp6ZXLZrVgqog0+TRTMc6GjBoRO4xeLcb
	HDakQFBwnbX+WWQzY/U/GWdfYX/in+Fe3i5s0goIdYfTUE6wXhpP4R1thZT+lbqu9/Q6OPuR741
	I//kKd79qPZEZcXMVNo3h06IiSr0ZrBpUiw98oTPGxqHesp9DGKD31/5nrCgqoqNc0Hec8j0TU7
	dqCQprN0dxgNxbqmAs=
X-Received: by 2002:a05:600c:4f4b:b0:49e:70b2:66ab with SMTP id 5b1f17b1804b1-49e82176603mr1629885e9.0.1789459200433;
        Tue, 15 Sep 2026 01:00:00 -0700 (PDT)
Received: from fedora ([154.182.99.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6bf4desm64112155e9.15.2026.09.15.00.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:00:00 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v7 0/3] staging: iio: adc: ad7816: Fix SPI operations race condition and DMA safety
Date: Tue, 15 Sep 2026 10:59:36 +0300
Message-ID: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses separate issues in the ad7816 driver regarding
race conditions and DMA safety across all SPI operations.

Changes in v7:

    Patch 2: Moved the mutex to the top of the ad7816_chip_info struct
    (right after the pointers) to prevent struct padding/holes, as
    pointed out by Andy Shevchenko. Also expanded the mutex to serialize
    ad7816_spi_write() to prevent race conditions.

    Patch 3: Dropped the dedicated rx_buf. Switched all spi_write() and
    spi_read() calls to use spi_write_then_read(..., NULL, 0) to safely
    handle DMA using an internal bounce buffer, avoiding cacheline sharing,
    as guided by Jonathan Cameron.

Changes in v6:

    Separated the alphabetical sorting of include headers into a dedicated
    precursor patch (Patch 1).

    Kept the mutex addition strictly focused on serializing the read
    operations without modifying the sizeof() argument (Patch 2).

    Moved the sizeof() argument fix to the DMA-safe buffer patch where
    it logically belongs (Patch 3).

Changes in v5:

    Split the changes into separate patches for bisectability.

    Replaced stack buffer with a dedicated rx_buf aligned with
    IIO_DMA_MINALIGN.

Abdelnasser Hussein (3):
  staging: iio: adc: ad7816: Sort headers alphabetically
  staging: iio: adc: ad7816: Serialize SPI operations
  staging: iio: adc: ad7816: Fix DMA safety issues in SPI transfers

 drivers/staging/iio/adc/ad7816.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

-- 
2.54.0

