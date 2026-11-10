Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308089;
	b=oBestBtjiAgOxWw5CZ7ILt16fKMfDxgjEayOlUVik5FlXDGk8aHDF39LbQH0xvEAExyC
	 ahwvtbFg9VVcoDl7LnKNjIdhG9yKbzpalvjKTlA2Bj0UmUbd4Lwxm6oNm7fGKKpPFzd9D
	 WMU1inkTrHLLlOBtFoAa/Li4ndXCzp7cybic5GT8J56b/K0iOGQEyeSArbUk4EnGoM/QR
	 C8KdHlaPJ1Kjy/oOVHgVz48/pwDcghftBSsn5fYsRlGCYbcOnVsaGM8gk5LYs4rCoBHq0
	 mDAjOEUz8PsTZwhXV53TQZp7e1Fh7ARR/eQXo6FxzJNHUECftjfBH+Ux5QRD/XI51Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tepxdS3pjiqx/ESdTVnng/n4oyG1h1s3ol01nQq3JzE=;
	b=q5FBIGM0afL7d2oJsEE+E0RBrj3qUU8A8iJLbokbz9aq86A1I7gAkqs8s7PchizSI7z0
	 MmBpf1KK/Ob/VjJt06uZmsXl9cRwhPcx84AzpTAY2rp8ybM4Uy5tgZO0ArO7s8BMLQBVN
	 i2Uc/0f/P/35bNLOVBmy7Vs3p3mT6X7uO3UjfmEbaMlnCN6N4c92qRw8+p7B17n7Gc1ON
	 ILlSQWwtPJUhGymH8n//O4kIXDis9rSj6FKk4pAsv/F/hnrJeScH4FztCed3J2SrHMdN4
	 ja6GzEPrXFdvl9UaxIP8tKu5QRD2AaLCQ03N3KV1cgUlX8TLveo05IikWBAfUfMByBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uZityvrN;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C9A606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3C9A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uZityvrN
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a2af4c8d00so536055c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308088; x=1794912888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tepxdS3pjiqx/ESdTVnng/n4oyG1h1s3ol01nQq3JzE=;
        b=uZityvrN90qVe8O21VXCg0ewFNCIQ1qJWSu4qHqZ4YY5NPvud9xLlK+OKn3kryPYkx
         jQKuNgfP8qoaOksJYR0kS7grG3VMjx0jEXNL783V1G83Gr8vAlTA7UB/MWixiAByKHJW
         YH6zKfuApBxqw/A4Ze2TBZcCu6tqBJkdv1+UDsQDjhoKkuF7J6+MQL+pbpo24+gqFEKC
         e2E7YR9QxQf+BRaXcoSW5EIjhePbk/AH4kOcWd+DqB3MO92bTdZoPfI+ywfDsWpGYMUT
         KRMDeA+pG0K+vWZrs/zteuA4xCEzduYvOkkvn6ZBl+fXmhUcb5ERLtWS83HzGhDMrQFk
         VxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308088; x=1794912888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tepxdS3pjiqx/ESdTVnng/n4oyG1h1s3ol01nQq3JzE=;
        b=BlZmko76/pike/+L3VZfKIs6D88j94iS6QRYGKn65Zv5UC6V0w6bkZAeJ6itFSA/Vh
         ZHsz5bRRPvkh/BPP+mndf0ohaTLRiCEzijoVZ+ZZIeBusdVi1vBSOxcV+Jgay/SY4hFP
         I37CiUKy4hMTZEgk567LkpSRodZk1xvZ+nnURKdscQUbR7zNeuuyAlcLKiUYslE9aznW
         xj6GSnZBKsVwggfhHNYb39m8OZS5kcSB7TJls+281aP0Ghv4/EzdalaAi0agNzzvLmxn
         AaMICe/QSnDiTBqToyHN2R8Na27INF1ZY9y5hX44COZWkZ9HXIGgYJdd1+tzoVSYqVSY
         6Peg==
