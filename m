Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051BF23392B;
	Sat,  5 Sep 2026 00:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788568050; cv=fail; b=lYIifsvImNYpZs7RZI3F7/8pfyiXxttIn4Thkbf3X7LJefAE3z/PT4IKqW/wgofOxAtOsufX6b6ZgEPOyXBNf+tG7Z3zpruYXvEMyOqdoGqNM/6MrvWcPppQ3SalgAdpCTnx/SZ8eKC/SPiaV5+DYT7uDU3/UX0SeyXe6QnXFMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788568050; c=relaxed/simple;
	bh=mUKfk/UpnwDtK0Z9Wzr8yD0B7pOmgReUnTiMnxXCjAQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Lm5GYUmMsCu9GcRDNlfBW8rLcmI4eNN4H0yDTxuOUz0ToDzoLpZnl5HSYIWuaYTzwKsQivsH4HQE3UtfhIuSwKRLCrWH9fSEyVfyOcrDQ2gfPc0M6JTuoOQcidci8Y2anMsxBnkxmo9RnfBNxFxlWYm/5FMAldc2MXdDvyY1iqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=aBxWyoYB; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=CI12EFfa; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hb8DYfbd reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aBxWyoYB";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CI12EFfa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hb8DYfbd"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684Kd09p3795082;
	Fri, 4 Sep 2026 17:27:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=mUKfk/UpnwDtK0Z9Wzr8yD0B7pOmgReUnTiMnxXCjAQ=; b=
	aBxWyoYB2yeBek56QWcm/PnpQjXwZKYFCtLPF0EPideN5dymRvFVwywYs3Df2wcw
	CmdftKHUL1wvJrjhfD2ZmDlN+aDVEkwm8i+rdFBg5m+pPS4hdw14dRyONLaoFmFK
	1ibWYP4pSqhLA4C6a8k7IUqTvr3E8EVDoOa615mmpg5H6GWKxMEzGutFmAbzBnWN
	ydvlsF4cz5eXWR5Z4ZjoM8XoK0Q6eA2WUUmo8cHzzZIK10YpUO/wbaLxbdbnXqjH
	dm9PNPDqpLugsiEvNcTfi9IZ5FTogb8l8krbggocZWPqQzU+F0SbvdeXR+DhZe5f
	znspewypMtFyMAKLJ6/iew==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4gg076ca9t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 17:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1788568040; bh=mUKfk/UpnwDtK0Z9Wzr8yD0B7pOmgReUnTiMnxXCjAQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=CI12EFfaDcGvX4j7R0wSrXyXVL81vACprJq/qtwWwOQ5ekO3BQsF0lXA65LDDkJ4C
	 ubfy95bmoV55k8fBYyqpdcZ1u+ONYM5XaBVFcPmwgD7iAy80xPIEgxFTMCgl7hXZGS
	 PXe52x1dFty/olTxMyGQ/sqHWZQZwlfkDSCLhdoS5pCfjXcgTeYRVguAVkIRoguMZh
	 Q8MtO8O7IVOCEhaJ5izd0CMOlKxppw02nA6kvxKJxYVoRfyRUTaeURtZH9DSDRFcw2
	 quefksEYBQOZW/rO3ONfV5In4jx2gRJJKZqM/r8AcOw2+Z5aMFeUdWoz8Wd/L2FnE/
	 O0PZPwFIvRp4Q==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9AD3A4014A;
	Sat,  5 Sep 2026 00:27:20 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 33203A0341;
	Sat,  5 Sep 2026 00:27:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=hb8DYfbd;
	dkim-atps=neutral
