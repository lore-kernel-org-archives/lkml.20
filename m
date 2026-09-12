Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D390839FCCA;
	Sat, 12 Sep 2026 21:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789248752; cv=fail; b=mgYF2Y4wq4v5M2nLv42wopJI4oQArX8YTCxBJUMS/OzCT0K8NrGyi1+u85aLSIt/qt86UCr8gqp2kjwRDkePixQwl4Jz50VOiWTYXnZTCau+XEbRIhZBUFmXst6ZTXV1UmTzPy9sszoJko1yFesl8CWJ+0mebg1QE3dTmpCz+hI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789248752; c=relaxed/simple;
	bh=6KDjeBfMacCyLbIgp81XaihQuNOoRXJmBwMgFAIkqCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=V5be2mK69DZgxxMt33778hBNV6Qte3Skw54FdRPV9QBtzaXOeANSnZhuJXxLr5wM9kC4XOMdq7R2EcNqdoGl5LDYhBWdIVJ5/LPaUzAaX3yakbTUb7GOQJ9C3yEvRnuECZrkopfPV/d8kEtAt74V9thYEqXr8qDH8P5IV05VQq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Yl0FjXty; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=r6yZUstt; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Yl0FjXty";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="r6yZUstt"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68CI1bka2894939;
	Sat, 12 Sep 2026 16:32:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=XluIOT1Axr7GDJ2a1blJKj/0Scq0Wie3z8mXA5Tbd
	Mg=; b=Yl0FjXtyM38E7aGLFbMngPaqJ5O5EwidWArRqoKDlQTmfmjZW3GzG3PGh
	zZN/eCqQJgMoK6HgLNpfG9forKKGhPeyOmT7EnHoon6Ck+sLjmdYncUVQ3Pw4oIe
	xLFS1vQgpkN2NHvH3fwrVlzYRMNqzRYEiK7HtQVEqfZPnms2u6HfAby6F2eqYNAw
	B5Z+4aTpTCP0WM63Tgrsb/CJswLaGlZJ3OoMyTvcpQ2HOqORYpHyTZ/QVuF7PZ7Z
	lmWiRVGoHZccQl6UQGSzDlKVprRN2+Qdakw8R+JXYmbqo58dgHYx66BfY3FjhDF8
	JMFesdCuDMUc/rSqMg0FUS/xIw6XQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010047.outbound.protection.outlook.com [52.101.193.47])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gmy5d36cv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 12 Sep 2026 16:32:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmZM5C79Fwcgj1d1OZpZVTWEUXVFLXR7xOQE833p5/kgyHe6dCjzczCCsNuJNzTGU83Sx5InDMD0cgUT7oiiK2Y5lOteBRM70nb6OJJVawGBB8SDoWySkDbG5NXarl3VxEuwx2/ZyxUf+c2VLtIj1mDkaxtH5iXfSHe0HGhm8LurUjC7qc7yPAkHJTf5cdOWg+NClJZMffr74yNWH68xqnVm8ORhNGgB6CWoY5ObPujuXufZfFNWNc3W+ei9jvxBLn6hijQunmiPetu2Hczl2GIXuWoucgcr6xfWmlxc4+9j+46lR3Ct4pA50W05WSCtI1KUbIEKa26di5CUjANk6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XluIOT1Axr7GDJ2a1blJKj/0Scq0Wie3z8mXA5TbdMg=;
 b=fb3Fdi5tiTr7LzthXJLWdL5qkIfpYcK41JGEozT1gmHLEupjSf+SlGTpYOnFZBf+TiF2jtOXqVZkZQP3rpnJxzm6lqw3OpwgreDbsoCEh7NQSufqXN76PQ0aHAbK4zkkHj3qlIUKhJ99B2Pb8vsQwPl/7WanPyAz0Fv4xjhMbZeyPyM78zgC7okmasvKBVT6cPiYB5fkOrDXdKT1hTqN1k/f3DlVGO1W8VDuMGegnpqBkGO9lWF3Wbo0VdDcyAu4QHuyIp1qlaid8zvZA64xgvu7PjSDJtPVPhpVYdIwAubmKgRHxDSTi+Zz250m8BT99/i4z+COvLiiImbcCcl1Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XluIOT1Axr7GDJ2a1blJKj/0Scq0Wie3z8mXA5TbdMg=;
 b=r6yZUstt529PjgmDLBeMmQ4mN1VaI9rK7VYpl1R8ZABPYwUGdurDtW0fMi0K8sCYgOsUS2gtvPD1ewkLCgTlG01/BBzfUDDQ2H4aYwZ3BEyZvqUn7aRcO52Cavvwg+9V7FaG3uE7hse/DO3WXAOVgdfb+yVqFwDgJ/cBx/3f0YM=
