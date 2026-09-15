Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A4833064D;
	Tue, 15 Sep 2026 22:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789512196; cv=fail; b=dDxBEjkOthSb61/zq3NqfDP0z07AWW5Dy3JDghpPcyIOxBDZBLcFVbvmIfTvSKaujFzKs6l2OQ056OkV4VbDxq3XKOxnzIQ/qpUFzquig7j80wlj1dme9dQhCPv8Kl3asxD8Z7SD57j1gL9g7RpV3SX/iVcw57XoPbLwoLq1/yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789512196; c=relaxed/simple;
	bh=qo0FUPURtPixKwi2wUzJYQ/VsGKmkipJfMXcUl5rXLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LhtJrdceX1rwH2pnjJxhq+5HxCP0Nhaw1Ck8R8WWGYQxHU+Hpb14G6JHJ2OKi5t9ZeB8rnFyJhlRbDYszLW6obfgSNAfDda28nOXuQRaIj5cIIYtBMAiSv0/vBGflgpZ7tvNEI8ZmjuYlHbKkbgexSuWjsVpRIBv2ETQ8ypj3c8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=DUYuvjXt; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sCa4qOYl; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="DUYuvjXt";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sCa4qOYl"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLsujV1039582;
	Tue, 15 Sep 2026 17:43:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=vwdoqTGuyO4C3EZ+RGFskEZ/g/dWqbO7AhuVdfp6z
	jY=; b=DUYuvjXtjSq308pxEpSfmiPU3YOo59jvX//LXQQfu336fTFZkrSEC/D5m
	tSNFaWBzSDsuffaW6X3+bRRQCHF0NKpaVppPGXvKCchpI5GRKsnPLwF6KrDhZicT
	7oC57Rli4ByiLSt7X25LLpAa0mGn5l3bxeyouk5JXHotaJtXWSR82aumAdVRrzTB
	UtuPCOscN4lthAWhkgHtuXKOldo7M9ogHOC35mEcBMH9znsiP1pEd6GHcQywUm6e
	1FZygXas+jp+BE+v6YznePVMgmmV6z2+D9eGa89MAlhTjwPhgS6phcKL5AYMOhjr
	ekKIUcO1mfnSejCt9d2+Y8je2aYXQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012069.outbound.protection.outlook.com [52.101.48.69])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gq362w9m5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 17:43:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZIYlkIqntxYY/0XoCLqzhaQoE9p+hheaUjS5rRWvBVI+Nt2lu+8n1YXfHXaFU+6Bnd36pT+DBlS2ZlPBPi3AtEGwxNutP7tEerua+dDK/AX/R+xMqwnJDoORk210DDDq/s86vhQfWCXUWr5VpXW4/OZPD86Xe0MKNyrDOtibuUu3X0BbcJdQyAivf8VKwNtL0xTYtIvlapOcMoC8E0TRfYbzBtN/D/9P4EPkzHXEk0a7LbPMFq4wGebxKDBVTdshDCj2Yx7g1245Fa+2kt5XUllQpzO/UR4rWsSrqKK3PgBq27FfoRJo9pGVE39aD00LmlFqVmIc46iRF6V8fcaTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwdoqTGuyO4C3EZ+RGFskEZ/g/dWqbO7AhuVdfp6zjY=;
 b=I+SSj+hZRBv6Ig294AiqvOjrKWs/idLTEvuwWf12WPVT1m4ERU0evMhnE71Ef6M1l2jyftP4LcmFUAsMgn91Sg76/HjKlNpS0xo7w8qoY+giZDIvRyIAJSW12qT4WBdMfPotG17ujNB8zfImXifauVUjvZ46VCip4fBwi/ukE6Ih/qzMP8+2ivlyz4WG8wOkpDxbXhAkYP2pB8OKgK6eE8fkYtV+ZlhT5mm/HpQiaWOi4+nBAwymXCfoRSNC7k8yxybx+Ix2PRaxXi0a1jkHBxs4l7MQho5gAVdDEbjIA82+Hz0LPU/F/KM8z97Fqgot8Yty54Bu2gELm9RfRCL+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwdoqTGuyO4C3EZ+RGFskEZ/g/dWqbO7AhuVdfp6zjY=;
 b=sCa4qOYlHmSImTv439u6hxkBPMAx6OM3gXy3N5ZKBDH9dNIhXOwP3Ra3HQMJ3UvTEkfiPO+srYxqdpDmn9MnMxTUkDlT7LL5feTXaBrSdcqXZr6zPRh7ZNMhV7i1bqu8SQxmXzRnvfE71caBhn+JKOo0BTd5WArQVPQ4M6rwb80=
