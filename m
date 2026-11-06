Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957353;
	b=QC9ktiC/wGAupA+kLpRUSEKS1iSdHKg8pvT3MUKMHFiaB++FipD9UZxQ205/lRmbrfdj
	 OboAerCj0ZtQpH7XuPwuCQz3PZCr8QVIo32Qq0lAcxFg9kt/MSPe2QkuiQwH24oivmU6f
	 SENFd6yOjrjw9AaeNiKu3hLqgT/1WtHhymSNfk+fhI5VEWAzXHgdb9c4T6C/5P4ofl7F+
	 BN/AIKV80nMkiueJr3DirPWJ3UPGWyDLHvHLEHTWe0BCquSunoVUUvVcBsgCXQb8b2kyc
	 OOgPS8O/PsZhSIfStPLNtYzsgUpcvwne+htVNI0h01E8H8s1ExpY8e7f8+i/XW3AmAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957353;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=zfbxeYdI31iwNJOEXfTUaItVeY5T7kuVbbS50caxSFE=;
	b=ri86nhfLGxnkEwKHmyo/rKRbD2VIE2/Q9dQsH8OrhCm5QuRbA1W9nxwVYu1caQYkMG0U
	 kTYkwf2pT6YIEgdtD08aw/de97ImAbMde4uWVkBJy95WIDoTJ0FdDPGiV2lPhL2JJ7ylX
	 vZnQCAGggyxsJQ6J1Kcaft27ZrVWj7UFj/GqToYxbCNEZH1b9o5EIsdkITZfDMppXaKw5
	 pVH80bY1mXQwrdPRrR5gUW8/UQ3uEu7YNhFHOZZ7ddNqaTQKnx4oGEXB0ueUY0n7b1IgL
	 xyja3Dp5sfwXrvDQh6BoKKVrDrz2UzVCgHtx95ulb+pExUsk6wJdNFSUIsJsRw1gyaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ag3RIJVf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130EB606A326;
	Fri,  6 Nov 2026 09:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ag3RIJVf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 521E81F0089F;
	Fri,  6 Nov 2026 09:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957352;
	bh=zfbxeYdI31iwNJOEXfTUaItVeY5T7kuVbbS50caxSFE=;
	h=From:Subject:Date:To:Cc;
	b=Ag3RIJVfaWCeshVxA6v5c4WRyu8cDeNi0XVy4KeKwViqwDQPGwu155j+iH1fdshLF
	 gz8VX7ppNkeWHcOYRC6bFRXxlL7+ktMFqGRDvGyr5d0ERQSbMbtxNpMBR6TiNHy2Fl
	 es9mrxyOgHbfKaJFC5p+Cxk8wHqWeQJcd/Dwj88VSJfgloVw9J4cSDjMoDW39o7EMz
	 CMCSDsGi99N9d2Y954sn/ZQTeW4NAFpICK4Wc98TAAoqyD3YPmYkmFM5zw5E3qhr5h
	 J8/D0s714vRe30aOe7tzN/1Jf7snSuynTUvSasnoLllEzwFLDIKU0SPHY8Q5HpfWhR
	 TdnAQwuoiYmrQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v3 0/8] Commonize Glymur regulator settings for fixed rails
Date: Fri, 06 Nov 2026 10:29:01 +0100
Message-Id: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNQQ6CMBAF0KuYri0pU4HiynsYY0oZpEYottBoC
 He3xY0xupnkJ3/en4lDq9GR/WYmFr122vQh8O2GqFb2F6S6DpkAgzxlIOhoBq2o08NZmYrmWd1
 wDhnWIEj4GSw2+rF6x9M7u6m6ohojEhutdqOxz3XQp7H3z/YpZVQwWeUF20kl+cE4l9wneVOm6
 5JwSJzw8IFw9o1AQNKsRCixLJSAH8iyLC8rGYLlCAEAAA==
X-Change-ID: 20261028-topic-sip_cob-65df3325ed28
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>, 
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
 Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>, 
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793957347; l=3984;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=i8NYw4fnhzuaJtMa6ToNTldRAPb4HEjfZRoKZJuNyrc=;
 b=1Opw1a7XvB+sfTT1AhXgN1WC/3PTtaeMX+28wWt885dlSeR8zBdUgZNynCH40aXCYA9gqhoBa
 zNzDNlNHy83CnJSRFgPWX+43Qcw/y8gVd7cShP1QLVfvLAygPhRGIW+
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Certain rails are predefined and will ALWAYS have to be the same for a
given PMIC configuration (due to electrical and other requirements).
Factor these out to remove a layer of pain when creating DTs and let
one have a better way to reason about the settings across the platform.

Glymur-SiP will be the next target after/if this is accepted

Depends on the (reviewed and awaiting merge) Mahua QCB series:
https://lore.kernel.org/all/20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com/

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v3:
- Rebase on next-20261105
- Pick up t-b
- Add SiP commonization and SiP CRD DT. I realize this extends the
  scope of the series but I believe all the changes are pretty
  straightforward and any subset may be picked up)
- Commonize the overlooked pcie3_phy supplies as well
- Link to v2: https://patch.msgid.link/20261030-topic-sip_cob-v2-0-159e29e97c82@oss.qualcomm.com

Changes in v2:
- Fix regulator ranges, boot test on glymur-crd-cob now
- Streamline Mahua setup (all Mahuas are CoB)
- Fix leftovers (Sashiko)
- Remove L4F0 from all Glymur/Mahua DTs
- Rebase on the Mahua QCB patchset
- Drop reviews from p1/p2 due to an invasive rebase
- Link to v1: https://patch.msgid.link/20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

---
Konrad Dybcio (8):
      arm64: dts: qcom: Unify Glymur/Mahua regulator handles
      arm64: dts: qcom: Consolidate Glymur CoB power grid
      arm64: dts: qcom: glymur: Drop L4F0
      arm64: dts: qcom: glymur-crd: Fix L8B0 voltage
      dt-bindings: arm: qcom: Add Glymur SIP CRD
      arm64: dts: qcom: Consolidate Glymur SiP power grid
      arm64: dts: qcom: glymur-crd: Move DP0/DP1 to common dtsi
      arm64: dts: qcom: Add Glymur SiP CRD

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts  | 242 +-----------
 .../dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts  | 362 +++---------------
 arch/arm64/boot/dts/qcom/glymur-cob.dtsi           | 319 ++++++++++++++++
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  46 +--
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           | 411 +++++---------------
 .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 225 +----------
 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts    | 328 +++-------------
 arch/arm64/boot/dts/qcom/glymur-qcb.dts            |  22 +-
 arch/arm64/boot/dts/qcom/glymur-qcb.dtsi           | 305 +++------------
 arch/arm64/boot/dts/qcom/glymur-sip-crd.dts        |  14 +
 arch/arm64/boot/dts/qcom/glymur-sip.dtsi           | 304 +++++++++++++++
 arch/arm64/boot/dts/qcom/mahua-crd.dts             |  27 +-
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 412 ++++-----------------
 arch/arm64/boot/dts/qcom/mahua-qcb.dts             |  34 +-
 arch/arm64/boot/dts/qcom/mahua.dtsi                |  29 +-
 17 files changed, 1029 insertions(+), 2053 deletions(-)
---
base-commit: dde2e8a7cd2a498c5e0624b80cc97d34b517d602
change-id: 20261028-topic-sip_cob-65df3325ed28

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

