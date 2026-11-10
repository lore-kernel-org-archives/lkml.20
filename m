Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316591;
	b=HuacHQWd3QTou51bE0ABC8wOIhOtxZi/yt63kKqKNcPlc/Ai2uPqC6KEK9wry1d0DZzL
	 RzCtIi2kSUWSM25yB3JYxPAxrmmdtwRQw0/7rYsw24+g0s5qWnF5A0uHs3z0teFmM43hI
	 57JGNhMRXVbN+cYqeKkSQZo+4pmZgUfO6+dW3I541UThci5MVBG3SQYr4ljkCm1myuOnv
	 f7OmhKIrqc4QplF3mBMEqVxLJ2TTTju7uWVi5BllEl2gFsmn6lK8dub9yERQC/Nr5jU8+
	 6XJxmDKigKu//1fvo1zUePShgbUhmWgdNx4KwM3VS++YhMt48ZtIOSoAQ8+E5Pc6VuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Cbtqy4auIRvKLrmPW0JIKtBfHxWyyh4zCU0f/Dy9WUw=;
	b=v9Kio2vqkpUFsEVKH4LkJrIoJCfF3YrXLMiHRZxFq3TStt+MMdPX5PnUkvNMnQDUS2Ug
	 /ylFycnmqe44Zye6oT5fauicMtteSCZKAu5D5EJXoHGVdMZtnoK11YNbVktosr42cZAt3
	 6REKeTvnYyf0okrVok48hp8Cd4EvjaS3MWiKKAzJhEa0H6QFVvIZEjtl3tAxbreTq3Rr9
	 Sjy3q5PX9egt5hiGmu4fGDex4zZqVNw5VgP+OPfVe7AW33kp+OQ21cKJpww7+/rfb+bN6
	 A8mMhaUAPGxbR+8rGUvGVsmzgv9093qjNuD8D9EQosO/CD0wjG4Hgp28s8OlbtDPJnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KLUHh5m/";
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C1660A5BC3
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1C1660A5BC3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KLUHh5m/
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso1126619a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316590; x=1794921390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cbtqy4auIRvKLrmPW0JIKtBfHxWyyh4zCU0f/Dy9WUw=;
        b=KLUHh5m/tm62c5WEfHBibvmKyuE+io3kSsYeVTE7wiy6chwZNdOCplsGyWSiZ1zxSr
         98XFrRrkIU2oeXPeqegrrOW1jDgloERa7iG5d71t2jA3b0+Zhch7RJi8m3gqFIz/VJOv
         uE/DX3XTqfNhiepEGw7hEtcuatUcvx3N5SH3cP5aW+iBma4dzpNXN9z4UntLEnzeHO0Z
         f1JkNmYydacoBxbbGeqquJKUpe1HNGOEWYa4FoqKatJrLPPXpo3ENFhRnAx9Qs7UGtJ0
         c6OmtL7dI5u28Oa2L82a9YxpSC2MCaHIun/WbAyhAFnNQXkfWMZ7bTnEigJ/70wgkRJI
         ZDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316590; x=1794921390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cbtqy4auIRvKLrmPW0JIKtBfHxWyyh4zCU0f/Dy9WUw=;
        b=Fd6Ecj5Zpl0/Q7/60GrNr+u6HbqmloOfOXKGpV45FbpFxHeTUqWzkBZA/vVfXgTdNF
         mmATF4Z8dGJg+YAQ3pR8a2Eh+j5EEn2mz8uaCeQ5LMAxI502xC90lmcq0SXWptoz/7RZ
         mOsrnydwuhczlT9w8Ey59pURLUaRzheLFWiDUi6Kt/ZHpDRfbsiQmcUx1aCkSrleUkd6
         Bk0Ehi5PwRaFNwzXtM6wYLBN9CUDuNt8yEziOQv/VUs+YgcVcsiLvwQwL5vCnwsGYsQL
         HuS6EmtfVqfaBxcBsbWk6d6eMummby3Fw2mPlt1m2mCLwKtJ9Z82DfU4iMByUVgLI9hy
         LHqw==
X-Forwarded-Encrypted: i=1; AL+hErHBSLhfph9OxxqeK5Y9yJ8WfhWrQ97WYOngVcxi3R5KgC2hWFPe1Yc965MkBUnfXBgWPjoDg6rGjo6jdQY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BLvGt/YocYDxgrUesM1exGQ9uRS8xNyOg09J3jwyM+5hBQkgg
	vV0WVinv7IYSZlKltfaKjpt/P1boij3D0NTe+nQkJqzveADkETdxGm1P
