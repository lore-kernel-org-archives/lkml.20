Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7D83AAF45;
	Thu, 24 Sep 2026 01:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790214528; cv=fail; b=KfESYC4rVK5z75OGBywfbSucsvvOE2pBJGwM7jD7O7KJu09mWP6PaFS6QAlZAjiIyrezFKafMP/a85su0GLuNzqnFWSmKo0jTTiLcfQe6/EI3u5Vi247szepVU+Jxf5MCVj3utwXiJBnxJOvvV+y5DFtnWv5w4TS+gJmg0lCx84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790214528; c=relaxed/simple;
	bh=BMUUHxwm66LLKFr1XFN8ojZixDHNBQ5rpGpL8yQND1M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q5sA9l8/sgiklCvCVSBkurikyTq8rJfriLHb40zpiOY33B046ebeRamUxDb+s0M3mUPaCKFHBxq+Pi5ONSQA+r8a6y5ZPgOO9s2EdXHNcoURbJuUK9vbzYJSzIjs4otYGWzY6nL41+uS+3Y7R2mYpq197cRXKz54r/rd9nXM+qY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=uLJD1w6s; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=SeLyJw1a; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=b9zhi7vA reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="uLJD1w6s";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SeLyJw1a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="b9zhi7vA"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NNG5sO1611910;
	Wed, 23 Sep 2026 18:48:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=BMUUHxwm66LLKFr1XFN8ojZixDHNBQ5rpGpL8yQND1M=; b=
	uLJD1w6sOqSAJS5SRJZaNQDVA8VpmeapAldugAY0/7lwaYsby+Hv8GvyaS1u3p5N
	mluOc7FNB/AbiAbdXU6KDf32F9H9hnpsR1J+A7y/k2LxWAfVejFxEP86FRd0n6Ts
	WE9iQoFsV7bcXpZelW8WPEeF2QWtHdvVmLyU0JFqlSZWgUMqHcyN06YV76yYZ7bt
	POdQhNjFL+ZVNrjL3IfsBZPN/udXoWGXc10+21g6p0QN+XVJ/r15Z0gibduEwK8K
	2PeqjgOLXiMUWVF8LI0mSQccxpfyEKfdZ8WYEp6IJYB2885iynPcGc0+T8AMgouE
	h5AQpsFZZqxfDI5kOnp+yA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4gvc3v6tr6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 18:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1790214479; bh=BMUUHxwm66LLKFr1XFN8ojZixDHNBQ5rpGpL8yQND1M=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=SeLyJw1a7+hGqJKmW0efG0yBkpg4RXfzIodDcWQRY+2zTna/BfxBACocHyLY/f/Uo
	 Uu6ZBbreO2PyHNJnnTB0GOPJ08MDsMUr7qK8g5LW9GWAMWrfXiSI8w1CDsqNWTJQVY
	 b1iX6DtCYD6x0AMpY9KU6tb3adLov9YtfR4GnhRJsID5GawiOxRa0FnyVdiFYw+QNQ
	 dWIYeJcmWmKvDCLeXdmXAx1khyur7hTO5Fad18fYRCNeAAdrGY/Eog3sRz559nfpQP
	 MoMl0BAAoUeKd0+6f4+9hur51BXTjfP1aeXrdML0B7X+W59fCW8PNpsq9GPuKy7+YT
	 7lun0kVxi28Ng==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 82689401B7;
	Thu, 24 Sep 2026 01:47:57 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id D0471A006F;
	Thu, 24 Sep 2026 01:47:56 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=b9zhi7vA;
	dkim-atps=neutral
