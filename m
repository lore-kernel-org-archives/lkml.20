Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371192;
	b=gJVsiJVRKNSZWB5UsjAlaH6kgxL+SDA8Mt/mfLCslZpvh4bG7uUXH6wf834K2d4ULzNT
	 CTumtMyi1fVUNSzDbDdbSM8s/ncOaw7zK+LWAzGeyGKWjEBkwIOKjhr+rXEUwSCd00Ydq
	 +S4o/srj6p+YREBr/0/cMNKHznMk/78iI4Gct80O/SvflpAwRGGf+l95A21dAsCHNc0mb
	 mK1GHhGPClH+hWQcVBkruJRMph8duJfTb3+g/cMKKtDFcAXgvfPHSnA6jGUt6xxP6tZy9
	 rU0by8nIt7ErI7LjOgBbRfqF6f1+9jLU7U+2SD003f7QplCWevF0j2GD36DzYPCs8IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R2HclnRmIvT2ikyO/43sxrVPfYW6Mo/iFT1div/Cdnc=;
	b=n6geFK4K3OcKtfHzXZFgXIqtPBlgkzp8JnvGbsfDkgpUpk8xThE6QU9+ibxNMmd9zUjg
	 1iJXut9HC91ol9mY5ER2wO77vcG54ywr9te634I+lJyph0fVLoXaMGJOkFM0q2ZSJH65V
	 69l7I6bp490dC48LIddsGqNf5eQYwnAqLmYfuZZ4wFOPHlXwJ2fDrVpn1IauS+1BcEZX0
	 Su+8vDIU7c2etVdn0yymhNjBLaXxnVdd0EA5RP6BHUhmYcx2gpMUvZH5xUsxiz1ZmUNe7
	 3UlaDZaXilx8ilo6PY/4EDaesafLuwtnm9yoKgUlLNjmKOkPXtCD1CEWCcWy2fu2Jnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VUeAWBmK;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4708B606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4708B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VUeAWBmK
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15943c9c005so1350176c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793371191; x=1793975991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R2HclnRmIvT2ikyO/43sxrVPfYW6Mo/iFT1div/Cdnc=;
        b=VUeAWBmKJTYSVv+3tkoGdgC0kw1Z6smznse9NT6R9o7F4AeKZ1im9xwU8/6lKtpcbr
         XZltaVjjfZtKb/Ky0rkMvTLIWI6XA6dLAlcIdzzXKDkO/VxjkL7TzTYtMJAm1qK6BhXQ
         xNlCCzpQYPixb36E4fmzXeOL5afJq+BiGs4EGXYysOzGh1cv3QninlBT7g+pFG7BryOm
         DpAkCmp01MvK+5PI2PwdNXnKlUsoy/PWYES2UW2g8r5hgUuta4IgBhTLZh0UtaGYYlVb
         XL8PPm1buO+9cAVzsH6jhLCB+NiaoZ0LA1+ixORVNE6qkeM+FglPCaRrs+qOyodS/ura
         9x7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371191; x=1793975991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2HclnRmIvT2ikyO/43sxrVPfYW6Mo/iFT1div/Cdnc=;
        b=qJc06HqSiSFLguhchG1yHAAJmg7xOZSY3PKs5wu0ZXLsoAtLI88kPVV8Xm1MmvJmGC
         CHUjk8hJdRNRkdWCwQuOBEI8kQne53qCGbKVLNn9M9Eeoa7oOprG5NlczGt399gKj5KH
         BWa07iObJtaiEwaopob49aQFuwdaddzaQtG61KwR+/zKKayu3HQqdqEDPca/6C0TUQeM
         baRTk1/joSHVcD2KxeWQs/yS4J88NzcV5MjknN445nBPXzF9zLQ5NzhpNCpH4KTZDCgz
         FpX9R23c3+Unat7pDFpqcpkQ8Q0Bwzo+Xg7L6hd75aD/HBzUgEwl6NvW6aMFe0E9o8Km
         x5xg==
X-Forwarded-Encrypted: i=1; AKwUvBwyvTUwcgz0G2TAUazyjt9DUyVcbsBBMsw8f9YSiYea+DVblAcJCiBFMDxM8+7LkL2a/oBayYt1HIizutY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQrBwinUB/yZmmTg73TFOfBzsvHuYXv4Za785hOqQqnrCJkAnE
	i/ZajqTyHFH9/ZLl4Ky5XtHPw2yUahd54h1R3le0/A99Ecs8c7xQbYbw
X-Gm-Gg: AYBFou1QML/W4F7c8ultd4hB+JOlYhY6oDgnJbp1RKAw3LV8EdW5JWaEE47mrrhRYtz
	LmrC//0+0coRzzzKNyy9YIY5qTn5Lut7shWd1Vqk+IK/jYA2Pte4Ln/L3X6zyTucSWNDydBEWAR
	3Wzf9KNA74GLxcKHhVoDFeIDQ8cUdLW3hlvIIL24BqFV5/lryvwztCV2HUu/zUsPW23L44RhOxz
	HFOvnn8SIGL8aup03XU+tZlBPoatrFb/nELqdlkbU/KvtOb4hrZgTi1KGVH7cEfWj+JRGxayBLD
	XOTXYmgeBkCW1J4w1IjCiEYmcDVUiXDArGTyedDVYDpNpR40ln+fZjysK319D7LVd1lIzg9RvZf
	5/9Snb+x2HMiqUA942j0+Hagv6qCtcUsvQ3Y8K8zntuFZ0yYcuazReHOv/GOq/hY0FrN55ZA46o
	J7Kkr8ZKSUyWSptho0J1OeGXcSVe8ogm648DQgXu90dYt1JyDHPOs7aiUM8wSHZpnbolJZGlE6a
	22upLkIqUVdPgoVM13ETtbFW9hiajt8Z7HID3ExopVkukO/Pu3ClPE6ZjQFDHcDk3MqfNh9ctbi
	aG24vgP4bTDUzvTm3CvskXaw5rcCA5yEFxh37SNYFaJmIXez/1qEmf1pOJFTHTtOnHTSM3hdKpC
	rcUDmAvhNLq7zDJUhtCeTLU76jLMAAFgMGGQX3pOm7PyDvU3PhugujgaHiIF/cMyK06Y4msTezZ
	JL3ZDh5Bg3oC5uag==
X-Received: by 2002:a05:701b:2411:b0:194:9e7a:3ba2 with SMTP id a92af1059eb24-1ac557770edmr3026667c88.2.1793371191299;
        Fri, 30 Oct 2026 07:39:51 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm7399020c88.5.2026.10.30.07.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:39:50 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	imx@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH] mtd: rawnand: gpmi: terminate the DMA chain on completion timeout
Date: Fri, 30 Oct 2026 14:39:45 +0000
Message-Id: <20261030143945.2923554-1-samarth.colleges@gmail.com>
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
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware.
Compile-tested only.

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 527165ccc..a8106de2c 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2659,6 +2659,8 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 	if (!to) {
 		dev_err(this->dev, "DMA timeout, last DMA\n");
 		gpmi_dump_info(this);
+		/* Retire the APBH chain before its buffers are unmapped. */
+		dmaengine_terminate_sync(get_dma_chan(this));
 		ret = -ETIMEDOUT;
 		goto unmap;
 	}

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
