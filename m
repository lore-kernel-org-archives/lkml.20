Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCC342C514;
	Mon,  5 Oct 2026 09:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191355; cv=fail; b=KC5+SWgnPV731lLCfkUKQ1Fsi9JDx9CNX/oIxdPqkFCO/6Mf90odoHP86C6Fc/b33rPggzyHnUp8YjFUUs6R5orAsEBpaFCmZvuK3uEi9wv0Tdd7ZPqb49/3vXriwyVZtbx0trrvbVhYH8DZ9RHpoMt2nVun0nmi16s2zmcEusw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191355; c=relaxed/simple;
	bh=F978ZM2ORplhASlx1zk7wtx7dw2Hf6Df30EUrrbr9LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZBjm6h0UbbqEdi793QP/PVj4XjeU9jo7wQ29QamwyCwQnTHTTFLw+05oyDQkmDo/doF0DMr0w0+nl44bdCoNDuxvYjOGEWsOtxRHm22qEsq7vdMULAqdxptsHgXhiIGKP6iu3s0xW2rpQtjQDt+2HJqjU8XjMTLLoltOUUQpn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=S2Z38p3d; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=MZVmm0Dt; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="S2Z38p3d";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="MZVmm0Dt"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6956SaZO4143472;
	Mon, 5 Oct 2026 04:08:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=VBQaVTvpojsGyrgutb
	PNyNY29i4MLOEUnBMc26rOzNw=; b=S2Z38p3dxwLmjuSArLZNaUDytBRUk0xQ5+
	MBc3+yCZcKB1YCZTvkDhCbC3XLWx56GzJuCy51HhLWM7eyGeG8645R660XSZehFB
	mRtz/O/EYEzqKuFez4gEQR/2ZWjLl5NW9PBIc7A27kCm8X4nIUGjFBUT8ADCcWh6
	ti1Sk7xPjd956INVpusv2Yd2Jk3P25vYUsOxibz+h9dE9O+cXYnVSSThleRPAb9s
	czDI1720Gx4VF+ccLLLQ7ylNmncKaIQ+DrtrNHxxtJuQuJOc7xXXXEaXjGh5stuz
	abXj7o6au4P8y26ImrCWtMk18YNnc0Tb7lAF47+Xq3Hiii1kmzEQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022131.outbound.protection.outlook.com [52.101.43.131])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4h2y3w9pap-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 04:08:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+2fcuu0ZiwHInVoxL4kh9jjQJof9YzS0nKq2+Gx9YraXPpZrWvPQgcREywYU8m4dvr1a8HuHhuIswsu7bf0366k7i79ZRhhtntIl95G9vC7raMz/VNnBCaie22m/K4nQjPXmxCpiK1kpYBvouBqm92MI/1lLenK1GNyym/5UAM+SFZIGoy+kYcsVici6l9uff22ahcxWZKjEMXTpsVap4A9+tR/DHspA91CW9N0Eh/1OEYT8gbgN49suW0jdjNlKgtVIXivAwcbWRmQYiBnvQBJ5zV3JbG/qlBDBXp5Ed0/Nj4oxrWanynONjrxCUWdpLr1UM/cGc6NZjlP178t3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBQaVTvpojsGyrgutbPNyNY29i4MLOEUnBMc26rOzNw=;
 b=Z6KKpbubJeiY6rBPK8ejSAmRpWk56jovlGN9p7d7cnnvCHBBvpfP5Xw0G9Lo4oQyzUu5mKmW9AsGLqQhWMdVw3aR20icekwbWaR3OXXQxbsp89c1JwcJjT/JdmTCc5UNzbndj+tfaK0O/h4JSgGKnxEo17vccbFNu8MfgBfzxE/JLD9IGJXnP2cC+gEwbDGbt4AA8UOZBMwzEUJb6TgnDfus6F+RLrC3i6J/MisqD+HQc5ww/eWintcD+woIhDsX7PIRrNYhjQXXCjDEgnqcAA1plg+Nkld4uHqW23iOYeK2BNGY5KIPENUM12vGj761eTCNc3AWeW8NxzSAfNh6Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBQaVTvpojsGyrgutbPNyNY29i4MLOEUnBMc26rOzNw=;
 b=MZVmm0DtswTgVHlXzSf397zEPnpCdpb3UOxtTL55cbGDFL5aXsnQhqLfvZx+YvovWVgHjtSTSxPfsUjRWqlCnT705cuU8ZAwh7SSoqFHpV/KvWXepNej3HqhhmS34kHs3L1C052vmd29jYbUL4BPK5UwVDSRXy+xzBtk8ZQWSxU=
