Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF59534447;
	Tue, 22 Sep 2026 10:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072818; cv=fail; b=JPKSLARNRN/egTvA45fseZ0GUctDI1cTvPpYR3d4qD7Il5Z6Q7hhtLFB6f+nrH3yBxmgTws4FUftMcR1/7pzdog0bU+L/bcgG6QoGbQOP6VFk0A2DJEwPT/ydK3deTFCX0nACxaAk/8K5mBm3MjHR4KE64OiODRmkelK+4RoG5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072818; c=relaxed/simple;
	bh=Snig1NrlMpIt9fjbG1fXS6FZoQPxJepZZ7CHhNuNoBc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lrKGQOe8nBHX5bH9e9/bJ6kOOBq+GvNLBR/TcWDzY4Mh81MDQmZhtUY534igdkmdCy51PRJdm7+LLr9bz3+PDnsxGD2xeHNq8lvfcSWFlmv/+utUi2deqxDQJ2ant4ZTdl/YYCcWqvAcVOIA9U6LLOahOy57LxUsaKchbciYCE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=fzQM+tqx; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wU8w1un7; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="fzQM+tqx";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wU8w1un7"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68MAPIVG932514;
	Tue, 22 Sep 2026 05:26:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=aOIv5fXEX1s1n
	R0UAuITSmJ07vDxNfMPI3bHPc541OY=; b=fzQM+tqxdgazCnC49v7KH7qaGguRE
	8oWpEpI5xbAXGKMd5HiN/wQj2p9blM9glDC2R0y2gwG1+eOS6Vo37/hF27AEsJCN
	vWXl0lTt9BSmLrQhX4fx7CW+h7mo6cxAZFstdOvcgeoQDzs4wZo3Lo6/vG0KGpnU
	y2iJYSetwNqdvLnObChFA5MdtHSn77wlymsYE5v5LfttftpKc2XzvAkdNR4cFcFn
	DuEjD1U4UL2pjkTxQqI6dm93CyKFV7MWdrN033AxAYNhYtVTuL2BZBdfOrZet5a8
	M8/1Jx4voN0iO+yOlw6gOdzcRlllCHUYqh1jzrBOhxjdhqp7kUP/ENzGg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012054.outbound.protection.outlook.com [40.107.209.54])
	by m0380145.ppops.net (PPS) with ESMTPS id 4guf4x2x1a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 05:26:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8HKDyWj8UvkL0Y5GpRhMEkNx2yVyxAi/WoJxjmHHNg/87+LQxKflBQzU1SNpyrB7jv+JLJNaZ0j3YKAPu862R2rE8KM5hbVn6/8xkmfejfDKio4/neDv5t5FhXnktBalxLseJVF9MfLHngLuOrEV48iI4ISYEVtRoveFW11hJDkb0VNOx46CcAOIDJJ0N3JOHJoP7b1xWEAjNcSkFwq4/gGTK6D8eKCfWvoOAgws/bSlX9tri6CArn5L4/DG4tbdqBXzAa9+hHWrd6LfjO/DKgTwUSYKahNOdxXP9x9REhEQyQengPF2FzbGSwRB+vdaevIPcmb5fqQ2j+M1YpqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOIv5fXEX1s1nR0UAuITSmJ07vDxNfMPI3bHPc541OY=;
 b=PxtCe4/yphRNjdcUsaN8sHDAFvvsdhNeoQ268GacvfFJZIW+aWWMUJm0uw/LDyWzdL03gs2o/JO6s9MPTSbJ7FmbrGtxZfPQAAl2arjxQbOBldmaKL20S98a+1gjGnwpwaQbffnizP7z7GVlml5Pn78/gvT7a9LdoeVLRcgfdRo9Ur6MY0vn08YOR+CA0r1yph4Nn1a/xu7r7/yrdfeYG0FshgHV18ldeGa/f1x6gqz8CaOSCiCURSkSjLFo2wTRwgEILscG2tqFzOb5i1h0PYukq+mQkUneqkRCbjCbIkMU1leqYkNBaL1GY64sCR04BKP+BfQa6tHiC1w3r3xcKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOIv5fXEX1s1nR0UAuITSmJ07vDxNfMPI3bHPc541OY=;
 b=wU8w1un7rmSH6G+9cUWzGb4pCBVq/CghhLG+nvwSJQYZwLUiLjDiSNHbdqBmW1Chjx7GSNkGRRS/lNqJS0hBBQQWHJB/Xv0VYpvEy+b40zYFRs15Cp8uleMW0zWl6aI6C5sxLabJ4GCcwXvQ1aDfc515mXv55LTV4aMDT1eCBI0=
