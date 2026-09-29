Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769AC50EBEF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686133; cv=none; b=icaCvuWi6L6L94+B0L1hHdAqRKPnhawyqACiGcjJUxYvVXNJzjaSnQpcbTEC9ZpzAi5DdfoLB5ucGYqZdBAuyAdP5fGA7jdX95eVJYxxQXnEwgFhAWT9bDKzGXLrP/h7/INQBXbqmNCgTRIyIJ6MMylit6Zl+nTbOrxPLmtegq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686133; c=relaxed/simple;
	bh=76b/ejICPXH46+kgcUnnuIkydq4CVr7Hr6JUbYvKEtc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XMaQinYuqIWW9PPdNAaRhsNh/+naSa9vxbA3r8Rs668zbPHU34u46MOk4UCsz2mfqfg64m4JAQM6TYNTzU5nfNsnzccJEiBJ01wY9nxSPcpvGk1LXvdGNR2o1dbJ9w26Ao3HFU6P5d4DKzGRnVSN9O95/dHVX6YZh7XgY82FvO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwhPbBiS; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwhPbBiS"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso21940805e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790686129; x=1791290929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMax0i/TU24FZQ1LcLQrF4u9C2CqZ8oMQyiSKx72pIU=;
        b=kwhPbBiSHnXCB+1SH82oEjL6Zb+/D9Ev4YQ3FEeFIilLBmQnfuRzuptoxERqNt4QpP
         ouJz8v36YTAcKsCyI2gU19KOGsSRTsa5j/lUJgdFQlkBpcIJhVlefp3dPDmZ3AfS6mxU
         oB/TS2ZEa7Enpe/OgslCj407a0+jt5R/QWJsO5H72l0SZl1QZ5egsSO46/V99smh1G5S
         nvR9jr7+kdMrR6FAtJ7IrWRT8tBI2ncy94vOiSgcjCv+PdPrBUSI0+4KotAwEXf6Vdf0
         mn2DujAKGNCKCfrT11vU2nlHiT++ohtM3sU150j8apS945JY+GWVSa2qgakdNskfGymK
         HLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686129; x=1791290929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMax0i/TU24FZQ1LcLQrF4u9C2CqZ8oMQyiSKx72pIU=;
        b=a6G1NMdtPG0Ae6iVDBjpsoX7AImu78JPJlJmrZDnh7uZC4VqEtQRcgLeD37RWRN6Ui
         YhAvhz0v65c2Lt7AkwsmkGtPwWPA9mfzylUE/D9//IG24M6B94fWc+RHn4bvv6SAGanD
         ej6INMgBNsDGUc8XBsr8A9XtUkgB32TuJ9lGxTok0rCQsxoUlPfJRgEONDfilRnJKs2H
         nUOYiXZV41OVIpwLkhHy4Td2voNHP/t1oVV1e6z5oO00roP7M0sUrVR/WwJ6muZyw3jR
         ZNaE6RAwvTVT/OetjdnEpoaMeFzPWtQoA+h/VELeaFfAkXRB3dGvgWPrD1dnrb0jQMH9
         0/Mw==
X-Forwarded-Encrypted: i=1; AKwUvByAARpZIJmxltRQtpRLArWoVvCDK1xi2UOWNHX5c4/iyMUl4h4K5i1/0xanFRtU2B/9kjOmVJbUguF1jYE=@vger.kernel.org
X-Gm-Message-State: AFuF++lID3IQt0TNhblPJQJY2bjBH+jgPkErJyztnAjmHaiXdK7MfQVH
	hr1QKtHWea2ezUBs1Bn4grTLS2LM3qdt5Po2BjK8cP+pRzPRh58t/3RV
X-Gm-Gg: AYBFou37PWpB34Qy3oXPJ0RnMJssJu/4H+hbYd0kbd5+2xWQN3sTxLh3qAlMekCe2qQ
	tqS401NhRq5tkEEOYCPXxMnwQATzeZMa3GZ8NeNLErSrJ5zhfCFm3yES2W5f4FNPEyE3QOYKN9f
	T0zg9zZXfUJ5GI28Zye1gSXBMGw01DSZv6JWYA0uqPLI5DjuTRJVc++7xHadX9Nnw/vx9+cV7It
	+3FOjxqmNb/EgTNwLFAXUNrNDP3uFuHtzVUGInbDmmdK8RU8HQxGxj7VWPflE6pFQCbCPj9YANy
	vjVBId9W+Z6jCc/+pWzo3tXeWifsqWPJzODongFVPjyeITZJRxdof0ePG53cZW9yGVaPoRaUdx5
	78p50auNqTD30In/qft0RbKoqIdNxInO5PDHl4zcEeWmnSxw8ZCLk5CS6hSer/7n1frHul27X3P
	RL2tivuJhh1coJZ73SO9RX0Yi/uP0h7C+baHMbCekCRQENVy6E0APQ1+ciCuwd7667onYF8ZGbl
	btYBvIzQejd5oWEtj4X+6B/JXEmLIfzWpCvE/ikf+ola3sx06k5wfJHB1zliDsgzK1xP6J7oKk6
	thrlEJuAJ0u76eTSBm52Sb4huwxm
X-Received: by 2002:a05:600c:1d02:b0:49f:fd66:5fe0 with SMTP id 5b1f17b1804b1-49ffd6661a7mr171208455e9.9.1790686129456;
        Tue, 29 Sep 2026 05:48:49 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50abad2sm3439942f8f.37.2026.09.29.05.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:48:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] Add ADC support for RZ/V2H(P) and RZ/V2N SoCs
Date: Tue, 29 Sep 2026 13:48:25 +0100
Message-ID: <20260929124829.237997-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series aims to add ADC support for the RZ/V2H(P) and RZ/V2N SoCs
and enable it on the respective EVKs.

Note this series depends on below:
- https://lore.kernel.org/all/20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
- https://lore.kernel.org/all/20260929122407.219448-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (4):
  arm64: dts: renesas: r9a09g057: Add ADC node
  arm64: dts: renesas: r9a09g056: Add ADC nodes
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable ADC
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable ADC

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    | 144 ++++++++++++++++++
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    |  12 ++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |  48 ++++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |   4 +
 4 files changed, 208 insertions(+)

-- 
2.55.0

