Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1A14854E6;
	Thu, 24 Sep 2026 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256171; cv=none; b=AHIJZxAtM7HieKPbW+aZIJbqBrAgsT/yqBPELrg2lyjD5BBqGDoXuT/K5/HOP6jMa1vmsLu+GUEtb/gL2CEOLfGrI3JWTdrIumSx40EZHFGeojfyhgGQh+IIW8mpKtPCh1Szp9AGm2JNpE/XI9omYfK/2Rsi5H5UEVYaQyEyqMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256171; c=relaxed/simple;
	bh=Av2FYaVaDd1JBZFAXqH2sO2sXPEwc0QKlMWYTmIJAg8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WzmsCY99KiaKDtureAlDkKcBfc30+n4M/sxO2pYFiEk3BwCzKWF2lr/NxkqoWuCATlEMAZwWi3Gfoc5j31HCe9u7jDXL/CMkrsYMmP5fLqgCmTBYxmDQkaemAZyOr8ZwCR0UEHP69uD5FrWKOf9J/K88lwGz3OnxxD0XG2Xe48I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=LbcviaqS; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="LbcviaqS"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1790256153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i73iHN07Xn5dbQ15hrDEY+QFRLYirRH7hxrF8MHF8eQ=;
	b=LbcviaqSxqHSmF7WPlr5Qub3WMBvHwWqUNfXcyzATsTziknRRpIqWEuTM3wTkwgIwHE5pw
	s2tf69q9DiEH3xk8Px9Wa6XxcJXmR+77e9W3XZFtGU4c4ofPcMaFv1gDeTHu3Shdct3JBA
	FQs7NhKf+y5zK55C5uH3Cl4XXP65EDk=
Subject: [PATCH 0/3] arm64: dts: apple: dt-check-style strict fixes for
 Apple M4
Date: Thu, 24 Sep 2026 15:22:22 +0200
Message-Id: <20260924-apple-dts-m4-dt-style-check-v1-0-3ec651d75baf@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CQAxA4auQrm0yTAg6XsW4wE6R+oOT6WAgh
 LtbdfXybd4KyllY4VitkPktKq/RUO8qoKEbr4wSzeCdb13wDXYpPRhjUXw2FtSymGlgumPLdR8
 iBX9we7BDytzL/Lufzn/rdLkxle8Stu0D3tQgyn8AAAA=
X-Change-ID: 20260924-apple-dts-m4-dt-style-check-6e1f9dc92807
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>

Hi,

mirroring recent changes to the M3 and M3 Pro/Max/Ultra device trees,
this makes the M4 device trees broadly compliant with
`dt-check-style --mode=strict`, leaving the same exceptions:

- line-length errors up to 82 columns are left as-is
- cache-related properties are left out of order to preserve human
  readability
- the property-order and line-length issues in the generated pmgr nodes
  are left as-is

I checked carefully that the modifications do not cause any functional
change in the compiled DTs.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
Yureka Lilian (3):
      dts: apple: t8132: Fix blank-lines-related dt-check-style issues
      dts: apple: t8132: Fix ordering-related dt-check-style issues
      dts: apple: t8132: Fix some line-length-related dt-check-style issues

 arch/arm64/boot/dts/apple/t8132-j604.dts  |   9 +-
 arch/arm64/boot/dts/apple/t8132-j713.dts  |   9 +-
 arch/arm64/boot/dts/apple/t8132-j715.dts  |   9 +-
 arch/arm64/boot/dts/apple/t8132-jxxx.dtsi |   8 +-
 arch/arm64/boot/dts/apple/t8132.dtsi      | 210 +++++++++++++++++-------------
 5 files changed, 142 insertions(+), 103 deletions(-)
---
base-commit: eea4f3b5e9e19389af3b99af64cdf7352b67c298
change-id: 20260924-apple-dts-m4-dt-style-check-6e1f9dc92807

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>

