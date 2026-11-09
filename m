Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794223388;
	b=hOWEHh9EInyWgOFbuoBtZXdy6KO2BRuoHzZg4EyhdWBZ8E1TIS2lHcFmWeOXrdhmWoYH
	 LHwgxoTUSm953AbdAcP3qEkNc/GwfL/AUgR9XQRs7EomdX2zFx6GjPK+qn7eJy/aWt4KY
	 A+Kn/hG2GiTfGxoc/3n1m1YqAH4637TkQt5HfG2kRkGMWZBFf/cLpF1LQ9ILPXSbXpjhh
	 KC4eXhyhoG7HM6crg0oLnsYxHYeJkCoW62VBKsBpQ5Zk+NZW0xmnZJCCoAWvnxmej17Bp
	 7/ivNoy/V104arppFhByaNp1MkBnJInEiBFYSJ4SsA7jd4Cu46lrrJmSrJYrCrd6+lQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223388;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Reason;
	bh=Ihf8n/EtISRnt0mjoAqtPx2TyvVXlWVdxueg2vaXTIU=;
	b=QsPYkSZcmkxWBkBRkMbLe4hQY4GBdo9omCLDYugQu8RSzZKKtKkg6Qx5VcvO0ayEtix/
	 dV4oIpq8OBIb0T57covAbd+N6kfRwUotmUAJV9toygEZcJvLW9crpZvoy2Vq1pZP4nHyn
	 GCuSSgHMAQTmE28xGEgC4pdz2TUgpbmAdDarnytY2tIVVvEfd7uGJe7Q+ak4y2cSDvaEw
	 e8of9KjCp9gUXGCkW76CayAgiVT86fCQqsvZwXBc3vZAyh2DGMcbkDoUpEDgTaxYXoJf4
	 2Jg3ZlVlIyTVYPf6FicH243l5HHuz3AgwSX1je7xDhDXkvwcx0ooAfro4dIv6hGhiOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=iVC3awv+;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b="fc/C9g3G";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C49606A339;
	Mon,  9 Nov 2026 11:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3C49606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=iVC3awv+;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=fc/C9g3G
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9BJodw2890524;
	Mon, 9 Nov 2026 05:22:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Ihf8n/EtISRnt0mjoA
	qtPx2TyvVXlWVdxueg2vaXTIU=; b=iVC3awv+30n1E6TEu8pI1k5VY5KLJK8oIJ
	TIl8C43DFJLqgsnsAgTe2mg4Yn9PftV4Wsp1Tu/dvvQU/vrPQr+I+jSj+65sUP2L
	nuiJt4oD+BfLj2lP4ZZxfk6qBgpezxjLbJVbq6yOPLrGbmNadAKmZbioXK5d1J7a
	ik5NtRtY1vS3OxHIoWgH4i7hqUeuUE9zZEabeG4bv8N5p92TZYMvwbFx+/aOQKkr
	IRhtcx7dHKswJJ5bE+Rj29Hm43lwSKg3fp8m0oeE8ooFDLWbTrpU+tyPOpVadUwz
	Me4lXzmgBn2lSEtYl1qzlFlHEF3TTprOsMQmE7axC+jbZEnnI69g==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021109.outbound.protection.outlook.com [40.93.194.109])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ht19p9ykx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 05:22:51 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4At2sSNdDFwg0X6V8pxaMM4nZkvZ48tP+blVriZHhDbMGOGws+m/MDwkFqib4N2vnw7ogeGe6XYGg8F6oZb620trpZVSLB1ivSGfZ4bGFQTn/KJCOvmcBOwzM9gW4SDBKPow+b6WN4Ou1NASlr/5uF8z3uiOxm1wvdTdivXTpg+kHCi+wO1Y0tKK6wMbSfRmw4K96csfQEjH4q5ZB7RCABA6og8hticYZ21w1Q5VDowVhQL0AvA9ca7EKaSzIMCaTYRkK2Mv/Okjmf8q0BzBuX8z4v4wQpZwcxhgK9I99mBY/k7gxlrAA8a5RuDA/PHegJnCPVUzczKFCmPRrFR2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ihf8n/EtISRnt0mjoAqtPx2TyvVXlWVdxueg2vaXTIU=;
 b=jcy04gZdvMteMV1WQlnib9/ZhLO9Y5CW+ccMqe6i7aqqoPR+e0m2ZYYxl1EqZ7+HHtrhqZf5tZSRhq+rYIqW0vlmXmYUE71KQBZSvz3QiA3JECAcI8m/26SmMSS9g2tu4CTm5kZUw6fo3agPyOk13/ct89tVmiuts0fTZcg48FAci7nlF5fkpfS6r02I7U0FbgRy26HInlVsDUsNbPxGuVjUzXa4O5MfWfwALwGapArSbRg5kdFBsJUbKgiRjcpiFgtis8x3y0InXhIFCrbpd8ueXqpICzHLohqwFySCFkbscfHktkngifBZjvOWXUhdf4OZN9KFeCb680tiR8FLwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ihf8n/EtISRnt0mjoAqtPx2TyvVXlWVdxueg2vaXTIU=;
 b=fc/C9g3G0g5BQmVIADK4cVSq7U0G7vFgSuX3eeJek+Pzat2HQWEooH23Paz0aMtA9PalY2bgMZVAq4kJ9xfpbu/TG47WPgapzGWGREzKb/Tf6OTMmUjOhDc3N+qOTDwI84N0ohTPzDkWPppxC0YFQK6MVmnVJ8PphbSVhuzpQI0=
