Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793706593;
	b=X76/nn2iwJQA/UYP34KD1kTej5cw4cn5cQDuJd5LqyAVvqUzjIuYAWzestEePJBxUJas
	 /76NVq57E0WyU6UsZQUVLaSvPm3GvvGNy4E3EVLktpRi7D6NSPVLrIfeZbQ4y7DMH8rxd
	 ICQDxry1yvXMYVxxQN6tdEykP18x7ojdJw6ejcUB4ZTV+o5Qsy8BpcLL9tP4DpomrLzgE
	 6FdVpWTt+WvtNJelz1qcPE+Noc65HxrKWK5W8zbxqUVi74yqLnA3kLW3jye0aXNohaejW
	 W3icE/hDUDxI1M6V5s0QF3lx5Q9nRpe3mKRX6awzMYZEVe8VkdXkNiJQ/0oXEpfg4/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706593;
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
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=gE2HKbBISZk7QlyMxwjq1yBZyB/bVWsndolgDWdHK2I=;
	b=DyJEYdiMmzbYN1YK5gAHzOM69K2QphMIHrrMkmRiD4GEN+02k2vXr+/fe5+MOe0DZ1a3
	 Se/iOzSZv9Y+suvdc0TvX0EX1/qbMD6pcEjHD0EvIaigdZluJrf7LTdQy6B/W0M9e2PDz
	 zg9FfSUPRDNbGPlD09nzXtPHZAprGGOVQczG8TwGE8Hd/XC7JtmNhU1JXa2q/3s2YdDhy
	 N5rkB6yFUj4L7NWo+no9g5kdCDHAMQ+Jkz7Ip0xem/QBgvsHH4vLd/s3L3sbNjjM70lyW
	 pmDKCI40BhadytC0rjrvdlaSZcrxJYcPbNLFXDlURSaXNpU43yYv0fCQ5kcga3qaftw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ZHt4WJCp;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=WzWycjYQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71113606A324;
	Tue,  3 Nov 2026 11:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71113606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ZHt4WJCp;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=WzWycjYQ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3Bk67K937739;
	Tue, 3 Nov 2026 05:49:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=gE2HKbBISZk7QlyMxw
	jq1yBZyB/bVWsndolgDWdHK2I=; b=ZHt4WJCpFOjyCv5aYTodnH2CL50T80qywv
	WOajESrO7obC0cmGkRdYXtI0eSPDY3r/JXJXBTBCSdn5Xqd85laUmAwdt3bRcoVR
	tvIh8QlrSURyqXBs3C1QqxCZIXVHMYJysjgkK1Ttm/yVE+QXafRs8w6JTenYyRqF
	/ZK2zlsFszy2rP9QQGYr03MwmE7UJOGGCrQXhaFFrhmF2dsS0vwPo07oJlY1qQm6
	1zM1cvZU4H+eq2lOGprJORFoPOdbANe4rURAvQu3poNTZtFoKBTttqSbb8VgTmpi
	mDiS7xQ1LgP+Wi3MAAK9cw/b3rUIJ12cEKFDrNDRqHsj3+ovGcVw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020141.outbound.protection.outlook.com [52.101.193.141])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hndrfbcke-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 05:49:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4s9Klgvl/ZauIiA+cVJtgpNpgUNttt5+nbn9m8WnyYXnI29kXvaajVDxm/qLnWsB67LDYkg7m+QOa1Rkvn6AqhipU1wSeQ5WR+Onm01+Y8+ZmiWyrfWl1wDiGRAh5RQExB+woVbaVK4bd67yabUAVGKjPBnu0iDEynD1BAzfp+eC843Ac6hKn1ye3bx75T7Pmj7ZUguxc8fPR8IxCg6C/ORbs5vPBaH9oySzLbnV3kZQqBO928nBEQQzbXmjt0+cgOvUe5ID3sCjOBxdTHsYUnaI9hqOkD6PL/Jhuh8PaCKOH41+7qhvHwYwHVEZioiTbNoF5kAH8N4XdDiKTk6IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gE2HKbBISZk7QlyMxwjq1yBZyB/bVWsndolgDWdHK2I=;
 b=eATj3Cq71xFcCmf1I3D+rS0BsI4BkEvBzVsvNjzRg9wdh5tGwqITJIBl0SmRefQ1fJB9IQGsUx/OPHMNzf2W7UOMe9S93nMhZ4Nhk65iwr8indvHsyKox45VOY9SuZZqSP0f5vWh3FMkTSCQF8JkrRl3ASUD4jTN/uOKtVz3LNiBY+vqec0Z5e0Wh0T/JYDPdXsX8I41NAbj+Io5HkGgSKiTRxi68E+ViuDKOFg9RffnktCnsxrVUhEjZx5N7/fzM1WkCV8xTZd2unOtQfvYfbqZeI0BJpzG/rRv/gOmrhdiYZfA9SW72x1vncCq+LQ30x4y6A8GFU9fmUwA1mEFSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gE2HKbBISZk7QlyMxwjq1yBZyB/bVWsndolgDWdHK2I=;
 b=WzWycjYQ+6DNvKu4eeeukG0Yvga21v4uwV/hDgWZv/0WXq7olxF4BOoEYQMo/qX9eG/raBeXmh5Mjf2J42Lfj5LbyytA96rzcEY5WU3P49BhictO/GIs/eYWqGbxtAl0DUmDJROdmZ+E48WzVi1xbsbOausmstXiwwdiS7sEDHs=
