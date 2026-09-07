Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazolkn19010018.outbound.protection.outlook.com [52.103.20.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9038A42D757;
	Mon,  7 Sep 2026 11:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.20.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781203; cv=fail; b=qAxe1kGFexWatZiuSlVUUuu/+VEK1+jKSqV9+WnXeN5fw3mlQrliAGKU3atExqV19BlPuGEqFAdpel1uyhhA/bDTUXGyKKnoOTQHCvwZIXvtyNCnV+miMG4XajQrNESP/00bB5Tif3ACWwwI6Q9KK/HN5XOAOne4RKYXwxBavz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781203; c=relaxed/simple;
	bh=KobjFyOXKeR5Crx60014vTisweHqbF/P49B6rqWIAak=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Dw+k8cu4meBRsqMp6sWUy4CgaNadVL03J23XQwO+0JydSB6VHeo05UMqYFaEQEMMwss3RFe7Bh+5e5xoYaFsKizs9t5D97ujvW6Bo05SNJZftEysFI8aOAKP/dgZseD7hlDxvle3cl0AJ2KEo+q2YXrTMIBOSQXhrarYarytCjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=OS/LpYWi; arc=fail smtp.client-ip=52.103.20.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="OS/LpYWi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVHRXMooizy+RYcH/Js59Hz/Fm0L2i+e676MDzMh7kFm9cZYZhCCoajyAwkSjKmMZNIOMewNtulWXP2zV6HUhVmZIS/QDNgbpJPM9BHYtg1EBsJCs0UEiJo8Mt6chpcPkkQx4zGrje6PoxPaP+WDDpk6QPevzMQ0U5n03sO+ziagY9NXl40pz+rdjawosN+kgfyg1Uxn0BNXakFfyXm4jqxhbZAURRVz2MxBVzTQrFnyZv3mR9PfFkEPkbNOhkFU0gV/Aa3phE+IsW9fRnNgJT/o4fIjls//SFmPbI95peGJQFzZY8w2ENGNKUr9GYVy0UWz+DH92T/tBwFZ1sUL+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/eHroBTWUBf72shYf8x4x0HNjPKbzEY+skZEUj3N4iw=;
 b=kPC/gps9BWaq07m63+SyxXMSjqi+AvDyNxk4zXsLM1Sh5qeZBbgfyYRV+J1MpMFfbGEqXrJWP//920BtP5BrMZVZiRdn1Af1VuiBNqNWqc/Pn30oGiGNBLb21z3+QcaghmS5mq2RVMFs1EGPR3sSefvotMbxiIcDMac7mw3C/Rkn/jl7tncPOYsad1wBZ6b8O4OW6XKDcHYU0RNLZnWlhApgSQqcDX/mK4jGpei2I9UNuiUTX2OpOIniiwm+womWPDARvdKBQ0TglpSu166XTwnokzePCmINDa6/SnMsTT2L7ufrHTuw/yfJsL54Bt//BeduMVQ82teyNWX+cEDlYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/eHroBTWUBf72shYf8x4x0HNjPKbzEY+skZEUj3N4iw=;
 b=OS/LpYWiAiLACo/HC9y1lz1LLmSW5xPlZh4bbmjwHu30KA9B2Au2btoNI7nHXXWZgExITqmnsOmelLoB1XH31NWPJU1kfpf+tP+8lFirjdwKaCB0h+txPyzuCQBcQkS7YB0Vdin8eE6OeMbdSc1t30mJ76ztTebeUoRgpg7HvTMBqdm5n/argj6/FYqwOIbcZa8aanyIHp75SsfrQPjUsesMrUtQrP2g5/1Ia6YUVd4MiRClMwW9E+FzQ9QTp5UQL2X/JXHLEiDcwhLIHAV+b416tcUkbswItZohE6bgrcmEV6swLIABiaizB2vSfz0YY39wLmx69e86+nctFo6uJg==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by DS2PR19MB9412.namprd19.prod.outlook.com (2603:10b6:8:2d1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 11:39:59 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 11:39:59 +0000
Message-ID:
 <SN7PR19MB6736EE02219ED04E638DA2E49DB22@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Mon, 7 Sep 2026 15:39:49 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] dt-bindings: phy: qcom,ipq5332-uniphy-pcie-usb3:
 Document the IPQ5018 USB3 PHY
To: Manivannan Sadhasivam <mani@kernel.org>
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
 Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-2-39be0955a6aa@outlook.com>
 <fkbmx5yyp65mp2qknnd2lbde5scfmr5dpbox5x4j4fu6uahtnl@mxx45aqojrg6>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <fkbmx5yyp65mp2qknnd2lbde5scfmr5dpbox5x4j4fu6uahtnl@mxx45aqojrg6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0013.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:26::18) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <c21db88e-da0d-43c0-b8de-30d29cc8ab5c@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|DS2PR19MB9412:EE_
