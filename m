Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792733758;
	b=tz3wqq2TjJncu0t11zClsYG9iab6AB3JXzmFcxI0q4BSnKmCZAQnoyJYlJ6a00vU851n
	 1pWCJ3xl1lRf7LT6EcKtMuDJhnUmPajmFAzykWKi0jQvKYFtbEZAHNhX7Siv2qpmcGYQy
	 L4TN7fZsy6F14PE0VBKAQkRU6zf1nVFuIUR4l4nxJiLBaUfZ+/FQjahMfLwE1fY1kQ6gC
	 YYOKKE7Tgw4Wb8XF7hb7iS/oL7u/qzTIrhDYchtzJfFO08/cjYWer3DOCp5Y3rMUVjEdZ
	 IxJMgWGVYi4lgM4ytIuJsu/NzBuORaoEeByKWiad9z1u+Qm8WEW3/UZus2met8eDCXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792733758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YFwipSmzwQ403tXXCr3sam0ZTKk4Mily0d72SzJOBxA=;
	b=L8kYmGAbQBSZKhp/GF98pYg0vc2vBX0u8Q9EvXnWE48d/qSNMkQEcYyuCp2JRRjGbUdv
	 B0evsNRme1f8homaPFFS9sx4ncbejYFcHs/fCh4wLaSYLTjQ9IlsQAM651VpW2t3YDqIk
	 y7juhqHvo3Z0ZvsE9oLucQ17va/XFGKraWt/TRnN/m8upRBkwPqbNN3R0VAqkjcycJhAP
	 oEv9+SEHER/xBIMaZEl49BYZsEMDnlTP9ShtEEN0w1VfiPPw/Ffq7CYIujyo07RadUaFR
	 6JC0CYFzg0u9NQQGRidQjQh2UJUQTU3s6IFww1DITPQyP6cQy+cBkvikrzBLh8UtfMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=koyExOo+;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66831606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66831606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=koyExOo+
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36758ba1f01so235426eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792733757; x=1793338557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YFwipSmzwQ403tXXCr3sam0ZTKk4Mily0d72SzJOBxA=;
        b=koyExOo+EC80xPLZgohMiOyJWiBupWAA4SHtclr7JhHHq+JzxCnLKqn4q0VYN6QA7t
         cBF08WtZ/X/PBsdjNmmXX0PWDf3FPGZUcJ1xDu8oMKbkJbL70rWHNNmlNBvegxGzcqiD
         n95bp7wgRDo6jBZXPn8eaUwEUkUWkiidUmIfMb8NKvy94dVPWAlKyCNkK1o4NjaEgfKS
         qn3nkpeS8DMHx6MvYeGc4RQbTvJwIwQ8C5FH9jpXm1s/visdGU/3Y8DH0TTDKWdxf3c1
         6hmfeX1ene4ScU3LDAPOqYTK3ZO1yGh/AiQGkux1OB7DNgswHuz84JizYvtrBKlaYtjA
         Td1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792733757; x=1793338557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YFwipSmzwQ403tXXCr3sam0ZTKk4Mily0d72SzJOBxA=;
        b=1H5nSVqKEgciOoI0HXfYymMb3WHr4r6Cc1oea0GpXlgc7ibIEB6h1e6JX+texgjwjL
         KnVK3EKtGtK4e7j/Su6j7K0mXO+jTQfR9Uizrr3CO9njWGBygYXQYvsdKVjo1XPSt5J/
         PEC0Scl6jdW8CpkITpAh+cwIZ3gCvCTrH1/XZHylgWdEVoK+ykKUmaDjXo4jp/k9JhDn
         psfOlb7lbQrzDuHhtlc8s9wszkQh4JbmZTSG9lFqEh59tjol5g4Y8mnPkICPrEdEEqKY
         1GmLxjRxiZuXdZCvn3ya8qiq08XG+gRqMIAeZTfDJ49suXthB1J2GcbZ7mVVP3j3VS4p
         HFnA==
