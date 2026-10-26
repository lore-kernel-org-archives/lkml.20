Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793047173;
	b=CIT+CpP8oHk4nf3okao6Xwv1Izy74PmJqh92bF6PhAr0fEQkwKk4GtQLWVj/5COIYD/5
	 47SOtE7WL3bUbGGchgdThSyCZV/HbJaYsZf2yZBEbQKHYAIr3huWOiGXB4WL4ZS2BMc0M
	 wbdihLjBT1lpvHC15L8dseSqUc2na2SiW0DCDT0sg+8W2vwOzlB9KdcVVhfQDUqT5keT+
	 S4oGDTDtj9It3l/fyHe6hiX+x+M9XIO6q3WKlCySyatM/JcCxnkckZOXO4uw3JSxZdFqT
	 QYPZlpyRiMUL1ENZdAAC2pUewjCljWgYsOLCeX1cAs//CkqRkrtXFwbgYhhE5lAoXNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047173;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=58Gj8lKUhDhxREwVOTeM92ZpJifpYCcB/lb+7NMbcuU=;
	b=XggGrTICXQCIhv7yXmSUb42yqZtu36Z6qwE/xJ8ihI1EpGhEV5dIewSitnU3XvIitu1e
	 dboVOqsxUf1fUFNEr8nH7paDDnIPwXCmtVssuUEY+3ohBI4rA8WUgk8lZdw68hTq4SupR
	 BIGFSjl7VTXqeHfdknAFIESJdfX0u7I0OCVX7hNkyNxPjM+e+mr+4aZwpwsnoMUDLFMcP
	 fkt32I2iHYJ/Zl0LhLc/vnLG/dsKJBO9pngxVKWhTDV1LnWXuhimuIQ/Kkt+8Mb2FdbF8
	 4qpNCqjxMRIUS95wcItubeNd6DE8UINFplbgJYikHQdzPJheP+NJRsBzlJXR/BJtfyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kf7xmVry;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.36
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013036.outbound.protection.outlook.com [40.93.196.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A866D606A31A;
	Mon, 26 Oct 2026 20:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A866D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kf7xmVry
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aL4p0GiY0eBfLl9868WLjXJ8QxQdwfCvZVCpIoLDE6cQ7gjS2EyDuL/k3ykN3R7Rw5ENdV/n/hx2fDUgw+XqjRWiOlijLN2y74C6aw5HFvtXzi3jFI2jzQC501fgOYuRoxS72EVGDJx1/evc2/y7sWHrma2T9HpT5zAF3dGEVxX5lyla5ufyhGBBGVwHty02+GOCf/6vzbjbUjaZFT7yLFFY44uUAWwkJtr2ZL94h4NxToJLTZyhOdzRsau0XgHKZ2iqb5vYngHf0DByH7Ht+KkBot/FuNqcfRjY0T8KhgYJW2Rpa/RPmgGrN+7hHsKpXRb8iehL2i3gemgB9QPmSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58Gj8lKUhDhxREwVOTeM92ZpJifpYCcB/lb+7NMbcuU=;
 b=eu3i0nVyF297ipVfHhTnu0vwQMMR4ofRRtwkhHC5SMAJjK6AHsmjHZsenrvM2JQYGFx9UZ9MA4X2p5206BWpPnzjv0JB797hU5j+1CJ3SSYbGewoOOJCOWDXivEGDYr5YfV+F9hqU9uZJWSejbSysDILPo1RSK+AUfBobVclv0/BxmiocLVUcvp7uJYapNHcLDmLLsVVJIV2JLEkM/oE/U9hz7LitdljgLSS7tZKBlTIfBrPM8WzNpBFZ93LphZu0+juw80a3IRbwcZcyA9zdMJeqNOloU5NGdz//dsfVvEgq0CFp6wXEnEVad+IFLiNLVI5JrWgQjRUQFikmcnMQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58Gj8lKUhDhxREwVOTeM92ZpJifpYCcB/lb+7NMbcuU=;
 b=kf7xmVryA4PxIGaQcwtGQ7yYEIBOIugNfBCmUKhRcQmOSw+ddOUQJCJMQSAJpW/mmMB1zuPHdUHZGzgU2cvafH905Ixzr/dYPVh1X6padLQtQ8aJMsNwCkONLo/it50yBrmz143hWPi7xKYi9UI1hqB7Uyj7Zt2fFnb+8nPUmtY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 SA6PR12MB999201.namprd12.prod.outlook.com (2603:10b6:806:450::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 20:39:28 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 20:39:28 +0000
Date: Mon, 26 Oct 2026 16:39:20 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Rob Herring <robh@kernel.org>
Cc: Rama devi Veggalam <rama.devi.veggalam@amd.com>, bp@alien8.de,
	tony.luck@intel.com, michal.simek@amd.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org,
	james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
	git@amd.com
Subject: Re: [PATCH v4 1/3] dt-bindings: edac: xlnx,versal-ddrmc: Add
 xlnx,versal-xilsem compatible
Message-ID: <20261026203920.GA696395@yaz-khff2.amd.com>
References: <1792587442-2794880-1-git-send-email-rama.devi.veggalam@amd.com>
 <1792587442-2794880-2-git-send-email-rama.devi.veggalam@amd.com>
 <20261022143730.GA1287910-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022143730.GA1287910-robh@kernel.org>
X-ClientProxiedBy: BN0PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:408:ee::7) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|SA6PR12MB999201:EE_
X-MS-Office365-Filtering-Correlation-Id: 05153219-a517-47e1-725a-08df33a13b0b
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|261009221227099003|261009223027099003|261022105027099003|261021123027099003|261022075727099003|261021121427099003|10067099003|56012099006|261026121527099003|3023799007|6133799003|22082099003|18002099003|4143699003|11063799006|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	tMH0kS5/dBhzXt0agxjTS7YzfelIS/2kQNKhd+0Ht9ZMqq2NdySgbfRvIaHeG+JvKP/z6R7tsLZQHXWkBDwHayr4/SDAYzNbNFYFIjNxP7i7B1eLGzi96TdyXPScH/OyKGurIsQb6ZNTyl3IOkzz2tr5SvAxOqnE31YzJDtOSqOXsLdj8pXhIHN+yGVE8XIXRKmmWZJ5H3fWFnvxBn3GiC4/G/dje9JY4wDS7yvPb3Rsvw+A2xdUbmpXELFra2yScFd5w4QY5u0ZC0jaAFn3cmvSAzWbfW7VwcEJBeD/FkR9jzBEJbiZ2F1FH8WUEksQg34zwdA2IMnbs2hgxh/UbJhcuUx/VG/mJJJ/qnVZ4b/HvWXl3QnFhjWPy+6hMoZpA3be5rL564/nZ3gUsZe2bb29AbYMRqwLRZTy5WXyeCrMBMwOAk7LabNWavIlCRdM8+YhFs5lVTQZ80MM34sfHKKAnnHAkhPRpviCxqbsImscg+QlkgxVkQDO6XmNKGYAUwiTXsxxrU9/mr3Q8lJkQIrdB/00F/vBH8l9pagPYGA/qXX/PbXMuStrT5gyNbm7peeNC0MEXlqmTcKvyMAnkIfKB6Besxd6ZiuC2hFTI55FsfSQtRwhHdkj2C6W9++4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(261009221227099003)(261009223027099003)(261022105027099003)(261021123027099003)(261022075727099003)(261021121427099003)(10067099003)(56012099006)(261026121527099003)(3023799007)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IGoIV0RU9DyMeGe5nr/cOevat7FgkYfBk75Ry+wvujDMUqxXIsvjzARya6F+?=
 =?us-ascii?Q?6sbp+c+bWOMKryRV+QwsKsfWUYGoNx5mZwr/gOWQTvtwh7eR7QhK2xcKMmx3?=
 =?us-ascii?Q?ybDRiFJMCJna4WhnkJR8icJ/PrvoYnOxHMC0Ye3+IlyrlQoi6UfpteXJwUlm?=
 =?us-ascii?Q?ZSFk1Vym+st87f46E/8RcuIJ/gT3YKzqwvbfP5JVddcNubCYgq3H7i17tuvU?=
 =?us-ascii?Q?cEmb2Tul6pSQjYgDZ/Kc7QODCCqUDd/UkK6uk9vRJ3d35cyULXhCvYybRdS2?=
 =?us-ascii?Q?jcmaP+/CPZ6fRopEmJYMikU8Kj+2N5uUAO5VBBOvjgLACAE3MJg5q3DqErxA?=
 =?us-ascii?Q?e8pXKRX1DQxkiQ7TKPDxKhRoztAZE+lTLauM1MlSQsBBxRGoA8jHNRh3Mk6Y?=
 =?us-ascii?Q?EgO3Az+iGPfRV3hzPW25Rfj1odVWNtT54wwA7GaLrpN1rVHvtFYLmVbdAPRJ?=
 =?us-ascii?Q?U5wW7be0qwAbBmnnTlI3mXylXT/c6P1DFEhcTaDJgttgl3IbtW3oCO3sEKeg?=
 =?us-ascii?Q?3fCpvgRK4ZejcwHHYsOgzTAngBH36sIo25AbeoMVGTo2ueRdvnVMA+wJxoxk?=
 =?us-ascii?Q?BKCFEhc1yJv138Ld7U+m99qHGnt0KILc4Bp8tThRBG6uXttRGSaLSgksks9L?=
 =?us-ascii?Q?QyTbnV+PiUjf3+X16K/hSkFer2rzVGJHM1hToyjAz1U8lDWqIPvYv3aLY4pB?=
 =?us-ascii?Q?7S7iyi4JaME5JN7DJlrV669qcorIFtKL8brO8NSIhm3kUkE/V7s5GVSkKRYc?=
 =?us-ascii?Q?XKzPWLfGPGmi2iH2GGnDYpCp6H3zrgmsnlXWSCEQiU+LEyPNCJBro+ZDA0wH?=
 =?us-ascii?Q?edKf+szSG9CUNyu7U/t22EBmYT6psJZVMexxTTaws4MjwSD06o/BSZuNQU2f?=
 =?us-ascii?Q?xTjAxv2BH3i59GfyquocL4WUtcdyQmCSB7vXFlbsoOCXE5eTFrIocPqD8GtJ?=
 =?us-ascii?Q?KuEMTON9n64BR4Pc/qcg8nLCYwsYBuQ08Tpa/X5MmAOIy16KniO0iQzLGIGf?=
 =?us-ascii?Q?Sxxl8PUz1CFi1hm88p1LlHq/fhqRmt4pxRkT/KC5J+So6ODrxC4ZFxiKBhzE?=
 =?us-ascii?Q?z1NsZt96HTVRK6hPNzwJOpcpwWe5fMfusbI+UkspG/lEiJsvlzSzFuOhmC/O?=
 =?us-ascii?Q?nEseHWJmfc7lMkufZP++KQ1YN5lgEqswFRFV2GoLFr3/PcAZe4Wa4T71lIBP?=
 =?us-ascii?Q?RuEVMTTMIDHAgFCeFBZfXM4U9ydFFpgn8ODa6QvrjFtZFWLF6LT995DAj5gk?=
 =?us-ascii?Q?X6ulthNTaoBCnt99Fg1VOKMoGmwR9CdzKff26HAnffbi3XbavJt1yqxBy02u?=
 =?us-ascii?Q?vz7SyzzMn0qfDbUsqO5wzMhGh1xa9GznPtZXlNKA36K9mFCjxL2NY6HvQjnI?=
 =?us-ascii?Q?wKHDMk+APvZKhy7cbcZTQGbmaduz2lVplv+V2c1kwttTPDkcVn+1vWYA4cMP?=
 =?us-ascii?Q?/jskTMCgpy/LJ+ZXHcmcBgw1lFW92/Y0yFqeM8qckcEzOWS3TuGbz0FLLQYH?=
 =?us-ascii?Q?kddSzt+b4Nrhd+yle3dRuzNli11/OyDgzUeXS8JoAvtLEpgwi0/kHT69/0dR?=
 =?us-ascii?Q?/z7bi+gQtmCxSp+qj02CI9i7pqjBKeMrqmm1Jp0iIXmhjPZLTsjlEPjEPAL3?=
 =?us-ascii?Q?j6+KxPGvU3GZtrPCsLfyBigDakN9h/a+ArMXwr1tKOsjcaGdYKepNhmmwASC?=
 =?us-ascii?Q?q0NgZKx9LRiWyGTJdaPTnq4t7qyi2VzMIDLQeWwwPes9E/kk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05153219-a517-47e1-725a-08df33a13b0b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 20:39:28.5360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5LC9ebMuFnM7fKiU2NxIw5vM2e+oZsPfDSvtoPwndUkfGApbiOGvRtYzSclatBjRujd2DR9/m0UwP/hfysO/2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR12MB999201

On Thu, Oct 22, 2026 at 09:37:30AM -0500, Rob Herring wrote:
> On Wed, Oct 21, 2026 at 06:27:20PM +0530, Rama devi Veggalam wrote:
> > Add the "xlnx,versal-xilsem" compatible string for the Versal
> > XilSEM (Xilinx Soft Error Mitigation) hardware block.
> > 
> > XilSEM runs as part of the Platform Loader and Manager (PLM) on the
> > PMC and detects (and optionally corrects) soft errors in Versal
> > Configuration Memory, notifying error events to user applications.
> > 
> > The new compatible string only needs a single register region and
> > does not use reg-names or interrupts, so the schema gates these
> > requirements per compatible string.
> > 
> > Signed-off-by: Rama devi Veggalam <rama.devi.veggalam@amd.com>
> > ---
> > Changes in v4:
> > - Added a new "xlnx,versal-xilsem" compatible string to the existing
> >   xlnx,versal-ddrmc-edac.yaml binding, gated via allOf/if-then so
> >   DDRMC and XilSEM requirements (reg, reg-names, interrupts) are
> >   validated independently per compatible string.
> > 
> > Changes in v3:
> > - Merged XilSEM edac with Versal Edac
> > 
> > Changes in v2:
> > - Changed "xlnx,versal-xilsem-edac" to constant
> > - Removed "compatible: in required section
> > - Removed "|" in description
> > - Removed "items" in compatible
> > - Fixed indentation in examples
> > - Updated title and description
> > ---
> >  .../memory-controllers/xlnx,versal-ddrmc-edac.yaml | 64 +++++++++++++++++++---
> >  1 file changed, 57 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac.yaml b/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac.yaml
> > index 12f8e9f..b5dc320 100644
> > --- a/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac.yaml
> > +++ b/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac.yaml
> > @@ -4,25 +4,35 @@
> >  $id: http://devicetree.org/schemas/memory-controllers/xlnx,versal-ddrmc-edac.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  
> > -title: Xilinx Versal DDRMC (Integrated DDR Memory Controller)
> > +title: Xilinx Versal DDRMC (Integrated DDR Memory Controller) and XilSEM EDAC
> >  
> >  maintainers:
> >    - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> >    - Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> > +  - Rama Devi Veggalam <rama.devi.veggalam@amd.com>
> >  
> >  description:
> >    The integrated DDR Memory Controllers (DDRMCs) support both DDR4 and LPDDR4/
> >    4X memory interfaces. Versal DDR memory controller has an optional ECC support
> >    which correct single bit ECC errors and detect double bit ECC errors.
> >  
> > +  Xilinx Versal Soft Error Mitigation (XilSEM) is part of the Platform Loader
> > +  and Manager (PLM) which is loaded into and runs on the Platform Management
> > +  Controller (PMC). XilSEM is responsible for detecting and optionally
> > +  correcting soft errors in Configuration Memory of Versal. Whenever an error
> > +  is detected, be it correctable or uncorrectable, XilSEM notifies the errors
> > +  to user applications via the firmware's event notification interface,
> > +  rather than a devicetree-described interrupt.
> > +
> >  properties:
> >    compatible:
> > -    const: xlnx,versal-ddrmc
> > +    enum:
> > +      - xlnx,versal-ddrmc
> > +      - xlnx,versal-xilsem
> >  
> >    reg:
> > -    items:
> > -      - description: DDR Memory Controller registers
> > -      - description: NOC registers corresponding to DDR Memory Controller
> > +    minItems: 1
> > +    maxItems: 2
> >  
> >    reg-names:
> >      items:
> > @@ -35,8 +45,39 @@ properties:
> >  required:
> >    - compatible
> >    - reg
> > -  - reg-names
> > -  - interrupts
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: xlnx,versal-ddrmc
> > +    then:
> > +      properties:
> > +        reg:
> > +          items:
> > +            - description: DDR Memory Controller registers
> > +            - description: NOC registers corresponding to DDR Memory Controller
> > +        reg-names:
> > +          items:
> > +            - const: base
> > +            - const: noc
> > +      required:
> > +        - reg-names
> > +        - interrupts
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: xlnx,versal-xilsem
> > +    then:
> > +      properties:
> > +        reg:
> > +          items:
> > +            - description: XilSEM (Soft Error Mitigation) register region
> > +        reg-names: false
> > +        interrupts: false
> 
> These 2 devices have absolutely 0 properties in common. It makes no 
> sense to share a binding doc.
> 

Right, and maybe DT isn't needed at all?

One option in the Sashiko feedback is to use a platform driver.

IIUC, here's a summary:
1) Drop this DT patch.
2) Have ZYNQMP_FIRMWARE create a platform driver for XilSEM.
3) Have the Versal EDAC module use the XilSEM platform driver.

Rama, what do you think?

Thanks,
Yazen
