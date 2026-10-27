Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793097396;
	b=LsuGmMBDXCB9lnPbD/0l10d+zfAPMpTOCI/dKXJ/hBdllHfXlMKvY26NHHixSwLrOYtv
	 3pMCvXpy8yQs93ND0T7yhNZVkH08rxxwcZTDXklj9KG4MQqQLxPFd6JjIW+HmM5NWOGNf
	 WL1OpCd1Ra+MqucWRZM/XPhPGrZ5j4+34GHRwsgjIWBP1lOcWRthy4Cyeh9tVs/eWMpdu
	 tANnELXiB1W8zUTO+DQs0Io0d6ckrObICRtj0e259k1b458pg6Moj6929a7U47MPS2lZ4
	 pje2q2kaKZ+X4Jw5JE8wDopyy/fDCPtKeaoMQXLWL5vD3ccooxIScDgRKsGRfvNgw1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793097396;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=PhZYi99haeVwLl/xerdQBoJ2WYUBPvmlYKxW8sH+X34=;
	b=4mshUlUrvbMV9jgnzLbWxqvzYkDTAuQ0njcexnTjwnq+hCnkzS8hB5WE32HfPVk+hpBz
	 NSb3nYVqm0kfjTxdpLeWQB8xEB+pby37dIxS6C/WrLOD5Rcd/ii8M51SU9GPw56Z8OClX
	 WlzcSX8U8FRKs782+lX8IySuYqNYmeatRfkNy/6Acc/uiXUFBvecRaQjEd16hWO2HY5iF
	 VASLftLmqhrpk8CA9QI6SkCOdWHopAxbRxTK7mQVvSPkIWAuisTNzyQ+iaef7PBXd2/Kk
	 sihVoZCK5PKarU5M/xsrKTV9PoSeHDBbsSU0ujro2k4GMNNw52Dc0hj1wh2vobfidJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NyN1r9G5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F13606A32A;
	Tue, 27 Oct 2026 10:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NyN1r9G5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8701F031E3;
	Tue, 27 Oct 2026 10:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793097396;
	bh=PhZYi99haeVwLl/xerdQBoJ2WYUBPvmlYKxW8sH+X34=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=NyN1r9G592TA+Kxpe7XMkGZq031N7inRgzyv8n4M3NLiJi7Yw38cOj13afIGK+++G
	 Hi0XtNkJsRzuR0sRZe00JcFRf6E+nJSREnWqT0Kwxn1PijQc/1pV62yA2xMahNUVdC
	 x6FArKYdC1BT+pCAlBsF0sZKHF9K8YXUR4mhSNRN3X5v2pdp8aBFnb/vSmPqwpAfIN
	 n2TF31TbRpRKwsW1FCJH8Rn2FFCUCCkXw0/GYslOJdX3yQdyjf3B9gwKsD9q8L6tNs
	 50uthOA+2Njri91n/MwxWZZ2+armXh7zMhv/qAFdJqWdFomXJOZtr+Y9rIGJp6IqPG
	 ynSa314IH/3xQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Chong Qiao <qiaochong@loongson.cn>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Corey Minyard <corey@minyard.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/27] mfd: ls2kbmc: Allocate simplefb platform_data on the heap
Date: Tue, 27 Oct 2026 09:30:33 +0000
Message-ID: <20261027093306.2812695-5-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261027093306.2812695-1-lee@kernel.org>
References: <20261027093306.2812695-1-lee@kernel.org>
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

ls2k_bmc_probe() declares struct simplefb_platform_data on the stack and
assigns its address to the display MFD cell.  Although mfd_add_device()
deep-copies platform_data via platform_device_add_data() before
ls2k_bmc_probe() returns, the shallow mfd_cell copy attached to the
child platform device retains a stale pointer to the expired stack
frame.

Allocate the simplefb_platform_data structure on the heap via
devm_kzalloc() prior to devm_mfd_add_devices() so the pointer remains
valid for the lifetime of the child platform device.

Fixes: 0d64f6d1ffe9 ("mfd: ls2kbmc: Introduce Loongson-2K BMC core driver")
Closes: https://sashiko.dev/#/bug/linux-4e2dd9cb-310b-4bba-b305-ffacc738285c
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Binbin Zhou <zhoubinbin@loongson.cn>
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/mfd/ls2k-bmc-core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
index e245bdee8226..3e3bc835262e 100644
--- a/drivers/mfd/ls2k-bmc-core.c
+++ b/drivers/mfd/ls2k-bmc-core.c
@@ -470,7 +470,7 @@ static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_platform_da
 
 static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
-	struct simplefb_platform_data pd;
+	struct simplefb_platform_data *pd;
 	struct ls2k_bmc_ddata *ddata;
 	resource_size_t base;
 	int ret;
@@ -489,12 +489,16 @@ static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (ret)
 		return ret;
 
-	ret = ls2k_bmc_parse_mode(dev, &pd);
+	pd = devm_kzalloc(&dev->dev, sizeof(*pd), GFP_KERNEL);
+	if (!pd)
+		return -ENOMEM;
+
+	ret = ls2k_bmc_parse_mode(dev, pd);
 	if (ret)
 		return ret;
 
-	ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data = &pd;
-	ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size = sizeof(pd);
+	ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data = pd;
+	ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size = sizeof(*pd);
 	base = pci_resource_start(dev, 0) + LS2K_DISPLAY_RES_START;
 
 	/* Remove conflicting efifb device */
-- 
2.56.0.307.g5fe7bd680c-goog

