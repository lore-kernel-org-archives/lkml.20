Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793888865;
	b=ufFmEI2hHfPHGoy4vZEvOYE5O9k259sf7BJk1G8TCXWY2DLClY44u/nnZiw1RXztqpm+
	 3GMtmDtFQNIO1zmPL97DuGP6M6YS4LMEz1/Dbdc+qXuS6YwcD+LhkPY60BsgjV38Gd9yd
	 //3pwp6Rx6dz3NSO6Pnl31HwQsRWiA7ZjZ03J71KBNAqnYRQoRhy4VoEvurJuHQq1UX97
	 QpgIEZWx93eOqc9DDMvnZ2D8xqWsLcJCpbz0LYjMnw6JnfQ5vdzFvzlxgwU7a2DVsF5y/
	 3sJiiwV/aMH04XAPat/EUxfjX5g+2JtFY4S5Eiw5HNeab39/YlLWKVRp+3EN0OwrCww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888865;
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
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=SGz2c7LDzZvCah1uj/JR8iXuFCiXgKzvBk4V639qEtM=;
	b=CZ8LH5pZ1DtNPnzaEgQuGg9cvvy6JG5KSztnYN7e8GYcJJ8AylZ1Ku6R27k7slw1BId7
	 DY84vN6p7Sd0suFvnd4nV9Zc5cc0EBT439W6Zbvy6kjEZUZP5qZR2/vZsii56CLvfjqdA
	 Evu83xO32y2M/tPUcphJ2du3GgKx7OpaYiqUVsA1ENrwrABRC5iPnPgQh0URbxuYlnP4g
	 RI2GObym1gQMabeWsKVFsQMoTrxXnNtTw+lnqp4OXjPh4a+e7KEyan8MOSW1pIAekHC6O
	 Sz6slFcyauFByo4/p46dj6gtWDIU3mmbnJMSq25gredzrleNs1jkpDV8yT1tZZV1New==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=pEyB9eyi;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=SphAGL5R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14371606A326;
	Thu,  5 Nov 2026 14:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14371606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=pEyB9eyi;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=SphAGL5R
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5E3E581636257;
	Thu, 5 Nov 2026 08:27:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=SGz2c7LDzZvCah1uj/
	JR8iXuFCiXgKzvBk4V639qEtM=; b=pEyB9eyik80NfCEpqY6TMW5tMoMC1N9XlJ
	yQ6v+Ahki1Fb6/oK3Saz8POG/9xW8rf3dVBbJILcxQE73Pnvo6MOPHNbsU93WNcZ
	iql6ZUiGaeN3PM/TB5coGVjqMxfHXNlIZnAxmd0g+mQN4yO0SZijLuruhdcFX1Iq
	Npghlsq84fqVqKKXj8aVVdGPD/D+Oh8ftjQeHNN6Q76UBhcgUiZ/1qHe13xRxhQm
	y53jQeP/B5of+E2vh7Zl6f4ZSEpH+vQylPAnVteYR59VFIzBpITm9mPD5SnrUfRY
	cubNZkFNO31OMBpnadxsc5+Hy7eZgoXF+l2ML+g2SVjkMR8Jy2YQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022140.outbound.protection.outlook.com [52.101.53.140])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hr7c79r9m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 08:27:38 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmM5Eh0dV6CD8BGNwX1Lx9I6KLjKvBj3qtxPHmy2vonFDdEyl88s/1koypmRG77k5OkSVNaIFnhi1MNKMp0pav3gZ9itQy/P4VIzo1UCL6V+w8vJetmSQtaCNNda7HyZdKLoMnxsRMvFQ3abfXCMkfhtOxowJWsJmPWD9ZFJWiKKVjcF4UxkAtoQVOKhOB4Je6NoxQJO1bcGUK3bU2eynEUvHOB2yk8LjoUxyjts+A3tep/rK71kqa7iplpIykEY3YuBZa9sD9lPdFBsta3ApYim5STRyZpz2OHfdwRSwgYI5emktocKiKooomfx/DpNA6qjw/tUFtBDYwau7uIfGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGz2c7LDzZvCah1uj/JR8iXuFCiXgKzvBk4V639qEtM=;
 b=iL9eWAgXKwJpZdN9hBJgU23mHdgCK4xbWTyGiV/QfIlnU/XRp+TDtlNzKt2JACKu2I32jqhFsskzrCYtwt+LmxSIm0G+m9IVjRKjjyy2yhKXTOYhLVSo/RyzNAeMxz183ttmRTiSKvRf3DM/1qsBIrmKCmyKMZrUeaN/DtItjYzbaV+85R3Y27xvK6XlmuvRirDzd/4kuL1xrXVc9j8XTYsBErfyKSv0WWgdSTXcgedFO+yu2iMpam3sm+ClTuwz8YDoYQ1FRbJRO6TLWUFzyI9kYWqjSIUyLGEZrn6cd5i7gsXBtM4tbUD1oRSqe3dDftKkqgLj8mlHcdxK/MJZUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGz2c7LDzZvCah1uj/JR8iXuFCiXgKzvBk4V639qEtM=;
 b=SphAGL5RH+e1vGAyKQ11zNWx1CLucFr7IBGZdzbCZEQnU5h+UIw77slnlFaC1k5gCRrz+Hr1SWsPwfnIuh3f6dxcgMPikbGyMVu5lfJiX57p/4tcV4xnbg9+F+/iBfXNt30i/KfJ7DdrgSC9zXBoecOCd/skV9uZWVmwHIvXyiY=
