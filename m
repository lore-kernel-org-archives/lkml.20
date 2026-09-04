Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177C731716D;
	Fri,  4 Sep 2026 23:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788565162; cv=fail; b=bT7Ch6tsq5j3bloQkxebU2wbmVD6gzn5w8F0ZeYTHKct+nYsI0Nxkn7dBKYl3NaNM0fwyJPb3q+FMa8eCxN3fAcmqI3ys8r/U55rwZ1Zd/7+ltLvcUVpsqYVDS3IPIhDqTaG4NB8srKVOMjR1R2n8JHRrgygzZiH+sa6VkYfM3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788565162; c=relaxed/simple;
	bh=sT2LhU86p9dD3wuvFVBw3/UOXAWkLXdu10aI1ElmqNA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JhLe0caunTqDe5uQIahRZVMB8Fi++cjzsTefEqYda1HWyfyqeFCuQZXrjSC4VEVF0iMRrEYo89ead4IFNxTzWh/jZB4JDmpZGjQwn34HnS/fFBszEFhKW3og7PPIAmtoY0+XSeqFrJPpm4wFtSLcbYJZaWcIfJH9TSt13DsTgQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=pLWTxPM1; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Hlj+f3CY; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ls9TAjlw reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="pLWTxPM1";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Hlj+f3CY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ls9TAjlw"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684KcmkK1143298;
	Fri, 4 Sep 2026 16:39:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=sT2LhU86p9dD3wuvFVBw3/UOXAWkLXdu10aI1ElmqNA=; b=
	pLWTxPM1nC/fG72/8pAoZwNtHSKZ7GAyHtqOnnxKJTCqzISm4ASM/KJCr1CKVoXe
	WI+/a+MyhA4EjvVLchwt0vu7Bo9P/SmvKtTvKnYBuUN0gOBLjNPl/yr/AR2QK+Zn
	YOqHeEz9JOCGdWgJsYq3pkSqQOpjgst3WM4UoVlpIsV4TvkbjOlPHy4P/Z9tZqBA
	oQDdyUjoiANFE6ZhO4ksfqFyC7U2VlCM3w4VlhTaX7qskj6/sjYCG20GlpN+Qnnc
	pyXyMVbalSJGkEoFiPf3nNaCE9zKqV1edxaG4rsTBTMUFHsORLbusor7KlEmIZso
	05riLY1rSnfnqsux22n6cg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4gfrm1ate9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 16:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1788565156; bh=sT2LhU86p9dD3wuvFVBw3/UOXAWkLXdu10aI1ElmqNA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Hlj+f3CYohj1OkV3xVzyLkqGSS965JMZNxJV/WG6r4sb69Dvs7JtAe7kOM4dEimgz
	 3fjP66Q/fEPN031SCkMZtBMRDqqigdSBUx1tZ3o0fNrtKfy5YpqCo1rexGy7cbyy/2
	 2762cpv5bqrDRFl7gWiqnxUlxs67T96ksbpwZWrhfoMl3qwCwXa4SHhnNAqR89pkZ1
	 KyvV1KEwu2xtXtNUDHh++lsgHkn9pADvpMTIe2DVAmTCLywZlu+WgU8fiV5v1yN3Uw
	 AKx36fGwu+JdmyMKUUKj1ifpRflNVkc/v3brSFXYI1g4DTdgf6kG4oABrOzvKZecnV
	 oIReSpJ/kN7zA==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 79661401E0;
	Fri,  4 Sep 2026 23:39:16 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 372BDA0EBF;
	Fri,  4 Sep 2026 23:39:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ls9TAjlw;
	dkim-atps=neutral
