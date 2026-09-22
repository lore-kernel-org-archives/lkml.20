Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012024.outbound.protection.outlook.com [52.101.66.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D0140B6E0;
	Tue, 22 Sep 2026 08:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065085; cv=fail; b=eLhU+heGPMC6KABVXrIuaegD6pNDDlUsh3il8N6AprFG0+/hBDkqO/Hb6bqkg8L5AVYF7XaNqWBkFX3gKG30IK0NlkZT2gmYYaXmy+BPpF+h6Y0AU/XIf1VIdHgcsvvYzE41bGEDE6F5pbPjtGipldhD9YSeskXz4JO38W2RMdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065085; c=relaxed/simple;
	bh=dqV6he0C6xf6KxnK2YTCsdGb7Q8fs2IQMu5Y9uHyRIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XW0MwbEYrMlPj3rV7+IJQwkmLI5yn8Zc+QI6+Zt0uoVshAPHBBCFr9K2hDjtTSv7LwD2Ygtebi+7PAzPE9MhZ72vVDSMaLAvEt9rlBKfjdhZOb4b//8t7h0nE7UZU09SfkItFe4sywGsxvF3TT8vjkS/fnIr5GNOsSK6tq+LUtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=dp7CqHTa; arc=fail smtp.client-ip=52.101.66.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="dp7CqHTa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QLBC44QJdxQVz20kcCw6BD+p1GEy0Vii1hrswgTbXNnc51Qro3ZaAOvcTRAp+lu6gkMUTkVJTIBjsGOVfRXLKas1l3A0R5Xkn4VMTc5uWgkD/vbSUOajcfGCLb0353r4f5ZZPNkOUUafSW5BTorbJMCUXz56TPBmJKvbnO50/dKgtrDwbyvYH7/JR3i20QUCf8WmK23xH+b/vmK4kqUnTiU50peQR9NLVqsAi8GQyyItkZ6TH7TnKd5p01n8uqiN8xeGIxAdbdMIib3ht9c3dFdIZ+K3sshULEz18Kj7TpJ+uJSUEmDFHhBOadrqGDX6GKrFwm1ZmdFYun0kAnu94Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1cbfJy6XbVCMiT3UsK4qlftt3yKZjUPsA6inLg4g3w=;
 b=bXvrx8w+4rTixT66T2nVGz/7GneXB+XriMNvL1Sqpfq5vX8DZ53i2FZt79oZPXwHY9B7UlA5Z+IAOd/pxdlqA+hK9MCG/alXf+4iy4MZBmEtgVqnGoAKpRpqdsaGXEUbePHC2CnYYF3TtKem31047G1ufXTx1AYeRnA2lTaVkeGVywuk/yYOUjxtBK5EHiswTUz3s0pGynQpgbP2W9K+VIbtvyLPfplCHKCjvV6XXUbkeU6yqNfRt9ZHN7TB5xS11sTohoVvwXLiUCq3mPLHmBsOXsKk3KH3fHzBcWV1rdlPjHuY9OwVdg03YiqoC/R6qp3hVKLA5U3obKYVGseB1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=xiaopeng.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1cbfJy6XbVCMiT3UsK4qlftt3yKZjUPsA6inLg4g3w=;
 b=dp7CqHTa32W5jKatPsMcU4xF/cE4burabvPqkSTfXt3wUtfe5tQZnyUfi9UknbdSElXaM+pBzOwx79N23u025xdl/zb5YtEFRP0IkiIVBR9rZT/SYsx8ecQdxa93fUGJbAf9toMRICNvWuHDm64S005T6VPwcBj4/p/tKjX+S9DqUF8M9BIhHBOaqlcXqe2Bu8AgSx6islJniEgIByBTwWWqY+rApObIn4RRXrkV9erg5C+S7eNEocG6GipMsFvohiCio1OJMEFBc8ILgMivMBco8UMGz4n4SgOnaltnrjnBzc5/9oaXOwcKbTtymI/aL3qgLcACh6si+Qnym3a5Og==
Received: from ZR2P278CA0071.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:52::17)
 by DB5PR10MB7821.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:48e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 08:17:58 +0000
