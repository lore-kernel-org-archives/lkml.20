Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19010047.outbound.protection.outlook.com [52.103.7.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC7D202F71;
	Thu,  3 Sep 2026 04:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.7.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411441; cv=fail; b=FENSPatZfrmOjWzDWDxTzG5lWOnYLCLRT+HNpV4WNRxDW4/BYv2qO/cWgQUKwYGodB1aC0yoaXBiqxZKJG7W/tgs7o29LVwo8qzFLJ+AbHm6IpjnIByB/ccPaDK/LBkaA17rqf9WwJOhfb7pMc21sekDJgWEYyJuY9aYHOKrlMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411441; c=relaxed/simple;
	bh=JdWMcoUPH+gsuu8339Tg6JO8NrzLZtb/wzmBWhT/uOc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Drlgf8S9+MD9fLsPvACBQzmdwlVH/oWDG1YZSVDqaTTa5biZsqEmRqxIeNR452wSn01QR9NGYHHo3MJdDk+dxq7fRrRaWDbIDsrlOver6vmPb3cdhDCWrxU280ZHH8Mo0RkjSh5KwIW626hzyG0Hypjvg4QDz4R3VinVCogMj9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=VPNaA9Vx; arc=fail smtp.client-ip=52.103.7.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="VPNaA9Vx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bc6FihQJAVA0GVizYvK0aMerHZqUHYrd3DJ/qSKfevadHqY1LesYjpvQ8ODvuRLtKcvayxDgpoVmDJKKRN+fcWAR7XLaZVIB5rmpGq2yS2o/WBdZozZRAKO1tNgf2i6/Fm3N+MXJxfb/UGowTedeRMBmVjIXKqMfxps+kZPaOZuqDxTT3e4tvmf8NYX3O9xCAC6qi5Y2mSm0J+ROyThIDS4rI7zahxpOJq4zMdRes4VhAKZP4syOq+QwAU59gDIJu0XmMALOiKCwVJOXVC/c5/+M3UosdXwqrvlUStKw4i31c7wJlINhzSQ3998QvSpEQhhhimSAWmiYFo1DDE1MIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+r4t3tTHtd8SQevr/iYFMipAtIu9zOnZyiE/FZT2nY=;
 b=cZKKdYMJ2UIlYfy85eUFE02CaNd2DMX4p0OlPuRhuSlGBlqDDk7lsahqOFjW3SRdSGUHyoDdx8+ulSLL1OlgWDEKOT4nYL0hAYTdWweRciq/FOPQlOri3F5TpBtAxnJ2V2hN2Q4W4cdWnlaUgvY1iT+GxBYjx8YkGtHjJddgv8txEuXUvLQtiUiuzezOVTF5FJD9nD9tfLd3eIm6ecDu++64Q8LxEn3M2VcwfLOFpGV2GPDBSbP3I//UMZWjpNGlruxshIbep5YDsJcaXBhxdPBMZ99bgIjkpq51fMfe5+t1/sDvkgaPY/MbX8KJmviyyFf/aHmlss6XgZ628/qIkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+r4t3tTHtd8SQevr/iYFMipAtIu9zOnZyiE/FZT2nY=;
 b=VPNaA9VxmyxvFPSXtRAHWiikcQkot8QdiUq4hVEA35OmaCHRrRzJn3+FmJ3HAxMWXwFZXrKIvZAW/8/lmEXjrKINH/b8Iht3BcKZkvYoiKMik6LKso70kLSOd6Ba8VNiSa0FzKoBS9A8/y+nypvp9V48ncNLWb5hVMa6DzkShG4nBh5E7+0bY0RqcnRV2CvgbJ0hqBjViocSxWK1ODUBKmlEj6GUHW+cK1mXyDcKbf4taw3S5bQr63cPJEhJOMuyYlHlUxr1ZLM3Ox5HVB8TA/e/PEj+AvqKU3em1FFutKtZQEshcqP3jt8XZuHY6ftTj214Rl42rMzdsAwPlLQ/DA==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by CO1PR19MB5048.namprd19.prod.outlook.com (2603:10b6:303:f2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 04:57:17 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 04:57:17 +0000
Message-ID:
 <SN7PR19MB673630544FB38F78BE5800359DB62@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Thu, 3 Sep 2026 08:57:07 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] arm64: dts: qcom: ipq5018: Enable USB
 Super-Speed PHY
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
 Nitheesh Sekar <quic_nsekar@quicinc.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-12-39be0955a6aa@outlook.com>
 <3c34164f-08cb-4e33-af8d-c5d19012a1ff@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <3c34164f-08cb-4e33-af8d-c5d19012a1ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0013.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:26::18) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <ae3833c3-3a54-4c6d-b69c-f0aa7dcbdc6e@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|CO1PR19MB5048:EE_
