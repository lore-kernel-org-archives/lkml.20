Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACB13DC4C6;
	Wed,  9 Sep 2026 10:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949632; cv=none; b=UmGb03xmOOLYx2v2WRS637k6Afuq12qWtLL4KMEEp90jfX8YnenNUw9FLpwA/D5/82eopbkYipg8dEYYTyT7IDD1WFW5ABYaMn6tZGUkw3K+K2UvAMlHhrVTC1VB7vu0hAT4mudr7XNF9gGmaqfHEUWm2gVSPg3ne8rqf6o/48E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949632; c=relaxed/simple;
	bh=ml4ZBju4B1tq+rmMxB/b+E1KZR7TEWBug3bye3R6QM0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ihg8obb9GdAIHiIC+Jjxe7StpClDi46aNZfpShp/KO9iZQv7vq0I19P324qBxV/M8jrXKcx7xer+bNl3NI2qaudeC4UJ1V2yCzU/3Ox7o6HI+r00/AoGkNekaKFpAJfnKObhDW+pHVYa1inLLOVksVexEcitbGcToEszCr2pdPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=Px7tzLuh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LGDh2m6j; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="Px7tzLuh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LGDh2m6j"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id DD1CF1D00064;
	Wed,  9 Sep 2026 06:27:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 09 Sep 2026 06:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1788949628; x=1789036028; bh=D7
	0P5bBP7rJfC/wD9nHjID+dIb3h0sckQlDoFdS+bEI=; b=Px7tzLuh5KjvlGa5Gu
	KbeFo/yNzIfN38aYA8viwGgy2SWI4hJ/z4Z2QZna/CbsNmPDC2iVQjYqhNaUywR4
	QnXKmNy8PWBS7ex3j6c6haev83NLnB9Y73K3ndONxWTbBtv5eaWRz2xxBkv/PFqX
	JPVkLjO1z0JZu1mf4tfj8OCOzhcbrLFA71N9tHB/ZGhObjxOoy8SGWGqV5BoEJKf
	zYU9tHeuM3O8A3mqrakXTNt/jsp9k0U9Rj85As96CcHUo+yJ5TpRdC4UdKLDWRI9
	UHFJ1iY0USZKdz8kzuX1qf14qq0qPxQi7B60j5m8m7Asrzo1tYcrMQOF4nDoT10l
	CSqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1788949628; x=1789036028; bh=D70P5bBP7rJfC/wD9nHjID+dIb3h
	0sckQlDoFdS+bEI=; b=LGDh2m6jPvBSaidnHogBtFO+3bMyGlCSocgfmKwEJdEJ
	pobfgdizmB2TReo+CMK4jXINfGJOV5RslTpijBWDwESDYnM9lmpYBHMsS9w9BC0d
	l9IS4a/ztcxypmkB4IyMnOEA+wBbEwLjyKKnQdLraBMPY8kieWz0xF2YGz3wPwTy
	4OgLSt1bvUOi/nLeplNSuWyZf/iJzeehNYAj/Li+zHUWEXavA4rdGxYDMpyw3Buc
	QlaHKJL1xewCDE4HL/jZ8UiglFdSZA05HSNLMRusstalJyQgUEmYCivhOgeaeOWb
	HjGPLxHS7cd7LbOHJjbSEZJSCryFoobhAWA27elDxQ==
X-ME-Sender: <xms:fDShapPcOHOqosI9IR0TvyhU1XnIgn0ClSycfMz-6OFQRXvA1xxAfg>
    <xme:fDSharq-YIBxhrG-0ehWyOyprXehXUseuMLllXHYwlRL__m0C6vv2goOJbdMpBWXk
    AnAQ_pHmXKJZrQgJuydOYC3t7UBb9v4VX9-JkLvi6CEziTnQzbju39Stw>
X-ME-Received: <xmr:fDShaj7XfBYKRFOnCOy-Al78kxTsCWKdAyE2R0EO2nt4jjb5dGWQ7L0tG1PaU0la5C0YK9rhP83TUUzyFK10IDkBqLtkqWXOsQ3Cjw>
X-ME-Proxy-Cause: dmFkZTEf4elS+wM/oH1d+m2RM29yelr5k28FlgAMFpXVnOmPLs/wmBFdIa1odYJsNDDKoo
    fG24n5KC5Q7+pkltWM2DlWzke2+LarQxLyUIH/nNcGJJcOwbN1i5IEwV15FA2077BdCJur
    mYAjt8UdNBh9VaR+pLpELIcspaKwuO+M1AmBa/LfiDOqMGBwmbhHkRWFRwjvEN2VlDCseG
    8WW2eMEX4p423JGSmCMl79aK1yeMbD0jFviYopJvy+FqEP3X5jPxbSFHhp8v49GwH9NLXc
    5JTE3imxs5DByzPYxSmgGoxY4ztOom+x3R9s8nrHgHGENKPsd0KH1umbYiKeQezDJu5hBI
    4mZUSKnBA2gR3+aEFeCBeXIoX8m9KjWTJGmRyoFporsJ3/tYTLQPYJ4uVXB05FO7gr0tZU
    fQgsE/o7f0f7NuyO1Xpk8jZrBbIPINRGc5e/S+0t+7VNFbL5FyyG3XL4xQIte2O6Zziq5P
    RJ0FMedD3ngABRC1S0JKp1F0pazo5ECGIxaiYH5QTCJE6NeAs146PWcYmmxUYO6v95HL4j
    GXwaK0b5c2iW3kBfefMy9/8p38mgZJdZVI6YvazQrmR6k8jwVuxjbdm4aF/x5DNXtSBYQ6
    0SHP6uE0UdbhMeTZgBi2aWtcdHsXAi7fOWLquzLEgNXYFa/E0ZzidwFnQ70w
