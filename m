Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794245190;
	b=BR36ocqWv/vksZ25CnQedk9YC48KGUN9rHpx5+oObqeGdtaQ7cW4wph0uQxrlpGWCs28
	 lIAIFowH8HfJLl8wLdKUH+mlH/1SmKjCmBpTnRKNQTAjpv4tX6wESlZzBJXp0tMrBdW14
	 tMCmP2Q5XehCgGbp6Zgoz/8BeiQrxDlmV0cwboUYH+1Ov3Ui5NJKN+ByViuQgp9wvTydK
	 ueEyMjKYe3J7WiQHaDK3dd2k2kjnOzw8+HK4dmWrtTX3+nYgRrNT0kwMktlAh1zJq1ALS
	 /F+f23BRl0QqWDN7QbowZCVwJyD/E7YyD1lF3d0EzQxGPFygn7ejTU5oqdvd24N7G0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Reason;
	bh=ECvqHwMpHsG5CWCz+kJcLYnPWWWVFhfB7TrvhGylTiU=;
	b=dzynbGkqu1l803JNt72+SE427xREa5C5DcOHg1edbyy/F3LXKLKH+pU6NhbuYQ0T7hsj
	 ryEJCUc6qgnlLqXG4CanQynl4LBsBTEpPVS+KScNliscYyi8zi45Vwy2qnpI5P08jRNQU
	 crv7VpBHINE7i3uOcUCVis4w6TQp4nq1rdk/4wEkjgua3F4mOxQvQqNqIwdhspvSnAuTk
	 7elfrujRC345snzgf1zlM0cpAuudDjRMMUFBQYJnxONUvROyDTez1jqBXbFsTNAvecmgV
	 kTxMtF4HleBnNCwcbY8DFj0i+AO19lMExySRJ2raXZmN/LdkB7qLSmIH62pA2OL6MoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Pvu5+fI1;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=r8yQa+5Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567D7606A338;
	Mon,  9 Nov 2026 17:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 567D7606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Pvu5+fI1;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=r8yQa+5Z
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9HQAVH3515956;
	Mon, 9 Nov 2026 11:26:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ECvqHwMpHsG5CWCz+kJcLYnPWWWVFhfB7TrvhGylTiU=; b=
	Pvu5+fI1+ND9N80t5rrLbyDieV0x2bwdFsmUE0wfqIhNWQEBKAXCRO4fjg/OhRxy
	1NYG4a+d7CvXpYVMPcxvbdLLA7gmPrDxdTapPKxVo/y9brS7K/gUQ6bHgAt3mkbC
	Qx3fF/3WFbRypTsS3NG1N/0YuZPXTJH/dvQnubW+jlY2hFJS4vgrMLLIXjYCzccw
	TUwNQZHrKS9ZPYwGAsVvODagmbm5y9hd8bKWirTFq45Qf0KNMustsblIjG4CWt1R
	1e1Th3R9GDeQupxStiRJs2DhBoDBL1q6w3ke62ux1OBBWDv6dKlWyZcQHbQ+V5Ek
	5HPB/Z/lyod/K9ExZL6yHg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023073.outbound.protection.outlook.com [40.93.196.73])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ht19pahcu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 11:26:16 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rcQOUSxAumM/eYhpjSHtGfeukutlKOWc8VWhPou/tXvDweoBC/25cQlmECrY4gSkhVvFtTw6Z4BPCCBhiPvnTcN4GoE/UvJ19aFKcD+2P4/pnm99kBp27ngOj5UaMzP8PQ65droSmIWum5nMKBM4Thm5IWcH430fC1kHWu9g6zcknuKm76fx5aMgyOpo7pYKGeWaBM2w88s7T0y4EY+ReGXmcFpJy9/Mf0uozw+aZmzP1tRo0UE025x1f912sA7+J8r+8y9TpNhyF9ihvobyrV+j0ENrQQGEcq3BqnkTzrDwiDmw9cnYuL83Gj8RkHEERkarNLffQ/z1pYkEdfM2cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECvqHwMpHsG5CWCz+kJcLYnPWWWVFhfB7TrvhGylTiU=;
 b=zQfUpa7R04xt3qFsFbv/4/Pe0axj2aeZ72S/HAq0PmWvmuEXAIlE9ETLp1hmXjbHNlMMWAjST1drg+N48rzgGD1dqrID/ZrEbLmwBv6xk1ZYsmDibvr5aAMC6IsrLkrl7e5b42Wy+G90hpJ6uloZkpbSyF6ACNxgTZCh3m6ndyRdbCSZ39jtPq3DFHPrY4VZ4rjP761YDJwzzURMQ1Pg9+wOthTGZKF9x4k0Hfurnj3h3/fDwLMjszj/QMMN4fv450xGoCTP3tA67S99Thy/hoZr3XdMRoQwfbZ3NVTkM8GkitrxeinLFQESfw0jMzfGivis+ohbWUyPPgswp84wVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECvqHwMpHsG5CWCz+kJcLYnPWWWVFhfB7TrvhGylTiU=;
 b=r8yQa+5Zs9tlZ7tKuuNxJZJuRQHV7WvnCvjdtHcphG1VGsfJcVD/MFQHS0yehWbyBG6IIyShDDa5m2TxFsNvoBJPS4v5NlLOfFjPEq85e76RAHZ5nX/78ctPYcGmbo0KIH8TDNKN2ujTW0HJtODOVPT0qhs2XRyZrDie3hI1KS0=
