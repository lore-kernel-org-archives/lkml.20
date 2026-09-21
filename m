Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEA04BE421;
	Mon, 21 Sep 2026 15:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004735; cv=fail; b=Qc0RFBxresuNGhDNHux6ZpPovf5zUJF14VL1g9rw4TJtFErAnxHR0EaCOvqXe9hXk6inMbxAjt2zrejrEml5ar6Lsa60j0VjRjYk5DcTfLooR+KkjGWYM4QS+5YqjfXgDz3M2ZDxt9WRajgNSCSQ4hiD+AXsgXuAkZxteRMJ4xU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004735; c=relaxed/simple;
	bh=jeO1Ce4G96QOBRjB6Sa3aMBsoxvbObMwfg6P9MilmF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZAo1ksKytoT7T4tvjb98C3EEJHiuXuhTGSU8OjxUtJ5iJugOz5EgFHqWU3LqdrWbsChuIhyrNv6QL+BJLjMMkjDuQijE2LaDHvBQlEzIThUSubKYhOsdGw40pzGdAa2SG1Th80KWT8PZ8lqueCuMtOBY3mnXC6LMNQ6mR/NtRNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=mFwokzvF; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DwDuQWYg; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="mFwokzvF";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DwDuQWYg"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68LF8PMu1172081;
	Mon, 21 Sep 2026 10:31:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=g/ymVCjiH3s+MtQ93CoF/UW5PG4Yj5pDBq+EeHXY0
	7Q=; b=mFwokzvF1tPleakkZTsSgk7L6WdxyaCjpiD0rSsTDma8zv+E5fo9Xp0WE
	ngpSQSyMQVRWXisaaWAlMwwUm3ieHgjzTygemtHJBOzC3dBX7IPF9kWKXM7IqExY
	7VxDkxSUzB9ZDJJ0QSYBNUcH+i80dOrCcH3UhoGpYlzG10FKU5EJ6EJsGwPFaJg9
	P8yvIeXn5vjCsoWnra9G+1/eFUJV5Lolt9TvtSOiNFWwyya9B6/xLb8rL+rJ4qZg
	78sOayR4j5hOgSXkA+yOsa6Vk9cKMK6yOTcSXOp6eKMpLWYkByQtlISZVw8MfBAD
	VEU4VEXNNkZC33WMDXc1xTE4KQHag==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011035.outbound.protection.outlook.com [52.101.62.35])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gtcbnqjr1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Sep 2026 10:31:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYJLWMtDCsZ65Uizxx2hQVtu7v7s+njRcDAgBJfhViYNkdJ4cquOlohYK1wjpcVOUssECs69KkrS5zhPisp+YXLzRiVUJPwoAWorSrUBfLiatjWcfkr10GOKaRNsVBBua9Kz4mZKXqIeapGUvXGGcc6brhuKgi9RP94YxpWvjTB8WWNcLJ0M/sm435aWxqnbdRUcW8UIPgTI8O94JRtJC4lXMA9mai/EdSecHhghzAjRNXqYGlODqZiLm0czk6vZMCdk5DFwt7m6JXG3tPlT/y+d4ga/YlESZq2HNdYOCcibC4QJXhYFPQCcmGMnB36Nlo+3H/IxwjGq0IdPd7b3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/ymVCjiH3s+MtQ93CoF/UW5PG4Yj5pDBq+EeHXY07Q=;
 b=ApRFyKnX6+glcPdGjDlBk4CcVE3lzRrzMAmTUVNyOvxtYpn1puGJe5DpMcVgU35VyIpZRzZIvQKkPhwuqoqd2VSfSl0EAF00Hu9rTkpm9Ubi4L5EsoU92WMMlGuz93nVedD+rIf/I8YyiRGMlfZbaBNTTu7CCLEHAov6L/0oq+oKhBDa60WEDypL7HXGBpqN4folTSKU+8Y8YInMLd8VlSpDvxXaJHI9GpcQlF9hiFTtsQEa9tmr0QkqQuB3Nu3m+OyYYERp1sPfU+RwZ0RZZAhEKuhuYdtUrb2vYxatDYUfKKAz0fHm5KF3EXQ0E0Tc/XklxKSlue+6bWupGd8WdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/ymVCjiH3s+MtQ93CoF/UW5PG4Yj5pDBq+EeHXY07Q=;
 b=DwDuQWYgntwvzjqyS07ez1smM0KC+XSTURWsW3Hk5R+7pWJGtMqjqYIGXbLIXotXbF/UC6J7yA/1THhRSBiJAqaMG1eJoInXoKf7WmL+S/GmvKQoYv7DRWdOYqxVB5PVTEbSke7+KONOxvPTQdIhtWE5YdTs7zlr+9LtTJ73VAI=
