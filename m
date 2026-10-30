Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372977;
	b=Py25CX8Crtau5YDqahcq55rQyXe4FBIOVGsMkweO5E/j7GRO35gqBpydlRCc3+vSDBJs
	 od7DOQIm+GbmxquJ/1lK02uOqGdeDfJMuzbq4Z1Bs1FCaiCWcSthuWkukNig+pC1eW6N1
	 kiswqnnP2BuP3SfXmZx8ohn09Ez5V/k/MdJ7UIKELn1FKbs+S/pkOL/f/9S9ZNi92Y1Tj
	 ogwzAkXX5F54f0rPz1kiwSkJIc5HTDND4ev+TdwDyMZWTbRgF1mL8AjFW47MQwNVRVhAB
	 nFZdnBa5/nQMtLCofGr1OsGxIiRY9acwFptLfsB1aPuWtbkp/SucPfbqAgkPssZAP/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/UiY3oEhmm09gQt6+h2fxxhgxNmhqW0iOqLXwE+OSHg=;
	b=Tv4zLURCSvrtasU/4EzlewqpG/vTFijLJ+SIXbmqLsxbwTjTOrKfgwnS6hwLAjA3GbeI
	 kg/CQhXe1tPgt20XJ6sAyUyoPLrxb2b+W/eKFNSXjDh37cHcd+Le7y0qKvqtvQ1szza0S
	 53/POHmTeN1dEvrD38fHZW8lNpeGt9RCosDpKpg41V+Kmgk3siDUXtBWDnUTvN4l783vG
	 /dc7ykhZe4ERPI0QVNob+f+0RGS5zw/kkM2jK5nWnuJGZ5S45Fx3Ix8y3HoErvnUuLvtz
	 Xw4j1Y4923NOGrkUPXcBBaCC8KF5G3mCXhXqhg11D8BNOJiCkpWkB3rnQzxUANkVeKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tb2LDwF6;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2153E606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2153E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tb2LDwF6
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15dd124bbe7so1405240c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793372976; x=1793977776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/UiY3oEhmm09gQt6+h2fxxhgxNmhqW0iOqLXwE+OSHg=;
        b=Tb2LDwF6QUG4wUPNNkVaCf3jkiBdaJWdaWwyr1N2SXwxtA5sPmqZsAJ/v50IlLxvCq
         JWM8o7X2R7zg9NMlYizn9jNRrirVo4QNZIGb+CoZQ7QaaoJaLEbBL7DAhd9knr2mdqzx
         XQ0SmetzkF4SmCXXpbP/dOCNLuk350woXJEYYQBkc9L2UzEH9UZ7GHXkEwyxDSd8QohO
         iGiGIyRXgkvdX1PHaQsaQqhlEa+XjFCl8LLkIG1g6HKlbHszfOjwoNtM2P+rXsmZp+2N
         qz6OwAyDzOdClP+YBr7zmXE55+dYK3c/tMVeZOc1cmMXL3EzTB00d0X4+aiUZO0j7Z6B
         UqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372976; x=1793977776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/UiY3oEhmm09gQt6+h2fxxhgxNmhqW0iOqLXwE+OSHg=;
        b=vYHAwaA0sQGRvPFOpUPEaHdpeil9eOdBcRw/2TMa5sfJUs6fQgjQPYc2YhJV7o9Y57
         a/eGwl6oBASfF/qL7Eeyksv4d7+/+IUTaD7eKppahNfZB8BTGucuplbuNQjx+3G88r6Z
         2nqD2pyhUsuUnSH0mdeEXkDpg/4B1r7xUoxbTmqtN90u7R2CCtkfeCXC3bcAOEynIDuu
         WuAr8qx+DYCVPoTvOWITTDNV2suRB7SsUBSIs1PgFsuPqazRe4C2QJkV4ibhqrHYnhIU
         1hoPS3EixPcyzbvIwZvPXd8AEeyfXqF+SjresM7tVf9eq3kj8rkkPNdrbsmTnWD1i+QL
         4HRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwg16Qk9YOjs2W2Hz4DmRhhS8d7QGf57toVZY7aD2ekI3ytck1Cy2nQolCYCqChWfmWRW+EcN/RYDVHESk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJn8wLvlTHsEyE4c6nAfS5f7tP5IkJZVAK3WNwLg9znWQotTbao
	PporkXSVT//TYIEtdr3x6MmCpoBC9VW1fupiPJEGrq3fLJZ7XjwtN4MS
