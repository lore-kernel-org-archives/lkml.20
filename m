Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281EB49E5D9;
	Wed,  2 Sep 2026 21:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383123; cv=fail; b=cgkNVZCbekfJmLHx+oQYiAPLVfA43756/0MWiU3A3hJDzmHzCQMpjOXRVyOxMvIOUZp9A7g4FJv8AX+24G0k0zfmXN9EzYPtHH2aOYuwzNyd4G+uYDAFZ129th+RWG28zk1+4p72CelSFk3xTGffOwTm7UXKOYCidMIJq3XK4OE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383123; c=relaxed/simple;
	bh=dxM0rpeU8Y64zvxmj+YLKYcUXr+6BmHFezMvT2aIiF4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=FlGjsP0DGYini3d1rBGlECIFV8Y/0NPIs8zAk7+7MsUtQgepz8+6woMReVjU6DFs8a8W6f3QyZj0OqsdO0SAyVY+SHYXQ/ns4C6e1ElRJPxGjRjaJBvSbNEUaDbYXcYPalAm36In0ShhP7fBSv5RdTqnPEXGQqFCiPaeyX8xsKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=RGEElci7; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MKzF2Lf1; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="RGEElci7";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MKzF2Lf1"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHZGQ3028245;
	Wed, 2 Sep 2026 16:05:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=yvI7/4emglit9
	IiYMujvLbH6If23U/iRA6Hdjxqknec=; b=RGEElci7hhjghTYWGadoOQq1OHivN
	3MVF/fFK0/oTYnQOn7EMbr95cGPUgdHyUy/RSHSOGJVN9JAm0s1O8NFwIenI8zru
	0WHDL6SkCc+W9RDRClpkf3BFdlX3fZ4ZMOw6mfZWEMlet6fvUbmoMxJHbQYnGbia
	7RUFI7pfmXJ5ILfJX+GLshXfInqYCcHNgWtwpEOjuzAwlp85aGUZ2Hgf+QzDtKY2
	5cRsZyePyYz4zmez5rAtzTZxFd1DhpVjTxoNjtSHr9tvlONPiqDMgz9nc7Mxo7wg
	a6/GmfUSOyOWt+Z/Z9l1pWfpr6GHRAkOrBXEdyc6C1oq7tpn9umwGlTfw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012069.outbound.protection.outlook.com [52.101.53.69])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gec5ne2uy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 16:05:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RyHdC3RBxYP069UEw7xysphBAivI7AKDLFPtH+QyiqeLuiUE2jSMnTxnEfQZn9KH2nGoKHyMHZi4Hp8wd5tDZAyv3Y2VgDc8F/U1LIGIC+RSS80F/mhh3rBdmGEgoNcZvZUab+4JY+ShavaTIUXwrot/PdfUM5T9gHOvX1/QPMkR+kYq15EZBayQqbLfeDoADJMvQLw0icDPmuFnHYqW7BoWKnRbo+t8LWHmi/XUGkRYgKU83O76NhKLY3kC9EbzxRefww5QS8J1XYduAnqJfjLvCk0Yyr3x0mJ2Q7SlL6yaqRfNuf8vYl2xWZDhcRF3YYMpHFoLEnfy3liLNjeadw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvI7/4emglit9IiYMujvLbH6If23U/iRA6Hdjxqknec=;
 b=MwbQttjylZKue0cqk1proXRcjZOmdbe4GhVt9BI9HTjz0rJoV8MSHg5lkhFsA+D46T39efS7RXfpbPxkq7a/jlWW/kqIc9vzuqKV8m8t8R+y4on6xa4xRRMhf4+tzS3i01YvdPqtT2SR8/2gHXQhh/uVgWXj0AcxlXJrnk9KcZKCcjMEDoaGNH80Oq2+WiEUBp9h8UCAWugFq/9xro1GC6yFvVRlYZEbGbRGM7PCvXgJIguq7CCB6O/iILssGXkGqMeuK3n2P5gxPUYsvy8hjakX8AslH3yiBZhnKW/jeGJeJh9sqQkrrwuXsgXBuyNIXIvzpjC2ynC0wbrRt4syXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvI7/4emglit9IiYMujvLbH6If23U/iRA6Hdjxqknec=;
 b=MKzF2Lf1Vl0IhsaBu21wlS6pY4NPJ8qI+j15a2ZYDrRw2jqV6nRyWeWI2tG3k6yNmOAs47WAUOhVXqH7n9Qqkfv47rw0GvOOo0dklPUz0hFMDdQwjFd/tejd7gsBrxm8NIX7hkn4It7XaQ7EQYi/V8bghGQiZM2eq+GdiRlUSs0=
