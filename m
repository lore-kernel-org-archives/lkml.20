Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793837012;
	b=0v1UZZuGC2Xm2uWcGOPYv99vvptPERa8SHDXUavSi8VIi2I8gMzCmY2RrollL9+viq0h
	 MGHZhGoguS3S1u1sEDTxR7Bd1yXEYmhjsgwlSXcFGRJ1YQA3ttlyTTfFjjzW2ZsmOra5u
	 a2Uwf+lqtqALa2pGcpANxzN7Ojk3SJLo9zOBTkZKk3v+M/IVuKohnaZYe8LrJHl49RLaY
	 GfYwusOsQFYESsH9CL+rAnA5PgmuO1wZroY8OyN8lgeCXGppnFxhvGEhA9xU9phu5TJLh
	 ie0j52pN9ras1quVxVobb4ED5YEHI8NZ8DYzpJk9kS/UdMSubBq7dYmt/8hxT33em9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837012;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7QLP8wmEW07C9mUgkYYr+w3NSFuvvLL4QU4xMKdhPac=;
	b=HdtH5l+EO+pB1veTz+No2SdD7non5jC5DFYmXsfpGwixGNSa0Tk135um2++VhXGsjFx+
	 hH4A+bJNmH7q70bpcS6w8zWBfObZNylrff6xTWj/Mc3YM4XIFpKTmT1diUlsaMcEvzbCl
	 t2qWozPg7cEIovHrYqY6vA+sRyAIqwL/qNbptKNXMQL5Vnl12Ic5q5I7jeDVOsGEpcqIZ
	 8e/kJE5y6E8a6Rdr2bOyQXSd15DaH8aZdaE2WVyD26NsR+E7h86BracUVl8in4m1kL1K0
	 5P9dJs00ONr8cpAATopR0khH4oOc5ocAjdVs6Pdz6BTiPJQcknxTQTVHt3QWUi2h2oQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=gdLSKXR6;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=FE97MIbS;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=q+mVdurc;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B10606A331;
	Thu,  5 Nov 2026 00:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5B10606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=gdLSKXR6;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=FE97MIbS;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=q+mVdurc
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4NPBVO092503;
	Wed, 4 Nov 2026 16:03:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=7QLP8wmEW07C9mUgkYYr+w3NSFuvvLL4QU4xMKdhPac=; b=
	gdLSKXR6vYXzX+vLCzTorYUhNr2gtAa7hgYAlKGlHOwkjQAHBCDlEg2FgyNZQqsL
	nXHjjJiEiy3BGz9oV1VGqEXJYgl74PMEr13ipCZPsVRUCUk1bm3QHlJ+pF9potCf
	MYWBiw9gJX9R7Ux2VlZHAvBQpTfd1ys6lnoaUOrD3FaXIbR1HEO18FPIJ42+1cBW
	qRoNluL3gTGw5//g6MLcqNb8mfMfP0sFXeuA667KN7PTw+hPINe0UWjxuijDkcxq
	ao/joUr7CNdFxbO4MbXAcv6ZN0U9cARndm/9VvJdbKq1zFrh4Ug4eSLcCud5kyFy
	9XIBL8yCbq/MRyFw66Tuaw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4hr2dsfe83-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 16:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1793836971; bh=7QLP8wmEW07C9mUgkYYr+w3NSFuvvLL4QU4xMKdhPac=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=FE97MIbSvaB853E2Qb7HIs2Lsljt3azwoWQ0fKQBFLTFmHgohx/RF+1QUYPn5Saqv
	 7iB6rCBLAXEes4gP68U9yLDdsSHl1rrRAKMmbo+YkznPWID6hNUAt9eru5AcQC6167
	 v8UL8zD/Oc8L8+9Gn38OG8O49SsKl7OSvRZMZvUWjh/VU3i6vR8EwTb2jPjxZ2bSFF
	 X+IlM73tvV28DQyzayVthLMb6nyejsSwbens4hLGSDr/9F9bQY1Ri64YMEjHf0prZk
	 qYtpynX1HgvDnNJTSdtpvdeba/s2/nC/N1hpc6i1Y2SKn/QGe1x/CEbc4wpw4CEC5/
	 OQgV1RkA2dDUg==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5EFFC401DF;
	Thu,  5 Nov 2026 00:02:51 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 1759BA072B;
	Thu,  5 Nov 2026 00:02:51 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=q+mVdurc;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00307.outbound.protection.outlook.com [40.93.12.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 40EDC40107;
	Thu,  5 Nov 2026 00:02:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHgcNJOZGAMM/tz+eearPVxq2xsv9cDzHR6T4xrbDh44zFwQn7iO3pOH0Cmo84PNRgLhi9aGMwaSTxiCQpriNpkBhp3refq3pie7TIhl9/BlwZPvkLUigszcPID0bqVbMOvbT0ppFhx5jYsGkgtGSHzlqgkP+O3uSb/aQSvJorNJqg4r2HyCHVT9ZWxobZW2D+2tf1YUmX6W83lFH+avO8va2LEisWprDxm2lTh8UAq+YL7NsGNvKixRLdHafd7quPz6Pldcc9i79F6j3ATDGBuhrbSZ2EOSXSwGlnRkCdPGn4kXubBE7rpi4S5Ml+Hypj+mrV2UWxRFqkTg8kgupg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QLP8wmEW07C9mUgkYYr+w3NSFuvvLL4QU4xMKdhPac=;
 b=fLrw4Jon14BbNt+sZfBXfkMgnf2m4oX32f61XOY8m2EtrItKklbEVxy1jjV/poeF17rJWjBMzXbWVyFs+zdwHJfVfn2XkIZ7l5PFxibOQXvwWNd/gaDO/3r0FRmnGjeVaGEPaRa27j0EpshI3RgDTinOy4315qE/o+WZpw6Z7JxlgVAQo6epF9rAoEXP2gqn4oTQt9WUvHPc/h6hIELpt/xsUpvqw0lyfdTpc7/hn3pGyVssWcT4YHKqgUEzPgYOwrw4eUgL8ZCuNy3a42Yo4NSlp51k2Oac2lzjl+Uu5KYJSRS9FRZBp7BTD9kY2JHEH2LL+IHI3nDYQ0PtVti5Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QLP8wmEW07C9mUgkYYr+w3NSFuvvLL4QU4xMKdhPac=;
 b=q+mVdurcJSvqKHY0sqHc5PcOgDbFfToOhGj8vklCwwN9QMC4xSAIgBrSGmXQCMzKFE5qxmttSDJbczgPUZ34AcGadTlNqelkQ6zOS0gGCKU80MktvE3iTJD+9vXOOBZosPXmfNBEE/07fryuKQWW970OkOYspUTwmJG00DLWIGM=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DSVPR12MB999193.namprd12.prod.outlook.com (2603:10b6:8:496::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 00:02:47 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 00:02:46 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Vladyslav Tymoshchuk <tvlad744@gmail.com>,
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
Thread-Index: AQHdYnan5UYfhcgHMUWgaIHS0yhDQrcdRcuAgAAhVYCAAUW0gA==
Date: Thu, 5 Nov 2026 00:02:46 +0000
Message-ID: <auu9hx_Xnjbi3WkB@vbox>
References: <20261022224220.480-1-tvlad744@gmail.com> <auqXyUxc9cRIuYou@vbox>
 <f9d27fd8-cf33-4e6a-a9fc-6770a933cfb3@oss.qualcomm.com>
In-Reply-To: <f9d27fd8-cf33-4e6a-a9fc-6770a933cfb3@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DSVPR12MB999193:EE_
x-ms-office365-filtering-correlation-id: 8042164b-10e7-482d-cd59-08df3ad01fa7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|3023799007|10067099003|22082099003|18002099003|38070700021|56012099006|11063799006|4143699003|261021121427099003|261102123227099003|261026121527099003|261022075727099003|261009223027099003;
x-microsoft-antispam-message-info:
 6tGozwlhZ0EZDL0O7vei/PLU8eVh3rfwy//DtGnZVWkCt1cRpzqhAmTdzJbZ6GagD2TkSXTquNnyyqRJ19Kxs1o4xeZoLdkq5vZ7zyOFB30NgHya/QvkJtfEfD+ADvRJ3AInbEEoaOf+Xt9vApU4CJh7l8AcNqmSQxWvf3987xpzKrOh0+WfjCDNT5/fk61V7HWQ2Pw/MopbNyXbddEcpL4F0P9uwUstpaBhb72I+/3Xx9J8RgZr/WJMlW2Ip0an5EpJfKZMwq7/8f3P9Sf5Sbi+pdXz2ci1ALov9K5wSERHyxFZ1fpISwIv2Cm8ADKKTPXYaB1VghfAL2b/EKUrC5dYAloz69XhO1Pmq5Nm52t8S9AckL7gCdFeM1O0i5NsF06C7qsGr5FiOMMpHzP2ntOU8SC23SF2LwyZU7RscwUiHBLXBn2f3cdV+X9ZKPwXm8F8oS3Qlhvupl+GoDxxtflw5rQk3KcwuZ39IxSxhLnkGnrZ9Ka4XYvZliAszHQMtFhTj9nwzqjjStP1qfDatopBs90itOmjs85C3qXP00D081hQCp4bwtFPiij0KIupGlwS/jrEKSHWiSOuN85uc9cPqrrSzW3oorTEP+gUcFC9gZI3FKBLisOQxEwWaeKLAw/0QO9KzrlpwvOGr2+hCrKbHFNjGbqpSR4B4AQljFsTxIn+Zw3Ds1oh7xFQWzGsTzN1ERzsenLvGieQ6wcfqzIG4xF+4JjvZwymNjlCkdY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(3023799007)(10067099003)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(4143699003)(261021121427099003)(261102123227099003)(261026121527099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Nmp4eU96ZS9HWjRnT0k0a2V1VitVSXU1Qk1BMnNVWU0rYXQxR28zUVNFMHBB?=
 =?utf-8?B?cmtzc1RsVXk3bnY2MkpRbmZQbTdYUjF6L2JHRndQc2I4bjNLTUloZmNCSjB6?=
 =?utf-8?B?Z2IzMTZXbmFjUFZuZ015TmhPNUtMRjN5bmNOOGY2OWRCaS91dmNoRkVBRU1U?=
 =?utf-8?B?WHd0NXE0Vms2TEpBZm4zekxUYzIrckpUeDhNeWowblNFWGVtMlJLcnI3YVVj?=
 =?utf-8?B?UFhFdDB2bUg3dC9nNkNnYUk1ZjhhR3FPSCtNaHhPUW1mbGg0bjY4N2YwMEpE?=
 =?utf-8?B?aFRKRUhoQm1EZ2RpZGEvanJMYTgvMU9XbDdRTER2T2NDVFpFY05ub1FVRGJP?=
 =?utf-8?B?ZVVhbjVGazhTSUllUnF5cHlQNEIwTWRVeDlNbFdjZTMrZkNWWk1ISFE0WFF4?=
 =?utf-8?B?MkE5b1VYNGxnSGhteS9rTGJtNjlkMTNYeWsvbE54QjdVR0ZrQWhPT1BpWTRY?=
 =?utf-8?B?U1FsVGdiODZubWxBTlZWY2pBd25PRmlDZ3liVTlJMTlzL3BSd0dQQStSS2Qr?=
 =?utf-8?B?dWVuVkgxeGc2R3ZlNnpwby9LL2ovL1U5czlXaHFabXREakxXVmNaRVNBbmpv?=
 =?utf-8?B?QUl3OVZ3d1E4bTNGeTlvQTFpU1FySHAvdmNrL1pycFNKUlB5cDFpREJvTGlJ?=
 =?utf-8?B?S0V4WmwzdTRsZ1pNTXk2V0J3c0xKVVEyTHFOVkJrNFVTOFE4NGFmeGFacEtI?=
 =?utf-8?B?SG82Vmh5em9FY3l4NDRpVUdpQzl2T2xxcWYxaXJOMDBwSUp4Z0JURDBIbURN?=
 =?utf-8?B?N3Z6RW9GT2x0K3I1Qk9hS1JwQS9MSThIemZDQWpCaWVMZVFUOHlZb2cvbk93?=
 =?utf-8?B?RGV0cjRUVFMyN2NIbWZhUFRCbUJMNVY1V2RSNUNLNlI4cFhxUDB3V0dXei95?=
 =?utf-8?B?dXNtVWErbU02Qnh6Y25mMWgzdGZMSy8ybEQ4TzNkOTJtSzlyQ1J6Ti9LVnZY?=
 =?utf-8?B?TG1SMGpvZ2N6MWFuYVBhUnNvS2tjdXp3MXYwM2Rlc3ArYUd1U0tYQ2g3SWpW?=
 =?utf-8?B?bXQ3aWx6eVNXcG01QUFERTdwYmQ4NmEzTEFlOXdsQU95bGV0c2FKUXV6NXhm?=
 =?utf-8?B?RHdzdldrRkFzUnE2N1N0VEFBSWxjMUxaVERmS1lhNEcrVlYwcnNjNnIvcmYr?=
 =?utf-8?B?TXFya3RPeERPcHpISnd3OFhHZlZUMit0Rkp4Z3JsYWgrYXNlTXVUYzRTT09m?=
 =?utf-8?B?WGhaUnRPYlBoek02N1JtK3JmMzIreTJqZWtUVG03MGgrS0Jqdkw4NkVmbG9B?=
 =?utf-8?B?NUN2RlFlNkcyK0hXQUxVY2xDZTJjbTZoSjJMS2tnUEZLUzFwTXdmcmlUdGpy?=
 =?utf-8?B?MTA5S2RLZHovZlRPc2N1NEhrbERRRmQzT3FuaGNRaDFBaElvNWRuckptemtx?=
 =?utf-8?B?QlpzUnpwV1FKQXcvZUtadlZDaGR0TmpQRTJ6YnRMYzZ3SllldXFIcWlCSnM3?=
 =?utf-8?B?S0tsb25OWkYwcEdBUWFQVXJOM241K1BSbzNVNHNES05nSVlYbE5EeGJuNkRZ?=
 =?utf-8?B?WkROTkdQcEh0NlpKdGJnc1ppcWpod3VRczNuQjFkZGdtaWhKMFNBN2ZMTDhV?=
 =?utf-8?B?bjNPMWVIaVJGRVUzOEdFakN0a1M0Y1ZrVnA1c3g1M3pRc1lYV1pBS1doMUFw?=
 =?utf-8?B?dkVPbHJBbUx6SnF3TTc4aVc5SGhjY1p2bnhIY2NvNCtCQUFJVFlPaGY1cmNX?=
 =?utf-8?B?empOWVdTd0QyWXVieG1TVTE2V2RBa0t2N2liQUp1Tml0YVRBdlpxNS80ODl3?=
 =?utf-8?B?OFFkb1JPb011NHM5WFlhYllkdmQ1UHRRb0xlV2VNSnpuTW5xcmxZWkgrNEFG?=
 =?utf-8?B?elhMVEJnU0hNaEp0ZEdLTFlPSzZqTXBUaXBsbUY3RGkwb2h6L1MyQUo4TXZD?=
 =?utf-8?B?dzJ6bGVVLzJmZ1AxK0svNmZycGN1K1hvMzNSdVhmZTRBMkNCNXVITWFNc0RZ?=
 =?utf-8?B?V3o4VHF4ZHJsSG50TFhRekhDSEpBcnk3ZnovRmdsd3pxcjNGNnZ4bEl6Y1Uw?=
 =?utf-8?B?b1dWL2RBNjMzdHZRbkxwNmZicnNRcFhTeld1T2Z3LzFKN1RwZ3kxZ2NROTJZ?=
 =?utf-8?B?RVhXYnhjN2hRRDRsZEdySG10amJ1UHd3cE5ua1RWeUF4MFgwMzRkc3V4Nm9k?=
 =?utf-8?B?VXUzd01ZbDdaWXBzaXQ3NmxnMUplWVVsRG50RC9CTVFUZXNnZVRpdWhKbUEy?=
 =?utf-8?B?WkVlYllVZ2x2dG1INjdWWHJaZ0dVQ1JnOGcydG12TFYrSDBSYlBaUHVlT3dv?=
 =?utf-8?B?eS9JQVBMeXQ3WURRUTZYUzZuK3ZJcVV6ek5ROFdVWGh4TWRYS2U3aU1ycFlq?=
 =?utf-8?B?NzJQTDlmVTVBWFBSQWphMkhVMHYwVGlaZWpuYnh1aXE0M1RXcXNnUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <41B95AE769E8534986D80BF61457B82E@namprd12.prod.outlook.com>
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
	bAhR2cfrlp9S3pUlGk3jLpbSvKzwoCsXCauJWbmHF/edsBSYIKwC8wQSS1IBnoYA3/Qs6vCdqaWLxuEGntcCrBKAu2PQOGyNTyiaCk0R6G1iiX5JwIP9v4HUhzjXZ+KWbqtThoNs9U9CsPH7ns12u0ZC8/pA4zgSM2rbPdFG3PQT1rqhf0eXxIravLZG/gwtPiXklthpWVy+waFNjRgshxmYA9ZRooZ0YLBXH1XJ6/iPhCg+QfUSLW2oxK4Tgf41JHKkGDjQx+OLeVqed1I+iThTFz+rngl+bwHwi3zQbc7M4LGfOaYKc1Qjs3yxxwGUikxcC5oYjnI4hlMNuU+VLg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NSDSuuH4J5vgHS5b6wj/CLAJDMTj0T2CiYD2PjO8OpqexqWQiUh2ALODSzwSfadpBQiq7lKyZmn5OjkhP0TWg+9k9ybj1WF1zmvggZhbXKZea/MNKNqPeFJUiO94ROZDSqIwIxst5WGkUa16pqoXAUsRG6wa1Mhp8bgKImJj5sj6fju6kmzRU72BR32knytCC+6v5unXbqLcylODWSKto0Ftf0I817ZCOEPnrn4nYLS/v4voj6ZBYoFfY6xbwhkucqkCgzFVEQLiiuulB+J2lRphgx2h+bRkgP2AyFv8wuAr8k4nTG5oYLPZuszfyAfnV0mAf3fHLFDoLqMqqbBXuvjbPBNncFN4SfSGzbazE+OqLdrYhYRxT7ALDqsNScIJCIWTykd3Q6iZAO7wioMKe0fHKucLuuCmZzTjcwfHsDKd6kw71qTPn6/LFENFMLx/uYjq2iZd260cH01elPnPtrNedRmzhrr60QsyCpLWGA70wtPumLIFYhbre3V3CexUtUDykUozwBGNny8ovAhWhsZwqEplH5gPiwsXHrPpviyVWKubGfqorjmiJpCSwx3QYnJtuBl8M6umSkhjp1a8bIgfAEpTntFsobGygCnI+uhyyjc8MrUSyo+YAwObfKQoKa6Lm6box2kuljO6nrZ8hA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8042164b-10e7-482d-cd59-08df3ad01fa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 00:02:46.8478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qHycltjsA42s3vZHquV++fzkvCqWZMdk7sAqNDg9gFAWYtlGNAH/oPYuu1R9npOMD2SUlcfYy8OsioNlib13wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999193
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA5NCBTYWx0ZWRfXxjJtt5SyeXw0
 XOdwLedr/sfOUTa770t/fxAYJZYcOy4Vookjwzj/5aytxj94GrZCYPUzpv5HN0w3ZHbrwHinMKV
 nrJ4iZbtOlrCqi/PiAj2IfqtJka2VqmZwF1buH8MShn+KMLf3+jhmTSYDTO4m7l1SX1kfYoDvZZ
 DYKpm6udI64mwb6EeWxKj2JHWRjRZTn419ECqp/ljpqBSqP8yJYVXdoJ66nnPPDtNjGh/R67NBc
 9If+LvRZ3SI6E/U9jEILZRuQdmpLEswzYpVKK2U0lpmV6exIYaNCLrXFhavsEUM7aAjS1uBk7Ag
 nm5K03cPdBUPmmM2U759ZJFD+4Hrn6WtfrJENqT59SDKeuZBvbbcCPv/mpQLprEJo0BUYhaeAcS
 FMoKUQv0gKIQ76PVCGOifoXp3Ke8YIdrr9FFPdD9Sqp5H3TxZISKx7pANSRsXKdqTQGOd638Iw7
 vT9CbeV3zrYHNcWDlPw==
X-Proofpoint-ORIG-GUID: Rq-fIRzpHgjeVcETWKs-5tO8PnykNYPp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA5NCBTYWx0ZWRfX9m99qtVopkWC
 CmR73cNH2q9gKm74UKZ4dHf4U2cFCLXKWpSptfwg9vC8E5z7VwUfeVF0OFwFFgEmvMdBNlp9s5P
 gnqxm6raX7uYtgiJ+RKsA8eQX+nx/mA=
X-Authority-Analysis: v=2.4 cv=cb5HPXDM c=1 sm=1 tr=0 ts=6aebc7c5 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=SvbkcuRVptmf3qmCidwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Rq-fIRzpHgjeVcETWKs-5tO8PnykNYPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040094

SGksDQoNCk9uIFdlZCwgTm92IDA0LCAyMDI2LCBQcmFzaGFudGggSyB3cm90ZToNCj4gDQo+IA0K
PiBPbiAxMS80LzIwMjYgODowNyBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIEZyaSwg
T2N0IDIzLCAyMDI2LCBWbGFkeXNsYXYgVHltb3NoY2h1ayB3cm90ZToNCj4gPj4gZHdjM19xY29t
X3NldF9yb2xlX25vdGlmaWVyKCkgdXBkYXRlcyB0aGUgVkJVUyBvdmVycmlkZSBpbiBRU0NSQVRD
SA0KPiA+PiBzeW5jaHJvbm91c2x5LCBmcm9tIHRoZSBjb250ZXh0IG9mIHRoZSB1c2Jfcm9sZV9z
d2l0Y2hfc2V0X3JvbGUoKQ0KPiA+PiBjYWxsZXIuIFRoZSBnbHVlIGFzc3VtZXMgdGhhdCByb2xl
IHN3aXRjaGVzIG9ubHkgaGFwcGVuIGZyb20gYQ0KPiA+PiBmcmVlemFibGUgd29ya3F1ZXVlLCBi
dXQgdGhhdCBob2xkcyBmb3IgdGhlIGR3YzMgY29yZSdzIG1vZGUgc3dpdGNoLA0KPiA+PiBub3Qg
Zm9yIHRoaXMgbm90aWZpZXI6IHRoZSBVQ1NJIGNvbm5lY3RvciB3b3JrLCBmb3Igb25lLCBydW5z
IG9uIHRoZQ0KPiA+PiBub24tZnJlZXphYmxlIHN5c3RlbSB3b3JrcXVldWUuDQo+ID4+DQo+ID4g
DQo+ID4gLi4uLg0KPiA+IA0KPiA+IEdvb2QgY2F0Y2guIEhvd2V2ZXIsIHRoaXMgc2hvdWxkIGJl
IGZpeGVkIGluIHRoZSBkd2MzIGNvcmUuIFRoZQ0KPiA+IHByZV9zZXRfcm9sZSBub3RpZmllciBj
YW4gYmUgY2FsbGVkIGZyb20gdGhlIGZyZWV6YWJsZSBfX2R3YzNfc2V0X21vZGUoKQ0KPiA+IHdv
cmsgaW5zdGVhZCBvZiBmcm9tIHRoZSByb2xlIHN3aXRjaCBjYWxsZXIuIFRoZW4gZ2x1ZSBkcml2
ZXJzIHdvbid0IGJlDQo+ID4gbm90aWZpZWQgd2hpbGUgc3VzcGVuZGVkLiBUaGlzIGlzIHNpbXBs
ZXIgYW5kIGFwcGxpZXMgdG8gYWxsIGdsdWUNCj4gPiBkcml2ZXJzLg0KPiANCj4gSSB0aGluayB0
aGUgcHJvYmxlbSB3aXRoIHRoYXQgaXMsIGR3YzNfc2V0X21vZGUgZG9lc24ndCBrbm93IFVTQl9S
T0xFDQo+IChlc3BlY2lhbGx5IE5PTkUgbW9kZSkuDQo+IEl0IG9ubHkga25vd3MgdGhlIG1vZGUg
d2hpY2ggaXMgZ2FkZ2V0L2hvc3Qvb3RnLiBUaGF0cyB3aHkgdmVuZG9yIGhvb2tzDQo+IGFyZSB1
c2VkIGluIGRyZC5jIGluc3RlYWQuIFBlcmhhcHMgd2UgY2FuIGNhY2hlIFVTQl9ST0xFIGludG8g
ZHdjMw0KPiBzdHJ1Y3QgYW5kIHVzZSBpdCBsYXRlciBvbiBfX2R3YzNfc2V0X21vZGUuDQo+IA0K
DQpZZXMsIHRoZSByb2xlIG5lZWRzIHRvIGJlIGNhY2hlZC4gU29tZXRoaW5nIGxpa2UgdGhlIGNo
YW5nZSBiZWxvdy4NCg0KSGkgVmxhZHlzbGF2LA0KDQpDb3VsZCB5b3UgdGVzdCB0aGlzIGNoYW5n
ZSBpbnN0ZWFkIHRvIHNlZSBpZiBpdCByZXNvbHZlcyB0aGUgaXNzdWU/DQoNClRoYW5rcywNClRo
aW5oDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyBiL2RyaXZlcnMvdXNi
L2R3YzMvY29yZS5jDQppbmRleCBmZDVjMmNkMzZjNTkuLjk5YTM5YzgyODU0MyAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQorKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUu
Yw0KQEAgLTE2OSwxNSArMTY5LDIzIEBAIHN0YXRpYyB2b2lkIF9fZHdjM19zZXRfbW9kZShzdHJ1
Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQogCWludCByZXQ7DQogCXUzMiByZWc7DQogCXUzMiBkZXNp
cmVkX2RyX3JvbGU7DQorCWVudW0gdXNiX3JvbGUgcmVxdWVzdGVkX3JvbGU7DQorCWJvb2wgbm90
aWZ5X2dsdWU7DQogCWludCBpOw0KIA0KIAltdXRleF9sb2NrKCZkd2MtPm11dGV4KTsNCiAJc3Bp
bl9sb2NrX2lycXNhdmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KIAlkZXNpcmVkX2RyX3JvbGUgPSBk
d2MtPmRlc2lyZWRfZHJfcm9sZTsNCisJcmVxdWVzdGVkX3JvbGUgPSBkd2MtPnJlcXVlc3RlZF9y
b2xlOw0KKwlub3RpZnlfZ2x1ZSA9IGR3Yy0+cmVxdWVzdGVkX3JvbGVfcGVuZGluZzsNCisJZHdj
LT5yZXF1ZXN0ZWRfcm9sZV9wZW5kaW5nID0gZmFsc2U7DQogCXNwaW5fdW5sb2NrX2lycXJlc3Rv
cmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KIA0KIAlwbV9ydW50aW1lX2dldF9zeW5jKGR3Yy0+ZGV2
KTsNCiANCisJaWYgKG5vdGlmeV9nbHVlKQ0KKwkJZHdjM19wcmVfc2V0X3JvbGUoZHdjLCByZXF1
ZXN0ZWRfcm9sZSk7DQorDQogCWlmIChkd2MtPmN1cnJlbnRfZHJfcm9sZSA9PSBEV0MzX0dDVExf
UFJUQ0FQX09URykNCiAJCWR3YzNfb3RnX3VwZGF0ZShkd2MsIDApOw0KIA0KQEAgLTI4Nyw3ICsy
OTUsOCBAQCBzdGF0aWMgdm9pZCBfX2R3YzNfc2V0X21vZGUoc3RydWN0IHdvcmtfc3RydWN0ICp3
b3JrKQ0KIAltdXRleF91bmxvY2soJmR3Yy0+bXV0ZXgpOw0KIH0NCiANCi12b2lkIGR3YzNfc2V0
X21vZGUoc3RydWN0IGR3YzMgKmR3YywgdTMyIG1vZGUpDQorc3RhdGljIHZvaWQgX19kd2MzX3F1
ZXVlX21vZGUoc3RydWN0IGR3YzMgKmR3YywgdTMyIG1vZGUsIGVudW0gdXNiX3JvbGUgcm9sZSwN
CisJCQkgICAgICBib29sIG5vdGlmeV9nbHVlKQ0KIHsNCiAJdW5zaWduZWQgbG9uZyBmbGFnczsN
CiANCkBAIC0yOTYsMTEgKzMwNSwyNSBAQCB2b2lkIGR3YzNfc2V0X21vZGUoc3RydWN0IGR3YzMg
KmR3YywgdTMyIG1vZGUpDQogDQogCXNwaW5fbG9ja19pcnFzYXZlKCZkd2MtPmxvY2ssIGZsYWdz
KTsNCiAJZHdjLT5kZXNpcmVkX2RyX3JvbGUgPSBtb2RlOw0KKwlpZiAobm90aWZ5X2dsdWUpIHsN
CisJCWR3Yy0+cmVxdWVzdGVkX3JvbGUgPSByb2xlOw0KKwkJZHdjLT5yZXF1ZXN0ZWRfcm9sZV9w
ZW5kaW5nID0gdHJ1ZTsNCisJfQ0KIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkd2MtPmxvY2ss
IGZsYWdzKTsNCiANCiAJcXVldWVfd29yayhzeXN0ZW1fZnJlZXphYmxlX3dxLCAmZHdjLT5kcmRf
d29yayk7DQogfQ0KIA0KK3ZvaWQgZHdjM19zZXRfbW9kZShzdHJ1Y3QgZHdjMyAqZHdjLCB1MzIg
bW9kZSkNCit7DQorCV9fZHdjM19xdWV1ZV9tb2RlKGR3YywgbW9kZSwgVVNCX1JPTEVfTk9ORSwg
ZmFsc2UpOw0KK30NCisNCit2b2lkIGR3YzNfc2V0X3JvbGUoc3RydWN0IGR3YzMgKmR3YywgdTMy
IG1vZGUsIGVudW0gdXNiX3JvbGUgcm9sZSkNCit7DQorCV9fZHdjM19xdWV1ZV9tb2RlKGR3Yywg
bW9kZSwgcm9sZSwgdHJ1ZSk7DQorfQ0KKw0KIHUzMiBkd2MzX2NvcmVfZmlmb19zcGFjZShzdHJ1
Y3QgZHdjM19lcCAqZGVwLCB1OCB0eXBlKQ0KIHsNCiAJc3RydWN0IGR3YzMJCSpkd2MgPSBkZXAt
PmR3YzsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCBiL2RyaXZlcnMvdXNi
L2R3YzMvY29yZS5oDQppbmRleCBmM2RhYmIzN2Y4MDYuLjBmYmMxYTQ0NmFlMSAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQorKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUu
aA0KQEAgLTEwNTgsNiArMTA1OCw4IEBAIHN0cnVjdCBkd2MzX2dsdWVfb3BzIHsNCiAgKiBAZHJf
bW9kZTogcmVxdWVzdGVkIG1vZGUgb2Ygb3BlcmF0aW9uDQogICogQGN1cnJlbnRfZHJfcm9sZTog
Y3VycmVudCByb2xlIG9mIG9wZXJhdGlvbiB3aGVuIGluIGR1YWwtcm9sZSBtb2RlDQogICogQGRl
c2lyZWRfZHJfcm9sZTogZGVzaXJlZCByb2xlIG9mIG9wZXJhdGlvbiB3aGVuIGluIGR1YWwtcm9s
ZSBtb2RlDQorICogQHJlcXVlc3RlZF9yb2xlOiByb2xlIHJlcXVlc3RlZA0KKyAqIEByZXF1ZXN0
ZWRfcm9sZV9wZW5kaW5nOiBAcmVxdWVzdGVkX3JvbGUgaXMgeWV0IHRvIGJlIHBhc3NlZCB0byB0
aGUgZ2x1ZQ0KICAqIEBlZGV2OiBleHRjb24gaGFuZGxlDQogICogQGVkZXZfbmI6IGV4dGNvbiBu
b3RpZmllcg0KICAqIEBoc3BoeV9tb2RlOiBVVE1JIHBoeSBtb2RlLCBvbmUgb2YgZm9sbG93aW5n
Og0KQEAgLTEyNjEsNiArMTI2Myw4IEBAIHN0cnVjdCBkd2MzIHsNCiAJZW51bSB1c2JfZHJfbW9k
ZQlkcl9tb2RlOw0KIAl1MzIJCQljdXJyZW50X2RyX3JvbGU7DQogCXUzMgkJCWRlc2lyZWRfZHJf
cm9sZTsNCisJZW51bSB1c2Jfcm9sZQkJcmVxdWVzdGVkX3JvbGU7DQorCWJvb2wJCQlyZXF1ZXN0
ZWRfcm9sZV9wZW5kaW5nOw0KIAlzdHJ1Y3QgZXh0Y29uX2RldgkqZWRldjsNCiAJc3RydWN0IG5v
dGlmaWVyX2Jsb2NrCWVkZXZfbmI7DQogCWVudW0gdXNiX3BoeV9pbnRlcmZhY2UJaHNwaHlfbW9k
ZTsNCkBAIC0xNjE0LDYgKzE2MTgsNyBAQCBzdHJ1Y3QgZHdjM19nYWRnZXRfZXBfY21kX3BhcmFt
cyB7DQogLyogcHJvdG90eXBlcyAqLw0KIHZvaWQgZHdjM19zZXRfcHJ0Y2FwKHN0cnVjdCBkd2Mz
ICpkd2MsIHUzMiBtb2RlLCBib29sIGlnbm9yZV9zdXNwaHkpOw0KIHZvaWQgZHdjM19zZXRfbW9k
ZShzdHJ1Y3QgZHdjMyAqZHdjLCB1MzIgbW9kZSk7DQordm9pZCBkd2MzX3NldF9yb2xlKHN0cnVj
dCBkd2MzICpkd2MsIHUzMiBtb2RlLCBlbnVtIHVzYl9yb2xlIHJvbGUpOw0KIHUzMiBkd2MzX2Nv
cmVfZmlmb19zcGFjZShzdHJ1Y3QgZHdjM19lcCAqZGVwLCB1OCB0eXBlKTsNCiANCiAjZGVmaW5l
IERXQzNfSVBfSVMoX2lwKQkJCQkJCQlcDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9k
cmQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHJkLmMNCmluZGV4IGYzZTM3ZDM4MzYyNy4uNTUwMzY0
NjZlYzdhIDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kcmQuYw0KKysrIGIvZHJpdmVy
cy91c2IvZHdjMy9kcmQuYw0KQEAgLTQzOSw4ICs0MzksNyBAQCBzdGF0aWMgaW50IGR3YzNfZHJk
X25vdGlmaWVyKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIsDQogCWVudW0gdXNiX3JvbGUgcm9s
ZSA9IG1vZGUgPT0gRFdDM19HQ1RMX1BSVENBUF9IT1NUID8NCiAJCQkJICAgICBVU0JfUk9MRV9I
T1NUIDogVVNCX1JPTEVfREVWSUNFOw0KIA0KLQlkd2MzX3ByZV9zZXRfcm9sZShkd2MsIHJvbGUp
Ow0KLQlkd2MzX3NldF9tb2RlKGR3YywgbW9kZSk7DQorCWR3YzNfc2V0X3JvbGUoZHdjLCBtb2Rl
LCByb2xlKTsNCiANCiAJcmV0dXJuIE5PVElGWV9ET05FOw0KIH0NCkBAIC00NjgsOCArNDY3LDcg
QEAgc3RhdGljIGludCBkd2MzX3VzYl9yb2xlX3N3aXRjaF9zZXQoc3RydWN0IHVzYl9yb2xlX3N3
aXRjaCAqc3csDQogCQlicmVhazsNCiAJfQ0KIA0KLQlkd2MzX3ByZV9zZXRfcm9sZShkd2MsIHJv
bGUpOw0KLQlkd2MzX3NldF9tb2RlKGR3YywgbW9kZSk7DQorCWR3YzNfc2V0X3JvbGUoZHdjLCBt
b2RlLCByb2xlKTsNCiAJcmV0dXJuIDA7DQogfQ0KIA==
