Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD6943F8B8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386385; cv=fail; b=UAXSV7U0Yh4ozm16JLudKg+X5qAoMbYYhRgpuIcdsFOsFex8w9pZGjDpIFuFwnrAW43wdlHGHFgnTh9dnzaAozsu8bXmnrkvDcs0uazp5X/OQWD6rsjNWViE/jI2c/XeUxVMh1tgUai8jsvRvZmPeqTUjc7zZ6L0USwr0BQvgyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386385; c=relaxed/simple;
	bh=x2M2UJAmdGqHvXxDHecFqXMIut0Z0C6IeQO2CRRExfo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ePeKPr16pldvozd7TDCXBA8JAVJv0sJXdD94frF6CTOhBdoL36P+qay3ZMAbcdNhVN+m8Ym43gyflZ7FyewHJeC442dZ2mzF/uGuO0jdQrjobvPIa6mH4TtqYuaE54EyejfbhqqAUNrqtq0rJI+igY66xUZtA15oOiw/kizJghc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mdAPv3qu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FVrIPltb; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mdAPv3qu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FVrIPltb"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DNAxxI046749;
	Mon, 14 Sep 2026 11:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=x2M2UJAmdGqHvXxDHecFqXMIut0Z0C6IeQO2CRRExfo=; b=
	mdAPv3quxdas2zyXGal+Sb8I8SN9XHHuq5hd7TK2WKT926GR9SiH1ok/KIe4Wp53
	RKkdIyoEJ4IzE/pVGbAo+IIC6FE1vOdwYC1Z3e30XgtNm+Gs/vTbEb7ypSg+DNad
	Nlrsp6fSz93lulku6zfo1aBDpOrfxGMlzY4lo0Gqo18e8eUXUgFy+538ZUNUubiY
	FyRwfeuL7sddrXT5k3YDQZZw3l8oCCx6tAMt2axrVwORUDsRv4Aj3CH9p2+zBosZ
	DuZk0zkesXYBxaNHNHgR11tTpzwDPzi5hGBBSgcdHOnzWisoeGCp4A68bP7Jnk+l
	sC8PvTQVJvDrXNV52+MM4w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gmy9rsp9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Sep 2026 11:46:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68EBe2eI015803;
	Mon, 14 Sep 2026 11:46:06 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012018.outbound.protection.outlook.com [40.107.209.18])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gmw68q5ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Sep 2026 11:46:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivug1mHj1XHXaP+MTyywwvZh8S30r498aW/OlAsYQ+Pw3JZD4T2jb8xLiNzNMSz+6sL8ykOJvqw4+5NZoaBO8gmDa0ns5o+SmLRNeL+Fyp6xfbGW1hcWnApwOuRCp38w2sdwURojqVWd8ak/5HOtH9Bp2otlZtTWtomGwrOcEjLyLb1VIk7XcgBmIqt9xT+xjs+5UnyBZVPEY1bSqUrvzzdnDkF6lswAP735PWY8wpgrsBa8DZn6yqV7ocZIOHtrKXwpXJtOT8NB+2tQClUZFoaL7lnjOUlO9CDOCzyPKdwE9N/LDfGFPWuvoYl8+Iwx+8kverI2bJiyT5UvjDtVWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2M2UJAmdGqHvXxDHecFqXMIut0Z0C6IeQO2CRRExfo=;
 b=ivdyIexSnAgyI+zwLL62b7yBCvIVq0p1Cx3dXrj/zhZn4AsV8fZWYD20cCfqSUSW2goGQRzmJPkupeyJPARy3+0eXUgN0r1JkI7CXZ/6dS++ZOYAYb8vserde019Urz1hj097auNTvwJp031qU5CluNeiF6bde49qW75RUjucVq+2uAe0N2XAWoCozZLLkig/V2wutlJafbt4DU3fYRt+v9SXNQ8HgcrPCnGrjL6zxKBZtDhkzyuQh1gooi8HG8w4RxoCiCnKMN4cUNyWJo7loSO0aqoMH6BhN8IX2HOX4mBySkOnPVmvAnfRg7G+z/e8vA5eFvmNxAwUJ8fL1bJPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2M2UJAmdGqHvXxDHecFqXMIut0Z0C6IeQO2CRRExfo=;
 b=FVrIPltbR8j4DdGYiy7ep2VYc7rIxXtiexT/1qPtGDf/W0DaH+AVdbVEeqgsRzB6CeCtr/OHcEKXU/LnYt5R1Uyq+MzbQD9PEiFyfLAoblwS+wETWopwv65eUgl17kYzD2v4fpaQWm5lecpcz4R3gDhTsWnqQg3jBNpoji9EhBo=