X-MS-Office365-Filtering-Correlation-Id: 128639c2-29f7-4887-0d10-08df0977d3c8
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|19110799012|6090799003|5072599009|15080799012|8060799015|23021999003|37011999003|24021099003|51005399006|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHZNWUpPc3VEQ3NuaEVLU2hCQ0FsemxaQjgvdUtETDUxZU9GNm1mQ1N3UnJT?=
 =?utf-8?B?N0NjZGF1cWNlTHJCY1E5QzZRM1VxdEttTGt5M2haVXNDczg4dFVlUDZ1cTI3?=
 =?utf-8?B?VitES2Y1TlFuRG9Ccjd0R1Fwa09sRnJFTzlPdmc4dVd2MjRBQnZXd0xSdS9z?=
 =?utf-8?B?WTR1Wlp0T24xTmQrS2syL1h2cHZKVEk1dVFsS2JuSHNlZjdMazN1NlBadWhW?=
 =?utf-8?B?YUxGNWROVFNuY2JEVms5QUZhVWtBaEwxVlM1bWtZQVVDMzNyRlNoU0xGKy9k?=
 =?utf-8?B?VXBGVG9uMEZEWkVFajJZdnV6VHg3VlZhWXJiMnZKMXFTMGYwcVJSQS82b1du?=
 =?utf-8?B?RU5UdEdEYzlXM1RGajBxWGdkTXJLRzI4dDBLM1Bsd3gxOWdoQXNUaUJSVU80?=
 =?utf-8?B?MHFvcHRpN0NqT0wzS2crdTRienFTOHJOU1lQRkQ3WE9XTmIyTDJXa0kzcEN5?=
 =?utf-8?B?WDArcVRjQXZtMzdwaVM0N010Zm81SU50QlY5RFl4S2dxMlZnekZGaERHTTQx?=
 =?utf-8?B?M3EwTkdjdVdEUWEwWnU5RG42eG9OUDRKOEM1SEtvSlB4UWl1S050cnhneVlz?=
 =?utf-8?B?cUl3UlVxUFl3NFZkZ01BRWlsSWpESzlENWowRjZsTHdIdk9QTWNMaTBJN3Nx?=
 =?utf-8?B?cTEvR1E5NkJ3eDR4MlpNNXdCT2FtMlJZZjU1cXZEcjlPRHI5Rk9xM0RpRXJT?=
 =?utf-8?B?eHNqc0ErS0gxdXl1WXltaUNrMVMvRE40bitLWEpDbDQ0dG11WENiZmc1ai9F?=
 =?utf-8?B?YjFDMzF3Uy9wOTB1VFlUdVBCeUxJYlNzTVVMaTlNaUZ3ZFpZMG5tazNIMG5J?=
 =?utf-8?B?UVozTE0yQlkxZmxsUmdkMTlHWjZxbThBL0U3T200RlJ4ZG05S0VFZklYenJM?=
 =?utf-8?B?anBrOTR3RGtVeXFqWFppZWZPcmRFV21ISUIzMGV4Q3RnNUhPaGNnazNzVXhO?=
 =?utf-8?B?U2ZBRWthRmoySGYyN0tHc2FxT3I2dkRTY1p6bHpPdGxLSFJaVDlaKzFrblNm?=
 =?utf-8?B?bWlXbHdqZTNNS243RTBmZlkyeDgzV0gxTE14WEwvSjdVa05ETFQ2QmJNVDVP?=
 =?utf-8?B?TUZkem5XNitCRndrWDB1blArc2RrdnZaTTV1Ny9MczYyWDJOdEN6MGRXV29V?=
 =?utf-8?B?QzQ2SXZJcVVSTVVBRko2cHZpY25uUUdIQk8yZFhPZDNIK2dpWVFnTDgvdHRp?=
 =?utf-8?B?alh3Z25oTGNEaDhIaUp0N21DS2RTdEVjS0o1SldUOWNVTHZCV2VCOFdXL090?=
 =?utf-8?B?bXFRa0hLWWkzYVcrdEwrWlZkb1lkTTZWWS9vZ0hSNFh2OFJFVnhCdU5ySk9n?=
 =?utf-8?Q?6RQsHUFiDk1peKIZxtO8sXnF/JfatIoj3g?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVRnV1QyMDZYMXdaaXE2Qyt3THBnMXBoTnhJbTg3aU9EeUVJSEVLVWJ1NkJX?=
 =?utf-8?B?TWV3YS93eWNBMWJrQTFoSEd0M0FLdjJIenc4WDZPQ0FuZVdWeC9adkhxRnFC?=
 =?utf-8?B?SFRXM2ZxYmU5YkF1ckdCU1FGN2V2Z2lxMjF2TCtTK0lKcFlPai81OHozVmla?=
 =?utf-8?B?cjZ4TEtRcnhRZHZoNWNPUmJPTXEvamV6SFU3UG9lbHllMnlYblpjanlLNWZI?=
 =?utf-8?B?aWdIbVJyZ0g2azV1MnU4QzYzd3dXb01nYjh1SWFQWUl4NmM0RUFuNGxNT2l1?=
 =?utf-8?B?aG9WNG9neFdiVm9nUzNEUVNsSi9TLy9OM1RvNnl5d1l5Zk9Xem82YlBlaFVS?=
 =?utf-8?B?a25GZ203eW9uZWZ2UEkxRmVNU1g5V0c1cDIvaC9CZzdXSjlFVWdub1JJSHVp?=
 =?utf-8?B?T2RhTTllbXZaTE5rRXhOVU5yV2tsbnVtalY5L2Q1UDB1alB6cjQ4TStaRWZT?=
 =?utf-8?B?eWU5Y1cwUEE2eSt0YkVqWW9FbGtTajFyYXpEaDM5R1NXSDJJWHd3ZGZYYllo?=
 =?utf-8?B?Z2xBM1JSenJRYWU1VFgwZFZEdTRoNy9rSEZLR2tVUVVwMlQ2M1RTQ0ZuS1RC?=
 =?utf-8?B?ZlRFSVQ5WXpmK2MxbWJFbXZyRWFSSDl2SWFJQy9DM0hIRHV5ZVpkNkpXMStp?=
 =?utf-8?B?aENGMFNHb2MrdjE5WHdPTnB1L29KMCtZWEdYczlESXRpMEtyRmpsSlFXcGRU?=
 =?utf-8?B?SjAreVkvd2x2SXpLRGZwTm1SVGRnZHp2cXR4VzgvdkFSSml1eWc5enJuY0VH?=
 =?utf-8?B?Q3BNZFI1VWNaV2RWaHBrVWFUOEJncm9zRTNQZEVWQllobkxDQURNUE90VHVT?=
 =?utf-8?B?TGlmb2lFMW1Kb1NHdWRSL2ZtNnJTSlhyT0ZQL0lRRWc4b1E4bisreEhtL090?=
 =?utf-8?B?VzJVNi9jVnJ0VHlsTGZLcXNZNEFLV2luRG5JOTZMTXdWV1BmbHEyb0lvVzZp?=
 =?utf-8?B?VzFuY09xZlVjZmdOQnB6eHM2VnFuWXRZOUpMN3JPS3lFd1V5OGZKZUgxMVpm?=
 =?utf-8?B?MGtudkxsZlk4QnYwcFpuaW1XbG4zQVJyc3k5bGRiU1FJZTh1ZXMyM1VIQm9U?=
 =?utf-8?B?RitRVVJkSGV5U0tiMnpMUERidEJla09FMUZYWDYwYUV3MlJIdzVPODlZL1cr?=
 =?utf-8?B?cUV0NEJEQzVlVHh3WGkwUGc1TFNqdlRvQjcvUzk3eVkyY1dpU2lEMVRWWFJJ?=
 =?utf-8?B?N0Z1U2p2a1JMQjNUYThmNk90aU94alhlVnhIVHE3dHl4S2VYWnNjWUpNaHUr?=
 =?utf-8?B?b2xXSEZNTE9RM1VqbUQ2Sm9iS25UWFYyTTFIWTFFTTZhZEU3S0oxUExpbldk?=
 =?utf-8?B?TUFoVVprUWpFRkRSUkVYVkh4V1JaSGNXL2FGaDNzajBNdTNZSEpreXNRV3pJ?=
 =?utf-8?B?U1FOUUVib05GdlI2NnpMa0RURm5YNGYwREhXRDVGS2h1TjFyVG5MSExiVDds?=
 =?utf-8?B?bVlrUXREWjZDNEhLNGF6SEltVmZBQm1FQjBReWdMVDd3ZDFRYkVlcUtyOUVp?=
 =?utf-8?B?VnpBQmN2YnlaUkQrQVdvYWpveGtBSk9QY2dSNlh6d2MvcEZ4ZndETmIyN3kr?=
 =?utf-8?B?NFR2SExDWG9vRmJkVVVYaGYrSGtsUGcrR3Z3NStUSWNudVJPQ0FTWDhGOWE3?=
 =?utf-8?B?S2pSSzg0Y2xWdzlvSjdvRlEyVS9uR1dHUUN6YVl1SXlTZ0Z6NzJCRFhMOU9q?=
 =?utf-8?B?WjVic3Rod1NtbTNHWXBHdUxmZ3dPcG1mdXJWeGZrOUlYMGpsN3c5dnhQSkZJ?=
 =?utf-8?B?UUN2UkxTTFd2M0tCekkreFE2bVlqZDFJOHdocHFNejUvWWx1cmNwYzNsNS9F?=
 =?utf-8?B?OC9ySVhKWmxOVU41KzFicFA4NjZNMlU4N1dIV2QzdVdzUkRSZ3liSXozR0pN?=
 =?utf-8?B?TGlYUUlFamxSd3NKLzFiRjNBakZGcFNwNVJsVkd4L012b1E9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 128639c2-29f7-4887-0d10-08df0977d3c8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 04:57:17.4739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5048

On 9/1/26 17:24, Konrad Dybcio wrote:
> On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> Add the 5V supply regulator and enable USB Super-Speed PHY support.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
> 
> subject:
> 
> arm64: dts: qcom: ipq5018-rdp432-c2: ...

will adjust the commit title, thanks.

> 
> please
> 
> Konrad

