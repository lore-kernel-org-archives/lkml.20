Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792831189;
	b=KOn5LyMqu6vg6QfWbzAP54im6ukkbLPJY5KVsaZZagPJnt2z6YDekg61ayaqqOr9PEys
	 i1mSFp/HDf9vhv5v7HUlr4GryFaZQkviNEYCId15nywRJk+WFjYYeY0gVeLRhBptSY/k3
	 yw53d8q7xn7rarKY8/iGEYGelMG73CLqfQLMX8ZkVRvxmCspksotIlpHTA7jhLg/DfGWK
	 tXPZjRzp0yTpl75xRxCf6Xpd0pvy8x1DDOiC6lsiQBNF5TcTvedkvyQrgEP8pmQP4idyC
	 2P+LNHn8h6FXjGU1/fiPlC4P+6IpEbxbHJ0BzsQng8MxplPaJXecOX9tkhcirrTa3Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792831189;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dk4e+eedEam13wGCRMmw9y+wJRNgv+ioxH1lvC55NVc=;
	b=oJXyQ4ZHwvSwXHB8JOoip0Mxc7TkMa4aHCgwR5e/d988Lc/QvF37FYMuJwDgz4Ot1z2v
	 i4G7rFlBf/V0gKzdupt93Eiaemv3JHcKLPumRte47vOBPh2JCvWuHU2ZGvQpZe9VVxZkC
	 xADy1/QDQPS47cNna4dfjrMDyq3RVcRo1N0CpS9TDlnAPq2R7QFwLLdX6dIe5rUR4PcPb
	 8pQrL8qfz68hT2MIciTiVE7J5quUTDHW62BkDMwrV49VRFxRCINU89v3I+Srg20d+cip8
	 0Q1y6HoCIQ6lzu2uBHOd0hhOp5fOCbgIh1P2nekdL2T3Koknc/6/BiNjBr2VxDxPI6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gahingwoo.com;
	spf=pass smtp.mailfrom=gahingwoo.com;
	dkim=pass header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=d2oFM8mz;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=bz7bIU1+;
	arc=none smtp.remote-ip=103.168.172.145
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76479606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76479606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=d2oFM8mz;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=bz7bIU1+
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 9DDECEC017B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:39:47 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 24 Oct 2026 04:39:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1792831187; x=1792917587; bh=dk4e+eedEa
	m13wGCRMmw9y+wJRNgv+ioxH1lvC55NVc=; b=d2oFM8mzMyYcif1eaPVo2jhsA7
	WOwgW93frOdQJXWbBek6F/HwlA89fPCyZy1+CzKUICrNZUSLZuZCRPdZQt2svot1
	PDRMmceHJa+FVQ+YV7iMWiE6bTWTpZMI5Cd+T1yb3pizlhTxsJwIwCAr40XHEmmm
	D/Qo1xJlsO11fqA56nQ/vhzGCLiXQQ4JK6rKuSQ8YokFsqRiTP0Bc6kz6oj/9YfX
	Qvc+f9dEc3S/0HzSfE7gSkIMTsS/YIFMrkM1oXLaaW+frijSi6nCv1RgeGPinXQk
	wGJlf9JRC/NExOlpstg6J3c6Lw6Vnzyyzsd2WTylb7nQoQrns7o4iJW9DK+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792831187; x=1792917587; bh=dk4e+eedEam13wGCRMmw9y+wJRNgv+ioxH1
	lvC55NVc=; b=bz7bIU1+txNPYxcw6Lf6y2182964hZRmqA3nEkHJ+0HuoLm/sIn
	cXHYP8AIpOf6aFJDkKt6fQThYwLZmvC2bd2KLzkk0tSLt+MF5ev1YYJsIRrzHTID
	OIHqSzw3Np3o72Wwi/hvWRSgNZUfDToPyCry10csGawEK76ZCc4LKLb4rMPtliWN
	b6huJOGrdeIRimkS145EzjldJzRBNnsCB0vUtSlL0buL0j0bsf8Dxp9/sJy6KbAd
	SQoNoLfRuA09s+ce7ZA6l33MYYhHKacqMZHWUIXUhVHfv4lzZoRaG/sHwPQZ/kxT
	jkhUj5oYvXCS6huEfGe68QteHxznF9PJq5A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792831187; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:FJNn2k2WjBC47fZL6m0KzNb3HtqmrEvyR5u0ZyNHOiHOTvk
	KtZ/m6QgFAUQXMaY2RpwEVOIQto2nxCgCqpwg+hyDytfFs2250zb/S2PItYKoOvD
	igJuII4kdWOgvWwlQhuChshA0z5E6XWnwwI/6j+vnVenRtp8niHVxqgwJ9lAc1JN
	koZ+XbGZut8no/G5qUzOIe7TSj1EDMv5DweajnG4ZbfjlSRR5kGi92s9svChkdEa
	10OzyZLzpuEUnRjPDIAfw+jBwXZ2Cwvi0/f3+MN/j2u8o9lJwdCRUCqHd75oV/GN
	RWkSKFvOrponjAVzz+f4sJL+R8maRXPLCWa+l8A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:PnvPF/K/NdvXhLu/i91FAf5qb4UUBnCMoCSJ9dKYvZA=:kWDPm/EXmOFJ312wfG/g9OlfSszOPhrx452WIAG2ZOM=;
