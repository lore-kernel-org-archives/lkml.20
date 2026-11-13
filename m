Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794588335;
	b=pNVrJ9oLqTVzeaY6dwAOJ7Ec7mpHhfDEL3i/mp/8a/IJnz9U/QoaNpIbJQMA2EUT04MS
	 y0BzSHzCnXpcpp44SELVjYg3nEXHPFwHOTu6n/VchIBEWskT8gbF5t+by+llOAt8myg/u
	 c/jJNWktXR9sU5p/CGE7iTbV5leMQSU/DhdsRREcOn0zkK/PV5ncsFGIAogob8+hwDIWF
	 Cdzi2mc8FF7E+3vkG9lJPJ8YvXPe9w9I9EahwugCc0xWNFD9Jb86PaRErNrOeLtG4xByJ
	 fF/dfQj3WkhLDGh3dSAGTD4umZympRJ78vF8qf1/miC2hv8f5tcgrU8u4o2cGMtjb8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588335;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=rH5bPtSbksTN+zmT2RR5b7QQZ7ZMtP1qgZ869g2A94U=;
	b=RpDiur+vUqRKdLsr0cfHxXvgSf5EQsM4op7Y9yOglfEeMlL/VwBMHIuVF7bWi/1HeqG/
	 9KePKBohjARumFeTYDOJOFc8CjT69yjdhFlX3O+njNETVXSw8xz49QifHj6zepy5iCTlV
	 1XVbjedJtmyOeDHicQkgACQNVd2bAbtAMijiZu8N1tgAcA4bG7AQX0CYqQlz/2Ype47EZ
	 7reMG8Y+S4uznC5p7uavkzd7tt2VX8sLFDGoKvG35aPFDwuhgcXexfq+2XbTHVuGoIr9M
	 6E5KfbfXvWESSC0Orum9A50/nj03GMZ3jBQxdLPJYHeBHWMMi0MKDsqivZw5wGiyJqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Z2H+YZ4s;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=XbIZHRGg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6D5606E209;
	Fri, 13 Nov 2026 16:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE6D5606E209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Z2H+YZ4s;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=XbIZHRGg
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADGcgAw665838;
	Fri, 13 Nov 2026 10:45:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=rH5bPtSbksTN+zmT2R
	R5b7QQZ7ZMtP1qgZ869g2A94U=; b=Z2H+YZ4skycbidfml9kC9h4uzyY2Vy3ylV
	a7NYota+r5gt5dsOkpKAgeSJcPWpEnPkD8B4fIAbBoxJ0ufR91AGA9Wv3FR9UeFb
	mI8ok+Utq1MIVA8SrtcCefs81gidN+DGxPzgjQOY0uezy9QSNAywnRE1KzdfEZVo
	TZ5tWDdp7VHuXFJKWOxojwSmyVYIEpsDQINDWp/Ylj3OaHtq3lERfr6aCYzO01Xw
	HVyjblt4eFftyX5m8oUDwycNKJ5mZ4GeGDuQAmbqqCNR+bHYG+cjPd4T44ttT6sT
	o0ODoV98BOX84gP9mkf7GaszFJGTN58EZaR5BIRUgP3E1tsJ3PsQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020136.outbound.protection.outlook.com [52.101.56.136])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hwcfpj5q2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 10:45:20 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDOqp2as2StG2H5c1PQKEk6Qgqe/kunLVu3kTkE3AzcSGS/Rdlk95/kRwWx1ik4B/7teN116pyRyodEMEQdalJDetGSgmGlGdw0ItjvE14RK+BkkFENp6e83vJRREnkMJVq/ldOX/fmDRiJDjMOvCdfDkv7QD8x5+6xdxJ/k7duRys+ItCzmLZ2Ka7Ve/a+nZiRa/vjnqJDIjlDA1axFinw5iUDkTX+XqbdF930PtzRALcc7SvPh8w/SqdUulOGxcdLTxsyWx9HOjIo8BycNsp6CDhLeZFQmuZBk02hx75/Xdy9bRslf73XL5AxUTitpQne9vKeAgBWsoqV4AWtLRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rH5bPtSbksTN+zmT2RR5b7QQZ7ZMtP1qgZ869g2A94U=;
 b=sUO5ZJ13nuMSR33mB7C5RT7oLmkZjqsb0nuG0G+chqt2RH1KNCtteManhwhepT/Iw83ub9OgTb3Z6ih6OOr4nfdzU9SDKIewYTWVC/E43lhtJHrSoQHFOn2zRT/8P5Z53VU+5D+WOLCgrXtOEdcIF+F6AZY9/968npOMjgzYbgGrktJ/ql78CNONG21c1sfEMl4cuafw1PvUGyGVD4MmGj1GhBhlaZ9NmkXVG6rHiW+X5Vp/Lg1LJlSgsIoC8Szi5Fh2+XBMmZpz1aB0OukASTDDK+Mj/pNE4payWM9w00tLnvu50WIfB5AHoOpeYB1L1HU+RUymgszQHptaqg/s2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rH5bPtSbksTN+zmT2RR5b7QQZ7ZMtP1qgZ869g2A94U=;
 b=XbIZHRGgwKqeyfzHmlKoSZKv+gHxCxZy7Ik/mPHsyGAtHRr6wZw6s+p1vyR9g0v23a3bQJg68AzTgu1gslpjBjA6TzSbVJHnfbk0O/cX3oqgD3bAkTF6NH7TsZt2sEIlELZh+sPO2UE+I1k72fyDjhUlZoRHna2pRu1v24kWUA8=
