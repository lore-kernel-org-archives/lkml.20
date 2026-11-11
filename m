Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794399894;
	b=H/TXtgLgPzXVfn7s6r37m8SLlahTWLQ5mZiPZE5PbEJiha++Ohd9cBIEAuPC1AlOvbtK
	 ucTonPpUtC2V8X+pBocU7mMG90yaboPyDVIYWlY0wgSJvCXZoz7QnLr9HrExDMqW0DZWc
	 zfbb43IDILW85lDhznuwL6RDKHDc73i2YyRT5/+eSTvC4mIw0TCjkKql8Wx+5y0ojiyOt
	 9eGK3JkszdjhHvqVdCtvDrk8wntMZnnPEU99GnFKIUD+joxu8sYV6tPP13JeSW+Uy6Z19
	 YgDMB4THHlDiMT4Xzu60LVcQ3CSfznAW8iK6TLR36PvKyScA8sYsFlx2lYM0qcw3K/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399894;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=vJymKD8wcsz1SNmg6n+0LMO/8cVup8JgUK92h3fbZKk=;
	b=r840NH1LpJ/rlrm/T3tZClE4i2A+ZR33sHiVVdtmuIfOq5Lhs6Dm/IVi1Yurvl+8XtpD
	 yJgxsDKWQAOjeeeA+V+ggaVkBlNU+HrkrR4gXtSMxLNpmpkzWlbgFBiNTXJWSdmBEvdlG
	 dQ9oF3f0TqmfWcx1iIfvnI7Pi1M8d26qgeNOXdaaJ6h716YB8RAiLMqnirTEwr6zVzMMg
	 TTbldueV2DBEPOid7N3Xlukyt6RFbsYJINgfKcg+RItLKRSZ3fnER84bhPJtnF4sn5nXE
	 7tuq4l2SNu4g7r0j+D/VcHKw89ox6WKmT61DYNSnAMycJnzqGqM6x6LPMM+uiVVJgyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K1UZgNnw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632AB606A31C;
	Wed, 11 Nov 2026 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K1UZgNnw
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794399894;
	b=eO2Rw3xpma6L4XbqG9F0S+QSln3+UrxSnI7aBFw3KmvjXkcHkCOIXVFoT+QqBUARYN/8
	 JNV/zAGF/tUsRw6aF5yawOqh6F0TSNTFez2Fu4fsDYpnSQ5infDg6DyDipVY8Iu1hhtJr
	 0ikj4adUBOXfKBQPKBsAnX4ShnLG8WBWB0C6Rh7diZTWt9E5Nu0pONysTKE8yY/CJcNM4
	 0zY6mWmGWFW8Lz3HMp6qy4UNrzGGXMKTh37xxytnWVzL1Lh0saBsVgSdG6dEOZBYRBWqh
	 ZsTh8Md98kwU+wc8SMJRMlcr3oViOKzjSUrNYn3qRib2EyDoUmxOMQxQ6qDfhOc1Tag==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794399894;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=vJymKD8wcsz1SNmg6n+0LMO/8cVup8JgUK92h3fbZKk=;
	b=GsV/iSIuqqm5hfOSLlh92wjE1fbIddIT6zJDES577E3p44PQSh7VoQ3up6jzQ0CQzhs2
	 m4qASTQakDFdY+t12giAFPhDGtdP2oW9KnZdoVwcaK1U3xvtintCi0Lj8Up34qsy9pbf5
	 oMAfvkAvQsWGCiw5tuFHH1TNbdD2J1CoX6Y7sjZ2zue0tvyn5tqSMhKwcFM3BDoZta0tS
	 oApeWkAiYju6WbyfttiMyqV0OuNfM+Tnyp9fT4+GlgjzWToJVqdsH9vB9B6Yh5posT1y3
	 5N2rn9UehvU0+EwlYQWVBQQlnfiXyusun1snPQuA5/33lwnsZeEb8y5OSKmjIJD7zog==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 859481F00A05;
	Wed, 11 Nov 2026 12:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794399894;
	bh=vJymKD8wcsz1SNmg6n+0LMO/8cVup8JgUK92h3fbZKk=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=K1UZgNnwX6RIJcD0Yf9egTSxGrYttybHdns1MyhG2U6b5jQsgi76bT0A3/4BfMny3
	 GiwV00X+Ry3OSRbauLvZ7li1AJsYETMlggbMR7emw1etsQf0c+B1uLZTvYCDlauGUd
	 TAKPQULwjMGUW6+UG7KdfvfaX0oCWL7juNiWEQB2nbNlW+HjvlB40lkpEdfuM/MV4W
	 p3FW8li+xuJJ4JUzV1ekhbG0IUzPoS5OorQHzAkfIH4KKPomTjVN7NxSluSZmnT9VL
	 H/xJ7RVe9qk0uORqPm/29ilrC2pVNt8hf2VJquvXEvuYAq1+pOngkfOt3SArQSBspv
	 mXft3CU4d47UA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1470148F9B;
	Wed, 11 Nov 2026 12:24:53 +0000 (UTC)
