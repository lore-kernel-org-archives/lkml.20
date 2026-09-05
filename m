Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E1F361668;
	Sat,  5 Sep 2026 01:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788570062; cv=fail; b=kCxP2aerZ88HIcBiagvEACVENlXqPLrR9MgV4S7LJoKqfb0rVZ23pjEKpymAbGVNTtwHf/7aihmdOlTHXW8quHefQLqxvJZzEo9twRa348xF4z9i1uXqpyAcgAcj8JpxcVyNyfKIehVRM21F1u0l878tXzFu/mv44nWgvfuTbGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788570062; c=relaxed/simple;
	bh=eXStgUp1sjWNUwl0sjMUjRJog5YaQK2us8wH7EHDN3Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aPOUYr79YaNnorocWD/xJV+R2mG4mTxjTCB+4fOatdg3Tw22TaKJSauFW8cx8X8RGE3IEFm+8Xiq0XRvkeeh6s202gQHU+js4jQKu5lQ8xsdjBGIySSYw2az1BowuGihyRH8//WmFUCn18EBPkoXS6Y1HTVI1XcGEyomrKNrBi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=d+HDRSsA; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=b682i8Qm; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=iPohWXCC reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="d+HDRSsA";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="b682i8Qm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iPohWXCC"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6850xMsF1630167;
	Fri, 4 Sep 2026 18:00:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=eXStgUp1sjWNUwl0sjMUjRJog5YaQK2us8wH7EHDN3Y=; b=
	d+HDRSsAWEARSTmD/iRNRwpMHoD0mLLpCZNo8ze+N5/5KQY/jRI+IFL8jgkWwUCL
	CUHQrLucEPf8nhW3N71BU597QzVFM8+XwtXgVOBeMMcOVH06ZF4TZzOwK9rqs8qV
	sEBZuqZjr13Z2YxxU1fFj1WMY5i1/C3lSQfaYcB+khP9LCKoOPTrUGdYxTJ0bsiw
	8p//NY7Jo3v/HrtorMFCLnNelYtjc/NGPAK3gp92Uz6Thx1JzRydEpLstBKVkpsn
	IpFtleb4ksh3NlauQ4yKwBp6PjEd++N31F4GLEiPxJi8dRg+F2R3GFFgcUFjASBZ
	rkz/YJn5V5D0Se6X8Zyq4g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4gfrm1b9cd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 18:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1788570049; bh=eXStgUp1sjWNUwl0sjMUjRJog5YaQK2us8wH7EHDN3Y=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=b682i8QmUzw4CFzKCUnTxvSRd8OlMk35vjIKUYpKwzsX5Pm1oSaHc7MokwukZpY2P
	 J0Ijc1Eg6/HEw7aZyu6S2iYrsSDx3sgDAIK4B2OK8PO0ZEXaYBWQi9fkYsHriYCp1l
	 Kpzj9EFuP6ubR6TdPcvaq/WZKb1nI2B2obdwtiY0sBXvc9Bx+H5ZPB+wW9WfJd3l8D
	 y7K4OSktboDaGRpIvDFrhRWQ2GWIfvyyt/r/nianvweglG0NXCCXLsJMgVCBwXWTqy
	 3Z4KvAEC8M8EBqsHVVAIKn1iZjFLMmt1EAYuFXL4e/Ubf81Cx/c3stueqriMDAHo64
	 1pGhoYzcyhZTA==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0E59E401A6;
	Sat,  5 Sep 2026 01:00:49 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 84894A00B8;
	Sat,  5 Sep 2026 01:00:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=iPohWXCC;
	dkim-atps=neutral