Received: from PH8P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::30)
 by DS6PR19MB083644.namprd19.prod.outlook.com (2603:10b6:8:49a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 11:49:33 +0000
Received: from MW2PEPF00014679.namprd04.prod.outlook.com
 (2603:10b6:510:2d7:cafe::5c) by PH8P222CA0001.outlook.office365.com
 (2603:10b6:510:2d7::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 11:49:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MW2PEPF00014679.mail.protection.outlook.com (10.167.249.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Tue, 3 Nov 2026 11:49:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8DE4C406544;
	Tue,  3 Nov 2026 11:49:29 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 75E2C820273;
	Tue,  3 Nov 2026 11:49:29 +0000 (UTC)
Date: Tue, 3 Nov 2026 11:49:28 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 3/3] ASoC: cs42l43: Improve pop performance of the input
 power up
Message-ID: <aunKSJaMK19S65QQ@opensource.cirrus.com>
References: <20261102155440.3995136-1-ckeepax@opensource.cirrus.com>
 <20261102155440.3995136-4-ckeepax@opensource.cirrus.com>
 <179363922126.2092401.5458739879351265933.b4-review@b4>
 <aumr31DImHpXqwxm@opensource.cirrus.com>
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
In-Reply-To: <aumr31DImHpXqwxm@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW2PEPF00014679:EE_|DS6PR19MB083644:EE_
X-MS-Office365-Filtering-Correlation-Id: d1a2ab96-e5c1-4c24-86cd-08df39a085d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|61400799027|36860700016|82310400026|261021123027099003|4143699003|11063799006|56012099006|261028144727099003|261022105027099003|261009223027099003|261022075727099003|261026140227099003|10067099003|16102099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	CI9Cx9061f6Bh7OqsFFrkvJD9x4bgi5OqktXEHfhy3C7Zf4/ASFn7PJw4c7F+H2TfjlU13mWX2TRdMYvnM6qx8kTfuDZky9mtEvO7M8goaOPVUQjxPuZtveiVwCYN4FRO8UIys60LD7Bq0zQGfFJWffkIOxcmH3cTEOe7+dO7zktz/cWMQiUws4wGV8YC4NAe9Z7yx/W0ShG+OEVIhzpJKC+vivz4MJiXmCjwZGjO65clSJyRK9cse2nIfKY46L4h6bRXdXgAgPVkmJqRXLLF8GH7jYta5xnVXhRb1oiQ1dMhw6kmcDlY6YIYI0lf4ETJSk4V22N/B5Edd2DgvCk5a1VowJkiyRzOp+SYBxkmwIkXpodnMRXrY9Y9tBMZMqVPEYUHJt55Fuvi5UQ+/k1+AEHfCrWEWj8pfwJ0g0T+tSxyaE56OHgrs3jHvEEt+osqto4fqas5K5oSlmEG6iPYCQXNX4BAclAvV+hLhFSIIj4aW8+YzZggZDJBI/l2TwEpIzSgMMYMn6n9CucNd6JSZFApcOf4fmE2EcWHDoIwvjMBUFtHenN8WmiqB7w8Nw53jZz0A5vtlFlFcwkT8b9V8xycQDRjnhaVemb0xUGDc9Kl1JBcWWnJqN8DxLxfKsm41W3+DRgARFHOKUXzt7U1w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(61400799027)(36860700016)(82310400026)(261021123027099003)(4143699003)(11063799006)(56012099006)(261028144727099003)(261022105027099003)(261009223027099003)(261022075727099003)(261026140227099003)(10067099003)(16102099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Cm+OwQ2fZJWdPSdjtguws8eGTy5j34rs9yxOH/USosLo5Lyp9GFbtewFw9YFfmFS3FINrxWt9yH6d0wvrKzFQv6uiHwY9H4kYG+Y1NZbLZ8YFRz6afIjphzjiK1UTdQ/NTU5nwF6gqBOFqr7m/KelXEN8cnqiKMzE6PU33K98pw8ITSDSiPOQ628riPcA6fUxox/OUNepCZzRKsrMWA+ztyoOYa300v7Oh441B2rRPRip9ZrEd0MFt2+a74T64mq4O2wXBitzJQ7cTvr3VHa6uYjzYBIkovnDmsh8Huss/nzCE4B6eDJZuJz3AIVnYCvjTC7YFy/sArytODujYXwDHPVIxmIoSvxib4HfJpaVuFGsNFjK53jiPAYRwnNvrmTqNMj/Woy83f6WWr5/ZIgsauLF8YA2Y3rOn/8DcIenaVeadkg9950uCD/k7M3EOsu
X-Exchange-RoutingPolicyChecked:
	R2V9ug6QdVpaGdwJauI52LrAeLCmgYOGCjG//Oi0cSLOkR4dJp03ysVuu5cNTXtxiIguM65MzmaotvdT6TIduKUeKlctCbum/jSth6LJ4r/8twkuFbwGxq/dKquwnU7kfjSy8HoIiilfgYx0buhVzDmn3UutU/gCADvMKxCVp/pS7mNRUnNaiXWcwASyZzaKiqELaGQGsX4b3FfSyEGv+kaZdQGBXAnsE46ETVxrKVjRCPYI1KFMmcl7F2kCu0nNxrepcbnYoYWakOijlGVIGQ+E0kMDVmQ+CgfdGvvUjOVTdN4VL60wqV3yceILMIWofNpkgjR6Ilc/dLX5/tQvIA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 11:49:30.9613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a2ab96-e5c1-4c24-86cd-08df39a085d6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW2PEPF00014679.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR19MB083644
X-Proofpoint-GUID: 4-8GTdD1aguV_vGxrrbP7N8Qj6pLmsPx
X-Authority-Analysis: v=2.4 cv=HMRWhYtv c=1 sm=1 tr=0 ts=6ae9ca51 cx=c_pps
 a=GGp2JTg3dHMzCsOndft0Og==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=c92rfblmAAAA:8 a=w1d2syhTAAAA:8 a=__PPgverXd-HXMXQzXoA:9 a=CjuIK1q_8ugA:10
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: 4-8GTdD1aguV_vGxrrbP7N8Qj6pLmsPx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfX765+0b27uH/9
 fZpmRWTovVzhWQdbHr0PAx0VmFvX4yOjEJ7MePnE4h5+SC0a3DnXXb5ghS43CMYJY5wzpGtKP6E
 C/0HRah44sEnrtrm9l2diF5Fn5p295QZ4bmTEkXJeVsK+bDXAwRhMMKkROs3C71OYgzE1wvp7e7
 l5JDLzxNfxgOsseWdUIl9NWVpoMKW3qKe2JLl2cizXWNJfE2ora9grOHUsTaObv6TqnZoUtEbzZ
 lYL4QBesR66erjNGddsAiCwXbGZHbtEKyNUbALmQjXp+S94sSMfYomh6dNgZCOaEi01Dz4m42N/
 vqTN88nniKYsfj5LmzxdfgG+fg93uSfzXhSyx6z0gC0xPZxeUaD55enMV0O9VQDnF0QiUacaUR4
 YH3LO26b7DFnYRzXwZAl1IISzVH+R+qhJtZVoDIHF7TQLjsDgA4hN/9gqCcNI2gmcOPh6HVocng
 B6426NznWVMqYUow2FA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfX4ps08grLLusy
 2g/EAEmZJe/S9pzOgi51VzW4B2bl0tXZKKAAKv/VXab3yAvmFEG/qFN/+iimcpmrFHmoKp0J96U
 9TpZ0TKjU4sisx8GmbIe1f/EvVeeZ7o=
X-Proofpoint-Spam-Reason: safe

On Tue, Nov 03, 2026 at 09:39:43AM +0000, Charles Keepax wrote:
> On Mon, Nov 02, 2026 at 05:07:01PM +0000, Mark Brown wrote:
> > > cs42l43's decimator is particularly susceptible to discontinuities
> > > during startup. To help reduce the pop noises adjust the high
> > > pass filter settings whilst powering up the microphones and add
> > > a sizable delay to let that filter settle, then restore the user
> > > settings.
> > 
> > >  struct decim_info cs42l43_decim_info[] = {
> > >  	{
> > > +		.freg = CS42L43_DECIM_HPF_WNF_CTRL1,
> > >  		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
> > >  		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
> > >  	},
> > >  	{
> > > +		.freg = CS42L43_DECIM_HPF_WNF_CTRL1,
> > >  		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
> > >  		.vmask = CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
> > >  	},
> > >  	{
> > > +		.freg = CS42L43_DECIM_HPF_WNF_CTRL2,
> > >  		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
> > >  		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
> > >  	},
> > 
> > Sashiko is flagging a bunch of concerns about the accuracy of this
> > table:
> > 
> >    https://sashiko.dev/#/patchset/20261102155440.3995136-1-ckeepax%40opensource.cirrus.com
> 
> Yeah replied on the list about that, the table is fine, as the
> input is muxed. But the other two comments are good so will send
> a v2 with those fixed up shortly.

Although looking more closely maybe not, will check in a bit more
detail :-)

Thanks,
Charles
