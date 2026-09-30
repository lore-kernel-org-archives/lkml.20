Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7BC41D202
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797343; cv=fail; b=XahxFozEnCpedxvv7zgCVRuMd4i8ckYyeDGMTY8A2mdnQWUNecc5Zld1E675Hb0H+B5mUDG0EX4XO3cy3ffrqg30gebDgvoPdZVq1OUrEZ0EA3/6BbZ2lXAMIMqwD7xYMAYG5KgNNftcukIeDsasjRuCxfVnCrrfrifXxnJ2zJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797343; c=relaxed/simple;
	bh=A5EVFAMOcsd8J0qKWIvmPB1KATR+jn0U5Q5CR1xWGvg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i4e2/puKoc0+G0gAP+/+raQLOy47BjGGXu4dVWp4ESv5e2Hsg97M83dpjBEH9/F9co8Gqua7fMXjjV0iecblPHxALeQuYLNHSp/HvyVDhX3ebDdrYDOS6F/MO90OSF9EH1r+/UfBaf8DtS6eUy/FrIpfm1a5a07il799pQsWNzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Zj3vUOxt; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=PFBDbwPw; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Zj3vUOxt";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="PFBDbwPw"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UHfYSn3975603;
	Wed, 30 Sep 2026 14:42:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=pM3o3EIKrJ7i5nw7U9nnpyuGn0YpkB3Wv8pc0GJ/g
	Ro=; b=Zj3vUOxtYewXJWdpoGlqB3p6G9l+nOYc0xQYzlGNs525dv3oLrW/s3DXn
	NPd1gRkYCVFmP1Cgf4+Sna6d3+8MR2yFBP6icO/RpXsQkoAbpfd/7ylyQJRtGesc
	KHVGEoNpDFVhxiNtULGPDLPFrO6APrIbeOWLw66JbM29fbb6AivtJWDvKS3DU/sa
	90TlPVUlzQ7YQdgJqiijHHkIjBPmJ3kluuaWsSk46mTuBiXeM0tRuiDeVQMTtQ+z
	pKrSkp0NSfEw/VPLRL4GeuxUXntrn2F47vd/5fFC1hYNicRdcBQQU6zC7/NtoAww
	xXPTALWd6ja9ERxkcmP+pMiLb15jg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010013.outbound.protection.outlook.com [52.101.46.13])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0ydvbj44-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 14:42:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYTLtmh4NrSgJTWfZZGXjDQXhKxx1fImlIQmpfCNAR+5KMLxfDn66zHls8bak0OYFV/7qD+ex+dXvwQ9+tbacZUjrGiKFDmeeBjFEY1ocfiR9ylrhgptguIZ7HKdJz5y4DS1pAub2cp/7yvFspZGisN6OH+Dene8l7veQyhRPwrNkQ2MidTK1PeW9iGv56buWOk3/mP/AEyVCCIw9fD0bZqQcV/oveNeq4ma2lMuYobxRDtBw9gXmIuA6gYAwKkmTTrq/Z+vzyNoCcK6Hs2W+TE0GQZRR7s7kNaMc3Gp1kkKYsS3hrrA3JK+oEoAxgW/8eAaHbXrFGS58sZZDtouUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pM3o3EIKrJ7i5nw7U9nnpyuGn0YpkB3Wv8pc0GJ/gRo=;
 b=lv7Qgg6coDAw6UOtX8u8eFnoY7IQv6ibJf0KdjF7gJDL7az726b5luOmc1tvjHh3M4iE4aDPCJahAt3gYM9ylrXVyl5fHEeINvg4n0n9ZiHE0ZkkQV/QCJ42C5yb6ALKoe6MGQ2IERhfnRNvhuV4zJ4SQByj9GGRwmByum5Jjl6lt5lJm32iKHkVBKYO8m9Lcm1xlzwLhXQUD6W/OxfJu8Nw5+oU2guQQvIkmnBbTgd5yunwVO2w66H9g+B0Zrj3hWt4H1M9ZuCRgqq/ewaf/hA03XqdwcPLDbZMsZTGJVMRRvbK8s9IpYJJjV6PNXsXUQuX8Jx+msI7Ppjg5CKnPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pM3o3EIKrJ7i5nw7U9nnpyuGn0YpkB3Wv8pc0GJ/gRo=;
 b=PFBDbwPwd0yyTGHKYWvMVW2ab7jYOMkrG/TmjcmpmiVTHmtv5f+yUAwqRkjUR5F11HILr35kUKTgz2yCytR0O4Ya7pu/ZrUTYMUzSEVcVKg5QHc9PtXt5YdaSuZABh04rOjfvOgzbmxSWuz1GCTJftYacNkLIfAXQcHP8CoL/ME=
