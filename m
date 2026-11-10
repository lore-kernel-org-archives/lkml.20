Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794310750;
	b=E56MKpZc/YBl6YgxEVf5PobEsKkz4FUbhwImI9Lgm2aQlrmaUMLk/eK0RUBvVQ+MmncM
	 1/1rw/3Id3mA8thJgFFUBygWzXZrLW5pj++Y79q80QMFEq99gyti/gOE2NGugf6gG59SB
	 zawwShug7gZO4Cnlfn+fiJbX2jPW9VRLbQ/ZdsuEmhldJXcVUThSPNctHgSvXjH909Xz9
	 +b/lQ9iapbueXfE97bAdhrlvp8MsUY6wSv89NovMi/JaaR4W6bhcfoF38uCPR/2IvJ0o/
	 2aa8dLzowACFGUYfKhN8HO5f806XBPwRZ4iLa5IhcY/6dBZ43woXFBMrEoCQaEBVk8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310750;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Reason;
	bh=1XYrCEm9ZrHrrreTX/cliUPO/D+Gn7KF4RLsUuUuI4w=;
	b=ODs0jjoYLB5BO8excWsq1/B1o9ZPNNTWMcMFagY/2+PSnerrqptdhB2dwmmPwc1e76J/
	 imzYPwqYkDwEy5LpgopzUePJp1/G+R4isJy3jmCPd4BC9Vo5isfDNQMMe3BPM4oup0tLE
	 nGUHLr6n9I+aNOHaBjFUhK8eaeph1SV/t65d7yse09c6bwyYfVmbeT4LvWqTcGp4xFr+p
	 Vqp0yIi71ry5rUu2U7heYtSEM7JXfIhrXTuh6VI5hg5oCGIbqSCX0YOcS7ecHcB0WQ0uV
	 7uSyxBNdv4vYPpseD42QuAe+O/OtOA33dBbd3Lt54YbcvKmS9sfTJULnD2xbZx+fcMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=EgaZy4PP;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=sMgHoOkz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C84B606A325;
	Tue, 10 Nov 2026 11:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C84B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=EgaZy4PP;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=sMgHoOkz
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABJmCK360847;
	Tue, 10 Nov 2026 05:38:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=1XYrCEm9ZrHrrreTX/cliUPO/D+Gn7KF4RLsUuUuI4w=; b=
	EgaZy4PPA7U3mbcn61q6HhezW6PIY8F2n83z6PxLX2ABg5nK1rZ6GaK07b/K1p+P
	GkluJpQJMYT6yz2E0IW71a8q8XyovgepqFcnbVg0jZx0PGoy+LZEDj0gkrzI4zvw
	OwWnoSQt6bh8izBRMfZJTVBXgtIrhMBLi/4VT5bUIknHjCaajZwqw1YLjwi0BGM9
	Hw4HdrsXZntIwUcpWBltJG1BJVneQnCR3M2rLCgN+2SKSggqx4biQxJz/ygncvwa
	lLu9PE8dJciDzlIALP1jfd8iBjdG7oVaQUYXMvyRKo6+CQxUytUmGUs5pL/BejkC
	7PjuO9i4x2YSVqtm+BXMZw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023076.outbound.protection.outlook.com [40.93.196.76])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ht29hbga6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 05:38:52 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rmgIOM/rl0eZl5aAz4xUQ0T4/+cdSzQu/yrA0I3TIFkPtK8ZLGfU9YCkSEPn9g96AEVDHZSjTG4XpZ2gSXDDPtd0D6+JkhM4LVdy81aZCGb4H7A3SPEsw1LndR6hbYwL1I8Dmt2ZXNOCgmlOZFUExu8nCThbAClj0h2otmew6jOkfu0a79nwB4CQq6hoDcoxZn7ZaQsra8wTdRKTJNZKfBvmau6/jlPVMpbtae3J81/ReMLIMyorJfqL9NtAKVM2mjiI5XAhPSbXjCnTWdH4UPd/eiTnP/MqkxeP4FXDysT6+mn5yVXzBl4D8UFvWvB6k0ymYXvRq2JPTTxitZ4S5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XYrCEm9ZrHrrreTX/cliUPO/D+Gn7KF4RLsUuUuI4w=;
 b=ZuQGIaqGPy5D2pBW0ZEBFv6fZS2zJ3LGzrUaYTV+2EXgOR0MwnIkck0xYysGLA2rP8lO578l4XhwTDHM4or6feDNlB9GFN2uCQdaxlo75mFpuP4Zlfg+M5OsLUfdnkt4cR+yPzmjCRvR8DFX9mBx13+JFI3IhlsRZdsysPwZCsgQnPU0HCKKqXaNeJT8TWmuBE7JRN0J9TrAkQYr2a5PrWGjVrCrnlsrtVbwr3KD+mFXga5lkhmDpXAlUCXtYRf60fo+Hf8IHFIBYWYNFZFPYAE2GjcZHzVyK/+iYxACqTfGCUtE24Br7wzqiWM9dLFYkjMapeHOU3yVXnDOhdDipw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XYrCEm9ZrHrrreTX/cliUPO/D+Gn7KF4RLsUuUuI4w=;
 b=sMgHoOkzxqvXz9WOFcew938rzior9Yhtn/pqnFZ9gct7HjkW9fz03sWdcfLEhky/I4NEYhCJEZqOOpScrANAMeiezn2Ue8sLpjnYOxWf719KBTqwiw/Dk7L0rfxZ0bje9+sB8SMjp0oKPdR0lrhd5tMMpDigj64Xvpq5t/Q0ZVY=
