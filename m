Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793380290;
	b=QBzkGGaaYlAHXyQwDKoHpie0lgXw/Puaw7x6TOYh4JNolg97G9ENcvWgL0zE9vCT3z1O
	 6kSETmaCD/eCkMrW5YMhqGbqlSDd5ejCFBqWtYiXDc4MAXZ9Oh+V5UCItv/VQ7wbmCERc
	 FLp4qgw2XiIToWnvK6r87yTBCsj1S9SIXK32rUSllwV1k0oSZAtXGwVsdFah3Y1eHCAI0
	 lxHu8Jv07pp35fUsbOqG+OUJEndt9KtwCeCoQbqJWxahFtzX6ksMqyKglhkokTLUmGi8d
	 /4nLVbPgDUTI2VOfWYWGdGzsBNnwz0SkZHePg2ZZUA3NH1d246xs9KJZrvxFeHGwo4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380290;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=mz0dwIviKspaHs1LpBo3afVuLrHpywGGv83Wivctk3s=;
	b=BonSClCGL369ePeNjeIqlIq+LEbm5p86rp35o2L3d2zwnjnOXhBo8algG7w/i7Ebaf67
	 hbBB00AIeCiS+wUpxrwiopm4ELJC6zKBRYU2ab9WqqE+KePbT9jXcL1Nxk1lWL9v3qcSf
	 vVUODJx6Vno5U6za1pUw7LNYrLkBmTJY2sI8Z9QIJ3OzgOSG4jxEl+cBSOUaTgSQDvlhl
	 43Q1tKoupJhhVw6xO5t05ZAnDmwjKj+un+cZyORVhu+CKByLY4cHhTZDtfePE8Ne+OAlZ
	 p0jXvnAdifLn2dfVOX1IdPBBNCujUg5pUcGqlMaO7YK4xZC2tb1fonna4M80Z0WR6hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Gplq2CAx;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=RO3RXOtL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AE3606A322;
	Fri, 30 Oct 2026 17:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9AE3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Gplq2CAx;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=RO3RXOtL
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UGmdJZ596469;
	Fri, 30 Oct 2026 12:11:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=mz0dwIviKspaHs1L
	pBo3afVuLrHpywGGv83Wivctk3s=; b=Gplq2CAxomu3eD1fswXU4Az0MW8XJQzH
	04iHT3V6LDoL1d+nB6hvqgasa3xTa10jbNiMx1zdlWMVpv5BKImQrfDfe82NHRgQ
	rsMDmdl6oqrtKWipSNhRhT2IJdOcP7siuUlLUjG+KrWlZEyXaQzM3D1PSsf++kAj
	t8i8QjROgvOKCd++TdQ+6lUd4gJcEfgQ5CQv3FMyg2LXe3WNSruCmv9AM488w2jN
	P/bMbZcNYgpycDab5/LwMwK3aI/eOTwW5FuBuhlcntT7pjE1A0ToVwHm+jCtIRm9
	U6x6pyD3XxP4zRx+qPFOqERbXuPuzu+TUknyLn4INgfj6A9jiHqsIg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020135.outbound.protection.outlook.com [52.101.56.135])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hme6ns4x0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 12:11:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIENtBT7Dj18Ar+EzAHDc3hfgJb+WmJUQOlFtJIaiVBYb7FnkhMFQdh/pyic4F+pvJuO5yp3hMAaQrt/zzcXPChf8XLFymt8INmKhfmPI+Z7pFUrOpyRu8sEgvxYxb/in+YdINiIFDEYD+gJbJup10SGjVezEkcxdF9a34dvVfzkQw3YVeY2sgjeICUM1FsPjU9zyMfxK7MJpMCguvDwOC+3oAu4HjUG8lN9euWDkBRuqV51ecF14A4ZlUPDm7Ravui7Syq8w2l+ligRuJv+DLSMKRmzo597TjjNJmf6GQ+diVthD6O+Y87DrTz2rPiKu6V0TThBxwkSZ/PlKgl+GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mz0dwIviKspaHs1LpBo3afVuLrHpywGGv83Wivctk3s=;
 b=PScEev2a8Jlh7uaHTBKm59hi++LLRlLdurHg9HLZ9y4hR9tapgeZCX0kbXQbjeg7m8wCT8veyhwZSU7vlQIcFakZLFRtgQhOuCm8rKRuo1iWnPoSji/T3TPuPFltOypStcqnfTed+k6F5r9+CUGuD6RtD1rex+JUGJYdMjhtF4X53GuYZ3+35zLb7uEcbHI0JtORhP8fRHnJ08YraiUNY+ixCGUsTY9PljQrgFMQ5K6hlMS1Xpv+NfHIDcYsTZMGICc7Y95WRSI8wyDBTeYxvbhUC6A1yYLNWHTdA+t2CN9lCzuivejVXff7Psofne+cIeKhRJ/fKq4BCEcYiPjWlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mz0dwIviKspaHs1LpBo3afVuLrHpywGGv83Wivctk3s=;
 b=RO3RXOtLkvD/mLGj3sRket79x6aKeVLRusJZUS8aBATtBW0i0Bi8kyVSzzDeIPyvmMpr9kfWpXBDZypQMysmIozE6TSzE/hB/aUMKpl+RmqPWxagAIsWOSHu6T6G0T3uO3Pzsd1DtcLakEU5rD9kr8kq3ocFNYgucP9ondKPACc=
