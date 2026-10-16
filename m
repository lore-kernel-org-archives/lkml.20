Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazhn15012015.outbound.protection.outlook.com [52.102.160.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD7B4749F4;
	Fri, 16 Oct 2026 11:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.160.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148541; cv=fail; b=R9sXs+/gp6SqI3ZHzs9NJ9QcqjYLYdIKLwH5In/UrSgX11ri60nvEPpfvt4Bug9HAW2MBfgFp+0JZt9CEeVpjaraA9eIeJDibmbWSkDsZRA91CT1UbfmzHYs+e8eV0UsFG27ecXcwzMOqoEwP2PeRlGvI5oI3WUanryyU2jPoZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148541; c=relaxed/simple;
	bh=LGyO5Xa37D7lL63r27u3rYI6xFVjna0wDZ27sfEMXbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JcyVcNTJPELRZ5SL0Ue+SZImJ/g/EBWmCva56Zj7oGBfkMk4LjbuDQB4lbqbCiuYpjp7snOh4vckt8S9oxzbKKd9FRfY2AB/pOp+GbzRaYIepQcALjfB5ghLNgEMvHvFzsyD7DKbxpycJTKJO2SKMflwPpg6GSD3T6W3M1apj5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=So8J5KPQ; arc=fail smtp.client-ip=52.102.160.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="So8J5KPQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZN1mOLAA8QzSzKRaLRN/aOjJs2d8+NEKXzm4Vzm28TbP+57bsgdz3mz88ADCrBxzE0EmU0IuYfuOCs1+wWlJq+JW094G7CnHFqXqsbPPotVIY2SKXuVr0rZ9aSCm1ktRFXWsaKuMXnSCWyuCOa+w3+ItGoEFqoHGuQ/LMOgWDz3S8zeyAkfQHZ6Jue9FicCVkBRL5768Rh6r69sAH9MiSiffrScl+JhpkneKPXoQyobi+Nr/sB+vZZ676nzql8fKkx/xzZUwluja1QwE1EAs8JqLLr2ZjN8n/zGlvsSuiq9OI2jad3xqOdo057TKiQ0FWcmIk3CHmHbb3KIq+0u6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbkSMfJwsWZ8f8Z4+3BWH3+7/grcuWtGI0Jjpr5Q+d8=;
 b=Pi/eCc8OtFtXRZQe+eZuoXX2uuCzAc4gmu5d8Az7EYEufPmSCeSZrAGxmC/afCj+u9OfgpJhBJaotn+Q8Nsaj/IDKNMsO3daU0gZftN7iX1PpHXPRYzGpFpwsi4gW851tyzqw5HcCeVgxIbFWAZEB3rZKRsR0hWPGx24T/q37KTiR5xyjWwDuW0qc37HffWhfic0OSgEPrZjA8y2dPnQItUVC8xdgghaZs0W5PRnrneSyY5v5NQnVHCVcADBdD786GeOUhogjhtQVgsJ3H51qamhZtHEquUBK5dj2BscCVKsdxvPOrvkpCZVKHt8910EA5pqllAbkd9f7VlDX8/nVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbkSMfJwsWZ8f8Z4+3BWH3+7/grcuWtGI0Jjpr5Q+d8=;
 b=So8J5KPQGFzhSV6CKmfEYfAew5YHxn9/iiPKd1XKfLTLV3dkNCAv9I8vvynFntdEqvXd9Yl9E3lc9nXD4Hqh/ZyyyC99c0B4kmOtqKcyX/pvUvNfYzQlqTm4LAZPvftxCBcGu8DlUUPLgCM/e2KVwgPtNNbEH1T+p+ZITZoRpGcA3ltmRFrV/WXpwCdMKlbOEQPWEUdbHwpyYpYGqCirut7hytpJA3qdz85Jp6TOfTUNq/iFnLRrwgn8o8Vbvku6XCy6ezssTxEe0GedPCKzOomiI5TkP6D2Ttd0bwkP3wWJAEnzYbB6t4xpbV/2MjSZ+zNfjyFjoZ5lngc4e4ohkQ==
Received: from DU7PR01CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::11) by DB9PR10MB7291.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 11:02:16 +0000
Received: from DU2PEPF00028D05.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::94) by DU7PR01CA0016.outlook.office365.com
 (2603:10a6:10:50f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Fri, 16
 Oct 2026 11:02:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D05.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 11:02:16 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 16 Oct
 2026 13:02:43 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 16 Oct
 2026 13:02:14 +0200
Message-ID: <1a8f2064-14e3-4eb7-8e0a-0e90352aae3c@foss.st.com>
Date: Fri, 16 Oct 2026 13:02:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: vd55g1: fix VD55G0 streaming below 900
 Mbps
To: <geocausa@gmail.com>, <sylvain.petinot@foss.st.com>, <pm@petermarshall.ca>
CC: <sakari.ailus@linux.intel.com>, <linux-kernel@vger.kernel.org>,
	<mchehab@kernel.org>, <linux-media@vger.kernel.org>, <fqwqf@fqwqf.xyz>,
	<lsa.uz@pm.me>
References: <20261016-vd55g0-sp11-fix-v2-1-aa08b4b8bbfc@gmail.com>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20261016-vd55g0-sp11-fix-v2-1-aa08b4b8bbfc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D05:EE_|DB9PR10MB7291:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bbd0161-9100-44db-491a-08df2b74f08b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|376014|1800799024|23010399003|36860700016|82310400026|56012099006|11063799006|261009220027099003|261009223327099003|261009221227099003|261009221727099003|261009223027099003|260925021911599003|260925022911599003|260925021311599003|10067099003|22082099003|18002099003|6133799003|3023799007|12100799066;
X-Microsoft-Antispam-Message-Info:
	SD+BceBWEB4hTPoYSKcFksYLO9JvPY3h90JAvhTeHNAWjO+kUvVVZrLrmpZqyu7uZIb+yCdEt+os4Q7DurzOVpvSAw9XDYAw4eWZaByPQJjq6t0BPt9dVbvpfvzNCVHno8FkYxjD/E0lnsMi2slv4O2M/IpDeAfj5tLpPl9cqzZU5u6IcKEZTAs2XV9/eiWdwrMfwVNusxGX180dTf3v4MDEw+V5Rvopp/HzMMxMoEfxAEA57Tsn4PkGFVOmyB5t0BTe9Wi3qRgQCXCE3xkSM1UF77WNhOP6Bk1IgkbjapLA5Wm5V8EGIuBDfekzcCyWZijwesQT7FSjZ+imO+ZBXCqYKFmGMRVfIxonmUjIroE3I3wDSsFRTTKzX3reFP3Vhx4swnSCn6tc3tKYN3Izm12EOwkLnvGXnE/gVPaXbN8uQ/zar3U/X4JfaUna5rtXBl+KtGbgUO+O5RbkER8Tea/o/ODVq/6LGcjxVQTqLAhezVoVf+/GMM54ygb8EzMsJtf/oVWEpY6jxmOC82BM6I0yfxBb6Om67uxlf+wfYng5t7dclB4khnMZQIOxHI/4Uu5v7H3hpdVoVGQGwV4gNMVcv2hNIkcbuGzxUD+Q2cJq0tFN47dfEkfF7v8Em5j187GaVwP9cbs7s/bjBM4GKVlBewtTt0nCA0+a2O14W8Q=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(56012099006)(11063799006)(261009220027099003)(261009223327099003)(261009221227099003)(261009221727099003)(261009223027099003)(260925021911599003)(260925022911599003)(260925021311599003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k19X9qeEGAySzWiNJKXL/wsO0WqE5jIDkw3hajU73O8uYXnTiXfwtkHNUAHBHjih89Vv1W8gnUNe2CGt4XOCkDoSg6tT4JXvYN5G8ot/5tJ7wW0L9e0lZOjtyaykqyiYiHO/JsbhyECSAPwYt4beNU7mBnsCi3M3aJB4iHHmhHsE1je0DbpCu672Xg3WE+uPH0dDIOTOsmTRcNYErcQNvroOhQdLhPaXYlIe2HCCvci9QmCS5FWxyp3GcyiPCyuMIVJcVFSopRe7G5aPdvmhJ8j5wIR+zhhItQQY8+ICPMzC2+APfL+XWvua0PiUYn+LsHguTxajAIwIfoqfpFvuc9ovTQZdBcX05xkWW5Qnpmoa7b3+8QP3NxN8hYaOxJVg8AfIBSuEBTubJy99sNsvr2V0TxQX+dOpKeys1R7XqxmNQP67OHzWrL/Rbm+omcvT
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 11:02:16.0561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bbd0161-9100-44db-491a-08df2b74f08b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7291

Hi George,

Le 16/10/2026 à 12:28, George Neacsu via B4 Relay a écrit :
> From: George Neacsu <geocausa@gmail.com>
> 
> On a Surface Pro 11 (Snapdragon X Elite, CAMSS) the VD55G0 IR sensor
> (cut 1, revision 0x1111) runs one D-PHY lane at 840 Mbps. With the
> VD55G0 support as posted, the sensor accepts the start command and
> reports STREAMING, but it never sends a frame and the stop command
> never completes.
> 
> The minimum line length is the VD55G1 value, 1128 pixels. ST's
> reference vd55g0 driver uses 1200 below 900 Mbps and 1128 above. At
> 840 Mbps the sensor stalls with 1128 and streams with 1200, so use 1200
> for the VD55G0 below 900 Mbps.

Yes, the downstream driver was designed to work with specific parameters.

> 
> With this change the sensor streams 644x604 Y10 at 61.6 fps, the
> diagonal grey-scale test pattern comes out correct, and stop completes.
> The built-in 2.11 cut1 patch is used unchanged.
> 
> Link: https://github.com/STMicroelectronics/vd55g0-linux-driver/blob/a05627b0f6d8775aa54b6fa306e91f425f2cbf9e/vd55g0.c
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>
> ---
> This is an incremental fix for Peter's unmerged VD55G0 support (v2,
> patch 11/11), on top of Jizhou's register-width fix (v2). It does not
> apply to media-next on its own.
> 
> Prerequisites:
> https://lore.kernel.org/all/20260918221705.323510-1-pm@petermarshall.ca/
> (and Jizhou Tong's "[PATCH v2] media: i2c: vd55g1: correct VD55G0
> register access widths", 12 October)
> 
> Benjamin, I know you'd rather see a separate vd55g0 driver (Sergey's).
> ST's downstream driver also uses a 1200-pixel line below 900 Mbps, so
> this is a data point for that driver too. I can test Sergey's driver on
> the Snapdragon Surface Pro 11 when it is posted.

We reworked the clock tree with Sergey so it may fix your issue too.
Please test it once it hits the mailing list and we will make required
adjustments.

> 
> Tested on mainline (62f482ff73bf) with Peter's v2 01 and 04-11 plus
> Jizhou's fix. 02 and 03 did not apply to that tree, and neither touches
> the driver. The receiver is qcom CAMSS (CSIPHY0 -> CSID0 -> VFE0 RDI0)
> with out-of-tree Surface Pro 11 board support.
> ---
> Changes in v2:
> - Drop the ISL_ENABLE (0x0329) change. Sergey found that writing it
>   does not stop the output on the Intel model, and a retest here agrees:
>   with the 1200-pixel line the sensor streams whether 0x0329 is written
>   at stream start, once per power-on, or not at all.
> - Link to v1: https://lore.kernel.org/r/20261016-vd55g0-sp11-fix-v1-1-eb14bd80d8f8@gmail.com
> ---
>  drivers/media/i2c/vd55g1.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> index ba70447..4e23e88 100644
> --- a/drivers/media/i2c/vd55g1.c
> +++ b/drivers/media/i2c/vd55g1.c
> @@ -76,6 +76,8 @@
>  #define VD55G1_XCLK_FREQ_MAX				(27 * HZ_PER_MHZ)
>  #define VD55G0_MIPI_RATE_MIN				(750 * MEGA)
>  #define VD55G0_MIPI_RATE_MAX				(1200 * MEGA)
> +#define VD55G0_LINE_LENGTH_LOW_RATE			1200
> +#define VD55G0_LOW_MIPI_RATE_LIMIT			(900 * MEGA)
>  #define VD55G1_MIPI_RATE_MIN				(250 * MEGA)
>  #define VD55G1_MIPI_RATE_MAX				(1200 * MEGA)
>  
> @@ -1245,6 +1247,8 @@ struct vd55g1_model {
>  	u16 num_modes;
>  	u32 mipi_rate_min;
>  	u32 mipi_rate_max;
> +	u32 low_mipi_rate_limit;
> +	u16 line_length_low_rate;
>  	u16 width;
>  	u16 height;
>  	bool bayer;
> @@ -1323,6 +1327,8 @@ static const struct vd55g1_model vd55g0_model = {
>  	.num_modes = ARRAY_SIZE(vd55g0_supported_modes),
>  	.mipi_rate_min = VD55G0_MIPI_RATE_MIN,
>  	.mipi_rate_max = VD55G0_MIPI_RATE_MAX,
> +	.low_mipi_rate_limit = VD55G0_LOW_MIPI_RATE_LIMIT,
> +	.line_length_low_rate = VD55G0_LINE_LENGTH_LOW_RATE,
>  	.width = VD55G0_WIDTH,
>  	.height = VD55G0_HEIGHT,
>  	.bayer = false,
> @@ -1542,6 +1548,8 @@ static unsigned int vd55g1_get_hblank_min(struct vd55g1 *sensor,
>  
>  	/* Absolute time required for ADCs to convert pixels */
>  	min_line_length = VD55G1_LINE_LENGTH_MIN;
> +	if (sensor->mipi_rate < sensor->model->low_mipi_rate_limit)
> +		min_line_length = sensor->model->line_length_low_rate;
>  	if (sensor->model->hdr &&
>  	    sensor->hdr_ctrl->val == VD55G1_HDR_SUB)
>  		min_line_length = VD55G1_LINE_LENGTH_SUB_MIN;
> 
> ---
> base-commit: 62f482ff73bf3ae88b0c899115527752cf9cbf13
> change-id: 20261016-vd55g0-sp11-fix-60bc64a59b1d
> prerequisite-patch-id: d4474f51d7a10cfd10a316ec2b09936490b14a79
> prerequisite-patch-id: 0017cc56bf769ab00e67bdc0c5214951447cb716
> prerequisite-patch-id: 95a2d9ff8168eb17010538d80f4b5428e2b7b798
> prerequisite-patch-id: e717e32eac916ccafccf9e7a552ca0030085daa3
> prerequisite-patch-id: 8fc4f7595aac33a2164adb41c139dc3218be5bc6
> prerequisite-patch-id: 52bde56940b545c0e5f44d12811f9b9676bc311c
> prerequisite-patch-id: c0b93409e330d4b874b3702d67b57e2c4b0bde32
> prerequisite-patch-id: dbc6f65015852bbaf31e5f4efbee52c60bafb79f
> prerequisite-patch-id: d5c9bb074014a20938df8b55bb9088aa7b26d37b
> prerequisite-patch-id: d1ce44a3f9104aeead2c18d58a1470d1bd1ae531
> 
> Best regards,

-- 
Regards,
Benjamin

