Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA88D31DDBF;
	Sat, 26 Sep 2026 03:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790394226; cv=fail; b=XGdjoypCsFLJhhT6jZ9u5ysFwCkca7Vv13NtSddtl/uNxIZWT4TY/VMLV7QyOyOeFxfiCrqq1ec3c9SXn/NciaU2WIPDQtjP+/4z/dR0Nj6LJtkWcMLnWFCxkwg4OsLlEAUO/a8DPkIYOXmT5AU7giTlolonAqVmlDq3oXFMpLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790394226; c=relaxed/simple;
	bh=OlgfqQ6qRNbbThi+2i5qOAlnTKJ9A95n0t2mjlM/qNE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kpSl2P55BA1cgUyCGmGc+0gfQT5xT3sT4IuWszqYXGi8fhhXtjUo24lv6kkl2UJGcsHrh7iZTRO+YUuLIlffoYw6upM4XrIrM6k4Hfw7+zKD/wrqBCNCACjXqBsCQ2diIpDgg20NBSEYAQpa+FYCB85QTDcjZ9pTOIu5NCjLriA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=rSvltnZu; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WMmwxU3x; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=BWYZvCKS reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rSvltnZu";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WMmwxU3x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BWYZvCKS"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PMtnRj742014;
	Fri, 25 Sep 2026 18:45:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=OlgfqQ6qRNbbThi+2i5qOAlnTKJ9A95n0t2mjlM/qNE=; b=
	rSvltnZuNbw9IdbpigpBR6+vbvinVTEEBfGXrnkRsnVZthUp6srSX3pvlx7I/V8/
	4w+RlcrS0XU7xoEMeXi7YtYh+E6y/Su0CuJDpvQR4RPH7rLunohrMfEGfAnv7GwZ
	bE6Ihd5tXaxNIFNRahsiWf554pAYc48ofPdclhdMvntZqx4/uv0Qrt4Nd+os1Mkn
	hqS1FqjKuz9b9c7+lDonmGbh3Gv259GBL/OPyrULIDplTAvqWlG9z5FpXrwZ527H
	A1sUvSJTUnIfn0q3VRy0sWQuK2M48gWSYaBqShaZTvXg2Xmb7XFioaGdW7IZCXyW
	XuMsK3kRCa0goOAeKcz3rw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4gw86su7jb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 18:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1790387127; bh=OlgfqQ6qRNbbThi+2i5qOAlnTKJ9A95n0t2mjlM/qNE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=WMmwxU3x//k/A9Z0w7zfIcRCm7bGAE+OKr6+or9hZohU8u5dZ3B9I5ciC2au6WntQ
	 JOP+0ZPjlAENti4t67JPFaPpew8Pf8I6vsQJpL4PtXwq9l4ehdA303cm7kDmUFnuD/
	 +YBEScSm7xhTEJf8KaO8IY41GMiig3J2u9+f62EREzeMPc8QHkxfMiprodwv5xS9Rg
	 cVrB75cjWbZKSyLTlwbkhEtOdT5nwom4Wq1v14GBNArRQoTzjvHjkoF50b3n48ZSJe
	 GBkzeR+gyUXCzG71bSdDTASbSw++SpfUV7ALN0kx2jcGmclhEoBrH5Dv0jw3Nw26VW
	 13y+ndTIvgMOg==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A27D0401A7;
	Sat, 26 Sep 2026 01:45:26 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 0BFF3A0A19;
	Sat, 26 Sep 2026 01:45:26 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=BWYZvCKS;
	dkim-atps=neutral
