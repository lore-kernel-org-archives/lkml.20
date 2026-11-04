Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793756725;
	b=yHBCJz7khgRpehCHGPRybDOcd83k+bYxxBgcLwzTsgV6mw0Fa7NQ/mVvZgAcP3rjYoJv
	 oa0oIFfJ4eZ5TaG7uNvS6sHbcmzI35Fiwg+oC5NY6/FjZAwTJhM4W35X4kgNYsFCu7qiH
	 Mi7tcV6LwMzMtsQboZi7zCInQTBunmTH8Gv6s2yLP9KDPJ+geOsGuoO9GD8f8EtedR0Sh
	 /uJ8Yrb5I6lywhBXbxorg5k0Lut/PQrMs7BVbVCaNrmKUaYe887rPbPgwtXPPD+0TAdMD
	 ALalNHGci9wZcmoi3jk1tHACq3lRKoEUW84YJaahpyIAJdNQzw/ligE8x7kByd0gNsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793756725;
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+MKIg8VIx5XYV/oqvSmyPGwEOk/0xl2j+1mrjq0045o=;
	b=1kCYTRztKnlM9zTMNgNJWZTOWZLgxIH3+7cevQEvKjjoFlBDjqczZ3CuZC+P0Glm2ntc
	 U1+mCz0T8bdxHYBZuI089/SJ53Tw86BPz5ryl/eZSReH5UB89CTSLJzD3wPd1ff+2OKcl
	 Wor6C+MLqT82roMZZ9Pe6pXLzz+ciA+icD9BHhnmmAjZrBi4Qik3IjlFw4mBBCQxU7Y78
	 nTmj86MBn0Sxzm8M/fcVsYN/Xupr5VwlDkVsJ/O/A4CB5aOAlWzRB4ylmqxuTys0G5Fgw
	 DvyidbhaE1XoCkZ5V9I5yvV9rFlWLTz0XNaVuyPbT+pWnnr5rIF5yRkyCXc0JaczIJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=dpwztVBS;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=UNQ6Wioc;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Gkvj7wPA;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704A0606A330;
	Wed,  4 Nov 2026 01:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 704A0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=dpwztVBS;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=UNQ6Wioc;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Gkvj7wPA
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40S8WI253590;
	Tue, 3 Nov 2026 17:45:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=+MKIg8VIx5XYV/oqvSmyPGwEOk/0xl2j+1mrjq0045o=; b=
	dpwztVBStfadmKpFiEejILypYUZhCdxNsDvGEsov1xrYJZeHe5MLOyGT0NvFjm3l
	CCGnDh98fKGmMBG8nzeRDgQX2mG9acIDyHV9eki3SZfMdjkdHv1JbWOIF60VTtuf
	HZeoCTw+Cra8wYJoPoZMAka8LL2K39tx6QfBTN1P8iwWMUHj7nBaGOPfdso7ZyUj
	wta6SAYNtcjkTkcfBWGuDfWShm7rcP936PPwL9WnsDPSj0XruWP+XQA8lHgRUKlU
	W5/xQTv8bAL80y5virotjZ4QLwz+YJPBov3k2MSJGsUuWHjcM/vzJGTrZFFWQUVJ
	aw1wgX/TIALtnfGIvqzExw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4hq5af3nca-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 17:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1793756682; bh=+MKIg8VIx5XYV/oqvSmyPGwEOk/0xl2j+1mrjq0045o=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=UNQ6WiocTT2mk/H6Tch1bfTZQGmZ7YIrLvlj5T2wsrHJjFuQFz18qnPo9or+GdTlT
	 g0bfywPBlcKgmFcgkUFBkWtNk0onBJbbB5rNGUOn/QTTa+wAIkGFZBrW5WiYzW9Qx/
	 PX3LEoPpOjOhXX0SQbFdQxMufUoBDApU1aXqIZ/ryHJ6agHmo/q3XxpqJ35oVp5Ar8
	 XoHks7c4MtOwFSiwOEgt9UaBX4m4Q6fLbMrpOzuRhTjqWxtxab1JQ7r7C1c9sZJKKw
	 U6VagzKPqwNFkWrI5QZ+24IQUJNek0tm6Fx48k+B1zeVlTWpWSnUifN+hxG7gWy51V
	 Lvv6TjMCh44hQ==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 877BC4017C;
	Wed,  4 Nov 2026 01:44:42 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E2859A0086;
	Wed,  4 Nov 2026 01:44:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Gkvj7wPA;
	dkim-atps=neutral
