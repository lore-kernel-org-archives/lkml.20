Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C4B43BDDE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797352; cv=fail; b=unE5AyByzUnX6k9cqjb6UKfNejfLu0UxBo8CoAxwTZFuE+b6QMbsc6Pj6rrWDF0svJY+qJSsP0rbRMt7oS+t+Xhd8heUkWojjezd6l6x1jQxwuAg97OpxAq2tVmhzy4X2jZP9DRyRK3gAex4LNEbuZRs/6Qd45GQPa/i5Ku7gFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797352; c=relaxed/simple;
	bh=mFqOZ3UyeQFJ6HrEb8piwn9F+Y7ydhsIZ6lpyygVA6Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lDat0zSGdJr1arjG1x6Uk/u5zuih71lx0enWsp8ugtZBaSDTk594LkQOGhOa1slbnTE4TyjDprxNE3WoukkuMB8G9UvvR4f5NL5DJzeAHV615IqcGW2q6rjUYkum6aAahe4mMsLGkYMHWVZNO+jgbnwel3jkaAQaTurwdc6Vhgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=RRFMHVbs; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=OuX0VhkO; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="RRFMHVbs";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="OuX0VhkO"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UHfXYR3975595;
	Wed, 30 Sep 2026 14:42:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=TQJ7TQWFexdc2zgp/FjX4MwzT71/mz8YSo02ISsSC
	RQ=; b=RRFMHVbsaWcuSoQeg45/i5UbmgT+9moL4p/8Mqhj31uq2JKeQAYQpJHlL
	osuC9AJ5pWdXxe7f79i+IFJeRURP1HhCXZSYYkiJ1o93UH2Z4BjI+gjU4ZaTtR7i
	lDrFFcb0hn31mZP8C5EYMZ5ZgD2xCq5E5hDu34id9LwPR3Jrj0SP6voAZuSdItyo
	7Xk1POVPeCYPyPsBB5UbSsOt6SgtSbF6CnSgoBHYFFa81wZ5JFAXSdTlZ2+2MQ/N
	hgHhnUjUosZ8aV5e4kewvlaecRgj2J0SF6i+pVzOu2IOUrUtdm2I8KaYj9uYAOE+
	Bg6xrXZtkEvTJRExQaFGVV8pdJWGQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011038.outbound.protection.outlook.com [52.101.52.38])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0ydvbj4q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 14:42:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tnD5uq6OzI0mK7isCMkDXjDFlLHdyZ6eag67JDwjGLsjzygvGmH6KbwIl3O3Qe1iSNOJAiwjvZ7+f6j38VaavXi+r6e0ldZgESemicfx8Rrrxndq7tJa5oxO/3iV9JhcmQngEG7/3coLlOTr3GTKT4WFfmdlMED7NNwdYTcT/43x711EY3p1kEUYU/gs8fawUE/HLoZ1fVsSBh67Hj3aCylwwgQ1IhIPYfkAT62q1YRNSojJGgUgtNtcA/rlaQ8LMN6yi62Bb4+Gz4ZBFf7hdJ5NZoUyFDzBjdb+419E7VgGQ8M1BxHaFC4HwAvTcaKF9DbwHqv61EmFLcPFepq0/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQJ7TQWFexdc2zgp/FjX4MwzT71/mz8YSo02ISsSCRQ=;
 b=EnQaxqpHKpZGzYETm8N75oqASdjSAihQktxX6Lx8OkywGRzQySkOSQ7wNRTOPYzUTJeDmfn9GiXjwSPsI5KObnNxUWJiwC/B9O+sM6O1DIsBIip4OTbyB75uYzdjSrdPMeXQ2IsQXYFjMEp3AH1HHEmDk8VDLMgHHkCKvapKjfGg6kUkCEq3mYWH7UA8xDxbxBK9bZBNUSMk5HmPfEZUctz4nmEf2zyyk6QlkYMpvOa6NiQzw6nZXiMKPXFUotLFUjTaEDdlea9N8g1eLY4H1ft7kiTdoRcNS2MlGDWlP+gYrwj6lh0RuBQY014tr0R/meUSa+Io/i3XbmB8/XQhwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQJ7TQWFexdc2zgp/FjX4MwzT71/mz8YSo02ISsSCRQ=;
 b=OuX0VhkOkNnyHxC8U5cemN3KnWAivgK3vV/e4WphZW82PrRKcnJZpREuFoEM69Jfm+ZIIj1kjy/lm/XSZRCLBX2sY0tHwVXkgMmHoryN9xW3eJvL0sJ354dfmu37AxxdArYIj00Pa5XwxHHw018TVA6Z6gzjsJJ+fFrxR3tKiIc=
