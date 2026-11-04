Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793818757;
	b=QE9kHypTMqgRl64DxbCjvJB+uVtFVmURrdCKryjiehb9qQERWEF6Au763lK9bd5Ipgy+
	 WIJmOt+tMIpgDPT6xtGg79ZUaX1vhwcIIU8f4iA1yEWghiCBRg2oC8/NfchqdI4CXSvU/
	 pSBpIQjjTUMXZRIRm5GeeDiPhvn+TTpIBsKUC8b57oOuN6kj9l9R9dmBz3yV5J0bQGQbb
	 C/8DXOFlmmbLJ8xXSWp8rQRsl/VXznSGQOtWoQ9Ne1a3FcdnMZ37Tp4LaCwtLJ0oeCyQI
	 +xSl51neasxpGnDNDdjCRsQLAyDMp0ZqQr6En0+FbWziLPf3jd2H3THP/gKC4Zxo/qg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818757;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=fg4jmw/a+nITIeFwjqtq/iByvFNcxz/nd2aE1Sq1It4=;
	b=RrAHMNuvZBzmVN1DVj0dnKCQI/u5cqryXjGructW9wGYDGu8lb10/k3hY2kkyDVHqVD/
	 WVarcY6WoAeE3YLZg+bVGxrl6VX7+VVkf+JnoFEQbiMpWJkZI+BQW5WE7ufXRE4LbZcsZ
	 1uK2tgcYWZ4FqYxe7Sq/BfkmNTARXBCda/C9XBV8B9hwDO8yAAiv7HM5eDFmtU4iYKl3C
	 paetNA2Oiyov07VdOTWxX/52uUrubnG3jJEMIfBIL18vtfwa80G7RFmTKWP2HH14qh9Es
	 Mu0gj9uAu2k0iYf0TyAQbMvPJD1xx+4XPSejpMv8deVgbVXXeEQxeAhFhvUfS1rtTJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LF1nHyZW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998A8606D809;
	Wed,  4 Nov 2026 18:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LF1nHyZW
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793818757;
	b=EGt90wqACyY5dnRNzMI9vKTC3v5U+uinMeT9PSYMANPv3W78B97Qntcwd7t+ei7ttRoo
	 nAiYXVJpZe5eV9DTF/td+1H0B3gIOG0D/IhYIFkx/h6qr/Y27BXmQQy+8V0fuKYC6rrEG
	 U7iqfCX3Jdpo5mkn1CcRaf5wIUPVgIsTwNOmxCPDroF0iG5dyhR87sCHXJ1ag6HLa9kxS
	 wWrowOMc95wasy/iligClpJgvDuYxG4yuMWKrSXRLat7g8QVWDsV7QHe2p33Hv2/gdPj9
	 n1B2lWpRWRfuUsF0aBpeS1jWv38SXi/jexcno1vbYghJ08KeVRJpP9Vru0zI5XnkmmQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793818757;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=fg4jmw/a+nITIeFwjqtq/iByvFNcxz/nd2aE1Sq1It4=;
	b=cAhaZwmpW7JQxkX9e68ucNGhNoPuJ0oK59v0zoqh1EYtclKN4zNEnVWM2T0YpCDj23JP
	 3h2fh0uBjMSGfB1GFYjSxDIXYBAIGRKaU5uxYwMRXekPsRMtVHmmMiDtNiWaCNwOsipQR
	 KrIlyJJQexyyVo0t5aEPhmjdovRyNvK1mo1JI7OKeDQz1Igtl3YZYSUnoZUGx5ogr8LHf
	 6WH6Esb/O4gTYMeAsI+ED0LePEGdaVP7mufSdIRNeKnM9f9+i1PkNrDvDaT/XqcQ8WBtm
	 7O/q9EIZkuzMjdevD3DCeKjDY3g+TVL9ElpUkxKzQLJPpaOeCvipIIcNBCUmq8eCTVA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22ADB1F000C1;
	Wed,  4 Nov 2026 18:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793818757;
	bh=fg4jmw/a+nITIeFwjqtq/iByvFNcxz/nd2aE1Sq1It4=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=LF1nHyZWAzBH9gLkDIHhp+jDQJt5OxF8hIggN2cWLAlaX/NTjWPTUE++TYSi4XmoZ
	 RtixAr8NS7O1h3UWIuteMg9EWF2qGDxx7hpLzuTXnIRnDbH59NoLS/MDfsTJU7lGyK
	 hMgBObWC6/hcZk1lGdUIXCsBmF10SA7he1kJPlbMsVfdZYW2bpjaVu3SmvcYkdf3D9
	 42sf/tj+RmwhYhw/Z9BVhHOzG/BNE/IlXx6T/B5z5ySVqWl/v3J9ayuT6JI39b3D+f
	 lZOMDu7CbhJAF1tMAlKs2VMuIkF/WWGZcdlelYrelGA2+Ji6QtUCE6lAIDpMN3gNS+
	 59/rzdoOepBsQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 72FE846F48;
	Wed,  4 Nov 2026 18:59:15 +0000 (UTC)
