Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77172F0673;
	Wed, 16 Sep 2026 15:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571646; cv=fail; b=c2oboZvxngfVInrEaix9fwW9nflMWjCWt1qILGrmIGlb3FT0N2oOz6pd+b4cE5RGqhiyfzI3NaswrOYWldq3FwE9pMexENQpyi6NHnOp619MWJGoS5MkyqpL9dGj0WcSfNsgXXDIFXtQUJVLuZSkicG3Djh3EHsKyhVyXauw16w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571646; c=relaxed/simple;
	bh=gf6DjVwgyX1t7rd+G+JMvCjJREDMVaH+tkvN5hXIJx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WphE7oiL+ldoPvFhIkK6L6u8joc2IVACOP83/M4D2AYyKUymVGgKRBWUG5ME2nnVeTJpI8aA311nhfse0iw0RpyQcXgeuHY+MezmtZ8MPF/PRlpfTL4tAuY3MII6pK0+tRSiRtgz45fHzEfnV4g05SW8NvpZVO3K/Qu6mjbwqQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=h7Wv62RN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=DkuW3qVk; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="h7Wv62RN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="DkuW3qVk"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GDENAg2199766;
	Wed, 16 Sep 2026 10:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=XN6wjv6YPXpIUgd0qK
	Kp0JtNMcCCJPaoBi5BO2c0QHk=; b=h7Wv62RNGhgYwYKjTW8K1d5QfKrd5L+vA8
	2Com6S8Zpr0Sp4sXnZi1u75hwCi7ggbUwazOOnAUfozlwDVxxlXvcla2u8nMEDHi
	6zJYSudbCysU73dchfA3ctk1m78Wzazj2tsBHHC2l44+57MJYiENlJdjFGxEoTUp
	gEffoRTP55RKf1Hbklv7b4sIROtBmW7GtHFR0+Smx2pGXvGd1csuUcLTjswWo25V
	fTIXtAwMPFRVfNkS4ovIbPLQIOdBUFSruw2WBO5tanRMUI6vkgaL8aURsY4I/ntH
	Vlk3t+KXg/twVuVzk0rZzDvY0jrhUxlsV7pNl9gxDAbnWtQHkUdw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023102.outbound.protection.outlook.com [40.93.201.102])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gn44wdbaq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 10:13:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XmKxIHA+SosfPR/I6DCDQet8TCDNkPtpUMauCPehbw2zd8HfLlVd7hCdghOpMTmnKS2+dWKBtDikKbdDaRwpwucJ5r+SCSWW4d9C3eb9H5iHdbm02qki4Z3Cw/vxim/mGp3BEOdfJpUvCGNJKBo4w2v+KLyoZUXkOisiK5WfoS1L/poNDqfGC89UpgAInM7KTY7uIdKdeor4ojUXA+0bCICKbNhf4YTt1/WsJupxzicFIDONZq+0fgQN4041pAnTzv/TMxvoYMPDvsm7Vl1dm9SsORUk2xspDkYV+ZyNcslpZLKpmlPiOJBQgyshdGWvKni3F4pPDqyg6wzcNx59oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XN6wjv6YPXpIUgd0qKKp0JtNMcCCJPaoBi5BO2c0QHk=;
 b=pd9Zh/lqh/rjaZvLpdVlQJNW80YXgxn1Z2DrkpMwN0A61wPZ6/C6W8XtFbBOJsU+tyFFGy6jKuDTBFs7hE5lPAEGdNgcXkAxKN5N9Ny6AqfdXGuRHstEZ7CwQfwibXThuNUsd/h59dbTWfuG8WPrsY7yJmDx5Ek5R2Wp81SzfU2Gd/T9FNSeAHWaDTmlo906+aoeOsjjp1HoaZOD8TxYo56epJ23i1mjUuagju4PofmqnZqb6FTgivS4XCV3UuAYSa7Yk4SILa3bBwRA6jeIF7ZWGTheNCNsg7QSarc8NTI7M8elX4QZf7KZ8ZB5pqwU8q7/WNKl+61WSo+xGJa0Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XN6wjv6YPXpIUgd0qKKp0JtNMcCCJPaoBi5BO2c0QHk=;
 b=DkuW3qVktkc+PdfaIRcFrViPFFHJKoRNXJ4/Dk3kURqJAoY0HXyKYDkR7/OmB7o2b6Kf+wEuEsXd8o82I/trq5HLP1ThTgKXlvnfxg3SmUdtCwV17RWN2HNNu2QasR8gpUxiVOojPjlZ9NB/UeGx+zrjc1Z9rdyl8ga3D85qHC4=
