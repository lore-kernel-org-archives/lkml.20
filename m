Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20324A2070
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054266; cv=fail; b=NE7JWj7CiH2zYPesxQQUaHiko/wzEC/7beq5Eig8Rsf59UIBP9TTzG8XRaGMH7vM3n1v0Lj31UyXj2EWcSmGgF6qNjHNI+sDsiSrDxWlaPEvnPHfJhinuO9rJ9Dei5yEHMbfdrYX09hSAzgfC52azKKVfGbrB1Yc1V4tr46NMTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054266; c=relaxed/simple;
	bh=C3r5vOKrFAjWoS9oHrITqeybe4UXKuczDlOZQoPzqpg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KvsOAOJXdZTGwrqU02DnFYjw/XL80ZiIn0UBbxL+MhnQWCFiRb1e4nVjHZtsn/KJ+JxS8xGRnXITliZlyr3bF2Xz5OBsi7zhN5HIhhI1j5tfQMuTkHUMHYMWCp6QbjOv8CoEuMPs+dBids3ch+cObudVUATfgxwTi2ak2O0fL+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Fpo35JGk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YOnK/4N5; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Fpo35JGk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YOnK/4N5"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ADUV46432353;
	Thu, 10 Sep 2026 15:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=C3r5vOKrFAjWoS9oHrITqeybe4UXKuczDlOZQoPzqpg=; b=
	Fpo35JGkwYbRZvyvyO1nwL5BZcz2aNPuqjCrxGLOtEFYh0lg1u37Svu7UzsJqfuO
	zrbmgr4nyFahL8BQheI87f4hScIK2m0YilhOCAhCCHWsGAX5TNi4JslBhM5Jw9jT
	b81wetVfEDiHxia5imp0R5lOynkF90Lov/G0a/s5vs7giGUQdEtlBPH1eueFPR61
	gP6r+zwDRGR8O8Js5tZi3GWbufEpz4jsuETLHTg5u2Yc5InfOVJHGP/SdyWGpg3v
	QzaD4SJoos8SteZxCtWZQqTdf1CjkSCCAmv2U8fbKLzBAQe0eWz2Vaq7+1ailXCw
	npD5uxVixJ09ojdSQTKfnw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gkcyu9ftt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Sep 2026 15:30:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68AFUSve012518;
	Thu, 10 Sep 2026 15:30:42 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011008.outbound.protection.outlook.com [40.93.194.8])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4gkrjs6w7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Sep 2026 15:30:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQSBasejhyIJQ/0fa2pmBhHXBivBOwy45VQfQ/FNl+wBrPI3I9qfgEQQDToQTLmoutSuyuQjgY2UzafRrUMFdv0YEDYjFLd0PjiVLkM83nkib338BL9Cj5W1IV0M8Xj7mEkNhb37QouHHQgliI1CjFcOiXLLro/jo1wRRjt5PsqwhHnTvMcCNAhbxS+TqoO5AITbfruLlq+9/UVDXpzV+TeM2+M90fd8x+nzzX8QHQKmwSGkf2sqwjfY/VVK81ZRAJTBiyUo91CXWriCsb7b/WVTi7Ge2BXJG2XW4Y/vhR7t5vzBW2tEAb+Ctr6Ge2tvHwq7DuRAqlOt09t4zQEv0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3r5vOKrFAjWoS9oHrITqeybe4UXKuczDlOZQoPzqpg=;
 b=rFkXqg++yJquiZNYwWCugIXLptF+DTo7pfSpMMVJFoVsDEYAQ0a+3TPo553W++jDuIIGN9rnwSNStBMLesR35YVHZgTvhue0rRRKicxlAxh8ubRlXkrylc+jWaqzJNdFibgg1YFWeYk4umDIg81o6dfCQs0WxB85aDxNkoWzpIVyPfQaJ0Nc6ETcjHTQ0j9WIOOaUIPIlVsNwTtYsgnDC9Xvby9rAkeV0p/1VnVGyoFeNhk8Ao/r83Oq8t5XlWhdXTmhTupW8S3ItJ08CnEM8BeVw9MqfwbMrwKYQUA2FW3sHNbnJJ7yvQ5wVavA1+DQcY4NzYPcwFXICYqh5MEG1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3r5vOKrFAjWoS9oHrITqeybe4UXKuczDlOZQoPzqpg=;
 b=YOnK/4N5xQaprnmdJ1AiO3IJb5p7NKE+4OAHPL6fH/Cwix1ilwcGXJHBSN+24csEyrva5C/zM/uB/T/em3ktyAaouQTjMheJu1Yu6R2WD7CyclH3EXGDMKGN/7yRdjU1HzEawjdHA5oGCM9PHDbncPkPIkrzh5w3D8Ahj94AGi4=
