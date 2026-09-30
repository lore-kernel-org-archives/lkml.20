Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6363C409277;
	Wed, 30 Sep 2026 19:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797332; cv=fail; b=qDbteW4m35L47mdnAO3rPruxNVV4dYBCnE2OpQ3qGvO/k9JQ9Cx2Jwd4AyrGm6k7dIX/BMr61r+w03U2YdHJg6paGVCXGF8CR057VuhyasVkHahb4OyK/Xa5rd7KsPNadbaGw5mOPdTU+hjuNE1t7iRQnVs70HWuzhfqTmHdKGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797332; c=relaxed/simple;
	bh=KyP5I8M5zY3/OKRXZoazc7VHL3qcUMHUAPXZ3QTSvWU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ghl7YzNZtvhpftP2UfnjhEemHq/fLtAOiA2eDxBVvRB8dV/ttdXBnQKtnHhKfze2iEZ5T1aXVFfd2KUiEkpjAcMb7wJqJ3OOtNSySr3FupeHqIIDsxr1/WRyGapjULpWHU2sGHM+NCwjhrKUj/luxvq3kGhTBgmbfiVwL2G4Vv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=pB9/KoMr; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=ZdCVe8c0; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="pB9/KoMr";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="ZdCVe8c0"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UHfX2d3975584;
	Wed, 30 Sep 2026 14:42:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=kLFH5Gzc0iEiA
	sVq7njiWxNfeuOwN/4VtkS+5bsJ00o=; b=pB9/KoMrRfDJ+qAQSkNo9MjHzCL+u
	5SlRv6Eiz7/CCQuUNyKtw/ajL6ui/gXQtlq3sfSf3yLsj1dtgCpcsRoFyYsZWvmD
	+WigPH1982pep2shzUwpQ/BdpgbbP1NhDI3FZvjTV5moGaaQdl2+4n7uvBAakhVq
	L7Kli54y4Aar63TeajYHWvdvrVSwsc+e6N84NkzvB+zLh7cZq3UKQD3iIHBLoZ7d
	DWptfduFP9vKPeKGECkmbUg58GH3Po0GB03AkbAYbf7vabTqTdeUanrEdDAbtWiN
	P5mfcoU+Uk1QIvB0qaiiFwMX82GZ54sGDYps1QTPQIAwANdwZQE6Igj3A==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012059.outbound.protection.outlook.com [40.107.209.59])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0ydvbj3b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 14:42:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GN3PJ/0JdYb4mzqAlDHh5gHCl5+U7pF5AK2Qu30v1oBAC7SWQUlPjWeYIihv8XSDGoNezB1YjEqwJHTP+B9n00qAzou3YI/kRGEY224G1EdqEZnE61yjVPB76m4ucNEKDd9Eytle27y9eZ3rfImeUY50V6y7M6gFqGOo0MkeMo6EynIoQjuNg0qHAoOPemA9CnTpjrknhP8keZXyMNNA01X0wr3gfqVXoFEtkh/2r608Hw6dl+cfb4r4Vqot4TX2PKY1gEU3X1zhqIxX6q9mSIexKqvb1tcol3RBkw6syq1QJZb8KUFqWeh97X0gVeY1fLDctBbcY1Pt19Gs3uUFVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLFH5Gzc0iEiAsVq7njiWxNfeuOwN/4VtkS+5bsJ00o=;
 b=vfWjvb6pg9UkQOGEs4VBburXMscL7CjcdSByEZXD4iPPFLFwv+E1YVMf9feveuf6gsEOJKxiT8W9hLh04OahtwppC+bxt9XT0YHKovwHh6clY0d+bAlvXzPL9MCIirSJ4v8kyPTmPZnRbUAhIvhxzgSZdZTPBmprVhvOt7IrTWzwXV8HTAogwtRLNwEQJ0OE3YAIMDAPQhrb0MQM50NR5jJSezN9y1FtGAvKND3LXubahtz1mzLoeCWqENpnO9HwNDn14j8InvO1SulXDccVXBdAKVmyTLmOURoWKAUD4V0mrH0+TmoZS7agTGXs1VTgNiNHsyMt+Vn/VVfCzYzv3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLFH5Gzc0iEiAsVq7njiWxNfeuOwN/4VtkS+5bsJ00o=;
 b=ZdCVe8c0u+hi+bgbL1Xx3wiN9QkPHqCozWKlpyqDMWcgm/RuPWJR7o6j+/F/UHcWS4i/iqQLJ090P57h+AXFd078AiiUSBlIBOmAuhksBrCRHgfd676YAA1K+1cLOvWpeZ2+fiWvvKfowGte60Uw7XKCjJd1vvOMvh/C8PlRnnc=
