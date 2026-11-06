Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.96
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793953039;
	b=RGxiFWALrnJCfWlv29C2O34QswyC44cdJKa2amQskc86vDMCbgGBwgscrtrfskoV93Vn
	 HNbKQONInXWdmbbr6+HRuAzcnUxsCWSmuPf7F8HEi//EKzuJocuoVWfE/OVFcUKm1zYWG
	 LRa9J6bsi8yniQ4fkeXSJlaASZLBI15WIuPhyIPb9sVeeucnwVU9d+RKRQLqWdIvUhn7c
	 lQW82iW+8fwb685mFpUYkSwcjQqQwc5UrjQEDzTXYKaKlKm8NKeDFICx3CjyVoluWUNuF
	 WiCNG8RZGkxW+39qPAPY0dMwb0prB3LMrpXH/h5V3UI0grLa30xhemH0h+sMkJiD7DA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953039;
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
	bh=ni+CfVrV5EAINJXBPy7UDKr3UD6DUbF6aBcKCi8Dt2w=;
	b=yfA9EMMe8xJvbMBhcOXf0eHVeNiM7ScAMpSJAhOkPUuPwT//b9NH4Z/TyY/5ZPD8+Fsk
	 fF8bE2Fg5V74YO9Ei6Bf3VG/a7UosAZLx1NDgOKrD3+S9FopiLSsaK2HXTpNsmEeVFHcV
	 m/IVJfrTsEEEuCAan3fkolz6i1b87pF1T8ZjjtIf2Vxkr9P+DFbS6j7sjqAG25Q8YaUBT
	 9lGq8LL6ix2rzeoD9xQTnB7MzUt1Y35yl1UkfXHagESRRXGOoRr84XPYrpxQ36pPy9kzI
	 rCxhtbmNmb1Gj2pHMZKozKWONABR+F0KnvuBhY7XsHuPI8TDoWfrzOfqwZtIJAGvieQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.96
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023096.outbound.protection.outlook.com [40.107.44.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B96606A32E;
	Fri,  6 Nov 2026 08:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03B96606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWuRAohTbzEjj+PgTKKJzHbSIdYqTi9A9IJaEEBE4PlsIHxMBC59AJLJUa9MIpMLfWgaBvi36g+UScR2Zpl0csLMVju8ub1AV1XwrY3xv3gYdcfFCYiS0Ep53D0QUIFrnNCwfNUXEmLayiHmArFUMzDBRWn1odJIvTGTbDnxXrD3FiKY3/TI14aUSyzs5rV++/Q7AReJYN97K+Nv7KVYXmnKVUtc7nRNa1jwtSwhXwyp3nYyuhVF3RZTAam0mwvfncgyUs/5nzbut3W5LNrovj9GJMb+JghAY4RxaEjfZK42CFGA3NXx3OK1a5482afAl+/IXnMwtDZnBhFpaD2rlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ni+CfVrV5EAINJXBPy7UDKr3UD6DUbF6aBcKCi8Dt2w=;
 b=m73RiscCXQaBWPbN5Y8vB4+B89nMNvcb4bJFicN/SMqJDnT7+NPKFnAYJL8zu1CGtpb/ZFm7rmAmfQlld/eO+nhM3Id38H/RdJvA7AOFPt4xiUnE+iESO5vmZcjdzqphzh5ioO4U1Cri5aqtcssIpHP2oTacfYRed/p55STbQKMtr0bsvPGVuQDLjOf7tXFRR1SldJvxE+bYZIHK6YT/eQop7qxx+A+1xdRAl0cFCBUQvPjT1oOXDI9MbtDM9ieFjWTes+9y90zP/z4lUWKezLBvLkjBeO+gBnXewkvFz2NGxRHOTwh8si9HVfxhIdGOqChSCdTCvSlooZOq2S2Lhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:990:56::11) by TY1PPF19F8E0514.apcprd06.prod.outlook.com
 (2603:1096:408::908) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Fri, 6 Nov 2026
 08:17:13 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:990:56:cafe::b) by JH0PR01CA0002.outlook.office365.com
 (2603:1096:990:56::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 08:17:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 08:17:11 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id CCB8F4102E60;
	Fri,  6 Nov 2026 16:17:09 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Hongliang Yang <hongliang.yang@cixtech.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Date: Fri,  6 Nov 2026 16:17:09 +0800
Message-ID: <20261106081709.1004397-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <91d67c5d-d125-4834-b0c4-742951c59af8@kernel.org>
References: <20261105011803.4058557-1-hongliang.yang@cixtech.com> <4d075b70-f2af-4aad-a1d7-cd8ea26387ca@kernel.org> <20261106055050.948470-1-hongliang.yang@cixtech.com> <8ffdf2f9-dd67-419f-83af-8dd4206d54de@kernel.org> <20261106072849.985274-1-hongliang.yang@cixtech.com> <91d67c5d-d125-4834-b0c4-742951c59af8@kernel.org>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|TY1PPF19F8E0514:EE_
X-MS-Office365-Filtering-Correlation-Id: 477cdb02-153e-4ffc-581e-08df3bde5bc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|82310400026|36860700016|4143699003|56012099006|261026121527099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	q7J2hEVt8jxIhPcY4QeRyv2AZh/4yM0hpCM9BpmwIBX20ps4pxBJ5OjAeyYnz7XFJuB9FFz0dVhUVbrYk6wvSvxMExSTsH3Z+gbdgcDRC/VxpErckJZ/4oUUuGbbc++c0zMTuZjCewqn6NHcLYO3MjXE26EibH5ql3wg31HyQlr3Su6ZNjxyqt7VvOkDvLGgskZc0S7AtIYsX8hZF2vkPupwlSFCBl4cveAthu6U7oUCIEx3aOMdkc2JEZwdft9T24+dMgy2CQ6ASCJq/6aMu45lTtYExnE5PUzlKtm13cAPdqe5jPo3QtT56pfm3/2tFCZmgfzPGpzZiIPsP7nmoK/8v+Dx6Y3TK8f5QTmzN7bm59yQFLkCbKem5+BJd+nf7KLcKG7Ic1AZcI/cgH+5zEIcFSBzpQ3abz4N15Y+Iffv2fA4SWehmENEZRAXnKto63OUG6A27eEAbJdxo5M5oBXroOreETj6pCdS7ITbF6PsPSCwpPFF0+Q01BEj2zdzQEIPvnZ6E52UVzxgu4Cexw7uBJe90Xxk5h3vZcWvegR664YwjiuohbUpurKVA/A6NqTkCRUaXCZGxf6hvkKCMgcC2LNxaI57pQTXSHEtIkwdCXrM8pSSFieMj6U/TW2nh8jEZPVBhqxizPLpi/NGWR9RSDmvkYktbMbkTocfB9pTjuD5E+ktVa3WSCsqJAZK
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(82310400026)(36860700016)(4143699003)(56012099006)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V3BHb0I6FZ+jDeF7iWZU26+pa848wmwjoHqkCPgLfMmE/ifAWb75q7DuDzjYet5ksyWiCIk7t8qsI8Icjw7M4RWKz75a+dKmiB38xsjnFIWbl8WUmg3CxF4DfxBa+LhEDcvKMPNyEVcmoW6fvDFbp/BHVoGpDieTagsAv2hYgAoxdi45tAwE5osLdz9CckPsCqTwgh9XlFqUuJz726AfulxTxsObi1rQpbEeVkgrHBSVcHx8+at8XAiIJlKIg8owMcjUVAWuQt/uFpLfIagswoHabczOPMmkLcDWfG909WUzdpjzRBE8EaK6dm2X44flFd2I6xyAxWOsrgvpHCALGZnv40JO6CvblH7aUmdA4dpXBTFEdGpCbmrPB4dYHryWji5LUQUk8/3Bdm/z4+VdrBlovxlHLgHeZIEibghXK2PiFzkCRSTM8CcBkwDzNT85
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 08:17:11.2555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 477cdb02-153e-4ffc-581e-08df3bde5bc3
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF19F8E0514

On 06/11/2026 08:39, Krzysztof Kozlowski wrote:
> You still combine USB with other subsystem. Identify subsystems here,
> please.
> 1. USB
> 2. SoC, no?
> DTS cannot be placed here.

Yes:
1. USB - the binding and the glue driver.
2. SoC - the arm64 device tree.

You are right, the dts does not belong in a USB series. v7 will be the
two USB patches only:

  dt-bindings: usb: Add CIX Sky1 USBSSP controller
  usb: cdns3: Add CIX Sky1 glue driver

and the arm64 dts will be sent separately once the binding is accepted,
so that it is not mixed into this series and does not hold it up.

Hongliang
