Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984AE4B1261;
	Thu,  3 Sep 2026 13:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443992; cv=none; b=rdC6s8GA1+vaFADY2lgtKs3oyHVAVv1/fGhjIpP9MUb+VfLzYYrJ/1SMJD7BVN/yS18H71Re4BY/glAEzvCVVtdWQDOi2y/GMe2uRt+cZJ06fl0CMl93BKhpJIMNv/JvFBaDVndz6eqN/MoueaDtZM/TfsszNCOnJ9LnDhadkxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443992; c=relaxed/simple;
	bh=I8Gyi+isa/p1O2wNWeROvhfqx8xw+u0txi6tLoZTgaQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WTYQy+SMMnKiLPpt2vLSa6yj7XFPa/p93M0B5YDSD2hl5eCNDag+9b8v9RkkFfWYGpRcywfFKqWUoM3LySaWvbTSA0DL25oHEjXyzd//AZIR2Zsw7oyOZWgAbtKGkpBnuABpnWFQFFAgfHJDo8+7CeGOO8dNQMfX/1ditDzSeco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=fBVcwxLD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pRp4FOBz; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="fBVcwxLD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pRp4FOBz"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id CEC80EC035E;
	Thu,  3 Sep 2026 09:59:34 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 03 Sep 2026 09:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1788443974; x=1788530374; bh=Dt
	TW1L9CteYH31Afl0XmISOi/CVI+FNzcOwRvC8l1k0=; b=fBVcwxLDlK5CO5P5iS
	A2jvf/ucOLhZQ3UMEJvIbL98vDmxIIP7RxkbBia42vL3OFrj/aiC2zI9wbH8YCpf
	GUjxdBNXVEUbSwDYw8Ec5cgXfuXNrYofQEcTkELYk80c62vOOupCxa8+EhFvGgRX
	jkKqGO4UiG2irKSZGmj0oe/XWGt7GCNQmDMpVdelSh/bUBaBZC8P1LeEQYiGj12g
	2NytmVBs5Xow3SKrLwmWKNP9nYGnN2FyBjlPEjSXKwzpyDS4aG6sKYBNUVBVpBqq
	NZjIqt43AU8Lpg7CJ76CCIhBQa4hWKSnWJ2hnFFbaU/wsdcWoZ4uJe7rX39cdCiI
	i5rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1788443974; x=1788530374; bh=DtTW1L9CteYH31Afl0XmISOi/CVI
	+FNzcOwRvC8l1k0=; b=pRp4FOBzSHxr23+Mc59tQff6FHBmFntR3EgqKZSv/XOl
	T9kZ3VaqqWkL0mE3z36gChEADWWwhiGzkrE0ZA0ePQYHTLBwKonImkFNhTG36hm+
	9r0iEZ0X+FvlslfV9ewbx42pM8av9Th1Q7GTeJox4UEGkvdzyeHMBK5mgn4eo5lC
	6U11WhwWPgQSyRS61EB8ZVLEMA/tY3mxxqSnLfPzoQBMeg2lX67OFONrzL0cH4tl
	+3k1w1s6zH+BHBdrT2MASzRHAuo5yppEQtbZGdEfipGK/hkFMRqKUXdDBR6jMq65
	eYg50/3wom2O/3mklg3BIzp1KxC894qKu1wVA4oyAA==
X-ME-Sender: <xms:Rn2ZagW3OPgjvxuwSgCXMsCHmoUagTBEdfyv9E-4t8-Z9_4N0X0Zhw>
    <xme:Rn2ZagbWYXDMbC1Y7XYlY19W5P8fV4ZnpFdqL8V9rjaavJdAGYncpnXslqjhgEXHk
    pJEESuehANyxJ2eZW9Sdo7lqbnyGg8s2jonZBDZjl13c_IHo0Y6ZUB9>
