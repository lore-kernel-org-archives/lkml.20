Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377265;
	b=iH6eOzW8hKvmn4Ic/wvudzxfyBAt6RvVHSHC9Lz9H/dxw8OQOfK5uOv8Ue6cYGjyGFGk
	 d/4YtnYRvtQpSrTf7PSsUw3feUq1rSiUNX8t3Ut9f3z239xjO+ohuHxwaemY9SkFcZSxu
	 RMvsS8xX+3R47GL4bSUIDm8NEuMs5CFUTHDCnA9rIVj94VRQ20JNSb70vUIWuwUgEtvDu
	 9PTyIclaB5J4Z2v8Z3MVlccfTi4moJ6N52PU80SSkGoBjHcN9cYLApcbvKSjk+rpd5y9H
	 XA2CbTDAInO/uA99S7t8q82XU/WjzChi4tDfnt0rWQyM8sPnXdB1zHkGjVpdLdx+qxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3LJfsKdpKDX4HmeIK5NT3BudGEfehV1hBOYrKs1Or3g=;
	b=dnoHiLF+yYi/x+UllSkVlSbmhrfZAa8BmZ5iUu2HCogC5rlhJVQbDA7gTwFx2iaTp/zW
	 4ESr04iPk0kv2REkzkb21yU5ft/SDZhG53uDvYLHxPbEOO5QKqyigxBP/i3TzGLe6WvR2
	 bJV58wDUIlApFyrFn3aYiPa0BQq6SFZktuzwyPHgjqlCaqWgMO+yqdIgdLhKmZhmPG6Vq
	 ah7YkCqKGITeqlQf5X20wnwSWKXsqURIZyV6xp7WP+75rTu7Ll3NynC0KeW1QT86H+qdp
	 gsLZUkG/gkDSWEOwtUAOcysPw1apejGrc2PZI2IyXPCySRh5+1/vrSO1FF8O/6qutew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T59Jz92y;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBA5606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EBA5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T59Jz92y
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4b190cdc9feso590843b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377264; x=1793982064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LJfsKdpKDX4HmeIK5NT3BudGEfehV1hBOYrKs1Or3g=;
        b=T59Jz92y5UNIU2Se+frZiyeIsQvDV3jh66PZoH7Dmcv+1IxaZStmuHrav84KWe8tP5
         M1f2zVEWXxkysFGikV/NzJxHIDtyDZaWPtukJx8TqHRblxyD/L/e3twRnVAFpqTJprrw
         /VxoUUmfQsEjp017f7jXT9/+4sQ0ZsOEXwnFoZIBAqDyprHTaUJCxKQq4qivEweYWZxT
         4YWGoiWPCPV1vP8JC0DNszbPn6jCE//vjO7UsIarftEtkNVm4/JT7iXGFvZN2PZtzZZY
         rwOaxyO94uxo/P5YvHelDf62RQ7zkkSZgSIJSv8uahrJ3XMrNFzJt2Bgqr8m+iCMnBSE
         W98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377264; x=1793982064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3LJfsKdpKDX4HmeIK5NT3BudGEfehV1hBOYrKs1Or3g=;
        b=jr31m7MMFmO+VqlwunOih1HdfLLIASImfEYaxhSekVpZl9lHddIDU0KG9I2UIttN3X
         QgymKD7xh9QovmkX9eBMpwaa0SH41SN59ou+S45Q4b/Pk0lwFv5kjp01AoC1BweFex/w
         iD4kD1B81+6L7VGZ+2+/KE5ZhROfp/CFE63rksGbJrveE40LWF4rnjvIFnXb+p2x5dhl
         Vw/kJc63IUw4FlZJ1xpwtwVNpCffpwk4GWbjnw9W3FxHldgElDxLX9PnQZfqGCdjiydk
         czheh6SBo1WsWC+fWvjGzKKgsDBnNxRw3ooLQHeJr0Co1ku6gm7jr21R9c9RdEmnrjto
         GcQw==
X-Forwarded-Encrypted: i=1; AKwUvByyFCSrAVptl9TwkXRvpZDhMuGOqKCxm3R2b1VzZfHam0ZTroV33aW4XEbwhn36aRvagEaLsDaawuCo0BI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpUYsRonPy6puQhOu3a48pav7kJr8WW9xXv+E5xqJb6aZlkz5u
	us03sSkDeWAAWgnhcqEfBfxqfJYHvbMtWTxUiadwW3pcXHlL7K72hhQ4ObDpTA32AxY=
X-Gm-Gg: AYBFou00Qa6g3sj4Na/STLDGJO5CK/MplY8S6X5QVCfk778QToRyvarl92UtYcq21Yk
	625O+KlZFjhtKptKL2CGvGevWryqH/xARRauMwWXWE4YFUDhWaPaoGpwz71WGu15Y3tWccfBdI9
	Sjn1CPGVm/WJ/YX3nNq7ABcWF96A7ZT/1Ku6qga+N0U0Bkz3AAnPDvUGWj4EYa5UWr18cZiyPuv
	MJoLhvxh51/O5aOWvnT6Auxzu7E9QPG0X22mTmhe7SQPUhmsszU/UqtfIJrK9x5EA9yl7Xkenc4
	KxTTaQ54/cTh3TxXr00m4Hj5AmN3WWKCfKw1akLLjTik6cmr3G5U2y+47lpngQ13GZZ8yxHJV8Y
	SWe4+HvcTWxIku1NbC+50rWX7IcBG5RxNEMDdXP8vrCoWsAPZ7xumtCqhv78lX4RzEbzeftSEa5
	DVfeWGV6fdySUcYf2thd/++TC0i833Ai6bvTQldwRM/NOC3uAaMXRXq4IGOvo0E56dLUV5Szn99
	YbA13Gl08Z2IEQlnk6Xf3SMWDV3GS1sJU3MGebxU8flxu/dEdb6AqKsfNRVrDM+3nJdmsnYLE4V
	odSAtIF3lXK0YE92M2x0y7WtoNYSf+iX8JBfPrUOGeRV1BKlu6MDxl2n5Y1dNEe0dmMmmKR5xNC
	UUoNkKOz3hDogOeTV/Vg6ZSMIHmyp6Gy0b7gmWTZGYsDrmfqPv9aR/0xfzjf6lnAzdaKyf0hXdQ
	P4eeAk9QEo6hqi4QE=
X-Received: by 2002:a05:6808:4fd4:b0:4cb:f21b:6f8d with SMTP id 5614622812f47-5640dd9e77cmr2333862b6e.32.1793377264401;
        Fri, 30 Oct 2026 09:21:04 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:20:59 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Han Xu <han.xu@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH v2 2/6] mtd: nand: qpic_common: terminate DMA channels on transfer timeout
Date: Fri, 30 Oct 2026 16:20:37 +0000
Message-Id: <20261030162041.2998170-3-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030162041.2998170-1-samarth.colleges@gmail.com>
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
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
 drivers/mtd/nand/qpic_common.c | 11 +++++++++--
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
-- 
2.34.1

