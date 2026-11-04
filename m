Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804263;
	b=HOCDoLCopAU+R0f7p5uPckCzFr5l6r3XZezdYeh/Z7mbQXY7knGfSmsHpqe6/BKoLLQa
	 wAiskcY/ycWorqIHUxyKR0Hohd2jy6e6Xf+t9Hl4g+P8aOw1drYapcwRTYttBP5KVs9Pk
	 HMWCY2vjFbJfBMkdEq4DgVmHO4GZXUH9Zsyjbw+w/Cpffq7SRqlPB4DjeD+7svg4rr2oR
	 W21nnnDHiCiy0sNPz5q0U8oVxAZaO2pLDa9Dpa/0D3HOi59QIRm7ttsh+fwpeWZWnr7d4
	 OYXvvHH680VkRgJ0UWhiKSN96uBaBWfFUo5FylsYpMPWxE8Inqu/xLkqUivgbsG3rVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804263;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=NVAsAR5zG4xnELhxbpW9Ha7FNFWibj9egzi66nB2Mtw=;
	b=RxcXN7+KDJlHVA4rFXYitmKJBrbSm22gOI0CVt0NHo/W913kPskDlqIDG5mup8xZo4hp
	 JrYevvXH26EXtyk7df1Cjfn3eudzKC6K/hQ2ZuC/ieKX8wrN9YdVGDuQgGGCKb0yt06T2
	 5ollrnn5FHs9a0UKc3nTyIl9vlhZSWvxWG5dLYFdhccbYBnbRNGu2mKhA+DUxzjFdRMP7
	 MhMJSJTE+R4QWgAg3B+dC/ydQbGi8vc33evuaHGkRj+O9HvwYB2V4hvgH6XQz5x0z1ZA3
	 alhVa6H1sO2QmKjceNBbExbQqVcJA/AobFXEtpFwLkJwp85k9W/d8JOWkjQ0w0O2lVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=grische.xyz;
	spf=pass smtp.mailfrom=grische.xyz;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7122C606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7122C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grische.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grische.xyz
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490d59c3edaso142973f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:57:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804262; x=1794409062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NVAsAR5zG4xnELhxbpW9Ha7FNFWibj9egzi66nB2Mtw=;
        b=TLehcE9uCZOQL76QaznmkywyRohz7KkT3jrgRONRN032t5f8AciF3AYLULaCaXWKl2
         ssf5uZJoaNm4+OwHuqybCtT7COFHbN4RxUHpoYb3F5jOQRCGhagyB2A1yZJFS2nRptyv
         OJ6NY0sU8L/zD6AQ8wyohVYPFvIcXU6CBYK/OrkYjNk3Pz6G+Ps8rvt7Q3bNKFT1RUOW
         2RH2cjBPUGOjPQKdVoJlFE2HTH48NM3o2a6p+vBzq9Fz0DH/vMsXYHwnBuhWJViag4MT
         majgttPnyBsVE9R3K+kMt/vzaujaVqpjy/6NqammTP0UG9xlh+VV41vEJi0LMAddIIAN
         JKEg==
X-Forwarded-Encrypted: i=1; AKwUvBxuZSBuJrucG5EcvBL3UlfiSqDjvjrz/S3/Enll6TOHB/c+U54mfSzg5pNwzA0VNU8Qj4ntQGJ5DXjDPUc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YJwnWLIiAJMVWVivGy+TuWfsQYs/nyBVo+0JdqEG0c+goZFzM
	6TdStA1Tp53H1lsTmFItWqMTUz3zyfScmgYbQaS7EyDY3xOeE+W/4oi/p7aAA8MjzVM=
X-Gm-Gg: AYBFou0lHLnUa2vntWpSn2yBEny10kJQ+EiKXJ303ZMdjb1sqYvrY6sHGeP/qf4eHE6
	iK2uQu0M5kQqJdZBEDFTbEM88WBsHQHfxCsX3NYkfsN/4Q5laufkqHKErbADjIlc76+KsXRoBms
	Pim6oruCkZCz+Jz7dwtVZAQoN5FMuQ5EhxSfK51AoPqI06NzrMlyXj/SMhD5wiyym9/xjMlmLSO
	URBiZ9CE91HGRJNngPFFSP4HEXmL1cxKznTe+h/iIjV5fo0NdEv8ah+E+2nUxs5taXwGSsrKDOC
	H8ZVbxBUeSPsAxWzLGBnmSm/nNAD5EVwrRZ1ma2U+6TkViPBxDnSlGjQ9J74WWZT4B6k5Zz5c+1
	gJvokdY8TbygBdDiPFWLjr/Hc6HJOBFf1fMITYPr+mG4A//R4ubCtblv4Z7R9WGDz4a3V+fTFq0
	24kWlgwSfWrhaiCxmdvzjb/Hh4xPzslpx+2pHPvFmdw5EBhdjTuEfXRuHA77myb53imsr7ZfI5n
	6E/c1nfKaqkOy1srxk6ToQxy2Tw7+VqoMhShY4AhOlR1/HXpvy09O9xIuljGa3ccNdsfiLAyhqG
	0NXLvC24M20eT6K7QfjjryVOAA==
X-Received: by 2002:a05:6000:4010:b0:48e:55bd:9cdf with SMTP id ffacd0b85a97d-48e6e2dd3a4mr40175116f8f.21.1793804261780;
        Wed, 04 Nov 2026 06:57:41 -0800 (PST)
Received: from lake ([2a02:810d:d09:1b65:4366:70cb:bf82:f8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecf8ef85sm4830051f8f.27.2026.11.04.06.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:57:41 -0800 (PST)
From: Christian Schmidbauer <opensource@grische.xyz>
To: Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Schmidbauer <opensource@grische.xyz>
Subject: [PATCH 0/2] thermal/drivers/qcom/tsens: Drop __init from the ->init callbacks
Date: Wed,  4 Nov 2026 15:57:38 +0100
Message-ID: <20261104145740.2623473-1-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
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

Every function that tsens_probe() calls through priv->ops->init() is
marked __init, so a probe after free_initmem() jumps into freed memory.
On IPQ8064 with CONFIG_IPQ_LCC_806X disabled, fw_devlink defers the
probe of gcc and its tsens child until the deferred probe timeout,
which expires after init memory is freed.  On an Aruba AP-325 the probe
then crashes in init_common().  With CONFIG_QCOM_TSENS=m the driver has
the same problem once the module's init function has returned.

Patch 1 drops __init from init_common() in a one-line change that
applies to every stable tree.  Patch 2 drops it from the eight per-SoC
callbacks.

Patch 1 was tested on an Aruba AP-325 on a v7.2-rc7 based tree.

Not tested:
- Patch 2 on hardware.  None of msm8226, msm8909, msm8939, msm8952,
  msm8956, mdm9607, ipq5018, ipq5332 or ipq5424 was available, so patch
  2 is only compile-tested.
- CONFIG_QCOM_TSENS=m on hardware.

Christian Schmidbauer (2):
  thermal/drivers/qcom/tsens: Drop __init from init_common()
  thermal/drivers/qcom/tsens: Drop __init from the per-SoC ->init
    callbacks

 drivers/thermal/qcom/tsens-v0_1.c | 9 +++++----
 drivers/thermal/qcom/tsens-v1.c   | 7 ++++---
 drivers/thermal/qcom/tsens-v2.c   | 2 +-
 drivers/thermal/qcom/tsens.c      | 2 +-
 4 files changed, 11 insertions(+), 9 deletions(-)


base-commit: 2dc1f296b5754dd2441fc8b6613a362a47f6b98f
-- 
2.54.0

