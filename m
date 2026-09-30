Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B216F31F98E;
	Wed, 30 Sep 2026 10:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763943; cv=none; b=BD+KzwwHk/MtLmboyZkCHu0dyBH6DEqYly4DqLHX5fvTvKltx3NFavoFTq/eSzp+RjhT49LUB2o07qiKXjOML3y9pTwTMLJW5G+WbOz6Jbk1VWPlEC/unqZAK9nAUW/h7fuPec1zltWtRDZGZf1inbLtMe2S4jY6ZSpAxu0fhlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763943; c=relaxed/simple;
	bh=57W3fz2Inh+LJclOtaM2/ncItmWTdEQfi/XWK8HOPZg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dbEZbX9ugxBoJmhoK/uIu3hShkGB/AGleL2jIzdHYzU9NRhp5qyc2n25ESXA6S4rII81gZinQdRXNYhNQipFVdgp8ZF8ha8KTsdSDSu261C99LhkGnsJBA9vSdbef3u3u5MHbQa9XgLJQ2H7Fu8kvLDUbsNjGFFTrQRzbGuV6Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=KM5TxsoF; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="KM5TxsoF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XU8HIZpe1oO3y7TtlBE8Jw6wJiFXsm+bmC+ZhFp7YSg=; b=KM5TxsoFwFCXK6I69LZ1GeAFeP
	JW3UrKPurS2NtH0yspyP+Si/+5qDPJPNnDZJxkgPhL5xegr3mlCbKqy3B/0PGq28s6x4Yia7WwWvt
	nV3PJW+cmHGsqJ7knW2ry6mOHfPwZUoHgjg/5ZukepnrKX+CyM0U3uH68uczvwX/lgZfMmxCNqpT5
	AUgUS4EDfYKX7kHkPQzf+gi0JzWCoTxJlQuoN118GEuilp0N1I1JFoxjtZatz5dAAPdrLBD3xQ5p0
	VZKcZvuWoE4LGm+kr9QuKXw85q8pAhKn+X8UsesEq8dLBPJKObKKbGjbB5mcGBwWsXLdLsXgY4dqp
	hmG0fdgg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:37230 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xBrVI-00000000YWu-28ga;
	Wed, 30 Sep 2026 12:25:34 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 0/4] ARM: dts: imx6: phycore-som: PMIC and PHY fixes
Date: Wed, 30 Sep 2026 12:25:28 +0200
Message-Id: <20260930102532.2262700-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

A few small fixes for the PHYTEC phyCORE-i.MX6 SOM:

- Pin the DA9062 PMIC watchdog to /dev/watchdog0 (1/4).
- Raise the PMIC's SOC/ARM buck ceiling to 1.5V, needed once the
  1.2GHz OPP tier ([1]] requests 1.3V for VDD_ARM and the anatop
  LDO's 125mV dropout is added on top (2/4).
- Migrate the Ethernet PHY reset off the deprecated fsl,fec.yaml
  phy-reset-gpios property onto the generic ethernet-phy.yaml
  reset-gpios/reset-assert-us binding (3/4, 4/4).

[1] https://lore.kernel.org/all/20260923070505.494949-1-primoz.fiser@norik.com/

Primoz Fiser (4):
  ARM: dts: imx6: phycore-som: Set PMIC watchdog alias as default
  ARM: dts: imx6: phycore-som: Increase PMIC max SOC and ARM voltage
  ARM: dts: imx6: phycore-som: Convert to generic PHY reset binding
  ARM: dts: imx6: phycore-som: Add reset-assert-us for PHY reset

 .../boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi   | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
2.34.1

