Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794486485;
	b=myp2W8KdG96go9nmxdi745T+GbhkOL1vFngnjgzxypwGc8xFGefqe5Vwb1F3y9GUIx4t
	 LtQtLGsXS2G2VAeVx31pSKqyAwz+Du5R8yyzhiscHfvVXNbGwM3RYGRlEnfQXDzIr1GcJ
	 9NO7aD6ZaL8clmXwZ/Ml1rYO4pPVWO/T28AgiQw3EJtNguPJ54APkMoEdrIohOFeVi7ZC
	 jlcfFEmUvp6yv1iMLlznB8fCHnZ9wkAO2RXq0KVfsowcv4s9lz5bJHOk/loApD0M+NTY4
	 iMilc4dsmadKbevAhAe70544e927n1dAo2xDTGxbO/F33cj4M5RmqHQw0MuDYIMt4EQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486485;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:X-CLAM-Verdict:X-CLAM-Score:X-CLAM-Description:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=dUWK25Zxj2RdQC2TG/5l3DQZ9LGVS3MPG6T9CpM8oTA=;
	b=IZ2TPESz1AMC8HoUyKdSRIfL46AZ9g5GTLeIgRF9cSRaOv1uIOTBZ8S0o06+lkM/p8Ag
	 2wvkxVUXZctqTL2zFE6U1J06x1D0VkYT8iTlfv95LFFE6ajWDj66hz2G2xDRVburPnsUN
	 vUbArHVDCezhmefJlJuaiRg8rMpLGP+WBMwWeRgHGDfld3UMETnZFd6+GVKmnD/FkIHfn
	 9Eo5avlVlMUVYFSCDCknPaHEjAfGXoOu2FZPUEDYBol2NeJjwndXp5pA9bjGNKUkKuphY
	 pglXFDYESnEiF4SwHO/4EHrVWMNJptyoOZ3PUSB8USxjZiI3Hxwj2jrOUyRUZYEXdUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=philips.com;
	spf=pass smtp.mailfrom=bbl.ms.philips.com;
	dkim=pass header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=lQ7B55dH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.58
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011058.outbound.protection.outlook.com [52.101.70.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581DF606A332
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 581DF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=philips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bbl.ms.philips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=lQ7B55dH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhuxC7hm5PtVzGWEPULBIhRSz1J5883RZfGUk+yxsBx0O3qZ9KwWBmwU/Oq9VyUd91u+tnx+/dHVELa2rVpMQ/LmkivLBymIgpdw41mosC+EuVtOg/Ndx89C9NZ/Ke54RhvzbHqZKT4zz1+NxnparVoy4zVZ8mjuQ4AGLUkMQX8NNU+wki3uKi8yMXu5CIH+dUpHNIvdJa2AI+6mk2rSSB+DBmzvZa0/jhGU1bXVcD5W9qwO0W7znLcg7Cth9wDWpa0GUwhFCjWtsn6+fSeuAbYqBCbitxv/IC1uTS9Ggv6TmsjJu9Ce42+NmGFaeT8nI+/ab5P1W9xp4olLvaAzTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUWK25Zxj2RdQC2TG/5l3DQZ9LGVS3MPG6T9CpM8oTA=;
 b=Xdubam/CqA6VG5e3rV3zysA4l9u5TL+KO86lXF5Uflcn0SZIS8TUIpTNXCpqCt6Llwm2xv8Jqut+Dm50qLD1MjK2UJwwpEyEcPf0+DAypYli//7lBBkU5rDDpr6UsmLT50KC3k16MJBvg4iElTRyZJhKYdi5S3JiOKWBNzvBtfWuPqsXzziIL/8mAXoVDecT0hJg5tPUB/dnLNM0xZq08xWs6IdK/F/73sy3VULaR6m0cdIE2+Ij1GcXLzUTADUokBCeM9EycbD6Gumnlnik8omXevf5QnmWrCf1uGgIbzkrRkWxjDp87jyHOZ0qST8/UT3DhtD2BfBzwg3p/xw9Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 3.248.88.141) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=philips.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=philips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUWK25Zxj2RdQC2TG/5l3DQZ9LGVS3MPG6T9CpM8oTA=;
 b=lQ7B55dHFK+N1MKfG+d2uVyfOwljwK83RydQ3f4aD1JGUs8ybiUr51SlW7pGx0RCHkM9xTcF19lWYl48tfYNTDFUjnw5l/tKTUwd/SJcfETvKeydJU5RQvT+HMcxoh8uL5ffhwghIx8BNKMNxd06ogwzjzPpLtzzLFOUytd/52k=
Received: from AS9PR01CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::10) by GV1PR10MB404396.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:139::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.0; Thu, 12 Nov
 2026 12:28:00 +0000
Received: from DB3PEPF0000885C.eurprd02.prod.outlook.com
 (2603:10a6:20b:540:cafe::68) by AS9PR01CA0008.outlook.office365.com
 (2603:10a6:20b:540::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Thu,
 12 Nov 2026 12:27:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 3.248.88.141) smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=philips.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 3.248.88.141 as permitted sender) receiver=protection.outlook.com;
 client-ip=3.248.88.141; helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (3.248.88.141) by
 DB3PEPF0000885C.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 12:27:59 +0000
