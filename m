Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazolkn19012067.outbound.protection.outlook.com [52.103.72.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEB03A5433;
	Thu,  8 Oct 2026 22:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498242; cv=fail; b=b+/nmkGNjO0z5pwuWzF2UbRSNyMRpQC5ZgMmP1LFxcQe3+tgEe7hwgiD1ednKarMxbWQIefIV5//PhP1PqrLIGJ9Bgvo1vGPHVu5LZmQ95qwmjQlKNHg6MibVP0M7pCXlE6aXnh8tzC+jSG629jJy5fTCnrw1UefYTUrr8+XUfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498242; c=relaxed/simple;
	bh=40augDI6zzSgeeHKbwmHwjD7ng7/KPnprkZGTXqv5dA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pSoIlkwxcbmJI7pJnvSxnjnB9AtvNKIEUCMHIMC/rJMZeUNskTNwtgnFG2Xsx+BJZ93+tcmvG01tHCCkNFbw249TUyy9IioC81PmOpWAv3jOBLDhqysiLjE8dV2v7WrUfniyIB3THegBwiAv7FBCUB3sWihQziLszRynrBFhbRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=dgWDbFUB; arc=fail smtp.client-ip=52.103.72.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="dgWDbFUB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZjkYf8uFDxeNZMgoRpoTnjtU7JL+CbcGLXo/JJRcnm7RM6RfExvNzEODCFyYVSnCLs3tteCV07JqcwTNPtkT+aEefw3RHa0VpPWimPl3+AUyPIHq7M8/ms8BOXT7r7zdswGSXr7Ssy3kTEIG569yzSNRky55UQPl4jocELhRx0Whcf4rbNCSZjd8cAwaw6bJmARbg4X8IiLzZ0AGRHNgcDI0G7f8XTcTX17gH/4R/GfJjJcAQNPm8n2MmY93rb7nn4mONQ77GJOC8vNmPCExkql/EeR5kL41qKUXjWj4F4gw2nTnakrZt8JRdoJ6GRM8k/Tw8OphpgwayQwymSLx4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYkEwzERt/ir7F7hst5TQ1OswNW6qTHtPTVv4+GQojc=;
 b=R5m1nMRTbnQq8M4yM+dVfs/TMWhFZBHfePuL2DlXpMpBagvgiMu3M74u8E6oeYj835Bm9fQRWfHXPFnejIljtoCnAM/WpPgQ9t/9Cg6P9XbNVQkmw5zBGAtkGhhB3EboZ99iuLmUjYUe2WYxx707X1UgrgZDiBF6UL06fcHX+r6esd6L6M5t1LsWf7M3q/9uZn0MyhPIyhzzQS3i9Yyy+wQ6fqda3QlgSkwvIgSS+/TlYd0m3uwpEdkX1hXW3KqqhiMoyk8S9Bg4l2igim/yQun4BUTvPqXKm49hy8t9McWKy92nKlPss3hxaeOOu8MYtR/PreoClIjoZ+jKOsSDLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYkEwzERt/ir7F7hst5TQ1OswNW6qTHtPTVv4+GQojc=;
 b=dgWDbFUBWt4QmlP9WQNetwKHRsWJbv8h9Rd/mCQ4KQC4GfIt4HZ3L92XrHw0meenpj2X5VyZiasnX9xZwnNf5p3xRTEzrVhEVbyUkz+V5T/Orr1s3QlEIvtXcMUr0ZbOZIrjtKPWtQhaXh/S/09Z5TI1DIiWlbafnc7pjD19n90h3mPW5PeT1nVyKvD43DZZhfkYtFjrVtu6yjCZUAQ381ONePO/pGmLff/Q99MDvtJzLKsbKav9KivjFRgRAcxymfT1qDBIK/+KUDA0RCZZbd5cke8vlthcgfL/1jsKNgdXjyo7J204nTuZ35u/rmBI2/3c1EmacNyuF5mB6f+DQA==
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com (2603:10c6:10:32c::14)
 by MEWPR01MB9088.ausprd01.prod.outlook.com (2603:10c6:220:1f4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Thu, 8 Oct 2026
 22:23:54 +0000
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19]) by SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19%3]) with mapi id 15.21.0522.002; Thu, 8 Oct 2026
 22:23:54 +0000
