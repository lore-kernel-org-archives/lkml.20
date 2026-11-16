Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794827430;
	b=2iHyvli72jltO3q7QuuLxZVzArIXf+eIMTT3mcCPHGPi3V+6XK1qZBCvkGJlARuf6z+M
	 /ZZt1bzmqeR1EfkqW8HHVPavddMezCajISti91np30UlHO+u7Dj1IS3BU9zB3hxYqCdcL
	 /NFORHe99V6bFn4ycT3MSq0WSp6gM3/0ojsY2JItT6S0HJcYq3bLpLDz0x3Ga+mIqaGN8
	 TuAF8nQLTOGZCLnqeLku7CUpw7PlWo2CNkFIY+DAaLqzEjuukxu3lNBlH0HckBboeFHKS
	 Q9ncFfHOLh2fd+qw7yk4XUgUTUt6+5SnRoGQhXgl/egqxxefpTAt1vU82P77J9sqixA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827430;
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
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Reason;
	bh=5W6qg1EIg3FxacpaANxCW66iR4KEZ40Pq/HrpYiMDXM=;
	b=GDM3x4SY6ZQ/uijq2JPFLPqTYb+oxsABOP7Ip9vJ0Pjrfcd0m8CsoVSKwt3kYS0puKew
	 d7H6hzZyZOLRhh9jGLAHRIzCY/nsnce/9A6Cw9g94RQ715l3NnUSDIlurM2OXrBzWoo/0
	 CDv/Vzpmmbg83zRTZxYD2j4WsHIVBDzoPi59bEH+zL+wP7TJmagpH06l/20GOn68kKTb2
	 fe4iZ/ZrLsCnPme7QxXcCT7cPia3M+Vvava+oeBEoozbjGtsgnEoyMqAnQUi3WZQhaYM3
	 0ge7XLfeaJkVkmZczxHK3/rgix0+J80B0nGxafmImFbo5oxXk7UaRvDTmrI7NlqDfoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=WmJDZN9B;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Zs9j6PM7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF45606A790;
	Mon, 16 Nov 2026 11:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DF45606A790
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=WmJDZN9B;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Zs9j6PM7
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGAuDRq1673352;
	Mon, 16 Nov 2026 05:10:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=5W6qg1EIg3Fxacpa
	ANxCW66iR4KEZ40Pq/HrpYiMDXM=; b=WmJDZN9B5wKj+PTx3oEYqga+eWRQVK6h
	lg2oNusWTrdiNBZ8EnbUWtcZvwwByae34UOH5PE5YI5dLCKRxT8schyT82ZbbWo6
	Z3duf62vC/L96mFWHB2HmSixKSVWy0soEOLIEjH41U5o1fNfbmqycj9l/cfH+P3m
	wlhHFrYQfSApx6sOpbPLlIoYXjj9h/VVLMKdnuowbxAoy0KBmaL2KIw4tKmDaQ2/
	U4mEBkCdf+50fIXLBgv26CfLDIgkp+Frxag5juQKU7A5wbD6t3Fl9tGO+w7/W0l4
	/0mQ3mHbe0gK7mrQHwOKdRtkZZ+dDSMCItZ1x9UyyCJA/cx4/AdaTA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021088.outbound.protection.outlook.com [52.101.57.88])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hxnxehyve-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 05:10:23 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v7hKrm5EyntNkN+PWvzorAe4kPkgQeJgiPVmk73/vQz5/B2R7psvATr558MSvhashjCZtP5DhfiVgnjQ9Wh2pv4YmcLhoWIsouEuKkUieX5VUqV5F2CkS2FvDQpuyHwyVGIvF+GoB8qxbjRqFKjeVtQ8eUViL2oK7fNHfG7J8IIFM6x1KRtBsg3rXTXc+OleDb9z84iQM35iv2Ph0TcpNijNAbGQRucWP1qO4YFDExuzGsfM4jjxPmtaysJDqDydyov1FmXQvUBPM2ra+f/p4/jo9zt3PyhXERdAxXIL2uIn0OcmPSFNu7pEUJYji0eIwkitJb7ElzZUj5dYwOslyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5W6qg1EIg3FxacpaANxCW66iR4KEZ40Pq/HrpYiMDXM=;
 b=nzBYQ9v1zcrL9HRYhqev/15mL+7ggmL2R1WFhmVpCDsnPy+qmWfXQ+l0zPmltiJUgLexu+I5RsiZBmQHEiklkpZCLIJ4mPAz2jXtMGD7PzWqYLNzHFblWT4I6adjl3GAU2mY4FZproPDrluOyXE6DQfs3W8XrPZA4A46YsPT8pCi65LDnO7EAxanmXtHC0H5ZU3pkuNjpo4B4vPChJNsooW5M5JVBlMgPvo9PD4UcJaybpR/U40k7miCMxbYKmGMDz43qpwbY3tiBBxVMxk79wgfAGqM0x/C9nsDbeCe80tYC5Dg5RuRG2K8L74WuQbfmAjloksSEF3gHeJ9GLeXZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5W6qg1EIg3FxacpaANxCW66iR4KEZ40Pq/HrpYiMDXM=;
 b=Zs9j6PM74xnxnBkkO/Kr1qaxrgoj/obgEX9Ky9PAjPZno/cmm/FJSKqLnF+EObKxs0b25dkX51hw61HHDuDHGAbzyd4xS42FMeoydYYMzkaW8zxKCEShGbGV66hkt8lpTNlAKeoXyI013YLB5LKf64sTow1MhVC4v1pJC8GlS5I=
