Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE8533F383;
	Tue,  1 Sep 2026 01:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226618; cv=fail; b=LRbOTHI0zenG6I2x6OdZUjM/c6ZwtsnnSPOl+Xnx+rVNQ9tSMHDBwVkSHqh+3HnwoYgEOO3ckSADOamQFPuo2FclKDgHYhXiNB+jA3MnjTJl72DKtpjhOErWWAKYTouoU42MvrfDjM88JixjbmtTiNFMB0XC7Hfe/HFYtF/1igs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226618; c=relaxed/simple;
	bh=2sOFKjWKt6076Z9D1HiZtwaPqE4kApiQ5f+a1xV9Qak=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ORYi7GmaEFW+KqkD9AS/Bk8+xscJrRYDQ3syoR/a6366zknQEKom+WsMOtCogwLQTlRXJGNMZ1ovEfF20EAXqdJwAhrO1U0vsQi2OhzSuvF58Mm/z5K4KjSvCYDNnj1v64x2J8z02W6DDOB1g1ba1Xp/nSLtC+rnsMlV5TyrjSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kEiBVgoO; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dqNMD2zm; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QyM5HSfl reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kEiBVgoO";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dqNMD2zm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QyM5HSfl"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810pS9n690170;
	Mon, 31 Aug 2026 18:36:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=2sOFKjWKt6076Z9D1HiZtwaPqE4kApiQ5f+a1xV9Qak=; b=
	kEiBVgoOh8bOK2QU0gL33TkkjEnXDG7RGjx6cbpkm4x98QrX2aubfSmqf4HQ1Hyr
	3n34JhdC7V5n3ZL89Q0wg3IlHLa0JMM5f01S7h4Egzj6ckxlhcf8Zd0ZAgXTvUIU
	2bLZLAj36uvogHetfPN5ZoIySlZX0LZlaZdSNEBQ6nXhxZWaYaSiB4M6iGJ3VA0t
	iGbm5JwB0NamvfLuWT3AJfJ2OAn8EtGmJ+fXJYsegqb2zZoLACeGOQGJyaeVINcf
	qP0De4SNEdOiRTDWSiJpgOIxGOzl8XMns01oFBDYcvA1Zv8K8qi7I5YefufkHgYQ
	El/seqO760J1Isv1xWzh+Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4gd1vk7vnk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 18:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1788226607; bh=2sOFKjWKt6076Z9D1HiZtwaPqE4kApiQ5f+a1xV9Qak=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=dqNMD2zm0XeyKzV+ALtFqVXL+p0w9zdbCwYc966f2TRdxXw6ZtUZ98VTBZC0Hfj9y
	 CCuCfZEo5W/vwKXXQRW7aM/SPZjimxwSgLLuRNDylI1j9cqtm68piggLlEcqsoH+3m
	 Fi2RXgZS+44BthDWiqCg47TlYb/suZNm51+Ir/15mAVKqWuOcW+phgnceyHbTscM3L
	 /w30XKicZ0d28vy84B4zMB0WlcbsNYu2MbbFEoOTyeX+2RHX62b2i5reGek9DHs8UJ
	 IWN+/PPKBh+KEuwc4Ahlmh1+JKZwMrbVAXBGXgkOq3/DMK+Y2+63QKGFjYXD8QdA7a
	 Wka2lRNNtpk+A==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9D0DE40124;
	Tue,  1 Sep 2026 01:36:47 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E2FB8A03AC;
	Tue,  1 Sep 2026 01:36:46 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=QyM5HSfl;
	dkim-atps=neutral
