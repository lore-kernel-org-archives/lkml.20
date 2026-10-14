Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1D93385B9;
	Wed, 14 Oct 2026 01:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791942313; cv=fail; b=r0gnE5ZbGgoDucK/g42LRogjRzfDbH48z1PiGDJRRjrM3VDFG5gNeoAG/u2GcgmLkxnrGytw1V3NO3KT14ahnj64Pm1M5PCADC37gOyiOUZ/pcFsNLX7zmM2Etzl+1kK7fXD6HpFKXeCInDZtHfB6FAkDJHymiBVoBh6lyb3j3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791942313; c=relaxed/simple;
	bh=QuhzO0USaTv47e+3+isyFe+nGAUOASSxn5rkckmvvWg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t/Ipf7nDjCVKP5pkdObr8RosB8IHOtzCrP/6RmkTSmJbl3hkOnjLbh+EgxiDikA1obJUkDTJn7f2gH9cDbfIiSj2IT6MY9TapJRo+pv+pYAqjRQACBxoLPY71YMU6FmKiVnh3ratNYNRiA2e0Ig6xkAeUTirChs0owkMyRGEsSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=gaDJhSNu; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Gqk6Lmtw; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=wKAvWfJH reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gaDJhSNu";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Gqk6Lmtw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="wKAvWfJH"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DLnuPD1470113;
	Tue, 13 Oct 2026 18:45:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=QuhzO0USaTv47e+3+isyFe+nGAUOASSxn5rkckmvvWg=; b=
	gaDJhSNutYnBaYHXWxU5CTCSjZ6c5lEu73lk8NeWitHfcPssREbYp5iJ04O9k6Du
	3AMBe45/yUpnBN2dAD1XJe203ofQfyNiRKIew23A3UsyIGb8keLD1GeuST3DeF2I
	79mQoR1AP2CNtBhOdOoguJbBd4rXBw4QNIRNsJdErvQKfoLJWZPfuRg90K8ykhAo
	ne8/CQguJW7OYINxj1TM1FoMBDYDK0JwWDMY7yXHTcEoTz7PDpGHQHetlImpWfgs
	5JkVV0+2/3UVjcsM82+sxYpTK4rDRex3TthfdLiwXT1z8R0ExvbtbPgfrksCzhwF
	zh+HMjj/c15oEQUQu1O4sw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4h9tym9yka-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 18:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1791942306; bh=QuhzO0USaTv47e+3+isyFe+nGAUOASSxn5rkckmvvWg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Gqk6LmtwrcpMiWl83dw53+6nfyMPs5O7sGvNpA85v1whZEqyOgdIv7Z9cBBVnskr5
	 RUEYZZy/1dWqBS2p+yuvnZedFTuEeXzslGdc6Agli0CU++DKDuE4yUX6numtbZAdDr
	 YtCD+JnCsnqLAYPimAA1kNLT7uVlxgPTmr9srWVBAJ/0XbP7r4OZ7/kZMVeSBkPlWf
	 i2I5py8h4xABbqEwAzkpW2LA9oJYj8lQ4Yq+ZrzcPhrk81/zsAHNf0kcaKKHWByiTL
	 uCKLVajs1hZA4JgYX2XIyYsyQF/g3Mw7uv/KXriN1CLzGWhrlCc5qm28ioqlLXOELx
	 H5gmYAVgJdkNA==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 34CE1401AA;
	Wed, 14 Oct 2026 01:45:05 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 94936A006F;
	Wed, 14 Oct 2026 01:45:05 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=wKAvWfJH;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00307.outbound.protection.outlook.com [40.93.12.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id AEAE52202BE;
	Wed, 14 Oct 2026 01:45:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1BcxYGuMGNSe7FZ3Y+6J8dyLtFW+2kFMTLMf1rLYhQmpwQZKvNC3SU1IVCfwlKS2gPVwP7mJNARaRYWty9mp0exDjF85tXi/+hgWXTJMXxD5OqNu9a57uJ24VpKQ7ns/Z3MXerBDuwZlxSnNvvLte/UPSfRSfavU6bB89hgsR0oiucsEwLwFtfkYRAv9AvZM/Nz0gruo3fQEc8vZ36Kc03uQQNlMnjmh441R9C6Fm5aF0Kr8zN8rcJz8Jr49r/0rf9QNgl8FfLBsynrt7LSZ1iBujK2JiMOM7t+sdRUlhdWmfuBP6upZGcE1UDSw8gVVP0DWm9GmYsfLDDdrI9Gaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuhzO0USaTv47e+3+isyFe+nGAUOASSxn5rkckmvvWg=;
 b=rpBromHgiWN4TzrAN2M/z/uGZNl6qpodwW8V58W1WtB4XFfVHsLnnoriB3Fec3rMyZ/JXwRDCXEFNIAYvGpNreBmcM5t953zDB8tqGa3p8pON3TWvKXBJXNetmko+T/rVCjooRWmJSylDXg5p4NMhAy6pXJOKelRuB4t4rkliqvCYJQsojB7/582RacaJ48BNcW0vAFkke2yzAiYY4BzPlCauxupWx6FXK9CDJ21+VnV4a9WabbxUWnEB1zR2uy/CIEx/4U0nx5V4jiTr49fx4Bu31wbcZEgoJFmfcN2R7uT9WiM4IEBHPcb481t8/7qPa/3hp7CjQYU3zV3BLd2jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuhzO0USaTv47e+3+isyFe+nGAUOASSxn5rkckmvvWg=;
 b=wKAvWfJHQcS3SyHHvVXykZxC2KF9M7v9FOkhF0FC3sLMnNftrSdjZU5CElNZQof4rHvbFSTKzu/oTUkhLPQRnsbT3nCmshNbuq8Z0C7bx8GHelR8QvA+TWwyvuRoTi2V1YYmkskYGQQ7mfl0u7zBzpA8SSUZ5MECXfzSAh9d5c0=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DM3PR12MB9350.namprd12.prod.outlook.com (2603:10b6:8:1ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Wed, 14 Oct
 2026 01:44:56 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%5]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 01:44:56 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3] usb: dwc3: core: Fix RAM interface getting stuck
 during enumeration
