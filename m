Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793752975;
	b=VQdHc7OL7iabm6Oxkew6V5pOczpHuU1vYjb8IRxSwrFfS01lfaLHtqCYR6AJYBz8eyM/
	 xZ/aEUG7VK5ce2akzp6EXO9Rs5AJZJopIQaCMvVR98MKA4r5auleKzotgWsOy0IBN515W
	 7fniv1qddgBJRlC7pbVnLRh9tHHkV29/dPpdQCugyjoSUpHLUDapG58PZaivt76Dn4Oov
	 DKB8kyYZfBXsvgyRebTWWjMVC0aGP8rznOtBhyKQdYkdYNigMGIYHo/3bGtLuyDog4gx0
	 B1GXgbMawWaJGlkUx/e80MDVYw9rPv0uj9q5IBHLPKhlAQZPqQpBNarhvtZKh+1oyLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793752975;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:Received:DKIM-Signature:Received:Received:
	 X-SNPS-Relay:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aw5V+ykbOB/vU38E/KS6xX2T7PpMR9Vq7OvMVLVfDTs=;
	b=2pstB3VAX3g+k2D/fLX3vJBXoWd2UhD4iMs61duV3J4hdvasu5SFiUVknF2Isur+1Mqf
	 KHr1J8KpoEAHIn4/f2VIQpCL1uVZOJmpk5LyrTotOXoL5jOol2tk+3b1ia0xj8TVZAFXU
	 sgtGxe59S73WPMo39FWNjkVsD9PArKzPsN2n9SGAXrbgno2VAMw+fSv5Jn03d1uW8Kg1O
	 zFz/UPbv1PH19bpwR24AqgVwO0ju3y5qV8DTkgbJsDfRxceoPsmxF3ZdUOnipAz5yuCJF
	 gtFw93442Kf9iXcVXka23m2nw9skXx2OJZl6H5SxSUVmzaTCk0tBBgwSUDF5aMqSkIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=gGs3SUvY;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=mWpOQ5ci;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=iqube6Q5;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76E8606A31B;
	Wed,  4 Nov 2026 00:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C76E8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=gGs3SUvY;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=mWpOQ5ci;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=iqube6Q5
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40TCMg1378222;
	Tue, 3 Nov 2026 16:42:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=aw5V+ykbOB/vU38E/KS6xX2T7PpMR9Vq7OvMVLVfDTs=; b=
	gGs3SUvYuWaZRlqunfF2x9elAsyOWQcEx6YPri/p4i9l1JuU2TtTbX1vQORx6G2b
	P7XfXMt4IGItbNy0yfA+nnfpCQ76Q8+TUzCoSh73txCZVMXReCT8hFzAnMASzrnI
	mcIjX78W2v/QVX5XOiObvBvtCZh7J5U7chTDaMiktZXFPkg1WRvuq2x/oPNxkobZ
	ca/pxsEACrfks4Mn2hJup3vw++vogFa62shH3O9Yjsbu7N42ZURz2ANz1GHz3zVL
	TyGdN9ID0P7U0Go7osDYe3yj1NkoQlWwABSCGWgChNwsy1L6KOidQRUA6jvT0Yr2
	k0FMEjpjIHNxNGNUDZYoQg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4hqctvyj9v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 16:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1793752954; bh=aw5V+ykbOB/vU38E/KS6xX2T7PpMR9Vq7OvMVLVfDTs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=mWpOQ5ci18GltHomW3btfjMev+Vwk85P5TapsFL8bbH4Wxhv0GMxd/NOWaaDihQjp
	 AfpOhIIy9f5PP2NHDyTrKFppL79KuUBhCL9FOLlsEAPT3hsYOvzkQxdC2TjrZCYS5l
	 LXyk0YLoWfjhzF2UM3vwYuVDqwHMD6K/RWge8jxE0Q50RY15JyXi3PfqAeA9Cf8fGw
	 kMIFv4NDLnZ6yWXShoY37aBMBB6caUuOXzSP5UN2aULp/pTRK/drk7gZmmVaQSWZg7
	 apMxeKN2n/2L3baxnrJ7eSah/GIiOjq9FwfYMeDB1wuavq2AveWC7VoZE8+/OJtkY/
	 F0AXGCw07qaGw==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C5C7440298;
	Wed,  4 Nov 2026 00:42:32 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 24033A06CD;
	Wed,  4 Nov 2026 00:42:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=iqube6Q5;
	dkim-atps=neutral