Received: from SN1PR07CU001.outbound.protection.outlook.com (mail-sn1pr07cu00101.outbound.protection.outlook.com [40.93.14.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id D0F8240115;
	Fri,  4 Sep 2026 23:39:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avb9Iw/veE1dA7Nq8GlD41pbW9T+cEDdnFTGNyJ0FifTq8na8oyUUKbntW+WGQmn4ANv9UFOYETUznN5H88468uUELVQ5CZFQ3Cp3V7Hm7tRH20zLqTKBCaJLhHbr7MWsQvKWTRc77c4bKmArgDhoOCsAl93f3OMNRVrynisNfvGXjgMgqs2ikmxy69AgjaxPUnE/+PKJXrmO51AYeYx+Gldd7iqbn0KJt9a5o+6NWQychFeKT3u9sT1K/m7qP+BsIH5Qx/M9UabyiETd3XCIe77KAZ1++cTPKalqz2Md2IN+TbUh7EsVUGkQzfosJOufy958kejKuLWkDCWyjoYUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sT2LhU86p9dD3wuvFVBw3/UOXAWkLXdu10aI1ElmqNA=;
 b=LX7dC5WP8VPsybJtkkaTO+85/ESN38xIZiOd3UUnB3FkRJOj7xWiPcrGV1GBDtNhhlY6fsZa2z2C9h1BQNvfWfuqBzlEo4LnJOp1lecDHmScx5P0ziXanfxBmmWrRqJmugQP828fEivyKJ+2DQuapF7JQeaimeWamoSpfaKXm7UJlMOGlfdqV6RlYpiZkQVm+GV1FKJtm6EydGf+xkpiyZVVhuf/YJlnlSHPxPfYO3DdwwUIVlegNwb+Y8o8jCILiZIhoMmQNUKHPPjHTfag5cmdzoGctnBRs5OkUjCzyDVKdVUp194Hlb5f/w/kpStfFfeqUmAoI4wzkUIMQ+M2Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sT2LhU86p9dD3wuvFVBw3/UOXAWkLXdu10aI1ElmqNA=;
 b=ls9TAjlwekDWpZgxt358RzcpOzgwJDZTNVlu3DoegO21ASo3twFpBUXKlRDPnMPUmIvqNhWPR9NxgjXCTbtG6ltLOGjLkf2k78UwuIsYadgW/ue/OuH/V7vjITosXHeERh3lxTDGBNz6GPcLvwxqXikSe9UdOE157vsicURofo0=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 4 Sep
 2026 23:39:11 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 23:39:11 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: David Collin <davidcollin899@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: host: fix props[] overflow and dangling xhci
 pointer on error
Thread-Topic: [PATCH] usb: dwc3: host: fix props[] overflow and dangling xhci
 pointer on error
Thread-Index: AQHdPHqzHewUyhpb00Wqt+h8mO613ba/FDUA
Date: Fri, 4 Sep 2026 23:39:11 +0000
Message-ID: <aptV-QHKGbMqw1uP@vbox>
References: <20260904140258.154204-1-davidcollin899@gmail.com>
In-Reply-To: <20260904140258.154204-1-davidcollin899@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|MW4PR12MB5667:EE_
x-ms-office365-filtering-correlation-id: c384dd77-6f87-455d-0170-08df0addb8b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|38070700021|10067099003|5023799004|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 pjd6zGp7ErDmh99jGjik5ZI7KBYu47SWmmAKonMmt8BXXWF2zYvD41pwp9CudLy3LPB2rEElLnC5g34HyWEfQsZssE0C5uEph+CWmZz3UhKkcvpwT/Knuyyh+dqgKQvLjvNndE/0sckUTgnyearbZwMbnVYnoueBF3RlKKvJHf4Ck/DiJRnlJbv/A8VWA5B/EbFp8m/MMsLXWf9sxy2eW7ZbO89mcfWJKFnO6PK21vdv166Sm23vj1DYJyM+5puV172A2AFnlNQhAVjcbaP/3aowz1oxllCaftXyFt/v8DwrrGAb4ZfEhgiRGT/bWwxEfDpNej+E5jrh74wot3bty1a9c4AiqIbsW6PAZnqF8+9BUH3Ob+/YVrLzL9kBSTo8NZBFA0JQE8sGZdwuqEkCtrKur0FORQDmX8pztb5vzNr7WtGboAdzUKQ1ugbK7ucu5hBnkfXM2ltEtG7/v1QzddVNekSkFsM3JRRskxT+opv3Bkei6tJ6uTlMjEaWgx6Q+zg/qtoKXXmbM5fkT+OMUeCtzAPGECtAEX8lOD9UfJ20TA5KDvPd5C9xiZw7Cm1wYAT7PyqbbrI88tELgszDq1Mf0aS3/1AN3UrMZRt/wd3FnpNPQsQnirTLqZUKMbNA9S6MjgZOu65V31xEt9pJyrYDp69lTpN9iw2rHzJ1LvHJEX37Njr2TsadiBS/LTxm+VNdPudkRMyr2bngM+8EsSy0PA1d2HzHKActRw8i8K4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(10067099003)(5023799004)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QmtlUUZXb0sxSVp0Q24xb3FOdlRLemRLazZNYVlKRXI2K0VCZkFBdVV3Rnla?=
 =?utf-8?B?bVJWUWxSaWU0aTA2RzNtVTdVdE5xVTVNYmtLUVEzVHk2SUtua1Z3eG43U1FW?=
 =?utf-8?B?VmladzhhNmVsa0RlME1PSVM1SDNEYzkxeEp1ZkhneHh3bitXVjg2WVc3ZUpq?=
 =?utf-8?B?N2hvcmVjd3RmeTFtWitDbVpHYU5seTFVdzZyL3NiRm9oTmN2ZWNtN3NHZlVF?=
 =?utf-8?B?aWp1N0NaNUhjZmdrYVYwd0tTcC8yMkI3b0JWK2h5WWkrMDhDTU5TcHhsQmlN?=
 =?utf-8?B?dUVOQmRzcnhiSTNaOTd2MXRhTXVLTXRMZkNjN3FoU0U4MTMrcm50VEJ1djJp?=
 =?utf-8?B?Q212SHZ6OXhKOEIzbjZyaUREcG00b2liMkl1em8vemJHQ05xV3hJVE92WCsv?=
 =?utf-8?B?QW9pVW55TmZhbWR6SmhJeURISmlnSG1zbjVZMnljalRMcEhUbXB0ekw5K05l?=
 =?utf-8?B?VkJabGUxSlcxNDNWQXZJdWhvTitycHBZRXk3eVJUQTlkL2Y1ZitSOEpFSEg1?=
 =?utf-8?B?UTJ0UnhSOUdmVURMbTlqc2ZTWXJKT1JoWkkwMndid2RRZ0lZSkFnMXZTbmJt?=
 =?utf-8?B?L1dvNGpNS0lHSWwwZmVxRldkU25mcnlpWXM0MkdvYzByQm9PWTdpTlAySkJ1?=
 =?utf-8?B?NHpmNVZCTk02MVcvajJ0aDZaY29vSG9uRitpSHF6QjZnbXRydjgwUHJhUENP?=
 =?utf-8?B?L2tLZi9BWXE2OWxFTG5vT3NYeThCRXZYR2Y2RDg1OHIvbGI1aVl3YSs1MW8w?=
 =?utf-8?B?OVYyYlNOU3kwVkR6ZEM5NWc1UnNyN294cWpxZGx3YkpIRlB4OWtnOVpzZVNa?=
 =?utf-8?B?b0tmUGE4OHl4akNWcnk4QjV5M1BUbGRDNmlEN0xUVFd4SXdtbG9WRVY0Z1c1?=
 =?utf-8?B?RHcxMzRSdXpxN0VvTGNSN3l4cHpvdWJUTlduNDFLemdIbXdTQzYzK0w4MVhX?=
 =?utf-8?B?MUxBOHU0SXdtYitOOTN4Tjh5SkJ1bU1leTRJeTU5M2Vob0psYlBOVFcvNDQ1?=
 =?utf-8?B?ejN2QjArbGE4cThMQ0p0VnRFeWZXUW1CZUFMRFBEK25jdWFwSDNSZG9sWG0z?=
 =?utf-8?B?QmJVcnJmWGhwb1hsZHJCT05vUGIxRjZEY3FmR2F6TWNGNExmbXl2aVNlNHNL?=
 =?utf-8?B?eEU0N3Jpa2NQSnZUSlRuOTlUR2FQM0lBRXY3N3VyVm9JTHlyekhEUlJPVGpD?=
 =?utf-8?B?cDlqNzdmakZURHlhYTVmWlBZUmdVTmNtbnpRRzBQNnM2elowMUxzenFQS1Ji?=
 =?utf-8?B?SDBSZ0E0S2IxSjdQdGZRaVI5bGFZSjBpMzlMTHN2ZndZTEs2Z0pYV0NXMDQx?=
 =?utf-8?B?dkZodE01Umg0bVFPNEk2dmUyTmNjNDljUVFQU2dEbUQvL1RWeWdLWElHcE5h?=
 =?utf-8?B?YStPd0pZSUFIOEE2RVc0SWQyaStuT0p5Q3h4b3RJRXhXVUFnZlIzYWdPaXV5?=
 =?utf-8?B?cnYycVl6R0tFN3N3dUcvR2VIelV5V2tqWC85cmprdkJBekVCMEZ3VTZrcG42?=
 =?utf-8?B?R1ZQNHRlUFpTTDVaemhJRzZkNmJCMEJJZDFtcDNPVjlqb3Zib1F1SWJHRWYz?=
 =?utf-8?B?VkpPcUx5WnFuaUhac0llcTNuOWs1SG8rQWEzRXk4bDNXSEdXQlF3MHZRaGNi?=
 =?utf-8?B?ZGQwL1hqN2ltY054SzBwcHBhTXpyVVQwNCt0MCtqL1hOa1oxaUpXMmowWEt0?=
 =?utf-8?B?MFhkdG5ub3JoTlJ2cnB1MGlXTmZHN29KUXlmVDdRRkdEMnh4djdGRi9KSU1q?=
 =?utf-8?B?MjNLdDdCK0o0ejcyaGQ1MTF1YW80UlpFY0pFdDczLzkrb2FZWDZmMTh6d0Qr?=
 =?utf-8?B?YTRBZ0xUcUluZ3dBcEZ0T3VkQVd1K0J2SW1zQjRXNENBV1RmdHBnVGdlRWNq?=
 =?utf-8?B?Ky93WDBpNWIveVRVWUFUNURlazg1MU14YTJobzdQVFlKcU15Z2FqTVVHS0Jv?=
 =?utf-8?B?WEpuYWEveTI0Qm56bmZIcVdRN1Rvc3A3UjJuZWlhS1FWQjhTVzQ4UHNmYkFS?=
 =?utf-8?B?cW0xVjRFa3IzMFpPUDl4ZmxGL0NLeStNZGxCSDVJd05JUGNhN05NU1VJK3NY?=
 =?utf-8?B?akpYWXQxazlIUlVVZU12d3lhSHp5Y056VCtTSmt4dmpOWHA5Yk9WeE16c2Nt?=
 =?utf-8?B?azhWQkRScWFvcitucFBERDVydXNzUWFMcTIxdXZNMGRPb2x3QmxldVBqNWxy?=
 =?utf-8?B?Ym0wV1pqaGFCQjh5RWR3UCt0K1hDb2FmdEhBdkxvSFdtUndNQjd5eXdDSGx3?=
 =?utf-8?B?RlVhRlk2OTJ6R0VNc3M0QkJMR0pLNEdlTks0cHdyWHFXSEhqOVo0RVRiWkRZ?=
 =?utf-8?B?Qm5NT1pMVmFNTmFnUHdEU0dUUzFjMVlMOUlQVHdKUloySjhYYmxXZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <98CEF8F080268641B118C9B84A58FBC3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	lYrBjRHotYnDHlQuEvSIjDMD/0FLyxdXmlMvvz9s7hWgHEuyl9oD9V7V/W8OVRvqIAaSUZIy6e89ObCt9mqp7F5kR5edU768Wbtphd/0bu0zGlM+/WJSlXvULm6fo1zkISgtRgPyM470z43AXe1C3nabQmYV/EnN88J1+aSKCGHx0rfkPVnbyqYM9+RYqB1ZLT+gAR/9ntZTQwOMFWHaLFJanQu5SxEFODNjRWCT45wZpoMDo/WSytPHJ+lxNQhfNi+kzPpAtkHGqEfX7jvqNz1p1Ghp+g03BTmgeqFsVNDiL0LGENU3Eewjr0aNrREFB2XRrriJibpT2o+qxug5XQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ikAXJpfSGWZtsirSy9kunTBWrTUIYHiVDx8t3IemEYDIjDlPkoG01lsprUYMoJ6kyvwNdWPz7//NHympe1YnygLEie8qJ/zmCQw1NYYErMEX2abvfpw1FAOEJYJEqfTfYLF52Cq4UF2X3wmv0sDwji5z1UJ071V3v2dW6RWRnIvOC7PEPF09wRYoQNxAwl/9z8+8BMIO+7YXpGMazwJ5yxr55iiqzTWZ04SQ3/WDw71g8OkEjjWPpCgswmYtZO3+g+AVyiH0W+StWFuGP8P+MCDc7hhQPPGd+e7/DYFdUTCM2I9tsf5dwC8TfJXfmeGVm0eA4GfTMqmIxEQJ+DKY2INsSMYPnq5zGdXVGb8JND1DMpgTZfv29W6JoMohcqttzUTrjjCg32NgVnd47DX3A7YsXtMC4MtTVjYwjqX3B39TfMPX8Nbmoc+cEBdx7FLELYZW6vyi6aOLWQK29LBJr0OF0zPrgFD08ExKAn6jA+xmW46/jBtr3VE/39CFY7TOQqYc/XZ91l6rV+MktGT8V26vRnCRUj5MxNft/iPpA3Bkisk/oDZsvFXYS0l3GtrAGpnK0nR4Hs0Udm/qUmiA1rA8BlDg+PmI6Lw5huSVQBjAvH0mr6eMcBKzJH4EPPb8NDaOqlGB6muQ8j9/jInmmQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c384dd77-6f87-455d-0170-08df0addb8b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 23:39:11.2226
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GevHsn/0AURo6ZOtDQ+HfM8/3u9CLhZWUMLoX5yiXxR8xJ8jJbwYgSh3zfmkyCRw3hJDrTb8i+VVxe3JGP6ZJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5667
X-Proofpoint-ORIG-GUID: YAIi4fDb0XahdwXCVWxoT2nzgdhPOozT
X-Authority-Analysis: v=2.4 cv=L88theT8 c=1 sm=1 tr=0 ts=6a9b56a5 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=pGLkceISAAAA:8 a=Uh11BhY54IYGqmMF9_EA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: YAIi4fDb0XahdwXCVWxoT2nzgdhPOozT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDIyMCBTYWx0ZWRfX47haScI36ENa
 JXMzQVB140ZVAnMPMo8ToYqgYEzaRcczcVr8fAEqqrUAk2Ozz2UmlaCdyEM9j0soiHQqAHKBfab
 Vmi/jEjlaW3Hh0GQWA/E8DuydZg+l08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDIyMCBTYWx0ZWRfX9d6UXYUeV3QG
 H/iJurc8rfPjUwwkkxcxqfNgG01/ufaCnUjLR/Qgiuu/2s++UYeCTnk7e/FmfKkFDkWYJdvM3jp
 +YEWkbDxc969wTLeWunr2eOo+5jfO9A+Kq6XpDIkVNyd2lg/jMCo9wyD3sp0/AHLvGVUJSMFlTK
 6371jsIS5sQqFYKPwOiPEUDg2UU/767gI02DPr3mCN0HATSYz+7gkhqSddeZBYiiqjWRJZ7NI6U
 4Hd8TN9p9wPuRjwPXIVQuELYYDxIvILDI0RSAXqY7b2RulnuDc7XRn1+ixEcVPLQJICtAPuLdtV
 z7C8M8ymiWx81N1oUyO+3lELgxyo0AsOmAb2p1Bt2Dl+l8PsBWg7yAPiNitexoqlqv5/nW8KO/s
 r5+XoUuBw2Iapo3fWm90vWc8EOmoZCahQ9sM8Ei3MAgH1xB8xILA/1vRcMPp1Td6LXA+gVHHmKh
 5tnjEz6GWL0tH8Oz/6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 adultscore=0
 clxscore=1011 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609040220

SGksDQoNCk9uIEZyaSwgU2VwIDA0LCAyMDI2LCBEYXZpZCBDb2xsaW4gd3JvdGU6DQo+IHByb3Bz
W10gaXMgc2l6ZWQgZm9yIGV4YWN0bHkgdGhlIG51bWJlciBvZiBwcm9wZXJ0aWVzIGR3YzNfaG9z
dF9pbml0KCkNCj4gY2FuIHBvcHVsYXRlLCBsZWF2aW5nIG5vIHNsb3QgZm9yIHRoZSBOVUxMIHRl
cm1pbmF0b3INCj4gcHJvcGVydHlfZW50cmllc19kdXAoKSByZXF1aXJlcyB3aGVuIHVzYjNfbHBt
X2NhcGFibGUsDQo+IHVzYjJfbHBtX2Rpc2FibGUsIGFuZCB0aGUgPD0zLjAwYSBQRUQgcXVpcmsg
YXJlIGFsbCB0cnVlLiBTaXplIHByb3BzW10NCj4gZm9yIG9uZSBtb3JlIHNsb3QuDQo+IA0KPiBU
aGlzIGFsc28gY2xlYXJzIGR3Yy0+eGhjaSBvbiB0aGUgZXJyb3IgcGF0aCBhbmQgYWRkcyBhIE5V
TEwgY2hlY2sgaW4NCj4gZHdjM19ob3N0X2V4aXQoKSwgc2luY2UgYSBmYWlsZWQgZHdjM19ob3N0
X2luaXQoKSBvdGhlcndpc2UgbGVhdmVzIGENCj4gZGFuZ2xpbmcgcG9pbnRlciB0aGF0IGR3YzNf
aG9zdF9leGl0KCkgZGVyZWZlcmVuY2VzIHVuY29uZGl0aW9uYWxseSBvbg0KPiByZW1vdmFsL3No
dXRkb3duLg0KPiANCj4gRml4ZXM6IDhkYTc2NDQ0OTNiNCAoInVzYjogZHdjMzogU3BlY2lmeSBt
YXhpbXVtIG51bWJlciBvZiBYSENJIGludGVycnVwdGVycyIpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBEYXZpZCBDb2xsaW4gPGRhdmlkY29sbGluODk5QGdtYWlsLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL3VzYi9kd2MzL2hvc3QuYyB8IDYgKysrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2Iv
ZHdjMy9ob3N0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2hvc3QuYw0KPiBpbmRleCBjNTY3NDE2MWIu
LmNkMWU1MjA0YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9ob3N0LmMNCj4gKysr
IGIvZHJpdmVycy91c2IvZHdjMy9ob3N0LmMNCj4gQEAgLTEzMCw3ICsxMzAsNyBAQCBzdGF0aWMg
aW50IGR3YzNfaG9zdF9nZXRfaXJxKHN0cnVjdCBkd2MzICpkd2MpDQo+ICANCj4gIGludCBkd2Mz
X2hvc3RfaW5pdChzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgew0KPiAtCXN0cnVjdCBwcm9wZXJ0eV9l
bnRyeQlwcm9wc1s2XTsNCj4gKwlzdHJ1Y3QgcHJvcGVydHlfZW50cnkJcHJvcHNbN107DQo+ICAJ
c3RydWN0IHBsYXRmb3JtX2RldmljZQkqeGhjaTsNCj4gIAlpbnQJCQlyZXQsIGlycTsNCj4gIAlp
bnQJCQlwcm9wX2lkeCA9IDA7DQo+IEBAIC0yMTksMTIgKzIxOSwxNiBAQCBpbnQgZHdjM19ob3N0
X2luaXQoc3RydWN0IGR3YzMgKmR3YykNCj4gIAlyZXR1cm4gMDsNCj4gIGVycjoNCj4gIAlwbGF0
Zm9ybV9kZXZpY2VfcHV0KHhoY2kpOw0KPiArCWR3Yy0+eGhjaSA9IE5VTEw7DQo+ICAJcmV0dXJu
IHJldDsNCj4gIH0NCj4gIEVYUE9SVF9TWU1CT0xfR1BMKGR3YzNfaG9zdF9pbml0KTsNCj4gIA0K
PiAgdm9pZCBkd2MzX2hvc3RfZXhpdChzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgew0KPiArCWlmICgh
ZHdjLT54aGNpKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gIAlpZiAoZHdjLT5zeXNfd2FrZXVwKQ0K
PiAgCQlkZXZpY2VfaW5pdF93YWtldXAoJmR3Yy0+eGhjaS0+ZGV2LCBmYWxzZSk7DQo+ICANCj4g
LS0gDQo+IDIuNTUuMA0KPiANCj4gDQoNClRoZXNlIGFyZSB0d28gc2VwYXJhdGUgZml4ZXMuIENh
biB5b3Ugc3BsaXQgeW91ciBjaGFuZ2UgaW50byBzZXBhcmF0ZQ0KcGF0Y2hlcyB3aXRoIHRoZSBj
b3JyZXNwb25kaW5nIEZpeGVzIHRhZyBmb3IgZWFjaD8gQWxzbywgcGxlYXNlIGFkZCBDYw0Kc3Rh
YmxlIHRhZy4NCg0KVGhhbmtzLA0KVGhpbmg=