Received: from BN9P221CA0029.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::27)
 by SJ0PR19MB5367.namprd19.prod.outlook.com (2603:10b6:a03:3d2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 11:38:49 +0000
Received: from BN3PEPF00022BD7.namprd03.prod.outlook.com
 (2603:10b6:408:10a:cafe::89) by BN9P221CA0029.outlook.office365.com
 (2603:10b6:408:10a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Tue,
 10 Nov 2026 11:38:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF00022BD7.mail.protection.outlook.com (10.167.248.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 10 Nov 2026 11:38:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F29C3406644;
	Tue, 10 Nov 2026 11:38:45 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D5E62822540;
	Tue, 10 Nov 2026 11:38:45 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 1/2] soundwire: Improve channel min/max comments
Date: Tue, 10 Nov 2026 11:38:41 +0000
Message-ID: <20261110113842.347883-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110113842.347883-1-ckeepax@opensource.cirrus.com>
References: <20261110113842.347883-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD7:EE_|SJ0PR19MB5367:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0da8a838-ac2a-445b-0865-08df3f1f2f16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|61400799027|82310400026|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bHaswF7aZ0ELJzstNmYJrk8zxsczbkNfrgOWCIgin/O+5cO+EfL3sLDh/S3TRr+idqHtXLR34CQ1w1gcO5c34k6v/Tt6yHEjnnzM+6LBrWb7UgSilRl6KHAqZGgfC27pEDqX9R7oafNeUWGc+kIk26x6inXe4WMzHPSYNN2R8kNuLk1GzfZGCgqv0yvO2p2mSseRGNhMpk0dNBA9/Gi9ni8AK5oUfr8CKcS6UefGU78YofWSPeXZ7anC305vv7o7RQGMt9eTiEt9MvefZ+7IO7JxZ6he1y/4GiH//+rwZiiHwLAhv3++Xe0wq0CVYijoqnDaJ6RfPBE8PWZXBp7JeDUxdLePk/Pt+jnmTu9m+BpqyfEY6OwBmDf5vnkdCHgxQcQEuVc51zBfHD6OW6nwmQ6cPt/nCPMo2gWNz3Hz0/JXlt2/M5jDCot8/8dEWrozpeE2uy+ppUrELLYlPQjMdaAnmyrpJPCjxiGfBZuhxz7A9+tMt/rbYZlljfT3VkWGcLGjp28TkEro6TpyJGfJvsj4eJgzFlTca1W4S647YmpTqx1cbTI4Ls4tIr2XG5tgo7/D7Ezus99Kf15kIRDQPUJynGM1Fi61txnI+CCUPl5hJYcQKScDFR3YF/TGpksvJhUoI6tBnd+PU/XViGxlRj2ecG1YExaCIzubdC6PjyZB330jvoKySw2tcZUsLxakhOe7f4irqaPHhL51iwb8nw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(61400799027)(82310400026)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	55rVKVgFh7WDkPRNqZU5cLc5/8Qf8+tcKRmu7URoNguipeQVdapU02jOXDo51ckTzUsCoW0h+WJRHa8kwFPS3gHFAnbGuScKpK8iGxGJILLzXdxlxxjhFd4L7mGki5UMvKkj53MPyE8iJHdIrYRJatsza4b0odrOijNTOp1ChtizJk9tV4AHSK0e59YvwZ+M0ZYdQxSWQRTAjgPcaxjry5HQ6i/7d0DP6aVA5fiUbVK2FeBLX2fHnxRbNuGRXASuLcX99wLSbvSPb6IYqWwllaSnmO4ylh/ebCgJgBE7VC/MZmv+yawOdLBpZ6AXSMsJ7RCb7asDO0MZ8e/VK4ElNkM4axJxm5cXaunhLiv1z05BhOFMG525Ld3eYFEsJuMwBV7QYtA3+U0SSsYIeVQ1qHk3FiI3AAuE95vJJTYdfIyvSoEXohwKsvR54/IwHWiY
X-Exchange-RoutingPolicyChecked:
	vWbzn49rL6EtvrfsvPDZm6t3CauLLdGaspns2wj9etvMbH2Pp8Ril7s9XH5HDgmXPnl/rC+PCe8I2aMTutSy1tytGH8rqMBJOIi7INduq9bqnDwfIJA8R3ds6fQfPqDyKpztxoQf0LX+AeEOdFawPpcaFcOSUNCt4TLUjuwCLDgMQjQ/angZ0tZSYtHO9WCT4X4jKcLfk+Cmz3GATMxo85ugwTgUnvGBIFkkPBAPcmO3ll53s9juUvNsIf2klOZou992o20P/tKIyPzofWE5YXvHqk9XLTVBBAuey+VyJyuIM3+gHhQqiZNG+W+KDptf5szeG1MYHztjzgV/u0/HoA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 11:38:47.4274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da8a838-ac2a-445b-0865-08df3f1f2f16
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB5367
X-Authority-Analysis: v=2.4 cv=PO2aavqC c=1 sm=1 tr=0 ts=6af3024c cx=c_pps
 a=WCj0fYrPW/3OlnWPEMveVg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22 a=w1d2syhTAAAA:8
 a=SIj0_KyXEq0NIwT9P_sA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NiBTYWx0ZWRfX4bDn6OckBQoE
 Zy+6rau0caLGfH9y+DXLnQO4y8UUVdKoKQ0xMpAMUsi5z4x4NT27ic1JoU6AtpCwGN6Z1u684bR
 KjJdKB6hTp9cSajAGEva2fFm81GKMG8=
X-Proofpoint-GUID: 1IA0nALFBorPKv0Y4qOrd_ISTlfzARL_
X-Proofpoint-ORIG-GUID: 1IA0nALFBorPKv0Y4qOrd_ISTlfzARL_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NiBTYWx0ZWRfX6HUu/qSyew5/
 ekCiAulRGGMlycbMnaNhxmdqgh56bfLBArXIQJwxyLEoCSe1nuYpwp65riQeiL6WbATfr1tgorG
 7jvVPEt+msTy8IoeoiLqPSmIJRr5ZPHvT4qxb+xu+xBXBh/8CJMnOC19ML3ueaiW43NM71ygCcS
 vou0elgSSVlwAyLmPflNo961Jb6FnBRFGd7iqyqG1D+5FHAO8IPRszZZ5mkvG6nLz0I6cnGodHn
 NOi6DUMr42LQIA6qUHN2gzX8QCZPbWPAFd4LJGBPE/tPU0aUcYa0THJHy7cv1cG5lH76Pkag+Nl
 dDO35QEjNzbLCoHKGhJ8eWwMwu2lt1tWPtFUQp+k6No/US25NbKzzcnfUXLK2GcAGpkI+1h2OOD
 HyI15a67Fw50rofjfvwF7WqWRdRAUJj57AS/WrylGAqOL6mHeDOO4rJkK523lyWzMVNO7XnoxHX
 yYse4/kvPZ1ACTEg07w==
X-Proofpoint-Spam-Reason: safe

Presently, the comments for the minimum and maximum channels are
misleading. In the SoundWire/Disco specification these are actually
channel indexes not a count of the number of channels. So for example
min_ch=4 and max_ch=5 means that 1 or 2 channels are supported.
Update the comments associated with the structure to make this
more clear.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Update wording on min_ch/max_ch comments

 include/linux/soundwire/sdw.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index f710e5932b4b2..b8f5ad39e9b37 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -289,8 +289,8 @@ struct sdw_dp0_prop {
  * @ch_prep_timeout: Port-specific timeout value, in milliseconds
  * @imp_def_interrupts: If set, each bit corresponds to support for
  * implementation-defined interrupts
- * @max_ch: Maximum channels supported
- * @min_ch: Minimum channels supported
+ * @max_ch: Maximum Channel Number of this Audio Port
+ * @min_ch: Minimum Channel Number of this Audio Port
  * @num_channels: Number of discrete channels supported
  * @num_ch_combinations: Number of channel combinations supported
  * @channels: Discrete channels supported
-- 
2.47.3

