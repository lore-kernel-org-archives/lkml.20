Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBB750EBF3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784490; cv=fail; b=hxQqYW2YFT3xqbUtrM+urW2ymyrb6cP11EY20+0LPAuTsr+om8wZxqXoNaeKGwU1/LYU36gcaFeg+wtlpsvnjRfH+OothtduC50XVrbMLuuSymtOPOusyo7Oy16bsueDnEOLp6z5bjScGZSfLY+pKd+/0vJ+r5nh4BQav8lk+bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784490; c=relaxed/simple;
	bh=riIwTDf+UKhZulLSyvr3BXzjxS1YgNS7PSCYaSwL4JE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rgu1oUZcv/it3OCpSYqXNssUNAedfUYIWVUhYMkeqFVrzzHos54CHvT9QD7DVj2iPtgzHTjtxaKwUUngWYCwpgBmIF3omQ5aelz4HtQBC0FI8+hfdfnxVRcS1BOIYG1DF8OoUx9cQ285Dgu1EY2yA+EyJcLfk3TBtrMwTGAEjcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=m8MAfk7/; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=PvFJFGvi; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="m8MAfk7/";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="PvFJFGvi"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1VdL3890161;
	Wed, 30 Sep 2026 11:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4Z6ChbJC5q1Kq++Ue8oSKabm0pkrfzMutOeMKcyR8
	jI=; b=m8MAfk7/QqHZcY58eb38BDd9kx0vimP08//abEtuGHn+3DzM1w+CL3YQV
	VuZOi5edjFfdmDHoK1FCoAGKyoLT+7gDn6UFMX9yf1OhxdAfH/CIwaoP0VG3uXa2
	ttK89wfEdIp78rVfSl9BEzPztFjT3iKWIchBaLNsWMJUEMtrHc8ugxdieHbPwWfh
	ANNJe2v75QLo+jn9AA2zQ47uHpZ0t8IRdHVXwDgqouRSvR5Cwd4vNAfikteGbj71
	w0MoWWItHjfNN5vh37vAsE2nla0DaJUR88wtDoXi9SbV1ukj9tFowWcNIatmbm89
	DayNIcSwEia3UJV4c1PmsDMlCmSjQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013013.outbound.protection.outlook.com [40.107.201.13])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h10s21y62-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 11:07:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EpkSnF7ROnYCIDTO2agc7oTkCte/IvgOAZYHr70IvTGjgP7Wtocxkvmq+BE3BXFmUAXtseMZz0DkrlEq9Sb8WaJrk36tEoI9lOWjQ6RZOL1dsm8jrlBQg6kSn2kFJ75rCioRgU1zg+Q85OGnDTxH2X0+vNd1l/GSmi2KjIxLwGMcBLvL/ImjdSmoV5eyiwV1KN5p26lTZCcH82U1HvkdgneR4oJih0/5gz3dO3Nh+TVt9kcITRPMQG/jtZZAvJO1H0pOPGydRKstK72xyMUOZ82BGyhOEVMtTyOh72aWrNTtgii6lo2usdBwRJIx6wIGXAOm3qBSnRTDoCw+APSErg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Z6ChbJC5q1Kq++Ue8oSKabm0pkrfzMutOeMKcyR8jI=;
 b=OMwk7+e0b+LwP9nR7HBdfcs/M08TbbGf+CSG1OEIjbhr5jCLb969vILdlK7Qz8ZSOMXE/7Dsdr6FDMgicX08A2Ls8XE/NQblMYWmFeCeed19fad8qS/sXiQNy7KYRLCAk5HQep3pd2/CF6h5TKv99p4HZNVJbMDGAwaF2Q5OGikQsIpjXfnJPKdl7q9gILW+G1aOeX1Bk9dtMa2bKbYiPSJXDsiCLxjGmKEF97xwAY32DP+Vex2D9E/M14OW3qeCgUZaTbCDK8i604KQqklvfXBAmKFd5JzsNz2L/IXr1HMS1GLQfYWnxm5sz1oSDUIs34BlAYZGNXqNsY7rZyzltA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Z6ChbJC5q1Kq++Ue8oSKabm0pkrfzMutOeMKcyR8jI=;
 b=PvFJFGviEpPo63bpjBTX3vobM4PYUsxS7tLUNLzdS5fmSEzVJZKwTyNFMrXDMUwjL3OAdpDo7TgoeLeA8OF9Bu/EW6hIao5LyDBFCWcmr7YqW8JmYQzSD/fLe9+0VTiB5AngLfrFSmCSeT8wkG4ycRUuW3ZUC/RSKQyMO1LlI00=
