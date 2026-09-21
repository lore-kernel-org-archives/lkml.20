Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010022.outbound.protection.outlook.com [52.101.84.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F3E3559C9;
	Mon, 21 Sep 2026 09:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981758; cv=fail; b=eNdOwDpuuCLCrA52Iv4JCDYp+RKDAwHDHcWKUftNn01fH0n+NQiaLIB+6G632QmODeHUDvMWQiwDbCUFrxoSmKeELIYh5jLhUblXyTOq+n7uhzgVba3lD36cTPfPFYAQ1Sk2RNvCPpFXY5X34JEVMcUt1XEosp0cKq2PJT4mq2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981758; c=relaxed/simple;
	bh=PDUERPsbYDaGQOy/Tt1wLR4+qq+dkz3GRpzMhgxF8Xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rkYoJGbDRTU1FemGRyQj8NdKZDSwIqEm4D9+o59ZmiKPE4SURf8SswRMl09laLw6f9IPGwxgJwF8DubXrB67YSoJXIkMQmDyF9nQ1yoqUPOW4CbplgUX0ZcQvxiTBQhv7HUyEJuvGCJwtAw3ABAdCh+XGt/TO6kw9yt7mumemmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=gfKDDYTW; arc=fail smtp.client-ip=52.101.84.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="gfKDDYTW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nq6WMurQFGiHQHVeSfxNRfrEKufm+NWPeN35FPl8Iz7X/J4B+frzuap4RBwnQtpG+I4v/wfCKtqrw7QBe9PIVeLbhazOJYaC06/rm2awNtaoBa7PJpbktl79NyiS4DM4tY8AJxLGqYWa671BlwQh3es0Inedl4FLbcpIGZeniLArC/LoDz7qEkztygg3Rt0KgmsqV3C36txMy6nG2Xw4tj2H4YK+0XBoSzdQ7zyLa7sXaT6XLHzv3Yzt6hgsOjn8QVPZ7h5jNZbytAlDBpBql2RS/BPrAt455pVqAKYlLV9B7d+g2eIHNtEfdgcoCyuUxsaO7hpUGvdQAL1lL9iVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZbkz6Qk5B1mxcY/iTxius496wstr+s6uxl9Wr3BbGA=;
 b=jBEn/byq3kkV8fpcWYKQvzO84U3IU34pRj0G/oeEMcYxJkcnDyxk8nw3x/GCyA//LldhItMr7aT8gVwQuoT5x1cRLD6BQr7GhP4vwobGEggezxuf/G8s8BIWKjbhci8BIfhJalzNOPbBpsyt6nqbxpZLXTviuGyViNRrQPD3DRO9fU3sFMwpYrd6c5oPbjVEgksvC6yHrhB+GJCg10k6deGLbeb+8fiU+Ax4WAVhjcjlMgcd183PQ0cN5nwhFqORB2wbLevnbFvpZ0dz4gS+hszdkfObqINE1Fhg73MXI7Z/wWNl9cKkuNZTMXRzSE0Giu6i5c7BMKpUoc+Eggxb9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=xiaopeng.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZbkz6Qk5B1mxcY/iTxius496wstr+s6uxl9Wr3BbGA=;
 b=gfKDDYTWTEDUwkMwIgbjSFt87PX/JSAmS+Mxt8zuOiUbDSP/xG50JgUzNhPXjceizZPv+zjVHdf+SwXHR00jJlzxcpjNnTTW1gcyZOHHxKYHDMk/gh6cEvyylt5206wWg0pgvxmZ3xq0bQJi7uLTLHvWb1mbpWUrioBAPk0Hi66jxv+eGhOm2uY8jg0LnyMOxqNzGC8lB66mwLMrKqM2WkYnhSCudkYMEvvReKMzWmMVFlL7vVXy0q6KWd4GoGicx3lAJUyqxr40yY8fMYs5aAev+zfT0pEJuJRP6mcVo5XOP6ZqE6SXwT4k4WeCg760hP23YEnr3kL+pp6oDh96pw==
Received: from AM9P192CA0028.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::33)
 by DU0PR10MB5876.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 09:09:10 +0000
