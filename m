Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.139
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794366573;
	b=bSEdBp2aqbpt3Dbgwfbw8ike0MhZK/J2iVY9S0EC952C9HZWarjvjsQC0wXmEj+sPZ3f
	 wXS2VJHKF2NU1lR7aPWd4JN3QjRcfvcLxtW8bd8De+dNYyQA8kFXtM41fmXRfNeIVcZ+p
	 ad4bj5mVcFbX5zB7IA3wA0rI3Egb0lRu77T5W6BWKyan/lttj4/gJuNwKQnRjSheD7/dg
	 HUslszdDOPLVMYUMAgng7//e0uTEXLbxK8/6JtFo/GRv4eMLYMkUXf2B+cqTuFM0gcQdZ
	 sdtzvCxrfs12lCIMKQeW5OlFteC5DETijz3mm2DCgrYVk4CujRG8XisRoctBiyaFcpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366573;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
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
	bh=GU7PuEV6UJ6h7XJlVJfjR80y3IBTT2vgKBTYoc0dI7M=;
	b=HhWCOu3UC3xNNFbWq4Ow5vY8AshgxX1BZ7U9xLYmmGxrRoIOanOultQtbm6X69X7QE+n
	 J53ha5iO+PI8k15Aj9/REKlfE7NkczZMstq7BNPRO951TfASMD2J9wSvmHckTw22kGcJ1
	 LZysW12vNtOCgFng1i9JQric1tYMsb0iZZZPIx5wN6Kh+F+BDKWyA0uxkt3fxBAZ90fe3
	 15W6XpcaF8koN9aZyHvOeTbajGbNcPNk0z0E+UDGYyYHfdOFq6dY9QU0XBFOQJaRSkyai
	 xOmNpQ0caBKhYvygMVNE++jFBv0vjzbHnycoB/h0FMDJeYdlCMuSvbmkWamMSDEYX0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.139
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022139.outbound.protection.outlook.com [40.107.75.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03557606A332;
	Wed, 11 Nov 2026 03:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03557606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rVLwmg6ebfKUVPm4aF4gqB++y1MYU3SZaKMbkwVAFakHPVSDUD34iWSF7J2FHr1mvM/sW+JQ86qtcvu6bO7YgtNRzIc7W5m87myCEuQ473fALqILDRSBkZzKKe0ZBa1eQuEau7e6HT0mue+ThFjnAYPPSyECjslhlieu3lq+dFC4a0FMpJ904MEN+OCmRvgZH+vRbwUYvnq3tMAqKDZD2VGxKiI7mCW0Uc3gwB5fU9V/ZRDAA4oJtMm+lFwAhhS6gOZQJrELvuAjXHzyraSxfLRU3RZwPTWpsIdnXIOu5aT3lDZsbzkoqfAnZq2kmQ3haqjSCj79ebEiENXWWAnEiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GU7PuEV6UJ6h7XJlVJfjR80y3IBTT2vgKBTYoc0dI7M=;
 b=uZAUO1MhC2FL9xhbZUFZO7mY73bd0wL3jjtHITxaHXThEDtyakdXzfkekWCBn7hy9gNJVWVLOvYF7/+JgS+NBhsdz74u2e5cHzza/QYnMEVEyJPyV7vLp5Stpwwpmdhp2KSBajIBXTF+cEVS7Rkk9bk9E3P+gqDkhmeaYWLC6AYIvonLZn1BNK0zOBybIsqeDkkCPT+F2EUXMDkPFnBhjF0f34VSlUQlVTJ24tGSpNMNpBenFcQDjtgeb2hrJ4SyfxTWoBbXoVVYY+hh627WlmtE/CkMpYdZCdftWaZWpFZ46Ky+sYNZ0sGUIKg68PL0NsvSKyWUfrQ1SvQrvjgBpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0039.apcprd02.prod.outlook.com (2603:1096:300:59::27)
 by JH0PR06MB7107.apcprd06.prod.outlook.com (2603:1096:990:9b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Wed, 11 Nov
 2026 03:09:29 +0000
Received: from OSA0EPF000000CA.apcprd02.prod.outlook.com
 (2603:1096:300:59:cafe::a) by PS2PR02CA0039.outlook.office365.com
 (2603:1096:300:59::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 03:09:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CA.mail.protection.outlook.com (10.167.240.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 03:09:28 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 05EC94102E64;
	Wed, 11 Nov 2026 11:09:26 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hongliang Yang <hongliang.yang@cixtech.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Gary Yang <Gary.Yang@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Date: Wed, 11 Nov 2026 11:09:26 +0800
Message-ID: <20261111030926.2954510-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105-kind-macaque-of-enhancement-ee0365@quoll>
References: <20261105011751.4058411-1-hongliang.yang@cixtech.com> <20261105011751.4058411-2-hongliang.yang@cixtech.com> <20261105-kind-macaque-of-enhancement-ee0365@quoll>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CA:EE_|JH0PR06MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: b990774f-6738-4bd6-7220-08df3fa13320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|23010399003|6133799003|22082099003|18002099003|10067099003|4143699003|5023799004|261028144727099003|261102123227099003|261022105027099003|261021121427099003|261009223027099003|261026140227099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	PoN4e/MHAauhsvrQT7UOKqn7S7o4QX4uQIOJaROaYcJcXmkeUyQlIAj/zX8NFGXSWe2Te3yspSmh3BQ4e9GqaVH6eWl9uLfQLCHS+qoRJK+jNEd7KgHKSG0s9Vgm0kZyqr5Z5gjaYzaQyABd7p8N2PBS4y/BTWPtk3HFAygoSmqrM1iV6adK8m+/e3ljnnvBsVjTRPbz/qaL9Z+sMQWMAxAOpf4o35AWfWSd7F8z1SeiyYJjfH6Gw5G+dGHqzyCNjAwUsNcYVyyurbpecmfXDIWju3GuRkZTHNyfo3W8NmCrAHhrIaUKzmrectPYmomHRo9GFoaJwehKte1G2XqaFT2z5Tje9brhMf8yT83zlxNAdvfB2SacreRZOSdUi3e15k6KVhe8SrhNchh0L2CN4TCiNaieDOO67Naq2qh9RyyV4uFsnK8Qm1/mIcMHCdGH7eoosZU+SswLwXECB1if/s02S9beBEC2tGpm0MeajpqYcH9ZB9wiPZSwt8jv5XmAjapZSv+T2fi4T+TljUSxQlcJAu+6RM9pg1bD93OZQn1t8yjwr9XaK2f550TrJHxA+frU2hlXtXRlPMUk11FCOv/nG5bzFBIq4WS46ZDixv9bWFDUAyP288Tmz3H2jMKdZME5z/mhaNepsL27vn19CHd2SC2c/o2QPcBJDw0X5fEkn+Hkn/T96GS4dZ24x7mL
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(10067099003)(4143699003)(5023799004)(261028144727099003)(261102123227099003)(261022105027099003)(261021121427099003)(261009223027099003)(261026140227099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wHOmJBbS6t1mMS3exJlfsgeczcAgDThbLG/sdGaZnd5hYM1Vao9b5IAgYCRUZKPHNmnqo/AlpjlbqTZdc3RjhEjlM9PqSAsVDyF08XrdSI4l3fwl7L2ArgDYLq/E5tOu4Ky+behlx4oOvwx+CsZcPqw92A4Qn7tlzjtsxpkR0t3MbsSjNSDxbP7pTnKh2QyWWgGASKo1fOE1qugDDe1y/BueHr05o3h+NyzPaJlLAW/hWbsuqa0slh1mBQWaB4/2PKinlDkEfWQY76FQwwPBliahLMKxldEaY4UwaGWPW9CDd7p8JnNtsbd94dyyklXs9LZ431OJhSRMf67HMsXWakQ2YUcGBy8ZbCsT2yklAnombenXwv+IIOz5NjmK32rrUNrfrfPKLgEucBiUDgkV9oBtvx1cAWHNLOFFC8GJ3Ls1TCfbSEIE38sT94BVNtcY
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 03:09:28.5936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b990774f-6738-4bd6-7220-08df3fa13320
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CA.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7107

> So previously you had two phys, now you have only one. Confusing. Where
> did the second phy go?

The second PHY did not go anywhere. It is the second lane of the same
block, and it has no resources of its own.

v5 described one child node per lane:

	usb-phy@9210000 {
		...
		usb-port@0 {
			reg = <0>;
			#phy-cells = <0>;
		};

		usb-port@1 {
			reg = <1>;
			#phy-cells = <0>;
		};
	};

Those child nodes had no register range, clocks or resets of their own;
everything they described belongs to the parent. Both lanes are
programmed through the same register block, with the same clocks and
resets, and by the same initialization sequence, so a consumer has
nothing to configure per lane. The two children only mirrored the two
controllers.

v6 makes the parent the provider, with #phy-cells = <0>, and both
controllers reference the same phandle:

	usb3_phy4: usb-phy@9210000 {
		compatible = "cix,sky1-usb3-phy";
		reg = <0x9210000 0x40000>;
		clocks = <&scmi_clk CLK_TREE_USB3A_PHY3_GATE>,
			 <&scmi_clk CLK_TREE_USB3A_PHY_x2_REF>;
		clock-names = "apb", "ref";
		resets = <&s5_syscon SKY1_USBPHY_SS_RST_N>,
			 <&s5_syscon SKY1_USBPHY_SS_PST_N>;
		reset-names = "core", "apb";
		#phy-cells = <0>;
	};

	&usb4 {
		phys = <&usb3_phy4>;
		phy-names = "cdns3,usb3-phy";
	};

	&usb5 {
		phys = <&usb3_phy4>;
		phy-names = "cdns3,usb3-phy";
	};

The driver reference counts phy_init() and phy_exit(), so the block is
initialized once, when the first consumer comes up, and stays powered
while any of the two is active.

The v6 changelog only said that the per-port child nodes were dropped and
did not say why, which is what made the change look like a PHY had gone
missing. The binding description and the commit message of v7 state the
reason, and I will resend the series with that.

Also, the example in the USBSSP binding still referenced two phandles in
the v5 form, which did not help; that is fixed in the USB series.

Best regards,
Hongliang Yang