Received: from MW3PR06CA0020.namprd06.prod.outlook.com (2603:10b6:303:2a::25)
 by IA6PR10MB997658.namprd10.prod.outlook.com (2603:10b6:208:5dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 16:07:45 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:303:2a:cafe::2f) by MW3PR06CA0020.outlook.office365.com
 (2603:10b6:303:2a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 16:07:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 16:07:44 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:07:13 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:07:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:07:13 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG68WN3425232;
	Wed, 30 Sep 2026 11:07:10 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v2 20/22] firmware: ti: ti_sci_pm: Move pm ops into its own file
Date: Wed, 30 Sep 2026 21:36:05 +0530
Message-ID: <20260930160607.2674980-21-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930160607.2674980-1-b-padhi@ti.com>
References: <20260930160607.2674980-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|IA6PR10MB997658:EE_
X-MS-Office365-Filtering-Correlation-Id: 645adc24-3051-444a-60df-08df1f0cf694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|56012099006|10067099003|3023799007|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YOcLCThxKcNvw8RYOqY34xFfyNfLTmIYqd0OVLse4hphljpTkfrcKq3WlwJ2mSq3D7CafatcufAiIXxDQV7J17payLgGpa6XmH7T6bpbRh5mtf/eqjrghQVot/elWv1TePn5tW4eW049RnXG74EHKduWJZBu7AynAjEvcb8Ga5NVs6Dzy6FdjdRn3qu0vvDY65fgcJBKr2J/44ZSObMkAeS0fDxh7NuUqiYeyMUkgWmkLFQnwQtOFP3zxeVIjZ8lVeoS5VQmeom6tdo51sGLpoLjhynEMXWrGTnNz3PtRvK+LYiTHxztECYUZFLc/pSGJCK8lwjczEepmJ3LMI42SI5wZ8+MU8I5inBeHbSdNXhAU8Ne2LipeLKDQXPv3bGjDSSPDgW1DvShZiRHfiDkn20HnGtYv17BbSKqCw2gHYvSnOLcZHJHm7iqeS+JCyyR7dpmxYtB86mnrt+kiobrf2hrf8hxYd71E3UoA3Ov44Lb52VeHeope1RaYuJgdYa9ZNXewEh18tKO5DL2Mc6AcBYnigsKbq9GfOcYs9hreiYbXGZxl7J2TgUWIRIetVB6f6SuipT7HKRzkOdtfi89Ndr1PsJe/1jVEdJ7rZkYpPfRjAS+eL0ATca8d3njKXVxytZgzWMqljEAP7C30bhWng==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(56012099006)(10067099003)(3023799007)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2ls4+mmZYDkazVJq6U+L4QBFHm+UVd+uRMWycfZAHh7REO96BCUOTql/vhK5OOJivDhGXVN1ecRFBQ79NW5EMBdn0x5ZWCMUXhxpxKYj6j7vb2PH/sCPBTLbOie/Ybpsw26CrOBmenzG0T8EF47th65cTKpwyQy/kHbC9NpH71tmmitj0Sdz6UVszf1UfIU3rJ2pa3jLwfLNZsni7W8Z4WvKzNvWnp5Ur7ebjknvoej0ulR28taY3sLqv26zvjZSliXrVi4epYv3mWAWQ4j1Fm8NiAUWdkIEs8NdQfGte1EfKq5czKjiXFyA+kj7k6x6/3qHrdbrAKdv2B3fC0X13C0mUQ74fObeyWlMfKDMx677FfargJvH7bIDO6UOI0HUNbFOSIqfxfavZTgRCt5Ci36aRgnBA3pIWaB4TkC3IKQhV/QkX26u3s5c0Tz2negL
X-Exchange-RoutingPolicyChecked:
	C3mhJT4Ady6RnMl1Nd6ZhVxteMOJe8ctlurSuW890tUxSFaGKduT0qhwqlN2kgOOFm7ALKDeRKJAZuGI58Pf6Jp3rVOD9YPmQP/3kBGsACTpjhc03z9ockfC3KvW1DHfBnLcipLIV6GjWJEZ62eZSDXXom3ngC0piTIEB9zSgrSD/d7PoR9EByvIDc6bvQwAR3usj0Hk5Cz19E/mgPVP6z1VJ3cRZwgxUOyRW724v8Sx8wPqyaRAhLpZ5pIQu8/dcSR7VgG6jrsMu08zD0LiSQiigXzRLltelTB+m3gfTNHzBLLW/1ZxmNYQ9O4/8AI9WiiadMNbt0OG5mi9yLfhuQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:07:44.5641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 645adc24-3051-444a-60df-08df1f0cf694
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB997658
X-Proofpoint-GUID: I06QgSckD4hPGGmXlt9KeIa1zCREu7jT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfXwE0WR9HcMy2E
 2SddZ2fReBcEnwiSWCY40wHsJM+D8V011Jz5Md9JBaVH9Hj1PHtn/hvjBwqF2+PzzyP4DrpqS01
 BIRqfJ7UAfWdVIE0LOcWjbtBS2mCxieF2hGkv2R9ewWMcoy5Z7TKAE+XQewSozI5ccZoDPxbh06
 u9QN4Etor4T4rV/dXzdl/8nD9/lozSC5V5ryc9Sy3Sfs8hJ8BIzUZv0kx8KAeCB29ES4dHYKWTo
 YvWOwzLwWdTk4Xl57IjrNeeWXMowcj1rb9ghkoGIqNhB2Y71Cd+Ixkvc/WcdXzQYzkGR+5kIFTb
 S6uOagac3Inb57Ho/gURyC1YiuVazGj3AADBY14VBdQF7waYIT/8RCw3FYHjY8hbV8Q7S4roDa5
 tS8OUt8HdlZ52F4XSXmQp9nSMmBmv/NtYMDYyxHOXEHdnfNTsCo98lpbjQxeHGPa2TgC/fVXV6J
 blhOp1Ybx5cCPQiNIDA==
