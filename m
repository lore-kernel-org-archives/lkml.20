Received: from mail-qk2-f4.google.com (mail-qk2-f4.google.com [74.125.230.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D4654781
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 00:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791679384; cv=none; b=fHBHBrpmD8KmshqwqB3An7cS5EATuVP2meQ86ZwRWPaxjzTsCCGLqdfEAzK5dUS/fKrIuDiI6tK3xB7Hj4UHe/oTNR47v1znYtH1I90heYqc3Z/vUn5G4tbvZsiyBQbTtqNjMBwujcjIuyr46TdpjmM25GNM7akQMprTXkiiIq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791679384; c=relaxed/simple;
	bh=poP5DGZOfVZCFMjp1E61DXCa8RuVeXFCjOY0K0Ntb3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YEtZ78+R3Sm8zf9T2OkkdkcPfAhdtYe8db6DM9fnp5WAEj5jGZze2fVVCLa/wl3UwXEBAep8r+jT4bubR/EIoYkoosYwLHceX+/sg9Itwx6cfHvwhNzF+kHE5eKJoSHDb6S0gNjpnXse3579Y/gaNKeWteF7aT/uKSvte9AdPGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEnB2im0; arc=none smtp.client-ip=74.125.230.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEnB2im0"
Received: by mail-qk2-f4.google.com with SMTP id af79cd13be357-93cc7e652d7so79923585a.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 17:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791679382; x=1792284182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X9wwtOfFZ3dlRyxA00OaR8axrYegTwtr34ydCtqSvyE=;
        b=IEnB2im0l5M1xfIzquqpurZkMZ5m97nHIihjIrvCi7B5LETxhhSGzhX0ZDvxU5NETU
         lbubcAUgqpfn0w9r6YKMebCeQSdVYCKR4yrqPeJGQNca0B3721jklWLS7M2i/iEwvgNG
         HvV0hOXLcG2K2tzEQdXkrFaN6Y9EqKwTTY0qW6LRV+Eo6wVOE1Nx/nbXoMmalBaRle+/
         NIj9f4e3OM6vvvH+DxeZ/CGDBGg+TyCvHxO8EMVMKmAJA/AzmepPBjp2VS74P4ngsh3e
         lCRp40wJV6Yfa5T+ZJAsIsAPzS3UyKYjgMD6oAkZT0TiGwVvP+RBEGM9X2sBNuDUt++N
         ufwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791679382; x=1792284182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X9wwtOfFZ3dlRyxA00OaR8axrYegTwtr34ydCtqSvyE=;
        b=TVu+Un+ZHJ+zc6C573MJhkeZCh02mcRg6gN+2Z2GurmAmjNmopZbV2UvQxFb1bw75k
         Mjb1JYoy2P4dqeVaFRtjgOqM/XGg38ONm+l8yzDVNS2Ro/UhiNAsUarF/eHck9dQwpLH
         YWBy1KxBUuVrHZo4TUtBLhs8UBqrM+KciUECq8vRodMUsuy81E4Vm2Sfr7mWnGmhaIKo
         ipmQvuI/9zYa1AZWUN+eeUhiaOonBW25jltXCFUx5DVrskknOCTR9nX2P6WmLZ11Oz3d
         J5koKSN4aR7u/XTAw/9NusLlIDUAakv3HwJzSohFjd1zQGtbk8mBFIVTtBq60W8OCZ2i
         4sEA==
X-Forwarded-Encrypted: i=1; AKwUvBymCBDw/99J1cm3B6fUZuYQofCMsY7ty5BXimR62di6/ReYzCnMGnHzX+UQipn7KN9M5DtDI6qEphcLFk8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHFNV56PAWyesgtoIC/2PNAxwT+NxVGxQbbXPiMShiF8GnrX3k
	qa4Y1v091l+RE+XKFyxRkZvVjQ539wR+avlNxZfrMqc3BEVusHZgK6XM
X-Gm-Gg: AYBFou2ZFCLyYsgdrtaW3f5QTwjgD/KRgp9JcOgnRvFO1hwHV1Kdw4angpg1az7Fx9a
	3If6IHJKabzWOI15BpuyY2R/KRQ9/8u6h1NA6JIJc0T/S9UTJjFj00nNX1gvpmcbl3Pbi4B6+cu
	u+qjPhT+FFRpNNcW2+nrEjp7DlaIdQwZPgI4/W8ChnAgmKIypC1DYhj+j4Byz9o3jA+T7mlOYDj
	5y+41BCDQySYs6a/aJo0y1e7cE0uS0PiHGK7wnJ5Z0mc38AHhZ1jLI+Tdo09+XfHC+ykFFllW5G
	7T8Z9ve0Jx6VOV8YXZYyhMfRNRUXot5f/4DDI4CUuuyn8cCbRtXbFdMtX/4d8WfXfl+PsxNR6cO
	mXgWoJQG/T/QjCUsEooFpE/D5E13YOn+Hi248YJwV1w5FEeGwqN9Y3vY9MDo8XMX8X4O9+7N3Tt
	NgtDu0/YAkRcnpZ/aIeU0AX2Y0DG4lKVxkepxSNhaox9UfD60pOSiFGWt+vm5x0uc5tm0=
X-Received: by 2002:a05:620a:3194:b0:93e:942f:b8a6 with SMTP id af79cd13be357-93ebd2973f0mr1024374385a.59.1791679382152;
        Sat, 10 Oct 2026 17:43:02 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9848702sm532320085a.12.2026.10.10.17.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:43:01 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jason-JH Lin <jason-jh.lin@mediatek.com>,
	CK Hu <ck.hu@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Nathan Lu <nathan.lu@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm/mediatek: mtk_crtc: Fix connector route handling
Date: Sat, 10 Oct 2026 20:42:45 -0400
Message-ID: <20261011004248.1117649-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three fixes for the connector routes of mtk_crtc (the output component
picked at enable time from the encoder in use), found while bringing up
the external display path of an MT8189 Chromebook, where one CRTC
drives either an HDMI bridge on DSI0 or USB-C DisplayPort on DVO1:

1. The route components are looked up in the private data of the mmsys
   at index drm_crtc_index(), not of the CRTC's own mmsys. It only works
   by coincidence today (the only route table is on MT8188's CRTC 0);
   on MT8189 it oopsed on the first HDMI hotplug.
2. Destroying a CRTC whose route slot was never filled dereferences
   NULL.
3. The route is only picked when connectors_changed is set, so a CRTC
   whose connector was attached or swapped while it was off is enabled
   with no output (NULL dereference) or with the old one.

All three were compile-tested with W=1 on next-20261008 and run on the
MT8189 board; the per-patch notes say what was and wasn't exercised.
The MT8189 display support itself isn't upstream yet; these patches
don't depend on it.

The changes were written with the help of an AI coding assistant
(hence the Assisted-by tags).

zoan37 (3):
  drm/mediatek: mtk_crtc: Look up connector routes in the CRTC's own
    mmsys
  drm/mediatek: mtk_crtc: Skip the empty connector route slot in destroy
  drm/mediatek: mtk_crtc: Pick the connector route on every CRTC enable

 drivers/gpu/drm/mediatek/mtk_crtc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)


base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
-- 
2.43.0

