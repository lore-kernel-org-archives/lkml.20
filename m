Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794594994;
	b=nfVcAY92BIdzYGpI+i4iB2rJn6NttDv7C7N6zldfeJHCjNiYSR8E1ajvu0+UILejwfjx
	 sI2FvX1851uU3MqpmE1ErvLogR1LCWhMRIE/mKyEpdRJhLdLHxqMsF1Jhw9xZInOcpYjf
	 3gc292fxVs1Dk+pRyDvJUX7na+YcZd8OVieoA4ByR2cj+t34hmO6nNkC3Zi3WesXVyqab
	 m4i9yxCy7J3hqQj4jGtYhc37eMTchSHjjJYsEb0vO9lw0dBft1qQTkAeulUKKxRFZs6ST
	 P75msUvIwYGQDLvrxznvRVRWUTrMwsNPlkqx7N77Qic1d1fMZHNUq5pFCsbwrvWVuDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594994;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Reason;
	bh=TkRXQjaceXtBdSL1xqrTOUvVdKWtE/5wcx/in94dDTo=;
	b=J5s/UXWT2335zwVkuLePKuYtFMPd2TPqTbA+woeFNhcQbjSEqeIAOEDDes+mmayEzVYQ
	 1a74d1dPF7mEHVX24SrtM41SM+WwzPiktXxRNEIMzwbYBI5JtVuaHmKgwDKpK5h0alz+b
	 9LjnKLz7OZTZcyH5gyF1MaOiO1L9XJZxC6I6oDCTLEG94IKi7IGebptWuAY04YIM9W5Vw
	 uUtcEzJhCteSyzCt5dF6/zwMmFR08ys5XzK6ijHDo/zZdmOfm8wP2OV4TuCehNmc/glus
	 k7dlCYDF+zAJmkIS4sEnQkP+EKVChtC9NI0XD8AhBuC67MSdtYllFGPCtXmfl9BsSJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ZlEI+qpY;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=KL5kxMgx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D48606A88B;
	Fri, 13 Nov 2026 18:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41D48606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ZlEI+qpY;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=KL5kxMgx
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADGQ8Ew3659861;
	Fri, 13 Nov 2026 12:36:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=TkRXQjaceXtBdSL1xq
	rTOUvVdKWtE/5wcx/in94dDTo=; b=ZlEI+qpYxOvzPfyvP5BiVXDNjS/Bjs6f/8
	TZVzV9ECxRAwVzA40XDqxO5ZTdOP1ZrYjnNml25/UhUTWUmKYJjiEoAYA/txPyLb
	BEIfmaWt5+omWl3aPui5TCm2PP7RTj1tVewFSiXg1cBzGe1pzCrt9h1uYNTJ4nB7
	nUUkyrlvP2tcfFbMyaOWOi+XWyWbPN0KURM5P6MzRo2JDn5Au+eIVTkUbGmz82Xu
	i0nx+ErFu65BKyAJvrvhe5EggU5wfkpHKfVAwRAlDpACnZ3U59Ih1+lun4o9m2Hu
	u25jgOHQGnNoHY1UDYM69qMoDsmg6c4ZqZF1gGbRtzfeMTnsqWnw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020134.outbound.protection.outlook.com [52.101.193.134])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hx4h5rdmt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 12:36:24 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idognVcs4LwqT427Nt9S454uA8LBYLwCIB0VlQpEmjt6fEhf3+JIw8PoZmbnVnHwlKR6hxGxfHWOC4eS9HUbMmON9ZRyvwtOHNaAzIFPnLHggTreoWvm91NrbuE7V2mNhkix4IgC3dV8ENqcFmhAULqzgTPO9e/X5jxwiql9MFIk2ItuWNX34IJIIM9Op2W3aFEL8qaj6OhTP6x47TD6/xEKb3sKnADtiZNKJT4+hsCuSq1piQxX4uduWgEh+GyprQTmZ7kX2pHu4nVXdpAWlz/VLyQltvxLFsJ2k6YxKVNNUoNMdXokQJrv5wkf92WFuq5ju1NYdtsGB3Vqa68mdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkRXQjaceXtBdSL1xqrTOUvVdKWtE/5wcx/in94dDTo=;
 b=J/oKzSZXodsDtYBEtR0bMoRLihG5c7RAggTOfM3KavJhOW+8CCPnA1Zb+EK/SVx0BcdRll9++clI/7RX2QH/dw34pJWeycEcZN1PMkXcrC0A/0DEEPXP/KtrCPiECv+1uQZZZ+4XnQ4IxXEajwMZxL+sDnzJSz8eBsYB+AQqyXx3fOrH/G4ol9xTrw3HZEAF8x9XeZBfj9BvkrWBtmaqPXTffoLcAz8dAt37Jy9W65WNYR9UJxuFaV828+syaegopl/XKM+Oe3wjTFpjoGnVG5TKXIhbVFQBzs42smByL7kQ7CByh5Jk2Ries9k9qzX3K7KYwXszaZ07tqdSekEtfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkRXQjaceXtBdSL1xqrTOUvVdKWtE/5wcx/in94dDTo=;
 b=KL5kxMgxniWlOCeQbtzE8C/joshTRC+jAOqrqaibUjFiYPxC/fBR8GMc1NUQpeJnJHeAksckpVXU5JwPe/kGCuakbRcua1r1db3lktLBISOeqHYpAqSc0KR1iS/e2yJqsHlo6IKtCOLZw3XV3OttNqJnDdnKE9DyypuRFGdWYKM=