Received: from CH0PR13CA0001.namprd13.prod.outlook.com (2603:10b6:610:b1::6)
 by MW4PR19MB7006.namprd19.prod.outlook.com (2603:10b6:303:225::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 17:11:03 +0000
Received: from BN3PEPF00022BBE.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::56) by CH0PR13CA0001.outlook.office365.com
 (2603:10b6:610:b1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5 via Frontend Transport; Fri, 30
 Oct 2026 17:11:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF00022BBE.mail.protection.outlook.com (10.167.248.119) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Fri, 30 Oct 2026 17:11:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6570D406544;
	Fri, 30 Oct 2026 17:11:01 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 327A5822561;
	Fri, 30 Oct 2026 17:11:01 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 0/2] Add common wait_for_boot and reset_and_boot apis for cs35l41 drivers
Date: Fri, 30 Oct 2026 17:10:13 +0000
Message-ID: <20261030171045.469944-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBE:EE_|MW4PR19MB7006:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7cb53241-f235-47e1-4422-08df36a8c6b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|23010399003|82310400026|36860700016|11063799006|56012099006|261009223027099003|261026140227099003|261026130827099003|261026121527099003|261021123027099003|261021135927099003|261022105027099003|261021130227099003|261022113327099003|261022115727099003|261022075727099003|261028144727099003|261021121427099003|10067099003|16102099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	OdHsyRIC8dAgvYILrubhvCw+71iupqddhiEjJJi494JmRn9so29xN6+0ChrPEa4DEzvXRnH1r72MIjiAy2n0/5BPWFfT+nCUC7Z6JdUOMrbX2v3JxolXrRd2vb4U1E0rPtug5VAjyeLzb+ULpFQ8kcaWTDTK7V/OJfCbVaWJStCTrK5W3hB9KrRsTMLYz6a4xmdeR6Kkwarq4Zppo0pmyqzNUElZcMdShsuA5fdy8uLzWUC4hi69wrz5nsslw1mSI43JRfBkZsAp/5OvM6H07f2Md0ymMWsibe0s+FbsFs36i2nz7Ft4A9l5y7bG0THdoSsjlFDo+H6jpDppUvA7BkCd6YvLe5n0Ro9myi9NbfEmkBcTmX8gFJoz47yWGgoGveCo+TaznV24ZxOxZXmG/dKkanfLdXbBPUxY3z5smmm68i4DnzdYxfo+N0hIouS/CQf0nPUgVvHAJspXhuPyM4R/SHUMt/mj9X0fVDrDz+Pqhin/O2kVt1wHFmVg7tliur34mZRoiXHECVgnuD84DxKnxNdslPWJZe8SwC0vgZlCCWBjrp0gXQk2wiv7bcef16azXZxLnH/Qh7iB5fqs1n5YqueoyUHiRJa3tneodWu4V6f2FUDegL4WeheFt1DHtLAulEnWlEVrSt6vO9BLZK1emmKgOS1lErViQrpHPOtCCnGn7EMVRomVNq1srcLi5TVamccldGz683MpYk5Ikg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(23010399003)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261026130827099003)(261026121527099003)(261021123027099003)(261021135927099003)(261022105027099003)(261021130227099003)(261022113327099003)(261022115727099003)(261022075727099003)(261028144727099003)(261021121427099003)(10067099003)(16102099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EfAQrqn/ZNLcxVHjvPMFbK4idfNKpw8gl8XdSgBKYQvQae7hvzlrct/sDkUK7pWN6OQJK2odiWwUcFLTht5NAxf091Qw3BP7bsFwns/FzAqkGIPYAyZ2IBBvofCoSP6gjs12mD98Bs/aHxGAKGk9ByeytPi7MN2DzeBfE8+FY4V1zewaPXdZE9hqfBSKaQfVtZUsMq/aIiCHvC9HNYTb5nRCGAC0lKwdjnWcWz5JlDevDt0ND1+Lo+Kq/kbJx4vPw/YSJo9wXAC0FLbfgG+qAwXvQbgIK6zxlaCyyowjAyvvB2ji7m9VExoKA3U5NcQSnYP9ocr3QrGB/JswJWE+Lj3FMZOGKljHykgxZRBA8z6SPd3ieFDdzauxPivx6FV2WtX4/dJMGDIo986V30rXfsfWBr2DFZ0Z0Da+oQm67gpCOGhhGMqasmaEGLmgcaXA
X-Exchange-RoutingPolicyChecked:
	SAd4R8EIieu+REiU4KrzHpkZGW6xz93EiO0TY2eOVBwBifdayUNiyUJGySzcy7Ri4Lcj8+GNuDN/PenEYzH07CqLT0oRBcW/CbqYuPToPp5U5RSMTzRfKmogxF+YdTNmWqx1wznNOtkbFfgJGWr18moy6r+QITW8nhU8KPTiBDydgVTPVViKVeBcKBZ/th4XJx5L4n+bcEL+5Ynl/VfEQHGc0j/L3O00aDGXtHiUr1HQX3sjtY0yRZa288qPt6zgvKywJ1kQm7JghMTF9UjAFuatj2CgtxpU4daZw/wa/WvX7D0YhYDPUJCzLfzYSzzQvibk4KS0x2v4EIGqhMQ98Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 17:11:02.3796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb53241-f235-47e1-4422-08df36a8c6b3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB7006
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX+IsEz4d0HLKG
 GvfNjV6MxKyZHck6Jc6lDaHuct/SWSkswGwGKMpQeiOokejlQyqhMu2H/Ds8QHp8I26tco5xGng
 alu6SLWBZLVzTp8vzzTip1yB0q0SbgQ=
X-Authority-Analysis: v=2.4 cv=PdhqFShd c=1 sm=1 tr=0 ts=6ae4cfad cx=c_pps
 a=7RdxWpphQ0FXUQ9+5PcytA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=ZpG7LLT6W86-ljkCTnUA:9
X-Proofpoint-ORIG-GUID: AcACc2eW43fi0WeTCz5He3INsoD6vcDp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX7MfofhbfqXEY
 Nnp8n4YoMbFYaExEWPSYBWH44ZpqvW+8P0hrfPxtn0W+DlI7CPk7ufvZEIGSgkwlSsA4+8SKeRI
 tSXSYlGX/kEKSXtooTJYFwOTdw+X8i3IjD/GcNwZflU+jKeBOR3DPr077Mhe3IWOa3Y8e1nF/9p
 ecBURL+C/2lgYGsltoKSbmsNXpZZDbQn8tjwsCrsWHnBpMuzLdcCUEMjJnWnrMyMIaXPYubPi8V
 Z8fpmXjE2w/AYTyXRE4ylVlxHm9yZ3UVvz3j/DDkWMzKM/xbUaep8PpEqGFuuz9LWc7BK9ZOeFO
 X2KBJO3J/TMY4GoyGq2O/pM9P2CMeKMFr+sMNAP0Yh1dZMlvL8MpoF6D9Km0djCFjVFHEKfn14b
 NU0opyPVSLUFq+g5kD3JV5ez/vLOV+tJWRqxwQdr3jvvdZnHfYm5v4iPtsB9Tn12n+avfaaVDmk
 81pvAW2R4fE0h2nwN2g==
X-Proofpoint-GUID: AcACc2eW43fi0WeTCz5He3INsoD6vcDp
X-Proofpoint-Spam-Reason: safe

Both HDA and ASoC CS35L41 drivers use a similar meachnism for waiting
for the chip to boot: regmap_read_poll_timeout().
However, this method can break if the macro returns early if a
regmap_read() call fails.
Replace this macro with a loop which does not break on regmap_read()
failure.

In addition, ensure the software reset prior to boot does not fail,
and ensure it is additionally run in the ASoC driver.

Stefan Binding (2):
  ALSA: hda: cs35l41: Add common wait_for_boot api and reset_and_boot
    api
  ASoC: cs35l41: Use common wait_for_boot and reset_and_boot apis

 include/sound/cs35l41.h                    |  2 +
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 33 +----------
 sound/soc/codecs/cs35l41-lib.c             | 67 ++++++++++++++++++++++
 sound/soc/codecs/cs35l41.c                 | 18 +-----
 4 files changed, 74 insertions(+), 46 deletions(-)

-- 
2.43.0

