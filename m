Received: from ironport.ite.com.tw (unknown [210.202.87.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F69947ECCE;
	Fri, 18 Sep 2026 10:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.202.87.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725799; cv=none; b=JFK/SId/2Xuh+STXkgg3ObfyqBqBgOrpwbLZURa6S0yn7ur8fL+8O3hUXtUUq4r/Ok46xnC3/qh/9uTyAW6poUV9d9R4flNPhscA6VMBF7UGuWI7Pk4oHBawsyev7NmHOwcSNyJ1gSnkVWp+R+9m6MZgNqoFDejfK+6lqIM3USo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725799; c=relaxed/simple;
	bh=wVX/E/WKP8d+K2pokBGNsc7HNgEOc8KxCYsn0Hi1Si8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X0g51dqB5ee3/fVuckIrm6QIq4ue4mnDivxDK1iv+yxKQWOmM4G+8bb3d284EmVdWYy1ZJZHJf1oGwRqvU4jkFh4IIfOuspEbN60bSgV1MILQRLzaZUnw6dxJHzhU36H8Quwdfcbyjn+H47w4ygmN/AQb1y6w5Jsqp6vUvOLHzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=o4fYDtgq; arc=none smtp.client-ip=210.202.87.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="o4fYDtgq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=j6P3eS9ZkDCv+tl1JCX93LlRmz4nBFRjsa7L4E8adFU=;
  b=o4fYDtgqqYiRwnXJy9p2IIAbk8yxL1Wrqc86rUhCOmdryQ6Hv3Fw81bV
   /irv1659QE7qmScTltCOpJWKYAnWWg3U0S9hG3MKBtYjmZG7Nig2k+hyU
   SLb/ck+3j+U3UdQyghRp7qyJRXT4wjsog2YSrxKd3oLfbA+iDZAQRYt5h
   v2S7olyPlCCQtwLEdy2WBXx48VQBo2h8VjZvuyQemvsm88UiX/ucAxxs+
   rJ8OCPwgL/JeeP3EX5yQsxCMpEFy37K2GAtS6yWM9/WuP+34+MrftDwC0
   q0jVGhp3/BsbY6q3s8n8ioyaUFb67TMCtsO0bZMg6Yitc/iKZU5t8cXPL
   g==;
X-CSE-ConnectionGUID: 2P9KLz3YRDGskrPcI/s7PQ==
X-CSE-MsgGUID: 5KZwht9kTg6jnDZICFXXGg==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 18 Sep 2026 18:03:06 +0800
Received: from jiraproxy.ite.com.tw (jira.internal.ite.com.tw [192.168.35.200])
	by mse.ite.com.tw with ESMTP id 68IA33qc091796;
	Fri, 18 Sep 2026 18:03:03 +0800 (+08)
	(envelope-from ite_pd@ite.com.tw)
Received: from [127.0.1.1] (ITE01791W10.internal.ite.com.tw [192.168.37.107])
	by jiraproxy.ite.com.tw (Postfix) with ESMTP id 40F962D58;
	Fri, 18 Sep 2026 18:03:03 +0800 (CST)
From: Amber Kao <ite_pd@ite.com.tw>
Subject: [PATCH v2 0/2] usb: typec: ucsi: Add ITE IT527x/IT885x and
 DisplayPort alt mode support
Date: Fri, 18 Sep 2026 18:03:42 +0800
Message-Id: <20260918-ucsi-itepd-it527x-v2-0-7b2d9437cc72@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6CMBBFf4XM2pJO5aUr/8OwaMsgYyKQtiCG8
 O8W3LuZ5OTee2YFT47JwzVZwdHMnoc+gjolYDvdP0hwExmUVIW8IIrJehYcaGzizVW5iNxUpS5
 Ql2gMxN3oqOXlcN7rH/vJPMmGXbQ3OvZhcJ/j6Yx7759/RiEFZraSGerW5OdbjFM7vNLwhnrbt
 i+E0iHUxQAAAA==
X-Change-ID: 20260911-ucsi-itepd-it527x-5b87a61a71bb
To: Amber Kao <amber.kao@ite.com.tw>, Jeson Yang <jeson.yang@ite.com.tw>,
        Yaode Fang <Yaode.Fang@ite.com.tw>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Amber Kao <ite_pd@ite.com.tw>
X-Mailer: b4 0.15.2
X-MAIL:mse.ite.com.tw 68IA33qc091796

This series extends the itepd UCSI driver with support for more ITE
Type-C PD controllers, and adds DisplayPort alternate mode handling.

The IT527x series and the IT8855, IT8856 and IT8857 run the same UCSI
firmware codebase as the IT8851 and are software compatible with it, so
they are described as fallbacks to "ite,it8851". The IT8853, IT8856,
IT8857, IT5272 and IT5274 drive two Type-C connectors, the other
variants drive one.

For DisplayPort alternate mode, the driver queries the current
alternate mode from the PPM, configures the Type-C mux and retimer
accordingly, and reports HPD state and HPD IRQ through the DRM
auxiliary HPD bridge.

This series depends on the following series, which has not been picked
up yet:

  https://lore.kernel.org/linux-usb/20260807-ucsi-itepd-v7-0-998ac11ed0ef@ite.com.tw/

Signed-off-by: Amber Kao <ite_pd@ite.com.tw>
---
Changes in v2:
- dt-bindings: drop the second example, it only differs by the
  compatible string.
- dt-bindings: express the IT527x series, IT8853 and IT885[5-7] as
  fallbacks to "ite,it8851"; all parts run the same UCSI firmware
  codebase, so the driver needs no per-part handling.
- dt-bindings: add IT8855, IT8856 and IT8857.
- dt-bindings: move the variant description out of the 'compatible'
  property and shorten it.
- dt-bindings: fix indentation in the existing example.
- driver: drop the "ite,it5271" of_device_id entry, now covered by the
  fallback.
- driver: update MODULE_DESCRIPTION and the Kconfig prompt to cover the
  IT885x and IT527x series.
- Link to v1: https://patch.msgid.link/20260911-ucsi-itepd-it527x-v1-0-14c8041afb53@ite.com.tw

To: Amber Kao <amber.kao@ite.com.tw>
To: Jeson Yang <jeson.yang@ite.com.tw>
To: Yaode Fang <Yaode.Fang@ite.com.tw>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Amber Kao (2):
      dt-bindings: usb: ite,it8851: Add IT527x and IT885x series support
      usb: typec: ucsi: itepd: Add DisplayPort alternate mode support

 .../devicetree/bindings/usb/ite,it8851.yaml        |  49 ++-
 drivers/usb/typec/ucsi/Kconfig                     |   8 +-
 drivers/usb/typec/ucsi/ucsi_itepd.c                | 404 ++++++++++++++++++++-
 3 files changed, 435 insertions(+), 26 deletions(-)
---
base-commit: a8092db1cf4c3fd6cad36c5a10dcaa60d95ef114
change-id: 20260911-ucsi-itepd-it527x-5b87a61a71bb

Best regards,
--  
Amber Kao <ite_pd@ite.com.tw>

