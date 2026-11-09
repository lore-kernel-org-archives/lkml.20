Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259478;
	b=X2w1gFt6r+f/SPQFQH8FcA6djnMOXbcwWgPT+4UxCmwnX+nWhQQKEHregaSFpturPwX7
	 aDwCN8Mta/dgImXknoOrc1BwEe89BdJeBjBjR5K1Pxym0fMMadtYvALF+K3KXs3Wmzufj
	 Nvx5VexbY0MrVgUZ+qodBa9pC7+1g5Io2YwYxee17xhWJU0X697+8POT7x+ex9Fx2P8as
	 un+C3zT/rsCOTKefW6WlqBiJPvxShhL6dgKDsgxLjEUReFfWeoa46bon9hrKK85uC0bjv
	 +sK8qOTK/CdQjjtB55h/vdyIEDMR7FBXpQqDjbiHZGVqihzzISrNGJY1xvb3Cg4uuhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259478;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Type:Content-Transfer-Encoding:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=nUua/tbbWwlMaCeJNjDfhyBL8S5KxCqgx/q4yCyX3M4=;
	b=2Dfx45eaVtbryYTNOdU3Zs9DAIP4tNF2Y8RrS4QAtV0mjjQSsks3HDP1pmCYNOBpew96
	 bT8Lrb5SdsU64YTg4R68O3X7C1bDnqjtIzARnFFb9f4NjbG73gH5mP/pzw5UroxMtndFZ
	 5IZLCZgq8Qi96y2e2z5DjVYRK3VGwFveIyRpj8kh1eCKs0ReYObo4OQEra6Nt10x6R089
	 qnC8pj/EncenqC2BhKUDf187rtEUeb/aKaGAOPSog9BVBsz9rJaoQBH8xvCgMaV4W1jd2
	 nprrqh+5PifglQF/xkjLvDRbXL/NaSYS9cJGrIgBxTUml4YUkY9DSVXYoqdzg/MdHeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BRYyMCuK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.36
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010036.outbound.protection.outlook.com [52.101.201.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EBF606A333
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51EBF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BRYyMCuK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBbUPau+5j5jxdN4I9CXtFBWqGdhAddQrrWd8uusLRTeo40JbXSalZ6nfZzbo2iF0lYsY0VBEm2ZyqgLng9OmWTdF4ysIYimdZbFKPFVxVWgU2yRXP5FcZROuomigfvBzk0eWNmQXxtYZLvJr5AT7hUn147IWbU5XnjiV0+O74xt2qAvztyvAOgt+0ylWCSsUFUiSOR/1eJ75/+JsfGLZ/jIrijJPc1JZ+b66Odv0yW0n9MVkKFy/ljLSfFNxw9CL3UaxGKSJJbNrVI4Lpc3/RhYA4IVZgQuC2TMY9LQkiLEo5N0QlTXB7dXng1eyA1D/ZDUYCy4TYv8W14DrOB7dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUua/tbbWwlMaCeJNjDfhyBL8S5KxCqgx/q4yCyX3M4=;
 b=I394z6kxvn4zc8GgRekXxnsP2QqrqX7k3euq9hJIq+bjtCcxAf+ar3W7RLwY2TQl48SIMozZJ3yaErVMy55PWK2NkUhXptwq6xEYHljlTZXOdXrN0ND+y7yrecwFFOwWTC7/TfvpasyxQ6mewvcyknwsj4zOMq4/w61P/pk1Js7isEaJx4aGYxcqGyebNUUhybPiftllo0aNOXpD5KsvM4Uz9654PiStbEXz45h+Dyj5q7ObjuJ6D78H7/lss9EjtYV3PHTiJR9AOEXG7dQsGa7T9/Ad3Nh4euMe+mID0Ms0XJKJtxIMLvxgJTw7mLGUV3CwYl1lHwGVYtpdLgMxww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUua/tbbWwlMaCeJNjDfhyBL8S5KxCqgx/q4yCyX3M4=;
 b=BRYyMCuKNknopg+JpBbRu3saOIuCz9HOHz4u88XRWVRpwaFWAJ+S4f8WCaD8Y+M/ITWrh85BB1INFeQUX+a8YFsaU1bQqnOgAdf3i/yc3ZJTzF2Ccm7B6Gr+l4nx61FvBntnKX92UwQNyimYl+hV3u1DeCwjuts7WfQ/nkKMipLpU+GeQ7LWZQKb8+x3tp0iPGpvghH5hcLvMrueNbuj/9deTxeL6ABEBJcl5CPmfXhziMUsaeSaXOA5WLkEy6iJ/bCjKzW0606Qobg7FKrPHhLY4aGVXhpXsMbvBY0LyidEJ3KFzP03LyMrW/LHB6vd9ET7M83TY9zhJLYBCtv3yQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 21:24:34 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:24:33 +0000
From: Fenghua Yu <fenghuay@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Will Deacon <will@kernel.org>,
	Dave Martin <Dave.Martin@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <fustini@kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Newton Liu <newtonl@nvidia.com>,
	Richard Cheng <icheng@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fenghua Yu <fenghuay@nvidia.com>
Subject: [PATCH RFC v3 00/15] arm,fs/resctrl: ARM MPAM memory-level MSC and CPU-less NUMA nodes
Date: Mon,  9 Nov 2026 13:24:12 -0800
Message-ID: <20261109212427.1409204-1-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::9) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|PH8PR12MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: f5d01967-b593-4b3b-d3b0-08df3ea7d909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|18002099003|6133799003|10067099003|3023799007|921020|11063799006|56012099006|261028144727099003|261102123227099003|261026121527099003|261022075727099003|261022105027099003|261021123027099003|261021121427099003|261026140227099003|261009223027099003|260925021311599003|260925021911599003|260925022911599003;
X-Microsoft-Antispam-Message-Info:
	7dDoW1oobl1H+ekNi2EgntoYyIkmnlJeqx3g1XZbJzHGZW0LCcM3yhSuCO09XMuFEChbHQqGCvzhyV6eDGRK6NPbJpizboppeMlxUp6wCcGmM4WcMbCP1MfOw6AZX25rxdOGNKKU7f3x66i4Un25TGxtz5rwcabOOolPtel6CHFBa0iY1ncE3nNso8YOpQJWbvM+iN+hIEq9PzyuTZPTUkV9yEnXhvGmtE2e2cmf3/nD7zXkAo3/42lRmbbk1xaMJbsz9md3koSc47PUH4mdGeiDsfWe48HOPjLW2tl8QbXsxBMqQnmz0kqzYzdzqsYl3PNGtvLfPOEjQ2DfGYlCP1SVyTZswNLLS/xhFrh+BUiFFci7svxiKy7oGDcw5Xql/xkO29L7CSxNAZuTuW7yzHiuCWhvrcfWGzyr194awtLBzHxqNWuwuFx7bxerqmAPXVvaJ+JLXX3b/SB4O4hKnYI8NYcpw1qtzBm7e9zWITd+rXC7c+CT/N+DIXDBUijjhvVjLW/830aAV8CugJ6d3O8M3w6V0Wpz78DawaMPCeftOyTpRsXjFll5nJEjU08G0B7s4OUKe/QmxYprKDK8ZcEOOHHr7Ffqx5JVXaSGAjtT5b9z0eYHcB0ix0aNEgAkxQqPByox79pcSnhezFm7blKNdvmzU26XNuyI2p5Oj3XuTIzLWo8A7izrjToaUn/65hrsNOrDHpDe7rMm5UJNfg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(18002099003)(6133799003)(10067099003)(3023799007)(921020)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(261009223027099003)(260925021311599003)(260925021911599003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHJYRGRJMnZYUjdYSStqTFRqbmZIc25DVGpzb01EQTVOMnRlRERibTQrVVpH?=
 =?utf-8?B?WEJQOXRpRTNaODB4b2ZaNUx1QTRQeFFVREVVdEp3ZWFzbWJBaWpsangwT2gy?=
 =?utf-8?B?WExPdVU4cmxoWEYyRFg2MUx5SHluVkc3VDhhT0I5R0gxT0lmZkpUN1ZBRzRQ?=
 =?utf-8?B?NzR6T2tnSjVPR0d3SHRnTzRSanVwUmxTbkM4Qnk4UERLNnpJLzE3UVF0dHpZ?=
 =?utf-8?B?VUtRR2p2Rnp2bS9GL0t4dkllV3MvMGRlMjBzSlZaa1BrK0FnYmlZN2U1R01D?=
 =?utf-8?B?QUxHbXNFSnFNcGZxdXNnTm1lKzdxQ3V3aDlSNzNQaU42RkpUb01EQTdzRFlV?=
 =?utf-8?B?anpTd1MyQzlMRHhCQ1FBUVlBa3U5SGZPTjNPVjZLbTYrcmdUNHZuRFdxVStr?=
 =?utf-8?B?d2R3VFVnTFZPekYrZ3BJQk90djNvamFhalZFQzRVNHBaaWowVTRRVGVZdVBo?=
 =?utf-8?B?Q0E2aVZHaTIwa1l2T3dmaEVGYmgwanZ3eXIxUDhMYTFBQ203TlNzMURqOWNm?=
 =?utf-8?B?N082KzdFTnZBVkZ2VmEzNlIwcGtoK3B2d1hJWDZXYndhcjZPd3d0RGFJelZm?=
 =?utf-8?B?SkJNU3NMUlhrcmhUK1NzbGZTSUZ4TFIyVnBHdnJ5ZHYwdzhWSHRObmVaUjFB?=
 =?utf-8?B?WXpvZ0xZeDAyMjNsazl3NmwyQlhWRHZGR3ZpdURKMUo4TlcrRWVUVTZvQ251?=
 =?utf-8?B?bzZ5QThxQ0hNN3pzbjNGZUk5Yjd0Um5kaC9NM1IzUzF1NGdpb3B3Y2RGWVNl?=
 =?utf-8?B?ZHh5Uzc4S1dXclJyL0oyVXh0SHdDSVhaeHZweGorOE00M1lZczBoSWFhR2Vl?=
 =?utf-8?B?Y3BTelZiMEpkVlgwaFlDMTBjQjQxVjZEaFZQaG02cXNZb1F2K2RITi8ySDF2?=
 =?utf-8?B?bThsdmU1SmQvOVgxWVBQc1JCd3J1TzlDMVlvd2ZkeDU5ZkhiTzVzRVpYUmhq?=
 =?utf-8?B?R2dHUkU5dlkvb05wWDBsUjFzMkJEbFVHdDJ1WkVCbjNHRkhGa0dyNExVUER2?=
 =?utf-8?B?S2NhSzl1TkNGTkhNMlhsNzB2R0RMa2VVM1k3UnNselFkS01xMlluM3dmSnhX?=
 =?utf-8?B?RCtVQWovVWFsb0t2WWpiQTRqK0xnRlJhZ0VDR05ZRGVucEZweHo4cXFHUFla?=
 =?utf-8?B?M0NwaFpoZk5MUDl3WFZGNExZQ1Era1pkc2FQT3l4dTA5Vk9UeVQybi9CcTNI?=
 =?utf-8?B?aDdocVhPS2MySVhsdjdadVB5dmcwRTg4TmRlZ0gxb2VkZXorSlM1d2Q4U1dD?=
 =?utf-8?B?MmozWjJPZGdmU2laTW9GREc2ZmZHMkEyNUFzQlRVNHB0WjZLZy94dldwTDNE?=
 =?utf-8?B?d1BGeVBPcW9WRzduWVZndmt5dFlJY04zWHoya0djU213TVhYQzY5Q3N0OUhV?=
 =?utf-8?B?SjJaQVIxcmtvT01wS0ZUVnlKbndLc0hhRDcycWhDUjREemtuMmZub3ZBcmZo?=
 =?utf-8?B?S0VnaXkyRUQzR0xSZlpkMkNwQ1dIMk9MRHlMT0hFNytQNFN1Z0d2OFJSMXNk?=
 =?utf-8?B?dHp2RFppRU55aWFoc2IrNlRoOUVJZW85cVNYWVkwZ1ZaUlBqM0k1V0ZBUDBp?=
 =?utf-8?B?M2FucnhjQ01RWHhWK2xMTGk0ZEUyTVRaaTNnMTdJWWFsMkU2TXZQQUtCbDBH?=
 =?utf-8?B?R2lMd29rdFFyc3RZU0o3MTNuazJpK29YMTdRZFdDQ1l1dS9MdzI5NDlReWND?=
 =?utf-8?B?RlNsdzNNd0xPayttS2FXQWhBRjhLZDRWQ1ZQbDg2VmRqL1NEY3FEUThSMk9E?=
 =?utf-8?B?Y0lpSGlPR0FjU3JpN1pLZXFZbUk1eElxMDZCNDhPeHBsZGovdmJiazFkRS93?=
 =?utf-8?B?SFVlV3hQek9EOE5RWFB5MzRLMXQ2MDhLeWVNRHM5N3lvT0Z5MVk3NUFRcTZw?=
 =?utf-8?B?d3Q3ODNXSmx3QVdkNURvVHZQZ2hPcldMTnpJTDFhOCtnbnpOcXh4Nzk0TGVK?=
 =?utf-8?B?ZlFaMnBLSE9iRmpGd2k1MGhRZG1UdTFzcjdvOTlFeTZxblExd1VIVTJnNjJY?=
 =?utf-8?B?QnB5R3laU2FYUkV5SnVTUXAvZllkeC9IcVBqSzEvYndMQVRpV1Avc2ZERTNE?=
 =?utf-8?B?S3ZPc0pkZUlLM1JiQ1hpKy9Ea1hvaWxnSEhwTWtpUkQ1YTNRQm1KK2NyS0Mr?=
 =?utf-8?B?YS83clZoRlA2US9QK0FuSEdGOFdBSVAwZXZ0bUpXVFJmNXVQeUk3bnlGbWRl?=
 =?utf-8?B?YmdWL0Z0ZUxDYTR4dnZLZnM0RzE5NEhBRDgzWGZTa1ZkQ0FBMVg4dUVpSm1O?=
 =?utf-8?B?aGExSXBRRzBERHRDaXcxaXhHZlZYWGJUZ0xVc21mNXNJdEVOZTFWT0pjU1gz?=
 =?utf-8?B?S1NIK2JHZjNIUXpkY1BaQ2dnbVo5WFlxWlZmUXEvckpjU3Y1YW53QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d01967-b593-4b3b-d3b0-08df3ea7d909
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:24:33.3062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7x+H6xOi63DqaPc2aqql3HJXV/BxvrBmnQ2QM6S9yo8z12sJJ6aRH2tZdFWdTRl9f6ZulUD2HNZfd3G77xBBKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7110

This series extends memory-bandwidth monitoring and control to ARM MPAM
memory-level MSCs, including CPU-less NUMA nodes, and documents the
resulting resctrl interfaces.

Background

On x86, MBA bandwidth control is typically associated with the L3 cache:
schemata lines use L3 cache ids and monitor domains appear as mon_L3_XX.
On some ARM MPAM systems the MBA control and MBWU counters are backed by
a memory-level MSC rather than the L3 cache MSC.  A memory-level MSC is
represented as a NUMA node, and that node commonly has no CPUs of its own
(a memory-only node that still participates in bandwidth control).

For that resource the schemata line is MB_NODE and its identifiers are
NUMA node ids.  Monitor domains are named mon_NODE_XX.  MBM counter
assignment is exposed as mbm_NODE_assignments.  An L3-cache MSC keeps the
MB schemata line, mon_L3_XX domains, and mbm_L3_assignments.

info/MB/control_mode stays legacy.  emulated_by is left empty, so legacy
and native mode expose the same schemata line.  MB is not emulated by
MB_NODE, and the assignment file name does not follow control_mode.

Because the memory-level MSC lives on a CPU-less NUMA node, the driver
must handle nodes with no local CPUs.  mpam_ris_get_affinity() derives
affinity from the component's NUMA node id, so a memory-only node would
otherwise end up with an empty CPU mask and never be registered.  When
the derived mask is empty, the driver falls back to cpu_possible_mask
(masked by MSC accessibility) so the node still gets a resctrl domain.
The borrowed affinity is kept out of class->affinity: those CPUs already
contribute through CPU-ful nodes in the class, and subtracting the
borrowed mask on teardown would remove CPUs that other live nodes still
depend on.  Domain setup iterates all MSC components per CPU (keyed by
component), so each component — including these CPU-less memory nodes —
gets its own control and monitor domain.  A memory hotplug lock and a
NUMA node notifier bring those domains online and offline.

Examples

** Memory-level MSC (for example a platform with CPU-less nodes).
   control_mode is legacy by default.  Both legacy and native mode show
   the same schemata line.  Domain ids are NUMA node ids.

info/MB/control_mode          # [legacy] native
info/MB/schemata/MB_NODE

schemata:
MB_NODE:0=100;1=100;2=100;10=100;18=100;26=100;34=100;35=100
     L3:1=ffff;2=ffff

mon_data/mon_L3_01/llc_occupancy
mon_data/mon_NODE_01/mbm_total_bytes

CTRL_MON and MON groups expose mbm_NODE_assignments when MBM is backed
by the NUMA-node MSC.

** L3-cache MSC only (no memory-level MSC).  Both modes show MB:.
   Domain ids are L3 cache ids.

info/MB/schemata/MB

schemata:
MB:1=100;2=100
L3:1=ffff;2=ffff

mon_data/mon_L3_01/llc_occupancy
mon_data/mon_L3_01/mbm_total_bytes

CTRL_MON and MON groups expose mbm_L3_assignments.

The patches can be compiled but not tested on x86 yet.

The 15 patches are grouped as follows:

1. resctrl monitor infrastructure (patches 1-5)

   Generalise the monitor infrastructure beyond hard-wired L3 paths:
   de-hardcode L3 monitor plumbing, expose MBA MBM counter assignment as
   mbm_NODE_assignments, name node-scoped monitor domains mon_NODE_<id>,
   add a node-scope MBM total event, and make MBM handling resource-aware.

2. ARM MPAM memory-level MSC (patches 6-8)

   Map monitor classes to L3 or MBA, initialise ABMC on the resource that
   owns the MBWU monitor, refine class selection so a memory class can
   back MBWU, and iterate all MSC components per CPU when creating
   domains.  A memory-class MSC names its control NODE, so the schemata
   line is MB_NODE.  A cache MSC keeps MB.

3. CPU-less NUMA nodes (patches 9-11)

   Take the memory hotplug lock with the CPU hotplug lock, fall back to
   cpu_possible_mask for a memory MSC with no local CPUs, and add a NUMA
   node notifier so CPU-less domains come online and offline.

4. Documentation (patches 12-14)

   Document mbm_NODE_assignments, memory-level MB control and NUMA nodes
   in the arm64 MPAM guide, and MB_NODE schemata lines and mon_NODE_*
   monitoring in the resctrl documentation.

5. Test (patch 15)

   Add a KUnit test for CPU-less NUMA node affinity handling.

Apply the patches on top of [1].

Testing

  # KUnit (CPU-less affinity)
  sudo cat /sys/kernel/debug/kunit/mpam_devices_test_suite/results

This series is in https://github.com/fyu1/linux/  cpu_less.rfc.v3/
which is on top of [1].

Change Log:
RFC v3:
- Drop MB control emulation.  MB is no longer emulated by MB_NODE.
  control_mode stays legacy and emulated_by is empty, so legacy and
  native mode show the same schemata line.  A memory-level MSC shows
  "MB_NODE:" and uses NUMA node ids.  An L3-cache MSC shows "MB:" and
  uses L3 cache ids (Ben).
- Drop the MB emulation kselftest and the emulation documentation (Ben).
- Drop mbm_assign_scope_mode.  "mbm_NODE_assignments" is exposed when
  MBM is backed by a NUMA-node MSC.  "mbm_L3_assignments" is exposed
  when MBM is backed by an L3-cache MSC.  The file name does not follow
  control_mode.
- Series is now 15 patches.

RFC v2:
- Remove fix patches 1-2 which are implemented in [1]
- Remove the emulation patches 3-8 which are implemented in [1]
- Update emulated_by to *emulated_by in patch 11. Ben seems
  doesn't like to emulate MB by MB_NODE. If that's case, I can
  remove this patch. But for now, I keep this patch for further
  discussion.
- Add patch 13 to implement legacy and native modes to emulate
  "mbm_L3_assignments" by "mbm_NODE_assignments" in patch 13.
- Add patch 9 for memory hotplug locking (Ben)
- Add patch 12 for memory hotplug notifier (Ben)
RFC v2:
https://lore.kernel.org/lkml/20260831172245.42253-1-fenghuay@nvidia.com/

RFC v1:
https://lore.kernel.org/lkml/cover.1784217438.git.fenghuay@nvidia.com/

[1] Reinette's resctrl control branch RFC v2: git://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git branch resctrl/controls_rfc_v2.4

Fenghua Yu (13):
  resctrl: De-hardcode L3 monitor infrastructure
  resctrl: Expose MBA MBM counter assignment sysfs
  resctrl: name node-scoped monitor domains mon_NODE_<id>
  resctrl: Add node-scope MBM total event
  resctrl: Make MBM paths resource-aware
  arm_mpam: Support memory-level MSCs and ABMC per class
  arm_mpam: Refine L3 topology and class selection
  arm_mpam: Include all MSC components during domain setup
  arm_mpam: Handle CPU-less numa nodes
  Documentation: resctrl: document mbm_NODE_assignments
  Documentation: arm64: mpam: document memory-level MB control and NUMA
    nodes
  Documentation: resctrl: document NUMA-node MBA domains and mon_NODE
    monitoring
  arm_mpam: Add KUnit test for CPU-less NUMA node affinity

James Morse (2):
  fs/resctrl: Take memory hotplug lock whenever taking CPU hotplug lock
  arm_mpam: resctrl: Add NUMA node notifier for domain online/offline

 Documentation/arch/arm64/mpam.rst     |  95 ++--
 Documentation/filesystems/resctrl.rst |  54 ++-
 drivers/resctrl/mpam_devices.c        |  59 ++-
 drivers/resctrl/mpam_internal.h       |   8 +
 drivers/resctrl/mpam_resctrl.c        | 664 +++++++++++++++++++++-----
 drivers/resctrl/test_mpam_devices.c   |  67 +++
 fs/resctrl/ctrlmondata.c              |   6 +-
 fs/resctrl/internal.h                 |   9 +-
 fs/resctrl/monitor.c                  | 226 ++++++---
 fs/resctrl/pseudo_lock.c              |   3 +
 fs/resctrl/rdtgroup.c                 | 148 ++++--
 include/linux/memory.h                |   1 +
 include/linux/resctrl.h               |  31 +-
 include/linux/resctrl_types.h         |  15 +-
 14 files changed, 1079 insertions(+), 307 deletions(-)

-- 
2.53.0
