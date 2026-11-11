Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794438659;
	b=DSg00HqaGL/jGsiun0xmZXuuR2uSgWs8TOAgPP+ZWipp2ZB/Zh6fXDLO8xkWfLdV+JnI
	 CqBCuPNssQn0vG0zQgyXWXUTfAtcmZWeoftijJe6SYtWQ/Akucl4A6FyZMwVuvNq8YCx9
	 A/MTHzlhju0QkzpeX7xH50sK/Nbkg2dh9PGOCyYcxZrm7dxdnyloKJi0y8MuFTK9RLG0A
	 wk2P+1q9ZALL8WETGixMOI1jdlAoCyVYPkIbp2qumaFXE5z1iAOjstTjDBKbjZ4ObfvCJ
	 XTajLnZwCSkhl/msQXoYSojoAoEQax8ilye3raHSrpYmmjmTKgBcA6O/Y7jqjBBWClQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794438659;
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
	bh=VaZRGuREj3cPb1GCy1hqXjwYvwRquRoh/oCDmuzv4yM=;
	b=DJtDsuudc4yyKm3NfmVATQ2LtvZbOq6C5vG3UOSrdI3iJWcX9ghuPCENsYeu1fs4OBQf
	 m3qcbZYR+MmoA3AZj999Avhuzf6gVboAnIwbvFQVaXhwfJ8s2Ay7RNFR1V08urD01wB+s
	 6fsFn6jZrb+7cy3EKC8rFzPyaX2Woi/XijjRiSiWmxoWXRyZISxB8JpZXGGiftHVzWDdf
	 sJnlKFb4fLCPrjEuuMdVs5LgB1YCncCM7tZ5Gybcya44qx7Psg9eMZqYFGjCRpSaNXuIy
	 7BDePkKRBUdSaTFo0mcP9ExlNfLwNzVEFIYdD8LrT9HyHzCmx0RiLkCDv03Lw1wtVDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=A7l69uJE;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=hlw4dHWV;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=VVj9hYaF;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AB2606A33B;
	Wed, 11 Nov 2026 23:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0AB2606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=A7l69uJE;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=hlw4dHWV;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=VVj9hYaF
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABMc8bC1629928;
	Wed, 11 Nov 2026 15:10:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=VaZRGuREj3cPb1GCy1hqXjwYvwRquRoh/oCDmuzv4yM=; b=
	A7l69uJEJSH2/TwEsqAyvgXnL7PjZIE8VDJhcnpByrwQItDvwpsjLLp9Dwn4kahk
	UK+mZr8PMhKzJtGPSh9hxOMZyKmTcJ4dMpACPa74i93Dx+OoMvINq8/qU1Tp5giL
	iY7+dNjdka7dxYy2v/Cq7AMJR2qNhCJCqtYAVUlPiFaEnWRjQ+Z2r6ygkMU3NF6t
	7Z0rcAs6oGTBXjWITeb8kQIHevK56hQCP9qIp8sNfYPbN9WHaF8jP0rsMses3+O4
	gd6CzUzi8Zez0jLz3cB+Hr9IZo7g8HLxsGGnic6ManXSP6JukamA2aOiFb6JMbP6
	H66hcwZ6lzIICI+vWKIEAQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4hvv7x2k9p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 15:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1794438641; bh=VaZRGuREj3cPb1GCy1hqXjwYvwRquRoh/oCDmuzv4yM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=hlw4dHWVJijhN0Faa5JtSwDbFqK9G7Z09vITOn6zAFKjlBHHLxLSViLBvyQpXVve8
	 yHUWDxnFnnWzVL0P2ESWuFKE4V03zEbI7MCnlDeQLlwwYGxRNJtQOGtAJLHLZ/c4A4
	 G04JITI5WV1NCSglp2rLMID/v6ybo4XnFpUbpN6tLxY0Ds5Zql5gMWZ7OGh6XsBPMH
	 KaBtRWeHcXm2Jhdt/34n07RDeEJWeUguMZRiJKXUzoPGq94atD/SpFExQXH7qkn6in
	 Wqix7KqbPW9wlF0B75ufUxjju9SoXJo2ibB6VGhzK4PyHqexP4y2IStVBeccq7urFW
	 mpyQ0JXx7ps5g==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 239C540593;
	Wed, 11 Nov 2026 23:10:40 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 5AA8EA006F;
	Wed, 11 Nov 2026 23:10:40 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=VVj9hYaF;
	dkim-atps=neutral
