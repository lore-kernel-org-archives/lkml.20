Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27C03BA22C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033579; cv=fail; b=d3icM3I0IwVYj1Fd9pIPlbuXuhyrmVtOOQt04msfeH2Z4POq7s/AQsjQcrbOil9H6WIiDHSrptwjJbahpjXiELpMFikdeb7lC8FON+3S45bsvY2M25ZCn9++MLhUZCEPlefp9hM14e7R2Qk86VNDkVg8Wcds/bS+47jSAGOT0io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033579; c=relaxed/simple;
	bh=OI0t3xY5G5P3yiPoLWuE0ym6YewcqGltHrZONDNngs0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=THIEHfYn27mN8CTOW9+Et15KeHQvWfXq94nyPKFQvuBToS2s07D1RIYRWVWFQpKWSoj3M+DfPjtnbc9kgbRL/Akv0jeEsIiavbnpRE1gwfgzyuWyiN8mMCEMQ9Nl/dRfqbRq2Hq3mwCdGTiE865fLpayCaASXy0giDZsyw/dMro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nbTiOKPm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=x62TPpFW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nbTiOKPm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="x62TPpFW"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689KU88o2913559;
	Thu, 10 Sep 2026 09:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=OI0t3xY5G5P3yiPoLWuE0ym6YewcqGltHrZONDNngs0=; b=
	nbTiOKPmFXtfbIuMz8xRS7/y+0P85CBQ0ZtX7fvJnhpzdyUeNJaqjqXUn1uQNATk
	Uo45zspr5D9cF09oBVMBTFqodU9ZKC0dX9muaOYF3sZ0mikj2vLesCtAA/HW6LEv
	rPspYEDEnZnnXnWUYIDQml3W7QS2Th4QlQjZMt8VCGaYfPW09fLFJXPWcnShHAlS
	SVi5V+BhbmIW03MgXGJMs0rcfiq120BG0Q95jYZ8KVxS5gWtnXAbqVFIJIlggCxn
	Cuvj7/cZu7wM3CMF667iadUbfCwvRiLhpPTJpCOxzi4CZXmpAmD9LbPZPoHh8LZ7
	flKYxJjOo0iI6jIYnGB4hQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gkcyu8y8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Sep 2026 09:45:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68A9j3HE030103;
	Thu, 10 Sep 2026 09:45:51 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012054.outbound.protection.outlook.com [40.107.209.54])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gkck61hbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Sep 2026 09:45:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/ziezraZMPAaCu7rDXCMxXdhrJcXB2kJX46gEEb3csMG5s17oWFb+2DBDfGnGrPdeRxt3VBeL8lQBCOW2cqLidpcZ0A60/O7WbswrHlVVZiZqqRaBLTodb8vT0pqKh5aO29RNWsJFI0nUQuNdtCkxT2cZ5iIC3EvXNI7v8QHjsMlcxh7kj/vVdCh99bBcdrl1MOGjoRd0Ap/fMEsoDb0yw7lP3l9VwZR/HQ69SB6kGYsXf8XN9ICFOHaG7JQvbdH1A5+WFPrC0QChEy5Bs0LhEzOXtvHZybESroUUhl338Qk3ci6UOtZzLZI+hdAcwuExpkxPStLgwiLK7rLl1axA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OI0t3xY5G5P3yiPoLWuE0ym6YewcqGltHrZONDNngs0=;
 b=qliRXkFRukEouGgxp8OkkxQB4ba8BkPHvCVa48iHgpSoO3qb73K8FEbWT0QJng8vQ+5iwmD7icf+XZytVJ+VlptwjHxCWCItfd0GzIbud/K+TdLq8J9IlibYybFLS49ePORpOrf+FBmW8BDic3Yn/qInRBzqE5u+B9octCYZmsyxUxA8MEyAOYjZTrUl72sr7bHEAd6UotCIEg9QtaVd4ScaN9i22FZCY3Fp/CkAMhA179NgEYoBnb2t8Mz9MekwCt5R2Nf6KMLyuYAR59mKgGlJPqH1sMqJWYoVdmLiqARVKyt87oDdxgrt6md4KL7Vj3IhvyfisIMvEFNrm9CWfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OI0t3xY5G5P3yiPoLWuE0ym6YewcqGltHrZONDNngs0=;
 b=x62TPpFW9hQLDd4iK2N7V/1rX03077mp4+SOIMK/1Ya8LznT/HdNdNA0ry6AIR2g9WWbOjA3ROO8pnGMUv1PT/+KzUDoTcXIrnFRW3BXutQ4iO/JhyKppNiWuEeWpjOK+q/VPhnW4HaM6cswy1uFEsExKuq84EH3bsqCoDMVh8I=
