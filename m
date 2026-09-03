Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazolkn19011057.outbound.protection.outlook.com [52.103.14.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687D0370D57;
	Thu,  3 Sep 2026 04:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.14.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411473; cv=fail; b=KNdtQFliq0rO+/c99QW85hg51d7iz9x7dcW4CXlFbKjioyqbUjwLvQrPDJp1IyllXkd89U0KR14bdx27xKX7VrUTHn8DbcOm309TII+IDJRqqNdrk7aTAM3zPDYkTyBD7gru3TuYgRwP3LfnOtHMoyiJhhArBwJqk9ftWn0hSvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411473; c=relaxed/simple;
	bh=Ui99WLCjdTu34WlG/Dl5Jehq4XnjJGBJp0hhmrAu/bg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LAWG00dWqTFoRVvFIwoXED6Iu23vDfjX/2cSDwLsIkJ+2dH6dbUUWzIkRMviIHGFwBFAH/va7hD8cB1BsX4V7pauHgRml5wUG6oidzRar+4vYWFk+MgVkfioNnf6TR2xlcpmTDD4ggNXjfjH+VA0UNzbRFmaXd2pUFGWElsTWjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=UY5apfU6; arc=fail smtp.client-ip=52.103.14.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="UY5apfU6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=By/UwR+/gazlKYdThQnp3IsajPDqfHzJaJJOSNDUPrgLVyQyxz0ZKViKQ5EP0ohMBmfQVvhDKLN92mgtFH9/zogFgGTf8ZGzFdOHymFQ/PisA426mmFlvzJG0FJcusnFHIn/GfSU3kGcAUePFCZqUttWjWS/PVplFwO6N1GpoMGDyU1/3DpQu1bNcO67N+0NP5KdbbzXY1IN3z3+T/8WPcQOid6a88uzokKAHiwz+pKQsaurIRCV8SL/ile7L9CBRIu1HnNJrRaq6tbjxVHEaSD822TPJglP269hWPlWxMn+2ZkGhow47VH++Cxf7eVPzGmisH+hmr14I6xTgiEySw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4i8CRClmUNHBKkhA6s0w5wC9cVWEpbZLKAD67GIS4Q=;
 b=WXbXF2oNCmll2si2WunCGc8CBD+/eK0CWVfoyjJVrIIR7xPJKRLT/TmsZzh6YTJvMByY428FkKxpy5K1su/uvVTV/tCxAOg94aPVCrhVFU3QumEmqe62zlRPHdfPvbvKLfKKIkTCEoTM1TfbWMtXS+e7S7ngysT1+gcHBr+aKnGpNT8uYwyX4yMtuebjJqNIoxvd340/6/k5OyD4pjlb8PhgwWJkKQHScFTCMDdOz5I0oRhYUsflATbBKM5ceJLfLb1iInSy+R450OjNIGw815+I783yuttHpKtH6gYv/6LU7EFipLU41JAF/HsmSi19PGnFeqJLdhlGt5wUxzW9Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4i8CRClmUNHBKkhA6s0w5wC9cVWEpbZLKAD67GIS4Q=;
 b=UY5apfU6usZArBPiGeLPR1B5v5C9P/f5btONcu/14B3WdMUYcQPygF3n2on0+WTi7zf5KipTLh6vJMYhxw8vcgmxZxtmdMNS4+f6XW6ZzWyIIxtjJOkt21xfqMXPFeBhF46/wH1Y1yAwHS0xMn+ILrzHXQRZXROwYfTMNdTrjj7NNZwDfHGWbFJtR/Ygbiz/i2EsapN26/VAJZo6C79yQboT2h6u7gTJeAPrk5b7aJ5ruIOJzElS/HvyG3a9b/IVgWVtNHbkEGaa/aXWPm2G4Zj2P+09QgyW7GzUUFFJHX8RarJaBN8OLMfndcCi+jVLchmGbyOJtKiGC6hpDXUFiQ==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by CO1PR19MB5048.namprd19.prod.outlook.com (2603:10b6:303:f2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 04:57:47 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 04:57:47 +0000
Message-ID:
 <SN7PR19MB6736784249D636E0C2DE066A9DB62@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Thu, 3 Sep 2026 08:57:39 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] usb: dwc3: core: Allow glue layer to pass reference
 clock
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
 <20260825-ipq-flatten-usb-v1-2-5c1f3170bbe9@outlook.com>
 <20260830-fragrant-jolly-snail-eadb92@quoll>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20260830-fragrant-jolly-snail-eadb92@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0014.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:26::19) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <9df220c0-e25b-467a-b4d3-d3a8d8874bfb@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|CO1PR19MB5048:EE_