Received: from BY5PR04CA0026.namprd04.prod.outlook.com (2603:10b6:a03:1d0::36)
 by LV0PR19MB9431.namprd19.prod.outlook.com (2603:10b6:408:328::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 15:13:50 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::31) by BY5PR04CA0026.outlook.office365.com
 (2603:10b6:a03:1d0::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Wed, 16
 Sep 2026 15:13:49 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Wed, 16 Sep 2026 15:13:48 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 863F5406542;
	Wed, 16 Sep 2026 15:13:47 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6F6AA820244;
	Wed, 16 Sep 2026 15:13:47 +0000 (UTC)
Date: Wed, 16 Sep 2026 16:13:46 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] soundwire: bus: Don't unassign dev_num before
 unregistering device
Message-ID: <aqqyKkuzCPqhwR0t@opensource.cirrus.com>
References: <20260911161903.419814-1-ckeepax@opensource.cirrus.com>
 <20260911161903.419814-2-ckeepax@opensource.cirrus.com>
 <1ec1211c-51bb-4bd4-82c9-160216953c1e@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ec1211c-51bb-4bd4-82c9-160216953c1e@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|LV0PR19MB9431:EE_
X-MS-Office365-Filtering-Correlation-Id: 9757e037-321a-4c9f-a77c-08df14051c48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|36860700016|61400799027|10067099003|4143699003|56012099006|11063799006|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rnffq5bIr+UCBZAoQbfR99bnHlUQGxLR6oz98PgfjlAaebQS0clcWipXL3gVmaDS3u0c2DaJYxcyKQPjH0LovzEwXilTpd6BfsFSJNE2mascmIY8qR2Ld241R623rIl6XwdHTe0bMXDigWE+qg3DeSffpqNfMLPW7NPh2CJSRzUEjJ380Fx7NnOHxORR/fFVjnr2Z0jTXXsZOpoHGMZwNzOXp7iBoD08NXBvVNVFr4Q9uk089vBkx5JhD12kvr+t3KIJNkWPVnW1nv/NfB0XcArVMhP+vRRy1TzyRDBUvy4NvNoIPIUKnxVmSeI0C5xaBMVa39OdaiNwDksSICEB3XYScqnxbdA1tqVxlFcVo8B00pkXq2686FSUdD4VFT212XvLtqRZgefBEzOgckjLQmmguSFXgab9R1WMoXH7P6te7YRKqV/7LHxq4BUOiGZ23kqgbfIYgYD/UhMlDfGoQIBhYs7uae5UcHKwUHY9r0vzlaSGB445dLjDtynM+rHvpTHmS8JkY/s4XRcqIE9XpUiZ1Ep6NXjRUZ3r/7MFEd0JleEqhfvJc2yg9wMKPxjaXd1rH2OsUugyRTyXWPqzHJDImrjzlFebE4mwsyQhVVuoKcF9rDKEIfoMuwGEDTP6LTEyr6q/fXLeoRKLvWgTPKU67qEVhLoXDL6+kvcPpaqsiz5b/0MDpz9TjZ+iS/t1pvbCBL0gEyklNJeQI0VGlg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(61400799027)(10067099003)(4143699003)(56012099006)(11063799006)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z6w5aYo9ETsuG0G2o2GAL7Sqr3NnxwlIB2abLRU7FsaPfSrTuSY6XxtebbLFzUItsxcAxkuDfOXeiiMVz2TqtHkmROAU9DyUv+LXE4tJ6cZkgdRwQgXiBWXv7PzRvaXriJjg6A5IUQmIIyZUdiWq24XwMaD9L6yoyxwxlQpbbHKzhfhvkEZ6ZhNI2gLdrb8VGa2ekDVgsX8ixnoqxBHCmpU2uRjqzxeTCx8nqdGict+HqHNLzUjnd+8z3yzQWWM3iLd+6HgvOtfNs4LtJIEcjAcdZG4C+6mYntRBbUuj5ukhvJ4oA3sF9/qiqXPTua1xR7+Q1Pn5Pon056QllkuYnPohqE4wb0CcB3pTh2+XBTE2qLOimksqMDlvjoLvwmw9D9VLUMMoCVgtBvFZhRdBlFhqUL4FTLJZIlTssFwF4e1i/vJJsw32QcfLyziYf3QF
X-Exchange-RoutingPolicyChecked:
	1v5QTzkSDRKsnVJTz0bP4qa8igH3gh5xSyVQr3CNJA4m3xz28BddMybPvoK+nyw3sbqz3rDMQ5ylKDQ19iMSHs5c3falJVz0xuZcvj47H5p7jVR1cYecOevW/esULAhutIB+JS4Eglxt/mL/zv6NCbBKDl9boybA/cMhu81elJsOPqQMAfFxyuo5JwH66T9PG8/WwjNXSeGny0ajm68ZvNn7vgdSzCnYwB3fmjxUgmr1W3+VC0hdUUbm8gvybQWOptuG5NI43FhSQ0Ecyu5NYIj7zOV4hzEbR7EH66nNuno8RuL+1vSzFoey8lXafOBdcbB2bwkg3fvCCajBE7DLrg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 15:13:48.8575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9757e037-321a-4c9f-a77c-08df14051c48
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9431
X-Authority-Analysis: v=2.4 cv=A+T5rKWG c=1 sm=1 tr=0 ts=6aaab237 cx=c_pps
 a=V5lscarYawUrr6zEozVj7A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=qGhudKcf-nLrQPngFFIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwNiBTYWx0ZWRfX5EJQa5qPwLk+
 7pyI0L1YaWjM0YmUHGm5o23tTSw4BLNXmXzoeWTekOEV9w9YNIDHM/wHzClamSi5GdBEfNYJ3Bj
 MpjjA2KMV91y0NctOhc/vXDoATQQ/qXh+sR8b+CLRflqBuqLQJL0e1qwgr1b+c/nKdbtKPrTdC6
 reKbVZcgmupoho7tcbQYet0Cw6v5Rzy6KJBRyHdWy+9hLINxIS2dw9iJ+vYysjYfhTyE6DuhuLM
 81sVKkiNAGQ5uzFExNsERuoIkH+/u35j1StBY4l+RoII+fIDnHAzu8Fwqx+6EjfpAVfAwImd6xb
 ClWWjM4gKZkFQGGhl9YzDMyPylOtO7xajbwltGuC3pvSyYXOH/GhkEMX5B5dVLVg1tks/g8FSvF
 wwbjZIbSyWp5e3LWQXjqhGnv5Dd8yd15Pw00724bClasMqA7R2I3qd2c3xNhplyLFsukaSTAu0C
 gIb1DYASJabPkkrvrWg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwNiBTYWx0ZWRfX146v0vmfvHkC
 LgXImgJVxAzOqLkG2Afa3rTpfg/cV3JZiMfPkjNh6OO0vkuBiX9rw95IfpLEuvIiKjPAHAM8MbX
 +OQcI5qCqRspK6hNfBNW5+hoDj/ldg8=
