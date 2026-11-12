Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483601;
	b=TC6zjvMZ4y+vx4cnqyjkc/hsLWe3oZlLlNyxK4M4h4r2LhvuAUq8XWPg1xIDSSEIis57
	 QS2bnRvFy04WefNfJrC6uy2nH45fHs4RE8vChXMEDNHSa5pPYDPT/lcc6vACsvjRANRFf
	 HCQwQDKltkfc4QymDCs9BrD/ZTAsR02mvRCIcD7XbQQfLzy2OAPXK2FXJ4FT/XrkMrnqD
	 Gj93EMRJmFBGwaspIXlV8baiIf/Nw23pWAgknDzq6Gj3gPlK1QoopBltFhaKydNoAhSQ1
	 k/7XmxjOo/IvKrGBKy/FOJFZ2/sAIz5U+Y0PEzor6n6qL3/OEHFZ0hNTXhoySU38pXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=uAkMK2tRWJvVq1ApX47OvdLFJWtUKDboSiivt2OouPg=;
	b=3lnD8Hox8iC18//b5Gm2KZX8bq3ND9V1hObZStm6fnOaoVQ7U7gNlxmTtI2EDx8FD3EU
	 R8sCqJCroaC0SxPdU1q02r035ZRiD46VH/1HPgVXQoC7595UdwT3LiFDVn/9N6+aatLU5
	 ijXYhCO/EW0DUJ39jNFUntDP2rh+vAaDPc6OmnAy+X/xvpyZMnMgaw0kLoFWsgMVTK47J
	 MmHt4WmWOW70MA091bvLEL6nFsww+4PsaLWqIW8RbPgEi3pBX3WnWXwLl223D/JEt6YKq
	 qVMVvNUEFsIXWTmh6p+8HXDOLiTexBvLJr0VZLRs6FNhO7d+Keqe6e7+b1SO+TafEYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=U0CQwUHe;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B449D606A889
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B449D606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=U0CQwUHe
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so36323045e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794483599; x=1795088399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uAkMK2tRWJvVq1ApX47OvdLFJWtUKDboSiivt2OouPg=;
        b=U0CQwUHemHFbBxqW9VsnxFohmwNfgKvTSToszBtA+5XssJMQIKbmmXVfmZJGhf467f
         Lte51ln40ut1omGhjOEC4ISaGpXBpxcz8hyuYC5TdqP77Qtol9sTnUEk9tmNfMasInAX
         Z1Phyj3c1UoZPv1fVWYNaOwoIddrCmkEFWRz4WlMg2UODFWbM+5PYKJag4qiCeIHCkqt
         Lrova3BmheH0NJ5b8eiyrYYJn/NnHVnu2WODQoxA3V+UBZXFVRl2R0J6LMx363G3PFFU
         22agP2Q7L4y4QuDPWTTAyISHf2prGbbBH8MD/uL5v8Ft31DR35onVBJ7vwDaJq8nD3Mm
         NOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483599; x=1795088399;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uAkMK2tRWJvVq1ApX47OvdLFJWtUKDboSiivt2OouPg=;
        b=XfRzzQ8sOjTWupjkGaffnemQ3nh6tNGBAmwpz3oZUeRsaxhY3S+9dSeGCq6ZjfTXrf
         3i18d9/YR7jywq6nSf+zFrYWsplIMbDJoXGM9i2ms3WIqJA0/EiGJc7zxjAjThgzQiqh
         iPoHBfXP16YCpIo0Wo1PxsWGfRtAwzwhv4s4RzOGJC/MuAEkIlCQFONdCa0R9wM3M5JD
         FBDk6y2ddIpKjAraiwl/jIbiHwlUMMmnSzqeoJEVcI22nQeABeXNVxJC8SKik2LXKK4i
         ut7DdtMRVblLkAgAMBoQMdzmM7sB+dZJ7rML+S3++FYmIh1xZMoV5BRzWeuZANhx15sY
         Ag3g==
X-Forwarded-Encrypted: i=1; AL+hErEt/JHry2RE5Gf1kGYVCQjZ467OetEpH9UbWtd54LoMdMVo4Z0p+jl+T9urE3Exo7FhpJOLrnK7KzYYzy4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cEcKKRrwkqZaMXs2fdi8xqgPj3Mq8TMp8JUcvbIgsMAj5J0p8
	4BXKEbmqOhxkkQcg61NRJ/0NrH2bcBFyHC8CvTfRrm7WFNqBDUiFRFiauZD3HYqNzlQ=
