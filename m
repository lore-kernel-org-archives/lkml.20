Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011027.outbound.protection.outlook.com [52.101.70.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C541246762;
	Tue, 13 Oct 2026 09:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883487; cv=fail; b=OVm28cW65L1x4aw76u7TGNRU1NW9Dp2h6GpE0Gs5jMhTLlH6qlZBnK++rjR55hS8vBdSjwFAdGdokbHBv/A+OOMdkJDZPt7P2reBisfz1fmJhxmbsxZvu2Tpm5JTCIS/E/ItqH91c+ktMXWdjor9Owhw5rW6N6o8yEdJx9/bKTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883487; c=relaxed/simple;
	bh=/UJ0ZyiIzd13euooUMtaVUefCwE7T70rTOwP6Sr3LCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NTqE7UeAQeyGCw7vkhbcETnKzysaQllUUxmVd/XHkReo/SmmTx13FlMMzdJ1I4Ik24KV0+MaBhQRLNydhp4AusAPVo7LoOhQHTXPdXyNoGdHr4Rl04rL+IU2o7fsqCbY7DUkK+Px9fCUdJ5RzK8ex70oHazY9/EfEEuCOOWxbCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=mQigTGFL; arc=fail smtp.client-ip=52.101.70.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="mQigTGFL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+niBT2N4aPIhwg2hZLKE4ry5lS8lYuuW9BZY7zagxGem9kYkek6iGKkYncH2zkTz+Dayo+UKp7Ti+f3XT2zdreolP8gT80IerAvwoS+nmjjJhdU0sh8WXRJhJCiTR2eqFCR63KyTwYh3UaXffkY/TcYjbngmIVgusSW3KATz04GUxaLU14/xaQ2NUyaHsQEKM7BusGFcCXbZMwAVdUCnv/IRzAr3IkE3by4pSXbd9Fc/kccJce+Y2lQELoCxHBuM4IUX09XZ29CibB4oB3GHgO5vC/xYpF/ObyXiFZZZU/YDy1R0FyCsNbd1i+7IxxX1rIuaRPq7oZhqXGmETKG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNMlRjKHhydOp4cPTXvBqqKCKthtVg2L6mMtRcf2QHU=;
 b=v7gYwSDw9uH/EEI47XUyQ6cLaB0Kv+K27qnhBHbjLB0TljpX4z6usNQOSdFGGIXR1wUuASY3NBUjh79ljOuXoYS6oJ5Q4slndi7dVpaSZr9DzzlVIu549JzUjPiMV/HlSE0v674GZPSYp4jFDj/Gsec8N5xSU7NYS6HUAXTo1s+g3OThwSongXfayxcGY8RqBLuUXrOrJmy2N319wSaK2s9/5zFIOGtuKRYua32rtY6vSiqWaka/apcJQ3VxuONIEzSlYsQwWL+utShLhEhLGxLBl3GNx4S6Lkw+XqIAzzwRNY1Ua/uqlyFMd5lhWOCf6DWL89JS2kmkzl6491bVPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=fqwqf.xyz smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNMlRjKHhydOp4cPTXvBqqKCKthtVg2L6mMtRcf2QHU=;
 b=mQigTGFLUXnzxoTJgdMHKFADer+s+BDlkDrJtDndyhh0201yqkXb10t6FNteaXK5GGgVMl2jCAWcXwXiU5GO0y05KTAMjKbTiqOeY07N1uq/GGcewe7ualZQMgNyUt7ywuMTA6sTMmDcOiU7awp895QCZXHi+cNcXabfzUJXXMfEZddjcTad8b3Ctdoejp1O2gofNL0SYGaAZnAgvAGg3ywLVdLfTD60WT2KXHqyycn9NnBurWzwtBMMOxyi6Gwm95RwGvpeFLseyfaGE2mIM8McBPqFFA+wZzU7wEyWx/X/Z/aCVROoWWz9ErUjKj9ed/s2nJQHXshg/PNwSavhjg==
Received: from CPAP307CA0008.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:3::16) by
 AM0PR10MB082793.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:7f6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 09:24:41 +0000