X-Forwarded-Encrypted: i=1; AL+hErHkAl0fBtmppSnnZW9TmZbkee7Edsoya/HFAJfDJ91TBY5418NuesXR/Gn7Axw55JGSAQCSYWSIPliXLlM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Cq3khwysXD0smBoAPGY+E/S/rm3yu6pWm7NZScOl2s4Kb8j0a
	GF3D+XVITrcPG/PNxiFHwrvqmOxw9zNJCs9r0zkm+anfXgRjoBwuUfdW
X-Gm-Gg: AYBFou30RV5hBUgQ/iuGh7f0A4MsjDH7ZSjET2eiNdnpl26FIPUvsj+/0ywHwjIqaxC
	gZ1qsvGkCheC8LEgkBhM2wmUYMOcveXZ5oIhgcgFFASuLSL1KpcIz6dv9/uhejLO0o/zMFFOvVU
	IQ5wKxkkPUfAHHaVJqpFMMZkUmRhIDgCRz2NCi4v5F1wAtl4YEqnkwikRjE1mlDb2IEaNaC9uo7
	xuLLZtbfvjvXmmBvl5uh7aPdl6fdx+FSOb373rk6Qn7WbCzuXw85YXsRLFleHMprCWyP7FmJ/LM
	oIm3Oh/Sj+zGmOOTYXQyWq0Tb8xWLW4qNdxDs/Kli8G8xAsCVb4iYcZkVnvgoUE0ceQ7FElueAJ
	oYMgmdwO0EgfZ3Pq443HZrYQumF+KEZqqOUgZbyxFOIJ8iCKRyCBXCwJqN0PxTfWQevGsfM4HV9
	ZHgy/CtGrDwuY6bu31fZINSYFdFQVHbWtTvvN3TtgcVmTVFsrMTxPSoBMaa/y2eaIGYP7dUo8ug
	DTlTlJF3oqRh2LgbcIY88KctiODjJYzRilWHA+coqeIDbhlfWeRhfyzzuDfVmv8b5jxf/h0FzGQ
	L4w1J44MN2nG2xOQ9Zp9/2sbN4SCvWZFPzWZd9f6bx8me2Db
X-Received: by 2002:a05:7022:f50a:b0:1b3:a9c6:b293 with SMTP id a92af1059eb24-1b3b6077440mr2856751c88.25.1794308087698;
        Tue, 10 Nov 2026 02:54:47 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm6996923c88.4.2026.11.10.02.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:54:47 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] remoteproc: imx_dsp_rproc: drain the vq work before freeing the mailbox
Date: Tue, 10 Nov 2026 19:54:36 +0900
Message-ID: <20261110105436.2487822-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The mailbox rx callback schedules priv->rproc_work (imx_dsp_rproc_vq_work),
whose handler takes rproc->lock and calls rproc_vq_interrupt(). The work is
never cancelled: imx_dsp_rproc_free_mbox() frees the mailbox channels (which
stops new rx callbacks) but does not drain a work the callback has already
queued.

free_irq()-like teardown of the mailbox does not wait for an already-queued
work item, so a rproc_work still pending when the rproc is torn down runs
after the rproc has been freed and dereferences freed memory (rproc->lock) --
a use-after-free.

Cancel the work in imx_dsp_rproc_free_mbox(), after the channels are freed so
it cannot be re-queued, before the rproc it dereferences is released.

Found by static analysis; not runtime-reproduced (needs an i.MX DSP with a
mailbox message racing teardown).

Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 96d619d..89c72d9 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -642,6 +642,13 @@ static void imx_dsp_rproc_free_mbox(struct imx_dsp_rproc *priv)
 	mbox_free_channel(priv->tx_ch);
 	mbox_free_channel(priv->rx_ch);
 	mbox_free_channel(priv->rxdb_ch);
+
+	/*
+	 * The mailbox rx callback schedules rproc_work; the channels are now
+	 * freed, so no new work can be queued. Drain any pending work before
+	 * the rproc (which the work dereferences) can be freed.
+	 */
+	cancel_work_sync(&priv->rproc_work);
 }

 /**
--
2.43.0
