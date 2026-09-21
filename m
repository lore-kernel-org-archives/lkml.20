Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D067F490C0A;
	Mon, 21 Sep 2026 11:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991650; cv=fail; b=bvX3LkdIkmAaQEc8OWScHCftDNpaEIzhcJIBwQDPB7YA/pkbM+wgLvO9VI+wpjgzJxgJFOdqVB8UsE2ZTTKIBEKK8+asUgL+lC5HtUa2BevzM8QbXo1Ac+LU/pUf2Z1TXQdRSQgvxANAvYuYWyEKiYwKOlCRJc9zYZ1TsN7GlOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991650; c=relaxed/simple;
	bh=pHAqDlI+k+WEuVY7yBNIs2l7AjigZRwe2jEZd5a1YyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qK69yN/OrLgTvZCufFZZ+mFTTlzG6QGV+0rinIOn+Wh55vQnOsJd+3zkZnuow/4av3fXQiGSvg1bCynma3AlQM7G34FwL4er33So43tka29JkAcjtonpf1l69oBbnA6pjg07Hc85h+mcSiwHc84kiEtK2N07t2FUo+kmmzdAcrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FS0QFT+x; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=O0Ft0l1x; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FS0QFT+x";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="O0Ft0l1x"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L4iM6u538252;
	Mon, 21 Sep 2026 06:53:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=dd9nLIgMnaqG/ahdb6
	+rauMGaJP/Ck09X3ipPG5G3T8=; b=FS0QFT+xwctMziQzrlLu5NKtMuscAjHqIk
	a9INxBhLVV8oP8c2RQHN7C7pvbQE7z1mYMQh0oUaYVaKXl/Bkx/G/9jTfRGi1rQc
	X8fQztmRWgPEnZQOSfMSMRkqAgXlypl9St4UIQlsaduL7qXVsMaGK4zdqg4qnWkk
	5cDU/O4eV/qO8Mmo57xf5dqULgt41zwtbyyYS40jAEBG6nsopgHH/3M2ToyW6oVr
	tUvcGvdADAdnphR7BaFI//0thclpt6pVUqRDdXEXAzZLIWIYmSxRcwJ8b48dB8wg
	4I0FJYTSUfbm0+1LDrVjgGhEhU+of00wR7hLODLVNWQjZvVwm0Kw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020079.outbound.protection.outlook.com [40.93.198.79])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gsqt09yfv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Sep 2026 06:53:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=etwG4u2Ik49Aas5oh45GONwyhtlwoTbwlJn13hD/QLMKbCsN/kG9xKB2+F38tCaVu8qrx5ItIwthQ/zf+Cty4fYFl3kF9S0c3C+T4AUuGXya4rjsDOQ4MSKDTO0i9uM+BqzLVCMABCfCDy86IsuzuSghKbWBhfUtYZUGmeVZRGbNubyJupwQ8l5o33Afaw2aRUBFqMxx3V7q8ysKriul/UCYlbt89VtXVWiVUa3YeAwfd719kG0hE5CxJRQHiwllnq8sLFzyix0G551b7IaDpKiGxG7S1NslcrtG3ZFWXcsyUtOLToMbq19RGTNlQsvKJkvT102H4OqG3Qeya8S2fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dd9nLIgMnaqG/ahdb6+rauMGaJP/Ck09X3ipPG5G3T8=;
 b=qETORdIxbyVZ619VJVEWNsXVGn5yGexNg05HkP9BJ7cHDcNsLT2/tUQHHRoCkB4cpTbph0LhuIrL3fuJk3SxocMg7lnTtaVnzAUa/GPzbbX1IFMfoBIkpiaAsLTURQyRzFO4NaGi3FMdbQkl5ENqdjtGHxY+xfTOfZJdB2I8s1rXcDoo4CKeg7JVemi65Pbo2nje/SXnuEuSa+pfr9PQ2kl5F/R8Zg7cZbg/+kWQeFr6ujy1S/VJ8VK1el04iwSD7pSaZumdk47lach5e0/xwFh4aYI3NM/NuaV3rYG5ZgM87korGvM8Vqb+SaRGiLxUfhnSlgIR29ZQ7BQugZEt3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dd9nLIgMnaqG/ahdb6+rauMGaJP/Ck09X3ipPG5G3T8=;
 b=O0Ft0l1x0F7RjMPN+aoMZn+lchgbQLbqOCDr0ROrw5odiVcuZrPx7sqtwiLCIwjvJ7gFSAZiKt6BOxa9LyorTmiIO5SyPswhWEUYbrNc/JelmVdV4z8OK/r+XKfxMpR0U6MOhR59LMl2ZADuLnC8mEGyE00nSOKEl+frw4k07o0=
