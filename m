Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794203245;
	b=hD/Bcfrv0uR8hCcw9DhVGd1hzRQ/ZE1d/J5MV2sCP9lQCScH22Q7Ossw3l6cNuaAw3LD
	 NrnKVp1uCE7WZG70/yL9bejkNu1w1ILmb9sY4lV6TY3aebpywyxzzbiAsLj2ylsPf56Yt
	 ouW8wqOR28+hMiZJYPho+WxvwYMu5Va7n6P5K3eMRysrt3oyA3LHMrfJMc/cZihgx5Nzy
	 GAZkK+2uhPOMfrpJZcpdhua/XtoBNfVdZ9aVwn1UqwdaSsDUeCorP6QBT1r7hQGFusD37
	 9OHhnGwWTM5udQv5yaSfQ4ehXsQVvcsE9cUy5YUCpC6gRVvwnsMabVAMCFxEwh1JIJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203245;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ld-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-MTK;
	bh=VD6RiRxqzgMbuMtpaTf0NW9spnUaTmdM30t504BjyK4=;
	b=uR+a1AQCxStFMWLQ4+jtz3uuHwZjECsRCmy32TUJ9A5XDLwKcN8EVwo7qURaRrb++0Oc
	 PMoksylAA2oAWEU5YOTw8XfRiTiWjJgRRtSSPs9fOn8I48tNJaLNeztcV0h9Ou+tzk57p
	 nEsQ65M9tDRAkOWea8zPnHZvtOd2xFAtN+4zvacN1y6eUuqz2r91lBJiPbiIHZE7xckeX
	 bN1i7xvXJJy8PhNVEZ7zTTMsygkwoh3trnSrxwSrqfSoI7N+Xh/WfURWW75qUbQLv6aQu
	 Sg0wOza1GQxoZcBQ0cW/uahv2vC0dICeu3DJW3tJ6LVYnFdf8jVHpu10O8D1IqAZpTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=VYAx0OcH;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=wJ+DpwDv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0F3606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D0F3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=VYAx0OcH;
	dkim=pass (1024-bit key, unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=wJ+DpwDv
X-UUID: 059d6d74dc0111f1b1788b6acf885367-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=VD6RiRxqzgMbuMtpaTf0NW9spnUaTmdM30t504BjyK4=;
	b=VYAx0OcHv9LCSKvHsgufjORvlXHeyJ4seM8l/z6V8YEv55ck/XdmlMN9p5LR/poSF8N0wr+BLt/jsp7crfBdudcktzo9sg90dkhJ9zIWdfGVPBekKqCI6pmDME1JBpRMvikryY6ybsbuYBvCHJWh/1HRpzsiN/vE1VJ03mAi6ws=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:7cf7f95f-728f-47d8-a4a7-3748b7595f0f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:ea7943ee-6961-456c-adce-6d277e14e6ad,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 059d6d74dc0111f1b1788b6acf885367-20261109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1061890995; Mon, 09 Nov 2026 13:47:17 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 9 Nov 2026 13:47:16 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 9 Nov 2026 13:47:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V14eMMyHcrRoQV3DBDKP9GsgM5mjcZSU/WLBbLeNpQeJG+va5F9KtSRu27DGrNFYwr3txj4Vid7pQEF/nmunlaOqie4trFGnv/XBsBzVcWzSot0wQ4Ruuw3LRx+Fml3xwHK3UM4gl8SYYAe+ZlbU8YaWDVMUSEtzuWS8A6jyShq1CP78AOnVurzGBGw52hBin7hbIyIohHuYsmfHWbpna+qfcNwY19+edD9DYvuMitTVHVrJR/5/Vq1N/EJ9TT4qbbgqmmUgVKu2RqAzuXlRNY+GsR0uQI65//IozYz/hGm3xGfymitLXfvjEY0iCaJjr6euStIdJN5U5XUCAuTO2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VD6RiRxqzgMbuMtpaTf0NW9spnUaTmdM30t504BjyK4=;
 b=OMFHXoIIVfu4wEF5hKHvkOSs94Bb+jwlFK3SS6Ue0hYJqLtrZL8q8vco5XyOwURjHTy/SyhIQoSZHtS/CXxLRqCN4c8ioKbN4rwSvBEk0RlWw/HWVUKZk6WvX84EFxgb5cBESt49DL0h4e7gyMahLogWlXJK70MQnC9XrzizJogSf17rncx7V/5bspvHQE5/8c4tNcR+78sRaHAzUbZTFo264UBLWqZex7cJhvdxKoi8cZwUIfleBwP65x5dgC7zdmxgW0nIgnqDvL6F1PFdX6ppNlpswfb9AA3vBzVujxme2nXkMFB98E7L+PQ0BQ/LtWzdJzXvBTaQ4w8ZS+G71Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VD6RiRxqzgMbuMtpaTf0NW9spnUaTmdM30t504BjyK4=;
 b=wJ+DpwDvq7URXYXFDEJlDY1ZWklzEljkMiluAeTAtumDZ4nXFSio6pAn0gLiOkIR5WDZ4jDitabGok1RjVmha/+Yb+snMbJ/H6QWRVI1QdI8YileZfhrFlULCyMYUmY+E1rGjIKCOcdspK34v6fAkRxaH8J12KPuNcfHz3Ho+Ew=
Received: from KUYPR03MB9902.apcprd03.prod.outlook.com (2603:1096:d10:91::20)
 by SI2PR03MB7263.apcprd03.prod.outlook.com (2603:1096:4:1bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 05:47:13 +0000
Received: from KUYPR03MB9902.apcprd03.prod.outlook.com
 ([fe80::9598:2e59:20dd:960b]) by KUYPR03MB9902.apcprd03.prod.outlook.com
 ([fe80::9598:2e59:20dd:960b%5]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 05:47:13 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "agentzoan@gmail.com"
	<agentzoan@gmail.com>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: =?utf-8?B?TmF0aGFuIEx1ICjlkYLmnbHpnJYp?= <Nathan.Lu@mediatek.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
	<Nancy.Lin@mediatek.com>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "airlied@gmail.com"
	<airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] drm/mediatek: mtk_crtc: Look up connector routes in
 the CRTC's own mmsys
Thread-Topic: [PATCH 1/3] drm/mediatek: mtk_crtc: Look up connector routes in
 the CRTC's own mmsys
Thread-Index: AQHdWRmHPvdJdddXJEqggLIWqmtdS7claVUA
Date: Mon, 9 Nov 2026 05:47:13 +0000
Message-ID: <0e610683555f151caf90c4029412ee55b6d0d0ca.camel@mediatek.com>
References: <20261011004248.1117649-1-agentzoan@gmail.com>
	 <20261011004248.1117649-2-agentzoan@gmail.com>
In-Reply-To: <20261011004248.1117649-2-agentzoan@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KUYPR03MB9902:EE_|SI2PR03MB7263:EE_
x-ms-office365-filtering-correlation-id: 3d70c7c2-9bc3-4a76-bf73-08df3e24e778
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|42112799006|1800799024|23010399003|7416014|376014|22082099003|18002099003|38070700021|5023799004|4143699003|11063799006|56012099006|3023799007|261102123227099003|261028144727099003|261021121427099003|261022105027099003|261026121527099003|261026140227099003|10067099003|6133799003;
x-microsoft-antispam-message-info: YtXc3mflYoUux3HJ+Utvp6JT3B438FB50rEGmERQ31BHTVVRQUcHJYYGSErvXlNMGkGImoZB/n3m1Wo0fn0o9QgkYcfU+S1IUnPhZuUaN1OtL54u0VtdcYDIFYWoL5aNoK8KqyRY6fw4j+nNalipCrFyCpp47Je0NFejq/eFeZYTiJBgZr3en0BTxa+4P/ksVy2S70FcbrbsNRjorUKTiJs0sLKeBmq3BFUEKU1mhFuBBbn3iH5hAXUEyAf49HPafL9DZuAV0GvU824EeainXyV5XOi4XPzjdNwobGD1b4V7ZHl9DWzMYVnMxx0+jWcsyCmOfHMSbZR8SDx4LP/kDYrB9o8JcSavcleAFkGrH9mUXpfSe+feu4rLQ/4p/vFjmkM6BHKo30/3pDOUV9D0F61Zwkq7hvJpDsYBYYTVo2IQQ+oiUeReaF9+8OKsxW3SJ8BffUCb9pmhhk64FSkhS1fbecnaKDTmwesnJfTonIOGCIAj/ejCwXqLGPYZDQfXD3XaqETiHcYQ5UqGhXiBtEELfqRZ+p4AiasJ4tvRTSTTsrg48BPvBndGQ+nId6Ggs1ky90omPkceNlvWapXHGIysRQJjCK7qrzM5Uynx45eilyO/JK28EBrvDsKAHBQKxTgaNRF5mPul/gFi12ZeNzmyBRvAokskJpg2w4h/4unoiD7EF084Vh9ofHQ7NwE1tZdHj8Y+cS2c+n3aAjVbUI+ASKU3EwsR2WU7ThOYChY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUYPR03MB9902.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(1800799024)(23010399003)(7416014)(376014)(22082099003)(18002099003)(38070700021)(5023799004)(4143699003)(11063799006)(56012099006)(3023799007)(261102123227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026121527099003)(261026140227099003)(10067099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTdOdVBFUjFWemdMKy9KRFJsQTdOT0c0ejAvK1VBYWhCUmVMMVZTNUMycDJa?=
 =?utf-8?B?UjNBWUI5Y3Vid3l2bmg2Y1Y1eEw2VkxDR3dpTElqY3docGJYdDhUakFVUUQ5?=
 =?utf-8?B?Wm4xVUxObVlhWmpBRkFZOWxVSkJWK3J1YjlwUEpVNkUzRlVRMWpSWjVQeXMv?=
 =?utf-8?B?RGZxcUozS3BZS1JJbTJPbzA0b04vdDFoeWdmTnJIS21iMlhwdWhqTkR2TGNJ?=
 =?utf-8?B?bkN2Rmc0SnBSVU1qdEMvNjJjZU4zWE50OUNOUDRyU3d4enpuQURvOHpEYjVO?=
 =?utf-8?B?UHRtN3lLaUlzWUorVlZudUIwQTBabVhoZlh0RFJmaUprR2g0c2FDVWdTN0JN?=
 =?utf-8?B?VExqMlpKZjBjMDRSOWJXWU9OdnZjdTZ2a1hqdXU5enRqZFYzR2o1NFQzQkNT?=
 =?utf-8?B?cDFBb3VBQkRKbWJaOFdkcTJVTTFsSUxjVTI1Uk1BTDJJL0RkTm9KeGNHcHBi?=
 =?utf-8?B?UEVNT2hxYnlBbW9OTG5zWHY2WjBjZE8zOEFveWZ6QU1EcWhvUDRVb0ZkVlBH?=
 =?utf-8?B?VlBLZmx4OVJQRmdlbGNOblMyMysxZGlsTnhEVVN4TEhTNytFQnFoNWZ5bDJh?=
 =?utf-8?B?NmNHRDh0Vi9vbnRQZWwxOG5DVGpaUElwTFJwenF4UTFBQUMyZi9GcDhzcnJO?=
 =?utf-8?B?OElDazRoQUZnN1BGSHZsazUza0pYbVJ3aVcyUmRvcVRwSTBiVFNqVzRLL0ZN?=
 =?utf-8?B?akRtNWVGdXB1UkRlbFJuZExBNmwzMWh0OFVvZmNFMUtLS2RuOW1DK2NBRTJ1?=
 =?utf-8?B?UDhwVzhlUHZaa1NGNVJQMEZCS3piNXpkUlhscEVGRkxuQUVzRjVqNzdwT21s?=
 =?utf-8?B?b3hjVHB1K2U3QWpCUDhnZUpYa29sd2VhT1ZmWUU1RHg1UTNZUUlpc2t1U2hp?=
 =?utf-8?B?L0Z3OU9PYTdmaHlUNTA1b2ppTlNFRkR5clFyRGJmZVZoODBleE9PdWE5QTBr?=
 =?utf-8?B?aUF5Yk5pdHpESnFHYkt5a1BaSVR0WUJQVlFMVjBEOTl6WnJKM3k0UzZDRTFU?=
 =?utf-8?B?NEh5UEkrcnUvenA4MlA2VXoyN01MNDVOZWJXMnVQT0FKaTJPRm9YUngvK1Ix?=
 =?utf-8?B?MU43Zy9xZTVFTGd4SFd0QmY0VHl4YTF2YXFJQjl5MGdjOVBIS252M3VncWpp?=
 =?utf-8?B?ckVXb2hrNXdGeWpsS2hYRlUrOFRHSFRlYUsrSyt1ZW8va3BPejZNZzhvMit3?=
 =?utf-8?B?MHhPNEY2b0IwaW1vOWxHVlRjL2F2cDBaUlprYjhYbXFtTUZkVlFueXlVejFU?=
 =?utf-8?B?NXNGSTBiMjJudEdVL0JEdGY4R1JBUk9rVVZ3ZExhS1RMUEVaMlJJeWUzc1Bi?=
 =?utf-8?B?TytrNVhJQitsajgralVXWitiS3pYOS9rQ1JNQ0lrbHIxVGZRUnRvRDVnQnBX?=
 =?utf-8?B?dGMxbDIxOFE0Rm56K0NOb1ZmVjRwYTJTUzZib1IveGI4NzE4U0ZCNFc0UGF2?=
 =?utf-8?B?UmFwSFZUQmxhdDVnTHRZRXRHYjMrbFR1T1NVd2haRFhpY1dJOHZNRmxVZEZK?=
 =?utf-8?B?SmhBbHFXRkJsYVRBVG5wKytWdHVEN3hVc2lBeU0vWENJY2JFakdnUWczSnRl?=
 =?utf-8?B?VkYzRWJQVXR5STNSN1RLQ3BrcXJMV3F3YXplWms1bXVTTXR0SXFxS0poS2xN?=
 =?utf-8?B?K0p3enFPajhOOXZJSHdyZFdWTzlJbEN5ZHV5ZGV5SmlVUFFReG8rYmcrWlBU?=
 =?utf-8?B?L0dUdGdRV1lUTnhqUzh4NVBOSGdLV2kva2RLVytSbC95bE1Yc01KT1BvWXVR?=
 =?utf-8?B?UTJYT21PVUZ6aW43bFBuV0Qxd3ZtaDh6VzVjTTBFQlJmaXFrYjVqcGhkRzIw?=
 =?utf-8?B?NGRkcVZnRU4zOWtDZ2VFTVg0ZjlSeUU0U0lPbnE4Tm9iMzRhbE4vR2xRZkdU?=
 =?utf-8?B?R0ZERmpjcjEzUGw5c2JKZHpRZjRoSGNRODY3T0VVYjVjZEJLSXNYMW1kNXRu?=
 =?utf-8?B?ZCtkNXNDWGVuajdoRjZJbmczODVDanhZOTRwMzZwN3B4Z0VHT0ZpczdiTThW?=
 =?utf-8?B?QmlhZytvbWJBcGhYQ3ZIY3p5dWVHU0lKRjVQVjRma1dGZFNKcEVBbFBlVlFZ?=
 =?utf-8?B?Q0pKb1ZlVlFvRHdpeFBiVFRkMkluMnZDenZnY1F2YzdPcTJZSUN0NGFod1Ns?=
 =?utf-8?B?MGtWSC9HM1MzZXp2UllBejFVbk9JSHRaM2JXbVpuOWt0eXptMnVrUWh6OTds?=
 =?utf-8?B?bnBBYmd2ZEdaNUpIRHJlaDdQb3ROYllwS3JONDgwWlhwekY5TkI2R2tsWHhk?=
 =?utf-8?B?OUhNNU5IYVNqUkh4VHdEbWx4K2pQNnVLT3JXdkZrNktaNWUzcloxWHM2eUxC?=
 =?utf-8?B?S2RGR1RSdFNab3RxOEhKYW9yNi9XRFFJT1JMc2NTcklqVG4xZWJiZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DEC16FD68B3F5E448037B0D6CD23269E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BbcS+pfJavVDyQTfMdYP2H2u9QgUrSSx+y2GizIptdH8Fb7E4Y8HO1GXDstfIbuDjczLMs4V08R0Bg+XFsaY6Bh6vxJFqKrtbwAtad0CQbA+2egLtZuesmBrNPSPB6Z2BzxxZh1jVKeKbYmR+DuH/bmUOLHuPwgXtD5QHZm5kV5bTBofZA6EO1w+ltV/HT5moNDRoTZEQH75hmOE8mKsRD+8xskmX8AcINxbN53CLSRdYqtaS+23FuyK/hdOIkdA42rJnNttzwbBX2mRDq9jBEE3F0omSvv4bML6p4V5aV76x0ZgPz7zqLgErHpUz3hed6BPhxxcqpERvpLhn1VMEQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KUYPR03MB9902.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d70c7c2-9bc3-4a76-bf73-08df3e24e778
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2026 05:47:13.2571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Annk5EOuq+bcWfdf3y8aS7+79vkSySyM5AZael5XPMy4a7wst6q/Rb6l+cCvXZ30qNNfJxaxHuvgvAcN9sL1rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB7263
X-MTK: N

T24gU2F0LCAyMDI2LTEwLTEwIGF0IDIwOjQyIC0wNDAwLCB6b2FuMzcgd3JvdGU6DQo+IEV4dGVy
bmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRz
IHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0K
PiANCj4gbXRrX2NydGNfdXBkYXRlX291dHB1dCgpIGZpbmRzIHRoZSBwcml2YXRlIGRhdGEgb2Yg
dGhlIGRpc3BsYXkNCj4gY29udHJvbGxlciAobW1zeXMpIHRoYXQgYSBDUlRDIGJlbG9uZ3MgdG8g
d2l0aA0KPiANCj4gICBwcml2LT5hbGxfZHJtX3ByaXZhdGVbZHJtX2NydGNfaW5kZXgoY3J0Yyld
DQo+IA0KPiBidXQgYWxsX2RybV9wcml2YXRlW10gaGFzIG9uZSBlbnRyeSBwZXIgbW1zeXMgKG1t
c3lzX2Rldl9udW0gZW50cmllcyksDQo+IG5vdCBvbmUgcGVyIENSVEMuIG10a19jcnRjX2NyZWF0
ZSgpIGdldHMgdGhlIHJpZ2h0IGVudHJ5IGZyb20gaXRzDQo+IHByaXZfZGF0YV9pbmRleCBhcmd1
bWVudCwgYW5kIHRoZSB0d28gb25seSBhZ3JlZSB3aGVuIGV2ZXJ5IG1tc3lzDQo+IGRyaXZlcyBl
eGFjdGx5IG9uZSBDUlRDIGFuZCB0aGUgQ1JUQ3MgYXJlIGNyZWF0ZWQgaW4gbW1zeXMgb3JkZXIu
DQo+IA0KPiBXaGVuIGEgQ1JUQyB3aXRoIGNvbm5lY3RvciByb3V0ZXMgc2l0cyBvbiBhbiBtbXN5
cyB0aGF0IGRyaXZlcyBtb3JlDQo+IHRoYW4gb25lIENSVEMsIHRoZSBsb29rdXAgcmVhZHMgcGFz
dCB0aGUgZW5kIG9mIGFsbF9kcm1fcHJpdmF0ZVtdIChvcg0KPiBwaWNrcyBhbm90aGVyIG1tc3lz
JyBkYXRhKSwgYW5kIHRoZSByb3V0ZSBjb21wb25lbnQgdGFrZW4gZnJvbSB0aGF0DQo+IGRhdGEn
cyBkZHBfY29tcFtdIGFycmF5IGlzIGJvZ3VzLiBPbiBhbiBNVDgxODkgYm9hcmQgd2l0aCBjb25u
ZWN0b3INCj4gcm91dGVzIG9uIHRoZSBleHRlcm5hbCBkaXNwbGF5IHBhdGggKENSVEMgMSBvbiB0
aGUgb25seSBtbXN5cyksIHRoZQ0KPiBmaXJzdCBIRE1JIGhvdHBsdWcgb29wc2VkIGluIHRoZSBj
b21wb3NpdG9yJ3MgYXRvbWljIGNvbW1pdC4NCj4gDQo+IFdpdGggdGhlIHJvdXRlIHRhYmxlcyBj
dXJyZW50bHkgaW4gdGhlIHRyZWUgKG9ubHkgTVQ4MTg4IFZET1NZUzAsIHdob3NlDQo+IG1haW4g
cGF0aCBpcyBhbHdheXMgQ1JUQyAwIGFuZCBhbGxfZHJtX3ByaXZhdGVbMF0pIHRoZSB0d28gaW5k
aWNlcw0KPiBoYXBwZW4gdG8gbWF0Y2gsIHNvIG5vdGhpbmcgaW4tdHJlZSBoaXRzIHRoaXMgeWV0
LiBJdCB0cmlnZ2VycyBhcyBzb29uDQo+IGFzIHJvdXRlcyBhcmUgdXNlZCBvbiBhIHBhdGggdGhh
dCBpcyBub3QgdGhlIGZpcnN0IENSVEMgb2YgdGhlIGZpcnN0DQo+IG1tc3lzLg0KPiANCj4gUmVt
ZW1iZXIgdGhlIG1tc3lzIHByaXZhdGUgZGF0YSBtdGtfY3J0Y19jcmVhdGUoKSB1c2VkIGZvciB0
aGUgQ1JUQyBhbmQNCj4gdXNlIGl0IGluIG10a19jcnRjX3VwZGF0ZV9vdXRwdXQoKS4NCg0KUmV2
aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IEZpeGVzOiAwMTM4
OWIzMjRjOTcgKCJkcm0vbWVkaWF0ZWs6IEFkZCBjb25uZWN0b3IgZHluYW1pYyBzZWxlY3Rpb24g
Y2FwYWJpbGl0eSIpDQo+IEFzc2lzdGVkLWJ5OiBMTE0NCj4gU2lnbmVkLW9mZi1ieTogem9hbjM3
IDxhZ2VudHpvYW5AZ21haWwuY29tPg0KPiAtLS0NCj4gDQoNCg==
