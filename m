Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F06B45D906
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039905; cv=fail; b=rEmJISzBKmPrbDg6b3HVZ+t5vme5d9UqyIGMwXzUw4cnQOoyPZKtjK81N+YWtptp6nqkaaK1Q0YeDsotGzGkbT7eLHt79N91tP7DwvmlcFUqHruKAnbXkQ9DEj7OZnQ3scNW2ITyXmy+do+0BkPBtTdUTE/sjVNrGmBI28w2Ftg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039905; c=relaxed/simple;
	bh=7fK41hmR+c9iVf68toa53LMXbdvuzHM8RYlHQNCaJAc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i7Cw0f4cNBF+vf1FC0ObAaPt1Af3tVbDyAoXTPW2ERyaOEUu35V4PJinvrBDvLkzhHn1T+b9d6LbOfA1tIW7fBpdH+J3fksH9kMZrdyjzP4HUV5ZFXtu0i7pK0ul+DOOnKyU7sNQH1YLz9szar4pD338jriCKhJwVFtxurnPLJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LVHFYzji; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=quN90W/X; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LVHFYzji";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="quN90W/X"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689KTF1s2950180;
	Thu, 10 Sep 2026 11:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=7fK41hmR+c9iVf68toa53LMXbdvuzHM8RYlHQNCaJAc=; b=
	LVHFYzjiH6WSGXMJYt3Xf4IIv+9bEEzHpOfDVBT7iKkeMoJunYf5JnB1vHO9ncmo
	OiLj5BGX0GcRarbYZji1G4nBDaSx/7Ip9znSQhATZrj26cceDJhRDfaT1OvVuyOM
	0PVC2Iy3zmnfkY8JQnDRQzAbYN+B59/1xCQowu2REKHENt09nW6eqr5SxYccxvsy
	Xx9qxKi7qZYs2KASd9ZgAJL2Py478HstkGYni1rs6Y0Hx0OW51HmzVpqrmOnR6I2
	PbjPy9kYz67vyI+ExEetOvhvfnan5VwNsgd8eUNI1b726CAjTsPHeglN4MaWSKxR
	ZyYsoWtgqa48vMdYKPch5A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gkcys11xr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Sep 2026 11:31:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68ABU3Bw018120;
	Thu, 10 Sep 2026 11:31:26 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010021.outbound.protection.outlook.com [40.93.198.21])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gkck84y8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Sep 2026 11:31:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAtX15tBMZrCBuQ1CUnMROZNWbPxrg7TcJXQs7z7+eebyZMjzriP0vv5RnEgsMYVpy0+CNAogEuDDu085wnoV5CWIvS5gOj9YJ82OOCTxOsgNVFaw+gJyNTuvJHvW2PI3I2Ovuqhnb/YTU1O9iSSipGY34gAmQzdhaZOtaV01K3Q6Sm/c6MYzFhv0fAmnVAqJCGIPR68yn6fJkSWDiIEPY7ayJ6HlhZgZbYTLcnMqVuMdOLh5e1K1016D+Y9llUufTlGAXqlnIdOcewPDz78eVgk/O3uJ6Up3p0Hib81TKkwpWDwKwZ6SBz/nw6/f79//Fvvq7D2ZYZ9hcmkJEU+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fK41hmR+c9iVf68toa53LMXbdvuzHM8RYlHQNCaJAc=;
 b=tVXtilc3VKdlSm8tKrSsOiX1AEatwlqE1GRmxiZ6TydW06qxWY3rIQHijETKGdlnmaA+0OttAnAkrwz3AbAv7olaaQk89rOclkB1xCo7VD3oXjjaE5RWoOcpapynekg3LKM+k8M6O4O7JPFhcI+TGWKyWy8NMWkdzueyhQyIuJ7yCPz3470/aGngl6QMBM6KKwFx735/EluwMrIF2MzF6DpfA+6Cak5aU6h2VCKns7bzvnR4zIzA+mHRa/t+pBVXRhS6oVznAIzepUXM/gDbFVLk5RK6+q0cA5UeLgantYsvtXAZCw5X+3tBlp+ro4n0yKXToyIdRQvzfbOhgVFwkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fK41hmR+c9iVf68toa53LMXbdvuzHM8RYlHQNCaJAc=;
 b=quN90W/XwvAfBgQmkwxaJ7T2Wxe8gWI+D4CVqs8A+c5M1zvF5IouFD5x1HX+VYMTJexc2qBzAIqvsDshN0uI34E/8z4vALhv09Ts0GJ8paKrYtFCyY7JV4P5iYx+07TFDCrrfM3oOPJfu68a/BxLf07LC5ppzBtfzRsUsVBYSGE=