Received: from SN7PR10MB6667.namprd10.prod.outlook.com (2603:10b6:806:299::7)
 by PH7PR10MB5855.namprd10.prod.outlook.com (2603:10b6:510:13f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 15:30:03 +0000
Received: from SN7PR10MB6667.namprd10.prod.outlook.com
 ([fe80::ff41:744:dd32:93f1]) by SN7PR10MB6667.namprd10.prod.outlook.com
 ([fe80::ff41:744:dd32:93f1%3]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 15:30:03 +0000
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
 AQHdPqg/HQaOn0CQxkmYQSZk6Ujl3bbDSOwAgAAV94CAAu71AIAAZGCAgAAFTICAAN1uAIAAFNwAgAAIoACAAAm6gIAAOPkA
Date: Thu, 10 Sep 2026 15:30:03 +0000
Message-ID: <E2131B35-DE77-41D3-85C7-521143FF94A5@oracle.com>
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
In-Reply-To: <20260910130557.74e1ae45@pumpkin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR10MB6667:EE_|PH7PR10MB5855:EE_
x-ms-office365-filtering-correlation-id: 7354963e-31c1-447a-420d-08df0f506265
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|38070700021|56012099006|10067099003|6133799003|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 ynTiL47lkJNUer9niAuAI7b0FJ1uSkovCxU4ecdE9gpOF9QfPqg8pKmJ35pgwcnBbTbyArCTK0LFJQR/1spl9zuR6TCI7v2WNIRrK3ZTKO047FLwzDoP4aAwT0RbmDr4VqHevQ9pJbMQ91uLDk7amudCdEUI/UTDR+PlV1BhWcgUTmRSAAF5f+13qcl9ixOs22NPux+NohGuJvY8Kfu+/D72L9/54fTyzKhP88+yzMil3kPTli7lSKwTvhI0PRUaSc+Yzdlii10XVicnmfXFNHoKOc99GB4mvXhyNCJTpwOTTYSUE67Y3mY4NCnbt+O5/wI7EKyoB1uPLsPONqbzRnGMwQcYZ4P0i0121iedthwoIMTeBMR+1A6/qYE/8FOdc9E21qz2N6KWSYl1xh+NSbGAnfYTT08jWszc1QhqSiFjVLrXJe3U9tGLxtxXowc7kh274VK5cSwwHOi2UB0qXJR33jio+IsChvVFWjefVTOWbPR2hkKwdd1I8nQ02uodmqeVca1faU2vd+BnhiODDFrGFYsli+RH1tYA5iBu+ZgZmwQfR3HrQDPUtABnwn6OB2HKSfbnDqZ/LP7JBplgxo7VR0Nnoiy5RGtQa3plRAFjXGNf8tFXWYJ0kAtTfSAc23NEfe6RC79rsmidsImqLz2GF2L8U9gsN7xSaZr/IDZCDoHav4QRZ43eHP8rwgDXRIJd99ldFTLM9sSYRp6au5PNHhewK6gse49hd+kix9k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6667.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(38070700021)(56012099006)(10067099003)(6133799003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WjZlU0JocE1DMWFUN3YyY0xudFhRYWtRV3VUTHgwVmlGcFdNNEFyQ2tQVG56?=
 =?utf-8?B?K1pPcTNqYzltemRpLzVmU2hpRG83VWRiYlJzOGhlTzhRYTU3TWwycVBNR3JB?=
 =?utf-8?B?MktJa2ovNVFWN0xPTVpURnVUbjd5MUhvbmJNM3AvREsrbE9HR2h1UnZIR21E?=
 =?utf-8?B?d2ZZS3gramtYRVdrRGswUHpZL3ZkNXlVd0Y5UHhJaC9LTnF0OTVqUWNoQVQ3?=
 =?utf-8?B?VjljVXRUanA3ZnFOUjdKSitOVVUwWjFVSUxaQ0QxR3JUa3ptTUtSWklPb1NB?=
 =?utf-8?B?bEFUUW5JY2tUU1VzUktEZklZL2ZjMlVycTJaMlp6WXd4L3ByYkRuMndwTG9O?=
 =?utf-8?B?OWxxWFlZUytYWXNNd1drbndYUXFvTnFJUEJXWFNqSHJhWFZiSkplekVWTFhw?=
 =?utf-8?B?SFQrNE1VZDN3YVJscUVmbzVjVElyeU42RElkMXRsUTNrUFgwdlpSQklvYmU3?=
 =?utf-8?B?TXZ1Z1JQQW5EcHdIdFd6aDFXTUVDTGtwM09kc0xiQlY5ZGpqcGU4Zlk3Z3dR?=
 =?utf-8?B?eU5YdEhvN25XWXlRV2UxZ2NRdVBYSXBVcWQ0K1JHQ1ordVB1UW96TjgwUDdT?=
 =?utf-8?B?dEFEa0pEcVR0TlhCQ3lxNzJFVFljRGE0WVBkc280RlYxMkFVQWNadGF4clVa?=
 =?utf-8?B?WE83dlRGUUZITDlZQnFNZFE0NDZoQVVZdDJQUEx3bUV3UlEvNm1jNHBaRDc5?=
 =?utf-8?B?dHlaeWQ0OUN2R0VZSkxKc3RnSk9ERyt3ZVdpMDJDTU80S3JDL0lzMU9xZHND?=
 =?utf-8?B?R2hSSjYranZiU3JJMFNmc2E4UHNmaTE5bUVJK1NEcU1aUDhJckxHWGxoeVdj?=
 =?utf-8?B?UnZaWDV5OGovb3ZtQjg0RGd3MWM5eDRFUHdIU1ZMaFl3bUpxR1JVU00ray94?=
 =?utf-8?B?WUZjZlpVd1ZiOW1xZy9kSzFvRjIxTlZTdzJYbEh4ZXZGOStTZmkxU0hVOTdz?=
 =?utf-8?B?UHErT3hJbUlmYW9lTTRGRnlpYTREUjBIek8xMWZyQW9mV1dKQ1lsME5NTkYy?=
 =?utf-8?B?L3pCTkNoaWpPTE1kdUVtTVQvVWsza3JUMXcvbENCclZ5S3M4Q1hWNHpNZEY1?=
 =?utf-8?B?am5ZT013OUVKRDBJK1ZDeU1DVVhYeE9Fd2lwRkxYTzlRY3ZXUFlJbzBtYVIr?=
 =?utf-8?B?eE5STTBGY0JQWUsvdVVVeGN5MWpYc2g0ZlRoTGhqd3c1aEFmRHNhUTh0NUl4?=
 =?utf-8?B?VUp6d0VSOUZUMEJaSkI1YlB4dXRuTUxGV2dLd3JXVGg4TVBIRG11RE1FN3hz?=
 =?utf-8?B?WFRoa01wOVBzdGlPV0VLYzdocDc3WDg1WTk3TklGdmdjMVBFU0tZRjFoeVFK?=
 =?utf-8?B?S1VoQlpCQ1h1Y0tERnpnbkR3OXBPT0dKK3FBNllqaEZIcEhWME5vTVZQUFlr?=
 =?utf-8?B?YmFiaUNXNHhjWnhObWN0ck9nbjI4WHZLVERQbGduY3AxWElrTHZNYmNhOHRK?=
 =?utf-8?B?am1hb1RDUGVYaDVlK3RaK0VFeTRvRUlHbkp0akFwZHl4UitNa1o5YzFmTnYr?=
 =?utf-8?B?ejlVM1dCTmsyWXlXMmEvK2RpRzVBTGxKUkNmL1ArQlRJTEROL1FEMVBVOTE4?=
 =?utf-8?B?RXMvRVRZdExvYVdMN0ViWVlRRFpUelNsazQwbXppSEVnSVRGV3JrUS9jUlVN?=
 =?utf-8?B?MjVGaEFxTWlKR1RrTy9hOGQ1QjFoK1kvRDBrc0xKQ21OQk55bmVFSHJOeEl4?=
 =?utf-8?B?SnIyU3A0VzRvd2plVlFEeldhVmMyMGc1OVFOSFprMDM4bFpUOStJTkh4Y3Zm?=
 =?utf-8?B?UkY3Zlo4b1R2eGw5Zkx4R203MHhTVmdJWmhtYTQxN3Jray9LWGNYaUd4Yzhl?=
 =?utf-8?B?RTBneko4QUtrQXcrMGJnaWVEOEVGcDVTV3JNdDEwTUdvQ3o0YnkwZ0l6SUdz?=
 =?utf-8?B?dDI5YWhKOGl0M0I2K0ZSb3RFZVpiNk0wMXdBQnJ2RHEvVCt1cG8xaFozNkZh?=
 =?utf-8?B?cGs0eVo4b3plcXZsb1dnSzRubUluSldxTjMxQm9TeU1vWHU3emJHK0tkUlVS?=
 =?utf-8?B?MS9vRllTckN2UWc3M3dnSjYrL3FseFRka3lLNy9MS0tmVU52bEpYNHpLWll5?=
 =?utf-8?B?cUdHb2N0NnJydzh2Tjc2M0dMQVkzYzgzR0hpYVFCa2xxbXltdmcrR1FUN1R1?=
 =?utf-8?B?aVQzZVNkUDNVWG1ZMmtzaXJ5ZVM4bzNBajBLT3MyQlJCR25RWEVSaEJxZDJQ?=
 =?utf-8?B?ajY2eVc0aFo0RDZvMitudlYzUnB3UU1Ta2VZQ25wc25uYkVEZXplSGFtVUpm?=
 =?utf-8?B?OVRrcXdxa0o5aVpTVHIzTGxqeEJadUsvbFhIYythUldOeEhic3JSVkJtZ0I3?=
 =?utf-8?B?QzNoMVJ6MGJZRGxBVzJIN0xPaWhMNEt5ZHo0a1hVUE0zWHljY25KV2JqRzJv?=
 =?utf-8?Q?LVEwHym9jYS2BgCo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <268E9E6897753A4EBF74D16AC8A30CD5@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	2HNhYx4LWjIh0L45QGeB2hQmkC8ulcnUrZpDdU5M0eypgtqSt+IONjvzd8LT4G2bnN36oBpvmsyIRY3KQm9h+q4r8iqvC+UDRr+FVb5CidpCFLZfSrpU2Q6DCMe6hxamweO9dNs+5Pbio/QuCRGUNVhjdX6M4wCStvs/kRgqltQ28YMpNTqawbGEroRo/co6ie4y7FxNMut2GLny5NH/JiHhfFU8eGBygdzK1fBN7ulmPKH7X6RVT2i+hjS53xI+KglQbRk/XB9lP2aJGLISS7WboGhcvMRMDioDInh6lN3uBnRp/GiRHYbYvpW2fFBukmg185Wo74xernCspnxLKg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	80Lk5v26ykO4+Ka/+uYpWa0B/36cuBJIHouKP8FhPoA7Bwt73lpDH4tLJfVdgtps4unJuSXj5yvXjbi+xDkFZCzDRWKkyhxNM0/anoQsDl6ZXHSGhXM7Q/RHyFRp2bWPOI2pZPlJFFZ8xoZ124C1ezWrwZNs59ALj0F0t3Acg+fmMRnjEy5ND+KZVzdExtmzDA4taEr3B/xtiku6WvK9wtEhiiLx0luppxlpLpWv9hjidpdOm8J1bTLVjeYUMysIR1h+dwiSOc+jES0nVa9wuBC4FCXRzD3slU2EaXI4BhRWeEUyCzymvQPAEm8jVgYpE32H+Z5Q9wGkXx6K87blAxmMKNBX0gNDkuXW61qY8lo4vOs5UJLl3kGEQZ0Rr4lXbLlf57UScVjqgemvtIAf481cZK2A9ySiGaYY8NJUtUQUnRRhxeFlReS/Y+Id4sEZgEzx6VTD2VlPjKR3MUgkad71Trg/gSoISyEktH1uX0zgJD6+YBKGJne8hYANwMMIYTrRrGbDllqKFnIzGQtMkmy9RC/eAhFUtMrlzBsNrE7DgUSfBDCY4rdz0JQE3y8F/wYSpVcsu5DZlWcFA7XZ81pJfYmFYGCh0v3lrgidfKQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6667.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7354963e-31c1-447a-420d-08df0f506265
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 15:30:03.2408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 29RGErPZD65bC6VpOVcKtzc09fEzq7UVGihrS+EAH+pwu1i6suGMLzCQ+RBFt717MZp5wNsJPZPGNsKFaNcCdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5855
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=928 mlxscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2609040000 definitions=main-2609100188
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4OCBTYWx0ZWRfXwJKCw5poUdqO
 aNcX5fiZ9H3kkpAJ1hVM2XP0HZw+ljClpMfvk+UY8bFXJFMIpw8g8vOch/CkIqKdcQK4ftNULl5
 1I7wAOEt+NyTsGDtOuWa8xL9WZ8N47Nqg91AzTQHgWDrQqkthZhdHLl0n2k6JLy4gLgTRUbojK9
 kKiC0tGdlbp2lCONGWue+te82Hd6eGkWBPO/1GPr3AC+UaIol/uWa06rMtTEBrYEKFtVAsoBKP7
 PsFLSb/bunosynqn+vANNckepoUg2D3P11s1OSyifBl7dUb9Y5coQAiupzccqtsUEwvA2lCgqcj
 knSclVwa2FCVYXQ+tcZIa8r5qGQ+vudYS8Sf++pzZf4MJZm9WF6myFMHOMI9dzVwsl6wu0qD5em
 2058omL1qp2aDvF+RE9KJqhC9cI7AzWjhirptiEBRww7jBhz2XFUT+bWCUSljONlEl1u2Xdzy6P
 6gG1m6oID4f3D95F67dWpoZiezsxPw1SHpVdqH7g=
X-Proofpoint-GUID: DCsbXiVEU3aV5J0qua9_4tYnpo0ad4-m
X-Proofpoint-ORIG-GUID: DCsbXiVEU3aV5J0qua9_4tYnpo0ad4-m
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4OCBTYWx0ZWRfX2ap5DpA8g+dk
 Ta0IsL2oTnXOtw9oTjUF0UpHbW8JKZICb4NGNxxR2v1EDHT6XVsipcVpsXBMBqJnFl7DgmtvQSm
 pdu55C5d8PxQRwVDQybXMV4/7t/HKk32q7FB9Gvsn6bXM2JetVCk
X-Authority-Analysis: v=2.4 cv=GPSdgeNK c=1 sm=1 tr=0 ts=6aa2cd24 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=GoEa3M9JfhUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22
 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8 a=20KFwNOVAAAA:8 a=nIT077ooXZYyrVLPOj8A:9
 a=QEXdDO2ut3YA:10 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf
 awl=host:12106

DQoNCj4gT24gMTAgU2VwIDIwMjYsIGF0IDE0OjA1LCBEYXZpZCBMYWlnaHQgPGRhdmlkLmxhaWdo
dC5saW51eEBnbWFpbC5jb20+IHdyb3RlOg0KPiBPbiBUaHUsIDEwIFNlcCAyMDI2IDExOjMxOjE5
ICswMDAwDQo+IEhhYWtvbiBCdWdnZSA8aGFha29uLmJ1Z2dlQG9yYWNsZS5jb20+IHdyb3RlOg0K
PiANCj4gPiA+IE9uIFRodSwgMTAgU2VwIDIwMjYgMDk6NDU6NDcgKzAwMDANCj4gPiA+IEhhYWtv
biBCdWdnZSA8aGFha29uLmJ1Z2dlQG9yYWNsZS5jb20+IHdyb3RlOg0KPiA+ID4gDQo+ID4gPiA+
ID4gT24gOSBTZXAgMjAyNiwgYXQgMjI6MzMsIFdhaW1hbiBMb25nIDxsb25nbWFuQHJlZGhhdC5j
b20+IHdyb3RlOiANCj4gPiA+ID4gDQo+ID4gPiA+IFtzbmlwXQ0KPiA+ID4gPiANCj4gPiA+ID4g
PiA+IENvdWxkIHlvdSBtYWtlIHRoYXQgY2hhbmdlIHRvIHRoZSBleGlzdGluZyBjb2RlIGFuZCBy
ZXJ1biB0aGUgdGVzdCANCj4gPiA+ID4gPiA+IGFnYWluIG9uIGFybTY0IHRvIHNlZSBpZiBpdCBj
YW4gcGFzcz8gDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gb3NxX2xvY2svdW5sb2NrKCkgaXMgc3Bl
Y2lhbCBpbiB0aGUgc2Vuc2UgdGhhdCBsb2NrIHRyYW5zZmVyIGNhbiBoYXBwZW4gDQo+ID4gPiA+
ID4gZWl0aGVyIGluIHRoZSBsb2NrIGNhY2hlbGluZSBvciB0aGUgbm9kZS0+bG9ja2VkIGNhY2hl
bGluZS4gVHJ5IHRoZSANCj4gPiA+ID4gPiBwYXRjaCBiZWxvdyB0byBzZWUgaWYgaXQgaGVscHMg
dG8gcGFzcyB0aGUgdGVzdC4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBUaGFua3MsDQo+ID4gPiA+
ID4gTG9uZ21hbg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9rZXJuZWwvbG9j
a2luZy9vc3FfbG9jay5jIGIva2VybmVsL2xvY2tpbmcvb3NxX2xvY2suYw0KPiA+ID4gPiA+IGlu
ZGV4IGI0MjMzZGMyYzJiMC4uNTFjZWNmMjk3NjkyIDEwMDY0NA0KPiA+ID4gPiA+IC0tLSBhL2tl
cm5lbC9sb2NraW5nL29zcV9sb2NrLmMNCj4gPiA+ID4gPiArKysgYi9rZXJuZWwvbG9ja2luZy9v
c3FfbG9jay5jDQo+ID4gPiA+ID4gQEAgLTE0Myw3ICsxNDMsNyBAQCBib29sIG9zcV9sb2NrKHN0
cnVjdCBvcHRpbWlzdGljX3NwaW5fcXVldWUgKmxvY2spDQo+ID4gPiA+ID4gKiBpcyBpbXBsZW1l
bnRlZCB3aXRoIGEgbW9uaXRvci13YWl0LiB2Y3B1X2lzX3ByZWVtcHRlZCgpIA0KPiA+ID4gPiA+
IHJlbGllcyBvbg0KPiA+ID4gPiA+ICogcG9sbGluZywgYmUgY2FyZWZ1bC4NCj4gPiA+ID4gPiAq
Lw0KPiA+ID4gPiA+IC0gaWYgKHNtcF9jb25kX2xvYWRfcmVsYXhlZCgmbm9kZS0+bG9ja2VkLCBW
QUwgfHwgbmVlZF9yZXNjaGVkKCkgfHwNCj4gPiA+ID4gPiArIGlmIChzbXBfY29uZF9sb2FkX2Fj
cXVpcmUoJm5vZGUtPmxvY2tlZCwgVkFMIHx8IG5lZWRfcmVzY2hlZCgpIHx8DQo+ID4gPiA+ID4g
dmNwdV9pc19wcmVlbXB0ZWQobm9kZV9jcHUobm9kZS0+cHJldikpKSkNCj4gPiA+ID4gPiByZXR1
cm4gdHJ1ZTsNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBAQCAtMjI0LDExICsyMjQsMTEgQEAgdm9p
ZCBvc3FfdW5sb2NrKHN0cnVjdCBvcHRpbWlzdGljX3NwaW5fcXVldWUgKmxvY2spDQo+ID4gPiA+
ID4gbm9kZSA9IHRoaXNfY3B1X3B0cigmb3NxX25vZGUpOw0KPiA+ID4gPiA+IG5leHQgPSB4Y2hn
KCZub2RlLT5uZXh0LCBOVUxMKTsNCj4gPiA+ID4gPiBpZiAobmV4dCkgew0KPiA+ID4gPiA+IC0g
V1JJVEVfT05DRShuZXh0LT5sb2NrZWQsIDEpOw0KPiA+ID4gPiA+ICsgc21wX3N0b3JlX3JlbGVh
c2UoJm5leHQtPmxvY2tlZCwgMSk7DQo+ID4gPiA+ID4gcmV0dXJuOw0KPiA+ID4gPiA+IH0NCj4g
PiA+ID4gPiANCj4gPiA+ID4gPiBuZXh0ID0gb3NxX3dhaXRfbmV4dChsb2NrLCBub2RlLCBPU1Ff
VU5MT0NLRURfVkFMKTsNCj4gPiA+ID4gPiBpZiAobmV4dCkNCj4gPiA+ID4gPiAtIFdSSVRFX09O
Q0UobmV4dC0+bG9ja2VkLCAxKTsNCj4gPiA+ID4gPiArIHNtcF9zdG9yZV9yZWxlYXNlKCZuZXh0
LT5sb2NrZWQsIDEpOw0KPiA+ID4gPiA+IH0gDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGUgdGVzdCBw
YXNzZXMgd2l0aCB0aGUgYWJvdmUgcGF0Y2g6IA0KPiA+IA0KPiA+IENvbmZpcm1pbmcgdGhhdCBh
IG11Y2ggbW9yZSB0aG9yb3VnaCB0ZXN0IChwZXJtdXRhdGluZyB0aGUgdGVzdCBhcnJheQ0KPiA+
IHNpemUgYW5kIHBhZGRpbmcpIHBhc3NlZC4NCj4gPiANCj4gPiBXaGF0IGNvbmNlcm5zIG1lIGlz
IHRoYXQgSSBhbSB1bmFibGUgdG8gb2JzZXJ2ZSB0aGlzIGJ1ZyB0ZXN0aW5nDQo+ID4gbXV0ZXhl
cyBvciByd2xvY2tzLg0KPiANCj4gVGhlIGV4cGxpY2l0IHRlc3Qgd2lsbCBiZSBhIGxvdCBtb3Jl
IGFnZ3Jlc3NpdmUuDQo+IEVzcGVjaWFsbHkgaWYgdGhlIGxvY2sgaG9sZCB0aW1lIG1hdHRlcnMu
DQoNClRoZSBhbGdvcml0aG0gaXMgdGhlIHNhbWUgZm9yIGFsbCBsb2NrIHR5cGVzLiBvc3FfbG9j
ayBmYWlsZWQsIHdoZXJlYXMgbXV0ZXgNCmFuZCByd2xvY2ssIGJhc2VkIG9uIG9zcV9sb2NrLCBw
YXNzZXMuIFdlaXJkLg0KDQo+ID4gPiBEbyB5b3Uga25vdyB3aGljaCBwYXJ0IG1hdHRlcnM/IA0K
PiA+IA0KPiA+IE5vLCBidXQgbm93IHRoYXQgSSBhbSBhYmxlIHRvIHRlc3QgdGhlIE9TUSBsb2Nr
cyBhcyBhIG1vZHVsZSwgSSdsbA0KPiA+IHF1aWNrbHkgZmluZCBvdXQuDQoNCk9ubHkgdGhlIGZp
cnN0IGh1bmsgaXMgYWxsZWdlZGx5IHJlcXVpcmVkOg0KDQpAQCAtMTQzLDcgKzE0Myw3IEBAIGJv
b2wgb3NxX2xvY2soc3RydWN0IG9wdGltaXN0aWNfc3Bpbl9xdWV1ZSAqbG9jaykNCiAgICAgICAg
ICogaXMgaW1wbGVtZW50ZWQgd2l0aCBhIG1vbml0b3Itd2FpdC4gdmNwdV9pc19wcmVlbXB0ZWQo
KSByZWxpZXMgb24NCiAgICAgICAgICogcG9sbGluZywgYmUgY2FyZWZ1bC4NCiAgICAgICAgICov
DQotICAgICAgIGlmIChzbXBfY29uZF9sb2FkX3JlbGF4ZWQoJm5vZGUtPmxvY2tlZCwgVkFMIHx8
IG5lZWRfcmVzY2hlZCgpIHx8DQorICAgICAgIGlmIChzbXBfY29uZF9sb2FkX2FjcXVpcmUoJm5v
ZGUtPmxvY2tlZCwgVkFMIHx8IG5lZWRfcmVzY2hlZCgpIHx8DQoJICAgIHZjcHVfaXNfcHJlZW1w
dGVkKG5vZGVfY3B1KG5vZGUtPnByZXYpKSkpDQogICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7
DQoNCkkgc2F5IGFsbGVnZWRseSBiZWNhdXNlIGEgcGFzc2luZyB0ZXN0IGRvZXNuJ3QgcHJvdmUg
YW55dGhpbmcsIGl0IGp1c3QNCmdpdmVzIGEgZ29vZCBpbmRpY2F0aW9uIHRoYXQgaXQgaXMgd29y
a2luZy4NCg0KPiBUaGF0IGFsc28gbWVhbnMgeW91IGNhbiBxdWlja2x5IGNoZWNrIHdoaWNoIF9h
Y3F1aXJlL19yZWxlYXNlIGFyZSBkZWZpbml0ZWx5DQo+IHJlcXVpcmVkLg0KDQpJIGRpZCBpdCBp
biBhbm90aGVyIHdheS4gSSBqdXN0IGFkZGVkIGFuICJhdG9taWNfeGNoZyIgdGVzdCB0byBteQ0K
bXV0dWFsIGV4Y2x1c2lvbiBmcmFtZXdvcmsuDQoNCkxvY2sgYWNxdWlyZToNCiAgICAgICAgICAg
ICAgICB3aGlsZSAoYXRvbWljX3hjaGdfYWNxdWlyZSgmZWwtPm14X2F0b21pY194Y2hnLmxvY2ss
IDEpICE9IDApDQogICAgICAgICAgICAgICAgICAgICAgICBjcHVfcmVsYXgoKTsNCg0KTG9jayBy
ZWxlYXNlOg0KICAgICAgICAgICAgICAgIGF0b21pY19zZXRfcmVsZWFzZSgmZWwtPm14X2F0b21p
Y194Y2hnLmxvY2ssIDApOw0KDQpUaGlzIHBhc3Nlcy4gSXQgYWxzbyAob2J2aW91c2x5KSBwYXNz
ZXMgd2l0aCBhdG9taWNfeGNoZygpIGluIHRoZSBsb2NrDQphY3F1aXJlLiBCdXQgdGhlIF9yZWxl
YXNlIF9pc18gcmVxdWlyZWQgaW4gdGhlIGxvY2sgcmVsZWFzZS4NCg0KPiBJJ20gcHJldHR5IHN1
cmUgdGhhdCAod2l0aCBteSBwYXRjaGVzKSB0aGUgaW5pdGlhbCB4Y2hnKCkgYXQgdGhlIHRvcCBv
Zg0KPiBvc3FfbG9jaygpIG9ubHkgbmVlZHMgX2FjcXVpcmUgKF9yZWxlYXNlIHdhcyBhZGRlZCB0
byBwdWJsaXNoIG5vZGUtPmNwdSkuDQo+IEJ1dCBJIHRoaW5rIGl0IGRvZXNuJ3QgZXZlbiBuZWVk
IF9hY3F1aXJlLg0KDQphdG9taWNfeGNoZ19hY3F1aXJlKCkgcmVsYXhlcyBvcmRlcmluZyBhcyBj
b21wYXJlZCB0bw0KYXRvbWljX3hjaGcoKS4gU28sIGF0b21pY194Y2hnX2FjcXVpcmUoKSBpbiB0
aGUgdG9wIG9mIG9zcV9sb2NrKCkgYW5kDQphdG9taWNfdHJ5X2NtcHhjaGdfcmVsZWFzZSgpIGlu
IG9zcV91bmxvY2soKSBtYWtlcyBzZW5zZSB0byBtZS4NCg0KPiBvc3FfbG9jaygpIGl0c2VsZiBy
ZWxpZXMgb24gYSBkYXRhIGRlcGVuZGVuY3kuDQo+IEFueSBjb25jdXJyZW50IG9zcV9sb2NrKCkg
cmVsaWVzIG9uIHRoZSBzbXBfd21wKCkgYSBiaXQgZnVydGhlciBkb3duDQo+IChJIHRoaW5rIHRo
YXQgY291bGQgYmUgYSBzdG9yZV9yZWxlYXNlKS4NCj4gDQo+ID4gDQo+ID4gPiA+ICMgZG1lc2d8
Z3JlcCBteA0KPiA+ID4gPiBbIDcuMDEwNTAyXSBteF90ZXN0OiBvc3FfbG9jayBwYWRkaW5nOiA4
IHJlc3VsdDogU1VDQ0VTUyBzdW06IDAgZWxlbWVudHM6IDEwMDAgZWxhcHNlZDogNS4wMDAgc2Vj
b25kcw0KPiA+ID4gPiBbIDEyLjAxNDE0NF0gbXhfdGVzdDogb3NxX2xvY2sgcGFkZGluZzogMTYg
cmVzdWx0OiBTVUNDRVNTIHN1bTogMCBlbGVtZW50czogMTAwMCBlbGFwc2VkOiA1LjAwNCBzZWNv
bmRzDQo+ID4gPiA+IFsgMTcuMDE3NTcyXSBteF90ZXN0OiBvc3FfbG9jayBwYWRkaW5nOiAyNCBy
ZXN1bHQ6IFNVQ0NFU1Mgc3VtOiAwIGVsZW1lbnRzOiAxMDAwIGVsYXBzZWQ6IDUuMDA0IHNlY29u
ZHMNCj4gPiA+ID4gWyAyMi4wMTk2MzZdIG14X3Rlc3Q6IG9zcV9sb2NrIHBhZGRpbmc6IDMyIHJl
c3VsdDogU1VDQ0VTUyBzdW06IDAgZWxlbWVudHM6IDEwMDAgZWxhcHNlZDogNS4wMDQgc2Vjb25k
cw0KPiA+ID4gPiBbIDI3LjAyMjE5Ml0gbXhfdGVzdDogb3NxX2xvY2sgcGFkZGluZzogNDAgcmVz
dWx0OiBTVUNDRVNTIHN1bTogMCBlbGVtZW50czogMTAwMCBlbGFwc2VkOiA1LjAwMCBzZWNvbmRz
DQo+ID4gPiA+IFsgMzIuMDI0OTA3XSBteF90ZXN0OiBvc3FfbG9jayBwYWRkaW5nOiA0OCByZXN1
bHQ6IFNVQ0NFU1Mgc3VtOiAwIGVsZW1lbnRzOiAxMDAwIGVsYXBzZWQ6IDUuMDA0IHNlY29uZHMN
Cj4gPiA+ID4gWyAzNy4wMjYwMzVdIG14X3Rlc3Q6IG9zcV9sb2NrIHBhZGRpbmc6IDU2IHJlc3Vs
dDogU1VDQ0VTUyBzdW06IDAgZWxlbWVudHM6IDEwMDAgZWxhcHNlZDogNS4wMDAgc2Vjb25kcw0K
PiA+ID4gPiANCj4gPiA+ID4gSSdsbCB1c2UgRGF2aWQncyBhZHZpc2UgYWJvdXQgaW5jbHVkaW5n
IHRoZSBvc3FfbG9jayBjb2RlIGluIG15IHRlc3QsDQo+ID4gPiA+IHNvIEkgY2FuIHRlc3QgaXQg
YXMgYSBtb2R1bGUsIHdoaWNoIHdpbGwgYmUgbW9yZSB0aG9yb3VnaC4gDQo+ID4gPiANCj4gPiA+
IEF0IGxlYXN0IHdpdGggYSBidWlsZC9ydW4gb3B0aW9uLi4uIA0KPiA+IA0KPiA+IFllcywgSSds
bCBzZW5kIGEgdjIgb2YgbXkgbXhfdGVzdCBpbmNsdWRpbmcgT1NRIGxvY2tzIGJvdGggYXMNCj4g
PiBjb21waWxlZC1pbiBhbmQgYXMgYSBtb2R1bGUuIEZvciB0aGUgbGF0dGVyLCBJIGp1c3QgZGlk
Og0KPiA+IA0KPiA+ICNpbmNsdWRlICJvc3FfbG9jay5jIg0KPiANCj4gSSB0cmllZCB0byByZW5h
bWUgZXZlcnl0aGluZyBqdXN0IHRvIGJlIGNlcnRhaW4gdGhlIGNvcnJlY3QgZnVuY3Rpb25zDQo+
IGFyZSBjYWxsZWQuDQoNCkkgcHV0IGluIGEgV0FSTl9PTl9PTkNFKCkgYW5kIGl0IGZpcmVkIDot
KQ0KDQo+ID4gPiA+IElmIHlvdSBzdWJtaXQgdGhpcyBwYXRjaCwgZmVlbCBmcmVlIHRvIGFkZDog
DQo+ID4gPiANCj4gPiA+IEknbGwgcm9sbCBpdCBpbnRvIG15IHBhdGNoZXMgKGFzIDEvbikuIA0K
PiA+IA0KPiA+IEJlIGF3YXJlIHRoYXQgV2FpbWFuJ3MgcGF0Y2ggZGlkIG5vdCBhcHBseSBvbiB0
aGUgdG9wIG9mIHlvdXIgc2VyaWVzLA0KPiA+IHNvIHRoZSB0ZXN0aW5nIGlzIHNvbGVseSB2Ny4z
LXJjMiBwbHVzIFdhaW1hbidzIHBhdGNoLg0KPiANCj4gVGhlIGVxdWl2YWxlbnQgY2hhbmdlcyBz
aG91bGQgYmUgb2J2aW91cy4NCj4gTm90ZSB0aGF0IEkgbWVyZ2VkIHRoZSB1bmxvY2sgYW5kIGxv
Y2stZmFpbCBwYXRocy4NCg0KSSBsaWtlIHRvIGNoYW5nZSBvbmUgdGhpbmcgYXQgYSB0aW1lLiBG
WUksIEkgYW0gdW5hYmxlIHRvIHdvcmsgb24gdGhpcw0KdW50aWwgTW9uZGF5LiBJJ2xsIHJlLWFw
cGx5IHlvdXIgc2VyaWVzIGFuZCBXYWltYW4ncyBmaXJzdCBodW5rIGFuZA0KcmUtdGVzdC4NCg0K
DQpUaHhzLCBIw6Vrb24NCg0KDQo=
