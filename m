Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04453F4DDB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373481; cv=fail; b=mxlvNCR3F5ADe3999vl3vCXb/OwTOXZpYLhYm3aArTeKDB3lGCbAjITT9MyyI7rzfRUzU6xfsb4esUDlpbhlLGehu24O4eZt7PtTojdkMDpTPq1+CqVqGQfaviUeOpb/rDxBnl0A6NtT49dEUe2+lB8Ybi94geOzL29BjgDh7Is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373481; c=relaxed/simple;
	bh=onkXqy6atOIa6sFCNR/8g0LAxd1UvnDJmDumizA8MAg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DT4hCHPEcWBKuJjB4PZMceY/oWohI3IYIf7EN8odsge4tE2qVaLtb2t/4481nsCeYT1Bin7M42Csb9i14cGK1iugjVdk5ZKHX71n3AgHjwnvqsai/Hq5u5vd9tCwfdTNZEGn89bJL1rBPjRlxnsVsd8vVRm+5/4HP8843DHWACo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Tm5SiaAH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=V8TOglG7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Tm5SiaAH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="V8TOglG7"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DNqBmT198886;
	Mon, 14 Sep 2026 08:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=onkXqy6atOIa6sFCNR/8g0LAxd1UvnDJmDumizA8MAg=; b=
	Tm5SiaAHSJDGamlBmSgnxKgd/WDwZTuWIdwK8LiXZcUWuTsfEi3ybKFVQfFGQovB
	go3iAECI0uOqQScRsnmeCrzbT9kthoXqldTuVmzIia5KwpazCuYfgF+cAhWHILp7
	RyOSsP41bbOppm3ZyBbTcSr4lFsXSC+VfuQ4OjG8k/IlyaikRuWHYJ/0KoskgxEe
	Rb5peWffajxbhp1cjctr4s36EG/vSHthZEGxbzEixHVTT7NWQJ76PL91SW2TwYyh
	1fYsEvLYc+2HtRrU5IjuMWhZLjiZFo0vfGjl6pIrmvQV5jA7wFyIvUeuEFBuPhaW
	RfH+t8ARWB/min5yTnXl5Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gmway1gwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Sep 2026 08:10:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68E8A4PQ011248;
	Mon, 14 Sep 2026 08:10:47 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010051.outbound.protection.outlook.com [52.101.201.51])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gmw6ajhvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Sep 2026 08:10:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNv8PiV7R0zrhiop1lbQiE5RFi4C8SCKC7Mzh58iN9S9FNnY/ibaErwcv6oTqxknu8xLqPLKOOh3QqukJTxPSXTIkUbw5lPwl4vBckUCjEHaNY+i/O23+0T1nCs/HGzC7BXy1Ve4V7emCQsPJUgFxu/ODA22logiIEbHz1EA6qvCuP1gPglqOKVaIzZ3PPWpbN2Fr1A7nh2E5vHjAjt9F2swVDmNIWq2HeqXSjMTZYT6lUrEKElrNyaoaSE+GBsHw83PYh3pcQ1AB5PG+bOpYiXUONLHnT4ovVfBjdmVSzuNDie/p5d9jH8FeLeopdY8j6EDbJaHzLk8ziuhyDWCwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onkXqy6atOIa6sFCNR/8g0LAxd1UvnDJmDumizA8MAg=;
 b=kFBQyosGbBFcQYc/3DZgGqHrIvG+BzRcPC2Qd8rA2L8R4LmbDlttC0U0mmce7xMVzBCB8rS7LNzgvdRDwi1RlJ8HmT4jZnFiRKil1wwatwm5LtaYOw65XWEX1sxZu6g22omD5RK0u6aRDYhkTldtnyf/pI4z0/VoJzy/LQYnKWDUvki30CFV+O4nrm0YAT+W8ttqmGE40qrQkH9aXVV78lDxCPNTWiMBg3ySTey1temXrHHKlWfU4froUT2OKpc2RFU6weH/ym8mHi/HuihU+G9WgZRaBhQNB/vRWzG62CHJW5v8b3CvHDN6WMzIDo7MI8t6dmopyNrDCyqfHMmjKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onkXqy6atOIa6sFCNR/8g0LAxd1UvnDJmDumizA8MAg=;
 b=V8TOglG7VJOxiS3gUqZlPPBaMrSEM/jUZ0TBy2fQ0OrW78kDZ1nUq91brrhevxg1lBuf3XRX7b4Mrh/khZYYyMM1YJVUJ2+YXO3QtRaERpHe5Ylbimq+NfYElrpCV7kkn1gTjIFEOz0CLNiVkRRoXhh7SsrE3bz1Bf1q1ksnmbk=