Received: from DS2PR08CU001.outbound.protection.outlook.com (mail-ds2pr08cu00102.outbound.protection.outlook.com [40.93.13.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 363C9404F3;
	Sat,  5 Sep 2026 01:00:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZqPhO+wzFP8VRtCQN5a1muXoBwZ+ZBVGWyqzAYV6f6iRDxfnap/UPZ33xRQyxceAj6CrPoTS+ikOG5ckat6HthRJJ1Po5yzSh6F96Hxtv1cgXO9Iww7RTbW1OjZ4zoJloPDOQLo3zy+bmQT5xFfX5oDP0B7CoIJSzA99BtUTidla7RGBLFeV7frmJ8BL4Td3FdI0s8nP6ISTSouQh2/29JfmifAL7sWzJQaDZjRQoUP4OG9hHOZQ5E1hMWn27dy7b0YvbH0DuIsr5a5tMM30Vmn41utyhXZveenVkRH1+63xBQWQnFg1nI7UNBx5n5mO2hqImNZH5lJqwNZTBUS4RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXStgUp1sjWNUwl0sjMUjRJog5YaQK2us8wH7EHDN3Y=;
 b=Aq3Y8n8E1Hf4acjrd7PmY6VLvITN77DAUWy9VOTJa+jwFX3RhQGNOdtXKnZOaaT/vqPR8u7Vc23JzHdC5w6iXt5vQRv6FEH+c2L1qMqV3GeLITK0ElGRgsLnO0A2+jk3XrmAkjK0G+hVrahYCbsvO+gys544meqk2KKr7C2L9V2G25wH25r8NqMy0PB4OcdK6sc8FUAoMRckLdAwhc3/YBYRTppOuW0ePI8Xws4VCshGjdH7P7iEe8mYUJlw0DAQKjjTFaLz3diyqOMKWPWa98Py7tyiMiSMxmq0ZiaLb2Zbg2k0QX6VPNovBwied0kGFtV89y6slQ65qw7bHzMd+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXStgUp1sjWNUwl0sjMUjRJog5YaQK2us8wH7EHDN3Y=;
 b=iPohWXCCx9plSMtuf3YiYczCTxq2lnoFb3JqAUDRtvNKWsQbj8KrTOhakIR8zKDagQJAkUHgF7igw+Pko9MHaeTQohNKcK8H0OzFbObJ/ET+ZDnLu2U3vlPiGgo4tTr4eXSK2OLflGvzB5whKbzUWmb3Yu9mrAsqNBtQp8Z+Mww=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DSWPR12MB999129.namprd12.prod.outlook.com (2603:10b6:8:36d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Sat, 5 Sep
 2026 01:00:42 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.008; Sat, 5 Sep 2026
 01:00:42 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Huang Wei <huangwei@kylinos.cn>
CC: Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kakapapa2 <kakapapa2@gmail.com>
Subject: Re: [PATCH] usb: dwc2: debugfs: fix memory leak of hsotg->regset
Thread-Topic: [PATCH] usb: dwc2: debugfs: fix memory leak of hsotg->regset
Thread-Index: AQHdJlVWU0eI7OCRe0CuS9irUg48zra/V0aA
Date: Sat, 5 Sep 2026 01:00:42 +0000
Message-ID: <aptmNMpoQt-fL4OK@vbox>
References: <20260807100400.3179625-1-huangwei@kylinos.cn>
In-Reply-To: <20260807100400.3179625-1-huangwei@kylinos.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DSWPR12MB999129:EE_
x-ms-office365-filtering-correlation-id: 5810afbf-1793-429e-a58f-08df0ae91c28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|10067099003|11063799006|4133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 bafFE2PsAytkd5zwdw7uUETSAx1hjoKZ1OlGk3+FG1ZkhHwfqA5AcEEtDZZW36uOO36kTSIyZ+llkQKpws7FFW+uJ0vLcy++poaeDJwOV+5bXnpt22x3bs6cj95z8LXGX0ZOnMqU/cU4CF18ABrbdDv3yCxtO+er4XMwIdPjOA6O5Z2oziBb3oWf87s9LNBmcyAd1ETmifqaiuPkkinJceVjYy/XRjuTOIqo67WYuijiwXC1BrIrhIEHzyYoUJemzkwY7JHXIMZwVXYVzxf3qjZSRbo+yijsgsUQz7IG/WEXtFtdcN3OLnQJDjd7yPlczF2WxguuErYsUug38i8/5KujTSq7VRBDohiIFtPbwHKpQMD8JqxGzJrve2CxlmTb8Y9Gbvy1pF3YRKH+o+imZEKgZvGheXgzasQVZEkN7LRuSrMxKeS5rlBC6L/e03pi4bMGB5HwoFSbJTVoCwrwpugzee+xu81+S9aS+/VKfrNI/LoKj5xzh9YqZLrWxcEyVtsOa3FG7OaV4U0psazqBad9MORELdsBeUvZcXr0/dVWmBZbAMN8letD0nLnZzbkS8yfC00cy6fZ7D3+K43/cW6PHmrwzidgKlqExkzVFrny2Wq51GV2E3lADj6vhpaWJNCGCfQNPCYrmap/306zAxCWwe3EsJOyGhGQdB0F30opf4Dwxo0GOGWpYZxGTNI5OpVdfVZRbszv7H11Zn9htlPfZZKcelq8tEefojDiGG4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(4133799003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bW9yTlNBN08zQktNL1JjdDlTZWlDN0U5VC81dXhMZUxKd2hIM3RkTGhaS29v?=
 =?utf-8?B?WkdzSC8wVFRzaXVnajZFcGhmS1VPL08yRmdsdzBaa21aOCt0TGxyZTNKZ0Zw?=
 =?utf-8?B?NDNyNm41QlBWalNMdkdnUjdKOEhMa3hwRmZsQitmcXo3L3lzbm9VQzRmb2JE?=
 =?utf-8?B?TUlnTk9PcVVkQnU2TUI1Y2JpWjhLNmZHUWE1SUpJOWlOT2FmMjRmYlJXdFhx?=
 =?utf-8?B?UWs5MGZBYUVneExsL3JhRkFHRDBiQWdkODBqYkZzc3RzYThieGtyWVM3YkdQ?=
 =?utf-8?B?YTIyU3lQeDdvWVpmNlNWcmQ5NzlwRUFoWW4wRlFsTUVjY1V4Y3hJODkxV0ht?=
 =?utf-8?B?UUZQVVp6cVp3K2NTclo4emcvQWRwb24wOEdxOXBtSk9BeEEzNXQ5ZThoaHc1?=
 =?utf-8?B?TkhXUDJBVWlhbUVTNERxY3FiRDBtS1VSWkY2a3RaMG9zYW5WZ3ZLRDZ5VnJH?=
 =?utf-8?B?dDg4UFk0NVZlVncySEphU1RvdnN5WHVqUW5uOHFpWEFUbUd6TWpzWkhmamVZ?=
 =?utf-8?B?K1I1aWJ1TGRqVDJPVlB5S0Rrc29FbXppTTlzUGxwVWFRejE3SXg4cFc1cEsw?=
 =?utf-8?B?V1NFMkNhWHJvL2lXYUhoTEdzM1dtWUVOTFdpclloZDF6clZtT2g5ZnJOMWRY?=
 =?utf-8?B?c0NIQ0JhemRCWWNxOCtWak9naCtEcjM5Vmw5aWtoejJzR3VqSjdjWURYSzJv?=
 =?utf-8?B?NjI5eFRTK0YyRVREQnNXYUkxTVRvMGlNZDU4R2FoTXJYbFBndnllNTF0c0RV?=
 =?utf-8?B?cTE3VnJHbXJCSlJITVVhdmsxU05PcjVBTW5ITzRDQ0V2UWZyK0o2UVlNZWJo?=
 =?utf-8?B?VjF4cGNqaE5PTFJuT2EvNklCanE2S0RyV1pFV2lqUDdlRUNZNlh3QXVmQmN2?=
 =?utf-8?B?QllYMWowRmlnSi9aTUxoTERTdmpIbm9sN0NXbTUvYm1qRy8rdjVxRjEyTlpr?=
 =?utf-8?B?QmQ3bkNud05YcE04Qy9NZWhqazVvVWY5Z1VQWmdsWmVoSUNHdnphVHJFYUR6?=
 =?utf-8?B?MnBCQ0JEbXlWbi9kZDNwVU5zQ2NjdzM4UG1QU1RTNkhlQXl2SzArZW1Xd0g1?=
 =?utf-8?B?Z0g5YzZHRW9PT050eWFER3VBMjhmSHYyVHl5R2lKUXNFbGdZbFFYWUg0S1hu?=
 =?utf-8?B?cFdQRThRMXIvZXNsNCtlT0xIU2xFVERLRzY3UDRCRnl1TGhMU2VJb3MwanFl?=
 =?utf-8?B?bVk0Qm10Wm9GZ09jTno2WEpXRTZMb3oxYllCY1VvOXJ0ZTZhdC9NRHJqTGNp?=
 =?utf-8?B?cmN2dHNjTGRWVVlhcmFpczFHcHBOcGhuL0U1KzZOUUtYVUNPR3NuaHZYWEhT?=
 =?utf-8?B?ZHFQMG9HQ2JmelZFaXlHMnBLT2R2OGVDM3NwRHdmWkxQVDBadzgwZWd1bU5N?=
 =?utf-8?B?ai8vRDYxQitFNmgvQVpGMWtCOXJxS1ZBTXRRMmw1akxoN1NiU1lTVm5nTHpK?=
 =?utf-8?B?R1h5R3hnN1F3Y0dHN21YRllEOTAybjlKT2NLQmw4dGppM25Jc1l6TDJpNTZV?=
 =?utf-8?B?WUpTV1lSd3RoRWtjS1BVZHlZeXhqNlBXdWRBb0E0akt6MHFpZnNsRlg5TXFx?=
 =?utf-8?B?VUNDVW5pTW5lYnl6VUh3L3FCOUUxNERYNjZucFdYUnA1SFFXQU1sbEovSmxt?=
 =?utf-8?B?NGx2Tm1udUJyaXhVaGpUS0djY1FiRjlMSlZTM3IvS01ZZTRBNGV4SVpHRUtj?=
 =?utf-8?B?eW9ZaGxSZGtTV2xqa05FWHFQVEhuQUdpajBKSzBURUg5SmdlUDdNdUM0RzZU?=
 =?utf-8?B?d3dNZUhrZW5yMlc2dHZOV1pBampkVy8ySm5xaWJ4OFQxZHhJNzlmQUFDdjNK?=
 =?utf-8?B?TVYyQ0pJNnpNaWNFSUVUNEgvdEJ5YWlDTW5kKzJWV3JBZW8vY1JxZGUyRFRL?=
 =?utf-8?B?N3cweXBMR3ZZUENUcVJPWkFDMU5YLzBzNGhpclZ1RGlOUjI5WkoxblR0Tkoz?=
 =?utf-8?B?cTN0ZExUeU9ndUMwSk5JRVQ2MmpieWxjUjV6Rm1vdE5GMVcyT01EVUh2RXNK?=
 =?utf-8?B?a1NCeit1NmlOSjhNdnBBdFlKMmJCUEo4S2RIblRHNUlnbHY5R1VWZ3dTd1Zr?=
 =?utf-8?B?L0ZGM3FtMWtzZUZNQjErYk9BSzdHaDhWa0J0N0srcmxGb0RBWm4xMlZ6djNS?=
 =?utf-8?B?THJIMFR5eTlTTGlBUXRjSFg5b0lyVmNkeTd6dG5CMnBlemlGZXp6RUNzTXRx?=
 =?utf-8?B?alMySmFsWmw2eGdYRWRuR2ROYjZSUVluSzVwRk1veVAzRXM1TWRiSitIRGtT?=
 =?utf-8?B?OEU5SVFnVUZJM0w3VlNGcFc4SVRoUWRIWm1JWlpUSjJjbE8xSjBDQXJSYXdT?=
 =?utf-8?B?OGpTZitWSTdxT1RJQkt0VDlza1FYbW53ZW5VRUgvSnk5cnUrYUdRZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2491ABAB13030645836375AC2FD6F2B4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	J2tj4BAEE4yWYgIW+9OoGx9frxZelI63rgWp7TGQQSRLpzX8JZG06Bcr1I8jel+YYFv7HwcsSbB/6fjPGwHCWB4Mr7YgySve2LKySH8AsVWH0hCV1UNpvSMch1ob6RVH8W78Ah3BHpuSCZvECfZBOUBOjyOMJTgqRo5GDEa35GNd8UERDn6dXoT7F1h7P4T0cej15njSOnWjIZXKdOAMczjJEyXtzXkiryWADevlKjH4dLXsLnIROVRkf6iI2ejEih8hfQO3C/pvQYXozu0IwGvG0pVo8W5iDGbLzjG3ksS4hHQwV66C5VRTwg0P+gkTPaW3cYdzxUxekopuHMdAMw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	u/CbAussx47lFpXJs/5RJdXn7kJnk/f5ANvMLK4ZXBe6Q3C3iuxdwp+4N65y9+myJjGAb+EYlLNVB2/mujaDsLPdruKHJVTROz314L3nFMiRUVpVEb14oanFvPtO47gA2xJt10ddIWQJcj+8QeauPxjfVlDkIogb5ojUxoh+YsWy5Ea7q3pth0095IE4vF1eArZfI5xJyIttDp0eJUPy2yt/x6iaLZs80w0J+K/3Cyjm5DFDTXTcvx9mF83ZefQ+8UJEgNHwRRn2fMkamm+jikusuuz/sNpv3Om80rKQjsMrNY7vFOhQuYKEDZ8J6qZgfOJO0TzMzQoWRf5l95qKs1lncQELfh3MSfW6ijrmM0bDBt+g2CvqEnEAI4EMW61ML9DhFW5195FCg3Ak3afMOtlU4kfqwU9gP5j0V0JRXDnv5HsTAbj8/m03lJHcv7Y0Fwy1IJCfYiuLDA/UAZSyWvNMN681N0sPGAifDosafcreM+9OCSxQNnWCvzc6pqvx/f+wCiX2KpWU/06raQvXJXW/1rgOo+bkmTxuEVndSR8dmaS9jKzBUT1a6lYTPjNXuCRKuw6FqSCXRm0BQ4vOOBXJLeLnMqB2Rs29rtlVvlp5pLjjcomou3EIHygciMpKElDuwFYiW1frkoKEat2K5w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5810afbf-1793-429e-a58f-08df0ae91c28
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2026 01:00:42.5369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Okpiw5BkkB86TGZxLTtHJaBhhb1ZUrxBtbz630RHbBuUujwIqqYoRwWi2ZwwQQaYbtR5Q4pdTZ3TG2S7/l1Jtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR12MB999129
X-Proofpoint-ORIG-GUID: 7hSlpf90a6zDWZKu30pJsBare2cn2AjD
X-Authority-Analysis: v=2.4 cv=L88theT8 c=1 sm=1 tr=0 ts=6a9b69c2 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=jIQo8A4GAAAA:8 a=THu2N-yp7UWklUfS5EcA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 7hSlpf90a6zDWZKu30pJsBare2cn2AjD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAwNiBTYWx0ZWRfX9AldYSJy3ItH
 ldsZKryv55x3HY5aYNg1umHFgJTu0cfCxapbxqyblyo3W9KQPDligUqVr/bTw53dMDsnfrlVNQL
 3Us2kchiRc/73aSYTU74Y70aSlQ3bLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAwNiBTYWx0ZWRfX5BKkmbGaljvE
 I+ncDyqXV1Py9AosnrZT4u9HRHuRFE+MmiG15VMY+PNP9tCE+JPlMQB9KbbAnwD2CDgs/FgFP7i
 bQhP7dfIX1lSkxE5cQzagT/WI1z/yrjTzfdvfizkfJRwD12nSHmZbBKQ/LM4ts191FpMX8Fd4QV
 f+xkTtQd61x6eNfBUb5yKoCoi5T7zSkzWP3CxW7oPzOTJKod8GpUCVxmPEnyC48z23WlBAoNErl
 OjzN/OGw7ouFDDzH8Ois5ap4K5CDgXG0ab8vg6rSs6hllkuf5z1w8naYe8yCjCnIzDia7dWnVyd
 r7LqDf7oeoKOKTmtohclAy6FGVM/tj3vDvD6qDaSK8fhLrglkd2rbXUYfdZsCIvFPOMiUbIwrnZ
 vdiWlaKHPu8EtiwQzwPuEZ7q1piKONW1f8qJR6QuwK02T9CrtunpnVyIHu8+0JLYWqWcoxTQJuL
 7Djy3XFP7KtRuyfeU8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 adultscore=0
 clxscore=1011 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609050006

T24gRnJpLCBBdWcgMDcsIDIwMjYsIEh1YW5nIFdlaSB3cm90ZToNCj4gaHNvdGctPnJlZ3NldCBp
cyBhbGxvY2F0ZWQgaW4gZHdjMl9kZWJ1Z2ZzX2luaXQoKSB1c2luZyBkZXZtX2t6YWxsb2MoKQ0K
PiBidXQgaXMgbmV2ZXIgZXhwbGljaXRseSBmcmVlZC4gV2hpbGUgZGV2cmVzIHdvdWxkIGV2ZW50
dWFsbHkgcmVjbGFpbQ0KPiB0aGUgbWVtb3J5LCB0aGUgcmVnc2V0IGlzIGxvZ2ljYWxseSBvd25l
ZCBieSB0aGUgZGVidWdmcyBsaWZldGltZToNCj4gZHdjMl9kZWJ1Z2ZzX2V4aXQoKSBvbmx5IHJl
bW92ZXMgdGhlIGRlYnVnZnMgZGlyZWN0b3J5IGFuZCBsZWF2ZXMNCj4gaHNvdGctPnJlZ3NldCBk
YW5nbGluZy4NCj4gDQo+IFN3aXRjaCB0byBremFsbG9jKCkgYW5kIGZyZWUgaXQgZXhwbGljaXRs
eSBpbiBkd2MyX2RlYnVnZnNfZXhpdCgpLA0KPiBtaXJyb3JpbmcgdGhlIGVxdWl2YWxlbnQgZml4
IGFscmVhZHkgYXBwbGllZCB0byBkd2MzIGluIGNvbW1pdA0KPiBlNmJkZjgxOTViNGEgKCJ1c2I6
IGR3YzM6IGZpeCBtZW1vcnkgbGVhayBvZiBkd2MtPnJlZ3NldCIpLiBBbHNvIHNldA0KPiB0aGUg
cG9pbnRlciB0byBOVUxMIGFmdGVyIGZyZWVpbmcgdG8gYXZvaWQgYSBzdGFsZSBkYW5nbGluZyBw
b2ludGVyLg0KDQpUaGlzIDJuZCBwYXJhZ3JhcGggc291bmRzIGFzIGlmIGR3YzMgZGlkIHRoZSBz
YW1lIHRoaW5nIChjaGFuZ2luZw0KZGV2bV9remFsbG9jIC0+IGt6YWxsb2MpLiBUaGUgbWVudGlv
bmVkIGNvbW1pdCBpcyBzb2x2aW5nIGEgc2VwYXJhdGUNCnByb2JsZW0uIFRoYXQncyBtaXNsZWFk
aW5nLiBQbGVhc2UgcmVtb3ZlIHRoaXMgcGFyYWdyYXBoLg0KDQo+IA0KPiBSZXBvcnRlZC1ieTog
a2FrYXBhcGEyIDxrYWthcGFwYTJAZ21haWwuY29tPg0KPiBDbG9zZXM6IGh0dHBzOi8vdXJsZGVm
ZW5zZS5jb20vdjMvX19odHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lk
PTIxOTk3N19fOyEhQTRGMlI5R19wZyFmWl9mT2Q2Y2NfZ0lXWVRJdVQ5Tjl3Q1YtdEJib2pFc2ox
bHJGTUZaWkhwRUdSd0MyRWN2WnpOT1R0Rm5kSkk2ejFHWll5UVFRbW44TDRwcW52Vmdpb1lMJCAN
Cg0KVGhlIHJlcG9ydCBhbmQgdGhlIGNvbW1pdCBtZXNzYWdlIGFyZSBzb21ld2hhdCBtaXNsZWFk
aW5nIGJlY2F1c2UgcmVnc2V0DQppcyBjdXJyZW50bHkgYWxsb2NhdGVkIHdpdGggZGV2bV9remFs
bG9jKCksIHNvIGl0IGlzIG5vdCBleHBlY3RlZCB0byBiZQ0KZnJlZWQgZnJvbSBkd2MyX2RlYnVn
ZnNfZXhpdCgpLiBUaGUgaXNzdWUgaXMgcmVhbGx5IGFib3V0IHRoZSBhbGxvY2F0aW9uDQpsaWZl
dGltZSB3aXRoIHRoZSBkZWJ1Z2ZzIGxpZmV0aW1lIHJhdGhlciB0aGFuIGZpeGluZyBhIG1lbW9y
eSBsZWFrIGluDQp0aGUgZXhpc3RpbmcgaW1wbGVtZW50YXRpb24uDQoNCkJ1dCBvdmVyYWxsLCBJ
TU8sIHRoaXMgY2hhbmdlIGlzIGdvb2QgdG8gaGF2ZS4gSWYgeW91IHNlbmQgYSB2MiB3aXRoIGEN
CmZpeCB1cCBjb21taXQgbWVzc2FnZSBhbmQgc2VuZCBhIHYyLCB5b3UgY2FuIGFkZCB0aGlzOg0K
DQpSZXZpZXdlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0K
DQpCUiwNClRoaW5oDQoNCj4gU2lnbmVkLW9mZi1ieTogSHVhbmcgV2VpIDxodWFuZ3dlaUBreWxp
bm9zLmNuPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzIvZGVidWdmcy5jIHwgNiArKysrLS0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMi9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL3VzYi9k
d2MyL2RlYnVnZnMuYw0KPiBpbmRleCAzMTE2YWM3Mjc0N2YuLjJlY2JmNjUyM2FhYSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMi9kZWJ1Z2ZzLmMNCj4gKysrIGIvZHJpdmVycy91c2Iv
ZHdjMi9kZWJ1Z2ZzLmMNCj4gQEAgLTksNiArOSw3IEBADQo+ICAjaW5jbHVkZSA8bGludXgvc3Bp
bmxvY2suaD4NCj4gICNpbmNsdWRlIDxsaW51eC9kZWJ1Z2ZzLmg+DQo+ICAjaW5jbHVkZSA8bGlu
dXgvc2VxX2ZpbGUuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+ICAjaW5jbHVkZSA8
bGludXgvdWFjY2Vzcy5oPg0KPiAgDQo+ICAjaW5jbHVkZSAiY29yZS5oIg0KPiBAQCAtNzg3LDgg
Kzc4OCw3IEBAIGludCBkd2MyX2RlYnVnZnNfaW5pdChzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcp
DQo+ICAJLyogQWRkIGdhZGdldCBkZWJ1Z2ZzIG5vZGVzICovDQo+ICAJZHdjMl9oc290Z19jcmVh
dGVfZGVidWcoaHNvdGcpOw0KPiAgDQo+IC0JaHNvdGctPnJlZ3NldCA9IGRldm1fa3phbGxvYyho
c290Zy0+ZGV2LCBzaXplb2YoKmhzb3RnLT5yZWdzZXQpLA0KPiAtCQkJCQkJCQlHRlBfS0VSTkVM
KTsNCj4gKwloc290Zy0+cmVnc2V0ID0ga3phbGxvY19vYmooKmhzb3RnLT5yZWdzZXQsIEdGUF9L
RVJORUwpOw0KPiAgCWlmICghaHNvdGctPnJlZ3NldCkgew0KPiAgCQlyZXQgPSAtRU5PTUVNOw0K
PiAgCQlnb3RvIGVycjsNCj4gQEAgLTgxMCw0ICs4MTAsNiBAQCB2b2lkIGR3YzJfZGVidWdmc19l
eGl0KHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZykNCj4gIHsNCj4gIAlkZWJ1Z2ZzX3JlbW92ZV9y
ZWN1cnNpdmUoaHNvdGctPmRlYnVnX3Jvb3QpOw0KPiAgCWhzb3RnLT5kZWJ1Z19yb290ID0gTlVM
TDsNCj4gKwlrZnJlZShoc290Zy0+cmVnc2V0KTsNCj4gKwloc290Zy0+cmVnc2V0ID0gTlVMTDsN
Cj4gIH0NCj4gLS0gDQo+IDIuMjUuMQ0KPiANCj4g
