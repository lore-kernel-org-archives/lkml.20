Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792745071;
	b=T4cewfU76hhoSe/RTC3SFXis+7b1aBuFXJBIhDWBnCuxplrkCuCylMj6ei2Mi6SXCSGR
	 NpYSNQB8GJzb4HqDoJk/Tn39lVg0zdmCyDuJS+5vuDDc3/arc5bsTOrx4kxDeZJoLtudl
	 9vRS72+ITN4ynDdjTvYYdCzhs9C13ehA1fGuQ0YES0Y/gjakflc6iio/LcRbyVRowi+nt
	 f4KQHmhaGvgwHhHeTTxIpzC+QzpziZEQwxYipjxlysCxOlVhJoajswchx2h3vNccOW0bv
	 LqZmW7M30C5kFQ44SZPx3iqFEzAvY/mQ63SANbdTYu1MkymxH8iFGzaS7cIw5CZCc3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792745071;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QiJTPvABver/KbgoCiV+zVbLcbcatn0FsgcjjlGrP/4=;
	b=ed3AA1lEGhAm0IL+RZHLFuZ8OMdC4tGRJFVh2dV4i8XeOsAKbtruRk1bMou78dF5diIG
	 p+cQFiY0SiFrCPsuR30VTZ1pbxZY2fdOTdAwMcf9XTJFbEooplHSCHXqUhO0k2Pp9qp8B
	 BcXZQgnD+oPg74VB8IyLt6wX6mF72J/Qzab1I2faCMtjVRk5IwbLq/EScc0nsKMcN3Gz3
	 d1Xhsc88juYbkEcUOO5TVta9sJLUZihEe5y0nHspEMrezqOzn+mjlIDY7J3Yy5gGd1yhT
	 WayhGbfVcPs7wgsk6ZOi/qi3n4Do8s/UypBGOnX4pTwTHKEhcATLaERgEct8LWxi8gQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=TdTfPgGd;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=l9przFHb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2822606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2822606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=TdTfPgGd;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=l9przFHb
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7N9me1231560;
	Fri, 23 Oct 2026 04:44:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=QiJTPvABver/KbgoCiV+zVbLcbcatn0FsgcjjlGrP/4=; b=TdTfPgG
	dAjjkxt9xcyDnZn+Rdb/SPl03Py0qtt0w9EzDmYp4S8qn0G3Kv3eAMa5qU6RZWmJ
	GznKvBMbqsl4jq+GoQELISXvO0z/c0m7PcctjCSVTXzkd8LddpYNx7Ho1wGTAFC7
	74JUx+mpDj/De9qhFGLjOehcZpDPMpgshKIGvYBv/Vh8OuLx/ejtlEA4Xc6TmNwQ
	WEZPrJ7Be3o2Ytmp7TI8flitE0TF54uoUyVXdNTkoRYw1aVRuTpBmvq9UFNv/V2Z
	9/hg7AUg3ma0dKKO5cC/FUrEfluCtQ+HYO84SIOnEcNlBlRiZ4jUCtpGchY8rkl/
	XiGefgJ/HynN39A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=QiJTP
	vABver/KbgoCiV+zVbLcbcatn0FsgcjjlGrP/4=; b=l9przFHbqbmnVimMtj9GD
	nIOsIE63eyCP9G9Skz6L32yYYfOdP18I8vMYc2bnxZ0w6QnVfO2AZj0wJvFsn5x+
	iijJ6rzS8vQsLyOdGe4556wstCSwxTMA7jir9RChO1C2Py6xI0Y2rA75Bjon0cg1
	RlzsBsmZWNdrcTYcpkKZtwv3AEwhoSxXdmwei8ntbwYe5Za5XKVSk+8HJ7tuNpYA
	rOLhpc4pL3v3fMY4ZkQII9iTY3Amtcy9fJOBpuTm+D1ZPVazylINGau7EOGhert+
	lgUILfXYM1ujHHkzNBUHXHmSr891DUgL3IqqmkKSJUIU5UDCRvY9GDH4E3kg63in
	A==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012061.outbound.protection.outlook.com [40.107.200.61])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hg3570bp5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 04:44:21 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gF2uI7PlemgxZubc25MI6Fz6ErkuX/ghlyC97aZjDeOwId3P8S5yNePg/5W+OzaWQT9fUFE4/LDJfqfHcmfZALJLf9m32JfaZA9h/Fk5VAh7SWwOBqq+7VbyGbWfT43CTd6/YBWjKh+qSibZIMgPgRcKkSUqfE7OHGLNrkHhFYFOWqIXIEh4UKVtqWE1IH3NjWOBRLer3+TffIjwA3DgHEZyCPkBX4MrkcNVgUq8C+hmrrawVYwHtjND64iNrFNbpSbDeZyUF5obyqi0+THGA00I2xUag2rpzhy0WNfd39VKa9K8KPfwxpWX3AfTApluzaTYNV2fbd30bmfHxzftSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QiJTPvABver/KbgoCiV+zVbLcbcatn0FsgcjjlGrP/4=;
 b=L/0QSkJj9nveVa3cw/FcWHE3M84HsiOI+vooVnjPLEwDcF/uWWoX0+cKbQ71JbC8NjcBp/ENBOfKv2qOTCfIwOGh6CXUW0Ym/09bnYdCAvawvrC8dao8DblTSxDc2Yf7JLLm7MaTVxE2m55vp4P1ACLBpEaU04olrrcI2fc6DLHvMo39TLRc7Fjwn1OIC+kNxuLBcjBvj1vcxid9i5ewPWhIvC05/DQa76tlPkhwSS7a2WurLKCgd43a/Nrc9iz/9rq8KiLD7uzgLVpulEpjL/DU1e/FOuW+EjZ0oymGnK2myAkx6T7jjX9GcOankmGdOx1bFt+/ZuI46M4pxB6D8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by LV3PR03MB7454.namprd03.prod.outlook.com (2603:10b6:408:1a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 08:43:13 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 08:43:13 +0000
Date: Fri, 23 Oct 2026 10:43:09 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: shengjiu.wang@oss.nxp.com
Cc: p.zabel@pengutronix.de, krzk@kernel.org, hansg@kernel.org,
        linux-kernel@vger.kernel.org, broonie@kernel.org
Subject: Re: [PATCH v4 2/2] reset: gpio: Set can_sleep for the shared reset
 serialization
Message-ID: <atseDjfC3_I82oTq@analog.com>
References: <20261023071609.3795354-1-shengjiu.wang@oss.nxp.com>
 <20261023071609.3795354-3-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261023071609.3795354-3-shengjiu.wang@oss.nxp.com>
X-ClientProxiedBy: AS4P189CA0029.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::20) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|LV3PR03MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: 5964e86d-b641-4eb5-24ae-08df30e1ac8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|56012099006|261022075727099003|261021121427099003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lwaHMa6ezw5iM6Et4NF4EVeLe6W3ix/JGA8vzHZ2FvGMOKSZwI7ZpYwU1c/sm5Siuf9oOz4yBSXfVbH1FKGOzxXmF/dvK/CxdMcJxDIOBI1RTKuWaq7dzCIpenN8aFNOdYxm/qM875oh+OMrFnNi7Y2OqVVuy7ocRoWsjtXNPZe9qLe5pbpOsFVaQ/aCGubXa9yJy0nTg46ArT1jaSaPaSE/yv3bBmUzXZ0L1QnYWrn//8Evz3XCI9z9M1fYMNDcis0Gm+zA/QhIeR4VNaqinra+EgA2dnGvsAGmVDgWBfBlRmQ4VVTGkrTvQM/IPniTfECmpCSQANFQIsjuO/RWjYM8KKbJxVVdZWta+GAA84US6qhuMyvj2KCsAdH4XGoZUJgoBjB87TBboHaDrW6QIz4y/Eb3Yoffr4hcF09+RfQlXeeGcwMHqnu3HObUcDoXApUyq/rdhRDpStElDdokIcR2j5o+2cyua8pQ5/VKr8eRPSRcysO6cDawNFU5l0X5QmNj2vBQVY673wvH6chDLBS9eHk+auUIsfCk2iDbORlc/fdyzdJ/DOZ3UTLxwxouAr1VaNY6aXG+Mbs/mWAgS7TxqvCMf27rtdYD3mOu3wnjQOtKnf4EpV2ZHy/OrQJ0i5BvSQOkQtnfIi2SGtOY9zOtmkU/BeIomJqUafa/v1U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1ZZSlQ1WXVnc2UvUWVxNVVlRlZ4L252NVFlSk1DcHZFUDgyQUtDakY0am5G?=
 =?utf-8?B?Mm1mK0VZdUlCSzJ3Vm9FTjhCU1ROVFF0Q1hOMnArQ2ZLcVV3VGR2a3ZPR1cz?=
 =?utf-8?B?QUpoVC9TVFcyRFkxelJkN0t1Vk5CamhjSTZiek04VnBpWE9kYTJFNUVHRHZr?=
 =?utf-8?B?WEJ5Y2NQMVJGeWtOUUp5U3JCVkZzeVd1Vjl1cVZJajc4M1NJKzNPSmxqLzVC?=
 =?utf-8?B?bEFaZ3J0TG96eTVleGpDVDBueXRrTnBZT2ZxTDlvQnpXQ3Q3UjJWZitib3NS?=
 =?utf-8?B?Y0VmK3RnempBRzNOUmVHUVpJU0RSUEMyanR3V0g0VmZaeVRsQ01ZdTZQTHVO?=
 =?utf-8?B?dzM3a0VlaG5ieS9Fck5EVlJLZnFwdkZFaGFFVXVBL1FHTlZyTWI1NXl2SEly?=
 =?utf-8?B?Q2ZmUm82VkZRRXNUeVpaRVdTbEttdjNmSHpMYjdGL0RTQ0c5OTBVbCtaSVlr?=
 =?utf-8?B?bFFIQmU4K25PcmM2cUJacG1RQWhKQkVwTDh0QTFqYThUeFBhR2dXQk5LTWM5?=
 =?utf-8?B?VVdIa0JKS2F1cXhETWN5cVVMOFJqdFhNNUVNSTFIWkYvSE9JM0dQbEU2RDgv?=
 =?utf-8?B?Y1lvZityVzZDUFVuZk9GQ0ZuS0FUcXp4T0xqVk1sTWJydVRiaUY5NFFQZUha?=
 =?utf-8?B?UlJyK3p1UlUwU0JiTkJFVHk4OGNmSkRENEY2ZGExYW1BMm8vMEpqTlRlc3JZ?=
 =?utf-8?B?QXd4Y210Qzc1UjRUWG5TM3k4ZHJZaW9CTFJ6aTZtMFhRTmN6aCtsSW50N2FH?=
 =?utf-8?B?SVNucEJONytJWU5oWkZDVFcxdHdtLzhDangvZjM5eXJnd1NVbHRlaFM3Qi9q?=
 =?utf-8?B?RWY5alBhbFBjUTFxMngwakY2U0krbmFua2JGRzA3T0FKc2x2YWNnMGw0WEVX?=
 =?utf-8?B?Y2lueENoMGdlVDByQS82WXZ6d1FzS093L3hNVnl5aDRmM3gwS2FHdEROYytv?=
 =?utf-8?B?RTJCUlUwUS9pKzVSOCtEY21ONFpuWkZoQWFNWnR1a0doQVZNR2NMSHpkRGMz?=
 =?utf-8?B?UWJRQTJocDlZMDd5c2JjemppQVJSQlcvZ1NvaWRDUkZlcUYwWFJoT2dYUVVn?=
 =?utf-8?B?ZTRsM3NZTFFLcGx0TkpSQ2lCKzltVzdSNXVsdGFyTnJ6T1o1b2haa2Y4TkVk?=
 =?utf-8?B?K010YUlxRnB6MVExajZFR3VNak1pa0dqUFJCYXkweGtVNW4reXBVUTNVSGpS?=
 =?utf-8?B?YVllNXQ2MmFzaDNJRit5V3Y2ODBpamtmMmtLT1B5M3M3blBFY096RnZIODBV?=
 =?utf-8?B?TEMxajYxVVE3NkFFcWZHUUc0U3FQS2t1bFVmNUk2RWZCYXhjNjcvM3FxMlJj?=
 =?utf-8?B?TExwTnhSNWZOYTN0ZWZxUk93WHUzN2dZZUwreGErb0JkOUUwSE1zZ253T3dE?=
 =?utf-8?B?NjhabXQ5V3JvT2FJbHphWDkwTnJXRTBKNThSN1JZQVpHM0V1Q3kwek8wMHJB?=
 =?utf-8?B?Sjd0dEV0T3MwZjFUWVVybHE4dzNQNFhqZzdqbS9YNDBienN6c2NzUUIvWjF4?=
 =?utf-8?B?aFBmNFZra25FOFZmNDMycEg2YzJNUnNDb1pJZ1V5ZkUzaEhuYVlCckZpbE9t?=
 =?utf-8?B?S2o0bkVGODlRQzlyT0VCR0xtS0RmdWlLRVBiQ25tME1oYjdhV1BtZVZ3bDVw?=
 =?utf-8?B?cjFqWHl4anpydE14TkUyQTVEUFBQM2o5MkZRUFRUajlaNDdxRkRlSGI5UEcz?=
 =?utf-8?B?dGhjTk9LRk44dHovSWIzKzdRQ2hTLzY2RXdrOW9DR0xaY0FMY1MxdytTT2RK?=
 =?utf-8?B?L3dwbkpGZHN1RVMzeTY0TFlNcE56UEsvWkhaT3hSS2RSdHM4R2hjMTdBcmFs?=
 =?utf-8?B?Qk4wNzZjSkp3T0xaeU9iY29zYnd2alczNlpoaElGeTBaSDN2dU8xanFaWW1U?=
 =?utf-8?B?Qm45MEpWMjNVcjNiMU9VYTFDekl1MGw4cXl6K1k1OGVXb0pTbllmbnpKNFNv?=
 =?utf-8?B?WmpvODRVc0lFRDJuNXA4U1E2cVFJa2FDamkzN3lmN29lMHZlS3czNEpCWS9x?=
 =?utf-8?B?TmVBQjJsTjNuT1VMcndGbGUzWm5VNGV6M2Y1Q3hOS1pXSWE4QVhoSG03VUhj?=
 =?utf-8?B?Uys4enJ5UkhqUWJWMnVnclV0Lzh6RitkQUxCeXlhMEtlVndRbisvZXlpMS9s?=
 =?utf-8?B?SzhqREpnZTVVRnJocnMzVm50LzNZM2tWMUhraGtIR0FjSWErS05qMWw2M3RU?=
 =?utf-8?B?bWRsTHNSa1prbk00NWJKTDJSLyswQXREajh1UHM3MVpoM2FXL3E1VStPTEo5?=
 =?utf-8?B?L1pvbWh5cStzUnZVQUk2NlUrTFZqUVVVbklJV3Z1MmZ2WFNRS2E4d2M2TURB?=
 =?utf-8?B?RnV0TnVneHZ5M21LUC9ZaXBxSXhidGFmb3cyNURIQk5BUTVQYTQxdz09?=
