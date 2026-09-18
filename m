Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023122.outbound.protection.outlook.com [40.107.44.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8449A46A604;
	Fri, 18 Sep 2026 11:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730763; cv=fail; b=QdxEqqP2/eFDhX9sWdwgEzBayzSCkkLqNuBoyBq53jcNRq+xUOfY2u6O7YKAkaGDwJhwIUf349OmbybzsOuUoSM4XXJ31GP5W1JvzJjj9VwBCWm4m8bwRyeJ/CbXOj/RYPQ6YHtXPBSOnitcq6XY4SA/U4RxU/u5qcLIh83e8H4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730763; c=relaxed/simple;
	bh=5gTX1PeG2+KqNrok+FTo7nXT2Dam5uj7Sv9IXeOgzc4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YPHppqDhzB3ZJ9WG1PmU9mZAUE6fWmLHTsNV4iSv8fcxMXvG0qALc8GsJXT4OfvEjh0W/L/2tTvqZklfuhTGVK+1kYkqK2DT10NgAPC86toO9O/Nr9PHpEz5ChdzXd2UooUjtXdsBCnqU57pfbO3e1wmNPWU2u9Ofi4MdK+h8ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=zZIxrTfq; arc=fail smtp.client-ip=40.107.44.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="zZIxrTfq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UA/t+GTNzwj/seIjNDorO867hlcTEmNv+uojdmvT4wkc+dHLFJ8swWfiBq9Fq/vbhbhjLrLWSBLMTBRTmUEaqBPGbiDr4mP5nNTp0psp2WX2IqwzgyVQq9SQUCTJsrmc07OfPQ2ViD61HJH8+s8+/MDmjrLy/AIu6zAMbrkXcjBiXACMLWeT9o/r8YU4XJ9t4HLHewXWdNOwXQDdkyUVRk3VOesUauBj7pJ9liTAVTAWFSQ07Fh+zEkaip5Uh5dTIKaJy+xIt4CaVZjoBZuqqb7o+v4/s3+EjrZ8dUIiXfB9T08js5GnHRakRjhCS596MppS6PjvTDjqbwUIuBDNGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgEwWsgceo+NCp2qZY5EszwTm/jCvtEEAYqOAPYkVHM=;
 b=R7LvnzaehrMnEjzkshCLUV/z2udNonxNOBQbKtokSSjdjAzD7lVkBuFAy7bWfq0ypEM54uOeazp5LJ6G/RnHjoFw58QcdqzVrk01WaGoqghAYDZJNBIFkbAoyUEgGjdqC/pzLjVBYi/xpdfapJiwoAXK3mQqPJD/6CEFJsq48zYF0ZEh3xRyvRtPz5/oIcnmIeN0gozCb2kX3oPCn+iHs+j/tbJyC8YZQta0yW+vNhpM7Pjoj2EogGOKa9q5/DZKwfwGQuPsJzKuYL9xwgJKxbsZWY3a5SKCYEHAw04h3pzHmDFQrTKZSEfRAmss8Yr3QwyXHi2d90g3dt9ddaadNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgEwWsgceo+NCp2qZY5EszwTm/jCvtEEAYqOAPYkVHM=;
 b=zZIxrTfqBkgAwr/QDDUIIsHSbHydqgpOeYctt1OJo5oQCRcEZO8GHjwv6gc/zYWLLQwRKbYDsEuCNkLwqViES5FyzWiAyRjfjhEsdlS0PZuGlhL3vuHYYQek3Xhe1d0cR+fEmHTd2qy2/H5oLVwcu7/owQSOicpddAUNzR5adpna1cQSYGxjw6RICvNZ4PGLo+z1F+lTn3dK5w5EFfDoCYX7x5CVj1/n14L2ujDRGSIbkGBIpA8i/FM3vYyuKTY/mo7YqhSlKWL9a+K+5zzen9RncmE06fVbvB9dCkw/Ce7PL6OTqYB48j14JL/ftg/nHw64rGwC5gMIE7r2j8gYbg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SI6PR03MB8611.apcprd03.prod.outlook.com (2603:1096:4:247::8) by
 KL1PR03MB7694.apcprd03.prod.outlook.com (2603:1096:820:e6::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Fri, 18 Sep 2026 11:25:51 +0000
Received: from SI6PR03MB8611.apcprd03.prod.outlook.com
 ([fe80::c168:6203:172e:2498]) by SI6PR03MB8611.apcprd03.prod.outlook.com
 ([fe80::c168:6203:172e:2498%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 11:25:50 +0000
Message-ID: <71854cb9-4549-4724-8a62-e443ee80fb82@amlogic.com>
Date: Fri, 18 Sep 2026 19:25:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: Correct white-space style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Bin Liu <bin.liu@mediatek.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Xia Jiang <xia.jiang@mediatek.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0010.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::12) To SI6PR03MB8611.apcprd03.prod.outlook.com
 (2603:1096:4:247::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI6PR03MB8611:EE_|KL1PR03MB7694:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ec8ae0d-0e3c-4414-634f-08df157797f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|23010399003|376014|1800799024|921020|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	6464msNXIPqICEbNiaPJ918SSLae38+zBQ/tyR2JR6h0GxWoh4oHrJwc5pSmo2OEdbrYXKcU7KJ6A9LmVi2AFOIn6OslTWEAC3MmjQyWS3Kphu8S9840mUpMUNYF2n2qV5qHbbbx/M9MY2UIgifg34fgTW5eJqKY0xFyROOo0mNd0W3aJ4ynTsxQJOJ/Rv74kRLVVV947VXi4IEfNyJGbML+tWBXaAN3KL0Pno+EKrP2RtdXZ/FnSrnqq26EcMymEjP0Vt6Z+t7h5GnoTngx4Oe6l5QfmmEtbkvg9LdyRAwZ0drVLZ3TB8XlzvJlxR2HIahzQ64M9d55lRVC7QljwpeqUvC9lfw9f2c9ovGGDrjbs7B/3iZ46xuPQ/cS6h11rhXP+IkaOzqL38t/fbWmSw3UZTrFHb+HcoIhzIojVHz2gR+EKtNvrNacu1z6xknzw+9yrS2ol23PfoayapEXpLRMdhFFEI6DgzVdh7ROPpwX1q5+tp5TffGznD/bZKcDHz4uhUYlgdMg+JGKU78TRKCDr8CxNu94zYIcpST4JcVaIFDU1mMAUzHC5e4Dw1dq000HbSaSKOSZcolP/ZAOdCsBmmHtIKPITZsKwsa3wQwZNpzb9T2nRW1mxx+2f7T/hb9xt3DnKqOj54rx12tSIOo/NtGayoio2T+fR2Y5HnjJxAN+a3ywPLPxS4iW/qSAr1hp6TIj4FQBF7qbl/rsEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI6PR03MB8611.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(376014)(1800799024)(921020)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0F5c2c4ZkRrdFJ1UHNSalhJMXlzcWFKbUpIaC85RUpnOVE0Tkh5ckh1RWEv?=
 =?utf-8?B?Z2paZEttOE5JK2JqR0FDWURTZGhybmNqOXRja0JNYlhjMjZlWGh2WVNwOUQ0?=
 =?utf-8?B?T1dBMmdVSkkxWW5LMnZVSk1IQUMzM1h1TktPY3dIWTdkbjRCdm9uaXZ0Rkto?=
 =?utf-8?B?eHNmRzZxNjN4UG52d2hRRnZwNzNLaUVUSW5zT2pKdnJzVnNCOUJROURGa1FM?=
 =?utf-8?B?N2xodExFa3dnY2ZTL2ZvaHJFUVZMTkdjRVl4OFAzbkp1UXQrRVlvL0VLcWVh?=
 =?utf-8?B?RlpWTjkydlByUVhLTUJJaWxUYzFhRmZZbytZZmU2OWlZRldUQ3hiRE5NUThQ?=
 =?utf-8?B?OWw0cnpGWTJyQ2RpNm84T0pXeWZ1T2ZZakd1WXhmMFJtdThXemZOYUlVWDJY?=
 =?utf-8?B?NWNGbkx5dXBMMTR3ZU9QdEZaa3hOaDQwZnpEdWJXTXJ2UjNWQlBENWI0OUdr?=
 =?utf-8?B?RGtFQmlyNXhiTmt6aGtBWUEzWXUvcCtmTnRzYkpLVVdpak1XcTUyZUs5R3Js?=
 =?utf-8?B?cXAwSFVtVU5ZdEsvYmpEQjA5MjNQaGJYOW5razREL1lyNEJESXllNVBnWXZR?=
 =?utf-8?B?azBoMzFvdHZkN1pQTEFHRFowNVNITDd2akV4aHorVStTTmxSeit3aG42WlR4?=
 =?utf-8?B?QmZHbzNSRjVGNFFneU1DUXlLczA5cE90RmxKU3o5QkI4VE9KYTV0SVc3QnhW?=
 =?utf-8?B?dGhjL2xabXBUejZVOThsN2JSdmJIc2VIUnhqa254MEl0cVZleUxvbFhOSi95?=
 =?utf-8?B?N21QNEN1RmNYYUJwOWxiU1EzZlFNUzl1NERMQWtOU29JZStlbGs2TzNNUjJY?=
 =?utf-8?B?SWg2U0dLVDZkRnc1MmlNdDdTVDQ4ck9qMDRNelZ2RzZBcWNwdkVKMjUrT0Vu?=
 =?utf-8?B?MXVrS2FaT2ExdXYwTnd0RjVFUHlVWGdmOVN2d0ZKTHhaeVdIWXFnVkFhekRF?=
 =?utf-8?B?WTgyTWNYajJ1SGV2V1Z6dEdJcDJ3bFVTQ0MrbllvODNYQ3Q1TDRIVzVHS3pQ?=
 =?utf-8?B?bGsvSG85bEVLclgyMTdlbklCekhhSnYwTUl3M3J3TEc2UWlXNU14Y3VDMkJJ?=
 =?utf-8?B?RE9wQjQ3dUJkRnY5bGVKdWE2WS9pQkgxV1kvYndTWXB5NU81Rk9qREJMYUxI?=
 =?utf-8?B?QmkrV08rUW9Ca3l1VjdoRVVHQ3hFN1R0SHhJSDVmOVN3QmpLNnBoNC9xVXh6?=
 =?utf-8?B?ck9sRmRoY2RwVHUvaGRIRSs3RDFEeDZDQ1RRV2NYSHJQYXlBdzRXS0J2VTdh?=
 =?utf-8?B?SlhLSTFvckJIRnAweWtadTEzTFFhT0MzL3A4Q1RCR0NYcWRjYk5GdkZvRUdk?=
 =?utf-8?B?SkF5TjR1NlYzSXE4ZmJXVXc0M2RMRTFKNVlYcDhTVXlIZW5KYTRNTHVLa1Uz?=
 =?utf-8?B?cVltV3NENDFybG9yaXBkMEMvKzJQOTUrUHRzSnA2NHFnUm56VWhZTVk5WGs4?=
 =?utf-8?B?R3pINnUvb3h3MldwUDBveElUdkl0bmRNektRcUxMSmFVUWpkbEw3YjV4UDhV?=
 =?utf-8?B?bEZjNkRkWHVERWNHNWFrMEhVMDZYMVlTc1ltNkRjSmxVOVJmVXhNaitKeGpL?=
 =?utf-8?B?ZTR6Q21NRmRKNW5RbzJOZFdTWjhXSERLMTB3ODZVQ2F3dGpSYTdEU0FLSFU1?=
 =?utf-8?B?VEQvTWNFSnlMNWJIbXNPTVhCcEFhUnBWLzNvUWRwd0dySnJTaXJtR2ZQS0lS?=
 =?utf-8?B?Zk90Z3hQRVRqZWdJdWtYUjV4SE5KaWRVUUtsYjMrRjNDQyt3Slg3TE1qeWZ0?=
 =?utf-8?B?NzZQT1c1Rkc2UGhBYy9WYjY2bzNzOUFSaWVXczhlYkVaV00zV25DbFJlUVZ0?=
 =?utf-8?B?TXFDT09ZWnRBRWhBQUdmdTNwbWk5VXhzRFhRUXh3dGlHdFRVbEdkdzFydzJw?=
 =?utf-8?B?c0o2Y0JuYU1lcFcvUFdUVHV1OFF3RDdsMlZOSDB0eUVzVDVweXBIUDZVYUNP?=
 =?utf-8?B?WGR3S3BZMlIzalMwSnZHRmwrUEZqcjh2czkxZXk5SkFtdU91MFhlajdVU0pQ?=
 =?utf-8?B?dWlZSW81OHVXOG0yaWswa2IrY2lBVkUwdXdFbVh1V2t2VkNVQmR2RFdpMHMz?=
 =?utf-8?B?UWRBVElDalhSVTh1WFNaMVhUTDMrb3ppWDIwQlFzTjN2ZE1LYnVJOXFZVVpX?=
 =?utf-8?B?aVNVWDdpMXJkNHJZZXpXMHpOVkc5TFRBczIrUmxOT2dsbFh4Zzc0SGpiWFNw?=
 =?utf-8?B?RkVwWTh2aGVvRUIrb1pPb2YzZXhueHdiSWxHUTZFSjVjQjY5NFRKdDZ3TFVQ?=
 =?utf-8?B?Qjk5dHVONDR0Vkhhak84SW93dDBaRmZZM3RaZXpibEI5T25hc3ozWUhGY0po?=
 =?utf-8?B?dTFNK2M3TlVtb1cvcHJkVUduU2t6UnhCaEswSm9QWWlYSm9oVFZiUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ec8ae0d-0e3c-4414-634f-08df157797f0
X-MS-Exchange-CrossTenant-AuthSource: SI6PR03MB8611.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 11:25:50.7372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MCv0dIPDki568ZZBsteYLAbgSKVzGVKyh2U9XxRE8J1Nu7Ss/a4ZlBcDQNoSI13Ucou+tcpyamdh6McFiqYI0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7694


On 8/2/26 03:55, Krzysztof Kozlowski wrote:
> [You don't often get email from krzysztof.kozlowski@oss.qualcomm.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
> Correct a few white-space issues, like double space after '=' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks!

Reviewed-by: Keke Li <keke.li@amlogic.com>

> ---
>   .../bindings/media/amlogic,c3-mipi-csi2.yaml  |  4 +-
>   .../bindings/media/i2c/galaxycore,gc05a2.yaml |  2 +-
>   .../media/mediatek,vcodec-encoder.yaml        |  2 +-
>   .../bindings/media/mediatek-jpeg-decoder.yaml |  4 +-
>   .../bindings/media/mediatek-jpeg-encoder.yaml |  2 +-
>   .../bindings/media/qcom,msm8996-venus.yaml    | 40 +++++++++----------
>   .../bindings/media/raspberrypi,pispbe.yaml    |  2 +-
>   7 files changed, 28 insertions(+), 28 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
> index b0129beab0c3..2f11e5f45839 100644
> --- a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
> @@ -96,8 +96,8 @@ examples:
>                     <0x0 0xff01a000 0x0 0x100>;
>               reg-names = "aphy", "dphy", "host";
>               power-domains = <&pwrc PWRC_C3_MIPI_ISP_WRAP_ID>;
> -            clocks =  <&clkc_periphs CLKID_VAPB>,
> -                      <&clkc_periphs CLKID_CSI_PHY0>;
> +            clocks = <&clkc_periphs CLKID_VAPB>,
> +                     <&clkc_periphs CLKID_CSI_PHY0>;
>               clock-names = "vapb", "phy0";
>               assigned-clocks = <&clkc_periphs CLKID_VAPB>,
>                                 <&clkc_periphs CLKID_CSI_PHY0>;
> diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
> index 0e7a7b5ac89f..99d728c47cfb 100644
> --- a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
> @@ -88,7 +88,7 @@ examples:
>           #size-cells = <0>;
>
>           sensor@37 {
> -            compatible =  "galaxycore,gc05a2";
> +            compatible = "galaxycore,gc05a2";
>               reg = <0x37>;
>
>               clocks = <&gc05a2_clk>;
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> index 4505e66876a2..551e483f3e51 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> @@ -160,7 +160,7 @@ examples:
>
>       vcodec_enc_vp8: vcodec@19002000 {
>         compatible = "mediatek,mt8173-vcodec-enc-vp8";
> -      reg =  <0x19002000 0x1000>; /* VENC_LT_SYS */
> +      reg = <0x19002000 0x1000>; /* VENC_LT_SYS */
>         interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
>         iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
>                <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> index a4aacd3eb189..76878050cfd9 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> @@ -72,8 +72,8 @@ examples:
>         compatible = "mediatek,mt2701-jpgdec";
>         reg = <0x15004000 0x1000>;
>         interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
> -      clocks =  <&imgsys CLK_IMG_JPGDEC_SMI>,
> -                <&imgsys CLK_IMG_JPGDEC>;
> +      clocks = <&imgsys CLK_IMG_JPGDEC_SMI>,
> +               <&imgsys CLK_IMG_JPGDEC>;
>         clock-names = "jpgdec-smi",
>                       "jpgdec";
>         power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> index 5b15f8977f67..3bc1ccb25893 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> @@ -67,7 +67,7 @@ examples:
>                      "mediatek,mtk-jpgenc";
>         reg = <0x1500a000 0x1000>;
>         interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
> -      clocks =  <&imgsys CLK_IMG_VENC>;
> +      clocks = <&imgsys CLK_IMG_VENC>;
>         clock-names = "jpgenc";
>         power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
>         iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
> index 56c16458e3bb..389b545c9631 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
> @@ -119,26 +119,26 @@ examples:
>                    <&mmcc VIDEO_MAXI_CLK>;
>           clock-names = "core", "iface", "bus", "mbus";
>           power-domains = <&mmcc VENUS_GDSC>;
> -        iommus =  <&venus_smmu 0x00>,
> -                  <&venus_smmu 0x01>,
> -                  <&venus_smmu 0x0a>,
> -                  <&venus_smmu 0x07>,
> -                  <&venus_smmu 0x0e>,
> -                  <&venus_smmu 0x0f>,
> -                  <&venus_smmu 0x08>,
> -                  <&venus_smmu 0x09>,
> -                  <&venus_smmu 0x0b>,
> -                  <&venus_smmu 0x0c>,
> -                  <&venus_smmu 0x0d>,
> -                  <&venus_smmu 0x10>,
> -                  <&venus_smmu 0x11>,
> -                  <&venus_smmu 0x21>,
> -                  <&venus_smmu 0x28>,
> -                  <&venus_smmu 0x29>,
> -                  <&venus_smmu 0x2b>,
> -                  <&venus_smmu 0x2c>,
> -                  <&venus_smmu 0x2d>,
> -                  <&venus_smmu 0x31>;
> +        iommus = <&venus_smmu 0x00>,
> +                 <&venus_smmu 0x01>,
> +                 <&venus_smmu 0x0a>,
> +                 <&venus_smmu 0x07>,
> +                 <&venus_smmu 0x0e>,
> +                 <&venus_smmu 0x0f>,
> +                 <&venus_smmu 0x08>,
> +                 <&venus_smmu 0x09>,
> +                 <&venus_smmu 0x0b>,
> +                 <&venus_smmu 0x0c>,
> +                 <&venus_smmu 0x0d>,
> +                 <&venus_smmu 0x10>,
> +                 <&venus_smmu 0x11>,
> +                 <&venus_smmu 0x21>,
> +                 <&venus_smmu 0x28>,
> +                 <&venus_smmu 0x29>,
> +                 <&venus_smmu 0x2b>,
> +                 <&venus_smmu 0x2c>,
> +                 <&venus_smmu 0x2d>,
> +                 <&venus_smmu 0x31>;
>           memory-region = <&venus_mem>;
>
>           video-decoder {
> diff --git a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
> index 1fc62a1d8eda..5c0f2f7b1d95 100644
> --- a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
> +++ b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
> @@ -53,7 +53,7 @@ examples:
>           #address-cells = <2>;
>           #size-cells = <2>;
>
> -        isp@880000  {
> +        isp@880000 {
>                compatible = "brcm,bcm2712-pispbe", "raspberrypi,pispbe";
>                reg = <0x10 0x00880000 0x0 0x4000>;
>                interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> --
> 2.53.0
>