Received: from MN0PR02CA0012.namprd02.prod.outlook.com (2603:10b6:208:530::9)
 by BY5PR19MB4052.namprd19.prod.outlook.com (2603:10b6:a03:222::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 11:52:57 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:208:530:cafe::1f) by MN0PR02CA0012.outlook.office365.com
 (2603:10b6:208:530::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Mon, 21
 Sep 2026 11:52:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.0
 via Frontend Transport; Mon, 21 Sep 2026 11:52:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 84456406540;
	Mon, 21 Sep 2026 11:52:53 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6C7C1820247;
	Mon, 21 Sep 2026 11:52:53 +0000 (UTC)
Date: Mon, 21 Sep 2026 12:52:52 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Support Opensource <support.opensource@diasemi.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 15/21] ASoC: wm8985: Move regulator acquisition to the
 bus probe
Message-ID: <arEalD61KwxqRt1g@opensource.cirrus.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
 <20260921104640.1941554-16-chancel.liu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921104640.1941554-16-chancel.liu@oss.nxp.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|BY5PR19MB4052:EE_
X-MS-Office365-Filtering-Correlation-Id: af789f10-989d-44e4-8f67-08df17d6df44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|30052699003|61400799027|23010399003|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	KccXhX9sz9PsJXKGo+ESlHn/G5kO/ELeclLawZElG4HGDSk6NGk/NYo+piWvFGt8TjQEfU+f4nUVzBWPxWGAd+zWDwu9lzyDz2vV0Yerc68nJnuGL31U3i+4HHn1oTrYcUlz2YUcLv04KmStvsT1T4EaCWumhXfk2tS0z9hcJQuZuqQEpXN+GyT2iNjPUImRf/SusGVjcpq6IOe+16CErDjj4TA5fnIjkdXuA/xZo7G41lvv5Rucp4FNq5Q5f5Eu7GfZX+DfWuCYelygQ11NSRVt0cNHP/zdNYCIsBlaj5/0Hd/splX9+g9p8gGoG+jNH6QNtdoceFCvxvRE4t7esiiY1lQq5LjVUzewEOCa+yL+d4m6LJo6Z3y3iMMp/2yh9dQ6W61Hm75ZWWRG3xMX+JTZbtv3B2MTkamhw80WtTTjL1VET1p/+Wbel7Ie8FG3v7dgOlY3BajGv/p/JoZJhwK0C5jvY2W8MZAoHGYMTlwwdwDOIeNPuDrNhS5eydpRHAQ4Yxd1rLqIsjAXvvh3jdyFNvXxNiEK4Xdm6jrqD7TT9iR9QZSa5jlPT5pl4j28Ed4mQvUsw0Ik7hIm5Q1m2oUWZgL3e/jai0PLcuSdNNOrtnFxJ30qSJSrdWsp6TnA7AhKfH3woAYBRCcyMuTY9phK2gbKd2vFVZdWRAiJOKI=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(30052699003)(61400799027)(23010399003)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZSjnV7f2R/ACQkAx14CCIcoaD3fOck2fw5R308OYbc+SdgmTh77aP/wUeCSfabJTSwSzdA47qtk2uY5QSYIjqYvCn/azg3RThxdpYluUttjTi8Y9CKoRPALSFnvn4h7a/bUTecsd1BX1mQnQnS50J+67BcjEnNvkaVYG6b8ArRobmXt6MPN9OYCC448tOHGPaWz+Y1UZ+VzrVHNo3THCbb1NwE8x4hf2KAAtG4aGm99DsbMDDFcXZFE+xICktF2YL7vmRExiunHq69TMUSOMDsaRHpe/TXKZ5cKu3i/9VK77OYSt05ONjr5l0KuUCu5kUdufM+c9agkWEmFb0Bt+40p5aMozTUOWamk1REAS1GXav+9V7ra6YvhfQRJMI8xlEi810Hg16nwzKMLc+aScW7dhedcNjVKH1yFBq/tjG64qpjCnPOfDOg6Yl5wZqmik
X-Exchange-RoutingPolicyChecked:
	TUe/I+NL35mGq+J42Xsb2CsVd1Vd5+N3iFYLCkqfrveYkdvRQS/RnykeIC+6FS1m5I60GTZ1ru6W94kCxBcE6DLbf+rS99Wrct4WYaZyHK043PkPQqfVEvWwaf8iEBisRQmdSvay0q+dDCHwQGMf6GK7ifYycOCgqggtC0CcQH2RIiZE7mWbBbiRfWB+MpXEX4r3NBYw6A0iYHGyEIEgb4w8aTH/FG9EdN0Xv3BY2nsMCjCvhAnbx7Rx5BBMfnqrP6S1fCEHQ01YNoYxK7FB+xlKVBybz69483o66ellW/+preXVDTUVb1vmUc3vwCHA3GxrOge+IQvrJViqJsbKhQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 11:52:54.4016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af789f10-989d-44e4-8f67-08df17d6df44
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB4052
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3MSBTYWx0ZWRfXzKiLmClgJgRl
 bTTNhN6r+5QxeLq2uJ1IrqGwaZXDdQBe1mmmUDETbaNRS01qBalIaPwbrZkisNnfR5wccDfHbID
 o0xqzeb1q/aJtdk6cqtO8FB9gvNT3P3usHO5toAc27wXEIxexbji9wcsP5rDVkTsfmxvAO8oIbB
 SVl7tXRnVzZYIHYkW/GdrqXhLuaVt29+TRB7u4A3dUE8T46mkPN7gObdrdC/w+K/IOlp/Pd/rHG
 g9WTbgscYXoTUv94pWkT95f75ZS8hFnq3GkK2Gk3Bx3hSFHlPPWaEnfqpz9px/Ua4XOZeRh88ES
 kXtBlHach13tagxJy+CNiVC/tW0ll4A5Wbv2dHOm/h2o8yvKdIPLv3aUHAE7ZU1ZYTCcjStnIQp
 NRf8AZuCm9BvAVgDetV6qdwur3ozWW4AwfWdQm8SWY6PX9qw832akO+mZZwVMt83Eio2bfz8TA+
 xc615JPdKgimZetr7nQ==
