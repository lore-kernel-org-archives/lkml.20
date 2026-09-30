Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97D636654C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790741674; cv=fail; b=YDSXvNYrDo3Wy2OjGwqrmlXK+GprN4fkHG1wzNetaK5ugKs0E+uJ79wP8NXQ40ls+a3fC6O9ePaE021uXRnO8wP1S9evvVcdi+qgFZY+2Z1Ng4lhdDE8dGPd8LW45d9BU8soD0SL265ZorH8CkDyJ5brA6kBqmxiib7LHlQfuxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790741674; c=relaxed/simple;
	bh=AeSCAKHQdjmspbtmTQZXtGl+UVJwOzM8jR228kU52dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hJ33jJzIOiVim4wPuQ3pf5/hcU4aIhlwk0ojYZxmasFcLFXe+sAZZEnWOhzHky/SSN5IyfsopUBbEG59wDTn8eX8eYZc+QcocOYeGhJzDbXa91azLHkNLx97kuegqq6QslYt1Dnac+EhC0bgOX4ZRUHe+ughUjyUe8b8BYcGoZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=aV60MkAb; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=BEfHDkd8; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="aV60MkAb";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="BEfHDkd8"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TNTlWl1841587;
	Tue, 29 Sep 2026 23:14:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=3jz5SB/qxgK3x5XwNfa+vEi+HS26LjTvZImo8H9dk
	Kk=; b=aV60MkAbAGWM5UNbGE3svdiHjEWVlWpaOo/NbYqhw19n3jxcCr+nfB4ui
	omM38md2P7+4WY35t9C8mAuamX3E7ppETqmZ/6hulumeEPRd8rSlxT0Q392//qjh
	neveL1TbD0aJzV7G1luAGwaOmxIYHswp+mNaIQWAyhrPQ1eyL+TfSFmAlUyJb+3x
	zbx2YbVY7jqxqKEiirHplkvT/cinWFKpaBuwusIsNMuVVYBcsvyrK0xBiaiw2/Ka
	Qm0kqlsg80Co9HpAOprWogqLYJ+abWRNSHh2OlvjXpbruPcw+aGOiwXKj8Ztnqu7
	xnaQckWo9QE8ydHTsZNsXC1fmnfYg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013051.outbound.protection.outlook.com [40.93.196.51])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0cpc5rt7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 23:14:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKUecfGfy7iauDbmveX1mGRCGP91/isq6YauT5cPizzezw+9v46JxHSxcRHe04u8a+JWixTCb2UJXe1RI/ZIUZbO+/Lb34zWyxzfzF1PdUt31sVrzSKJty9xWTn08v2qnFJitFgFfTnYcB7jtCHWNwxj8EbkxQwBFEIZ5hYvfbjpdjxF0y6lRNhqbQcWhMc/vs67a1bXsl+V1GXnfkqTG7xObcAbxnXlRIip3LzEBWvJYibltgiUvQn00Le2dB1fvdzcr5xR3jrxLCDcEC7AMJv2Ik+VXW+jx7xtB8Vr7/tb19lDcZjp42dhjoAp32al1ikjPoSY3uFr/uDYRK1tyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jz5SB/qxgK3x5XwNfa+vEi+HS26LjTvZImo8H9dkKk=;
 b=P0wk/py55HXez1hU0dbF4rGljs/kfqd9WCFyBs7Eg+HJraZNysFeUtUN7DhhfT+PfKgFG6+1rZD5+plNzdlaYgy85BRU6VTQX5lnThLpgxs0ikGr2HajLi+6Xe9Wv8cbgXpdmc9kdB2feM1Q6uy1ykEaH8USKwiWF2XSrKTMgjJtO6+lrLxB6HVLihjMQC0aU0HMK1vvmpdramc9c3FsccX6BBkzyo4d3AdTFg+87XWfqqkVw0n34BO15sEUa0eNHKradPWZsuyWCLBaBt4jGS5W6Dk23SISEyppAuC6/64hdSSOfceVrzSgx9D/LmFPBUPSAK5EmKogpEKCwXL9GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jz5SB/qxgK3x5XwNfa+vEi+HS26LjTvZImo8H9dkKk=;
 b=BEfHDkd8CX2+FtQZBqBwTVt/KV2gjiP/1vK1cPJJXrj5EQyTi6SnKEwR5uXeSX917ZeeqYAwdiv42d5UDAvTzVg7eAJJ5IGKLhgr1wZQfVphv/QbS4NOWddTUJyK5GJRr1FlaJlLzRNhhw7ScMCK7dcQNJOBIpuy9A3ZgB2Xebg=
