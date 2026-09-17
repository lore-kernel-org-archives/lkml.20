Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C1C539776
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664569; cv=fail; b=bd0T9NcsubAjZnk1isY4VPqQg5K+Sq1OKidXtp1YMMW7GNuILC4Vh5WInS+hRP4aeP8L+gSrnPDpARDt9DM0nSTWUJfjkF6EyQXokBi9yVCkk4c5NIeM5g3Pa00cUOx9Z73nY9QDmea5pMdAA8ZgeSrvN3j4Ljhjnt5OdGWY9yQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664569; c=relaxed/simple;
	bh=njh8VaLXYKEZCZQQzVIm3U1Idy9EWcqvboSyaJzyk98=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=T2p8L4FJxxSoXCP19atPw/rpwVNKGmyPT01EHlO0c+0jvV+l1quorlYTRcWasyi5L0fRsU7vgApGEkqte1FYAkRIiMdBY7yDiG963pIauCBhH9PrHcS7FV+NK5eQzqmVs0iSMsvvBdGlG1SR+Xj65/5JHjDaiOxo+IAg2YRhHOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=l7V0/IOU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OOmQSfi9; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="l7V0/IOU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OOmQSfi9"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH0esQ2313510;
	Thu, 17 Sep 2026 17:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=njh8VaLXYKEZCZQQzVIm3U1Idy9EWcqvboSyaJzyk98=; b=
	l7V0/IOUAQo9su20CNG0pHnr+6zpZ7DM2m6svC5YDRDRYXb2IfaKwmjQvQrHa+nR
	u3JhOls8Z/65IxzPU3NHxBC8poGfkt9+8yr6UZ+c2eGqBWwitk8IliY/dVRO+Eab
	P2DWAi3L5vqxSODmTcMGw2midSl6hVLbV9KZsa5vB5E6D3gGbwIINzVRybHikn3u
	T2yVkPJ7LvlC+ftijx58T1L8KgiOe8hvj7KMkQ8lUs7RueYe7sAqfcf0QE7It7vt
	Ppp+Zoeu0+a2spK/TwoXG1+DHaEh2FPWf7mJQ6FPxhyOxFU7O6/Zy9RlXCjNulXI
	nkXaKmS+3K7MVfDcfhB/HQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gmxsbr1vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Sep 2026 17:02:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68HH06JA015256;
	Thu, 17 Sep 2026 17:02:03 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011000.outbound.protection.outlook.com [52.101.62.0])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gmw6d8ctf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Sep 2026 17:02:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpD/A6xewz7bjvRd1jM7uYn9AwPUvNcbFjZnCGT9QO8kckYE1NODJnZ+yr+qiHcM+3FHkHYcpM0otf8u7dOZyUMOxRaYFylceQpouYFdG60WNVy15n8sUWBQFeSIgRVg33UKpVNzCc0pnn9DCzCwld7ZEPyBrNrk3qabGkasJ71MqLFkq85bM5YgLKR9doi6lW9Sx4+Z8fQQpbHpiir/PTiShaa01+qQhHBOsFGprL5JhW5iSYMbY0a2FFF6PGjf0JKD3gg9uVTblQtQOKD3JMD/qI36cbcNP5aMvTMxT6650npzrfoM61+6kBIM71TnFSGEQtgLH2GKKMVHnosMYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njh8VaLXYKEZCZQQzVIm3U1Idy9EWcqvboSyaJzyk98=;
 b=QMApwlz8ImfLZNUkuEGmLDNbTsl0b+NGVtTRpsA09H+0v3FFsrfs9V8oNuLTTMShVTGQY+qroZMuQFZZjT233eBpxE7fM4mPXxGG3u5TiOhUHFfvtVCSLEF+8dFSeyE1OGNUA5GjBfRytFMar2QCQZ0l6dVUBcXANhq3NAGqZd6dGy0iKe8xSz7tW22KBCAawwDdOWa/ut0h5Z7U62XuW2urbeGLRL4G0ootgFExayyx3H5EEpuZzNPnSjsxsFN0/BOpm5pnFdPHAikEaG+5aUq7gHZg4qruNGvK6jDF8bE6Nq8NwTev9RSrAOGqeTRC1JkmAwvtIol/VIT+A3Vnpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njh8VaLXYKEZCZQQzVIm3U1Idy9EWcqvboSyaJzyk98=;
 b=OOmQSfi9FgJnqm8QJb1CozCP0cHAPfe3Rmnn0INwMbeJOZw5U13Y7b0hZinYY+X4GkvLO6IzLqUuGEPXli0Q3eLArJ4ziNVpnnw02BBLCOSpWR9FDBjlIbAcYszbpWZIyoiOXSUdE9BV0CkErHnQGuL0LliRXZC6Z5cmw6jsbj8=
