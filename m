Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021128.outbound.protection.outlook.com [40.107.130.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA81849C4CF;
	Tue,  1 Sep 2026 18:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.128
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788287378; cv=fail; b=td3xDBwyqPBHzPqY5yG0Mf0PvkS6qFRblK8a/YUT5BgSDdKGba6NVelDl0cmuuw/afTQhO5KSy1n0mfk5n3BQHif0GkU3LrMT3Z23kFI/qSH7acNqS+9f496h4oNv84gjxkTtkVQIzFotNujHaYY6XSxA4QwTMD+OeztWUr9phQ=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788287378; c=relaxed/simple;
	bh=KqQvlLNnZ0ttRpjLC2MieuRKCw5OA1tDne90hEygK24=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gjqi01eHuJoKi/U5ONjzUM1R+tQLm/Yo2vQacJ/TflKRFgBU6yk8wW57pRaoUS6HztLGpud6hEkSKyIkWOka3V+8MzL3F1qhzhBuB2Yq8E9vTzp176clySR2XoGeVZRv3AM795hRo955Z6fVFA77g7lH5moKBZuRpzEpDaaCLNM=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=DTYQNMcq; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=DTYQNMcq; arc=fail smtp.client-ip=40.107.130.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="DTYQNMcq";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="DTYQNMcq"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ESYO3XqZ2rpgFeSN7UdufZKSmTB2dc8LCvcg+P5R65EamLOWYTacKyYWNB5mUI7nTqiaZVuzttpIvpAgelt76sNO5ijAxTIx6LxCvcKMCG4Ph8z9CCMmKamx99P2Y9rvZU/Bl9aLh2HqAgmlnxIB0O3ndCp9Wkfs4We42H3FhnntrE6hVydu5pdn003F13/rfAiyG39E9Z7d2mj78M2ppjTXk2DkW4CZ/lI90vdPqAw2qFX1OiAXTHsAKzbAK9wp4hFOqIExcqw0BBpaIYwKJQOrb+IL0wAg9FoLFf9J6RhiAXMd0aRT5WYQ9/Xpv12nMT5afkPc6+RY9mtwVniDng==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqQvlLNnZ0ttRpjLC2MieuRKCw5OA1tDne90hEygK24=;
 b=YfpPS8S1cwGDqmmqWJDoaYF6Z8UQ7RKR0o6b30XsLeH9fvG7Ixz7Rsu/ruHHTrHHAVBAUqo7RXMMVFLC/CTcTs4cHD17YFT0ISsSikaYvfiMqqCpHsEdcOgR+sTsGavpGkAtxlfdUwAf8+pNHMQhd4Hp9O2Pc94Cw93Oi3XxkbUUgaZjij5GeeYEmIshGmQ2XOXHaR1+Ivql2X9IgXcyFlNkwcTmloFX+L3D5qGKA7iVWg4zZV773KLWOGd5oMz5pV4mgYapb/Lod1oIdX0Q1iB3CU6ZiyrwOPGw2Nj9e+YKe43mraCdvdjCHhy6NRa+NnaUHatWY9RWT42mzXeElA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=glider.be smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqQvlLNnZ0ttRpjLC2MieuRKCw5OA1tDne90hEygK24=;
 b=DTYQNMcqakiLYKifaf+vLUWXQwHEJRWTXRGrnkZSVCO1p1YxTzIla1ivBfKCkI/J6XmkQg0etnNYY1D14BfitwGQt3L0zAiDsPwGHK2yph/VCwnO8NKRhD5TPXf5rkVKd9URm3TR8KKibadLyyxzNJPbdSFegQuxCrkUKN+wz66kUf4AGCRtvAyRR7JYzdQdxmwVFIB9QF8gM4TGk8B7Ksojc3FE6OG17sB43aueVx9YiapKoHgFdCKL0UleB1BdNHslejODm0tCBE8+UZyE4OwmroKnApsi0VICFJCVbUrts8SR81jVqg4HW0pV4kLnV1tBxycyHttg38r2evS8Hg==
Received: from DUZPR01CA0188.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::27) by DB9PR04MB9913.eurprd04.prod.outlook.com
 (2603:10a6:10:4c4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 1 Sep 2026
 18:29:20 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::82) by DUZPR01CA0188.outlook.office365.com
 (2603:10a6:10:4b6::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue, 1
 Sep 2026 18:29:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Tue, 1 Sep 2026 18:29:20 +0000
Received: from emails-7683964-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-203.eu-west-1.compute.internal [10.20.5.203])
	by mta-outgoing-dlp-942-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 7120780F51;
	Tue,  1 Sep 2026 18:29:20 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1788287360;
 b=gzvjR7S5hDALTHmIEajUaTh35kSKLD8N/MEyn1b2DXNv1sftUW5eZ3xq0CnK9klxNfq3g
 rQ/i5L4NbiuZQGF3WwicyM+gldYnfhAXKooVxNlMIRZg00FtIkZAYa2BA67N2sR1Ma6cHCf
 7RmCfRNXCbOrZsXBo5hiz1JZVz4WUUQ=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1788287360; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=KqQvlLNnZ0ttRpjLC2MieuRKCw5OA1tDne90hEygK24=;
 b=Kr89SNY9zy93IPOKVscwFQJ4y1GUO12hAdZAKzCmoa8AAPb4tMekbRQxZ3doweiciClyq
 sqXegRMdIaRoesVLmQ5QHizVaKB2Cx1TGMJNRYIsQSGv/+TaxxycjM+VGVXa9EiHiVBH+/v
 550thTqYctWKAvDYTwd8Cv1dDu+DR0E=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqQvlLNnZ0ttRpjLC2MieuRKCw5OA1tDne90hEygK24=;
 b=DTYQNMcqakiLYKifaf+vLUWXQwHEJRWTXRGrnkZSVCO1p1YxTzIla1ivBfKCkI/J6XmkQg0etnNYY1D14BfitwGQt3L0zAiDsPwGHK2yph/VCwnO8NKRhD5TPXf5rkVKd9URm3TR8KKibadLyyxzNJPbdSFegQuxCrkUKN+wz66kUf4AGCRtvAyRR7JYzdQdxmwVFIB9QF8gM4TGk8B7Ksojc3FE6OG17sB43aueVx9YiapKoHgFdCKL0UleB1BdNHslejODm0tCBE8+UZyE4OwmroKnApsi0VICFJCVbUrts8SR81jVqg4HW0pV4kLnV1tBxycyHttg38r2evS8Hg==
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by GVXPR04MB12314.eurprd04.prod.outlook.com (2603:10a6:150:30f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 18:29:06 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 18:29:06 +0000
From: Josua Mayer <josua@solid-run.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>
CC: Jon Nettleton <jon@solid-run.com>, Mikhail Anikin
	<mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/5] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
