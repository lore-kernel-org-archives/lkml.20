Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793034858;
	b=pK/YFYj6qIfUFfUsvC+nMkLeBpdmxA5+UrGNbqdvnf5o6ayUL7ofSzWNHjYzrFwUv6pC
	 IoWBlVwNvvQisOHDYi6epwDmzE0hqfyi8AalXQvvVdet8Xdjj3yCodoXNGImhfkkgpxzV
	 vv+xrlt+mj1NyMUKwuK0nQb5xDKfNxs9V7LWCzfX0BY4zeypf7//Tno1msP95BQhOe5Xr
	 EpVhREoiDwbG8tl3826ckxymDtiB3Yb14kLgdRIw5/q1X6tevum1RWDryMvUn5/kPBFEC
	 rnU+U6G21ORrXZ/meSUWBnQbLrcyZDprbEUcYUlp5eP+wN+1PRnZqjkAc2D8d23l+Ag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793034858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=qN3B7w7zmQ8RDJmCwYiSkoEyDJ4UONMbJQFrUHxY5R0=;
	b=JDWdSUmkoxOZhvxTLm+sMk6lhr0PLyDU52Th0KZvA97r3ikmzipjgoQYQ+Lhcre2NEm0
	 mx9pmM+tPR86qLhxsMvrAhK9Zy7fbYq8I+8dr+mEeECTjhGnZEmdcTwre801zMNZI3kfd
	 9k9jhrMbQ31LUB7qkzqOyEAs4IV1KovT9i8XFOshsmND/LNPgbuxrBfZkGzyAqteymCfs
	 8u4aVd3irmywuDYWCag992xvpw2/BM+B5vsLjwaja0I9KnGOKWnLg84sMAsrUFrOdL0DB
	 jEBOHcQMTMgGd348Lv1ADDbmRISyN2JPPbdu6/nRlZE4YlbO3VRGS1KtPEmlgjL/OAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=hESXb5Ii;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=tsqrIjEL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD796606A31A;
	Mon, 26 Oct 2026 17:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD796606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=hESXb5Ii;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=tsqrIjEL
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QGatUV3833198;
	Mon, 26 Oct 2026 12:14:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=qN3B7w7zmQ8RDJmCwYiSkoEyDJ4UONMbJQFrUHxY5R0=; b=
	hESXb5IiRknLQH2JP9nXkkpKxINH+wPCpseRsQOS0fB7Jtwsmv37HpnTNhOptgn0
	QwocCrF9hmr3w7boFQA7bHhLqunVij4oWGenJCKEJ4ZQCy+dvXdlaKBnlmmHRz11
	bv0U8A+Ne1XqJ8zOovZfbUEbvdzui0EKXXjUPsJtVUjiXY5nOY6gUWzUNPCT09Ox
	k0UOwb3uVeywZnzjRc5Y/bpro0I4Ip5EBRxlFva8nT7waFAqTgi6Fx66YvuxcZvp
	m0A7098BZAErgyJM6SegJiNjKIIkvTWx6TTvXCe/1zjo1teKu6fQdNIaWf2kPbQE
	GmKgR551SkYKMGHD4BQBRw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020127.outbound.protection.outlook.com [52.101.201.127])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hgt3aakan-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 12:14:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/wYzK2/A0GHhXpP9UcrHGTcJlYe9GQJGVNqep1Jk2LKEL7PWrE7Ie2DS5oTFYt6ZSmEnpvYx+nQSI1N1562AbmsMFm0uPrRsqP4Xe/F7CKd2fljZiNoHgtg4Y7wDF8cRZDEDOsXtYUkMa/IgO6jqMfXHuYpps6PeP8P6DyKr3CsLziL0MgLLqbGTkdu0inVO/+xRT4u2igzcwvJX50mFVTJ8xVBhly2qCf/A8iD/LHfCWWc0cN1YJu0hgNgzaDI4ktF7CqcVTOOhhjm3yYckCK46krP9rz3ERkvg/ZGNmCEof3ZP//I4cm8bv1/e9kodFrjkfzfwRgfrbDHSS1I4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qN3B7w7zmQ8RDJmCwYiSkoEyDJ4UONMbJQFrUHxY5R0=;
 b=lsVaJixR+OuxLKc1RDWui5LfB711Un3c/PlU2auBMCJ+Xy4a8fRQecRNQggt6/z2mmpaon1RBhKrqVxs8qWOpsQYY/uAjOeObveTlMpXLtUynHAHDaDZnbIZHVu07zAvn/OsqAA6uKI4XQsut3pdvYYkdJVWO2koUmvgmKVXCHyctugA6EmQfgQEnC1OV0rINzeE7nHHn36gDDDhpj2nI8GTXJV4J5Eh9gKifmgH1VvOvo7q4uulyJ+54ATroVd644HylDhJNBhEL6f7cXIBfMbaVWXLXlNUQ1KSN/pF338qLG8ezSIwWp/Jk+xaxWSdRfdkOR1QAA94VXzllSZjVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qN3B7w7zmQ8RDJmCwYiSkoEyDJ4UONMbJQFrUHxY5R0=;
 b=tsqrIjELPOO093AAG4J+vIj64v1N+WKuNUA64Xn28xC00DEThY9iR44qIiOZSPOSX7Q3+Zvws58Ix4w8g064PTkEtFAEAmPEXrBTJ0U+QVQxJZpl/c3AcTBlxJPntJctwqFinUr6u+MbcTIBd2BXKLiNv+byMYHTRtDLFGT/rJY=
