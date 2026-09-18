Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF7E7260D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789691859; cv=none; b=sS6q83lrwf91I50nDXo///j0HuCBeMSxzlsamU4EBaP0nLWlnaDPntQmE04cDZ/fH8dP5OvhvsmvRPLvwLhuXRLN9GGUs21Odw3UXIaSZFoK7nipG2K5vRohLRZMb/OP8qqGzQwll6SUfNJVUxAKy+q47C+56zL2j/BTzVVEne0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789691859; c=relaxed/simple;
	bh=1gwNE+OBSnQyLjeDU8H4XDoiVsytL2D9V4t/U5WKHu8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ir1QwMHuG2wkHyX48UmnikRYIMcgq8JPVmdwt4bbz36YjTc5ZxZpQF5GQw+tg87V6zSEnebXKU+JzraoUJoHsWVrpP0UEBRy4cV+UvhJlW3ZJpfdHYvkbC2tFgqrfuQOPBmQPFUYMSntw4ZLGjDMcidPKavUOmevYzG1yxn7wjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=O0rVwSh5; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="O0rVwSh5"
X-UUID: 1d8b7056b2f911f1b1788b6acf885367-20260918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1gwNE+OBSnQyLjeDU8H4XDoiVsytL2D9V4t/U5WKHu8=;
	b=O0rVwSh5F81ot508m8Q9fWpIAAVAoohpA7b5k1r4x/V/sS7Mi6IUlDU06ZKrF9cD39KJUy/d3PfqIa2E5oFmP/v+QqnH9PN5dvAx3zSn3ZIewn3JkIrdF45Gn3KmlI8F9hJ+TxABrcF2IpmJiO9RI9EQyP7jluNyKwRmTd9v9DA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:1663853e-9bac-4343-acf8-fe8e4f27c4b6,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:0b37e792-6bb9-4981-a431-c1037949190e,B
	ulkID:nil,BulkQuantity:0,SF:81|82|83|102|836|865|888|898,TC:-5,Content:0|1
	5|50|99,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1d8b7056b2f911f1b1788b6acf885367-20260918
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1497972149; Fri, 18 Sep 2026 08:37:23 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 18 Sep 2026 08:37:22 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 18 Sep 2026 08:37:22 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 0/2] Allow mtk-regulator-coupler to be built as a module
Date: Fri, 18 Sep 2026 08:37:22 +0800
Message-ID: <20260918003722.2764284-1-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260903062056.1024263-1-justin.yeh@mediatek.com>
References: <20260903062056.1024263-1-justin.yeh@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Hi Mark, Liam, Matthias, Angelo,

Gentle ping on this series, sent two weeks ago:
https://lore.kernel.org/all/20260903062056.1024263-1-justin.yeh@mediatek.com/

Is it OK to pick up as it is, or is there something you would like me to
change first?

One note on the routing: patch 2/2 (soc/mediatek Kconfig) depends on the
exports added by patch 1/2 (regulator core), so the two have to land in
that order - ideally via the same tree.

Thanks,
Justin
