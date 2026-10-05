Received: from mail-ot1-f98.google.com (mail-ot1-f98.google.com [209.85.210.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7DD424D76
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202727; cv=none; b=r7KPR7otD3ggq2L4KgU6vBY2C2879go3oejUB4UT3hDm2tfTEYGHNsCGglHxUELdTDd9IpbhFm++8Z1FvRNYDi6xAiy6T3f8gOoD0vV3BFSKU+wb4I+bojpZiQh3LEsjHZNRVc+QdxOBMqguuwl6d7eiOPB9ZSncT1TPjlSS+jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202727; c=relaxed/simple;
	bh=tXlWCd6YT9nX95cWZipWpujk/ckqI3uyEOqsUuochek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f6Zd7wTKgIO0uEadPPO+lIhTDm7A2IfT5F2BwYvo24QZEGqtjlDDpnJCXumnUQ1+/I2UWvW6IcnBJiV4Z2G+lAj6GRtAM4etCtOdM9ppIVJGuA1ZVKzX6d7cAfxUZ0Q5oM21eOuBUCWjs2S+eZ2aTSXRLeFSblMaO+qLPZZ6hGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fjuPdCvX; arc=none smtp.client-ip=209.85.210.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fjuPdCvX"
Received: by mail-ot1-f98.google.com with SMTP id 46e09a7af769-8252259f6d2so252461a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791202725; x=1791807525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m9YNZ++OX4IbuvtJ4f7tTPEhLK/nrx5xzhX+t6VKIeI=;
        b=cLcAiod+O8k4FAMTtP02/XroF1QsjnCPobLJD6eIgXPYJRxnBExXnc4CO6Br8kOhNC
         ktidyHNARu0kjpZxmDwLLVM+sQV3t2EpPtz2g5GokoF4bByRfVZimdJ4SVOIvYtjRt/H
         NrdT3cJZm39DmHxW7cBAVGYWIAAxGGtgL+dftE2TbeVzzRnW9C0BA2Ix2C0OM6T/f6UC
         tJXg3w1JlEORRnn/3Dw96gIv7+8nsZ49Fc0YxC3HfNPAOGD7hB1dJWEQ+oPpCGQTHr3O
         y4dBnXQOySLj/UNZEzj8BBM/hkg0BZoNCE8B3z9FfsQQhvLMbrjsaf4qZwhx/5UnZjm5
         R+PQ==
X-Forwarded-Encrypted: i=1; AKwUvBx95ItvorWV6cqGtP0IKrP2dlHrGF2sbgUC9J85ZfZVar/GHahcZfRXSr7grp40f/mjWaSlr7z1xcOgBoM=@vger.kernel.org
X-Gm-Message-State: AFuF++mg6GatUUQFNR4UuavE5OfM92lddH2ucA7wfuqsf0yuGpgQKM7c
	8290m9QjF9IoIc/0t7lrQhrQuLmoB4sFPfs/gjj+pE+3LHUZ9sXu+AY19AemGxQyQyYmE8qRuiz
	bJg27dD4U1nZbhgYkP4COqW/zW4vB6nnUiPl+lJPEic6l/oLr3s/2x8LnSC1ZNBzmhpPdgW+1Ip
	wzEV01nsmR3pRGBtpILhxAHoa3ID1jeKAr7l7MLkPGRngSBbpub13KOXfkpNVmm0jp+EPHJPhvw
	mZpoHl/ypY/ZvjtxZzSDoCr6w==
X-Gm-Gg: AYBFou0hw3BsdCzL8Et48jZJDVCnRgYBtWRkU7IShJnZb7rcIRWC7teDQFyh8dyoETH
	4MHagDiEU9oMWZZHzZQ/MKBWvZXX7xHf7dn3/9VPyGvDKwr/ysmcMmlrzdNqps0Q//TJCihC+I7
	TtWYUEnQE86hsJzh42WjLbBPfbN2P18n8SOKAgpILJ8yKmPDbV8fBOEtIW+5zNQrPvK0Vk+Ozzq
	hEJntsd5+JxjGRV7fTL7XDZznmBnBZN5ba4Q+w3imD9Lrx09PxY8tVqlnktXDzbD3TCUNl0vBpM
	dAiDIl2UDsqAgeOI9JI9pS/yqPfx0WeFtqzbWYLwP1lYj91oEpZMdaUzieZSwN0pMk3xVgiDT+d
	Gvb2y0F8F2/QNln88yXB1+1vt8LGwNNuXDdjDRdBj29P5jTCl89zQ9TaD2C0tEwGyzozMkNBJ1Z
	Em1xsVMj7ybS4gaowkrioVWjvqYsYkqRIbt1s9Z+GPJw+T
X-Received: by 2002:a05:6830:374c:b0:81b:b7e3:23b7 with SMTP id 46e09a7af769-82283f5d3f7mr11762992a34.31.1791202725083;
        Mon, 05 Oct 2026 05:18:45 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-82276cdcda0sm1393792a34.2.2026.10.05.05.18.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2026 05:18:45 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3269478eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791202724; x=1791807524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m9YNZ++OX4IbuvtJ4f7tTPEhLK/nrx5xzhX+t6VKIeI=;
        b=fjuPdCvXAtVRGkYHSqHoSS/GqLkU78x+l7A26Qtf/+GmxYUipHAfMueM+5LRhkISSY
         TX7FNl2OKCLPjSRXEXjqv9jdP4gn8Q5o9yVHwYty/JKCMFcmHFgDp3Rp+suBv3mNSy49
         KRvL8SEXA4/34jvMD831jfpFvFftGJdP2HAkU=
X-Forwarded-Encrypted: i=1; AKwUvBxJxcikoYYeuHQuYKz7J10EcLECkgKrEIydUM8CwO/odrqYod1YdWu1O9pOZiC8vULLVd3/Csi7//u4aBw=@vger.kernel.org
X-Received: by 2002:a05:7300:e9c4:20b0:351:1e72:7470 with SMTP id 5a478bee46e88-3511e727a9cmr8206610eec.13.1791202723597;
        Mon, 05 Oct 2026 05:18:43 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c4:20b0:351:1e72:7470 with SMTP id 5a478bee46e88-3511e727a9cmr8206572eec.13.1791202722907;
        Mon, 05 Oct 2026 05:18:42 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351272ceb02sm25687542eec.25.2026.10.05.05.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:18:42 -0700 (PDT)
From: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	vikas.gupta@broadcom.com,
	Bhargava Marreddy <bhargava.marreddy@broadcom.com>,
	Dharmender Garg <dharmender.garg@broadcom.com>,
	Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>,
	Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
Subject: [PATCH net 2/4] bnge: require NQ vectors beyond aux reservation
Date: Mon,  5 Oct 2026 17:47:02 +0530
Message-ID: <20261005121704.227866-3-bhargava.marreddy@broadcom.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005121704.227866-1-bhargava.marreddy@broadcom.com>
References: <20261005121704.227866-1-bhargava.marreddy@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

If exactly aux_msix vectors are granted, probe continues with zero NQ
vectors. This leads to zero-sized allocations and out-of-bounds array
accesses during ring setup.

Require at least 'min' vectors beyond the aux reservation to ensure the
driver always has an NQ vector to work with.

Fixes: 18a975389fcc ("bng_en: Add irq allocation support")
Signed-off-by: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
Reviewed-by: Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
Reviewed-by: Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge_resc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
index 4711dd4945ff..7c26943c5cb3 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
@@ -382,7 +382,7 @@ int bnge_alloc_irqs(struct bnge_dev *bd)
 	irqs_demand = pci_alloc_irq_vectors(bd->pdev, min, irqs_demand,
 					    PCI_IRQ_MSIX);
 	aux_msix = bnge_aux_get_msix(bd);
-	if (irqs_demand < 0 || irqs_demand < aux_msix) {
+	if (irqs_demand < 0 || irqs_demand < aux_msix + min) {
 		rc = -ENODEV;
 		goto err_free_irqs;
 	}
-- 
2.47.3