X-Proofpoint-ORIG-GUID: I06QgSckD4hPGGmXlt9KeIa1zCREu7jT
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6abd33d3 cx=c_pps
 a=WlOtikQjNqa04qC7x4SRFg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=jiaZLWohtit7zQGSWZAA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfXwLH6ioLF6ohZ
 wm9xTkR7qCFUipS0qMmvTYRO7ja3m+CXCGEQFVoRLsuOBTvXdngFGyQEvwCYZEY2wjhltEacWuF
 255QVKuOAsuyvDji0xXdOGMgSMuQO9g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

From: Andrew Davis <afd@ti.com>

Extract the power management operations related functions and services
from ti_sci_core.c into its own file. This breaks down the single
large file into smaller logical files for better readability and
maintenance.

The pm ops need access to the TI SCI instance to get the device used for
error reporting. Move struct ti_sci_xfer, struct ti_sci_xfers_info,
struct ti_sci_desc, struct ti_sci_info and handle_to_ti_sci_info() from
ti_sci_core.c into ti_sci.h, along with the includes they need, so that
they can be shared with the split files. Upcoming splits also need
access to the instance state, so this is done once here.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-21-b-padhi@ti.com/

 drivers/firmware/ti/Makefile      |   1 +
 drivers/firmware/ti/ti_sci.h      | 100 ++++++++++++++
 drivers/firmware/ti/ti_sci_core.c | 220 +-----------------------------
 drivers/firmware/ti/ti_sci_pm.c   | 145 ++++++++++++++++++++
 4 files changed, 247 insertions(+), 219 deletions(-)
 create mode 100644 drivers/firmware/ti/ti_sci_pm.c

diff --git a/drivers/firmware/ti/Makefile b/drivers/firmware/ti/Makefile
index c4233542ad57d..bbfe73587a3c7 100644
--- a/drivers/firmware/ti/Makefile
+++ b/drivers/firmware/ti/Makefile
@@ -3,4 +3,5 @@
 ti_sci-y			:= ti_sci_core.o
 ti_sci-y			+= ti_sci_clock.o
 ti_sci-y			+= ti_sci_device.o
