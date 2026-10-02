Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0108B1E0DE8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 03:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.141.245
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790911365; cv=fail; b=DhEXe8yjFTKGpV1pLRpreNM0Zhje8KNMH4tjjjf++QapucDuhMdXl9gDdnJsWaGtgbj1/PCcecf4bQRA19XYiFCqIEAfMYGUbfQcpPGshoHp4+VLrVnqAL5+Kj5F1wprrdimGHSIBqUP8xB/wYIkrHY+3bKpdRYGekn1EHifaxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790911365; c=relaxed/simple;
	bh=LsIBzdC0lgRAWi7vvbjK/tCbdKH7JFJNNGlwzGx1TzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ousOWkVEC4LbVEGsaSseeJEGYiVj0kraW0BDuL/8CkSqjPka6+xHF9lfOdueYY4HuxqxZh+ssXq4gLDx8ExWnc+59ioHRSZN2JZceV0RtPPNroFZMVF5YtTf5HgCDJgHvp0CuDSt9nMT9emoP3eOOk7LozCDzqsfB/fwEjEyipk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=IN+aVr1j; dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b=jXqbW6sN; arc=fail smtp.client-ip=68.232.141.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="IN+aVr1j";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="jXqbW6sN"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1790911369; x=1822447369;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=LsIBzdC0lgRAWi7vvbjK/tCbdKH7JFJNNGlwzGx1TzA=;
  b=IN+aVr1j7Z6ErvEZTDMzaGzCnEhA6N/ypTzcnFscNj0jebieAp+rwJdu
   Vhidd5odE0HRnNxjGRQ4zcdleRyj+kaGNV5d4WJ/xz/tFrOv8SEb49X/K
   8Ktu15Pk15j+OhH6CNQRkToM4TUYtEldnCL2xso5sut5iVfWCdQHAGatZ
   u2qllaoSopnQguUEMJrJWS2opozmXTFdBteyaAJM8PtzmHbmSFmONSGnW
   WIj+kCql5G77XPjWd+dqUIkvuPiGhbRxSOmKmArS8pbSuDvZfT03JuqxV
   ZxG5lvSvAKwpYG45b0W15reNfTM0LFjJD/k6oP/PyUQufIK19UxWbBNeC
   w==;
X-CSE-ConnectionGUID: krJDeyHsQBOfKtA+y3i6mw==
X-CSE-MsgGUID: KhpO9mA8SASycma4pMnOXw==
X-IronPort-AV: E=Sophos;i="6.27,135,1786982400"; 
   d="scan'208";a="156951710"
