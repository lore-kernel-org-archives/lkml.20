Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793431002;
	b=kUZEjupPvWnj7liwvk6RM7OA55LD0KR1RuqgZFgArhHRlCYjxebRrccUH0uf3xDdawUe
	 UPJO28I1GRFaYvYZvhZGI3dCWgWvdmold1m7I9hc9ov4ClYPvDEZz9+WBcLdj2N71S9PK
	 twZKIFuOwWDWVl1tDl+3F6jMiDTLtCItJaDvDjakgVm1DIeNLxp2aZVUUmvUyv4MMNLum
	 kn7rg3Q9FSyxuYVjXPbxQDwkri1G+7kUvHCMSt5D1GbQC92hCY7H3wko6Egq46JF7a2ji
	 b12sc/rcOzyM3oPIracZnxGh/H30QNIcZwg6EMuj1yh90juzw+hFUWws2obbT1CQAxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793431002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=EMpi7YMzWk4HeX6dQlyB+/a72PJDktJNJTNgVwGcZck=;
	b=pO+98AowBWLti9BYKqObbl9BwSOaISC7EO3DtgDh3+sQFKgyn3s7TkqiZHtundb9rbIc
	 6zpD4NJCQllOOTi6cqWDM94YkXySZPztGmU/z2aYQbcbZr+OIczjg6+3AKwKfhvaNA/EG
	 qBAIGKkjgmAt+Wg0J9EiLgXIrdplp4+obZm+xSou3K7zi4ZLWU/739lrgJPatjWP8x35q
	 HPY9PWASqprN3Saskzj3gZo0gPLBFGWYLaShkbb81EIDyy85Y+aY8CwBX9hNIKRbR+04F
	 iSVJsbEvnNOl3dsY614odQGG7Rm6pDOZx/CCk5z/Rzm3dTXodq8f863TudGItRaYPkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fduIVDF3;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F57606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55F57606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fduIVDF3
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-19305bcb72cso1147890c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793431001; x=1794035801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :cc:to:subject:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EMpi7YMzWk4HeX6dQlyB+/a72PJDktJNJTNgVwGcZck=;
        b=fduIVDF3nDqRiwrh0X0Ymu+MELIvwuKYXvFFe4vM1e3Fu6ehOS4oL2liWR25h2Qxcc
         UYQLkB+4ebk6qv/6CD1jxwilhx5uQpBN8wYhLca752TySc+w8wWjYFu2o/OlrvhfSZQv
         UUmKgojy+/txQxpHUT6qfgAGrSy3VUCMgPpPm7S85mNzjBXp06NLVmXHBL9tbFW1ngu1
         cu88gxLF59gkKuPydFcj6DEImGCaFlDXtlyEAqYl/3FhrJG8ROuK6eSK3eN3BPv7mjNr
         RP6FcNGwSxaw2X2xgDAg1m7u2oTW0WWr8QfuqlooxVU679S4w+crl8YZTj6tl/7+XjZJ
         aUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793431001; x=1794035801;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :cc:to:subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EMpi7YMzWk4HeX6dQlyB+/a72PJDktJNJTNgVwGcZck=;
        b=P5q+rLREgCP2onCLvxGb883yajzrXqs1OZ9qj8oIQbblRaUYI6DVXbtFLorAVV7/1J
         wM1evaAELCcodw+pvPxNxi+aMk19pfH5LCWvNGSKjKnexDTp0ndY296ma+eMpZffsqpE
         bTB24+3gI/augK0PAOp1vG6txQ7pRUYi2WD+p2RI3L/J7ojkGurphhb/1qtNZSs03ivt
         Mp791sn09smtGuKjbtorr6YlpQY/OrTY35rkyd1CO+aOdwmnC7pojwqjt+PsAtLbjtrv
         q/8JcVTyYYTlpDzpKwgY4PnKoj4r1WKmMEchViUaDJulO+7TMt8jnC/NLxvj5sUYUILi
         g5Dg==
X-Forwarded-Encrypted: i=1; AKwUvBzyiw6ZAzmg/dEJ0TonM4mStblmqg0F3kL59+KJg1aJeignnuHVphySPMysni+SpdyMX1GATHv/053j2OM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoK9ngow5cTPjKxp6IJIdMmPLKhfeAf+rH5M0xrFG0YUPIn4vp
	/QE5KMnSV1AIa7UqhaJHoobH05WbOHeEu1yo1dUoEt7Qvx1WRwwZO+Jr
