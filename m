Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19012071.outbound.protection.outlook.com [52.103.14.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE8D36196C;
	Tue,  1 Sep 2026 09:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.14.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256335; cv=fail; b=JiRKHyIufFZLyRYU7/ORWNsxZTOUtry+cupNjPnQQ0LRkxYQtUOZlGgUCkuOXmxDGnIgBIa25DSs90tawtQqOkjVR6Ix023B/spGG+RdrsFCuekNrI5QcCsGTWE7R9Dpv5u6qrypYb/tUXoDIoHYmieOR+iesBC9RSC0+41xf4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256335; c=relaxed/simple;
	bh=V7vzggn5hCqsjA2PBotRj5ASxhFeO4+ZUUcsSR3Wg8c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EKb2WDLBz4FEmGTUr4W1DdeM0fiMrHrMCNMsYnGlqabIUtMEmeM+I/4tMNZTfEQVUExlgIbn3Q1R9X+Wyww82aLyll1T6+jsL028rKjuR/QcKlS4u21Ez1jEdkE7SUk77EHaYJWMWMRlxZS/Dr3UrlfEbDvoFLWdlsAeC5EvrTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=lBak9nlJ; arc=fail smtp.client-ip=52.103.14.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="lBak9nlJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdqoMra1IvkMyDzZgsIdNOSv/KZKzrm18o7+gZTFSLutKg8+oussZJCStU+xGHNFeEsTkLfWZVvCpf3FX4+/3y1Ngx1mcJviduoZTncWc/yEgM2IQOSOzpJoR8y/whNcBgtG+/oSYzfMkwTReogz3dH/9ebhsLAhg5YfpeYTOabLnF8hkiF0aT9bjJYy7Sj1flzhrVgW4PrWyTQCxkRZ4epb6LUIUOQl7jImuVpPboYdpTYok9vM6I4D+YTF+2KjTHtKLgLh0DQgCQki9E+sWUKRq9eFs7avtobK38Uz4C3ob8rGfaDWANr82ZSik/CdTl3QtCvNuqaV0Kt98deXMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNKWNny8hUNOw+AANX8cDd5/zJiVYKo7d1uxirDjaw0=;
 b=fXjTDhuyLwduCGi04FThC2yfFaAATvK3UpDxJldvg7Hb9U6Eqji8E1joUumsUMwoD7RUv1JQfGVBCn+M7LMHcnLA3qDFweODbiEVuHx1Tnt69QnNGMQRVT7lhmHCEzuEaiuoBja2Kmi1JCVAKbS8YcVj9bgf5SM5+LxOZwhDdvyVPH0LXIjxk0mdTMZWlE3DGK94lLsyDpmbSA5JwzShX6lyHodh7TnRVgpYSTKz6TYoW+afR6h2hqxbTwJu8FW1HRI7FFM1h5zcjRVfkb9BHNCz9pTd6qOrpNW/AHM9GWFP1WQ1jvDAcCw+MalLRsgTXTco8dYr/1fuBgcPbFNwsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNKWNny8hUNOw+AANX8cDd5/zJiVYKo7d1uxirDjaw0=;
 b=lBak9nlJk4Tpkol84a75KS+JrzhKD8IP0dEFRxVt8EgdlUSmItGko3GWv/XFOGyNGZTqNgkFqG/e4zrrA6i9xe7SuqIOW3KZbeaS/aHROQpVtshICrTKJZxR71HWqgtWWVO10Rh1LYlfK02aUTqoPYcBQcJ88gZrcSTucNQKDUAtzL6UIWDMjwqBDs/SfWWVRVhTovsa+KBRmgx+PJpSgDu58RR7PbUenPwTwlH5SQFkzWfPybaYZ60PXBOnJOJoTC7qR3ku7sv3wdt8fDpcjnnoYb/BfrtLVWXnZKCWg9deebHYEYSuiB/gDGMvl3K33oa2B0nmJ35ZPIaX42p++A==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by BY5PR19MB4017.namprd19.prod.outlook.com (2603:10b6:a03:21a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Tue, 1 Sep
 2026 09:52:09 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 09:52:09 +0000
Message-ID:
 <SN7PR19MB6736E193A0C9B26CD98A956F9DA82@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Tue, 1 Sep 2026 13:52:01 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] dt-bindings: phy: qcom,ipq5332-uniphy-pcie:
 Change to PCIe/USB3 combo PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
 Nitheesh Sekar <quic_nsekar@quicinc.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-1-39be0955a6aa@outlook.com>
 <20260828-wisteria-fennec-from-arcadia-a44ebe@quoll>
 <SN7PR19MB6736B881B203BF5746F0DEE39DAC2@SN7PR19MB6736.namprd19.prod.outlook.com>
 <d69efb1c-4ab3-4148-8b98-035377852da6@kernel.org>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <d69efb1c-4ab3-4148-8b98-035377852da6@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: MR1P264CA0048.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::17) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <b8588962-a398-4292-b45a-b5a515f980d5@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|BY5PR19MB4017:EE_
