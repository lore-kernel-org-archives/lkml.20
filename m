Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372824;
	b=RtxJ6OSpipsoCPxq1FgoXV9kdq8O1MjYdzCcDxEwPhq0ruyiuub+rjhA2ohXOq1m+mFY
	 Kni/uD82gWdxfiN9Tf+nlU0lVt3Ekn3XtfZz0bzoeObq56cO1ZL5RCFKTe84s+cPjvtfK
	 13ShiYo5lHkwMJdXuGIsyUVGqWuhrEtyA/UeRxUZ48I8HyacH0SIh/QC7EY6B556H4dx0
	 TVAlidpjev8ASUe4TqDH7gqJYIhS+k+JURnw8TnmsI2K669TfoL/79haiZ0XzPQRGUtpd
	 1mVSJt2G4DrGIMSU2oQ2vQ9dyL+E2HVf53ZGCNKrV0ryjA+HLDAJRLgNP2LoWUqefOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=czilngxYr4DCa8qp6+h+f369XEDq6BL7zSm3xrFlL/g=;
	b=PkzWYHg1P6NexWsxjaX3xMKKUmxNDW1YKHMGb3sTQJSV7vfIGTBM7WroPqxSHwXgvc6S
	 gmvjfZZ10+/Dt97tsllojzftaPX+Ymzi8FBunRg4Wj7IitNIG/AfqcmL+MBRhhYoR9m+N
	 5hl4elNa3iCAhlrvRCuhgSO/T9BvXCVisjj2flG64jjw4QDXQ2eXj6T/E1/nJEpmk/4NS
	 oEuHU/1SyyoTj+zsBzAa1eFKppeW9nQPq5NzSdiJ7BCfk0zow3mfc3ODp+qVsnG/7SHF7
	 RjF8L4e3J8UMIkqEkC9PWFK5DFpqbi+4uww4NHhWEJD5fUqu00XL/cpME/03EzB/Nng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ttEBhIGg;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8811D606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8811D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ttEBhIGg
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15dd124bbe7so1399606c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793372823; x=1793977623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=czilngxYr4DCa8qp6+h+f369XEDq6BL7zSm3xrFlL/g=;
        b=ttEBhIGgwoNvjx79/PnN3j6bkh0veJHsN0NCUiD1G6OGelKk+m8zlOzI8KgifA5hf0
         HAmP1raP5o7zE0mKZ/OnOyWImdgTnu26FK5NBppRfUFQzp0vK2Gn7zATfGc/KL5xKZv/
         fLpCnZxFFeVX6UmfimRD1W0d/hTWFkhMuha16q2ZIi1ilRfkVWLTzqdCvCw+EoO5P8tt
         PHXFZx1lTmKvIiQU3xRv6bOg7htydx0D0EVG81JgSmiZjxyFzBFf/kqjw7xRGLIjGit9
         Y+zLHChz4ZEfIUbdU5aIELn8eQq5ufzsiOo9ZIDvT55GNR8YBd+1jOqQAvmgn8KW9hm2
         PYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372823; x=1793977623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czilngxYr4DCa8qp6+h+f369XEDq6BL7zSm3xrFlL/g=;
        b=DXdNDQcC3CghplKhZ5VZECUOxLrLJPe17jlYFiIx3yO5NP2hkFFj8BcslVCOMaDdnZ
         ksPSih0JocuIKQ5x/kPtueCl4YZDQCNfHvrsGMuNoBAJZroxDfqoMsitAS5Q2hqOrzTv
         afH8Hs3841XtW+uo+GtmnXp/uEspkITZkCiJxzT/6HIuaz6AjKu0LEZbf6fyOeztYvHQ
         a0vkn2IZeVKaSuuWNadQdYhPHVcQej/5qhdQfBsZnhzutnoTDAhsr3bc16knfhuSmrdZ
         mCUdw7I8bOr2vG0cpsV2rD1cBoe9+LdMnBwBcxrWE0DYeqqKPceyyP3JUieM6krrjKvU
         /xpg==
X-Forwarded-Encrypted: i=1; AKwUvBzQf7rIxONli7J5kQOyA2guXmmGe+ahXGjDzslZETaYFvM6N9hPRB/duL2JrqxfdG+IzlJQmyZOnmbRHUs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMN52YgHvOYSAZ+o5Yg+ITcKV7MjUGziMwX6B+QYRpBTr/OdM5
	uX4vtZoNne63kQVEeBGCVwPhd4vqff52e6v8gZFlWq8leCERkFgcI/3jNzGvxx0C/D3Xug==