From: Vishal Balasubramanian via B4 Relay <devnull+vishal.bala.nps.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] Add Samsung Galaxy Tab S7 FE LTE (gts7xllite)
Date: Wed, 11 Nov 2026 17:54:49 +0530
Message-Id: <20261111-master-v2-0-5eb864e9f38d@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAJFe9GoC/2WMwQ6DIBAFf8XsuTRAUWNP/Y/GA8KimxQxYEgbw
 7+Xeu27zctkDkgYCRPcmwMiZkoU1gry0oBZ9DojI1sZJJedqGNepx0j69V0a83AnVIGqrxFdPQ
 +Q8+x8kJpD/FzdrP4vX+JLBhnvJ+U450erG0fs9f0uprgYSylfAHEl89mnAAAAA==
X-Change-ID: 20261111-master-74b35c90f44c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vishal Balasubramanian <vishal.bala.nps@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794399891; l=1585;
 i=vishal.bala.nps@gmail.com; s=20261111; h=from:subject:message-id;
 bh=1CzGOPtoQOQ5ftnC93rBD5AZUNBTmg/XmuRqFrI/w+Y=;
 b=t3z2R7aYNTWMCQNkyyCGEwyoK1suv1Lr6YnXtI/4XCtA9tPksBJKx19gpJMoJewJPxRI0q1RK
 RJxp18GCGA0CZKNFBWYhZ4Phuj6nWPe2B4Vcm/wLNa3xj945Fz3wjAa
X-Developer-Key: i=vishal.bala.nps@gmail.com; a=ed25519;
 pk=GDcoc+SAK+BHD1Eq17X/BJa9U2HZkBW+dmxS8s1xMAY=
X-Endpoint-Received: by B4 Relay for vishal.bala.nps@gmail.com/20261111
 with auth_id=1486
X-Original-From: Vishal Balasubramanian <vishal.bala.nps@gmail.com>
Reply-To: vishal.bala.nps@gmail.com

This series adds initial support for the Samsung Galaxy Tab S7 FE LTE
(SM-T735), a tablet based on the Qualcomm SM7225 SoC.

Supported in this initial version:
- Display via simple-framebuffer
- Volume keys and power button
- UFS and microSD
- USB
- Wi-Fi and Bluetooth (WCN3991)
- ADSP, CDSP and modem, including mobile data

Signed-off-by: Vishal Balasubramanian <vishal.bala.nps@gmail.com>
---
Changes in v2:
- Add cover letter (v1 was sent without one)
- Set PMK8350_SID to 6 and disable pmk8350_pon (Sashiko)
- Fix swapped vdda-phy/vdda-pll supplies on usb_1_qmpphy (Sashiko)
- Drop unresolvable stdout-path and unused cells from /chosen (Sashiko)
- Use cont_splash_memory for the framebuffer instead of a duplicate region (Sashiko)
- Add sd-cd pin configuration for gpio94 (Sashiko)
- Drop IPA properties already set in sm6350.dtsi (Sashiko)
- Rename knox_reserved to fastuh_mem (Sashiko)
- Link to v1: https://lore.kernel.org/r/20261111-master-v1-0-07b4f06a9dd5@gmail.com

---
Vishal Balasubramanian (2):
      dt-bindings: arm: qcom: Add Samsung Galaxy Tab S7 FE LTE
      arm64: dts: qcom: sm7225: Add Samsung Galaxy Tab S7 FE LTE

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/sm7225-samsung-gts7xllite.dts    | 586 +++++++++++++++++++++
 3 files changed, 588 insertions(+)
---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261111-master-74b35c90f44c

Best regards,
-- 
Vishal Balasubramanian <vishal.bala.nps@gmail.com>