Received: from AM2PEPF00070CF9.eurprd02.prod.outlook.com
 (2603:10a6:20b:21d:cafe::3d) by AM9P192CA0028.outlook.office365.com
 (2603:10a6:20b:21d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 09:09:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM2PEPF00070CF9.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 09:09:10 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 21 Sep
 2026 11:15:37 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 21 Sep
 2026 11:09:08 +0200
Message-ID: <0729208e-e1ab-4960-aa03-810bd4915001@foss.st.com>
Date: Mon, 21 Sep 2026 11:09:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: vgxy61: reject out of range MIPI CSI-2 lane
 numbers
To: Guo Zihao <guozh23@xiaopeng.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Liu Chao
	<liuc63@xiaopeng.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>
References: <20260918060352.1879381-1-guozh23@xiaopeng.com>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20260918060352.1879381-1-guozh23@xiaopeng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF9:EE_|DU0PR10MB5876:EE_
X-MS-Office365-Filtering-Correlation-Id: a8a4301f-7668-445a-b676-08df17bfff8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|10067099003|56012099006|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	VVJU2A/GyiQVQL69RQIxiTWTG8kOFs3FNbUlQKUSSJjs3Jrjk7yeRohscrbKPggVxv3dRbkEnJLeLiHTiX+McBI1gM9YvMdfgVk6P5ePMu4HkirMSegkuydKQd2RUQR9FoF9pTuUcmLjr0gKBAQofMQrRC7cKj9jEzH6xnW+eaGMyfw2yCGK3mtOgOk/911VIZKpVGfrWtxMPqE2C6H59PmhzYVV0a9bpLwjzAG6FJH70qVis0HJd8LN7JlZWtUkARW1kqPEDDuPpxsHlFu7nIwnk+Zn6iHl5L3K0n/H3LA+3k+j+PmFZXlkHmREUZENknqLR8xODMcfk1YWU8n1kM0gBsQJTy0c+xgrZ9LbVAkuGqorUC8y3ep+OOum3UbH4tLYN/jVfqt4xE6L4esI68LonXT1VwkOFpOEBfF3fDXcPZawHaadLAAW5J+eqQfu8kyLNh+c5782GhXoeHvoccN4E9+nE96Q7KCi2R30Wen0TzSMxlWJAbSUypHEKIRN/nKOfmNks2p1vHEAKBpSTv41WmD93+TepIptnooi4WtHSb/VsX0fXwwa6+w+QXrDLXGnZp27CbK4LMj/JtZNGRc9cjV8ljCCetRSEigsrmOwd/YPkHUW0GCfI69jWJCCqRvKfBcoa4KqLSy+iznqbAG3KEVrc3evTBwRGR3ZN9DY/K1oP/VAcTuA7udNKjeKRAUB4wALbQUpe2vfkBgXbA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gJFAWtcvETfhWNtag5B/LTsWnei+8Bln1KwO/KKjgHyJXYPTwCj4gOcD9JuKPesb7AD1cndPDT/qS+javuSXix5sP3Ss+pEheDqki5D3/H7EpNvwPIjKiW8uMT2JDBRNM/fT/sKPbYmxbhLYloq3asjTz+29WUZsEiH2tIBIN2/NYlGkNO8W1P/sFCKkgZka7tg4oljID8KwV+Qo4lWGqo4GwvsclCt0YERmUD3zws7jx/gb6dG+9TLT5hDhrm3nGEjEvyfa9AkUegjRbk4m2fXSDWTRA50Q24CZgecSB6mIiQ6G0bhyR1Y/MwNBa7mGgVKhhczucmjvAUyxRmux0ZcMV4tfq3oNvtGfKMvgheXGK5BX49yZREsZL0JRhJDmi3mNambwqq1rtJqQhOqo0CxQ0DHEi7abHxZrb7XMBLyGssLYWXhSxq2gCQklINi0
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 09:09:10.2505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a4301f-7668-445a-b676-08df17bfff8a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF00070CF9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5876

Hi,

Please add the driver maintainers in copy while submitting a patch so it
pops up on our mail filters. I added Sylvain here.

Le 18/09/2026 à 08:03, Guo Zihao a écrit :
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

Correct me if I'm wrong, but they are checked at line 1453, which is in
the same function by the way :

  l_nb = ep.bus.mipi_csi2.num_data_lanes;
  if (l_nb != 1 && l_nb != 2 && l_nb != 4) {
    dev_err(&client->dev, "invalid data lane number %d\n", l_nb);
    goto error_ep;
  }

So there is not need to double check it after.

Also, it looks like your patch is LLM generated, if this is the case
please disclose it as per [1].

[1] https://docs.kernel.org/process/coding-assistants.html

> 
> The endpoint parsing just above validates the number of lanes, but not
> the lane numbers themselves: l_nb is checked against 1, 2 and 4, while
> clock_lane and data_lanes[] are used as-is.
> 
> v4l2_fwnode_endpoint_alloc_parse() does not constrain them either: the
> only use of clock_lane in v4l2-fwnode.c is a BIT(clock_lane) duplicate
> check, which does not reject a value that is merely large.
> 
> Reject a clock lane or any data lane that is not below
> VGXY61_NB_POLARITIES, with the same dev_err() and goto the lane count
> check uses.
> 
> No Fixes tag. The arrays and the indexing come from the initial driver
> import, 153e4ad44d60 ("media: i2c: Add driver for ST VGXY61 camera
> sensor"), and have not been touched since.
> 
> Reviewed-by: Liu Chao <liuc63@xiaopeng.com>
> Signed-off-by: Guo Zihao <guozh23@xiaopeng.com>
> ---
> The lane numbers come from the "clock-lanes" and "data-lanes" properties
> of the sensor's endpoint node. Both are read as u32 by the fwnode
> helpers, so a value like 5 or 0xffffffff reaches vgxy61_tx_from_ep()
> unchanged.
> 
> For a module built into a device whose DT the machine owner controls this
> is not a trust boundary, so the practical impact is a malformed DT
> corrupting the stack rather than an attacker escalating. It is the same
> class of fix that the driver already applies to the lane count two lines
> above, and that other CSI-2 drivers apply to their lane numbers.
> 
> dab65dfbf9c8 is a recent example of this file taking a defensive check
> for input it cannot control.
> 
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

