Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357569;
	b=cqNP0wNXie5Pfd4JWDgUcMf49nvZtFPAppfxSJN5+3qQs5oEYn7/OZyv0Lral8Qed3He
	 29Rt0u/uzYxemtCB7ZtR5ZjessTS/9Don5jyPlm1LJYO3ukOAicILOrlQUbZVGJihmtln
	 9PxxxtErKZ1n3AHtrasZvkdPj0OcnyqLewcb6MDuII0Ep9nvZFSlR/jJN+VUqCGA70Oll
	 ppCR6nK+0gna2BhSz7o00q7iNX0y7eeCrBlsnQ0WBHGDmgFn4R8RIizhdHLTaNeteFxnO
	 uPHsiixliM6Of8oBejsja/3QVkOkec3elvvd8tVGZ1K/dU0DbT46XPv2TzXmRmq5KDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357569;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=VWWIKenWYGAvFi1WPCrXVd8dBP5bg662+zHZf9OO99A=;
	b=bHjm3BeIYPfnq3PNS8ckr5VjdY+tAGXnEyypW6A7fKVfjb88Ywe0a5gBc8W9oAYrEuao
	 r570k0URDky7xuIr+oZwZVEkHD11QQVI6xhcgsOXM32eJYc2zxXygZWjwKK4fcZyCredJ
	 diqqSA6v/X3dgTfZYUcup+/lFSugmHVA4nEtIcwcBgO2bgNYBtPdJHtDcSmQCAfnCPkng
	 mvd3Xtap7RRfLlh3AUNe+1kIFTXRvgwuzgRrVbZfrAV1sQOakA+Es4kkff9I8XhbC9iV7
	 KOZFJ3KewxxhvDXJmxONhXOQRIa1HCeAt02z1hYjIPHmbsih4h1rGgNHYFUHKIgRKZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TDJDFZD6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAB9606B973;
	Fri, 30 Oct 2026 10:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TDJDFZD6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28DF61F00A02;
	Fri, 30 Oct 2026 10:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793357569;
	bh=VWWIKenWYGAvFi1WPCrXVd8dBP5bg662+zHZf9OO99A=;
	h=From:Subject:Date:To:Cc;
	b=TDJDFZD6fUIoHeoy4y+TlzMzz8/kIdhYIS5yHqL1cih++U2j0vJYwGlNR8xSWH0aC
	 4zGq4U1E/56V+G6IPhL+aK4B+28ePkqGrheN2jivlpIHZNGmUU4U98Le8KzwAR0sJa
	 Z5aK29K2EPA0ER7H/vRoEU2Ar2iUpOEXJZema6W05bMwV2JCH5R3w/1x5PpfMiN4NE
	 k+cvcHxbFNflUAF5UQUkV1I0HLMI1F+msSaiLDU0cRudHB5FCyOPWR4J+VUH7b7Jgx
	 xp0JYJ02KXy6vK/bcSs0hTU3IUVwWUij/xi+Oy7VJ6BHiCgDOrRCDhIdV237X7KV+I
	 GvXtcQlHNY2+A==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/3] Commonize Glymur regulator settings for fixed rails
Date: Fri, 30 Oct 2026 11:52:32 +0100
Message-Id: <20261030-topic-sip_cob-v2-0-159e29e97c82@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CMBBEf4Xs2ZJSBIkn/8MQ05ZF1gjFLjQaw
 r9b8OxlkpfMvFmA0RMynJMFPAZickMEdUjAdnq4o6AmMiipykyqSkxuJCuYxpt1RpRF0+a5KrB
 RFcTN6LGl9+671j/m2TzQTptka3TEk/Of/TBkW++fO2RCikpqU57kUVudXxxz+pr107q+T2NAv
 a7rF9FRsPDDAAAA
X-Change-ID: 20261028-topic-sip_cob-65df3325ed28
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>, 
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793357562; l=2739;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=/mq2+qwGS+4I+uenrleeNKcBCJBnJ5xIMJRRsK8gdGM=;
 b=RJCbe3pEt3Nn7k7gBvqLb+V2JjCkkeFONnpZIQlaxgFJ57ibBQtRvsGpSnAnadiVHZASGFikS
 nGAfx6Lag02DKsopkVv2VpMYd+j06TdYWklcNPNXwQVqXWd8mj9tMRL
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
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

---
Konrad Dybcio (3):
      arm64: dts: qcom: Unify Glymur/Mahua regulator handles
      arm64: dts: qcom: Consolidate Glymur CoB power grid
      arm64: dts: qcom: glymur: Drop L4F0

 .../dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts  | 236 +-----------
 .../dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts  | 232 ++++++------
 arch/arm64/boot/dts/qcom/glymur-cob.dtsi           | 311 ++++++++++++++++
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  30 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           | 395 +++++---------------
 .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 225 +----------
 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts    | 328 +++-------------
 arch/arm64/boot/dts/qcom/glymur-qcb.dts            |  22 +-
 arch/arm64/boot/dts/qcom/glymur-qcb.dtsi           | 305 +++------------
 arch/arm64/boot/dts/qcom/mahua-crd.dts             |  27 +-
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 412 ++++-----------------
 arch/arm64/boot/dts/qcom/mahua-qcb.dts             |  34 +-
 arch/arm64/boot/dts/qcom/mahua.dtsi                |  29 +-
 13 files changed, 745 insertions(+), 1841 deletions(-)
---
base-commit: d2f52f33c6c98b2c9c9b763de84c5e0875bcbce3
change-id: 20261028-topic-sip_cob-65df3325ed28

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

