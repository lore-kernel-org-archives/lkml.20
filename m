Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.12.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794407625;
	b=2HD2YbSvKXK4+LCsBD9PIcS9Z9FoGKD9kPtJvBpIOuBlJj0mDVjLzzPr4FsMEs1KABHD
	 B6iQjIa4w+CDmYMNPXs2Ix/Zrd7MeGSLJVPmfJRaehFapFSspoWOJzZ7210wggXM2gGBI
	 MpBMbVagDSK5DxZ59Fe0xJwZHzhWdGFykcr3EbQsrEc4zE63cI76NCxPPrSGT9X5v2MNb
	 PdpjyCGRs8QwviCnXXRWVbRCZndpt4iRimTn4/o3Yljo2vuHTyBVXLOVAf/EeeO6cnpQA
	 4lxHxjA/eKqj9FRwHupT8nXEXBeJBHPnrYH0KugFpfpkZvCwyBe1D/VkQ5qk4/DtT6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407625;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=FwfvVu3MFgvvFuVAsCHel/OuBw+TIr32nmWzKWHD+5E=;
	b=v21wAhSnSVpwjOjZ7YBsfQwtcueQvfA8TE7/34r7omF1wM5NRueOiY2L+OxL5fxTAU7h
	 mMsSxFhCgr0PKqAtObJX1XAyn9F0fM7JjwWcUE1eHpt0l5UfcC0RzmbGVfmhlzNC1pXkd
	 8ZITEUtXGdwB+mrxlU6AI202dB5yiKn8st684JMDb27AMCZFAvFswXN/nupG8L17lh9Zi
	 mVFknqHOsf4ufVAIgLGsBmEZSpwWyzCz5SGOPaxcsvKqQ5Rmj265IC/n6ZEZFgMX3BX5A
	 QcpIwBfXA8vbJVfoHvofshXMbagmOOU+S43MlKhZ80gxNZEZuCneIPQSPscv30ZbNOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.it;
	spf=pass smtp.mailfrom=outlook.it;
	dkim=pass header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=AXD2O18W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.12.22
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azolkn19010022.outbound.protection.outlook.com [52.103.12.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5543B60A3831;
	Wed, 11 Nov 2026 14:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5543B60A3831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=AXD2O18W
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLSJI5+2EcduXu43k7ysVYbmrcJJVLjiJemhXG5fmSPIo3PTyWLCZbfGKBRgfSaISTlZa6VT91iA+EDvNxBVm9H1pv8y566KIkHdV4m5NMp42J8T73m1PpbJXjb+saTD+aUyvogC9eiMf8fLr7zmx2/dATsD6oxpLAwp/X+VE6TEqzAWGCmjXJpln9/hNzS2L+qEtzsNPuDL3eRvNksO9OyWUk7sGeLqdIVale4Ub/mv5jvIangyD3n7t0v21VyxkggCQJ1Fm1FG1mwY0PuyRoKLLh3nybRo+wr/y8sjo1fxtLXGRG0XBnnDhha1v7OwECw68+Dx9ktAYqyD6kpjmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwfvVu3MFgvvFuVAsCHel/OuBw+TIr32nmWzKWHD+5E=;
 b=OjS1SoCsfmX4Q+Ci4o0pB9FW9TIGv3MrBBAnpMT4uk5pV4hC00qUJIwN+jC2h4fvDOR62lQI5vQ/SqVsSpdni26g6Zb/a9O1Zy9Poz5ay1QCDIa7XI2WXLoYjE3EvFc15cjt2jQ+g618RBO9EYwwqTOLrocctdcGMSSC/0TiRyZH6XwfEsc4w0zJdbQbx66Q3AqBEDH10fQ9I5bB7eUyn/yrmtPalDdo+oYGfBZAmVVMSwlajkhEUqThqRf0xpBRJKoSX4QD4rD6MfaUFji1cjJo5MZoO+q3XhpGaeVqzvTwoR8z8FqADGVmBSlU4PBbnFCR2KTBWvi3KESN1msj7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwfvVu3MFgvvFuVAsCHel/OuBw+TIr32nmWzKWHD+5E=;
 b=AXD2O18Wub3anoLVWym+kXrL5NmxQXu3+uuS3GyRpfmshCPMO0l9QoFzYW/ZBQ6HxWojMMdNx47kaAugBlyD7JpHgWT+tzmdFCYyI4fJq7zD4u3jcYgsYkTHHsptRpPVRlOaEtcehm8XG1sDj8YIQAdQVadphcz2810jp6QxN+nHHYJErQtC1QfMBbFpRENEoXM3DqoMUEeSHjiTOOvHO9KCfUS0nBHpUvOlpNYTZoNN8ZOz2k6VWzVxMS8MeaNKOlVVk7GdYI6/sJnqUEum7mRn1o4TdM63EqIMgT2ZkNO6MF57ITRY+JtDrqoyPifMY3PBX3duPCQC4ZfweGm07w==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by DS2PR19MB9128.namprd19.prod.outlook.com (2603:10b6:8:2b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 14:33:43 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 14:33:43 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: guanlan@awinic.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	marco_giunta@outlook.it,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH] ASoC: hda/realtek: Add support for Lenovo Hudson
Date: Wed, 11 Nov 2026 15:27:29 +0100
Message-ID:
 <SN6PR19MB2303428E364A35C007AC2812FC712@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111043601.306427-1-guanlan@awinic.com>
References: <20261111043601.306427-1-guanlan@awinic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0135.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::14) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261111142729.26501-1-marco_giunta@outlook.it>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|DS2PR19MB9128:EE_
X-MS-Office365-Filtering-Correlation-Id: 6078b0a3-8982-4466-ab88-08df4000c85a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|260925184616899003|25010399006|4140399003|19110799012|8060799015|15080799012|23021999003|5072599009|24021099003|51005399006|40105399003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qIuU/fN40IDajgdof5T3vCwb+OKOHKgs3EzvJbaMaJc5JfmemCl8XVXErZJF?=
 =?us-ascii?Q?5NNeyh1UHGzokk4gZ6+tYG0tQIIIn+b2zVNK5uTVNvNBZhMyYtqPQVMIr4aa?=
 =?us-ascii?Q?1avksJlqBCMCOAX1FOPDZ8PAHwO/0PvoQVmH83zJrDpBhQrkxZiGbthbwJOb?=
 =?us-ascii?Q?RfCRBts8OrW1Qx3wTdUnDhPcmNWcSf5e4/9lx/if/7jHCEd8Ic+pC1HHu+8f?=
 =?us-ascii?Q?WHdYIyA6Z7uQr8n9qvjTSkeRcvvtn3Jl1GSrHFn6PpLsmtRindWBIxiFZr3G?=
 =?us-ascii?Q?5MpGBXNfV4d9KFxyPuE2S8jwUJ5VPdaNOebMdEwmbD/7LJvmHa9o1/KDZtVV?=
 =?us-ascii?Q?b0tLPzlU3XMyrybf/5iHbD9fT48UyqDtXNHfSy7OYh3QscBrU+WzvVlKTge+?=
 =?us-ascii?Q?dqWnxTijTEBzQGOnzpEqxMkU8YwyPnszHDMGd50eBp/Zu3poFX/If4mRcirV?=
 =?us-ascii?Q?X/V0nnlOUiOA1p9dYH6ffbdVNrbe1v3dFi8HQj8RoIRB9BY9r3kX7kL3+7p9?=
 =?us-ascii?Q?hOJlPex3NO0bqcFg2j5F75UeZp1AdKVzjcOoaEn6pgWk6zLMxYujgP5kl8wK?=
 =?us-ascii?Q?MiQGkVoG5nm6Pcc5rsa3n7oABjtmcCqzmwQL7tJZ3BW7SHhazxcNSRoR5HJJ?=
 =?us-ascii?Q?g5XKPmZ3b0pcmML1DqOYofZ1LQIShVmQcClPUl0Yna7fMwbnVfCFoQU1w1O2?=
 =?us-ascii?Q?uvAgghY7dwCDPG9ftcgERgkDDC14iF5dt7Eao8iNU94qRm6gBrLY03MWw8by?=
 =?us-ascii?Q?Gy1H1BMt2xGi11xmtop3gx2zQTSAr207pD2hCqhUDPanYuRkzGI5SvGLvM0O?=
 =?us-ascii?Q?ooqDXNKsKs3kukh2rW2Ri/FNeEJzIjTjdrCqjG1sO0mevJb1oYwk+aKHeLgP?=
 =?us-ascii?Q?b3FdS5W15Y+WrSko6nv3RvVJlUHewS6eMey9MKRT/GMBtvgUswx9BKKAh4Cq?=
 =?us-ascii?Q?MKg7zZYIDjTy61q0h+FHXQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SICdjnqZPqT4aFLeZwz6Fom4XS7nF5F5wvSAaLAIwhGpNGKGzOYi3632I4av?=
 =?us-ascii?Q?lzl9cPUk/qRuvIkIgeu9YoVIYMs4AeiIuTsSCj7GHOVX+GxDIKpOhDLMND1K?=
 =?us-ascii?Q?UlS33ILQ4nXIWbxh1AzGL72XgjZK/aKj8dtwonf0Swo/0e/ZauzN5G1NJ2HW?=
 =?us-ascii?Q?g7NBNELe8CNscSEBZxtTevpsQPW7UGlfiLkA5rptjyqCW49XAYJF8yK34Boe?=
 =?us-ascii?Q?/IySjid0ML4v0gBIjV5CEc+nTJLzdvRYF3us/b+RJbuKd/2v15IEpTODvRVL?=
 =?us-ascii?Q?p1jeFqw+SQh5w4xb4s/1HJSujTFf8BjIAUqmzd+9ugFlto3srZFqAhPYqg9b?=
 =?us-ascii?Q?6avaF/NDg0obZQkvFPATQ4kvTRRQOEBoqSLyWIlTtZi0jJz8J2B3dhiupPPk?=
 =?us-ascii?Q?tE5/oH7D0vfmhxrydzM8UxLEnDYOqrrU1aGg9os1cUPJ8B1cEt3CEpnKZOuC?=
 =?us-ascii?Q?zvL8/zmyESdMnJo4IHHvQEyB4FXijCsIjzIZkB1g2F1U6V8qFZu3fp+w3pqH?=
 =?us-ascii?Q?a3n1GOg9WoAv/mrNKkqc08h0AJIayiZBbN2LIpu7V1rbjtSgqXfBn5Wg1lka?=
 =?us-ascii?Q?3xEzkwjQwPU/1ew+MoM4XXfOb2GkLhB5zEs5jTjPC4PNFp0A87SC1ipiX/b3?=
 =?us-ascii?Q?/iaV1IK5SLfLcf7wMLUTSgKRAjQlWjATpZVDzcPAnAvQWPUUoV70QhW6r4Dw?=
 =?us-ascii?Q?WgpW9OVNZd8y7Ne+/qMDXAcivaSlshL6AEfJq/OcaSs+h9VQiVKU2w+Ch2cW?=
 =?us-ascii?Q?341Q7E1vByi1lZt2l46khj+VJyN8d8CtmusLvhdAtDtAkTIaw3Y9aczQ3bI1?=
 =?us-ascii?Q?fW7MXxh/C//+K2MlFMwjTX2/i4cP/n9YKkLHeA6pEjePai0t85c7L2X9H6HU?=
 =?us-ascii?Q?Hd+90mZbErQeW+3iVF1u4RZDb5Gct7JcIB70ZN2HIYJX9O6ugy/A83o4tmdt?=
 =?us-ascii?Q?11+FdSz867fwPJ1Vb2kRBWu1+JAy4m1uQKOZ1KEyWzfPvLTSlZvCR5WL3YpQ?=
 =?us-ascii?Q?xqrEOLZQ+/T0hi0q2QqSe9BnsZong0LCWM50+p+r5vnEX3ODegcY79WTggDy?=
 =?us-ascii?Q?A42niyZMv59mdDBJm79FenQfqoVRPpscqklcxacVJIufjYKZ0mm3nzfKmVJZ?=
 =?us-ascii?Q?w3lxcwKkxICl+sL4EKg4MwiywGmBmQmnLtj7l7cRKHAXxcKwqYfuLsB+P6U8?=
 =?us-ascii?Q?au16KVa2+OlxnT26X23wLfZGmPxnM8GyoX0t4flt8Rumu5oFnpOA0cl4xNjl?=
 =?us-ascii?Q?Gujw6bEg4/SUliGq2QFO7ritpTr04tzM2qkmyy6yuoS80C5TwkA00RbYTnma?=
 =?us-ascii?Q?mZa6iOJCxD0c9NjCKPBnU9JEGvTfR+a6bApjLAEdFavYFLqSgbCzqtZH4gbL?=
 =?us-ascii?Q?QHrk43J0fD1EdXzJmMXHj27nOay4?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 6078b0a3-8982-4466-ab88-08df4000c85a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 14:33:42.8852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9128

