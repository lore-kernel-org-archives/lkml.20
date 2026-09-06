Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19012010.outbound.protection.outlook.com [52.103.23.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031753D6472;
	Sun,  6 Sep 2026 04:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.23.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788669064; cv=fail; b=Uf/SRYX8ltU94PUiMxgZhUnRfVpXGLbhrhgXmbkWWJ0Db2xPUS5fe6ZhBv7VC8ImwafOHq4SlKLqIRaOj3QXZVxcjn6tFEcp1RiZz8KslYI4cwwutTvJjxFcYMOwEIBxWYSA4nG/O4dJ63qPJkj248MbIOQNACM2LQ9ce1DW1e4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788669064; c=relaxed/simple;
	bh=bIedGHhM1zyW3Favw8tWStnk59AxPS9przvFlLXhJaQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=drMoN4Cvh5nzupekUlQrjYCBzfVl6LYYE8pPaiCGuF6UWLFrfcqNPLZKTFvIM+Nri5697rFgSY5Dm89Ac/4kqd8gCcy9beWhjq5pO8qy4QO8OyZBx/JBLuk06GYty/uCtzkWV2UlKM7+0Uk6MpzH/M1nmvrUVgnZOkwv0qxEUyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=QzTAyWUs; arc=fail smtp.client-ip=52.103.23.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="QzTAyWUs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ss3oawLYN1UVBock7sqq1pGw5epxorKSUMR+h6hKhk/+RIOsM64bOolbZSccsvE94BhySMczdIJ/bFmPStCkz41nsVba6FPB7QihCU6A5Kj3KcxzooBr2yx5SzyP0KcsU2DLMpEGMJf04a5tZOiSpf/A/a5//kx9ws2+XDXspL85MPhWbuvS9ST9nj489pqwJAC7snfD8x4708IEDAKTt1zjnaTH5W9biwDbdcTD1W4pZujB6o5clnMqz8cKLpW3a+/I35KsIzezS8QUX0UGDDDtq2BD+v6KqLsi/MisuugB5H2wZMZJoeXJPlgYepkN9qlzcB3W09MMp6FjMcbb8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IzGJqWzR2NEFOEb1nyj6kRgAr9ocf0tb0XxofgrUNTE=;
 b=r6UMVmMgCpoZNQtDBjXljz/prI12a+CktJnCdfg8yjAwoN05ssRCwXmQg7zDKQIZE0zAsY14VsrjXQJc0j50BW+yUqmcOFdSC1I32rj2xArU40m1Sna3P1vKh9oGhHYPu/VhBGvQwS6yvxz/u1jzSyMC/xBCOdFo6ddIz5yXAoIrZ6MzZOohlW+OiUbnZhSLBAtwDTQ4pD5ZmvdDgT4KR0p3zN0yhy6vmg36MxO//UJNmErJNgDLTaPW4xr/13OC+NzeXysBF+EPzUmEoz57D84YYfhdk2/GfVbx5hcsK6DfsYpbqLmktPhJH/+tEr1IwhhGQViXMBYINtYJzuw57A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IzGJqWzR2NEFOEb1nyj6kRgAr9ocf0tb0XxofgrUNTE=;
 b=QzTAyWUsIMJ8Sc6eSdwdp3ZFuEt2DEMHSmBiyuCDOFRTzrjePt1w2XF+n4Bi3dbCNqgwFsq8nN7boSQemYW5O8+pxTxPukyRApjco87iuzFUizZFk8XWN6/qDZ81r8Ypraxxb1rmv9dounjTqv3EU8tsiGUUf3O6MlqvUphblpYlJF0PnnrHB0sGem4NPIrXPTaB0nEqEQcYNejSMjr+Ep8znY4KEXDePWyRqZkWWiUGVBtZ8zjQn40lDTHOQxOloUL4P/2EOdVrXL2RASYY2xx+f9b78QZKbzvHxpOQtheqH9rBRZoP7Tq/JG0PdJpBQNgT2rn6FuHnZ6W6gUSauQ==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by PH0PR19MB5669.namprd19.prod.outlook.com (2603:10b6:510:14f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Sun, 6 Sep
 2026 04:31:00 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0382.014; Sun, 6 Sep 2026
 04:31:00 +0000
Message-ID:
 <SN7PR19MB6736622464CAA064428A3EEE9DB32@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Sun, 6 Sep 2026 08:30:51 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] Flatten USB Controller Nodes on IPQ SoCs
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260906-ipq-flatten-usb-v2-0-dab83120b10a@outlook.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20260906-ipq-flatten-usb-v2-0-dab83120b10a@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0010.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:26::16) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <0820669a-caea-4bf3-91be-b47a650e7896@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|PH0PR19MB5669:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fb65cdc-b436-42db-5b9c-08df0bcfa70b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|15080799012|23021999003|5072599009|6090799003|8022599003|37011999003|8060799015|19110799012|25010399006|2607281247196008|3071699003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWoyL2czZEFISzBPRzYwbGUwMW9lNnF0VGN1SDJON2FIcU9UVEJualRPRXNm?=
 =?utf-8?B?YkdrcXpmUUhTMmZVdmpWdklnRWVJdzJCSkh4bFdpWmlCUmVaSnZ5VHRhRDlk?=
 =?utf-8?B?Um9uQ1lFbm5YN05YOThHWnZ5bWxrUHQxaDhZb3ZJd1VTM3FQVTZrSHpYR1Uw?=
 =?utf-8?B?NHFZOVpsZ3h0MUFySkprRllDK2UwTCtERmN2ZW1XUXRxV0VQOFVldE9UZDBC?=
 =?utf-8?B?dlhOdjAxSEQxcERjbC9nbjkyNnNqdDRPbVBYSVVlK0VkYXIvZTA4QVVRN3RP?=
 =?utf-8?B?enphdjFDVXRDcm5FZXNQQUdyUlFQWXh0RUtoMXZOR1VrdlZ4alAvR1NQc3l0?=
 =?utf-8?B?YitCTWVqWHNkelhyZFl6bjZwV2g1Y0JKaE55TjV1QnRJZCtHOS9vN3BKN2Vy?=
 =?utf-8?B?RTJTc1J2Mk1BK3ZUbnBKR2JZNXIyd2FMVHFCQjFCZ1JiOE9VTGZBNmJIc3Fp?=
 =?utf-8?B?ZW44aWJDWENDc2lIQXBBa1dWa3BYMnFVeHoxNzNTZnFNUkpuWTNKZ1JkL0xX?=
 =?utf-8?B?TnZreWd3QkhmalR6em5VbXZCbkNwZktyWVpOZEV6a3RZVzNJRkRmbEVVYm5I?=
 =?utf-8?B?NVE5L1lHUzNsOG1nVDhocHdZOSt2dlZBMGpUb0JmWjRuazVnenZCYzlRbWhk?=
 =?utf-8?B?L3dQV3YzbC8rTUtRZHkzRjlFSG1YMHE1SVVSbm5FYUhWMkF2MkZVV1BBeHZ2?=
 =?utf-8?B?WkduQ3l4bGdac1BBMzZ2T2hpU0R4NUtMam1qbGdBcHhWemhjdktHWk9jQ3VH?=
 =?utf-8?B?STVMQXg5NG9rN1NNU3h3R01LcWg5VU1tVjRlY3Evc3BJUDMwdDQrRHZCaFZ1?=
 =?utf-8?B?clUrTDAxd1RxS3d0TDl1L09HNFFmdjlhZlVxNmVCbENqVHpoSi84TGpGZlpM?=
 =?utf-8?B?eFlrNGlCZkVQYnlOcVorSzF1U3RIaHpaaWZoSjVZcjJZT0RBQ1JTVkFNTkdR?=
 =?utf-8?B?N0pvbVdLVGRRcHJtUUt4b2NaUFVGNUtYdXRjL25UMGdrU2JBc3pZQ3hnTi9u?=
 =?utf-8?B?QUQwN0NVK0R3VGlnaEpYSHIrbG11Tk5meUhQUytrVE1UVlhRYTdKUGVuL2d1?=
 =?utf-8?B?TjcvTlN1alVJNGRicmc3OFgyZ0NWdW1jajRJa0JFb3RNUktZNDVKL05IZFFZ?=
 =?utf-8?B?aXgwdHJlLzY0eXM4bFdkZ2FmakxKOXNOM2F4ZnJodWwvazBOV0RNVWFFcERJ?=
 =?utf-8?B?ZUh1clpWRU5GZkYxMjlKVGUxU2hsZnlHNFhha004QkV1Vy9aU21pR2FIditT?=
 =?utf-8?B?WkQzY3BVQUVITlBhMGNrWG5XYU1iemZ6QVhGbk1sZFdjaTZjV2dZQU1PWFE1?=
 =?utf-8?Q?Hdz3jtvjP+4oY=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWswdDNuNktteDVOem9jNUN6V01SYUVUc2tzZ2NSeFhCRWVUTkFYVG5jWW5J?=
 =?utf-8?B?dFNrQ1p6SUU4VEN5TG5STjJ2ZjhuSzRQZ2w5L09SSzlwSGxFcFFCMi9IWlJL?=
 =?utf-8?B?cmFzMUR1QkZrc011K0xBTXZqOWsxV3BGNVk3Qnk4TmhTbEFPcDRuUjRnU3ov?=
 =?utf-8?B?QzhDS3hkc0pxN3VqKzYveVJRYXN2WFdNNSsyTTFBelpxU2RpTEhRN1U4Z1hI?=
 =?utf-8?B?ck1ORXhSWTVPaVB5MFBJenVNcnkzZjFlU3U3SW8zby9WZy9aZGxrYzhFUCtL?=
 =?utf-8?B?bHVaSERWb2RMSjNMb0hid2p6MjlwTVljQlN0bkVuOGhGYklIclZPN2NMRUVR?=
 =?utf-8?B?ekNib3ZJZHBHaEp1TTBUWSs3akxaejdKZ1dTRWlVYkp1SytVT0NXME9DbFdD?=
 =?utf-8?B?Z1dwOWIydzFsMGJOUVJmbmlFUmFQRlkrZDc2c3hTWkVSU2VNTHpKelZBOStI?=
 =?utf-8?B?dWV2NkxyUWpXaFFjUjc4b2JwSVFiNFJKRWQvL0Y0VUthSmVRNHhGWndYK2J4?=
 =?utf-8?B?Tm9vWjcydk9WaWdhcnJNeEVGZEhheXk1VG5JZzQ5MjFFbS9XY3QvK2h2bkJy?=
 =?utf-8?B?SDhXRUlma1VBMUU1UmxTMmozNTNCQWFxUGZuSFFwbm51elYyN0NHNktFbEhi?=
 =?utf-8?B?U2s1UEExdkR1WENNVmFUM21VeHRIeFZCbEJ2TTQ2cWp0OVJ3Z3pGUE9VbEYv?=
 =?utf-8?B?Znl3ZHpMMG1Lcmd2bU9ucjhhRXRPK2IzV3VoNVlkUHpyT2FvaXlUbE1aM2gr?=
 =?utf-8?B?TC9sYkg2MXoxeHo1N2N4aEU1K2JWVmY0NkpxYk9hWUo0cnlxTGx1K3VmZ3lu?=
 =?utf-8?B?VWhGWVNHVHloazhLcWk1ZVdwWDl5WTRobk5KR09May9mTERiVW00TlpkeDdX?=
 =?utf-8?B?SnVlbHM3Q1NCYUxwOXYzOENoTDk3S3FqRiszTU5YTlRVczNFSUJiRWtzamxj?=
 =?utf-8?B?MEQzZWkrUGZNMUZGRjNTT1g2MEQ0dUJodXkrd0pXWFRWSUQrekdNT29xQUQv?=
 =?utf-8?B?MEpqZXhtRm81ZTBoT3FFRGx4eWQ5RXUrU1JTU05EdVNEMzE0VGg3KzR4bHhN?=
 =?utf-8?B?TmVQQVdCaFFwb1JROC9sVWpueTZ4a0QvclNHSmNleFJsZlZvcm8weFhsaDRI?=
 =?utf-8?B?OUM4M2xZUzJyUWlXNzVnaTFZbWtBOWNyZHRPU296cUVMQUdLd1FZQmR4cHls?=
 =?utf-8?B?M3lFU0RITXR6NzMyTzh0eVhGVEFRaktFV1dtVWMrTFEzcDc5WXUvUGtnTEFl?=
 =?utf-8?B?NG41L1RheEtZb3pCRzFrZXBmdTUxbkxlNHdVSFlJdFYrdjFaMW95V3QwMGwv?=
 =?utf-8?B?OWJ1TUozUlR2SEpGQmgrRUdKeldCSHRoZkliMmxpdGVKS0h5WXJMOXVZM0lu?=
 =?utf-8?B?ejdLS3pZR05FMElDNzhGR2JSUXFzSHhOcjc0SFJvYkJRVVo4d29NYUsrdjN5?=
 =?utf-8?B?UkJHU05uY1hUQ1VxOWlNUFZ4YkRLZ1dkUEZpZjQzQUJyQi9hb3NFL0xlNFNC?=
 =?utf-8?B?THRZY2txSERaOFFDUDBycEdPOHBlcXk0ZTdnL2pBVVpaYkdBbCtlRzZYTjZy?=
 =?utf-8?B?WGQ5VEgzbXJvYVFrNkUxazJseFlya0xxSm55anFvalJYRVRFcGJjV213czln?=
 =?utf-8?B?ZGVwS1lUMHp3Rm16bXp3Smc0aDRYUUFLZHFRbTZhZlY5YkltZnlTUkpabEZh?=
 =?utf-8?B?SUsyM3BhL1hxR29oOHpKcHc0bkU4RlV1YmpzaHdLS3prcktkTGNxK3ZGYW1K?=
 =?utf-8?B?QUJMSDZNaXEwZXRkU1hrVE8vTnpyRmJOc0dNSkloandMb1NYdDUxZ2VRWmVa?=
 =?utf-8?B?ek9OSkJYNDFmdjdHbU5za1NwRW40SU1ZWUpGMXg0YVQ5ZzJocHcwYUFqRHA3?=
 =?utf-8?B?a0NRSUIwTS9MbkhaQ1o4V3pHMGljdTlSb2NtTHlTTHgvQ0E9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb65cdc-b436-42db-5b9c-08df0bcfa70b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 04:31:00.7877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5669

On 9/6/26 07:52, George Moussalem via B4 Relay wrote:
> Add ability to pass the UTMI clock rate to the DWC3 core to calculate
> the right values for the period and frame length adjustment. This is
> required for USB controllers on chipsets where the computed values for
> the period and frame length adjustment differ from hardware defaults
> based on the UTMI clock rate.
> 
[...]

Please do not review, I'll be sending v3 shortly. Apologies for the
confusion.

> ---
> base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
> change-id: 20260825-ipq-flatten-usb-c7d7f15f3966
> 
> Best regards,

George
