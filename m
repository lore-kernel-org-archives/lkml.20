Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792520353;
	b=nnijOXDms8rwvYAEzylt7U2M90aJQrzRPVziSiyEp/ygr6QV1yv8kuho54E56udV1ybB
	 ivEp0Stuy1afF0ljkyTL2qQKFD5V11Au655XSP0Do8NPqwAMI+izDngOF6wp2hEGVAN7J
	 2ttDKtNaHETBwMy5uIzR2csdsrT3VlHRf+/TcikBs/NgIvThpnPdP4oXLW59ocdeAgnwM
	 aJd48w9kkgQ+C7uC6sKQUuWbZrIgQyApfX2NxMwlKTRiz0nWCLmYdY5pFe3G6R+1KhETi
	 3n7TFNqo2vjFggSz/+Br7zq3lZRFCLh1WQ9Hghps8aY4nq4mebUYPr74b7rmsDZNVvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=SnxMWKGlV+c2EqOY30MtZOJuq1yab/xpnTKd2bRgBnE=;
	b=5XtMK6+otWU39m5yVl/Zuogz338+SZjv/E/53jXwG1pCBKJQfTlxEEDte9oGLeogXnv7
	 6K0zg4UNx9hyw/aNtinl3UUfttotW5xtrvEuUr5KGJLiwOncpNxMXp8E9HHjI+gfl5Jrm
	 sbOti8K2BTmTXpdCTYloOpmxef7rfcbEkepJfKBxtbsPWCYs1D2ZYq43R6A+B/i32nU6q
	 S0JKEsroGDBFE0ihBXrUA6d8hdfrYc9yPohZ4YoE2e3FPJUIinV23Vn45tIZnvxrRmfPS
	 lJli8K/pwZLYyz4jff3x9FRa+sq0ycyZqDEbmUXpiOMWol5oxzPZOfaCdtU5Y7UgEww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=TYWkoXoE;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB7860A261A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AB7860A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=TYWkoXoE
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e0461e040so2771698f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792520352; x=1793125152; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SnxMWKGlV+c2EqOY30MtZOJuq1yab/xpnTKd2bRgBnE=;
        b=TYWkoXoEv4A9WDShja/wOVh1IGxLzsUeIsuY7M7WKoW4O6z3QMc1weIsMO/YFd+IYv
         wDBGTMVUvIP/bYy4ejP5froS9zaVf2pYSnNh9LYRlre/e5TIp3EBHkQaOrQbhU0E0as3
         xL2uUMs4+A9O6dZCkNGrOklLyp5n42XPx2IfdmqGAMjfFK+TYor6VO035uOWLhkQlgdl
         tqVVBssCCmeU/urVDgFB+BIJud00kF1f4ZH+CMnsSwsvtVqi2xGwfUZgI0FGbd6URe2D
         zXd1bixuQTDBo8CgyuGqWKvONTUVDQO0WM6OMCOAi4kfUw8HjjKFH5DmS86kEHbByudY
         eOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520352; x=1793125152;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SnxMWKGlV+c2EqOY30MtZOJuq1yab/xpnTKd2bRgBnE=;
        b=FcMf9OQ7oL6B471feNVg8YmAfRB+/Ej1WUslhVHEiXviqxPzPMetl2IMHkrmzoNUNh
         ecrHPldvdv3YR84kH6/mH6n5862oOLNFSOjujEDQCpQ5DiTjjAfdSKDNuCtRD8XgES/G
         SKVhQK6xCAx/AfzrFAFQR1dvTuzXANHpao8DXJywT5j6P7cfMuESVR6KPMqeZmYZXqiE
         FOWKzOgWypdP7iT8ew91qil0MS0AcMSWcEWSjfAAGxGEgs8xra9AoV8olqZhm6qnrCbJ
         ZpfLCAuY0CXqYf8QI3/klIe0gcpBcDHs0j/esFPpVvO04t5JOF7a/2Txa6pyTKKAOe62
         HjTA==
X-Gm-Message-State: AFq9FYIch490MUvMVHoyAsp7HVanvgS//xScStF2BYYwxXotr675vN2i
	5LGTSKyPgAS+5jpfgWXfp1tf6tmcF/piJ7Qg3rsYEhJvmsFb2yMgm94NCY2aDB3yABzloqdKLE1
	k3IBwhdR0gxlD7jsaW8MayuyQ3fG/vqY3sdo9b6lq/D0bX8w7F8EPN3JW4xR7iVmk2szJIyQKct
	ohhS+rMavtlGI26G1Na22d1YsU0g4WmSSbqmwl6vBisvZuvfNfm+nJaTE=
X-Received: from wrwl1.prod.google.com ([2002:a5d:6741:0:b0:48d:faa3:7b10])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4287:b0:48d:fdc0:65be with SMTP id ffacd0b85a97d-48e07f9fb52mr21138869f8f.38.1792520350473;
 Tue, 20 Oct 2026 11:19:10 -0700 (PDT)
Date: Tue, 20 Oct 2026 18:08:02 +0000
In-Reply-To: <20261020180804.140766-1-smostafa@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020180804.140766-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020180804.140766-2-smostafa@google.com>
Subject: [PATCH 1/2] dmaengine: qcom: bam_dma: Take a PM ref at remove()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, pramod.gurav@linaro.org, 
	andy.gross@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

bam_dma_remove() calls pm_runtime_dont_use_autosuspend() and
pm_runtime_force_suspend(), which on a BAM with its own clock disables
bam_clk, and only then writes BAM_IRQ_SRCS_MSK_EE and terminates the
channels, touching registers of a block whose clock has just been
removed, causing the board to reset.

Sashiko(Locally) also reports, it then calls clk_disable_unprepare()
on a clock that runtime suspend already disabled, which can trigger
"already disabled" warning in clk_core_disable().

Hold a runtime PM reference across the register accesses and the
channel teardown. Once the hardware is quiet, disable runtime PM with
the device still active and drop the clock exactly once, balancing the
clk_prepare_enable() in probe.

Fixes: 7d2545599f5b ("dmaengine: qcom-bam-dma: Add pm_runtime support")
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/dma/qcom/bam_dma.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index f67a93a37d48..bd583f78e0c1 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1403,12 +1403,10 @@ static void bam_dma_remove(struct platform_device *pdev)
 	struct bam_device *bdev = platform_get_drvdata(pdev);
 	u32 i;
 
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	pm_runtime_force_suspend(&pdev->dev);
-
 	of_dma_controller_free(pdev->dev.of_node);
 	dma_async_device_unregister(&bdev->common);
 
+	pm_runtime_get_sync(&pdev->dev);
 	/* mask all interrupts for this execution environment */
 	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
@@ -1428,6 +1426,9 @@ static void bam_dma_remove(struct platform_device *pdev)
 
 	tasklet_kill(&bdev->task);
 
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 	clk_disable_unprepare(bdev->bamclk);
 }
 
-- 
2.56.0.212.g129ede20d9-goog

