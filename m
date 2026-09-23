Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E3723E325;
	Wed, 23 Sep 2026 00:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790123087; cv=fail; b=iGxlV63T7vuP7NXE3xW5DHrOzpawnlBoBTCMCLNuymhP1iSXziHaRaGlVG3L1jHGDD5VgD/Dbe19NMDlYWFoiHQz41tGXNc07VcAdrVGMlT5dAeRcPV6NX0Rbx58YRwq/QTdZxv1+iu4s+gHPRp40perX22CnXiyYjyWFm9Iuj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790123087; c=relaxed/simple;
	bh=JTsF5i2kPMTFPobE+7q4tjGVZmiluA8+O8KysAYg2tA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XXQHei2LQ/muL+uxgq/a/nhvycEULrKJgWh6/cEpMF/ikKJkbtZBsugsKyijmcXEtFqXJ7HOiHqlLksagjbmWwHoCWW2uzk7geWVU4eYc9HYE9A/Oe1UvPjKDa/hQNwqXC9UZVuXiwV408csUtJiIRa6Cs6Epqx192xmH2qvykA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NlBPo7Ml; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EYeOGiZg; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=RzwKJM/6 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NlBPo7Ml";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EYeOGiZg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RzwKJM/6"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MK8sFN2631264;
	Tue, 22 Sep 2026 17:24:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=JTsF5i2kPMTFPobE+7q4tjGVZmiluA8+O8KysAYg2tA=; b=
	NlBPo7Mlnk8H0nJm1zt5yc0QFLxKvlwR4Ue0CcvkRYhBYghTNv31XKTE5vWy6BiX
	iSXwQrd++9JJ3n2BuOSwsGTyX1qfW6Cq9vGFgYbXYVSpQ/0W5JdCL0XM6xCwxPoH
	Jnqg0LPwBdXW2PRNsHf5hMLgfD1hcCpq8tH3T89q2tM41K+4LIR3L8LUTKWN3EBc
	UGmS21iYzYPNV7qzdUVBScyJWCAUXWRZ3IMUGIcB8Chhrl5/n7A5Aj5Vl784JK9S
	GoIKz/WXhhHdJwZ3zxxIB+xjB3NtbfK4ZRUMzXRZfii1XDyKdPojaw5kIakF0Phr
	hSbX+VUir7POhoiONfmDog==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4gur5dp8ks-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 17:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1790123081; bh=JTsF5i2kPMTFPobE+7q4tjGVZmiluA8+O8KysAYg2tA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=EYeOGiZgHvaHWkgF19gjPcsrV6trveN+6D2x/lfLXZyK3XOqCG3OgucEYDed6CwK6
	 MzVCghEN6Hk13TtPwHXErkgwTPmoBrwUZ271tuBg+MuoRDOsl9G+j3lcM79MBwzH+a
	 /02MiMVAaCZ6ypQfypOwC5NA0bKmMs3K9HkEKG00KfYkvkV1hraexfprplVIzMhP0h
	 1idgjiENrSDaogHqDMUoQr6MwvaxVX0wi+KHDIuemUT5ONNLAdWwuYR5/i5/HZjWgt
	 lHtuCTjThKPGAdwyq0VcdTQUK2UA+HP3EmxTXlVeWPGzab1W1dmA0Tr0rPfEl2Lk7A
	 0Api5pDhNI4Zg==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 77E084014A;
	Wed, 23 Sep 2026 00:24:41 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 380F8A009A;
	Wed, 23 Sep 2026 00:24:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=RzwKJM/6;
	dkim-atps=neutral
