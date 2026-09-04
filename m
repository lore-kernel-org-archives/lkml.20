Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9B440B0EF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788541972; cv=fail; b=gGSMTHm6+nT4uTAGoV87xBnefKcfJHy6MpzvPz8h1gVhTflYbburJvnQaS7FIkh8BVhHRW8/0lS6lt3sT3LfFYIoB3PdQv5Wohqa5dik9xIIG0YRi0PYQLmsHAWe6sI4ZDh2e4xjgk3DFGmB7Nj62UQb3g3Qx3PekEBwbNoEJYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788541972; c=relaxed/simple;
	bh=/CfG4OS/5l5/9afRbiWbWIo4vbtDBbw09XtSZHUywSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HPi/Hjk9kBU00HDejAyzQrnR8tFFCKLO4WeScMhmffRLzLz1Smd31xGjDMzH+C/uFQYho0jwyW48VaS/LmbEsal9ipCXO5L84mvE5iuTbyF/BOsRnoJzM7JNoLLLVvkNoWq3b+39iJ4fXuRYY9NbMI2w0vpZejirkotPK/4ejXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Me4NqPuY; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZNEd2oAt; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Me4NqPuY";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZNEd2oAt"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 684FtnHh4122612;
	Fri, 4 Sep 2026 12:12:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=b20DmFLSy2dho8wun3sjj4rcsZFLZm9VTlnH1rWCx
	/4=; b=Me4NqPuYLoeMLhPjg8dTVcTv3qGCnuXYOcKH+4mMgUfDa+Hw4s94g3d2Q
	hMoiC9oyvT+oQcS6r+5E8gEC0sSFWvoX3qEYmCQrX+52889WyfaGLmLr7B6mmRJd
	QZ96bRTNzsdK5nwcP5kymKem4bjX9yxUhVWEnlG2BfS/GNjunqopplAp04PMMy0E
	KFS3qsa7cGTKP+NB9DlKqnukYIko1A0oTTV4zgEDrzVyjOjf8t2pRM0TOFdVLi53
	myhC004E12Fb+wBGGpDT+dCLaXI7ydvyrwQ57tpwUPBqqIzL5mJ0DIEql1NMl/Sc
	EehRsvpXIZegAAUxkRsaeNp4C6eeQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010056.outbound.protection.outlook.com [52.101.85.56])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gg02ss4va-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 12:12:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPpYH8RN4X2g62UVI4jv8arc6Yyc/sqJ7PkyET2LaJyoyWCRaK3kYIuYynleLLQ34Lexp5Eui7+mpJ75X1bCAb6ZviEotrC7KJ5SNeq6BlE1Vfh70cspncJEMKE6uXeOTBfJmh+mVM/zwPl/4g4kE3hee5Kq1e16Ywm1Pt9SxkmuAfiAmM5189YUA9dUCvNiydZ7jAqNB5ay5C4FKAWtOpA9ef+vwyS2G1d0irArAQS9W87rMKcv9xCV1DW4UcmlJsa/ct9sSLeS3F2cFnMTJ+7HVDHLe6i3IzSkKWjndiOFB1diVZVDSJ7a28A3Fylfe+RwRj1yQbVvn3K/ZFRLVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b20DmFLSy2dho8wun3sjj4rcsZFLZm9VTlnH1rWCx/4=;
 b=RdCvQeHCE7so1ZwD/HHlbcaVpKV2OWswDAmNuOfN2Fi05jhl618Mwp+DChnuHc2e7Re7EBw/FY3+Y1F/ePAuCf4h6V5GEcQq+odxpSu9NTBfoyeceI1s0/8VqitcQCDmPOQ5TzjHdc0NEreZSXi0rTY5WWiZ+mzF1YDO4uJQBjaZPyqCc6emkqI5oeO/KuZWKfjgcXL+sWFdEb92+JuiUGUxnMyJcnymtu4DT1RntWmHYUJLKm6hEO+BNr/krDyMeBiHM/cWykJ0K56DUGDlRm9FIJR+UWf60ygdYgG7Yy0mY/aJrz1Nhkifv2VgX1K40sr9/UQ/yv/CzN58ouIxKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b20DmFLSy2dho8wun3sjj4rcsZFLZm9VTlnH1rWCx/4=;
 b=ZNEd2oAtiepwgN5WRlFyYKeHBdKx9Srmqcn+A3+s+mdFq/9n5henukqENHoanrAUirpsb8Rny6HaCnbpL+5QX3vfDUFusjN9trlfPEHaOmvSr9692WlpanpwQourTJBUOQfRGtSEJa6g82jpoXxlHjyIr+gna31Pm4SamCDHJbk=
