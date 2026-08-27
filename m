Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19013087.outbound.protection.outlook.com [52.103.7.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394994418F2;
	Thu, 27 Aug 2026 11:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.7.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787831396; cv=fail; b=st4Tq01mzRoHkb7VZWn3Wz89YQVgIhOU8LVTdk49Y5RGwNuEpVArC0XGrJ3wSH+0l3MAKq1LTvUsi6yPbwlajPi8exa0J5DIKUk0DspPqj86vH42c4aBdPDSDUwLtxOOpJkPnZzZFrRaLtMeyLvebXmqlWQA4J/7CcDGsV5e5Jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787831396; c=relaxed/simple;
	bh=HN03swSnUJXqAdSpw527FA03RNmeW/Qc19wuLFJtynY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UX6tayyl+ZHOFoxyXU+eXc+EHpN7ixN3f69Y18coAHl2syrI9nZJhNsIanolmFnzt5uf1Qrw8psKD8UtffC8dw0p8cZESXaiq0pdZ1B0OR50LdMAeOSYkKwHFKf6l3POe0ieoZ1/DuVeOv7Ve0bOT0mYGB4a39+YkNAzavS6N3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=VgPx+05q; arc=fail smtp.client-ip=52.103.7.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="VgPx+05q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0FlJF51Sk8mLySGDwn9OYMhjYZbm4buEDN6cUnpweDw7lK2LEmYP2ebOgwwEgFz0tUlcOkHrjm1dkhEof0yaOTtYuVx4IxR5TLfAoKD8PAj+7fnHEawVuoxFrYl7vRpyriO3gkERFVRN8o+si2wWDm22aSZsRfoYhp1St+qoKq2A5Zm6owSixTEu68j23LBjq3MOH27dGjwFakO87eY6na+QTWhmdKX7vwBDk08lti0yfQTcvnsvQvd0WKy7Y0CE0A90ZEtCTEaYr76iRFPhFHzodS5ms4kTwP9E9sNRo3EaVXsNCEoRYd673WdUK6pFRuH/zZlZ7/lHQT+gXq65Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skjt+6q5L4iI86RhjDGabcsNw4IyRKDVfoT0fPCc00k=;
 b=viaWarXjKgedI0JQ9gVKTiuDa+XMrtv+Gholcm1db/gCyoD+kDrESHJVXUyjBnIKU3sDYdSWDvKFxHoTGnfWc1BUW9rHobjJRqW2e494yIIln/vbVQVvRCn091jiz7/9EkjZLG5eAQu1aSw6CDSyXUMW8CeKQnOgi8STW1HS78vKbJr401Z7PDXdGNtl0y2u93/oLSREMdXE9x248SSygmv3SzgkFppHH4ashB7ZIwDxUZ7kGD4mDM0tKfUQW6QHFY3l6JmoBIoqMnRgDxkbDJjb8JxgspdueE/fSEHTK3dvKMaVwufBCVtHxH5FKbeLUzdd73pvCn34RbuWyMDqGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skjt+6q5L4iI86RhjDGabcsNw4IyRKDVfoT0fPCc00k=;
 b=VgPx+05q9xIOU/jjd0DbcnvrD7B1HnoLnnTtOEDu89ZvDUKB0e9BTOJtg3EWdPld2kQjQ9lb3LvmYE5J4JDOexIEqkTCeAdjIrBN/51GBsYOrXdYv3WrJ/6TAuofm1v/XQgjAiYU+NMvr2whjogTNdfiR7am2/huUvqK+CgK2ObPaPFBy3SZAPRWE/LIR1TyDcehGDcZmJfcBn7kwWJszatP9J1UeYbLTk6fU2PzMhwyQlAHj/1eo2/JT6fhUMh0aIUSZvk5rz+bT8VMoicr97hGr8EC5BNIfTvjfFt4M8ufFj2DpLppoC/jbwtgugHedDzFpFpnoJJcb3nws/SpVA==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by IA1PR19MB8938.namprd19.prod.outlook.com (2603:10b6:208:59a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Thu, 27 Aug
 2026 11:49:52 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0315.011; Thu, 27 Aug 2026
 11:49:52 +0000
Message-ID:
 <SN7PR19MB6736C99CF23C5C500DCA34059DAD2@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Thu, 27 Aug 2026 15:49:45 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] usb: dwc3: qcom: Add support for selecting UTMI as
 reference clock
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-3-5c1f3170bbe9@outlook.com>
 <apAinJ1TEFL8t3ub@hu-varada-blr.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <apAinJ1TEFL8t3ub@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0183.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:344::10) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <b343478b-a964-482d-bde1-bb36e313138b@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|IA1PR19MB8938:EE_