X-MS-Office365-Filtering-Correlation-Id: 3810c05e-24d8-42fb-65da-08df080eb019
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|19110799012|8060799015|37011999003|23021999003|51005399006|25010399006|24021099003|5072599009|6090799003|40105399003|10035399007|1602099012|2607281247196008|440099028|4302099013|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkViTFpBcktteDJJc1d2cXNYVUZHbkMyTnYrYjk3ZCtiOCt2alpYU3pub3pk?=
 =?utf-8?B?dDVlcTlLeWt0blB3M3pVNFNUUlN2Y1Robm9XSHdzOG5xenF5MjdOSUVEdTJx?=
 =?utf-8?B?T0tVa0k2T1VVSFN6c09NTXFlMXNNZkR0SXN6Q1RIVHcvb1BjYzlhZlNRNTdZ?=
 =?utf-8?B?ZzJMa09aWkxWVFd6d0YzVnYybktZWmRzUXNMaWt3WFQ2dDA0RWFRTVV0NFZy?=
 =?utf-8?B?bys5QXVLa285Qy9aMFpGTHhiRjkrOHBrQ3V3eFRzTWMrQ1l6SURGZ2VvczIw?=
 =?utf-8?B?S1ZuT1AvQnowdlRhTTdZYVg2OUhzK0wvWGN3L1h5bjZWb3BqbkFTRG82U2lm?=
 =?utf-8?B?OXJFdzE4UVJ2NXlxTWJnVGJjQVY4cjJ0NDJyYy9MWkVoVzNEQ0hoMzBXVkUx?=
 =?utf-8?B?ejc3TWkyTW56dEtqaWlqbW9JYWpiNVU3b3R4L3AyUlpmS3cveDlEa1V0L0c0?=
 =?utf-8?B?cHp6bTFyUG5PZ1BYQUJvckRkckZXbk5GYjFQS3Uwb1I2TVdZaWVEZXpHbWZH?=
 =?utf-8?B?aVF3bnBoMDNmQ3BDUEkrZEJTcGtSeHBkTnAwRUZaTlpVcFhWd3VnL2ZlWlI1?=
 =?utf-8?B?OWRKMW4vUHVKRmRJK2hMeGdkdWNtZ0RKYlNvWGYvL3d6Q3pGKytPdlMrWmRw?=
 =?utf-8?B?aFpaYjV4OEIwSmpiN3lhWTlrQXhPaDc3UkdxYXV2c1JHaHF3c3JkUGpkVi81?=
 =?utf-8?B?eEErQmVEODVJYVJ6c2kvMDR0NUIxdGNtMytkY2JuZkRXL01oUXMvWUQ5V0Nn?=
 =?utf-8?B?amRpc0tYbklLbzdjOU8rUjlzbkVqSFJ0blc4Q0hIZXFEWExtd2h2amFKTXpm?=
 =?utf-8?B?b1RseEpaVTlYb1FVSnRWOWRnQlRBVytPcEVsdmNKbCtyY2VsNk01aWhoUWQv?=
 =?utf-8?B?UWRaYjFlTi9IMkdBSUVmMU9RQnc3R2VEaHd2SUN6V1Y1SkVicnl5TkgybUYx?=
 =?utf-8?B?RVcrRUJOS1lqczFFTlhxbG04K1RQeE1MQ0MxWnM5YWxVWHRMWk1QV2RPbkNP?=
 =?utf-8?B?cERYSFBFM1hQSjdsTmV0dlZ2R0dxenY5NmU5MTBjV0FFVmNxS0xVeEx4Q3JH?=
 =?utf-8?B?UGpRM1lMNHY5VWpzN2Z2WWRmVXNnVVBvTVRocnV5Vy9iNEpOSFFWT01RZ1pU?=
 =?utf-8?B?NHRCRG0wdEtrQ05oeEZPbmM4dC9EbnRKTDlSVVI3QlFoeXVtdExvRzBsVkZE?=
 =?utf-8?B?RmdXSWluMTRiUFhYTFk0YnFZUCtpZHN6NEMxcm5kZ0VPbTdqQlRyM1Q1ZGJz?=
 =?utf-8?B?am1XaWlPM1M0QXFpS3M3aGdMblZUL05qV3kzUTNvU3dNcFU2SFNtL09JbXVS?=
 =?utf-8?B?OGdVem1KcGFkcjA5UjB5SlRDMnUwSkszQ2dEc01kMVRYM1NaVVNXUGRhQ2xm?=
 =?utf-8?B?Y3BmUzhKam5ZT0hoOFJHZnM3cEcxU3I0UWtJWDV3WVZIU1hUTTY5Skd4aVVu?=
 =?utf-8?B?OHQ4VVZPS2E4Wk9CR3V1OWdSWjlFMWZqc2lRdVZ3PT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlpDUjMzcGFaSWY3TmVBN1BneFhQZG01NHcyNHkyWFhibUlUSFpPbzBPZktH?=
 =?utf-8?B?d2srQjBxMnc2RXkrS3JTazJyZ3g3Rnc0eGZCd0NpZHgwUldkNW01ZytCKy83?=
 =?utf-8?B?ejVFaUhsVHRaWi83REJNZmdPYzZkUWpBdFgxUUpIVjNQbnFrMmUrSXFnVmRn?=
 =?utf-8?B?NTlsaWNzTUlJUlkwWmRES1NZVHZQd2lWYlJ6UERkNm9Peit3TmhBZDhvSEh3?=
 =?utf-8?B?WkdEUVVuTU1nc1F1eng5MnNBODArNmwvdXRrcmpBZ0lMV09oKzd0VjFvUUdB?=
 =?utf-8?B?bjd3UDJ1ejgrNkRCeGVRRUNoT2JvRHAzK3M0MFNTUWtMMnV5RC9nWlVJSkR2?=
 =?utf-8?B?Y1daVW91SWpPRDRIR3RLd2V6TDAwRStJK25TSnpLRmJFVDBrUUx1cENEYzZu?=
 =?utf-8?B?RHNPNlptdW1FMjRIL28wVDM1OUh6OFNycUR6aXh6QUhsejBRdEovcko3aVZL?=
 =?utf-8?B?Z1lrSFBRNHg3N3BacWd3ZnlKMEorVlZ1WVpHNWdQYUp1RGJHRmtJVGdjejFq?=
 =?utf-8?B?UzYyVjNoWDFxOHJBb2JrMCtxU2tUTWZpeVlrOURYQmFPYUNzK25uY1NRcis3?=
 =?utf-8?B?QkxhNjRHNGVrQ1dDaDgzKzZUQlExakZBOG1ZT2U4YjNSLzhnSjVMTzBiWkdu?=
 =?utf-8?B?bFpoR01hU3Q5bjhFZUpNUmsybGpvRHNnMC95ZnlvUFhLcUFWaFhUTGc3SzRm?=
 =?utf-8?B?OTlMa3cwNHVDQk4yemdXaG54WFRFbndsRmJEL2Q3YU1FRGMxQVQyVnNkNnlD?=
 =?utf-8?B?ZnQxc1p5b1FHVFZJVGJ4UW9xSGJyaERCNHM4Y1FzRVVwNThZNzlSQk5sLzQ3?=
 =?utf-8?B?UndHT3lhY2dkdkhRMEEyUmwwbzkzdUVkVjlDM3hHb1lBZXZsdHovb29uNDl4?=
 =?utf-8?B?Y3pNRCtyUXphU2Z0Z2MzdVJyMXlGN250VHdBZTBwMko2cmJEYlNJaEtNd3ow?=
 =?utf-8?B?TWE3ejBURGRBWkNtNmFKMjEzYms1OXFqbHhselN0MXBhdHpZQUVwbDExcTRZ?=
 =?utf-8?B?VFBidmUzK1BUMk1ZZHpQeXpYZ1d3K3Arb3ZJajdkckVaM283WjBwNldMMTZH?=
 =?utf-8?B?VlhxZDZvb1NMWmY5dVdzeENQdDVYcjhWaTRTNTA2V29pNVNHK2Q2ZHJXR01P?=
 =?utf-8?B?QitBZFJEbXRaOGt2ZWlaM2IvLzVwWUQwVVRNV0U1MHlQdittdk45UXNXckRF?=
 =?utf-8?B?SGphZWZ1cDdrSnNxMld2RTlGelBGT3pBOU42S29yNWlCWFE0T3RyUkJqOGZB?=
 =?utf-8?B?ekVaWDdISDY5QjFTYTdsOVJEZVQxdVovZnpKSG1SMHRGcVpGVGF6cGFOSVRj?=
 =?utf-8?B?ZlUrRXJTL2lGQWpUYW5COGx2UjdYdXRHVTdiTEVOeWxua1pFY013Q29vbFFZ?=
 =?utf-8?B?RkxnRWJ1SGpvSU10Ty9uYkJSTEdDdVpNNUQ0QVg2NkRhL1g3bjdvaEFUK1hV?=
 =?utf-8?B?TVpBYkIzbEtPNTEzYjIwL0xXWXlhZTh3eGk5a0ZuYXlJbkhjOVJ1K0NCSTFh?=
 =?utf-8?B?V0xEcThobnVPaHhueXk5ZXZVVnlERUtBLzFuZWppWnJWZzl6djd5eEt6b3dP?=
 =?utf-8?B?Y2VKeFVKY2lVcnJpOGh4ZlQwd1Rxem1kY1lGWWtHaS9taE9YZk9aWjZhS2ZC?=
 =?utf-8?B?Snd6SVJYb3g2WkthS2VsS1FuYm1YWEFRRmE3cW43ZUt3eStWWEJXTmk1Z2h5?=
 =?utf-8?B?THo2OXV6WTNBNVd5QzA2QmJLcjd6Q0o5RlVpVm4xN2FWVmJLVUdjQ2pmNjFU?=
 =?utf-8?B?N2NkaXhDZS9ibkxWOHA0NFhVV3ByQmRLNEEvMXkxVSsxY1RNQnJpUXM0UEpP?=
 =?utf-8?B?OEJ4V0R2RGJUMDgwZkdab3lKY25HUWRRRUxsV1FaNzRYOGVBWWZCRXY3bWxw?=
 =?utf-8?B?WGl2Q3FwaXoyYjE2dTdpRGZJUU0zSU13Z2ZPU2ZscVQ0dGc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3810c05e-24d8-42fb-65da-08df080eb019
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 09:52:09.2898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB4017