Received: from SJ0PR03CA0255.namprd03.prod.outlook.com (2603:10b6:a03:3a0::20)
 by SN7PR19MB6831.namprd19.prod.outlook.com (2603:10b6:806:261::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 14:27:34 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::28) by SJ0PR03CA0255.outlook.office365.com
 (2603:10b6:a03:3a0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 14:27:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Thu, 5 Nov 2026 14:27:32 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2BAE2406544;
	Thu,  5 Nov 2026 14:27:31 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1236D820273;
	Thu,  5 Nov 2026 14:27:31 +0000 (UTC)
Date: Thu, 5 Nov 2026 14:27:30 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 2/2] ASoC: SDCA: Add port constraints into
 sdca_asoc_set_constraints()
Message-ID: <auySUtkepI6MQV0/@opensource.cirrus.com>
References: <20261105134952.1728147-1-ckeepax@opensource.cirrus.com>
 <20261105134952.1728147-3-ckeepax@opensource.cirrus.com>
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
In-Reply-To: <20261105134952.1728147-3-ckeepax@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|SN7PR19MB6831:EE_
X-MS-Office365-Filtering-Correlation-Id: 187155e7-4fa5-4ac4-c8f7-08df3b48ee2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|61400799027|10067099003|16102099003|22082099003|18002099003|3023799007|56012099006|4143699003|11063799006|261028144727099003|261021121427099003|261102123227099003|261022075727099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	4dK6nC/qCFaGZ3Xfvga28PDCDJR1MTuhNlGxP5dMtPuXqGTNvWWBjFQdnuvCbRYEnoxoYGBvlIXv3TJtsdD+7jjPqBiTpzKwbbwk9UpWBWepeCZcXBc1AvOqhvcZVkTWnUTBAVh3tz5MfPVJK+hN24WJkIW+ycq0ptEdRWEzhHifmDeZrwi9uUyLMt5FdfYl7wdqfjlH7vZkt4HREcnqVwtJ2RViQMVayt6C0DOQzgXUjAeO7YG7/4QzaoEkkGjd3REcM22FR72t9C4Peg6SU5T5IN57sdelA81WgIOY/eND8So+t44J/0JSptMN83VplV05DNYaJA29WolrCA3P5DqPw8c/SNufvrNu33Kya9P+KiuE+fcFEbk7ZwcoNmYkwQ9hNxn4Ms7xDUSMfm/rIT7BcJjXqWvyn9j7cb1sArePzi86chi/vEuViyYBbmdCtl/RElRt3opc5VlmrWZIy2UY4FNIUDMrddMWFOIXIbXM3fAiHTQf41zWXpb9w2IQnMeb9dAM/iN7T9Opf5lj3rMhM+MEPvnGT+mn/N4cMnphD2rOsH4+1U1lVA64qMYIfWusVcmCwJmJQiYm9Gtzh7Wu3hBayMqSNZlfDMTO1HhBaKuUMPcnD8obp3xR3vOnSd6Zw7q6MxXnlGxW6cRbJBjpO7cSwqFUt0XrnI00l25D44wuuuINzu0RSz2064kWNEvutOHrp3466eY8sjk1vQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(61400799027)(10067099003)(16102099003)(22082099003)(18002099003)(3023799007)(56012099006)(4143699003)(11063799006)(261028144727099003)(261021121427099003)(261102123227099003)(261022075727099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mTWfRtDaMB4Ts1Hdg+eSmhU3alrNsciYK2SmOL1BOEm842ZLliWltgRhhK2DI5MDVr+H4ycFbVkuyBq8W0Z54USjrJ98EpsJQvjkY9KRlKvoZmVo0+O0bKOdwQSRX2R+ozg6GFVA01XSRy67jn6vDTcxzGHdGy5GMz3hCNXGtXcQvuaPiC7Avq58zOiESgFA1df4VPjgLVXhj8v8/xnqTVAYCiax09PnTm5/L1/1HZSd7AmxUZcC3ILOsde/WUPt+tW2erqCpnpUC1GuxLwIyWes96wsFwlCSMTqcio0nen2bkCAG4jmBrd3oYhcS5O4xKc3l22GjcIUh1Orhj35AGruIfQWj4FnsJT5ZdYSAWvr3M/1JfJJlbEwcOtxxpbsBBnMWEW2ajk/HEh1Tz3vhOBm4O2z5kReYg+9LIknzCrF3hP26mlaez/VS7sGSprE
X-Exchange-RoutingPolicyChecked:
	O0ME51N+UOLJfFmQbHO44/nKhz/94t/q+Z8Ki2/pJW7J8tdsozmNT+qaTGgBx+M2AQEiYtb39Gk0SdwhUkY7Ouy8oWt6HWrncmyEVl/+tJ5E0SbrQ1SL6tjUbFU5cn9tdA7ZkMwlroKj7YjA9V4BdFY/M2pRVKof5k/kk5swjolhXVH6Bp5K113326JiTL/I8hNZutt4ALprjCEJ8Jdv0jCzfBses5ETFS7foDQ3C1wo2RbavfHYNsecgMCtgUjnpEmRf68Fz6R3UTCyfXzPMQma2phT3J3V3+PbwHWWL1ycWqLD1H05ueTyD/UK5/H5XZHuxMVUkm5Ws9+x/RQN8Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 14:27:32.6179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 187155e7-4fa5-4ac4-c8f7-08df3b48ee2c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB6831
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NyBTYWx0ZWRfX+I/IqT1hFxB+
 LSKslKDTkqTr6u2F28Vh7w7QfUmumf7wbUCC4CYUiqhcHdoFC6rWumDJRZgWzrxCczgwnOblrLn
 uL/BfrVqb1FTo5woZEJXX/YEhkbTX0FundTVRlWhHcofR++4IRHdtox4D76ydDbsJDWZL2NCpBr
 FavLWnE975d7/03o0oHVVNvKZw4AFIuLzzVBQM3El8+/zA6JufBYFrVSGaIib3OzWbSLQjlEmUA
 C1YEHo+y6J607Da+L4N3cgo4SDslAhTrF0PJkVZVkae616mK8jXZkIf8glh4Qvmsw7bBbuoSPGT
 Qh/0+0/YQPJ0O7BBRXqA45jT2vlss0Ez+kGTcqGhZYduxuCZBPTMHT9h8HoNyxfr7wRVTIEJt7h
 ix7+GXByv/5w/7E2XpXKz1sGFkDbagphUOshI0ErHgw2DNvo+QweanX5OIO98aUVvsU3ltKFui9
 iDiqWfudQg8l1vVPO/g==
X-Authority-Analysis: v=2.4 cv=Vr62kO2n c=1 sm=1 tr=0 ts=6aec925a cx=c_pps
 a=+JdfgjdjdkA1bIRLmkjrZA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=6fcdSP-99lOD8UuvAusA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: WhHdMCQ7Vhb6bPxZqgSjZYTSMf6F1aZW
X-Proofpoint-GUID: WhHdMCQ7Vhb6bPxZqgSjZYTSMf6F1aZW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NyBTYWx0ZWRfX2YIHQ0cc5nrt
 2+xS/WIv0DZFElAgZvBZm8p2MK3J0ZWk/tWkVI8hd2cD5LbN1p3JPHyv0kqb2a6L3cm4NXlacky
 BJJ6coyn4spi5pqnHK9ZiBu9t1umRhA=
X-Proofpoint-Spam-Reason: safe

On Thu, Nov 05, 2026 at 01:49:52PM +0000, Charles Keepax wrote:
> Currently the SDCA code constrains the params based on the DisCo for
> the SDCA Terminal used. However, it ignores the properties of the
> SoundWire port, which in some cases may further constrain the allowed
> params. Add additional constraints to apply these restrictions.
> 
> Some minor additional refactoring is required since port constraints
> should be applied for both Input and Output Terminals, whereas
> currently Cluster constraints are only handled for Input Terminals.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---

Some Sashiko comments to fix up on this one too.

Thanks,
Charles
