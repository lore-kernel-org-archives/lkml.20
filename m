Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886372;
	b=quPXqF/WLRFKi+nBb3SCiiYC5yWM30hKZTNYgfLaRXNB/sZJ+yYoJhKmzT+nqDsqYdUV
	 I8WSEfyzaBto4eEz/ZlTj+a7AiD162RPvtLAnJAI/TGZnwSi97npK2HS+ZfRCeF8wrxhr
	 Tc/16AmM4cqnjRwAYFY1oVlQKABqm8Df5799CBbWNG8BucDA6wQABiYkXduihCvDTLQsY
	 pdY1SdtyGG1Eu0fxida5jha9wBtX3o5oK3bDz+U5lw8js5fDZt37WMy5CYw9zrY8whRUB
	 06Fjlw2M/pZ558x7CCFLP9JP3V+wWTX53OwALDwyiRX5Gsv1Cy6ymT+Jw6Ou12P7/xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4djbjbi1YPfL0yTh51RFEqcdY/dXJsBUTG3y/N5WRfE=;
	b=f802AXTaJQzH30t+zgXn8V1IFdrij1Mnmb2HjXrIYWG9JagB8L7r+WmAaf4R3wynXmaq
	 p72qq3FkSdn0ERzxLNCJWFLBOHMcMLXWwbXp9bSWoFM9kR9TRLOtC54XO/4O9wnxzEe1j
	 enQ73NEENP5EHFgCchWoR7R4X9rq1fsS0XnCv0npW12br33x0BVuBRUw6z97cgLsUYwpy
	 TCYANTwaFyUPhAS15xhmBwRuOiV55P2Ai+o5YHSkjyEjn0aXcT3yXE5XgtXmIGMbwOOBM
	 +iCOpDG4WFUc2fUN8ohxKzoG6NvV7rGynHwxT6dlO5x+WZwlA3E2jyE7KVjrsHaYzYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jl3ekn82;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CE3606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0CE3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jl3ekn82
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36661f953e4so2615239eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793886371; x=1794491171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4djbjbi1YPfL0yTh51RFEqcdY/dXJsBUTG3y/N5WRfE=;
        b=jl3ekn82R/VWIVF8HSyd+ZCmz5n9lZAUAODBRyhdnoxHd6ujW+jC3NBXDSENyxjBC1
         e4bv4gFgutFFHLnENKuYRfwd4NsDk+VClUwtzA0mRvl3PyWPAEkldb3ByQkg1dBaxLI3
         Xepmb9ml3+D9JYGOXM5qFIqwMDYlGZkUPiQq/t7vKKX5jmLQqEs0Ll+Aj/TZ6jutnxyh
         lUUBnH5fBc8bmv5MuOuBmY9sV+O3AzetWZKmxQVMR5YTC7/V14ocLbKkxlgA06FK37Bk
         FFBEWsI6mJnd3AwCRo9O+aP4O+SOQEnJGBJTVHqL6GVTpIKmbezvvRrjnXLuowma9YST
         p4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886371; x=1794491171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4djbjbi1YPfL0yTh51RFEqcdY/dXJsBUTG3y/N5WRfE=;
        b=IwMC0+sIcU+Oq3R2uQSvseo/S8gix17lfY2T7gFyfoYp3DRpMAz/1ziAVpPSERqL/5
         2xDTFXCswLlypUEV5zJ4BoD90EqeMiTWJx4XSg5IWKnQ3kvY/+uzQgeC/8lrUmvc2X84
         QuDkjambVbTCpKpqHmxApVAIku1heVNgu5bqgkD35RmAm0uaBM0wSrgbUwjenUzy4rxX
         hHMCFNfjJVHTGVeO3PNIH2EBikmP+exiF1VY9QaJBkPqCDvzMFjj6LF9c1qOR3RuzgJA
         Ixdnix5cpSBuczRZYV8LzED1IN4SFadSWmy6TaAUAKo7cMHYzBuXUUSni3+XWRVmzcEi
         1EZA==
X-Forwarded-Encrypted: i=1; AKwUvBxk+dWJub2LIdxP6qF6YDOeHmFjp21iQkmnnjaNmr8+PHbe+XxC57pitTmcWCQmjeGA1ZmURfRR1yZSWKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AjUqd2eC+LAVn7KGzHPXWnGWA4/nUwPoH3T6pfHflH3GZxfXi
	3VPRGXzWAbD/MKmDnKWlvzckR2C6Piqxp5ZNgShIZBSS3zHcJMTBVMde
