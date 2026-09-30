Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE04C30BF70
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784415; cv=fail; b=CvPX24dpzN7Zmhq7gP/QcImwy7k9TzDjMx4DSX0XHGX4ZD2DNtuXIww9ko66Jf4kZtPCjZdH7zTUWGgrZHQDgbKH/Po4xmFvdT+a40uDIySYYv9uxxXdGmqdZJgqNYrMhaM9gW7iQuMlT1QQZVP13dsUT0kB1r3e89JvMRT4Upg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784415; c=relaxed/simple;
	bh=z0MaSA/+8JNRqTDpUuX5MoQ5gp3dooZjRPkLsBuH0po=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JlKvXyqjui2mUBSe0jAOyFoNi+Igs1UwtOW1+goe03y6+a5run++Lz2nae+WqWibZ165oWVDafSJFK5BnaYgn9n8cNH+CLO9/7EGctq7FLSRMZ1V+jRK0lzH47BDqRDSQ3UeQnkK3pFjEC8oOrQkJR73tDVe3FtoOT6QGRlBaDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Ul33QQxl; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=Tc57lkhM; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Ul33QQxl";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="Tc57lkhM"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1GgN3333242;
	Wed, 30 Sep 2026 11:06:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=CB8wn6LMlFVlA
	BvJF8l6Ros2gjDfoVtt7Nbokh7uXcc=; b=Ul33QQxl7mkQwbyMRyr+iCzcI8S2b
	QXm5mPo5Sd4kkcgi3/00aGMqQ91HpYfPBy0fijEdArr+4/PNVQtggpV5RM+wUwzi
	uO64XIh+eh5PEU5a892BTpDupB34y/QqwmDt0HxXJeVYcFv6mTNDhhrjrymmrKNr
	Q298cRpMuHCIicLmoRqqw1v1xBdzZZmk5U5p3HfRBAmNIAwfC3WvI018s03Q5yqR
	jVzQlYVNnmvDZSx2m2CrTitI7lmRq8eFwnmkGdM/srMM/VMEdbr39pWy2psDTnP8
	gBa+5YP/y7mJhTpJxK5Pk/y7V7pIX3CUtlnfDM2/Wz5R9A84Zy0D8z85Q==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013069.outbound.protection.outlook.com [40.93.201.69])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h10t1svm3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 11:06:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpLM0OMh5X6iRRTb4vw3mTGICnvTWtwqpcdNOZMYBSofFm2ho2at2Oc6+JZQSQRF5A7rrjFDwJy0EqiMhdSObSAj3BJk84c6LfizEZ5fP9nIkFU3fsD+W+ujg22Mjq1T+m8buxgDBqrHf/V4gWeNtM3sbGo07Vk298cuJcEPm1FSdMr+xmO6o8FreDqJWpMgMk08cPFDYiJOq2v4PrhdSyZKThKc235qb5WZ897PpSpKsv9gsReufHnVitJesOs1t7HCR0l0UT6x4qvNesJrPBo+eus7lbY4vGlwqMh98lQt0v6hpQHDLhBVjHTozO82vAusTvojGxeFi8u+M00P1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CB8wn6LMlFVlABvJF8l6Ros2gjDfoVtt7Nbokh7uXcc=;
 b=LE9Xjx/KMeIjWivUEvogffxvxT1NHMxmdT0LZaAbjmY/GT99DCy12PiAquzukvuqE0AIL1Q+8H2xL2hGusA62wGxiF8eC9HEqAy8I17v3qL8srIDjqLMB3VJ0Jt8JBPVislSmsyfMcZUS/wG6xFoo/aAD3wZTJ6Akhb9webkBcSe/ISD0+TnK3tXWh/ToC3HIV1TEDk7KVkhaFqR72riRxg1G5kD8V8T/7vzDF1PfKohT4AOI2KhKa/uDea16cu0NltC8CPm3i9kodym/Sl6opeN/e6fffPfy8Qff9x9f0EHObae88GINnwAQYkBDPfThpjyLHGVEgIE8f4baiFiJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CB8wn6LMlFVlABvJF8l6Ros2gjDfoVtt7Nbokh7uXcc=;
 b=Tc57lkhMRSk+9eCeNfzVU2E44wWLchICEerahnsPbw6AaN6kdxeof9gcGbPfBtD3tH3knnWUcSxrieINAjCPA3GXrOyUHVsaVm3qj8PM3ZbzFAfPU1qE6i/gkZE0OZ8B3Yl2/erHkPXOvna33GwtuKfsY4e5t42GxvednzO/YfU=