On 8/31/26 16:30, Krzysztof Kozlowski wrote:
> On 28/08/2026 12:51, George Moussalem wrote:
>> On 8/28/26 14:09, Krzysztof Kozlowski wrote:
>>> On Tue, Aug 25, 2026 at 04:37:18PM +0400, George Moussalem wrote:
>>>> This PHY is a PCIE/USB3 multi-purpose PHY. Initial support was added for
>>>> PCIe only, so rename the binding and add support for USB3 PHY mode.
>>>>
>>>> The PCIe and USB physical pads are muxed and selection is done via a
>>>> control register in TCSR. Add a new property to the binding to enable
>>>> switching the default PCIe mux selection to USB3 mode.
>>>>
>>>> In addition, USB3 mode requires a 5V supply, so add a vdd-supply
>>>> property for it.
>>>>
>>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>>> ---
>>>>  .../bindings/phy/qcom,ipq5332-uniphy-pcie-phy.yaml | 109 ----------------
>>>>  .../phy/qcom,ipq5332-uniphy-pcie-usb3-phy.yaml     | 141 +++++++++++++++++++++
>>>>  include/dt-bindings/phy/phy-qcom-qmp.h             |   4 +
>>>>  3 files changed, 145 insertions(+), 109 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-phy.yaml
>>>> deleted file mode 100644
>>>> index 6e9df81441e9..000000000000
>>>
>>> Please do not rename the binding. Old name was correct. New one is not,
>>> otherwise please point me to the compatible like that.
>>
>> I thought we had come to the conclusion it's the same device in the
>> discussion in v2:
>> https://lore.kernel.org/all/gn43qixdtbq5iyfqvzibdtx4lmwpkt2ieahr7oqsxxjfpldb6d@xbxhbdrq4e6b/
>>
> 
> How is it relevant to renaming of the file?
> 
>> I've split up this series into 3 as in the cover letter:
>> 1. Flatten USB Controller Nodes on IPQ SoCs
>>    link:
>> https://lore.kernel.org/r/20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com
>> 2. Enable USB3 for Qualcomm IPQ5018 (this patch series)
>> 3. Enable USB3 for Qualcomm IPQ5332 (to be submitted)
> 
> How is this relevant?

No issues with leaving the filename unchanged, I thought it would better
reflect what the PHY actually is, a combo PCIe/USB3 PHY rather than a
standalone PCIe PHY.

For clarity, USB3 and combo PCIe/USB3 will be added to this existing
binding, correct?

> 
> Best regards,
> Krzysztof

George