Received: from PH7SPRMB0087.namprd10.prod.outlook.com (2603:10b6:510:2b1::12)
 by SJ2PR10MB7620.namprd10.prod.outlook.com (2603:10b6:a03:53f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.5; Thu, 17 Sep
 2026 17:01:57 +0000
Received: from PH7SPRMB0087.namprd10.prod.outlook.com
 ([fe80::527f:36ac:6913:b2ae]) by PH7SPRMB0087.namprd10.prod.outlook.com
 ([fe80::527f:36ac:6913:b2ae%6]) with mapi id 15.21.0428.004; Thu, 17 Sep 2026
 17:01:57 +0000
From: Haakon Bugge <haakon.bugge@oracle.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>,
        Will
 Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Davidlohr
 Bueso <dave@stgolabs.net>,
        David Laight <david.laight.linux@gmail.com>,
        Linus
 Torvalds <torvalds@linux-foundation.org>,
        Yafang Shao <laoar.shao@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] locking/osq_lock: Ensure proper locking semantics for
 osq_lock/osq_unlock()
Thread-Topic: [PATCH] locking/osq_lock: Ensure proper locking semantics for
 osq_lock/osq_unlock()
Thread-Index: AQHdQS+HO9g4YAATvUCxWhZJ8gUG7LbN9EOAgAD9ogCAAGNyAIADtLsA
Date: Thu, 17 Sep 2026 17:01:57 +0000
Message-ID: <3B9DE734-464F-4D49-981C-9E2FC850C3D5@oracle.com>
References: <20260910141908.592414-1-longman@redhat.com>
 <20260914112225.GA3500130@noisy.programming.kicks-ass.net>
 <eeb26779-1423-4487-80d9-bcf6d6fbe097@redhat.com>
 <20260915082608.GW4121339@noisy.programming.kicks-ass.net>
