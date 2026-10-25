Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956983;
	b=tzyi1q+hUDE9cCE7LLONYGKp/c15e9L1Gm49iXkin9YRw7KEADQuG3o+aCSC51KGHXW9
	 /tcKVYS7ZngM1ObQOGjQRzx+wZbKqfyvsr257Pqz0swK2qgOie1Q98kTthpe8LcJszLKW
	 j4745JNYzwunbZui570IdOpF5Tk85hN0FQPzWuqP3xOPk5zxWcUHFeqMreWuxP+IdMu7z
	 j7IJgiuZA1elUhfmr0ka+5ZE0IMaU4s2nhskfu/Akxj8PHAKKGoJqc5X98sLnaiY/zw+U
	 d3D630+gdOYO+L09r425+jTrs7GICUBpzEDbMURKgN9Zj/oZhL6jz0uE8Fhxa5ra+iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Usi5Od7DmgDnTI9m3ylgBp7hWkBBCLCcNs8Nj1ahbJs=;
	b=UIIu+aC9rPvB6vmVyox1/qJDJQV9twQE1zbZZLFKqWwfnahQrQivhv6X/ZbQJkoy6eD3
	 Vyru9PWHSifZegVP3k1b/aIrISJ3uSCju+UDkpkSB89qc9J3CZeAuVTCAck3gwTK1iBjU
	 eFVILx5lwkmNWA+fXWUqcPQu9f/IeNrV8sOfBJgS/bxFypW3ZEWX2qMy5taxoqlZa/QSt
	 CVI5yLunZbbs7rW08oQTqUgM5tBimFd2HvVsCTIkovAc4fqhVcNWQQiwA6rK7OF9ZM60X
	 lss8fYcz2K2HNCeAuMhDa9Fc+EwTsm0TD1lzDK9JJ3xpTVI1WQsD/Zh/37gSkEfK3Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L+RYz0Md;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A576B606A320
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A576B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L+RYz0Md
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-179b5e88e02so13062c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792956982; x=1793561782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Usi5Od7DmgDnTI9m3ylgBp7hWkBBCLCcNs8Nj1ahbJs=;
        b=L+RYz0Md1cm2m7sStJE/h0TZdMEpXJDyIwAQCUqojbmSxNaLtJnIK3ctAqM5NFr58J
         EJ+hjDR4zq0fgK+6r5pEyiMLUfdg/KEVbW5zF5BarpStbhab9U3k5Ii4Ewv2x0i1aSP5
         DUQCFXOGBUww0JDDFwtS1yvRz+G6ho0QpJFiGyuboe9nVMXagWTFlzUrGc7I3u8UBaIE
         4ju++cbf2gvCQZfoJ8d7fVqIHnMxX9BssJOO4P3xGa5GHmziLTOd2oQcXuiAaw89IVnI
         qnJWhZDkSUsZojksHS2jL+pxXKUdkTKjslHVhZMo2qvhU05UXChDEj9m+q+bH2eXQEZr
         LQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792956982; x=1793561782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Usi5Od7DmgDnTI9m3ylgBp7hWkBBCLCcNs8Nj1ahbJs=;
        b=Ng8GAiEKF7myzK7nzmZHM4RezzW7gUQSAG2oZqI8+nTR/qDLfVSzMfhlytdBobGaC0
         eHYp2WNeEyPt3V1n+ryA8gYzwU/saBdo/BiixoBmQxHJfRt6l3+iJUSD6m8f3On3Hxhp
         PpaPQsDE19CLZHJswoSwutJWQe3GDZ64SnCSd1d05sZDVLm0lXMzLMitk03MxcBgMH08
         e/X7Peqh6/VdRTzT8ZrivN+nM8yN4hL+hePmkSurW+IK7vBViwkTQs61DZ002Zrj9cYD
         IrUMSeZWIAZXAGo1GQZLROVEFIwX87cVZpBhcHJRY0EWYqkiKixIrd2NON+P1i+Jfpo1
         dZ4Q==
X-Forwarded-Encrypted: i=1; AKwUvBz0Qk+Yi9uqTpPedJLJRHmMoOwR73yuRKweVZ2vjTncLHfY7/OPysVFeguXtQHiBroliFAcNgqj7XTLFZQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNqGcSp0JTFvQhYUUHu17JEz6Go1UKXeVZUgtzDTXC1xfuqnlc
	2Y7r9L3R598tlJAAbSxNOO6bJlfv3AaAu3otF+/dhrfbVQSKz4ssvz/XYnP24PlJdow=