Received: from SN7PR10MB6667.namprd10.prod.outlook.com (2603:10b6:806:299::7)
 by DS0PR10MB6702.namprd10.prod.outlook.com (2603:10b6:8:132::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Mon, 14 Sep
 2026 08:10:43 +0000
Received: from SN7PR10MB6667.namprd10.prod.outlook.com
 ([fe80::ff41:744:dd32:93f1]) by SN7PR10MB6667.namprd10.prod.outlook.com
 ([fe80::ff41:744:dd32:93f1%5]) with mapi id 15.21.0428.004; Mon, 14 Sep 2026
 08:10:43 +0000
From: Haakon Bugge <haakon.bugge@oracle.com>
To: Waiman Long <longman@redhat.com>
CC: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Davidlohr
 Bueso <dave@stgolabs.net>,
        David Laight <david.laight.linux@gmail.com>,
        Linus
 Torvalds <torvalds@linux-foundation.org>,
        Yafang Shao <laoar.shao@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] p for osq_lock/osq_unlock()
Thread-Topic: [PATCH] p for osq_lock/osq_unlock()
Thread-Index: AQHdRCCJGKix2AIjbU+GO9PCfUoR6g==
Date: Mon, 14 Sep 2026 08:10:43 +0000
Message-ID: <360C474B-204B-44A4-907F-5ECCEB424A24@oracle.com>
References: <20260910141908.592414-1-longman@redhat.com>
In-Reply-To: <20260910141908.592414-1-longman@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR10MB6667:EE_|DS0PR10MB6702:EE_
x-ms-office365-filtering-correlation-id: 57eb7521-3451-4e68-35af-08df1237ac72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|10067099003|6133799003|22082099003|18002099003|56012099006|38070700021;
x-microsoft-antispam-message-info:
 NZamdVupIWt977zbngKZXhn54etDtz8c9ZmKzrBmC5rnEh+OUo+xWKsxMRITK701MEnyLXzR3p8vAthJ1QhLEhkKWeRMZAYt04seY+zNU8czsSHXkjESFEgmihaTXH7e8UsdvXt6wmmNVOg5dyPmIhl1PfUJ3Gh7XHnFqli5FBO0WN76qIxLdloEzrNwx/Hm6+oj2KY5Fe97r7yvoWlr76KGpsjEXe0xhlFNoPq2skrY33tEV7gS6j7ntgp3M4mbvygJPa5oMtqwRgDs4KYS2ZqtG7MIEBNwTNcmEgu3/kBHoggQsApKt/kwERPE2sAPRFfw6kOqJZCeFWyg2CgS3MpJigN0eyz+3oleTNX6xkkRvocePZV+yTwazdC7Eayv2u29r0mFI9XezR3/IdYiOSvfgiTFRCh0yuBj5RM5bYZMwOJotfb7BxMXjhHTBJ5bZqv9iiztKoJL/H2LW2m9gvSOePwrmX6bi2qhkUsDzO3sFrk8jdXCN3cwk9xepQ2VmCHW1PRpjl3vqUMJKKcw2PV88c/El8FSvXreYbK+XF5otHaF0lAb0YGA8xsrbkFvCoAQmTI7cTseUvH/c57FCb2Qkgp9Hjf6kapdw+D1UMv/Eos6etvDHrhdnb+ABpxqwQzS/6ltkr8RYb8kJ8xC1S3qX73iogpVUCxj2sIjguW8v8gCF3ll4mIG01we6hSMCBS6hPZHfpFIRoMr+6DtcxiRoOIZsHNsVI80+c3wxf0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6667.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MkxxQ0craVlvaWZvSE0zaStLSURDUStaVGJieDdldGNHbmo4R3lFSjc5ZVA0?=
 =?utf-8?B?amFJc3hiMWQ2RTFkU01KZXc1NnBQVXZVZjA3dTJaK0owaHR4cjkyY3J2NlBG?=
 =?utf-8?B?bkNjRFh0disybitoM0xVT2ROcnFSYUJ5Z2Y5RzErVjlpMGxWczdzc2JYcDUy?=
 =?utf-8?B?c281NU5mVUpHSlJZZmszTERYcExNNkN0NVFMWHBha1ZMQWdIQW9RMHJyUnFU?=
 =?utf-8?B?TXZha2NpbVJOandFQlArSDc5cWtFV1Y4WjA1TzlNV3Ntd2gyT2s2VkxSRlIz?=
 =?utf-8?B?c2hDNHNzdXVaS2hKNi9idFdZeDVsdnp6NVN4bmQ5dUsyY0YxcTRZL0E2UDNj?=
 =?utf-8?B?a1V2NHFKVXAzdTRKVmtzV1NrRzdyb2c3by9HRFJtanp1Um1zdkYxYmdzK2VP?=
 =?utf-8?B?Qk9XU01uT1pTcjhvUmdIVGl3WnhZVTJOUXBacTJyR2RBbWdQayt0UnRpa1Fl?=
 =?utf-8?B?OUF1TG9pajdtV2c2VlRSMnlrRzM1S3RQdGFYb1ZiMUhTNG1HRi9mTmpXNllY?=
 =?utf-8?B?SEVQYnJGNEh4Z3picE9QSlU2VmQzejl4d1dSaWVvTnlqK2lrWjNFRnlzZ0dP?=
 =?utf-8?B?K3c3RDhiUDladlBmSFpkNFdESjdQY0JneUZLWjlVT29vN2JSODR2VFpKcDR2?=
 =?utf-8?B?NEFIcnI1SEVhaThacmMyWk4vd2FiU2QzN3VHREVkTklzMThPZjliNGtzS0Ey?=
 =?utf-8?B?U0JBKzdqK1hyN21BWkpBVzZmWG5YN0QzeUNFYUNXMVRTZWtKZTU2Qjh6T29u?=
 =?utf-8?B?NXZhN0daU3BwT3c0cXlscjJUMkdVbXpWUnM1Y0NzcDJMMWRxc1ZQUThJUk4y?=
 =?utf-8?B?S0I1M0svT3B6T2ozb0FHYzFVa20wSEtwbWx4eWk4amRMNyt5TXplQWJTaGJ6?=
 =?utf-8?B?WDdiRjRsM1VIMjlPZmVGS09FNFlSRmU5aHQrSFBtZnhQYmRZNmdvS2xOTTR5?=
 =?utf-8?B?Z0kyTmd4U1Y4aWxXc0o0ZHFHVmZNQUxqMzQ3ZTVWZHhtajF4YURBSnhDanVU?=
 =?utf-8?B?anVFbWhCcFV3Nll5TzFSejdVVy8vUk9wMDdWTUJlakprSktNb3M1YnhRb1pk?=
 =?utf-8?B?dmE0cDZObG1YS2NRemJGN1hsYWtHci9WaisyUUZjbkhxWWlzWVdaVEhzSWky?=
 =?utf-8?B?SlRZUHprV2kyZkZ1R21FeDZzVmRSdU8wZWZyUVc2cXkzem5zdTdGemd2Vm9G?=
 =?utf-8?B?RDFMd0hJK2R6WkltMkdTcjNOU1ZkemhGNGYrOWJ6aU5HSmE3Y2t2WXpySWdL?=
 =?utf-8?B?dXNxeEpCQld4RndvSTkrd3MrM3duZGJmQWZWTG80WkVyVU5hNE5lcVRra3Nk?=
 =?utf-8?B?QVppKzVlNUtzU3FFYkdLUndtSFZPTzJmYTZsWmplaWRRUEVzemh1QnFEM25M?=
 =?utf-8?B?ZmxmZ051RUpYYlNLLzAwUnJQRm5RbnhzQ1V6Q2g3YU9TYkZyNy9OY3g1RzJs?=
 =?utf-8?B?SzgrNFloM1FhbWJMemsxTGxWU01wajEzc2RncmZ5QVUxeUFEbUluQk00NDBS?=
 =?utf-8?B?NnFyclZ6eVd4emxQUHU1Qy9MMnhvUkFtQjgxUDUvWitWcDEreTNWVFZyUnhj?=
 =?utf-8?B?U0F4M2M4eVhtd2djN25rWHhpa2ZTb1ZwVzV2VFFJWHF4VXdvbVRsc3dJcWRH?=
 =?utf-8?B?QmlkWWRzcEw5NEo1QUJCdlpkTWtZK0ZGN0pNd3hyQ3dlSmlYQmhqbDU1QW5R?=
 =?utf-8?B?QjloalFiNlE3QnJaVWJLOU90bEgxNmxNRERXSm8wYUJBZi9MbE01SEdqSlNV?=
 =?utf-8?B?UjY1ck9ZUUpUSTBHdjNrQXJNRjBZdG9JSFR6dS9wOWc4SEhVbFBQakI1VXNI?=
 =?utf-8?B?Z2RqV3ZvdU53RnhZdnlkQWFnM21YL1Y2eEo5ZmJpS1o2YmlxQ2ttOWpOLytu?=
 =?utf-8?B?NnYyR3EzemxxQktsQVVkSzV3T0NTZDdDek5QbjJacUVESWlzdjBUT3NzZXRn?=
 =?utf-8?B?TFM0V2Z3ZWtHMms5dFJyaS8rVGE2RmpJOFVrNTFrWVhMV0FEMjFDQjhSeFRC?=
 =?utf-8?B?SlF3d0puRVBJTlQyVjR0OXhrdDB0QmdRSnloNjc1TDYzRDNLMUd1QksvS1pC?=
 =?utf-8?B?N2pacEt0eitmTzV4TWhjd25jRmtZNkF3eHNQcWt1b3FXY25waWtMNC9SaFBP?=
 =?utf-8?B?TmMwekk1Q0dnUzE0Y2VkTXNGclpCUXVpOVdvaU9zaXpWd0lIYy82WHJGaHF6?=
 =?utf-8?B?NnFCYjAvTTQ3T1JVVkQrWCtWOGhtMnlvNCtMWGhDVnFmYnZYd2gyaDZRVk5B?=
 =?utf-8?B?MmdjdUdXVHIwSmRIRnVySkk5Q0xkRHZmaWpCRDhvWmI4cXM3bW8yc2dnV2ly?=
 =?utf-8?B?YU1xMWYwV2ZGLzlhOEhZL1NXU0hkc3RaUFd5MEJMWnVYTFhTWVN3Zml4dmdG?=
 =?utf-8?Q?Mxl8dGiqCC14wADI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B30D4AFBE9ECFA42948F9FB041E9CC68@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	bcYdvdQset13dxD1hs4C+nHHmsF94/SGnDvRtiYCiSzPn/cAW0xCrQw/fFZEPJhIAQov/uSHza3HWqawCQ+46UapSmpde+LhceEifuqE8wehdLLoLpXcTi7NJFMtC/jHFCeYxTvKQiWKJGwbN0KCL2jvDelGWRmEdG+2ZRVrZ3+300E5RmbHehHapIucZj2diyOFNtBYE4Qf8zYasuvV3YsHoU1vYQKMxvrpMAvzZTcvR+vndkitpNVuPKX0RWksA5mJERiO8Mm0XX56E5rC5c75F/0MhASulEg7DO2LRB0MtpshfKAnVKtgd0CnpPVSYFnvjU+4lqahZU223vL5Rg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3DjKUJl4RfZvz0ENyrl/cn3+caaDjmZdfsa8mb1I4Ph65VgYqmjfhby0U9uxVdIqjBP9uKFxbnM55z/ox9XR8gh1DCGw1Fj0BkPNC/mkjKDkT0Z9PkOY8EIc6JPYND8AaCLZmWyfdaVOqKftNHqDNg7UZO2rYSAhFLBVkUYLI+EeRtkvcrfbu7GtA6G4X/6oc37MUUEdrCrpOAyFwMZtEV16lhEkxFl/kv6sByIVpo5wb08RcjeopsYB5olm82TmZBOH7QHFcVl4KMXHR66A0uyukKsoVc5sUdM518TCphf+A/QAfQwzeXpw+BCGxQD+zSBSfl701ZBP9KFeB94szI8po0gSAbSCY43Tx4rM9V05z/tHTgJ9d3QFnSX3CM+8WEU6CiuW18hVWD9uubijW+Ulu/5MgAMd3SrrMPFA7qodOu7tQ7LYcBwrJoVTZZAMLyPHzr1AgLrV7FmdJKUUkoqRXLm9CC/KkCC0ZSvpnTr6USDdSTGLyRtj+JM2z5lebt9hkkMyHEZrVnfCNR9gMVMaGyBVCspSzE1lYVUXfJclMBW2RcdP3OGNE5iRqCAVgEesAIUaQzH3y7EGBq1SL7aTC8nQWrGrtkZAxDE8Xco=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6667.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57eb7521-3451-4e68-35af-08df1237ac72
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 08:10:43.4993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WA2haqsDe1B47sFPqxtfaZnZvbIsdjnZojwxQuB2c7AjW72xvHz/xtSMB39dk07lWXoCx2pDnxuy8QLCWQKX9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6702
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2609040000 definitions=main-2609140115
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDExMyBTYWx0ZWRfXwR3Q7qCbe58s
 u/B68O3RIND7OYgm3EuGBRJCOnFv8yBv1YHtJWIRlQK/J2mR2TejWTLQMXlnfXhrF701PQ46Knu
 DGFohosQs01A3B7HRnFliAx1XxMJKFtjw/B92MOsTu6p8oip4Ies
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDExMyBTYWx0ZWRfXxIAp9dyLO82s
 1AqZF6skyvVKkzv6FamUO44vNYFbIrqTb4hy5sjkSOF5Dr5HKVQn/OBDfCeDW5a5w8Uw/IkJDst
 Wx8tZyhwQH1wu2DI+vyiHlX09HjknaNb2xejk3kMW6k4u4wSEQvLhlud6R0XUxIsWl+w/dg2g4q
 nWO9c94RRH0Sq76O/ghfVBiK5yU8TuqTKHBKxiZeKQWRG4YHd9Exok28DwCTHziYDIj80TkvpqO
 ymqneHOnUZu6xuaZyLf1DQDj5m+GwOtljy+88olLx8P5lPALXFMvfKkXlZZbrwtLoVq+Fy3uAWs
 O2IUlNM/o79L28uB21HRm2XkRz789eiLmDBBiqbKhN24V3Z7Y+fUnrBzgnAz2UANzi+6wLf2h1K
 Smgmnl7W5PhQLp5qL2U9/AH5o5j02QD5YErWBuNlK1R9us9tCWndhoWn9IhZAPdd+KTC+mArKRq
 J+EzGsmBekHnxGXa0BA==
