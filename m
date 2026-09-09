Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749B0559CBE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958746; cv=none; b=BFpPG/4BPoRPn1OH8f1085XSRFbh/AIGYU6BmNe4b6VOmmJbajW8tMUZeZtDaufmA4INWKcDeIJ3N/ouFx1H/CWvOeTv8np3vFxcwSAzIDG+rx0/G8i2HE4fI6wiZThTJAo5LXERgrGyNqiT5DMXBm7kjM9IOO20LsJ5houiVlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958746; c=relaxed/simple;
	bh=Ehj7zLlK3IfN6pnw/eyYNZgW+/YW90hhvAnEI+YxU0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jtx+AyGk0nFbBAoijA9KMRYaAA+MVWXrrhkzDqmJdppo/rjR3h0TLv56WfaUcfyY2batlMCZ/H3ZceXEKwwdYvfhvElhLyzYgfU8PMkNLIez6WOfbdLpM1SQnNmgZYIv1TlvvLTnPLJt+Fqdc7PsyGyXOgoRbY9cPRsXUzPM36A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETDyItGX; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETDyItGX"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-52e2d1bdbc0so37310881cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788958738; x=1789563538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGf+TQPcMmYbjIbIQ5HUtK4yD4oWM2UxXWXNQQ2nbIg=;
        b=ETDyItGX2mXGV9XhNx2gj38XaSCNm95vzgjKug1bHFXhNXHs22o0MYTJy84wmK2nEb
         96+bydV3gNdYLursIq0h8NBMdeAPyN9zHFOJNldjqCoYYwvpp8BwT3pDJ1LJtX1wgg2J
         HQnHzPdMxwMauOBxx13d3HjW5R7Mbapy1kdeMXyckGJKAZ0ElOieMg8OaSpEHydKFjMC
         VjkXC+bOaqABStsxeYx7SS1J+obNFKUoyOqDkOg0SR7lVA6mdnamTHZNVjlVTI0kq4fw
         tteY1SkI3cxYEpHbnsp86tvvRttaRC0OaZCYakkDAecQPFuhZATufRH4USEHOI2RrhMi
         RjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958738; x=1789563538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGf+TQPcMmYbjIbIQ5HUtK4yD4oWM2UxXWXNQQ2nbIg=;
        b=MLRIutUaL+BPOwx3ZmK/FIUFB6Axs50EBPzChEzNpc/F+lB3rh7SSECLTLRgOZbDvb
         E15lUlVXiEmdhPApQbxnhDm0xhSndaOX13IXJboYnimTMAcXwT6F0Edge4YHG8V61mJ0
         PqqUlLAMrZo1nzzBgGEI4Mj+DBPArabe5gOSamzrrMz8dSzFVypJtM95enXf76F50QM5
         vqErMpchA2RJTaGwRNnC6Lw5O7fPtXmJGueH1FuHE1CMtHirn9efJDTmII3JyRjydFVS
         Q/LZBDlbW13iRzfJ0SS4WgMeo8Dwp62Oh13kn24025XlSh5jxXRGMlG891Vktn+pIDou
         0GcA==
X-Forwarded-Encrypted: i=1; AKwUvBy4yMFk8x7qeI8dZAs0x4jJR0Q3bzoHIjpnRZEc5AXhcdWjCyL0oihDpc8Gfo7a+IKSdr6dlMnPdYt70O0=@vger.kernel.org
X-Gm-Message-State: AFuF++ltu2bE6mmdulfkZHKHcdeuw/4nX4K6TcEw27HuAUxzyVil/tM5
	VHF8ZUyUkVGRDxSeuS+3S/nYz3RmWlbuQHL6i56jJZZm1ijPTnwOSeQM
X-Gm-Gg: AYBFou3ndtm3T39vfy54ZMPGtTNXEx+xAlM/zQLmmkbn9Nq35Gk7sCfUUl09E9sQPv/
	QqoKutKbgA4Idi4K4I6hGdC4yRl7RnSN7jZEwA9dTs6/87XCVWkOKkP2/ACnmUo60macsu5sJUu
	LVthgTKogEKkmjwJT7eWMSh0zXPzbDO0Vkfn9JS3iCQOEVzPt0d/E2yxuXCMVotfgmCmF2FO6Cc
	hMQlOdQpqbXCFC+Kdz2QIfHIOymQfkxU6mMOa+1Sckc6Kln+zieuIHCwLY6GdZ0DhvrmFUpvZbO
	2yyXfcPXnGu9vcy9h/6DYX324SmUuaoWMGb0g3ldj5zjOwvqCQP3dcbilWz5cL5KbeJ/TwfH0yU
	spcDShNIRpP24NVkXAETFp3U+F9UpEj7QZULGcXALvfbjFPjdBJe1LSnJpKOMGool8x+IO9qkGv
	VjbFRQCFMDCxbZyKvBtjYvOAA8DRdAKNYEWI7rROaclNEZRUAV6zTffvu8hkFlk7s3bK+X+2z77
	teDMb70I3e7VRMNyl6aCQFcnVg8b6jKheu5Eaz/b9y2tQ04
X-Received: by 2002:ac8:5913:0:b0:52d:74ac:6ff1 with SMTP id d75a77b69052e-53054955026mr417095391cf.25.1788958733207;
        Wed, 09 Sep 2026 05:58:53 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a803:6c49:659c:692c:9416:2f0d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53080ce82aesm82437691cf.31.2026.09.09.05.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:58:52 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: mathias.nyman@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/3] usb: xhci-pci: Add run-time check for TUSB73X0
Date: Wed,  9 Sep 2026 09:58:41 -0300
Message-ID: <20260909125842.528340-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909125842.528340-1-festevam@gmail.com>
References: <20260909125842.528340-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "ti,pwron-active-high" property is only valid for TUSB73X0.

Protect its code so that eventual specific TUSB73X0 register write applies
only on a TUSB73X0 device.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/usb/host/xhci-pci.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index c580e0b86011..75aa679f7d79 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -683,9 +683,11 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	dma_set_max_seg_size(&dev->dev, UINT_MAX);
 
-	if (device_property_read_bool(&dev->dev, "ti,pwron-active-high"))
-		pci_clear_and_set_config_dword(dev, TUSB73X0_USB_CTRL, 0,
-					       TUSB73X0_PWRON_POLARITY);
+	if (dev->vendor == PCI_VENDOR_ID_TI &&
+	    dev->device == PCI_DEVICE_ID_TI_TUSB73X0)
+		if (device_property_read_bool(&dev->dev, "ti,pwron-active-high"))
+			pci_clear_and_set_config_dword(dev, TUSB73X0_USB_CTRL, 0,
+						       TUSB73X0_PWRON_POLARITY);
 
 	return 0;
 
-- 
2.43.0

