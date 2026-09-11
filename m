Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A627633AD85;
	Fri, 11 Sep 2026 23:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169990; cv=fail; b=oZXSUlSA45aGSvXFjz0poBtKvUtRAOt1/55W23uIY6zW8FJurTmvt6/iOsoJVZGmxIYKVVGYCDyApkhrP0NogscXhErLDbKcE654Pzz5S9xOzL5XKELeIMbid9X6vMrwVReQREP966KuYfT2k5Qvu5UBqHMrmA+V1YXOjlGqM7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169990; c=relaxed/simple;
	bh=5ubq1isocTPdq9jWgYMEM+4oPQ9kgVV9eqZlzJ86yKc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p0vWS1K++zQGa6OH5pquCZCmhwe3Mq4Uk+YliiyxIuJXyFYiH7RIzq3kGl1E6ZF+ZMMFFJphvpaCoU/A2dgcjYo81BzK4pXjgoPZulAV+uss3ic+EDqhG36UnBtb5Obw1xnyJaCIvx3f7dt9XX5X29B4yqxRn8n+xrSNGtEAisQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ROaXbCSZ; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=LNYDIMwv; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JVNIXPnJ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ROaXbCSZ";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LNYDIMwv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JVNIXPnJ"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BMiRwt2329231;
	Fri, 11 Sep 2026 16:39:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=5ubq1isocTPdq9jWgYMEM+4oPQ9kgVV9eqZlzJ86yKc=; b=
	ROaXbCSZUkdJL78zdjTaOVJpXgfFNaxR7f9ssyUMc2yAEvhqJXIeRhmiLjK/cn3W
	0bh2+zBplIeuhHm05pQw8JvAl+UgG5ncPC0Y8Gfa1AugdzdHey3AtajI5C0DDSt/
	xv0iLQEFsi8LKTV295JyJjUmF/45Agn4g/i61Izw1tD+uIL+aHLuz90HKq2zYnHK
	CLuvy4rvj0SM4F5wQEex61HqXYm1qJfY8c0ft6IlCDnN+h8+GeGv7l1BLT6Q/MUm
	Wlv9ju0kWVpoxQd/+tPKHKbj+sNVNo3oQWz3udasPd+dA3kDMYGlSEKgy9+ob//k
	oBk29YHUqBJlRBZrhEochw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4gmrj4h2fw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 16:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1789169973; bh=5ubq1isocTPdq9jWgYMEM+4oPQ9kgVV9eqZlzJ86yKc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=LNYDIMwveKi5pFBhDej/pTj8gs0Ht1YjKq+9IvWeV7IXCvZ/QCNlGErFf7papEGkf
	 Xlo3/7T4ZPqqS9oHEXon1+0vcW4LPio6r35zhG3ab30tEpxiMsydVH4CsBNWQGQnPl
	 dj46XjvuOGM4f/gK2MM4YNRsfF9gqcZdl9OIcWQfJwKsDzNIxGWhB6dKLDtfVTrobr
	 p0Ac30FsrRUXSkLu7ZZAoTmg+TJUzo6Mo2cdb40KAoxVaOgPeZPEWzvxV7t79wlUHM
	 kDWJb6YPtFRT3MjFN6if/NjGHCNfZ7G5Ad5yhCQex108WuhI72UxqCCaKCkKh8CKzl
	 D2j0lHd2a0qaw==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 20A70401A7;
	Fri, 11 Sep 2026 23:39:33 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id C2D67A0068;
	Fri, 11 Sep 2026 23:39:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=JVNIXPnJ;
	dkim-atps=neutral
