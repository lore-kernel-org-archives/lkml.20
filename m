Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.73.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792586710;
	b=Uv7PunimVNAnIoRVh+wW1+jNS6/az9VHZhuduwXbWQSlZ9hB4jrYq0UST3OLX9S03zDx
	 Tm/xE1RlwzP6WR7FP1R2hwLWxTmXDuXQhxQ60RmF/6VWTjfO5Q5h/YmymFCKRkPoxoB6m
	 FgjLSi4gKT+UQb5YQ4gHPZt31wFIZrs4BrQY4uZqyu72jVzNHWaf55+RrEdH7AjHXI7xp
	 QKoXww6KCDqb4RQZ1/sJfXk4A6KrdliXBUD14JoLzu99DRIM7Z/CF0/vvewdy0OwkfMti
	 1btdH83xf0WAk8k92MM2CB8nrGDkP1NSZMpAZMKO7W1wbiG5UT+817Sla7Hy+qUKX/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586710;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=04C9XwvZi7ErK0NRL/KDI68U58R+8jzZaI90ELtU2+U=;
	b=rxkw0784HFmZku+P19+vFNBlc0aVHD0NqeArFDrT157gmnf4JcC2tD/TlSwtbdF8IomZ
	 ReV2ZnrT0unDRE63lIbSQ9BBzBKYJZIzySxNDWRo+PlkTTVfRE7Y9JEkwwtKfyXjKbsNk
	 oUtLtZI5koijJk9REvE1QBwSqMJHXUhsN2dW3Q6Eg4Nna3sQchASH2uzx9HiAQRjofWva
	 5IQvJvnfogEUkYCWK5wH9YIF0oXzcDpK/33WTIweZN3rIFf0A81E2x2IQ3J7wcWRZHgm2
	 gQWRHbLL4x5BM86OpMoq1CQ/a9jwHjlvTvLzoiUNfHmL1lPGi7QvDmEh0ro6njnEGyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=TOp93Rqs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.73.14
Received: from MEUPR01CU001.outbound.protection.outlook.com (mail-australiasoutheastazolkn19010014.outbound.protection.outlook.com [52.103.73.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D379606A319;
	Wed, 21 Oct 2026 12:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D379606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=TOp93Rqs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOmL1h/LQxnY6LIhieZcE6pXNrXdSKMYMbM0hhMOEzqcW3eWfP/DKDHoh08uLU6tlCnkIQq6tM+S3R8g6lSRUQzuZ8nXL9CuLHLRtPhSGDsV3HwZHfsPnqtBE3ltVwsRu/gWzqYfhF4ssI3ZQr1bFQ7GiC2H7AnzrchGEq29rplMSENI900Eq4DXzzH2nXMDOvvP5mORCHpCBn/veyeuf1bUhpWhawixb4xxIz+M37tw615d76CXtF3lkLPKxk74VOsW0Z3W2MeYJ7Hmd6dHoKiNEf4H8iAZm21e6UwD/FrfwYbEWVzNS8hjbq48zgvxqqGYj+u/rwVN3VQN0Fh3Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04C9XwvZi7ErK0NRL/KDI68U58R+8jzZaI90ELtU2+U=;
 b=MV+pmVyUzgHnAUkMMtOMw/0TFupY5iRg1GKGVnh8Gu/k7USAQNatKNJpj9ifo4N7iGSu3bOz6SOLP/RUc1mq7eP5qJrWqFOPlOAYsqf4ZHfq7GOa3ov1KzhZ1KE8f/cltcemMo/YF2kc0MK6POtT9RxSn1MZWVA6a8Dk2bBZUwJ/lxoxfRqN0OuPpUUYoCmV7MjXFh5PxsoUC1AeNpPUyVzBWSTyYwZdG2G3GfVwQYJOnrbQAcO9lAsVqNEHg6Hsyco82zE8DTdYcYt5C2qNc7gToSaWOIzLX/m1OP/bPEOwV3EdVIXKLi31XXlJ1rVCP452v1E0f96TwBgkFN6+1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04C9XwvZi7ErK0NRL/KDI68U58R+8jzZaI90ELtU2+U=;
 b=TOp93RqsNmAJ4/ROD0ulohfWWfRdfHWi5w49X8Q8xZy6G3tuiBdNxi9tVvGwcv4LIs/uSSsz4kk9655DoFgXKX77/bsegN9Yxoz9V0JjXbKwD6TWer0++XNCneCTI+/QpeqWKqGf9rjcvV9q140QronCG4Zf4UTqomY+U900S08eJz2kL0Nh2cEYGVlfyaeZht0AnLkdCjB0av8TogUy5CyLHZnLUzy7AHc7vEfmbRHjRmzFMJnGB4cB1HMTzNjeHJ15m7X+9HftbT9KTjducvMRHrtFJYw5CPuArTQvuJmmxzD2SX3VrNABJDmBnO3XgM+Cm/G3Ge+RoxUr1wgjxw==
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com (2603:10c6:10:32c::14)
 by SY7PR01MB257422.ausprd01.prod.outlook.com (2603:10c6:10:378::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 12:45:01 +0000
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19]) by SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19%3]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 12:45:01 +0000
From: Zhang Jiaxi <Z1529105815@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH RFC v3 0/2] arm64: dts: qcom: introduce minimal REDMI K90
 Ultra support
