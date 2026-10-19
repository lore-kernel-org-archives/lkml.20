Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424902;
	b=vBRj/VIjgIbXDUYMPGtuqfdQ2/eAIAJAlZbc/8Tk5qcKbk7e1tP/U+bGX7GLGX+9YWdg
	 NXJ5Kc/8ZVK8CosKqZD0VSVM9iy3eLjZErLgT9FlzD9rVfawcYJrey2BmpQMxob7TNaUW
	 6d14jc/DlgpgLKwKTFncPUoO8ckKDaqt3zT0hgk07P+UbBCt6WgFpfapIM0Q30b4F2Nj1
	 tsKzMwflWGovD4A1g2bldgM2cTOhfxKHNfWfo2azJqirAIBBxDjQ7XItoQk2yICo2ufv0
	 3uLkKcP+n9iDGxgDlhxf1wnv1fg4MlS5CJfd+miPQWCcNhWkfknesexAiNscsQnlDQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424902;
	h=DMARC-Filter:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=deYXOdM/XtLg2+bTzxjhtT1cAJxB9Z80aNaEhDFbctA=;
	b=5bgxgSHpZ6tf5Ud5yFXVdKOAhOffIilj8ZOQg+OVcbUfLKO9oCoKE/0lYJULyh+DStnD
	 LCUtkOFwjXxC0+yfD9rTGcuWUvnmNAMlJ5FLGAQ+FZMaotDYJiMIzRlEMcq9GDxA5vZOv
	 QZ25m4r6lFdmcgkiG2VPKnqKQ3UKaHC70P63I6FLdktIVkKTz2aZ86hcMaHG61LQO0Xi3
	 abshOUz/f4tRVrqOjwVgSaCg9q1xZRWuJ/Aklrl+nKQHQIxAgr3u7UAgzhFi32CnjvrwK
	 fNOhtZP2RzAziyo4gA80gusBGdlSds8bMrledaHb7uFcJxrB7mY/CDUdHHAJxYmZwQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mentallysanemainliners.org;
	spf=pass smtp.mailfrom=mentallysanemainliners.org;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=FjGncOqM;
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BF5608604E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5BF5608604E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=FjGncOqM
DKIM-Signature: a=rsa-sha256; b=FjGncOqMStEErEo7Z0/BgmgF4gjIhZli79ar6lwoO++2J4zbplvl1rH3s2VbdsrhY1DkL/SJSYf0VtCfDJM7VFGgwry/Ya2Zuggl1J5JqbZ+cQjqJ/+c4OlXAgI7VAqYQ0hJjd2gxY0sQDHRRLPanmV+fjbZjieXZNhVCBgFdnBAQ1FidpCKsGDq8sl0yL0tc5jWYyqccose/g3RA36ltF3SzawVI3IEzqDhc5yrMoTPlr+ZyfXlKKBxgRVVX8iZfeKUZeVe2ZZZSK/HLf7ALYa1SQPDN2fm7lUWo64+chJeJa9LDbEHgnMauw/byi+TQPjbiSyqWOGlzzWqe3Lnew==; s=purelymail3; d=purelymail.com; v=1; bh=pMT1kLgMULpsfP5MHHVrAosWw+0Eg3VWq1PDfl234AA=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -415248943;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 19 Oct 2026 15:47:31 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH v4 0/2] arm64: dts: qcom: Add support for the Xiaomi 17
 Ultra series of devices
Date: Mon, 19 Oct 2026 17:47:21 +0200
Message-Id: <20261019-nezha-v4-0-19c1e31eb255@mentallysanemainliners.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNzQ6CMBAE4FcxPVuzbfmrJ9/DeFjpIjVYTItEJ
 by7BUNiPOhxkplvBhbIWwpsuxqYp94G27oYkvWKlTW6E3FrYmYSZCZAZNzRs0YOQPqoVSpFJVn
 sXj1V9j47+8M7h9vxTGU3jadGbUPX+sd81Iup9232ggNHpTWAqRCN2V3Iddg0j4COLmhdYx35s
 Gn9iU0nvfxk8oWRkUmSUqckUJsM/zLqkykWRkUmp6LMlAYlNfxkxnF8ARYU/cBLAQAA
X-Change-ID: 20261016-nezha-00e9b93521f2
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792424849; l=2504;
 i=igor.belwon@mentallysanemainliners.org; s=20251104;
 h=from:subject:message-id; bh=pMT1kLgMULpsfP5MHHVrAosWw+0Eg3VWq1PDfl234AA=;
 b=ssLyCMQ6fobl3Ecs/d++RzpryQ6XL8ENyn2s5qiEeafIL1FsoILylGIzby/+aiAjXRO2QxcH1
 lSRAPm+/5FhBbYHVD/wNQxrxnH1Joa40/SU54sDh5vUOYdJKK/EvrwA
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
 .../dts/qcom/kaanapali-xiaomi-nezha-common.dtsi    | 881 +++++++++++++++++++++
 .../boot/dts/qcom/kaanapali-xiaomi-nezha-eea.dts   |  20 +
 5 files changed, 930 insertions(+)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261016-nezha-00e9b93521f2

Best regards,
--  
Igor Belwon <igor.belwon@mentallysanemainliners.org>

