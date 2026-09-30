Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011056.outbound.protection.outlook.com [40.107.130.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF073ECBC7;
	Wed, 30 Sep 2026 11:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767645; cv=fail; b=gAyFJVZKMQkb5WJaWUZLtPPqO92GfUX2iDRmpfCt/znJKt/wuV/nj4DyMa1GzRN18iyNUIRkp4HckPEqrj5iYjr1BU4GgMoHJIa1/Kl5zNKktVKnSIvtdLFZLoG+UuUOKFrGTfm4ZV5btfX9glHk+OOnzIzEZN0XWEqqX7dn3jo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767645; c=relaxed/simple;
	bh=BY92gyEgRZJFdK7yWCNUmNenkCuYF6jLSps3cV4LQhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y95JZO6935LY/3Fn1rSHqX0VEvGLsfuNzKKRBnEKRXJCf78wEbfp2E+CEeLQqFMHoEU56wWStnPZasuHx34NBt6QOa70hnjXvjaJxDCHwRGX5tlpjiGmnPbAWioSiBfZa5FFrfhSphHJd6JPIaVXk9LdvucFzuClO8va2riBc5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=hGLVXjBr; arc=fail smtp.client-ip=40.107.130.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="hGLVXjBr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVvnqfUrYMfyg89UXkW+B2EvZwcOEN17qEenG4lgwCnClCxWGBFASH7fh0BV9cThMuUzSf9vYeNtFj8CfF+MaurIGNU14pFAMbf8e5eF9EJtVuCBoMKOCbvAF4LkvRtHl3m7Lgdyv2x7WN7+mTA/lZ0pbUVzlvkgwVTJgIuxbi6AqceNUrIT8j7F/5yIPnyyNIE2ZNc21qojmjg/LdOFEiaDT4wFV42VQeoX/oh4DsF4ENN3O5/Ukqcxkr1L32jXxAQvtx2pEvLCAuBSdRuXiXuUzoQUixzK5NDp8k63MdEOWIXBbX6heETo0QVienCJE4na4stqXlzZLSPyQoOXsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYXWdMLR8iugqleTQ3LlFZqtwoT5q1dXxktEtIFsP5s=;
 b=e9KmehzmCeJD18brj3JCBYYNiacE+BdX4LArhTHmrccnuM4pjmbWucr3miQNhw952kTv77ANCM8aI26I7a1RMo4SPc1O1l/bO9TW2E4TNAUJ5ieWY3V1BGtOZ92Q4Dv9mLBrMpe7R714Djf1kq1VKaMLA7KUcXuW3wcJXlaUXL2/c2RDaXmhEmav+auM1nwIFirakKzU268DNvwGdXanlHrCdI4hzdC3k4b1/HrpMPo1o1Xjf4XnhvRZRA9x63bUFtzginnDWFazm23SunSF1PwHqixg56Z28b9eqLGhoxaCKLKzJDkZqSpWusjbZBLETfAz6fWePiqo9vr/2UQLPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=fqwqf.xyz smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYXWdMLR8iugqleTQ3LlFZqtwoT5q1dXxktEtIFsP5s=;
 b=hGLVXjBrQqEV8Ua7jmSg/KJleCA2lgdGvRjbExW5PLkxTjIxGbO88pwjaHrivHtSciShx+piOCLCQShuW/rIatMjvqmzko1dezhRd1FmlY/I96VZFE0x5UetgZesZFHiDRBUqdPnyEivYTBc1Cr3dfO8i7lAli7XAEIjx4MXtp7U4wuVNI9QMJsDkopzfvI6sc6ngGBk9aJ47GMZqKKP/exRwXTC4fBuo6yzMV7SFp2LcS5RM2Q1MZJuFy/3dtejYscqktnznQNFETtDUTsrGJNIEU3BHMzxpef9vq2GgySMvAAy0RMQthXMH0npAlJgK6cMid1T2A/R0Wm12UM6Aw==
Received: from PAZP264CA0181.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:236::35)
 by VI1PR10MB218467.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:174::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Wed, 30 Sep
 2026 11:27:20 +0000
Received: from MI3PEPF0000855B.eurprd05.prod.outlook.com
 (2603:10a6:102:236:cafe::63) by PAZP264CA0181.outlook.office365.com
 (2603:10a6:102:236::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Wed,
 30 Sep 2026 11:27:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF0000855B.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 11:27:19 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 13:33:10 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 13:27:16 +0200
Message-ID: <cc54c76f-5f56-4f48-b05e-b740056fe2cb@foss.st.com>
Date: Wed, 30 Sep 2026 13:27:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] media: i2c: vd55g1: preserve the stream-start
 error