Received: from MW4PR04CA0215.namprd04.prod.outlook.com (2603:10b6:303:87::10)
 by MN0PR19MB6358.namprd19.prod.outlook.com (2603:10b6:208:3c2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 9 Nov
 2026 17:26:11 +0000
Received: from MWH0EPF000D8951.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::44) by MW4PR04CA0215.outlook.office365.com
 (2603:10b6:303:87::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 17:26:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000D8951.mail.protection.outlook.com (10.167.249.217) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 9 Nov 2026 17:26:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8E40A40655E;
	Mon,  9 Nov 2026 17:26:07 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 71B67822563;
	Mon,  9 Nov 2026 17:26:07 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 3/3] ASoC: SDCA: Add port constraints into sdca_asoc_set_constraints()
Date: Mon,  9 Nov 2026 17:26:04 +0000
Message-ID: <20261109172604.4077312-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109172604.4077312-1-ckeepax@opensource.cirrus.com>
References: <20261109172604.4077312-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000D8951:EE_|MN0PR19MB6358:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1507fbfd-ad01-462b-8557-08df3e868b33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|23010399003|3023799007|18002099003|22082099003|56012099006|261102130727099003|261102123227099003|10067099003|16102099003|261009223027099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|11063799006|261026140227099003|261026121527099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	/TMBqQA6Wi2NfDMuDqm4gKm6f4NV7+o+hoMF5IFkoRCpseQVtkheRso3xWk8uutImuAoVGzYzqmFNlQEothCTJ7dhBouHZWCaed57CUCap/cbA6U2cFf+sKSw6gYBnU/ZuOLW2lKbQQcbkytYHaqtB9zoCoQG7WT91gs1pw7/JMvtiGiRz0GXYqcrA3dlzEyqJvcRFEtJ0odqE8F5PO6cAT0nOcodvCIxGTMzAX+0N18KoHZljmCDZfGC6rXx8JmUcI+zAUaYj7sPTvbVxfw6CcgoCb43Lsi8CRG9tM2EQIWO4iUztBzOfHnXvdLc71WAkyVTccuAYtHkowZhTq5E6w+Q/aEH++9Q9reh6q477ouMrQzIooHYFeSkDT6T0VDYxzD51VZGZB5CTKcdsvASGz5KD2zDuvFtyUNXV2bM9YOPqi8xToUo7KRKdHogxVbmN9rkCmVw6VTPCkP7Ih07sIahF8uUazL7oeXb++iQjTzhNAJIbqTi8/iryO2lPFJ//x692GFFxrsYwcPCfgh4OvrnnVLWVyAgfOG2wwphPEqMeHYYKydR1Sqzvwc5vQ6wjxVqrgHZ8eG1GsSV7HPEY0hgYFMDs7Z9iggFVUTIqwDaM/C7GHbsV6TAoCLbCbK2Dc3+WC0OtVXq/caiivl4GtEQp45Zd7+V8HZ6Gc4v7hUzH/hg7yjtQpdzN1BglT8TTKPAtaTUoJxEuhaVDw1lA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(23010399003)(3023799007)(18002099003)(22082099003)(56012099006)(261102130727099003)(261102123227099003)(10067099003)(16102099003)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(11063799006)(261026140227099003)(261026121527099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Kbou4utZlsPsGBEf7raDz4Z389TLaenltKJavb1nyj4+OXFab/F1fxyFquYVlLN8UvKezG+xd/tRZsHBWFBcyiEdS7qh8DiGbQ0ET+oqlSEdtHfZyCm0m5wqwOKXWzbUOePBJYmvkqhokR5jekFsCSISCVJvfQ+jGlC2LephgTscccGsKCXFeIvI/PcXsknlxJ32cjqF7dj3V342Nej5KKhb6sx+kInUYwbq9K2m9spSkcpuwMbJrrvl9NiF4WJ6COuxX1X0ghL7XFvv48RRN7Oub3LO3sCUCGClJSGtF0ByqsDyNRPTVJvQrV9ngbT/8NwQBdGIILrDGa4FeE7qsNRyz6qVGJdCuXHzTX8d1cv+Z0omIbo22KsEeDJ5/gUb/O+KmBuVIp/ebVYlEjCehx0gfI/YSf2TzE5hEYpOMX+JaAfJT3oDtfVlAnFFXufX
X-Exchange-RoutingPolicyChecked:
	yIyQCk4oWbaa413A58k7GY/m3SGJQkh9GDWblMoKq9nwYgth0ilWfbaKkT7YwTyxDylVKWhFA8yhTD8T1O9kBPM7BBl2G8TFbGZjK4QzpKRBILHu1V8Fqs6JBp05UspGHR2aUDLQywEuQS1QX0bOqXQtAsH0jx6TefZ1fS+NKxaW2+9E+Z8Uf5kC89fPGtQEgUxrQSTfqvNMJuC5Niv9zSDkkL1UWdd4QY4Msahu2f7vwW5a9jwv4k41kxEkWYOaUSLmj6ODeMM2UZQMD0Z+GCJ5OQAU/3Tg0Q2qnlYNX9T61p47dIEIobBYH1QtD7rTy5I5u9bZRTJtFnUTnUYXHw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 17:26:08.8681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1507fbfd-ad01-462b-8557-08df3e868b33
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000D8951.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6358
X-Proofpoint-GUID: oqNLbQUHXNmEA3Dbhai23pdj0Use9ipH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2OSBTYWx0ZWRfX1c85Ii6ZdhIF
 gr+m7BDen3XQ60D7GDLPzL2bHGDjwI4+iK02atxVVhwxbset2oNALnjNkhlbUrlAez7MYHTpthb
 0IUmYtjZPha2NVXj7oSgXWqsX4Iy/8s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2OSBTYWx0ZWRfX/QjznU+BwxSZ
 KubJpearjYp59OSbtYeOzExURGQAL0ftACce8oE06Bd9PiteKo1tcYFEh7ZgEUK3rYn1zWaGJrv
 YQqVpIeTEtnuUhZdlae55Bvbbuh3aFduY7kmODzL7Vq3+Sy1Y05uD5O9HINSl1ZmskJkmb65nHu
 GGOoHaEeXrRdok0uL2IqWvXHEyGcxKNl456hPsNnReN4ggqH6y5yicb8362HPw/GcK/yGT99+80
 VtznFAlosRgxX1dhNE2QcGRfOmJnFBVwm2cwniQ5E92q5LcsOu/hT5kPgAfWOu9v/UrzTLVwi+2
 1wBCwmQbMHGi7UULbLCqFkeWop+3DcBTYzx8iA4qpCW0tzELla3wznhcDyinxgDcnPSPNlDLwyX
 HQSnlHE61tPTqHb04B9fHtjs/bpBMdK/6RF+h6mHrJ4XubxV/ogpBzZtNBEDV/bo4UNctO+w1/A
 /VFqtax91lf79hcFljQ==