From: Asdlerto Korry via B4 Relay <devnull+korryasdlerto.gmail.com@kernel.org>
Subject: [PATCH 0/2] arm64: dts: qcom: Add Samsung Galaxy M52 5G
Date: Wed, 04 Nov 2026 20:59:14 +0200
Message-Id: <20261104-m52xq-dts-v1-0-b198f02912ff@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIKA62oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMT3VxTo4pC3ZSSYl0jC+PkVIO05KRkE0sloPqCotS0zAqwWdGxtbU
 AGdQVtFsAAAA=
X-Change-ID: 20261104-m52xq-dts-283ce0fcbc49
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Asdlerto Korry <korryasdlerto@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793818754; l=2032;
 i=korryasdlerto@gmail.com; s=20261104; h=from:subject:message-id;
 bh=2xMJJCx7BHBsazgo/Rt9pf3D8n8vHFB8iVwUBQPj1+I=;
 b=uXj1aVnTnGh4hrD96LnWa1axAmz6m0lbhrLjVhHO73c46XKL1qWMHtdE7Tl0qOKnzueAVS31J
 hwM/+CUCReaDyIEdEvwx2U2yA/4vh52LVS/m+rNxEXjqX4VxZb9Zs9s
X-Developer-Key: i=korryasdlerto@gmail.com; a=ed25519;
 pk=RqttIGkm2XZ8NhLQBzPgpXXawOdVa1uODGsk+sagbxs=
X-Endpoint-Received: by B4 Relay for korryasdlerto@gmail.com/20261104 with
 auth_id=1411
X-Original-From: Asdlerto Korry <korryasdlerto@gmail.com>
Reply-To: korryasdlerto@gmail.com

This series adds initial support for the Samsung Galaxy M52 5G
(SM-M526B, codename m52xq), a smartphone based on the Qualcomm SM7325
SoC.

Tested on next-20261030 with only this series applied: the device boots
to a postmarketOS userspace from UFS. ADSP, MPSS and WPSS come up, WiFi
connects, Venus probes, the microSD card is detected and readable, and
USB peripheral mode works in both plug orientations. The kernel log
shows no errors from the nodes described here. Bluetooth, NFC, IPA
mobile data and the GPU were tested with the same nodes on a 7.1
kernel.

Not included yet: the display panel, touchscreen, cameras, audio, the
fuel gauge/charger and the USB Type-C controller (SM5714). They need
drivers that are not upstream yet. The display works through
simple-framebuffer for now.

Notes:
* The stock ABL picks the DTB by qcom,msm-id/qcom,board-id. These
  properties are left out as required for new SM7325 boards, so users
  add them when packaging the boot image.
* The reserved memory map follows the stock device tree. The removed
  region is larger than on other SM7325 devices (0x5f00000). With the
  common size, the kernel livelocks when it touches the memory the
  hypervisor keeps.
* Several regulators need a fixed voltage or must stay always-on (UFS
  VCC on L7b, the ADSP-managed sensors on L12c). With the stock ranges
  Linux sets the minimum and UFS or the ADSP fail.

Signed-off-by: Asdlerto Korry <korryasdlerto@gmail.com>
---
Asdlerto Korry (2):
      dt-bindings: arm: qcom: Add Samsung Galaxy M52 5G
      arm64: dts: qcom: sm7325: Add Samsung Galaxy M52 5G

 Documentation/devicetree/bindings/arm/qcom.yaml   |   1 +
 arch/arm64/boot/dts/qcom/Makefile                 |   1 +
 arch/arm64/boot/dts/qcom/sm7325-samsung-m52xq.dts | 828 ++++++++++++++++++++++
 3 files changed, 830 insertions(+)
---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261104-m52xq-dts-283ce0fcbc49

Best regards,
-- 
Asdlerto Korry <korryasdlerto@gmail.com>