Received: from DSSP221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:3d5::15) by
 SN7PR10MB6523.namprd10.prod.outlook.com (2603:10b6:806:2a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 17:12:35 +0000
Received: from DS2PEPF000061C3.namprd02.prod.outlook.com
 (2603:10b6:8:3d5:cafe::50) by DSSP221CA0003.outlook.office365.com
 (2603:10b6:8:3d5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Fri, 4
 Sep 2026 17:12:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF000061C3.mail.protection.outlook.com (10.167.23.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 17:12:34 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 12:11:49 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 12:11:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 4 Sep 2026 12:11:49 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 684HBjad708060;
	Fri, 4 Sep 2026 12:11:46 -0500
Message-ID: <29fa126d-c552-474c-a4eb-ca2caf90a314@ti.com>
Date: Fri, 4 Sep 2026 22:41:45 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: fix typo "upto" in comments
To: Hemanth Selam <hemanth.selam@gmail.com>, Nishanth Menon <nm@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <u-kumar1@ti.com>
References: <20260904123541.38602-1-hemanth.selam@gmail.com>
 <20260904123541.38602-2-hemanth.selam@gmail.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260904123541.38602-2-hemanth.selam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C3:EE_|SN7PR10MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: 68bf2e0f-d6ac-4c0f-4212-08df0aa7b638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|10067099003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	snHaovmL26ab/5+vRZLr+Xn1clKmHY5gz2g5gMsn1cHN7VdIX9dDTBnk6ZCEp4CkBWhX78ftRS+fNi68FOkFStexB+xigxwzxGgdnWpWpq7BtkQreEp7fCN09df3whCrWEg001tH0wBUUWOHvw3RH5SaDnYK58Po6hMR8Uwx+IHr6ZVVY4mszDUaY5CCzslXoNXyjvorM/iwLpQtv49NLwtmIdcIzdrZH93OYcTTpNnTbJrEb6k6Dy5R1HJ1+fJDebHgN8jBeiswtj2j3Pl4uoH8DTWbzLKcVU/Ua2iXZK6V7uWSnk9MDjYGQ9u5gJ8ju5jGhWWC6bXbtBu52ID4A0EBkLQJvSw+Qkww1JoZys989ihePW2VjkWG+aKzadJMFhkPfWkfJg5W/hILm1lH9uX4mnlBHOD/M9NKg0HNMftkcl+X876qi9/EhWDTUeAqNOZ/YdWsS8KZ249S4QDCF915sHg5GmtYrqtSb6vpm6Rk7gJRHErt5wkkz9baSf43FXnyMv2FI4QqW76aGSBvtU9pCgC0gk1vXHs7WuwBRw9w50F9TTJ3kXXjZgaRkDKnZI45d5U3AvD5ttEfAss+fIO49ZUMcuFUEbJ+J598vYQ5jeOHUusinryV6+wY3FOEDPyrop9P82rw9mh4WHAHfdF/Cu2T83NsPn/SUZSnEPvn7UnmM+pWguYQVofjX3UkogiejHk33TWJKFpUw5towQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZFIYZl1SRndzEe5ahJKmRbUu4AdTrsoFjy58vhAhM/IZiZz3PXkxQ7qI9JZzGcAxe4HmkzYaybM3rvUxiBdXrUZa5LACflvLWW4WLfZU6b05a7pS3qfrpuCwaVlz7Za9aD51KyVDUzrt0thTyBaNkHSYN0OqjFRLjIQB2kkL7ruTYqMhbaRhZIjGF01cK12Zqkj2eoArepslCq9wziEgcQmhgb6oQBtw710jXaILuzLpSpHcBbP62fjuLDSaFpcRw5Cqu1KBzL/wp3LQeSm1hcpvM8S504bxxZXyTkHNMxoP2omFQcw1BBeO2EdBHM3zmaf7Itia3MtS5OFb+ThT0mN1ufGfui925SZws/DNOQqoWRh7qTA88mkGkXyUHcas7j2JA2kzMaFPUTbbDLsTpiTg+ZlJEZxAbhjC7RZfJU5gkrAetcts1qgwZbNF7wku
X-Exchange-RoutingPolicyChecked:
	yXkVcvHHSgNhtmqmRefb8hKv10lluOhXF0Dz5IRw8em9gwfD4GZW8+G4myD5HUkIJ0TI/ERkK+ty8ccC6BYE1rGfFfdw842UukA2UFzJotMjltjs7OMWQZJU0OE+3cC5ZhnPM5+qiyHjn6aH+J89R4WeqzvjtElxlShih4wb+i11PyXa0M7deXJezMag7BiAbM7cmhuXhF1PhjgAsSYs1qB8LD+OQhk85rEQMEwK9J779A+34l0Ps4QYM531SlDWph+0yNtkxkWWFoj2KyTpR/iXI0PqeUsJMOmyw/VQVY/CJoQ0RPiglXtn4InbjyQJFdo8IxEuSNncGRIl1igIyQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 17:12:34.2104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68bf2e0f-d6ac-4c0f-4212-08df0aa7b638
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6523
X-Proofpoint-GUID: aPBUeJtT7omt4TxSOGq0BKW5_DE2cftx
X-Authority-Analysis: v=2.4 cv=GZMnWwXL c=1 sm=1 tr=0 ts=6a9afc0e cx=c_pps
 a=CnS1ju6qDdjTg6bRefQovg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=pGLkceISAAAA:8 a=EQ-5LGPcNAopaVPEhAIA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE1NiBTYWx0ZWRfXymXgCO8FLwpW
 mRgOQdx/y3GR6i+uS3DsNq1MEfzCW3tVNoWRS4IvyX9jdIwpQPoL9ZEwNV3hEED/SGZx0cajurf
 bvwmDcgLsb73jeOc4vGxAfos7XZ6nA0=
X-Proofpoint-ORIG-GUID: aPBUeJtT7omt4TxSOGq0BKW5_DE2cftx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE1NiBTYWx0ZWRfXx6MvVKEdvTIe
 2aAAW0FbNSa0zi1HmYktrLKOwLN9r/o+PwD686DWpSh+nJbgitcz/A+tQIdaavizbR7V/muOnsg
 P9IB6hjGuR6A+JUJTcCjhmZpQgC7ZNhunQTKz/4ZyOW9ZEPSA9SI0IZRdQeTAgY/jsAixChDmfe
 dUF4iVc01mHp/GPqdoHHQa36Rtfv71ZWAhYHLKbLuxvu7RUaw/vBc5VwkixcYmYFWX8IsDOUr/i
 tHQO6aJMMzxpaef/zCYot/h7TCNwmtC0FqDOUXLepUKTP/73B/FRzGFKTpOxVD+sprDnxry59GN
 6wBZhmSAfcMuor+ib7Yg+JuPPUvP4SD6acYhU1CrA/bX9f1BPJMWuwZaCKY0uDtfIdTPUIph3ix
 haTnRKcqryrgw22qtP+yPZBL+vaXu64fPpx0FzMCeFx4LxpNbZnMECi6wJqmLZVvgCT0O3MZwf6
 BipkpbE/VCax6x72MGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040156



On 9/4/2026 6:05 PM, Hemanth Selam wrote:
> Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 

Please fix subject line of patch

see rest of contributions
git log drivers/firmware/ti_sci.c

> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/firmware/ti_sci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index cc747ab0237f..94104edba9a0 100644
> --- a/drivers/firmware/ti_sci.c
> +++ b/drivers/firmware/ti_sci.c
> @@ -4050,7 +4050,7 @@ static const struct ti_sci_desc ti_sci_pmmc_k2g_desc = {
>  	.default_host_id = 2,
>  	/* Conservative duration */
>  	.max_rx_timeout_ms = 1000,
> -	/* Limited by MBOX_TX_QUEUE_LEN. K2G can handle upto 128 messages! */
> +	/* Limited by MBOX_TX_QUEUE_LEN. K2G can handle up to 128 messages! */
>  	.max_msgs = 20,
>  	.max_msg_size = 64,
>  };
> @@ -4060,7 +4060,7 @@ static const struct ti_sci_desc ti_sci_pmmc_am654_desc = {
>  	.default_host_id = 12,
>  	/* Conservative duration */
>  	.max_rx_timeout_ms = 10000,
> -	/* Limited by MBOX_TX_QUEUE_LEN. K2G can handle upto 128 messages! */
> +	/* Limited by MBOX_TX_QUEUE_LEN. K2G can handle up to 128 messages! */
>  	.max_msgs = 20,
>  	.max_msg_size = 60,
>  };