X-Gm-Gg: AYBFou0tJok+jQ8zYOl+g6UcqAJW8Dzad3s+D1YkrNRGyMbJX765Lsmk/rubw/djx5j
	TO+dKBWMm2wYLAXdqpR2BDWRq+XYDCT55uH7a43ru+xepAIzzUHE6wT8yDSkf8hqPfPdKENkxRx
	kXHPV25Y8EZaHICeqkJiHqnv7I80KhS6G+l9zuOTYDfzRO1gpEXmyzm9hNbwcD7vJEU/r97ahtJ
	5QRx4mbkq5Khwp7v1cUSC0UpouYVnHELZgm3HLk6ff8kzoaWHreBn9KMtBSbi/m9ntP6KtLDgCT
	UZ++zotb0p9rGnrry/UoNG3kQJvR8OtKdIO/bXiszK3Yphh9/KNpmHsdkF6P7cFgPtfzuS5vs+K
	usdjJb9jDkxYpPA1/xzJhtgTLuXgKvruLLYJsL8a8p2UFpmhthI+xtuuiCdbAZH8PgYh0ZDzFec
	BW//jVXSftnUeG1FeDLfkT877KEZFwwIRGxDIYHFZFgKKQ7ZRP4mjsfQRQjOZiA2lgGjeDRWkeD
	x1b7wAWYOEOerD0DLpB4jnhhI9/qaxv6YI7ja62YqFicQsDlV6BF4d/GdMPvUjpOYuPeOvGsebN
	gn4Yujy/9dGwmqMvh7HtrjX9V2ZIgGx1P3nSNJ20OPEcm7nnLBOD+XZKgx00qx7qPlwBeEs0dYj
	mWpzFFtMaH5jjhaFUAPUL+cgskIIJu5fMFNJx6xyaFJUlw6kmlzr8S6nXycUy37/dBw6xNV3lzl
	l/eJ7d6TSXMWME3dA=
X-Received: by 2002:a05:701b:42c2:10b0:185:1640:5536 with SMTP id a92af1059eb24-1ac5ab52fa9mr3803741c88.19.1793372976047;
        Fri, 30 Oct 2026 08:09:36 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm9193386eec.29.2026.10.30.08.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:09:34 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	imx@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH v2] mtd: rawnand: gpmi: terminate the DMA chain on completion timeout
Date: Fri, 30 Oct 2026 15:09:29 +0000
Message-Id: <20261030150929.2944717-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
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

When DMA completion times out in gpmi_nfc_exec_op(), the driver unmaps
the operation's buffers and returns -ETIMEDOUT without stopping the APBH
DMA channel. Since mxs-dma leaves the channel in DMA_IN_PROGRESS, the
pending descriptor chain may resume after the timeout, while a
subsequent operation can append new descriptors to the stale chain and
cause the old DATA_IN transfer to execute again against an unmapped
buffer.

This can result in DMA writes to memory that has already been released,
including buffers freed after ONFI parameter page detection in
nand_onfi_detect().

Terminate the channel with dmaengine_terminate_sync() before unmapping
so that outstanding transfers are stopped and subsequent operations
begin with a fresh descriptor chain.

Fixes: ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
Changes in v2:
- Drop the code comment

v1: https://lore.kernel.org/all/20261030143945.2923554-1-samarth.colleges@gmail.com/

This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware.
Compile-tested only.

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 527165ccc..a8106de2c 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2659,6 +2659,7 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 	if (!to) {
 		dev_err(this->dev, "DMA timeout, last DMA\n");
 		gpmi_dump_info(this);
+		dmaengine_terminate_sync(get_dma_chan(this));
 		ret = -ETIMEDOUT;
 		goto unmap;
 	}

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
