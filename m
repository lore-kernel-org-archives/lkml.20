Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A684E56A;
	Sat, 29 Aug 2026 01:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787967138; cv=fail; b=rhmqF+yQG71B3COOiJzngZ6vwkSCCZEzg//zh3VeErBAzxfi/P/NyoaN2yITD3Mzaqb5bvNd8+QlnAtoRXWT6LWEXwRxunDkSmr2fZygfvYrs9NWT8APEnOXmn5/dLVD2kG6RyYLF96bYvNldZxkAvtXhBneAgLWnNF0i1p9MlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787967138; c=relaxed/simple;
	bh=Vl6eSii6QSI/G/eZi1JR7ZQctRmqLVOkJxQAU/DLBqs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eGTpMeg7pfazVQvGrKIkt0TMnXqjskm9of5u3puWf1JWOknAG/ueHSqti2wj2qmTOnJggzFQB0hhIc1lOP1DBmb7YdY03flfxTE0zY8qo+bleaIK3vWis8vP1XdyK/YbHERYrXb/4IrMwPVnq3Wf1aWl7kC3DNaKjX4laTeT1FU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=qCdU3omy; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=bs6IoONV; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=azE7GXVC reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qCdU3omy";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bs6IoONV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="azE7GXVC"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SMTgX32153690;
	Fri, 28 Aug 2026 18:31:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Vl6eSii6QSI/G/eZi1JR7ZQctRmqLVOkJxQAU/DLBqs=; b=
	qCdU3omyk7zpeQZuEGOsn2WFsoR1VImco79WkQvxo2LRw1ZxoC6KyTBtvRQe68FB
	vbZxgzqGqRuc+EP9/9vWLw9dmqig6thbILGxHmCDok95hMkws8kubR5q0PwdkdAD
	rG2OVbHvGxZ08pZkqP90aA5LaIAdx+Rw6T+4ba2UuV30P6wCICWYB7Arjlb/v7Mf
	xARKLAR5UMjqruhq27OnzTT8YlSApJaKRwI29EiB5niccL9liVl48MRkC7B+sjtK
	jzNbM/uZIxQJnhKx3XzLf3C8mOHNfWOD5EXGr6fsgbKYe7nxO2bMhkPQd6Z4tTSa
	hH3jOQ1VCDel8Kju1p81tw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4gb38mqb42-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 18:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1787967091; bh=Vl6eSii6QSI/G/eZi1JR7ZQctRmqLVOkJxQAU/DLBqs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=bs6IoONVVdzJIhpJfBzUZVLCu3VfR7xAGmnbkJCWrv4WCNJFtELmH1PgLTX7iNIbo
	 biT2oCn30R+KOSnJZ5hfhwuXHc4TJ7/yXk0N3k4LGt+csrh74iSMJrSfBRQsghFej3
	 kZcAXlCuiQe7HI+9y+9zkRoS3Qvtn87JqrluE/YtqkJ19r3VeXCBtSS6EyU5b4vq+r
	 qEFkEqLW5SGnq71glebYxs2ljNU/6epjghWXzuQNDHRNaWQKBKOr6gQfGzFMLfvQbq
	 vBX9g0juR9B6ouZdXBrwoF2VufkNy44D3lXjSbsXIbLHMPFtfn5kybheF7mT40vcRc
	 oWPOgUXY1/WNw==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4815140124;
	Sat, 29 Aug 2026 01:31:29 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 05E12A0068;
	Sat, 29 Aug 2026 01:31:26 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=azE7GXVC;
	dkim-atps=neutral
