Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017713E40FE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791869791; cv=none; b=C8t6XIF0+THjB3Pf0ondiC7cUtHraDBNfbWScgC0F1jX2VlvVQOvDF8xh5WOfy4lcXEkX/SMTJ3QJaFPd6DTOa+tMGBu3hnkNzNiJy8av7L8Z1pKNL5q3YnfPOifs6iv7kF0bGtrDdxogRbuCtDEx6d6TddK3b/U0NtdVjyCj9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791869791; c=relaxed/simple;
	bh=JOAhONCDvIV93MM10QEhfZjZAUjlaFLYtJjIVb7TC10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DoRHf0KdmAE5w6nob6CwBRSyAWGCkDbYtD5I475HSeHZgyNNicPDYYy2PJ4gMjU5HpGPAKCeL5Dsslo7y7/Bp6HWVMumIQqhFv6BhfDXejZysdJuyDCwFDZIyKQrsVNPn1MMHHtKFnHvc6F9/wZLleRqJdndu5onK6aYOMDojEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiG+D6uc; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiG+D6uc"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4b62d118aso1523197a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791869789; x=1792474589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=31jej+zw5eC3wdks2N/0FrXz19KzIMeRP96y4F0yMqY=;
        b=CiG+D6ucqU8Gg9vTIE+dFGErX7y2+M7tkAdSwGCRSxQVQLiMsAMGaUPFygXRB/pyR3
         KHTEvj7NCzPUkA9bxrqB1j5qEL5EPXR0Sr42hu/ZD56MSGa2t5ICQCaqUB1PPvaPPwPr
         67Jwb/zNE8RhM4ZnYDlz6rmX2BeabubW70Kg055mIaFi5Ql4LHXjpo0DIkAG4E62sLVe
         j7MupaKgHzp4HH115weChFmKEeIXbQX/638DYaiw55ztvZJ9bnd5V+LEzLVEEUHQy0eN
         lXm5K3l+mwsDApJI9dyoV98aW5IAuFY//Vk1Hy+tRnsloWxuNf6RxFaVwWLAX29u4OW+
         HccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791869789; x=1792474589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31jej+zw5eC3wdks2N/0FrXz19KzIMeRP96y4F0yMqY=;
        b=gjs9EkVp0qi+arCeaG5+1uVZfQoBHnQk2tLhJ+TZX0p0ITs5QnwGwWHFR5SK3AyoK/
         64ARb4up1pT8WqUvmtaU6pUt9yMN5sTF/4huPTnWa/V3EAWFemOp19wrPWOXGSsnduEu
         fcr4hMnwGJIPmpwWTBGNlE2pn72vO4c2gME8j81qN1BIABjj89DVNSbRqhpaWwYWjvcF
         hNUVSgak8lMK3qZzloiN1cnbfvVJgM09C1gtPFSiwqwFNppU/ev6xDBtuFOmHFaEFxf0
         nEtjoXyDjz/DpDBhpCdB5K062CxFWh6/R2IVMjLDOQSvB4o+cD2/C4FWKEUn4oLFwG5w
         aHGg==
X-Forwarded-Encrypted: i=1; AKwUvByExZG/7w8pqz3HW4GpakLIzeec4KQwx3xCd75KzNDi8HWa+Z7wdxydroaw+JjBCNJOsnkryYB47TU/tOQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCQ+9QNOc76pRe2AFVEQALCbkbNgS9SDavkgzjXjKot8nENpjf
	2BW1hxzi99ySRBNATuluwKdzpiChk0hLMO1wSlV+sOwsXt6EcTkmqahg