+ti_sci-y			+= ti_sci_pm.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
index cce59cac35ed6..7a707c632276e 100644
--- a/drivers/firmware/ti/ti_sci.h
+++ b/drivers/firmware/ti/ti_sci.h
@@ -13,8 +13,107 @@
 #define __TI_SCI_H
 
 #include <linux/compiler_types.h>
+#include <linux/completion.h>
+#include <linux/container_of.h>
+#include <linux/hashtable.h>
+#include <linux/mailbox_client.h>
+#include <linux/mutex.h>
+#include <linux/semaphore.h>
+#include <linux/soc/ti/ti-msgmgr.h>
+#include <linux/soc/ti/ti_sci_protocol.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 
+/**
+ * struct ti_sci_xfer - Structure representing a message flow
+ * @tx_message:	Transmit message
+ * @rx_buf:	Pointer to store received message
+ * @rx_len:	Receive message length
+ * @done:	completion event
+ */
+struct ti_sci_xfer {
+	struct ti_msgmgr_message tx_message;
+	void *rx_buf;
+	u8 rx_len;
+	struct completion done;
+};
+
+/**
+ * struct ti_sci_xfers_info - Structure to manage transfer information
+ * @sem_xfer_count:	Counting Semaphore for managing max simultaneous
+ *			Messages.
+ * @xfer_block:		Preallocated Message array
+ * @xfer_alloc_table:	Bitmap table for allocated messages.
+ *			Index of this bitmap table is also used for message
+ *			sequence identifier.
+ * @xfer_lock:		Protection for message allocation
+ */
+struct ti_sci_xfers_info {
+	struct semaphore sem_xfer_count;
+	struct ti_sci_xfer *xfer_block;
+	unsigned long *xfer_alloc_table;
+	/* protect transfer allocation */
+	spinlock_t xfer_lock;
+};
+
+/**
+ * struct ti_sci_desc - Description of SoC integration
+ * @default_host_id:	Host identifier representing the compute entity
+ * @max_rx_timeout_ms:	Timeout for communication with SoC (in Milliseconds)
+ * @max_msgs: Maximum number of messages that can be pending
+ *		  simultaneously in the system
+ * @max_msg_size: Maximum size of data per message that can be handled.
+ */
+struct ti_sci_desc {
+	u8 default_host_id;
+	int max_rx_timeout_ms;
+	int max_msgs;
+	int max_msg_size;
+};
+
+/**
+ * struct ti_sci_info - Structure representing a TI SCI instance
+ * @dev:	Device pointer
+ * @desc:	SoC description for this instance
+ * @d:		Debugfs file entry
+ * @debug_region: Memory region where the debug message are available
+ * @debug_region_size: Debug region size
+ * @debug_buffer: Buffer allocated to copy debug messages.
+ * @handle:	Instance of TI SCI handle to send to clients.
+ * @cl:		Mailbox Client
+ * @chan_tx:	Transmit mailbox channel
+ * @chan_rx:	Receive mailbox channel
+ * @minfo:	Message info
+ * @node:	list head
+ * @irqs:	List of allocated irqs
+ * @irq_lock:	Protection for irq hash list
+ * @host_id:	Host ID
+ * @fw_caps:	FW/SoC low power capabilities
+ * @users:	Number of users of this instance
+ */
+struct ti_sci_info {
+	struct device *dev;
+	const struct ti_sci_desc *desc;
+	struct dentry *d;
+	void __iomem *debug_region;
+	char *debug_buffer;
+	size_t debug_region_size;
+	struct ti_sci_handle handle;
+	struct mbox_client cl;
+	struct mbox_chan *chan_tx;
+	struct mbox_chan *chan_rx;
+	struct ti_sci_xfers_info minfo;
+	struct list_head node;
+	DECLARE_HASHTABLE(irqs, 8);
+	struct mutex irq_lock;
+	u8 host_id;
+	u64 fw_caps;
+	/* protected by ti_sci_list_mutex */
+	int users;
+};
+
+#define handle_to_ti_sci_info(h) container_of(h, struct ti_sci_info, handle)
+
 /* Generic Messages */
 #define TI_SCI_MSG_ENABLE_WDT	0x0000
 #define TI_SCI_MSG_WAKE_RESET	0x0001
