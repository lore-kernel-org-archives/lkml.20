Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BE04195A6;
	Fri, 11 Sep 2026 23:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789170751; cv=fail; b=YHPGvYb+qdsuvO5bFRNV71ftrVaQCsWmL0+Bc6u/PbV7K0Q+GyWWHAmaFCqjUnFPEU6sejEYvqB8tAN9O7ynrvg/ekbDk/N6fdH+hbGywp5a+5eod89oKtge8wopuSzBZDf7a9XELvXkYro6wJY4tYyhCvDgQJZG6l2A4AJ/Eoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789170751; c=relaxed/simple;
	bh=EkP2Jq2FjmTkGSREH3GdKPFbaJsnK6yrZNiUGnpjVm4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oihxGvrfRKkBz1yxqqObY0vAylgjFdu1FtbS5UDBzBxl3hvOWLxR97HR/9a42J1oXQkfAgfqS9jU0E2Z8DTi5qlWufKce9vc3OIqv3+C9qylSRFZ705EAHKZ8GHQseyoyA04daklCYwGfGLA3Qvbh3Bgmf0ZhxeiJS9BwY9X1I8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dWfQMM/U; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NzCgxyI6; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=VOW2MMSr reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dWfQMM/U";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NzCgxyI6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VOW2MMSr"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BNo8s64170336;
	Fri, 11 Sep 2026 16:52:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=EkP2Jq2FjmTkGSREH3GdKPFbaJsnK6yrZNiUGnpjVm4=; b=
	dWfQMM/UjdDv2TQT2RjChggLXAPfVFix9D/KHFYHhHpertF169h7AIm9i4Og0Sm1
	ss6OiCG0s5namvv/MufQUbwHClJswyM3NB2x3/rtI/M+g07VzViBN6VM1CSH1t/L
	6fJs7k8P7N+mQrTVOGxO80gDocPxeiYHaugmCWRIfEEL0Rth5iysQtGj9tCOJoQo
	k6wTPQSPCyl1IC0Z+Y+bCqwSQRhzOfmlYmP8KBYBbg9Cm0TNty7aoWtyuFKoDXXY
	B1OupU97OsFvmqkliq4p0I6TEEGu/bcL9lh1eLSQ7HvGiRykUDeTTOHegT3R+WSw
	oMCO224U6VxS/SUBTHaxig==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4gmqu0hcby-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 16:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1789170729; bh=EkP2Jq2FjmTkGSREH3GdKPFbaJsnK6yrZNiUGnpjVm4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=NzCgxyI6eliNyujWTpVdO9uLdQD4QHUV3vUl10CX+q+cir06OkT94s//cSWnMXq9x
	 q5Zu0tBffFBNNL3/e3q+M6fVX0A/7OTO4QRd1sEb4NHOHQLB316COaILqF5CzfynXK
	 h24IniqaRtge4Eqzp2bt6v8cnn2Kww/odYwHn93lhjfre9Bcv6AMmeCdW02a8aFXSo
	 Xegg46WFMdJ4oJBVF3JEL1kRhaJn3xyjLe9+Pjj9Zbo/1z+3TiJaku6tazu3/y9vfe
	 sOHBE/YvIEOL3WNcM9k0Lm5uh7hTRe76ZgZrKWeSg3cOu/ryqerTlAwwKMkAfwRmKV
	 MeJ4fRYOjOW4A==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 31DF24021B;
	Fri, 11 Sep 2026 23:52:09 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id CB124A0458;
	Fri, 11 Sep 2026 23:52:08 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=VOW2MMSr;
	dkim-atps=neutral
