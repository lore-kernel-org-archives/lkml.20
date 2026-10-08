Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732291EF39E;
	Thu,  8 Oct 2026 01:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791424641; cv=fail; b=gGOfomq+sVmuW5JJPmRbbnv3+lfhJ60kgFSTkgNlXccTQP95DEd10ZUJk0+9X7t8R4CPEVKGAD/EpS5cRrn4bFFJMH0InUKNeVexn+GH9Q7/728uS7001LRAU+XlNFX588Itixf8EvAKBPf8paVJB4kVa8v8RAovPgfmrleJy28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791424641; c=relaxed/simple;
	bh=adH03dA5lA501C2GpZLCyfeJ0+mxvxVKHns4pDv0TIM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CbNk6r2bG8zWaw1MyJc8gNcNii/JT2P+tomeEJ/mgFup5XRhApFIb/TzUqKKwCPt++7jbF4LLsuHkiJyCzgOJAmHR9xppChfgDluT5bzIElZVQbXAzYBBmSf2q65fa650NOxSCM6SroIxdmkQ3UPhYjtGvhBxaLTZJCHP9+d5RI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KKIJafpT; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=CaOmRvms; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hMHXA7g0 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KKIJafpT";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CaOmRvms";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hMHXA7g0"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69812iaK274569;
	Wed, 7 Oct 2026 18:57:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=adH03dA5lA501C2GpZLCyfeJ0+mxvxVKHns4pDv0TIM=; b=
	KKIJafpT6ymYpOWCCyJdWoT0NF02x5fcWPP73rzgU+at5GzO2SdZC6BMLgtJbdNW
	MijgWKNADgMaH+HZq+DHdTzMUg3Av4+HhJ4NnPP/4DK1+Hp0gN2/Q29SC3PL5PYv
	ZVZnwKJnU/hkRaqHyruo5hYPcuPiYb1g2M1+8vFYajYgx7K3RPhxv59e/s9lc070
	Biqx3ddGe139eajKeUaD7e/NU0amzEkD46kP17LiW19WAfttUBVWSx2aB5dYWGis
	H5IR4mAxyp/ZhtscpwehWtBJmK4zQ7hDpVLMycq1zXy+xqpyRyU5uvQQ1/5R+5kD
	S6taN/ql9X0QCQ776YOQfQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4h5xd0h6fu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 18:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1791424635; bh=adH03dA5lA501C2GpZLCyfeJ0+mxvxVKHns4pDv0TIM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=CaOmRvmsmepsHPlJ3Ro6ERB/vof1faHJpPMfkMdal/kpe0Jds5aQCOzsJBF0wxxeA
	 AAAisQBX8WPFQpN2pxVdTLoGQxSl6r3lrFlEaLObOxXENizQyp/ENPBi2VmmvWPpmb
	 vS03OkqAhXKR0EbBtNvUwzt1fNc5dm1xNrQfjg/ZMnQfJArqHONaFFwXpvwTSiHYJA
	 v7QorHhydMFVRrtAO/lqVhNaS0YOdQ5WpyDQDHSTrRlUpuxptUcj/G74+g2slESvUa
	 V8EmndLo1bab/Ee2nEDCh6lxvpyp1V4ua6uMhaT8LnaOFImlIiubMzc8/huz1kj8Vj
	 mIiiQcqTodOww==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D388D401DD;
	Thu,  8 Oct 2026 01:57:14 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 639EAA0958;
	Thu,  8 Oct 2026 01:57:14 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=hMHXA7g0;
	dkim-atps=neutral
