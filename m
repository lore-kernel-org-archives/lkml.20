Received: from mail.nozomi.space (mail.nozomi.space [139.162.184.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CF821D3F5;
	Sat,  3 Oct 2026 19:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.184.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791055875; cv=none; b=qgnXKTAQCsXzVmb7YpsCjdqgBETVR6OomCVuSk96l9N0TJGvIOyeXnBSPyg7lGMZS8H71yFKvgUdk8ED3LBqnRut+LS0DZeS7tkmCQN9/5gFNnim6n3OHQwveii6UVczq/zkMwvPMMjSUOdpkz+mocbkXIUCGqpZ0HjXiCxBRaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791055875; c=relaxed/simple;
	bh=kgveik9/3mckawua1ug0HY+55b+NUZ1vrqReM0N4+Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tz9Ls0nHuFaXabv1YyrT3SRi/T/UUbo68gL7vRgSKZuzA8dHX1G7c8y3wJbF4l+7iDeEc/XxY1KicLuOkdAInRiw+BRDOujwm+6v3zPx9uklcwc3kPFZe+/GClI9AQX6FEM5BtzWeF3ToZlTLyul9BIV7gyZFFNCQ8havvc5C+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space; spf=pass smtp.mailfrom=nozomi.space; dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b=RnUPguuM; arc=none smtp.client-ip=139.162.184.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nozomi.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b="RnUPguuM"
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791055871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yNdfF33mWaDtKQmIYOFKyplY+dYLoXzNcNN0FYYoZ7A=;
	b=RnUPguuM8lX35TwHLzfLe3aHOiSd6HoDvXZ8EamkK8ISmBPlNWOlleG3KeJOrEOVdJcE8u
	kb1c7bSXSaoeVgByZLOwNZ7A16uW6dz6GUm+rEVi2d2fM/d7QL4UHJ+wHvmXzpg+/JQAQf
	O4Rlrh0u2lV3OiSl5wseVS5GO9ZwLznCUZ+B5u6Y+rEbRd1p1+YbriCzVL/AhTpGmwKDQZ
	Lcs3vGrAUp0vp1LTzMN7knFpt+hxrLS4HYTQ9xQQHyy2Vu4VsAR/MMiYvCh6+dSjQHcjxs
	XdbF3x0oIm6vg7+nzzT6q7tRgv1fQzLYcfCV8a/TqRpRjUTQcwqNvlIXU44fIw==
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fei Shao <fshao@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH 0/3] arm64: dts: mediatek: mt8188: SCP memory, thermal and touchpad fixes
Date: Sat,  3 Oct 2026 21:31:05 +0200
Message-ID: <20261003193108.789939-1-michal@nozomi.space>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These patches fix a memory reservation on the MT8188 based Chromebooks
(Geralt/Ciri), tune the CPU thermal zones of MT8188 and add the
touchpad of Ciri's detachable keyboard base.

The first is a fix for Ciri: a DRAM region that the trusted firmware
protects for the SCP was handed out to Linux and broke the GPU under
memory pressure.

The second makes the power allocator governor usable on the CPU thermal
zones, which prevents thermal shutdowns under sustained load.

The third adds the touchpad of the detachable keyboard base of Ciri.

The series is based on the v7.3-next/dts64 branch of the MediaTek tree.

Tested on Ciri (sku0).

Michał Kopeć (3):
  arm64: dts: mediatek: mt8188-geralt: Reserve SCP dual-core memory
    region
  arm64: dts: mediatek: mt8188: Add power allocator parameters to CPU
    zones
  arm64: dts: mediatek: mt8188-geralt: Add the detachable base touchpad

 .../boot/dts/mediatek/mt8188-geralt.dtsi      |  23 ++++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 110 +++++++++++++++++-
 arch/arm64/boot/dts/mediatek/mt8370.dtsi      |  14 +++
 3 files changed, 141 insertions(+), 6 deletions(-)


base-commit: bf89276b2db391cbb25d1a0e898280fe85b16fb5
-- 
2.55.0