X-Forwarded-Encrypted: i=1; AKwUvByLEc/8seIknlgb5sdFPVf0zBO0I4eFUXLx3kOmKtZM5ZSSPdgMZOnetNsNG6C6pFM0l+NN4N5oVryZNIw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKh2WoyMa/t9Qg4WwqtS48wGw2eora5PstteyEoV2o8VCi3HMFD
	YQ5tnedR76g242Mw4tF2TWul78TpT7cf9Pxo/HHI/lwD75H3li0noPA4
X-Gm-Gg: AYBFou1yT4mLdua2xJ7HSipcfh2gIFa0mlMbFUJsGh5kD69Oyo0rl+nURhDx3mjsUKw
	iqQKDDmkUPp4aE0SLYlOqtmZo9AslV+XRaW1VUY67UENOJPv/+LPdnrCuCnkdzpPzhQGpS0h92s
	mPo093J7bOpE3ilVlWonhDi78vKYRsFrJTAlqBatlq73vRZVWTU/04BTb+dqFYnlT3zAbS8tvoc
	R6gDWLi3Fg6rnhlIJGQrzvTz+BQ+mK4h+BMssNsmWTJlVUUiodrFSeibH3qh/WiVVqW5cPLY+4y
	yhksRBqQMmVhn6TCu5oJYO+Dv+clrm22psuWXCfNwTEaGP92I6nEoRWh0eHFHdzK0cscqxMPDkY
	aoG7FNAusNA8gLFsYTMaetfBjbGmmndXkdzqwXZ9sISXYC+TGd2VnP5AcvIS/EY2YSSlkPl14xq
	Qy1cSCLaU2r3Keg+UxTF2ERmAZKCPjTAeAJQ5fDpZ4bVTd931Chu5m8p9Ik/EWrnN9wU5FO4Nj0
	i4ARHSTZHS8wEvGsF2S+8DBotdqU+Cugo9gPckP3Mb7E3E7IiwwDg==
X-Received: by 2002:a05:7300:c3a4:b0:34e:e7f4:cc78 with SMTP id 5a478bee46e88-369d954ad83mr1482862eec.5.1792733757137;
        Thu, 22 Oct 2026 22:35:57 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c15883sm3542480eec.3.2026.10.22.22.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 22:35:56 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v12 0/3] arm64: dts: rockchip: add RK3568 XPCS nodes and enable SGMII on Photonicat
Date: Fri, 23 Oct 2026 13:35:45 +0800
Message-ID: <20261023053548.1595033-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
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

This series adds the RK3568 XPCS and fixed-clock nodes, describes the
RGMII PHY LEDs on the Ariaboard Photonicat, and enables the SGMII LAN
port on the same board.

Changes since v11:

- Drop max-speed = <1000> from the SGMII PHY node. SGMII is
  1000Mbps-only, so the limit is redundant (Andrew).
  
Dependencies:
- XPCS binding and driver (rockchip,rk3568-xpcs, XPCS glue, dwmac-rk
  SGMII, pcs-handle binding): merged in net-next and present in
  linux-next.
  https://git.kernel.org/netdev/net-next/c/5e91edfb0e45

- PHY binding+driver (rockchip,sgmii-mac-sel): still in review on
  linux-phy. Not required for this version to compile or pass
  dtbs_check; only needed for the follow-up that sets the property
  explicitly.

- Generic PM domain (genpd) changes: runtime-only, not a DTS
  dependency.

The XPCS node is disabled by default and only enabled on boards that
use SGMII. The fixed-clock nodes are always present, as they are
static clock sources.

dtbs_check passes with the current linux-next, since the XPCS binding
is already merged.
---
Coia Prant (3):
  arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
  arm64: dts: rockchip: rk3568-photonicat: add RGMII PHY LEDs
  arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port

 .../boot/dts/rockchip/rk3568-photonicat.dts   | 67 ++++++++++++++++++-
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      | 23 +++++++
 2 files changed, 88 insertions(+), 2 deletions(-)

-- 
2.47.3