Received: from MW4PR04CA0130.namprd04.prod.outlook.com (2603:10b6:303:84::15)
 by CH0PR10MB5034.namprd10.prod.outlook.com (2603:10b6:610:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 19:41:53 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:303:84:cafe::a5) by MW4PR04CA0130.outlook.office365.com
 (2603:10b6:303:84::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 19:41:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 19:41:53 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 14:41:42 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 14:41:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 14:41:42 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UJfbCe3734543;
	Wed, 30 Sep 2026 14:41:38 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <afd@ti.com>, <u-kumar1@ti.com>, <vigneshr@ti.com>, <b-padhi@ti.com>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 0/6] Enhance TI-SCI FFI with ABI5.0 support
Date: Thu, 1 Oct 2026 01:11:25 +0530
Message-ID: <20260930194131.117129-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|CH0PR10MB5034:EE_
X-MS-Office365-Filtering-Correlation-Id: d0ea06ef-03c2-4329-b517-08df1f2ae0fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|56012099006|10067099003|6133799003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	xcbpCUKZSDBy5Z97ZV0AQ1Vj1p6pznoKdCVQdjZwmRempoMNTtkIVpivXRp27hGpTz2PRUuehrAat5Z3IqQ6r4sn8CVb4UHeN9aDql2dRReAgp4FuDCnZItdg4MrE+cMZHtWdRczxEjTjsGs/vZVXDQb2mgtZcRXffITqzb3Iwavapg8V1x8zNAMqOS2F+GDbJYOZKPpJPmFTVlY6QmVrhhv7nuDL9boqpxqjeKgD1l1aymvZJyO36ODM8HQbEBTJJ0WIdBAVPUKvPbNLPRKxccaFUhg9DfTtw1y745+UTv5HfCaFzGaDijvGo2W8VZjxC6XehB4ozv6HqZaFvwKkhc9hSjA6J6X9ByoYaNo8XCWtd0KhlhMjcp9Rxaw4Vfdb//fGCRxVUD4hUexeinS4G9UqXzI78GtE/1j/ur9t1a9X1aN7T8rXoRkBgoOHHqz+iCyeeqUUOev7SKXWTw2G+lUc9CBNl+plrr8UTZMSh9ZdhewXdl6m3E630WgEsSkfbZ/lXIecfBJjjOjFh6s2J6pOcC7EA/3RjaA60Td8hUZEPmjYLa43R04z0WkjXxs1I7w80Ok54GsjFkbMWciMaorF+RNPYDVab9J6xAcjCBj5VFMScZ5xAg8Uga3Ndar3FLtLcmkfXRf3QaRNV9VwSPA6QTiOQwme8Z+noqef0EFGj5BCi1e8pO6GfjkHO6n9BvjlqGalPtC4ioghjWaGg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(56012099006)(10067099003)(6133799003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9RepNRaQW0DX8aBIGzcxAMyzW2OMnrOr5Yc6WKxMcwBJZKqhSqUF71AE0FkUsbbQDEqITzoCqYmABbaSmiJ0rwqHepBfbg8BUBmEMDBSswaJ3PMlyL7Hhv6JzAm+4Lawvgu0zpiJuC3sg+MEfZeYHp5sozPdNxDQa8RemIaR4qmlTdXEmpSCwb/+nfW0GYf6nXV9OMZO1ni2Uc59/1wONd0kMkD+Ewsst9wnFxVNwPk7dmo+DubI4bEybMGqtxAzKrfsvnpQNdC0WUrefhd/7pamGDJstthzVT12nBYrAW6qDahjMFJ8+Wr5vP0TXa8obyoG6VpkBsP5b/GvLtdZrhvZU94BTZ3Si2xzHj/sJ5AkQ1oYL1+93CXGeEffvrdklZy1JgeJlhkP3quuF0vdZ0yfdh2zXt/I4g0XFSfEGywGzz7EXGur5FLwbA/kRHFv
X-Exchange-RoutingPolicyChecked:
	xSwjjzbU6t+1RatNldMzTFdeLkITLbynq1ynvRbI9YX5IiTT8oiWKRxoBPBB1w+/eEHOVzC/wRBh7LybFpwPugXHpVHhfCcxEOeP4jwgjXOyQSRyxiTpunXFua4kbdSCKdrbcZS4VPIvp/xGEGwC009+As+Lz3K2MEinBLzRJXRhv+wQ0fjfWrxQpX7HGU7QCNK3YrEIfIgm+yyqLMxkb5uneF/km1x2O3vZ4hI2vg3ad93LU6vjo+/NVRdSoTJsB5uXqDYbGyvoqYED0y5yysdHi0knzUOaKAgGoUmIELxgyiEgCqhYvcfFi9QB6o0US4CBzy3y68lkHoENmHrXoQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 19:41:53.2329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ea06ef-03c2-4329-b517-08df1f2ae0fe
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5034
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA4MCBTYWx0ZWRfX7Suyk23yTNDa
 1ABiWGUJqZMVOCR/1k+xPw7giibPqCGZ+/hTP2cZGSrYCLFPyZsZSt9E7Up3ItoetftGz/YkvMq
 bJPXXVcmCAbGLULqvnYGY/SiyKkS5g0=
