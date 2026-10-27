Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126617;
	b=gdz8jnMee+zAuVDEOaAUAAzvZinzP5mPHvg39DI3tkz9Cm8i3aiGG6PaHAxYb3iWFFC4
	 qqqFwg7MaDkU0Cd2/qJ2b6N6ixyaAYnuxl4/mE90HEebOM2N9pkBT7Kr9Yrb+AXoThPFl
	 uBpnW1LR3p96+dy/41Y0WoIA7pIqZAaUwy0ODlEaU+IVPwCKiqBhHfSoo8FL9ckkPS92p
	 /j7DLn881/AVMq4HgsRURXoigJfc1NnLbJf0Aa+rCdkuCkBoaSd9NYJ9R069DZlKlB3U5
	 jrbhNT6O3vcqFuU2al7n/uSNB8+USs4feqQk5mOJg0qrNI+GHqQkoNUp5FIPyAXvtXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=9axz0yVX2giw2uFg+BgambTLl5XOFya7eXMeUfHcrMc=;
	b=OUyZQDMKW+OW2UO04Xe3LjvbE16o3qZxhoGmcIc2XyM7DpMYnLcqeQeqYrqF4yiye05m
	 D/6psAGZKRTlHTXeuI+0iK7waYXpjR5ZtIGmSzJ37Hv1k8qvx3RWNagQ3c88Va6xvxvgS
	 nahtIISpr1xoglbo4DkDVKl3q2cOshMJQpNYICT5JUwtT9Gyq0fZVUjwD1VxZ7++li1Hf
	 xUOM0drLW3aXlbU/cLY7tePle+Oujv8Vj06ahFmu//fjnUMntTVilPbZ0oRY8I+CZHUdk
	 /5j99tusBh7VyQaO3Y8bO4QAW4Remi/GpanItwv70l2cWhT2NR+/amLEjUtnbd2HsMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEzEdYSR;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13CD606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B13CD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEzEdYSR
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-8446af403b5so109637a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793126616; x=1793731416; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9axz0yVX2giw2uFg+BgambTLl5XOFya7eXMeUfHcrMc=;
        b=nEzEdYSRqizAr6UfE1w1r7/oF4eXh3fRPB5gthej+S7YpcqWPtHfHENZUmJfaOJ4CY
         sa+cFlKqcS5FUvSFB8M0PsrjJ1FQCC2YVksNH1IPCSq8jH1lYx4YXiQJ4AJIEDcCmfON
         Fv/lGfOCe+HI3wqusDJ9Dc/NFXvYexgUYGy1whARxiB6Lh6t/ln+GO4ukWS59ZghUo6c
         fZZO5gnFL7XagqPJHgHbN7S6xZYjBZxV7rzRUcDkXOt1WwnvoiclcDvWz9xL8Ld01Nre
         YO8mNIIeLh9B+s0RzzZbG3PNLdZvLzkADrseTPhTas/rtJLZ/DzMXaFzqHyUwH+F1OSP
         X5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126616; x=1793731416;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9axz0yVX2giw2uFg+BgambTLl5XOFya7eXMeUfHcrMc=;
        b=fcmMZwe8xWGwpjtyAkUgrBZ0MTUI5eJQ0wcP32+rqsrjz43Qe6iLO1WZn/s7oYlUx2
         +qzG28JXK8oNGwGZzNzpo0FEMP9WkQZcD1OlBMAnEdwFifKbKbzYr20d909GcRztwPrh
         VWfVSBtUafutOq+ZFgkPm9LomaA+kzBXHI1vPZY4bc7K4XcFbBn3NvDc/HoU1rDyZwLe
         S6kZ9NJTT2PlHOR/fptzkRtwrI8Sz4ufIiWQiZ24h103ogtKT3gqZxEd/fR0iGn5BywG
         zg1Db96FiA7YC3M+fThplbDvuN6xmZqzqxBi19E5hH1KMnLANhDPOzmMi80xvf5wmOBi
         unaw==
X-Forwarded-Encrypted: i=1; AKwUvByblcG8+RWlp0eSAkT38w5yA0hkq26KZ+0T4HkeC3Y2go34dEKpY5ZWAGHn/XLPk/v9hD9gUD31vtsrQQo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeLBDwaKGQnUVKWknOSqCD0HxvDta9KgdbKRmmv85qX2B4NLOM
	yUcAfad2TddD4tfsofxqvUPA932+Xna+Fpf1gPTygkOiRXPM7d1HjVyD
X-Gm-Gg: AYBFou3F5uYOK6IMFbQPqujHL4rZFNJNbWnc/W3ibnPmPacrayEcMD5hGIFWKN/iGrj
	cjF54wxmRRmvIk4d45avH266/Ta4D2Jb39X713d/joWFUskRWlo803BdQLdcIndZce+1MuOvgkZ
	uZy7WI4PmF4aYchZWAgcq4XKsY7XLNu/AA+8kYqE6CkAoOtTxXhwvoRpBaKpmDUO2IeTcE04A+A
	8ZuGed33g9W3iLdQqqenJHC9jQLe2/cs1OSpUdPL0VohBy3eeDhvgbiH12wkekd0ySs7twyCpu+
	7zPvhqfOrtCQLPo5HvU9FsEpsy7rkK4fVfuitiKyvYR3ugxyZxYLXuxx1q7gWjV765hd/rQ+87U
	3J74GdcNDAuGV9rW6ZkVhsbKwdgWWYZVwZ9Nve+Z0NevnAEgeP1OSBjgvNSFE01XmEcstTvzsZA
	quy/HqZosL8j6jehJJQMcVBveVTrSaxuhCLmVFNloCQ0cwXcKnBYa5X6OzbF4noGGAMlMTQkviu
	lVltItXmkMzeWHENzGGFoapJPQSw+R7dkLD9wA7cfLSkctQPi6XY9uJYWabieEOb2Yl8wPQgDD/
	Zlqj1VLfbvScZ1aXwtr5j6BJjXCRVoBQqnGT7JlXuunstJZ4xIPkLxGu6he6LHS2AtiTR1elI0Q
	3whVQcFKIDNVAitZ38t/WEe0kaDMyTCZKx0TDg7dkGIQQvMsgsif8IS1ba1sE4hwpEKlpmMprfF
	CK5ZO6
