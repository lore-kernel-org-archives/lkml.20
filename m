Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4E6377EAC;
	Fri, 16 Oct 2026 05:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792128877; cv=none; b=BLvTCO9xRsvk5Z2zV9Kop4s4r9yanRIXvUaRSq9Q53NNd8lV0l9s69Vdbgxh03Xsr6c/ZEBZWYMZfgRs6l6HBFOKVSUTmIGl0g19TQGsk9rI3hqPk5XNpNQW62T0659RcSrjfrHdZmYWjOJByUEiSwdLkY09TJyCT9ERayKfQpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792128877; c=relaxed/simple;
	bh=H0zSGhB8hGAGhGm1ZMMp2gTyzpy32OW6Q5DZrz3Rqmk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mJEqfcEByFiWpvba2Z7DZagib3/rjjuBMk4XaFX/TSnjO6h3AltXryA7hllk3brBGLDe4DkC2XWT7C/mWLUWr6vuMxCSTSVf4zXQXbGislKT9HtyXA3Q45Gh/DwSJp29Ec+jLWzTj1kUVXg+0LEF5uGXtVxRmcN6J0n2Crdo/Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VjY6YBIq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VjY6YBIq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFB17C2BCF4;
	Fri, 16 Oct 2026 05:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792128876;
	bh=H0zSGhB8hGAGhGm1ZMMp2gTyzpy32OW6Q5DZrz3Rqmk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VjY6YBIqPZ1wha4WNmuCZH/+oZpQHO8keUQsZE9kvCeUhwQm9UBMOf6sZOCLdeH3U
	 kesttPOn+hQ8R29+p191iCIvq+QQswCp7ZZnY/Pv8BhrqqzRgioh7IXSbqfFK7dwur
	 3yG0ZVfJ+0sbVCNnB5nthdISGJ5orocrqQS5TXHKJ2qDsyPCczKRkzdqq6Zddtk3EF
	 7kc37oaVKr+Pio+ZYTxsMOcPjmyUz6qKGCDgCAz3kLPwB50im74VtLsqyrinlBZ6T1
	 kotvtd259U2CJkE+RwPELVkvgnzYV2vF2hqj0UEVU0HBzPXzubiEQcPQlYyJGStKwE
	 aO/3tVBAEh1NQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC840CCA462;
	Fri, 16 Oct 2026 05:34:36 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Subject: [PATCH 0/2] arm64: dts: rockchip: Describe more of the power tree
 on Kobol Helios64
Date: Fri, 16 Oct 2026 08:34:32 +0300
Message-Id: <20261016-helios64-power-tree-v1-0-31d6c8dc5092@iav.lv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGi30WoC/x3MQQqEMAxG4atI1gZs0SheRVxI5x8NiJVUVBDvP
 mWW3+K9hxJMkagvHjKcmjRuGa4sKCzTNoP1k02+8uIqJ7xg1Zik5j1eMD4M4Kb1ndQhQBqhXO6
 Gr97/6zC+7w9qd1zyZQAAAA==
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=969; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=H0zSGhB8hGAGhGm1ZMMp2gTyzpy32OW6Q5DZrz3Rqmk=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkXt2fpHD19VvaiXNvJwOvzopMM3lUdafB5HmCY97ykv
 2nGV75HHaUsDGJcDLJiiiwTDmncylhy9a+/h/kDmDmsTCBDGLg4BWAiNqsZGdbULbULLJ/cfvP+
 C+8DynopafyH9xgu3CHWlFfEnbvbw5/hD5/V7MQ7i5c1qVzavtP2+8ydm2LXRd/4vfdfb9KOlWV
 OegwA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv

The Helios64 device tree leaves out some regulators that the board has.
Patch 1 adds the ones in use. Patch 2 adds the RK808 outputs that the
schematic marks as unused, so that the kernel switches them off.

Schematic:
https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf

Tested on Helios64 with a 7.3-rc7 kernel: the new regulators come up at
the voltages from the schematic, the regulator core switches off the five
unused outputs, and the disks and Ethernet work.

---
Igor Velkov (2):
      arm64: dts: rockchip: Describe more of the power tree on Kobol Helios64
      arm64: dts: rockchip: Describe the unused RK808 outputs on Kobol Helios64

 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)
---
base-commit: d2abcbb905b0e4b2e06b257fa1e5bcf4faa6dbda
change-id: 20261016-helios64-power-tree-572864cce656

Best regards,
-- 
Igor Velkov <iav@iav.lv>


