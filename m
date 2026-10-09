Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19010007.outbound.protection.outlook.com [52.103.43.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5747427C162;
	Fri,  9 Oct 2026 19:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791572929; cv=fail; b=HmNXjzrffO+VXMcZrl8go1oBqXGaF01VKIUlH02W1VYLnqC4f+WukF3plQr8vA7rhfQzOoq5fNqsB/nkeVLaIWdh/NCT4mCzBCNweRdXt1a0d+tqDrfgwkN1iTK0YL5S1OnVsdP8nrhGWIw9NDuXXii9zchhdK2fGNdWcYJRkLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791572929; c=relaxed/simple;
	bh=oJbKsGIpvPgHxlSgm/2c3/8Uumc/WhzttxTunnaGkeg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IkBY/01o9xqkYfzUzOuRoN5jqUmmHQWHV3hGAJWaNR+/DcwAGBsq3QfKh9ybpaXy7hKQQqoKzr64B3gJL8pNtJVZEc10n7dyxDnneJzCJk54i1H4yUHf4G+stPMXF97fG1AHQYgvLnGAfEn0DQmK6ADJ8t/nz8C5XUupN9l/Jyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=iuxAU7zq; arc=fail smtp.client-ip=52.103.43.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="iuxAU7zq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGh4l9pkrnFv20ssEwjE4+Q2wOiQvdleisC4Xg0pJfbedfDy9ZvTmYH4/FHmBvt5tefiAqTRvs7/oYYoe5N7NQRS6+zNy1MOauMieO1qy7am+p+nELfceWWW1VtBy2jYwQk/GxgfEVFGcaMYroTaK2FJdlK/T2VDoYlHFJpuuNijhSuddq6eFo3Dr7d9MYl5vpYEmimIrDsWcC540MN9Idmnbkyj0/YpG1TapvPkyi7mcuoXmskdJmjLtWP/dPS+7iYS+8R0Kqpy5KRTPkN949r6Q6ZmaH3A8+MyawLD66/rNCYxXkPTVfREk1ehT02kpoxwnWUngiHi9uXBVXS2NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdvwojrQS/VRbfFitEfuffPZySJSuUdRXsq0Bl5St6w=;
 b=Y3qUolyxl+Askmc07topKBIX4s/PKJ3toql+OrVkpQfuHJjOTKFFFqITuXB38+cjr6kru/KbS9TTFcV3Qcj8bpJakWWDTwZ2xjWfKMuDCvBtfEH+7+4H438D1uG8CrhsNF11j+qUbedx4lbY0S4FfWpJ9bJse7Dy+n1WyWVaLcwpAQ22m/ZzsBRwOvxIS14U6n96xy83mD6p4egtJivRjiDcphz3T14OHm4clNEuoXvnTm5CE9j/YEgYV1NiV8w4BkKQYpRh5BxJYLenpbwsxyaHhQ6M/KSyLgsoze83a77RGmh9xJ4EYk8JWL6O6w2dNEtP6iRpDwLeuEOG+3Km3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdvwojrQS/VRbfFitEfuffPZySJSuUdRXsq0Bl5St6w=;
 b=iuxAU7zq+gBjHVEEQhVpN1Yw57bFl5LTGFZoGH0NfOluhAjvpGOcsNJDgOcONtaXNNgB0EuVJSn7kv1R+qNXDJDtBANXmaBmgWB2H4twWl2bE5IL+q5MsgsNZjP2XRXlm9c5J5oFUhvcp5spbv0QMaEFdnc0L43bx5cfTf8QdlYFvjJLZUUzZsWugwFBcoNofhDZp8tbyAVtGD6UrvTV32gddnvo09r/pmPhjrW7e2aKKgW/6xQ88hjjbD+vr37VlhAZEND6MAYcEhHyACElHu5KgznWzOfQY5EKvgI1kgOd3iMp4Fttb75SbGixry3ibMjVY5F8ZUi3JHkLRJGsDw==
Received: from TYWPR01MB10887.jpnprd01.prod.outlook.com
 (2603:1096:400:2a9::12) by OS9PR01MB18080.jpnprd01.prod.outlook.com
 (2603:1096:604:4ab::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Fri, 9 Oct
 2026 19:08:41 +0000
Received: from TYWPR01MB10887.jpnprd01.prod.outlook.com
 ([fe80::2b9:c4db:f079:a034]) by TYWPR01MB10887.jpnprd01.prod.outlook.com
 ([fe80::2b9:c4db:f079:a034%7]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 19:08:41 +0000
Message-ID:
 <TYWPR01MB10887E1A3744FD44000F89E8F98922@TYWPR01MB10887.jpnprd01.prod.outlook.com>
Date: Sat, 10 Oct 2026 03:08:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] riscv: dts: spacemit: k3-com260-ifx: Add rfkill nodes
To: Jennifer Berringer <jberring@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 James Morris <jmorris@namei.org>
References: <20260928231807.1757995-1-jberring@redhat.com>
 <20260928231807.1757995-5-jberring@redhat.com>
Content-Language: en-US
From: Shengyu Qu <wiagn233@outlook.com>
In-Reply-To: <20260928231807.1757995-5-jberring@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SEWP216CA0154.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2be::7) To TYWPR01MB10887.jpnprd01.prod.outlook.com
 (2603:1096:400:2a9::12)
X-Microsoft-Original-Message-ID:
 <bd1fd769-6102-4081-ad6f-fa05fb99d512@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYWPR01MB10887:EE_|OS9PR01MB18080:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ec6a55f-5b43-4c86-3e20-08df2638bae4
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|4140399003|25010399006|8060799015|41001999006|24021099003|6090799003|23021999003|15080799012|5072599009|52005399003|40105399003|10035399007|2607281247196008|3412199025|440099028|26104999009;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bW84MktkM0FVWFo1M0pjMExpRi8xVlRBOVVZZjdYVjM4cmdnVGNPczM1cmVk?=
 =?utf-8?B?cGI5QVFmQ3k3K0xUL1NVdjN3VWxlUFd5NzBqM3pNeHp1SzhkOUMrSjNGU014?=
 =?utf-8?B?b0N1Z2N1aGhKaHhHbmFFZmw2c0FqdWc1THJOM1ltc3lxeVZQWlZtOTRtUG1I?=
 =?utf-8?B?L2p5NDNnVXo5aFd0UVdVOVMrQkY1ejVRaU5ZcHVCVm5FQTVnTWVORjdwS05l?=
 =?utf-8?B?NS9HYzB2YXNiSVRFUEdXUGtjamttdVd4OXRveGY2akxtME1BMlRESE0xaXJB?=
 =?utf-8?B?NlBtM2ExOERHYkwwNkRtZmh0czhITWRPY1NsRk15UnBCcGNvcnc5Szh6b214?=
 =?utf-8?B?THIrM1Jua3ROYytVTXlTWFI5S2s3TkFQT0lhU3hFRGNXTkk2QzN6dnJOdVdk?=
 =?utf-8?B?ZmM0Q1k1S1FrOXpkTmpnMmpjaGU4aU93VDdhRzdiQWk4aEs1WCtmMk55Z05k?=
 =?utf-8?B?REJ4cnh4dEZib040US91TFFQUDhoMzhYb3RVL2lXRDFCdFBoWVAyUkEvaDBt?=
 =?utf-8?B?M3NXMDE1Um1xM2pTZmVGMUtTdSs0N2sxWko4V0IvM09iZEhKR3ZEYjdxQWFp?=
 =?utf-8?B?dGkyYWU3MlZqSVlmc2hkV2dveVhoZkRYNHVSZFUwcExLeDd5cWFRdllsd0xX?=
 =?utf-8?B?ZDR4d1RteUIxZGxYdzE0dWFLU29HSStvRC9PTk5IVzVhLzJwV1dIN0tQWTRP?=
 =?utf-8?B?OFVYa3pqTU5GRXRRRmRFeDZ2V2JacHAvRjduM0tkMnl2TktjSi9yOHVOdVNP?=
 =?utf-8?B?K1hKb3pFWlBvOFhjbkowTHNVdE9CTUZSZkFtMWU1K2RmdEZoRlF5UXplajRo?=
 =?utf-8?B?bG5mNWk2cWVndnZ4MUdVV0lCUTJMRkl2cUhwQ1VCbktaUldXU2o4RG5FL3ZP?=
 =?utf-8?B?NW1lUUtHUzgwRUVYMmZUNmlQdEUyd0loTmpRMTR1c1V4YjlZZkhQd0Ivd1ZZ?=
 =?utf-8?B?NUo2cXRZRGVOVVhtd2NJNWVhNWovOUFRbVpydy9wRm1GampFdmN3UCtQN2tu?=
 =?utf-8?B?ajNYc2FpbUNxMVBIN0F2anQxRmJtYjlmVzNRVnc0aGR0WDJmb2tRalQ3Rkpn?=
 =?utf-8?B?YVViM0Y2SGQ3Y3Z6YkZ0a1NDNVYrbzFjSGMvUjRpWDBvUkdRd1AzanliRTYw?=
 =?utf-8?B?R21EZGZuZGlqNVlHOHE3ZnpQaHlxT0MyRVBncGFmUzc2eHFjck55cFk1NHlz?=
 =?utf-8?B?R0JINENmYlRnczY1RVRqUHBQajZSSUZ3Q1dPRzlhNmlNOHZXaXo4aE9XSytY?=
 =?utf-8?B?bXg4UHIwM0VacVR6bUp6SjlnNDJnbmFWYWw3M3FwNVFHZTZFS1RhU1pDdkZq?=
 =?utf-8?Q?LzbmmREk2eqek=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmZwSDZ2ek85TE9PYnFDSUtnalhldTEyUUYxK3Btd3ZwMURxR0xvVHNBWGtq?=
 =?utf-8?B?SlNKNk5MVmRRWmE4VCtibG9rWjZIL3kvNXJDVXpacWVOeVRneFRzNzdQeDVM?=
 =?utf-8?B?MTJ0MXZwbGFTbHZXdG9vdFhLcGRxNVUyUU4wS3ljTEhyMEZJVlYwQUY5b1Ry?=
 =?utf-8?B?R2dVdWtMSXk1Y0ZYSEtWTVdGdjU5MnRocVpXVTJ3M1grVmNBc0JLTytIc29T?=
 =?utf-8?B?SUVncmlwM29PdDZ1YjR2V1RlMTRzN09QMmdpemp4akR1bE1EL1JmSHNFY0lE?=
 =?utf-8?B?eEF0c3ptKzRiVVkyV05FaXF2NStvejBzRExYbG9GNk9rQkg5NUJqU2VtYnVF?=
 =?utf-8?B?TEI4WGF4WTgzd2R3Y1d0aHZ1S0NyVGk4d0pnWEpMTUZEeHlRMnUrL29PditF?=
 =?utf-8?B?TWo1T0dnckwzdUkwZ3MwWitERm1XNEx6V3k0ZTJkRGh5OWdoeCtRWDhibENR?=
 =?utf-8?B?bHpJdXpBeVNBM3NIS1FUaEVLT2hjamtjUVVrN0JCUS9pWU9KMmxoL1BKTjNJ?=
 =?utf-8?B?SFlldnBkdzR3K0dWL2FLWmowRXp4bHRYZDRoL0l3WG5rZ2RGVll6RWlnS3gw?=
 =?utf-8?B?RjFNYUNTNHhJbDhRUU03MlNuQ1B4Y1QrU091WGFlbU83UkRhdjFGQXFWL2RW?=
 =?utf-8?B?N0FXWDVTZThpQnl5Z0VxSWxCU1JpVUEvVnloSERhU3FDdkhpUnUwNlVZdi9S?=
 =?utf-8?B?WWMrWjdzMUl3MW5ZS083WTNSVFJRT3hCYkdqUmZvdUl1WTV4S1dBS09jSjk1?=
 =?utf-8?B?MTBQUXo3N3J2eTZyeS9QVU1GanVqZ0pUM01vZXYwM21US282bGpaU3RDT29B?=
 =?utf-8?B?TFRWKzlVYzUvYUpxbWVhMks1bmJCWUpzSUplMWdMMlBUVDFMdGtySmFsSDVh?=
 =?utf-8?B?TGQ1bzFmQlMyZHJuTTRJMHR6SU5JUWIvSHB4ODJCWGdsdWYwQ3RwZVZlZzVY?=
 =?utf-8?B?NDQxOG9iQmY2Z004MjNJRk9wbnNGcnA0M3d0SUxLb2dVRXdGOERzZkdnUGcw?=
 =?utf-8?B?djlSelpkZDR1eWgwRWdSUmZNc2lBSDZJNndGTXYydGtsaUZySURQeHdRT0Zr?=
 =?utf-8?B?TDFvcURmZUJib2dJaStrYWt2dlZ0Vnd0NDRFTDZzcWphUjlZeE4zTFBmcjEr?=
 =?utf-8?B?UDBCYUF5QWRqSlhHUXBINDF0UU9WUmlIMGQ5d2xyM1B6TUxlQ3ovQWpEWWxa?=
 =?utf-8?B?RVBwL2ZWZWVTR2hmZ1NOUHhlUDM4VVd0L0JLZVlLK1J6azdCc0taN0NIYzFI?=
 =?utf-8?B?MU03cjZnQUxNa1hycjNvc0NLWG5iMzAyNTlTVS9VUUdoQzJZSStYd1dBaTdK?=
 =?utf-8?B?My9NKzEzcUR3TUpJdWNFOTZlUmZraWJNQzRjeVpWaHJzSFc1Rm1YTVczQnZ4?=
 =?utf-8?B?SlRzQk1QWElTdEpjeWozVFJJVXN1TjJsSjFiSmhvMVNNSDNwa0hUU01aaFZE?=
 =?utf-8?B?VW1XaXBUckZTazZLNkc3eWVVdTh1YmhCb0pCQ25ZazMxazZZdWptaWRraXJG?=
 =?utf-8?B?cEtMWW5uRXJPWnRTZ09IbS9nU0VsNW1kMDh2OTNaaDJaWkRpZjI1dk1NTFVB?=
 =?utf-8?B?MldzVXllUXYrMmdYOFpxdFpUMWJkWnVLTDdsK1ZoWllWY1NKUjVxNStZbld3?=
 =?utf-8?B?VmswQldsc3RrY1AyWkQrV2FvcGUwdEJ3RktEaUExZVRYUjh0QzZjKytJUkl0?=
 =?utf-8?B?WmN1Ymd0Rjh5YUQxdURwUUpQMDBpbDVlRFhtTHRPb054OGxFdmhwTGQ5eWor?=
 =?utf-8?B?czA1VlBOT3d3KzhUMndLTm1UNERoSld0eVA2cGhHMzA4cjVkeVdzOW04RkxD?=
 =?utf-8?B?a2xBZEhWSDBXek5pUUlrcVZCNGovZldUY1FEMXFLbFV1VlJYbHBOL1VvM29j?=
 =?utf-8?Q?4AbVUO+SGj8vs?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec6a55f-5b43-4c86-3e20-08df2638bae4
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB10887.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 19:08:41.2159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB18080

Hi,

I don't think doing like this is correct.. We have a dedicated M.2 Ekey
binding and should use that:

https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml

Best regards,
Shengyu

在 2026/9/29 07:18, Jennifer Berringer 写道:
> K3 CoM260 IFX has an M.2 E-key slot for wireless. Add rfkill nodes for
> the GPIOs that control the slot's W_DISABLE1# and W_DISABLE2# pins for
> WLAN and Bluetooth.
> 
> Signed-off-by: Jennifer Berringer <jberring@redhat.com>
> ---
>   arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> index 01e286cb05797..cd878340e5add 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> @@ -47,6 +47,20 @@ reg_aux_vcc3v3: regulator-aux-vcc3v3 {
>   		regulator-max-microvolt = <3300000>;
>   		regulator-always-on;
>   	};
> +
> +	rfkill-pcie-wlan {
> +		compatible = "rfkill-gpio";
> +		label = "rfkill-pcie-wlan";
> +		radio-type = "wlan";
> +		shutdown-gpios = <&gpio K3_GPIO(73) GPIO_ACTIVE_LOW>;
> +	};
> +
> +	rfkill-usb-bt {
> +		compatible = "rfkill-gpio";
> +		label = "rfkill-usb-bt";
> +		radio-type = "bluetooth";
> +		shutdown-gpios = <&gpio K3_GPIO(57) GPIO_ACTIVE_LOW>;
> +	};
>   };
>   
>   &combophy {

