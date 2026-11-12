Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794493153;
	b=LJXeStNgUEKmnxCFaqsHCrfDbcrbhrEWFN+kqMYPoG1GYZQCAy0BUC2Cp/NQ4WcN7tfw
	 jmd/uxqAE3zIxUXCP5D/scoMwHCYcWunlyPZ6KF0fkrAT/qIuo2zmmMvXUVx5Cikgdk/1
	 Uf81GdDKJknKhsFyeUhXTGMEjBfQr9jzY7EuzwaMGevuIHt2h8zpXae9dVCK7jyDaQgMA
	 oMK3xANC6He/QaeJjke5dlC9ZxVOzQSCdVaj19wMvqoKBAKSvkkLJ/6nxjApqWVJlHfHg
	 UEt666VqQmPW0ZxRc/KOr8aJ1+d79zN/6W4iE5mdPGsmMlB8450J+NwAeyanU2KEe2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493153;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=Yq0/Duoijj7Vz//afazXd7x0bhwb/axK2vYCO96oc6A=;
	b=F9BLdhqj1ZXbEip8ZzTFYACNAynfmyKL+TxPeBECj5nk2noMLAxxMDIH/EWLwhfQxo05
	 UDH8TnJWKomLqc6T1IynT2dehkxmPHhroPZRV6TdLzufyJLTAqGWhLLpU5WJ9/Tm6mM6v
	 y/f7pTHA7I0kaySgcx6yRxOT0AS99dYYXsMG7kNkLH1+TUT08m25p+eeE0+g1CZbnOABf
	 U1HkKEmdX3LCa44OMOv83fhIoRWBr+ODXOoRlbimBkN7+7FXJhp/zJtYRSnPtWc3XpLnZ
	 wgSnuZmQtaQKq/S3noXTQXhc0wH5W8PTRgtl3RSrV8KJi0BRZcOYVhxlqik1MfmnJfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=AACmnNys;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=b7pOshcU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F67606E65E;
	Thu, 12 Nov 2026 14:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5F67606E65E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=AACmnNys;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=b7pOshcU
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACEHrh82166359;
	Thu, 12 Nov 2026 08:19:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=Yq0/Duoijj7Vz//a
	fazXd7x0bhwb/axK2vYCO96oc6A=; b=AACmnNysyz4kSh4Bsp7dw1oVhhd7Ng1r
	aDA8bwE/+Gd6DOj/WDY5okWvfYpk73x09MZC+0KYIBwk4LCxIupTR2ajZRRDa1G0
	7fA4qeZUegiGM6vLG2geNQ7Di0SqmivfBiCrs8r4qjmf2izEilFJQTdgCaMrN2Yg
	hRcFbMP1VXJw1MLsQ+2qN3Zb+0EvY7NFqAZXFWYk8lrxJU2KWjoj7daEVH248CWj
	1rwQndyAzWyEd0sMTQpoIeQa0pOEle3oZyCtERuHCNVcCVswUpVXKhE0bSLjsaka
	sVRXjqHZrE6uyWR07UkP/4pGoM3amjSEEhQPIRjA0Jdmk29IUTrR1g==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020109.outbound.protection.outlook.com [40.93.198.109])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hwcfpg7ke-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 08:19:08 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=joGqi2vv8SF3RTtbpK3+YIYr5igURNtJTGA7yk6WYUk3sFlCYC1sm5RAZ3BCzqveOVonw84ap6WD8riS9avw1enA+zGGAcDy9u9gPTEyJd47PZY2d3JfWuGWFWo1z8JRKiUjF/55oH0ELIPOfXIrJXbPzm1mY0/0QQs3LXDStE7MwXoqeCgDBcmG7pNIVn1E5qaBBcXbWIZPZP1CtN/OxTILnYxlHCF3/dij/EY9yTiRubT+LqgOuNakkyMSG886W8tHM2y3BND60ScVoFbHQuCAqL+kQyvqvpEaCAg9VvymtEedD7p/KEcwFVPQXNq0YAZOAU8xfB8Uwi753/tT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yq0/Duoijj7Vz//afazXd7x0bhwb/axK2vYCO96oc6A=;
 b=vWkC+RuW5T7R7I8/8gg5OLhN1BEmtILQVDljtZ8EINEqOJ8h3wzo/k6b2kNJXfNwh1nMERWYigEFMpUS/n4pD6tUZFdFue2Cdt4l1zCAcB5z6cQCeMiIE9Pue+CoCMHaiHt5nih89f2kv80lHVCsrdvK9y4ByD36HuZgPFEy7K8XT6Q7KEpBPUadJeN92rijBeEyQBEBIV334IDYNCTEuThajJD1zR8t47JXXyCvnVezGoAvMA3i1iJMfhRRExWUdwn8PBVW7J5SFueF6dmCqYw64Nyrn5FvYn7aXbzZ5t/8qOSw5AyocCJeGuzF0nVgMpof17+YDFFqQRWpoBFuxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yq0/Duoijj7Vz//afazXd7x0bhwb/axK2vYCO96oc6A=;
 b=b7pOshcUDCa+yodPA7PyPEE85J3hF3IxiVuX63rJCRmFOiX44o5aWn0vIDaQTPZb10X2Wgli4VAIiRtlNHnRiKttxS1fI1UJAyrGR6QLJMiPSS5OAp1HB2m/YLHe9o5ZN+Yd2Fua48G+qafGjz5hyyLILB8PmA39qV719VlejnI=
