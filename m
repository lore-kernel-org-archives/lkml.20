Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678533;
	b=ihapVH5J0HWEvB0+Yie/Zv+9DXA9y2tyXy7MIG08eKxT3m6MPgeVNgSkryEQqDB+vzzq
	 ytDqYd0efQNsM8aRGntLdpsi7WL50hZ39HO4oVgJDvFjS00X4hyjIx8XEH1a3kbxJD1Qn
	 qNyxKZwZNV+68A+MxJ5QpaA+7aAcd0/lvfdXaHv6g4yolzaFU9RsxEdvcdWIzKU+WX/sa
	 tfgN6/Gsfoqs1lGhILN5RWY2Pz64Y0iWP/fi8vGgsjpLjaGOIdlIS6XaiW1ON3yXljis8
	 Q8WxfbdMqspMxcnG8JUFQ1o0k3voEY4U61wE9plQOcKq+L5XQCbHzpdV3o37lG5JHcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Z/UcwHcKXUqaXtKk/lpD8kvZeZD8k73uW8qTCjwCp54=;
	b=hPyHIiPpAz+WmcHyaUZvQkI+umzQ6V55FqQXL+6QFySfjC/h5vj6Yz0OS0hhXyzC8QvM
	 IeY4dQjxraQJ90PiqU9mf07iWBzOCqP6JmYBCBIVXLSKpU3+BGDArms43BCvnzQ4m48iD
	 67gF7tvFwbZD9R8HsVRvr+sRB7NyfWhIZwbeKp9H0XG7d37HuJ39ftGDqMiRlM4dE4cKR
	 UFG+MjC35ZVa77s5e5FqQszgtjsukeedGDOglx1yC4joY8EfUj/aurbwG42pp2zZ7+uhE
	 xDRFNfWLcKXrSTgS2oezHKbWP6aVqfroFtP7J8ikLWClKqC9TWrfEdObaEUwjVawT0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rRxj0ctq;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2E6606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA2E6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rRxj0ctq
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so1404240b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794678532; x=1795283332; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z/UcwHcKXUqaXtKk/lpD8kvZeZD8k73uW8qTCjwCp54=;
        b=rRxj0ctqpPtesi/Omr/um2Z61N/3D7qp882DAP9S1NCCR8QNyqo52R9c/iXb9q35Lc
         wBkDdAXhVY7dKlCcCRu54s6Rw27XQKmcPaIacL4r1OJQ0OS/6D1XSO3hYiNyEMGUeW+c
         YQEgWGk5c0ehv0Vg0eugObUB8lFMW1vADrq77DK3rPrM1TBLURk3bzDA0AQvSj3OYITk
         BrUxj8wRR7idJX+JzDgpu9T67rEMPrsdbbqFcX8UugxC2ZODiXHJ3UUg2lTq+EBii9Yh
         BIOtwQSAwVgHfwUfwEZmbms4UAkpn8cZ+O71VwOiHWklyT3tQIOeLmcQ4meHSXJu7H/D
         4c7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678532; x=1795283332;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Z/UcwHcKXUqaXtKk/lpD8kvZeZD8k73uW8qTCjwCp54=;
        b=j8w/DLQBeBokj2Z/cmw+z+xrYIKYKnamV7OE1DZ4IL0NmR+kwdRDDGpCZqObGbamwz
         exKhcRCjUEQRiYGBTxNlBZSQaWAhXztdrSG1pAnE4LeXJ98r+CMzVqUJ1JGaiAZBSZmW
         ESAqchjqD4QZOxCO1o9vmPYpCtXlc9zB4x4ApR4LIFafpgMKJme+IvYgbNhMmz7eeBCZ
         zjvPHgisKMXXVw2TgHFKn6wN9CVZq9ZudYLqmmCoR7tLeLlnB44kueQ1fzhd56TmpNQJ
         N6+wJLHiE0ZaHko7QKb5MeO2VXp9SdwNWX2SIhL7cDYDWT0fPKzXuJqS6Z8XdU15iJQH
         JHJA==
X-Forwarded-Encrypted: i=1; AL+hErEy9ACD8JUs8O5N9WbvtEuClOk9k6h1HnAzuKRGe7zmAP7B1PLpd2R7ODGqAVoDSk3wFqr48VU3n4g+RV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Dtu52fK8YW68PHzww0sIGHZjhbRjCtKdXvUe646J6Pg5SkFka
	cnvQcxeR24iXv03xUdOYFejhZ0w9QaQb0uQCI5NFjDHprRpGgR/dzqVo
