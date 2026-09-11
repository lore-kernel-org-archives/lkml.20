Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net [60.251.196.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBCE42E8DC;
	Fri, 11 Sep 2026 10:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.251.196.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121923; cv=none; b=Sv3C8K8ueLjt8poao7afwA/lrnm/cZdW7nKcdVhW6uONE4pD3ro+a4z/PqsWwhk3hnsWXRHTOuwbx3uXxmPb+untHRPZBs/utdRyHIdNo7PWjxAcLKlreMEYvMEugLMZUXIHWyFeOnqpG5SlE+DB0n0Kxy0BQ88c2zyd5ZLH974=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121923; c=relaxed/simple;
	bh=NlNrje7LTfvXp7maV9lhHlpG6QvShtPIWuZFdjTrN7s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HbA3g59Nx4NojAMej/O8Y13QlN2owB6w5MIVEVeSPBmE2oO0WvtqALqce7Qoa+B0Wux06hCP9A+i3QZsSITXVXZZijlBjnX4HSohpdpFANoIKer81n2baibMr4+HhH2VnMWEqDjw25jpz7OCHFpCMEQEmu1Iheg3Ko53GqpNOjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=FCTQn9LP; arc=none smtp.client-ip=60.251.196.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="FCTQn9LP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=n2p3zCH+NtyA5f7Fe13NEUPsv2WiyBHrv9a2BtmJwZE=;
  b=FCTQn9LPxlxIhM72ac9p4VVN8wBhbH2Cven2Oq9dY/FmKJ/WQcGl0HnT
   wqsXyjAeEdXHkBttRh7PpGhR/zjD8kmpID9rtojcseTdQDScMrR37zPdL
   bZOhkSKBJ1do0t/xwz04udfcM2LJWnat345ljUQzfhul7li3pHBv1uqIJ
   RQhnTPNQMWGZ+e+J4z1Q+kIFcmy1ZCTtJsxdz4WqeIqqx1DYehXLRKlx4
   W4Pm+EY3wSDUz90m4tVtgqKjjUjdMAdxOgd1X/43thQfGWyu6ECkJjt1b
   XPhpMrXbXmgQ7m1/3NHcvjZsRw9PZU+tSWMHmq9yW238DWrxYzZSRnQcp
   Q==;
X-CSE-ConnectionGUID: qtUFtQivTcW+k9nqZUi0bQ==
X-CSE-MsgGUID: 8vJsIZOaQMCHUkQH9oQppA==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 11 Sep 2026 18:17:22 +0800
Received: from jiraproxy.ite.com.tw (jira.internal.ite.com.tw [192.168.35.200])
	by mse.ite.com.tw with ESMTP id 68BAHHrD037153;
	Fri, 11 Sep 2026 18:17:17 +0800 (+08)
	(envelope-from ite_pd@ite.com.tw)
Received: from [127.0.1.1] (ITE01791W10.internal.ite.com.tw [192.168.37.107])
	by jiraproxy.ite.com.tw (Postfix) with ESMTP id 6F1682D58;
	Fri, 11 Sep 2026 18:17:16 +0800 (CST)
From: Amber Kao <ite_pd@ite.com.tw>
Subject: [PATCH 0/2] usb: typec: ucsi: Add ITE IT5271 series and
 DisplayPort alt mode support
Date: Fri, 11 Sep 2026 18:17:56 +0800
Message-Id: <20260911-ucsi-itepd-it527x-v1-0-14c8041afb53@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrDUxTSiuIhZtDcYC6SAScXfF5
 iXf4v0XCAUmgTq5INDBwsscgWkCfrTzQIq7aNCZLrIKUe1eWPFGaxc31+ZUuSuNLdAadA7ibw3
 U8/k1m/a37G4iv70huO8HnbhiuHUAAAA=
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
X-MAIL:mse.ite.com.tw 68BAHHrD037153

This series extends the itepd UCSI driver with support for the ITE
IT5271 series controllers, and adds DisplayPort alternate mode
handling.

The IT5271 series shares the same programming interface as the
IT8851/IT8853. The IT5272 and IT5274 drive two Type-C connectors, and
the IT5273 and IT5274 additionally support EPR.

For DisplayPort alternate mode, the driver queries the current
alternate mode from the PPM, configures the Type-C mux and retimer
accordingly, and reports HPD state and HPD IRQ through the DRM
auxiliary HPD bridge.

This series depends on the following series, which has not been picked
up yet:

  https://lore.kernel.org/linux-usb/20260807-ucsi-itepd-v7-0-998ac11ed0ef@ite.com.tw/

Signed-off-by: Amber Kao <ite_pd@ite.com.tw>
---
Amber Kao (2):
      dt-bindings: usb: ite,it8851: Add IT5271 series support
      usb: typec: ucsi: itepd: Add DisplayPort alternate mode support

 .../devicetree/bindings/usb/ite,it8851.yaml        |  72 +++-
 drivers/usb/typec/ucsi/Kconfig                     |  10 +-
 drivers/usb/typec/ucsi/ucsi_itepd.c                | 405 ++++++++++++++++++++-
 3 files changed, 467 insertions(+), 20 deletions(-)
---
base-commit: 3c4aafdfefdc69285d7d4f11d7944f56083fdd8e
change-id: 20260911-ucsi-itepd-it527x-5b87a61a71bb

Best regards,
--  
Amber Kao <ite_pd@ite.com.tw>