X-Gm-Gg: AYBFou1iJkYb5ec1KUVjbexVVZuNESSJbS8SFeiWEqp7AJEJ0K2ERb7WsuGV0C+lG78
	WQuPnFiYxegdN1Q3jrB+3ulpMpgIX6wZdye8Cj0V4RZNMZAUzNXwhBwLTXvgpfjTd2p5Kl4Hc0y
	jntK8CzkpQ15LNVtBf7phhbyfzxJUQ8kbbVOdBPg4Wq5qUUxvldeUGYKJcbG0RN7HHu/pbTkpee
	IKnkgxMOqfdxxKvPuk2Q8DS8dOg0oDr1eWV1kmbpYakbJMaU2TERVOk4xXwLimgzK/qV0NWWmjr
	vcWNc5LeqK9wjzSxrLX7n57GM9cfPGus2yefrcFaJuYPi2Zj/Jvd1+qR6h8hFtp/e0xAUyI2gcf
	XIrmbkgJ+sRnSk8DimG1DqGaUD+Q6WVZSnAV/XVFmSVqdI9Iq5d6yaLTBUdE7+jt3V6CaNks4R6
	wwiGnV9FSj0RqZX3uSFPbEQiCrnI+3MWdXvqEPAFQ87mbix3CmRqC5xje3radK22w1zRUT+f5Gf
	D4I0A32qc6RqEZ0YzVk7n5b8VEN4w5F4XHyhAJBvcn5MGF/q63IW+4/DulmkfgIMLqA8tURO7iq
	x/nwM/3womHUUUY4KlM3biwkVnM8re7Kmsi2Ip3WIhLFtGI8sCzudZkshY6owuTrEZ4=
X-Received: by 2002:a05:7300:1351:b0:36e:a321:5353 with SMTP id 5a478bee46e88-36ea3215cb4mr2389132eec.2.1793886370684;
        Thu, 05 Nov 2026 05:46:10 -0800 (PST)
Received: from ChanningdeMacBook-Pro ([240b:253:9800:600:bcd8:ac74:ffb9:55cd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3966daasm22454844eec.23.2026.11.05.05.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:46:10 -0800 (PST)
From: Chengyuan He <channinghey@gmail.com>
X-Google-Original-From: Chengyuan He <channing1ne@gmail.com>
To: linux-nvme@lists.infradead.org
Cc: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	linux-kernel@vger.kernel.org,
	Chengyuan He <channing1ne@gmail.com>
Subject: [PATCH] nvme-pci: add NO_NS_DESC_LIST quirk for SSSTC CL1 SSDs
Date: Thu,  5 Nov 2026 22:45:26 +0900
Message-ID: <20261105134526.95382-1-channing1ne@gmail.com>
X-Mailer: git-send-email 2.54.0
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

The SSSTC CL1 series (PCI ID 1e95:9100, e.g. CL1-3D128-Q11, a Silicon
Motion SM2263XT based OEM drive shipped in Dell laptops) reports NVMe
version 1.3 but fails the Namespace Identification Descriptor list
(CNS 03h) with Invalid Field in Command:

  nvme nvme1: Identify Descriptors failed (nsid=1, status=0x2)

nvme_scan_ns() gives up on the namespace when nvme_identify_ns_descs()
fails, so no block device is created even though the controller is live
and namespace 1 is otherwise fully functional.

The failure was reproduced with the latest vendor firmware 22301119
(Dell package NJV53, A09) as well as with an older third-party firmware.
The drive reports an all-zero NGUID and EUI64, so skipping the
descriptor list loses no identifiers.

The generic Silicon Motion SM2263 entry (126f:2263) already carries
NVME_QUIRK_NO_NS_DESC_LIST. This drive reports 126f:2263 only as its
subsystem ID, so that entry does not match it.

Add NVME_QUIRK_NO_NS_DESC_LIST for 1e95:9100 as well.

Tested on 7.0.14 by booting with nvme.quirks=1e95:9100:no_ns_desc_list,
after which the namespace shows up and I/O works.

Signed-off-by: Chengyuan He <channing1ne@gmail.com>
---
 drivers/nvme/host/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index eade0b1..af19c75 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -4282,6 +4282,8 @@ static const struct pci_device_id nvme_id_table[] = {
 		.driver_data = NVME_QUIRK_BOGUS_NID, },
 	{ PCI_DEVICE(0x10ec, 0x5765), /* TEAMGROUP MP33 2TB SSD */
 		.driver_data = NVME_QUIRK_BOGUS_NID, },
+	{ PCI_DEVICE(0x1e95, 0x9100), /* SSSTC CL1 series */
+		.driver_data = NVME_QUIRK_NO_NS_DESC_LIST, },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMAZON, 0x0061),
 		.driver_data = NVME_QUIRK_DMA_ADDRESS_BITS_48, },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMAZON, 0x0065),

base-commit: c64d9b2c1f4fd1d8fa52dab37b48428a99c4d58d
--
2.54.0

