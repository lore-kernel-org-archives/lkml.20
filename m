Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE164F0527;
	Mon, 28 Sep 2026 17:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615497; cv=fail; b=e0TnkLbvLaJC4rwiZim2xGs/GtsPN7WkmOX10ckM5MLp5hw97C9A2Bmky8kUAgecSdgbektwJ7OpX2lfjxuLbixSqIo2vdId3sG0HLenAeCS8hujrM+RvhX9UBgZ0w39AP6+Y0D+YRAJhaHZXrKsYw8aIfAUZPU5welmtZa3LVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615497; c=relaxed/simple;
	bh=N8nCBiLqqUSsFQrSA8Tb9Nns14IvIS5JHmaaui99OiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XicWRVpuzlP5PpXl1qT/1dMgPnHMeb23C3xNdgRR29sdS++9oJM1zAbzR3ctLkuOB3byJgjR+BY3oubhrylOu4XR2bJPLL3kGYFJwpEaicnmCNC7PdZZUigZvCZGlF0L+Q2wv7TnIUQ2Hf5JWuVgx3oQL+E8Hr+uulR4mdLOpXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=cXH81Lj0; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=GQs/jGsw; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="cXH81Lj0";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="GQs/jGsw"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68SFJvhO2094898;
	Mon, 28 Sep 2026 12:11:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Tizw9xvSc8dEzd/hYGN4r+sNQmHGiQwsqJp6SxZLW
	Ak=; b=cXH81Lj0PwGYG3a3bhZzmtNRlyrLVKCmZ47gSiiM6nkGDd4fkHEqyoevC
	gvaYV0Mf5HAnlFBVWxbEhsHzhMC/n8BzN0F3rTJfrOgc2pQ7fBB8qo+jmHuqgBwD
	2S+P62LsjKyAduYIIwY0aH49hdxQwx/rSjUQyfGaja1G+tmBoZExCLe1iVO6fu/F
	9FPkEViC9vPuqjOpJDB4rtIA8TYEhMTbO1pLiACrsZ6CxufaJYcqyWYsSfikyrFR
	nAWNIyzbdt35aCXGyKHyn2xfs6ZOxDzvpKsoJLLKQmWmoGof3OlPnUDTyKMA5sX5
	DysEnNCXcGc9nQX+YCzSnKq5ysgEQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010066.outbound.protection.outlook.com [40.93.198.66])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gxy2nqbe7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 12:11:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPzvnaT7hvYQ4UPVJx1u7MR0RWRkOuNJfjy4jwZpP9tbczvHLXlXFUT2znhj/uTCIhqgXNTnekKQap/RtlZ2aHAuFdRK0kDGpUXhnEyrU0iMfrw1F6NSNlWT+xJNmTUkzRuBf+JTJ5+AchhAq5wII6l1qd4QmmQnkHotPaCEMWoG/DN6XvPudFwNluWqySoyeIjBYyNSBtID4pUv429oi/l6fYqdhxLBhtFxg8ARnL4oZwwove9A6Hay9t4RXNKwtL/+M4TMhQAV/CV62Q/XBYgyaac+i26QIrcxwRz+M4nUSpXsPcpooNOBxrax2sMcl+Dx//54ww9iBMKYQ6GyDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tizw9xvSc8dEzd/hYGN4r+sNQmHGiQwsqJp6SxZLWAk=;
 b=tAkLMS6Kln5tLYJoRYjnCupvjY+6sT5bh/eYj2XjJ+gH+Ss3ReouV+9hod3ZJeg8tiE4n72pu0t0R106VjWN6yjjhLmyXBleH7pPLuTsXMSr984TQGQNU4SAIUaxIUIqMjwFHHdhgnvPetWNmkOIjMy4hFTMXv7G3eDq5iwWIFtdSUWJOAgOjNIV9rWBPLvNI/EGYta9bDzyYkS89pzUrekWuJ8M7ynLyJjS+LWfOE6iYY5eXNV49yx2IqT+1wwQiu6pM5/n2x1VYtJuRSumwLt/Ds72q/Ov5X3N0+P+TeTU+/Jz7+lwOMpQZrdrGcBOzlAW1QCGgZMvjLe6+0IcrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tizw9xvSc8dEzd/hYGN4r+sNQmHGiQwsqJp6SxZLWAk=;
 b=GQs/jGswGYXOAsg0ZfSB+ytH10LyM2ypv3GpGyu/GCuvJUU2CaL+iaymc4tcy3NWXQD4KVybHfo674lVcqD/jq8gvVDN+gdK+xSYcguGqryCCDqh1345sNziAH+8wuo6KycRGwgsTqeJicqnmFmCyjuo+mL8EfnHD8DXBM/E7Dg=