X-Proofpoint-ORIG-GUID: oqNLbQUHXNmEA3Dbhai23pdj0Use9ipH
X-Authority-Analysis: v=2.4 cv=NK5AaE6g c=1 sm=1 tr=0 ts=6af20238 cx=c_pps
 a=z3Dl+KlN2KZ3OO0ZkS+3EA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=GxslQ5yvgL-McidNO4cA:9
X-Proofpoint-Spam-Reason: safe

Currently the SDCA code constrains the params based on the DisCo for
the SDCA Terminal used. However, it ignores the properties of the
SoundWire port, which in some cases may further constrain the allowed
params. Add additional constraints to apply these restrictions.

Some minor additional refactoring is required since port constraints
should be applied for both Input and Output Terminals, whereas
currently Cluster constraints are only handled for Input Terminals.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v3:
 - Added defaults for the word length min/max
 - Removed unused static_assert

Also regarding ch_min/ch_max one can't assume defaults locally for those
as 0/0 is a valid combo. I have a patch that adds defaults at the
soundwire end, I will upstream that likely tomorrow.

 include/sound/sdca_asoc.h            |   4 +-
 sound/soc/sdca/sdca_asoc.c           | 133 +++++++++++++++++++++++++--
 sound/soc/sdca/sdca_class_function.c |   3 +-
 3 files changed, 128 insertions(+), 12 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index 236a441ec9d89..26740f69f2bee 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -12,6 +12,7 @@
 
 struct device;
 struct regmap;
