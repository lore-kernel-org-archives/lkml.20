Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794493311;
	b=FLaQXD6j1Phi/5IaWxWHfaYvorSGbyrzJH0Lt4kvZVHXAMLiAPOak/IuG/vBil5bnsLI
	 +q+BIxAJjHFeviv8lRW0ni/3zSyJNSdRpUu182+iVA3cSvFKqJRhTibqTR31TpGbh6GCC
	 E0YpXsk7qAC5bZCrl6cl0g1T9SV4WGcijp3ThwcOMmbnAUitkHCqLWy9fmttdC0e+LH3U
	 u37nelDZVpdyPRUnJ4uMa8uVJBaNnlmFqMI3uST5GWutvQvBzovJ/uEB83rBHoOOh7V0/
	 oSrwggCZ7V8thdqM5EX4WO+NudtlofktXRSFV5ryr8S0yBq3zF/4t+bSxrHiVnuqATA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493311;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=KxS8UCCzX5k7psee5zrCFMXfNBqYngyZjY9dahTxWH0=;
	b=Wj0bvclwVhadOdgfsjL01Yt0K1knwvCyTwsws3I+VjQWE/T5w1tpUTxT6YkW1RQjdJ5n
	 fqRJxjH34jZC2Xl7TSDVBB9DaCEDOg/E3ul1s1R6CUfL8wg0OyI/jr2zeymWbsBcb4S/T
	 3g2uqZH1Np9ZbGDd7ZJGck8c8UZ3/IDBhXf3yB8UwC9m5HGinae73jKd1hjbMN/vUaxd/
	 jVn25QBsJVItdxkvVVBrui15NszuLud7Ih5IahN21MsTqEnlOLFuusMZgRhMYwdt+z25U
	 Xy16crEXz9JSJg27geib5P6ZhlLMN0rpZHlDSQWZ8PCQohELSCjZIqKMidy4OpVfLHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=IyFZxRbZ;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=jNJpCQRA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973AA606A889;
	Thu, 12 Nov 2026 14:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 973AA606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=IyFZxRbZ;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=jNJpCQRA
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACEJ44N2168319;
	Thu, 12 Nov 2026 08:21:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=KxS8UCCzX5k7psee5zrCFMXfNBqYngyZjY9dahTxWH0=; b=
	IyFZxRbZtBOTpTiFjsVjCOfI0jt4LWlXj2fWU5XhM+7YIyaFL1b8hYmoRvdUmgMf
	BYXQm3rDhJ14odBr9DdV+dw/83oiGbRsI6Qn7v9Oabu25oPbAC3dr/rRqTfEyJAl
	HSg9VS5EuDLmQTl5qItMtQUFhGpXhYHoQCowoPQZpRNIvb9KpqvxyPROddXWUJzz
	EsWp9SDktvncQFBjr/ARcQ20bV/vwRq7DKRJ0ynNqf+J9kRgiqVCMzw+lTaBgDbG
	mwI91jEF74RX6ZKj/jcX3q8C96XsgiqoxOORryiQUDx5TJZdVFLjE0WxFqE98y3c
	Q+BdPqksVadSS6XyWzX0Qg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020091.outbound.protection.outlook.com [52.101.193.91])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hwcfpg7q0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 08:20:26 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WY2fIEL86pK10++LQ1r9scSeQ9vBVZYReGQGVml9uPtPeUa4UdA2t4zGuS+HztvUcRwHO5J5arcsxAmWrzj4e9igmmujcPWwfMdGrAp3sp/w5UvxFY8UrdKNvkWqjPRXSdtQRbvvLij8ta7BVpaPNcM75T9KYAoGVgJtnUN56TCD0kXZz+TaVws9Tp7WrMYXym/M3gcygBwz5Qe/nUizycwz87S7COTbGEIrWXSD5JQNQNYA5DoNBsVZcVKTmLwjuQwStrbDhudQEAtChbtTlvkWClHVFMnGb9l+jPGgvIE5xF8J4IxKb2vf4k//OY6Flk34SgDldIH2A5qoxIMKGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxS8UCCzX5k7psee5zrCFMXfNBqYngyZjY9dahTxWH0=;
 b=kXLDNg+crBHucUWA1Jwhykx5rEgkgDmP1TQX83D4rHEK31WkzIA2oAst+iqHoJE7wGk+1bC/TA7qphfJJSbAVw3fCbHB0UHvfEn341ZOl4QY6qZFWJoaUHYPBbJwMEgY8d6JOGsSDx3IPxMg59MpegiohEBOOtjUiRSH+71FqL5oRwJBeCPvXXo3+IlvFEfWju4WeYYUbVysGguL/i96NUmaMvOe9obBTdkr6c20+pLRBwoYvMh77DZX9VpqcqHrrywzNcXTabZFnJJTKOdoYrVBbG98tBERPIWQt9mZAN+J+33qrjqdEXwuabHaXxhdpYFf75KbdsZLOcWn0FO9DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxS8UCCzX5k7psee5zrCFMXfNBqYngyZjY9dahTxWH0=;
 b=jNJpCQRA0ATvkYFMOKw4tRZ5MT6mL9i4tlVa+dgVQT2yjRs07Dq5bdNZkgrfiPGT2fnAZaxtrSD6MrPAWIE+viXfFKmJRMHqMIO9jbY7OnGBSVMBTpNVyUzgx1jf0sVT5gOfaJoYBfGTI9J6HtcNqyAX3xv/ne9Rr63G8Ixk8o4=