Received: from BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::17)
 by IA3PR10MB8639.namprd10.prod.outlook.com (2603:10b6:208:575::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 16:06:42 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::91) by BY1P220CA0013.outlook.office365.com
 (2603:10b6:a03:59d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 16:06:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 16:06:41 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:11 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:06:11 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG68W33425232;
	Wed, 30 Sep 2026 11:06:08 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v2 00/22] Cleanup and Refactor TI-SCI driver
Date: Wed, 30 Sep 2026 21:35:45 +0530
Message-ID: <20260930160607.2674980-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|IA3PR10MB8639:EE_
X-MS-Office365-Filtering-Correlation-Id: 45e8f13d-1ec7-443f-4ceb-08df1f0cd0b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|56012099006|10067099003|6133799003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	uMRmH+uH12oBMZUvrbtwOCiVG8Cf//tlsGfdJBzW8tfXCZl7KWOIwRT0S6XdyWxefWiasMzdXueCnvuOP1QLvm+6AdS4p/v7c3oYMJDsZDyb9Mam8rSPjUTXSqoVlFwWX2deT9qPpSZo3Eg1IFMIs+4rTzROg4jZ/b/awxtKNgpgoicdiFYCUtUuJxZGrpJFrFDjFdIK+22mGdwgbc1NdwtDjw2kXbpEEFV+5KZayjhAq0oNkid/oALqB0VbXdwRSBJ8JCsMbjns4ire+yHWQMsU+b/JDyPZYWUKpNsF4ttsyIpnNz/4zJ0PdclVxP3b9xpoKuXtum+gSEnF1qJ2LEdlwOiolvt6biivXwYydP0qKfqqn/S17O9H0Ya63gJh/4wJEKOfIfY3Iis+mggceMzbWD88wAHfHV1KFzuqYExbmWe59Nz5IGKNUDsfHcmWKFqPOExrGBsN2njb60AguCVS4ranmP7PT2aunRl540YDYwAz0WiidddDEU7kHzzZQjzJTHdLdnCbQcrqsaPEg8YIvsOZAgSJuEF87l0djnDp34Hemx6PwEUHKsjIWf7g6zo7bINGT5hioA4EkiGHub9badn8yJxWmL9YdNhSmBV3rO1VPnxoiKF0SWz2CdPrmd2kAd2cQIFcTQsIm08lnbahKA5d/QImaoJAAGeahziLB5+l+llc9eylxBLMkip12/Ktam2a98m5oXXhGmni3g==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	20z022/HtXcOu35n59gMaPtZo9HpnLoix8/9xgzbTS4AJgMUPzjRIe82PfQM5dr3DlmQajzKLHcir5fQBKllymaeBlZmGpkd/npvz32or77M7L1tDI8G4aUKbomnjpWuwGNZwW1hOCJAVe7tQ9rcV6HYAmaPBiD9GP+JWrQdCR5Sg4KYk6yGWnYcjun5APuULegsqNE0+Q/VD59IiuiHXZz+V1TQrsTTttau/6wgtgv7j3UqS2i152W4Iwr7WP93B4BuxnOoHh5IeGMw/P94oCGtCLlD6+dWZi+CFlSgbRkYXLDsUMTwd1XkwnsFYLIqySSoN8os4w9S4FjdXOqNmW5Z8/enGMFmweLJ2dHy2nmUvP8RQ/sNQ/9E7aCErFpbpOSeju2KHS3yulQwI/q+qw0nb9PjNjTBJ1nuvl1P38b8mrRFZQg0pmWaq3UXjvZL
X-Exchange-RoutingPolicyChecked:
	l8oeM5jpzlKRMYtMANsflSFswHXk7e7CoMib3j0yuOLeh0POZ8qt0v3c+g+uqAI/GDRhzLgF+TNBwjRU6QwuBBTKJ5ZU4FijLIC8FZYH/BP8otl0m2etu2EB9T1ffeGzjEctTAT4wj/j0mPX51uO427nusHb22Ym5sZo0t+opJG61Ty7971g1cKbC6WRWoS+ErC6bBVY5uoExAlyOQb+i4FJ76IFxPR4I7Qiafan6p8hqWYjXuHmHxMKoEo3qx/Sxw7W1xL2kViogALfJU4xBxRY6GH/edMmRjSpIXzyVSz8tQmFHapal2cJtSln6BvZT5idHzkB5zoiJ8jmeJqUsA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:06:41.0318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e8f13d-1ec7-443f-4ceb-08df1f0cd0b6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8639
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfXyfBfNeHVuf99
 meu2bwT6DnVmnv0TVZgrY7F69LDuVAbM8OAJN/AvSJ4Wn/BpZ/38h8r8fwwXn0k1AUN/XhnEo4e
 KoalnEZ5M/TAD4OB1XN/ZjtjhieYy5w=