X-Gm-Gg: AYBFou3H1342pQMnMvkCunVT8XoMON6ni5s68svWkZCzEgqGsQcIuDJ15K5RzcwLsZU
	qFqFBxjxWl8yNEeswT1Fl+PeOBoBvN7nwahRcuB4n/516Gj35egsekRCjAPW/FQ3VaOyeoREq6U
	nmLMWQwMafjgDqGGFU6+cxQrrXiEvDnyVBjpF9QzKuMGD7htWiH63PViygGuYdHPz5cCJbeUuyR
	4TyJf5Mx7VPSKsozr/bm4MWt+SwH0QANpP0lkTswky7yTLC8SEgpjvzLQmefxWXTFcDncD1ysOm
	zB6NqnnfHCArqw1fw8Dn9gtmpsu3OFjcHTYcyy+ihJOKyXqI9rRUSk+Hl4ilAymin93VSTEof2S
	smtzwDqYZ6XB++oZPjqua9l4iaPGV2h/mUdgPdAeSqkoNlh1HnAl+l5d7e2geGioo04NEOA763U
	CnwoGc7uoQaP5Twv7S528g3PmQP2ClZi1otrY1GxVuwddZlGYXzFZv1OOmqYVl65z2kfMD/C6D6
	wIi6xt/lRoGcw1uOm4b+gUFAwP/PvzFZBU1isRFDDYy0ijWXVmlD2R/Nb4Gpg0GxSj3Q+c0RKTz
	yKz7SowZX9M6t833r8O3B6mYuaVCjLAPgnqXN/jaCGew8GXBPhhr0dwZhJX9DRmyr0mBw44YDJJ
	i3zLmbb9OyyAtWGZL2S9ZjiIq0w0FdUD5dWEFOfgEc1YdhCdtqwNWMHKfJ2ZDVAfMIkmDhQFESx
	w3k/w0WZkAz2wHsGaa07B6GBICANghYTpDQ1c=
X-Received: by 2002:a05:7022:1113:b0:1ac:9da7:e86e with SMTP id a92af1059eb24-1ac9dc67128mr2995647c88.30.1793372822378;
        Fri, 30 Oct 2026 08:07:02 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm7475171c88.23.2026.10.30.08.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:06:52 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [RFC PATCH] mtd: nand: qpic_common: terminate DMA channels on transfer timeout
Date: Fri, 30 Oct 2026 15:06:46 +0000
Message-Id: <20261030150646.2942368-1-samarth.colleges@gmail.com>
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

When DMA completion times out in qcom_submit_descs(), the driver unmaps
the descriptors' scatterlists without stopping the BAM DMA channels.
Since the issued descriptors may still be active, the RX and TX channels
can continue accessing the caller's buffer after it has been unmapped
and returned to the NAND core. The ADM path has a similar issue when
dma_sync_wait() times out.

Terminate the affected channels with dmaengine_terminate_sync() before
unmapping, ensuring that outstanding DMA transfers are stopped before
their mappings are released. On BAM, termination resets the pipe and
discards pending descriptors.

Fixes: 381dd24539a8 ("mtd: nand: qcom: add BAM DMA descriptor handling")
Fixes: c76b78d8ec05 ("mtd: nand: Qualcomm NAND controller driver")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
Questions for the maintainers: BAM pipe resets may raise a fatal error
if the attached engine remains active, so it is unclear whether the NAND
controller must first be stopped or reset. The success path also assumes
that completion of the final command descriptor implies completion of
the RX data descriptor, which may require confirmation of the hardware
ordering guarantees.

This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware. The patch has
only been compile-tested on arm64 with W=1.

 drivers/mtd/nand/qpic_common.c |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
index 4f3e4dd76..250154a08 100644
--- a/drivers/mtd/nand/qpic_common.c
+++ b/drivers/mtd/nand/qpic_common.c
@@ -592,11 +592,18 @@ int qcom_submit_descs(struct qcom_nand_controller *nandc)
 		dma_async_issue_pending(nandc->cmd_chan);
 
 		if (!wait_for_completion_timeout(&bam_txn->txn_done,
-						 QPIC_NAND_COMPLETION_TIMEOUT))
+						 QPIC_NAND_COMPLETION_TIMEOUT)) {
+			/* Retire every issued pipe before unmapping its buffers. */
+			dmaengine_terminate_sync(nandc->tx_chan);
+			dmaengine_terminate_sync(nandc->rx_chan);
+			dmaengine_terminate_sync(nandc->cmd_chan);
 			ret = -ETIMEDOUT;
+		}
 	} else {
-		if (dma_sync_wait(nandc->chan, cookie) != DMA_COMPLETE)
+		if (dma_sync_wait(nandc->chan, cookie) != DMA_COMPLETE) {
+			dmaengine_terminate_sync(nandc->chan);
 			ret = -ETIMEDOUT;
+		}
 	}
 
 err_unmap_free_desc:

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