Received: from DS2PR08CU001.outbound.protection.outlook.com (mail-ds2pr08cu00101.outbound.protection.outlook.com [40.93.13.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5B7554024D;
	Fri, 11 Sep 2026 23:39:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYFsxxoaxpwilJdNqBwJYWAHYS2qM/dHtd++QeeXHgeTP3nYPBhG7QaK95lC55SjQAYUJZfw40UdNDD+wNiTaJoTL8Oi5F27ymN47TAhJt3TiHDUTM/b0jpxFJFmP3i5vEcympjOwHrPVx5WgsGM1K12BtRGXCRhY/WUpWKrT5bUOIrpNI1MR3P9RkCLFCZ+yfs8QzjByuDpTO6OYgg28r78Br88hVnNyeqOikQ/6+OuXa/6vKHTOC4T/5NuKfKIXgEz++i+lupAhUTND8w8BR7+FnuBzj3MIcEPOzChr04al7F8ockQfuQwO26D5K3fjo2Lxv0lZ04d3wDY3Kgm0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ubq1isocTPdq9jWgYMEM+4oPQ9kgVV9eqZlzJ86yKc=;
 b=IGSBa03xiQW7Go8QKQ0eexFR7EfmXVOFVa46oK87vbDPKnw5sDoRTRt2bfvZPAeviuH+O8JscVrRuXAfSa/PCj9PgHMg3oMtUMvFMHH+cgCFNEoQbUyFTC+XYomi3ciXX/A/bVqPO00kMAhpa4YUbQBvByrRAkFtOzkFsbtDl8UNUIHUBwQaFsLezQMEoEBrtfGBv30pxDneV4HzQSO0VqMxnOew+9uZihUgidbdR0wDtgiUPL1rrHAjaajVu938RYPkQUF3ao1QaBSleA4Sdg7LYeTb4f115s8o38hay/5ifFcYMhB1JycAPom+FZ5BpXa2CJh35XFJ9dYJCdIs1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ubq1isocTPdq9jWgYMEM+4oPQ9kgVV9eqZlzJ86yKc=;
 b=JVNIXPnJYF245ztdjzrvjy0Pmis/TVBo5ttJz3MSoou2PXY3MB1thdrfhrZrhXLGly841H429S2IhIs4uEw+Y1XOyJlvYtKF9WQS2SqgWfQRALQZQceHivMAjlkN0q61eKvwS3R5iwrnc9zWqvFD1TV1kjzJF/PKatpSnaxuAgU=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by PH8PR12MB7327.namprd12.prod.outlook.com (2603:10b6:510:215::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 23:39:28 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 23:39:28 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Cole Munz <Munzzyy1@proton.me>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] usb: dwc3: gadget: don't error on dequeue of a
 completed request
Thread-Topic: [PATCH v3] usb: dwc3: gadget: don't error on dequeue of a
 completed request
Thread-Index: AQHdPKgQ+cX+KZ58+0ydJDDAkiBvpLa/EX0AgAAI/ACAABY+AIAAC2yAgArYHYA=
Date: Fri, 11 Sep 2026 23:39:27 +0000
Message-ID: <aqSLGvMpw62nrToQ@vbox>
References: <20260904161344.2191362-1-Munzzyy1@proton.me>
 <2026090406-unrevised-stays-4832@gregkh>
 <7bef11b63feb88f89b37bbc86323ed3dba794f43.1788541086.git.Munzzyy1@proton.me>
 <2026090413-hurdle-puzzling-aadd@gregkh>
 <a0cdcd76b7a6a3c841b7957a2b761ae71ceb46fc.1788549031.git.Munzzyy1@proton.me>
 <aptTU3JD0xPMPmfL@vbox> <20260905000240.2267367-1-Munzzyy1@proton.me>
 <aptrIbp-p6RNGd9X@vbox> <20260905020310.2277320-1-Munzzyy1@proton.me>
In-Reply-To: <20260905020310.2277320-1-Munzzyy1@proton.me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|PH8PR12MB7327:EE_
x-ms-office365-filtering-correlation-id: dd0e2fc3-2e0e-4787-f0f7-08df105deb98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 A/y5SwyhxTHlM6mZtGtoW0NG0CkltJ/n6LZLAbAYNoWauLPNtoKNhzBefxL94/FMQHAwz64+VyV0uG5D+lrQsIHTZ5ZA7/wkzYpKHvO3a4icISxWINTmeQYL9pzVMSCmbEe1DeSxl9yyZskesHcdep0lJb5EKf4NyO0gByqjwQULgth6u0rlq8FtrvU0B9xV/nU8LXd7sBxsDWWRebEFgobQdwNT+/JzGUbfKidxKBlze11h0VQRQKYevhYf/k2Cau157MtvZt/S2PqMs85WGJv7A9hEwxrnPwx5QrFmtf2ab2xWs0/jxMneQI4BeIgyX5nKzBrjLKwQqJx9kMDTP869FxoldCglIGBSEPkwqnhWLY7LboQMs2+ZrlBIzXLNWUrB++retzdoxGFi3OSK6O1iwqcGYMPM3iRZLh8GhUKjYXB+D+7/CevEghorYsa1MDF6zTIywFphyNt8I1TWQ1bgNS86KU8WUlDntcFuCXc1Jqx7c156x0QfeGUvC9d7AtgcqbGvnz3hjd2FZGn7IlN9OaDX0UMm/QjyvGRa0ltdU0iUlbyduFWl+p7TXMsyDZ7ZJNDHTm4Q4YFczf1EZM+sqPFCOwlCBwqlS0n84WrZjCMuwwsNhN74dSxQ/HUoFYzIarjxZK/6F7MCJGG0NM7rHj8ImpqDJ1lmKWwkjSwGUepV+bkl48dUFBe12bi3hoQVFwxW+bPbuL1TN2T0p4sRI26/VMuA+xsvG4/kMfs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aGUvZk1QaXNXWlZWUkJNL3JpdEovRC9oZ01XRlpOQTAxTVh5ZW1wWkowYnNa?=
 =?utf-8?B?YXFEd1ZDYlhxWjcvN2JlclBMdFdNelVsZ2hTWVNreWc4ZE9NZWZ0Z1laVmhC?=
 =?utf-8?B?VlpFT3RCZzRtMkpOMUZvcjFuSFZtNUJ3bjVuUjA5Mm16U0RxaVp6NVpQSW0z?=
 =?utf-8?B?QWpjb2R0MWM4SEdnNHNncG4zY0hxL05GL1RLNWNQMWhuQVVuSU5SU0tUNmxT?=
 =?utf-8?B?bGtPald5WXF0ZG5CNFlDc1p2YVQ0a3VvZEsrQmlhN1g1ZVM5MGMvTksxRHZV?=
 =?utf-8?B?blEyZnA2S0ZPYXZpTm1xaUdhU3YrK3pWOGxkOWFvZjBWYzR3TVRRWG96dUhE?=
 =?utf-8?B?S3lrRUVmWmFSOFhjcGtXSDg2OUxYRFo0OWd2TWJmNlRnQzlDNmNYT1doalI0?=
 =?utf-8?B?SHIyaDhucm5BMjNUVUtSUjhlYXVVU3ZoRHp5SDdjdVp0ckdGeXlDU3RaV29D?=
 =?utf-8?B?V2dTdG9KRjRWM1ExZUJuNHh4OTdZa3ZBNHNVRjgzcyswRFJaNyswbmcxYnoz?=
 =?utf-8?B?UTg5U2VCbTRJNGx5emJ3RWhsdnl3VmtkSWNpN1lGMS9HN281dE96cHBQN010?=
 =?utf-8?B?U0FlZGVoT3ptaCtQTFpsdXluNWlaYU56V1ZONHlUYlFweGpzSitwd0RJZ2tp?=
 =?utf-8?B?cEtMa0pMNnpVMWVENWF1cGs0S2xyTE1vejhnODBLbDZPWnB5T0ZwcW9IdWVG?=
 =?utf-8?B?U0l4MENCYUxrVXc3a25HbWYxSXREVUhNb1RYQm1YeGRScUZrSXloZ1p6c09B?=
 =?utf-8?B?NG81RURXSlhSczNFcnNhcjh0VGt5Q1daeHIyazUzSnB3TmEyZW51NmxhRTU2?=
 =?utf-8?B?cVBIMUZHK2JQczZwcUpZUTVaclZSN2RWN3lDSksvQ2s0SVJHUFpKcE5TYlJT?=
 =?utf-8?B?cG9lUVdia1oyNG9OUHE0WXUremQ2Wjg4KzlwSnRLNVFjd3FlYzBXKzNDZlVQ?=
 =?utf-8?B?c08rN2hPZ0dtWmxLQ1ZQRUJnbW5FZ0FJdDRIMzdBdDA1WFBYandFdUZFRG9G?=
 =?utf-8?B?N09hOFpwUzBnYVpRdHorRWhYQ2M3bmtVK3NBeXNrWmprRmhQd25hNnRwbWVx?=
 =?utf-8?B?TFhPMk5NZjV5WU5lVWdBUU9PeVBiaVgrWnVXdC8raGhQYTExcmlNZHVid2tj?=
 =?utf-8?B?NWdadk5kSTFCdDBrY2lNOVZLQzRCSnQ5Um1xTmJvVWg5NmNYMjhydnpUVmYr?=
 =?utf-8?B?eWNEdE5DclhGQTlXUG5VRVcrS0hWejZPQ2hJNFF6ampJM0laR3VwOWcxdjBq?=
 =?utf-8?B?VG5pMXZHT05rMXBKY0FCZUhFVStEZS9WL1h5azN0K08rZk90WmV1NDRKcU5V?=
 =?utf-8?B?TTluZ3J6MS9TVDZPSTU1RVpNbGxaQjZCMzFjNVJ4WkZBNUE5dDk2K3E3WVNS?=
 =?utf-8?B?YXEwMFd6TW56ZTFZM09XT3k1UVV6aEVVc05ncTJISnczeG1TSEpUOHArOHhs?=
 =?utf-8?B?SEcwV1FDWGh5a1JTaW8zUnQ2NzMramdoWlJadEFSM1V0S2w0VURvZTB0OXFu?=
 =?utf-8?B?VXJPdmE1ZDcrRGJEOS9mQjZielgwOTQrT0dLUFluN01JalJtQnZOKzN0djk5?=
 =?utf-8?B?WlJlTXNjcDlzeWVEU3RVeXQ4aDFFeGdQazI0WmRjSGszSzZ1OWxnY3Y0OFZM?=
 =?utf-8?B?amh2Z2VKcjhWNWJQSUk2TFZMMytUMUM4M3BQZjltazZJcjZLRlpUNEFRakFT?=
 =?utf-8?B?cm5GU2s0S05zOEcvR2pDRmRSeDJLWjZwWmlLTmFwTXh3RWFMOVRXV2JNaWdj?=
 =?utf-8?B?QkdFRG4xVWRqR0dPbklkc0o2OEdWWWtmeWRZRWJqSktMLzg5NTVFeTV3QTdt?=
 =?utf-8?B?eUxDeGorQU5lc1lLTHFHZHlVRVV5L1R3M0VaTW0ySlNLdURiTGpSc0NidEwv?=
 =?utf-8?B?ZHNsRWVCbWhBdkNtQnBhV25RU0JCNTJEVEQ1T0lBREJXd2dlODFXMzZtQ0dU?=
 =?utf-8?B?N2FzRVJRVkRWM1F5S0F3RkdPQ3NBNW1YN1ZrRnFScjNsVTg5ZldBc1ZuZmNW?=
 =?utf-8?B?SDFNUVFxdFJmcUd0RUVaR1BuRCt1TEhBZHg1dFNkQW9uSHcxdm9wVzdrTHpB?=
 =?utf-8?B?UnlnMi82VHpsK2JON3dVTzVXRTE3TStEZDYyeXNoVlBjTVovK0t2WFJpbS9s?=
 =?utf-8?B?WjNnRnpzVXFMSFJxTE43b3JGOHRScDlZQzlnRnZQV1J1VGVwb3dsWkpoWTls?=
 =?utf-8?B?Nkh0YzFiZWJuSlREZ2dwWi9oaTVWR0tIYUk3QWZlL0R6QkNUVXptaXM3d2ds?=
 =?utf-8?B?dlRYTk5KVzJCSEVwNWhxOU4wWk1hSWEyWHViWVdLb3NtUDlFRGtuL2F0MFky?=
 =?utf-8?B?M2RyRXhpUFVNeEFFVXFJUUdFa2ZxTVo1UkkwdVJOMlBWU2ZRTiszZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0134E6AEB121F41BC0B0745BF71AB04@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	VONHyuG4+Za8ery75trPMphaRQuWN54a/lyY+K/TFE5+eNfFueN+5XxckgEwEhn/mD/FNXRYCkusqr6PNYAOx7PWoOPH1glwb5nJyeYDT5XgUYFi9CxmvA8W1kClCxLL3Bxfntn/N/KsdgB3JVJSXfGN+IWf6RDS1P/KBlqeoiUvQNGJWzewth5JjeFLChuoC/FVfabW2GPh21x8+aBvZudwKbrsUScLqOoSRZHBHhdNMet3Cy/RFb1f4AbsXvtynyxdNfjxJ+wu0Fip9aKbSHtyxxlXXdcVoSZEAUMZaaCMXal6e/y1Qlwfmr9wyQysDBjqd+t/FP4F1jMspa56/w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LkZtQGO/AhutG+TjUbMcSEZZ6mHCAvXSQ8ahjJ6NrgNIYqevGYCABxLbfER61aeJqbZenOSyJ/Ma9u6tu2x8sDSBgeysk+dr5uvVyI0MZn6IMyaqgQVsO8z+TcLtNZQn2wz9nYuZdxHuX0YErwRfJ8Oso501eYaDvnUQ/Z40s3fzECH7MKaLxUKKrzza0awfKLiqQqmHqxe5cJe6+Y2FyE1KpA2bLuzwqBj3X4pC+zhjHTzpfCzOIx3xP7GAo+x9X0MImV2pePy8caV8IHmBWg/Opr+plC6L0Bvz8NNk8K1mLsRTMGJcSFeSCyf5zfiawr0z3orW6z/UwgkB4Nwl4jkSsffgHOleSg7l2dEsKKN/IbmqFXNFd2EaRISW2l+K1lfEfSLWRLI3QfOLP0gbZevYLTOXUiLkS4FWtTqwQ6YI1Csvk8eqzyUJ+6iERlnOymzavR9b0EL2qNywbvTbySnBoU4l7H5c14rg6E9W2bg3TbrhpG9nshKhJRRLio9Mvk6G0sXPE95Pf2KfqxEOJ86SpyFzcN4V+5axHi1HU88Fi5hcru9IdOXnN3sLUCeKOzqp+Rk73sbQZJLDKeUQ/zZo6zrC3K2DvzFL1p26O8srNwBCC0xrjhZsXvTVDeqF6mSHy4raOZp8jfj5VhjUVA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd0e2fc3-2e0e-4787-f0f7-08df105deb98
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 23:39:28.0103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XAzG0WSH1j5EyUK/3LM3lp4uB+L8UCG12iVyTIEax0TD3VuJjYtfcbKTckY4yIJ25MBcCUnxdIX6wkFuwR5KCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7327
X-Proofpoint-GUID: YPN4SFo6WWGOqL25EUTT3EEpfqQ3zC6D
X-Proofpoint-ORIG-GUID: YPN4SFo6WWGOqL25EUTT3EEpfqQ3zC6D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDMzNiBTYWx0ZWRfX4mVcLdv9Y0ao
 20h+Mo8Wxr0GQz/6VvNtU5oUOUP//yv+tRgJYVJj2d6TGBmdEe1tEteCC5KnjYHS0Ti3t4SiWbb
 rSpbom4A4IKaewFSAw4FAyDGTmISgGnqO7CL/H2T7MqhZnVqXOSFONIUOIWkQ2bVU0S1E/TQAcr
 vFCBKVa3O7hX7NRcSk6QKLN/9qy/rUXnrXAofgSi5oOqAijeSF1U3g8jNxfQrFoER+JybLOP86V
 Qy7gzfp+ABN9Fnhb7ynd3wrbEXAF0pe00hvjlVPccanHZSF1rL+VZdyAyQCTLWQJ5ulReyMIGIF
 ZqDXedQCGji1El7wLh4R+BDBf0jD5Pdll7S60UOKVqzKgADLViVkF/m8Pl8U3lbIoto8fNBhGGH
 8vThIGLTOzT3V5SDrQpuzuMXN2yVbQHTiNB+FyTDtNgfXHa3wbN/5JD3QaNkVl3Sckp+Bs7N8Wz
 y3rwhhUPN7W09tZbxMg==
X-Authority-Analysis: v=2.4 cv=E+lYNqdl c=1 sm=1 tr=0 ts=6aa49136 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=Z-J_oBoaSRksqEDQeNUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDMzNiBTYWx0ZWRfXwiSrhKD2GUwT
 GLExsuVlfKBX6J0IGpiMioUEsY7qZx9gjk/m9SIczr8A1MAAzTylHD6xkobliBOlqApqSDDAmEZ
 9dyJK/JNQvxn21/9VHfzD7uRz91U3nI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609110336

T24gU2F0LCBTZXAgMDUsIDIwMjYsIENvbGUgTXVueiB3cm90ZToNCj4gT24gU2F0LCBTZXAgMDUs
IDIwMjYsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBXaHkgaXMgZnVuY3Rpb25mc191bmJpbmQo
KSBjYWxsaW5nIHVzYl9lcF9kZXF1ZXVlKCkgdW5jb25kaXRpb25hbGx5DQo+ID4gYWZ0ZXIgdGhl
IHJlcXVlc3QgaGFzIGFscmVhZHkgY29tcGxldGVkPw0KPiA+DQo+ID4gVGhlIGNoYW5nZSBjZTQw
NWQ1NjFiMDIgbG9va3MgbGlrZSBhIHdvcmthcm91bmQgZm9yIGEgZGlmZmVyZW50IGlzc3VlLg0K
PiA+IE1heWJlIHRoZSBmaXggYmVsb25ncyBpbiBmX2ZzIGluc3RlYWQgb2YgZHdjMz8NCj4gDQo+
IFRoZSBkZXF1ZXVlIHRoZXJlIGRvZXMgYSByZWFsIGpvYiBpbiBvbmUgY2FzZTogdGVhcmRvd24g
cmFjaW5nIGFuIGVwMA0KPiByZWFkL3dyaXRlLiBmZnNfZXAwX3JlYWQvd3JpdGUgaG9sZCBmZnMt
Pm11dGV4IHdoaWxlIHRoZXkgc2l0IGluDQo+IF9fZmZzX2VwMF9xdWV1ZV93YWl0KCksIHNvIGZ1
bmN0aW9uZnNfdW5iaW5kKCkgZGVxdWV1ZXMgYmVmb3JlIHRha2luZw0KPiB0aGUgbXV0ZXguIFRo
ZSBnaXZlYmFjayB3aXRoIC1FQ09OTlJFU0VUIGlzIHdoYXQgd2FrZXMgdGhlIHBhcmtlZA0KPiBy
ZWFkZXIgc28gaXQgY2FuIHJldHVybiBhbmQgZHJvcCB0aGUgbXV0ZXgsIGFuZCBvbmx5IHRoZW4g
Y2FuIHVuYmluZA0KPiBmcmVlIHRoZSByZXF1ZXN0LiBJbiBldmVyeSBvdGhlciB0ZWFyZG93biB0
aGUgcmVxdWVzdCBjb21wbGV0ZWQgbG9uZw0KPiBhZ28gYW5kIHRoZSBkZXF1ZXVlIGlzIGEgbm8t
b3AsIHdoaWNoIGlzIHRoZSBjYXNlIGR3YzMgY29tcGxhaW5zDQo+IGFib3V0Lg0KPiANCj4gZl9m
cyBjYW4gdGVsbCB0aG9zZSBhcGFydCBpdHNlbGYuIGVwMHJlcSBpcyBvbmx5IGV2ZXIgcXVldWVk
IGZyb20NCj4gX19mZnNfZXAwX3F1ZXVlX3dhaXQoKSwgc28gc2V0IGEgZmxhZyB0aGVyZSBiZWZv
cmUgdXNiX2VwX3F1ZXVlKCksDQo+IGNsZWFyIGl0IGluIGZmc19lcDBfY29tcGxldGUoKSwgYW5k
IGhhdmUgZnVuY3Rpb25mc191bmJpbmQoKSBkZXF1ZXVlDQo+IG9ubHkgd2hlbiBpdCdzIHNldC4g
SWYgdGhlIGNvbXBsZXRpb24gZmlyZXMgYmV0d2VlbiB0aGUgY2hlY2sgYW5kIHRoZQ0KPiBkZXF1
ZXVlIHlvdSBjYW4gc3RpbGwgaGl0IHRoZSBkd2MzIGVycm9yLCBidXQgdGhhdCdzIGEgcmFyZSBy
YWNlDQo+IHdpbmRvdyB3aGVyZSB0aGUgZG9jdW1lbnRlZCBiZWhhdmlvciBpcyBkb2luZyBpdHMg
am9iLCBub3Qgbm9pc2Ugb24NCj4gZXZlcnkgdW5iaW5kLg0KPiANCj4gSWYgdGhhdCBkaXJlY3Rp
b24gbG9va3MgcmlnaHQgdG8geW91IEknbGwgc2VuZCBpdCBhcyBhbiBmX2ZzIHBhdGNoLA0KPiBD
YydpbmcgVWRpcHRvIHNpbmNlIGl0IHJldmlzaXRzIGNlNDA1ZDU2MWIwMi4NCj4gDQoNCkkgZG9u
J3QgZmVlbCBzdHJvbmdseSBhYm91dCB0aGUgcHJpbnQuIEp1c3Qgd2FudGVkIHRvIHJhaXNlIHRo
ZSBxdWVzdGlvbg0Kb24gdGhlIGZfZnMgbG9naWMuIERvd25ncmFkaW5nIHRvIGRldl9kYmcoKSBp
cyBmaW5lLiBUaGUgaW50ZW50aW9uIHdhcw0KdG8gY2F0Y2ggZ2FkZ2V0IGRyaXZlciBtaXN1c2Ug
b2YgZGVxdWV1ZSgpLCBub3QgdG8gZmxhZyBhIGZhdGFsIGVycm9yLg0KDQpUaGFua3MsDQpUaGlu
aA==