Received: from BL2PR08CU001.outbound.protection.outlook.com (mail-bl2pr08cu00102.outbound.protection.outlook.com [40.93.4.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7FA99401E4;
	Wed,  4 Nov 2026 00:42:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZaPhPRFF/BfMWa8MiTXoZdWCB/5B3z9LNlpBnmvV0GKNLMmoNeVAdxA2fIuz5jOsFcTZ9bHzY8rZHkC5we35I+hHuPsiGKc3LyuQNAN7saZLCnw2vvGmO9r//HszD+Xlk2/TO1v8UDUfWFeuHp+GiCcuQJ7+Xw9gV8g2x7qAuMZZrYWkPufVDpMyJtetHZYUXDRQL/89H2rdUfR+GRBE93xXcmIgm5MoNp+KZq510hqIDhqIslR6n9P5KKTBxjdFN6/Rnp2Bz6caXw+kA/FrMGG+9Awu5A0LBFFKlSJ3n283wehTL6hU12TqBrjuxxMVMHeXLf/t1qaS0e6o8X4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aw5V+ykbOB/vU38E/KS6xX2T7PpMR9Vq7OvMVLVfDTs=;
 b=yewNd8BkDdjBsMpihjfZf820w1uWbIgMzZdwsupV12IjXWal3XzM8ngRGmOXhCYoTmQb5cDcqIUzh3xl+wNFgEuPMLlF2qNxTSteKBDxlUHQWOKAB6P/HAPVeeC4U1tx5dORf74B2esx8/zNh+r4oJs6OmFLo5jVwI53VM6hm8NGb2kUbl5XphtxwkqIWJ1mS20ZyklB4X6z88TcTE4A376VXyyOtAxmIwFQ9IuFbHd4qbSYeDAkpZHBQVrp/+nTCleIJbyYs5u7sD/DU+hWbwJKpgJGVKvq2XgCBuCMrK2VBlVpYw9GqTygmL/9LxgYLxZcHqHpFywXAV9P4AqF/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aw5V+ykbOB/vU38E/KS6xX2T7PpMR9Vq7OvMVLVfDTs=;
 b=iqube6Q5OZ1g3ou8msl3wfgf1ouPnqMKYABRSB0WQj+gEVReMqpBS/8kuOWqvNT7e9pPegm50sLFeaIoRqlMfZrDlr734fTwRUYKjTXo8RO513xhSc5dHFRxjNza/2fir9GenUZtUzdcP4jwdb47XmGR0hF1yvY7r/8V1XSBhEQ=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by IA1PR12MB8191.namprd12.prod.outlook.com (2603:10b6:208:3f3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 00:42:23 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 00:42:23 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Pengpeng Hou <hppiscas@163.com>
CC: "patrice.chotard@foss.st.com" <patrice.chotard@foss.st.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3] usb: dwc3: st: balance reset ownership on deassert
 failure
Thread-Topic: [PATCH v3] usb: dwc3: st: balance reset ownership on deassert
 failure
Thread-Index: AQHdW4riUu27fH944EK6npqGvXPQwbcdM4QA
Date: Wed, 4 Nov 2026 00:42:23 +0000
Message-ID: <aup8I9j62dCGIc-g@vbox>
References: <20261014031920.8390-1-hppiscas@163.com>
In-Reply-To: <20261014031920.8390-1-hppiscas@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|IA1PR12MB8191:EE_
x-ms-office365-filtering-correlation-id: c413c822-094a-4a7a-c109-08df3a0c7dfe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|261026135527099003|261026140227099003|261021133027099003|38070700021|261021135927099003|261021130227099003|56012099006|11063799006|261009223027099003|261028144727099003|261022075727099003|261022115727099003|261026130827099003|261022105027099003|261021121427099003|261026121527099003|261021123027099003|261022113327099003|10067099003|18002099003|22082099003|261102123227099003|4133799003;
x-microsoft-antispam-message-info:
 Fn9qua/CxxdOMLpoiDpilXgOjEh3wTXMz/PkSTYXKRwNzQsYaUCi4c2KI4tbyLUlVWlKaUENaSQJ3Mxn1fC4NKL0q6fCv+mPd/eSS/uqz3x1Aod3HFueMkK65ctaHOHnjjZu4B0oyl6bUMvT/331ZeBO8Of/qXKNVexb5rlfPQpWuoFteG1Nd8RTFRv2pFRn8WOK/HFjPQq06xDbkH976EFCVz7gfymLYA2oj17rCxFV09hPKXckDA342QspGFn7U7D6a3TmPtKLfilahHbfDAISoFVEfnGueE+DsDZT/6KSpepLJJIh+JIncthjwmyjmv2YI3DgFovE09SEgMplkejy0jBLzyzrSrwGqHye9asVL66+4bdCs2Lc3tPMmexiS1AsVOYiw7n6s24x+Nx18NCIGfpYCdXqZXdXuQXwNXd0fEBC6MCTpvsOFRrYOY5zQZXiutmZBd3mHvezYgXtv9IBD8IfJ6+oL8bx3JPxALsyWv4194zKBD4wjyZE3Wf4P24hKj6J3x2ZnV1nZdwe8HQ7AVbbeW12iCi7EozvjUXVc32IGvp05edEs+FjqbirSDC2xzwWZBgSvRSTryckK1RmTQ5DBnIT63ENDjEbgx02rjs0l0Te7RPdZu+8BASIqD/lqMqqaWvZQ5OSU87Mn6hL6yzQ/B39bu7W7bdJy5jsE3bYl41T9KZU+mDsUYT9
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261026135527099003)(261026140227099003)(261021133027099003)(38070700021)(261021135927099003)(261021130227099003)(56012099006)(11063799006)(261009223027099003)(261028144727099003)(261022075727099003)(261022115727099003)(261026130827099003)(261022105027099003)(261021121427099003)(261026121527099003)(261021123027099003)(261022113327099003)(10067099003)(18002099003)(22082099003)(261102123227099003)(4133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MFB1MzJhM2liUGRlSEgzd0V0RFlaTlVYZGpibXhLWmpYWm03SFJNbTdoOWNI?=
 =?utf-8?B?ZFRTanJNU0krOFJQOERTMWJpMWR2anhOeG8wTVhWWFQ1T25NTFl5ZWMzOFNL?=
 =?utf-8?B?c0hyU2pkNmYvUkRISVFmWG5wOWFSRmlRMmllZEhqY0hwQmg2bXJvTm1UZTlk?=
 =?utf-8?B?cFNvYzBuWFFwSHFHTkhUQTNUNkVkd0ZWMlV6UG5uRXMwdEVKUGxPSmxyZnZ0?=
 =?utf-8?B?N2hZT0NEVVRRZHhJaElqRngvVlhvWUpMOGZsVGNMbEgvRlVXVTg2cXFEeTlw?=
 =?utf-8?B?ckd2OWlMT05NY2pIMThPRUg4MnhDUlBPUzdJbGw2eWUzd1NXL0RQd290SDhv?=
 =?utf-8?B?eklwNU95R21DZFZEcEQyL2kvM09xVWhaQVY3SEFoMENWdkVTOVZNaW1HL1JS?=
 =?utf-8?B?bVh6bnhTeVBXTTlDRk1DUEszdkx5Vkh3TCtkME5YODEyNUxYeUxaM0VRUWt5?=
 =?utf-8?B?cUp5WUNxTlYxakJsbGhockQ2Uk1PazM5WjVoR0JUbHZUVk9vSitLRHZObXI5?=
 =?utf-8?B?UlV5eFpxU05rM3ZobU4xZE9YSW5HejlTZVJwMGxQRitEeVJqRmZSOUV4OHNB?=
 =?utf-8?B?UVBndFQ2WVU5Nktxa3pyYTNoRFBCdnU3bHozSVcyUFl0SnRka2xraG51M3RI?=
 =?utf-8?B?TlhqSEptMzRlV05NbE9VUmhqdnJ6NmN2TFRyYzQyMFZTMG84SmNnQlNHUXZW?=
 =?utf-8?B?UzFRZ002OUFHZzhXenkzYmVTdTR5T3NwR3hzKzdTZ3g3dnNBaEwxbDBOMm9W?=
 =?utf-8?B?TW1JRStNWkRJbjZvNFZyT0RrWWNXa0NSYWxFeEdWdmFlOFBHa1NIMXc2RTJK?=
 =?utf-8?B?VEdwV3hrb1M3L2lqaEs3V25DNjhGTVR4Y3Vta3JqaWFPK3l5dENMc2kwbHVw?=
 =?utf-8?B?VGsrYmtRMWdIL1ZYVGhRRjc4bkZOVGdoeXVPR0JnYjhWRWFxS0plTmFRRld4?=
 =?utf-8?B?NmFJVGhocWZpaGUzRFk1bFZlM05zS2ZvSXFJOTAvNm94QURLb1J1cHdsckly?=
 =?utf-8?B?SVNxMXVrOUNuMWZlcGJJcERTUy8zVEk3Z0hudEI4VXRFTkJBVi9BSm5ucFQz?=
 =?utf-8?B?RCtIME1EVGtJTi9YbjhRSXFUUFcwMEk2UjlvNGlGQjRyT1dDRGI0bFlZOTF3?=
 =?utf-8?B?bEJVVHRRSjhzUGI4NEhDWmwrOWVCVnVTNktaWE1BZFhJWjlKMCtTZGl6dWdO?=
 =?utf-8?B?RUp2Qk5QcWhOQmFPeFBBS1Bod2c1VGc4eWZzS3N1ckZBc1ErWDNNZVdMaEdU?=
 =?utf-8?B?czBaZU1SRDltcmFFVU1MdldLaldnSXFFckZYelN4amw3RklSK1dDV0FPbDBv?=
 =?utf-8?B?WmpYNW9MeVBxYTZqb2pIK2JwbXA3UWU3cWpYUUdvdk9LZFFSWElCSExJdk5Y?=
 =?utf-8?B?RVBNUk9mREpNVkJnZmJGUDRLS2VYeUJ1K0gzYkJRYVJQMGdsWjNaSytIeXpl?=
 =?utf-8?B?c1dFNUN4YStOQnFRd002UG9GVU5HTTM4RjVxZTFCWERuNmdRaVNGMS9IY1Vw?=
 =?utf-8?B?VmMrVTFxNTFMZExEMnlma0E3YlhiRER0QjQ3Sk9BL3ZtNnk2VTd2NVoyc0x5?=
 =?utf-8?B?YlFkNytUUXU1ZDBiTFJSNlgwWlFMU2xxc1lqRWN5Q2p6Uk9zZnl5Zis1T2ZH?=
 =?utf-8?B?L0hwMzBhTUtVREUydlJKSWN3MFlJb2RERFF1ZmM4VFQrNGQzMGtRV3ptNmVX?=
 =?utf-8?B?eTUzVGRTZzhFVGkvR0IxSlNLZlVNalNYK2RmWUYwck9zUngwVVI1V2VvK0Jy?=
 =?utf-8?B?OUN5VzMvZ3Fob1AzMWh4aEhBb0E2VEZlTmVBWUYzcmZsNmhTbFNvQk93Ty9u?=
 =?utf-8?B?eWtQdFFURDEvVk82dGhCNEUxMXhjY3U3R1NyUC9aU3hoNTV5U3p6OExtK1Fu?=
 =?utf-8?B?L0pseklKTVFjRHJ1MUFxdzVPOTJFWUs1dlBsdll3YnhSdVluNGNESVUyYmwx?=
 =?utf-8?B?RE9ITUtOU3B6YWdId2NBUTMxNEZ1K1hIQVRMMGVBdnBmNU1NTDVsU3JFeXQx?=
 =?utf-8?B?d2tSNSsyUER3emVUYllDS2JmWTh0bzE1Vm9WWGhqMHNNOU91eWlJR24xa0hF?=
 =?utf-8?B?c3hobFR1emJrYitmUkNpcDJublhOZk4zK1ZoWFFDdzBpUXVXMFhLcStlT2Ew?=
 =?utf-8?B?RTlKL1FiazlQREUwVVdzeUliU3o1ZUhlUWs1eGJBU0Vld3FTcGd2YVpGQ3Jz?=
 =?utf-8?B?eFpNTzJlT00vMlBkLzNCMFRzbHIwOUlYODR3K2dnMVpSelQ4MUE4SWZYZFhR?=
 =?utf-8?B?bmVSVTRRaERPTmJoa2ROcEtRTlN1TWoralBOVHpqYTVNcWhYK3VUWXFla016?=
 =?utf-8?B?MkVKRUhHMS9xNGdHSFo2SWRUakNUTU5UcGNicm5JekpObFNQa3RXZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <580FB0AC4888F447AD6634BEC9D5E723@namprd12.prod.outlook.com>
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
	kZ/nIfk3JWHzAbFc7ROXxqZA8vamg2rKp7oDwrY9GhHQns7Tb2fgU9+2se4Dn8vl1bV4e2gRUKmvmG04rf3ZHQnbvAQixAtpO54qVkSaCrtZZbkNKQ6xFxqXDw7n9hYNUn4lJfpfPmzFpDJyvQr+bDDIQBe/Y/bFKvyjehnv/pwMbW2VxybnD9+XciKImx0TiQB/7+cB40PSHnKH6xatKwQ5mudctg38AAVRisPX8PEADIeVv996dOEzd3lotRpgPwCODpM5h2Y+nz9/quMv4qkc2nFOwLfqhoaPe1Q5D8vvPefySfH8Ep1rpWpB+UcnP4L0bLDvYDErcXYVch1WCA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FUX5W32Vmhbu+7Fba2HeZSbiEupHgMybv4lC9R5R7L+CFvSex3FOH9Tyl8+mC47ij59cP+kqoZgF0F0cOVz458cluCTSFYqVslobCDwsAJHGczp2UiCgaKs0WnuIoaeAoZb36UpaNWSTNozp9Jby4RAFRHLU47rh8L1V/pYOl/DGbfMDCB0mf7+jA7FMSbp3V6w7x23mCo+jbGeGTOxI9+2soWgV7QfvjoeZUpqtQDz4lla9NfHTPRcuAtk4cwZxcRqgVlJ86WRBLgYiTX9N2O4FC9tLSiy/Q8JdHCBqIGaUCCdyIcv33CE4TxIZHR8OCrqIQhvTkEODteHfQ6cLWM0Dxz/JmpsRgkwDZPm9iXRGtdc5tXSq7YGvrxYmqk2hbGqYKsYZFtW1OCNMo3r4Y5pkXfDeTH/ssRlj4RbBT/z9rCJQg31xY63DOnE4WZObWc/qH+iX8YjT1D6Nkm+Md5ekHoKt/xMuTuUcwSMikheLVTaMsntHodeoWd5Q57bSZimefXlPJzhKtRCuWSVsJQhjUVNdHGqmAlYK3Zr2KD5ed0XGQsyCnSP+W6WhSkTjyfdXiPWjxZ7pyj1vfTi4WEg6EUh1jRQCRViCuTM30sNlJWgd/QZRRh8hsNn6Pc6fr/dkQVjXPkjuN/ZiXLcQgg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c413c822-094a-4a7a-c109-08df3a0c7dfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 00:42:23.7172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G5UdEcu+qvMpdTUgRWtfPoPQIjZ5cjaivkHHjFyCAkhNjZNEcAAPC2yQcokEJWkCcycynat/ybjeA5OYQ53LNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8191
X-Proofpoint-GUID: z84fvQ-ZuTjwrrTQh-mhf88r51RiBeR6
X-Proofpoint-ORIG-GUID: z84fvQ-ZuTjwrrTQh-mhf88r51RiBeR6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwMiBTYWx0ZWRfXy6NI7V7AD/ct
 eKtHXyItgwd7BhTiQlMEvkuwqyrZLjp75h71G82dqBxHNkX4S948OuErQf2Gb3aaVCBco5Vlt3u
 lG2r7UTFNxam/+e/zAu/ompMXXfhMOvgha1aULp/dckuGa/9vhTXZ/e7ZC8ohEJ7NrAk4aJKFmC
 +aetfarbzx4BuqWHA8YPVOM6dtFeUEN6K+0GnWWl0k/PQPzGaUdeTcE+uWRvVsIBzhVwok7JQNc
 zKYueY4SmTfxgcQ7wZVFYn9trbsOm1eXrvUH5d293pmWily+xeWAPDX6J9QTZDCURe1GBYCISqO
 HN0JRxE/7eZ3g6696R2dXPmLmSnhTy6kf7EKsA9RNTtWoGyVAuDhmh05eT7zbtf0TBTZmQoh1um
 s9ODOe5Juu/OIoRydbXLmx+oWhlBhQWttXsQShJFllNcvIK/DWy+uUOTcSXiV4iZYOSduDWebU3
 GEIoZN3POiMWcaFMRXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwMiBTYWx0ZWRfX8bzaV7sWJg9W
 lfOsIfVgaRUqPYa0YOSmeGgL8inmlZP7+Seaq9Eqv22zKp2JBg1KKhAfNDY5xRy7ukoCa0I/BUR
 34DkerkI1te3rfhz7U72vPgUu1Vzpcs=
X-Authority-Analysis: v=2.4 cv=ce5HPXDM c=1 sm=1 tr=0 ts=6aea7f7c cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=1tHuvCWVkwfdmwQugPIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2611040002

T24gV2VkLCBPY3QgMTQsIDIwMjYsIFBlbmdwZW5nIEhvdSB3cm90ZToNCj4gVGhlIFNUIERXQzMg
Z2x1ZSBpZ25vcmVzIHJlc2V0IGRlYXNzZXJ0IGZhaWx1cmVzIGluIHByb2JlIGFuZCByZXN1bWUu
DQo+IEl0IG1heSBwdWJsaXNoIHRoZSBjaGlsZCBkZXZpY2Ugb3IgYWNjZXNzIHRoZSBnbHVlIHJl
Z2lzdGVycyB3aXRob3V0IGJvdGgNCj4gcmVzZXQgb3BlcmF0aW9ucyBoYXZpbmcgc3VjY2VlZGVk
Lg0KPiANCj4gQ2hlY2sgYm90aCByZXN1bHRzIGFuZCB1bndpbmQgRFJEIHNldHVwIGZhaWx1cmVz
IGFzIHdlbGwuIEEgc2hhcmVkDQo+IHNvZnRyZXNldCBwcm92aWRlciBmYWlsdXJlIG11c3QgZ28g
dGhyb3VnaCB1bmRvX3NvZnRyZXNldDogdGhlIHJlc2V0IGNvcmUNCj4gaGFzIGFscmVhZHkgaW5j
cmVtZW50ZWQgaXRzIGRlYXNzZXJ0IGNvdW50IGJlZm9yZSBjYWxsaW5nIHRoZSBwcm92aWRlci4N
Cj4gDQo+IFRyYWNrIHdoZXRoZXIgdGhpcyBkcml2ZXIgb3ducyB0aGUgZGVhc3NlcnQgcGFpciBz
byBzdXNwZW5kIGFuZCByZW1vdmUgZG8NCj4gbm90IHJlbGVhc2UgaXQgYWdhaW4gYWZ0ZXIgZmFp
bGVkIHJlc3VtZSBoYXMgdW53b3VuZCBpdC4gVGhpcyBpcyByZWZlcmVuY2UNCj4gb3duZXJzaGlw
LCBub3QgYSBndWFyYW50ZWUgYWJvdXQgdGhlIHBoeXNpY2FsIHJlc2V0LWxpbmUgc3RhdGUuIFJl
c3VtZQ0KPiBpdHNlbGYgbmVlZHMgbm8gZWFybHktcmV0dXJuIGd1YXJkOiB0aGUgcGFpcmVkIHN1
c3BlbmQgY2FsbGJhY2sgY2xlYXJzDQo+IHRoZSBvd25lcnNoaXAgc3RhdGUgYmVmb3JlIHJlc3Vt
ZSBpcyBlbnRlcmVkLg0KPiANCj4gVGhlIGlzc3VlIHdhcyBmb3VuZCBieSBvdXIgc3RhdGljLWFu
YWx5c2lzIHRvb2wgYW5kIG1hbnVhbGx5IHJldmlld2VkLg0KPiANCj4gRml4ZXM6IGY4M2ZjYTA3
MDdjNiAoInVzYjogZHdjMzogYWRkIFNUIGR3YzMgZ2x1ZSBsYXllciB0byBtYW5hZ2UgZHdjMyBI
QyIpDQo+IEFzc2lzdGVkLWJ5OiBncHQgNQ0KDQpDaGVja3BhdGNoIGNvbXBsYWlucyBhYm91dCB0
aGlzOg0KDQoJV0FSTklORzogTm9uLXN0YW5kYXJkIHNpZ25hdHVyZTogQXNzaXN0ZWQtYnk6DQoN
Cj4gU2lnbmVkLW9mZi1ieTogUGVuZ3BlbmcgSG91IDxocHBpc2Nhc0AxNjMuY29tPg0KPiAtLS0N
Cj4gQ2hhbmdlcyBzaW5jZSB2MjoNCj4gLSByZW1vdmUgdGhlIHJlZHVuZGFudCByZXNldHNfYWN0
aXZlIGVhcmx5IHJldHVybiBpbiByZXN1bWUsIGFzIFRoaW5oIHF1ZXJpZWQNCj4gLSBrZWVwIGZh
aWxlZCBzaGFyZWQgZGVhc3NlcnRzIHJvdXRlZCB0aHJvdWdoIHVuZG9fc29mdHJlc2V0DQo+IC0g
cmV0YWluIHRoZSBpbmRlcGVuZGVudGx5IG5lZWRlZCBzdXNwZW5kL3JlbW92ZSBvd25lcnNoaXAg
Z3VhcmRzDQo+IC0gcmViYXNlIG9uIGN1cnJlbnQgbWFpbmxpbmUNCj4gDQo+IFByZXZpb3VzIHZl
cnNpb246DQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNjA5MjIwMDQzMTIuMzU4OS0xLWhwcGlzY2FzQDE2My5jb20vX187ISFBNEYy
UjlHX3BnIWVkLVB0UTZkTlpLd3ZrZTBCaGg4bkZjbXAwVGltalJfUHhCVXFacVhvSDRsYlgzQXBV
UklOa3JHLWlBU1VZblpoMlF5S1ZMMHN2Tkk0N2dzRzdoRGJRJCANCj4gDQoNCkxvb2tpbmcgYXQg
dGhpcyBhZ2FpbiwgbXkgY29uY2VybiBpcyB0aGF0IHRoaXMgd2FzIGZvdW5kIGJ5IHN0YXRpYw0K
YW5hbHlzaXMgYW5kIGhhc24ndCBiZWVuIHRlc3RlZCBvbiByZWFsIGhhcmR3YXJlLiBPbiB0aGlz
IHBsYXRmb3JtIHRoZQ0KcmVzZXQgZGVhc3NlcnQgaXMgbm90IGV4cGVjdGVkIHRvIGZhaWwsIHNv
IEkgZG9uJ3Qgc2VlIHRoZSBuZWVkIGZvcg0KdGhpcy4gSXQgYWRkcyBjb21wbGV4aXR5ICh0aGUg
cmVzZXRzX2FjdGl2ZSB0cmFja2luZywgYW5kIHVud2luZGluZyB0aGF0DQpkZXBlbmRzIG9uIHJl
c2V0IGNvcmUgaW50ZXJuYWxzKSB3aXRob3V0IGZpeGluZyBhbiBvYnNlcnZlZCBwcm9ibGVtLg0K
DQpCUiwNClRoaW5o