Received: from CO1PR08CU001.outbound.protection.outlook.com (mail-co1pr08cu00105.outbound.protection.outlook.com [40.93.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1F681404F3;
	Sat, 29 Aug 2026 01:31:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yY73oCbvU8YnwGBgt5Et2D5BrN3Cwy+eNXpYy7Lt3AKQe01gg9XhZ8wMMN3oeLcWrAxp6Z5JkzN4PtQyJ5li6CVsQcGqrE8Dr2xm1jmp38QzIFDq3vC1GgYgZNx9BQhg1FUT1SKcKJZWc3m3LLflQHATrfuETUhWCSzVcv1lrMD+OfSEGB/M93iG0lrMD3yznM06b6Y1vz2DIMfx34WC+OTPVKYEd2w+nD+tmwFMwubVFA4eJ3WlcxcYmjSnH+n0atksZSl7w6Qk2jsSQVkwV4tap/mzFY+hH4aOg6dKHg7Ur6MmB7UZY67uKVbRvqLjKKg+4a6pmoqslWIVOZVvUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vl6eSii6QSI/G/eZi1JR7ZQctRmqLVOkJxQAU/DLBqs=;
 b=IXgtRe4zpmDrttPSxzoWDXzcwnNAqY8PlLlJX3AurH9WUO6ungLna1+bGlywrJ0eHj29RdwUHENZPOs8ZIFojOTo0dYHbUQrECg/vcacd5vGcxRtfnVm0ahs35NUxShpu/I6Hsrbj3bTRU7Tz/yrglAVH+YLZEQU/b/Ox7qud+nUDMYK9BHWRy/w5wbN1RNFpQad0cS3hZV4nE/bs5rJ4J9lE0SJhgjRjvzpvRj3YFVoYKHAcHRx/UxijYI54gJyhVD7K1RpEpxcrUlq70Mg8xPFjCIOhBfILFbvbhPLTawvorrkL5rR5eHxZPMRGuC+M2LZEjr4LEmGmcr+6mXlPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vl6eSii6QSI/G/eZi1JR7ZQctRmqLVOkJxQAU/DLBqs=;
 b=azE7GXVCtn2jf4WOlDlCWNdLh10VflRsejh+tmPQPeeiBL8TD8BJaW0y6BTTMSF12p027RlU6SwPS7b0ckIj9g3Imh9kEOMO1hMlyIqJtulegpx1QPkEpZ4S8TKA2CMKjLbY1hpD6wrptUnSl2qmjaLIZya1tFxZmH8Q4eS6omI=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by CH3PR12MB9394.namprd12.prod.outlook.com (2603:10b6:610:1cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 01:31:18 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 01:31:17 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Yubing Zhang <yubing.zhang@rock-chips.com>,
        Alexey Charkov <alchark@flipper.net>,
        Igor Paunovic <royalnet026@gmail.com>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v14 29/38] usb: dwc3: rockchip: introduce glue driver
Thread-Topic: [PATCH v14 29/38] usb: dwc3: rockchip: introduce glue driver
Thread-Index: AQHdK2ZrG+NkxuqG7U++8PVxGi84zba0VViA
Date: Sat, 29 Aug 2026 01:31:17 +0000
Message-ID: <apIu_Jb1APyI8Jh9@vbox>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-29-b5ad9c68fa11@collabora.com>
In-Reply-To:
 <20260813-rockchip-usbdp-cleanup-v14-29-b5ad9c68fa11@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|CH3PR12MB9394:EE_
x-ms-office365-filtering-correlation-id: 79767096-8728-4670-224d-08df056d390a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|7416014|10067099003|22082099003|18002099003|11063799006|4143699003|56012099006|38070700021;
x-microsoft-antispam-message-info:
 nNOfnAYnCHdNOzzF/6B88pvD+7VsH5XbFSxZ1nj/DlveXleE5Q6Va4ie9LZfpJvIoscaIiH5yqP2mEC+4KuxD6/cgDivyucPEcVj8z2nrszzp5PfpATPaun0VsSWDcvaSuHEXWY7kGClgNajgmiBD4oyli4o6Xa8SbTKj+ipv1JQjjhxp8ICGzCX7pT9GcxAwoKxnzZHDwjmhCz77YwxsGdmUkSnY+h8b0RA4/A/SFuFd5qZNz0QbnOY2s2T08x9sJROBgko5u2v+nvswCnMjiKwaaNaVm35nx0vjiKKBTGwJHTeY1QkXcCLIIqN8i1sc9X43rtfaAk5MAelZfAcGTMOPNZqIk2LYdcALKbp2qdXGyg21SwT2r1M3AIPBQ3ClMEoJ+Hwq6IwUcyja0wgsSVA5enW53+aKBI/Ox0lDVUs9tQUp+L415ICEJwdxZSBhvjIbONAXmKokujJfWCxNqyOenim8XiLRa7Pg1dnrmnvt6ir3XqSOFquSqvCvVBAqlAyKhP8GEhfqtk/i8gyp6htfN1/Hw4W7votU1cFufblFONSbZkSK5IDOvVYK+R/ZsKc+mZrMquoY1dv1epCtHeQiRij1ji4YZrVo3mHVw0sNVGlAqkTvrPwdtfRLDv951gUnL/rJiemnp3fuIiUYK14cxv6as2xPwo+iPeOsSwI2J2IluvT77oiD47kYN/7mAZYGQ91xfgGQ4pElb9Ac5BvyXQq4uk36fvzRECJbNY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(7416014)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MS9vQzhWMFY5V0VMVHBtaDJMc2dhSmFhZTFZRytRMmprd2F1b3ZzQlczL2pI?=
 =?utf-8?B?VEpWRTZPeEhEWDByNGt3OXJiR05sdHRRVXVWanBLTU1qZG81YldreXpmT21k?=
 =?utf-8?B?QmR6Y2FTR2JXVlhKcGF5bEttM0hPK1dYWjZnOWVuZHpOY29SVzRGcktvbnBT?=
 =?utf-8?B?UTI0Ny9QalRtOEhWZm1OQUtETUhUYnR4TkJ1R28rZTlOVFgwZDgzN29IZXph?=
 =?utf-8?B?OVNHUko3L0t6cTBQd2NzZ21SNkZXK2dSOWVZS1lzQnZMRFM1SjIrd2VoZnhJ?=
 =?utf-8?B?Z3JaUzg0UnpKbFlER1hRMDU1aHZtYlRycXY3Sm5VLy8zL0x0Zkpyam5uZ1lG?=
 =?utf-8?B?TmdkVHlaSWZZcVFsdjhyVFlyNEJLWkNUdmlnTTNBRW5nK2YzYnhMeHppNVBy?=
 =?utf-8?B?YWZEOWkvNGVtSUNnbGowYlV1ZDNzeGJOdjVvYXhpdE5ZZ3NSelZsTVdCbjBZ?=
 =?utf-8?B?NFBPem96eVdNZEJCRUllQnVOYjMrcmViQXFLM1RNNFJNOUpvQTFCbFhOS1BV?=
 =?utf-8?B?L1owV0xRb1JUSVZ3dDY3Zm40TVhKakRPYnJGRXBFQlh1Q3k2ZUN2eDN2TEZv?=
 =?utf-8?B?K2RrcWFXMS9pSE05THVTK2h2REVtSUhtN21SRU5sY0FYQ21acGFBcEhsWGNv?=
 =?utf-8?B?Uy9DUm9ZNEt0N3hjOGZCSUtVU3JzRjltWWdkS0tUam1yRVN5ZkxSNnlaRC9u?=
 =?utf-8?B?QzlaTUlJclN2QTUwNXJva1FuL1hjelo4bTJtVVhESllWamVyZnZ2N2Ryb2Qr?=
 =?utf-8?B?OWdIRHFLWGF2UEVkeEcrR1pGcDkxNDVKZ0g5Rjg5Z0V4Q3o5M05QWWt2U216?=
 =?utf-8?B?NXpsOU1SZ3JvbjJIWFFrUWxTeXhFTHdpRml5VU1vd2ppUHRLL3lSc2YxZXgv?=
 =?utf-8?B?eTBuSFB4azZtQ2UzekNsZEFuZ1hNU3VLYXB2WEFRRmJWQzJ6aVVERzRSdzc4?=
 =?utf-8?B?RVhBVXpvemtBZDIwSU50ZktFRUtJdVF3L1k5SkNHdlhiZE5naEMrdWxtYjkw?=
 =?utf-8?B?a3J4cTFoVUc1Y3NHOUt5bnJ3bmNzNlZXeWV3VVZnWmw3bVc0RmtnSG82WExK?=
 =?utf-8?B?dkhuM2YwQjJQL3RxWnZTa0Y4aUx6RDR3ekYyVjliRzdMRmZic1R3U0xNWGxX?=
 =?utf-8?B?T2gzei9UUDN3VitmQmdPallSUnBmZjh1ZjJGV09LRmdvVTFtYWhzclgyNllD?=
 =?utf-8?B?SU5qcTYvRzBlRDJURXlBNHFuZkwzNFNNVjJjbGdWZStaNWtDUkI5Y1grNm9j?=
 =?utf-8?B?VmU3NGdDQ0ZiYytxeTQvcmFSbzVYUGFVd3hjcDd5MGRZSGR6TnBvQ2xzYnA1?=
 =?utf-8?B?SWRKb3kybWx3TmNhdW5MaXdnaE9XM2RHWnJFSnN0Q1FyQUVtd0FxTzFIV01i?=
 =?utf-8?B?K2NGcUF0WVRKNGhDd3pUZ2w0bnlwR2I2UWIzYURsaFo5bVprMkpUTWpYaklp?=
 =?utf-8?B?VmpqbWdKd0wzclJWZnQxbk82WGZCRUkvQWNiSE56ZHc0a0pMektzKzRUUUhE?=
 =?utf-8?B?SFBWQ05wZ1crYU1VZ3gySTExdDJZUTM3b3hYaTcwUGUwQTVkaDh4UHJZN3Zv?=
 =?utf-8?B?R0Z6c2RQZ08waGtGenF1K1I5R1g3T1ZzSE5YT01vY0ZjbzFZaGtUWEZHeTRh?=
 =?utf-8?B?RFQ3S01ubVhOSkppT3hwYXp6dGt1YW0xaDltY2poVnc0OUYvT1FUSDlHMzZ1?=
 =?utf-8?B?aDNrb1gzUUhWcVR6eklTL3Mwd3RGWHRFWVdrZUxUSzJQY25mb1E5aTg3Y1lo?=
 =?utf-8?B?eCtHSUYwRjNsNHgzWVAwdWNJQzRFSkp6ZmJsbEsxL2p6a21qaTViMVA5SjU4?=
 =?utf-8?B?ZHIvaHhsUTgxRmdCR1RWOE9kVmc3Zm53ZGFsdGVqRFo1bnlDVXdwVk1SZUFj?=
 =?utf-8?B?VThaSG9NUE5TRlVpWFVUcjc5dUY3ZkhBU1NMenhIYWNVMXdBeG9KU3dUTjNn?=
 =?utf-8?B?SXViZ21LNWxKaENHTm1HbWFjdG1BQ0wxWnVyckhDRTdueXh1NC82QjJGZ1Vi?=
 =?utf-8?B?R2xLbWpLcXFoZ0JQTmxrR0R1aVNaYWIyS1o1cTlTNlByTjIvZ2pnNTh4ZFpM?=
 =?utf-8?B?eFI1SmNNR3hiUU5kN3Bnb2trbVBPN1paeFdOdHVLcU5YTER0Z3JXZzd5VnB4?=
 =?utf-8?B?YXRwS3RYVlEybnhwc0JGS1EzYTUvYkFqdHJvYjFGWnlWU3FLTmVBK1QzcVNF?=
 =?utf-8?B?dHNyNW9zdGtCQzhqNHhtY2xndldqTDlUaEJza2pZNklDRFNNTnE5WENOYm15?=
 =?utf-8?B?elRkYi9qWkJxNm9CNmMwYWs2RDFkSnBlREJzWVJmVmxtNUtJdnhnR2FMQ2lM?=
 =?utf-8?B?VVVScnRScUdScWtzVE5Tem0yOHFFYkJzMWJYTFYydm02WmdoTmRNZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <825712D86E846D4284BFFEBA780DCDEB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	X7Tz5Cy6x/jNy0zRZdsWpMDcHxdiZh5to6zMpHQOgwz3VMgkp7vGb0ZIAfppVz41A9pfYd2YIvVG8ICbYHQEXEbs1vDfobeLbC/BonClQEvm9HhPOp68kVol6KmLUZRdB86u+wu6uiJNGs6MHSxQue1aOkLEYSaJdxSkOWTQSZy1EAgQN3QfoTDlUNdWUDTQYdYdJedtv/ymlda6DXjALLOy0gS+9o5UTfg0Q8D0nSeCwniNdNkfFKomkKkJeiMxl4BGqctznxpTYqYVi03x56hyM0xarJWYAGZvyThtUODompES81G4u79pWXrbCk34LJPRqEBFYSNb5PayZOGe5g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EQf5xfh4utuA8WNX6VYFJ576Lallecm8NmuNNEDI2Q8L7Pld14wnPIvcB1dMkwhIKdTbTD0hW2CiqQgtoHIJMr0pwA4SmZbE8UllTlPW6g5npE80F/UdrQGiijayUjbbP83XB+NAoFXyFwcDrW6MN2MRTVBYTBQp/8axWPW27Lwxg/w1kzUkGeEnACNXruCpIDzA7UXbf9rRJPcpI6TSDXpRo0yJ+giRrFjKhI9xhKafO5uMLAIPYZNUEepFWFIHdLdlyf38PDPbUwdlPoHQKp9qkCq8uKgoIMvNWYs9sM97nzwDmqbAMTwT2gc5+OIECJDeE3w7GscsYdufmeWMrYkfG8nYmI36lqedX15O51y9HK5lVNmmLtKhuQJa0HN1CDrOu82+mRe5+RKp8aaQjH1mP2fpDLMt/qDiJkuhQ/1fU/H+AE/KAuTkWnzMBFaahxPDYVko+ETpJtpMeGRSX3Qi5AR8wVP4wM791Ce3NZKgv9tVj78Eb1RYOCU6qVne5672tmxeUyea5TO8oGQBr+d7jjaLnViz8fMCewVDZpq7pg/qffusmWTXE1oFC6dUMRFgQJFnGj+Hjrfay5H29caOAXXEwOoyItFnD+EsC3SGn1dnkT6DLqDdqtNfvDd7/DCpKSMp79xbLFSah2wDpw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79767096-8728-4670-224d-08df056d390a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2026 01:31:17.5875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cG2ndcqhwTwx+KBTJk+8i+H7iA+KjCzCh0LCJxC0VxyJvYqAZ8fasvAbZ7va09hMKLZpYavACSXxqVS6oteJig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9394
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDAxMCBTYWx0ZWRfX1iW5T7OHM+mN
 4F+MOjimbL/POavT/5cGvbXd/kQXt2fPuKtydBjGJl2aOZ2FB+y8EHxUva0CaQlWoEoiunlm90w
 ljDoqfd1BM61/b2Lb0H8Wcj7lEt6QPLIxxKQasjf2C5D/B7m7EoiIwSLhqh6pQISKfvIrQnxZHL
 BPnz8k7iYC3LDRJ2W8KkNJ7rUOC8PWViu2hpBbkj8Ib9URonSilio4yrXhmPFkhESmxXMax5oFW
 fmggFjH1znPdpgvJ0UpE5FMkJE/wEa0ZNA9HezRwq/iU+j3WP9sfAhqEzOA8LUYuM+g97i6l8q0
 80nSLe/IzHK/7oxzgwghxxPNqwnbd8nPYSV2YXu0zZMk+xLqXY5Zw6qVb62SViiy/5QpUdw0K0v
 nozcb2hx2XOc9M5WpH0zZO/rg/KrfVltIVG9DzIx990Wy7afj5Nxn99lrKSpAF2iy6WNE7z1AKH
 iSQXTCFiTKLpcp6dRJw==
X-Authority-Analysis: v=2.4 cv=TYemcxQh c=1 sm=1 tr=0 ts=6a923674 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=QX4gbG5DAAAA:8 a=N_l3tuSvK5gYoIjoa2AA:9 a=QEXdDO2ut3YA:10
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: M3f4KhF43sOWmjBseE8OmKQbkGzf_yef
X-Proofpoint-ORIG-GUID: M3f4KhF43sOWmjBseE8OmKQbkGzf_yef
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDAxMCBTYWx0ZWRfX8nnnjPe+cOQ/
 ahE0Wjs4pvsIgTdWqvkuJU2OX2x6+FdwTsS6CGtxfE1XyWzBa9rsnmD7c9QG9O9IiHnmeMeAnCN
 mj5GMxmCgKlZsqTwmfM5CDxwLa0stDI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_07,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 adultscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608290010

T24gVGh1LCBBdWcgMTMsIDIwMjYsIFNlYmFzdGlhbiBSZWljaGVsIHdyb3RlOg0KPiBJbnRyb2R1
Y2UgUm9ja2NoaXAgc3BlY2lmaWMgZ2x1ZSBjb2RlIGZvciB0aGUgU3lub3BzeXMgRFdDMyBVU0Ig
ZHJpdmVyLg0KPiBGb3Igbm93IHRoaXMgaGFuZGxlcyB0aGluZ3MgaWRlbnRpY2FsIHRvIHRoZSBk
ZWZhdWx0IGdsdWUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTZWJhc3RpYW4gUmVpY2hlbCA8c2Vi
YXN0aWFuLnJlaWNoZWxAY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2Mz
L0tjb25maWcgICAgICAgICB8ICAxMSArKysrDQo+ICBkcml2ZXJzL3VzYi9kd2MzL01ha2VmaWxl
ICAgICAgICB8ICAgMSArDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyAgICAgICAgICB8ICAx
NSArKysrKw0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLXJvY2tjaGlwLmMgfCAxMTUgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDE0
MiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9LY29u
ZmlnIGIvZHJpdmVycy91c2IvZHdjMy9LY29uZmlnDQo+IGluZGV4IDE4MTY5NzI3YTQxMy4uM2Mx
MjBlYTk3NDZkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL0tjb25maWcNCj4gKysr
IGIvZHJpdmVycy91c2IvZHdjMy9LY29uZmlnDQo+IEBAIC0xOTAsNiArMTkwLDE3IEBAIGNvbmZp
ZyBVU0JfRFdDM19PQ1RFT04NCj4gIAkgIE9ubHkgdGhlIGhvc3QgbW9kZSBpcyBjdXJyZW50bHkg
c3VwcG9ydGVkLg0KPiAgCSAgU2F5ICdZJyBvciAnTScgaGVyZSBpZiB5b3UgaGF2ZSBvbmUgc3Vj
aCBkZXZpY2UuDQo+ICANCj4gK2NvbmZpZyBVU0JfRFdDM19ST0NLQ0hJUA0KPiArCXRyaXN0YXRl
ICJSb2NrY2hpcCBEV0MzIFBsYXRmb3JtIERyaXZlciINCj4gKwlkZXBlbmRzIG9uIEFSQ0hfUk9D
S0NISVAgfHwgQ09NUElMRV9URVNUDQo+ICsJZGVwZW5kcyBvbiBPRg0KPiArCWRlZmF1bHQgVVNC
X0RXQzMNCj4gKwloZWxwDQo+ICsJICBSb2NrY2hpcCBTb0NzIHdpdGggRGVzaWduV2FyZSBDb3Jl
IFVTQjMgSVAgaW5zaWRlLA0KPiArCSAgYW5kIElQIENvcmUgY29uZmlndXJlZCBmb3IgVVNCIDIu
MCBhbmQgVVNCIDMuMCBpbiBob3N0DQo+ICsJICBvciBkdWFsLXJvbGUgbW9kZS4NCj4gKwkgIFNh
eSAnWScgb3IgJ00nIGlmIHlvdSBoYXZlIHN1Y2ggZGV2aWNlLg0KPiArDQo+ICBjb25maWcgVVNC
X0RXQzNfUlRLDQo+ICAJdHJpc3RhdGUgIlJlYWx0ZWsgRFdDMyBQbGF0Zm9ybSBEcml2ZXIiDQo+
ICAJZGVwZW5kcyBvbiBPRiAmJiBBUkNIX1JFQUxURUsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dXNiL2R3YzMvTWFrZWZpbGUgYi9kcml2ZXJzL3VzYi9kd2MzL01ha2VmaWxlDQo+IGluZGV4IGYz
Nzk3MTE5NzIwMy4uNDQ0ZTdlN2YzNGIyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2Mz
L01ha2VmaWxlDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvTWFrZWZpbGUNCj4gQEAgLTU4LDYg
KzU4LDcgQEAgb2JqLSQoQ09ORklHX1VTQl9EV0MzX0lNWDhNUCkJCSs9IGR3YzMtaW14OG1wLm8N
Cj4gIG9iai0kKENPTkZJR19VU0JfRFdDM19JTVgpCQkrPSBkd2MzLWlteC5vDQo+ICBvYmotJChD
T05GSUdfVVNCX0RXQzNfWElMSU5YKQkJKz0gZHdjMy14aWxpbngubw0KPiAgb2JqLSQoQ09ORklH
X1VTQl9EV0MzX09DVEVPTikJCSs9IGR3YzMtb2N0ZW9uLm8NCj4gK29iai0kKENPTkZJR19VU0Jf
RFdDM19ST0NLQ0hJUCkJCSs9IGR3YzMtcm9ja2NoaXAubw0KPiAgb2JqLSQoQ09ORklHX1VTQl9E
V0MzX1JUSykJCSs9IGR3YzMtcnRrLm8NCj4gIG9iai0kKENPTkZJR19VU0JfRFdDM19HRU5FUklD
X1BMQVQpCSs9IGR3YzMtZ2VuZXJpYy1wbGF0Lm8NCj4gIG9iai0kKENPTkZJR19VU0JfRFdDM19H
T09HTEUpCQkrPSBkd2MzLWdvb2dsZS5vDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2Mz
L2NvcmUuYyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+IGluZGV4IDUxN2FhN2YxNDg2ZC4u
NmU3OTY0ODlhMDRkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiAr
KysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiBAQCAtMjM4MCwxMSArMjM4MCwyNiBAQCBp
bnQgZHdjM19jb3JlX3Byb2JlKGNvbnN0IHN0cnVjdCBkd2MzX3Byb2JlX2RhdGEgKmRhdGEpDQo+
ICB9DQo+ICBFWFBPUlRfU1lNQk9MX0dQTChkd2MzX2NvcmVfcHJvYmUpOw0KPiAgDQo+ICsvKg0K
PiArICogTGlzdCBvZiBjb21wYXRpYmxlcywgd2hpY2ggaGF2ZSAic3lub3BzeXMsZHdjMyIgYXMg
YSBmYWxsYmFjaw0KPiArICogY29tcGF0aWJsZSwgYnV0IGhhdmUgYSB2ZW5kb3Igc3BlY2lmaWMg
Z2x1ZSBkcml2ZXIgdGhhdCBzaG91bGQNCj4gKyAqIGJlIHVzZWQgaW5zdGVhZCBvZiB0aGlzIG9u
ZS4NCj4gKyAqLw0KPiArc3RhdGljIGNvbnN0IGNoYXIgKmNvbnN0IGR3YzNfY29tcGF0aWJsZV9i
bG9ja2xpc3RbXSA9IHsNCj4gKwkicm9ja2NoaXAscmszNTg4LWR3YzMiLA0KPiArCSJyb2NrY2hp
cCxyazM1NzYtZHdjMyIsDQoNCldoYXQgaWYgdGhlIHJvY2tjaGlwIGdsdWUgaXMgbm90IGJ1aWx0
PyBBcmUgd2UgZ29pbmcgdG8gZmFsbGJhY2sgdG8gdGhlDQpjb3JlIGR3YzMgZHJpdmVyPyBPciBh
cmUgeW91IGZvcmNpbmcgdG8gdXNlIHJvY2tjaGlwIGdsdWUgYWx3YXlzIChpZSBubw0KZmFsbGJh
Y2spLiBJZiBpdCdzIHRoZSBmb3JtZXIsIHVzZSBJU19FTkFCTEVEIGd1YXJkLiBJZiBpdCdzIHRo
ZSBsYXR0ZXIsDQp1cGRhdGUgdGhlIGtjb25maWcuDQoNCj4gK307DQo+ICsNCj4gIHN0YXRpYyBp
bnQgZHdjM19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAgCXN0
cnVjdCBkd2MzX3Byb2JlX2RhdGEgcHJvYmVfZGF0YSA9IHt9Ow0KPiAgCXN0cnVjdCByZXNvdXJj
ZSAqcmVzOw0KPiAgCXN0cnVjdCBkd2MzICpkd2M7DQo+ICsJaW50IGk7DQo+ICsNCj4gKwlmb3Ig
KGkgPSAwOyBpIDwgQVJSQVlfU0laRShkd2MzX2NvbXBhdGlibGVfYmxvY2tsaXN0KTsgaSsrKQ0K
PiArCQlpZiAoZGV2aWNlX2lzX2NvbXBhdGlibGUoJnBkZXYtPmRldiwgZHdjM19jb21wYXRpYmxl
X2Jsb2NrbGlzdFtpXSkpDQo+ICsJCQlyZXR1cm4gLUVOT0RFVjsNCj4gIA0KPiAgCXJlcyA9IHBs
YXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7DQo+ICAJaWYgKCFy
ZXMpIHsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1yb2NrY2hpcC5jIGIv
ZHJpdmVycy91c2IvZHdjMy9kd2MzLXJvY2tjaGlwLmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4xZGYzMzYyNWI2OWYNCj4gLS0tIC9kZXYvbnVsbA0KPiAr
KysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcm9ja2NoaXAuYw0KPiBAQCAtMCwwICsxLDExNSBA
QA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gKy8qIENvcHlyaWdo
dCAoYykgMjAyNiwgQ29sbGFib3JhIEx0ZC4gKi8NCj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUu
aD4NCj4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gKyNpbmNsdWRlIDxs
aW51eC9wbV9ydW50aW1lLmg+DQo+ICsjaW5jbHVkZSAiZ2x1ZS5oIg0KPiArDQo+ICtzdHJ1Y3Qg
ZHdjM19yb2NrY2hpcCB7DQo+ICsJc3RydWN0IGR3YzMJCWR3YzsNCj4gK307DQo+ICsNCj4gK3N0
YXRpYyBpbnQgZHdjM19yb2NrY2hpcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQ0KPiArew0KPiArCXN0cnVjdCBkd2MzX3Byb2JlX2RhdGEgcHJvYmVfZGF0YSA9IHt9Ow0KPiAr
CXN0cnVjdCByZXNvdXJjZSAqcmVzOw0KPiArCXN0cnVjdCBkd2MzX3JvY2tjaGlwICpkd2Nfcms7
DQo+ICsNCj4gKwlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9N
RU0sIDApOw0KPiArCWlmICghcmVzKSB7DQo+ICsJCWRldl9lcnIoJnBkZXYtPmRldiwgIm1pc3Np
bmcgbWVtb3J5IHJlc291cmNlXG4iKTsNCj4gKwkJcmV0dXJuIC1FTk9ERVY7DQo+ICsJfQ0KPiAr
DQo+ICsJZHdjX3JrID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqZHdjX3JrKSwg
R0ZQX0tFUk5FTCk7DQo+ICsJaWYgKCFkd2NfcmspDQo+ICsJCXJldHVybiAtRU5PTUVNOw0KPiAr
DQo+ICsJZHdjX3JrLT5kd2MuZGV2ID0gJnBkZXYtPmRldjsNCj4gKwlkd2NfcmstPmR3Yy5nbHVl
X29wcyA9IE5VTEw7DQo+ICsNCj4gKwlwcm9iZV9kYXRhLmR3YyA9ICZkd2NfcmstPmR3YzsNCj4g
Kwlwcm9iZV9kYXRhLnJlcyA9IHJlczsNCj4gKwlwcm9iZV9kYXRhLnByb3BlcnRpZXMgPSBEV0Mz
X0RFRkFVTFRfUFJPUEVSVElFUzsNCj4gKw0KPiArCXJldHVybiBkd2MzX2NvcmVfcHJvYmUoJnBy
b2JlX2RhdGEpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCBkd2MzX3JvY2tjaGlwX3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiArew0KPiArCWR3YzNfY29yZV9yZW1v
dmUocGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldikpOw0KPiArfQ0KPiArDQo+ICsjaWZkZWYgQ09O
RklHX1BNDQo+ICtzdGF0aWMgaW50IGR3YzNfcm9ja2NoaXBfcnVudGltZV9zdXNwZW5kKHN0cnVj
dCBkZXZpY2UgKmRldikNCj4gK3sNCj4gKwlyZXR1cm4gZHdjM19ydW50aW1lX3N1c3BlbmQoZGV2
X2dldF9kcnZkYXRhKGRldikpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IGR3YzNfcm9ja2No
aXBfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiArew0KPiArCXJldHVybiBk
d2MzX3J1bnRpbWVfcmVzdW1lKGRldl9nZXRfZHJ2ZGF0YShkZXYpKTsNCj4gK30NCj4gKw0KPiAr
c3RhdGljIGludCBkd2MzX3JvY2tjaGlwX3J1bnRpbWVfaWRsZShzdHJ1Y3QgZGV2aWNlICpkZXYp
DQo+ICt7DQo+ICsJcmV0dXJuIGR3YzNfcnVudGltZV9pZGxlKGRldl9nZXRfZHJ2ZGF0YShkZXYp
KTsNCj4gK30NCj4gKyNlbmRpZg0KPiArDQo+ICsjaWZkZWYgQ09ORklHX1BNX1NMRUVQDQoNClVz
ZSB0aGUgbmV3IFBNIG1hY3JvcyBhbmQgcmVtb3ZlIHRoZXNlIGd1YXJkcy4NCg0KPiArc3RhdGlj
IGludCBkd2MzX3JvY2tjaGlwX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiArew0KPiAr
CXJldHVybiBkd2MzX3BtX3N1c3BlbmQoZGV2X2dldF9kcnZkYXRhKGRldikpOw0KPiArfQ0KPiAr
DQo+ICtzdGF0aWMgaW50IGR3YzNfcm9ja2NoaXBfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikN
Cj4gK3sNCj4gKwlyZXR1cm4gZHdjM19wbV9yZXN1bWUoZGV2X2dldF9kcnZkYXRhKGRldikpOw0K
PiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCBkd2MzX3JvY2tjaGlwX2NvbXBsZXRlKHN0cnVjdCBk
ZXZpY2UgKmRldikNCj4gK3sNCj4gKwlkd2MzX3BtX2NvbXBsZXRlKGRldl9nZXRfZHJ2ZGF0YShk
ZXYpKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGludCBkd2MzX3JvY2tjaGlwX3ByZXBhcmUoc3Ry
dWN0IGRldmljZSAqZGV2KQ0KPiArew0KPiArCXJldHVybiBkd2MzX3BtX3ByZXBhcmUoZGV2X2dl
dF9kcnZkYXRhKGRldikpOw0KPiArfQ0KPiArI2VuZGlmDQo+ICsNCj4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgZGV2X3BtX29wcyBkd2MzX3JvY2tjaGlwX2Rldl9wbV9vcHMgPSB7DQo+ICsJU0VUX1NZ
U1RFTV9TTEVFUF9QTV9PUFMoZHdjM19yb2NrY2hpcF9zdXNwZW5kLCBkd2MzX3JvY2tjaGlwX3Jl
c3VtZSkNCj4gKwkuY29tcGxldGUgPSBkd2MzX3JvY2tjaGlwX2NvbXBsZXRlLA0KPiArCS5wcmVw
YXJlID0gZHdjM19yb2NrY2hpcF9wcmVwYXJlLA0KPiArCS8qDQo+ICsJICogUnVudGltZSBzdXNw
ZW5kIGhhbHRzIHRoZSBjb250cm9sbGVyIG9uIGRpc2Nvbm5lY3Rpb24uIEl0IHJlbGllcyBvbg0K
PiArCSAqIHBsYXRmb3JtcyB3aXRoIGN1c3RvbSBjb25uZWN0aW9uIG5vdGlmaWNhdGlvbiB0byBz
dGFydCB0aGUgY29udHJvbGxlcg0KPiArCSAqIGFnYWluLg0KPiArCSAqLw0KPiArCVNFVF9SVU5U
SU1FX1BNX09QUyhkd2MzX3JvY2tjaGlwX3J1bnRpbWVfc3VzcGVuZCwgZHdjM19yb2NrY2hpcF9y
dW50aW1lX3Jlc3VtZSwNCj4gKwkJCSAgIGR3YzNfcm9ja2NoaXBfcnVudGltZV9pZGxlKQ0KPiAr
fTsNCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZHdjM19yb2NrY2hp
cF9vZl9tYXRjaFtdID0gew0KPiArCXsgLmNvbXBhdGlibGUgPSAicm9ja2NoaXAscmszNTg4LWR3
YzMiIH0sDQo+ICsJeyAuY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazM1NzYtZHdjMyIgfSwNCj4g
Kwl7IH0NCj4gK307DQo+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBkd2MzX3JvY2tjaGlwX29m
X21hdGNoKTsNCj4gKw0KPiArc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgZHdjM19yb2Nr
Y2hpcF9kcml2ZXIgPSB7DQo+ICsJLnByb2JlCQk9IGR3YzNfcm9ja2NoaXBfcHJvYmUsDQo+ICsJ
LnJlbW92ZQkJPSBkd2MzX3JvY2tjaGlwX3JlbW92ZSwNCj4gKwkuZHJpdmVyCQk9IHsNCj4gKwkJ
Lm5hbWUJPSAiZHdjMy1yb2NrY2hpcCIsDQo+ICsJCS5wbQk9IHBtX3B0cigmZHdjM19yb2NrY2hp
cF9kZXZfcG1fb3BzKSwNCj4gKwkJLm9mX21hdGNoX3RhYmxlCT0gZHdjM19yb2NrY2hpcF9vZl9t
YXRjaCwNCj4gKwl9LA0KPiArfTsNCj4gKw0KPiArbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihkd2Mz
X3JvY2tjaGlwX2RyaXZlcik7DQo+ICsNCj4gK01PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCj4gK01P
RFVMRV9ERVNDUklQVElPTigiRGVzaWduV2FyZSBEV0MzIFJvY2tjaGlwIEdsdWUgRHJpdmVyIik7
DQo+IA0KPiAtLSANCj4gMi41My4wDQo+IA0KDQpCUiwNClRoaW5o
