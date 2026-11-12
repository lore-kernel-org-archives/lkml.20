Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794448767;
	b=sM7z5n3IjHKUPTy3ygPy784M+65QTD1O6cr7fR/XHEFxdTtpv4GQCnNp1fl/KuX0rBRy
	 bDbMccHzwc7fWnscHhQx3A5g7IigVl33DWotYCFHvrwHf7MxDJOKO2I3hlFDUk+a56DtP
	 knKCTzga8CFBF4hEHJKLhP8ZerNoXG9JZ9Od6RLB+0qYp/IOILUMUfx/0mXx7BQFezS1S
	 YTWwtt0l/xtYT/49S5/MnmbKp0YsvUJ5yyo/AaZZruHSaQHodGCRB4r2ru7DUKdme3XZ9
	 Ni8TiNZEH4QaS/397F2s7zDwLBuGJGxtrCSqKhruNsBKBrqzhrvukvOjBDVVveJxSSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448767;
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
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oDzE95kYaiSyQm0dALuFTM7/7QZ7srTBUD58Il0Ah/M=;
	b=nUV6qUgz2jOux+PnoPG89dV1hOj1lT3irsjrSDe+mK42xhppURmcxpIthGysGa0ij4Uf
	 bsr/XatH9U49eNfEjw2JSOpVkyq8nviuGTAQtRIPmn5SwhPZDRE1WdEd53WlgPDjFfZ8O
	 i0TU64f92JLr68gTsA02dwdPIlgRvGpE0yIjBhlAhwNMFVdHo/epeKxUznhD2VKQcNy8+
	 ji1/sFJXkS/iqXgcw/upDSrAd+GdhuXJ7sSz3JndKy/H58700L5QUgXVZ/Fv6pIcKYBQ8
	 zFODDX35bc9/9pY+4AUH9tpMzMiMZjsXpyZLpl7rnQafLAIsaaqev5/VNc4CMlv1gmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=E2Dq0y1S;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=jm4+fHlG;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b="ODeuUrP/";
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52D0606A323;
	Thu, 12 Nov 2026 01:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B52D0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=E2Dq0y1S;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=jm4+fHlG;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ODeuUrP/
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABMbw5R1629430;
	Wed, 11 Nov 2026 17:59:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=oDzE95kYaiSyQm0dALuFTM7/7QZ7srTBUD58Il0Ah/M=; b=
	E2Dq0y1SzV51bDqlZZsy6lGbkX80eEHx+Vu70PmexTFCLbzl7iRewFzuK2PXdIjV
	Wi4BQ/BSLba8+JQAPGdGltf3yV8PggZjm1kI65ilBU+ti1JsBAy6Mw7bbPSCO+Ab
	b0XZ8n/fe+ZU0sI2mv4Uk+f5TFk//f8DUjAxCmr596fdndTtgRBdCYqQ7i1mWq4n
	/R2lr35/aHfPpjrE2bWIfEiwXMEoJjvPG3OV75Qowp8uWerXw2Hq+SVS/mNFqvqK
	GkqWb6SfPY3c/d+SNtnTAJp5YqkGRaKK31Vn9P4k+rcxq0/mTC0ZDnFJTttiYB/u
	P4LYVEW7KG0/xgIFumatEQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4hvv7x3b08-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 17:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1794448756; bh=oDzE95kYaiSyQm0dALuFTM7/7QZ7srTBUD58Il0Ah/M=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=jm4+fHlGI92MsNEktAXA9w23+J+HPJtyjOU2qPmaz0efVAb4FQtpbP7dNF9CQyAkB
	 zla7zHv0eBK/BdFTv99nt6UiObqm9sNiOmnrNQtegw9Aa6TnPExQsBTyO9ws3eFIXj
	 n+cgmHw/ByNpmYyF3qe3EOZ6+a0PWSPkKC+XIDKvXnfQLtEAJlv1vKSvmio4kiHBgr
	 JDPjiXp6SgQ2M2E0YkHLX1IcRZBIlQPA0YUXedpvnvJhiz01sciI7rUUdVSikNPpxG
	 mMnwuyHDsqMSvrKru1P1PhfZ/MT2kTzz2U5kau3cFgjI2MxUTUGsunE+AqmS/aZwxb
	 AXvBQjot3Qmhg==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 862B7402D6;
	Thu, 12 Nov 2026 01:59:16 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 34291A04AE;
	Thu, 12 Nov 2026 01:59:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ODeuUrP/;
	dkim-atps=neutral
