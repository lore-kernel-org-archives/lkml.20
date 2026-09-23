Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AEA1DFF0;
	Wed, 23 Sep 2026 02:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131467; cv=fail; b=QpJnQmsryj5fGx/O+Vew64itRnrbs9NXCiEASXIR7MQs0JWvYptph3STPZ3WdH1kAf2nJZtWbLLYfil3vhgMZRojGvH4Pbt0bGWzMXBX4Q6yk5HVuJ9NCA4+wt7D0Yt+e4HWLYWJdKxZYH04zPy20C6HLydy+g+erFhf1UFZzRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131467; c=relaxed/simple;
	bh=6gRN6+2nzKQBuWZo7oX55liAG67icVTnknJwN6ss71I=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=DMeZMRmWQF3uQb5N5Vfk5wstpVE6QpvC0NJrCxmmL6jZ6dM1/ZCM3f/x83TMgyLhCikN8PZa0P1Xc+CUv5Xl6bTNqIBuKXA9dtZdGQua5gljuAhj7YMtG32yeick/f6V9t2REbwVjQRb5ZyCypgBQ/7J6WtrAU3ZhV5xo9Bvbgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TP2KRxES; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=s17zvCtM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TP2KRxES";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="s17zvCtM"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N1ucm72732367;
	Wed, 23 Sep 2026 02:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=6oIz1hICEBqOoHaS+h
	fwnhzMA5wmN1PDaRf36PDQw08=; b=TP2KRxESGYEMdJU+Xl4iTESLT+yuuNCesw
	kAzWgIOfZ8wd3bqa5I07GIJna39PEUyzhyT9yqKJfej03VK4qOzpX9OJQS31k6In
	eEmlRmVqIa3KcVT6y/G7OTt/sCU2vt1LHTq1smoMOhlBho3Pm488fHf4NkBmekiN
	fzgdwA3azHlJyz/WhvidnXPuxoDvHi+tN3WZM/W2pMOXw6+5hNE2Ibj2HvLRUw5a
	N/d51qo+7h7HXOBTwacxSKI3dIFJM7NvD/auWPB0GX5jJbfP5rXdTn/BsFjCfq2U
	NhrSLrqkbL1wTKZu7Z2yA5X6PgfXNWjoEfpxKQ0dsleZwMWPFSaQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gsk0h561w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Sep 2026 02:44:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68N2Z2Bu032714;
	Wed, 23 Sep 2026 02:44:10 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010036.outbound.protection.outlook.com [52.101.201.36])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4guurjw8tt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Sep 2026 02:44:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvVWcn9UBaT6Omz5gYQ9VCIV6Bx1dGEDz6llZ8FP6mckCcBfzMfoD0W3Bb0CO4wlfvY8raJjH5GaBK0KgAVY80Okxw2tOSsAijxWQfvuvP599dy36md5Y7yK73CuyZGgFXYrnVlUE8CWSwKZCrOrPviQ1CDkOULdB5gpTIZ+kqx4KOZUKCmypRzYcra6/z8mSwO4GPwwTJ20oxdIyEYkz/7DWsU/X+yCHVRFRIG1+y/t92sFZe7i108msP53QrpA4uP1q1VyFlek/lT5UWdJxVY0W672P8ULXuCI4h+lgOyU92O/+fcCy1ggqGEOP0tz/PlIAmv0B87UfDgsIHSfsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oIz1hICEBqOoHaS+hfwnhzMA5wmN1PDaRf36PDQw08=;
 b=ELs5Bqvz4glAKYRXylTYqcNtK4sc+V22QDqza3cINLj5duBFAFr6tKRoBQRIxoiblyYDCmNX+5Z3tXhCuHZOM8F8NGp8XDUjO1RnPJoWVbVLn4B7dnnLquJl4a8PrnLbKkU+tbVOrpa9AWcjACTxSi68aUfz2wQJW+XBMvMvf9qV12mEiwsouJKn4nKNs0BRWltNZJ0hTWh9Lx6Oymndlp23BN9awROJwbtHm4+N8uXCm7T2ZOSvZulV3JiBOCnQtgwhTc+JOuq0MrbZAbh/qYDSZfAIaLFTnIIeCp4nClmUB8tlyBp9vZENZnyzXqc316K7eq20P3k+FidJbP3Z4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6oIz1hICEBqOoHaS+hfwnhzMA5wmN1PDaRf36PDQw08=;
 b=s17zvCtMQT8s42dge9MLVL1bh6cAqYBMevfhRu1JUX8KPFdcChivOxuc4W+5t6kw3eXpXd7NjRpNc5lSFw5SVBOMaLG7uifwteQfh+iOx71GraQr62P/j0O9So5QVUkAbK4xeniyuSdfJmEH7k5UoRdySnyCPlqZ1/raYlmzcxw=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by CH3PR10MB7161.namprd10.prod.outlook.com (2603:10b6:610:12b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 02:44:06 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5%3]) with mapi id 15.21.0451.012; Wed, 23 Sep 2026
 02:44:04 +0000
