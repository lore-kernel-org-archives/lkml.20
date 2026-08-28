Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazolkn19012076.outbound.protection.outlook.com [52.103.11.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A07C3A4F33;
	Fri, 28 Aug 2026 10:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.11.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787914327; cv=fail; b=rmbxIaCUYiTrK1PyKc2PiYeYmREp1cA3/6BfSTzmahS2LaZivtvl9TSR+Wok5Kd9PkY/Kd67EFVp0KyIzeum1t7HjDxaZG7a1M3t1By9TeaBCZIUP85pLdngSKdojOc8iI9X7tDvxAhHDQTHmxnN7BVcgypTPmj6bhckjzQNfGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787914327; c=relaxed/simple;
	bh=W0sdK+GkKi1fIlYLMW/VtewvZiSWUSYM+DU+DoQnffs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nTimS4HSxsmqm57l1diVx1RmKNCZsAk2aJPEaJlJmcfWXesKDbvG/StVIwHhfyw4ZPOJDF+JHakJ0InUWDFenMaOy9hZyykBm5JQJz6XFKiL9JAQ6DoXwdPJAt4f6tvQbSdcPgQKJyHd3C31qSzOnpuSY5hgC7Xvh4oj5ttHuqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=vKi/iXqK; arc=fail smtp.client-ip=52.103.11.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="vKi/iXqK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHxBxvRyK8V3P0lm4cO+mfM6Jkwcrp0RBIvn3w29HhUEG8asYn18oKxe7bjsAAYSGJDbI0DZNclJkpJmJi3TaemyxkhFdV0tTMpQr8qH5JfhJEDSCWPwBoLgXboXxWoqxNORgJHDKTL2C80dRDomkwjbmj9Jf0n3EzxZUlcZtttcDp7RvX7D8Wb1mrTnXwW2RaiFrl/POX+/KZGdXmD3MPP/MroMt10gb5MqTvkKIpPkVlVKH2X/WPPjDnBZ/1VS+tlFcunVH1su5ia0L7860xeabm8Dm0sKCTGmuy36aoJD6TWiKJSAfMorEGuSHl4ARrcgxtmhM4/Mj9sMU+hTSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U97FrOhtmvjdVGzcrMwoquLpToaN+RPvx4WRg2HtAKw=;
 b=rJOqCCIzqEpfMrtTtMfrQfZ68c5L7E6lHmKQonU5awXuw9KcsmbNrgQFR/xDxYH/28fx8HWKrrJxplrFCkVUQZ+OOPbpLnUXKRXhrLXiTS+YIgsDt2i2DtnI0OHaGm/4T2deS0SLzJCGPO+K990bkUNzcvtzpiMC22AOlHBoxVOrzLQtdb4j/delb/yy2KU5XNX1rE/+4h8GMYI/AZmoRi+CJ0AGKsO0rb6Qz/QWhH4+yeQFHlm39FMsbAwaPZc5RRPoucJiPSsJ9m+Y/8zUXf9SEsUUo3CgBMcmY+sAU05NdAN8YyTLHUg0/T2YA6QtjPA0LYfV4ZyA/tpc8l+YAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U97FrOhtmvjdVGzcrMwoquLpToaN+RPvx4WRg2HtAKw=;
 b=vKi/iXqKlh7gsGfY7Zfni+7ioVW5eYR+P5VO3Uq0YYMa3dE+H0RQ/+cEUzwhdci7ORQFp2rtcE6baSCCNR2z08JEmebpeNz6CnVpWHCQDBdeyOBbFnobkQoZzbPvGpyp0qqvpsub3WiR+zNXiL22+KJLGW88Hw2s/mwn6Tvhpc+fXhUImO6EDPgsZOf+6BRgZ0tSYnHxX7mvs5gt9Vgjnh6NUsSN1z/D4lbiqzAaGhSjZC0/eQZxbViu8QyEluznQwLa+T8/aNtXd/CoYLgEd/Suvuxqdm0AjWUP9Og385cpbJnJc9egHefKjEYLzDl+VgW2km+a3EDE8NeQGBBdOg==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by SA1PR19MB5039.namprd19.prod.outlook.com (2603:10b6:806:1ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 28 Aug
 2026 10:52:02 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0315.011; Fri, 28 Aug 2026
 10:52:02 +0000
Message-ID:
 <SN7PR19MB6736B881B203BF5746F0DEE39DAC2@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Fri, 28 Aug 2026 14:51:53 +0400
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
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20260828-wisteria-fennec-from-arcadia-a44ebe@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0127.eurprd07.prod.outlook.com
 (2603:10a6:802:16::14) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <7986716a-1d6a-477e-99bb-1a0c8709a342@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|SA1PR19MB5039:EE_
X-MS-Office365-Filtering-Correlation-Id: c2c07e64-c25f-4ad0-15a8-08df04f2642d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|4140399003|5072599009|24021099003|6090799003|25010399006|15080799012|23021999003|19110799012|8060799015|37011999003|440099028|3412199025|4302099013|40105399003|2607281247196008|1602099012|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0pHckZnMnJyOGZLYy9SRGErcm5rWSs0d2Nwb3JoblNzNGFKaGNsTUphQk53?=
 =?utf-8?B?ZlUrZXN3eFUvNysyMG1LSE91MGp5NGVjbFR6eDlOcW9XUGhBNlRsbWFyUHgw?=
 =?utf-8?B?ZWtkY3hSSi9QK1N1VkVrNTRMZU1CVTd5RjdMek4yS3RFSURGVmFDd2ZJTmZ1?=
 =?utf-8?B?aFE2YWVFR0xTT00yQ2Fhb2ozRTJKU0pNYzZsdWEzVCtQSzc5TldJYkx3MXVD?=
 =?utf-8?B?aFlDclBzeTNhdHF5QVZUa0pWcXowVldIcWlJT3phNklXVURPK3d6RFM4QVNM?=
 =?utf-8?B?eEdyVzdWTE50dVRHdDlGckNIR1l2MEVQelF4UUFxQndDekVoY1VDODNkaTNB?=
 =?utf-8?B?Q1pvTHlwNFJ6em1ic1BPQTMxdExobC9pa3g3ZUpzRlVXWHJjdFMrTnFLdUk4?=
 =?utf-8?B?YkZwMDd5ZXpmaUhFUnB4QTcrbkRNOGhBLzBTK3hhYkVVdzlPT1ZWYmlyM1Z0?=
 =?utf-8?B?aGUwK0R0OGszQmh2QjBTSHR1dW83RXc4RzdxbGFmeEFKcVhyWkFLZDcyZk5s?=
 =?utf-8?B?L3NlUGJkcXFXUlNONmlWVlFSWCtOYjkxa2s1R1BNdHI2aWxibFJvOU9hTjRr?=
 =?utf-8?B?Z05yL01PMW1XTzVVZVZxeUk5YWx5WUlrNjU2SWR1TkVuL0lzNlFvT0R2RXVI?=
 =?utf-8?B?NzNFOGFYNmdRUzRDZWcvN0tWL1NkWmZxcFFFWTJvMjdaeWNhSGtiTDcxTlNM?=
 =?utf-8?B?ODArbUJxU2lYU0VrOVNQMFhsMmowYS9EM21aYVNDU1FzMUsxMUwxS3hGWTJq?=
 =?utf-8?B?dkFlK1h0U2FSb2xBTklaVk1EMTBOOFZyZlRINGtFVzRNV0IzaVN2WjVNWWpJ?=
 =?utf-8?B?Slg2Z3JvNEVIZjFJQ05wT0FnR0JJWCtVMmhWYnRzb3VpdThPM1llUTREZlc3?=
 =?utf-8?B?M0tjZDlvc2Z4Mk1OTG1mWUsxS0U0RkE5bmZOZDRiTGNOWVoxNmF6VGkyM1pY?=
 =?utf-8?B?OEMvSkIrQUhRZGI1dHcyd1hFU3krejRNbHRURS9rTFRNV3JnSW9nc0dxNUV2?=
 =?utf-8?B?WXBpNFJVMkZIL2d0eW1DVnFZWmVyb1NkUnRwYVZYckI2RTdwT3Z0amtxZUI5?=
 =?utf-8?B?cWNnb3VSNEVRQnlUSU10Q2ZWdmlYUGVsKzJyZzJKTW1qRjgrandMZDNTTGRx?=
 =?utf-8?B?ZnNDcjlwWW9qUTZLd1V2YUpkTytCUnlweVJpQVJDamV4MWNxWmNOenByWUgy?=
 =?utf-8?B?YWZWQWlWdkxWdms0cE1HTU1BVW14eWduUU1pa2gyUUJxbXBvOVFkbjRmY1lH?=
 =?utf-8?B?Z2VTd2RJQ3g1YzZXb3F5ZUQ4WUNDOWlhMEVEY1E0MUpvRTJFeXorOVdDYndk?=
 =?utf-8?B?UG5xM1VRM2JKOVBQV3hSMUNDcXJGQ3BmR1FJanNwdHkrMG1sZVhFMmNsbjJW?=
 =?utf-8?B?N3RVSHNLaWNKa0hleVlqcXJ6UHI2UVZzYi9KZHpsc1FmWDlmSGNDU1VSc0tJ?=
 =?utf-8?B?SlRoOE5WLzIrNGVrQkNEcTE1UEVXWFR3eEQzeXhRPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnpHN2htcHBwMEdZZ243S3RhNkxQR2F6SjFVRnBnYVNHdk9IZmxHTGVTZm1o?=
 =?utf-8?B?K3RpQnA2R1E0alBJejRrSFJSVS9ZSFZSdlh5K3ZjSW42bDNhaXZuNWg5Zk9O?=
 =?utf-8?B?TTN5WlZSZVpCVkUxWDdqeVhFLzA3a2l2Y2NwOWhacWNnSHY0bm9nSXAyVU5z?=
 =?utf-8?B?UGdCQnlSZDFXaGtGcHRWN1hMNjZ6S2tjdDdTSHJNMmwwbkdRendvZFBnem1s?=
 =?utf-8?B?SEFyNmxQRlpTOHBYc09Jd1V6elIwR1o3bjdpVmI2bHNMb2dadFhESE9EQ2Nk?=
 =?utf-8?B?ZEJzVmhRVS94WGxoczhBZEhNMVhISTRUellSQXR2SXh4b0tkZDVoNm9vOUZB?=
 =?utf-8?B?czZ6L1hEUjBMYWpOZG9aY2FmN3JNM3NCOEk3Q211cUdvTmI2aFF1Z3FtL0Zx?=
 =?utf-8?B?Z2dsMFR5VEc2OGo1YnNTZTZMbVlTUUNRZWhodFhCOU4ramxLU2VNeXg2Q2l5?=
 =?utf-8?B?VjQ3MnhjV0dIZXB5dm1UYVJON2NrSlE5Tml3L0UrU2lnMlQvYlZlelluNlV2?=
 =?utf-8?B?QVVTZWEwY21mbDF0Y1Y0WXova244N1Y4Si9qdi9NVExoL1lwd1Fua1pYSGZZ?=
 =?utf-8?B?dVQ2d3MzUHRuNk1aTTdBc0x5M29nUU42YzFIWkhyT0ZNUkdvZWk3QzMzNGUy?=
 =?utf-8?B?RHIxdHJaVmRLNkFyMzZ3L2gveXA1M2F1RFFRc3cwRXJyY2NLdHgyTTV4ck9l?=
 =?utf-8?B?YWR1YXdkKzBOWEpqNHExUFB4dk1ZK21wSXVMZzliS1E0TzdiZ3M4K21pbjBG?=
 =?utf-8?B?RGFtVlNOblRSNGZFNktvclNWZ2dlSzR6azhGb3VxRkYxRHprQ084MXZWNm1a?=
 =?utf-8?B?aDFIZXhlT242Yk5tTlhjOVNTR2IzUXhDZG5kZWxPY2V3eGpHQ1V4RnhCelov?=
 =?utf-8?B?eU83dEdUVm1XSlh3M3Y1U0FlQ2hlVHhvcnZJU2p3UkV1b3JHWjRsL3BMYlBK?=
 =?utf-8?B?MUN3VUI0bXVodlR3cnZocEdnb0xHeUJYS2d6ZnVHSEtKQW5CN09WOXJZL2Vr?=
 =?utf-8?B?RVpLL0FiVFNIbXQvcTFINGxZVDA2bTJsWlJOM0laVWYyaUQyV3NsTVZlK2t5?=
 =?utf-8?B?alhPbmRCUUpZb0srb1J1ODBLaU42QmYrS1I0NS9hYzBBWkFja0NzSGM2K3NS?=
 =?utf-8?B?Y0dzQ2Q4WFNLTkJvN2phU2R3dVZsVHNiVnRmaG5YSEVTUDBlSTVab2FRbFFh?=
 =?utf-8?B?bWZ5L2ZUdERHUU92M2k1QU9OTUhXajZqeEVYM2hRK3IvVDBScHFTVmdWSkVy?=
 =?utf-8?B?dWR4SHZqS1U3c1FRVlk3UXpCcms3QzdXYkswY0RSeitqbHRiN1hCVlBBeGx6?=
 =?utf-8?B?bFpGc0hWcmpNTnlrUmoza290bm1HRXZWeHp1VzVKYnI4Y3hOcE9pUmYrT1Jt?=
 =?utf-8?B?bGxtcWtmSFo2em1UeU5sejZBUEpkTGFFQmFzZ1gxNC95MnJtNWdEd2JBM0hY?=
 =?utf-8?B?UUZUMjZTVUpWWFczclovYlo0a3pRQ0RHV09MRFlFS0hqQjdiSktxbHFrK25M?=
 =?utf-8?B?Q2JvVDJ1Nmh2YUlDZjUweTRmUlk3ZzFzL2JDUXhaYVJ5VkMrZjc5QjZGeHcr?=
 =?utf-8?B?UlVkVk5XSzhxQTRTcTZFQ0lYY09rUUNZS3hDNTJVRzhPQ0RoZEpJY3A2dFlO?=
 =?utf-8?B?YzN4VkUxVlQrK0RtcWJtaWUrVUo2RENaODArdnlWU1FyT0l2QTQwRURqN3Vh?=
 =?utf-8?B?QWJROWloeTFVdVNkbFVjaXJLc1JXWWp3TzB4Zmo5YVo5VmhjZHVrdUZ5M2h3?=
 =?utf-8?B?MXlWZEprdFpBMnBqd3htT1p4cTlxWmJ1THhRL3h5czliWGl6ZU1sb25EcGpz?=
 =?utf-8?B?U2FPMWRvY1hTV0JtSTJqNVdoUlVxcW5nRXFrZldFa0dwMkd3eERESHJERzlO?=
 =?utf-8?B?RTlkeXZrN1NCSGdsbXUrOGVkVW41OFpuWXBlQmx4Q1JCWXc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c07e64-c25f-4ad0-15a8-08df04f2642d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 10:52:02.4797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5039

On 8/28/26 14:09, Krzysztof Kozlowski wrote:
> On Tue, Aug 25, 2026 at 04:37:18PM +0400, George Moussalem wrote:
>> This PHY is a PCIE/USB3 multi-purpose PHY. Initial support was added for
>> PCIe only, so rename the binding and add support for USB3 PHY mode.
>>
>> The PCIe and USB physical pads are muxed and selection is done via a
>> control register in TCSR. Add a new property to the binding to enable
>> switching the default PCIe mux selection to USB3 mode.
>>
>> In addition, USB3 mode requires a 5V supply, so add a vdd-supply
>> property for it.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>>  .../bindings/phy/qcom,ipq5332-uniphy-pcie-phy.yaml | 109 ----------------
>>  .../phy/qcom,ipq5332-uniphy-pcie-usb3-phy.yaml     | 141 +++++++++++++++++++++
>>  include/dt-bindings/phy/phy-qcom-qmp.h             |   4 +
>>  3 files changed, 145 insertions(+), 109 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-phy.yaml
>> deleted file mode 100644
>> index 6e9df81441e9..000000000000
> 
> Please do not rename the binding. Old name was correct. New one is not,
> otherwise please point me to the compatible like that.

I thought we had come to the conclusion it's the same device in the
discussion in v2:
https://lore.kernel.org/all/gn43qixdtbq5iyfqvzibdtx4lmwpkt2ieahr7oqsxxjfpldb6d@xbxhbdrq4e6b/

I've split up this series into 3 as in the cover letter:
1. Flatten USB Controller Nodes on IPQ SoCs
   link:
https://lore.kernel.org/r/20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com
2. Enable USB3 for Qualcomm IPQ5018 (this patch series)
3. Enable USB3 for Qualcomm IPQ5332 (to be submitted)

Since 2 is dependent on 1, I thought I'd wait for the feedback first on
1, then submit 3 which is dependent on 2.

But eventually, the IPQ5332 combo PHY looks like:

	pcie0_phy: phy@4b0000 {
		compatible = "qcom,ipq5332-uniphy-pcie-usb3-phy";
		reg = <0x004b0000 0x800>;
		clocks = <&gcc GCC_PCIE3X1_0_PIPE_CLK>,
			 <&gcc GCC_PCIE3X1_PHY_AHB_CLK>,
			 <&gcc GCC_USB0_PIPE_CLK>,
			 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>;
		clock-names = "pcie-pipe",
			      "pcie-ahb",
			      "usb3-pipe",
			      "usb3-cfg-ahb";

		resets = <&gcc GCC_PCIE3X1_0_PHY_BCR>,
			 <&gcc GCC_PCIE3X1_PHY_AHB_CLK_ARES>,
			 <&gcc GCC_PCIE3X1_0_PHY_PHY_BCR>,
			 <&gcc GCC_USB0_PHY_BCR>;
		reset-names = "pcie-phy",
			      "pcie-ahb",
			      "pcie-cfg",
			      "usb3-phy";

		#clock-cells = <1>;
		#phy-cells = <1>;

		num-lanes = <1>;

		status = "disabled";
	};

I have the patches ready. Let me know if you'd like them submitted.
The idea was to prepare the binding for both IPQ5018 USB3 and IPQ5332
PCIe/USB3, hence the rename from pcie -> pcie-usb3

> 
> Best regards,
> Krzysztof
> 

Best regards,
George

