Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FC0493635
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549306; cv=none; b=R+jVTLzpsJzCFLy1NnDgc3H1VvufDRT5Lo4XoQH+AYV/jiAHXdkmLFqs4bkG1lKM9FNKxJngUATWgts/Y01EQsT4IJ8Ug6gkHr6EG/IDRvv1ni0zq1vX0Y9rN9hPACElRReV0fnnXrTkTbWObeKvpwm8xCixkopl422l2qQyyms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549306; c=relaxed/simple;
	bh=74+NXWRLulW42h8LCDGQtUqGGw4TZyZ6WSPtQhdY/jE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uUR3Ls+2bLhRWmQPQyqkrkta+b4bMJMxTEfCvuW9qR1SIRSiMZm89edFa07EC6qJG4wTr+EOPSrQ7KuViAVbi2VpHEwOtCenXMxo76H6qAftiT/8od1qRjmCENcc4vaL6HQ3WvH7aZsQKMBan1spVAoqCxJeU7yrhLE+gP0bgYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDfjua9P; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDfjua9P"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398cb5615deso646567a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789549302; x=1790154102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D6tQdqZnuOU/60EvuEJ2W5w4uMx9pH4irbJ1JjeHep4=;
        b=KDfjua9Pfabyus4iUkLuEbwaH8RqIk4642tFlU9F326OxUY2IXPaixt2PpQ1dHrqMo
         PtpTOu9wwhWUXwKSTbwpdHRbCzaanWXS+CabwFJroa6oKndYx440PeHOm8+ZYOPv2Te3
         S8ud/y1XoOQGbTr+JWDXurNKM8kIcc5BSk2T/cH2sj4A04psErV+zs02J9prcGqSP8II
         BlzXeGqBw2k4o1clumzPfBY7iTVc8xxGdnsdSvp+qO/Tq5AyVxtKQVK+vPHRj8tLTROK
         JYjE3BDWCZUJZ1rNixPB2GzSVsIRwdosV5WMGaM4QhCl6v2nqN0igQSwp3EgpSaHfDhI
         OsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549302; x=1790154102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D6tQdqZnuOU/60EvuEJ2W5w4uMx9pH4irbJ1JjeHep4=;
        b=j5fPZWs6f1tRUh4IKmmcjVsKkJd39FufYV6CAbXiP8ndIZHQDEfJofL00oHOZiuroT
         VR0Nqt6aHZLxKZQNrxmV4j5hSjs5+VERDBlR1IuHGR/Q/QFexvidev0RfxrSnL1DoeuZ
         TPPg62f4H7v7Y6rJ654PXjAgE41TSXa2ZCa0F5fVRMXfc2tzWlciQHx89vIIrGYGKmb1
         NbBlzj9CP54tA7x7jSINzH/Vc9sZaw6Xo5DNAzN4jJHLBfnKs6SvF1aKvO3eD+vIWR2Z
         ei4pG2u8eHoS99RXmqaogM/r5OI/OZSURshnoSS3REAcf82fZnn8ISeF2AXXs/56JpYr
         vZFw==
X-Forwarded-Encrypted: i=1; AKwUvBw4/uZAt6fQP099dxIZY6ObITKCSRpeZM/Pj9BH03h9Z6971NkWpQrM5uC3gJh6aYXTVT7mhjkCuXaLugs=@vger.kernel.org
X-Gm-Message-State: AFuF++kJ4QOcaIWTBr1YulJptuRcrfrfrtZQapDimUwRtLc928P0x/AM
	/o5JrSS50sR7k3csQyYcePHPfNPBJqcIT0S70s1j7u15t7EkypsPXiRl
X-Gm-Gg: AYBFou3iJkNi+0OMzjWd8W9ayfL8M96xzFm3oz5S7SRTdPMv2useHCS/ipvYP2YOERg
	ie4t+Pmy84TCRYsebRAErNxmR60cj4i/JC6JRGzlXJK2tCi9aG7f4rI8EXx9hH5f4AC1Net5kaH
	ZPHTS+NXZKpuUsMcYZlVUl84AodGgzUvbFOcI8Pe/YWGfErEnHJW8L532Pf3uRTZtKN1B7fIzfK
	93GaAc9MonKpVriQ+2lRPp3O1Dw4Li7Guszfxb8xsxTKWR/34b5cOPcwlCK41Pz1H3G1NDhvvkG
	srcg9BxAQbZrasZxjUVrpoIUjPTHOMJrQMs5JwFjQa1BUfvFmyrW7x4Z5clY9l+1daoXarOdT+J
	8SP8TQUYebz4+qG4JGG5JITNB55Wv9jIGClIM7/zh8BUA0nGwQthUk5FjXyh4ixoKqvSzeHRckW
	GfYdKboB+6/2CroKGtCFWko3P5jT1HtO7PT8jrYhLevlsCXsuFnn98r0rK2k8SEe5mBJF2mw==
X-Received: by 2002:a17:90b:3950:b0:396:d27b:89b9 with SMTP id 98e67ed59e1d1-39e1e31e264mr4511213a91.10.1789549301596;
        Wed, 16 Sep 2026 02:01:41 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbe3e62sm3609040a91.10.2026.09.16.02.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:01:40 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Siddartha Mohanadoss <smohanad@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] PCI: qcom-ep: deinitialize endpoint on remove
Date: Wed, 16 Sep 2026 17:01:26 +0800
Message-ID: <20260916090126.2963064-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom_pcie_ep_probe() initializes the DesignWare PCIe endpoint with
dw_pcie_ep_init(). The probe failure paths call dw_pcie_ep_deinit() to
release the corresponding endpoint resources, but the remove path does
not perform the matching teardown after a successful probe.

As a result, resources initialized by the DesignWare endpoint core can
remain allocated when the endpoint controller is removed.

Notify endpoint functions about EPC deinitialization and call
dw_pcie_ep_deinit() before disabling the controller resources. Keep the
existing early return when the link is already disabled since Qualcomm
endpoint controllers depend on the host refclk for hardware cleanup.

This issue was found by manual code inspection.

Fixes: f55fee56a631 ("PCI: qcom-ep: Add Qualcomm PCIe Endpoint controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 56184e6ca6e6..28949386b0e8 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -944,6 +944,8 @@ static void qcom_pcie_ep_remove(struct platform_device *pdev)
 
 	if (pcie_ep->link_status == QCOM_PCIE_EP_LINK_DISABLED)
 		return;
+	pci_epc_deinit_notify(pcie_ep->pci.ep.epc);
+	dw_pcie_ep_deinit(&pcie_ep->pci.ep);
 
 	qcom_pcie_disable_resources(pcie_ep);
 }
-- 
2.43.0

