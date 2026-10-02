Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A271C1F938;
	Fri,  2 Oct 2026 00:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790902226; cv=fail; b=U+M2Q4E5SWdNW/EpN8p+iyb6KVLTxtf+Xg8bzi524dwtNIWEtsfqGRmbShkJiYNWPlz6g14dihS0hj8e8fDCm6arh1QfpWL4yW6yYSZHK1HwROz7yyePY5fXn78Ffsqw0Ao3Myj4cCUln8OdQuF2gyA01V43VgqO1CejZHYFEm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790902226; c=relaxed/simple;
	bh=v/jBPF0czooBvYNZz4GZO5wkkgvstnH+RLK4a19uXdY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PJjDyKpQAt2hh1grYQ72blqvON/WtzRQVs2e2aeztn7Blmwx9ttH0/2FNVA9BS70gkQnPxQoEEvNi+ZcHGNKF4OuaqWOzwVYyOtktcE+6VB3Q1pJU15KsNT2FeMLk1UCDmv0xv9ki5hPW4OzbRRXZ1/4U5k5KMQeYSyGXBsMBkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=U72e0TOc; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=K5VkCEmu; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YY4KVdGc reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="U72e0TOc";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="K5VkCEmu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YY4KVdGc"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691NGVbb2408098;
	Thu, 1 Oct 2026 17:50:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=v/jBPF0czooBvYNZz4GZO5wkkgvstnH+RLK4a19uXdY=; b=
	U72e0TOc0DXtD536hrjvteJLe/9wOOi+b554ObK+LUXaeeVdRVc81gDjieh8vGKt
	E+tXCVO/CNHu/gH4uUy9NThJenR6yh2ZBqTsyVF3tbuEJu8hZRJA7BCIF7Qrr3l4
	db4xFw5GNLRPHkSeOUQacd5ChD07W3QtndZztcqdHKMwNDTE0uQ4KjSxrZ2T886O
	WSkdKu0Zm4uLB22o6yWS6f6WEhFqoGapOZdhHNH/CjVLAXlrfqDUhOMcf0mCovoO
	DV6+xUlPoPZqjcU3LscQg/oFfRxZIzwtx43dQK77vtxHixVlvL1huWLUczeWjrKt
	TXVTs8L8gsr8u/Do5KACsA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4h1f3j86s0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 17:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1790902117; bh=v/jBPF0czooBvYNZz4GZO5wkkgvstnH+RLK4a19uXdY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=K5VkCEmuXEcUAQKcwcxhTw+Vu3tJdl+yQ0ZglHSxZfT8aT5kP7ozZQfTCrr/5TD4A
	 884PjppkwY7GGaMgGZjIv/ieTONqI4rFAd8TbplzIXuuhUSOSPjlshTJWoCrCzGX/Z
	 q8kYUNt02meT1O8UqxnSBAfwVhS1nlbh78HUMWT0oN9TFO3xeTdXfDHt5FGvkqFbcn
	 7G2vGod4uSt+LtBl9NtHRbakk2hX1fIELO7vcACzJTB52k1Q8ZTPJncEtd1jzjIfpB
	 uD2D7D9qJht9q+QcvTxYwzG9cet59agn868J6QEFIv5ZODsb2HWEsQSy4zQmW8IVDg
	 5E+/hmbjD7I/A==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8CB7C40453;
	Fri,  2 Oct 2026 00:48:37 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 44C61A005D;
	Fri,  2 Oct 2026 00:48:37 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=YY4KVdGc;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00107.outbound.protection.outlook.com [40.93.1.79])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7406A401C5;
	Fri,  2 Oct 2026 00:48:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cL0fW/IFzrdlz+zAiIHEx7acJiaYIsv8k14J1BDw3r0rH1bcwfTHRzowFbOTCTtadGUK+scTpviRq0GrqUeWNaaa/4vTD3ihxVeOEn59JPNYnXWi4WPnO+A8/kNEzM6BhEzw0nmICsiP2mpDeehyFf9Bxxd5zANnC88W0ZtZDkKIp7+PdNSBXfZJZbGFuzdFPCK83GJMqFpkZgZ23InkITfM/mSgB07Orr92+x3VSAJTZceVKfV5UOtMCG6IfUN9PRFcu5O3adRInKEdAVwLRo+pFa+H5lXj6aFITkNLMV2q/aMskPcIYIYInIU304Ifad4WX6yBngWUuMGmRPD12w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/jBPF0czooBvYNZz4GZO5wkkgvstnH+RLK4a19uXdY=;
 b=xxru0fD+hkvgk2hAGSJHD2ZoMBUZjGf9UMtXKEK1gVV8lD4xaKLc7XKAEUBOnJfugus9fGamFdKvXdIRZr7u7+hr7GzDbZHvp/nNQdqbMKqOGFVsK1CpuNx1zSb1MX+Tuc7qMn9zA8jxMlskL8YS6ADpaoZf9C1Vppkblmy/JZRK/p4CPwLjSA+qqoUbsZQkbLE7Df60zSnIuYs2Ug8dooGfJCQ6f5NCyj+suLPpwHuXhqzXkqRRcd3pElxeFCJ28GESpR4qwZQTzTIV9L3C4e+HDKNfBFPpSZlfYWBupWxWEQfW/0Nw3MfSvMxJIRPOUAkEYTWhCdYIQBw+4uS8wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/jBPF0czooBvYNZz4GZO5wkkgvstnH+RLK4a19uXdY=;
 b=YY4KVdGc5S4cHbG+5SosOf7hGiu6mGRZbdF8KcWaEPSK2Xz8++JUj+DpmXVOqmqP8ndfAfDG+yNmOtpF0lbC/Uz9gtJGNI8Bvn/1X/TCzVR1KmPJp7uom+KWMZ0fhZ70a2Yfd6tFWwLwMMZ50GWR1IX7i+dUk/EuZ+FXWnHcEag=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by SJ5PPFE4FC9FAB3.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 2 Oct
 2026 00:48:23 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0451.026; Fri, 2 Oct 2026
 00:48:23 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 1/1] usb: dwc3: Clear SUSPHY before issuing core soft
 reset