Received: from DM5PR08CU004.outbound.protection.outlook.com (mail-dm5pr08cu00405.outbound.protection.outlook.com [40.93.13.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 61B98401D5;
	Thu, 24 Sep 2026 01:47:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BmIPv8S2nXGSVNL+jZTIe8vOxAOH46ljVCtecYOgsxz80yFyMrAii7t6o+l1FgM2CxWrWAetC+jq2NiPNC8CyxjknKEUy9P3z0zj/vxEsTYIN3+/ylJwqszoSmC5kWrjjrhxHna45tSLyRr8F3Bpe8xLux4WX314k5C6o/G8i1e08hrXgXFhteg4dVFpVPjRcwuqmAZBJxDKLltu+vSgfhHyD4NPXFeRMv952OBmsK6CYj0xxJr8jWCOs3cbxPm7KYjPi7vELti5MRSoKUMKf5wVA7PGTC7GKT5mb7njWzsnMlWB+4AbLGmYy/3ftLlCXz7csQ/ZRKwj1Wpaxf09Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMUUHxwm66LLKFr1XFN8ojZixDHNBQ5rpGpL8yQND1M=;
 b=rDHDJAEuPVeSU86htD1yy3yOLqc0EbpVvJJGhfdC2+mFjkwFHjk5OxKo7Z+JOx6hwXHf+KHg4fxGshy0ewjzj//cMX1vPtWcOrWWvODOX4lg597YrbjwCS4PDKd0bhOhnyewnyLlosoA+rHrUFpf9bWvrDL0f3QUOQ6tVQWf1O3kc2YKrKvyFiYPj2EscaRr3X/FSt6a2H1YDrTWLMMtZzYJZAakFjoldA5m0Dity81SHf9vP2P/g9TUHC3j/g+6QaDdhiR8eaY8RkQmQGJ4BckacCFxNvz1CiR2X2ZUONpHn8gflnWH4Z60j4/b47yxA0MIyFZzLqjNaJ+r54whAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMUUHxwm66LLKFr1XFN8ojZixDHNBQ5rpGpL8yQND1M=;
 b=b9zhi7vAJofyM+NIXgS9U3bKGbH4yWmeHfbRB9mmnHDZ6Xb5s14ogZUSwMXJHjm8NMCV/2enNTnNMdhBkAxvjY3SADabKYFumNvctHdbsz9bOnA11/0mgimu68jtSqRYclOn5y8XuKfGMGqRngIH56toYGVtjkc1uRCXbymxNpE=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DS7PR12MB6118.namprd12.prod.outlook.com (2603:10b6:8:9a::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.14; Thu, 24 Sep 2026 01:47:46 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 01:47:44 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Igor Paunovic <royalnet026@gmail.com>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH 5/5] usb: dwc3: rockchip: fix USB-C reconnect in gadget
 mode
Thread-Topic: [PATCH 5/5] usb: dwc3: rockchip: fix USB-C reconnect in gadget
 mode
Thread-Index: AQHdRSWFm3+6LaDRSECPc57ZPufd6bbbc7eAgAB1u4CAARmjAA==
Date: Thu, 24 Sep 2026 01:47:44 +0000
Message-ID: <arRNRKBBR_o2F5cv@vbox>
References:
 <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com>
 <20260915-b4-rockchip-dwc3-rockchip-glue-v1-5-763bb546824e@collabora.com>
 <arMyLlcFKgtlwW_T@vbox> <20260923085941.16418-1-royalnet026@gmail.com>
In-Reply-To: <20260923085941.16418-1-royalnet026@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DS7PR12MB6118:EE_
x-ms-office365-filtering-correlation-id: f17a0171-a583-4b67-d982-08df19ddd42f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|18002099003|22082099003|11063799006|10067099003|38070700021|56012099006|4143699003;
x-microsoft-antispam-message-info:
 R+n+JDd+0QOjcnds6aKbTWBrnURUG3UMGZzc61iCkQCq4gmeID/jBidf1mTYVqrjd4/r3QrrM+8I8IKEChGW3cwTp9s3SessDdm2CH+Ec9jhDY8LmfMDdwOiJGH86qwSEpDcfWAxDUlWuJZfQ5ZscW/Zbbpe++M+7x9r9rFVi7iGTLLmZCZS+ooa4wrANPBad8Zil+wrpPE5SOmxTkRExR+Kd4q/mj/uZ7NdvELaR3SK6gf80bMExku00KSKkbrLXRAKQrSlG22e+YSuChpNMdcsVaLVpVEr7kBwIRuf9WHsw7BpHd8vnKIDKcGBj6+ufaMIs0cVGMcf7aAAD+rMxMlsLXwOL4kFJvQy+7WKxE+oBnWud9KqtclMHM703UL8pjMfip6Q9GuqL4WgutLADaiDjFe/jTDqYZbG/iL1fUYtJCeqqnsAqXVvf2KgLQbkk/bg5XXsU14uOuJeeVaadINE4IhlvX7QzpgfwU/ueJF4V+Ivc0nzG0GzC1o36+iwHRzfmwGnRL+txBaHfFtZN/i7JMMcosAbt4lbBWZ9SOToqB6WDGymU+4//RufJIqQ3D4evol36X6E2NNAYQmTcXh34FZrveXa/TJIRCHw5SL6I1EuO9ssL3qO1drVewQNEIJV14USwZ9TR5+VKn/yV5IJWHFcjSxWus6FvPgcTYKVAKOoQSihc77CduHP9ggbFMkb9aOZPTHVPRp3qby6pXQ17WjOoQUchuSPKwG7Y7k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(22082099003)(11063799006)(10067099003)(38070700021)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y1NrbTg4LzRtdGRVenlmUlRaUUlkOURpaHIzZUlsTWd2QmFHQWVRV2RmZjln?=
 =?utf-8?B?d2l6NjR6c0daeTZaYy9oR3YzSzJMbTNUSTJpd01RaE9SUXpFK2hNZk1ZZTZj?=
 =?utf-8?B?VVlMZzRkdzhPMHFDV1c2QWVRcHJsdEkyMG1rQmlhZXkrdko1RGwxVEhVMlIw?=
 =?utf-8?B?TERqZ2k0NFFjeFZsZ3dFRytDWGYvbldyYk1ZV280a0JVVEpacTl3ZGYyajRi?=
 =?utf-8?B?RndCSEZPL0pPa3N1M04xUXdhVk9HVnZoUm1EKzJTZDJwenhLcm0zb2daT2dl?=
 =?utf-8?B?MnhaSjNzQ3dXZFZyRXBudTR3MDhtOStMT25LR21aOWlyc1RwRUdGYmhGc0VH?=
 =?utf-8?B?bFo3SG9Qem1QRjZPaHR4RFlxZVJ5ZGhkbklack1oZi83NmRhYWF0aWFVK1hD?=
 =?utf-8?B?Um9SSnVRTjNwd1M1OEV0VjVOaXk1OE1oT05mQUZKZHBUVlk2a1Z3d2J3eHpT?=
 =?utf-8?B?UnA0a2VkNnBEV3B2UnRhaUhFVkdKNHhNeDhaU3U0ODFlU0dweXhBZjhMK25s?=
 =?utf-8?B?RzB4aExDdVZDQzRCWStZeU1EeDF2M0ozS3dpVnl0OUNJOFVhOFpoekttcWJu?=
 =?utf-8?B?djNlNHhqVC82UjdRb0xXcFE1S1lleDVNek5HSEUrV2k1TEU0a0pFdC9sZ2tO?=
 =?utf-8?B?d3lZM0Fsa1Jlc0djY0Y0WitsMVdZTHJLVXFXYVM2Qjc4S1BrSUx1R1JTVjRw?=
 =?utf-8?B?Q3BWZ1FUNzRtM2kxTm4rRGJ5eGJUdHpMSHQ4Q3BqVUVlZ3l1SFdDYjQxSlpW?=
 =?utf-8?B?SzJ2UE1KNFR2NHl3T29RUGovSTZVWWNFNFdCWDNKRG9XSHNFUW1jQVFqc2Z0?=
 =?utf-8?B?T3ErVlZpSWZVOGNVUHN3VHhhdWFlUE0ySnd1anczanRESVMvcys1dS96NEt5?=
 =?utf-8?B?dmF5RnVDWTlEa2xVMWdBN0xCeU9KWmQ1NmQ0Vm5sRGx1bG56M2ljNm5qcVpm?=
 =?utf-8?B?RkVKQjlEM2NORyszakdXaisxeWV5UjVmYVA3cUdNSmhWdzRWbWprNWthd095?=
 =?utf-8?B?RGlXbzZjQWNvRTdEMTFVWmtuVjRGMzJSWXZjSG1KSU1yaGFXbUZWTmVYeFo1?=
 =?utf-8?B?UWdPQ0tzQnZGRnh2VzZVWG54OHpUYkFWYldrdzNsQzJ5dTNHUjdsMktQWkFn?=
 =?utf-8?B?UlBrYUpIYktVUjZxTGFoVjQ5YXFId3E0QlpsZDZHTEN5UVdVVXVQUU1TNTZY?=
 =?utf-8?B?cC9HRTg4MHlpTSttelZxOUlRcCtjZW5GeG9LTlJwS1BTZmRObXNiSkNnNFJS?=
 =?utf-8?B?ZVlEUUlmN1pZNnRhNlVud3ZHYzRlMDF6TjhMR1RpZlArdHRLRlRqWVhsMGZQ?=
 =?utf-8?B?UzJIaTNDaEZNRUNHcHVhVDA5SE50WXVsekgwRDY5RnpTVGxtMTRpQm5ROWJQ?=
 =?utf-8?B?dWZCSUJ1U052WGZtUzdvU3EyZ2pLWkFRclJJSSsrMTV1aFVIM2VBb3c5Z3Y4?=
 =?utf-8?B?blB4cVdBRm1zdC9IeEE1bUJJTVc4bFN6MkgwMTBzcTJmRkZmcDFWSXBMaVpJ?=
 =?utf-8?B?SHNmdEpFam94NkgxNW0xR29zSHlDalAxMVY5MVlYeTJ3TWYzV0FzZEZIcDVa?=
 =?utf-8?B?Mm5lVnRUUXhMUVprYjhUYWNOS056bHEzdkR6RGwyMHdwNjJlQ3FyalJ0aURS?=
 =?utf-8?B?N3VYTUgyTk9DN2N6U2JGdGt2b1VsL2w0T0k2R0YyMmNadEt4RTd1R1FBeG9U?=
 =?utf-8?B?ZGNmZjJvd3RKc2ZOVkdvM1MwLzZPYSs5emFvTFBHRlk3UmhSWHc1OXpXRUpr?=
 =?utf-8?B?YkRJTzduRmcrUVA0R2p0aEIxS3hPbzQxM1QvempqWmlCQlM4UEZGNHVDdjlR?=
 =?utf-8?B?R1RUN0JjakwvL3dQbElsSzE0dS8yWWFlZ2Vwb1Y1V3AxZEVXMUlsOE9TakRR?=
 =?utf-8?B?Qms4VFpVeWFWVE11cHpRNEhuS0JGL085cHRtZnpBdktBYi9saGE0cGJDS1kv?=
 =?utf-8?B?a3h2QTdCQjF5eXRieTBDS0VlZnpiNTJ4Y0tzaW13djkrNFl6ajFoS1ZLblJk?=
 =?utf-8?B?bnRjNWdMcU5QV3lvWkNEcThlaFN5VGl2eURmaE1ZRWhhQWRsaEJTTEVXdy9G?=
 =?utf-8?B?NlpJOEFuSkZFTndVZjV6d21GdGxjV2htYkd0NTdoMmZ0Ny9Wa0Y1dkp5Sndo?=
 =?utf-8?B?TERtMFN0RHk0YUlLRnp4OVRzWWJKaGRuWDI4UnZGSUZ3Z1M2L0laZUg0WVAr?=
 =?utf-8?B?SHlScnhlNkwzTGF6MjF4c2NXV0Q3Uk9tbkFnWTBpUDZlVGhZUHRwcVVqOGVB?=
 =?utf-8?B?N1daWnpXS3RrUW1SMkNLekM0SkhDeGlRVzZZaXQ5VzVUdXJSV2NrM2RVNUpV?=
 =?utf-8?B?VVhWUmxlTGgxNENKVU4zSG1IUm1vVG5aRmEzeG1EeHc0dmpNSm83dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <56D2CB0952D9BE4F8B19690BD6CE50E0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	razs4PYLecNSPZoW6K9r7Q4+M7y4cAsJGOETD+Xuf3Lwr5SIZChc+IPL5oDBF8KSkTssjkmmACuUFFPWeodMA1RXQK0RPJtE7zMjtuEgQE+w4q5TmcXxx1iAXeYXu6R78eLKtFmG7LSMazfn93XKOG+Kkc2eDTSDNJ4cCvf/pB9mmJC8V3rCCzYsSqMpNmQSpogUFme6hErOndxo+fKGfS5GuIPBuO4bDwJ8ab2deyjFjv5hlIq6Keudu9g5VMKsnxwOvvX120kMkdGkiLK1rev3at6Ms3ZgoVjd8AqRQib4YuROU6CZ/WW79sIkuVMgDaT+D3SVkQxyxupb4IUUjg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	w2XszdXxAV3kksN8QIztoMHKnPTV8iZXcQQCQ2v/GRo3w8bOJM48nTjHBlUF2x3KtmK5UtKBGKUNhSvkfN0e+t+/mVMtVoxDtR/QXIqIGBajfRPqJSQo/afDqC+F0Zhd9V4t8Do8rDr11F43xjhSwHvwX3LN6URdioM6FukpkR5Ul/Lh5M1qYiiACII4SWm+hy0cOZQLP+2lZa8BgV0jAc2Vh77z8zenxm7smZW5fNCO/7Kx7Mi9CMot6iG8EG2GvJSG4ASXx9WiZm828l1FWwUi+tn9w0nWHmEulHAwVTBLw1kUVkkOikNLyQpHhCtM7WdaEUPWG+kXcrcWgLk4n2i0UcC7pkIGU/dAKreQJSlxFeL6BJIlM1jM/9RfNC53I8bS+m0Nkj2AfY8wfVs+hX/dgS2qDgyvVjaQIOyC1MBTWpEROMiFWh5T4q2p0edd5UDyPPjiJy4qa/F82zriJsnGpEyRVFELTpnNtL3HU5NJl6UQ33/cRskquNmfurRcyiSPRUw11VN55c/h33RenrgajJelYjS3w4AsMa962dAAJhYbzl0g7pSYBTz0TmmTfMNHBhDnEzxTTfPL5m8K3u09yQ9f+H+fzmryvFIV4Vxaiio6TlAb4lJ8y3trDC+KKZ19HoLxyd4y0NDs6IATeQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f17a0171-a583-4b67-d982-08df19ddd42f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 01:47:44.7918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8wK6TaQkznPjCbczF0UDN5elrwdbQ+0Q3BKfx+TcmLUYnU2BNHa7+En3BYtzXaUE1lt8L5Qa7I6Mjm8tCj/2PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6118
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAwOCBTYWx0ZWRfX+FRs3Ncz1DP0
 7oGBzgJcEN8Bx0/9tZU34pfKdgy+LS1EKKfT3M0d8dDJ9KQTjRYLl41j4J3v7W1zHQqYPoSdi9L
 uQAnk5uIn+4Wb1HEajzOd5xJQJ9HuYEAmRIVmPgOgsP6nm6Ai+Z7hHuahOwrj4jeDYysvMmMr1r
 HaQojjyKXchYRI3i9+qifq8mjHJmY8XrWnUWKA4gZrTomrSYzEVBG/n0ub44GSfbiLOqZG5xOAF
 XpRXOxSCReuYYjVAfUzuj5tGeLYjqZGPho2Dhai71cj9q4xc95oyLtbj9w5zIYPjluGOS+dBbb5
 9tkTH6yLtOXc/vwD6fEf6FEviw3lahoGDdy7I3dpvZdH8TAtGMSW/xwyMC9GilFNnhutVg2/PfO
 qTPQ0j3pLqeMO4r4myfqdDEppyqHR/4ginQXpqHMi6gc6wNuM6Ue+s3fJrkQ3cDn95OlpYHUsAg
 ukCcPDHVWNfP0kT3FvQ==
X-Proofpoint-ORIG-GUID: V2gyOkaKE884wNkELAPi2YBSlFObATme
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6ab48150 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=jIQo8A4GAAAA:8 a=g4773ZZR_MynnNVi4CwA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAwOCBTYWx0ZWRfX+w5i1+791r9P
 +CdrYlYKriU0nhDTPaT1Owg33ZDukOr7LH2E2d39Urk1xfQdkWYhmpHk6Mh7gBS4pI/KgvXOUn8
 mCiRtkHiptCOJlt2Nmm/qkBkehQrLt8=
X-Proofpoint-GUID: V2gyOkaKE884wNkELAPi2YBSlFObATme
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_08,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 impostorscore=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609240008

T24gV2VkLCBTZXAgMjMsIDIwMjYsIElnb3IgUGF1bm92aWMgd3JvdGU6DQo+IE9uIFdlZCwgU2Vw
IDIzLCAyMDI2IGF0IDAxOjU4OjE5QU0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBB
Y2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KPiANCj4g
SGkgU2ViYXN0aWFuLA0KPiANCj4gYSBoZWFkcy11cCBiZWZvcmUgdjIsIG5vdyB0aGF0IHRoaXMg
cGF0Y2ggaGFzIGFuIEFjazogdGhlIGJ1aWxkIGlzc3VlDQo+IEkgcmVwb3J0ZWQgaW4gWzFdIGlz
IHN0aWxsIG9wZW4uIFdpdGggZHdjMyBob3N0LW9ubHkgYW5kIFVTQl9HQURHRVQNCj4gZWl0aGVy
IGRpc2FibGVkLCBvciBhIG1vZHVsZSB3aGlsZSB0aGUgZ2x1ZSBpcyBidWlsdCBpbiwgdGhlIGJ1
aWxkDQo+IGZhaWxzIHdpdGggdXNiX3VkY192YnVzX2hhbmRsZXIgdW5kZWZpbmVkLiBUaGUgZHdj
LT5nYWRnZXQgdGVzdCBpbg0KPiBkd2MzX3JvY2tjaGlwX3ZidXNfaGFuZGxlcigpIGlzIGEgcnVu
dGltZSBvbmUsIHNvIHRoZSBjYWxsIGlzIGFsd2F5cw0KPiBjb21waWxlZCBpbiwgYW5kIGluY2x1
ZGUvbGludXgvdXNiL2dhZGdldC5oIGhhcyBubyBzdHViIGZvciBpdC4NCj4gDQo+IE5vIG5ldyBi
dWlsZCB3YXMgcnVuOyB0aGUgcmVzdWx0IGlzIHRoZSBvbmUgZnJvbSBbMV0uIEFuIExMTSBhc3Np
c3RhbnQNCj4gaGVscGVkIGRyYWZ0IHRoaXMgbWFpbC4NCj4gDQo+IFsxXSBodHRwczovL3VybGRl
ZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwOTE4MDkxMDMy
LjE1NTkzLTEtcm95YWxuZXQwMjZAZ21haWwuY29tL19fOyEhQTRGMlI5R19wZyFjclg3VU0zdVpy
UmF5NlVGU0tIVEN0a1ZXbElRVXRCZ0wwZlViNTR1LThrclFYVFRnS2g4UGVJRFJ3ZXh1NGl6WEpj
NERJZkJqck5QZ3ctakF2UEZ3ZVYtemckIA0KPiANCg0KVGhhbmtzIGZvciB0aGUgcmVwb3J0LiBJ
J3ZlIG1pc3NlZCB0aGlzIGlzc3VlLg0KDQpQbGVhc2UgZHJvcCBteSBBY2tlZC1ieSB1bnRpbCB0
aGlzIGlzIHJlc29sdmVkLg0KDQpUaGFua3MsDQpUaGluaA==
