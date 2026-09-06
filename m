Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8133E024D
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 11:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788694877; cv=none; b=ocKYSgUzJ85w/A+dJZQ+oCu/MNuFNVJRKyA+fIrAtKl13BkHwPXTE0su+7nfPkd/Wbt7eWLBXmSlhAxSBJBuNC1HxwgBIYHuTcy0tXsb/1y8ZHp7tK9nKXBCicFv4GZuTqVAQQj/am8oXmUfT4Ym8oVmgEtGSmnktNs878E7b+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788694877; c=relaxed/simple;
	bh=L7WuRDtKownGDfemfPtuBDAiWjwoIi+XSLXQ2oaKJoA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QIwaI6qYlCHON3aml/WFQ1Rp5TLxwjp+pPfwjvE2CLqmm+cs1aNtY+dXGkzy2g/YZmvvsLXlz5hps32+cyrhjeSp2OrbooFabenZ9Dc640BFB/wEegEcIcGlqIqm2ODQ0fACHe5MCBoZeu7mwVmkYSaHFnl7r4036RQI0FdG5Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+maQ081; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+maQ081"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48431648f33so2596924f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 04:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788694870; x=1789299670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ARf7a0QuDmnTVS4e664PeRczUd5kEyLkns5J9FozqNA=;
        b=h+maQ081zONsj7qZ6XiHcb7KdCz/Qgk4ncAZamxVeHudJLjN0RxTiT28NoI6SVFYIn
         ZOLqAKRwNIAFrJ6Np+JyjlHi0BU/onEE9KDcoIoqakEYcMkXHHDXCJhsgZWvSQES3uTY
         32Ny6wEPua+SxBmpdUANzHgU35/qbjlZTorqkgnGow8fTkpBUaH57TH1yYQJCkQfYFPU
         J+1wR8nHItqcxzZfDJauPAXKq9ToWl8HZBTV8+MnnBFuL7SekNo++Wey5sYxSKq5GgiF
         0V5o4kkk0mDNbrctN+nCKlcKYwi95G9OY4TNzHl/BY1nJdEsml+hIgSMfGq/G61/5eRn
         /uCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788694870; x=1789299670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ARf7a0QuDmnTVS4e664PeRczUd5kEyLkns5J9FozqNA=;
        b=entdb7S6a27deXKKw/XKXB08M2Bd56HMlpmfzd7kx7ERRV03t0kIWBLPMhjm320OmH
         nkNbviGHakuBEe1LUG0odEzhZBPlyFDB6MXeqx5msDDJHrl7nOzlMtrU9Rz2Y/7cATLZ
         iX7Qyk3kfMYf8WoCvtCobrTzTZYLJZCzMvZyrDPTVHl0lc0PKmS1+tkX/G2AnpO52GvY
         ajLR2GyVTV4SQbjiOBaidJVVwVjPmE3C49Ho6KLrtXNF6TYBNeOo4J9drnR8Z8NAu1lh
         CYefvyi20FlWjsBzrF1FYZqu8w05InOcxeO4MKrHbYs9pJR9yadycaK0DlMYWk+58RTr
         LmMQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1FSC8P1SjzLFSKghnQ64Ynvyzo/fyF2eWhtd/v366KpOvUkHrCfcgahQG2TD52ieI6oYZd1E5oEo65wE=@vger.kernel.org
X-Gm-Message-State: AFuF++nVOQjI+DVsH+5MTROhPhDzRsRDDR8WkZLR/jSF0x3XycYrDpgg
	NGBoVtqrpVPh7OyoMrYt2O48UMXW0++JuxVS/1/+qJjoOrX6yDiCJOu8
X-Gm-Gg: AYBFou3bJq7v6zeEgzh2WCHV+BGMZ7cBBuLqdK6MZ0SlM07iOHnoUEF3i4/xhxFP6vH
	SFWA61CcIYJwV+L7QjJWyM0Hf0nvmaD8roT2+PvWJ2hHQ3sr3KFjY6RQssLD8awMzkGonk1Gwt0
	w4p6ROnAb5XfszypgzHjlYWXecOJ1qHZbZ11fLw7Co3qnlLdaar168Xp7eGQKEd9EueXi0QnlW3
	3PA4hhQ1naxcFli++MT5HYy552bJZjAIvGRSdzXxqqTfrvKPGEjM5gyskgGLgfCLXpzq45NhdUi
	nIqb4RRxk1N6+jpdSZj6TKfaBvFrNkcCrLgZCAb4Jpr+EnjD2Z4DFkVPHICntbOYnVf0iTfl13i
	WkQ7WwPpMVA8eiwuGkZwn0/xdKSy3wT8tmUXwJSw0I6gMGMCIXYCcBor6GELus2Bi++10PNDcNY
	uGR8g5268h8r71y0PIV9/yw7mJrnvTDfR4Mk9TwY8BmU5yqwGmfp4GY3dS53AZk32a1NX4jgOo+
	LkXFW96
X-Received: by 2002:a05:600c:322a:b0:49c:f13d:ffef with SMTP id 5b1f17b1804b1-49d0089db4fmr67572685e9.19.1788694869655;
        Sun, 06 Sep 2026 04:41:09 -0700 (PDT)
Received: from fedora ([154.182.82.204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ab73c2bsm19356223f8f.22.2026.09.06.04.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 04:41:09 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v4 0/2] staging: iio: adc: ad7816: Fix SPI read operations and VMAP_STACK issue
Date: Sun,  6 Sep 2026 14:40:47 +0300
Message-ID: <20260906114049.32912-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v4:
- Separated changes into two logical patches.
- Patch 1: Used guard(mutex) and devm_mutex_init() instead of manual lock/unlock and mutex_init().
- Patch 2: Used __aligned(IIO_DMA_MINALIGN) instead of ____cacheline_aligned.
- Patch 2: Fixed the sizeof() argument in spi_read().

Abdelnasser Hussein (2):
  staging: iio: adc: ad7816: Serialize SPI read operations
  staging: iio: adc: ad7816: Use DMA-safe buffer for SPI read

 drivers/staging/iio/adc/ad7816.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)


base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
-- 
2.54.0