X-Gm-Gg: AYBFou2hx02htXfCAzlERjXkt7Mcmx8QfHyu5o/0BJUU/CNk/d/DTG2FqrQUv5spos6
	/91WPF7/ibHEQJG82aUBcxNhDk9QwxxchXPurYfTjVpMiON+UDDzTFiVfeO9x7t71AbBQRtuhBY
	7oEd0nfAMcplVUAXXdkTdDCMVKfCRxxNxTV2h6x8yVw/P7/yp0QQ0n4T2R6c/OHfGk4m0ZMAyMI
	pr26OaBHZWPFSHXiwlgVlAjc31M+5s/5XS0KaaxCGg8dwMkerwGpGa9HcbU0uIPBX4UGSr8D62K
	LqHN9+4aU403S07vpzzH8bH+EFKAcSBG5RTBbgspOA9ZfOIHGh2pGRZzvYocdQLwGfHMZ9qLdv4
	TP0olHp3knKCvm0MH8e5QKgnbfw/lwTI3y1KLal33aVfFOnWpKVn97sYXHvTMMmAnhc5oMIkwpT
	PwmaplKqCrqHwObDCFdtxCIfHLJWMjc5HLZaglfhXf93yKjBSp4tm9vbQ3xF2J1nqQ5vdwc/Jbd
	sieHKQuE+VZh4kSVD/AwQHhgoQnKUKFjML1pHeS+zjN5eNq4KRXt8mDsQRucy3AmXrlG5qbP30L
	oVZCPeAf5jaVqJVxURLJvBBQnDr/cLj/Kt89frORnvMzBPz7qjH6L9d23R3sCnH9kgvzLY2u7GF
	UBpgsZ1IHa40DQ2R+
X-Received: by 2002:a05:600c:4f81:b0:4a2:180b:3153 with SMTP id 5b1f17b1804b1-4ba093605c2mr91136455e9.14.1794483599210;
        Thu, 12 Nov 2026 03:39:59 -0800 (PST)
Received: from localhost (p200300f65f19a904528996c8ea0fadad.dip0.t-ipconnect.de. [2003:f6:5f19:a904:5289:96c8:ea0f:adad])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba09509c74sm72110275e9.2.2026.11.12.03.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:39:58 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] remoteproc: elf_loader: Make rproc_elf_load_segments() more generic
Date: Thu, 12 Nov 2026 12:39:49 +0100
Message-ID: <cover.1794483181.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=rpD3ZlQEIotpmgm/8a/F0GE3kt8iCsrVMvUNk750HQI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq9aV0VygZNHI2SVH27/dYSxqTJjDlywp4XNFMf BZVY/583XSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavWldAAKCRCPgPtYfRL+ TtCQCAClGYs+wv2wyzDrk/79LjPZbrJxNoTbgGZjAjNL8eGW9gHs8Qtu+Ul38KB+Yvlx4MgtF/v 68QyYlSMuYHXaQbGbOS3caVOpqAhhyFW9mM8PzK7wng3qCpRW2IfG4zk8sJ/b7sHISO5LsW4Q2Y jq3i6lhqo2kiw+dw7eJbkLOANZ2WciwA1jE12N3J4FGVwH2cLPWqU99eaaiq2jvcq9iKdY8wF3G DVlNZUgZMzYirkj6IRVOAVLsmMDsQs6BRWvaWplf/mr1RgAw0UEx47fAFp0XNesIZ3AoiCpDO5F Ee1FjbOjYKH4bwaNPe5ccJau4Aiy8JQCTn6mUlgyP1PvkV3V
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

Changes since v3 (available at
https://lore.kernel.org/linux-remoteproc/cover.1793879714.git.u.kleine-koenig@baylibre.com):

 - Improve kdoc comment for new callback describing what it is supposed
   to do as requested by Mathieu.

I'm currently working on another remoteproc driver that cannot use
rproc_elf_load_segments() as is because the remoteproc's va isn't mapped
into the local CPU's memory address space in a useable way. With the new
callback the amount of code that must be repeated is reduced, similar to
how the imx_dsp driver's load routine is reduced.

Best regards
Uwe

Uwe Kleine-König (2):
  remoteproc: elf_loader: Create new callback for copying segments to
    remote cpu
  remoteproc: imx_dsp_rproc: Implement .memcpy_tova()

 drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
 drivers/remoteproc/remoteproc_elf_loader.c |  64 ++++++-----
 include/linux/remoteproc.h                 |   7 ++
 3 files changed, 74 insertions(+), 117 deletions(-)


base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
-- 
2.56.0.rc1