Received: from PH0PR07CU006.outbound.protection.outlook.com (mail-ph0pr07cu00606.outbound.protection.outlook.com [40.93.23.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C9BE74069D;
	Thu, 12 Nov 2026 01:59:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIkTaeEwtnCRIDihdtaqDfDB8zEcANuRgBnZQYp+KeHtyGLo+QrajleXnsav0cJ/ZHirj3bLyv/FtdoLqf2tQJHBopA2jVuovPmbB5Sy8i1HZgVUKc35ZXrNo1iPLKEJL5m0peSC0qTqw02/YFTmMh51C5MXi6LBAn1rj/oHZyk575cQcoD2HOgAiMvuPs88vSTVhtgZtVk5cRYZX4K+9VLMkVddm2UZEwXeVZJ55cu4XLXr3Vm+pPf+FRtHspMYDRfrF86K9BNF6WZpUPCIpI5RZHoPYTjqo5383YU8z73R0qGyw1bWZbgqrcWCDn/ePJfsWPtMzcEXD5gZD0jrgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDzE95kYaiSyQm0dALuFTM7/7QZ7srTBUD58Il0Ah/M=;
 b=JWAfaN1fFXP6Xgeiji2iO5hPA+T5vHF7sK+kqnUJU0AKzeoxg3YIaxATdAMaTvTxewx1XeAXIFMqIpEFkGRfQrSDTUrwf4kDRmcnxjdto66OsjVm0XOiInxIUq8Y5cp8YQxlTolxIVrJvMxDcwNo0ZGKiLVLscg1LRE0R/Bl13emr8YzSr2NMAsJUNbnVE5Wnbwg79jziFKhc1Qnar4h8sQBHrnwilMB3WqniIW3rlxCwfk1jw5BfK0RCXs7W3WLQHQC1eAw1ELmXEEauQiN54aEDAAUe1hQ7pATqi96En6WoC7gzPNtg1jdlk5R3ey3p/FMDKlfRfRHk6S1j4s6/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDzE95kYaiSyQm0dALuFTM7/7QZ7srTBUD58Il0Ah/M=;
 b=ODeuUrP/72v1S9jb1pca6GVq8aaclMAGKLHEiLD2EfHI135qda9qRNJ3XyfZQ6Ba+xvGmntB320qk55vBsaHy314gwVeKDYMUUFW8jJlD/5ZfdCX1hbstI+2S/5tuMa3wYZSirj0awDWtLqEQ6LVU9242xtatJB98yixY7tGxd0=
Received: from SJ0PR12MB7473.namprd12.prod.outlook.com (2603:10b6:a03:48d::8)
 by DS0PR12MB7701.namprd12.prod.outlook.com (2603:10b6:8:133::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 01:59:11 +0000
Received: from SJ0PR12MB7473.namprd12.prod.outlook.com
 ([fe80::fd38:a665:ba4:95d7]) by SJ0PR12MB7473.namprd12.prod.outlook.com
 ([fe80::fd38:a665:ba4:95d7%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 01:59:10 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Vladyslav Tymoshchuk <tvlad744@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] usb: dwc3: Notify the glue of role changes from the
 mode switch work
Thread-Topic: [PATCH v3] usb: dwc3: Notify the glue of role changes from the
 mode switch work
Thread-Index: AQHdcbtI617rjdH/h0iwR70o0CLmUbcpr1oA
Date: Thu, 12 Nov 2026 01:59:10 +0000
Message-ID: <avUdNnZ7GWREGQOp@vbox>
References: <20261111090122.134-1-tvlad744@gmail.com>
In-Reply-To: <20261111090122.134-1-tvlad744@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB7473:EE_|DS0PR12MB7701:EE_
x-ms-office365-filtering-correlation-id: 5542eae2-3fc6-43b9-cb71-08df40608b4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|5023799004|11063799006|56012099006|38070700021|22082099003|18002099003|4133799003|10067099003|261022075727099003|261021133027099003|261022105027099003|261021135927099003|261021123027099003|261022113327099003|261022115727099003|261021130227099003|261028144727099003|261026121527099003|261026135527099003|261021121427099003|261102123227099003|261026140227099003|261026130827099003|261009223027099003;
x-microsoft-antispam-message-info:
 NFeu0TWzgXrDQI8s0JTjCakzAXX5jerq4/yJSKPoff7HunhfJfMOBEedQesHdrFk8oVfBjo/M/n1VYJCwWo8Uww43OwOqAdi+ZZu2BSAxrOD7Sa0I8MfEDD/+ZHjNdnB9iR0xvk+5XRl+ZDzvVdk6tjI0WLZ+wqrdcYGpweXPd1xKcYupjGraZke3UOzJpYCV9GBnOZ4POrmbuceADX6Tb3p76EFFuQ/10eyPtJQuBHqmRW+2ffxD/AF0Zi8VtFFDwDXFOGa0p8YjGYeAQNiRvQPMRItXOu2BVWKh/2laabrE4Lu+x9J7K7h58+6XCwmoGH3oahr7iOhb6sPw0oyQ6xBYyrekcqAbcQLyLU2UMuLyfsCe5iq5euzUMDDXK1CCudHnhz3vE6Uph8smwaUDkoDvTjb48u8S2kK0B8EQq0Or97vD4ideWBtB22eLDZiJtpcmZ+lJt8D6tRlNr886KHlHWGj87xnC/bS2xN/Ic0rFGq8DPXN6d9t3uXZN+EZpWhv6kTxQqVbLwRIW+AZ3x33drEhVB9t9oP2UiA9PsQvY43wIfYl7GvhiR8NH74q2WfI7vlVSJhPN3fIeBJeMyPOOO9k9zmpBtHIcPhjQOKHFq2f66rl0m3VRGMU0LeHtbUxquOGcS7IOyJCRRQG2GzhAD1Zeh/y75hu4F415xeprNaSSzSZghp2W+pnKv0N
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB7473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(5023799004)(11063799006)(56012099006)(38070700021)(22082099003)(18002099003)(4133799003)(10067099003)(261022075727099003)(261021133027099003)(261022105027099003)(261021135927099003)(261021123027099003)(261022113327099003)(261022115727099003)(261021130227099003)(261028144727099003)(261026121527099003)(261026135527099003)(261021121427099003)(261102123227099003)(261026140227099003)(261026130827099003)(261009223027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?emNBRjFqQlpnNldjUG5wNjBBTDBFdGFYZ1FoZ0ZWTUZiOXIzZi9mVDEyQzJV?=
 =?utf-8?B?ai9wYWhNbHRvK0d3VHFDYTBlWmcwdXlwZDZ1N09kOUVIR2FvbjZqM2habW1Y?=
 =?utf-8?B?cHZtYWExRzRKcGx5MjNJRC9LSUxmUFRob09jeXFrNTFxVjJFckxxeTd5a1hn?=
 =?utf-8?B?ZEZMQnA0K0dTUkJkOURIeUlNME9lWkFTKzlMU0thL1pyR0V6Nnc2TW5uWFY3?=
 =?utf-8?B?Ym5RNUZmK3V4eXRzWWtpdTY0ZFFockpiK2RMaWYxSi9vWVcwUUwvMmdvTFFB?=
 =?utf-8?B?U2xzSmowM0s4MmMwS1lMZVR0TXBIcDJMUE8veWxPVlhrYStzVm1jcEd5b2NK?=
 =?utf-8?B?RmpzR09nMTlmY1VLMUlFbmZIdHpuSE5RNElOZ2FTb2ttb0NsMHUzbHB0V3pI?=
 =?utf-8?B?cFpxTTFlMUlDbXl4ekxFUTBFWk54bVBNSStVL2RpWTdWS3pyTDFoSmREYlRN?=
 =?utf-8?B?TnowRnRhVjRrbU9Jb0VieCtSVkIxREVHakVCMzU3ZjhJT1BpYUVvYTdnY1hp?=
 =?utf-8?B?MGwzNE5FNU9NbjJuS2NWYXUvOWxjUkNudk5ORWl6Um8reWlJaXJ6a05MZi8w?=
 =?utf-8?B?amNvTXQ3d0NtZ3NqOVpWQkRFZ0JwQlc3Y2E3bldwM2pjb2pTUzVoMHQrNWlD?=
 =?utf-8?B?ZWZsaC9zSDRxTlZGbTZqdEFyVGd2SStSMkUwMlJkcm4wZzRUbTI5dnpuN0pj?=
 =?utf-8?B?QU95bXhCNVBjMVc0dEt0TVFrZDd1d21UdFVXRzBmdk1mUExpWGU1Wk95R0NT?=
 =?utf-8?B?Q0Rjdkw4NUNRMm9KcTZ6aHltSWlBeWtBQThNN1pZaXkxYTBlZzJJbk5zVkc3?=
 =?utf-8?B?ZU9OKy9FSE05Tno5ODZoYzBTQjRFb0ZkNHNlRS9tRVlTeXBzNE8xaDhLQldG?=
 =?utf-8?B?Ti9yNW5jNlJvSXRvQmd1eFM4N1U3a3dpU1k3R0kwdm1vanNZVHlpK1RFdERM?=
 =?utf-8?B?MlFyN3VuQWV4VVp5Rmp6MDdWSXRwWnQrenZ3dTE5Zk5aOEpaekdGUjcxNWtL?=
 =?utf-8?B?WHI0UC9wdmQ0SXdoRURlYk5BSXVpQVhwZUxvcTA3TWx1eUk0dHdEYkd1QnJJ?=
 =?utf-8?B?Y3J0R1J2Z08xWUFPbjJ1akhDL09sQzFUMVFlemhmbmVwNlVBRzlGWWE5SmpW?=
 =?utf-8?B?SnpNVWNmdWZ5SWJRZ0tPMXdJL3ljaG9ST0d4OXN5Tm1tY1l2STFpdUNNUVFz?=
 =?utf-8?B?R0NPbjlUWVZjRkFhZmhMaE5RRDdWTjBGODlnOVhSNkNqazNsM0lRNEh2QWh6?=
 =?utf-8?B?MHlsQXdoOTdrcVRlSFRIN0cwb0I5VXVNM1FDMldadzIxZFV4eW5nTEluYlBo?=
 =?utf-8?B?SStDb2ozVGZnaHpRMTFud3FySFdYTGVHcTRKVitKT1pHTTJ6MVdXQTNLb2VP?=
 =?utf-8?B?V2FXNjBIY2Q4ZnVITGo1ZVZSNGxTUGtOb2x3b0tDZ1FBUlBQVHVVSnJqZTBU?=
 =?utf-8?B?M0lyTkZ6TWY1aXdBRGhiZ0t0UkVlSVoyQW1rM2Q4cGZxM1hOZURRbm5OVG9s?=
 =?utf-8?B?emVubHpkYmpTS2Yzd3FKenM3cENvVldla3dQODlkeW1UQ2s4SE1IZk9ySTd6?=
 =?utf-8?B?dzE0aEJlWHdwRjhZV2ppenQyM3VHbk5xNXlxTHdLSEJsYllNQUgzVWV6b2p6?=
 =?utf-8?B?UlFGaGFIMnpVRno1VU9PMnl0VmRlT2QveFlTd1ZBMjk2RzNzV1NsWFpnb0g4?=
 =?utf-8?B?VzRlcHRhYmdKT011bjFHZGc1Q1RYY2xDazA5dUN6STVRM0NrZ25POWxhbHhQ?=
 =?utf-8?B?d1J5cExQS3RYSkdRNmtPRnZCb1F5RzVhemRJWDNJU1k4VGllYWJFL09oL1hE?=
 =?utf-8?B?dVdFK3QzZ0tyUmI1TnJJTkhKTTBVZ3NFY3JjTEZ3YzZhY1luZkNVOFdNazJB?=
 =?utf-8?B?aUFIdWRhY1JZY2JKN3VlNGp4dnNsR0pSZ0Q5emFYQnZJZmMyT3NjM3RwMUx5?=
 =?utf-8?B?UWNUbkdaRHhJWU1SNEZDWVlaS01jdzdGaHczQUVuVG5EN0x2cXdJeUZIRmZi?=
 =?utf-8?B?a1JZUXpNTjdXT3V0SDRVY1Q5V1NCKytoSnN1dWx5UndnQ1VHMXorbXdhZFlG?=
 =?utf-8?B?d0lTa2lKWnRjNFdoS2lFQ0wwMHRRS2Vkd0lKck1wKzJqeEFhQ0ErUTd0TDkz?=
 =?utf-8?B?b3BuOGpHVktkNWVidktkeEduUlZZSmYxclJSZUNOSTNBbkF3QVVxSjBBaG9G?=
 =?utf-8?B?MVp2VlEwSGhIdDdBMVYrWXh0WkVRUy9CeHBUekpPVGNEa3ZVbTdLdnJLbUZR?=
 =?utf-8?B?cHZuODIxWURIODdONXY4NmRCUE5QY1F4dXF4alFTeVp3dE1QRWQ3cmpOWXRL?=
 =?utf-8?B?SmRnOVc0TnN4OEtYR0FSdmZSVzJUNVo2cEJaa2tPRjQ2N0NhWHFKdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F12CB95B05DD94DA394966FF4DAD47E@namprd12.prod.outlook.com>
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
	oRwdV1Mvn0eJj5Bx3f4bCT9odBfTdIIL1UMksdEU9qM4IHrjZsZh6WKx7/nuvGCzNHUUFvEfVyBrg8Y8tm4bCtGcZbzsObGRtlYWp2ww/gqgOTRb6GX+UcqTAe67kJjrKEY3NAJd6T13gZuxMeioRD9BmqIPDB8g2eKeyiI2Vto4l3BNChbQZo2frGUHL4ioZAuHy7FLleLbj/0suH4/fDRty0BLfpDL4Rss93F9+9DpPhQODX/EVAZVIT+TUHIEQy4yfPrNSg54WRd8Eiwni/dC/4BC5XRvGEnyozX7+dc5PrLOZ/xyaRbobcZJj2akjAlda6Hwi4JBz+7B6NNe/g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FFPmWVzf9b7AYDPxm2dEKNNo+XTmD6djmuGvBGA6EXfq1jPylNHFdxxpakZcRMuozy9dPTHMGXwa8ASlZBnOLaInrQlBOxzndtHZ5HdlIfe9N277gO6ZjEx6e/K/fzZ6Pjz0/zx6clhy4U75LEUrnU21tAOcDJrJEy3kiZAtqvm6bFmlamgP8Hyl5S1v1ugbEP7jC/noHyiV+xx1o7NsK7KYY9kDiZ5q5qvjT2VJrbKBpjkdWf9bZ7hg5Ssw7r/wVAVaq1rvKR1Xe7zGoQkvFAf5iX2fCRNIrVj6xg7oOLfsyOBduKbIlPUencwKsvBNdTeSME5kWITv3EdFodwmC2o5lTxAgJDx7rqlTwVLie7Jy465ba3Ml3BKC+COgr2EYjaAcEZ4nql/HtDcWMw7gG9vjggPrpoIHvFYobQmkIQm4V+GnsiuNZVf+Zwf1jaY/yomy+L8993FgjqR4H7BsgyKeIEqEqY8Yz2sCSAmVkgQB1uUzs2AP3YI9SfnMohVm0vBQO7vaCPbnp8hs47KQpykTdPca8Jzgrxn3fru+XFv6rl7yzpiorw/kkEmOEdyTJ+NFDSiddfz9LSvG+/bMAzhDbP/EH6kQrpAHEVKsiBpGsd92dItpyw4MQPGwWRBmqyRpT6OfFd0ZM7SO8hAYw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5542eae2-3fc6-43b9-cb71-08df40608b4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 01:59:10.6861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjFSZpRT0At9M3eaX+LxjAtLU3ivzmkYNXp1qZ6v7E1JygF1cwAST6Yr1tUYpnvtIysIDAvp3ubUZ+JpIEwvTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7701
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwNyBTYWx0ZWRfXwIKg0yw4xaah
 Hv60janudRjjXXfhAT16t+6PYeJ6JUGnaQ4qBC/05mhR6koEpu8gqJLBh9bsuXypdxGnPAGRb8U
 F+bIU89thEBvwhNCrU8F4bsvjM8a7otj0gI1oeQwM08uX2NrzYjtr6AybSDKfMWJ5d2lxCDDhwN
 kH3H151KcPzxgIRVLVobVZrUxy220U/33MIyi1F+oCo+R8Yt7aTBITh/Imb7v0vNd0zn0WuhVkQ
 WL4cvwzcSFt2Jz+8GM1VonLi5m3go8H2u/vdFMQzQvC2l1U+w612ifDeUWVDo5yeG30hTpXFx7k
 wnaaI1bDTIlQtECjQeeYNyruy7uGZGGFEyPE7RsHFAPUMZXuw5m5djEAQ7Rk98GnZWHRnik1Cp/
 QGLZV1cWm0le4Fj0JLV3gH1Em97tdQOmZ4QLOW24CWopr/L7LCwAY7X/rnJLWxyTmPufDqlNjOa
 +ITDX8oxCc98mOvKMew==
X-Authority-Analysis: v=2.4 cv=IuaL47/g c=1 sm=1 tr=0 ts=6af51d75 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8
 a=xPRUdYgrCPfNhQvjfOgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: x9P97uUnHSo-d01xuz8PaYiWDBcei3IZ
X-Proofpoint-ORIG-GUID: x9P97uUnHSo-d01xuz8PaYiWDBcei3IZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAwNyBTYWx0ZWRfX93dcenkgIV2o
 kkmpylOWLCN0sXApdgtgyUAQstP8LHgOqU8xUbBWOGR4txjaDo8vMImmnoZ3/WaWJQuDCih62Sp
 ezbfFsw/CF0bM/Pyns/pVF0Gj9wu6nQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611120007

T24gV2VkLCBOb3YgMTEsIDIwMjYsIFZsYWR5c2xhdiBUeW1vc2hjaHVrIHdyb3RlOg0KPiBkd2Mz
X3VzYl9yb2xlX3N3aXRjaF9zZXQoKSBhbmQgZHdjM19kcmRfbm90aWZpZXIoKSBjYWxsIHRoZSBn
bHVlJ3MNCj4gcHJlX3NldF9yb2xlKCkgc3luY2hyb25vdXNseSwgZnJvbSB0aGUgY29udGV4dCBv
ZiB3aG9ldmVyIGNoYW5nZXMgdGhlDQo+IHJvbGUsIHdoaWxlIHRoZSBtb2RlIHN3aXRjaCBpdHNl
bGYgcnVucyBmcm9tIGRyZF93b3JrIG9uIGEgZnJlZXphYmxlDQo+IHdvcmtxdWV1ZS4gTm90IGV2
ZXJ5IGNhbGxlciBpcyBmcm96ZW4gZHVyaW5nIHN5c3RlbSBzbGVlcDogdGhlIFVDU0kNCj4gY29u
bmVjdG9yIHdvcmssIGZvciBvbmUsIHJ1bnMgb24gdGhlIG5vbi1mcmVlemFibGUgc3lzdGVtIHdv
cmtxdWV1ZS4NCj4gDQo+IE9uIFNNODc1MCwgd2hlbiB0aGUgVVNCIGNhYmxlIGlzIHVucGx1Z2dl
ZCB3aGlsZSB0aGUgc3lzdGVtIGlzIGluDQo+IHMyaWRsZSwgdGhlIFVDU0kgY29ubmVjdG9yIHdv
cmsgZm9yIHRoZSBjaGFuZ2UgcnVucyBiZWZvcmUgdGhlIGRldmljZXMNCj4gaGF2ZSByZXN1bWVk
LiBJdCBzd2l0Y2hlcyB0aGUgcm9sZSB0byBVU0JfUk9MRV9OT05FLCBhbmQNCj4gZHdjM19xY29t
X3NldF9yb2xlX25vdGlmaWVyKCkgYWNjZXNzZXMgUVNDUkFUQ0ggd2hpbGUgdGhlIGdsdWUgY2xv
Y2tzDQo+IGFyZSBzdGlsbCBvZmYuIFRoZSBhY2Nlc3MgZG9lcyBub3QgY29tcGxldGUgYW5kIHRo
ZSBTb0MgcmVzZXRzLg0KPiBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCkgZG9lcyBub3QgcHJl
dmVudCB0aGlzOiBydW50aW1lIFBNIGlzDQo+IGRpc2FibGVkIGF0IHRoYXQgcG9pbnQgYW5kIHRo
ZSBkZXZpY2UgaXMgc3RpbGwgbWFya2VkIGFjdGl2ZSwgc28gaXQNCj4gcmV0dXJucyBzdWNjZXNz
IHdpdGhvdXQgcmVzdW1pbmcgYW55dGhpbmcuDQo+IA0KPiBSZWNvcmQgdGhlIHJvbGUgYW5kIGNh
bGwgcHJlX3NldF9yb2xlKCkgZnJvbSBfX2R3YzNfc2V0X21vZGUoKSBpbnN0ZWFkLA0KPiBzbyB0
aGF0IHRoZSBnbHVlIGlzIG5vdCBjYWxsZWQgd2hpbGUgdGhlIHN5c3RlbSBpcyBzdXNwZW5kZWQu
IFRoZSBtb2RlDQo+IGFsb25lIGNhbid0IGNhcnJ5IHRoaXM6IFVTQl9ST0xFX05PTkUgbWFwcyB0
byB0aGUgZGVmYXVsdCBtb2RlLCBzbyBhDQo+IHN3aXRjaCBiZXR3ZWVuIGl0IGFuZCB0aGF0IHJv
bGUgbGVhdmVzIHRoZSBtb2RlIHVuY2hhbmdlZCwgYW5kIHRoZSBnbHVlDQo+IHN0aWxsIGhhcyB0
byBiZSB0b2xkLiBNYWtlIHRoZSBjYWxsIGJlZm9yZSB0aGUgY2hlY2tzIHRoYXQgc2tpcCB0aGUN
Cj4gbW9kZSBzd2l0Y2gsIGFuZCBvbmx5IHdoZW4gYSByb2xlIHdhcyByZWNvcmRlZCwgYXMgdGhl
IG1vZGUgY2FuIGFsc28NCj4gY2hhbmdlIHdpdGhvdXQgb25lIGZyb20gZGVidWdmcyBhbmQgZnJv
bSBkd2MzX3NldHVwX3JvbGVfc3dpdGNoKCkuDQo+IA0KPiBSb2xlIGNoYW5nZXMgdGhhdCBjb21l
IGluIHdoaWxlIHRoZSB3b3JrIGlzIGZyb3plbiBjb2xsYXBzZSBpbnRvIHRoZQ0KPiBsYXN0IG9u
ZSwgd2hpY2ggaXMgdGhlIHN0YXRlIHRoZSBoYXJkd2FyZSBoYXMgdG8gZW5kIHVwIGluLg0KPiAN
Cj4gRml4ZXM6IDIxMTg4ZThkNmQ3NSAoInVzYjogZHdjMzogcWNvbTogSW1wbGVtZW50IGdsdWUg
Y2FsbGJhY2tzIHRvIGZhY2lsaXRhdGUgcnVudGltZSBzdXNwZW5kIikNCj4gQ2M6IHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmcNCj4gU3VnZ2VzdGVkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXll
bkBzeW5vcHN5cy5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFZsYWR5c2xhdiBUeW1vc2hjaHVrIDx0
dmxhZDc0NEBnbWFpbC5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYzOg0KPiAtIEZpeCB0aGlz
IGluIHRoZSBkd2MzIGNvcmUgaW5zdGVhZCBvZiBpbiB0aGUgUXVhbGNvbW0gZ2x1ZS4gVGhlIGNv
ZGUgaXMNCj4gICBUaGluaCdzIGNoYW5nZSBmcm9tIFsxXTsgSSBvbmx5IHVwZGF0ZWQgdGhlIHR3
byBjb21tZW50cyB0aGF0IHdlbnQNCj4gICBzdGFsZSB3aXRoIGl0LiBBbGwgZ2x1ZSBkcml2ZXJz
IGJlbmVmaXQsIGFuZCBkd2MzLXFjb20gbmVlZHMgbm8NCj4gICBkZWZlcnJhbCBvciBsb2NrIG9m
IGl0cyBvd24uDQo+IC0gVGhlIHJvbGUgaXMgcmVjb3JkZWQgaW4gc3RydWN0IGR3YzMsIGFzIHRo
ZSBtb2RlIGFsb25lIGNhbid0IHRlbGwNCj4gICBVU0JfUk9MRV9OT05FIGZyb20gdGhlIHJvbGUg
aXQgbWFwcyB0byAoUHJhc2hhbnRoLCBbMl0pLg0KPiAtIFRoZSBleHRjb24gcGF0aCBnb2VzIHRo
cm91Z2ggdGhlIHNhbWUgd29yay4NCj4gLSBEcm9wIEtyaXNobmEncyBUZXN0ZWQtYnksIHRoZSBj
b2RlIGlzIGRpZmZlcmVudCBub3cuDQo+IC0gTGluayB0byB2MjogaHR0cHM6Ly91cmxkZWZlbnNl
LmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MTAyMjIyNDIyMC40ODAt
MS10dmxhZDc0NEBnbWFpbC5jb20vX187ISFBNEYyUjlHX3BnIWVLT3FGVzVFdlM2M2I3M013Z09E
bTZkWjFhT0JjX0tJaWF4YmYwRi00Y1FjS29jTkhzMmh3ZTNCMHVKVDRDSDAzRmEzX1NnSEZ4N2cy
ZnExM05tdHh3JCANCj4gDQo+IFRlc3RlZCBvbiBPbmVQbHVzIFBhZCAzIChTTTg3NTAsIFVDU0kg
b3ZlciBwbWljX2dsaW5rKSB3aXRoIHY3LjMtcmM1DQo+IHBsdXMgYm9hcmQgcGF0Y2hlcywgZGV0
YWlscyBpbiBbM10uIFdpdGhvdXQgdGhlIGNoYW5nZSwgdW5wbHVnZ2luZyB0aGUNCj4gY2FibGUg
aW4gczJpZGxlIHJlc2V0cyB0aGUgU29DLiBXaXRoIGl0IHRoZXJlIHdhcyBubyByZXNldCBpbiBm
aXZlDQo+IHN1c3BlbmQgcnVucyBpbiBkZXZpY2UgbW9kZSAodW5wbHVnLCBwbHVnIGluLCBib3Ro
LCBjYWJsZSBsZWZ0IGluKSBhbmQNCj4gZml2ZSBpbiBob3N0IG1vZGUgKFVTQiBzdGljayBsZWZ0
IGluIG9yIHVucGx1Z2dlZCkuIFRoZSBob3N0LW1vZGUgcnVucw0KPiB3ZXJlIG9uIGEga2VybmVs
IHRoYXQgYWxzbyBrZWVwcyB0aGUgVVNCIEdEU0NzIGluIHJldGVudGlvbiBbNF0uIFRoZQ0KPiBj
b21tZW50IHVwZGF0ZXMgd2VyZSBub3QgaW4gdGhlIHRlc3RlZCBrZXJuZWwuDQo+IA0KPiBJIHVz
ZWQgYW4gQUkgYXNzaXN0YW50IChDbGF1ZGUpIGZvciB0aGUgYW5hbHlzaXMgYW5kIHRvIGRyYWZ0
IHRoZQ0KPiBkZXNjcmlwdGlvbjsgSSByZXZpZXdlZCB0aGUgcmVzdWx0IGFuZCByYW4gdGhlIHRl
c3RzIG9uIG15IGRldmljZS4NCj4gDQo+IFsxXSBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19f
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2F1dTloeF9YbmpiaTNXa0JAdmJveC9fXzshIUE0
RjJSOUdfcGchZUtPcUZXNUV2UzYzYjczTXdnT0RtNmRaMWFPQmNfS0lpYXhiZjBGLTRjUWNLb2NO
SHMyaHdlM0IwdUpUNENIMDNGYTNfU2dIRng3ZzJmcUl0aVBQWlEkIA0KPiBbMl0gaHR0cHM6Ly91
cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9mOWQyN2ZkOC1j
ZjMzLTRlNmEtYTlmYy02NzcwYTkzM2NmYjNAb3NzLnF1YWxjb21tLmNvbS9fXzshIUE0RjJSOUdf
cGchZUtPcUZXNUV2UzYzYjczTXdnT0RtNmRaMWFPQmNfS0lpYXhiZjBGLTRjUWNLb2NOSHMyaHdl
M0IwdUpUNENIMDNGYTNfU2dIRng3ZzJmcmViREY5YXckIA0KPiBbM10gaHR0cHM6Ly91cmxkZWZl
bnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MTExMDE3MjE0OC4x
NjQwLTEtdHZsYWQ3NDRAZ21haWwuY29tL19fOyEhQTRGMlI5R19wZyFlS09xRlc1RXZTNjNiNzNN
d2dPRG02ZFoxYU9CY19LSWlheGJmMEYtNGNRY0tvY05IczJod2UzQjB1SlQ0Q0gwM0ZhM19TZ0hG
eDdnMmZvbFdtQ2xBUSQgDQo+IFs0XSBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYxMTEwMjEzMzQ2LjEzNTktMS10dmxhZDc0NEBnbWFp
bC5jb20vX187ISFBNEYyUjlHX3BnIWVLT3FGVzVFdlM2M2I3M013Z09EbTZkWjFhT0JjX0tJaWF4
YmYwRi00Y1FjS29jTkhzMmh3ZTNCMHVKVDRDSDAzRmEzX1NnSEZ4N2cyZnJTREpwT0ZRJCANCj4g
DQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyAgICAgIHwgMjUgKysrKysrKysrKysrKysrKysr
KysrKysrLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmggICAgICB8ICA4ICsrKysrKystDQo+
ICBkcml2ZXJzL3VzYi9kd2MzL2RyZC5jICAgICAgIHwgIDYgKystLS0tDQo+ICBkcml2ZXJzL3Vz
Yi9kd2MzL2R3YzMtcWNvbS5jIHwgIDUgKy0tLS0NCj4gIDQgZmlsZXMgY2hhbmdlZCwgMzQgaW5z
ZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91
c2IvZHdjMy9jb3JlLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiBpbmRleCBmZDVjMmNk
MzZjNTkuLjk5YTM5YzgyODU0MyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3Jl
LmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gQEAgLTE2OSwxNSArMTY5LDIz
IEBAIHN0YXRpYyB2b2lkIF9fZHdjM19zZXRfbW9kZShzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmsp
DQo+ICAJaW50IHJldDsNCj4gIAl1MzIgcmVnOw0KPiAgCXUzMiBkZXNpcmVkX2RyX3JvbGU7DQo+
ICsJZW51bSB1c2Jfcm9sZSByZXF1ZXN0ZWRfcm9sZTsNCj4gKwlib29sIG5vdGlmeV9nbHVlOw0K
PiAgCWludCBpOw0KPiAgDQo+ICAJbXV0ZXhfbG9jaygmZHdjLT5tdXRleCk7DQo+ICAJc3Bpbl9s
b2NrX2lycXNhdmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiAgCWRlc2lyZWRfZHJfcm9sZSA9IGR3
Yy0+ZGVzaXJlZF9kcl9yb2xlOw0KPiArCXJlcXVlc3RlZF9yb2xlID0gZHdjLT5yZXF1ZXN0ZWRf
cm9sZTsNCj4gKwlub3RpZnlfZ2x1ZSA9IGR3Yy0+cmVxdWVzdGVkX3JvbGVfcGVuZGluZzsNCj4g
Kwlkd2MtPnJlcXVlc3RlZF9yb2xlX3BlbmRpbmcgPSBmYWxzZTsNCj4gIAlzcGluX3VubG9ja19p
cnFyZXN0b3JlKCZkd2MtPmxvY2ssIGZsYWdzKTsNCj4gIA0KPiAgCXBtX3J1bnRpbWVfZ2V0X3N5
bmMoZHdjLT5kZXYpOw0KPiAgDQo+ICsJaWYgKG5vdGlmeV9nbHVlKQ0KPiArCQlkd2MzX3ByZV9z
ZXRfcm9sZShkd2MsIHJlcXVlc3RlZF9yb2xlKTsNCj4gKw0KPiAgCWlmIChkd2MtPmN1cnJlbnRf
ZHJfcm9sZSA9PSBEV0MzX0dDVExfUFJUQ0FQX09URykNCj4gIAkJZHdjM19vdGdfdXBkYXRlKGR3
YywgMCk7DQo+ICANCj4gQEAgLTI4Nyw3ICsyOTUsOCBAQCBzdGF0aWMgdm9pZCBfX2R3YzNfc2V0
X21vZGUoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiAgCW11dGV4X3VubG9jaygmZHdjLT5t
dXRleCk7DQo+ICB9DQo+ICANCj4gLXZvaWQgZHdjM19zZXRfbW9kZShzdHJ1Y3QgZHdjMyAqZHdj
LCB1MzIgbW9kZSkNCj4gK3N0YXRpYyB2b2lkIF9fZHdjM19xdWV1ZV9tb2RlKHN0cnVjdCBkd2Mz
ICpkd2MsIHUzMiBtb2RlLCBlbnVtIHVzYl9yb2xlIHJvbGUsDQo+ICsJCQkgICAgICBib29sIG5v
dGlmeV9nbHVlKQ0KPiAgew0KPiAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICANCj4gQEAgLTI5
NiwxMSArMzA1LDI1IEBAIHZvaWQgZHdjM19zZXRfbW9kZShzdHJ1Y3QgZHdjMyAqZHdjLCB1MzIg
bW9kZSkNCj4gIA0KPiAgCXNwaW5fbG9ja19pcnFzYXZlKCZkd2MtPmxvY2ssIGZsYWdzKTsNCj4g
IAlkd2MtPmRlc2lyZWRfZHJfcm9sZSA9IG1vZGU7DQo+ICsJaWYgKG5vdGlmeV9nbHVlKSB7DQo+
ICsJCWR3Yy0+cmVxdWVzdGVkX3JvbGUgPSByb2xlOw0KPiArCQlkd2MtPnJlcXVlc3RlZF9yb2xl
X3BlbmRpbmcgPSB0cnVlOw0KPiArCX0NCj4gIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkd2Mt
PmxvY2ssIGZsYWdzKTsNCj4gIA0KPiAgCXF1ZXVlX3dvcmsoc3lzdGVtX2ZyZWV6YWJsZV93cSwg
JmR3Yy0+ZHJkX3dvcmspOw0KPiAgfQ0KPiAgDQo+ICt2b2lkIGR3YzNfc2V0X21vZGUoc3RydWN0
IGR3YzMgKmR3YywgdTMyIG1vZGUpDQo+ICt7DQo+ICsJX19kd2MzX3F1ZXVlX21vZGUoZHdjLCBt
b2RlLCBVU0JfUk9MRV9OT05FLCBmYWxzZSk7DQo+ICt9DQo+ICsNCj4gK3ZvaWQgZHdjM19zZXRf
cm9sZShzdHJ1Y3QgZHdjMyAqZHdjLCB1MzIgbW9kZSwgZW51bSB1c2Jfcm9sZSByb2xlKQ0KPiAr
ew0KPiArCV9fZHdjM19xdWV1ZV9tb2RlKGR3YywgbW9kZSwgcm9sZSwgdHJ1ZSk7DQo+ICt9DQo+
ICsNCj4gIHUzMiBkd2MzX2NvcmVfZmlmb19zcGFjZShzdHJ1Y3QgZHdjM19lcCAqZGVwLCB1OCB0
eXBlKQ0KPiAgew0KPiAgCXN0cnVjdCBkd2MzCQkqZHdjID0gZGVwLT5kd2M7DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+
IGluZGV4IGYzZGFiYjM3ZjgwNi4uZGM3Y2Q3NTFlZDRkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L3VzYi9kd2MzL2NvcmUuaA0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBAQCAt
MTAwMCw3ICsxMDAwLDggQEAgc3RydWN0IGR3YzNfc2NyYXRjaHBhZF9hcnJheSB7DQo+ICAvKioN
Cj4gICAqIHN0cnVjdCBkd2MzX2dsdWVfb3BzIC0gVGhlIG9wcyBpbmRpY2F0ZSB0aGUgbm90aWZp
Y2F0aW9ucyB0aGF0DQo+ICAgKgkJCQluZWVkIHRvIGJlIHBhc3NlZCBvbiB0byBnbHVlIGxheWVy
DQo+IC0gKiBAcHJlX3NldF9yb2xlOiBOb3RpZnkgZ2x1ZSBvZiByb2xlIHN3aXRjaCBub3RpZmlj
YXRpb25zDQo+ICsgKiBAcHJlX3NldF9yb2xlOiBOb3RpZnkgZ2x1ZSBvZiByb2xlIHN3aXRjaCBu
b3RpZmljYXRpb25zLCBjYWxsZWQgZnJvbQ0KPiArICoJCSAgZHJkX3dvcmsgc28gdGhhdCBpdCBk
b2VzIG5vdCBydW4gZHVyaW5nIHN5c3RlbSBzbGVlcA0KPiAgICogQHByZV9ydW5fc3RvcDogTm90
aWZ5IHJ1biBzdG9wIGVuYWJsZS9kaXNhYmxlIGluZm9ybWF0aW9uIHRvIGdsdWUNCj4gICAqLw0K
PiAgc3RydWN0IGR3YzNfZ2x1ZV9vcHMgew0KPiBAQCAtMTA1OCw2ICsxMDU5LDggQEAgc3RydWN0
IGR3YzNfZ2x1ZV9vcHMgew0KPiAgICogQGRyX21vZGU6IHJlcXVlc3RlZCBtb2RlIG9mIG9wZXJh
dGlvbg0KPiAgICogQGN1cnJlbnRfZHJfcm9sZTogY3VycmVudCByb2xlIG9mIG9wZXJhdGlvbiB3
aGVuIGluIGR1YWwtcm9sZSBtb2RlDQo+ICAgKiBAZGVzaXJlZF9kcl9yb2xlOiBkZXNpcmVkIHJv
bGUgb2Ygb3BlcmF0aW9uIHdoZW4gaW4gZHVhbC1yb2xlIG1vZGUNCj4gKyAqIEByZXF1ZXN0ZWRf
cm9sZTogcm9sZSByZXF1ZXN0ZWQNCj4gKyAqIEByZXF1ZXN0ZWRfcm9sZV9wZW5kaW5nOiBAcmVx
dWVzdGVkX3JvbGUgaXMgeWV0IHRvIGJlIHBhc3NlZCB0byB0aGUgZ2x1ZQ0KPiAgICogQGVkZXY6
IGV4dGNvbiBoYW5kbGUNCj4gICAqIEBlZGV2X25iOiBleHRjb24gbm90aWZpZXINCj4gICAqIEBo
c3BoeV9tb2RlOiBVVE1JIHBoeSBtb2RlLCBvbmUgb2YgZm9sbG93aW5nOg0KPiBAQCAtMTI2MSw2
ICsxMjY0LDggQEAgc3RydWN0IGR3YzMgew0KPiAgCWVudW0gdXNiX2RyX21vZGUJZHJfbW9kZTsN
Cj4gIAl1MzIJCQljdXJyZW50X2RyX3JvbGU7DQo+ICAJdTMyCQkJZGVzaXJlZF9kcl9yb2xlOw0K
PiArCWVudW0gdXNiX3JvbGUJCXJlcXVlc3RlZF9yb2xlOw0KPiArCWJvb2wJCQlyZXF1ZXN0ZWRf
cm9sZV9wZW5kaW5nOw0KPiAgCXN0cnVjdCBleHRjb25fZGV2CSplZGV2Ow0KPiAgCXN0cnVjdCBu
b3RpZmllcl9ibG9jawllZGV2X25iOw0KPiAgCWVudW0gdXNiX3BoeV9pbnRlcmZhY2UJaHNwaHlf
bW9kZTsNCj4gQEAgLTE2MTQsNiArMTYxOSw3IEBAIHN0cnVjdCBkd2MzX2dhZGdldF9lcF9jbWRf
cGFyYW1zIHsNCj4gIC8qIHByb3RvdHlwZXMgKi8NCj4gIHZvaWQgZHdjM19zZXRfcHJ0Y2FwKHN0
cnVjdCBkd2MzICpkd2MsIHUzMiBtb2RlLCBib29sIGlnbm9yZV9zdXNwaHkpOw0KPiAgdm9pZCBk
d2MzX3NldF9tb2RlKHN0cnVjdCBkd2MzICpkd2MsIHUzMiBtb2RlKTsNCj4gK3ZvaWQgZHdjM19z
ZXRfcm9sZShzdHJ1Y3QgZHdjMyAqZHdjLCB1MzIgbW9kZSwgZW51bSB1c2Jfcm9sZSByb2xlKTsN
Cj4gIHUzMiBkd2MzX2NvcmVfZmlmb19zcGFjZShzdHJ1Y3QgZHdjM19lcCAqZGVwLCB1OCB0eXBl
KTsNCj4gIA0KPiAgI2RlZmluZSBEV0MzX0lQX0lTKF9pcCkJCQkJCQkJXA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy91c2IvZHdjMy9kcmQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHJkLmMNCj4gaW5k
ZXggZjNlMzdkMzgzNjI3Li41NTAzNjQ2NmVjN2EgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNi
L2R3YzMvZHJkLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kcmQuYw0KPiBAQCAtNDM5LDgg
KzQzOSw3IEBAIHN0YXRpYyBpbnQgZHdjM19kcmRfbm90aWZpZXIoc3RydWN0IG5vdGlmaWVyX2Js
b2NrICpuYiwNCj4gIAllbnVtIHVzYl9yb2xlIHJvbGUgPSBtb2RlID09IERXQzNfR0NUTF9QUlRD
QVBfSE9TVCA/DQo+ICAJCQkJICAgICBVU0JfUk9MRV9IT1NUIDogVVNCX1JPTEVfREVWSUNFOw0K
PiAgDQo+IC0JZHdjM19wcmVfc2V0X3JvbGUoZHdjLCByb2xlKTsNCj4gLQlkd2MzX3NldF9tb2Rl
KGR3YywgbW9kZSk7DQo+ICsJZHdjM19zZXRfcm9sZShkd2MsIG1vZGUsIHJvbGUpOw0KPiAgDQo+
ICAJcmV0dXJuIE5PVElGWV9ET05FOw0KPiAgfQ0KPiBAQCAtNDY4LDggKzQ2Nyw3IEBAIHN0YXRp
YyBpbnQgZHdjM191c2Jfcm9sZV9zd2l0Y2hfc2V0KHN0cnVjdCB1c2Jfcm9sZV9zd2l0Y2ggKnN3
LA0KPiAgCQlicmVhazsNCj4gIAl9DQo+ICANCj4gLQlkd2MzX3ByZV9zZXRfcm9sZShkd2MsIHJv
bGUpOw0KPiAtCWR3YzNfc2V0X21vZGUoZHdjLCBtb2RlKTsNCj4gKwlkd2MzX3NldF9yb2xlKGR3
YywgbW9kZSwgcm9sZSk7DQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+ICANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNv
bS5jDQo+IGluZGV4IGFjNjhiNDIxOGI1Ni4uMmUyNjNiMzc4OTY2IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdj
My1xY29tLmMNCj4gQEAgLTU3OCwxMCArNTc4LDcgQEAgc3RhdGljIHZvaWQgZHdjM19xY29tX3Nl
dF9yb2xlX25vdGlmaWVyKHN0cnVjdCBkd2MzICpkd2MsIGVudW0gdXNiX3JvbGUgbmV4dF9yb2wN
Cj4gIAlwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KHFjb20tPmRldik7DQo+ICAJcG1fcnVudGlt
ZV9wdXRfc3luYyhxY29tLT5kZXYpOw0KPiAgDQo+IC0JLyoNCj4gLQkgKiBDdXJyZW50IHJvbGUg
Y2hhbmdlcyB2aWEgdXNiX3JvbGVfc3dpdGNoX3NldF9yb2xlIGNhbGxiYWNrIHByb3RlY3RlZA0K
PiAtCSAqIGludGVybmFsbHkgYnkgbXV0ZXggbG9jay4NCj4gLQkgKi8NCj4gKwkvKiBSb2xlIGNo
YW5nZXMgYXJlIHNlcmlhbGl6ZWQgYnkgZHdjLT5tdXRleCBpbiBkcmRfd29yayAqLw0KPiAgCXFj
b20tPmN1cnJlbnRfcm9sZSA9IG5leHRfcm9sZTsNCj4gIH0NCj4gIA0KPiANCj4gYmFzZS1jb21t
aXQ6IDY2MjhlN2Q0YzZiMjVjOGQxOGYxMzQ1ZTNhMjBkMjE4MjlhYWU3ZTQNCg0KQWNrZWQtYnk6
IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhp
bmg=