X-Proofpoint-ORIG-GUID: GcnRv9dgNkOK2jyjRvq1JOBKWIT0T1Lm
X-Authority-Analysis: v=2.4 cv=C7R8WgP+ c=1 sm=1 tr=0 ts=6abd3396 cx=c_pps
 a=/NeaHkXls/iJsjBnUIdqww==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8
 a=FQqB_tFWpP6lRHZUUu8A:9
X-Proofpoint-GUID: GcnRv9dgNkOK2jyjRvq1JOBKWIT0T1Lm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfXxd8o5Pjuc3Sz
 UNMw5DQq8qgbbtffNTXGWR3qIApvzhF7ebgsiIB6EbAboL25Lzv6KqGMQs/hkMOVQnKmVgOPiJO
 azNT7sEkPlrVRQnXTO01XZ7JiJkTu728dgntUf0HH8UgQZpV9hhbEOSjWmsfNutYK5pk1Y7N5IH
 X07JmJ0vsfI9oZBH83TyF7VJagHxftn+x3Bs2CLdt4v+SpffyOiScoVSVx6BX7LchROVoReicDM
 2e7BCgaT2cS9NjvHzuotWtldJ35o/zZ2cUVkc+eprm10uUIRK6fYgWo6gNdGnvVXwjmZR+VklBM
 8ubbmn64WMXLCeogBfX1PRABapPZx2bw/bnHgmGsnzQ1GSJYGTUpgP6kK+lDB5jUseN1wO1SZtQ
 0JbyfgtbCwjPJSi6IaQe8fMydqXiqh2V0rZKBpZ2FTFLRocr2r32LrYVvy2CfmZlubiAvSfdHcT
 DrAmMt+XUGr9T0A1OAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

This series does a lot of cleanups and refactoring of the TI-SCI driver.

Patches 01-11:
The first part of the series refactors a lot of common code from each of
the TI-SCI message functions into a single place (get_one_xfer() and
do_xfer()). Result is removal of net ~740 lines (~20% of the whole driver
size) without changing functionality.

Patches 12-15:
The second part of the series does some preparatory work for being able
to break down the single large TI-SCI file into smaller files.

Patches 16-22:
The third and final part of the series breaks down the single large
ti_sci.c file into smaller logical files: ti_sci core, device, clock,
pm, rm, and proc. This allows for better readability and maintenance.

Note:
Since the [PATCH 10/22] (first part of the cleanup) now passes local
stack values as part of request, the following[0] patch series
in the underlying mbox layer is ideally needed. It is better for those
patches to be picked to avoid any KASAN warnings and possible duplicate
message resends.
[0]: https://lore.kernel.org/all/20260930143810.2419010-1-b-padhi@ti.com

