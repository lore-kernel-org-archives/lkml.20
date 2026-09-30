Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4C52C0303
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798716; cv=fail; b=e46bEdeILq2Zq2Xi/Of5M6XUS7SfQZCmfEgyYvfahvVZY2lm4NmstaEY4h4JJq4i+XqV1fMNmdkYjQZDfjZnEKgjnrdVEz3jkT8VcLyn+rLUHrdAfhSiqN+juReeiqYjdDuCBC6gKRoXj4cSeJfbaSoNUseUZr7RE/Py21kl3Bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798716; c=relaxed/simple;
	bh=1Vhv/PcLdJDOuW8Wj5jjTGHA1W+oOXVHkCwYfW2HfLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dwHKbBtLkiQ/7Nwh+MGSdbzAckEZ7YsccGo8P/u1t6hKOCjP7ZgPaaqLmoLgRoQcD4yO8f0b52tjOZUeQA54KTr+4Od/8HxVtiQfhdUDD0+YDcPxq3kFIITFwG+TMtG4VvNiBN9dvwC4cK2SKjhCHoQcIt7F5EI2vCb8zoY8GX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=WstuH2WW; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=c01SfpME; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="WstuH2WW";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="c01SfpME"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UJsguv3727107;
	Wed, 30 Sep 2026 15:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=X8sbQOdX1s2EAiFWkvyEED0XAAq4OOn1KB2VZrmxE
	Yk=; b=WstuH2WWTOhwfhKJJ1IggKv+R7U6Ywrc/giNXmaW+12x274LnfvHhRCn4
	u+Gx08oFIoZfK+sYZ408MnekTtUvJ7nnwiZEOP3T/mokpbXOnY3ojm0ylGZdg+Pf
	S+DiqHiAGbO0+B3Kxg4QQ3rxbsL7RkADGY7ea47Gqvam6qKfn0M3mm6KyxRk+HMQ
	8LqqXqMfUYMC/OemExlw5Sk1Pgb5uMttsF3spD2iNyczIDuU4QtxFNXO5VMPxuOI
	Sx/zFOiHU4R3WGC6lzR6cvObcBPOW4rVs9qRhJzYCvNyaAcRMa2l7+ULXe9vuSYg
	An2hcZAYbMKms1tGgh8LK0kNsdJCg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012016.outbound.protection.outlook.com [40.93.195.16])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h17djrjpx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 15:05:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VudotJrsXOTkuxbAldCKLJKzoyVAY+n02qKKPN8h5PaBMyRtUY6ESBdI2gKVGIElzpe0Lw+rky7swKypGZQugzcORxC3yEsySnHljM0rxkX0i/MI13ZOyBuI7xxa9EnMscLZ1oWDgutTQmdjylNJtZx87ffACg6xMYv4Y9e1wyWfHaTjYmnRQls5NW9XAdB0CLGIZOt9mzOs3m4eHspg5PEadqC1W3mxdRlfEVg4cixPNKJ+XfwrXIrR6qRVLooAtcj10ko+HwukSN3Ib82eSBfOqbJjop1m+Mwjhsz7EM0kVhpFj6Mq54gMNGq9QeFn/TPLgghPs1JEWPI4iK+0/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8sbQOdX1s2EAiFWkvyEED0XAAq4OOn1KB2VZrmxEYk=;
 b=yp61A9NgGzkOV0chAAhstpsadL17YmOg/daA/q5nRxANGrImfwPffcqmxPPEVdFAaWA7+Gw5qj+QuOIr1zGci9HX/j/7y+8H2HQLw8ZUFXvAU+FQztN2BPU1nKiAwV6a9bR78VpUTr487cIVP+su5WM2k0PV+t3dle2vnYQQOpF4Ykrwtu1PJBaMXEwc3Oss26fdXd929/U21nI7nwbMQuT8+uGiplnjdsCmpCfcDwRk5pfNuoaHnnIs3SPSLgYROXyxnIyjtM7j2z9tlbgGXtTvLvZHYwUaAaNCaOjkJ7GLeLiiIN72/Uv4jy7JMgIMxEkCAjvpMcm5hwhQqGMa6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8sbQOdX1s2EAiFWkvyEED0XAAq4OOn1KB2VZrmxEYk=;
 b=c01SfpMEiGwthrE68313pSBLcyZXxlG1OTYwHMqQCK/UBgMsfHs1Xbv9jS4GIcuTWMnVJR/Mcio17gyepRzPaaD0fmYpeDSkeNX89nr8MgdAts0j1JitUrK6nE7+kHZ3a4YKA92m84150LDIR2yGd2You0NklJMJhBZcbMwh+BA=
