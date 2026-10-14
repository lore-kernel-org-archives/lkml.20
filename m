Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912D6559CA2;
	Wed, 14 Oct 2026 15:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992085; cv=fail; b=FFrH74RTzSNKCWEfaxh1oo3uuryQl0usP5uPvxAf9agq1JIbZCVVoq64ITWuD+S42xu/koiB14fVw+UDakg/9rYBzfpE/gmV60GRPi17rQlr+bnGfl/VXVOWrT+VFBaxHiFFmmPJtD/mWDnmcuXzOvjMSvQyh0UtGUhRQuGC+R4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992085; c=relaxed/simple;
	bh=vWGJyY0Tmu//R8Ksj8acrESVNUno2XG46m/Gb8z/lJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rLx1DV1QIOiE3oxsnIGqCIBJ5qWdYCgkvDCJY4vJMOdpsQ97We6GukSPaXHYq9uG9Ci7JieWfoHkKp7akR9/iyHQmpvfyIwyOlKsR6S068+Bj5gEHKUsgd7BYz8iw0TqouSHmhzl9xU3JpBBL4aFBHCGi+2elJ41JH/a5MqMDFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=loNnp3iX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=qEKRVrob; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="loNnp3iX";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="qEKRVrob"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EDh63a2754477;
	Wed, 14 Oct 2026 10:34:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=8ZkSxa/7OPo/DrM9aN
	WO2j694c41oLS63GIzl24lM2I=; b=loNnp3iXG9M+1FeNOXF0u6W3rxogBTCI2F
	9+AmjlmdOSxF4wNJxdeAkCdOIvYomOWYOQu345GxzfhICgBsOgvENcmaqVO8H0Wx
	4XDKlG+IULdb1riCMzP1kChe2HD/N/u+tJDAMwOpp9LNkBzzGLt4P+IXL5Pwbxas
	X/1RJ30gs6rIALDBs5rbyEcclnF37mSYL/s2FA8eS2zpDPbhRUHCYL/o12Ih05jE
	Wa2QOMNcTJm9jsWOHCHIbRXynz/Fyh66QBBmqKTBX7LGiTt8UDrX41cJeZmHxCss
	BRklfO4p1qRKlyVDPqXtIaTsX/RbmqamA8Ps4pYwMahCL5Arx17Q==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020117.outbound.protection.outlook.com [40.93.198.117])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4h7hsg5yve-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 10:34:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HtoVRjEQ/NbJx3kfjJpgZ9azrzqM/3613Acy45mDevQ5nXuoOIPExEN8qVu/qL9tZqHBPvxaHqOs1wCODMrd3J8gA/xPZ6AZQzwwtGf9o3qbYl8Wuwx9AvHw0i9jrQzf7eI7mCYRxHtoAVi062ZLqfEB7VZ2Gx15+dnTVtaSKdxA8f4FTVEnrcbp4GxWqCLJcsftmUlz99a7/JjLa/L1kYQ0tT6HoJNxAxo+ciJ6iyZ2oRkx1LIMydHTvUBH2IAfmngYgrLUtldfVj54WGJbBzkc9po8wTpV4jdWVr7SpxMu6RwNufB8yUALW3CAIyyj6vOPynPMtlDKFi65ST1x8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZkSxa/7OPo/DrM9aNWO2j694c41oLS63GIzl24lM2I=;
 b=pwErh/0n58XmMzb5DVOvwIs+1EUfgscDg6FVu0QnJ+Ic5o6hNz7rUgwg1CzVJAW7RaTt8HiDkS8G77wRrmdr/rSLDtoclr9afhpXwItPTx+7fq6KNcso4rbrd9DQDgBaycvBEkeGtdCzstl3bN2A0ZN0pOVRfnogHUEKzZgxR/auZoGOFzhgLgW7g1mup6K2q7fR5tdYvdCU6loDihlixPCBD+tDOnqCZdBuLGm/xQJrw71HqQ77uWP2z1ukQevKf6+5wRrD6Z8XEY0vj75buUOvIxmjY6k9NUY/IVsNRCs00uWRamyaPvtoG6RhZnmfsfTFvGYYDaRTr4hLlk/IvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZkSxa/7OPo/DrM9aNWO2j694c41oLS63GIzl24lM2I=;
 b=qEKRVrobcfORLSebQ/uQJs5ZhkmM4hhuC6q8YFVshNVVuEd7U7wb01PqbBN73o31DluMC19c88zV9DoVSp9iF9dYnVlsF0T1vrVQ0kgaMNJmhtz3ixwEBd3HxBcGO1ewcktPxEEqWTI6M3L1Ub48bFxJs71Ge/KJ1vHFaugfk9A=
