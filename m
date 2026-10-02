Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72DE23D7F4;
	Fri,  2 Oct 2026 00:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790901833; cv=fail; b=NSjGshLYW6ZSFPchZtLD9r613djHcNSLxLPOyGpCDYzoQp5u2FNKpULqZAWE16/fWHd53Lho2FaGITqhYuqcIyp7fVYRgxKROZZP1g8nD48n4JlNcWhz+ZDnwcs2LkcSu/BUaXfg79q1qRuGJG1me/lMqKeqpaOyxefyXtRDRts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790901833; c=relaxed/simple;
	bh=WcU06/0YHHu6vSaEWhgAz8ZPLFGNpGK8cHZshxs7V3U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bJ/6pIr94CgzUT+fSZAUYV5pRCsTDeQiGlaBmYHXykUiIWJQwESVuG5G8//Wf9KefJTQs5P0sITGShCMIm8FyjLjxxycsmxre00EUxnBFCUgaZfbwrEXMPX0F5XOcdfMJKkPc75vWHv+6T1wxE4yQFQ6dWav8WdHTn/6GgiD3MY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=VHSIYRKG; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kXFPB+yN; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=SsEg6HLN reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VHSIYRKG";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kXFPB+yN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SsEg6HLN"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691NGOmb351830;
	Thu, 1 Oct 2026 17:43:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=WcU06/0YHHu6vSaEWhgAz8ZPLFGNpGK8cHZshxs7V3U=; b=
	VHSIYRKGk9Dm40q5A8EHExBV2miMDgm/AAaul1zidgOD8pYwQdVKa6UbsO04/3k/
	dcizqdhi8i01wuP4rvzIrFCZ9/4VfMWfQMySUg6mHcrAn+vsAcFNCPICWtVpESpl
	yQfjjeoWZUtY6VKy53sCX/XTnDwPO6Vkx9elxkfi//3nK6+s92zEGyP6udXh2BRi
	597GAvYkbGR1yUckaaVgvsTaqv735fnbk8YnkfDx363ttvlf8EZKDdEedutOcOpH
	4pzffsSAczDlSn0vKbWSgmTV+kmO1OJ8xM0REG/vZtUjejDAbI3+YGrkJL9RHJfE
	wkqOju5kAgo5wKZ+joG4sA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4h1dfy0ps0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 17:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1790901818; bh=WcU06/0YHHu6vSaEWhgAz8ZPLFGNpGK8cHZshxs7V3U=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=kXFPB+yN/58a/WMK3YoMNY/Kjop6amavXW34ntM98Tk8w+QFNHBh6+MhdDFLCY8g8
	 09KkHWkkdTzYboqvfI8qANXnBNXQXqB9Fj6Sk2+3SSyiv61TO7BJVNIMZ0/wn7dKeI
	 YFrttykjHlwP+GVKTsW3fKFt9s3ueF0bgNJg1fF3JMsZYK2poLUN1HBABeQTq6CNCv
	 YbX2k6HS4NRDipKpydNEGJZMDVscxEBV+TZzREVH/FydOVfmvNu15TjH9a6oeybKe8
	 2oSpYRYqBBPUGwDOxQABFfvEqRaIRWzg1JE/3Y4JbIAhPm9+B+ozo4wAkR7gkJDXrp
	 DOqo//I5lF3bA==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A5AA7401E4;
	Fri,  2 Oct 2026 00:43:37 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 4B4BEA00B0;
	Fri,  2 Oct 2026 00:43:37 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=SsEg6HLN;
	dkim-atps=neutral
