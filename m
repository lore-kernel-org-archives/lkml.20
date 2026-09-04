Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEFF3C943F;
	Fri,  4 Sep 2026 23:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788563486; cv=fail; b=HINE0ft5ucbp7En2tmzqz41C6lWxRliypCShAGCE82dNwGLphZOV4+TNErg4RrsTv05vs4QSbPSZLarJtTWhp2Ok65YlGlWztuxZXCXVIkBzMqqc6DZm6tk5EFoAvbUiU5pfaZMjOIR5nyG8hWqoynkBrHUg5hLQB4W29PrDHxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788563486; c=relaxed/simple;
	bh=KmqWKYRhckKkLQI+KHH0eMPLtmsRXdxu+bL4RIFvjcs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ppmE8qAUBY10lMUAzf1TwQs8eUC9Dx6Nq8X5LtR6GaK4tJ/uZxvmeFuRou5l1i904noWgEO3R7yhK8BU1ZVV2OVWFOesuGfSCDX3NJLuJZVa8JfjcRm67F4oLbofmrukTJaqQFeurIZLjdZ5TLEtJfI1Xql3k9d2oyjp9nPLGHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=mYsO9rTM; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=l9jZYfLQ; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=pBMWSpXc reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mYsO9rTM";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="l9jZYfLQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="pBMWSpXc"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684Kd1TW3795104;
	Fri, 4 Sep 2026 16:11:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=KmqWKYRhckKkLQI+KHH0eMPLtmsRXdxu+bL4RIFvjcs=; b=
	mYsO9rTMwyIb0MC1a6MDMorSL9HHPyueAU5oWPjEvCP3G1MsI6lAgYmlIYe6CH+J
	eoeQAQ7cy7Ron1n1tH7tTrLLDH2vVn6WnkduJ4X6fjwMOpeNdh/5wFvZILftJoIV
	il+LngYZemv6o9gzpizRkzO0QUk46NE2bj/VzrkW/lMQsVbv8ZAKsK/3lJYk+Ssu
	A+Ooxm+7OUiE94SsGyVpKrqVUGUs7JHvXvwxTJMAmHYGUTJSawznziLQVmRcTNlC
	oe5ulQA/7tVc6A2NSpRZBonfVAMfYV7l/MzIVMPgRY7MT/t0O0TEgV19xZ4d0CVl
	epE/tqBMSd1H/GQLpKcJyQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4gg076bvya-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 16:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1788563461; bh=KmqWKYRhckKkLQI+KHH0eMPLtmsRXdxu+bL4RIFvjcs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=l9jZYfLQyvq2ws2mz4kaXL30Xfs95DH6jY3F4FsN3gWn2aqLQOCwvwA9/RV7Vlk9Q
	 KSD9bHmreEFNfRSEPDd13HDEmALvmllNCHeas90v/vACDEun05IfyT8eoKuNA8sWQh
	 yViebdB73vFGRfkjG0B5zCNE7fVHT6JefsmqUTp5XizKXnBK3J1hPZbikcgIu2eWuO
	 6L0xr51xAAcRpUH5np1eVvcO1RNWtv0JnsAeD85mw5c8yJI5+BTI9poAGKvKzEUL9i
	 sdbb1LOrXfqOAW1INPTcoFRJ4Ih8ejAbTG+QtuSn2HgDzvaupCYTmky3p3Q2nHpSwA
	 i7SRhzCQJShfA==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 143B94035D;
	Fri,  4 Sep 2026 23:11:00 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 7237EA0079;
	Fri,  4 Sep 2026 23:11:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=pBMWSpXc;
	dkim-atps=neutral
