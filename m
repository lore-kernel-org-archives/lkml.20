Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B3C2773C3;
	Wed, 23 Sep 2026 00:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122932; cv=fail; b=lvYShzoqx/4o1mD25GP5WzeNFy14vFXHw3vdFo1GEQTFfNI2PV5K/OQarrNFvhMECw6KySJRP9/xpdwAA2+xPbfLzmcHeBFkQJCmDmDAE1qev/oZZQ/XAYcqlAJc81YQI8/Y90xheID9CYz8/wTpaRCExdXIsiBndDaQUAzn2gE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122932; c=relaxed/simple;
	bh=tJy9ZPdhDW/UhR9Tw6LgPiAoJGuB/AlvQL3Fs1W6ln0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eX/v7LDnEhXD1OsGwXMGTqBx5TsA/FEfa2WKUMIwfqMCH8u+h+IlqlpnWG0HpKPeTGHNxbsu/HB152w5ZkDh/BtRO12czzKm4RMF2Y5sHJPw20JTJHKzjYPV8yuct9Nuil7HCfGN12x6KAbAOcKYKLVp0F36xqHf1vSxaxWUbPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=umYKj0FB; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=RHCjM9Eh; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NHPcbrvg reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="umYKj0FB";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RHCjM9Eh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NHPcbrvg"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MK9PMn2632141;
	Tue, 22 Sep 2026 17:22:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=tJy9ZPdhDW/UhR9Tw6LgPiAoJGuB/AlvQL3Fs1W6ln0=; b=
	umYKj0FBbjR5NG4jazgL40U8WXDOVUKrsQ4V+wW9mMxsTpYqgEiB5BkFdCiZPFCv
	NLoEC24jCNfVCTYpoY5IqseOP0K3c61gryHr/sllYQ3MPikyacB22ikjSJA9zwjR
	cX7dvRYhajMWKL5LqYM8hEOrK7o6+NfUZjkWwps5ciUhBWmxoFbfmfqqOQis1mpW
	PxlU/KrmE9/nB6GqssWaCqeV63HClTuBrb+mT4iqY/i9t2tJjYf0WLBdyw/wFFn+
	1pCHl6HytGQT1KT2fy45Ynv2R8ZTRg67thfhXefvLyPxal0t6bcIbQVg5j968z3Q
	jxyEAw2WEu0NNAxb1QKOmA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4gur5dp89g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 17:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1790122924; bh=tJy9ZPdhDW/UhR9Tw6LgPiAoJGuB/AlvQL3Fs1W6ln0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=RHCjM9EhQf5EbKxdEnIrKyXYwBMwRlsq2cB3+gTfW137ZiAinmVsngReYQggxH45S
	 Ng2rs3j8JMSONdNsNCJB8yt5FI7JD+RoVYIpQfO5gzTlU/nen3zI6i3cFkEsOwoeRP
	 0PrTbjfYZMJX5M26ogOh+d7wKUdQizoX8ffPkuNHV1zFvByk2hFyMLXD9kG3Ezqbyx
	 w76vX+Vi5maTVoCQfTZE50PjM+kLqlC2yeeblL9htVslk6ubVSzS5wYwkMpxO/CHrv
	 9dgrh+QG83KFPskG+TAqZSgG8kDucFfYFrQ3TTL5WGvzveFOuV+ej0iV/cbGU8Zrzf
	 fh/euVt+OdK1A==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2B6BC4014A;
	Wed, 23 Sep 2026 00:22:04 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E8E15A00B4;
	Wed, 23 Sep 2026 00:22:03 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=NHPcbrvg;
	dkim-atps=neutral