Received: from smtprelay-eur1.philips.com ([130.138.84.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTPS
	id RRX4xfxuJf0UDRTuJxbDvO; Thu, 12 Nov 2026 13:27:59 +0100
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id RTuJxJvkAbtn9RTuJxUxdC; Thu, 12 Nov 2026 13:27:59 +0100
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
Received: from bbl2xvg1.bbl.ms.philips.com (bbl2xvg1.bbl.ms.philips.com [130.143.220.100])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id 13B69180398;
	Thu, 12 Nov 2026 13:27:59 +0100 (CET)
Received: by bbl2xvg1.bbl.ms.philips.com (Postfix, from userid 2884)
	id 0E0F0FE023B; Thu, 12 Nov 2026 13:27:59 +0100 (CET)
From: Vishal Gupta <vishal.gupta_1@philips.com>
To: linux-wireless@vger.kernel.org
Cc: elb12345@hotmail.co.uk,
	francesco@dolcini.it,
	jeff.chen_1@nxp.com,
	johannes@sipsolutions.net,
	kees+treewide@kernel.org,
	lilinmao@kylinos.cn,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] wifi: nxpwifi: fix race on scan_processing in nxpwifi_scan_networks()
Date: Thu, 12 Nov 2026 13:27:53 +0100
Message-ID: <20261112122755.183585-1-vishal.gupta_1@philips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109170400.1316239-1-vishal.gupta_1@philips.com>
References: <20261109170400.1316239-1-vishal.gupta_1@philips.com>
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
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885C:EE_|GV1PR10MB404396:EE_
X-MS-Office365-Filtering-Correlation-Id: 8870b3a4-210c-42ee-71da-08df40b8635c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|22082099003|18002099003|11063799006|10067099003|56012099006|261026121527099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	yMxaFrn5IBmytOm7Tn6pTFOgJZQuLKtd3TKMj/dcNXSC27MPXMFIl08kCw+rtoQMvvo7aRYtTCYvNrYcuAtyYGbLkt/IgWKOTjCYsc1axEIXU5AzTXvg6WvxOiToFT33dZYGAGToc7WtR4LggHfBA/K10V8SwhMbNxIx1oahAjztHhfGNgGFXhLXVT7jUoIOyqfK9rpvcNuq4lq9IXWulVLU8T23tf3V8VgecRht3J2Td9rdgzL8Qsx+cuna3sleXY1mteV5LnFxbK5W6Rae27fr99qiBvfT4pCYeKXRoWVBmENwCsBVG4RH28SCRUVU1VhDck2oWCFWxR++S0ezt900TvgEWDDnRZN8XNBO99CYOMSZQ58k2JEyWvrcrOj07gv5WEI9VmruS+f8vkV0SJqAVHG10EFcxfQ1knCaXMcsPo3PeZYiBF/tyRdDMVrKtRDfSZ5MJWV8Ld65HIFTXSmIqTCkJZHHZXRvncc7YKEav8PHhpTyUVFcGMmvxoUeAe1ZXPRUKKZ/vQydxf8T+Pdh39c9d7Zjc4QKbwU1Za5Nchs6WOJgg04CgMb2eveACl43MTsfsAJigqN+UV0iwigomQ6kpm/isOfcLAu6cx5B/0On7qq6BtYFCxBXUocdZADAb7LJKg+x6IC14w10S/tufWYqlPg/+JUwLmR3ca2RliDL4b3LNaywSiDJyKjFcx0TagTSQH5o0xyvdURzEw==
X-Forefront-Antispam-Report:
	CIP:3.248.88.141;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(10067099003)(56012099006)(261026121527099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	l0MELcH5bMaEWfYh51Y+LLWa/PE5IdC+M4JB93wvIO5mrHqyUH1WhIZwEvUqpvToGJh/hC8yzVIOC7EAP8/s5vCB7LbaxV2n7h58nRMVa/2kjlchHZxmyX0YZOIcO0W7gBfAYqj9SOAoWcuog/Iba4ckul+YdaClrp7hAGN6mzXiwuKJ5yqB4heNiwPoUt7zqGPTAmIZ0f3uMCioksNpPWE0InG49UPtgTyAbLIZ0zBk1G0aQKB/IKxr5DcqvG4boJFzom13M6bbDU377nofyhynmUBBNAn8WqsF5I/m6VUOeBzcoiwcQXqYue+N/vgJL4xab59elDxv7lni3Y+HBOdNdRtwPu1HHEDfEjwsE2/jBd5tSNZ5F3WczggTjdNINjRpLEvOXfQf8d+6+oNtcamwkyaaoNRxFDGq2lwa1eqdBnkSDhIl9XUEZDivChcO
X-OriginatorOrg: philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 12:27:59.5011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8870b3a4-210c-42ee-71da-08df40b8635c
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[3.248.88.141];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB404396

My patch sent on November 9 is visible in the lore archive, but I can’t find it in Patchwork. so do i need to resend?

Regards,
Vishal
