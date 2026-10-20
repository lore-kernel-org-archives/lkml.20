Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792527199;
	b=trcR12zXHiAVrfxkQcbQyIFi865LWY6VPCoaKWHGcv/PwOxlo+Q6sKScSwGk1YoR7H+i
	 03KJQ0aZoIFUyjbErSV6mPIwYy/x2TgN52RK9sc0+fkhAWDnZyaace3qfVm8XO2hobyiK
	 dnnQYJSpmnJ1Xg0YwixbB86upvvpOObwNmM2aHGORnyPUSH08FXPWzP+XFgYdjjY94iO2
	 O0RcwFIgQ1lKcPveGkPlk56iNvATphMX/EKb0s656gEilaCA+hYPY4yKBnHLGRxcs5/dB
	 ArKsgec6u6BHrCO7rm9E9hzAxhj+WjX5pKiiEXMjVSEHIWLt7UOC//cbmEoy8XYZXlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792527199;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=2kGP3oRWPA7bHX9Gal7Hr4OMwzeTUhfZIzxmNaVqo2s=;
	b=gd8psUAS4YfWLUu+u0Uzf4iKiyd7z5oczBGP6Azfcz4QUMmTw9V1FIhkjXAV8LIoSMSq
	 4C6uLmxFKeC2TcKYVXjKc0akCbkeMRB7b/naHDBerbi9yqX48J5Qr9oG6T6LFij+btUTU
	 7faZioA/ehBIY0xNA+UwgApJoOJ0F0GFH4N07+70/TDvgZVMAXNw5EgOvFBac+jJ9B1Np
	 fYxOCWvUs8l55TUuXI9H+YGApVel+rhIERUFHBHT0tcY6iXrVdVOwzp5NcJeK2rW5f12q
	 mzx3/Y2wA/JbR3dTQSba1CHi+jgtzahtghof1NdWfIpDhVg6perx0GcqJLUP0ACMktg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YCRXfRzA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.44
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010044.outbound.protection.outlook.com [52.101.69.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A3F606A321;
	Tue, 20 Oct 2026 20:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77A3F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YCRXfRzA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JyosxkXIWZPfg9rDawrMs6JFTrgt/4XlzyCGUU4pjhMFQB1n3l2e8Bl7hgjwlpqCg+18LrCmJb0oz6rNkwcSZ/SvsvZYk/HBECy5jRmZBUWP5Ku0LNBtz+G0oUJtVfavNBkmFCrZnH+tZL+KVwXwGT/9bv1V+jeznajnEQMKHImVYf76On9V3zJQfwz5kNx84CYxdngDGr5ApVVMZmNV7G1A7RLOiewzZ/HPqGOQi7KXnnNM+FQIpFIypqeJzTzVXk8ufMLcORtyv+D+r8RGm0UMOq8ytA7Hf9zLQRTO3Xft5VlMNLLyLtxPA/SBnM0OO+9F7FCe4ldFWNpXI3y4bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kGP3oRWPA7bHX9Gal7Hr4OMwzeTUhfZIzxmNaVqo2s=;
 b=rH3ZIsLrSOMwgdSYQxEVcvoalVWVG/dsSwcIkwM9M77nEdoKo+BABasF+ZDF1NrW8BxKNliVMkAy6xzdPdtoC4/z1aUMl2E9UEtVwpbkC9RYmYvXtuHyaW1i7QHausRQat5dMP9i1FCADF2S7SZ1f3/Bq+qgbG4639cyMz+lxEJcDtqYvrEvvyEgzU11cSedPeXXouhLYldVkXrHZyJzjckmKz3R/pV+/0jM0a/wjtm2icV+pi1w/O+FJYJekfCte6PApDgpOLAGgTKw1EjU7pLF39Jjg9SlS+wh6xWXzuL1uC/TF+DpnGC28lz7ltNJ/ed2brVdHsEXxmdVtJriwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kGP3oRWPA7bHX9Gal7Hr4OMwzeTUhfZIzxmNaVqo2s=;
 b=YCRXfRzAOj2ltjwqMU0v+tUbSy+1P7Ng4jChdB9BsAmgL3ZFDec/XHQDAFQZKrWWJUP6XHPH3wqEgCrppRw++O9T5YSO0dNFGfqct/AeeBbOTo/4re/dVEzzsNtK4hMBCIyxGmyaHt7wN2OavU0Esev8LP9rInBOB7hr2IlSYI2TxlL8oc/ay/L4ADnutpX7e3ZgHTTPC0paRtiiIu95JashlFV8ve8Yll8oMSXzqpw3CDKnPxs1RjNWbPy9D1hymLWwdoRYaMQDX+uMvKnof2ohdU1r1zfaJ8E6EyXyir7GJ/JXXbfjpYEyN4TPE2+SMO6xl9z/FD+XyjT/IIxjxg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by PR3PR04MB7323.eurprd04.prod.outlook.com
 (2603:10a6:102:88::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 20:13:15 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 20:13:15 +0000
From: Frank.Li@oss.nxp.com
Date: Tue, 20 Oct 2026 16:12:51 -0400
Subject: [PATCH v3 1/7] dt-bindings: lcdif: add compatible string for
 i.MX8QXP and i.MX8DXL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-dxl_lcdif-v3-1-adc944659e14@nxp.com>
References: <20261020-dxl_lcdif-v3-0-adc944659e14@nxp.com>
In-Reply-To: <20261020-dxl_lcdif-v3-0-adc944659e14@nxp.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Robert Chiras <robert.chiras@nxp.com>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792527183; l=1808;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=sCahuZvfwqRKEttnXuwHDV27tSv4cFZUITUV9d6SkEo=;
 b=0i1rryXX71DqrhItzCdfQg9dHkG5tTog76mr9F8xtmHHbBkgYBPNd6bWuP3uwbw2NB3UmmqTs
 ez3L1fA06JiBCKbfpRr/RZoNyjE8sYmHv5koDIxrA+cvfPFJZow3q9B
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH0P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::30) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|PR3PR04MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: 9766eb6e-3bf1-4821-ff63-08df2ee692c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|7416014|1800799024|261009223027099003|10067099003|56012099006|18002099003|22082099003|921020|11063799006;
X-Microsoft-Antispam-Message-Info:
	jtM3NVIsGgOt6NEuUCBYICi0erYVrSkckO7F2AJpDmEihI8syVOdzL0aymzuQ9gp1kcOTwxbQ17TTO2qXgscuuRqo9f0zLM1Eg87FzEGRbVUeE+dZkj2KmdNsGyGSmow2nMnZ2QyRGZF/Aij6eRJS06WIj8VqJFs4DP8otb4p4IuEY1SRdL7Jibdumh+Q6sGeDGvEdHXqz8gsw4yRpPXuj1mnB8blMwSUaOmvVDmL872oqPV+iFsfc3faNTkZcvxxij93vGE/Iepyts5hOY0u3jq0qe44hAVNZL/GeR1Zs+TyYqfmFtb4uUxn11KnbUBu9iPYpTMIW2qx1NBX+pSpbrZ7VElSPzQO+q9tZ/vc3SAbatMk/1BbWmfGBFpQdty/Mq17qqAWNdWO8cX4/YHDKmpwqidCCsRUWd59zq3pfNvD5N1LXDT048VULrz81PUJUiOCLZwkXjld7TBYW0A+4HPHQh24oCfeR9CWBcDDKxxOdf2dtHDETo26oQSzbiFDdKUi7INy2oIcaQMu21Wgu0eoJwCmazEOmQeFBufgvcQcvxUyV8AvWChokeOgziuGkookVFEuuezu0tmqIRKdUzzyXxE6qxQQgqAZDn2ERB2jfsy4Qnu076b0K9HgF//QuS/EuWe0s6eLf2jkPAcCLwnx2Xqb9l4CX404kO6VeLfR6QYdnnzAOxY/u74XZPdR0emPhUumBXfbyrYBJiWeg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(7416014)(1800799024)(261009223027099003)(10067099003)(56012099006)(18002099003)(22082099003)(921020)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QllHNkVsbTZDbTd2MlVlZDlYN2hEcmttNGZORHRrNFdtYUN0R0RzM1hUeG44?=
 =?utf-8?B?bU43TWY1VHpQV1ZmaHc0bWpNbGVOUVhvbmE2bnZ4d3JTT3pOYmVxMG1tMnVE?=
 =?utf-8?B?M2FkelY2MmNPMTNuSzZxL3dYaHk0S0JQK24zWVNKaEtNbys1QmVJdXdoSVpY?=
 =?utf-8?B?MFZVMWpaNk16OG1sYkgwN0tIZDNpSTNtR3I3TTY3bFUxdW1ZRURENmVDNG5H?=
 =?utf-8?B?dVZkM0xrREF6ZW4wa1FFNU1IeUloRDBFUHdSSzdvL2U3QnoxRmZoS3QxbUNw?=
 =?utf-8?B?ajM5alQvbVh3VHlOSERsZ3orU1FQSnZXMCt3anpFR240U0FLYzFCNUJ3MVM3?=
 =?utf-8?B?ejhKVEo4V1RqT3lRWVhpWUpmZUNMZzJvcVFvVXJyYnk3cVVWUnNSOUlKNkhq?=
 =?utf-8?B?Uzdhck1RbVp1RzlFTytaL0ZTREd2aFBSRTN4enA3U3AyaWd5Vmd2bU9CcjY1?=
 =?utf-8?B?RFQyVzNiYWlqSW9NdHBPQk9kUzVOb3g1b3N4TmJtVG9rWkEvdHFrZlkzbnJS?=
 =?utf-8?B?RTdRK09OTW4rNWdsemtpVnk3TXA0cHhpRExvRlRLV0pFeXJvSmhGUlVvZmta?=
 =?utf-8?B?TGsrN0lYVUdheUhKOVY2MVRWWkpWaW1wdnRiUnAvQmIvZTdBMmJad25QUUl3?=
 =?utf-8?B?akg5ZFd1bUNIREp5U29pdzJ5b01VTXp3cXhKMWswSFk5WVBHZWthNDVGMjc4?=
 =?utf-8?B?RXhlWmZwNVFqd2lQZHdRRXhKTm9RQjFHdThRaUd0T0ZzR0dOQ2lpZWYwRVVz?=
 =?utf-8?B?Um1ueHdQTlcyMWR5V1huTXV2RGFQcVhibjU5dnFnTUZqQTAvR1ZMbnhJc3NV?=
 =?utf-8?B?UlJFb1hxNWNIRzF0NzNKY0ZNZUpoNEwzdFRCYjRmRVptUjBRdlA2ZHJDWncx?=
 =?utf-8?B?MlgyNm1rTnpYMi9EQ0J0NXN6Q2NjVjRRM08xZG8vWkNuNXlxMUFTd29TN3JE?=
 =?utf-8?B?MkgySkNqQnh4NFlRWTNlL3Z0LzlYVldDLzhYeEthVFk4T2tTVnp1eWxsRk1F?=
 =?utf-8?B?Tm5WbTgxbE1iRWwyTzE0UStxRXVuWlNZR0JSVytscHZsYlY5QjhKOXN4SG1k?=
 =?utf-8?B?KzlQa1VJZ29zbDZJZXZOZkVjM1pGeHpKcEM4Zjk0TWFXM3c3SkNSZ01LYm9j?=
 =?utf-8?B?WllTY0FxcDB4WWhTc0Y0YnZuSVJvZjhObGZucmVVMG10dFdwSTl6Y2FCWlFG?=
 =?utf-8?B?VjdFSGppWUdZYmdoeGRkek5vbnZxaklnQTRHNFB6UkpvUS9uZjJNZG40OWtV?=
 =?utf-8?B?NU45SFMzSDhnUFMwNGhlNmFOTTJ6OWhOYTQyOTBvaGJkRWVBc2haOHlnOFlJ?=
 =?utf-8?B?Y1dPTUQvM2Z0Mi8rNTNwV2wyVmtyL1RRWDdrL2tuVXcvd0NrSWdhczlKR0l3?=
 =?utf-8?B?N3RDdVZzQkxQZElxWDlmZ1UwUlZ1Rm9iaFFHSytZZTZSaEhlakE1a3JMZzgr?=
 =?utf-8?B?WE1RYzFvajJ5SmhxdjlDd3Jla2t5ZWFGMFJvZmU0ZUJiZnIwNWVlY2t4aVV2?=
 =?utf-8?B?S0ZXN1VoaHM4Y1JkMUZFL2ZCbVF6THAyNUUrNXpPUHhBUVV0ZUhkZ3FiZG8v?=
 =?utf-8?B?T3pqWGllWVIyMEJMSFoyWE5mKzByWlg3dG80b2h0ZU80TGJZVUNhM3lJYW5q?=
 =?utf-8?B?Y2VaaWlNRjVQbXJpaHpadE04L3BqUUVDYzdxRWRNTVJtdWJTb2FLYmdLWDJk?=
 =?utf-8?B?b29Zd2cyVlJXeTQwaUF4N2RhWVNJcXVzYXB4czZselhSYVRCYWF0a2JnYmpk?=
 =?utf-8?B?K1BDQ25qOUhYMzdhVnorRkVLZHprN3VCb0U5cVQ5TlZhYlpXcFVMMStkdW43?=
 =?utf-8?B?UzdmL2VtSm5wTUlDK3prV3BRVDdma3dxMDV6RXpxSnlFZkpLd3VxempHcVhr?=
 =?utf-8?B?eDVFRyt2MG0yN3dMY0dMWHFxWXNkc2w0L21sWVZJSXQ2WW9ydHp5WCtyOG1L?=
 =?utf-8?B?Um5qMnRqSTE5YXVDSFN1SmNKcmxCcjArS0VHZHUvRk5yVktETEROOVhnRk9u?=
 =?utf-8?B?anAvNlUzQnhma25sQVBHYStReGpVU0RRdDFRQkRrbFdEUjlaRjM1elRSK2dY?=
 =?utf-8?B?aVN6UElES1JwaTlNb0I1aFFocVlTODRLZ0tzdDhUVzlNNGVoY2xsSkxKWjQ3?=
 =?utf-8?B?ZnpTazhVbnptNWtpZW1wNm5uTjRNNUhRVnRkWlFQVkY0WXpuek9SVFlvbHR1?=
 =?utf-8?B?ZGF5c09ubUROVDUvamsxbnpRbE10bDBkYlJRcmNTWE04bUZjR3I0ajIveG0y?=
 =?utf-8?B?U1VBTjQ3WmdCSFdEVHJQWjd6bnczUk8wSW9ibGRja3crNE1NcmR5aTlOVkhJ?=
 =?utf-8?B?RkFjSzMxTkVTSE5YNW9Vc0JrTVZHTlJWSDQ5TUFtdENHUWgyR0tkQzMvM0tX?=
 =?utf-8?Q?FFxbYjShW18ZKBXfL21o1Pse+yFmzFGKgqy4W?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9766eb6e-3bf1-4821-ff63-08df2ee692c5
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 20:13:15.3586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFsfpkhg6PjbeRblBH2RjzpvU1SLkvh6mr0d/QTHMxR3q17Is6Vd1GPMbjk24XMRs/IiM/He8XCb4ZT9932dD7q+1ykG8MZC9hd6TuXOJFGv1eickO9E1slgsOGGeMta
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7323

From: Frank Li <Frank.Li@nxp.com>

i.MX8QXP and i.MX8DXL have lcdif, which back compatible with i.MX6SX. Add
front compatible string "fsl,imx8dxl-lcdif" and "fsl,imx8qxp-lcdif", which
fallback to "fsl,imx6sx-lcdif".

Required power-domains for both. Required 3 clocks and clock-names.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
- require 3 clocks ans clock-names
change in v2
- require power-domains (sashiko)
---
 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 5f56e733c4f7f..c986ac87fc2bf 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -28,9 +28,11 @@ properties:
               - fsl,imx6sll-lcdif
               - fsl,imx6ul-lcdif
               - fsl,imx7d-lcdif
+              - fsl,imx8dxl-lcdif
               - fsl,imx8mm-lcdif
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
+              - fsl,imx8qxp-lcdif
           - const: fsl,imx6sx-lcdif
 
   reg:
@@ -122,7 +124,9 @@ allOf:
         compatible:
           contains:
             enum:
+              - fsl,imx8dxl-lcdif
               - fsl,imx8mp-lcdif
+              - fsl,imx8qxp-lcdif
               - fsl,imx93-lcdif
     then:
       properties:
@@ -162,9 +166,11 @@ allOf:
           contains:
             enum:
               - fsl,imx6sl-lcdif
+              - fsl,imx8dxl-lcdif
               - fsl,imx8mm-lcdif
               - fsl,imx8mn-lcdif
               - fsl,imx8mp-lcdif
+              - fsl,imx8qxp-lcdif
               - fsl,imx93-lcdif
     then:
       required:

-- 
2.43.0

