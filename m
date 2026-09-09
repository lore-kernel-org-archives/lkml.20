Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4679572696
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963329; cv=fail; b=Z9yoTY35PBsyG3rinDbGcsvlXRWnOiEQLoorfn9ZyEe/aSppEtOqcqQeJjfSrr7F7gm8mrsknjfMxRx6tXmqQY7VcEzg7aayompnU+sfCAOFiTBf/eLzQVLo6/O3lvC0KUXqA1oigyF07yqPasnSiJPnQeW1zZCP5t+PjFuIxcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963329; c=relaxed/simple;
	bh=BEg5EPBtlIefms+W5o8jXlcdXm7kMeEVHAV9RsFZBHw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fIZ/48PCOhAGigOFts70XoY7/l08r1lplXUhwqyNBl+SXKVRt+FhayH8nLbln0LssU126mYqpSP0PoTKQl5o3Ii7e5fLF1yYUOby4HFFqq9QjNDcqYhrCU6rFUCFSJi62QL93XNyxgwPfT6zGSBcrciZoeTmZ8IL3gfkDAcSekM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hAN8zLRW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Sxp46ucU; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hAN8zLRW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Sxp46ucU"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BuA772681067;
	Wed, 9 Sep 2026 14:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=BEg5EPBtlIefms+W5o8jXlcdXm7kMeEVHAV9RsFZBHw=; b=
	hAN8zLRWyNN8a+ZU8oVvjCOHmRKIpDZ37pylbj9+V+5zW1/lkc2npuRyWE+0EJR6
	rooSAbP31tMbkrQc3j2nC6x1vfYXB6BwhrlC24/yroqLS5Kg3X/GoHydAPs4Tsc5
	qy1E2Z+Fbw6jD0b/kI6l7k0l6zmoCJ1j608Yje/1VQRTotxc30ZpSsmg/Px2qosp
	PtXtu2fgwDkCfhk9pnrbQIr50vI9G+vQlK8jdZcA3qZT8ftjXdIL3V/jJlWVOyR5
	QXiVTQjMXolbxBk2Uavez9kK97YFk27GRN1glvJd+Ghc0Hj/G1NMZ/kN7x3wPC7J
	H6peC39w0f24tJL0nhwhnA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ggbh0dafs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Sep 2026 14:15:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 689EAbKT027946;
	Wed, 9 Sep 2026 14:15:09 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013004.outbound.protection.outlook.com [40.93.201.4])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4gh7ayqkva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 09 Sep 2026 14:15:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2jk+J7y3y9uUewhLMbzDmGnlznOdAJXTPOA44nSlXIJ1UpYQ1750VC7CqHrRnf4+4zjBO+k/ImfXcArsoPAWejD/OOOS1nsQmJnsz7nuDTPkaxT1yjVzTuBznScFl+gzKf+L4CWta9SeGnEEykQ2Ip8iD2j6eM99wHDaV6KFjH0nud7OZ6bdeOIaazTwV1pgN0LG0i/oItrpumCLlg1F7DoXxoCCWmYM6MsBbcO8GjsN8jVP3KKjUu2eGZN6ncsPBNrq6uxOesAvn07eDh6IfdQwsi5sM3HET4IVe1Hm2GRDIED7rCsdITiTZZY67GbTRpkzh0bwLwgY5xVGv+SJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEg5EPBtlIefms+W5o8jXlcdXm7kMeEVHAV9RsFZBHw=;
 b=zPI5SjkDyCunIp5QTk/Zls1MU3XlOlTtYvFU3FD53IDVcftQEUohe9u41Jai39E8HaOso77lFkCZ2qY316fYd2WGw/ThgpfwwxLi5pfFs8Ol9lStEbSdO++ctoyqeBdXpJQT5Nktf65nlQLJjdj/sS4NqFDfQ4U3deClpRTijAoSyYvmuFdjv/bOus7n7rJygZ+zGdE77/YJjKK0xIeziTgcEw71qFSqemP5hiNOydhBKAWHjGFcohSiKwgizjVvyecLDxJeZPQA7ZVOCA8Ljv6JmTzQdEpVegM9Yf2dkNDhO8pvWTK4pxWxlj503gMC7poxrYDkvSMwfnoaEpbOCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEg5EPBtlIefms+W5o8jXlcdXm7kMeEVHAV9RsFZBHw=;
 b=Sxp46ucUrgZbspouRuwX4ft6ETCTiSKM1/ZSM6NNWo4aX2okJC9IhP6OeAk1MelEzSfPv01ocmUKDi7u+5xEnpcm1FUWZaL/AOyJ1es2LfFVmLvjZ4Txg3A2LyoWnstM8PEkIe9WaFxkAUo845r2VCtDHfPPu/58YTyfy7kK9sg=
