Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0394B3254B0;
	Sun, 13 Sep 2026 15:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311964; cv=fail; b=TWjFxdRXv0jLJeVBxPjKM05H6/KHUkXUepQu7rsXyjP/wErwNreDF+btNTf79dljmpOd+fQLCV29w5lXs12GF73xD7ODyL7/CTyZE5zHpGKVx8QVBP2cZnh1lsdTdgeffXOxkQG1XCk9ZVrI1k3DVslPRzccPttzrIKD9zwiA8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311964; c=relaxed/simple;
	bh=/0zBsdSGVcPdeQz9eyAPyq7Q2WV53MaSMEbtH3sEVZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ShVoCYbWNkAvzdPrJUptEyN6l+okhTWeuRNiwVV/i3tVXTT6aa3trOGFM7f133Ni3+T6obAYTrgiCzs7PO34qTFwN/F0bHA3aXbcqpwp1rFDrGWucUYRFTCnZnpnJ/oB0tco+/KRVnuvDfVTPUMazirXOShotOz4nCWTKMAc8GM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=UGk9HiGo; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mht+pDe4; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="UGk9HiGo";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mht+pDe4"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DE1DM13285980;
	Sun, 13 Sep 2026 10:05:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=FLaf1HpsbFEigBp+e/WS2nwEzUY21Uxl9Fi5G55Vj
	iQ=; b=UGk9HiGoUMHCKZJPijv6lICMctVD+6h3mbvD/Cid+Su6XbUGhZdwU6hvi
	tDmxpTrWPk/O88vGfecU+4W6Rkmm7rxeEdIzIkmRQlBDI089mOHd3cmzyD1qhjhN
	lK49HT5/n8wRComcMNIK4RFCotoLXkee28szP0mK31WxqQRaVEnIALNOMEDTh4rW
	NOxYI3a/Fdx/+5+kQSS8hjAbstsvAdtS2hbsSNJeJ4h0NrXRg+Tx/7+Uf3owUnIx
	D5jEqlab8CTPQHPe67qsCd7Rx2Z2vEBQ3j2oP4BbB+aR8nG3NMSADgFdc3aT12rN
	4bY7cZ2IRTs4yHy4k9Zzb3ymOZYKQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011049.outbound.protection.outlook.com [40.93.194.49])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gnp45smd9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 13 Sep 2026 10:05:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGvVxkFdcgf82HXlNE/l0xBeF/8W/DFiE7f9C50FbL64UICLTKVHCwhRIXhioV4K5uKHprp9u9oO4FJ26z4fuVnP3CD2hd3NXtm8Dx86RAmV8u1BdvDyKBb8201JBGf0mNiphUsN4RFGF0wRJg3so0J1RMZsPY2Bd+zZJFsQ8HANOMc8mHNHIXptf5CtXMdR/yBnfwv09zay0fVBrZAt8mvXbFy+rxikljf2lXsrJHA8zXq99cfpHu/Lqo3VvBRHIVc2CkfhX+58ZsEVR+J0BZiSOndhO+uV3xEayWmSvh4sGCcout3UgCLhhHEJ2Ql8682LU1mbLD7CqGNQeyaMzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLaf1HpsbFEigBp+e/WS2nwEzUY21Uxl9Fi5G55VjiQ=;
 b=lUlDc0blU1OIGXUnRRafNTF1l1DhOaAM92i2K+qYeLBuEJTtX2M8/ExjAmHITvZHFAABDD9arjWfA1rv8h05ySpsWwUT/uuhDQWEjE9OHykP5FI7r1bUn49yg8ji1jhOt9w3I/Zt7VOSGjEPh5NUAuWoYayxx00p/vrGajNyPGrY/NMcnI98PdRQNbaiXAWvWgeIWx4PW+KOOFqanVv2WgDBgbJ3DClxO/JX0K09cU/HAnP1rSwCYJX5iPienTZ/eLfbSB4ngYn0UaCY/yZLkKJ6LvkAX1WaFkkeXdScI+y9h87NPuon3WWDPL+/9/Z2iwp75XCJQdKzoQG5vo90zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLaf1HpsbFEigBp+e/WS2nwEzUY21Uxl9Fi5G55VjiQ=;
 b=mht+pDe4hevUeOf2utqTxeBlR3ueFFtsqYZ5zmZSZ9fTinTsPAWqBudG8QjPTVPCuEXCGTP/gjx487kniLvq9jjK3AFbdczq4v/m0MEUOYHpe2rBnsBneSRZPGWzeh+dEExJHxhEUNehr+jfp1HVAkEKcUcJdn6Y26o9s4RN5EI=