X-Exchange-RoutingPolicyChecked:
	dBkileeLxajOVKU27UtN6ho/etUsMDs/OQuV7D/LvcJHLawMSCGsU4DfMKPAKfd55yLOUHexOUKt1M4nFhwv7q6NQxyoxMMG9t3RycbnhY3vTv2/wMZ+jNNaVq3p5Yb2Vo+6GRy8uS2CgV/6WmtPTmy67Vnojn48+ET5lDs2Q00op0U9Egp2QUh0rU5fB8oi/lqrl9cKSAi74frGApwt9x/zqLmqw/GBGwvWHFsscmnPXUCOIn67Wo5FMnxTKdXYvTDdfk7BdyFLN6/OjwGhJG5yaey15YwWHBFoawTIUJdpmNRw/XcZECr7MwZi20gGp7f6nENY+WAeacAuHJjVDw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5964e86d-b641-4eb5-24ae-08df30e1ac8c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 08:43:13.1580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: am/VgYT0UHEC+KkNkeqi32A9m0u6gm3bzbH1JU6hnCTxA6asQtW8i2kyykwggTY4xsy8H2/9E3iCYxxkKjJhVXoYYA0irzkbB/wRfbHKCeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7454
X-Proofpoint-ORIG-GUID: YwCy_6pPWHFAOAISTZuATqmuqwd3LCpa
X-Proofpoint-GUID: YwCy_6pPWHFAOAISTZuATqmuqwd3LCpa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNCBTYWx0ZWRfX3UZ5b0Nd8TTK
 Dycyl/COuXDzSW0RwWnm9qLgHUEBeKeHO8lfM4zy05mDXgkX6+29hU+YVi7CszSb5N5sYvfGnSJ
 Fr4/oqfAi4OUFyVYKz3iBUGFsS+EeGOmpUKuwkDv58eR/2Y/xnJdrLEF0JIMA4uwefl4MsdJacF
 grXsHjaaTYzCDX63ZKbkAOU19afnQ4X3BqAKxYhXMqvjzsizJo9RmUYyoI6ZD8t9/1/WayjkevQ
 Z56s4kD+S8qoDlcWltM22vk5YjSbnW+H/PT+SYUQlFTXF0mQWFM07/OVkyI4PuwmGsnHNq+1i9D
 /ygJ9SThSmXI9dkHCAnsvVRgqrOMvE5oYg+0N9LAgEepkNUMs6iovAEhzdpGGsK12rRjXit2UW8
 +665QjRaKK1XX9Nu6JpC5V0vIg0RmBdytS/6S7MDkJ8BqonmXT9K0NiUm8MGNdPjubXwiFDoQb/
 q6Aiklfdur11gqsWH0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNCBTYWx0ZWRfX4ehr6U0RlyiO
 SJiD2aebM0y0oXIQZnS652aqGrQvr9YL5Q4d35bnHAo8IqMehg/0cOx94+KkYBPDxesCwaPaM+A
 2REI18yqRxOAeOijvj1i+qASjdLcKWBtMWGf76hfTNNGQiuKPak8