Received: from SJ0PR03CA0203.namprd03.prod.outlook.com (2603:10b6:a03:2ef::28)
 by DM4PR10MB6087.namprd10.prod.outlook.com (2603:10b6:8:bf::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 20:05:07 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::4e) by SJ0PR03CA0203.outlook.office365.com
 (2603:10b6:a03:2ef::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Wed,
 30 Sep 2026 20:05:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 20:05:07 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 15:04:45 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 15:04:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 15:04:45 -0500
Received: from [10.249.33.42] ([10.249.33.42])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UK4iig3766009;
	Wed, 30 Sep 2026 15:04:44 -0500
Message-ID: <3f23e00f-c9c4-4554-b963-8cb28328b471@ti.com>
Date: Wed, 30 Sep 2026 15:04:44 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] mailbox: ti-msgmgr: Fixes for polled rx and
 trailing bytes
To: Beleswar Padhi <b-padhi@ti.com>, <jassisinghbrar@gmail.com>, <nm@ti.com>,
        <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <vigneshr@ti.com>
References: <20260930200158.174118-1-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260930200158.174118-1-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|DM4PR10MB6087:EE_
X-MS-Office365-Filtering-Correlation-Id: bceb3667-a0d1-43c7-26ef-08df1f2e2011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	aD/wx4ghvoPiQtuZYPf6BalLW9HBkBI2q2MC2tDEcgUggqmB3zVHvNEgPbdAaq/5DzxNa0LW4FVFhLn49dgM9fIuqyvhosBdR1KlLeWr+aEl4fWnRGIrqHdXCul/PUO8rJ0ogumc/BvVHMM3eegBU+DmG/ybl6b4yCEjNj2z6SA4wQTOU9ZdoRYUSoroF2TMyBqty3ncHBw5id5Epq3kpg30wY6L+ToRCL7KEpo+lCpN4xIVF+51Ovvq6VKBMZTiWaURlmwHx5NAQZDXBJXmc0hVMsDJ6r+oCeiiIX79Y3TeUuD6/5YnppNwsPnAI0G0OuffljaKVCrZsAGMiNKoLUOphB53WqJ3veIDP0oqK9RNDoodkW0ZgZukoKEAkrlyqlKFP5pYPjllEQXF1UdGiRPZFZFpwBu8s99u8kY0ocwcXL7CqYufiFh0svNaYellXO+qItJWWeAgsElAyrDitxQc2tDG7I7W3V08FHLXPJjxJKSAGqwPj0FvrXFlQpmpt5FAfPAtb8CIo5rUqRntJZLoEbfSmmK9SQd1aGBGBu93pyHELPrI27JvzgtlW197s9Yrp/VrPSE6aLhIq/jEscpAq3ojke+wvDiR5OiCXhmaFx7bA23tTieLvzYzVjo4aeACfTljZQ1nzWZBHQmD7XqzJza8q30CXafjW9eJmUU=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+r7T5zu0oR3b4E8YiYrcy8g6Rq8r+rStOYwhNgWw0CX+YdkmmMmvc2dsDc712Yvimtm5gDSCMUNYDH4+UiQ4y2wz8Cf+RlP1yAyBjnkO/SrOqcdRx9tcdO6gg+tvzw/53s44Cnbr/T6WwwNzC8CG5ZGrXupBqGB+PJ7V/d+6hkxdKyUU+jLSIaZis09B7jPSjsbwD987K6YcZhgJLKY7b6EVpY4d2b+h3RJCERm4MJzdMLHzMzTF3Hz3eIjsYpPoeYSv89utYqmvGoEeGXA31NUe9TP4uY7sHR/i5uCyG3qn7nQgkfvnjP/jk6HSDswsEd7WURm33b6tb5/zNwjaEt2V4o+qoZSJbxvLuk984fWBiFxoQ6Ka1VimQfhqE+UQsgMxEdEDq9C+L4CKRWAwvUi4ojokOLP3KVS8weaHyiPkKQsizr32YMcQXJViKz90
X-Exchange-RoutingPolicyChecked:
	DaVIcRUqCeO125yesRP/8PEv5eBvEwr3SXISMRZpCD0Kx5fsDAGmm7QqeSz6K31FZ4Gi1BTUMJRQZ0rVUsR9Gobx8XyIv3U6qy7S8ZrvCrZW6dB6vHZzvWpHGwvQsre5jXwezN1Qz9AfFj67pamRmYEJbB2n7jy3K2hxcjsFtw8pE7CzrRLzkF/+bLspeml5P5Us5mdidwF2XKTOTnhCSkOsjJfZuDQm6BbbU1pCjqxxMqVKbcGPKkiUyrqr+PLayzZPmJ+lY9vkcNFscrL4IBHKqpQCx+M+/VY3qHisPOLUxh4X4P2Xk+zEkjFCKXERgcmWQQrEAsoZjUZJOgHESA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 20:05:07.5551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bceb3667-a0d1-43c7-26ef-08df1f2e2011
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6087
X-Proofpoint-GUID: bUKPeb5rTfIX9Lwr2HB8sfROXbb5KEUO
X-Authority-Analysis: v=2.4 cv=aswnmiZV c=1 sm=1 tr=0 ts=6abd6b79 cx=c_pps
 a=eebb4ZtE0r8msBY2xobl+w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8 a=lcN3mkYQ72P4GqjWPtcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: bUKPeb5rTfIX9Lwr2HB8sfROXbb5KEUO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA4MiBTYWx0ZWRfX/AZE3jVVKB7r
 0Tbk55RaRE6GimdiRBjp2LZczKJ6kSjshz14bOjHSaaWOK9sKH5pCsIfY7V3z/gLpYxFG+UjMJ3
 f4NuNpRQ4tmVcYAk+9M9OpJY0h9mqNQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA4MiBTYWx0ZWRfX0vDyLPYA9C6+
 fI+mELcdHDdrff3bTGBSxN8SxuRlc86ga/t06OdPiXgvYKKpMaMcBRe4VmmGrx7KudUe+A9ewMw
 SL8HFOgF/sKfJmZq9q6cm8sd/hlvoJ1Zai624y6pb1WBuOKCTkK0V+H7kNDdRHnhunAkL+F9UyW
 vZj3rLymlgMMQcALlpR7Aa2R2JAgbbwMPEPsaexikkgqNRk+OC+PM+dZ0ZrDkhrt9SYZZFbCb2e
 qRsf2C+Vx2Xc69UV3JJLMzpOJFYNLEZLWmf7xOykPCg68nCo5g931X7MDtB3rlnwS39iVuXhwJa
 +vGYzZdZL2Wl2ebAqnIufuspWjiuXOzm3lif3wpX/mFWtdEL+Z6g3jgTcYqzQltikhtIzsHMVxD
 SpRFK5ycEf+AnLv4jdDAb7NU5w6Ou1WAwbNYUah07O6aOpoiP16ji7GbZpuXdylBLB5YH/d9KNw
 TRBXYcYIcp/lM373nUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300082