Thread-Topic: [RFC PATCH 1/1] usb: dwc3: Clear SUSPHY before issuing core soft
 reset
Thread-Index: AQHdUgIT0ukLj68hBUKu9lzSP0dd77bpa0YA
Date: Fri, 2 Oct 2026 00:48:23 +0000
Message-ID: <ar7-H4Q9U3sNou0Q@vbox>
References: <20261002000741.450793-1-elson.serrao@oss.qualcomm.com>
 <20261002000741.450793-2-elson.serrao@oss.qualcomm.com>
In-Reply-To: <20261002000741.450793-2-elson.serrao@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|SJ5PPFE4FC9FAB3:EE_
x-ms-office365-filtering-correlation-id: 63fd48ae-7bd5-4606-58c4-08df201edcaa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|38070700021|10067099003|56012099006|18002099003|11063799006|4143699003;
x-microsoft-antispam-message-info:
 1tv5L44LAsEuD1EH8mXLqZooVuxJp4AZZ+0pLfPznnxnTbIApnxFGvGORES35ynWmdR2rg+LSGNKK4oRgzUq9FlQ6JGOkw/Vqrmtr/EQSnfUTw1R8JDBqSU3JfNMVxIuabkvkOZ83tvCZIcdyHLq6fAY7BB04ygvKzAx8T4BfojTrxAhLv5Qb3XQCQGDc17SNQX8a9rcivmvR5tsnc3tGWpba5/TOkXNx9Mof6+zUCb6R13cuOaxF2aZc3REZTZn+bfa028lG+kfCzLw0Cz2KbMMqzCVD87jeo0CelDT/iz+6sIgRlyWlNqFrjkojBlW9ypRp03EgdZ/qEPpfTTpgio1HSlUM1EMQmTXermbRDR9Tash5+tFCqWGra8TkzzgvzQ7vWYpRE6sjXQ6ZqQa0CTmYtxbbcqaYAd+lYIddhn5noZimPWngFm4s3ep3mpKSNSkL0MyhiuE/afKCaemueD1nM12a8ANDXT2+2dJ/3tQo15WFRrmY7e7tcVlh1CGWzJzb7BWtiZGf4y6M4351T2Mso9ob1LZzP/QqG5oE5l8036CQKSVyG+Binh80bqxJfXn+b1mu691nZHFff+l6nvFwkBNpU2PGwXei4LF9NrGMWMUgLHA1aDR0Vt6rVtwgYp9WB5txNMVyMh5SbfTQWgLrBpyUf6a9SdDU4O5w6MzdCLN5B5Vzry/7xYm+Uul8q554wURUK13+Uabf55Z8oD8rM6WyxPtTKFmMfryn3g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(38070700021)(10067099003)(56012099006)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MHFXZjBWR0o5QlVVbGdwUkkzcW1sSFpaRk5xVytlRGE4eDZuOXZpNTBlOVBj?=
 =?utf-8?B?OG9Vc0t5RXdyMG11NHgyb09PR25vd2ZhNHRNS20vL2M2ZHdjaDhNTWZnV3Jw?=
 =?utf-8?B?OXJDYUJ2cDBGNUplMWg2WkQyZlFBaFNaWm5XRUJvbzVsNTU5T0Vvck5lNHBU?=
 =?utf-8?B?TE5DUHdIVythNHV4bmlvQnJwS3JWQjc4MzFtT0NNZTJ6bStCSmVHT051VVQ5?=
 =?utf-8?B?MmxxeGdGQnBFc1dzYmZxL1lkSE4yUzhJVEFNak5ya24wQnJ5TjBJOTNPdXkw?=
 =?utf-8?B?a0lCdUNJQXlhN2JLSytvajJRelJOanNLcllhKzBmUDBDT2YyVkIwUVd6ZmZv?=
 =?utf-8?B?M3NVV09QMCt3c042bit2V1hzNy9Uckw2MEdZeENGbldVZ001YTBSTThwQ3BD?=
 =?utf-8?B?bmtFOThVZ3YwTW1BNXVERCs0bktIUjExMWdLY0xXZmtGVW1BeHZ1K0gvaHhU?=
 =?utf-8?B?OVVJZWJDTHpjUnBFdXdiQkZUY3ZjV0VMWVlRczdtMk10cFBCT0g2QkRWV1Nk?=
 =?utf-8?B?T1J3RENYMWtOQnR4Vk5rdjBkZlRxVWxYaGMyenQvNENLTjExYlR4aUVTYk1t?=
 =?utf-8?B?cUFNN2NLeEU0QWtoN0t0OVZQYWFJSE9FWmV1am1XbjBId3BVcUlTZFBTM0lG?=
 =?utf-8?B?TG0xRXJpVS85d042SzBaK1phb1RvRy9FSGJnM3RGM2lic2pWUVB0S29TSTQ5?=
 =?utf-8?B?c25VRG8wY0pWcE1CS21HYTR3U2VKQmxFYU9WYldlcU1Hc2QyQ21iUndpRlJi?=
 =?utf-8?B?NGdhblVwcUFWcDl1VytMT0lrNFd2eWJ6LzhpbWFkVGdwZXpoWGdvakJVaXNW?=
 =?utf-8?B?STJIL01kUk9VR3lqY2JBczhJYURDeDh6MEUrL0lNQXRaYUFjL0kzdnR5d0Y3?=
 =?utf-8?B?cDRIWnFFbkl6V2UzMEtjb0lVamFqNmt1K1Ardk1COHRoMFpVTHVJSHEzZitH?=
 =?utf-8?B?cnB0NnpaVlNLQWFhZGt6QndQMThvRHV1ZDh6WUNhK2UwQ0lWdUpDUy8welpi?=
 =?utf-8?B?YmVqcUtJL1VRUmpBTEVGcUpuZW5OdkVYSTBua2ZOd1Vpd291R2hiaE5QNzlR?=
 =?utf-8?B?aG5YVVN3R1llV3lLbGNaaGlqSFBnRmZuWHBWSmhUM012b0Qzc0pjc2hpdzZT?=
 =?utf-8?B?MU1uYkQwR09lSmtTcTVWMTBsSWFDaFh1OTJLNC9BSTNoZi9vME5IKzFmMWpp?=
 =?utf-8?B?akUxc0lqc0grZDM5T29rUlJtOWFlNlB1OWY1ZDQ1bTc2bTV5L2JqdkJHdGxm?=
 =?utf-8?B?R0tJUEFiY1YraEluckYvR1l0dVovNlAxMnRTS20rN0ZVT2lVWXUzZmdEM1Z5?=
 =?utf-8?B?SURVbjRaMFJDQXhRdkVrRUh1TEMxWUZIM0RFU2VubHJybHVJcEQ1S25jL1RQ?=
 =?utf-8?B?d0NuUnBoL3VCWXc4dGc2ZWkvajJyellKb2twdDFUSVhpTzIwOENKRkw3Z05L?=
 =?utf-8?B?TWtsbDkyL1ZVR2J6Ym5tN1M2Mll2OHdtc2dJWjkzcHZmR0JVdS82Q081b205?=
 =?utf-8?B?czkzVit4bXc4Y2RDc2NwRGZZS2d4S0EwT093dW1NZCtlcXhCNVlkQ2t5Tmlj?=
 =?utf-8?B?a29mK2tyQXBpNE5IeHA4WGcwMTNEUjBuNEY0ZGJrbHU2V1JHSTZGOHZVQnI1?=
 =?utf-8?B?Qi9Qc0p4UmQ2S3hXallhc2VMZE1ad0hlclRJZDR2Q0Npa2czNjJ0Vy9rYmNa?=
 =?utf-8?B?bUpwZDlLMkRRUmNMWTYwQ1k1QU1iYWhOVlJUaENjVXh2V3E5WkpTQXR0SzUv?=
 =?utf-8?B?Q0s4N1hpcWhoWWRUN0JwTFdPUEhWUGxhSVZmckhONHFDVTFOSVBDN2JxSEtQ?=
 =?utf-8?B?ZzduT2tHNEo4QXVTSm12R2xlTnV6TTFLbmRMeDdEdFkyQ0tkNVAwMTFuWFRT?=
 =?utf-8?B?MVBZSlFDQWlSRzFhMlY2eWhRQ1NGU3ZkNDJIVWxNZU41VXRaekxCbnRFY280?=
 =?utf-8?B?MEdvdkZaY1d6M0NUTU9sbCtkRG5Ec0VWTVlkOHJoZGF2dG9RSHlmb2I4bGpT?=
 =?utf-8?B?UWpMQnFWSXNXdUFodGNXQlg2dEg1ZFl2RTdXYVRMTk1iYWZjS3d1RjRnRlB2?=
 =?utf-8?B?cDJqVVNIYW11dlArdC9tUzdPNEoxV3FWYWtLWWkraU5MMUFqTTVOZkhOdWxl?=
 =?utf-8?B?UWU4bDFIM0NFOTJJcDNKSm1tR3ZaekNJd0E3WHkwRHdaVGZBaEU4VjMyK1Bh?=
 =?utf-8?B?NWhkYjZIOFkwUWZmSzMzY2JRNTljOTd2b0d1L1NaS3B1bVEvSXlrQlRpQjR3?=
 =?utf-8?B?eXBLVnIvcjJZeGVxNktxRklWaFZIVktiNXNnYWwvUXRuTlZobDU5bEpPdTd4?=
 =?utf-8?B?NE80YXZXMnhZK2dEaGpDV0NOMHpzY2pUVVh5akhxVG9TTW0ydDh3dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ABA6771E84AC2142B041297670CA9FB1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	lXxj+FWe8pj55dfSbXhp1nRoIbreFnZ1Iq9Z4k/7/3Llxyj+VfWKdPPPsk+dEUMn0bvd181nROz6VYa9JdPIvR14EB/wwVY29dBR7SOYlUOjY6/PyXL+ryHMmAf/kU08wf1OwFsKAgeLhaFl5myi0Ts+COvQcTWFBgPuJjS9/omjklEqWurUAhNVPgRtJlOL6QMuNunwo6qIzY03f9vC/+oWYR99a/EE6aDK1g9+VRAyC5lCbr/nw7WxwDKGwt9MkVJMvZJK2/GI4TLMWgs8uxQvVcpzCXTlAKtU24sT5IDIBYzAZKxXJND2jYeme05PlKlK44fvR5qEatd4FPefvw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wNQTnw5+hwtmgP8lWtDIMOUDT5YLGX1AGlWPtJHFLztzTmHDVeO09CpAgnE0xFA/r6ks8NccfyMVTSbDiwLyi3vHeKzE4ZHIocatywkxze+uNH0c65sndcPTSxscKks1AKWilIWRhv/OqzW2eCLtqoOjm1tr0zupI5eQleU5Kb0Q+jAZRvKoRzV/5R3YpiEAy+wzaMHYCMSGEO6s/4w8inMBtaS02DdFkWliDa2tOSCbaziqLBHk49SLn9gQWXAaQUKc4X895ddrdAKapzYfq1tDeq18ic+sBkxpiWVVehxQPsi+ZAiTVZYsrf5pxxnQD5ogUtMrD3uY1V7O8EnPDd0V7pzv2nTFrHaYVlDw3zLeNd6QmK/IZ48f/YBFrNUpRjk+h3iNlFmaAds1LLJxtB1kF+XGIVF1j3N3cjpLtElrUnOJZA9Qv5H9N3eJDqoPj9bD78phbtnJmSgutaYpU+ogPi1w0J9AWGs2suKfHwjhjTTKQoBKmXyGC0nINiPCLidHfzjE02gA4Lfkaba7cC2cpHWRkWwUkgl8qostq+VCmz+6WZ0vi3hzN2LVNwvPgK7lfcGvcOH8hG1d/tI1Enl0ZcSh6ivxJt0ctLF81rB0I9BC+IiGWoPZINtQHpvIdOn70i4rEt9IHBzZzTxBig==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63fd48ae-7bd5-4606-58c4-08df201edcaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 00:48:23.3135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K1P6RD6hyukpUeNI4T1b2piXh8LjEAMN6Cs37d6s/1VrO8QzM7CsstqyvE9Wp3QpQh6UFp1zP31fLc2fyj03Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE4FC9FAB3