Received: from BN9PR03CA0176.namprd03.prod.outlook.com (2603:10b6:408:f4::31)
 by CH3PR10MB6901.namprd10.prod.outlook.com (2603:10b6:610:14d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 04:14:28 +0000
Received: from BN1PEPF00018549.namprd05.prod.outlook.com
 (2603:10b6:408:f4:cafe::8c) by BN9PR03CA0176.outlook.office365.com
 (2603:10b6:408:f4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Wed,
 30 Sep 2026 04:14:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00018549.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 04:14:26 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 23:13:51 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 23:13:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 23:13:51 -0500
Received: from [10.24.50.130] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68U4Dnvk2371432;
	Tue, 29 Sep 2026 23:13:49 -0500
Message-ID: <170f362f-b64c-4b6f-9f74-ccfc4cce7d9e@ti.com>
Date: Wed, 30 Sep 2026 09:43:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mailbox: ti-msgmgr: Read exact number of trailing
 message bytes
To: Beleswar Padhi <b-padhi@ti.com>, <jassisinghbrar@gmail.com>,
        <linux-kernel@vger.kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <nm@ti.com>
References: <20260929200159.4033010-1-b-padhi@ti.com>
 <20260929200159.4033010-3-b-padhi@ti.com>
Content-Language: en-US
From: Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20260929200159.4033010-3-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018549:EE_|CH3PR10MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: cc80e41b-c318-40e6-ce16-08df1ea95132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|18002099003|22082099003|13003099007|6133799003|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	e8GPnr5BGiEwiNFJP8PgimeaskuYjlbou5T0SuC/lAp4V1e82d4yXtg6wORUEvxYc9/38Rtavxof29yGcZz3qN+bl/btWuFloqtDMfsvS8Q6xkTDYlAqn9dCYZPtzfou7mryQXixYv0H/j8mKM5LQKK8G2+Onmv3UnD1PfP/JT5vFoJN2XDcbSkRjwMcqQ9BPtmEpgiRRdvCuFkIVu2uDB6Kn27QTN9LtpfaRT9PvEtPogqcIyK9FdK2jnWdef/X42DlUMyB3HwK24dUoZRocxqmd/QZm0JMURn4ZqR0FK4M2PLLxhB4vYqwseGSw+LXzuVLS1xPWpm1AtlcnQsdXN4AsfPkssJl8RNZRv93h6nYqzaI2MaGOhPR+MVx1h/Ag1PEeUn76jJ2ffWjKCOJimS6N8JJpy/Yojn7oMSBJZGkcAH2DGxWp0Wmb9y6BQtfw/uMlC26ybD5KoQV76h0Q624p+Pa4Adxo4z9wPQJcwo0yw+tNtp+c/TU34E+VgseYjN9WLylQjZ/+P/wOFP8o1JidB+3Q2jS66XwYEi2TAVF8aYbEIE3CqkIhKTWQXRF90al1FfS0RMQNArdhteC3A5K/TEIwiZFfP99JpzteEWKOjielmFpoPG9Fc7FD3VihePROq4w3ihH8+7EoLiYnw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(22082099003)(13003099007)(6133799003)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qUnAX1zLVicgK3ndqvM6n8ch75lkMdXlzTCOADw5NMAZjHK2pl75UcczOBT8/HKK6xsQeY65wcaQUD3MFFbC7kiGDZZkMVHIun6GT4jNbcEjqF7LxcGfZE4ldyrCH0zF0hYeUvN/9FPNQnWzNGnzECDqtUmgcCZgw9hNXNSUPQROQHdT51xyFIX/ZMwOR9+9Gt38GQ9KnJzvbhvzIC7HIlYWFdml6j/6h9Drk4EgRXP+R+DRB4T5s3HgkKo+QWU1Tb3QMyjT/eXUYKyufF4zBFRpVtSPHe7FuIjNwqxT9Ovs1PE8YFUwPlFvvw4UkC1tC/0MUyrMUZFVRSvDItd4bentKPSDZuWFjyJRiDBq8SAsXvUbpPO+U37FMq1EA8NBD0zQOsUMyQzHDmG/BOCmZk9HR3NOpdXtL+GBLsz3iROF9MsR/dcRyDHV74l4wPdO
X-Exchange-RoutingPolicyChecked:
	fD/6Dvjtqw2itmSY9OEfHt0/nnjUchW4vbj4NsmarGHMmpNq6aP6EXDPXXh7LYKRFbe38ltfH/Nw+mBkVBiNG7uAqedLf8qLJ1PWM014JeCarWXt53Dm67tDSLmRtG6/awIONba8lEP4ol5I9DG/AXJoKp6MZRsLt8grlKLp/dQ0+nJsCFM+gZ9rC8q9o808/HLhg7HOVXoWyGRqziQnGCBCojhwn+ssiIHkCCb42UU91tl7NYaeiFOLZQR4GEUeuzIF8l8Us6BUX8Tls1ZxMsSojJWRx0m1No+TNcqr5h1mNRdKI1Wl0qoMv4wDNl6xs7p0dTZYobq2SmNEPWAv5A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 04:14:26.9374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc80e41b-c318-40e6-ce16-08df1ea95132
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018549.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6901
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAxNiBTYWx0ZWRfX1ljW3U/naqYt
 OqNADThbF2RybmamdexrN6WMUsH2NShIlvd6kdSchkKG5ou4FxY/m0ZXYDXJX0P1yxd5MJIpTMA
 z6KQ7BCbTATNBtNk54edaiD+bEGdGCE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAxNiBTYWx0ZWRfX2xDmO6ZssV4Y
 xNgD+0uA1pqiWajLfgRs4hXZp0aGKr2f2XLX0hgCzzgKPmr0FdsZ2hxuq+ZIUjaT8qCtqgv90mM
 jU9QC3Gvj5mbr9PT1HYn6xqTlPcEdnMNx7lWCGYz/xHl42jgHv+FEZjXYAGcnEaZMLstEr8RZl7
 QoJVDXqWCPDluPL9Pjcl1zglWMatWmVd+KAV0lU/EndP8Ys36B5GOqbd2hM5W5fue+pF7CIJyfA
 tX4hz0vEi9HSF9u+Yr0wFdKMkWqHQbjxOckuUZ7+RFLI3jw2OEGsHMU0FSaJwZUDunseiTFt9+3
 qE1W+rDYcuF/Yxd47jetPwwnFyxyNWtn6uc8FGVi6ziAyYrx5XyCHY8Kby9E7EZuw9nq+Bzmb02
 f+34pwbMrGJP3XwrFk5dqqs/5HwAWHivITDjj/UHVboLIn4BeyCCcyH0El8xZSy0I2kuLHOuLwz
 w6VW+1VaaDY+fOEEy5w==
X-Authority-Analysis: v=2.4 cv=Y4xtIReN c=1 sm=1 tr=0 ts=6abc8ca6 cx=c_pps
 a=021mb8W6rIxzgUEI7A/+3A==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=l3ux3mLL3HGkqGGCN64A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: lvTrBlqPF4bE7lyR-vU7yKSj8i-9m43c
X-Proofpoint-ORIG-GUID: lvTrBlqPF4bE7lyR-vU7yKSj8i-9m43c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300016



On 30/09/26 01:31, Beleswar Padhi wrote:
> ti_msgmgr_send_data() copies the message to the data registers in u32
> units. This has been harmless so far because the clients (TI-SCI)
> always passed its preallocated message buffer, which is sized to the
> maximum message size (60 or 64 bytes, a multiple of 4), so the extra
> bytes read were still within the buffer. But, with a later TI-SCI
> update, the message size can be varying now and not guaranteed to be a
> multiple of 4, which would trigger KASAN out-of-bounds reports.
> 
> Therefore, Build the trailing word by reading one byte at a time, only
> up to the message length. The value written to the register is
> unchanged.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>

This looks like a bug fixes and needs a Fixes: tag?

> ---
>  drivers/mailbox/ti-msgmgr.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mailbox/ti-msgmgr.c b/drivers/mailbox/ti-msgmgr.c
> index 425d5f9d9d0e3..44457a896510f 100644
> --- a/drivers/mailbox/ti-msgmgr.c
> +++ b/drivers/mailbox/ti-msgmgr.c
> @@ -425,10 +425,18 @@ static int ti_msgmgr_send_data(struct mbox_chan *chan, void *data)
>  
>  	trail_bytes = message->len % sizeof(u32);
>  	if (trail_bytes) {
> -		u32 data_trail = *word_data;
> -
> -		/* Ensure all unused data is 0 */
> -		data_trail &= 0xFFFFFFFF >> (8 * (sizeof(u32) - trail_bytes));
> +		/*
> +		 * Read the trailing bytes one at a time instead of as a full
> +		 * u32, as the message buffer may end right after them and a
> +		 * u32 read would go past the end of it. This also leaves all
> +		 * unused data as 0.
> +		 */
> +		u8 *byte_data = (u8 *)word_data;
> +		u32 data_trail = 0;
> +		int i;
> +
> +		for (i = 0; i < trail_bytes; i++)
> +			data_trail |= byte_data[i] << (8 * i);
>  		writel(data_trail, data_reg);
>  		data_reg += sizeof(u32);
>  	}

-- 
Regards
Vignesh
https://ti.com/opensource