To: Jizhou Tong <fqwqf@fqwqf.xyz>, <sakari.ailus@linux.intel.com>,
	<sylvain.petinot@foss.st.com>
CC: <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260930070802.102127-1-fqwqf@fqwqf.xyz>
 <010601a0f124796f-bedf55eb-df52-48e1-ab13-f59cd2dea8e0-000000@ap-northeast-1.amazonses.com>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <010601a0f124796f-bedf55eb-df52-48e1-ab13-f59cd2dea8e0-000000@ap-northeast-1.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000855B:EE_|VI1PR10MB218467:EE_
X-MS-Office365-Filtering-Correlation-Id: f9018e65-556b-4acd-dc17-08df1ee5ca4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|4143699003|10067099003|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	R4mTsxlMJHi2Fj1uhv2un7EFk+bV886UoRsRSRc6IJXaJQngUdDv2XwW+D5UnedDjavrcbsTrck1oiOqeNQmsDEqA+X4CyYkiP7V5S71WPccE0FIm8UjhM6x938eM/q/rgu2o6tmtlPmHUiKHLD3zS8L3wGg9tVPim5k0yYtFFnWN6JZjf7jXiis6kNP5pkGkNzOegMxmYc7HdXYL695zNYuSCs9FzQxSSDllve2nkj6u2pVkeeyRU8KnX51y65HSSXzolS7jRluNinf67GgVu0lhP8xYDihd4bGPJmODlMt7jzSovYzDdK3wPUeMQEermLvuABLixFw2NMaLiaGypZ+XroJkO7Pcj6FrLJ9xqMt3FnF2hgSxsJTwnspIr4gEDg/u0nqn14c7n+D062MYla2397Q+GAoRbV6JSym7J5Ozy41rbnKSeYQHOWqoDFj9p6cRbDp92bzU3HfvGZ1zf6KEVW95KolaEo8rypyKVkPIBZhgcB/7f+OXv1eEEZKwwpYqsLutSsz9FIPaMoGn4ravvQddsNKyq4/W8lgPR/ccGvTmVBFnpPU8RjyDKGOsu4rSn6y0WLIbK6frPA+tr40KWAnPFVUmJFx0rUD94292+BX+qRtQReO44vu7mWkTMG63S3jnXQaSYmBxf7bL297wO0kr6YETP89v4/uVVrnKgvCypjnRBleWByP+mfGL7w0BQpB5JHy3/ACCU8xUw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(4143699003)(10067099003)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FFudfRnYNlCG1hTxb9+YS9jhsivZFs5MH1avjZaJfcCJCXKUMcyyiyHw6NgrEQOb+gcJ/w1oOFSE/e4jvVirRgJo4v6lIg32kwA5U8E1qrfL6S2fZz4Bc/Sx+cNFT7yXE+7WziAgNxIydZQ+rudrY1CpIu224xmcAgchbsxRxII+mH1Xa1p4ewzNvkWLq98YQZxJRc/lHJwTc+GT+5CqxF0Oh/lw/qOfICO83MzzLPAJF3lnA41NmAPMRIsCUj33L4KXz2nZROfwlJOdZruyzFfuJTZ3H9FdkPL1K68OMAd3ktS48S0OlrCyIcsxeurpzLtjvxI4HdpnX3YUCWUMWOA1TrSoeti8F99MQo2G9pwv/dppIsdz45RURhMpKCWIrsOaTZf/2vZRXtQSvwrC6Qdvk/5IloweNt7i6s5OT/Knt1mHcOIgAHWBp2KKWQCS
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 11:27:19.9751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9018e65-556b-4acd-dc17-08df1ee5ca4f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000855B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB218467

Hi,

Thank you for your patch.

Le 30/09/2026 à 09:08, Jizhou Tong a écrit :
> The stream-start error path replaces failures from register accesses and
> sensor configuration with -EINVAL. This hides the cause of failures such
> as an I2C error or a timeout.
> 
> Return the saved error after dropping the runtime PM reference. All
> paths reaching this label already set ret to the error that triggered
> cleanup.
> 
> Fixes: 5931eed35cb6 ("media: i2c: vd55g1: Fix return code in vd55g1_enable_streams error path")

By adding "Fixes:" you must also CC stable, I guess you can just remove
the "Fixes:" tag as this does not fix a big issue anyway.

Same for your other patch.

> Signed-off-by: Jizhou Tong <fqwqf@fqwqf.xyz>
> ---
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