Received: from mail-southcentralusazon11011054.outbound.protection.outlook.com (HELO SN4PR0501CU005.outbound.protection.outlook.com) ([40.93.194.54])
  by ob1.hgst.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Oct 2026 11:22:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwYUEOgqgjileTQmnybqhfh+TIIuZSUC9R6JrxfXw9LndkXmvV3dfcdMVff4l2ECobMW30J5p8XdtLGUh1+vqAB7CQQxiZqCV7qldi1HR395G+P4iMwy5U6DO+BPShbFHmu8zLP/t48cowdmAoHdBNdp/ekrGfG2BUT6LtonJZPUqFVQozFgzvJTEzpjx8Srgq7fFScxGBYgQ4q0Ju/EphT78ao40kyetmzTPrS/TVobp3RjSel62hE+NqqITn3U0vTTXkgeQBuY63ZjN2xJFX5x8ziX3+2nBnzb7mZXMUJS5xz2bGuBveJPp/ElR2UDJilOOWBkUTKML6Z7Y1ES4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmODLtl02I+L6CDg06oON7M4B6tGamVBfnakzYAT8FQ=;
 b=VFy75CLvmg/MgbHEmHZP6VMkd6m53e5CyYQRlXZ5dSNxIjeVeFp+DTFbJ+CNpJpCAmuuhS5yL3UKYhxuITqxvwF/wQ+mj4fIDEpE9HFfgB6zpVGdtRuMH//oOQDwNUD6C09lZnzK3OoRGLemG42cRbbhunLfOA1Y7b/I6D0x/NPMv6Udy3x17tJjfRk6+meDUOuYtxeQ8sFYGzs+XxpOy/NGsR90pcLYis7qn1UHaucbyboafwGtvmd3SG/uxYzFXUefy95jYjBWBwREGVJAxUvUr+u9ZNBeFRmNb5foVnlIoEYFV8aV17MdYALqRvLF4jZi2I5gnj/PbkJdzPG91Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmODLtl02I+L6CDg06oON7M4B6tGamVBfnakzYAT8FQ=;
 b=jXqbW6sNAD8F776HhbUPzHexByIKnpyOQBdIiV74mn4EOhbZJC7a4RFs5N3oGX+EhHwnDQ4AVnJBDOkeJFRckPTC/aG8pNsFKYy6RblwR0dVLJtQbbjW85JWOpfQI6YoF176Ll5ZCrjami8LvrjyIu3Yb2RRg2aP//88UxJPt2U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from SA1PR04MB10065.namprd04.prod.outlook.com
 (2603:10b6:806:4dd::14) by CO1PR04MB9649.namprd04.prod.outlook.com
 (2603:10b6:303:275::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 03:20:39 +0000
Received: from SA1PR04MB10065.namprd04.prod.outlook.com
 ([fe80::9b98:bf8a:b0b1:ef85]) by SA1PR04MB10065.namprd04.prod.outlook.com
 ([fe80::9b98:bf8a:b0b1:ef85%5]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 03:20:39 +0000
Date: Fri, 2 Oct 2026 05:20:26 +0200
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: hch@lst.de, kbusch@kernel.org, sagi@grimberg.me, kch@nvidia.com, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, gjoyce@linux.ibm.com
Subject: Re: [PATCH v2 1/2] nvmet: defer setting ns->enabled to false in
 nvmet_ns_disable()
Message-ID: <ar8h9B_P6fZhtWPy@shinmob>
References: <20260918162736.802665-1-nilay@linux.ibm.com>
 <20260918162736.802665-2-nilay@linux.ibm.com>
 <ar30Q5H1fuyFtDwM@shinmob>
 <04909105-bcbd-4b89-af41-ad761aaa9af2@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04909105-bcbd-4b89-af41-ad761aaa9af2@linux.ibm.com>
X-ClientProxiedBy: TYCP286CA0354.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::17) To SA1PR04MB10065.namprd04.prod.outlook.com
 (2603:10b6:806:4dd::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR04MB10065:EE_|CO1PR04MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: 637dfa6c-9e94-45e3-b9d0-08df20342257
WDCIPOUTBOUND: EOP-TRUE
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|4143699003|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GuDwGsN4BjY3yvp7YJn99gPcDb2Y9aPuIiWvT8kzHUVXPHj9opMRXQRWh5gLlqRTM0JVlwDIxfNDGGsMcB8ASKF+nvvFWKAqAeIJbHSmrE87+u7Td55uJR2ty3l0Hno3cQx/OBZ32H7Dq8//f8z2QO8BSJVgkHywp4XDgYYF8JpztcPOG/vVNrhIXgF05NaVuLuZMdbRThmPaM4EknaKQS4aTwMbtbp8JTxdCySCa9nFCIjmKRye1vnMySFy+S4pagepKn0tkBPfrxp/PLvlCQQxw4yNqfMxTUKUb5anc7DKCUluff9dh8HAlv3CvKX0Fzkz4UL6btPG23eCab7IRPylvKuSp+aJJV67MvQ9baiALg17s7BIkVRF12FQd5TX88E+TTBMA6vZRD1rNV93sFBHeCfML0Cj3Vh1Kv+VEeh93T0Eg7scnM5N4LLPcpca8XQnkZKT0jlsZ5WulG6XT+gbCr8HDVqpNT0zDR7E8Ry0oJtovmRl1vZ6NA0+52F00/AVQftC/awk/u4Yt/1SDDKk0IffOQwVQK2oHp0e4F0JIoESyee1LbY/OgABvllejAGYqH4rPlHoHQfQDGRZm7AYyYE6+ixPwA7ItEvAWf8R/LG16q7fjnu/REMgepXPMm+gf6L1fxtMSU0Lb508B87a1DZ6TqXbzTX1WSLonO8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR04MB10065.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(4143699003)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LDzcvO49UuejpKSF3V5BzDc09ctgfbuKmgzG11CvwZOQCuu2s/d5uwRCSWJe?=
 =?us-ascii?Q?ss+dLfmjrZQR/wyTwnO4CYJElzggm5J3ft4SmkBq6nFpUQS1HyY5qADW0EtD?=
 =?us-ascii?Q?M+o1NjDyJ4qYsIgDMk/xfQIqnlvK5XjQ8G/yxcbQiWM1ARx9z3e3UibWwwBX?=
 =?us-ascii?Q?+wN8w7Ufs0+GK6kn/pPMzOJv2n6bm6V9gS+xB+YNgdHQqP7me3ITn/iWSXzK?=
 =?us-ascii?Q?TJCG00DEg1P9FO4LJIkEV0zF72AeXhOL8fx7iPH2KOkejMbBEVPmcQz5jGnO?=
 =?us-ascii?Q?09SHSp/kYisCh26zcm6qz10untEO+rnSLy3H4nmq6eu6FsG80rHjyMmNulDG?=
 =?us-ascii?Q?3mX4ZTS8oiGA95BZeywTOb0vEEaJIM+pzehy2/YEljk64ZkvjKpX4veJ0LhZ?=
 =?us-ascii?Q?VzNF0i5xoYg8Yn8HV4d2aHebiGKOdPSOep2tjX2ubNxX5g9zfYTNUksWKdtM?=
 =?us-ascii?Q?s5gBBGteB9xfUjLyu6SwkoFTE6TifjQluuoK5KLrn2SjVIFUl/hd7L+kTJs5?=
 =?us-ascii?Q?8G9itWmjGxsMKCbdiIjAhTDkJ3aHYL5EHMMSrUc5AfA9176+6Emf2vKdYBa/?=
 =?us-ascii?Q?WHCczpW6N4ueRTHaI/aTKxiwdzaIjKzCPZpuBip4e+AzCbd04bu0OmviFHod?=
 =?us-ascii?Q?2O6c76EQZTNoppp96NWBXFCkqCP6BI4/nWC1azkh2fKE6wlD0uCexwDwJwUa?=
 =?us-ascii?Q?MiXMiHtXbp3w0bGqmihQb4jV2024nzqiWh/LdLfONy35dXwOTiW0tL53G39z?=
 =?us-ascii?Q?toRUyrgz69NG/BKzh/vWg4n9aWoJm1GYCbFqY2v4F0lYhoWwem5TC+5htHqD?=
 =?us-ascii?Q?uQ1kmM026Dc+Gm6o+QomQ0PYw/ff4/4B61Z6hGWv0goG8XJ42Koq7NKtxkDv?=
 =?us-ascii?Q?BXknFMhemhzMaFh1ScrNqPQU0ah5k1wihm++YPKAlhGZ+fqIl1WGD7vg67EI?=
 =?us-ascii?Q?95Q59MQdSIEdp6l+WGyjuL6yJU3l6hY658zjUs91vCFsqzA3IV5Mtih/TdJy?=
 =?us-ascii?Q?VgqI8aYzhwSqW+p7sjzID4PJ/5L9EICMBemlalfQYfu+mXVj+oREJy7QJLzq?=
 =?us-ascii?Q?h+oU17+sTaszVgZ0xqLEAszU90uHV3G2LHjywDdT4FXF39HMJYSlIkNS/RmG?=
 =?us-ascii?Q?DZ9shRYGljxLmykqxHm00QBBufE4qzv3oNdjT6p5+wjAIjQVYiEhNpVsmfMS?=
 =?us-ascii?Q?Pc1WtIKHC2JtaNBqUcb7c3+iA27jo7NyLCGYDs37hIUi1GnXeoVj3Xqe6kQb?=
 =?us-ascii?Q?BhOZsOKCNwDPlnwdLhYQxD6s+6qLvMSXZi+GMPsrF9j8sh8rt+131OtpX7jC?=
 =?us-ascii?Q?mwqRK5U9SmZv+b4ZgLfYhF1m03GWs0T1s/6dbPuPwPmK0n4NCt1v/0dnzIKw?=
 =?us-ascii?Q?oiiPLewqEiVyrMJ3UJmVdDVh2XuYO5uxe3Gs6yIG00TQpYP/aL4D+5mv/JF0?=
 =?us-ascii?Q?948AbnNf8fE7NECE5lKRztGJea1dEOb6EKoDhtKgdnFocetCVokdxIoWOZKa?=
 =?us-ascii?Q?Fu69YPxo06D9+e0ie7vsAMWzz1A50BlHnHqksy4dVDy8rlZH5fSFAcaMjmka?=
 =?us-ascii?Q?Gd+ZiKxP1Z64upKdcs/kV+2Q6wQ1BjNfBRjbfKbTpPnoA1Q2GVSztyoLExdX?=
 =?us-ascii?Q?WW/LzseAsYCoZYf43q319+f9lPmc0iJ/Ubvbiw0BsuP0v8UjFPRKPtwxpIFW?=
 =?us-ascii?Q?lnZSpfvzCckCCO55Me8WKK3jVaacRQ0kGhWVdD0xU/XPnvutGEyMwXpvovYG?=
 =?us-ascii?Q?URJVXjk8XRLPXLYKR9OKEKQhFEyZAdo=3D?=
X-Exchange-RoutingPolicyChecked:
	SNi4wF7ilX5/qsoPUyJ4SMUcXdlq+SiAo33NtLTtxFyqnjhuuNpUi1y/ASkfA05VmcKevrmqCLcFfWwOiDP0PSiPmDSMl5kfyzUwG247qn9qR94848Brz3+wAE45XKrwTEg15gcXRAgFWH/kEKeh1sLTnJJLt01okoC9b7L9q/QjVwO32VTTpElbLoRHzlsUhV9kaD5KQvzq0Y/R1sFDKNVOZZfhYls2CihF5coHEfN7AJ9KCyhREppGzFPV0ksDSYv6hU5To1G7nE33mtM/Qw8JN1w1chhNFvhIsSQW2oX0WJmRx3bdYav3VWODEHBSD/fAgzLx3gRFmlTZaBqXRg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	y7ORUIfqiNgNqKFnrjUWUG94t2Siz7Ke0bnvqpDSoe7Y3SZZkc3uVlIhK47SW4Br9pw4VK/0PH4c9QAkVBtud1KxxiWLn438+z+4kWMVGyE0HYS4YE9tmLTmIBl4qYncPz3Mi1/JBD5mSEABYYFkbIU9UTj54jmng/A81hZ9X0LmQwPC5enGFRR1svFY5dYjMZO8kFgWkcyvoKS1GB0WWIjOCErwHYD2QMs7x6RdmDI+w7Dit9tE9WR8pO4YgvmYPWbj3e/gdtQsk4aNl8HYyKEvv87TPb2W0kimotDmZyryskZkLefpNMmDqgS9wMm5dxoQBSBFD3MG5K/M2XSiPNksEZDub+gQpkWhj5UT5VlOecXU4zwh+XUk41HKCsKDDLgcag0b4+cA7urotkjjkK91Tqbr8c/CXjzMW4z5Ar2V04/q4DqOEfsnx8F6/DQRU0mrdY/iT9qvLmpsTVv3VXkuRC0Wc01lEaduHcb+3xKXvNEh0IOBsvULZeAelBfzbXNsYS6JlLTNGfS3G7bJrqyPB1wzaEHxaIKAX5A9WlvNRIopbZHAlv6FXsgRrpymCIt8oKuHNsvsMNrUOgR/AGvs6AzUvTHYavuRlRLJiY7uJKW9/I3Ay+VRjOavEbPp
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 637dfa6c-9e94-45e3-b9d0-08df20342257
X-MS-Exchange-CrossTenant-AuthSource: SA1PR04MB10065.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 03:20:39.7310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lDb/2IgGLzD5F1N8qOMLkkMtzI5+xqSH4XNAIA2ojKGxayiGw01T6CqK0oTKpLKlCJag9Zk0D4rF6cUa6awttrOZenjOR4gjv0wBG+iqteA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB9649

On Oct 01, 2026 / 17:12, Nilay Shroff wrote:
[...]
> > Recent blktests-ci trial runs for nvme-7.3 branch reported failure of nvme/052
> > [*]. It is required to repeat the test case 3 to 20 times to recreate the
> > failure on my test system. I bisected and find this patch is the trigger of the
> > failure.
> > 
> > Nilay, may I ask you to take a look in the failure? I'm not sure if this should
> > be addressed in kernel side of blktests side.
> 
> Thanks for the report! I looked into the failure and I think I found the root cause.
> I couldn't reproduce it on my system, but I see there is a narrow race window that can
> potentially trigger the observed failure.
> 
> I don't think this is a new race introduced by this patch. However, the changes in this
> patch may have altered the timing enough to make the race easier to trigger.
> 
> In nvmet_ns_enable(), we currently queue the asynchronous namespace-change event
> before setting ns->enabled and the corresponding NVMET_NS_ENABLED xarray mark.
> Therefore, if the asynchronous namespace-change event is received and processed
> by the host before the namespace is fully enabled on the target, the host may not
> find the namespace while scanning the active namespace list.
> 
> To close this race, I think we should send the namespace-change notification only
> after the namespace has been fully enabled in nvmet_ns_enable(). In particular,
> we can move nvmet_ns_changed() after setting ns->enabled, the NVMET_NS_ENABLED
> xarray mark, and NVMET_NS_IO_LIVE.
> 
> Could you please try the following change on your test system and let me know if
> it fixes the failure? If this resolves the issue, I'll send a formal patch:

(snip)

Thank you for this swift action. I applied the fix trial change on top of the
kernel at the nvme-7.3 branch (git hash 4a5e49ba0abb), and confirmed the failure
goes away by repeating the test case nvme/052 one hundred times. Good :)

When you post the fix as the formal patch, please feel free to add,

Tested-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
