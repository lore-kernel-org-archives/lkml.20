Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010003;
	b=JUP2uUQRTYly2zxscfL0ZOzAXYUxhZQhfn3z1bJWjTYgZwcttNNoqJVcdcfUR8/46+zn
	 o7ZqHin9RamXNXrq2lpMWNJp1hNn+ElZ5LwWdjwTqG1SJBLF0GqRiftqRzMHv81j1qo/D
	 sx2T9osPUu6PGw3ynkrvqGQ8jBvO/qZ36FVJag2Zj/OkBhkE8B4Vb7Zue2syEycXvbrwt
	 cXegDoVDWpDpTxXlsiqY8wFIck9BA5uDz2iew9+ulqs94N9GxdWAqySwMUZSp9ukVzlSw
	 lQ6XYtvQzk/wbJd2AXyvYYr2412YYhXJmRdR6Dg2ml/+xiu3U4PfX+Jza0aP44kxnew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010003;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ZgUlYm807ROoByleEtNqO6HkY1e2yjPbq5r68jDHbbY=;
	b=iszTjZvphqPF3DZUz3OEwEnIx2CgGJtN7jpJexyFXEO2ZSaRaKYi9Hn6JBnmFRMULzJl
	 Tt0h3vuH0cJwD0PN/OgMmQAaNG1kC9eOSU/OjeiiwNgVCDzYUkkIuVI+1azJO/zv5Zx+O
	 B3O8So+SMbet+7Tt3aOF4Vl3leP691nHtLcUUAtoaOkFgXryFnwmQ6oBCQOcABG28yI/p
	 LNlcDGR3eazebKQpsR+lZ4gLQhQQGD+5ZthSfejRlQTY0Y8EBgzQsHPtYHgw2hUANfByD
	 xpTFxjWFbD+ioKDujrB//ezO0fFU3COhNjW+sW7momHhLI8h+Mz9QyIQlUcbFULEKDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=blHW9Stq;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=g3DbI5C8;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284A1606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 284A1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=blHW9Stq;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=g3DbI5C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZgUlYm807ROoByleEtNqO6HkY1e2yjPbq5r68jDHbbY=;
	b=blHW9Stq16HlAMW+Vr+8IoDMnu52jDSd2rEOgXK9puAM4vY1kvrUpGmPiMIn87/ruDmznp
	hgQ/enWjtHj7lkF7QAUROy9j3ELAcwmrF9FAjQCRWwBaua7VFfoudEaeEWnyj50HkRMUxm
	poCuvRfRON9asuFtdnmNJxF0//2u+xE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-rOP1Ur9EMpGthEzGU-330A-1; Fri, 06 Nov 2026 19:06:40 -0500
X-MC-Unique: rOP1Ur9EMpGthEzGU-330A-1
X-Mimecast-MFC-AGG-ID: rOP1Ur9EMpGthEzGU-330A_1794009999
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so396411485a.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794009999; x=1794614799; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZgUlYm807ROoByleEtNqO6HkY1e2yjPbq5r68jDHbbY=;
        b=g3DbI5C8Sh5jcyfqakITrZg6V+R8EqZ5c4PJgRcJUNWVtvvYNAPU+9F48wUwE0u/pl
         qxuEmJmn/PB1MiIyyMKLY3iEi/aJ+nQKn2OyRuTr/pjnAcJ5vbcTm9FQaGBghh4mmpUY
         TFXFRHJBN/yxLdRYbDfB4v99hummaGeIx09R9dMoMXTQL6WbrsmswpbWpd7vMb8Y+j7P
         xkP/DNt12faKBXW+LCzmkbmqThBH6yq8WzNOaiL/L+6EXG628GWS8A8bRGDcl7xvbSHC
         G47RTK8+FsWYD15x0kNRuXJoVZ1KwHRJQN3NUdlIDR7UpZ/o1hJIuAjtrbI8UT7I1ud5
         Th7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794009999; x=1794614799;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZgUlYm807ROoByleEtNqO6HkY1e2yjPbq5r68jDHbbY=;
        b=2w+X9vw+3A4Akii5JhMTO2bDYAdbeQznwudMExfVPgMRYYPRP+RqDLdk5LLfGsuXWi
         1XDDBD2BtzP2LRlCZcErfZ00DNpa+y201NVpv8UGQnXeAsvWy2HwVUMb16F7K6oax+un
         bZL5T9uiMPDx1ZvbJG9Tgxk5EKI5OsBRuKCCdi9rcR+kAKmp3mrKUoaksPqK7wYhYGcR
         iFeseRn93burJO3fVgSbLuzPN2CxHZBUj+4IxOwjuDjnfKdFRoHYce8nyAq6aJp0CIDB
         4/QPJKQk1W215WI3PYXgsXxjSLDCIEbb/zCNt/HHa61PF1gweZJktrlF1ApIe1oc/UY7
         GHcw==