X-Gm-Gg: AYBFou2xEDGLYTRneMlcOAsxeLDbMvvOELE2zFG9sbVObuLgn+K/uswkVIcHVJMAZMA
	SQDuvYCvagoAQRipekbJ/vP+m95P6yYFvC8IE2FTZn1+y2d8rw3J7ZRxipM1h1Gz57zWZQyevnP
	v7hT/O1eMbAxO9D61cLKongaj8/YrVfFLOyNdCSiz+U/MPvZPIEwLgmAbUqQe60Tq0dgnP8QPWv
	0g7MtV4V5aQqki99Bi/VUwDt3dfnFbVBJR3CHYHkXskD9qY4rEN7DmAfhPJA3fF4YJtbNChODVz
	GtaT1q2VOgvG1Bnd4+78XxwPOr3esPrqpJUm8V2COxtnUElna40pNUS7LK1EZiCjHErNt5K2t2s
	rQjGh/xPVRG9XGwYMVrjw92v/8Li9ZyZSMxJV449GCn8AHyMQtozVSnPew3GBtgICS80ncVn6al
	U+j8l8URoTGrhp9sLy97eF988svq5easXeERyCJFf5Dets51/RMLFIWM8va7Q7SjWnjaqKQdVUb
	KmI+Twx2oU8fYDq0kLabu0zG54aWzzsCOXHa2dpAq4TMTBFFk3ZfX+Eor0mMR4504E3zPFU2rru
	7bDInqLs+jy0CP0eLsBTpGP3YLdS4J9LKRo=
X-Received: by 2002:a05:693c:880e:10b0:369:987f:d15e with SMTP id 5a478bee46e88-36a4221b055mr6739264eec.2.1793431001300;
        Sat, 31 Oct 2026 00:16:41 -0700 (PDT)
Received: from [192.168.45.62] ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm14372952eec.7.2026.10.31.00.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 00:16:40 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Subject: [PATCH] PCI: Report configuration access errors when requesting FLR
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>,
    linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 31 Oct 2026 16:16:38 +0900
Message-ID: <179343099854.144556.14547372045411279536.c116@gmail.com>
X-Mailer: git-send-email compatible submission
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PCIe and AF FLR requests can fail after pci_dev_reset_iommu_prepare()
succeeds. pcie_flr() and pci_af_flr() ignore the config access result.
A failed request can then be reported as a successful reset when an
Immediate Readiness device skips the wait or a later config read works.

Check the request access in both paths and convert PCIBIOS_* errors to
negative errno values. Use the existing done path so IOMMU cleanup still
runs after a successful prepare. Leave successful requests and readiness
handling unchanged.

Fixes: 8dd7f8036c12 ("PCI: add support for function level reset")
Fixes: 1ca887970a39 ("PCI: Extend pci_reset_function() to support PCI Advanced Features")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
An arm64 QEMU/KVM kernel used a synthetic PCI host with the normal PCI
enumeration and sysfs reset paths. A one-shot Device Control read
failure (PCIBIOS_DEVICE_NOT_FOUND) after IOMMU prepare issued no FLR,
but the original sysfs reset returned success. The change returned
-ENODEV while preserving the IOMMU cleanup path. No physical endpoint
or ATS/IOMMU domain restoration was tested.

 drivers/pci/pci.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index d79d2ee4ac69b..41fae1b1050c7 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4429,7 +4429,12 @@ int pcie_flr(struct pci_dev *dev)
 		return ret;
 	}
 
-	pcie_capability_set_word(dev, PCI_EXP_DEVCTL, PCI_EXP_DEVCTL_BCR_FLR);
+	ret = pcie_capability_set_word(dev, PCI_EXP_DEVCTL,
+				       PCI_EXP_DEVCTL_BCR_FLR);
+	if (ret) {
+		ret = pcibios_err_to_errno(ret);
+		goto done;
+	}
 
 	if (dev->imm_ready)
 		goto done;
@@ -4506,7 +4511,11 @@ static int pci_af_flr(struct pci_dev *dev, bool probe)
 		return ret;
 	}
 
-	pci_write_config_byte(dev, pos + PCI_AF_CTRL, PCI_AF_CTRL_FLR);
+	ret = pci_write_config_byte(dev, pos + PCI_AF_CTRL, PCI_AF_CTRL_FLR);
+	if (ret) {
+		ret = pcibios_err_to_errno(ret);
+		goto done;
+	}
 
 	if (dev->imm_ready)
 		goto done;
-- 
2.55.0
