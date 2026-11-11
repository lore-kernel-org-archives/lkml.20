Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794400814;
	b=WCSv3jdEhb5VT26wUhXgDQPXMxcfod2vHJenzY9l4NKK6mV6ydCjEoXruV7dH1B9/dn3
	 bm4R69WL9N+kfp2cDbVvcFrZx7mB6HoMswfA29ZK/ImvpBxfWPRATjN4wGFWr3DTv/BnB
	 ab2n8Yj7P2enT1mB6farBExffS0Z41DvM0KOVdXicJpEzE9NnenzKDLouhmXXDyvGVe6g
	 qCXnhP/ypX9HdbvxycNjL431dbrnEtwlaEpUnxFks17v00peCdvkNP8oMdTeXwMlphiju
	 e1lmgG6qgNP6yHaG73L56yjcKNA54BvJ+FmhFWx2w1udDLxSbZafKCSSBE0DvRbiMWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400814;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ld-processed:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XqMiudwgCaNRgHyoXX6baDRuSUE6If2B9QZevNsxSbw=;
	b=O6bQnI/rq8lq9ZzdayNNKdnqy8YU4QZnhnKJlFqVPxqNImUKXf3Q2BcAeIcJ5rNFDgiM
	 LSiqqHnkQN0RZKnOTm9RUPJ1CLfoV2uUKJjuJpD6m2ipPQH/pTBGz+RxHtWtIxfV8DE/O
	 s56uFcoBI7mFx5no+R37Z2aseXIYeSPRzMndfo1ODv/ZmcqhzgX4XAjQs8ch83hmyuy0B
	 ypu6rVZgBhsCiFNq+45cahcU4Oi93+sgz5wSx/5kdMwmFe7dBSsR0ldWz+9PVJuoRTBNK
	 Abc8gGBvfTyZG4ZUv/RPHo/bFoAC6XzgYbuh4citTh6dwlmCRONBu6Fxp6TdcAkdpJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=m0XEkeH6;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=Ys36W07+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9CA606A321;
	Wed, 11 Nov 2026 12:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA9CA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=m0XEkeH6;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=Ys36W07+
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCX7id693260;
	Wed, 11 Nov 2026 06:40:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=XqMiudwgCaNRgHyoXX6baDRuSUE6If2B9QZevNsxS
	bw=; b=m0XEkeH6IjjA4vLLPemdU82qcwWG4zIpGt+1IIu1LtZUmkQFLlR6aqhpc
	KAM3XrTMNKP+4F2E0hnLO/hamedBwrcnqtGAnCKoWtYp3W/067CY+U2pc1/3x/2y
	GPASk8og/xPLP2MMs1OGWiHx8iybN8suBO9FiOx4JwMjMd0BhuRJQ0BfKM0NH5hI
	zDNQbg3alMXrAia3kS1mbmv9k9yagai9zfxYQ6QreFPVbLIo1sB/dPUQ/+t763BG
	GNtlcksE3UE7T9rdmchU6FGDTNiSh11ZMr/jLWfWZEbplsermn1wWS0uLphrvECi
	WhZKJd2J356sVgteobd45R+LBbXgQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012022.outbound.protection.outlook.com [52.101.43.22])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hv9pjvpye-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 06:39:59 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jATN4lRrBrEH57lfjOKFnyVGTdvMqORHt6fN50jtz1aB7n3KBOCXCndhRVVkgi4cUqB3UcZclyK52V7cYWbnNwcJafFQWAcVxi5HV25OseDLgUxPtMjWL40JRiQQ/2wVDZteGzs0SNUV/0aJi/DdVKivSkvRnWVwjO0VPRL9zxW6MFMwuUumQWItAFHY6YIgb/hxA/JiY5WOY21JFnztICibQwW+zsIvxEdM4Ome3wmmQTvC9XABirY0Flqf6EfQB7LRqeZkt+2tC1tDiVf8mqVPgYxqOoCMWsyfFt6TLOOK0OGpvBd95HIeptHoRKah3eTR1vHOO7EDrK9fIUolrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqMiudwgCaNRgHyoXX6baDRuSUE6If2B9QZevNsxSbw=;
 b=wz7+oTKL58B8/xqumyh66xvda/mdIxr+yEI3v+jFnv09IhtEgG/pINPJi0J7vQkHRtxne5v/ewgHlDDX0RUxkwyUgtGBHcER4t7XiL47smb6C84ifVCCIIB1ZJBFJ6Nq2Pw3fFx/+5uv4bjlbMpUNSj/DmtllSNBP6zIl0jecRhg7iVCU5XOZG5Aj7LnV6lLt0/e6wsEqvwOg4ArXwJ/d8pbLqAbL/cuFjj21KXfuywn1UIyeuJdZ0w2u4SuYbvRXoCvYjWqdD2OExbjlCtJCmbtI9uBXLs0ciaIno+nO3Mm5XrVXkKDRUDYF9cO1eqI0kmtJzx/zv+4ha6ysgDh6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ti.com; dmarc=pass action=none header.from=ti.com; dkim=pass
 header.d=ti.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqMiudwgCaNRgHyoXX6baDRuSUE6If2B9QZevNsxSbw=;
 b=Ys36W07+qRTC2NO0vgEupuf947NFeQyR9U6eM9L48VLZgs6BEqQA4i7fEHxlkxlp0wTnjOCPL8Z+3ilIv6cLnhb/vPE7X9r9uHMbruYFVboOeV8UeSdDyNgQvqSfHMVzMEMYNUx+hb7NhRzKgLc78x+cec8Frh/Bnok+95udTps=
