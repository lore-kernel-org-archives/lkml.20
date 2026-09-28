Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E172849C4D0;
	Mon, 28 Sep 2026 11:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594526; cv=none; b=rW953ETk3Iv6SWFbVX6qxE00+oNt74WtXSk5aVZsIS+IbdMwzeQTonKOlaN7nhvLiT5jmp/Y5j5bj2jXivLWMG9JuD70Pcg8OkKYPlzCDU+eX/nWnf2IXMWwj753SY922vKXCxPO092WFvtxt8qX7blD7y7Gff8uk4+/8KEed9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594526; c=relaxed/simple;
	bh=FeRe+FH3XUrQtvQmyWAoIqgCPVoofephEduMwOMAcTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hT3oyOR0HjiP9NlHABb9IeX9I9JgDuJbDYC8jjNdz328uD5SC8rJqhyntxMNkXQoRLcf9FEoqvlcEc1OvCcsZGuKs8UQVp0mz33xWhXyqjy295TQKCJclEpu9gcdkUtB79j/va3zipT/d54n12k202BhXABwQOZv2Oo3V3Q+OyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=IfDOZfkI; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="IfDOZfkI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=7vZK3vppnPXE9w+XkjoZFUqXpNJS9jy09Vj+8yd4Fjc=; b=IfDOZfkIlnpP7Ba5hxOdolNLjf
	6ACdrrab22gjJo2npM95shBKfxh2L3WgvS2hg3XyTqFZqghrqhuXotZhGfgeRvv3NGWxcqG6Mdkhy
	nCse74L7xPBEcg99GxtBZzS+/8nSys1sVMyMqwq4/OyTp/rBYIzajvoQcurMqOgFJD0CXhGeZrBf2
	2EgwhmpDLyAFeFUGvqqQBov8y1Hnc3FoPrZuM+mCK05doRpy4O9npcatI3+C0RNj2MtQWfgZ7cZr3
	1G42fCTEqKeIGlIQR+IusCppcrgpgzis6WbNTXwN3DteiNJGM7TyweqrTDmyjx1IfcPKpZ0KZxzUo
	VRvDa5Ag==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xB9Qj-000GD8-24;
	Mon, 28 Sep 2026 13:21:57 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xB9Qi-0006Dd-2h;
	Mon, 28 Sep 2026 13:21:57 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/2] arm64: dts: imx95-tqma9596sa-mb-smarc-2.dts: improve SD reset pulse
Date: Mon, 28 Sep 2026 13:21:41 +0200
Message-ID: <20260928112143.294091-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28137/Mon Sep 28 08:24:12 2026)

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

SD card spec says that at least 1 msec of power cut is needed
to reset an SD card. This is needed to get out of UHS-I mode.

In fact this pulse length alone is far too short in real world
environment due to capacitance etc. Implement a longer pulse using
regulator settings: 200 msec as working for other SoM using MB-SMARC-2.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
index 97726eded0f86..e376d3a9d6180 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
@@ -243,6 +243,8 @@ &pcie1 {
 };
 
 &reg_sdvmmc {
+	startup-delay-us = <100>;
+	off-on-delay-us = <200000>;
 	status = "okay";
 };
 
-- 
2.55.0