Received: from BN0PR08CA0026.namprd08.prod.outlook.com (2603:10b6:408:142::28)
 by SJ0PR10MB5835.namprd10.prod.outlook.com (2603:10b6:a03:3ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Sat, 12 Sep
 2026 21:32:22 +0000
Received: from BN6PEPF00000070.namprd03.prod.outlook.com
 (2603:10b6:408:142:cafe::86) by BN0PR08CA0026.outlook.office365.com
 (2603:10b6:408:142::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.11 via Frontend Transport; Sat,
 12 Sep 2026 21:32:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN6PEPF00000070.mail.protection.outlook.com (10.167.248.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Sat, 12 Sep 2026 21:32:22 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 12 Sep
 2026 16:32:19 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 12 Sep
 2026 16:32:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sat, 12 Sep 2026 16:32:19 -0500
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68CLWI8n3511026;
	Sat, 12 Sep 2026 16:32:19 -0500
From: Kendall Willis <k-willis@ti.com>
Date: Sat, 12 Sep 2026 16:32:15 -0500
Subject: [PATCH v3 3/3] arm64: dts: ti: k3-am62p: use ti,am62-mcan
 compatible for m_can devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260912-smth-v3-3-6fa661ae5a4c@ti.com>
References: <20260912-smth-v3-0-6fa661ae5a4c@ti.com>
In-Reply-To: <20260912-smth-v3-0-6fa661ae5a4c@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <s-kochidanadu@ti.com>, <a-kaur@ti.com>, <s-tripathi1@ti.com>,
        <vishalm@ti.com>, <k-willis@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789248738; l=2413;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=6KDjeBfMacCyLbIgp81XaihQuNOoRXJmBwMgFAIkqCU=;
 b=uHWOcw8UZPzhqO33MKrCvxFdbpOfR1cdg3phbeVnluG8ZfOEl8QWrnlEeAuJ0Bn9i65pao34P
 4BRw/mkY4luCCKJ1XR0T6W9oAKGoLOratLeB0ND4eGukQoSoihQsPtZ
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000070:EE_|SJ0PR10MB5835:EE_
X-MS-Office365-Filtering-Correlation-Id: c5605868-245f-4ea3-c2b4-08df111554b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8j+LWRS/grGObCyO/cGMaeEPQk7iexZrbYEYCplryto0v8ScWAj9/QnBXiZAtKWqSseEr4KR2A3dCjO0/0DQoV+4ibkHGYSrwizMTUyL6oD1rHaUJso4Wy/QVY+cUp9fVpe41w3vENDCKyJ9Y1/jNG2bANsHCaSE1eLlrkJYetuVMs20k1tDcWINHPPm3saceC9cBvDa5lYW+Qi7yFSM+FOpOiy3h+NBeqCAApwcMIWbeA8P8O/shvWf7KkjbWy6p2PcgIh68ZPbJ9SdEPDl0/bnNOgwf8MnmBHOhdKehdDXI2T6sQTbzVrmRSrg+l+IOmA37nqLc/ZQkga6q4F2KoB8I03hwTZrGsl6EaSYsFbUPUL7J2jRNoSK0Sia+CfCVlHHFhq91RiUgK05lgFLHMmTKpchAIE4stvvlS00krpkOsZsBHjtKWf82F0IUUb8/00O77zYQyqYEkDZOclFpf23IO5wxJJDcg6UvfUjMGx1pC+3esSOunXxKnl3S+UC1a1RZPX7KtfkWdh0j2jUBTyscuXHIus4A588IUb0pWW0WPgCtM/FsxZvjcZry6SjTJGJ7b/zKKt6gDjMteNsWna9LXyxWGP1IEL1js+qu1NnfrhNOmkUe5qt05GSSvqazHLSj6xsR4bLfde9n08o298s4nyClmpVUexytB09inL9aHJvTvNxU8WB5kTV2lljUQ0smhUP+zxWH8RhfmPXdQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bu7deRo7jarqw6zJD4M+M/Bo3Hjrb3jXVXRdkrpxPvsVcJRvJYcgjCncsLRb0oN/GeMD/VFwwomBDz973jY91V+odYZ1KcV3FQ9V+912oe31cNqo3eFrvPj4tgjLxROBl40yTl3AdkvjxW+WgE5+iOFIXEuxWBolug2ITZrriMT20j399fGZhJDr3I5CR/4eNm1Qbc8EYZrJLQqGCGddAND8CIKR3AVTVJu8o8ktwFEp/f9C6l/bHiVBxY+obOxe3vOCTv/K49+JXBEjgNXEgDT6ahHs2kW5sOgwVfy0qfZ2ldWLzxJ5fblyQTXFfFCOzkas7FLoV4q2yheLVPI9uohMYxZdFLZdWaUZs+xKaoHoMP8xJ4jorovXx0djo+yC+DeQhKwMZCDzDErfSGNZpQPub0IjYslzmpxcaCFF+RV7Wu0FR/lCckeXDhojC/3Q
X-Exchange-RoutingPolicyChecked:
	XearuWdGJedkxruibWnFBPqgDsDcyjfxjEgJ9hSVdnc813EK2Mg4TnkRzo+JX4zoQy/JfPPcIlonuHaMHgFfZMlrq9zYJ1lRnn9L4dK7SFW8w3SDIbJh8NIYMJrBDCsPqVDiQWh10/EPwd9CPVwylQO3aS/kJDHYKmm6aoYiIWCF6IJ8QX7tNLfSiDvMLeke4c/UQ6oP16aSxQh+E/hlHYICPwPhANok4EVFdjnzdw8+R+rfIwc5Krm0tq9mPYKaHkpTK7RcneTmKSOFweyFBhj8AOtIFqhZ/4Wb8ZhSB9hzXXYmzMcK1SGsqmgAzKBVBI1IBMK3mHqWuE6Co/frsw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 21:32:22.2038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5605868-245f-4ea3-c2b4-08df111554b8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000070.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5835
X-Proofpoint-GUID: LAjMwqAcAVtMFX5TIp6UqU8roDSODxk2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMxNCBTYWx0ZWRfX8a73xbTq4q+b
 5benFxvjpItDnZNXFYplIVhHE8B1GIc3dUJ6BfL6pRV40uoPrJ9AhFV8DB7jSlLxVbC49ctW46r
 XSYCBuxDhtVjdeglSKu86JCTAqcyZJk2qcqdHykOHW0fl8/kHqIRI4BqItiXbgQNseb/zqZ9VkR
 E9U7xQQh5ihz7KzRwLkrFQjgaDTy83sKl0fjAJ82hHlekCmhOJv8w48fchrXgkxjiWo6+yPSUjU
 3rF7JgbcoGxLdGSOd/+SJirqiF0R8KF/MzE/YDA5H3GJYlpE5JsVY6w/GjR7Tjq1ToiGmJvzT55
 hqbSczfMJzhyvp5c1GO2Jj3cOgL8NXoowTeVJDgV+37SpxGGzcgCQWKoatUQntkWGXPb0QzTlBw
 gXZcKXQvw1U3QWMrro2jhs+ZWE1kbMyYi2PrE6YhaD7qdkzn8lmREqd9I1iG3iwQt8SN3PXD0I5
 9mtTZvWoU59X3bA73Hw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMxNCBTYWx0ZWRfX4W/1huCiWr++
 yj+gN0QcHphP8e/T3Ht1EVVN+oRSL1FWBIyWCEvL6JUtbWolCD8g8SDaLM5FumAuMmZQI1z/IA+
 YlsgefKwGKrAJ/UZgao9F+tOoSj/oWg=
X-Authority-Analysis: v=2.4 cv=F6vC5ahN c=1 sm=1 tr=0 ts=6aa5c4e9 cx=c_pps
 a=vP0OKLXe+mBq485nSWAwQg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=qdatcSVZnf7Q0H4RP1EA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: LAjMwqAcAVtMFX5TIp6UqU8roDSODxk2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120314

Prepend "ti,am62-mcan" to the m_can device compatible property since
this compatible adds out-of-band wakeup functionality. The m_can pins
can be a wakeup source in the deepest low power states, despite being
in power domains which are OFF during deeper low power states since
it has the out-of-band wakeup capability.

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 4 ++--
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index f130c7cb998d797f918e5017b4434496dca6067c..9e8d9246f61699c0788a50d21c1f3fd0f39b1741 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -883,7 +883,7 @@ eqep2: counter@23220000 {
 	};
 
 	main_mcan0: can@20701000 {
-		compatible = "bosch,m_can";
+		compatible = "ti,am62-mcan", "bosch,m_can";
 		reg = <0x00 0x20701000 0x00 0x200>,
 		      <0x00 0x20708000 0x00 0x8000>;
 		reg-names = "m_can", "message_ram";
@@ -898,7 +898,7 @@ main_mcan0: can@20701000 {
 	};
 
 	main_mcan1: can@20711000 {
-		compatible = "bosch,m_can";
+		compatible = "ti,am62-mcan", "bosch,m_can";
 		reg = <0x00 0x20711000 0x00 0x200>,
 		      <0x00 0x20718000 0x00 0x8000>;
 		reg-names = "m_can", "message_ram";
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
index 5288c959f3c1aecfde363f9e2440253545591171..3db8b63ef01fefd5177272a7e895317dc6d5921b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
@@ -154,7 +154,7 @@ mcu_rti0: watchdog@4880000 {
 	};
 
 	mcu_mcan0: can@4e08000 {
-		compatible = "bosch,m_can";
+		compatible = "ti,am62-mcan", "bosch,m_can";
 		reg = <0x00 0x4e08000 0x00 0x200>,
 		      <0x00 0x4e00000 0x00 0x8000>;
 		reg-names = "m_can", "message_ram";
@@ -169,7 +169,7 @@ mcu_mcan0: can@4e08000 {
 	};
 
 	mcu_mcan1: can@4e18000 {
-		compatible = "bosch,m_can";
+		compatible = "ti,am62-mcan", "bosch,m_can";
 		reg = <0x00 0x4e18000 0x00 0x200>,
 		      <0x00 0x4e10000 0x00 0x8000>;
 		reg-names = "m_can", "message_ram";

-- 
2.34.1