Received: from SN1PR07CU001.outbound.protection.outlook.com (mail-sn1pr07cu00102.outbound.protection.outlook.com [40.93.14.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id BDFF74019F;
	Wed, 23 Sep 2026 00:24:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dp3p9LgOX4dqEdg18y90P8dvp4agERRe4BWegX24nry/e+ReQfCNcYzAiPI6eZL0zm97f1OZx4SCKyKxrS1DCuvfyNiI/Fbze9BoRw09HqyeKgoK/TbUiw494zBG3Wgulf5+EPFWYQ2NeAulqx3YTuBNzQ1no4VanDjAsjvFZ39rTUHoB12avQycv97TDqaEt9qEmSMnYRbsTD4rb/cvWDWa2RmjjSu97gHjwbgFRQhhTZdD52UA5PfzpsawwCDd/Fk0Q8vHQan9iMH5iJRMtkv2VZ8vhH4ycxNi9gjr7uZv5ZeDi4RSUiy/G9Mo0ysrxa5/chyeJBpsQKbfyOMikg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTsF5i2kPMTFPobE+7q4tjGVZmiluA8+O8KysAYg2tA=;
 b=nNufuhCbOUSpNa/5++B/D+YyJzXlrdtasUXI1xKDsU4Ird6GkzPXwY4bOB/Oak6lAcfxBld8co7XQK11F5JXPGI6XowAJYcZXTk+ZDgJwdGFVbYSeyh8f2kZ4t40U694cAalAd5PiZW/CN++wvfKeQ8VOOMdaa59T/VxiIgWUKu8umcT8fgbyFKKNtdy+lj0aT55S/zYuBzeKRXz7EJ4BirJrdXR9wMchJfGRKP6tFvVL5ty7gDGqBEodFuswlpvTgwdw+fkhdSsLSNVkbgRKlwksT+CsnXVQl202rasWaMnj8fY7vBObhH8QX6aB28usSgbgkGP3Vg4csRxdiwu/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTsF5i2kPMTFPobE+7q4tjGVZmiluA8+O8KysAYg2tA=;
 b=RzwKJM/6toL0CncC28pBxYk4lbq4Ir6JJXStycCSzL80IoqflEqQz4sJmXF3CYZ6BMEepOPAs/9L5gnm+A/HGJmnJ+19vTSwhhOwZmgiJvEsBnt0IGJFpo5CnUC/jJFG2cmu6mGjpAe8s08PHBJeIV5I2d69KjPMv/CE2UniYrE=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by PH7PR12MB6610.namprd12.prod.outlook.com (2603:10b6:510:212::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 00:24:32 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 00:24:32 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: qcom: Add support to skip phy management by
 USB core
Thread-Topic: [PATCH] usb: dwc3: qcom: Add support to skip phy management by
 USB core
Thread-Index: AQHdRFZratS3qUgi7kaLbxbprWu8q7bbWyCA
Date: Wed, 23 Sep 2026 00:24:32 +0000
Message-ID: <arMcL9HjfkCDNOHS@vbox>
References: <20260914-xhci-skip-phy-init-v1-1-9c46b31a5a39@oss.qualcomm.com>
In-Reply-To: <20260914-xhci-skip-phy-init-v1-1-9c46b31a5a39@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|PH7PR12MB6610:EE_
x-ms-office365-filtering-correlation-id: 6672e641-d63b-4629-b95f-08df19090a1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003|4133799003;
x-microsoft-antispam-message-info:
 uBlDZNcBNh95E6+xcloj8ZtgjrJpL1kU2cWcfNZu9NbYiRKRlO0M8kb/0QGtgkHbRO8zQkY+sOgt450OzyvXYdZZc+psJhzDxkmDivS2NCiUIF3px2/rX7FRqFLwo8gZfmPy5MMUZnFrHTQKsjcrZDY66sogbmfTXWoNHPVYmHEu16sipcfkuG1V6qjwbHsCVCj9f136fbcGKsQAoaz9Yv5lENc2iNKILW0ogAziubMhRgrnJGMH07IvLT9h59ykXU9ELdUQmrBUb4TrHfXRTDZWKaa5wAinU432bBIy0z9U9CBlg8BWYzd31BmhzmNjkOrG2cw311/9A6LSTp5AHA+IZICZqz2FaD1wsf1DEh60zsBa4HhyI5N4thvbHZEr3vgGQX4nu3pDpAzanPL8ISmsAL2intZ/IOK+19qgpUFI9PRwaQsa0pkNj5CeK95NeTX2VlO1+5p4oIb7rVIuSQ39OzgNbAuxldpu/toyZzwk1sxIVxxd4Y+/X/5nMn5CZ6KWnHPhIIPC6YuFwv+FBqQa7ETqPHgAZqBO8xRXNPA32860kXly1b232NDMLY0tCFYE0p0A1bfALnHxHAfb5BZW9apYNRZiUn2rIaOx2BzJqxydNwf7RC56rh2FUnL/MgrGU1R5I3rKkiaoM+Ww2jWp3TgRTQtgww8D/f+6B7/hCzzJXmuIffeJno+VdZ+nYpciad6lvnEcMvFVx+WGe1E5vQbjS4CSXsivr8SK/Yk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003)(4133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WmdqYnFBZEZlN3Y2UUN6TTJEc0h6emExK01tdTk4YmRnVlhJSjBiU2xqU1pB?=
 =?utf-8?B?N1hmdG9wRlpmc3ZPNThoVlJNbW8xT3JqS0IydVlUQjlCK0d1UW96Z0dWOFQ3?=
 =?utf-8?B?eUVjRHRlUkUrRG9vWWhRYjZiMUFWTDN0U3hwUGJtRk9mRDJaSHlrdmZJZEs3?=
 =?utf-8?B?b0wzQU1FVGc4N0VTNzNPbGRrZHVFcFdrREl4QWRCQnRIS2F1QkhzOEZUemlH?=
 =?utf-8?B?bExhWUc0S2lmbkMzUCs3MDJnbkM2bzVhamlxSG56SU42aDVJOWJuQk1rZmxQ?=
 =?utf-8?B?cHczcmtaREcvc0xvZnhneWg1OTlzQWRKQm9zZm9MOVgrR1UzNDNpaFVKSHl3?=
 =?utf-8?B?cVUrRDhRdld0eWRYTk5OTjBYeTZWVktZcW9SOHBlb3FLbWRVSlljbmNBODdN?=
 =?utf-8?B?anFsbVdDbTNuQjdvNVMxT0YvbnA1UnE4cE0wUlJWZ1lEd2N5bUloa080bllq?=
 =?utf-8?B?UVV2UlhnVkx1U2tpTVhObjZtbE1HbUtFeU16a3g5Q1c3MDRlelVwTGxTeS91?=
 =?utf-8?B?SU5ZMmZGNGhEU2djNHhnYy9EeXVMRDJ2ZGNTL3BJRTRxKzZqdzh0citVNmh4?=
 =?utf-8?B?UDduNTYyME1XVzFpN0xVU1RLWkJFSlBiU1EzY0IrUk5saFd0c3J5U21MU2hl?=
 =?utf-8?B?SC9qK1RJbm9YSzAzczJCRFZFSWM0aFk5dUNRZ2RyWC9GTXF3dytWYVRLdnhr?=
 =?utf-8?B?ZnFZcXpMRWpUVjlueEJPd1FlYy9QQUUrMkFXRWQ1WGlwQjdwN0VSdjdsbUxB?=
 =?utf-8?B?NVJydGIvYTZpRmxjZ3VCaTRENHpNaUdaY29vaitkYUtJbEZmOG5TTjhNd2xk?=
 =?utf-8?B?dmZhdnBwdzRMUld1c2ZhUGl5YkxMUDJZcDI2d1UzS0ZDeXY2MkNRL0FKUHlr?=
 =?utf-8?B?U1krWCt5NDZNeGxQaVZHWlN1RTkrNzByd21rNTZtaGV5WHhaRGlLRUJhTnVm?=
 =?utf-8?B?TWxRMTBvMjl3dW80aUdJajFxUXc4Nll0YjRuTWk2ODBvNUt0VHh5MGt3bHhF?=
 =?utf-8?B?eXIyamR3N3J0VTA3K2lTZWVFdkIyZHpXNllvZVVZYUdGM1RQcytpSU5aSHE5?=
 =?utf-8?B?cWJoMlpZN1F6RTQxOU94eUFVWXYwSGl5M1JYVU5LTGRhTTVQaWtBQmdrb05R?=
 =?utf-8?B?UjErZzcvQ3VVem50LzJvYWFpai9zVWs3SWJDcTBHZmNabVdIb1R0bHF6VHVl?=
 =?utf-8?B?d2RKa0xGYWUwdXJVc2xzUkpyaStDZXRmSWtGaHpzc3pqbXhoWEJ5a3hUYTJB?=
 =?utf-8?B?b0lTbGVkSTBPU1g2aFJmWG42QXRYSFU2Q0E0RHR6RCtHdGdZaWphYzN1OFRw?=
 =?utf-8?B?bjFaVDFDRGhKVXkyTkdKVXkyRDNlLzQ5VG5JWFp2SDlJK3NFcHp3MEpUVytI?=
 =?utf-8?B?ekovTDVNRlN6Ky8yc0dCVkdxTkU5d2xZUGZ6cFJWTmVZb2NMT1ZaUjBPQytj?=
 =?utf-8?B?UlJ0c1lTV1QyVFZ0Ymh2aUxLcVJWbFpJM3BnUHNGRTBOdEEwOWdtQU9LU3Vy?=
 =?utf-8?B?b2pIVzFZU0c1eFJ1RHVoZllmSmZPalJXWVEycmxxR01UT3JjbFJFbUtkaXdi?=
 =?utf-8?B?eFAwaDlXUEhTV3NURU9tdWg4OE1Eclg5T0sycDU3TVVWMHRDZXJNOHFJSE1o?=
 =?utf-8?B?SGR1dnhlUVpPaVN5Z29KaW9YYit0WFZVUnZwUDhmcGNlSnptSU5BVWs5d3Bp?=
 =?utf-8?B?QUU3cm92MlgxZC9tdGV5bnpTMFJ3V0lTQ0gzTVlubUVBQW05WUFUVHY1OFIx?=
 =?utf-8?B?WW1MQ2RSblRNUUVmQ1BuZmZQNTgxakJVYXFTdHQzL1lvalNFdEJ0dXhqUFlj?=
 =?utf-8?B?UG8zOVJFejNzYUNEQVQya3dFdFlncys0UndnQVU3aTZGTm1HNkJ3Sk9vSXp4?=
 =?utf-8?B?aHg3YVMySFdnY3hRa28vSnVMTU8ydFpUY0p2Z2dqSDNHcWJMbmtvVTlmOTZz?=
 =?utf-8?B?K2lQaXdzeHk5Qmovb0NVYTZuazBKWUZ4cjVtdGlxQ1JEbHl6TVlNc2ZwWlRK?=
 =?utf-8?B?dloyMGNKUmM0TU11QlhZTXBRczNUVjRQSUJ1OWFJeE00ZmdROS9tKzkwN0xJ?=
 =?utf-8?B?K2FqMGFkT2Q1TUcxeVRpcnNVM1BRZWRLbjVrMXRoZ0d0ZDN0c05lOFdLU1lC?=
 =?utf-8?B?N1U3Z0o4Y0ZZMCtTV2g2Mll3c1gzYmxxVDUyWXhIbGZ2S3FyQkVBNGxsajNj?=
 =?utf-8?B?TzhWcDZ6OUE3ZC9oTkRrSExhaVFxZXA5bCtxWGNjT3JnSFdYcTRqTWs4QlJx?=
 =?utf-8?B?bEYvellNdE11NnJSbmFVa3F6aXdLOHNmTkxJQXE1Z21PQkxEVjVuYlZMQVdZ?=
 =?utf-8?B?MUFUaS9rcGhrb3Q2VEtYa3QveXNwbkhIeDhreW5iLzBmUUpUdjZBZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1B0C22C8F88A748857F941CE7EEF15A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	M1MeWbfk2QXYuUE9N6ZMC4yhZES1d/cPo5YBHTd8XLsw6cR7nK7QONWSiBZ5YvXJxvdPj+UVipeDxrK1n86fZ2T4aJ0HzGS/0JYl8pO3GKPLT0StgTsDWzbe7Vb6gVya6BfmnSi3rYBF4OlMPLxngeWFHO1LOz/TFzkCTeAbE8o+jWefTOatVZXDubSVThnYiypOwuufjh9rDaw6nZLg8nGMBDL5udxktCfCDaVIjcicsnoGltmc03+2Dqj7dkhuRzxezqzL+DbBLRyoG1c2IEnd4tR6Rx5AMwoGMxhZ9s57u1BxccDPjh8IDnVqGMAIcrQE0MuUZHHAmxr10tjC5g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dcBncwGtO1kGthIh1ZcyM3kvclAm4Vzqx+7yMYKtW9kVoatDR+D8+eDrO+OuVirPXmgswRF95L7rV/umpZgwpUPdG5gfBMnhp59lSWPsOiIgoeP0dUAAj4gunEOOiyb5NbxiGilMys43+5jlEUR3TGv5mxvjGCfIsYJhAsZPSQ+ZrhtChPEiabjMWkfmZ+7k0pQqB5wK8gGDtnmg+OUCBkVyPtuMsNnVQlfFUWz1s3Whp1YNAPHnIL7Q+yOe6p6u+PqiF66WTzq0zWdFC3Rt5m0rXFdXYAx5WKR1xPI+VypWnW2CubZCBTPyQZffgtmlqAdh3+/SkVZCrAtoLceEVQAJOwm9t7NTMCDbbHgdUg4dGDdepXblzhTJHIA49BwJC5TU4id0yXwat15jRX/r/LyFSZjinTiQGoJyetz5oA42nHF5XZ9nX98udXpJV+QIvE+Lyfhcwu7k7RuCYF0Zp1a5V9akTJ163zVHTpi4UQXVEiuarwarERo2q3nq9Cfxt1HEuh0zZ8QcmYddM+hx/YH0Q0YDWaAlh3Gn8CkF1fEerCnjzGqRUmvQ55Pd2hUd25DgCUCn/SNpvp0y43ynH6+QEm/t3ho/dYxJJ4rCgPz41RcSoJ4cSGneGQJljacwzNnH6jYtnM2aBudaw/C2EA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6672e641-d63b-4629-b95f-08df19090a1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 00:24:32.4791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qehnIr49blFJa8zOYaGo1PSuKtzbsKEhFb1Yy//jt3sVi8/Y5wccWkbjsy22tJu7EisZavJWpcKZmKaGI/xWNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6610
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwMSBTYWx0ZWRfXycuNB/qM7UuM
 /b0gEz97NdzyEjlP2yQ1fTQ1T7Atgfow6dLiGFYTcD4//AyGyAq6/M59Ax03E1jX5vvBuwwBWZS
 snBwZx1srCzp/XBN0KMYABhmspBIVmx6Aj5d6BZ+aeZ+MJrZlkCtxnylO37jFhHRoQJKeNziF5S
 S2KjgIisJQFDYOd8X0ytymbT+kUVJAADycQgRJMQvCn1bOF0EZYYmlaMKdZ8GrPos+jDdOqfUyp
 WFjBo35JZX+LfXhVDA8BTsjuHngo6wvEmnid/tqNgKq0uPvzxjOycf8ilXWsZ6gYeKu8JT6bYCA
 u0gjnrbM4GayI6hUo7W44gE6tCzUj0cZuE8KHsExHCy8nlLHCmDn4DVyj2EtwwHnlSkLlY8IsIQ
 MSMRLbtW9jDOYM8+jkJA6ksU8NjYN8jUTD7SwlaXqmzLRt+KbMRFjkj2XT9XHpu5zTHUkOta8Hy
 Dk1Fk1Uxq6enB3tPRcg==
X-Proofpoint-ORIG-GUID: H-ivfUce6qbq4XwTBCYvEh-cSJdEJ7fO
X-Authority-Analysis: v=2.4 cv=eN2GH3p1 c=1 sm=1 tr=0 ts=6ab31c4a cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=SSMhxyUL4Z0of2rK0PMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwMSBTYWx0ZWRfXw6EhYnEc9jqF
 TvEq+UFIfkYVFn8imgV4Sczq02mfweWwdtzElV3g9GlUvs3ylUGncZ/PytYhqkNDlRkOwONlV6k
 EWPdpvAUzOj/EskcyeAMNnyRVd6mRp8=
X-Proofpoint-GUID: H-ivfUce6qbq4XwTBCYvEh-cSJdEJ7fO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609230001

T24gTW9uLCBTZXAgMTQsIDIwMjYsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IERXQzMgZHJp
dmVyIGRvZXMgbWFuYWdlIHBoeXMgaXRzZWxmIHN1ZmZpY2llbnRseSBmb3IgUXVhbGNvbW0gcGxh
dGZvcm1zLg0KPiBJZiB4aGNpLXNraXAtcGh5LWluaXQgaXMgbm90IHNldCwgdGhlIEhDRCBjb3Jl
IGRvZXMgYSBwaHlfaW5pdCBhbmQgcGh5Xw0KPiBleGl0IGlzIGRvbmUgb25seSB3aGVuIHJvb3Ro
dWIgaXMgYmVpbmcgZGVzdHJveWVkLiBEdWUgdG8gdGhpcywgZHVyaW5nDQo+IHN5c3RlbSBzdXNw
ZW5kIGluIGhvc3QgbW9kZSwgYWx0aG91Z2ggcGh5X2V4aXQgaXMgZG9uZSBieSBEV0MzIGNvcmUs
IHRoZQ0KPiBpbml0X2NvdW50IG9uIHBoeSBpcyBuZXZlciBkb3duIHRvIHplcm8gc2luY2UgSENE
IGNvcmUgYWxzbyBkaWQgYW4gaW5pdC4NCj4gY29uc2VxdWVudGx5IGNhdXNpbmcgcGh5J3MgZXhp
dCByb3V0aW5lIHRvIG5vdCBiZSBjYWxsZWQuIEhlbmNlLCBhZGQNCj4gc3VwcG9ydCB0byBza2lw
IHBoeSBtYW5hZ2VtZW50IGJ5IFVTQiBjb3JlLg0KPiANCj4gU29tZSBFeHlub3MgcGxhdGZvcm1z
IHN0aWxsIGRvIHJlbHkgb24gVVNCIGNvcmUgZm9yIHBoeV9jYWxpYnJhdGUgY2FsbHMsDQo+IGhl
bmNlIGRpc2FibGUgVVNCIGNvcmUgbWFuYWdlbWVudCBmb3IgUXVhbGNvbW0gcGxhdGZvcm1zIG9u
bHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLcmlzaG5hIEt1cmFwYXRpIDxrcmlzaG5hLmt1cmFw
YXRpQG9zcy5xdWFsY29tbS5jb20+DQo+IC0tLQ0KPiBJbml0aWFsbHksIGEgcGF0Y2ggd2FzIHNl
bnQgYWRkaW5nIHNvZnR3YXJlX25vZGUgcHJvcGVydGllcyBbMV0uIEJ1dCBpdA0KPiB3YXMgY2F1
c2luZyBhIGJvb3R1cCBpc3N1ZSBhcyBtZW50aW9uZWQgaW4gWzJdLiBIZW5jZSBhIHJldmVydCB3
YXMgc2VudA0KPiB0byBmaXggaXQgWzNdLiBUaGlzIHBhdGNoIHVzZXMgYSBkaWZmZXJlbnQgYXBw
cm9hY2ggYXMgb3Bwb3NlZCB0byBhZGRpbmcNCj4gc29md2FyZSBub2RlIHByb3BlcnRpZXMgYW5k
IHdhcyB0ZXN0ZWQgb24gc204NzUwIG10cC4NCj4gDQo+IFsxXTogaHR0cHM6Ly91cmxkZWZlbnNl
LmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDcyMy1kd2MzLXNraXAt
aW5pdC1xdWlyay12MS0xLTk3NjgyYmI0NGViZEBvc3MucXVhbGNvbW0uY29tL19fOyEhQTRGMlI5
R19wZyFmdGc0Z2c5b0dsMkF0RDk0ZmRSUnFESW9xdUtJZ0g2bmw5dzlJYktvbWotUU8yeUI5WTQz
cExIQ1QyZlhoUTBJU0FqVEhhTmVRSEllSnF6Um1NTmM0MXY5MXBXMjE4SmFhZEhnMHckIA0KPiBb
Ml06IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvY2JiNGFlOTQtNzg2Mi00ZDkxLWIwMWQtMGQ3ZjE4ZDQ5YTQ1QHBhY2tldHQuY29vbC9fXzsh
IUE0RjJSOUdfcGchZnRnNGdnOW9HbDJBdEQ5NGZkUlJxRElvcXVLSWdINm5sOXc5SWJLb21qLVFP
MnlCOVk0M3BMSENUMmZYaFEwSVNBalRIYU5lUUhJZUpxelJtTU5jNDF2OTFwVzIxOEtDV1g0R09B
JCANCj4gWzNdOiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjYwOTA5LXhoY2ktZml4ZXMtcmV2ZXJ0LXYxLTEtN2NjOTdmYTBmMzA3QG9z
cy5xdWFsY29tbS5jb20vX187ISFBNEYyUjlHX3BnIWZ0ZzRnZzlvR2wyQXREOTRmZFJScURJb3F1
S0lnSDZubDl3OUliS29tai1RTzJ5QjlZNDNwTEhDVDJmWGhRMElTQWpUSGFOZVFISWVKcXpSbU1O
YzQxdjkxcFcyMThKVEJyX0V5USQgDQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmMg
ICAgICB8IDMgKysrDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCAgICAgIHwgMSArDQo+ICBk
cml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jIHwgMSArDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2ds
dWUuaCAgICAgIHwgMiArKw0KPiAgZHJpdmVycy91c2IvZHdjMy9ob3N0LmMgICAgICB8IDUgKysr
Ky0NCj4gIDUgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jIGIvZHJpdmVycy91c2Iv
ZHdjMy9jb3JlLmMNCj4gaW5kZXggZmQ1YzJjZDM2YzU5Li5kOWY0ZTQxMDlhYmIgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMv
Y29yZS5jDQo+IEBAIC0xNjk0LDYgKzE2OTQsOSBAQCBzdGF0aWMgdm9pZCBkd2MzX2dldF9zb2Z0
d2FyZV9wcm9wZXJ0aWVzKHN0cnVjdCBkd2MzICpkd2MsDQo+ICAJaWYgKHByb3BlcnRpZXMtPm5l
ZWRzX2Z1bGxfcmVpbml0KQ0KPiAgCQlkd2MtPm5lZWRzX2Z1bGxfcmVpbml0ID0gdHJ1ZTsNCj4g
IA0KPiArCWlmIChwcm9wZXJ0aWVzLT5za2lwX3BoeV9pbml0KQ0KPiArCQlkd2MtPnNraXBfcGh5
X2luaXQgPSB0cnVlOw0KPiArDQo+ICAJZHdjLT5nc2J1c2NmZzBfcmVxaW5mbyA9IERXQzNfR1NC
VVNDRkcwX1JFUUlORk9fVU5TUEVDSUZJRUQ7DQo+ICANCj4gIAlpZiAocHJvcGVydGllcy0+Z3Ni
dXNjZmcwX3JlcWluZm8gIT0NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5o
IGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gaW5kZXggNjA4ZGFlYjdlZjEwLi5iNzI4Njkz
ODA5MzMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+ICsrKyBiL2Ry
aXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+IEBAIC0xNDIwLDYgKzE0MjAsNyBAQCBzdHJ1Y3QgZHdj
MyB7DQo+ICAJdW5zaWduZWQJCXdha2V1cF9jb25maWd1cmVkOjE7DQo+ICAJdW5zaWduZWQJCXN1
c3BlbmRlZDoxOw0KPiAgCXVuc2lnbmVkCQlzdXNwaHlfc3RhdGU6MTsNCj4gKwl1bnNpZ25lZAkJ
c2tpcF9waHlfaW5pdDoxOw0KPiAgDQo+ICAJdTE2CQkJaW1vZF9pbnRlcnZhbDsNCj4gIA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYyBiL2RyaXZlcnMvdXNiL2R3
YzMvZHdjMy1xY29tLmMNCj4gaW5kZXggZTZiNmJlYjM4ZmNiLi41Mzg3NjU4ZGQzOGQgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gKysrIGIvZHJpdmVycy91
c2IvZHdjMy9kd2MzLXFjb20uYw0KPiBAQCAtNzM4LDYgKzczOCw3IEBAIHN0YXRpYyBpbnQgZHdj
M19xY29tX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJcHJvYmVfZGF0
YS5yZXMgPSAmcmVzOw0KPiAgCXByb2JlX2RhdGEuaWdub3JlX2Nsb2Nrc19hbmRfcmVzZXRzID0g
dHJ1ZTsNCj4gIAlwcm9iZV9kYXRhLnByb3BlcnRpZXMgPSBEV0MzX0RFRkFVTFRfUFJPUEVSVElF
UzsNCj4gKwlwcm9iZV9kYXRhLnByb3BlcnRpZXMuc2tpcF9waHlfaW5pdCA9IHRydWU7DQo+ICAJ
cmV0ID0gZHdjM19jb3JlX3Byb2JlKCZwcm9iZV9kYXRhKTsNCj4gIAlpZiAocmV0KSAgew0KPiAg
CQlyZXQgPSBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIERXQzMg
Q29yZVxuIik7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dsdWUuaCBiL2RyaXZl
cnMvdXNiL2R3YzMvZ2x1ZS5oDQo+IGluZGV4IGQ3MzhlMTczOWFlMC4uNzJjNTU5M2U2NTdhIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dsdWUuaA0KPiArKysgYi9kcml2ZXJzL3Vz
Yi9kd2MzL2dsdWUuaA0KPiBAQCAtMTQsMTAgKzE0LDEyIEBADQo+ICAgKiBAZ3NidXNjZmcwX3Jl
cWluZm86IFZhbHVlIHRvIGJlIHByb2dyYW1tZWQgaW4gdGhlIEdTQlVTQ0ZHMC5SRVFJTkZPIGZp
ZWxkDQo+ICAgKiBAbmVlZHNfZnVsbF9yZWluaXQ6IGluZGljYXRlIHRoZSBjb250cm9sbGVyIG1h
eSBub3QgcmVtYWluIHBvd2VyIGR1cmluZyBzeXN0ZW0NCj4gICAqCQkJcG0gYW5kIG5lZWQgZnVs
bCBpbml0aWFsaXphdGlvbg0KPiArICogQHNraXBfcGh5X2luaXQ6IHNraXAgeEhDSSBQSFkgaW5p
dGlhbGl6YXRpb24gb24gaG9zdCBpbml0DQo+ICAgKi8NCj4gIHN0cnVjdCBkd2MzX3Byb3BlcnRp
ZXMgew0KPiAgCXUzMiBnc2J1c2NmZzBfcmVxaW5mbzsNCj4gIAl1bnNpZ25lZCBuZWVkc19mdWxs
X3JlaW5pdDoxOw0KPiArCXVuc2lnbmVkIHNraXBfcGh5X2luaXQ6MTsNCj4gIH07DQo+ICANCj4g
ICNkZWZpbmUgRFdDM19ERUZBVUxUX1BST1BFUlRJRVMgKChzdHJ1Y3QgZHdjM19wcm9wZXJ0aWVz
KXsJCVwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvaG9zdC5jIGIvZHJpdmVycy91
c2IvZHdjMy9ob3N0LmMNCj4gaW5kZXggYzU2NzQxNjFiMmIwLi4zZmI4YmU4YmU1OTAgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvaG9zdC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3
YzMvaG9zdC5jDQo+IEBAIC0xMzAsNyArMTMwLDcgQEAgc3RhdGljIGludCBkd2MzX2hvc3RfZ2V0
X2lycShzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgDQo+ICBpbnQgZHdjM19ob3N0X2luaXQoc3RydWN0
IGR3YzMgKmR3YykNCj4gIHsNCj4gLQlzdHJ1Y3QgcHJvcGVydHlfZW50cnkJcHJvcHNbNl07DQo+
ICsJc3RydWN0IHByb3BlcnR5X2VudHJ5CXByb3BzWzddOw0KPiAgCXN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UJKnhoY2k7DQo+ICAJaW50CQkJcmV0LCBpcnE7DQo+ICAJaW50CQkJcHJvcF9pZHggPSAw
Ow0KPiBAQCAtMTc0LDYgKzE3NCw5IEBAIGludCBkd2MzX2hvc3RfaW5pdChzdHJ1Y3QgZHdjMyAq
ZHdjKQ0KPiAgCWlmIChkd2MtPnVzYjJfbHBtX2Rpc2FibGUpDQo+ICAJCXByb3BzW3Byb3BfaWR4
KytdID0gUFJPUEVSVFlfRU5UUllfQk9PTCgidXNiMi1scG0tZGlzYWJsZSIpOw0KPiAgDQo+ICsJ
aWYgKGR3Yy0+c2tpcF9waHlfaW5pdCkNCj4gKwkJcHJvcHNbcHJvcF9pZHgrK10gPSBQUk9QRVJU
WV9FTlRSWV9CT09MKCJ4aGNpLXNraXAtcGh5LWluaXQtcXVpcmsiKTsNCj4gKw0KPiAgCS8qKg0K
PiAgCSAqIFdPUktBUk9VTkQ6IGR3YzMgcmV2aXNpb25zIDw9My4wMGEgaGF2ZSBhIGxpbWl0YXRp
b24NCj4gIAkgKiB3aGVyZSBQb3J0IERpc2FibGUgY29tbWFuZCBkb2Vzbid0IHdvcmsuDQo+IA0K
PiAtLS0NCj4gYmFzZS1jb21taXQ6IDdmNjljZWNiNjA5OGZhZGE4N2IwMTBjOTExYWE3MzZhNWFm
OGY2NzkNCj4gY2hhbmdlLWlkOiAyMDI2MDkxNC14aGNpLXNraXAtcGh5LWluaXQtZDBhNmJkOTZi
MTNmDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IC0tICANCj4gS3Jpc2huYSBLdXJhcGF0aSA8a3Jp
c2huYS5rdXJhcGF0aUBvc3MucXVhbGNvbW0uY29tPg0KPiANCg0KQWNrZWQtYnk6IFRoaW5oIE5n
dXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmg=
