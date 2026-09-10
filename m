Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013017.outbound.protection.outlook.com [40.93.201.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C2A3CB542;
	Thu, 10 Sep 2026 07:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024676; cv=fail; b=YACv8WbH9ytKsFxclEHWKdOw5ODsKqr9Pp1ejsf2xgMR7JYRkf7+kf2YsazfPAkRyF1rO29I2mbG9MX8AA55WCgeejJO3eFCLsy1ZPwWLkm5lJVZJUgbz8zjxgJAUXJ8kCRWlxzE6po5UQThnVL8CCcW5E8ujFRsyRy1c8OWqro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024676; c=relaxed/simple;
	bh=t3mPro1mVcVSs98/cAeHkBP9+WoSw3DXKigr4x9IMOg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C95RblUdX3/9xPPb6Ym8eyhCo/1SvjpoSN68bHmaUO+QKL535ZUfloRL3OxNR9NOJpvlP7yI83Fxl8VIUO6I7CZdKcza8Z0srO5t/TJW+yGguPF0jub1vP8xXGC+X7J/7+QtKdLnbhapFKxtT/7IY6Mg5ZchqH7YbgYT34w3ySg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HoV9S2wD; arc=fail smtp.client-ip=40.93.201.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HoV9S2wD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eY1LWst1lG+pKQxhmTxUUhbCotmTkNEQxioTkgtE6jUr4BmJZdbUs4iRNqCzqeK5EZuXoS/z8Vcqew8GLWV0SINwp/E6HCPCatc9YXqEAooyRK2445uh+TIC1tWh7Wcmpv3Aa5QkHkdCf2kzcpOOe01l9NRX5GKv+LL3IaaC5egvRNZbIzN/mp/3NUbPag/99FEV0S5OBFugP6njly2h+t9ZkPnSrs2yyIYn0k3FGO6gZvXP5TFh7tAojU1hll3AgF3HLcmQRKHLb0bFxJ1Z8Jng7ZzaUH0As0jg9bTTAJnBBgRakJjYL7P9nzU50/BaQP5OLAbo5JcGb+yA6ZNiVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8H5bUjG8lWe+zuiOEC71hIr4Oa/+aHWghW4g8im/IIc=;
 b=M1lahL1ko9oPkWBQ12Q1FED7ASsg83qD47z7+CMe0j/7OCROxJjdea8DCncGzU3rtabPu6DJFxPvCZly6ouZUqwIGVrw4bcenXEDmspbQ4kBn3nMU4EbPzWU1dpDoaKIeRWeh9qbFO1t9bqiZNw1P33kq3/x8U0kKvMUM+LpAXV0pjCLRHovWzn50ghVcyeoqq/x54VRQKNCsb7ZjynkzxCBx2MuqFtF3VhF8aaKdPZx0Z/EKRrD0j/cNIViO4/hqFwwnVbelvyCeIJrukUUuD3VsekT1FVcWyY5adFiGJRY2onuQJZEU3Cy48A7jqEFYxtN9NMW08rjpMsTVMxaEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8H5bUjG8lWe+zuiOEC71hIr4Oa/+aHWghW4g8im/IIc=;
 b=HoV9S2wDoj7Ttp4Nu5eqe5dAdGCF3Qdo/1n228vJ5PlOExqXFYVaiQ0hizfYvHiyEJoJ7IHjNAQTXX/xcIIoH3vPhbrWk6e3z3dfjp7LMCbHpHpHpc8mOZRFd2heU3Bidyetnv4FcsLDqcmv/c6qZYWKmQw03ircclIPb6wyy+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DS0PR12MB8295.namprd12.prod.outlook.com (2603:10b6:8:f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 07:17:51 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 07:17:51 +0000
Message-ID: <e305b607-76ca-489c-b27f-bf45b6fdb59c@amd.com>
Date: Thu, 10 Sep 2026 09:17:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: xilinx: Document ifm ZynqMP
 VHIP6 EvalBoard
To: Marek Vasut <marex@nabladev.com>, linux-arm-kernel@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260909182641.165383-1-marex@nabladev.com>
 <082df9b0-0517-4580-8ba8-cf6f4d3e0713@amd.com>
 <1c39be54-c931-40a2-a806-fa963b2188ec@nabladev.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <1c39be54-c931-40a2-a806-fa963b2188ec@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P195CA0051.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::40) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DS0PR12MB8295:EE_
X-MS-Office365-Filtering-Correlation-Id: c50be87f-a551-436f-e729-08df0f0ba026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Kn77tegs3hCi6WZzg/MLkVIrrrFAfYn0PtC5dup2YsxsJBgLd9rQpHnMxDdcxo/ejHTNleJGr/KnWo/YcJCM5PV449ApH5D4fdfodTmd+Ya5Iu0bOp1XywSgQBnB399VidoF9GN2AzehSTQvVffr303cjlcFexSgeku9tCa6CAkzP6Hw4kl2j745AkxyOTlQNEpmiQShupUEZnSPYe8wTTjYm2z1iWFuGfECe894B6dptuqQ2CqpT+N5g8mV4l/RcgwiqFmDnI4HpyYNNLdFDJu6dwDNe/8U7tafgSMcQnzUC0BIfRAttO/6G8G79+VnsGD9vQ7dJ7mMwQzbtPalwLOp10X+Vt/EsbHC1UqP0VgyklXHXW7+aLoE7Kixu5JcRvualkaz6YMHxg6QNuKtZXf9bH8HAKu+CoeSfJgBBr08p36tvLhic+JkwONrDDTnBIcGF21572oaV+vFA+UYemCQkoWbTmk16U0VZGjD8ydFZZPixErLmZRYf7xS3DqT7Pj21mJK0SDKSUgNF1B+zS90FqC1LCMAMbEAnyoeQHhyh6jFIG5TT26ODB1Q8ca/XNkZl4JqqZtdHGTAcOwAgw5RbPWa0D3wQEyLy2A4Wni4gAUo6aLtTQEhU/O0zFDdVQcsf6CSLoXfIai3PoquE8zk5pKiiBAs3wG0cKifO3Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3UwSDROcjQ5NjlHYXhJdisxcjdYYzRYYUEzeFNSY1BkZGlxU2NGWWYzdnFU?=
 =?utf-8?B?M0NCZnFiSDhRWU1UWVV6MW1odUJ0SW9hdUMrTCtmeXgxVXprU0I0N2wzcDMr?=
 =?utf-8?B?cXFPRyt1QjQwWmdORUlUWm9IZlhJVmF3VWZNZ0hPNVkxNjF1aFpYRFhUekpV?=
 =?utf-8?B?Yy9PNDB0Z1c0WVVjWFB1QUl1b2hzR1h4MWJneWx0c1BETEdaMEVoZkRVU2F5?=
 =?utf-8?B?Sm0vVzZKd1oyd3dLcnZzQ0pzMjY4a2RWN2xyejJvd1NyOEttdGh6ZlJzTlRB?=
 =?utf-8?B?blNDcEowTGxQSlRXSjhtZWwxK2Y1bmg2NDR4T1lIY2hIdzdCNkhZbzVFVDRU?=
 =?utf-8?B?Tk9FQk9FcE1YMHBmVDcvUkpjQjdJUVFYck02Y2s0WmNJUlgxVzNySXFSMTBF?=
 =?utf-8?B?anA5Mlc1cXhEZ0srWktSaitqM3hlR3VHUTcvQjFtdWlFVnExYklhZUpYZTk0?=
 =?utf-8?B?d0xBOWF4UVRHajN3NEFaRC8reWIxMTNuNkZXa01UdXJ3ZmJhSFVFZElmTnZC?=
 =?utf-8?B?Q3BlWFUwUSs0OXVlUDNGNktRVUMrK3dYUVlqTmNGWkNBU0JFaG5STUFydW1m?=
 =?utf-8?B?dHV5cUE5SDhrbnNUdzFncDRRdUw5QXdkMU12NXhtMnJRbXF2MHpONjlJamxx?=
 =?utf-8?B?ZWMrVWZkTzA3Tnp3ZlA3S3FUazFhY25wN2oyMThPdk50SlJWSjlIbGVFMXRL?=
 =?utf-8?B?VGtaem45VzJVY1U4SVd0NlV6YTJZRngxaUFUdVltTjhLSkVrdU5KZFAwQkx6?=
 =?utf-8?B?NzVWK1Y2bW4rb3RIem1ja0N6L0VRWDgzN3NpeUhOOVcyOFgyYzF6bkpXQ0Jt?=
 =?utf-8?B?WG41RkRBQmowdHZtRU1VZFBYK2ordG0yck5WNElvZ2RZMHA3VlZLVUtoM1Zk?=
 =?utf-8?B?VVZPK0sveDdiU2IxaW82S2ZIZ3ZMQ0pGemxpTXJJK3N0RGFQRjI1MHBRN1k1?=
 =?utf-8?B?ZW8rWFRHQ2ErVkZpMlk3bGJYVVFZZzd3cjh6VUtxT1dVQVkyYkp3YzJubExO?=
 =?utf-8?B?ZzhQdXo5QjkyY1B0bVd3RTJpVXZwSzgxQitZMG1zMjBmaWlaUHpPQ0llZ0lJ?=
 =?utf-8?B?Z0phQVN5NmVwUmZ4dWxQUnI4cXphb1Q4U0V0RTVWSXlOYjRQYmExRThMT3I3?=
 =?utf-8?B?cUhWQVlwUm84Yk1RcjEzcy92c3lkZEJIdFNJbHNxTXRpS3RxVzNHNkdwcUFZ?=
 =?utf-8?B?RlRrK1hCb3ZHWDVRL2dKWmdiVk9PbVd4R3c1SnV1NGIyTWE2YnJZNE0xOTY4?=
 =?utf-8?B?bzFTMUFUTDFqZmJGaTF6M0haUkVKa0xjOGNlMmcxcGpJd3QyMmJKbUdrdzJu?=
 =?utf-8?B?VXg0MkRvcjYwRFlIOFRHTEoxVHM1VG15cnBIMUszYnNQekdYZld2MU1yK1pH?=
 =?utf-8?B?SCtPOTBmdmdPN3FDcS9TREc5MFQyaGUzSDZWSHkrUW5hcm9acUZvQjV2VTZM?=
 =?utf-8?B?amF5bkl4bm1TNUZ3bkQyQ0RGRGlhaGxMbjBsMFRHR3A1OWJqZmxacnNvci9P?=
 =?utf-8?B?RU9SbzdUY3BtcnM0bDlUK2M1eHJjT3BpMmxRRk04azRQdE8wekc3dDViQVV2?=
 =?utf-8?B?SmswekVSUkpjaGg2c2diVlpFSDUxS3BsNUhaM0VPQ1lYRmViM0JRcWUwVXRZ?=
 =?utf-8?B?M2wwSkZ0Mk5VMUxoVkM4L0ZOMytHejFyWFdqbHRlREUwbHRpQlVzR1lqNWlO?=
 =?utf-8?B?MXVHQmMwUGtBL2I5VXBSaW9CNFY4THdsUkIrK1pEUlVmbm5qeFJiaUY1ZXlw?=
 =?utf-8?B?czg1MU9xNThwelJBbXp3SXR6dGlSQ1J5bzdObVZxMk1TTTg2cmlJek9RUFVC?=
 =?utf-8?B?LzB6TzBCb3oraUt6cHhnNk4zRVdNbGI3a09QeWpQVUJJeXJkWThDYkVFbmRU?=
 =?utf-8?B?TTcrbHhGb1czWmFTVkgrSkRZdEVVOUNDL0gwaTlab3hUSldSaEVlTTlsTzlZ?=
 =?utf-8?B?ME5NN1ZBellGeW8xR2thdXVqQWN0K09FbnR6cFhUbmpOc2N2c0E2VkJ2SUJo?=
 =?utf-8?B?ejVjenZCZjBzcDFIeHdZQmVuWE5XVFZldDFNVHoxekQzS1FmbWIySHg3RjFx?=
 =?utf-8?B?MlJOTUZpbHFNYWp3U3hRYjljR2pYVURzMm9SNGNsZW9udEFGamNnQ2t3ejVF?=
 =?utf-8?B?V2tHbkt5ZTFhbUdVQStSVTVJT3U3aHR2YUIwNFhsYnFkZ1lZNXd4ajNLOUIw?=
 =?utf-8?B?ZHR5ZDhBcXhJSWJWcWtDa0dHbUZVNjZnWm5tWkNQL2RTcGZlY0NLaW03dzFE?=
 =?utf-8?B?TEtFZURhZVdNU1dnN0NjazZ0Ri9CTzhNdHY2VTJEWWZYK3JZMmkwNXg4SVhX?=
 =?utf-8?B?Ui9QcUJhcno1ZmFvQy95Zm80N0JMUHcvdnlCYU5lMlFDWG1uUUhmQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c50be87f-a551-436f-e729-08df0f0ba026
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 07:17:51.6618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lCLqGCDmvuRJ9SFcC4SAYszqV3zbBS7LFbJZs/wCMSxzARCvABlNNisHREZP2vfG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8295



On 9/10/26 09:01, Marek Vasut wrote:
> On 9/10/26 8:22 AM, Michal Simek wrote:
>>
>>
>> On 9/9/26 20:26, Marek Vasut wrote:
>>> Document ifm ZynqMP VHIP6 EvalBoard reference design binding.
>>> The board is populated with four ethernet ports, QSPI NOR,
>>> eMMC, UART and USB host interfaces.
>>>
>>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>>> ---
>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>> Cc: Michal Simek <michal.simek@amd.com>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: devicetree@vger.kernel.org
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-kernel@vger.kernel.org
>>> ---
>>> V2: No change
>>> ---
>>>   Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/ 
>>> Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
>>> index c9f99e0df2b35..49ef4e0c68501 100644
>>> --- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
>>> +++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
>>> @@ -44,6 +44,11 @@ properties:
>>>             - const: xlnx,zynq-zed
>>>             - const: xlnx,zynq-7000
>>> +      - items:
>>> +          - const: ifm,zynqmp-vhip6-evalboard
>>> +          - const: ifm,zynqmp-vhip6
>>> +          - const: xlnx,zynqmp
>>> +
>>>         - items:
>>>             - enum:
>>>                 - xlnx,zynqmp-zc1751
>>
>> Can you please provide any link to public documentation about this board?
>> I wasn't able to find anything through google..
> 
> I do not know whether there is any, it is an internal board from which other 
> boards get derived.
> 
> What would you like to know ?

I would like to know value for me to maintain it. Why should I care about board 
which don't have any public documentation and none can buy? There will be 
thousands of similar boards out there and I am definitely not going to have all 
of them in the tree.

Thanks,
Michal