X-ME-Proxy: <xmx:fDShahid_-T_UJDhNP8WvQhsT7T67-bLwbhffQsSAUeEUVQ8k615Cw>
    <xmx:fDShah5G_sDlX8owIb5BX_JyEX-kbR2Cg3q4VX2RvzAWx1w9m-1tfg>
    <xmx:fDShauHptRblPWyLpKUh5eP71iNWkHXW1U14Tjpm6cRN244HV69eiw>
    <xmx:fDSharIlMpKBlLyugUSxFb_wOYZUkzZxUZLeTdzk835jijZkZrnVLQ>
    <xmx:fDShagIHMoDBo6Gog-nEAATz9QSDgxYIA_H5bFw1ed2qwByjzWr8NvTr>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 06:27:08 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH 00/13] dt-style-check strict fixes for Apple M3, M3
 Pro/Max/Ultra
Date: Wed, 09 Sep 2026 12:26:56 +0200
Message-Id: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqEMAxA0atI1gbaCs7Uq4iL0sYxzIyWRkQR7
 25w9Xmbf4JQYRLoqhMKbSy8zApbVxCnMH8IOanBGdcabzyGnH+EaRX8NxqU9VDHieIXjYv+ZW1
 4+5RAD7nQyPtz74frugEM2PGvbQAAAA==
X-Change-ID: 20260909-apple-dts-m3-dt-style-check-02c9711a89dd
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3432; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=ml4ZBju4B1tq+rmMxB/b+E1KZR7TEWBug3bye3R6QM0=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyFJhUTpl2WXHdrtyWTe+3OmSFTFVS0579TXiM25YHoi
 svVxh7+HaUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACZi4crwvyi7Q0tZM1r8QOS2
 i/aNe9zZX8rN99rRqvbU5uy74NdBGYwM+9dtOMG94pyAzcPwKIuAhUs+c6+5qaQ826Ql+2xf5pV
 N/AA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Hej,

this series fixes most dt-style-check issues in strict strict mode for
Apple M3 and M3 Pro, Max and Ultra device trees. These device trees are
small so fixing most of the issues helps to check that new additions do
not introduce new dt-style-check issues.

Not handled in this series are property-order and line-length issues in
t*-pmgr.dtsi. I don't expect those files to be touched often and the
diffs would be huge.
In addition it leaves line-length issues for lines with up to 82
columns.

Cache related properties for CPU nodes unfortunately do not share a
prefix so strict property-order would decrease human readability. This
series does not address property-order order for "d-cache-size" and adds
a blank line before it to keep all cache related properties grouped
together.

I verified that the series does not introduce functional changes by
comparing the preprocessed device trees with dtdiff. The diff shows only
phandle changes caused by reordering nodes.

Series based on apple-soc/dt-7.4 (commit f3f2d38a606e ("arm64: dts:
apple: Fix style issues for t6031 multi die .dtsi")).

Janne

Signed-off-by: Janne Grunau <j@jannau.net>
---
Janne Grunau (13):
      arm64: dts: apple: t603x: Fix all blank line dt-style-check issues
      arm64: dts: apple: t8122: Fix blank line related dt-style-check issues
      arm64: dts: apple: t603x: Fix child-name-order dt-style-check issues
      arm64: dts: apple: t8122: Fix child-name-order dt-style-check issues
      arm64: dts: apple: t8122: Fix child-address-order dt-style-check issues
      arm64: dts: apple: t6031: Fix continuation alignment
      arm64: dts: apple: t8122: Fix continuation alignment
      arm64: dts: apple: t6030: Fix most property-order dt-style-check issues
      arm64: dts: apple: t603[12]: Fix most property-order dt-style-check issues
      arm64: dts: apple: t8122: Fix most property-order dt-style-check issues
      arm64: dts: apple: t6032-j575d: Remove unused "framebuffer0" label
      arm64: dts: apple: t603x: Break overly long lines
      arm64: dts: apple: t8122: Break overly long lines

 arch/arm64/boot/dts/apple/t6030-pmgr.dtsi      |   1 -
 arch/arm64/boot/dts/apple/t6030.dtsi           | 277 ++++++++++++++-----------
 arch/arm64/boot/dts/apple/t6031-base.dtsi      | 191 +++++++++--------
 arch/arm64/boot/dts/apple/t6031-die0.dtsi      |  61 +++---
 arch/arm64/boot/dts/apple/t6031-dieX.dtsi      |  92 ++++----
 arch/arm64/boot/dts/apple/t6031-gpio-pins.dtsi |  18 +-
 arch/arm64/boot/dts/apple/t6031-pmgr.dtsi      |   6 +
 arch/arm64/boot/dts/apple/t6031.dtsi           |   7 +-
 arch/arm64/boot/dts/apple/t6032-j575d.dts      |  10 +-
 arch/arm64/boot/dts/apple/t6032.dtsi           | 175 +++++++++-------
 arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi |  15 +-
 arch/arm64/boot/dts/apple/t8122-j504.dts       |  10 +-
 arch/arm64/boot/dts/apple/t8122-j613.dts       |   9 +-
 arch/arm64/boot/dts/apple/t8122-j615.dts       |   9 +-
 arch/arm64/boot/dts/apple/t8122-jxxx.dtsi      |   5 +-
 arch/arm64/boot/dts/apple/t8122-pmgr.dtsi      |   1 -
 arch/arm64/boot/dts/apple/t8122.dtsi           | 256 +++++++++++++----------
 17 files changed, 640 insertions(+), 503 deletions(-)
---
base-commit: f3f2d38a606edf92259aa5e57e083484798d7ea8
change-id: 20260909-apple-dts-m3-dt-style-check-02c9711a89dd

Best regards,
-- 
Janne Grunau <j@jannau.net>

