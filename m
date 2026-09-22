Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011043.outbound.protection.outlook.com [52.101.57.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DD938A29A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790043676; cv=fail; b=uikDWkBIw8CXlsmIu+XXr+0BamhFRks0AWs4X2xBR32nsVyzQqvh1f1S03BPtBdWPqePNohCBcBE6evBu5TYiDlAs30Dvjen8KVYkJLXWHAIMD/+9tnIIsBcySTvdvi+/PwLBlKyTSfRAS4Uwa/Ib7hyctXIasqFfhZ+1JdZR1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790043676; c=relaxed/simple;
	bh=IyVc2lrBzQbErNM0Oqiwe3LR27Ii/QgrbQqSJrdbV+w=;
	h=Content-Type:Date:Message-Id:To:From:Subject:Cc:References:
	 In-Reply-To:MIME-Version; b=Fin582/DeBYqvnLcB6R2SWJ7GVZ2f5uVF0d1/un8HTgb7tZfIqOmALRbQLVllZ2p7HZQDB94Jb3lk+ryrBlkxKupH8z7dCuXyY7pI5D3nBoArFltgIV5PmPcUQS6NxiGgNKJuFAovfVzx/Hj1Tvl4zRE+jVSJQec4KsCqu51qzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BUbD1SIz; arc=fail smtp.client-ip=52.101.57.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BUbD1SIz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9ysXtyZZPqcCquUFWM6BIYR5zpfjidmPcIJfWdww7yDM3cPCRwV3iSJWi5wi5nZ5t9dttY6QEb8vBlzwgYhs9WFx1z4aH+oIqpkvexaoIS5CTpOTuQ6U5cpzh1QtI35wFVUr3LUVbjv2sIBp9/nPw4VoBq6KHA9BCzr/aB0sZajG7dx/hg6MVbBd1vmR/zow/HyocqnFpnQykpRtpEkr8um/GtcHulLbwVcqpY4SCFrPfD3JuLCNqb/yce3jxyuTXETpoZGhh2JFZ8RiE2KGFc56/y8Q7dCsMqrl1p+iIMheDHBjj9JrznYVSFvKW1DMEtuSUobRFEUxrfZRJRueA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPj416pAndoXk3DEZkO79McVA8/tY+obKSJB5fvD9KE=;
 b=hpWrxTyssn1Ccqf99g/oK6hpZG9AxYOqx5PEJ/1jUwKewmQLEQio6lQ9AZQE8ttrLaV3Nk6ISEeTQqlSGpHR+1ms8N6AXppU0b8k5+esv/j8wR4CYMzmT0CCpwscrZ8Cb4Fs8ryrSXhjINtiD98laVy29OdeIa8g1A8oowU/+nxUl8Dc7mtuyF8IIEdFygqCqYuAFW/BFOu9IOmTf6u/NIlFaEsJfp6K9nfA8ZtSBHS69FjJNe4gAibdHX0804X+Y9QwZfe93poJ51+UeoPj64Dblr8r3NuRKkyBF+z9ReNEt++oEBBfvqKOhMFyK2rAmbaZoYNJ4PsKGriPQTjppw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPj416pAndoXk3DEZkO79McVA8/tY+obKSJB5fvD9KE=;
 b=BUbD1SIzJnQjgDhuRDcxXxq3FKICFBpNHPOhwFN3Ql8FzUdp40p3AT3wMHYajQnFcLf2VhZYNRx/gprFZzehaprm1LqJd1yXBjCtzp7XHpa54PRsRA1B3yOvnDUT9rejUaaQbcmPHtpQ88sp+tSDaJr+JDNVqPlIlJSpZBNjYdmI4t4C2Azw3734EaeYWgyOboH2tvSxyzyOklWG5p2wO3hoQTiXLKq1/eFUbn24bkwzF8imRiDJHnOLDmpqHDUGC/XZv5rWVC50aYu1zvUjTCAJ8oVNflNRLa8JOAW/gJSJZQXSQtEe630+NWq+s+X89JEzH8h9M7oHarHIU7RNrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CY8PR12MB7413.namprd12.prod.outlook.com (2603:10b6:930:5f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 02:21:11 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 02:21:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 22:21:09 -0400
Message-Id: <DLLHITEG2EKB.QW7HP9XPGY6W@nvidia.com>
To: "Luiz Capitulino" <luizcap@redhat.com>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <david@kernel.org>, <baolin.wang@linux.alibaba.com>,
 <lance.yang@linux.dev>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH v8 08/14] s390: move has_transparent_hugepage() out of
 THP guard
Cc: <corbet@lwn.net>, <tsbogend@alpha.franken.de>, <maddy@linux.ibm.com>,
 <mpe@ellerman.id.au>, <agordeev@linux.ibm.com>,
 <gerald.schaefer@linux.ibm.com>, <hca@linux.ibm.com>, <gor@linux.ibm.com>,
 <x86@kernel.org>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
 <hughd@google.com>, <dave.hansen@linux.intel.com>, <djbw@kernel.org>,
 <vishal.l.verma@intel.com>, <dave.jiang@intel.com>,
 <akpm@linux-foundation.org>, <yintirui@huawei.com>, <dev.jain@arm.com>,
 <usama.arif@linux.dev>
X-Mailer: aerc 0.22.0
References: <cover.1789695931.git.luizcap@redhat.com>
 <a2c5f62c812afa5b84ef16476efc99281930c124.1789695931.git.luizcap@redhat.com>
In-Reply-To: <a2c5f62c812afa5b84ef16476efc99281930c124.1789695931.git.luizcap@redhat.com>
X-ClientProxiedBy: MN2PR14CA0022.namprd14.prod.outlook.com
 (2603:10b6:208:23e::27) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CY8PR12MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: 777911c4-f783-40ca-af33-08df18502b07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|22082099003|18002099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	/kYrstMGJGY+Fjr83g1Yv9stj/qdolQxE3za91i2SO6rI+jVdSmjZUfrxemeKgrtFfFj9lUL5kKgFd233NdEPTyXh7M/bZ3xVZzUp9P+h80GJvoxk7HaDQKAGwV38gA/KiFRejIlTXEi5HQbUhL76rGSXbJg6C5uk/A2f2zfUiGFLWC8Epwi6/ILqZLubwO7oF67gJxNu6FK7Tm9fCNna3moyjtLxaTu6DRcSShmlhMZ3gIFKcY9pXeBLYiqAnK0G+GieQjMF3ZdY7hIhkR434JHJQeWvkRWoCAOpmdvyO/3ng9dNtNAm05iRboqhXINaR30GERPTwkyfDL+ZORB5UlkAyp0VznJN51jyX2KvrjepPsQzOCqbBJKp+eeLIrWhHGLrAK1h8yOhG4hM8HXoTX8zEsJW+I0H7btUjAGrtuy8VVSNkploJgiRsxo8gtt4hwDym4171nrqlECgxDxmDTJGFQpYjC6ZvAj/3cczis0t8e9ZFT2wKp1b3ofaL6mEGKWPq/+Nu988Dvy6O41bAxIIPYPTAZzdN90X9pz4o0DdG0aUWPDv9NlaM40CI6JXZyz3Z+T1DaW8HcAXZcJBVYgikjQxL4P9CD99sTJvSjsLfZczGqObmSy+8rWgKax6v4HEpQuDxSp96dCFiCU8J1i9g2SIHUMJUaomavGcnE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVhQVEhXUUxEdmFUUUNqQlNla1c2ajhGeWxYNUxrVklrZHl4azFzTElSSHhv?=
 =?utf-8?B?a09qTzFoTll2SUQ4WVA0ejFiaSt2Q2V0QnJ4MjdLNTJycnFRWEpaTGlCdWNi?=
 =?utf-8?B?bGkyMzREOVYySFJhQ2xyMlVvbi9hUzQ3aHpnUlZQbG9HMXg4dnFXS0YzUmN2?=
 =?utf-8?B?U3VJeVE4VmlJRG80bG1LbVg2dlZLOTlIanNnZzkwc3hIL3JlMnlwSWZObFNK?=
 =?utf-8?B?bjZSdkh1SmswcFBIMW82M2xmQUhnZldCM1ZPWWhOamJVOHFEMjR3MTRzUHFM?=
 =?utf-8?B?VnZYalIwZnBQZVMwdHo5c0RLNExnU2tVd25sdzlWUzJqdEh3Qkp4MEZEem1M?=
 =?utf-8?B?SjJHRmozQ3hnNXk1WXNrangzSlBud1VHYnBlKzFrYTFTWWJta25HL2FISEdt?=
 =?utf-8?B?TmhiT2ViNjQ4OGJpTEd4NlpLZGp1bkZONGdiQ08rNllGaFBiaHdlbXpnTlVx?=
 =?utf-8?B?ekh3QWY3Q3Q2VGZpVTY0U1ZMQStsWUdsQzE4ZjU3ejF0RFY5eXZYWnFBdWRL?=
 =?utf-8?B?YndVeWd0QXFMNzJpVGFsYjMvQWd3aGRMQWpiMUVabWc0dmt1UVdBQUVvZjl5?=
 =?utf-8?B?dTQzb3ZEL2QzNlVmbENBa3lJeE9WOER0bzluV0lKMG1NQXpFb1lIaHFlZk10?=
 =?utf-8?B?NWpzSGdRSFcvQm1lanNFTmpHbDJhZWhjSHV1NzQvbHFKMWx3Qjl0V241Z3Fn?=
 =?utf-8?B?emlBbDhMNTc0dVpNVTFmY2huTklDWjJwbVpkdldiQjgxbC9WN0c1OG5yOUlF?=
 =?utf-8?B?K1pmWWp4NE1DN2dmcjVZN0dZcjVjR1ZyZmZGd1RId0FSU1FxV3dvWkJza3dx?=
 =?utf-8?B?Rk9uUEhDV3lTOGVFaUJzS1VKYUVBVG5wTWdOS1k5c1BDeUpWcG1sclhpOTJD?=
 =?utf-8?B?ZlVZZktHekZnekdBcXVnTnUwS1g2TkdYZGR1TVZ1clkxNktDcjJxbmthUUsv?=
 =?utf-8?B?SlJ6TzAydzUxN0ZId0diN3BPc0JTQVk0dEFpQy9BREZLcGRUeFhTNlA2OU5W?=
 =?utf-8?B?bUdnVTVNWTdZQ09uTjNPMVhEZ3BGT3FIK280TmRmMVFBcTNYdjl1Z2U3VGlk?=
 =?utf-8?B?azl0Tk9pNE9lZTN3aDFZRzY2VWZjNEloWVNZVlZSdGluMHVaZ3RBdkVLSG9I?=
 =?utf-8?B?ZUZuNTJmZ3VSZTFoaUpwWTlJLzN4cXdMMUt6L3l5TmgwKytxRVFqdkNCU3FM?=
 =?utf-8?B?SGc4dXJXdDA3bEF3UzUzWG93YUFEWUNWZ2NFNkVxQkZ0VDJERkFoencvSE5p?=
 =?utf-8?B?aWVnekdvdnJaZmJKQ0NUcW5NZ2hicU1DK3lPa1Q5eFd3Q3pRTWRmWkYzVHA4?=
 =?utf-8?B?dFM4Q0wwbkFMUkJYNnA2S1JYVzQvWEw1KzliUmxTWXRJTWxnYWZNMGdsMXM3?=
 =?utf-8?B?ZGNqNFMvNjZwTzJQM3ZTL2NBRGNnTGlaNXBzMndqbEw2bnIyK3lxbE14TWdO?=
 =?utf-8?B?czRGN3M0NU1FVWh1eGxPZWJ4andpNmtLdlQ1aVFDWjQzeitSenNaNDRzVm80?=
 =?utf-8?B?SnN0WGt5Rjl5VUFjRmsxNkZRN2hiZ2JuNVgrU3FJZ202QUVZdXo5S3hRRzA0?=
 =?utf-8?B?MzJnY0FIa3hVK3NoNnFGeTErRFN1a1JRQVJrV2NlNXBRVGp4MlBybHk0NEMw?=
 =?utf-8?B?VWhmZnpDZERrQnV6czhMMHhDV2VtOU1nMi9NK3RRVmd2dDNaWDVqSk84b05i?=
 =?utf-8?B?NzVKb29JRTVoT2hzdkI2MEc3S0xXQTNaU2VyeFFNdTV3UmNGMFFGcm8zYUhi?=
 =?utf-8?B?a3N0dE9lMEhqUkZIeFJwVnlUNEhDMy9OT0lneXhuY2NmRTNqY1MxTmxDTWxu?=
 =?utf-8?B?Z1BOOFJzdEc2RC9Sc2NLZFVMdy9pclZzQ08wOVQ1NVVwc2hPb0p2cEh3dERE?=
 =?utf-8?B?aHJZWC9oNmFwR3JZbS9pNnZZbVRoeXVYeC9Wa0g1NDUzMVdWU1pEcFpla3Z1?=
 =?utf-8?B?d0JYOTNiT1BLd0lpVXAydFk1VW9seTNGMjFUNWwybjVlZVMxZUpWQm1uVkR6?=
 =?utf-8?B?MW1qRmdra2R5RUFPbFhNaGc3VGg1dnBKV01VWWMySUNzZi9aMW0wbUg3RzNR?=
 =?utf-8?B?RWhlR1NtOFNJdXJTOENzbWZic3l6UkR2RktZNXZqZjM5eDczUjE5L3VRZHJZ?=
 =?utf-8?B?R0ltWmc1bzRTcURucy9IaFlyL05ubno0N2tjOW93SS9ET3o4Ukgxci9hSlls?=
 =?utf-8?B?QmpFTUdoQkJUdlNRQyt3cWVXaDZqNVg5QkplNEpvZ25yVEgxL0Yza2RJTFFi?=
 =?utf-8?B?VU9oZGExTC9qZFJndDJYei9HcWJoVnM2RytUWW8vZmpCUlNTSk1NZHhxNFdS?=
 =?utf-8?Q?l0e8VcIr7TGP5jlz9r?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 777911c4-f783-40ca-af33-08df18502b07
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 02:21:10.9516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEF8g4jpk9ZUq99djxKGTqgpUzkKoilMX1l6Vag5MEDagvmnWBNvzdIhE+iVpyVO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7413

On Thu Sep 17, 2026 at 9:45 PM EDT, Luiz Capitulino wrote:
> A future commit will introduce a kernel API to allow for checking if the
> CPU supports PMD-sized pages. This API will be based on the
> has_transparent_hugepage() implementation but will be orthogonal to THP
> and therefore must work when CONFIG_TRANSPARENT_HUGEPAGE=3Dn.
>
> Move its definition out of the THP guard.
>
> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
> ---
>  arch/s390/include/asm/pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Acked-by: Zi Yan <ziy@nvidia.com>



--=20
Best Regards,
Yan, Zi