Received: from CH0PR04CA0042.namprd04.prod.outlook.com (2603:10b6:610:77::17)
 by SA0PR19MB4272.namprd19.prod.outlook.com (2603:10b6:806:81::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Fri, 13 Nov
 2026 17:00:59 +0000
Received: from CH2PEPF000166C2.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::31) by CH0PR04CA0042.outlook.office365.com
 (2603:10b6:610:77::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Fri,
 13 Nov 2026 17:00:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF000166C2.mail.protection.outlook.com (10.167.244.228) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Fri, 13 Nov 2026 17:00:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C83C1406555;
	Fri, 13 Nov 2026 17:00:52 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B3BA6820273;
	Fri, 13 Nov 2026 17:00:52 +0000 (UTC)
Date: Fri, 13 Nov 2026 17:00:51 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/10] soundwire: stream: Clean up allocated runtime
 resources on config failure
Message-ID: <avdCQwQh8Sf6q9We@opensource.cirrus.com>
References: <20261103095445.81414-1-lee@kernel.org>
 <20261103095445.81414-5-lee@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103095445.81414-5-lee@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166C2:EE_|SA0PR19MB4272:EE_
X-MS-Office365-Filtering-Correlation-Id: be2a9639-58e0-4f93-ef54-08df41a7afda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|82310400026|376014|36860700016|61400799027|23010399003|18002099003|16102099003|22082099003|6133799003|10067099003|13003099007|56012099006|4143699003|11063799006|261102123227099003|261022105027099003|261022075727099003|261009223027099003|261026140227099003|261021121427099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
 RH90geo2X3huSy5AmnKExKCbBX5X4cRHYBHiYmOXdd1sPKk4G/ZUbAI214IrY6tLFMMsnajbQIrH1lU1yTTZ2vrGTmHUEHDDq+zVSBiWMes5mqn99wmIFB+QiwCsPTF4oCHyomuMAFvUX/2w+BNscC5PiHB/oYIHqPxwo+6i3WyKlaMlXFKndYglsWU16CX5fKvtT7zny6A9dWKkDAviFpzRQE/I4u2RgiVfaKzsMMR6yZsI+VKyZe9BzQHlovW0R4YOXweH02q3wy25RF8/2LSXmU50IMc9R2yDRTf7M9a5YGDjkolPHmMv6uDlGE4WgRMf6zcCdcG55CdNRMN7eAjqRywx4pPZA5aLwixmc9z+PyJtIgY9gq461GCM8W8iEufj0Ut9hAwh1nnVYmRigggJt/ISGzrKGSsGLHuriUUYmcs7ZbMIQZqs10T6ZTW2zTI/oI7HQD1/h6J9T+2fSXRWntSFcR4JOthN5oh1IDxWBpdCi4aW0b1cO6e9J/Kggsm7TssfJqryla5UAh8gEjthfXJlCNlckTzgNpEJVGw2Vc8DlRctczVLG2cNVLeL0NQrPzFEsV+/FoaHnt+Dw6xq3zpLuU7vXZz5yofVzYrIzj0h0Y+H8EoHJKQ00r/xqnlhQ3VA43xhVNfpDqDygQ==