X-Gm-Gg: AYBFou3HWOe6u2lz8FKG47maSX8KvXJAvHqLif47DvhQ2ul2SGnr2PPrbMfQeReqgZn
	zbjjY1TaEkx+SH9CkTe2T/KAKC+oYqzHN6DbzcuUDtdK6n1azbLUcjk2Wd3UjxWiAlO8jj7x6xy
	71XPyJv5krcwYc6NERyuuRqYft8uJB9rCx6LhzYmMIpUqk/5b7kBi5AQc2S+W1WQvT42evgTMPm
	ubiJU4znELaM3YxD5iCc6yvzUyMGovhFr+T8RPLwQa/FfFxNp47GRozajFEY8lBjzalQV+DJq11
	AiRedeoG6eRgrG8JUyl+6ZyRvWFptvYuIALQPC5yIz0sqtw9pq5EUJm6MMO4c5oTYEVhaT0GSem
	RT0fu7zMnFDJ03xeJGUUaV98RMNkrWJYqP5wbXs0xIUpPyiCSd8FeXuUty18sYEH5LA4Pw6+O2T
	GMCz/gBXpY7eRqDKSo08ODlx89Njq3BxgL2B4BazedjAZ6VsmvbQv9KblqgU1LZU85U0PjlFQ+b
	BWvb+rdiLq7YQ/d2VwcUcu2XcrvOtKWRP+a3PiFehDmpek9xTnReuvCEw==
X-Received: by 2002:a17:90b:314e:b0:3ab:3201:310c with SMTP id 98e67ed59e1d1-3ab3a9aa90amr9458427a91.63.1791869789235;
        Mon, 12 Oct 2026 22:36:29 -0700 (PDT)
Received: from laptop ([175.157.230.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm22898117a91.11.2026.10.12.22.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:36:28 -0700 (PDT)
From: Teshan Kannangara <tpk.teshan@gmail.com>
To: jgross@suse.com
Cc: sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Teshan Kannangara <tpk.teshan@gmail.com>
Subject: [PATCH] xen/platform-pci: Disable device before releasing PCI regions
Date: Tue, 13 Oct 2026 11:06:14 +0530
Message-ID: <20261013053614.1337340-1-tpk.teshan@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

   The probe error paths release the PCI regions before disabling the
   device. Documentation/PCI/pci.rst specifies that drivers should disable
   the device before releasing its regions to prevent devices from
   colliding on the same address range.

   Track successfully requested BARs in a bitmask and use a common cleanup
   path to disable the device before releasing those regions.

Signed-off-by: Teshan Kannangara <tpk.teshan@gmail.com>
---
 drivers/xen/platform-pci.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/platform-pci.c b/drivers/xen/platform-pci.c
index f2438232518c..a12ac57274a6 100644
--- a/drivers/xen/platform-pci.c
+++ b/drivers/xen/platform-pci.c
@@ -95,6 +95,7 @@ static int platform_pci_probe(struct pci_dev *pdev,
 			      const struct pci_device_id *ent)
 {
 	int i, ret;
+	int requested_bars = 0;
 	long ioaddr;
 	long mmio_addr, mmio_len;
 	unsigned int max_nr_gframes;
@@ -115,16 +116,18 @@ static int platform_pci_probe(struct pci_dev *pdev,
 	if (mmio_addr == 0 || ioaddr == 0) {
 		dev_err(&pdev->dev, "no resources found\n");
 		ret = -ENOENT;
-		goto pci_out;
+		goto out;
 	}
 
 	ret = pci_request_region(pdev, 1, DRV_NAME);
 	if (ret < 0)
-		goto pci_out;
+		goto out;
+	requested_bars |= BIT(1);
 
 	ret = pci_request_region(pdev, 0, DRV_NAME);
 	if (ret < 0)
-		goto mem_out;
+		goto out;
+	requested_bars |= BIT(0);
 
 	platform_mmio = mmio_addr;
 	platform_mmiolen = mmio_len;
@@ -165,11 +168,8 @@ static int platform_pci_probe(struct pci_dev *pdev,
 	if (!xen_have_vector_callback)
 		free_irq(pdev->irq, pdev);
 out:
-	pci_release_region(pdev, 0);
-mem_out:
-	pci_release_region(pdev, 1);
-pci_out:
 	pci_disable_device(pdev);
+	pci_release_selected_regions(pdev, requested_bars);
 	return ret;
 }
 
-- 
2.53.0