Received: from SN1PR07CU001.outbound.protection.outlook.com (mail-sn1pr07cu00106.outbound.protection.outlook.com [40.93.14.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0EA2D40139;
	Sat, 26 Sep 2026 01:45:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e4hjh5UW3x5t9pg23Xp/1ebOYOvHLXw9lEXCFvGo8AtM1f/AkN8aTtdFZL1SChSYSH7cXtJ6jDRLDxWbg2Tj+BqAKDBvz16RgBoS50YAdU4YiHLlGrKijw30gFQByNUs2AGIRIj7agKeCJNHMKZQAAtGAyetTs3Ksp5fFKq292PyFfLn+HPKCkPKmMixVOGVWyjPrgalcUGtzEJVD6HfZmTHSF08PyIxsyEOVDbPe1lyuhR7AbuKkC/hwVUBDrTA7TOGpYc5FgkjDWJ1cO3Inrl+TaDQJQnocejEOYTiRwejGd6eFsN+/wRN6W+DAvXpkx9bEcQkSIDZVcPej5FF/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlgfqQ6qRNbbThi+2i5qOAlnTKJ9A95n0t2mjlM/qNE=;
 b=LoKGw9KPaOFzA7ZMRojJij088wifdDcIV0Q99ea7AwnLMnkhqg4yRAQZpl3oB/p/46tCYRqPpTvlu8NX7nzqfbT9ryv1ioy+rMTWGcKqOGxjMhtC6FOQ8MhYOglA19yzd6BSLN0jfmSFSPu4g8lyLt0kGNlXdRqOQrPp7FXYR3ZPeKfxEFbN3hKObomX9RcYxIjJsWwARowwHtmtBXfgAPU1Zy8fuzuVRObV+lbVpnYH8bhTg0H5Xcu0ikY4jhkz1LX7/ZaVDRhgebiye20seoshFeBQt1Jw9QbTXMdwJp7Rq4OMyAUC7g0mixO75q2VsRIG22GfLF/JZcWQMYMlvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlgfqQ6qRNbbThi+2i5qOAlnTKJ9A95n0t2mjlM/qNE=;
 b=BWYZvCKSrz6uAwqHdzmNt1R9BO+03al0Lnw6UAoywb9RrRaFGaUlI9zAD1wWDmWgY6ZW5W7EvtcTXU8YIfCL1lDMwZQl17+y54cjE6J7OKsDHVLO79TLy5PQYcr38h053tcg3+MsK9sSCRocnqDrHEx0ocDZPsGXQeRfO2C+nZU=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DM4PR12MB5890.namprd12.prod.outlook.com (2603:10b6:8:66::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.22; Sat, 26 Sep
 2026 01:45:13 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0451.014; Sat, 26 Sep 2026
 01:45:12 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Michal Pecio <michal.pecio@gmail.com>
CC: Kean Ren <rh_king@163.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Kuen-Han Tsai <khtsai@google.com>, Kees Cook <kees@kernel.org>,
        Nikhil Solanke <nikhilsolanke5@gmail.com>,
        Thorsten Blum <blum@kernel.org>
Subject: Re: [PATCH 1/2] usb: core: hub: recognise two-lane SuperSpeed
 sublinks as Gen 1x2
Thread-Topic: [PATCH 1/2] usb: core: hub: recognise two-lane SuperSpeed
 sublinks as Gen 1x2
Thread-Index: AQHdSKtQWGUimXSQr0SDifXtgZ7rErbdATOAgAIcCACAAQKmAA==
Date: Sat, 26 Sep 2026 01:45:12 +0000
Message-ID: <arcgGoi9Ev_GSkDR@vbox>
References: <20260920025308.2358862-1-rh_king@163.com>
 <20260920025308.2358862-2-rh_king@163.com> <arSByjrfc4e9fUr1@vbox>
 <20260925121902.3d75df9b.michal.pecio@gmail.com>
In-Reply-To: <20260925121902.3d75df9b.michal.pecio@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DM4PR12MB5890:EE_
x-ms-office365-filtering-correlation-id: 1cfdd57f-9dfe-401e-a552-08df1b6fce03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|23010399003|376014|366016|38070700021|6133799003|4133799003|3023799007|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 65Qs1lFwfuFi3FZml9JUyf44dBGq373ADf0W5mx5ML1GH/gyizQtKIBAPt4qzGFEdyrmi/isf9v65OmxUUExO/EQnpDuuF9XiOIwlVpCXYK+C+osn7R2ux3EkcNMIwWFH7C6ZdcBLEwx5F/CtUvGTcDZF1kYfysMn5XUoujonz1J+ZTLZ6lrCKyPHIbLRFV5+vgAYiBTcNZBxgtvZyd84o8juVAqsvHmysoNbq33UwWzH9fF36rfzpdpCuGomRM/vaB3ZXLw4XliKFu+4ocE3AcYTzou90P3JI4XrG1KjcsQkd5GTnfJ/kwLQwDqRmhPU51C0zfMcSCrEinNoNu4mNdLRybyFced+95+9texrvwMESH3KPCPQqBifYx9aY3Y5/8jxoUr+au/f934kukDqlR5tpNV9EVOfqiiv57sVI1LbZrQSFtZxvgEdhYG+o4+kpHa5plT8BIvj8IGbJdI/03ba0n7NhAaStsi77++umLWNhbcFd55ZkgXzh+pH4jR32ecU8uQaVfkp0I+Dil7uTj/4ohAh+ToqUY1QG8u+/OYQ//O/JAqi0s38DyK+QjaAu6+E3gPItss6+74pJQkQQMBeNbOQ50jCQkkurHKel+eMJGaWTJwyKkdZbJwOg4aaAGlL6SEUn7YjmVwo/FmufsZYj7ybbp2XNIhyES7LFv2JjJq8NbJ66RHzcr/s46q
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(23010399003)(376014)(366016)(38070700021)(6133799003)(4133799003)(3023799007)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dHFLY05kbHVYYzRXb2V2K2paQ05sVTJkR0lhbTZUc1FOTG1oa0IrcmlVeGNU?=
 =?utf-8?B?bC9QSXh3ZTBkV2t5TUhFM2tTdWpGVGVncUJEZG90azJQZVlYTU1MbDlDczQz?=
 =?utf-8?B?WXBSTDJmanQ0K3NOSGFxbFlWTHhZQkhxNTZYaWo5TGFUNG12SHZnWXYwL000?=
 =?utf-8?B?NzBlbWwvUU95TzBEb1ZGZUVpaHBCL0VDbnJDMWNCeXJ3RklHT3N5c2JyVG5o?=
 =?utf-8?B?ZS9namFoMVY5ZzFaN1J0UXhQOGdxQWlVTkI0cmF3Z2VJQWVDeE9VdDFQT2ht?=
 =?utf-8?B?R2NpenhFcjBDZnppbjdNNGQzUUpnZDF5aWg3OVFHQk0rTEhhSEU5ODRndFhs?=
 =?utf-8?B?NXZuWEZyNTQxVmhwbkZDVEVrR0xGQkpmVndwTVlBREduNXo4bDlHbGJRQmt2?=
 =?utf-8?B?MTRoUUFwMGRKQWN2clczamJ4L3hoVmFsMUJFa3BqTEN5eFVlbnU5b2t5cUVx?=
 =?utf-8?B?UDJSUVZRMGNETnBhc094Nk9GT0NCdUFzNzQ4T3B4RklINHdhbVVUUzFzZkho?=
 =?utf-8?B?Y0FjUnlDTnJGU1BaMzFqUHh1VXBUN3FlNFB2YWgzdlFxcGk1QlFUN2FyYjdY?=
 =?utf-8?B?bFlJRkdtZzdaK3MrQllKSmEyVDBTNkVza0pzTGFQWjRKTDB3WHNJS2srek95?=
 =?utf-8?B?NU9abkhwKzkrL3hCYTBLaHhLRXcrZ1dTRDhmcytkSk5OUitQRGJnSTZFd3hj?=
 =?utf-8?B?OUJ3NkR5cFl4b0ovSW5pZEpqTHlpR2lsTCs2UldaeVFydDlHa1I2U3lyMHBL?=
 =?utf-8?B?NnIvRTBUaXdvVzJ4dUZxcmJPUTZjMllmbEllcitiUURhV1ZtTlpPU2x6bzZN?=
 =?utf-8?B?VUM0Qzkvcmg3d3RIditnYWVoMFJqMWxHeGlDNTVZMVY3MkdaeHp1dlB4MG4y?=
 =?utf-8?B?NFZGd2hqZk1FWmY1ZnZuS2VTa250alAzS24vYi9ZdEhCY3dsSDF5enpUdXZY?=
 =?utf-8?B?NkxldFJIaGNuZHlVQm1rd1pDVUFJdjZxbkc2bGRFNUdMZGpiZ3RLbytoYzNa?=
 =?utf-8?B?VC9uMDF1alRyclpKcEpza2NuWUNXZ2ZkUTgrNDZISHRibHhsazc5MWR5Rm1l?=
 =?utf-8?B?dEVXUjZza0cvYVcxWUR1UjJnbGVMWEtNZVhZYjk2dDB2ZlBLTDRja3BMZzJX?=
 =?utf-8?B?RXQ3YkxETFk5WTR1TWc5N255V0ZyMjJXYjNyK011KzJkU29QdlZZMVpsYlh6?=
 =?utf-8?B?VElRelpCNjg0bnpKbHVWbEExUzVqek9BWEFRdGhBbkZtbkFtbzA4Qi8wWGVa?=
 =?utf-8?B?bWhPSEZRZUQ1R1hIOGcyUEV2NFNCYUJsc09NNjlHdTNpSnNEY2Y4M3MzN0cw?=
 =?utf-8?B?dUl0VEk4YjBrMGpGRWNwVnV1dkhhT2RmUzkvcy9RWjRCb3k2N2t1dEJwRnZN?=
 =?utf-8?B?aXRMMCtsMlhRUmk5RTBRVldlRkhaYWY5RE9uS21BOXhLMGxTbktMZ1o3WFVB?=
 =?utf-8?B?ejlPOEdhRCtkaEhjS0tuM3E1Ry95YVFuRWR0RHY1QWNGUHZNNGVnWFh3V1Z2?=
 =?utf-8?B?WXFGTFIxbzVBRy9LMHZUeXpHSTlPMUVnREErQWZkMUlxV203RUFpWGIwLzJD?=
 =?utf-8?B?cXlrTUZSYk0zcU13MUU3aEZiWXpMU0tUdFgxVThMellDTFE4RlhMYk9Za3Ba?=
 =?utf-8?B?bGl1SGZlc3NwdFMzWUhVbU80YU90YUFtZ2NLL0UwclQyLzE0ZlhLL1pOYm53?=
 =?utf-8?B?NDYyaVBCMFFBVHNzenBQdU5PRHkxeVpQV3I0RE1zeVV0TldSTjI2QmNzWjZn?=
 =?utf-8?B?Q0lwZWllSW40c2pGVkRNRHhzem1hcTFlRDdpVS9iVUY2VTNpSnZuaVRMeUZm?=
 =?utf-8?B?eVJmV292WERJcm1vWTlKUEwrYVpHNXFHOHpKamozbk1QMmVFNzVrbmVVY2tR?=
 =?utf-8?B?bC8vWmgyNFVKT1l6Tml2L2h6ZmQ4MmV1b0d2STE5d2tWL3c3d1BpRlN5V2Yv?=
 =?utf-8?B?a3RpZ3c2Mzl4L0NTbUM2VXlpdHJ5dzJmQUwvUkZ6QVRsd3ZNdGdSb2dJWWl0?=
 =?utf-8?B?VWxHZmRTVWhra0hBY0loZ256QmRZb05NcnFnc1FNTU1ZWWUvSzBUL1QzMHU3?=
 =?utf-8?B?R1ZNK3hxTWd3RnJZZ2NGdTRrVkpTT29VV2RsWGN2WGp3TERuTkFMUmJ1ZmFF?=
 =?utf-8?B?K0taN1NMUlVxSXUrL0dZU2cxYXI2RVhheWZKN3M4czFnR3NIcUg1a1g3WFJZ?=
 =?utf-8?B?MkNzcU10cmhpRnlyODZOYkFaWGhLV2Q1d1ZCNmdyUEJjOE85anhIWXpwVE14?=
 =?utf-8?B?QXo1cmM1UTNIYXFIbGl6NEp0RW5CYmtZb1N4QjhEVDJyV2d4VW00WlJLRVZq?=
 =?utf-8?B?K0Fya0pZVHRtUU5NMm5SOWJrV09GL1ZpYkpBWnBvOWs2YnVDWHhHdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B97FEC6D3ABCB64994ADC20FA0594CE5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	HGI4/er7CmdZAAANvv906S6YZOU93Z/MJg4FX1ZrqYoI3s4goHa8fW0iMWf4bZlEQKOS//F4sRYx9GfliH7k5pkmu50eh2WBADld2WEocm1WFzkWh9RsP3crgCkBXYSFg3yBdufksB9AQra6sT+E1MjEzhm0K3r0UzGXL/I9/XZ0KPTMENR2NL5bnwK34Pjj1yV9d7NpceiUziNedXbIuvZ287qU18Rv9EdsAuUSmO1xyDYVyblyvAJN/i+LfZS6k4CYxJQxbG4p6jHoUwwOFepc0NzzFstmd1uS841yS7b+u/bMQDOfTTx7EpRtiFuVK4urI+s9DxrNGDJRS0mRlQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	le1TbizeUowfUXyKCcOM5yxyDMKopbNK2ljPvABUf1IETJcw29v5Gf9LNkujJh3cUlDo2wDqAZVnswb/4i8nMuSXpM3LJ8sz49wQ6NjwQb+PhhIB9mo97Y6zpSVfwrzKPbOF19CGr6Aj2woOIT5zBkGYwqgHrSVKRLwHgsb5q2s9fjYNQHXGgCZby7HgheIimADv397ihudT1X8xtHnaByLLJklLlK/GVrGVaW6aOQcz4vpg2bwM+z+HpjC4Ost0lJ4ZKsfEinvSpAOKf22dynFWL7Ccr1u/EsxjGONOQi0o4uwg35R3azKUXV6GX209vKqWUDvB4XhR+fxLdv9EuLkm+Wt0p16CxprNE26paMEPzu+Dbi6Yn9UrwzaUslusF3AXAQ39xA8xxxH9ckG7VrPD4+igwcGLwAbh2s/JZ/cTej+1ZJ3eORDWauKbJSq5ZVpQjuD+G8Hdl62vLcbOP9cd7iVLHysPJektLDqqqFkw3BTA64syuPEDEVWD8FhJjZFS63gsBWhUU6PUN2YcXWHh8Ai+ZS8QG/UEIw3TVj8KTNzhmxDCmZdZ11X6VTbAFGdwTEBWYwafBVYmICx86+CdCl75H28ZE3zogTg6xS0g/kQ87yERes6nbazQcKySNEvA5BpXEpNHhDzfaoLk1g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cfdd57f-9dfe-401e-a552-08df1b6fce03
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2026 01:45:12.0950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M7Pi35KNWIzCP44rGh4M+zqI9gLlAaIMi09BOzLwvfIbXUDm0IKnY30qFDs0uC0q+IoHMaqklKOex50mZ2H+wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5890
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAwNiBTYWx0ZWRfX2y6PmWFP8NRN
 dGLOtlXRf3X16PqNlFpb6fGbYZB5W1DgD9EHIKnkWzhkXGgAUEmbrC5AMfC72fyyiLjThaFUX6L
 +rO3lBKgagxwf8B9B2+1m+B2U09o9dsTf8dteCFa7gonDk7edu5zufMjcpo5DZeRxaY/m7xzheN
 gFS+osWdEIhB2fhY5gzaW1REU9j/ytT9DLL1VNGPFnOlfRN64B9gOnTs1aDhfm28vABI08EOtMq
 8HxeLbxTxaXBCCT9QN7ECqq/8kbzaso2MtAI2T6LOmXmQl3qGA0Xhzs1yJm33Iwe3ppTaPj6h88
 J/Y16mYDhvHB3LMsB2lNG0csAs0w1ZzO/WINR5Y6Upo8x4av/JzHqicYLkYtXVy+ihkyZL5HKEx
 2B/M/TUVzHMVd229/iXkTfoJ0uBVwBd2qp8aT7JeocgmvwaJKhnvcb4N7YKv6BIVjtUUgyGJ/ha
 3J6nVMZDIcmouDZjIRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAwNiBTYWx0ZWRfX3rEsznWaAb3t
 KiiZ9wa/YTN7wPvxo27T5KfMUJUqdL6qlHqSPIlj4s5i2e+pdH29AySyZu12e67I5Nn2UAldc1a
 qKpKIPuPsdDjlrAk5Ra2lmkK+m0dUUg=
X-Authority-Analysis: v=2.4 cv=beT+w+PB c=1 sm=1 tr=0 ts=6ab723b8 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=jIQo8A4GAAAA:8 a=Byx-y9mGAAAA:8
 a=IlX1qBgwnzh8igZEmksA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: XeMZxFqHBAxMYles9q-UayeKwHk9Xgvb
X-Proofpoint-GUID: XeMZxFqHBAxMYles9q-UayeKwHk9Xgvb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609260006

T24gRnJpLCBTZXAgMjUsIDIwMjYsIE1pY2hhbCBQZWNpbyB3cm90ZToNCj4gT24gVGh1LCAyNCBT
ZXAgMjAyNiAwMjowNjoxMiArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIFN1biwg
U2VwIDIwLCAyMDI2LCBLZWFuIFJlbiB3cm90ZToNCj4gPiA+IGdldF9wb3J0X3NzcF9yYXRlKCkg
cmVqZWN0cyBldmVyeSBtYXRjaGluZyBzdWJsaW5rIHNwZWVkIGF0dHJpYnV0ZQ0KPiA+ID4gd2hv
c2UgbGluayBwcm90b2NvbCAoTFApIGlzIG5vdCBTdXBlclNwZWVkUGx1cyBieSBqdW1waW5nIHRv
IHRoZQ0KPiA+ID4gInVua25vd24iIGV4aXQgYmVmb3JlIGl0IGxvb2tzIGF0IHRoZSBudW1iZXIg
b2YgYWN0aXZlIGxhbmVzLg0KPiA+ID4gDQo+ID4gPiBVU0IgMy4yIEdlbiAxeDIgcnVucyB0d28g
U3VwZXJTcGVlZCAoR2VuIDEpIGxhbmVzLCBzbyB0aGUgbWF0Y2hpbmcgIA0KPiA+IA0KPiA+IEdl
biAxeDIgaXMgU3VwZXJTcGVlZCBQbHVzIGFuZCBzaG91bGQgdXNlIExQID0gU1NQDQo+ID4gDQo+
ID4gPiBzdWJsaW5rIGVudHJ5IGFkdmVydGlzZXMgTFAgPSBTdXBlclNwZWVkIHdoaWxlIHR3byBs
YW5lcyBhcmUgaW4gdXNlLg0KPiA+ID4gVGhlIGN1cnJlbnQgY29kZSB0aGVyZWZvcmUgcmV0dXJu
cyBVU0JfU1NQX0dFTl9VTktOT1dOIGZvciBzdWNoIGENCj4gPiA+IGxpbmsgYW5kIHRoZSBVU0Ig
Y29yZSBmYWxscyBiYWNrIHRvIFVTQl9TUEVFRF9TVVBFUiwgcmVwb3J0aW5nIDUwMDANCj4gPiA+
IE1icHMuDQo+ID4gPiANCj4gPiA+IEhhbmRsZSB0aGUgdHdvLWxhbmUgY2FzZXMgYmVmb3JlIHJl
amVjdGluZyBub24tU3VwZXJTcGVlZFBsdXMNCj4gPiA+IGVudHJpZXM6IA0KPiA+ID4gICA+PSAx
MCBHYnBzIHBlciBsYW5lIGFuZCAyIGxhbmVzIC0+IFVTQl9TU1BfR0VOXzJ4Mg0KPiA+ID4gICA+
PSAgNSBHYnBzIHBlciBsYW5lIGFuZCAyIGxhbmVzIC0+IFVTQl9TU1BfR0VOXzF4MiAgDQo+ID4g
PiANCj4gPiA+IHNvIHRoYXQgYSBnZW51aW5lIEdlbiAxeDIgbGluayBpcyByZXBvcnRlZCBhcyAx
MDAwMCBNYnBzIGluc3RlYWQgb2YNCj4gPiA+IDUwMDAgTWJwcy4NCj4gDQo+IFdhcyBpdCB0ZXN0
ZWQgd2l0aCBhIGdlbnVpbmUgR2VuIDF4MiBkZXZpY2U/IE9uIHdoaWNoIGh1Yj8NCj4gDQo+ID4g
PiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEtlYW4gUmVuIDxyaF9raW5nQDE2My5jb20+ICANCj4g
PiANCj4gPiANCj4gPiBHZW4gMXgyIGlzIGEgU3VwZXJTcGVlZCBQbHVzIG1vZGUgYW5kIHNob3Vs
ZCBhZHZlcnRpc2UgTFAgPQ0KPiA+IFVTQl9TU1BfU1VCTElOS19TUEVFRF9MUF9TU1AuIEEgY29u
dHJvbGxlciByZXBvcnRpbmcgR2VuIDF4MiB3aXRoIExQID0NCj4gPiBTdXBlclNwZWVkIGlzIHZp
b2xhdGluZyB0aGUgZXhwZWN0ZWQgZW5jb2RpbmcuDQo+IA0KPiBUaGlzIGRlYWxzIHdpdGggdGhl
IGJtU3VibGlua1NwZWVkQXR0ciBhcnJheSBvZiBodWIgQk9TIGRlc2NyaXB0b3IuDQo+IEZvciBo
b3N0IGNvbnRyb2xsZXIgcm9vdCBodWJzIGl0J3MgZ2VuZXJhdGVkIGJ5IHhoY2ktaHViLmMuDQo+
IA0KPiBBbmQgSSB0aGluayB0aGF0IHRoZSBjb2RlIHdoaWNoIGdlbmVyYXRlcyBpdCBhbHJlYWR5
IHRyaWVzIHRvIGF2b2lkDQo+IHNldHRpbmcgU1MgKG5vbi1QKSBpbiBtdWx0aS1sYW5lIHNwZWVk
cywgc28gd2hhdCB0cmlnZ2VycyB0aGlzIGJ1Zz8NCj4gDQoNCkZXSVcsIHdlJ3ZlIHNlZW4gQVNN
MzI0MiByZXBvcnQgaW5jb3JyZWN0IHNwZWVkIGluZm9ybWF0aW9uIGJlZm9yZS4NCg0KT3JpZ2lu
YWwgcmVwb3J0Og0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBS1JhMVU2cnVrQkJ3V3gw
dk4yd3FpSE1iVUg5eldzYy15MXdrbk9Ddmh1ZXFXc1Q3d0BtYWlsLmdtYWlsLmNvbS8NCg0KQXQg
dGhlIHRpbWUsIEkgc3VnZ2VzdGVkIHVzaW5nIHRoZSBTU1Agc3VibGluayBzcGVlZCBub3RpZmlj
YXRpb24gYXMgYQ0Kd29ya2Fyb3VuZCBzaW5jZSB0aGUgY29udHJvbGxlciB3YXMgYWR2ZXJ0aXNp
bmcgaW5jb25zaXN0ZW50IHNwZWVkDQppbmZvcm1hdGlvbjoNCg0KaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzY5MDhhYTY5LTQ2OWItOGY5Mi04ZTE5LTYwNjg1ZjUyNGY5Y0BzeW5vcHN5cy5j
b20vDQoNClRoZSBzYW1lIHdvcmthcm91bmQgYWxzbyByZXNvbHZlZCBhIGxhdGVyIHNwZWVkLXJl
cG9ydGluZyBpc3N1ZToNCg0KaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNn
aT9pZD0yMTg5NDMNCg0KQlIsDQpUaGluaA==