To: Mark Brown <broonie@kernel.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
        Chandrakanth Patil
 <chandrakanth.patil@broadcom.com>,
        Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List
 <linux-next@vger.kernel.org>,
        "Martin K. Petersen" <mkp@kernel.org>,
        "Milan P. Gandhi" <mgandhi@redhat.com>,
        Ranjan Kumar
 <ranjan.kumar@broadcom.com>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the origin tree
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <aqxI7qklaslOJL7Q@sirena.org.uk>
Message-ID: <yq1tsngr8kh.fsf@ca-mkp.ca.oracle.com>
References: <aqxI7qklaslOJL7Q@sirena.org.uk>
Date: Tue, 22 Sep 2026 22:44:02 -0400
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0387.namprd03.prod.outlook.com
 (2603:10b6:610:119::21) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|CH3PR10MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: cf1470ae-f9a7-4225-6c9c-08df191c87b2
X-LD-Processed: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 4TSLHhENzbNI8Iun1jPUF81CuVDIkGwDE4fSDynyqWANwLbZiyqJIeECyiVfPqWXJMmuqGrMoEKYDjDi1CC2nN5gVO3cjsM6yRpBJVZx+V0f6A3Og0qAksU//CTqk0BQpew6JCQN6zkYdKKPX8+gUWENIf+vaIaYESZBNRXHUiJ4ZmWzQ4uKqDvZLYeHoPeaKns/rgYfpvwT2G5gk9SJkOALUmRvrSzequK4O55J4chn4C1d7yzIzzToI+vVUMhr2J+DPqL3WCILpnegjJrDAtXxwjrjEgtbHIkOhNTIFtVHhFsPrQj47dDHG9RZjQSLfqhx7ri8O6gX+UARx4d8mW9JWS1ZOeGrt7q64grFrEB5F6V3PBQAjESjPayBNgrdB+yynolP8IeR9nVgwL9tqZH4znz6dRnLZgrfQeZFe6Y9FjJaFJEm7I5/tzNLnd+Q5I1FmDLLfktaV7GJ9XCNVWa6fR7XAek5AiuQK82g4+0UzsSF+aYWGdIc1GgN/SHrxhepXq02QqX6BrnM82gIxFWJQXNL878OqsLLzSrD1uBbNr2q7mp7l8X86cH1vNxYClsx/qCw6gB740x7/grepZdV2b0P/dYL9TutK4gdSC7/73fKkG9NOmoOWH255VuaadycAS4WzBx00rFt52wfehwHfFncRVfbtgIRN37OeXY=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?XqVyRc630H4ye3I6YEf+SbgtLbw5DkqVFFOfCwBCAHnMkhCiLMTwLSath0He?=
 =?us-ascii?Q?squJQumjn1UypkfI8Nba7skMlZtjZK+S4+oK+4LD4gIpWV5kBQKTBcROc0Al?=
 =?us-ascii?Q?+z4/HMEa+vL0dXQITD2vTBLioTr45S5RLOJfmUkzB929fv06EIBJj9VADGEE?=
 =?us-ascii?Q?S6fgpgcBkn2lC0nb6JztcnmZZbOtUMoIi20wa7rmBGqgYjTxCr2T/w3ybr/Q?=
 =?us-ascii?Q?r3L6+IfAy0V4KDNqa+XpBGBaVxiFejVE09h2+EWQCDm7OaTcaVg8M2euM6zC?=
 =?us-ascii?Q?MRdiJyLKweBnJiolCuYzKo7kLTnqLQAXwWHw/aUnSVpsimIqLL1C3GWzGg8R?=
 =?us-ascii?Q?CD+e+xblUxjbGVUippEb/YdEQz9pdikAMps1W6xLS11jFZutDEdN2Zdfmz7Y?=
 =?us-ascii?Q?bVsRbycUzKDjSpEhEYNzL4UGQ5sPLuY9a86OhOsF3Xw6/vLNjkj8DmLBSinh?=
 =?us-ascii?Q?KJUqZQ/abo91f0jPg8ASR7Qrfjk7jKVtTlluVVW1IQm7p7C6qyAb8T+L+uEz?=
 =?us-ascii?Q?qqOc8hanZa9ygbs58zQ0AhlHBD2s9sfl/khWgGZS0qogi1FKAS6E9FZtNgHi?=
 =?us-ascii?Q?uRED28+QKbz0BlZqB7FYU0bMRUP+d/7ln38ie3kZLN2nyPWi32XNdsAJNAti?=
 =?us-ascii?Q?KL2f6BVLC/21Kw2tmiAP/XPvVCscRKmZrd+P/l/JHEfWnfKPLGILv57rtE2X?=
 =?us-ascii?Q?xauEQgGvp5PF0QkZkQA1QyTfUWfgugnr7O+xjLKElklLYwI5qxBVyBjpzc2O?=
 =?us-ascii?Q?7wxWpiiqMYt7E6W4hwiF88nK4LG72ITSeJtddliMFJkYrnmXHtsRtq2tSwGy?=
 =?us-ascii?Q?6Q2wWR0MF+htulPVGeOOa8N3IYaMrfju0QwpVP9ErwtmQaspDtZ5B90fMVJg?=
 =?us-ascii?Q?VdyeO7klOlkm0cyw4MeTlVw6E/Q5zrGcLBo8Dylq5/aMrwIsejj7fsOQiGHn?=
 =?us-ascii?Q?vHb914kSdsewuVNpYjQnQgLJHDp+oMQEeQ1hfmVk+snS3GCE488Zc7nPITTF?=
 =?us-ascii?Q?Pw5cJUGZ79WsPijjK7z2voKa2rC2e28H/uhMF3nm0ssWwiD6b/a3S/gqWk7D?=
 =?us-ascii?Q?ba6p/hxSP/9Kb0iU5LXSNPfLCDK85AMSkIIfbyx8lKjr4Rhm/IwK5fzaHWy3?=
 =?us-ascii?Q?HFcY/+3yelYFje5SP0QbBg+zSkB/cHk/YsEjPX3ibZ5oRMAIWAflFyVgKGRN?=
 =?us-ascii?Q?lklQ3phmcXkaLG1KkW+crv/LQRGHVG0mrQNgLlZFjm/O7hR02WH560abbXrb?=
 =?us-ascii?Q?F8M6I/vYcx8rYDJHoUrMtcDDsuYM+ENKa81ioD1gffIIejhBQLky247eqoRd?=
 =?us-ascii?Q?Og/1OxoWCsB5mAM0V7Pm6z9r+UdG+xBPZLLL7qRv6NlfX0gzwlPdhKI4hb4n?=
 =?us-ascii?Q?UP5gqX5tMAKef0SULgPaRnASsLmdkmq3AL1/YX8paFW8b93Dcj2xVrugey/D?=
 =?us-ascii?Q?JKJAJIoAcb6On+yT7tuyPckBodNVWi57Vleg8Q+x73DRIdk7ye6P1u/vy/BG?=
 =?us-ascii?Q?cZj2+yFkChQu7w2cZGmHcEgXRHbuclt9Gu8dqHBJr1tbN1PDvWS3FkojXBBy?=
 =?us-ascii?Q?2cuzqGv8pS7a9tgB6SONfS7E0DwxSVcMKohocR27+eUpKMfyLCwJj/2kHtmD?=
 =?us-ascii?Q?Ghczl6I1EdzxpTcLkAH9ir4lPCDcCGNts9Em5q2Qjts77PzSO8HTCcpzBmkT?=
 =?us-ascii?Q?GldFFB+eox8tQg0s/N4rQDyWc+Llf7DAMoVebcJxg3b47vzT6FVic46Ff2xj?=
 =?us-ascii?Q?STIrtKMHG+zIU0ywjxwI4HRsv4ZdrSo=3D?=