Received: from BYAPR08CU003.outbound.protection.outlook.com (mail-byapr08cu00306.outbound.protection.outlook.com [40.93.1.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id CBFFD401E4;
	Wed,  4 Nov 2026 01:44:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnIBlS011KExnMrZn5uHq8nhGak5lSIlJbClGW6ivETESEh5SkrH8xxDv2uU5UV9lbyXUXHVh7MCnkI1i7rvdEJyMZ64CC1OIRmFiPuvjIWkAnu5BxaODNlW4FT9wtSszW1ZW8VgBhIcjJRPvIShiDHeq+Nlg904d3riSPo99XN7u/u4O65q9HsQBZcM8lle760eX91FXzqxZNXFzPlFbpCUXIA6NqCelSfqLYBsBTL0l0EK2VGjPibDRHv+CMUbaDdxqIX4t0pSzTfP5Vt1XRSgcm0EWBkbNi2Av1M99s+VObp2qHWtCNYH7JCjFZ14YIzrFMoG+Rh8ooRyRcjNjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MKIg8VIx5XYV/oqvSmyPGwEOk/0xl2j+1mrjq0045o=;
 b=ipaXj8zfluDYamafwlBfFKCHJAUzJzj5/pM8EvhfSLG5wk3LaZAlV4rZJpqaR5qr6V1n26qPqw2m9XBb3RyvbMnkzQZZ3ZnwOwjHNHocvm+jsaxDEqsa9EYb+pgVVu8/PRzR6M0/BWmXUuz/LU9EoVraWnfQwuaa3HE+ojwRvCPc+PS4AsLEJGYpCDrIPsCCis1vGSdiCtcjWqoxxj/aiZtuVE+5SXwQf/PlR5eRcJfZi48haikLc3mWu8APX1joNPYd2VPek32xx9UPpz8GGV1MmiPIERJGT1makISuroHM5u7jwzdGgiZGNqI8nhiWwsRKjap4TyzgV2V7bCXkaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+MKIg8VIx5XYV/oqvSmyPGwEOk/0xl2j+1mrjq0045o=;
 b=Gkvj7wPA+x+SdD2PgbIe+LSjqcUzHUvepmmMNEuVDkcKx3CWdkqzEKXZ3c0TodUU/KuCZRr778XX+g2HKB/NUW1uZO4kIZqWn9HALcCHt+BaaVAzeXazWtHMTMZrkwllXtbtcO5H2maHeaorPfDEGHirmpezubaRjSlo8wL38Ek=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by MW3PR12MB4394.namprd12.prod.outlook.com (2603:10b6:303:54::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 01:44:34 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 01:44:31 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "michal.simek@amd.com" <michal.simek@amd.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 2/3] usb: dwc3: xilinx: Add Versal2 MMI USB 3.2
 controller support with flat probe model
Thread-Topic: [PATCH v4 2/3] usb: dwc3: xilinx: Add Versal2 MMI USB 3.2
 controller support with flat probe model
Thread-Index: AQHdYIYINCucKfOg1U+nipIygZRrH7cdOuoA
Date: Wed, 4 Nov 2026 01:44:31 +0000
Message-ID: <auqNHpX4G30716Tj@vbox>
References: <20261020112636.2661087-1-radhey.shyam.pandey@amd.com>
 <20261020112636.2661087-3-radhey.shyam.pandey@amd.com>
In-Reply-To: <20261020112636.2661087-3-radhey.shyam.pandey@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|MW3PR12MB4394:EE_
x-ms-office365-filtering-correlation-id: 63c07b19-4640-44df-5572-08df3a152bff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|10067099003|22082099003|18002099003|38070700021|56012099006|4143699003|11063799006|261026121527099003;
x-microsoft-antispam-message-info:
 qcOfw3FTPGsAOOaRaHUU7BAwCrwhQxDbE+o4K7uVnW8Cjcq5RgrKyt28SMpDlrZKxUQhvH9GP9oYUiRv4WHJ616Gn7+myQNOe65bteKKYcgBMF787WXI8/etJHzeMgJg22UlAhyS9ymz0G6a0kZ7Wc6UXYd8wNcjkS+JaEh9wbLQJohPIQUytkRLlYgsHfdfz5WXyKtTogJGiyPwEafaN/W37jPWLGL+ldeH9KnNq3q+1esYgN5T08UDCuLQL8fW8XM5iWANbPM+viD6gwBP/cLJ/FfxGKydq/OUkkTUMq1FGikmLZ7/ooA3ByffLtMckkJHb8SZ0bf3abCLoxgrBi7lkq5AM2ZM0y5SleXJVnDAw7qgm+NMsinAE6SGRd34FT8YWp4j9y4WrJczBJ3/LurtrCxd7hOcx8HUitJXeqbiyXIuAdOmjiY/5FwSem0kJ6MqwLt0cp4XWqXPITFKaarxC7gHl0kA1mvnE7RMme0iEf06YL6SbqBHiV3/pY7S/zO7NbXFhaNLfMv/z4K5ylWbcS+b7JwJVHDUqbKIew+XU++arRaJjPfGMcj/gacT2xe57WJ+2aUvuWUO96ZZcm9IMfbVrSqxduxwN+XucwOiEtMUOmGsPsdoyIThLcCW4H8Z7IE83Ji6ahc/11ITg4IIzb5NyqpNiw44smVGX2pv0RvmbzTRJ1K7+r6EvJhg92MIXMYkR+ofiqJDP4v9JCnTOEHSLGD8hS+Nrue8ac0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(10067099003)(22082099003)(18002099003)(38070700021)(56012099006)(4143699003)(11063799006)(261026121527099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bTQ0bmhLaHA3VjdGRE0rS3lpSXhIbHRMbzZOZzhEdmVKWWhuQTRDMGpva1Uy?=
 =?utf-8?B?QlpMdng0YjVnTTl3R2xQQWhsbXgvdU1rZ0xJZjdqYVVuS21UT05CSFZQcG92?=
 =?utf-8?B?Q2tvREJnRlFPTy9HWGVSajJad2NVSFpoYk0zejlYUkRqR2F6dVp0M0NJdTdm?=
 =?utf-8?B?TUhkbGJBV3JSZDViK0JSQjlwbkpYMWI5SEMvYmZxd2xETm12V1dpQ1c2TGVz?=
 =?utf-8?B?b21BYkliTmxHRDRrdEtaVlBReVJzZUhlYXo1ZElNUW1JS3FxUDRTb2NQdEt3?=
 =?utf-8?B?czVuQkd0Y0FMM2YxTHA3VEU1WFdWSHlCMGYyWGluNlVDUy9rejF3NkF6QXFG?=
 =?utf-8?B?VllpU3JrODJQeXo3dmVrT0tNUzVsT1F3OFBEbldrMG1WTmpsZXl0S1VhRVFI?=
 =?utf-8?B?ZDZ0cjYxbmtZNWxtUlgrdWV6citPVE5CZ1VnOEw4a0JQbnRSWG91b2MzYmFI?=
 =?utf-8?B?K2JBVUxCVnY3UXltU21CZUwwS1NnNnRHYVQ1N3E1NWdWaUtGQ3Zzcmxtejk2?=
 =?utf-8?B?ZlF1VlFZeGF1cXVOZGFyWERhcGtvMmpZK1pXTVVNSG0vSjJ4a1FaTzVNQktX?=
 =?utf-8?B?M1FuUUt2aVJaTFpmQjkyTHN1b3ZlNnJESUQxY01DTEhuVDJjNk42YVIxQUxV?=
 =?utf-8?B?Y3BwZ0F2MDZ2Q3hkWkJGd2RLNWZpVTJURmZudnlLZ2pIdmRFU3YzSWhRR0M2?=
 =?utf-8?B?b0RLNk5IT2RQdjdXOEo2aWU3dkx6djBPVnlCUjI1YW4vYTRzUVhpZlhtZ29t?=
 =?utf-8?B?N1JDSHVBa2dVNTlXQUw5cjJiRk5lL2I1U3lmSWJrdE5obFkwNVdhNzRnUlVB?=
 =?utf-8?B?bi9wZGtLMEZPRFpnU0tiRm1Bb2x2NmNZMFpzZjlGa2pvY0picmcrdCt0SUlo?=
 =?utf-8?B?VVlLZERaeis1MWFKalhSRFdXTHRMU3ptSzdFR3V0MjNKZ0drZXNOZ3RRbkFP?=
 =?utf-8?B?TEE4QjRJSVNKV2Y1TnJDWU1JU2tQckZSM204djZPQ1hGMmtsbGVsNkVSVlZO?=
 =?utf-8?B?RjNyTUlvNUFTNjJtNVhoUUNUcUdsak5QOFVUVzFoVlRISUtGZ0ZpZGZHZzdr?=
 =?utf-8?B?RVcyem9mbnJOSldsYWwxc1MxUG1LQkw5VHlzcDhYaUxaZmFBN1l6cXFaZkE3?=
 =?utf-8?B?THI5TndqZGFFVGhVcGM4K1hHNEhvYVBacjVUc3JGQmZmVkJOcldqSk1vNTBW?=
 =?utf-8?B?SlJ4QmtUdE5oZXZNcld4a1Y1NHp1aHZ5OGlXbzhoSFZ4SWZQLytLQ21DVmQv?=
 =?utf-8?B?dWlmRWJXOVlkTEZ5S24ydks4YmU5R3FBdmkrZkNLczcxdWxYeDNTMVA3akFU?=
 =?utf-8?B?YjFIN0VhbHg1THVFQk9pdi9oRlhFbWQrUXQ1OGlsam94Mll4d0lLOUdhUWVz?=
 =?utf-8?B?M25qb1V3SzFYaDA5SWlKSTZ5NTluM2wvSFA1VEQxWGV0Ui9DSHdTdm1wcFpG?=
 =?utf-8?B?WUFwbkVwcmNlSVNPV3VlZ0tFTDl6akMxV0EyaFVCSm9HRGlhS1dqS2k0ZHAw?=
 =?utf-8?B?RVY4R2ZmTXNiN2dZWXE3a1ZHSVN1WjhWYVovZjBIcFJrT01rd1pmOXp0OU1C?=
 =?utf-8?B?Zm5jaW8rV1FvQys2ank5LzVkTS9mV2ZUQlI0akxsQ2IwNGxBdTdFT3VWNjNi?=
 =?utf-8?B?MHh6OEJhM0hLT3Y4VXhYeEZyUlNMYnlqckl1YVF3ZlN2UStPZTI1UzNLQmRm?=
 =?utf-8?B?d2RtenVxK3VQYVFMYUJiRG5qR2JNSkQ1U0NDbWZkK2hxVTFjd21heDgzQzJJ?=
 =?utf-8?B?M0xyem8xclhkekRpOXh1cUVFc0NTcjJiY1BzVWdlVDRoOXkzNzU5YnZ5UEd6?=
 =?utf-8?B?MmpJcjMyTlBpdDB6L00wQURGVmMrRFFFUWcxeDNvZmg1NTYvbFhSOUNDVnNW?=
 =?utf-8?B?cE1USVlEcnorcEdtbWVvMUJUWUUrNHdlVmprNnBwdTZJOURPbzU2MEtJeWNs?=
 =?utf-8?B?VEVKLzlCZzFuS1kwK1E5UmlXWGE3cjVnQ1Q5c1RlL21ZWTZlOXhqcTZEd3VL?=
 =?utf-8?B?MnhGVTVpRWRLZnQvTmszbkx6TlRyWGxmZE1qTE51VFV0L3N3T1lpbnBXelBs?=
 =?utf-8?B?U3hnOGtoUk0zQkJBeEg0N0E0OW1uN2JtWlliek96QjFEd3RMS2QwNWtyN0hF?=
 =?utf-8?B?aEtVZ1FnOXUwcThwbEZZUkFobjc2SE1ady9lL3htZzFrWG5wSGtYUks4U2tV?=
 =?utf-8?B?QVh0cTgycTRvNlJsaW5WaTNHcFdyeXhmTFZIWEk4QUJBL0RyVUZGaFU3d1Nu?=
 =?utf-8?B?dEZPSEVhY3dHNjZIbnJjK3dNdzJGaGdXZ2FwRS8yNGx6UjZuWEhRSlZzR1Zt?=
 =?utf-8?B?Y0lzNzlPS0FidGVJMzBmQ1ZpUEljVFU2SnJMc0lUOURwTnVwUWo3Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC84C52C7548E84D9A012C5B0C873307@namprd12.prod.outlook.com>
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
	Al61L2hCYqJlqZ3o3rYfIGnVa+3i5MhLzwtQMcHd5p1otnvNwQrdgSx8r1RlJELvYkv04INnaR8W2GesXNyucRjbErh4BjCJZCJwp0kQHmM7K0C14CCuo2eW6eKX2IBYJlsUZIerohD5RwVscgNXImOsMs30gSHLuKuE9NVVlRK7MWuxghD25I0S05C4EtW4FQ8LUSiMzot+3M6/KoqV84TcuFVGlIvOI4gWBqm8jOABSfx73Sn4OuVbhASTrTu5Kc6uq+Xx61LggCJzhn2PtroqI0I9ks1ZCwXARw94xoBYpBPvWX9QECLPReriu7aL4PByV8rjzzVpaRnd/Wcujw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iyAY48RPNcEQTG+k8aT76m9Ja7ESjJB7lle30SB2CbudWwAE+fQ+wimWvsUHtredtQyDbH/Em6E2APULRlhrthqdPmuoOwRywVVQiX2rLXyAAMZc1SwtIs+q7MVQa51Q3tZ6CEWIjAyZD2kAsCJ2YW2l1YTFTpBcImZCjtE+FpRs8q3X8x4svBqIbtwVwD/vflFQZoEvQ07SoOjpTxrscBKyGir/TGpAH5GgW39PlVkAkke5tWl4r5apXsGILbKDOST+Ff2yJSJrvoxzJo9fgivKUaknS1CMRCmAg6vkrFR/A2/zZx7zHz+drvekTSYsbzHMzljOaKzoOygI+dLB7HtnmgQFp1oVeOjUAqPJx6fHiHta4WK7eoyXYUcJ9SsKCJSKogKx3qDBF92FVtRLeIUGbVp+lquRoxILOskQJnmoJTr3mZZjQUFuE5nV5E8PNVIBMlPdIqyQ4KHmSAGmPQ6FjuG9OkMqZZyU3UD0P1y9YuNdT/EtQezkrJOJs51KLb+fyuxWnXhiEFMZ4TYwU+C7sA2vErTUeA5HDh/xJEGbYZKWN1Scfwr9zyC8dMsw7l8arIw5qOdRbzAJEVC7ISKjjjjiUnOPMpJpr0dqPTzW1xsfRentpIML7PhQ4GDLPvQFzS9Yyvnb1hxhX9b2FQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c07b19-4640-44df-5572-08df3a152bff
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 01:44:31.6273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WShGbNBnPhzoH4wuxXSyePM5RxmAI4cxzHJMRv7JFceqF/d5z0IxNLfdM+wdTmTMUjcncctojEVnJR1DlUqOsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4394
X-Authority-Analysis: v=2.4 cv=XN2l2ghE c=1 sm=1 tr=0 ts=6aea8e22 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=1Ln9gOzTnKx_K-mpL7UA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNiBTYWx0ZWRfXwbQJrTj7kYTk
 abLSD7fqm5YBEVncL1C4TaDDWpQ1iq2YL5XffmKXzROQnCUDr+MZ6Nn8KZTmfmNfQBnaU6cNcam
 ml8O/eJGcae3NXpoI/mlK9zo3j4e+RQ=
X-Proofpoint-GUID: J5HRCAnbEbGTHW34HQgIVNq8dvh20iHW
X-Proofpoint-ORIG-GUID: J5HRCAnbEbGTHW34HQgIVNq8dvh20iHW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNiBTYWx0ZWRfX2grqxL8Wj2db
 OZamMzXqtlHjaOQX4nj1MOM0wSEvQvNiNq+ulDJvZ9Zz0XwHn6+7HvCPxyjcvzGN05eOV/f9atj
 oLl4FbAcsGqMCGIscAgaf/+aH8IcqLqnTfUrVjChNZtuaYt/PLIgUk97OzzTDJ150DG3Le6ECui
 loe4tnX3rCJbwkznUGSpz8fIz4aLNWdyg/Y7rXKs8d9BJ57mB8lFJNkdbnPYQu9ZMm8pwYdu6y+
 /a1TdQNof9MvkcoPKum8YMhVg15t7roO86f6DrTk2ZL74Mtdl1pYLpcbbSUYzTpFdqyVfHBFr9k
 FAuer1B5RvtQuNEu9LYQxxPH4ZKLErSc4nvZlhZIE+phssxHVCC5LJE+K9F7qxXEmHeO2TsKVc7
 rXgCmWjKJooij6sovV3euzSeuQmDb5IT6X2VTpfOscmNhLYMDC9p3El7gMrm22wXgOSBIBvRUOu
 ahoNQyyzAY9RIMcR6vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 clxscore=1011 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2611040006

SGksDQoNCk9uIFR1ZSwgT2N0IDIwLCAyMDI2LCBSYWRoZXkgU2h5YW0gUGFuZGV5IHdyb3RlOg0K
DQouLi4uDQoNClRoaXMgZG9lc24ndCBhcHBseSBvbiBHcmVnJ3MgdXNiLXRlc3RpbmcgYnJhbmNo
LiBQbGVhc2UgcmViYXNlIGFuZA0KcmVzZW5kLg0KDQpUaGFua3MsDQpUaGluaA==
