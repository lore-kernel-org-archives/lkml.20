Received: from mxout4.routing.net (mxout4.routing.net [134.0.28.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A17456E0B;
	Fri, 18 Sep 2026 14:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742345; cv=none; b=sqwfiWkfIGZ75WoKDRPXexYOqWDDlxPxkqOUzI3xMfm44B25UrtcQwj/2RROuveUrKRGhgvo+Fx9ymdrou32VJDhbPV6m1tLM+dyqT/unC1wWs4TKsCR5QK4Twp/fVBjFLAgLRMLBFIXIN1yx3hNcmVhgZYS1FL/LjPv/+SgPek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742345; c=relaxed/simple;
	bh=m4kVJ9UmZgjD+NAALoTU1lg7ibMwJpthKhblAr85CdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D0R5v1E76BDm1pZVM//UXr7b4AJLMOBnoK1aoJk6xCs+83giI3ughom059bhT54g6s7C8qzKj4BNUspU2ZHrGrP1WckYg0OcM1UezjuqA+jRgWEVDC3EUZWRJ+Ust38s5zed0lAhIOu0YDWvgToQwHzXk502Tzma2MCAihNov1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=MWxHikQk; arc=none smtp.client-ip=134.0.28.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="MWxHikQk"
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id 136151007AE;
	Fri, 18 Sep 2026 14:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1789742334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KZ+diBnRwvvx/QAv5fV0vhwZgR/V1YndVVm09y5mFBQ=;
	b=MWxHikQk7TWnftNJ4LNPpq9sCMIRdLC4KhoVBF3IUdNOlnrX+aJIaqS9OIqI5tkvylZH2R
	PyDu+fBVYs6vN6ezjTnJlBD3JfkeHPbeIHZIKFakfGfQGF4zAf1BEhvqXFTBHAMDJj4tVc
	7Cu1X8PezihDC1qFH3YQjWg+JpVaXf0=
Received: from frank-G5-5590 (fttx-pool-80.245.73.6.bambit.de [80.245.73.6])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id C2F021200CB;
	Fri, 18 Sep 2026 14:38:53 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] Add gpio labels for R4Pro
Date: Fri, 18 Sep 2026 16:38:41 +0200
Message-ID: <20260918143846.30458-1-linux@fw-web.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frank Wunderlich <frank-w@public-files.de>

This Series adds line-names for i2c-gpio adapter and pcie hogs
for easier debugging via /sys/kernel/debug/gpio.

Frank Wunderlich (2):
  arm64: dts: mediatek: mt7988a-bpi-r4pro: add names for i2c-to-gpio
    chip
  arm64: dts: mediatek: mt7988a-bpi-r4pro: label gpio-hogs

 .../mt7988a-bananapi-bpi-r4-pro-cn13.dtso      |  1 +
 .../mt7988a-bananapi-bpi-r4-pro-cn14.dtso      |  1 +
 .../mt7988a-bananapi-bpi-r4-pro-cn15.dtso      |  1 +
 .../mt7988a-bananapi-bpi-r4-pro-cn18.dtso      |  1 +
 .../mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi  | 18 ++++++++++++++++++
 5 files changed, 22 insertions(+)

-- 
2.53.0