Received: from CY8PR10MB6659.namprd10.prod.outlook.com (2603:10b6:930:53::5)
 by PH7PR10MB6059.namprd10.prod.outlook.com (2603:10b6:510:1fd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Wed, 9 Sep 2026
 14:15:03 +0000
Received: from CY8PR10MB6659.namprd10.prod.outlook.com
 ([fe80::a09f:da4d:e03b:582a]) by CY8PR10MB6659.namprd10.prod.outlook.com
 ([fe80::a09f:da4d:e03b:582a%6]) with mapi id 15.21.0406.002; Wed, 9 Sep 2026
 14:15:03 +0000
From: Haakon Bugge <haakon.bugge@oracle.com>
To: David Laight <david.laight.linux@gmail.com>
CC: Linus Torvalds <torvalds@linux-foundation.org>,
        Waiman Long
	<longman@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
	<mingo@redhat.com>,
        Will Deacon <will@kernel.org>, Boqun Feng
	<boqun@kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Yafang Shao <laoar.shao@gmail.com>,
        Steven
 Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 0/9] locking/osq_lock: Optimisations to osq_lock
 code
Thread-Topic: [PATCH v4 next 0/9] locking/osq_lock: Optimisations to osq_lock
 code
Thread-Index: AQHdPqg/HQaOn0CQxkmYQSZk6Ujl3bbDSOwAgAAV94CAAu71AA==
Date: Wed, 9 Sep 2026 14:15:03 +0000
Message-ID: <89F7CD08-2BDD-424D-AA2F-77D72647D93E@oracle.com>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
 <CAHk-=wget=mgjpkPJ+3-tueqo7AK1m4MR_Jqht6bj3-w+FhQHg@mail.gmail.com>
 <20260907182705.54585f73@pumpkin>