+struct sdw_slave;
 struct sdca_function_data;
 struct sdca_pde_delay;
 struct snd_ctl_elem_value;
@@ -91,7 +92,8 @@ int sdca_asoc_populate_rate_format(struct device *dev,
 
 int sdca_asoc_alloc_constraints(struct snd_soc_dai *dai);
 int sdca_asoc_free_constraints(struct snd_soc_dai *dai);
-int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
+int sdca_asoc_set_constraints(struct device *dev, struct sdw_slave *sdw,
+			      struct regmap *regmap,
 			      struct sdca_function_data *function,
 			      struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai);
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index be1b4c0075796..37cd1f9f58bd1 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -13,11 +13,13 @@
 #include <linux/delay.h>
 #include <linux/dev_printk.h>
 #include <linux/device.h>
+#include <linux/limits.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/string_helpers.h>
 #include <linux/types.h>
@@ -1436,6 +1438,7 @@ EXPORT_SYMBOL_NS(sdca_asoc_populate_component, "SND_SOC_SDCA");
 
 struct sdca_asoc_constraints {
 	struct snd_pcm_hw_constraint_list channels;
+	u64 width;
 };
 
 /**
@@ -1507,9 +1510,91 @@ static int get_cluster_mask(struct device *dev, struct sdca_function_data *funct
 	return 0;
 }
 
+static u64 get_word_mask(unsigned int width)
+{
+	switch (width) {
+	case 8:
+		return SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_U8;
+	case 16:
+		return SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |
+		       SNDRV_PCM_FMTBIT_U16_LE | SNDRV_PCM_FMTBIT_U16_BE;
+	case 18:
+		return SNDRV_PCM_FMTBIT_S18_3LE | SNDRV_PCM_FMTBIT_U18_3LE |
+		       SNDRV_PCM_FMTBIT_S18_3BE | SNDRV_PCM_FMTBIT_U18_3BE;
+	case 20:
+		return SNDRV_PCM_FMTBIT_S20_LE | SNDRV_PCM_FMTBIT_U20_LE |
+		       SNDRV_PCM_FMTBIT_S20_BE | SNDRV_PCM_FMTBIT_U20_BE |
+		       SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_U20_3LE |
+		       SNDRV_PCM_FMTBIT_S20_3BE | SNDRV_PCM_FMTBIT_U20_3BE;
+	case 24:
+		return SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |
+		       SNDRV_PCM_FMTBIT_U24_LE | SNDRV_PCM_FMTBIT_U24_BE |
+		       SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_U24_3LE |
+		       SNDRV_PCM_FMTBIT_S24_3BE | SNDRV_PCM_FMTBIT_U24_3BE;
+	case 32:
+		return SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE |
+		       SNDRV_PCM_FMTBIT_U32_LE | SNDRV_PCM_FMTBIT_U32_BE;
+	default:
+		return 0;
+	}
+}
+
+static int get_port_masks(struct sdw_slave *sdw, unsigned int port,
+			  struct snd_pcm_substream *substream,
+			  u64 *word_mask, unsigned int *ch_mask)
+{
+	struct sdw_dpn_prop *prop;
+	unsigned int nprop;
+	int i, j;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		prop = sdw->prop.sink_dpn_prop;
+		nprop = hweight32(sdw->prop.sink_ports);
+	} else {
+		prop = sdw->prop.src_dpn_prop;
+		nprop = hweight32(sdw->prop.source_ports);
+	}
+
+	*word_mask = 0;
+	*ch_mask = 0;
+
+	for (i = 0; i < nprop; i++) {
+		if (prop[i].num != port)
+			continue;
+
+		if (prop[i].num_words) {
+			for (j = 0; j < prop[i].num_words; j++)
+				*word_mask |= get_word_mask(prop[i].words[j]);
+		} else {
+			unsigned int max = prop[i].max_word;
+
+			if (!max || max > 32)
+				max = 32;
+
+			for (j = MAX(1, prop[i].min_word); j <= max; j++)
+				*word_mask |= get_word_mask(j);
+		}
+
+		/* Only handle the number of channels for constraints. */
+		if (prop[i].num_ch_combinations) {
+			for (j = 0; j < prop[i].num_ch_combinations; j++)
+				*ch_mask |= BIT(hweight32(prop[i].ch_combinations[j]) - 1);
+		} else if (prop[i].num_channels) {
+			*ch_mask = GENMASK(prop[i].num_channels - 1, 0);
+		} else {
+			*ch_mask = GENMASK(prop[i].max_ch - prop[i].min_ch, 0);
+		}
+
+		return 0;
+	}
+
+	return -ENODEV;
+}
+
 /**
  * sdca_asoc_set_constraints - constrain channels available on a DAI
  * @dev: Pointer to the device, used for error messages.
+ * @sdw: Pointer to the SoundWire peripheral device.
  * @regmap: Pointer to the Function register map.
  * @function: Pointer to the Function information.
  * @substream: Pointer to the PCM substream.
@@ -1519,7 +1604,8 @@ static int get_cluster_mask(struct device *dev, struct sdca_function_data *funct
  *
  * Return: Returns zero on success, and a negative error code on failure.
  */
