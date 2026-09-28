Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021130.outbound.protection.outlook.com [52.101.70.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91D04BD374;
	Mon, 28 Sep 2026 13:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.130
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601781; cv=fail; b=g8soxfkne1lTGfF508fm9STN3lMm4Hj2DojjAlX3N4YBoJbAdjJ6sewhh4HelLKNVyULpkjH2SPRY15kVDw8zqWTdnUO3Z0WTUd36M1Fi6TL32B9BoJhCEuovuvWAWAJaX9qAJIlaI12Nm9neAL33mok+1mlHOBhQLG7EF7w7g0=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601781; c=relaxed/simple;
	bh=P4RARKXE0uQbzJReiHHL9/GAiJJ7SxBYaSBDd1jGyng=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A0dMRtKDd0yaGyjz7Cc0lPkcz6XiokHiJxMRUQTJuw9bKh2dnvB8hZX/mw0nqKelXhUf5lhbg5460YAxFC8RqgigcJFVHxPL8sh5TC8KUZCPUv3yZa632oFeRygZEV08xu9yhY1ExtnBV8GyRJW94udkYjLifkcGjuYZeunFhGY=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=uv36a2v7; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=uv36a2v7; arc=fail smtp.client-ip=52.101.70.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="uv36a2v7";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="uv36a2v7"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iQa6JufO7L3ET+3KH4qbq1scW7ihiunOw6B19Kgnkhox2pLZzbZzrE5RqRXZmPxXna2mEb0PLdPpWisUOJPNhLA3dCat+CroSTe+ePLwACnk8ftt05NLzU437XaiB3zfr2ZNNN2Ks6FL8167IFzPBuCqIBBWj06DG23q27BgbuLONOfDbJzYrrLqV7gZZZuOWOPID6rG50ZFEZjd6+raEFcmV2/u3Jv1TT/OaxxqUf3ZPbnzaPSy+dbDQpjs8nwN/t3T9CCXq+KSGCg5XqaMwiMIfk1Y1dEMmFkMmtVmhKiXNy8wlJ1ulVqFWg74dG/Y2+Q4a19FnK8FAL7Wak01ng==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4RARKXE0uQbzJReiHHL9/GAiJJ7SxBYaSBDd1jGyng=;
 b=Ec/g0PxYNu6jyKHLsFriaehbtteFTLQbFlIxsGdRAyHpFpGZLtHy+Phjnat6rbxC0FljE5EnuvlncOCV5nwmj9RqvMrahbmMDc23t1jNaMCS/Q0NTEzOUhHiF8h3NJsk3/x7+YaA+7hUTBn3bqK3iZM1t4KX8V7FafqLWCAhoqHeeYUuy4rkBZMgAiueFCRD7z0a9fpceru06KG4Nh38KOLC7zpa50pnBMP0oj1RhOdUSW2G535DrnIk4iWHH3dnz53qEACxyb3ciORwhz/Ss88Lwubz8TKpPQZx2Q2gxJ65qTH/Cp7GMmRAyJ86AJoaC++llPzAZh3xAUdQ66gCQg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,2,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4RARKXE0uQbzJReiHHL9/GAiJJ7SxBYaSBDd1jGyng=;
 b=uv36a2v7V2kkVtuvh0L0/Vc0XvQdha20jBInlALqDLGNPlI5LKnrvvCG24dxRb3BCmhPfFenC5y2QATDSxp2ktzaek+8if8VxJZq1Savdy+Mj29EgOUKRDg+z7ygeWwn62V8Bc8R+T2n3zVjsfzh5YbfplzEx+EyHcrFF2+/A540gXxfhmRkzV1DzPFgHZRc9UELh/74I0YsrW0BzwXKQZdhR/MSornjepmKBZLSX+95Oc4TqTjaoIq6foI7Y/m32Lq9OiD54s2UxcqYQu/DExlYK052wioKoCAmi2iywdKkyWnAxw7hP/CyUVPVyIXccuBOP+VfAe4dKB7n4rPE7Q==
Received: from PR1P264CA0081.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cc::19)
 by MI9PR04MB338771.eurprd04.prod.outlook.com (2603:10a6:290:87::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 13:22:56 +0000
Received: from ZR1PEPF0000E6AD.eurprd05.prod.outlook.com
 (2603:10a6:102:2cc:cafe::a2) by PR1P264CA0081.outlook.office365.com
 (2603:10a6:102:2cc::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 13:22:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 ZR1PEPF0000E6AD.mail.protection.outlook.com (10.167.241.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 13:22:55 +0000
Received: from emails-4271770-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-124.eu-west-1.compute.internal [10.20.6.124])
	by mta-outgoing-dlp-942-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 99D2580283;
	Mon, 28 Sep 2026 13:22:55 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790601775;
 b=g17XwzBftRILX7LQMpMgH4uMQIOuERppCKf2Wd/Ay2nnJXtPqH+sCrmWOa6GHjKEb5rua
 dbofgBaF0dZLKRYycFU6GujnGeSM8ZJl2lvHyW400RPwGKxx+SCDGBKeu8ZXYnlTRWvVqRF
 oEsExrM9mPUlnamIzClPiJONKChH0tQ=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790601775; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=P4RARKXE0uQbzJReiHHL9/GAiJJ7SxBYaSBDd1jGyng=;
 b=ciiewDN8+fe3VdDl/iQkgCuPclcqE5ZXm+RY2pLCMKOyBLpYGTmJYz3Kx2qj0t8lwaMSt
 MxNR35rmRcB+RV3hgeUo48oUxcD7Z5G6Xuq/MOZazvcbonzDNRMNmI8IcuasV2TwE/W3QBu
 IS555dGVkwbdrquCYG23svmVn3iDdx4=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4RARKXE0uQbzJReiHHL9/GAiJJ7SxBYaSBDd1jGyng=;
 b=uv36a2v7V2kkVtuvh0L0/Vc0XvQdha20jBInlALqDLGNPlI5LKnrvvCG24dxRb3BCmhPfFenC5y2QATDSxp2ktzaek+8if8VxJZq1Savdy+Mj29EgOUKRDg+z7ygeWwn62V8Bc8R+T2n3zVjsfzh5YbfplzEx+EyHcrFF2+/A540gXxfhmRkzV1DzPFgHZRc9UELh/74I0YsrW0BzwXKQZdhR/MSornjepmKBZLSX+95Oc4TqTjaoIq6foI7Y/m32Lq9OiD54s2UxcqYQu/DExlYK052wioKoCAmi2iywdKkyWnAxw7hP/CyUVPVyIXccuBOP+VfAe4dKB7n4rPE7Q==
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by GV1PR04MB11526.eurprd04.prod.outlook.com (2603:10a6:150:282::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 13:22:41 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 13:22:41 +0000
From: Josua Mayer <josua@solid-run.com>
To: Rob Herring <robh@kernel.org>, "Frank.Li@oss.nxp.com"
	<Frank.Li@oss.nxp.com>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:ARM/FREESCALE
 IMX / MXC / LAYERSCAPE ARM ARCHIT..." <imx@lists.linux.dev>, "moderated
 list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..."
	<linux-arm-kernel@lists.infradead.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mn-solidsense-n8-compact: drop
 undocumented adi,led-polarity
Thread-Topic: [PATCH 1/1] arm64: dts: imx8mn-solidsense-n8-compact: drop
 undocumented adi,led-polarity
Thread-Index: AQHdS6BuOXbhom7Vt02XyzJSxPxhH7bfztmAgAQyxQA=
Date: Mon, 28 Sep 2026 13:22:40 +0000
Message-ID: <5c5422b5-f741-4139-b429-339e2531fd6b@solid-run.com>
References: <20260923211312.3793073-1-Frank.Li@oss.nxp.com>
 <CAL_JsqLKjc2KVbnj=Tyq2Vk_KRV-M3REv3TvwfA_D2R8CU91vg@mail.gmail.com>
In-Reply-To:
 <CAL_JsqLKjc2KVbnj=Tyq2Vk_KRV-M3REv3TvwfA_D2R8CU91vg@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	MMZPR04MB400504:EE_|GV1PR04MB11526:EE_|ZR1PEPF0000E6AD:EE_|MI9PR04MB338771:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef37a76-b696-448a-5e85-08df1d639bb6
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|23010399003|7416014|376014|1800799024|366016|10067099003|18002099003|22082099003|56012099006|4143699003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 oGeNQ3xfb3y02V9mGwXn9bZYQvZ6viYTLVkVACyLo+eDcwbu7Ik1ur1YWALNXFRcqyPMCJMMetI2qNmPOmvt2EjmWqqI/pPxreRNB6hoWWBg82P75PDgZ2ehLLDSMCFEcvl0xuw/nYlXqpMkKye0TVdoTUGOAoJsCabeX/K/MwPvSrWo9wTnCfP0uXUAuDj+534Z+NO3pLRlvNCZrlakTuLp/kLtGuUk5MgaCyjtgMsJhXz18rYHR/kpvkSiga0k6IwPJlMWxrft5dYkbI2S1jtyd3ZIest9sibJA29HE0XfAhQoF2hVaMVRzAh/UBhULnMrJ7WfT/atbvGFEXOVpqLc1vLJH8Hal427gx4Xu25KOpmXoShU1LkOwA/I3a7BLzhcrFF92PzhlXjBuS60UQ22C2IZN0tVe+hCx3E5djSOX6TTkRyKGGtYpipKfEww3y+79n/emEMalP0d8U1ao2lTKo+yE5obR8P/OXKLE005jdBYFYVIZlUhLr33eh1+a/Lq0YCvf7EfCKpj19wxaqPIUlBOwsdnghpVpIgXfICYfbTatv8gq0d5gS9qnr5so0JdXs7E762jvBoYKn2FTQYp5uJ6edf+8ooryfIbEKJt2oTMvDQhlgVdhpX2m95ZZskZCiLFqNRhdjBJqSnxq7FDfGirS7NtkdIiHVOlyK4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(7416014)(376014)(1800799024)(366016)(10067099003)(18002099003)(22082099003)(56012099006)(4143699003)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD958DBE01AEF841A8FD7B6517702797@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 smXDMosj6rzqtbqcEGMUjLPTa7pmttsY+x6Kz50OQWtf2oJyMlU81g5QzNtXlr3zJzQCGEmRcZqkvuzPGwatJBW3PNzeK3XIJGeida+IAdWZgI6/3GWnJsYa6aWkHhfYvPiTyYJwJOoI1KjGh0POiMSOeDtNbM4X2Kg6SVHccSZyCkCpNPGgyUZ9VJjk7uc74+AyLVHbivICo5pX9P2gnoigOAq4yesQITdM8TsMd8o4nNk3/zratGWxbiWueoqYKqrYnqsys/hcueolj//SradyVWyCJsLVNBa+hB126QyuimS4ioG1SEtWyg5ZCGyVN38pKJNcyVMCoeSYteoN0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11526
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: b0b7f07244a24b948129cd060fbd4097:solidrun,office365_emails,sent,inline:1afdc295ac5b4f0bb002eabfdb1010ba
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PbSe0o0u1ZPuEBlslqEe7mslwvGSGE4W9UFk4hh0kUD0UWXarCL0V3Yui9bHxEOdgox3J5beLiuD0/4vQwBR6+Zl+AZF0A74mFkkpvaGA67b0qZvc6CDhf0mkJwE5hG93cMVc0lMz/jaUeIv4dEUT+ReL3CeLAG6HOajrN8rk/uFRhlmMS8Hekn4nGYnt0Kx/0g6xW57AeLsP/GcWCFJa+0JSm69i856S3lf+g/zS9Yw6bfngTFvqH6iPAvsL6wAPWPdnTvuq7I8eCIgYL9QB6yv6aQ/deiHRrbu/kMQ+Mfo4+qxMtoMU8/WSJip8C9i/VSiNQWuwSz0SoMro0i4GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4RARKXE0uQbzJReiHHL9/GAiJJ7SxBYaSBDd1jGyng=;
 b=b9fm2GUCfdcJAOvKr5QRUGiE21JFDS5weDCrRVmDSr9PT38DCnLX+gV4GpL45Dmqwqrj7WQjsOpaa+kLGJxcnOaP5cXvS9FYBv+t0Ih7Y8HKMVa09Y5EjmfVNuyms4DCvCxXCBQxkMeE5d4phh99iIBBAppR1SClDdILEkYAuQky1gYpT8xpHLfPm++ELi4QZ7Vf1hfW+oNqsvWzob7wHrTVPxTsA+mZ86cd9SBdd0hWdRakB2cQrjv2fgkpYWwiFa5HPRrhHPJqbFj8GYCUGynIcFE+xMQPuTWaU9fxg9QHzAxiTrIL39HadfekJmGNicLHvxCQKjBiHvVWsrb5PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 ZR1PEPF0000E6AD.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	490de91a-0c68-42bc-9578-08df1d6392aa
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|35042699022|82310400026|14060799003|23010399003|36860700016|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mKoax40iFctjeS0AsOEkNcRonisY+AsUec1umY+pAZr3Z3C6YCEBKZ5ZYm7bHa1s6yG/utMA9Qz+/NfkVYKaH3HZ10sXhIphVGoih/sq6TEtr4vVovS+WnOogyGsEw8WgOd3DvgYU6aieGomyb/1YTYZtudzVlEcj46L9fo7lgKY5SJTKyukd+b2M8idtg3U13/4eMrkNr968FI2II5xrcC0gZ91bsmDilosSvDC2Cq9Hsdl/MFx5FvXaj84LzkkDI6y/VIXH/ZXdZ6YlxgWQDE/tuPr7x2OMcMwjAUCzDYtioE/N3cK2Lqs6BF1V8w5jEQ4qTz4FP0FSav00psgRF0p5IoPEafDZleBWFHxfe6sXc7VcM+5V0lfIumSpxhzxAXvp5tEx1nrXfKhurqr6DLI4gh5H1YE4BhW3K80wvXPfTFA8TV9AKBjpHEMGY5qsANZNtvlSl5oZKBNZ6cPa9RabAUa3a4wEGK+mMsFev0SeOqz/3SGCYGdhvfgE+Dcl4cLtDQIoTeAheiPabHgNCgCdg4lGFI5AElAAN6IPUyMAXdwtnTbmJsnKe3Mxjgn5vz7++JR7WNNSrcRqYJ7jU5J4WNiRLGRSZQxydvCGDOg84NYR8uiZsDMQyMhVae6aObLbTd23SW4RCCXIr2+5rr7+v1UdEVarvqdI8t7JX4=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(35042699022)(82310400026)(14060799003)(23010399003)(36860700016)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ag8ze5rKbaO+yYZMK0k+IjGYCnkNe1Vr3mIwUsQ7fheTnCSFVQh5S9lKtGCFzTaKbo3legpecLL5dEgMAWwFqgUctT2VqqShae0oJ3y7OyHpwtZo+jjRcdVrueqyhl+ZaWgnIh4nwYunCkMD6Q6JxNezintqef3p1AlpuHphnK25wWUcHE3uiXbo+QW1SWX0UFcMpyfs+5PW9cdphtu4CIIrkvryvV+H0thfDXmavSNJoJJN0Aa+9fR7Nq4tMY2VJMTpLzSxjyBH8rwG7ni8MAtDkL19acqEaLQ1F7+hCflwshnDf2KB42PfJNsHNl1PWOTsCXrMMXkqptghsJN0pZ1+IvID5pWfr1H1nWKsRhpD/3FovOxehE2hI+dbxSMdjYjzoLLkx7YsO9F29d2BpvPsZgaQr64VNj8RZq4R91ehP+HaHK1kLPrAL/ggTYfL
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 13:22:55.9980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef37a76-b696-448a-5e85-08df1d639bb6
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB338771

QW0gMjUuMDkuMjYgdW0gMjM6MTUgc2NocmllYiBSb2IgSGVycmluZzoNCj4gT24gV2VkLCBTZXAg
MjMsIDIwMjYgYXQgNDoxM+KAr1BNIDxGcmFuay5MaUBvc3MubnhwLmNvbT4gd3JvdGU6DQo+PiBG
cm9tOiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4NCj4+DQo+PiBEcm9wIHVuZG9jdW1lbnQg
cHJvcGVydHkgYWRpLGxlZC1wb2xhcml0eSBhbmQgYWRpLGxpbmstc3QtcG9sYXJpdHkuDQo+PiBl
dGhlcm5ldC1waHlAMCBzdGF0dXMgaXMgZGlzYWJsZWQgYW5kIG5vIGluIHRyZWUgb3ZlcmxheSBm
aWxlIHRvIGVuYWJsZSBpdC4NCkRyb3AgdGhlbSBvbmx5IGJlY2F1c2UgdW5kb2N1bWVudGVkIHBs
ZWFzZSwNCnRoZSBwaHkgbm9kZSBpcyBlbmFibGVkIGJ5IGJvb3Rsb2FkZXIgZGVwZW5kaW5nIG9u
IGJvYXJkIHZlcnNpb24uDQoNCkZvciByZWZlcmVuY2U6DQpodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvYjZmNWZmMGYtNjVlMS00YjQ2LThmMTgtZWRmMjRhYjNjZWE1QHNvbGlkLXJ1bi5jb20v
DQoNCkluY2x1ZGluZyBpdCBpbiB0aGUgdXBzdHJlYW0gZHRzIHdhcyBhIG1pc3Rha2UsIGRyb3Bw
aW5nIHRoZSBwcm9wcyBpcyANCmNvcnJlY3QuDQoNClJldmlld2VkLWJ5OiBKb3N1YSBNYXllciA8
am9zdWFAc29saWQtcnVuLmNvbT4NCg0KPj4NCj4+IEZpeGVkIGJlbG93IERUQl9DSEVDSyB3YXJu
aW5nczoNCj4+ICAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtbi1zb2xpZHNl
bnNlLW44LWNvbXBhY3QuZHRiOiBldGhlcm5ldC1waHlAMDogYWRpLGxlZC1wb2xhcml0eTogYidc
eDAwXHgwMFx4MDBceDAxJyBpcyBub3Qgb2YgdHlwZSAnb2JqZWN0JywgJ2ludGVnZXInLCAnYXJy
YXknLCAnYm9vbGVhbicsICdudWxsJw0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxG
cmFuay5MaUBueHAuY29tPg0KPj4gLS0tDQo+PiBjYzogSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlk
LXJ1bi5jb20+DQo+PiAtLS0NCj4+ICAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14
OG1uLXNvbGlkc2Vuc2UtbjgtY29tcGFjdC5kdHMgfCAyIC0tDQo+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCAyIGRlbGV0aW9ucygtKQ0KPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgKEFybSkgPHJvYmhA
a2VybmVsLm9yZz4NCg0KDQo=