Received: from SJ0PR13CA0147.namprd13.prod.outlook.com (2603:10b6:a03:2c6::32)
 by SN7PR10MB7075.namprd10.prod.outlook.com (2603:10b6:806:34f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Mon, 21 Sep
 2026 15:31:42 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::68) by SJ0PR13CA0147.outlook.office365.com
 (2603:10b6:a03:2c6::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Mon,
 21 Sep 2026 15:31:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Mon, 21 Sep 2026 15:31:41 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 10:31:17 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 10:31:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 21 Sep 2026 10:31:17 -0500
Received: from [10.249.36.64] ([10.249.36.64])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68LFVHvO3245254;
	Mon, 21 Sep 2026 10:31:17 -0500
Message-ID: <01ff0252-1580-4934-af34-6ef70d874f10@ti.com>
Date: Mon, 21 Sep 2026 10:31:16 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: ti: k3-j784s4-j742s2-main-common:
 Assign SRAM to VPU nodes
To: "Kumar, Udit" <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <afd@ti.com>
References: <20260810205206.685971-1-b-brnich@ti.com>
 <20260810205206.685971-5-b-brnich@ti.com>
 <b5dc14b2-9b8b-4da5-b48c-274bdf6581a3@ti.com>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <b5dc14b2-9b8b-4da5-b48c-274bdf6581a3@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|SN7PR10MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: dfd4feee-5606-424d-f513-08df17f56f89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|10067099003|921020|18002099003|22082099003|56012099006|4143699003|13003099007;
X-Microsoft-Antispam-Message-Info:
	btAT04MjmLB32wmT+Nd7e1j5/tck6+8PtS+qUqLviNYHyiAGAzkbQa3daYPBwEkrHbDIG4HYEjkv8ewiKKOU4GAX8uxygSKdQ70snsoKDQ7Lz8BUILnnxoB34keqfKaa0bTq4aav9xtNKUSBFLAampTUG51wjrXkgD94rrs1e46KNMmYPf0bjZN/zAPArN97j3bNvXECenXHvp3VrZ5SUSFBTt/Aq61iVFisZHdgJLZxuBXrTJmyicMGx4RwlavLSorR2j/QUyYmuYGzCBC0v49mVhUrVUzqxxFos1NLf/TafA+DtfU5T+tAerFFXVltRcHjkExXBDP2VDG7zn3WIxWjbOw9MW8kP71X7GzuF3TeQfFi5UztI+YlaPYvNpq2XfnAMyjQdWmPrEkBEpoFgCWXkntR/dYt8piYENRLzeBozItR5IY5vQAV0vpviw1uNtAmZGJnrJEpaZMtm5Rvtb4a1bCSY+AxSmR0tUjCYB5mwEFVM261gWbWnIB6O/22A6lj4eiOFBxZIqml+3HCEu+pbjqC04Vq07gE088tOjYkUscCKaE/1lgZE9sHgYxUEomjA8cWqZ2p0IqXKjJ+Cd4Fp/vLFgnH/FuK2M30oq/mJ+pmNnoIpvk6ViKP8nNgxxXqz9a/ezhnotiW4dJ+JtmnQg6spWsGAnk6LPbim8TxXFJECY53FUMUuwYVDaY9JyrgA+gXQuXLgJKTI9BCOQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(10067099003)(921020)(18002099003)(22082099003)(56012099006)(4143699003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	If0tqpup9rsmAQf7Jmnb91ZxDTXUvGMRuqpCnRKo3CdpBnWi6a3LVp3WrShfPeqbZ7fyRi0oia8YHmnJV/AIx5F7mOJ57ZD/cnpXi8p4Tth8GxYBn7vS+xgi7RppoRNXuIb7APWytltsF8ZvpiSkM2M08l0FisMaCTA1AwVQG36kMXsDY4ooP1qNNx7NALQJgzjMlXkcBGb8kCh2knxqcekOaKSNheENOyWD7BHbmHF4Hyl+4MUo4LZeWJpeuLg0K/Tn72cEX8JhbtlAU/mixBA3pjPYOYThagCNy6ZAoJPB3g1vj+O+ljlmjoZAnt/jmnfxfQAfSdw5JRSEYIEmMdGVjn8/HiKkUonvEqeOE3xlepfPi4m2heuM5M/tZ5B6S6CpvioU7/uWEpdLH4HJNteGnp1rkYqFNboggMNXqSMhtaY+ru0E8/+UCvLMxRf/
X-Exchange-RoutingPolicyChecked:
	ViXEilDAgzrR/h8rokxLj5crFwUfdOvItOasucGkLPy1ZYNYFk5srCLGSCKjYe/tsCC0i6182wV8pWaMzpI7Z6FsgaFW6Dzx1ZbBU1BFpyEBnbK5JqjZH2xjpZt/l6uAJT+mPVfz2ZnYncckocHeV09ZDm4kOG5pmaRS1Ip/6gTocKoYH5t1UTF1s/7K3oE3E1LLq12zFtNzfAPuoewx2Mar2K3/kUimuAzNCQ1ZacteYcp4HFaHqaHXb+4XS2tYrsD/4vLGhblCKzNIwyrre75MyyoZDFcSDFlkY5YMPWHJ/Mxz4K3Qo938W7hnTHdzzp0314MU27rH2XpcQAcRmQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 15:31:41.4330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd4feee-5606-424d-f513-08df17f56f89
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7075
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIyNiBTYWx0ZWRfX5miwCaRVJYqx
 7Umn6lyA/38F0AFZXKkOTkHV0q3/HZuSS1Qd0UNgTNPVMtKMGRiBYOdBXYW1KfYBgfuDm2KDzvw
 lvhPf36tN0rUvPaY/kwEeGck7yZ/A+0=
X-Authority-Analysis: v=2.4 cv=P7CvFSAu c=1 sm=1 tr=0 ts=6ab14de8 cx=c_pps
 a=YQq2SbcpNRFTj3qt8lmqwA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=P-IC7800AAAA:8
 a=sozttTNsAAAA:8 a=ho0JAuJ0ECzAQ1l8ebEA:9 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIyNiBTYWx0ZWRfXwHygAlX51Dvo
 JePTUVyEtBKuG/BT2PqfsIXCnfWfew9rdgBdz+yDTDa9R4G1vE7D029L4qP4fjYdW9ENOidj835
 6aB9UozcfSbDeIzW0XrqUv+JTx/HARqAMVcHAyMi3JJKmBdkr4TNAfufZSn8KRMMzxJWlUfp2pO
 srR3jP+zizqjcJucWOqCYJVxEp3AbvVvJ4aoTvKRXeC7uAs9usvWivS4eshDNnaNMH5JwzXU6mg
 fRPspaOb16nU1ORCMfG4UFS+Zrsc/DI959veilLWQd4xDbEW/NBguPOJKBmg72DNWRrE1H/ZCIy
 Fr1TgRXwB3ltl/aqAHWarY8HkJM5pj66+CWdWW6SphvLN4RwwmjtBKTMIDTyYtFp+PgoQKH7HP6
 MC91tTb0ItdDQWEDXJ+SQDv3hYXfdxJbYVYYM7gCspKhPdfgD0xC7imxXwMRBWr2mAnH2Gs3F98
 FBwbWj1J1jeBEynFP7Q==
X-Proofpoint-GUID: LKjt4M6cBGXa4iJqbPjcHCepSS4XnWyt
X-Proofpoint-ORIG-GUID: LKjt4M6cBGXa4iJqbPjcHCepSS4XnWyt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210226

Hi Udit,

On 9/5/26 7:48 AM, Kumar, Udit wrote:
> 
> 
> On 8/11/2026 2:22 AM, Brandon Brnich wrote:
>> The Wave5 VPU supports connecting to on-chip SRAM through its secondary
>> AXI interface. This allows temporal buffers to be stored on a per-stream
>> basis, reducing DDR memory traffic.
>>
>> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
>> Reviewed-by: Andrew Davis <afd@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
>> index e836f0f42e30d..21ec9f207ff63 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
>> @@ -1002,6 +1002,7 @@ vpu0: video-codec@4210000 {
>>   		interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
>>   		clocks = <&k3_clks 241 2>;
>>   		power-domains = <&k3_pds 241 TI_SCI_PD_EXCLUSIVE>;
>> +		sram = <&main_navss_sram>;
>>   	};
>>   
>>   	vpu1: video-codec@4220000 {
>> @@ -1010,6 +1011,7 @@ vpu1: video-codec@4220000 {
>>   		interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
>>   		clocks = <&k3_clks 242 2>;
>>   		power-domains = <&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
>> +		sram = <&main_navss_sram>;
>>   	};
> 
> Hello Brandon,
> Could you check, how two instances of hardware can share same sram ?

If both instances are used in parallel, then only 1 would get the 
benefits of b/w savings with this current patch. These VPU instances are 
in a race to see who gets the pool depending on which instance allocates 
the first stream. Current Wave5 driver will take the entire 64 KB pool 
once a stream is opened. The pool is not released until all associated 
streams with that instance are freed.

I will look to see if the driver can be modified at all here. If it 
can't, then I will find another node of available SRAM that I can hook 
up to 2nd instance. For now, we can drop this patch and associated patch 
adding main_navss_sram to J784s4 in this series.

Best,
Brandon

> 
> LTM, each block need 64KB of SRAM
> https://elixir.bootlin.com/linux/v7.2.2/source/drivers/media/platform/chips-media/wave5/wave5-vpu.c#L463>
> 
>>   
>>   	main_sdhci0: mmc@4f80000 {
> 

