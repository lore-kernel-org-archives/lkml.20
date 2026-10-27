Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118340;
	b=DM3no1HhGwvF2tCMxWaYlY3XwFOZYXvBvzvBxk1Z/JqV5KrZH7hahyr0ojj5cfjMZsa/
	 6zfDTLjK2zkcPn00CQ5GwHph7UJRmFYHIkLb1btPrJcaTSojV2yR1rNfKugSwM7xnrxLb
	 l5aW1L1yke6ceHczSXj4KgUluxOv57zT0xlwfEZ/+MHr+vQ0f1dtrnzMiMNW0/1V5ISpy
	 ttrd7tEmPh6nkxfT4bIaShO3gYXRjmJYN1kDu07lFU5Kawfyn+Efq5sqhkgwHl0NqDtd7
	 pcccD9471hDsDp5sHZCzOsz/KPZUeXUtcpby56sJ3pdBdmQxjXMIKFYaW6wP8AdKzMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=8OcV7m+TUCHXLjsYXeJ+5OT+7xEIy8F/NuFzFSLHyvo=;
	b=4tWGEpAGRRtzobTN9SVQGajVqbiM83h4SlUifrWR2Tfih2lFk4tjUwPG9tHaEws5lTrS
	 soUMYmWsiBzMvUjamAzjrm8YfVCkkBIwS1RunHup/cm5X5sGNPuQjo/ytr0+LbIEhh60J
	 Th83CmBBPryaoA0n2SK2mirM0D43wtzThdHZ9tGMFXVePPR08QzyEjocTbvKsKupCpkqc
	 W5MNhoR05pWJQc9nAl8iQe11rYwTezmDu6NwIVGdvx43Nz5mq7mrhXs+OXiMoQNTSA0Ue
	 LruidTVEILYEN8Pqe35kYlDlow6BRK2J8E2fMaPePS3Fc+ZBqj4n5+wbpFs0RvC5NvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mmi+g5Fp;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20348606A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20348606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mmi+g5Fp
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so889901f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793118337; x=1793723137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OcV7m+TUCHXLjsYXeJ+5OT+7xEIy8F/NuFzFSLHyvo=;
        b=mmi+g5FpKUt5scQkPASOjQkt1VaKEMCT7DzNzNX40JfViJW7G2JZFf5BUPMb8cm/K0
         tGP9pKN36s5mLOAv8GbXXzlLQPEp+tF17BVdjg/iy1YdlMk3O2lFq9kSyF+EGoTvk7Cz
         3O1eiO/iGDwbc7FMp7PDZQaoIfV6CPkz85d96h/djp0eBAhNzkWRIIv5W++ISj3YCFV8
         C3J/H1jMcwwdPiXr/0lK7+UmtGE/NmMD9xm2txeOGZbiPm5C+3fsHvPdJ3b2ZH4Kq83f
         pUjIoT0FEO6i+ZzfD2xfIW5y7i23oC9Gggy1/nXedHKVzELgsckW5bYCW+VMLDKJvSMZ
         6geg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118337; x=1793723137;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8OcV7m+TUCHXLjsYXeJ+5OT+7xEIy8F/NuFzFSLHyvo=;
        b=ISCmIn3WFBC9T1LBfldajpI7XjcniKqY7lvjzb73KvvWYbI2Xww3DVg/ssRifLX5ZR
         fosEkHHiGNFJ6j3eGt7LwPYIagTYYbXg31MQl683q7J27We3kxetmd2sjVAUFh8bEMXH
         2sTsp+UMV6ZvNldCo/ypq9yxJjI4cB+XSF4OM+1vpLhV0ckOeAvOBMdblm1U7ysBuT8m
         YqL74mUIESXMRYKwrjbU18ekM26mpbuao9y+KDvDm/7McGKDB2GT4ACyeAc8MNPef9K3
         ReGldkoj4tAxWOa4zgHBv2BfexI33+qM+KVrRaFLzc+5uDp1xDmzgWEpCPMruDXhiAAN
         uc6A==
