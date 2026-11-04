Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793791025;
	b=w2k0GokCl0+hCotkcMEscp2dqaGBWq5ZtGDNpJKtKUGvyi1gn7FvHtYknsGnNG5IYtZK
	 9HjSY6JRZrveej6GYFPxSvJmid21t0MvVL8bTHcI78s2c8I6vRxyoc8Pbh5IXqntM9Ge1
	 MzBiYDPWuA7WxqajWUQdwsIxc6hi6ezFBKGoyBjSbnW1YXBQLKy1UR96tyBqRDHmvR7jh
	 EhEEiM51+N2/y2IYI2/bbTkd4BManSvn/ZfRW7I0FaZG6f/2PNz8XRdNpjPpK/xWacJjv
	 Eghp2VbRDlObSZWLGRE9JY1xlQaQjIyVzEk5fEevJPoEPbiv9tH2J4WyAuWEgtxE3Mw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791025;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=ihzzu6tQI9SvyICqTajay1TNK1z90s5olOnEvxcvzvw=;
	b=Rm8ARVDYnZgOhv78pYgxAjjEp5ZEc2lhUrF8PpxDhoPKM5RNZbb7094Y0Taripq+VMRZ
	 ooVtPjnStBtSESsJiUY3xhCsl4apNZPyTDeH+ActcLmrfSAggwG/VplQHlqZBiVqgR9Ie
	 7pxswGSWzIXbztam1q64cb/PNnMRZ5cj51U77ITFxoiM9guQPgzo9SbYcS516KJzcZvWO
	 iYRRfl8wCzEU5x14JrKly4SQGiI0Q8MWP+W4kE1qrKg3UVujkUkFj5Ai+SK7ooV8LE5Fc
	 HBFdx+/b5rUWn/PRr+m/OcMcDv/W8SouSRP6Fc9RZ1BRWGf9cnkCNYXagDHu3bYV3mQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=berRZ9Uh;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Hy5NC34a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB73606A31B;
	Wed,  4 Nov 2026 11:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AB73606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=berRZ9Uh;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Hy5NC34a
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A45F74A2656711;
	Wed, 4 Nov 2026 05:17:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ihzzu6tQI9SvyICq
	Tajay1TNK1z90s5olOnEvxcvzvw=; b=berRZ9UhUz/3QZAQvEGThuSY0FvMNCjO
	zoG4fFBLGBEMtvO8f4tXA4oyN3hCOxZ2cn1tCfOF6FhiaLETwOViV/Jfk1nRSg/s
	qlJAS1akb7hlPspyJoq8+cJuYy4A7R9EyzHA6Bm6agzw1J/pipafkqrvD2s4WQii
	yohxEZPWXxrEm692fM6ouD5s6Go7x0qXHxUgsq7ukMGpDUnK+L/RpP/wGnVyfB4/
	E0vvAlcBYRMhDfcZ7Zfy2fuhtmG3//SraVaWyvPMkWLUPoCRzx4bnU9OepsklCtp
	P1DJrXSMC5AcChVHI5fBY7byg5uAmbjPWFEG9AVz7+CD9BS8fFNNyQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022110.outbound.protection.outlook.com [52.101.48.110])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hncrfwgjj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 05:17:01 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPEX0D8OdNcw6P/in6cxlgVRWmMBKZ2BBkWeSII3pxJn7qN2htoOOvMX0/7XvKXosnDm2z1xnRcMieZgPOfiJCvZ/VbQygcJcWIImf8MHF5RZa8NqbdpC1KNDHS7QFx3eSRJxSmjIFfqySkuQt3/qnHgL17sA42NKqKRFU62F121fnz3pVBzgekLNqk42fT08xnohX+lBCK4PfuUCOcODYLYy20OB38O2ymoQVr30iMY8L1R+u5P0UimJy+8Cp0sXN1FnPizXHIuf1sJQIbWx0k6RMeTuZBX/7excxEdS88+midOEXQgjSTO+zqE4Pl7QbZ4yWqTh8zqxBE0Qn6NXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihzzu6tQI9SvyICqTajay1TNK1z90s5olOnEvxcvzvw=;
 b=PIDvuLP9FcjiufvcTdzo8zNhJU31iEhsVXI0AWCrR2ccYDKhb5TIf6MxHnG4wBjrzx8ue6Zz1Jn4alJVtiSOqj1OuV2u0itTirN0DvogUpkwMOrNiAa1Krg60Zi/SFFNbSAW2xUec9f8xxv5MYav0CIL+R52s67AfE2lM6GWwvXtQoStvJCBxSS1jJ+d2nokeBAA1nDGMzq3QgQlYqAb0rN9cgRyQxJB13o+P9rn9WapsnlcpKRndVQ2lxn+62ZflhdId3CNR+DZ9MXTVoLtJbqpMlLopRhg7R6kv24XyDKuDgB5QXstrywpnSZH80TQtXG3o7l9gasont3c/LB7yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihzzu6tQI9SvyICqTajay1TNK1z90s5olOnEvxcvzvw=;
 b=Hy5NC34aQbaEOValtNTytJYkMHBdfJONgKJCujHmhRN+njQEuQVhxpX507Whq4wx12h1xvLU6GH+VKEMIC8Q7rE7j/M7sMaqBYbfhveUY7tjSuky9tXkgesQzrTgp3/MyWwYHRQHGWcihVF66Lu4LA+uyy6urTx36ZI9ctjYCd4=