X-MS-Office365-Filtering-Correlation-Id: 904665de-6308-41ec-251a-08df0cd4bf39
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|8060799015|19110799012|51005399006|15080799012|37011999003|24021099003|5072599009|6090799003|25010399006|40105399003|2607281247196008|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVA0RW1NaXJFVytnT1h6ZHJQcXgvYXdYazRSdSsxdVQxNW5paTJaR01Xa1pw?=
 =?utf-8?B?ZVVHMjlLVTR0YVFNUnVneWNEMExRcXBGdHZmczlOMkorUWpSMVAzY2xSWXV4?=
 =?utf-8?B?NWJsQU9CWU9EZVhxR3ppcWI5L0xLQUUzN2lsWlpTYjlXVzRDamliTlowd3Bj?=
 =?utf-8?B?VTgwM1ROVmgwQnluc3lZT2M4Qksza1V3aXRzRlh2djA3ZGZYb0ZiT3c2K1lJ?=
 =?utf-8?B?TTU1UnVUZGhUOTBkOU1zVzFBdW1xVmltV0U2T3ZjckRVbVZqN2VOZURWUk1s?=
 =?utf-8?B?YUJxV0YvbUFnOURwMTRnQ3VNQjFMczZJSEtXK2N3R3Bsd1BVSUorNTVGdTJv?=
 =?utf-8?B?elJ5R1FPUTNCNjdFK0hnekh1MURtSDRYdVpzT0dBOGxjZWREL1FKY09qWHJa?=
 =?utf-8?B?WXFLMUFBdWFsbytpLzc4NmlReFlYMFhVeGNsaWE5VC9XRlZYVjR5dmlFM0tW?=
 =?utf-8?B?OXg0dDhya1M2M3FYSGpSaDRrbHk0U3dtbS9WU2JSc1lkTWtlaHcrUVhpNm1R?=
 =?utf-8?B?L3djTTBnUTAwWnhPd1ZqQjBGQ0pMVHVqakhoRHFERjVXdVFoZit3NGk1NHBk?=
 =?utf-8?B?SlBrbytxdzlSVkxSRmoxTDNxWUEyY2F0M3FYUk5PV01JR1BiYUVkS2lXc1pR?=
 =?utf-8?B?LytKcE8wbU9GRUdSYWhpUzB5TkVkZGFrZlpEdG5meXIza2ZSeFBZWUV5UFJC?=
 =?utf-8?B?bE91MXhVMGlBajFocEp4OHFKMjQrOFk3eEFUTFRMMFdla2ZxTmw2aEV4RTJl?=
 =?utf-8?B?WStyUEprTUJUc0UxMmMvM1JuMHZWUklkaTJTTmdTQkRpNG9raXovYkY4a0ZP?=
 =?utf-8?B?OTFOZXBGb3YyQXI3cGtwL24xVHl2RzRwZW5odWhVTnZSNDBWMWRYT0VUMHEw?=
 =?utf-8?B?Vmw0clRYZzB3S25rMjZlRUJjRzJZMHZPZWlUOEU5UEQvZkVPZVB3NTdhdVVa?=
 =?utf-8?B?UUlRUHhFV0VXQVVKSkpKS1pZUFBZTjlLdm83YjltV2FxaFlBMlNNV000MDIv?=
 =?utf-8?B?WUZZUDQ4WVBFaFpuSlh1aUx1UlMrdzdtRElJWHdVTSs4M2g3K2ZNeENmU2xr?=
 =?utf-8?B?Wld6K0ZuZ2VuaHpOSkxhV2ZsalRXS0hXZWd0SnYraTAwTzlnYldOMkVnbE1M?=
 =?utf-8?B?WThqaVhXZTdBb2ZUVHRTQVhKSzZVRUZSaENlU0xmbVdzTmpKME9yZTI0Qmxt?=
 =?utf-8?B?OTE0b0hmbXVHL2FKZkFiNkltS0M3YzV5YW5WbTErQnd5c1NxTGMvbjJyVW1s?=
 =?utf-8?B?Sm5KZ3BxeHdodGdlTk1tcjRaNkFYTE1taWptVUpKQjlOTFBnQUhaZ21WRmNh?=
 =?utf-8?Q?s6mwzOhYIM3mcwLg7OzLFgQYqokvP2Dml3?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWUzMm9yVmRzN3JlZEFCU2cvOHA4K3FVOVdMdVpySFBoTEJVVXBXWHBpbDBH?=
 =?utf-8?B?Z3d4K3BUTTJpWVMyN0pBRCtRb2JsRDduOEM2MExhaVRwbmJjRTRNREZVaTBv?=
 =?utf-8?B?L1BRY2pGL2ZtRmxXMjRNcUREVEpBVmlqaTdGUm9rNldrbnJRUkZGa25mOXBP?=
 =?utf-8?B?b2grZWRwNDczNUZ3bmVCQ3VGYzRaOXVKVWJ1MzZWVVNpREtQejdWZENxaHZo?=
 =?utf-8?B?RHlnaDI0cUxaVnplT1M0dXJJN285OXJQNEN1WGllczlKbmVoUklWdEZKeC9I?=
 =?utf-8?B?dmZXYmROMlZ6MWZKT0ZEbk5USi9LdjBNMUNlbXNIZkVFVGFUZ3N3eXJ2NVZE?=
 =?utf-8?B?YVBycnBNNTQvUDF3QndsTVJWTm01cmU5QjdVbHloNVQvbDBUOHh1Q0NUR2M3?=
 =?utf-8?B?ZWVuWndDUDA2NjZOUzJNczFzZkxINmw0b3pVWk8xY21LbU82UE5mYWlOK2Nj?=
 =?utf-8?B?SVRTQjZGdTUybnhGcXQyMVI1Mk9uUVRmTHpFQ01RMlV4QU04MWM2S2RRdzdi?=
 =?utf-8?B?UVZUZWN4c1FxdWRuWmhJQkFJNG9iUnl6NzVWc0JNSlRKcHNkQkwrWjlnWnho?=
 =?utf-8?B?UzJWSVhJMDBRSG5WY2k0b0ljdHM0TEMwWTl0K1p4ZnFVWW5xQW4rd095SEQy?=
 =?utf-8?B?NG5FblNEN1hrMzJJYVNVdVhjVW4xL2RRYVpnOERoTEFYSkJWOFd6Qlprajd3?=
 =?utf-8?B?Z1dVdEpiN2RleEVibS9oM1MxcE54VDRXT2FnYXJXMDQ4MXZaVXRYVHFZQkRL?=
 =?utf-8?B?TkptcGFVa0NmUk04WU1DM2N0d1dUT1ZTVGU1NDhEMCtTZ2VyN3dLRFZ4SGpj?=
 =?utf-8?B?c2xnK2hMOVFxQkxuaWpUN09zVTgvRmxZMG83ZS9ER1pPVnhEM3lkN0dnRUY1?=
 =?utf-8?B?QnZ1U3RnU0NPcEJ5dlNPQU5KU0lURWF4My9sRDRDWUlXd0hWQ0RnVUZHVS9E?=
 =?utf-8?B?Z3lTZFYxemlHVGhSM0laTlRSYSs4SC9UNTgrU2tyNW9QRVlBSnN0MHhzMDZM?=
 =?utf-8?B?MXlnQ1FDVytmTGd6Mm9wV0gxSEF3MmlpYzZrRGU4WlA5bGpwdHZiZEZUUWJS?=
 =?utf-8?B?d1VpSThIb1J0Y3RLSG5hcHQzaTBmcFFGZ1Uvc2Y5Q1hleWMyMk80REREYklw?=
 =?utf-8?B?QXR6VXVLNE1GUVhqUlR4OS9SMWFsaWFLSFhLbnNaZVBIT0UvSXgrVWo0eTVC?=
 =?utf-8?B?QlFYNHVNU3pqVGJ0dk5PelJVWGw0TkVadDhWRmQ3ZkRZdUoxTkdGQ1M5aXhj?=
 =?utf-8?B?bTJRSkxGcHQ2ZFM5N0VTdUtNZFc2Y1NSdkh0Y1FqMlE3SDdmNVcyMDhDdUZ5?=
 =?utf-8?B?WktCcHZ2VmZnY2c3VithaHdKZXJ0bGtoZndqTzBOS3UzSVNLY29Sbk9YUlBx?=
 =?utf-8?B?dGxHZ244YzFkeThXYS9ybEJHbkFYVnpMbFh3YnJKZjVtamV5TDdmRnB0R09x?=
 =?utf-8?B?WWtLc2tZUVhncmI1RExpeHRDejFaRmVRYU10S2ZSV0RUYkxVdXhIYmRlaGZk?=
 =?utf-8?B?NnpyeFhVUGE4WWZQNXlmZVpIYWlLOUNYVUs4VFlMOWtxK3Y5YVpENS9DTHR2?=
 =?utf-8?B?aDFZUEh1NkhtM0tRY1QwWTlSWUx6RW9NZDNlTDZnamNPTVdHZFVXMWtXek1D?=
 =?utf-8?B?d3hvWko4SHV5K2hCeENYb0p3d2NrTm5RbWNSVEhNZnVCRm1mbDB3K0lvODFk?=
 =?utf-8?B?MzE0UDFYVC9ITHhpNHl2QWZkTGdDSitlamFodE05RVhlYm9rdlBxM0ZVbGlU?=
 =?utf-8?B?MzU1NW1WVHZLYVczRmh6T0d1TEo4OTJ3a2pUN2pvSVJGRVBSSzBLRTNYN2lJ?=
 =?utf-8?B?ZkcyMTRSbFFTU0Y2Q2dNYmZNVzdpaklubTNBdm1TL3JCZUlSNFYzbndQeHNK?=
 =?utf-8?B?NHYvMlRrYmVuMFBpcHlKak9JbGN0SEo4MXBQZGhOKzQrUmc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 904665de-6308-41ec-251a-08df0cd4bf39
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 11:39:59.4686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9412