Thread-Topic: [PATCH v6 0/5] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
Thread-Index: AQHdKJeIQJMXSFRL80G4W28a5cQJMba6LlsA
Date: Tue, 1 Sep 2026 18:29:06 +0000
Message-ID: <3bf36594-ee72-447d-9b09-e8ef663798a8@solid-run.com>
References: <20260810-rzg2-sr-boards-v6-0-41faa32cdafb@solid-run.com>
In-Reply-To: <20260810-rzg2-sr-boards-v6-0-41faa32cdafb@solid-run.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	MMZPR04MB400504:EE_|GVXPR04MB12314:EE_|DB1PEPF000509FA:EE_|DB9PR04MB9913:EE_
X-MS-Office365-Filtering-Correlation-Id: 99c6cd0a-21bf-46f3-cf71-08df0856f08c
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|56012099006|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 fbsLURqo/1cfwxEFroq1l3whjtYQLEfKISOKMA4FqaKBsvT28QssZbGT696odSipGs8bmMlLmT5typ1+pAdRKkN6BN97cDIL72bqdwAoBeWMMZHo3TTE3s981fIQJqZPzy7NrO3f7KEWvDosV2+TczNRxj5LzEaEA2Sor2uxX/Bb8X0p61d0WhMS256qwmC8CdaHzIaRXLZ2VoZMjCsYhMuJmMFF2mCWsEFp6/DEe+7wrOvOp4Z9zGgylG8Q5QcEYm42QPfgjcVY7Uv6ZdQsfV63ElhfoFzEDa66N3zGdYuF5Rz6lCw6/UavIptzcppFhrm4J3SNZrk7qs4nYFzNB+chcCWqeqs/CmVTNbOF8d5xJgB6Gj/K4bGMv6iybxey+FpKWpWSTIJVS3zfaE8kRpcrvE9b/USw4keoUwXU+8IphU0XyL9XGy2jGiARYYD96LeHWpM2jgL+vTyapoxO6SrOm+9Vua6IQDz3Zk44rRFT8JWjCv0oIg4d7/9Sy0atcoffiVqHgaqwoBLC6c/8naQlsK6vWNz9igSp2ov70RWzHw8x9k9vfV6d69ontbnT6uz+cJxdkNsC1bwJ621g+Fxk2nS38oVS08b96IGOjynW3NNx6oCnwb3tZx3RvknfVIEwDQPw2YbMIYZ4doHJAT3NkJmcCLuTsr7Fgo8A+P4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <72B574CB3B5F464EB81FC1417262A1A0@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 aEZ/8HNksOuWHIF7RUVhaFVKoTGxaTUZ98hL77LYiaBms2rUlGXDe0UVW2jZMBMqR6TrogFXejw+zponO2KGG1f4FtY4NxHxHAt3CUhMYNHPEzd0TxisBGwvEmYeZ2n/bmCumxhio6ruuXLVjipH5jfCI2eG+tCBINyGtUXudjL1ANi6b7mamRw9QaCRthR/H26Ro/L46gNlnk/0sUeEaNqA+Fx4Ki4o/kKKoSnprW0/vjKTEZfsQmKIpyMzdBej1E/JojoCaD7RFxxJSX1D0HslUJvsKw8YLMq/YiBmcgvXmvgF1w/9vr2F2sPudk5mJ7wyVAPIlEvVOTuZtI3JTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12314
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 9a8f3bc1b0d343289d3b3b01aedd24e6:solidrun,office365_emails,sent,inline:80b78ba5794ed4ca4ce1d0d4db18ec9a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUkLqVaa9d8IYnSk6Cud4XarjnWsX4X9FjmMKk5ktHLPn9w8yDMMOvYFcDgXnwBQxfi6ee4vINuNzY9c1hE4viXRhO/nLxdevZ+xK0ZjPGR8GDJ5veuoIp2i1+q/U49n1WnNmnBkfxSRcnntqvySG1h6qgspT7FFfafRx3F0E4KE5IonrrFvdcLGkHDgFjMktFrPovF8ffN0jzswyB0hFF/lQFDy3Sj1rUH+fZf8/CN01rDIMlAM3rIg2GfhJCMXXt/y83N9lPCwoyhiUiyvLGWV81YE4Me0oo/yRzTDKEU3tKoQz90HZhMPGsdRmHXuMPx3toOAhP1kmVHhRoYn5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqQvlLNnZ0ttRpjLC2MieuRKCw5OA1tDne90hEygK24=;
 b=jqUU8jKPbYcYInH1EsxBX7UH73itnLh251aTBsTfgaxmXmzia7fcwXZNaTZ4mpOYvm79+s4WmCNidfPlsKFXqLqBT2D3VhEVG3V/OIK6twfthArOEqDwDIYpUL5XdVWh62HLp/xGx/OsiHdxqPtvgJ4tWj8DI5j/bWmaEVMYeF2BzAeAnIxX1ibcNi/5TvX6GLrggXPl+Pc0a4uV5SMPnvkQkukKDH4rqjuLgyvHuYNE3y7f3msxhD6IWQpA7OqU+3jak6ZQ1ktfxVUJ30UUGgCHDG+dn5/5MkNRbpHX1sjirek/qb2KPqr+Sd1vvV+BY3l7XTqit7CAKYWnmt6RPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eceb6915-224a-4fef-acb9-08df0856e813
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|23010399003|7416014|376014|35042699022|36860700016|1800799024|13003099007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4oc+E0l81u86qsG2jYghlH2ozJYuIRA9ntAiP7U8x9CY/krZsZt7Jm1JQ9YMzx2MBxanva+CCzZ4HtGsqiJFyDLfaOGVDVR2Y3vTe+jkWao9a90x/nICF1b12UM3bboR07Bsqo+jRBiEAyu+2yS90d89XADqoWQPAdvJNzMEPUrkmlta/BW9XYtC9VX3TSWXa1LkI9m/SaAIssk395vxzi2lvsvSe5c0bUbjSln5JA0BLn9FzYfPjcuyq0vF2x6XPOvDkDANq1aK5vD5nuxRFypHeVG9L/42IAfonFvRLbEv7b62wXHiI71cLWofbPfJC1/vTZj1t7Ni3LqUoUHrpldINeJQesZTEGF0Um0N+FizglhIkv3c2jyEM8Yt6hnKi+nEjcCOfjIl7fYn6hxr9Qt/li2n7BZqm3V/9Ly/Jp4ALw6QXWVJfgo26a62RexN9cobjfQFaYvwXGxEoA8aFhnMpdQuWKNV3c2jrX2yEAly8CkDP7BS/NxK2rV6HFXRKlvKHYfAgQtpOM4FrdLdzZDWmc3yt9qYMuleLGlPT0+cxS3Yj40UlnGl8X8zMAWy3KlfX7BZ8NQb8ZaNx62cRTqnp3UQfEG2Zo00EWe0UxiMZMz/Zxi/m3DLe7xMRQatHUdzv1Co+rMsYWZWGisrMg==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(23010399003)(7416014)(376014)(35042699022)(36860700016)(1800799024)(13003099007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NSfn0R8twp04dxms/t86hMJ2+mk4y70nuS7ajWeCyygeAcDXIO+RHl8tYfv3tyO+UVgZKTjNDu8/fTHB7YXSL5zT+RaUR0WWg2nsB/Ekb0OwrQqXK8L0nVgfkoRdIHKfsmrhbazNZiZ9hLJq6WnUVQUAok2Sm8iukPv1X8RuFTadxgstWgD3rSptWHoehlwqdJgwfDif2dKTOswbxSc/92TrehicSRC0V8m98qvVqCvxku5cqL27vM2TPwaLN7exF983T+inBV2PzFO+hydoR9ROk3IhG/HeZ/7lIbCr+GxCHcuIULbyUg7GaY5NBpXKniPnmwrWtxgh3aOhe19gNZohHRue/I+3c+KEVzwCmc7S5ltfloMhc3cH887lpRYmDs0i/WjaFZbgwaICMqy9dNkN4WIJ4yHoBSg2AsIRVpe8+VUtHKDMY4wr/j6zpQqD
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 18:29:20.5422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99c6cd0a-21bf-46f3-cf71-08df0856f08c
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9913

T24gOC8xMC8yNiAxMDoxMSwgSm9zdWEgTWF5ZXIgd3JvdGU6DQo+IEFkZCBzdXBwb3J0IGZvciBh
IHZhcmlldHkgb2YgU29saWRSdW4gUlovRzIgYmFzZWQgU29NcyBhbmQgdGhlDQo+IEh1bW1pbmdC
b2FyZCBJSW9UIEV2YWx1YXRpb24gYm9hcmQuDQo+DQo+IEJpbmRpbmdzIGFyZSBhZGRlZCBmb3Ig
YWxsIFNvbGlkUnVuIFJaL0cyIFNvTXM6DQo+DQo+IC0gUlovRzJMIFNZU1RFTSBPTiBNT0RVTEUN
Cj4gICAgaHR0cHM6Ly93d3cuc29saWQtcnVuLmNvbS9lbWJlZGRlZC1pbmR1c3RyaWFsLWlvdC9y
ZW5lc2FzLXJ6LWZhbWlseS9yei1nMmwtc29tLw0KPiAtIFJaL1YyTCBTWVNURU0gT04gTU9EVUxF
DQo+ICAgIGh0dHBzOi8vd3d3LnNvbGlkLXJ1bi5jb20vZW1iZWRkZWQtaW5kdXN0cmlhbC1pb3Qv
cmVuZXNhcy1yei1mYW1pbHkvcnotdjJsLXNvbS8NCj4gLSBSWi9HMkxDIFNZU1RFTSBPTiBNT0RV
TEUNCj4gICAgaHR0cHM6Ly93d3cuc29saWQtcnVuLmNvbS9lbWJlZGRlZC1pbmR1c3RyaWFsLWlv
dC9yZW5lc2FzLXJ6LWZhbWlseS9yei1nMmxjLXNvbS8NCj4gLSBSWi9HMlVMIFNZU1RFTSBPTiBN
T0RVTEUNCj4gICAgaHR0cHM6Ly93d3cuc29saWQtcnVuLmNvbS9lbWJlZGRlZC1pbmR1c3RyaWFs
LWlvdC9yZW5lc2FzLXJ6LWZhbWlseS9yei1nMnVsLXNvbS8NCj4NCj4gQW5kIGVhY2ggc3VwcG9y
dGVkIGNhcnJpZXIgYm9hcmQ6DQo+DQo+IC0gSFVNTUlOR0JPQVJEIFJaL0cyTCBJSU9UDQo+ICAg
IGh0dHBzOi8vd3d3LnNvbGlkLXJ1bi5jb20vZW1iZWRkZWQtaW5kdXN0cmlhbC1pb3QvcmVuZXNh
cy1yei1mYW1pbHkvaHVtbWluZ2JvYXJkLXJ6LXNlcmllcy1zYmNzL2h1bW1pbmdib2FyZC1yei1n
MmwtaW90LXNiYy8NCj4gLSBIVU1NSU5HQk9BUkQgUlovRzJMIFBSTw0KPiAgICBodHRwczovL3d3
dy5zb2xpZC1ydW4uY29tL2VtYmVkZGVkLWluZHVzdHJpYWwtaW90L3JlbmVzYXMtcnotZmFtaWx5
L2h1bW1pbmdib2FyZC1yei1zZXJpZXMtc2Jjcy9odW1taW5nYm9hcmQtcnotZzJsLXNiYy8NCj4g
LSBIVU1NSU5HQk9BUkQgUlovRzJMQyBCQVNFIChSaXBwbGUpDQo+ICAgIGh0dHBzOi8vd3d3LnNv
bGlkLXJ1bi5jb20vZW1iZWRkZWQtaW5kdXN0cmlhbC1pb3QvcmVuZXNhcy1yei1mYW1pbHkvaHVt
bWluZ2JvYXJkLXJ6LXNlcmllcy1zYmNzL2h1bW1pbmdib2FyZC1yei1nMmxjLWJhc2UvDQo+DQo+
IERldmljZS10cmVlIGFyZSBvbmx5IGFkZGVkIGZvciB0aGUgZmlyc3QgYm9hcmQgdG8gcmVkdWNl
IGluaXRpYWwgZWZmb3J0Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKb3N1YSBNYXllciA8am9zdWFA
c29saWQtcnVuLmNvbT4NCj4gLS0tDQo+IENoYW5nZXMgaW4gdjY6DQo+IC0gRHJvcCBjdXJyZW50
bHkgdW51c2VkIHVzYi12YnVzIHBpbmN0cmwgbm9kZXMgZnJvbSBzb20gZHRzaSwgcmVwb3J0ZWQN
Cj4gICAgYnkgc2FzaGlrby4NCj4gLSBGaXggZHVwbGljYXRlIHBpbiBjb25maWcgbWlzdGFrZXMg
aW4gc3BsaXQgZGF0MC0zL2RhdDQtNywgcmVwb3J0ZWQgYnkNCj4gICAgc2FzaGlrby4NCj4gLSBM
aW5rIHRvIHY1OiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjA4MDktcnpnMi1zci1ib2Fy
ZHMtdjUtMC0xOWM2NjIzNThlMzZAc29saWQtcnVuLmNvbQ0KPg0KPiBDaGFuZ2VzIGluIHY1Og0K
PiAtIENsYXJpZmllZCBzZGhpIG11eCBkdCBjb21tZW50IG9uIG11eCBhbmQgZ3BpbyBzdGF0ZXMu
DQo+IC0gQWRkZWQgbWljcm9zZCAmIGVtbWMgZHRib3MgdG8gTWFrZWZpbGUgdGFyZ2V0cyBleHBs
aWNpdGx5IGZvciBWMkwgU29DDQo+ICAgIHRvby4gUmVwb3J0ZWQgYnkgU2FzaGlrby4NCj4gLSBz
cGxpdCA4LWJpdCBhbmQgNC1iaXQgc2RoaSBwaW5jdHJsIHRvIGF2b2lkIHRoZW9yZXRpY2FsIG92
ZXJ2b2x0YWdlIG9uDQo+ICAgIGhhcmR3aXJlZCBlTU1DIERBVDQtNyBwaW5zLiBSZXBvcnRlZCBi
eSBzYXNoaWtvLg0KPiAtIE1vdmVkIGRyX21vZGUgZnJvbSB1c2IgcGh5IHRvIGNvbnRyb2xsZXIu
IFJlcG9ydGVkIGJ5IHNhc2hpa28uDQo+IC0gQ29sbGVjdGVkIGFja3MuDQo+IC0gTGluayB0byB2
NDogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwNzMwLXJ6ZzItc3ItYm9hcmRzLXY0LTAt
MDhiYzQ1OTU3OGRjQHNvbGlkLXJ1bi5jb20NCj4NCj4gQ2hhbmdlcyBpbiB2NDoNCj4gLSBSZWJh
c2VkIG9uIHY3LjItcmMxLg0KPiAtIEFkZHJlc2VkIHNhc2hpa28gY29tbWVudHMgZm9yIGcybCBz
b20gJiBoYi1paW90Og0KPiAgICBncGlvIGR0IHByb3BlcnR5IC0+IHBsdXJhbCwgaXJxIGxldmVs
cywgbWVtb3J5IHNpemUsIHVzYi0zLjAgaHViLg0KPiAgICBUaGUgdXNiIGh1YiBpZHMgaG93ZXZl
ciBhcmUgY29ycmVjdCwgNjUwMiBhbmQgNjUwNiBhcmUgdXNiLTIuMC4NCj4gLSBBZGRyZXNzZWQg
c2FzaGlrbyBjb21tZW50cyBmb3IgZzJsYyBzb20gJiBoYi1paW90Og0KPiAgICBncGlvIGR0IHBy
b3BlcnR5IC0+IHBsdXJhbCwgdm1tYyBncGlvIHBvbGFyaXR5Lg0KPiAtIExpbmsgdG8gdjM6IGh0
dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MDUxMi1yemcyLXNyLWJvYXJkcy12My0wLWYwMzNm
Yzk2YzkwNkBzb2xpZC1ydW4uY29tDQo+DQo+IENoYW5nZXMgaW4gdjM6DQo+IC0gQWRkZWQgZXhw
bGFuYXRvcnkgY29tbWVudHMgb24gd29uJ3QtZml4IHNhc2hpa28gZmluZGluZ3MuDQo+IC0gQWRk
ZWQgY2FwLXNkaW8taXJxIHRvIHNkaGkgY29udHJvbGxlcnMgdXNlZCBmb3IgV2lGaS4NCj4gLSBE
cm9wIHJlZHVuZGFudCBhZGRpdGlvbiBvZiBjb21tb24gZGV2aWNlLXRyZWUgb3ZlcmxheXMgdG8g
aW5zdGFsbA0KPiAgICB0YXJnZXRzIG9mIEcyTChDKSBTb0MuDQo+IC0gQWRkIGNvbW1vbiBkZXZp
Y2UtdHJlZSBvdmVybGF5cyB0byBpbnN0YWxsIHRhcmdldHMgb2YgYm90aCBHMkwgYW5kIFYyTA0K
PiAgICBTb0NzLg0KPiAtIEFzc2lnbiBrYnVpbGQgY29tcG9zaWUgdmFyaWFibGVzIHdpdGggOj0g
b3BlcmF0b3IuDQo+IC0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2
MDUxMS1yemcyLXNyLWJvYXJkcy12Mi0wLTgyYWViYmQyNzg5MUBzb2xpZC1ydW4uY29tDQo+DQo+
IENoYW5nZXMgaW4gdjI6DQo+IC0gQWRkZWQgcmVsZXZhbnQgcHJvZHVjdCBwYWdlIGxpbmtzIHRv
IGVhY2ggY29tbWl0IGRlc2NyaXB0aW9uLg0KPiAtIEFkZGVkIHByb2R1Y3QgcGFnZSBsaW5rcyB0
byBjb3ZlciBsZXR0ZXIsIHRoYW5rcyBHZWVydC4NCj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjYwNTAzLXJ6ZzItc3ItYm9hcmRzLXYxLTAtODU0NTY3N2Y5M2Nh
QHNvbGlkLXJ1bi5jb20NCj4NCj4gQ2M6IEpvbiBOZXR0bGV0b24gPGpvbkBzb2xpZC1ydW4uY29t
Pg0KPiBDYzogTWlraGFpbCBBbmlraW4gPG1pa2hhaWwuYW5pa2luQHNvbGlkLXJ1bi5jb20+DQo+
IENjOiBZYXphbiBTaGhhZHkgPHlhemFuLnNoaGFkeUBzb2xpZC1ydW4uY29tPg0KPiBUbzogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gVG86IE1hZ251cyBE
YW1tIDxtYWdudXMuZGFtbUBnbWFpbC5jb20+DQo+IFRvOiBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPg0KPiBUbzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPg0K
PiBUbzogQ29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPg0KPiBUbzogR3JlZyBLcm9h
aC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gVG86IEJlbmphbWluIEJh
cmEgPGJlbmphbWluLmJhcmFAc2tpZGF0YS5jb20+DQo+IENjOiBsaW51eC1yZW5lc2FzLXNvY0B2
Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IENjOiBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IENjOiBsaW51eC11c2JAdmdlci5rZXJuZWwu
b3JnDQo+DQo+IC0tLQ0KPiBKb3N1YSBNYXllciAoNSk6DQo+ICAgICAgICBkdC1iaW5kaW5nczog
c29jOiByZW5lc2FzOiBBZGQgdmFyaW91cyBTb2xpZFJ1biBSWi9HMiBiYXNlZCBib2FyZHMNCj4g
ICAgICAgIGR0LWJpbmRpbmdzOiB1c2I6IGN5cHJlc3MsaHgzOiBtYWtlIHBlZXItaHViIHByb3Bl
cnR5IG9wdGlvbmFsDQo+ICAgICAgICBhcm02NDogZHRzOiByZW5lc2FzOiBhZGQgc3VwcG9ydCBm
b3Igc29saWRydW4gcnpnMmwgc29tIGFuZCBoYi1paW90IGV2Yg0KPiAgICAgICAgYXJtNjQ6IGR0
czogcmVuZXNhczogYWRkIHN1cHBvcnQgZm9yIHNvbGlkcnVuIHJ6djJsIHNvbSBhbmQgaGItaWlv
dCBldmINCj4gICAgICAgIGFybTY0OiBkdHM6IHJlbmVzYXM6IGFkZCBzdXBwb3J0IGZvciBzb2xp
ZHJ1biByemcybGMgc29tIGFuZCBoYi1paW90IGV2Yg0KPg0KPiAgIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3NvYy9yZW5lc2FzL3JlbmVzYXMueWFtbCAgIHwgIDM3ICsrDQo+ICAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdXNiL2N5cHJlc3MsaHgzLnlhbWwgICAgICAgfCAgIDEgLQ0KPiAgIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgIDM1ICsr
DQo+ICAgLi4uL2R0cy9yZW5lc2FzL3I5YTA3ZzA0NGMyLWh1bW1pbmdib2FyZC1paW90LmR0cyAg
fCAgMjAgKw0KPiAgIC4uLi9kdHMvcmVuZXNhcy9yOWEwN2cwNDRsMi1odW1taW5nYm9hcmQtaWlv
dC5kdHMgIHwgIDE2ICsNCj4gICAuLi4vZHRzL3JlbmVzYXMvcjlhMDdnMDU0bDItaHVtbWluZ2Jv
YXJkLWlpb3QuZHRzICB8ICAxNiArDQo+ICAgLi4uL3JlbmVzYXMvcnpnMmwtaHVtbWluZ2JvYXJk
LWlpb3QtY29tbW9uLmR0c2kgICAgfCA1NjAgKysrKysrKysrKysrKysrKysrKysrDQo+ICAgLi4u
L3JlbmVzYXMvcnpnMmwtaHVtbWluZ2JvYXJkLWlpb3QtbWljcm9zZC5kdHNvICAgfCAgMjYgKw0K
PiAgIC4uLi9yZW5lc2FzL3J6ZzJsLWh1bW1pbmdib2FyZC1paW90LXJzNDg1LWEuZHRzbyAgIHwg
IDE3ICsNCj4gICAuLi4vcmVuZXNhcy9yemcybC1odW1taW5nYm9hcmQtaWlvdC1yczQ4NS1iLmR0
c28gICB8ICAxNyArDQo+ICAgLi4uL2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmwtaHVtbWluZ2JvYXJk
LWlpb3QuZHRzaSAgfCAgNDkgKysNCj4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpn
Mmwtc3Itc29tLWVtbWMuZHRzbyB8ICA0NCArKw0KPiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVu
ZXNhcy9yemcybC1zci1zb20uZHRzaSAgICAgIHwgNDUxICsrKysrKysrKysrKysrKysrDQo+ICAg
YXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJsYy1zci1zb20uZHRzaSAgICAgfCA0MDgg
KysrKysrKysrKysrKysrDQo+ICAgMTQgZmlsZXMgY2hhbmdlZCwgMTY5NiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDogZGM1OWU0ZmVhOWQ4M2YwM2Jh
ZDZiZGRmM2ZhMmU1MjQ5MTc3NzQ4Mg0KPiBjaGFuZ2UtaWQ6IDIwMjYwNTAyLXJ6ZzItc3ItYm9h
cmRzLTM3ZDU1NjY2OGEyZA0KPg0KPiBCZXN0IHJlZ2FyZHMsDQo+IC0tDQo+IEpvc3VhIE1heWVy
IDxqb3N1YUBzb2xpZC1ydW4uY29tPg0KDQpQbGVhc2UgZG9uJyB0IG1lcmdlIGFuZCBob2xkIG9m
ZiB0aWxsIHY3Lg0KVGhlIGxhdGVzdCB2ZXJzaW9ucyBhdHRlbXB0cyBhdCBhdm9pZGluZyAxLjhW
LzMuM1YgY29uZmxpY3RzDQpvbiBTRDAgcGlucyBicmVhayBib290aW5nIGFuZCBhcmUgaW52YWxp
ZC4NCg==
