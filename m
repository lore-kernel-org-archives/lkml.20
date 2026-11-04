Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793791030;
	b=okiMlGVVFIvhOP8UQfE1ixzSRCOgUTVbwP4hqG40pZksn4cTXl97BumyT9IGElRrvnQj
	 pVoYqQmNFQ9SZUJTOQeFlHmBXkc48HnnDk5BzUAptLLABTWFsbcIAapmxnv0OKGnb4qHy
	 oyasrbcfXvQtFpdyuEaU0RJSlwL+ofNgoPcOsY3fmrps9LcL6dVEUg5CuH0PzsDGPcv+f
	 1eoqlez5BTXVJHeDXyD8u14RSEiXfLp5tDoCj6cJEnG9bTcxh1w9WG/+8GzDSmAB7Qjkm
	 5giw6JCVFRhdLeQy6fhAXDPjvRpr0OciEIYlBnSuluph7kEHDjcbvVb11rYjs8s3m7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791030;
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
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=Qs6JXc7MsrT8smP1vCW8m41Ext90YUsE6PQmM9cFsco=;
	b=A8hqpG8ZAkYMeYE6eE3alT1J89VxYXxdjsMK2jB9EE5r7u60byVsfQAlvpzNwxtxE1nY
	 adH80CC70ZwrX3qt9Tqv9uhnB0EdQiJXTytFfxal/GUhtj0MKSvA8oWYdKKXGaVY8BCJI
	 YVDuS+rN8gyep17kb5hlIeflwPJ+M31DVMSznOto5RHHmSsALR1nqC5w56/WXaY2XVH4g
	 1jwtc3mJRoLUWr0W1yrMZ/6Hp68l4lAkT6V5XqVcl75pfF/GEQXyA3Ekuh+e0C3elGmpb
	 8kXh66X7hMKFccnTTKSAKPZUsJW8swk6UGD8ziAwEsVe8om9EqllQdmB2BqcpCYt9Ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=CrZYAvqN;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=fZlCAok2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18FC606D813;
	Wed,  4 Nov 2026 11:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A18FC606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=CrZYAvqN;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=fZlCAok2
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A49woju3106919;
	Wed, 4 Nov 2026 05:17:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Qs6JXc7MsrT8smP1vCW8m41Ext90YUsE6PQmM9cFsco=; b=
	CrZYAvqNmIWfuHM2Q9roi9yzDsUljAInqFiaupV9BLgX6s2JwYqr3vk5FJki8bUi
	hJ+lYpw1Daj3D1cUumHb+ahPfUybaVDUxMFgOJLOc7PGT+OPpHXwEgQ6aECnEoOC
	TznHV2jf0UQ0sngfG+d0FQSV8WYWLKqJNrj9OU6FKWr8FcOv8JDXPiDir1/zhPY6
	AAkMKcCwI7if2ncsH9TKbf6nugU7FVWS/a3wYkl7DCPaiNW4xD2Ya3I7sWt6Zthx
	qnG+Ry9t57BQsWesQYr2f4DQ4Y71NfIjA0mJlizfwk058rLXs5iOaP2UxQTqCwYJ
	YVKygcHavs6Tq2eYg6AfDA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023079.outbound.protection.outlook.com [40.107.201.79])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hndrfd2pd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 05:17:06 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ew+VELaKdvTWYXZvGOMBzVSVL4JrFwzcKTwmvwIS3vM/5udODqjWf2IeYO0LcxbTVTAH+bYDYD9nGFeH94mmF8Zi93L8SkaDpELkmlVuphyDuOCJPGKb+UGCzfpi8NqHVjG2FClfqcZI5/FLzXyZwkJm2v6Rdu9b9gKwmQba09sddjfiW2CZWbOxjInnE2eJFDbBPOVkx/LGXtaO9YduXFc7Ki4YKUfvcxBZULdllMAAy9HrVAybRUKwL0DzPxRVs/vB0EoKJgwHMbUPFSFsSda9AVjjAb++nsuxNdkf1xeoFCnB9zvbXhJVriLuifIoH9d1FxAoFGYK75L69zrTsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qs6JXc7MsrT8smP1vCW8m41Ext90YUsE6PQmM9cFsco=;
 b=Z+C/qokRHbc3X+eEgKcQsv4RJmpW6ebFq5Z+XpEkQ2S+r/y9RHZrALZUVWNkwcwUQIEqJ6Sq4hn9HrnHKDoai9CysNH2PvSUCb+gB989DBao0KJNqm1cfIL/xj1ayJPSuIp+LrBQ1arbvy+orsDEw5AKXzA/OJwbfQyQKqFhuuOeX9ZH5PtO7PC6PO1Xr/xBe0+XCQ3WM27Lrwbtj/fsXRrBIBQBl2ggDXmb1kxiMTNdYEuJVFOJ36UCY6v2xp9U79HXO1DwBO4SU0hiwB7zWJO68rwZltRQCj92KKShTcEvk5d33ARE/oF4+Fd9KzulRPVuUlD7ivDeEJTRrKbptQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qs6JXc7MsrT8smP1vCW8m41Ext90YUsE6PQmM9cFsco=;
 b=fZlCAok2XArcA8US5h9ob7BQetg7fgmv4L5ex6M5ooN7xscrioZaiM1YjuXjkI1b1Fnrc7Ku8YTJCdwaHwsdZ2VrGcfYhOi/7xvetRXTBPjQzyVMlj/BUz2eKqJVLUaa9iQGPPkWwyj4KXWtwRTw0ERJRkLvoW5TIIrwuOcF7E0=
