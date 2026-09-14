Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011032.outbound.protection.outlook.com [40.107.130.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04C847A89B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403388; cv=fail; b=PlVt+A5gVgoatGWeVGueXo977GXX7SrjIvv0X9Dg1KWRnvTbQ/j6Ypdo/vLrsK2ik7p4qwinzYMSlnmH69FkOGb4uQD4enOelBzBrjZRSNQuRKYypBpO2P8b7E6871Nkhvj351FJ7JpNK+cpsAMuiWKxDRgW1L4Df6fbWWWoRhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403388; c=relaxed/simple;
	bh=RoCLYMi3ZXs6yYqt7t4LRfc1jEO4zt2zA00LZUAJOMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EYPWFCT1uICo72WPOvqG7nRXIVQDUOfDBoym/5HufBcDQpBw6+0jwCBGMM5Hw9g12wCODQ99JjGGN+dnIb3O6aIkHgDZaK7KbhLLlFambrupUl40gVbGIi8bLHlBtpdyBhNWqb9R+pHXmi8JvbSq1TAQi24tPgO/ak20/A/5oFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kn7IEt3p; arc=fail smtp.client-ip=40.107.130.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kn7IEt3p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbOAeSIh1imSgJiGLOBJ9pNSauV9jaGr6QBj45aNwYxgZqKAF3WlWCooiH5Z4cVoSgMSL1gH6SbTlCfdSTl4kmpUGSRwyMKTwFSFh/BYfSHZAiq+gHe8+HM0vwecBsnCWuJPDn6VzKPMQWMe7W0kX1DGD3rOyXMVGDKebwLXSKRPF+XQf0fEOpgA9+9N5UhqtPBAbIxftaQoYakooQzDSquoFcvKcm0t8Wr1ZZcmNlIlY+qLgvWdg9AO9dvci1o8lnh7cR8acZmaHkniyR6RHls+IV8KlzIm4eDDvpYyYE0Al8rReI9Ot+vcABfkY54voDXEAm3CZSqpqVBvb0gKFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omEXlBAnZqdS8dPOPU2KBNnupxm++q5LolBuV5wbSWA=;
 b=iqWoWiPhrvJ+qeDxXDcRrW3hn9Bkrw0+HCTRwCPMfEJdQXYgKTHm5zDuoudxJnPtOLPH8opu2ncWACCBG5/6B4Mf6zAPXjBF6loiQVbGn8lHq6gDnP5D17v+2NNTwVyjR9hkGrZ7hmPqx3VXGgQnRdYc6cFssLQzR+iXfaRR66BxRIYHc0lpwDvlkM9axtK7Yir9wjTPXjx+d1onlc7sJSQaS4KEOMKEdEsKTG8+kgq8Vr+m5kaG2XC8gPtpHMIEfbNPWnNrZNL5/XH0OvfBTzGdRtiSXssRxl7scdNaTpf7/oky53QZ+ZBWjCbJhxdLe+ldhzTQ6xhej0KHd22KWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omEXlBAnZqdS8dPOPU2KBNnupxm++q5LolBuV5wbSWA=;
 b=kn7IEt3p8zTFyPmCUi6zNxBO2XfTGUyWliFjFNjGT4BuwQKFplFnltuVKwmQ6Pb9NcMhbk2iXIEJtVA/Xp9YHEY8MMzH92YhXhjqoQJfdxG1Fxwai09r9mY6Fmg8sZWRBDsFwkNLqullzc6xxeNWhgKFxlbVYdZBGNhD5kRLZzsvcq4kA79fvrepthswCpXsOUVoBQbe3WVahF3ORuTD72CxAroUrrDRn7KSf24RWY6rnvykooVx4LNOzL1k90zSEgqou2fDM2vAEc+kev0YUHRyg0YDSok1NJkxAjvXBgsu6jMNiBSGe0lZYPwaucPV4b/oNpcnf8gWUBwIuoUhSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VE1PR04MB7376.eurprd04.prod.outlook.com (2603:10a6:800:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:29:44 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:29:44 +0000
Date: Mon, 14 Sep 2026 12:29:36 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/17] i3c: mipi-i3c-hci: Send DISEC before disabling
 IBIs in hardware
Message-ID: <aqgg8Ldot-omGlUA@lizhi-Precision-Tower-5810>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-8-adrian.hunter@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914113003.183150-8-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7P220CA0117.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::34) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VE1PR04MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a567602-2f6c-44e3-9afb-08df127d6232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|23010399003|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XSl1OJSDWLRME0B6BA8g9fJR6OTn9HvBcfkVqsQIIVV+J94p82dnTYIXKF8Nk0aYff8Q720IJV0GKSmPRbEih1wkt+hFDCVi7dqzxzJFBp1LNNzAdhDI5LIQR4LqDOm/0cs1AiFateyl9lfF/zLFAbxpJFmsG5gHYGGKkL2PARy8Gl5/u1a1uJI1a2Ae51ArZtDSMHxuoeK88bPwuF2ISQs3fGtiLhuIX/gmeST9bA1gDyw2IeLN0y/39t0aNLctOj0yWNYY0CXuw+iaga6gMAcJ106jjGMtcY7D75wJ8UYkdUSAaD5URPl1FJC9qI/n20moEXniYzyuzmDihKh51uuAE2Zp9ncUFX0oupyTXmy3HZXoR9cvmkdWotKnU/JRMQ3ccT8xxLX+ynUVr7lTwV+FPqdfsGHcxQhBhjLFgmo3yaOHlW8i8CrV1W/60J6N+VkkFnHoEO4SlRzXf7zXHpOjMAvOVJFsYqTJIF5JmnHdFnuYCsKILRyXR0HIn+H2N/tYfbCRE3f+XwTRRyXYrvTdPirafrUB5MJRGTLvqokqNPhVhRO3owQX+KSkHrM11n/VAP8nJMcBTZk/a4VqoHLgiBeTcuG5ZZRqDptyh7D2q76cPbDYCEAd7AnZb/H1CG4sPvyc5bGQWcNCzuE44zFF+7vEPBvnHM8luI7r0lM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h4xPm/gack6cd/nq3qFyF8pKxUvmh36WFzfF2V/Pog33S6mXa3HCIhEdLpX4?=
 =?us-ascii?Q?32aBDMjSjOaYgS62vr3q4LFXf1NgYoiUde5OQzbEa6YHvNzuuqI1+nE4aZQg?=
 =?us-ascii?Q?ZvKal8AvWXkotr5abVBY7jtNOSj1aoFnL5JCXfGg0W8a+vFN+//15vKy1xEp?=
 =?us-ascii?Q?8bWSIzT7b/mVmTbY/PVYUBsmUQR6RX1Kf/EUhSnlE/mD/ggTpmSq5X53gtNw?=
 =?us-ascii?Q?xW3Zzc9HYGSkhm2Nmh95L2Di/y3FXoIuLOlL6dQq0y19L1gGAX3FFfsVcGTj?=
 =?us-ascii?Q?xfsRfUghd4xaXI/bD5gJBpxwfkzJqI85MpUddkNxys2c4p1l8b0Q7cl5UZ/s?=
 =?us-ascii?Q?glma13l5HeB7znoAB8RGxzricxuuwTneBWsO4ZZJFBs1WcV7QyflyEmA9TSi?=
 =?us-ascii?Q?JOrd3skFSEvMlgiORc559T2ACS8lBGLiFg7yBrg+Hn194MiBtKAD2DVP9+Vd?=
 =?us-ascii?Q?kFfEUVeTDRrzwrazKyGUuCPpkCFPrK6p+/ZquzUViq3Lj5Qo92p7hgQP1pgv?=
 =?us-ascii?Q?AwIaTI7TIr5bp6o1eaBafqtyIs/NoX9+HQUr1Np7xYfwTLd1iaU3eZbSApww?=
 =?us-ascii?Q?rg6OwAflB2FinfHycbcFg+PVXjI+iu11r4VMMldgCeW36YG5RlGM9CLJTndY?=
 =?us-ascii?Q?9uTfS838oW/7tU/qdrlMONjYydnLeY8krbFl66QVt39rNT517qUTu/jXxwkQ?=
 =?us-ascii?Q?cu/+rFWsfGVT591SV2IZbMacQG7hC7peBjTmiyDz/ElXNUq3WZMSjIAqhU7M?=
 =?us-ascii?Q?b3jqtnyeLdC8iAGByu28BXK9nK6lsm51ldJ8Da+7CYRwfZP0LisEI2MwBAaV?=
 =?us-ascii?Q?8/cVDPkbD3JPTLN9jp7QCzL1mmvwnJMVch/eOnyB1goGk1RoqGvLdcFomvZY?=
 =?us-ascii?Q?88A/Jf2wazwF063szCOavg8ytx0V0UcOxweYxN23OwBmb2MeK2TDYb0OX+tu?=
 =?us-ascii?Q?NQXlp9W+MHy8AMHW/qP0OgNah3t04pdUyId7U4nnG4CnArziHyz7CinKJW9o?=
 =?us-ascii?Q?j1eFpQl1ouq5AgMqsE3kwz1LrGVA1yae3XBwZ68/c/DjcJTkEFPuODzSnpWO?=
 =?us-ascii?Q?D9792KevLFhBkTMXY26oJJclD5h56c1rdi6TWsBpvgILmrw2izBiyfVzt99w?=
 =?us-ascii?Q?vsqee6zAQojlqJPkopWCW/Y8qPVZgwnQoqmFx2lJluhWhS56yOk9BbYxdfhF?=
 =?us-ascii?Q?Ri4XPqgw2dZdFnYOAgvUANUjWc9RhYU6/m2m9lbrxLy7UyP/FPve11GNPtXQ?=
 =?us-ascii?Q?FEBPDVgeyt5uZ3Ke/TirhOIj+eALGESM6TujOi+rFf4pTKgEdcylYsLaS3KZ?=
 =?us-ascii?Q?PbnniAfQqcgOF0CVOBuSXKCLx8aMcmJZy3C6xY9lHun4oKCQmYOgWBURCe4k?=
 =?us-ascii?Q?SUh2CVG7QucmWclRvQHCdA6PKWqOuoZame5wU/ATNVxLm3WAHAgqwU4cnT+V?=
 =?us-ascii?Q?oV+ojP/KulxvGqjXwi5nzudp/lAOO0edNecqm9aZX9Het/yXg+u3MshLtfYm?=
 =?us-ascii?Q?aEc87AuSlH26eW1GhdPjxfEnOPa0B9ZyB23E8vjchmMN+CNPkpYgk7FMmLtz?=
 =?us-ascii?Q?10hmy6fCLoV57CPcD91d4sHOI2H9I4mdrUjnliVZ1YFWAFrHqigVGwZrAvhc?=
 =?us-ascii?Q?LfP8xxtguabAm2nCRiQCU8vo/nUcVPZD2D7WS8fU/qStpQ4oxwUdafplNLI9?=
 =?us-ascii?Q?caUT5rSCIeQALVmUFonvob436+XJD53sHwn56Cvoy3YeyafpMH3DuWgT/N7x?=
 =?us-ascii?Q?J05GT3+Sgwnd+XH2w0USRBRGv5Ca0KIqObtgctipI345vG/JQQgW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a567602-2f6c-44e3-9afb-08df127d6232
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:29:44.0475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8G5F1mGIR+Ff9sktCiDnnBs5f9Z1vM3XT1cdRREaNCLAUWZrVHzQHx39Eq/G7KlKSrJul7StbGxKALxEJNxvKbR80OfjbtUCf/PfTwn3Kyt18g57QESilzYcgmSNmnH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7376