Received: from SN1PR07CU001.outbound.protection.outlook.com (mail-sn1pr07cu00102.outbound.protection.outlook.com [40.93.14.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2B721405A3;
	Wed, 23 Sep 2026 00:22:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OR+5iOR1gHdHErOGreXm34+1mY5lf2swa+qIr8+p/1HJWRnYqqWwbyBQU8ng3O+oi2Sga7gKWqYTRE5W6SD0pA5b23pbvbFDACOiLkOJ/uKYpV9a3P8qLS/1r5vrzyG05mghIjb35LsHvBbOZqO9FJRTt3mKLi2VkJ9fojsbN7zTx9b0yAN6wCQFdRRcVkC+ZpZCTkgtG3kEewtewj0L9uYsElJ378QyN2ySINZktihNkO7HPkCLaqyzSxWuIpub8USt97pyQpCa6s3LcpnJVMGV2PRUdCuFxNt3GN6Fs2rlaUN7paPBL627ZYUXiWqLD1kEMeKBsMhDM1GSXz5gmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJy9ZPdhDW/UhR9Tw6LgPiAoJGuB/AlvQL3Fs1W6ln0=;
 b=xvlbf77U0NN5U6nU605f3SV1cXqtiqQwiFP17ZQPs67+H6xi68p9oJt4phduMR6bNvM9e6qo5V4oHBbkqz/0xtt6O/e3yKwcLMGoLcCmXwLVYTNDNu8ri1Sf6FL27aaFzaQ4tyLo1TAhWWKeU3N4Ami2J4OosjtBefcMqqS3c3cZTwBxBjl+tR5XzZuq86ALCWxt5RZ6xDUIkN00teX8xQGHqN9csirpuZwCLQPcqQSCAxOMCjmpMMd3rr/EVZGz5DH3BPjoQ+uejd8ZXAt4/gA5aBAeAp2lEx1uIjeqYCCymDSydXfGdl5iYpcCtFnJt4E5XJX2o0Oinyftw5XX6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJy9ZPdhDW/UhR9Tw6LgPiAoJGuB/AlvQL3Fs1W6ln0=;
 b=NHPcbrvga+qSIpzsUzVAOYi9B4/vs1eiD9KmJf4hfFxTRsB21xcdPVNrz6mYttYdbs7RZDdCGmCQGY/x+n8phqVM6REsy94ENkwDlBqlWePEzhsfilplT5GtQAuBBRf7FzL3Ybdr7mSNXUGW3xbfgjxCO8ouU1DWWWzmMvzPUfk=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by PH7PR12MB6610.namprd12.prod.outlook.com (2603:10b6:510:212::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 00:21:55 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 00:21:55 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Myeonghun Pak <mhun512@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Roger Quadros <rogerq@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] usb: dwc3-am62: shut down refclk on remove
Thread-Topic: [PATCH] usb: dwc3-am62: shut down refclk on remove
Thread-Index: AQHdQx7qp6kdBlLEvk+SkBZzWS8WibbbXNIA
Date: Wed, 23 Sep 2026 00:21:55 +0000
Message-ID: <arMa4Y1_iTQJg3FA@vbox>
References: <20260913012620.13593-1-mhun512@gmail.com>
In-Reply-To: <20260913012620.13593-1-mhun512@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|PH7PR12MB6610:EE_
x-ms-office365-filtering-correlation-id: 54db33e9-efaf-45a9-faa7-08df1908ac58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|56012099006|11063799006|5023799004|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info:
 dGwcOUlImF/uyJTpck/Hr/i3zf8y9G5kVzWz+Swle3TR5jZFt90HnxpkO671G8fE63dh7KOIYUkixhtT6DV566LG64qAqs70fWuWjq+z8WgWRB8n7rTGsBVUkFH176kmNkC1Itw2XjYz3+A8Fu+1LGoNIjON5CUP2q4S9++vOkGAJa0tCoKeRSBpdNn3FGjaXJxbQMiQOFyam/JSFFTWJpfHqIN2w/sN8Dmt1gkWedoumEyeH9Q/8NptpZcQv+l3n2uCP2eljfeJOzSLs6DgEoREJs3TJvOEbTOOiTUv3K3wP4CQYzD+ex9MfL05pfOARfePZ1nf7SdpXu6fpMfwQGftRkYRbDFiPBLsfj6S0HXLkH3kOQOozKqqe9tS2P7AnTqXR4EkHF2zm8m+skvFzlEPCrIBlsUbjwXnA2zRBsLAdHblgWtyKdFMLVs6tw/LAfuVVOVER0PHVObyE3vvFjnTm8kUruL6fN/L5Z2/6z/njBzEIZ2qNZkYBtkxtfTMB1mUhLFTatFOEMZ1L3xL528lo2fIxdhtZaMgs5dxb3FNjotXbeWFp6eds2ninXzYfJJl2a8HAkjC+ocn1i4JO0JnwiqGOtzyQm1MTMd68GZVMw2ef4uVzEqaT22Zoo0OPdotDWAvjsV9zmnqSo8FXwt9lTYFeiTyl7+UaSEo+Croxh4+FBaod5l5lV2g8U9iiOZYDi+hmCp0WiNOI5pTzckaIzSvtMzgony1RKb4moY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(56012099006)(11063799006)(5023799004)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K0xXd0RDdkFRbmloN2dBbXh6dEZTSDR4bS9kWWpac2V3NHdjVkZPMExHbEh3?=
 =?utf-8?B?ZWJ5WjZvaERKaFh5RWFlaWNqK0lic0g1TXlFeXhnNlJBZzJDSWR2eTlUcUVX?=
 =?utf-8?B?RlFNellmNHovZGZQRHAxbmgvN1lISTBrWlkwSWpScENVNE9ONDVzSjd3dXpi?=
 =?utf-8?B?bUFBV3Z6UXVyeFJuNThESndtQ2gzbjZIdHFUb2JSOWo2Rmxtbkh4WmZZRXpP?=
 =?utf-8?B?Mi9STEtBRFcyUE1ZWmRjdXN1cUVmUFVHczdQTDlIT0xadkw2aTZJM2tWcVhJ?=
 =?utf-8?B?WlFNRTAvSHhLVUtKVmF0MVZEUFNEUlJRaWJIOEgzRDhFMTlkMjQrV1IxbmNX?=
 =?utf-8?B?Wi9INHpFSUJ6bzZKZnc5TDFHb2taY3VVdVpWcHJjVHFrcU5DazdHeUVKQ3ov?=
 =?utf-8?B?Y1hwT0JDRitGMEJBci9CczFEUi9QOU1YTGk3eGg0Nko0MGJxcEJtM2pTektz?=
 =?utf-8?B?alMrRjI1ODQvUjY1WFNXMWdCRG5Uc1l5R0ZaYWg3NGt2YmhndzJ6UGRWc3RG?=
 =?utf-8?B?L3VTNWJNWHdRM0RaMEtKUUhmTDA1MCtVYmJRL1hraFE5Q3ExZnRjMTZzS3Mw?=
 =?utf-8?B?U2NPVUJ4eHR3MTc2cTRQOHJvd0RZd2tiZmo5MDJSYjFjekFTNHVmNGVtN2Rv?=
 =?utf-8?B?MmRXdm9XNG1GdEpKQjhvdUlmLzFkTDFZd0N2Z0ZBMmhDa3hzUnFYVVdaRWRv?=
 =?utf-8?B?TnNUNkhhSmdVMTh4b0ZacEl3R2FEOGcxTnVTSzM4UjVsNlBhdk42Y1RsN1VZ?=
 =?utf-8?B?M1hRMnBGTkVmVy9hZGxUSHpKZ1hnaTQvd29TTVVoa2dBUzl1SldkdlJCaHhJ?=
 =?utf-8?B?U1h0b0RaK2x5MlJDVzVJSWE1VzFCa2ZvTUI2dWJMMlNFYXVaazBZYW1NR2dn?=
 =?utf-8?B?RVA5aDNIM2c4OWRZTDlDdE12NVhPT2l0VFQyaDZ5Y0U4cWV5dWFKVGZaUytV?=
 =?utf-8?B?Ukoyb2ZNanNrOElmS3NuNHRHck0zeE9FNlJwaHA2TGNQYVl1ZmRMbytlMnZD?=
 =?utf-8?B?N0JVUlBKdXdCV0ZhaS9pS1huWEg4MkdCUjFMaU9OOXZ4SGJxMEx3elVDR09z?=
 =?utf-8?B?UnA2U3JNWU51QnU5ZVRpaGpzSDhGSlZ6RjhnTDBTbmFxWUE3TnBaTG9nY2NP?=
 =?utf-8?B?SVhXUGlHWWIwaUF5Rk1qRlE0SStvL2JGMGZ4NE54ZFA5ZmdUKzlQUHJPaCtu?=
 =?utf-8?B?Rzk4cWIvTGVhYnkwblplREl5SGRLTFpVcFZKZVM2RU8rWXYvSTk1YWNQTUpS?=
 =?utf-8?B?OFdrYjZBd1Bmc2trY0dkd3RKQmNKbnQzWUNuMmZ3QTFhODZ0UXVxZTRubjgz?=
 =?utf-8?B?bnArTkx3UnY5aUNEb3VDZVJQUS9HUXBHbTZNQlhEdFZKb2lOK2JrQlFNZ3Q2?=
 =?utf-8?B?Z0F4STJqNzFtRzZWUDEzWDRBOEg3S3ZCekhseFh4RENwLzJjVk9tU1RkaTVa?=
 =?utf-8?B?dDRRdlpjQ1RhekdLR3IyeXlYSFBZVVFHellOanJ6ZmMxbTJkU0JTZWk5aGdq?=
 =?utf-8?B?OWQrTUViMk9sQTZIaUpZb2JnemhlVEthRk02NEFuRnI0b0kvUXFFZG9lVzUz?=
 =?utf-8?B?Wk5lR0RRSmJKYytBbmlJSHhXMDlBYmhXejJ3Tm8yamNMNlhoMWpUSDRsQm1p?=
 =?utf-8?B?YVp2WVc5eDBRelR1QVBBY0YvTHhkcURKdkYyeUdrTFREeG42RldvVjdGOUNJ?=
 =?utf-8?B?VlZTeEtsN1ZzOUxGZzJNd0tOSUF5QVI2TDJFcHpNeThJd0dhYXZEVzdrNld3?=
 =?utf-8?B?S1U2bGVFT3FKUE9aNzNYMWl2bUhNRHhXVWhpWVlUb2JicnlHYkhkaTRnaWxD?=
 =?utf-8?B?dmpTajlYbjhUaHNCUGc4MUFVa0VQSnJPUjF1aDRIL1Y3ZXhRZ2tCblgxVGtX?=
 =?utf-8?B?WlJYN1BJUERMUVc0bXRMUnVoZUZOVy8xOW05WkFnL2pJUTFzdjRyVUFLLzND?=
 =?utf-8?B?TVdTUytVYVErL2FONkFWeHEwbGhCVXFueDJydDhhZ25ITmF3ZmFJdkcwSjV2?=
 =?utf-8?B?QkZWS0hUL0dIZGd5dWVjeUFIZERpeVpyYjA1eHJiR2NaaDlWdnRhdjkvUXlP?=
 =?utf-8?B?MG5rcTFENzF6Sm9VREEvaXNQcnFjM04yMmR1a2NuNEJsdVdJMDJTUFdhZ1Z6?=
 =?utf-8?B?bU02dlJnaEtWWlBOeFNCa0pZTHQ0OUlLSCtrRlRwVUpoTGEzMkl0aWRkYndp?=
 =?utf-8?B?RjlXTUd4T052RnBPSUR4ZUdpQ3FTdGo3bzhka0lqcnJ2R09XcmNLREhMUUlW?=
 =?utf-8?B?cnFldDkxbkhnMXdpc3NUck4rUlNSdEkzeWFyV2htcjdIVDJPVjZYa1Vpd2k5?=
 =?utf-8?B?NEk0ZENoMHFEYmJ0SmF2WFMyUnFOS3ZvbmpvWkkzb1Z2K0pBMkFNQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2520759132530D49BF83228F2B5BBD0D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	egcXdgAcd57/rWwn9ai1xXRm5EnlAQr7DIMYBkrfj4LPUZ1xrgbbdRueKTR8lKk+cGuOMWb03eTiIxQbrlQqBs637TcHZVoUEVR/ZOTGNSkoAHPTs1Ibl8upH7CcQam16ZbXaI8gdawQ0vZspThCt5PlzadbpEwbMSXhl0Ns1Sq8FoGP4WYIKU4KcnCjQPO86BVvDG0q6Smtie/lEUqG/588isrS/ZUHnecBgaY6eAXffAgCDv+IMd/3CPtmljSUkWytkf0NarVhNgHv51t8lS1kV+JoUAwKXQyyhXMYYX3DxVyh5JO21fVT/6vmnyLDZr2gZBbPjTOTnol2+k6swg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mXZQVeNABSY8t6A0U/KER+vuhH3HL4ojWr3gqQ/F7HzVDgwRd/yzKDsL1ntLhPO/JzbCG6jw2bZrPeicOI5nUrrlCU8DDfPXzukYA8YJrc80wQRzV0drdQuXQOs2X5MEddMIDMxPEMP1vyDUIXP9BK0uGhCpjG7DYNUWH/QoNKRIUpXmyIg2i5XOc8rqdJ8baiOXHCAlBF08kUPKET6ctz8B16C4TgXySrYyStK8xNG/+C0kB9cbeqdIdsP2RJjxfCA//YS0MRMrNAEFJBHbAbHlfm+fT83LHcfa3HrIt3ORCIAm2xgDzVzHX3xIEm4futHfUbO0WOSijYyHfJ40tJDSj1jFfHCo/NBKIRMjqaMU42AMP/cqHRbTRV215lfGRNeh0gvM7tneiJEU9Kyq2W/j3tz8K16y5SmJ9l5kuzdzlUBtKCLYm/LtEb9sN6lP2gIIyfl58P7B09peV5+mS+3Nke7GABEYPW0EneNW9FSkN03DqJXc4YTP9lq/V7cXC+yYcwNVz86KvpxRm3+690sqaeqXVMVMIgC34KVd48xHJ3pQY27sXQjWB1Krusa94CZOPEOv4Mjq9vphpbXHP1nSaHBc78zvE/Z6BYhBXJrMAa9L5jWM7jATO+iEIPdXmhSUQ6qTMAGnemDVJP8V1A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54db33e9-efaf-45a9-faa7-08df1908ac58
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 00:21:55.1789
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3aq7vv4IXTrNON9iZsenT4PkzK1iaynmcKJq4dcuSaDSLTPtwaGtf0/c2orCj6KJNWU+A7c539HFrSKGyzSrEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6610
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwMSBTYWx0ZWRfX5zFYzenQmB/E
 RSi9Zyqs+KSbZ80ReBzCCZkZAcdXKxxOULw8WUc+P5kjTNStZJMIntWraHCgy5vsiTjOweEX9ib
 BZvMD+Sd2SN23xERnr6WYrGm2YBOyqjCPZj8nmnrFDVoRcdwoF8yFJp5SxOPmSzxC4FgEZuVNoA
 bNLCr5rPQPe97H+R4rvTXkl95s9aTx2STP7WzB5+hp8BzbsdHuTpcnEjfTkZj/V1JNPwifHX8EL
 ocu9dCEJaTOqz2sCfrvev7NuKdOad2Q0KhBNjHZoX0ctWWIo5y9qlMkeIz80hbpNHsOK/ayrRZp
 /2FHaOhPdBy3PU2rAykInfn5DZQDyHOzGynuCrBLSclxDFgwtQIWH3UZ3z2BAfYpdP7S0Ioj2Ih
 lmdCi9K5asYG3bve6uGUs5W8GQ4QeNekVta2L5ZmV0UFXopVPYbrQShlgups3sR0mDWGGh/v+r7
 ex1IUC6D4Z2CORbPdWA==
X-Proofpoint-ORIG-GUID: e9u7HYKihFwgkUBS89w5FvP3AixtCMxD
X-Authority-Analysis: v=2.4 cv=eN2GH3p1 c=1 sm=1 tr=0 ts=6ab31bad cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=pGLkceISAAAA:8 a=jIQo8A4GAAAA:8 a=UoZ-RpKvYQoDaxhRcggA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwMSBTYWx0ZWRfX1C2cONTU5wow
 6xvcAWXhYYReo0/Qc5RVebJjaIj6XJqvXVcoUfCifSeVQi/9X5Ym9nxFXJ67wRRlSBjBF1Sru5J
 G3CtnYnbC7D44bWmaGF7mOucz5G2dKg=
X-Proofpoint-GUID: e9u7HYKihFwgkUBS89w5FvP3AixtCMxD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1011 suspectscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609230001

T24gU2F0LCBTZXAgMTIsIDIwMjYsIE15ZW9uZ2h1biBQYWsgd3JvdGU6DQo+IGR3YzNfdGlfcmVt
b3ZlKCkgcmVsaWVzIG9uIHBtX3J1bnRpbWVfcHV0X3N5bmMoKSB0byBpbnZva2UgdGhlDQo+IHJ1
bnRpbWUtc3VzcGVuZCBjYWxsYmFjayBhbmQgZGlzYWJsZSB0aGUgVVNCMiByZWZlcmVuY2UgY2xv
Y2suICBUaGUNCj4gY2FsbGJhY2sgaXMgbm90IGd1YXJhbnRlZWQgdG8gcnVuOiBhdXRvc3VzcGVu
ZCBtYXkgZGVmZXIgaXQsIGFuZCBhDQo+IHJlZmVyZW5jZSBoZWxkIGJ5IHBtX3J1bnRpbWVfZm9y
YmlkKCkga2VlcHMgdGhlIHVzYWdlIGNvdW50IGFib3ZlIHplcm8uDQo+IFRoZSBmb2xsb3dpbmcg
cG1fcnVudGltZV9kaXNhYmxlKCkgdGhlbiBjYW5jZWxzIHBlbmRpbmcgd29yayB3aGlsZSB0aGUN
Cj4gY2xvY2sgcmVtYWlucyBlbmFibGVkLg0KPiANCj4gQmFsYW5jZSBvbmx5IHRoZSByZWZlcmVu
Y2UgYWNxdWlyZWQgYnkgcmVtb3ZlIHdpdGhvdXQgcmVxdWVzdGluZyBhIHN1c3BlbmQsDQo+IHRo
ZW4gZGlzYWJsZSBydW50aW1lIFBNIHRvIGRyYWluIGFueSBvcGVyYXRpb24gaW4gcHJvZ3Jlc3Mu
ICBEaXNhYmxlIHRoZQ0KPiBjbG9jayBleHBsaWNpdGx5IHdoZW4gdGhlIHN0YWJsZSBydW50aW1l
IHN0YXR1cyBzaG93cyB0aGF0IHRoZSBkZXZpY2Ugd2FzDQo+IG5vdCBhbHJlYWR5IHN1c3BlbmRl
ZC4gIFRoaXMgYWxzbyBoYW5kbGVzIENPTkZJR19QTT1uLCB3aGVyZSB0aGUgcnVudGltZS1QTQ0K
PiBjYWxscyBhcmUgc3R1YnMsIHdpdGhvdXQgZG91YmxlLWRpc2FibGluZyB0aGUgY2xvY2sgYWZ0
ZXIgYSBmYWlsZWQgcmVzdW1lLg0KPiANCj4gVGhpcyBpc3N1ZSB3YXMgaWRlbnRpZmllZCBkdXJp
bmcgb3VyIG9uZ29pbmcgc3RhdGljLWFuYWx5c2lzIHJlc2VhcmNoIHdoaWxlDQo+IHJldmlld2lu
ZyBrZXJuZWwgY29kZS4NCj4gDQo+IEZpeGVzOiA2NjYxYmVmZTQxMDAgKCJ1c2I6IGR3YzMtYW02
MjogZml4IG1vZHVsZSB1bmxvYWQvcmVsb2FkIGJlaGF2aW9yIikNCj4gQXNzaXN0ZWQtYnk6IE9w
ZW5BSTpHUFQtNS42DQo+IENvLWRldmVsb3BlZC1ieTogSWphZSBLaW0gPGFlODc4MDAwQGdtYWls
LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSWphZSBLaW0gPGFlODc4MDAwQGdtYWlsLmNvbT4NCj4g
U2lnbmVkLW9mZi1ieTogTXllb25naHVuIFBhayA8bWh1bjUxMkBnbWFpbC5jb20+DQo+IC0tLQ0K
PiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLWFtNjIuYyB8IDQgKysrLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdXNiL2R3YzMvZHdjMy1hbTYyLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtYW02Mi5j
DQo+IGluZGV4IDYzMjYzNGQ2ZS4uMmZiOWUwODhmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3Vz
Yi9kd2MzL2R3YzMtYW02Mi5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1hbTYyLmMN
Cj4gQEAgLTMxOSw5ICszMTksMTEgQEAgc3RhdGljIHZvaWQgZHdjM190aV9yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlyZWcgJj0gflVTQlNTX01PREVfVkFMSUQ7DQo+
ICAJZHdjM190aV93cml0ZWwoYW02MiwgVVNCU1NfTU9ERV9DT05UUk9MLCByZWcpOw0KPiAgDQo+
IC0JcG1fcnVudGltZV9wdXRfc3luYyhkZXYpOw0KPiArCXBtX3J1bnRpbWVfcHV0X25vaWRsZShk
ZXYpOw0KPiAgCXBtX3J1bnRpbWVfZGlzYWJsZShkZXYpOw0KPiAgCXBtX3J1bnRpbWVfZG9udF91
c2VfYXV0b3N1c3BlbmQoZGV2KTsNCj4gKwlpZiAoIXBtX3J1bnRpbWVfc3RhdHVzX3N1c3BlbmRl
ZChkZXYpKQ0KPiArCQljbGtfZGlzYWJsZV91bnByZXBhcmUoYW02Mi0+dXNiMl9yZWZjbGspOw0K
PiAgCXBtX3J1bnRpbWVfc2V0X3N1c3BlbmRlZChkZXYpOw0KPiAgfQ0KPiAgDQo+IC0tIA0KPiAy
LjQ3LjENCj4gDQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5
cy5jb20+DQoNClBsZWFzZSBhbHNvIGFkZCBDYyBzdGFibGUuDQoNClRoYW5rcywNClRoaW5o
