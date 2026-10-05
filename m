Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CC64BA1C1;
	Mon,  5 Oct 2026 15:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215066; cv=none; b=objFPv2N3VJmHTlGT8tHtYZJkOBoQLT6p0kxjAF6Teer4DBqajVDbxX2xZFyPQlJYUTr9GEjyCJ5P9+gDKKXbVXRpKchaf5qISctSkTkCd9yn5ElYT5tkeZR4AIIbFAb4IeAatsOdXb/SYV4Ft350cV3nK8yyUrc9bsMctk2DCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215066; c=relaxed/simple;
	bh=Faq3tGcC6ftPF1BaBHLSZFPuzFhqykqLhFgAnnn5lx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jGjhB2rZ0bzG52pj8XMf9lJCm8l122SM+5uGbtAnC2he+rdPiF8ls+P1Ue2pl1GwJv4LhMCXO5iJrD4AQiiCFQAG/Q1lZ+QWUID0Z4uIz2+1YCBudyDh5CZZXYM4gBB+QFxXaNgWULdthlrZgjw4u1JX1bzYE2f2SeZIQp6VSR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G+g/06Bu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G+g/06Bu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4F21F000FF;
	Mon,  5 Oct 2026 15:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791215062;
	bh=duh1CZ14r9XeWHOeo0rXi5XjMvhGZKGUxzSBxfATc50=;
	h=From:To:Cc:Subject:Date;
	b=G+g/06BuFkh+yJNEzPkCi7GR+Zd+Zx0FLylJfoZy0t4QkmS5nyblDCuBAeaEauFxn
	 zPLlCNIa/MUr/Zjy7l7eDxO237X1br1k19YzsTqUWFMA2gSlQtp1d4uChcqo1WTNc/
	 Rz0kiBk4CUG5NOzFxRyNfJBFLeCpoN5uL89vaHQUlz0QMUawaGKSntlZHjyI1XRuVP
	 AdUeciarYt78LmcWCaKwPbGYGbpCRKv/9q3DXQqQDbfK7C2V+vlKmT4uWbBquVXkuQ
	 YC/inZJras+Ljm5Y6iZkeUQt5U0Dlp7iJE633mwdQHILj5FZct5PT5QsgdkV5PNQEC
	 wuETUD4H6b/XQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] i3c: dw: Support Synaptics sl2610 i3c
Date: Mon,  5 Oct 2026 23:24:22 +0800
Message-ID: <20261005152425.25319-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is subset of the "arm64: add Synaptics SL261X SoCs and RDK boards"
series.

Support the Synaptics SL2610 SoC I3C controller, which is compatible
with the Synopsys DesignWare I3C.

Since v1:
 - collect Reviewed-by tag
 - use sl2610 instead of sl261x
 - restrict altera i3c reset to 1
 - send as a separate series for i3c subsystem

Jisheng Zhang (3):
  dt-bindings: i3c: dw: support up to two reset lines
  i3c: dw: switch to array-based exclusive reset control
  dt-bindings: i3c: Add Synaptics sl2610 i3c

 .../bindings/i3c/snps,dw-i3c-master.yaml      | 16 +++++++++++--
 drivers/i3c/master/dw-i3c-master.c            | 24 ++++++++++++++-----
 drivers/i3c/master/dw-i3c-master.h            |  2 +-
 3 files changed, 33 insertions(+), 9 deletions(-)

-- 
2.53.0