From: Zhang Jiaxi <Z1529105815@outlook.com>
To: Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 0/4] ASoC: qcom: q6apm: correct PCM formats and error
 handling
Thread-Topic: [RFC PATCH 0/4] ASoC: qcom: q6apm: correct PCM formats and error
 handling
Thread-Index: AQHdV3OzDfcQ0CN78kSwRPvoqBxJZg==
Date: Thu, 8 Oct 2026 22:23:53 +0000
Message-ID:
 <SY5PR01MB10600B2BE812BAA1B0FA501B4A1932@SY5PR01MB10600.ausprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY5PR01MB10600:EE_|MEWPR01MB9088:EE_
x-ms-office365-filtering-correlation-id: a98231d6-2315-4e4a-bca3-08df258ad64c
x-microsoft-antispam:
 BCL:0;ARA:14566002|41001999006|38102599003|15080799012|25031999004|39105399006|4140399003|8060799015|24021099003|8062599012|25010399006|19110799012|24071999003|31061999003|20031999006|3412199025|440099028|26104999009|102099032|2607281247196008|40105399003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?/ADAhriwll8CCvzzNBWZ/qA86/ZIbv6DPaxWO4A7nPNvtObLDcZdvcVx9pHn?=
 =?us-ascii?Q?ulBXTFBLlCYNw9uJBmhDiO014LhCggMuS13dyy6RoXC42i2gFMk/XCyQv7DP?=
 =?us-ascii?Q?EF+AUoh70igM2ZHBKPWQgEul4QyQo/DYAaNbdQUnXmkKABdv5sA0V8LK110N?=
 =?us-ascii?Q?63B/F4NBRv6K2CC8cVY+us0botAItyA+ZPuTMrh2DB6kMuJXyAmvI5b8So4I?=
 =?us-ascii?Q?R3b7wrB2OCad3kssKnPeg2w9NnYCVLsBxecOtVzQDs6JofSm+cNv2+fqVNG6?=
 =?us-ascii?Q?fvm5+8SASlb7qfLI3rmkjp9PP4V6dgth7MiXVaCXnMvseK4Y9dRaGEdG6vic?=
 =?us-ascii?Q?cIO3Myv8QkFRWHdQtja3LFuKDmFAZhOIZ2alAuRgJAS9BsAw4TKdxIDm3E2P?=
 =?us-ascii?Q?fhDv/nIZAVoGrdmP1t9U4oijdLHBa+RgDj3RT5K+uL9Bgnu3MwyFyfLfJxif?=
 =?us-ascii?Q?JHf9+1qzMUlzJCkrVjuA/nEykPrQS9hKBceQL3+iiueI2M2faCso1IY95Pq6?=
 =?us-ascii?Q?t4eVdEOivtVPtJtmFSXDoQnAxjnQazwWXE0RE1bgvgnCM1vSFiUIGqH8iOVQ?=
 =?us-ascii?Q?MEmS89I54xcNoUfnp6aaXcbFOOUWwk+khwZxkUx7rRBIqE9vbX1wmpXehikj?=
 =?us-ascii?Q?ecXLWMDvvRixF6EnD9XpnNaunHH4A9eFpVvIPLvF4Wb+8/X4RtdddLHz63Fr?=
 =?us-ascii?Q?qaVqzjI+XP1e0qHPBdcUPkfjYZPLXUS5Ydk/+qpKcEikAsrjo0BZH28/5gUk?=
 =?us-ascii?Q?lOakW2POXSqCpv06Bmp4/u+f1MXnXzGsAAtRRWWTS0kX2mMrVXGGzsHhtyVb?=
 =?us-ascii?Q?INOAqNpnsAv3Fzgvvp0wyNPVDDxpIw/9S+Y1yqLAexMbNqvE8qT47Lbskm1k?=
 =?us-ascii?Q?LQpbbiqk+S5XCUvkYCo5q7nDqX6KDldJUwFRwVqnhlFwaThU2/ylGbm6ip21?=
 =?us-ascii?Q?P9taP5I9W+byXoDq5FDgUl5H2wonDDMJl4FQjpA8AuZRdrGG76pCW4Oj+Xu5?=
 =?us-ascii?Q?13yhhW8f03tJrvYMd0y2lf5grfd2HvwTRV2uc058g0R65sUaFxWVyeKyje3Y?=
 =?us-ascii?Q?1iPpn5tvZCFr0b1s+oPG0lMYOd8aZQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?L8t3KaF38xiDb6A4necgdsgOyHEK0uOrRp55TZ06NPRwnHtrv7gaJM6ptiVU?=
 =?us-ascii?Q?9hzrBxk6uUJCIyM0XjxZoYPICpIkcVZyTrdNbVCRH+LYEQIOwyZh7U/9TBr6?=
 =?us-ascii?Q?sDwEBfKZWWy5vDw/ERxO6UmSZ/ZUHDazzUvM4/jIuf6fZQj16Df0fJGexnXX?=
 =?us-ascii?Q?a/0B3t7OuHCTSJLxvFTe6yI3vLXjmjl2vdGszFrKZma/YZmvibzdhQMOtOhS?=
 =?us-ascii?Q?i+d2xKsk7WyAJ7GK/qMDFFrcIobJfwUV5G3hkNldLr5CvDd5pydxkcs/RmBw?=
 =?us-ascii?Q?Ht+K4dy/gYPpmU3m4wifsqZ3vyENKHgGp3yvkuCsWK22LFY87aGg21dFaYF2?=
 =?us-ascii?Q?ptMEJxZUKnA6iXf/4hb8c1Ymek4ivzc+U8IEDvNMsHnaybs3w7Na4E/gmrx+?=
 =?us-ascii?Q?MTc6uODmzrDaititZfmwkU6OfVYH8kjc+TdK4wDleDMq+Sdu/vFUBRpM/H0G?=
 =?us-ascii?Q?bDQDjSz+2A7VBkolHNkcieku+bI0F+Ec+hyrgcIbGQjENcxrVCy/yK0h3E0M?=
 =?us-ascii?Q?C5rJTmlg5rZGy94Slt7dglyV4nHzu5woGFF/IHWBy99HpjJOJe2MYqqtN5/3?=
 =?us-ascii?Q?p3Lv8O3k46s9UV2tXA/MF/8swJO+ioijKqNVHVVy+gEIBsWqVg3ktNhJefaB?=
 =?us-ascii?Q?L7nnJO0p23c2ylcpUuPBhLVjsQLZiNIG+7OO0gzpq0gsaa7A+tJTVhsMJbBi?=
 =?us-ascii?Q?CxHBK5U3D15z2cmCyX63BSmJSQFN/oDNGBJFmafw4m3aM/gtE2jC0ylEP7sd?=
 =?us-ascii?Q?vKxpHnWOhP60VsPEwdFPG1k/n3+GfagfPOWFvHCs4064qKXiJvQxukDqd9/E?=
 =?us-ascii?Q?SOUNB/yeMIZFSQQgklZH7UbZMvkyEPPjsiklRU95GDfnzxwXljN/pLw4FN0A?=
 =?us-ascii?Q?3AeNhjXBI+6U89uc+iavWbOjb8Pn+jz5p8TV+90ioSt4Mu9dhBFbKMrlUg7P?=
 =?us-ascii?Q?kTmJxIOW69KFzALLnFY6rp5MWg+nv9WmHZzx8NGDW1PpkTr5L0SM3TESqNHf?=
 =?us-ascii?Q?ZE/D1y3ayaMTMml4YnAOAF9wN25dXfy1dflm3/OZl6NnAH1CQuUd6ZnAztEA?=
 =?us-ascii?Q?j+bvLCAlXMhYm2iAjOA+EWK7u8gGRfvFmZNWDrsZSMMSGatbTW8HMauNFSgC?=
 =?us-ascii?Q?eSW0ODH/Ewu4ZqF9aSMqIDCd6fbH9Ln0YjAPCUsuh1ssym0ZZpwxej1hV50m?=
 =?us-ascii?Q?D08Ry6CjAUNuxvm5K9KZLyP/yKAW758NHUUpV46u3eTY5E660ArR/b7LBfNu?=
 =?us-ascii?Q?qYf2wECuQo+yqqg95Nzlqwm2zbZ/DxDB1zNlICj1mmKpGF8im+csOX9B4Ace?=
 =?us-ascii?Q?6rYvslgtrFHQ7FUZ9XHFw3YbNpNg/39U5iQmD/kCIciFWR9nw/xBOlmIo+/8?=
 =?us-ascii?Q?7BBZq3ZJirxu6mVyIQDhOvUCXftb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY5PR01MB10600.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a98231d6-2315-4e4a-bca3-08df258ad64c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 22:23:54.0193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEWPR01MB9088

