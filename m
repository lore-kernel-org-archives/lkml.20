Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794440381;
	b=FlCxZMXKWqDiSEZJDEjFNZUf6I8y/+8wNgFupWJudsn18Sxo1K/IfrvVw5+PVxmTR8Yx
	 7lOKYMdRBwf7CRuqwJn6AOdlycG4sD0//YPm9CyvLvvBS72mBHSgpynChVURSvJMFhjnl
	 m7bglZ17x7Crrj3GIDaPAo4pU+DLmb+SeqIkkOIdYSSJCQtHmVn41vis8GVCdDDzcguCw
	 NB/XXpQORhihEq/kETsEAOsZATVZ7FsW1L75uE76hbJOvOh+l7E7cjss16Qu1/djPaEoh
	 8okHBf3h7o/b/sJWQCQGCLXkSzT1HACz2NlLozigjb0dttdG/5Y03IAcyyRf1B86ndA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794440381;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qJZX89uARpguBIIPPYN5scMJxMooJXdSxLArk+dmic0=;
	b=bcGJ7LNJuYyBJZ/cXkOv84dxc+x+pOp0VD/XqvtD8MwLJ+B9uotUcFruI+Le509ACIsO
	 /xgSAqZkLxFfhnGmcDJrasqsKFP1yGV1JRKlqKKoF2HYVkqQE3F7kcCZi14iEoVy6LROc
	 NVeROyKf05qDSG5k0JrvdLXOHagLrCl1QEMXLDP+7lIecaYS/ObqIFrxBRDf3kKVMc6Wt
	 XFXWPernch24i+X6BiGScC68MJSKrSgmW/Y9994jbCQw0rvij1qEHOQmSVsfPHPbmHS1b
	 WtccAY4TnFNpDqdjCPU2QidKgNvlSxIpV2mfToke62NgU+QAlMRpUYr7ZBQ+SPr0EyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=Su8TW3Za;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=QE5sTn9x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC4C606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCC4C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=Su8TW3Za;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=QE5sTn9x
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ABNbwdv1589316;
	Wed, 11 Nov 2026 17:39:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=qJZX89uARpguBIIPPYN5scMJxMooJXdSxLArk+dmi
	c0=; b=Su8TW3Za/nq8eBU9UJlSa16xDBW1oFaKKpMfe5E2RYy5OgTzAD/KyhOlf
	WJlcO0LegUZlg9Fru4iiWSW2dMth+ORjeCxIbEXqV+oP/IzAtmQCJzwbBgf+oZ2l
	yr5STrt4UpHYDmD1RuZUrDbyYBWcru5DQEA8+Afb2mnMr+D1rYjqNwhrIyHHuIGg
	F3Z4GS9EAuiIME7IyHFmIfK4xTxld5sJDEdZ9rXWS333DQamCJHGyto30wKLQReR
	G2gr5mwQDwiWrGJF0eJGxJgC0YWRChDJwMUKEOzevXVTXSoOVcQG+REGkSXiDEkp
	fD1Ybfj7aldQGDpD/ny8P7eom9J+w==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010011.outbound.protection.outlook.com [52.101.85.11])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hveupxma1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 17:39:39 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbsxZQipoNyIHZ3dDdAXpGNO7nHjf0JnIAHW5vKKSGBmnaHAyb2D4sVmyHIeSndYa4dX3wcnVrgIAgubF//FFmbRcsaDVnMhqYhpWbQpLqyflB1o6cC8koNjasxFI3X/OJHR5KlGdzR5+7U7asl+Bg/F6swQMQfzS17lh5EkbnHvM6Y5cdguLjdVmx+Dvic4PCB33gpMR8PiMsywizsO65IV6m1HkbGuHYfdAadQ82DU9pKhBSlmane8pERDOVQwDc+3ABFYTB8xDC0WXhRujnLHBIODNaNMEz0XTbEAhDsZqRdY8CLnULOE8TNG90KD7KBB1CSY9sWR4akq55OGlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJZX89uARpguBIIPPYN5scMJxMooJXdSxLArk+dmic0=;
 b=by54N9VCDxtlcfi+ujL7h6FVfS7aSTvMCyHMe7nyrrsm5xwCEzIJES+cHnc8Nff13GwszZyIf4RkqbDdBEB21zDAdElyhCsexlf1+Yvv1aRo0axF2jJ5ZfANgemAuQXIH3kZVBbXpaHTdnjV86WZvZXk1lbLVjKu460sSZsObo0da1UOt2fU9YbBhn+Ue1fPk1UVGqCKz3HwNVOo4VZ4Td8trSagmJuOfNXdrCcV7DdAB2zKW232/TSnyX7d0Nm5u9yWHsz55wSmweeOVCGuL8X+hhW/AMcc16v/CFsOcdH+Q+z2tCLgmgd8uwNrfq5G2rdTP6Hub6iQTTcIdtFN7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJZX89uARpguBIIPPYN5scMJxMooJXdSxLArk+dmic0=;
 b=QE5sTn9x1AVUTFp0CyLFt+xd03InksuV3YliPyTBaiR6I8wz1tRNoi92jmH30y5OvBc5Tal40Ft137VxB3v6f0WZZuDh5qdyXFvvtJRbgPpUbA0YJyikfkaowFK12wb18eEn9sjS9BChJp4x3/TY4Fpwk/+mdy6t5ortWKtm/HI=