Received: from MW4PR03CA0102.namprd03.prod.outlook.com (2603:10b6:303:b7::17)
 by DS6PR19MB589425.namprd19.prod.outlook.com (2603:10b6:8:411::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 15:34:28 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:303:b7:cafe::72) by MW4PR03CA0102.outlook.office365.com
 (2603:10b6:303:b7::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 15:34:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Wed, 14 Oct 2026 15:34:26 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 12229406540;
	Wed, 14 Oct 2026 15:34:25 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EF0C582024C;
	Wed, 14 Oct 2026 15:34:24 +0000 (UTC)
Date: Wed, 14 Oct 2026 16:34:23 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND 2/2] mfd: cs42l43: Move to core detach helper
Message-ID: <as+g/3Qb2SpP6G0f@opensource.cirrus.com>
References: <20260924120520.2511081-1-ckeepax@opensource.cirrus.com>
 <20260924120520.2511081-3-ckeepax@opensource.cirrus.com>
 <20261014151800.GA1182143@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014151800.GA1182143@google.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|DS6PR19MB589425:EE_
X-MS-Office365-Filtering-Correlation-Id: a1e4c82e-dd40-40c8-e99c-08df2a08a172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|61400799027|23010399003|22082099003|18002099003|16102099003|10067099003|11063799006|261009223027099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ZCcYDG43kaOUNl+8dWESNXgYE4b8fjA7lfi+y61ynXo98EXq1lNcfd7g3stj2jFMPDdz7Ihh8gfF+DtPcLnCBf5YREJfP3IjqyHFdkQSr/WIFj7oMpkZZ9mF+mWvfJ0gXC1MP2SNCsgCuH9T1in0sTvxGQvAv41pbyh8pWhGflUEIbQ7UbLLrzwghXjgd0Va35XcQjncry7SwJhdc+FjC3HCk+WtIE/STNingWdNge/gd+orpYvl4xBSfTlMcV8XdeZjudbBWykIGReDiIHyB4CRN3NYVIoebjop6rERC5qKD/4X9mE9XHOYyRGGdMcg4RqcCsAkRqDCxyEZfsskW8AaVjq3SqQIo9IKYGsamdkR9HauB/3chu5Na5hzBO4CuP5Z5lxCxaYRL2/yBXV2bHU2G4ZmxHOwjeABzg1v4MoDJae445mE8MvT8or31yQ+Zt4tT2tiR3PqjdL8FrktE09UdZoY0aN9beGHd4qWn2KH3/XXXCz3yGko+MKxaGjvxya7frni3VfkEDyLo4i2MYT5fdjQBs3heuLl1xv95AClD07Lvy5UcDxTMBi748Y9wC6ELGOxs6jY7qzQbYGW3qa3IeUgjABSvVFWbaX8MrM6bOkVan+QOasRKpArGuKCeyriZ1NNvMjRcSbEFbhD7w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(61400799027)(23010399003)(22082099003)(18002099003)(16102099003)(10067099003)(11063799006)(261009223027099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AQB/BHCFHWcKwYGEe8nSLv2VrfDKbCptJALTYoDUVLHuC+b5VPlje5Fxu7XVpgj1yafj+NGnsjWVBo5Q5DDZ9WfMgC8CcBYWXOPlqD3jD+RZ3YPWhzSy8LlFP1Qagwq9hHHjwcfubWbcXo/a/ezsepuV5X2hZjWTof5hK/hKLtqU3imTjY5a4QcCczNXeRVBpHso4fVus8m7upkhrhUVfUliVXdwUMgQnKdrX7u+GEp+UzIONwM9BZbs50S4wghVo2TDRXx9y6MeSbFBydnTEGtkaSGaV8tCktoKkOXauB1CUc+8TrfPCvN0S3LcTieZbwGUiq2I8VFiXxLCeqMkn664YVBRjRZ5NUsY2TP4V1pIfe9zCGJqxrLQ3OUDpw7o6rE3tYrxr9tMG7c8GOIjaYWgVEthIkxfWDWtzvdpl6fbnprnOfXaz8JVHquAeJWI
X-Exchange-RoutingPolicyChecked:
	vmYif8ULI8R0Cn7jJtE7LfcGmEUxSOpVrnOhXK4+qx4Wk4ENV7/uwO3mrDp0OZ2XESwdnKncxlY4c1TygBEOLCnEUaS+xbA2snpPhh9fpv4FFrxUdyWB56iTdhZC2jv4zR2XDjidCsdIiafRb49WxKY1UMAb5CyvqhC4K1+V8NUEQUPTQxb435auzDPEMr9W8xj4AfnUz9VmQUWh0kLQqXE7driJcJZQDR7pkrKwQ+9lpyNWs4NFcUlyt6AlTiGMobBjSCz1a/uG5RALWUMSkWBSe9zUsjSxl99rG7ULtTyxPoabwWNPQ2mNcDcYPLaNiYOnS3JuocbOSZlfqLaOhA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 15:34:26.3503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e4c82e-dd40-40c8-e99c-08df2a08a172
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR19MB589425
X-Proofpoint-ORIG-GUID: vF5v1xYBpAS7oLQyQ2TlWFU7Jo8iJjjr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2MSBTYWx0ZWRfX5cGkfAoONfju
 LISiRlJXtOMSgj5EYYL7+FN9Lvv/gwX0DAee3bIoIq0el9u/CgRhCmZ4s0OBE61W+GrdS3c8y9T
 mrRfVQuwaRVkUCPSm3l9Yi+Mgd5MAMY=
X-Proofpoint-GUID: vF5v1xYBpAS7oLQyQ2TlWFU7Jo8iJjjr
X-Authority-Analysis: v=2.4 cv=QufLTlyd c=1 sm=1 tr=0 ts=6acfa10a cx=c_pps
 a=UIcKv52QUy3ZqpRAVMOEHw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=Dl6V7YuROPEoWudy9Z0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2MSBTYWx0ZWRfX5uer8Ts89Pmz
 5LbRQZE38UqOqTIECwjZNjhBb6/U089QIb6xmrtkJUIcXzXLFhFbgJi/hUiuH82t18K72ugRkgr
 AVZQ1f6FE6MtcMskYxjspOAd17Vppc9A/pN68f4iHPKnrI5IBIOKleC2DCeacrvBDPIlban+hSJ
 YqsLARGCoaVCSjHKOtfIbDyQBGP7kONjd2VwuLVCvG5V7N0pJH0hzkJcBhRvAJE2gYW0a3FPhLK
 9LKqWin2NHcoUpziZIV9+Q7WgyHHdeW9Qfa6v/HQ0+gnCPHBWVB7OFxT76SFyvSiL4nsBQhCbhO
 foCIa0o17fYFO+qDkrPWu1WQSB06US1pjjzoq+/gVenQxva/97fDfCg2s0RMEeFByit8Y4fUvF2
 +/JQe5riTIaruUi661MVqa5xpfxlFaTtxg8slRYef4StHyuvycwfkURskJpzmoLoFjmGtKdP5p8
 NVoMHPvI54HnQmUxP9Q==
X-Proofpoint-Spam-Reason: safe

On Wed, Oct 14, 2026 at 04:18:00PM +0100, Lee Jones wrote:
> On Thu, 24 Sep 2026, Charles Keepax wrote:
> 
> > Now the core has a helper to signal a device will detach from
> > the SoundWire bus, there is no need for the cs42l43 driver code
> > to separately track that. Switch to using the new core helper.
> > 
> > Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> >  drivers/mfd/cs42l43-sdw.c   |  2 --
> >  drivers/mfd/cs42l43.c       | 15 +--------------
> >  include/linux/mfd/cs42l43.h |  1 -
> >  3 files changed, 1 insertion(+), 17 deletions(-)
> 
> Does this need to go in as a set?

The MFD bit won't build without the SoundWire bit, so ideally.
Vinod has acked the series, although the original rather than
the resend.

https://lore.kernel.org/linux-sound/asC1SwHb4DZkJ4Pr@parshuram/

Thanks,
Charles
