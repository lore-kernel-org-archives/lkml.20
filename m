Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9B34A7CAC
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400957; cv=fail; b=Fj8DqTejcckej18IpT23oy808GJ1T1lmFY5bsYNNvP/FsJjxv0usrYpptTtwoB606HT+AWCPEIa2+y1infHBnY+HaIysOgQG6BddVWOk593O8V/JYV+cu3G9OdJKnaORxbigU4ypOdtP2AIWzwQjQj9OqPl6pEkfVysrA2/c7lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400957; c=relaxed/simple;
	bh=k+h5IS+0gpctdfdtVWdvj4Pidbr+9YucuqN5f2ZHGBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YliO1MW1WiPM5ZL54/0SoLWO609Nieck8Z3WL0wnL/E6LezryM5YwlZVjd0VpSqRfLmvrCowHrGWEOPj/uXBinXrHcEVlX4WBlTDPtYRKYXmMb1K4jy9Ex0lCocF0A79l5FTE9MTrOgJRxVNXsnCs4dxwGL/4rVIrwtR76e30Ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Xglk/8tK; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=erQX2qgL; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Xglk/8tK";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="erQX2qgL"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8NWCc4031217;
	Mon, 19 Oct 2026 04:09:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=U5ELud2f7r9Na/XezgJmbhuRoA0DU1dKZVQ45l37b
	7c=; b=Xglk/8tK1fJAOrgeGNU2piNsjwMpiilWPBxzYTQxKDP+IDQ/bLz3pk5e6
	3HUfFYQ6Y6LiaGbk52/nVtoK+/Mc0HhYZeQI92RJvj8tKYKAjboPPDzBShUk5Rjz
	VRlPmf+ogQstRvqIt/YW7mUNXyAPLxfwXiwqOIYUHKOQZU7RAl7XTZMwtbIKc/d7
	Wk7nJ6wHh6efLMrjmR3E23ZGQ4LVqwwCpFoKwEzKb8AXO9LTjgxebrokO9RtfyHl
	RI/V4i2K8+yQ+OIVUGe9ciPd005vshsuTmHu3prwaMp6sORvF5oqePY9S3ZpmvDN
	trsoZf9cFtQO4L1g6673TH5fisb0A==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010031.outbound.protection.outlook.com [52.101.201.31])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hcrd5vv7y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 04:09:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RlbtlQKZPRxD/Qpj8UbWZuVYyyjG+4r168C2eEAHpfGEQu1keyndl3NC6GddMjZdUQB+Oo5217np1RbL21b/8fYEm3dsVD/lawScphU+mGa5aJoAYhHOiKI5hErso1Gi6lAvUiT/dHM3l1FlXc1xRlUVt9nNJlkdQVGuL234MqMqTIa0A3/JD/TzHs2bQDdwmDsSQS7AeLOcHZx8U+Q82Rvb4mFoNiYXF1AtSZg9Leh5iiGgayWXZS/qCx65LfQxVs9OuEsL7BLj5sRXUwu/t0ULgorgqM5Oe+GPSZe8cpyTgQsZ/T1ko1JKX/GL9xTe4WuORSr+Pjgfa1405GNSMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5ELud2f7r9Na/XezgJmbhuRoA0DU1dKZVQ45l37b7c=;
 b=pMd7vrHrD0chs0VWJA7UCzSGNXfUajjnYAbXpQ7RA1wq3T3ayQ9dBNnlqAynOUOnC1PE1CIPjr/PD7dAUaXXk6Fod2ahp3Xe2lLM7ysitQJcSB1OjawMUGHBwUAEN7P7yqyYCKxxv/2TeMfbGNdca5iJcNJk5CBBWa0KEHAe660mvnIiNGaGNE9FY2T6ZoSbltdtEu+P3U5CdxBTireeQo11UzkXAd3/8eshlgndeM90pRC5NeWPr6FAVeoBHl9D6tLpraqF1Up7G9+ykmlCNQuvLm7XoouPxbYw2ZdgrQN+XidtoxBcg0V8FZ4ZGqq2asDxbT8WeAXOURjCL892eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5ELud2f7r9Na/XezgJmbhuRoA0DU1dKZVQ45l37b7c=;
 b=erQX2qgLtNKwnAOoLu81BdVVpBMmLf5cqXAP+Xc6MRXV0BaBr8YRbHDP4jX2CJwXT2UcOZz3MbzZukbXnYRP+cYBWL6/tl3eyMmVrwt5HtJPc0LkdhpZxCIRGQbl/6gYZvzfR7qeINN1Cbx7KVqxpfIL2OgNfCLogZdhyNOJiBw=