Received: from SN7PR10MB6667.namprd10.prod.outlook.com (2603:10b6:806:299::7)
 by IA4PR10MB8448.namprd10.prod.outlook.com (2603:10b6:208:560::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 11:31:19 +0000
Received: from SN7PR10MB6667.namprd10.prod.outlook.com
 ([fe80::ff41:744:dd32:93f1]) by SN7PR10MB6667.namprd10.prod.outlook.com
 ([fe80::ff41:744:dd32:93f1%3]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 11:31:19 +0000
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
 AQHdPqg/HQaOn0CQxkmYQSZk6Ujl3bbDSOwAgAAV94CAAu71AIAAZGCAgAAFTICAAN1uAIAAFNwAgAAIoAA=
Date: Thu, 10 Sep 2026 11:31:19 +0000
Message-ID: <C81B298B-E8FF-4F96-8216-CFC21D167EC8@oracle.com>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
 <CAHk-=wget=mgjpkPJ+3-tueqo7AK1m4MR_Jqht6bj3-w+FhQHg@mail.gmail.com>
 <20260907182705.54585f73@pumpkin>
 <89F7CD08-2BDD-424D-AA2F-77D72647D93E@oracle.com>
 <44bdfc4b-4729-4dc3-b7b0-53c671c5ee34@redhat.com>
 <dd6a7873-7d23-42e2-adbd-b59c43141d96@redhat.com>
 <0ADD6DCD-6EF1-469D-ACB8-EC7D6A94CC2F@oracle.com>
 <20260910120016.04ba8ae1@pumpkin>
In-Reply-To: <20260910120016.04ba8ae1@pumpkin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR10MB6667:EE_|IA4PR10MB8448:EE_
x-ms-office365-filtering-correlation-id: d382b7cc-0c6e-4ae4-5f6f-08df0f2f08af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|22082099003|18002099003|38070700021|4143699003|56012099006|10067099003;
x-microsoft-antispam-message-info:
 cxuol2SxPTewX1GdqWZSV5iT2Y4yHHztJaFrKdzKOwfdCARQaKijPAKdVNT2hoDU+mManHOuZWz8LVg0spNt5lB7wlc8pEwFNoFf/yx+4vZX7zmra+BVhhnvb9Oz8l3g09Bci6XDXDRwKFHG3j2BpDNh2H7TJwWlv7XvWzKxAWPZTcP5uV3v+5BQ1T9UYHJyCgeZtH5HgwNMYsvijc3KkqOExuKp8Ey1uKfzKwtGf109wMAqX+mtbUnmG4p1f728+sQJedIxu2q7wNSZMH/T7rIXwz9HmnL403vUXLhWUWDGvk8ncA1gSeHJZSsJmnGAZAtnYstiU/uTY7TBmrxEHqOqG1jhg/vJbiIdLrxHtBy/zSDI0r/ZDe1mAYTPuVSfQan6WiOL32IRniYstNBPMEU9jDOUZkYklkyW5SSJfahfpFGVdnkuS8MyDWGz7BYUxc/nVwJAunry4Jxpr+5xL08fgmT5YvcULl46LdfPDmK/L1wwDHN002+pqIxzmhIfRbMpbn3PHyUH00LmbNrRh4NdE2pvqnKC3q9fr+ytoyK/5lItHX3wtS5qWWaFICpDoVpebZvHtGaLnbhEz8n26viCAPC+HArp3WbwVrnq3r0aJJPMdPD5+U6YEmisRnCZKqjfH8ZvtQXCX0L3Jk8W0xk5SR0t5R3yHZ+Nb7/CYjjixY4nT0tKV6AS5KPHT7DEvD8+mCSnvgMrFhxcin4ylt/ybf3X92S0gL09BvyOmnM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6667.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(22082099003)(18002099003)(38070700021)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Vy9KK0trdWVPNm4vaytaaVB6elhqNElLMkladnkvOUVOUVFOVUNkd25RMjM2?=
 =?utf-8?B?d2V0UUFJWUNuNFV5dlRQc1dXK0VFNG9JMHZCMzZJbXMrZ2JXamtXeTBvSTRt?=
 =?utf-8?B?SFNxNU1nSkc1NFhZUndibmdGbzhtbkxhWmMrY2xESVdoU2N3UDdtOGhUY0NN?=
 =?utf-8?B?aVFwci9YOVpZOTdCRTQxV0tYdENrdHQvN09veFU1WDVNbFFZUkVKbVFvamUr?=
 =?utf-8?B?VzBiOHBudDIrekZHYWQ1LzV2Z0ZnTm5tZEpqRk5mY0JlejhuZ2xFVjM0UUxi?=
 =?utf-8?B?c2c1S3NyRVUzd05tWHpvTksrN3lBMmlGbWtqRDhlNlBmeEhtY0F0QnA3cnhn?=
 =?utf-8?B?aFFFUW5lcWRuYmhlY3FJeWhYYnprMU1PWjdGYnVDUnhaR0pOckx4ZXNscWJq?=
 =?utf-8?B?Z3R3VUd0QjNZNUg0MElySXlmK3BHbzV1UzV4RFlQajQ2b3JqdkNkSUcydnV5?=
 =?utf-8?B?Nm9rNGxqR3dhSkJaVVU3MU1RRUJpYTVGUW5NOEVpWG51dnlsMXZ6cjhGS0pv?=
 =?utf-8?B?cGVvYXBZYVc3MVpudVhvK2U5ZW5oNjBMMW9PM3oySE02SWU2b0JGZXYrU2FD?=
 =?utf-8?B?R1BUOVpoRng1UUQ4TlFTdmFMWXhuWUpOYm5JVGQ2ZU9MWTRTZnZ5aTFoS25i?=
 =?utf-8?B?cno5VFphVE5pbHljWDVLQXRVNnhxdzNTbk1EUTBUaUtJekNaem40dXRRT0tH?=
 =?utf-8?B?TUJnOTBSVnY4b1UyeEhRR0t1ZTRFTXZiWHF1aWlGTHMwUm55REZSSnBucmZ3?=
 =?utf-8?B?RDB4Y0M4RER4SEo1ZXh3NTlQRXdOL0ZSTGtWY050aU9PbjRwejFISXpGS3V5?=
 =?utf-8?B?dGtJc0EreS9lU3J4N1ZNdkNRWmNMT3N6Z09ucENEeE81dm1seWgyK0FHcXE4?=
 =?utf-8?B?eXFVbnNudU45aW9IUnYyWTl4bkcwQ1hYRjFZTVdDSkExenBkenpEV2tBeHND?=
 =?utf-8?B?clFSeEpiaGRpOU8vTTZCc05SZkpVOEUySCtobnJjdFQwT2R6b0J0TmNvTHZh?=
 =?utf-8?B?b2ErbVF3a2NHSklyNE91aVJmekZKTThmaXhKNFhCenN3U1kyQ20xaEx2OXUx?=
 =?utf-8?B?WDdLaW8rMzBDbzdhc1F1TjFzRXB4ZGQyOEt2elpQRnYxNU1pdkNvSDdqMXBa?=
 =?utf-8?B?Wjh5bWI0VWtsdVUrV2UzblVneDZ5dFl4NnRHalJIb3dMV2lGUzRpL1pqbnpN?=
 =?utf-8?B?Rjl2eTlZSlZEd0FvRUMyL1hFNkFRNkZiREJlb0tpQXY1djBLL05uakEzM0pR?=
 =?utf-8?B?ZHk2anhBM3owWnJKVFc1VlJveFdnbGdQYjUzRVk2VERvNElvR3c2aVVYWWpG?=
 =?utf-8?B?dXFFRnZQOTE5VUYyYldHbmorTzZ2d29sbHlOdzZaZnNrVUc0U2VMeFpZTUw0?=
 =?utf-8?B?UG1UWXpxM01FT21ncys0QS9ZdEZMeXZXUVF0d1RCTGtqRFBRTjJ4STRXeUIy?=
 =?utf-8?B?VURnKzJuemZpY3BrdW55REpLK2Y3QkphY3dJQUNubHdnTDVnYk8zaUFiOHRi?=
 =?utf-8?B?UXowZjdTNXpocHFJekl1WFhObnlrakdxUVRCMGI4VFBUaVpDY3NHK3lLdm9o?=
 =?utf-8?B?YmF2aC8yVDU4ZG4zQXFhUzNXbUVRL1d3OTgxcit5R29RYlprR2VIVmxYMW5q?=
 =?utf-8?B?dEZHM29rek1sNTJXQ3BVa3B4UHRvK2t6MHZaR3hhejJkdkh6UFdpRXFaZTUz?=
 =?utf-8?B?WnVPWXByenBTODAwZkdLWWxsT2FBQzFuQzhxN2UxeFIyY3ZadWo4MVFSMkJR?=
 =?utf-8?B?ZzlDUVN2QTFmSXV5UzJEK3dlSTA2eTIwOWM1cVo0SDhreWdmV0FJR0VjcGkw?=
 =?utf-8?B?V3VXNzNYNXlMZGNONEpoblpVU0RLR1l0SkdhRjBFQjZ0WDQ5L012VTE4RFZ2?=
 =?utf-8?B?RXkxTVk3THNnS1JpaFZhVGFGNnFMVmNORjE5T3hFWGdaZ294Z21ManZRYWtk?=
 =?utf-8?B?bnFET2lxTjN3OVhhT2I3ZDRwaTVVV1hDK0NyT2t4MVdLOWxYb2VLWks1a3di?=
 =?utf-8?B?M2NRdzhpVkt0MS9qYTBoUGhVSUNUdDRZSnViR1czbWt5OGNYYVBsYzVTZ2ZK?=
 =?utf-8?B?MG1obzhFczhDWTBLcVBhV1dBd01lbFVoVWdtcEh5TlNCYys2QklvOXpPREZt?=
 =?utf-8?B?Z2Vma1h2TTZORFB6dGRxdjJScEJFVXgyUHZyK0Z1MHVFcDlJTTBwaXRhTWdi?=
 =?utf-8?B?bHpxVGtSZmhGM2p5MnJTRmpkNUZscjYxU1ZUK3k1TWlUclJucXRnaHZmb3Rh?=
 =?utf-8?B?UDdyY3pBMUZaa3hkcS9QM3BsVVMzTUpsN2VrQmJBUHJDVDErOTB5NTNuVHFF?=
 =?utf-8?B?eWFzUHdSWXZuUU1oejhNSXZkK096c21wWld4bDBxckw2ZzExQVhQdjJxSU1U?=
 =?utf-8?Q?tqFJq063kxXr31c8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C00FEAF42154A43904C2D453C0AD6DC@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	hFAgorevLyaKkkfypKBz1somtcUBEAAkb4OBrIOsVj7iJ1T0r32dC0xKwfXHQUjXI7ariZQicqt2O076RGhptR3BNIyL92cb4S/eC4DeSGQgXQeMJJj8Uslu3KN3DmxB8s5giYA2/pLEn6gQkvhQQqfDwH4IMSJwbTn27bnFiSI/vt+djJ1cuzixfmeOoqNvr+65t2vg83f7CTAEDPgiL3RHVWEQvz0VV05p1qSIGAjsC3mKfc6QmEZTwxj5y7Oznb+mBEha8qFBCvKcTklDzVtpPs8gp26DgMhWsIKQWGqgJUEeO24AaQquQvpjXOCfnxznUHVPsoAMbWkes+fUkA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Spb2kjGdLZMDTcp0WUxRqgLzS2IPPtUwjSjzmCV7uFSX2pdy6kqG3Hdevdt2tmf4GRinOZKl+1n+Chw5CkThrUxpTD90nH7n54HloQLfYKk8uwnou5GflVlEgfEu+C1q+NphjsJlNOvwg0kYBfvxmUGOSwVgW7A4xkL69EhVN3+EOpKc5MGHDZ77JwruXHUvuw4GBSb5BypZfTIyqd+CAUAlP9ABARUvpIMB1B16h6TGKbndIL9nsFIjHJa755la1r4iasso+AIMFQp4Tnzb/H8Pi5SfUMBtW5TSWJytMNWAEwL7jgPvnjKfYSZTuXolWzobBowNlB2ayg+bhNsVmS7+mGml0dftrCngs7qMQKaL5zUN43MpfNA1Cj/oIW6dSmFdiU/1uF2JaUlOWnLIFQ5N54lBP8Ebcxy7vdc5KO3WPu/PTdTT1+0cH0Mkb6i8ePP33NRdn2u7NxKVbiKJHACeTCWnRkGmaHgGFNcJls17sILIG6Xr8NX0Tps4WKDn/lbs+y+lq4ulwaoV9ZW8Xc83h5EOoMmrHQhIaZt+pcFOSKziiBuceeQ/3IGnj2pDktK3kMXzT8O/ta7JtX1v8RtV09lTOUIEURJ44AWAVAg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6667.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d382b7cc-0c6e-4ae4-5f6f-08df0f2f08af
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 11:31:19.3217
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jImbUgXvy01JyCiajzlXTciSwD1yolkHejw6RlS2Op/CHIrjFWqhUm09pp9NIlsLJ2lwf5ydsfKEtm9rm9sj4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8448
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2609100135
X-Authority-Analysis: v=2.4 cv=JbYpPkKV c=1 sm=1 tr=0 ts=6aa2950f cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=GoEa3M9JfhUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22
 a=yPCof4ZbAAAA:8 a=20KFwNOVAAAA:8 a=he7MK5w3zWXBu-KIXucA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: tCXgniQN_Paqi1NyYVoFU_l4nlmsGgkG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEzNCBTYWx0ZWRfXzyHzYZa3Go2T
 xiq66dd2YhonWuA5KKpMQr+94DoS60da+EQnePXtyRt2cYHvfeBT36fcQQvsTxqpjacfHIMRDUC
 DxoyDFzmpKtjszC2cnJgfd4TzjoUDgSTf3ToW8lA+Hl6gHd1pG2xlMfztkxFPHYb43Vezvqhlrs
 AZU373BJPPEdU1+6FVMJRJunnyvyR5i09g/69dycw5Fyu0zCjg6fVgxeE5X3+8Y3xyroOrQwHG5
 oRnCDoQ8CulRoXyfYEgRY0aAwPm5zp1OEo1Ja0BmqmXwuPJ+oYxOopIBtDwZt6Tdn5IHMbPPcyv
 Z8dUEyVdbYhLp248DtXPOyyyy5P2M2tfnMaucG2RS2x+p+fPXaqf84ewlhYa5wyv1TZw6fo/NvL
 Wy2hX0v+AX7Oz6O1oIuYaPLlYJw5t9sGqnhCS+LWIrZJ0FpHHFopAZQyXAbFn2q2KTZsIrtQsR6
 I6pfGQue3dwI6Xze3xg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEzNCBTYWx0ZWRfXz3yPpkmOgVAi
 ezdcIdw14O17vjNdaNf35uHb8uE/gn9AbPNTSEkP0uAHHKxYGa3LkBFAg/K9K+DWBEKQOubSBG2
 7bfTZomjnuqb3Wgyx0GQk+2COj4eTC4rrp2GPy7OsST+lM3PEJ4Y
X-Proofpoint-GUID: tCXgniQN_Paqi1NyYVoFU_l4nlmsGgkG

PiBPbiBUaHUsIDEwIFNlcCAyMDI2IDA5OjQ1OjQ3ICswMDAwDQo+IEhhYWtvbiBCdWdnZSA8aGFh
a29uLmJ1Z2dlQG9yYWNsZS5jb20+IHdyb3RlOg0KPiANCj4gPiA+IE9uIDkgU2VwIDIwMjYsIGF0
IDIyOjMzLCBXYWltYW4gTG9uZyA8bG9uZ21hbkByZWRoYXQuY29tPiB3cm90ZTogIA0KPiA+IA0K
PiA+IFtzbmlwXQ0KPiA+IA0KPiA+ID4gPiBDb3VsZCB5b3UgbWFrZSB0aGF0IGNoYW5nZSB0byB0
aGUgZXhpc3RpbmcgY29kZSBhbmQgcmVydW4gdGhlIHRlc3QgDQo+ID4gPiA+IGFnYWluIG9uIGFy
bTY0IHRvIHNlZSBpZiBpdCBjYW4gcGFzcz8gICANCj4gPiA+IA0KPiA+ID4gb3NxX2xvY2svdW5s
b2NrKCkgaXMgc3BlY2lhbCBpbiB0aGUgc2Vuc2UgdGhhdCBsb2NrIHRyYW5zZmVyIGNhbiBoYXBw
ZW4gDQo+ID4gPiBlaXRoZXIgaW4gdGhlIGxvY2sgY2FjaGVsaW5lIG9yIHRoZSBub2RlLT5sb2Nr
ZWQgY2FjaGVsaW5lLiBUcnkgdGhlIA0KPiA+ID4gcGF0Y2ggYmVsb3cgdG8gc2VlIGlmIGl0IGhl
bHBzIHRvIHBhc3MgdGhlIHRlc3QuDQo+ID4gPiANCj4gPiA+IFRoYW5rcywNCj4gPiA+IExvbmdt
YW4NCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2tlcm5lbC9sb2NraW5nL29zcV9sb2NrLmMg
Yi9rZXJuZWwvbG9ja2luZy9vc3FfbG9jay5jDQo+ID4gPiBpbmRleCBiNDIzM2RjMmMyYjAuLjUx
Y2VjZjI5NzY5MiAxMDA2NDQNCj4gPiA+IC0tLSBhL2tlcm5lbC9sb2NraW5nL29zcV9sb2NrLmMN
Cj4gPiA+ICsrKyBiL2tlcm5lbC9sb2NraW5nL29zcV9sb2NrLmMNCj4gPiA+IEBAIC0xNDMsNyAr
MTQzLDcgQEAgYm9vbCBvc3FfbG9jayhzdHJ1Y3Qgb3B0aW1pc3RpY19zcGluX3F1ZXVlICpsb2Nr
KQ0KPiA+ID4gICAgICAgICAgKiBpcyBpbXBsZW1lbnRlZCB3aXRoIGEgbW9uaXRvci13YWl0LiB2
Y3B1X2lzX3ByZWVtcHRlZCgpIA0KPiA+ID4gcmVsaWVzIG9uDQo+ID4gPiAgICAgICAgICAqIHBv
bGxpbmcsIGJlIGNhcmVmdWwuDQo+ID4gPiAgICAgICAgICAqLw0KPiA+ID4gLSAgICAgICBpZiAo
c21wX2NvbmRfbG9hZF9yZWxheGVkKCZub2RlLT5sb2NrZWQsIFZBTCB8fCBuZWVkX3Jlc2NoZWQo
KSB8fA0KPiA+ID4gKyAgICAgICBpZiAoc21wX2NvbmRfbG9hZF9hY3F1aXJlKCZub2RlLT5sb2Nr
ZWQsIFZBTCB8fCBuZWVkX3Jlc2NoZWQoKSB8fA0KPiA+ID4gdmNwdV9pc19wcmVlbXB0ZWQobm9k
ZV9jcHUobm9kZS0+cHJldikpKSkNCj4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsN
Cj4gPiA+IA0KPiA+ID4gQEAgLTIyNCwxMSArMjI0LDExIEBAIHZvaWQgb3NxX3VubG9jayhzdHJ1
Y3Qgb3B0aW1pc3RpY19zcGluX3F1ZXVlICpsb2NrKQ0KPiA+ID4gICAgICAgICBub2RlID0gdGhp
c19jcHVfcHRyKCZvc3Ffbm9kZSk7DQo+ID4gPiAgICAgICAgIG5leHQgPSB4Y2hnKCZub2RlLT5u
ZXh0LCBOVUxMKTsNCj4gPiA+ICAgICAgICAgaWYgKG5leHQpIHsNCj4gPiA+IC0gICAgICAgICAg
ICAgICBXUklURV9PTkNFKG5leHQtPmxvY2tlZCwgMSk7DQo+ID4gPiArICAgICAgICAgICAgICAg
c21wX3N0b3JlX3JlbGVhc2UoJm5leHQtPmxvY2tlZCwgMSk7DQo+ID4gPiAgICAgICAgICAgICAg
ICAgcmV0dXJuOw0KPiA+ID4gICAgICAgICB9DQo+ID4gPiANCj4gPiA+ICAgICAgICAgbmV4dCA9
IG9zcV93YWl0X25leHQobG9jaywgbm9kZSwgT1NRX1VOTE9DS0VEX1ZBTCk7DQo+ID4gPiAgICAg
ICAgIGlmIChuZXh0KQ0KPiA+ID4gLSAgICAgICAgICAgICAgIFdSSVRFX09OQ0UobmV4dC0+bG9j
a2VkLCAxKTsNCj4gPiA+ICsgICAgICAgICAgICAgICBzbXBfc3RvcmVfcmVsZWFzZSgmbmV4dC0+
bG9ja2VkLCAxKTsNCj4gPiA+ICB9ICANCj4gPiANCj4gPiBUaGUgdGVzdCBwYXNzZXMgd2l0aCB0
aGUgYWJvdmUgcGF0Y2g6DQoNCkNvbmZpcm1pbmcgdGhhdCBhIG11Y2ggbW9yZSB0aG9yb3VnaCB0
ZXN0IChwZXJtdXRhdGluZyB0aGUgdGVzdCBhcnJheQ0Kc2l6ZSBhbmQgcGFkZGluZykgcGFzc2Vk
Lg0KDQpXaGF0IGNvbmNlcm5zIG1lIGlzIHRoYXQgSSBhbSB1bmFibGUgdG8gb2JzZXJ2ZSB0aGlz
IGJ1ZyB0ZXN0aW5nDQptdXRleGVzIG9yIHJ3bG9ja3MuDQoNCj4gRG8geW91IGtub3cgd2hpY2gg
cGFydCBtYXR0ZXJzPw0KDQpObywgYnV0IG5vdyB0aGF0IEkgYW0gYWJsZSB0byB0ZXN0IHRoZSBP
U1EgbG9ja3MgYXMgYSBtb2R1bGUsIEknbGwNCnF1aWNrbHkgZmluZCBvdXQuDQoNCj4gPiAjIGRt
ZXNnfGdyZXAgbXgNCj4gPiBbICAgIDcuMDEwNTAyXSBteF90ZXN0OiBvc3FfbG9jayAgICAgICAg
ICAgICAgICAgICAgcGFkZGluZzogIDggcmVzdWx0OiBTVUNDRVNTIHN1bTogMCBlbGVtZW50czog
MTAwMCBlbGFwc2VkOiA1LjAwMCBzZWNvbmRzDQo+ID4gWyAgIDEyLjAxNDE0NF0gbXhfdGVzdDog
b3NxX2xvY2sgICAgICAgICAgICAgICAgICAgIHBhZGRpbmc6IDE2IHJlc3VsdDogU1VDQ0VTUyBz
dW06IDAgZWxlbWVudHM6IDEwMDAgZWxhcHNlZDogNS4wMDQgc2Vjb25kcw0KPiA+IFsgICAxNy4w
MTc1NzJdIG14X3Rlc3Q6IG9zcV9sb2NrICAgICAgICAgICAgICAgICAgICBwYWRkaW5nOiAyNCBy
ZXN1bHQ6IFNVQ0NFU1Mgc3VtOiAwIGVsZW1lbnRzOiAxMDAwIGVsYXBzZWQ6IDUuMDA0IHNlY29u
ZHMNCj4gPiBbICAgMjIuMDE5NjM2XSBteF90ZXN0OiBvc3FfbG9jayAgICAgICAgICAgICAgICAg
ICAgcGFkZGluZzogMzIgcmVzdWx0OiBTVUNDRVNTIHN1bTogMCBlbGVtZW50czogMTAwMCBlbGFw
c2VkOiA1LjAwNCBzZWNvbmRzDQo+ID4gWyAgIDI3LjAyMjE5Ml0gbXhfdGVzdDogb3NxX2xvY2sg
ICAgICAgICAgICAgICAgICAgIHBhZGRpbmc6IDQwIHJlc3VsdDogU1VDQ0VTUyBzdW06IDAgZWxl
bWVudHM6IDEwMDAgZWxhcHNlZDogNS4wMDAgc2Vjb25kcw0KPiA+IFsgICAzMi4wMjQ5MDddIG14
X3Rlc3Q6IG9zcV9sb2NrICAgICAgICAgICAgICAgICAgICBwYWRkaW5nOiA0OCByZXN1bHQ6IFNV
Q0NFU1Mgc3VtOiAwIGVsZW1lbnRzOiAxMDAwIGVsYXBzZWQ6IDUuMDA0IHNlY29uZHMNCj4gPiBb
ICAgMzcuMDI2MDM1XSBteF90ZXN0OiBvc3FfbG9jayAgICAgICAgICAgICAgICAgICAgcGFkZGlu
ZzogNTYgcmVzdWx0OiBTVUNDRVNTIHN1bTogMCBlbGVtZW50czogMTAwMCBlbGFwc2VkOiA1LjAw
MCBzZWNvbmRzDQo+ID4gDQo+ID4gSSdsbCB1c2UgRGF2aWQncyBhZHZpc2UgYWJvdXQgaW5jbHVk
aW5nIHRoZSBvc3FfbG9jayBjb2RlIGluIG15IHRlc3QsDQo+ID4gc28gSSBjYW4gdGVzdCBpdCBh
cyBhIG1vZHVsZSwgd2hpY2ggd2lsbCBiZSBtb3JlIHRob3JvdWdoLg0KPiANCj4gQXQgbGVhc3Qg
d2l0aCBhIGJ1aWxkL3J1biBvcHRpb24uLi4NCg0KWWVzLCBJJ2xsIHNlbmQgYSB2MiBvZiBteSBt
eF90ZXN0IGluY2x1ZGluZyBPU1EgbG9ja3MgYm90aCBhcw0KY29tcGlsZWQtaW4gYW5kIGFzIGEg
bW9kdWxlLiBGb3IgdGhlIGxhdHRlciwgSSBqdXN0IGRpZDoNCg0KI2luY2x1ZGUgIm9zcV9sb2Nr
LmMiDQoNCj4gPiBJZiB5b3Ugc3VibWl0IHRoaXMgcGF0Y2gsIGZlZWwgZnJlZSB0byBhZGQ6DQo+
IA0KPiBJJ2xsIHJvbGwgaXQgaW50byBteSBwYXRjaGVzIChhcyAxL24pLg0KDQpCZSBhd2FyZSB0
aGF0IFdhaW1hbidzIHBhdGNoIGRpZCBub3QgYXBwbHkgb24gdGhlIHRvcCBvZiB5b3VyIHNlcmll
cywNCnNvIHRoZSB0ZXN0aW5nIGlzIHNvbGVseSB2Ny4zLXJjMiBwbHVzIFdhaW1hbidzIHBhdGNo
Lg0KDQoNClRoeHMsIEjDpWtvbg0KDQo=