Received: from SN1PR07CU001.outbound.protection.outlook.com (mail-sn1pr07cu00101.outbound.protection.outlook.com [40.93.14.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id E35742200C1;
	Fri, 11 Sep 2026 23:52:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lec1V0ITUz4niDzQpMtCfzMGcQ1Ln63r9sWmiUab4DDZRQNIyz6n7lPrSaAE0b8tAHIH9Y9E68omOVBttwSISc36VfL5CSmR2t3x8YkzJF7PHKwvvi7b+IRzJqLy+pR0NzlWJaCHkY2kW4WpjwGrj4LA3ELc4Fx1dK7sQVHdsAYW1LFui8kGx53jHPQYwm6fZIWdNwk9t7xda1UB6V05gar8KeHX9HPAHIeCVqGU2H9W2SQ5mWr/LY8zPsaN3NUrbpplCF8I6Tcj5ndkMprDLWZX//AWBW7wXjFMxHcEm5Nwc5tVuKZ7GJQqhO7ZtTOZNpPNRAycRvNkESmVj3HyiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkP2Jq2FjmTkGSREH3GdKPFbaJsnK6yrZNiUGnpjVm4=;
 b=u3rxwZ5wrbbXLiFVdpxOoZRX9lX7zNZCODwKJ/HwL+C3EOnDeSkQy0ipbW7V7IS2cLOGZ6I+5VCCXlytMh4XSxvJyS1Gp4nLDAR3hvxQbovbqatGkK/GgpUosFSXEBhpa3IPbzlRmjEPnWBywQqTRHloUhRO4Ce0lok0mxmuoTd5Ohdu0WP7pmpV1aLfyX5pj9SUdTL7RfZJhz9f1wafFJtTQ8g8XbPr90/pYrRCR/Ct4o/JeiTXYKYB5d4+DhQhJPArKB21zN2TL5pIXkw1yIDPhkiOdMKtNR5EAq75cEFsDC9V7AVl4SxSDMh1OFokePNc6kcTZmWK7qtdcXnPTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkP2Jq2FjmTkGSREH3GdKPFbaJsnK6yrZNiUGnpjVm4=;
 b=VOW2MMSrWaODjug/yo679lkdcA+Zrpfrg9PrkgJPt70SQCHLmj84qKppDsaz2WeBBrTHaKY9UJ8JcGW0wBW3v9LcrS2WdhNM15dIOSeVOflNw/MIRTKQziax3SAXLkWFB0uwZEO9GbROQt9XYXDlwDnA+pLmCQcYE5za6V26ezY=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by MW4PR12MB7215.namprd12.prod.outlook.com (2603:10b6:303:228::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 23:52:00 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 23:51:59 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/7] usb: dwc3: qcom: Distinguish PM and runtime
 suspend/resume paths
Thread-Topic: [PATCH v2 2/7] usb: dwc3: qcom: Distinguish PM and runtime
 suspend/resume paths
Thread-Index: AQHdO7pW/Rj3/bDToUm0qC6lKkHB8bbKGZqA
Date: Fri, 11 Sep 2026 23:51:58 +0000
Message-ID: <aqSUEQ6_9VbFj-Qh@vbox>
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
 <20260903153827.3463313-3-faisal.hassan@oss.qualcomm.com>
In-Reply-To: <20260903153827.3463313-3-faisal.hassan@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|MW4PR12MB7215:EE_
x-ms-office365-filtering-correlation-id: 3980d148-1d55-49a0-1fd3-08df105fab30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|7416014|38070700021|4143699003|56012099006|6133799003|10067099003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 t7XW3xtqN3Vh4guqTtylat9xxwSVEiBLVm7/XRCLuy/rUGIrwtXZTZi13cCO/REM9XqqqfPsn8kH1pOCm/2wNkdHqTP3Kqk0Kri37eDrYyxXqTJqPPBpGAtfB9fdKk3rsGKFiJ2BAgGpc3e+MmeUJ4PLscU5aLVIxudUVlbiR+YPZcB91Lt9YQuRxOm/U2n1T0f6vDXYbxog3UnMiPLzat/g4DqraLkAwi4Tgnk9aRRbWs3b3j+zAdQcZKcnxqTEX7XG1WuX8v7FjaKwbHD+RfLxH6MPgSffpiptLk7Kr+4Vr79Kf39btn2K57AxxB8zOqdj4PBjuGznaEWESqQpdkNHPzkDzVd23d1Rffk3mHTuMHj2CsDobkfngLN6MetRxuBsltfjAJ6qypu42x95RVRWT/Ua+aQajHSimj8vDYRtHWVOeoB5xcZopH5UWxaroz/qatZOxeQZV5127PcepJ7q/H8mmYaSyBji8mbxJhDRjIsFdA8W5gI0nVA5jkzyqm6bh+h8QKNwht5d69i9u024MNSkPsN+W2MjqzSsvkKvsUvR6n6yXdAEmHo+VpEvEq0i8jQN42WvTod0gmJkX7fWqFz1lUbrLVMnEhawO0u6gukaZHeJnV8+UiAI1nFYVPXeYH36ftWBugvpvNnfP0s6L8s3L0NIO7IcDnJIKZqm6IvbftKMmLN0/Q1IyiP/7ETFslkD/bO2UPYAqmGLGQYJX4w9QRjo3/Hn1D1IcC8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(7416014)(38070700021)(4143699003)(56012099006)(6133799003)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bEZHTkNHb0J2OFBSMGJoejdWZ1JxakExWlFyL0lscUV5V1Y3cTJDVC9Na2NL?=
 =?utf-8?B?TkswSFFEQTNQQkhLckpLc2RJK3Nyd1VBWXRjUDFLc0xuOEt2T3YxT1Jmd3BO?=
 =?utf-8?B?aVRTeE9LUm54MFlYWTBiamFxR3NIeU1rRW5xMm91U0tDNEJzVnJIVkNkN2Rp?=
 =?utf-8?B?MU9xN3NCaEwvenNpTlVnKzhKTEQ0TjVENHJPaVp6U21IeWxiN3dHcWpEUlBk?=
 =?utf-8?B?TW5VN1lPMnVFWHRhUG1xT29lYUlnVEhSMlZaN0FQZkoySHczU1BRczJTU1ZK?=
 =?utf-8?B?MGxZWnBXVHNsTkRhTEUrVnNzaldUS1QrOFBpSThDK2ZzR1VmbTdMOG8vQmJU?=
 =?utf-8?B?eVd0eEFUTTNwaDBmRFNSUXp6UTREYm9CZEl4UTd6NkZhVWYvbzQ1U1NZUkVh?=
 =?utf-8?B?c1F0YTBmYitoZU9jcDN6RnNjc054cFhmU3BEM1hqSWEwa1g2Q3BWTWJMeWFW?=
 =?utf-8?B?MS9MSitmbVF0bjh1cVVUdUF0S05laXlGM2VwRmZTYWVGWm5DbWUwZ0dteHhv?=
 =?utf-8?B?R2lHV1NPNGNEbnM3WnRLZUxONlVIOXZ5eUkwUkQ3Z3dRSHQ2QXh6em9LOHpv?=
 =?utf-8?B?WDBwQ2RTOVAyWWFpRjBlMnJXTm9jUnA3OWFSdlJYeExGUzR3MHd6NnFnZkxO?=
 =?utf-8?B?bnRkTEFBWFI4bHFheE5qWGNmZUZjZlZYa2lkME56c3NlUFV6N0JQYVJRVm9S?=
 =?utf-8?B?U3FGWEFtVlo0NEp6dVlUbEpjQXRkZSsxajBGS1VwSjZiNStUSDRzU1FWOW51?=
 =?utf-8?B?V0dlZzUxb2lHM2hUbVJpdjVMVnFhNGRtbndBQVJuYjVseVZHWitITExldnRx?=
 =?utf-8?B?NkpSM1RKV1VwSHpEUFdxa1RndFFSa1UrcVM2UVlOT1ZvT1FoVnJZbjdzL3pm?=
 =?utf-8?B?MDBiNHZKaS9zS2VQR2FSSElqMzlhU1ZRV2ZPeW5hRkRldzloRkQ0cG1WZGVX?=
 =?utf-8?B?VHlZUW1DY1ZQa3hMOWdxNGRuazdLSnVka2dnTnIxQXZ0TEcxUFpnZnRoL3Ju?=
 =?utf-8?B?Nnp3MW8yc2JFNUVURngyd2VmWHZkMmVRVWFrSSt1MlJyblFQeFpGZWhFamQ4?=
 =?utf-8?B?ZXZDdHVBMkxhL29QTzlEd1BIdEJETGVqeXJBQkdvcEJRUXFvUDAwWmplRGZ4?=
 =?utf-8?B?Y05objUxY2xBWk92ZHpFSVkvem16c2dqUVk5T283eU1MTG02ZHREaElEWG9m?=
 =?utf-8?B?L3lwRmFONkU5MVJ1NGpvS0hoUVFjN3A5cncwQ0NJU3dBOUhSUSs1c3hEVkZQ?=
 =?utf-8?B?UjBua1RZQzdOMUh3Mi8zYW1ULy9YYlVVWUROSWpFWWZVT0swNDFQa0pscXBF?=
 =?utf-8?B?aW5aTmpjZlJkVW5wcUkveXFVa2xrZmhSbER3Q3oyWU5uRmhPNHFvZWNmbm5P?=
 =?utf-8?B?K01rSUxNQnB1Z1BKeFJtNnduZG9NOXBEajVsUDdlN2pOVm5uU0ZwNGp4TGNN?=
 =?utf-8?B?ZDVIa283dmVsSlNsM0ttNWRWYkd2NFJKSmVzazQrUjBrdUR0cisrV1hNQmcw?=
 =?utf-8?B?a3psRldubFV1N0VxK09DRVRNNCtGa1U0cWw3TmQ0OXMwc3d3c0VSVEVKZ21p?=
 =?utf-8?B?NUtmZW85bkRDYk5RcDFnRWQyZ3NVeFBWR2lvRkUvL2hIamNheVpNYXZJVWpv?=
 =?utf-8?B?bkJHS1hRL0pFZjBaTWRxZGo5aWVwczRzSmRLRWlvVjZlUGFwb09ZdGt6Z0R2?=
 =?utf-8?B?azBwVURySHo3NGsrczVEMWZVRys0djdUS1hyUzFRUWpXeTJaWTQxNzNnM1pV?=
 =?utf-8?B?YW9xMWpVa1czRkljNHpvOUNOTXNPVEVJNk9YUlE4ck1CVGtYc1FzZklXQlM0?=
 =?utf-8?B?eVpnOUtPdURQWkQ0S2xPRHVveUVJTFNiamxzK3VMdGRpdCsvMWxmR3NPdVBt?=
 =?utf-8?B?WTdtUzBYdU1IZWVyL3ArZ2RsTC8zanFVYWJYTGR6ZjNUTkFWQU9WdHBsd1BW?=
 =?utf-8?B?Vm9qa0xnNU5kdFJRbDFxY3BKdW5QZlRnM0V0OWxmNXBkUGcveUFSaFhLZ1l6?=
 =?utf-8?B?L2M2TStjay9NcUJXSjlKNE5CRnZCZ3BNZXNiYkw1V0ZWOXpXaUN1YVF6RTBl?=
 =?utf-8?B?S1lyR0VuR0x2MEJvRC9IWHV0RkUyVDlNVW9GNFdVY2hkRFZrck5BRDFTZDRE?=
 =?utf-8?B?NDhHalRpRE1jeG96WFFhbm9GVzVWMDdCMC9NVHVtTG1obVRoS0xoSkEvQVVy?=
 =?utf-8?B?UXRUU1l6ZVBwb1RsekpiWlk0U3FEeFhtYXlyeDJpQXJOMnJyaStkelVqR29J?=
 =?utf-8?B?TUNVS29uNU1idXd5OWh1R0NmTE8wcHUySll6UkcvY1ZESzV2WHhXQXZUU0tQ?=
 =?utf-8?B?V1NFMEpkZnBVZjNHYWdJUTlTZFlaVTR6d1VqaHZRZS9vMk54NjZsUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ACC64F5EACD0E24988DDBEA0ABFFAE91@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	VMrwX/MWYJ5omDuFS6lt3xAxg4VT+JkPEdiEPbMmgIMHIhkC6+sBDmG/jm1NKl8oEUj9TjNqkIMRpg2BEsI/WPo0yOTtm7hxOdv3qQ5xcm6KaCuSYKXVfLIc60nsTvIBG6LGu39SC1hD352/Sqrfw+vaDMibUVaJf+lqV1ahKOof8sjG/nf9kuk0bJbaIvlxWn9zr5HWZvXi0NAbZCVkseUxVRbDkxdDd85aC9eWYZ+jwqBMqF/+52WlKsVqf4m54CjOUBa+Nx+oGngwEVNvPr5k68oW35UyFtTghABRbOtn1fJDl3DFjz92j75X76wTSmVzcL31rhiZwvg1kTZuKQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4b+8zHGmR4PIre9lidBQ4Bw5Q3Ey6Hne9SSUoIM/4s6o8WpYfkJb4pF4XVdRGsdHmMh8mwETUiLU41M6rj9V2po/Ke4DJ02Lc0TFG5yaq3en7oLjf9ZpbpVu4GTLc93dxihy42R694cAYcVSLVxKw4GuzbzvegMFCJtVzG2xiWx4zRIRqg8evnWx3FcpaA1k3z+jvrId2D8WOcYukMuRux+/+1iwozoyZHcl+DRy9JezdkmGYW4ZKrcEMmBsqtuyDsNuvYQiI/UfIjThWdUxNIHNRz37EH3Pp0RbInaZB1qXvWcXXC8nYckLjFcDQK0ba1BMqphJxrdMA5UmHr0UvyapHlcChoE2vqRe/dtJSa/IsnDhzifyfqFd/W4z11MM20iGpRiX5Ych9B8mSRu+FqeNLaotcI49u65lLci3ndfemYjMRdDtQBh8vh6N5Ax2feV2/RgMf6aUQStARJzlzfTnQyIS0/t9zU6RtJrR/W3lQPb+fMxJHPJcriZxRzAYjtqI4/Fw2smipTzoEdpy7iLhIo14cmq2faIwPFO41/cGNfcFiIQZhOKjf4sesUG1MAaf8l+Jg8DnsY6IKsb0EvKPBBUxr4jXV4d8Wtgf19FJQKRCJ069w15dUlW8GUtVzZFCtRHarIA0a3MT8qD1nA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3980d148-1d55-49a0-1fd3-08df105fab30
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 23:51:58.9742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jHAMVXuwtM7JHOyAe1bW+fTV8Zu9Yi8roiVrHuHQKzbeL4RA2Ldml7yc5hVeIna0hNm+DDC3Cjj55uJhMey7xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7215
X-Authority-Analysis: v=2.4 cv=CYudd7rl c=1 sm=1 tr=0 ts=6aa4942a cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=OXSBO54T4I9bg79j1xQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDMzOSBTYWx0ZWRfX6WczwmdvzgeX
 ftn6e9r5skb0jeR0GRmsklIhE9OD/Lqdjgb08zM2W7qU+El3TiuEN5zvwucgGZHOTh8ijj5IUAr
 gLxf6DkS9QBONXj2bmZ4xdrXla+JYB4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDMzOSBTYWx0ZWRfX9tuTMIShyHD2
 6QpqigRfYeDPZva/pJhbRQk/tsU5nNCkmbsTtYxz1mqRQC/NjdGw8NQ1SbNGCCAyLfZ9U4tFPdD
 G8cei8DCh3d3h7teWyahdJQvtsaJ5anJ1wvdnqEfwAtOAX7kbdjmvwnS/F5kgE3AmmvrEJW0Ua2
 +CEkKDenosys118ZAL3rp0ZHBiww87vKNa3mOA0v6I/aQutq7kBtw9cEf+jZeHzi/ofdwqaRF5m
 Z+diepUXcBK7oXJkQnnk5DMd9XUI1Z2npuWx9W4MA2XrqWGv1n1g1nf1x89cmcB26ImCrqYysQ6
 zIKfzLyBul9ku/5EE6yzAbbyPlgwwxCc4egV5eoAmP6jx7OUiTCx/i7SOaRN7esVhdhb4nRrD4E
 BoW7j/QPNv/WnmZIK62cNkpp7kYs24VlBHnjtK6S2e/2UpFXGawkublWZmkaqzS//eDYRL+pDxr
 aD/1PgjNZhsaqc/+ssA==
X-Proofpoint-GUID: XDzyjatNNEves-MZHyXLvjhlr9VJeR7b
X-Proofpoint-ORIG-GUID: XDzyjatNNEves-MZHyXLvjhlr9VJeR7b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 adultscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609110339

T24gVGh1LCBTZXAgMDMsIDIwMjYsIEZhaXNhbCBIYXNzYW4gd3JvdGU6DQo+IFRoZSBkd2MzX3Fj
b21fc3VzcGVuZCgpIGFuZCBkd2MzX3Fjb21fcmVzdW1lKCkgZnVuY3Rpb25zDQo+IGhhbmRsZSBi
b3RoIHN5c3RlbSBQTSBhbmQgcnVudGltZSBQTSBwYXRocyBidXQgY2Fubm90DQo+IGRpZmZlcmVu
dGlhdGUgYmV0d2VlbiB0aGVtLCBwcmV2ZW50aW5nIGRpc3RpbmN0IHBvd2VyDQo+IG1hbmFnZW1l
bnQgc3RyYXRlZ2llcy4NCj4gDQo+IFJlZmFjdG9yIHN1c3BlbmQvcmVzdW1lIGZ1bmN0aW9ucyB0
byBhY2NlcHQgcG1fbWVzc2FnZV90DQo+IGluc3RlYWQgb2YgYm9vbGVhbiB3YWtldXAgZmxhZ3Mu
IFVzZSBQTVNHX0lTX0FVVE8oKQ0KPiB0byBpZGVudGlmeSBydW50aW1lIFBNIChQTVNHX0FVVE9f
U1VTUEVORC9SRVNVTUUpIHZlcnN1cw0KPiBzeXN0ZW0gUE0gKFBNU0dfU1VTUEVORC9SRVNVTUUp
IHBhdGhzLg0KPiANCj4gUHJlc2VydmUgZXhpc3Rpbmcgd2FrZXVwIGJlaGF2aW9yOiBhbHdheXMg
ZW5hYmxlIHdha2V1cA0KPiBmb3IgcnVudGltZSBzdXNwZW5kLCBjaGVjayBkZXZpY2VfbWF5X3dh
a2V1cCgpIGZvciBzeXN0ZW0NCj4gc3VzcGVuZC4NCj4gDQo+IEZvbGxvdyBkd2MzL2NvcmUuYyBw
YXR0ZXJuIHRvIGVuYWJsZSBmdXR1cmUgcGVyLXBhdGgNCj4gc3RyYXRlZ2llcyBsaWtlIGRpZmZl
cmVudGlhdGVkIHBvd2VyIHN0YXRlcy4NCj4gDQo+IENvLWRldmVsb3BlZC1ieTogU3JpcmFtIERh
c2ggPHNyaXJhbS5kYXNoQG9zcy5xdWFsY29tbS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFNyaXJh
bSBEYXNoIDxzcmlyYW0uZGFzaEBvc3MucXVhbGNvbW0uY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBG
YWlzYWwgSGFzc2FuIDxmYWlzYWwuaGFzc2FuQG9zcy5xdWFsY29tbS5jb20+DQo+IC0tLQ0KPiAg
ZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYyB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMg
Yi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jDQo+IGluZGV4IDQ5Njk4YTMxYjJmNC4uNmQy
NWY4MTgwMGE3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jDQo+
ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gQEAgLTMzNSwxNCArMzM1LDI0
IEBAIHN0YXRpYyB2b2lkIGR3YzNfcWNvbV9lbmFibGVfaW50ZXJydXB0cyhzdHJ1Y3QgZHdjM19x
Y29tICpxY29tKQ0KPiAgCQlkd2MzX3Fjb21fZW5hYmxlX3BvcnRfaW50ZXJydXB0cygmcWNvbS0+
cG9ydHNbaV0pOw0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMgaW50IGR3YzNfcWNvbV9zdXNwZW5kKHN0
cnVjdCBkd2MzX3Fjb20gKnFjb20sIGJvb2wgd2FrZXVwKQ0KPiArc3RhdGljIGludCBkd2MzX3Fj
b21fc3VzcGVuZChzdHJ1Y3QgZHdjM19xY29tICpxY29tLCBwbV9tZXNzYWdlX3QgbXNnKQ0KPiAg
ew0KPiAgCXUzMiB2YWw7DQo+ICAJaW50IGksIHJldDsNCj4gKwlib29sIHdha2V1cDsNCj4gIA0K
PiAgCWlmIChxY29tLT5pc19zdXNwZW5kZWQpDQo+ICAJCXJldHVybiAwOw0KPiAgDQo+ICsJLyoN
Cj4gKwkgKiBGb3IgcnVudGltZSBzdXNwZW5kLCBhbHdheXMgZW5hYmxlIHdha2V1cC4NCj4gKwkg
KiBGb3Igc3lzdGVtIHN1c3BlbmQsIGNoZWNrIGRldmljZSB3YWtldXAgY2FwYWJpbGl0eS4NCj4g
KwkgKi8NCj4gKwlpZiAoUE1TR19JU19BVVRPKG1zZykpDQo+ICsJCXdha2V1cCA9IHRydWU7DQo+
ICsJZWxzZQ0KPiArCQl3YWtldXAgPSBkZXZpY2VfbWF5X3dha2V1cChxY29tLT5kZXYpOw0KPiAr
DQo+ICAJZm9yIChpID0gMDsgaSA8IHFjb20tPm51bV9wb3J0czsgaSsrKSB7DQo+ICAJCXZhbCA9
IHJlYWRsKHFjb20tPnFzY3JhdGNoX2Jhc2UgKyBwd3JfZXZudF9pcnFfc3RhdF9yZWdbaV0pOw0K
PiAgCQlpZiAoISh2YWwgJiBQV1JfRVZOVF9MUE1fSU5fTDJfTUFTSykpDQo+IEBAIC0zNjksMTQg
KzM3OSwyNCBAQCBzdGF0aWMgaW50IGR3YzNfcWNvbV9zdXNwZW5kKHN0cnVjdCBkd2MzX3Fjb20g
KnFjb20sIGJvb2wgd2FrZXVwKQ0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMg
aW50IGR3YzNfcWNvbV9yZXN1bWUoc3RydWN0IGR3YzNfcWNvbSAqcWNvbSwgYm9vbCB3YWtldXAp
DQo+ICtzdGF0aWMgaW50IGR3YzNfcWNvbV9yZXN1bWUoc3RydWN0IGR3YzNfcWNvbSAqcWNvbSwg
cG1fbWVzc2FnZV90IG1zZykNCj4gIHsNCj4gIAlpbnQgcmV0Ow0KPiAgCWludCBpOw0KPiArCWJv
b2wgd2FrZXVwOw0KPiAgDQo+ICAJaWYgKCFxY29tLT5pc19zdXNwZW5kZWQpDQo+ICAJCXJldHVy
biAwOw0KPiAgDQo+ICsJLyoNCj4gKwkgKiBGb3IgcnVudGltZSByZXN1bWUsIGFsd2F5cyBhc3N1
bWUgd2FrZXVwIHdhcyBlbmFibGVkLg0KPiArCSAqIEZvciBzeXN0ZW0gcmVzdW1lLCBjaGVjayBk
ZXZpY2Ugd2FrZXVwIGNhcGFiaWxpdHkuDQo+ICsJICovDQo+ICsJaWYgKFBNU0dfSVNfQVVUTyht
c2cpKQ0KPiArCQl3YWtldXAgPSB0cnVlOw0KPiArCWVsc2UNCj4gKwkJd2FrZXVwID0gZGV2aWNl
X21heV93YWtldXAocWNvbS0+ZGV2KTsNCj4gKw0KPiAgCWlmIChkd2MzX3Fjb21faXNfaG9zdChx
Y29tKSAmJiB3YWtldXApDQo+ICAJCWR3YzNfcWNvbV9kaXNhYmxlX2ludGVycnVwdHMocWNvbSk7
DQo+ICANCj4gQEAgLTc1OSwxNCArNzc5LDEzIEBAIHN0YXRpYyBpbnQgZHdjM19xY29tX3BtX3N1
c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgew0KPiAgCXN0cnVjdCBkd2MzICpkd2MgPSBk
ZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gIAlzdHJ1Y3QgZHdjM19xY29tICpxY29tID0gdG9fZHdj
M19xY29tKGR3Yyk7DQo+IC0JYm9vbCB3YWtldXAgPSBkZXZpY2VfbWF5X3dha2V1cChkZXYpOw0K
PiAgCWludCByZXQ7DQo+ICANCj4gIAlyZXQgPSBkd2MzX3BtX3N1c3BlbmQoJnFjb20tPmR3Yyk7
DQo+ICAJaWYgKHJldCkNCj4gIAkJcmV0dXJuIHJldDsNCj4gIA0KPiAtCXJldCA9IGR3YzNfcWNv
bV9zdXNwZW5kKHFjb20sIHdha2V1cCk7DQo+ICsJcmV0ID0gZHdjM19xY29tX3N1c3BlbmQocWNv
bSwgUE1TR19TVVNQRU5EKTsNCj4gIAlpZiAocmV0KQ0KPiAgCQlyZXR1cm4gcmV0Ow0KPiAgDQo+
IEBAIC03NzksMTAgKzc5OCw5IEBAIHN0YXRpYyBpbnQgZHdjM19xY29tX3BtX3Jlc3VtZShzdHJ1
Y3QgZGV2aWNlICpkZXYpDQo+ICB7DQo+ICAJc3RydWN0IGR3YzMgKmR3YyA9IGRldl9nZXRfZHJ2
ZGF0YShkZXYpOw0KPiAgCXN0cnVjdCBkd2MzX3Fjb20gKnFjb20gPSB0b19kd2MzX3Fjb20oZHdj
KTsNCj4gLQlib29sIHdha2V1cCA9IGRldmljZV9tYXlfd2FrZXVwKGRldik7DQo+ICAJaW50IHJl
dDsNCj4gIA0KPiAtCXJldCA9IGR3YzNfcWNvbV9yZXN1bWUocWNvbSwgd2FrZXVwKTsNCj4gKwly
ZXQgPSBkd2MzX3Fjb21fcmVzdW1lKHFjb20sIFBNU0dfUkVTVU1FKTsNCj4gIAlpZiAocmV0KQ0K
PiAgCQlyZXR1cm4gcmV0Ow0KPiAgDQo+IEBAIC04MTksNyArODM3LDcgQEAgc3RhdGljIGludCBk
d2MzX3Fjb21fcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gIAlpZiAocmV0
KQ0KPiAgCQlyZXR1cm4gcmV0Ow0KPiAgDQo+IC0JcmV0dXJuIGR3YzNfcWNvbV9zdXNwZW5kKHFj
b20sIHRydWUpOw0KPiArCXJldHVybiBkd2MzX3Fjb21fc3VzcGVuZChxY29tLCBQTVNHX0FVVE9f
U1VTUEVORCk7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyBpbnQgZHdjM19xY29tX3J1bnRpbWVfcmVz
dW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gQEAgLTgyOCw3ICs4NDYsNyBAQCBzdGF0aWMgaW50
IGR3YzNfcWNvbV9ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICAJc3RydWN0
IGR3YzNfcWNvbSAqcWNvbSA9IHRvX2R3YzNfcWNvbShkd2MpOw0KPiAgCWludCByZXQ7DQo+ICAN
Cj4gLQlyZXQgPSBkd2MzX3Fjb21fcmVzdW1lKHFjb20sIHRydWUpOw0KPiArCXJldCA9IGR3YzNf
cWNvbV9yZXN1bWUocWNvbSwgUE1TR19BVVRPX1JFU1VNRSk7DQo+ICAJaWYgKHJldCkNCj4gIAkJ
cmV0dXJuIHJldDsNCj4gIA0KPiAtLSANCj4gMi4zNC4xDQo+IA0KDQpBY2tlZC1ieTogVGhpbmgg
Tmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGluaA==
