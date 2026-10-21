Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792546889;
	b=KMnf998/XuLW11vTqC5hlokHYAjSsM4XP2PB1XEoCPPZwY7aNmmE8xpNgvyFzplBXd1H
	 jX0I0cI9eHtQvihS3MBgpWF/r7mB3GFLlAQ/IDA7DI2MXHeUXyDOJ0/RscuHLp8NL+kBM
	 EevApbCsJMdQQ3rTsK+95WSTQf+hDrQJuRECAiMrR5CDek2sq5gYFL1/ui9budu8WULaI
	 6hhuqzSotMgTxhEHDxmtK+58v29mSbYVewikvMy4lFZtr3ZK4fTSNc4gFDLYd0L9UjdWj
	 zPKLqONiGBCQlHq0UQSRNgwn6DAJiEVOxSkT1U9/w9FAEWjHh6oHet28czUp7n40okA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792546889;
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ntZaL9JT4ljztCLQUL+852OJyNMxuoHzLcZt7YNBJKg=;
	b=Byh6rPqWMbWKyRzQ3gtQPkf4BdwOOP335rKkFMVH/6xNL01JDaC4T69Zo8CIts3eLtGM
	 6jhcH4eiF5uhqye8z0O+u5K5IBMIYuAQ2SK63+qzpK7zPdwpUuUafrIsCOuN9eQMcow+l
	 thIrx273mv2VITaDpMalC8Xwl7wJOSABiGHVuXbraFuW9y/EjIPtjbX6otfUnSUZRxfkp
	 krWT+v8xmhHDF9/hPdO9oCl6AhDQcSNul1Yo+HdvGToSgd/KV8qRB/mz21uuEXc9YCyDd
	 2N8Gj4t9TDJKSpWCpHsdvylT/lcRol2SoK+toXXxYS8dx1S3P23kb62UqGp/e5g5bCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=E1171E0g;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=L17zoLT8;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=dU1w30XV;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0C4606A31A;
	Wed, 21 Oct 2026 01:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F0C4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=E1171E0g;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=L17zoLT8;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=dU1w30XV
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKwutQ3684524;
	Tue, 20 Oct 2026 18:41:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=ntZaL9JT4ljztCLQUL+852OJyNMxuoHzLcZt7YNBJKg=; b=
	E1171E0gCMoq5JSqpSX7LejkHz0015nrypQikcOjJTTBBQOEqeRUKQzl6eWsPPao
	JwPzgzPqG9kvIXDJNkWeJTENfYx4noHAxyTFYeldGW6JaQ+uRhKpVhxZZCHlNmyc
	Dd2xMk9f1hPL3lWvqQ5Qk60J6f6Cem8LA8kR6PP9KK+sxJma+VRHZbh2YfRuoWdN
	D773zGoilUDFNun3EbKalFv7NVDjS7wWFSr07Fpa3JvIC7T4USceJqY0uDsMMutR
	lehz62tKPYfMSsd+IAQzkyyH8EkEEa1S8qspQCyXal6xZnboCNGPdaWjHSB5NQSw
	XbD4M5DuaxnWpwMQbTNG9w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4hdw70gjyp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 18:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1792546879; bh=ntZaL9JT4ljztCLQUL+852OJyNMxuoHzLcZt7YNBJKg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=L17zoLT8dSFaAA5+3aRsVWCWlHxRKRQaIqg1IGv/XuggsOmo/jHMzovBttNilNexb
	 c/vNayQ0u3Y74CXmq7A6Im3VCW1f5mB3BmKuxGWeheJ/FeeWF8F0zv8h5ZVjLy57qN
	 UUtjgy0PcJqfGQHxWyyaUJerZ3JET2kQOtFLk75lby9NOSU7r4Op8ilTyfFgDEcJ8H
	 YQumfKELvIACOC5/ajz1iO1fKFA0utc87VfvghKK8GV8JaNutnyqefdhiEngZxXzSP
	 Ms8+wrtaa5bQwruzRRDlEPDm19vFmXZrU+sUHaz1TLZ0JxWozBx8ls+4kvg7MJJrb9
	 /Wn5m0xWbxMJQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3E4DA4017C;
	Wed, 21 Oct 2026 01:41:18 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 9A735A05EB;
	Wed, 21 Oct 2026 01:41:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=dU1w30XV;
	dkim-atps=neutral
