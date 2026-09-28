Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C6F377ECA;
	Mon, 28 Sep 2026 08:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584801; cv=fail; b=D5tDJmqw7Ef1kZehcqY91pL6dsmjmIHEv+Kx7meG69UpVXDr111/5qo9UTgKJtTrKNqh3wxArf2jHqSudZ5xc04QPt6ysDLI7/NdSSFQbSayR/E54FzOPixYAPTd9eVQ8aj5S+Hq9IWOZrVvPC5rSdMv7ie6QHc1ZkknKcTyU6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584801; c=relaxed/simple;
	bh=8Lv9bouykdCBe5GXxVDo/0sMJl90wpleP88Su1uQWl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDIY4NT/pbH+gPHGahqtnoTlh1y00KZjTYc7PZgtCTHLb8iFCqBu1fLN0tU9fV6sKPYBkWkl+jaz/PXqm1YkMMqt58EpYG8sAZAEjzGZgD+8TRsXwo8tBgesBreI3qGgvV+j4OqQX6dzJKM2JKFTspL7GuiDyuhaSIWZGJPfVew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TO5JDDxv; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=fnkmfKVA; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TO5JDDxv";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="fnkmfKVA"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S81uMW1053068;
	Mon, 28 Sep 2026 03:39:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=POvqaZGE4lUw7yHNTA
	JmZC8QSphHOUQELZboRUtAvpo=; b=TO5JDDxv3CCJixsGbRwy7UpyLHUQ1d9U3i
	qRvdAsIuz5Tuvshu1Nrvg2m82/FPcjbMCrH/GWjQKQ/x3aCIvZA7dqx869es0Ivw
	bEbpX04Hcg8q5Hj+8vgp0wSORedGP8WZyYIrLtSvd/IA684jPQdpckbjNDVpozRi
	EZn7B3d9sYcOufJnWUJXFmXECIEytEXUEAFZOYWNKgLsV/3/V8MJsVZxYa52JUkl
	Mj7MDqaqtiHmvlxSz1DdwiGFCPhxWQp4VnGTaLk8emiVPh9KmEsYdFRxsEcylYZO
	Bq87WTTgwlqGZPy0t/lJqxx1U6PQ0uJS59SPPuHG6gFKhsJIRt4Q==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022109.outbound.protection.outlook.com [40.107.200.109])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gxafj9ke5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 03:39:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKpN7pGG1AsfxCgEaPG5b8Lmlo8zmHlUqGczQzNF83N1QVS18q9imIT+vcErDC8IfwnViWx+P/iZZIkwHBo7A4XnkuaOhDBJfmylCbWY7cQv9RV1BJbNaVOJaW6E0LVsBAz9KMW3d925BcwjhJvOo2pAXL2+hXs2F95frwWEPnpexDXY8iv7bfkpUzIcBjtEqHQgjEVqO+YqICCqPXBuWbGn9qhM3MloqkjrIyYfs34bbZLZntDozV+Qes/TRzuBqzSzE4xNmLHIInbb8gnUcMDqiHZG0kU+Epq5Lr19TLfblVn6Jund413aMnDlgybf1zDJU0i0K6GDRfHMf+HWFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POvqaZGE4lUw7yHNTAJmZC8QSphHOUQELZboRUtAvpo=;
 b=wwymJg1hy/mtTjWni4jMxUYAl6ruivhjTlcKBdkkmGDRdZdPZ3RR7nQpMG3bPx/wlIGdIuQ5+HrMKROV3KoeJhLksUlfJXuqOp0xGHOY9Ea7H80AMbUYz3tMCug1mLfNJObieU6wCzWTXqoSye68sL5WxeQMeu6A2Df7jOt7N/Q8aj17Gxtqly7TeYf56TaRaCdJnWvR9j9NDqEWGHcsGigSCic0aFAZgQQMvgu49nLiZJJa3Y6riJPZlTxvcTYAgLKmEpK2wrqN413hNFwY09KsmWgwYq+Qv2G9R/ecyr1L7z9qeFS84UV2qretYEYHUvgm4rhSt5h/eHKzmi2cTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POvqaZGE4lUw7yHNTAJmZC8QSphHOUQELZboRUtAvpo=;
 b=fnkmfKVAoQFT2n5c5oAKG3jpA71S7Q1lRexDj1znrLjfH5S0vINVqoeb9r8NO4S2R8ziTyjfJOJDWmGJ1i/P63GrsvvpoXLxUgA8LGexE1MnuqLApKYPnjUzbAtpKWrLqsOWPIg3uLV5Pi8RPs2EIEGsAfc4q3CmkNSF7eAMZx0=