Received: from CPH1EPF0000051B.eurprd04.prod.outlook.com
 (2603:10a6:380:3:cafe::9e) by CPAP307CA0008.outlook.office365.com
 (2603:10a6:380:3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Tue, 13
 Oct 2026 09:24:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 CPH1EPF0000051B.mail.protection.outlook.com (10.167.241.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 09:24:41 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 13 Oct
 2026 11:25:07 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 13 Oct
 2026 11:24:40 +0200
Message-ID: <791913a6-8250-4c9b-8bee-95703c490bd7@foss.st.com>
Date: Tue, 13 Oct 2026 11:24:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: i2c: vd55g1: preserve the stream-start
 error
To: Jizhou Tong <fqwqf@fqwqf.xyz>, <sakari.ailus@linux.intel.com>,
	<sylvain.petinot@foss.st.com>
CC: <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <010601a1332f1462-5fb80a97-80fa-4d49-bed0-555152da0354-000000@ap-northeast-1.amazonses.com>
 <010601a1333dc2ae-f24ce995-a0a2-4d38-80a6-43a3696713ef-000000@ap-northeast-1.amazonses.com>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <010601a1333dc2ae-f24ce995-a0a2-4d38-80a6-43a3696713ef-000000@ap-northeast-1.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000051B:EE_|AM0PR10MB082793:EE_
X-MS-Office365-Filtering-Correlation-Id: 38601707-c692-4872-f652-08df290bcfce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|34020700016|376014|261009223027099003|6133799003|11063799006|4143699003|56012099006|22082099003|10067099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	ZOUDC/H1RWeA7/vysDzF3pWOcSZr50hvhoJ9Taq99A4jLTnC4YGTO7/A1E1wmHqN63j0PPM87++ndBVtFtdanZYEk/DJ6TQQsABm/tBpJbotwyRwIvUEkz2/SRBWWWiNk3qCM+EgdWPeV6p9m/fhHdnVVeK+atxB0hYBvPQ1MVXYSkHIFDzSgpZLSpcbz32hyWZ0px5HnGZ0qoek4leceD1qnobGJRl+SKlecvlWDNLDumbpzm4LLXDITVp3nGBUjbRm8mteqjbVfz6Br+ICsFSccLEtisFU12svGL0vace8F/XDFVlDQeiZfXbE7fF1TRtrSzF99ZD4MDmpFg1gwoCTugioJ5z7oESmdsZwtK5jeX7eJc5ijZIFxl8BpGjBaD7kV/uVobmGyy0S0jd/RZpsxoNGTV6wEl5kCj3IRP4423bhbwOnRCdY15vRLl0xg3LRZU0HJwmQNLE3ExMnhIHv6h2WEVrqT/0zEMPiXmqTrO59sOBS8Enl8qVLliFYCY5069W8D2KNP0zvEyePEbsH+EnYRncwnit/u91DfDew2+fZDvV8vR8am6JWDiYTLqFXy3nFFJ/RNrFhSnLyce3iaTx8QapArLQw3bcyrU0Vl/FFxW8Y/ota/RodIKKEKSnTypY0ZF26Lf4epwAfo1TrK6l07BYRAU73lu2VcwtjbkY8UlmM3mt9WpW0qJCDxVwhXJ3uyIYQ8Aq/bWINUg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(34020700016)(376014)(261009223027099003)(6133799003)(11063799006)(4143699003)(56012099006)(22082099003)(10067099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yI5qwtTapFp7Faru7qrzrqQ2b9XncdZmTIejsNzM6D+3Nd5jxGpI89WiYPuvXqrH8djuJ4LiRkhNX9Pscwnj+Cq+vourdnYYTJSfm+WSag26HBRIdr28JJ7pjaRXri21VSao75AjcTRCyywXpeTvAT7A9tnzZbxBuSVGQ4RcyP1sHfM+84aD4garzEaaXunTflxZA32TAPkrljBm2iOHVbLhwvkoQzMWMD0gQweQpov+LUjaurcKmtch698N/w9Skh8dDmqbXHjRBsEntycbgPKsrhnQDFiW4FrTy0HQQ7lFVe4slP4bZVz+VSchjRAu5tcBAXpQm+6m4gFljl/aiNk2PgdQ48NiyJ4jmpu1WjwV3kirnNoxSC8sJ6aWZCj954c87KjnP4ak6Mm0lXBdJwrgmbpEFTgF/CcrPDFYWoqP5RNJdz2yCdAlOMo7G1aj
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 09:24:41.6900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38601707-c692-4872-f652-08df290bcfce
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000051B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB082793

Hi,

Thank you for your patch.

Le 13/10/2026 à 05:10, Jizhou Tong a écrit :
> The stream-start error path replaces failures from register accesses and
> sensor configuration with -EINVAL. This hides the cause of failures such
> as an I2C error or a timeout.
> 
> Return the saved error after dropping the runtime PM reference. All
> paths reaching this label already set ret to the error that triggered
> cleanup.
> 
> Signed-off-by: Jizhou Tong <fqwqf@fqwqf.xyz>

Reviewed-By: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

> ---
> Changes in v3: no code changes from v2.
> 
> Fault-injection harness:
> https://gist.github.com/fQwQf/60bd12627e06b10a2fc159e545f85dae/7b21a7d3a1b676a0e4cdaba06168ede09a2949e3
> 
>  drivers/media/i2c/vd55g1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> index 6f458f611f63451c97c708e187a313cf7b2aab4c..78e4aebfdd3b24b867ea4d077dc1b676c4a595da 100644
> --- a/drivers/media/i2c/vd55g1.c
> +++ b/drivers/media/i2c/vd55g1.c
> @@ -1178,7 +1178,7 @@ static int vd55g1_enable_streams(struct v4l2_subdev *sd,
>  
>  err_rpm_put:
>  	pm_runtime_put(sensor->dev);
> -	return -EINVAL;
> +	return ret;
>  }
>  
>  static int vd55g1_disable_streams(struct v4l2_subdev *sd,

-- 
Regards,
Benjamin

