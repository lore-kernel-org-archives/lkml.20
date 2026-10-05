Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5609148C3F3
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 13:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206561; cv=fail; b=PJANmO0JjU06Ms+peSP4YPS30MzFSv8nD5kQj2G/Np4EZ055Jh6Eh1ceAUvNsbV7+z9vlWgoxAwy+rsASXFmC85AC2fjGi3fobufrz92xy5WgqCE/gjQQAdmss3brYd2DusRAPDhWgp4wsr/epEcRyySP0xQF4pfD3dd2ahrNnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206561; c=relaxed/simple;
	bh=fSzUJZC5qRgxIZwJG13iYKJ7eQm9fudqFjPmAu/5rkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VlqXY5/oeGmU7ZS3TmwwyuUqYExqKAjsyJGFF4DZuQUuqIIQ8FsddA1qLEjEcvJyMMOKB8qqdLLLz+6F3gTIkEImzVO3y0e2FzrGTiYcMbpFXwfQlXu8P9DCKuXKZIqu8t2nSIbK2gjwXjFbxHq5pRB95t5f8SC2eIJATreTgrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=EOBkvVQJ; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="EOBkvVQJ"
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CHIu82863808;
	Mon, 5 Oct 2026 06:21:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=5JASkz21yHh+t1aOm6igtFQxf874HvGujr52n3Lvhqk=; b=
	EOBkvVQJtGhoHstsobYfF2BXcxL+fePzM14u/2+/2FD1+aW0pvj26StzZuGhhavo
	otvt4U0jMv/TE1vpOtd8eKpNxnDT4DDQxTaN9pGSRA2squaefjwgkBpvtcdj/hld
	dUoqoAt8srinSssGbRHH4gYGwJgJWuo7dVc/jRYoewPvZMzeBP/00hLE01eHEhKi
	0Ve01Nygsu/whb5N2cWROs72IQ1qnGPW8gZhe4mpTiphcw1X5s83ml+9Fofz/cPw
	3wNS2gaYLCUurJMADnnSRt7/kg0JSDPlQLCSMEhjur2X1ZYYkNd1TkyK2V4JtOmj
	07BOtDmqbNwQpQMDRpB46g==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021102.outbound.protection.outlook.com [40.93.194.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h317ea01c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 06:21:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BbUygQx10wlz/9/INrezlYAIEbOsq5/Kdcy8fSWLg6oC3Vo2peu2X8aRC4ezsLYIIlui+pZTv+pT7OCeaoqptswKuwdgF5rk7Xf/BHNH4llpEU82voOGR8rG/sW0AaZ8288P/NHSiPjmI9qiDf+EIgQqhqNz19/Mh786SnBkgdX3OwUChhmv3VDHOGe7hfsveiU/M6iFlm917FVou1ZrS6jQdnQXrcf+wI4leZQU1rcQ9r/K+ObY0u8bqXd6aCE2AILU/6USwOf8iTlDz/aoZRulLFABg1qubva7vuZ8phUlrXN/zUyMgzT3Tz1mFWLk5HRvC0nJW+U62i2QsuLYDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5JASkz21yHh+t1aOm6igtFQxf874HvGujr52n3Lvhqk=;
 b=vOmyuzHJPm01EXYImczpvZqoDfBLBj0rvAAJlDUrDEgwngOLVwQABENPuvoLgzYkGCMlKdRV1ZNl8mF9hrgtvKvsI0+pbXu/sppPifUFsMptSNkNlzoyR/Q7bxBcxx4uJ3R0bEMSqxTDjY3J+fPKCn1bdx8vQU3LZjygXRpUW5aGJY9VuFN9D697kP37l+Y7alvT0+5dJEgcn/E56j55SyGlNnt+QlEFlAr6sW/F4CoaCJc+TgVvJHd1gRnEpRVr9do1V+XflBy8AfNADNGAaNixtltoSZeEPgtj8iWmGmdyTkbk+n5XvzUmI+AnziCzyZj532H0utZCON4sMzK7Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SJ2PR11MB7546.namprd11.prod.outlook.com (2603:10b6:a03:4cc::8)
 by PH7PR11MB7002.namprd11.prod.outlook.com (2603:10b6:510:209::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 13:21:08 +0000
Received: from SJ2PR11MB7546.namprd11.prod.outlook.com
 ([fe80::ca9b:dcf:8881:bced]) by SJ2PR11MB7546.namprd11.prod.outlook.com
 ([fe80::ca9b:dcf:8881:bced%4]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 13:21:08 +0000
From: "Ionut Nechita (Wind River)" <ionut.nechita@windriver.com>
To: juri.lelli@redhat.com
Cc: mingo@redhat.com, peterz@infradead.org, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
        arighi@nvidia.com, frederic@kernel.org, linux-kernel@vger.kernel.org,
        dhaufe@simplextrading.com, create0818@163.com, frn1furkan10@gmail.com
Subject: [RFC PATCH] sched/deadline: keep nohz_full tickless while the fair server is deferred
Date: Mon,  5 Oct 2026 16:20:38 +0300
Message-ID: <20261005132038.353661-1-ionut.nechita@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <araOR8aTAU_R5lwQ@jlelli-thinkpadt14gen4.remote.csb>
References: <araOR8aTAU_R5lwQ@jlelli-thinkpadt14gen4.remote.csb>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::18) To SJ2PR11MB7546.namprd11.prod.outlook.com
 (2603:10b6:a03:4cc::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7546:EE_|PH7PR11MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: d51ac193-5f06-4a60-ea9d-08df22e38445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|23010399003|38350700014|11063799006|5023799004|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pgiXe9qIRrlgXwqclNrUNskE+8XvC+Et26FroXhKdJ0NXTyqXqAaTevYASGaLqvOn6cS5mqGgF8ekYdZL9+IVL3yr0MQySXBH4sogyyUf5Hx6bZxILRlT4x9QZuuDjo4jIA5emJxdpJYv7hNsaptBQx8Yhj0mTIbGuUcMNQWdhBG4CaemZAtRUISx7W8qi2zWXxehTJluylZTlccX+H/h/iHklSxIsl/vD1jj9cXTpnugRx3+1R0kBtTv34jQLDQDGhFGh8y/t9BjWxWmLFlwT5gbijlQJEI6LUvFG+7LQSyh6jRh8C4hWkiv12hlXaZRbi3vjfk3nyz+fVXSube3ddEVQBQNytbzsjR3DrgNuZxhbr+NXy1V8rF6EcBCarKCAKmWV3u4O1jfUl0RgRakU56S1beavkOD75Pzyp+TgcRqs6KadFWj0nlImdrLnlLEipv5cIj4bXIgsfaBlZiWsk+3cXGlWA2mehOoZgpPKEaPPesJOPP7Nw5SUHkpQR9Tjwf0pr9oYIToW7WChViEt/s9FyDDcktg/mfdhV7ovFY3x5wRxTJpoNsH6a4Eow4iaqrzV5+h2+YxJy/DUOUVws3cVMBVdb1Q5EGy/dAUBbLlvcR7fhYB82ySmJadU9VtlOcnmx6Thuc1rcbp4SYnvbJgvUtXen/gprPSAcgQCE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7546.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(23010399003)(38350700014)(11063799006)(5023799004)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8/NIPcfcNxkLvljVk9TYxFRvOsChU/OZVZFxCxccCqCZiHjDFgIoaesHHX3r?=
 =?us-ascii?Q?2FYNmM/BWiZ2WRMo67l4SpF/WVRwxI2/iQn/HQU4urfn+ENms2O2SRaLGvqK?=
 =?us-ascii?Q?S59vm6PlUO3nR/4MHoqpnI9URtw7mvepat4z9N7xuMAqRxoja/18cMeDVRpq?=
 =?us-ascii?Q?znNoa3e+5z81bfSyy8rTgplUwPEiilOvUTm0TRa1nJYpT6mdvpbzzhqCHFco?=
 =?us-ascii?Q?y+2xyq3m8SUGztzY1KZcDAmvuxK5WTWbeF2HrI8oqcXOPfUn8iuDdPiCJAkb?=
 =?us-ascii?Q?VvqphU5jeiAUbhTSXAYQrBLMep2+jLr/+SMmgNKYYWKrP0Zls//lPuehF025?=
 =?us-ascii?Q?qjUy8KkcFefQ1iTBJHuJy8Xev2wff3WJEbT98Z0uIx55N14Rf0qwSdVFutk6?=
 =?us-ascii?Q?/n0g4hgkrmrTSsK3AN696mSePmaFugyZsMW8QrOAA1bhodz1gLCBhbyGbm6o?=
 =?us-ascii?Q?KKWnLprnARuHrvna/84ioDCAbeoWxEasjs6h4nhEJxOqEaELj/KFwNPqrWaU?=
 =?us-ascii?Q?EPON7A94rvK39kkDV0WQhw52MEJErADmnQBuuNiRY+I35NXdovUXSqvqMyce?=
 =?us-ascii?Q?+IV7YtPqnWYbSYHskw8s+HJ+duUpg9A5pDSybMpdYGvD+yHzU6yK0x2UL6Kj?=
 =?us-ascii?Q?9D67mbU9B9eucFV+guOsEluLNKDEhkXM0ytB6en+GA0ZrOYnVSkJIV21WMTv?=
 =?us-ascii?Q?t6bOktSP7+fvTrUWGCXCVsvkfaSULcAFynL5EaxXMduo/+e6GF+RKlkd6pL0?=
 =?us-ascii?Q?h3V6PxNGkycOiF+FzofhIQm2NS0jbcuaqiEYJsV7DVIe7cj09E5AgVoBQ8FY?=
 =?us-ascii?Q?zPUTJCldoVxHP6fkRp1brUy8aCHZ5p/rq01uWnyCm8AJcPjXK8xBRZhqoMaZ?=
 =?us-ascii?Q?G/Li2Lhnsqfv/+ZNQAOGvHKIqtNoyJWS7k2FbQz42M6rTvjos8aoOn/dCHhc?=
 =?us-ascii?Q?PnY3uqfvmxTcvwDnQlfU1Q4R9432Rhtvsr0f1jGRTqDr8YdUKTKWOj6Y4r8g?=
 =?us-ascii?Q?4gKO5o/dnmvUDX3ltHHp/Uc9FKffkJbDR49bXnEGxMI8PfBDXGaBYQc6WpdE?=
 =?us-ascii?Q?B6uqGb19uiqBLebOiEa+/dQw6dlRDAnhd418ATBr2daQuYe2m1Y9TQAkM/gh?=
 =?us-ascii?Q?pfNqlcFafs5/xfcBfx0ZHw01VFIXdC2whi1DcjzZP06Z3bBpSb3OCKdcPF6N?=
 =?us-ascii?Q?eVDqubj48edyqnPgAswFJHIFJzh1RdZDRYhlVrE+fEIGoAitJlsphVgr2rDu?=
 =?us-ascii?Q?sdLVx3nvY5B3W6K6P1WHl2v3sYr1Wp9IaxnQ8pQ+5oIuPv04077nxjQmx5cQ?=
 =?us-ascii?Q?9WnqhxIbOFgqSK/lbsWjmYE/0pMaOMjj9bhC+QUD9qOacZtZ3VkNuCG8u2c+?=
 =?us-ascii?Q?qy3n3V7rB8H79kpWmE/BMusV+tqrMQQfqtQc/dTCs6MLGtJQ6sepU8cvOQhN?=
 =?us-ascii?Q?Jl7Uss0dlJozsecT9gpBjnBhwy3Sjwu0ip7yF3tOK1nxAPd1ytzGhsS8hBKX?=
 =?us-ascii?Q?kM4/0M+6iFa8urvov4fW4QyjpWPNAf4so/ywXvjJe9WBk1AIBOWcCJvwTTF+?=
 =?us-ascii?Q?2Tso1VJB6J1Aj1ubtguntRB7hRqfXTTGuVNSZ/x6am7n0Vi+KYkZyNqS5RVj?=
 =?us-ascii?Q?/sj6pUDBInTK4CObMaamQxc8spcQCIwLAPLrPMdgEtA6NCr+GbTvZ3EETCjl?=
 =?us-ascii?Q?/leP8TEqLxlFoerhEG/ol3e4SGfoOq791RapQSZSUcaFi3mmeBPLPaG5ZU51?=
 =?us-ascii?Q?za6gqpDG8X7L1mkxS0of1+L7fQy+MaY=3D?=
X-Exchange-RoutingPolicyChecked:
	Ro0cU8w4IAjBkvLTuzlw58ma4yMS/VKM7hX2fQX4hYtu6DgjZtb25cpAvuCl39qBdaqm5Rxm2chrJGkN6EEMe+LIDRqTC+nfw9O7mdLnwRE0Ox/GoIqtAATRrQOuj5uGC1N7c/llv64irHODGmeuHghqjIryB3WEKKMuAXknLx6Nj+8D21I7fGq8j4F3KVe6a09t081KM72xb+UnlabGr4CWNsP4VnzQh3Pnp3/8uJw5CRVt0UxtmGxGMUdeXXmcFJmOx3WIydqvliVeRxILeB0m5KXWn7a2PMJgzasJdsJJ6Mt3msf1hX1D8zfl9/AVFB3JR7tD66v9bLl7fe3oHw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d51ac193-5f06-4a60-ea9d-08df22e38445
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7546.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 13:21:08.4445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMqp97VR+XnxQErlkB3lWA2VmlyByUOd4fjqcBtNlBi4kZ+9mHZH656Ie1NRDr8Dgdpsmr7N4kccT2qULGhTilVb7CbNfX9OHE9P3WeM8Po=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7002
X-Authority-Analysis: v=2.4 cv=EfVd0/mC c=1 sm=1 tr=0 ts=6ac3a44b cx=c_pps
 a=2fL0C9zJp+sLGwJJ/WOg0w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=t7CeM3EgAAAA:8 a=4Lh5N0H-V0axrIRf_B0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: fPhpLyN8skSbr3R2PCvhB48bisP4RdzV
X-Proofpoint-ORIG-GUID: fPhpLyN8skSbr3R2PCvhB48bisP4RdzV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1MiBTYWx0ZWRfXwCkW46emGgFZ
 8x08d59JeYU7zct5B7TK4qNNiJUxGttwk0KEA/jkMnDl9kxc8gE4d4eHDnI/R3W0Gsms3g+bFva
 Jm8VUoetqvoet7pEOMJfKld65CyOVUfAJARSWgaspr3qj6EA9DqC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1MiBTYWx0ZWRfXysdRbttSHCLi
 hww2R6+tTO2Q9GL75zzax1H5D8BgnAq95cX7wMsdY+G7Dz2fUC3DaY0PCWjccnHbcr+qgKH9Qpu
 0cIHr3I1+N7xXij7qoNrRda5BZcJr+xVqjW7u2/TqXbY/UrRrIeKbx4SoDxVyX4PwLzD6coKVL6
 6YWbILuAEd5qqoF7IuqCZR+5WBLCyFsPi+cWt7a0DmREKdQ9WcWlzPUI2wrKIDUyNLTYJMYI6iR
 Wr6DEmBbZKzG92ORhIp233QLe2FEIy8ZCqCrdKksOGtXrGujnBt0qBbdbgOyMIixIyJ2hBVmmcE
 Fg3iO8UP8oITQjwWbKStNMJlYy1DqEUK3WV/59FG7jywletSdxPIMHnn5ZoGkFemp3UjFRpJjv3
 4emM4JTyyTwJNbKUw99xvCiHsAz5TeKe8xsWdrb+3aakTZyaIqUjE0vfhMV3n0mfPL/eU2d5hjd
 XZpvBP/icKe2CT4fqkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050052

From: Ionut Nechita <ionut.nechita@windriver.com>

On a nohz_full core, arming the fair (dl-)server when an RT task coexists
with runnable CFS tasks is needed so CFS still gets its reserved
bandwidth (default 50ms/1s). Doing that from sched_can_stop_tick() by
returning false, however, keeps the tick running for the whole time the
CFS task waits, not just while the server runs.

The deferred server spends most of its period in the zero-laxity wait
state: throttled, off the dl_rq, waiting for dl_timer. That wait is
driven by an hrtimer and needs no tick. Measured on an isolated
nohz_full core with a SCHED_RR hog and a CFS task visiting the core
about once per second, the tick never stopped again: 200
irq_vectors:local_timer_entry per second, with tick_stop reporting
dependency=SCHED, against ~19/s with the fair server disabled
(fair_server/cpuX/runtime=0).

Split the two concerns:

  - sched_can_stop_tick() arms rq->fair_server when RT and CFS coexist
    and a runtime is configured, but does not force the tick for a
    merely deferred server. A non-deferred dl_server_start() enqueues
    the server immediately, which is rechecked right after and does
    keep the tick.

  - inc_dl_tasks()/dec_dl_tasks() call sched_update_tick_dependency()
    for dl_server entities. Servers skip add_nr_running()/
    sub_nr_running(), so until now nothing re-evaluated the tick when
    dl_timer enqueued the server or when it was throttled again. The
    tick is now started when the server is enqueued, so its runtime is
    enforced from the tick, and dropped again once it leaves the dl_rq.

The server is deliberately never stopped from sched_can_stop_tick().
dl_server_start()/dl_server_stop() carry the running_bw bandwidth
accounting of rq->dl.running_bw through the "active contending" /
"active non contending" state machine, with an inactive_timer in
between. Stopping the server from a path that runs on every enqueue and
dequeue cycles that state machine at a rate it is not meant for: a stop
that finds the inactive timer still armed subtracts running_bw that the
matching start did not add back, which underflows running_bw and trips
WARN_ON_ONCE() in __sub_running_bw() and WARN_ON() in
task_non_contending(). Teardown is left to the existing lazy path in
__pick_task_dl(), which stops the server when it has no fair task to
pick. The cost is that a tickless core keeps taking the server's defer
and inactive timers, which is a few interrupts per period, not a tick.

All of this is confined to nohz_full CPUs: sched_update_tick_dependency()
returns early for housekeeping CPUs, so sched_can_stop_tick() (and with
it the new arming) only runs where the tick can be stopped.

Based on the upstream proposal "sched/deadline: Make dl-server nohz full
aware" by Juri Lelli, adapted to this tree, which has the fair server but
not the SCX ext_server.

Ref (upstream proposal, v2):
https://lore.kernel.org/lkml/20260513-upstream-fix-dlserver-nohzfull-b4-v2-1-d3e9cbe5c845@redhat.com/

Fixes: 557a6bfc662c ("sched/fair: Add trivial fair server")
Signed-off-by: Ionut Nechita <ionut.nechita@windriver.com>
---
RFC notes:

This is the tickless variant I described earlier in the v2 thread, now as
a proper patch. It is against this tree (fair server, no SCX ext_server);
the ext_server handling still needs to be added for an upstream v3.

It replaces the dl_servers_stop_all() stop-from-tick-stop approach: this
version never stops the server from sched_can_stop_tick(), which avoids
the running_bw underflow splats reported separately in this thread.

 kernel/sched/core.c     | 26 +++++++++++++++++++++++++-
 kernel/sched/deadline.c |  4 ++++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 582c3847f483a..944aa45e10670 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1340,10 +1340,34 @@ bool sched_can_stop_tick(struct rq *rq)
 {
 	int fifo_nr_running;
 
-	/* Deadline tasks, even if single, need the tick */
+	/*
+	 * Deadline tasks, even if single, need the tick. This includes the
+	 * fair server while it is enqueued and serving CFS: its runtime is
+	 * enforced from the tick.
+	 */
 	if (rq->dl.dl_nr_running)
 		return false;
 
+	/*
+	 * RT and CFS coexist: make sure the fair server is armed, so CFS gets
+	 * its reserved bandwidth even though the tick is about to be stopped.
+	 * While the server is only deferred (throttled, waiting for its timer)
+	 * it is not on the dl_rq and needs no tick; once the timer enqueues it,
+	 * inc_dl_tasks() re-evaluates the dependency.
+	 *
+	 * dl_server_start() is a no-op for an already active server, and the
+	 * server is never stopped from here: its start/stop pair carries the
+	 * running_bw bandwidth accounting of rq->dl.running_bw, which must not
+	 * be cycled at enqueue/dequeue rate.
+	 */
+	if (rq->rt.rt_nr_running && rq->cfs.h_nr_queued &&
+	    rq->fair_server.dl_runtime) {
+		dl_server_start(&rq->fair_server);
+		/* A non-deferred start enqueues the server right away. */
+		if (rq->dl.dl_nr_running)
+			return false;
+	}
+
 	/*
 	 * If there are more than one RR tasks, we need the tick to affect the
 	 * actual RR behaviour.
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 72499cf2a1db5..3e50a59d16b52 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2036,6 +2036,8 @@ void inc_dl_tasks(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq)
 
 	if (!dl_server(dl_se))
 		add_nr_running(rq_of_dl_rq(dl_rq), 1);
+	else
+		sched_update_tick_dependency(rq_of_dl_rq(dl_rq));
 
 	inc_dl_deadline(dl_rq, deadline);
 }
@@ -2048,6 +2050,8 @@ void dec_dl_tasks(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq)
 
 	if (!dl_server(dl_se))
 		sub_nr_running(rq_of_dl_rq(dl_rq), 1);
+	else
+		sched_update_tick_dependency(rq_of_dl_rq(dl_rq));
 
 	dec_dl_deadline(dl_rq, dl_se->deadline);
 }
-- 
2.43.0