Received: from SJ0PR05CA0209.namprd05.prod.outlook.com (2603:10b6:a03:330::34)
 by DSVPR19MB323683.namprd19.prod.outlook.com (2603:10b6:8:3e9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 08:39:37 +0000
Received: from MWH0EPF000C6190.namprd02.prod.outlook.com
 (2603:10b6:a03:330:cafe::1e) by SJ0PR05CA0209.outlook.office365.com
 (2603:10b6:a03:330::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.19 via Frontend Transport; Mon,
 28 Sep 2026 08:39:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6190.mail.protection.outlook.com (10.167.249.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 08:39:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3E6F5406540;
	Mon, 28 Sep 2026 08:39:35 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2130182254B;
	Mon, 28 Sep 2026 08:39:35 +0000 (UTC)
Date: Mon, 28 Sep 2026 09:39:33 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] soundwire: intel_auxdevice: Don't disable IRQs
 before removing children
Message-ID: <aronxfoVEKfBm9Zb@opensource.cirrus.com>
References: <20260925154216.3520136-1-ckeepax@opensource.cirrus.com>
 <20260925154216.3520136-4-ckeepax@opensource.cirrus.com>
 <2c4ea801-f048-405d-a163-e65691e93fc7@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c4ea801-f048-405d-a163-e65691e93fc7@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6190:EE_|DSVPR19MB323683:EE_
X-MS-Office365-Filtering-Correlation-Id: 37480a89-872c-419f-1a95-08df1d3c0757
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|376014|82310400026|36860700016|10067099003|56012099006|4143699003|11063799006|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kj9KQlYbzaeoGSIzQ2f0bhLu/rTFOOBKz/Tyb9HoGvJhYhyOMvPAVzcqcy1bywLFceD7jtc387Hpwjb5YWppWgTOfVRAG4rBPzcNfEsFyZ4ex42/eV/DghGUbp3iIGGwL5zOdQnwrVBngOpYtPhSK/F5F9ahhOX8Uq2wlARCJTRSTeJHnn79Xzs/qL+w0iiR/bBsJx3jZaaH9kGdhycZguu054ul1N9GyXoy+p0u7x81MBWhPgxzhNoQpUvqpgtzhvjz9PZKPlQavaJFo81PvElMzkCQMHk+G5vFlVJfpQtUqrRQb1rOVpQP+267lZKN3zh6dNEfQRoL9gGyLFADnTo7R0W/NG8WxS6WBkPO+caVfNIFma5Vr+Z9NVrpfuim/7TEyqcKpsBOWFGxnnartERHbP0otcJPsNbowBljIWUXYDTzVbio2NmF2jw0lR0JTX6QAoaDtVRbGN2OtqQldXjfJ6jpbLYoJIftge2iYUHdPZbepWeg3joT9Zvl3jxqq48zWdrl8q6UlkPzjhylRyFKr6LQi+rAe0DBytmehjZKuPVKHFPFHQnVPir8rSPBiROol3TOmKfkQbMpqXTXxqYgv3Qt3V2mPjFxQLFowrhVQ+GLg8ox+6IrZbQsWv+bSHKFdeoEI6cKNrq+5E2wMaccvNQ3lj1XmSxdglqqM91j2deVMcNo/DDEFhAUvbYjc5J+ZVbiz+13wqN6rJeC2w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(376014)(82310400026)(36860700016)(10067099003)(56012099006)(4143699003)(11063799006)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	746lfd2caPgva6SMySdswHIH407MqAHRNsc9xlwD07BGT67MS51BQDhgr5PGVn1foVcWCaKazX4in5MZiGFhUGVT0yscWBIohK7xhPtr1xgyI+uIukYcg6tsPtfSvD7WDO/N2YeBMa8K9bJZhlMO+pDtK5pTZETNSOuNTuK9Xz33kIjLy2tmqvk/P9gCNYpReiIfedLUcBdxFvrDxztxGlovUSJ7PVg4Ampai0E08e3nCQzhzhXQAnudXAAuhXUgcDi7PlxCnUhYLPbH3tYbfM1SHLPZpzUvOzHSJN+FUDRpUQXmLZ4VV4odXkQX7YjcHZzK3iyWBjiyRMTucvfgHSKaXnntdgN4pIMxr49YjT0DNzh/ndvO9Vhn7YD6XMyzxuiVR7s/X7/M328Lt7AL3NWJUs4Tz3on1O2XzZ20uGzgw8vLKonBS8M+2x0/pI6A
X-Exchange-RoutingPolicyChecked:
	lDoF2wR7uuMh4Figaht7QhoJ1gyKV6sjO8DnWsnttN1AKK8ZRtnewg0iuWuM2PZeMoD+rXDxqmQyRZ50FWUKPX6Defuj17on4PbFfQflXbRlaBQ8NwQ0z4H6pe0MqUs36E/w93nBCJfsCte6A0FsypUdVZKhYsP8Z80cswk9IwY/dlF27MhcCIcvT4PVhA0GQ3yEOrvacTuQ67+IkcXsa3A+uqRB3X9L0VyPdlGNw4BxcxQjsms8/Hc6QtSEhTgBhlu8mqwFRcij+Jko0SatCOTsaqhoVM5WsGra9CbPaSB5wiEetsYsjDTdM8E6bpSWb4KX/DpF/TERy3ROgtoLJQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:39:36.5146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37480a89-872c-419f-1a95-08df1d3c0757
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6190.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR19MB323683
X-Authority-Analysis: v=2.4 cv=GtLXaU1C c=1 sm=1 tr=0 ts=6aba27cc cx=c_pps
 a=17coPk5t6rY28jlQAnJROQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VIrCxNmAlC7JdEPuLbYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: wzj51FeWiYFEiTjsZ9pW1OCEro_aDJP5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfX/Br3ugWGlL9Z
 3miGK/Rb5dPcFt4h/FUEwoW1UDEmsYKHLNpHGHDtxktk6YQqz2isAca7iqVzFaZJGouEMfJpUQP
 oUhUfePPwTxNMoYQAtmO1snnRzp7podI9y4t4VoY7ht2Y6B2FK/syWry+Lv1CqJtc92x5HyFybt
 JV3SN+2F9dHz7hJFO5Uhf3H7Qi/ARoI0NdjifbX79BDZFFjRcv/Mq+7wHZ6CT16oPoI8TF+B4Iv
 Crr0pA9/pLAu/0xhNbwHre6e57wCi3DiKRmKrIfuZySGq3EsdPXhHUU1jsfvWQIY+o5sgbGlWVC
 ItLA0sK45RchN+TbP48rfeh8m3IUQDOiTQNgOq58qWzGweOHSml0caopKuJmjNzkmRXsAoQNIlx
 Bg9xyXqN9U/rZw7dnafGDOuUhWcz7a/F6DXLRQv4W9LXaljkKuyj+5Q5GB6updxgbLuyq0yHQOo
 nvl469pybn9WJX3XLOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfX3exyG49nNmXt
 UAl4fTmC9Veceno9zGxXn9yUgdVbAyPO3RqEFYKyg0aNfQLo+aIS1ne1cIVrGZPV5xjhaztp1Nq
 2jcwCH/QEs42SHc5rsO0MCy4Xzf4TB8=
X-Proofpoint-GUID: wzj51FeWiYFEiTjsZ9pW1OCEro_aDJP5
X-Proofpoint-Spam-Reason: safe

On Sat, Sep 26, 2026 at 05:55:06PM +0200, Pierre-Louis Bossart wrote:
> 
> > diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
> > index 901a71262094f..1439cef43462d 100644
> > --- a/drivers/soundwire/intel_auxdevice.c
> > +++ b/drivers/soundwire/intel_auxdevice.c
> > @@ -508,8 +508,13 @@ static void intel_link_remove(struct auxiliary_device *auxdev)
> >  	if (!bus->prop.hw_disabled) {
> >  		sdw_intel_debugfs_exit(sdw);
> >  		cancel_delayed_work_sync(&cdns->attach_dwork);
> > -		sdw_cdns_enable_interrupt(cdns, false);
> >  	}
> > +
> > +	sdw_bus_slaves_delete(bus);
> > +
> > +	if (!bus->prop.hw_disabled)
> > +		sdw_cdns_enable_interrupt(cdns, false);
> > +
> >  	sdw_bus_master_delete(bus);
> >  }
> 
> sorry, not following - this sequence seems to rely on *two* calls to
> sdw_bus_slaves_delete(), is this intentional or I am missing something?
> 
> 
>  void sdw_bus_master_delete(struct sdw_bus *bus)
>  {
> -	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
> +	sdw_bus_slaves_delete(bus); <<< this would be the second call?
> +	sdw_bus_slaves_put(bus);

Yeah seemed the simplest way to not have to change any existing
drivers, the second call is a complete no-op if the first was
done.

Thanks,
Charles