Received: from BN9PR03CA0847.namprd03.prod.outlook.com (2603:10b6:408:13d::12)
 by PH0PR19MB5476.namprd19.prod.outlook.com (2603:10b6:510:ff::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 11:09:18 +0000
Received: from BN3PEPF00022BD8.namprd03.prod.outlook.com
 (2603:10b6:408:13d:cafe::2) by BN9PR03CA0847.outlook.office365.com
 (2603:10b6:408:13d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Mon,
 16 Nov 2026 11:09:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF00022BD8.mail.protection.outlook.com (10.167.248.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 16 Nov 2026 11:09:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B982B40654A;
	Mon, 16 Nov 2026 11:09:16 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 99C6F820273;
	Mon, 16 Nov 2026 11:09:16 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 0/2] Add SoundWire detach helper
Date: Mon, 16 Nov 2026 11:09:11 +0000
Message-ID: <20261116110913.3555209-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD8:EE_|PH0PR19MB5476:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f2013057-912b-43d6-1b13-08df43d20ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|376014|82310400026|36860700016|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003|16102099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	E0lzqV289RrwH26jUS2BAHQlve3VJ8JzpIGVICS0ovumJl5F+//leyGWg+LdWnZ9IHz84QfHXJaGe2x3titpOAPBI49s/0x09i/wsaBMlIfVgtZD5jzw8gnx4Aft7ar4IoeoTIni8CQ8k6kFz+av2VS6pLMO0vHNi7JzAYOn7Lvj+I3W9pjh7LSadIfsHsl2PTDpsEK7wsRovzWB24wg2UhI6wVfXGCKnWYifilkfDtPCN70ie1JDNQIjSrmjygm6eB3l+e21kPKEuuqNo55oOhPc1tiGIby+LAeF8z6fyb81wPvq0NqP/wBEiN3oNm4RqHcYkpoAoUa/A/V76sqTuTDtgWIEsIiKFaFfl7fRKFrSz9ceIIZSrOJxgwrD7LuE+lmjZNOmvGMHCNgzO+UhFJljM1XnoxBUnFcigEiDCpyGph3U93FBr+KdXkqvRRyzNChJtAHw9BKplxm4ToyErcObvpPc1cNUoydrZ7wsiXGcdOMSYF1S1hc3KYFhHZnjo0GlDBsQdV/ZBoaTYYXAmgHQwF44e040lW6xLQWuzdBV0akvDkCBhgO0mnZy0lK6gYqqTdG/AjHiIbDfIO73uNV/C6vBUIbPJAqyzUb6hTNMgaTcLkSk/1htHvBV9YWWCGS32hn3AOuEj7TjgO24N8ygeanLgoZ15lnbl2GvWM=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(376014)(82310400026)(36860700016)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(16102099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/ejcakPECs8m4r7DLEKvmFvkUADYhqfZELk747wQEIRqrOPyaO15Fk2nOvUWy4ba8YcC/C7aZvNo+t+NVZ0wipPYbupeN06C17Sc7FvZ+XB3DQktMV4WaZm8te3SspUWbPwof3C7H083y+XEtpUkS39BXWihmDc+6u0HiXWcEVD51bxFec/7wd1FOYs0Jo8agh1LuL8m49QD9MT8ot5uK1fDHpsGvxstikIxTeJfbo6s3Y8xi3tr8HRykQGo+cmRBDsPP5/Z4c1wNOVHIsuGIs2J/Z9q/jzWBnjLARqMbF8jKf+/v+MpFjQinMeVA/unB/224JPhhgBDsAyqWHFDKLgASLsPRrxYT4QpZgrPIC6ZLJAmOuUMxWGBR3tM+O0IhLk7Rc1DBuldueCTf5Xfny0iOF4yriFIkAVdFIdseMrSA+yl7BS+RhjQzKxQ5UIn
X-Exchange-RoutingPolicyChecked:
	iHotYArkaHxvfzMr9y63YZuUTwllGLMWb6GF0fe5HaXub08YmpoEpVvde/cRYzOewUBZBM0J5lFW1zLdty/IHo2N4gRZiZW9exoCkeswstN2TkxnmoHQGDAO9c3RSS091jtl3Z7oMywfO6imW3yidoClA2cdzMMpdiNyCQ7OLcxjewYI6D4p3r+KDzwpZ0KgNejLz4CjyYsst/YFebeyfxWMj1+EZ9JdBCpIAXdJMo/av4BhbEQHAfAMzlS+WEdcppN5WSN42+XWvbq35RkZ4z22BbArljAqnuANtgzG60RhxKKxQE01ttdN54b0aR3F6dipl+sKHbqhzg8YRTXXIw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:09:17.9584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2013057-912b-43d6-1b13-08df43d20ee2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BD8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5476
X-Authority-Analysis: v=2.4 cv=KNbPn1Fo c=1 sm=1 tr=0 ts=6afae49f cx=c_pps
 a=cORLsCLt5K7u5uR9RT1HqQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=cZtL-XUxLnsMaWc3fMoA:9
X-Proofpoint-ORIG-GUID: xvTPHrmR7Ukb9TIjgJdp1iqxJk5y6CE0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NCBTYWx0ZWRfXy6SuxtgYjlq9
 CB9Javjky5EVYVmcdy+9KYuoklIU1GCCBqWh2KWrPbB5vrfbieUk1dvduqxKaNx1E7B8BBo+7/P
 6fMkfXWcjoqZxHagWE2/gbiemipipYf97wA0mDbi7izpCbsWIVKvJh0WIufOpN5PAllDVeEsQO+
 Czsp/HInjxMA2m3Gj0MY13l76qeBdFsocOCHXHro4SCwIf60Dk53k5ejmFUDViWgtqH88ZviOco
 MNqXPiWQOdmdYa4epTZgksoZrLdXFGFxnz0Xjvrkue9APPAZyMP/4SEUOChcaV5P9YpoZQ2vd2s
 uGjyVJpzvmZwV9x+4RCaLbXshr1TOc2PtTqJkD3294tukH8JbuNa0D6jrpZs5nx/GTB/AnosVRs
 oWjSziEMYAjFqbRPz62hDx8Q13iQmzlvuKUR3B00SFo6mYFVoylkbQxQfV+6G1Rg/1LzLbOXgRc
 LlDF8t0B987hb35GlMA==
X-Proofpoint-GUID: xvTPHrmR7Ukb9TIjgJdp1iqxJk5y6CE0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NCBTYWx0ZWRfX+WNzLdoZzHTV
 nnEUN9QnUTFiyHWRin4/zjgAlWob9hPODmVwiDRUxGU3jD3PjlG4EPX4MTKFUTflH/AH9ld+JC2
 WJ2JUWmGlm1KYisd82zdxU3u+rtiiLg=
X-Proofpoint-Spam-Reason: safe

Currently, if a SoundWire driver takes an action that causes the
device to detach from the bus it needs to be careful. There will be
a period of time until the detach is recognised by the core, if the
driver immediately calls sdw_slave_wait_for_init() it is possible for
that to complete before the detach has been recognised. Leaving the
driver with a device that is potentially not ready for what follows.

To avoid this race add a new helper that drivers can use to inform
the core the device will detach. This clears the enumeration
completions ensuring that sdw_slave_wait_for_init() can't complete
until the device re-attaches.

This is the third part of a longer series of moving these slave
attach/deatach operations into the core:

https://lore.kernel.org/linux-sound/20260512103022.1154645-1-ckeepax@opensource.cirrus.com/
https://lore.kernel.org/linux-sound/20260608102714.2503120-1-ckeepax@opensource.cirrus.com/

Changes since v2:
 - Updated comment on cs42l43_soft_reset()

Changes since v1:
 - Correct kerneldoc


Charles Keepax (2):
  soundwire: Add a helper function to indicate a device will detach
  mfd: cs42l43: Move to core detach helper

 drivers/mfd/cs42l43-sdw.c     |  2 --
 drivers/mfd/cs42l43.c         | 21 ++++-----------------
 drivers/soundwire/bus.h       |  6 ------
 include/linux/mfd/cs42l43.h   |  1 -
 include/linux/soundwire/sdw.h | 26 ++++++++++++++++++++++++++
 5 files changed, 30 insertions(+), 26 deletions(-)

-- 
2.47.3

