Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A8C35A397
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269551; cv=fail; b=XO8P2RwB5h1pPlNHPQu1jovHatuQJnvE+MEeYfRITMPgYQOl0UnDoDVnDvrXvEt9tABnSXGfXESDXx/HxohbFbYLu8M1L2bVmcAT6oJmvC7BVIHPcVIEDmejS7yl/R6cybDRiyWmqo/BgnGUaF0fGtxZeJpH+e+xRAzxuMP04Xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269551; c=relaxed/simple;
	bh=zi84ngvSqP8zGXTjDdwmr3Pz4SESKgHVpXMG9yrnJAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NZFjNI8lfhJJQkHQtiQ2mTcKo4cFplR/fEJrw6SF/HejnmAsNTXiRLlsL4/pVPTolbAz0OxUVlT2bwLkfIEuPKG1R4Td8aShvVAem4ixMAhXtdrG0AzKBOD9fb8Qq0xgPhi35XlCpHb0gA7+Q5JV9peQGse8fAvOjhx1EZuaNos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=OLvcWxp1; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="OLvcWxp1"
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFeQxG603190;
	Thu, 24 Sep 2026 10:04:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=pnMZ8Sq2jDAOi/QPwG6BhYptqDI0uA9AVZ+nliwXwqc=; b=
	OLvcWxp18jTJbYHDC/2qicwC8LdAwjhGAO+0kFr0n6b2/VI1F0LcOp4Po2dNrILk
	Cio/ITL+xJ62oa+qICnLJkkDcVGMa5dx6iaafLYz6VFhS67wo1ACdfHH8X+UJ/yi
	/xXV/SZImrwzj/N9LnhI7tBbuIilepgmHzNDm7MQJXYhndmr4H29sADgzW/WgY7M
	Z455SobHTiaqMB5LdEEEA0599KkdG1wKwKSenCV/352wNSVMPWMxlJY8TnzWa7mb
	bBRoLuytMG8wOCRXYVo/JGndTYTbi+cxhNEP+0JmrGdRnd+TUgPd+N6S2T3vDwGR
	RuI+pAldiacjHFRnv525Fw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021098.outbound.protection.outlook.com [52.101.57.98])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gvyg7rsqq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 10:04:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnWkdNuQOxY7ps9ZCzjUSWaRtBjJG1kz2Krr5xTXe8WQKYZD7W4ps8+Yt/n6cfYokxIThkGZ2dNghuN4ZnHAXsi+PMRHbmcTiqcH7GIZQGmNKm6ieuVc/SsWe/VE6/Y0awCmn6tadBOC4Z5EEnODdNUGlj03nGMg/UGtogLWgfscNo7nMd2abVlBDO0QuhNWCeK8iAeDlS9FbX1NlGBFRgFlFAgQRKvDq8AdYNcKNipoALMq87zE1TyMYU0KJwvWSBbxjhgi8Qj44hKMJCy9GBdcEyrgX/+bWGRDFu9ZnO0rWmQGzjF0U/o0WidjerNzZtBYN0kmLofhczxyqNp6TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnMZ8Sq2jDAOi/QPwG6BhYptqDI0uA9AVZ+nliwXwqc=;
 b=Yy7LEyey8R8+sDYAi9He+nGiD57xN7dbAIkCtKvuxs5f9qFMkwumYHvVUsJHHtWsMOV0bqWw/JT6imH4V+KiWrWM9lRPfxdGSCTvNubmh8nZ6U/slqXtyHcmhno+G3vW5rNkITyRRbJkdSMxm/Xmnt3D5wz9RGrGL9rt2v7o0QRVJ2Au5y34UwF8IZSUkCz2S+M2JUFiZW523OOtbgyy+tsACU53jSvuT56E0H8iTP5f3qsI2q2uRcVLbmJDgy4L41oSHGU2jnB+K5PAnfKnc8qPIqAmAjWMS5a9tz7yWQOYYoviUbB5QzMB4gioPeHdGRTw7jjr06sYIC1WJvTslQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SJ2PR11MB7546.namprd11.prod.outlook.com (2603:10b6:a03:4cc::8)
 by SJ0PR11MB6574.namprd11.prod.outlook.com (2603:10b6:a03:44e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 17:04:39 +0000
Received: from SJ2PR11MB7546.namprd11.prod.outlook.com
 ([fe80::ca9b:dcf:8881:bced]) by SJ2PR11MB7546.namprd11.prod.outlook.com
 ([fe80::ca9b:dcf:8881:bced%4]) with mapi id 15.21.0428.018; Thu, 24 Sep 2026
 17:04:38 +0000
From: "Ionut Nechita (Wind River)" <ionut.nechita@windriver.com>
To: juri.lelli@redhat.com
Cc: mingo@redhat.com, peterz@infradead.org, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
        arighi@nvidia.com, frederic@kernel.org, linux-kernel@vger.kernel.org,
        dhaufe@simplextrading.com, create0818@163.com, frn1furkan10@gmail.com
Subject: Re: [PATCH v2] sched/deadline: Make dl-server nohz full aware
Date: Thu, 24 Sep 2026 20:02:52 +0300
Message-ID: <20260924170402.521623-1-ionut.nechita@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513-upstream-fix-dlserver-nohzfull-b4-v2-1-d3e9cbe5c845@redhat.com>
References: <20260513-upstream-fix-dlserver-nohzfull-b4-v2-1-d3e9cbe5c845@redhat.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::12) To SJ2PR11MB7546.namprd11.prod.outlook.com
 (2603:10b6:a03:4cc::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7546:EE_|SJ0PR11MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: ad3219af-a86a-4f46-4797-08df1a5deadf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|23010399003|10067099003|56012099006|6133799003|3023799007|18002099003|22082099003|5023799004|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	t/ije9gf2nA7LlKFukYg+q8UxnRnWm0sk1CQUKpwHWEstlIzTtIeFo+92JnOIhG+CUlVTaxVOpyJS2HnpyPgmbnVUpJTj7i7vmQZa8Vm4ej1B+a9tpADntpAuv8/73SM/SeXr7c8mv8j9aqWF/jpJPKUhM94Sezt/DZzV0sRaZwDkJMg32HF6yKa2g/zvU142WGYHeSjRZIPvNtV9iqzHh1pKvmnIQ6+Ede80rXHcUVNLxzTK9gsLpBDirXxqds6AnS5Shtwiv1mbUKp6D2RGUe/Fqh51NQbWT9SY4tWc9T9ivGU18g/jdqKG7nSx6Gsd20/hATbYTa7rM9WzXOLsPTYhx0DF3cbxo2Vt8JHHmRtbJMO9bas9ytLBkwFBCv2kVqc0O6xg9y2DvwgfRmSoTYMngVzoOjYomTtKrBH75DNmc76AYBxJrQfj3SU6NT2JFVKALPzLPqXxfiQheX/mlPEKCmrdI4h+0sbpOh1c/rYFNLorz4X/iQl+4u69J6JGuCI3Upgb6hBNQjiuVOgFk+6Z4Q3zD19B8bex2L4zktZoABYlCbC8sckq6Tvx9UfQ5eSPoqlY4Ci/Gs/maAthQXrwGTAbb5XJp2owH0I3hzHs38gk3PILb6KB1Pk+5DPi5b8zI53heKrQmZAM/jA26SajM1XSJkj5Li1ivIOCft3N5h/jewedBcExKbsndyWqAXhPOlKPH5Yxg//BzwtwZAbtDzaoY5DnKajKHL4Pkw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7546.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(23010399003)(10067099003)(56012099006)(6133799003)(3023799007)(18002099003)(22082099003)(5023799004)(11063799006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TJT8vDFMcW41uQdAno7g7CMhxqMcySwHwWOMCP+3OmPCYutV+bGvb4PtWY7D?=
 =?us-ascii?Q?qzA63Y8qqrbtmBafAKODF59msv378bM+vCi1a1MmVXTS6mdVoCxj0fphaIcj?=
 =?us-ascii?Q?VxAF8dtIWVu6fQTVJtlBVVeFm4ZbYjVNgGC5+vXEhoW8JPQUO3MLODuPEIQa?=
 =?us-ascii?Q?GtiM148LLlEMnxPNdnka6wKu7CqgpezOnwy3QnNMk5UlGH+lXqtJid7fXuKr?=
 =?us-ascii?Q?C9SQbpwbmNR5gqfqLEPDl7TuUiy9OdtMcfha5hRCyhCQoc4vOUZYvY+C38BE?=
 =?us-ascii?Q?+KKh0+sGsnuxAbC5jM8ji6MfNma5uhoEczhXN8zCeumur+zhWZyrUCLlP3Kl?=
 =?us-ascii?Q?O+dsGsUZqcs7JxXEca8xfOsNTCQi4eY5F47lQgvt6Aoje+Ik/iTn0dOw9n7V?=
 =?us-ascii?Q?qFkAEoT1HUFbIbd79UzzFxCmIjgwEvCKO1W4Xc99vN8/to1R5aBvvf56aiFI?=
 =?us-ascii?Q?Dzs90qxbn8h3ChGrSNlhwrTKHSBecbfiIopqBjkukuSLB8WwZB5SbgrWGmu6?=
 =?us-ascii?Q?kLqa5H1KD+Dd4FBvbpNU5SJPU9JgOBgA/WcA+vhWQQG9PEVGxZ7yqI76DDxC?=
 =?us-ascii?Q?kMKXNPQhWK1x/o8gr/tg3aVlDyq+Nl4J6ZbqhTuepl3bcTliA11Ru0cgTpNW?=
 =?us-ascii?Q?su1L3ZrPFgBB7pFATo5tNCfwvKu0JMo/mTb8hqsukHRAatD2ajZWgEilekKP?=
 =?us-ascii?Q?5CMpJ6xENftyLvHTKrS46AI2tORXXeTQWBTil/YLoqAzXzIaH6VkPQpaybeD?=
 =?us-ascii?Q?jb81fJv1Dw2e+vhxzebd1VKiX7Mn+kgO59WyOoWGYMkFyPXUDuUaGyjHB7Du?=
 =?us-ascii?Q?x7FuQqIwve38R4vXP3ASLxfqqiMX9O0hpF+KTp+na5eNBEyYN9HJkiPkH1Ze?=
 =?us-ascii?Q?UluHAg6tc69FsZ7RDQAScUBi9oisvTnA3ZtK8EBP9ZtF75vHRrq6nVyC5iY4?=
 =?us-ascii?Q?1F/Vvd5NTlPDFw11bAFKiUrXxBNkywWN0bVyxEsPdZ4p+2S674wxOukCL8rr?=
 =?us-ascii?Q?C2J9u8M9wZO4B62B+OrgMgeX6yQBzFKMUecoxLSyxDaIvapW4aMVEWBJdT3d?=
 =?us-ascii?Q?kv5Uw26NXHV2/lEom4kBEcdO/AVCbBfFioWY2vzJu/4ETLwc7yci1vt8h1Yd?=
 =?us-ascii?Q?v3qfbFiut0BDe/h4KNqh/orj0/S+G3JnJWSu1C/FCLWb84laUdR9n6KmROBI?=
 =?us-ascii?Q?EyJZoJo3hiZWMu6VxqOT59VFwQ4oHuU4dAumo2t4N/aW9PvFxAfmS+Cxn/k6?=
 =?us-ascii?Q?z6//6CKAcOStVbCRbSw7fdSUPbMeTi6s7TVQJ/KFRXEKyHM/DIC7Klt90H3h?=
 =?us-ascii?Q?TJGi6Dt+aQgvmdR6kykradch9qAq4fh+/C3GJHRUOyzI9DvtguTTznStZ6z/?=
 =?us-ascii?Q?Duq+BqBH6a0YVfcWAIjf2HN0uPoX/WWuRlP+ZbjF+Ze4Q3sbipc4CkLKVFCW?=
 =?us-ascii?Q?n2LCx6Zk24n1COANXPk1jtvgjICM2Bm2Rn7QF9OM72aTBrqYMKh7bXdiyLDS?=
 =?us-ascii?Q?cYyCu1KUM5KcIMyU9EAgjd4R0k1MO1IJkjpsLvMYUEfOxuoY0eM4bEv80X1g?=
 =?us-ascii?Q?9NgcDch8Dk52Kwx89BxbDJ6CHg8+F/swaOnLIsp1E1s2d95tuBwZdxJQpyzo?=
 =?us-ascii?Q?YL8gU/fK82i3VEHwY2E+BKiCVaTR6q0fHHyTgCvWh53qoKmJUXvxhIR6W7ep?=
 =?us-ascii?Q?fU5Jh15YS28A/z89a2ReueYIQhJ8wn4IbFiODUlacu3oaOUEnyVhQjG39n9V?=
 =?us-ascii?Q?g2CRLa8SF7pAUIBtLACJ0QxdJU0AH0A=3D?=
X-Exchange-RoutingPolicyChecked:
	aZmUiJtszmn0EYW4wKSv/wBj4pI0GAT8/RQbbFiII2SewZzhs/v3xqQ+BmeLtAOMZjuhIhCmBm9RVZvAYrQqm+KQwLc5UDn/DeQGLaDF7/+7M+09ptF5COTzU0QW9Vjr5T5HYj4s5lRFvW6hq104XRvIxajD69ycvk/Ez3S1pcSt8JVB6OdDKYpiKjW5bI3nEJixtH7iIJoawnoQsYwzeS+eWmWlSECgeTt6raXmYkg8PXhq4CLlOYr2a5c33Aip5O27XFrZCdgvFxfW0qQfC1xKEKAPAjKdRDd0fgvwK+66KV2IMy9bEij4XxbvCBXB2qi7tkbdcN5pObcxn0KDKg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad3219af-a86a-4f46-4797-08df1a5deadf
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7546.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 17:04:38.9312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eyLoSs1qrH0m/HOBhoCNjCw895ywFqkcyNgWcLZ4zDuMfwot9BPPhgZlImT2TJAHXP1h2F9th8X4X6BwDdkwSl0CiCkIX8PgN/xx/wrPriA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6574
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2OSBTYWx0ZWRfXzuzHbEa8etc9
 3oHv1MAcwyWVZRUWUpxSlkHUUkQNHNxMySbQ1eG8yRhAHcRGmOWY+TE13q0oFzaJ/K2X2e6l7iP
 d3yaK2WbHQDIEWrNeHEpJfpGPfvWOrIYd3pTwNwh3F0KV72jijSl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2OSBTYWx0ZWRfXxhLmDTmN4UQQ
 NCvIHtm28awYDpqOLCulxUIZYAu+XZY7l0oAkbaUSHdzbz7G0vGOQWNM6Fb1wEdJ/dGr51SK7+P
 rTDcB1Rwev18oYPYQka8TynFVpfoHIvOrcer2eqwniDCrvTsPaneM05VZJNY91BfqzXOqC6Zz/v
 HAx44QNb/RFnJysgaDepZWWRz0bfwapPHlLzAcvThqX1e0K6qxFu2XelJPn3G1yvIfhJNWe7GNW
 G6N4FcIOpgy1RyFebJOrPLbAMzoD4vlSJI2v3XjDUvCGguMT5zASVkpZ8kmGKFhjb7KGcnCYGF4
 vF6KUssAfooMUl+s+dPWcz31FrD+LUUkzd8gm9eLYSeZAP0nLuJJfHO+FwifJBoGvkClAst7Axu
 QdKckkqCxbCaYhZ9OTh2ACXCMfSh/qPoEGFZJ0YetBVFCmhaZSDJemx//w7CGUHHvedlXgSiPAn
 r1zmAaU8Ck9KiZAvRrw==
X-Proofpoint-GUID: 5avTl-QUikt44GoVrIxcHWHrgT_T-5W2
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6ab5582c cx=c_pps
 a=zHc5ipMoJZhVMviFMUShKw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=0OI0Mqn9_jcA0lRsnVsA:9
X-Proofpoint-ORIG-GUID: 5avTl-QUikt44GoVrIxcHWHrgT_T-5W2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1011
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240069

Hi Juri,

I have been chasing timer noise on isolated nohz_full cores for an RT
product and ended up on this patch. It does restore the CFS bandwidth
guarantee, but on the isolated core itself it trades the dl-server's
timers for a full CONFIG_HZ tick, which for us is the more expensive of
the two.

Below are measurements from two machines, a variant that keeps the core
tickless, and a hazard in the dl_servers_stop_all() call sites that an
equivalent change of mine ran into. The variant is not a replacement for
your patch as it stands, since it does not address the housekeeping
wakeups you are fixing, so this is more a "can we get both?" than a
counter-proposal.

Setup
=====

Two machines, both PREEMPT_RT, CONFIG_HZ=1000, fair_server defaults
(runtime 50ms, period 1s):

  A) Dell PowerEdge R750, x86-64, v7.2 with your v2 applied or reverted
     between runs, isolated CPU 2. That core still hosts the usual per-CPU
     kthreads, so it sees some ambient activity. Isolation-related boot
     parameters:

       nohz_full=2-3,6-53,56-57,60-61,66-67,70-117,120-121,124-125
       isolcpus=nohz,domain,managed_irq,2-3,6-53,56-57,60-61,66-67,
                70-117,120-121,124-125
       rcu_nocbs=2-3,6-63,66-67,70-127
       irqaffinity=54-55,58-59,62-63,118-119,122-123,126-127
       skew_tick=1 rcutree.kthread_prio=21 intel_pstate=none
       nmi_watchdog=0

     The kernel also carries one out-of-tree patch that adds a
     kthread_cpus= parameter (used here as kthread_cpus=0-1,4-5,64-65,
     68-69) to confine kernel threads, the default IRQ affinity and
     unbound workqueues to housekeeping CPUs. It is unrelated to the
     scheduler paths under test, but it does reduce the ambient noise on
     the isolated core, so I am mentioning it for completeness.
  B) Dell PowerEdge XR8620t, x86-64, v6.18.y, isolated CPU 1, a quieter
     core. Your patch was backported there without the ext_server parts,
     which do not exist in that tree.