Received: from CH0PR03CA0099.namprd03.prod.outlook.com (2603:10b6:610:cd::14)
 by SJ0PR10MB5581.namprd10.prod.outlook.com (2603:10b6:a03:3d7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 23:39:36 +0000
Received: from BN7PEPF000000A9.namprd05.prod.outlook.com
 (2603:10b6:610:cd:cafe::64) by CH0PR03CA0099.outlook.office365.com
 (2603:10b6:610:cd::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 23:39:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN7PEPF000000A9.mail.protection.outlook.com (10.167.245.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 23:39:36 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 17:39:34 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 17:39:34 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 17:39:34 -0600
Received: from ula0226330.lan ([10.249.32.167])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABNdXT63883381;
	Wed, 11 Nov 2026 17:39:34 -0600
From: Andrew Davis <afd@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 2/2] regmap: Remove no longer needed help text
Date: Wed, 11 Nov 2026 17:39:33 -0600
Message-ID: <20261111233933.537905-2-afd@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111233933.537905-1-afd@ti.com>
References: <20261111233933.537905-1-afd@ti.com>
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
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A9:EE_|SJ0PR10MB5581:EE_
X-MS-Office365-Filtering-Correlation-Id: a5ad6907-4af3-4319-7e00-08df404d0bb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|82310400026|18002099003|22082099003|261009223027099003|56012099006|261028144727099003|10067099003|261022105027099003|261021123027099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	9VCW2KTC/Imx/tO07Bxr/Qtfyvsi/qEAIghIjYEf/0CG+5co1pet4bzP5rAhPdKInaRZcW/DIJeyM+l/tK5Xd3YLT3CLn73x/sGK39Kerp3r6pKi7WjLeFo86Gi5NdDGadBU550ksLNcy9eNXNOSoSKH93vBfd8+SYUyA7AoiVAqb+AYUpL/Tuep5hH0BbQyOf14Tx3OfytquGmS+BBkdZ7+jcJBlp3iTD6p0Odx+KXxZyZGZtOFpikRISbe5Fjn91mM9jpoRamRePslPamnak3Q1czZzHtD9vhGpk6wLSQzPhKixEWq82K+Ztv0RKyGZk6FJxsJzF987VpLHGiVQGyEeK9cjLO1JlXuP72NdIn0Glc7QTckG7T8KaNKB/xvX05GQi26PT6qZLk7LxGGGLmoYitFTxhsuAEP+Hv69ay5ynV2RMryBK2bKzJLcB9jEMjfbVXrI8rEZRDrQn1fOaGFMLuCMw2l3gfOGffE545N3YF5BHBGbnWjaR+3Zs7dGdvaH/gSyrJ6CQKykZhKuf2fwUGxa1w1aJKyeSgX1zygiauRb6NY/B1QACbWL8mdHlUsI1ZShDXNkMK3p+Qm1B9OTascfImWFAPvmRVj6WTSqOlNZZmW62EJLNBxDouJmSxqMzEKTrwCZj2tdRlk3CJuRjL1hOOeO0cDDP8qynkTQuRH4TRUhsk7El7u6y7E/SDtP7dPxWp7tOSYyO4jcw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(18002099003)(22082099003)(261009223027099003)(56012099006)(261028144727099003)(10067099003)(261022105027099003)(261021123027099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	czGuBu94eH3hUZYDSgNsOz+1iptdRkDpsvxg9w9w0j9iH5IY2OET2e6ACrsztQ6GFAgh/jK4EA0o4mehDdoQi9KYMFcGLtKcEbBHP37kday0cut2NWgGyAthFLZP4VW46Y5Y3fhUTIPpbSOVwuGGOK41mAH8hIo6g5BNtKliVgJvN3gkrateu3OmLUNKSjQBn8zuYX6ovbkbjt0KhQgesl5Aa1yYYfKI/EQDlMlWtGd1kQEp6Un9eIwy+YOQxTsJ7UuCIlMASJaYh4JNz38OI39Jz0FrLmsg5bI7dbPicj/00H2oKrVXgT2iJALbGzGsZFRk6h8zUWhR1TLuxTxFhzxqCzU+w9sB7ZzZYJTBidhr62oY0vCxUpikSmQd5kTvq3JtVHyFns/gnSEoNA0GmLyHz5N3VyVZbT7bhCPibhvqJTu+Pb93PVwrAgMpk8Ha
X-Exchange-RoutingPolicyChecked:
	5v0jEvaX6z3E/u899mYdVtFGu+itdHxycFTC5IGypBEKN4gKGp17qdV+Mjca2Ac9nW0aioLvs3zRhftzmbzwW3R9h88nDCkdSVDoZ5EmQ3iL0wx/d/Tna6QC9NF+WP7AWxNW9qXXOF9ld87CRmUdaHFYbRZWiYC/uj+uTYSxjK0p1JVgECOuy4ZSLNWa5EJBQfviWDik+EKkJU3JPVsxkFaExWfOlGoJvFNX3J+H/6NTwJsWnW1RfmEBz/OjG3mLf3zGnTikTX2vaTCetxl4vC+xSyEDPqNaTWHTXXH9rPwmTZ7WpSTEHHLnBDtKMxE7VwMrcIs8+TlwDmww6L2YfQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 23:39:36.1736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ad6907-4af3-4319-7e00-08df404d0bb3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5581
X-Authority-Analysis: v=2.4 cv=KeRHIgYD c=1 sm=1 tr=0 ts=6af4fcbb cx=c_pps
 a=IaRwrOchHg7qSZqgGdB+Bg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=wBLsl2hgkJx0cifC6EMA:9
 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: LcS5ZaBp2X02UZQZPpaBiE_kVyVtcY-t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA5NCBTYWx0ZWRfXwKOAUt8a/2oG
 lQ5W2fwMAEuVGhWSjR/kZXkrzPZ5+3sP8aYwOquOl8SrfilMHUpJL9k+rW+DcAM6ZtkzIU1+kxW
 QxK9WrAkHk1gOxDjSuM2CBcqjGAzZV/cEwMWtKPuwJKZEDzEYtyzLTo5vUVKLjw1D29r+8uJBQn
 1ZrAK9C1rHgd/C7anY7yYeHnYHkZAb7ThZmdIrYcdZ5FPWo5hUNpmbN5pd/kSU/pQptPiSjYVKS
 d5yHyMPaZDUN8xOWV4HED4lN3G4t0LFhSYvm53pwPliQ6HjhGgt2guuG9LHi+B8g53JiAd1KJ6J
 JHyWJDr7LSZAlJPM7Vv/RfTqkeFsWBTTGQyXFwMXnApx88Qi50w1yUvdgbMtaRGsxGxeY7L6gSt
 q/aD+Nx1NU3denmAIqw4aF+L3K125NVLsPtLp9RfSsguTISrPCYRgORdeHGj3mj6MAFIKWKzx26
 vmqpvs7NBr64oGidYCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA5NCBTYWx0ZWRfXwNRaa7Z3xheV
 j+qMpON03i7HOQonQZiQAt/MGyMXVe3ph+FYgiqd0cnk+KvYBfimU/Oo+UvvtM8xhOynfJ+XMgl
 f9RjJFuSyk9AXQ86193ikNqZ5m06ECo=
X-Proofpoint-GUID: LcS5ZaBp2X02UZQZPpaBiE_kVyVtcY-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110094

User help text was added when this symbol got a user selection string,
that string was since removed but the help text was not. Do that here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/base/regmap/Kconfig | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/base/regmap/Kconfig b/drivers/base/regmap/Kconfig
index ef5fdd1ed6c7e..a26bd6ce00de5 100644
--- a/drivers/base/regmap/Kconfig
+++ b/drivers/base/regmap/Kconfig
@@ -5,14 +5,6 @@
 
 config REGMAP
 	bool
-	help
-	  Enable support for the Register Map (regmap) access API.
-
-	  Usually, this option is automatically selected when needed.
-	  However, you may want to enable it manually for running the regmap
-	  KUnit tests.
-
-	  If unsure, say N.
 
 config REGMAP_KUNIT
 	tristate "KUnit tests for regmap"
-- 
2.43.0