X-Received: by 2002:a05:6830:2b2a:b0:829:9992:20e7 with SMTP id 46e09a7af769-85ab88cd029mr404051a34.30.1793126615647;
        Tue, 27 Oct 2026 11:43:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb074fb6sm12488338a34.12.2026.10.27.11.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:43:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 0/2] dmaengine: share virt-dma synchronization and use
 it for UART APDMA
Date: Tue, 27 Oct 2026 12:22:25 -0600
Message-Id: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOTRLCIAwF4Ks4rI0WWm3HlfdwXFAIbVSoA7Tjz
 /Tugm5c6vJlki/vyQJ6wsB2iyfzOFGgwaVQLhdM9dJ1CKRTZqIQW14IDmFsLUWw8Qyj9BG0lRD
 uTvV+cPRAmDjwTaOasijbTV2xBF09Grq9nxyOn5yUE6qY5bzRyoDQepmYPEomuo4crj93aaOnE
 Ad/f/eceJb+qpRbQWXqmjfKoKn4vrOSLis1WJYrTeKbFD+RIpFGSzQFCtR6+03O8/wC5PmkD1s
 BAAA=
X-Change-ID: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Zhou Wang <wangzhou1@hisilicon.com>, Longfang Liu <liulongfang@huawei.com>, 
 Andy Shevchenko <andy@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, 
 =?utf-8?q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.li@oss.nxp.com>
X-Mailer: b4 0.15.2

Provide a virt-dma synchronization helper with the DMAengine callback
signature and use it in drivers whose synchronization callbacks only
convert the channel and call vchan_synchronize().

Use the shared callback for MediaTek UART APDMA so clients can wait for
completion callbacks before reusing callback state or freeing DMA
buffers. The shared helper and existing-driver conversions form the
preparatory patch, followed by the UART APDMA fix.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Changes in v3:
- Split the shared helper and existing-driver conversions into a separate
  preparatory patch, leaving the UART APDMA callback assignment in the
  second patch, as requested by Frank Li [1].
- Replace 26 equivalent driver-local synchronization wrappers with the
  shared helper in the preparatory patch.
- Link to v2: https://patch.msgid.link/20261022-submit-mtk-uart-dma-synchronize-v1-v2-1-fdaef0e2edd6@gmail.com

Changes in v2:
- Add a documented vchan_dma_synchronize(struct dma_chan *) helper in
  virt-dma.h and use it directly as the UART APDMA device_synchronize
  callback, following Frank Li's review [0].
- Link to v1: https://patch.msgid.link/20261021-submit-mtk-uart-dma-synchronize-v1-v1-1-4f7718cfef41@gmail.com

[0] https://lore.kernel.org/r/atoz6M7RHU14_a3J@SMW015318/
[1] https://lore.kernel.org/r/auDOqLln9_ra__hY@lizhi-Precision-Tower-5810/

---
James Hilliard (2):
      dmaengine: virt-dma: share the DMAengine synchronization callback
      dmaengine: mediatek: uart: synchronize completion callbacks

 drivers/dma/amba-pl08x.c                       | 11 ++---------
 drivers/dma/amd/ptdma/ptdma-dmaengine.c        |  9 +--------
 drivers/dma/arm-dma350.c                       |  9 +--------
 drivers/dma/bcm2835-dma.c                      |  9 +--------
 drivers/dma/dma-axi-dmac.c                     |  9 +--------
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c |  9 +--------
 drivers/dma/fsl-edma-main.c                    |  9 +--------
 drivers/dma/fsl-qdma.c                         |  9 +--------
 drivers/dma/hisi_dma.c                         |  9 +--------
 drivers/dma/hsu/hsu.c                          |  9 +--------
 drivers/dma/idma64.c                           |  9 +--------
 drivers/dma/img-mdc-dma.c                      |  9 +--------
 drivers/dma/k3dma.c                            |  9 +--------
 drivers/dma/loongson/loongson1-apb-dma.c       |  7 +------
 drivers/dma/loongson/loongson2-apb-cmc-dma.c   |  9 +--------
 drivers/dma/loongson/loongson2-apb-dma.c       | 14 +-------------
 drivers/dma/mediatek/mtk-uart-apdma.c          |  1 +
 drivers/dma/milbeaut-hdmac.c                   |  7 +------
 drivers/dma/milbeaut-xdmac.c                   |  7 +------
 drivers/dma/stm32/stm32-dma.c                  |  9 +--------
 drivers/dma/stm32/stm32-dma3.c                 |  9 +--------
 drivers/dma/stm32/stm32-mdma.c                 |  9 +--------
 drivers/dma/tegra210-adma.c                    |  9 +--------
 drivers/dma/ti/edma.c                          | 11 ++---------
 drivers/dma/ti/omap-dma.c                      |  9 +--------
 drivers/dma/uniphier-mdmac.c                   |  7 +------
 drivers/dma/uniphier-xdmac.c                   |  7 +------
 drivers/dma/virt-dma.h                         | 15 +++++++++++++++
 28 files changed, 44 insertions(+), 205 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