X-Exchange-RoutingPolicyChecked:
	VVG1NPDBq2GoM72iLyToDd65L1Wxw1p8E60wmnnvK4pXAS1wNKadWbKEW7rsI7g/IuAznlr2xXMLa3bQ1/ku9NBP6ln40PTOFT9DrK7tz9DxC5Am8sJrlcRtPLuclC8GVs+JHyZKe35MUmJeZtHk2DL7YhN7TiwtrpxHcdgPz3w2BgSQKtezfhKKcoy3xryh7fEAHkZCfLj7BIOGoEovo7826fdGel9mW5ehoD4S4X8JtRpv6oCxWb2j0/86BDFOw3ktxFtzCzQI6fD1nuKub6BEHUSebUZ7hxJT0uqdIh+dBYU7sz2WjpStPr9jWEQTUOeEl9TFd04rPVBmQviBjg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nnSlgM716A5UVdkSqC8okuS/RJhroHRqYdvI69AEQBzWmDe01o4Lroik8bZbKLC892030xSIKMFKBFIIAUZlpcpxUZzMYtcjrQ/Y2zKDOzVPvRBm1aRzGcescFr8cgYxCUkZU1/IZgm2unr5r2C56S3CCerYBy31TaANB3iDJ48Ma62vU3Z8Ai8WUx7PC4KLoLEPD43hFv3iCPmfrK5phAJm3RBFy7MrE6FxZ+HetxJat2xMWyhmkf8cxlh7i3M8va6MAMBprrmFrL3ToIMMEASS1SAMbHGXpPvWH3Bfc/ZALDy6jdauWW4zE5MLGeJa1DRrikR6xHPcY/9RRAWb6ShHrDP/E7eu7IKDjq8w00169htNyzkpgyZZ/krnMkZMl6PjOH1ZFXXW3oXx1cvB7cRygngim3d8kA0AvaqJeb35MULKvC1WuJwXGgAFeT18f4WR7iBj3L0st+YQUnHMleF9/BVjnwJMnMqxAsaQ71C/GGFpTnGM1PLi+KOVhWUeT8rL6w1toQObCw91gTlDUbzoLg+O1TqVy1RcVzsZCk+9O3fN8MtlAXNoFZsZAtliQIDS6hEZgD3UnIAPOz+6oLHT4/YUNvyeFckWNS0MGVg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf1470ae-f9a7-4225-6c9c-08df191c87b2
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 02:44:04.0043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+EVVkH7ydMmE6g7gkIH8E4wNYQ2FzjSnUwvcZjpVRTsIAwHVDuoP8c5+inD5JLkisDG9YGC3F3ameHI9u7XZsk1gp9vjIYk5M/vHuL/iCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7161
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=763 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2609040000 definitions=main-2609230010
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfX0eEVkY//3Tet
 IMcTnJ4Ermn/gQ6811GqScTTwpSkTTcyyX1dhbLMPomdkXV8MLLRYgoC2U4b6/R6IoGrTe4Sral
 oKfIaCYrO9b1kCbqMeEsLMvHMP4mNKAvIl1quKvDEFMY54xGsECU
