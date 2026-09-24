Received: from ironport.ite.com.tw (unknown [210.202.87.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FC8455181;
	Thu, 24 Sep 2026 09:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.202.87.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243787; cv=none; b=mRzsIAsLeFUopteMxjr++CERDTsdUpyqiouA+6Gee6INlm1U+5knc9CDyBUfrgaSHpo9i821NHyRKmg+ju68TIvHihgUqAzIbsD47ODzyyQAtmgkK/BAI/tEZoOYIeFsMT5KFoU73tY09kseVP+4zoQvEarmFhKLAqrW7vYc54c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243787; c=relaxed/simple;
	bh=HI1c6UyjCQYidbeRlhQGBOpgLQIWBvpDLaGO6u/0yPY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mKhlR8ugw3IaLZO0le9q+rjv/m0BXknG/uuuhcKK97oixqXDMAI72px90x2IsTAEz9UakQQHWQCYNyGkfA1VhnwApiMFWVhbrGDiMaUSM7Z3Vailx9+fiv996EMIXAALHTUmcZNTN19HmDnTXMwIb7bjMLo6r2HuaOzUV24P4/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=JCMxOQh/; arc=none smtp.client-ip=210.202.87.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="JCMxOQh/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=6U3G0DIBwxeEOQz0w/zl3FiSVCBsPfwsigR/rJ5Yqr0=;
  b=JCMxOQh/+J4FGF/InAJIxBWyOM35QRoGJ5XuAIaWiUnu/ByKsit+96AZ
   ZV7g2l6s1vx4BJ32Gn83EosDTvMwswFN52RL3+ZIkvecFfJ5/ZGMOgPBT
   GS3d4zcdmyHC5y/z4DQUPE66m1EmGPy/z+LP2Bd9yTJw8XLxkQNEFIx2O
   jSPRRyBjvF0Zq/0OpOUFoxZT0xlgD7MaWoYCMYhCyvVeXKpHnR9lZ19RN
   J2l4i8Fis4rkVLR/lQFmIZQwzwpCpEaTSa4rDj31Z98Hu0y3MoxKRZ7Gj
   Jp7Kb3EIZ76o2Ifi42I5YMFx+YtuFUPB+P92cQl/CFU7crupN8rZZZu/C
   g==;
X-CSE-ConnectionGUID: irPtFuCOQmap79C8PQJA4A==
X-CSE-MsgGUID: qS0gJPxFSfeizDjL5LcK/A==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 24 Sep 2026 17:55:58 +0800
Received: from jiraproxy.ite.com.tw (jira.internal.ite.com.tw [192.168.35.200])
	by mse.ite.com.tw with ESMTP id 68O9tr0M039527;
	Thu, 24 Sep 2026 17:55:53 +0800 (+08)
	(envelope-from ite_pd@ite.com.tw)
Received: from [127.0.1.1] (ITE01791W10.internal.ite.com.tw [192.168.37.107])
	by jiraproxy.ite.com.tw (Postfix) with ESMTP id B9D6C2D58;
	Thu, 24 Sep 2026 17:55:53 +0800 (CST)
From: Amber Kao <ite_pd@ite.com.tw>
Subject: [PATCH v3 0/2] usb: typec: ucsi: Add IT527x/IT885x series support
Date: Thu, 24 Sep 2026 17:56:35 +0800
Message-Id: <20260924-ucsi-itepd-it527x-v3-0-a7392aa087f5@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NTQ6CMBAF4KuQri1hyk/BlfcwLtpSZEwE0paKI
 dzdFjeaGDeTvMybb1ZitUFtyTFZidEeLY5DCPkhIaoXw1VTbEMmLGNV1gDQWVmk6PTUhlkyvtB
 S1lxUIDhIScLdZHSHy26eL+9sZ3nTykUoNnq0bjTP/amH2Pvne6AZhULVWQGik2V+CutUjffUP
 Uh84NknUf8iWCC4ZG1T5Fwpzr6IbdteeHoH8ggBAAA=
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
X-MAIL:mse.ite.com.tw 68O9tr0M039527

This series extends the itepd UCSI driver with support for more ITE
Type-C PD controllers.

The IT527x series and the IT8855, IT8856 and IT8857 run the same UCSI
firmware codebase as the IT8851 and are software compatible with it, so
they are described as fallbacks to "ite,it8851". The IT8853, IT8856,
IT8857, IT5272 and IT5274 drive two Type-C connectors, the other
variants drive one.

This series depends on the following series, which has not been picked
up yet:

https://lore.kernel.org/linux-usb/20260807-ucsi-itepd-v7-0-998ac11ed0ef@ite.com.tw/

Signed-off-by: Amber Kao <ite_pd@ite.com.tw>
---
Changes in v3:
- Drop DisplayPort alternate mode support, it will be sent separately.
- Move the Kconfig and MODULE_DESCRIPTION updates into a separate
  patch (Heikki).
- dt-bindings: restore the maintainers entry and drop the unrelated
  example changes
- Link to v2: https://patch.msgid.link/20260918-ucsi-itepd-it527x-v2-0-7b2d9437cc72@ite.com.tw

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
      usb: typec: ucsi: itepd: Update descriptions for IT885x and IT527x series

 .../devicetree/bindings/usb/ite,it8851.yaml        | 34 +++++++++++++++++-----
 drivers/usb/typec/ucsi/Kconfig                     |  5 ++--
 drivers/usb/typec/ucsi/ucsi_itepd.c                |  2 +-
 3 files changed, 31 insertions(+), 10 deletions(-)
---
base-commit: a8092db1cf4c3fd6cad36c5a10dcaa60d95ef114
change-id: 20260911-ucsi-itepd-it527x-5b87a61a71bb

Best regards,
--  
Amber Kao <ite_pd@ite.com.tw>