Received: from SJ0PR13CA0133.namprd13.prod.outlook.com (2603:10b6:a03:2c6::18)
 by SJ5PPF8DB18B996.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7b8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 19:42:14 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::43) by SJ0PR13CA0133.outlook.office365.com
 (2603:10b6:a03:2c6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 19:42:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 19:42:14 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 14:42:00 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 14:42:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 14:42:00 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UJfbCi3734543;
	Wed, 30 Sep 2026 14:41:58 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <afd@ti.com>, <u-kumar1@ti.com>, <vigneshr@ti.com>, <b-padhi@ti.com>
Subject: [PATCH 4/6] firmware: ti: ti_sci_device: Add ABI5.0 compliant Device and Reset APIs
Date: Thu, 1 Oct 2026 01:11:29 +0530
Message-ID: <20260930194131.117129-5-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930194131.117129-1-b-padhi@ti.com>
References: <20260930194131.117129-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|SJ5PPF8DB18B996:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a9f82a1-c2ae-4e1d-8964-08df1f2aed8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|13003099007|18002099003|22082099003|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	jv7cs4AaaSxC48EUdC40WCMELTWrIJS0cDIIrifeREBhY7fScA+5bs9dt5pww2289mMegStJI9sYj+Em4TSkrqO0Wk+1NSdL90ldrpz3gFhmCYn4b22+ON+uIlvgANtboyaio9zIOiPsra4zUNzOLTtSKCIXByT9leS8CQKYmsToYR3EqgmTtGLNdfBArsykEHa5IWnJqE1Gmq0zl1Ix4nMHs5SOxo72FojVYYnR053Di8TgXU7ZvaKAgg+8uCGTn5QUHGnqisNks9XmcaW3ru3o2uLPfgG5xIB1Gcbf/1eiZ+ar+fZedFtBH1tpX6MmlzVMlohLDejJa9+pDkmfh4HvnJCDoG/GhsqyQF3r9UTi8MS/eZluGSqAGsZ8m1GYUFDGmCmIlHddABF1tzXuriyKVk1LFhZozdKqFwDpeI/j2WTRei0/aruGfO32V1Dv3UcCJJuJaXo2e+Sa750Ak7BdpwDle9XmfdoY3wGVPvQSpZxUhjtrfNSVChbi1Z+B3co5z51sFjLq6tGpulqncJgEkXCt6MJIxlJIEXuOnqXNRrcGm4WpxGMc80HhLaMgja4CKeCOWlIhZYkqnfT7MbYPBP/WXRD7JP+e10Xw2Uabf2ak8OPI553XGN1Wct/syeh0KN+EUS+/KYu8r7Riy2gekHQT/+/j94Q4KFXzRCnLJ+C0ckjLL4L8tH0NqMMcOrYWrYEac5hokonS/EtxTQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(13003099007)(18002099003)(22082099003)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R05eBiA6uVs+50gYUjychX4LuMXkSjBFpMRtCniNp46jI2+vI3PzX20kIRKDLN87nqeuA9SU7462zGJqBxSfU4rw3oXOnK5xuW7KqrwJK/X27kkvKvMcNFNIw/3pqLZALdl5NnHj9dOv7LIbYxVLX/+/zlKljX8Ydgl80KUZ1s14p+wsy3Q3bN3pIfLUg9Fz33ZwPVkp+IpgzkNzAhakQcZPDkHMeC0JVz1jy99oVJwHREX3IPakXLQcASWEZ36tMUOOo8b6kNKi8xDoALIg2lLGB6gLSHpJPuweQ+wh8UGhqfRanec6WBFeb7e0DYfKGONnt4CLA10iJgGrqrD8xbFCFIJtjE3pTlrXddUXOvs8qaDlWw/KIdLf+fDbPDVZd/s98k9ElKTDjscT2jGtDC1U+3EcrWENfKX4eKe/pu5EFF+FTp3npx5QYfW8YwuZ
X-Exchange-RoutingPolicyChecked:
	e2burISzEo50c4WgoeamxDtKbhs075t+ZYiK65/ist2bPya6zUMx1X5QE/xaSHBCK0LJLrYGJDf0tZpQnGeK4hweaI7f7/PSwY7ojRN6uwJ0nRIsDp8AOnNYkuhSCi/OSNjkvYbckQ9KU1/u0uJZI1esFy/R+T2LAH5Gbr5LCs8gi1EuV0Qvj1zzqsKx3GHpvOkJw2sJpEOb3F1e+npRIeUq/zDOsSiJ4loR3bvXqotb7/ZHa5NniolMd9MomfOVXcSJSNYv/TiyULmXF1TBYnwP3CNT1ZXzG9onlIOZ6AVZNEgOnzWlyj3DO6ULq5KwMis8vCOwqXrWwauzg7MGIg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 19:42:14.3185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9f82a1-c2ae-4e1d-8964-08df1f2aed8f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8DB18B996
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA4MCBTYWx0ZWRfXz5tAPw2k4uls
 qUnfOIuBJg5CXkObbOjN4CdX5GvgWeNunUaC4cjGTmJxFEjItn/qgFLLEPIi9YPg0dVPzxJF3tC
 3zo0xC3BdxL3c6Fov2lz0TEYAMJkYD8=
X-Proofpoint-GUID: Tm6bDVZNeJJd1quKklswgT2H1R_Mr9S5
X-Authority-Analysis: v=2.4 cv=TegDJhQh c=1 sm=1 tr=0 ts=6abd661e cx=c_pps
 a=Lazl6XkH4A3N9SONPos2PQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=XwxbQEutMPXDA6IjfYEA:9
X-Proofpoint-ORIG-GUID: Tm6bDVZNeJJd1quKklswgT2H1R_Mr9S5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA4MCBTYWx0ZWRfX6oD4W88Dn9f7
 OhivXhuBkorbv1tunwDkXg/68nm835WVPZK8L0Mf732Z4wYQEeimgzK0INTOPuubF9Ok99lYbpB
 WO83+JbTa4A6n6EZi8CTB8MwhoOh9bOdvj06K7vFbE5i4XWstMUfvGzCU+n0TJ4RAHg4TiAP71v
 9lGOeyjDMLP+w8sTSHwTyiKE7IIrJiaCNhupVUJyeizTNBH4iJ7tafUCQ0y+I/8Ap/dmjQtb2Nf
 oI6fCZ9kC6B5WNNSjLuepUt7uyUQqTu2mkFsAmnEBmmbszOhpatCGeMWB8Cx72D8kqAJRHAb4Z4
 TK+MBjHLBDqANf/Qmuzf+jyO5fxtivQ+SLe0mHsaFvUTfnT36KuWAfRDM/0Bj1Y8UYk2hjzfD+r
 SImfbke9e5+vGr6z61JVfH586N0SuNm3O6ZMeXmbw55oEYumBXymfR4G1/m6gCPgQrdBZwNxp0k
 pCNus5+8clAwrahNLAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300080

The previous TI K2G and K3 architectures were tightly coupled systems in
terms of Safety and Security. All the TI-SCI messages from HLOS (Linux)
were sent to a single sec proxy thread terminating at the core running
Safety service (DM). In K2G systems, DM handled both Safety & Security
requests by itself. Whereas in K3 systems, DM serviced the Safety
requests itself, and forwarded the Security requests to core running
Security service (TIFS) on the HLOS's behalf. This posed various
limitations:
   a. Increased latency: An extra forwarding hop through DM adds latency
      in requests and responses.
   b. Freedom From Interference (FFI) concerns: Having Safety service
      proxy Security's requests (& vice versa) undermines the isolation
      and FFI of the system.
   c. Potential Deadlock Scenario: Forwarding messages between Safety
      and Security cores can result in a deadlock if there are circular
      dependencies.

To eliminate all the above limitations, the TI TDA54 class of SoCs
introduce an architectural change: Isolation of Security and Safety
services. To realize this enhanced isolation in hardware, two
independent sec proxy threads are now provided for HLOS to communicate
separately with the Security and Safety cores respectively. And the
TI-SCI message forwarding has been eliminated in Software. The System
Firmware ABI5.0 version necessitates this improved isolation
and FFI change.

In ABI5.0, the request message structure for set_device_resets API has
been updated to split the existing single reset bitmap variable into
explicit local_reset and module_reset variables. Add a new API to
extract the module reset and local reset values from reset_state
function parameter and populate them separately in the request. Any
other reset bit cannot be expressed in ABI5.0, so reject it with
-EINVAL.

ABI5.0 also exposes the exclusive status of a device in the response of
get_device_state request. But the layout of the remaining fields (like
'resets') is unchanged. Since there is no user of the exclusive status
info in Linux, reuse this same API for ABI5 and ignore the trailing 8
bytes containing it.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
Note:
This patch is dependent on the following 2 series
1. https://lore.kernel.org/all/20260930172948.2901336-1-b-padhi@ti.com/
2. https://lore.kernel.org/all/20260930160607.2674980-1-b-padhi@ti.com/

 drivers/firmware/ti/ti_sci.h        | 25 ++++++++++++
 drivers/firmware/ti/ti_sci_core.c   | 14 +++++++
 drivers/firmware/ti/ti_sci_device.c | 62 +++++++++++++++++++++++++++++
 3 files changed, 101 insertions(+)

diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
index 708cc95dfc48c..2f633aeab70b1 100644
--- a/drivers/firmware/ti/ti_sci.h
+++ b/drivers/firmware/ti/ti_sci.h
@@ -120,6 +120,8 @@ struct ti_sci_info {
 
 #define TI_SCI_SUPPORTS_PDM_OPS	BIT(0)
 #define TI_SCI_SUPPORTS_SEC_OPS	BIT(1)
+#define TI_SCI_LRESET_MASK	BIT(0)
+#define TI_SCI_MRESET_MASK	BIT(1)
 
 /* Generic Messages */
 #define TI_SCI_MSG_ENABLE_WDT	0x0000
@@ -407,6 +409,28 @@ struct ti_sci_msg_req_set_device_resets {
 	u32 resets;
 } __packed;
 
+/**
+ * struct ti_sci_msg_req_set_device_resets_abi5_pdm - Set the desired resets
+ *						      configuration of the device
+ * @hdr:		Generic header
+ * @id:			Indicates which device to modify
+ * @local_reset:	State of the PSC local reset of the device. 0 indicates
+ *			releasing the local reset while 1 indicates keeping it
+ *			held.
+ * @module_reset:	State of the PSC module reset of the device. 0
+ *			indicates releasing the module reset while 1 indicates
+ *			keeping it held.
+ *
+ * Request type is TI_SCI_MSG_SET_DEVICE_RESETS, responded with a generic
+ * ACK/NACK message.
+ */
+struct ti_sci_msg_req_set_device_resets_abi5_pdm {
+	struct ti_sci_msg_hdr hdr;
+	u32 id;
+	u32 local_reset;
+	u32 module_reset;
+} __packed;
+
 /**
  * struct ti_sci_msg_req_set_clock_state - Request to setup a Clock state
  * @hdr:	Generic Header, Certain flags can be set specific to the clocks:
@@ -1712,6 +1736,7 @@ int ti_sci_do_xfer(const struct ti_sci_handle *handle,
 		   void *rx_message, size_t rx_message_size);
 
 void ti_sci_setup_device_ops(struct ti_sci_dev_ops *dops);
+void ti_sci_setup_device_ops_abi5(struct ti_sci_dev_ops *dops);
 void ti_sci_setup_clock_ops(struct ti_sci_clk_ops *cops);
 void ti_sci_setup_pm_ops(struct ti_sci_pm_ops *pmops);
 void ti_sci_setup_rm_core_ops(struct ti_sci_rm_core_ops *rm_core_ops);
diff --git a/drivers/firmware/ti/ti_sci_core.c b/drivers/firmware/ti/ti_sci_core.c
index 00c43d699e64c..cea4339ac0af2 100644
--- a/drivers/firmware/ti/ti_sci_core.c
+++ b/drivers/firmware/ti/ti_sci_core.c
@@ -707,6 +707,18 @@ static void ti_sci_setup_ops(struct ti_sci_info *info)
 	ti_sci_setup_proc_ops(pops);
 }
 
+/*
+ * ti_sci_setup_ops_abi5() - Setup the operations structures (ABI5)
+ * @info:	pointer to TISCI pointer
+ */
+static void ti_sci_setup_ops_abi5(struct ti_sci_info *info)
+{
+	struct ti_sci_ops *ops = &info->handle.ops;
+	struct ti_sci_dev_ops *dops = &ops->dev_ops;
+
+	ti_sci_setup_device_ops_abi5(dops);
+}
+
 /**
  * ti_sci_get_handle() - Get the TI SCI handle for a device
  * @dev:	Pointer to device for which we want SCI handle
@@ -1371,6 +1383,8 @@ static int ti_sci_probe(struct platform_device *pdev)
 			goto out;
 		}
 
+		ti_sci_setup_ops_abi5(info);
+
 		ret = devm_register_restart_handler(dev, tisci_reboot_handler_abi5, info);
 		if (ret) {
 			dev_err(dev, "reboot registration fail(%d)\n", ret);
diff --git a/drivers/firmware/ti/ti_sci_device.c b/drivers/firmware/ti/ti_sci_device.c
index cb9888ca54a35..06f5a4b3f24bd 100644
--- a/drivers/firmware/ti/ti_sci_device.c
+++ b/drivers/firmware/ti/ti_sci_device.c
@@ -48,6 +48,11 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
  * @p_state:	pointer to p_state
  * @c_state:	pointer to c_state
  *
+ * Note: PDM ABI5 returns an additional 'exclusive_status' device info along with
+ * the above ones. However, since there is no user of the 'exclusive_status'
+ * info in Linux, reuse this same API for ABI5 and ignore the trailing 8 bytes
+ * containing exclusive status info.
+ *
  * Return: 0 if all went fine, else return appropriate error.
  */
 static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
@@ -349,6 +354,41 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 	return 0;
 }
 
+/**
+ * ti_sci_cmd_set_device_resets_abi5_pdm() - command to set resets for device
+ *					     managed by TISCI
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ * @reset_state: Device reset bit field. Only the PSC local reset (bit 0) and
+ *		 module reset (bit 1) are supported.
+ *
+ * Return: 0 if all went fine, -EINVAL if @reset_state has any other bit set,
+ * else return appropriate error.
+ */
+static int ti_sci_cmd_set_device_resets_abi5_pdm(const struct ti_sci_handle *handle,
+						 u32 id, u32 reset_state)
+{
+	struct ti_sci_msg_req_set_device_resets_abi5_pdm req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	if (reset_state & ~(TI_SCI_LRESET_MASK | TI_SCI_MRESET_MASK))
+		return -EINVAL;
+
+	req.id = id;
+	req.local_reset = !!(reset_state & TI_SCI_LRESET_MASK);
+	req.module_reset = !!(reset_state & TI_SCI_MRESET_MASK);
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_DEVICE_RESETS,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /**
  * ti_sci_cmd_get_device_resets() - Get reset state for device managed
  *				    by TISCI
@@ -386,3 +426,25 @@ void ti_sci_setup_device_ops(struct ti_sci_dev_ops *dops)
 	dops->set_device_resets = ti_sci_cmd_set_device_resets;
 	dops->get_device_resets = ti_sci_cmd_get_device_resets;
 }
+
+/*
+ * ti_sci_setup_device_ops_abi5() - Setup the device operations structures (ABI5)
+ * @dops:	pointer to TISCI device ops structure
+ */
+void ti_sci_setup_device_ops_abi5(struct ti_sci_dev_ops *dops)
+{
+	dops->get_device = ti_sci_cmd_get_device;
+	dops->get_device_exclusive = ti_sci_cmd_get_device_exclusive;
+	dops->idle_device = ti_sci_cmd_idle_device;
+	dops->idle_device_exclusive = ti_sci_cmd_idle_device_exclusive;
+	dops->put_device = ti_sci_cmd_put_device;
+
+	dops->is_valid = ti_sci_cmd_dev_is_valid;
+	dops->get_context_loss_count = ti_sci_cmd_dev_get_clcnt;
+	dops->is_idle = ti_sci_cmd_dev_is_idle;
+	dops->is_stop = ti_sci_cmd_dev_is_stop;
+	dops->is_on = ti_sci_cmd_dev_is_on;
+	dops->is_transitioning = ti_sci_cmd_dev_is_trans;
+	dops->set_device_resets = ti_sci_cmd_set_device_resets_abi5_pdm;
+	dops->get_device_resets = ti_sci_cmd_get_device_resets;
+}
-- 
2.34.1

