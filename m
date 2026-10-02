Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAE72773E4;
	Fri,  2 Oct 2026 01:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790906381; cv=fail; b=GXwFCVd8ot6zJsywgYpvKfT6Y6Ku7koSM7ceJddyYq4/dvUn12oH9o2UD2YJ+Sa9461cGvQWW0T60j2yPafMOi6lh6t5F4nEdUuLwX5Em0MbjVAD0rgo1SzvVxPrBuhCgEQwrSVodmRDkXMwxoLC7dX+v3u0Gw/PG6f7g4bB82s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790906381; c=relaxed/simple;
	bh=2vfLePrx72Dl8GZ+t1Z7CBUXLkaXF5agAqhjMLHxxmQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WyaBFKMfveRyJmAzlDBsrPQ3BzTO3KE6xJew4djYxY1+zLXPXr8haBoQmLXZNdE96M8zEsGK45GZ3uAp7JWVHjOF7r0c+E7KXZDSjJJDt/zcUQY/qcYLQ/G3JydExVoaUVquCSYT7u/cTQiRhYNgwQoQtgNIjddpd3ICh8YKc5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hCazcEvv; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kpbzJ3KO; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kAiWea8E reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hCazcEvv";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kpbzJ3KO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kAiWea8E"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691NGVlJ2408098;
	Thu, 1 Oct 2026 18:59:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=2vfLePrx72Dl8GZ+t1Z7CBUXLkaXF5agAqhjMLHxxmQ=; b=
	hCazcEvv97Fy4CA6zgaOQLjqTEJk6SWBHOsHa4iQhue1ew+mSojZQmUviVA1hXdo
	uhYdD1f0n9dSqHGOMz29vEWVKwdTxlsd1nPDKS7//a66anydfnneDQ7Qo9TxUfRv
	zA7JxoQyMkzLOI5XRskupFNy0Ap/6GjMkkOw/bbthDDNw8c+tUvix3za8CjP5O0a
	yxU+hlws4Iu1qq3994nkr2rNfa6GN6Hca0fqan4vgx2htUozUzkURLDAeOJPD060
	IPU0tTZLfLzc2sU0mb2NIbvbYdulQfPafL/x8+76H9I6R765AzM6Uwp8t4Qa0M8a
	2PlIiax6zjwG3NurZkxlVw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4h1f3j8gq7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 18:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1790906358; bh=2vfLePrx72Dl8GZ+t1Z7CBUXLkaXF5agAqhjMLHxxmQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=kpbzJ3KOqCAPjnPcLzMUdFRsC6s299j7dw/BIffNdyU2ZjCEX5rwThaXWVMsQ8x5g
	 AjK3JUipujlvlBszvdII8Lrj3MOClP3slFS8wqNSQ+BnYZFLKHtXdDiEJ07xqpH41h
	 5aCutLdx7EwYlmmDkMe0Z+J7v5iXeBrfJOJLvT1KtscR2yM4GmNe+jqPaCEPETLxeD
	 YCAMAW1oJfEXjiiKNkZrPUJMzJVllX+axUXCqNx5J06JkNGPdWqjk3nxGhP56cw4IC
	 XoTfserikujHZG1gPrHvHdmXHMaQ0rIfPQ1BrIlWNKOTL+JWlrZIumnvaebfqQVpqS
	 4eBBteiY/51+w==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A47E14019D;
	Fri,  2 Oct 2026 01:59:16 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E8473A00B0;
	Fri,  2 Oct 2026 01:59:15 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=kAiWea8E;
	dkim-atps=neutral
