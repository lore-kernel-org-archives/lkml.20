Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792489016;
	b=BGAIR9irT5Ke6+VjIphEFJaJjpeVMxk8oDmB8/trQgPitrsEBx351wLvh3QkglvvrV49
	 Ucgj3QC51kj/y0G4DYfYSiSVuV2gOPxznbOrCAMQXHxVsi3WjNtgCorBEt3D7pY4Vh3C5
	 5qEUIfg9MoOm0+IhmmuEJn0B4PAiGrpxzxfv2UpqFBvWYUm9OKV4l0+OEPIvkAftkEg5Q
	 ebit5pHgOEsviOzu9GWt1sVt5IwMNFN1lQcHU7i6FErOOcGRcIZTmuQG08mGKERFDWGDQ
	 lwSWA/K+kA/YrQM64qMMryMuUk5FQWAa6MgZ0/rGSe5+AGeZrHhUexehgEREg/3EMbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489016;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=qw4fnjFbF7UFVKzMPNTy/RSD7bcFFxXQI+Ul9bNBJNM=;
	b=35fgTT4J/pabiMFizM4ZVyzZ0TF0e4iNKOfWta8Fa3749USqHkDyIGrKIJLryDgE5UiG
	 aRw1ZdXCoKuJmPxZYi5dcd8MYRqNcZUhSE+XOsgq91yfyj3/mA2soRtfNv+JDO+OlXRAV
	 aJe63pmSkQHF8QKWr+KRgOKPy8YfPiVtB+Z3FQ5gvc0LRhVmkN85F6iIg0H6h5+7qiSP0
	 N19FSyI99f7pZ+VLkhvGBYv4ZJdYja4Ljv6qZuBureqihNjJTRSov5W/zOAwWtvRthNTv
	 wrpGHatcFsSWGlNjmFj7PDMtSMvpFgHxwqHiqUSgE+bf9Y9enp4KYoYRb07nRpVMogw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=UpVyrHPf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.47
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011047.outbound.protection.outlook.com [52.101.125.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24927606A324;
	Tue, 20 Oct 2026 09:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24927606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=UpVyrHPf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckzbjYwtKCkKEl29n2Hn7KGmIlr7K55hhPoRJviui+i1I7mRgWlsgKkvHtlrOgf3FO/SC82CCBiW8LhqGoZIg5UBiMUvoejTW5dm3IX5itc+w18JtrtUNIevJ8ugEbOeFKraPCHUTRDoHkm1EIMNlIos8UbG+6gwkyvOuquG/nhs1KR7Kl7cmbacExkVyaiKqeuX4Hm3jvP3N+KrOWJpcXjt5G1bvgOCVrgKO7uQuDLc01/26JY08Ea5Sh1qxQCBRVLwiOrXLGDlD9Nl1rc8NKxktewywNyqsNPIKeuJGehtg6aer0zej8YuHASBUtY11KlKFk7IkDGilfRW2VEw1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qw4fnjFbF7UFVKzMPNTy/RSD7bcFFxXQI+Ul9bNBJNM=;
 b=BMZnDkrFVwRvzdnQUt88kwa+ZWvY0cRSxwI6mdtKvnD3Tb5bVt4a2a5xYw1zrulLfDz++hMto1lkwpyB38yxZhrpdHXH9aZVycHVxDukH8lt9PYo0MSjipChmzFDKduNWD0l7+/hv0raSvwOzJG8jxZS7CcXuIdNPaaiiNJRsLYl24F0Ps4EmDPBKCj5EPia3FPZ3h1cShqImciCoWUF2VU7gymmWJIjq8J6+mPhidQKvaK2IlieVb1S+0UfHxeMnYZku/6SK6gDPP4pXeE649MY+2N0mrcyXr/WS6feMVELrxT11bcKGMOwpES4PvB9lg2xDNwaElzb4kZc3izKMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qw4fnjFbF7UFVKzMPNTy/RSD7bcFFxXQI+Ul9bNBJNM=;
 b=UpVyrHPfcWhjjmXc2XIJDs6psSKQzPZznA/USvVrEjhe9Zwnytre30LaUVnigFUNsAAFiDF8MpX2vjUXCuSIrNeSr3bG8RBcu6v5524bW9RV7d7XPYX/6SofgVbbeig/vEbZySzi2LPPYS44uN4xKjfJEFFRgOoGGiV7FrREy2c=
Received: from JH0PR03CA0014.apcprd03.prod.outlook.com (2603:1096:990:6::9) by
 TYCPR01MB9686.jpnprd01.prod.outlook.com (2603:1096:400:208::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:36:40 +0000
Received: from TY1PEPF0000BAD9.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:990:6:cafe::33) by JH0PR03CA0014.outlook.office365.com
 (2603:1096:990:6::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.14 via Frontend Transport; Tue,
 20 Oct 2026 09:36:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BAD9.mail.protection.outlook.com (10.167.240.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Tue, 20 Oct 2026 09:36:37 +0000
Received: from [192.168.1.82] (unknown [10.226.92.108])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 09F46300024F;
	Tue, 20 Oct 2026 18:36:32 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Subject: [PATCH 0/3] i3c: renesas: Add support for the analog noise filter
Date: Tue, 20 Oct 2026 10:36:25 +0100
Message-Id: <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-0-b7ad60cde650@renesas.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQrCMBAAv1L27EKShkD9iniom01dkbRm2yKU/
 t2oPQ4MMxsoF2GFc7NB4VVUxlzBnhqge58HRomVwRkXrHEGo6wjqg7lOZEWQteFgNIS9jlhiq3
 3gTqbPENNTIWTvH/5y/XPutweTPO3eRiFX0v9zoe27x8DktsqlQAAAA==
X-Change-ID: 20261020-divo-ssgrlpcsrc-2966-i3c-anf-fd3446c91f4e
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Diogo Ivo <diogo.ivo.sx@renesas.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792488992; l=1829;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=QRJv8MvXR6MEs6YMaeM2e1FMXY2V37O9+iPqNwL+q6c=;
 b=hl8HQzz0vhQnIwF+s232dg46+vaNGg4vYSDKKYk/33ehjh1O+TuponORQUhirZW4TupyQmQ8V
 GQUBVryMW3TAQj6x7SOy6+HzctGCFdPz26r4BYcnZuhV4BJ4u298AVU
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BAD9:EE_|TYCPR01MB9686:EE_
X-MS-Office365-Filtering-Correlation-Id: 52adbbfb-d778-4577-5f86-08df2e8da378
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|23010399003|18002099003|10067099003|13003099007|261009223027099003|11063799006|261009221227099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	F8VJmWyVr00MQ3WMC1G0rdZX3AkptM+G4mgm/Lv/Czki8VY+mcW/z+CYE12KA7+0ADE3e9b+rwTLiKsxopoxloLrbMwlQi7KKf+5sL6Vs1cjxlRKNE7s5JhYPOqSTlVIgAK8ZxTmYctF5/DksnEcXE+vpEUNb4NZSXDLEmltNH1PEUiq8UNjPFxwDIguGPEttVzneLIPHmdXywI9Um0z+L/WqX3wka1FCpQ5peHvdnD10EOLwNZ6C86ZUX9qcRtOooFbP8x0mi9feYyh4O0dCuYAolMF0yFWbxhH7060yW4s1t3J0aXpQ/UMxQB3voF8+2lMzui2M7HSu6oyVR41gC8hBY2A9vXQ1+o0J9NWvflmUKivlUcQrGgvt8YeMZWUthU/EaKIfdb7hZ5FV+b/t1r/tPBJ7wNUauJ8flKq5LuV0u7tuVjKvN65WTq2JFap5Kqg12Lpo3MkIGp9+Gr5HFIt+YjOOxVkQt4QGDEx51t5l5HxxNa8zfbfgBD9eFrTFUWuLqPVJ28H1hsuNJAFbZRPE4MQA8Zv4OdEtGJaA2YgkBuGsoFdjWoBAqv3WeL/AkM9+VnZpTs5c+6kCmo/J8zg5jq3khVjDhSXLCd/hRtvrcobG7MN/XJSPST6f6c9Xt9d6ZD+vIvr1zWm+nL/fQ==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(23010399003)(18002099003)(10067099003)(13003099007)(261009223027099003)(11063799006)(261009221227099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b2kxNmalAAaDKWfV/tPNScpt6B2oCJi3VremJxMoZD9J6YPQ0nFDX0vaIiVuacWGy4ZxSDRJ1QH7BiHXp6q0C2WJ6AgdXC7Ybue3JKmjiRHkm28OtYQhxG6sCbCk/8TZxeyTrEewjAuIkq79CsfwKny6mD52S14RZgUXB4oGhfmrSeO3QpLgfN1w+4A1/Dj2jVNxO0cy/WxwxFZyZ4nADg7Ix/cvWTB9hfOXGZ49BFPYR9bGgGJYhrgfoIzjQ2cY8nxnQdyQnoZJZFqrGH7MygN5eKLYw/Id0Gq05MT1v+BEAkK9B1pzikuC/SkxTeTvaZo7tzNdhgK3KvP1MEvCZXzxyCcDvdemXgxWoU2NWNCjwU0uFgR1HgU57YIUO06Ds/PUzQDYA2nnSlXMST/WRBwPmVo6GArgwe2+EH5nRDYemmpv+qeaaVJuy5oKwLN9
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:36:37.7246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52adbbfb-d778-4577-5f86-08df2e8da378
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BAD9.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9686

Hi,

this series adds support for the analog noise filter on the input
terminals (I3C_SDA, I3C_SCL) of the Renesas I3C controller, present on
the RZ/G3L (R9A08G046) SoC. The filter is controlled through bit 0 of
the SYS_I3C_CFG register of the system controller (SYSC): when set,
the input signals bypass the analog filter and no noise reduction is
performed.

The filter is configured through the renesas,analog-noise-filter
phandle-array property, which references the system controller
together with the offset of the SYS_I3C_CFG register and the state of
the filter: 1 enables the filter, 0 bypasses it. The property is
optional: boards not providing it keep the filter at its reset value,
so the existing device trees remain valid.

The series first documents the new property in the bindings, then
adds driver support, and finally enables the filter on the RZ/G3L
device tree.

It is based on top of the series adding RZ/G3L I3C support [1] and
should be applied after it.

Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

[1]: https://lore.kernel.org/linux-i3c/20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com/

---
Diogo Ivo (3):
      dt-bindings: i3c: renesas,i3c: Document analog noise filter control
      i3c: renesas: Add support for the analog noise filter
      arm64: dts: renesas: r9a08g046: Enable I3C analog noise filter

 .../devicetree/bindings/i3c/renesas,i3c.yaml       | 19 +++++++++++++++
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         |  1 +
 drivers/i3c/master/renesas-i3c.c                   | 28 ++++++++++++++++++++++
 3 files changed, 48 insertions(+)
---
base-commit: 8e9b15cbfa80490979fb075d7e46faa84bbb7f53
change-id: 20261020-divo-ssgrlpcsrc-2966-i3c-anf-fd3446c91f4e

Best regards,
--  
Diogo Ivo <diogo.ivo.sx@renesas.com>