Received: from SJ0PR03CA0376.namprd03.prod.outlook.com (2603:10b6:a03:3a1::21)
 by CH0PR10MB4939.namprd10.prod.outlook.com (2603:10b6:610:c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 22:43:05 +0000
Received: from SJ1PEPF00001CE1.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::41) by SJ0PR03CA0376.outlook.office365.com
 (2603:10b6:a03:3a1::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 22:43:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00001CE1.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 22:43:03 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 17:42:38 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 17:42:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 15 Sep 2026 17:42:38 -0500
Received: from [128.247.81.105] (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68FMgc8w826644;
	Tue, 15 Sep 2026 17:42:38 -0500
Message-ID: <5d4742fa-e26a-4b49-8eb4-b6291c402334@ti.com>
Date: Tue, 15 Sep 2026 17:42:38 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-j722s-common-wakeup: Add GP_SW1
 efuse node for silicon revision
To: "Kumar, Udit" <u-kumar1@ti.com>, Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260915001304.3781247-1-jm@ti.com>
 <b490c984-8fba-4b92-96f0-8e4a4cc811b0@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <b490c984-8fba-4b92-96f0-8e4a4cc811b0@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE1:EE_|CH0PR10MB4939:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e6f802a-df51-4a1f-fca6-08df137ab3db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QbKKguXeyBpUHTR8VTD1HMCJqq/OaYI1V9qhAddXxn7rdegJxyMR0AyuU3grNRjBPta/516XEGOtcM9khGN4RyQ90z45ulJiRWRF70OzaEsPyWVrava14R4kG4T8eAj4HP+j/nlAzQyCjJ+CIZRXQm0EkLAGomkvI2KAhL6zekMDu8vSdPkP66TevRSp/N4KGLwQINjFbGyGAhSKokGpLu/RntZK9zAffgJCUw30NPhbOQkavorqKcRBB41gCIr/aS2A/JwpsphUnEiRgoUWzODxulrjeRWx10zJe9KWwRcOWLbn/hZF3bmgsjpAecRPCt0eSnFE3h6q5i1wwZ3mIBlU6v1UASTZ0+I98g7OhC4xphGHDOvCK7x8JPG1vHva+XJCkGLKr21qrcjyOA2o77ibUZY746oqoAwp8vgxrQn82a9KA4Cb5u1uc8dfZxUWzNY+J3uAINqSiQfbqA5xIcvXkwLsja4dnAxZFGuS7eYdR+MCXVmvkBvpyJ08MEqAymKGiC0EuZGKR+S+TiWD/BPVwKT+wEkQGwixy26j7RLp/rJJ5tM97C2LTesNSg6puj2qCSeEOOsOsYdWC0VOAa7jhBmeZoy62/Fboa+qveS2iyfdOf2SOdy2+KV1XJF4luUSphnKt3v9+k4WbWE30rFo+lsI6V9KtbMaNoeVh8JQW15/49miYSjdHQPcV2Fw0BfwQpJXAjnmudcw/d2Qig==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RL6F2lOxZTiCc4f2XHeLbsalDjAO6vFLnGaIZAtHHB8HZQc6GaFt3PsxvTy7UUcgF1F49RoyiAipcVPvGhifXNvoY4qlGUrdZS+zjEl+j0njUKA3jYrZuwbgm/Jsn38qxjv7PWr0KJyAMkwj4D+CvLMUR4gnqqHHam6UF4Lxtxpz5uRszkW2SGpq+roHwkP8XdVUD8qHvrjf4KPhVp9LN7RTyNCNW5iRA8HB+Sorw/Pm2Smw75wUV4WD+UOhlX9iF3xR2YnI70L4CzfvqXkiQSrpmPjXTAViuBhoRFRN0KeUDIt/UYue2BZ0UzjAmZVrUQh/iDn/9IqDuKWpCUYWdioIVievFrNmFMCgn9j/PLkgdY/JF7NsTKey9ZOIhaG3DmjHqOFLLs35xrvNnyS/ndbsOaTB7o19b03ign9js7JV9D1w59VGIv80bOQXPx/z
X-Exchange-RoutingPolicyChecked:
	EUP2z6Hg9ZQQVRdrme1fCZzYjkdRGL27mA6gtSgDJWYSal91QbcYKf3aBDsQqHHvv6UCKTv03+C1oGdbt5xX5uHyuKdQ9ARwhhVwLXP+8slLfpxafySEE0BnQdtt0QUBC7YveAw8AIzkQg3r8/oN91wk/FNxnbM1vNBxLNl491IkDAMyRFztNnXCAkoz/7zRsFZaNNu1dopLRZAHW/f4U609+Kn2qmxN+73qbg8sHEAOYgNu8PvYVz41hj2PbGD1oClj3586+mWjZtPn4tFmTGApUHbZ2DXmjnDofw4nM0ivDJZ4NBFP+VHCBlGW0UuyEwNxJD3vrdi8JyK1V/dBnQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 22:43:03.3092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6f802a-df51-4a1f-fca6-08df137ab3db
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4939
X-Authority-Analysis: v=2.4 cv=P9yvFSAu c=1 sm=1 tr=0 ts=6aa9c9fb cx=c_pps
 a=fm8IUWXzr0h7QqFIpCBYEQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=eFBmR6NUpfz6K-ulmJMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: WACTAUpp7tXiSaLijlyj8GPAACBxf0-W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMzMSBTYWx0ZWRfX3bXHeWmeagSc
 g970liC3upfpNwZ5F4X0KBvHRfEUJz0Vln2RLaEb00o31qS2s9kDsNLQWPcadTXbNDuKPCKVzYk
 qNtwkAu9UFGPt+HoJPwDLfBdm/0+fF8XSfJp7Wqxi9yP6+6dP7dDejAibmbdKjXfV6EPcPThBPP
 dT7fe+1sG6djCcxKqe8cUTXFdKJ+3a/9ejHpUTpWceWjtGC/3prg5tlr8mokCD1nD20xuID4I/A
 QTXNxUkDiwMxq6wzM+IY2Scm2jxUsv/+W2DOddLnylelJy4CMHJoPPGn3pI8FBXWmTj9QASty2U
 hzTcldY26UX7VETRJLKyfdUik1lCOk7Lg/QsVI94Nc94LfSARxX7i+Ev/jglGtMrzIk4kx1Yqvs
 Y5/MKOXP/KIotztU6Q9N1guoKMqJySFxvSc7CIWsTQ8NUo61BjpgWI65zMTToSr5+G9cTS7zAXm
 jhmk6HB8A9nW89Y0B+g==
X-Proofpoint-ORIG-GUID: WACTAUpp7tXiSaLijlyj8GPAACBxf0-W
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMzMSBTYWx0ZWRfX3NV70AJWWpPh
 M3jtn73SWGTIeNh9T8ETurqiBbn/wEke3PDVgVN5rgrN89YSo/ybnP/4Q/IjVPtf4nMnHvFM7h6
 ZztTk/7RvJJpuEj7qZxUSf3JUM2QL2A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150331

Hi Udit,

On 9/15/26 11:40 AM, Kumar, Udit wrote:
> 
> Hi Judith,
> 
> On 9/15/2026 5:43 AM, Judith Mendez wrote:
>> Add efuse node for GP_SW1 register at offset 0x230. The GP_SW1
>> efuse register is used to determine AM62Px silicon revision.
>> Reference efuse cell from chipid node via nvmem-cells.
>>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   .../boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi  | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
>> index 8612b45e665cf..0f00e9d87f8ba 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
>> @@ -19,9 +19,23 @@ wkup_conf: bus@43000000 {
>>   		chipid: chipid@14 {
>>   			compatible = "ti,am654-chipid";
>>   			reg = <0x14 0x4>;
>> +			nvmem-cells = <&gpsw1>;
>> +			nvmem-cell-names = "gpsw1";
>>   			bootph-all;
>>   		};
>>   
>> +		gpsw_efuse: efuse@230 {
>> +			compatible = "ti,am62p-efuse", "socionext,uniphier-efuse";
>> +			reg = <0x230 0x10>;
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			bootph-all;
>> +
>> +			gpsw1: gpsw1@4 {
>> +				reg = <0x4 0x4>;
>> +			};
> 
> For J722S, this register this marked as reserved,
> Could you update in am62-p specific dt.

Right, let me see what I can do.

Thanks for reviewing.

~ Judith

> 
> Thanks
> 
>> +		};
>> +
>>   		opp_efuse_table: syscon@18 {
>>   			compatible = "ti,am62-opp-efuse-table", "syscon";
>>   			reg = <0x18 0x4>;
> 