Received: from SA0PR11CA0194.namprd11.prod.outlook.com (2603:10b6:806:1bc::19)
 by BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 19:42:03 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:1bc:cafe::16) by SA0PR11CA0194.outlook.office365.com
 (2603:10b6:806:1bc::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Wed,
 30 Sep 2026 19:42:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 19:42:03 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 14:41:56 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 14:41:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 14:41:56 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UJfbCh3734543;
	Wed, 30 Sep 2026 14:41:54 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <afd@ti.com>, <u-kumar1@ti.com>, <vigneshr@ti.com>, <b-padhi@ti.com>
Subject: [PATCH 3/6] firmware: ti: ti_sci_core: Add ABI5.0 Enhancements and TDA54 PDM SCI support
Date: Thu, 1 Oct 2026 01:11:28 +0530
Message-ID: <20260930194131.117129-4-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|BN0PR10MB5128:EE_
X-MS-Office365-Filtering-Correlation-Id: f13a43d8-d6f4-44e1-8220-08df1f2ae714
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|23010399003|36860700016|22082099003|18002099003|13003099007|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	b1Zi5529pxeSK/GuIO/eLM+zYvOYzYLh304uYAFfW8RLVjKXy0AHnToO8sel5+n8/91UHb0FvuIV4/ac4e27YzVzCco6HkoqljBq0/AGdtqHo4Cf2waEZThmVaZnOvQDn7iZEX2qiMB81rECzM57VFwqJ/gYj5IJ8joxM8YXX8oAO4TgiANPSyd3xrTI3KrCUwoplfkmxpVPqvIHFekxI7GCWnSwvqMLlmyll5kTJlJhewwPRYO3PG7G6NlKBqqZddz0GGRJUqa4CTYe10jXC0zohCxIyh7vjTkJeamfvG5EIQjMpR+1o/8XQ2E6Lw1GDzKsqoekvR/PD+sD3Xd+vEotOcHy7KkO08BeUEQoFJLkV9VIoIEj6JdgVzSIPsmIVu0hBqXrVvuxxj2Z9VSSoue6SMbL+x0ZaWKa1ZRAF7NU0to7esUBfbWhSy60hqH4wGxHOUISRLIAckeN0t/0gZfJcwefGHPgFrQUeDvSJwAkOfGo07HVXD+2TCmBwK95kx80aO5sTVeRTR/f6lPhtdONwoy1MUjEMjqW89h7D38M6GXupICzEV8kXpLUlDOh3hzsnYC5WKU9abcvhDYq/rt3lB6kTpKqUF9efAv2qksfG6g+pmqXzwqxofulmFnsbzUrHhi5rfaWWB1n74QJF59c7pVqJ6d+Au8+lX7+x1szKHLFB7dEUpJ9psVCY41HBNEc4yi07yUj4QJtv14hfA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(36860700016)(22082099003)(18002099003)(13003099007)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1i46XazcVxTSFttZLCul6i0cRN7emEv7sUWLYidpBDtJ1NmV1ruTuFRhdZVokN9ZSmk3fjXIh0AdCngFmGJJ1htY8eN/TO3ObKFWT7JrNuG+5KBQMfndOjHNgDp2b4k4qF20K0LM8QC4nlTeAnFvuevm8XaUlnk+TDC0pEW72pxFr4eoQNCWn3nNGRYKzArCOgFuSxGH5BFW9tzc3KgJLiLVe1ZVPz3PXKoylLz262/Wets9IpEjxSR5rZaIPsa4UP0344JgaemmCbcjq4JILkrTZINfvZ9DxOzXFRvesTCUqqmEPcRlxXnKaCkalAaCHNjjuIlFkXJXuaBLbEa8xs2JB9Xu1ENP/3limHPskTUd69EKcwXdhhD8ExEE92qeifgWCUC+drweNEu8pMWrXLn8F8FWisDKBzGRVfDzhtpJemFc7LsVANJsqeNPqrj4
X-Exchange-RoutingPolicyChecked:
	yNNa+fyZryOw02uGJCAe8m8Z8n/c1+WQGThfUNG+z+n5a3tRKSxbx0ZM6eS8khEjxguNC4KjW0pbcGLnmFJfurgBdGclTOxb4zybk5xpjyC0p3R1zky/kO+T711qs59cwKwOmvRLac/2KVhiVrcUBM/bXMO9y3CogSPy5JZb3p6CDqhJze9mVDy7qJXxAgVxovgGu3exAEGq8uj7EVZpFxp8jD0M9brGJzLaVdgJUYGddTZ9Sja/w+zHZL1GePOMSb4zFGVEvwQLcnPzlREgVSKPHgkXlWC//eTc3Z5PSayZg7A2oHyACcxUdFUvzSTC5dRexnTaspJitce19AAqzg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 19:42:03.5241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f13a43d8-d6f4-44e1-8220-08df1f2ae714
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5128
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA4MCBTYWx0ZWRfXy4s7TTw905Xr
 ppGsi84/9AkgYf24yJyo/AO/cJZ523iSen4xCX/SOtCWhOSx3Hu8V+kr+Vk/aAk6W+ufePVLCTt
 y7Av3gB3LDX7rk0rQQJwOwjwwyuvIjI=
X-Proofpoint-GUID: HOV8NUbDn4MYM4TVGQYx08Vs5RSMzEPk
X-Authority-Analysis: v=2.4 cv=TegDJhQh c=1 sm=1 tr=0 ts=6abd6613 cx=c_pps
 a=vNEawcoOGvNHZjwsohOJ5g==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=YrJdLPtNZ4cyocgbursA:9
X-Proofpoint-ORIG-GUID: HOV8NUbDn4MYM4TVGQYx08Vs5RSMzEPk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA4MCBTYWx0ZWRfXxbIvvrzD3HJP
 V67g0ZsSjnQFeV3XkFXsSWIdq8n2V2XXOQSnaAhZfH+QupL6W5h02OY606q6r9wBU64EIkEgmpm
 ZuYKqZKXGQ2GpIDmkeVyiQyMDnnN5T5pFevoZktj9xRTrEhSIQqv6oqHNUzl3uRXWl/rCAFPcZZ
 f/FZrebgYkPooQxEzUmsd5bAfW/FQZEzk5ctVUZ9hZBFVPI3sSMVLAuDm77RyWCodgrQXiE43U+
 jXc7Dp2lIRY10DF2DrwpAbKkrHso8Y76nlazEVGJWzX2vVARBTWiP1Gq3VebdbwoCJk184X9nH5
 68y6cQJtG7M801DR7Lv8yEQdxFhh3keD0Wt2ai89UDmKXuHoz9a9ZMv8IDJzOYEjTdKWBdQHLHa
 2CVI6nItybmJDFx8XQAMSI8Yg46d98kElbpUD4VLNamu6Pz8m1MXerA53yTXG4PKbgWO4QKTMQh
 hZWAcPRgZf15+wuvVAQ==
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
TI-SCI message forwarding has been eliminated in Software.

The System Firmware ABI5.0 version necessitates this improved isolation
and FFI change by splitting the TI-SCI message IDs into two distinct
address spaces differing in the MSB. As a result, the system reset
message has been re-assigned an ID from the Safety address space:
TI_SCI_MSG_SYS_RESET_ABI5_PDM.

Add support in the driver to probe PDM system controller and add new
ABI5 compliant APIs for Generic system control (Version, System reset).
Existing system controller's support remain unaffected with this change.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
Note:
This patch is dependent on the following 2 series
1. https://lore.kernel.org/all/20260930172948.2901336-1-b-padhi@ti.com/
2. https://lore.kernel.org/all/20260930160607.2674980-1-b-padhi@ti.com/

 drivers/firmware/ti/ti_sci.h      |  36 ++++++
 drivers/firmware/ti/ti_sci_core.c | 184 ++++++++++++++++++++++++------
 2 files changed, 185 insertions(+), 35 deletions(-)

diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
index 8f9f0b1aa767d..708cc95dfc48c 100644
--- a/drivers/firmware/ti/ti_sci.h
+++ b/drivers/firmware/ti/ti_sci.h
@@ -12,6 +12,7 @@
 #ifndef __TI_SCI_H
 #define __TI_SCI_H
 
+#include <linux/bits.h>
 #include <linux/compiler_types.h>
 #include <linux/completion.h>
 #include <linux/container_of.h>
@@ -63,12 +64,14 @@ struct ti_sci_xfers_info {
  * @max_msgs: Maximum number of messages that can be pending
  *		  simultaneously in the system
  * @max_msg_size: Maximum size of data per message that can be handled.
+ * @sci_services: bitmap representing services supported by SCI
  */
 struct ti_sci_desc {
 	u8 default_host_id;
 	int max_rx_timeout_ms;
 	int max_msgs;
 	int max_msg_size;
+	u8 sci_services;
 };
 
 /**
@@ -115,6 +118,9 @@ struct ti_sci_info {
 #define cl_to_ti_sci_info(c)	container_of(c, struct ti_sci_info, cl)
 #define handle_to_ti_sci_info(h) container_of(h, struct ti_sci_info, handle)
 
+#define TI_SCI_SUPPORTS_PDM_OPS	BIT(0)
+#define TI_SCI_SUPPORTS_SEC_OPS	BIT(1)
+
 /* Generic Messages */
 #define TI_SCI_MSG_ENABLE_WDT	0x0000
 #define TI_SCI_MSG_WAKE_RESET	0x0001
@@ -122,7 +128,11 @@ struct ti_sci_info {
 #define TI_SCI_MSG_WAKE_REASON	0x0003
 #define TI_SCI_MSG_GOODBYE	0x0004
 #define TI_SCI_MSG_SYS_RESET	0x0005
+/* ABI5.0 PDM Generic Message */
+#define TI_SCI_MSG_VERSION_ABI5_PDM	0x000F
 #define TI_SCI_MSG_QUERY_FW_CAPS	0x0022
+/* ABI5.0 PDM System Reset Message */
+#define TI_SCI_MSG_SYS_RESET_ABI5_PDM	0x0400
 
 /* Device requests */
 #define TI_SCI_MSG_SET_DEVICE_STATE	0x0200
@@ -233,6 +243,32 @@ struct ti_sci_msg_resp_version {
 	u8 abi_minor;
 } __packed;
 
+/**
+ * struct ti_sci_msg_resp_version_abi5_pdm - Response for a PDM get_version msg
+ * @hdr:		Generic header
+ * @version:		Version number of the PDM firmware
+ * @sub_version:	Sub-version number of the PDM firmware
+ * @patch_version:	Patch version number of the PDM firmware
+ * @abi_major:		Major version of the ABI that PDM firmware supports
+ * @abi_minor:		Minor version of the ABI that PDM firmware supports
+ * @sci_server_version:	String describing the PDM SCI server version
+ *
+ * In general, ABI version changes follow the rule that minor version increments
+ * are backward compatible. Major revision changes in ABI may not be
+ * backward compatible.
+ *
+ * Response to a message with message type TI_SCI_MSG_VERSION_ABI5_PDM
+ */
+struct ti_sci_msg_resp_version_abi5_pdm {
+	struct	ti_sci_msg_hdr hdr;
+	u16	version;
+	u8	sub_version;
+	u8	patch_version;
+	u8	abi_major;
+	u8	abi_minor;
+	char	sci_server_version[26];
+} __packed;
+
 /**
  * struct ti_sci_msg_req_reboot - Reboot the SoC
  * @hdr:	Generic Header
diff --git a/drivers/firmware/ti/ti_sci_core.c b/drivers/firmware/ti/ti_sci_core.c
index 1f7484b118375..00c43d699e64c 100644
--- a/drivers/firmware/ti/ti_sci_core.c
+++ b/drivers/firmware/ti/ti_sci_core.c
@@ -80,6 +80,8 @@ static int ti_sci_debugfs_create(struct platform_device *pdev,
 	/* Debug region is optional */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 					   "debug_messages");
+	if (!res)
+		return 0;
 	info->debug_region = devm_ioremap_resource(dev, res);
 	if (IS_ERR(info->debug_region))
 		return 0;
@@ -459,6 +461,36 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 	return 0;
 }
 
+/*
+ * ti_sci_cmd_get_revision_abi5_pdm() - command to get version of PDM SCI
+ * @info:	Pointer to SCI entity information
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_get_revision_abi5_pdm(struct ti_sci_info *info)
+{
+	struct ti_sci_handle *handle = &info->handle;
+	struct ti_sci_version_info *ver = &handle->version;
+	struct ti_sci_msg_hdr req;
+	struct ti_sci_msg_resp_version_abi5_pdm resp;
+	int ret;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_VERSION_ABI5_PDM,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	ver->abi_major = resp.abi_major;
+	ver->abi_minor = resp.abi_minor;
+	ver->firmware_revision = resp.version;
+	strscpy(ver->firmware_description, resp.sci_server_version,
+		sizeof(resp.sci_server_version));
+
+	return 0;
+}
+
 /**
  * ti_sci_cmd_prepare_sleep() - Prepare system for system suspend
  * @handle:		pointer to TI SCI handle
@@ -620,6 +652,28 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 	return 0;
 }
 
+/**
+ * ti_sci_cmd_core_reboot_abi5() - Command to request system reset (ABI5)
+ * @handle:	Pointer to TI SCI handle
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_core_reboot_abi5(const struct ti_sci_handle *handle)
+{
+	struct ti_sci_msg_req_reboot req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SYS_RESET_ABI5_PDM,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /*
  * ti_sci_setup_ops() - Setup the operations structures
  * @info:	pointer to TISCI pointer
@@ -937,6 +991,24 @@ static int tisci_reboot_handler(struct sys_off_data *data)
 	return NOTIFY_BAD;
 }
 
+/**
+ * tisci_reboot_handler_abi5() - Restart handler for ABI5 system controllers
+ * @data:	sys-off data, with @data->cb_data pointing to the TISCI info
+ *
+ * Return: NOTIFY_BAD, as control is not expected to return here once the
+ * system reset request has been accepted.
+ */
+static int tisci_reboot_handler_abi5(struct sys_off_data *data)
+{
+	struct ti_sci_info *info = data->cb_data;
+	const struct ti_sci_handle *handle = &info->handle;
+
+	ti_sci_cmd_core_reboot_abi5(handle);
+
+	/* call fail OR pass, we should not be here in the first place */
+	return NOTIFY_BAD;
+}
+
 static int ti_sci_prepare_system_suspend(struct ti_sci_info *info)
 {
 	/*
@@ -1122,6 +1194,7 @@ static const struct ti_sci_desc ti_sci_pmmc_k2g_desc = {
 	/* Limited by MBOX_TX_QUEUE_LEN. K2G can handle up to 128 messages! */
 	.max_msgs = 20,
 	.max_msg_size = 64,
+	.sci_services = TI_SCI_SUPPORTS_PDM_OPS | TI_SCI_SUPPORTS_SEC_OPS,
 };
 
 /* Description for AM654 */
@@ -1132,11 +1205,24 @@ static const struct ti_sci_desc ti_sci_pmmc_am654_desc = {
 	/* Limited by MBOX_TX_QUEUE_LEN. K2G can handle up to 128 messages! */
 	.max_msgs = 20,
 	.max_msg_size = 60,
+	.sci_services = TI_SCI_SUPPORTS_PDM_OPS | TI_SCI_SUPPORTS_SEC_OPS,
+};
+
+/* Description for TDA54 PDM System controller */
+static const struct ti_sci_desc ti_sci_pdm_tda54_desc = {
+	.default_host_id = 66,
+	/* Conservative duration */
+	.max_rx_timeout_ms = 10000,
+	/* Limited by MBOX_TX_QUEUE_LEN. TDA54 can handle up to 444 messages! */
+	.max_msgs = 20,
+	.max_msg_size = 60,
+	.sci_services = TI_SCI_SUPPORTS_PDM_OPS,
 };
 
 static const struct of_device_id ti_sci_of_match[] = {
 	{.compatible = "ti,k2g-sci", .data = &ti_sci_pmmc_k2g_desc},
 	{.compatible = "ti,am654-sci", .data = &ti_sci_pmmc_am654_desc},
+	{.compatible = "ti,tda54-sci-pdm", .data = &ti_sci_pdm_tda54_desc},
 	{ /* Sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, ti_sci_of_match);
@@ -1151,6 +1237,7 @@ static int ti_sci_probe(struct platform_device *pdev)
 	int ret = -EINVAL;
 	int i;
 	u32 h_id;
+	u64 fw_caps;
 
 	desc = device_get_match_data(dev);
 
@@ -1228,43 +1315,73 @@ static int ti_sci_probe(struct platform_device *pdev)
 		ret = PTR_ERR(info->chan_tx);
 		goto out;
 	}
-	ret = ti_sci_cmd_get_revision(info);
-	if (ret) {
-		dev_err(dev, "Unable to communicate with TISCI(%d)\n", ret);
-		goto out;
-	}
 
-	ti_sci_msg_cmd_query_fw_caps(&info->handle, &info->fw_caps);
-	dev_dbg(dev, "Detected firmware capabilities: %s%s%s%s%s%s%s%s\n",
-		info->fw_caps & MSG_FLAG_CAPS_GENERIC ? "Generic" : "",
-		info->fw_caps & MSG_FLAG_CAPS_LPM_PARTIAL_IO ? " Partial-IO" : "",
-		info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED ? " DM-Managed" : "",
-		info->fw_caps & MSG_FLAG_CAPS_LPM_ABORT ? " LPM-Abort" : "",
-		info->fw_caps & MSG_FLAG_CAPS_IO_ISOLATION ? " IO-Isolation" : "",
-		info->fw_caps & MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED ? " BoardConfig-Managed" : "",
-		info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST ? " IRQ-Context-Lost" : "",
-		info->fw_caps & MSG_FLAG_CAPS_LPM_CLK_CONTEXT_LOST ? " Clk-Context-Lost" : ""
-	);
-
-	ti_sci_setup_ops(info);
-
-	ret = devm_register_restart_handler(dev, tisci_reboot_handler, info);
-	if (ret) {
-		dev_err(dev, "reboot registration fail(%d)\n", ret);
-		goto out;
-	}
+	/* Handle System Controller specific probe routine */
+	switch (info->desc->sci_services) {
+	case TI_SCI_SUPPORTS_PDM_OPS | TI_SCI_SUPPORTS_SEC_OPS:
+		ret = ti_sci_cmd_get_revision(info);
+		if (ret) {
+			dev_err(dev, "Unable to communicate with TISCI(%d)\n", ret);
+			goto out;
+		}
+
+		ti_sci_msg_cmd_query_fw_caps(&info->handle, &info->fw_caps);
+		fw_caps = info->fw_caps;
+		dev_dbg(dev, "Detected firmware capabilities: %s%s%s%s%s%s%s%s\n",
+			fw_caps & MSG_FLAG_CAPS_GENERIC ? "Generic" : "",
+			fw_caps & MSG_FLAG_CAPS_LPM_PARTIAL_IO ? " Partial-IO" : "",
+			fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED ? " DM-Managed" : "",
+			fw_caps & MSG_FLAG_CAPS_LPM_ABORT ? " LPM-Abort" : "",
+			fw_caps & MSG_FLAG_CAPS_IO_ISOLATION ? " IO-Isolation" : "",
+			fw_caps & MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED ? " BoardConfig-Managed" : "",
+			fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST ? " IRQ-Context-Lost" : "",
+			fw_caps & MSG_FLAG_CAPS_LPM_CLK_CONTEXT_LOST ? " Clk-Context-Lost" : ""
+			);
+
+		ti_sci_setup_ops(info);
+
+		ret = devm_register_restart_handler(dev, tisci_reboot_handler, info);
+		if (ret) {
+			dev_err(dev, "reboot registration fail(%d)\n", ret);
+			goto out;
+		}
+
+		if (info->fw_caps & MSG_FLAG_CAPS_LPM_PARTIAL_IO) {
+			ret = devm_register_sys_off_handler(dev,
+							    SYS_OFF_MODE_POWER_OFF,
+							    SYS_OFF_PRIO_FIRMWARE,
+							    ti_sci_sys_off_handler,
+							    info);
+
+			if (ret) {
+				dev_err(dev, "Failed to register sys_off_handler %pe\n",
+					ERR_PTR(ret));
+				goto out;
+			}
+		}
 
-	if (info->fw_caps & MSG_FLAG_CAPS_LPM_PARTIAL_IO) {
-		ret = devm_register_sys_off_handler(dev,
-						    SYS_OFF_MODE_POWER_OFF,
-						    SYS_OFF_PRIO_FIRMWARE,
-						    ti_sci_sys_off_handler,
-						    info);
+		if (info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST)
+			hash_init(info->irqs);
+		break;
+
+	case TI_SCI_SUPPORTS_PDM_OPS:
+		ret = ti_sci_cmd_get_revision_abi5_pdm(info);
+		if (ret) {
+			dev_err(dev, "Unable to communicate with PDM(%d)\n", ret);
+			goto out;
+		}
+
+		ret = devm_register_restart_handler(dev, tisci_reboot_handler_abi5, info);
 		if (ret) {
-			dev_err(dev, "Failed to register sys_off_handler %pe\n",
-				ERR_PTR(ret));
+			dev_err(dev, "reboot registration fail(%d)\n", ret);
 			goto out;
 		}
+		break;
+
+	default:
+		dev_err(dev, "Unsupported System Controller\n");
+		ret = -EINVAL;
+		goto out;
 	}
 
 	dev_info(dev, "ABI: %d.%d (firmware rev 0x%04x '%s')\n",
@@ -1280,9 +1397,6 @@ static int ti_sci_probe(struct platform_device *pdev)
 	if (ret)
 		goto out;
 
-	if (info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST)
-		hash_init(info->irqs);
-
 	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
 	if (ret) {
 		dev_err(dev, "platform_populate failed %pe\n", ERR_PTR(ret));
-- 
2.34.1