Received: from BN9PR03CA0939.namprd03.prod.outlook.com (2603:10b6:408:108::14)
 by PH7PR19MB7363.namprd19.prod.outlook.com (2603:10b6:510:273::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 11:22:47 +0000
Received: from BN3PEPF00022BC3.namprd05.prod.outlook.com
 (2603:10b6:408:108:cafe::6c) by BN9PR03CA0939.outlook.office365.com
 (2603:10b6:408:108::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 11:22:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF00022BC3.mail.protection.outlook.com (10.167.248.215) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 9 Nov 2026 11:22:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 67D3740654E;
	Mon,  9 Nov 2026 11:22:45 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 42940820273;
	Mon,  9 Nov 2026 11:22:45 +0000 (UTC)
Date: Mon, 9 Nov 2026 11:22:44 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Mark Brown <broonie@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: arizona-jack: Fix runtime PM leak in
 arizona_start_mic()
Message-ID: <avGtBFkyGtKOfSs3@opensource.cirrus.com>
References: <20260917164625.2163097-1-vulab@iscas.ac.cn>
 <aq1TUA77ukvvBjso@opensource.cirrus.com>
 <20261108114629.3205150-1-vulab@iscas.ac.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108114629.3205150-1-vulab@iscas.ac.cn>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC3:EE_|PH7PR19MB7363:EE_
X-MS-Office365-Filtering-Correlation-Id: 920fcf5d-408a-4d0e-0899-08df3e53c7d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|61400799027|16102099003|22082099003|18002099003|10067099003|4143699003|56012099006|11063799006|261028144727099003|261026121527099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	oe071qTZHXaiORa0PiIublAiagRAQHnTs4FTOQAbnRL/fMyTp7oCdb0wtDjCYk8j89FUO9xSTkSRlSgbP8Sq5BLrPV8QgDk+KEvckGwVuYi2nHpo0AETDNht7BIL4MU1+fp1NZrS3gdf2vJTXnOk6T71eK+QSLuW0cIjvNnN8LUV1AFKHCcQ1JfCDCUDpSXT56PXBbQtO5uU/8b3dN1a9mUtiGsSwt8znkUlSTtElrWvikASZD0hjNi4a0o4ScLpj+G2cUV0hj711QVq2OgfiKx8y3jSH3ZUb+h0rR5wgvDKy9bN4W6VlIB7Nre+0cuua+yRo9kZ3Jr9PEDpYrNoMLdPM5enRuBKGhHxUz6vGBr9glDoYPVcEwPB4kgosVZ7QMKRtfqMH4YfeiuteSAC0L/r/xAf1uuHCnx0k+kSmvYXaZTgIaqmiYbQB52STYoIhJIuAMc0NA3abhsFai2iHB+BbOoDJcx2C9Bv2yQG/mJOmJ54s5T9BJX05rtyA2m0cmClioP76054to+ZwTDXzePxyGYAXxeWV91+zG6N+C6ce78JrpBzqvhAw2se7NrbRX6jLgfzWKz11LzFqRnX5hAVqV80iV5uQmfD8/eFmwAPDB7si6FWOO5OZOczx95Sn1o9RVTCNI+sOW2wzVqPhNJdDOcYIz5Z8ohMhZa1tJWl8K8uh30OvZ0rH6ROcpcqbOhJI4tgMzoRxofmxlmAVA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(61400799027)(16102099003)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006)(11063799006)(261028144727099003)(261026121527099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Wl6kJA52QyQ0aD7eVoUIGiW055ZHCNrZSDD/MC/jmo5myvz1aKrzszeJx0UQH4rODBjRDhIYiBOybtpQUIiVLz2IQ1NqIfDgCDjgqA4N3A5rsZ9lqHUQyAOLcC31sML7FDhZeneglpAP8rJOxgoVjxn8VQQ4vQYkvdTMtSQJaE/CObokJlqeJs08CvYWxiHGr6vMUea0Pp0VAqKOlkIvDsuXj1j8GG6y+dIJrF2vX21znhFFCL6EDTXOcM8nn01dw3nBTplFcg4qtJlO4iTCJQDZoP72vdvS03khkW4Zd/cc9KG10T0WYuBiGJ98hsAvLnLGNEBN/aQw35XuCApVb3s4H9CFaDs0t1+PUKCDNSkmH5cj3elpW/qvEkMcg39dlo8ZWKoAVpY1/3FiPiA8SB3e9hAnyNicd+OAGBFqiaHcYtubR+T0C1jyqVattJh0
X-Exchange-RoutingPolicyChecked:
	PJwePGztD6OwN0mp5oMmH58gG6fjW84OBPjZNyEXrczYP+9+l1SA53r9PcO5mEZlLpYNC1vIOoSKTU/9t5wKzMqLnlDaNmvq15l1rMClV3gb4X7JlBikTYnGOGuE7RkN50R29YrLw3PQ5+1yf6uVgGMOVucKi1fov6y2UsEYE+gTxvz9YOUR6/vQ9lnNftT9uqKD3xWkyrq5BKZaNJf/U/2yTjmhB8IhBjyA2YpHa1eZr6crlpfm4BS2TRkMuB56D9XgbRbwn6nRg04dPYxl+2vem9odxlah6r+zBcMQQan9pk97mSKHmw4x2y3cnWXmCRCxTENvgFoAxAoVNm0SgQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 11:22:46.3401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 920fcf5d-408a-4d0e-0899-08df3e53c7d3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BC3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7363
X-Proofpoint-GUID: BrLe9qiS6M4WsV_QxBZwwH9Bcp-chaSw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfXwM3D8j7E5nMq
 k1ebWe9eHdVbBKVjQljgBIdApHtmF40V//ow956Fvd1XYxMbGlCtBJYHlzW9YInGNxovzR8xEvK
 EqoHxgW8E33ymf8OFq9CbOIEZvPJzTE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfXyvRWDbT+T7yD
 eyrBcvUNBaJN2XvliL19DXmUVINnqtMIUUFEwaCdETbkamgsD4pgtB9wRZk5S0j+bu2Hg/mUukv
 9ScMcfUMqLSLXsBkMIbnJxNz4+UaZM5fV95NRjUSQSs+K/tTvHcVVVnJxCHcOImkhT1Nb2KtyDO
 AFmjzS4hX35PAvc7Nd6xFMwnF+2tDTIXAehjOHyUzIjqi3u0VajT5SUyUV9rxvFduoTV4MAzu0r
 ZwrLJ+8BbWLzirS+wHtz9NIkjBgZ+X17QmBioPElCLY5zfAjhQ5ItmpP7g5w6R7B9sGpkHeYb/g
 LXHB8PAqmVY2TTGQ6xwA6edgm7WRhR6O4lP7DMesKqP1cBsqJgbWP3wU5coysG5z5Yv01em8g1C
 7MnXhUoJ4Zh7FvAsQVeWu9x25E7KTDM1LkkqR38DpuBjaMoTTiZeiDkgGkXDYWRhMyQo7XM72pC
 fUyB2V+OeJ0yunEu1JQ==
X-Proofpoint-ORIG-GUID: BrLe9qiS6M4WsV_QxBZwwH9Bcp-chaSw
X-Authority-Analysis: v=2.4 cv=NK5AaE6g c=1 sm=1 tr=0 ts=6af1ad0b cx=c_pps
 a=mU+v3NmKB8T18PSzrq+lTA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=NfmiX1MS6yppl74iWOoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Sun, Nov 08, 2026 at 11:46:29AM +0000, Wentao Liang wrote:
> Hi Charles,
> 
> Sorry for the very late reply, and for the time you spent on a patch
> that should not have been sent.

No problem :-)

> You are right, and I am withdrawing it. By that point the function has
> already taken the runtime PM reference, enabled MICVDD and pulsed
> micbias, so a bare put would drop the reference without the rest of the
> teardown; and as you say, a failed MICD enable most likely only means
> the headset buttons are dead while the mic still records. Tearing all
> of that down properly would need the regulator and DAPM side too, which
> I cannot validate without hardware. Please disregard the patch; I will
> not send a v2.
> 
> I take the general point about these HPDET and MIC sequences, and I will
> not touch them again until I can test on hardware. I am also going
> through the outstanding review comments by hand, and I will not send
> patches in bulk any more.

Just take a little care with them, lot of subtlety there.

Thanks,
Charles