X-ME-Received: <xmr:Rn2Zavy9ygk5xxqxr0TZEJh4GckgR8n4_UXemMGtuBMncltZFiQ0uYM0FmcYEWpiAIuxICuzZMyRFDKp9bYNcTusmVkbW9KH8dLK2Q>
X-ME-Proxy-Cause: dmFkZTGzA2xEus0Ux9NLq2ASgukLUme45vhECBV0qD4rY9LY6YMcVHp+TmAWmzJEYZPlqE
    /Bj2TASFACbeo4vHchm0M1fcb6ISBLnjUCtTM0/dbphHSSA7Ei9/0xo8RJoESuKHGYcrmL
    jhd3iPrgMhqerCqFXiKSO2EVgL72BaApgAQ/cWISRsqHEV7QkVc3wB9kJ+bZzJHUub1JTz
    smDC1gS1Xg4PMpMxw1XVj2u/qYApAg/pMnr/4dqMjhJ1vGXTxkyj2+UzyeMMX+mUe6FvN4
    XLTViPbw2UTeWgp+1Lv3NhL9N7G4HEtziybuIcIi3n+IUYYf0T/NekBvltfrq2y4BCT0ZB
    vTJLFk954C/TRrp0Bw2QPcXxywnoEiBv3/bgws0LVCkZu67dFazBgVnMSx3oegrZTTgYYv
    9E0GqAlJQkTxewWIY2dq119SOBYCx9K7f+DU37bXYDPqAdFNGu29pB6p8Qmfq+TG3erKok
    +kiRywlv0+jItuGRteGK4hGMjloRlxkhwPz9hqfgKwii8pDi/UYPbu3Py7PGIW+5BiIid2
    UrOuzBCuZi9D5qa397kybCTNDTMV5vZk8d6zCQIkGfolEXDWtMflEZyyC2MroGiaNztFpF
    ck3XZuRNI37bbaZ/Dkm0bH9+V1u6JI2gNf3U5wLQ7kzmeWafqWYKECNnGtCg
X-ME-Proxy: <xmx:Rn2Zao2JATHnXi-2t8_87SGLyG24iwxOirgly6CA-rIxFwe_S9QceQ>
    <xmx:Rn2ZaonVwpntQAax7ZGPtnawEKcSa_xkJsMJoSBdCN7g6Ng5HOc9SQ>
    <xmx:Rn2Zav_SGFcKgjfonsB9Sgh2odQ13zDMDBjbCVEiacQawB1cc2LpUQ>
    <xmx:Rn2ZamL-z9G-ur3mYQmvAUzUR5uttBwx8WFKJfhblouDwjp5z2y-lg>
    <xmx:Rn2ZaqShLOWRsL1QkEe61awT9EAW8WfVEySO_5Bx8DgW9y9pygsgsprK>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Sep 2026 09:59:33 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH 0/3] Fix dt-style-check issues in Apple silicon multi die
 .dtsi
Date: Thu, 03 Sep 2026 15:59:31 +0200
Message-Id: <20260903-apple-soc-multi-die-style-v1-0-eeb05ea0c187@jannau.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MywqEMAyF4VeRrA20AYvOqwwutKYa8FJaZ1DEd
 ze4/H4454LMSTjDp7gg8V+ybKvClgX4qVtHRhnUQIacaYzFLsaZMW8el9+8Cw6i2k9tjqqeqLY
 huBp0HxMHOd7vb3vfDxMxJ8JrAAAA
X-Change-ID: 20260901-apple-soc-multi-die-style-625b2281ff68
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=I8Gyi+isa/p1O2wNWeROvhfqx8xw+u0txi6tLoZTgaQ=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyZtc6XQ+WE49WcGjYdWrjtRWVPRp5ug+acYJ1rlWu39
 WbeD0nsKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMBGxDob/vv/VXxhk367eVLjy
 k5DFY6Uj77x2pWuzv73eZp95eovJG4b/PopeW3RfOid1C52qOhoQd7Z70YY7ipuWTL3Zcj/50kt
 lZgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The MMIO nodes in t60{0x,2x,31}-{die0,dieX,nvme}.dtsi are indented by
one level to signify that included at this level. This looks weird by
itself and dt-style-check comaplains about it. This can be fixed by
moving the referenced soc nodes into these .dtsi files. Since the parent
soc node varies add a preprocessor define for them. The multi die .dtsi
files already depend on the preprocessor. Suggested by Krzysztof
Kozlowski in [1].

1: https://lore.kernel.org/asahi/e2365307-32d6-4ef9-9919-55ba69786741@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
Janne Grunau (3):
      arm64: dts: apple: Fix style issues for t600x multi die .dtsi
      arm64: dts: apple: Fix style issues for t602x multi die .dtsi
      arm64: dts: apple: Fix style issues for t6031 multi die .dtsi

 arch/arm64/boot/dts/apple/t6001.dtsi      | 11 +++++------
 arch/arm64/boot/dts/apple/t6002.dtsi      | 18 ++++++++----------
 arch/arm64/boot/dts/apple/t600x-die0.dtsi |  3 ++-
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t600x-nvme.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t6021.dtsi      | 10 ++++------
 arch/arm64/boot/dts/apple/t6022.dtsi      | 18 ++++++++----------
 arch/arm64/boot/dts/apple/t602x-die0.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t602x-nvme.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t6031-die0.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t6031-dieX.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t6031.dtsi      |  9 ++++-----
 arch/arm64/boot/dts/apple/t6032.dtsi      | 16 +++++++---------
 14 files changed, 52 insertions(+), 47 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260901-apple-soc-multi-die-style-625b2281ff68

Best regards,
-- 
Janne Grunau <j@jannau.net>