X-MS-Office365-Filtering-Correlation-Id: 16d2ee0d-74c5-44f0-e103-08df04314e07
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRqQIXID8NmILfYdjaqH0H+zAYRjiv0cHiZNNh7SgcHac9Vs8lTd3vvORMHGs6WU1YVXTt9DvqFb83eTAXTI1rl4ohn8Y/jLXn6FSv0I+3VydJAMEqIhSY45ITjFEp7sdy4mAQhrfxBUAZHX3CLmbU2hytAXf8MRYoFXPmohft176lEiy3mNezFOsxZTXa73iPW0Yioqgtw3CfeAe5v9WjLcfdWoBgCwrNu+nX6xob+dCiaeGOFXUiuLRCrVrrozkXC91lVPVFwKI19Ow/sM8TwN5hf2VqtBzfDZ20C37Hjddzb9h3VdGcEuUyNef5DXQwdSFpBbrEgheS3A1/BPJbQmWbLEHEXyAm069VJubnZEw1BPHStB8CbUI1epn7XwKDcefXHei/WQW1YeJ93aFLUafBxLg4eEBicqBdDVeGklhn6vS3JQh2Ec4DCI5cd2F956E8nc2udd1A8Q1uXcLTS1bZBG9o8+eBn1iWz3qliEGK6H1l6e5MxiIyvvJwCMJ+XIKF57uyh6iYvr1ZcSsWrX3yrmjtSDS5+n39j26HE4Ke2X7M3frmNiCZTwRp2m1AG0rlXkY/CzUkAWpMXdroUAc9bwtAYjjs9TvvA3q74V7JS3TNJNM/Ex/zS1Hlczwn/f2xGz+nWUtbjBJ7/JkhVzexKgURdZhGOe2DaIwkp7bLExw0BSv+w0yIl/BEAoGs8zlx/NuVX2oD61lPTzujCcMjJCsSTJLFYaZ+JpuMz6o=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|19110799012|51005399006|15080799012|23021999003|5072599009|37011999003|25010399006|24021099003|6090799003|40105399003|2607281247196008|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VExSNXhiZCsxOVNTdllGa1gxRFd1V0o0UmVMZ2x1Z1VHRklMNnNVY2Q2Sjdp?=
 =?utf-8?B?ZjlOcW9wcnJ0RC81OTNJd3JjcHJmZGpDM3dRdmVEMHhmNklLSUtqUHpUMmpu?=
 =?utf-8?B?T2xUWG1wb0hXdWhRbnRYWVdGaTB6MG13VlltTGhoM2ZHV2IvallFRWVhTXcx?=
 =?utf-8?B?Zi9HRjU3a1kxL2RMN0MvVHpIR1hRRzdZdy9HYzBBcER3RC9zaWY0d3ROZEFC?=
 =?utf-8?B?UFFQRXkySk0wUlpBTWRHUCt0U2lIS3F4MStsZ3g5dFpyRDU5d0IrVnFZVUFw?=
 =?utf-8?B?MVREeXBvS2hBbFc0UVFvVDZRRzBva1JrakplNW1oemFlNmgvWUFiYmcrY3Nv?=
 =?utf-8?B?U3NKbGUwZGdET0Ztb1QxbWl4dkFiaGlrSmFzd0xFVmUyWXA2WjFxQWZWeDBY?=
 =?utf-8?B?Qzc5bFF6azRNczJ2SHNHRDVyYkZ4SnA0Q0hKRHdVUUo0ZEhZSlh2RkF2aytz?=
 =?utf-8?B?cGxlQ2NiU3V3UGJSUis2M2lRNGhTNFRSQUt1WFJNUzhCZlFWc0llYS8yNG15?=
 =?utf-8?B?TGV0QjJpT3ZoR3dyVSszeTJOMEtFdzJ4R3JpN2pRK2VuSEZVNm1jdS8zdi9j?=
 =?utf-8?B?M29xRnNaZG5EckxxelJzYnhBUldaeGNMTGkvRHM1RTMyTlRHVVFDUlJrOHBY?=
 =?utf-8?B?WTU1L1d3bEJ5YmU2VmV3UnhqNDNNOTkxQkVPVXJCM1FJTFRsL3RwNjJudG5M?=
 =?utf-8?B?Q0pZTHJyT1dyM3Y5S2I5c2xheGJRQ2VNNVAzRHp6dGxVL0Z3aHpsc3VkWFhO?=
 =?utf-8?B?b1hLNWc5TFdsSWQvOW9ydHFjNTBOMVliYzM4aTFkYTVhT1A0NmNLY2xSNndO?=
 =?utf-8?B?VkpsY2NzdHJQeC9oblc0V2xXMU44Rjd3WXRkRUliVnFlcGlMMzJyWGprOStB?=
 =?utf-8?B?cUV2NTRKMkJYbG00cll6ZktyYWdGL1RHRlJQQ0ttTS9KNGVpdzg1OW84Y2VH?=
 =?utf-8?B?aWQxKzVuTGxpb0d4Qnd3aU0zMzN6b2xPQ2FNOWRZQnR4clg4T3lOQWNJYmx1?=
 =?utf-8?B?TWxNSnR5b2paaGIzSW1DM2FKdFhxQUwwaFFBZGQzdlBoMDFFc0RFTUo0QWdp?=
 =?utf-8?B?VWlmVGhIUlBFQy91ZDdOejdobFdURzNBa1hadHQ2VXBISUd1TkJHdkwrVGlE?=
 =?utf-8?B?TGZZYk5xNSs1MkNyZ1hjS1pLTXBLdTdPZnFVMTgrZmJjbGxMWTVPa21QV3Jn?=
 =?utf-8?B?a2FCcC9VK2h6L3ZOS3lDMFVOUTQ5d2xSNE9waFJQaVhKZ3hCdTJVOTE2UHIx?=
 =?utf-8?B?SWowM3pZdkxYUmhrb25Va2NrQXYwNVl1aWsyYVZpZE8rbWp0UmY2ekxVZUFY?=
 =?utf-8?Q?C+viQEd3m9x5uGfvaItikrx8ULVyxnaqlE?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjJmNisxcDBRbUJXWUJCWkEyNzVjR1E2K1FwL0oyNlptd1JqQW5wWXdNcnpL?=
 =?utf-8?B?VHN3R3YrdlpVejlWditNM3FHeFBkbWxTRnlDZXlJZlRIMkJjemhBN2lUaWcy?=
 =?utf-8?B?bVVyWS9JcEE5MFl6bEswNjZxcUhueXRMcTZPQ2xUYVNLUnRKRHRnNUQvVnlm?=
 =?utf-8?B?amw4QkNVemFWWUdsT1ZPMndqNXV0K00rVmVPblFKZ0MvZnRQdm1oY1JMZ0Zx?=
 =?utf-8?B?WEZxTlJrd3NKZVpBNkpoZ0MwdjljTG1WTGhvWjBoMXM1a2swU1AwRHlycERk?=
 =?utf-8?B?TDh1WCs0VFhTOXI5ajd5UHcrdVRsTy9pejZHZ1BxTU0zN1I4Mzd5RE1VSTBX?=
 =?utf-8?B?TyttV3hXTDBzdURSWkFtZFdTWWEwYTVDQzBUK0VwT2dZWmt5alIxK01YVlBp?=
 =?utf-8?B?U09CbW4zU0Q2eUN6NTg1MXIvRzE1UkdOd2ZNVmdoNDE0YUtqY2V6TnExenFP?=
 =?utf-8?B?ZDJhZmRsRml0aVBzODFYenFtb2t3VUZkMEFoWGxrZFVQdi9xNkZtMFRTZ283?=
 =?utf-8?B?Qjk5ZnV1VEFiUUozTGh0ZFVnLzQxeVlOR0xTUkQ2QjVseE9IZFhVMVF4aVJq?=
 =?utf-8?B?K3o0dVdFZW9xLzJwdnk4NjJoZGFBZGpXbzVwSCs1S2NDZTY3QmRScHRZb2lY?=
 =?utf-8?B?ODVITjFTaWh3bEE2RDc3YTdKQjFpMFhKbk9oVjkrOENhWXFhQ2s5bFAwdDR2?=
 =?utf-8?B?VFFtWk1EcHoxdnIwQmF2ZlUvNFUwWHVybGM5dmVhZTVxTnBXRUZabWxGd1Ax?=
 =?utf-8?B?a3VZVFlXUG9jNE5Fa3h6QzNhOG5OMjYyMWpsUXdwTXJWZ0ptTEZEeUJlUDVO?=
 =?utf-8?B?Ylk3cjNUL2tGd1BQeXVCZXJ2RUdMYlkyUzQrSk1CZ2xSZ2hFdFBSZkEyamsy?=
 =?utf-8?B?VUFzVit5K2NwZGdScnViQndaeVhNRWVyLzZIcEQ0VUZQR3lrdFN5WDEwU2o4?=
 =?utf-8?B?NklQUjhreUVodEg0b2ljRGlrN01nZCtETUxLNnlkRnBuMkY0aHVwNm81N29x?=
 =?utf-8?B?NmxkN2wyZnMzb3NOTFoyd2tnYXJaekJlSkxTM1poUW9jQ1pJTkpOSTV0UHV4?=
 =?utf-8?B?ZVUySWlPckk0SWZaT1A0YzNOOWRzbmpCeFBiRXZ3TmRtR2tweEE0R3VpOS82?=
 =?utf-8?B?bXFwb1A3OXpsVjlmUDh5bWpTOTNPOW8ySnl6R3c2c1J5QXRSY1VmcjIreFJQ?=
 =?utf-8?B?T05pZzIwQWtmTHR2eFdHRlFUTlVVMFhXdk1OUlBYL3pGNVdBV3ljc1hoYm8r?=
 =?utf-8?B?RGx3TlBmRDZ2NkMza0hhNnBRRTYyNkxkSGlyWnR1d3dyWXFpNDhqSWErdzRv?=
 =?utf-8?B?UDVVUllmdEVDVE9sOHZRbGhocFpIeXVudFZlc2hLaTV3QjVVK2tiUXYyRnd2?=
 =?utf-8?B?MTVseVRuZmtLVmY4NUdxWjFVb1JETU9wOFJWeGZ4N2MxSXhxV3IvcVZPejhR?=
 =?utf-8?B?eHMvSmwvQnhUTkhyTWcxa3EyaSsrMEdrUFpLbUgva3l5Z043THFwYWZtOW5H?=
 =?utf-8?B?MWY5Q3lCSjJzNmRhUHgzUm1qU1czL1FzMGQrNGFaYjd0MzduUXp2Ujk0NVRP?=
 =?utf-8?B?N1pCV0xsMEp5QWtvMDFUQzRyZTFFN0gwTFFPZ3JpOERGS0dsQ1U3VVpUL1RM?=
 =?utf-8?B?UkQ1WUJJZlpGKysxYUxOU1BCTkF1YVpRZEducXNDQVRaT3NmVmtIWVRQT3hl?=
 =?utf-8?B?VHRXZmpoRlpSbDZpbUV4bG5RNnVnckJSdVhpdDhUWWkxL2Y2Mm9lM1BjSjFi?=
 =?utf-8?B?U1RCMTdLZXBVRWoyR00vMDdzeUd0d2NtK2l2YlRzcDJmYVZlVVJJNDVCY1NX?=
 =?utf-8?B?YUNFOXNRUjZaTXFNYm1wU0oyWWR2Z0kyR3hCTWpzaEk3RU1ZZElrc09FNzhy?=
 =?utf-8?B?aUpLVkgweGY3clBpemRYdGU0ZmY5dnkxWEVPd1JJQ01NQUE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d2ee0d-74c5-44f0-e103-08df04314e07
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 11:49:52.5387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB8938

