Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAF340F720;
	Mon, 14 Sep 2026 08:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375248; cv=none; b=CCv5U8LTZLTSKF/yWljUeiImeiHjTWd6LnXn/8mGRtDand+vunXxsxR5fcw0G6G/8//pRIeH/p+E+yq7UaQ16eNQFxG9jMEFQ2u+45dyjZStA8IEMavGjGQVye9mD1HQqyENNyUvjEhydigWq0Ar8EvANmuC/duLbpfbP4gPOWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375248; c=relaxed/simple;
	bh=Su6lcPEPc9UMZAenTJSjiq/GLgJ6wTCkbDST24a+7kg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OLw4muZqNMnlKh9j5dz0tIKac+OIyubd1gCypoavSaxV+K13Dh576ZL9+LjUBX5aryaY9+WLI8UIjQTqr8GSz84J6+kBulACsi+KJvbruYI1BcYGoPLcsrZVsp7j17jAk5udgnYBGXt6ErjMwl6mk7I+1ssI7qOIE5oPi8ysks4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=ZA0pV6ND; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VFcAQlGh; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="ZA0pV6ND";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VFcAQlGh"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 27AA2EC05F9;
	Mon, 14 Sep 2026 04:40:39 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 14 Sep 2026 04:40:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1789375239; x=1789461639; bh=jh
	D/TY1HVDHup8/Y2Z5CmNcrsOhpvRyPIJYV28f3ynA=; b=ZA0pV6NDQBh9fbuRgm
	rjmMk7B6/huMBIKML6A+EAayhsecq45fs9X/eznRWy5Z74XRNFm5papyJWEiRK7I
	DPp9zTuW6OeSLhjx0T+GPv83dr+DJ7wTreWVWsP1JHY+016zgWKUFHdIymNMUcv1
	KyDyJFgpLv6FuU7F2z6fCjqzMTd+8ykq12fli2Ibf81AK/pBsGoVKBGK69PM57/j
	ekvOPvxLhd/SDS657VwTqFmTpZghqRiNk/u1fgZ6BqOHomA7iDCgTVLDrCK0CG7I
	vgTJteuK/zWDM+6QI+Oo9xrPq720pJmYvOwBPEzF3feAki1tVAi45Ha688RB86il
	GpPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1789375239; x=1789461639; bh=jhD/TY1HVDHup8/Y2Z5CmNcrsOhp
	vRyPIJYV28f3ynA=; b=VFcAQlGh8X1hQFqQA72ig+6Kdg5YoXpGg5X+ph6fmpMn
	6/I7ajFitZSu2NxAZF2rQytNOdIJYcuvM1cYglv+UPW8nRXYsHlrek0F7n3JH1Jy
	/eVbLRbGROqaJo5DmzKc6EKcT+xfF8XcHWIrV/cswXZUq7KnTB7zn+MyZ4cGx0Wg
	1rVcYg1H4h5WwIEVGIyhTK7cuC+GznKojv/W9W7mZQOCjtdZ+buCav1fLGQBawGZ
	3QBxi+M9e3xNqJWjk39qPxysO/bUmcqimnxcqELSb/s2Sf8PlfTyeQ9f3XTQ9LUQ
	aEVf36XHSusXGdwPDbQFBI/OH2cQ6UUVjMuWsbkL2g==
X-ME-Sender: <xms:BrOnavI1v8T1sRIEiDz1TuwEb-GwAW58ch7pUyuY7QfURbpmGDswOQ>
    <xme:BrOnarV0a-nHhmNKTtRFe2--h7XOx0SaV_ykNvZGu4bYHdRXWpzorlSCk4_7dGbM3
    eNCqWv4DXGAuUKcTab22T2J0Pl8Pq1QEEcBjHj_mB-sLIwyaad_Poce>
