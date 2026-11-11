Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794366087;
	b=TK7ZfNvQVkk4450FLMsvDprZSlCSrB5xkYW4c8C73PgpWhTpOl9SFPEwVT2JALD2FfoS
	 uTdWdLjHttx1B4BeACoMsQ18Mo/JDvltnhkkWNEi9A72/0Hm51odEIoJmldqD/FxfzX5d
	 dRNB9Pcjn1QUZov4VmiBWhC/ysGJc9NQ9sMTDYGx511o5R6FSusmIhUr2ws+pTI0AjBzs
	 sRWDFypUP3A1wL4KJGnSM1gmnlV5eSfS1CUixzEHR3lTLp1E8fE2c70I+v71EKlroeDNF
	 wb1rxb2Z/WzbDwzrDTRtop1K6uWeEMjsP+eZcDmgXrXwRW4j5NHIv5CYYF0hrUY34NA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366087;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=a3AA7ONJ3wboxNPLFqayfZx+cTTaPAKIdIuItmG4m38=;
	b=IA0/Pq9324/FXc+JipzkRbTlKeibTx+NlqRyEOhlRGT10xGdT1K5dGtrDVodVutwXk3z
	 XBlzIaQ/bIx+11ilihUsmjya/mwSlQIZCaeqZOPxJfsZ4y435ZjA7ny1d5gWp6H2VS4Rf
	 AAMc2O4lEKm2WWRKcrmDHDsx6Y0YkuqP6nTsNlh8bDpPfN5/ohlCuvhulmDbPrTiEe0Uz
	 moOSrivycDqueyXV+SGr3DdVTUIQ5lumfXub3qpJmo4UTdFQ6pB2HLKryKIVJ4bw0RJ8B
	 VtGn0WbHN9ATW5oTmtS7Mw8cI+d/AHoTE4TzwrqjbAr1xiOfk9tE8rj7H1Bv3VUFkew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=k1v1Jxj6;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=FRxf0TWs;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=OoJfTNOO;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0BD606A31C;
	Wed, 11 Nov 2026 03:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED0BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=k1v1Jxj6;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=FRxf0TWs;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=OoJfTNOO
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1vgZj3385471;
	Tue, 10 Nov 2026 19:01:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=a3AA7ONJ3wboxNPLFqayfZx+cTTaPAKIdIuItmG4m38=; b=
	k1v1Jxj6gP1H9Oz424qi5S9nAqsPGO+X9kPG9NQyvBHXILYiNdBz24RcDXv9Yfji
	eTOpzxFiiDNBp7zpxKoRmH/p5hJ6i1frTWKjctL0YGlyjqykcwwOj3gXQ+XTwSWj
	pfq11jlz++tirRcsUWfd8QRoBYrpDDCB2xyoP56P8m+Obm/7VGkugsXBrtJOVVI1
	nZlOINk7nGVR1wjSJG3p9w0Q9WMFBQ42EXLoglyRvoZwi/c+ih5eSOIQvE5KHNsq
	WUTGdQTZZ6LSp6aichUWs0+AHsnGkjAPaSUANghJT4cXfY7cqmFc90/4Go2rPcbZ
	6zt2/hgAGXie6y1hsCbrog==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4hv6p3c6fp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 19:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1794366061; bh=a3AA7ONJ3wboxNPLFqayfZx+cTTaPAKIdIuItmG4m38=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=FRxf0TWstJi/HP+D4QSTCbudFBWRA71fkHkgJwxc1KQdw+9EKDHy2+h3T+D3iX7aE
	 BuHVTmszvb7XxrreUAn8KWAPxSreYcWlz0zu5NA9/TZxiAilVO72G5VYd1+RTxXV7e
	 bfchgYDKQUTGHoesLLUTq02YpsDHKL6hhWzLAjsOB7ZXmVNAU+5J2BztZneAl7fcW7
	 TICQj/cYNzEUw7grQQtTZpoKnx5ibNXsPuHEUDZ9wB+fERPYZ4LirCTp//a8yoMYZN
	 5fFkrfRp2y6xD8SiUm6fr3pLBickY9O8NbXAVntbLcOkAPDUEGf9+BwIjc2/i9UzCw
	 W7cTVTjwluetA==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AB59440555;
	Wed, 11 Nov 2026 03:01:00 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 6E71CA075E;
	Wed, 11 Nov 2026 03:01:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=OoJfTNOO;
	dkim-atps=neutral