Received: from SJ0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:a03:33a::19)
 by DS0PR10MB8152.namprd10.prod.outlook.com (2603:10b6:8:1fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Sun, 13 Sep
 2026 15:05:46 +0000
Received: from SJ1PEPF000037B9.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::3c) by SJ0PR03CA0014.outlook.office365.com
 (2603:10b6:a03:33a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Sun,
 13 Sep 2026 15:05:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000037B9.mail.protection.outlook.com (10.167.244.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Sun, 13 Sep 2026 15:05:44 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 13 Sep
 2026 10:05:02 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 13 Sep
 2026 10:05:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 13 Sep 2026 10:05:01 -0500
Received: from [10.249.141.59] ([10.249.141.59])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68DF4ueH3739714;
	Sun, 13 Sep 2026 10:04:57 -0500
Message-ID: <589b873d-f7b7-45d3-bee4-a7b090a26b0a@ti.com>
Date: Sun, 13 Sep 2026 20:34:55 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add DSS support for AM62L SoC
To: "Kumar, Udit" <u-kumar1@ti.com>,
        Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devarsht@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260811130822.2324438-1-s-jain1@ti.com>
 <5727ba42-4469-4a12-ab70-9f85089dc6c1@ideasonboard.com>
 <25d22caf-c971-4a6b-887a-7770a0bfb6c4@ti.com>
 <f49852ba-c484-4703-9f5a-457443bd4942@ti.com>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <f49852ba-c484-4703-9f5a-457443bd4942@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B9:EE_|DS0PR10MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: dc98bdf3-ad13-45ab-af19-08df11a87c2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|4143699003|56012099006|3023799007|10067099003|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8x0P1/m9lR6/bT065MFJavYu5w8VwAKbO+fz3QHNEZefuFURKerFCR2qTQFIY/2rTLr7oNGnfFN5z1Lqnw/I79+a7MdO+bOrXbmICE+oyb/DON3cfYNbQTBNymz6h9kWY9fidJQdNHkR+UHxnf5bt3R4eqkOZLc/NPzm2pzwQ70uyq2/FEKtwqtHitRrA0ZLmok8oyUwuDIB7gIwqbvujt0R8teenn8CKO8lGBttoEiIZizFWrBGhZrzs4r0eS7M+kMYkH4vpK9ZSKrHlCH65r9i3rRWDj9m0564N47yEsBlEHrplAux4ZSBwPbLqtACXTzgo2qsWMhqBC1EijlSU6zhYX8xTIVkte/WrL0OA4KPD+4b0Obm/0+yKqo1wQvXkTPxfRGKsqOBZ9i++UAFlgSdU97yowL1RP0MNJbzKSgzTDAR708HOdR6+QDk01QZQsCYMFO1w4IFaSGyiKfhBcO4q2jp/GEwytiy9bRIlQ7v7XwnY1Xi8cIuZy1ho3Ve3sHldN7GtIi3cVi5sN+JUYvkfXA29s/uTdlOv+G/qR1MtbUF2/YYxuh0q8Uj9i7DfBCj9iNtLkkvRA8rW6N3cbRVaOU4eNAqBPSuL16klWuUY3qFStC9Lxs+0shAkNGAZeirBN4cbNIOxz3QK7IU+mcY7RmpUONE3sYNgUuHLfroSK9YLimL8dLmoLRxM9RsV3q9UJ97nLK1CObAMJ3WZg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(4143699003)(56012099006)(3023799007)(10067099003)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	B0Zk8aQkOT8tuw1KgrC+kcksn22rggk4+Cngi1gSEo9wL73GdCApmYQWitFOTAzwKxczTbNB3sAK5FdNyBvtZmmif5RFIVQ0ynPi8MbEyVBV6gWpQC9XaioE1F5vpIz91bG2w5sO2/yPu8l2pVPK14dyf30DW1G2ZENTTksdzv2nlNlODOv8K/9p9AiYUFrkDNPYroKZH3QhhVcBasUQC32VWQfM8VLrXjSXqwL6pBWXZjRzsNYZfx9M0/WIVkNlY8SqtKwRSoDj7blX8if55Jrc+0ppU+OdJ67sCAOUpmuruDboudgapBH0+0nqU+Gch6KmJDDDqo7DWX0sHVH8AqrjMnNJ6kGdYtgfkXLVCID8Wuv2mCoM/rUjzV3+QPwXGfLEua+ELnH66tZJHG7tcjQZg1H5hxHI/N9Jkm8rBPCSzgIFJwz+JuB7VzngDtDy
X-Exchange-RoutingPolicyChecked:
	WsrCGu9dqIpwj1VKkBT047L2CPBLpB1d7BUhhxo6UktKgTU/t6DUnFPtfx6Xm9PJVzWwb+ldbCw+uE1Ve19poCrH2PHrhYKWvyQ8VUBXpPWyxGrjkm+3GNHC7e3XAsHDmKVDEfK6vmm4OnchshgOs+8uxoeQ17pT2sAjcLluskUedvto13oWE20DZr8QLddZwnouycMXxGApkaCYlrZi+VE55QJ1KsOHNdZTuKYE0ZLH6g4P+r5DiNLZH/o2fsSLmlxFFLLkXG4ywSo0daMryyRHAISap/nhYTQiqe+KmN1BLBTPsJG3Yj7avF8FCubU53DMRRsWH4Ib+tPQsX9kFw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 15:05:44.4187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc98bdf3-ad13-45ab-af19-08df11a87c2e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037B9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8152
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDIxNSBTYWx0ZWRfX+9GTQCDGmNSu
 4CljkvBRkqzg5ng3nAoq0y955kQxCrZ3cMHoaiPU1M5Q9b4puVOu4wrydy9yjRUMm+m/vKmb+qy
 r2S/ueTXk1NCPFPmmRu9Ajr2OktHv4U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDIxNSBTYWx0ZWRfX+3S50A1J7XQC
 Xrao8KwBsataHfM2mYJZSwhm39V8VUN6QGNTvHp4jx4jsqc8UTObsm7GryKBuEJrcQcMzXk4sOp
 2jt4QNWWn/U8/vtZN7xxavwxPfEMIM934sM9GOaglWNVuyboI59NbJ6ruSBWXWI8fxc8Yt2E5+Y
 l1b8TIf1ntRHoCHn6XvBEQLofsPZQNhQyZJmH6LQSvni8FzR8MUbYcc3xVmlLJS8Qf54mJ44wpi
 rku8ZQS0+kIMNNLlocXU3CM7IILlPgzfpTHHm9/NTKgdIfMxEp4zS+rvbKrItMZ3Fc4RRVT9FA/
 uXAkWFZs8h35sKRZUfBR/+TXnjW94671swBrtXj0geaT5vm6yxFDsoXtiC+AseGcHCFz29EBJ8D
 sQLhlmd4KhtBwQIW/SH+4ZRqE2NvgOlzDi5BBqtEQXwajrbU0BH1LOv56NAlcHE7c1+CTALG+hj
 VDyOM4tGzzbjdLYNz4A==
X-Authority-Analysis: v=2.4 cv=Jq5kP84C c=1 sm=1 tr=0 ts=6aa6bbcd cx=c_pps
 a=LWr4lAA3g636x20Wckjs+g==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=P1BnusSwAAAA:8
 a=GFGnnxxPwZrJ3szhfAsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: 5ZI1hLUuCWqnxmq0CzwtQSg7I45wCfhu
X-Proofpoint-ORIG-GUID: 5ZI1hLUuCWqnxmq0CzwtQSg7I45wCfhu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130215



On 06-09-2026 19:08, Kumar, Udit wrote:
> 
> 
> On 9/3/2026 2:46 PM, Swamil Jain wrote:
>> Hi Tomi,
>>
>> On 8/21/26 14:32, Tomi Valkeinen wrote:
>>> Hi,
>>>
>>> On 11/08/2026 16:08, Swamil Jain wrote:
>>>> This series:
>>>> - Adds base support to enable Display on TI AM62L[1] SoCs
>>>> - Adds base support for DSI output
>>>> - Enbales HDMI output out-of-box
>>>>
>>>> [1]: https://www.ti.com/product/AM62L
>>
>> Thanks for reviewing the patch.
>>
>>> Do we really need bootph-all? In any case:
>>>
>>
>> We need it to enable splash-screen.
>>
> 
> Then you should have in ports too

Thanks Udit, will add the property to ports too and respin the series.

Regards,
Swamil.

> 
>> Regards,
>> Swamil
>>
>>
>>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>
>>>    Tomi
>>>
>>
> 