X-Gm-Gg: AYBFou02+ZdSNQB+gvGSP+swDlaqg07b6ZfNILlwYIKxIywro/1FSkZpq+citzEfMA5
	gXne7dj4AQ6+BgkJnpQSxydnlSo8T0XNpABRpyFIXysBBIr6Wue+K4GUALBRrjs7fZEW0/ZQmvX
	+BtQfl4EaxaIn46odbYSNqCZrmVNhD75vYMGlEIIgf8tqBlNTaeA9T4jEdcLDJs3SrfTyT0kYkq
	IeX2SUHp+Vyd/HBtl4shnxPww5TIBpNoTv4K0IelQwGoLFPBAEjafqtJKLjuf90LduVtFJY84J+
	+RQ6zbMYFlzYmRFM8eh6AkOyNKJixdCZ67rYanhGnOjXWo7tOyb5GW3a7RgbCVfUWJ7ensFRf4H
	7cnj6+Jkxea42yjyJzl8ib/5XIGhTJq6vxzmysTOb4eJ95xPYnJN7uwEQ7cCXu/aMB5z3x+OV3J
	8XwEWugnMwsVJwXetseDIpl1bAl+HzYLTqw1A90tGImEm582TdZheE4w+H5ZJY1Kh1DppjVEBvY
	UzMjPveh6QSAKYZs8BptKl2697LEZ/YMG8uK4MTP60EZc1yPJqTJOAjln9QlV+YfNjwoD50ihLU
	ZDurJFNo88gdwsKahf55pMcIXZJgfiMS
X-Received: by 2002:a17:90b:55c5:b0:39e:6a80:dd9d with SMTP id 98e67ed59e1d1-3b166d05104mr2597242a91.36.1794316590191;
        Tue, 10 Nov 2026 05:16:30 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:29 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 14/33] dmaengine: nbpfaxi: switch callbacks to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:14 -0800
Message-ID: <5e516217bad9982d82e820ea2d837a5512340e16.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
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

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/nbpfaxi.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/nbpfaxi.c b/drivers/dma/nbpfaxi.c
index c9010938c30f..80e607065e8e 100644
--- a/drivers/dma/nbpfaxi.c
+++ b/drivers/dma/nbpfaxi.c
@@ -174,7 +174,6 @@ struct nbpf_desc_page {
 /**
  * struct nbpf_channel - one DMAC channel
  * @dma_chan:	standard dmaengine channel object
- * @tasklet:	channel specific tasklet used for callbacks
  * @base:	register address base
  * @nbpf:	DMAC
  * @name:	IRQ name
@@ -200,7 +199,6 @@ struct nbpf_desc_page {
  */
 struct nbpf_channel {
 	struct dma_chan dma_chan;
-	struct tasklet_struct tasklet;
 	void __iomem *base;
 	struct nbpf_device *nbpf;
 	char name[16];
@@ -1125,9 +1123,10 @@ static struct dma_chan *nbpf_of_xlate(struct of_phandle_args *dma_spec,
 	return dchan;
 }
 
-static void nbpf_chan_tasklet(struct tasklet_struct *t)
+static void nbpf_chan_tasklet(struct dma_chan *c)
 {
-	struct nbpf_channel *chan = from_tasklet(chan, t, tasklet);
+	struct nbpf_channel *chan = container_of(c, struct nbpf_channel,
+						 dma_chan);
 	struct nbpf_desc *desc, *tmp;
 	struct dmaengine_desc_callback cb;
 
@@ -1228,7 +1227,7 @@ static irqreturn_t nbpf_chan_irq(int irq, void *dev)
 	spin_unlock(&chan->lock);
 
 	if (bh)
-		tasklet_schedule(&chan->tasklet);
+		dmaengine_schedule_bh(&chan->dma_chan);
 
 	return ret;
 }
@@ -1272,7 +1271,7 @@ static int nbpf_chan_probe(struct nbpf_device *nbpf, int n)
 
 	snprintf(chan->name, sizeof(chan->name), "nbpf %d", n);
 
-	tasklet_setup(&chan->tasklet, nbpf_chan_tasklet);
+	dmaengine_init_bh(&chan->dma_chan, nbpf_chan_tasklet);
 	ret = devm_request_irq(dma_dev->dev, chan->irq,
 			nbpf_chan_irq, IRQF_SHARED,
 			chan->name, chan);
@@ -1477,7 +1476,7 @@ static void nbpf_remove(struct platform_device *pdev)
 
 		devm_free_irq(&pdev->dev, chan->irq, chan);
 
-		tasklet_kill(&chan->tasklet);
+		dmaengine_kill_bh(&chan->dma_chan);
 	}
 
 	of_dma_controller_free(pdev->dev.of_node);
-- 
2.43.0