Received: from CY3PR08CU001.outbound.protection.outlook.com (mail-cy3pr08cu00100.outbound.protection.outlook.com [40.93.6.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 188C740549;
	Fri,  2 Oct 2026 01:59:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZjIZfuzTmMQb9JSVL7TRcq0YP7r0fHEgAP4fM5tkfo/O+IXmsNachMcDoG/tdHt2VKUsYlO0E3KRDKAm4pkhVrIrCPRA4gG15YWGijnztjjzFeH/OC8AFRvflFWogHJDTGVSGq3L/Ahp+czp1sLKe5mWKxtz8WubQ9xgesmJ2YZVOCxFilxMHzaxiZ8txR7GES2quzEmGglDJ/O8oOtGOyLystzcOi3Xvf0FB0GIPeHmrc1i6lmRnoWm8wvxuRqifOrFhsPpIV04rWZKNJQ0EnD/QlhcBxIwYoo/4186cY1DoHyth+s9pIGMOz2ZzHj9j4KnTiuA7Bxez21CHYg5+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vfLePrx72Dl8GZ+t1Z7CBUXLkaXF5agAqhjMLHxxmQ=;
 b=K1/uRpofg2EzqdebNcOouT/DHsbjmZHHky11skyEWQemCKBPJibf877yyg/94blP8GV8YrISwZ2mKdCjQRD0FiB/yA7DNTO4sKef/n97V20Am+pLGj4l1VjWN9LplH2cL7GULoKOcdDvW9f9IDbYArRFyuLBava3ac8Hvb/tRh61LaFb/Hp3f3AGF6WxMf6fcfQVnZGJrSn77dry2FAsKF7wB96wekTNxp6cEOM6qSXbTQx3Qb1zjNBp60ZdienVsiHrIkxNhgyTiLHpbby1qDIpHRBSL8dgTIcZ8AA77PpfMX1buYt/l5riRHphfrb0aOt5RPYB4KBb7KCrSDiFzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vfLePrx72Dl8GZ+t1Z7CBUXLkaXF5agAqhjMLHxxmQ=;
 b=kAiWea8EXKJLjUBTm60gzoeeDDi3DMN8oChfcxhnFOq+XTsOcc8PnTAOrP8IYReRaHORg071VhQA2NjAUYTwaYEvsOzeID0i+HaWxNuI1GU4YkisQMVkeJHV/ekin9QuLvGRZkcRxG0R47eNuT5u9e634XE6NWZhA0/29FoxNr0=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DM4PR12MB8497.namprd12.prod.outlook.com (2603:10b6:8:180::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 01:59:07 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0451.026; Fri, 2 Oct 2026
 01:59:07 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Pengpeng Hou <hppiscas@163.com>
CC: "patrice.chotard@foss.st.com" <patrice.chotard@foss.st.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2] usb: dwc3: st: balance reset ownership on deassert
 failure
Thread-Topic: [PATCH v2] usb: dwc3: st: balance reset ownership on deassert
 failure
Thread-Index: AQHdSityU5U/daKomESPbT6gHGKJibbpjrkA
Date: Fri, 2 Oct 2026 01:59:07 +0000
Message-ID: <ar8Or_quJnEiHknR@vbox>
References: <20260922004312.3589-1-hppiscas@163.com>
In-Reply-To: <20260922004312.3589-1-hppiscas@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DM4PR12MB8497:EE_
x-ms-office365-filtering-correlation-id: 3d1e1b4d-92e1-497e-980b-08df2028be39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|5023799004|11063799006|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 +Qqx7v5iTti/IM4yEs0BwWOL2wjucuOBNlPQMGtdnaexcGGWS9Oa9QZjdQgXZ0d6krA0qUQ7SF97oi1BGsRVFlJs6/CX2oCgOkf0eqixpeGeA252H78jYxnXU9FfsNLQSUBKmnSuvZn9u0LJT0By+T/ng3fS3ptnutias/aiJBTTn8gr69jQQuTZgrxzC8GEJvJZAN1GDtmE/rL/SfK9gzyeWrAZjVtHdCMc7ZRD9y6JtaFUr8uj99WmoCWH+K5Yp7XxSkoGr1xottnmfef/1CsImIyx/2Dla4N6xkeXWxXsjLeh5Ef3AthpMpV0bugDVHubY3dOjtlf7vvUBPPzxA/6KI0zGLGb9MOuSal2aSa02ImZz7sn7PpjEWn46eSKkCc7moMZkVPyrsQ1wR0bXJeYjbq3BIG7QU+TywTo9R63/rQrwdn6nN+Lk+xpCPdaIjKzAxmGDBw2naOlfiSffw27aeNlQtjYn39hiEyYuaOq6cGln8wA9UD7QLrq/sLoBhvZ9XEFiR9tnTdID1vBOT1gvRcSepQS8GKYMCgSTRFiPEDAh6f8aH843PXWr0+AxTvuPfbC762DOI0Y79UMjuGbu0cSC2kKgGA4VKbd6QEQxHf4o3+XYjc2uSwsjppG3lZHf8fIShrPMJBKm/KypPqmxe33RZTe9MD0cguN3ZDaHJtFzSj/J/Hq1Dfc37UpiUNJ2txC2zoAlCBfz9D5/XE0Z/o0paQVcj+PhdHVnd4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NFdzTHRIN1VWcm1QVFg0akk2S01RRGdhWTErTTJpaGlYd3J1VlZkRkpqcFlM?=
 =?utf-8?B?TjdjOGRna3FLTDJYU1VveEdWRk9JdGRYT0lTVnVlV0h6RkRnU0F6TGtsVERp?=
 =?utf-8?B?VXRsZXNCQUNpUk80bVRNbmtYUVFZUlF0ZU9velZYUTNFTU9RbFdhczJsZFdY?=
 =?utf-8?B?STV4aFNxc1plUmFmTzRKTEZScndLallvWTNTTk1mRjhqc09vb0dScloxRlhh?=
 =?utf-8?B?MnlPL3BmMzhMNWdkUEJKOERpOUllTnRJTlpJemdaNzlGdnkzQjhTU2NKaWJZ?=
 =?utf-8?B?OC9QZXV2V2IxRnZkZ1RYRC8xeDQrM3E1K3BTaXZVNXZzN2dvTC92TlVVR3VV?=
 =?utf-8?B?S0FESmczUTdiSGxSUThTT0pXRDErS0N4aVNDVVkwcXlwRUFSWlMxQzNOWFJn?=
 =?utf-8?B?TzM5UFpvbkl5UDlVeGcvZWJSUjlHQmphN3RYOWZPZlpzRjhLQjZiWWo5SS9u?=
 =?utf-8?B?aWovQm8vSUNYbDluRkoyVTJrK2VYcE9IMm4wNGoxdzBBdEc2VnhETURkSVdo?=
 =?utf-8?B?RUtVV2lSb3huUDZBNzZPdDByeWNpQTFwcmg5VGtDSDd2U3gxRW93RmUvTFRx?=
 =?utf-8?B?WWw4TVJzcVZNS0RhM2c1RmIxWkRFNnM5YnB1aEh0Lzc1ZTJNem1ZaVYzcWhl?=
 =?utf-8?B?cUJTOXpUVnErcDkxeXJmOTU2STk0SWpVSkFVMkhObFNUbkgyU3c3SWhXQTN2?=
 =?utf-8?B?aE9WL0hxQ0pQV2FlNytyRW5DWWhyT3NkcXFOSnRiUExpeWliTGlnN3JSQUxF?=
 =?utf-8?B?RE0yeWVORktCRzRhc0pzaWZnNER2NnFpVHZWSWVhWDd6VjlyMGgzb1NrUU1B?=
 =?utf-8?B?ZERqR3BEUGkzbTd1clBVczVYS2dxTDdhYzM1M3hhbVkrZTl2MDM1VG1neVdJ?=
 =?utf-8?B?THVBbXM0NVRCc3RDOTlLZ1FkcWhIdTY3cDRnQ0FxeHZIQWlXU3NHL2pvamwr?=
 =?utf-8?B?MDh6SmdkeUVKcmF6dUljbnhFaE9wd3hUeDFlbEZzaitza1V4czdjYUs4aW9h?=
 =?utf-8?B?YnBmR2FkbHBveC9oVzgvTE5vUlcxZVVTdXJQYitZN1ZOTHdzS2ZyOE52dFZC?=
 =?utf-8?B?eWRCdVZ3QlZSZWhhV3I1bGxVWVdmTXdkN1BNZHhWWmYvdFZ2c0I1RldpeXBG?=
 =?utf-8?B?cWFWTC81MnZVK0toeERReHdtd3FIVWgyeEhFNVU2NUxMTVVQaGh0Snp2aE9v?=
 =?utf-8?B?NHZMcG9ZbjlKZWNKUkd4b2hWQ1FOZzV1bXhBdittMXZXQ3dNTURTTW1SVkVB?=
 =?utf-8?B?TTRGd09nRDl6OCsrZUFpSkVjUWVmY0xEZ2xkV0pTalN6ZUhXSS96TWdDc2l2?=
 =?utf-8?B?eU5oSVIvZHV5MWtJa1I3TnNyMFB3cDROWWZjSzkrMGRIU0dHK1NZbGFvSXFa?=
 =?utf-8?B?SXFSbm53TUp6akdUYm96R0FmbkxJeUViOVZ3R3pFUGtnU0tMM1VOZExnWjZP?=
 =?utf-8?B?U3FWWThhOHlSRzM1Y05hakpLWnZHYmthQTk2MEtJei8wQ2lTc3QxdFFtemZv?=
 =?utf-8?B?TlNBdnhzYUlYODVVbDBud0FzQXJjZmlJZTZ0cm04NlBYdWpNNVdlSkdpTTRs?=
 =?utf-8?B?eElHWExSNkI5T1NpNEptc0dvT2NuZHRadmNyT1ZOYTQ1Q2hoaEZEdHpMU0Rr?=
 =?utf-8?B?VnV3S2xqZmdkaVFDUmd5MVN0VUxsak9jckxIYjJNL241NGV5bmQ2cEZGVUxE?=
 =?utf-8?B?cmVLYVNSOTB0T3FtMmRjTkdWS2djbUMvZ3dzbVRDWUtDWFh0Szg1Mlp4MURS?=
 =?utf-8?B?ZjM0VjNlSjYwUzkveGRTRzhTRnN1YURFRWUrbUxrVWVMNm9wQ1EzY0t4MlVm?=
 =?utf-8?B?TTkwQWQxY0ZRTUR6WkRRQ0F2T0l5YTdGMGxubmVIQVJTOTBPZWtuVUdmQ1lz?=
 =?utf-8?B?K1Fwd2pUWTRxdGF4NzN5MjV0eUZkM3Izb3dzNVBUUXNkeWtnSHMwcDhIWUZ6?=
 =?utf-8?B?bG1nVXNLTG5rTTB6b3FxM1ErdkFCaTdaSEJrMVNQTlhjOXgxTWdYcXVjd1Yv?=
 =?utf-8?B?L0VVL2wyekM2NnJvZFZDWmdaVmdGZllwcjNDNmEwQmNBb3lLbzVTaXR6Y25M?=
 =?utf-8?B?KzRKbTM5ZkNFV09ZbHYyMGdKTmx6ZHgwZmlab3hESUZnajBpbmpQSEo3N1I4?=
 =?utf-8?B?SkpsbWR6UFRucmRDRmFwTFRKb0tjTEZoWWZRN01nbmgrT1NQR3Njdm9GaWFY?=
 =?utf-8?B?dDUvbTBJOUpCT09nSzRFMGRQVEFDTmNvOWpFeXowcG1oREFjU2JQbmlMY0t5?=
 =?utf-8?B?T2E3QndGQnFzMnI2ejcrclN2Wkw5NDhLNURWMVBwTjVSUUMwTTBocmxvYnZK?=
 =?utf-8?B?L1A2amVyUGMvWFRDTENxamJrNGY5TFZ2cVFWVy8wZ0tCb0ZyTDRrZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C0B0362BB7D15A4F95A065A43774BB84@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	2dfQX/PgCkg4GdNHoRMTL7Qh1SBjRE85bhZh3aCZMfPdji7+K30m5JX4KX2yCBuypNUZu7qs1SnP40ms09ddIywn+hs8p8MfTEoCKWe9zr+MjVns3OKTec7655NKSSWl7wgZ9rmCkxy6vK+Wj2ybt3uHuOfYCDpQYreL0OGPheSOQN4Fzdkjgaay1QibfBrRlK6rPfL7HOLFYHghWUXenisphjs3TE3SNY6MOn0hLaiNxtMsLE+ldG/Kv4B1osFwGQWdd/s2q2CtxG2iENUKXBkEpjWKbB/aVqBUjV1eGjF5sVkMVirGSAgNq/M7ZkylfdxwM3tWtDmsTZjHx162PA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4f4zjsHuBhAYUhhRezlnb7/dLfJcSALZ0y8QoMTelD9s5qu5Y0Xwa8fOQ4gT/Tcf74NQNgNnI6k+m9M2Yyu3ROxzpncx1M5OcZVJk+8+5o8fT630PchxBBAvscFmQSnSOuvMeGEzkUwdAL5HseYcx1q125RyfiegdzNyy3pXMpr6sq9ykrwEovjVYvj/DxhHgUKrnt+gv+0n1I8uzSwqLtzytzCVwGwzLhMLlUlqsq7pc23sjdc/XYTojSUlZBBnJEv1vZ10FPTPAy3D37B02DqwUJSRb/9T2VzaXgL8uMyRyqMSOOGpLDBvRW/CENMTORHdFzijB3dfh5oIgoSUyWGp5pqn3XyMIzwYtpJm2WWGBDHWIpx+KT98nhzEeXxFYvQMduGC9xWD4OuBlkb5mRJ145Rbl0y2XKty0KBKwLnHxp1E8MVtf0coJAnGgWUx6BYoxgasCm7RPj/NLADAyiLofstrow+1Cqj11JKrXG3l4Qsli7xgmFCI044K7y9BUBeETR4afLbFnFBqB9uGUzRQzYEJ651jPL2zqfKENiMxaC9jK6w+9phqrE2Dh3ys15fZQwU1cXvOasxZCrAL0BUHbzaPAf5xPZahi245UsyScKQ43KufFtCw4jTrGBJUsz59pSaQhrkxNy869vcWdQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1e1b4d-92e1-497e-980b-08df2028be39
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 01:59:07.1724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cf/g11P8ugH+8Enw3E64QvQUPyIEkns26vUbUXFJAvbnk+P6CcJpp1EUe0uPdaZbREjHAnWOSQBlrwevrmLIkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8497
X-Proofpoint-ORIG-GUID: mVHzOOgBS4KCfa6ZyBP3ESnWriPg4c3Y
X-Authority-Analysis: v=2.4 cv=AfkkjHXG c=1 sm=1 tr=0 ts=6abf0ff7 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=uqjpXVuoAMONbIKYygQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: mVHzOOgBS4KCfa6ZyBP3ESnWriPg4c3Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAwNyBTYWx0ZWRfX/rvyb8Ne97zr
 2jeVWLbDA+SImmiGQP9L4a/joDTvQi/TxV+7aEhZWAlDWPVOnbPIGFKyAbS4OW4tr1Lc3+uTnrV
 Gzzo7FGvN2yHSl1D1ouktlfpxsC8SGmyQgBCoHiW+nyakPP6SvKw6zNJUC6id4AhYUMqywcJNvk
 hAx5o1gaLVXJlIRqFzDcjWFMhh7QNGrzZ6keKTBc03iOJTU+bayGcAiDOI38uW73C5gEJcnw74d
 kvwdKmKCWmG+DgU3tXQQxFgY+OYKvtHSJMQz6AAeYdwPx3+HMthhtpJDKkw49q+VTMXTvxi4Yxd
 DNqub7X8DAB5WqFK3b/rDwTT2styyLb/ZNN6/WmmDAQbX7whwTHJPugNuG6LjW480Ngh1VP0/FF
 ipywyl08Ow8t0iZBfRFib0LfsOGBszLMIqbsR9Q5h1cp2xyfpTH7NBqeWB7TFc/M4m8NllvQR2H
 qWhzHS2zW367bfF/T+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAwNyBTYWx0ZWRfX17jzmpU9dA40
 fPfYNOUno425ZEKjrNidDx0KNzzN9lJ5ualfQROxYR8mzVQOBbT7NELxPSwr9PyaaizMMNy67MS
 9ESqLZxkhig7P/+oqlEC9H7afxtpCSo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_05,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2610020007

T24gVHVlLCBTZXAgMjIsIDIwMjYsIFBlbmdwZW5nIEhvdSB3cm90ZToNCj4gVGhlIFNUIERXQzMg
Z2x1ZSBpZ25vcmVzIHJlc2V0IGRlYXNzZXJ0IGZhaWx1cmVzIGluIHByb2JlIGFuZCByZXN1bWUu
DQo+IFByb2JlIG1heSBwdWJsaXNoIHRoZSBjaGlsZCBkZXZpY2UsIGFuZCByZXN1bWUgbWF5IGFj
Y2VzcyBnbHVlIHJlZ2lzdGVycywNCj4gd2l0aG91dCBib3RoIHJlc2V0IG9wZXJhdGlvbnMgaGF2
aW5nIHN1Y2NlZWRlZC4NCj4gDQo+IENoZWNrIGJvdGggcmVzdWx0cy4gQmFsYW5jZSBhIGZhaWxl
ZCBzaGFyZWQgc29mdHJlc2V0IGRlYXNzZXJ0IHRocm91Z2gNCj4gdW5kb19zb2Z0cmVzZXQsIHNp
bmNlIHRoZSByZXNldCBjb3JlIGluY3JlbWVudHMgaXRzIHNoYXJlZCBjb3VudCBiZWZvcmUNCj4g
Y2FsbGluZyB0aGUgcHJvdmlkZXIgYW5kIGRvZXMgbm90IGRyb3AgaXQgb24gYSBwcm92aWRlciBl
cnJvci4NCj4gDQo+IFJlY29yZCB3aGV0aGVyIHRoaXMgZHJpdmVyIGhvbGRzIHRoZSBjb21wbGV0
ZWQgZGVhc3NlcnQgcGFpci4gQSBmYWlsZWQNCj4gcmVzdW1lIHVud2luZHMgdGhlIHBhaXIgYW5k
IGxlYXZlcyB0aGF0IHN0YXRlIGNsZWFyLiBBIGxhdGVyIHN1c3BlbmQgb3INCj4gcmVtb3ZlIG11
c3Qgbm90IGFzc2VydCB0aGUgc2hhcmVkIHJlc2V0IGEgc2Vjb25kIHRpbWUsIGFuZCBhIHN1YnNl
cXVlbnQNCj4gcmVzdW1lIGNhbiBhY3F1aXJlIHRoZSBwYWlyIGFnYWluLiBVbndpbmQgdGhlIHJl
c2V0cyBvbiBEUkQgc2V0dXAgZXJyb3JzDQo+IGFzIHdlbGwuIEV4Y2x1c2l2ZSBwb3dlcmRvd24g
YW5kIHNoYXJlZCBzb2Z0cmVzZXQgcmVtYWluIGRpc3RpbmN0IHJlc2V0DQo+IGNvbnRyb2xzLg0K
PiANCj4gVGhlIGlzc3VlIHdhcyBmb3VuZCBieSBvdXIgc3RhdGljLWFuYWx5c2lzIHRvb2wuDQo+
IA0KPiBGaXhlczogZjgzZmNhMDcwN2M2ICgidXNiOiBkd2MzOiBhZGQgU1QgZHdjMyBnbHVlIGxh
eWVyIHRvIG1hbmFnZSBkd2MzIEhDIikNCj4gQXNzaXN0ZWQtYnk6IGdwdCA1DQo+IFNpZ25lZC1v
ZmYtYnk6IFBlbmdwZW5nIEhvdSA8aHBwaXNjYXNAMTYzLmNvbT4NCj4gLS0tDQo+IENoYW5nZXMg
c2luY2UgdjE6DQo+IC0gdXNlIHVuZG9fc29mdHJlc2V0IGZvciBhIGZhaWxlZCBzaGFyZWQgZGVh
c3NlcnQsIGFzIFRoaW5oIHJlcXVlc3RlZA0KPiAtIGd1YXJkIGxhdGVyIHN1c3BlbmQvcmVtb3Zl
IGFnYWluc3QgYSBwYWlyIGFscmVhZHkgdW53b3VuZCBkdXJpbmcgcmVzdW1lDQo+IC0gdW53aW5k
IERSRCBzZXR1cCBmYWlsdXJlIGFuZCBwcmVzZXJ2ZSB0aGUgb3JpZ2luYWwgZmFpbHVyZSBjb2Rl
DQo+IC0gb21pdCB0aGUgZWFybGllciBSZXZpZXdlZC1ieSBiZWNhdXNlIHRoZSBsaWZlY3ljbGUg
aGFuZGxpbmcgY2hhbmdlZA0KPiANCj4gUHJldmlvdXMgdmVyc2lvbjoNCj4gaHR0cHM6Ly91cmxk
ZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDYyNDA1NTcy
OC40NjA3OC0xLXBlbmdwZW5nQGlzY2FzLmFjLmNuL19fOyEhQTRGMlI5R19wZyFmTHl1UVVjTEVk
c1NmU0FWY1RZUjZLcEZzLVJuQ05ONlJHbER0MVotR19YSUhHTVhBRUVmZnNtLUpsSjA3T1FoeHky
Vy1XMEp5SG9IVmVxQ2owZ2tuQSQgDQo+IA0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLXN0LmMg
fCA0NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtc3QuYyBiL2RyaXZlcnMvdXNiL2R3YzMv
ZHdjMy1zdC5jDQo+IGluZGV4IDVkNTEzZGVjYWFjZC4uZjk1NDIzNGQyYjgzIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtc3QuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2Mz
L2R3YzMtc3QuYw0KPiBAQCAtODQsNiArODQsNyBAQA0KPiAgICogQGRyX21vZGU6CQlkcmQgc3Rh
dGljIGhvc3QvZGV2aWNlIGNvbmZpZw0KPiAgICogQHJzdGNfcHdyZG46CQlyZXN0IGNvbnRyb2xs
ZXIgZm9yIHBvd2VyZG93biBzaWduYWwNCj4gICAqIEByc3RjX3JzdDoJCXJlc2V0IGNvbnRyb2xs
ZXIgZm9yIHNvZnRyZXNldCBzaWduYWwNCj4gKyAqIEByZXNldHNfYWN0aXZlOgl3aGV0aGVyIHRo
aXMgZHJpdmVyIGhvbGRzIGl0cyBkZWFzc2VydGVkIHJlc2V0IHBhaXINCj4gICAqLw0KPiAgDQo+
ICBzdHJ1Y3Qgc3RfZHdjMyB7DQo+IEBAIC05NCw2ICs5NSw3IEBAIHN0cnVjdCBzdF9kd2MzIHsN
Cj4gIAllbnVtIHVzYl9kcl9tb2RlIGRyX21vZGU7DQo+ICAJc3RydWN0IHJlc2V0X2NvbnRyb2wg
KnJzdGNfcHdyZG47DQo+ICAJc3RydWN0IHJlc2V0X2NvbnRyb2wgKnJzdGNfcnN0Ow0KPiArCWJv
b2wgcmVzZXRzX2FjdGl2ZTsNCj4gIH07DQo+ICANCj4gIHN0YXRpYyBpbmxpbmUgdTMyIHN0X2R3
YzNfcmVhZGwodm9pZCBfX2lvbWVtICpiYXNlLCB1MzIgb2Zmc2V0KQ0KPiBAQCAtMjQyLDcgKzI0
NCw5IEBAIHN0YXRpYyBpbnQgc3RfZHdjM19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQ0KPiAgCQkJCSAgICAgImNvdWxkIG5vdCBnZXQgcG93ZXIgY29udHJvbGxlclxuIik7DQo+
ICANCj4gIAkvKiBNYW5hZ2UgUG93ZXJEb3duICovDQo+IC0JcmVzZXRfY29udHJvbF9kZWFzc2Vy
dChkd2MzX2RhdGEtPnJzdGNfcHdyZG4pOw0KPiArCXJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3Nl
cnQoZHdjM19kYXRhLT5yc3RjX3B3cmRuKTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0
Ow0KPiAgDQo+ICAJZHdjM19kYXRhLT5yc3RjX3JzdCA9DQo+ICAJCWRldm1fcmVzZXRfY29udHJv
bF9nZXRfc2hhcmVkKGRldiwgInNvZnRyZXNldCIpOw0KPiBAQCAtMjUzLDcgKzI1NywxMCBAQCBz
dGF0aWMgaW50IHN0X2R3YzNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4g
IAl9DQo+ICANCj4gIAkvKiBNYW5hZ2UgU29mdFJlc2V0ICovDQo+IC0JcmVzZXRfY29udHJvbF9k
ZWFzc2VydChkd2MzX2RhdGEtPnJzdGNfcnN0KTsNCj4gKwlyZXQgPSByZXNldF9jb250cm9sX2Rl
YXNzZXJ0KGR3YzNfZGF0YS0+cnN0Y19yc3QpOw0KPiArCWlmIChyZXQpDQo+ICsJCWdvdG8gdW5k
b19zb2Z0cmVzZXQ7DQo+ICsJZHdjM19kYXRhLT5yZXNldHNfYWN0aXZlID0gdHJ1ZTsNCj4gIA0K
PiAgCS8qIEFsbG9jYXRlIGFuZCBpbml0aWFsaXplIHRoZSBjb3JlICovDQo+ICAJcmV0ID0gb2Zf
cGxhdGZvcm1fcG9wdWxhdGUobm9kZSwgTlVMTCwgTlVMTCwgZGV2KTsNCj4gQEAgLTMwNSwxNiAr
MzEyLDIyIEBAIHN0YXRpYyB2b2lkIHN0X2R3YzNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpDQo+ICANCj4gIAlvZl9wbGF0Zm9ybV9kZXBvcHVsYXRlKCZwZGV2LT5kZXYpOw0K
PiAgDQo+IC0JcmVzZXRfY29udHJvbF9hc3NlcnQoZHdjM19kYXRhLT5yc3RjX3B3cmRuKTsNCj4g
LQlyZXNldF9jb250cm9sX2Fzc2VydChkd2MzX2RhdGEtPnJzdGNfcnN0KTsNCj4gKwlpZiAoZHdj
M19kYXRhLT5yZXNldHNfYWN0aXZlKSB7DQo+ICsJCXJlc2V0X2NvbnRyb2xfYXNzZXJ0KGR3YzNf
ZGF0YS0+cnN0Y19wd3Jkbik7DQo+ICsJCXJlc2V0X2NvbnRyb2xfYXNzZXJ0KGR3YzNfZGF0YS0+
cnN0Y19yc3QpOw0KPiArCQlkd2MzX2RhdGEtPnJlc2V0c19hY3RpdmUgPSBmYWxzZTsNCj4gKwl9
DQo+ICB9DQo+ICANCj4gIHN0YXRpYyBpbnQgc3RfZHdjM19zdXNwZW5kKHN0cnVjdCBkZXZpY2Ug
KmRldikNCj4gIHsNCj4gIAlzdHJ1Y3Qgc3RfZHdjMyAqZHdjM19kYXRhID0gZGV2X2dldF9kcnZk
YXRhKGRldik7DQo+ICANCj4gLQlyZXNldF9jb250cm9sX2Fzc2VydChkd2MzX2RhdGEtPnJzdGNf
cHdyZG4pOw0KPiAtCXJlc2V0X2NvbnRyb2xfYXNzZXJ0KGR3YzNfZGF0YS0+cnN0Y19yc3QpOw0K
PiArCWlmIChkd2MzX2RhdGEtPnJlc2V0c19hY3RpdmUpIHsNCj4gKwkJcmVzZXRfY29udHJvbF9h
c3NlcnQoZHdjM19kYXRhLT5yc3RjX3B3cmRuKTsNCj4gKwkJcmVzZXRfY29udHJvbF9hc3NlcnQo
ZHdjM19kYXRhLT5yc3RjX3JzdCk7DQo+ICsJCWR3YzNfZGF0YS0+cmVzZXRzX2FjdGl2ZSA9IGZh
bHNlOw0KPiArCX0NCj4gIA0KPiAgCXBpbmN0cmxfcG1fc2VsZWN0X3NsZWVwX3N0YXRlKGRldik7
DQo+ICANCj4gQEAgLTMyNiwyMSArMzM5LDM2IEBAIHN0YXRpYyBpbnQgc3RfZHdjM19yZXN1bWUo
c3RydWN0IGRldmljZSAqZGV2KQ0KPiAgCXN0cnVjdCBzdF9kd2MzICpkd2MzX2RhdGEgPSBkZXZf
Z2V0X2RydmRhdGEoZGV2KTsNCj4gIAlpbnQgcmV0Ow0KPiAgDQo+ICsJaWYgKGR3YzNfZGF0YS0+
cmVzZXRzX2FjdGl2ZSkNCg0KV2h5PyBDYW4gcmVzZXRzX2FjdGl2ZSBiZSB0cnVlIGhlcmU/DQoN
ClRoYW5rcywNClRoaW5oDQoNCj4gKwkJcmV0dXJuIDA7DQo+ICsNCj4gIAlwaW5jdHJsX3BtX3Nl
bGVjdF9kZWZhdWx0X3N0YXRlKGRldik7DQo+ICANCj4gLQlyZXNldF9jb250cm9sX2RlYXNzZXJ0
KGR3YzNfZGF0YS0+cnN0Y19wd3Jkbik7DQo+IC0JcmVzZXRfY29udHJvbF9kZWFzc2VydChkd2Mz
X2RhdGEtPnJzdGNfcnN0KTsNCj4gKwlyZXQgPSByZXNldF9jb250cm9sX2RlYXNzZXJ0KGR3YzNf
ZGF0YS0+cnN0Y19wd3Jkbik7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKw0K
PiArCXJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoZHdjM19kYXRhLT5yc3RjX3JzdCk7DQo+
ICsJaWYgKHJldCkNCj4gKwkJZ290byB1bmRvX3NvZnRyZXNldDsNCj4gIA0KPiAgCXJldCA9IHN0
X2R3YzNfZHJkX2luaXQoZHdjM19kYXRhKTsNCj4gIAlpZiAocmV0KSB7DQo+ICAJCWRldl9lcnIo
ZGV2LCAiZHJkIGluaXRpYWxpc2F0aW9uIGZhaWxlZFxuIik7DQo+IC0JCXJldHVybiByZXQ7DQo+
ICsJCWdvdG8gdW5kb19zb2Z0cmVzZXQ7DQo+ICAJfQ0KPiAgDQo+ICAJLyogU1QgZ2x1ZSBsb2dp
YyBpbml0ICovDQo+ICAJc3RfZHdjM19pbml0KGR3YzNfZGF0YSk7DQo+ICsJZHdjM19kYXRhLT5y
ZXNldHNfYWN0aXZlID0gdHJ1ZTsNCj4gIA0KPiAgCXJldHVybiAwOw0KPiArDQo+ICt1bmRvX3Nv
ZnRyZXNldDoNCj4gKwkvKiBBIHNoYXJlZCBkZWFzc2VydCBob2xkcyBpdHMgcmVmZXJlbmNlIGV2
ZW4gaWYgdGhlIHByb3ZpZGVyIGZhaWxzLiAqLw0KPiArCXJlc2V0X2NvbnRyb2xfYXNzZXJ0KGR3
YzNfZGF0YS0+cnN0Y19yc3QpOw0KPiArCXJlc2V0X2NvbnRyb2xfYXNzZXJ0KGR3YzNfZGF0YS0+
cnN0Y19wd3Jkbik7DQo+ICsJcmV0dXJuIHJldDsNCj4gIH0NCj4gIA0KPiAgc3RhdGljIERFRklO
RV9TSU1QTEVfREVWX1BNX09QUyhzdF9kd2MzX2Rldl9wbV9vcHMsIHN0X2R3YzNfc3VzcGVuZCwg
c3RfZHdjM19yZXN1bWUpOw0KPiANCj4gYmFzZS1jb21taXQ6IGYwMTAwMzYzZDhjMzc0YmQ4ZTll
YTdjOWJhMDI3NDRmMGI4MDJjYTQNCj4gLS0gDQo+IDIuNTAuMSAoQXBwbGUgR2l0LTE1NSkNCj4g
