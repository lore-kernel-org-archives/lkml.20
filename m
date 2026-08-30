Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19012013.outbound.protection.outlook.com [52.103.23.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA005223323;
	Sun, 30 Aug 2026 03:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.23.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788059690; cv=fail; b=bcqOs/WTRC5nD2Mmm+4UBLpNlf1G5ZH1VnZZJtPUCsFf/JRaS1Bb5fK7aG/2fQWqabRC0a9b3DTAHqaZWXL6SVuZ2/I18eVzIfLAxKTlWEnWkS/UVckMzDNpfEmKTUO4biMz9z/PctBMtwmcMoKv2lsDRSiV7WyXst4kKP6LBBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788059690; c=relaxed/simple;
	bh=EEIxtpV8o/87f8/F/6XJ+6TJsuM0EIjiV0Zip6RG9ZY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SSF/TDOaiIXEXiMaC3BsL0Zk+AyKn1eX73uB1C4WS175aHX1DOs5hmUdSYKEGg/Y8YNPZCabsf43Q/vtjEyifE6XyEGCx8G98lBsAlmQ0YjVKExZ5k/OdmW3ur2/k+hURBAXP4MhcWaOnZQSCnp6kyJyQD0Nw0tSiFQDtU40d9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ORPn2yEN; arc=fail smtp.client-ip=52.103.23.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ORPn2yEN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nl+NPgVB8HMLfqBcC0zPxWVAKUXIefsSFxTUv6wqvldWhdYFxPwJ98sQVfon/fk5oefgMVoJTExOxQvQkc70ddoYxcrbZV67kFapbv5v+zUfB8wRGEK+/1n2nZD3GdTsX6jyX2B5br2ZT4GBr4Uxzdw7UavhALT/WcE/FBSdAP5RfvtNEsmfRZ1boWZWljLEA9lEFjkzVprxexYka7VZYXD6QtC3bg5PXXiWCRShK4M2RBB9o0Hmcn+aw1O/dg7QVHx/NCHeSJ1tVUB8ioQMv2+PzVysqpymduxYhSBTCsX0Gf6rG0GQyGxxjG/rfpJF9GDre9nlOtsaPjx4ehzz/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXoRRzxU9FjDPywfzRF+2OLgh11BKByhaU4HmA6B0E0=;
 b=zP8yFOuzN6TF41riwGjazORpIZjKtt3SrBo4CCklP54ULmFxosAJ1HZzic29/c516+Dov70UcRHwO3fq+uDBR2GehIOYikmRFzjgu9cYSuAKuAs56zu+KbWtK0yLgCnnSjbVf7rnk7c8htoaNsm9Wn3qwj+OQXidFjkcFW/yhXdNqXxWRuFdA2Gx3m69RusF/CeQm8nc+7EjXMgD25GZPhZLqJ3ZMEP7K5XpGqUf8dCbjcsG07vg3T4hY3EEx1LahzhnFJETihzRiaHCVAKRlrnkvx1WWnur3AeYcsyPKW68QEBV8X2bW5zZLhNS/7Nd+vDQVxuQXFgNLsBRcXPRtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXoRRzxU9FjDPywfzRF+2OLgh11BKByhaU4HmA6B0E0=;
 b=ORPn2yENd5OttCLJG1JHwyYKrrhvvmvlF1VYL24f1aEliaCVz8aJI/kVlOuXAAno2ATDiYHnjwL+FUyWdrzKwsJoKZUwQaBMM6HynjnMpLPgB7TbITRfSfBA0RcdboZReHxPtsSEuzffaVqe7LYn/oLzmuwmGOOiNEDAQz4XpLzarlHbxMaXpztvlS75shPc/XQXbuzb6oI4WFzVqNHj5N7tn57mpa0IkrIHTg1bt28fOGiPSzQiojN6yoEvorVN2b6rIWvojsp8fWUHWW5tAMAq3jLYGLLTL/3eQX9CASASCP1IoK2gjXoXGenhvN4+tW5Ym09wCFuv+G81tSZiSQ==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by BL1PPFCAA20E3D1.namprd19.prod.outlook.com (2603:10b6:20f:fc04::ed2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sun, 30 Aug
 2026 03:14:46 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 03:14:45 +0000
Message-ID:
 <SN7PR19MB6736AC1ED5E72A3C92AF7F319DAA2@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Sun, 30 Aug 2026 07:14:36 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: qcom: ipq8074: Flatten usb controller
 nodes
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-8-5c1f3170bbe9@outlook.com>
 <7d7c5d8f-a5e3-450e-95c8-c6b4e8ae8cf6@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <7d7c5d8f-a5e3-450e-95c8-c6b4e8ae8cf6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DX0P273CA0007.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:26::15) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <8dfe718e-5fb4-4020-8f77-769a361721be@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|BL1PPFCAA20E3D1:EE_
X-MS-Office365-Filtering-Correlation-Id: 0126ab93-9760-4114-5719-08df0644d75c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|51005399006|15080799012|24021099003|41001999006|6090799003|23021999003|8060799015|19110799012|37011999003|25010399006|40105399003|2607281247196008|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VjB5MzdudEl0S01ZK2dPeWF3OENCSnVPc1JGaFlDWWhZaTFoeTZDT0ZONWJQ?=
 =?utf-8?B?MXl2NzMyc2U0ZUMzUElGUVp0eGhHTnE3WTlBTi9zdit2Mm56RytEbzJwNTha?=
 =?utf-8?B?LzdFMjJWOW5uUXVLOXlOYnY1cWVNSkFLZnZqLzZXZVdadW9iT2F3MzJWWUVn?=
 =?utf-8?B?QzgwUDdHUFJ6VzRpVGd1c3BlaDh5UGJwbWhjMzg3cDVvdkNLMUd1ZHVzYnlZ?=
 =?utf-8?B?YkVjbHpDMUU2a0Y2YzMzd21LYm1aVk9ySk5ySUU2cnJQeVpXNXVrbnNvLzVO?=
 =?utf-8?B?dlY3VzVsT1NoblpwSzdtaFMrQXpwelU2b2x0YnJqS2hidVJpbFRmd29qNkFW?=
 =?utf-8?B?bTVFZWZoYlRUR1dqZGlWVFlXWUJoWngyRWtuVmZDSnNEM0FwMWFHTE5ZTDBD?=
 =?utf-8?B?WG01Tkd1RVRod2pudjZQc3JRelpQZU1uY0dSMTBkZ2RTMW85UHREVXNUemxr?=
 =?utf-8?B?ZEl5bXd5NTdTSTJQUzNwNGg0R09HKy9NeXVyWHgrZjBmNjlwUWZidzBqTTcw?=
 =?utf-8?B?cmRzcytXbU5BUWs4R1FrUHZSK2N5OVgzQUFIamszRklXbDYrRVF3R3RCaDZ0?=
 =?utf-8?B?dHNCaFhsVUQ4Z282NWVnSFNTMFJQcEM2b1hRNDVsczdwaTlLYU1IL0plemY0?=
 =?utf-8?B?MVRndDNvbVpReENiQVE0QVlYVVRHMGRVWnVoZzFLVm1VVzdNOEFlelhzcmk3?=
 =?utf-8?B?MEJnZTA0b3BzWXpKTm5XTEhxZitacWEyQ29HN0NrYXdpellWL2hhb01hUGhJ?=
 =?utf-8?B?K2VZbkhKVElwUGpPem9tVUorU3JiKytWSkhJdHNCRnVrM0dFY2VWdVBEZGcy?=
 =?utf-8?B?RThVMzNXbFVUNEJ2WE5KRmY4c1FSUUUyQjhQV3ZIRnNZa0JnMXNDWnZhQmpi?=
 =?utf-8?B?dU9RbTdjQlFKaG0yRUtIY0J1WFJHVnkzeGpGa0FRcVFYTTJQMk1IWnN2aE0z?=
 =?utf-8?B?WVE0anlIUVAwek4xMWVPSU90UFFoUmw4RTNFY1N1VG0wVkRLcE5CeDdkRkdv?=
 =?utf-8?B?bUdTSnRyUUF4clkvcmQrd2dKM0hSUi9rVDU4Y3Vock9NV2ptZjNvMTYyYmpE?=
 =?utf-8?B?Y3psNjI0NDQydkxJOWd1RVNuT0JmYmZCTXpKcHB3VVZMVWY5Sk5na0dHSkJ1?=
 =?utf-8?B?WEc0d01rZUZuaVdpVXlmU092QlpCc2VKVThXVWFQTkVjSWtwL0p4d3MreTR6?=
 =?utf-8?B?S3lxbnlqa0xNL3ZlMEpJV2E0dVQ3cjd3TlhOLzVLNHJIbGRjOEVUNFpxVnNa?=
 =?utf-8?B?T3hiTEV0aTQwODNoRkQxeU9tYmE2WjdOQXRiNkZJYVN1emkwVnExS3kxSkdC?=
 =?utf-8?B?WE5PUVUwV1plN3FpNHZxU3pDS2JPQ0pNVEJNZDhQbzBBS3RQYm9TNDJNN0RP?=
 =?utf-8?B?elVaQzRzR3hpNGc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVNkZCtjZWxoaGhYVG9BbXQ2Sk5LSVZXYlJxZElyaHNUc0xyK2xyVzlvSzJl?=
 =?utf-8?B?cGVwOU9JQjlkOWoreFpHWDdsMGs5bGhMbG01c3diaHZrcUpVREhkUWk5T2lp?=
 =?utf-8?B?SjdLQStmY2dJTGt1SDd5TlZieHdxVSsxODV2TTNZUGlsZStweWpLV24yNURV?=
 =?utf-8?B?UUVlQVJ1RWVqUzNNbndPb1pTZDBKMHkrZHkvblpWZUo5MVo0SFdxS0NuWWJj?=
 =?utf-8?B?UTFMUStUQlpPd3FSUVlDSXltcmt1c0N2WWxjVkEzcGFzYUNQK2wvSXdtVWxi?=
 =?utf-8?B?SjlNOXdVOTJWdng0SW9OcThXVjBwc0l2M2RWckd6ZWIvVlVhSEpET0JqZEE2?=
 =?utf-8?B?YXJkdktDMkd5K1hIcnA2ejZMWHpxUGx4OGhFUnRJYVkwWVl5YzcrMzExRUdw?=
 =?utf-8?B?TXRsbkpjZ3ZaU2JEUW5yWG04M1pqdUk3aDA2MHZhazBoUk1CKzFWc1hJUnJ3?=
 =?utf-8?B?RDRtVEc2aGhnV2hxemFKdDJyY0JWSThIemJxWE1YQ1IwM3hkLzVBS3BIYTFy?=
 =?utf-8?B?TC9VR3BPT1lHWVA5azBYaHZBNTdlWWtTRHlERDVKRWpCTnBJVkZtaWdoZ2pq?=
 =?utf-8?B?eXRzcEVUazd5eFRVOFdxSDQ5bDVZbnEyc2IyZlFyUHV4dDRCbjc3VHdMeGZk?=
 =?utf-8?B?dG5yMElpb2dwYXV4V0NpM3NIZjFGc0hHcFE0KytKT21ydjJtUi92Tjk5QnFP?=
 =?utf-8?B?ZndGZW5QUmQ5eEFFMy9mOUQ1cS90eXBzYXZSTmpXUEtNVm5wSXVZYXl0NlF4?=
 =?utf-8?B?OU5iUU1Uc0hrQkE3eGJ0amNKSDJYRWtwSWF5OVp0a0dhRGl5UjVsUVF2VlR5?=
 =?utf-8?B?WUlvd3B3ZkpLQ0l1ODZDQzVMQjlnSTBsZ25TdHJWd25NVzZQbFhtU0hNcXpR?=
 =?utf-8?B?MkVzK21ENmJMS2JGVlptc2NMNnFSdTNxS1dWckdqTm1lRVc4cGxNQXc4WVBH?=
 =?utf-8?B?eWJZYURYa3hzQjFyaU1HWllwYnF1ZlVreHV1cUtjL0hRclN4M3M4Vm1oK3NQ?=
 =?utf-8?B?ZklFdnZBaW1lWDNpZVlRRlA0bkdSczJSVEpraGNQTmpUVm0xYWZUbDdWZzZS?=
 =?utf-8?B?dmpiLzFSS3lLemFCQ08rckNLNkZTbzNhclpHWUlJODJ5NDdoOEd3dXBEQkcx?=
 =?utf-8?B?Q09kb0lUaTE1cWFPZFptTk51MzdCMStrMmNIeVUzLy9YY3AvL2VIdWNnVTBF?=
 =?utf-8?B?bmduSmRiV01Fckh5SEFsYVlBRXlSU0VWdmVuN2NkUTlsTy9XRjBWVTRvaGt3?=
 =?utf-8?B?MHU2bGcvQStFY1hkVFJCdTlUVVo4dzR2Vm5SbFpqOVFON3lacGgyKy8wTVdt?=
 =?utf-8?B?aXlvcE42eldXZmdLYldFOFQxZkRkNUlUK1UreG5JRUJuek1MTDU2SjJoN2xt?=
 =?utf-8?B?WjZFNGRDSm5TSm11VVhHaTJoeGdNUUhqeGNFUDJVZ3lSLzA0ait1UXJLa1B1?=
 =?utf-8?B?RlZ5UVljSk5jakErU3c1NUhsOEVTRU5adnBjRUZCQ0E3SzRaR3VnMkRDUTBw?=
 =?utf-8?B?Y1BsdFQyRUpjR0gyQ3lHZ1p1L1ZBRU90Y0VsclFndDVteVZ4b1Q4K09oTjkx?=
 =?utf-8?B?K2MyVkgwS2ZFOFFla0UrV2hrTTBwc1pqcVVseStpS3ZWSVpPMGppdDJjTWo2?=
 =?utf-8?B?VFBpckpxdDFWbWkwNWwwQTNVVHl0U0FyMDVuRVR0OUdGUnQwTk1KWEl2MkN2?=
 =?utf-8?B?VFVFS1ZRZUt6U0tKY3AyK3Y5RmFmU3lwcFQ0V2IyTnFqNGpQbVZxa094RE9x?=
 =?utf-8?B?MWtyNW1aUDR0aHBGOElSY1ZrdVBtR2I1Sk1GK1JOOGFON3hnYkZIbWErWFgx?=
 =?utf-8?B?OTZiZzBhZlVGSnFsWG5oUEVhbEhVeGpUUTRtODVsVGU4aW9rTlNyR1orMmVt?=
 =?utf-8?B?dm9veFZuMlgyTENUZ2s3c0xXYjYyRS8zbWFHQlZpQVFiV2c9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0126ab93-9760-4114-5719-08df0644d75c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 03:14:45.6229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPFCAA20E3D1

On 8/29/26 20:41, Krishna Kurapati wrote:
> 
> 
> On 8/25/2026 4:12 PM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> Flatten usb controller nodes and update to using latest bindings and
>> flattened driver approach.
>>
>> In addition, fix indentation of properties in both nodes.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq8074.dtsi | 112 +++++++++++++++
>> +------------------
>>   1 file changed, 52 insertions(+), 60 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/
>> dts/qcom/ipq8074.dtsi
>> index 75a5ae30d966..d4a86b3815f2 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> @@ -625,104 +625,96 @@ qpic_nand: nand-controller@79b0000 {
>>               status = "disabled";
>>           };
>>   -        usb_0: usb@8af8800 {
>> -            compatible = "qcom,ipq8074-dwc3", "qcom,dwc3";
>> -            reg = <0x08af8800 0x400>;
>> -            #address-cells = <1>;
>> -            #size-cells = <1>;
>> -            ranges;
>> +        usb_0: usb@8a00000 {
>> +            compatible = "qcom,ipq8074-dwc3", "qcom,snps-dwc3";
>> +            reg = <0x08a00000 0xfc100>;
>>                 clocks = <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
>> -                <&gcc GCC_USB0_MASTER_CLK>,
>> -                <&gcc GCC_USB0_SLEEP_CLK>,
>> -                <&gcc GCC_USB0_MOCK_UTMI_CLK>;
>> +                 <&gcc GCC_USB0_MASTER_CLK>,
>> +                 <&gcc GCC_USB0_SLEEP_CLK>,
>> +                 <&gcc GCC_USB0_MOCK_UTMI_CLK>;
>>               clock-names = "cfg_noc",
>> -                "core",
>> -                "sleep",
>> -                "mock_utmi";
>> +                      "core",
>> +                      "sleep",
>> +                      "mock_utmi";
>>                 assigned-clocks = <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
>>                         <&gcc GCC_USB0_MASTER_CLK>,
>>                         <&gcc GCC_USB0_MOCK_UTMI_CLK>;
>>               assigned-clock-rates = <133330000>,
>> -                        <133330000>,
>> -                        <19200000>;
>> +                           <133330000>,
>> +                           <19200000>;
>>   -            interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
>> +            interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
>>                        <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
>>                        <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
>> -            interrupt-names = "pwr_event",
>> +            interrupt-names = "dwc_usb3",
>> +                      "pwr_event",
>>                         "qusb2_phy",
>>                         "ss_phy_irq";
>>                 power-domains = <&gcc USB0_GDSC>;
>>   +            phys = <&qusb_phy_0>, <&ssphy_0>;
>> +            phy-names = "usb2-phy", "usb3-phy";
>> +
>> +            snps,parkmode-disable-ss-quirk;
>> +            snps,is-utmi-l1-suspend;
>> +            snps,hird-threshold = /bits/ 8 <0x0>;
>> +            snps,dis_u2_susphy_quirk;
>> +            snps,dis_u3_susphy_quirk;
>> +            dr_mode = "host";
>> +
> 
> I see this controller is DRD capable. Move this property to platform DTS
> if dr_mode is needed as host.

That should be part of a separate patch set IMO. The scope of this patch
is to flatten the node only. Removing it may break existing
implementations.

> 
>>               resets = <&gcc GCC_USB0_BCR>;
>> -            status = "disabled";
>>   
> 
> [...]
> 
>> +        usb_1: usb@8c00000 {
>> +            compatible = "qcom,ipq8074-dwc3", "qcom,snps-dwc3";
>> +            reg = <0x08c00000 0xfc100>;
>>                 clocks = <&gcc GCC_SYS_NOC_USB1_AXI_CLK>,
>> -                <&gcc GCC_USB1_MASTER_CLK>,
>> -                <&gcc GCC_USB1_SLEEP_CLK>,
>> -                <&gcc GCC_USB1_MOCK_UTMI_CLK>;
>> +                 <&gcc GCC_USB1_MASTER_CLK>,
>> +                 <&gcc GCC_USB1_SLEEP_CLK>,
>> +                 <&gcc GCC_USB1_MOCK_UTMI_CLK>;
>>               clock-names = "cfg_noc",
>> -                "core",
>> -                "sleep",
>> -                "mock_utmi";
>> +                      "core",
>> +                      "sleep",
>> +                      "mock_utmi";
>>                 assigned-clocks = <&gcc GCC_SYS_NOC_USB1_AXI_CLK>,
>>                         <&gcc GCC_USB1_MASTER_CLK>,
>>                         <&gcc GCC_USB1_MOCK_UTMI_CLK>;
>>               assigned-clock-rates = <133330000>,
>> -                        <133330000>,
>> -                        <19200000>;
>> +                           <133330000>,
>> +                           <19200000>;
>>   -            interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
>> +            interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
>>                        <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
>>                        <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
>> -            interrupt-names = "pwr_event",
>> +            interrupt-names = "dwc_usb3",
>> +                      "pwr_event",
>>                         "qusb2_phy",
>>                         "ss_phy_irq";
>>                 power-domains = <&gcc USB1_GDSC>;
>>   +            phys = <&qusb_phy_1>, <&ssphy_1>;
>> +            phy-names = "usb2-phy", "usb3-phy";
>> +
>> +            snps,parkmode-disable-ss-quirk;
>> +            snps,is-utmi-l1-suspend;
>> +            snps,hird-threshold = /bits/ 8 <0x0>;
>> +            snps,dis_u2_susphy_quirk;
>> +            snps,dis_u3_susphy_quirk;
>> +            dr_mode = "host";
>> +
> 
> Same comment as above.

See above.>
> Regards,
> Krishna,

Best regards,
George