Received: from SJ0PR03CA0137.namprd03.prod.outlook.com (2603:10b6:a03:33c::22)
 by IA1PR19MB6298.namprd19.prod.outlook.com (2603:10b6:208:3e6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Mon, 26 Oct
 2026 17:14:05 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:33c:cafe::48) by SJ0PR03CA0137.outlook.office365.com
 (2603:10b6:a03:33c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.17 via Frontend Transport; Mon,
 26 Oct 2026 17:14:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Mon, 26 Oct 2026 17:14:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EBEED406542;
	Mon, 26 Oct 2026 17:14:02 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D92E6822556;
	Mon, 26 Oct 2026 17:14:02 +0000 (UTC)
Message-ID: <cb348720-fd3c-44f3-9eaf-e1e31b23f410@opensource.cirrus.com>
Date: Mon, 26 Oct 2026 17:14:02 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ALSA: hda/cs35l56: same calibration condition logged at
 dev_info() and dev_err()
To: Navon John Lukose <navonjohnlukose@gmail.com>, david.rhodes@cirrus.com
Cc: broonie@kernel.org, tiwai@suse.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
References: <20260914000308.108995-1-navonjohnlukose@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260914000308.108995-1-navonjohnlukose@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|IA1PR19MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: 18bf6648-527f-4d58-cf18-08df33848985
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|376014|36860700016|82310400026|22082099003|16102099003|261026140227099003|18002099003|10067099003|261026121527099003|56012099006|261009223027099003|11063799006|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	0zARQWYb2kvTpiqsVifcXZ1/YzLNZtpX6z7/Jly/IF37sjDTG0gBdlut6tz1zi3o8+1xfLDsIxMWRaqFm7A9QK1a54Hu6QQCDv2eaUMCPhpfUPfZzJOa3FBKYS98C1ugFfhTkpQRQQ8AB+xjGHvuD+uvRfbOoAr4cQkNrlopmPxkH4Bij7ROWAnr5XL2b8ImrTgj8yYUO56H1rT2i4I94UjLZoOBGkOuhLUVSWSzVVVFZjmMrqM1BwrwrSUIRU7eZVX/jbMpizkAoiKSQ9cEBWEOfzxX7V8Nl60xHkf3+kXLSUleOijjd+s5PQPXiEQLss57TmVks6oMOM3UAA3FSNLhbxeTBBAyOvDwhXe99yNd+ynKs9nT1XuT3GML7hTUIo/3bRxYsbGPisDpYcqyCwwcswIFeneSsy2BcHoomI3vudIJwaI0gSe1v2Hxkmp58Sc38epQCu9qx6S50F1mAam5Uy0vLw8+dPDSgGR3+lkG0PhD3aC56Zsc4Cv7mViaEsLamhlMGINqXtbcmRiC6OwBmIssBVx89rT1mnH0l+RRdBsUkp6UJ11cJxF+AmgeKWnjcaiNsyI4ZhRERGgy4z6DR8LQmoFM/jqZHxWz1Y/Ady2GH1dp5IPIivl9b0cJ8UtNLfgJU1XFXc0KNDDe2ExzyR6vh2nomdSZ+1Y3yGh1WlzIb5Mz5zO2CXdk4VGYZ+qGhZhs+5AyCTnrxLiqgg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(376014)(36860700016)(82310400026)(22082099003)(16102099003)(261026140227099003)(18002099003)(10067099003)(261026121527099003)(56012099006)(261009223027099003)(11063799006)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xR4kgZ1f40JOLDD/0IUmGoD4g5l9DQPasOAqq1S3w9Osr3aZFWp2aR3XEGmpeInnN/C+tjBOr5L9oqk4LP4p3SLVt31Z+o1c0DtUvDGAfDpgkmGFEOhe7hUKT8u8Zn0DSBy3TYk6eVsShLqnKt+EYA/PzcDSeSXVPJI4Pyjfwr1EkmnMW5VZIM00ErAy6XaJ3tJXnrOrVdTOTiO/o27ynnYn7v35mBB4/S0fHZGuNw9k1MPIKnKygZq8HLGpybP8b+UXuKQMVDj78xGVYzqNV5toNc1XDmEKQJZX9Qh4WRfGgg7nqJveQSHfC9jstSqcnYRRAqUaRorz6EjdxBV0gj6K+ujWNplZC9BCOPBi1behNBWuxBwsr+3VwmIdulwbVr0xiwVRsZQRT1XzLLv+yNQzMfY+eysrLdiAr6tAX2idXwVZMvwFd/cly030Q9g2
X-Exchange-RoutingPolicyChecked:
	eLPLL+GktUN0h0UPs2YaZHmbuZp5nQ06UjMJxkX9CwbZWm/vFiz9u+6ngVxvyXAh/byeZtQvpMAzNX66XFnDGsXrm7vMbhT1V6RvthHV+icQ0wiMBPkeGFx3/sWNgdzO+hBj460trkjf5ZvOB2qV/HvwcqsL7cx3doITZAQZCmSbnvSIGnC4Lv7njG0S8Ui2Ype9NTG9i4lZ2mdRVjqnlooPSOMZkSx9lt1+YqhiTtVf+QcTjG27S94MOp090PYlC52nthoHEw4SQW/DbEkCk4J0bfzCgc4DoCzy/KO+SH0D+Rw9JU53sPxguQuN1o5k3XLdyP4IjDPwHY5BaSkfpQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 17:14:04.2680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18bf6648-527f-4d58-cf18-08df33848985
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6298
X-Proofpoint-ORIG-GUID: iSYMExL0HWC49WNkumLnvbSS4_ztwCSp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2OCBTYWx0ZWRfX7ebR74GWzGN6
 sBW+wBphZQ+PWz3BtswnE0cGNv3Uu5lVY0xyVFO+quNxtaSfZK+qwZmWsphXE1qXSk/IKFdbMvY
 QQcu7NUzIJ/2fvA4cnfXMaZWfQYwRIg=
X-Proofpoint-GUID: iSYMExL0HWC49WNkumLnvbSS4_ztwCSp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2OCBTYWx0ZWRfX6vzVLOQz7aLc
 i9hU3Hxtkh6eC0T07acM49RbbsSmYLfJSs4Iuyb1WEIAQ9H0Wt6hPvJoUXnu1rOAixGfyB+xktD
 do6bepo5yNEXCZLQAs9iCxi1I+mhOzslyDZBuTDFtZns+iXhqxz1fS969crVz7bXjloN+kAGJJW
 Cq19GPpZqFcPEEBAiFfw5dSj/x6hicBPTc7Fy98lo+Eov+2KIDAT2oBnWzWdIkSsopZJWNcEu9o
 KQ5yvTsmdFWw4xVC0ouHf+nF9+d8Q/cfAoOyA48HhMdK5ZI16pNGqvvq65DPWoyf60Q0QSD1S+o
 RpbM3vkjtb7Qr7aS3P7yDWLhcLwfSkPr2AJ7a2UW7jo4GcVbpQ70rVnPI1ja65x/urOZOs+yS20
 kUv8RKh4TNTyu/zZEu8zPGOQLrnFW7wOuhePab1u5Vtk/ORcPIsuP82eNWVJLpZ3sZVkHbOE8iy
 MZbIhoOiSP2MjnAzw9w==
X-Authority-Analysis: v=2.4 cv=O/2sLx9W c=1 sm=1 tr=0 ts=6adf8a65 cx=c_pps
 a=PudVcg9mnr0bxBTXJVVJTw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=a_9qoUGiPEQC6kGpkTYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 14/09/2026 1:03 am, Navon John Lukose wrote:
> Documentation/sound/codecs/cs35l56.rst says "Failed to write calibration"
> has the "same meaning and cause as 'Calibration disabled due to missing
> firmware controls'". The latter is a dev_info(). The former is a dev_warn()
> with a dev_err() from cs_amp_write_cal_coeff() ahead of it.
> 
> Rebinding the HDA components without re-probing the i2c driver takes the
> loud path, 4 of 4 attempts here:
> 
>      cs35l56-hda i2c-CSC3556:00-cs35l56-hda.0: Failed to write to 'CAL_R': -1
>      cs35l56-hda i2c-CSC3556:00-cs35l56-hda.0: Failed to write calibration: -1
> 
> list_empty() is false because the controls cs_dsp_power_down() disabled at
> unbind are still on ctl_list, so the dev_info() branch is skipped.

I've been looking at what code changes would be needed to fix this.
I'm not convinced that there is enough reason to fix this unbind-rebind
problem. There are risks in trying to fix it.

I don't know of a reason why the driver needs to be unbound and rebound
in normal operation. For debugging, the driver can be unloaded and
reloaded to force a probe.

I'd prefer only a documentation update to note that this error could
be caused by unbinding and rebinding the driver without reprobing.
