Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012030.outbound.protection.outlook.com [40.107.200.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CD43CF21F;
	Tue, 29 Sep 2026 13:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689343; cv=fail; b=UgAqzWr3XNX9Hy7+5EkPbCEUBgiH/ME8V43sxBrayeiGqvAnF8tXaZ9KAchfRsUEUkpD64rknvULFjQXmZibsyEyjpCtjRKZIC/+BW5ybUkbtTCHU6mjCiITNV4BHuVAdWPt4tX/2pTTAEzqUOFCPDESaAXBZ9o4FgK2IaL8jbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689343; c=relaxed/simple;
	bh=PxCfH9uPrmXO1Zz/8WztY0If/PPVJcMQ/BpZyD19SyA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oICDt7G+DsIlWrsLS/j5kV9YHVqfBOQam2h4AwbkdpdygEfcowgB7tEIQGa4CWv+BNDwW1IrS1tiX4PD+8oppqoZAcrSeClNZ034rCatIlO6necBSwMfougFwBzKnzatPMLNRSyE1oczcUgGqmC29Mxf7Ty4lxkdWJX8i8R5688=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=VSjVRStI; arc=fail smtp.client-ip=40.107.200.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="VSjVRStI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6QDdjCFYTU1WnoSBTJ4PFhsVkQGNMHPIGJ4pxgdecWRQ3pmDfA3V/nKdhD4Bx0cotzCy2XVSKOiFfy8FrB/JjVyPJ8jmf+Xtj/eN31YJxkN6TDt+yYt5WxuGYEqwyLJjXD3e9LP7pBGF7VIXlvXFdHHS7NC7ArOg8cKFYxUegYtvEWhZzIJBl0/N7R1lNC4ZbkABkt9h6g0mW/Ihvj07frfEBgwUJXH/nSAdtiduAWPBkELLgsU014PBFC4SwB6/lba4ez+Jubv/kQY9IowkiazoklyoM5gE6ypFmutKTFFOfwBLBvt93PkRQVXmNEaUe9tP+xuDy8oAcOPaO0tyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCmVeKIh541N7Te0Gg/OknctkZk4BYIfmwamnfvqgS0=;
 b=eFBqeTcUMH7+iZhOw1IujJoQDI/9Zm3yQuyuAdE1EejimbInISCIut7gkE59tY5kf3tnahoV19KUcVj9Vuod0Gc4gNASlKlyt1BhYs1ixxLFOTzLzzgpY8uoKpF7Mzhc76RD5jTJfb0O/LGOaZMmQwACGG5eOLKgC/oQKPXCLw0eBNAW8Ny16jBgRUi8uSI9oB5sxFkqOknf4RK/3TDpJ7wKqFm4bS8YlQUfy9oL/ORPclZTaW/v4Vl/hn7TBZEMYPXrIUNUN+Ua3rXmfF2cktVgROnHCKe3MbKkJX/J6kVUHQU1MvpLrhLVc9LbxdQjyTOBTrWdvoK2cUZThOLr1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCmVeKIh541N7Te0Gg/OknctkZk4BYIfmwamnfvqgS0=;
 b=VSjVRStIu+sL+og52Go7IHKJtG3xBtYdZlTsKicdToZxwEipV3VQR2NMZw6ZaXGk9nDWz+wS3yeZtBUd69uyu+WML+DECnkeyILvKOMstE7TVbImlxYS6YDdlUGxPQG7ENO2fd5xY8mRsAQ9QhWw3Exa6dt1cU0v/T98HMyomRJQ03PNcJXx1f8XK5XA/ARCqHtRYjpwAM/Do0+k9Pj5A6Bzb1ghIczEIFefdPwOgNXj0/cWnUyvft5fu+sUiZkRdcjZyotUWsCnqq7P2FKzr6XUKUxBvwv1NYsTJFpafnJ6IN/VSxAg8omD5oa/O+1vv+QBpnXCVftcpXlMAS/HvA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from LV8PR03MB7398.namprd03.prod.outlook.com (2603:10b6:408:18f::13)
 by SA3PR03MB384319.namprd03.prod.outlook.com (2603:10b6:806:5a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 13:42:19 +0000
Received: from LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982]) by LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982%4]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 13:42:18 +0000
Message-ID: <468bc9e3-a93c-46c6-8cb3-2542e80c6579@altera.com>
Date: Tue, 29 Sep 2026 21:42:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: altera: add Agilex7F SoCDK
 multi-QSPI compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Lothar Rubusch <l.rubusch@gmail.com>, Ng Tze Yee <tzeyee.ng@altera.com>,
 Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260914025052.14354-1-genevieve.chan@altera.com>
 <20260914025052.14354-2-genevieve.chan@altera.com>
 <20260915-therapeutic-jackal-of-temperance-1ae852@quoll>