In-Reply-To: <20260915082608.GW4121339@noisy.programming.kicks-ass.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7SPRMB0087:EE_|SJ2PR10MB7620:EE_
x-ms-office365-filtering-correlation-id: 68564f13-1cce-4c49-9feb-08df14dd61e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|7416014|10067099003|22082099003|18002099003|56012099006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 hjmUJPxuUHinl//zE+i3dHF56rhU4XWKxFijzqDdKzyXwFxB7Bp06ozV80wefoqR6CP5HMQr81Tn+IADcx457dQ/wliI+isXvqQWC9nzuyOTep24Yr5unbnENGR1CTVDdoDcePCF1HTTZQgHmHM5BGSB+W7VtJtR0Zs/f58XDhB3lF55o4GRy8rY13A4ncieaUr65/TvD2Rb043jsMtHZWSo4sRFY4YQlLUkY3wG7SLSFuMCs5mHcuPal+wp7GwJkJT51aDOHvK8FUk38shiVpGFsgae7ZShYD3PS7V5bEIoc9HQbfl34Q19wzY4NJzVbUHA64tbvweCoQhmZYlkB80fWVyLDu/Ab6fvLfkZvofnHqW0O1uLMCP6tdhE5eUnv/23PS0qjVWcqWuU83FUaP9bUS5qPpsADXD0wvxl4w1IUfIW6hz6HHhVZ7Z5fEl/ettFAbv7MOxDIGNUjnRBqdAgeaH4OiHh+8XRAa70wq5WpqxuAKs+9ENlqOk2mYJKpzn3cmBRVdB0CW3Nk6iAAp9kDXDiyjaWePf27AqtbdXQGkSvTpNvQaIWh+3WDDJedI5ht8/ncG8R0jhgYJ/rZB6LeXV0UKlIbjBtB3mThDi91Thqso2qF2gxuKgXu/55pkmJ/h/SOy/6RkyMo0NAsHlsrKxe24UFPS5FGitJLGdZh/kLa02/Y+0sI3Qne6bk1mUTgvUNzzahNPuBXZgdNA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7SPRMB0087.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(7416014)(10067099003)(22082099003)(18002099003)(56012099006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SmxkZkJwTGdXRTBUbVFsTU9CTUdUZDVkOEpVVXRYSHRudXZzRDRyQnpnclJQ?=
 =?utf-8?B?QmxseW04ajUrbG1iUVJRNEFCbmRtelM0TE1wSFJBQUJaWFFRYUFDaGZTdFZW?=
 =?utf-8?B?SEs1L2pmMWxQZ1pKU3ZLRnhtZThITXErbFB0UnZNdm1DTUVMcEpGMS9YZmZh?=
 =?utf-8?B?bnVtU2FWU1RQTk9WUmxIRStURnMyVmpWNDArRFpkRnJhOVlXN0ZQNVJTVjBD?=
 =?utf-8?B?b0JQWk1iS0hvZ2VqWHowUDdkVmNMU3JVVU5keVpsekxiNkFtazNpWUN4M1RR?=
 =?utf-8?B?QktkNkZ0SGk3S1RTZUVIT3hOTTJsallrTEhBcWV0WW5ONUpMQzdXdXJaZnhB?=
 =?utf-8?B?ck9KKzVhSDVCZ0lhZENWMXhxS21qeE5ncElzbFBJekVVaFF3SFVXZDh3eFoz?=
 =?utf-8?B?Z3FYY2J4Q2FkOFExS1VRNm1uTWoyT1VybUM1dGFkQ0VlOHlLcGwwWjBIWFRa?=
 =?utf-8?B?NW8zRFVwZmFIUWIyV09ySmtIYTZNY0NkNGtzYjJiMWFHY3NiWVJnMERsckdp?=
 =?utf-8?B?RTY1ZCt4ZUlUVXA3djhCTUFkNVd1SHkvcWxlWTFSSHc4cUNaa1NNQ01ZWU9F?=
 =?utf-8?B?KzBhQmVoSmJyRVFjYmhRL05hM1Y5Nk5xU2VrMVVzL3RCWDIrZVBLTTJSUHhC?=
 =?utf-8?B?VkMzMC9FYmpmaHZ3b1ZTNmZRM2RUOW14VHpxM0J3bnZTL3IyTE5XcmNqSnV4?=
 =?utf-8?B?ZVhIcXl0NkgrWXdBY2ljVDRCZldUNzg3REExNFRoRzRMMnFKUTZhM1ZNOGI2?=
 =?utf-8?B?WERUUDFGNmhRWlFHU0ttWkFqbEswSFNNMkxOWUMyd1IyUHNiNkNnbXdjVjNm?=
 =?utf-8?B?UUtXc21CUTY4NDFkWWhzNndKYnVCb1lkQnh4dERyNWE0ZWc5L3BuS2ZyNHMr?=
 =?utf-8?B?eElPUzlVUzhtV1ZqUEdLcVU5YTVpbWtiRmZDRVB6cFd2UWgwbjI2bnpjRzlJ?=
 =?utf-8?B?ZzdtS3A0c2x6NXVsdmNPRkl4L0RPNkUwa2RseDc3R3g0azFkSzNpbUI5OUV3?=
 =?utf-8?B?SnpyV2Q0emNLUXVOTXhkRkRUVEZDNlFQNkNWUEtzYUw2dnNRQWpKemx4NnpQ?=
 =?utf-8?B?RnZRWmRXZ2poY3JOVTNOem5zSVMzZGljdHVSbHhsWGxId1QySDdIR3JJSVFx?=
 =?utf-8?B?ZUY0MHdHRVNISE5saUM3cklXeDZEVG5zb0NsY281dTJkejhDWHdja1BxWjFG?=
 =?utf-8?B?NjdNQndFcURoUEhJUm9NbGZtVXZNblBsY0dIMXg5eUNVbWk1SkVMM0dtRUdw?=
 =?utf-8?B?bGQzQm5kek41Mk41S0NhSG5rMU96Qi9yZGkxQTRRZXIvOVppSTIrdytPT2lR?=
 =?utf-8?B?YjZMNTBVbm9IRFQzcW4vcUFkV0ZuQUxKdHN3OXordDBJb1UvY0dvb29ROUdp?=
 =?utf-8?B?ZVBjMktGdmNoYUZYZmZWNGRldmtvK3QrZ2FBak5HUTM2aEs3OFlMOGcwUXBN?=
 =?utf-8?B?VVA0M0o5OHlQb1BGdWpRMVcvaFNuYmQ3ZFYxeG45YmdadDF5d3cxVWVjblFK?=
 =?utf-8?B?WkQzK1QxQUJkZHcvTnUrS2xINk12ZWtsbjdhWVl0eGtNNjZrTE81aGVYR0xa?=
 =?utf-8?B?dysrcUxFaXBET2pmUlhIU1hISEZocEMzR2s1Qm5aVVVWUUlNaCtQZE93MXk1?=
 =?utf-8?B?UFVIcnk1aWJKS3lOUk1DYmIwd21wTHJPZHlVVm9mcWdwZ2tad2p2MmV6RHM3?=
 =?utf-8?B?VUFZM3BqaE5yZitnVHFmYUc0NmVVUHdwTUVQemFlVDNtLzhLeDdONFRxUXM4?=
 =?utf-8?B?NUNNbWJuTVhNTGYvbGF2SXY1b2Z0eTMwMnJhZnRqb29ac3MrSWMzdHRVb3pQ?=
 =?utf-8?B?b0NrVldiblVUbzZqaVZIMFdIcVhCelZGeE00UWMvZUFWU2xHenFkV0MrMlYv?=
 =?utf-8?B?UkxQOWUwOFRLc3ZyUFQwNEFVZHFJYW5qb2NFcHEwNTIxckIxbEdhWW4ybVNt?=
 =?utf-8?B?Y0pOSDNIN25DNkQzaU05WlFLbFZWNXJwbDdMRVRleDhSb2FKQmo0ZlpReWx2?=
 =?utf-8?B?d242WVF2YUZoVDBUKzFCU3VVZ0tZUEc3bzB5VFhUbjE4Ym9SOUZFb2Fvb1hG?=
 =?utf-8?B?Tm9qamdOVEovL3ZYNWsrZ1ZYa3VKbEdHWlYwTEZTRmFpSmVtZHRUYXhVQVZv?=
 =?utf-8?B?dGtmWkl6WlZ2bmtKenluMGluVnNPdTk0eUhJRUxMMHhHb0xvU3NBdTN3cUJy?=
 =?utf-8?B?K0VyVmJQaFVmWmhlRGp2M01IRDhlNHk0amxKdnlaUzVBT1AxcGlzU1ErMVIz?=
 =?utf-8?B?aUVRWURyb3VnekYwZzhxaWFhOEUrYWhqZFpxUm5QY2pXOGdVQ3VxYS9BNWhO?=
 =?utf-8?B?STVUUURORDNBdW5GamRsU1lkVkRmTUNzQklTcHJsQy9xckM2aWRFYVl1MWt4?=
 =?utf-8?Q?xc+TPc5UTY0HrWTE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9918EBD595AB2459200B286801C9C87@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	V9yrwwyPThrVDs44s0vYXHuS0JIa+w9caEtN7ukxkodSd5J83yTVfwWxK5NUCdSAF3zLwWhPujJN09iv6NysahR/ngvK7q3dEGDVZZVbJEZ5TaJC/mPxtJMNU23VpgPtrYQL9S+0f4ZrJYlWgeh2eXoOlHgb7VZhtno3RLtuwQN84Vr9Y3anXhGoGxtsJdRkTHkv2bcrlizaQyoj2Mqb1H+5QNYG5B1jpv0RWWJj9Xx473HP9JtmMcNtFjBGAPKls8lyFxn+t6IDjc97lDJbP7z5PVMaaFI8B+T+Sibr7qh8500FPA3IDaQYvVrMwCro9qj8ij5cAxd8arktv29WKA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iFrFOipgWTeWSDcI4T1IUme/gmz0ZXD0TGid8t1w0onLGotZBxSPdbiqbTIuASFldtxZ8ktTPFHvy84iX4U6ScBnzfyGdvUpb5Yw2hquJBuzYS8DMo9qnHyBhZcXCcrmdAWsVxEIruRhhCfoZZhhmFPeXP7zb5Cg5THXfsfgWRvF2IcuCXQUuX7DCkC29FzclaOgQlNAwLmQPWxwHA1nRBGXHxfsuP++h5/+qM12hvHpgAqYVIi6ey4VSsSPfBt2sXQB+yzLTH4q8IqHrmtfmT5It6/iaek9yuvZUor2GgGhGms16pBxxE1ZuTkfsrGX/hGFIYL19GJg5bKMpEHbdz8j5EJw3ehRiuST3ZDAQ+JvodegJOJYd0whUyGTk0W3eYyz6oyRZ1HILulznbTtI3um1zGEU05wBUvNAl2RwC4uPJny1FEz2VM70y18tAhmzpqaQSfJtj4l3IidzRmjAIoohCyCdIJGnBc/TASdZzZYnxyyMwTBmz9v+ENiHVd9t9m4oJObLIOCqhX3G2cELZLEvm9LvsszA6Zjzklnz32+6X4l1MwhYue0tpvCLOnRoXTpfqZy0CiXuWIMSMd38OZypDchmvRpnmQez6JsDh0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0087.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68564f13-1cce-4c49-9feb-08df14dd61e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 17:01:57.2419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N0odd6JyZ7Dxxn2LUiZqPW/AlbltTbN61EQ4Q1XErJICVzzAY8wM75NzCNTDVnqgBzHLQ0GMef1cfpUWRulfwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7620
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=607 malwarescore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2609170242
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI0MiBTYWx0ZWRfX0p8CejKdG6Aq
 UD2UoklDDyBpzZ0fdZ0sUs3lAtorW+ue/8nkBEZMEbVV2lVaxKnCEk0B3TxHpIek4NdftYljtMO
 ZYhEy2n+i2dR+g/HJMUGkPG3ZbNuA1n1EI8688/lDiAt5DjZlXy4mNfz2SAP15LBh+rnu1UHGY0
 sz/kId8KY6iAs5VwMVd0DQJVmF6VH6H8+w6g2IQj5EuhL3ht6lxGXVSchLhsG9gXr1gvlJa92iV
 rfwJgFQxe4C3g2ID7qPbVfm5yqG5Q++Ql4AJSORuvqp5eNkeMQu4U6yPLsTOLsdaFTIt6iaOqP2
 YajE6mgAgtLvhDdZV1ZLJqe57HJEkpPidsaI+BUleLo/jRWdsR70pmoq1KNYviujjGtbuDviNeh
 uP/aYZ4RhRwqU6ILzCPOP5Rj15mEeaZ7su8wN80LN+RPgekiZBZyxq7uDzliuDDq85V3KyFcA9n
 DqcOFYi5gvjydclJdEg==