Received: from SN7PR10MB6667.namprd10.prod.outlook.com (2603:10b6:806:299::7)
 by DS4PR10MB997572.namprd10.prod.outlook.com (2603:10b6:8:320::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 09:45:47 +0000
Received: from SN7PR10MB6667.namprd10.prod.outlook.com
 ([fe80::ff41:744:dd32:93f1]) by SN7PR10MB6667.namprd10.prod.outlook.com
 ([fe80::ff41:744:dd32:93f1%3]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 09:45:47 +0000
From: Haakon Bugge <haakon.bugge@oracle.com>
To: Waiman Long <longman@redhat.com>
CC: David Laight <david.laight.linux@gmail.com>,
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
 AQHdPqg/HQaOn0CQxkmYQSZk6Ujl3bbDSOwAgAAV94CAAu71AIAAZGCAgAAFTICAAN1uAA==
Date: Thu, 10 Sep 2026 09:45:47 +0000
Message-ID: <0ADD6DCD-6EF1-469D-ACB8-EC7D6A94CC2F@oracle.com>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
 <CAHk-=wget=mgjpkPJ+3-tueqo7AK1m4MR_Jqht6bj3-w+FhQHg@mail.gmail.com>
 <20260907182705.54585f73@pumpkin>
 <89F7CD08-2BDD-424D-AA2F-77D72647D93E@oracle.com>
 <44bdfc4b-4729-4dc3-b7b0-53c671c5ee34@redhat.com>
 <dd6a7873-7d23-42e2-adbd-b59c43141d96@redhat.com>
In-Reply-To: <dd6a7873-7d23-42e2-adbd-b59c43141d96@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR10MB6667:EE_|DS4PR10MB997572:EE_
x-ms-office365-filtering-correlation-id: aff7f252-7baa-4e92-f9d5-08df0f204a8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|38070700021|10067099003|4143699003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 OVmRFJu9/DVfoh/nZaXxuf4y9VqiUzw3Iulm3u/CESHnM1ipVjIbjtw8OiM4sV2Y9o0/oF2W4UBG315VpVGoE/UXMjnaI+s4rCUFN1Wj/6iX4kIhwrIrt+ApvRA+lsAyllo/ZwJ0Gjj+U4WZR9C6i94revty+KD120jftlnW3Rc+X9GsDr7w0A1/gAnpCluXZv6Q8p7jVbrdJ855AsDqbjBA/T2FglnYOzp9Q7QQqxt79EjdhOeGnCvplpXUsXFYZFRcRaAcaxNcKAncaA7HU/6KHmaNeXzHXK6DBQn+jAB/0A5sgZcGm6tJc0u46YNDLbx0Ow/XgrzIjtbFJuvcjejMAqAD0jEx8+qXOh9zvakT+wmD4b8/SGtJ4HGwohl0V938EqIWeohZ7hsQKEhAa98YvFOH9LJ87U0MJCbr8JI7ibJa5l6H3qcgFUg/FApc/+T6tyw5KZg6bWdwh3B+Qt9jn0vLyrq/wMy79b05ELvR6fD80CdnAnmnRW1ViaIhHXIdL2mpiGyUd++m4EyrTHqXQAGOrv2wKPF6zkWAqfIsZ2FHYU1/VZXbq7szgr1uvlS0zv3xzDwsDDEhV9KFDwqr5b307o/ilIyFUjrDByplAFqVu61MyxNgdWu5K92HjWN0YuMy3aRvjRjYwQT6TpnuEfFGUKNngtKmzMC0o9r2m33huoyKgWrxZZHdHlQhlLT0dACj1r4Ni3CuPuJsD8J08W3wEWI9CO8QjOUrw5s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6667.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(38070700021)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eFYrQzUrR2Z0MXZOakp3N3c3QmdYVmhiUVNuL2dxTUg1VTFIQk1SelVGakZX?=
 =?utf-8?B?NVV6WnJMbmMrNzREVE1taXFvcHRCYkE4c1g3SnV5dGd3QW9WWDRhSWFCNWRG?=
 =?utf-8?B?UUp2UCtxaTlRL1dKTnF3eXRVbXJXL0kyVTdpdFFhbzhML2RNekRpQ3FtSTNV?=
 =?utf-8?B?TS93QW4rdmc1S2RBaXROaExjNjR3dW5VVk94VDlmMlgyY2FzYzFMWjBFM0la?=
 =?utf-8?B?TlIycWxRN0JRRWRBRVQ1TzE3U2QzZU1hS0lLYUVTWWRBLzBpT2FtSHhxTm50?=
 =?utf-8?B?NGVoSG44Y1czM0dOY1RpNUVyV1VQTVNkSVdvcm1PeXp2VjNhemhnYXpxZ3pi?=
 =?utf-8?B?aTd5V2E4VXRia0IzYTVqclNwSnZ4RnI1ckZjZ2pKekFJRU13SjkyYnB5NXhl?=
 =?utf-8?B?R3I4N0tYaTRuclZFaXY1NURnK2ZTZ0d3TUlLazl5QXhteEZObHpkUXFZSEVN?=
 =?utf-8?B?ckNMY25jK1VqaXdsak9nZmRUMm1xTmdFMkhDdUJhTXV0QldhVmxRbDNUeG9q?=
 =?utf-8?B?TCtPMUpZMnhyblIrVTh6d3JJd2tGVStjcW9Zd2lpOUZENkhYSzA4eFVtekV1?=
 =?utf-8?B?QTVwWXhsS003eUVjaktkaEVTb3VoMnh0OXVXM09ZRzM4eS9ISG82ZEdZdjdB?=
 =?utf-8?B?UjVncUVORHR0Skt0TFd5aGFaL1JISWZrM2lNSEFIazEzc1JZb0QwL3lnSjFR?=
 =?utf-8?B?V21aUys4SU5SRHlRUHEzdnBOeWYwRWN4YmZJWkVhQUNIZHFaZGg2cENIL2d5?=
 =?utf-8?B?TGN0SmZWeHoyclpJWFl5S3JrNjBFRkVqdktEdGJibFdTUk5rUTU1V2lzQlcx?=
 =?utf-8?B?UDhqSHlTVHNad0JxZC92MTQxcVgwcVBXWEJNYXlOd2grNHd6ZzhsMXlKbDJi?=
 =?utf-8?B?RlJjOWpKL2loRkQ3RVJVMy9KTDJhYitwSzh3RmZFNG9rdkZQUTdxR1RCYWEy?=
 =?utf-8?B?bjF0SFArTm5wT1NxaTRkajBCVTc1QitOVVdnUHpGN0xIa1l1YUF3Sk11bWZU?=
 =?utf-8?B?OFYwaVlQQWpzR2o2ZXFiOXVzOXg3ditkT0NpeHFQa3M0ZkN4cjZLWmR6bzQw?=
 =?utf-8?B?eFpVTm9nWG50MXlKN2Q1SkhKQmVhS0dZTEdRcVlxWXpKcVdDUEhFN1huVHhw?=
 =?utf-8?B?YkY1UlVabEFCbTBIRHZpb1RWYUlCNGxPdzZYTmdGRHkyT3loV3hEME5iai95?=
 =?utf-8?B?TWhNdURlRGFMMnVsZDRmVWdmZytaUjhUbDBXYnhya0lFMXhpVzR5Z3hqQ2Jk?=
 =?utf-8?B?WGdySXlLWHlOVzYvcjBEYm52QmkyeDNjSGlTSDZBeUFHKzVVVTRYWWh5Q0l6?=
 =?utf-8?B?bFNIdm91bzg0YU5IY0FQNXRBaGd2cUUwRVdVMGdYZ1NwQWw1aVR4WFhhU2wz?=
 =?utf-8?B?MUF1VGxsRlJ6Vk9FcjFjdGxSSjhmUWo1dkgwWExjbTBXZytWckhSNE5VODNS?=
 =?utf-8?B?L2k2VmVrNStOSTNic1NhbkhsNXhyVHpRZjBFaGF0NWY3d1J4RmhEdkNnOXNq?=
 =?utf-8?B?b0F0SUdEZGdRSlIvdCtRcHRwaWpyQ3hOcE9nRUpoT1VGU0VqaUhVRHh5MitG?=
 =?utf-8?B?QzkwNFNTRHRFU3Nvb3BqTjR0eXRtdHRqaERZN25xZ25iQlgxN0dodlhsa2ZU?=
 =?utf-8?B?NVJVMnQ1QWRlR1FscHB3VUNPMTV1Zm9xR2c1YVpmR1k4Qmh6eWs1OEpzTXRh?=
 =?utf-8?B?ZjQ0eDZlYWR5UkJhOHo2WklmajdibTRRMHZlYW0ycVkzMDY5cjU2Q1JJQmtH?=
 =?utf-8?B?NTFkRS9YR05CKzZseDluTXpRM0kzZGtoZXcyUkJPcE5LUXhucmJ5UXd6YTEz?=
 =?utf-8?B?S2t4QklyL3V4anFhTUxIZ29hSzRUSjhockVoWFZxb2c5TCtxS3hGUVZrOWpE?=
 =?utf-8?B?aHBmbGxCOHFvZmJHUGFJMERiOXlYVXBOOEJoLzdJMHFmZXFrMUorVmhNZTli?=
 =?utf-8?B?NWJxYUFHbEFTRnVqYkVnMi9uVDhGM1M4elV0TDRZMTlsZDhmbEljYjh1eUpB?=
 =?utf-8?B?di9uQStxdHFlK0J3Wkw4UlNqaHZnY1EvWFUrM0pCc1ljK1dWTmt5M0xQSDRa?=
 =?utf-8?B?TW8wdXhIc1J2Ym12ZVVqY1FRS25kR0FhUnJkZndpV1dYZEJKTHdxd2JkcFhU?=
 =?utf-8?B?UTlRYmk4UThPdVM3SHE5QjI4QWlDdDhXYldrMTFJMUVoTDBsQkF5eGM3cUxs?=
 =?utf-8?B?bTB2a2pYUmRNY0VwbGxMMDZhMW5sL2U2TTVPcTFySVY5N0pMbDlqL0NCZjkx?=
 =?utf-8?B?bnpJQjB6M2xlRGg4TTlXVHRhZHFnRk5NY3JVcldURTRTUDBNR1lBWll1MHpl?=
 =?utf-8?B?QUxpZWp1RTVpNW5GWlVKN1IzbzhvaHc1OXpuTFJmRTVBYXUyODFwTXVlYlVW?=
 =?utf-8?Q?5qjDoFUnBT/1WQk8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0184E9440571A4CA5A17B04E56901BA@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	CZSQ1zg9S2jvAGwxkHyNWRP0k+cC+fTButrzt3OI5EcXDFeyV5OYKGtUhg9d+QlAP3Bs0yqeeah6d/cq82l/zHjcinj58wl1PZR344k7FCovItHbFghTsK697SqZr1kDp3FFv54a4URAsgFj/Hc+TUeO52d9+Gbz8pXkjHhl6Mj6U7fxf6ZpyLx8gwae91c6Kg6cz+0VnO8aO1it3cC7z0+2dCf0kvNJ/+EUT3uo/0pDxvS9AfFc7wbHGGc6yxr1CZUmSHqp3aZPTQEe1Dm8f6G1OwPx2T96/V/o82dZOe20MmkI1muoMKFN7QYbsgwUQGoa4I3nETEix66UzqR9Bw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sGy4TTqESuU7aiDnBjLKqMVye94lJuIwGv+mCSelPLKvSEo3S5fU9AX7gkK9x0E+PtWWE9UBqxt2A4zRddv+mEYEyvcNRxZ6KaQH8+rraS5Ou3xrI86JzZC6KtuXoi/+CWpd0ptiiaVvjlc6SmN78KqAGkdNLo+rooHvJo+a+QxIxHyErpLBZwnVX9MwklZiOd6SwnVzk5AQiVu2BjHNhD5ONQLVp1q2IK/mZuiyRnLo+nJvsJk56NuReBpaTGR2e8cVwywBo9SLmcA5k+e87efHLlFR8UQev7hHAXsVZ3mj9l3a0eWCUi5hqDpnwFlRjO5LlTcVGggA1VIxa9h4SkCokbjlJtR9LFXzJ+yT67ehHVr2W3ckUUxBZTA1ivMCzN/Gw+SAXlubw8hGQeb81dRpaEbma2D5jOYTLP2Nsd2I/0SvKnQOogpMzAWIirYXJ+5TGuQL8HU8F/9iETPIdIkjtjmjxCJUWA3uy8QQOFepQk5d/F1+nE2bpwQYfgnMrdK2iGp03svsvIKRZEtwL6FxzFoL7FsO+rCz7VzQKGOw10jzGKmPzaYrUwg/qu7I2cidC0EJhSA0e9G3hyFhA2Qk0dtH3gwf3bAEsWtePgU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6667.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aff7f252-7baa-4e92-f9d5-08df0f204a8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 09:45:47.3621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oWN7H7QPECfWcUVE9NjSVmS0/WudSb3Jz8Wv8Ts2uyFg78MvgErPUyMJMT+ojNLqV2y0hO7RuGTdq54jMGCASA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR10MB997572
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2609040000 definitions=main-2609100111
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExMCBTYWx0ZWRfX3P9ILvhIAUMw
 WtMhWSRm8Zanw+wM8N/w2T2SJuO3W8YuRpRjtYYdb7iEZbZ0znbfELXB71aKxxZR1pDmYI6ObF3
 jPMvuMsvhbsVhsQMGyAI0aULFKoBHQY/EFQqJbwsjw1bBN2tl4Gy8yEOsjxYZBHe+q1nqaxHR3K
 h8eKZ3bAj36M2ms30iqUa7O5hkHOyNgd87Wc0cBTQmBM+WDLSPX084O6FtHsMAFU+79oxkLTnVa
 4DWCKS8M5bDzWOWha8kL1gm6neU+THORyTio2gvNFcybBQJ3xPBKlDoG3tzEwT7VrqetE3to4ep
 TBfhRzhIeKTtvI4XtuLG6QBoQfsiVP9VvWijVQJ5oLRC3Bi1t+fK4mGyw1e+xYIu5+M2LkTRBbk
 AQmGzm1bNU5SIYkXAuwNpJVNPTxlnDTiA8o+LFzSIjlY7cswqo4+vcie8yn3rE3UBugRp1J5P1c
 cTlJn+IfuOlHahMfiPg==
X-Proofpoint-GUID: PscYrOT8mWNbGzrBm_nPIoNMLVCDaRrK
X-Proofpoint-ORIG-GUID: PscYrOT8mWNbGzrBm_nPIoNMLVCDaRrK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExMCBTYWx0ZWRfX5LyxkG8g6vdu
 pXX7nqSpobuBAVYTlUC3aARwzBLfxCtvc1HSx7ZwHIa7gZeFYnm6pV/Yo5ZeOD4sNj816szCAhG
 tQrLm1zRLxy2yKGAw6C+WEBgXbBNq5TssVhZPiIzQOBTFTOVPd3/
X-Authority-Analysis: v=2.4 cv=GPSdgeNK c=1 sm=1 tr=0 ts=6aa27c4f cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=GoEa3M9JfhUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22
 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8 a=DObKqLJ-CiiiSR_VqSgA:9 a=QEXdDO2ut3YA:10

DQoNCj4gT24gOSBTZXAgMjAyNiwgYXQgMjI6MzMsIFdhaW1hbiBMb25nIDxsb25nbWFuQHJlZGhh
dC5jb20+IHdyb3RlOg0KDQpbc25pcF0NCg0KPiA+IENvdWxkIHlvdSBtYWtlIHRoYXQgY2hhbmdl
IHRvIHRoZSBleGlzdGluZyBjb2RlIGFuZCByZXJ1biB0aGUgdGVzdCANCj4gPiBhZ2FpbiBvbiBh
cm02NCB0byBzZWUgaWYgaXQgY2FuIHBhc3M/IA0KPiANCj4gb3NxX2xvY2svdW5sb2NrKCkgaXMg
c3BlY2lhbCBpbiB0aGUgc2Vuc2UgdGhhdCBsb2NrIHRyYW5zZmVyIGNhbiBoYXBwZW4gDQo+IGVp
dGhlciBpbiB0aGUgbG9jayBjYWNoZWxpbmUgb3IgdGhlIG5vZGUtPmxvY2tlZCBjYWNoZWxpbmUu
IFRyeSB0aGUgDQo+IHBhdGNoIGJlbG93IHRvIHNlZSBpZiBpdCBoZWxwcyB0byBwYXNzIHRoZSB0
ZXN0Lg0KPiANCj4gVGhhbmtzLA0KPiBMb25nbWFuDQo+IA0KPiBkaWZmIC0tZ2l0IGEva2VybmVs
L2xvY2tpbmcvb3NxX2xvY2suYyBiL2tlcm5lbC9sb2NraW5nL29zcV9sb2NrLmMNCj4gaW5kZXgg
YjQyMzNkYzJjMmIwLi41MWNlY2YyOTc2OTIgMTAwNjQ0DQo+IC0tLSBhL2tlcm5lbC9sb2NraW5n
L29zcV9sb2NrLmMNCj4gKysrIGIva2VybmVsL2xvY2tpbmcvb3NxX2xvY2suYw0KPiBAQCAtMTQz
LDcgKzE0Myw3IEBAIGJvb2wgb3NxX2xvY2soc3RydWN0IG9wdGltaXN0aWNfc3Bpbl9xdWV1ZSAq
bG9jaykNCj4gICAgICAgICAgKiBpcyBpbXBsZW1lbnRlZCB3aXRoIGEgbW9uaXRvci13YWl0LiB2
Y3B1X2lzX3ByZWVtcHRlZCgpIA0KPiByZWxpZXMgb24NCj4gICAgICAgICAgKiBwb2xsaW5nLCBi
ZSBjYXJlZnVsLg0KPiAgICAgICAgICAqLw0KPiAtICAgICAgIGlmIChzbXBfY29uZF9sb2FkX3Jl
bGF4ZWQoJm5vZGUtPmxvY2tlZCwgVkFMIHx8IG5lZWRfcmVzY2hlZCgpIHx8DQo+ICsgICAgICAg
aWYgKHNtcF9jb25kX2xvYWRfYWNxdWlyZSgmbm9kZS0+bG9ja2VkLCBWQUwgfHwgbmVlZF9yZXNj
aGVkKCkgfHwNCj4gdmNwdV9pc19wcmVlbXB0ZWQobm9kZV9jcHUobm9kZS0+cHJldikpKSkNCj4g
ICAgICAgICAgICAgICAgIHJldHVybiB0cnVlOw0KPiANCj4gQEAgLTIyNCwxMSArMjI0LDExIEBA
IHZvaWQgb3NxX3VubG9jayhzdHJ1Y3Qgb3B0aW1pc3RpY19zcGluX3F1ZXVlICpsb2NrKQ0KPiAg
ICAgICAgIG5vZGUgPSB0aGlzX2NwdV9wdHIoJm9zcV9ub2RlKTsNCj4gICAgICAgICBuZXh0ID0g
eGNoZygmbm9kZS0+bmV4dCwgTlVMTCk7DQo+ICAgICAgICAgaWYgKG5leHQpIHsNCj4gLSAgICAg
ICAgICAgICAgIFdSSVRFX09OQ0UobmV4dC0+bG9ja2VkLCAxKTsNCj4gKyAgICAgICAgICAgICAg
IHNtcF9zdG9yZV9yZWxlYXNlKCZuZXh0LT5sb2NrZWQsIDEpOw0KPiAgICAgICAgICAgICAgICAg
cmV0dXJuOw0KPiAgICAgICAgIH0NCj4gDQo+ICAgICAgICAgbmV4dCA9IG9zcV93YWl0X25leHQo
bG9jaywgbm9kZSwgT1NRX1VOTE9DS0VEX1ZBTCk7DQo+ICAgICAgICAgaWYgKG5leHQpDQo+IC0g
ICAgICAgICAgICAgICBXUklURV9PTkNFKG5leHQtPmxvY2tlZCwgMSk7DQo+ICsgICAgICAgICAg
ICAgICBzbXBfc3RvcmVfcmVsZWFzZSgmbmV4dC0+bG9ja2VkLCAxKTsNCj4gIH0NCg0KVGhlIHRl
c3QgcGFzc2VzIHdpdGggdGhlIGFib3ZlIHBhdGNoOg0KDQojIGRtZXNnfGdyZXAgbXgNClsgICAg
Ny4wMTA1MDJdIG14X3Rlc3Q6IG9zcV9sb2NrICAgICAgICAgICAgICAgICAgICBwYWRkaW5nOiAg
OCByZXN1bHQ6IFNVQ0NFU1Mgc3VtOiAwIGVsZW1lbnRzOiAxMDAwIGVsYXBzZWQ6IDUuMDAwIHNl
Y29uZHMNClsgICAxMi4wMTQxNDRdIG14X3Rlc3Q6IG9zcV9sb2NrICAgICAgICAgICAgICAgICAg
ICBwYWRkaW5nOiAxNiByZXN1bHQ6IFNVQ0NFU1Mgc3VtOiAwIGVsZW1lbnRzOiAxMDAwIGVsYXBz
ZWQ6IDUuMDA0IHNlY29uZHMNClsgICAxNy4wMTc1NzJdIG14X3Rlc3Q6IG9zcV9sb2NrICAgICAg
ICAgICAgICAgICAgICBwYWRkaW5nOiAyNCByZXN1bHQ6IFNVQ0NFU1Mgc3VtOiAwIGVsZW1lbnRz
OiAxMDAwIGVsYXBzZWQ6IDUuMDA0IHNlY29uZHMNClsgICAyMi4wMTk2MzZdIG14X3Rlc3Q6IG9z
cV9sb2NrICAgICAgICAgICAgICAgICAgICBwYWRkaW5nOiAzMiByZXN1bHQ6IFNVQ0NFU1Mgc3Vt
OiAwIGVsZW1lbnRzOiAxMDAwIGVsYXBzZWQ6IDUuMDA0IHNlY29uZHMNClsgICAyNy4wMjIxOTJd
IG14X3Rlc3Q6IG9zcV9sb2NrICAgICAgICAgICAgICAgICAgICBwYWRkaW5nOiA0MCByZXN1bHQ6
IFNVQ0NFU1Mgc3VtOiAwIGVsZW1lbnRzOiAxMDAwIGVsYXBzZWQ6IDUuMDAwIHNlY29uZHMNClsg
ICAzMi4wMjQ5MDddIG14X3Rlc3Q6IG9zcV9sb2NrICAgICAgICAgICAgICAgICAgICBwYWRkaW5n
OiA0OCByZXN1bHQ6IFNVQ0NFU1Mgc3VtOiAwIGVsZW1lbnRzOiAxMDAwIGVsYXBzZWQ6IDUuMDA0
IHNlY29uZHMNClsgICAzNy4wMjYwMzVdIG14X3Rlc3Q6IG9zcV9sb2NrICAgICAgICAgICAgICAg
ICAgICBwYWRkaW5nOiA1NiByZXN1bHQ6IFNVQ0NFU1Mgc3VtOiAwIGVsZW1lbnRzOiAxMDAwIGVs
YXBzZWQ6IDUuMDAwIHNlY29uZHMNCg0KSSdsbCB1c2UgRGF2aWQncyBhZHZpc2UgYWJvdXQgaW5j
bHVkaW5nIHRoZSBvc3FfbG9jayBjb2RlIGluIG15IHRlc3QsDQpzbyBJIGNhbiB0ZXN0IGl0IGFz
IGEgbW9kdWxlLCB3aGljaCB3aWxsIGJlIG1vcmUgdGhvcm91Z2guDQoNCklmIHlvdSBzdWJtaXQg
dGhpcyBwYXRjaCwgZmVlbCBmcmVlIHRvIGFkZDoNCg0KVGVzdGVkLWJ5OiBIw6Vrb24gQnVnZ2Ug
PGhhYWtvbi5idWdnZUBvcmFjbGUuY29tPg0KDQoNClRoeHMsIEjDpWtvbg0KDQoNCg==
