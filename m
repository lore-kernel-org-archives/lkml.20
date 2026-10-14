Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47E84CC632
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988354; cv=none; b=svUfGcWPNNcntuF2EJcGl2+W1eczQNe1Nb+3q8H9/9ajT/T4X6CBLyIv3PJq0F+rYbK439DNZwoEYsMMmYKTBCJEtGGzj8NRvlNFYy8cqogVVYucskiolRHt3fvrCs6TJXEjsUj1Bg1hU9mmeVELxxoDIdonstb1YycrFYDGlCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988354; c=relaxed/simple;
	bh=CkNFkih/PHsQwbdBVQI6aDqUXadsyoT0wO68CIPND7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PWP6+uKkSe+2MF2L3K3W5AxALEh4Tyrrh/VObhgnhw0dc6K/J6MfaObqqWZ2RIF+9Nj7YuV1Jc/rHMos0gKbTeUcN6dqzNBi0gC8P4Dm50mNX6txAKqA5yVdL28j18B6AKPfhlP/SBEN3hako5HAwcPPb/qTzBLYsgn9aTOJM0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cIXxfPp+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIXxfPp+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso9690985e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791988351; x=1792593151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Vp4nT657Y1gmkh1GAO3l2MeIxGaDsbtKCzwsk3mzmE=;
        b=cIXxfPp+frOgZ6pDRisB28qTaQTTSuPpxmVO/+W6ZSdGfmbcG4pJzx8nnPCJuVNfsi
         tSiWfcv5tYBbR2TkHuB81E2qnz77ktP6FV5OfNW0YO3GBTmQh6QtXMvNfLYEajv2gZid
         MKLlCYYt6imYjIVINqmgBW/tFGA02Yp4hNSBbg3yPEnwbedzYCOvBndXSTa0Sd/s6ANN
         VX42cY/MUn+gmrRQjOnetSQWD9JkhZF9amiJTvz7ekRl1ys41xru+ynTTnMHRnSVJAzG
         kniRtNlo/38Tik+I8BOGXHy2Kt2yMnqVnp4v4Bcthyuwz08ejIAODlXE0jPr1tT0qWH8
         nxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988351; x=1792593151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Vp4nT657Y1gmkh1GAO3l2MeIxGaDsbtKCzwsk3mzmE=;
        b=z9tGmdHBKMYciyuety5K5fnUAXR94FBPsDFicNF5miR3XvGUmRJ3l6OQSsJjUmaKWH
         K0aORYOpnT8e+m95i2w+opE6x8wsHimpT4uyL4Z+NJb44OL8Kf5iJjtjE5eNsTnb1IKQ
         8V9NPKi71/cYpNngZ/NO/2dxy5Y4YJhu9acQ/2sQhSbVxKG/ux//bbUduRixPLTaBh9G
         y1hN/H5C191QUHhfmr5K/yk9A/rkenDv6eGruIGOyKh9IZ0Mjjt56/BCmwlyLXZxKzyG
         xQJJNNATh1oR6+jLJIG6c/PNRrJ/m8AMRrJuDMNOb5hIHuivqRbBAa//HMLzCj+wmPpx
         8Wjw==
X-Forwarded-Encrypted: i=1; AKwUvByRE20TibRAHSBU0nmmNuOHvsKwTieFdzTa4xDb0akbczZ4mA70aV306mFUZSOjTUj8vkErBlCweiMw2C0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5lH7r1vsliYK6mO3YLyTQSkq27hkoqnZg+PB5UWPOvQC2J0IF
	8cARc4fiXzYGTEo/PCetH69L+Rq/p0AOdgo/Rh6fU/xtnlbL1YxDQrKm
X-Gm-Gg: AYBFou26mcBVHU+zmn6hBlOs/bzKYqyFBoKoCMRqJEE03axc8Gbcvac8IjtJ9L1VhF9
	SIFQOCYAo8uOQbHKT20O8vcCuxr5RkxkpBS1PTqBavDGrU/ZtK/FHMjtb/EakzBwtwHBT5Mjzvl
	6kKk7Q+3+Q+ltWui580g7qzd83A94d9PoZDF2c1WBPcGmzcWq3GPjreIzGPTVPu5N/nmolw2uP/
	aZo9/i40Rfihl4q+0D/2p4MIsP2swfhK4ryRsgx8rNI69Z6gQ2F8fISq1AS1qJ6Xui9Hjgr+ofC
	5ggxIdfos8Q9pR3APT+Nvn5im/2ksxZhr3V13KNti9c/oION40VYjklntm3h4NCyc/aJhDibNZ1
	KRGR//Z4MScaZ1znBoqT9XOWaNAfsi+xdE0j+C0k/mJmbxdCs7WHTuyZ3OPmFGBKdB8B2AfOQHN
	+/G11UBKi+zyBSrYhpvX/8bDwQJFZGk/WbpxCXizat1EEFFXmShndsg/m7aZmU7m9XF5+cFvgUD
	lxp9M1e+4z5dhl3nq5wwWuPTtsgiDrqkHjJpKN3EnR6tEnGH7niO14sCk+4elbT+9qe/pbawSqB
	YmwNl3vUnGtkL0I936igmmWn6k3CGnWSl0bM1KN/xH9+eFYIjtczpLlMiP3xtXJ6
X-Received: by 2002:a05:600c:8105:b0:4a1:83f0:7c8a with SMTP id 5b1f17b1804b1-4a18e4433d6mr318840825e9.1.1791988350580;
        Wed, 14 Oct 2026 07:32:30 -0700 (PDT)
Received: from zitrone ([2a02:810d:a1:6000:62d3:e68c:3175:a538])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd068126sm3411345e9.11.2026.10.14.07.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:32:28 -0700 (PDT)
From: Andreas Wendleder <gonsolo@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	b43-dev@lists.infradead.org,
	Michael Buesch <m@bues.ch>,
	Alessio Ferri <alessio.ferri@mythread.it>,
	kvalo@kernel.org,
	julian.calaby@gmail.com,
	jpeisach@ubuntu.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 0/2] wifi: b43: MAC filter and 64-bit DMA fixes for the BCM4360
Date: Wed, 14 Oct 2026 16:32:23 +0200
Message-ID: <20261014143225.82149-1-gonsolo@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fixes found while bringing up a BCM4360 (MacBookAir6,1). Neither
depends on the AC PHY.

 1. After an interface restart nothing was received until some other
    change touched the filter: b43_op_start() zeroes wl->filter_flags,
    but mac80211 computes the change against its own cached flags.
 2. The 64-bit DMA engines of the BCM4352/BCM4360 cores use bus addresses
    in the index and status registers. They are detected by probe, as
    brcmsmac does; engines that keep offsets are untouched.

The rest of the BCM4360 support will follow once these land.

Tested on a MacBookAir6,1 (BCM4360, core revision 42) with the whole
BCM4360 support applied.

Andreas Wendleder (2):
  wifi: b43: reprogram the MAC filter after an interface restart
  wifi: b43: handle 64-bit DMA engines whose index registers hold bus
    addresses

 drivers/net/wireless/broadcom/b43/b43.h  |  1 +
 drivers/net/wireless/broadcom/b43/dma.c  | 52 +++++++++++++++++++-----
 drivers/net/wireless/broadcom/b43/dma.h  |  3 ++
 drivers/net/wireless/broadcom/b43/main.c |  8 ++++++++
 4 files changed, 53 insertions(+), 11 deletions(-)

