Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020141.outbound.protection.outlook.com [52.101.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2F344AB6C;
	Tue, 15 Sep 2026 09:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463391; cv=fail; b=iS76sVTR0RwNHTyx/bw35MGnTCOIeRkM13Uxpjeah+GjUD8i2OGdorklypt1xIDnbfW4y/GceoZMAIgIi2cFoyZz11WN+JP4+aEw1nskrxi99ugUXbv59QCT23uKYL6m9dhUQk6mtlI3p7RpeW1yEuRTI5n7OYz7qxCXHGMwoEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463391; c=relaxed/simple;
	bh=kCxiZJpJ89g4M80xSkT6SG5rPd45slw35Etgo/PMy1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OCFq6hid80wEZori0LZj8De80I4d3lh/BTU+eXQJeR+ndoOHPVpdbsqK0wWBrXKCa/gHs9bxzMAVpeh7/WEQOIp0lywuDHE4q4MDke6u2tBWDThpSox+iY5fhUqJR5iyqCmepI/WSczY+G7ZZ7zaZdFKLeeWkrWk/lJxpxmzVbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQ4wGsLEKhNYzoPa8H92ZJVQ/vLhSmszxTsIDqGlKZreODwSI0RZOb000d5WOFvvTjoWBuZXmJw56qg+GBWk1Lt8xQ8g5cdhAuC0Ao237agfoTEbf/OMurwyXNs6cNbyFa5s9Dc3q4v23DGAVlGgFv7YmwAj8LBAABf118ILLdnZ8mf3RG2LjMny/j6P1ye2TKFLuM2LFGCoyabIwKRlufaTgwk8+8OgvJxekcJlbQ1E9Io2YMola75nJJskYS4/zq/H3XLfZgDMZaZGdexa/y9sfOpU6Wcf/1s12eGn9HzTJsz4ssMSRNroBPg92PgDWBlf71P5J6h5gDf7pMtOeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCxiZJpJ89g4M80xSkT6SG5rPd45slw35Etgo/PMy1A=;
 b=E7CqWDCiZ8HJFs8rTqHIb5wxb4LqvB/orc5GmFjDsuCbgimNysh0J4ZmzLRxwOSU+gxv6xnpX31/gEE0msD+h2+iyjVHi74k5ntyZLj64TIN0tj6kWpRib6uhU7l6UnoZ6EM4GsUjoUkj/TPn/HM6IteW1a/hggajmp62QfKgqfVtiU+9IKagn1b3BC9+EbcDcbmJPBwK+blzKOWcqxft7ycQGtFG0rj9RW8G0g/ghDCp0cbPTEVdqwaRz965rd4mMGYyRVTggHpXhxSdpUi4MAoEbLXRS1TFkjUQcaNLT6nh69YwNqj2woN+5uP18wpUDLJimE6CIJfAnO05uW+YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB5156.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 09:09:46 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 09:09:46 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hitesh Patel <hitesh@ebytelogic.com>,
	linux-media@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com
Subject: Re: [PATCH 2/8] media: qcom: camss: create the source to CSIPHY link per endpoint
Date: Tue, 15 Sep 2026 14:38:38 +0530
Message-ID: <20260915090929.1284112-2-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <81fc2514-151c-4305-9a3f-4d2774c7c5ce@linaro.org>
References: <20260914133416.1030231-1-hitesh@ebytelogic.com> <20260914133416.1030231-3-hitesh@ebytelogic.com> <81fc2514-151c-4305-9a3f-4d2774c7c5ce@linaro.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0086.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b6::9) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MAUP287MB5156:EE_
X-MS-Office365-Filtering-Correlation-Id: f55c2c28-55de-4775-1434-08df13091696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|52116014|23010399003|1800799024|376014|10067099003|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ORG/k5rDcuW9c9BZtMNJYzsQlbfOoc1pycvWAcY8PA+21guSCTBmSP2kwrUE6adYvhlTq3SxdEcbqfVSUj0qOefItASXzfDMdeyUMHXQN+KguAtnE2rvQOsSb2sHnN28paHmQKAtgoisV0F8FMey4kSVPomSt0T4vOoNklg79FiN98TCZ8k3G3sfGvnsOSY8enPcj2AA7/A0pHHlKQPqaCObqlETZZbC1sXktca1i4MagvaQlaTDF6eTrjxgz7ktG7l7BDF269ATOu3RkAPjCw6CnTMDWcXhUncRAX6TiXFFqTY6ocrQfDKAgxjN7SDnzM/arcjyzjS98CIGG4eQMlhrsCm3r2oFLD8mFP0xdSCLzNLAjQmxJ8TnBVdbmckR3SBut3iLhKqj46BUpOQQKXG4J5IGyHAozWxc6YYICnAghzI2YAJHBtZLyH+0mNR0qlpSCebXU73QqiCyn5BkTPgdZ4j5ytxRdaOrka0lmutvSG3MReBJA2vqiaub/44aIrqwhmS0GzjcxH0/rlM4/B5XFOOTXWoWlQNl7EdCBudC4lknacGa6gy85ybZMdJazPdhE9NZ0GfLVO96Y5rfeUr4bAqsN1C/uMa9axi1StLblEFC2rmBoMS4EeBg7rz2UvK3EKsNP3JtEQCba0zTs36ZTEmpl0T6D0nfi/sO1vM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(52116014)(23010399003)(1800799024)(376014)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zi0gQUia4GGWm0O+5HGzZoDFCK92F19l5ygNdgdpFWqP6F0nEW1xfRA6ukaU?=
 =?us-ascii?Q?od3NH9vF5heYXqKNK+LK4BwaL1C4FQ4pGI0tcVgej4nrYKLrp0DAfC/AU0P/?=
 =?us-ascii?Q?JqHNxxVIhTMUm44jQxkOZN85G1NTDXrLD5CBMOsZ7J55aY2Bf2FAvOk+TBSN?=
 =?us-ascii?Q?O8bOI9Ab1hNjFvvXLY9/LnjJbAKr556OpjgIotQ/SC+1BeC2cA4rYj4C7KAN?=
 =?us-ascii?Q?cNUTWfQU3mKB+afaf1qnE2nV3kzK09WhwWvLSrlHfkWjEql+r0pppNw1GIy7?=
 =?us-ascii?Q?kTMTUwuL4wP+4AsSzEGXe+m8qkV2pnlOrH8/tZVQLOBAN/W5SPl9gfJ/v/UF?=
 =?us-ascii?Q?uWweUStQrfh1+mIgORt+LJQHzlHHf5a+/0LpRD8xlyJ6VPwnULyCzu2i04H2?=
 =?us-ascii?Q?z2+yeoYyuMGey+xGSxMArvKmqZLbEicDEzBBJI7OucO9rlTvRMHfRKHgnyxV?=
 =?us-ascii?Q?gCV0Vjdzsmk8W4a6lp2nereLs+ZOAMgqE8ekKf6uHts8xsjoVX/RlNb/qD+q?=
 =?us-ascii?Q?dmREQcVj3kr8+z5T0OvbgYYbtivYb0vzz+hZP5F4N6Awxpi6Cakyzg5QGZS6?=
 =?us-ascii?Q?KHOEj4vGMlFpsnC8jaTFCNyeYi4UE6DWaV4ToLH6LAzIq0CCXY7z0rrZ/cUw?=
 =?us-ascii?Q?8FlBL8dJ8QlHQvVNzF29rwhIttNU3kN3ePw/T8iO7JlYnW0voY0nJ/oEdtpN?=
 =?us-ascii?Q?N9WnRjrFvTUmfaofvBmAp7qWpFOP3xhfGmSIGho/jHG5Yp4nawI6mSsguvO8?=
 =?us-ascii?Q?IobxO5/f8FFw5c+beN2uc/HnN3cRQImc6ICIrui+zuC5GjcoH+O5oUJGeQHb?=
 =?us-ascii?Q?COlDN9dX7BOMaEHzBfuE3Kys2PytXCBy1XZxQ3cIAaNkAVqiFh8UrwXppddj?=
 =?us-ascii?Q?ksWBVAgxdmUesjLfwz0jW/ijZ77ojFZsPK9dEzRcX1xpgFyeQ7S2T+7NWG+c?=
 =?us-ascii?Q?lQfQYto6YeZ3HEsr/ZqeQtlqadMrRqjSAMBlbEl0B3YyGiOwS9Rkr4T/2FEa?=
 =?us-ascii?Q?n0mjdDMDkpdktEEby2/K+8cYCZbXHgUS8aWSEIQT+8kcxwD/7iN3yENCncm/?=
 =?us-ascii?Q?BQfzgJI70KP7R3H5oROJXUEwnlD6YGKv5yHYGQc//Loma1ncX3OlRD6j5BbH?=
 =?us-ascii?Q?iTXrqOZFSY7s+fAFbzzq/vFq3VfXMYgk2gLxMAEjYC1tuNq2eBrzyNzCB5rz?=
 =?us-ascii?Q?xH6I+KeT/gNrBeGt/fsGtGw9aawAKDaJ/Awso58qCfl9Tv96MzClv8a69cso?=
 =?us-ascii?Q?B+96GLcspaxlNjYWHPTBTjt/Kqoh2A4hsLyVpFNr4WzVUp2j8XU8FkuPvbfx?=
 =?us-ascii?Q?axYQV8X6D7vDdCsuQ3UPCy6y9u3Wkb+uRaE3jw0DubGmMowQELNlJgw6GWEG?=
 =?us-ascii?Q?qb3rdkJcC554alxHDzIZ8rAMFc8N4/ri2/Xqsytdz7/6tE9WK1/+oYpEy2bw?=
 =?us-ascii?Q?sNFUP2nud+AxjXgyDdI2hXApfGc8PdvcN0R07pEjyIbtdrJXB/6cjFW5oVND?=
 =?us-ascii?Q?MEIUHccvi9IqQi5HnCNOLAbQc3lRyhjqDALdldX6K+XkPJtjVN3BF19/n4Y3?=
 =?us-ascii?Q?7foZjSRFWwVjpSreAYeM27bGH/ZWgXBKQWJeRUWTPYfSnoMGy0mubyVuh4OA?=
 =?us-ascii?Q?GjL/AkSzUMzI1BoxFnIkhrjjo5cM1UC9IU7EFBgN4BWhZALLvwK9xqOqILLX?=
 =?us-ascii?Q?dZhKUbjFtiJ5onml/MGsgRXXmjLsIAYHXotTHnTi+qQmozGLiDnXzrJ05RQy?=
 =?us-ascii?Q?MxOMAb1XMFZwdHG9AmMsSyroIApTB/02QBhsxJhpe7jHRKxVx6No5UU6N7Xs?=
X-MS-Exchange-AntiSpam-MessageData-1: MAR3f9AYagGmGg==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f55c2c28-55de-4775-1434-08df13091696
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 09:09:46.6325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3PiuMyEkzKsPtHA6RmLSW3s2pxTvzQ9aDHY6GEcDClnXMVQaMb92onRYxPjlOShluVJYMANhWjTpwSzIAMIY+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5156

> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Thanks, I will carry the tag in v2.

Hitesh