X-Authority-Analysis: v=2.4 cv=V5PoQuni c=1 sm=1 tr=0 ts=6adb1e65 cx=c_pps
 a=1c0oZQ8MA7sDNsoFSDv1iA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22
 a=8AirrxEcAAAA:8 a=gAnH3GRIAAAA:8 a=wVGbJozpwyjaG-EEHm0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230034

On Fri, Oct 23, 2026 at 03:16:09PM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> reset-gpio drives the line with gpiod_set_value_cansleep(), so its reset
> ops may sleep. Set reset_controller_dev::can_sleep so the core serializes
> the shared refcount update and the hardware op under its per-control mutex,
> preventing a concurrent consumer from returning before the op has finished.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  drivers/reset/reset-gpio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/reset/reset-gpio.c b/drivers/reset/reset-gpio.c
> index bf95296a512e..b4a198792107 100644
> --- a/drivers/reset/reset-gpio.c
> +++ b/drivers/reset/reset-gpio.c
> @@ -67,6 +67,7 @@ static int reset_gpio_probe(struct auxiliary_device *adev,
>  				     "Could not get reset gpios\n");
>  
>  	priv->rc.ops = &reset_gpio_ops;
> +	priv->rc.can_sleep = true;
>  	priv->rc.owner = THIS_MODULE;
>  	priv->rc.dev = dev;
>  
> -- 
> 2.34.1
> 
