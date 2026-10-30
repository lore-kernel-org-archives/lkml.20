Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793354052;
	b=sQIivtTpJdkGrMZdAYFsItC7sCj/FjFA9ZZ1Gv2O+Ev09i8vMhPBuLAGaW4oK2+/8nPq
	 nOSsCeiKPVKbzBhRIaPQKdbTA19YDBs3SXup1GwNp+sCv33btfCXCXac65r1c58fIgCJk
	 vhJux5rmVy4JKVdgbqDGG7d9LxNQ940lqQHjVtKA9b3LQ44xVZS0BOAegBP5crAr77mp9
	 VhqdWVDGyoy5DQ1JLEtyWkyQJdoZ+5SiYb1IANGKP8FE+GHfnpRwLiCJgtEseuVdksn1m
	 IeGXKQenNIWw/kTQLmzR513VZ+moexcm4tCp8VOMh17Um+stVwaAo2swV7EdU3wP7Aw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354052;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
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
	bh=HCgCejc6+zP1pbPlX4yCXRHt6PU5eLCOTkjqxD0njr0=;
	b=n5Tg/ZvMeL9WlyHrZjl7rT3Ubq+3Aca16VyGSY3JUfAT1qmXgTaVPMQBF7HIU9587TVv
	 i1c+aPKidT//FiZsQiCxaJQERLUNLOIThtC8/Ru++k8I0jy9Sn/5UFFy7zK2vCIrlBNSi
	 qOih+ar7NY2JdZJsX326AwZoXF0PAT6UpjuuRVRZb5Q1M5BAwFw/ImBmkbWDwsDr6Jsxe
	 2ts0Eg0shKUVqJBFLiXaO06uuhbFnQ8I7LHF18BqvMLq8DeExR06wt7vTJAXxdqw7RJgw
	 iH1LPfW6+wfFgdc6IJDENy2GlhvRTy6Yr4AoGNIMctEB+Zy+nZvrKiKDTqXv8RMn56A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=V0zLRbSp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.60
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013060.outbound.protection.outlook.com [40.107.159.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332E160A2614;
	Fri, 30 Oct 2026 09:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 332E160A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=V0zLRbSp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WTjQc0fD3D+j6+vL8c3v7XnYh3fD6WR2exlmb+Hpf/vCtAPhty5EJXAj4lw1lV1pZ5GKl5jKFeQmXjcmwSkxUyMU99lAxpk6I4HkcqtZdzhkwjMURNTMPidM7mrr7NjTdb0KCDJprvgtTOR/BckDJTYwF5LkCauSxF7ivvHBEP36daztbnBfsb9JeRF0MVrsQx5VjP+m8b2cn6adrigySyUZJrpOk+LoQfvRaOtQq+24Zlhv8mXMHpplycVeDvt5YJlWTbOhzddan5maDjKaWdIQojuV5BRgeiUP+Wq7qg7R9GgQkFCTF46IoIiFImMdcqap9Bq0OAH96aJNJZLxeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCgCejc6+zP1pbPlX4yCXRHt6PU5eLCOTkjqxD0njr0=;
 b=uqvAgAG2IXkIZPKi/FiVJiBStvpKuTIAPGZNOeunbJsEqXLUxm/l8tqxqgHLlEH33gyB+wPOYv7pu53wob2ekQlMJuh/QLHOEOGhpXXTkdan7vNM0Ouu6yOZMaidWeKURG7OrzurP95+0wkArNkXdaXBirZaPKHsyzZEc1CWX7ygUQTlDXavZ8lPybyjA6f0ANa4hfqbfR1g7nAIOtEhHDbswIOI5cFoo2IVJiMElebU6xdugmVODUPDCGljo4YLIPB9DWqjCwpDEm7LbfC924vpfvjtXE22HfcNkZv4OJNNsJuHucWj988vNU7Up8NZLmOJePd5hY8El/bypSlbVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCgCejc6+zP1pbPlX4yCXRHt6PU5eLCOTkjqxD0njr0=;
 b=V0zLRbSpMLr0BvcTqtqbx4xcZp4PMKOYnHz2yEPs3fYDzBXUDTq/UGaywBnDfmsAo6gcgDggVTHsL8osNMfAIZ63TvKUhxJ5NIMt8xzLKQcoowSdxSFm5f48ZnRCe7Q0fD+VT/XkNAeuDN4ZvqB5XCITtelN2gbJLZ4pRJSg/xfWzqVoFywERK74AEYaLhPftVwojEt0Cr2WX1ru9Zle6AhMX4JKEmE5zOUhHvEaywGYHY/W1jupopwCkQBS0GRb3/Ig6w1KXTfha4idPQ0FwHJgRfgKN7Z8vO9SKi6xDm3HiaXwvYZU0W3euWmkFum/XpS26ISk/gPuGcP+QhV4PA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com (2603:10a6:290:c0::7)
 by MA9PR04MB839208.eurprd04.prod.outlook.com (2603:10a6:250:103::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 09:54:09 +0000
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151]) by MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151%6]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 09:54:09 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 30 Oct 2026 17:54:36 +0800
Subject: [PATCH v8 12/15] drm/imx: dc-ed: Drop initial source selection
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-imx8-dc-prefetch-v8-12-c4f81afd4533@nxp.com>
References: <20261030-imx8-dc-prefetch-v8-0-c4f81afd4533@nxp.com>
In-Reply-To: <20261030-imx8-dc-prefetch-v8-0-c4f81afd4533@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::9) To MI9PR04MB350878.eurprd04.prod.outlook.com
 (2603:10a6:290:c0::7)
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
X-MS-TrafficTypeDiagnostic: MI9PR04MB350878:EE_|MA9PR04MB839208:EE_
X-MS-Office365-Filtering-Correlation-Id: bbdd0bb3-df0d-4303-17bc-08df366bbe6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|7416014|366016|1800799024|10067099003|18002099003|22082099003|921020|56012099006|11063799006|261026121527099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	2BAfWQG/pg9GNvG990KhHSxClFzTiT17ApfrmzPEvD+OOSSxvt1MfOId/D/OdGPbU+FVhLmLTNLwsofEH20poEfd3OuFidmgX4lDPh8pnup3laCWJ+SeurQ3SrSVUYAZcsWQeThuJVDeWL5t2OmYX5vxkl/gy3Pz7qDXzJ5AtqpGqZHgML5KEVNVi5peWDksROlUVIL466eniWiGNFfcMZPrsn9wuAYBwjEqZA393H/YB7H5aXptBzaYrg96PIoNHMLDcYiFBRBlEzNiHxJSvqRJMzX8wtU4xRjkIQ874W29SMvJsKd3AID25o//qgPGWWD91Jvs/rLsB07Y3ec9Hp5NZgEGqeb8WE7w/ODVOpRih5LNLUxxi+QAIIVuPvDygYJAYKBYKpsveTdm1NExIiu+KP3fMxb2R7zv3kU1DAwNYu4zt037qS59n8wN2Syhfw6b7yiiIraC8mRaCnlIVp27jXJqUiCHndkBblklyUT+DSXL7Gwvajc8Jt9Y+9m++fa/CNOT4MsVZQgz6hlDgtFwC5kqe3h+/bjwIwXOfM6qK1wdlY24ZiugTPkeieAb1oSiZB0sNIPqOgMQgiQfasemdjQZBs1Akgvc1CQ91Drtqhrx60mlRu8oAW1/Z854WOaGHnfmKJfTIkgBJEXPbCdUORrTGLCM/0a/IyaTzNShK2QBamDNEHlzJkZArpppHHsvJh0FvsYzqR6+OEE0gA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB350878.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(7416014)(366016)(1800799024)(10067099003)(18002099003)(22082099003)(921020)(56012099006)(11063799006)(261026121527099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEJVUFN5S1dlRmUvc0g0blVaZFRNU1Rld2FjUWxrTG13OG56SE9mRTVOQVBS?=
 =?utf-8?B?NnZORnZ0NmFGQ2szV041bWJqdzdvZUFoaEtFS0VyREdyUjJMWTIzUi9xeHcz?=
 =?utf-8?B?bUw0RkpRU3VqVnBORGRFOEFkMVZYeldIbjZ0TWd2azFmWU1pVk5KVEJFWjkz?=
 =?utf-8?B?bDZUTHgwbkhQamovZzArRzdMbS81NldYVzkvT2YwblV1aXRjZldvaktUM2Nr?=
 =?utf-8?B?WjZlN29QMUZPbGhrWWNSOHp2QjZLVVNocmMyZkEySHZ0RGdveng4Y1MyZW1n?=
 =?utf-8?B?MEJDaStvUWNpeFhDV2VpTmM4MVFQY0lKSlFad2cvSjV1cmVwc09YaTJvdlpY?=
 =?utf-8?B?QWlnaEhYSFVxdUkrWEExRDliQjJOSWRFa2FEZXdmcSswV3FkUjR5c0Vtakdn?=
 =?utf-8?B?c0VEcFFydU1lVUN1bTdNdWU3WWo1U0dmZWswejkvY01ETWVQZGg3dTBVZXp2?=
 =?utf-8?B?NGZwWVZ5NFhFclZGcFhRbHIxUFlyUXNza09aL1Q3SHdKZFdsOXJxbXh4V2Zw?=
 =?utf-8?B?WmJtVU1CYXV4dlYwM0lNVi9TbWdHdlVlc1htTXNtR3p2YzlXWTNSOXNvSDhk?=
 =?utf-8?B?cWlZLzl5MkZFQk9kZ3hKVnVFM2xwc1hNQUxWSnJIWUhNcjNOclQ3TzBUUEtl?=
 =?utf-8?B?WWJyQTB1bkF5QVZlaDgzV2ZHaTZBQVRsRWIvSFBDRVdBekZCSEFxQWRpV24v?=
 =?utf-8?B?dkcrQ3QraXBudkFxY2JQWTBkNmJGRXhRTGRRVVRkVTRCZ1ZKZ0pkTk1vcTVz?=
 =?utf-8?B?UXdwQW5ZZnMxK1hYNHE1d2d1MG5GYVdwY3dEMEZ1aUVFbE11c1BmZzQ3V3Rr?=
 =?utf-8?B?NFUzRENyMmlzeitpakZMYUIwTTRuTE1pbkwvb0dmRkNVeUQ3R0lhUWhzRTVJ?=
 =?utf-8?B?K0pzNWRCVkp2MnhEdmxkSmVrNXdTOHRMZUFkckVURWNvVmh2NXd1ZkJjM0ky?=
 =?utf-8?B?UlJMcnk1VlVFNjRVc3JvcC8wMjNNR1QzM3pERk80MS9qbU1aVS9wS21zUWgy?=
 =?utf-8?B?bi9CdUUxVkZXYkd4emtTUGNUVmVseXJpdzRKdktsNzVzNHY2eGV1Wk1lbmxK?=
 =?utf-8?B?cnBhaDlVNHFST2tOdWlBWWV6c0NneUVac3ZmV1FySWV4NE4zNjdhQnk2cFdv?=
 =?utf-8?B?OXI1WXl6YmVPMWI2WkVhWGxzNy9va2dRR2tMaXRVRFhscytsYllmSEdWSHp2?=
 =?utf-8?B?d0ZlNUF5YmJGRHUyYmxUNXkzL1FZcHczLzNFWElYZ2FlZFBlZlV6RHBDV21D?=
 =?utf-8?B?QzJrTEZCcE1mN2U2b29KTGM4b2NPNlY1ck16d29iZmd0NlQwODRPdzRyZ2Mw?=
 =?utf-8?B?ZGlxZmRtTnFYeHVqa24zeFpkM2hnVi9VYU9mMHBmSFJ6OWtHMktmanN4NmFp?=
 =?utf-8?B?UDZOcVNNTDl4UjlZZmpNajB3TDQyRHhobEFYL2F5T2gvYlV0Yk5RT2UrNWpC?=
 =?utf-8?B?OXpmWUgzR1k3TEIzTjhGUlkzZ09kMHN0TS82cXNPbURmWFI0OVlGN2FuZXVK?=
 =?utf-8?B?aDV3amlYSk5QbnhBQzJFaWJzYjM4VEowKyt2dmNvL2JjbkdjenpNQnlQWWVV?=
 =?utf-8?B?SDgxaFdLWDN5eFBQTjBpd0JSNkdxVHloZjBzT1RWY3EwOG1XMkFwRHRJNlRM?=
 =?utf-8?B?Ny9OODZycllEdzZPKzNvWVpEOTBDTTVibjdxZjVoZmVpZFlRRHJwRG85REw5?=
 =?utf-8?B?ZDJtOHE3UWVQWnVqWWh4R1lDUTJuMDdTNVBrLzlkVHJ6VEtHWTN3Z3lzT0lt?=
 =?utf-8?B?YlUrdy8rMTl0SllmaGJxOFhrcTVhZ1p5SU1HdHVpNm95L3lZUEd2VGp0eVox?=
 =?utf-8?B?ZVYveTBwVWo2Wm91dzJ2Yjl1MXArZ3ZsbjArY1BjcDloNWZYcDVKRWVvYXNh?=
 =?utf-8?B?K1dzdUFoQ0o4Y3VzZm5xU1hWZXZ1MWJMWFd6WmJvaUpVcXBHdnJGa0JIc21P?=
 =?utf-8?B?ZTFHYmhUdFlHZ1hPVVBmQXEwZVdGYWRKbklPdlBBVjduaXZNRFkySHJINjZL?=
 =?utf-8?B?NlBGV05MQ1ZjaWZDbEVUS1JNa0gwbkt3bTNTSXV4cXJxMnBhRGdmV2VrUXpX?=
 =?utf-8?B?U1pMUXBZTkpVUnZuSFhCUnJJWTdkVGdlazlOTkR2eDQwUk1wSzhNZ1R3VDZt?=
 =?utf-8?B?Q09NM0tHWXFPTlI0R0R1amx0UWR1R0RHOFMyWFlLMVFENTlETzNiK1hVRE1G?=
 =?utf-8?B?MDY3SlBlNmhmcHZJOXdsZ29HNlV3eEhIcVdsOVNpYjdCLzhWTUVZaEZ2cW9C?=
 =?utf-8?B?cHI5aFQzOHJlU3FNNElranhBWmpEeS9vVHA2Ti90ZzIyR2pZWHAvajQvMkVh?=
 =?utf-8?B?YzRYVlNuTlNpWTBrS2E2UVVMZzk4dzZUZjJZM1NBRlA2NVZ0Y3pVUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbdd0bb3-df0d-4303-17bc-08df366bbe6d
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB350878.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:54:09.5897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+6cRktogj0KgElLhySQhTXjfSxSez5dp3TyBvJkWsLnEk7r44dp8RWnuVM9SeDghXTe5zUfGPCxGgY11gbypw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA9PR04MB839208

It's unnecessary to set initial ExtDst source selection because KMS
driver would do that when doing atomic commits.  Drop the selection.
This is needed as a preparation for reading ExtDst source selection
when trying to disable CRTC at boot in an upcoming commit.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7:
- Collect Maxime's A-b tag.

v2:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-ed.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
index a4a21d0affb6..1370b968168b 100644
--- a/drivers/gpu/drm/imx/dc/dc-ed.c
+++ b/drivers/gpu/drm/imx/dc/dc-ed.c
@@ -197,7 +197,6 @@ static inline void dc_ed_disable_gamma_apply(struct dc_ed *ed)
 
 void dc_ed_init(struct dc_ed *ed)
 {
-	dc_ed_pec_src_sel(ed, LINK_ID_NONE);
 	dc_ed_pec_enable_shden(ed);
 	dc_ed_pec_poweron(ed);
 	dc_ed_pec_sync_mode_single(ed);

-- 
2.43.0

