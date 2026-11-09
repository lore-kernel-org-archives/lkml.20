Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.132
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794190086;
	b=lJAzLyAjYR8R0XgnIFWK4HkFRQEJ957LXiJ/YmajSwfUPlHp1IbYxhWjFysC5TL+tey1
	 oGZPpVXPE99+ddE4GjCREWvAcuLSbfGzd4WhwYVMLMnb6mCc0AtzOD7777LZ1e/jRRBHl
	 R+mLjufMtqIXlMlejSoX0zSAI2p+5dtJ5nje34gvdb+FEjlNgEfVSc9aVL/T+OBzan58+
	 6EdiBytYlX/MtRhcuWmU+cTkQdwM8IQqsBr2OLbrgwLFpW2r5lNaCGTjCcUojn0bPQ2/9
	 k+N9ldwfPfaRm8/qli2J25KBIVbSR2b8vSS5TgC9YGVGtKhtpvyZ15vLKe+V3K51SLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794190086;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=get9ljy+UfLeTYxtFfA5K653EnMiLg25/XGdzuB6N6Q=;
	b=yzMu789ekLvLxDH3bjWUNvjPn6DYAn9y+DW+IGLrSh5rRkcAVC4S9FZMo9FFAnkA3nmM
	 W/Ge6wbi7po/4fSlnV8AlJ5+okXImKZzr5EAPwBKomUVqGHmIqtOXRaY0roDjjPTw7xen
	 f6dp2JDMf5/Ttheai0vTlbxriFJNuEovsX5D3DjmRN3kZOtYRdbrDcQXiTD5yxOyf6Dvi
	 jwzmYHDvi5skeehH/tSwCsF4rc1eZoFn5mdGoHJhpoQs64geCHv3CucAa4YVGeNGliq/H
	 +m+E5+rRrI8uBJSgeMcRmRkFR0hCIguIFXWwXnkBsczKo+dB33H/eRIGz28kRhclD+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.132
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023132.outbound.protection.outlook.com [52.101.127.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6A1606A31C;
	Mon,  9 Nov 2026 02:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA6A1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVlnhv54xzclJQURjS3peZpYc5+b/aLFECQN/jCp4oISNuKWOPsArB3LzgcD2Amzv23gppSCppNIivb+ur3NS1n8dQvQETvBXLbTu4lPiDfL7g+i/1JVDSlnrHdb8mcXMzxC6TLE/+LAerrmoyCMSgixzqA4xSNtSFCfgL671fgjBvEaOCCoqqTUMdyk0xmxLey7+Uq8z8h872wRu4Z1iswiX8N7iBRZdfcHAmyzn6kyvCz7/Gdp8NE38Bl5kP7IbAxjlPODiwi+r15Iewl/iNwU8yrXwXSjXdZ0vKkQ1/Wr/YA0fuIoBKqIFonU6b1auyjAJQkENknrURaqE2VjaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=get9ljy+UfLeTYxtFfA5K653EnMiLg25/XGdzuB6N6Q=;
 b=vWbYoVpkCAakQYa/EBRIlj4UQuPb97HQmUidAQFYlVs63myQoJ5swNc8zpKi/AJk2xDFoUQI9LV78oKZXnmoPtleEraZ5c/3I7zIgwKuuTphOEAFoL51spHdgLSEg8+mvbeuFC8a0J0UlyWpF0UeIoMDkybnWcaIeuqd8XSwkVzCkVgzaRKgdHe3mxZwrW70Exw6jNYADsE9q1vaj30OXHRiugczFxWiRJBYVWlvKqbgzaW0qQG6ZcWKivhnZihoczxHRH3zUHKfHwjc/D3ugWN2fGnlcSieS1jvhI6BhIuIXIK18nJeDGOlG5sNf8x1DAl44nuwiH+7vkXWkKyh4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SE2P216CA0153.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2c1::9)
 by TY0PR06MB5428.apcprd06.prod.outlook.com (2603:1096:400:219::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.6; Mon, 9 Nov 2026
 02:08:00 +0000
Received: from TY2PEPF0000AB8A.apcprd03.prod.outlook.com
 (2603:1096:101:2c1:cafe::5e) by SE2P216CA0153.outlook.office365.com
 (2603:1096:101:2c1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 02:08:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB8A.mail.protection.outlook.com (10.167.253.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 02:08:00 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 498C74102E61;
	Mon,  9 Nov 2026 10:07:59 +0800 (CST)
Date: Mon, 9 Nov 2026 10:07:58 +0800
From: Gary Yang <gary.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH 4/4] arm64: dts: cix: add RTS5453 PD controllers to Orion
 O6
Message-ID: <avEq_ngShxlvFSbS@gary-System-Product-Name>
References: <20261107011012.3655873-1-gary.yang@cixtech.com>
 <20261107011012.3655873-5-gary.yang@cixtech.com>
 <65af581e-caac-430a-88b1-3b7425c5209e@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65af581e-caac-430a-88b1-3b7425c5209e@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB8A:EE_|TY0PR06MB5428:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bed19be-9232-4f0b-eed6-08df3e0647c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|36860700016|1800799024|82310400026|4143699003|56012099006|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261026140227099003|261028144727099003|261026121527099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	aApyjdlYxx+w0NF/Wj269Haomxp6Ah/RuCzIcrQwsgv/zvE3l0EnBNJx1Rsllle2CWYqGQ3DY8yushgQbn7Nh93efV/e4rHbjBcgj+JQCriJmIlDATjba/HRF91fzmMqlJmWh6FJqFlI0auv/RED85AqB51JsJWPPpej9Uec1sNsI7PXQ1Ib1TolXGjSv6pDee6IsqqVgV3x0ZhB5jRuMNeAfb5ZYVPSk40+M5N6VrMs/pM7Rz2emwIFtEJG558ThLp8qAvlKWZDmxIetiEJANmtsEoxFdvNI1cUFzmcr09Z08ymwv9n77S/DaCrPXwafpdaYxX1YdQsCVRA2Dz9W5rTzVS78PD0WFZZRMWQ82eYb5B6Z+3J9jqrsmrPzSkFRFYm+vnGIeE3r2XBxgk6QQpttW7XYEEgGfRVqapX+etloSMKXFYZMJ3GgIsuuE19zkwEYIArIDd/ErKcf+tpNKdpS3khyGZTVVvs3oOQ+Zw8aUCHZJO+bXP9RvAPEcnoyHHYoLOpdu6fTnRdMn8tO1uwl6liB4rvVtcQ7QUKq4CN/DFtMgrtQvZ9iiehmr96UW6WF6Z3YjoNAwmZhSLsd05ytR6QOL1KPUPwmtWrJfFRMDMnW/S8wshTygGgnuQPhSyQ8aaJqryNQ1FXsuDkIMYYuKtxhLhbovRZOKjm2hlh7KpOrvB9LzzMEycaUiJA
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(36860700016)(1800799024)(82310400026)(4143699003)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FAgghdDsfqbUMu6ATlLEBYTh2e/E9bho5XTpx7MNcDwwAufvyZVFA+dIoNFtsnd0KCcVVsdRjhcN5R4BF6geF5PFsX8nrH3EoGufWydgrL6BVLHZHkRaIOKquy7k5vjFa2toicSz2GKm/VTMoAbP1CW7ccFIThk2JplIEe05+uRURdsgEW99G0dvbMvZm1+feaY4OEjzOJ56ddT3/vICUmcRzL9M1h06pErIrkLBT3TsJMjCt0Xzb1t3wfXZy6Ri05hyKpBcO6NtyDmKgaSpUEnV5S76RAk92fXowkzaftpZY0b+3L8MXjuvnrwneR0vD45GQUuIO0A69NoZ5uWIO26AimsBBNqdqct/gZRE5bs2nXaUmmA/rAJc/XGhXI7LXVhAglAO5eVhRf74npJeSvx3CiguFbHTldUcheJ85asM2ZjBYisq3ofJk5eO0Xs2
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 02:08:00.2028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bed19be-9232-4f0b-eed6-08df3e0647c0
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB8A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5428

hi Krzysztof:

Thanks for your comments!

On 2026-11-07 11:53, Krzysztof Kozlowski wrote:

> EXTERNAL EMAIL
> 
> On 07/11/2026 02:10, Gary Yang wrote:
> > Describe the two Realtek RTS5453H port controllers on the Orion O6
> > I2C1 bus and add the I2C1 pin configuration.
> >
> > The controllers route orientation and DisplayPort mode changes
> > through the USB/DP combo PHY lane switches, but that PHY support is
> > not upstream yet, so the connector graph endpoints are left out for
> > now. The Type-C ports are still registered and reported, only the
> > lane switching is deferred until the PHY nodes are available.
> >
> > Both controllers report through the same level-triggered interrupt
> > line, which the driver handles with a shared interrupt. The I2C bus
> > runs at 100 kHz because the RTS5453H I2C interface does not support
> > higher rates.
> >
> > Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> > ---
> >  arch/arm64/boot/dts/cix/sky1-orion-o6.dts | 51 +++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> 
> DTS cannot be combined in this patchset and must be split. Don't mix
> patches from independent subsystems when you send something explicitly
> targeting only one subsystem.
> See also: Documentation/devicetree/bindings/submitting-patches.rst
> 

Do you mean the driver does not depend on DTS? Previously, it was acceptable
to put the DTS at the end of a patchset or place the DTS in a separate patchset. 
That’s why I put the DTS at the end of the patchset. Has the rule changed now?

Best Regards,
Gary
> 
> Best regards,
> Krzysztof