Received: from DS7PR03CA0022.namprd03.prod.outlook.com (2603:10b6:5:3b8::27)
 by LV3PR19MB8778.namprd19.prod.outlook.com (2603:10b6:408:280::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 14:17:00 +0000
Received: from DS1PEPF0005344E.namprd04.prod.outlook.com
 (2603:10b6:5:3b8:cafe::85) by DS7PR03CA0022.outlook.office365.com
 (2603:10b6:5:3b8::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 14:17:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF0005344E.mail.protection.outlook.com (10.167.23.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Thu, 12 Nov 2026 14:16:59 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C00CC406559;
	Thu, 12 Nov 2026 14:16:57 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9753C820273;
	Thu, 12 Nov 2026 14:16:57 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        patches@opensource.cirrus.com
Subject: [PATCH v2 0/2] Update cs42l43b load detection procedure
Date: Thu, 12 Nov 2026 14:16:48 +0000
Message-ID: <20261112141650.1931348-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0005344E:EE_|LV3PR19MB8778:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b64ce9c3-df16-4140-832b-08df40c79d93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|36860700016|82310400026|376014|11063799006|56012099006|16102099003|18002099003|10067099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	rKU66dy/jgEjXGpFJJwmnSfcGmAyfFyXwsRcHSF1oAJbfA+SKU/KkXBL4lzTMcvY3wTg9VT8qcltUHgg/3F4tYapmERLjtCsAOiHw8iSJfNukoONJF6cqk8uDQjKgJ7qtIh0UCfuJtpDKNGaJ2JOeJnjGcktJVOpKDHRfDNAokjEJly6ET779fa6YpSPBIJI1FrKqou/0Av1ZhbYfDS65/ke+ivvHqK1gMDfQb/cHMfwuIjFPDwXsjZ+B9qlfMMMS3QujbkRRGI5yJD2ykduXXJYxYHVz3EZqQIYXTxRYsyUXUSq2umGxVkx8C7eCiEWrfkwGKFaXUp7LO299GaNYkyefpM0cNL2AIkSsJaOTIq3UKfgBNahDBvTunkDQW6Beyk9k1n6/3iefXU7DNhMAPrIRSstFArWOcIekrMDkgcewJzArGqiWyEk72BMdHI3noHofNRloRDTI9aBPoJEGDWHers0+HL/JU7wYd1KEst+rABjCPuzMwN9IW5AanxjS7nlomLRhIv1h/YYzL33paXbxM22xyzEjwWVKE52cYjyBAPobINMfaLZt8kiJ8W2dbLOlXCI1gh2swAfE0dvsyHRx7Ce0vttjfkPwhrTVvSUeu89Qtj6Z1G4HosTE024Qi5dUf8f6iksOSYY045vaDXDr96jSUWHmQqYgfxgvoQcvLZpvT9jxYCf/t2yIQoDQNbVMiRicJwz76vOHl5ALQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(36860700016)(82310400026)(376014)(11063799006)(56012099006)(16102099003)(18002099003)(10067099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aCtqCM66E/OaLSE1DMizWrY1P2/61/4dPmByumULXIxLHaCvXB9bESzoyDW65r7L1EAa7PxWZ5iY03IgujbjpVumww8HyH+4KvLR44hIx0RL35wmRqxQ2VPk74KSbFoSkzRjrMZYUPO09b2cZjFnLzgTgo1TkVnjUSoVyZMhIC1VcIh2VRqhC9j0UEfb91ur1Ne5wPcg0sCObHXgS4mlMhhlcBPLrUIJG0xKFQzIhdLvtTJS7ZiywkZ63meEPQgxSAFlvwbOCh5HgeDA0yl95z2C6cXIbdHnATEiUGyWC72/5xK2cg7YdQ3l2pHh1I5jShYwPPLzo/sX/lQmBvpnE1rtrkldr+jKzokfLLXbFjyckUg4lqHTdg1PtcSRxeCZzNyq/ufgxwxuWDSJHJ2qwjOTAkS6fOGhOQ3hez61xNefuUr9tSrCuOaPVHVX/nGG
X-Exchange-RoutingPolicyChecked:
	gvgJkcN3vm3YauQgnR7jr8KOyAbUsAINpEWVbL3cjwXEskUnN5jMhrfKHnNA1xyaYam0WSP7ONLlDGgPs7RwKwkTGRQcs43KFoIRGNaQw2mEzsViBhBxp6BT+LKx3J9I4Xe3eJYsiUpoKoWn/aiAwiKdkEyFEcNG+MwyLuh/VTaPCK7omW0dcp3eoMn5oQCKHBoaBxCGJehzTgowY4jilu8VpM9VaFQFYpJTnq/SbRtrPcWg4oNxwy81JuqvunzJ441tjYSf1pRATRupNGj54aY+Ir1P7f8pZu1BS6qXWZ61J/apI6euBuK5tf/kHGKOoEndwwTqi5dm4687/ZrKkg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 14:16:59.3613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b64ce9c3-df16-4140-832b-08df40c79d93
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF0005344E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8778
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NyBTYWx0ZWRfX9avbxUy68RMp
 h7aKXXiPvtWw683rqeB10HeUBbG1XYXN9mODXiZsifRvH/p6IXqLhQ9aQvaPFVOc4Y5GYsZ+pft
 YVQ9IlFPzmLSh+ylt42zE5vSERpPD+6n9x5mQK5s90TuU2gBGpIhcgblH+2VtXG6LuKLNd+txnB
 C2lTn0zb8xZty10JEP6SdFrxhxXkSmtKWDAWiJqJyRQMBXx3mNQuywQvKo0WgBs+z9QKkvIyKEU
 VxMLUXj93dci8ltv79QoMYQ5gY2IF7yvHebNY9rPGa9QsvZAY34OLsew+iD5D2frNYsLCNOSdoK
 oSlqtOkb6KYGBezQikFJ+EeG/KjaE7T1sA+NC6EeQ7EjEYuwX92FnNA/IBKnaML/oo1jf/u8lGa
 ky7lmUFfxwMNzuT2rfzA5B3lGgGHJpHtIybcZN8VfUgm4xUUdGYAEJeBmRvRyicb5dWMDCLcFiQ
 rwwaU0giwi8gyQMgWyg==
X-Proofpoint-GUID: ptWb0jxegcEYOU8g7N_3kZ5ITaGz3HRo
X-Proofpoint-ORIG-GUID: ptWb0jxegcEYOU8g7N_3kZ5ITaGz3HRo
X-Authority-Analysis: v=2.4 cv=Woi+otfv c=1 sm=1 tr=0 ts=6af5cadd cx=c_pps
 a=mw7aCRCFlb22yk7hlIuqAQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=d45nVmDthLegCht-j0MA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NyBTYWx0ZWRfX36XlnXxhn+2q
 NhKIVgJ/HHHqDeS/pajU7yelCuJ05UoGve7cBMH8ilDG/y9guh6JxHOJHRZuddpD94c3OfMCkQg
 rnCF2nMJ3y9FsR/nG3PHOEYDBnpnSPs=
X-Proofpoint-Spam-Reason: safe

Some updates are required to ensure proper accuracy on the cs42l43b
headphone load detection. Add the required extra register to the regmap
in the MFD and then update the procedure in ASoC.

Changes since v1:
 - Make LOAD_DET_SEL readable

Charles Keepax (2):
  mfd: cs42l43: Add load detection register needed for cs42l43b
  ASoC: cs42l43: Update load detect procedure for cs42l43b

 drivers/mfd/cs42l43.c            |   2 +
 include/linux/mfd/cs42l43-regs.h |   2 +
 sound/soc/codecs/cs42l43-jack.c  | 101 ++++++++++++++++++++-----------
 3 files changed, 71 insertions(+), 34 deletions(-)

-- 
2.47.3