X-Gm-Gg: AYBFou3dN26Se4PsR7ASOgCgMxWMvgxaEUudJO9LT8FEYPD0DxUf5GJE50Lp30iUgeK
	WuOxqDUd9U9qIViqw9QQ11nxZfszjC3trkQ4KHp6w4e6aT5iZwhcAx1x6x4KPK1mjQWBWUo81gK
	UHJXD7Mdfkex5V0z9cftiRItgJoDreztX6OwOcIpRwU00J+AiAkxFHrCVKvMkdw/4SbgVWn9HGB
	Z97Btui4MX+rtFto3KLOrZciLfFfCkQ2BowAAqvV+e2vF0lZ9pTq5dspgLmCLQVuAakiTSqojTm
	pY0nMkkGOY3GRgTxIxQcWuJ3Eez9rYRgH/agIbPVRxXHpoEbAkVgiizhf7uaCg7XcTwLQ/XF+3X
	meGIrCiSCxxZe739dBXBEU+5IWi5vxAaKaH7PMVnoy43df7nGtj/NfM1LSArWZOMTp4GWcR/53+
	KOVqAFqWT08Ez/Car/s+t55jVWy1ZCYjDAd6INdPIbgX60pPfpMfhA5CWC6X0Ho88ySuZQfxc36
	uUfV7ChK1SXkJ7Rn0WcuQFollWtTB/ublF/f3tVwyrsmEjDP6HT2oqm0UCEJ0c/uGh4FdKL+Ck3
	uLBrsBdX3jCt96A3EUGU17NPYn2/My2bYWaQFzAISaPXZfccXiceBS2AJA5ko6IkQ5j+jl4oq/3
	fhF/YPJ5Io2h5lHOBG2D5q02d7tWr4w==
X-Received: by 2002:a05:6a21:8203:b0:3e2:490d:5127 with SMTP id adf61e73a8af0-3f7a4dbe495mr6706402637.2.1794678531850;
        Sat, 14 Nov 2026 09:48:51 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:b6e2::7dee])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cddc18b4352sm2670802a12.24.2026.11.14.09.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:48:51 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 15 Nov 2026 01:48:42 +0800
Subject: [PATCH] spi: spi-qpic-snand: fix DMA unmapping on probe failure
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-qpic-snand-v1-1-74df634096ee@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDVpCUldRSyqpoxF0UEkjbsrl
 m/xfwTGQMjQZBECnsS0+ASVZ2An40cUNCRDIYtaKVWJbSUr2Bs/CNSuRCeNtqaCFKwBHV3frO1
 +89HPaPf3APf9ANXl5tpuAAAA
X-Change-ID: 20261115-qpic-snand-e9f3ef0a9ca5
To: Mark Brown <broonie@kernel.org>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794678527; l=1199;
 i=ustc.gu@gmail.com; s=20261030; h=from:subject:message-id;
 bh=PW6c9S/gzhT1sfHRfpQ0G/XwjJdB33xWHslK5WJM/Mg=;
 b=wat4but5y2s3u9Lfh4bhf/ILk8tlX+ZbL5jq8u2nhvZRjeLummejFXOWVqRDdm2yr0HimJEWD
 ZZ3YOS0ZfyoDxfsTB/wzrGls5bwE7glQnT0i2QSBN3rvMWambq5yTNB
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjDJtbnSeysEBjmOfNYqYUUDS6g7Tfov9W5oGngTBfo=

The probe error path passes the physical MMIO address to
dma_unmap_resource(). This can differ from the DMA address returned
by dma_map_resource(), causing cleanup to unmap the wrong range
and leave the original mapping allocated.

Use snandc->base_dma to unmap the resource, matching the remove path.

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index b03e2e4f0f0b..6cb6e02d2498 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -1668,7 +1668,7 @@ static int qcom_spi_probe(struct platform_device *pdev)
 err_spi_init:
 	qcom_nandc_unalloc(snandc);
 err_snand_alloc:
-	dma_unmap_resource(dev, res->start, resource_size(res),
+	dma_unmap_resource(dev, snandc->base_dma, resource_size(res),
 			   DMA_BIDIRECTIONAL, 0);
 	return ret;
 }

---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261115-qpic-snand-e9f3ef0a9ca5

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

