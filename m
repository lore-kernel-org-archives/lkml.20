Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793217871;
	b=R26ch6cCVi92Uffp9J0YFKajG6cVqka1xUvKuubKEbOe+8sDAh5GTN05kwcxaPUMyyoP
	 EQWD4AYJo6PPz3aZc7xvLqEgnxZuVK6EfViAjZlnV3OJPvNFjfivRsdlvC6YTlh0/kCde
	 1HWzo1hkHkUkfxkcGrtFoeOBF9QCy3pEYZ2g1boK48l979yW1CHnshHfI1KU+v5LWhQd7
	 oxRhV4Ir45e8KeaRKasDsQ3mH+NzzI7OjwtRnK6W0zL0/EoQ3z+hqQHiMuC3/4HqzL12V
	 BwG072TXu7JCYcowngYSXEmYZKIV4L3ze2tbCFzbw1mngunK+chSTmatu3ZiSrYD8Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217871;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=SGDetuO0OqcT+HQCVV6xC4DqA2UxKjLBOtzXYJVxwnU=;
	b=vLSTn3rSvDDlOY2z/RtghRVmcohXkx6/Km/mqwYyMe7MVVkb+zJ/bkCa4Q0jKtpVpcyi
	 QjhAYlyH2+5dblUfJSGcgbHOojJIxLTMxQz5Jz6jcYATNPIuyD/eDAFvjF8vADQD2FpI+
	 /sQst6KNK3IyA8Y/dUi+SZEp9HwoQKe8keFmjE1RT1hr8ApoGuGuBBPlbHv29Xlq6yr8g
	 F53xrc96TWwoR+rzIyeQqlIwxN00wwhh5Vt65ukaB9aWVgzmdXfP+XgYX08noBFF9pvj1
	 IZGUS7Ecv5aTgNdrICWBTl1Ch2A5rLR232dTAOAabsN1zv0YjBR2Xxs3MUoOgEBaGmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LSKW56r2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2287E606A31A;
	Wed, 28 Oct 2026 20:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LSKW56r2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85171F01825;
	Wed, 28 Oct 2026 20:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793217870;
	bh=SGDetuO0OqcT+HQCVV6xC4DqA2UxKjLBOtzXYJVxwnU=;
	h=From:Subject:Date:To:Cc;
	b=LSKW56r2ShHKsKPldipIjerdg9/d/CpJ/e4r+9XMCehFR03z/G6mJpbpiELVqSnl7
	 lGcRaV3KKLGKOu6egbGikHRvN3r+3VEy3oUMmIdyiQmy1nkyyvcdPqPVlUZ/xOxyr3
	 7YqQUNCcFRb0ksRgQVfHFWD8Zquc5bhOtuKuT2AKX3tqI34QrVoWoeDcN+u/OZVPiC
	 riCWYLiJiW1RHMAYzZv9p+GLPPxJ4LCGdPiOi6zk4v0T4VLrC+0QkyhKgvESgkoS49
	 /5uk+/a0OrQ6WO5/GyUAEE0bnrjNUbaIuUhQDuYfebayPLzXarL9Xx2m3exoPVJCd6
	 dUmx8AoUNoJgQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/3] Commonize Glymur regulator settings for fixed rails
Date: Wed, 28 Oct 2026 21:04:23 +0100
Message-Id: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDVhGiKuIiK0g7HQpoNIxN0Vy
 7f4/wKhwCRQJxcEOljYrRF5moCZ+3UixTYaMMMyz7BSm/NslLDvjBtUWdhRayzIYgWx8YFGPr9
 f0/6WfVjIbO8E7vsBbiO5y3EAAAA=
X-Change-ID: 20261028-topic-sip_cob-65df3325ed28
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793217867; l=1660;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=H2f1uYZOwceNe+Djv3FtY7/UU9dMEtaQ3u9+gl9bQ54=;
 b=zElpayfqVAu9w9IoXLCbJ5o5+PqHhXRbQQ6ho2whxW3wSY+lNWSzJWYSH6ReWDAJ7msxnsnkP
 fy7nzz2DZhFDAR7G4HBbQ+ccJO7NlLPSWTFRElg2QWsx2r3jTZzSyWG
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Certain rails are predefined and will ALWAYS have to be the same for a
given PMIC configuration (due to electrical and other requirements).
Factor these out to remove a layer of pain when creating DTs and let
one have a better way to reason about the settings across the platform.

Glymur-SiP will be the next target after/if this is accepted

Compile-tested only

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (3):
      arm64: dts: qcom: Unify Glymur/Mahua regulator handles
      arm64: dts: qcom: Consolidate Glymur CoB power grid
      arm64: dts: qcom: glymur-crd: Drop L4F0

 .../dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts  | 235 +-----------
 .../dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts  | 232 ++++++------
 arch/arm64/boot/dts/qcom/glymur-cob.dtsi           | 310 ++++++++++++++++
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  29 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           | 395 +++++---------------
 .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 224 +----------
 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts    | 333 +++--------------
 arch/arm64/boot/dts/qcom/glymur-qcb.dts            | 330 +++--------------
 arch/arm64/boot/dts/qcom/mahua-crd.dts             |  29 +-
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 408 ++++-----------------
 arch/arm64/boot/dts/qcom/mahua.dtsi                |   2 +-
 11 files changed, 740 insertions(+), 1787 deletions(-)
---
base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
change-id: 20261028-topic-sip_cob-65df3325ed28

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