Received: from BYAPR08CU003.outbound.protection.outlook.com (mail-byapr08cu00307.outbound.protection.outlook.com [40.93.1.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 897A6401CB;
	Thu,  8 Oct 2026 01:57:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VdvmSZEgLuwTShH3ZGFA7KxJ1A0emkou7ADmS76oH6U7yo50xTbiOGzHDD7lvi8Hvlg+4fw+3xRPUJiJScSE+rJLbwYJEPmQ+bj31lMTDbXBdLCRc8YUx0Yfzzg8yG8zvtSnxzm/7BONIk4Le2rhdzLdqG0DRM6+6LMDp8QhhMx6KqT+vkuAOM8ix0hkl4qwaEAILjlrYIgku9ZVxDrnCrDVrny1v01vZM3nL69G2fXY5X3ftbqKqkw3EY4I2CjbMXkVX7VrjqgtSQnLHRIdF36ViM65O64lLSq87IxRKQ6gmmsLrLE6Qvll3j0FTMOGFvBbr/tH4oY8hsyLAPIRbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adH03dA5lA501C2GpZLCyfeJ0+mxvxVKHns4pDv0TIM=;
 b=jgPpjQC3uypbOHvVPEJrahzkEOa+WV9FAMywLZVI+yq95Vgfq16nbPShXzp/WgDoffPUTG7veW7V3FK89lUE4bRaKW1npB6dMnJIXKpx1WWCy3HNHwqfntAD5o2UwURe/pDb6Tt7ep6nTCqO5MapWTaZpeKi+IKAxNYrqkVabTjK6toaEi/YB2oyVFIFYf/f6kiNLtogjg4qjDSVnFrdJwM45ebF5PBz4lJeG2QBx5wf/CDGWtBba0aCNXus3qG31e9JidUaL/NyzAxEZgh5a2qfQbNsdbmaFhbAGTonfxXkazR62zDINjTwgorVBUBtpCRkvVixAjW7wTatXlZeRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adH03dA5lA501C2GpZLCyfeJ0+mxvxVKHns4pDv0TIM=;
 b=hMHXA7g0qjcqCPgJad0FCFQYjQGr6Z0xAHudjlYU2hJrBdsxlENJny89CsIR0ft1ZnUdapIjWuDWs8/xghMRbcB0VZUdEUcWpGzLFYqjc3GR2+fc3DXLVXV9fZ2DOoNXx33z5raZvzXe0Y2FL07Ls4Fj7+FQgMRwmRhzO94WgI4=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 01:57:10 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 01:57:10 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 1/1] usb: dwc3: Clear SUSPHY before issuing core soft
 reset
Thread-Topic: [RFC PATCH 1/1] usb: dwc3: Clear SUSPHY before issuing core soft
 reset
Thread-Index: AQHdUgIT0ukLj68hBUKu9lzSP0dd77bpa0YAgAliYYCAAB73gA==
Date: Thu, 8 Oct 2026 01:57:09 +0000
Message-ID: <asbzgBGktDN71MQA@vbox>
References: <20261002000741.450793-1-elson.serrao@oss.qualcomm.com>
 <20261002000741.450793-2-elson.serrao@oss.qualcomm.com>
 <ar7-H4Q9U3sNou0Q@vbox>
 <0f4b331a-0c5c-41ca-ba8c-d3a4cb89900b@oss.qualcomm.com>
In-Reply-To: <0f4b331a-0c5c-41ca-ba8c-d3a4cb89900b@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|MN2PR12MB4342:EE_
x-ms-office365-filtering-correlation-id: 230310ea-9a7a-4055-2c3c-08df24df76d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|38070700021|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info:
 KRd0tcjuawEYpD8+ChDRmIzxaN6E04uXBq4KQs1L1EDJjhi8DzgdiLLKXckZtKFSe4lRovmIiSNyYP8EViCftpyHCNQ4FplcXPUTP5251JvCk3VkucHIddgjT8+1sE/Tb2m9CrrqYjYUlyyi49I5/O9zXabGPY7eir9d74X71iIgeCJTFbGNkNL5/RqTVyQcwY/FL2/xoOAzomHc4LxiLb2xTncLm68h1rEROWPKO1uJb8bSQCiar3EetI1FBFVuR/uN+hFSb6QmyGXLx+iuzwdlON2DTM7ajocCvpwWl5ktKSab7aOV0e/maak89h+YQwEsGqoMmzeu4MNkV2JQ8q4PyEiIJimRgBPh3uSi47J4lyrRuMIfjd2CFrK6tY8z7+V+N25hrffMg4Na9uXcHxHUzEsJwfIMoHrynyftZWKJD9slvFgsz/y7KYf9qOnqRi1774qIeR1kxehMrEoI9s5aNjHWPoWefPhWhNbuIo2ODUC1nn6TUXBx0zTGjRr4MB2WGuCSuN6TbOKaHRKoiujonFKWxwOrcGSqoVXapTcBCvWKqLOhorS83S13vwGY9ochUFkmXwDZ0sFOi/OMbmdER/y4f3h2DKagIDr7JgKHKYOkTKj8zdgwO7sy42G7ydxd/1rHxvWgq1lv48kFc7JrqWINI8lcAsVh5K8fRdxxq8KZ8b0TrogIrDzdJaIgRHAZDM3EigpYOfYTFSOQtgatQHtxtqGs1Chy0e6nOFg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(38070700021)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RTY4ZzlobzYzMGlwWURUd2dqSCtWQWdOeTViNjVjbjlrNm9qTFdseDR6Nml1?=
 =?utf-8?B?QTBleDh1Z3RaWk50OG5VMSsrbmtTa2FJZ2lGN0RnRDl6K3ZkcEFPTGJXZHdM?=
 =?utf-8?B?SHBTdGNNWEt2MUJSRS9IVVF3bDkxNERueWVzOE5HdVhBRmo2K3M0aG9SVit2?=
 =?utf-8?B?dmJIdjBxNHhCQVhDTVhNSUJCNHk2bDJWdjVqRXhGUGFkeGpmekluVmVmR3ln?=
 =?utf-8?B?bStDdHVEYXdqTzBFUUJDbWxMcGduTmtWZDAxUk5EWmV0WnY1L2xIT2ZxNHNZ?=
 =?utf-8?B?YXc3TmZocTJsZWI1cU9pMDJRMEttNGlvb2htTExXSmNURmJWcVFreDJYRXQz?=
 =?utf-8?B?OHZHeGVaYWgwV1hkZks2czFjVkJDcmRQV1dudzIrUURrMUNnT0I5U3V6Rkdx?=
 =?utf-8?B?eHptVFRNZ0xTUUhhd3JkRVo1MjhNbC9DbW13bjJXeEFHRHY2eHN6WDQvOHp4?=
 =?utf-8?B?SXVxMzJ3VURKYjBrSmk1SEd4R0JWRXNuenZhanZMU2ExR2FWeDRyNjhIaWMy?=
 =?utf-8?B?MnRUb3FySlVsVFpQMHo0cDE0NTR3RkZDYjR4bDRMS1E0WTRVaFRoek8wY2hm?=
 =?utf-8?B?a2RMbmp5SDBNQ1QwOVltazZqeDJ4cVF4eUExZENOQ2VNbzhTMXhaWnlpUk14?=
 =?utf-8?B?V2F2eXAxRjNYeEZsbjdkYldVMWJLMk5vT3FPV2xwYlBmd0dpT3pHT3JrSUJ4?=
 =?utf-8?B?YVlkZFJyMGhUU0libzVwR0diUmxMWFcwT0FEeWlDZzRYUEltby9qcVY0bllR?=
 =?utf-8?B?VXdKc0h3TGUyVHNpeFRTaUkxOHpUTi95VWM3TnpCakNiRFdCTnhDcXVTc3Av?=
 =?utf-8?B?Wjg0b1UvYTMrdFNrZDRObVB6NWZISUVoeXlaQklRa0x1ODltNEFJWW41TUwz?=
 =?utf-8?B?Q0pySlZ5YTNQN1RpQnBKSEVwYU94K0RpSVVHejVzdnRwOE5CWGtqU1RIa0t4?=
 =?utf-8?B?dGt5aUY4SG5tNDZiSldTWWFLald2RUw1WGdkV2ZZcWFMSzIvWDRDTDlHZ2R0?=
 =?utf-8?B?ZWV5cDRBNGhFa0lSSnREM3lQYTRpcmNzUW1KcitvYjZFeFRIVTNNTzZjZmVp?=
 =?utf-8?B?UjQyaHJ2SHhoWVUvMUhJUDRtYjV0WW5FRXlKUzBEZjZ6dUF6SmxpZmMwcTFq?=
 =?utf-8?B?THdib09GT2FxbVlZOGlZVmZJdFJPMTQ4VkJxTGNZR21vM0swb1psNkpSL2pk?=
 =?utf-8?B?NGxXdWIrRnVOWDhucmhjbUVGYU9WNTdXdjhtMU5xQTRzbllCY3RBbmNyelFj?=
 =?utf-8?B?SWoxeUNicUZ2K2VBVGJwNUlid2xmWXEzMjFZVEhuNVBjQm9scEtLeUg4Y3l6?=
 =?utf-8?B?bisvb091bzdFTkNCVUU5VEFrNzZYeVJVRithOVJEcXRwMkJBU0dGcGJKMFBF?=
 =?utf-8?B?SzB0Q0lEa3hrVHQ5MXBHTEkzbGRNQU1sU0xKRzdWNXVjUTJzUmFhZkMzdm1H?=
 =?utf-8?B?b3FkYVc0MWhWdUhPdmhBcUZta3pDMWk0RXFtdERJMzhTL3QrQUtDSzlSUUN1?=
 =?utf-8?B?YkN3aEE3KzlqWGNER2lUbDlpeVB0NGNvbTZjVEpNUXBQN0E5b3hDQ04xSy9s?=
 =?utf-8?B?dW8zV3ExclI0bVFrcTlaSzdRNnBlMFhWdWFXdy9aaVZ1R2VrUTNyNU82c0Yv?=
 =?utf-8?B?MnZlRXBPQnJCRmxKVFBiRE92Y24rNEdBUjN5d3dLbyt5QkpoajgrOVpNeWVH?=
 =?utf-8?B?bml5a29FUUdkR0JnVXJteEV6UDQ3MmdTZWlhYlAyU2p4alJZNUZab21iWHZZ?=
 =?utf-8?B?SFpjdGlLUndoZnk2eG96MTg3a0hFckFXMjU0dEZTdXFXLzYrczVQaUJYd2Iz?=
 =?utf-8?B?NTllUTY2cmhDM2hlTXAxWmNSYzhkamluL3JmY0hhU2VWUmpuejNQN3ZsNld3?=
 =?utf-8?B?TVNBdFJwYmdDZU1WSXJ3UUpJZWJwZzd6ei9tOWFiRHZJK3hOYTNub0NDczIv?=
 =?utf-8?B?d3lmMi9QMzFkU1hCRTFQOEhweVlSRkxyQ0YwdjhvMEdwVkdhU0NpT1RWTzRa?=
 =?utf-8?B?UUlyTjFwbUdhWklLaDMyWWQ0QnhwTldjSnNFdGlrQTFFYURWWUFRQnNVTm5k?=
 =?utf-8?B?MERZSWl6d1FBRVkwczBaZEVvTUdvanhWNUQ0WTlHME95VWpUeCtCQnBLcXZ0?=
 =?utf-8?B?TFNuT0doOHJ0SjJseUdDT3lQSStoWnFQWFZjQ1QzUDRRdkI5ZGFQLzkxZFRM?=
 =?utf-8?B?Tnp2ZjB1SUlYVHFvdnJIV2E0eXNiTllXMzdIS0s5eG1iNG4zMC8wUzZhTjhP?=
 =?utf-8?B?bS9Xd0lTS1hJeXlNcjZadjA3akJZOXZ5RkJnSm5lNzZPYy83ZC9Qa2ZyR0ow?=
 =?utf-8?B?bkxkV3BDT3YrTEJPVUFkNXVBWitPNmxqbEZVd3pIT3pIbVgvTk9EZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E6F7E9602567043A96FCB5E46D65CCB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	PnZizUNQYx50x+A/0i1o4oMDXqv3JVeFwmrT5T30TqkqXL7xkHA8VQwtwYex+LKR5cpAgVaihfqdW74e5HyhkQqYJaaqvVK+aJV2zxKfBZcm4cRqvI4lTbzdTkVxnOUg6Haqbs21XxGZSPzHb0rWcNlJZ430MT8uao0KyJrAywnucioFzLBVzZpD6t3p2LISMeF7A99g4wkn8pswisdhgimMU6uLLjLfqLRyqOnmIhXbAUTl4QNP1Oj+NVWmcvymP2VGDASDZGFsWWm0qgfwqGtQlYANoAZjcsFpQbbg+d/67Z1jBjTf/3ShABaHbjHeb0tXksKpHE77hHRyVl7pcw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2Gx/nylRaURDXva0oI8Y1Fawi8yxeg9wvBa9ZX2EgguJ2Eq90QDhUpXoxQEmNwT64cuh24nj3IzbBPS8P1N7Hjp3MuhjXNnxDsf10o/lGvr3qEPM2bj1o5ABh1OuH1oFKfaBIJ5vqG+d0Q2Lp/zXuuoY2YeGuqMt1hIX/CzZ3wZgdxR3yA8Qi9MALgfAdj2bReNFg2xIngJR/NvcYkLc15aU0fVbGVlYTQcUMprcdTnIl6ZVPo1eRtcRXExn12bpzBvoODoPQBVw3yhYpdKlaUQlfIKCHZSAkhJgkddW3W/nDCiaXdKLTU/b8+eXeOvnFRAVv7/WVZBWJ9+b0xIX01wmD/Qe95OdIg/pguLe7oqS2yvGPVyCMG4uEoFICNswqhPBlFwFkDOV6GhRB9YEMAQElE4EKq33c38aZQOXbFD63B8qwbqYMVX0mOEtVc2InkouV0vo23rAjHKwmfbW91fHmPoQtE00dD1psD+q8BfyU2iWYavA0fxctzhxjn0JZx1y/BaZpCFjT0bYpvdUMDqp3kT9hgypLGJmL6xpDpRkyW8xyo8UHS0Bt1Cc/gyFMyBoDLKE9acjWUKNGvncvocE3+sk4VzEFdHXbsDGvWeYvrNAqxEqAj000YtR7mZ7mo3JV6NCX7S4QwOJ9spvSw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 230310ea-9a7a-4055-2c3c-08df24df76d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 01:57:09.9642
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o1Un8f7ZlujkB/n0a/Xvs60ZYB6xL+f599SHPQKeqwYcoVPuDJm/LbbNyXq2CBY36TRzutaRNrkoIdVD22SAwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4342
X-Proofpoint-GUID: rw-aNSwf7Mpkt7G2XvGSVH7a5y0-xTOD
X-Authority-Analysis: v=2.4 cv=fPysTpae c=1 sm=1 tr=0 ts=6ac6f87b cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=EUspDBNiAAAA:8 a=pf0Qq_9rFXbfnQlsLXMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: rw-aNSwf7Mpkt7G2XvGSVH7a5y0-xTOD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAwNyBTYWx0ZWRfX+q/FmL1yKXNV
 Qjstm4zdYx6k5CV+bFdhhl9zYDIG8MHN5Q1Q4+0UgI/R2Ac8S9MsCItZwPe+ydkh69TdsS0nccW
 AWAXMtodvc5dzfhtx7UK6U1bRSN9kKU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAwNyBTYWx0ZWRfX7BW+Y44FvlVJ
 FnsMDF/pOOqyD4GKMIa9dS0Qrc0eeD47EK0rXjl+GQEZUjbqlrblmZHsCwa2BWPR84SOJI4bamQ
 lGRS4dkBRRuoPuALTUIB/+UO3jI1yqL5GUZLvoCf8hEPu7rDz+PIBRr89vhLdKDWr2vRmKw9oZs
 QtaYNszQLp8R62U3vwyxB7Qazac+BsJJE0c4/upGwNVR2sV5L3Qi/AxweLOtqRJ7wdVVbg5D2ge
 9QIhuVmhGf6S15MaOitabLqXyeqI1hLTakwTTQ5OBjs78H86gRJRBcOd0DZMk+qA77L7wwUE8QO
 CgAluIOa68zat/PVI8Q8EazwJTqRNnpAManjdbpYcVR1VMeayHE2+IWCvRPvsCF0MBKemKXtCPv
 yyyMlb7tgOTexsYrivVfz/+Uk77c3a+oIOh6oLa2WNS0WzRMzM5kI1A4B1jOb5QXj3yRrMtSubZ
 KtJ/59k/KP/yCxJG/5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610020000 definitions=main-2610080007

T24gV2VkLCBPY3QgMDcsIDIwMjYsIEVsc29uIFNlcnJhbyB3cm90ZToNCj4gDQo+IA0KPiBPbiAx
MC8xLzIwMjYgNTo0OCBQTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIFRodSwgT2N0IDAx
LCAyMDI2LCBFbHNvbiBTZXJyYW8gd3JvdGU6DQo+ID4+IFRoZSBjb250cm9sbGVyIGNsZWFycyBE
Q1RMLkNTRlRSU1Qgb25seSBhZnRlciBhbGwgcmVxdWlyZWQgbG9naWMgaGFzDQo+ID4+IGJlZW4g
cmVzZXQgYW5kIGFsbCBQSFkgY2xvY2tzIGFyZSBhY3RpdmUuIElmIFNVU1BIWSByZW1haW5zIHNl
dCwgdGhlIFBIWQ0KPiA+PiBtYXkgbm90IGJlIGZ1bGx5IGFjdGl2ZSBkdXJpbmcgdGhlIHJlc2V0
IHNlcXVlbmNlLCBjYXVzaW5nIHRoZSBjb3JlIHNvZnQNCj4gPj4gcmVzZXQgdG8gZmFpbCB0byBj
b21wbGV0ZS4NCj4gPj4gwqANCj4gPj4gQ2xlYXIgU1VTUEhZIGJlZm9yZSBhc3NlcnRpbmcgRENU
TC5DU0ZUUlNUIHRvIGVuc3VyZSB0aGUgUEhZIHJlbWFpbnMNCj4gPj4gYWN0aXZlIHdoaWxlIHRo
ZSByZXNldCBpcyBpbiBwcm9ncmVzcy4NCj4gPj4NCj4gPj4gRml4ZXM6IGNjNWJmYzRlMTZmYyAo
InVzYjogZHdjMzogU2V0IFNVU1BFTkRFTkFCTEUgc29vbiBhZnRlciBwaHkgaW5pdCIpDQo+ID4+
IFNpZ25lZC1vZmYtYnk6IEVsc29uIFNlcnJhbyA8ZWxzb24uc2VycmFvQG9zcy5xdWFsY29tbS5j
b20+DQo+ID4+IC0tLQ0KPiA+PiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgfCA3ICsrKysrKysN
Cj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykNCj4gPj4NCj4gPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMN
Cj4gPj4gaW5kZXggZmQ1YzJjZDM2YzU5Li4yODJhODUzYzM2NGUgMTAwNjQ0DQo+ID4+IC0tLSBh
L2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+ID4+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29y
ZS5jDQo+ID4+IEBAIC0zMzIsNiArMzMyLDEzIEBAIGludCBkd2MzX2NvcmVfc29mdF9yZXNldChz
dHJ1Y3QgZHdjMyAqZHdjKQ0KPiA+PiAgCWlmIChkd2MtPmN1cnJlbnRfZHJfcm9sZSA9PSBEV0Mz
X0dDVExfUFJUQ0FQX0hPU1QpDQo+ID4+ICAJCXJldHVybiAwOw0KPiA+PiAgDQo+ID4+ICsJLyoN
Cj4gPj4gKwkgKiBUaGUgY29yZSBjbGVhcnMgRENUTC5DU0ZUUlNUIG9ubHkgYWZ0ZXIgYWxsIG5l
Y2Vzc2FyeSBsb2dpYyBpcw0KPiA+PiArCSAqIHJlc2V0IGFuZCBhbGwgUEhZIGNsb2NrcyBhcmUg
YWN0aXZlL3J1bm5pbmcuIENsZWFyIFNVU1BIWSBiZWZvcmUNCj4gPj4gKwkgKiBpc3N1aW5nIHRo
ZSByZXNldCBzbyB0aGF0IHRoZSBQSFkgaXMgYWN0aXZlLg0KPiA+PiArCSAqLw0KPiA+PiArCWR3
YzNfZW5hYmxlX3N1c3BoeShkd2MsIGZhbHNlKTsNCj4gPj4gKw0KPiA+PiAgCXJlZyA9IGR3YzNf
cmVhZGwoZHdjLCBEV0MzX0RDVEwpOw0KPiA+PiAgCXJlZyB8PSBEV0MzX0RDVExfQ1NGVFJTVDsN
Cj4gPj4gIAlyZWcgJj0gfkRXQzNfRENUTF9SVU5fU1RPUDsNCj4gPj4gLS0gDQo+ID4+IDIuMzQu
MQ0KPiA+Pg0KPiA+IA0KPiA+IE1vc3QgcGxhdGZvcm1zIHJlcXVpcmUgU1VTUEhZIHRvIGJlIHNl
dCBiZWZvcmUgc29mdCByZXNldC4gQ2FuIHlvdQ0KPiA+IGhhbmRsZSB0aGlzIHZpYSBhIHByZV9z
b2Z0X3Jlc2V0KCkgZ2x1ZV9vcHMgZm9yIHRoZSBhZmZlY3RlZCBwbGF0Zm9ybQ0KPiA+IGluc3Rl
YWQ/DQo+ID4gDQo+IEhpIFRoaW5oLA0KPiDCoA0KPiBUaGFuayB5b3UgZm9yIHRoZSBmZWVkYmFj
ayBhbmQgc3VnZ2VzdGlvbi4gSSB3aWxsIGV4cGxvcmUgdGhhdA0KPiBhcHByb2FjaCBmdXJ0aGVy
IGFuZCBldmFsdWF0ZSB3aGV0aGVyIGEgcHJlX3NvZnRfcmVzZXQoKSBnbHVlX29wcw0KPiBob29r
IGNhbiBiZSB1c2VkLg0KPiDCoA0KPiBPbmUgcG9pbnQgSSdtIHN0aWxsIHRyeWluZyB0byB1bmRl
cnN0YW5kIGlzIHRoYXQgdGhlIHByb2dyYW1taW5nIGd1aWRlDQo+IHN0YXRlcyB0aGF0IERDVEwu
Q1NGVFJTVCBpcyBjbGVhcmVkIG9ubHkgYWZ0ZXIgYWxsIFBIWSBjbG9ja3MgYXJlDQo+IGFjdGl2
ZS9ydW5uaW5nLiBCYXNlZCBvbiB0aGF0IGRlc2NyaXB0aW9uLCBzdXNwZW5kaW5nIHRoZSBQSFkg
ZHVyaW5nDQo+IHRoZSBjb3JlIHNvZnQgcmVzZXQgc2VxdWVuY2Ugc2VlbXMgc29tZXdoYXQgY291
bnRlcmludHVpdGl2ZSwgYXMgcmVzZXQNCj4gY29tcGxldGlvbiBhcHBlYXJzIHRvIGRlcGVuZCBv
biBhbiBhY3RpdmUgUEhZIGNsb2NrLg0KPiDCoA0KPiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nIGlu
IGhvdyBTVVNQSFkgaXMgZXhwZWN0ZWQgdG8gaW50ZXJhY3Qgd2l0aCB0aGUNCj4gUEhZIGNsb2Nr
aW5nIHJlcXVpcmVtZW50cyBkdXJpbmcgY29yZSBzb2Z0IHJlc2V0Pw0KPiDCoA0KDQpNYXliZSBJ
IHNob3VsZCByZXRyYWN0IHRoZSBzdGF0ZW1lbnQgdGhhdCAibW9zdCBwbGF0Zm9ybXMiIHJlcXVp
cmUgdGhpcywNCnNpbmNlIHRoZSBiZWhhdmlvciBkZXBlbmRzIG9uIHRoZSBQSFkuDQoNCkZyb20g
d2hhdCBJIHJlY2FsbCwgY2VydGFpbiBQSFlzLCBwYXJ0aWN1bGFybHkgdGhvc2UgaW50ZWdyYXRl
ZCB3aXRoIGENCnR5cGUtYyBjb250cm9sbGVyL1RDQSBtYXkgcmVxdWlyZSBjZXJ0YWluIHN1c3Bl
bmQgY2xvY2tzIHJ1bm5pbmcgc28gUEhZDQpvcGVyYXRpb25zIGNhbiBiZSBleGVjdXRlZC4gT24g
dGhvc2UgcGxhdGZvcm1zLCB0aGUgUEhZIGFuZCB0aGUgdXNiDQpjb250cm9sbGVyIG5lZWQgdG8g
Y29vcmRpbmF0ZSBkdXJpbmcgdGhlIGluaXRpYWwgc29mdCByZXNldCBhbmQNCmluaXRpYWxpemF0
aW9uIHNlcXVlbmNlLg0KDQpTbywgSU1ITywgd2Ugc2hvdWxkIG5vdCBjbGVhciBTVVNQSFkgdW5j
b25kaXRpb25hbGx5IGJlZm9yZSBldmVyeSBzb2Z0DQpyZXNldCwgZXZlbiBpZiBpdCBpcyByZXF1
aXJlZCBmb3IgYSBwYXJ0aWN1bGFyIHBsYXRmb3JtLiBUaGUgZXhpc3RpbmcNCmJlaGF2aW9yIGhh
cyBiZWVuIHZhbGlkYXRlZCBvbiBtYW55IHBsYXRmb3JtcywgYW5kIGNoYW5naW5nIGl0IG5vdw0K
cmlza3MgcmVncmVzc2lvbnMuDQoNCkJSLA0KVGhpbmg=