Received: from CH2PR15CA0006.namprd15.prod.outlook.com (2603:10b6:610:51::16)
 by IA1PR10MB6855.namprd10.prod.outlook.com (2603:10b6:208:424::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 10:26:44 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::3a) by CH2PR15CA0006.outlook.office365.com
 (2603:10b6:610:51::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 10:26:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 10:26:44 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 05:26:35 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 05:26:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 05:26:35 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.53.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MAQVFo665425;
	Tue, 22 Sep 2026 05:26:32 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <sebin.francis@ti.com>, <k-willis@ti.com>
Subject: [PATCH v3] arm64: dts: ti: k3-pinctrl: Add virtual GPIO select mux macros
Date: Tue, 22 Sep 2026 15:56:29 +0530
Message-ID: <20260922102629.3707296-1-a-kaur@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|IA1PR10MB6855:EE_
X-MS-Office365-Filtering-Correlation-Id: b655a7f7-f28a-44fc-fa59-08df18940021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|6133799003|56012099006|10067099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	wVRvfR+wim45gbOW76s3xLA+4WIjCnZ9OwSqM4dac+sIV+jFDDUOzdIrnfOpl12eGYsXEoVxgP3RdNrchHT4i1eEpFUP4CgJjI71umZEWZ3C1RyRYA8LCNvb6InQteumc35dGT/E1kgvFwvUSToqVMVUX0igjOQKLfupRb7v8jT3BSeHmXlSvbD9kZAQT9KAlWna4gdwLLXnFLLKDrlJ0rtkd4zutl2z/ducjh6XHUPEjPnIn+tmn38qb8waZ9I4inW9CcVQRY95d1Ddz3IyZ1qGI4deqxV5ojPRJ6Kx7DIbVmrtM8GQfkMLHqZ9GmvJ5R8ZoqngglpLasGxu4Tw62fHU27Oj7XMg/8bZOpB262JiyQoH2bnqePMQ2u00R85exsA4czmCzYJpprsLFeYq+vMXd9MX+ryfsxb9ysIL5soxbpMqibqj6Lm5XzxbrcmipqB8GD1iDn8WxxrEkw8Mfu6e6XJtv9amBPESyWaQZxcGLpzZLIGeCGET+fRb+40fkZebq+/FnRe54BQumyVlQQrDadjooiFKtzsNh1mOz4F9fCnhwC/l6I14NAyUEjjjxqdez+Z8c6+AKe+yTTyvpvlb/n7zBX/U2j7+hThyiJ3RabTO+j1892bVpjSOuErD6rVInEJG1XhTAOBH0pk7vixNsBpAPvjxbRwBzU1ET0=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(6133799003)(56012099006)(10067099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+yfM6j0HAReWmZeQmONM2nMJ6BDuvF2X2AwoU/DLnh2EubOqojszvxX48/MfKrDZ+850wGz74d4KtqGVzHd9MhZqiqOWsAlIbYYaMkHOW6sTaTtM39YvY1xNttiAJZHpyC0nezCP+W66bMcnjkGAGgaqk4xPQotUhdbfyKECIO4NYEN9mY0+k7brjK7rhW42juHcYavRqi6A8AvV5cisOgpxiB2x0lC7Lk/xtC96b8CaAUTDYT1YI1v+mtM56KgAYZ7s0AIGl4kR0aYIyrTrPZcMesn0KVIxS1B/qnWfXcXLP7JZdyKvWSi/HWdPkI14Vum5yS/hvWcnCS152kMApXc2XmmzR5etjriAmQGlk51/Q4Ju4OPx+YgutTTPOVe9DBD+lyNM1WxuILoIMJgC1A0LNWwm58PlPrJ4BQY1U1RYFhn+3iS353bbXdJKMdLB
X-Exchange-RoutingPolicyChecked:
	jaLew4+pw6YbRZKvDuf5BvqKOZU7x2QUURBEiTif41TSrCEfgJnfQvnW8gyV1NpMRVsOcCmvECVfSnoma3SydTj4dL6Hf34abanM/Ly2s9hqCXC5NKVS44XisKTHdQUbKUXDn/skSUcejkyHJ025MLOHxh+ZPn+oCMpPTPRkfgiqT7yNph3wg6EBK+7M7JHZIqaguktiCPBB94sauhDWEloLOfveWbVWJmlcvie3CkRYZMkAlRxmgNHpTj6Zai0dGi2MU+KhWDFBSGfyQqHCVyQjz1fq17vs8mPANvzkosgSgMdLkqJiOCtL447BJ8cu8HslpUbUDCcoZrImbteryQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 10:26:44.5402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b655a7f7-f28a-44fc-fa59-08df18940021
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6855
X-Proofpoint-ORIG-GUID: vxKMfWsAH_c2JxAKsh7QWythfsMhOLNC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1MCBTYWx0ZWRfX/NdIAZWR5yJJ
 I9SVQRmiN1kZAR+fowcIHfKbXiSHCqXZtTWAxv+qvjT0WmVijMxovsi+wHiw7/UbOGC5TyISMNV
 ThsRoR9DBce63ylPCBkn2sujNhDOwVIR8gPrY9wrgVHfQFe6OQj5QqsugHs3uDmyxTVC25PbnW7
 7RxEnwgdUVscLtHnIf0yRShlEJ6BZZk8SB70VtqJzq1UDkzUCaoU+p/7xJyd08Q9Dew2PqzyBKD
 VS9h0gFd7zRQd72Pyr6PKIRDH/ChKjXo1dIaKXEwKuJXc3d//fOGWy65YA3n5D51Ms+v1BfrdM1
 +1R9g4FpqizGbgdPThiInAzmDA9AA0qVbiQebZJXK87USzjbmsdggVs1qIwXvP7V68OO1KKVBWg
 AncOY9eavF0zWQic20SDN3aZwkPBuWgvphfsvmkl0u3WPIsBw5oHFImSdGtdoShdGd+lxQDraga
 16dDwIRXTByg0i77k5w==
X-Proofpoint-GUID: vxKMfWsAH_c2JxAKsh7QWythfsMhOLNC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1MCBTYWx0ZWRfX7hvjfiERTgB+
 z7DJ9V3ZRmZodj9+Hv7hNb4ZzKQanbDbb3PuvdM00szUajYEBn26ja8V4gQPiH5K40LSb2inZhw
 6Aqdqa71oWr1aC41B7Jz75xB/acaisw=
X-Authority-Analysis: v=2.4 cv=XYYcX455 c=1 sm=1 tr=0 ts=6ab257e9 cx=c_pps
 a=AdSExLHk7727Th38kKp3hg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=-xfVGX59TT1eq1tMbjUA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220150

Add virtual GPIO select mux macros for configuring the vgpio_sel
field in pad configuration registers. This field selects GPIO
controller routing. The meaning of each value is SoC-specific -
refer to the Technical Reference Manual for the specific SoC.

For example, on AM62L, values 0 and 1 select GPIO controller 0 and 2
respectively, while on J784S4, values 0-3 select different GPIO
controller pairs based on the pin. Pad configuration register
field details can be found in each SoC's Technical Reference
Manual (example: section 14.2.1.2.1 of [1]).

[1] AM62L TRM: https://www.ti.com/lit/ug/sprujb4a/sprujb4a.pdf

Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
---

K3 SoC vgpio_sel Field Audit:
  All supported SoCs use bits [5:4] for vgpio_sel field.

  Supported SoCs:
    - J721E, J721S2, J7200, J784S4: 4 options (0-3) for MAIN GPIO,
      2 options (0-1) for WKUP GPIO
    - AM62L: 2 options (0-1)

  Not supported (field reserved):
    - AM62X, AM62AX, AM62PX, AM62D, AM64X, AM65X, J722S

Changes in v3:
 - Use tabs for macro alignment
 - Add comment warning that field is SoC specific
 - Link to v2: https://lore.kernel.org/all/20260921063505.3986565-1-a-kaur@ti.com/

Changes in v2:
  - Add all four PIN_VGPIO_SEL[0-3] macros instead of just two
  - Use generic value-based naming to support all K3 SoCs
  - Update commit message to clarify SoC-specific behavior
  - Link to v1: https://lore.kernel.org/all/20260917111539.3844577-1-a-kaur@ti.com/
  
---
 arch/arm64/boot/dts/ti/k3-pinctrl.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
index 4491898d8294..e8ca69a97b65 100644
--- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
+++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
@@ -8,6 +8,7 @@
 #ifndef DTS_ARM64_TI_K3_PINCTRL_H
 #define DTS_ARM64_TI_K3_PINCTRL_H
 
+#define VGPIO_SEL_SHIFT		(4)
 #define WKUP_LVL_EN_SHIFT	(7)
 #define WKUP_LVL_POL_SHIFT	(8)
 #define DEBOUNCE_SHIFT		(11)
@@ -111,6 +112,15 @@
 #define PIN_WKUP_EN_LEVEL_HIGH		(WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_HIGH)
 #define PIN_WKUP_EN			(WKUP_ENABLE | WKUP_ON_EDGE)
 
+/*
+ * SoC-specific field - Refer to the SoC Technical Reference Manual to
+ * determine which GPIO controller each value selects.
+ */
+#define PIN_VGPIO_SEL0		(0 << VGPIO_SEL_SHIFT)
+#define PIN_VGPIO_SEL1		(1 << VGPIO_SEL_SHIFT)
+#define PIN_VGPIO_SEL2		(2 << VGPIO_SEL_SHIFT)
+#define PIN_VGPIO_SEL3		(3 << VGPIO_SEL_SHIFT)
+
 /* Default mux configuration for gpio-ranges to use with pinctrl */
 #define PIN_GPIO_RANGE_IOPAD	(PIN_INPUT | 7)
 
-- 
2.34.1