X-Gm-Gg: AYBFou2XrZlX/RnrOeI6ZDhl9Wdah6zUcpJyl8LOixhjOX1g1Ix1+NcTDNjF2PlWljy
	YR3lc8x7UGMlRz6hxoGEbsVHPSK147mkz5fRvDvlkri3mXJe+DO12fqJV8uBsb4AZSeLN3qRoAg
	jhLOLik21soSLdM5GBwx1MKhViz2pZLmenxOE0suZsHqH6idGQHxxz1Sd/QDpc6TYG+/E4Jcry+
	xYWZw58/5hHlg4S+z4Av9CNvK8QF+MOpWOKBnsKmTTXFcD7zTizZlG542euVcAUOJAe9lQSzMnt
	PYKiJh81It7oRSvQ0jRUQBVBhsb3cMrDALns6UbbAHFOoME5CIdLCPCJySPtCWjbQA4QE7/m6P0
	LF9UakWPlhhJJgBKY4SB4bXLNchNtDrRx0OZX+FkgWGbim1FkvAWdZOwlcnLD34/B1sENif8wpl
	hlRa3q1s7ErpWvZRJesQFXV4HnjyolMVKn5sle4Y3o32c5n2G/fdOyWi+BdIvfSCTFToMeq7BPO
	SJrlSCNmyz6kXyPrjm7IQx5OX/rkCNk6v7cjF6mi+PME+lwfYTIBerVOIAy7K54FuS4w5oGwmnq
	6sUpd3E4N9W0fGKLgFCIokB2VUTI8Rz0WKGv4eStM48fCFZkUGyf8OwUffyVL0N/+yZWeEJEtrs
	=
X-Received: by 2002:a05:7022:4582:b0:190:e602:c769 with SMTP id a92af1059eb24-19933e0f4e9mr13886917c88.1.1792956981595;
        Sun, 25 Oct 2026 12:36:21 -0700 (PDT)
Received: from cachyos-aura ([45.112.149.26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm21412877c88.11.2026.10.25.12.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 12:36:20 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lee Jones <lee@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mfd: intel-lpss: Set d3hot_delay to 0
Date: Mon, 26 Oct 2026 01:06:13 +0530
Message-ID: <20261025193613.278610-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Every runtime resume of an LPSS controller waits the default 10 ms
d3hot_delay in pci_power_up() for the D3hot->D0 transition. Nothing
misbehaves, but the wait adds latency. On Arrow Lake-H (Lenovo Yoga Pro 7
14IAH10) the touchpad's I2C controller autosuspends after 1 s idle, and
the i2c-hid interrupt handler for the first report afterwards takes
12.6-14.4 ms.

The PCI spec asks for those 10 ms, but Mika Westerberg pointed out that
the LPSS controllers are not really PCI-connected devices, so the delay
is likely not needed. intel-lpss-pci already clears d3cold_delay,
quirk_remove_d3hot_delay() drops d3hot_delay on several older Intel
chipsets, Cherry Trail among them, and commit 815b4448198f ("i3c:
mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel controllers") does the
same for the Intel I3C controllers.

Set d3hot_delay to 0 as well. The handler above then takes 1.1-1.9 ms,
with no I2C errors. Only Arrow Lake-H was tested.

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
---

Notes:
    Changes in v3:
    - Describe the delay first, then why it is not needed (Ilpo).
    - Give Mika's full name (Ilpo).
    - Add Mika's Acked-by.
    
    Changes in v2:
    - Drop RFC and add the review discussion to the changelog (Andy).
    
    v2: https://lore.kernel.org/r/20261022040453.45797-1-navonjohnlukose@gmail.com
    RFC: https://lore.kernel.org/r/20261016114347.23633-1-navonjohnlukose@gmail.com

 drivers/mfd/intel-lpss-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/intel-lpss-pci.c b/drivers/mfd/intel-lpss-pci.c
index 63a3fb58566..5672f033e5c 100644
--- a/drivers/mfd/intel-lpss-pci.c
+++ b/drivers/mfd/intel-lpss-pci.c
@@ -70,6 +70,7 @@ static int intel_lpss_pci_probe(struct pci_dev *pdev,
 		info->quirks = quirk_pci_info->driver_data;
 
 	pdev->d3cold_delay = 0;
+	pdev->d3hot_delay = 0;
 
 	/* Probably it is enough to set this for iDMA capable devices only */
 	pci_set_master(pdev);
-- 
2.56.0