Received: from PH8P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::22)
 by SA1PR19MB4928.namprd19.prod.outlook.com (2603:10b6:806:185::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 11:16:56 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:510:2d8:cafe::2f) by PH8P221CA0021.outlook.office365.com
 (2603:10b6:510:2d8::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 11:16:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Wed, 4 Nov 2026 11:16:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0FC0D406544;
	Wed,  4 Nov 2026 11:16:54 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EB961820273;
	Wed,  4 Nov 2026 11:16:53 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 0/3] Improve pop performance of cs42l43 input path
Date: Wed,  4 Nov 2026 11:16:47 +0000
Message-ID: <20261104111650.1079215-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|SA1PR19MB4928:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1e78f32b-9f3c-4f4b-acc2-08df3a65229f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|61400799027|82310400026|36860700016|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|10067099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	C1ftCOv5NToY5MZeKq6/cJll62GMLWlilRM5QllFAfqfubdmA9VjzFuB3bi87RbfHrXzFtRWFLwu8c0AGN8gUrbvIcG8YpkbUxXTjX1KU4bDsOJ75qnS18RLysI+edISOmn0zP2Zaafm99eUEsMgV5G81fjVLJz+5cPx3WtFb1/ObKkXOGqhV53YADeJ+p3SAE00Awfpgbv2r9Eq7Pihbl7+HBhA8CNCd4jtKcambpYfvcy2/kXGPdGEmsNamuecheckG5NigHmzJPHev2NFys6SqF0Y8naJNqB/y9W436O+z5QHLwNQXVXLX6LGO0T5bwwDoOtT01zQyo/ZJ5utL+Iiunm8r9GKx9oshf6/rF4hjSFpSfJ73Zo+BaqGLc7bGseh5S8ucEtfkCJu12XdraS6NQGzZ58WoxuqGa/1tkeLjLgo7qQKd3X9n0q72Uihn1Thc9RzCG0nAc3K9ia8QayVS66hAvocMOz2I/7nw1xoOQwl9dZB6f90acowLTzqO/CehboUntUtEf1LkhnXCJlDnfYXgayoYKAlDCtcaIX2AcOGpRihoMnL5u0oLCq2ePKt/3/Yj0ykq9ZYxLb7aI76DNUQ9Z/deYFYfrx0ZtWVBUsfY6alArlvRT+JO1Tj/gZxpPK0b82HZQTw9irD4VxFDo3yQ+mEx5N9ImDk1tEbfVenNxAGlduhzZHY9deo0ZOZjTXsARTzhQHP+WEMkg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(61400799027)(82310400026)(36860700016)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zR1LFItFEkWhfO7YWjrCeRORYz6XXeXhIEsU7uF/rlZHTphXGTeu8hgerAjlTJIGGVW0YiYwVhbTGttySweDkD8RDgyOydGdrfO3au3PgWSnNrilqE7EpXRp+OMa+wL2ZKmQSMVY2odphnnFmqxXIiST6OEp3ElvG/7KvCeUnKhcJ8rJ4NrfoeppjBZC2w+7OuIxZgvEVE1wloPYdY3mJjdC2Ltvpcv5e/3jX3Ws7VcWRB7RsGXMS8BvMUuUUuDWgAvYALLCtr7iDLo4XFTzoJOFo7ahgmiHs4oOjoRF9Y95tF1kmuzAMiNGLwjMxJB8AASamg49a2IBa2AH5asY8Zpn1EaRWlpQK3OtB7oIG6xhmc1Fi3o62Pnb4hVhX+vAf9kJrE1KnSmvIInkpmpY0eV88td8f7AhHDW+IlyJ/CmemtnUGr3jSVPNuaIVIP0d
X-Exchange-RoutingPolicyChecked:
	Jul0skIBh2rLLXF1fs+KKUPhf10TCTOTShltX5IbSfR1cTfC+hmdX6c7C1yonbMtOYrqykYQphtf+Ooi0iKygQerjyJ2de96y1mMlkTO4HkK8iwI2SmxNKXgvw9WvOLT8CEQznEvoVrMugTfMSJMojQnChnyI4KN0linOLBajJ2vSD2M/mOFTXfCna4NnR+j922CvHtkTFGvaFTNONvHBqWn7/Tq+lu4TKb+hlwlCogPoIu/Dial9osX8sg7aHsWhk5ANOwS7jtBROv1OI4yhLo6tACiF/NfVnxnBjWLNayPZOdZHZL7s65eMhZBY7y813J4DUnx2oKTxxtUSVdJ0Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:16:55.3751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e78f32b-9f3c-4f4b-acc2-08df3a65229f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB4928
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0NCBTYWx0ZWRfX2xDxVyk72nHV
 MEamHZWycuD/tB2/qh7rGyMz1+motFDcVTANLWNJjS+oqNpSl+0v/Wub0dTUo9Y1CDtD8Oqkyo6
 Ng7WPKMZZ9oc7DCPPQuiK5f5AjMPt+YpC6u8+rfheyinJzqS703VgN1E3Z477TOzxFdL6dKYnWF
 rqRPlsmG2LsSq3CJHAuR0lRIvENxASH2QgcM6iANRRDdvA1nqa0RzsJ3Qff8zHSVPKAGFQw6k4u
 pbkrN2NvV/jrlZ0aSRKmUcuqSFc/E4R2p+4df097pMe96lLzjoqGFOuZCxJs0adQlhtXehNV+Y4
 0cMIGdRRYtJ/oraCMZrHON0/MUelnJl0nNOeaPqA9Mo2Ok8u4IgJKv7LUx6EHc1yQ4jiPcdSeXA
 Cjd4vR4IG31BnKEHedFe2p5IwwPOo4tStkbxbSfnkO/dQxdcXmUVx7r87kQBE5yRo0xA+6a2yCA
 Lr5xMpyp6C8KolJvfag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0NCBTYWx0ZWRfX2jiEu7kY5/Am
 3UkCybEnPig9mI2CjtUla7gYYDfiVqDVmMW4v0FC2Ata9BB0dXBfQ4ZKfmjF+kIWKH4ks9cD4l9
 3YHicHKeSgi+EYigTJEyP3rAH9ZYP9Q=