X-Proofpoint-GUID: flrkw6XYnXYsLCsYeDo6FC7axK7fZnu7
X-Authority-Analysis: v=2.4 cv=GIadgeNK c=1 sm=1 tr=0 ts=6aa7ac07 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=GoEa3M9JfhUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22
 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8 a=uCuCtW9DqfDpyQGqm_IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: flrkw6XYnXYsLCsYeDo6FC7axK7fZnu7

PiBPbiAxMCBTZXAgMjAyNiwgYXQgMTY6MTksIFdhaW1hbiBMb25nIDxsb25nbWFuQHJlZGhhdC5j
b20+IHdyb3RlOg0KPiANCj4gVGhlIG9zcV9sb2NrIGlzIHNwZWNpYWwgaW4gdGhlIHNlbnNlIHRo
YXQgbG9jayB0cmFuc2ZlciBmcm9tIG9uZSBDUFUgdG8NCj4gdGhlIG5leHQgY2FuIGhhcHBlbiBl
aXRoZXIgb3ZlciB0aGUgY29tbW9uIG9wdGltaXN0aWNfc3Bpbl9xdWV1ZS50YWlsDQo+IHZhbHVl
IHdpdGggdW5jb250ZW5kZWQgbG9jayBvciBvdmVyIGEgbG9jayB3YWl0ZXIncyBvd24gcGVyY3B1
DQo+IG9wdGltaXN0aWNfc3Bpbl9ub2RlLmxvY2tlZCBmbGFnIHdoZW4gdGhlIGxvY2sgaXMgY29u
dGVuZGVkLg0KPiANCj4gVG8gZW5zdXJlIHByb3BlciBsb2NrIHN5bmNocm9uaXphdGlvbiwgd2Ug
bmVlZCB0byBwcm92aWRlDQo+IHRoZSBhY3F1aXJlL3JlbGVhc2Ugc2VtYW50aWNzIGZvciB0aGUg
b3NxX2xvY2svb3NxX3VubG9jaygpDQo+IGZ1bmN0aW9ucyBpbiBib3RoIGNhc2VzLiBUaGlzIGlz
IGN1cnJlbnRseSB0aGUgY2FzZSBmb3IgdGhlDQo+IGNvbW1vbiBvcHRpbWlzdGljX3NwaW5fcXVl
dWUudGFpbCB2YWx1ZSwgYnV0IG5vdCBmb3IgdGhlIHBlcmNwdQ0KPiBvcHRpbWlzdGljX3NwaW5f
bm9kZS5sb2NrZWQgZmxhZyBhcyB0aGUgcHJvcGVyIGJhcnJpZXJzIGFyZSBtaXNzaW5nIGluDQo+
IHNvbWUgcGxhY2VzLiBGaXggdGhhdCBieSBhZGRpbmcgdGhlIG5lZWRlZCBiYXJyaWVycyBpbiB0
aG9zZSBwbGFjZXMuDQo+IA0KPiBOb3RlIHRoYXQgdGhlIHR3byBwZXJjcHUgb3B0aW1pc3RpY19z
cGluX25vZGUubG9ja2VkIHNldHRpbmcgaW4NCj4gb3NxX3VubG9jaygpIGFyZSBwcm9jZWVkZWQg
YnkgYSBmdWxsIGJhcnJpZXIgeGNoZygpIGNhbGwsIGJ1dCB0aGUNCg0Kcy9wcm9jZWVkZWQvcHJl
Y2VkZWQvDQoNCj4gY29udGVuZGVkIGNhY2hlbGluZXMgYXJlIGRpZmZlcmVudC4gVGhpcyBzaG91
bGQgcHJvYmFibHkgd29yayBpbiBtb3N0DQo+IGNhc2VzIGV4Y2VwdCBpbiBzb21lIGV4b3RpYyBh
cmNoaXRlY3R1cmVzIHdoZXJlIHRoZSBiYXJyaWVyIHNlbWFudGljcw0KPiBtYXkgYmUgY2FjaGVs
aW5lIHNwZWNpZmljLg0KDQpBcyBvZiB0b2RheSwgZG9lc24ndCBhdG9taWNfeGNoZygpIHByb3Zp
ZGUgZnVsbCBtZW1vcnkgYmFycmllcj8NCkZyb20gdGhlIGRvYzogIlJNVyBvcGVyYXRpb25zIHRo
YXQgaGF2ZSBhIHJldHVybiB2YWx1ZSBhcmUgZnVsbHkNCm9yZGVyZWQiLiBJIGFzc3VtZSB0aGlz
IGFwcGxpZXMgdG8gYm90aCB0aGUgaW50cmEtIGFuZCBpbnRlci0NCmNhY2hlbGluZSBjYXNlcy4N
Cg0KPiBOZXZlcnRoZWxlc3MgYSByZWxlYXNlIGJhcnJpZXIgaXMgc3RpbGwgYWRkZWQNCj4gZm9y
IHNhZmV0eSByZWFzb24gYXMgd2UgbWF5IG9wdCB0byByZWxheCB0aGUgeGNoZygpIGNhbGxzIGlu
IHRoZSBmdXR1cmUuDQo+IA0KPiBUaGUgIm5vZGUtPmxvY2tlZCIgcmVhZCBpbiBvc3FfbG9jaygp
IHdhcyByZWxheGVkIGJ5IGNvbW1pdCAwMzZjYzMwYzZiNmENCj4gKCJsb2NraW5nL29zcTogTm8g
bmVlZCBmb3IgbG9hZC9hY3F1aXJlIHdoZW4gYWNxdWlyZS1wb2xsaW5nIikgYSB3aGlsZQ0KPiBh
Z28gYXMgdGhlIHNtcF9sb2FkX2FjcXVpcmUoKSBsb29wIHdhcyBjYXVzaW5nIGEgcGVyZm9ybWFu
Y2UgaGl0IGR1ZSB0bw0KPiB0aGUgcmVwZWF0ZWQgYWNxdWlyZSBiYXJyaWVycyBpbiB0aGUgbG9v
cCBhbmQgaXQgYXJndWVkIHRoYXQgYW4gZWFybGllcg0KPiBhdG9taWNfeGNoZygpIGNhbGwgY291
bGQgcHJvdmlkZSB0aGUgbmVlZGVkIGJhcnJpZXIuIFRoYXQgbWF5IG5vdCBiZQ0KPiBlbm91Z2gg
ZXNwZWNpYWxseSBpZiB3ZSBoYXZlIHRvIGxvb3AgZm9yIGEgd2hpbGUgYmVmb3JlIHRoZSBsb2Nr
IGlzDQo+IHJlbGVhc2VkLiBOb3cgd2l0aCB0aGUgbmV3IHNtcF9jb25kX2xvYWRfYWNxdWlyZSgp
IGhlbHBlciwgb25seSBvbmUNCj4gYWNxdWlyZSBiYXJyaWVyIGlzIGFkZGVkIGF0IHRoZSBlbmQg
b2YgdGhlIGxvb3AuIFNvIGl0IHNob3VsZG4ndCBoYXZlDQo+IHRoZSBwZXJmb3JtYW5jZSBoaXQg
bm90ZWQgaW4gdGhhdCBjb21taXQuDQo+IA0KPiBDdXJyZW50bHkgb3NxX2xvY2sgaXMgdXNlZCBv
bmx5IGJ5IG11dGV4IGFuZCByd19zZW1hcGhvcmUgY29kZSBmb3IgcXVldWluZw0KPiBwdXJwb3Nl
LiBBcyBhIHJlc3VsdCwgdGhlIGltcGVyZmVjdCBsb2NrIHN5bmNocm9uaXphdGlvbiBzdXBwb3J0
IGRvZXMNCj4gbm90IGNhdXNlIGhhcm1mdWwgY29uc2VxdWVuY2UgYXMgdGhlIG5ldyBvc3FfbG9j
ayBvd25lciBvZiBhIGNvbnRlbmRlZA0KPiBvc3FfbG9jayB3aWxsIHN0aWxsIGhhdmUgdG8gd2Fp
dCBmb3IgdGhlIHJlYWwgbXV0ZXggYW5kIHJ3c2VtIGxvY2sgdG8NCj4gYmUgcmVsZWFzZWQgYnkg
dGhlIHBlcnZpb3VzIG9zcV9sb2NrIG93bmVyIGJlZm9yZSBpdCBjYW4gYWNxdWlyZSBpdCBhbmQN
Cg0Kcy9wZXJ2aW91cy9wcmV2aW91cy8NCg0KPiBnbyBpbnRvIGl0cyBjcml0aWNhbCBzZWN0aW9u
LiBGb3IgY29ycmVjdG5lc3MsIHdlIHN0aWxsIGhhdmUgdG8gZml4IGl0DQo+IGluIGNhc2UgaXQg
aXMgdXNlZCBlbHNld2hlcmUgd2hpY2ggZG9lc24ndCBoYXZlIHRoaXMgaW5oZXJlbnQgcHJvdGVj
dGlvbi4NCj4gDQo+IEZpeGVzOiAwMzZjYzMwYzZiNmEgKCJsb2NraW5nL29zcTogTm8gbmVlZCBm
b3IgbG9hZC9hY3F1aXJlIHdoZW4gYWNxdWlyZS1wb2xsaW5nIikNCj4gVGVzdGVkLWJ5OiBIw6Vr
b24gQnVnZ2UgPGhhYWtvbi5idWdnZUBvcmFjbGUuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBXYWlt
YW4gTG9uZyA8bG9uZ21hbkByZWRoYXQuY29tPg0KDQpXaXRoIHRoZSBuaXRzIGZpeGVkIGFuZCB0
aGUgbWVtb3J5IG9yZGVyaW5nIG9mIGF0b21pY194Y2hnKCkgY2xhcmlmaWVkLA0KDQpBY2tlZC1i
eTogSMOla29uIEJ1Z2dlIDxoYWFrb24uYnVnZ2VAb3JhY2xlLmNvbT4NCg0KDQpUaHhzLCBIw6Vr
b24NCg0KDQo+IC0tLQ0KPiAga2VybmVsL2xvY2tpbmcvb3NxX2xvY2suYyB8IDExICsrKysrKyst
LS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9sb2NraW5nL29zcV9sb2NrLmMgYi9rZXJuZWwvbG9j
a2luZy9vc3FfbG9jay5jDQo+IGluZGV4IGI0MjMzZGMyYzJiMC4uZWYxYmJkOTE0OTE3IDEwMDY0
NA0KPiAtLS0gYS9rZXJuZWwvbG9ja2luZy9vc3FfbG9jay5jDQo+ICsrKyBiL2tlcm5lbC9sb2Nr
aW5nL29zcV9sb2NrLmMNCj4gQEAgLTE0Myw3ICsxNDMsNyBAQCBib29sIG9zcV9sb2NrKHN0cnVj
dCBvcHRpbWlzdGljX3NwaW5fcXVldWUgKmxvY2spDQo+ICAJICogaXMgaW1wbGVtZW50ZWQgd2l0
aCBhIG1vbml0b3Itd2FpdC4gdmNwdV9pc19wcmVlbXB0ZWQoKSByZWxpZXMgb24NCj4gIAkgKiBw
b2xsaW5nLCBiZSBjYXJlZnVsLg0KPiAgCSAqLw0KPiAtCWlmIChzbXBfY29uZF9sb2FkX3JlbGF4
ZWQoJm5vZGUtPmxvY2tlZCwgVkFMIHx8IG5lZWRfcmVzY2hlZCgpIHx8DQo+ICsJaWYgKHNtcF9j
b25kX2xvYWRfYWNxdWlyZSgmbm9kZS0+bG9ja2VkLCBWQUwgfHwgbmVlZF9yZXNjaGVkKCkgfHwN
Cj4gIAkJCQkgIHZjcHVfaXNfcHJlZW1wdGVkKG5vZGVfY3B1KG5vZGUtPnByZXYpKSkpDQo+ICAJ
CXJldHVybiB0cnVlOw0KPiAgDQo+IEBAIC0yMjQsMTEgKzIyNCwxNCBAQCB2b2lkIG9zcV91bmxv
Y2soc3RydWN0IG9wdGltaXN0aWNfc3Bpbl9xdWV1ZSAqbG9jaykNCj4gIAlub2RlID0gdGhpc19j
cHVfcHRyKCZvc3Ffbm9kZSk7DQo+ICAJbmV4dCA9IHhjaGcoJm5vZGUtPm5leHQsIE5VTEwpOw0K
PiAgCWlmIChuZXh0KSB7DQo+IC0JCVdSSVRFX09OQ0UobmV4dC0+bG9ja2VkLCAxKTsNCj4gKwkJ
LyogUHJvdmlkZSByZWxlYXNlIGJhcnJpZXIgZm9yIHVubG9jayAqLw0KPiArCQlzbXBfc3RvcmVf
cmVsZWFzZSgmbmV4dC0+bG9ja2VkLCAxKTsNCj4gIAkJcmV0dXJuOw0KPiAgCX0NCj4gIA0KPiAg
CW5leHQgPSBvc3Ffd2FpdF9uZXh0KGxvY2ssIG5vZGUsIE9TUV9VTkxPQ0tFRF9WQUwpOw0KPiAt
CWlmIChuZXh0KQ0KPiAtCQlXUklURV9PTkNFKG5leHQtPmxvY2tlZCwgMSk7DQo+ICsJaWYgKG5l
eHQpIHsNCj4gKwkJLyogUHJvdmlkZSByZWxlYXNlIGJhcnJpZXIgZm9yIHVubG9jayAqLw0KPiAr
CQlzbXBfc3RvcmVfcmVsZWFzZSgmbmV4dC0+bG9ja2VkLCAxKTsNCj4gKwl9DQo+ICB9DQo+IC0t
IA0KPiAyLjU1LjANCj4gDQo=