On 9/7/26 15:08, Manivannan Sadhasivam wrote:
> On Tue, Aug 25, 2026 at 04:37:19PM +0400, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> Describe the USB3 PHY found in the IPQ5018 SoC so add the compatible
>> string for it as well as the required resources (clocks and resets).
>>
>> The PCIe and USB physical pads are muxed and selection is done via a
>> control register in TCSR. By default, PCIe mode is selected, hence make
>> the property for USB mux selection required.
>>
>> In addition, the PHY requires a 5V supply for USB3 mode operation.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>>  .../phy/qcom,ipq5332-uniphy-pcie-usb3-phy.yaml     | 24 ++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-usb3-phy.yaml
>> index 0d9d0fb405b6..1cd5392a1a0f 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-usb3-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-usb3-phy.yaml
>> @@ -18,6 +18,7 @@ properties:
>>    compatible:
>>      enum:
>>        - qcom,ipq5018-uniphy-pcie-phy
>> +      - qcom,ipq5018-uniphy-usb3-phy
>>        - qcom,ipq5332-uniphy-pcie-phy
>>  
>>    reg:
>> @@ -93,6 +94,29 @@ allOf:
>>        required:
>>          - num-lanes
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,ipq5018-uniphy-usb3-phy
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: usb3 pipe clock
>> +            - description: usb3 cfg ahb clock
>> +        resets:
>> +          items:
>> +            - description: usb3 phy reset
>> +        "#clock-cells":
>> +          const: 0
>> +        "#phy-cells":
>> +          const: 0
> 
> clock-cells and phy-cells are already part of the top level 'required'
> constraint.

fixed in v4, thanks!

> 
> - Mani
> 
George