Thread-Topic: [PATCH RFC v3 0/2] arm64: dts: qcom: introduce minimal REDMI K90
 Ultra support
Thread-Index: AQHdYVn9pO2LNVupgUOFYBOBk6N9eg==
Date: Wed, 21 Oct 2026 12:45:01 +0000
Message-ID: <20261021-b4-warsaw-minimal-usb2-v3-0-9f4213ab83ef@outlook.com>
Reply-To: Zhang Jiaxi <Z1529105815@outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY5PR01MB10600:EE_|SY7PR01MB257422:EE_
x-ms-office365-filtering-correlation-id: cb9c7d66-1dc0-4e38-c1ca-08df2f711f82
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799012|31061999003|8062599012|8060799015|19110799012|25031999004|5062599005|22091999003|24121999003|24021099003|39105399006|38102599003|4140399003|22141099003|25010399006|102099032|26104999009|3412199025|4302099013|440099028|1602099012|26121999007|40105399003|10035399007;
x-microsoft-antispam-message-info:
 =?utf-8?B?RFI5eXpMbFhCYW9QSGdsMkU2cGcwMGFjNUZwY3pCSC9pb2NCRDI4SnRISFVs?=
 =?utf-8?B?R3hlQU5jemhWZENCYnh2WmlxYW9KR3Z4M3hXQit6RW03cXpvV1g5aVRUWmVk?=
 =?utf-8?B?a25NeHRVbTV5ejNUNWx2TjdHYjM1YW5mcG5nZHF1KytmUGl3MStCRWVqVWM0?=
 =?utf-8?B?K1dVbFpuNnNGTi9HTEZFSU9ZZXZKb0w0U282OExpek1tL2NCT1NBdURPZFpx?=
 =?utf-8?B?N1B2bCtLVTc4TUM5VXFXRjlNSHp5K28vanZnaW1Fb3U0Z2dJdTNvSnZJSXcw?=
 =?utf-8?B?akRuM0dHYjhXdFRZakxaTldyYU9HRzIwWm1kODBjeHYwRlZjRWlXN1BYWkJz?=
 =?utf-8?B?QTMrM2s0SU4wY25wUCtHY0VWQnN3cDJvYkZvaGtEMGZWaUtLVHBkVU9MY2ZQ?=
 =?utf-8?B?NnFQT0xuc2VacEVOU1pEa3VNamFXUWU2VUVjWERJY0lsaUIzeXg2Y1piN203?=
 =?utf-8?B?ZVVEN2YrQVRGVzJGb1hPWElDa2hUbHRVYi9TbW92eURKT1BYRlZXQ1VWZU9x?=
 =?utf-8?B?b0J3UXZCeGtLNkVVa0RDdUtYUFg1STRibWplTHVUMHVxK09Sb01rTUdybnBr?=
 =?utf-8?B?UFJEZ2MreEYrRUJyT2RNMU10TUsyM2pVS05RcWdEKzRDMkwwdHkrZkFoVnpN?=
 =?utf-8?B?NVIzUlA2bldvN1pMRVVrOHRpTmJ5di9JcXlwN2VMajFPTTlyQmR2TTlVaC9U?=
 =?utf-8?B?L1ZWWWVXM05JVnJRbWhJYndvdk1QWktKUDRFcktQTmxpZDZSdVZwS0kzWEdH?=
 =?utf-8?B?YTQ5YnZJV1FxejhsTDJkWlQ5dGRRSHJXajcwT3drZ0cweFFONm9QVWlpUEdG?=
 =?utf-8?B?ckJTYzA3VURTbzA2bzMvNEZDV3dwUmI4WHJLZUhDaDFDeHJEdWRhQUpNMjVO?=
 =?utf-8?B?TmRrZWdEY0FsVFhNL1p4Vko5Zm1WN1ROY2hvMFZDMDVMOWNzak9xc3JTa1c1?=
 =?utf-8?B?TnkzR2VtNGxxeUVoWWF4Z3JMRVg2NTVIbUJlUEF3OVNuUFNMY1BHNlhYUkJu?=
 =?utf-8?B?dlU1L29ieThiYjNhdDY0SEQraCtDa1lqMlQzVmd6WWoxQVI0QUFVRVhNL01h?=
 =?utf-8?B?b0VGa0l0cUlzeHJiNndMR05VTzBEYjUyVlErbkNZTnB4cXRrbVJna05KYUZk?=
 =?utf-8?B?Rm0rdlhMV0JpTEloZWwveEdjbFVsWStvVjZVVnBWRFJoZ1FDRGxiWlZ1OEt4?=
 =?utf-8?B?U0dSTjJicFd4UHk1VEl2NkhnTkMxb0J2Yi8xc1dQNkpuOW5rY3ljekkvVzQ1?=
 =?utf-8?B?ZGFzNnZ1ZXZ4YVc3SDNGRFpzSXMxOERyQzhnY2VHK2dPeVI4VGJzekhpTDdP?=
 =?utf-8?B?TXVRUGIvMkhMOXpDMEk2WGF5K29uTW9ZQWJsdTlDdEs0RTNEeENUWUVoZi9O?=
 =?utf-8?B?Qzh0TkI4Q2RCclR3VHdQQTdsbmpkRjJQZWxnNFNJdjQ2dFhsZnVyek9wWGQv?=
 =?utf-8?B?MmdubEpsbS9mZDczbG50dXl3QUJzclViM0QwU0RmbmFkK3RSb2FRSTU4ZEdR?=
 =?utf-8?B?eHJXQmUvSU4weXp1MjhOYzZiN05xbzN1WmVObWlrakJNRkpzbjZsUjRCWGFw?=
 =?utf-8?Q?C09h3DBiJev4XyVydiMRT2J03ZIZHNKTF0tXw8F6ZCDsp4?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NzdaNjNwcjc2blJ4QlJ0MjRPbWdiRndxY243RFJzamM0Y3hDREhWY3NkMER5?=
 =?utf-8?B?ZmFhQzJmYklCVWtwR3VpTkR3WU9RTGJvdHVncUs5SElSZ2NkdUd4R3g1L003?=
 =?utf-8?B?UTV6L20yeG9yOEgzWXBDNzg1OG56TlBjZ2lCSkxieU43enJMQzROeXZkTU9q?=
 =?utf-8?B?b2tBemQxZ3g0VGFwdnEyOTlNdE5ORERvalVoM1RaRG9PZm9DZkxHc2lsUGVZ?=
 =?utf-8?B?Ky9GT0RyYVdZMnpweGtDdnZZSHpVQnZoeVF3NU1TRFg3ak9PVXMycU1ENVcz?=
 =?utf-8?B?NDZGZGFTN2NRR1ZCMUFxeS9TbXBSektiR2FQM0tHb1pyd2k3RnVFS24xaFdQ?=
 =?utf-8?B?OUZkUnlicEdsVytFQkFwOXhlNjI0QVl3U1UvSUZFY3k1VHBEVDhmWGxldnM3?=
 =?utf-8?B?SWdBMlhYbW9XWjExWjkrMTA5Nm5OYng0akFUdWJ0SFRYaWNDbnNFSEJVRGhv?=
 =?utf-8?B?bXpjcWFIUWhmcDV6dVNGVlg4eW1KUWtRLzJEVWxlcnVPMjZHQ3k4ZkRHejcr?=
 =?utf-8?B?c0s0NlpKRm1KRDhraE1RRHgxU3JLSG01cVQ5VlllTFJ3Rnc1UU1MNFFDNHhB?=
 =?utf-8?B?Q1dCSVV1WFFaUE5CdXkwdTVhWWY0akxTd3I2c0ZCamZ5YkhKQm9BeE1PUjlH?=
 =?utf-8?B?N056Wkc2ME1Db1RtbXJNREZkSERkZzVyTndIZzhIZlp5WUpZeG1xS1Z5dnZZ?=
 =?utf-8?B?K3h4WEMzY0pBeTJHbzVFZU1FMnZScCtHdFowT1NtVDcyMStXc0htNmpmMGx1?=
 =?utf-8?B?ZGliUCtCTWUwdkJGSGRTOUc5VXNQcGM2Vi9JMVYrYkIxeEk2UnpaRmxhUkgw?=
 =?utf-8?B?ejROMDFqU0luaFdMM296aGpVOFlOYWtUblZlQVdXYVg1WGNTeHdsZGdjMGlW?=
 =?utf-8?B?eUx2L0Z4ejhaWEdzK2FiUmtIZ2dCZHdPVW1pSlMrdWZ3QlBXV3lXRjlsSUZr?=
 =?utf-8?B?K29aMnN1WitGUmhuRjJNQk1NUUxuWmVEdDcrRGVsL2t5S0VaWEVRREdCQlhV?=
 =?utf-8?B?WXFDVHNvenkyNXphV1I3Yjl3dWNndTRLNHFzVkxoUDVkWmYvTFgyWnhkZnFr?=
 =?utf-8?B?U3pYNmgxdW54WlNsaFpwT2djbmlwaHRBZlo2alpZd1Z6S1lJSlZINFg5ZTVS?=
 =?utf-8?B?MnhiZ1VJUDNhWnJzNU5xMFl2SUo1Q0xzbzFGRzg3Wlh2eWlwNTdLY1lCU3lK?=
 =?utf-8?B?cmFGclNIYTJxUTZMRGg3azUxWVRsL0Z6NTlybnNqdUpRVE5jWitIK0xycDBk?=
 =?utf-8?B?dkhKaHFMMDlZMklyYktaZ0ZEK2FXMlh5UVRRYUZwSXZkZVBvMnpmNzhZUTZ3?=
 =?utf-8?B?TXNlOXZYN3JOQVVya1orZUhnaVlCUmg4MHVRNG9MSlN2OVpzZng3SXhFNVh0?=
 =?utf-8?B?UFMvcTZhZnlKaHpGN1F1VWl0WFg4SW41aWc5c0VKVXpDOU9pKytxSFBmaW9D?=
 =?utf-8?B?SlgvQVo4dEs0cFU2UTA1TytTTlBrSmE4b3dYSThoZElXYkFjbWdMV0pCRTBT?=
 =?utf-8?B?TTlYSWJXajVKM1F2K0tQazZEMXRNWkRPR2RFSUNQUWsrV2ljaW5pQ2hhNEUw?=
 =?utf-8?B?MWJPejMzTHZ5bjYwZXEvNWVoTGdiMWxOa3pjdTdmS2ZMdnpWT21hWTFwdm8x?=
 =?utf-8?B?R2ZyOXprTHNKSXdGQ3NDWk1JV2ZiUHNHSjA5RDFzek5JRWtEc1RTTTJvNU1B?=
 =?utf-8?B?US9VbklIVnRKbmljT1piSHd3VDNvdDBWQkVrUXZJUUloZFBiY0xEalhJQzRq?=
 =?utf-8?B?emFseU5PUnZodklIZzYwQVF6M0xUQU42VHpLTkxPY3FSTzhLVVM3N0RsSDMy?=
 =?utf-8?Q?K+MClMQgI+MyYrUakhi9XCjIJlZz00fhu1y5s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4B331F87AB2C0408EF91500E0FFDA25@ausprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY5PR01MB10600.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9c7d66-1dc0-4e38-c1ca-08df2f711f82
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 12:45:01.5772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7PR01MB257422