X-Forwarded-Encrypted: i=1; AKwUvBw5dTIzr/4KUJnTxU6s3hTSeulxvhHvBr81BokfL7mGgMRLRvGEL9E6ow4t8m5tK+DV6g9fRV3rLCFJsU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W41pR29SGwRZalK1Ti02umK5GBgLN9Qa+ZuXsCQ8LP9V6JthS
	mu8nTqLkVVMFy3ZPOUB1m7/oy6gst2dpVpe+7Nm10438wuSWU+ZWQNENnAkh6pMroJ46R8z6EkJ
	GlTbjJPdSBaMqFwqUxGx7tpZeVZZ5lkzE9sbPXyGkJvwVPyt/sLYmPffqfuWhPtfsyQ==
X-Gm-Gg: AYBFou1sEW3FpxWJc/I1vKmLCkMKyUNq8UyvUxfPxxwr0Dvib2M3iKCAvZfQXepQWQo
	e3KMXxmDRJcgYkxqzZzDzp8toaMbsItzIVHAp59vk1NdgqLp3zPKltNF6oVQIsfSAt3Yps4g+U1
	GyAPfsAkZCrrdRn0VkWL7Fx4CVMQ0kzE5QYSnuu44bFSPNpLq8zKXY454x/gorYytu8UZWuOgat
	6U6kA9TzmV2KyhkhDiiZM21GwvC7I49raYaDEHAFdWzRM9b3aPDB5Se8gy/tQvPQF3GJeK75xFX
	w58zB6b8LocTA0/rrQqnezDt2iy2b3se5sJQkkJy1YwWoMVWNfxSnsDq7c/LVD3ULB7tO3KiCL4
	CzvJDR/2Rop2XsBJq1a5vxa0b5ME3Fzt1PLShIIA0MqFTxdsMaQylwiz/e0yxxerO2DvPXIQ+6W
	1igZPRgUjvfeHBsktU
X-Received: by 2002:a05:620a:4487:b0:93e:c12c:fbbf with SMTP id af79cd13be357-945f36131dfmr656684285a.76.1794009999333;
        Fri, 06 Nov 2026 16:06:39 -0800 (PST)
X-Received: by 2002:a05:620a:4487:b0:93e:c12c:fbbf with SMTP id af79cd13be357-945f36131dfmr656679385a.76.1794009998935;
        Fri, 06 Nov 2026 16:06:38 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acc4a7sm31624376d6.44.2026.11.06.16.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:06:38 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/3] dmaengine: convert to subsys_platform_driver() and
 subsys_platform_driver_probe()
Date: Fri, 06 Nov 2026 19:06:07 -0500
Message-Id: <20261106-dmaengine-subsys-v1-0-780eeddbf3ef@redhat.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBCF4auEWRvItDaCVxEXMZnEEYySaYsl5
 O5Gu/zgvb+CUGESOKsKhVYWfuUOPCjwd5cTaQ7dMJjBIppJh6ejnDiTluUmm2gM/oQWRxPxCP3
 2LhT5809errv78kF+/nWgtS91cMYmdAAAAA==
X-Change-ID: 20261105-dmaengine-subsys-1dc716130f14
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 Zhang Wei <zw@zh-kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-actions@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1433; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=oVVsVvvwfxfCApVHL620mY2qW7PKDgCvH3JDOSlJNIU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeZdcF1fMUmH+rXipql15WdnT/1AeSXHt/1r/5ue1r9
 M+H33PedJSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCR/hkM/8zit2odZXRSqNV5
 sVO+W9Z/z9Uvm+4UuU33k+g7uHdzqgojQ8N5ObsWa4OmxOCDrNu7b3qnL/RZuSGFoz3q0Oawy6H
 sjAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in these drivers and convert them over to use
the macros subsys_platform_driver() and subsys_platform_driver_probe().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (3):
      dmaengine: convert to subsys_platform_driver()
      dmaengine: convert to subsys_platform_driver_probe()
      dmaengine: fsldma: convert to subsys_platform_driver()

 drivers/dma/at_xdmac.c          | 12 +-----------
 drivers/dma/bestcomm/bestcomm.c | 18 +-----------------
 drivers/dma/dma-jz4780.c        | 12 +-----------
 drivers/dma/dw/platform.c       | 12 +-----------
 drivers/dma/fsl-edma-main.c     | 12 +-----------
 drivers/dma/fsldma.c            | 14 +-------------
 drivers/dma/imx-dma.c           |  6 +-----
 drivers/dma/mcf-edma-main.c     | 12 +-----------
 drivers/dma/moxart-dma.c        | 12 +-----------
 drivers/dma/owl-dma.c           | 12 +-----------
 drivers/dma/sa11x0-dma.c        | 12 +-----------
 drivers/dma/sf-pdma/sf-pdma.c   | 14 +-------------
 drivers/dma/ste_dma40.c         |  6 +-----
 drivers/dma/ti/omap-dma.c       | 12 +-----------
 14 files changed, 14 insertions(+), 152 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261105-dmaengine-subsys-1dc716130f14

Best regards,
--  
Brian Masney <bmasney@redhat.com>