Received: from CH4PR07CU001.outbound.protection.outlook.com (mail-ch4pr07cu00101.outbound.protection.outlook.com [40.93.20.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 01B5840109;
	Wed, 11 Nov 2026 03:01:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMK3wKP1kTw7NqRZFNAYitCinVDEY6aKiGPcm/lq+3TKkTwGrozwjzIw2meX5wHBEKUZlqss9ZRsCd4xo7mmZUu5OkOmLDTQypIpPeghoqC53zHiHp8qp8OLl+rmCqmxUZpb1Ko7z43401QD4IcVaIAU3eQZBtJS25TxauG8/35x8jYLs74hOj5hrcgSssLXNRvv+gVquPrDV7nMuDuFO2xAePvkal46k49jJWKljWg/sLTgPuye4f3j3LO9pt8NLTQVa8llJdvrjp70DXDxv3Fqa905rNBBMdtgXDU05tw2KFclpSvCYo+rS8e1/+jYN/gWWvE1jdyKyRSW4pV9JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3AA7ONJ3wboxNPLFqayfZx+cTTaPAKIdIuItmG4m38=;
 b=W1aIBFEp2M4PjXJB5DYNijP3oJ2J5cBc29X2136EvMH6D94gsDtdcC4dEW5lJHL03XKx3cjek+HjYGpT2iprtct09RRquvRM8zUfnPsvLBJO7xRN5kuXAf/a+mYdUeNZ0RWYd35gEUHyaIvtGG2W/g/FDUaQzHeshcoHsHMVtQT4cXQluE7X0Z21hs+XEF04ko9GkMlEtdC8cx/FkdxCEqnoiw+J2Z875WIF6CCrYaTfJ1evhKbYbp5uNjsiSolXVYDJljcz8soAUk6IJGdo7k/AeCJyrea98krq5yxzCQ87xPLlu+xKVFrr996KSlvmUXcvRnuw6JjRSSZy82pHtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3AA7ONJ3wboxNPLFqayfZx+cTTaPAKIdIuItmG4m38=;
 b=OoJfTNOOUCi9jTG8SP1Nax+6Lc1fMhS5R7FLKCxthUr01qf099njHvnCsELG6Mca9q/YkG5c96100mSnITrPbkm4myuCZm2dYFNZCOfN+kbBdJP1Vc6XNIuLVAYRCyHkiFUz+yts6ZN3jpTqBaROxrtYC5j2rn8LO5f9YvFf50Y=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by MN0PR12MB6032.namprd12.prod.outlook.com (2603:10b6:208:3cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 03:00:55 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 03:00:55 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Vladyslav Tymoshchuk <tvlad744@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] usb: dwc3: qcom: Defer VBUS override update during
 system suspend
Thread-Topic: [PATCH v2] usb: dwc3: qcom: Defer VBUS override update during
 system suspend
Thread-Index: AQHdYnan5UYfhcgHMUWgaIHS0yhDQrcdRcuAgAAhVYCAAUW0gIAI/i0AgAChnwA=
Date: Wed, 11 Nov 2026 03:00:55 +0000
Message-ID: <avPYz8Bph8D7LGSX@vbox>
References: <20261022224220.480-1-tvlad744@gmail.com> <auqXyUxc9cRIuYou@vbox>
 <f9d27fd8-cf33-4e6a-a9fc-6770a933cfb3@oss.qualcomm.com>
 <auu9hx_Xnjbi3WkB@vbox> <20261110172148.1640-1-tvlad744@gmail.com>
In-Reply-To: <20261110172148.1640-1-tvlad744@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|MN0PR12MB6032:EE_
x-ms-office365-filtering-correlation-id: 15ad0265-9609-4600-9ac7-08df3fa00132
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|261009223027099003|261026140227099003|3023799007|261028144727099003|261021121427099003|261022075727099003|261102123227099003|261022105027099003|261026121527099003|56012099006|11063799006|5023799004|38070700021|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 YyUHg4wehVV1hlxAVdPsbrvYfKlJBrgF4tYL9iyKHRMFfskNoqACJK4o9XsBgQj6r35go5SA152rnn9VfFcVuVk6Ue5uM7Wy8TVYtyTudrCeqLymG0fitesM3Zrn7SvM/keSCU5rEjd9GQ5rFFZH4XzUIEC/gbHGPmKQ7+Yv8hlvCtytso30jGHrGqjb7Rdz3lMO/3cyickcesc2rfkpKEZ/aa+xvqict3COyYLjUDfUd37e9X2pG4tdIag3B0udaHLHsMijB3r0kvPNNk5kOsAobh4zAf8uWOkySpOba7gMamI+CRvcvlzgjbF0e0tPcuNznblmNtDfczoDy5QOQ41+688AD6T5nh/i950Z4aHX+ivEpHu7v2blELb9fhm+HhYrC2nM3AErbxJlMy+yz/u75iMn3eUrs/67YkYmI69COsXC3GNqTOzhXc7vYthuPdr8iELpdiYXLnE4sr8qp6IOwWvQibjnERhHXD3arQrIMkQLhMLb3zMuy55eHq6HmwD/6oWP4g5YZzCUtS1oZC9d7cWbuLO4EYRBqGzvGBehay93FjpgDFMpaFHQgo88pBAxabWVafTwhVTndjCF9J6SDKDHT7fYFgv5dEf1bdZmAEObg6aBTB+/4o9sKeUwppw1IndDtqCQ+R24YVGSl3RwVW/3A7xKZZuERTvGjn71IEk8ho1cAIlI6PiuHEqIwnN8XD1mnc2sKE2bibkCoeGh4AXTmkLsENbByY2cqUU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(261009223027099003)(261026140227099003)(3023799007)(261028144727099003)(261021121427099003)(261022075727099003)(261102123227099003)(261022105027099003)(261026121527099003)(56012099006)(11063799006)(5023799004)(38070700021)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dEt4b0M1TUhDTjJnK2NrdFJleTJvYWhNL29TNGF6c0dXeWNpUEFUc2NvSGlC?=
 =?utf-8?B?QXJIZXBrSGY0NVk4cWNvY01DWFUxVnlkemhibCtnNVVKQ0pHbVlsTDRuMHZt?=
 =?utf-8?B?QmJhL0dXdDB1bkJLZEJsVTR6czhDYnB5WkU5VG5nRUE1NGFQd1krUXdIMDN4?=
 =?utf-8?B?WGV1K2Q1L214Ty9XN3N4VDcxQWxMRllZMTl0eS9UaWV1TnFvblhqd2ZtcThS?=
 =?utf-8?B?U3M2eU9tU2Iza0VNVlk3ZElNdVBoaWVaVDBCa0ZGTHU4QjR0Ritqc2dscitx?=
 =?utf-8?B?cUpYRWNUeFpqdmd4Q1Ava3crUFJYcTlrT2JFR2NsK1FyMko5SVdqV2FDeit2?=
 =?utf-8?B?cU10Ly8wL3VDZXZCTmdOUzcrc1hXOEwyblg4Tys0bWRiZGlxSDZSNHpSeWFl?=
 =?utf-8?B?L2VkVE1xbDJVWnRCR0xGdHplL0toOW9CNnZRUzhLcnBWc2dnUEoxUmdCRFpO?=
 =?utf-8?B?VW0yaWUxRmtzaUp1QnBBbDd5Qk5adjRBSEFTbkVFNXF0ZklvcXRsdzJBc1Fp?=
 =?utf-8?B?YnRBUmwxeXFLT3luVUJBNDdVdnI1TGdOZ0RWSmdVT0t1S0kwcVZMd1JRbXZQ?=
 =?utf-8?B?VDIrZE9FaHFsWW9xQk52WTVvbSt5RnM4SGpvK0R0a0NmNHEwQUtaVzVjTmFH?=
 =?utf-8?B?cldTRktUMzBSNlRUQ1RRRTBabEpmWWM2Snp1aUNmUW1Xb2pPb1VPWHdBUGUz?=
 =?utf-8?B?NHhNUUVJdFVOQzZJSlc5cU50YVhvMitzYXFlYmFJRTJlenJVWWZCVitqeW1j?=
 =?utf-8?B?Vkh4TWV0Tm51dHNPWHZGcFViQkhMaHdwdGtKWWs1T0k5WmJ0K1kzd1ZoMk11?=
 =?utf-8?B?b0wrMktUSHRRMDBmK2tpM0ZOOFh0d2JZd0pmdkZBWGlYbnJJTXhEdDRqNFYv?=
 =?utf-8?B?aVoweUozcE9VY3pEU0h0dnAxMytWWWh2NU9TTEFnRzRML2ozTDIyUW9ZQjZo?=
 =?utf-8?B?S2FndXRlWnBQaUxKVWlwQzAzalNSejZ2cjBTR2pidWtrdzNlb0ExR1ZPZ1lI?=
 =?utf-8?B?NnZOWjd1Y0Y5NWRsekNQcEJYeGFiQkNidE9lcUplVzhxSHByTldKYitLak04?=
 =?utf-8?B?M040N2ZVYUh5dDRBZGUwamI5MVkweTZVM2VTNnp6STI2T2taVzBacGNrOENr?=
 =?utf-8?B?QitjamRyQlEyNUc2SHNkZkdrOEV0dFJ6TFJmbTdiWFFkWXJFU3R2V0VkYms5?=
 =?utf-8?B?QVZhNVU5MWgrWmNNRWpqNGlFRDFoR1lwZlV6UnhMcVkxVjRiYk9YeW9LMWYz?=
 =?utf-8?B?NUl2YUVyNityQUN2U25iSmQ1bG9HcWR2MW9jMHBEdTgvK3Z0K0F5ci9qUkZJ?=
 =?utf-8?B?N0ZPZ3dzQStIeEFGem9hZU93Ylpldkg1ckhxaUxpM25WRVJ2eXRRSVRoMW0y?=
 =?utf-8?B?NXFaVDh0UnJGdEcrS09FZUp3b1kxSmg1RnN0SFpDQVJ6NHpZZWY2cGZyWElk?=
 =?utf-8?B?Q09qaWt2ZVVCbEYyNlpCaFYrcEozcUZNKzAzbUV3SXlGMFpDVC96Z2ljdXkw?=
 =?utf-8?B?L1EvRVo5azFyNUZ3TURZUEExYkZpZkJFVStLdWc4MGNzcWdsV2Q4ZzNxR0lz?=
 =?utf-8?B?NTFGbVE0bllSeEoxeFBTVDJxYTNaV0NXVzNCZTBva21QUnlsQ0YyTGdWQlVB?=
 =?utf-8?B?dEs5ZmJuRlNjSXBMNFltU0VNbFZXalNCWjBBZzIzTjFLbmRQcDlvZUFvd2Ez?=
 =?utf-8?B?ZUNJMjJEMm90aStqVnZ4NzNwdE1ZZXo1ZzcrSUlNelFyMkNWdnNWbE9iSksz?=
 =?utf-8?B?VGlaQm9Ubnl1WmRrcitaWTB0dGU0SEhJelFEZHI1YkVzZm9iNFl2d2duMGFv?=
 =?utf-8?B?NzFpaVh0bnNHRTFReEtCSStrUEtuMkpoRllSNTlsTGgzU2FQdzlZeWIxNkdV?=
 =?utf-8?B?eDV2dzBOTCtQelF1Um9rN1ptTHVVVGFFOHpVVlpaZ3Rpdk9aVWI4eHQyUFFU?=
 =?utf-8?B?ZFdUZXpDckszOE1RRzZoVGVMVUVRdFl0TEhBc2I1RDZpSE9mT29ld0JGVzBV?=
 =?utf-8?B?T3FvV0s2d2RvNXlJKys5MHFIZ2lEK3JEWXJ2OUlzWkNLbjhxTFdFV2dJSnUr?=
 =?utf-8?B?dmFUbUJqV2RuMUpwSTAwRm5hMXpqYjhuRjhmM3RvRFNaQWcrYmFaVzA0OFkz?=
 =?utf-8?B?K2dRRU1tR3VwKzdVOFpJU3YwSW41RnZDZSs0Y2owbEdPcmdmWE1peGowZTRk?=
 =?utf-8?B?Tjg4ODJad0FUVjhaYXgzTllaM2RVN0dwZnllbzE4dHRwbmFrYjIrSHBTYWEr?=
 =?utf-8?B?elNsWHFkRDdJK29hZ0tBQTJJUFRxbXhDQjROQWNMcnlDLzg1WVRYUEZoT1J1?=
 =?utf-8?B?bDFJbkdvU3E3OGtrNi9sVlNQOTZtUUlQWGZjb3kvWDNGYXM5U2hKUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F651C26F791B5E4195EF911AA1BA558C@namprd12.prod.outlook.com>
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
	XLhm1DhNY/CdAaGLLXVHckqrXXCMZhU+1fFxCEtQlNUnQTBPZ/xk7G5Sx3OP09yRsFj0ccyFOqU5LW8aCatZQ6j0xKvl+z4mZu02ZpGV9wrMON2cloehDRZzxPpyBC9W4y0sqXYCSZHfi7NrQuYqA2oPucKey66wsMgzoISS0vdozN1tUY4eO7GOBbCdbHbAwoEZzahI/qDPzjeAYCOMA43j0tSZFcX72d7gfq6tSJec87HWjKKI9qBm4ZrMQnyXDNMni4LEQeOB9WqZjl1r5qymmfSqfC4isqgBwb5WkD1js2Q6JMY+t3h2zrkqfbzVWrEzMu1DchynXjQqmHX9fw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CEUrkF5kvwfqeYMIKlIuyGbZSFxFNlDcXxsRYxUq2wT6MNXwB3qJ+uQPDWug9jtYc0HGltiT++XcyKcytbfae2VKhwHaITbr56bwCpQdl8JEgCdIydEFKHnEMVRlvD1vb7hLtVqZDYtv0Iywm51KTP/25nm9n9WXoAgltSqa9OwJGZ5FaQLWr4d1K+e5qvSNGofZoAUzZFTWClzqX4RdIz6XEDcw9NPGsVKKgGMpMbVfpBr8bdEmq7ePgIh1Nn/05MyCmORwcvD9Jdi43OrHJgskaG72VbWNpC0spgrWZoeJCxUhAD0eMRUvytoMURYVAo3aV0n2EtmWdvnRozLxvzt45PJ40mRKT+hSDQdWHfEwSemewK7pBTIPUHNOcojo4N5976BCsWxK5UGbyoO0REHmnHhziSlIErZWpbKb5dy9iRzx/uVjC8tg2JnytORCJtLk9xpUg0d90xM/F973+uCuMd0NraYl4DVYkUN7SD7/nsByinVObAbwegPhET5QOtmc1MzYxtqM/UlHOTSDk3KoLuodMDS8UYo0gsP1mb5WRmAS4wwAHNLXoioBmHGXSWmsebLS4+t0xK2z28NxSTuHrPfDGKw7dYhocKw71sLTxsZ5XJ+b3njEeR2JMguz5BwU0THp0NX1cqsqoWhf4w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ad0265-9609-4600-9ac7-08df3fa00132
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 03:00:55.7078
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QgC26777d87XM4XxD3quwpywsg1b5GzxGk2M5dABKC3HqKc8XlnNPQTOprCpa1JOXwOSIb9fGBbdl9P7ukSelg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6032
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxMSBTYWx0ZWRfXw4Xy+4xoyOvF
 yuhofrM2IJv2FdyVU2leEYbA25L8191o08Oh63fLdk2cY/D4Y6jm/ygFhSFLYoUnWuf3lZTyVxW
 WlqetrHrOwvvg3VEa3EQKblZNEiX0yI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxMSBTYWx0ZWRfX2tLWZEEX/fTV
 SAjiodi9S+MRmgcVK/CA9ZavuS3OGwYRAc4sDXoU0fuyxrRznkR7phPYs8YlCVqBPwiCuIidiMA
 J3CGkLUNs4eF5iiy+ghxyGbepPVYBevIYQmq9eFfLMtZnkp7ZCoLaBsnfy7SqssIJlOkStBrOCb
 Axr2PnMR/WEVUS0utOcc4V/4Et0o/ByV8SW6rd/jXCpvolyaSbaucH6ndLxFobh0S+6rEAQYi6E
 GixLzGRL1a52HY7jYn5EMOE3gLvjqjcrWOek5G8C6G/6zOrMqoWkoyo/mpigdLm4Uo+HfNeHy/I
 Bxi2lAL5GZwPZallCWQzXJrI70qVGg4TyJiNjrKYbP23aMyB2bS95zBdHIwG6chXWjrVKNiqeQA
 0fUgucLRJHjTvTkr2jzzS0i3rmURwZ8G70A4OxgP+Ah/Xsmai7i7mxgQXg2R8c0EMbp+jm+A0WF
 dlI8mFEQUorNKUdCMaQ==
X-Proofpoint-GUID: xdO-eJL-7bFqPG_tfAFuvgqF_92KluP4
X-Authority-Analysis: v=2.4 cv=RvVQvymK c=1 sm=1 tr=0 ts=6af3da6e cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=pGLkceISAAAA:8 a=jIQo8A4GAAAA:8 a=oHkd_wmwXBPC6IZXAgUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: xdO-eJL-7bFqPG_tfAFuvgqF_92KluP4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611110011

T24gVHVlLCBOb3YgMTAsIDIwMjYsIFZsYWR5c2xhdiBUeW1vc2hjaHVrIHdyb3RlOg0KPiBPbiBU
aHUsIE5vdiAwNSwgMjAyNiBhdCAxMjowMjo0NkFNICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6
DQo+ID4gSGkgVmxhZHlzbGF2LA0KPiA+DQo+ID4gQ291bGQgeW91IHRlc3QgdGhpcyBjaGFuZ2Ug
aW5zdGVhZCB0byBzZWUgaWYgaXQgcmVzb2x2ZXMgdGhlIGlzc3VlPw0KPiANCj4gSXQgZG9lcy4g
T25lUGx1cyBQYWQgMyAoU004NzUwLCBVQ1NJIG92ZXIgcG1pY19nbGluayksIHY3LjMtcmM1IHBs
dXMNCj4gYm9hcmQgcGF0Y2hlcywgd2l0aCBteSBkd2MzLXFjb20gdjIgcmV2ZXJ0ZWQgYW5kIG5v
dGhpbmcgZWxzZSBob2xkaW5nDQo+IGJhY2sgcG1pY19nbGluayBub3RpZmljYXRpb25zIGR1cmlu
ZyBzdXNwZW5kLiBJIGFkZGVkIGRlYnVnIHByaW50cyB0bw0KPiBkd2MzX3VzYl9yb2xlX3N3aXRj
aF9zZXQoKSwgdG8gX19kd2MzX3NldF9tb2RlKCkgYmVmb3JlIHRoZSBnbHVlIGNhbGwsDQo+IGFu
ZCB0byBkd2MzX3Fjb21fc2V0X3JvbGVfbm90aWZpZXIoKSwgd2l0aCB0aGUgZGV2aWNlJ3MgUE0g
c3RhdGUuDQo+IA0KPiBUaGUgc2FtZSBrZXJuZWwgd2l0aG91dCB5b3VyIGNoYW5nZSByZXNldHMg
dGhlIFNvQyB3aGVuIHRoZSBjYWJsZSBpcw0KPiB1bnBsdWdnZWQgaW4gczJpZGxlLiBUaGUgbGFz
dCBsaW5lcyBpbiB0aGUgcmFtb29wcyBjb25zb2xlOg0KPiANCj4gICBQTTogc3VzcGVuZC10by1p
ZGxlDQo+ICAgcm9sZV9zd2l0Y2hfc2V0IC0+MCAocG0gc3VzcGVuZGVkIDEgbGF0ZSAxIG5vaXJx
IDEpDQo+ICAgcWNvbSBub3RpZmllcjogcm9sZSAyLT4wLCB2YnVzIG92ZXJyaWRlIDAgKHBtIHN1
c3BlbmRlZCAxIG5vaXJxIDEpDQo+IA0KPiBXaXRoIHlvdXIgY2hhbmdlIHRoZXJlIHdhcyBubyBy
ZXNldC4gRWFjaCBzdXNwZW5kIHJ1biB3YXMgMTUwIHMgb2YNCj4gczJpZGxlIGVuZGVkIGJ5IGFu
IFJUQyBhbGFybSwgd2l0aCB0aGUgY2FibGUgY2hhbmdlZCBieSBoYW5kIGR1cmluZyBpdDoNCj4g
DQo+ICAgdW5wbHVnICAgICAgICAgICAgICAgICAgMiBydW5zDQo+ICAgcGx1ZyBpbiAgICAgICAg
ICAgICAgICAgMSBydW4NCj4gICB1bnBsdWcsIHBsdWcgYmFjayBpbiAgICAxIHJ1bg0KPiAgIGNh
YmxlIGxlZnQgcGx1Z2dlZCBpbiAgIDEgcnVuDQo+IA0KPiBwbHVzIHVucGx1ZyBhbmQgcGx1ZyBp
biB3aGlsZSBhd2FrZS4gSW4gdGhlIHN1c3BlbmQgcnVucyBldmVyeSByb2xlDQo+IHN3aXRjaCBj
YWxsIGNhbWUgd2l0aCBkd2MzIGluIHRoZSBub2lycSBwaGFzZSBhbmQgb25seSBzdG9yZWQgdGhl
IHJvbGUuDQo+IFRoZSBnbHVlIHdhcyBjYWxsZWQgb25jZSwgd2l0aCB0aGUgbGFzdCByb2xlLCB3
aGVuIHRoZSBmcmVlemFibGUNCj4gd29ya3F1ZXVlIHdhcyB0aGF3ZWQ6DQo+IA0KPiAgIFBNOiBz
dXNwZW5kLXRvLWlkbGUNCj4gICByb2xlX3N3aXRjaF9zZXQgLT4wIChwbSBzdXNwZW5kZWQgMSBs
YXRlIDEgbm9pcnEgMSkNCj4gICBQTTogcmVzdW1lIG9mIGRldmljZXMgY29tcGxldGUgYWZ0ZXIg
MTA4LjM4OCBtc2Vjcw0KPiAgIFJlc3RhcnRpbmcgdGFza3M6IFN0YXJ0aW5nDQo+ICAgZHJkX3dv
cmsgcGFzc2VzIHJvbGUgMCB0byB0aGUgZ2x1ZQ0KPiAgIHFjb20gbm90aWZpZXI6IHJvbGUgMi0+
MCwgdmJ1cyBvdmVycmlkZSAwIChwbSBzdXNwZW5kZWQgMCBub2lycSAwKQ0KPiAgIFJlc3RhcnRp
bmcgdGFza3M6IERvbmUNCj4gDQo+IFVucGx1ZyBhbmQgcGx1ZyBpbiBkdXJpbmcgb25lIHN1c3Bl
bmQgY2FtZSBkb3duIHRvIGEgc2luZ2xlIERFVklDRQ0KPiBjYWxsLCB3aGljaCBkd2MzLXFjb20g
c2tpcHMgc2luY2UgaXRzIHJvbGUgZGlkIG5vdCBjaGFuZ2UuIEFmdGVyIGV2ZXJ5DQo+IHJlc3Vt
ZSB3aXRoIHRoZSBjYWJsZSBpbiwgdGhlIE5DTSBnYWRnZXQgd2FzIGNvbmZpZ3VyZWQgYWdhaW4g
d2l0aGluDQo+IDUgcy4gV2hpbGUgYXdha2UsIHRoZSBnbHVlIHN0aWxsIGdldHMgTk9ORSBhbmQg
REVWSUNFIGFsdGhvdWdoIHRoZSBkcg0KPiBtb2RlIHN0YXlzIHBlcmlwaGVyYWwsIHNvIHRoZSBj
YWxsIGhhcyB0byBzdGF5IGFoZWFkIG9mIHRoZSBlYXJseQ0KPiByZXR1cm5zIGluIF9fZHdjM19z
ZXRfbW9kZSgpLCB3aGVyZSB5b3UgcHV0IGl0Lg0KPiANCj4gSG9zdCBtb2RlLCB3aXRoIGEgVVNC
IHN0aWNrIG9uIHRoZSBwb3J0IGluc3RlYWQgb2YgdGhlIGNhYmxlOiBwbHVnZ2luZw0KPiBhbmQg
dW5wbHVnZ2luZyB0aGUgc3RpY2sgd2hpbGUgYXdha2Ugd29ya3MgYXMgYmVmb3JlLCBhbmQgc28g
ZGlkIHR3bw0KPiBzdXNwZW5kcyB3aXRoIHRoZSBzdGljayBsZWZ0IGluLiBXaXRoIHRoZSBzdGlj
ayB1bnBsdWdnZWQgaW4gczJpZGxlDQo+ICgzIHJ1bnMpIHRoZSBOT05FIGNhbGwgYWdhaW4gY2Ft
ZSBpbiBub2lycSBhbmQgd2FzIG9ubHkgc3RvcmVkLCBhbmQNCj4gZHJkX3dvcmsgcGFzc2VkIGl0
IG9uIGFmdGVyIHRoYXc6DQo+IA0KPiAgIFBNOiBzdXNwZW5kLXRvLWlkbGUNCj4gICByb2xlX3N3
aXRjaF9zZXQgLT4wIChwbSBzdXNwZW5kZWQgMSBsYXRlIDEgbm9pcnEgMSkNCj4gICBQTTogcmVz
dW1lIG9mIGRldmljZXMgY29tcGxldGUgYWZ0ZXIgMjU1NC4xMzUgbXNlY3MNCj4gICBSZXN0YXJ0
aW5nIHRhc2tzOiBTdGFydGluZw0KPiAgIGRyZF93b3JrIHBhc3NlcyByb2xlIDAgdG8gdGhlIGds
dWUNCj4gICBxY29tIG5vdGlmaWVyOiByb2xlIDEtPjAsIHZidXMgb3ZlcnJpZGUgMSAocG0gc3Vz
cGVuZGVkIDAgbm9pcnEgMCkNCj4gICB4aGNpLWhjZCB4aGNpLWhjZC4zLmF1dG86IHJlbW92ZSwg
c3RhdGUgMQ0KPiAgIFJlc3RhcnRpbmcgdGFza3M6IERvbmUNCj4gDQo+IFRoZSBob3N0LW1vZGUg
c3VzcGVuZHMgd2VyZSBvbiBhIGtlcm5lbCB0aGF0IGFsc28ga2VlcHMgdGhlIFVTQiBHRFNDcw0K
PiBvZiBnY2Mtc204NzUwIGluIHJldGVudGlvbi4gV2l0aG91dCB0aGF0IHRoZSB4SENJIGNhbWUg
YmFjayBmcm9tDQo+IHMyaWRsZSB3aXRoIGFuIFNNTVUgZmF1bHQgYW5kICJIQyBkaWVkIiBpbiBh
bGwgdGhyZWUgcnVucyBJIHRyaWVkLA0KPiB3aXRoIHRoZSBzdGljayB1bnBsdWdnZWQgb3IgbGVm
dCBpbi4gVGhlIGR3YzMgY29kZSB3YXMgdGhlIHNhbWUgaW4NCj4gYm90aCBrZXJuZWxzLCBzbyB0
aGF0IGlzIGEgc2VwYXJhdGUgcHJvYmxlbS4gSSBoYXZlIG5vIHJlc3VsdCBmb3INCj4gcGx1Z2dp
bmcgdGhlIHN0aWNrIGluIGR1cmluZyBzMmlkbGU6IHRoZSBwb3J0IGRpZCBub3QgZGV0ZWN0IHRo
ZSBzdGljaw0KPiBldmVyeSB0aW1lLCBhbHNvIHdoaWxlIGF3YWtlLCBhbmQgSSBoYXZlIG5vdCBm
b3VuZCBvdXQgd2h5IHlldC4NCj4gDQo+IFR3byBjb21tZW50cyBnbyBzdGFsZSB3aXRoIHRoaXMg
Y2hhbmdlOiBkd2MzX3Fjb21fc2V0X3JvbGVfbm90aWZpZXIoKQ0KPiBzYXlzIHJvbGUgY2hhbmdl
cyBhcmUgcHJvdGVjdGVkIGJ5IHRoZSB1c2Jfcm9sZV9zd2l0Y2ggbXV0ZXgsIHdoaWxlIG5vdw0K
PiB0aGV5IGFyZSBzZXJpYWxpemVkIGJ5IGR3Yy0+bXV0ZXggaW4gZHJkX3dvcmssIGFuZCB0aGUg
QHByZV9zZXRfcm9sZQ0KPiBrZXJuZWxkb2MgY291bGQgc2F5IHRoYXQgaXQgaXMgY2FsbGVkIGZy
b20gZHJkX3dvcmssIHNvIG5vdCBkdXJpbmcNCj4gc3lzdGVtIHNsZWVwLg0KDQpQbGVhc2UgdXBk
YXRlIHRoZSBjb21tZW50cy4NCg0KPiANCj4gV2lsbCB5b3UgcG9zdCBpdCwgb3Igd291bGQgeW91
IGxpa2UgbWUgdG8gc2VuZCBpdCBhcyB2MyBpbiBwbGFjZSBvZiBteQ0KPiBkd2MzLXFjb20gcGF0
Y2g/DQo+IA0KPiBUZXN0ZWQtYnk6IFZsYWR5c2xhdiBUeW1vc2hjaHVrIDx0dmxhZDc0NEBnbWFp
bC5jb20+ICMgU004NzUwDQoNClRoYW5rcyBmb3IgdGhlIGRldGFpbHMgYW5kIHRlc3RpbmcuIENh
biB5b3Ugc2VuZCBpdCBhcyB2MyB3aXRoIG15DQpTdWdnZXN0ZWQtYnkgdGFnPw0KDQpTdWdnZXN0
ZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtz
LA0KVGhpbmg=