X-Proofpoint-ORIG-GUID: qzvQyfOGe-ySJPg3oH2-qPvADLcZuglD
X-Authority-Analysis: v=2.4 cv=AfkkjHXG c=1 sm=1 tr=0 ts=6abeffcc cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=EUspDBNiAAAA:8 a=E-5NR6_l0nccE8VYOhQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: qzvQyfOGe-ySJPg3oH2-qPvADLcZuglD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAwMyBTYWx0ZWRfX5RHUJiovIFEs
 qov5nORBg10ct7knmK4ehxUrXr5d7O7y9M6LESJ3XH9A7B45bnKniNB9Hc+5J4g5F7p/3OdTHnp
 W6T6S1Es/52dcPKc2JlDfqSzv5wIoej1ot6oF1QY1ezCGzqkXSMEupe0f1127RfDptPLHwdMrHH
 xwI4NAVg8TvN5UMFexm+TWDaICJal+C/0H3RfTzCYtSd/ceavZBbSOimUcnM1Sv8Ptb+VOAldRf
 N/ipV02F+7jqo+bTGpxaSsHqqmnYxNd0S1ccGzWo9fj83+3Ev0aPG7Le2bWDFtObx3Sy9nZt6JC
 dMlGFCDxNWWVl5R5KGM9k6nOf8qJZa32VDHr3DOAxDoPYbeszMxZoC11wLdIgVkp4ltbdM4Hl/3
 3H/D4WwUqti81DzupT5ueLGuA3tchDTuOCS5Hb6J/ka4uwOZ5jrhpcjtzKzIl+L7BZQXbtxznzo
 Wp0t7wcCWYLrFp94lOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAwMyBTYWx0ZWRfX+5dGWwkAR+rS
 ZBPpfcmgtUmujYIa3dfLRoi1kl60vjAYjfQTYHK1IA3iwTY3JO/ABm+AS1hcVz5MLco9Re5AOf0
 K8zt+4TACPmH+k0TvHacj3BYjMy1wOk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_05,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2610020003