Received: from PH5P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::7)
 by DS0PR10MB6799.namprd10.prod.outlook.com (2603:10b6:8:13f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Mon, 19 Oct
 2026 09:08:59 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:510:34a:cafe::2b) by PH5P220CA0006.outlook.office365.com
 (2603:10b6:510:34a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 09:08:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 09:08:58 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 04:08:40 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 04:08:40 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 19 Oct 2026 04:08:40 -0500
Received: from [10.249.144.74] ([10.249.144.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69J98a7d3441174;
	Mon, 19 Oct 2026 04:08:37 -0500
Message-ID: <90a38923-eb18-4245-9fc9-d149c53c7ab8@ti.com>
Date: Mon, 19 Oct 2026 14:38:35 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/22] firmware: ti: ti_sci_pm: Move pm ops into its
 own file
To: Kendall Willis <k-willis@ti.com>
CC: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20260930160607.2674980-1-b-padhi@ti.com>
 <20260930160607.2674980-21-b-padhi@ti.com>
 <20261017133007.cp265f33t4an77g5@uda0506412>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <20261017133007.cp265f33t4an77g5@uda0506412>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|DS0PR10MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: dd50ad6b-1453-410a-ba60-08df2dc09c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|4143699003|13003099007|56012099006|18002099003|22082099003|6133799003|261009221227099003|3023799007|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	Lh3mKh2YCtLzi7y9MErXO3F5Qf4aNjJUK9y04OGbk4k3qK5PcNVnjTCgtQrRlk+s43uplhIR/eXunXeR4FtP+sqQjUv9uWAALTbGyW1ZsDKKYe4/8CO5mZcgPVtQkMPNAiu2pE4kpP8m/MMIq3GgZtgs1LQgmRT9O311yalsc1+7FD0xagN8I8eFh2jduLz00d4KiVHLFtknUWazDgayCD1pc37kaXBcl5jk6QeiA7TgEia2ibK18Ne9SsOLZ+1VqO/hOdk02xfQ694ArxdOQVzxeCk0/3p8actBGx3zJHc1f8klRIiV9wtploUgje7T17k5o9yAT9xvUg8hG7m1TxoS4J8IsAyZFNV0E7baXJtJBpvvLzfZXDyq5S4UibMF58n5v/wza6RosmciSNwfGbS6GqvXKunHmX6vdL8Io66GIdyvDE5zHDtf+fvm0GtOepbBPQQeMR3dXOilMNpYcsqlDNuiGQIHU7EwwL7J6AXeOZhBoSV0HLrCvNfBGy24tgV8BouSoBKjtl9ASd/xjD7AYW0qprlq+NMX8/OVOV62i/smw5yjaAFPiiAKR7dxBBfOEsqcNnlIk7QpGxuNIIuw9bty8A5CEejl7w53ibXafpFNuI33ppk0wXAitaIGYAsC9pBjE9CPZE74I9fWKg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(4143699003)(13003099007)(56012099006)(18002099003)(22082099003)(6133799003)(261009221227099003)(3023799007)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+3jsEkbTVwrM6PfuQerXjg2uLHDFFrS4Ah/dLQITsztolG0dEt8QK8fihqsh3NNEZsWfTcbwjIl99Xsi/n3t2XO6UM/sih9IrKwpwSIN6hX4LOVQNB/VrkSfenNtfI3kWi5ylQEHno8Yx8/8ar/1Miz1FPbbZ2AXO0TTunOwtCiUsoGj3+NEAh17SmOSYOY3OJC1rczqKUPBUjDzJocEQPP287Ri9FgQcFvdoQ7219NxQ4Fc9pkkIken0UqLtwmUFB9vh5N0xVheBPdMbNSur8JtbvBxVBVIcrYrRrf9nmaR7VVz+J9E5+BuSs5nWZFgF/CsIJDnTvavh5rHpvDCjXXqYqJtZUkSRRFu+ess4EjcWmWgvWU1dAa8aAwHVJ/vNrjJvaB03g5meAM/R8gloSZavBKVvrYSHJvj+qX2lhEVNIcr+CSMCnx0Th+ihhKW
X-Exchange-RoutingPolicyChecked:
	IjO0CfRKyKj6VY/au5ycUp2jP8cSceW65m3ihRCYeE26Bj32gbL0makeB9uv9GI62kVkf0cJ20wHlcirE4bj7y4CvlTEeFuiFVfQiN/uM7N01H31Vf5JSuO4ZScZRc3syNxTrpcbL5U3ww+3E9+iHo/sqPrnTNo54ztKefojFxL6Ag9nw8xs2lLTocpNy5+my8VvfGdsypqT06ILFIUtEPbjyAXCiDi3mVZiCOLMsRirr9n0ZJQmZdedq23BTwWNtkRrHMTlaDTnMQFeuvI691t5oICUyzNyXXuhIjd5roAybne6xGsquParkGMGH9/ZPRS0JUn97+vLWC98XpX0iw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 09:08:58.5696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd50ad6b-1453-410a-ba60-08df2dc09c2c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6799
X-Proofpoint-ORIG-GUID: uBdF_jXXKiYFObNaiTECzip1SQOSI2Z7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfXwjRtrj6hbtef
 QsooWrr066Qw+vsUfwyb4m1HVqHHNYlSW51S5YL1wGFcPJOFjy86KFcxOr4vXpKJ7tV/U18kwlx
 ElTfxckmv3MITJYj96NGfUeLkzApQMN/sbNffrml3VL3YKzA2YBd3oxGpTqld/X+Cu7Ju+uRUe7
 LvzMlIytpJLt/w8ltnbVq6JrpwKQgqEKJQA2GMDgubccLT+2j0dXEqXnfeg7CCtEcPop6ZEPiOC
 yIGyvEYl7DeKpBYDmuGiGcPHb6TmtrcJtwhtf8fhfwWAp8KUjNVvrIBwX8GOrAEZju9rUTTi8E2
 jDbIudoCc8Wc22ht59I2rrMc/KyeYaX1un2sx6iPhEnvdNXBeHtPQK7mUMt+vXa2cA4XhkDiGYq
 KD2V90zCFB5Wvhd1SCKjkBi6fV8ZcOucVc89ZvzKVWS+eEQCzQeVEi99I3+hZkmVdJH6d9Sau4S
 gdE5CCt73zssgJnOeTw==
X-Authority-Analysis: v=2.4 cv=ReYFmFtv c=1 sm=1 tr=0 ts=6ad5de30 cx=c_pps
 a=FTqHLmxhk7TnHmysD/QBZQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=ip-_6D5cZfoHW9zwV2kA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: uBdF_jXXKiYFObNaiTECzip1SQOSI2Z7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfXxDJdwMAeQSg2
 WIyNHJUrRZJ4GzGxYFHCy1hYhgJ4tKKA5fd3kMZXp5jaJc8ovdQTaDhRI+mvNGnGleOAa3ekIun
 76EI48kO908PMR2jPrGjXN6+vAobsp0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190036

Hi Kendall,

On 10/17/2026 7:00 PM, Kendall Willis wrote:
> Hi Beleswar,
> On 21:36-20260930, Beleswar Padhi wrote:
>> From: Andrew Davis <afd@ti.com>
>>
>> Extract the power management operations related functions and services
>> from ti_sci_core.c into its own file. This breaks down the single
>> large file into smaller logical files for better readability and
>> maintenance.
>>
>> The pm ops need access to the TI SCI instance to get the device used for
>> error reporting. Move struct ti_sci_xfer, struct ti_sci_xfers_info,
>> struct ti_sci_desc, struct ti_sci_info and handle_to_ti_sci_info() from
>> ti_sci_core.c into ti_sci.h, along with the includes they need, so that
>> they can be shared with the split files. Upcoming splits also need
>> access to the instance state, so this is done once here.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> Would it be possible to add the following LPM related functions to
> ti_sci_pm.c?
>    ti_sci_partial_io_wakeup_enabled
>    ti_sci_prepare_system_suspend


These functions are related to the ti-sci driver's own PM functionality.
The individual refactored files contain ops that are exposed out to
client layers. IMHO, these functions belong in the ti_sci_core.c file.
Let me know what you think.

>
>> ---
>> v2: Changelog:
>> 1. None to this patch.
>>
>> Link to v1:
>> https://lore.kernel.org/all/20260929201746.4078803-21-b-padhi@ti.com/
>>
>>   drivers/firmware/ti/Makefile      |   1 +
>>   drivers/firmware/ti/ti_sci.h      | 100 ++++++++++++++
>>   drivers/firmware/ti/ti_sci_core.c | 220 +-----------------------------
>>   drivers/firmware/ti/ti_sci_pm.c   | 145 ++++++++++++++++++++
>>   4 files changed, 247 insertions(+), 219 deletions(-)
>>   create mode 100644 drivers/firmware/ti/ti_sci_pm.c
>>
>> diff --git a/drivers/firmware/ti/Makefile b/drivers/firmware/ti/Makefile
>> index c4233542ad57d..bbfe73587a3c7 100644
>> --- a/drivers/firmware/ti/Makefile
>> +++ b/drivers/firmware/ti/Makefile
>> @@ -3,4 +3,5 @@
>>   ti_sci-y			:= ti_sci_core.o
>>   ti_sci-y			+= ti_sci_clock.o
>>   ti_sci-y			+= ti_sci_device.o
>> +ti_sci-y			+= ti_sci_pm.o
>>   obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
>> diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
>> index cce59cac35ed6..7a707c632276e 100644
>> --- a/drivers/firmware/ti/ti_sci.h
>> +++ b/drivers/firmware/ti/ti_sci.h
>> @@ -13,8 +13,107 @@
>>   #define __TI_SCI_H
>>   
>>   #include <linux/compiler_types.h>
>> +#include <linux/completion.h>
>> +#include <linux/container_of.h>
>> +#include <linux/hashtable.h>
>> +#include <linux/mailbox_client.h>
>> +#include <linux/mutex.h>
>> +#include <linux/semaphore.h>
>> +#include <linux/soc/ti/ti-msgmgr.h>
>> +#include <linux/soc/ti/ti_sci_protocol.h>
>> +#include <linux/spinlock.h>
>>   #include <linux/types.h>
>>   
>> +/**
>> + * struct ti_sci_xfer - Structure representing a message flow
>> + * @tx_message:	Transmit message
>> + * @rx_buf:	Pointer to store received message
>> + * @rx_len:	Receive message length
>> + * @done:	completion event
>> + */
>> +struct ti_sci_xfer {
>> +	struct ti_msgmgr_message tx_message;
>> +	void *rx_buf;
>> +	u8 rx_len;
>> +	struct completion done;
>> +};
>> +
>> +/**
>> + * struct ti_sci_xfers_info - Structure to manage transfer information
>> + * @sem_xfer_count:	Counting Semaphore for managing max simultaneous
>> + *			Messages.
>> + * @xfer_block:		Preallocated Message array
>> + * @xfer_alloc_table:	Bitmap table for allocated messages.
>> + *			Index of this bitmap table is also used for message
>> + *			sequence identifier.
>> + * @xfer_lock:		Protection for message allocation
>> + */
>> +struct ti_sci_xfers_info {
>> +	struct semaphore sem_xfer_count;
>> +	struct ti_sci_xfer *xfer_block;
>> +	unsigned long *xfer_alloc_table;
>> +	/* protect transfer allocation */
>> +	spinlock_t xfer_lock;
>> +};
>> +
>> +/**
>> + * struct ti_sci_desc - Description of SoC integration
>> + * @default_host_id:	Host identifier representing the compute entity
>> + * @max_rx_timeout_ms:	Timeout for communication with SoC (in Milliseconds)
>> + * @max_msgs: Maximum number of messages that can be pending
>> + *		  simultaneously in the system
>> + * @max_msg_size: Maximum size of data per message that can be handled.
>> + */
>> +struct ti_sci_desc {
>> +	u8 default_host_id;
>> +	int max_rx_timeout_ms;
>> +	int max_msgs;
>> +	int max_msg_size;
>> +};
>> +
>> +/**
>> + * struct ti_sci_info - Structure representing a TI SCI instance
>> + * @dev:	Device pointer
>> + * @desc:	SoC description for this instance
>> + * @d:		Debugfs file entry
>> + * @debug_region: Memory region where the debug message are available
>> + * @debug_region_size: Debug region size
>> + * @debug_buffer: Buffer allocated to copy debug messages.
>> + * @handle:	Instance of TI SCI handle to send to clients.
>> + * @cl:		Mailbox Client
>> + * @chan_tx:	Transmit mailbox channel
>> + * @chan_rx:	Receive mailbox channel
>> + * @minfo:	Message info
>> + * @node:	list head
>> + * @irqs:	List of allocated irqs
>> + * @irq_lock:	Protection for irq hash list
>> + * @host_id:	Host ID
>> + * @fw_caps:	FW/SoC low power capabilities
>> + * @users:	Number of users of this instance
>> + */
>> +struct ti_sci_info {
>> +	struct device *dev;
>> +	const struct ti_sci_desc *desc;
>> +	struct dentry *d;
>> +	void __iomem *debug_region;
>> +	char *debug_buffer;
>> +	size_t debug_region_size;
>> +	struct ti_sci_handle handle;
>> +	struct mbox_client cl;
>> +	struct mbox_chan *chan_tx;
>> +	struct mbox_chan *chan_rx;
>> +	struct ti_sci_xfers_info minfo;
>> +	struct list_head node;
>> +	DECLARE_HASHTABLE(irqs, 8);
>> +	struct mutex irq_lock;
>> +	u8 host_id;
>> +	u64 fw_caps;
>> +	/* protected by ti_sci_list_mutex */
>> +	int users;
>> +};
>> +
>> +#define handle_to_ti_sci_info(h) container_of(h, struct ti_sci_info, handle)
>> +
>>   /* Generic Messages */
>>   #define TI_SCI_MSG_ENABLE_WDT	0x0000
>>   #define TI_SCI_MSG_WAKE_RESET	0x0001
>> @@ -1567,5 +1666,6 @@ int ti_sci_do_xfer(const struct ti_sci_handle *handle,
>>   
>>   void ti_sci_setup_device_ops(struct ti_sci_dev_ops *dops);
>>   void ti_sci_setup_clock_ops(struct ti_sci_clk_ops *cops);
>> +void ti_sci_setup_pm_ops(struct ti_sci_pm_ops *pmops);
>>   
>>   #endif /* __TI_SCI_H */
>> diff --git a/drivers/firmware/ti/ti_sci_core.c b/drivers/firmware/ti/ti_sci_core.c
>> index 848c040f598e0..60d0d64ac4ae8 100644
>> --- a/drivers/firmware/ti/ti_sci_core.c
>> +++ b/drivers/firmware/ti/ti_sci_core.c
>> @@ -13,11 +13,9 @@
>>   #include <linux/cpu.h>
>>   #include <linux/debugfs.h>
>>   #include <linux/export.h>
>> -#include <linux/hashtable.h>
>>   #include <linux/io.h>
>>   #include <linux/iopoll.h>
>>   #include <linux/kernel.h>
>> -#include <linux/mailbox_client.h>
>>   #include <linux/module.h>
>>   #include <linux/mutex.h>
>>   #include <linux/of.h>
>> @@ -25,10 +23,7 @@
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_qos.h>
>>   #include <linux/property.h>
>> -#include <linux/semaphore.h>
>>   #include <linux/slab.h>
>> -#include <linux/soc/ti/ti-msgmgr.h>
>> -#include <linux/soc/ti/ti_sci_protocol.h>
>>   #include <linux/suspend.h>
>>   #include <linux/sys_soc.h>
>>   #include <linux/reboot.h>
>> @@ -40,53 +35,6 @@ static LIST_HEAD(ti_sci_list);
>>   /* Protection for the entire list */
>>   static DEFINE_MUTEX(ti_sci_list_mutex);
>>   
>> -/**
>> - * struct ti_sci_xfer - Structure representing a message flow
>> - * @tx_message:	Transmit message
>> - * @rx_buf:	Pointer to store received message
>> - * @rx_len:	Receive message length
>> - * @done:	completion event
>> - */
>> -struct ti_sci_xfer {
>> -	struct ti_msgmgr_message tx_message;
>> -	void *rx_buf;
>> -	u8 rx_len;
>> -	struct completion done;
>> -};
>> -
>> -/**
>> - * struct ti_sci_xfers_info - Structure to manage transfer information
>> - * @sem_xfer_count:	Counting Semaphore for managing max simultaneous
>> - *			Messages.
>> - * @xfer_block:		Preallocated Message array
>> - * @xfer_alloc_table:	Bitmap table for allocated messages.
>> - *			Index of this bitmap table is also used for message
>> - *			sequence identifier.
>> - * @xfer_lock:		Protection for message allocation
>> - */
>> -struct ti_sci_xfers_info {
>> -	struct semaphore sem_xfer_count;
>> -	struct ti_sci_xfer *xfer_block;
>> -	unsigned long *xfer_alloc_table;
>> -	/* protect transfer allocation */
>> -	spinlock_t xfer_lock;
>> -};
>> -
>> -/**
>> - * struct ti_sci_desc - Description of SoC integration
>> - * @default_host_id:	Host identifier representing the compute entity
>> - * @max_rx_timeout_ms:	Timeout for communication with SoC (in Milliseconds)
>> - * @max_msgs: Maximum number of messages that can be pending
>> - *		  simultaneously in the system
>> - * @max_msg_size: Maximum size of data per message that can be handled.
>> - */
>> -struct ti_sci_desc {
>> -	u8 default_host_id;
>> -	int max_rx_timeout_ms;
>> -	int max_msgs;
>> -	int max_msg_size;
>> -};
>> -
>>   /**
>>    * struct ti_sci_irq - Description of allocated irqs
>>    * @node: Link to hash table
>> @@ -97,49 +45,7 @@ struct ti_sci_irq {
>>   	struct ti_sci_msg_req_manage_irq desc;
>>   };
>>   
>> -/**
>> - * struct ti_sci_info - Structure representing a TI SCI instance
>> - * @dev:	Device pointer
>> - * @desc:	SoC description for this instance
>> - * @d:		Debugfs file entry
>> - * @debug_region: Memory region where the debug message are available
>> - * @debug_region_size: Debug region size
>> - * @debug_buffer: Buffer allocated to copy debug messages.
>> - * @handle:	Instance of TI SCI handle to send to clients.
>> - * @cl:		Mailbox Client
>> - * @chan_tx:	Transmit mailbox channel
>> - * @chan_rx:	Receive mailbox channel
>> - * @minfo:	Message info
>> - * @node:	list head
>> - * @irqs:	List of allocated irqs
>> - * @irq_lock:	Protection for irq hash list
>> - * @host_id:	Host ID
>> - * @fw_caps:	FW/SoC low power capabilities
>> - * @users:	Number of users of this instance
>> - */
>> -struct ti_sci_info {
>> -	struct device *dev;
>> -	const struct ti_sci_desc *desc;
>> -	struct dentry *d;
>> -	void __iomem *debug_region;
>> -	char *debug_buffer;
>> -	size_t debug_region_size;
>> -	struct ti_sci_handle handle;
>> -	struct mbox_client cl;
>> -	struct mbox_chan *chan_tx;
>> -	struct mbox_chan *chan_rx;
>> -	struct ti_sci_xfers_info minfo;
>> -	struct list_head node;
>> -	DECLARE_HASHTABLE(irqs, 8);
>> -	struct mutex irq_lock;
>> -	u8 host_id;
>> -	u64 fw_caps;
>> -	/* protected by ti_sci_list_mutex */
>> -	int users;
>> -};
>> -
>>   #define cl_to_ti_sci_info(c)	container_of(c, struct ti_sci_info, cl)
>> -#define handle_to_ti_sci_info(h) container_of(h, struct ti_sci_info, handle)
>>   
>>   #ifdef CONFIG_DEBUG_FS
>>   
>> @@ -687,128 +593,6 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
>>   	return 0;
>>   }
>>   
>> -/**
>> - * ti_sci_msg_cmd_lpm_wake_reason() - Get the wakeup source from LPM
>> - * @handle:		Pointer to TI SCI handle
>> - * @source:		The wakeup source that woke the SoC from LPM
>> - * @timestamp:		Timestamp of the wakeup event
>> - * @pin:		The pin that has triggered wake up
>> - * @mode:		The last entered low power mode
>> - *
>> - * Return: 0 if all went well, else returns appropriate error value.
>> - */
>> -static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
>> -					  u32 *source, u64 *timestamp, u8 *pin, u8 *mode)
>> -{
>> -	struct ti_sci_msg_hdr req;
>> -	struct ti_sci_msg_resp_lpm_wake_reason resp;
>> -	struct device *dev;
>> -	int ret = 0;
>> -
>> -	if (IS_ERR(handle))
>> -		return PTR_ERR(handle);
>> -	if (!handle)
>> -		return -EINVAL;
>> -
>> -	dev = handle_to_ti_sci_info(handle)->dev;
>> -
>> -	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_WAKE_REASON,
>> -			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
>> -			     &req, sizeof(req),
>> -			     &resp, sizeof(resp));
>> -	if (ret) {
>> -		dev_err(dev, "Failed to get wake reason\n");
>> -		return ret;
>> -	}
>> -
>> -	if (source)
>> -		*source = resp.wake_source;
>> -	if (timestamp)
>> -		*timestamp = resp.wake_timestamp;
>> -	if (pin)
>> -		*pin = resp.wake_pin;
>> -	if (mode)
>> -		*mode = resp.mode;
>> -
>> -	return 0;
>> -}
>> -
>> -/**
>> - * ti_sci_cmd_set_device_constraint() - Set LPM constraint on behalf of a device
>> - * @handle:	pointer to TI SCI handle
>> - * @id:	Device identifier
>> - * @state:	The desired state of device constraint: set or clear
>> - *
>> - * Return: 0 if all went well, else returns appropriate error value.
>> - */
>> -static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
>> -					    u32 id, u8 state)
>> -{
>> -	struct ti_sci_msg_req_lpm_set_device_constraint req;
>> -	struct ti_sci_msg_hdr resp;
>> -	struct device *dev;
>> -	int ret = 0;
>> -
>> -	if (IS_ERR(handle))
>> -		return PTR_ERR(handle);
>> -	if (!handle)
>> -		return -EINVAL;
>> -
>> -	dev = handle_to_ti_sci_info(handle)->dev;
>> -
>> -	req.id = id;
>> -	req.state = state;
>> -
>> -	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
>> -			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
>> -			     &req, sizeof(req),
>> -			     &resp, sizeof(resp));
>> -	if (ret) {
>> -		dev_err(dev, "Failed to set device constraint\n");
>> -		return ret;
>> -	}
>> -
>> -	return 0;
>> -}
>> -
>> -/**
>> - * ti_sci_cmd_set_latency_constraint() - Set LPM resume latency constraint
>> - * @handle:	pointer to TI SCI handle
>> - * @latency:	maximum acceptable latency (in ms) to wake up from LPM
>> - * @state:	The desired state of latency constraint: set or clear
>> - *
>> - * Return: 0 if all went well, else returns appropriate error value.
>> - */
>> -static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
>> -					     u16 latency, u8 state)
>> -{
>> -	struct ti_sci_msg_req_lpm_set_latency_constraint req;
>> -	struct ti_sci_msg_hdr resp;
>> -	struct device *dev;
>> -	int ret = 0;
>> -
>> -	if (IS_ERR(handle))
>> -		return PTR_ERR(handle);
>> -	if (!handle)
>> -		return -EINVAL;
>> -
>> -	dev = handle_to_ti_sci_info(handle)->dev;
>> -
>> -	req.latency = latency;
>> -	req.state = state;
>> -
>> -	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
>> -			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
>> -			     &req, sizeof(req),
>> -			     &resp, sizeof(resp));
>> -	if (ret) {
>> -		dev_err(dev, "Failed to set device constraint\n");
>> -		return ret;
>> -	}
>> -
>> -	return 0;
>> -}
>> -
>>   /**
>>    * ti_sci_cmd_lpm_abort() - Abort entry to LPM by clearing selection of LPM to enter
>>    * @dev:	Device pointer corresponding to the SCI entity
>> @@ -1708,9 +1492,7 @@ static void ti_sci_setup_ops(struct ti_sci_info *info)
>>   
>>   	if (info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED) {
>>   		pr_debug("detected DM managed LPM in fw_caps\n");
>> -		pmops->lpm_wake_reason = ti_sci_msg_cmd_lpm_wake_reason;
>> -		pmops->set_device_constraint = ti_sci_cmd_set_device_constraint;
>> -		pmops->set_latency_constraint = ti_sci_cmd_set_latency_constraint;
>> +		ti_sci_setup_pm_ops(pmops);
>>   	}
>>   
>>   	rm_core_ops->get_range = ti_sci_cmd_get_resource_range;
>> diff --git a/drivers/firmware/ti/ti_sci_pm.c b/drivers/firmware/ti/ti_sci_pm.c
>> new file mode 100644
>> index 0000000000000..6ea09a7e342e7
>> --- /dev/null
>> +++ b/drivers/firmware/ti/ti_sci_pm.c
>> @@ -0,0 +1,145 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Texas Instruments System Control Interface Protocol Driver
>> + *
>> + * Copyright (C) 2015-2026 Texas Instruments Incorporated - https://www.ti.com/
>> + *	Nishanth Menon
>> + */
>> +
>> +#include <linux/errno.h>
>> +#include <linux/soc/ti/ti_sci_protocol.h>
>> +
>> +#include "ti_sci.h"
>> +
>> +/**
>> + * ti_sci_msg_cmd_lpm_wake_reason() - Get the wakeup source from LPM
>> + * @handle:		Pointer to TI SCI handle
>> + * @source:		The wakeup source that woke the SoC from LPM
>> + * @timestamp:		Timestamp of the wakeup event
>> + * @pin:		The pin that has triggered wake up
>> + * @mode:		The last entered low power mode
>> + *
>> + * Return: 0 if all went well, else returns appropriate error value.
>> + */
>> +static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
>> +					  u32 *source, u64 *timestamp, u8 *pin, u8 *mode)
>> +{
>> +	struct ti_sci_msg_hdr req;
>> +	struct ti_sci_msg_resp_lpm_wake_reason resp;
>> +	struct device *dev;
>> +	int ret = 0;
>> +
>> +	if (IS_ERR(handle))
>> +		return PTR_ERR(handle);
>> +	if (!handle)
>> +		return -EINVAL;
>> +
>> +	dev = handle_to_ti_sci_info(handle)->dev;
>> +
>> +	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_WAKE_REASON,
>> +			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
>> +			     &req, sizeof(req),
>> +			     &resp, sizeof(resp));
>> +	if (ret) {
>> +		dev_err(dev, "Failed to get wake reason\n");
>> +		return ret;
>> +	}
>> +
>> +	if (source)
>> +		*source = resp.wake_source;
>> +	if (timestamp)
>> +		*timestamp = resp.wake_timestamp;
>> +	if (pin)
>> +		*pin = resp.wake_pin;
>> +	if (mode)
>> +		*mode = resp.mode;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * ti_sci_cmd_set_device_constraint() - Set LPM constraint on behalf of a device
>> + * @handle:	pointer to TI SCI handle
>> + * @id:	Device identifier
>> + * @state:	The desired state of device constraint: set or clear
>> + *
>> + * Return: 0 if all went well, else returns appropriate error value.
>> + */
>> +static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
>> +					    u32 id, u8 state)
>> +{
>> +	struct ti_sci_msg_req_lpm_set_device_constraint req;
>> +	struct ti_sci_msg_hdr resp;
>> +	struct device *dev;
>> +	int ret = 0;
>> +
>> +	if (IS_ERR(handle))
>> +		return PTR_ERR(handle);
>> +	if (!handle)
>> +		return -EINVAL;
>> +
>> +	dev = handle_to_ti_sci_info(handle)->dev;
>> +
>> +	req.id = id;
>> +	req.state = state;
>> +
>> +	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
>> +			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
>> +			     &req, sizeof(req),
>> +			     &resp, sizeof(resp));
>> +	if (ret) {
>> +		dev_err(dev, "Failed to set device constraint\n");
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * ti_sci_cmd_set_latency_constraint() - Set LPM resume latency constraint
>> + * @handle:	pointer to TI SCI handle
>> + * @latency:	maximum acceptable latency (in ms) to wake up from LPM
>> + * @state:	The desired state of latency constraint: set or clear
>> + *
>> + * Return: 0 if all went well, else returns appropriate error value.
>> + */
>> +static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
>> +					     u16 latency, u8 state)
>> +{
>> +	struct ti_sci_msg_req_lpm_set_latency_constraint req;
>> +	struct ti_sci_msg_hdr resp;
>> +	struct device *dev;
>> +	int ret = 0;
>> +
>> +	if (IS_ERR(handle))
>> +		return PTR_ERR(handle);
>> +	if (!handle)
>> +		return -EINVAL;
>> +
>> +	dev = handle_to_ti_sci_info(handle)->dev;
>> +
>> +	req.latency = latency;
>> +	req.state = state;
>> +
>> +	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
>> +			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
>> +			     &req, sizeof(req),
>> +			     &resp, sizeof(resp));
>> +	if (ret) {
>> +		dev_err(dev, "Failed to set device constraint\n");
> Could you correct this line to:
>
>    if (ret) {
>               dev_err(dev, "Failed to set latency constraint\n");


Sure, will fix this in revision.

Thanks,
Beleswar

>
> Best,
> Kendall
>
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * ti_sci_setup_pm_ops() - Setup the pm operations structures
>> + * @pmops:	pointer to TISCI pm ops structure
>> + */
>> +void ti_sci_setup_pm_ops(struct ti_sci_pm_ops *pmops)
>> +{
>> +	pmops->lpm_wake_reason = ti_sci_msg_cmd_lpm_wake_reason;
>> +	pmops->set_device_constraint = ti_sci_cmd_set_device_constraint;
>> +	pmops->set_latency_constraint = ti_sci_cmd_set_latency_constraint;
>> +}
>> -- 
>> 2.34.1
>>
>>