X-Proofpoint-ORIG-GUID: P_Ok_zye4Cs9___wM0T-eXiv583UZTw8
X-Proofpoint-GUID: P_Ok_zye4Cs9___wM0T-eXiv583UZTw8
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 14, 2026 at 08:21:34PM +0200, Pierre-Louis Bossart wrote:
> On 9/11/26 18:19, Charles Keepax wrote:
> > Don't mark dev_num as unassigned until after device_unregister()
> > has been called. The driver may want to communicate with the
> > device as part of the driver remove operation, so the dev_num
> > should remain assigned until that has completed.
> 
> That change looks fine.
> 
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> 
> But I am a bit worried about the dev_num handling now that I think of
> it. This is *only* at the manager level. At the peripheral level, the
> dev_num register has not been modified so the hardware still reports as
> ATTACHED with the dev_num whose mask was cleared on the host side.
> IOW we have a zombie peripheral on the link, and if we do a sequence
> rmmod/insmod things could be fun...

I think there is also a bit of a race here as well. I think we
can't access slave after we call device_unregister. Will think
about this a little more and prepare a v2. We can probably cache
the dev_num before but can't help wondering if we are clearing
the dev_num in the right place.

Thanks,
Charles

> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> >  drivers/soundwire/bus.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> > index aeaae5a57c89d..b17718f4277ed 100644
> > --- a/drivers/soundwire/bus.c
> > +++ b/drivers/soundwire/bus.c
> > @@ -175,8 +175,9 @@ static int sdw_delete_slave(struct device *dev, void *data)
> >  
> >  	sdw_slave_debugfs_exit(slave);
> >  
> > -	mutex_lock(&bus->bus_lock);
> > +	device_unregister(dev);
> >  
> > +	mutex_lock(&bus->bus_lock);
> >  	if (slave->dev_num) { /* clear dev_num if assigned */
> >  		clear_bit(slave->dev_num, bus->assigned);
> >  		if (bus->ops && bus->ops->put_device_num)
> > @@ -185,7 +186,6 @@ static int sdw_delete_slave(struct device *dev, void *data)
> >  	list_del_init(&slave->node);
> >  	mutex_unlock(&bus->bus_lock);
> >  
> > -	device_unregister(dev);
> >  	return 0;
> >  }
> >  
> 