Workload on the isolated CPU, 10s per phase:

  - phase A: SCHED_FIFO 80 busy loop + a CFS task sleeping 50ms in a loop
  - phase B: SCHED_FIFO 80 busy loop + a CFS busy loop

Bandwidth is the CFS task's utime delta over phase B; the tick rate is
counted with irq_vectors:local_timer_entry on that CPU only; the phase A
columns are hrtimer_expire_entry counts from the same CPU's trace buffer.
The test script is at the end of this mail. One caveat for anyone
reproducing this: on PREEMPT_RT the sleep timer of a CFS task stays soft,
so it is expired by ktimers/N (SCHED_FIFO 1 by default). An RT hog above
that priority starves ktimers/N and the CFS task then never wakes at all,
which looks exactly like dl-server starvation but is not.

Results
=======

Machine A, v7.2, same kernel except for the patch under test:

  variant            CFS bw   tick/s   phase A: tick    inactive_task
                                       handler exp.     timer exp.
  -----------------------------------------------------------------
  vanilla             5.10%     66.0            269             357
  + your v2 (Juri)    5.10%   1001.6           5022             361
  + patch below       5.10%     54.1              4             108

Machine B, v6.18.y, quieter core:

  variant            CFS bw   tick/s
  -----------------------------------
  vanilla             7.90%      0.9
  + your v2 (Juri)    5.10%   1000.6
  + patch below       5.09%     52.9