Received: from BL2PR08CU001.outbound.protection.outlook.com (mail-bl2pr08cu00107.outbound.protection.outlook.com [40.93.4.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id BA95A405EC;
	Wed, 21 Oct 2026 01:41:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0pb911nQHVI69Y0M8pNUv+vBpjlwRp35dzilfu67IYZIOF+TWraOW89SH4w+KgbBnoNjy6yycXjYiTkgXcw34kgqfI8e3DBCN6EFMedgt0g7f48TmY/JLGjvhvoBwRpM9/Kh4gKrQV1opukj9EjEKObAVseuOP4fSzm6raip+GQFIvPUD4ZLkbTJSWzoWY+99Jxc5nzvnzPzImX7Gs+UQ0fRpo9+KUZ4ps9I184ay21UqmkKtV9BousPtloIo2AD9pyCRMrCJlLhLCDU2tG2wvtgAjityToNSnIlrDYEPCbABept2kb98xJNHSgVagYW2Gaa+BMlp8kjzBG+8ZEMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntZaL9JT4ljztCLQUL+852OJyNMxuoHzLcZt7YNBJKg=;
 b=w4j1iLDQjgl6G+mut/vpD1iJblZCbZ0AzI/Zv7skFzu207RhT/o4MZmLHK5EJHe5HOTr0vf6IZhFlPa85Hp+Zb6l8zSphSa3e5nmyf1F7G2vIClJ5kh0fZPp+9EinDXYr6Sxa75ajupD+T9TA+DT6lnCbje7Eav5zNHYlXJ9V/rd/rCDtJi1dRU4da5qJqAeCI2Irbox+uSpieakimvInTo9nXfgT4PxCKMWX7kAnaBbIhnkfxAKEbJMZb1ZfaxyowmgBlwwDA3n3psvUjciaeKIM/6QCKYrR5vgp7x6FXyp7wdYFh99Ylesgr2cX+l9ZnXtaX3Ki2SWxVZ+lUklGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntZaL9JT4ljztCLQUL+852OJyNMxuoHzLcZt7YNBJKg=;
 b=dU1w30XVFhPRJVn3HU16STieNcz3vJArPPT/OTCqf1PzSu1UqL+N/3EfuTITjl1b7rDAwjtABraDy2UlhO3hnhMp4YEmzszZQxDA9GyD+tNfifiNvLKgZ7Mrj6o0RSNkw4WPyZZ1eI6+HsqJ/Hg9weivCXx9bMxE4X9MKDi/VYU=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DM4PR12MB7552.namprd12.prod.outlook.com (2603:10b6:8:10c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 01:41:08 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%5]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 01:41:08 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sven Peter <sven@kernel.org>
Subject: Re: [PATCH v4 3/4] usb: xhci: Use update_device overrides for tunnel
 reporting
Thread-Topic: [PATCH v4 3/4] usb: xhci: Use update_device overrides for tunnel
 reporting
Thread-Index: AQHdUCrnH/PZIvXGfUuXh6r9HvCqHbbq/FwAgBDCVoCAC5tzgA==
Date: Wed, 21 Oct 2026 01:41:07 +0000
Message-ID: <atgXLjTYT4sFfaYv@vbox>
References:
 <20260929-topic-dwc3_tunneling_state-v4-0-63e296346d57@oss.qualcomm.com>
 <20260929-topic-dwc3_tunneling_state-v4-3-63e296346d57@oss.qualcomm.com>
 <asBLzaNbnBmG3mdx@vbox>
 <96c4e044-151d-4fd3-9d7a-2eb2b4870a89@oss.qualcomm.com>
In-Reply-To: <96c4e044-151d-4fd3-9d7a-2eb2b4870a89@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DM4PR12MB7552:EE_
x-ms-office365-filtering-correlation-id: 5af45f23-9d99-4299-4b6a-08df2f1460d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|261009223027099003|10067099003|56012099006|3023799007|22082099003|18002099003|38070700021|11063799006|4143699003;
x-microsoft-antispam-message-info:
 Tb3G/04yXBYEJb/szG/rs+LUyNKu+Jg8eLsB0ttA49OV1zHlE+jAqYtDumt6k9LzSJ5zj6Bh89EWk4l2iFGl9Q9nd5KMgbp4AJvU+u7C9EbBx8YZEF79McRh5i89tMlr9/WVz3I+UURneXWU498LF4lyKicqh2bzMoHXKWXWFvhMtMs4OGNp78dAITWN1lfEzVSP92E8z+yfTu66jI/pv4mu25ngurUk61sq3lbz0s5r0smT2pXfdOTU4ng2U3TM4oHJIdFWbRdmElddrC8syTWpDRllfo/bB9xPGialp8gCSHsHBmRL1ThOP7z2d/9uCE6iL1Ol1gU90u6TPIlDgdA0u6rhMQ5Wuv/+MOPERTCrvA/EdQqzj+s1Qf++5FFZ02ImsKwEPapqOi1MAXXIc0FTcOpDW7NHtfIoYKOexVuVO23CSJAFjmFHvA0quql/yemh21MRiQS8ZJT58ISJwTg4s7RJliI8iYrsHVBN5t7UJBWZqC0ZdWdUGkr7AvhJf6cFauzWJBoHdvo/Zi6+YRBDzdljqwOJfiI/fSI9EGbuaTHbGFkwKXxFfAeiccOFrQfAvXsibjF1106qrDWrK+CcujTi1oPMf2qTucZ+WLfpVnkOP6HdfftEcgmaKFeynRz8Z3w5Hab/VC9vd56x6ha+3fc5nwnDHpqKLrv88DClR/r0Ktiv6yMHXf34DAAE9yqUNCK4hqJ4D5nd+US/5JU2HUE0CQ5iiz68xjd78Hw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003)(38070700021)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dDRwTFNCbW5GSzFENU9Ycjk0RUpVUkM2aytyaEl1aTJQcElKMk5tRWFZdU1a?=
 =?utf-8?B?Yjk2UGJvS3hJRnFna3RJTDJ6em9aRVloSEYwUWFwTUdPa1VEUm1haTUzY0RM?=
 =?utf-8?B?dW9abE13VWREMVQ2dng3MmR1WFJ2cnZvL3N2djhqaU5uNHhQRUFUWkZYM2xy?=
 =?utf-8?B?Ylhib2FNQW5sVVpoeisreUhiamtmN0Q5ZGc1SDVXQlBaeitlaG9RdnBqcVpG?=
 =?utf-8?B?aGQ4QksyUmRzeHZYcXVoakxnN0dTNDArM0p6L3R1c3NMZlhQRXNzNmxmVERx?=
 =?utf-8?B?cnNNQ01QWE41Mk9NaklGWElKTjd0ck5Sak1DSzZQK09wWDJmaXZzMFYweGxI?=
 =?utf-8?B?aU1mcVZTblJXcXh1UE02OVg1L0dTZ2tZcFVoVWN3RzNRSEdhT3NpWkhJM2lh?=
 =?utf-8?B?VFJGdDdJMktZa2VLSHdzbVlRZjQ3ZXpnS1dYNFpWRnZPOGxzM3ZLSVRZWEsw?=
 =?utf-8?B?b1AvK3pab3ljZTlQdFpQb21Fd1h6UVkvM0RraHhrZmlNWFd1bkFNY3pPaG5R?=
 =?utf-8?B?RC9BNnR3bytiUzRmSVFUTTlObnRvZEp2VWcvTzZEdUxaRHdJYVdMMy9jSmUv?=
 =?utf-8?B?RlBlUGNkZ29WcXk0d2ZLVllqbnovTGNrNDNCbW5JUEZOcTVkRzJzcytMeW1Q?=
 =?utf-8?B?eTlsRDFzOEUvTXkvQXJnU3BFeStSd2dzNGVadS9uQ2ZMc1VuNERXNmNDVUp3?=
 =?utf-8?B?Y2gxcnpyQUpieXdraU5qazNCajE1dm1zSGk0cEI2d2lPbHJFQUo1Zmc0RjNG?=
 =?utf-8?B?ZDk5Rk0veEQvbDNmbVdiUWJjdUVlemh1QS9KUSs3enRQRWpoY2x1Tko3bkRR?=
 =?utf-8?B?NkZRdlcvQzhEajJzODJGby8zcHRWanBqVnZsb1ppSzR5SEdZL1QwVHB6NlZj?=
 =?utf-8?B?RVMvNzFEWm1jdmhzSkNWcGtIWlJLaDM2cmkvOE1QUzJlZFFFeVIrSEZGZjdD?=
 =?utf-8?B?YnNhTWtidFY5MW1qenJNU3EzWUEwaHVDYlJ2d1pkS0tCZHkxei9pSno5OFl2?=
 =?utf-8?B?Ni9DbTQyMzRWcXV2Q25YSitnOGRPS24rWW5xT0xkZm9ZQ0paRUJQWUsrVzN6?=
 =?utf-8?B?clo3WTBXZS9BZzhTOHRNai8wUVZ6cU5ScjkzTTR0ZHE5QjhtWUR2VUQvcWpK?=
 =?utf-8?B?NThmcGE2SWxVeWNjVmpQMTg5ekIrMlNTQXRIZXNkNEM5djZqNHBhalp4ZHhD?=
 =?utf-8?B?UVVLaEErK1pRdW12RmhNSjlJaDExWUJSRkZGQ2tjcEc5Z3hzQnpwRXdjVHQx?=
 =?utf-8?B?YWxvTUpqODBDZlJzM1JlQjdrRFV2Tkc3UFdhSlY4MjBCNWtzOFRtc3VTc0FN?=
 =?utf-8?B?MHpxeWgxcDdPeGdmUjIzTWo2YktqZmoweGwrUE9vZlpiamdHanY5a245MWRo?=
 =?utf-8?B?cXhiWXRUaGg2WVYvbjZnOTZCUXg1TjRhWll2NlliZzRpVzE3TlpnQ0VCMDJ5?=
 =?utf-8?B?SzdHbFhMTkNDSW1KMDZrVEgzRUNpRkZyRkptQ0dpK0IrLzFWL1FmY2hwV3ZJ?=
 =?utf-8?B?THpTZ05OY0pkbHNHREc2Ym1yNEhaQVZHMC90TGliMm1uUnBSWlpKeG02K0Fr?=
 =?utf-8?B?Tms5Q043dXM3Q3Z1OHAwYklTQllObmxYWUNpUDhlMzFUaENHQkRXS3h4dTFj?=
 =?utf-8?B?UGI1L0t1aW9uNzFWanBHcjlZQW1SMko0dWxaYnZKeDF2b053d2NWREtudTg4?=
 =?utf-8?B?N3ErSENITmRvZjhPNnBsQWQ0NUNBanBVOXl5VGxqU2VKc0trRlg0ZTZVRDBi?=
 =?utf-8?B?TjE3RDA3VHk2SjR3QkFaR0FJc0VaTlRQdGRWQW9FNVpnQ0krd24vQ1QzSWN1?=
 =?utf-8?B?Q2NybWNETVJGaGVtTWtFeTlFTGEwUTUvVHJGd2drQ0I3U21BQVhWUEtWREow?=
 =?utf-8?B?YWtxOWxsR0JEbmZUcWNoWURRdEUwbkNKKzlqLzEzc0o1OXBLdjE0ZXVDa0Jz?=
 =?utf-8?B?YWI2bGlVVitTTHh2ZWJqMTgrR0JCeFU3bmRXV25mUWttaWZuc3czVVJOT0JV?=
 =?utf-8?B?OElQOTRzekVwdXZIbVJheVY5ZVY4QkdJaEN1WGNXUm82T1RFbnFrejM2Mjlu?=
 =?utf-8?B?YzNaTUNxMWpLb2tNdmt2ZE9ncW0rOXBrNC9yRzFoRzdROFlIQWNsbmFDc2RQ?=
 =?utf-8?B?RzRJaGE1dDlxRVZIdU91TFRWb3RmM0RIaDJTWkxoclZtVjhHUkdnMXQwS1FF?=
 =?utf-8?B?bExZVXc1OU12NWdLMS8wZ3VMckN0WlZKMWdYUWZPY3NxeTEzSDZwdlpTNXAx?=
 =?utf-8?B?alpFc01oUzZzWlZxUGJNbkJROVFNRHhSWU5vZk9ZeEswQVhiZVR3Q0RCbmdH?=
 =?utf-8?B?MFlZcFFaakRZaXRHZTBNdU5mdFlsb2JXMU9pUW5uZ0t3c0VIWmptUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A93BF62183DF6478B40E7535636983A@namprd12.prod.outlook.com>
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
	0tph74rVD0HX6k0xmn+REtI4/nl1vHQOEsxbxBdB+mbCpntCE/CGvtLQmk2Kve82BSio/AzhyynYdSQJ8pJX1WFqqqd0zuKgEQMFTV4oRQqV88iVMa8Zsx3ziRQKDTsPkyF0DQeqOaf1f+cJHKqIH7WrL2q9wuqJcflNAXPHJk1+M7cXDDe5usdkYUrD2CaMaU8iVPiEzdeqMjUmoyONYP0P72UfXzK7PRO/LSDfVAFLhxZ14gHMIcfYX57ch+wthkNYanFghW54F6OUqI8EgSXrTlgl91SI+WhTQHE7W1myFqixRSnZR8Z6nKJxdDfNFwQYvohCUE3OwZULGW5Hvw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	foIqPMePavJEItY8rUF7zxmSE2CvU528QApDg5ZNh7/15JUhWE1Q9nNTDIyEBjj1m59pPMouQQbzqJbU6lzS/9EpfORoIDMLmIuBM2/XjYDnOJhClSagOXWyNDFHThoGld8Jx4oGnWpcBzbjnXJmlaZ4Pz1+w8Yc8qVObue6n3HaZUFEaQjnH3MVxK7mq7Xm4BEhCKSiuHe3GtMW4sZ7FGhGGfwcK6UHAESjLVYvHfHgc0Mrhd+yeaQB9xY20ynRt76cm9Th462sUhAt6JmkvxhgGk4cyFsLqzcO8OI52CJ1/gIpQNliG0wuEPRp2XIiqDnV0ODtwYkcxv7DTTSEcAFdx9IO7aDVaiL8n7XIkZc3ngtiCu6/a6yuafSlOwuXElmcjA7HZ6FQD/C1XSxdmegN64KQDoRJ7tJVvp/+RQXkC37Y6S3luTef5SE7aw7tIwWIWo96AjPibJ5lW5t63w3I1VSU+BsFBzeWxJIThlFk3qDCCccsYIpVOcKN2sfrcLwisfuL/r+GMSnDh2l7d1dcInwImF/g0aoZf/0YrFoW/j6Wb/VvNVgfa+G1Wj37zoDz1fflEnQC9D4N099/hK0BSLsx216sZkd/8INTu6cW9hbO5t3NgN2Z5i/wXMcZL8aw1M7v2bCvWlg0mOd3ew==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af45f23-9d99-4299-4b6a-08df2f1460d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 01:41:07.9748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p7GJC67P2CNWHjvDlTlL51e3OkzdKqtPS2Cn9J0hthEf9bHsJe8tC+xX6DL49I7Ek9fvEDsQ0h4VEg9BGHhnEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7552
X-Proofpoint-GUID: vhZoVjE57WokifZ4oojA9DK-lhUfWC3O
X-Proofpoint-ORIG-GUID: vhZoVjE57WokifZ4oojA9DK-lhUfWC3O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAwNiBTYWx0ZWRfX5bx0wPV9rf58
 pnZkbaWxiiRubF/Ob9pxBFSZondBwxR+zqv7ciZqng4kLpv+n1x2nvLXsCTc66CwNrwyoqQd85t
 80RvEXzNGdZDHF0MHc4HDyJUcdbAqaOrnb5GxZ57GYdkMFCrN+iW5USxwrvsRbsPWoxGtyM5Rna
 SST4nHoflvK2Lk0UTBavYH4en4Qb06QPqb8EFapdgBahKylGxpmBW5MKS4HrAEUpYPa+Ofyw1NO
 XS/9cUoHjrKFYbYOYF7NhE1ixm2QNue/uOZTvSOFaMT1Oi7/926Br2bleUc/jZyGDv+anXcUoWB
 EGmc536T4nQg2DBW0PaYK09hJ7wpod7YcWzpstlPxTxQBls4p3Ml78H9IeWgf7maonR1XIrCmzZ
 IQFjrhclRg1HfoC9UJjXEAUcWIvUypj714eeJdVh7RvviMNXuOmlhkoJ6i9aH+Vc1YYeTmDXARN
 STt0ACiC3r71xX4irAQ==
X-Authority-Analysis: v=2.4 cv=E8RYNqdl c=1 sm=1 tr=0 ts=6ad81840 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=-QxJn-NSScS9bujzFPoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAwNiBTYWx0ZWRfX3Tmtr8mX+Ih+
 +TWS33wC8lxr5S0pdEV/PKav+2Hlcs/RilHbA6qMBF67xqKQ9Z0Cpkox4YvukgFCDiIAuUCYb1B
 dz4eQUHeLtZ7aUC8Mu77E0aCDScxSFc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 adultscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210006

T24gVHVlLCBPY3QgMTMsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+IE9uIDEwLzMvMjYg
MjozMCBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIFR1ZSwgU2VwIDI5LCAyMDI2LCBL
b25yYWQgRHliY2lvIHdyb3RlOg0KPiA+PiBGcm9tOiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHli
Y2lvQG9zcy5xdWFsY29tbS5jb20+DQo+ID4+DQo+ID4+IFRoZSBUaHVuZGVyYm9sdCBmcmFtZXdv
cmsgcmVsaWVzIG9uIFVTQiBjb3JlIGRldmljZSBsaW5rcyBmb3IgdHVubmVsZWQNCj4gPj4gcG9y
dHMsIHNvIGl0IG5lZWRzIHR1bm5lbCBzdGF0ZSB3aGVuIHhIQ0kgdXBkYXRlcyBhIGRldmljZS4N
Cj4gPj4NCj4gPj4gVXNlIHRoZSAudXBkYXRlX2RldmljZSBvdmVycmlkZSBmb3IgY29udHJvbGxl
ci1zcGVjaWZpYyB0dW5uZWwNCj4gPj4gcmVwb3J0aW5nLg0KPiA+Pg0KPiA+PiBBc3Npc3RlZC1i
eTogTExNDQo+ID4+IFNpZ25lZC1vZmYtYnk6IEtvbnJhZCBEeWJjaW8gPGtvbnJhZC5keWJjaW9A
b3NzLnF1YWxjb21tLmNvbT4NCj4gPj4gLS0tDQo+IA0KPiBbLi4uXQ0KPiANCj4gPj4gICNkZWZp
bmUJWEhDSV9DRkNfREVMQVkJCTEwDQo+ID4+IEBAIC0xOTgxLDE1ICsxOTgyLDE4IEBAIGludCB4
aGNpX2h1Yl9jb250cm9sKHN0cnVjdCB1c2JfaGNkICpoY2QsIHUxNiB0eXBlUmVxLCB1MTYgd1Zh
bHVlLCB1MTYgd0luZGV4LA0KPiA+PiAgaW50IHhoY2lfaHViX3N0YXR1c19kYXRhKHN0cnVjdCB1
c2JfaGNkICpoY2QsIGNoYXIgKmJ1Zik7DQo+ID4+ICBpbnQgeGhjaV9maW5kX3Jhd19wb3J0X251
bWJlcihzdHJ1Y3QgdXNiX2hjZCAqaGNkLCBpbnQgcG9ydDEpOw0KPiA+PiAgc3RydWN0IHhoY2lf
aHViICp4aGNpX2dldF9yaHViKHN0cnVjdCB1c2JfaGNkICpoY2QpOw0KPiA+PiAtZW51bSB1c2Jf
bGlua190dW5uZWxfbW9kZSB4aGNpX3BvcnRfaXNfdHVubmVsZWQoc3RydWN0IHhoY2lfaGNkICp4
aGNpLA0KPiA+PiAtCQkJCQkJc3RydWN0IHhoY2lfcG9ydCAqcG9ydCk7DQo+ID4+ICB2b2lkIHho
Y2lfaGNfZGllZChzdHJ1Y3QgeGhjaV9oY2QgKnhoY2kpOw0KPiA+PiAgDQo+ID4+ICAjaWZkZWYg
Q09ORklHX1BNDQo+ID4+ICtpbnQgeGhjaV91cGRhdGVfZGV2aWNlKHN0cnVjdCB1c2JfaGNkICpo
Y2QsIHN0cnVjdCB1c2JfZGV2aWNlICp1ZGV2KTsNCj4gPiANCj4gPiBXaHkgYXJlIHdlIHB1dHRp
bmcgdGhpcyBpbnNpZGUgdGhpcyBQTSBndWFyZD8NCj4gDQo+IEl0J3MgbGlrZSB0aGF0IGluIHRo
ZSBvcmlnaW5hbCBjb2RlLCBiZWZvcmUgbW92aW5nIHhoY2lfdXBkYXRlX2RldmljZSgpDQo+IG91
dCBvZiBpdHMgY3VycmVudCBwbGFjZQ0KPiANCg0KT2suIEJ1dCB0dW5uZWwgZGV0ZWN0aW9uIGlz
bid0IHJlYWxseSBQTS1zcGVjaWZpYy4gV2l0aCB0aGlzIGNoYW5nZQ0KdGhlIHZlbmRvciBvdmVy
cmlkZXMgcnVuIHJlZ2FyZGxlc3Mgb2YgQ09ORklHX1BNLiBUaGlzIGNhbiBiZSBmaXhlZA0KbGF0
ZXIgaW4gYSBzZXBhcmF0ZSBwYXRjaC4NCg0KUmV2aWV3ZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhp
bmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmg=
