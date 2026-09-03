Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A6A3DE44E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788416475; cv=none; b=tA6T4gew/tbHbqgVMJQpCzIKz8AGyDBOTnmvxwVvwBNpdZNiD17BuI74LLkLbSjVsIdMARINoxN39kfGfFHjGdwK8gDEBq1/2+HHigjgkhd4HOEpgPYmC7WcRDR0j8UDzvRYYim7cusZRYNM2MwQT+JR9+PfFa0iGHo72YDFtoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788416475; c=relaxed/simple;
	bh=XG3BxX0Uw/x8HNNXuxl8zIFfZqsrvaw579mGIG30J0c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kaSC56kkiST3FPhGGRGqpABjliENa/VvL/JnB03WtzFx/o8XoYmYHXJJ+y39VupzZtcVO/gKVbQVeOWTcydEzY8uE+Bs3IzNW7GNcu6xqXjxYoaX16Lo0ex6BvAQEQwesMfc+s8q4ocMiZBzqgNOdLJ8PZoMMl4nsqoJT5/t4Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=bKRxhGa7; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bKRxhGa7"
X-UUID: a4f54e54a75f11f1b1788b6acf885367-20260903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Qw3W+KwFYdfCK9rOm2VvyF6S/Jc4aivlCkeIo46AHDg=;
	b=bKRxhGa7hvi7D+4wta55OEb9Ls8iZ/GO1+eXdtE4NZwK0rKDJ8z4pUCq9oFFXCctAAT9t1Jg8tjMERtU6DG+mTOYGFbL3YAbKUN8MLNyossc3CsqUHvSg80FVq37rQSkToabAV/VUOUxkKi55CygnvYNu9Q17LgNy+Z5jFV1pzs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:38fe11cf-9183-4d1a-879f-5997fc8e1c20,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:f4029469-c015-4b00-92fb-10ac781f004b,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a4f54e54a75f11f1b1788b6acf885367-20260903
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1662269822; Thu, 03 Sep 2026 14:21:05 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 3 Sep 2026 14:21:04 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 3 Sep 2026 14:21:04 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH 0/2] Allow mtk-regulator-coupler to be built as a module
Date: Thu, 3 Sep 2026 14:20:45 +0800
Message-ID: <20260903062056.1024263-1-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

MTK_REGULATOR_COUPLER can currently only be built into the kernel: it is
a bool, and its prompt is hidden unless COMPILE_TEST is set, so on real
MediaTek configurations the symbol has no prompt and is forced to its
"default ARCH_MEDIATEK" value.

Kernels that ship nearly everything as a module (Android GKI style
kernels, but distro kernels have the same shape) cannot use it that way.
Two things are in the way:

  - the four helpers the coupler calls are declared in
    include/linux/regulator/coupler.h for coupler implementations to
    use, but none of them is exported (patch 1);

  - the Kconfig symbol is a bool without a usable prompt (patch 2).

With both patches applied, CONFIG_MTK_REGULATOR_COUPLER=m builds and
mtk_regulator_coupler.ko loads and registers the coupler. Existing
configurations are unaffected: "default ARCH_MEDIATEK" is kept, so they
keep building the coupler in.

Justin Yeh (2):
  regulator: core: Export helpers used by regulator couplers
  soc: mediatek: mtk-regulator-coupler: Allow building as a module

 drivers/regulator/core.c     | 4 ++++
 drivers/soc/mediatek/Kconfig | 6 +++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.45.2

