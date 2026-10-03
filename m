Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE8950276;
	Sat,  3 Oct 2026 01:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790990796; cv=fail; b=pxHm8II/UvE8XtMfb2amqmkffimninEsomjFxdQ7FWFqSOfoh4RSKTn1tmysO6omdz/TEQXgAYHCqtpHzPJ4BajAWo0ClHjQwzpJ1eQ1LuAkivmUlrzUX7coNiNzptgBtORxHdC27YG9zF8YVPclddHzS8NlvOLyfyrwMQFviDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790990796; c=relaxed/simple;
	bh=7TUFi/Fndb+BM3Ota6qIKqPaa27ggyyG9Qa8ww+oQvw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qADPrTn6//oNOW6hebB/lAA2shP3eYrlHF1fAcId9tNFn1zL62Zlq4g/5iLu6h27FoYOln3U+Y0zHKVvu6H8e3c5vDplRiGRPKtD7hFJgzkG1dBkAaZqxaYJVl+bE235M6vI5IcCHjPZ+z+HoExV//d2XhfH5OJ/gzc/sclrHFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=nd38419d; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QF75H0bN; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ubdxEuwk reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="nd38419d";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QF75H0bN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ubdxEuwk"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Nf7Px993883;
	Fri, 2 Oct 2026 18:26:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=7TUFi/Fndb+BM3Ota6qIKqPaa27ggyyG9Qa8ww+oQvw=; b=
	nd38419dTJEily+FTazTOPzwitFU9Q9RH5jRQl13zHzL+BII9UYduhytt8I4FK2V
	H7/a6fbFaCVnnznPtNbgcFHKoX7VRcNulGcFFk0lm/qsprz+046w+YWtypNiizvZ
	yH5GpJDCkMta/7PN9nwyyTH+vz/nVZ4k8hw2+1ExW1HUaZu9LZ1q6w271PzaP1WO
	I8m4Tg0R/7Luz807zDKXXsZ+DkbIhzi6VC4cbO3fi8c/NxvQ6BhEV7OdSGP4VM7w
	GDLPiv7QQsx0HNTDa4B1RtEMz9spM690c29vmtpaveLgHukZmc1/98Zfh0rdCrg5
	ZaJlIr4SdcjtGlva/6GFnQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4h28qyp137-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 18:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1790990778; bh=7TUFi/Fndb+BM3Ota6qIKqPaa27ggyyG9Qa8ww+oQvw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=QF75H0bNb5qrUKA4Htq7z4VFJDmPmVyD0VQlyQw1zSwEvdXKllJVciUHTA6KIU3eD
	 jRAJjiZmMg3Am1f6KIwD62TIBG6CNlLdHlcS7VzoAyOesHIcLYyXhKcb0df5dWZnKw
	 nE4smih5hBMAGPUa0KUnGk7L9MXX3atdLwWZK0wSqbx5DldQsdxYqBSDeLDQMn99Wx
	 gWyGCbkiz+81fnzPBa1vvcIMkapV9d6cfh2WzIndGBCtPcmox1PpnwgT9ofhEE1zah
	 1mAvBLnDjiPRM+b5y635+qV2gpS5pqGWZAI/7gmoeBvIPrkxnLchPkVzyCoyF3FvUP
	 G0eRiYRRTzmzQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2D1CE401C7;
	Sat,  3 Oct 2026 01:26:18 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E1C2CA0822;
	Sat,  3 Oct 2026 01:26:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ubdxEuwk;
	dkim-atps=neutral
