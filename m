Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792547316;
	b=BQWPxhvwsHCag98chbYUd7/6lYf8VX7sIWXtmQhlVRiNO43UNC3oBTu3gc/I91VZrIoE
	 Nqc6e9+i0MCi3Q7Y1Y1Tao06QidGIkSBrh0g/yxH+C0rOQ72DMomZ6/7sM27t+vQ6VIkA
	 wffUfrtiPX5W/RZf8PiHMUHGS8VtXop8WF2D745cP0XSuvAiBzJianYP7iMtBE/zMJha0
	 st1dKz4nCCN1msHm3T12gFkZ1IhEgHVAOkwWKBL6vUBGZoxSfFS5Astq3oLqzynM4hiHa
	 i+MB5y6BUNMOiUO6Wu8eedetgtLX742VvVAj/yVrWv7hDzt8J09/JQou18WCN3mORyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792547316;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5wXYqbpV4eiK0Jo/+O2UItxg8ACUJZetApzn2qtZrEQ=;
	b=Q/HzwyiEkIRiSKWJxSSy3S73VoMuSCmifjyvUy4jad+Jo+FfLOyTWfY9hUBkCRl+M9ZE
	 KV8ptSSu5r/T1zMJHuyf9Pjg5kh93oPy/wPXlJ8OaGEv2jKzigzit0IP0AQ0QT6DrlMS9
	 hTFClbSt05HisAwCLQ2Ejc1e7r1G2JQpZwcuHLHHl6qeySqthbnSW5K2H+ObTRkltDzX5
	 EWijERZ5Rz0zej6eGSwG7CtjpAPfFXdrRCL0OVQT9AlIRlmzviCTDqMtiyHBLOdYPVBVt
	 OwjOd9YzTnDxTyqgCWE5akoCtl2bbeLZ4oIis2h2eCQgH0geAxbeEydLGe4qSN9hoKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=XRB6rIcE;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=PlrSJ5vv;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b="bj/RpRXQ";
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA62E606A319;
	Wed, 21 Oct 2026 01:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA62E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=XRB6rIcE;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=PlrSJ5vv;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=bj/RpRXQ
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKvpcX2052420;
	Tue, 20 Oct 2026 18:48:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=5wXYqbpV4eiK0Jo/+O2UItxg8ACUJZetApzn2qtZrEQ=; b=
	XRB6rIcEhwe2yLnEJqYcfMiUKAFPcsvqfp5B1IPKssDDAwbHOnQziCxjQmlk8RKn
	xpozkvk+ObwGdBkGrrha+rVozUlen0X6hVJHlp+qMc7+GVRBgTxG4lDium1v0jqp
	i09fOHzfGUuIm19O8rzq33/snUkElqmcNCKqridjwmYS4anbQkpFasht5VZhAv81
	8ypT3MqAXBnx9x5upIHZUzwIBnlBUZfVsfgAPwWSgPXdQkucpMlSOELARkTjZCNB
	NVETwdwb59v1ZK8NgS7lFBEQANv4HgiCs4m2cWJHz/bbjAROXHOjjp1naXHbBvw/
	SChK7ZP0u9sICJXN4Q66Xg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4hdw6v8u68-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 18:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1792547305; bh=5wXYqbpV4eiK0Jo/+O2UItxg8ACUJZetApzn2qtZrEQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=PlrSJ5vvO9HDZktzojR/8KIR1qKi7+mXxn396fD9GINi7c124ViD5x9KF+Wp/Etmg
	 J4bB+/c5CT10/IfwSbyjpDh6CLf2iC0E4tHEy7EIU65GQYOqndmu2JQ7sYK+Yy0osG
	 FBCOdWx7JWsYYJtt9iYGQhZA3nb++bKKkCWP0yvMuiSmtYEWY9lh7b1YnT53yqCa9T
	 jysZNNB2AIkr1V5pHfBMjDJY6IwRbwRKbHGsNLIZKwA+558onRZ99kZZhgnKWrSJCk
	 t0joxLNDD+xIzepIBzfP9iH8DlJvuK/VifWQFIPgJRsF80EOG8es+Ofy6GOAjGys2g
	 bNQyhQKd93DcA==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A91C5405E2;
	Wed, 21 Oct 2026 01:48:25 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 56887A006F;
	Wed, 21 Oct 2026 01:48:25 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=bj/RpRXQ;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00306.outbound.protection.outlook.com [40.93.12.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 059D6409C6;
	Wed, 21 Oct 2026 01:48:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIAotgcAVi5ccg9lBI6tF2ynepS9RUSqpKwzzVQ3Pae9G9f0tW6n5vTytFBE3EFohwd1lQmE5mYJKhtfEVKGYXbsxzJNE9XHKb+pvh48Vx+U3x5V9oldbSF0WmGTWKtAnqHBEiX6KnoE0GQGzpXl4skkdwEq0Qh7QW7Tafs9rcRK3yi0fmWLO5VxJlHthKyNhcovwL1t3wYyCXElyP3sgGGl9uwrf2P3rM8BsB5b6rjQwsZ1uf0ea4FJwfnwnpF7YB0CHgukaCTxHMneY9EEnSHiKRKu0wnxRbUYfjCv+ZQEJfRWe5T40xXDEHYUFxFq7sVMwdjXpXF/Y24DoXoImw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wXYqbpV4eiK0Jo/+O2UItxg8ACUJZetApzn2qtZrEQ=;
 b=p+RQ2IQJrRdoGf5AybrhYJTddzR1CGgZ0TMMpqcPWVI9hqRCrI1tjwDy/53Z5dGjjOPkibtNA1g1cABaTA9NRVohxkGHK7fiEFoLAiDnZ9DqP7alcTf1l7epY/nYrJ9L3vAW0cZa8kLoJHwvdzOMJwugKOdPwJv0YCV7I9OEZO6fG44LKvfhOWNr8RPFMSFO26byGKMxAjAS81V44R0vcptEPZ8kW4jIPz1bG0afOe7imd/QfVDkvS4WCumgJLfK+co7+qkQ94q2E6Mva57g1VXl6X/H9bm7EiMJdojyFaoD1DGi2PoCgokWDvcyKZ4wnIIQJ5iLeeSXbsaCdOes0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wXYqbpV4eiK0Jo/+O2UItxg8ACUJZetApzn2qtZrEQ=;
 b=bj/RpRXQw5Jj9L25AeqP3C90h5xnyRrvKW48g1YCKzwiGq48V4/tvfxEbQt9qfqhgeUjHaw+AN1jhjQeQCMjPjbwhBeJR+fKHI5I5zqv0cWwSXXDLuixMxXDjuASQVQHdNvhWtWDuv12NIVvghCk6HqpqGfWOYhrDPmgqob6k2Q=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DM4PR12MB7648.namprd12.prod.outlook.com (2603:10b6:8:104::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 01:48:19 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%5]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 01:48:19 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sven Peter <sven@kernel.org>
Subject: Re: [PATCH v4 4/4] usb: dwc3: Notify XHCI core of tunneled status
Thread-Topic: [PATCH v4 4/4] usb: dwc3: Notify XHCI core of tunneled status
Thread-Index: AQHdUCrvvRd35DDQNUWg3whG8c09mbbrCyCAgBuWo4CAALpkAA==
Date: Wed, 21 Oct 2026 01:48:18 +0000
Message-ID: <atgYQyBQ9To93c6h@vbox>
References:
 <20260929-topic-dwc3_tunneling_state-v4-0-63e296346d57@oss.qualcomm.com>
 <20260929-topic-dwc3_tunneling_state-v4-4-63e296346d57@oss.qualcomm.com>
 <asBMw-j0fxVLVW5Q@vbox>
 <8be959d7-cae1-4f1a-8247-67381a6dc811@oss.qualcomm.com>
In-Reply-To: <8be959d7-cae1-4f1a-8247-67381a6dc811@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DM4PR12MB7648:EE_
x-ms-office365-filtering-correlation-id: dac0c400-6db2-41c2-a215-08df2f1561b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|38070700021|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 sAbwaur6IQg5SrUP+x9UquKo0Agf2IIDjcWMxWgrKra3rdPag9z3zrhjEKz4/qkG0WZz8m263iaVewpcXgPJ9RGnuaN3RKURB2x0zARtz+Iws7HpmkY3yEWwGP8u3KWwxLUBt+Fi+bdPCuBDnrGfhufJDxACWtjF11/31WHoH+QIL3906HHDWZNcDQIsyKyLur7P1sqLnTJR9yFWRzb+J66MqJgeTHdgWMJ17DEXUJnXhenG/iqPEiKfDDuEJ7quiIWVQWkNvt9ak31byDbcgujQCna6LILkfYVrYM0nNqZAAMS/2PAzGPJ1GV4SUtHIc00RspQWqGzonwEh2sZXeR6KSZofyvE4tLwAYUgoXnHzaMIWsCSl12onOieKrS+lObOTgkl81f79AbzW4jlrxd3E+GP0KpJQeKuAnbtmPTnp8n5hjq9FM0KGr1axz5whIDn1S9Oedk/1Qc0p91+V4plzjft8WgquB+D/pA4ar7u4YwCwXQ/w/HcbFZcB7xWy9C0auxrThJ7FpDu8zks6LHZpXte2co+OToRC0x6TnTOihGsrwTa5tHb3GjSCUAJ7eVDveYOdJhodwmtDdR0Zh+kyhXrwqNbe+NYck9r1K1oy8I8txYLnh3s2bXAN+Vbw84quK4MLqLQbHJTBFi4v/SJt8kTqfqZP+RoyrPT2YpUd2m+JjN8lNIuoYJmTP3eSZw+87odCPEFMD2sTOYME6LLr9W7cy5ZtlvIvaBECG8I=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(38070700021)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VG9EQ21yWE45dFhIUHNiUnEyQjhvS0NhRmFVWWVYbU1xVGdUTWUzYXZyY3F4?=
 =?utf-8?B?YUxPRXJnNkk5MXlFZ2lWWVluL3FuVkxVNXl6cW1hMjczeTZ4NnBGS3hCY1Nv?=
 =?utf-8?B?VVk2Ris1blNUNW50SCs2V2JzOWpRdjdOamxsUzRmRytUcEd5ZmZReTVZamM2?=
 =?utf-8?B?cTRIaEMydGlhNXpVck85UXNOM0IxeWlNOUIwYWhvRW5hQlRrV3EvdXBmNlRZ?=
 =?utf-8?B?K1cyMDg5Q1gwUlRKRHBFTFlIdEpqZjFKSlZVYWx3dTZ2VjlqUTdHcUpXRUhz?=
 =?utf-8?B?M1JvUnZ0VXZYM3crRE43NS9BdlZjdi9qLzRUUTZ0YW9BME1TdDFZZVBBNDdO?=
 =?utf-8?B?Um93K0ZTdnZZalhoUVZxQlNtM28xQVpMK0pYLzJEMUhNT2FXdXc2Umc1OFl0?=
 =?utf-8?B?ZTdVRlZycnlUdDAzeDdIdWR5NUlRaTl2RHAzZlZNb1Azd1kyWnlxb3ovaGhZ?=
 =?utf-8?B?V1VMSzhTNk9IaElJSmdhQmZFMEpVNDBWcWdJdUtDbC93TkFUTmsyZ3pGcjlV?=
 =?utf-8?B?NzdrK2RzeDY0R0M4aitiN3habkNBQkhKL3UyYkJ5Z3c1bmZndWF4ZEZoK2M3?=
 =?utf-8?B?MllxTWtjNmZuVHVnODFleC9UNUdtRXdxNGx6bHVyZnQ0RllUVDZWS3RoVTdx?=
 =?utf-8?B?eWZId1d6YlRqQUl6TFhkQXBQMlBMYmZmWWxvWkRNSFMxcWxlbHZhSEVpY2RZ?=
 =?utf-8?B?SnJ1dWRTbnJISmNoK1BDcmRIQjMrQzRUYzArUTMwcXRLM2F4OTVieTc3VEtO?=
 =?utf-8?B?dFZTeVdYajlZTkJOTEFmREtHMENsME5pOGx0Qmp2TEU4SEtzL3RUc29HU3Y0?=
 =?utf-8?B?TzlmVlBhWkNBa3FSSTM1MTcrZGVBWEgvM2ZrL1NRYlFFVUEySG1vVVBzaXV0?=
 =?utf-8?B?eWdrdTZ5RVBMbDNxQ1RZckhObHVoYVR4VUJmaEJISGYvNzRJQ0lnOWhUL3Uy?=
 =?utf-8?B?b2xoWm10ZjNBYUxxWER5d1NxREZWYU1DdUlYVE1Hc1c4QTQyemJLKzVRQ09n?=
 =?utf-8?B?WFVyYkxudHZBcjZzNTh2Z01HcnRjSE1SMXp5V00wUGFMbTdER3Y3all1aTli?=
 =?utf-8?B?aUNpM0RtMGFoY25idmNqN2RNbmE1dTl1ZERINEVOMjIxTE13dkkxZjFNUGhH?=
 =?utf-8?B?VnhpZkJCR2ZRUnFxWGFtdSt6eUhSSmRZVis0bnFrNVFzeGtRQTIzS3pvRGJW?=
 =?utf-8?B?b1R1eFVUbSszaDFyRjBKREFiWFlyR0YrZmxKbTNJbEVQS3I2am5XR0ZnT2Fa?=
 =?utf-8?B?UGdzeW5GUEFpd281RjZsckdFVTg4N1BxWjZoVklxT2R1YjRBWFNuY1hFNE5I?=
 =?utf-8?B?amZnQkpnMGJMU21sa1ZFR3ZRM05Da3BiSlhsTU1CVU40YjNNbCtidWp4Yldp?=
 =?utf-8?B?b2I4TkRYYVVWazVrWXVBaC9NR3JvQ2JGSzM5bnBDeFpmMkNKMWhRZVIzODZI?=
 =?utf-8?B?cExUbGFTc3kra3JhUEtCeEVvTGs0SEYyK1BWZEVYclhud1VPRjNGNGRaNzJU?=
 =?utf-8?B?dFJkRXFSaGppUW5JTkFhbEFDYWpzSWRmVEhyZDhwc0VCZVZMSHMzeStVK2NJ?=
 =?utf-8?B?c1NtVmFZY3NlK1BnanNsSU9uczF2Tklxbmd1b2pCMTBIVlE2ME5aNEF2STl0?=
 =?utf-8?B?dy9BN0VyWFJaTEpPM1NuUkpKK2YzZEprOGJrNHBob01Tajl1OGVsQlNmQVM0?=
 =?utf-8?B?SENHL0tOazZHajB1Q21jUDdaekJHVVRKenJQb3kwY3J2K1RjWFo3Q25KU0wv?=
 =?utf-8?B?THJuanVnN25RSXFJVTVBQUNxSWtSVHZVTVZNRXBwOUdZdkhrTFA5MHlwaExy?=
 =?utf-8?B?SjF4aE5Fa3NqaTVTYmZaUVZiOTdTYW5KNDhFdndOSlpFdTlGSkx1UkF0Wm8z?=
 =?utf-8?B?Y3YwcXFmZ2JJRDJ6L2ZYc1RXeDJ1bTc4dWg0UUFRb2tlMGhNYXdwbHhnNlVF?=
 =?utf-8?B?MGtVNnNWM2VLcXdsZTBES1UyQXNSUmtMbS9MMWg2MWVPdzJoSFpyK09jd2wv?=
 =?utf-8?B?WkRxaEFENzIyMDRESEFQYVJkWEovUWdUQmdWbVRMZWk2S2p0SkJVcnhpVkwy?=
 =?utf-8?B?aVBRYXpXMks1MU85WmNCWk80aXA3TGsyd3lSYlBXYllBZmY1b3RReFhrM0JP?=
 =?utf-8?B?N2VCVjgwSndwTGpoYTJMQUxkMk5JNlpUYlp3OHRnbXA2Y3pONkFURFNtRkxj?=
 =?utf-8?B?aXdIb09ob2tpVUtoRnFUOHl0d3V4TzRCUGNLUlZZMXRYL200SzYraFEyU3hR?=
 =?utf-8?B?L1hZUkNseDJwWjM2dFYyZmdxaFp3S1NPekRjbVhtZjZ4TDZGcGxINWlnM1RU?=
 =?utf-8?B?SkhEbThvcktBZVhRcXAvUDZvMW5Sb0NTNDRPa2NUR1pOWFhoZm1kZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3FA2D4C33EB0214991AF08A5F1C3CA51@namprd12.prod.outlook.com>
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
	orqY57KZWjcQRVIf+5BSa/xA2DgsOahhQXpUrKjaPccz7uBMqiCKDNF9rMA4RFpzXDD5JfGgt8FTGejcsuqyHPkv5QO/k4CP9WXWdKZtZ9uhU1K1WLOzBlWxcw5E8TEIyd/lSGAvI4dAl87p78JF7Bi8HJWDZClesT97DeXXCD+AAwxZO8xZ/Eq99tJgippKtFqjpqNi+Go3OJe2pFVptH6yPK1Knp07F6A0XgCNy97pVjBPMni5NK36qnFBuOup3Fj1P4aaRZ9rxuRjVzZCOm5bH+3I4USIZfesxMOW3/Dulp6NEOuZIT+35XeYZLHeFeDbgpbk5VqACjyUoan1oA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pKCxezUPPYQfCKCyg+tl89PWXK60YN2xwoqgL0P5//7f88Wdzk2M0Jv6Ywj9zr58BXhN4/RUH6PwMm+kxWIv1Zak9YEjgyIHIPbIOTghwHvcI1XAcGAxhmH0fYJ2SmOvWZ4nskxHjXLGUozfLuMDqKRCc4XgM2M25tKV4B5iLQwcCwwwrUYS2PekU3UYmCelT5/cUOqmpstz4Pp3m36U8ZWAluATxmtdEk5e4YTll4GsZg/V/UhxMLTqh7WpHwPK84/FwNZTfjg9ubbHx8iDiJ0GorwFHKpXy2TkIiMTLn4xGB5mXKWDYrGsk2HorDZl3uurCbIncS58uvBTOUqQwjBNF3xFjAWOjqYYN9bBaMgHGJban0Yi2MXvMwMwj8U2hcr/pIPfr0sM67VdBgkj1TP8VJD9P3kPbsuHWwyE8WtLcvy4SXZCchMQOZ2BqrRwoClDzWoDcZJchI5MAo4X+846tjGMt12xlvFUK8oY6icYN3ALSl4zpMgRb2F9ZtB8xxCCicvIH/GYTUMZntojIt1uS1y8kvOd2mGqURD/3U2ruKYX+ZGPLW1zT17DJrf5/OGsSmESGvFYaOVzRcacpAlT3qoP8lZFtoIunaOiqAaWVovCLYoYJ0jJNQukWkTUwsyayEy7S0XwTYx+0S0aBg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dac0c400-6db2-41c2-a215-08df2f1561b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 01:48:18.9696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VQLJUUvHLBfWOaXrhsPkTi/HWWRT4xTuZXeUrtSG53drRv2WRNrqICSKfmGUuAzsWON6syY4suDYhkVgGKyuqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7648
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAwNiBTYWx0ZWRfX3r+Kz494CvaS
 fsIb/Tns0wwT4dWLX8T+uwAP+6AWFn9bYkxyjQ277Um+2mduQFGR6qEjVV9TesLVugIcJgU4tO0
 4c+AAl8tbC+O/HqcnEd/Ehv5ieomQLc=
X-Proofpoint-GUID: 7mutXLFfrrsSySpS2peEu8dhD-FaPmp_
X-Proofpoint-ORIG-GUID: 7mutXLFfrrsSySpS2peEu8dhD-FaPmp_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAwNiBTYWx0ZWRfX45NQ6v06phvt
 bN6mcEqFvf3TlrADU6mmqHu8sduB8kXVkrcmdD9bPfKJVD/0LwOLw2he3kWLUCtttw8+A3WMhp3
 fonusm7IFx9/upmsvOEs9r8VeRbn54G5+Cw8SUxkDN170GiXfEKTxPJ8WOs19Qiuek8u+5Ly8wS
 kaxB/q0kwHFivw1AO5kfTVVtf4J92vhn+FfQUlCk/l1AgFcFjgRvfRgXWFeQuhSQomZKxUcmWkk
 90bB8l/5Oo+20i1zU+nToRPu0fMczYLiGbhfqHMc4ya8Fq6WU7Mz/R7et/ZBRKABMwRg9MgjGxD
 819Sn9Xes3bGWzEIoor+p6vi+0jCcTxwC3slKZEjWtHyTZPL+KJjPRVutNh0apg81jd0NqhNKq3
 4BxKWI3lpOaIsEmFngSHhZ1Ysf3larffeWiYIcbQTtseiOJpkKpfvOhe3vi0tpI2hF6/dwn66hX
 WeB5asM2NpscTo/3udg==
X-Authority-Analysis: v=2.4 cv=LK3z05W9 c=1 sm=1 tr=0 ts=6ad819ea cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=EUspDBNiAAAA:8 a=npVTslz8sYKI5k1kXywA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610210006

T24gVHVlLCBPY3QgMjAsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+IE9uIDEwLzMvMjYg
MzoyMyBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIFR1ZSwgU2VwIDI5LCAyMDI2LCBL
b25yYWQgRHliY2lvIHdyb3RlOg0KPiA+PiBGcm9tOiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHli
Y2lvQG9zcy5xdWFsY29tbS5jb20+DQo+ID4+DQo+ID4+IFRoZSBUaHVuZGVyYm9sdCBmcmFtZXdv
cmsgcmVsaWVzIG9uIHRoZSBVU0IgY29yZSB0byBjcmVhdGUgZGV2aWNlIGxpbmtzDQo+ID4+IGZv
ciB0dW5uZWxlZCBwb3J0cywgc28gdGhhdCB0aGUgVVNCMyBjb250cm9sbGVyIGlzIG9ubHkga2Vw
dA0KPiA+PiBydW50aW1lLXJlc3VtZWQgZm9yIHRoZSBkdXJhdGlvbiBvZiB0aGUgdHVubmVsaW5n
LiBUaGlzIGRlcGVuZHMgb24NCj4gPj4gZmlyc3Qga25vd2luZyB3aGV0aGVyIGEgY29ubmVjdGlv
biBpcyB0dW5uZWxlZCBvciBuYXRpdmUuDQo+ID4+DQo+ID4+IEFkZCB0aGUgbG9naWMgdG8gaGFu
ZGxlIHRoYXQgZm9yIERXQzMgY29udHJvbGxlcnMuDQo+ID4+DQo+ID4+IEFzc2lzdGVkLWJ5OiBM
TE0NCj4gPj4gU2lnbmVkLW9mZi1ieTogS29ucmFkIER5YmNpbyA8a29ucmFkLmR5YmNpb0Bvc3Mu
cXVhbGNvbW0uY29tPg0KPiA+PiAtLS0NCj4gDQo+IFsuLi5dDQo+IA0KPiA+PiArCS8qIE5vdCBh
bGwgRFdDMyBpbnN0YW5jZXMgaGF2ZSBDSU8gSFcsIHRydXN0IHRoZSBwbGF0Zm9ybSBmaXJtd2Fy
ZSAqLw0KPiA+PiArCWlmICghZGV2aWNlX3Byb3BlcnR5X3ByZXNlbnQoZHdjLT5kZXYsICJ1c2I0
LWhvc3QtaW50ZXJmYWNlIikpDQo+ID4gDQo+ID4gQ2FuIHdlIHBhc3MgdGhpcyBhcyBhIGR3YzMg
cHJvcGVydHkgZnJvbSB5b3VyIGdsdWUgZHJpdmVyIGluc3RlYWQsDQo+ID4gaW5mZXJyZWQgZnJv
bSB0aGUgY29tcGF0aWJsZSBzdHJpbmc/IChpZS4gYWRkIGR3Yy0+aGFzX2NpbykNCj4gDQo+IFdl
IGhhdmUgYm90aCBDSU8gYW5kIG5vbi1DSU8gaG9zdHMgd2l0aCB0aGUgZXhhY3Qgc2FtZSBjb21w
YXRpYmxlDQo+IHN0cmluZ3Mgb24gdGhlIFNvQ3MgdGhhdCBzdXBwb3J0IGl0IDovDQoNCk9rLg0K
DQo+IA0KPiBBY2sgdG8gb3RoZXIgY29tbWVudHMuIElmIHdlIG5lZWQgdG8gd2FpdCBmb3IgdGhp
cyBkdCBwcm9wZXJ0eSwNCj4gd291bGQgeW91IGJlIG9wZW4gdG8gZ2V0dGluZyBwYXRjaGVzIDEt
MyBtZXJnZWQgaW4gbWVhbnRpbWU/DQoNCkknbSBmaW5lIHdpdGggMS0zIGdvaW5nIGluIGZpcnN0
LCBwZW5kaW5nIG9uIE1hdGhpYXMncyByZXZpZXcuDQoNCj4gDQo+IE9yIG1heWJlIHdlIGNhbiBs
ZWFuIG9uIHRoZSBmYWN0IHRoYXQgdGhlcmUgZXhpc3QgZHdjMytBQ1BJIGRldmljZXMNCj4gdGhh
dCBjb3VsZCBjb25zdW1lIHRoaXMgcHJvcGVydHkgdG9vIGFuZCBzbmVhayBieSA7KQ0KPiANCg0K
SSdkIHByZWZlciB0byB3YWl0IGZvciB0aGUgRFQgcHJvcGVydHkgdG8gYmUgYWNjZXB0ZWQgZmly
c3QsIHNpbmNlIHRoZQ0KYmluZGluZyBpcyBzdGlsbCB1bmRlciBkaXNjdXNzaW9uLiBJJ2QgcmF0
aGVyIG5vdCB1c2UgdGhlIEFDUEkgY2FzZSBhcw0KanVzdGlmaWNhdGlvbiB1bmxlc3MgdGhlcmUn
cyBhbiBhY3R1YWwgdXNlci4NCg0KVGhhbmtzLA0KVGhpbmg=
