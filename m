Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814805;
	b=A5DBkbWL1lmpel1ePqvHNcvydI3MNoiKxk7KY2ZK7JKGLi0fEoDGFqWJ1kL0d5wh5jsL
	 +fn4ic/MHYZaxWuK8G/s7DxTy0XMGI0ibYrOXsXFwNR9icpw/MVLNKF83ceUAeuXMn1X8
	 MZmaGlrImitRIs0HifbODwIYkusXkYkapBMmdATv0+BacsmvpATS9tSchUjOvGuZAyBgt
	 FNPSkI9HpvEUDZhmAB1ifVSNeFj675HVGIbCsgLjFExkIZduwulF5Naxg53LhJcj2wcJ2
	 RxN5UUY8jns++HuprTdPfVHICTP4Zwbc/ohE2KAYlo+MXPlhKpxj3cv3YCCtXCmePxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=rKMBgpb0mxyP+6kb+ZdWDKHU+yeBE20Y58pj8NkP9p4=;
	b=OzhaDwFlENqohhicXhXcYtw+TIn3WRBP6qJuvfdGkVm2KrE56aNRkN8NG9DROr1NUobs
	 EUIG0kVBO5zQvrGsIBD//C0ecqkng5A/psW4H+YFbuGoOTbYEqL4zy4ojorNOF/R/ggj9
	 H93uruvOrmM3D9Go4+Oeqt4R0RhR8OmXRzA1122pLGdmNyrXoMAJnS75h+9rNmGJrAsfM
	 U5M/a4otrC7bD06K8sQP93nqdpTdBd1y+n2VbVXKxTe1sNZI6kqhnibMCw3C47uFAJTAH
	 DEajCc6eGQef350Gu9Rg7M3VK//2vwN8s/A+ydQ6Fk3Ifs5gTQqkLODGHeCYzbhw0iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mojDRsKq;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0DC60A3802
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB0DC60A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mojDRsKq
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so33231415e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794814803; x=1795419603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rKMBgpb0mxyP+6kb+ZdWDKHU+yeBE20Y58pj8NkP9p4=;
        b=mojDRsKqwRrJVUQ5AuDQp92qQp6ai02Mt7rBOXHrgEvaT+gJ1zdQl1Ey87DJi+FYgi
         0sHEMpTaur8fvoBkWjwVO/PRg5JU+6NUw/Bdy/elN9fbPjgtIolRr6zunPblX2MdQRXH
         3Pf4N34SDEvwXAOhzNj49/roxN2DTi6bIiDoF9GLEg1vc+yOr/yKZz+dCddpQWF4T8Dc
         HwtB17SMeTjl8gjSpOAFSnSnukq6ih2u9cB7Tpr7h641/dmzlCENZWP+NSV+JA3/uvaY
         PoPf+lvIKkYr/sq8xjxz5mJ4AFCAPqC8aL805+aiHIyJIjFJFU9KDDitp/53X5L1ns5y
         vjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814803; x=1795419603;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rKMBgpb0mxyP+6kb+ZdWDKHU+yeBE20Y58pj8NkP9p4=;
        b=cJDRzrENTyzhOuc4BAdd4yQJuvr5PqwvmS3bxguz0QifmRTui6h0936iBJ4v9lFzfj
         wyAqafpvBJnOwW+iS7JbrrE0OiGo6MX0HIsGt6bAmzcUen77paflR9ZMRAmx43evk2Fp
         EIWd6Pvtrwo1+hpMYkqypllfb03ddiDsayH8vyaT5up1A4N1357j9HsBlk1b4oyQFjDx
         ZLi/fKxunr8/tyJcbw0Y5ws6KTA1nsrudlzujsoSEiO2mY7nPh+gu8tC4lzl8xo3LpIF
         +TPbWqrIeIARvP5g1f2FcQZpUh+cbvfqyOfP2Uu9NQ6RXd9Ir06U3jY5Ck8hbH+seI3z
         C6MQ==
