Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.104
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793356453;
	b=i3U0iE9q8CfddzXabWhv3G6eQvcgOdpaCPDiSYUaiwDm2zrDGDMlDFA/B+yoCOtlwvUH
	 dKaZIfZje3ooz6ZtiG20b60clg4bvxNKVACA9NTW1aDkXGiRQkieF7wDBDXj+ELXRv0D0
	 T9H29j2RE2XRaBy9HkKASJlQWB4H+6ZByeEno7SDsXyER5gUyFwMRjzkx3Gf/16KR3b7k
	 NzweMHDaKjyykEA1N2veEg0LFb17LTEW+GeZPvJjHiaez/rGW/3If4IKrJETJGBtCPMRh
	 1iIE16NJX4+7ywKhrxnQ6s5q68Peipyb2MSLYMn/cLq9E3GQg1dMLnYwTnTLRKON5KA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356453;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Type:Content-Transfer-Encoding:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=uRa7MfhxrwathCk+7nn3gwTlw3GLyZvOjVIdvlqibXk=;
	b=z60ZDCxG09tPuWIT6GHS2u/A/LM07B0wHkzT/G171Apv/s/a1LCz4FjyMgz+/HFgr/vx
	 QOjrf/XEYpIkI7ZH+I/5U4GqpPCxQzTBxXfuaZImvG8R5YnOoXPh2C2NNh4kOQENYBac+
	 yhdQI475ETGZEmpEd9f4aRJnzBLffVB36ZE8sTz/t9wYmeCW9AVvdk2iROtI73ckoc1nG
	 H3UL4TzfBr9Jg285SSog9V1cT8AjjmMpapwi1AZfNpu78II8UpSxlE+luqk6AOHN4hKwQ
	 F6LiPQxzv8v1ADIlnCUYulI+5499z4n1FStYbf98j4FkkDIbug8BlSTGcTOMORyd8pQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=X5KwiTPR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.104
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020104.outbound.protection.outlook.com [52.101.225.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC78606A31D;
	Fri, 30 Oct 2026 10:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EC78606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=X5KwiTPR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3W+Lx7Q0tm3h4s9kDMXyU/wv3HPCb+w34KXXMS6QaeV+VN5UltT35yJjyh8G0p8+Nmk+KdOErhfZ4uKxM3qWxy7ccGUHiFU81+AQ4XWOEcBs4tvhvi8eR9H0zy+a81OMJMTNqiaIfGNQ5qKvah4SUnhp3j3j3O5eC6DZuVms3mrjMl/Jsxd21dfZrKKYSSaQ0JqGECj99RGEV1NuAQVwM9+2MMmTKLRXCHG5vUU6/ljliIKvI8W7zD/irhixECoSz1cGd2u9Y5+Wnfc7t+WByR9/nS189zqfvdKRxr/W8P2omC8hiqjLb3JkyDJeJpptLlPYjQe966fD9Tlmhwfaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRa7MfhxrwathCk+7nn3gwTlw3GLyZvOjVIdvlqibXk=;
 b=p+0iLRjojLjFonmnO6b2sepriiptzZkrkNkB/9rQDCx9BBpnMTh3cJ95c1B8esj0pkW70lzUQME8qAo69Qkz+91B06txWglNyfL5dLq2w1nYih7XlwMhJye6tfO/IhKroELEDvgdZP1sR4sv3utFNKGK5bQmWsmQU2oLufS7igUKeGn3mSd8WbN7vXqAwZQ4P3vEy8cJYN9JjOKgyYLBMZ293t9ZueYpKJh4Dt+hkNHycHGdUc7cJ63WVenpPuprVSKlNgud1gbw+Fv/ckdA3SR9QjaMuz0ST8PE1ZznSTeckXNu+TP1X6nqDMm8ZXnUM8CHGFPXZUTml7pFVngl/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRa7MfhxrwathCk+7nn3gwTlw3GLyZvOjVIdvlqibXk=;
 b=X5KwiTPRVhqKAutKQ8a2FpX50WpHTL19D8q9bCuZoN1l+LGoJ/qLeS5bbscqXOQapNhZtPy540izlJ1GoeN/CiMhsdk2nCv4qAbgV5ZR1vvvLMezcmrhmAY8EXIdKZPGtItSIFEXpmxx6zK38o8kOhSQCroDRid9lq3QSG3KoBWpDGgNz/Wb13Fe2rGd/Bx3j/Z765yZBtTUfZk28WNY+HfaawNcbtXEvyzvk9TcSmmpfO8gmUfVciZw02wBbR1zWjTenzYuFsahisy9IX0BqSo7DD2mujR9B1KV8cD5NQNdt+3QkCQZJ856IwWTpZmd8vptA08LQauI6az9YdMkdg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA5P287MB6058.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:236::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 10:34:07 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:34:06 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/15] media: i2c: os05b10: Refactor driver and Add new features
