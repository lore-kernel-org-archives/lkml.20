Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794320426;
	b=ei4VeSRsZprLAlvQIFWxJw+bpbI+aLLoVFJ1nmVghANB3Kk0tGxuo+oqwf+OLo8isfA5
	 h+42/txOrb+5NzpNrQH1ExxcAJCFAnk32acNQJW0mEcFaw1tvyRf3J+dPOZFw4FGOUW04
	 Y3hZeIjD3Iws0+pb+/3kMXcLOKpBmfOtFbMpQ+RoViRmwoWX4hUi5PCzILM/c5Ujj1Pwn
	 nx13zx2e1banzNTFSocHt0/js0dHc7U/XVTKA3SUFHDcOlFvIYa8r57adLKAkHIuYUjq5
	 tPvgrNIpSiY2dtoaYAyoY+dZOF6ZIxIzVeDMiir7YKlt3ijXu7ExQnSijqToaE3KNiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320426;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=28+70BB/vqFkrOTl5aGj+wmLYtgO03wAwUj90WH8apU=;
	b=VrzQOul+zTnz2ZB+0GfuxuLK5yXTaLlSz4223hdtn9nCk6K7tqPwArb/g6YG5PspZKSB
	 7pz+kSMvxVb0CFXsJO9pO71grviyEFpva4RcprgBek30fVAJFPiFAp8zTtyuMjdnHWDeX
	 KzHi0ZI9v8GV1tAud0ebSvHsh10Iv0BzMLEjXwvx5Jc06tdKBDShP2qcSqZtYQlIIzzo/
	 G7Q/Qu7i9I+mex00eL+yBncIo5ddyBE1/uVcJjoWs2ETuA5cVtZ1yNlD/tt2IDDXod1a2
	 fj72mM3t7EGruzJWmD9Qn06IfCuT517BTzWcV9IPt99VoU3XZlNHD+jI7DEomMF9JQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=evQdWX2F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.0
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013000.outbound.protection.outlook.com [52.101.72.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEF5606A321;
	Tue, 10 Nov 2026 14:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BEF5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=evQdWX2F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzjUtXuEG1KAhr8yuOHGhjJj1/SZTsq/vAha2hj/iLjWK34M+t3ioqZVj6mSgev93+yLYLr+lp2Pzl1RUaFbg0A90CgYhdc865LML8kJ8Ha+4Asd8lhZELZo9i9dn+TCLtl6qCZjh+K5xJT6NMhUDvBWmHOX6yJqKu8zuwaj8eBytgbWkkbPwlW3WFvkHiAhTCE96ZdsqDENHeywGulN9/06CF8rGP+bYxurGv4Bwe2lRNZKJWHAEVoeKe21WXmTqPR4lpa4skEazmM6Od7nYs1VLg4KbV2AZHnf1xOmzojDDY2fVhlgyuKaE+BXVX0KVQ3OaOV4D0NByPycCM3ijQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28+70BB/vqFkrOTl5aGj+wmLYtgO03wAwUj90WH8apU=;
 b=HDKrP3mUI5OH/fEKBezsipYh4mNbPR16ugCviAUcgq5U24oNnPi/zdozbW1iSKpPyNKJX7I6jMIt3LS73vAicN2XJyTW+mYCAJDTydQJq4UQ1Eyk8rBJ0VynXEO6cewjMsRfhRsE9vsUW3S0Bfs6REAMOdte4396NMLp4Zzs1R/C9ICYO8bXVKlNzr5/N6tGVHYKEBi2vwtzs/jZJc/t0gUQwRGp6jVoOQpgwy6tIs9TCIAgI0dOhXJuYAWXup1MhAJEXYlLoB1JqMvBekkQcwDhFLDSl4e25AgvnDAXUoVregnrHg43Dmdr0BmpWXJ8B+7w0HD58y5hWVTklTSBDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28+70BB/vqFkrOTl5aGj+wmLYtgO03wAwUj90WH8apU=;
 b=evQdWX2FVUjH12672dfTaxr7+FgQ6axQMdJQ55YWXxOnkp6cRKmFZm5G5fy2sD0D1pbd30VQX/OHRjG8Bjdej+LFV3hjEy9dNygLi8UbpRtlm0tpDzcqh6eqwAtHuHFPkpH4Ary+eTCiU4YY6+fX6N0Jxduv/RciZCPnT58q49OzkAB1X5B/zf84cqQUnoc3qbEJBuRx5eFlGjro2Ba5wwwkqLr6g7NmyaujDBXYrxQ6ZHEupwYOff8GyD+0GnMmQlvoNhei68Q0Vh7oyhbkvWuO4sV5f/L2Xno+NI7m83xsWIkz9P8fpiSZcL92qWEIJj7wywOEas1lU22uPKJHOw==
Received: from DU7PR01CA0045.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::18) by GVXPR10MB9105.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:1e2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 14:20:20 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:50e:cafe::39) by DU7PR01CA0045.outlook.office365.com
 (2603:10a6:10:50e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Tue,
 10 Nov 2026 14:20:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 14:20:19 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 15:21:16 +0100
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 10 Nov
 2026 15:20:19 +0100
Message-ID: <e43e01a5-4121-4ca4-8216-8f20728759d1@foss.st.com>
Date: Tue, 10 Nov 2026 15:20:39 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: i2c: vd55g1: remove redundant
 pm_runtime_dont_use_autosuspend() calls
To: Joshua Crofts <crofts@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Dave Stevenson
	<dave.stevenson@raspberrypi.com>, David Heidelberg <david@ixit.cz>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261110-media-remove-dont-use-autosuspend-v1-0-cc07e71b30f9@kernel.org>
 <20261110-media-remove-dont-use-autosuspend-v1-3-cc07e71b30f9@kernel.org>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20261110-media-remove-dont-use-autosuspend-v1-3-cc07e71b30f9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EF:EE_|GVXPR10MB9105:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d54cc1-099d-41f2-d0fb-08df3f35c03f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|4143699003|11063799006|56012099006|261021123027099003|261026121527099003|261022075727099003|261009221727099003|261009221227099003|261009223027099003|261009223327099003|261009220027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4jZpNLzZ452u/FycLW1ro0gm/ieVsbyM11Xuv9N9a+jM1StW+ra32xGiolkCdbsbPBopi8LecqGcQ8egXx/hzdGHG63jcTbOvzkMpgykWvsK0JCSdKNOcdosdHwimagb1Z0qHTQl9qqAkL0/D8MkF1s0M9+R8GnOGRZ/2qKPqeyBij5QZYY7+Gm2ASsLfp42ndQYMOZGvsuHcY2UcjZHa1/RV0/zVeL7koNjki2v2hwc6dk5wwcyklhxUWli+OoChizetBp8p+m+3yp3U/+nbu7WB4sNVX3exW3hMW1MGHhX0mGko4JSgxapBsfjw99bESHx0glAQDyO2X5EI2fDK/rD2T5XKRZI9NCR/ZV9BQxAFSTQrMOG0lZFCbcszuekGcsVh5Y8/PwzLun6IcP0KkDsS7n5YcaSHs288Sg7omVXkF69GL8w39uVl9/r7KfhudqikYaaPpYQSkNBQgLp0+Q4On9kafQ5kjWnLvOYRptPFtxS95/dNUvB6cOuh6JPNYEABEs92py0g2cvdrEa+p4yy3yzRneSLyTpd09IIpl6+Dc+wzBi+k2RsO5s5kiCcsq+7/pczv0zUGcSgIM7W0ALnSHPiDXgUEcd2yqen5ZvJt1FOgX1JYAOx07b0966NEjra/MJPAbRPPG9UQeh6cSN2cIY67dOVl5r/3aBUYthzKsRO2ARrAnDI7ioMmgT2TRk8Yh31OxcJH8IAo+yaw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(4143699003)(11063799006)(56012099006)(261021123027099003)(261026121527099003)(261022075727099003)(261009221727099003)(261009221227099003)(261009223027099003)(261009223327099003)(261009220027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1cIV7cWF9sAbXHPtwNQt8qj55V8Zuhpdot7yPq7oMLiRZREllyNqi/0zGDHJiR6FH48BEpoSq+E86+Z5ZpANlnRYoVT7sYzJPH5nC2swJcvDaHdc4PnW7Y0DsIRc4WF4oAXONCVSPvNrC6KRYjl0ckLZwEqZxT++5nu40TRAbj0VQO80unswTyoGLaDHGrF52CA2DVMZZv1M1Ohsm+tmQm1y6xt1J1UwIEL7pya0xPzDbMBLdz89LycsP9451WtInbglTMNy1p/rncfk4+Bv5v1wmPiEhPKGQ7uoSEWmo85e3aR+onRv2PwqYMGTI/UIOtR5yeBvxtdLtNZ3yyPhFjqhOEoeeBhoguAIV66faeRfOIoMwLwFOwhG/hR8T6I1v9bw50PcHTojDud8SQw56f3BZPGd5mEO6YHLIHdQUu9DmNSfMrjgxHCRCLGi3+Vc
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 14:20:19.9975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d54cc1-099d-41f2-d0fb-08df3f35c03f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB9105

Hi Joshua,

Le 10/11/2026 à 15:03, Joshua Crofts a écrit :
> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
> 
> Remove the redundant function calls.
> 
> Signed-off-by: Joshua Crofts <crofts@kernel.org>

That's an easy one. Thank you.

Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

> ---
>  drivers/media/i2c/vd55g1.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> index 3a3ce32b0610eb23d42b622f2173a505df120176..8ea68dc9b1d99d11a7678138a5b6f7147b595f0a 100644
> --- a/drivers/media/i2c/vd55g1.c
> +++ b/drivers/media/i2c/vd55g1.c
> @@ -2053,7 +2053,6 @@ static int vd55g1_probe(struct i2c_client *client)
>  err_power_off:
>  	pm_runtime_disable(dev);
>  	pm_runtime_put_noidle(dev);
> -	pm_runtime_dont_use_autosuspend(dev);
>  	vd55g1_power_off(dev);
>  
>  	return ret;
> @@ -2070,7 +2069,6 @@ static void vd55g1_remove(struct i2c_client *client)
>  	if (!pm_runtime_status_suspended(&client->dev))
>  		vd55g1_power_off(&client->dev);
>  	pm_runtime_set_suspended(&client->dev);
> -	pm_runtime_dont_use_autosuspend(&client->dev);
>  }
>  
>  static const struct of_device_id vd55g1_dt_ids[] = {
> 

-- 
Regards,
Benjamin

