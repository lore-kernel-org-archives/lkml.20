Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazolkn19010006.outbound.protection.outlook.com [52.103.20.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D3726B2CE;
	Sun, 30 Aug 2026 13:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.20.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788095883; cv=fail; b=nxkXBJC7uAYhtl3VTpHXzM8UCrA2kSaKTzgQ7WSNojE2cjc8X6SPq9TVRi9A69nf0I85cRknz4oXRtd810a5Wh1C5ivOxTDHo/tHFGOv9en12S2axi4lm684qhmipDv7JAlqMwt4HqzY3ibycfDhmxvLtWzI5og70ao81EgnG8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788095883; c=relaxed/simple;
	bh=Nx5tkJJcMM3+GuI023ZicP5XahOSTPco2FRclKXVJSc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Lm6vQXtTHay/HkBX3wqi6KFGzo4CcTPcnnmw3Kg12clh2WZTQWvnpYrFHmM+uRrKs3u92yModTc8V1xr607N37hO7iCkeltQZA0pd2nLkuhKz8697afZezE802kn6kbnll7LcN9H5hcrEOznE/m86lDlo5QgtS8qh0bv1PiJmvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Ho5816xM; arc=fail smtp.client-ip=52.103.20.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Ho5816xM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vUqHmYNSvG+8pVrkUY4BSQkJVq9uGyUPjmrDXaJvyX9915ci6eH1rNq7kw1vhguNs8akvpz+tIuD65+JZx5UGtEfR1ZGOhnb29kytQzkVW0c4ZvkPXr1zEGFCmtD8zPTIeu/NGa1icT0hAqjMk7hqAMU0YsXplVvrGzNXxfxf+FezVWadvM+Jc8CZ9m639PXcgcmXQ8Nm9fuy0K3Ub88NIl5C64TQNa/y0qKODXLZRyTttGxLTQAPkje9iw94ZAgUyPF1NJliNObURhQV/BOmKtvbWkJQQAhniyiyHAtSPf/r2yVU1x32jgrF69z8DKw7CIjt0lksJjOG71HUhAJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRAA1lZDha0wotdWDnVbbD6WHCsfhHAinh/GQzyNNV4=;
 b=u/GIzD5nPwY7HK0qgsUW1/Om8r/AhH6PlB9eg9mhVWQDs0sU267X+B3pmuWCO5Hjex6KAb5f3M/fP+5Qg0rIZkstnrAr55uS8KRvmhr0/Gp6jK5YGWgxtt2QwPbddsimmB4+mrrEEw0/3oFbxgsIt3RwJnvTaDZclerRz3vioK93UwpMvW931q6TODSlgdL6+r8rBGYfTvXjsFbHsHl1W9XPL1GRXtu6Ho1LU8ttZaBlviAm1DBNdcuqyy9w/bV4bmbBDvHZKzBhJVU5xHpzbOfF6oqiOtixQO8XBLZyVrFlRKGkkcMFqf122Mg+yfOIZ+ggJCV+ygU7NPQvKn8vLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRAA1lZDha0wotdWDnVbbD6WHCsfhHAinh/GQzyNNV4=;
 b=Ho5816xMkrXLkLYr+XmD7tnRwDD1+kIM56lysI+L0i6Aic1kHa/CLQn9WgIFsP0Ut0x4X7JASoblwO+Uk0Xn4yH7xiPDq/ByCWcWR4Zj497q2XJJfEKamaHkvOVhh2qPJLBv1M+9eb7c8eBa7DkH75H7pl474+VpjBWMBhSwBr0yUlMeDD/qiatONHx8uk/BXFSDTWgqPXarpDMzyfRtAUxwgqQkqWh9CHPjYmsYX9n5mm165fmLVkE6lYvj0/XcYmshqpOAQNX01x2eSV9O2twOptqKMZM1xf1gc4JDrXFUCA9em34kQc6rUk6phAb/xZMldaa9S8DwjH+a0UCFZQ==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by PH8PR19MB997361.namprd19.prod.outlook.com (2603:10b6:510:3a0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sun, 30 Aug
 2026 13:17:58 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 13:17:58 +0000
Message-ID:
 <SN7PR19MB6736260F96F41BC5B5F726C39DAA2@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Sun, 30 Aug 2026 17:17:50 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: usb: qcom,snps-dwc3: Add ability to
 select UTMI as reference clock
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-1-5c1f3170bbe9@outlook.com>
 <20260830-primitive-faithful-mouse-cdd1e8@quoll>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20260830-primitive-faithful-mouse-cdd1e8@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0044.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:58::17) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <0c4ac162-adaf-4789-b920-35d074a6bec5@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|PH8PR19MB997361:EE_
X-MS-Office365-Filtering-Correlation-Id: f1590dee-4a2a-42f2-8b12-08df06991bff
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|25010399006|6090799003|23021999003|15080799012|8060799015|19110799012|37011999003|24021099003|51005399006|3412199025|440099028|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWkwV01jalA2UTlKaGNUTG44YkdMWFkxZEUwc3BGK0lqQ2poT2dJTTdZaUNa?=
 =?utf-8?B?QWtwRkMrclJsSS9rVHpubEpMdHQyUEhiQkxJYXhmamEybzNPVm41SVlKcWRm?=
 =?utf-8?B?UE5jb28rQWFVaWcrWUdyVkg4UTZpVzlZRVBJM2FCMFVIR2V6QXJTUUhQRE1B?=
 =?utf-8?B?U1h2QUt4dk80bXhQdHdacUNEODB6bFdhcmRYUzU3a2Q1ZXpmd3dIUmtTUUJB?=
 =?utf-8?B?QWxMcEZnd2tMZklRSHAzMy9xNnliMWtuWWI5Yi9KaFlKUUJQYm5acmJBdmYw?=
 =?utf-8?B?SDIrYkJ5TEVZaTcvaVpDNEF4cWQ0ajd6Z2xmSmtwd3FudnBzK2UxMFR0Wjly?=
 =?utf-8?B?WmpSamRGQzUrZnFTZTlUbWNxQmc2VDhzdmN4Zmw3R1VBRTUwZEx2b3VGQmt2?=
 =?utf-8?B?bENpZW5nZzBDRTVCZldYVDdHYUhwWVVKcHpPTzZCcEQwWXdpZ2k3UG82RC9X?=
 =?utf-8?B?ZERJL3dOZjNCeHJld1JUYU5DVFRPTURvaVVEVnZLZWV4amMrNFllQ1R4SFdB?=
 =?utf-8?B?Y3ZNWWxaWms0SWI3cUk2dEdMK0w3dEdoVFJWcUlSOVdDZWMyajlmNDhsWWN6?=
 =?utf-8?B?cEpyUjFocWN3MjRFbWVhNlpPb1FQVGlwYWpXT09pYW4xYzJYRU55b29oQkh5?=
 =?utf-8?B?cEhwa2hyd2NDZ0kwM2hOZGNBQi9RczRhamI0M1JDUU9FSnMvQjk5UG9sOFNF?=
 =?utf-8?B?MkRxZUFTN2Y2eHZUOSs0cGJZSzZzSDRMNlI1ZEp6YWRLRHR0TlVSNWJYVGls?=
 =?utf-8?B?U1pRL1FZTUVvZFJSLzFxY05ZUlNVaGoxMVdPOE5FY29waDJ1OXFkeGg3S3RF?=
 =?utf-8?B?YWV0NjQ3aFhUVWhJd1JtbVA1NTk3b01vNzJma0oyQi83OHRZYWR2YWV1U1ZL?=
 =?utf-8?B?Mlo2V3RnK3Y4eW9vdWJHTnFqVGljOGZQMG15d2RMQUpPMUJkUTRtcE80aTJ5?=
 =?utf-8?B?eE0ySnk3NDhqOFpqVGVhbUdkQktZVWx4eFRuaGRuY0dRSm9wd05Ha1VwSkZl?=
 =?utf-8?B?UW14ZzM0b0NFdi9sQTBybjBnTEdCR2lUWjV0TE1XSE85WlZUZ05CMnR0Wk53?=
 =?utf-8?B?RjNBY044SjV4bjNqKzNuRDNEemhsZWJaMTRkcHdiRHZLUDRZRnV6TmJaWno4?=
 =?utf-8?B?bTNSREZLT0hYazdud0c4Mm9WcmVQaDh6WnUvWWU3NFdNSmdNZFVMMGpxSE5k?=
 =?utf-8?B?Y01EdkpEbUtjQ0FkTkk5ZEhJSmR0bGtWTElxZEFNdnJDYUtselJiSzZUaFZu?=
 =?utf-8?B?QkV0aEo5UzBkbkE5YTEwamJXS0diQmFYMUsySDNzeFNFTnNzMG5nOUh3MUx5?=
 =?utf-8?Q?8z9FTRCuLRWM+HoYrHivQ3oojJQg+fIGVb?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OE9iVHlQQ3MrSE4zTEhCR3pvL3l3Y1ZQZE4yYTRRR0U0TGJMdXFReGxTK0Y4?=
 =?utf-8?B?Tlk4cGRhZmVMTUlmQnprcUtzNUJRam9OVk5MOFJYQVJBQ1dkUDBiaGYrS2FR?=
 =?utf-8?B?eTRUdGFVNk1PM2V5bjcxYkxKUkoyemFIMmZaVGFzVWYwSkhWd0w5ZzE2S3FI?=
 =?utf-8?B?d3VTYVZKTERjVzNUbnRVaDNtYlV6NUd4cCt0bGdJd3F3Y2w3WlBwbStGNzFX?=
 =?utf-8?B?QnZzTDNJbENob2FheXFqKys0NHZxWldhK05YZXUyb0pHUlQvbnl0bVlUa2tI?=
 =?utf-8?B?KzVubWtLOUd5OFF3UTBYRHdaYURhL3VxUTJWcmFWZDlTWGRjcFE4Z3RRZlIw?=
 =?utf-8?B?T00zNVo5MlZZSXZGTFgxS0ZEM1pTU1UxdklZcVpEbkVPTE10eTJrdXJ1QnR1?=
 =?utf-8?B?SDQ3T005Tk9obFBXZitncnBCbURxU2ZXdGt1dVdCRUREVjB1aFNMcWJwWDdV?=
 =?utf-8?B?TG1GZEx3aWFTTTlUb2M0dVV5aUovK3l1YjBzOHI1UHJ6STJ6VVNGVWkrZ2c5?=
 =?utf-8?B?TUYvM1hPdlI0c0lXTmh6eVhha3ZKRjAwT3F5a3NuVnlHeUthaW84emdlQWhW?=
 =?utf-8?B?YnY0VTFBZlIzMnFRZ1IvOGRtSmdvaWlrTlROeFgzc295NHpCSWVoZDNDRnJX?=
 =?utf-8?B?c010R3RwZXhVSVpQSER2eXhxSUx6TVJZZDZ2ZEpMU3RFN3hvS1NGdmpRQzV5?=
 =?utf-8?B?WGdNRVc3YzVqNVVsQjgvTFJTNnhNYm9OdHdJeXJ5OVdMWnVxWjFXT1JPNE8y?=
 =?utf-8?B?cEZIaXFLdE1MQTV0c2RMVEhaZkdydzhTMzV0aXpiZ3JiVVBQYnVnQkZ3eFpz?=
 =?utf-8?B?c201SEVrVC80SGE0UU1KN3pab1hYbnNxT3pSSktrR21BRFNtMWN0c1ljdzNY?=
 =?utf-8?B?TjRrclc5c3BXYkhsaFlxWWhSZE1HSHhDZUF0c012S0NhR0NyR1oyeFFRUzRH?=
 =?utf-8?B?V0ZhazBmcGNPUy9KN1JvejBla1NSU0J6TGtHRUpGUE5VOXMyajhDN1dmalk5?=
 =?utf-8?B?S0RGcEN1dUJnRXl4WGppZS81QVV1RmhSZmVwMWQxaWE1RmNzcjVTVnF3akRr?=
 =?utf-8?B?R0hMQk5jdGwyZkE5L0pady94S0FEb05PNzVoeWVxQ29vaEUybmVVMkR0UUti?=
 =?utf-8?B?VlZRN1hyYVRlYndaQXk4R2FHQ08rL0I2NTFjK3J6cUJJSWZXdjY0ekZ0QXhJ?=
 =?utf-8?B?WUx0dEVPakh2QzFLZTNKUFV5dWN6eW1XOGdLWXFLMjdBN0FrbkQxbGFkclhs?=
 =?utf-8?B?SjhPUDhRWWxmN3RxVy9VYnNiYXY2MzV2YkF2QkIzNUtyNkJZdTdpOHVHNmh5?=
 =?utf-8?B?WmtVVUdZaGhWbVNtbTNwNmtWNTZvVDA4RTNkU3A4bzZxRUhXRFdodDVieXBn?=
 =?utf-8?B?U2xUQ05rYUlUOUFCaTlGdXF6ejhmYm9zWXZTRzFudFVmT2xiUHVyWW8wdGVm?=
 =?utf-8?B?Qll0QXdtY0d1K2ZhN3BUNjVMSGVwa1hkYjdNcnNCa053N1VxbW03b0RUcHdK?=
 =?utf-8?B?bVZJNndFd0NlZ1JkWTFJUjdoRGlSZFlpUTFIRXYzczRiN28vRVZ1WGRoYkRY?=
 =?utf-8?B?eWw3dXQ2RCtzSkU2dVZGTFVrcCtBSzRBTXpxUXFYTHBXTVhUcktNbXhsTTd3?=
 =?utf-8?B?TVAyY1lzbjNnVmd4RlBkQkN3N1J5UW8vWE5KSmxyNkp1VldIalRsSExHQ2Np?=
 =?utf-8?B?SDFNSTA1ODUyWjNMd1lvcERRNnNRYXlESlRKWC9ZL2NFV1BHUHNqZklnYzJP?=
 =?utf-8?B?cC9qbTVEejdLWVRMckhqNDYyL1QrR1FWVTFITWtlWjNWdFNNZG9yNlZHVDVj?=
 =?utf-8?B?c3h0OEdabFY3R0dxUmZWN1I2b2dUSzZ6eGRoOXZsTkkxdWZBQUlNK2NoUEZl?=
 =?utf-8?B?SVkyMURPZ0FaazJORXlVMnllRnp2VC9xM0w1dWZURmQ3SkE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1590dee-4a2a-42f2-8b12-08df06991bff
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 13:17:58.5361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB997361

On 8/30/26 13:41, Krzysztof Kozlowski wrote:
> On Tue, Aug 25, 2026 at 02:42:26PM +0400, George Moussalem wrote:
>> Add ability to select the UTMI clock as reference clock which is passed
>> by the glue layer to the DWC3 core to calculate the reference clock
>> period and frame length adjustment based on its clock rate.
>>
>> In the flattened snsp-dwc3 model, it is currently not possible to pass a
>> reference clock that differs from the default since:
>> commit 613a2e655d4d ("usb: dwc3: core: Expose core driver as library")
>>
>> This prevents moving chipsets such as IPQ5018, IPQ6018, IPQ5332, IPQ5424
>> and IPQ9574 with a reference clock rate different from 19.2 MHz from
>> moving to the flattened model.
>>
>> The Qualcomm takes care of clock and resets management itself and sets
>> the ignore_clocks_and_resets flag in dwc3_probe_data to true, so the
>> core doesn't acquire the reference clock from the devicetree.
>>
>> The existing DT property 'snps,quirk-ref-clk-period-ns' has been
>> deprecated.
> 
> There is no such property.
> 
> 
>>
>> So, add a property to select the UTMI clock used by many (if not all)
>> Qualcomm USB controllers as the reference clock.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
>> index ea60f7220afe..aa263dfd42a1 100644
>> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
>> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
>> @@ -155,6 +155,15 @@ properties:
>>        HS/FS/LS modes are supported.
>>      type: boolean
>>  
>> +  qcom,select-utmi-as-ref-clk:
>> +    description:
>> +      If present, pass the UTMI clock as the reference clock to the DWC3 core to
>> +      use its clock rate to calculate the reference clock period and frame
>> +      length adjustment in GUCTL and GFLADJ registers. This is needed when these
>> +      values based on the standard clock rate deviate from the hardware default
>> +      values. If not set, the hardware default values are used.
> 
> Sashiko comment seems valid. You describe Linux behavior. In your commit
> msg you mention that clock cannot be passed since commit 613a2e655d4d,
> which is a driver commit. So trivial answer would be: if issue was
> caused by driver commit, then fix is within driver, not bindings.

The issue stems from collapsing the snps and dwc nodes into one: the
same clock was passed as "mock_utmi" in snps and as "ref" in the dwc
child node. In the flattened model, this causes two issues:
1. the core driver gets the ref clock by name ("ref") but you would
break the binding by changing the clock name from mock_utmi to ref and
perhaps causes backwards compatibility issues.
2. Even if you change the clock name, the new qcom glue layer sets
ignore_clocks_and_resets to true in the probe_data struct which means
the core driver doesn't acquire and manage the clocks/resets.

> 
> Maybe there is different issue which is not purely-driver specific, but
> I did not get that from description.
> 
> For example, if given SoC has different rates, then the SoC-specific DWC
> compatible defines which clock to use and you do not need such property.

That was possible in the 'old' way because it was allowed to pass the
same clock as both the mock_utmi and ref clock, albeit in different
nodes targeting snps and dwc respectively.

To solve it in the driver itself means we'd need to create compatible
specific match data structs which currently aren't in the driver and all
SoCs that require it (at least the ones in this series) wouldn't be able
to just use qcom,snps-dwc as the fallback. This would increase
complexity of the driver (which now is nice and simple) and would
require a change to the bindings too.
In addition, for some SoCs such as IPQ6018, we'd need two compatibles
because it has two USB controllers and only one of them requires setting
the ref clock.

Kindly advise so I can adjust v-next of the series accordingly.

> 
> Best regards,
> Krzysztof
> 
> 

Thanks,
George