X-ME-Received: <xmr:BrOnajQR8gPwT2BejcZf9ji4_Xw3K-4iPSCsCAZ1n01rvnjQosyZqFbyceSXW-7P2Pn3matJLAzyjEEQwpQZGtP4CqXqTVMPTmuwKw>
X-ME-Proxy-Cause: dmFkZTEQYkXtR69FCOn6Gfdk1/Enc/T6176mCywmYkzH53k0FQ+BFe8HhNhidvUwVd/5OJ
    YqgvnbdBBn158+KTzZh6SypPD3xnjJ5FpGx+XrtIbdw1DyjXl0WJZir/rVEsMMxWfW4Uny
    qaiqGjScKBPcMAsbteFaiw3bzg2SCa/prXENxQn+NRn6QFGW1l5vX5eOegZ1uvfFufFJzy
    /JdtPbLKZ2Qkyvdg0fAXZ4qISxEAmwhwqsHX5nQUvsuBUo737yWEy+SNEMSZVM16kIUOz2
    woxALOuKeFPUjEwMMTkQZ8EsZz24f7Y3k8lT4oiIq6IJ2Snxmf/kJwaYO7eLszLg6RFFgR
    H07iLVsstiDaIB7goXrv0N4qzn/Mnd3wYd5j6sziUAFrGlLZO76C/lFBmv3fuyWSQIYvPz
    dmTX5HNUBoxtaY4t+ZBn8e/47aMP18VFaG27Nm4OHmWPExazbHFxQMyVV2KfxnGps+xwlo
    NbBLXZ/9VT/JdzafDznWMmj2Q82MTN4yTukuepiwRhRzQJM+ZcVIO9vRRrZMfew7UecHeS
    D3oQ4UFiCZqZ1UHbUyYtPfxZ1ATO+XBmEj+xaxDqzfIautTKADuqCfk1k5TvBjnUcj+PPk
    fylJR59tkQtvS765PvFP+zeF1xfDNs2InMudwm+aPTaEY1hyUjC6GIo0EsRw
X-ME-Proxy: <xmx:BrOnajCR7n_pwk64h9LL0FxVRxAAwhHrYijMjupNwu5vLgZ3PiJr2g>
    <xmx:BrOnaiI1kz4a2Nh2pT2KrOzrJzcRawpXxibFF5rXyQrXBEiikCKMLA>
    <xmx:BrOnamD-plTw567Ubk5X8ilhA9WLqKdGZpPXNMUPz9MCTkvabSu_Zw>
    <xmx:BrOnavup76Mq4mRR6wtpzBAME1rveboasTKIhQnfVJ30G2z5QKUjLg>
    <xmx:B7OnanqFe6SC5L1L6VMPVHlwyanHPl7CVgNmY5d00UqX_Z8CJcldQ4eO>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Sep 2026 04:40:38 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH v2 00/13] dt-check-style strict fixes for Apple M3, M3
 Pro/Max/Ultra
Date: Mon, 14 Sep 2026 10:40:30 +0200
Message-Id: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NTQ7CIBCG4as0s3YMYFulK+9huiAwWvyhBJDYN
 Nxd7AlcTZ5ZvN8KkYKlCEOzQqBso51dhdg1oCflboTWVINgomeSSVTePwlNivg61IMxLdV6Iv1
 AJrQ8cq5O0hioBR/oaj9b/TJWTzamOSzbWOa/73/dzJFhq7u2J2Gk6fj5rpxT772jBGMp5QtjY
 pbzxwAAAA==
X-Change-ID: 20260909-apple-dts-m3-dt-style-check-02c9711a89dd
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3683; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=Su6lcPEPc9UMZAenTJSjiq/GLgJ6wTCkbDST24a+7kg=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzlm5kuTpl+Zf30qep8Sz8uX/bj7I+Azz8v8Vzzt7n47
 oj6vM1SNzpKWRjEuBhkxRRZkrRfdjCsrlGMqX0QBjOHlQlkCAMXpwBMxCSVkeGCkMlsR9uDDocZ
 vs3zyF+0jiHTUWtWvP6mr2UpefumN89m+J869XTXqWimo6qqNhrNHFIzXM7nPH554MkciWrTIo5
 1k7gA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Hej,

this series fixes most dt-check-style issues in strict strict mode for
Apple M3 and M3 Pro, Max and Ultra device trees. These device trees are
small so fixing most of the issues helps to check that new additions do
not introduce new dt-check-style issues.

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
Changes in v2:
- s/dt-style-check/dt-check-style/ in the commit messages
- move comment with line it refers to in t8122' serial0 node
- Link to v1: https://lore.kernel.org/r/20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net

---
Janne Grunau (13):
      arm64: dts: apple: t603x: Fix all blank line dt-check-style issues
      arm64: dts: apple: t8122: Fix blank line related dt-check-style issues
      arm64: dts: apple: t603x: Fix child-name-order dt-check-style issues
      arm64: dts: apple: t8122: Fix child-name-order dt-check-style issues
      arm64: dts: apple: t8122: Fix child-address-order dt-check-style issues
      arm64: dts: apple: t6031: Fix continuation alignment
      arm64: dts: apple: t8122: Fix continuation alignment
      arm64: dts: apple: t6030: Fix most property-order dt-check-style issues
      arm64: dts: apple: t603[12]: Fix most property-order dt-check-style issues
      arm64: dts: apple: t8122: Fix most property-order dt-check-style issues
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