@@ -1567,5 +1666,6 @@ int ti_sci_do_xfer(const struct ti_sci_handle *handle,
 
 void ti_sci_setup_device_ops(struct ti_sci_dev_ops *dops);
 void ti_sci_setup_clock_ops(struct ti_sci_clk_ops *cops);
+void ti_sci_setup_pm_ops(struct ti_sci_pm_ops *pmops);
 
 #endif /* __TI_SCI_H */
diff --git a/drivers/firmware/ti/ti_sci_core.c b/drivers/firmware/ti/ti_sci_core.c
index 848c040f598e0..60d0d64ac4ae8 100644
--- a/drivers/firmware/ti/ti_sci_core.c
+++ b/drivers/firmware/ti/ti_sci_core.c
@@ -13,11 +13,9 @@
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
 #include <linux/export.h>
-#include <linux/hashtable.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
-#include <linux/mailbox_client.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
@@ -25,10 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_qos.h>
 #include <linux/property.h>
-#include <linux/semaphore.h>
 #include <linux/slab.h>
-#include <linux/soc/ti/ti-msgmgr.h>
-#include <linux/soc/ti/ti_sci_protocol.h>
 #include <linux/suspend.h>
 #include <linux/sys_soc.h>
 #include <linux/reboot.h>
@@ -40,53 +35,6 @@ static LIST_HEAD(ti_sci_list);
 /* Protection for the entire list */
 static DEFINE_MUTEX(ti_sci_list_mutex);
 
-/**
- * struct ti_sci_xfer - Structure representing a message flow
- * @tx_message:	Transmit message
- * @rx_buf:	Pointer to store received message
- * @rx_len:	Receive message length
- * @done:	completion event
- */
-struct ti_sci_xfer {
-	struct ti_msgmgr_message tx_message;
-	void *rx_buf;
-	u8 rx_len;
-	struct completion done;
-};
-
-/**
- * struct ti_sci_xfers_info - Structure to manage transfer information
- * @sem_xfer_count:	Counting Semaphore for managing max simultaneous
- *			Messages.
- * @xfer_block:		Preallocated Message array
- * @xfer_alloc_table:	Bitmap table for allocated messages.
- *			Index of this bitmap table is also used for message
- *			sequence identifier.
- * @xfer_lock:		Protection for message allocation
- */
-struct ti_sci_xfers_info {
-	struct semaphore sem_xfer_count;
-	struct ti_sci_xfer *xfer_block;
-	unsigned long *xfer_alloc_table;
-	/* protect transfer allocation */
-	spinlock_t xfer_lock;
-};
-
-/**
- * struct ti_sci_desc - Description of SoC integration
- * @default_host_id:	Host identifier representing the compute entity
- * @max_rx_timeout_ms:	Timeout for communication with SoC (in Milliseconds)
- * @max_msgs: Maximum number of messages that can be pending
- *		  simultaneously in the system
- * @max_msg_size: Maximum size of data per message that can be handled.
- */
-struct ti_sci_desc {
-	u8 default_host_id;
-	int max_rx_timeout_ms;
-	int max_msgs;
-	int max_msg_size;
-};
-
 /**
  * struct ti_sci_irq - Description of allocated irqs
  * @node: Link to hash table
@@ -97,49 +45,7 @@ struct ti_sci_irq {
 	struct ti_sci_msg_req_manage_irq desc;
 };
 
-/**
- * struct ti_sci_info - Structure representing a TI SCI instance
- * @dev:	Device pointer
- * @desc:	SoC description for this instance
- * @d:		Debugfs file entry
- * @debug_region: Memory region where the debug message are available
- * @debug_region_size: Debug region size
- * @debug_buffer: Buffer allocated to copy debug messages.
- * @handle:	Instance of TI SCI handle to send to clients.
- * @cl:		Mailbox Client
- * @chan_tx:	Transmit mailbox channel
- * @chan_rx:	Receive mailbox channel
- * @minfo:	Message info
- * @node:	list head
- * @irqs:	List of allocated irqs
- * @irq_lock:	Protection for irq hash list
- * @host_id:	Host ID
- * @fw_caps:	FW/SoC low power capabilities
- * @users:	Number of users of this instance
- */
-struct ti_sci_info {
-	struct device *dev;
-	const struct ti_sci_desc *desc;
-	struct dentry *d;
-	void __iomem *debug_region;
-	char *debug_buffer;
-	size_t debug_region_size;
-	struct ti_sci_handle handle;
-	struct mbox_client cl;
-	struct mbox_chan *chan_tx;
-	struct mbox_chan *chan_rx;
-	struct ti_sci_xfers_info minfo;
-	struct list_head node;
-	DECLARE_HASHTABLE(irqs, 8);
-	struct mutex irq_lock;
-	u8 host_id;
-	u64 fw_caps;
-	/* protected by ti_sci_list_mutex */
-	int users;
-};
-
 #define cl_to_ti_sci_info(c)	container_of(c, struct ti_sci_info, cl)
-#define handle_to_ti_sci_info(h) container_of(h, struct ti_sci_info, handle)
 
 #ifdef CONFIG_DEBUG_FS
 
@@ -687,128 +593,6 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 	return 0;
 }
 