X-Forwarded-Encrypted: i=1; AKwUvBxkfy8nd+ZF8qG7Tc3qyK0fPePGnyJl29O0aX0SlgNZpJRFx/aBszggGmoPrVpy1bHvy4UXaEwOKlPvrq4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRFHdU6iK+RxXnThm06mAqfwXPTjxg6WgJEWoTYSxs2Im+YTv5
	gN1hYymCxr50JVmvLCgXq5yG2xsb9U6OLbC8fRXH67sQz9TRUFAuz1JPNeiBXTteeA4=
X-Gm-Gg: AYBFou0QfGxvFLckJa2He7jEzsLGbtl4Z5dQ9GXXs8p8ucO4hYsSMs0eJYinMQFv+aw
	uyAPrUqOXHLd3bSYjig8WteEr4+YFyhnHUBrmaH+cZ4oE3cFvBODsb7N9PKEmsdIQGAQS6ufWGa
	Jt65f4hA42mJfmXfx2M/t3Ita9sxVqYFYv0FcXEi4+11+UFxRB/VBZNKVViONSDFgO1IIpIxFVR
	DtgdeYTdtNDsVuNhYOoEF65onplPVc9Ijr2YBK8nzj0TAhb7o5tPu7DijAQ2ahcQ4q1VL4r2L1v
	51ZeivJDMpH3wLLNxk2qKFfdHQGRt5K/8VDmCTNwiSMQFSDQbnS1TtHcFK7+70BcDd6m1Tv7Qrn
	Dxf+XgSQ2m3v5G099zUxbwIHOSNaphZD8BMOWfYHpPuEMWPdijkzQe3qyDmkhgrIRlFp2gRXd+l
	Z9i9DmfMXgxu4I7M9FN2PqfZjGSafM9xwvE5yllvewR+o82JBFSwgoWyGLQ6VoA8CVrIgVbPV9A
	RnRL8csNh4o+dPKSibrfl29T7FX8yEGK9wPybxvojiUgSSGaA9hZVuJSLUsTSNqFlEkY7NhBb6s
	pVN2kEBk9tUEDNMZeuZKSj8/1VYZGZX+gSIh/yrZ358=
X-Received: by 2002:a05:600c:530d:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4a7c100c816mr76768845e9.10.1793118337316;
        Tue, 27 Oct 2026 09:25:37 -0700 (PDT)
Received: from localhost (p200300f65f19a90461358920bbb0c5ad.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6135:8920:bbb0:c5ad])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a9301b6968sm115485e9.8.2026.10.27.09.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:25:36 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] remoteproc: elf_loader: Make rproc_elf_load_segments() more generic
Date: Tue, 27 Oct 2026 17:25:19 +0100
Message-ID: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=724; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=yA71phFGI7EdUzfKSsZthD23p/0J3Coj+je0F1nEXik=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4NBvSK8H2PN79QFIb53PEqUXlq2S6UgvHblFM 3fLU/YgcDKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauDQbwAKCRCPgPtYfRL+ TqKMCACZfihv0KZEC6jP+ubBQtpsGPs1Cf6qHCbCICL6ZJamGVN4AZzK7Qqj5eO8KnTW/f/teJC EAbMuo1qT1O8t8TbvCo33u6K9dWYBKEUN79V+IHZdXShryweitzNTku3wCE0jgiaCsPJ9noCEMl NxPZnk1/u53JitDtDs6J8ZkB8T+TrfQLZmx5M9w0dotwxiOfGKpnCI0ioe29b9eBeMFCCter2mZ zf8SkXj+ciGyNpIdhuJ5/joaOy0s/aHTVZjORONlyaCi4qUUuCr2lwThaWP9JWVQV1fs/Vmob6O 0hK5Q9FfzhkkaALPaBPjmNqM7T8cl4w23c2s6yIi0cpzg5zd
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

changes since (implicit) v1 (available at
https://lore.kernel.org/linux-remoteproc/cover.1793008847.git.u.kleine-koenig@baylibre.com):

 - Add Reviewed-by: tags for Peng Fan
 - Fix checkpatch warnings pointed out by Mathieu

Uwe Kleine-König (2):
  remoteproc: elf_loader: Create new callback for copying segments to
    remote cpu
  remoteproc: imx_dsp_rproc: Implement .memcpy_tova()

 drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
 drivers/remoteproc/remoteproc_elf_loader.c |  64 ++++++-----
 include/linux/remoteproc.h                 |   4 +
 3 files changed, 71 insertions(+), 117 deletions(-)


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.47.3