X-ME-Sender: <xms:027cao0QKnJgl2TuVdsLf4LzmCpdLG1R6iN8iEPsoW_ug6veKOAz_g>
    <xme:027cavqgj2a9BTYILKyNs47uPoKU9Yz6y2s2yg10W3kN4WcuCZ-IPkg6Cyv_kXlYB
    JSda3XXwht6M3f5UG9oHWKgGwJZwKj-V5idj2DUmittloA7OGlevKGM>
X-ME-Received: <xmr:027calVf5lsVURzsm9eHjFP4bld6tI7ZO2nteb1O_Hu_lnwxL0I4rjnAT2sxqdxsULs0cz5D>
X-ME-Proxy-Cause: dmFkZTEilkQ7QRTV3WCqk13zuvyPjR3rvfRKdMmJjP/0IUkSonux5v7d6YiFkowHCHQQMZ
    UKTuka+etnp0I4pQi4LorcpHTgVejGL0wuRdrC+MGiY+0bYFfrp5Tml1fj2yv6N4JzjygW
    ciLvzb9zDqU9LKMdU/KronOfZfUPAzti/iKqSp/9Ri+tI9S8gQEpchHvM4CzTKNRPKRrLq
    fGuXpHBMMyPZae46Tawr8eZeG80mtkUkkmo9JDsT17WuJINe+UpplGjh9UY0mWBDvAjAfm
    pxNJ1WZSmmsOnyEBqC8Z6C0pfXlBrw+DW0PdJtpX5VPHttAf97aVchdt8+K63vy7glvIkl
    Yg33go8lQiWCw1mp1AzkNjfPFCf61tY8tRIAvu/+iI5dZca04qH/Xyly2C0tFbtD7X5lOn
    0u1hJ2xngjMOqOgLIQ8KTDlltMJPvKmTwk0aAEiqNjIiBs8MvGkm0FLPm0iT/MU4j3vJbu
    iTx/5qwURcN55LtColc3bzrXD3m7oQ6gxkMZJAF+tQ2jNoUbH4TyznDmnnx/stac2kALRJ
    ZQ1HPB25/TBVyS10xcOvGf4c1Do9Ums1oV4VUw4Co+doLnuS+cGF5qqdF5px4D109sqZxH
    aUB2lvdblTY5vbbmXjnGpVK7/oIWB6sk7z4hs2dr8VLUbJNmI5NZ+iVkaNqg
X-ME-Proxy: <xmx:027caor2jeOv-FnZxvtoS_1nX56nfR-TxlOWlrSTlxLCJi7DU_eM5g>
    <xmx:027casDMR76atB6V3gxHlB0PFBCUIeaG77wohXkh2IG4ZInIy-Zajw>
    <xmx:027cakgliaDkw1uvOVvES9ms5Hfo3ervdV15hP7SLtfKA2xDSuWhsg>
    <xmx:027caqb4A_RLixhzDX2E7MCHDs3GGzGJ8NrtjLwMpd6RPr00q8CxfQ>
    <xmx:027caih8zVv4CLHufmo0XMD8YQU22aSF7R41Zo25Bh-l5WligFRn5A6Z>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 24 Oct 2026 04:39:44 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Jiaxing Hu <gahing@gahingwoo.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] arm64: dts: rockchip: let TCPM own the USB-C VBUS on CM5-IO
Date: Sat, 24 Oct 2026 21:39:42 +1300
Message-ID: <20261024083942.148860-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vcc_5v0_typec0 is the switched VBUS of the USB-C port. It is the
vbus-supply of the FUSB302, but also the phy-supply of u2phy0_otg.
The PHY enables it at boot and keeps it on, so TCPM never sees
vSafe0V and a sink partner stays in SRC_ATTACH_WAIT. A USB-C dock is
not detected.

Drop the phy-supply and leave VBUS to TCPM.

Fixes: 44a48a23974b ("arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO")
Cc: stable@vger.kernel.org
Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
Resent with the lists on Cc. The first copy went to Heiko only.

 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
index 5958b391e..72ca49ec3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
@@ -306,7 +306,6 @@ &u2phy0 {
 };
 
 &u2phy0_otg {
-	phy-supply = <&vcc_5v0_typec0>;
 	status = "okay";
 };
 
-- 
2.43.0