In-Reply-To: <20260907182705.54585f73@pumpkin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR10MB6659:EE_|PH7PR10MB6059:EE_
x-ms-office365-filtering-correlation-id: 88866b64-6a5a-46b4-f2d3-08df0e7cbdd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|38070700021|4143699003|10067099003|56012099006|5023799004|22082099003|18002099003;
x-microsoft-antispam-message-info:
 BEGBQleZRHZOawIPYJj2hWOZwHxc6anMHoMj0Og3R3xecAEQcPQBEZSpCm1ILLLQQQZvX7sM2ACGe4JtegRoMNHKi9Oe8hZhq4DxTHIy2Tbok4XYovjyKS4qkFp1yZ+cCVjVshjCUG90Y7tHNkpIb3skGtHwIrSDg9BMSAPdXVrhfJCykOQRAA/5Tpt+69ZhJ9JkkB0c8zbqLqknFkRpx2dCNFyltNtg6UYoVgJKKV5YUWZtSqlZV9QB++qnwQf1r0nrzbCBd2X/FXwCpQvw6WA0XhB95TnDnlOprJ9YVGrLUHPnAOucvejcqwRMWsUYTjVYSYk22SujEzDwT7knwzg1oNWuJq9KtYgx/DujBiiJ0G+UKqGKczcAGHxyYDj3Y9yUg/IPbs+u+aB4nOH6F2too+xtbZ42sBbM9H5Hce2aMwsCAYldtjzk+C53kyOsVdn43G0BwyopTD+1TYtqdTt8QdY8VGkb/A26uFVpK2ay5gP1+j04baDS5mFSnwsDPUdH1sZlGPdZm71dL8eV9wMa+iZCMCbTmzySQamSIe0PG75cjn+/v75ak2E8b66cRnWMFSWzTMvqkvse9mnPHTgr2QaRnmcMFEjh4oWtFV9sIe13yNdIxQ3J9EmKpmA7GA8/fe3E0FscARGJFRzoFuRwUvYHGeJEhtgJyRcyE8I+PgkqNYrpwSZYDE5rlepGJVnrt6fX73L6hTjpuRPzT/op+0fIGGcWJ7E84Ojpn9o=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR10MB6659.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(38070700021)(4143699003)(10067099003)(56012099006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?REJ5R0RseDRJMVptQWQrY3hocnV3eUdibWFWeWNLN28wNStXUEdsZElFcnAr?=
 =?utf-8?B?VkJBcWZxdGpTa2d0VFVIYjRJRTh3ZHBQdC9KQjhlVFlsdzdnUkpoemEvenVN?=
 =?utf-8?B?by9xZS9rMjFnZDYyWDNvalVkWjdKYUxNVzhacTNYTEZpUjlIYnJHeFdaZlpr?=
 =?utf-8?B?alNPZ0V0SThxd3BxZ0xORjlLRldOTDVRTjFUTXRMM0hWSGx4ZjhXV2FueTdG?=
 =?utf-8?B?Vk5CdXp1TkRYTkFlVVhjbVYxbEFjQWlZQkc3L1JOUkYzZWpMdnlNZXp5S3Zr?=
 =?utf-8?B?R09MdnNOK3JLWnpqcnZXZ1JLN3hrcklkQno5dW0ycjFKei9ieHh6M2YxbW5K?=
 =?utf-8?B?Ny9qMWY1dlJteXk3NUg0TGJ5dXVjVCtINGdwTCtybFIxN1hhclFZdUpuSStM?=
 =?utf-8?B?bVNlc0cxOWRMU3oyMDlzSk1XRlhiZ1NMd1JOUXh4MDBrWG80K1lLWStsT3Nt?=
 =?utf-8?B?TjhBKzY1bmJsS0s3NDRJeEtQd2ZySGZESlJQZm0wMlpFbU5aNHJyZkJxTWdC?=
 =?utf-8?B?VW9oQnlsRldjaU4xWFd2Zkgrb1Y4cC9Zbndka092MllUYjVXMGhZT0xQTXpi?=
 =?utf-8?B?cmNQT2oxR2Q5b3FhQVNaVFBJVWVXMGptT2NibzFla09vREwzajNKZkFJcHd2?=
 =?utf-8?B?RmxlSlpTK2RzKzBCbEtOcDVUa1hxc2ZJZlpqZjBob3R2eVZ2alIzM25WVEJo?=
 =?utf-8?B?YU9TMXRraW16c0ZTbG44bCtlenZWMFpNWmNtNktwb2dOOGxscXJoMkZhSXBE?=
 =?utf-8?B?cCtBNGMwK1FzRzNDeUt5WGxkWDFFODlLQXdiNzJwZTlsYUxmZEVMcVhPTnRa?=
 =?utf-8?B?T1kwRTZsRXRVaEFiUlRiK2dscTljTWx4MkZKcFQ2Z1Q5UVZ4NzlOVFNqNzVI?=
 =?utf-8?B?UlJ2U1ZFTVRybFpLMld2WkxBNjhjZ2NrdnA5bFJXVVdZUHZJck1LS2RhUFJZ?=
 =?utf-8?B?eTZ4c29BVDhuYnNUZk4rMklYZDhncE8yRHdHUFY3TWZLREpRbmpSVnpnYjE1?=
 =?utf-8?B?V0JlbEVhaGppbmpnUE5CMXpCcUUvS1paQkxjRC9LQW5uajZXaW42SU1QcGRV?=
 =?utf-8?B?ejQ1bDd1M0U2dXRMV0FaaFhtd0dzTk9BemhkaHRLUXhhaWxNK3pHRkhPbG1h?=
 =?utf-8?B?YzlqUXcyRGhjT1NsRmpRcGd2WUtYbzVONlZZZm9qUExiRjhIb1BSaVE2MXdn?=
 =?utf-8?B?UkZ4dW5BQ1BYeExSY1VwZWlrNkYxeC9PV2Y1SC96djROT0VhUFYrL1QraElX?=
 =?utf-8?B?TFZBYWp1TjRGcjFiWWU4c3EwWi8vejhkTHhNYlNlRENLU2xyeXAwdi84ZlFi?=
 =?utf-8?B?bGc1bGJmdHBPZUVvN2xZMjk5WDFzU01DbmZxR0E2aTZzSUVuTHFCY0ZvS2tC?=
 =?utf-8?B?cWNoVFdKcStDcmdwQzNjbXY1S2pQdm85SmFuQ1RzcGhYNlB1TzMzbU9OK01Y?=
 =?utf-8?B?cGNYekZicDd4UlA1ZWc0TzlPaTdCYXYxSjJpOHlyOXV3S3BLYUppRGhudndh?=
 =?utf-8?B?R0ZnT0VEWDVKNnRhUXB5R3pVNHpTVlVNTTIwUE9qSFhpZXljbjZmN1M0L1ho?=
 =?utf-8?B?akpUblF3cEVKNWdCQ0t2R3ZVMXRBNHF1VDBPYTdNMUFmMkJNU0hCYzVDRk9N?=
 =?utf-8?B?WUdkM1JxVTRYeldScDZjSDF3TDFoTGpkMXZkRW9UOHNyVWw4YmtJNzJYZlB5?=
 =?utf-8?B?V3piRmdWeWJLNkZLaUQzMVJYMUtiNnRIWlJENkQvTlcvdnRvZnBQaXVDNWwz?=
 =?utf-8?B?UlYvcUQ4Y1VsWDB2M2luQlE2UWRKZmlSdFdKdFZ1VFhRRWVFU0NZR2R0cTRh?=
 =?utf-8?B?MTNldUxNQ1BkQ2t0UERjUzJROVh3R2hHTnJmam9neGNWc3NaN2lhN1k2c0lE?=
 =?utf-8?B?ZHBiRUp0TVdaS1JxcGVuQjZXcTNpUitKdHR5VGZrTUtLVXhHa0pBVmxVRVZ0?=
 =?utf-8?B?YittTlhVYUxaN3RsMHNxU0xMWUN3a1h0SlhHMHhZcDQ1eFdxdGx5MkpJMEps?=
 =?utf-8?B?VGN0ME54Q2JIQzhWS2JCaWdsbHlhUGtya2FqNFBmZm5NV1pKUHkvcHI4azVu?=
 =?utf-8?B?TEd2dkJnaGVhVXBpL1dDRUNVU0t6M3lFUWYzSnhHdUYwSGxSdFJqeUxPUEd5?=
 =?utf-8?B?OUVxdkhzU29TenNRRW5TTFZ2WkU2Y1Qyb0xhaXFUUHM2eTRjZmNpejF2T1Ur?=
 =?utf-8?B?aEtTbk4zRVYvalNOWWJRSEc5dVJUa3psRGI4dTlxNEh4b3lzMWtvVzM2bEp1?=
 =?utf-8?B?dFp4aExLZHIwQkpJaktzVWNHWFc5R3RaenR2Z0NPNmoxMTRmOW8xazZETy9r?=
 =?utf-8?B?dHlIWUh4VHZRWHB3TmJXdUNNTmJ3ZUhrTHZpNUV0SmU4VmtjNW5NaC91M1Fp?=
 =?utf-8?Q?EICgp62u39g7C9Ak=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31FB6D711D259D4AAD444481F3AE2235@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	V6jCM7LCRJjIHJw3mgynu2nstPVj07io0uIzHEIZWU524fwEigHJUmiuc3x6B5/C0fTabs9bCxPjOquo/jZ6YcfYhicrgNXnNSUnKpCRRrjzVevzTb6IBiGvTwdNDafoKLvE+gGNQ7N523llxDgqN38yJ9YIIcer++GWmM9eUnz2MT+0GfBV+mD3FsBEvC1EipTmQ9swQSG0OYjYjFOAT7hNAXqPKfQ8vhqsMJs3eHUF20QDoQeGCU9L9qA1dGrL1SoLlIsoHSeEp/d2JXNyzojt1FgqpmBD4qDqOs5oM3w8ohldWn1e3wdb5oRu3t0Zag+T/mH0ZKlpenJ46oOwpQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZMSEpAkonhJk43jAcDxB2iR9fRBbkUDd8CowYVyjCioBCAtKb9fFkvO3fXaBofkdq41bx4btsXgg1OEtNHAW7Rv7CQ8zYPHyI1H9YmTsGDu4O8149f5pmRmrwkO7VmGTJS0pI0jj0k8zX/Hplzg2EKqoZ/dY+YXQoqvxh2qZ4lU5tVTbS89LY46trFe/ZQXqTnEmLA/IBrpBN6Ry6Iov3sMoJl9Eb/xwPT8KhEFZkQlZjQqvF7BifTlBJ6d2btRTRdNdcnhKPjy2HK2D+yOYxl2bSnRX8Fm+KvyXQTElxtlwwaTNfRb+f4/8tBl0A4YnX6mNR7ZqT+YsDXrDd6052CZSt9m6znzGd036vJ099jN46miZYH+X2oSIfJWPrOmR30y/LrOZNKgOIySmSKi9E7E5qDY1Xv/nKRCJ3fzOGCQDj+UEftrNbup/TpRcjCm8ALvbcPRGAjyp9+U8LpKytveq4AYQE70T5homctu9NDAsIxozA8MrPpcYygU+swPtz4yL43+X2EKSb6j6z7kv0U3ZeKaHMRQqdjW6hWmUfkTdhjKhy1a17a/1tOneQJeQStjVx5lNkZiI7EtjG9OHby0UAnQfFnn8sf2o0nb5r3M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR10MB6659.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88866b64-6a5a-46b4-f2d3-08df0e7cbdd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 14:15:03.3311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fpu1XSwK5B0kdlHEU8CfhwrgbLu5+Jos3btAoRVWtCIakavMmS1HmxSAvbgL0Jtz3atifn8VDhJx/RKXnksvLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6059
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=816 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2609090159
X-Proofpoint-ORIG-GUID: jHt6i75Df6cKyvpUSr-WuymUsvnIu7jb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE1OSBTYWx0ZWRfX71LUWhtcaN6b
 gGIIOQTpIR7NtVBk7OYGQp29/l0nkeF+ebXX17dKBe4vZNRL8fN1r42+k+8i+Ex2GDaFubFvqQv
 dc02lr1rSZ0tXn99pa+dmodpY4qUGN0CkCvLX/AdqZyf/PVraH8Zft/kTlfJQzuJ5p5cbvJkIy5
 U0MyF4g21FtI1Bg1J1U9zvCMRDNjVXrcpolXZblMDhtQ/mJxdLCjni2MIxYcYbVpMvjKGdMfot/
 xDTJKGjM2B6ubu/4HXqcjzI2jXaa8DxwrR8Wa2zMnb/rDH9gIKy2BKCX9fIcpDNgEqd/osmri4W
 Lf0yUFwjR9cOeooLbF6vNcaYoXlgNyNTpLEtlqJxBm3SUKMjPFn/aI52RAbd388xkUqbVVKRYGu
 8g8DirWNEoMlEgLHw4ItLNvwYXNyMqbYzanootapHop7l7myZxWmfQO6xGF3Wlr4gBm0LHF0yRJ
 IPXXWTiP/v7LPAhexW947c5ttqet2496byIXf/S0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE1OSBTYWx0ZWRfX5y5kAfBNsl/6
 HAO0Yb1/oHFvhsKHv7mG+siGRABQvEpjPs3NpkOZy7aONePhQysvKCAawkx2ND8RwnFlEFqe3Ov
 vqeh3vP+3ne3RgoNIDaJqy+o4gaBAQ3a2ZEotxzrKBh9us86PiSw
X-Authority-Analysis: v=2.4 cv=GKE41ONK c=1 sm=1 tr=0 ts=6aa169ee b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=GoEa3M9JfhUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22
 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=pGLkceISAAAA:8 a=Z4Rwk6OoAAAA:8
 a=mycCcc7swg9c_duqVlYA:9 a=QEXdDO2ut3YA:10 a=HkZW87K1Qel5hWWM3VKY:22
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13533
X-Proofpoint-GUID: jHt6i75Df6cKyvpUSr-WuymUsvnIu7jb

DQoNCj4gT24gNyBTZXAgMjAyNiwgYXQgMTk6MjcsIERhdmlkIExhaWdodCA8ZGF2aWQubGFpZ2h0
LmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIDcgU2VwIDIwMjYgMDk6MDg6
MjggLTA3MDANCj4gTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3Jn
PiB3cm90ZToNCj4gDQo+PiBPbiBNb24sIDcgU2VwdCAyMDI2IGF0IDAxOjQxLCBEYXZpZCBMYWln
aHQgPGRhdmlkLmxhaWdodC5saW51eEBnbWFpbC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IEkndmUg
Zml4ZWQgc29tZSBicm9rZW4vbWlzc2luZyBtZW1vcnkgYmFycmllcnMgYnV0IGxlZnQgdGhlIGlu
aXRpYWwgeGNoZygpDQo+Pj4gd2hlbiBhY3F1aXJpbmcgdGhlIGxvY2sgYXMgYSBmdWxsIGJhcnJp
ZXIsIEkgdGhpbmsgaXQgY291bGQgYmUgcmVsYXhlZC4gIA0KPj4gDQo+PiBXZWxsLCBpdCBzaG91
bGQgYWxtb3N0IGNlcnRhaW5seSBiZSBhdCBsZWFzdCBhbg0KPj4gYXRvbWljX2NtcHhjaGdfYWNx
dWlyZSgpLCBzaW5jZSB0aGF0J3Mgd2hhdCBvc3Ffd2FpdF9uZXh0KCkgdXNlcyBmb3INCj4+IHRo
ZSBjb250ZW50aW9uIGNhc2UuDQo+IA0KPiBJJ20gbm90IHN1cmUsIGJ1dCBhbSBubyBleHBlcnQg
b24gYWNxdWlyZS9yZWxlYXNlIGJhcnJpZXJzLg0KPiBUaGUgJ2Zhc3QgcGF0aCcgb3NxX2xvY2so
KSBjb2RlIG9ubHkgaGFzIG9uZSBtZW1vcnkgYWNjZXNzIHNvIHRoZXJlDQo+IGlzbid0IGFueXRo
aW5nIHRvIHNlcXVlbmNlIGl0IHdpdGguDQo+IFRoZSBpbXBvcnRhbnQgb25lIGlzIHRoZSBzbXBf
d21iKCkgYSBiaXQgbG93ZXIgZG93biB0aGF0IGVuc3VyZXMgdGhlDQo+IGxpc3QgdGFpbCAob3Ig
aGVhZCkgaXMgd3JpdHRlbiBiZWZvcmUgdGhlIGJhY2sgbGluay4NCj4gV2hlbiB0aGF0IHdhcyBt
aXNzaW5nIHRoaW5ncyB3ZW50IGJhZGx5IHdyb25nLg0KPiAoSSB0aGluayB0aGUgV1JJVEVfT05D
RSgpIGNvdWxkIGJlIGEgc3RvcmVfcmVsZWFzZSgpIGluc3RlYWQuKQ0KPiANCj4gVGhlIEFDUVVJ
UkUgc2VtYW50aWNzIHdlcmUgYWRkZWQgdG8gZW5zdXJlIHRoZSAnbm9kZS0+bmV4dCA9IE5VTEwn
DQo+IGFzc2lnbm1lbnQgaGFwcGVuZWQgYmVmb3JlIHRoZSB4Y2hnKCkuDQo+IFRoYXQgYXNzaWdu
bWVudCBnb2VzIGF3YXkgaW4gcGF0Y2ggNS4NCj4gQnV0IEknZCB3YW50IHNvbWVvbmUgd2hvIHJl
YWxseSB1bmRlcnN0YW5kcyBhcm02NCB0byBjb21tZW50Lg0KDQpUaGVzZSBhcmUgcHJlbGltaW5h
cnkgcmVzdWx0cy4gSSBhZGRlZCBvc3FfbG9jaydzIHRvIG15DQptdXR1YWwtZXhjbHVzaW9uIHNl
bGZ0ZXN0IFsxXSwgd2hpY2ggaGFzIG5vdCB5ZXQgYmVlbiByZXZpZXdlZC4gVGhlDQp0ZXN0IGlz
IGJhc2VkIG9uIHY3LjMtcmMyLg0KDQpGb3IgbG9jayBhY3F1aXNpdGlvbiwgSSB1c2VkOg0KDQoJ
cHJlZW1wdF9kaXNhYmxlKCk7DQoJd2hpbGUgKCFvc3FfbG9jaygmZWwtPm14X29zcV9sb2NrLmxv
Y2spKSB7DQoJCXByZWVtcHRfZW5hYmxlKCk7DQoJCWNvbmRfcmVzY2hlZCgpOw0KCQlwcmVlbXB0
X2Rpc2FibGUoKTsNCgl9DQoNCndpdGggdGhlIGNvcnJlc3BvbmRpbmcgcmVsZWFzZToNCg0KCW9z
cV91bmxvY2soJmVsLT5teF9vc3FfbG9jay5sb2NrKTsNCglwcmVlbXB0X2VuYWJsZSgpOw0KDQpB
c3N1bWluZyB0aGF0IHRoaXMgaXMgYSBjb3JyZWN0IHVzZSBvZiB0aGUgT1NRIEFQSSwgdGhlIE9T
USB0ZXN0IGZhaWxzDQpvbiBhIDE2MC1DUFUgYmFyZS1tZXRhbCBBcm0gc3lzdGVtLiBUaGUgc2Ft
ZSB0ZXN0IHBhc3NlcyBvbiBhIDUxMi1DUFUNCkFNRCB4ODZfNjQgc3lzdGVtIGFzIGV4cGVjdGVk
LCBzaG93aW5nIGF0IGxlYXN0IHRoYXQgdGhlIHRlc3QgaXMNCmNhcGFibGUgb2YgcGFzc2luZy4N
Cg0KSSB0aGVuIGFwcGxpZWQgdGhpcyBzZXJpZXMsIGJ1dCB0aGUgT1NRIHRlc3Qgc3RpbGwgZmFp
bGVkIGluIHRoZSBzYW1lDQp3YXkgb24gQXJtLiBJIG9ic2VydmVkIG5vIG5ldyBtdXRleCBvciBy
d3NlbSB0ZXN0IGZhaWx1cmVzIG9uIEFybSwgYW5kDQp0aGUgdGVzdCBjb250aW51ZWQgdG8gcGFz
cyBvbiB0aGUgeDg2XzY0IHN5c3RlbS4NCg0KDQpUaHhzLCBIw6Vrb24NCg0KWzFdIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNjA4MTcxMzAyMzkuMzQzNTk0LTEtaGFha29uLmJ1Z2dl
QG9yYWNsZS5jb20vDQoNCg0KPiANCj4+IA0KPj4gSXQncyBhIGJpdCBvZGQgdGhhdCB0aGUgZmly
c3QgaW5pdGlhbCB4Y2hnIHVzZXMgYSBkaWZmZXJlbnQgbWVtb3J5DQo+PiBvcmRlcmluZyB0aGFu
IHRoZSBsYXRlciBvbmUuIE1heWJlIHRoZXJlJ3Mgc29tZSByZWFzb24gZm9yIGl0Lg0KPiANCj4g
SSB0aGluayB0aGUgJ2VudHJ5JyBvbmVzIHdhbnQgdG8gYmUgYWNxdWlyZSBhbmQgdGhlICdleGl0
JyBvbmVzIHJlbGVhc2UuDQo+IG9zcV91bmxvY2soKSB1c2VkIHJlbGVhc2UsIGJ1dCB0aGUgZXF1
aXZhbGVudCBjb2RlIGluIG9zcV93YWl0X25leHQoKQ0KPiB1c2VkIGFjcXVpcmUuDQo+IFRoZXkg
Y2FuJ3QgYm90aCBoYXZlIGJlZW4gY29ycmVjdCENCj4gDQo+PiANCj4+IEJ1dCBldmVuIG1vcmUg
aW1wb3J0YW50bHksIHRoYXQgY29kZSByaWdodCBub3cgIGV4cGxpY2l0bHkgKnN0YXRlcyoNCj4+
IHRoYXQgaXQgbmVlZHMgYSBmdWxsIGJhcnJpZXIgKCJXZSBuZWVkIGJvdGggQUNRVUlSRSBbLi5d
IGFuZA0KPj4gUkVMRUFTRSIpLCBzbyB0aGF0ICpjb21tZW50KiB3b3VsZCBhbHNvIGhhdmUgdG8g
YmUgZml4ZWQgd2l0aCBhIHdoeQ0KPj4gdGhlIG9yZGVyaW5nIGlzbid0IGFzIGltcG9ydGFudCBh
cyBpdCBzdGF0ZXMuDQo+IA0KPiBJIGxlZnQgdGhhdCBjb21tZW50IGFsb25lIC0gbWF0Y2hpbmcg
dGhlIHhjaGcoKS4NCj4gRXZlbiB0aG91Z2ggdGhlcmUgYXJlIG5vdyBubyBmaWVsZHMgdG8gcHVi
bGlzaC4NCj4gDQo+PiBBbmQgZmluYWxseTogbm9uZSBvZiB0aGF0IHdpbGwgZXZlciBiZSBub3Rp
Y2VhYmxlIG9uIHg4Niwgc2luY2UgdGhlcmUNCj4+IGFyZSBubyBtZW1vcnkgb3JkZXJpbmdzIG9u
IGF0b21pY3MgdGhlcmU6IGxvY2sgaXMgYWxsLW9yLW5vdGhpbmcuDQo+IA0KPiBJbmRlZWQuDQo+
IEkgZG9uJ3QgaGF2ZSBhIGxpdHRsZSBhcm0gdGVzdCBzeXN0ZW0sIG5ldmVyIG1pbmQgYSBiaWcg
b25lIHdoZXJlIHRoaXMNCj4gd291bGQgYWxsIHNob3cgdXAuDQo+IA0KPj4gRW5kIHJlc3VsdDog
SSdkIGxvdmUgdG8gc2VlIGFjdHVhbCBwZXJmb3JtYW5jZSBudW1iZXJzIGlmIHRoZXkgZXhpc3Qu
DQo+PiBBbmQgYW55IG1lbW9yeSBvcmRlcmluZyBjaGFuZ2Ugd291bGQgcmVxdWlyZSBleHBsYWlu
aW5nIHdoeSBpdCdzIG9rDQo+PiBhbmQgc29tZSBvdGhlciBhcmNoaXRlY3R1cmUgdG8gdGVzdCBp
dC4NCj4gDQo+IFRoaXMgY291bGQgZXZlbiBiZSBvbmUgb2YgdGhlIHN0cmFuZ2UgcGxhY2VzIHdo
ZXJlIG1ha2luZyB0aGUgY29kZQ0KPiBzbG93ZXIgYWN0dWFsbHkgc3BlZWRzIHRoaW5ncyB1cCBv
dmVyYWxsLg0KPiBvc3FfbG9jaygpIGlzIG9ubHkgdXNlZCBmb3IgY29udGVuZGVkIHNsZWVwIGxv
Y2tzLCBhbmQgdGhlbiBub3QgZXZlbiBmb3INCj4gdGhlIGZpcnN0IHRocmVhZCB0byBiZSB3YWl0
aW5nLg0KPiBJZiB5b3UgZ2V0IGEgbG90IG9mIHRocmVhZHMgcXVldWVkIHlvdSByZWFsbHkgbmVl
ZCB0byBmaXggdGhlIGxvY2tpbmchDQo+IA0KPj4gDQo+PiBPciBhbSBJIG1pc3Npbmcgc29tZXRo
aW5nPw0KPiANCj4gUHJvYmFibHkgdGhlIHNhbWUgdGhpbmcgYXMgSSBhbS4uLi4NCj4gDQo+IERh
dmlkDQo+IA0KPj4gDQo+PiAgICAgICAgICAgIExpbnVzDQoNCg0K