X-Forefront-Antispam-Report:
 CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(61400799027)(23010399003)(18002099003)(16102099003)(22082099003)(6133799003)(10067099003)(13003099007)(56012099006)(4143699003)(11063799006)(261102123227099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026140227099003)(261021121427099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 eM56oqFVBzDjV/wAdECpHBFwTTj79bYl5sej3CrnP3P1a0g5X4xYPfi4ansvdOrOjUbIGouF1aiFRKGhBs3i0G+0uvBU5d2IYnx/JJOPWJauvg1L/oASq0xAU+peTub2CGZrFVfHrS+IqjhPVGghbP38hOpgucuBhMZrNXrblx4ilyVFgR21izwBmkVJ8fiCZWya4mwCZ/WiPLqe0gpZN8Wpu2LnjHb4VhzE+FlUE0ZF9c7ASh3yAyGlw+R8XbBOWHW84z0/UXDdx0NWh9jkqN6YBnL9YNj0RKknvZJYKGBIEVXWhDwJxnF9ffKb2hRXeFg6WBrzw1sfLeYQjOj4m/rVe4S9rbNTmPUM4HFLVzVEcx36C5/TMTRxzEFwvSylupBuu85CvaPjBRL9jzl3KkGi/6JsP64qPyq39WJoIvn/Z5CZsGrKTLl926f3GAKg
X-Exchange-RoutingPolicyChecked:
 oyj7F07ZbPAlY2NhO9NCpSeof0sZf5huvxDAbns7Fan31gEHOTlvx1qtmoZfi275kGnEnWlOGTklK/zng9H2/r8VF8eCcVPv7wYW6Xqt4dEkXAadyWiPpUxpQCixjNKmMXuXQ9EnUt/EJpI2VxHgtogVozMWUL1Ao8DmNLYSTp3S9uz73weIUiXE/dd6+6QgWiFwVM0Ddf4TM/VOZCsHIDah1iim1zS4wWAL1zgmz2VVQ+lAOLMYwKQmlCciAz00EKYhWzVlVxikc5e/Ze/9xJrfuL0yFnKKig8h/N3Si5e9Ui5vqNCYEkWZxM4tCzC9H17WOW4NTVT3jJYnUSBSpw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 17:00:56.3887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be2a9639-58e0-4f93-ef54-08df41a7afda
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF000166C2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4272
X-Proofpoint-GUID: LjdTawFGcc9sKjEke98VXDjMXjYQrAv5
X-Proofpoint-ORIG-GUID: LjdTawFGcc9sKjEke98VXDjMXjYQrAv5
X-Authority-Analysis: v=2.4 cv=feo4WEQF c=1 sm=1 tr=0 ts=6af758a8 cx=c_pps
 a=Z/t8MQXuUKLmKunBt3LJ5A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=futKbDvDrAso0Xm9ZjkA:9
 a=CjuIK1q_8ugA:10 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NCBTYWx0ZWRfX3QqmjS4ClIsu
 jaaYhAn2XpjIBpZd7BnvCg6SWVBsTAcTtpXwpUNXRcwHY/f9f5Mtr3nlAhCXGwPSgou27eFCEyE
 FTSyunJ7g4ybGhwxBHC/XMSTmIN7W1s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NCBTYWx0ZWRfX9gSkAMtQC5Yd
 GkIGOerYstwrnr5iUDS/qpCR+TU05AFVa3799fvZvVKEzryRCnK9jW4ZLHWIGBZOjhGCV4vDhAf
 DvoEEV5ACmA9Fkhw9HV8f5D+GEcJl6BRoxYOv7OpKgG9KVSfIheXR8Uazwh5T5nGLdtTcXhyM4d
 a8M3ShryEYAxzS7Hz3Bv7fE4VOTYkxsxc9kzwUCVNQsE/CruVHm57Jlnwtx77NZDlV4jt6iKeCZ
 qCrrZquvjH8+gkWHaT9mxQW+rNt11/bqLuNCmeGW/WWOmTbBA9LPoR/dT3anWXGvTEWE4EyyVLH
 ComHR7L9+0facv3qIq9f0ddO0hoAoplWCBxk2bhZvp3g24hRvHIOWR11dp6gKsZFU8SZP9mu4y0
 NLwhEXIigdWPezINbrtkGRqEhlo6Fj1ftp9LmO7lYL7f38maGOeh6BbegS/JAwgAGtgTW5P1src
 WNeijhwuyQarUu4vt6Q==
X-Proofpoint-Spam-Reason: safe

On Tue, Nov 03, 2026 at 09:53:48AM +0000, Lee Jones wrote:
> In sdw_stream_add_master() and sdw_stream_add_slave(), failures during
> runtime or port configuration jump directly to the unlock label,
> bypassing alloc_error and leaving newly allocated master/slave runtime
> and port structures attached to the stream and bus lists.
> 
> Track whether ports were newly allocated in the current invocation and
> route configuration failures through alloc_error so all resources
> allocated by the failing call are released.
> 
> Closes: https://sashiko.dev/#/bug/linux-546e137d-6e4d-4f22-99c3-8ccc8beb5350
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