On 9/30/26 3:01 PM, Beleswar Padhi wrote:
> This series fixes two issues in ti_msgmgr_send_data(), found while
> refactoring the ti-msgmgr mbox client (TI-SCI).
> 
> Patch 1 fixes a duplicate message transmission in polled rx mode.
> Patch 2 stops reading past the end of the message buffer when the
> message length is not a multiple of 4. This is a preparatory patch for
> when the mbox client can send data which is not a multiple of 4.
> 
> This series is independent and can be applied directly.
> 
> v3: Changelog:
> 1. Add Fixes: tag in [PATCH v3 2/2].

Looks good now, for both,

Acked-by: Andrew Davis <afd@ti.com>

> 
> Link to v2:
> https://lore.kernel.org/all/20260930143810.2419010-1-b-padhi@ti.com/
> 
> v2: Changelog:
> 1. Use memcpy() to construct the trailing word to handle host endianness
> (Sashiko bot)
> 
> Link to v1:
> https://lore.kernel.org/all/20260929200159.4033010-1-b-padhi@ti.com/#t
> 
> Testing Done:
>   - Boot tested on all TI K3 SoCs.
>   - Boot tested on keystone K2G EVMs.
>   - Tested that these patches do not introduce any new warning or error.
> 
> Logs:
> https://gist.github.com/3V3RYONE/18d0c3ce912ab208b53b5887435ff09a
> 
> Thanks,
> Beleswar
> 
> Beleswar Padhi (2):
>    mailbox: ti-msgmgr: Do not report rx poll timeout as a send failure
>    mailbox: ti-msgmgr: Read exact number of trailing message bytes
> 
>   drivers/mailbox/ti-msgmgr.c | 32 +++++++++++++++++++++++++-------
>   1 file changed, 25 insertions(+), 7 deletions(-)
> 