T24gVGh1LCBPY3QgMDEsIDIwMjYsIEVsc29uIFNlcnJhbyB3cm90ZToNCj4gVGhlIGNvbnRyb2xs
ZXIgY2xlYXJzIERDVEwuQ1NGVFJTVCBvbmx5IGFmdGVyIGFsbCByZXF1aXJlZCBsb2dpYyBoYXMN
Cj4gYmVlbiByZXNldCBhbmQgYWxsIFBIWSBjbG9ja3MgYXJlIGFjdGl2ZS4gSWYgU1VTUEhZIHJl
bWFpbnMgc2V0LCB0aGUgUEhZDQo+IG1heSBub3QgYmUgZnVsbHkgYWN0aXZlIGR1cmluZyB0aGUg
cmVzZXQgc2VxdWVuY2UsIGNhdXNpbmcgdGhlIGNvcmUgc29mdA0KPiByZXNldCB0byBmYWlsIHRv
IGNvbXBsZXRlLg0KPiDCoA0KPiBDbGVhciBTVVNQSFkgYmVmb3JlIGFzc2VydGluZyBEQ1RMLkNT
RlRSU1QgdG8gZW5zdXJlIHRoZSBQSFkgcmVtYWlucw0KPiBhY3RpdmUgd2hpbGUgdGhlIHJlc2V0
IGlzIGluIHByb2dyZXNzLg0KPiANCj4gRml4ZXM6IGNjNWJmYzRlMTZmYyAoInVzYjogZHdjMzog
U2V0IFNVU1BFTkRFTkFCTEUgc29vbiBhZnRlciBwaHkgaW5pdCIpDQo+IFNpZ25lZC1vZmYtYnk6
IEVsc29uIFNlcnJhbyA8ZWxzb24uc2VycmFvQG9zcy5xdWFsY29tbS5jb20+DQo+IC0tLQ0KPiAg
ZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgfCA3ICsrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUu
YyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+IGluZGV4IGZkNWMyY2QzNmM1OS4uMjgyYTg1
M2MzNjRlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiArKysgYi9k
cml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiBAQCAtMzMyLDYgKzMzMiwxMyBAQCBpbnQgZHdjM19j
b3JlX3NvZnRfcmVzZXQoc3RydWN0IGR3YzMgKmR3YykNCj4gIAlpZiAoZHdjLT5jdXJyZW50X2Ry
X3JvbGUgPT0gRFdDM19HQ1RMX1BSVENBUF9IT1NUKQ0KPiAgCQlyZXR1cm4gMDsNCj4gIA0KPiAr
CS8qDQo+ICsJICogVGhlIGNvcmUgY2xlYXJzIERDVEwuQ1NGVFJTVCBvbmx5IGFmdGVyIGFsbCBu
ZWNlc3NhcnkgbG9naWMgaXMNCj4gKwkgKiByZXNldCBhbmQgYWxsIFBIWSBjbG9ja3MgYXJlIGFj
dGl2ZS9ydW5uaW5nLiBDbGVhciBTVVNQSFkgYmVmb3JlDQo+ICsJICogaXNzdWluZyB0aGUgcmVz
ZXQgc28gdGhhdCB0aGUgUEhZIGlzIGFjdGl2ZS4NCj4gKwkgKi8NCj4gKwlkd2MzX2VuYWJsZV9z
dXNwaHkoZHdjLCBmYWxzZSk7DQo+ICsNCj4gIAlyZWcgPSBkd2MzX3JlYWRsKGR3YywgRFdDM19E
Q1RMKTsNCj4gIAlyZWcgfD0gRFdDM19EQ1RMX0NTRlRSU1Q7DQo+ICAJcmVnICY9IH5EV0MzX0RD
VExfUlVOX1NUT1A7DQo+IC0tIA0KPiAyLjM0LjENCj4gDQoNCk1vc3QgcGxhdGZvcm1zIHJlcXVp
cmUgU1VTUEhZIHRvIGJlIHNldCBiZWZvcmUgc29mdCByZXNldC4gQ2FuIHlvdQ0KaGFuZGxlIHRo
aXMgdmlhIGEgcHJlX3NvZnRfcmVzZXQoKSBnbHVlX29wcyBmb3IgdGhlIGFmZmVjdGVkIHBsYXRm
b3JtDQppbnN0ZWFkPw0KDQpUaGFua3MsDQpUaGluaA==