Three things stand out.

Vanilla only delivers the reservation when the tick happens to run for
other reasons. On machine A the core has enough ambient kthread activity
to keep the tick at 66/s, and the bandwidth comes out right. On the
quieter core of machine B the tick stops, nothing calls
update_curr_dl_se(), and the server overruns its 50ms reservation by ~58%
(7.90% of the CPU instead of 5.00%), so the RT task loses more CPU than
admission control promised. Correct enforcement should not depend on
ambient tick activity.

With your patch the bandwidth is correct on both machines, but the tick
never stops on the isolated core: 1001.6/s, i.e. CONFIG_HZ. The

	if (rq->rt.rt_nr_running) {
		if (rq->cfs.h_nr_queued) {
			dl_server_start(&rq->fair_server);
			cfs_or_scx_queued = true;
		}
		...
		if (cfs_or_scx_queued)
			return false;

branch holds the tick for the whole time a CFS task is queued behind the
RT task. But the deferred server spends most of its period in the
zero-laxity wait state: throttled, off the dl_rq, waiting for dl_timer.
That wait is driven by an hrtimer and does not need the tick.

Holding the tick only while the server is enqueued gives the same
bandwidth with the tick running only during the ~50ms service window:
54.1/s on machine A, against 66/s for vanilla and 1001.6/s with your
patch. In phase A, where the CFS task only wakes every 50ms, the
difference is starker: 4 tick expiries over 10s against 269 and 307 in two
vanilla runs, and 5022 with your patch.

A variant that keeps the core tickless
======================================

Arm the server as you do, but hold the tick only while the server is
actually enqueued. Since servers skip add_nr_running()/sub_nr_running(),
nothing re-evaluates the tick dependency when dl_timer enqueues the server
or when it is throttled again, so that part has to be added. Sketch
against v6.18.y, with the ext_server handling left out for brevity:

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ sched_can_stop_tick()
 	if (rq->dl.dl_nr_running)
 		return false;
 
+	/*
+	 * RT and CFS coexist: make sure the fair server is armed, so CFS gets
+	 * its reserved bandwidth even though the tick is about to be stopped.
+	 * While the server is only deferred (throttled, waiting for its timer)
+	 * it is not on the dl_rq and needs no tick; once the timer enqueues it,
+	 * inc_dl_tasks() re-evaluates the dependency.
+	 */
+	if (rq->rt.rt_nr_running && rq->cfs.h_nr_queued &&
+	    rq->fair_server.dl_runtime) {
+		dl_server_start(&rq->fair_server);
+		/* A non-deferred start enqueues the server right away. */
+		if (rq->dl.dl_nr_running)
+			return false;
+	}
+

--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ inc_dl_tasks()
 	if (!dl_server(dl_se))
 		add_nr_running(rq_of_dl_rq(dl_rq), 1);
+	else
+		sched_update_tick_dependency(rq_of_dl_rq(dl_rq));
@@ dec_dl_tasks()
 	if (!dl_server(dl_se))
 		sub_nr_running(rq_of_dl_rq(dl_rq), 1);
+	else
+		sched_update_tick_dependency(rq_of_dl_rq(dl_rq));

The rest of sched_can_stop_tick() stays as it is upstream. With this the
tick runs only during the server's ~50ms service window: 54.1/s on machine
A at CONFIG_HZ=1000, and over the same 10s tick_stop reports
dependency=SCHED 319 times against success=1 108 times, i.e. the tick is
stopped again after every window.

The bandwidth stays as accurate as with your patch (5.09%), so the tick is
still what does the throttling. If the server's runtime were enforced by
an hrtimer instead (HRTICK_DL, or an explicit one), the tick would not be
needed at all and the core could stay fully tickless while still being
throttled. That looks like the real fix, but it is a bigger change than I
wanted to propose here.

On dl_servers_stop_all()
========================

My variant does not stop the servers, so I expected to pay for that in
server timers. On the isolated core I do not: the inactive_task_timer
expiries over phase A were 357 (vanilla), 361 (your v2) and 108 (the
variant above). I only traced the isolated CPU, though, so this says
nothing about the housekeeping-side wakeups your patch targets; those I
cannot measure with this setup.

I did try to stop the server from the tick-stop paths, and that is where I
ran into trouble. dl_server_start()/dl_server_stop() drive the "active
contending" / "active non contending" GRUB state machine, with an
inactive_timer in between. Cycling it at enqueue/dequeue rate - which is
what sched_can_stop_tick() runs at, being called from add_nr_running() and
sub_nr_running() - lets a stop that finds the inactive timer still armed
subtract running_bw that the matching start did not add back. That
underflows running_bw and trips WARN_ON_ONCE() in __sub_running_bw() and
WARN_ON() in task_non_contending(). I hit it reliably on a Kubernetes node
where short-lived processes come and go on the isolated core, from both
task_non_contending() and inactive_task_timer().

I have not reproduced it with your patch, and it did not trigger in the
runs above. But dl_servers_stop_all() on the RT-only path stops a server
that a wakeup a few microseconds later starts again, which is the same
interleaving. It may be worth a look before this lands.

A separate observation
======================

Independently of either patch, the CFS wakeup pattern changed between
v6.12 and v6.18. With the same workload, v6.12 serves the periodic CFS
task every ~50ms (199 wakeups in 10s), while both v6.18 variants on that
machine serve it once per server period (10 wakeups in 10s, ~1s worst
case). The bandwidth is the same, but it arrives in one burst per period
instead of being spread out. For an isolated core running a periodic
housekeeping task next to an RT application, that is a user-visible
change. Is the deferred activation expected to behave this way, or is it
worth looking at separately?

If this direction looks right to you, I am happy to send it as a proper
patch, on top of your v2 or folded into a v3, whichever you prefer. I can
also run numbers for any other variant you would like to see.

Thanks,
Ionut

---
Test script (dlserver-test.sh):

#!/bin/bash
# SPDX-License-Identifier: GPL-2.0
#
# dlserver-test.sh [duration_sec] [cpu]     (default: 10s, first nohz_full CPU)
#
# Validates the fair server (dl_server) on an isolated nohz_full CPU: CFS tasks
# must keep getting their reserved bandwidth while an RT task hogs the CPU, and
# the tick must not be forced on for longer than the server actually runs.
#
# Run as root on the node, with nothing else scheduled on the isolated CPUs.
#
# Two phases, so that two CFS tasks never compete for the same tiny bandwidth:
#   Phase A (latency):   SCHED_FIFO 80 hog + a CFS heartbeat waking every 50ms
#   Phase B (bandwidth): SCHED_FIFO 80 hog + a CFS worker in a busy loop
#
# Checks:
#   1. CFS bandwidth delivered ~= the server's runtime/period (50ms/1s -> 5%)
#   2. the tick does not run continuously (local_timer_entry/s, via ftrace)
#   3. heartbeat worst-case latency < 1.5 server periods
#   4. no new kernel WARNs (running_bw accounting in kernel/sched/deadline.c)
#
# Exit status: 0 = PASS, 1 = FAIL. DEBUG=1 adds a trace and a mid-window
# snapshot of phase A.
set -u
DUR=${1:-10}
DEBUG=${DEBUG:-0}      # DEBUG=1 ./dlserver-test.sh -> trace phase A
T=/tmp/dlstest-$$; mkdir -p $T
FAIL=0
HOG=""; CFS=""; HB=""; WD=""; KT=""; KTPRIO=""
TR=/sys/kernel/tracing

die() { echo "ERROR: $*" >&2; exit 1; }
[ "$(id -u)" = 0 ] || die "must run as root"
mountpoint -q /sys/kernel/debug || mount -t debugfs none /sys/kernel/debug
[ -d $TR/events ] || TR=/sys/kernel/debug/tracing
[ -d $TR/events ] || die "tracefs not available"

# ---- pick the CPU under test
ISO=$(cat /sys/devices/system/cpu/nohz_full 2>/dev/null)
[ -z "$ISO" ] || [ "$ISO" = "(null)" ] && ISO=$(cat /sys/devices/system/cpu/isolated 2>/dev/null)
CPU=${2:-}
if [ -z "$CPU" ]; then
	[ -z "$ISO" ] && die "no nohz_full/isolated CPUs; pass one explicitly: $0 $DUR <cpu>"
	CPU=$(echo "$ISO" | cut -d, -f1 | cut -d- -f1)
fi
[ "$(cat /sys/devices/system/cpu/cpu$CPU/online 2>/dev/null || echo 1)" = 1 ] \
	|| die "CPU $CPU is offline"
ALLOWED=$(awk '/Cpus_allowed_list/{print $2}' /proc/self/status)
taskset -c $CPU true 2>/dev/null \
	|| die "cannot run on CPU $CPU (Cpus_allowed_list=$ALLOWED). On a Kubernetes node the
       isolated CPUs are reserved for pods through cpusets. Run this from a privileged
       pod holding an isolcpus resource, or pass an allowed CPU as the second argument."

FS=/sys/kernel/debug/sched/fair_server/cpu$CPU
[ -r "$FS/runtime" ] || die "$FS is missing (kernel without the fair server?)"
FS_RT=$(cat $FS/runtime); FS_PER=$(cat $FS/period)
[ "$FS_RT" = 0 ] && die "fair_server/cpu$CPU/runtime=0 -> nothing to test"
EXP_PCT=$(awk -v r=$FS_RT -v p=$FS_PER 'BEGIN{printf "%.2f", 100*r/p}')
MAX_LAT=$(awk -v p=$FS_PER 'BEGIN{printf "%.0f", 1.5*p/1000000}')

echo "=== kernel $(uname -r), CPU under test: $CPU, ${DUR}s per phase"
echo "=== fair_server cpu$CPU: runtime=$FS_RT period=$FS_PER -> expected CFS bandwidth ${EXP_PCT}%"

# ---- leftovers from earlier runs burn the very bandwidth we measure
LEFT=$(pgrep -f 'bash -c while :; do :; done' | tr '\n' ' ')
[ -n "$LEFT" ] && { echo "=== killing busy loops left over from earlier runs: $LEFT"
	kill -9 $LEFT 2>/dev/null; sleep 0.3; }
OTHER=$(ps -eo psr=,pid=,comm= | awk -v c=$CPU '$1==c &&
	$3 !~ /^(ktimers|irq|migration|rcuc|rcub|cpuhp|idle_inject|kworker|ksoftirqd)/ \
	{print $2":"$3}' | tr '\n' ' ')
[ -n "$OTHER" ] && echo "WARNING: non-kernel tasks already on CPU $CPU: $OTHER"

WARN0=$(dmesg | grep -c 'cut here')
# column of CPU$CPU in /proc/interrupts (only online CPUs get a column there)
LOCF=$(awk -v c="CPU$CPU" 'NR==1{for(i=1;i<=NF;i++) if($i==c){print i+1; exit}}' /proc/interrupts)
# the label is right-aligned (" LOC:" on large machines), so do not anchor on ^LOC
loc() { [ -n "$LOCF" ] && awk -v f=$LOCF '/^ *LOC:/{print $f; exit}' /proc/interrupts || echo 0; }
# trace only the CPU under test (hex mask, no 0x)
MASK=$(awk -v c=$CPU 'BEGIN{s=sprintf("%x", 2^(c%4)); for(i=0;i<int(c/4);i++) s=s "0"; print s}')

cleanup() {
	kill -9 $HOG $CFS $HB $WD 2>/dev/null; wait 2>/dev/null
	echo 0 > $TR/tracing_on 2>/dev/null
	echo 0 > $TR/events/irq_vectors/local_timer_entry/enable 2>/dev/null
	[ -n "${OLDMASK:-}" ] && echo "$OLDMASK" > $TR/tracing_cpumask 2>/dev/null
	[ -n "$KT" ] && [ -n "$KTPRIO" ] && chrt -f -p "$KTPRIO" "$KT" 2>/dev/null
	rm -rf $T
}
trap cleanup EXIT INT TERM

# disown keeps bash from printing "Killed" job notifications when we clean up
start_hog() { taskset -c $CPU chrt -f 80 bash -c 'while :; do :; done' & HOG=$!; disown $HOG 2>/dev/null; }
check_on_cpu() { # name pid
	kill -0 $2 2>/dev/null || die "$1 ($2) died immediately"
	local psr=$(ps -o psr= -p $2 | tr -d ' ')
	[ "$psr" = "$CPU" ] || die "$1 runs on CPU $psr, not $CPU (affinity did not apply)"
}

# ================= Phase A: heartbeat latency =================
# On PREEMPT_RT a CFS task's sleep timer stays SOFT: __hrtimer_setup_sleeper()
# only forces HARD mode for RT/DL tasks. Such timers are expired by the
# ktimers/$CPU kthread, SCHED_FIFO 1 by default, so a FIFO 80 hog starves it and
# the heartbeat would never wake up at all - which says nothing about the fair
# server. Raise ktimers above the hog for the run and restore it afterwards.
KT=$(pgrep -x "ktimers/$CPU" | head -1)
if [ -n "$KT" ]; then
	KTPRIO=$(chrt -p "$KT" 2>/dev/null | awk '/priority/{print $NF}' | tail -1)
	chrt -f -p 90 "$KT" 2>/dev/null \
		&& echo "=== ktimers/$CPU (pid $KT): priority $KTPRIO -> 90 (above the FIFO 80 hog)" \
		|| { echo "WARNING: cannot raise the priority of ktimers/$CPU"; KTPRIO=""; }
else
	echo "WARNING: no ktimers/$CPU (non-RT kernel?); CFS timers may be starved"
fi

taskset -c $CPU bash -c \
	'exec {s}<> <(:); while :; do read -t 0.05 -u $s x; echo $EPOCHREALTIME; done' \
	> $T/hb.txt & HB=$!
disown $HB 2>/dev/null
( sleep $((2*DUR+30)); kill -9 $HOG $CFS $HB 2>/dev/null ) >/dev/null 2>&1 & WD=$!
disown $WD 2>/dev/null
sleep 1
check_on_cpu heartbeat $HB
[ -s $T/hb.txt ] || die "heartbeat writes nothing even without the RT hog (bash >= 5?)"
start_hog; sleep 1; check_on_cpu "RT hog" $HOG

if [ "$DEBUG" = 1 ]; then
	OLDMASK=$(cat $TR/tracing_cpumask)
	echo 0 > $TR/tracing_on; echo > $TR/trace; echo "$MASK" > $TR/tracing_cpumask
	for e in sched/sched_switch sched/sched_wakeup timer/hrtimer_expire_entry \
		 timer/tick_stop irq_vectors/local_timer_entry; do
		[ -e $TR/events/$e/enable ] && echo 1 > $TR/events/$e/enable
	done
	echo 1 > $TR/tracing_on

	# mid-window snapshot: is the heartbeat runnable but unserved, or asleep?
	( sleep $((DUR/2))
	  echo "=== DEBUG phase A: snapshot at t+$((DUR/2))s"
	  echo "  /proc/$HB/stat state=$(awk '{print $3}' /proc/$HB/stat 2>/dev/null)" \
	       "wchan=$(cat /proc/$HB/wchan 2>/dev/null)"
	  echo "  voluntary=$(awk '/voluntary_ctxt/{print $2}' /proc/$HB/status 2>/dev/null | head -1)"
	  echo "  --- runqueue of CPU $CPU (sched/debug):"
	  awk -v c="cpu#$CPU" '$0 ~ "^"c"[,:]" {f=1} f&&/^ *\.(nr_running|nr_switches|curr->pid)/{print "  "$0}
	       f&&/^ *runnable tasks:/{p=1} p&&NF{print "  "$0} p&&!NF{exit}' \
	    /sys/kernel/debug/sched/debug
	  echo "  --- dl_rq of CPU $CPU:"
	  awk -v tag="dl_rq[$CPU]:" 'index($0,tag)==1{f=1;print "  "$0;next}
	       f&&/^ *\./{print "  "$0;next} f{exit}' /sys/kernel/debug/sched/debug
	) &
	SNAP=$!
fi

A0=$EPOCHREALTIME; sleep $DUR; A1=$EPOCHREALTIME
[ "$DEBUG" = 1 ] && wait $SNAP 2>/dev/null

if [ "$DEBUG" = 1 ]; then
	echo 0 > $TR/tracing_on
	cp $TR/per_cpu/cpu$CPU/trace $T/phase-a.txt
	echo 0 > $TR/events/enable
	echo "$OLDMASK" > $TR/tracing_cpumask; OLDMASK=""
	echo "=== DEBUG phase A: heartbeat state (pid $HB)"
	grep -E '^(State|voluntary_ctxt|nonvoluntary_ctxt)' /proc/$HB/status 2>/dev/null | sed 's/^/  /'
	echo "  wchan=$(cat /proc/$HB/wchan 2>/dev/null)"
	echo "=== DEBUG phase A: what ran on CPU $CPU"
	grep sched_switch $T/phase-a.txt | grep -oE 'next_comm=\S+' \
		| sort | uniq -c | sort -rn | head -6 | sed 's/^/  /'
	echo "=== DEBUG phase A: heartbeat wakeups"
	grep -c "sched_wakeup.*pid=$HB" $T/phase-a.txt | sed 's/^/  wakeups: /'
	echo "=== DEBUG phase A: expired hrtimers / tick_stop"
	grep hrtimer_expire_entry $T/phase-a.txt | grep -oE 'function=\S+' \
		| sort | uniq -c | sort -rn | head -5 | sed 's/^/  /'
	grep tick_stop $T/phase-a.txt | grep -oE 'success=[01] dependency=\S+' | sort | uniq -c | sed 's/^/  /'
	echo "=== DEBUG phase A: heartbeat output"
	echo "  total lines: $(wc -l < $T/hb.txt), window A0=$A0 A1=$A1"
	echo "  last 3: $(tail -3 $T/hb.txt | tr '\n' ' ')"
	cp $T/phase-a.txt /tmp/dls-phase-a.txt; cp $T/hb.txt /tmp/dls-hb.txt
	echo "  (trace: /tmp/dls-phase-a.txt, heartbeat: /tmp/dls-hb.txt)"
fi
kill -9 $HOG $HB 2>/dev/null; HOG=""; HB=""
# worst-case latency, including the window edges, so that a freeze spanning the
# start or the end of the window is caught (no beats at all = fully starved)
read -r GAP NHB <<<"$(awk -v b=$A0 -v e=$A1 '$1>=b && $1<=e {n++; p=(n==1)?b:p; if($1-p>m) m=$1-p; p=$1}
	END{if(!n) m=e-b; else if(e-p>m) m=e-p; printf "%.0f %d", m*1000, n}' $T/hb.txt)"

# ================= Phase B: bandwidth + tick =================
taskset -c $CPU bash -c 'while :; do :; done' & CFS=$!
disown $CFS 2>/dev/null
sleep 1; check_on_cpu "CFS worker" $CFS
start_hog; sleep 1; check_on_cpu "RT hog" $HOG

OLDMASK=$(cat $TR/tracing_cpumask)
echo 0 > $TR/tracing_on; echo > $TR/trace
echo "$MASK" > $TR/tracing_cpumask
echo 1 > $TR/events/irq_vectors/local_timer_entry/enable || die "cannot enable local_timer_entry"
U0=$(awk '{print $14}' /proc/$CFS/stat); L0=$(loc); B0=$EPOCHREALTIME
echo 1 > $TR/tracing_on
sleep $DUR
echo 0 > $TR/tracing_on
U1=$(awk '{print $14}' /proc/$CFS/stat); L1=$(loc); B1=$EPOCHREALTIME
echo 0 > $TR/events/irq_vectors/local_timer_entry/enable
TICKS=$(grep -c local_timer_entry $TR/per_cpu/cpu$CPU/trace)
echo "$OLDMASK" > $TR/tracing_cpumask; OLDMASK=""
kill -9 $HOG $CFS 2>/dev/null; HOG=""; CFS=""

WALL=$(awk -v a=$B0 -v b=$B1 'BEGIN{print b-a}')
CFS_PCT=$(awk -v u=$((U1-U0)) -v w=$WALL 'BEGIN{printf "%.2f", (u/100)/w*100}')
TICK_S=$(awk -v d=$TICKS -v w=$WALL 'BEGIN{printf "%.1f", d/w}')
LOC_S=$(awk -v d=$((L1-L0)) -v w=$WALL 'BEGIN{printf "%.1f", d/w}')
WARN1=$(dmesg | grep -c 'cut here'); DW=$((WARN1-WARN0))

chk() { if [ "$3" = ok ]; then printf "PASS  %-22s %-10s %s\n" "$1" "$2" "$4"
	else printf "FAIL  %-22s %-10s %s\n" "$1" "$2" "$4"; FAIL=1; fi; }

echo
echo "=== results (phase A: $NHB beats in" \
	"$(awk -v a=$A0 -v b=$A1 'BEGIN{printf "%.1f", b-a}')s; phase B: ${WALL}s)"
chk "CFS bandwidth" "${CFS_PCT}%" \
	"$(awk -v v=$CFS_PCT -v e=$EXP_PCT 'BEGIN{print (v>=e*0.4 && v<=e*2.5)?"ok":"nok"}')" \
	"expected ~${EXP_PCT}% (0 = CFS starved)"
chk "tick on CPU $CPU" "${TICK_S}/s" \
	"$(awk -v v=$TICK_S 'BEGIN{print (v<80)?"ok":"nok"}')" \
	"local_timer_entry; ~CONFIG_HZ means the tick never stops"
chk "heartbeat latency" "${GAP}ms" \
	"$(awk -v v=$GAP -v m=$MAX_LAT 'BEGIN{print (v>0 && v<m)?"ok":"nok"}')" \
	"expected < ${MAX_LAT}ms"
chk "new kernel WARNs" "$DW" "$([ "$DW" = 0 ] && echo ok || echo nok)" \
	"running_bw/non_contending in deadline.c"
[ "$DW" -gt 0 ] && dmesg | grep -E 'WARNING.*deadline.c' | tail -5
RATIO=$(awk -v v=$CFS_PCT -v e=$EXP_PCT 'BEGIN{printf "%.2f", v/e}')
echo "info  bandwidth ratio      ${RATIO}x     of the configured reservation (>1 = server overruns it)"
echo "info  LOC /proc/interrupts  ${LOC_S}/s   (cross-check against ftrace; differs if timers migrate)"

echo
[ $FAIL = 0 ] && echo "RESULT: PASS" || echo "RESULT: FAIL"
exit $FAIL
