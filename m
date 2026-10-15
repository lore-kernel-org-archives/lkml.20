Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4601446066;
	Thu, 15 Oct 2026 09:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.251.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055028; cv=none; b=QF97EUKggwhwfXz3R8rCo/2auL2m+gN3/Wetj5A18cfqfEKNySi6SMDCoCE1iV97waGqUZWr2Vgnj5wa7IGy8UdYg0ke92Ce1LeYnWg+bCIPr85NX0TTgh3Cs66JrWeNv0ymzwsQBYvfD+6De3N6Vkijrko1LVPhvhCcLWHjFB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055028; c=relaxed/simple;
	bh=nfW463iS39OcXMk0BFD5ncJCzs2x1uUmGlp9Vf50HwU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ahYKk147lAf0De4c8AePIF2vBDlm6wtcyxdVt8/sKhWYoMMoU4U1lf70fkplgqJvhKX9CcsrNge9SMGooLloo+SvoWfT1/vnjHJmE4Btq/oLa5CiB17heDhzUD7TFgTf7siW44p/ZoBZ7by934gfIYWhVFDikar7CXP2dUj2bZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net; spf=pass smtp.mailfrom=fhannenheim.net; dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b=KLs3aO0/; arc=none smtp.client-ip=188.245.251.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b="KLs3aO0/"
From: Frieder Hannenheim <git@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1792054682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eGRpZJBqdOwXw3LlAmdtItXl+llUR8M2qznkzrrhFX4=;
	b=KLs3aO0/mTJB7TlFmIEw/TqslH/vrRSBHCmOzsz6sxSOVR9JsXWjefPY4iF5XYdv+NQnVx
	zfabjzZFUPWzhUcRG2I0tsuOvwivEb17s3troKpQosydmdPRhLAswaxmPS83mkAiv2W+9L
	3pOJgIHXr+qiWUUkgRLjZVdqZ3Wb0NY=
Subject: [PATCH 0/2] Add OnePlus 8T
Date: Thu, 15 Oct 2026 10:57:25 +0200
Message-Id: <20261015-kebab_dts-v1-0-1fee1204a18b@fhannenheim.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHWV0GoC/yXM0QpAMBSA4VfRubbaaCteRZLNGYdCO0jJuxsuv
 /r7L2AMhAxlckHAg5iWOUKlCbihnXsU1EVDJjOjpNJiQtvapttYeJX7whiNhXcQ+zWgp/N7VfV
 v3u2IbnsHcN8PZfP2cW0AAAA=
X-Change-ID: 20261015-kebab_dts-f13f9665e9fc
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>, 
 =?utf-8?q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>, 
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frieder Hannenheim <git@fhannenheim.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=927; i=git@fhannenheim.net;
 h=from:subject:message-id; bh=nfW463iS39OcXMk0BFD5ncJCzs2x1uUmGlp9Vf50HwU=;
 b=owGbwMvMwCWWw1h8YvtkuWDG02pJDFkXpjaVPmErnjht5WUrTh7e1Hu73+6Sfc8mWnHUwajEJ
 tvtytWwjlIWBjEuBlkxRRbn6ZI/7CuFdfTD/ynCzGFlAhnCwMUpABPJesrw3/O8oJ9J+pGjdV8X
 XJpxN3Fz8tTs08EZSiUVJ5Sb9TlWcjL803Td4/m0eNr7Wn6zWZmin2TdX+lZ/Zl16+N1r2SGOxF
 vuQE=
X-Developer-Key: i=git@fhannenheim.net; a=openpgp;
 fpr=439719F83F79132C2F57FE216C0173C8B7931E53

Adds a basic device tree for the OnePlus 8T (kebab). Common
values for OnePlus devices using the sm8250 SOC are defined in
sm8250-oneplus-common.

This basic device tree brings up a framebuffer, UFS, battery monitoring,
volume keys and UART. Further functionality will be brought up in
subsequent patch sets.

Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
---
Frieder Hannenheim (2):
      arm64: dts: qcom: Add sm8250-oneplus-common.dtsi
      arm64: dts: qcom: oneplus-kebab: new device

 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi | 618 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts  | 124 +++++
 3 files changed, 743 insertions(+)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20261015-kebab_dts-f13f9665e9fc

Best regards,
--  
Frieder Hannenheim <git@fhannenheim.net>