Content-Language: en-US
From: "Chan, Genevieve" <genevieve.chan@altera.com>
In-Reply-To: <20260915-therapeutic-jackal-of-temperance-1ae852@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0109.namprd05.prod.outlook.com
 (2603:10b6:a03:334::24) To LV8PR03MB7398.namprd03.prod.outlook.com
 (2603:10b6:408:18f::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR03MB7398:EE_|SA3PR03MB384319:EE_
X-MS-Office365-Filtering-Correlation-Id: b38254be-8efe-4795-23e5-08df1e2f7ae8
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|11063799006|10067099003|55112099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kx6qc3naUZSsRYeBnSosda1I317UDhETZbME3ipwS3MMmnnFC4D7f34IJ/gofFj+BPmCEO8jlW8nkbrSgeLdH0LlMxzKU2m4M5eU5M2l7Xz/F2WF+MJ+lUEGCLxTtHh908eCjTGJRP2HaFXJaB529j5XoEPFRkLJEx+CEHfZVpShdsKHuuub9teBt8RXThBLi0L6ILGJ7NnTGGNQnLgbrsQtDj2xnEe/Fw8zfazQMfYV8xIHBOcOYkBfjoVUYgrxJ2Mi7nUrZU3qARX9Ec6uBKh4JpX3+qaF0xd3rgKyDc/MWMk0Y09EIxNVUZ/p5xCoN18QyNVKQBdWXFNl6CETu5r+ORM4hMIOXUurCRCkUmPX8xiFl+BOSYdNHtz65iktTuPTIvU59952OwoTt7aVHZeEfq6dLX+ZLNZvt7rK+UssM4/yq/q08wTfrrOthKkIDKNIZQjTomdU1xU6pv5UwW5F3JMfBnYaezHpA548KUbd71j/zymdSRWFz2XPAdulcGOKokU8wFXgJTGMsF8CqTjpakTHiHyms7HRZ60bx0wlyev4G5Uk7u9vpDolqPr4H2eV2otCRNtbuXKrGFUSN7lXgQGyyUXueavEWsx1LwegOP7Z5pdTYB2WmkOinX5oO29pLbwPa0g+YCD61KQLLg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR03MB7398.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(11063799006)(10067099003)(55112099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2JrRDlrK0lYclpwRHgvK2FBejNrUUxRUWQ0cUNTVTJMTlUzUDB4TGRXcDFC?=
 =?utf-8?B?dXV2bUNWdHJzMjNOclVFMHlFNmpyS1BoTDZYTVAzWndIK3hOVGZhNThlSDBC?=
 =?utf-8?B?bDNhT0VxZjVzaktIUDB0enFLZ21md0pxMDJmaEhUMGIvcE1Rd21PUk8xS2Ux?=
 =?utf-8?B?SFVJK3oxWU45WVpVMVBGU1JPTENqaTZkZll0ejJjeG9qa3lRSlJpMG5wR1Fn?=
 =?utf-8?B?WWhZcHI2dXpwYlJpQklubC81bmk0THdtZi9kL3FoWmJJYWM3VHZsTjROYUk4?=
 =?utf-8?B?K2JSNFoxOFNRS0JMUDQ3NWRTL1JaUVo2UDQyNVJvM2ZSa2xKQXBDTTBHWU11?=
 =?utf-8?B?OTlDOElHeE9LNHRsbEhQMTRIV2tkUjNPamlGUitsNXZoV3p1ek4rRFFQVzc4?=
 =?utf-8?B?cE9WVStzSHJOOVpDOEVYbmlWN3VuQkZzU1FObC94MWwrQTNtUnVPems4NUR4?=
 =?utf-8?B?YXBMVlFBN1l5MXdwNURNcldYeXhyVml2UmhQdjlKWmtIYk1PR29LTDZYTFJO?=
 =?utf-8?B?dE9MSFJxSkxiYXFOU1paUEZydmRRcVZGMm5KcDlXU0R2QXJMaW9WV29OWW1l?=
 =?utf-8?B?WVdKSEhncWxoVDN4UWh1cnFEbU90K2tyU281U3FTT2p3NjlpUHJhYmllMkx2?=
 =?utf-8?B?WUNMd0puRmZmb3ZHUFhiMVQ1N3FFNlIwK2dSU0dZQTU4cHlXTnJPb0VnTXA5?=
 =?utf-8?B?S1FGdU0vUUhxNE9GMVJSS1djOTBZeUpWRUp3cm9oYVoveGtRZFpWSFgyTUIy?=
 =?utf-8?B?MXBHY1lvd0tCekFZcDNjUFU5TWpmSjRwbG1nWTZxaGJhb1JCWWJxaHZ1ZnQx?=
 =?utf-8?B?c0dyQUh6RVhEazBBdVJnOExqRW1seGVkbDd3VXg1QTllTTBycWliYWhSZzNi?=
 =?utf-8?B?NWxGYTNLWFpsL3Y5cnovdktsN2VCdU1sbkh0RWlWUTRlK2pWdGg5SjZ4YU5k?=
 =?utf-8?B?clovOGhJMFl1R0ZNMUJNT09INU52WHJSTTRMcjFYUjBEdHg4NzdXZWVFN3Zi?=
 =?utf-8?B?OFVwZ2NSMXUvZlZKcEJ1Ti9JWHU0bEJDZTdGYVNUWjJ2UytHZ2gwS0p1SmJY?=
 =?utf-8?B?aVJaMGFWVlBnL1ZYSnBWTzRIczlkWUZGcFl0bFBLdE4wNGxIOENqcGZPQk5U?=
 =?utf-8?B?dGhweGR3bnU0NmNjRWp2SW80R1lQd3gvZDRicUZERlFITTl1RlAzQklwMmJH?=
 =?utf-8?B?R0tLV1J4MjFaK01XOURqdnFoUUxFQ0FwdlZacWZNT1hxbFZwYy8rYUtpN1oy?=
 =?utf-8?B?WlpMVUl4SHJsMm9TVlNmS3dVYnRQb0NWSDFvUDNVaFRmbzJaL0lGMGQ1OXQv?=
 =?utf-8?B?eW1QU2ZLRzVySE5QREpDam0xS0g4M2ZOVFVlUkJTL2MveDhOUnBmT0lTaktr?=
 =?utf-8?B?WGc5NWtENFh3emRDLzlIajhyMjZhcTJOajBuMGhEUS80QmlmaG9xMC9FOUUr?=
 =?utf-8?B?Z0FjTytPVjhVNFJ1aklISGpLSWNTdkl5QXpDUXAvZ09EcndVNTNMQnpjU2VK?=
 =?utf-8?B?YWlnNEozVzBOVHIyT1NjckNwaUtnKytZYWNRVlhoRUJ2N2RSZ3lsamVjUjBy?=
 =?utf-8?B?M29sSVBndVNLMjVPcENzMC9GWkVvdTkxcDFnQVVWcTZYN2tyb3U2TEFIVFJv?=
 =?utf-8?B?MFNLSnhDWWNUTXVNZi9yUkdOMmMxN2sxdmdKQVQzOTErNEQ3aWdjQ1F4Y21U?=
 =?utf-8?B?bTJocHk4NGl4U1oxZlFwajRIS0FtbVp4RFJxWkJYdk10cUx2ZWhsTXcxOEpT?=
 =?utf-8?B?VFMzQm5zRmlibGhlR3lMTDNaeDZNVXh3UURMTWhXeU9jTDM3M3dHL0g3L1o2?=
 =?utf-8?B?ZVVMSjBEdnVyOFNKUzUxMllVcEdLVzBQaHI2SnBxTWcwZzBaSFZDeS9keWd5?=
 =?utf-8?B?d1lsaHRFbGpZZVVqMXh3MUMweUszOTRsRGVxcGRMa0hhVGozelZNUk9GQXNw?=
 =?utf-8?B?RzYzMXJGWVBuY3h0TGFkRWZpVmk5MThYTFlKYnZ2UUVkS3NPSGp1N3dQR0tn?=
 =?utf-8?B?blEweWx4MjlmOWVDSERGY2R2dTBnMG5wb3hrc0hqeXlIQll2dlZOT1p6VDN5?=
 =?utf-8?B?Z1JxVjVCWW1MeGpPd0MxRmFaTTZaWHN2TU9ObDZzREh0Q2ZXaUFWN3ZLbk0w?=
 =?utf-8?B?dkFnOTZEOGVUNDJ1WHlSNW1TeFNncVVjVFg3NGhIdFhKcEVWTjE2YjVLRWhl?=
 =?utf-8?B?eWxDSHVMNFlGVGhEQWorcWNPNUZJRVJMSVRFVFEzcllnbGV1UEpDbGJCcTho?=
 =?utf-8?B?SE80NTlWalEwQ21ZUWxIL3RPZ2t1dHVNeXBVSGZHT1J3OXBYdENwQ0Y3M0ZK?=
 =?utf-8?B?MWVIYk1UVXpwT1lQWlJGT2ltN1VHb1ovV0F0Y04zclpVdW8xQmM1bmdZZUhh?=
 =?utf-8?Q?t8svvm29pyT8X6/A=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b38254be-8efe-4795-23e5-08df1e2f7ae8
X-MS-Exchange-CrossTenant-AuthSource: LV8PR03MB7398.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 13:42:18.7706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eo/wOsaPwu6qRoVmW2lIENfvZ8kliBFIUkbSVhJbR0FoOe+ACosFXCXM6R4yDWA6SE13KaoOJo+mmGiBon/A7G67pnXT0cgUedeALo1ZBJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB384319

On 15/9/2026 6:49 pm, Krzysztof Kozlowski wrote:
 > On Mon, Sep 14, 2026 at 10:50:51AM +0800, Genevieve Chan wrote:
 >> From: Genevieve Chan <genevieve.chan@altera.com>
 >>
 >> Add "intel,socfpga-agilex7f-socdk-multiqspi" for the Agilex7F SoCDK
 >> board variant with multi-QSPI flash support.
 >
 > Why is agilex7f the same as agilex?

Hi Krzysztof,

It is the same SoC. The original Agilex family was renamed to
"Agilex 7" when the Agilex 5 and Agilex 3 families were introduced,
so "Agilex 7 F-Series" is the current product name of the
Agilex F-Series device. The silicon and the HPS are unchanged, which
is why the board uses socfpga_agilex.dtsi and falls back to
"intel,socfpga-agilex", like the existing Agilex SoCDK boards.

Using "agilex7f" in the board compatible creates a confusion, as it
suggests a different SoC. In v2 I will rename it to
"intel,socfpga-agilex-socdk-multiqspi" to follow the existing
"intel,socfpga-agilex-socdk" and "intel,socfpga-agilex-socdk-emmc"
entries.

 > Your commit msg is pretty redundant, just copies diff instead of
 > explaining odd things like why do you have exception from rules in
 > writing bindings.

Understood. With the fixes mentioned earlier, there will no longer be an 
exception to the naming rules. In v2 the commit message will explain how 
this board differs from the standard Agilex SoCDK (the multi-QSPI flash
population) and why it needs its own compatible, instead of
repeating the diff.

Thanks,
Genevieve