Date: Fri, 30 Oct 2026 16:03:32 +0530
Message-Id: <20261030103348.1222201-1-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::32) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|MA5P287MB6058:EE_
X-MS-Office365-Filtering-Correlation-Id: 57743cbc-34ed-46a0-253f-08df36715357
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|52116014|376014|366016|1800799024|38350700014|56012099006|261009221227099003|261009223027099003|261026121527099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261022075727099003|261022105027099003|10067099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
 47aRfyyisZJSKySLpsziF3akRGkLMNAkqiReYzRIGwv3RDN53gfgY6tV90RuSU2R6xoFGqwalirixGbrWIgzZM0BHsKopDGKAjo3IjkzoEx2yXTSR592oaNk0a5orCF9w7eEMrw20ACpxBiXmnDmzZIyq+4okVuPWBnnWX49yJFmA2Z9E+x9LCw2B4LlzLB2GmL6YyaYQ53Ip07k9Zd6Rd3tkIU/nRo7lfw06yjqJ8Yyh/dSrL/RIMA1zXnZEs/xpZ8tgAFLBN+FNvswxr+6YNGQnOTSeoOrYf5jubpZSCf6jFSj4lGrrSLE1kLzTUj+oNqxoUFlmih0UN8Ig8i74ixZO31JaBS6FBwAGMSy1WrRxDoh8Wk2QHXnNj1ymClcUsgBoCXLNHCgZ98Nw0pcxUx1awwSSIbQmo09yoenNZAEEvh1AYy3MJ2V2SVdvGOH8pIK820QgLYO3fzcUVmGbzqjy0YjGBnSmnsAVy56rJV8Og8d+EtZlVfiguGXxwwNmVj5rvTS0jvZHIAFc9r8UVvruy0MpNaoTY1qaqNvNgC4WVD6qhteWncab0c+Rln5jmOPuiyWoZDMVxUoHph95VsdHLQAWvPcziQ9CSASYYVAbMdWId04WDI6DC+WMGv15t7hUUr3Q91IM+J/XGkyPzYqOZUtOCjUdjCuNFBzErY=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(366016)(1800799024)(38350700014)(56012099006)(261009221227099003)(261009223027099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(10067099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ak80NDAzVU5RRVNBTnBqTDNNdXlBRzVmN0o0SWkvOWI0VW9QU3ZkSjBvemtZ?=
 =?utf-8?B?M0dXUk1GVW9GL2hJUnQwcThjbmNWM25TSERjV2tYeEZjTWp6KzZGU2F1MWhO?=
 =?utf-8?B?Y3E4TmM0QXVCcWJqdXlSczBQdXdsaDFUeEp0MGV5VWZCUmZXbUJVbEdEVGdG?=
 =?utf-8?B?bWY5ZEx1M1VMdUIzQU9lVCtkQVNrM0JtU1QwN2JQQjZDdW1HS0dJem5QZWdH?=
 =?utf-8?B?SGNkZWM5RXFLdGZvbEZQQnhvdnV5RDA2N3o0U2RrT0RRaURjZlBxd3pSdXdF?=
 =?utf-8?B?cnVBLzBkdTJ3UklPWkgyVEZ0QnZmSVF2SDg1dytSazZlaVE3WGdzb1hxNUZ2?=
 =?utf-8?B?NGFMd3F0Q09MUElrZ3dxTHNHU2s2dFlQL0lSUExzWVh6Qlg1eTlGdVB3dEVC?=
 =?utf-8?B?c01VTWNPYUEzYXJyRjFtVEdhcEl1OG9KSzVONCswbU1QOXVCeDZpZS9LbTBQ?=
 =?utf-8?B?WXM0UTVsQytrVXAvVW9WcWdoZko3Y0I5WWkyQXVsam5mMW13V0JMY0Nqb21U?=
 =?utf-8?B?SmJEanE0dE42ZkZHSWJTTkRXcERSZmFoRE8yZHRHZ1pwME4xU2FVZjlzYkli?=
 =?utf-8?B?SXpqcWprZEFpejl5NUY5amVZdW0vKzdxd3NzaVZxUytCbXpoeDVDMENvNk1w?=
 =?utf-8?B?T09HOHF4MVlrUHhDdStVZnJyOGFrUFVkUWYvYnBTbStJZFF0ZEJHVXB6aGxk?=
 =?utf-8?B?di8xMzJQenpIbVVUODU0elZxcmVxaXVyTzNsOHZJNUZvVU9UbTVYU2ZnMzhI?=
 =?utf-8?B?WGR2Mnl5ekQreTJCQnh3Q0h5Qmx2SC9BT1VPU3dXZUI1RDg1elpZY1NXMnZY?=
 =?utf-8?B?M2xqZkw1bFJNMm5jR0RadUtZZnJ2TkgzMVFXRXh1SmlpS3dOQUhMVW8zQWM2?=
 =?utf-8?B?eUl4bE9XRzB5NmhRSno4bkVTdU5BOVBrL1FNZk9TYUsyM3E4Nytja2RoWUhs?=
 =?utf-8?B?UnQxUitVVGI3MmlYMEFtUjlPQkV3NXFOV1oybUdiYVpIc1RsNzM2bmNvWS8x?=
 =?utf-8?B?MHp1YVhyQWtmaUwwNnNNVnRiM3AwZ0tNWWwzQjlmb092dFM2KytjTjlSSnFM?=
 =?utf-8?B?M0lZL2pCSlZZUjhiRFB3SjQzOExOOEdvc3ZCSGNiT01PMC9xb3FYanZnZE9x?=
 =?utf-8?B?bk1xQjQyOWtvd1JGS2d5ZWVTRlNyK0dUQW45NHpoV2srdGdXMGdLaWJxWGFB?=
 =?utf-8?B?V3U0bEl2VlZkS0tUeVBscTZ4Vk5UKzJWN1ZPYzFYUGU4azBFTFZzNm5GN3pz?=
 =?utf-8?B?UE1IanNTNHQxbU14ZDhvMnJDejJWYXJ1SGk2QXlEN2p0WnNScCs1U3FtWDZ1?=
 =?utf-8?B?RzZJYTVyQURsUGZhaTRpZnpodVRIL2w2UEkxZ1BJUzhkNWFLY201akZOR29l?=
 =?utf-8?B?aGJIOTV1VnpiWGJVTThtSm5MazJIaVlaTjd6SGFPdHVyWTRpUC9Dc3h1Qmp4?=
 =?utf-8?B?ZG43RTlzdlVJRzVqQURiblVoSXRwQmZ2MDN4czVQQ2xWN3dtYUNoRTdEVzRC?=
 =?utf-8?B?UEV5b2ZkZDl6L2pJTkhscHZiRm5BSVZTeUtTb2xnOHBFUCtTSzRTWXVsR1R0?=
 =?utf-8?B?a2o2UkdSQlFVZXFITUFENlRmN0MzcE5HaDRnb1o1QnNFc1RhVEo0aTdnZHBu?=
 =?utf-8?B?TmV2d2hjOEFGS09oN1g5TGJVUVF6SXR3TGo5b002R0NCVUJaZ1pvclJJNWor?=
 =?utf-8?B?YTNWSUlJTTMvQVl4d2R1aUFGSmMraVlHaHY5ZE14OWJTOFJvS2pOK2xZZGt6?=
 =?utf-8?B?RzlsbGpjOTczTnk4K0tJSUx5ZStLZndQR0JKSUhFN0pTck04Z01HUncvUXYv?=
 =?utf-8?B?L3dpajhpK3lpOE05K3MwaVlJSGhDdUFmQVczMnZMS0hHT0pqVTUraXB5SWVD?=
 =?utf-8?B?MUtiVTRhUjVrNm9CbUxkL1dMUi9HMzNXdUtWMlFPMjFad3JEK2FGWXVpNTA2?=
 =?utf-8?B?eFAyK09sRUlJbkwvdFV3K1dwQ0pWZ3RxUFd3SVcyWnFWMmdTR25BSUxqY2Z6?=
 =?utf-8?B?Q09IWjllUkxXMWdFem4zR3Q1c1NnWHQ0ckRacUxodlVOd0lsSzhITlM5ak5H?=
 =?utf-8?B?c1JrcjVHZ3dGL1JMQkpSMTRjeUxWbnF4RnRPbVFrMUREM0ZzQXdJbGxRaDlW?=
 =?utf-8?B?dzEvZWFjZUNUSXgwWGE0aUVmWk5RU3lidmpNemxDMDVCNFpmbzZnWENYZ216?=
 =?utf-8?B?K25IdDdiNHR3bGVxWk9oR28zL01FMWRwangvWUNNQ3V6OUllMDQxeWRVQllp?=
 =?utf-8?B?RmltTi9PSzdsQ1k3VmJqeTNxWUd5ME1DL3NMVkNkdm8zU01RQmVqenoyYlJi?=
 =?utf-8?B?UkEyS2NsU1laL3dzOUtrSmJ4OHBNN0pGOFhrY1pyNVlFUG1DblgrdlUvYVJK?=
 =?utf-8?Q?gps3n5IUNQei1xFI=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 57743cbc-34ed-46a0-253f-08df36715357
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:34:06.8556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 09Poq6D/WRrbj2a7LaOfx47hORS7AAyKq2Oe2d0rZasamTlew5OI7cHBesyZEjjiXjJvcCidl6X6cgIenlZT6C3d/DYZSm7Cdmdsjd+NtS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB6058

This series improves the OS05B10 sensor driver with cleanup,
refactoring, additional controls, and support for new modes.

Patches 1–4 are small, self-contained fixes and cleanups. Unused
group-hold programming is removed, the vmax variable used by the
VBLANK control is renamed to vts, the active format is updated before
adjusting framing controls, and runtime PM autosuspend is enabled.

Patches 5–7 refactor the driver. Register definitions are introduced,
the initialization tables are reorganized by splitting common and
mode-specific registers, and unused control fields are removed with
simplified error handling in control init.

Patches 8–10 add additional V4L2 controls including digital gain,
horizontal/vertical flip, and test pattern support.

Patches 11–12 extend the driver with 12-bit RAW support and add new
operating modes including 1080p and 2x2 binned 720p.

Patch 13 keeps the exposure range and default in sync with the active
mode on VBLANK and mode changes.

Patch 14 adds support for 2-lane MIPI CSI-2 operation.

Patch 15 fixes the horizontal blanking calculation and reports the
sensor's real internal pixel rate.

All patches were tested on the Debix Model A board running
Linux kernel v7.2.0-rc4.

Changelog:

v3 -> v4

- Reorder the series: simple fixes first, then refactoring, then features.
- Drop v3 patch 1/17 (Use pm_runtime_get_if_active() when applying controls).
- Drop v3 patch 9/17: pixel rate does not depend on bpp.
- Patch 4/15: Call pm_runtime_dont_use_autosuspend() on probe error and remove.
- Patch 5/15: Add OS05B10_REG_PLL_CTRL(n); use named values in the init table.
- Patch 9/15: Chain cci_*() errors; update active format on flip change.
- Patch 11/15: os05b10_get_format_code() takes the mbus code instead of bpp.
- Patch 15/15: HTS counts 4 pixels; fixed 420 MPix/s pixel rate; add Fixes: tag.
- Collect Reviewed-by tags.

Link to v3: https://lore.kernel.org/linux-media/20260718200912.16001-1-tarang.raval@siliconsignals.io/

v2 -> v3

- Patch 1/17: Drop Fixes:/Cc: stable tags; use "if (!pm_runtime_get_if_active(...))"
- Patch 3/17: Drop unused HDR define; use GAIN_DEFAULT macro;
  DIGITAL_GAIN_STEP 16 -> 1 (tested, not in datasheet)
- Patch 4/17: Drop unrelated cosmetic reordering
- Patch 6/17: Use OS05B10_MIRROR/OS05B10_FLIP macros instead of GENMASK
- Patch 7/17: Clarify 0x5080 removal in commit msg; fix test_pattern_menu[]
  casing
- Patch 8/17: Merge codes_12/codes_10 into one table; handle NULL mode list
- Add new Patch 16/17 & 17/17: Enable runtime PM autosuspend; remove unused
  control fields/simplify

Link to v2: https://lore.kernel.org/linux-media/20260325114404.95188-1-tarang.raval@siliconsignals.io/T/#t

v1 -> v2
- Added a separate patch to fix the use of pm_runtime_get_if_active().
- Modified patch 11 Remove unneccery exposure range update now just modifiyng one time only instead of twice.
- Add One patch for fix negative hblank calculation

Link to v1: https://lore.kernel.org/linux-media/20260306123304.76722-1-tarang.raval@siliconsignals.io/T/#t

Tarang Raval (15):
  media: i2c: os05b10: drop unused group-hold programming
  media: i2c: os05b10: Rename vmax variable in VBLANK control
  media: i2c: os05b10: Update active format before adjusting framing
    controls
  media: i2c: os05b10: Enable runtime PM autosuspend
  media: i2c: os05b10: add register definitions and use them in init
    table
  media: i2c: os05b10: split common and mode-specific init registers
  media: i2c: os05b10: remove unused control fields, simplify error
    handling
  media: i2c: os05b10: add V4L2 digital gain control
  media: i2c: os05b10: Add H/V flip support
  media: i2c: os05b10: Add test pattern options
  media: i2c: os05b10: add 12-bit RAW mode support
  media: i2c: os05b10: Add 1080p and 2x2 binning 720p modes
  media: i2c: os05b10: keep exposure default in sync with the active
    mode on VBLANK changes
  media: i2c: os05b10: add 2-lane support
  media: i2c: os05b10: fix horizontal blanking calculation

 drivers/media/i2c/os05b10.c | 725 +++++++++++++++++++++++++++---------
 1 file changed, 556 insertions(+), 169 deletions(-)

-- 
2.34.1

