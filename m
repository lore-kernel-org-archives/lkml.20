Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297601;
	b=fHYxZL3Pi9sbzaxbpQQMFZp3Y8hnf+D0w2GjI5HVJcDXr4wOnC6pEFlcfJdbzPepCYBz
	 1MZL0DqxT6R998/laiK9seGhfzSqQPjI91R/yeHwfdHWO3xjKt1pb3RXofrYV7lxVtymr
	 FTf2JCrGhJSZgu3fYafdLKb7+vHMSfuQ6lpKAyRraBrCg2NBgJWWhR80rbwIr+uWHnV6d
	 OymOm5H64jx59Dp6qkvZoddCYrZxcA3MCQ4hdn/J6xrdlbH/f3SOZgsNKWqh0FLKBqAG4
	 JV33XWupMvzBnsewbS944fdzPmc25IQLB2Vl5avIiOFZESvRTWyFyIJvzHQuRmk9skQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297601;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
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
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OxxQk7rQPyou5FX8SrsV0tQ3JjklSCarHY/EZtBzZxM=;
	b=ogifNnYsYtCUICrvdIKh/dU33YcmCkvzBkeB1SahfOWLwpjiShd5faE5+rla7ZsDRqaK
	 VygnRid5dFHErSvzcxPCxTw8djO0cMTtnWoyez2GFQd/ftXz9w8zRpSCsApAJd4IBMybQ
	 qm3AdV/Uteso3sdZdjDMKfWmGFgWs8RSmCPT9VAmoxxWCDwn0a0706KFfGdUcnsS61xsO
	 1DvSoOJmKECAVfCVky4c717giFA5UbnAawAwRfVZsrM6BWAGitpa2cm/spfxXKp2s4jzl
	 gpPwa4pmLhvw705lZi6K2L2KACXGJOnSDygNyk69h9BOG8gyqrVpbz7Z6IM/TDyRHbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=TdYJsEs7;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=grYKZi54;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74193606A339
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74193606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=TdYJsEs7;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=grYKZi54
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDU9L3224659;
	Thu, 29 Oct 2026 13:13:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=OxxQk7rQPyou5FX8SrsV0tQ3JjklSCarHY/EZtBzZ
	xM=; b=TdYJsEs73qORFPk63bFyUnjsbe8GPZEC+fbzBq++pXD+DbMmy6iuqTGfV
	AtslczuLextQYXn44JFeTIpcy4EXDBtk1WffBGMS9912d3QM9lqWZ3kviFkEM12Z
	FsNDJkg2iFk7ol2m3yiM3TkGr8BzB2hPG8g5Bvp2Qga3bfGDgEREV+qqlOWKJrY3
	JrZQEwiPiGdEkwjU2yK3/DroComwsrmt/Bk2CkKVH3JKi1slR2O3WlczHpAzJLBf
	OCmQVFEZzZIBI5MJDhfd+MzO6kcJvd6gW7IxSNdzf+ujvz4t5IBSjK9kQT5Gx2ye
	emCbARPofDnm6KDunOZBKtfRUA8kQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012026.outbound.protection.outlook.com [52.101.48.26])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hm3h7kkku-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 13:13:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kuRccq1k2ajkMBX955Tt3R0hqAxbSAghw5tTMJ3kfn/yAbFk3NBE09CHpXs1Ka/2Y/FZo3//mkX/znXTMDR6YswllQxLTG/rtTf/j01oWYBQi0ijicBaRMbaNtj/Od1Z9+Yd8i/fn9o2FpDL36tYdil7BibX8sODgQVFoYymQziQu6tumoRugzTem6SqfBJMJ/h8Eohe2VDxXugAX56jomjGXjGJmxfXemtRnIF78nTIf1MFWDtsqO7iVQfk2HU/UadyRrJLjYy3bjS96P2QtaB8PzNh/GD/vbpZPdq7GZuFdTy8mN9AVekCfMR1wgIYXqjk2/SaJHShfnCvFFjxNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxxQk7rQPyou5FX8SrsV0tQ3JjklSCarHY/EZtBzZxM=;
 b=qrl4wMvBknd+ongsbDb+FT86ncRF0eYX7utBonDlNpOjw0yJpSkkJiQAKcIj6j7rQQyucXj/5Cm8yW/lS3qs2AnhLO6uxh2fJ5zB8AhYWEM7IUk/2SEwZDdxrEzKrMnkU/4IqsXqkjAj0FNyNFMUFrOdT9Rfxu8AecpYoWvBRvgpwItyQieDE40/8L/bUBtqcqgfpFdOydWJh6CHQd/00jObINrnhKhmW5IXjjNuaYSRJdoEofwvMwPz1D05cX55L27ZAInNLmG1xpg7+fMiShd0TJtthvpM1pvuW6bY7cCCgjGq1KPlOP09hbZv6nGSh/naXKOOVRyP5sGNjXUrEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxxQk7rQPyou5FX8SrsV0tQ3JjklSCarHY/EZtBzZxM=;
 b=grYKZi542EvnWeL27BhIQoW0UEnbBLlYr08werKU9owdgDnTnLo00oM4zs1tZ1CWiAAOFh0xLAAzFGbQCxmkB7lNtZvljr3X9va1AOTvHn7rU5GzgdMot8BSlD/1VYkMJATZkV8+a0EO+B1lUs4Qo1gX/iQ5mXI7kCqIUe+zqFU=