Received: from CH2PR12CA0016.namprd12.prod.outlook.com (2603:10b6:610:57::26)
 by CH3PR10MB7715.namprd10.prod.outlook.com (2603:10b6:610:1bd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 28 Sep
 2026 17:11:26 +0000
Received: from DS2PEPF000061C1.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::11) by CH2PR12CA0016.outlook.office365.com
 (2603:10b6:610:57::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 17:11:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF000061C1.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 17:11:25 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 12:11:03 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 12:11:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 28 Sep 2026 12:11:03 -0500
Received: from [128.247.81.105] (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68SHB324276373;
	Mon, 28 Sep 2026 12:11:03 -0500
Message-ID: <de7125f8-93e0-44c2-bbed-d471066e32e7@ti.com>
Date: Mon, 28 Sep 2026 12:11:02 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am62l-main: Add ADC nodes
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <hnagalla@ti.com>
References: <20260928034115.1084840-1-s-adivi@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20260928034115.1084840-1-s-adivi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C1:EE_|CH3PR10MB7715:EE_
X-MS-Office365-Filtering-Correlation-Id: fe32d1a8-c66c-44b6-370c-08df1d838776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|10067099003|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	sdsdgx2TuAsALNoEGQQcuaROuHjsBtzDu8ZypRBocAD4t7eoYrKjAPs+MJmrsoqKrAiuMJv8NOCYvYQCTi7JCc+QV4Jkg8+aVmCkcOBJNeq5RiSsGK6AuzKTYKhgHZE8Cy8hb0pP514H8MEm1Qsyj1ZVHtnccxZUskLQsQKQeUm6sSd4NtMlImNm3t6I3yfB35gRNSofsd+xmVtTJZZ/uhFGzuYeFI7JCPh66GAfbT4RHGViDNDoZ+YNNxEKB1INnWtbm4IO4hJP03SttRfmp7v2FX6+J6e8bIyEiTS74Iqaexh9I2XfRXfaLE/DVmo0Sw2ND3mEVuh1bYLy5Lv22DDRVzVI9tQJkyXOfqvITcjDbrwe4NAPk+1y20du0UVvljCpYyA+A1XIrAL/BPCECX3IW7xyh/rLI2SKjECoi+pWPc0GlIqPvCxWUQ7oaqRLjweG9Pr6r8+JKz2fAeT5Eh4vqMk9xxEBG0U0T1Q+CvcCNesE0PDf26zJReV3GcT0F1B5LCtRDF46yl7c8n33jtJGa65p445vgE8brNRaHxuj0MRzQKPHEk12OtGxZhHF+831reqtMwX9a11UtVd+0QM/ZHPnY1dHoP8FOQ6YoYJsYRwdWsgxPrEeR9zgJ2AZcePDQWdWyOHm6hlS8Ho3f9mVPazeneivfOZDOeyaxeTJVAgpfb2LHZ7+g6SJKqOhIeUw95IwX4zexFdq65/s6a4RXd7xqjFHoo6wD2DlgHUDKK7UGtBYOPBw+J+M1XuT
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(10067099003)(56012099006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mTTLwpE9iZakEGJmBp6z6/8XbW1mmE6b5R1iLpm852DLEI1PpBHKD22DHsc1q63HwXhlhUtVM0Fz3zrTyW/QTA6auuCM4g9aXbQvTvWZ8HAFRSVzeMMcq5wv63plqK3RUiPz9w8bEkWoWBnnmSEj2jpzNX/iDCarZbRkrzt633jBqo4MBSSH9EjelGjjjj2SOYOvi2aRE9FBryVaK2SeMn/Tml5LVSMxmUAdF6D4DmBB2hyN9mgBEV+lyygp9Fs9VUHWypNz425vgOfWvE7OMHi16/JKZcJJuNGJ6cx+9i7eDZ+96OnNaUtiD3P0X3toV2zqAq9SkziVJKxwN+mRonD6C5E0hRaXXree4sskFBR+n++KT14HI8M48G+Ex1te4+BxaO2BJ+XNoxM1cJotk7BVEn6so5Ogb9ji0eSg4r5INA3ZMigwNZKUV2s8SNtl
X-Exchange-RoutingPolicyChecked:
	Mn/eoscht7+sUxSwCTmckbA0LjKZD1qwUUIdhNsgy9UHOFmnWam1IJg7QdrqdN0JaXSidd/GviR2BLewiwSr7WLvSe4hJwEXBzjmpc/zZDBiUqABfzi05g1CV6qW/9LbMTbHqxAEsmmd+NXJ/RnoNepy8HJ0sSjYCoW1nvL8DREjMsV/yWuYxXcGPWPq02ZrwAcRDAfNOJuRdTREuK4dC4wzZkHPdSJEccL5zTDtOi7K+AGI734pr7RN0uONuTsE1iIv2OzgS8Ok7Cn4G0U1rtHlRAevabyV56NG/g58CWREHAF4szVpaZGG16YKENf621Czy7f3t08mA77v19Oz+g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:11:25.8534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe32d1a8-c66c-44b6-370c-08df1d838776
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7715
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2OCBTYWx0ZWRfXwR6CyrN3b4K+
 Fw1WZiNTkpRcz6/Qi/Pdpaj0Rm3pq1TR6VOXTjAEubGwhE6LKxmN0sX9Bvv8pM4J3eARRY6MHWY
 7AWQRDKTTQod9SvJAm1VcyvkK1bovzo=
X-Proofpoint-ORIG-GUID: Dd0zsVj5FVzWzEJ-SH_QJizSAYeclVOy
X-Authority-Analysis: v=2.4 cv=RLgmjIi+ c=1 sm=1 tr=0 ts=6aba9fc3 cx=c_pps
 a=F8U3mngwmb3oM6JELIq/Eg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=LsTy8cB-K7rvGsNrsZEA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
X-Proofpoint-GUID: Dd0zsVj5FVzWzEJ-SH_QJizSAYeclVOy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2OCBTYWx0ZWRfX4/KwbIcDRq6H
 umqbpRN7USUsiyEf8QG+m8PWfuTU4FxM7L5LBkaoPBnuHSwiEB9eVArty567obph9JhSltulhYP
 Xq20HI61EuvSNBJSeP02vatQc27JfyfdX1MLxVYSIo5m3YHch1NOxrZSyYw1+bYJkee7o5Gj7/Y
 0f1SVVJS815rsP4FUfhKyJNZR/bHbNyuD4CzGHYAqgPEsJv3rl+Cho9IxRjzEQ93UsnrCrcmbrZ
 afdK5qaWxijoP0mfC259HE7JDFJ0bCToX6rbFEW0VVNk4esaPiKeZtrFYR8lqLOMrGLT8s1FdSD
 U6cQQ7sxIiBIQ9148h13cSPwm+Sx/9E5xwiwkmdxFzamNaipRtGv58BHdI2KBazMYIS3ous4tGu
 cUqln92v3H8bC/WFQ5pRqANNZbGouEWmY3HKOByA9gihTcsCoS3bEAXSEgJZkJjvEy/9entMuxU
 JuK727C/b7Nskvn5K9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280068

Hi Sai,

On 9/27/26 10:41 PM, Sai Sree Kartheek Adivi wrote:
> From: Judith Mendez <jm@ti.com>
> 
> AM62L has an ADC in main domain, add ADC node in the respective
> voltage domain file.
> 

This was previously blocked because of TISCI parent clocking
issue in TF-A, is that now resolved?

~ Judith
