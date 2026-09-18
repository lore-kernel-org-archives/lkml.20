Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E75450E59E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752362; cv=none; b=TXY+J5bezo0JJWZZnCTNi72U9ksw5YPckwlOJ2PwHLPIgUuBBeGIh0SIc6ldgLx4wurS4uQMeRMEm0oepTXykAha0haWBxIoyGEgm7jNTMSx4TdfhQ5YLZVyXR5+zUm1ND00v5ItthZUpgNyCc17mpNeSoCUcokv8jHXrSY1nT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752362; c=relaxed/simple;
	bh=cZKn69nF+ltHhO2GnIWhmR8Ldl8qwapZb+XHEzvz4/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cUuNhQNOhy8H5Q0n+gyTQHdpQ0ix83PmGKFGoAOBblRs6p6m7+S14DO82wshApF+uh0Bpfj/hdk+SuiWtsIVLOwS9sSCFHTsCOrve1gcUFyaDcoXtkICeBrVlIji90eCRX9e58ZiMyXTUclltGv/rdFaJ1gIajmoGmU1WUjmlVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nA7MHShR; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nA7MHShR"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so330939a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789752351; x=1790357151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7w41cGtnpU1fKAfJJK8XLWeOJGEaeMvKYoPj2+vL5e8=;
        b=nA7MHShREbJeQLkNa6zVyADyKV4Ml/X87W5j71Hi6xnXjmBNrME+Rd54rWgt+MADca
         UTHxfCPjAE08EAzLxYjo0R1m3VW/DBnyDP/uIKbrMz0SClqqxXHSpBQh4TUXuRCnspnd
         Fpbhix9XYFjuZ/8/1EmcTgpY4idHjxrji6Cvi6ALTlztH25j1j59u64vFu/0AQhY0wV4
         q5HZsSmGYkS8jKrytDRIBOwjQmmJashQzISHs5tP7i4KqG7mlNIlS4zNdtfTU3TYuqPT
         fR5V1itwB/0bEAUf7WvRaglINbFbskS+RRjv+FFED0SLIvBDh/72whxGvgxKfbmQx0HL
         k0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752351; x=1790357151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7w41cGtnpU1fKAfJJK8XLWeOJGEaeMvKYoPj2+vL5e8=;
        b=Qp0hmtNoOsbdfBDWGcSX/E53MT/2yJ8yfjMhRrRuphdD1WKH8t4mgqPRdSab5+90xU
         a+kCdyg7KGmMuXxHRbuHVMcHpog98eT79uf/ErBgDzhf54Kjzmb5H2hoXoMCXjNXRzOe
         jSl7mn8xj4cQje1NglYSDRhlaT54UY1SCkKA8S29TrxlqLXclMxlEjEFAmRULMZF4adM
         /o3C5YfwAewbduKHYJ7DbhUJ8Yoth54BF7sJAFmSSMhihfj471F6nYZf/QjFxdm+MpJ5
         WVSFq1WBctYzoU+XGzWZT5E4Gwa03i2l65P6NdoMeqvirbZTxDKXL88JNUMOvFennF4Q
         6M6A==
X-Forwarded-Encrypted: i=1; AKwUvBywm8zdaaNr56mbrEfAEEhwqpJdw14PbRe2HKWx4HqzOU0RtrfPpItQsKbVevYSJUEdeAEsaOV/xjwatmE=@vger.kernel.org
X-Gm-Message-State: AFuF++l9eTvf6+sHHEApMvs/2L9o/+Ip2ockEd/rAayhAslNjFyuTA4V
	Mus68Ndt8Ce20VlVPU6D4j7sYinXCoImdQFWhdPoFaj7NewitT5JXT8E
X-Gm-Gg: AYBFou1JMQ0F2JtqA7CnxzlM78wFkeKNtlvB2iRP5a7GAOfKkZmHke51hDC/t+Ej4ux
	JfisZ8AvYUKUdMinehx4m+yOVZBA+KGXp/YD1Oi3T32IOae7bha6q99UqyiS1s414EOEEej2iUO
	iDMqoqFvglrqrGs0KjGPmH+Zc7Fgenffpb2Y1nvDTekKee+witwIpqQXtuIWBb1InffK5p254/z
	9iM5wrv4lsG59AbUcC4nk1CX1/bqQinW8CZglfocq4Xk1eHEz4A25haGCDdqinHBL+9TBzI3Ctv
	3Q7ME+Jes0ScPNeFzkcJxxsYT9kr40igY6o0nmqioyUak1/eA3sn3sbRhWmAmuz/VCRzymmYbyK
	RCkObr3uZZlijokywzGYgqwFXuQByLERptpXVmsP4IgUwczdAe2BACLnrKtJlwdumCQ6kdwasfl
	J4wooGWX6lCEucASuvyAhSIRxNraDGDOUwSb+nNm7ShS8RkL6Iap1/1Q==
X-Received: by 2002:a17:90b:51c1:b0:39e:6c68:fd92 with SMTP id 98e67ed59e1d1-39e6c68fee8mr313201a91.39.1789752350791;
        Fri, 18 Sep 2026 10:25:50 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cae997csm395136a91.11.2026.09.18.10.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:25:50 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Anil Ravindranath <anil_ravindranath@pmc-sierra.com>,
	James Bottomley <James.Bottomley@suse.de>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] scsi: pmcraid: decrement adapter count on remove
Date: Sat, 19 Sep 2026 01:25:41 +0800
Message-ID: <20260918172541.3599902-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pmcraid_probe() increments pmcraid_adapter_count when an adapter is
being initialized. All probe failure paths decrement the count again,
but the normal remove path does not perform the corresponding cleanup.

As a result, the adapter count remains incremented after a device is
removed. Repeated bind and unbind cycles can eventually make the count
reach PMCRAID_MAX_ADAPTERS and prevent otherwise valid adapters from
being probed.

Decrement pmcraid_adapter_count in pmcraid_remove(), matching the probe
error path.

This issue was found by manual code inspection.

Fixes: 89a368104150 ("[SCSI] pmcraid: PMC-Sierra MaxRAID driver to support 6Gb/s SAS RAID controller")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/scsi/pmcraid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/pmcraid.c b/drivers/scsi/pmcraid.c
index 942a99393204..da80f1d39ec4 100644
--- a/drivers/scsi/pmcraid.c
+++ b/drivers/scsi/pmcraid.c
@@ -4778,6 +4778,7 @@ static void pmcraid_remove(struct pci_dev *pdev)
 	iounmap(pinstance->mapped_dma_addr);
 	pci_release_regions(pdev);
 	scsi_host_put(pinstance->host);
+	atomic_dec(&pmcraid_adapter_count);
 	pci_disable_device(pdev);
 
 	return;
-- 
2.43.0

