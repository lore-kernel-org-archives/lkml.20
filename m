Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750596;
	b=nnwmeejNxbQhqIEiHBBuBdP783hmum+Hj6mjC+s1if1ublgxHk2kxt4Q0IOwrOtichOH
	 1ZyVINJlh3tNObskusJMZDbaCkP9a3wF1gO6A7obGUvnoumrynzOHtIYb1Hl1Emk/Zdw5
	 z79OYngkHm1SCzEhFt03OGH+pLjZ1hIgTZMboyzS7ZyyO8CYjuNLo4DNc4HPorAfQmTOj
	 epNNLcUF/gWMuN0jBoWu44drg/T7e4Zw5VTo0ws9Xfe4xV2BylhYfuk8dbKP7dOqOc5zw
	 lgwYK5nfGCuGd9tAVvvHPyE7YauEXvmyXBQY1rKeF5mf+ocEE8qyvyEjelFXANaCTKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=IMobJmbhH1aWl0A3qqegt8ms7R2Y7oe1+fBk/D40vUc=;
	b=1PmZgsqj0towUlwCE6jRkyYtLfP6ruDmYjXXvO2z7+X28ttaOJBaZOuwGTUFjPkv1CXZ
	 4HP9PyiX89e3neXdjeV42fdg8Of/LLSvRznwa6FAYwgPNDutgSYR+ltWW4Ny2a/8GzSwa
	 PHqqOar6YOepGjFx6Ox0C6cU05X8KZJ1wJdw9AuHTxc8klk3c1XKS2BSeaH11XaZykr9/
	 jPyMPHPyc2x7mrK1gFvAqc2TcUJoW/kKoT23tHF/SnyCCIcexj+uogybFosjK2Je5sMqr
	 bM31XU9axolVgbsNkx6aDq6bZN8x/CSRFYYIyH5QXiKQj7VZwShgw7UWyRSHsMa+Ndw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jh7CN3Bk;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADECD606A325
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADECD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jh7CN3Bk
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e0fc747a7so598182f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792750594; x=1793355394; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMobJmbhH1aWl0A3qqegt8ms7R2Y7oe1+fBk/D40vUc=;
        b=jh7CN3BkAAtOpkqLz1LO1Naz1RHvXEQYg8p34aWKEtKHt4q40/lpwzFaNhj/H3izKh
         Wa9pBhurUh4H0bunQnyYBAHwCvs9pCoFefQprPlWa7FE81jVGuEpcrRjaqbZTnXlOwvX
         qaEtYq1z0xHLITuExUkdcupfR/AnIPDb2M8lqwsIOIvJPQF5DjQ79IX15NnLP1PSgrxl
         5cEyBXiwrD+n8E6PNP8RSz1V03bB0jgfSZUqqmG8zS3xwrlDQzjumecOH/FXFZPZMcsw
         7nFh2OHKhwDEsEeM6jklL+EGCM6dN1Gug4l2wLXCUDqBSpYs+pU5gy6SkMczonsqUuf7
         hqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750594; x=1793355394;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMobJmbhH1aWl0A3qqegt8ms7R2Y7oe1+fBk/D40vUc=;
        b=XX3rjn6WN+DSOt8qErzVoMGdbiR4BJp3i2uxwT3bDoFiUPQuGSatHeky+UhGxf6nHT
         FaHmaVI0cmxh2tuycJIfK+pmrkS3djBBojjefw+T8kWHZaXMcHC0+V2k0ZFN1ziSZSGx
         42VlqlncMXxoMDLEs7k5+SYWK55JqhFGqqbPjkUlVhNDHmr5VSYwSdVe5mKNdsx89Lhk
         mBPItTqd1WKZsPA23v5pqLbLLdhzBRMT/GeMFm+9Tp1CnPM7HtI0/dEgLRVQw7gGZBiA
         +xdOcXhLUPsikRgEjOurTUu+lgtMAUFYvxt/GvttQQCiMMGA2hvvMrrwutTQ2CKw3G/d
         XB6Q==
X-Gm-Message-State: AFq9FYJquQrZBKDlAfENzTt1qnDfvs76tb+HiaTbmmvwtK8Eu/GCXtZ4
	OviCkJNTDGNa4F4sU9c/S3GAtehLYxo2DQbC/TLuDfIX7Qrlszx7k3wM4uL9jQGmzv2fjvIZxCG
	BUiWZwME6WAQOLRewtDIVWq5PHIwPDf63O1qHaudnrT8NQmunvTDlIka2FkabrKX6iYclWqxb7A
	gFj+EzNBu0gX+MjC8LNEo15WgjQT0k0Bo+QjTWTnDVwFhwJr0EohbJkog=
X-Received: from wmdd2.prod.google.com ([2002:a05:600c:a202:b0:4a2:a3d:fdbe])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b23:b0:4a1:fe26:24f0 with SMTP id 5b1f17b1804b1-4a211edd264mr29780255e9.20.1792750593923;
 Fri, 23 Oct 2026 03:16:33 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:15:34 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261023101536.3965344-1-smostafa@google.com>
Subject: [PATCH v2 0/2] dmaengine: qcom: bam_dma: Fixes for unbind
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

On Lenovo Mini-x Gen 10 (X1P42100 based) I am using VFIO-platform
to assign the QCE/BAM to VMs.

During unbind:
echo 1dc4000.dma-controller > /sys/bus/platform/drivers/bam-dma-engine/unbind
echo 1dfa000.crypto > /sys/bus/platform/drivers/qcrypto/unbind

I see a system reset quite often, looking more into this,
that seems to be related to runtime PM, with those fixes I don't
see that anymore.

This patches apply on linux-next.

Changes in v2:
v1: https://lore.kernel.org/all/20261020180804.140766-1-smostafa@google.com/
- Collect Frank Rb
- Drop call to pm_runtime_dont_use_autosuspend()

Mostafa Saleh (2):
  dmaengine: qcom: bam_dma: Take a PM ref at remove()
  dmaengine: qcom: bam_dma: Do not touch remote BAM in remove()

 drivers/dma/qcom/bam_dma.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.56.0.307.g5fe7bd680c-goog

