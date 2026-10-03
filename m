Received: from mail.nozomi.space (mail.nozomi.space [139.162.184.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678E237E5EE;
	Sat,  3 Oct 2026 20:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.184.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791057702; cv=none; b=PBEjjfS5BLHsUB0ph2al71TDGMrHFLcA2KPYvJS+GTkUB2/PNXZiKBECMA2s5sPyu1Y9c2Pi4GHS3jW9f5U6/Qgt5xZZtJ833FNfCMRzBhAfmMNjXyeLyfMP62gW3NPmqHGF/d+/rE1Hr14PILvgUq7K/3U0wybeDTHS60iFeWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791057702; c=relaxed/simple;
	bh=qvkoWzGGwzkUot/a6F5laqjCfT7nbok1JARc00RGpm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I33uKdSIjC0JJhhxFHYlOBo0eLN6sm4zjCVRWdDkK+Fm2NccGcAzINt0PF8sJEVU7sbSNLRerbYmqxRdhJ5pY9a28NSQFa54ududfPFhN066ZYZP5slHq1PAWrRG+KakJ4/2jlu96T12Ftz6WmEV25rlUWdOaBE6Ni+LadimEAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space; spf=pass smtp.mailfrom=nozomi.space; dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b=bjDMfkaG; arc=none smtp.client-ip=139.162.184.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nozomi.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b="bjDMfkaG"
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791057694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tfREhYRXJ7Q92Tr9PPmVOt8zfNsE6sWWHy9z3k5zAOo=;
	b=bjDMfkaG/ZJjjETtW7E/RsdKMuH9oGtEYv7AZOLJC6xqUQmzldkgYwPQ9pUguIuw6cKI5w
	Fwmz0vRb22geNlaooD5FbCvhzXjrusd5ciHEPWZRNO5zSA5/WfGEd2b71axAzhnf/knczc
	Q2ffISz2qC4b+0DwdLUlmx2gR7VVxvJZBO/hBJ0TLWCOGAwJx5t1Nbg7ONvHfE5VxPVAkA
	hDMVqb9Az27FD/W+fHmNNx4SaqNVIS23iSm3jW5EW0+KMw5x+Soh2BiCwn0hPsqpMSm+9o
	f0AZYBensYlpw/Z5gApvC+r9ihIwPZUXR+aN2TDKKTx9xBzj/z40GRdylFed6Q==
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH 0/3] drm/panfrost: Enable the GPU timestamp counter on MT8188
Date: Sat,  3 Oct 2026 22:01:29 +0200
Message-ID: <20261003200132.866240-1-michal@nozomi.space>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On MT8188 the GPU timestamp counter reads zero until a register in the
MFG configuration block routes the SoC system timer to it, and the
setting is lost whenever the GPU power domain is turned off. As a
result, the SYSTEM_TIMESTAMP query and the timestamps written by jobs
are always zero, which breaks timestamp queries in userspace drivers.

This series adds an optional mediatek,mfgcfg phandle to the Mali
binding, uses it in panfrost to set the register on every power-up,
and adds it to the MT8188 GPU node. Without the phandle the driver
behaves as before.

MT8370 shares the GPU node and the MFG block with MT8188, so the
binding allows the phandle there too, but the driver only enables the
quirk on MT8188, where it was tested.

Patch 3 is meant for the MediaTek tree; patches 1 and 2 can go through
drm-misc.

Tested on the Lenovo Chromebook Duet Gen 9 (Ciri, MT8188): the 13 MHz
counter advances by 100 ms over a 100 ms sleep, also after resuming
from deep suspend.

Michał Kopeć (3):
  dt-bindings: gpu: mali-bifrost: Add the MT8188 MFGCFG phandle
  drm/panfrost: Enable the GPU timestamp counter on MT8188
  arm64: dts: mediatek: mt8188: Add the MFGCFG phandle to the GPU

 .../bindings/gpu/arm,mali-bifrost.yaml        | 17 ++++++++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      |  1 +
 drivers/gpu/drm/panfrost/panfrost_device.h    |  1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  1 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c       | 39 +++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.h       |  1 +
 6 files changed, 60 insertions(+)


base-commit: 70456f05d4b6396b22048c4b8cd3cb98ecf9f9e3
-- 
2.55.0