Received: from BN8PR10MB3652.namprd10.prod.outlook.com (2603:10b6:408:ba::10)
 by DS7PR10MB5118.namprd10.prod.outlook.com (2603:10b6:5:3b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 12:39:54 +0000
Received: from BN8PR10MB3652.namprd10.prod.outlook.com
 ([fe80::86d1:377b:3bec:884a]) by BN8PR10MB3652.namprd10.prod.outlook.com
 ([fe80::86d1:377b:3bec:884a%4]) with mapi id 15.21.0592.010; Wed, 11 Nov 2026
 12:39:54 +0000
From: "Thakkar, Devarsh" <devarsht@ti.com>
To: "Brnich, Brandon" <b-brnich@ti.com>,
        "mchehab@kernel.org"
	<mchehab@kernel.org>,
        "hverkuil@kernel.org" <hverkuil@kernel.org>,
        "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "Willis, Kendall" <k-willis@ti.com>,
        "jai.luthra@ideasonboard.com"
	<jai.luthra@ideasonboard.com>
Subject: Re: [PATCH v8 4/4] media: imagination: e5010: Enable autosuspend for
 runtime PM
Thread-Topic: [PATCH v8 4/4] media: imagination: e5010: Enable autosuspend for
 runtime PM
Thread-Index: AQHdcTExF5FlX2fJq0ugvrFnlTX5Hrco0RsA
Date: Wed, 11 Nov 2026 12:39:54 +0000
Message-ID: <b69088b8-d591-4622-a1cf-3a0efd2350da@ti.com>
References: <20261110163247.48712-1-b-brnich@ti.com>
 <20261110163247.48712-5-b-brnich@ti.com>
In-Reply-To: <20261110163247.48712-5-b-brnich@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ti.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR10MB3652:EE_|DS7PR10MB5118:EE_
x-ms-office365-filtering-correlation-id: 4efdd27d-c583-4beb-0164-08df3ff0e346
x-ld-processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261028144727099003|261026121527099003|261026140227099003|261102123227099003|261021121427099003|261021123027099003|261022115727099003|261021135927099003|261022105027099003|261022075727099003|38070700021|4143699003|56012099006|10067099003|22082099003|261009221227099003|18002099003|261009220027099003|261009223027099003|261009223327099003|261009221727099003;
x-microsoft-antispam-message-info:
 lMaYfjomBN455AuPiK3yl5wekU61ECFDVNl7cjuZVOgLZSnVhZtCqQU3MKhP2ftrX9IfhmwREVHGt4wjrPIMVjnMcx/2K1gxJO8pEsvsnwAhCr8uDgC42sS1tFwnwK2MvXwXlzFOO2Y/zv07E597tmi8hvBT55p9b8tqV2WQnmrk7SxGl2cJOGl35kjtYLAUnWbbpCXKvN1Z6tNaEjee3sqa47fBk+SPrD3mc4dOpkF/Z9Dn0A5R1qZs5CB/oyGv40FxtN+3OorE4DTJ3S3QU2XzRYNpRqddAp4Rh3lSSj3bzDiTlhoZBKvpmg6+lr9pGefPk4OL81EpRzTEvLnw2jY91vCWresKl9ZkCtmTPkaXZwm2hJBAgvWlaRg/JFoFYJFtnp8DzRbYUze1zNGmOl4ewBuF4/VmQVCxKb0+CRvB/gJqN/GDAOvFhEOi2PFXbdUTtORP0q8le/MchNW/A+xsBuQXhgi/3q+8GLw0TECwVlSURzyG70ul6c1URAmyYIbQQ3qWPsiED1FuzpuHiTU9z4AgrNtunVkHQwCD5RZkOJxIDhsDe4aLupAOjrWbWevqoYT4Sxc6p9mp/fJAHKlKOjAwuMRaWCOZODZZo/Yw0Zw7shPAPRdpPJK7ZyOy/X86ZAK8yhi6SqnVy+JcaBCbh8GXnf547S9CIB79EkueX0ibh4TChVOxGYJrB9ILKzYESkUsyGbMgap3hGpgHEOkcq58gE3UMtd90/5BbXk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3652.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261028144727099003)(261026121527099003)(261026140227099003)(261102123227099003)(261021121427099003)(261021123027099003)(261022115727099003)(261021135927099003)(261022105027099003)(261022075727099003)(38070700021)(4143699003)(56012099006)(10067099003)(22082099003)(261009221227099003)(18002099003)(261009220027099003)(261009223027099003)(261009223327099003)(261009221727099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RVFSN3E2bzZ2Z2lIRElEa2syY3JyZ2ZVbzV4cHVsS3BqcFNpTWxGeTkzRzhW?=
 =?utf-8?B?T2VaNXVuRTloMHUyRngwVVViN1kwMWxlcWJkdUFXNlhGbFBUY21Ec3hNYW4x?=
 =?utf-8?B?L2YxY0x0YU10T1N2OUJzRmVrYjhKbXgxdUF1eDNpNXJnSHVVdTdpM052d3p3?=
 =?utf-8?B?V3pHYjMxSnFTbWU2bFNPRXI0U1hsem0zTmVXd3lEVkU3MlBERXBDNlVXNFkx?=
 =?utf-8?B?UFdNNldhSWY2elRuYXNuQmFsb1piUmxCNEx1SnBzOFNsbC93ZmZWWUVVdWNU?=
 =?utf-8?B?c21GcFkrbkFkSUtCM2JiWk01elNwY3hDQ0w0bS9qRlE4cmFMTEdUb2tkN1ZO?=
 =?utf-8?B?amNadDlLRnpPUTFxRVVWaEh3dUYrZC9idTV4U0x5dmdTczgyeWVna3NZajJr?=
 =?utf-8?B?TzFqWGNxRlN1Y1R0VDJqMFFtUlk2UU9xUmdjOWU2bGdSQ2Zub0NYckxSQjJn?=
 =?utf-8?B?RnM4Sm5wekp4TGtRRGY5bWd3WnlGOGxiSWtUbzlzZE56ZktqdEpzMHhKSTRU?=
 =?utf-8?B?d0dsd2hTYUc4RWQ5TjVlMzUzdGp6QmMvU2wremtyOXdUV3VlMkFqM2tlV1dy?=
 =?utf-8?B?OUhhSW5kS204UWRUUWxZOVVUc3NFcmR5eWwxRG14emtsRnRGSlFOenBtUlRX?=
 =?utf-8?B?bGxsclp5ckNPb0FCeG1MWG9JRnpmUTdiYkdZdjJlcEV0OTA3Q0k2S0dvQ3Bx?=
 =?utf-8?B?TkdYZUpiZkhGbzNMaU5JTk81dWJBVTBHbllSa1JMVW4zdThEZll1ZHFwSXlh?=
 =?utf-8?B?bkVxVm9tOTh4aU9TcnFaKzdOU0tVd09hbmFhRklrY0hXZHIxUEg5UDRFSUt4?=
 =?utf-8?B?QS9OdXdwaHMwQkwrTzdxSmM3MGU2NmJ5dk5FQk51MDdISDV3Zm9iTUtFZzlI?=
 =?utf-8?B?di9oaWxKbGQ3L00vbDc2bjUvVW8wSExyNjBNdFFwK0hrRjJGNjJmMEVLemhG?=
 =?utf-8?B?SmUwcnd6NkF0VDdmY1UvUTVIUXpBdVpLZFVBSnJaSjB6Ky84UHBYanlaY0sx?=
 =?utf-8?B?b0I4OGlMVnAxdzZ3RUNBL3o5V2tNdGkzZFlJTURpeUg0RitGQWxDMFFDSm93?=
 =?utf-8?B?RmJzZkxoa2o0TXozRTF2UnpCZE56YktjcHEyWUhLcWR2MXJJcFZuOEtBdkd5?=
 =?utf-8?B?ZEZFUVpUMU91Nk1acTIvUGVMbEx3R2pQS25KeXhCaUtOVGI0Skw5VHYvaHhn?=
 =?utf-8?B?SlNmRU02UENRb1o1aTZSdUcwZHhzV0FkQVFkbXJJbmpraHJuUHh4eDB4MEwy?=
 =?utf-8?B?aS8vSUp2TktacFcwRmtIT2Ntd1lyNytyZzVHZnBmK1hnNDhRK3BkbDBGZW94?=
 =?utf-8?B?dWtHYUovYzhnTXhVTnZtbE9EQ3NSNXhTQ1ZZKzN5ckJraUszUk04WEtqcW5E?=
 =?utf-8?B?T0JqbUNRd2x2cXFFT01CSHpVNk1jN3VaaUdBcFE4ZDdseE5McW5HT0lPL1Yw?=
 =?utf-8?B?VkhHRzJmcDlPUjk2a2ZwajlIYnlRdTRzcTNOU2U2UU1Ba2pqMGlPWjhXWjBV?=
 =?utf-8?B?eGt3UTArQnNSR1FSYnV4bFBjSG0vaHllbmx1YjdDK2RXQURib3F0S21nYXgy?=
 =?utf-8?B?N2FEY3diYVN6UGYyempnSzZ3emxsY2VCOTRFL1BwdWZqTFFIT2ZZTjB4emtw?=
 =?utf-8?B?RFliWGxEa0tveVF1K2M2NzVNTG9rL2R5UjVxWThZTC92YS9yKzYzS2ZtSnho?=
 =?utf-8?B?TVFLTHRmOTY2d1VRUjUrTzMwUktSWWNCSnR2dUZuQWZFTWJ5cTVxVWZIbDRG?=
 =?utf-8?B?d2JPbHliVnpDQlhwSnVZcUR6RzVyTDdxS21yZHo5cjZLTjEzb3diRmd2ZHl4?=
 =?utf-8?B?WFNCeC8zMk4wMGJyUGgvY2c2K2FvTnJxRjRKQklZQ0FDNDNvRWtBVjd3ejVQ?=
 =?utf-8?B?cytTNEgxYi9EdVB1WlhkMnpaQTE3dzhpMi85bFRrVXN0a2czRGI4M1Z2d2hz?=
 =?utf-8?B?RmZ1T3ZQc3RsV3BuSWhXL2ZId04rZFhZY2JhckpYUThnNHhCWExML2o3TWdx?=
 =?utf-8?B?cmUzckY2Mzg4T3ZIZWlQdHI4SjNYV1lMRUU0SStoZUVRL2l2QmEzNWlKSjJp?=
 =?utf-8?B?U204NTl1dUg0Y0ZNMmlIa3ZZTjBRQW11MWlIYnRDc3p2UWJNYXdtc1duUnRT?=
 =?utf-8?B?SGFHQUNmeVN6aUY2WjdYQXVIalo0MVFlS3Z1aUV4Y1JITzA5YkJKblJpVEw4?=
 =?utf-8?B?OUtjcU1XVmh2c2NVclM4ZTlMd1JINGpMWnh5OGZteWlIVitjRVQxK3lSeFly?=
 =?utf-8?B?Z1ZBdC8rVER5YUZjOU1rdytlS284K29GbXFwQVJlcHBLeHEvWnM2NlpkSWw1?=
 =?utf-8?Q?7o0aZbTF1WAX7hFaW7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4AE75B76CC523742800D29B6F513D09E@namprd10.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked:
	URs3+jNiWhSfqBcJ/68So88Cq0D170fXmQ3bUHqFlJ4aOwPAWKE7SGEwGvbX599x0oiPop0ODd4Dtnl7AadelWEV2n9JDDaHP91R9CmZLZzs9qgOELbNd7ALslweXo0bmiuA2UKhXrbp5YxElUToG+8B+EYsbZalg7HgqG4Vr2z8IB2tB7c4tAVlTc7JEYh6t74PW9oAQgq5QCRtU8QmskKkcobtygC4h/CRH4sNn5TcxBZp/6E45JAggJrOKDwtIh21LIkFoq/ALizZlZ/+eZGXntbHHwV357zoxzr9+kLTllFiBAiQcxAw6McEdN8xOVyit0suonLi1EtCHVTahQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR10MB3652.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4efdd27d-c583-4beb-0164-08df3ff0e346
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 12:39:54.7457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jE7S4lFOav6+RZq/pcImQ6tZQVpbgCYHqg6Ry9XxLxIVHKPm2GfHoKNRvOESKVjz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5118
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0OSBTYWx0ZWRfXw/dZwrmAKHNa
 BNp1pfIkOa2h1Z354OxUuFIXDWXJAnXtN3XnyiJkIh3I5HndQQjw1K0PXJM38jBItE3JqXLDr++
 1J/AZu2F/bp3JinsIVxmqqhinBS8f5sia4rxuPunzK5+Kt0U6y4EPLRa0JskiKPSfkzyV2eq5a9
 SfOznOz8RRmBhVCoScYbOgU1rnjKKPJq/wGHLiWb+oO5cUVfvB6IV+2t0JxD33dFZvYTcrbABVB
 UTtU02/1/2/zluw6g/woZRtjVhWCqGsWjYIK+3AaTubcmFqUXOM5prSaqQQ7LVEPBBaXD5lZ/hr
 x2BA39Zj2obBgGx7C3faMxW0wEMZpgksIpJEFm5Gsd37N48h39hQNXMslLxJ7TBML3car03w8mI
 nPdrKAcCxMeznkBht4Tb0+w6yRVCacGGTBHby23mX+D+VvUT1G+fEP5AiltPQw34jLJwFAH1ABo
 hhq1UotyVlXSeOkyTvw==
X-Proofpoint-GUID: xJFd3tvKDdNi81GRFPI_6PeOLDU5G7XP
X-Authority-Analysis: v=2.4 cv=ebOo7LEH c=1 sm=1 tr=0 ts=6af4621f cx=c_pps
 a=DKBbczBT0NfZzOMt9NccUg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=N1ABxPQjhd-SYDns7PgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: xJFd3tvKDdNi81GRFPI_6PeOLDU5G7XP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0OSBTYWx0ZWRfXxA5gaOudFW//
 ffItGzC+04HAGjODcLHV0HKALfKtqhtDuAxS/OKjCHEH93wB2FT3HEtWhV4GRSx4XHkmBgOjaZ0
 MlFPVbEBS6WOBE59cfzENkHZwuQHVPg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110049

T24gMTEvMTAvMjAyNiAxMDowMiBQTSwgQnJuaWNoLCBCcmFuZG9uIHdyb3RlOg0KPiBDdXJyZW50
IGltcGxlbWVudGF0aW9uIG9ubHkgaGFzIG9uZSBjYWxsIHRvIHR1cm4gdGhlIGRldmljZSBvbiAt
DQo+IHN0YXJ0X3N0cmVhbWluZy4gVGhpcyBjYW4gd2FzdGUgcG93ZXIgb2Ygc3lzdGVtIGFzIHRo
ZSBkZXZpY2UgY2FuIGJlIGluDQo+IFNUUkVBTV9PTiBzdGF0ZSwgYnV0IG5vIGJ1ZmZlcnMgYXJl
IGFjdHVhbGx5IGJlaW5nIHN1Ym1pdHRlZC4NCj4gDQoNCllvdSBzaG91bGQgYWxzbyBtZW50aW9u
IGhvdyBjdXJyZW50IHBhdGNoIGZpeGVzIGl0Og0KaS5lIGJ5IHRha2luZyBydW50aW1lIFBNIHJl
ZmVyZW5jZSBkZXZpY2VfcnVuIGFuZCByZWxlYXNpbmcgaXQgaW4NCmNvbXBsZXRpb24gaW50ZXJy
dXB0IGFuZCB1c2luZyBQTSBhdXRvc3VzcGVuZC4NCj4gZTUwMTBfaW5pdF9kZXZpY2UgaXMgdGln
aHRseSBjb3VwbGVkIHRvIHJ1bnRpbWUgcmVzdW1lIGhvb2sgd2l0aA0KPiBhdXRvc3VzcGVuZCBh
ZGRpdGlvbiBhbmQgaGFzIGJlZW4gcmVtb3ZlZCBmcm9tIHN0YXJ0X3N0cmVhbWluZyBhY2NvcmRp
bmdseS4NCg0KSGFzIGJlZW4gcmVtb3ZlZCBpcyBub3QgcmlnaHQgd29yZGluZyBzaW5jZSBpdCB0
ZW5kcyB0byBpbmZlciB0aGF0IGl0DQp3YXMgcmVtb3ZlZCBwcmlvciB0byB0aGlzIHBhdGNoIGJ1
dCBpdHMgYWN0dWFsbHkgdGhpcyBvbmUgd2hpY2ggaXMNCm1vdmluZyBvdXQuDQoNCj4gSG93ZXZl
ciwgdGhlcmUgaXMgdGhlIGNhc2Ugd2hlcmUgcnVudGltZSBQTSBpcyBub3QgY29uZmlndXJlZCB3
aGljaCB3b3VsZA0KPiBsZWF2ZSB0aGUgZGV2aWNlIHBlcm1hbnRhdGVseSB1bmluaXRpYWxpemVk
LiBBZGQgY2FsbCB0byBlNTAxMF9pbml0X2RldmljZQ0KPiB0byBlNTAxMF9wcm9iZSB0byBhY2Nv
dW50IGZvciB0aGlzIGNhc2UuDQoNClllcywgYmVmb3JlIHRoaXMgcGF0Y2ggaXQgd2FzIGhhbmRs
ZWQgYnkgc3RhcnRfc3RyZWFtaW5nLg0KDQpJIHRoaW5rIGJldHRlciB3b3JkaW5nIHdvdWxkIGJl
IGFzIGJlbG93Og0KU2luY2UgZTUwMTBfcnVudGltZV9yZXN1bWUoKSBub3cgaW5pdGlhbGlzZXMg
dGhlIGhhcmR3YXJlIG9uIGV2ZXJ5DQpwb3dlci11cCwgZHJvcCB0aGUgZTUwMTBfaW5pdF9kZXZp
Y2UoKSBjYWxsIGZyb20gc3RhcnRfc3RyZWFtaW5nKCkuDQpXaXRob3V0IHJ1bnRpbWUgUE0sIHRo
YXQgY2FsbCBpbiBzdGFydF9zdHJlYW1pbmcoKSB3YXMgdGhlIG9ubHkgcGxhY2UNCnRoZSBoYXJk
d2FyZSBnb3QgaW5pdGlhbGlzZWQsIHNvIGNhbGwgZTUwMTBfaW5pdF9kZXZpY2UoKSBmcm9tIHBy
b2JlDQp3aGVuIHJ1bnRpbWUgUE0gaXMgbm90IGVuYWJsZWQuDQoNCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEJyYW5kb24gQnJuaWNoIDxiLWJybmljaEB0aS5jb20+DQo+IC0tLQ0KPiAgLi4uL3BsYXRm
b3JtL2ltYWdpbmF0aW9uL2U1MDEwLWpwZWctZW5jLmMgICAgIHwgNDggKysrKysrKysrLS0tLS0t
LS0tLQ0KPiAgLi4uL3BsYXRmb3JtL2ltYWdpbmF0aW9uL2U1MDEwLWpwZWctZW5jLmggICAgIHwg
IDEgKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2ltYWdpbmF0aW9u
L2U1MDEwLWpwZWctZW5jLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2ltYWdpbmF0aW9uL2U1
MDEwLWpwZWctZW5jLmMNCj4gaW5kZXggNGU3NzExMmI1OTE5Ny4uM2M3YzVmMTIxYTMyZiAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9pbWFnaW5hdGlvbi9lNTAxMC1qcGVn
LWVuYy5jDQo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vaW1hZ2luYXRpb24vZTUwMTAt
anBlZy1lbmMuYw0KPiBAQCAtOTc2LDYgKzk3Niw3IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBlNTAx
MF9pcnEoaW50IGlycSwgdm9pZCAqZGF0YSkNCj4gIA0KPiAgCXY0bDJfbTJtX2pvYl9maW5pc2go
ZTUwMTAtPm0ybV9kZXYsIGN0eC0+ZmgubTJtX2N0eCk7DQo+ICAJZHByaW50ayhlNTAxMCwgMywg
ImN0eDogMHglcCBGaW5pc2ggam9iXG4iLCBjdHgpOw0KPiArCXBtX3J1bnRpbWVfcHV0X2F1dG9z
dXNwZW5kKGU1MDEwLT5kZXYpOw0KPiAgDQo+ICBqb2JfdW5sb2NrOg0KPiAgCXNwaW5fdW5sb2Nr
KCZlNTAxMC0+aHdfbG9jayk7DQo+IEBAIC0xMTAxLDYgKzExMDIsOCBAQCBzdGF0aWMgaW50IGU1
MDEwX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJCWdvdG8gZmFpbF9h
ZnRlcl92NGwyX20ybV9pbml0Ow0KPiAgCX0NCj4gIA0KPiArCXBtX3J1bnRpbWVfc2V0X2F1dG9z
dXNwZW5kX2RlbGF5KGRldiwgSlBFR19BVVRPU1VTUEVORF9ERUxBWV9NUyk7DQo+ICsJcG1fcnVu
dGltZV91c2VfYXV0b3N1c3BlbmQoZGV2KTsNCj4gIAlwbV9ydW50aW1lX2VuYWJsZShkZXYpOw0K
PiAgDQo+ICAJaWYgKCFwbV9ydW50aW1lX2VuYWJsZWQoZGV2KSkgew0KPiBAQCAtMTEwOSw2ICsx
MTEyLDExIEBAIHN0YXRpYyBpbnQgZTUwMTBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4gIAkJCWRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJmYWlsZWQgdG8gZW5hYmxlIGNs
b2NrXG4iKTsNCj4gIAkJCWdvdG8gZmFpbF9hZnRlcl92NGwyX20ybV9pbml0Ow0KPiAgCQl9DQo+
ICsJCXJldCA9IGU1MDEwX2luaXRfZGV2aWNlKGU1MDEwKTsNCj4gKwkJaWYgKHJldCkgew0KPiAr
CQkJZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgImZhaWxlZCB0byBpbml0IGRldmljZVxuIik7DQo+
ICsJCQlnb3RvIGZhaWxfYWZ0ZXJfY2xvY2tfZW5hYmxlOw0KPiArCQl9DQo+ICAJfQ0KPiAgDQo+
ICAJcmV0ID0gdmlkZW9fcmVnaXN0ZXJfZGV2aWNlKGU1MDEwLT52ZGV2LCBWRkxfVFlQRV9WSURF
TywgMCk7DQo+IEBAIC0xMTIzLDEwICsxMTMxLDEyIEBAIHN0YXRpYyBpbnQgZTUwMTBfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlyZXR1cm4gMDsNCj4gIA0KPiAgZmFp
bF9hZnRlcl9jbG9ja19lbmFibGU6DQo+IC0JaWYgKHBtX3J1bnRpbWVfZW5hYmxlZChkZXYpKQ0K
PiArCWlmIChwbV9ydW50aW1lX2VuYWJsZWQoZGV2KSkgew0KPiArCQlwbV9ydW50aW1lX2RvbnRf
dXNlX2F1dG9zdXNwZW5kKGRldik7DQo+ICAJCXBtX3J1bnRpbWVfZGlzYWJsZShkZXYpOw0KPiAt
CWVsc2UNCj4gKwl9IGVsc2Ugew0KPiAgCQljbGtfZGlzYWJsZV91bnByZXBhcmUoZTUwMTAtPmNs
ayk7DQo+ICsJfQ0KPiAgZmFpbF9hZnRlcl92NGwyX20ybV9pbml0Og0KPiAgCXY0bDJfbTJtX3Jl
bGVhc2UoZTUwMTAtPm0ybV9kZXYpOw0KPiAgZmFpbF9hZnRlcl92NGwyX3JlZ2lzdGVyOg0KPiBA
QCAtMTE0MywxMCArMTE1MywxMCBAQCBzdGF0aWMgdm9pZCBlNTAxMF9yZW1vdmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikNCj4gIAl2aWRlb191bnJlZ2lzdGVyX2RldmljZShlNTAxMC0+
dmRldik7DQo+ICAJdjRsMl9tMm1fcmVsZWFzZShlNTAxMC0+bTJtX2Rldik7DQo+ICAJdjRsMl9k
ZXZpY2VfdW5yZWdpc3RlcigmZTUwMTAtPnY0bDJfZGV2KTsNCj4gKwlwbV9ydW50aW1lX2RvbnRf
dXNlX2F1dG9zdXNwZW5kKGU1MDEwLT5kZXYpOw0KPiAgCXBtX3J1bnRpbWVfZGlzYWJsZShlNTAx
MC0+ZGV2KTsNCj4gIAlpZiAoIXBtX3J1bnRpbWVfc3RhdHVzX3N1c3BlbmRlZCgmcGRldi0+ZGV2
KSkNCj4gIAkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGU1MDEwLT5jbGspOw0KPiAtDQoNCm5pdHBp
Y2s6IExpbmUgZGVsZXRpb24uDQoNCldpdGggYWJvdmUgY2hhbmdlcywNClJldmlld2VkLWJ5OiBE
ZXZhcnNoIFRoYWtrYXIgPGRldmFyc2h0QHRpLmNvbT4NCg0KUmVnYXJkcw0KRGV2YXJzaA0KDQo+
ICB9DQo+ICANCj4gIHN0YXRpYyB2b2lkIGU1MDEwX3ZiMl9idWZmZXJzX3JldHVybihzdHJ1Y3Qg
dmIyX3F1ZXVlICpxLCBlbnVtIHZiMl9idWZmZXJfc3RhdGUgc3RhdGUpDQo+IEBAIC0xMzA3LDMx
ICsxMzE3LDEzIEBAIHN0YXRpYyBpbnQgZTUwMTBfZW5jb2Rlcl9jbWQoc3RydWN0IGZpbGUgKmZp
bGUsIHZvaWQgKnByaXYsDQo+ICBzdGF0aWMgaW50IGU1MDEwX3N0YXJ0X3N0cmVhbWluZyhzdHJ1
Y3QgdmIyX3F1ZXVlICpxLCB1bnNpZ25lZCBpbnQgY291bnQpDQo+ICB7DQo+ICAJc3RydWN0IGU1
MDEwX2NvbnRleHQgKmN0eCA9IHZiMl9nZXRfZHJ2X3ByaXYocSk7DQo+IC0JaW50IHJldDsNCj4g
IA0KPiAgCXN0cnVjdCBlNTAxMF9xX2RhdGEgKnF1ZXVlID0gZ2V0X3F1ZXVlKGN0eCwgcS0+dHlw
ZSk7DQo+ICANCj4gIAl2NGwyX20ybV91cGRhdGVfc3RhcnRfc3RyZWFtaW5nX3N0YXRlKGN0eC0+
ZmgubTJtX2N0eCwgcSk7DQo+ICAJcXVldWUtPnNlcXVlbmNlID0gMDsNCj4gIA0KPiAtCXJldCA9
IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoY3R4LT5lNTAxMC0+ZGV2KTsNCj4gLQlpZiAocmV0
IDwgMCkgew0KPiAtCQl2NGwyX2VycigmY3R4LT5lNTAxMC0+djRsMl9kZXYsICJmYWlsZWQgdG8g
cG93ZXIgdXAganBlZ1xuIik7DQo+IC0JCWdvdG8gZmFpbDsNCj4gLQl9DQo+IC0NCj4gLQlyZXQg
PSBlNTAxMF9pbml0X2RldmljZShjdHgtPmU1MDEwKTsNCj4gLQlpZiAocmV0KSB7DQo+IC0JCXY0
bDJfZXJyKCZjdHgtPmU1MDEwLT52NGwyX2RldiwgImZhaWxlZCB0byBFbmFibGUgZTUwMTAgZGV2
aWNlXG4iKTsNCj4gLQkJZ290byBmYWlsOw0KPiAtCX0NCj4gLQ0KPiAgCXJldHVybiAwOw0KPiAt
DQo+IC1mYWlsOg0KPiAtCWU1MDEwX3ZiMl9idWZmZXJzX3JldHVybihxLCBWQjJfQlVGX1NUQVRF
X1FVRVVFRCk7DQo+IC0NCj4gLQlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMgdm9p
ZCBlNTAxMF9zdG9wX3N0cmVhbWluZyhzdHJ1Y3QgdmIyX3F1ZXVlICpxKQ0KPiBAQCAtMTM0Nyw4
ICsxMzM5LDYgQEAgc3RhdGljIHZvaWQgZTUwMTBfc3RvcF9zdHJlYW1pbmcoc3RydWN0IHZiMl9x
dWV1ZSAqcSkNCj4gIAkgICAgdjRsMl9tMm1faGFzX3N0b3BwZWQoY3R4LT5maC5tMm1fY3R4KSkg
ew0KPiAgCQl2NGwyX2V2ZW50X3F1ZXVlX2ZoKCZjdHgtPmZoLCAmZTUwMTBfZW9zX2V2ZW50KTsN
Cj4gIAl9DQo+IC0NCj4gLQlwbV9ydW50aW1lX3B1dF9zeW5jKGN0eC0+ZTUwMTAtPmRldik7DQo+
ICB9DQo+ICANCj4gIHN0YXRpYyB2b2lkIGU1MDEwX2RldmljZV9ydW4odm9pZCAqcHJpdikNCj4g
QEAgLTEzNjEsNyArMTM1MSw2IEBAIHN0YXRpYyB2b2lkIGU1MDEwX2RldmljZV9ydW4odm9pZCAq
cHJpdikNCj4gIAl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiAgCWludCBudW1fcGxhbmVzID0gY3R4
LT5vdXRfcXVldWUuZm10LT5udW1fcGxhbmVzOw0KPiAgDQo+IC0Jc3Bpbl9sb2NrX2lycXNhdmUo
JmU1MDEwLT5od19sb2NrLCBmbGFncyk7DQo+ICAJc192YiA9IHY0bDJfbTJtX25leHRfc3JjX2J1
ZihjdHgtPmZoLm0ybV9jdHgpOw0KPiAgCVdBUk5fT04oIXNfdmIpOw0KPiAgCWRfdmIgPSB2NGwy
X20ybV9uZXh0X2RzdF9idWYoY3R4LT5maC5tMm1fY3R4KTsNCj4gQEAgLTEzNjksNiArMTM1OCwx
NCBAQCBzdGF0aWMgdm9pZCBlNTAxMF9kZXZpY2VfcnVuKHZvaWQgKnByaXYpDQo+ICAJaWYgKCFz
X3ZiIHx8ICFkX3ZiKQ0KPiAgCQlnb3RvIG5vX3JlYWR5X2J1Zl9lcnI7DQo+ICANCj4gKwlyZXQg
PSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KGU1MDEwLT5kZXYpOw0KPiArCWlmIChyZXQgPCAw
KSB7DQo+ICsJCWRldl9lcnIoZTUwMTAtPmRldiwgIkRldmljZSBmYWlsZWQgdG8gdHVybiBvblxu
Iik7DQo+ICsJCWdvdG8gbm9fcmVhZHlfYnVmX2VycjsNCj4gKwl9DQo+ICsNCj4gKwlzcGluX2xv
Y2tfaXJxc2F2ZSgmZTUwMTAtPmh3X2xvY2ssIGZsYWdzKTsNCj4gKw0KPiAgCXNfdmItPnNlcXVl
bmNlID0gY3R4LT5vdXRfcXVldWUuc2VxdWVuY2UrKzsNCj4gIAlkX3ZiLT5zZXF1ZW5jZSA9IGN0
eC0+Y2FwX3F1ZXVlLnNlcXVlbmNlKys7DQo+ICANCj4gQEAgLTE0OTMsNiArMTQ5MCw4IEBAIHN0
YXRpYyB2b2lkIGU1MDEwX2RldmljZV9ydW4odm9pZCAqcHJpdikNCj4gIAlyZXQgPSBlNTAxMF9p
bml0X2RldmljZShlNTAxMCk7DQo+ICAJaWYgKHJldCkNCj4gIAkJdjRsMl9lcnIoJmU1MDEwLT52
NGwyX2RldiwgImZhaWxlZCB0byBpbml0aWFsaXplIGRldmljZSBhZnRlciByZXNldFxuIik7DQo+
ICsJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZTUwMTAtPmh3X2xvY2ssIGZsYWdzKTsNCj4gKwlw
bV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChlNTAxMC0+ZGV2KTsNCj4gIG5vX3JlYWR5X2J1Zl9l
cnI6DQo+ICAJaWYgKHNfdmIpIHsNCj4gIAkJdjRsMl9tMm1fc3JjX2J1Zl9yZW1vdmVfYnlfYnVm
KGN0eC0+ZmgubTJtX2N0eCwgc192Yik7DQo+IEBAIC0xNTA2LDcgKzE1MDUsNiBAQCBzdGF0aWMg
dm9pZCBlNTAxMF9kZXZpY2VfcnVuKHZvaWQgKnByaXYpDQo+ICAJCXY0bDJfbTJtX2J1Zl9kb25l
KGRfdmIsIFZCMl9CVUZfU1RBVEVfRVJST1IpOw0KPiAgCX0NCj4gIAl2NGwyX20ybV9qb2JfZmlu
aXNoKGU1MDEwLT5tMm1fZGV2LCBjdHgtPmZoLm0ybV9jdHgpOw0KPiAtCXNwaW5fdW5sb2NrX2ly
cXJlc3RvcmUoJmU1MDEwLT5od19sb2NrLCBmbGFncyk7DQo+ICB9DQo+ICANCj4gICNpZmRlZiBD
T05GSUdfUE0NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vaW1hZ2luYXRp
b24vZTUwMTAtanBlZy1lbmMuaCBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vaW1hZ2luYXRpb24v
ZTUwMTAtanBlZy1lbmMuaA0KPiBpbmRleCBkYTU3YmMxYmFhNDY0Li44MDc4MjFkZWQxMjdlIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2ltYWdpbmF0aW9uL2U1MDEwLWpw
ZWctZW5jLmgNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9pbWFnaW5hdGlvbi9lNTAx
MC1qcGVnLWVuYy5oDQo+IEBAIC0yMyw2ICsyMyw3IEBADQo+ICAjZGVmaW5lIERFRkFVTFRfSEVJ
R0hUCQkJNDgwDQo+ICAjZGVmaW5lIEU1MDEwX01PRFVMRV9OQU1FCQkiZTUwMTAiDQo+ICAjZGVm
aW5lIEpQRUdfTUFYX0JZVEVTX1BFUl9QSVhFTAkyDQo+ICsjZGVmaW5lIEpQRUdfQVVUT1NVU1BF
TkRfREVMQVlfTVMJMTAwDQo+ICANCj4gIC8qIEpQRUcgbWFya2VyIGRlZmluaXRpb25zICovDQo+
ICAjZGVmaW5lIFNUQVJUX09GX0lNQUdFCQkJMHhGRkQ4DQoNCg==