Received: from CY3PR08CU001.outbound.protection.outlook.com (mail-cy3pr08cu00101.outbound.protection.outlook.com [40.93.6.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7283E40082;
	Fri,  4 Sep 2026 23:10:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fG275p+S/ZDyZfyYk62jjV6JFga8lV/+XuwSqXAiy4IdWpUQiv3REtN8rTJtAG83vW+N7ZuIvBKaRiJpL3u5frfpKfHpSurj9o7gmblkcAw2161p4hf9HZJo+XViMvwgy0XxvObPFqXAj02NPDfRhnyzq9s129xYpeRYYpOvC4TIFRVXDi5iwEs46xwLmIFfP/Nv/tv2dbM7dOomWfzlOPUrIW81sgLwsAH69a3Kj7dLWPfF6rDMsMsPo2CuE/u40pfvPVD65pvT+K+bj3FXbosOXueq2Hs2qUs86gWBPVhA56OyBZzqW1Xp3bHCyz4mqgHUFgtmILAAOF+jqdda7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmqWKYRhckKkLQI+KHH0eMPLtmsRXdxu+bL4RIFvjcs=;
 b=uPyu+dqB6cVDCPb/ejhooarVhWCDp+pmg2dXdHiA+V8zjwig+aXMzkpexDke3hbFUXn8qk3ufB6L+u35T26LuhAWv0LS1oamrt6lHURMGBtloI59bQJzFs4nU8C51u4T5sW2xW24AmNOOYqrGm8CMyPP1gijAkTd2VmZzQIcpU7WJoxZ6WL3GDIBCRxRD5j05GM3W9ZrpzV9tzjQrroo9KAcoTrOQ3ETfGlyo63WqVZVCCIBpaEo7zQR7XsTh1WEjJKE3y9CAby7lKc054UVCUcTHtOVaR9f7Pmy3Ws5HR6vYmdTMosGdtF7puwCjv9OD+vUIA74sF3sui95qVeZ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmqWKYRhckKkLQI+KHH0eMPLtmsRXdxu+bL4RIFvjcs=;
 b=pBMWSpXcvIRVusXw3Cr/lVH4ZTKWE97VZztRtdpQYW7OpBTSHjYsXhQJySL5Y8o5V/13zuECgGHAgI+G+CnN/vPav6pny3iUNlkEmQSqTJjq8WtYUg/5Vq51Z4N7Yhz1jx8ituPT5gTyaTld5PoiFskDqSJPVRx/4YvJ4P8kxKo=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by CH1PR12MB9669.namprd12.prod.outlook.com (2603:10b6:610:2af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 23:10:54 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 23:10:54 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thanh Quan <thanh.quan.xn@renesas.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v7 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
Thread-Topic: [PATCH v7 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
Thread-Index: AQHdO+uGBNvN5yv4ukWNq8N29dqOpra/DW4A
Date: Fri, 4 Sep 2026 23:10:54 +0000
Message-ID: <aptP39nVZPFLgekY@vbox>
References: <20260903213031.314473-1-marek.vasut+renesas@mailbox.org>
 <20260903213031.314473-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260903213031.314473-2-marek.vasut+renesas@mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|CH1PR12MB9669:EE_
x-ms-office365-filtering-correlation-id: 31597b96-d36e-4be0-6e5c-08df0ad9c572
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|38070700021|6133799003|4143699003|11063799006|10067099003|22082099003|18002099003|56012099006;
x-microsoft-antispam-message-info:
 heTIsnLt6LQzHvZAh+HVt9Ueb7Fk4ayVewq6HVwTskwhPiHChztmYfylBfGfJvDkA+h4B4THtd5Jn0QqihMf801522f0YqXDd7IvaH0gatvEEjoky78pK+mlGviuPKxMYg2oRvq6StZzoi1y7KyTpEgFXvkDtv3ySX1zjtuaGKeGh1gDNup7kAIj5do0gIA1/oMZAHQPX2Cp4Aaftu1Lq3JUBQj//OnGeQ0OBaHcnq/xJ188K8TMzS5mdXvHwyt9gEl5+aPgVxUdcck3rF28+xBg6iC7ZlgUSJiQ4z37eqJ/AOgOnPZF7OPzf2PI9cnZNqBDWKk6sC37zbCzB4egdFGh0JuQG5cX9B3NmmkWUHgaLKpn1lgmyTaHZkensvntiEoRJZ7Z6CKQ8EvZ1X3LerIxvYUzh0pwFVT++WY2maAR7LvujblsRiS+mV2Jy1INKDhFbE2EuV3IOjp69ZNPI1pH9EOnjMKcK/8DFj2nc6+q7Uw+OJQF19xQys2/hOYzb+eKcwr+T8gNkuvHbI7jhW4se4vurqEsKhhu+g+CYiC+x3IeWIZan21tZ2XOeFcbvYlI4XDa60ViLc2JwxMeoLbfQOEmRwSRwe2/2xtaSQHLbuGFgJ0dh1HYYjm3I7ft0bUUp4tML8/7z4Ny5a/3oNqxNopxCt+Fa2KEbLuMG4cIzoPGQemEMvOBhNz3IZnWw5roVown+0Yb5z+Nwmacl+cD+vHWxywzWyDk5q86XeI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(38070700021)(6133799003)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WDVYZlZKcHc0ZlhiTk44L2hHbDJPeDllbUE1RDJwbWFlaHR1OEpTTWk3UkFo?=
 =?utf-8?B?a0toVWZ1aTlxYkFvNnVBN1FjaXJ6Um9tcU4vcVhOYlVVTExOajRRVWJHUVBO?=
 =?utf-8?B?VzUvQzBEMEhCWVVmbkpHRkxndTlzdzBPRFpBWk9iV1hXck5lZjZzZmphbzNF?=
 =?utf-8?B?QnQ4OWVJSUdRMkFva2FMdW9nV0FRcTZaRzg1c3hieFRCRU5FOXg3d28wZWQ1?=
 =?utf-8?B?aFJHT1dwcngrUnM5djY2aHFvaXFSemlsdGs4QVVYWFBoU0M2a2xNSGd5OUVS?=
 =?utf-8?B?MEtOdjhtcVlXMUYxNU1tWXZXTHhkUWE2dGlPQmE5ZUZLanpxTnFuVmpPRlpn?=
 =?utf-8?B?Qldaa21uS0I2RDhBdGxtenU1MWhBRzZtRHJDSmFvM1d0VEIwNUZWRVNKQ2h4?=
 =?utf-8?B?WFl4eXgrdWFLVTU5Z3ZDOXAxMnFNNytXV1d2ejRSTEpuTUlseXpKM1kvNU4w?=
 =?utf-8?B?MGFaUjljTjVxMDVaVDN2WmNDSXBLQStxclo0eUpNeU5xMGlnamhxY0l2bFdt?=
 =?utf-8?B?NnA5ZmVBYkY3cFJCMVJ4MXZNUFBUdDhDMy94a2I4ZnNOV1MwbjNNaHp3VUM5?=
 =?utf-8?B?Y0VvbTV5Q0NZNkxiT2xKOVFGUzhNU0dUNnEzc3BtZXFxUTAwMnZjcUdWZ3Vv?=
 =?utf-8?B?bWtjR1FPc01HYjZXOSs0TE5TOHh0WWpvQ1A2N3hUcUlFclQzZkJ0aUwyYkVr?=
 =?utf-8?B?VEV3MklkdDgrMkVFRHdIc2xCckttcU5kNHJ0dGVzS3RUcWd5clNRWU9uYXFu?=
 =?utf-8?B?MVVDWllDQlM4MnVtVDV6NVlaU2lrYXUwSlh2M09hMGl0bXViN3RNUXdWdHdu?=
 =?utf-8?B?b1R6eVJZd2NEWDBDaGR5Y2ZnRkxBd01scXBhNXVoeVVMN0R2cGt4aTVyY09h?=
 =?utf-8?B?U0dNajB1YW5lMDlYNy9HZXFHekExNEwzc1pzOXE5aG5qQWJRMy9hcTRRQmph?=
 =?utf-8?B?V3pWVDIrcStOT0s3UktIamNhSWZ2M0ZJaHkvQlBpVlpkRmh0STFmOERYK2pJ?=
 =?utf-8?B?OWxrcXQ1VWw1VWd5OEtreGh4N2xIaHFkcjlpVjNHdlArdWh1RDE3ajd5Tmxu?=
 =?utf-8?B?dmZTL3VheE1DaUN1QjI5UUJLWEpUOTRnMEgzMmJEaWRTYXRvM0szZ243amt2?=
 =?utf-8?B?VUF1UERvRGgrWEhZM0RpZGdUTi90TkJJWGpPOUpZaCs3LzJ1Tmp2TWJWNmhi?=
 =?utf-8?B?czU0YkRGK01VRVY3OTF1U1U3b0hFa2VRTmxqMTF5T1R0ZjVVWDdKSlZVdGFZ?=
 =?utf-8?B?OWtVL3Y5TnhsWUxKbUl1UTc4NGZFZ0VIK0kya1lZcXh4MFhWeHd4UzhWZkho?=
 =?utf-8?B?VnlZRjlSRDN1THE1Z2lZeUJ5RlZEYytvZUxnZzRWeVZjbjZBbjFmc3dWUFV1?=
 =?utf-8?B?NHpQUHV6bXZqaWhjTHN1SFZWVW15Vzlsb0FQeHhuaEhxbmc3blE2RTlINTlG?=
 =?utf-8?B?QStrbDNPMUloTGFRWkcraFYzYnFyUmxzU3RBSTRqQjg1SUxoMzh6R3BTVVNo?=
 =?utf-8?B?L2I2ekszemVhWm5VZW9VTmR0TnNwNFZvblJhSko4ZGdpTFU2bDRHcnR6RGpO?=
 =?utf-8?B?cWNoL1IrWitSa2lOVkFHSWN6K0lRVUwxUFhoZXlXQi9sWWtYQjFkUmZrclBN?=
 =?utf-8?B?NDNqcVhtYUFJNjYxU3F3K0JpdTBTV2FBS3c0Y1JkclJWamwwY2FaZ0JSS3lo?=
 =?utf-8?B?bDdXeTJ3UzZaSTBsUUkzWGtISXQyaHRCVGlBRTNFMUREV2pjQ2NoaHU2cUM5?=
 =?utf-8?B?ZlR3dkp1aGNuWkZpVllodjVwMHhzT0V0a3N3bWRxV2w5ajlWOGFDU3JlYWp1?=
 =?utf-8?B?akZVN3YvTndjM2NwZHU5RlFvTm1MS3ZPUjdFRXJTNE9GL2UrUEUwdDhaaWU1?=
 =?utf-8?B?b2Vacjl6bStDMHM5c3I0UkFUUUFOK0N5bkhMUjBnU0hDQUlZTWFHZEtSZUo4?=
 =?utf-8?B?V2o4bVdaem55SG9TMll6OEw0bHJDbi9KR0FCenkxQjdRNmllZW1RR3BXcnFF?=
 =?utf-8?B?SFczZHRzaEhZa3ZDRXNuVldrRW9ReXVVTDZCcFFaTHU1eVVZbkczL2pXZitI?=
 =?utf-8?B?WXlVYWJWNnlxU1AvcFA5NUkvSXUzVGdrdE5VVEwraVhtTEVsQjhvV0NzYUgv?=
 =?utf-8?B?MTdERUpKNmJPZ21GODV0bXhBdEEvYmFEOXRPbkhxSjVNL1ZrYjdKQUVMRDRl?=
 =?utf-8?B?eFErM1dNMVdoaGRwdTVubytJL1RoNmdiQldNSUMyWGhQeXl3WWZTVEFiZkl2?=
 =?utf-8?B?K1cwRUYvcDZFM0ZuSHhSNnh6M2VoZlVqNWtKWWhvMlVZaDNWVGVoZmRyYXA4?=
 =?utf-8?B?S0RzK3R5TE5xWFF1NU1mRDdCN2lHa0trdEdQTW1uNGJkWFRBYmpWdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <17643C63F635624480490CD10697CE91@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Ws7VLJGdvkBYn+Gb2WyHA9KOmsz+CiHlqCI5glF35x0LNWGRcBY+R/JnxHs9acXeBTEMLuS/1EOSu9YDsfdIex+4WPsKPpSb45eFLOry++GKqPkEh0IMn8He4rbmi4EEmQ/Bq157HEqzmIAgIDSRbEi5fyHM+pZLL1IfZoodx9xc5xHnsNbGNUWMsA4sQCAwVxUW8GC4WijxRtJkurgkN9WdVI2baQdsnWAIdlmFF86ssBCJPhG7reYqnIP0QW2zu/MhjSMK7ADmO82U+y8kiW7WxBxGMmyTCS1vERkRpbsYg7to4EO6ay+c3mYa4LuMHF8cpPs/GlbF9MquPMOcag==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lIUihqs9WGoO/8ygLbECO7cy/Pn9w7s74FGhlGenwIOkNuN6+rR/07/UHW5iWJv2UuSA+38drvf0SyDaTQIK5/cWap7qooabzg6rP9seU+ZdwqVa2bYu8entveNHSi13CXwqQAtnVJXyDxZpH4grNPZVu/1WjT6ZpeS+V0vwkt5FQAViNuzm7DEMCyhTwPCXZW3JXGDFKtjhYqsSW1OcBmbbRhspwfzajngrH2QKnpDz5NMoTTA4NFlsFUgqB7xLoaRcVrPrzK9/vBQaxpLXlb7IgT7oP38aXfu1Neckino5AVXx7hF+/aYbduhIh99UppnkJ5Qkw1NwqTyCx72GxdukoK3uOOieRd4TUXoR2BjKxudk/jGuPx3CKFJp7KVK2AOgFn4tXn+FDbfxSqZocCzXZOd+K0UuiKh/bQVTo3p2bZhj9SOnq0HijH3GKAZo/u4/QinW0NkLRC/BIP2n31NyLTOthI0JdPav8PHuKJiw7GKntsBdhSpTckeEksz2QS2ETzqKNdeIroExwIyToCQ+yINzg2vN7MwZoE7XtKgYxsNCyxywXd8NKYGThxRGqCa/IRiYb+Xh0R3y+X3RxaHxgEdU5S/OcKZgvzTYRFxOlyepJ52LfBwUECZTvJ+09J2ZCw5V5wYe+WryUd9ClA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31597b96-d36e-4be0-6e5c-08df0ad9c572
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 23:10:54.6394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mv4w14ueczLuqFJHrZgC/la7S02vz7vC+VF+mCMnJ7uXL+aGmaznBhoGJutu0bJQ9qLKjPKU0Axw6+zC2pcNHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9669
X-Authority-Analysis: v=2.4 cv=P+cKQCAu c=1 sm=1 tr=0 ts=6a9b5006 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=yC-0_ovQAAAA:8 a=b3CbU_ItAAAA:8 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8
 a=jIQo8A4GAAAA:8 a=lxBZA_8-wvyZqx2DzZMA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDIxNSBTYWx0ZWRfX5jTd8ElIDUt7
 dNj1C0A8NR7+le77vRw4PGJ1VgK3frqKhWY3WfStBiZfKDTUTRPcHrxnya4PJMHBWZm0j1akbiz
 vQncPVWQ1XjOqfLdXUMLN25CQ8jC/bmzCmiCehqG/BulUF1oDBoRm8vlo4VmOONsIzi/YCy+MLf
 Vdjee6GKRLtj1cp52Ef/4hltgW68rioDqsaMncD7NMboMmjAMsgFwy3qJWCkEqtxcJyFHdNSqq3
 LiVZdLhxqRVP9PM5akeau1ATNFo943ZgV2gie7JYCkcYMI6waB66Op0a1NRkUqEEqFfPskv5Yjg
 9j+xE5cUA3SvgQ6a48xoi+PtPAmdHpI6SCEI+gUpK7wiEZv8U1VaDNSWRIOWolwLrYz5TxihJF0
 R6//njtnLafLiCNOl3xEqlP28U10ya0V58o3ozcpbH7NdjnXrWQ/BIde3PBBVpyZ1M1X/wEErJf
 EiQuU3UE4V2s3Q26mow==
X-Proofpoint-GUID: z0pQzheOrreYQ2jQ3tjQicf3-sryFfrM
X-Proofpoint-ORIG-GUID: z0pQzheOrreYQ2jQ3tjQicf3-sryFfrM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDIxNSBTYWx0ZWRfX8h5QNX2tUZvc
 F77t21c5Cx16aJCUiEpNI+avnbAXrvJJx3KvfzLTVZlkes+Tefq3DkAmfQLS1jv11CxNTauRDv1
 YXvCP1yGYomBWIJYIspYR4CGLFdRE4o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609040215

T24gVGh1LCBTZXAgMDMsIDIwMjYsIE1hcmVrIFZhc3V0IHdyb3RlOg0KPiBGcm9tOiBUaGFuaCBR
dWFuIDx0aGFuaC5xdWFuLnhuQHJlbmVzYXMuY29tPg0KPiANCj4gVGhlIFJlbmVzYXMgUi1DYXIg
R2VuNSBTb0MgY29udGFpbnMgbXVsdGlwbGUgaW5zdGFuY2VzIG9mIERXQzMgVVNCDQo+IGNvbnRy
b2xsZXIgd2l0aCBnbHVlIGxvZ2ljIHdyYXBwZXIgYXJvdW5kIHRoZW0uIEV4dGVuZCB0aGUgZ2Vu
ZXJpYw0KPiBEV0MzIHBsYXRmb3JtIGRyaXZlciB3aXRoIFJlbmVzYXMgUi1DYXIgR2VuNSBnbHVl
IGxvZ2ljIHNwZWNpZmljcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRoYW5oIFF1YW4gPHRoYW5o
LnF1YW4ueG5AcmVuZXNhcy5jb20+DQo+IENvLWRldmVsb3BlZC1ieTogTWFyZWsgVmFzdXQgPG1h
cmVrLnZhc3V0K3JlbmVzYXNAbWFpbGJveC5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZh
c3V0IDxtYXJlay52YXN1dCtyZW5lc2FzQG1haWxib3gub3JnPg0KPiAtLS0NCj4gQ2M6IENvbm9y
IERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz4NCj4gQ2M6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiBDYzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytk
dEBrZXJuZWwub3JnPg0KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCj4gQ2M6
IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCj4gQ2M6IGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnDQo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+
IENjOiBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LXVzYkB2
Z2VyLmtlcm5lbC5vcmcNCj4gLS0tDQo+IFYyOiBFeHRlbmQgZHdjMy1nZW5lcmljLXBsYXQgZHJp
dmVyIGluc3RlYWQNCj4gVjM6IEhhbmRsZSBtYXhpbXVtLXNwZWVkIGFzIG9wdGlvbmFsIHByb3Bl
cnR5LCB0ZXN0IGZvciBVU0IgMyBQSFkNCj4gICAgIG5vbi1wcmVzZW5jZSB0byBkZXRlcm1pbmUg
d2hldGhlciB0aGUgY29udHJvbGxlciBpcyBVU0IgMiBvbmx5LA0KPiAgICAgY29uc2lkZXIgb3B0
aW9uYWwgbWF4aW11bS1zcGVlZCBEVCBwcm9wZXJ0eSwgYnV0IGlmIGl0IGlzIG1pc3NpbmcNCj4g
ICAgIHRoZW4gZGVmYXVsdCB0byBtYXhpbXVtIGNvbnRyb2xsZXIgY2FwYWJpbGl0aWVzIGJhc2Vk
IG9uIHRoZQ0KPiAgICAgcHJlc2VuY2Ugb2YgUEhZIHBoYW5kbGVzLg0KPiBWNDogTm8gY2hhbmdl
DQo+IFY1OiAtIERyb3Agc3VwZXJmbHVvdXMgY29kZSBjb21tZW50DQo+ICAgICAtIERyb3AgZHVw
bGljYXRlIHNwZWVkID49IFVTQl9TUEVFRF9MT1cgdGVzdA0KPiBWNjogUmVpbnN0YXRlIHNwZWVk
ID49IFVTQl9TUEVFRF9MT1cgdGVzdCB0byBhdm9pZCB0cmlnZ2VyaW5nIG9uIFVTQl9TUEVFRF9V
TktOT1dODQo+IFY3OiBEcm9wIHdpcmVsZXNzIFVTQiBjaGVjaw0KPiAtLS0NCj4gIGRyaXZlcnMv
dXNiL2R3YzMvZHdjMy1nZW5lcmljLXBsYXQuYyB8IDUxICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jIGIvZHJpdmVycy91c2Iv
ZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jDQo+IGluZGV4IGNhNjlhYzBlYjA3Y2UuLjMyNDk3YWI2
ZjA2NWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5lcmljLXBsYXQu
Yw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMNCj4gQEAgLTcx
LDYgKzcxLDUxIEBAIHN0YXRpYyBpbnQgZHdjM19laWM3NzAwX2luaXQoc3RydWN0IGR3YzNfZ2Vu
ZXJpYyAqZHdjM2cpDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+ICANCj4gK3N0YXRpYyBpbnQgZHdj
M19yZW5lc2FzX3JjYXJfZ2VuNV9pbml0KHN0cnVjdCBkd2MzX2dlbmVyaWMgKmR3YzNnKQ0KPiAr
ew0KPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9IGR3YzNnLT5kZXY7DQo+ICsJc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldiA9IHRvX3BsYXRmb3JtX2RldmljZShkZXYpOw0KPiArCWVudW0gdXNi
X2RldmljZV9zcGVlZCBzcGVlZCA9IHVzYl9nZXRfbWF4aW11bV9zcGVlZChkZXYpOw0KPiArCWJv
b2wgdXNiMm9ubHkgPSBmYWxzZTsNCj4gKwl2b2lkIF9faW9tZW0gKmdsdWU7DQo+ICsNCj4gKwkv
KiBObyBVU0IgMyBQSFkgaW4gRFQgbWVhbnMgdGhpcyBpcyBzdXJlbHkgVVNCIDIgY29udHJvbGxl
ciAqLw0KPiArCWlmIChkZXZpY2VfcHJvcGVydHlfbWF0Y2hfc3RyaW5nKGRldiwgInBoeS1uYW1l
cyIsICJ1c2IzLXBoeSIpIDwgMCkNCj4gKwkJdXNiMm9ubHkgPSB0cnVlOw0KPiArDQo+ICsJaWYg
KHNwZWVkID49IFVTQl9TUEVFRF9MT1cgJiYgc3BlZWQgPD0gVVNCX1NQRUVEX0hJR0gpDQo+ICsJ
CXVzYjJvbmx5ID0gdHJ1ZTsNCj4gKw0KPiArCWdsdWUgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBf
cmVzb3VyY2VfYnluYW1lKHBkZXYsICJnbHVlIik7DQo+ICsJaWYgKElTX0VSUihnbHVlKSkNCj4g
KwkJcmV0dXJuIFBUUl9FUlIoZ2x1ZSk7DQo+ICsNCj4gKwkvKg0KPiArCSAqIFRoZSBkYXRhc2hl
ZXQgZGVzY3JpYmVzIGluaXRpYWxpemF0aW9uIHByb2NlZHVyZSB3aXRob3V0IGZ1bGwNCj4gKwkg
KiBpbmZvcm1hdGlvbiBhYm91dCB0aGUgcmVnaXN0ZXJzLiBUaGVyZWZvcmUsIHRoZSBzb3VyY2Ug
Y29kZSBpcw0KPiArCSAqIGJhc2VkIG9uIHRoZSBiYXJlIG1ldGFsIGNvZGUgc2hhcmVkIGJ5IHRo
ZSBib2FyZCB0ZWFtLg0KPiArCSAqLw0KPiArCXdyaXRldygweDIxMSwgZ2x1ZSArIDB4MjYpOw0K
PiArDQo+ICsJLyogVVNCMiBkb2VzIG5lZWQgYWRkaXRpb25hbCByZWdpc3RlciBwcm9ncmFtbWlu
Zy4gKi8NCj4gKwlpZiAoIXVzYjJvbmx5KQ0KPiArCQlyZXR1cm4gMDsNCj4gKw0KPiArCXdyaXRl
dygweDExLCBnbHVlICsgMHg4MWMpOw0KPiArCXdyaXRldygweDAsIGdsdWUgKyAweDgxYSk7DQo+
ICsJd3JpdGV3KDB4MSwgZ2x1ZSArIDB4ODAyKTsNCj4gKw0KPiArCXVzbGVlcF9yYW5nZSgxMDAw
MCwgMjAwMDApOw0KPiArDQo+ICsJd3JpdGV3KDB4MCwgZ2x1ZSArIDB4ODAyKTsNCj4gKwl3cml0
ZXcoMHgxLCBnbHVlICsgMHgyYSk7DQo+ICsJd3JpdGV3KDB4MSwgZ2x1ZSArIDB4ODFhKTsNCj4g
Kw0KPiArCXVzbGVlcF9yYW5nZSgxMDAwMCwgMjAwMDApOw0KPiArDQo+ICsJcmV0dXJuIDA7DQo+
ICt9DQo+ICsNCj4gIHN0YXRpYyBpbnQgZHdjM19zcGFjZW1pdF9rMV9pbml0KHN0cnVjdCBkd2Mz
X2dlbmVyaWMgKmR3YzNnKQ0KPiAgew0KPiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9IGR3YzNnLT5k
ZXY7DQo+IEBAIC0yMzEsMTEgKzI3NiwxNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGR3YzNfZ2Vu
ZXJpY19jb25maWcgZWljNzcwMF9kd2MzID0gIHsNCj4gIAkucHJvcGVydGllcyA9IERXQzNfREVG
QVVMVF9QUk9QRVJUSUVTLA0KPiAgfTsNCj4gIA0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkd2Mz
X2dlbmVyaWNfY29uZmlnIHJlbmVzYXNfcmNhcl9nZW41X2R3YzMgPSB7DQo+ICsJLmluaXQgPSBk
d2MzX3JlbmVzYXNfcmNhcl9nZW41X2luaXQsDQo+ICsJLnByb3BlcnRpZXMgPSBEV0MzX0RFRkFV
TFRfUFJPUEVSVElFUywNCj4gK307DQo+ICsNCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2
aWNlX2lkIGR3YzNfZ2VuZXJpY19vZl9tYXRjaFtdID0gew0KPiAgCXsgLmNvbXBhdGlibGUgPSAi
c3BhY2VtaXQsazEtZHdjMyIsICZzcGFjZW1pdF9rMV9kd2MzfSwNCj4gIAl7IC5jb21wYXRpYmxl
ID0gInNwYWNlbWl0LGszLWR3YzMiLCB9LA0KPiAgCXsgLmNvbXBhdGlibGUgPSAiZnNsLGxzMTAy
OGEtZHdjMyIsICZmc2xfbHMxMDI4X2R3YzN9LA0KPiAgCXsgLmNvbXBhdGlibGUgPSAiZXN3aW4s
ZWljNzcwMC1kd2MzIiwgJmVpYzc3MDBfZHdjM30sDQo+ICsJeyAuY29tcGF0aWJsZSA9ICJyZW5l
c2FzLHJjYXItZ2VuNS1kd2MzIiwgJnJlbmVzYXNfcmNhcl9nZW41X2R3YzN9LA0KPiAgCXsgLmNv
bXBhdGlibGUgPSAic3RhcmZpdmUsamhiMTAwLWR3YzMiLCB9LA0KPiAgCXsgLyogc2VudGluZWwg
Ki8gfQ0KPiAgfTsNCj4gLS0gDQo+IDIuNTMuMA0KPiANCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXll
biA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmg=