On Mon, Sep 14, 2026 at 02:29:53PM +0300, Adrian Hunter wrote:
> Reorder i3c_hci_disable_ibi() so that DISEC is sent before IBIs are
> disabled at the controller.
>
> This matches the sequence used by other I3C controller drivers.  It also
> avoids dropping an IBI that races with the disable operation: an IBI
> received after DISEC is issued but before the controller disables IBIs
> can still be processed normally.  Once DISEC has been sent, the hardware
> can be updated to NACK subsequent IBIs and complete the teardown.
>
> No functional change is intended beyond aligning the ordering with other
> drivers and handling the race window consistently.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 166d9f70f435..f6a34ce7a295 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -719,13 +719,14 @@ static int i3c_hci_disable_ibi(struct i3c_dev_desc *dev)
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>  	struct i3c_hci *hci = to_i3c_hci(m);
>
> -	__i3c_hci_disable_ibi(hci, dev);
>  	/*
> -	 * The DAT entry is now set to NACK and DISEC this target's IBIs, so
> +	 * The DAT entry will be set to NACK and DISEC this target's IBIs, so
>  	 * the IBI teardown can proceed even if DISEC below fails, so ignore
>  	 * errors.
>  	 */
>  	i3c_master_disec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
> +
> +	__i3c_hci_disable_ibi(hci, dev);
>  	return 0;
>  }
>
> --
> 2.53.0
>