On 8/27/26 15:42, Varadarajan Narayanan wrote:
> [...]
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index ac68b4218b56..17292517c594 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -617,6 +617,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>  	int			ret;
>>  	bool			ignore_pipe_clk;
>>  	bool			wakeup_source;
>> +	bool			select_utmi_as_ref_clk;
>> +	struct clk		*ref_clk;
> 
> Any reason why glue layer can't send the ref_clk_rate directly?

no, I've tested both. The only reason I passed the clock itself was that
it leaves it open to the core and all glue layers to implement their
requirements (if needed). Happy to switch to ref_clk_rate. I need to
send a revision anyways to change devm_clk_get_optional to devm_clk_get.

> 
> -Varada
> 
>>  	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
>>  	if (!qcom)
>> @@ -698,6 +700,18 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>  			qcom->current_role = USB_ROLE_DEVICE;
>>  	}
>>
>> +	select_utmi_as_ref_clk = device_property_read_bool(dev,
>> +					"qcom,select-utmi-as-ref-clk");
>> +	if (select_utmi_as_ref_clk) {
>> +		ref_clk = devm_clk_get_optional(dev, "mock_utmi");
>> +		if (IS_ERR(ref_clk)) {
>> +			ret = PTR_ERR(ref_clk);
>> +			dev_warn(dev, "failed to get ref clock: %d\n", ret);
>> +		} else {
>> +			probe_data.ref_clk = ref_clk;
>> +		}
>> +	}
>> +
>>  	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
>>
>>  	qcom->dwc.dev = dev;
>>
>> --
>> 2.53.0
>>
>>