Received: from CY5PR19CA0036.namprd19.prod.outlook.com (2603:10b6:930:1a::27)
 by CO1PR19MB5015.namprd19.prod.outlook.com (2603:10b6:303:f0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 11:16:57 +0000
Received: from CY5PEPF00000E7B.namprd02.prod.outlook.com
 (2603:10b6:930:1a:cafe::71) by CY5PR19CA0036.outlook.office365.com
 (2603:10b6:930:1a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 11:16:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY5PEPF00000E7B.mail.protection.outlook.com (10.167.247.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Wed, 4 Nov 2026 11:16:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 172CC40654E;
	Wed,  4 Nov 2026 11:16:54 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F13CA822540;
	Wed,  4 Nov 2026 11:16:53 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 1/3] ASoC: cs42l43: Improve analogue mic pop performance
Date: Wed,  4 Nov 2026 11:16:48 +0000
Message-ID: <20261104111650.1079215-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104111650.1079215-1-ckeepax@opensource.cirrus.com>
References: <20261104111650.1079215-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E7B:EE_|CO1PR19MB5015:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 121d05da-c7b2-4207-db1c-08df3a6522d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|61400799027|16102099003|10067099003|22082099003|18002099003|11063799006|261102123227099003|261021121427099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	YoqQl0XbGDD5M9uQdeg1t708al/Yh7WBvryb7HpcjvkhvCiGT4m1U+jlNXiKcC5OtZs+6h8BfIodv4+hz8PxELTFdQx9zaLkGdMvL213mVMlVU0BSnPJYJ+7PijXFDFfdVENCsjmXh5lENqqxfVlQMKU4PJwVjkwvjWMWy0V2QpRzV+u+kqB6qPXGrNTFMFOUs4EbRaeIQtfdPF6HXjQhoYcQ7KkCKmQRvx9n1J+o5epfvnmvqlERg5H7jpLv8P21xpsOpXIPg/T099mxMivXRfOW7Ep59QahTh5CUcuGB1VjP18rJH7dDLKjuueClTwpNi0JS4DB5bvI0uNWTBKqxZzKB8S0zzSogX+/pQabbmP31W/zc0EKXjWnk0wnEAl7r/I24fxiIKHjZ/dFyB3BBFPkIKV+qPoraqXwlR2WOdnIsIZvM5roKDc61FmU5BnmsFprZFdVVMwavclDRiiH80f6TeQxlvNsNZuyByBG+heVwSochhIN2FjUKyfAkWhxn9xm/7LTwO5Gu2e2yGIX029u+D/drsRbt/RnRbPljeMRITkpEJg9e7Ry7n4NCYB8pG8IpdiT1VuQSJ8iInOBLApG47maGkwaAbLTuLKdB31xTZVddtOhvUQFrtAdCfICP7YpSsVI1YPx9OVOoxGP222VakCI+sAk9JBG5fzK3G+1Be16VXvYbPpBjA5IsgErHnfZWB44QV7Bs/2c/0Btw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(61400799027)(16102099003)(10067099003)(22082099003)(18002099003)(11063799006)(261102123227099003)(261021121427099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	23pvRNXoTgh9sSnL7DnYknGasFtLAWnXtq0i3A1HHWtIj8h6DmnwRWyqLVpE1O3vPxtN0/NHFx6MzR2BC8qLgLgpbnUBOWacgCmXvAWCHMTEph0wmEJ1gC6FsQjs4QHroQ2iOt0ynnS8E0rNLH6GEoP0DspXXVI7gTU1Ojk1lz5haxxmXvpzSIOKZ8DFKasFKJjNMPZLqEOUCFvFGKpoBl+QBmGHmpUwMnOCpwYHtJv3HM3toy3ghjzr1x1fL+UlTn6v6m1BlXPdvkw9y0sRCHyPigOgvkHSYxPxJGu42f3BlId0vmgn4Ud3+3Ew+Ac4jKbHUR/5XP4pbxV4gJ3NGzQ936H4WL82puh8U+bvZ3gpWxHjAKONGXY+IROOmIl18mKrCeY8OM1ynkGAdcd26hl3+l8MB+lkE6E+2t5GWyLopG/ih1Pu4Uaueca45eCY
X-Exchange-RoutingPolicyChecked:
	R+ilg/cOtSX+GDj3g+7Sh08R1d03EWgu2P+K//b6EdzmpoxOa+iirju5O8nXc4/Fmk55OPaKryE1QOXrK/bJBmVGI7qzQHUAaT7lkRDoq0jWT+Xk44T1+pWC5us2OTq++esqEjn+P7vb99wN/PMd2NzG/ITwFnZ0zeByv5aJcI+lKULvxmJMg91FtCSCxP4vFsMJwY19qkOhLTyc3R6q13eFpHTVWltZ1hORMSe7VwY5Hj2UxM8oeP+T6ZMfkxpMn3K/d9r0bDACzUMRTXxohQqOJ5M4L+N97ASUncr0Z1yTCwpygbwZFem6m/ka8mx9CP+TMF+hEywsu4orFthrqQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:16:55.7559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 121d05da-c7b2-4207-db1c-08df3a6522d6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY5PEPF00000E7B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5015
X-Proofpoint-GUID: TD8v-yuYqUDjbl8UPTi2SvzZtP2PhEfF
X-Authority-Analysis: v=2.4 cv=HMRWhYtv c=1 sm=1 tr=0 ts=6aeb1432 cx=c_pps
 a=QpQIPgq430LJFJp+cclIig==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22 a=w1d2syhTAAAA:8
 a=Kzb5pRUq5U0WMVXxPpEA:9
X-Proofpoint-ORIG-GUID: TD8v-yuYqUDjbl8UPTi2SvzZtP2PhEfF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0NCBTYWx0ZWRfXzJO6YMDFgy4L
 BNibJq8XDYveYrm4l+l078pd4BRts9ErFgonul38ZcYvzNZ0EKOywWgr5D6VMqvbitXuSrEV4KQ
 MbbO9JrULiAagaO46L8PY735cJEmaSqFh/iEQtXXalJLhTtV4xCWkB84N56cq9KADXcyHY8E2I3
 ba+pLjPiR9a7gYUF5aL1jww6qrG9xvcyGwsh6n/lCUL+OtaTgh3UPX0ErYHyADrqQN9uEHDe11L
 xyOEG2wgFF2d5jheYYnr/YVs4GehVvRBhV31KTo5mytewXUhwCP/+MfwXxezQJnU5MSsgrs4Uxk
 g9lu2UeGGiygItINjNH8rdui+4OXdFG5n2b4mT73hkfaM1VpK8Q0LfqDN6CtWLnvnZ8MBf/o88q
 E96lFLXlwtt5dJ4ybkK/Rzham44flDng3pQ9BMDidxEoD1CqOezNHk76vZ87kOHxfUAI00HQAjh
 unYOlw6fCcbgKZ3gS0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0NCBTYWx0ZWRfXyx8zG97sTINB
 vw8zsf0HQT2DqeHjsRsXuvcc5DbUgKLSZohx4e1nFQxtX6cTGgez4U7k/reTGmeNpQs/QJ1YVl/
 33LjLhwJykFDnuXKtBKYTScqwl8u46k=
X-Proofpoint-Spam-Reason: safe

Enable the quick charge feature of the micbias to ensure the bias is
more likely to be up to voltage before the recording starts. This
greatly improves the startup pop of the analogue microphones.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/codecs/cs42l43.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index b6238f89c789c..90c83bb33d69b 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2822,6 +2822,10 @@ static int cs42l43_codec_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_pm;
 
+	// Enable quick charge to improve analogue microphone startup
+	regmap_update_bits(cs42l43->regmap, CS42L43_ADC_B_CTRL1, 0x20, 0x20);
+	regmap_update_bits(cs42l43->regmap, CS42L43_ADC_B_CTRL2, 0x20, 0x20);
+
 	for (i = 0; i < ARRAY_SIZE(cs42l43_irqs); i++) {
 		ret = cs42l43_request_irq(priv, cs42l43_irqs[i].name,
 					  cs42l43_irqs[i].irq,
-- 
2.47.3