This series addresses four AudioReach/Q6APM paths: PCM format lengths,=0A=
prepare callers which ignore STOP failure, a stale readiness query and=0A=
provider lookup, and V2 data completions which can publish false progress.=
=0A=
=0A=
The format fix keeps the target's channel-map and compressed serialization.=
=0A=
Failed STOP now returns before PCM fragments are freed or the LPASS backend=
=0A=
is reformatted. Readiness requires a successful READY=3D1 response and hold=
s=0A=
the published provider through the query and removal synchronization.=0A=
The data fix validates payload/period/address/map identity and lets the=0A=
PCM consumer latch a matching DSP error, report XRUN, avoid further normal=
=0A=
period/requeue processing and recover through a successful normal prepare.=
=0A=
Compressed clients keep their original valid-receipt status behavior.=0A=
=0A=
This does not define terminal graph cleanup, retry after a lost STOP reply,=
=0A=
DSP restart, token generations or APR callback draining. An early PCM error=
=0A=
while ALSA is not RUNNING is latched without taking a stream lock: a backen=
d=0A=
START may be waiting for a GPR reply under that lock. Other graph lifetime=
=0A=
and late-epoch problems remain separate.=0A=
=0A=
The fixed baseline is sound.git for-next=0A=
62d9f9ffdfd44e88010412bf8f23732f0a93a9be. The four patches applied together=
;=0A=
Clang 22.1.8 built audioreach.o, q6apm.o, q6apm-dai.o and q6apm-lpass-dais.=
o=0A=
through normal arm64 Kbuild without diagnostics. Actual-function tests with=
=0A=
modeled transport/ALSA dependencies exercise the old STOP/readiness faults=
=0A=
and both matched data errors and normal prepare recovery under ASan/UBSan.=
=0A=
They do not validate this target on hardware or prove teardown safety.=0A=
=0A=
Earlier quiet speaker playback belongs to a combined development runtime;=
=0A=
it does not isolate this series or establish production audio/microphone=0A=
capture. No board DTS, firmware, ACDB or per-device calibration is included=
.=0A=
Patches are numbered for review and apply together on the stated baseline.=
=0A=
=0A=
Jiaxi Zhang (4):=0A=
  ASoC: qdsp6: correct AudioReach PCM format lengths=0A=
  ASoC: qcom: q6apm: abort prepare when stopping the graph fails=0A=
  ASoC: qcom: q6apm: synchronize readiness query and provider lifetime=0A=
  ASoC: qcom: q6apm: recover PCM from failed data receipts=0A=