X-Proofpoint-GUID: lxdrX9xgOFzjgwrP2NS2CVfx0brqin9z
X-Authority-Analysis: v=2.4 cv=CNa/zhrD c=1 sm=1 tr=0 ts=6ab33cfb cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=kz4-KFSQ7HH0njDw:21 a=xqWC_Br6kY4A:10
 a=VdqzKS8jKosA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=BqU2WV_vvsyTyxaotp0D:22 a=B5tsOBhPaCU0Y2GB4RcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfX11rkUGVvgvXk
 toZAj3BNL6Q95EebE/fB2A0diICMft4eR68R+RUizIwa4BkDdkLtLyAoGaNNhq7CZao4kUOfeMx
 hlsSPCTsighjCVOou922i20N9VhJO72n0pVgzJt7GAR/qlFiNeM+WQG8vy5Q/7gVMYvBR7QoVzU
 sGQ6COmVmsYdBg1pABr4zQTpK/Ex9dXbVIqmWqsYR06+pdYsKJHw16APwa4QutAmAa0uEoXeuHh
 pMnnMPMBuMHDhcZ2cADb4/QpjE9tZ5gsCSUnLpm0LMuFom35PlD2eBYeee+nzw/EpEBVxWK6QRG
 frkHD56cfHeQ7HwhHkmvMtpqOJTHlWurEqXo/GasIxxPVlHvEPOfeyYId4CMWFDUEcpstZlk2Mm
 uYd2Ri3fdwSMdUiTPGs/m42z7T8OgQE+ej6krxc8WRirhRdSG/MjJ7EL3lvqzn/q50KwApjxkv6
 ohpK0KORwr3Y5HKjfLQ==
X-Proofpoint-ORIG-GUID: lxdrX9xgOFzjgwrP2NS2CVfx0brqin9z


Mark,

> Today's linux-next merge of the scsi-mkp tree got a conflict in:
>
>   drivers/scsi/mpi3mr/mpi3mr_transport.c

Should be resolved as well.

-- 
Martin K. Petersen