Received: from SN1PR07CU001.outbound.protection.outlook.com (mail-sn1pr07cu00104.outbound.protection.outlook.com [40.93.14.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id AD6864044C;
	Sat,  3 Oct 2026 01:26:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWUzfYcIAS5LO3KN2+AjJ1zvanJFj+bJz3Xkxwg9Sin6NbF9QIegKvzALmcHFFvQSSrqjK1zVJJVrxSZkNW+Twi03iIq05uXAEUmlZmIoZNcT763fz7KMduMwQsVeRFNvPPiwvfWFkeGN2UHwpHFCgFAzgs5Pa7lapm/y7fiv0+IBjTiKtytVEOvekAofUKK2TZ7uUsiWjOBjAI6qyUF6DnLrSEtY4Dzus69NrTQ/4ENe1S2b7d5sSMgFh+0bQoJtQTQZu24I7VfW91xYNi17TJXcQynjBD0rjUbtGRg0s1FJMBNKa9yfcXsYTVRI1C1vpJZugCxvwuy3XbdRH0fHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TUFi/Fndb+BM3Ota6qIKqPaa27ggyyG9Qa8ww+oQvw=;
 b=jUL4t2QDpwQaL3lI+A0d4uwOYg7zxqw6IeR4T0dHxrsKiExlGdZsHx2BarukNC5D3B8gr/UfoAeZtrJN9K39HNjzCAYkTVwdNk5wjP8oUAO2vyseF+ZwKDD85Z9jCJzO8Sli/D0isxv9Dv3/9ip61bmNI672jVyDeNQDuLkUowMeT8V5ZP9IL/sq02E4h3+65xcGWuKQD6apXCwE6i3/IRBcXA7n5AVMxZf0DJ1vOpNJ6gO9A3+N+Dvjpnu1FzRAxaaJHvjIkhc/6ZWD3/hnlkrSoS4CUKPsydZBlD5ylM7dwW7e/eS7phbn3Lr8XVavXh4LesHaVtaCs2kCkbJ5Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TUFi/Fndb+BM3Ota6qIKqPaa27ggyyG9Qa8ww+oQvw=;
 b=ubdxEuwknWPIzr96PdMmswKFUksvJgxMTd+b5jUVxVj9hsT8q1WkEklntsFyTAKwN5B8S7IxLiy9Ue3Hw19ZYzo2DP0OEMaYEafYSpRh/PXUUQHqr2JZgjVEw5fHeWm87ue+olnbWDYNfMB5lkaZZkxkizt2/NX/5fEfpFOeVUQ=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by PH7PR12MB6833.namprd12.prod.outlook.com (2603:10b6:510:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Sat, 3 Oct
 2026 01:26:11 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 01:26:11 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Guangshuo Li <lgs201920130244@gmail.com>,
        "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
        "khilman@baylibre.com" <khilman@baylibre.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
        "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
        "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH] usb: dwc3: meson-g12a: disable VBUS regulator on remove
Thread-Topic: [PATCH] usb: dwc3: meson-g12a: disable VBUS regulator on remove
Thread-Index: AQHdTBSBrY/eWidA/UeuDfRugteRWLbpoSOAgABnnQCAAQs/gA==
Date: Sat, 3 Oct 2026 01:26:11 +0000
Message-ID: <asBZRy_kNaEP9WGs@vbox>
References: <20260924110429.1557653-1-lgs201920130244@gmail.com>
 <ar8iVIgFdBpIbCsl@vbox> <2026100239-swarm-hacked-015e@gregkh>
In-Reply-To: <2026100239-swarm-hacked-015e@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|PH7PR12MB6833:EE_
x-ms-office365-filtering-correlation-id: a388f9c2-e8d0-497e-33c6-08df20ed4f15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|7416014|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 ZeAzDku238cj4TKzorjs1IrvOzOXWAHc5PxJIqLGkAuJzVQ2/hu1xuEmsKXZsFBKdK2nBRwpvtpi/ad2GMM5CZI0F84ReFEao92upjTp9n14ZGN2Pm+UucUdrGxyM/VbtIU6pBFw0okK/I6DUxi3jvhUc8sCy9swu6Wszoz43d2oFbbuXu7VHCTXmvdYa8AhI4205QQqyC3ANP4IRNoiNZd7gzNEqv9qrkTN3g1mzBUIoRNTGmcaLreQotLauxcBEFnssfHr4b8l6zHQ1xJN68SMAqsHPw+r0pYFeQJuxK8aT3wcFLe3FH62BRKaypKUUMsyBaA7X5ivJXYrr34mD8FjtINJxkmKqovLJMZTD3LtZyHG9tpTP982FNejdZKRLBBENNbnHcz5pjfBgtlyWDDKKUZTE+t8pFIU6bS5NNKnFSq3clgmCOV8NXeJEEv+WDRbHS+RAtO2SU4oOX+Wmx/vayt5GmRT3fQl+PjOD4e/Yk+kCWuf5qJ7LyXYRk2NSuW3Lr7o8557QasemC/dPJ40WNGapy1Y+NqpyXPuWLSrfm4KfPUW6BYO83EaWBzoVss8rf3SkVKSwrnVpOc+8Qp8NjVZIg5lhxuRy2C4Oli4wqDkCsKh94Sj2GjHPlZqLZEdEL4r13QXIOO1LHPN18Gr58/IRL6yw6/h4PWdTMZ1uz+KJMEkismC0vZsasle0QPJkORAkMbdWYq2hvvfCu5pBgGvJqZwbovAj3E2BVM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(7416014)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d0lvTlFKZmdMWjVwNGh5ZTFVcUowaFdzcVZHVWczN3dvTjFTSWEwNHdVOXFC?=
 =?utf-8?B?cEFqLzhyN3JaVjJ4YnhYaTV3aXNxaVlyUlBjQU0wcVV6YW96OFR3Qmd1dVg0?=
 =?utf-8?B?anZaN3hnNFV3OUNYUE9tUW1jQUJwWHR3QXN3SklmQzlYZW52cFNTNzdHOEVu?=
 =?utf-8?B?K3JIenc1dHp2bVozTWVseTZxb25ydEQvR1hFVkRZeGlIMmZaeksrYmVyWGMy?=
 =?utf-8?B?SmxMR0F0OUQwa1FjUUFpbXkyallqdFhTSW5tS3BWaXR3azdlWW14dWRvSHlK?=
 =?utf-8?B?Rm5oeitYaEpjM3diNHQ3ZEYyQUozSlo4NWRBaE9CVkNFU2V1UTR1WUczbi8v?=
 =?utf-8?B?NzJ0U3lFbWpSY3VKR3AyTWlUM3JnY3p6bW1PSS9EZEFJbGZSbDNJdnlpbm9Q?=
 =?utf-8?B?eE5CRm1QNnRXamtiR3V1RGg1RFhrSzFFdzBvQ2l5VDhIZWloaFBxbmhmUXNJ?=
 =?utf-8?B?NGhoMjl2QnR0U0NXR1ZZeDVjaGpKdWdhbUdYamN4T2toTmNJakUwd0hXdWFm?=
 =?utf-8?B?aVR4RXFseUtncEpGOTRjcGo0TkdsV0pxMVhRSjQrMEE1Sll6YkFEdXNhbkNG?=
 =?utf-8?B?Mlh0VnlmamxVbjJFZ3hJTU95ZWF5MWloKzk5a0s4a2c0bU5Jd1U5aHFhUlRY?=
 =?utf-8?B?SkVxZThxeTFhOUlYS3ZqSnVydzYrMkJ3bjVjT3d3aGZXNHh2NEJrRmYxblNz?=
 =?utf-8?B?b0czdmNLeTM0ejExMW1hNk5wcmpFdVczNGFpVVVjc1JCeEx1ZXN4Q2tpaTBT?=
 =?utf-8?B?L1ZyUmNqSU9xR2FDRXppU1VJSzZZMWJvaDlmdWZ4UUhUNVF5Sy9FVkt6M3lQ?=
 =?utf-8?B?VVdoY09zTjJjN0g4RkVOM1JFZ3lDYWp2Tld1V05RREk0cEtrSjg4Q2NaNzh2?=
 =?utf-8?B?ZUNKSEQ2RDhpM3c2RkJ4UnFsdU9sMmhrOFh3L3RiczhNOEhMbXJqalVvVTBl?=
 =?utf-8?B?RmpoNnVjKzR0N2ZTWUpaRUlhbGtsYUhrYm5VNWJjcjJGNDFGMFE0djErdlps?=
 =?utf-8?B?S3dibkhkc2JYNWJwMHVqblJNTWViNmZldFFKMjJocFhpb1I3SFdORGhETzM4?=
 =?utf-8?B?Mkg2emE3WnhKK3FXdEUyd0NoNHJDV0hIR3U2UHNHNkl1aDlNZjhwbDhwRmxF?=
 =?utf-8?B?ZDZRWlBlNktTdXRqVTJqTjR5YjNOWlorT0I2VVFnNHlQelQvTkZRaC95c2VD?=
 =?utf-8?B?QnVwL2JESDB6V1BIV1dTQWZvSXQ1a25qdzB4T3RERlduWmk4MUNScDRxcnE5?=
 =?utf-8?B?cUZFYVBtbGk1Y1ZpUURDRHdQbEc4em16MUd2ZmE4Y0ZKQlp1SnJ1VU5XS1Jw?=
 =?utf-8?B?b0w5aFF5eCtsUnl2SktJR0ViRmh6eEJNRkZxQ1VSRHY4SUtURkx3Q2d3YVBn?=
 =?utf-8?B?VXQ1b1hLMUsvOE9WSlBnRmhDMlFnWnRtb2g3U2hFSm5WTnlVYkhpa0dpK2RN?=
 =?utf-8?B?SEZhT2VYa3ZxWVlZUTlKaDVxMjh6Vy9vaWtIZTFVOXFNTEdsYlB3M2tjSUVV?=
 =?utf-8?B?K01lamxTN1pZYU1GMjVuNzNNTGlLbnBBOW50OEU5V0JzMnFDdno1dFRCWERm?=
 =?utf-8?B?OWdpRVlXeFkyODRYeHNVM01qdE9NNDgrRkNhNkNkMWhOenlhSk1vU3UxR3Z6?=
 =?utf-8?B?WldJc2NaZC9UZlI1dFVOdGk5NzJ0OU1ETUFraHNMc3NOeTJDcEtRYm1SRjBl?=
 =?utf-8?B?Q1V2amVXVHdPNGovZzJ1cnozU3l6ZUF6NzR4b3hXdE9TVFVXQnN6Y1QvTStw?=
 =?utf-8?B?YjFZWjZTQVJXMTlYUzRQY2hOZVVhbkJiTXZ2TWlLUSsxNlFXcGZFaUJYenlB?=
 =?utf-8?B?QkFUU1ZyVnBxaUxWNkEyOFRMaTNEUXVvWVZKNm52YWh6OS9jY1ZTazkwMUlX?=
 =?utf-8?B?ZHN6VForMjl6ZmNPL2R0cVBBd21LN0U2Wmh6Y2FRalIxSEdTM1J0RlpNUHpm?=
 =?utf-8?B?cVlISWcyampkVVZPclBUZGdEc1I5ZkpVb0dWQkVZQXFBVVBxeHBkNFplamRC?=
 =?utf-8?B?WXR6WUdEQUdGc25XaVJQdlpsekZseEJlbExVZGhSUi9hbmVOT3FLNUVTOTJI?=
 =?utf-8?B?ZnlVQUF6bXFnUUhKblN3eWRXRmRRbDFhNW1mVDBKZUxBS2Vqa3ZLdHlrZE1S?=
 =?utf-8?B?Z3BlL3JIR2ZxMklCQjBHaUlhQXZIenFJbFo2QllJS2VBY1IxUThVNDF6S2hS?=
 =?utf-8?B?SWFqL1Y1R2RPcldsOVlFYnhJOUh2Q1hzbFVxS2NJWmxtdzVkT005RHIrTE5Q?=
 =?utf-8?B?bE5XNUFjL1YwM0RFUCtXMlNudFFQSHFnY0loanc5RldlWC9heTB0OEY4dVFU?=
 =?utf-8?B?OVdNNyt0QUFLMlRRaEJqdU5rc2R4amdHS1lUVDcweFBqejdtbUJKZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <828B93ABC3297F43A1654F7855FB6EFB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	I/3pnshmkMOjfAFllxcY03mRlpV0VEJ6wPjfJenv4EqAbo5c1yKXbEMyIVdse9dge2Pv4FxJr8E9rWqv38HlIobsmNC6GH7WmlVY8D3dVHw9kTRbmR57lD6tWgVr5xN2JgPNzXHvaVsT0X5Qd7pguDfmdDUmZrFWgpJlBDRIa1Z++fAV9tKSL+6GbTX70B9EqFKvQcOR/vD6yFayIGhhQToQCnjboobh6UMRLIAHVTVbcQoRoOuLg7HavRimqXQqPnAIl/cKh0LoLGkvOVNeB8+S4Q+OTYyGWA4fyjHZj/F1JTN8RgW4OpoF5zDfQcOEh8FIE/nVhf+PYJONF8Yt5Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	t6ynWgcnNPcHibjEP5JwJmBhUAWbsA4FvXhbfu1Z8j6FtOsINVfCd7JmPv++rVY1RanJK8AbXM5cGonlecVz3KpATjuMXqBrRDDNPDIUZbWWwzCUc/r0/oyqzGHzuh5wUR69VJCR5luv63sH+ToP/lAutyQnPmV1SwN2lvRQYC8RC9EhNvgMDu70U7N72miIcGISWdYeM7/jB5AG0B1cJOa7/D/j3eyP/8rymYsnXkRuvaN35j7HAj94Nu1NlFqur9Nq64j+py8gyR7H/s3r6Nlw/seoJCYmQSmsN25oiDTKhf37pba3nD/jkF2thVtVKf0KF8PwsyvBi2INCkZrgUDCJqEyhh9Qbks4lU5Z3q7eJ8eIQPkCOkyEelGiOcIP+7wzV4lyg7uWnDSEQjivzPD8U/z9UY5G5U/3iFzYsmj25g7cLr/Tk4yjjoJkW1aR+7HXDaua6BMk8lwQvR4jUUHMdhdRZNvttaas4xRP/kQ144vC9zEPdcOSxd3GTZisiO+JqR/m8UZ3fMIJTpUn7TCPyStUZae0IsC9PHFiSePaqthm06Hj7xjV6TQFDheO4V3vdlI+M+3OKn+odfDqDzo/+OqFPtnkYR2jcGW21GRCm2SMf0rfKbkmT+2N5oqHLoamN8b/OzkqONfjG8GUzg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a388f9c2-e8d0-497e-33c6-08df20ed4f15
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2026 01:26:11.5774
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wYlKthW3ApEvyfpwqGZ0u7fCwFxm7saNI0bjdf+OR7Wqhu6y0MoJJcMJLWBp6LC2N6gaoYb1s61WPspAdc0iVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6833
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwNSBTYWx0ZWRfX2Z5sRlmEHUly
 C6rU/mV/PPtnDsO5RpaYEFOz/14WokU/8pbaMcUUfSj8NL3NolVXDF0USiCxfPcKQizBBrv9o2z
 fqCXqYySj+HlYBL5PW8S8B+a4oC5BEE=
X-Proofpoint-ORIG-GUID: 2Nw5UyooprrHlHwfEWrcFOfJyp19l-zO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwNSBTYWx0ZWRfX3GaaWz6UEMrD
 jTyP+0wolKw+woNmPmKFZnxJpbu0+JX+afVgNkwRoqdTA8kn584H9GaPbEOt+Vt5qyEYXPhrUvh
 L8ghBdJz61wbPzKzhGW/YsoA3kiOVoojCs1picdTi7hxSGsJj9x0q7s94Yy7uDgOUGjQPX+lRG+
 AzsoF/0FI1pXkptj0xEPMinoNXpdua3R7qkM3eQTmfuN56p082jCVYuDXIeFim4CjQSbL2HEmCT
 wfyl15F9Lgr030+Z3Ly91lbEKr9nQ14A7bQMNv5tTPNbhrclhD2lJ6TK2ldPfsjqkDvMB2zz7Mz
 L/dy3ODijxMUTCfnQlx5Pp5uzD8+7e3Wt32tbmApdlW6Ds5u4Q4c6LOYJPLMwg63SeLAp1O3RS4
 LbeA4i2ZPJhGVcLF3H1R2FY6hPLqzPpnxZKa0W0DNgDseFi8/0i435+Ycvic3rf8JtsZ9CX6fht
 2iALiJc+GSnK49D07Ag==
X-Authority-Analysis: v=2.4 cv=Vrm2kO2n c=1 sm=1 tr=0 ts=6ac059bb cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=ag1SF4gXAAAA:8 a=eei9o5xOzoxCoDFOK54A:9 a=QEXdDO2ut3YA:10
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: 2Nw5UyooprrHlHwfEWrcFOfJyp19l-zO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2610030005

T24gRnJpLCBPY3QgMDIsIDIwMjYsIGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnIHdyb3RlOg0K
PiBPbiBGcmksIE9jdCAwMiwgMjAyNiBhdCAwMzoxODozOEFNICswMDAwLCBUaGluaCBOZ3V5ZW4g
d3JvdGU6DQo+ID4gT24gVGh1LCBTZXAgMjQsIDIwMjYsIEd1YW5nc2h1byBMaSB3cm90ZToNCj4g
PiA+IGR3YzNfbWVzb25fZzEyYV9wcm9iZSgpIGVuYWJsZXMgcHJpdi0+dmJ1cyB3aGVuIHRoZSBv
cHRpb25hbCByZWd1bGF0b3IgaXMNCj4gPiA+IHByZXNlbnQsIGJ1dCBkd2MzX21lc29uX2cxMmFf
cmVtb3ZlKCkgZG9lcyBub3QgcGVyZm9ybSB0aGUgbWF0Y2hpbmcNCj4gPiA+IHJlZ3VsYXRvcl9k
aXNhYmxlKCkuIFRoZSBwcm9iZSBlcnJvciBwYXRoIGFscmVhZHkgZGlzYWJsZXMgdGhlIHJlZ3Vs
YXRvcg0KPiA+ID4gYmVmb3JlIHJlYXJtaW5nIHRoZSByZXNldCBjb250cm9sLg0KPiA+ID4gDQo+
ID4gPiBEaXNhYmxlIHByaXYtPnZidXMgaW4gdGhlIHJlbW92ZSBwYXRoIGJlZm9yZSByZXNldF9j
b250cm9sX3JlYXJtKCkgdG8NCj4gPiA+IG1hdGNoIHRoZSBjbGVhbnVwIHBlcmZvcm1lZCBieSB0
aGUgcHJvYmUgZXJyb3IgcGF0aC4NCj4gPiA+IA0KPiA+ID4gRml4ZXM6IGM5OTk5MzM3NmY3MiAo
InVzYjogZHdjMzogQWRkIEFtbG9naWMgRzEyQSBEV0MzIGdsdWUiKQ0KPiA+IA0KPiA+IFdlIHNo
b3VsZCBhbHNvIGluY2x1ZGUgQ2Mgc3RhYmxlLg0KPiANCj4gTWF5YmUgaWYgdGhlIHNhc2hpa28g
cmVzdWx0cyBhcmUgZml4ZWQgZmlyc3QsIHRoaXMgaXMgZHJvcHBlZCBmcm9tIG15DQo+IHJldmll
dyBxdWV1ZS4NCj4gDQoNCkkgbmVlZCB0byBnZXQgU2FzaGlrbyB0byBDYyBtZSBpbiB0aGUgZnV0
dXJlLi4uIA0KDQpUaGFua3MgZm9yIHRoZSBjYXRjaCwNClRoaW5o