v2: Changelog:
1. Fix build for arm32 platforms like keystone by including appropriate
headers in ti_sci_rm.c in [PATCH v2 21/22]. 

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-1-b-padhi@ti.com/

Testing Done:
 - Boot tested on all TI K3 SoCs.
 - Boot tested on Keystone platforms like K2G-EVM, K2G-ICE, K2HK-EVM.
 - Tested some of the Core, Device, Clock, and Proc ops with remoteproc
 - Tested each patch for no new warnings or errors.

Logs:
https://gist.github.com/3V3RYONE/b8ef9d63eaa45db251dc84306b1451e0

Thanks,
Beleswar

Andrew Davis (18):
  firmware: ti_sci: Move error message handling into
    ti_sci_get_one_xfer()
  firmware: ti_sci: Move error message handling into ti_sci_do_xfer()
  firmware: ti_sci: Move check for ACK into ti_sci_do_xfer()
  firmware: ti_sci: Remove out of place RM debug messages
  firmware: ti_sci: Name response variable resp for consistency
  firmware: ti_sci: Handle xfer cleanup inside ti_sci_do_xfer()
  firmware: ti_sci: Pass request struct into ti_sci_do_xfer()
  firmware: ti_sci: Combine xfer allocation and transfer functions
  firmware: ti_sci: Fetch info struct from handle inside
    ti_sci_do_xfer()
  firmware: ti_sci: Use tx_message as message buffer directly
  firmware: ti_sci: Use rx_message as message receive buffer
  firmware: ti_sci: Do not export reboot control
  firmware: ti_sci: Move the huge ti_sci file into its own directory
  firmware: ti: ti_sci: Add missing includes for self-contained headers
  firmware: ti: ti_sci_device: Move device ops into its own file
  firmware: ti: ti_sci_clock: Move clock ops into its own file
  firmware: ti: ti_sci_pm: Move pm ops into its own file
  firmware: ti: ti_sci_rm: Move rm ops into its own file

Beleswar Padhi (4):
  firmware: ti_sci: Fix some kernel-doc references in structs
  soc: ti: ti_sci_protocol.h: Add missing documentation for structs
  firmware: ti_sci: Use pmops fxn pointers in suspend/resume hooks
  firmware: ti: ti_sci_proc: Move processor ops into its own file

 MAINTAINERS                            |    2 +-
 drivers/firmware/Kconfig               |   17 +-
 drivers/firmware/Makefile              |    2 +-
 drivers/firmware/ti/Kconfig            |   17 +
 drivers/firmware/ti/Makefile           |    9 +
 drivers/firmware/{ => ti}/ti_sci.h     |  258 +-
 drivers/firmware/ti/ti_sci_clock.c     |  553 +++
 drivers/firmware/ti/ti_sci_core.c      | 1320 ++++++++
 drivers/firmware/ti/ti_sci_device.c    |  388 +++
 drivers/firmware/ti/ti_sci_pm.c        |  145 +
 drivers/firmware/ti/ti_sci_proc.c      |  214 ++
 drivers/firmware/ti/ti_sci_rm.c        |  910 +++++
 drivers/firmware/ti_sci.c              | 4259 ------------------------
 include/linux/soc/ti/ti_sci_protocol.h |  389 ++-
 14 files changed, 4121 insertions(+), 4362 deletions(-)
 create mode 100644 drivers/firmware/ti/Kconfig
 create mode 100644 drivers/firmware/ti/Makefile
 rename drivers/firmware/{ => ti}/ti_sci.h (89%)
 create mode 100644 drivers/firmware/ti/ti_sci_clock.c
 create mode 100644 drivers/firmware/ti/ti_sci_core.c
 create mode 100644 drivers/firmware/ti/ti_sci_device.c
 create mode 100644 drivers/firmware/ti/ti_sci_pm.c
 create mode 100644 drivers/firmware/ti/ti_sci_proc.c
 create mode 100644 drivers/firmware/ti/ti_sci_rm.c
 delete mode 100644 drivers/firmware/ti_sci.c

-- 
2.34.1