Received: from SN7PR10MB6667.namprd10.prod.outlook.com (2603:10b6:806:299::7)
 by PH8PR10MB6289.namprd10.prod.outlook.com (2603:10b6:510:1bd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Mon, 14 Sep
 2026 11:46:02 +0000
Received: from SN7PR10MB6667.namprd10.prod.outlook.com
 ([fe80::ff41:744:dd32:93f1]) by SN7PR10MB6667.namprd10.prod.outlook.com
 ([fe80::ff41:744:dd32:93f1%5]) with mapi id 15.21.0428.004; Mon, 14 Sep 2026
 11:46:02 +0000
From: Haakon Bugge <haakon.bugge@oracle.com>
To: David Laight <david.laight.linux@gmail.com>
CC: Waiman Long <longman@redhat.com>,
        Linus Torvalds
	<torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>, Ingo
 Molnar <mingo@redhat.com>,
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
Thread-Index:
 AQHdPqg/HQaOn0CQxkmYQSZk6Ujl3bbDSOwAgAAV94CAAu71AIAAZGCAgAAFTICAAN1uAIAAFNwAgAAIoACAAAm6gIAAOPkAgAGvyACABFr1gA==
Date: Mon, 14 Sep 2026 11:46:02 +0000
Message-ID: <AE2D42C1-9B5A-4F5E-91FC-C84423ADE7AD@oracle.com>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
 <CAHk-=wget=mgjpkPJ+3-tueqo7AK1m4MR_Jqht6bj3-w+FhQHg@mail.gmail.com>
 <20260907182705.54585f73@pumpkin>
 <89F7CD08-2BDD-424D-AA2F-77D72647D93E@oracle.com>
 <44bdfc4b-4729-4dc3-b7b0-53c671c5ee34@redhat.com>
 <dd6a7873-7d23-42e2-adbd-b59c43141d96@redhat.com>
 <0ADD6DCD-6EF1-469D-ACB8-EC7D6A94CC2F@oracle.com>
 <20260910120016.04ba8ae1@pumpkin>
 <C81B298B-E8FF-4F96-8216-CFC21D167EC8@oracle.com>
 <20260910130557.74e1ae45@pumpkin>
 <E2131B35-DE77-41D3-85C7-521143FF94A5@oracle.com>
 <20260911181516.313a8a2f@pumpkin>
In-Reply-To: <20260911181516.313a8a2f@pumpkin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR10MB6667:EE_|PH8PR10MB6289:EE_
x-ms-office365-filtering-correlation-id: dba74baa-385f-41c9-70b3-08df1255c078
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|38070700021|56012099006|10067099003|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 RYmcFXqPd6uEkvnnkC4iJgy0iFcVi9Ei0JkTCaAOtvCIgl/erhKqXNJAZJT+1Xdj+/QjKXQItfWiTeMSRPKphKUfYODaRnkB8Ul5pZgIi2KispSOqSkXvROMt4qfKNpWo8XSbKl8r57nqZ2CO3gOTf1DHpC5M+uSmTCaUpCu7K3yVO0lLnaqiS8bzfK7zWriCsawydgSRHygsNnY88SGhkQfRmLmZoMDd34Xw+lY731YokCO98J3pDGnSq9zu1EDepvG2b5XcVyc2iOxpToDh+xwaFZRjj6Svawsu5etD5AzwRX3tHz2NgYk9hRrJ5W9N94aC+V9pck1NGEPIYgAplaKrLZpPgnlg8aUK+vyuzoTqS87K8g9QIFv8gYHotM5SGOqIsyDE7C3iyVzQt/RzpcAHsN+Y8P3GLxti3itGJntSiopqUFuEOXmYu5kCXXUx4d6RB7F2sxIGj5W2LyHkos3lMuSIm1x3l4/HHmfQI89/UU5XrdZSPacOlSiMMkNffu0AHkpaEwCL2qBwgNYqJQPdmom2ouzUL3LmQzKbS1pyEIeOHzE7fWFWZv+GIcIYqeRQXxIAHi2EeR74n/lKpCdcodOORbeTyz8RSp7yr9QAe2oC0Dr2b8R+kGiDlCGuxiakTjEZAdnY+xcF++HRUD+r9kM4y7QpgetGD07Lk1RkScke05fyWoDcd/DYT/VAbvtzS+nbvxz9wMG8dUijy31qdN4fK0ABydEHRRsGUs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6667.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(38070700021)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YXZ3K3NsQjhVcHJ1TkR4eVhaa2NGNTdqNTBMTFJSTnMwdXdjT0xMNjJmQlNY?=
 =?utf-8?B?cFFXRUZRTUk2T21sdm1RYkNnSk5ENVZsbGZwRGdYajNLU1crVWJ2ZnNOS2pX?=
 =?utf-8?B?QlhFclRWa3FDM0xITGFtMkVyRHdUcThQN1VVeWROQzBTZFovdGVZLzVnaE4y?=
 =?utf-8?B?dTJSaWU3aW9JNmpaSjJjL3lGblUwbjR5ajh4UWZQc3FuRGx3aDM1UDIxd25a?=
 =?utf-8?B?ZDNTcDBGbVlvbHlhYnZLZ3hSMUw1MmFOMTk2ZEZrZWhuM3N2YnJHQVdJRUxD?=
 =?utf-8?B?OTY5K1JnVHhDOUkxdlNsdDQ2bnZrYVRrM0NSWGViSyt0OXdaTUgxUC9ZN2VR?=
 =?utf-8?B?T3dWK05ORldIK0F6b2JyN0x1cnBQblVEdnc0eE9ic0wwQlpmK3M1czVocDRx?=
 =?utf-8?B?TGpiOHQ1SVIzeHNIZzdKZUU0Zml1aFZ3bjFkSHpkQmYvVlkwUkRrc1krdFI5?=
 =?utf-8?B?OTUzL0xSdnBsbmtHa0FVZUtxdHJyQ1R2Ukg5eFpxVHJlYUNleG51L2xkbm9Q?=
 =?utf-8?B?bDFCSkMyMWpzMG9UK0ZvcWkrZERQejVtUlBLMkxaZWk3RXAxcjNQSUhKcjBW?=
 =?utf-8?B?NWVLN1dUM25wMGh3U0d4MGRGVllGZG4zWjZ5MTZJTkxTQXNHRktFMzI5bGcr?=
 =?utf-8?B?UWVsOUVyS0xTYkhqUHJRNW81WSt0aEdFSEFIRVhhaEtNYUJxNExpdm5rNEZp?=
 =?utf-8?B?b0pPd1JSOG9DSjVtR3FPOUlWblpYS1p3cUFWeDRrQkhFQXVQODFMUEV2Y2ZB?=
 =?utf-8?B?NnF3eU54NDBnbUxCa1NuOVFObkJxc3NQOUtQSHVqK2JTWTVYanpZakFkcWVF?=
 =?utf-8?B?R2VYTHkwd1RuenkyZUhXQ1cwZVAxL2krSW43TXpnRmZXRXdtSHg3TEJscEg1?=
 =?utf-8?B?SEFpdjk1UktralpDSFdyY1NybG5ZTXJnZ2tsNDR0cVFOSE5OK2hjZndyTnky?=
 =?utf-8?B?T2lJL2N5clEwbEdZV0hPZmd0bXBIZWVPVXkyWGI3UjFyeFJKODh3cTNCemN6?=
 =?utf-8?B?SGFvcm1FRVg2Ly9Pd21HRHpuUUhBeDU1M2MreTBzSGhVaHgyQkk4U2RyVmxW?=
 =?utf-8?B?YjFjM2d6cFFkQnVQK0hES1MrakNyV0krLzJKbXJhdlNia25tUnh4MEZYRUFD?=
 =?utf-8?B?SFNodkM1R3RwTGtNSHJ3Y3gxeTJtL25GcGVxakVBdEJnZ2k0YjNKRHNKZjR3?=
 =?utf-8?B?WHNORmJ3NzV0bUYvTmhMOXdNbFppMklxOUswMk1JTnA1bEwwSElEZmVzcVE2?=
 =?utf-8?B?SW5TczFZeWt3UnVJUU5wZ3JDaUtQQTAwQ3Foa2ZES0dzSDh3ZWYwVjFmY0Qx?=
 =?utf-8?B?RUx0OTBneWFKbWZxSS9TeXJKQnJMNmRtY0lzQkhQMEZIVW81ajRvQXhoMGpG?=
 =?utf-8?B?eXp1cWl2N2JqMVdYd1NPWFo2TEJxVkdoaVBjSVdPdEwzSVhxUkhpSnExcGs4?=
 =?utf-8?B?NmNDUEdaUlZ2ZzNSVTVwTjVXNHB3OGw4eGRNWkZ2WnNWcE4xOTdRVkpuOUJZ?=
 =?utf-8?B?Yk1sVlNIdkpQampSWHFJVGFOSi9MMXF3eWJpOU1vOVdEK214RTdWSTlVVXVn?=
 =?utf-8?B?a2FWKzF6WDRnNXNKdnRiaGxoTGR2VURwZ2JqV2wyZWhCMHFMZDRyVWc2dUsy?=
 =?utf-8?B?SW0wR2crSkNVWngvU2NDU1N6UlhUQVRUblpua3lhNXhEU3NOWkVXL0llc1JU?=
 =?utf-8?B?azlGbUxIM25jQkRhdGFmbEJGSHpVMFJlRHVvSCt3enE2aWZUMjY0L1EvMlpp?=
 =?utf-8?B?QlVORm5GZUFOck4zcDBoS01jUWFvMEg2cjBNbFIrODk1eEdxYzZWbEF1NlJG?=
 =?utf-8?B?UjNZazk5aEVtQkE0L016a3V3bUdJeEc5M05oMytZUmtMbzNsM2xCYlV1M210?=
 =?utf-8?B?S1hzWFJkOGVKdXRVTHY0U2VNM0hUN2dxYmFDSWNLZ3VRNURKeHVKUGNRZUlC?=
 =?utf-8?B?Z1E1WGJPUmpmeTlPK0FzNTArS1phTEp6SzRjZGhKWVAwMDVBYTBqQ0RhelV1?=
 =?utf-8?B?bWhtT01HcUZxWEhFVytScGxPK1ZuNEVPOExSemsyeXFMd3c0U2ZFdm5OSlVy?=
 =?utf-8?B?QWNsdEZjRFMxMC9mdUNzVmZOQnh4OUJRbFRNZVc3amVzeFM5THp0VDd1ejhC?=
 =?utf-8?B?TDBCYjgzTTEwbThZeDZyWDBneDFTMytXTloveVhlV0x1bnQ1QXhKV0U0SGFy?=
 =?utf-8?B?QzVuMlZtdDcwaEtPOFloazlhUVZ2b3hEdzNaZ1hETEc3ZGxtdTk4WFFWRHB3?=
 =?utf-8?B?Nm9ibEZhMWlmc0ppdktnWnVrS0htekxsbWc4L0hnMHl0ZmY2L0ZaUnNpWlJ3?=
 =?utf-8?B?U0JDeUNtT3F3WGxJYlNIbEE5SHJBNlNYKzV2dEh6TUVjbFJrOGlERys0UklG?=
 =?utf-8?Q?ZxGExkNVB8GQlz0Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A208088193D8544AD95617CC3845FC0@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	ZWCDEA1JOb6Aaf6WRlRIe91E3CrjN7BnAZ87OWzmFRgWV7meTgeKVulVsZx+NPSR2l2YMaVhvsaqpec6EpSvRP9t3qmOkhd6/nkKE16cVixf5rg1XtRA8LUyBRV2ZVG/x8Hjqv82V3CnMI963rl+qDgmuXLNexjBAk9B3Y+NjpekYmff44KxNeneLF/y/Ny5D1CgBreqRU7dhWa8mKfQQJq4kHn8HVNcuoaWgmibmOJzZvuYBeb3oJew1XfkFln1gEagcwy/Ycb6kehX6N5VGyFzGhUVTAdq6EFjnJ1K9kTcc34tLGMjDJBZqerhXm4eQRt1bjCfCzSsHtMt9qse3g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TIHUer1JRND4ktCMoJulgMM+xcJFGAetXMQ3Q5MwxcvLFKLC3xMymxQC2HfG9iX5+OzgjXl+avZ6LJYwOUM4TYSS6YuXZA/1yA8kvqqRnrWiKBWBOfvrFPwW8QU7RFI3CwkRKmpHhAAyF2OrKzkVlhi2Vn65OARSH9Oe0FJWynSRQ7WL7+4zRQrEsRF5ubUl6bsY+Iw5kmrF1B5Su0RWLvOwnrnmi+MNHxSv8FH4V0oLo862kVo7p9MpIfYUplgFEhisR4dTjJlZtGrfXsFJ7SlSnOSVk5ZW4fujMaP3cCL6yY+KvsgOEIoW9gx5f6oTuFYx0ij4KjIfO61uc2YfZVtLsyg1sQAZkWjbzUSR9afaY1S1QRYwRnEQnRUPLXsvg9daBF5WFxh6qxaIhZEFiGq98C4NRcGrrI+shmp9DI/JsXJyjGaJtwRS+R7UfhMlft+oSvto1MYO7HbB4uEqXYbR+2x3fnPOBQtXYBB+eZfe6gy6CRLE60gqACWmC4/XTT9Wb70fFjq032hojPZdHXeIMrvJsWJznBlA1TFa4Dw4YeKhqbPhn5dH5aeMnmRVGMwpD7WZa/+S/t2dMy6FL5UoAoK6op3BN9YqC65PKLU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6667.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dba74baa-385f-41c9-70b3-08df1255c078
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 11:46:02.0469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CJlJEVcSqbWvEzeHafWXS840uHwT+KrgY72ZXs+WFenMXAJkWUIJdG6Pb340IdNVGHJttM8Q3ZH1y8PHIxbZiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6289
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2609140166
X-Proofpoint-ORIG-GUID: WUiZ_uXG_XinVuEF2k5o7G-XUSXEtkVF
X-Authority-Analysis: v=2.4 cv=MuvHeGae c=1 sm=1 tr=0 ts=6aa7de7f cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=GoEa3M9JfhUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22
 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8 a=vMh0cEQ0xR-Y66CJniUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2NiBTYWx0ZWRfX3CJ6jUWFOjlj
 cM5m1960qkKGRUmocVKEMYOxYR26ErxC0DZ0OHJJixTbO8Q3/sMtQ9HwY3VwpQ48CERhYMy9N7/
 YL/2Npz6CineCR39n+HxqDjMGLIptlYNCABj8TSf5ni9fKQyfyXZ
X-Proofpoint-GUID: WUiZ_uXG_XinVuEF2k5o7G-XUSXEtkVF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2NiBTYWx0ZWRfX1tLHFVLI9ynE
 4Yj0NnzZZp1+Rbf8vIKx08SPEFTutYfR5F4IHM/Gt/+eI/0bN76tr1Nk9JIdX6UGN+3l3lleeGt
 Vs0cbsHrP6ZV9efyHCDls3fTFJpoISfYmNEkKO4JpCNd33mXvJjPw1tDovUnrRGUXTsjABhMucF
 nCaxAQKQXPCO1TKr/RCZm2cTHv7zyMOwhwxYk/BCAOvJzAQ3JYnoNh8slmSWEcJDaO9wkPN0XhV
 pc7GnQStRqMhgdRUhNbXY6on/ZOC40nHS5CZoz3smOefQ/QY/tn1RKM+ixopTPBzWiah2c5WN6V
 q6FVoNaI9qECI1FFB+wAhqfePcpNBcON2BuBIfjrQ6cCzkSQ/E7//IdTzQGLA6khnpMbaiphJud
 8GGk/EuingM1EA7Mrny4m+rnVm2OXrVUOVa57bOwBVEYaCKM2bRXDZDBrSssykDmfZiZ5DWZhDE
 i4XrqZMjoIGaqnWgBPw==

DQoNCj4gT24gMTEgU2VwIDIwMjYsIGF0IDE5OjE1LCBEYXZpZCBMYWlnaHQgPGRhdmlkLmxhaWdo
dC5saW51eEBnbWFpbC5jb20+IHdyb3RlOg0KPiBPbiBUaHUsIDEwIFNlcCAyMDI2IDE1OjMwOjAz
ICswMDAwDQo+IEhhYWtvbiBCdWdnZSA8aGFha29uLmJ1Z2dlQG9yYWNsZS5jb20+IHdyb3RlOg0K
DQpbc25pcF0NCg0KPiA+IEkgZGlkIGl0IGluIGFub3RoZXIgd2F5LiBJIGp1c3QgYWRkZWQgYW4g
ImF0b21pY194Y2hnIiB0ZXN0IHRvIG15DQo+ID4gbXV0dWFsIGV4Y2x1c2lvbiBmcmFtZXdvcmsu
DQo+ID4gDQo+ID4gTG9jayBhY3F1aXJlOg0KPiA+ICAgICAgICAgICAgICAgICB3aGlsZSAoYXRv
bWljX3hjaGdfYWNxdWlyZSgmZWwtPm14X2F0b21pY194Y2hnLmxvY2ssIDEpICE9IDApDQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgY3B1X3JlbGF4KCk7DQo+ID4gDQo+ID4gTG9jayByZWxl
YXNlOg0KPiA+ICAgICAgICAgICAgICAgICBhdG9taWNfc2V0X3JlbGVhc2UoJmVsLT5teF9hdG9t
aWNfeGNoZy5sb2NrLCAwKTsNCj4gPiANCj4gPiBUaGlzIHBhc3Nlcy4gSXQgYWxzbyAob2J2aW91
c2x5KSBwYXNzZXMgd2l0aCBhdG9taWNfeGNoZygpIGluIHRoZSBsb2NrDQo+ID4gYWNxdWlyZS4g
QnV0IHRoZSBfcmVsZWFzZSBfaXNfIHJlcXVpcmVkIGluIHRoZSBsb2NrIHJlbGVhc2UuDQo+IA0K
PiBJc24ndCB0aGF0IGFjY2Vzc2luZyBhbm90aGVyIGJyYW5jaCBvZiB0aGUgJ2JpZyB1bmlvbic/
DQoNCk5vdCBzdXJlIEkgcXVpdGUgdW5kZXJzdGFuZC4gRHVyaW5nIHRoZSBydW4gb2Ygb25lIHBh
cnRpY3VsYXIgdGVzdCwgaXQNCmlzIF9vbmx5XyB0aGUgY29ycmVzcG9uZGluZyBzdHJ1Y3QgaW4g
dGhlIHVuaW9uIHRoYXQgaXMNCmFjY2Vzc2VkLiANCg0KPiBTbyB3aWxsIGJlIG92ZXJsYXlpbmcg
c29tZSBvdGhlciBmaWVsZCAtIHBvc3NpYmx5IHRoZSBjb3VudCBpdHNlbGY/DQoNCnBhaG9sZSBn
aXZlczoNCg0Kc3RydWN0IHsNCglhdG9taWNfdCAgICAgICAgICAgbG9jayBfX2F0dHJpYnV0ZV9f
KChfX2FsaWduZWRfXyg0KSkpOyAvKiAgICAgMCAgICAgNCAqLw0KCS8qIFhYWCA0IGJ5dGVzIGhv
bGUsIHRyeSB0byBwYWNrICovDQoJbG9uZyBpbnQgICAgICAgICAgIGNvdW50ZXI7ICAgICAgICAg
ICAgLyogICAgIDggICAgIDggKi8NCn0gX19hdHRyaWJ1dGVfXygoX19hbGlnbmVkX18oOCkpKSBt
eF9hdG9taWNfeGNoZyBfX2F0dHJpYnV0ZV9fKChfX2FsaWduZWRfXyg4KSkpOyAgLyogICAgIDAg
ICAgMTYgKi8NCg0KPiBJdCBzZWVtcyB1bmxpa2VseSB0aGF0IGFkZGluZyBhIGJhcnJpZXIgYmV0
d2VlbiB0aGUgbG9jayBhbmQgdW5sb2NrDQo+IChvciB1bmxvY2sgYW5kIGxvY2spIHdpbGwgaGF2
ZSBhbnkgZWZmZWN0Lg0KPiBJbiBhbnkgY2FzZSBJIHRoaW5rIGl0IGlzIGVub3VnaCB0byB1c2Ug
c21wX3JtYigpLCBzbXBfd21iKCkgb3Igc21wX21iKCkuDQoNClRoYXQgbWlnaHQgd2VsbCBiZSwg
YnV0IHRoZSBpbnRlbnQgaGVyZSB3YXMgb25seSB0byBtaW1pYw0KdGhlIHNlcXVlbmNlIGF0b21p
Y194Y2hnKCkgaW4gb3NxX2xvY2soKSBhbmQgY29ycmVzcG9uZGluZw0KYXRvbWljX3RyeV9jbXB4
Y2hnX3JlbGVhc2UoKSBpbiBvc3FfdW5sb2NrKCkuDQoNCg0KVGh4cywgSMOla29uDQoNCg==