Received: from BL2PR08CU001.outbound.protection.outlook.com (mail-bl2pr08cu00105.outbound.protection.outlook.com [40.93.4.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8BA15220139;
	Fri,  2 Oct 2026 00:43:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZpNdmMWS6fhkkWnAIgw+Yc2E2pOfYYNsxMURA+X3U2eG4JVlAp3TI6WC0amakx2kkSBH8gDwxEP3DCymUgRq1jZhqAjEflum9ZKzpm1bOWMOp3Nj07AQuvOaZ3fNB20R6qZznlfpVWsKxdQN03cRTS+yxEJxu2MDObSX3z05EPft2ricyvzV+B0mwf+bhbNm6BUwJ6oywboqhbWRuHh4wNpcVMfi0iObMmtnGQf4ck75Dp7zszPKsc3vwWoRcrJZQEmk2LYKszwwTTOEDvM5oDGc4qPc/wXjTLZ6Li0isYpuAP4rsu3o8V2mOSy/FiYGak6ZkzLjw7ZjxC0nIvYdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcU06/0YHHu6vSaEWhgAz8ZPLFGNpGK8cHZshxs7V3U=;
 b=mTodWCfk1Nm2+4vQosfII1Smf3rxoscWS80Xo2eoDG56Zpu/Vu0KoqoXaDEytBSS/pKdYrPMb6F1A7cg8w5YA227pW95eZo3W+dVs2yL5upyk3sOJxtxELkW+aOZh58f1HOYgR8hg82SBjy/14fenRI5Jht1jAHBGaX311PtdE7v1AMfssfpPtHa3Na60fK8kKfIrPzUAz/iftt3zg4Ohdw95euAi4r9cxmgVJUrlA2fr1oRUXTZKxDfV6LXWOrl5xhgW3SvjTFcpoYlTb+dCYpidLg0YHtDPUBkzyoheLvIoHGdg4vyfTji+Uc3r2GHRRx13UvRyyhRzTu2ujMrhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcU06/0YHHu6vSaEWhgAz8ZPLFGNpGK8cHZshxs7V3U=;
 b=SsEg6HLNzWyYwxBMb4iTR6OBxP+HBAQLJzQ6grGkCKje/SICMSSMXEXHdC+3hIaLIDcZOHWenc+jAlTIsLbGguPQOAIwqqzfUl12Ky4Lf68NLCqWycH60+yKyzZSDzqs8+Wy7zUjQqtyCZ/MzPjXT55qWDCxbBBovt586i0+oqo=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by MW6PR12MB8708.namprd12.prod.outlook.com (2603:10b6:303:242::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Fri, 2 Oct
 2026 00:43:30 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0451.026; Fri, 2 Oct 2026
 00:43:30 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiazi Liu <jiazi.liu1984@gmail.com>
Subject: Re: [PATCH] usb: dwc3: fix use of destroyed dwc->connect_mutex on
 gadget exit
Thread-Topic: [PATCH] usb: dwc3: fix use of destroyed dwc->connect_mutex on
 gadget exit
Thread-Index: AQHdUe1dMD8Y+VMfSUeywo+J5FwUmrbpahKA
Date: Fri, 2 Oct 2026 00:43:30 +0000
Message-ID: <ar79_M-IMnz2fUQK@vbox>
References:
 <CGME20261001213926eucas1p18003977c0313cf3395a7413d22043df6@eucas1p1.samsung.com>
 <20261001213905.3290308-1-m.szyprowski@samsung.com>
In-Reply-To: <20261001213905.3290308-1-m.szyprowski@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|MW6PR12MB8708:EE_
x-ms-office365-filtering-correlation-id: 4a035a85-c5bb-4dc6-11e2-08df201e2e34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|11063799006|56012099006|4143699003|6133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 4JkMxuxuwIdSr0g0Xt622jQmE+3BBlvBn2PzzfHGHghhtuxtx/2LiMrha4DGi4M+oz82D/HPWMtRlYe98NgLwrMzqyWvmmBdxPM6trtDJ4PEIdRMfGLhv7SUHJFhqNLyxNLlLDNunfEQWLgGsNrO5MmpMQIA8Fe2K3wUKcFXyGGEf2fr11RLITXAVnYVhuwosU1Xh5F818A+hqlU+VJ5YCPK9ouwpcj6Me8cLzc48uSQGLnA3jfVN9SIfnlw3UMmHUlCsn0osPobsCU6/v8FuJzX4ZKQCXaZtkcf6mbpJ/P0ZQjLglIlFYOWzoGjmqR915/QX9DhBSnY25pvQQDQoDQjZnCt0RnsAi4ysCd5mjOdLO38DHn1/Yx1jnKzkm1UBJow6F//iIsQgk1DfjPimSe18wf2aC0t1s/4inVLBwUIzuHEa+RbqOTJKd/eVsqe47YUDuGILr8LhDqsVTat01bqhLk4pilTXB67CX6nNgQts1IQUcEGe8LGah/+GisvUhEkDxaGpHXrTkZxzg8KAExTag7vcR0QfOzsZYmM+wA70CiBXSJf18v1Ofk82EEvyvkJMHxgELCTVurKEZhjBhXIHYZ5KiCXFGoidvYMGKyg9pkG57MPk9DR4eqFMc0nneB6HhWQ1kAb/TL42WYshn+FUjNokuhKwgahf42oV/1I9AFn83WNELBRPd7WZgyQpts6mQ5FLbNnfoZK+RKJVbcRoktaICUglHgN2tJblpI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(6133799003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a2ZxbHZUWkZZd09ZUGszblo1WVlwZE9rem94QTU4VW9CTTNWc3ZBSHZyYlBk?=
 =?utf-8?B?a3MrTytITUNXUlgyekVocUY2THlUUCs3czk3ekVQWVVrd1dybS9zdm14TW85?=
 =?utf-8?B?Njh4Wlo4MlQrVEVzY1ZuOFY4Wk15M1Q3TDdyOHlqVEN6WCtIN09mZWZZcjlo?=
 =?utf-8?B?RDVreW1FZ1ZMSndGWjBHNkVkczJ4NkdXelJYNXFBdWNLa2xQTytkUURHNlB4?=
 =?utf-8?B?Ti9NdUxmbXlpMWk3bHRZeDFCczM2bkk5WUtSdklHREtUMTRGQlZMZTdYeUVh?=
 =?utf-8?B?c1VIOFh1NDdMQkxDNnp1QWwwWCtzRWhqdWgxRVpWM21KTDlYRFltMnlyQldI?=
 =?utf-8?B?SWNuM1dVbTJqNzVISWZYUXVMZlhuZTBBWDRxQlYxeDJQVWNocGNRYWJlSzg4?=
 =?utf-8?B?ZjdyMTdSV3pVS2xhdTZnZStUOHpXa2NxNXhSM0E0dCsvV05seCtXZlg1MTkz?=
 =?utf-8?B?R3hwWjBRZkxZeWtNOWtVekt3TXBQdlBIdldCUG9wNXFSYURqZ3YrK3JFU0Iy?=
 =?utf-8?B?dGVOcnB5R3Zjb09PTWRnSEtwZ2JaM29EdzhlUXAxOHo0MDN2UThPbWtndkNY?=
 =?utf-8?B?MkQ2YTcxeXlleW5NNU5CMjVEQ2RsRnJRTXhiampMSkN0bXBBRXpxanFOcnVq?=
 =?utf-8?B?dzZpK0JuVEU1Y05STnE0QU1PZzY3d3VrWk00MWZHcFJHSWFyRTl4MDl0SG5H?=
 =?utf-8?B?U1lPSDNLUHFqL3dadGc3d2xIVXY2VDlQYVIxb0k0eEJNN2N1b3pqQUhlMEdD?=
 =?utf-8?B?YktQdmpJRUJmRDIrQnRzZDdlNkdKcThlZ3VxTThhYWgyaFd4YWZ0QUZVK0U2?=
 =?utf-8?B?b3g4NzJSN2F1Q2Q4Z1BJVDFaeWFHbTFSOGc4WnRyeXRkUkZ1SXhINkNnbmJT?=
 =?utf-8?B?ZzJwVDJOUXU3RVp3aFdXUDN0c3krRmR4dnc5bXp3ZC9pQ09xZTRxazl5RkVL?=
 =?utf-8?B?dC82NjRPcmdUcS9tdmR5ZHhHSDRqMWRwTC93RCt6RTN0d0tPVjViVE5Yb0Nw?=
 =?utf-8?B?aWpiRFhFQzllRllOR0lPVjAyRi9uS0xSWHM1aHJtenF4Wmp3azZzZlA4SzVL?=
 =?utf-8?B?OXB0aFlOUWpDeE1mSS9lNzRGdC8zZjhETXdlUGJmc05KdVBVaEVxbU16NjIx?=
 =?utf-8?B?eDh0aitwTXdYVFo2N2RseTZ4ODNkU1hTMDdRRmhGLzFCSlYveldhMzRQcGhL?=
 =?utf-8?B?dVdlYmMvSGRxSFVUdFFYY3F6ajJLNHp1TXU5VHdlNjNIcHI1UEMwSWpXV0U3?=
 =?utf-8?B?RHBRdTZYd1hpNHAvVExReEZYcUg4cDZGZkowcWJmY0kySFNCTFVRTVFpaW9W?=
 =?utf-8?B?dmNQTFpDMFA0dU9MdlkrODdtYi9YdzJzcWdHMlBGNkkwSC85bDZZZVR6ZzJm?=
 =?utf-8?B?Y2hOb0FXVk9UNjJhVjBib3dIWVNrbW1LeVBuQ1htZHBiZ29ITVJ3SmVMZ0p4?=
 =?utf-8?B?b2Z0VnBWdUc0aDhpdElXZnRBZnpHSHVaUE90VitLemJpdTdvditTUnMvcEFV?=
 =?utf-8?B?cGplQW1uWFNZdGIzYnp1U3ZqazVnV0l2RitENVhqMHhrNWpaOURkazlYQnA2?=
 =?utf-8?B?WFhLQnc2WDdUSTRkbTIxcGRIQmxaTEVLQi93anRISktvVUlRWEEyWWNjeDhK?=
 =?utf-8?B?aEE3cjFpQmJmTEdodVMrU1B5YldrUXl6OVIrQ2MyUVFDMk9aeS84YWs0WmYr?=
 =?utf-8?B?VU9hc2VYbGpVYnlSQTJjMHU0NGViNXBMcHNFSWg0dXlNUXl4SFBKbG92bjRN?=
 =?utf-8?B?c25IWUtKcURTS3RGcmpPTWdJbTFoK0hOS3JNYzN4U3JjNlBadE5RSTk1SVgv?=
 =?utf-8?B?QUliZDlPR3M0R20wamNqVFlIaHdpUENDcXZCOGFRNUtGenNqRUl1aGdwaTM0?=
 =?utf-8?B?TnNGM1ZBTnlkaHhyNURCRkdZUXVnMmIzc09TekFtSHZwSEVjZzZUVXFVZ1Q4?=
 =?utf-8?B?QW1RMzh3RXNPUGFTZldJTGs5SDRYOFcxRmtxQ29URjFveHpTN3ZLR2hsUE9H?=
 =?utf-8?B?M3QwRUhkK2VacnRRbk9xTU5Sd0FLR3hwYWphV3FCejBjTTR3Y2hFTHNtWlRq?=
 =?utf-8?B?T2NqenhsVkRFODBOaTFDeGFzSUVXelNxejVINHpyQXMyUjBPV0Vra0toWkF4?=
 =?utf-8?B?dFY0Z3hBZlpuUEV2WlB6ZlVGVmZvZlh1TUM0ekVqWHFHeFpObmRlQWw3aTI1?=
 =?utf-8?B?UFlNbWl5VFpGK0tVZEJQTzFweHZ2Ry9nQk5iYWY2ZHRtdU94NGxBNjc2TWVU?=
 =?utf-8?B?a2xVdmVVcytac01JU2hPcEgyd0VuTEdXVlVSVElTMFZsWi8yWGl1ZE9CdkNG?=
 =?utf-8?B?TGhyOWZ3bEszaWF1MCtuemhwT1ZkZUVXMEV0NkgwM3FUUWlHZTdvQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3591E2A9117DCB45B7FEC4032BACB961@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	YAPbpaU92hO+XVk8smSPpGnJH6fn9Q8CrGEahCVH9Or45Ta3XeOU/fEIyahof/DqOxJHsvPi04nY5uxQDWOu9fyvBPF/b45nGnMDPhRnBvsOFjaeooGJo3ZQ6cryJ6iKmoQFA4KzIDwvbxtMuMRDZUpIqVtD3VxVNoEgVRFnbhkxjpZO06I5GjM0+kMFUEPOVLEAc6I+9Fopt97AC5lpquWMJrYeNh9akTNBXIk7jjK6YpGZMa0++aB84zG7/8C7uCPAqXfXV16NPH9A2DWZdaNA5OxCGb5KY7gQOyeue7Q850B4gpCfKOL2fmGlUymAczihNiwWkAEXaebiNRUSqg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cEk4ShX+IViW0TtlWzGi8IggAcaond5sQM45CR9ZTIRjseqtimAtzFWAzj+nh36vKnx66pwn+gQZUAPzoDMbcZosboHs6pAcfDFSxABHook1oohc7rcjhUW56hLU3YBDh1anT8IV323oTP2eGJRcYlZHr8iJq+2hZOkwztFiTgnrsvobm5xiS32jZramsLdhPQzExgM2teFU/XviKL8aIbQH+O5WojhYNpNhm3kv8rORigLQ50O9vdCLieNSfJG75kGrBrcicflpCUO39zRWph73q0eLmnHLqnvHP6z9pQFKQCwReRmDdfRCRDV0NCpPt2wppCp5XIpF3rKjvFIokP8mxgZrN/0jKWZgVXK51chxmDA5vitts3Gm8nMugCCuxo0Q0g/5DBzeCpZYa89fs8zKxOYO6JIvc8Sbk1sCuYhCnbsrrRH/qaWpSQEu1Yfaw6URa7XY3QuW3b34tFCUSyhfQYYhRDMHEgAhP5swWvuO1c/2/2ItkIjmxJDtCfMhgVq77JT5mM1zdpoJv0burmUG+IvUEew6pPGYuTGImx9lh7H/ocsLjpwNtvoAKhy42lz4PU3fzJFy52CrpMEMOlLwKQQRei2phtYrutZzs5pam3/UoYDl65S97kPS1dPDvtbLoGHWAUcOQpXAjbUEyQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a035a85-c5bb-4dc6-11e2-08df201e2e34
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 00:43:30.5580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ICpl6afZUn0ZsLIHCFSQzZmZoFOoGyDnfAazcswcHX8k6+3vD7KgQLoB7qBWrifoC5dR10mibGy/oH/egKlYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8708
X-Authority-Analysis: v=2.4 cv=T5oZ3PKQ c=1 sm=1 tr=0 ts=6abefe3a cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=6gl_cCoBAAAA:8 a=hD80L64hAAAA:8 a=jIQo8A4GAAAA:8 a=f34TCsnM3CMlkqItwuYA:9
 a=QEXdDO2ut3YA:10 a=Bor9z-CvbNo2M6AZn8_k:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAwMSBTYWx0ZWRfX5tvk9oOXLMn0
 dWMhnIcotkWshyRK7W1pp2phCEBsi7Y52DJpcSn11ckgemArU8NepUzvUZfvHoeLjdGvSvWGtiy
 sqSyw8F9dVyTYrLwxVSUUHbt5AYD8Ug=
X-Proofpoint-GUID: aKtBNArtNU5CCNeng5lkXm62_up2V911
X-Proofpoint-ORIG-GUID: aKtBNArtNU5CCNeng5lkXm62_up2V911
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAwMSBTYWx0ZWRfX7BxipEY3uJHF
 h/Kg2hbFdo0YZBhHCwlY4+9IyWZxkQsNMDuyZNwfyDdPM8rswoR5huc7NJ8mX5Rd49UAuyyEfll
 x1G1tOTjkOusQBGf+df0t0o2CgPepvnnZWlEpaAyA6dFg2B7D5PesNTKSsOXaclIeO4g2l1HA4y
 5c0m+8mYQVzfHckMpkm/XVLMRkdZzplooi5RPqlT7c30IwRYOcjDvyy3aHuRODTwDrrN2KHY6MJ
 h2rHS1wEBbl9bvBsEupxmMAiTamFbYW+4qJohohcYd9K5ruqZxOW2JXqlACMwEkVYT5vUSebHf3
 YOICmXPa4/pYfAFtYtuQjSmhVTTBch5Ld8d+dwXL5sKtnSTl28mH8IVQfhusM1EQ4dd8hXGM2VF
 9QxC0QyPIguOFJPZzSiDF2AxOIVG5k57SKUbbuPBHzkNQ6qby/P3hENMADyFwNePj0TgHQyBZji
 ptu482xB8ah7OVjjmFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_05,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1011
 spamscore=0 malwarescore=0 adultscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2610020001

T24gVGh1LCBPY3QgMDEsIDIwMjYsIE1hcmVrIFN6eXByb3dza2kgd3JvdGU6DQo+IGR3YzNfZ2Fk
Z2V0X2V4aXQoKSBkZXN0cm95cyBkd2MtPmNvbm5lY3RfbXV0ZXggYmVmb3JlIGNhbGxpbmcNCj4g
dXNiX2RlbF9nYWRnZXQoKSwgd2hpY2ggdW5iaW5kcyB0aGUgZ2FkZ2V0IGRyaXZlciBhbmQgZW5k
cyB1cCBpbg0KPiBkd2MzX2dhZGdldF9wdWxsdXAoKSB0YWtpbmcgdGhhdCBhbHJlYWR5IGRlc3Ry
b3llZCBtdXRleC4gV2l0aA0KPiBDT05GSUdfREVCVUdfTVVURVhFUyB0aGlzIHRyaWdnZXJzIHRo
ZSBmb2xsb3dpbmcgd2FybmluZyBvbiByZWJvb3Q6DQo+IA0KPiAgREVCVUdfTE9DS1NfV0FSTl9P
Tihsb2NrLT5tYWdpYyAhPSBsb2NrKQ0KPiAgV0FSTklORzoga2VybmVsL2xvY2tpbmcvbXV0ZXgu
Yzo2MjUgYXQgX19tdXRleF9sb2NrKzB4NGJjLzB4Yjg4LCBDUFUjMTogc3lzdGVtZC1zaHV0ZG93
LzENCj4gIC4uLg0KPiAgQ2FsbCB0cmFjZToNCj4gICBfX211dGV4X2xvY2srMHg0YmMvMHhiODgg
KFApDQo+ICAgbXV0ZXhfbG9ja19uZXN0ZWQrMHgyNC8weDMwDQo+ICAgZHdjM19nYWRnZXRfcHVs
bHVwKzB4ODgvMHgxNTANCj4gICB1c2JfZ2FkZ2V0X2Rpc2Nvbm5lY3RfbG9ja2VkKzB4NDQvMHgx
ZjANCj4gICBnYWRnZXRfdW5iaW5kX2RyaXZlcisweDQ4LzB4MTI0DQo+ICAgZGV2aWNlX3JlbW92
ZSsweDRjLzB4ODANCj4gICBkZXZpY2VfcmVsZWFzZV9kcml2ZXJfaW50ZXJuYWwrMHgxZTAvMHgy
M2MNCj4gICBkZXZpY2VfcmVsZWFzZV9kcml2ZXIrMHgxOC8weDI0DQo+ICAgYnVzX3JlbW92ZV9k
ZXZpY2UrMHhlOC8weDFhMA0KPiAgIGRldmljZV9kZWwrMHgxNGMvMHg0MTQNCj4gICB1c2JfZGVs
X2dhZGdldCsweDkwLzB4ZTgNCj4gICBkd2MzX2dhZGdldF9leGl0KzB4NDAvMHg5Yw0KPiAgIGR3
YzNfZHJkX2V4aXQrMHhlNC8weDE0Yw0KPiAgIGR3YzNfY29yZV9yZW1vdmUrMHgxNDAvMHgxN2MN
Cj4gICBkd2MzX3Fjb21fcmVtb3ZlKzB4MzgvMHgxMjANCj4gICBwbGF0Zm9ybV9zaHV0ZG93bisw
eDI0LzB4MzQNCj4gICBkZXZpY2Vfc2h1dGRvd24rMHgxNTgvMHgyNjANCj4gICBrZXJuZWxfcmVz
dGFydCsweDQ0LzB4YTQNCj4gICBfX2RvX3N5c19yZWJvb3QrMHgxMTgvMHgyNGMNCj4gICAuLi4N
Cj4gDQo+IEZpeCB0aGlzIGJ5IGluaXRpYWxpemluZyBkd2MtPmNvbm5lY3RfbXV0ZXggdG9nZXRo
ZXIgd2l0aCBkd2MtPm11dGV4IGluDQo+IGR3YzNfY29yZV9wcm9iZSgpLg0KPiANCj4gRml4ZXM6
IDFmZjc3Y2JlZmU1YSAoInVzYjogZHdjMzogZ2FkZ2V0OiBmaXggSVJRIHN0b3JtIG9uIGludmFs
aWQgZXZlbnQgYnVmZmVyIGNvdW50IikNCj4gQXNzaXN0ZWQtYnk6IENsYXVkZSBPcHVzIDUuNSA8
bm9yZXBseUBhbnRocm9waWMuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBTenlwcm93c2tp
IDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9j
b3JlLmMgICB8IDEgKw0KPiAgZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyB8IDIgLS0NCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUu
Yw0KPiBpbmRleCBmZDVjMmNkMzZjNTkuLmY5NzdiYzNlZWI3OSAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy91c2IvZHdjMy9jb3JlLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4g
QEAgLTIzNzMsNiArMjM3Myw3IEBAIGludCBkd2MzX2NvcmVfcHJvYmUoY29uc3Qgc3RydWN0IGR3
YzNfcHJvYmVfZGF0YSAqZGF0YSkNCj4gIAl9DQo+ICANCj4gIAltdXRleF9pbml0KCZkd2MtPm11
dGV4KTsNCj4gKwltdXRleF9pbml0KCZkd2MtPmNvbm5lY3RfbXV0ZXgpOw0KPiAgDQo+ICAJcG1f
cnVudGltZV9nZXRfbm9yZXN1bWUoZGV2KTsNCj4gIAlwbV9ydW50aW1lX3NldF9hY3RpdmUoZGV2
KTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3Vz
Yi9kd2MzL2dhZGdldC5jDQo+IGluZGV4IGVlODM3MjM1NjMwYS4uOGZkMWZkOWIwZGIzIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNi
L2R3YzMvZ2FkZ2V0LmMNCj4gQEAgLTQ4NzksNyArNDg3OSw2IEBAIGludCBkd2MzX2dhZGdldF9p
bml0KHN0cnVjdCBkd2MzICpkd2MpDQo+ICANCj4gIAlpbml0X2NvbXBsZXRpb24oJmR3Yy0+ZXAw
X2luX3NldHVwKTsNCj4gIAlJTklUX1dPUksoJmR3Yy0+ZXJyX3JlY292ZXJ5X3dvcmssIGR3YzNf
ZXJyX3JlY292ZXJ5X3dvcmspOw0KPiAtCW11dGV4X2luaXQoJmR3Yy0+Y29ubmVjdF9tdXRleCk7
DQo+ICAJZHdjLT5nYWRnZXQgPSBremFsbG9jX29iaihzdHJ1Y3QgdXNiX2dhZGdldCk7DQo+ICAJ
aWYgKCFkd2MtPmdhZGdldCkgew0KPiAgCQlyZXQgPSAtRU5PTUVNOw0KPiBAQCAtNDk3Nyw3ICs0
OTc2LDYgQEAgdm9pZCBkd2MzX2dhZGdldF9leGl0KHN0cnVjdCBkd2MzICpkd2MpDQo+ICAJCXJl
dHVybjsNCj4gIA0KPiAgCWNhbmNlbF93b3JrX3N5bmMoJmR3Yy0+ZXJyX3JlY292ZXJ5X3dvcmsp
Ow0KPiAtCW11dGV4X2Rlc3Ryb3koJmR3Yy0+Y29ubmVjdF9tdXRleCk7DQo+ICAJZHdjM19lbmFi
bGVfc3VzcGh5KGR3YywgdHJ1ZSk7DQo+ICAJdXNiX2RlbF9nYWRnZXQoZHdjLT5nYWRnZXQpOw0K
PiAgCWR3YzNfZ2FkZ2V0X2ZyZWVfZW5kcG9pbnRzKGR3Yyk7DQo+IC0tIA0KPiAyLjQzLjANCj4g
DQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoN
ClRoYW5rcyBmb3IgdGhlIGNhdGNoLg0KDQpCUiwNClRoaW5o
