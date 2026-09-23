Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213E436A342;
	Wed, 23 Sep 2026 02:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128937; cv=fail; b=QwSEkQL9lGN7xztIXWTlalBbCuJ0aXlMJi9mpYUgs5b6CXcAHtjnydFeIUtF+i8NipH9IhaZqbYeA7iyoJwX5Xt67GlE65WUvXLip1SEdqb0B+oOc6VjzfLmn2ykjfzo3GTEqyq7nm2GFtH+EIxfH4iK+dJChyW8H/0uOyPZusg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128937; c=relaxed/simple;
	bh=CFQkS34vgoIFjvqknIRoutPZ3/uBWrKp9qCjkKhYwRA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hVVeJ4Fca23uaaeKvgCpYDqzXWqtB5gX0Ukr0OffpTNxkeH2ahG0caBGe8EoaavnBSPWHkfE7LE5jawFJrrOzZZ0VfNOB7xgorXtqT2TXCGlaFcV1nyA689+z10XTWfWspY0nt2Wkuh8cSkSz3JAN7secG5dXzkTgOZP+542iHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=nTPappIZ; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WZQQeCPS; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=O1ATzuHc reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="nTPappIZ";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WZQQeCPS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="O1ATzuHc"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MK8r7r2631252;
	Tue, 22 Sep 2026 19:02:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=CFQkS34vgoIFjvqknIRoutPZ3/uBWrKp9qCjkKhYwRA=; b=
	nTPappIZZTltuc79lWVuUXsYfGNqvXcY+zNpIeO9NVwdlqiqSNahPKxssFkHNt5v
	aE2Pd3hC2g4n+ZwuxYg9XEP+u2Z16AyCWM3LLdszDMOr5Uoi1ZiLbkZLKryra85T
	hi7vXT+A2tp7IrJWrc2I5mSTt34kHQrAmjQtRVvKd09gk78gMiWBr/gbIbfYA8eb
	f3KzHleyAIv2imzjhEjjU2BtZa0gdB6e5RCS+uCqwcaAMSHv7jSfg5W2NdXsIHMD
	l6gpphR/B1PV1uO3eZitrkvyS9LuL2tqTjQcGFqqWE9hCh2G9bqeStnDMqed4NbR
	9DbO2MqiE5o+nM8Nsnwqtg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4gur5dprvr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 19:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1790128929; bh=CFQkS34vgoIFjvqknIRoutPZ3/uBWrKp9qCjkKhYwRA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=WZQQeCPSMLXC79M5WryMajFgkpqGKroITiVdVHXGr2hAk1Cz5YalUsT4b4G0fR3bo
	 1Zh2GowqOgXhBUVxqNdR8Se8HvcnOKcyfdHGBgS/V9ag0ThLrMUBpmo22H8Q0eXTTW
	 vhuyIZ599RcsMk10NPOxIceW18PucQsqmLNeoFzuAPWAFj0bGttd6Nv9slXQuhFzmp
	 KKMbGHduCmv6Y1I9iapSuYm/lJDygXmRHfpupamTAP13kZYRHacmoL9CFCXdPzmOMO
	 97IZuTYe1Is0Cj8tjsc8gGUflouhWmdB5frouuR9juI5nskZjhulYP+kgED2SuDgTt
	 qoONBufWzbZWQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9490C401B7;
	Wed, 23 Sep 2026 02:02:09 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 497ACA0499;
	Wed, 23 Sep 2026 02:02:09 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=O1ATzuHc;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00304.outbound.protection.outlook.com [40.93.12.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9EA9440544;
	Wed, 23 Sep 2026 02:02:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2VaVedEMTZnuriP4/Hbxzl+2WP5bMsz81o5ERJ83L5TFV5/Y6Xj41rflqwB0zKjmoc5eISojILQ3vBG7OYJLRykOaxqUaWtfK4iFth0HWl2WpKTZGteowCwxqOXBTsOvpMHnk0e5rSZj6y2uYulJ+GeDL3RxJuhGCwBi9PZ07Qke3NibiJ3ie6kTDjrriT4wZ3LSklHnsr7JBq20uW8f4cOayHP2dHPr8nkERs75D2J1NiwGaVEbjw9FnQcnRlDkmfiahus1tGyUzmChlqg8xzf4BENdjErXnE+U84OIQxHzV8tJ5xoI2mgQGESQt0vBHu5uJzMqfDR4o2ZX6/LBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFQkS34vgoIFjvqknIRoutPZ3/uBWrKp9qCjkKhYwRA=;
 b=NpQTZ7DK6XiL5uIsq6Zko3nYwSeystey41mk0sWuavLZndhQq3Lx21B5fo3Mig8oni2PHlRBIMlI4V0E64ByQe2rLZjIAFtEeSx3+TheEWpeqMFvMkuVRMAaIHDBwnanjLVP8IXmNEl+g/0zNiqggi9fyKTe2czXbVaXI0rwzEpcLPp6wkU5L/PJceZ77R+UEmK8krGYfLROK+dkVWTC/z9OA7nnN547dpgfFL47kUjzKgdFQAlNx6vBgh5CIocuMUZNRCXp7Cq0muHZmtCJp6/GE4U038lFTZX/Bjnn+AaeAdHxMgzv5Cw1Yi25eNhzcmjbdvyYlDmsQXIwUWlxxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFQkS34vgoIFjvqknIRoutPZ3/uBWrKp9qCjkKhYwRA=;
 b=O1ATzuHcw85Cz6nzQq3Iw009iFKahU9tXA5B8GzSCt7Xwk4tNBMwoxG3YNpodbb+lCqleaLe1dQyLhJQW4Z12+FL4EVnY6T6NfYvD2hKF1ZijSp5JRR91F8so7DR9PEOayx5etWLB9Atp1mjr85zW97p+G9ftjXgPYpSIXqutM4=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by CH2PR12MB9496.namprd12.prod.outlook.com (2603:10b6:610:27e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Wed, 23 Sep
 2026 02:02:00 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 02:02:00 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Konrad Dybcio <konradybcio@kernel.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] usb: dwc3: Resend full Data Packet for non-compliant
 USB3.1 devices
Thread-Topic: [PATCH] usb: dwc3: Resend full Data Packet for non-compliant
 USB3.1 devices
Thread-Index: AQHdRUUCjgSZNeoy60WWZoJ6YXjaMrbbdH6A
Date: Wed, 23 Sep 2026 02:02:00 +0000
Message-ID: <arMy_zhc1oNFTrp8@vbox>
References:
 <20260915-topic-usb3_tunneling_fixup-v1-1-61264d3103cb@oss.qualcomm.com>
In-Reply-To:
 <20260915-topic-usb3_tunneling_fixup-v1-1-61264d3103cb@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|CH2PR12MB9496:EE_
x-ms-office365-filtering-correlation-id: 5b4d2f52-6885-4943-ee84-08df1916a7b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|11063799006|3023799007|18002099003|22082099003|56012099006|38070700021;
x-microsoft-antispam-message-info:
 4yT8vFxxuRWaaIgx/A9K17UJxhICuVHc8VBMJ5NpOFkXtdSqc+8Zvq/XlPGSYEy5yXIB5baFppXdagEiP5JHEjsHjkmQC2PuRSVig6cZ3rAyqzMZMM8VuiFdsMsGVZXrZchMOvZPfsxXXP4N15yb0nkabTASUV/YJpi8k07QTkRBA9D2FkmhObyPrw9WIH8lNWDexUO039ehyktRq6BqsFWdeNIoxtovL5sxvQrDJXVPM3BYZxCsdM9lz/ith97GVNuWrvg0Tt09e+oqp/6T+HBgOoUnWiOkL1sPelZIOloNNQ/dm1BKVZZKrnezbcGun7Igx4MXPP1VeJmXbWkmTUZv31SToKalHWu6J2GPKGJ90HmPrveB76MpbNtXR630TNCjeZ6pF2356CYlXtShVQ6YLlqE161rh7VbWKv82p7Ierwc0cFhfuW5EA2zj24YsAkGzE7/L2/Dc0dlDzf2UWZQtrvjxrXN5bmsOaKtq6Wo3OLsNVUn3GtARNcDCQt4424GlIoUbilt2rQpuEpezU87BRy4cjE0OKT/1mBPeU+wb7lv4rJmGv8EfK3jLGCdsmwtlOZLGu/tpzxsTuqNAumpgQFH7j4UWW3+VG5Ct8bejMnXfNXwdjJel4LAzwRijhVbnMH7kjhNe8f/UWkSNku7HJc7JFB+cXwpUaChsLTti4m5kUZr3IzuOx7BtAKF79Qk3I3uEoLMfu4POMhbgE5e90pV8AJylFk3CD1NJTc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(11063799006)(3023799007)(18002099003)(22082099003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T3RPaEE2azNUM2R4ak91MkhHLzFVbnRnLzkyNWMyK2xDSzdBTmlTRWRUSVM3?=
 =?utf-8?B?UEpYdFFHS3Q5OXViQUh2VzB1L2d1bURQNUJyTU9yckFsRndLL2NLVFRNb0Ux?=
 =?utf-8?B?V3I3ZW8vRlFtVTQ2M0RBc2YvRmx6YkRsV2hyVkFUU2ZuSFpLR05Yd2hQK0Nh?=
 =?utf-8?B?RHJSdHdEcHBTM2VXU28wVjhWLzU2eHZXTnNqcURYb29sZFdjV2Vnc2FndS9v?=
 =?utf-8?B?WklMMHk2TnBDZXdsbTVJakk3OC90MGRNeUcxSElWL1BpUUxBcW5ZVDFxMEMv?=
 =?utf-8?B?QlM4WTBXT0lvdTE0aVpkRmtrQ29CT0k3Wkp2TkVsSEVxZGlWY3NPb0doVmJo?=
 =?utf-8?B?UVY0WXRKVjdTY2cwbEp1aDBrZW95aHBhZHhvK0E1d0lEQjBFR2ltY01FcHdt?=
 =?utf-8?B?Q1dKbm1XVSthc1ZMZDVJaEJ6YkIzREFScUM2ZWYvY1BLVWcvdEhFN3IzK3BD?=
 =?utf-8?B?dVlNTzA2dWttcHRuVEZpVThHL3FUNUJNUkFaU2cwL0thcXZtV2k3Tnhsb3hG?=
 =?utf-8?B?cmdwNzg4OTBOUmYxRnQ3ZHZ6TUVzV3ljMUVYUkYvN0Qra2FqTkdvY0o3MjJl?=
 =?utf-8?B?VUVzNitQcFdnREdpeFA1Q1V6UmlnQ2VKMGdzMkU5TWY0U2FoUWJLeGF5OXhi?=
 =?utf-8?B?b1ZWMDBxM2NpMHJkM09YZmJuNkdnWStGNkxHNDRnOTRFRC81ekFoTkZRelRO?=
 =?utf-8?B?WTRpRlU5bmk1ZzZkaW1ZaFErV3c0TXRNMVUwRXg0S0l5cjVGZlBYVEthWnYr?=
 =?utf-8?B?YmJhcDF5Q1R6eE1ENkhCZ21qdXVObFFTdms2TDVXZkZ1MjlmTHBhdmhFWnNZ?=
 =?utf-8?B?bUFCWnhrMzBWYUIwcVBPM3NIOFpUMkt3d1Y5dXhjS0VBV1lWdlpwSnhlZ25S?=
 =?utf-8?B?VXhoWmQ0ZWF3bTBUdEV1SDNtRGNUODMvak1JZHNYb3JvK1Nna3VoL2hWWEFS?=
 =?utf-8?B?RzBHZ0ZQV3FvT1JoUEhLUldSN2pld1dhQWI1OExwdGR3UTI2ek1XcVJ3cDVX?=
 =?utf-8?B?a21SbEVxaUZmczlWMnd1b2p4cE0rMXU0QjZPMzQ4cWp1S0E0RHZYa21pS0xk?=
 =?utf-8?B?Z0dnZzF5Y052MEVNODFmdXJXYU9OT3VhWDJDMG5ZRkxRUXppekUxMm8yK2ZQ?=
 =?utf-8?B?aXVkanJ5ZGJ3SjBrdmIxdmZBcGNZdFlqcWUzYkJKZ3REWTlqNVdPNVdRVjhy?=
 =?utf-8?B?RDV6Q3lSeWUrMlZBQXp3RE5FajBWTjlIaUV4elcyc055NWF6TXRQQUY1aDcy?=
 =?utf-8?B?eVVHT1Y5SDJaN2N5YjZvZHhhajlucFl1TnF6dVJiVDFBelZMYWJySUdkVklB?=
 =?utf-8?B?MUxuWWc3Wk9KaE5oRWppQWg2TnRKeWNFTDhJQ2VrS1JlUWpCMEVzSGh5ajVF?=
 =?utf-8?B?c2piV01EVWg2L3c0T09VU1NGYmtlRktOVDN1MHdkbjdDT2QxUEs5aEo1alRH?=
 =?utf-8?B?REYwUDdNSVM0Z01VSnRkcGNheHkyT1RjNjRIVXZrUTFhTGRuUGxHc1dES2lk?=
 =?utf-8?B?anQ2Q1pmeGFUeTVQampMNXQ4by9DS25FWlUxdGswSzlrUnZwS0FQZklzMjEy?=
 =?utf-8?B?UmpQRzNkeXBnOTVSbVdaQzAyL1p4MitMMWVOOUY3cHdGczdMdlRXWHZLSWpa?=
 =?utf-8?B?d0pRSlE4cmZEbjFGendxcnNCbXdac0JRVllpbzE1S3JzSktXb0ZzZGJ0YzYr?=
 =?utf-8?B?Y1JiYTdOV3J6M3VYWk10VHRIR0EwWm1QVWQ3V3UxY2lHQTBpVlMwZTNDT25u?=
 =?utf-8?B?V1VxNUE4dXF4L3hLR3NsVktsZFBOYUcwaGJOdUNrVzgzMzdIWG9VRjlWM0dI?=
 =?utf-8?B?SkVGQjN6dGpGUlVwWmQ1Y2hndFJOamE3SFVYbFBaSmhWRWZEVDVYV3VvWGZE?=
 =?utf-8?B?SENGZDF0dkFSUG13UHBaWlhaVnZQZ3Q4Mm0vcDlmUWJkT1JBMFRrZkExMmk2?=
 =?utf-8?B?TDF6b3VmNWp6SWhVUzd1akNYNDFNRjQzUG5IdnhHekJFL3gwbEJoNTBSUHhE?=
 =?utf-8?B?SHcxdVRMTHE5SDdqWW9Hc2pNMWV4YWlhcmxVNGxFN0pRLzhBZkdmenA5enpI?=
 =?utf-8?B?NTNtbGlhd2xzVlpzZmRVemNzMmpPa0hQZEhUWEh3aiszNDR6cGhNbmw2K3ZD?=
 =?utf-8?B?bmhiMWhlRFVmTk1Qd0hyaHViSC9rek92YytHRTdmdlFvWU56RlJHL3g0amt3?=
 =?utf-8?B?U0NMK3p6bFlMUmoxcHhVaE9GRGQ3OFRkV3Jya1FrMFV0L2tkUUdFNXlQdCtj?=
 =?utf-8?B?MnM4ZGdOajVPUFVXd2NQQWZiNXZCWjR1TGhUL0RCeGt3WDBaVEl3Rjk4QUFG?=
 =?utf-8?B?Z05WY0lDVnNhRVYyYVhSLy9EVU54eXh1amlTNktKUVhpOFZqaU0wQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC5D49239D1F4042ADAA4ADAFD5B2B6A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	V73iFl9gTdKS9bfuz86VJ2xpP5pxGZSSAjbGAio8DGoucgk2VkB3yy+A+W5UySZlcSUh06O6Ii7OVzJuOQ8wTupYmBkodHpD3UlL6aoGAhXQ6dM6l8h/yHTMAmEMugCJh05yfsbIdGwFqFxT9bxJDeytgsyC5MGs6zBswJejdlx9mHnJEhHEGeldApzFyBmqTdIunVI6oS47ps4NhP1LIpHJCxSuzOdkP8iZOG8oZg0991n9YJ6lakNlDlCbv+LWW+6+p99mcXbbcZ9QRdklcfRtzsC8GKbXfrkbGwXdvhkYLgFOdiG+euhBq8Y9YgCD3ll+STgI7Q3jSxcFTdo+Qg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	biN+Eq1LdMI+oTfzzZfy4lvYdlofvf+05ULoVXEpvCk3NXQZyZON67UDoBqYJYOUh444BhiYZHXR51KOpOi9DdN8dS/uglJ85i89n/AV9/mboE0jnJhtq3gG9URuXq0Tlqh1cTPCtvOtkkh1nZ6O+kCpZXSTW+k1qLB1hna1tgTJQ0thp5ZE1zFvmPqklBzNev8uQgi3vD1BlVE9085+SxFALsBoX6f8ojtytXqpYHYUZnpyVULmpPWXvrV02vxvWvMKTTtn1gxdFmhU82d+in5d07Kfv665A3kvV+JWf5GWv2x7zn75MA/4cjkZaHNmUvZwPsHTelEbSfs0MWMQzptcDWeQdhAzY+hN4HXO/Z0e4XSn8qSa//Ib+pPBukBEfUNl5LbYelpxHvePW/iryooK1jFvo/55ecPBlm/vFEO5kONCBeBQlqv9skQlSsIrnzwa7ntWaV0XzMuMteZeFR6m7lpnNZI+svk4dLIBTkewfIXccT5Gwigln+l19D7orfg60no7kMbDXzkxpZoFh1aTOrnFE4WDiHUtS4QuLAwy1s3QJQhCXme5XDb9n5hl+s0J9RZHGdjaQdKWmyWSvBRP63JAOVdEFQlsR8QU8L4biadp3ZHfYHwETHqqf0pZSuplPwYxHyBUBIPRqHKBIQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b4d2f52-6885-4943-ee84-08df1916a7b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 02:02:00.3080
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fci3IkoV/IJu+74FRGzdmcYIX0G+xTtU0qmo26KekLXwP7sqOsXZyttwT+pFfzfJGOLDh8WwRBIaksba2IlG1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9496
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwNyBTYWx0ZWRfX8Y+kCdCz9yco
 ye7VIVGjY79P2S1bfeeq+d5C3KAQuZM4xTuLZf/rSvtmX+0+yrlftYj6mC5DJCq/NoFzA2V8yuw
 A1tWct634G1oGj+iVD9stYV+e2Bh8bn72BjXpauw25CpnH3oAnOzy63pUyskcEcrBKAVOOuhZQ4
 fFstgc8fHbZ7362DX2l2ioRaf9OecxwMhz7nFUVELH+MbEQUT1vqkK3w9JnFuCJhveJ9OCAslff
 hVKc3G7mhfd/Bx8QtdRm1Mu2aavfaIEd39WAPK7w9Y0+nkNQwh1av+gCgzpkoWPWniQyCkSCIZm
 VZqeotbFts0MVz4ENSBNJp6xuaU1n2Zd9BZ2ssgKyPOtrsHbY8wYqvFYYUUUkhg9oOJtJdeA4IJ
 S1Ms+bKRUV53HlI8a+OsmjbNeVUpXNsyMMrBiENxkb/WVh4FJcEdI43xCooWl8Dh2FSQ/exJrjm
 g7eGomlvp5YxRMmRdbw==
X-Proofpoint-ORIG-GUID: uIKFhU_IKNicmSawl6UeKUJBRzFZ46RC
X-Authority-Analysis: v=2.4 cv=eN2GH3p1 c=1 sm=1 tr=0 ts=6ab33322 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=1kxq8UPftBDW37HcxMkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwNyBTYWx0ZWRfX+rTTpuN/IOjJ
 qaxMerJBmnWIJZHjfpzmxVmd/6HYRZkZCx8aqM5rb9rTPJzOzzgr3vlEjRm/K6UcMb1wZPAWFmk
 dbYy2v2sESCF2feCnrejv3UlFEha+gE=
X-Proofpoint-GUID: uIKFhU_IKNicmSawl6UeKUJBRzFZ46RC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609230007

T24gVHVlLCBTZXAgMTUsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+IEZyb206IEtvbnJh
ZCBEeWJjaW8gPGtvbnJhZC5keWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4NCj4gDQo+IFNvbWUgbm9u
LWNvbXBsaWFudCBkZXZpY2VzIHJlcXVpcmUgdGhhdCBhIGZ1bGwgRGF0YSBQYWNrZXQgKGFuZCBu
b3QNCj4gb25seSB0aGUgaGVhZGVyKSBpcyByZXNlbnQgdXBvbiBMQkFELiBPbmUgc3VjaCBkZXZp
Y2UgaXMgdGhlIFVTQjMNCj4gcHJvdG9jb2wgYWRhcHRlciB3aXRoaW4gdGhlIFF1YWxjb21tIFVT
QjQgcm91dGVyLg0KPiANCj4gRFdDMyBoYXMgYSB0b2dnbGUgdG8gZW5hYmxlIHRoYXQgYmVoYXZp
b3Igd2l0aGluIExMSU5LREJHQ1RSTCwgdXNlIGl0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS29u
cmFkIER5YmNpbyA8a29ucmFkLmR5YmNpb0Bvc3MucXVhbGNvbW0uY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvdXNiL2R3YzMvY29yZS5jIHwgOCArKysrKysrKw0KPiAgZHJpdmVycy91c2IvZHdjMy9j
b3JlLmggfCAyICsrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyBiL2RyaXZlcnMvdXNiL2R3YzMv
Y29yZS5jDQo+IGluZGV4IGZkNWMyY2QzNmM1OS4uZDM3NWViZWUyOTdiIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUu
Yw0KPiBAQCAtMTUxNCw2ICsxNTE0LDE0IEBAIGludCBkd2MzX2NvcmVfaW5pdChzdHJ1Y3QgZHdj
MyAqZHdjKQ0KPiAgCQl9DQo+ICAJfQ0KPiAgDQo+ICsJaWYgKERXQzNfSVBfSVMoRFdDMzEpIHx8
IERXQzNfSVBfSVMoRFdDMzIpKSB7DQo+ICsJCWZvciAoaW50IGkgPSAwOyBpIDwgZHdjLT5udW1f
dXNiM19wb3J0czsgaSsrKSB7DQo+ICsJCQlyZWcgPSBkd2MzX3JlYWRsKGR3YywgRFdDM19MTElO
S0RCR0NUUkwoaSkpOw0KPiArCQkJcmVnIHw9IERXQzNfTExJTktEQkdDVFJMX1JFVFJZX0RQOw0K
PiArCQkJZHdjM193cml0ZWwoZHdjLCBEV0MzX0xMSU5LREJHQ1RSTChpKSwgcmVnKTsNCj4gKwkJ
fQ0KPiArCX0NCj4gKw0KPiAgCS8qDQo+ICAJICogU1RBUiA5MDAxMzQ2NTcyOiBUaGlzIGlzc3Vl
IGFmZmVjdHMgRFdDX3VzYjMxIHZlcnNpb25zIDEuODBhIGFuZA0KPiAgCSAqIHByaW9yLiBXaGVu
IGFuIGFjdGl2ZSBlbmRwb2ludCBub3QgY3VycmVudGx5IGNhY2hlZCBpbiB0aGUgaG9zdA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmggYi9kcml2ZXJzL3VzYi9kd2MzL2Nv
cmUuaA0KPiBpbmRleCA2MDhkYWViN2VmMTAuLjZhZjY0NGE5NjcyZCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgN
Cj4gQEAgLTE4MCw2ICsxODAsOCBAQA0KPiAgI2RlZmluZSBEV0MzX09TVFMJCTB4Y2MxMA0KPiAg
DQo+ICAjZGVmaW5lIERXQzNfTExVQ1RMKG4pCQkoMHhkMDI0ICsgKChuKSAqIDB4ODApKQ0KPiAr
I2RlZmluZSBEV0MzX0xMSU5LREJHQ1RSTChuKQkoMHhkMDU4ICsgKChuKSAqIDB4ODApKQ0KPiAr
I2RlZmluZSBEV0MzX0xMSU5LREJHQ1RSTF9SRVRSWV9EUAlCSVQoMzEpDQo+ICANCj4gIC8qIEJp
dCBmaWVsZHMgKi8NCj4gIA0KPiANCj4gLS0tDQo+IGJhc2UtY29tbWl0OiAxYTFkZTU0ZjczNjlj
ZDJiNWJhYzBmMjY1OTEwZTYwYWQzYTZiNGMzDQo+IGNoYW5nZS1pZDogMjAyNjA5MTUtdG9waWMt
dXNiM190dW5uZWxpbmdfZml4dXAtOGMwZmI3M2VkZWM4DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+
IC0tICANCj4gS29ucmFkIER5YmNpbyA8a29ucmFkLmR5YmNpb0Bvc3MucXVhbGNvbW0uY29tPg0K
PiANCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4N
Cg0KVGhhbmtzLA0KVGhpbmg=
