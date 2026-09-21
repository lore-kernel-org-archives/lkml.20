Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AECF4ED1BC;
	Mon, 21 Sep 2026 17:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790012600; cv=none; b=a4IZ2CGmEllJFkbBnybUyJfmGN3cyucz8dZiqSg3soHRC1KZU6wuAIb5KIsxTNMMDIE/KYMAnNnvTf5XRvxLQyaOUcpC9xJ6iMcNOklXXgTb+IyHRWgNIwOLI9IQwi/3LdHwbbSGqL2tgY6Z8eHr5kQW/1ySvRNqCEmrzgFEdxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790012600; c=relaxed/simple;
	bh=KIzzLa/gCuw6u1EbRXAevoHMkfppleN2Sg1j94SnK7U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lQEwQtyTg/uDPm/1T0da+aLCr233qF5PX4zUVP2NaRz0T/ozBoVXlWC6z7wxyBmvLNHcG9EJUcpwDZv76flraHoYYv1HUMB0Rzrx2gC6J57l1AQtCxdbWpk7DPdejT5MTeAFBRxx6ok2yPMMe9RT6BLKjB76iOIaA28utZcn+D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=eCo3X5eG; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ZcsTgzt7; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="eCo3X5eG";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ZcsTgzt7"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1790012585; bh=9nlt/v+5BGiqagfS4hkV6cX
	7ZGFh4+G7QsC01EyH3PQ=; b=eCo3X5eGei6V7qT+k8v0M5lqSC6VavFyuLf+CmHSitEiCDB/8E
	/iNYwl/BXYD2J0tf2jf2tlF29+Px736NTCcDJXUDxAX4d5knqy20gKZRbeY8uUCv5FguqY1wPLb
	T/ljFp4wks+RFJKKWEiUvLLHVMBOTNm3b1/7NCL9oKA57xzTIZuw7nd9MYWApbRCauYDsJyD/Y9
	B6jJ/Iz88PeYN8fAMSczWA3aTk4djFBNbqb9AQlPLcRp/vHe0jeGGE1NHGOSOtUw/ec3zteoOA/
	9fxgOYpk4pzpbFgDAVVWPlvYgbzBNOOiiN6uraUxGpoJe1AihDufHaEFVdvRVNKRUTg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1790012585; bh=9nlt/v+5BGiqagfS4hkV6cX
	7ZGFh4+G7QsC01EyH3PQ=; b=ZcsTgzt7TLLq0WAOcTbOHhEiFKPVz2KraofDFkp5+cQzKgl6jc
	lIWmiNTmclK0np92jKZSRfz1IdgRrhMrDpDA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/4] Redmi 3S/4A/5A/GO status led and haptic
Date: Mon, 21 Sep 2026 19:43:01 +0200
Message-Id: <20260921-xiaomi-aw2013-v1-0-a0c3084076de@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMOQqAMBBA0avI1AaSKGK8ilhkGXUEFxI3EO9u1
 PIV/18Q0BMGqJILPO4UaJ4iRJqA7fXUISMXDZLLgiuh2El6HonpQ3KRMSPQFnmpUDsHsVk8tnR
 +v7r5HTYzoF3fCdz3A0DuVo1xAAAA
X-Change-ID: 20260919-xiaomi-aw2013-b1ec6489eadd
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790012584; l=1172;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=KIzzLa/gCuw6u1EbRXAevoHMkfppleN2Sg1j94SnK7U=;
 b=qmZ9T7Lxmepcz5aD6cJu+QVZ3KbKcKl6WwD9nNn/M+RqDhWMwAhtTM7iVYa8cZkCDwVdvLy2n
 XBRd4Rx6oFkAhP/ta2CBrurjOBkgmj7JPZbjFT8pm4taUyn1mCV38Uk
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Move aw2013 and gpio-vibrator node from Redmi 5A devicetree to the common
xiaomi-wingtech devicetree to support status leds on Redmi 4A and 5A
and haptic on Redmi 4A/5A and GO.

Group status leds with leds-group-multicolor driver on Redmi 3S.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Barnabás Czémán (4):
      arm64: dts: qcom: msm8917-xiaomi-wingtech: add notification led
      arm64: dts: qcom: msm8917-xiaomi-rolex: enable notification led
      arm64: dts: qcom: msm8937-xiaomi-land: group status leds
      arm64: dts: qcom: msm8917-xiaomi-wingtech: move GPIO haptic vibrator

 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts   | 30 ++++++--------------
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-rolex.dts  | 33 ++++++++++++++++++++++
 .../boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi     | 21 ++++++++++++++
 arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts   | 16 +++++++----
 4 files changed, 73 insertions(+), 27 deletions(-)
---
base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
change-id: 20260919-xiaomi-aw2013-b1ec6489eadd

Best regards,
--  
Barnabás Czémán <barnabas.czeman@mainlining.org>