Hi Tao,

Thank you for your contribution, it's amazing to see Awinic use our
driver.
The changes in aw88399_hda.c are fine, but the rest deserves some comment.

Mandatory fixes:
----------------
* Typo in the title: it should be "ALSA: hda/realtek", not "ASoC".

* As sashiko pointed out, both entries map to the same fixup, so one is
  redundant and should be removed.
  You didn't specify whether 17aa:3814 is the codec or PCI SSID, but given
  that this value is also the ACPI SSID, and that all currently supported
  Lenovo models have matching codec and ACPI SSIDs, I'd guess it's the
  former. In this case, I would recommend just keeping the HDA_CODEC_QUIRK
  entry: by matching based on the codec ID, the connection between the
  corresponding bits of code in alc269.c and aw88399_hda.c is immediately
  obvious, and using HDA_CODEC_QUIRK() makes the code self-documenting
  that this isn't a PCI SSID, which is useful if in the future ID
  collisions pop up.
  Also, statistically speaking, these Lenovo laptops tend to share PCI
  SSIDs more often than they do codec ones, so it should be safer overall
  to use the latter. Or at least, this is the rationale behind my past
  commits. Therefore, overall, I'd argue in favor of sticking to this one
  convention for all AW88399 HDA devices' realtek quirks.
  Alternatively, if you have arguments in favor of keeping the
  SND_PCI_QUIRK() entry instead, of course it's also fine to keep that
  one, possibly with the PCI SSID instead if needed (see below).
  The important part is to fix the duplicated entries.