Received: from CH0PR03CA0074.namprd03.prod.outlook.com (2603:10b6:610:cc::19)
 by BY5PR10MB4307.namprd10.prod.outlook.com (2603:10b6:a03:212::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 21:05:11 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:610:cc:cafe::5) by CH0PR03CA0074.outlook.office365.com
 (2603:10b6:610:cc::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 21:05:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 21:05:09 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 16:04:13 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 16:04:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 2 Sep 2026 16:04:13 -0500
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 682L4DKw1301748;
	Wed, 2 Sep 2026 16:04:13 -0500
From: Kendall Willis <k-willis@ti.com>
Subject: [PATCH v2 0/3] arm64: dts: ti: use ti,am62-m_can compatible for
 m_can devices
Date: Wed, 2 Sep 2026 16:04:09 -0500
Message-ID: <20260902-smth-v2-0-b3678ca44c7b@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEmPmGoC/y3MQQ7CIBCF4as0sxbDUK3UlfcwXVQ6yCxaGiBE0
 3B3sbr8X16+DSIFpgjXZoNAmSP7pYY6NGDcuDxJ8FQblFSd1NiLOCcnOvtA3VuDJ22hXtdAll8
 7cx9qO47Jh/euZvyuf0DJH5BRSEF4afXY6ums6Zb4aPwMQynlAyYW1IaVAAAA
X-Change-ID: 20260819-smth-6fb189fc148f
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788383053; l=1416;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=dxM0rpeU8Y64zvxmj+YLKYcUXr+6BmHFezMvT2aIiF4=;
 b=oTmM4/ZeT9ezHIOMQaMO1T+DMib+5kLifBk4ZDutQFYLtlRSOqMQKYaTXF04A1g2Nmk2A0q2I
 NdalABTFZdLBmgZWTea3oKb8l1qXqglJ+eDNW3gEWl/WYYOqVwux/Lr
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|BY5PR10MB4307:EE_
X-MS-Office365-Filtering-Correlation-Id: 9509a979-25ff-4502-d241-08df0935df93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|10067099003|56012099006|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info:
	SrnYfANNZaxI0x6BWNg0gHGmj6bvqjqNW+Q3V0QJdN5tnb/1yfdXKQxxdTGTWoJO24vNYegy79vw/uV1rxobcmfuU7O7y4PvvK9JxDJRiTn/btcEbgUbciPrpGELsZsnwo+w0hviKq3WWiujLVGb1jcL6+4iUetL4UKMRBKYrZTz3RdB8sjJbVnb3LIb09aFjJNUH3J+62OgF5jqgnwr1ReVEMS+kakDcRY1TQ9w7SRmwulTi4uglMHU066NRLI1cUF8xc5i0/XFxTC8EQjAY9LUK/9hUSHhYmPDQyzaHSJPoG0SwoWa1Z02LEz4dwcrpX1W+Hq/6ex+pNLSbp2uDlhkXcQQDUsIL5OeGLW/v4buz5jhf/BWQa82Xptt6l9rodJYHDFxe12P5y7DGTpMcs70pfkBAjY1XUIxYdQNL9bW9xa2ER9u9XkqMAo7yjIADZapVxh1NRpEpsvJHRqwqlf8pXhUwS6V0nZqcPiIANCMRb5KdDGvTITY5eybywH1KTvkdOXt1okduuNto8lInKqIo3GBShq3iUcQoXWMYgw6pBUZ2kTroSjRxVqHKRoet12SCPZgHuqyvux57lgtUtM27fsTKg5hqRMm2IEx6ATgAxBqePxAI8ajakX1mgggUGQl1jAaSA575aoVxXRZK6qQPhYDQuhw3+fGGxPUsSh/Uo7ZdH5FEelnr5m255MwYdKGUMGC4yahVgSsAqJPTg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TX11Uo08f5Z09n0rzoeiQOWwTWND1D2ctMWFNwZhlQCV9e3lmeCPmCnW/+tTXhPZgcAK3rRUkwQOm8sShWhPn0ween7qOJx39CvxjpMn26xC/g1Hs0rTIweTOwTtjMwZ5kzAPzhdz8LzXHrhTZiHimLnJxtM/eb4NkfITDtbPufmEi645ZYWzA3exi6jv97s1b4C6YHAWTXosDwxI8YUfHvRw5kx+K2SX8Fu9i6k/9AH0KzkbSjNYgsml2mG7PU5zKnfHWn7wodM7d4OEYNJedhE1YlDM8RutnfMAB8Mt9QLPJyKVZfn0169gQZNvkAw5WeUHXjN1pQzpg9qw3WW51zyUpUiJQ135CtCOY10pi+HFnwIywOiVxamUvA3cUqEF2b5RJrhxKtGOrSoObWu4v5oQ5eALBekZrXmU/Nn2Mm5Ql1p0HHirPvaceXrPgTQ
X-Exchange-RoutingPolicyChecked:
	tbvg+fL4Hf4a8Wkpd0sQmXfpBWni5iwG4sjDl5n3eGyu5kCmd0Wajl6wzc8Me2/DSwjh6N152a3LXCNDZfKVqbP/8g+HBlNxZRRV42PicniYP7W8pRljU6Ksx7IqVr2iMLB3GeZHKhZWMu+ocMSSnLJI8UXnRiCDLwfF3RVDHc9Bel6Rd6kLZHZ3Qg6zRkaLWtrT1DHn3ZAz58iZfsegpyi8oUMqHJUejhICN6UAeKUxBu6xD24O4Q6UNPXQqB8gi1SP/h+oLyXwvokY35ePKWUGRzntEyqAtLOE0lHp9V8CrJGfY5esXi6yYH9gukf+FMH6m5AZTzvGkHQ3IZfQSw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 21:05:09.7587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9509a979-25ff-4502-d241-08df0935df93
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4307
X-Proofpoint-GUID: TCVtR_4ZKWpxOCynS0ub2LUdUongmP9l
X-Proofpoint-ORIG-GUID: TCVtR_4ZKWpxOCynS0ub2LUdUongmP9l
X-Authority-Analysis: v=2.4 cv=NPflPU6g c=1 sm=1 tr=0 ts=6a988f8a cx=c_pps
 a=XnoXs6g8SJkBXVwgXvPJGw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=j0SP3X6kSRXRHeAwYTMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE4NyBTYWx0ZWRfX+X9RDtaP0yMA
 xb85oOwI/lnRQrNQzwVVLFGsfA6DMq/wPmrY4tdzSUFxUe3QOZUvbG6ysmfuDIyTFCQRw72kDBr
 XP1boxiWUpTRWQ6Oqo1axcriFhw41No=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE4NyBTYWx0ZWRfX5/GXm8WYxdXH
 uAN4S91obsXvYPvYFvIWdzccP6XjAisXajLvPtbtQVgvtH2pxEx2MTgjaL0zjuGTVWdcd1wG8l5
 xaB+EfXnIMCgSxJE3cgT1sUZEAt1UKXuvgAHoHFzjsNwiBfdM8WUQCFPxYQzc5KX/uLunB/5YmH
 sk4uThhm2aJqWYEm+bIs1pSAtqkb/cFJu9Q9CNkajYANprL8ACaqOQ7TxZS4V5Kp6ThhUU1EC8c
 Sn9mNeCXlgjxQjCcsSUvRnQT3rtR0E9MrM/38IgLJSwRpzv3Bi6aIuE1r9XISwk5KSO+pktIYG3
 tzm0I+PmYQoqMGSy/lw2WbsKH5Nj7bzXkRaxPsm5bWBkJZo4uGuBLYqpZ4S+aLi7MSs9lpltVkZ
 8Kq1pVvtTAo0auBMiS1POF+yT/WVleC/StoU+vyRY0aV8VI9YJu8cgWSTYIDplpNTcq8hgM2pii
 RpBtUv+sdZrDMv8XRNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020187

This series prepends "ti,am62-m_can" compatible to the m_can devices in
the TI AM62 family of devices. By adding this compaible, this series
adds out-of-band wakeup support for m_can devices.

Dependency
----------
This series depends on the "can: m_can: introduce ti,am62-m_can compatible
for out-of-band wakeup" series which implements the "ti,am62-m_can"
compatible in the m_can driver and dt bindings.

Testing
-------
Tested suspend/resume with CAN wakeup on AM62P SK EVM.

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
Changes in v2:
- Removed "out-band-wakeup" device tree property.
- Add "ti,am62-m_can" compatible to m_can devices.
- Link to v1: https://lore.kernel.org/r/20260820-smth-v1-0-e1738a38d58e@ti.com

---
Kendall Willis (3):
      arm64: dts: ti: k3-am62: use ti,am62-m_can compatible for m_can devices
      arm64: dts: ti: k3-am62a: use ti,am62-m_can compatible for m_can devices
      arm64: dts: ti: k3-am62p: use ti,am62-m_can compatible for m_can devices

 arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi               | 4 ++--
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi              | 4 ++--
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260819-smth-6fb189fc148f

Best regards,
-- 
Kendall Willis <k-willis@ti.com>