X-Proofpoint-GUID: JadunNdq9Ya-GpVPoD9Bo8912CFy7wWA
X-Authority-Analysis: v=2.4 cv=dY0VTnXe c=1 sm=1 tr=0 ts=6aac1d0c cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=GoEa3M9JfhUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=BqU2WV_vvsyTyxaotp0D:22
 a=JfrnYn6hAAAA:8 a=6CnOr8j3r5DEXMZ63HkA:9 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: JadunNdq9Ya-GpVPoD9Bo8912CFy7wWA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI0MiBTYWx0ZWRfX+OpwbntgYsTh
 RXo4dsSXEMlTzWyoUzP0OzOTN97G/sV1Hq77xHHW/16J0G3/PH1DmqlVWpaxzFhTmbHdyeH+mQU
 CGUROpxKcdUQVeVi0LV7yYmUwPES5zGtWa3Yk+izQm8OIQ7swy6m

DQoNCj4gT24gMTUgU2VwIDIwMjYsIGF0IDEwOjI2LCBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOg0KPiANCj4gT24gTW9uLCBTZXAgMTQsIDIwMjYgYXQgMTA6MzA6
MTJQTSAtMDQwMCwgV2FpbWFuIExvbmcgd3JvdGU6DQo+ID4gT24gOS8xNC8yNiA3OjIyIEFNLCBQ
ZXRlciBaaWpsc3RyYSB3cm90ZToNCj4gDQo+ID4gPiA+IFRoZSAibm9kZS0+bG9ja2VkIiByZWFk
IGluIG9zcV9sb2NrKCkgd2FzIHJlbGF4ZWQgYnkgY29tbWl0IDAzNmNjMzBjNmJhDQo+ID4gPiA+
ICgibG9ja2luZy9vc3E6IE5vIG5lZWQgZm9yIGxvYWQvYWNxdWlyZSB3aGVuIGFjcXVpcmUtcG9s
bGluZyIpIGEgd2hpbGUNCj4gPiA+ID4gYWdvIGFzIHRoZSBzbXBfbG9hZF9hY3F1aXJlKCkgbG9v
cCB3YXMgY2F1c2luZyBhIHBlcmZvcm1hbmNlIGhpdCBkdWUgdG8NCj4gPiA+ID4gdGhlIHJlcGVh
dGVkIGFjcXVpcmUgYmFycmllcnMgaW4gdGhlIGxvb3AgYW5kIGl0IGFyZ3VlZCB0aGF0IGFuIGVh
cmxpZXINCj4gPiA+ID4gYXRvbWljX3hjaGcoKSBjYWxsIGNvdWxkIHByb3ZpZGUgdGhlIG5lZWRl
ZCBiYXJyaWVyLiBUaGF0IG1heSBub3QgYmUNCj4gPiA+ID4gZW5vdWdoIGVzcGVjaWFsbHkgaWYg
d2UgaGF2ZSB0byBsb29wIGZvciBhIHdoaWxlIGJlZm9yZSB0aGUgbG9jayBpcw0KPiA+ID4gPiBy
ZWxlYXNlZC4gTm93IHdpdGggdGhlIG5ldyBzbXBfY29uZF9sb2FkX2FjcXVpcmUoKSBoZWxwZXIs
IG9ubHkgb25lDQo+ID4gPiA+IGFjcXVpcmUgYmFycmllciBpcyBhZGRlZCBhdCB0aGUgZW5kIG9m
IHRoZSBsb29wLiBTbyBpdCBzaG91bGRuJ3QgaGF2ZQ0KPiA+ID4gPiB0aGUgcGVyZm9ybWFuY2Ug
aGl0IG5vdGVkIGluIHRoYXQgY29tbWl0Lg0KPiANCj4gPiA+IFlvdSBuZWVkIHRvIHN1YnN0YW50
aWF0ZSB0aGlzICpzaG91bGQqLg0KPiANCj4gPiBJIGRvbid0IGhhdmUgYSBnb29kIGJlbmNobWFy
ayB0aGF0IGNhbiBzaG93IGFueSBub3RpY2VhYmxlIHBlcmZvcm1hbmNlDQo+ID4gZGlmZmVyZW5j
ZSBieSBhZGRpbmcgYW4gYWNxdWlyZSBiYXJyaWVyLiBNeSBzdXNwaWNpb24gaXMgdGhhdCBhIHJl
cGVhdGluZw0KPiA+IGFjcXVpcmUgYmFycmllciBjYW4gYmUgZXhwZW5zaXZlIGRlcGVuZGluZyBv
biB0aGUgYWN0dWFsIHByb2Nlc3NvciB1c2VkLg0KPiA+IEFueXdheSB0aGUgb3RoZXIgb3NxX2xv
Y2svb3NxX3VubG9jaygpIGVudHJ5IGFuZCBleGl0IHBvaW50cyBhbGwgaGF2ZQ0KPiA+IHN1aXRh
YmxlIGJhcnJpZXIuIEkgZG91YnQgYWRkaW5nIG9uZSBtb3JlIGFjcXVpcmUgYmFycmllciB3aWxs
IGhhdmUgYQ0KPiA+IG5vdGljZWFibGUgaW1wYWN0IGdpdmVuIHRoYXQgaXQgaXMgb25lLW9mZiBh
dCB0aGUgZW5kIGluc3RlYWQgb2YgYSByZXBlYXRpbmcNCj4gPiBvbmUgbGlrZSB0aGUgb3JpZ2lu
YWwgb3NxX2xvY2soKSBjb2RlLg0KPiANCj4gVGhlIG9idmlvdXMgYmVuY2htYXJrIGlzIHRoZSBv
bmUgdGhhdCBnb3QgdXNlZCBmb3IgMDM2Y2MzMGM2YmEsIG5vPw0KDQpUaGUgY29kZSBpbiAwMzZj
YzMwYzZiIHdhcyBxdWl0ZSBkaWZmZXJlbnQuIFRoZQ0KIndoaWxlICghQUNDRVNTX09OQ0Uobm9k
ZS0+bG9ja2VkKSkiIGxvb3AgZG9lc24ndCBleGlzdA0KdG9kYXkuIEkgZGlkIGEgcXVpY2sgdGVz
dCwgYnkgYWRkaW5nIGEgZGVidWcgcHJpbnQgb2YgdGhlIGFjY3VtdWxhdGVkDQpudW1iZXIgb2Yg
aXRlcmF0aW9ucyBmb3IgbXkgbXhfdGVzdCB0ZXN0aW5nIG11dGV4J3MuIFNvLCBiaWdnZXIgaXMg
YmV0dGVyLg0KQXZlcmFnZSBvZiAxMDAgcnVucyBvZiAxMCBzZWNvbmRzIG9uIGEgMTYwIENQVSBB
cm0gQk0gc3lzdGVtOg0KDQogICAgX3JlbGF4ZWQJICAgX19hY3F1aXJlDQozOTc4OTk2OTgxLDkg
IAkzOTg2MTA2NTYyLDINCg0KU28sIFdhaW1hbidzIF9hY3F1aXJlIHZhcmlhbnQgaXMgYSBtb2Rl
c3QgMCwxOCUgZmFzdGVyIG9uIHRoaXMgc3lzdGVtLg0KDQoNClRoeHMsIEjDpWtvbg0KDQoNCg==