X-Authority-Analysis: v=2.4 cv=LtgHWXdc c=1 sm=1 tr=0 ts=6aeb142d cx=c_pps
 a=ylTaWg/OuTOBUQxDHB/KXw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=c52L210Bym4mdPEIlocA:9
X-Proofpoint-GUID: odPjZRG1qc6f1QHrfyryINPss0BSbkiN
X-Proofpoint-ORIG-GUID: odPjZRG1qc6f1QHrfyryINPss0BSbkiN
X-Proofpoint-Spam-Reason: safe

Some rework to improve the pop noises associated with bring up of both
the analogue and the digital input paths on cs42l43. As part of that
there is also a little refactoring of the DAPM mic event handler to
switch over to look tables rather than switch statements.

Changes since v2:
 - Added missing dapm lock for DECIM5/6 on cs42l43b

Changes since v1:
 - Added static const to decim_info arrays
 - Corrected order of a couple registers in the decim_info array
 - Added missing dapm lock around affected controls from new workaround

Charles Keepax (3):
  ASoC: cs42l43: Improve analogue mic pop performance
  ASoC: cs42l43: Factor out decimator startup data to an array
  ASoC: cs42l43: Improve pop performance of the input power up

 sound/soc/codecs/cs42l43.c | 237 +++++++++++++++++++++----------------
 sound/soc/codecs/cs42l43.h |   3 +-
 2 files changed, 138 insertions(+), 102 deletions(-)

-- 
2.47.3