X-Proofpoint-GUID: NVB_gktvdKyOvI_OTyzkWhrF2z5Ov3gg
X-Authority-Analysis: v=2.4 cv=TegDJhQh c=1 sm=1 tr=0 ts=6abd6608 cx=c_pps
 a=e24IK3jsPB00aLvKg+wNHQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8
 a=JfrnYn6hAAAA:8 a=Eg6qOrs73DeuqkYkoOkA:9 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: NVB_gktvdKyOvI_OTyzkWhrF2z5Ov3gg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA4MCBTYWx0ZWRfX/7DMVveF9wjt
 KcrrqYWhrR5S3dumoTGAqQiZaqpddKiINNOxEZzAJYChC2fHmjoYmF0RgtwtqI5cfUd2WLqKwtx
 WJwflNALqGYkZEQIHjaXSZS8azERLdN9kFTQ+yfXTF+XUgApNDVgFWOoxkaGIBnxD7FNPxoYbcI
 ZnrOvCziC7j3csCiyOu6AUMA7ewKE0Q24yno3hMxtdeITD4fQI6MBSI6LlouUB3sEfbcKdQ+V2r
 hw+W8NQmTo8hSemMjJQeISO3KNDdoAr1fP7DOsPlymZSVxkOk3K1w1SD3P6H5u5JdAAflEDjAw8
 gPOyOLEv/tyxBj83SzaFN+1RbiLXQalyEuT3Wgm4zs5nUtJeNNfBy6CYE2bMUylUb/dtaKh+xbl
 s5stq0G0K0p8yBW8xJM9ivF9CiFxtsfQ+anlErwIRlT/jAhLBkANUsloZlJ25AYDKaEuXoxAWiu
 2wXmo5rww1lYGsUKUGA==
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
   c. Potential Dealock Scenario: Forwarding messages between Safety and
      Security cores can result in a deadlock if there are circular
      dependencies.

To eliminate all the above limitations, the TI TDA54 class of SoCs
introduce an architectural change: Isolation of Security and Safety
services. To realize this enhanced isolation in hardware, two
independent sec proxy threads are now provided for HLOS to communicate
separately with the Security and Safety cores respectively. And the
TI-SCI message forwarding has been eliminated in Software. The System
Firmware ABI5.0 version necessitates this improved isolation and FFI
change.

This series adds the support for TI TDA54 PDM System Controller across
Devicetree bindings and TI-SCI Driver to support the ABI 5.0 change.

Note:
a. The first half of the series i.e, patches
   [PATCH 01/06] - [PATCH 02/06] are independent and can be applied
   directly.

b. The second half of the series i.e, patches
   [PATCH 03/06] - [PATCH 06/06] is dependent on the following 2 series
   1. https://lore.kernel.org/all/20260930172948.2901336-1-b-padhi@ti.com/
   2. https://lore.kernel.org/all/20260930160607.2674980-1-b-padhi@ti.com/

Testing done:
 - Build and Boot tested on all Keystone and K3 platforms.
 - Verified ABI5.0 core and device operations on TI TDA54 platform.
   (after applying an out-of-tree patch to add DTS support)
 - Verified that none of the patches in the series generate any warnings
   or errors.

Logs:
https://gist.github.com/3V3RYONE/d821cea46f5dc1e70a759c97878fa487

Cc: Nishanth Menon <nm@ti.com>
Cc: Tero Kristo <kristo@kernel.org>
Cc: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Beleswar Padhi (6):
  dt-bindings: arm: keystone: ti,sci: Update nodename pattern
  dt-bindings: arm: keystone: ti,sci: Add ti,tda54-sci-pdm compatible
  firmware: ti: ti_sci_core: Add ABI5.0 Enhancements and TDA54 PDM SCI
    support
  firmware: ti: ti_sci_device: Add ABI5.0 compliant Device and Reset
    APIs
  firmware: ti: ti_sci_clock: Add ABI5.0 compliant Clock APIs
  firmware: ti: ti_sci_rm: Add ABI5.0 compliant basic RM APIs

 .../bindings/arm/keystone/ti,sci.yaml         |  48 ++-
 drivers/firmware/ti/ti_sci.h                  | 233 +++++++++++
 drivers/firmware/ti/ti_sci_clock.c            | 380 ++++++++++++++++++
 drivers/firmware/ti/ti_sci_core.c             | 204 ++++++++--
 drivers/firmware/ti/ti_sci_device.c           |  62 +++
 drivers/firmware/ti/ti_sci_rm.c               | 148 +++++++
 6 files changed, 1039 insertions(+), 36 deletions(-)

-- 
2.34.1