X-Forwarded-Encrypted: i=1; AL+hErGAc9mW5FgCNrIWboNckkOaaGtC2OUkmoc6c571cznJzxPMuh2gHXGL4dx5AMH7/GKGXseSLuf7aYZCvmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/E4mLFlHRmXVVDRQ8P/4a7KO7TqxdP4ObyYqF5Ev4JhiYSKIO1
	MyEflELLX9KudESv6QAN9Qb+FHCJA3e3RmnIju78vY3d1yFNT/uW5qEW
X-Gm-Gg: AYBFou1VfcIDVHIom/CbyEAK1uKmpjlruwCWy0PXvhz3PhXhGZwNHiUNdlnegYb3fXc
	EqcRTniNDe1astqtFoK0tE58H4I6e1w6Wi7XhBma4wCfhZPysnj2lmnubr0cO0dJ/x8Um+QvqYs
	1ksbn17tQztXdgVDoz7aEfpq3N0VGG5r1Z8Sk5lA/TPB1bIO7FjGnDoS4uCErNF0YhC+hUNK4ev
	xv8nBmWyeey/NxismzCoH6lz2vx9Hyb/FT0prnoLp5pXSsPTMiYCjcr+r0yJZtPGyYEVsfGFKvP
	1yNxRh30GCWN5udZn/nDEcsvcu5PGJHOB8zgTVBmHLmrYaaZWtc3NaTG4N2jAmuErJVLJyRTv4G
	JUGIYpnMfSE3eoJmBqbLiYixkYDwpMJPqQBssSQvog5asF1/rOtTll/BrvD1w42Rz/qhaxXVNQa
	VieFxPAqVa2/94t1DqJFkjE6erJ053pu4duqvlO5cvWrvEP1PJov4TetP5tvvrVYVZaYpsUn8yh
	cHWsw5QwQulBG7Ih2s0FmsYl9UEKVX1INKbwpO6enCBF87fFSklAOak11+zNq7gheZHGnljwXLJ
	lc/I/odbRyldjLPHQvu6NzzsMK1joWc8
X-Received: by 2002:a05:600c:8b05:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4bb55a99ed0mr197499175e9.24.1794814803044;
        Sun, 15 Nov 2026 23:40:03 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4d29sm20354115f8f.35.2026.11.15.23.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:40:02 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v1 0/3] power: supply: s2mu005-battery: add S2MU106 (Samsung Galaxy XCover5)
Date: Mon, 16 Nov 2026 10:39:57 +0300
Message-ID: <20261116074000.355176-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds support for the Samsung S2MU106 PMIC fuel gauge to the
existing s2mu005-battery driver, for the Samsung Galaxy XCover5
(Exynos850).

The S2MU106 fuel gauge shares the S2MU005's direct voltage, current and
state-of-charge registers and their scaling. This was verified on an
XCover5: with the s2mu005 driver bound to the S2MU106 gauge, voltage,
state of charge and the sign of the charge current all read correctly.
It does not, however, share the MONOUT average-monitoring path, so the
S2MU106 variant exposes only the instantaneous values. The XCover5 also
does not wire the gauge's alert line, which patch 2 accommodates.

  1  dt-bindings: add samsung,s2mu106-fuel-gauge
  2  make the alert interrupt optional
  3  add S2MU106 support

Based on v7.4-rc1.

Tool usage
----------
Prepared during XCover5 mainline bring-up with an AI coding assistant
(Claude Code, Anthropic): it compared the S2MU005/S2MU106 fuel-gauge
register maps, drafted these changes and changelogs, and ran a live A/B
comparison on the device under my direction. I reviewed every line,
tested on hardware, and take responsibility for the series. Review
comments are welcome and I will answer them myself.

Adil Hüsrev Tepe (3):
  dt-bindings: power: supply: samsung,s2mu005-fuel-gauge: add S2MU106
  power: supply: s2mu005-battery: make the alert interrupt optional
  power: supply: s2mu005-battery: add S2MU106 support

 .../supply/samsung,s2mu005-fuel-gauge.yaml    |  7 +-
 drivers/power/supply/s2mu005-battery.c        | 71 +++++++++++++++----
 2 files changed, 63 insertions(+), 15 deletions(-)

-- 
2.53.0