Received: from MI3PEPF0000849B.eurprd03.prod.outlook.com
 (2603:10a6:910:52:cafe::8b) by ZR2P278CA0071.outlook.office365.com
 (2603:10a6:910:52::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 08:17:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF0000849B.mail.protection.outlook.com (10.167.240.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 08:17:57 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 22 Sep
 2026 10:23:44 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 22 Sep
 2026 10:17:55 +0200
Message-ID: <1d7e0ce1-a539-4366-aa11-141ee16ca2d4@foss.st.com>
Date: Tue, 22 Sep 2026 10:17:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: vgxy61: reject out of range MIPI CSI-2
 lane numbers
To: Guo Zihao <guozh23@xiaopeng.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Sylvain Petinot <sylvain.petinot@foss.st.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Liu Chao
	<liuc63@xiaopeng.com>
References: <20260922064548.844609-1-guozh23@xiaopeng.com>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20260922064548.844609-1-guozh23@xiaopeng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000849B:EE_|DB5PR10MB7821:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b0b33cc-d296-4b19-13a6-08df1882029d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	k1oADeH9Y1vaCQApCCXIqT9/LYRb15kxKbYrkkAWu66leWODDRRFhaJbofXpzO40UXpkaupNGvtTJmnZiJogFzvS6XrnZexNRGwQKARY3eCEi7gjC0u9pRlza//fDeHvL36wR4HGu0VamQwEeC7ODttJCA9Wj3oIgh/k3wZrA4lyuch2JECsuHI1EzXMa4MRMmpyNMFulxL69xVIjzRNWN9A1MivL1JdBswMcBeuNO5MJHfzS840dGtS4DPo1bfqIQGqsp9YTfCw7z2S2b9avzlWr/gdXKK5gImv1Oyl9UALyN+yWtE1AqaxKV7ylJhCigd4LH2nvS6l32fznQeCFF7XsoqicquZKbSmcLURkbnBXKrZ2YiltNVpE9GQ4G2gedCoKx7XmwvmBQQHbfX64p35D3Ifw9TPvxamNTBxpYnPNkfErs8i1EVF8/cO02ifJUI/uQVJFfOx7Rt9atvzJMCtxXLHanNnE56e5EOVgDQ7htWAyfn0r1/6gYFkawSM9AHwxwl0CuCx2VV7hyR9O3562bIJDqAvp6RolXgPL4sTJRGzxs3pzJFyOh6XDZPdIqAVcHQSTQzqOj+kATDiV+2HSDT24c84wDzudVMjatbJWAfKo98zpbljnw7dnfkTXOYMBQzAAvDbXGIXpkdtjlzMHrTcrOdJPoez4akqXZPTPmcR30lB0JiFzRuE2/AQoDBKg82DInHnl8UzLm0mTw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	51N/W7RvpVk6BpIKVLCDSTZtW6Uhp3VliA5tgzk19r9hIVk3q00Pv7NcBKgbqWLGyV5A7rWa/75d5IpK8/DXWdJmvAqFe5cVE5qy0aX9CPvl400Cj6sjfAziohYZBLT362LyK53voyYX6S6WFutsVYq7bBa1kIZb9tieOUCbawUYBTM6eFBJtjqLEd88zvLUsEBY0jlgi3/37YIR2qVhE040gdvCL0OfTYpzCHixjrWVNEXDCEnHQ11RwdsRTMYsge/Renuvdmlb2w8Cp32Xkx0rTAb6xnJLNkupn4oSF88ysvbXi2QptAd9dabgI1/gQ8vXyl5ZiRgTP4UYaiffTZxcx6KsmuFv3K4XlHjp0wvN+PPMowvcfVGmsZMUYuZQqxUATIZXzVUJzXrb0RQrI00+LxEVhuLQdh6wjusn/kcdZFs7z5jDWyKGbJOF1xnK
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 08:17:57.7757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0b33cc-d296-4b19-13a6-08df1882029d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000849B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB7821

Hi,

A small nitpick, other than that :

Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

Thank you.

Le 22/09/2026 à 08:45, Guo Zihao a écrit :
> vgxy61_tx_from_ep() builds the log2phy and phy2log maps straight from the
> lane numbers in the device tree endpoint, using them as array indices:
> 
>         log2phy[0] = ep.bus.mipi_csi2.clock_lane;
>         phy2log[log2phy[0]] = 0;
>         for (l = 1; l < l_nb + 1; l++) {
>                 log2phy[l] = ep.bus.mipi_csi2.data_lanes[l - 1];
>                 phy2log[log2phy[l]] = l;
>         }
> 
> Both arrays hold VGXY61_NB_POLARITIES (5) entries, and neither lane
> number is checked against that, so an endpoint with a larger value
> writes past the end of the arrays on the stack.
> 
> The endpoint parsing just above validates the number of lanes, but not
> the lane numbers themselves: l_nb is checked against 1, 2 and 4, while
> clock_lane and data_lanes[] are used as-is. A num_data_lanes of 4 with
> an out of range index in the last entry, for example
> data-lanes = <1 2 3 99>, passes the count check and then writes
> phy2log[99]. v4l2_fwnode_endpoint_alloc_parse() does not constrain them
> either: the only use of clock_lane in v4l2-fwnode.c is a BIT(clock_lane)
> duplicate check, which does not reject a value that is merely large.
> 
> Reject a clock lane or any data lane that is not below
> VGXY61_NB_POLARITIES, before the maps are built.
> 
> No Fixes tag. The arrays and the indexing come from the initial driver
> import, 153e4ad44d60 ("media: i2c: Add driver for ST VGXY61 camera
> sensor"), and have not been touched since.
> 
> Reviewed-by: Liu Chao <liuc63@xiaopeng.com>
> Assisted-by: LLM
> Signed-off-by: Guo Zihao <guozh23@xiaopeng.com>
> ---
> v2: add the ST VGXY61 maintainers to the recipients.
> 
>     Correct the note about the lane index range and about other drivers.
>     The indices are unsigned char in struct v4l2_mbus_config_mipi_csi2,
>     so an endpoint value is truncated to 0-255 rather than passed through
>     as a u32, and the comparison now points at vd55g1 and vd56g3, which
>     check clock_lane before building the same kind of map, rather than at
>     an unrelated change in this file.
> 
>     Add the Assisted-by tag.
> 
> The lane numbers come from the "clock-lanes" and "data-lanes" properties
> of the sensor's endpoint node. They are read as u32 by the fwnode helpers
> and stored in unsigned char fields of struct v4l2_mbus_config_mipi_csi2,
> so an endpoint value of 99 arrives as 99 and anything from 5 up writes
> past the five element arrays.
> 
> The binding allows data-lanes 1-4 and does not mention clock-lanes, so a
> correct endpoint does not reach these paths. The checks keep a malformed
> endpoint from writing past the arrays, in the same place the lane count
> check already sits.
> 
> vd55g1 and vd56g3 build the same kind of map from the same properties and
> check clock_lane before the map is built; here the log2phy[0] != 0 check
> runs after the write to phy2log[clock_lane].
> ---
>  drivers/media/i2c/vgxy61.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
> index 3fb2166c8..ed1205cc6 100644
> --- a/drivers/media/i2c/vgxy61.c
> +++ b/drivers/media/i2c/vgxy61.c
> @@ -1457,9 +1457,20 @@ static int vgxy61_tx_from_ep(struct vgxy61_dev *sensor,
>  	}
>  
>  	/* Build log2phy, phy2log and polarities from ep info */
> +	if (ep.bus.mipi_csi2.clock_lane >= VGXY61_NB_POLARITIES) {

It may be a good time to rename VGXY61_NB_POLARITIES to something a bit
more explicit, like VGXY61_MAX_LANE_ID. Up to you.

> +		dev_err(&client->dev, "invalid clock lane %u\n",
> +			ep.bus.mipi_csi2.clock_lane);
> +		goto error_ep;
> +	}
>  	log2phy[0] = ep.bus.mipi_csi2.clock_lane;
>  	phy2log[log2phy[0]] = 0;
>  	for (l = 1; l < l_nb + 1; l++) {
> +		if (ep.bus.mipi_csi2.data_lanes[l - 1] >=
> +		    VGXY61_NB_POLARITIES) {
> +			dev_err(&client->dev, "invalid data lane %u\n",
> +				ep.bus.mipi_csi2.data_lanes[l - 1]);
> +			goto error_ep;
> +		}
>  		log2phy[l] = ep.bus.mipi_csi2.data_lanes[l - 1];
>  		phy2log[log2phy[l]] = l;
>  	}

-- 
Regards,
Benjamin