Received: from DM2PR04CU003.outbound.protection.outlook.com (mail-dm2pr04cu00303.outbound.protection.outlook.com [40.93.13.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id D7F1040183;
	Tue,  1 Sep 2026 01:36:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=km+aSBB9o0757X9+979ndX/C6q1OsuAv10frjWFM3kIWwdGqoLR8y1iQYYXvJ9pcEoD4eXW0E3IEeOcdlISOci+x2lDzOhE47+/7ToVRJ2lmg3w5f4wPx9hcyqPKtlKtIUvAK930arGFev8WPT8qUB7U9LQNJtPJ0lu84Kru0dzq2Kikv/B9QkZMDmLnxofF8nKqm9UeDyLkiwnWqW5yGth+56YIQ9xX8UwFl/be+CLODGDqXXkgC9BKyC50GTIdFaUYRkuXRvFsQ0Oa9/uy2wipROEYElxwyad8VZm7Ngn6J91m/dREyEKKCX6VZ4K9UdFID/I/BDdF0l15u2ao5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sOFKjWKt6076Z9D1HiZtwaPqE4kApiQ5f+a1xV9Qak=;
 b=oxPm/mPq+w5z+31FTM5HGm15ivsuYHBTSxqgZFn53uCuNk2s4xDaOF91GLUeudU5Bqh1N38EgpKGbUDr4W1q2Z1Geh6JUh6LsGKyzGqODFO+e7T/MIWi2OmmGwfjvWRKVBfBrp5eUoTJ6JSeniUkV9YHNz7bu3k8LJ11gTA1KvG2ocWLSwdpYkS4CsggOsb6QDFxV6urc5/ZwaxG7C8wKEcmjBMaF/gLL38l8Um0q4tKaUq53kl4RIhl0rU7PK87Fmyg0CGXLY3s4wBsmuRwZBHF8gCM3zZdOW4ND79nUn+wkOe5L58TgpcfcoUpQYJkmJFXAk1bg+/pb3bcnVk98g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sOFKjWKt6076Z9D1HiZtwaPqE4kApiQ5f+a1xV9Qak=;
 b=QyM5HSflGccmAAYcz78R8sbjy8HC/ueShlD9uoQKu4HThB+d+1Uu185UKx3jZtJKE2o2MiWiEex1SaHPuoavt1BtRV1nScULy0oa2q6oVpmbtt5iGcmQVr+AtsmLnXcddWewZZbSmKvTLXH68ylZP7Ed2GZDcrI8TFg/Z/k44Z4=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by CY8PR12MB7513.namprd12.prod.outlook.com (2603:10b6:930:91::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 01:36:38 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 01:36:38 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Junzhong Pan <panjunzhong@linux.spacemit.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "troy.mitchell@linux.spacemit.com" <troy.mitchell@linux.spacemit.com>,
        "peixin.xie@linux.spacemit.com" <peixin.xie@linux.spacemit.com>
Subject: Re: [RFC PATCH] usb: dwc3: core: resume xHCI child on runtime resume
 in host mode
Thread-Topic: [RFC PATCH] usb: dwc3: core: resume xHCI child on runtime resume
 in host mode
Thread-Index: AQHdKXED67eHC94XdU+mjRf+FXKei7axP8uAgACA2YCAAOftgIACN7CAgAQxfoA=
Date: Tue, 1 Sep 2026 01:36:38 +0000
Message-ID: <apYnwImOJzDlir8x@vbox>
References: <20260811090817.109350-1-panjunzhong@linux.spacemit.com>
 <ao-QDVibwU90yPm_@vbox>
 <8F4C0C8A8DA2D71A+7c57de3c-1f36-4e5b-b5e3-0eeb6ca88006@linux.spacemit.com>
 <apDJbcrAgzcFRLZM@vbox>
 <4028ADCCD8D1A8F8+ffb2a2cd-1c21-401e-baeb-3d042fbbe484@linux.spacemit.com>
In-Reply-To:
 <4028ADCCD8D1A8F8+ffb2a2cd-1c21-401e-baeb-3d042fbbe484@linux.spacemit.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|CY8PR12MB7513:EE_
x-ms-office365-filtering-correlation-id: 5aa53937-9315-4c24-1c58-08df07c97791
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|5023799004|11063799006|56012099006|6133799003|4143699003|3023799007|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 6zeAqOQGP67ntyVFG8b2jLDh3lNYIj0brwKVueQ+/bYJH8IpgoPghnq5+Ly0vBdyP3NYanz/e5BYM5srxGOfoSrKJ30+qCDmNFB7lYNFnwPc4pPG6NckJzwn6BFNxJos3ofmEP5Ays0gYuf7ShtLqOcFkbRwxn9yc1g05dh03x71Ah8OGeqv8txfOTsu06X1P6n1qSrb7Mg84vtAT992sefQWBWVQWBi7XmIJVRKz3nvz1/i2hiLdQLRa0rIm9t+Imj/6IRB8voTNfXHQvrc8qmGZQR1MDxsXskX8yDnPFGIVw3yatNP1gyxIT+eNRaP/CNIf9nyUJjxNlNd18N0SBwqG6Et2hdPTJUwqT0kRO/XJ8ZQr7Tdq++B0s9lGNmb5EfLNcaiTxhVMM97n9Fkc6bbAHAHoSmlGzx5zSVEwNkAkU++5glUvw/Kb8ct3Zhe8irh4m5Fo2bv7Kux47rE0HPPtmtKcTR4G1BZTJg50qRiPQcagq0OlNiJZy1XTlWNR8mHNpOIycryJgMiUIHM2vfOhtJZqj7kFOYVlyYyR9yOekSlr3zu70mtDCvysDqiflEau4a3OZi/uNBV5e3mCyzxKC1DjtjE5MyAJY/WBUutrCvGL18u+E4jow5lgmBGiRVB30K34Mk1A8RCmjQQXZKwMVtBFK0IkU7zjV8KxlTq5MNSn6LpTXFP8N5ZqF9ccMUZ85wmuB7YA5UcIwsf1E2w53/KKcY5efSku179FFk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(5023799004)(11063799006)(56012099006)(6133799003)(4143699003)(3023799007)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S202eXZQRDRsazhhVW5naVdOUGFZUXBSTU84THN5R2cvbWJyMmMvekRSeUti?=
 =?utf-8?B?T2hhRmN5d1VpK1JPNDcyVzRyd1d6eTFSRVE4M2k2djhLcENDd2tXamtJc29j?=
 =?utf-8?B?eGNIZHBCczIzMFd3WVJUa3d5L2RTNjNHYnE0QUpKaUpYYXZIdVFzVHlHcFdv?=
 =?utf-8?B?MlVxV0IramVvM0JyamhzY1Q0OXdlSWp4MDA4S2NpV0FVOVZPV0Vsc3l1VS9J?=
 =?utf-8?B?M3FPVmRWUlNmenRpWWUva1dnbDBkQUt2WXg4ODI0YXVhaDJPMmxSYTYxQWI5?=
 =?utf-8?B?RWxycHZkbFE0NzRWUFo5TU1SazJ4T0FWcE1CMEJMSE5iYys3YitiZFB4cFd3?=
 =?utf-8?B?UFNkQWQwZkF0M1czVDAwZzE5eDBHVlkyRGxGUzBjaHYrcWorQ29hMFUyZEI4?=
 =?utf-8?B?RGN5M3NRaUxIbzluM2FOVVlDb3JOM3JoSks3VTN2OGJYazBjN1dwRXZNWHhz?=
 =?utf-8?B?aTY5d1FrVmlzRXBiZFJta2p1WXdhZU9ZajI0RVVjek8rZVBvVkFzcmhoeDEv?=
 =?utf-8?B?aHA3MzN4cmlNRkVJS1lGMTRYWGgycU9aaHd1M202ZUp0SEwzY2ZnT0pENlps?=
 =?utf-8?B?SHpqMEplL2VqVzhPcWNSWHpyWS9JR0xENzFud3JhOEo2bzFnYVBlWTlTeSs2?=
 =?utf-8?B?c05YOUo1dTR5Z01ITm52Vm5TY1N0bkZYSkVOc3NDSTJvZFhhMnBVY2ZRT3dE?=
 =?utf-8?B?OVdwcEVCR014WkVBWGtXeERoUExncEFzcnUzNUNydFVsUFFacTVEcEZ3MzV1?=
 =?utf-8?B?dWJ4cTduRjk0T0ZaQVYzN0IwOHdiSHB6S2YwQmYvdHZGQ2JzN0kzVk5TS0tU?=
 =?utf-8?B?c0sxVVM2UC9oNFJhS2JzNVAwU2VCT011TDEyZkZRSnNpU1Rib0V3ZzgrQkJw?=
 =?utf-8?B?ajdDd3BsNjk5Z1FDc0IwZng2eERkZWdjS1NpUVFpczRBektpSHAyYUkrZ0N1?=
 =?utf-8?B?bTVFQkFTQ0ZvKzh4Vk9OOGFpV21vQ0c4N3FGNVNVY0tyMW9vT0lBeHpHRzVu?=
 =?utf-8?B?WFExb0E4b1ZEUXN0RWdnRWo2ZlpjVmkwZ1hVeVg5czBnT2tGeDl4N1VVQitX?=
 =?utf-8?B?RUd1ZDB6a0ExOGVTNDV6RVBDaU5NQU10bUNqdDd2QmhaVFZHc2NvUUpMRzho?=
 =?utf-8?B?NngvUHhaUEJ0Y3dPTHJNTHdtWWF6UW9zZzY4UjJHVHFueGk4Tzh2UXlEMnYw?=
 =?utf-8?B?M2NEdS8wdkE5YjNhbXNhVGRWY25ETWxuN1NLM3AvVVBHWld4b1N6SVUvSGwv?=
 =?utf-8?B?OTZQRFR3SEdPODhrQnpNMlFaaVJ3cm1QeWZ3NXV4NUFpT014M2xBaWt4ckZC?=
 =?utf-8?B?OFFNN0wreHVwMnIzdDR0aEpzUzFhcjdUMXJsYkQ0eHBtZGRPQnNuaUJ5Mi9h?=
 =?utf-8?B?QkRoenJjb0QwdkF1ZSsxelpHWGFMOWlDdm1vVWZRS3gzcTk0aDlnZU5xNFNp?=
 =?utf-8?B?bDQ3VU1QT2F2Y05UdlZ5SnJ3ckR0OEhwUDN4TmNlWUpWaTRLSVB4NFNsdk9x?=
 =?utf-8?B?Ym9kZGVUSVVmYTJVOCsydnlZZkZtOURnaXJrcWQ4NGVheDFla2g3dG9kd3N4?=
 =?utf-8?B?YXB3WlEwWCt5dW84ZG9zcEFGRkl5dkE4SGxMSzc5Yzk3M1poSFFPcjY2OVBo?=
 =?utf-8?B?SGpoazNGR2RLaEcvaUtFMWZJaC9YblFpZmVmUUZETjErcytQaUtBMmZOWVFD?=
 =?utf-8?B?SGtpb3dOdnNOZmMwcE9YV3IzNlZiRy8rN0t3UXI4azFMcWdleERJb0FHQXc3?=
 =?utf-8?B?aktGZDNCcDZNWXhLMmRra3NPdzloaUlIY0hVWG1NekZQSXh5NnFpQ2tXOGdt?=
 =?utf-8?B?aG4rai92L0Z3SW5oUjlEb3RpYllxMmlsYVZjUGMrbUpNQXhBRk56dkVMbStp?=
 =?utf-8?B?V1hFYkFiZzlDdEpYY2VYOGo1Q3ZSNGdwWE1idDlDK1B2eWxWQVA0a2ErZkNU?=
 =?utf-8?B?eHdqY2ZBRVEwaHJrcW1BRk9VRlNlYzFYOEljNU00UkVnQ3Y3K1FuK1NFY2tS?=
 =?utf-8?B?YzRNd01kSUV5QTZvemVLUjJ0ZlJRd1RXUnFJMlE0endYN1kwdy9BcTZySTZZ?=
 =?utf-8?B?aU0xdHBPUGtOVkc3c0t0ZzhXRHQ2SG5wZHlmejBNTjF5VEhKZGlDMFUzQTRO?=
 =?utf-8?B?MDMwWWxxMlBWNUYxeTZLN0xxRWtSczNQM0N0OENydWowakN3SFJWa2xOakxh?=
 =?utf-8?B?Sjg1dGJjdEFsa2hrQnRtbjFKZzhzTXNyZVBIUjgrZnFOTzF2c01iL2JMY1RR?=
 =?utf-8?B?dm9jRmZnbjNUdVpmMFQwQVhmeUdrT3BkVGh5QTlaT0Jla0V1V2svYnZEVWl6?=
 =?utf-8?B?V1p3UVFObXFDRjlDSlBUNk1vU3BYQ2xCUngzVS90WnAzNStORm4yQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB2601214A45E94086905F2A6A87925E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	CZJm92F9WcD6YokMHfBHj0CDAUkZ8rJ4ou5ayHPyxDiF9g5JOnhKTzI73WlAiMi5vBC+LEF2AjZkI118Oklc+uhwnsVPrcJaue6ik+K4UyJrXDaBKUxcRUwrxaZBZ1FcscAgtynpxcpNMM9onumIHMRLve7SL+jYvzyAzXm/Fno8g6h8M0ZT0uadadrp8aiiHlo8aLwgwZZBgVgK5Bzc7qGwk2575QzSLhEqNVVWeBRsWJ4ot6QgmqJc9mUr6NbZkrj+9g35Q/imP76y0M8Yxv5TxQeQPTDvKvvVo/zm25GNZ8Pbv5WrusiItu//onO3/FTI5u51qKJlsvBxnKr5gQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Sqw4kB8HlKicJoJMuMJq8IDZIiZ/BTQPmqNcs1q8RLfmTxjinr1d5sf+WrGR+lwrB9pbMJwsiG+ldKx9GlymKBsMQ4GskfK7UOufUrSzCHDdk2miwKBx7k4K9DMDHq3VVVBWkhPobPGNaqk3NDsjEe+Y8Cus7u1N1bKzN/hvuo0i1MT3+CU1fxvBIOX3jZUFr0OGrf3L2HR9lJEQ3Ub8+zyIG6fWxfiojTtphZPnNHhgx+KD68mh3OOsKbH5YdLkbN4F/Tb/fOLdsaAE1g669rr8dxw8XJtuMueu1olqQTf0FuRK42UfXK56ssfIINVsMfJrcdvaxSaI4XmLf2KKbXQF9zTZOUZEGqT8K0SiQKh7MuPHC7fBfptUNeMdXEej//q8YglmGVV70edKyl4DJarQChsIMJt8gIXK0nmi+fiW4hIpXf9J3XFd0uXMakrJjdiwzSd5dHBvUgMRePY98imhdKecpiOZDGmigJDRVHa5TvoKn6KOcTaZLfDBKuIJ1r7kw4t1i5JwG4FmtrveQdME1ez1StMg0CwmCPv3+p8TmWkhA0a/SNNaHt9x2EymvbrqXB1K+e8Iyp3wjvfp06qHVa7wVdWGtqgWHkRfOMitqzzwj4q6AZ1NDKgiVR/RqYg4j1QlyGPjTghXQ3CM6A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa53937-9315-4c24-1c58-08df07c97791
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 01:36:38.4970
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jcc39WlglelLB4d9BLSLFAact1A2d4uiDBgALNSnLp3aGkIznnFN1KVdIhM1pLWKYpSfRoHYB3ve85+8JaRS8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7513
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAxMSBTYWx0ZWRfX6YQlqx6fpcvm
 8Yey+mPsf7jxr03b6IpJKctEgOHKdctRLKhFqj0m0WXWZJznkiOPCV3BkRy0pt4BDbM0/ucf2oh
 asxYGZhyLN2tGGt9uWGwo/SWvrwMTVjw4PtWP/PxzxA0B1aZOmNP39oZt2pXRbOXUIFPftv6mBx
 D69Izxa2y9YbuRrwldL4n4v58P/6FyxwpkXPaNzHANjTOBxrig60sAPGHn4D5XLgoBidI5Vaery
 UAVD8MMQBIXpdqOZ+OvQLuefji+OLhBIVJXOJO6JKxZ9aPxxuGQIoovw65MCut1R1JlC6WI2sa9
 c6cnX/zoHE/SAttHjvhB7vhjgnOk3kfzZWu3AfxZBc0tBs9vNI36qjMdBfmW2zqxVtnN1wtDXsw
 Ql9U5vEvZ8aXzGFV8RQxhTGT249NvPYQGRr9EBmsFpDDs04YNu5WfWOnUuXRA0lkDyyNKKIzdxn
 efocLqS1UaG3h3vagAw==
X-Proofpoint-GUID: LkdBf5eGJdumGo_g5PddmqilcSI2w3wd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAxMSBTYWx0ZWRfX8kWYlR2lFkaS
 npB1dBq8dLsOe3Q35UXp6Eb2XV15MMRY7tgcDTD2gutXzMgzApSyT8H+CPd6wgwwFzHDGGDvW/K
 /FaPObl8MglU27Zw8ZV+Jj+VUrB14SQ=
X-Authority-Analysis: v=2.4 cv=SNtykuvH c=1 sm=1 tr=0 ts=6a962c30 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=lv0vYI88AAAA:8 a=FG1IYMpfALns9RsvTwEA:9 a=QEXdDO2ut3YA:10
 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-ORIG-GUID: LkdBf5eGJdumGo_g5PddmqilcSI2w3wd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 impostorscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609010011

T24gU2F0LCBBdWcgMjksIDIwMjYsIEp1bnpob25nIFBhbiB3cm90ZToNCj4gSGkgVGhpbmgsDQo+
IA0KPiBPbiA4LzI4LzIwMjYgNzo0MiBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIFRo
dSwgQXVnIDI3LCAyMDI2LCBKdW56aG9uZyBQYW4gd3JvdGU6DQo+ID4+DQo+ID4+IE9uIDgvMjcv
MjAyNiAxMDoxMSBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+Pj4gSGksDQo+ID4+Pg0KPiA+
Pj4gT24gVHVlLCBBdWcgMTEsIDIwMjYsIEp1bnpob25nIFBhbiB3cm90ZToNCj4gPj4+PiBVU0Ig
Y29udHJvbGxlciBydW50aW1lIHN1c3BlbmQgaGFsdHMgdGhlIGNvbnRyb2xsZXIgb24gZGlzY29u
bmVjdGlvbi4NCj4gPj4+PiBJdCByZWxpZXMgb24gcGxhdGZvcm1zIHdpdGggY3VzdG9tIGNvbm5l
Y3Rpb24gbm90aWZpY2F0aW9uIHRvIHN0YXJ0DQo+ID4+Pj4gdGhlIGNvbnRyb2xsZXIgYWdhaW4u
DQo+ID4+Pj4NCj4gPj4+PiBUaGUgaG9zdCBicmFuY2ggb2YgZHdjM19ydW50aW1lX3Jlc3VtZSgp
IGRvZXMgbm90aGluZyBjdXJyZW50bHkuIFRoZXJlDQo+ID4+Pj4gYXJlIHR3byBwYXRocyB0aGF0
IGNhbiB0cmlnZ2VyIGEgcnVudGltZSByZXN1bWUgb2YgdGhlIGR3YzMgY29yZSBpbg0KPiA+Pj4+
IGhvc3QgbW9kZToNCj4gPj4+Pg0KPiA+Pj4+IChhKSBXYWtlIGxhbmRzIG9uIHRoZSB4SENJIGNo
aWxkIChEVCBwbGF0Zm9ybXMsIGUuZy4gUXVhbGNvbW0sIGkuTVg4TVApDQo+ID4+Pj4gICAgIEEg
cGxhdGZvcm0gd2FrZXVwIElSUSBmaXJlcyBhbmQgdGhlIGdsdWUgaGFuZGxlciBjYWxscw0KPiA+
Pj4+ICAgICBwbV9ydW50aW1lX3Jlc3VtZSgmeGhjaS0+ZGV2KS4gUnVudGltZSBQTSB3YWxrcyB1
cHdhcmQsIHJlc3VtZXMNCj4gPj4+PiAgICAgdGhlIGR3YzMgcGFyZW50IGZpcnN0LCB0aGVuIHJl
c3VtZXMgeEhDSS4gQm90aCB3YWtlIGNvcnJlY3RseS4NCj4gPj4+Pg0KPiA+Pj4+IChiKSBXYWtl
IGxhbmRzIG9uIHRoZSBkd2MzIHBhcmVudCAoQUNQSSBwbGF0Zm9ybXMpDQo+ID4+Pj4gICAgIFdo
ZW4gYW4gQUNQSSBOb3RpZnkoQUNQSV9OT1RJRllfREVWSUNFX1dBS0UpIHRhcmdldHMgdGhlIGR3
YzMNCj4gPj4+PiAgICAgcGFyZW50IGRldmljZSAtLSBmb3IgZXhhbXBsZSB2aWEgYSBHZW5lcmlj
IEV2ZW50IERldmljZSBvbiBhDQo+ID4+Pj4gICAgIGhhcmR3YXJlLXJlZHVjZWQgcGxhdGZvcm0g
d2hlcmUgZHdjMyBpcyBlbnVtZXJhdGVkIGFzIGFuIEFDUEkNCj4gPj4+PiAgICAgZGV2aWNlIHdp
dGhvdXQgYSBnbHVlIGRyaXZlciAtLSB0aGUgQUNQSSBjb3JlIHR1cm5zIHRoaXMgaW50bw0KPiA+
Pj4+ICAgICBwbV9yZXF1ZXN0X3Jlc3VtZShkd2MzX2RldikuIFJ1bnRpbWUgUE0gZG9lcyBub3Qg
cHJvcGFnYXRlIHJlc3VtZQ0KPiA+Pj4+ICAgICBkb3dud2FyZCwgc28gdGhlIHhIQ0kgY2hpbGQg
c3RheXMgc3VzcGVuZGVkLiBSb290IGh1YiBwb2xsaW5nIGlzDQo+ID4+Pj4gICAgIG5ldmVyIHJl
LWFybWVkLCBhbmQgYSBkZXZpY2UgcGx1Z2dlZCBpbiB3aGlsZSBzdXNwZW5kZWQgaXMgc2lsZW50
bHkNCj4gPj4+PiAgICAgZHJvcHBlZC4NCj4gPj4+DQo+ID4+PiBHb29kIGNhdGNoLg0KPiA+Pj4N
Cj4gPj4+Pg0KPiA+Pj4+IFRoaXMgcGF0Y2ggZmlsbHMgaW4gdGhlIGhvc3QgYnJhbmNoIHRvIGNv
dmVyIGNhc2UgKGIpIGJ5IHJlcXVlc3RpbmcgYW4NCj4gPj4+PiBhc3luYyByZXN1bWUgb2YgdGhl
IHhIQ0kgY2hpbGQgc28geGhjaV9yZXN1bWUoKSBjYW4gcmVzdG9yZSB0aGUgcG9ydA0KPiA+Pj4+
IHN0YXRlIG1hY2hpbmUgYW5kIHJlLWFybSByb290IGh1YiBwb2xsaW5nLiBBc3luYyBpcyByZXF1
aXJlZCB0byBhdm9pZA0KPiA+Pj4+IGRlYWRsb2NraW5nIG9uIHRoZSBwYXJlbnQncyBvd24gcnBt
X3Jlc3VtZSgpIHJlLWVudHJ5Lg0KPiA+Pj4+DQo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogSnVuemhv
bmcgUGFuIDxwYW5qdW56aG9uZ0BsaW51eC5zcGFjZW1pdC5jb20+DQo+ID4+Pj4gLS0tDQo+ID4+
Pj4gYmFzZS1jb21taXQ6IGQ1ODc3MmQ4NTIwYzdlZjI0N2M0Yjk1YzliZDc2ZDNhMjVkYTlmZjUN
Cj4gPj4+PiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgfCAxMiArKysrKysrKysrKysNCj4gPj4+
PiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykNCj4gPj4+Pg0KPiA+Pj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5j
DQo+ID4+Pj4gaW5kZXggY2ViNDlmMmY4MDA0Li5iY2U1Njc2NWFkOTAgMTAwNjQ0DQo+ID4+Pj4g
LS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gPj4+PiArKysgYi9kcml2ZXJzL3VzYi9k
d2MzL2NvcmUuYw0KPiA+Pj4+IEBAIC0yNjY4LDYgKzI2NjgsMTggQEAgaW50IGR3YzNfcnVudGlt
ZV9yZXN1bWUoc3RydWN0IGR3YzMgKmR3YykNCj4gPj4+PiAgCQl9DQo+ID4+Pj4gIAkJYnJlYWs7
DQo+ID4+Pj4gIAljYXNlIERXQzNfR0NUTF9QUlRDQVBfSE9TVDoNCj4gPj4+PiArCQkvKg0KPiA+
Pj4+ICsJCSAqIE9ubHkgdGhlIHhIQ0kgY2hpbGQncyByZXN1bWUgcmUtYXJtcyByb290IGh1YiBw
b2xsaW5nLCB3aGljaA0KPiA+Pj4+ICsJCSAqIGlzIHdoYXQgcmVkaXNjb3ZlcnMgYSBkZXZpY2Ug
cGx1Z2dlZCBpbiB3aGlsZSBzdXNwZW5kZWQuDQo+ID4+Pj4gKwkJICogUnVudGltZSBQTSBuZXZl
ciByZXN1bWVzIGNoaWxkcmVuIG9uIGl0cyBvd24sIHNvIHJlcXVlc3QgaXQNCj4gPj4+PiArCQkg
KiBoZXJlLiBUaGlzIGhhcyB0byBiZSBhc3luY2hyb25vdXM6IHJlc3VtaW5nIHRoZSBjaGlsZA0K
PiA+Pj4+ICsJCSAqIHN5bmNocm9ub3VzbHkgd291bGQgZGVhZGxvY2sgYmVjYXVzZSBycG1fcmVz
dW1lKCkgdHJpZXMgdG8NCj4gPj4+PiArCQkgKiByZXN1bWUgdGhlIHBhcmVudCBiZWZvcmUgdGhl
IGNoaWxkLCBhbmQgaGVyZSB0aGUgcGFyZW50J3MNCj4gPj4+PiArCQkgKiBvd24gY2FsbGJhY2sg
aGFzIG5vdCByZXR1cm5lZCB5ZXQuDQo+ID4+Pj4gKwkJICovDQo+ID4+Pg0KPiA+Pj4gVGhpcyBu
b3RlIHNvdW5kcyBhcyBpZiB0aGlzIGlzIG5lZWRlZCB0byBhbGwgY2FzZXMsIGJ1dCB5b3UncmUg
b25seQ0KPiA+Pj4gZGVzY3JpYmluZyBvbmx5IGNhc2UgYikgaGVyZS4gQ2FuIHlvdSBhbHNvIG1l
bnRpb24gZm9yIGNhc2UgYSkgdGhhdA0KPiA+Pj4gdGhlcmUgbWF5YmUgYW4gZXh0cmEgcmVzdW1l
IHdvcmsgY2FsbC4NCj4gPj4NCj4gPj4gV2lsbCBkby4NCj4gPj4NCj4gPj4+DQo+ID4+PiBXb3Vs
ZCBiZSBuaWNlIGZvciBpdCB0byBiZSBjbGVhbmVyIHdpdGhvdXQgdGhlIGV4dHJhIGNhbGwsIGJ1
dCBJIHRoaW5rDQo+ID4+PiBpdCBzaG91bGQgYmUgZmluZS4NCj4gPj4NCj4gPj4gSSBndWVzcyB3
ZSBjb3VsZCBkbyB0aGlzOiBhZnRlciB0aGlzIG1lcmdlZCwgd2UgcGF0Y2ggdGhvc2UgcGxhdGZv
cm0NCj4gPj4gZHJpdmVycyhjYXNlIGEpIHRvIGRyb3AgdGhlaXIgZXhpc3Rpbmcgd29ya2Fyb3Vu
ZCBoYWNrLCBkd2MzIHdpbGwNCj4gPj4gdGFrZSBvdmVyIGl0J3MgY2hpbGQgeGhjaSBpbiB0aGlz
IHdha2V1cCByZXN1bWUgcGF0aCwgdGhleSBqdXN0IHdha2UNCj4gPj4gZHdjMy4gVGhhdCBtYWtl
cyB0aGluZ3MgY29uc2lzdGVudC4gV2hhdCBkbyB5b3UgdGhpbms/DQo+ID4+DQo+ID4gDQo+ID4g
VGhhdCB3b3VsZCBuZWVkIHRvIGJlIHZhbGlkYXRlZCBvbiBhIGNhc2UtYnktY2FzZSBiYXNpcy4g
QWxzbywgcmVnYXJkaW5nDQo+ID4gdGVzdGluZywgSSBhc3N1bWUgdGhpcyBjaGFuZ2UgaGFzIGJl
ZW4gdGVzdGVkIG9uIHJlYWwgaGFyZHdhcmUuIElmIHNvLA0KPiA+IHdoaWNoIHBsYXRmb3JtKHMp
IHdlcmUgdGVzdGVkPw0KPiANCj4gWWVzLCBJIGhhdmUgdGVzdGVkIG9uIFNwYWNlbWlUIEszIFBp
Y2/igJFJVFggLCBBQ1BJIGJvb3Qgd2l0aCBhIEdFRA0KPiBEZXZpY2UgdG8gTm9maXR5IGR3YzMg
bm9kZe+8iEhJRCA4MDg2MjJCN++8iW9mIHdha2V1cCwgYW5kIGFsc28gRFQgYm9vdA0KPiBjYXNl
cy4NCj4gDQo+IEFzIGZvciB0aGUgRFQgYm9vdCh1c2luZyBtb2RpZmllZCBkd2MzLWdlbmVyaWMt
cGxhdCBkcml2ZXIpLCBJIHZlcmlmaWVkDQo+IHRoZSBleHRyYSBjYWxsIGlzIGhhbmRsZWQgd2Vs
bCBieSBwbSBmcmFtZXdvcmsgY2hlY2tpbmcgUlBNX0FDVElWRS4gSQ0KPiB3aWxsIG1lbnRpb24g
dGhpcyBvbiBuZXh0IHNlbmQuDQoNClRoYW5rcyBmb3IgdGhlIGluZm8uIFBsZWFzZSBtZW50aW9u
IHRoaXMgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHNvIHdlIGNhbg0KcmVmZXJlbmNlIHRoZSByZWFs
IHBsYXRmb3JtL3VzZXIgc2hvdWxkIHdlIG5lZWQgdG8gcmV2aWV3IHRoaXMgaW4gdGhlDQpmdXR1
cmUuDQoNCj4gDQo+IEkgaGF2ZSBhbHNvIHRlc3RlZCB0aGUgZXh0cmEgY2FsbCByZW1vdmVkIGNh
c2UgYnkgdXNpbmcgYSBzaW1pbGFyIGNvZGUNCj4gb2YgcWNvbS9pbXg4bXAsIGJ1dCBqdXN0IHJl
cGxhY2UgdGhlIHhoY2ktPmRldiB3aXRoIGR3Yy0+ZGV2LCBpdCB3b3Jrcw0KPiBmaW5kLiBCdXQg
aWYgbmVlZCB0byBzZW5kIHRob3NlIHBhdGNoZXMsIHRlc3RpbmcgZm9yIHJlZ3Jlc3Npb24gaGVs
cHMNCj4gYXJlIHN0aWxsIG5lZWRlZCBmcm9tIHdobyBoYXZlIHRoZXNlIHR3byBwbGF0Zm9ybXMg
YXZhaWxhYmxlIEkgdGhpbms/DQo+IA0KDQpUaGF0J3MgZ3JlYXQhIFRob3NlIHBhdGNoZXMgY2Fu
IGJlIHN1Ym1pdHRlZCBhZnRlciB0aGlzIG9uZSBpcyBtZXJnZWQuDQpXZSBjYW4gZ2F0aGVyIG1v
cmUgZmVlZGJhY2sgZnJvbSBvdGhlciB1c2VycyBvbiB0aG9zZSBwbGF0Zm9ybXMuDQoNCkJSLA0K
VGhpbmg=