-/**
- * ti_sci_msg_cmd_lpm_wake_reason() - Get the wakeup source from LPM
- * @handle:		Pointer to TI SCI handle
- * @source:		The wakeup source that woke the SoC from LPM
- * @timestamp:		Timestamp of the wakeup event
- * @pin:		The pin that has triggered wake up
- * @mode:		The last entered low power mode
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
-					  u32 *source, u64 *timestamp, u8 *pin, u8 *mode)
-{
-	struct ti_sci_msg_hdr req;
-	struct ti_sci_msg_resp_lpm_wake_reason resp;
-	struct device *dev;
-	int ret = 0;
-
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	dev = handle_to_ti_sci_info(handle)->dev;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_WAKE_REASON,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret) {
-		dev_err(dev, "Failed to get wake reason\n");
-		return ret;
-	}
-
-	if (source)
-		*source = resp.wake_source;
-	if (timestamp)
-		*timestamp = resp.wake_timestamp;
-	if (pin)
-		*pin = resp.wake_pin;
-	if (mode)
-		*mode = resp.mode;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_set_device_constraint() - Set LPM constraint on behalf of a device
- * @handle:	pointer to TI SCI handle
- * @id:	Device identifier
- * @state:	The desired state of device constraint: set or clear
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
-					    u32 id, u8 state)
-{
-	struct ti_sci_msg_req_lpm_set_device_constraint req;
-	struct ti_sci_msg_hdr resp;
-	struct device *dev;
-	int ret = 0;
-
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	dev = handle_to_ti_sci_info(handle)->dev;
-
-	req.id = id;
-	req.state = state;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret) {
-		dev_err(dev, "Failed to set device constraint\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_set_latency_constraint() - Set LPM resume latency constraint
- * @handle:	pointer to TI SCI handle
- * @latency:	maximum acceptable latency (in ms) to wake up from LPM
- * @state:	The desired state of latency constraint: set or clear
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
-					     u16 latency, u8 state)
-{
-	struct ti_sci_msg_req_lpm_set_latency_constraint req;
-	struct ti_sci_msg_hdr resp;
-	struct device *dev;
-	int ret = 0;
-
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	dev = handle_to_ti_sci_info(handle)->dev;
-
-	req.latency = latency;
-	req.state = state;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret) {
-		dev_err(dev, "Failed to set device constraint\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 /**
  * ti_sci_cmd_lpm_abort() - Abort entry to LPM by clearing selection of LPM to enter
  * @dev:	Device pointer corresponding to the SCI entity
@@ -1708,9 +1492,7 @@ static void ti_sci_setup_ops(struct ti_sci_info *info)
 
 	if (info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED) {
 		pr_debug("detected DM managed LPM in fw_caps\n");
-		pmops->lpm_wake_reason = ti_sci_msg_cmd_lpm_wake_reason;
-		pmops->set_device_constraint = ti_sci_cmd_set_device_constraint;
-		pmops->set_latency_constraint = ti_sci_cmd_set_latency_constraint;
+		ti_sci_setup_pm_ops(pmops);
 	}
 
 	rm_core_ops->get_range = ti_sci_cmd_get_resource_range;
diff --git a/drivers/firmware/ti/ti_sci_pm.c b/drivers/firmware/ti/ti_sci_pm.c
new file mode 100644
index 0000000000000..6ea09a7e342e7
--- /dev/null
+++ b/drivers/firmware/ti/ti_sci_pm.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Texas Instruments System Control Interface Protocol Driver
+ *
+ * Copyright (C) 2015-2026 Texas Instruments Incorporated - https://www.ti.com/
+ *	Nishanth Menon
+ */
+
+#include <linux/errno.h>
+#include <linux/soc/ti/ti_sci_protocol.h>
+
+#include "ti_sci.h"
+
+/**
+ * ti_sci_msg_cmd_lpm_wake_reason() - Get the wakeup source from LPM
+ * @handle:		Pointer to TI SCI handle
+ * @source:		The wakeup source that woke the SoC from LPM
+ * @timestamp:		Timestamp of the wakeup event
+ * @pin:		The pin that has triggered wake up
+ * @mode:		The last entered low power mode
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
+					  u32 *source, u64 *timestamp, u8 *pin, u8 *mode)
+{
+	struct ti_sci_msg_hdr req;
+	struct ti_sci_msg_resp_lpm_wake_reason resp;
+	struct device *dev;
+	int ret = 0;
+
+	if (IS_ERR(handle))
+		return PTR_ERR(handle);
+	if (!handle)
+		return -EINVAL;
+
+	dev = handle_to_ti_sci_info(handle)->dev;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_WAKE_REASON,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret) {
+		dev_err(dev, "Failed to get wake reason\n");
+		return ret;
+	}
+
+	if (source)
+		*source = resp.wake_source;
+	if (timestamp)
+		*timestamp = resp.wake_timestamp;
+	if (pin)
+		*pin = resp.wake_pin;
+	if (mode)
+		*mode = resp.mode;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_set_device_constraint() - Set LPM constraint on behalf of a device
+ * @handle:	pointer to TI SCI handle
+ * @id:	Device identifier
+ * @state:	The desired state of device constraint: set or clear
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
+					    u32 id, u8 state)
+{
+	struct ti_sci_msg_req_lpm_set_device_constraint req;
+	struct ti_sci_msg_hdr resp;
+	struct device *dev;
+	int ret = 0;
+
+	if (IS_ERR(handle))
+		return PTR_ERR(handle);
+	if (!handle)
+		return -EINVAL;
+
+	dev = handle_to_ti_sci_info(handle)->dev;
+
+	req.id = id;
+	req.state = state;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret) {
+		dev_err(dev, "Failed to set device constraint\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_set_latency_constraint() - Set LPM resume latency constraint
+ * @handle:	pointer to TI SCI handle
+ * @latency:	maximum acceptable latency (in ms) to wake up from LPM
+ * @state:	The desired state of latency constraint: set or clear
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
+					     u16 latency, u8 state)
+{
+	struct ti_sci_msg_req_lpm_set_latency_constraint req;
+	struct ti_sci_msg_hdr resp;
+	struct device *dev;
+	int ret = 0;
+
+	if (IS_ERR(handle))
+		return PTR_ERR(handle);
+	if (!handle)
+		return -EINVAL;
+
+	dev = handle_to_ti_sci_info(handle)->dev;
+
+	req.latency = latency;
+	req.state = state;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret) {
+		dev_err(dev, "Failed to set device constraint\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * ti_sci_setup_pm_ops() - Setup the pm operations structures
+ * @pmops:	pointer to TISCI pm ops structure
+ */
+void ti_sci_setup_pm_ops(struct ti_sci_pm_ops *pmops)
+{
+	pmops->lpm_wake_reason = ti_sci_msg_cmd_lpm_wake_reason;
+	pmops->set_device_constraint = ti_sci_cmd_set_device_constraint;
+	pmops->set_latency_constraint = ti_sci_cmd_set_latency_constraint;
+}
-- 
2.34.1