X-MS-Office365-Filtering-Correlation-Id: 861684bf-7f22-4ef3-be20-08df0977e58a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|19110799012|6090799003|5072599009|15080799012|8060799015|23021999003|37011999003|24021099003|51005399006|440099028|3412199025|19061999003|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dm5SM3ZBSkhESVdyZTVNNzhwajhQanNMSTVWcUkzMGs4bjR5WjRzUFpPM2da?=
 =?utf-8?B?Z0dFWXljbHN6L2dNbXE0RTdPZng5cWVJc2lqQlhLYWFhSHdVMXNjYklxVVVT?=
 =?utf-8?B?Rmd1WWt1MnljQ0o1MnhURHNMNktSWXFiVXFiUSs3V2w3Wm5nNTh3WjVqVU1R?=
 =?utf-8?B?QzlWWWlQMTh4c2xVU2hIVVI4amRhZE50VFhmNmdlVkhHWTNjMXg0MVJQY1o3?=
 =?utf-8?B?eTQzQmttMWpoc0hFS3hLSmhIcjg2QUs3cTZZa2xZd2pYZUpyOXBOMkwyV1Ra?=
 =?utf-8?B?R1BDNXBTQnBZYVUyUlB0RkZ4MmtPRGQ2NzdsbzRzbnhmbWhGbmMvZkd0ZjBa?=
 =?utf-8?B?aGVVMzE5UmhjN2NUSWVMYkdDa1hJbGZibC8ySXNiVXVZWVJkWHhTTVJvYmhE?=
 =?utf-8?B?S0l6WVFheW5POWRzS3VOQThrSE1uSmI1aDRsRnY0Z2c1NWwvTjdYM2cycXla?=
 =?utf-8?B?bHo3Zkcyc1VDVTF2b0VxTGxjWWY3NzdMc0IvMmJkV2x2TUs1ZlUxSlpWNjN4?=
 =?utf-8?B?cmoyRVVFSjlSTHFDQ1V0ZWI2dzZodWoyYUNKMS82MlF3cVdRa1cxZjVtZ3Q1?=
 =?utf-8?B?MUlZMnJFN0JoNnAzb3U0OFFXZjNQVzRTRW5aakdFQzd4QnVyWmtYWUJ2blgz?=
 =?utf-8?B?a0I2T2I3M3lzakNxNGJiRkhuRElDWkhoaDZQTVRjSzlJMyt6MjFGbTd4aTdR?=
 =?utf-8?B?SFBjaThHUjFHazYrRTdDTU4vL2VRb0pYbnllVjZqb3RiQ3FjK2FrODZGSFFx?=
 =?utf-8?B?Ykd6Zk03eGJPRUpOSWRpMU1Ib1hML0k1MTNQemRoYVNKMGk5T3hpdDErajdw?=
 =?utf-8?B?WVlXdTZuMU9JdzNuMXhjOUpXZkZCNFNjZ3VRNGRtcHR6NEVPa1drUlBiTGw3?=
 =?utf-8?B?VWE1c2JsZFpPVURhZDQybFJocGtWMGQxcnJXSlhHQk80V25ZaSttbFQrTjFU?=
 =?utf-8?B?WFBlM2hTRzA5YUhvZFA4bWxoYTFzd0NFbjNEajhLUTVaTGViSG9tTzBBSG9M?=
 =?utf-8?B?OE1iL2h1cVk4S2dtNFJwM2tERkZFekhzbDB6MTZ1SWN2VlZXa3JTbUphZkxO?=
 =?utf-8?B?RE5VRy9MV3JSV0kvK045V1ZNLzZuY3NZTWE4QmY4cEw4ODBIZGUyckdydEF4?=
 =?utf-8?B?MkkrL29waEVhTVlOcXNZSzkxdkMvdUVLMnpkRG5yM21tSkphV1hIYnpTNCtq?=
 =?utf-8?B?eE12azg1ZUJvWkx3Y1Vjcm5JcHRKOEdkN1A3TjR1MGttM2FPY1dFNFdUbnpS?=
 =?utf-8?B?UDdIMGZuTkkvMFprbDJtVk14QVdmRkVFeVJQNjVrYUdHMW1HRlR3STNYQmwr?=
 =?utf-8?B?aVhVUmQ3ZkxRMVN3S0RaMGxQcWxTV01jLzQvRGR6Y0VpRmd2enNQWVRsemE2?=
 =?utf-8?Q?YrkueULyeC/eyxRrbkGKQ0B3QSYAtJGY=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0JBWnU2YkhyWUdCVVBOaDBNNy9CQjVMOXJGZFpxNEFCVm1kdUNMSzBKYWh5?=
 =?utf-8?B?c1BuaVNmUGNNeVAvRzBMOFpDWGdIMXRObmNvVkxqcm9RWUZFNkR6S0RJc3ox?=
 =?utf-8?B?WE9nZWtSODRIUDJmVk5KeVg4Z1BVMGdUQmJaZFZtTWR6ZXMzaFROeWNyN0Zo?=
 =?utf-8?B?ak9sMklNZmE1VFZkaVpZWnBTUnIxK09OK3J1NWNzelVHK3BUQ0x6b2JQZEIz?=
 =?utf-8?B?aUFsTlNRd0liQlE2M3NJQzZyQTl3UFdPUlppczh5Y3hHT2NjbCtHWmdTZ1Q5?=
 =?utf-8?B?M3ROQlMwVUR5THQ5ZUFuTS96bnZWVklhdlJEWXBuZm5PeDBDbGVXcEpxck1a?=
 =?utf-8?B?ZDVHT2JWdHVNNURaOWxzbWdLU2lBMUJaaFZjQVQ5dHBScW1wV3Q3SUpqenkv?=
 =?utf-8?B?bEpLcTlOdHBqaUxCam9VQjJkLzNMVGVRSVNQcDMxUzZ5TXFvWlNyQjZ0Ykt5?=
 =?utf-8?B?T0NlM2RhejJ2QVQySFVUWCt3b3hTTnVja2N5Uk5XVFp1ZnRFdTBvNkx6a21Z?=
 =?utf-8?B?Vk9iMTcxZDJvRnQ1cnIrNDhhRVJQMFpjUzd4eDVKSWptYkdEVTQxeXA5anFF?=
 =?utf-8?B?bzJLUzF1MTJTTFRzeWs5OFVZYmNkZ0ZxUUtScVNjTEpLNHV0Vm80T0gyaDFZ?=
 =?utf-8?B?WHFWZTdHeUthcEZvT0psTlE3TG5zckcza3JCdklVRXBtTjF2TTZBaGQrN3lF?=
 =?utf-8?B?MEdFOEVoTG9OMUFhTjVxSmtqQTRhRm1tVHFoL29FZU1LWGhuQlFOZVlCMDky?=
 =?utf-8?B?NHIyVDVxeWpQM0QyTURwL0JxZWltTzB2aTZZM1ROalVRYjVXamFQU0FLYjVs?=
 =?utf-8?B?bC82Q09IT2oyeU5aMnFNUTRkeTdGTGxRUFFGdTJoeFlZeW8rTDlpSEliZHJn?=
 =?utf-8?B?U2w4SkYwbk9XNzM5QjVqb0ZIZUZIMno1L2NlckJ6eGM0aEp1ZnJ4b3QxTGI5?=
 =?utf-8?B?UkUxUUlnbW5FY0ZRa3Jpc1paS3ZlVUo3dTV1R2hBT1dDQnhpa3pQREFnekNt?=
 =?utf-8?B?dldPTHhvZFRDZG1kMFRxWU9ZR2x3LzBpWml6dUlVN3o0T3NhNng0YW9yM2lq?=
 =?utf-8?B?Wm1jMWcxUjRZRjRudm02UFBlWjF6c0Y2allBaVJvUHdDdVcyQ2RMaHdqOEhL?=
 =?utf-8?B?dG11blIzRkZBTGhPOWtDaDBVdXJmUDZ0SExiQW9peU5SeHpncGhrZVBHRVl1?=
 =?utf-8?B?ZjV4bllJNDBSbEZLaWhyMHlKNHdKUllZTURzajNyT0ZYeCtnVVpBUFBYVmNj?=
 =?utf-8?B?OHl2c0JzTThBakNEWmNEUER6Ylo5blhFZ3h6U01NUi9EUlg2U1EzdXhzL0pm?=
 =?utf-8?B?cHJnQVZQRzczWC9XL3NrREE3SUs5cUNpb2w3VG9SclNDcWVJTTZ5TkFhM2dX?=
 =?utf-8?B?RjI1TmpUeEpJUi9GK3NHcEN3OWhySHpXUDcxS0hrSFVCOU5SNzB4MExHd0ZF?=
 =?utf-8?B?V1NPYy9mM1NzRnVMRW8yT0k5d1RiMnRYb05oT0lObHBMYXRMdUl4bGZVTFMy?=
 =?utf-8?B?NHREdkFLZXFiZ3RkTVJrL29zckVJMEkvWExrSUg4bkVJbzhDY3B1bUJYUUNl?=
 =?utf-8?B?b0x1QWRieDlDVklDRktUWU5aTElKOFRHNElZQVZBaEh0UEtDV1Z1dE5odkZF?=
 =?utf-8?B?TTZVNWxiekRMcjJpaHRob1ppUGZPdGQ5OGpDTGRLbkJGUUV1MnQ4d1FycnJw?=
 =?utf-8?B?UHF5cEVYKzdsK2pQN2MrbGFoTWV0RWp2cHNLaEtPbllVdWlaenF1Sll3a2kw?=
 =?utf-8?B?UnR1ektKV1dpbnZhd3ozY1RjbDBjNS90MUxJVjc1WHNSbXFndFc3b1pOc0Q1?=
 =?utf-8?B?U1Y1ZXBYSlltazhRMXd2QXYwMnBlUlg5U2dFenl5SlIxYStyd3g2TXF3NmdX?=
 =?utf-8?B?ME44NjMxVnZ4aXdXS2N0VGtXazN0Z29zUVNPTW4rSmZib0E9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 861684bf-7f22-4ef3-be20-08df0977e58a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 04:57:47.2226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5048

On 8/30/26 13:42, Krzysztof Kozlowski wrote:
> On Tue, Aug 25, 2026 at 02:42:27PM +0400, George Moussalem wrote:
>> Add ability to pass a reference clock from the glue layer to the DWC3
>> core driver. The core calculates the reference clock period and frame
>> length adjustment based on the reference clock rate.
>>
>> In the flattened snsp-dwc3 model, it is currently not possible to pass a
>> reference clock that differs from the default since:
>> commit 613a2e655d4d ("usb: dwc3: core: Expose core driver as library")
>>
>> The new glue layers (incl. Qualcomm's) set the ignore_clocks_and_resets
>> flag in dwc3_probe_data to true, which disables the core driver's clock
>> management, thus it also doesn't acquire the reference clock from the
>> devicetree needed in dwc3_ref_clk_period.
>>
>> There's an existing DT property 'snps,quirk-ref-clk-period-ns', but
> 
> Where? git grep gave me zero results.

Yeah, fixed in next version, should be: snps,ref-clock-period-ns

> 
> Best regards,
> Krzysztof
> 