* Again as sashiko said, new quirks shouldn't mess with the sorting of the
  quirk table. Exceptions are allowed if this is done to prevent SSID
  collisions; unless your device's PCI SSID is already taken and its
  value comes before the codec ID in the sorted table, please move the
  quirk entry accordingly.
  If you do need to avoid a collision, you can take a look at
  commit 494978ae8243 ("ALSA: hda/realtek: enable AW88399 on Lenovo Legion
  Pro") for reference.

Optional fixes:
---------------
* I would suggest explicitly mentioning the AW88399 in the title of the
  commit message, so that it's immediately obvious from the commit history
  that this isn't simply one of the usual realtek quirks, i.e. this commit
  touches the AW88399 HDA driver as well despite being labelled as
  "ALSA: hda/realtek".
  More generally, "add support for device x" feels a bit generic; in the
  past, I used something explicit like "ALSA: hda/realtek: enable AW88399
  on Lenovo Legion R9000P AFR10". It's not strictly necessary that you
  change the title to something with this style, but I suggest you do.

* Related to the previous point, naming the device as "Lenovo Hudson" in
  the quirk entry feels a bit generic and unclear. I'd suggest appending
  the product_family ID after the commercial name. This is also useful
  to distinguish future products in the same family that may need quirks
  as well.
  Again, this isn't strictly mandatory, but I think it makes the code
  clearer and more self-documenting, so I recommend it.

With these changes, a v2 gets:

Reviewed-by: Marco Giunta <marco_giunta@outlook.it>

Thanks again for your contribution.

Best regards,
Marco
