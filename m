Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CEA45C6F9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248933; cv=none; b=C77EDFCFkcbfr5jbYEztphC8+W/BmBdVc0A3AhFLoDMyq0QUygcVSOTYbuW3WGKmtICMQRWn5RR3VWieFBJZvqVgCa8YiTaHHP7cB0Mspy/pg46xD+LIpnVE3s6OTZVF8qPFoMKwNJF40udpCrhl9ELlENTv0ErnGwKLLJOGaxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248933; c=relaxed/simple;
	bh=uiFHvkhXOb6IMewLT/2B7q8vIi57Er7K+/2dk+J48r0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UWEJqnC/I8mLqEzpeYCPumdHmCQZwb45w5aw82OdBM9hgoCaiasFLgUsuUMVKNZq/igy5wJSX9uGoFhEdx3E96o/Y4XatqWF2jmPbzimQBmMOIwSljrLZl/sMmqPllOvk3nw33EM/XBCo87Oq3elfyWml2fCPbEyC5AZUR12dmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLuvllAk; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLuvllAk"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396cccbba92so1439246a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790248931; x=1790853731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lySLNT3l55Z/38cmHGiYCffXCvb6f9Aj/HKyCCwn2OY=;
        b=QLuvllAkdrWdfc0EgaUkbR3zrLFE/5VkEeNxSnl/vVGKo9aj4roUc4DZSKd9aqX4e5
         Y3t1npmgzJdfzqeb3kg7ktNPHAGeALZuHOboswQdIAvv7RPVcwQPP0A6Fnwv6wgrUX/A
         5MGAPEKkds+OiXhBlZyFNxMS+FSSOz4nqRpG9/6QfcM+DiKmtaVTeWLG6Clu8ijx8z1c
         1NC05/a+m4zL7isVUfipn0b51tD7W8CWP73w63LFKqwQGRyqZdJ4tHQz2yhkYkLNQV4u
         /Rvl9J3WqR3PJEarzUhqxuec8z8/MZTyoWY2WQtKly8iYU80SocLdTTSNxjqyhs30wvr
         8iMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248931; x=1790853731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lySLNT3l55Z/38cmHGiYCffXCvb6f9Aj/HKyCCwn2OY=;
        b=Q/5OJa2BBTLgO7OqEkqTDBqHh3BOad0orNYA1NhZsLQ99iZ0ZhtHiZbdz9mcXuBcZH
         WUNZPWtqPY1Yr6Iwg0/Qb3p5dw4g1f4mojkNj1uQ5bdKsd18T8+FFnb96jnCEi436grj
         pkASDkUxMsjp94gZkjkaB/Bv/VWb+eBVvnqZ6vKBEWiOFvqAY/GIpclz7PSjZEdwvIS8
         hhTr6pw1Bbe2OpslWHhvlRq605wXLkaYdKFT9N4lo2YSCIavubTz3UAjNfpq7Pu9Npzy
         VqeL7Z6chprk3FFhdUqvt283WcBsiRAOLsf14/Ccz+mFvoZc+75+DPHHBVrTB2stJfee
         AUEg==
X-Forwarded-Encrypted: i=1; AKwUvBzQpP4GT4bhw8hYVXrTLMbwVJNzGkjYkfrm1laSRBSWtczybndZZk6kbKASIv6Hncum2Z/x1aEoD3x8UvU=@vger.kernel.org
X-Gm-Message-State: AFuF++mp7jAYRHO4v5Hemt9i0XsbEOF8toEqO5nmnbs4wxNdKhOGa0mA
	/HFLJ8z298wQFJawk8ZjyZrF8PwKTimaf9IE/YI4Q6JgAjSjjqczCDh0
X-Gm-Gg: AYBFou1MfdwuQd56Y8l90ZgTxQcSqT3gcx8rpchLbZPqbTGM+GVIf4P6+wb3sgg8RNd
	pOixvyCKleUUKR4ah6k89Y6hmmTNT3UuuEU8kOYXSEwzXzF8H3UEsIDuBbR4dzgomB59euDMB64
	gUSe0apGlEN4dzqfC0f2cAogaKiuZZ1pKbkPZ4LI3yFa4EP5UpWhEVBt3cmhvQBDNq3D91u1tbP
	6JVY6a2mReghyOon5ZYcMTpIxMzmuP0Eet3ii54Yy+65VLn03bSuGnS2HpkVfUVZ0FsncgUicAT
	KYJqPtpp2CMRLRfe1pAA+qEa2rHZbOJtaKv+RBvmtR7FrbocMsKtYFXQGF+IXesfxy9xlxanjgF
	TseYGkrb4VC48ekK+0aAlPUme8bqTAbS8dU1PUc4fxytAuuNiYbOmxedlK8sQCfQH+ZeGnQLW2Q
	699GULE5nLBcAa0TirCWn/u26GJroudHxdzD3ndIQ4DI8GoDAwq0yWPw==
X-Received: by 2002:a17:90b:2748:b0:3a0:7dea:6dd4 with SMTP id 98e67ed59e1d1-3a098570051mr1788571a91.7.1790248926599;
        Thu, 24 Sep 2026 04:22:06 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3b82aasm2569713a12.9.2026.09.24.04.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:22:06 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: gregkh@linuxfoundation.org,
	mathias.nyman@intel.com,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rosenp@gmail.com,
	kees@kernel.org,
	lgs201920130244@gmail.com,
	avorontsov@ru.mvista.com,
	linux-tegra@vger.kernel.org,
	jckuo@nvidia.com,
	eeodqql09@gmail.com,
	stern@rowland.harvard.edu,
	davidm@egauge.net
Subject: [PATCH 0/3] usb: host: balance resource lifetimes in host drivers
Date: Thu, 24 Sep 2026 19:21:53 +0800
Message-ID: <20260924112156.1564208-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several USB host drivers leave resources or references acquired in probe
unbalanced after the successful path.

Add the missing IRQ/MMIO, device-node, and buffer releases at the
corresponding lifetime endpoints, using existing probe cleanup as the
reference.

Guangshuo Li (3):
  usb: fhci: release IRQ and MMIO mappings on remove
  usb: xhci: tegra: release padctl node reference after probe
  usb: max3421: Free transfer buffers on remove

 drivers/usb/host/fhci-hcd.c    | 2 ++
 drivers/usb/host/max3421-hcd.c | 2 ++
 drivers/usb/host/xhci-tegra.c  | 1 +
 3 files changed, 5 insertions(+)


base-commit: f03c39de3a1307371a4032757cd1732e91087c7d
-- 
2.43.0

