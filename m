Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021120.outbound.protection.outlook.com [40.107.51.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C612B3DD500;
	Wed, 16 Sep 2026 08:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547509; cv=fail; b=PSeYIh7D6f6HXnsgI5fGyDEVqxzNvYohxykEuCaED9rs9xWZTZKwItQ7EsP0GivrUfPQW9sc+3cjJxGjZ9Vdmzds5Vj72sy88oD1Ft8u5yznrHOMy5ulAoimUYrroFCf1eQhqHBcHyVN3O1+0GR17Tkknj2wwakYQI3KgOzLVkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547509; c=relaxed/simple;
	bh=REotQ+dGet7bPj6iPO+B8KfEvsEA9iIFcU4SNeM9H5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QKEWOk4lEY98eZGkekeMgulPchggR9VJhrYOHiKc4DCONHZmVxSJ1rA8oookEobyAR+s23NC95hSIqF2dR9bmM0iSKbvvs7c6EHfa0e9AijO1D8gA1RoLJijr3pv5mrMXhXhRBYNWIpI/bwvIUQS6vGmHsaScnHezY/b2buMjjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.51.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpvDW+4/q7N3On5ZTB73Tch6BXqgqxF69Qg6VDfUJS0IxV6Iw8MCBvhbklSnagRC44qOen/O5jZp7l8lV2tomA05PJ9EyAuWU2DKxX4ZVN4xjsbThKVo2ff9LNNHE2oTY+AedBbfsWScfogj3FA8/N4CSHpRqdV9y/xnYecqXu22p1ad2wztZw13UEDgaW6sdoWH/GszjG1Cw/L3vevEWhch6EwWMYq2Y1b2dG3MiT52XPdYEe1oHzpMaI4SY1N3iKe9T7IJolKerTSwMto/iVjCca4dP94ahxBj7BeQXlynZpYKCmG2BND1otA1DniRPu9lIkJXLfWP9iyTOgz17A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kih0yMPbdHake1l9kRhIVaw2xjS6a9vSwG4GAfGzKYU=;
 b=PZCp65eXrPo698biZvWjwh4ipyPHyi+iQmY1NZTcal+KrOhfReassMfNBn53erwHTzuMd2udY3h9rhcHxNsw0CN2NOu2zEWnzItu59yYpswX1fRvipBgFLQAjPjy6wKw3I24J1qcPiYnh/L/7Ia53j7l8hb1kfijui81ZO/lWVkaEodMkhTKRMNkBQDSixf3LtOUdvzfBvtJ6jrmi+0csdDm52qmeHNpqjeFfP1Yo379YfJWodERnFz+3bxkdGnNV6nZMutZlo2P1i6KFraN3D3S+rZaM8oRCpqrDhDBfMNtZkX1Jo1cMZmDvA+NAUHnsWJEGDtQQk6YYtypaO7WDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PNVP287MB5988.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:347::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 08:31:43 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 08:31:43 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Hitesh Patel <hitesh@ebytelogic.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
	Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com
Subject: Re: [PATCH 2/2] media: qcom: camss: Enable the streams API on SC7280
Date: Wed, 16 Sep 2026 14:01:33 +0530
Message-ID: <20260916083135.1296317-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <fcf04e15-d47c-4b42-a94b-077486cf634a@linaro.org>
References: <20260915121536.19207-2-hitesh@ebytelogic.com> <fcf04e15-d47c-4b42-a94b-077486cf634a@linaro.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYPR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25b::11) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|PNVP287MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c0a44da-904b-4a5e-68e5-08df13ccf013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|10070799003|23010399003|1800799024|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xOhI2eqTqZ68H1RxsbWeuqS1RnoYm/IryvtIAIDA0ltz0BzrR5X6bEBr5MDaKfI+Dt6MGK0/5sQQe6ygEAoUgbb1psvwIgNfiXuLB8/k+j6dEMy7StG8QL08Gh2lKDSiB/za9QnfqcmP1/n8DDAzsYml2eP9YiMf0Y9/ZoedxuGlEY8wyG412+V3U7VhUVoxQKApG2ZG407I2rpJDzHFAj3fd/5XJevBgW7JARppQr7mDYI8+ueL8O6P8WcC5eSa2qe8wjOA1GhOaI2xtXJW4Of8FHpMWgF9v/Gici/qtSyTTIW232fD1PUjru5+pqKxsV1OJrd+Ru5uvzZBNsDU0tYjlo00B9DnZ+K9EVM9nDdGnNsBjQN1Q4g+BrH1OaG/iHPtuLCkVTa+99P5WanI/coX4aP4K1gYl5ApFdhlyk2i2zakLlnZS139RuNg9QsV/2JEGp4cu68/BisimCAhH94k3lIzWLMPyJ84pbrCbp0gpAwafOFWH+/UnFFCJkI1WdxQk1OgPqlbe/zWeB38deGOimNJpCvSAwe/x9l8huiV0bC0nZ2YY6Ef+dgyfji/wu3u0qNwheWOf3uOnffRLRycShv9BvJEbv0I4J5ncEx4bDccVke90Dh6bE3n69UKK9zrJsNZbqUQqqegywnCr3Wjd2ZkJWvPgkAJXwQxqoI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(10070799003)(23010399003)(1800799024)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OT2K31uJvLfeiJqdR7/Qz0NBgvXcIyBTeQvYAKeoeG4lJ2y3iPSPZHDvknXc?=
 =?us-ascii?Q?+eOR6Yy4ZaTQMBqZBT74tKgsCB7G2HwsTdsCopsMYTdj2O2mLUiLgYFYuQ6q?=
 =?us-ascii?Q?HTxdQUERw6pR1JiBNzCiDL8jtKzr+uraICc7UhKfaaG2v2v/OUZGueFH+t/b?=
 =?us-ascii?Q?wDGwgxQe0nsVNkFEOwnimvsLbmP8cF8NECAkkCfCDRYVUWGE198gQL9LiqO6?=
 =?us-ascii?Q?QuxQXLKJWkICmu0LtTQUgqb8eCfNUWP5HYgGHBoETIyJjvXNFAopoGMYR+6E?=
 =?us-ascii?Q?9dguFaVTATiNXU+SK1UGjYx0TnufbDFKgAgogPJI6WEUYgPW7K0YAMIpPWri?=
 =?us-ascii?Q?XTO9VSuW5SnPy1YsmalIHT71n562wW3kTZf+Sqj4aBf/d3v5+etrV+oSSTbS?=
 =?us-ascii?Q?WbygLb5WBaue8ylDPJK8RfysLR7IRZf9dFvSzV4ge+gdqQTWM6pGx29XPEt1?=
 =?us-ascii?Q?UsveS/NVX5wn1ZN5m0sG5Pdfa/rD8wR3q51V5UokSvXUMA1cu4t2UdbEf7Dj?=
 =?us-ascii?Q?dvJ9MTs/+LdpQIJ1HELS+v1+nsSvSuBeFI9qWU3oqHtKCT7JybGNpZun10Pz?=
 =?us-ascii?Q?Je8/V6u04OA49R4Npeh490aA6+X/sVJXJNIS/aB5dWF6sZJYFDMNJPHocEMa?=
 =?us-ascii?Q?VEoTs6W7wDMlDFNe8cbHgUxiva3M2AnJXNH3By8qqfK/Y2JooNt91kz2HRHM?=
 =?us-ascii?Q?syDiOKBN0rD5XS36YVSdI3ltn2+1gy2xp4pXAjHCSPy5TfL+07wsc9SU4UmR?=
 =?us-ascii?Q?zm7RnsP5NadY7zjfL8jkmyCvTA75veLGMAXkB3GJxROdZ10AZlGdpTkx5Lah?=
 =?us-ascii?Q?tDRU9QSLqa6Z1QZbKYq0+7Gla+OLQJdPSeadRnPfBPxhfQ6qaxlH99foqtXq?=
 =?us-ascii?Q?2Uyx6dJUxi8sEP+o15/JGyDduFgx3FXEIwEaVe+WQoL5VP4PbMNk9S2G6DIz?=
 =?us-ascii?Q?wPQDRgzAk0EECnfXtlE5iPS8xsD/8DL/KZ6UaVRzeJ8cf4y3Tnz1cYqabLRj?=
 =?us-ascii?Q?SgvLcp6zXBezBbaTuqkcFcwI4PmKGsOvAkV3vLUpLHPT+KtJ3o2CSMKZQQjS?=
 =?us-ascii?Q?gVW912xlQkPCWThwUgd8axpBE/TXn01f/xBKRA1EdJ9qW3QM8JUchz2fZ9ib?=
 =?us-ascii?Q?YB+dMuPeSZyC7fdPXPi9ikm177q6gU9fPki9w3mrseuaqE0i9oJJhD2+gTBU?=
 =?us-ascii?Q?eCw5WfzTPd8srN8CZvnn/0Cl/Tfoff9h4VpLJp0UnuJ+/a32Ec+K+YCWA/Rr?=
 =?us-ascii?Q?Gge1IQVaRAPKEUcRuMpfSuaRLz0D2t2e+rZmpjv0dfq/NxKhjOguyqYvUE7A?=
 =?us-ascii?Q?d2384g2uLu35Zdz6d6KgYpwQkmkZAy4n/iWnK2uX49R+8HkPv0LXfl0WlPO/?=
 =?us-ascii?Q?VMbPJkmEEEO2pN3T7JXqjOqIjvPwxU4/sQPuKFKdTAencs2itXztdH3Ijh0W?=
 =?us-ascii?Q?jzumwHMd8r52N1TFIYw1V9+V1S+wST91YCb9k/bbToRiU3hyeFVB8RQDACou?=
 =?us-ascii?Q?FT7L82XUz1jFJtOa6f668RAYGNzgyKd94nh+fCuMMfxf+8qw8cKv6XmkzkNt?=
 =?us-ascii?Q?QFHtYgdW/GDN89qaWPlE583a1FhQrLbGc4QgYPikr5WaRtS5b4cXTS9rdc+u?=
 =?us-ascii?Q?Uy8ZI60Mj/vYUQHAhkdqurgphmyiLlKU0xqIfJB8D/aNkMrj8hfzN+m0nI1P?=
 =?us-ascii?Q?/ZRqbq6dOXwgWrjgXz0uLgNLXHYd0kYp59zQuLxWRSg4sKM2JgIjqfHt1L7h?=
 =?us-ascii?Q?LAYF1TKhpgtOONEL9ak20NqpxyJsY7ddX/1/JxU5Bski5uhbyPeC8x8JTx67?=
