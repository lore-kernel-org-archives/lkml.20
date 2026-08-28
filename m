Received: from SY8PR01CU002.outbound.protection.outlook.com (mail-australiaeastazon11020078.outbound.protection.outlook.com [52.101.150.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A183F1066;
	Fri, 28 Aug 2026 10:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.150.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787914244; cv=fail; b=LKpJaQAnq3ys5mm4RjDn/BjXkAAOOp9lNFvQ85Mnk/BEnYqezORz/VCJKmSEFJJhzfg2fBd8N5CQoWl5MNDurQM1s12HYPFJRi4t3szduGszB8Wom5ULHbXcFlxNWohQNB+UjvU4ImE+DKUMWp4J2Tr1ib/T/IUea06bJNAjyVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787914244; c=relaxed/simple;
	bh=DsMNJs1KA+LNMjVWNqJB/VDxRZ+tDGOeJj6BMMMrFcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c8Ru5gIZ7cl8MtJTEvb1wESEto61IsPchEcpwdDq1+w1WaC9B+q/viWpKvqTOj/dDW8vWsY4WnAp0/iAqxS52JyEW/L/kEqL+dnpbg3twE0BTGnpSG1cFogon0a8kn3WONwSBJXTvcR8FVwgvVNdoH9OUUIhoy07HcT9UVezk/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com; spf=pass smtp.mailfrom=heitbaum.com; dkim=fail (2048-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b=H6ZSttm8 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.150.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b="H6ZSttm8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ok+Qd//AMFbEAJJ/XdSuGutLOtXHTORlW2kT4kJEATCNk72tnCUp8g+RS6PvjLFTD3jTMlZVzB5qcCnvyHInrOKkNtmBgQbpL5qEm+sx8+3vmWs/5YGNdIOfhVismqrBsi/C1XeyGPFZO3R/rM8nckDNVE5OG/dRh1RjEtEj797lJGGWvE66Rt6a1/8G6QrPTS0KXmNYcWVJTOhMVNj4tJ69+vEG8FsKfK2Fip1gZA/QUML2KWcYe4qPA0EDl+GKYNhqabPHcq0UAcdRQYbYsN81tBICrQevBE0VvBSKlFeanS+RhXsn85PatcBFQD2/+yZPVmhzXyoRhpCMkw4MyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jj3i/f++guyvvv37GtQcyxTfuNpt6xoSHOVY9ZaZeSs=;
 b=xCohbBK4+t1UtyUfvjaLTGG59xTX90vK2/vHFGIiC6psDFct5x4YzW6c+Xwiq3VYWiPguk4gTFJJqUqoEyBRAtq8naZWkK2EwfV8ZZAD301zccOwDnCe3mYe1eGd9kcqjt7lhLELJ5HGy49cbrrRgLyJ1Nb4WMkpsTZ6OB/FwGTwlfV+WB+xdF2PZKAJgUDEEo0rcL37AroGKXKSCtxkouI99A6DOaavJzKWVCmTg3LHgxXqyu51rF1FHZ/E6ghiPNrJLX/7GkTGL5qUyHKKdN6BvGQgfspBOA8/fH4aqOy/5YZt/SyZa+20yXtzK/3xvIWEQo5PswGgR9l5JPtxtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heitbaum.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jj3i/f++guyvvv37GtQcyxTfuNpt6xoSHOVY9ZaZeSs=;
 b=H6ZSttm887XtGh7cYC8RF5+7ozAXn1NdtBOcol31QOXIVdwD/sqkB28jgKwZy0+s36nI84q+G0cujE9Pk4JH3uYjk5JOjcynPd5BRXff9Lu4hdf4d+d5/Prgb38ZGL3qYPXfUkVNfw3HiuyDhLMfazJ9OGMB+so+0YmsHn+34cnFgCp9sOOs+8yqY4Roq1bHPYgAx+Z5ibMD7YtDZIx6HNvs6R/qZ94rZ+7vWwMZfWiBpsArCxwkKRLsrgIQSk6HmbLa6TNbQYyIImupxRRF+byMuT1c7H/Sciu8No9vKtWZIZEpSWZ5V5E26hWpsgBFr3Gl1qaNQLS4kxCOKKg8gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by ME4P282MB0758.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:94::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 10:50:37 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 10:50:36 +0000
Date: Fri, 28 Aug 2026 10:50:17 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: rk3399pro-vmarc-som: add i2c2 scl
 timing
Message-ID: <apFn6U6Vq0nwaAMo@5be1eda4e59e>
References: <aou1Q5-hdF7kRVpe@0d3a7a881997>
 <6298523.lOV4Wx5bFT@phil>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6298523.lOV4Wx5bFT@phil>
X-ClientProxiedBy: MEWP282CA0130.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:1d1::15) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|ME4P282MB0758:EE_
X-MS-Office365-Filtering-Correlation-Id: 831cc8b1-4ad0-4347-eb29-08df04f230d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2ZH+ScBjouBk8OWMlmGLbk95FdGSbgsYguatI48tc7sCujo1ueXrIRUAzuKMI5K8yllZvodFPNMehnHhIxcEtIQdHPWZaug+zjzyAya6dVA40lLmL6V5LtubPbYE4HWchOaDq7Em83XHUWhthBX+VufbdEOh9xYCKCenROkBdp2Jq/d5SsNqEn0ewaBT786t+Z4X+sqLUmgymsVyPEmhbunsPQPP6Xt/4bJsaUOfOJZvdM4b4ioG1VD05DTL4JNBUF+6pJ5JvuyqfNBYBJy4itanauguOjh4RHohuyHZKE4RQv1tYC+j60a6rdmXsRrmsdgaJHhs/DQ2lcAbMgwHPLdQjWNtbfjB5Xz/i1es9XznBVnoP7VT91Zi0Nqzu8oepqMXC2Ix9kNr0QuLuP6lBNl3tFrZvJ/0DdS+Ku5hV6b+2xq9hqdYK/YYqkVLo4AeMGpcSqh2onxww+TET440Ko6Yi/VmiTo7W2WYOMC7q3svEspsLKylehbA5FFRi9Vy3Gpo3b+lmCm1DF3640QiNVkmBv07F/a/iUXwohu9mvbHIWDWqOexnEsEscZeWHlsLayKqwmKSO6cvNY0a1N8Xhfpg31L02BrO6bchU6y4zPEqxQR207qj2yofvV+zmAVuY4GY8d6XlmB+c0Fm5+I0v2rjW8Mkoc8FfXQP4VfcGM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?zLWesyqckoiNZ9UEHHpUP6JErI9fHvRarq6JNgh8Zo5RSpJt8zw4DjOmex?=
 =?iso-8859-1?Q?oMcXbKP932d53kdS88Scebkb4uHQSYNil7shoZ3YHi/I3uNj546jmve5zV?=
 =?iso-8859-1?Q?kRkpVgmGE4CieDAVNyw+/nJ74B1GdtEEynVxZ/nzVNOCrhoJPAINWHAkmD?=
 =?iso-8859-1?Q?sKsvGH3mdF/ftC4ywijakf9kHfCFt4pAjl9k8oGmSWKv1OGEV9ZIibExRr?=
 =?iso-8859-1?Q?nHyeErzpO8IUpMeRBzsOBYrT8SdtYriJflv+VJfBp6KbBuFLqZEGpERp34?=
 =?iso-8859-1?Q?HCxnwrfP0+iFfeUkUqvdKJDvORnAsItj4T7BBhvN/LsTBXIU0jRrJqI9Lx?=
 =?iso-8859-1?Q?YcKXXqdb+X5Z2DqvHScM9SkJmXSEc7QS05C/NZbP4DRhHfgMCyjFGxARZG?=
 =?iso-8859-1?Q?/dO2mZuaaZa5naKS1AaCKkwbv7xrb52jIZfnODyQY3dZszgS7bKBBRyR+4?=
 =?iso-8859-1?Q?weng7nEq7267VbS4eJUQZpZuL6wIBK4kWQHVV/cWX5CET9O4ySl6O9mGA5?=
 =?iso-8859-1?Q?xfCkm9LQa80gseE5U1DqZpx9gE0ngp4ebhf6dUsL4h6lBekOhGhh2t4+UL?=
 =?iso-8859-1?Q?f785CC2F5gVJJDrXLOm/niGEkaus/8eqqi94KFeeFkr06tO14UIwCXo47M?=
 =?iso-8859-1?Q?p3c78RMer8fpQyiuJOe7yY/I+LWyLzepcwPZfIs3VWJUhYtytXErBEI5aa?=
 =?iso-8859-1?Q?zQKJG+OVTyTdLcc0kcwBaSiVJ6ow8u4LARDqVV6y/wKfIBNA//dHYK7kf/?=
 =?iso-8859-1?Q?vU8kMcZ0o76LtEHf7Te/IHZv4jFK2PCsiwXW4wPBOAd3IKpK3eX8lE5Aep?=
 =?iso-8859-1?Q?wydzBynzKcBHgcbpRD6Y1WSAyPGA0nUV7hzNee+Xo6ws6ULhXLPwgyo3Df?=
 =?iso-8859-1?Q?edbL2NtvmKMFZUUTeXomUrX1qOkTcGgiLZWpCVskdZ8tzgNeMEYY0jnbO6?=
 =?iso-8859-1?Q?rMRajosPv+s6zRaIPrKf2m+hL9fUdHNCA3dk85MhNcxfN90f9RO0DS8ed6?=
 =?iso-8859-1?Q?pNeakfFTmL938n1ByVV6oS75XRlUB8r3lBuQOTiCRNzaZDUpPJatu4RVRo?=
 =?iso-8859-1?Q?x3Im+mPYKph7vxAJn0qpw87mZDeSvOMbolHsMlT31sRgoNdDPiHhDcjljv?=
 =?iso-8859-1?Q?ihTWdjKgZ/Cgm/Jll/BCHoyzley0x5JJp+WgYSHwz+442MX3fdqIVBv+4m?=
 =?iso-8859-1?Q?FIf/0p2zlAK/nKJytfW/UD4f5mq5RiGJiZ3/PT7mbZSbes414eCgh/ZJf0?=
 =?iso-8859-1?Q?cTaIz8VwHE+TEty/rEPrBkrFS06hBGXDnU0FXLTV/EcVGjLPbUzk9T9Io5?=
 =?iso-8859-1?Q?7pV99lSUhsfwTo21Rlf/bM8n9ENX9Zu1VWqcYeyHH/GSzoVuWAfcQJJ/i7?=
 =?iso-8859-1?Q?OF/w0d3eS8tX6gyxt2xTUepYa2a1DjcCqdsnzQveY9krObF+Rwub2YBjDY?=
 =?iso-8859-1?Q?byDB2qr3Z4PKjgIxnXyxdpjo4NhHijvnhMd3APqTgMkmDacrCmsDuzf12G?=
 =?iso-8859-1?Q?2uhJnKmKRLW59Af6ggkuMzJuZ0lfpjoWPhPM5O6V2zfifGT0GRV8kpr6Xp?=
 =?iso-8859-1?Q?6WyGtsfGefoUAL1Idg8yTOIryAyOlxv7Z2Q4dk3Z6OENKJLRrKli5+/A2L?=
 =?iso-8859-1?Q?8ptM9S5q9I6//l6VzK9TCl5l5zUxPW+WHtnwt2mKo8WHOWCqoD20RAcfir?=
 =?iso-8859-1?Q?6Y1jP/6KSjT1b40NbLjluRakbJSbOXr5t5fcM3jAhGTTS7zjL1VYQyIf0n?=
 =?iso-8859-1?Q?74ffq5wrr90MrhUovxCFxNrSao2Dp4n1aaRoq/XOhNt1mc?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 831cc8b1-4ad0-4347-eb29-08df04f230d6
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 10:50:35.9230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ts1XtMnXWNCuZd707PjBdH4BdvywoJSqoxCBU0OnrkOzV6LaQSll4OqjlNBpuFfJQ9kIXovmbTjUwBHvQ/H/2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME4P282MB0758

On Thu, Aug 27, 2026 at 03:18:01PM +0200, Heiko Stuebner wrote:
> Hi Rudi,
> 
> Am Montag, 24. August 2026, 05:06:43 Mitteleuropäische Sommerzeit schrieb Rudi Heitbaum:
> > The hym8563 on i2c2 does not ack:
> > 
> >   rtc-hym8563 2-0051: could not init device, -6
> > 
> > It is also the ext_clock for sdio-pwrseq, so wifi does not come up
> > either.
> > 
> > i2c2 runs at 400 kHz with no scl edge times. The core defaults both to
> > 300 ns and rk3x-i2c calculates a 900 ns high period, which is short for
> > this bus - it acks at 100 kHz. Set the edges to the values i2c3 already
> > uses, giving 1050 ns at 400 kHz.
> > 
> > Tested on a Radxa ROCK Pi N10: rtc0 registers and keeps time across a
> > reboot, and wifi activates.
> 
> You tested on a Radxa Rock PI N10, but are changing the vmarc-som?
> I'm not really understanding this.

Hi Heiko,

Thanks for looking at this. The rk3399pro-vmarc-som and the dalang-carrier
are sold by Radxa as a Rock-Pi-N10. Radxa sold the Rock-Pi-N8 with the
Dalang carrier but with a RK3288 som (I have taken this into account when
making the changes to the dts files).

I had previously looked at completing the bringup done for this SBC,
but on revisiting the bringup now have been able to complete the bring
up of all IO on this board, but have considered that the dts needs to
be broken across all of the 3 .dts files.

The fix 4 patches that I have submitted so far are the dependencies for
the dts to work.
- arm64: dts: rockchip: rk3399pro-vmarc-som: add i2c2 scl timing
- usb: onboard_dev: add the Rockchip rk1808
- Bluetooth: btsdio: Do not bind to non-removable BCM4359
- dt-bindings: regulator: fan53555: add tcs,tcs4526

The followup commits are to the dts files:
- arch/arm/boot/dts/rockchip/rockchip-radxa-dalang-carrier.dtsi
- arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
- arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dts

https://github.com/heitbaum/linux/compare/1b78070aaef63512688aebfbc82365ef9d6660f1...58aad007a1866bfbab8393f779687ff1ec005209

Thanks
Rudi
 
> Heiko
> 
> > 
> > Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> > index 64e6ba345739..074f09c6d11c 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> > @@ -296,6 +296,8 @@ &i2c1 {
> >  
> >  &i2c2 {
> >  	clock-frequency = <400000>;
> > +	i2c-scl-falling-time-ns = <15>;
> > +	i2c-scl-rising-time-ns = <450>;
> >  	status = "okay";
> >  
> >  	hym8563: rtc@51 {
> > 
> 
> 
> 
> 
