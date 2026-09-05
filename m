Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19013074.outbound.protection.outlook.com [52.103.7.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416AB3AB26E;
	Sat,  5 Sep 2026 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.7.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611621; cv=fail; b=OLuobkWFhyyty3ccAWKM3m/JxodDqkWqioQDp29qZdp75T4uNF3OKs5eJpyGNAKVcFI3mH9uzJ4LZW/TTIUzlmytYm7EzjRxYM74MZ3ibs8j2ENKAMnXLgbkiFbZeikBsczC9cULl3GsPQWiNNXr3C5bUmRktLHooJZP/vIUzw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611621; c=relaxed/simple;
	bh=ZLOJ0+lj3DcedpH9LTyz41JUlysfvDS3lHQFm2GLuHo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=G5mti479VhIASAlZtChyxMZw7lbKcfxb2kEq+x0RXMHbksaoUx4KivC6+0nmcDVJKXjNbvJfj9pUxiDFJSI4d76RQG3+yYzYIE86puD+HgAcEhgeKm8bbXm+UrMVAE6YKAuVGqixfcQn8G6jMEvaTuJW44xl+PznNCK9c4JoORI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=dWYSso0Z; arc=fail smtp.client-ip=52.103.7.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="dWYSso0Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DX9zZH5gbmrLqIbCBhut/wqujBhQcfSdMsQzsCzoW6+OFskY10Ot4Z3rZf3IkefAW8BeN5h0qmpjBprJ/vSbXIjsU3OWc5gAK6PjJSEFfxyw9Ls+112t0sYUxkvugbdyqMt3al2w8QmWfLQwynkdSIRCa+yYTbIxhgoxLiCLrUXELRY1vB82RgwchPiBvkEpaFJEfJKx/owT3gUVeZcD00vGjVKNg1bQnFhcW7/AxJl/uYBtTahtqUM1HXpdOSr2678EDUB1m07tE+Ed92Rtx+G1D5D4ENA+7R0LzR1WqIUYmBWNm3p91lZNstDGIK3tqCp8a9oSIz/gAJZKg3mCAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbDOGYzKBhUTuHqIBUd0Jr2lfVgwuwJ3Jdl+Mvmu0CA=;
 b=W3DCf9U/fVlEc/bdpRHh3T1ELAyTB3pWvjbfO9xYvNSS6AL0lfu9W6SH1k6gOPW7bZQ6bdzMFA9yKEDy4SyFBNfk1nb3nNLMF20B48X8QfA7SW1IjhahUl5sTtuqY82Qn3gRU4uLpyrbamKU8fnw6Y8ClxDiJJif6mHWKd5L8zLGatuvhy3o+EN2DGhgSa4iPMn//8VJAWSlZk7KpQydGW9uKNqgG2XedmlRL6VsR60IWlJ0mWBoZLh+ENFepaj4JyZV0dkC2FHv9yB1TZI7lSdStlAAGIqy/WWLt+C6IwAD5BVS7Gx8mcqIxrLqdo3KlV75OBJJUL4yf0QM7piuGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbDOGYzKBhUTuHqIBUd0Jr2lfVgwuwJ3Jdl+Mvmu0CA=;
 b=dWYSso0ZN1qh/rmwsHW5drB5c3NrZxn0B8q/RuUhtgRw9K63P0L49N9M2b/3+jkpzXu98biPqwCNmXf3RtH5xtx1ACcThm3v4dWdRZ9khE6yu66RDWy1DdXU57VjAQcONXDy8doE2VWL8U9kWfuHI9X2Wgf7SXSVWC05/4BmZjU8j1FZBW/Pooj9IpxLfHAnHTjSRESlq2Yt/kaXJlEKrXhZ8MRneJOrdxSY0D0ni2FKf/0rBMv1iwjOJ/7/tzkNYwwAGaU+SclmNvxVe2GCqmQ3Dqn5knMfdLWNCuJEqD8lHPeu+lNiQlugRYQ6cD0jKjYz5IhMt6pBSWnWMvJdxA==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by PH0PR19MB5501.namprd19.prod.outlook.com (2603:10b6:510:14a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Sat, 5 Sep 2026
 12:33:37 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0382.007; Sat, 5 Sep 2026
 12:33:37 +0000
Message-ID:
 <SN7PR19MB67369644A162140D1397E31A9DB42@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Sat, 5 Sep 2026 16:33:25 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp: Use
 bulk reset_control API
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
 <20260825-ipq5018-usb3-v3-5-39be0955a6aa@outlook.com>
 <a1d438e9-0a12-4b05-b154-eaf9d1a6d31e@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <a1d438e9-0a12-4b05-b154-eaf9d1a6d31e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0035.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:58::20) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <e93303ed-99f7-4676-bb81-9c35d3538694@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|PH0PR19MB5501:EE_
X-MS-Office365-Filtering-Correlation-Id: b938a3ce-854f-4934-7102-08df0b49e81e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|15080799012|6090799003|5072599009|8022599003|21061999006|41001999006|8060799015|19110799012|37011999003|23021999003|25010399006|3071699003|2607281247196008|12091999003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkZFMzF4NUx4QktsREVnQXdtekN4YkdxQUdORlhmUDJiSElwSFN1R1oxUTFl?=
 =?utf-8?B?NjF0SmJMOW5KQ3R2QVpBbVB3dlhVZVNvU0VCQjFzcmd2OWxES2Y0bGNqa05l?=
 =?utf-8?B?ak5ya3lvM1U5ZlJqd3hieFY2ZjhhZFpnV2ZKd0I0MzlFeG9KMFpBRnVxRFZE?=
 =?utf-8?B?d2k1c2NwazFoZk1IRG8xSGN4R1l2bzB1N0hhQkFaMHFQUHNod2JRSzMvODNm?=
 =?utf-8?B?eVU1SnJaYmFpQnpEcU04VVZNRDYraVAwejl1ZlIzblNSRlROcTA3eWNVTEt6?=
 =?utf-8?B?dFRMdEVreVBNanlYa3FLcTNmVFkzQkJ3eG1TZlFRcmxqNnlLMFE3U2JuYU52?=
 =?utf-8?B?cktneHZHb0Mvbjc0am9GSjhrZTdqYTdQS0M3ZWZBdDIxRDNEbnd0ZVN4a1Fz?=
 =?utf-8?B?cUYxaTBzRnoyMkpPVVl5N3JSUXhQazBwRHVmc2FKY0VpZ0JCSEhxNVdkTnAr?=
 =?utf-8?B?dGNDaUpueklhRXRTVUthbTVSTWp6OE1oYlh1REdJQ0oyRkFqVzZZRTYxNHo4?=
 =?utf-8?B?QmdLOWNCTnoxOUVPV2Fzc042MVlKSzBIME9iMmVGUXZnVTFZcHpUK3ZYS2xz?=
 =?utf-8?B?ODhnRFVkN2FQS2RsTnkySzhXTW5XMWc0alMvK0podmRLL0lsM21xVHN3U2pa?=
 =?utf-8?B?N3NoaE5UZjRSdkkxU2FoTHdUQWJaajNDSDNxL1oxSTQ5SE5saWtQWXREZnRj?=
 =?utf-8?B?YmwwQjN4MzlmWmtRSmtDWUlXV1VDUS9hQlROWXJoUm9sUnRrVWxXejBMaTBR?=
 =?utf-8?B?Z0pEZUsyRWZRU05WNEtKYmtQcDVFblo3OUc1dGhIOW5lRXMrTEJEbTAyTWxm?=
 =?utf-8?B?K1BIcGh2clhmR25PeHkyK0lqRk44Wkh0dEFid00xTkx2R3lRUnBsUFlNZTJ3?=
 =?utf-8?B?bjRyNVhiTzk2TEN0ZFdQUE5lT05tNm80VkIvVmdCOWNOazhlSjg5WVNzM3Qz?=
 =?utf-8?B?eUdqU2NoLzYvekNvekJGV0pXekFac2c3aFp4cUwrd0dKUUZjL0pDUXJzeThM?=
 =?utf-8?B?OTJxTXZoK1NQNVl6aFk1TGJ5c3hsdENLNjZUL1hHS1ErZjFIYk5ONDJxcm5J?=
 =?utf-8?B?YTduQ0pUZitsU09kTExCVkRiZDcwUk8wN1NLOWlLdnZxb3h1ZWw3Wm40akFs?=
 =?utf-8?B?dGZrNC8rejEwNW9MRzVhVHE0dWJYM2Z4c1pTbG1rSkwzNWZnUThhQllDYWJw?=
 =?utf-8?B?RUt1R3ZGcGZ4ODN2K1lzN3NZMGtKQ1hTdnZYOGNNTGxIY2doTWdlY2RrUGhu?=
 =?utf-8?B?SEVTdExZV09XMWxhQXVuQlg2T2EvbU1pbVdkT0V6UjlpbTZjbEdPaXJIRm5I?=
 =?utf-8?B?YzVHL0dBd2J3UjBxUXJZb1BsK2IzVy9vQ3BmcVN6Syt1OUl6bDhqU0VWUkY3?=
 =?utf-8?B?SXVpTk8rODBodVRtRkFUemdmenFWdyt5S21yaTBWNzBobElIVkJXcVlRVDlE?=
 =?utf-8?B?dWJjeVBuYjVEVXpZYTdhb251T2kzaFpYbnZQMDhRPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1FaSGN6NnRVelQyb0RIcnpoQktIS0FBL1orSXlrazlTMktSaWxZeXRvYk5h?=
 =?utf-8?B?ZG5OWHdwaENJMEpYbDdndTJGKzliY3FwTzBreDVyaXRrWGZmTkI3Rk42bE1X?=
 =?utf-8?B?b3RKMkZ3VzNoTnRkZ0VIWkZPTWhpNnFRTnR5ZHlaWW96TlVpU1JJcHoyRlds?=
 =?utf-8?B?OWlMWEwweXRReGJCQit2aFlUcFlhakM0REU5SjRCV1dLVkJCcXlnTWVYeDhl?=
 =?utf-8?B?eXgxa2xBN1dJVVJkQjgyYytaMEdZbXMvZllFVGRCVnJmbWNneVVCZER4a0ky?=
 =?utf-8?B?MWlnYndBcFlCNVFVZ3hiQ0thck9KcGpLUWovQ3QvamdoQy84c3duZzY3cEpy?=
 =?utf-8?B?SU13bjBMbEhLNlY0bmtqUVZZa0xxbGhPZ2Z1Q05lTFlxTnNiYUNkYmhCRzNs?=
 =?utf-8?B?blhJMFAwOXBmc1VMaS9lNEs2TWZxVUNYUUxsOWxGcndxVzlDUFNlcEc1VkV5?=
 =?utf-8?B?bXFLMDRIaVBiSVN0UDBOaTRFdXdUdStsTHB2Tlh0SkN3OUhHYWo2RHFZMnJT?=
 =?utf-8?B?Rk5vYldvV29WS0h4YWMyRS85cmx1c1JsOFhSOGM1Zng3ZmtUNnE1aTVDcHY4?=
 =?utf-8?B?RzJoZUtWZU92RFk2OHRiNkZVdG15QTI4R2g5M1ZhQkFXSHRNYW42c2Z4RitX?=
 =?utf-8?B?Zm5zY2ZYWGZ3M29hdm0zQmFVM1ZQZ0JmM0VwTmExQzBwb3I1ZTNhN3ZOSWtk?=
 =?utf-8?B?Y0k0OFlTcGVYMlN2c3pZb1I4b09OSzdvMXBMaS8vcnVYZTFuZW5RZkdTMjFZ?=
 =?utf-8?B?azd3dk5SSmE3Rm1SaWQ2MHcwYTlMRk9KL2dUdUV5VkQ1dVlEK01yZng3WkNt?=
 =?utf-8?B?enN2aDJRWmtIU2NhNUNOUStnc1A1SHNSUUxWVy9ra3dZVFVwVW90aHowOEtV?=
 =?utf-8?B?U0dNVEUxaE4ydnpNTVBRdlJkY245dllEWm5qSitoeUtkMWpVMS9vRThXNWp3?=
 =?utf-8?B?OXczelNkenQ5V0I5bXlNOG1PR0RnNDliUy9PYmVNaEs5UHBReFdBc3hkczlk?=
 =?utf-8?B?RGZGU2dlWjRwTjJkazF2MmN6anZxdlVpNXJreWV2SWtnUjVkc1k1cjFSc2RT?=
 =?utf-8?B?OTFYN3VuRkcwdDFOVWRMUmZzb0ZlamZwZW16Q09ZVW1rSUM3dGl2ZFZ1WmRY?=
 =?utf-8?B?MWJ2bktIV0FCSGpvQlB6ZVNnUWlHTUpXanlOQlBsNk8vc04yVTgwRWF1M1ZH?=
 =?utf-8?B?M00rTHdOWkR4bmROelhWUmN1cGhFM0FNNXJ4VlFaVE5Ed0lyLzI3VkJrUHA1?=
 =?utf-8?B?WGQrQ0REaVhSaENyUjh3aDgwSldsM0VMRzRmMURmRUpFNVVpZkFtdkhFQlFD?=
 =?utf-8?B?QnZUaWZLaWdUNnk0OG5aZHRWNXZyOXNrdHR0YlVUdjFBRUFEbTJBOXN5RnMy?=
 =?utf-8?B?bHNJNld6SE4rcmdubGRPUzdiWHdyRkFaNVlENTdnR3Z4eUsybmt2b1k5TlVR?=
 =?utf-8?B?eUlobk5wcE9JRDZaQTNSKy8rQysza3c1cEhGNXVoQm90OGJITkxoc0lZTVFI?=
 =?utf-8?B?N29mOE9Db2pUcms3dU0vTHFTUlJxNFF6WTdqcFUvaEhpbE1DK3N6dlcydWJH?=
 =?utf-8?B?L0lPTU5XUWgyazhqM2VYWHg0OWRtWTVZRDNzYVE0S1NyMWk1SEU4SkpnWGpz?=
 =?utf-8?B?NEFkYnRDamRKVDhrQWpsQ1h3dnF0QWVCRDdDbTRBNXlqTStYVCtIWWlPSENV?=
 =?utf-8?B?YkJJVzM1QWxNbXBmS3RPVFRLbkJuVUtwTHhiNlFmdW44K29UTjVFZ3NTREhm?=
 =?utf-8?B?UUM3TWtMUmlsWkJ1NVRkNDhxaEczelZxNjhVbjhtQ3V5VEl1aWh5cWM4bDBK?=
 =?utf-8?B?bzdPRmFTYXhlQlczaml5UW1BZzRRb0hScnlZUW5vUU1MK05HNUlNNkdwdldR?=
 =?utf-8?B?SWhzTXEzQkNvQjU0ZVZrUjhEMDdzZ2tzOGF1L2xaaXQzNEE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b938a3ce-854f-4934-7102-08df0b49e81e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 12:33:37.2802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5501

On 9/1/26 17:16, Konrad Dybcio wrote:
> On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> Switch to using bulk reset_control functions to prepare the driver for
>> managing multiple resets, acquiring reset controls by name, and
>> uniformly storing resets in the private data structure to enable support
>> for future combo PHY functionality requiring multiple resets.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
> 
> [...]
> 
>> -	phy->resets = devm_reset_control_array_get_exclusive(phy->dev);
>> -	if (IS_ERR(phy->resets))
>> -		return PTR_ERR(phy->resets);
>> +	count = of_count_phandle_with_args(dev->of_node, "resets", "#reset-cells");
>> +	if (count < 0)
>> +		return count;
>> +
>> +	phy->resets = devm_kcalloc(dev, count, sizeof(*phy->resets), GFP_KERNEL);
>> +	if (!phy->resets)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < count; i++) {
>> +		phy->resets[i].rstc = devm_reset_control_get_exclusive_by_index(dev, i);
>> +		if (IS_ERR(phy->resets[i].rstc))
>> +			return PTR_ERR(phy->resets[i].rstc);
>> +	}
> 
> reset_control_bulk_get_exclusive()

This breaks acquiring the resets for the pcie phys, or any phy with
multiple unnamed resets. Because __reset_control_bulk_get looks up the
reset by id (name):

rstcs[i].rstc = __reset_control_get(dev, rstcs[i].id, 0, flags);

it will pass for the first unnamed reset, but it will return -EBUSY for
the second as the same reset is returned (first one it finds with no
name set) which was already acquired with the exclusive flag.

We'll need to use _by_index and leave them unnamed in the DT so we don't
break the existing binding.

> 
> Konrad

George