Received: from CY5PR15CA0172.namprd15.prod.outlook.com (2603:10b6:930:81::15)
 by SJ0PR19MB6799.namprd19.prod.outlook.com (2603:10b6:a03:485::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Fri, 13 Nov
 2026 16:44:15 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:930:81:cafe::6c) by CY5PR15CA0172.outlook.office365.com
 (2603:10b6:930:81::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Fri,
 13 Nov 2026 16:44:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Fri, 13 Nov 2026 16:44:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B9016406555;
	Fri, 13 Nov 2026 16:44:12 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A9491820273;
	Fri, 13 Nov 2026 16:44:12 +0000 (UTC)
Date: Fri, 13 Nov 2026 16:44:11 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] soundwire: sysfs: Use sysfs_emit_at() in array
 show callbacks
Message-ID: <avc+W1A17BA3Lmgu@opensource.cirrus.com>
References: <20261103095445.81414-1-lee@kernel.org>
 <20261103095445.81414-3-lee@kernel.org>
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
In-Reply-To: <20261103095445.81414-3-lee@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|SJ0PR19MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dcc5cc2-9206-4cd5-012e-08df41a559d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|61400799027|16102099003|22082099003|18002099003|13003099007|4143699003|56012099006|261009223027099003|261102123227099003|261021121427099003|6133799003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	FZt3bOA1GFmnOVTqq76UGSJnzPSGwCevNokVB6ob/9bAhyYiWiWZ/gGG/TCaTos0Quiss6lV8/ETysQ3fNxvRXyUlf25ISacmM0YLn7snOTGUSxHTQPQcffcQCpX0pHLpVqYxlDU99Sd0cZCD2cZIQBray64VJz+kaSuYoxVEUheFTkkKXcPZJqTpI8/7JfBanIAwykk8zRgo220/YMk9Xuo4oxo5SewcmdjE5W67POxJYySOK0KLlNQjt46f2WxJuprjXkFpoGIIT1lTQPySl8TS5DiZZ2Zt+GQ6gArthNyoSgASbuO2YuuPFSNBRGMMzIdxBOR2yi3J5j3MIeaBRb5LKNJr2b1EI5MBuW697WKbtBG/CRmMIt3QjXMcz/2LZP/PlIyvaS+cj5Dhxo/woPi1qfjHy9SK7f5mkmavYorJHa1VDTFqQChBRlN8jzyHvs0OKY7+ulXjr8kIvfxYPdwkkHY24xMRNHzep55z4NNaT+PHAKkfWpyH+bNewXf0B2juQ99GH53E6A80z6KHyJdYtZzN65pHE1FgNRWfRdIwfPbF5lV5no2MnENEd8Y5hAGVmBVdMIQVy7Jj+ej3wLW4znBZxJFBH7dDDFrr8JAe4d3uICTxaQNBVNU8KqLkwc4PxrsLujo69TcNcvcsw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(61400799027)(16102099003)(22082099003)(18002099003)(13003099007)(4143699003)(56012099006)(261009223027099003)(261102123227099003)(261021121427099003)(6133799003)(10067099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0HwPy0xGfFPCvSUpDvGbEbrGUgjUp70/hvmHkmCz1ZMcOlAN/1Cc/OOR1KDyD2PviVIugK4P5UX2gOx1YRbEQ4iIKkDiSdGmpM0QAab5iJEcsSqzQkH3sM20uyGg2tX3K7AqOiq/NEcUiZKfHV7Ab0VoC74j9Mj3Ive0h0axmYI98dYb8DRuLnMhxLT0InwORKeu4EBRO2AO1ftjrn2YVf+D6nAjtLCcqQ7SNE9QFSgA4EXLZeReeNyLCPSFpaYvzWZnhNLr2ahmPJmKqcoMx9nwmz+Z40IfDwJffCbuZxz6VegevfZqt0Xit5UwxVmBCOfUNZJereIEvJmJESE0Tufgb/I3MsEnWitToe7op4r899zCcRrXLjCXDroSS37ZsZ465k56c8MmAZJHaZePRK/n49X2PLKo5JexvIq6fSUidnGGPIsW1sf+JgmooOEo
X-Exchange-RoutingPolicyChecked:
	wA30mozk/HzbnfhumL7ezaZ6zbNOs7IS7aXr0IIQttZNQwHeecClJKrypWJtgwwAx0RB9944wwVsVRCOG1szTSPdko5B2kzc5a/0NuE/kVO9c5tQGvAG/XqGyetsXCGiN9RtCp3lfDZwj8P8d1Er7Ta2n5DhSbQZfNwAyq1QvP11nvvT0iY2/bwRmSP8+IhOTJRZ2kdSk2LP4nrOvXLkftsig+AgafOgVvrXiE/aVizvOk5jIxSScDl9LxY4UFvobRn8Tv5+HoS7m3aLpXfS77SKacl2FHQoATrsEzr0Lq0mvfiTKyMg7Tf0B+9EWT/rhWm8uoZIWYbrRQx/2ZED8g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 16:44:13.9439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dcc5cc2-9206-4cd5-012e-08df41a559d2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB6799
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2NiBTYWx0ZWRfX3zZpYrOdSaHv
 nmK1Cmm/5g+CzmKwizfj+hiE1blsb1UnHDhLTY4kdXNk96kf1xLgeHrs59G02auFfWR9FK1SdQo
 KrR4i/wgEMiyE1F/up9dMi29xHFKwKkBTDGCGWwggAF4K3vLJQ4fHXTPcNMEFIQGpJh0b5eHMdn
 iyNGtqU2VdufIZ0xfeLqmFbOUcC896JbB3yuGYOPbq9KINj4Jz+WzOybs0LmbwNCb/XZVBQr8CT
 cMJAMdLPqtNH/HhvIDcjNrXVSoV8UdrSl2t3eKJnt3luSN3++1rmAlNtrh4zukQecnc8EHCSyWs
 SnBJuwWOlayVnR2VPFDYVChD54V+K6p2kvI/3JWxI3mzyL0yhcsVtjx7/n2LPzkv1MAYOQMVCXi
 SdapzwNPlE2AKMXcNeeLXQsiyAbnWVtQtgXAxenkZ0JDteCENuKV5y+Q59vQR4niA+0J29IfFJG
 NI5tIWO7hcAaDIj8dyw==
X-Proofpoint-GUID: DmQvzqJqWX62oCGd4zozPTavQBsnwfmm
X-Proofpoint-ORIG-GUID: DmQvzqJqWX62oCGd4zozPTavQBsnwfmm
X-Authority-Analysis: v=2.4 cv=Woi+otfv c=1 sm=1 tr=0 ts=6af73ea0 cx=c_pps
 a=fuZeKWo3Wg5M7x5zI0EODQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=S3kXGHGi2V_0g-SwieQA:9
 a=CjuIK1q_8ugA:10 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2NiBTYWx0ZWRfX4liW8SUMsRjO
 zY9FFMJ4miVi8b0H92El2qlpwrLr89usEhkT89iPL5mWF/pMUqHYvY0VVGjX1K8Gkwrt2fe7Rrv
 fnfoA7goULmXCErKtOCWyvJVj+alpFc=
X-Proofpoint-Spam-Reason: safe

On Tue, Nov 03, 2026 at 09:53:46AM +0000, Lee Jones wrote:
> words_show() and the show callbacks generated by sdw_dpn_array_attr()
> format firmware-supplied property arrays into the sysfs buffer using
> unbounded sprintf(buf + size, ...) loops.  If firmware provides a large
> array count, sprintf() can write past PAGE_SIZE and corrupt kernel
> memory.
> 
> Replace the sprintf(buf + size, ...) calls with bounds-checked
> sysfs_emit_at() calls.
> 
> Closes: https://sashiko.dev/#/bug/linux-543ff498-3bed-412d-8972-4855c5aa6008
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