Thread-Topic: [PATCH v3] usb: dwc3: core: Fix RAM interface getting stuck
 during enumeration
Thread-Index: AQHdT9IiBPnGUogw2kOy03ybke34C7b7PVSAgAEeJQA=
Date: Wed, 14 Oct 2026 01:44:55 +0000
Message-ID: <as7c1LHrOsqAA4Nx@vbox>
References:
 <20260929-ram-interface-stuck-v3-v3-1-0d1a54db233c@oss.qualcomm.com>
 <d45f758a-8d00-4f76-aef9-7364156f4ce3@oss.qualcomm.com>
In-Reply-To: <d45f758a-8d00-4f76-aef9-7364156f4ce3@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DM3PR12MB9350:EE_
x-ms-office365-filtering-correlation-id: a55681a5-655b-4b69-852c-08df2994bfcb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|38070700021|4143699003|11063799006|10067099003|22082099003|3023799007|18002099003;
x-microsoft-antispam-message-info:
 yGCpx15ZFDeJnfn+SQDXxkxhEc8laV7IKFvjqKg1k9sbG+YQcmgyvcR1nrx5jTE3LlPS0eVuYnkFlsfw5xV3tA7a7RL7sTgVomtpIe4BuV0SlhcwwDiI2QHV8q+ocurELQwn6TX2NFk1WmbpC+spd5+RW2jlt05Sqr2FfxhBeRQsChJIwnbYPmA9V2toTJuPLECwWYE/YAHv8PrzbnQJCnlf35K1L/mptc9TTb6lXu+/cbyi7wcOfGNHTycQOXhhqf6tEh8towXkyXaD7ydS84k9O2mNMn9tZ9aKRCZ7Ptp2VQSlhPb0Rm35Vs+V02JnuEhO8umehS+GHmZW+80eSx+IUgrojgcm+C+nLmDOpa4G+i5bzt8/IXT5qPHgeW+ppFVwxHnVb/TNAW0Yl8Yb246nGCQ/v4bpapTdNz+2ckt5mhutymtey/vl+jajr6a2CYx73ooUDF5IVXRZ3Bapia2Bdh+xpC34g47qL5FY4A4vjKqiNmfgETEV/lxrBNEKyNSoOD1F8rXFByYtoguXukXQODlGTFEB2NrL6Iv1OIWXi4B5g24R/hdp0+pIPIrqpu9z4auLiw5Qs5fyysVABj92mglvTHamaaOChpnG1qfcyMhJtbqR/RBKkCIE1qlACmy8T/mHbYcV3GglzbCJyJZEAsYrv/Q9RlYnoT4gwPrEldzVDOzh9FZ5DtjXeYgUmCWHi833pOclD+g4QTmjs0X+aimF6rmbi87liKBpyF8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(38070700021)(4143699003)(11063799006)(10067099003)(22082099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eTR3UUl0OGxMRm90K0YxV1FyYWlVWlhBZ3R1UmZFclordEp3Wjk2S0oxM244?=
 =?utf-8?B?aFZPQlhQK3pZeExVd0FCRnR6VFpZcndnMDBuejFjNmFrVGdoZHlhUUN3V00r?=
 =?utf-8?B?empnMXZ1eFkwd3VkRmF6QVFQUmlFOVNMUHVQdVVTTEYyb3lhR1FmT0dvbjZs?=
 =?utf-8?B?UFlrQW5pRkI1dElJZENOMUV3ZVF3NkpDMk1IczJmSFVDWFdyWkpoUzlhWHkr?=
 =?utf-8?B?OFFzKzI0MlBLbXpHelZIVSs1YXBhM0JKcmNGa2trQktJaC80UnV3ZEdUcmo3?=
 =?utf-8?B?ekNKNktVN0FWbTd0ZVNSYW15Ums0MnZnZ1BxYW1mUFFiQWpHNnpCQ2dzcGNP?=
 =?utf-8?B?dUd1UVdOazZPNnVZY0RIaXlnanpnTmxQejlnYlJVTTdrbWlSR2RJRnpDN3lE?=
 =?utf-8?B?U3dqbVZoVjhmOVU5Vi9pYmkwejdIVlpLaVdLNHNDcnhkWGVDdzBwTllLZG9V?=
 =?utf-8?B?UjdpU3F2V2Z1WFRmSjcxK0NIRzJRQkFXbjMxODVWNG1HeFZqSGtSUFdlN0Rj?=
 =?utf-8?B?bk5JSnJ1b0ZkSUpvZHV0TnRWRUdrOVkvSmNhN3huSkM4NHpUUEtJQW1aN0cr?=
 =?utf-8?B?UlNTcnNWNTNXVDdnQUtpZ3k2SHp6R1FwOTNsTHVzbm96M1NJaUdvd1F5YWVY?=
 =?utf-8?B?QU9IRU5xZCtxWnNZY3VGS0cxWVdsR1EyM3N3RHEwbXZobm91ejlQaXVrRmVY?=
 =?utf-8?B?WktWRDR4cUhJRkZZbDNiMHlNb2h2emxqVXQ5cEJhZDdMeStBWnBMVllyRjAv?=
 =?utf-8?B?MkpDZTZUWUlmSjlGekRJa3pudVUvdkxoRlNEeTNRQjRGdS95N2tRTlVEbE5P?=
 =?utf-8?B?Ly9UeFdtb3dSVTZYRUpOYU5SVTFvN0crNlhyL0xvVDVocDVPaUNWZ1ZNYWN1?=
 =?utf-8?B?M2VrVlY5OHl5blpZYjRmUVJMWGJ0Z0dWTDBrMDhJY3RUZ05ybnI2bFdEbUFV?=
 =?utf-8?B?UzdNaEkvY2I0Ky91cjRLSWR5aWRqSjVBM2VWS1JYaVczWGhVTDNLaFoydFlC?=
 =?utf-8?B?SWRlUlJaYmNyZDlOMzRWVlFUQ01WbnROWEdJdUpZams5UFdTZmpGcldaUmNt?=
 =?utf-8?B?RkZKQTR5RWRsbDhSK0pXMU1tUE90eHA1YkZPYnVlTnU0MTRzUzYxYkZWYWxH?=
 =?utf-8?B?ZitHWlp1RGpWQ1Ezemw5YnpEWnp6a2xVQStMSzMreUVwMFN3L0hRUDF6S0pW?=
 =?utf-8?B?TnFydE1XaERrYTdXWDBsaEdYMVpwN09Renl4NCtKMGdSZmswUzk2MTlZdFBO?=
 =?utf-8?B?cWF6NXk2Nm9jUmJJL2dtZTFPUmxxK3U0NzZkTGd2ZHRrWlcrajRXZlFWSGZS?=
 =?utf-8?B?bDBCR0lIaE5adWlVN2tIcnhiSE5lbzFhL0IrZjVWMDZjRy9WUTVsNTBGZCtm?=
 =?utf-8?B?OTRYQ2pKYjV6dXJ4bUJxWDYxank2Z2xCNkFlUGdpcy94d0dtU0xQNDd4L0J5?=
 =?utf-8?B?TFdYeCtBaC9kR2JsRFVpaXFFS3VwMXBzTFAzbGp3elFwbmZzbkxlOWxPQ2pp?=
 =?utf-8?B?cm1rUFFRYmJHbGdlakRBQy96bGlEcXNuUWpFalVHSmRJazk0cjdyL3BWSC81?=
 =?utf-8?B?aUJZOFVLZ3hKY1RLcCs1YnhuMUJQN1BJU2RlR29ONXRLUFZsTGpqRlRGQ2dD?=
 =?utf-8?B?aElLUjVHZjFndGRqWmsyYWNlQU5IVkk4WGZVOWFGMjBCaXYzSEY4b1J2QzJZ?=
 =?utf-8?B?aWF5eVJGZzRUeVF1YTdnWWVMQWI4LzdlUmFkTUdRaUVVMDZ1TzI2eGdrdDI4?=
 =?utf-8?B?b1NoejdzRDRsYmg2Umt2ZmJiTmE3YnFaUlpXOVhGSHRvWUZ2QU5sUld0aEJh?=
 =?utf-8?B?MU1QeCs1MWptc29oVmpNREZicC9zUlZ1SjduVVRkemdGRlAwaVJIUzU1ZlZv?=
 =?utf-8?B?Z2JwTGZPZE5maWd5TU1oemZNNXhEd1V6TFZjNkhuakJ3cFBDaWpRT29ybHVm?=
 =?utf-8?B?c3RncWFobnV6U0tsa2REZldrNEd4ZHYwQnBVZ0x5K1pDNXV6SmVzNHU0R085?=
 =?utf-8?B?UHIrc01TZnpkRXVWd3Bvak0wS3U0bm4yRmRVTjRENGpxWU5ZQlJKNHRWMjBL?=
 =?utf-8?B?S01qRVh6L29VWnJDT0tmK0NMUFJGT0Nxc2x5eVdSSUZWYWxOR0lGdnh2cmFt?=
 =?utf-8?B?ZEhxNDhRTGpCcE9TdTVxNTlaYWRoNXVrc1JmWUlwVVZIQ0g4LzRCbkdINnN5?=
 =?utf-8?B?OUFTbll2a3VRVUl4UWlGNGdDRzFQYU8wMWtaVVRJTFBzQlkwSEN1eVJWSGNH?=
 =?utf-8?B?dWtZcDQyaEFtK0ZremdERUxyNmxxNzZsRlUvZ3hBcnVZdStVVEdLRFQ5SzZj?=
 =?utf-8?B?bUpKUjQzM2NGZXdiVDliN3BKRmFXUWZoUkJNaXNKZ0ZFaUt5RVYzQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4E1E89D8EC33C41B5F050DF28F1E104@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	EisQakSbfucJa/UYbPo6WAMkrS4qhUMq5E0tBtVoXs3rBqfT1lQFyHU1iNm35w5krUHL236Mex3ck+IUZg4tEqKa1B6yzusr3EKS/Vb8QMjksGJzWSINq7OgxgQch75bNjjI36RG5h5NMqsAtws2PmG7YwtlzT0KwCe//0KKniWh20579xfcZqv1iNLEgkjDpIEIbI1ljfV4eg4Wm9qrj3NoXB4A4ZuT6uzV0fPRaROI2ePtTBISMrMn6M48clZN475LBi58vhbUrXFm8s4JQ6PPP5VaPIgD5jx6EN1tuG1FvMtPxHHN0Kys7I6kdMeUb8MpLOD4DIyl6L2H0xYhXg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T1qHr5Vlr+JO18kblRBl8oOZRdvUM/6Gr0cxlei8GSq4ZgeVE5DWRECV9OLRzuI3Ls9XUpHz+rINBoX8gNpxTBVUSTTV5lgXYkBfvrx9bqKEKbXbCCn6LzZ0xTntVQ1IUn3ge4QDwQRo3L/7WAb4l7TVSWbnVf/lg+pudaQon+aGqVrPZrIrDhZXL7utt2lMsgTQFjlDsoruEXvSmbMVRwfYwuAn9oKI9+LumPu/ptLJ8zY7qYJvwIEv5KV/+BU1tQz11dzKYSgIB6rK3SLR5WC+TFDPLZmrmxI9dVnwDZdp4OuxTTx687G1qW8cCatLk3aAKB0Ed9p6TxCIgiTpRqqkPNT1KjfcdmKkvXJkgJci1ACz4RfRPmNOek+WEb2crZ6p7VI68hEx6H6CzNakZYwzM73i/hNhvR2m4OPb0txZ89bvHus88cI301pxpfxuZbAQ9vVysjrzCbpiZh9B1xqt1w4Xj0JN0Ms5rjwkjI12PhTYZMLAIFKsdENHJTncCF3C1QFMv+2zqtmKob+voMTv6XVOztbT8HTkQqcGJpUc9VdVgkLQ2EucDHIvwu0i9A+JhwOtBqBgIzD9Zbys0X/2Gj2MQ7JEDx6urU1okOPGJ58S+HaDA4Gf0XGORNZv2FEfg0XBxc7aURwINtArjA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a55681a5-655b-4b69-852c-08df2994bfcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 01:44:55.9415
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ixws4M6oTTs7OvL1Kv46UxzrU8h48frFTTHU2TMhstVewFQ+q3KoYKyzt2BDEZJ/t+hUuePqkaTRLsT30N/BmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9350
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAwNiBTYWx0ZWRfXw8K+5HJljYno
 Mr785OEr8Fs0Y+6VN04VLV5TGBHC7x+I7cnQUFgbaW1quqckU68Lul6gtN1gvEhgEmOZ24ld49E
 5OqHFxEWZO/RK73XW7GwUMZv3M0RiWo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAwNiBTYWx0ZWRfX+HaMiByL6ATb
 p4Y5+3yC9UgJS06Niiy9mubuoGWzbq8oCTMWOdkY7o/Cghy1moE1rAVTfX8XfPGlUdQuHZ1dkzG
 dlMnzROwCziKTzqpDhpM24zs6Ap91tg3iD7xPg+QyD5xASpAx9X9i9eVKGfdhZEG7X5q4lMBoXo
 0RBeoTZ/IuL4wyznqke2TokzwaogJhQuyFGUymrvPyptD0dpZuiHhcsD/Wvo7bhk5iFlMfhKjEs
 Ch4/js2i9Od7GX+UtIqNWLAEBaninfnJmuhUX+5r9MbRoezThzVeGnw71k283bEC6LET3L5QHLM
 mptDOmkgnrrGWln9nwyRjirFMbA0NcUUZTnUKMkPLTz5b+ad3rxJ4Qysf7zXMLz0ItdLPzfFXhl
 BCqFaeozwoMfAGShQHVlS1NdA8OznH5fLZLyUCLYrwp0lFlAmCuWs/g3kf9IJz/3TSc2r3C/1f9
 EO7DKD0cGXRKCJ40GqA==
X-Proofpoint-GUID: yTB6QTAuMaOFB6ryJKZlUG8G7vSX8xpZ
X-Authority-Analysis: v=2.4 cv=Aot7T+9P c=1 sm=1 tr=0 ts=6acedea3 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=EUspDBNiAAAA:8 a=XLJMBmxXmmCvIZ5JIWQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: yTB6QTAuMaOFB6ryJKZlUG8G7vSX8xpZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610080000 definitions=main-2610140006

T24gVHVlLCBPY3QgMTMsIDIwMjYsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IA0KPiANCj4g
T24gOS8yOS8yMDI2IDEwOjQ5IEFNLCBLcmlzaG5hIEt1cmFwYXRpIHdyb3RlOg0KPiA+IER1cmlu
ZyBwbHVnLWluL3BsdWctb3V0IHRlc3QgY2FzZXMsIGl0IGlzIHNvbWV0aW1lcyBzZWVuIHRoYXQg
bm8gZXZlbnRzDQo+ID4gYXJlIGdlbmVyYXRlZCBieSB0aGUgY29udHJvbGxlciBhbmQgYWxsIENT
UiByZWdpc3RlciByZWFkcyBnaXZlICIwIiBhbmQNCj4gPiBDU1JfVGltZW91dCBiaXQgZ2V0cyBz
ZXQgaW5kaWNhdGluZyB0aGF0IENTUiByZWFkcy93cml0ZXMgYXJlIHRpbWluZyBvdXQNCj4gPiBv
ciB0aW1lZCBvdXQuDQo+ID4gDQo+ID4gVGhlIGlzc3VlIGNvbWVzIHVwIG9uIGRpZmZlcmVudCBp
bnN0bmFjZXMgb2YgZW51bWVyYXRpb24gb24gZGlmZmVyZW50DQo+ID4gcGxhdGZvcm1zLiBPbiBT
TTg1NTAsIHRoZSBkZWJ1ZyBsb2cgaXMgYXMgZm9sbG93czoNCj4gPiANCj4gPiBQcmVwYXJlZCBh
IFRSQiBvbiBlcDBvdXQgYW5kIGRpZCBzdGFydCB0cmFuc2ZlciB0byBnZXQgc2V0DQo+ID4gYWRk
cmVzcyByZXF1ZXN0IGZyb20gaG9zdDoNCj4gPiANCj4gPiA8Li4uPi03MTkxICAgIFswMDBdIEQu
LjEuICAgIDY2LjQyMTAwNjogZHdjM19nYWRnZXRfZXBfY21kOiBlcDBvdXQ6DQo+ID4gY21kICdT
dGFydCBUcmFuc2ZlcicgWzQwNl0gcGFyYW1zIDAwMDAwMDAwIGVmZmZhMDAwIDAwMDAwMDAwIC0t
Pg0KPiA+IHN0YXR1czogU3VjY2Vzc2Z1bA0KPiA+IA0KPiA+IDwuLi4+LTcxOTEgICAgWzAwMF0g
RC4uMS4gICAgNjYuNDIxMTk2OiBkd2MzX2V2ZW50OiBldmVudCAoMDAwMGMwNDApOg0KPiA+IGVw
MG91dDogVHJhbnNmZXIgQ29tcGxldGUgKHNJTCkgW1NldHVwIFBoYXNlXQ0KPiA+IA0KPiA+IDwu
Li4+LTcxOTEgICAgWzAwMF0gRC4uMS4gICAgNjYuNDIxMTk3OiBkd2MzX2N0cmxfcmVxOiBTZXQN
Cj4gPiBBZGRyZXNzKEFkZHIgPSAwMSkNCj4gPiANCj4gPiBBbiBYRkVSIE5SRFkgaXMgcmVjZWl2
ZWQgb24gZXAwaW4gZm9yIHplcm8gbGVuZ3RoIHN0YXR1cyBwaGFzZSBhbmQNCj4gPiBhIFN0YXJ0
IFRyYW5zZmVyIHdhcyBkb25lIG9uIGVwMGluIHdpdGggMC1sZW5ndGggcGFja2V0IGluIDIgU3Rh
Z2UNCj4gPiBzdGF0dXMgcGhhc2U6DQo+ID4gDQo+ID4gPC4uLj4tNzE5MSAgICBbMDAwXSBELi4x
LiAgICA2Ni40MjEyNDk6IGR3YzNfZXZlbnQ6IGV2ZW50ICgwMDAwMjBjMik6DQo+ID4gZXAwaW46
IFRyYW5zZmVyIE5vdCBSZWFkeSBbMDAwMDAwMDBdIChOb3QgQWN0aXZlKSBbU3RhdHVzIFBoYXNl
XQ0KPiA+IA0KPiA+IDwuLi4+LTcxOTEgICAgWzAwMF0gRC4uMS4gICAgNjYuNDIxMjY2OiBkd2Mz
X3ByZXBhcmVfdHJiOiBlcDBpbjogdHJiDQo+ID4gZmZmZmZmYzAwZmNmZDAwMCAoRTA6RDApIGJ1
ZiAwMDAwMDAwMGVmZmZhMDAwIHNpemUgMCBjdHJsIDAwMDAwYzMzDQo+ID4gc29mbiAwMDAwMDAw
MCAoSExjczpTQzpzdGF0dXMyKQ0KPiA+IA0KPiA+IDwuLi4+LTcxOTEgICAgWzAwMF0gRC4uMS4g
ICAgNjYuNDIxMzg3OiBkd2MzX2dhZGdldF9lcF9jbWQ6IGVwMGluOiBjbWQNCj4gPiAnU3RhcnQg
VHJhbnNmZXInIFs0MDZdIHBhcmFtcyAwMDAwMDAwMCBlZmZmYTAwMCAwMDAwMDAwMCAtLT5zdGF0
dXM6DQo+ID4gU3VjY2Vzc2Z1bA0KPiA+IA0KPiA+IEEgYnVzIHJlc2V0IHdhcyB0aGVuIHJlY2Vp
dmVkIGRpcmVjdGx5IGFmdGVyIDUwMCBtc2VjLiBTb2Z0d2FyZSBuZXZlcg0KPiA+IGdvdCB0aGUg
Y21kIGNvbXBsZXRlIGZvciB0aGUgc3RhcnQgdHJhbnNmZXIgZG9uZSBpbiBzdGF0dXMgcGhhc2Uu
IEhlcmUNCj4gPiB0aGUgUkFNIGludGVyZmFjZSBpcyBzdHVjay4gU28gaG9zdCBpc3N1ZXMgYSBi
dXMgcmVzZXQgYXMgbGluayBpcw0KPiA+IGlkbGUgZm9yIDUwMCBtc2VjOg0KPiA+IA0KPiA+IDwu
Li4+LTcxOTEgICAgWzAwMF0gRC4uMS4gICAgNjYuOTM1NjAzOiBkd2MzX2V2ZW50OiBldmVudCAo
MDAwMDAxMDEpOg0KPiA+IFJlc2V0IFtVMF0NCj4gPiANCj4gPiBUaGVuIHNvZnR3YXJlIHNlZXMg
dGhhdCBpdCBpcyBpbiBzdGF0dXMgcGhhc2UgYW5kIHdlIGlzc3VlIGFuIEVORFhGRVINCj4gPiBv
biBlcDBpbiBhbmQgaXQgZ2V0cyB0aW1lZG91dCB3YWl0aW5nIGZvciB0aGUgQ01EQUNUIHRvIGdv
ICcwJzoNCj4gPiANCj4gPiA8Li4uPi03MTkxICAgIFswMDBdIEQuLjEuICAgIDY2Ljk1ODI0OTog
ZHdjM19nYWRnZXRfZXBfY21kOiBlcDBpbjogY21kDQo+ID4gJ0VuZCBUcmFuc2ZlcicgWzEwNTA4
XSBwYXJhbXMgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgLS0+IHN0YXR1czoNCj4gPiBUaW1l
ZCBPdXQNCj4gPiANCj4gPiBVcG9uIGRlYnVnIHdpdGggU3lub3BzeXMsIHRoZSByb290IGNhdXNl
IGlzIGFzIGZvbGxvd3M6DQo+ID4gDQo+ID4gRHVyaW5nIGFueSB0cmFuc2ZlciwgaWYgdGhlIGRh
dGEgaXMgbm90IHN1Y2Nlc3NmdWxseSB0cmFuc21pdHRlZCwNCj4gPiB0aGVuIGEgRG9uZSAod2l0
aCBmYWlsdXJlKSBoYW5kc2hha2UgaXMgcmV0dXJuZWQsIHNvIHRoYXQgdGhlIEJNVQ0KPiA+IGNh
biByZS1hdHRlbXB0IHRoZSBzYW1lIGRhdGEgYWdhaW4gYnkgcmV3aW5kaW5nIGl0cyBkYXRhIHBv
aW50ZXJzLg0KPiA+IA0KPiA+IEJ1dCwgaWYgdGhlIFVTQiBJTiBpcyBhIDAtbGVuZ3RoIHBheWxv
YWQgKHdoaWNoIGlzIHdoYXQgaXMgaGFwcGVuaW5nDQo+ID4gaW4gdGhpcyBjYXNlIC0gMiBzdGFn
ZSBzdGF0dXMgcGhhc2Ugb2Ygc2V0X2FkZHJlc3MpLCB0aGVuIHRoZXJlIGlzIG5vDQo+ID4gbmVl
ZCB0byByZXdpbmQgdGhlIHBvaW50ZXJzIGFuZCB0aGUgRG9uZSAod2l0aCBmYWlsdXJlKSBoYW5k
c2hha2UgaXMNCj4gPiBub3QgcmV0dXJuZWQgZm9yIGZhaWx1cmUgY2FzZS4gVGhpcyBrZWVwcyB0
aGUgUmVxdWVzdC1Eb25lIGludGVyZmFjZQ0KPiA+IGJ1c3kgdGlsbCB0aGUgbmV4dCBEb25lIGhh
bmRzaGFrZS4gVGhlIE1BQyBzZW5kcyB0aGUgMC1sZW5ndGggcGF5bG9hZA0KPiA+IGFnYWluIHdo
ZW4gdGhlIGhvc3QgcmVxdWVzdHMuIElmIHRoZSB0cmFuc21pc3Npb24gaXMgc3VjY2Vzc2Z1bCB0
aGlzDQo+ID4gdGltZSwgdGhlIERvbmUgKHdpdGggc3VjY2VzcykgaGFuZHNoYWtlIGlzIHByb3Zp
ZGVkIGJhY2suIE90aGVyd2lzZSwNCj4gPiBpdCByZXBlYXRzIHRoZSBzYW1lIHN0ZXBzIGFnYWlu
Lg0KPiA+IA0KPiA+IElmIHRoZSBjYWJsZSBpcyBkaXNjb25uZWN0ZWQgb3IgaWYgdGhlIEhvc3Qg
YWJvcnRzIHRoZSB0cmFuc2ZlciBvbiAzDQo+ID4gY29uc2VjdXRpdmUgZmFpbGVkIGF0dGVtcHRz
LCB0aGUgUmVxdWVzdC1Eb25lIGhhbmRzaGFrZSBpcyBub3QNCj4gPiBjb21wbGV0ZS4gVGhpcyBr
ZWVwcyB0aGUgaW50ZXJmYWNlIGJ1c3kuDQo+ID4gDQo+ID4gVGhlIHN1YnNlcXVlbnQgUkFNIGFj
Y2VzcyBjYW5ub3QgcHJvY2VlZCB1bnRpbCB0aGUgYWJvdmUgcGVuZGluZw0KPiA+IHRyYW5zZmVy
IGlzIGNvbXBsZXRlLiBUaGlzIHJlc3VsdHMgaW4gZmFpbHVyZSBvZiBhbnkgYWNjZXNzIHRvIFJB
TQ0KPiA+IGFkZHJlc3MgbG9jYXRpb25zLiBNYW55IG9mIHRoZSBFbmRQb2ludCBjb21tYW5kcyBu
ZWVkIHRvIGFjY2VzcyB0aGUNCj4gPiBSQU0gYW5kIHRoZXkgd291bGQgZmFpbCB0byBjb21wbGV0
ZSBzdWNjZXNzZnVsbHkuDQo+ID4gDQo+ID4gRnVydGhlcm1vcmUgd2hlbiBjYWJsZSByZW1vdmFs
IGhhcHBlbnMsIHRoaXMgd291bGQgbm90IGdlbmVyYXRlIGENCj4gPiBkaXNjb25uZWN0IGV2ZW50
IGFuZCB0aGUgImNvbm5lY3RlZCIgZmxhZyByZW1haW5zIHRydWUgYWx3YXlzIGJsb2NraW4NCj4g
PiBzdXNwZW5kLg0KPiA+IA0KPiA+IFN5bm9wc3lzIGNvbmZpcm1lZCB0aGF0IHRoZSBpc3N1ZSBp
cyBwcmVzZW50IG9uIGFsbCBVU0IzIGRldmljZXMgYW5kDQo+ID4gYXMgYSB3b3JrYXJvdW5kLCBz
dWdnZXN0ZWQgdG8gcmUtaW5pdGlhbGl6ZSBkZXZpY2UgbW9kZS4NCj4gPiANCj4gPiBTaWduZWQt
b2ZmLWJ5OiBLcmlzaG5hIEt1cmFwYXRpIDxrcmlzaG5hLmt1cmFwYXRpQG9zcy5xdWFsY29tbS5j
b20+DQo+IA0KPiANCj4gVGhpbmgsIENhbiB5b3UgaGVscCBwcm92aWRlIHlvdXIgcmV2aWV3IG9u
IHRoaXMgcGF0Y2guDQo+IA0KDQpIaSBLcmlzaG5hLA0KDQpJZiB0aGUgQ1NSX1RpbWVvdXQgYml0
IGlzIHNldCwgd2h5IG5vdCBjaGVjayBHU1RTLkNTUlRpbWVvdXQgZGlyZWN0bHkNCmluc3RlYWQg
b2YgaW5kaXJlY3RseSBjaGVja2luZyBERVBDTUQgdHlwZSBtaXNtYXRjaD8NCg0KQWxzbywgc2hv
dWxkbid0IHdlIHJldHVybiBhbiBlcnJvciBjb2RlIGluc3RlYWQgb2Ygc3VjY2VzcyBpZiBuZWVk
IHRvDQpzY2hlZHVsZSByZWNvdmVyeT8NCg0KVGhhbmtzLA0KVGhpbmgNCg==