X-Authority-Analysis: v=2.4 cv=TPTQ2Fla c=1 sm=1 tr=0 ts=6ab11a9d cx=c_pps
 a=iFZJ8MWJ1PfqyJABywbvdg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=8AirrxEcAAAA:8 a=RcT1dESmA8KLRYdnCtAA:9 a=CjuIK1q_8ugA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: 5sxNMYUpycR5YSwIcFpD8O_2TwOXqXpA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3MSBTYWx0ZWRfXzZLRydWtUFIh
 HjxHWU9LHQ/17gvikoLFY6NTGqz027lQNTAh644bF9/8htQDmYnkdMbhIn5fiYBLwsuaYlEYQPx
 vH4kUdSJenW4y0sRU2++s5L+TFaHHGY=
X-Proofpoint-GUID: 5sxNMYUpycR5YSwIcFpD8O_2TwOXqXpA
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 21, 2026 at 07:46:34PM +0900, Chancel Liu wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> component->dev is the underlying i2c/spi device whose devres is only
> released on physical device removal, not on ASoC card unbind.  Getting
> the regulator supplies with devm_regulator_bulk_get(component->dev, ...)
> in the component probe therefore leaks the regulator references on every
> card bind/unbind cycle.
> 
> Move the devm_regulator_bulk_get() into a helper called from the i2c and
> spi probes so the supplies are tied to the physical device lifetime.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
> @@ -1176,6 +1178,12 @@ static int wm8985_spi_probe(struct spi_device *spi)
> +	ret = wm8985_get_regulators(&spi->dev, wm8985);
> +	if (ret) {
> +		dev_err(&spi->dev, "Failed to request supplies: %d\n", ret);
> +		return ret;
> +	}
> @@ -1212,6 +1220,12 @@ static int wm8985_i2c_probe(struct i2c_client *i2c)
> +	ret = wm8985_get_regulators(&i2c->dev, wm8985);
> +	if (ret) {
> +		dev_err(&i2c->dev, "Failed to request supplies: %d\n", ret);
> +		return ret;
> +	}

Probably slightly nicer to include the error message in the
helper rather than duplicating it in each probe.

Thanks,
Charles