X-MS-Exchange-AntiSpam-MessageData-1: u4BFIuWepkNy3w==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0a44da-904b-4a5e-68e5-08df13ccf013
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 08:31:43.3845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+KE1aG+Bw3ndzWDnIHuBXBTaHlAj2k/CUY0CX8hvNHsNcQI4bhyl9Ccfec4ARlRewEN2xjZgwbBaatpy23k+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNVP287MB5988

On 16/09/2026 13:38, Bryan O'Donoghue wrote:
> On 15/09/2026 13:15, Hitesh Patel wrote:
>> @@ -2280,6 +2280,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>>                .reg = { "csiphy0" },
>>                .interrupt = { "csiphy0" },
>>                .csiphy = {
>> +                     .streams_enable = true,
>
> Set it @ the SoC not for each csiphy and csid.

Agreed. This patch only mirrors what 8/8 of the series does for SM8250
because that is where the flag lives in v1; Gjorgji already agreed in the
1/8 review to move it into struct camss_resources for v2, at which point
this becomes a single .streams_enable = true in camss_resources_7280.

Rather than respin against a shape that is about to change, I would
prefer Gjorgji to fold the SC7280 enablement into his v2 as a one-liner
(and 1/2 as well, if the CSID->VFE pairing rework discussed on 5/8 does
not already make it unnecessary on SC7280: 5 CSIDs and 5 VFEs pair 1:1
there). Gjorgji, is that OK with you? I will retest v2 on RB3 Gen2 as
soon as it is out.

Thanks,
Hitesh