-int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
+int sdca_asoc_set_constraints(struct device *dev, struct sdw_slave *sdw,
+			      struct regmap *regmap,
 			      struct sdca_function_data *function,
 			      struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
@@ -1530,31 +1616,58 @@ int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
 	};
 	struct sdca_asoc_constraints *constraints = snd_soc_dai_to_priv(dai);
 	struct sdca_entity *entity = &function->entities[dai->id];
-	unsigned int cluster_ch_mask;
+	unsigned int port_ch_mask, cluster_ch_mask;
+	int port;
 	int ret;
 
 	static_assert(ARRAY_SIZE(channel_list) == SDCA_MAX_CHANNEL_COUNT);
 	static_assert(sizeof(cluster_ch_mask) * BITS_PER_BYTE >= SDCA_MAX_CHANNEL_COUNT);
 
-	if (entity->type != SDCA_ENTITY_TYPE_IT)
-		return 0;
+	/* FIXME: Currently only a single unshared port is supported */
+	port = sdca_asoc_get_port(dev, regmap, function, dai);
+	if (port < 0)
+		return port;
 
-	ret = get_cluster_mask(dev, function, entity, &cluster_ch_mask);
-	if (ret)
+	ret = get_port_masks(sdw, port, substream, &constraints->width, &port_ch_mask);
+	if (ret < 0) {
+		dev_err(dev, "%s: no properties for port %d\n", entity->label, port);
 		return ret;
+	}
 
-	dev_dbg(dev, "%s: set channel constraint mask: %#x\n",
-		entity->label, cluster_ch_mask);
+	/* FIXME: OTs should inherit cluster information */
+	if (entity->type == SDCA_ENTITY_TYPE_IT) {
+		ret = get_cluster_mask(dev, function, entity, &cluster_ch_mask);
+		if (ret)
+			return ret;
+	} else {
+		cluster_ch_mask = UINT_MAX;
+	}
 
 	constraints->channels.count = ARRAY_SIZE(channel_list);
 	constraints->channels.list = channel_list;
-	constraints->channels.mask = cluster_ch_mask;
+	constraints->channels.mask = cluster_ch_mask & port_ch_mask;
+
+	if (!constraints->channels.mask || !constraints->width) {
+		dev_err(dev, "%s: no valid constraint masks channel: %#x,%#x width: %#llx\n",
+			entity->label, cluster_ch_mask, port_ch_mask, constraints->width);
+		return -EINVAL;
+	}
 
 	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
 					 SNDRV_PCM_HW_PARAM_CHANNELS,
 					 &constraints->channels);
 	if (ret) {
-		dev_err(dev, "%s: failed to add constraint: %d\n", entity->label, ret);
+		dev_err(dev, "%s: failed to add channel constraint: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	ret = snd_pcm_hw_constraint_mask64(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_FORMAT,
+					   constraints->width);
+	if (ret) {
+		dev_err(dev, "%s: failed to add bit width constraint: %d\n",
+			entity->label, ret);
 		return ret;
 	}
 
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 6406c9d0f6119..abccc63640c68 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -121,8 +121,9 @@ static int class_function_startup(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
 {
 	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
+	struct sdw_slave *sdw = dev_to_sdw_dev(drv->dev->parent);
 
-	return sdca_asoc_set_constraints(drv->dev, drv->regmap, drv->function,
+	return sdca_asoc_set_constraints(drv->dev, sdw, drv->regmap, drv->function,
 					 substream, dai);
 }
 
-- 
2.47.3