Received: from DM6PR01CA0003.prod.exchangelabs.com (2603:10b6:5:296::8) by
 MN2PR10MB4397.namprd10.prod.outlook.com (2603:10b6:208:1d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 18:13:12 +0000
Received: from CY5PEPF00000E7B.namprd02.prod.outlook.com (2603:10b6:5:296::4)
 by DM6PR01CA0003.outlook.office365.com (2603:10b6:5:296::8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8
 via Frontend Transport; Thu, 29 Oct 2026 18:13:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY5PEPF00000E7B.mail.protection.outlook.com (10.167.247.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:13:12 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:44 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 13:12:44 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69TIBmMH3408718;
	Thu, 29 Oct 2026 13:12:41 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v3 17/22] firmware: ti: ti_sci: Add missing includes for self-contained headers
Date: Thu, 29 Oct 2026 23:41:42 +0530
Message-ID: <20261029181147.266771-18-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029181147.266771-1-b-padhi@ti.com>
References: <20261029181147.266771-1-b-padhi@ti.com>
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
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E7B:EE_|MN2PR10MB4397:EE_
X-MS-Office365-Filtering-Correlation-Id: 694eff4e-c590-4f71-c591-08df35e84b44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|56012099006|261009223027099003|261028144727099003|261026140227099003|261026121527099003|261022105027099003|10067099003|261021121427099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	1pv3zNCotSIYVZqxOCkCPmlWl/fI/1RC4QnBvGzenbcjGCXTFZnSzjBo/sA0D3chMr76eG80vpCfwQhHA/Ca/wJmetkitqSB9HK2GJVNVBuS1snkMowq/Txfe5GzI/HXtmznfkI0FFpcX4uAeJYVySnCeqB+G+2YqiO/S8pxrMg5N0V61pZYRp8xBrJVejLRCi79vp/5XJt/jgdXb+dVoN4ToFDek+7oHcOLYaSq2iePmumc/0yA4UpovZp99d7veY7VkwRmMf4jHZwemabruq6CcmLP75IjEZdJ8ZujIOTT8fgPCxdz99mSTitQ8bRnq2tfG9gmMmIktyIb179EOkkCvNRPQ4Mj6uSev0F4U1QH61yM/7MROc98mR1PO+q7QXonRbyRGiSwZlbITUC2R5AMjEVFaucx1qG9u8XbFhgJNxb6WIlrdRXYflvZRxdYQgZWwlZOOMvLdkZKFtBHDJPLfdLlO9DE1nXSwscOUBK9GWSzeqJBAYaJj2yOsXiyl8XX2sreF0tH/amY1xlkseivNep8JuuadXqJW7QPJx3DunXMfhCZ8gT7Orug9aiU5c+8z85QquKzpIrAkoXjmQvXdYFhm9lKB/FCXMTfIYVy7Eu7hjM54omZzf2KYXcHY32w4Yal43mlERUVxUFtdHkPUXCTbOj1U2cmJcyARas=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(56012099006)(261009223027099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(10067099003)(261021121427099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wMhWEW2t72NACBpuaQkOWvYAfmm3Wn6O8nAsWrgAsl/kJ43xFrWbTmJNex5rZhqqiU8MsFystB/L3kk1S+sMDIIAhbnLbCNFhvdIJXGrhV8U0EdPCsBJZlcAQrG8nkIXcxbjq5IK6Tok9iC+BBfR/XyOt38c0mW92ggGMKIzEu+k6waT9utpLSZ72YgsWyakfPJ6DhR1kUUExgO2XILLR4XYjc8xHXGpqhcK0tdXr2P5Mt3dld2YcoYNKyr5OKn7lJgzFzqRnomcee7PImoRBpC4FMEXomBELtgDV20NIBtHvSGQgG1W+0F41Mwz9PqLZ71yEnWFr5r93PyyDSxacSU0+1FMsQD8bP70yWrobDx9O8q5pShY+qnDx7SSlfl5AjKdeYnZJuNmBJpo5PQFceLE9Innu2+YOpgeIqFgb4EsFEjWOpmPddznSrxp/CKC
X-Exchange-RoutingPolicyChecked:
	iRr39dGx0UXtRCbficXXbMqltRnRoSuWnwZtr6vwOf5137Uw3F/hIFHazhQIkqtKxSMlRiK6MZyLQCI+19CidHJt/ZrSZiXieSEInXxcWGgUxfUh8XxlCKOt8t3YjhGRGXVAj3zrbhGUUwhFJG1s3YkPX20v/Oquxjoskef8eW1rrc0kwCT7dGGW2ciPZpT0NjQ/eQVud7nUQRdsn+H9Rlw/efkW7fTZwv6XJt6KiFP+7nzAutmlOBg6lg+jsqk/tjFmdxIWiziCoW6dhaXBoncb0J/oyxDHh62VMciMU74SpD9LvWbCi3jF87EeB7gvx5Htyu1x8KNcwUSsTXLIyw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:13:12.0589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 694eff4e-c590-4f71-c591-08df35e84b44
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E7B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4397
X-Authority-Analysis: v=2.4 cv=fv1J914f c=1 sm=1 tr=0 ts=6ae38cbb cx=c_pps
 a=NPM8+NhlmoQiEOpqaaNCjw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=csM5ZfmNaZnVLxWKLzwA:9
X-Proofpoint-ORIG-GUID: jHucO72mreJahV1-qhYQhXYxAwSXU5Km
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX7ZnFexYLxWNv
 usfRc/lDsHapan8xKa0/8B+NBOrTKhGnLeA19dcWBfTO6r3awNQm5Etr78zN89OWLFQ/34mO72+
 3F5Tu/i3knU4E9NNqkhlICsS8lYS3qhiEj/eo6HjvzZsXl5lFCS9J3gBDCHZ0+s3wkJsS5UAtvq
 UjxN9OLEUIXXDI0bhzArovy98WFJzrR8u35/nPA41OCgNUwdNpPSenOVi0zgJjTVANtLHW7Wenb
 xq2byIHJ75VIGThY3A8h6DNQDzwXrOTtoOMbIjnXcosepwcSBv/ywt3KtEsllalrB/jCQSVt4Ho
 v6VBbXqDP4nmk16OlqKRS2JB4XzhaPSb1AkPX6YhRU+iO8ICoNWwLaHhv478ITejWRX1KwxOGHj
 OapTjOJs5PECMXhusaqUdlw7YDAWMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX8n6xLQIs0zbG
 H9OJpSrdxLivWW55jCnz0/il+yzcBd4iWTyxyqMpeRekG5Ws/m9pLsuyW39zVvEzZQlXTdk+RYs
 xJHXkqsNDeq66lNLIjldqekYHBmkGo4=
X-Proofpoint-GUID: jHucO72mreJahV1-qhYQhXYxAwSXU5Km
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290071

From: Andrew Davis <afd@ti.com>

ti_sci.h and ti_sci_protocol.h do not directly include the headers that
define the types and helpers they use. They currently build only because
every file that includes them happens to also pull in
linux/mailbox_client.h or similar headers first, which transitively
provide these definitions.

Make both headers self-contained by adding the missing includes, so
that they no longer depend on include order or on other headers
being pulled in first. This is needed ahead of the following commits,
which split ti_sci.c into several new source files that will include
ti_sci.h directly.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
1. None to this patch.

Link to v2:
https://lore.kernel.org/all/20260930160607.2674980-18-b-padhi@ti.com/

v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-18-b-padhi@ti.com/

 drivers/firmware/ti/ti_sci.h           | 3 +++
 include/linux/soc/ti/ti_sci_protocol.h | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
index 34f7848073a0e..f2f17bcac39e4 100644
--- a/drivers/firmware/ti/ti_sci.h
+++ b/drivers/firmware/ti/ti_sci.h
@@ -12,6 +12,9 @@
 #ifndef __TI_SCI_H
 #define __TI_SCI_H
 
+#include <linux/compiler_types.h>
+#include <linux/types.h>
+
 /* Generic Messages */
 #define TI_SCI_MSG_ENABLE_WDT	0x0000
 #define TI_SCI_MSG_WAKE_RESET	0x0001
diff --git a/include/linux/soc/ti/ti_sci_protocol.h b/include/linux/soc/ti/ti_sci_protocol.h
index d8efddc1d4ca4..c7bcd9562a71a 100644
--- a/include/linux/soc/ti/ti_sci_protocol.h
+++ b/include/linux/soc/ti/ti_sci_protocol.h
@@ -9,6 +9,11 @@
 #ifndef __TISCI_PROTOCOL_H
 #define __TISCI_PROTOCOL_H
 
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/types.h>
+#include <linux/spinlock.h>
+
 /**
  * struct ti_sci_version_info - version information structure
  * @abi_major:	Major ABI version. Change here implies risk of backward
-- 
2.34.1

