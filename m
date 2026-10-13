Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010031.outbound.protection.outlook.com [52.101.69.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5D33B059F;
	Tue, 13 Oct 2026 09:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883490; cv=fail; b=Se7+5CUpueTi9vmOdJPhPrIB3VkbQGOygoYBa+6syxr2ZuaG/sHt+ZuQxkk5xAsho/J9Kr9gLM6pp/GAaL6sjUaAXB06lOAImP9j46+Nh+D7b4CNsyW3zXzOmUUHGDrHGr6q5+E1879X86IHHWwcOgOBVotniPdvx5q+WqNqiBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883490; c=relaxed/simple;
	bh=MjkinQppNL9JO66RPu50rYk5eDIYudRoLVT5Mr1X9Yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dUVCOCfnH1K/1kUqiv910I5I5EqdRD/hbu0/J0MO+a5xqp73lzMatMBtQAHDimo6aF6GJujKjCF5Do+D2cMVKMwZlYneGvDnYlcQnpXsNgbapca6z4bzYijZNf9un4C3ekVeDTcyqy5OgvscytlCD2zVStSzOCjMSffp1WSqxkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ZQG8J6lb; arc=fail smtp.client-ip=52.101.69.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ZQG8J6lb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8u8rW3ijmAY+TIQQZJ2xqTZt/rLnPxVS0aUlsFqxyxmc8yjLZqU0bdbU5W+sVim0+q5hTFX70egnepM0aKkl2zIXG5p975FbG1wRdJcuivlvMI7kewFicqFE1ijkG1iOPtUFJy5CNpPFp6ikKWHzdkQvYSKCv5Q8kZ9n+rRybQzwnYn9S5/8Qb8pmiMV209HPHaKVZiaLOSOm8tEQ7tcano28Lw6ilDNgAWx1yVEj9eJpiBNUh/1p/8c5qd365ihKc+en/7RMOL8uIJXFDKA7FkRzmj0QFNT5uj66Gb1YPj7nMtQwaTdFsCmqT4UEmUE7AtoPPaa66NTsyysZfC8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+ilGe7K4dRbWYD332z8A4vCXEM/4MmvPiXmHTptAEg=;
 b=Tm4WhL2de1PvJaW85sc6Yty8idgci8xoI+d3h06J4eHpPhi9BjjLaZsKl/4iCluQkmSwoaoXyuc+ZRe8xBEXwkarPKkv8ede4b6s+BYecvIE7RCYCH3td8gAGXU5yLT7TBR0+xE8LrXyjRTPcGbePDqh+ZMONBPGJBaC+5uKIHyKprI3SoGrH/M7bb7A15NR8H52KkEU72Lnm1IL23nt4UmWDa/+mQXX/Q/rrgdEcw5I9JGe6JO2RtW+Gnw9l3PM0paB3GC6UfoYltLx0pLL/XQkMC++ambTUhnsMR3WfkFYIzCRSVd+Kmw7msOqVTi6BFJKirG/1cCELY9ETgN19w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=fqwqf.xyz smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+ilGe7K4dRbWYD332z8A4vCXEM/4MmvPiXmHTptAEg=;
 b=ZQG8J6lbuY7zI1oXKHwtSIDtkVjlCFabJCS42/aiB4tOZI+vVLiHDtTxUP4jpg2U2NVu3i+CVvyvpAIZDMhBwByZaZIeMduSoUZmAABfz+MOqW9PzTqGXM0EWer72K+7Gt/WgniiX2KVKLhU8KBWzj1lyU+vCd2fwfSUgvxBAFwN+aBSXRa18UsnTniIAC0q3FRij9T8ke1QDK5MF5LTdziAKvhPwxLemwhCSFEoRU6P245re7X7qcQesxGMElHuBlBvf7GlzYFU8in7LesLmHfT4vOgFtGVVMtHunKeJNwmLmIi1CmqnbtF2CT/K/KDje9RqDN5ercqk7wI4Awocw==
Received: from AS9PR06CA0626.eurprd06.prod.outlook.com (2603:10a6:20b:46e::35)
 by PAWPR10MB760928.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:3b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 09:24:44 +0000
Received: from CPH1EPF0000051C.eurprd04.prod.outlook.com
 (2603:10a6:20b:46e:cafe::86) by AS9PR06CA0626.outlook.office365.com
 (2603:10a6:20b:46e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 09:24:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 CPH1EPF0000051C.mail.protection.outlook.com (10.167.241.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 09:24:43 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 13 Oct
 2026 11:25:09 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 13 Oct
 2026 11:24:42 +0200
Message-ID: <029be84f-fe2d-411c-87af-ce7de8af45ee@foss.st.com>
Date: Tue, 13 Oct 2026 11:24:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: i2c: vd55g1: stop streaming after an
 exposure read error
To: Jizhou Tong <fqwqf@fqwqf.xyz>, <sakari.ailus@linux.intel.com>,
	<sylvain.petinot@foss.st.com>
CC: <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <010601a1332f1462-5fb80a97-80fa-4d49-bed0-555152da0354-000000@ap-northeast-1.amazonses.com>
 <010601a1333dc788-a5673ae3-b4b1-44a3-b10e-9698fc58f2ea-000000@ap-northeast-1.amazonses.com>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <010601a1333dc788-a5673ae3-b4b1-44a3-b10e-9698fc58f2ea-000000@ap-northeast-1.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000051C:EE_|PAWPR10MB760928:EE_
X-MS-Office365-Filtering-Correlation-Id: 933bcf3f-b411-4501-500d-08df290bd0e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|34020700016|376014|23010399003|82310400026|36860700016|56012099006|11063799006|4143699003|261009223027099003|10067099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	DgSqh5cMjN0+IcPEMyzfEa4FOvVRWya3t+P7Q5To+dAPcmexCr2dusxGhowGZDQ3Qw2T23eiSDX0+QcMbWMv8cE5u8mGxe0miPXN/aQVQgbqZkzOQBBr+ZoEugfKGmEThgdVgmWDHnFTXLo470XdNkpZ7otgA5/ibNfqnn94i1l8LYAtnI0RVTVUQWLNXiq2woD0FU7mwqeuFd7jWKmCWiyvhgfNW9KUNQZ6j+1yc5cPWf2tZVQPzcJsAZp5qDbNbzLWc/NSqoW7/WhIrhwywdD4gaBCxagxy2TG8GFDnRRYsheCTlAt4lJmNcD6/XFcdnRYQnOiNJ71rRbMjygXY5d1XNQEqeZynYuVYhu43UHsIFK5bdCeLRLm2ZXMqggkqeawlWFfjEYqPgTmJ2wRklHFdIu/lpZSAUeq0kBXiBvFTDB9WB0N3QoTGlsreRiflRdVJoFUD8veEnNEqdpwMkdQeRac3LiUp7xOzT9PyYnU8kfDL5BPgoWez9HW92QWUBfqvjNWI7zZUzegagqj3IECTL36TOsMnptTMIsSBN8Z+G8k+EO+cSfaoDEc9CmcL7rawKWaKAe57MJqnlyl3aIlPNJPUuSkgcOr0BXvicjcL/K13K7N/oDNwLZpCdbHL6J9n80zNHys9hrxCUNoYXDlUkSz7stB81KbqNqfpLdOmdcUKMUbyHo/9BgSz9JBbIpxZUR3aN3zAJGCu4csOw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(376014)(23010399003)(82310400026)(36860700016)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	68SzpPx6P6USLt1/CtJEkO9CY4TtbmlG9GP8ZG3W1x+OXHPphlmgazFjcVAmRrTuLrvwWq2coTE07rJ4DZ11WAKZIKZ8MIyaTU04sq1xnrEC221YwqSdGQ6E6+dRevl03Mb2KBID0JIti2EZIJVqIgzudtEnfxWfBoZTjeg8F182mLy+9Y9PQoY+1+7Jpj2OK0ndKUbblJzwahNOoB7r35flrmlzdn5bojtNQIDzKZF8pF6JqizC9Rf2A6RVhqFEps18aaxTpOrEyAyOS2nM++pbqDluCc8lFzXrjpfW6dMrcHOgtTWAxGqgEaaYm1jjIW218zUhQzeV4LlIMvQWZfXlndALE3MrQ4f3pzb/Q27FhHkPI1N3FAoNuC5hJwJ6QXFn8VlAQcQq2Rtb665Ts60kqAJ2mlRGV1naaXVeHBGf3fS7mlgsxvOSewhux+Wf
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 09:24:43.4771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 933bcf3f-b411-4501-500d-08df290bd0e1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000051C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB760928

Hi,

Le 13/10/2026 à 05:10, Jizhou Tong a écrit :
> Stream-off saves exposure settings for the next automatic-exposure cold
> start. If that read fails, its error is passed to the subsequent CCI
> operations, which skip accesses when the error accumulator is nonzero.
> The sensor stop command is therefore never issued, although the runtime
> PM reference is released.
> 
> Log the exposure snapshot failure separately and clear the accumulator
> before stopping the sensor. Treat the optional snapshot failure as a
> warning: a successful stop returns success, while a stop failure is
> returned to the caller. Completing stream shutdown takes precedence
> over saving exposure settings for the next start.
> 
> Signed-off-by: Jizhou Tong <fqwqf@fqwqf.xyz>

Reviewed-By: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

> ---
> Changes in v3: reference the CCI error-accumulator API in the
> stream-off comment. No functional changes from v2.
> 
> Fault-injection harness:
> https://gist.github.com/fQwQf/60bd12627e06b10a2fc159e545f85dae/7b21a7d3a1b676a0e4cdaba06168ede09a2949e3
> 
>  drivers/media/i2c/vd55g1.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> index 78e4aebfdd3b24b867ea4d077dc1b676c4a595da..e78835f014e65bfc2b3dcc2aaee7b054fb5da390 100644
> --- a/drivers/media/i2c/vd55g1.c
> +++ b/drivers/media/i2c/vd55g1.c
> @@ -1190,6 +1190,14 @@ static int vd55g1_disable_streams(struct v4l2_subdev *sd,
>  
>  	/* Retrieve Expo cluster to enable coldstart of AE */
>  	ret = vd55g1_read_expo_cluster(sensor);
> +	if (ret)
> +		dev_warn(sensor->dev, "Failed to save exposure: %d\n", ret);
> +
> +	/*
> +	 * cci_write() skips writes when its error accumulator is set
> +	 * (see include/media/v4l2-cci.h). Start a separate stop sequence.
> +	 */
> +	ret = 0;
>  
>  	vd55g1_write(sensor, VD55G1_REG_STREAMING, VD55G1_STREAMING_STOP_STREAM,
>  		     &ret);

-- 
Regards,
Benjamin