Received: from CO1PR08CU001.outbound.protection.outlook.com (mail-co1pr08cu00102.outbound.protection.outlook.com [40.93.10.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6478940235;
	Wed, 11 Nov 2026 23:10:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5d+hFMInw9wnFtxuN8GkJZrnsPDtCrlVet2eac+3h0HbOWmUdmEtpqpoyNTXC/nkbFFo5f4PBI6onOW3xRicLQDaZ32xVFnm7h8ZV7I4kZKsST5di8i5hqwBClIXiPfNNzTWns4nEXRdXSB+5fkHdX/7l6YwauUMz8yy2ljuhrJxTMIsF3zVE6U3uELPSvJa5PnzzvmmLxDVjPlk+MS9I6pTO6KsCuwm4IB8qDwrdmCiR2430zQhHG7IwU9PmKBx1IVgk8YbqjUvmIf12//C0fY4WfOvD1hBJ8F5YWbN0ND2+31H/RG2YLWt8iWhc6OZrvLPUgGQRLOtIvCJyUcvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VaZRGuREj3cPb1GCy1hqXjwYvwRquRoh/oCDmuzv4yM=;
 b=nICSKPdWNoemYZn1afITBqGXC7p0HKeAtUo6xj0UID7znLIBNyYOtEvljIMhWunkcuhT6yF/6MloP6wRz8pYaTDYPwqsxE6/qOVfgunGJj9yfZpW0a5yv8XyOqzfdh8PK2x2yHJNSNVCpZ1U627BzSDLBvqAvkvTLxi1QBidNPm7WGStJa8RF0MyGGdBYKAFoLTRUh/pN6BtmUjDOmHTaBqh7at9SczW6Mr2G1RqLcMQWW7zzB/lw2l1yFY2ArK7cydrLlvo1PRMOy6oWXPXe/Dci7cOXCtpBk9Pb56LUg8zEvAQ+O8gZvZTv2RTOxu1CCdXfWkfslE6HCsGhQCqzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VaZRGuREj3cPb1GCy1hqXjwYvwRquRoh/oCDmuzv4yM=;
 b=VVj9hYaFm10sbc/lyC3wO2VyBQrc3D95i+vv/73I3gsES+NO2rrj8Op2r/P1IEKwk/xHbog/Ks+/Ql6c1RGqlZ9Ic7nex3im83zC1lcq497v4rII7WGHhVgXgxUTk+LkMikS/+ulWXxliZLts8B5d71jU9S9xuey+eFyPaN4X8U=
Received: from SJ0PR12MB7473.namprd12.prod.outlook.com (2603:10b6:a03:48d::8)
 by SA3PR12MB7860.namprd12.prod.outlook.com (2603:10b6:806:307::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 11 Nov
 2026 23:10:31 +0000
Received: from SJ0PR12MB7473.namprd12.prod.outlook.com
 ([fe80::fd38:a665:ba4:95d7]) by SJ0PR12MB7473.namprd12.prod.outlook.com
 ([fe80::fd38:a665:ba4:95d7%6]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 23:10:31 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Filippo Falezza <effeffe99@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: qcom: Restore UTMI PIPE clock on resume
Thread-Topic: [PATCH] usb: dwc3: qcom: Restore UTMI PIPE clock on resume
Thread-Index: AQHdZbGMmtCR+ujOrUes259h2sgN5bcpmE0A
Date: Wed, 11 Nov 2026 23:10:31 +0000
Message-ID: <avTyWN_cRhrvLxEB@vbox>
References: <20261027-dwc3-utmi-resume-v1-1-ca9f0aa65783@gmail.com>
In-Reply-To: <20261027-dwc3-utmi-resume-v1-1-ca9f0aa65783@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB7473:EE_|SA3PR12MB7860:EE_
x-ms-office365-filtering-correlation-id: a3b73358-0e35-4432-f001-08df4048fbdb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|5023799004|38070700021|261026140227099003|11063799006|261022075727099003|261028144727099003|261102123227099003|56012099006|261021123027099003|261022105027099003|261021121427099003|261026121527099003|261009223027099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 8a47QTCirno0LW0rSXzhG51P9CcZYFNOdELXcVtOA9iZ1k2hkz00yGMG4eyWQbtosg55bYScKrtrT9FqGvars2hyAhjNxzTY4Y3stKCv8zEYrH6DPFIab3OHr+WugNNMr3/VSAWfpAyaVQAOLADEcgwGINMc3eoJAPejPgdrhz0r1z/I9nLSorD+PTU74FkjTFqid/5jdoRzXDUU7RGN1h3Al0zy/AnSGM9k/9Ky99+zgUX3wZMlG0Hm0m6J8fQm7ONghWoBhcnMX8W19DlN+Khha+muAqC9VmfWso3q6X4E4k34dpEfGFoD4htrWRvuMKuBv/szcCNyPfcQ16LmaC8Dcgu+sZVq2QC9SFhKEG9Xb5ucebUDEnQ0xFuMCQeWfRCTlg8X7DaSQXvGJBl/RvC2sga68vhHKIC6PSHFfa/gHlnDGYTUiZeYmtO3Z0bZeytJgyzeZO50tFkQntfOrvIJkwMWqWltUxIWEKR87C/6iJYohe/QKVvzLClQGLOG417WwqjsXGwZ5b8/2+ks99y6LI4jvTSPf3+PD05lIswRFlWpWafGpSh9GMuhffCI7hkxlVVQK1kvSWQMYVq27y2HtbIoO5ua6fz4Rv8zARrxO8DP0VPpbBAVPO3d5BUMwMQGQh/zXxfviMr3EHWAWU1+iE+LMFE630aLwFk9Vgz8vjjCb74wnOxW2hdUIwGIle3hRsVPyYXVMVE8NTDlqOTJqlbDQ57Em5qQLfaLfR4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB7473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(5023799004)(38070700021)(261026140227099003)(11063799006)(261022075727099003)(261028144727099003)(261102123227099003)(56012099006)(261021123027099003)(261022105027099003)(261021121427099003)(261026121527099003)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YWJ5UEF6bEtUQTBlQTJnMS9GUytxU2h5bWJvVmM4Y1E3M21DNU9ZL3p5UWpx?=
 =?utf-8?B?MWxaZVJGRmxmdFZCL3ZiY01kd2lkZWF1WUhyR0xyWXFsa1VFZ09kTWQxSHpv?=
 =?utf-8?B?ZUxXNkUrTUlHalcyemIzOWFNN1dWNkExRllvUG1Ddi9wTEUrSGpaWG94L2Jv?=
 =?utf-8?B?V0lzNmdySGU3cTVqcXBXdVN1dHRDYWFmZjQ1anY4dFNEa283eW5hRGs2cUZ3?=
 =?utf-8?B?bHIvbmR5M1l6VFYyZFpuZlpyMGtXVXdveldTeEljWjBwaXIySmhJSHNYSFpQ?=
 =?utf-8?B?TU5YU1lpdmY4NTBoRTdVN0UwVW42ZUxsVkNTNE03b0FWd2tnTnYzZlo4ZDEy?=
 =?utf-8?B?ZXFrMTlxaEhkRXFoY3BxRk9IR040ZWZ4c1FTbDlmeEFNeHhBcWVWK215QVox?=
 =?utf-8?B?NTRGeDI1dWdqNVp1NnZnNG1Sck1BcUd3V0VZTzUvbTZKK0RGSVJLQy9sYnlP?=
 =?utf-8?B?TUJNWEhCeFVURkZ1d2E3VEtmeHBuVmJ1QlNvdVdQaTNyUDRNRml4M0dqWDgw?=
 =?utf-8?B?QjE5RGdjSHNoQ004bnN4TkNZd3llckxIMWhieDlGeDBSK21BdXphckdoRlY5?=
 =?utf-8?B?VXNnbVNqaDROVGtOdUV4WTFOK3FsTVBob0VjUUhCNTlSNEdrZDlwUXgvRzVk?=
 =?utf-8?B?clhoVll0OG9Sayt5ZUFqb3JTaEVDQUtSSG9jSm1kTTRXdEdCS2dDVWFjK2cw?=
 =?utf-8?B?Zi9KaTl4SjVBR3VSZ1BlUHpkSWUyNXROdjVqcmx4MXkrOXBrMEw4eTVjckFZ?=
 =?utf-8?B?eFc0Wm10U0ZBbERudmU1MnVCTVNsVjM1aUxBU3RPZWg0NzdzdHo2R1NhNnhr?=
 =?utf-8?B?enlBL3V5UExJQUt2LzdOTDEvSmNNNlB4cmxtRzBYRjlTWmtTbjNHWjduOFl1?=
 =?utf-8?B?MTc1RWpCN3BsSUZKcjJTZjRtN2Z4Vk5EVVpSWksrSG9UbGpOQmVzdEFZQ1h4?=
 =?utf-8?B?WFhMM00zeW02TFo4WUJBMWN0dENicnpPZ0U4V0I5YnFYdXlQQjNlY2RYRU9i?=
 =?utf-8?B?SlpET09xL0lRT0loUjU1Y1JYV2ZTbFJ3M3FOU3VLbklNTm5Jam1LNERkUzA4?=
 =?utf-8?B?U2lyN0t4NExlVDhMbXZ5UW5OcjRHTWw2TkNuWFVUa3Zia1UrTXBSQTA2ZnVm?=
 =?utf-8?B?aEF1UzYreXZzZzNQSFNsY1R4eXFUQjZFRzdlNko3aHN1TFltWit6MHBNak9D?=
 =?utf-8?B?YkNHNm15bERHeWl6anJTdDFuKzU4YjEydWRTOXJ6aE41RSs0V0Z4QndSOFcw?=
 =?utf-8?B?SWpTZ25GYjhZSUtZL0grbVo0TDZRNUhTbk9LeGVWamFyZ25GWklIV3BMZG9V?=
 =?utf-8?B?dVowUWh4cDI1b01iYnBlTDRHNnhsMmpsaWNRc205K1FnMys5a3Mxb1pVdUZH?=
 =?utf-8?B?dXVJQkRZYzJaek9FMzVsbHp6Sm53M3poMjJ5M3ZjbHlhVHJoWFFGRE1LdDRW?=
 =?utf-8?B?UHdIc2g4VmVMUnMvNUVsYnR1cC9pdU50azBQV0I5RDhuMWhwaEJsN3NVQVZZ?=
 =?utf-8?B?dllqTGQyTWxFa0tnbVdVelRzQUhlL3RyRlFMT3ExQVdhNlpubmU5ekRoeWtJ?=
 =?utf-8?B?ekdTRi9zQmk3Z09hNExDSjVHenJES0VOd0V5ZnJha3BWdmxHZ1ZrMWc2SzEx?=
 =?utf-8?B?WWJ2anl5V2VvVVRIa2lPWVhRdjMwOUtoUHNmd2QrRnc4amJDUnVTczVQTDQ3?=
 =?utf-8?B?VDh4WXl3YjlwNFo5UHNkUHZRYlUzSEMyM2ZvREFxNlNmb0s0NzBYSWVxRFNz?=
 =?utf-8?B?ZFMrQjFpT2VjejRpV1V1WHUrRndHTzZxNmkyc09Lei9BdjM1ajBmcHE1c1Ix?=
 =?utf-8?B?REw1LzlSRC9PQTR2aDg2OTRkSE5pWFVBQ2RSN2h6SU1laGV1T1UzZHZYenY4?=
 =?utf-8?B?dGFCUEFZY3NvcDhHU0huNjdaMUtnakRHL29ySlVJbU5zQjFJZHRvYU1hdEhw?=
 =?utf-8?B?VDkyVW4rN3lkOWsyLzFJWFBSZGViTzhzYjh1ekc1SmQwdDBiNHdHOVNMMEdX?=
 =?utf-8?B?R0svNTl5L2czeGZ1NmEybGJHWDIwbE9jSnB1VzdFbzUyYU9qS2VCY0cxMGZW?=
 =?utf-8?B?OHRlWHdJWXRiWFhJUUVFblFpaFNETXNWQUlpejlTbXU3RVZsTllqSEdaZlNu?=
 =?utf-8?B?ZWQ4VHQvTVZTakZUYkRjWHluV1JGWGRZVlcySGtFYWw1L2k3UDcyUlhIU1V3?=
 =?utf-8?B?dkpwZ2xwdFJYdk0yQ1EySWU3Sm83YmpNT2VORTFiZVpCVWRFV2Vxbm5oSkgy?=
 =?utf-8?B?eVJTRzZBL0phaWZJdWJ4L3lKY0ZOcWpVaU5uWTFIMmZoeFBqaUNLWlVZSUJo?=
 =?utf-8?B?NncvYy9LT2E2UDd2ZkVXWFVxMFd3c2dZYUJIQmxKTktobWJKNkxyQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5CBF7C50A96FD42864310CD332F9B50@namprd12.prod.outlook.com>
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
	tuc3mdkgDQFupcv5aG08IkNJkaeQFjeTZH0/wZVJur9oqUUwT/r2+uuGnDM6H+re6RZEwFaqZGSewf8sSyB75yRViOqFpNf5AROyvokMxA8wh3vzD0ry7tNSahw40VXxmqKxm5c3nZzDXL+iR3Ucc6h/axIN2z8CavkaO2igX/RMGu79ie8gKlN3UFY7pXyEjcgfn+l1rmwewY/q6wgj61KRXQExXfHNX9nidWnFsoOH60MXQr6ZKsLduG3wztvSI9BpdP5sbBhyK+7S2tGAClFje941/GZhyb9FNFjtTGwCRSYxCvkPJSiRpwaUS6iciXY91xETZYvVvC+fWfycrA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qdPDrS+CMzU/owd4pVkbIcY/hyGgEcz+KpQ1ay94pMJenAKGBEJEFiZMJNKqkBVdW3viTj+GxFIxwr0w8jtueKXn/fZasYV5/GlgsbTytM6jACq7W64iCs1K/09SW6wRCMm2uH28MDkHkJvZEqLtLUDDfXBAGDqtJs4jOEGfUEEtObaTCwRb6lUgEZdeH2EcqzcFMPdPa1RVJ0UUF3kPNhxGbaIAImYL63Y7u4XgENaJUIsMO3m84iQp9juCXX6JmeA8VlH9/gCx4P3r6tnBK5o4ghF3SB1t8Al9g0oAH38y6nol+M+7UvclWjrCEF3jdLxDfN0oNmPuygpnzTxRFjkVVrlNQ/c8I4oHne1N1CRxoLYKPSX4ySBAxaYgV20IkIYQ2o/KXdUlfKKOFVfK9aTVB6YN5vCtzutvjR6gyIURK2vexZTvqgG8BtGGvahO8N1RmG9ZE3Ye1v8giS7nF+FWQgQ98ply8mYJHUczfUkVGpLh8gCeBWKj9oYEC+GRS8G05xxIX37GfkaNKITiwZeJCDlD/5D9R0E8r/3zeYwAQyKu7+zfZ7tFJmX6P+Rgp7UI6vpXOGfws7yT+/BnhfdWqCFTE2doq6YmjUvXGmQBFb0Dm71lA3uIdE9utt8WN97Z8GVvbLEVihg9gtGZiA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3b73358-0e35-4432-f001-08df4048fbdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 23:10:31.6860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v2q4KB6m00avh6V/ogXTD6oL3m/lk+reSXe5m7oM8hm85R6Gb28unNuiHwAltV/NP3JOFJTFiGHm3zlG7/HtRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7860
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA5MiBTYWx0ZWRfX2/iPg1/k3/Sr
 c1i1lV/z9QT52r6bAVR3pMx0kkHCXmi6kNN+Dt+si0I9KGdOQHP+oPFTvPlxrhEKo47y7hA3MRM
 uU0dIKxkjpPWfKYcHM8GXiIDu8eJLSVlImaf/O74BiNGQxInrK6W4V51AKopbf87vbNzs6kHiHy
 9J+EYW5IpHsX++is/zoWljaQPfwUz4TPwpcxYJ3iYaXmKiAv9NfimwHO8MSDLAn/h0GgiqI4vIO
 Z/1eEkADAxoCraUm9Mlu0ZSK3HkwpnVQRnH6L5M7W3kkrzO2swE0JQEPU4fB6SVawEjIsxTkLUp
 GjWsMcS9GJ+/kAXdjaE6+JkNpYizITst9ijnv1T4XRyqecqPpx93QEEqFKibo6BLPdL5BYGuAu2
 hV46loxAK3PNCp2TaPKOr3NMrKmJxmnvN4o8Ou74SWjvQ/myQybwKpUMI0f16TwboGm1yFyhQyw
 vjWlenNVxPRm/ULcsxA==
X-Authority-Analysis: v=2.4 cv=IuaL47/g c=1 sm=1 tr=0 ts=6af4f5f2 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=pGLkceISAAAA:8 a=UFfxpPmIKsRxgO7ZzzUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: dRprR_8nfKakrlbn679S9xnBJ5BRM8mF
X-Proofpoint-ORIG-GUID: dRprR_8nfKakrlbn679S9xnBJ5BRM8mF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA5MiBTYWx0ZWRfX87eX27HRJo6R
 JQELRRdCP+DoCIFxbvxFTJ4lRB6VXSAYEnSRess2qTROQfY5fXJqpyFojDIN54l5PFxdom2qH5T
 aGIyMq03iwFVL8rYecL5pFnbJLPadrU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611110092

SGksDQoNCk9uIFR1ZSwgT2N0IDI3LCAyMDI2LCBGaWxpcHBvIEZhbGV6emEgd3JvdGU6DQo+IEJv
YXJkcyB3aG9zZSBjb250cm9sbGVyIGhhcyBubyBTdXBlclNwZWVkIFBIWSBzZXQNCj4gcWNvbSxz
ZWxlY3QtdXRtaS1hcy1waXBlLWNsaywgYW5kIHRoZSBnbHVlIHRoZW4gcHJvZ3JhbXMgUVNDUkFU
Q0gNCj4gR0VORVJBTF9DRkcgc28gdGhhdCB0aGUgY29yZSdzIFBJUEUgY2xvY2sgZG9tYWluIHJ1
bnMgZnJvbSB0aGUgVVRNSQ0KPiBjbG9jay4gVGhpcyBpcyBvbmx5IGRvbmUgYXQgcHJvYmUuDQo+
IA0KPiBXaGVuIHRoZSBTb0MgcmVhY2hlcyBpdHMgZGVlcGVzdCBzdGF0ZSBpbiBzdXNwZW5kLXRv
LWlkbGUgKENYIHBvd2VyDQo+IGNvbGxhcHNlKSwgdGhlIFFTQ1JBVENIIHJlZ2lzdGVycyBsb3Nl
IHRoZWlyIGNvbnRlbnRzLiBPbiByZXN1bWUgdGhlDQo+IGNvcmUgaXMgcmVpbml0aWFsaXNlZCB3
aXRoIGl0cyBQSVBFIGRvbWFpbiB1bmNsb2NrZWQsIGFuZCB0aGUgZ2FkZ2V0DQo+IGRvZXMgbm90
IGNvbWUgYmFjazoNCj4gDQo+ICAgZHdjMy1xY29tIGE2MDAwMDAudXNiOiBmYWlsZWQgdG8gZW5h
YmxlIGVwMG91dA0KPiANCj4gVGhlIGxpbmsgc3RheXMgZG93biB1bnRpbCB0aGUgZHJpdmVyIGlz
IHVuYm91bmQgYW5kIGJvdW5kIGFnYWluLg0KPiANCj4gUmVtZW1iZXIgdGhlIHByb3BlcnR5IGF0
IHByb2JlIGFuZCBzZWxlY3QgdGhlIFVUTUkgY2xvY2sgYWdhaW4gaW4NCj4gZHdjM19xY29tX3Jl
c3VtZSgpLCBhZnRlciB0aGUgY2xvY2tzIGFuZCBpbnRlcmNvbm5lY3QgcGF0aHMgYXJlIGVuYWJs
ZWQNCj4gYW5kIGJlZm9yZSB0aGUgY29yZSBpcyByZXN1bWVkLiBNb3ZlIGR3YzNfcWNvbV9zZWxl
Y3RfdXRtaV9jbGsoKSB1cCBzbw0KPiB0aGF0IGl0IGlzIGRlZmluZWQgYmVmb3JlIGl0cyBuZXcg
Y2FsbGVyLg0KPiANCj4gRml4ZXM6IGE0MzMzYzNhNmJhOSAoInVzYjogZHdjMzogQWRkIFF1YWxj
b21tIERXQzMgZ2x1ZSBkcml2ZXIiKQ0KDQpCYXNlZCBvbiB5b3VyIGRlc2NyaXB0aW9uLCB3ZSBz
aG91bGQgYWRkIENjIHRvIHN0YWJsZSB0YWcuDQoNCj4gU2lnbmVkLW9mZi1ieTogRmlsaXBwbyBG
YWxlenphIDxlZmZlZmZlOTlAZ21haWwuY29tPg0KPiAtLS0NCj4gSGVsbG8gdGhlcmUsDQo+IA0K
PiB0aGlzIGZpeGVzIFVTQiBwZXJpcGhlcmFsIG1vZGUgYWZ0ZXIgc3VzcGVuZCBvbiBhIE1vdG9y
b2xhIE1vdG8gRyA1Rw0KPiBQbHVzIChTTTcyNTApLCBhIHBob25lIHdpdGggYSBVU0IgMi4wLW9u
bHkgcG9ydCB0aGF0IEknbSBicmluZ2luZyB1cCBvbg0KPiBtYWlubGluZS4gSXRzIGNvbnRyb2xs
ZXIgbmVlZHMgcWNvbSxzZWxlY3QtdXRtaS1hcy1waXBlLWNsay4gVGhlIGZpcnN0DQo+IHMyaWRs
ZSB0aGF0IHJlYWNoZWQgQ1ggcG93ZXIgY29sbGFwc2UgYnJva2UgdGhlIGdhZGdldDogImZhaWxl
ZCB0bw0KPiBlbmFibGUgZXAwb3V0IiBvbiByZXN1bWUsIGFuZCBVU0IgbmV0d29ya2luZyBzdGF5
ZWQgZG93biB1bnRpbCBJDQo+IHJlYm91bmQgZHdjMy1xY29tIGJ5IGhhbmQuIFJlYmluZGluZyB3
b3JrcyBiZWNhdXNlIHByb2JlIHByb2dyYW1zDQo+IEdFTkVSQUxfQ0ZHIGFnYWluLCB3aGljaCBp
cyB3aGF0IHRoaXMgcGF0Y2ggZG9lcyBpbiB0aGUgcmVzdW1lIHBhdGguDQo+IA0KPiBXaXRoIHRo
ZSBwYXRjaCwgdGhlIGdhZGdldCAoTkNNIHBsdXMgQUNNKSByZWNvbm5lY3RzIGFmdGVyIHMyaWRs
ZSwgYW5kDQo+IHRoZSBTU0ggc2Vzc2lvbiBvdmVyIHRoZSBjYWJsZSB0aGF0IEkgdXNlIGZvciB0
ZXN0aW5nIHN1cnZpdmVzDQo+IHN1c3BlbmQ7IHRoZSBwaG9uZSBoYXMgcnVuIHdpdGggaXQgb24g
bGludXgtbmV4dCBzaW5jZSAxMSBPY3RvYmVyLg0KPiBUaGUgb3RoZXIgYm9hcmRzIHRoYXQgdXNl
DQo+IHFjb20sc2VsZWN0LXV0bWktYXMtcGlwZS1jbGsgc2hvdWxkIGJlbmVmaXQgYXMgd2VsbCwg
YnV0IEkgaGF2ZSBvbmx5DQo+IHRlc3RlZCB0aGlzIG9uZSwgaW4gcGVyaXBoZXJhbCBtb2RlLiBU
aGUgbGVnYWN5IGdsdWUgZHJpdmVyDQo+IChkd2MzLXFjb20tbGVnYWN5LmMpIGhhcyB0aGUgc2Ft
ZSBwcm9iZS1vbmx5IHByb2dyYW1taW5nOyBJIGxlZnQgaXQNCj4gYWxvbmUgYmVjYXVzZSBJIGNh
bid0IHRlc3QgaXQuDQo+IA0KPiBUaGUgcGF0Y2ggaXMgb24gdG9wIG9mIHVzYi1saW51cyAoNmI0
YjU0M2ZhMTg3KSBhbmQgYnVpbGRzIHdpdGggVz0xIGZvcg0KPiBhcm02NC4NCj4gDQo+IEkgd3Jv
dGUgdGhpcyBwYXRjaCBhbmQgZHJhZnRlZCB0aGlzIG5vdGUgd2l0aCB0aGUgaGVscCBvZiBhbiBB
SSBjb2RpbmcNCj4gYXNzaXN0YW50IChDbGF1ZGUgQ29kZSkuIFRoZSB0ZXN0aW5nIGFib3ZlIGlz
IG9uIHRoZSBwaG9uZS4NCj4gDQo+IFRoYW5rcywNCj4gRmlsaXBwbw0KPiAtLS0NCj4gIGRyaXZl
cnMvdXNiL2R3YzMvZHdjMy1xY29tLmMgfCA0NSArKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDE3
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1x
Y29tLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jDQo+IGluZGV4IGFjNjhiNDIxOGI1
Ni4uNjMzNGNhN2JhMzBmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNv
bS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gQEAgLTgxLDYgKzgx
LDcgQEAgc3RydWN0IGR3YzNfcWNvbSB7DQo+ICAJZW51bSB1c2JfZHJfbW9kZQltb2RlOw0KPiAg
CWJvb2wJCQlpc19zdXNwZW5kZWQ7DQo+ICAJYm9vbAkJCXBtX3N1c3BlbmRlZDsNCj4gKwlib29s
CQkJdXRtaV9hc19waXBlX2NsazsNCj4gIAlzdHJ1Y3QgaWNjX3BhdGgJCSppY2NfcGF0aF9kZHI7
DQo+ICAJc3RydWN0IGljY19wYXRoCQkqaWNjX3BhdGhfYXBwczsNCj4gIA0KPiBAQCAtMzM1LDYg
KzMzNiwyMyBAQCBzdGF0aWMgdm9pZCBkd2MzX3Fjb21fZW5hYmxlX2ludGVycnVwdHMoc3RydWN0
IGR3YzNfcWNvbSAqcWNvbSkNCj4gIAkJZHdjM19xY29tX2VuYWJsZV9wb3J0X2ludGVycnVwdHMo
JnFjb20tPnBvcnRzW2ldKTsNCj4gIH0NCj4gIA0KPiArc3RhdGljIHZvaWQgZHdjM19xY29tX3Nl
bGVjdF91dG1pX2NsayhzdHJ1Y3QgZHdjM19xY29tICpxY29tKQ0KPiArew0KPiArCS8qIENvbmZp
Z3VyZSBkd2MzIHRvIHVzZSBVVE1JIGNsb2NrIGFzIFBJUEUgY2xvY2sgbm90IHByZXNlbnQgKi8N
Cj4gKwlkd2MzX3Fjb21fc2V0Yml0cyhxY29tLT5xc2NyYXRjaF9iYXNlLCBRU0NSQVRDSF9HRU5F
UkFMX0NGRywNCj4gKwkJCSAgUElQRV9VVE1JX0NMS19ESVMpOw0KPiArDQo+ICsJdXNsZWVwX3Jh
bmdlKDEwMCwgMTAwMCk7DQo+ICsNCj4gKwlkd2MzX3Fjb21fc2V0Yml0cyhxY29tLT5xc2NyYXRj
aF9iYXNlLCBRU0NSQVRDSF9HRU5FUkFMX0NGRywNCj4gKwkJCSAgUElQRV9VVE1JX0NMS19TRUwg
fCBQSVBFM19QSFlTVEFUVVNfU1cpOw0KPiArDQo+ICsJdXNsZWVwX3JhbmdlKDEwMCwgMTAwMCk7
DQo+ICsNCj4gKwlkd2MzX3Fjb21fY2xyYml0cyhxY29tLT5xc2NyYXRjaF9iYXNlLCBRU0NSQVRD
SF9HRU5FUkFMX0NGRywNCj4gKwkJCSAgUElQRV9VVE1JX0NMS19ESVMpOw0KPiArfQ0KPiArDQo+
ICBzdGF0aWMgaW50IGR3YzNfcWNvbV9zdXNwZW5kKHN0cnVjdCBkd2MzX3Fjb20gKnFjb20sIGJv
b2wgd2FrZXVwKQ0KPiAgew0KPiAgCXUzMiB2YWw7DQo+IEBAIC0zODgsNiArNDA2LDE1IEBAIHN0
YXRpYyBpbnQgZHdjM19xY29tX3Jlc3VtZShzdHJ1Y3QgZHdjM19xY29tICpxY29tLCBib29sIHdh
a2V1cCkNCj4gIAlpZiAocmV0KQ0KPiAgCQlkZXZfd2FybihxY29tLT5kZXYsICJmYWlsZWQgdG8g
ZW5hYmxlIGludGVyY29ubmVjdDogJWRcbiIsIHJldCk7DQo+ICANCj4gKwkvKg0KPiArCSAqIFRo
ZSBRU0NSQVRDSCByZWdpc3RlcnMgbG9zZSB0aGVpciBzdGF0ZSB3aGVuIHRoZSBjb250cm9sbGVy
J3MgcG93ZXINCj4gKwkgKiBkb21haW4gaXMgY29sbGFwc2VkIGR1cmluZyBzeXN0ZW0gc3VzcGVu
ZDogc2VsZWN0IHRoZSBVVE1JIGNsb2NrDQoNCklzIHRoaXMgc3BlY2lmaWMgdG8gc3lzdGVtIHBt
PyBUaGlzIGZ1bmN0aW9uIGlzIGFsc28gY2FsbGVkIG9uIHJ1bnRpbWUNCnJlc3VtZSwgYWRkaW5n
IGEgZGVsYXkgdXAgdG8gMm1zIGFuZCBwaXBlIGNsb2NrIGdhdGluZy4gVGhpcyB3b3VsZCBhbHNv
DQphcHBseSBmb3IgaG9zdCBtb2RlIHdpdGggd2FrZXVwIGVuYWJsZWQsIGNvdWxkIHRoYXQgY2F1
c2UgYSBwcm9ibGVtDQp0aGVyZT8NCg0KPiArCSAqIGZvciB0aGUgUElQRSBkb21haW4gYWdhaW4s
IG9yIHRoZSBjb3JlIGNhbid0IHJ1biB3aXRob3V0IGEgUElQRQ0KPiArCSAqIGNsb2NrICgiZmFp
bGVkIHRvIGVuYWJsZSBlcDBvdXQiKS4NCj4gKwkgKi8NCj4gKwlpZiAocWNvbS0+dXRtaV9hc19w
aXBlX2NsaykNCj4gKwkJZHdjM19xY29tX3NlbGVjdF91dG1pX2NsayhxY29tKTsNCj4gKw0KPiAg
CS8qIENsZWFyIGV4aXN0aW5nIGV2ZW50cyBmcm9tIFBIWSByZWxhdGVkIHRvIEwyIGluL291dCAq
Lw0KPiAgCWZvciAoaSA9IDA7IGkgPCBxY29tLT5udW1fcG9ydHM7IGkrKykgew0KPiAgCQlkd2Mz
X3Fjb21fc2V0Yml0cyhxY29tLT5xc2NyYXRjaF9iYXNlLA0KPiBAQCAtNDE5LDIzICs0NDYsNiBA
QCBzdGF0aWMgaXJxcmV0dXJuX3QgcWNvbV9kd2MzX3Jlc3VtZV9pcnEoaW50IGlycSwgdm9pZCAq
ZGF0YSkNCj4gIAlyZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ICB9DQo+ICANCj4gLXN0YXRpYyB2b2lk
IGR3YzNfcWNvbV9zZWxlY3RfdXRtaV9jbGsoc3RydWN0IGR3YzNfcWNvbSAqcWNvbSkNCj4gLXsN
Cj4gLQkvKiBDb25maWd1cmUgZHdjMyB0byB1c2UgVVRNSSBjbG9jayBhcyBQSVBFIGNsb2NrIG5v
dCBwcmVzZW50ICovDQo+IC0JZHdjM19xY29tX3NldGJpdHMocWNvbS0+cXNjcmF0Y2hfYmFzZSwg
UVNDUkFUQ0hfR0VORVJBTF9DRkcsDQo+IC0JCQkgIFBJUEVfVVRNSV9DTEtfRElTKTsNCj4gLQ0K
PiAtCXVzbGVlcF9yYW5nZSgxMDAsIDEwMDApOw0KPiAtDQo+IC0JZHdjM19xY29tX3NldGJpdHMo
cWNvbS0+cXNjcmF0Y2hfYmFzZSwgUVNDUkFUQ0hfR0VORVJBTF9DRkcsDQo+IC0JCQkgIFBJUEVf
VVRNSV9DTEtfU0VMIHwgUElQRTNfUEhZU1RBVFVTX1NXKTsNCj4gLQ0KPiAtCXVzbGVlcF9yYW5n
ZSgxMDAsIDEwMDApOw0KPiAtDQo+IC0JZHdjM19xY29tX2NscmJpdHMocWNvbS0+cXNjcmF0Y2hf
YmFzZSwgUVNDUkFUQ0hfR0VORVJBTF9DRkcsDQo+IC0JCQkgIFBJUEVfVVRNSV9DTEtfRElTKTsN
Cj4gLX0NCj4gLQ0KPiAgc3RhdGljIGludCBkd2MzX3Fjb21fcmVxdWVzdF9pcnEoc3RydWN0IGR3
YzNfcWNvbSAqcWNvbSwgaW50IGlycSwNCj4gIAkJCQkgY29uc3QgY2hhciAqbmFtZSkNCj4gIHsN
Cj4gQEAgLTY4MCw2ICs2OTAsNyBAQCBzdGF0aWMgaW50IGR3YzNfcWNvbV9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCSAqLw0KPiAgCWlnbm9yZV9waXBlX2NsayA9IGRl
dmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LA0KPiAgCQkJCSJxY29tLHNlbGVjdC11dG1pLWFz
LXBpcGUtY2xrIik7DQoNCk1pbm9yIG5pdDogZG8gd2UgbmVlZCB0aGlzIGxvY2FsIHZhcmlhYmxl
IGlnbm9yZV9waXBlX2NsayBub3c/DQoNCj4gKwlxY29tLT51dG1pX2FzX3BpcGVfY2xrID0gaWdu
b3JlX3BpcGVfY2xrOw0KPiAgCWlmIChpZ25vcmVfcGlwZV9jbGspDQo+ICAJCWR3YzNfcWNvbV9z
ZWxlY3RfdXRtaV9jbGsocWNvbSk7DQo+ICANCj4gDQoNCg0KVGhhbmtzLA0KVGhpbmg=
