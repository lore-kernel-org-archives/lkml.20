Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8199722FDE6;
	Sun,  6 Sep 2026 12:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788697367; cv=none; b=JYrG6S3iEn6YppavuT3k8yy3htHwV4pMNlkUtDuL/4xNoNF77gKUrekg588aeQt7LBaMjeZ5BrxASKA+5beIkxIlQAX0RB/0kPhzYOkQ9z9gL3Agcduj6ceDr1nS8cVohKMpshpPofKV41B83F+twJXS+657N7gzb1RPmG643rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788697367; c=relaxed/simple;
	bh=ADxRjnNzSi7Z4fhchcNFTSRw6rQSjI4jcShXFeLELO4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=boG1WtUvLIup4SxJXNdkoHiD+yh9Cmf1uvhBNkk8OEF5WwLOEDphWfb76UAEfAaIa+fpeR5apZ59K0GWfm/qshkC691ggxrmiVkuBIHObBI0hpVVtcOTmsPUhj+uoD5oqDNgL1TIVw5EVTsTgFSR6+1uRC0SwfHQyD+gCSXR3Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VT38vfZe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VT38vfZe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D407C2BCFB;
	Sun,  6 Sep 2026 12:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788697367;
	bh=ADxRjnNzSi7Z4fhchcNFTSRw6rQSjI4jcShXFeLELO4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VT38vfZeMJPLkOv3Fy9SesPgvyBmdwC9P7B2tkVPQW0+Mghz+DnQaUeSaCsRGR0yN
	 AqyAzYsfa7xSkKG5R7l8xV4MsK5tB9NuMaZVOxMjTPe4POTZRsXfe1ltsb1jOcVvFE
	 mvlD8G91eRQssL5Zwg04nzt4lrtdQl4mYAJtu4kSwu3NFlk3qhIS+vOWkQTR5eFppU
	 J380hdYXGHh7M7KZyJ/hclRerENJDDPB+CiWcCi5GBoBm3TbUll25k6jF1ainrElqk
	 nutKna02GDXhYTYtcQoTULibT8nhGvC/rZl5Q8h7CFRT/jmjEX3/PNpFg3otDbHUHj
	 Tih9mgkdAQSiQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85EDC79F8C;
	Sun,  6 Sep 2026 12:22:46 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH 0/3] arm64: dts: qcom: Add Lenovo IdeaPad Slim 5x 14Q8X9
Date: Sun, 06 Sep 2026 14:22:35 +0200
Message-Id: <20260906-x1-ideapad-slim5x-v1-0-7ccffbe6bc4a@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7TlBBwb4SHUzXWigThRDEvycdZ
 2CmQcFMWGCZGmR8qdATB4h5AnfaeCAjPxgkl5obrlgVw6BN1rNy0a0qc3430luhAw8wupQxUP2
 f69b7B/EOWANjAAAA
X-Change-ID: 20260905-x1-ideapad-slim5x-cdb92da16f0f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788697362; l=2359;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=ADxRjnNzSi7Z4fhchcNFTSRw6rQSjI4jcShXFeLELO4=;
 b=TVTp4IZeGvqhF6yrtvlKbOeDVxYLO2sKjwQfQskLdmCS4sOoyc+6FC1CfUYFTqfLwIZdgvhtu
 DL+pCdiLptVDxXuEv2Q/EinzybiSpwKI1GRxtkfm2aKbkwrrIQwVKtt
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

Add device-tree support for the Lenovo IdeaPad Slim 5 14Q8X9
(machine type 83HL) on Snapdragon X Plus X1P42100 (Purwa). In
some regions the laptop is sold as "IdeaPad Slim 5x"; the "x"
is Lenovo's Qualcomm suffix (i = Intel, a = AMD, x = Qualcomm).

Working:
- keyboard and HID-over-I2C touchpad (several vendor ICs)
- eDP (LCD PWM backlight and OLED)
- HDMI
- USB-C including DP altmode
- USB-A
- NVMe
- microSD on PCIe3
- WCN7850 Wi-Fi and Bluetooth
- lid switch
- Adreno GPU
- speakers, headphone jack, internal DMICs, DP outs
- battery / charging
- camera (on usb_2)
- fingerprint (on usb1_ss2)

These device trees have been in use for about a year [1] and
are well tested. Bring-up started on the IdeaPad 5 2-in-1
14Q8X9 (83GH). That machine is a different design [2], closer
to the ThinkBook 16 G7 QOY (its DMI even contains an IdeaPad 5
string). 83GH will be a separate series.

Audio needs the X1E80100-LENOVO-Ideapad-5 card name, a symlink
to the T14s/Romulus topology firmware, and the alsa-ucm-conf
change already merged as [3].

Thanks to everyone who tested, especially in [1], [2] and [4].
83HL was one of the quirkier boards to bring up.

[1] https://github.com/jglathe/linux_ms_dev_kit/discussions/36
[2] https://bugs.launchpad.net/ubuntu-concept/+bug/2098124
[3] https://github.com/alsa-project/alsa-ucm-conf/pull/599
[4] https://github.com/jglathe/linux_ms_dev_kit/issues/61

Assisted-by: Grok 4.5 (xAI)
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
Jens Glathe (3):
      dt-bindings: arm: qcom: Add Lenovo Ideapad Slim 5 variants
      firmware: qcom: scm: Allow QSEECOM on Lenovo IdeaPad 5 models
      arm64: dts: qcom: Add Lenovo IdeaPad Slim 5x 14Q8X9

 Documentation/devicetree/bindings/arm/qcom.yaml    |    7 +
 arch/arm64/boot/dts/qcom/Makefile                  |    4 +
 .../qcom/x1p42100-lenovo-ideapad-slim5x-lcd.dts    |   30 +
 .../qcom/x1p42100-lenovo-ideapad-slim5x-oled.dts   |   15 +
 .../dts/qcom/x1p42100-lenovo-ideapad-slim5x.dtsi   | 1695 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 6 files changed, 1752 insertions(+)
---
base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
change-id: 20260905-x1-ideapad-slim5x-cdb92da16f0f

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>


