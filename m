Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.85
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794710447;
	b=0w05wHF2Vi+2tvKx6tOtlmRCcBmVd9tVKMmtIK/Pp3TuA09zt/RtvYQ/ICl+xSEa0XEG
	 UOfN77liuNFSvbt17vn0LkdUTzLjpCb9rNPKQH99L5Povg/fXz1o3S8UMu/2sCFdfYnIN
	 UtN38+13lBkFngpEp1tyVD/7uyhoRJ1QxSzrMC0SotjYu57bjYOEJjX2RPd8qI3MlqQaH
	 qBwRu7gFVQQSxb4tdwtCF0X1WzQ1MAxxO2vSmqJBMFlJrFYS4TXOxmiwFEljFvRwJVR+T
	 LkPLxit535Ck10HbhUAMGksts3iIFYeDp6jjia2ZQfmdM/wXIAl6wQnVqOuNLzzv1EA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794710447;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=hy25tSM//gwd9IGLnxKzAwSwOMnuLhLMtqG3viLHR9w=;
	b=GC6T1ZioOQQ3B27jaRZZqlD4O7fbqeVvc/tJYEcvGYJhwHVEj0XHGQrUFh9lMwEVv5eX
	 VWoUtczAjzqA3Fe5vujpI6shL1fUBkuEPzHgngmcuj+g7O4siCmEd0VPyng70l0Um8LZd
	 kcp5EsjR9gXBXeJ9FuU3DxKioBeHe7QtA0erFFVLghjANyX4buEY7CfiqAAs8gUtCRqiY
	 nPojNELixXepzWLv2bD0v2WD92Z4/DSAY9Iic53fAzwgY/WxD84GdJyxNOf1epcQ+l0px
	 SAhAfSxBO5WDKvdEjA74xtw2HMV8YoQgVHFkDHnQmWrWArP76KiWzyQKp7pPxXqqXnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.85
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022085.outbound.protection.outlook.com [52.101.126.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC3B606A323;
	Sun, 15 Nov 2026 02:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDC3B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3JkkoA42Shi3EwvCOzvwmJqfRUrJEuoO6XfT1hznbHkXufXku7jeuqrxU53qu4QdNaf5nUEwBvU8YimgQN3F1yerpCna7bwdVGH/dSyhLWg1uVbnlHJEMi3ASfFqWRa+Ut7JETp7SogUXydf9Ug3ogN91Dv9DWWNBIPtx+aCpgYdv5r2ECT7zt5MZjWnCAyL15h15Ps6lw3psDgP+LXaTr4v8Qyzx3Zh/aAo4Zm/u5XwKVA087krIBM1ZsS+xhecAKsvhBJApAAfppFTyUGWBxKNfbDsVzZPuJaUZVPXFeWHn/ToqNMcROxhZYcHkFHsqm/jq1gW38BTFz8wQb2xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hy25tSM//gwd9IGLnxKzAwSwOMnuLhLMtqG3viLHR9w=;
 b=UkuRsr/Y5Jxhoblm2ZB0BtjYioRxEm0adO6TawEPVhkuadeMg4OBKf8ysekRRMQpYwIxglbJe+q4joXraXG4DMuax3PN3bO8yzx/S/EvjbaO0AJv7SXWJszobDhC4sHc5Alj5OUt8uFni75JNFPT/qQxzxHIXx/WNT8U9iMmMmHhea9EzWnLYgSUJCcfDtCK0Ek5QA/u2l6u81Bhg5H78WDIJba2gNjLr2Vs90BACIR9mTrECcBqS2NFqKbYOhra672bPF72UQjOq/w2/x3u5S7pcn4zDxE5ROLlRLYRhV3bugFfZTDHBKHwjbK2Irkq/sqwbWHa9KUK/Or1zrU83g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY6P301CA0007.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:3be::17)
 by SEYPR06MB5768.apcprd06.prod.outlook.com (2603:1096:101:b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.6; Sun, 15 Nov
 2026 02:40:43 +0000
Received: from TY2PEPF0000AB85.apcprd03.prod.outlook.com
 (2603:1096:405:3be:cafe::85) by TY6P301CA0007.outlook.office365.com
 (2603:1096:405:3be::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Sun,
 15 Nov 2026 02:40:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB85.mail.protection.outlook.com (10.167.253.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sun, 15 Nov 2026 02:40:42 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AF5FC427EFC0;
	Sun, 15 Nov 2026 10:40:40 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Hongliang Yang <hongliang.yang@cixtech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Gary Yang <Gary.Yang@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Date: Sun, 15 Nov 2026 10:40:40 +0800
Message-ID: <20261115024040.4125133-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <sashiko-outbox-210199@kernel.org>
References: <20261112022141.4136099-1-hongliang.yang@cixtech.com> <20261112022141.4136099-2-hongliang.yang@cixtech.com> <sashiko-outbox-210199@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB85:EE_|SEYPR06MB5768:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 87ec7c50-80ad-4ddb-aa8b-08df42c1d799
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|36860700016|1800799024|82310400026|10067099003|4143699003|5023799004|260925021311599003|260925021911599003|260925022911599003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	J4BNiECaKEiUhNlp7qjBmcIiiQulnZ2EnHYOazwaPXVbNEyDN26GNyr9AEc6CYJIC5Ji9NKoxrgEiYIl54J2LnCe9zQTE+r+pRQtCe91Z7O3U4JvFxPV4bD4sl3KgKduFPQNlv2oMpecjyrWDRTCr/dmdWjYBKAwIlwqBezwEt/tXEbcU0lyzOJtK2RUcKgc1SO4a7dPPJHkdmHS/p+7dUkBvJc+CRHXFVBWTuwqtUHoBZUmTl9Zj/Q3R/PkpqmZ7gRPiQsodFXYIi/4jD1yCsSSJOEwOfU6AAqMOQfUdQfv2yAA9UU5c7vRW8kWFJzk4ETQHztzSxkoKuYjmFf02lplPu890veN1kBkWHWESUF73lc6d1GfUwQ4e2Ex8xiCt20HkrOujult9NydP+oZIUBrGJyIcel5iNbF5n5mAvuiUMk+iVu7JzZy3X1h4gi6hOVXzLMgtzaSf44vK2ChPvVSaKBEdn0i/3dWQAs2idmCjqxuWYmnxcXsEbQzYmokj/ORweWKdzPinGPhs29b4/dO0fwyzl1d8fcrcZyiYyS3OW5SoduZRVFHerR08kp+r8OZ83l/5VLzG/Xg8KpL8M8GgnQTOMJTumI56Y4A3qNOtOQrdAmG/W51LTFnrtm4Cgm4wa00N1fR6T/fLt7cEURbK+pkPTSoe+zrzpDxOBA2tgjQgRkcKfxitucWeyaRwaS+UlY540fo1j624Q11uw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(36860700016)(1800799024)(82310400026)(10067099003)(4143699003)(5023799004)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Xv//nzu+ZFKfEP/64FggwkPQSv6YyHVYFQQ78WZ7l/YomdDmyNveyXPspZxYC99Htlmbu29jU94gtC5iUV/B+ZEBirxbIbqFX4wQfU6fS5WK8bEHa/x2DhfHPbI6cp59X7gplS6ZBRh90usjLpms5FqbZ0PnbwFcB7TPDzUKDsf9HidMDAKgkEMpRM75Oel6pHq6WOz3CchDizMIHpOL1LD/kr0RKesHoWF5DmhW729gcBVYH+aFgoTn/BPjYp8oeaCXT9P2PuKETi3y/eX+M1z56I/fCLZzC//NrBrwUWBynJvQ1K4y9ZbNszjokutGnYLtGzfTPxF3suqnYMoTz5bCdejgZQi6ts1kXittPp8xJSQqT6rNZDDoEYX0sitTq4/O/1N9oxE5nc2BLNwdrGc1MHQBt4KxUUN5bR1Jnlo4ASkWyJytnVdWapam1SYq
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 02:40:42.0726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ec7c50-80ad-4ddb-aa8b-08df42c1d799
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB85.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5768

Two points.

> [Medium] dt-bindings: usb: cix,sky1-usbssp: overlapping reg windows in
> RCSU block

The example size is wrong, thank you. The window of one instance ends after
STRAP_STATUS0 at 0x091c0400, so it is 0xf0 bytes. With 0x100 the example
reaches 0x091c0413 and includes STRAP_STATUS4 at 0x091c0410, which is the
status register of the other instance. v9 fixes the example; the arm64 dts
is not part of this series and gets the same fix when it is posted.

The -EBUSY does not happen. cdnsp_sky1_probe() maps the range with
devm_ioremap(), not devm_platform_ioremap_resource(), because the windows
overlap, and that is why the overlap is written down in the schema.

Two 4-byte entries, "strap" and "status", as in cix,sky1-pcie-host.yaml,
would remove the overlap, and the driver would not need the offset of the
status register inside the window either. That is the shape question the DT
review already asked, though: v8 keeps the single range that v7 introduced
in answer to it, and I asked Krzysztof which of the two he wants before
posting another version (1794391238.309976-1-hongliang.yang@cixtech.com).
If he prefers two entries, v9 will be that.

> [Medium] dt-bindings: usb: cix,sky1-usbssp: redundant disable
> properties

cix,ssp-disable is not redundant. It clears CFG_3XPORT_SSP_SUPPORT, BIT(31)
of the 3xPort mode register in the host register set. maximum-speed is read
only by the gadget paths, through usb_get_maximum_speed() in cdns3-gadget.c
and cdnsp-gadget.c; nothing in the host path reads it. For a port that runs
in host mode there is no other way to keep it at Gen1.

cix,u3-port-disable is not redundant either: it writes the integration value
0xa0031e07 to the 3xPort mode register in both register sets, and
maximum-speed can neither express nor restore those port mode bits. You are
right that the device-side register is also updated by cdnsp_run() from the
child's speed, so a dual-role port could ask for SuperSpeed Plus on an
integration without SuperSpeed lanes. Every board we ship that sets the
property uses it on a host-only port (dr_mode = "host"), where the gadget is
never started, so the two writers do not meet there. v9 states that
constraint in the property description.

Best regards,
Hongliang Yang
