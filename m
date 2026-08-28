Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazon11021099.outbound.protection.outlook.com [40.107.39.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FFA39B481;
	Fri, 28 Aug 2026 13:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.39.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923500; cv=fail; b=KO2myVvaRJ9aj7tEzIqXteDoyOm/YoLhmDch8syiatWyNyglPiR19bpnLDF8YaYB/GaJg0mSUbiBe7mkL478WcIog+lu4kavP/ywSaBXjE9Yx3hUlvOeuv+S0hdjAzMktT3YtDfwxIm6gXMSrVzMN0KGIBJeNkpbBJJttMbQVa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923500; c=relaxed/simple;
	bh=BGVT4wwlodlCHvORh3Ucwpq/M2RdwISQvfrkdmb8qA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PRJIzEDLi4u7rAKa/4FRAnf8C43qRo/r3u3FKn2o+Gd9oBPnOBkL8Uy0W0FN20wzPLsmJQoi94adocPnWCwoPd7NziJ0j76zAW+vhSYdT9GkBQoZyxfnBob3+9pJGubbF6aUWMJ/ckRoWFK/3ielkf14eOZLJU8AcsnGKi4HQfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com; spf=pass smtp.mailfrom=heitbaum.com; dkim=fail (2048-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b=OGbw8qcZ reason="signature verification failed"; arc=fail smtp.client-ip=40.107.39.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b="OGbw8qcZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JyDWkg0iCVo9grs5yBr4DhJSvkrQyo9m1ZF1RFpQiNh1d6OD45gyVBcT3bu6A0ZROCJ5CXH4fEOBiOT2oYxxLNvh5dCP0++W8IdugKg7eeG1xCD4e6xTWc0R2Fl0MTf1jegjNZJoYfCB5mRfbR7uRCUopUTQsHlnoiszChz5hbZICGH3SnGQ6ZfC0cI7Pjuq8Q1Vf8/mOwwDQikugZJcbGUSGlmCqrvRCkCMRX8Jzshd6N13P3sT1OiTkZlSFyX36+/QY+irfX2Ic8b964uXVHRO7HuU7Gqxrs5aaGaH/9hAjweAbdbtrtxxx308UX81PTZeUjjD4z0AZPVdPCtGvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8micJRkkP8PG/TC8SAHSlqdZY8MnfQwHfpUTwjzmHgk=;
 b=kwFo/TZPcCGbppLtJ02YS65db1PHuAWb1a3Io0IFHldfavXO323gN/AyRXcl0TYAIXa9Q/Kii0S9Vki9cT4HC8BR+5Brkbzj512odJvKoP3rhwa9X1aj2m/sUEvZbhJC7UsGFtE7z9IPrPcyB8XMWyItJ9YaLQjbPR+I4Z9GdRGf4Ly0QOPHK6aSNPkmeo8IGZmSOpgWYJ3pn3L+x7cWa6WoLoaIROipCfzr2dwHm7ksAvXi9WlWGfUx18V9E3uCyEesXTBvUeX5hG5A9xh5dMweoeGUfOHwupYkRzmcwET6R+4EbzQG9GRCRxpNsg6fhC8W2zTUeS2XAzu3QqvVuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heitbaum.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8micJRkkP8PG/TC8SAHSlqdZY8MnfQwHfpUTwjzmHgk=;
 b=OGbw8qcZbyiWoSuUKs4AT63fniJzLapSCxeA5X5wpBlpzvVYm403Kvu0lTEzv3yUhg8KZnmlRdheGR9OgmmhgdVeAzbQkPce6mzaXMaiqr3qgmTpSFoljfXwoLumtEkr+N8/ZXhOI3VIev44zqdZapHMc4rWuxmVZCGlHJhLU4cI6KmGObn45rIKwB03axz7evu0PzMfu+sUQnIjFB2lcXg1GGBMQe/zrHQg1atKb3owZ1YCi+t6si1FCW533uNTsoZAITzGI3IpUUF2AmFc2yzplbAFq7XB2tcHOlR+PG4w7sPhuwRi0VquF4nNE7oNzPzn7sa4ENvvMA5YUZWjLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by ME5P282MB6017.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:25a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 13:24:52 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 13:24:51 +0000
Date: Fri, 28 Aug 2026 13:24:34 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: onboard_dev: add the Rockchip rk1808
Message-ID: <apGMEsCwly8TCOww@5be1eda4e59e>
References: <aouw7rH6FZxscUTO@0d3a7a881997>
 <5096877.GXAFRqVoOG@phil>
 <apFpPP1O45BWXDv5@5be1eda4e59e>
 <4512468.iIbC2pHGDl@diego>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4512468.iIbC2pHGDl@diego>
X-ClientProxiedBy: MEWPR01CA0197.ausprd01.prod.outlook.com
 (2603:10c6:220:1ee::9) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|ME5P282MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 40442946-6b2d-4100-ba06-08df0507bdb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|56012099006|18002099003|22082099003|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info:
	nO1wKxR3IhzPndRGilA/Y1mARG1+FFHaEy7Xvogwr3tmB79i+Id/kJeOQnUR1Gee6XcSy6T3VlevwRO53A0/WwE/oPpVSrT6P1mfW9m/OYaEKeXo7x4f5SvTuR1OR4djyrvBti8i938jvse1EuhyMjgEaNfhacrRN+FmFRqwP52Iz12uHBYLU5zJocq/nQsdHkt0cqsbDC5rXd6qIZNO2gEjwaaSgjz8SPwAtsoTjtyehIw04WLeK53CrEjeoCj/EPbrgN/H5WS6+k/wDTS0CTf78Eqf8RG1WGmyn5SpZi8UttdUi7EuxeDDfQom72lEFpldbUKLFOl9J/BVNYu7WRoW8H8R9gWH37kF/Ry6Gas2FB0yIFoSmGALLXvk8ZO1HypWGbadIb2IKchYnzUskdrOqzjhVCiDyeVxfRKhU8G7oDsESaMEPdL45I5augBA/oxbEKmf2OY6xeMv3EIURBi1ORw3v8w8wvK3Q5o8wmDBLRjMhnRSWnXESli2GQNiubJJ5etW2j1BQvucholNxWxbw8J/pI9bS3T40uXfckI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?2O2iPkiZBTsn2HotlIGayyeYtsiKRiED+/j8QE8H1Yc84EhBOXJQndI1gE?=
 =?iso-8859-1?Q?9O3PDSxcvotxba+XjFUCepHcWt6djsxVtxG0jVUGnKZaA8s1nPb3M5/yyq?=
 =?iso-8859-1?Q?kSzvmgbsmRZbMUCHrfhuU2b7jeNGeNaXcPxeC07Njs5o4HyXDGzYxc2iql?=
 =?iso-8859-1?Q?b6ekcqK/Xw4rucyMKNLKn3KymuTw8o2Jq/UbaSsPSxfcZ+3hWIZtAtGGQ8?=
 =?iso-8859-1?Q?k9Fsguykd/LQZtT5koHxUgzI4iClx97THbJWwn1+i+dM2ukN1jiZ4qFx9X?=
 =?iso-8859-1?Q?KxxiqVRiZFE04TtLw5LvBw8UYMJouuSO2brGKRuBY3tb/NY0Cs5wy4LnV5?=
 =?iso-8859-1?Q?yh2kD8xb7hI1Pq6ZeQPmAzpT691+MoZsuVw3H7S60BA2bR+L1vZPqtNbgm?=
 =?iso-8859-1?Q?NoX+em7J8mNkFm7iRzgX06BRl+qRcFDR1xIzVVkOxcpZ/OaSFIX1ln0R6I?=
 =?iso-8859-1?Q?RXGyEnAgESh3Ke3Xco1deDcPLhe35ZtagQRwTWk05M1BUJz+NMhlhhGJT7?=
 =?iso-8859-1?Q?qMHmsgbyQrEf9mKIB73vY+75H7EddT+o482aGUljaGHpHnMssu7/Ofw5ZY?=
 =?iso-8859-1?Q?0DN/JS0vWIbmAdbOr6Spjh4qMg8C5GjYi/5Moy+h/DAhV5YJ8gKbgIqjX6?=
 =?iso-8859-1?Q?wZpQYF4+GNmvvVsUrnvs6uBPszbVlDnoisIwCM67m2bQYVfKs1LiQ87rOB?=
 =?iso-8859-1?Q?OSz3V4jIi37E6+uXp07zsqlSmtItSjAkdq4iWQY2tRfVzRYO9T3d0Qae1c?=
 =?iso-8859-1?Q?Ioeo5euHdxPqAcx8yBDgquicQhvAaPet9qFcFVYCjP3tJgF1fbSZ0X8gRM?=
 =?iso-8859-1?Q?tet4ZNRXeaFoV6zfYD54zzM8pFQCGfrtnoW2bF7/DHkVykUPrtMdYouMO6?=
 =?iso-8859-1?Q?BcVEf9nFvJOP7q6Xkl9bhFQHQ78SwMjdZtGVQpUtudh+PCgFya4Pdk2cvV?=
 =?iso-8859-1?Q?Hc8B1zOJPNaVVSGGfu5Imx10JJfIrHdA9e4n5syRNG1klWah2Vv2k1KttO?=
 =?iso-8859-1?Q?EuxfV+QQKtcmEVXzfWSmCzsl6pw9my0Tix7AQeI12GK4c4XHRh7DBVVEmq?=
 =?iso-8859-1?Q?7LyjcmWcAB//CsRaRMCUbrbmwZuu7EXQl/aUfMSxtpOA3zMjwQQ/4Qw3JP?=
 =?iso-8859-1?Q?6G0dGUnKDp78OsoVCCAza/eMO5CKR2WEMVTdE2Z7//Zf2kNFpyjnlpUYKP?=
 =?iso-8859-1?Q?YZmMxeuARt99tv8Y12J94/kwu7l4G16aRZ0LhHEsRtxVd4dZXZQjZFa9Bw?=
 =?iso-8859-1?Q?OGB7J1Jn47HH7g8R5Bv0vE1QmSy5/ulJNSgTE2Tn8BECysNn0KnfgVBsPG?=
 =?iso-8859-1?Q?sL2hEd8NgpfPKoHv1CfaCkGtCxOKDansIPtfbj5yy6GXfX/4jZVSNBEL9q?=
 =?iso-8859-1?Q?HUD4DQE8nZqNzhj3+Qh3q+RyZXFuPFwZBrpmiBU5c6KBroVcyCEHL+T5di?=
 =?iso-8859-1?Q?sbckEmqm8gSshas4JwJGMdVcNaKqV9GowunBmg6XMKGVx2w35MTNVItub+?=
 =?iso-8859-1?Q?vC8rY7coN2PfQ0THUw5VezUh4TTXDpbOY1J2RuphuTQrgol/AGHHSh0ULt?=
 =?iso-8859-1?Q?3plic4/UYVXtWC9TJuR/uC7HBjnGnrsM2R1+KuMOazHbDz6naWOLJZK6IW?=
 =?iso-8859-1?Q?G/qpHU/m3qu3NM+Bj6o5JqDjSITdzI/MccWkfrepukpyc/5TbHwXevFLrc?=
 =?iso-8859-1?Q?80p91AIpI0Of8jXDvBFL1gNLmeeld6gj7C2w7blxXd7bzctL8RnrQzja0H?=
 =?iso-8859-1?Q?S8aQldLIxU2SwBI8sA1GFnaPPj4ANk41QLhSiPAWo4XXAKez9xR+n06s+5?=
 =?iso-8859-1?Q?cFbXdmFPLQ=3D=3D?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40442946-6b2d-4100-ba06-08df0507bdb0
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 13:24:51.6960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MtAPFGRBIiKDkJ5lmo3BixPZhvhbOeYbbUZSf8Jl1ADcBFAT/umhWWqAzuO4s85fl2WIn/hyDUZFY/BvwgJtmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME5P282MB6017

On Fri, Aug 28, 2026 at 02:14:22PM +0200, Heiko Stübner wrote:
> Hi Rudi,
> 
> Am Freitag, 28. August 2026, 12:55:56 Mitteleuropäische Sommerzeit schrieb Rudi Heitbaum:
> > On Thu, Aug 27, 2026 at 03:25:23PM +0200, Heiko Stuebner wrote:
> > > Am Montag, 24. August 2026, 04:52:02 Mitteleuropäische Sommerzeit schrieb Rudi Heitbaum:
> > > > The rk1808 is the npu die in an rk3399pro package. It is wired to one
> > > > of the usb3 controllers rather than to an external port, and it needs
> > > > its reference clock running before it will boot, which is exactly what
> > > > this driver exists to do for onboard devices.
> > > > 
> > > > It takes no supply from the driver: the rails are sequenced elsewhere.
> > > > Only the clock matters here, and that is already optional and handled
> > > > generically.
> > > 
> > > the "elsewhere" might need a bit more explanation to verify it's the right
> > > implementation. Even if the regulators are always-on or something, we
> > > still want the supplies defined - for future uses.
> > 
> > As follow up on the bringup of the Rock-Pi-N10, the proposed change to the dtsi
> > for the rk3399pro-vmarc-som is here, but needs the provision of the usb first.
> > https://github.com/heitbaum/linux/commit/6b114b6fff4022c330003d7f70ce09915ffd774f
> 
> I might have formulated that strangly, what I meant was, who is enabling
> the power supplies.
> 
> The "NPU Power" part of any rk3399pro schematics (should) list 5 power
> supplies for the NPU block itself:
> 
> NPU_LOGIC_VDD
>     --> regulator likely named NPU_VDD_LOG_S0
>         --> enabled by NPU_PWREN_2 gpio fixed regulator
> 
> NPU_EFUSE_VQPS
>     --> regulator likely named NPU_VCC1V8_EFUSE
>         --> enabled by NPU_EFUSE_EN_H gpio fixed regulator
> 
> NPU_CORE_VDD
>     --> regulator likely named NPU_VDD_S0
>         --> TCS4525 regulator with voltage being set via the i2c controller
>              inside the NPU - but enabled by the NPU_PWREN_6 gpio from
>              core RK3399.
> 
> NPU_CPU_VDD
>     --> regulator likely named NPU_VDD_CPU_S0
>         --> enabled by NPU_PWREN_4 gpio fixed regulator
> 
> NPU_ADC_AVDD_1V8
>     --> regulator likely named NPU_VCC_1V8_S3
>         --> enabled by NPU_PWREN_3 gpio fixed regulator
> 
> Naming might vary, I found just some EVB schematics.
> 
> Someone needs to enable these, so the question was, who is doing that?

Hi Heiko,

I hadn't looked in to these from the mainline viewpoint. I had been
using an adapted vendor script based on the radxa npu_powerctl binary
which reimplements the npu_reset sequence over GPIO.

This has been the sequence:

gpio0 line 4   NPU_PWREN_1   -> 1, 2 ms
gpio0 line 10  NPU_PWREN_2   -> 1, 2 ms
gpio0 line 11  NPU_PWREN_3   -> 1, 2 ms
gpio1 line 22                -> 1, 2 ms
gpio1 line 23                -> 1, 2 ms
gpio1 line 24  NPU_PWREN_6   -> 1, 25 ms
gpio1 line 0                 -> 1  (reset release)

I have the schematics and the working N10 here, so let me look into
describing these in the .dts and update the onboard_usb_dev.h.

Would you prefer that once I have a working and tested dts description of
the rk1808 - submit the onboard_usb_dev.h and rk3399pro-vmarc-som.dtsi
changes as a patchset - or just update the onboard_usb_dev.h as a v2?

Regards
Rudi

> Thanks
> Heiko
> 
> 
> 