Received: from PH7PR13CA0004.namprd13.prod.outlook.com (2603:10b6:510:174::25)
 by DM6PR19MB3899.namprd19.prod.outlook.com (2603:10b6:5:22b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 14:17:00 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:510:174:cafe::7a) by PH7PR13CA0004.outlook.office365.com
 (2603:10b6:510:174::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Thu, 12
 Nov 2026 14:17:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Thu, 12 Nov 2026 14:16:59 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C52CD40655D;
	Thu, 12 Nov 2026 14:16:57 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A835C822540;
	Thu, 12 Nov 2026 14:16:57 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        patches@opensource.cirrus.com
Subject: [PATCH v2 1/2] mfd: cs42l43: Add load detection register needed for cs42l43b
Date: Thu, 12 Nov 2026 14:16:49 +0000
Message-ID: <20261112141650.1931348-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112141650.1931348-1-ckeepax@opensource.cirrus.com>
References: <20261112141650.1931348-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C7:EE_|DM6PR19MB3899:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a810697d-6293-49c0-42a1-08df40c79db4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|61400799027|36860700016|82310400026|10067099003|11063799006|56012099006|261022075727099003|261021121427099003|261102123227099003|261009223027099003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	q2irjb8wDOEhToRWIB9EZrCXhu0Zp7qdpfdCU497IKxbuVzqtt6gZJvxvPJvb8XfnOhQOA1qAvylbhrmP/aS/NSfEqhgJ7NBbJxYWVKqmlGhTo8/WK2olLThSZVdFkI9yPsZ3AXnbMbohLLQYeL84D0ZbA+SwSS85JBTnC+a0V5baUBoCRXx/4qa6NfajEJSoHrmaloMSuHkTcIe5JlbOvkadKlIBuyGYdca3Oq3DonT3375DGV/gCJXtaM8Mh5kcnNeaQI4FXvD0QcNempeALeFGzbk7xfDfHggAKHJPiAwnidWmSJ9JmFGIu34ka0YL7dl/vsWEJC4Kiys5K2MQ201MIQGPmD4SvD3MnDTFSoEwlF5MnADOyvpJmTVF5ehQpxgV2JfyXFPNeSAKoWA13U5mmNqGZpxpIbk+xGt9sdjcpWSAz7dYPFqecju69lH1P5wxqYFQm+S3KMEDgtYTdYCcd1Cz2i1FD2THLUL14ZBoASSDcKlqAAWK99NLCIry+Uw5qXtc46aNFk/upCpQ28qQm03KtrPyRY4tdgScSQZWpi0rNW9nvVNCmWn0olMcDrm745EYV3LUJr5iHFFYcojN7If0u+v8J7NEmliGJXHZC8pHIYlXwbVqZ6yEeOXmSxMLuOnHeLmmpFyXAjcet28iB9oAtdBrfV5VrFUi/nZIlvuuTsD9pt7Uy++PhX17+GHKzgioi+SCieoHVlTnA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(61400799027)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hYLGA5JhHTOoYBDwnLdgUpjKs20CjeeEEbsZqXgb8yvkXdExOKsCfYVyq1tf0sYJCQ/wX2fX92gSoaM50e3QuyGpxBrjKhxf9V1/uw5CPJTw2svrBygYC4Fy09m6ltIEWGfxKEdfTfo9BzcuRqKA9deNP6r8jMMCREReWGFeipXGdNKrf0Pf5WY5SI/7NbTH/zSGlgUPgH4EcxLZfIS22BGCs10mas1qw+T81BaLykBKX39NFfszVMDcVTWh1vFKXywg4CimTFV7HKxrau/QYNBCAvkiAkr/JeGlxYDU5CxKnoa/jnJGkqkWlT8ftJ6ucMw8uvOex8C7TpJa/UrlMPtwiO/xYczA5HlKCkBbnkX+KdUaOE0j+IwVOA6wwvvlcOr23xCpO9s1Z5eKje7pp+/B2qDykUjl1XLRh77x66J09pHABD7O7xSy8H3rNgtC
X-Exchange-RoutingPolicyChecked:
	nYxORa2azqnbdUM3SL8YmCCbqld9agxHVAViSgqZT7FuCadqqPSTOQnLywuTrqfFNpfj8mED1so1k9IpTW604i5J3YrrK/vG/Wt68oRASq7lwbb/MCB1dNevzkhbOqBV+tpdZo6+3YEMZ+Owv6bP206Rip+dH3rJZKPMf6oG7bZliqPV4dR0/qAJGJZ/s6LWQ7epcgRIUsCHw7CoYeT830FYHAzuxKun+zvG47evYK4pMeNZu/ZLwwBiVDWvqdPbUu9GVYR226C6MHL48TWplrQeMGjlsl1r0tCAcCWRc4F2Jk+HYI1TXO+FBFLsQmyBALx1v6eg76+l+aE9+PDueQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 14:16:59.5238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a810697d-6293-49c0-42a1-08df40c79db4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000026C7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3899
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NyBTYWx0ZWRfXwvpBS5IovuKP
 I8cnSgGkNXqvumnPI1sDiHpNNiOrVRH25o/MchcXEv140gL/WhdFDKDqAKOMwEOG98TWg33XBO/
 xwZPPmVq/Kj8mOHwjVVadu6moQS2W8tV1fwFNejgLjPpL3pYepS1AH/3rJvJa36Mg7wTqDDUmRr
 paEBsCQjHGQKKOBjyHcJ0laqYvj4shQPTK+ULuygiU3nMRFcRb/3h+wWSgQxVAou0iZw5orEEX7
 lJ6Zl7mUR+6wpkk0BUuaTQ1AOFhuq4mb/l4euJLTh1WeAXAXOnlsM5RXJzwnPUq4ouihBcaEaq1
 nLgCWYyjmLyg6V+4Jhv0l6qxBH/zNiDRbEhOWhi67U774I0zZ27AfYi6ItXeT5+W1P2rqew3Cuc
 yzI2IMSsFSc117ou0lQKHNoNfGDKHzgG/BsMVaJHzwCYFIJxZTP+NvnzQoTionYirlwyqMZMHlr
 eLO4c3x7tQaJidhJv4A==
X-Proofpoint-GUID: suNynPUXsyx81jFdeyJy4E8aO-KTAZ2g
X-Proofpoint-ORIG-GUID: suNynPUXsyx81jFdeyJy4E8aO-KTAZ2g
X-Authority-Analysis: v=2.4 cv=Woi+otfv c=1 sm=1 tr=0 ts=6af5cb2b cx=c_pps
 a=5ZSM/HxaxFmkPuacR6Pmog==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=Jdv77o7UTSomuMsdqFMA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NyBTYWx0ZWRfX/SivfjrUucnT
 XKfsIAMXYsLaQ7HlE5q/efRm468UkjfInUC7ilZ/gfqB7LUaz63VgkoPCzYiwL2zh5rZgK/wkhu
 KCw+5njoXm5pDJHm1RRb52jDzH+SVzA=
X-Proofpoint-Spam-Reason: safe

The headphone load detection procedure on cs42l43b is slightly different
and require a register that wasn't used on previous versions of the
chip. Add that register into the driver.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Make LOAD_DET_SEL readable

 drivers/mfd/cs42l43.c            | 2 ++
 include/linux/mfd/cs42l43-regs.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index a83b62064dae6..76f2eba28aaf1 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -402,6 +402,7 @@ bool cs42l43_readable_register(struct device *dev, unsigned int reg)
 	case CS42L43_BLOCK_EN:
 	case CS42L43_SHUTTER_CONTROL:
 	case CS42L43B_MCU_SW_REV ... CS42L43B_MCU_RAM_MAX:
+	case CS42L43B_LOAD_DET_SEL:
 		return true; // registers present on all variants
 	case CS42L43_MCU_SW_REV ... CS42L43B_MCU_SW_REV - 1:
 	case CS42L43B_MCU_RAM_MAX + 1 ... CS42L43_MCU_RAM_MAX:
@@ -425,6 +426,7 @@ bool cs42l43_precious_register(struct device *dev, unsigned int reg)
 	case CS42L43_RX_DATA:
 	case CS42L43_DECIM_INT ... CS42L43_HPOUT_INT:
 	case CS42L43_MCU_SW_REV ... CS42L43_MCU_RAM_MAX:
+	case CS42L43B_LOAD_DET_SEL:
 		return true;
 	default:
 		return false;
diff --git a/include/linux/mfd/cs42l43-regs.h b/include/linux/mfd/cs42l43-regs.h
index 4c00ceae8b461..924438655c630 100644
--- a/include/linux/mfd/cs42l43-regs.h
+++ b/include/linux/mfd/cs42l43-regs.h
@@ -1204,6 +1204,8 @@
 #define CS42L43B_ISRC2DEC3_INPUT1				0x0000C7A0
 #define CS42L43B_ISRC2DEC4_INPUT1				0x0000C7B0
 
+#define CS42L43B_LOAD_DET_SEL					0x000170E8
+
 #define CS42L43B_FW_MISSION_CTRL_NEED_CONFIGS			0x00117E00
 #define CS42L43B_FW_MISSION_CTRL_HAVE_CONFIGS			0x00117E04
 #define CS42L43B_FW_MISSION_CTRL_PATCH_START_ADDR_REG		0x00117E08
-- 
2.47.3