Received: from SN1PR07CU001.outbound.protection.outlook.com (mail-sn1pr07cu00107.outbound.protection.outlook.com [40.93.14.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 821FD220174;
	Sat,  5 Sep 2026 00:27:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQgyk5iHlT0BRMc6pc0Agwow3JiZLNe/t1VU28LGgeNOK/GVFU2KU+s8DEFV8HEkuWhCcCZRwmpprxGaG6zARsqFyX7yxSxoEJ8jfA9DJaIHbxvllP80g0eIG0tCUbI/x6uj+yvKmuvBuc5Nro05hlHdJ11s97kbIbpW5DWmxIL6JuyusKnwV+Vx+hgxCBQkZ1t8k98zFz0mqCPuuKBdYp16rAMB/CKBfj7IRfVVIMLYUDq7CBvIYFfyy0FVFaYHcJktnznNk1W/B+41X1Z6KWikUlsXsBt1AgA2deSEDfjDleNtUNJW7l78eN5vkbgMqlyZBw1LJYfrl4VXz25mRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUKfk/UpnwDtK0Z9Wzr8yD0B7pOmgReUnTiMnxXCjAQ=;
 b=ju4/byXVHr1Xo9RSbQejeMdxRAW23f9Maw3ION/w1uqI+1EwoflC6eTyhCjFJ6vF8yXQN8WPj6VnGg4xGbC1G1WW3rywq13uWVgjzYDCpxe91ttWMvQUL52+2l3UdZmvJCyHFqXAdIG9FnLwX77pcTQ7Q3vaY36Tvvfa099dPAJkxp8ku0YYVig8PiMcIRwcfMzLbFc9iVhBBAOa8sqdWhELU3vr8S7PApHs7rabaD61h4pNxixI2qNQ09+AKuLfUBEczQt0N/lAS84OWA1rxWQYC/pa2ZvM6SLH/ECmNPzGlkbUzWxLJePpJr8BhFee4IUsC5/mv81hML8T5ZLTFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUKfk/UpnwDtK0Z9Wzr8yD0B7pOmgReUnTiMnxXCjAQ=;
 b=hb8DYfbdcfSIfFepoAVrQlk8kMjGbY2LFYgz2IwnJvkXfuzufTl2LPSb2DlAFk8YWCVAHpaJHOK8ILt43iM+HUKwX8j6K19F39uBiSDERTkTcdxShqh/TRpxzTcn32p/JZgQE/tQDd/eEZbEZfwqFk1EUPpRdPahrt8idtrgwPI=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by CHBPR12MB515368.namprd12.prod.outlook.com (2603:10b6:610:33d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Sat, 5 Sep
 2026 00:27:16 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.008; Sat, 5 Sep 2026
 00:27:16 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Konrad Dybcio <konradybcio@kernel.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sven Peter <sven@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/4] usb: xhci: Honor PORTSC.TM if valid
Thread-Topic: [PATCH v3 2/4] usb: xhci: Honor PORTSC.TM if valid
Thread-Index: AQHdOfmC3r0xApnj+EaJyvderbKjRra/JqgA
Date: Sat, 5 Sep 2026 00:27:16 +0000
Message-ID: <apth13yvKq4SdJm1@vbox>
References:
 <20260901-topic-dwc3_tunneling_state-v3-0-22fdced8de55@oss.qualcomm.com>
 <20260901-topic-dwc3_tunneling_state-v3-2-22fdced8de55@oss.qualcomm.com>
In-Reply-To:
 <20260901-topic-dwc3_tunneling_state-v3-2-22fdced8de55@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|CHBPR12MB515368:EE_
x-ms-office365-filtering-correlation-id: 940004a3-ee2e-4034-ae90-08df0ae47077
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|23010399003|366016|56012099006|10067099003|4143699003|11063799006|3023799007|18002099003|22082099003|38070700021|6133799003;
x-microsoft-antispam-message-info:
 4BAzTSjDcrDPW4t9DT1DhkyRJyn52KUWAXhqcEJm+An/BmkxbbrQ+FTPhl9Q1x01Acu+CgVS76YREYKGc6bCnzOWIg8dMwsYtuNtPReWl3pNjlUji7hx4NE8iOJDjnEGrWOQUfKZchssww8eV4jZPN4AeKAIKKZnL8Oxk46BHOBI+7AKYpkpJRoQG7uvqqadV9vY/OGpw9Q88+MpTiCCtiuzujz0gLoZ5oYG8i79mGuBYqwYHJEkC8qLMJOJZl0LZXTk4J6ZBRAdCYyUrOh+3ltsffZnTTTfs0a2CVXjRm+pF8BEug6ZzfMaQKwHI71XWsKO2yLXL/M2cp86r29xTDeAuRko+wQrcnEJekSzqTa52LJlqyjFOjtJRAAHQ7xx5q+FQumKBQPAe0fEnESFm5LAaUyzSFsEwg9+j67xverz15xYc/pnT74WK3icD6B1CqybF7NbGM5TQn9em3P2FpNkV/v/gZ7YwLTtLn0tYyb6OgevvR0iVknBr2lYhaFr8vFNoI8u9ZP8FzWV+DTfNKmF9ex8sALuBkP9qm4Xn80uwlFwC/C0joNWCY3GpYkP8isut1qaJC+o74vmodb3xIjO7y2q3a0eHLRuvwKsMKSFoaw4Lu/DYjoZXiFBNRbgwikIguJl1vyWBnCVFs8MFOV3sbwuvt8TvlaAdwsl6u6jDEmkXl+Wp2sIluvlTZPQ7p9GPt3b0yufzKzmvEyJX7nm35xZVikxgJ1lL8hGvA8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(4143699003)(11063799006)(3023799007)(18002099003)(22082099003)(38070700021)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZHhhMkF3clAzT2pWbkdBSmdybWJROWYzaGt4dUU4MWl1bnVnV1Z4bUJLZ2tT?=
 =?utf-8?B?RGMzSWtiRUYvbXdPem9jVW5qTXkwZzg4b1V2YWV5dmFDUVBTaEJ5eUNKK1E3?=
 =?utf-8?B?aTUvYlRPb3JNNE10TVFXazVDNWtNSTlLZklrTElLVDd3eVFSd0k3OWlzamV2?=
 =?utf-8?B?Y1F5T2pzaDVYS2RoZkxFaUlIeDQxQXlyOUFaVWh2bzZrb0NrRGpKQ05NRFlu?=
 =?utf-8?B?MW1HOHZRKzlwb0g2RFNFcVlSd0JSYndiSi90NmRNN1dBcTBWRXp2VjR2cnhB?=
 =?utf-8?B?L05KZ2Y0TDF0MGs4VWxSazlxb2JpY1R2ZWJGVFVkYzFKT1R6VnFhRGZvaFhG?=
 =?utf-8?B?eUlKN3R5eko0SnVRRDZiSXdiQzdoeGQ4eUpIT0VtTGdNb3kwY21yTXBVcDdO?=
 =?utf-8?B?OGR2S3J6a1NVQkZRcm5nc0k2NjB1N1pTME05Uy9IZzlaMHlWSFBDNG9VOFRX?=
 =?utf-8?B?SitvUUVDUCtRODdjbmdwak94Njg4ZjVxSXQyMlExWTR3cVB6M3FtK21FTjFB?=
 =?utf-8?B?Mk9JMno1K1ZCblFyZE1lZU43VmVtZXpFbFFkc2Y5QTFlQWtOcGFQdFdFd0U3?=
 =?utf-8?B?SkJmK01JbXRkTVhLVG5USEV2eG1aZkM5SDZYMWhGOEVjdjhoVDR4M0Q3Q2xL?=
 =?utf-8?B?MzVOSkRxcmtWejAvMm9CMTRjZFJ4QW81WmlqS2NuY2lrNW5ncXE3UXcrNloz?=
 =?utf-8?B?MXdmcHN5NUNjenN4c081c1djUER5d3RTeEJHY2Z2a1JXU1BYa05lN0pqekNa?=
 =?utf-8?B?K05JdWZYSUxaWjRwdU9oeFlwanJyNzY3OTJQUlV5ZEd6N3hGSXBnSDNsc0xz?=
 =?utf-8?B?WGdvMVBQejdXcm9zQ0liTjdtdVFRcUFRR3owM2FzMStZcHpRTUpZbUxWN2ty?=
 =?utf-8?B?eWFLd3dUeTBTOXRnRndKbDM4OXVOMTZJM1lKN3hhSk5YSlpCTUZFYTFNdzFl?=
 =?utf-8?B?UkhnbkU0blBJUCtxdzFWUGJMTEVXbnVYV1FNakttM2ExTXYzSndxWkQvQk4v?=
 =?utf-8?B?dFY0VnVHVmR5ZC9xVHBHMkRWVUdwMkExdWU0Vzkxc2puVEF0dERDVEs3dzB3?=
 =?utf-8?B?RG9tUllhNG5OQXYyenhYckQ5cld6cFNhSlF1VHdtc0FFdVRjLzFqd2IxcjdW?=
 =?utf-8?B?dThHL1kwRmVyRk90blB0MHFYd1lhWGM3a3lqQkVSRG5vcmp5WDZjUUhRbEw2?=
 =?utf-8?B?OWh2RlMxQk14YmZPcWVpNDhHdUdLbkUyYlpGL3plRElBdGJUNjBXcHlOMDRM?=
 =?utf-8?B?cERRSmJybzVkaHJ3S3JYV1h2eGZHSHY3Q0hLOG1kK3hza1F6dmtjOHpzM1lj?=
 =?utf-8?B?SDM2KzRJa1lxL0F6ZnpXUU5yc2xubXVqRjcxZC9VcTczcWV0bm5FSG5yN2ps?=
 =?utf-8?B?QlYrbEV6VjBqQjZFWEVYMnc4Qkd1eW4zQTV2ZXFyNXl6R3ZLK1NHYUhnU1B4?=
 =?utf-8?B?dzM1NGpPNm82MmgyMnpkZFNULzlvV0srdmNvT2ZQNzV3MElWeFBNUWtOc2NY?=
 =?utf-8?B?bnVHazAxMzVVb0xxVVBGUFhZVGlidmFuckc1a3dXeW5ObklzUjNUS2tId0Mr?=
 =?utf-8?B?MkpmWEp5bGZDY2Q0K1dwZys0bHhSbWFWdUYzbWwyL3Vnd2xPQkZzZGhtZGpw?=
 =?utf-8?B?OWd0VG0vaFpzN0ZGSW9sUWYycy81UkM0dHI3S2pZdytWRHRrbWhudEVud3dz?=
 =?utf-8?B?SFV2bFROdC9kbktRa2ppeHFrQTBTdlQ1aURCZlY5a2dsN2U5dDMrakF3Z0lT?=
 =?utf-8?B?TmJmalFTRlkxbDZSR3pmYk9OemF5cncvZmRlcG5LMUtWL3VyWENzWTN4ZEFa?=
 =?utf-8?B?Q0RkYjJ5eGdTREF2V1hieC9aajREUm1uMVQ5MDViV0JZbTJtZHFrMEJOZkdn?=
 =?utf-8?B?bCtKbUd3VzJEVnpJWmlsMXFRYURFMWwvR2FuSjd5c1k4UFJseWs2T1BBb1B6?=
 =?utf-8?B?L0psSUM4UysydmQ2bnc4aW5meXlvSXJjd1REajJzeFFXR1Rjbit6VmFOdjFB?=
 =?utf-8?B?aDJhbDVqc0J1Zlljd0cxbkVGVEU4R2Y1UUV6UngwNVRIbHJ0b2F6TGJHSEhL?=
 =?utf-8?B?ZFNXblF1THhPSVhMVm01cmJ6RGo5VXNSRGk1WHdTZXFIUk1xcGxxSjM0RjIx?=
 =?utf-8?B?N2Z4Z21LeGV3VzB2cUNwenU5SlRaM1ZVUnFxL3k5SEVJODFXak5KMm9Ud1Iy?=
 =?utf-8?B?OEtadm1BVXh6c1VhVjhCWjB2TVlUNlBBUStORDdJenNUaU10eHgvU3pTMlFH?=
 =?utf-8?B?MTdKZGMwdVBJN0U4RFhJUXNzMXlUWlIzODBpYmYzK1ZsVmMvS1BvaTdwaGVh?=
 =?utf-8?B?b2kram1iUVN0bi9GRFg4TzIwaUdNS0dwQ3d0MFNXdStKQURNdHdqZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A211383720962B4B87ED66593FEA1C7A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	dccs/scAChXZTwj6NJaNY3p63qhQ3ty/2fztzNwLnstckDRuVW2A2pjTIMldAj4TENZlXsr55PFn5/n+oMz+HU9Fc/0p4b7rhqqQG29Dd8fdosvulPrIi5YmdMnHURj4Pf3o0TGe/CA4G5kaTs9JT+wAM6M2HZhYLLenlCvxEgU0ckpJFc6v4EAKRi7ZJZsY9Da3DIpua/d8Wh45JP7Qc33sk57tZFCgIAhXRogduGZQXHM3EP+rJPjfV0T9zWLtD/FICsj5fHHRJSfVNMVzEFfWNBwPv1fZbVvzSDkOokC2sRRmFKZ/7/UJCTSyfL0tyvXEuZ6Y36GdJZQ1leCe+w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AlQcoZQ9VlULr0j+wR5BOkbgBcucfFuFtQ8zd3lNG6DNtbnYWBx9RKZOb5/x8qWDIWJZMAzyuBOBrfHjmBlvGTUMWd0RkRksH5wQPzgxq5gx0mMBMK7CpwcjsgI3qL/rVyU++3RitqGHhEqKqD62EIwWvQI/mhvD4fI7LC2CSR21i58Ak/qhXEArD6g2JiG+wAyWkskm1WdTJi1Ox2J7yeg2fc3A9GKtMkB/+KwzAl3uQEXTf23WH6uWqafsqfyQlN1XochSLCTkcCQrgQcpy3TFzQgGCf3q6w7SvlQHrKkXZET7FMfOCYe3SG0HHK/sJdg8J7xtdzSR+E4mfp/+f+8BR8eZOJ6fn4jOyRYxygnU3+1iLiV0o2IdEb5mgepl19Gqd6S95KYZ6ZNIyNsRcrDfipAtkQ2V5Ga5k3fX6Qmj/+as+2azwvdx5wXr6Z4c4bkaBdbmaLcEaopofXXBoCmox3uPL0jIqOFUDzTuEYDPlPML5Uf79f7qH2MoJqx+CbMJeAZHWgNvMZv9to1roxoczyjt7xJK3La2tUHo0dr2ot03L74TN1FC61ykSbm3qZXXgIpBtZ24c+HLwDAMsEcGsUaDIe+nCnXARv0BUhCNMMhRxyHetaE7rWWw1Qmf2KRoHpr0pOjQX0LA+xFW/A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 940004a3-ee2e-4034-ae90-08df0ae47077
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2026 00:27:16.5224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V324A2llnqwLVJ+kmYX1g5RZyqz6Hh1RZv5nSv7WUef6NxaRe78pr+aZz6HnkC1wf42Z+ffAi1SqPOQs5JQLAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR12MB515368
X-Authority-Analysis: v=2.4 cv=P+cKQCAu c=1 sm=1 tr=0 ts=6a9b61e9 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=uYqxnSNa5YsZObVXFEQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAwMiBTYWx0ZWRfX0JBTJHFHk55z
 X0BSirToxwRB09Hv0psXCwgdTvsYTJ60gjGwRe7/k5yjyHcvttt+8TPBIx4XT6o3999PWfQIxQZ
 DlXi320kSMcuC4ahBEyCL4V+04R7Ds2J1WCciNkwL3OCqbCLFYViybTfs2C1L1DLOoGIC+9Kd/y
 +lpMReya19tDAZFnOiRdPtkygAxKNGs5j/t9TtbH2wpP5kZgpSivsMueYDdG/Ktw5jCoQvNRNk1
 NIRM0E0zSz1eI/Pb9HuH1O0dH5IGdInE59SL5L7Wcz/ODybxZmlnKGDT+K+Cp/AjLrzwOmB4kqO
 9OCZRXRNtQimrwDmg1OBrHIjivxvd5ES2rIlaN6P/p9V6QFLCwBT5BdbB2gYK3SvHfOTLts5Cc+
 9GQBbOV9oJzCC/waKJ6FtXAA/LKUR9Zjx43/XvxNnhIu+xSs5w4LMSKA47x7cN/LZAKpYTttvuY
 /WxagJlbn4UcIjlQCag==
X-Proofpoint-GUID: S7jF4C_CpkBeB7Oa4zOwkjCkXExNfj5w
X-Proofpoint-ORIG-GUID: S7jF4C_CpkBeB7Oa4zOwkjCkXExNfj5w
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAwMiBTYWx0ZWRfX2ksmAq68sVu+
 W8WC4wPRMsWyucJO+FbalFgO/7uYT6ea0It1KcTGf8C+Ix/J/cl8/2zPQP+Kd4SHA0MlGbOGnnF
 ivDGBoBpwPL+15DKHOFfCte26iClMHI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1011 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609050002

T24gVHVlLCBTZXAgMDEsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+IEZyb206IEtvbnJh
ZCBEeWJjaW8gPGtvbnJhZC5keWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4NCj4gDQo+IEN1cnJlbnRs
eSwgdGhlIG9ubHkgd2F5IGZvciB0aGUgVVNCIGNvcmUgdG8gZGV0ZXJtaW5lIHdoZXRoZXIgdGhl
IGxpbmsNCj4gaXMgbmF0aXZlIG9yIHR1bm5lbGVkIGlzIHZpYSBhbiBJbnRlbCB2ZW5kb3Itc3Bl
Y2lmaWMgRXh0ZW5kZWQNCj4gQ2FwYWJpbGl0eS4NCj4gDQo+IFRoZSBYSENJIHNwZWNpZmljYXRp
b24gdjEuMiBhbmQgbmV3ZXIgZXhwb3NlIGEgY29tbW9uIGV4dF9jYXAsDQo+IGluZGljYXRpbmcg
d2hldGhlciBCSVQoMikgb2YgUE9SVFNDIGNhbiBiZSBpbnRlcnByZXRlZCBhcyB0aGUgdHVubmVs
aW5nDQo+IHN0YXR1cy4NCj4gDQo+IE1ha2UgdXNlIG9mIHRoYXQgYW5kIGZhbGwgYmFjayB0byB0
aGUgZXhpc3RpbmcgSW50ZWwtc3BlY2lmaWMgcGF0aCBpZg0KPiB0aGUgZXh0X2NhcCBpcyBhYnNl
bnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHliY2lvQG9z
cy5xdWFsY29tbS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvaG9zdC94aGNpLWV4dC1jYXBz
LmggfCAgMyArKysNCj4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1odWIuYyAgICAgIHwgMTEgKysr
KysrKysrKy0NCj4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1wb3J0LmggICAgIHwgIDMgKystDQo+
ICBkcml2ZXJzL3VzYi9ob3N0L3hoY2kuYyAgICAgICAgICB8ICA4ICsrKysrKysrDQo+ICBkcml2
ZXJzL3VzYi9ob3N0L3hoY2kuaCAgICAgICAgICB8ICAxICsNCj4gIDUgZmlsZXMgY2hhbmdlZCwg
MjQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9ob3N0L3hoY2ktZXh0LWNhcHMuaCBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1leHQt
Y2Fwcy5oDQo+IGluZGV4IDIyZTUzYTc1MGUyYS4uYWY3ZDYyNGNkMzhlIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktZXh0LWNhcHMuaA0KPiArKysgYi9kcml2ZXJzL3VzYi9o
b3N0L3hoY2ktZXh0LWNhcHMuaA0KPiBAQCAtNjYsNiArNjYsOSBAQA0KPiAgI2RlZmluZSBYSENJ
X0hMQyAgICAgICAgICAgICAgICgxIDw8IDE5KQ0KPiAgI2RlZmluZSBYSENJX0JMQyAgICAgICAg
ICAgICAgICgxIDw8IDIwKQ0KPiAgDQo+ICsvKiBVU0IzIHR1bm5lbGluZyBzdXBwb3J0IGNhcGFi
aWxpdHkgLSBzZWN0aW9uIDcuMTEgKi8NCj4gKyNkZWZpbmUgWEhDSV9VU0IzX1RVTk5FTElOR19T
VVBQT1JURUQJQklUKDE2KQ0KPiArDQo+ICAvKiBJbnRlbCBTUFIgc2hhZG93IGNhcGFiaWxpdHkg
Ki8NCj4gICNkZWZpbmUgWEhDSV9JTlRFTF9TUFJfRVNTX1BPUlRfT0ZGU0VUICAweDhhYzQJLyog
U3VwZXJTcGVlZCBwb3J0IGNvbnRyb2wgKi8NCj4gICNkZWZpbmUgWEhDSV9JTlRFTF9TUFJfVFVO
RU4JQklUKDQpCQkvKiBUdW5uZWwgbW9kZSBlbmFibGVkICovDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9ob3N0L3hoY2ktaHViLmMgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktaHViLmMNCj4g
aW5kZXggNDcwYmFmZTE4MDJiLi44MGYwN2JkNTA4MWQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
dXNiL2hvc3QveGhjaS1odWIuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktaHViLmMN
Cj4gQEAgLTc2OSw4ICs3NjksMTcgQEAgZW51bSB1c2JfbGlua190dW5uZWxfbW9kZSB4aGNpX3Bv
cnRfaXNfdHVubmVsZWQoc3RydWN0IHhoY2lfaGNkICp4aGNpLA0KPiAgCXN0cnVjdCB1c2JfaGNk
ICpoY2Q7DQo+ICAJdm9pZCBfX2lvbWVtICpiYXNlOw0KPiAgCXUzMiBvZmZzZXQ7DQo+ICsJdTMy
IHZhbDsNCj4gIA0KPiAtCS8qIERvbid0IHRyeSBhbmQgcHJvYmUgdGhpcyBjYXBhYmlsaXR5IGZv
ciBub24tSW50ZWwgaG9zdHMgKi8NCj4gKwlpZiAoeGhjaS0+cG9ydHNjX3R1bm5lbF9yZXBvcnRp
bmcpIHsNCj4gKwkJdmFsID0geGhjaV9wb3J0c2NfcmVhZGwocG9ydCk7DQo+ICsJCWlmICh2YWwg
JiBQT1JUX1RNKQ0KPiArCQkJcmV0dXJuIFVTQl9MSU5LX1RVTk5FTEVEOw0KPiArDQo+ICsJCXJl
dHVybiBVU0JfTElOS19OQVRJVkU7DQo+ICsJfQ0KPiArDQo+ICsJLyogRmFsbCBiYWNrIHRvIHRo
ZSBsZWdhY3kgSW50ZWwtc3BlY2lmaWMgZXh0X2NhcCAqLw0KPiAgCWhjZCA9IHhoY2lfdG9faGNk
KHhoY2kpOw0KPiAgCWlmICghZGV2X2lzX3BjaShoY2QtPnNlbGYuY29udHJvbGxlcikgfHwNCj4g
IAkgICAgdG9fcGNpX2RldihoY2QtPnNlbGYuY29udHJvbGxlciktPnZlbmRvciAhPSBQQ0lfVkVO
RE9SX0lEX0lOVEVMKQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLXBvcnQu
aCBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wb3J0LmgNCj4gaW5kZXggODg5YjVmYjBmY2Q4Li4y
MTVjOWNhZGJjMzQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wb3J0LmgN
Cj4gKysrIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLXBvcnQuaA0KPiBAQCAtNSw3ICs1LDggQEAN
Cj4gICNkZWZpbmUgUE9SVF9DT05ORUNUCSgxIDw8IDApDQo+ICAvKiB0cnVlOiBwb3J0IGVuYWJs
ZWQgKi8NCj4gICNkZWZpbmUgUE9SVF9QRQkJKDEgPDwgMSkNCj4gLS8qIGJpdCAyIHJlc2VydmVk
IGFuZCB6ZXJvZWQgKi8NCj4gKy8qIHRydWU6IHBvcnQgaXMgdHVubmVsaW5nIHRyYWZmaWMgb3Zl
ciBVU0I0ICovDQo+ICsjZGVmaW5lIFBPUlRfVE0JCSgxIDw8IDIpDQo+ICAvKiB0cnVlOiBwb3J0
IGhhcyBhbiBvdmVyLWN1cnJlbnQgY29uZGl0aW9uICovDQo+ICAjZGVmaW5lIFBPUlRfT0MJCSgx
IDw8IDMpDQo+ICAvKiB0cnVlOiBwb3J0IHJlc2V0IHNpZ25hbGluZyBhc3NlcnRlZCAqLw0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLmMgYi9kcml2ZXJzL3VzYi9ob3N0L3ho
Y2kuYw0KPiBpbmRleCBhOWU0N2UxNzhjMjguLjVmYjc4NjEzYTk5MyAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy91c2IvaG9zdC94aGNpLmMNCj4gKysrIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLmMN
Cj4gQEAgLTU0MzMsOSArNTQzMywxMSBAQCBpbnQgeGhjaV9nZW5fc2V0dXAoc3RydWN0IHVzYl9o
Y2QgKmhjZCwgeGhjaV9nZXRfcXVpcmtzX3QgZ2V0X3F1aXJrcykNCj4gIAkgKiBxdWlya3MNCj4g
IAkgKi8NCj4gIAlzdHJ1Y3QgZGV2aWNlCQkqZGV2ID0gaGNkLT5zZWxmLnN5c2RldjsNCj4gKwl2
b2lkIF9faW9tZW0JCSpiYXNlOw0KPiAgCWludAkJCXJldHZhbDsNCj4gIAl1MzIJCQloY3NfcGFy
YW1zMTsNCj4gIAl1MzIJCQloY19jYXBiYXNlOw0KPiArCXUzMgkJCXR1bm5lbF9jYXA7DQo+ICAN
Cj4gIAkvKiBBY2NlcHQgYXJiaXRyYXJpbHkgbG9uZyBzY2F0dGVyLWdhdGhlciBsaXN0cyAqLw0K
PiAgCWhjZC0+c2VsZi5zZ190YWJsZXNpemUgPSB+MDsNCj4gQEAgLTU0NTYsNiArNTQ1OCw3IEBA
IGludCB4aGNpX2dlbl9zZXR1cChzdHJ1Y3QgdXNiX2hjZCAqaGNkLCB4aGNpX2dldF9xdWlya3Nf
dCBnZXRfcXVpcmtzKQ0KPiAgCW11dGV4X2luaXQoJnhoY2ktPm11dGV4KTsNCj4gIAl4aGNpLT5t
YWluX2hjZCA9IGhjZDsNCj4gIAl4aGNpLT5jYXBfcmVncyA9IGhjZC0+cmVnczsNCj4gKwliYXNl
ID0gJnhoY2ktPmNhcF9yZWdzLT5oY19jYXBiYXNlOw0KPiAgCWhjX2NhcGJhc2UgPSByZWFkbCgm
eGhjaS0+Y2FwX3JlZ3MtPmhjX2NhcGJhc2UpOw0KPiAgCWlmIChoY19jYXBiYXNlID09IFUzMl9N
QVgpIHsNCj4gIAkJeGhjaV93YXJuKHhoY2ksICJIb3N0IGNvbnRyb2xsZXIgbm90IGFjY2Vzc2li
bGUsIHJlbW92ZWQ/XG4iKTsNCj4gQEAgLTU0NzMsNiArNTQ3NiwxMSBAQCBpbnQgeGhjaV9nZW5f
c2V0dXAoc3RydWN0IHVzYl9oY2QgKmhjZCwgeGhjaV9nZXRfcXVpcmtzX3QgZ2V0X3F1aXJrcykN
Cj4gIAl4aGNpLT5oY2NfcGFyYW1zID0gcmVhZGwoJnhoY2ktPmNhcF9yZWdzLT5oY2NfcGFyYW1z
KTsNCj4gIAlpZiAoeGhjaS0+aGNpX3ZlcnNpb24gPiAweDEwMCkNCj4gIAkJeGhjaS0+aGNjX3Bh
cmFtczIgPSByZWFkbCgmeGhjaS0+Y2FwX3JlZ3MtPmhjY19wYXJhbXMyKTsNCj4gKwl0dW5uZWxf
Y2FwID0geGhjaV9maW5kX25leHRfZXh0X2NhcChiYXNlLCAwLCBYSENJX0VYVF9DQVBTX1VTQjNf
VFVOTkVMSU5HKTsNCj4gKwlpZiAodHVubmVsX2NhcCkgew0KPiArCQl4aGNpLT5wb3J0c2NfdHVu
bmVsX3JlcG9ydGluZyA9DQo+ICsJCQkhIShyZWFkbChiYXNlICsgdHVubmVsX2NhcCkgJiBYSENJ
X1VTQjNfVFVOTkVMSU5HX1NVUFBPUlRFRCk7DQo+ICsJfQ0KPiAgDQo+ICAJeGhjaS0+ZG1hX21h
c2tfYml0cyA9IDY0Ow0KPiAgCXhoY2ktPm1heF9zbG90cyA9IG1pbihGSUVMRF9HRVQoSENTX1NM
T1RTX01BU0ssIGhjc19wYXJhbXMxKSwgTUFYX0hDX1NMT1RTKTsNCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdXNiL2hvc3QveGhjaS5oIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLmgNCj4gaW5kZXgg
YzdiZmE3ZjAyOGQzLi40ODBmY2JhYzQ1MjUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2hv
c3QveGhjaS5oDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5oDQo+IEBAIC0xNjYyLDYg
KzE2NjIsNyBAQCBzdHJ1Y3QgeGhjaV9oY2Qgew0KPiAgCS8qIGNhY2hlZCBleHRlbmRlZCBwcm90
b2NvbCBwb3J0IGNhcGFiaWxpdGllcyAqLw0KPiAgCXN0cnVjdCB4aGNpX3BvcnRfY2FwCSpwb3J0
X2NhcHM7DQo+ICAJdW5zaWduZWQgaW50CQludW1fcG9ydF9jYXBzOw0KPiArCWJvb2wJCQlwb3J0
c2NfdHVubmVsX3JlcG9ydGluZzsNCj4gIAkvKiBDb21wbGlhbmNlIE1vZGUgUmVjb3ZlcnkgRGF0
YSAqLw0KPiAgCXN0cnVjdCB0aW1lcl9saXN0CWNvbXBfbW9kZV9yZWNvdmVyeV90aW1lcjsNCj4g
IAl1MzIJCQlwb3J0X3N0YXR1c191MDsNCj4gDQo+IC0tIA0KPiAyLjU1LjANCj4gDQoNClJldmll
d2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5r
cywNClRoaW5o