QWRkIGluaXRpYWwgY29yZS9VU0Igc3VwcG9ydCBmb3IgdGhlIFJFRE1JIEs5MCBVbHRyYSwgd2hv
c2UgWGlhb21pIGludGVybmFsDQpjb2RlbmFtZSBpcyBXYXJzYXcuIFRoZSBjb21wYXRpYmxlIGFu
ZCBEVFMgZmlsZW5hbWUgcmV0YWluIHRoYXQgY29kZW5hbWUuDQpUaGUgdHdvIHBhdGNoZXMgY2hh
bmdlIG9ubHkgcWNvbS55YW1sLCB0aGUgcWNvbSBNYWtlZmlsZSBhbmQgdGhlIGJvYXJkIERUUy4N
ClRoZSBiYXNlIHJlbWFpbnMgdG9ydmFsZHMvbGludXggNmMzNzdkMTlkNGE1MTE2ZDliZWM1MjAz
YWEzYzZjMTE1MjNlNzg5OC4NCg0KQ2hhbmdlcyBzaW5jZSB2MiwgZm9sbG93aW5nIEtvbnJhZCdz
IHJldmlldzoNCi0gVXNlIHRoZSBtYXJrZXQgbmFtZSBpbiBtb2RlbCBhbmQgc29ydCBib2FyZCBl
eHRlbnNpb25zL2Nsb2NrIG5vZGVzLg0KLSBSZXVzZSBwbWloMDEwOC5kdHNpIGFuZCByZXRhaW4g
V2Fyc2F3J3MgcmVwZWF0ZXIgc3VwcGxpZXMgYW5kIHR1bmluZy4NCiAgVGhlIEthYW5hcGFsaSB2
YXJpYW50IGluc3RlYWQgYXR0YWNoZXMgdG8gc3BtaV9idXMxOyBTTTg3NTAgaGFzDQogICZzcG1p
X2J1cyAoYnVzIDApIGFuZCBpdHMgcmVmZXJlbmNlIGJvYXJkcyB1c2UgdGhlIGdlbmVyaWMgaW5j
bHVkZS4NCi0gQ2xhcmlmeSBmaXJtd2FyZS1yZXNlcnZlZCBHUElPcyB3aXRob3V0IGludmVudGlu
ZyBhIHVzZSBmb3IgNDgtNTEuDQotIEV4cGxpY2l0bHkgbGVhdmUgdGhlIHByb3Zpc2lvbmFsIHBl
cmlwaGVyYWwgcmVzdHJpY3Rpb24gb3BlbiBmb3IgcmV2aWV3Lg0KLSBNb3ZlIHRvb2wtdXNlIGRp
c2Nsb3N1cmUgdG8gdGhlIGNvdmVyLCBmb2xsb3dpbmcgY3VycmVudCB1cHN0cmVhbSBndWlkYW5j
ZS4NCg0KUHJldmlvdXMgdjIgc3VibWlzc2lvbjoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
MjAyNjEwMTYtYjQtd2Fyc2F3LW1pbmltYWwtdXNiMi12Mi0wLTFiMDM0OTYzOTZiNEBvdXRsb29r
LmNvbQ0KDQpUaGUgZ2VuZXJpYyBQTUlDIGluY2x1ZGUgYWxzbyBpbnRyb2R1Y2VzIGl0cyBHUElP
IGNvbnRyb2xsZXIsIHRlbXBlcmF0dXJlDQphbGFybSBhbmQgdGhlcm1hbCB6b25lL3RyaXBzLCBz
byB2MyBpcyBub3QgZXF1aXZhbGVudCB0byB0aGUgcHJldmlvdXNseQ0KYm9vdGVkIHJlcGVhdGVy
LW9ubHkgRFQuIEFsbCBleGlzdGluZyBkZXZpY2UgcHJvcGVydGllcyBleGNlcHQgbW9kZWwgYXJl
DQp1bmNoYW5nZWQgYWZ0ZXIgcGhhbmRsZSBub3JtYWxpemF0aW9uOyB0aGUgc2V2ZW4gUE1JQyBu
b2RlcyBhcmUgdGhlIG9ubHkNCmFkZGl0aW9ucy4gVGhlIDI0Ni1saW5lIHNvdXJjZSBjb21waWxl
cyB0byBhIDEwNDM2Mi1ieXRlIERUQiwgU0hBLTI1Ng0KMGMwYzJiZjBhZjNlMTJkNGJlN2QzNzE2
OThmYjcxNzhiMTM5MTJlNGM3YmY0MjRiZGMxZDRkNjRlMWNmMWUyOC4NCkl0IHBhc3NlcyBkdHNj
aGVtYSAyMDI2Ljkgd2l0aCB0aGUgY29tcGxldGUgcHJvY2Vzc2VkIG9mZmljaWFsIDZjIGJpbmRp
bmcNCnNldCBhbmQgV2Fyc2F3IGVudW0sIHdpdGggemVybyBkaWFnbm9zdGljcy4gRFRDIGhhcyAx
OCBpbmhlcml0ZWQgd2FybmluZ3MuDQoNCk9uZSBSQU0tb25seSBib290IG9mIHRoaXMgdjMgRFQg
cmVhY2hlZCBCdXN5Qm94IFBJRDEsIGJyb3VnaHQgYWxsIGVpZ2h0DQpDUFVzIG9ubGluZSBhbmQg
ZXhwb3NlZCBhIGNvbmZpZ3VyZWQgaGlnaC1zcGVlZCBVU0IgRXRoZXJuZXQgZ2FkZ2V0LiBBbGwN
CnRlbiBvcmlnaW5hbCBjb3JlLWRyaXZlciBiaW5kaW5ncyB3ZXJlIHByZXNlbnQ7IFBNSUgwMTA4
LCBpdHMgR1BJTywNCnRlbXBlcmF0dXJlLWFsYXJtIGFuZCByZXBlYXRlciBkcml2ZXJzIGFsc28g
Ym91bmQuIFRoZSBQTUlDIHRoZXJtYWwgem9uZQ0Kd2FzIHJlYWRhYmxlLCB3aXRob3V0IGVzdGFi
bGlzaGluZyBjYWxpYnJhdGVkIHRlbXBlcmF0dXJlIGFjY3VyYWN5IG9yDQp0aGVybWFsIHByb3Rl
Y3Rpb24uIFRoZSByZXBvcnQgd2FzIGNvbGxlY3RlZCBhZnRlciA0MCBzZWNvbmRzOyB0aGUgZ3Vl
c3QNCnJldHVybmVkIHRvIEFuZHJvaWQgQSBhdCB0aGUgOTAtc2Vjb25kIHRlc3QgYm91bmQuDQoN
ClRoZSBuYXRpdmUgdGVzdCBlbnZpcm9ubWVudCByZXVzZXMgdGhlIHVubW9kaWZpZWQgNmMga2Vy
bmVsIEltYWdlIGFuZA0KY29uZmlndXJhdGlvbiAoU0hBMjU2IGQyMDUwMGJiMWVlODZmMzIxOGYz
NTFiY2EwMjc0YzIwZjE3N2MzOTBiMjZkMTFiZjU3NzRjZmYxOWE3OTA4NmEpLg0KQSBzZXBhcmF0
ZSBuYXRpdmUgQVJNNjQgYWRhcHRlciBzdXBwbGllcyB0aGUgZXh0ZXJuYWwgRkRUL2luaXRyZCBh
bmQgaGFuZGxlcw0KdGhlIGZpcm13YXJlLWluaGVyaXRlZCB3YXRjaGRvZyBiZWZvcmUgTGludXgg
ZW50cnk7IGl0IGlzIG5vdCBpbiB0aGlzIHNlcmllcy4NClJ1bnRpbWUgRFQgcHJvdmlzaW9uaW5n
IGlzIGxpbWl0ZWQgdG8gbWVtb3J5LCByZXNlcnZlZC1tZW1vcnkgYW5kIGNob3Nlbi4NClRoZSBz
b3VyY2UgY29udGFpbnMgbm8gY2FwdHVyZWQgUkFNIG1hcCwgcHJpdmF0ZSBmaXJtd2FyZSByYW5n
ZSBvciBBbmRyb2lkDQpjb21tYW5kIGxpbmUuIFRoaXMgZG9lcyBub3QgY2xhaW0gc3RvY2sgYm9v
dC12NCBkaXJlY3RseSBib290cyB0aGlzIHJhdyBEVEIuDQpUaGUgdGVzdCByZXRhaW5zIGNwdWlk
bGUub2ZmPTE7IGRlZmF1bHQgaWRsZSwgc3VzcGVuZCBhbmQgb3RoZXIgcGVyaXBoZXJhbHMNCnJl
bWFpbiBvdXRzaWRlIHRoZSB2YWxpZGF0aW9uIHNjb3BlLiBUaGUgbWF0Y2hpbmcgY29uZmlnIGFu
ZCBidWlsZCByZWNpcGUNCmNhbiBiZSBzdXBwbGllZCBhcyBzdXBwb3J0aW5nIG1hdGVyaWFsLg0K
DQpHUElPcyAzNi0zOSBhbmQgNzQgaGF2ZSBiZWVuIGlkZW50aWZpZWQgYXMgTkZDIGVTRSBvbiBR
dWFsY29tbSdzIFNNODc1MA0KTVRQL1FSRCByZWZlcmVuY2UgYm9hcmRzLiBUaGUgV2Fyc2F3IE9F
TSB0cmVlIHJlc2VydmVzIHRob3NlIHBpbnMgYW5kIDQ4LTUxOw0KdGhlIGxhdHRlcidzIGJvYXJk
IGZ1bmN0aW9uIGhhcyBub3QgYmVlbiBpZGVudGlmaWVkLiBBbGwgcmVzZXJ2YXRpb25zIHN0YXku
DQoNClRoZSBkb3duc3RyZWFtIFdhcnNhdyBEVCBsaW1pdHMgVVNCIHRvIGhpZ2gtc3BlZWQsIHN1
YnN0aXR1dGVzIHRoZSBVU0IzIFBIWQ0Kd2l0aCBhIG5vcCBQSFkgYW5kIGRpc2FibGVzIHRoZSBV
U0IvRFAgY29tYm8gUEhZLiBJdHMgaW5oZXJpdGVkIGNvbmZpZ3VyYXRpb24NCnN0aWxsIGhhcyBP
VEcvcm9sZSBzd2l0Y2hpbmcgdGhyb3VnaCBVQ1NJLiBUaHVzIGRyX21vZGUgPSAicGVyaXBoZXJh
bCIgaXMNCmEgcHJvdmlzaW9uYWwgcmVzdHJpY3Rpb24gaW4gdGhpcyBSRkMsIG5vdCBhIHBlcmlw
aGVyYWwtb25seSBoYXJkd2FyZQ0KY2xhaW0uIFRoZSBjb25uZWN0b3IsIHJvbGUtY29udHJvbCBh
bmQgVkJVUyBwYXRoIGFyZSBub3QgZGVzY3JpYmVkIGhlcmU7DQpjaGFuZ2luZyB0aGUgc3RyaW5n
IHRvICJvdGciIGFsb25lIHdvdWxkIG5vdCBjb21wbGV0ZSB0aGF0IGludGVncmF0aW9uLg0KSSB3
b3VsZCBhcHByZWNpYXRlIGd1aWRhbmNlIG9uIHdoZXRoZXIgdGhlIHJlc3RyaWN0aW9uIGlzIGFj
Y2VwdGFibGUgZm9yDQp0aGUgaW5pdGlhbCBSRkMgb3IgVVNCIHNob3VsZCByZW1haW4gZGlzYWJs
ZWQgdW50aWwgZHVhbC1yb2xlIHN1cHBvcnQgaXMNCmRlc2NyaWJlZCBhbmQgdmFsaWRhdGVkLiBH
YWRnZXQgdmFsaWRhdGlvbiBkb2VzIG5vdCBjbG9zZSB0aGF0IHF1ZXN0aW9uLg0KVGhlIFdhcnNh
dyBkaXNwbGF5IERUIGFsc28gZGlzYWJsZXMgc2RlX2RwIGFuZCBvbWl0cyBEUCBmcm9tIGl0cyBj
b25uZWN0b3INCmxpc3QuIFBoeXNpY2FsIFR5cGUtQyByb3V0aW5nIGhhcyBub3QgYmVlbiBpbmRl
cGVuZGVudGx5IHZlcmlmaWVkOyBVU0IyDQpzcGVlZCBhbG9uZSBkb2VzIG5vdCBlc3RhYmxpc2gg
RFAgYWJzZW5jZS4gTm8gRFAgc3VwcG9ydCBpcyBwcm9wb3NlZC4NCg0KSSB1c2VkIENvZGV4L0xM
TSBhc3Npc3RhbmNlIGZvciBzb3VyY2UgYW5hbHlzaXMsIGRyYWZ0aW5nIGFuZCBob3N0L2d1ZXN0
DQp0ZXN0IHByZXBhcmF0aW9uLg0KSSByZW1haW4gcmVzcG9uc2libGUgZm9yIHRoZSBzdWJtaXNz
aW9uIGFuZCBpdHMgRENPIGRlY2xhcmF0aW9ucy4NCg0KLS0tDQpKaWF4aSBaaGFuZyAoMik6DQog
ICAgICBkdC1iaW5kaW5nczogYXJtOiBxY29tOiBBZGQgWGlhb21pIFdhcnNhdw0KICAgICAgYXJt
NjQ6IGR0czogcWNvbTogQWRkIGEgbWluaW1hbCBSRURNSSBLOTAgVWx0cmEgZGVzY3JpcHRpb24N
Cg0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sICAgfCAg
IDEgKw0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9NYWtlZmlsZSAgICAgICAgICAgICAgICAg
fCAgIDEgKw0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zbTg3NTAteGlhb21pLXdhcnNhdy5k
dHMgfCAyNDYgKysrKysrKysrKysrKysrKysrKysrKw0KIDMgZmlsZXMgY2hhbmdlZCwgMjQ4IGlu
c2VydGlvbnMoKykNCi0tLQ0KYmFzZS1jb21taXQ6IDZjMzc3ZDE5ZDRhNTExNmQ5YmVjNTIwM2Fh
M2M2YzExNTIzZTc4OTgNCmNoYW5nZS1pZDogMjAyNjEwMTUtYjQtd2Fyc2F3LW1pbmltYWwtdXNi
Mi00NDgwOGRmOWYyZjMNCg0KQmVzdCByZWdhcmRzLA0KLS0gIA0KSmlheGkgWmhhbmcgPHoxNTI5
MTA1ODE1QG91dGxvb2suY29tPg0KDQo=
