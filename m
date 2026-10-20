Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506045;
	b=Stj+JI3k0SxCCkdebtfQJaTAVYkp/eDj2Z7Ne3ttzTXOOUxJAxkXf5Gk5Mc2UDuDHTBp
	 +UWGv1+5Xi7Z/Oyeytgq4aecYyjeM7oyoZkd5IgTvCKXZMiWzPdwP7r9OMg9VxB/FawMa
	 xMvI33V55886+5oZfdkMjOm64qaxK6gfhn38vtnId4E7Ji34YgW6QgIF2U5/HbsWEN9C5
	 RIDODBOJUvCykJT5zzHTi5w0oMIKxhfnCDeykn0Fxg6aA3RX2Ct97Vvv8AVz/Faj+1bC4
	 mKqqNcmjP/Ndxc1DPLj2qOOGxLiSMmzeX/RvfmUdhe6TASw+HddONx5JvJYfPx9Mv7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506045;
	h=DMARC-Filter:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2Sn9aowY3SPrZ+kYHI/v5Zxov5Vf/vmMzBDYEqzgTpo=;
	b=5amtRLE5xleDHz9ygJemIEoA4/izLWc8JVe8N5U3NH3q+TDeB87QpTyLHIYkfRrywlP/
	 LkebHLTUmDBP+mY9MxDmMpUDS/fzSdbmeGm1jJY7B6desE5Y7A7nxDBhWFIyixgm7mo1T
	 u/G/s7fqmkwwOf+uTdEyvunTdS0Hj/ZwJEM9mGw9p6RCZt4lePSP025nL6dULkdIJQqBu
	 ERIp5wCdev5Fa4saDHXWCSLkV3ii3ZsIPvz5+cHRcxpgQzYw1jUl8JkH5K+/UtesZ7/N/
	 MG3WkZr5zuQ+oRoimHafCeimXL6iEUQ8fGhsfA2vQzCaV7XBOvzCqFqQzPX6H2RFb1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mentallysanemainliners.org;
	spf=pass smtp.mailfrom=mentallysanemainliners.org;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=DQ7PEjMU;
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8950E606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8950E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=DQ7PEjMU
DKIM-Signature: a=rsa-sha256; b=DQ7PEjMU1+ACUZnVV2COkrx0We8bwZqojLjJ4l68654vg9q1zuf3CE0fo2JWTzJCb76xuZxBi33wPqnJr6YdkzrnPhaq3lNftkBsC/KhMuPPBvZQnWZSvjPhXqmdGYYK2GgHrNoVZh6YBYpJBjrDKJGvDHqOpAMCnCqDuDPNL9cY+tiSeKKXIRb3NlqWn68sxv1ZsEAEH44M3zhnamNUsuq0XXmTgdzIItY0g4uto6AVCpsbFsYmIpwQ7DIO3bwrA8fjfvl4Oj4qRqSYtrc2NOpZTOFMYB44tbJfxiqGGPuc4uWwvy8TWaWVn7xHGgfh322EqnMJ0cTEU9nW1e/mXw==; s=purelymail3; d=purelymail.com; v=1; bh=5VZGJYfVB3CwjF3wtkRNyPAmyq60fAzhxsXsQpkLsYY=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 913581972;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 20 Oct 2026 14:19:38 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH v5 0/2] arm64: dts: qcom: Add support for the Xiaomi 17
 Ultra series of devices
Date: Tue, 20 Oct 2026 16:19:13 +0200
Message-Id: <20261020-nezha-v5-0-04898d6b5f80@mentallysanemainliners.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNwW7DIBAE0F+JOJeKBeNkc+p/VDmsYR1TObgC1
 0oa+d+LU1myemiOI828uYvMKXAWx91dJJ5CDkMswb7shOsonlkGX7LQStegoJaRvzuSSjE2aKy
 GVovS/UzchuvDeT/95vzVfLAbl/HS6EIeh3R7HE2w9P6aE0glySAq5Vsi798uHEfq+1umyBcKs
 Q+RU34d0lksJ5PeMvuV0YWpKoeWgdDX9JQxW+awMqYwez642qAyGtVTptoyuDJVYQAdsAFutLX
 /MvM8/wC+/D5TkgEAAA==
X-Change-ID: 20261016-nezha-00e9b93521f2
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792505977; l=2688;
 i=igor.belwon@mentallysanemainliners.org; s=20251104;
 h=from:subject:message-id; bh=5VZGJYfVB3CwjF3wtkRNyPAmyq60fAzhxsXsQpkLsYY=;
 b=djMHt0MZ/jon+MWPKlcQ1y5urGXZ2dj4Quc7rPSn4UITtoSgkETGy/pxVPzlF2CeD2gVubUTZ
 bJ2gsiUWeSZA0xgFMh0nyKuBRAgUYUKhj+1ozgsY4hNykuGUYw8gNcp
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=i9++1bbnBwoyc3uhTaetGXS1TbBJoS0mcxT59GrpYh0=

Hi,

This series adds support for the Xiaomi 17 Ultra series of devices,
consisting of the Chinese domestic region version of the device as well
as the EEA version. The only real difference in the devices is the 
battery capacity.

Currently only basic devicetree support is added, with driver support
for the display panel as well as other hardware blocks to be added in
future patch series.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Changes in v5:
- Split pdp_mem to cpucp reserved region and pdp region [Konrad]
- Link to v4: https://patch.msgid.link/20261019-nezha-v4-0-19c1e31eb255@mentallysanemainliners.org

Changes in v4:
- Fixed indentation in apps_rsc node [Abel]
- Used block comments everywhere [Abel]
- Fixed eUSB2 repeater squelch detector value [Abel]
- Dropped removing adspslpi region and used reg value override [Abel]
- Added the unit address to splash_region [Abel]
- Removed the splash_region alias as it wasn't being used anywhere [Myself]
- Link to v3: https://patch.msgid.link/20261018-nezha-v3-0-7e8c63903290@mentallysanemainliners.org

Changes in v3:
- Fixed two mishaps that occured because of me not saving the correct file. [both sashiko]
- Link to v2: https://patch.msgid.link/20261017-nezha-v2-0-44c95e1a9d6a@mentallysanemainliners.org

Changes in v2:
- Fixed a duplicate compatible match [sashiko]
- Fixed firmware names [sashiko]
- Removed synaptics dep nodes whilst the driver is not merged [sashiko]
- Fixed unit-address-matching-reg [sashiko]
- Link to v1: https://patch.msgid.link/20261016-nezha-v1-0-a39900dfaadd@mentallysanemainliners.org

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Igor Belwon (2):
      dt-bindings: arm: qcom: Document Xiaomi 17 Ultra devices
      arm64: dts: qcom: Add support for Xiaomi 17 Ultra phones

 Documentation/devicetree/bindings/arm/qcom.yaml    |   8 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/kaanapali-xiaomi-nezha-cn.dts    |  20 +
 .../dts/qcom/kaanapali-xiaomi-nezha-common.dtsi    | 880 +++++++++++++++++++++
 .../boot/dts/qcom/kaanapali-xiaomi-nezha-eea.dts   |  20 +
 5 files changed, 929 insertions(+)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261016-nezha-00e9b93521f2

Best regards,
--  
Igor Belwon <igor.belwon@mentallysanemainliners.org>