Received: from CH2PR19CA0002.namprd19.prod.outlook.com (2603:10b6:610:4d::12)
 by SJ4PPFCBAC41B83.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a50) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 09:08:48 +0000
Received: from CH01EPF000BE94E.namprd02.prod.outlook.com
 (2603:10b6:610:4d:cafe::66) by CH2PR19CA0002.outlook.office365.com
 (2603:10b6:610:4d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 09:08:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH01EPF000BE94E.mail.protection.outlook.com (10.167.244.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 5 Oct 2026 09:08:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7EB1A406544;
	Mon,  5 Oct 2026 09:08:46 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5BE91820244;
	Mon,  5 Oct 2026 09:08:46 +0000 (UTC)
Date: Mon, 5 Oct 2026 10:08:45 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] soundwire: bus: Don't unassign dev_num before
 unregistering device
Message-ID: <asNpHbuopd9UMoLQ@opensource.cirrus.com>
References: <20260925154216.3520136-1-ckeepax@opensource.cirrus.com>
 <20260925154216.3520136-2-ckeepax@opensource.cirrus.com>
 <asC6OuTRgQg86jMk@parshuram>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asC6OuTRgQg86jMk@parshuram>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE94E:EE_|SJ4PPFCBAC41B83:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c1e616-02e9-4c36-2503-08df22c04421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|82310400026|23010399003|11063799006|5023799004|56012099006|4143699003|10067099003|16102099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	cWGnIIObLLFPiLn9YieFAlDX7RRpiV33eYH7tJ77ygXYrSnumYWLc5w0TuOlmMx30qm+/MvEKPBXFVQfdOvvbwOUnVFGOynY47g1r2/ehBxByUtheQwnd7CPOO24LY1hhwxaGMXv6GX+dnGz2Z7P97E8U673O6gvgv1B+1Fy9VS6p4kVxdQgC5rGLbMWzi3t38c8G1BQgZoV+kARXcHG+z8zcBKA+WclzBg/2lav7MZr8FBXFYE/ZMoUyIn52+twelBQ2CNFyUwJOxBHZu3pd2e8rsoMuHIYOqw1+L37621947CAKgAbfwE2d3dga+SaLiwYc11kfNNwMYL2JlaN4XnPNm6SVrSjz+DPHzQdR1cHvoS4W8QcYDNx2U8v1VAoeXxJ8kIrlyeYoKUevlan9dQ9epzzLutNwqhPLD+vEMeck2nV0qZn0E/03DlkJraHF+uS4ivNQ4Ufb+UIJts/gzptowzChWbC4ESy+YkMXOhtz8nc4+mx+696LYKvxOMSi68mbARjGE6Re9SiGoQN7qoK0RfPFDqjUt3E7OdyDpG0PBNAi5/813QiboLWWICJRE4v2iY4mGp58t8r78yyvb6g5lk8crQGMPG53p21NagBB4ZjiDIl94I3wdc+/IUdaoBhS+CSTm0zVTWT+nnldHQsV9eB33CSFoLyZdANUAVlPPZtOcwDm38wJocD6k0telRK70y/yP5kDdeKmIl+8Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(82310400026)(23010399003)(11063799006)(5023799004)(56012099006)(4143699003)(10067099003)(16102099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Q5FOFWIbHWwJygdKU7ZqeB05gBsKu5mPxDIKkdw/4cDI1Ppz83av0SoSFRyRH4R21u2Z5Sg5ucFrDW4rWHdsr5xTKAUCyGL6psiigCGXwSkFUJgEk/1jK/LhV+XKkkaxdtYF+Z/6RWhzA0bvIJpcQDVHQwbiVSpCTpsCNnlgbnigFEGPnrQ6ULZHksi6sCzgYaRLCsCiGSi6Ey66hZQi3tzl5YdHqz+VD8T9YDuTlztBV+yEZWfgazzWHbuQLOFJlIhsfAFvtppGBY2LJUkc6O3fei4HnMXroIjzuVkQyiGsh4wQFgQ2N+CqEKdLPXxCFnczFvee89ccMAmN87i/d/zoo19WeeMcLShImt/+iGnwWW8aR6UiGTmOlWaxkzjWxBDKAhwanqmKTkCEwUpMhLXKnpPzW5RPYYWS0IHLkGyLtLsmebzwwRTrrBWbq53I
X-Exchange-RoutingPolicyChecked:
	EEvsh7WD7fFQgzHhg1fyfed1bg1wvuCMiEOCTyT2DUMttWwyzvn/LDTxb4P+BcJeHASRpFwrRpb9Ui8uZHDScaf6pkqrs56slArJ5rH67DMjFEqR3x4DTEmGQhGgQnvyaoneB+JJtUJuMu6O7H+fkgMeCakRUnQfCblyP12DF+iSfytbQMF/o5l+r0Nf9PKactNxUPEBsXaBhkB7c8FzxXbi0eiA6lGySFNeTDGIfkoX4fx8oevkHjXuZHYFHcBtT4kAfic7CmFwnWM1/iU5WqzHQIj1bGCtKkAhmpM20S6OoNpfM9exchJd3LouOtT3piNLFCV/CGAuy6sQEdViWA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 09:08:47.9622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c1e616-02e9-4c36-2503-08df22c04421
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH01EPF000BE94E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPFCBAC41B83
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfX2/0jQXqkKxOz
 Ce/VwbQ8Lq7kHUW0ziN/So/tDjpG+xvfIqGAaMjcvVHFD1fBvaQaGnDJB/WfHN9laVVQpHLFoHU
 LXxZ6KUCvMkiRNTXf8zQt+RBwIB11OSazSHS7njBR0SEJNoY4NyMIsyhiLuFHPi6OsHH0EDRLhz
 MoGtgzdDqSvI8NhFX2eCNZCLomGaPfKFZoFde32sHlFyTGrYd/dchmO8xMfib6K6I6EjCmjAELV
 o2HcsroJnlupgjt2DzaLmBbg1M1sxS7IhVhWWgwMtyrAT1uYMua33S9+D1rSKayzPvW51DT3Suz
 mMqXXoLSSKXKZL3dkp+t11mu4krCb2bJVYAV3efCoTGO4QsKEDIbOAoyaBYhUqtSCfBKDvvI2O2
 Tm7gIF800ByLlJooLp/3UPeTFVwFPmwBSLRXU2cRaV2C822dK7M6VitidvVQU19+M6l1c7CL4kI
 y+irfoGJMbemr7Y0PgA==
X-Proofpoint-GUID: Qi0h73-oHMYz9ltMj9Ow6K6ivs6Y8qMq
X-Authority-Analysis: v=2.4 cv=XuFvqlF9 c=1 sm=1 tr=0 ts=6ac36924 cx=c_pps
 a=WiodiXt0wH02q4ozJLtFAw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=gWRL2YoDBW9I8xbh9fAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfXyAz4OcKmU8Ax
 euxX39JyMd6ZswO3SFmsnTSVIAIsgQqnD8XFG7FwdK48rYa8+h3zL5Ja8aksmkbpaIW+NcD25je
 88Z0D243XWFHO/wPaoAcWFxF0WiRCtU=
X-Proofpoint-ORIG-GUID: Qi0h73-oHMYz9ltMj9Ow6K6ivs6Y8qMq
X-Proofpoint-Spam-Reason: safe

On Sat, Oct 03, 2026 at 10:18:02AM +0200, Vinod Koul wrote:
> On 25-09-26, 16:42, Charles Keepax wrote:
> > Don't mark dev_num as unassigned until after the driver remove has
> > been called. The driver may want to communicate with the device
> > as part of the driver remove operation, so the dev_num should
> > remain assigned until that has completed. This requires moving from
> > device_unregister() to manually calling device_del() and device_put()
> > to ensure that the slave struct isn't freed too early.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> > 
> > Changes since v1:
> >  - Split device_unregister into device_del and put_device
> > 
> >  drivers/soundwire/bus.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> > index aeaae5a57c89d..1488b6540844c 100644
> > --- a/drivers/soundwire/bus.c
> > +++ b/drivers/soundwire/bus.c
> > @@ -175,8 +175,9 @@ static int sdw_delete_slave(struct device *dev, void *data)
> >  
> >  	sdw_slave_debugfs_exit(slave);
> >  
> > -	mutex_lock(&bus->bus_lock);
> > +	device_del(dev);
> >  
> > +	mutex_lock(&bus->bus_lock);
> >  	if (slave->dev_num) { /* clear dev_num if assigned */
> >  		clear_bit(slave->dev_num, bus->assigned);
> >  		if (bus->ops && bus->ops->put_device_num)
> > @@ -185,7 +186,8 @@ static int sdw_delete_slave(struct device *dev, void *data)
> >  	list_del_init(&slave->node);
> >  	mutex_unlock(&bus->bus_lock);
> >  
> > -	device_unregister(dev);
> > +	put_device(dev);
> 
> if we are doing this I would add code comments on why we split. We
> invoke device_register so the expectation is that we always call
> device_unregister. I understand this is being done but this needs to be
> well documented here

Yeah that is a good idea I will update.

Thanks,
Charles
