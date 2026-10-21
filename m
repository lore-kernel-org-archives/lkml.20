Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792566542;
	b=EkRkZRCFiX38xJbDoRmd8vkgjzqM+0LP3hMSpLuUHOubh9f0waih35eCo39fjiWKZCvj
	 NgrB1vGC2OultYsAVu+FSGtTO6S5tbZ9+alAcB2MB+zdVAph03WFE/MalHtIdg3TxMGUS
	 bInj8ztlCi5D5z4rtI7hfe3loqxkdwpdxdEBhx2Ifcob+cP+y/AaYltxRpgPKdpF7ZLEC
	 il4f0jkpvMnPmGMvTS+bLu3PrvpWs8ufw3sdeTDG/zwLjjex9zzZFfg3qA5vrm5blOm34
	 Vz3DHvK29sAvu0br3+8OLCjbE4dLNDGPPPGh/u9GaP2WDJMdDr2N+4l5kDLygIAjQAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792566542;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=WvefjNwL0DDMY81KSia7VX05cBSX+/APi7MhVHDBej0=;
	b=GS3KoTiO1US90xS2EIRR1VUQ3CKGySRflhjM5Q6nuFBjyJaK3w05m6OLdi54UXmDDAGP
	 hmKuA1dZ4ODcZZZDP7BYEfDiyo57sS+Co5m4hKWMyfnb8SvLeY0H1f9z+cUCkRrodO+iR
	 Db3307JrxODIvwookTbhAqzOdU3KB5VABD4F6lIsvRfl/NwK2hr6hooWJAiGtDcKO5TEV
	 TJdnNhoGtaSKEUhznhAs6s3Nm17PCXxpcKw03B0Vw00zKG5XNqePFBHZHLazIR8nYtgp7
	 u50mVjmQtNx9mJrCf6vMcFIqohJ2wXiVt0Go9CKZwO0LU2zVL10Ayf0/50mp9WCzFlw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2i64VF6l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.1
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011001.outbound.protection.outlook.com [40.93.194.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF37D606A319;
	Wed, 21 Oct 2026 07:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF37D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2i64VF6l
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMAIRzQc+obt6dGZuZWSiCB5ZvGs5p44jJPF60YKRRiuNQyXG3Iz/HzgEUAjEyBNutQZo6ILua/jeZ/nmpVVSYAI0TGYCopjgIvmsenjps6LdxmXyLYG7PVnJ8Mz31STSWFMZSDuz7JtRBG+hfuqi4UuOfbWZHLgVUFspqgloJ7pjrHWQmssd90bk39O+1rjwfvH6fjkKRs8ApKA6u5I+GQ2qgoOY4o1yuZhWcVful8OYxvfVqo4kW2mqeWwUa54XNoYsi8Lxj5HGjS5Ahpo0Q18ZuR5U0fWB9SZd0ILiTcHP9qYhaM9azk4LC9Kuhy7+DMydgvgCi5G/hn4GdGXIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvefjNwL0DDMY81KSia7VX05cBSX+/APi7MhVHDBej0=;
 b=UnfQWJFgSg2azjHt/VELq88szEppH/wR6vZ3nqvN0ZPhu+W6wpFJ8Pfuho2qt962yIsugIXdAoGjUlfQrxj/wqiQYi3wHgqrSGLV5i+O3CRq6YDO7uh4iWk7TKTu1DD7PuguEcbQmwuKaJyYJ+jFP0yv0wbE+CYE0rj62Bgw84ZLvvQnylnwortV2CIPXvqmFQcze4RMMS1yZZnUuBsY6DQwf3uN58AoohaL01GTLyB4LjEXoIar1ijwI+JZeUWIIgbcp7LtyCcCcXp0kMNC3+2168Bn/LHD5Toq40f+yeICqiuB9yEezIYh9eco6qUWcX07ExpDAkiWtHnYs7mB2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvefjNwL0DDMY81KSia7VX05cBSX+/APi7MhVHDBej0=;
 b=2i64VF6lMljnGdvqu1NCJf8PqE92huxFIkwwErUWwoU8z1GmgfT9554RRnT9sNUfkRrmGM31lRjsOLGloDcxpprCBp07LIryvbGm+vKWZxtmInNnmhk7trE05MgRFpdvz6M/z0nfG8RYUhws1laLlNwyXDJxcnQHp8iXmhuHvAg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by MN2PR12MB4319.namprd12.prod.outlook.com (2603:10b6:208:1dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 07:06:56 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 07:06:56 +0000
Message-ID: <c1c4d983-795d-4fba-84f5-7bd62246df02@amd.com>
Date: Wed, 21 Oct 2026 09:06:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
To: "Patil, Shubham Sanjay" <shubpati@amd.com>, Rob Herring <robh@kernel.org>
Cc: Shubham Patil <shubhamsanjay.patil@amd.com>,
 alexandre.belloni@bootlin.com, Frank.Li@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, git@amd.com
References: <778da629-2f23-412b-885f-e87827ce2b5c@amd.com>
 <20260922-ethics-flap-9760347e869d@spud>
 <20260922-bullpen-reprise-f62e01922d88@spud>
 <20260922-immersion-salvage-00450539f1ce@spud> <arKr-oapsl5qzo_E@SMW015318>
 <20260922-purple-overnight-2cdd2ddd5270@spud> <arLKWE1tJrKnzGdp@SMW015318>
 <20260922-unadvised-stalling-5cbeff8f982a@spud> <arL_Zgi1r1IFpNIO@SMW015318>
 <20260923-overturn-acts-5abc2e4fe6ed@spud> <arPlFMhcL7Jxh4wP@SMW015318>
 <8547c8c6-502f-4dca-a82f-893a5568f7d6@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <8547c8c6-502f-4dca-a82f-893a5568f7d6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::14) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|MN2PR12MB4319:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c5fd8de-1016-41ae-ea67-08df2f41e481
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Rkbc0MBmvB1GuyrT4BAjDlAJwMERCqLg9JUXmOYyq2ANZYstsVKwAqED8uLecl3kOMqeaV7TZ0QjxGel0V/s6IDH62CfcNA4cYVtVRR61nWQAKEhYR1C9PjixY+X2Z92/vcBXCU+Ov/65F9rxtu1j5WU301VuvvqF2q+54ETW1P97totxJDQVmTd//VqaTDweyX+Q0GS4szYnLLnPv202c4pTTpp4zQJ6EvtjBjEDczCmCI0R7+ZP2S4pQPt0Z9aTlehbvokHqGRAFwrW9DHycueZflrUe/owRPlI5g5AHVc4n6v3wIJnOU8xK+/zXC8msjjsgxluU7KAQpxMW84IyOhaMbn0qHQ5uTTDcImc67UKIaIeEU511QuE/23chpn4VptFz6Whbmo22UjEPOtoearr9tEYXOOFK8NdTlt29AVTtWA9B49EUCVJJx4JtOP57rF3bkRvSQszXUMyYLslaWPBmhyL1dnKEfi/DHuAU1T79mcFPYDlrWUrc0QT++bmyCte/ZHBLlnxcA13Oc3CP9nwHbXww3UQ+KThMJhxWX0Z7UJupHlcKtWS77mvYOfHvqKoh+7IIECpighHPxWgkp9sqAS7ggE1/LXnjCb3NngwIWv9oxaCHyMyzpBCkRowmI8TsaB59S9od0VPOim1LCqmWE8sMw6+PDaydyTJvw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzdsbndRVUY3THFRRmdtRituUDFpMEE0Qi84SDMxZGFDREgvZmh3cUtaVkdF?=
 =?utf-8?B?U3dWM3d5SmF5VUI2QVdQdTlhaDJGczJObzlkOTR0bjBzcXdUM1dOSWxLM3ZN?=
 =?utf-8?B?NDN4bnBnM202ZTd5clVwU2tYOU5HcldEN3V4OGhQRS9qazcwUmprTG9iY2Ux?=
 =?utf-8?B?OXZCWmdyUFhtSHExS3JZcW9OdkVTNmdncUZ5ejlOSjYxS2xsLzZkbnpzS1ow?=
 =?utf-8?B?VUhydGY2bzYrMUZYZHVWdGhHU2RiemMwWlJWanRsS0FRV1NXdFZCNUlMQ2NK?=
 =?utf-8?B?SGd1REFIT2E3cURkcG5QeDJXNC91S0FXV0V4N3ZBNUJReW9qTHkyc3RuNGUx?=
 =?utf-8?B?UHNjcXd3VU0rOENYVEZFcXVIQlRXbHV1UGc4Vkh4T0o2WTlVQjJheXcrM2xr?=
 =?utf-8?B?TGR2bUhtTy81bUN2eEQvTlBoSFBveVhyZzNLTVVPemFHalNNS2FDNWp1d1Yy?=
 =?utf-8?B?QStjNFdUUHBBZWo4eFk3dmI2SDMwTjYzbkkwQk1VYmwwenVDQ1YxQ2RUTWpB?=
 =?utf-8?B?VmlOL1Z2QzJlTkRBVE1mNzB1bmpRbXpjS3dJL09NeGV1Z0VTbXlOM2FtZll1?=
 =?utf-8?B?OFFWQUFUaCtCcFlpZEJuMVR4WitxSW5aT3FBU0lVODJwTU02enQ3ZmkrSnV5?=
 =?utf-8?B?NUVlRGN6c2FGMWJ1dVRad1kvWHlVeE5ZTThnVGFnY0VMcyt3SWJaQVB4OWwr?=
 =?utf-8?B?cWpOUDJGRWQwSWVkV2lZeHU2SWd6Y0ljdVBTY01QRldaQlkwSHRUQ3loZmFq?=
 =?utf-8?B?RHZPMS9SVHhTQktTQkkxR3c5VGhieFlMQi9qVTNlU3Y3RVJRNTJsYjhNdXhE?=
 =?utf-8?B?dDNQSm1mZHNKTGt4VGlHTkdHUDZlNU50bDNlUmZTanpxRzJqVDNJOHByK2Jo?=
 =?utf-8?B?TVhJaExlcXo2NlVYbVRFNjFqS2ROcGNpVWRDVlc1d29pWUoxN1p6cExpdC9B?=
 =?utf-8?B?cjVLYkVMb05zWUc1VlM3Y1NwZWtRSE9SeG9qSUlweVNrM0Y2K1J6OTEzTVlJ?=
 =?utf-8?B?N2xvZThUV1J1NHZGUzFrRmRON0FSVFdnVTZLU1BDbHIxVHdCMWVmUEJKY0pC?=
 =?utf-8?B?K2pWT1RpQktZL3FpaVZST20xdU1EZFpKWHUwTytSSTVqaDUwRWRIUlc4NXN0?=
 =?utf-8?B?bEhaOG8vejBFaS9jOFIxY1F1eWpYL3JKTytabU8vUG8xOCtCcnErYjdQenFD?=
 =?utf-8?B?ZnE0QnJSQUhVWlBndkZjNUNIdDQ2ODBhSzRVVXcyV2pkM005UTRINE9BYnl1?=
 =?utf-8?B?WFpocElXeEtERzFlZmxVTk5ycUIwNVVmaEg1NnN5VnlVTVFSb2x5MEFUZ3JZ?=
 =?utf-8?B?SXg5TnFzU1k0a0p3bU8vQ0pPTjdETldHdkczNEJnZERmeW1qQkkzT09YVkM0?=
 =?utf-8?B?bk1OVjQrRmp0aTIwMEhQVTFtWDNRMXdWdEFPY0U5VHBQUFNicFBVRDVSUHR5?=
 =?utf-8?B?MUZvVlBuTDVaRVJ5WUdyblBSdmVFV2Z6WXRiVm9Ea05SS05COEEwVmNtOW85?=
 =?utf-8?B?MTM2a2ZZMjRPNXRiVFZPUDN5ekpSSm1iVmcwMlQwcFdhbnlUcTcybngvdjZk?=
 =?utf-8?B?MkpvVitLZEhmSGxhMVFQNEFwWXhXV0pxU2J0OEl2SExMMjRyUG5Mdk55YjVR?=
 =?utf-8?B?N0gyOFIyRHM4ZllIa1VWTDFwQlB0TUF1VnpXUk9FQ0VNNU1hSVNrcUtUUkhu?=
 =?utf-8?B?Y3BFODlxNElwakVvMFlKdVJJcEFMM0ZMTHFZTU5WYnd0WUQ2UWw3dmw0cmFy?=
 =?utf-8?B?WjV1Ynp6Rk5LdHFBeG5ZbzZ0NG5pSjlhSEIvUGozUkdoY3M2OTFpR3l0bmc5?=
 =?utf-8?B?Z3RZbFgxQjNQNEhOY1RWKytGdlB4OEhmMVpLa3dVa0pyY3NTeW15VlJmVWNm?=
 =?utf-8?B?Tk82bGFhZWRTd2I5WG5FL05iTm9PYjllZkpZTTloR1Y0QlUrQUlyRDFVMllO?=
 =?utf-8?B?NHFXVWV3eEc3bzdFOGo4MGFDbWdRSm5GczVnMUhyY0RDaDkwOFhDZ2dkN3Q0?=
 =?utf-8?B?TTRNTGphQ242WjA2N3ZrZ0lrdjQrVFVoQnNjWlNWaDA4RHhoVEVDajEzTE52?=
 =?utf-8?B?eGkzRXZVUU5DU0oxR2xHWFV2SGhuT20xU1hzeUJ3QVdFNXhNVVJoTk1iYnAr?=
 =?utf-8?B?Z2w2YW1ZcmJwWHhaaS9NWHZucW4zQ0psd0tlQVlyZlJqNWJFK2FyTmgybks2?=
 =?utf-8?B?QzRjaTNJSGxVQWR6NitiZTRjVXVtWElTMUt0dWVYL1p2dS9uTStqdHJJekIx?=
 =?utf-8?B?MVE2T0NIZmJwTnJRNzlBdGs4SFIxdVdmSUg3ZjZ3UXJBaWgwRUtYS05PZ3dB?=
 =?utf-8?Q?GL5YamaNEvAmE6Budj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5fd8de-1016-41ae-ea67-08df2f41e481
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 07:06:56.4347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzc4crLkAQLTM3H6kVXeGDiQOSbcVOJUXVg/+RBsjRE2+BuyTqVGBtjxT4jxVNs/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4319

Hi Rob,

On 10/7/26 08:03, Patil, Shubham Sanjay wrote:
> Hi Rob, Just a reminder !

<snip>

>>>>>> No reason to keep hj because the difference between HJ and IBI is the
>>>>>> address when address arbitration. If hardware support IBI, it should support
>>>>>> HJ. HJ just use special address 0x2.
>>>>>
>>>>> For this IP, they appear to be controlled by different configuration time
>>>>> parameters, so I don't think conflating the two is the right thing to do
>>>>> here:
>>>>> https://docs.amd.com/r/en-US/pg439-axi-i3c/Configuration-Tab
>>>>> Per this doc, and the original commit, hotjoin configuration is not
>>>>> permitted when ibi is not supported but can be enabled and disabled
>>>>> separately when it is.
>>>>
>>>> I am not sure why provide such flexiblity, only difference is that compare
>>>> address 2 or other value.
>>>
>>> It's not unusual for FPGA IPs to provide extreme flexibility so that the
>>> consumption of resources can be kept to a minimum, often to the point of
>>> excessiveness. E.g. for a ethernet MAC IP each individual statistic might
>>> have a configuration option.
>>>
>>>>
>>>> This feature may be quite common for i3c, if other soft IP provider such
>>>> flexiblity, still common property is the better than vendor specific one.
>>>
>>> I'm not at all in favour of speculatively adding properties for
>>> configuration properties of FPGA IPs, particularly given the likelihood
>>> of abuse by others. Without multiple demonstrated users, things shouldn't
>>> be considered for being made common anyway.
>>
>> Rob:
>>          What's your opinion? I predict we will met similar problem when
>> I3C become popluar.
>>          Do you perfer use vendor property fistly or direct add common
>> property?
>>          There will be back compatible problem if change vendor property to
>> common property.
>>
>> Frank

It looks like this thread is stuck and everybody is waiting for your opinion 
about it. Can you please take a look when you have time?

Thanks,
Michal

