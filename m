Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917E951E44B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898327; cv=fail; b=j1xTjbcNjIKa+R9KUBCrEqzZ60YpXQQO1TTjPL0wTiA4tE6eSJMzmR4Ma0Y+mjQEUMzkjvv7AjjnRtgOUBOdqXgF61Chcs5FkepKQmsAvIDpoLfUpjvWhdLRdQIEUwqoXi8oNQiwXewnob/nRZdl8OV/2/Md/vCM//UXQgUd0VY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898327; c=relaxed/simple;
	bh=5PuM0xbyzH/RPzxKKFKJ32OHYUKuMuLdyIGeHACfPdY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=R03JHx2MaVM+BrkUpYDghicv9jx6H6OV7acGg86DpG0o2kuwfhci+rOXhKnsX/jomiw24KQniENtUGtgk6fNquBM8RkSh3yzo5uXdI3TEEjoOXflfM45U9Mv9VIOcevNHd/eUQRKs7I0wBBAdO4u8Xi/rkwSxBVeKgFIu8BjR58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=ocaCXGqS; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="ocaCXGqS"
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D42OH6231407;
	Tue, 13 Oct 2026 06:30:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=a3dpbzaXJ
	6FR77p339x8jZB2cS4ir/h0adXLFzfthGw=; b=ocaCXGqSatfF+kTWDnBA5dTJz
	b0L9xTz2Ov3qnf5vwIdCyB+MOR1BOJmLL/VZQcsEUl7bb7aOr+nKtoMztBX2ixOg
	o8kqDrcP3JY1/PWFLB9X+gsFjBWji4LHwisXBdiDSvf4KXgTChphSTxL5Qocc3Vu
	GlKmDX+XWQ4v/LiTPM+G/51daUuPX7YJwlb4R7ReNfA7EwzZlDAweb+0/x/4Mt3y
	Gi/17KJffLjZ8Kuj7T6sVXf5YzVRe4JRkdhQK+OybbqUoHuWUkBB6obhcbYqTptP
	qnWCDO+OHbq3w7BbVwg7owyJ2rU/ZLawd5asSucPqQJ4lWcGtIJqAb1IjzHrg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021136.outbound.protection.outlook.com [40.107.208.136])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h7gn1c5fv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 06:30:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHxmzHwNN6nyd/2c+JFMhRgbm21kiHaD6qlFTb+OMuzwmIErf0f9g1ukdqjmWaHAJAsZxiZ9/ES7muWOqlgJc9ee7qBktFAiBqOyxVMV8XQXSVjKx99ltTGBAQrjI4x+FilJaoO+0HscnAtqaOdMAwILgJqcCY6uBFh3d+pJuLuNMymO1UARxNX6afoGR4Fb1hJhj+apG8xzmWdGWfLNWPJdBGZOh+Cnpq+qjGm9FHrzF7L88H3NAVbxbQTKnvtnUMCveljoy8lVz8VhzixiP6hMJyb1idA3ZT2/+c08oXOsBOFJNwd2f+bsTsSTuolM9qvV4bmkSeXNWFHWjwLtkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3dpbzaXJ6FR77p339x8jZB2cS4ir/h0adXLFzfthGw=;
 b=Vo8BBVrsJjqvd1irPnYfRRgWCIfihKATsie4+crR8M4/fTrJRJTAuM3NappCIMrVFc2JUSTzQVtbufRtTck3m+77s4XepCKM0LhRI+1jhm/ZpoEenM2G6YX6X7zox9ELQqVVEsUthy8Sg5jLe3PczdMGr3i/G2eYKPvTISdX2QHFX1Z69aU/ydocGCkFWxGAAV+c7ZkvGjAY7hJD3+JsQOi8+kyJNoCnnBlc0zbrh0ywurlwAt8wRC/gZwbW5hCd6Z//lCAz+skT86czN8R3f//MrcoMVf3qu5IUtw5q8QvQluW5qPiA1MEZMtdz681OmiGyIOJ7xm0eF8iykAqr9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SJ2PR11MB7546.namprd11.prod.outlook.com (2603:10b6:a03:4cc::8)
 by IA3PR11MB9225.namprd11.prod.outlook.com (2603:10b6:208:570::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 13:30:33 +0000
Received: from SJ2PR11MB7546.namprd11.prod.outlook.com
 ([fe80::ca9b:dcf:8881:bced]) by SJ2PR11MB7546.namprd11.prod.outlook.com
 ([fe80::ca9b:dcf:8881:bced%4]) with mapi id 15.21.0472.016; Tue, 13 Oct 2026
 13:30:33 +0000
From: "Ionut Nechita (Wind River)" <ionut.nechita@windriver.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, kprateek.nayak@amd.com, bristot@kernel.org
Cc: arighi@nvidia.com, frederic@kernel.org, linux-kernel@vger.kernel.org,
        dhaufe@simplextrading.com, create0818@163.com, frn1furkan10@gmail.com
Subject: [PATCH v3] sched/deadline: Make dl-server nohz full aware
Date: Tue, 13 Oct 2026 16:30:10 +0300
Message-ID: <20261013133010.390823-1-ionut.nechita@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0232.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::16) To SJ2PR11MB7546.namprd11.prod.outlook.com
 (2603:10b6:a03:4cc::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7546:EE_|IA3PR11MB9225:EE_
X-MS-Office365-Filtering-Correlation-Id: 037313dd-eaaa-4458-3a8f-08df292e281e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|23010399003|5023799004|38350700014|56012099006|11063799006|261009223027099003|921020|10067099003|18002099003|4133799003;
X-Microsoft-Antispam-Message-Info:
	aqARohoYNnIVrWTjKJ6yz8N72by8gmNmZyBY/gp1J0N617ncNlp+qO/2+6Kgj45Pwf/euFWOM3wHd/x3dXTXdzUfSz4qE0q+TggjVCkOp027o7UrjiBS2vAZaohYUKZaepHu6bde6+Tf2eaT81AFgCgzanuZWXSyqgDTrSJPXRm36Koa6bqghIpzElEnLyZbXkDYaJi6VQSkN9tOJj+R9rnOzls0kViZd83HqlNvw91pnrGj8PZblS32Y1OPerUr2LMVQMi6eq1OSFuXsu7vr9+0wo5p5jt5uc2SfNhC30hRITuuKRcmOqQ3qlXXXpiqadRB3mHH6GqkrhPMRFcQXmhl0qa7juOR5pRzSdgeVggUb/8Y+TDbe79Qdjz1KM0Rxp6h3qF7UpNoN3kwPkN2mURDjTBw+qGCUjpnKJlt4hsMDwXu02ToylvGm5MLL8mMmWylXP803DLONYePAgzvDpc3hxoRjt7bTQIjlMLO5EEAKVIl7VjMVxJw6gHph22JSEuxAjROMQRPN1Pp5TSOqtB667j1X2H8bHa4sxvk3vl3FvwaEJYGEk7bhW8XEWC/Jk7dDUh94m7aLOt56c3l3AK63u+CNry//mRL3irCktR864X9AWlUtbc/fKF9Hrs3bugSGqX0D4WjQBkU8nN0drbXNwvTIGzP2RmmeIcABQyxCGQ+MM4cmMkz5kCvwtWC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7546.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(23010399003)(5023799004)(38350700014)(56012099006)(11063799006)(261009223027099003)(921020)(10067099003)(18002099003)(4133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hFGg155DCbrIJyh+XA9KNzhvpme4KsfE+oAnCKzybZWU2DUbbpcROG8nfxIX?=
 =?us-ascii?Q?R06HswVzqdjzqHgD1PYNDJWN2qgY6b28kDLmlICEGRTxF2bc8bbR5WqAOS7H?=
 =?us-ascii?Q?U0FRsEoemjjb4Z0SjBfG8PoUJ/I9i84X2qqp9xPVVuh7XM97KVzV1XqoUMrl?=
 =?us-ascii?Q?19mzsK5iBmO4cUu+/Lffs57XF2x0j2rhP73Ux2OkFjKCdru8BUXNHN4MB3od?=
 =?us-ascii?Q?c9HF9AmXLWlGpJPXrr0GA4hWugD92fsRPpZdcWZipHtwt2EAlrPkkC7kKhhi?=
 =?us-ascii?Q?BrubwfFX/mDvwj/h3bZB8G179DNS97GlH/c+sxS4QQ8ysWv11Sn0jYey2ydr?=
 =?us-ascii?Q?d/QWZnYz4dxQkfvvujeaXcdYhnrIi3CokS1d32n8R46ogEGEk+ng3xuPdMLy?=
 =?us-ascii?Q?cN0btTHlIihqXjP9PVD9zWe8qgzoXZBkMx93XXAZX4Ne6AwYW25WKHajWG9h?=
 =?us-ascii?Q?8RhwxdBy3lrlhy7ehXd5YHaDK+izThTuIvbeM0qII+ybDwFxZzvP2WpdIBg7?=
 =?us-ascii?Q?jxjT/Mz0CG+ovoMy2vljOcK5uVwh2diPeMIC3/JEvQ3lNxR94+8SsPN2hL1M?=
 =?us-ascii?Q?tkeLN8Kc0Vf5WJGbxFJnf/6KtnVBn55Nx1LIhI94HHraBVXcn4HWO4Kk34lW?=
 =?us-ascii?Q?p6cVCd/CpbjKZionV921/RBEbiRRKUt1exs2b+jNhJH9Rn0A+HKhKsLQNKlK?=
 =?us-ascii?Q?OEHMvEgCblPHAswijkT8EUR9WJD4QLAuEKU2c1BfsPLOib5iDA/UC5bbRuV5?=
 =?us-ascii?Q?YZkNcBTy58TWNOM45VUUm/98zLJwIBCXtJ0asM50ZgXpkCuIarj7XQxWPhds?=
 =?us-ascii?Q?lLkqsxht9ZIOFxLeNaTMSVRfnYPsS1T2eh906LrvsA1ZAkCuOc/T8dJzGA93?=
 =?us-ascii?Q?3qO22VA9MQA/oVrTpCyZrhsdtHd2MnPkFTK7yIFI4xXYZPsvhWdciCxPYs7w?=
 =?us-ascii?Q?CDiQOJB9XayARJNO7e6nhMpQDw/BNyLnjTFVTCiUs6VTUPeQd8czEbnj/Roo?=
 =?us-ascii?Q?sw/NktJg4KUpwG/7mSkNJHbr7su1P7PWe8gK43Flqha9BMonXUFWLAO5PZSZ?=
 =?us-ascii?Q?jTCHp8WIUaAz1J7WreExq/ZBP4WvH7JBOSho2nKuqxhVxomrpmyIBLLNH+fF?=
 =?us-ascii?Q?xNIXZ6sqi3MM5MXs3sH/Q1a7M7aeZ2JHnUU3ECXvkUoiGdg+JMZMHRtxs785?=
 =?us-ascii?Q?0r1v+MuVaSALii0elMWowwwQ43U7yEgRN1d3TvqLCXuchGf5qorUteeVxY53?=
 =?us-ascii?Q?OT9p10HU4z1orecNLQQwbA4VNY5seuY6YHzFhagDyox4afxQLn9croqZsc/u?=
 =?us-ascii?Q?RRj1wVgcJ8ThBFMNPPYdLkcw6+IWTOtv7wIglR4QXpTYZAREfmfLdf2QbrGt?=
 =?us-ascii?Q?R1gY6IB9uS8XpiwDQY7D6/ophhHOfaTGbN7dMfxdgjao/IiX5n5q/RzPkKDy?=
 =?us-ascii?Q?/UqWIHIvwoZMiv9L1pXu+MR471OPYnsuIpvjOxu8WpqAnWcI8beArWA2uru7?=
 =?us-ascii?Q?MYCV2u8Bl2jzCIDzkcwofbMtSCrmDlDiCwbvD9NYiA9y5LzJu0IRb4Bc+4ZP?=
 =?us-ascii?Q?+Y7N3aXPjJfANb/QUnvNDgNnUNNL2gP9Ejez6R5TIoHjnZgCIHID3hTbiV6G?=
 =?us-ascii?Q?hxVee3M2Sg42GA3xIckvW5X/rRY33W4amMwzCka+D+hVs2CKRLpmnGeaf+Oc?=
 =?us-ascii?Q?eevYujsxaOwsyr89YVQ9Xv80W/GA1ynwC/k4lPZWqQBxxjQmvRFIBRRhk0U2?=
 =?us-ascii?Q?1qFeGRNJoj05zCzhoderFjPPmDgzfvk=3D?=
X-Exchange-RoutingPolicyChecked:
	ofV3ztV+F9hCkqBVhX94uZvTToNhF1hahXBw7pcM3LNT9RcJGMVX9igumsG/BNGqEpqTkiS/aLVFyYQ7CnZ/6CJEC2K8kdWdvZwYo8ErMsWW18bvj8/SZ5XmzHFfZ2zrs2G9kSxrolDpzrjq4/ATkvb8PrmUY0o/+Gi9re4JrbBWMVQIzxcLt06Dp49caHHYKXDyz7DYqZzXy87Uh9yhpQWS2BOy+SW4QHnzFDOz/1j/Fi0VhPS5PzHVtN84ZjhTnzmqDTRv0U7E0TkBU1PyVZshEHXj6mSCfGgKlr2zv6aNaEovAddTFRQfcIeBj6yoWPc6iIgknnYElF1wB5a1Dw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 037313dd-eaaa-4458-3a8f-08df292e281e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7546.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 13:30:33.0421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0xE7hWvV/IQmPdpsPhDRjvUXIDVzrwzyjoUvxLjMicVP+4koH7GPmImy8lMZnqSXk/As8dLpXEQeXl2JKBrafIUWqZqj/cDtFIMS0AFiSvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9225
X-Authority-Analysis: v=2.4 cv=KcNHIgYD c=1 sm=1 tr=0 ts=6ace327c cx=c_pps
 a=peeJaRLe+dxo5n1sA3bZUg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8 a=t7CeM3EgAAAA:8 a=QO0YudM4AAAA:8
 a=yy9QRzVUvq-zgqN4uI4A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=mZ76Gs-kvWrgDyQdcV4z:22
X-Proofpoint-ORIG-GUID: SSOK0p-Tat79gZeHTQeGaQaYKKEGQMJO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MyBTYWx0ZWRfX7M7ZRDuGHxLX
 keYhbgJye9nt+Kdik5u1Ts7HPEPMN5heV0wJXSAQM/s5a+eBqB+/nUEVqN22QWtNN2crjakLT0F
 0yohTCAgKaVV0XIZj1Ki9MQ6i5z+ck1t7Efx7VC36aHb3FAi8vNX
X-Proofpoint-GUID: SSOK0p-Tat79gZeHTQeGaQaYKKEGQMJO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MyBTYWx0ZWRfX8bMP8Yut1qUq
 TZHAZFII9yhpXRjCSrPWhSgGGFKElzFBxdqYnyFDW1antEz9/8PTmvsCdWTR0tYILcN4sStwl9D
 ojTCzWN32JLNQR+4jT8+8nccSbDKPZtcmvl6xfjuXnraX0NwV4i5VbYzHtD5TXyE43wbk0W/ft6
 s69ZEBEpfqs1zNzBtHPJSIzdylnvu+r45dqkL6d2un3sYPP0ntvoplXW2K2ORXZknOuzqrOhbV2
 GSHR4omfqzXe4Fc0cp/U9ikCGd4BVZEMsrDiYBJkejx8ESpd7AHe5EPw9VI+hgWHXXzLEEATJXF
 K/RJyfz5KNvR5yBe3xoJW0q3aZguMRj9y06SmZVF2bS2T8RYrATiJesSYDvXKQoiTT8WkOawmAL
 JMcODmXWl8c96JOkBaVZrhWAf+K+zOVTSEfrfzKgaMEpQ+7Ku1NXDkEwMymPhtU6jt5YH6Ufdki
 EMon9i/JDfLCF+b7IDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 phishscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130053

From: Ionut Nechita <ionut.nechita@windriver.com>

On a nohz_full core, a dl-server has to be armed when an RT task coexists
with runnable CFS (or SCX) tasks, so the lower-priority class still gets
its reserved bandwidth (fair_server default 50ms/1s) instead of being
starved by the RT task.

Doing that the way v2 did, by arming the server and then returning false
from sched_can_stop_tick() for as long as a CFS/SCX task is queued, keeps
the tick running for the whole time that task waits, not just while the
server actually runs. On an isolated nohz_full core that is the more
expensive of the two costs: measured with a SCHED_RR hog and a CFS task
visiting the core about once per second, the tick never stopped again
(200 irq_vectors:local_timer_entry per second, tick_stop reporting
dependency=SCHED), against ~19/s with the fair server disabled.

The deferred server spends most of its period in the zero-laxity wait
state: throttled, off the dl_rq, waiting for its timer. That wait is
driven by an hrtimer and needs no tick. Keep the two concerns separate:

  - sched_can_stop_tick() arms rq->fair_server (and rq->ext_server for
    SCX) when RT coexists with the respective class, but does not force
    the tick for a merely deferred server. A non-deferred start enqueues
    the server immediately; that is rechecked right after via
    rq->dl.dl_nr_running and does keep the tick.

  - inc_dl_tasks()/dec_dl_tasks() call sched_update_tick_dependency()
    for dl_server entities. Servers skip add_nr_running()/
    sub_nr_running(), so until now nothing re-evaluated the tick when
    the timer enqueued the server or when it was throttled again. The
    tick is now started when the server is enqueued, so its runtime is
    enforced from the tick, and dropped again once it leaves the dl_rq.

The servers are deliberately never stopped from sched_can_stop_tick().
dl_server_start()/dl_server_stop() carry the GRUB accounting of
rq->dl.running_bw through the "active contending" / "active non
contending" state machine, with an inactive_timer in between. Stopping a
server from a path that runs on every enqueue and dequeue cycles that
state machine at a rate it is not meant for: a stop that finds the
inactive timer still armed subtracts running_bw that the matching start
did not add back, which underflows running_bw and trips WARN_ON_ONCE()
in __sub_running_bw() and WARN_ON() in task_non_contending(). Teardown is
left to the existing lazy path in __pick_task_dl(), which stops a server
when it has no task of its class to pick. The cost is that a tickless
core keeps taking the server's defer and inactive timers, which is a few
interrupts per period, not a tick.

All of this is confined to nohz_full CPUs: sched_update_tick_dependency()
returns early for housekeeping CPUs, so sched_can_stop_tick() (and with
it the new arming) only runs where the tick can be stopped.

Fixes: 557a6bfc662c ("sched/fair: Add trivial fair server")
Reported-by: David Haufe <dhaufe@simplextrading.com>
Closes: https://lore.kernel.org/lkml/CAKJHwtOw_G67edzuHVtL1xC5Vyt6StcZzihtDd0yaKudW=rwVw@mail.gmail.com
Suggested-by: Juri Lelli <juri.lelli@redhat.com>
Signed-off-by: Ionut Nechita <ionut.nechita@windriver.com>
---
Changes from v2 [1]

- Rework the mechanism following the discussion on v2 [2]. Instead of
  returning false from sched_can_stop_tick() while a CFS/SCX task is
  queued (which pins the tick on the isolated core for the whole wait),
  only arm the server there and let the tick stop while the server is
  deferred. The tick is kept, and dropped again, from
  inc_dl_tasks()/dec_dl_tasks() as the server enters and leaves the
  dl_rq, so it runs only during the server's service window. Measured
  tick rate on the isolated core drops from CONFIG_HZ to ~the service
  window (see commit message).
- Do not stop the servers from sched_can_stop_tick(). Cycling
  dl_server_start()/stop() at enqueue/dequeue rate underflows
  rq->dl.running_bw and trips the WARN_ON_ONCE() in __sub_running_bw()
  and WARN_ON() in task_non_contending(); splats and a reproducer were
  posted in the v2 thread [3]. Teardown is left to the lazy path in
  __pick_task_dl(). As a result dl_servers_stop_all() is no longer
  needed and is dropped.
- Keep the SCX ext_server handling from v2 (arm rq->ext_server when RT
  coexists with SCX tasks).
- Rebased onto tip/sched/core.

Open question for maintainers: because the servers are no longer stopped
here, a tickless isolated core keeps taking the server's defer/inactive
hrtimers (a few interrupts per period, not a tick). Peter's idea in the
v2 thread of marking the dl-server timers PINNED would keep those on the
isolated core itself and address the housekeeping-side wakeups the
original v2 targeted; it was parked pending a remote hrtimer_start_on().
This patch does not depend on it.

The running_bw underflow splats and reproducer mentioned above, and
Peter's PINNED-timer suggestion, are both in the v2 thread [2].

[1] https://lore.kernel.org/lkml/20260513-upstream-fix-dlserver-nohzfull-b4-v2-1-d3e9cbe5c845@redhat.com/
[2] https://lore.kernel.org/lkml/aszViUxPLBuH0h7L@jlelli-thinkpadt14gen4.remote.csb/

 kernel/sched/core.c     | 32 +++++++++++++++++++++++++++++++-
 kernel/sched/deadline.c |  4 ++++
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 71d3c948e14ae..0177c950a4885 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1440,10 +1440,40 @@ bool sched_can_stop_tick(struct rq *rq)
 {
 	int fifo_nr_running;
 
-	/* Deadline tasks, even if single, need the tick */
+	/*
+	 * Deadline tasks, even if single, need the tick. This includes a
+	 * dl-server while it is enqueued and serving its class: its runtime
+	 * is enforced from the tick.
+	 */
 	if (rq->dl.dl_nr_running)
 		return false;
 
+	/*
+	 * RT coexists with a lower-priority class: make sure the matching
+	 * dl-server(s) are armed, so CFS/SCX still get their reserved
+	 * bandwidth even though the tick is about to be stopped. While a
+	 * server is only deferred (throttled, waiting for its timer) it is
+	 * not on the dl_rq and needs no tick; once the timer enqueues it,
+	 * inc_dl_tasks() re-evaluates the dependency.
+	 *
+	 * dl_server_start() is a no-op for an already active server (or one
+	 * with no runtime configured), and the servers are never stopped
+	 * from here: their start/stop pair carries the GRUB accounting of
+	 * rq->dl.running_bw, which must not be cycled at enqueue/dequeue
+	 * rate.
+	 */
+	if (rq->rt.rt_nr_running) {
+		if (rq->cfs.h_nr_queued)
+			dl_server_start(&rq->fair_server);
+#ifdef CONFIG_SCHED_CLASS_EXT
+		if (rq->scx.nr_running)
+			dl_server_start(&rq->ext_server);
+#endif
+		/* A non-deferred start enqueues a server right away. */
+		if (rq->dl.dl_nr_running)
+			return false;
+	}
+
 	/*
 	 * If there are more than one RR tasks, we need the tick to affect the
 	 * actual RR behaviour.
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index c0ebdcde5fe5d..589c4c881c31b 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2259,6 +2259,8 @@ void inc_dl_tasks(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq)
 
 	if (!dl_server(dl_se))
 		add_nr_running(rq_of_dl_rq(dl_rq), 1);
+	else
+		sched_update_tick_dependency(rq_of_dl_rq(dl_rq));
 
 	inc_dl_deadline(dl_rq, deadline);
 }
@@ -2271,6 +2273,8 @@ void dec_dl_tasks(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq)
 
 	if (!dl_server(dl_se))
 		sub_nr_running(rq_of_dl_rq(dl_rq), 1);
+	else
+		sched_update_tick_dependency(rq_of_dl_rq(dl_rq));
 
 	dec_dl_deadline(dl_rq, dl_se->deadline);
 }

base-commit: 4a3b51aab6e25244d97936aa65e6d5425adf98e1
-- 
2.43.0

