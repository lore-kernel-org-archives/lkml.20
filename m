Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD747302163;
	Wed,  9 Sep 2026 01:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788918381; cv=fail; b=LObXrUjZi65wrx0YfViOeDPNLFdR0LNqCSvcFAnD3/kfmj1D+oxJh1nOithBxXVtPSdTY6ZO/Fk8K5omGwmsSPdH71wd+h/fj6UeyfmUzNvP+k+0x9JbAaAhbHTGEAg/k3E9oEfHBRLzzxS2ci97BHmBRXcQhCCy0IYA/snMH1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788918381; c=relaxed/simple;
	bh=pTJrLOZKdzEJzyWaVMqDOv4IR1vUqGfjSataysr/XG0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D+dbsJAoZ3+hu6HY4BlOGYzuU/EcTcfYLBbzHE21vc+9D7cYz4vISJ54vwxr7nGboA/k+d5lEZh3Xgqja/j+JSu7mlGO55Rw+JMdSuZ55aG49Cz3XylfGRCMSHgOpoqb4Cbewm0dKzrHyeTUmztuvk9zyiFFn0P3PDMXZG1jZFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KUqZuaC1; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=HGcRP2O9; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=H2RQO49L reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KUqZuaC1";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HGcRP2O9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="H2RQO49L"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688NkcMx3944716;
	Tue, 8 Sep 2026 18:46:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=pTJrLOZKdzEJzyWaVMqDOv4IR1vUqGfjSataysr/XG0=; b=
	KUqZuaC1qa24DQdng57qDQsO0Qo55fMvR6YcFckCjQUVYaHOb/N1k0EKYImHcYS+
	xnW6gf27EXeJwcu3xxvauWdjEvjFhksSKsO3cKendJvEmxhY0hShrff4nBKdUrg+
	IMaiDAiRLtef/9JfPZpPvLP8m9MXyKGntAjC6WddgmjUZTrawmAurEy8FbpwbSUZ
	8QMMMfk4qRtCrtPOZpvT7YSh+qN7HxmTeMocH1ihX8sdBHso9kIfbTrRN9txuFrF
	w4iIOsrZmVzh/o6NFcShSyq16ZN9hXqoBzSkVcM+rbj7wZeWzu/uiyyeXzBQU6Xc
	4NCQm8rY8WS7fQT0dlkCrA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4gjmxkcrgj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 18:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1788918366; bh=pTJrLOZKdzEJzyWaVMqDOv4IR1vUqGfjSataysr/XG0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=HGcRP2O9IMlp/F3Ayv3/RZFZGCfLzBd/pBRZB00neKUoRewATWk6NeGc9L58uJR1E
	 V3OqMi2P3NetMZyseDW85dGWSeqZO3ra3b38HSPGpXY/m1IZP8ZNzwF7/gd0Q6mmw4
	 RUB9fB483T7XN/wZe6tJx3fBKWjVs5/JExUd7zGDE9CBzh/WlqTV++gjTr8tZ/A1lZ
	 3xp7gXNoOiv6142T9MvLT0taCdgV4G7xudB01q7RMhl1JFkA8a2bqh8WfxeIO3wGHb
	 njmanG8cxr6Y4DmCZXXFh8MWHfxYJDAP4dkvBNguVM6NRQosiQ+k789yFomJF4h48x
	 fsJK2snRWwC7Q==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 788E4401F6;
	Wed,  9 Sep 2026 01:46:05 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id EE9F5A0070;
	Wed,  9 Sep 2026 01:46:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=H2RQO49L;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00105.outbound.protection.outlook.com [40.93.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 39A13405A3;
	Wed,  9 Sep 2026 01:46:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ayH9+FroVwe7CpYRvw6gQcAPxOD4MQU4k7e9UIwuHIP4sHirX4K1rIYh8Mgu4LRpGFfBfCg/8rdfc+ya13/riBquQoaSvtibxmPSRcqIu7vJ2j1bCmJ656+opOfgLMD/igLPx/a9Qob3+TGcDRpFe2/DITES/6h9VD+i1lCJKff+/lmoAIDytCrlbkhjgU8SDZFxzib7lk6vRZThQua5TUsvZOmaOxtYObI10ASMrtr1Ll6rCXX8MxRKEkMPnGUUOfDp6DF81XkfFBaq6ro3VDYUPQxBArwL4rmYcsztIt6ui0EAsaiy7eVkIkZruApOV36GrIhR1JJ1GZ8AOnQdIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTJrLOZKdzEJzyWaVMqDOv4IR1vUqGfjSataysr/XG0=;
 b=E/zxGVe0w5OMXZAa/e3Im8RVKpQNQ3sSmJjCNKJneQDwNyOxa86Tg82I+Szp1ESFtSMnen/A2j0phTmOTobelcLZPVOU4GhTobWmxgSmwa61Zzq55v72m/HZrpKYm0wStUvIOi6k39bnpFmlbku88ZEdTyd8ErIXDvBF0B/VT8uedwvFV5JepgWjtEwTcO18ehjgKt1IRNOQ3znAxcU0Ph6Bpo48JqsHfGvldJHy1jY3Iy+OFX1KFX6t+vRSMMHO6cfQQmDYV4GyFQOiCJ80hHmVC0p0jpzYfllQDjOulrByzVDD2fPC4cEhrEiN+TMSusJf2YdnIIlwGFR0VTCxVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTJrLOZKdzEJzyWaVMqDOv4IR1vUqGfjSataysr/XG0=;
 b=H2RQO49LhhH36RsJco6VpkeV47TFQxw9C4/bacC0WL5JO04Td+SlnbZdAFM82nxE9HIudHqtAsrSC6tRbJCzBY+NotwN7HCay7X0JpzUaRHL5nM9dGKloJullBIzG/AvRQKkAlBQx2HAgiAePOOX3oeFIkVc53FTHKmr89Dg8jY=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by BN3PR12MB9569.namprd12.prod.outlook.com (2603:10b6:408:2ca::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 01:46:00 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 01:46:00 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Val Packett <val@packett.cool>
CC: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: qcom: Add support to skip phy management by
 USB core
Thread-Topic: [PATCH] usb: dwc3: qcom: Add support to skip phy management by
 USB core
Thread-Index: AQHdGpHAjzhCxwn6H02A5arN0FHY6rbFjuwAgAACvwCAADMfAA==
Date: Wed, 9 Sep 2026 01:46:00 +0000
Message-ID: <aqC5oyqKj6A3y8WK@vbox>
References: <20260723-dwc3-skip-init-quirk-v1-1-97682bb44ebd@oss.qualcomm.com>
 <cbb4ae94-7862-4d91-b01d-0d7f18d49a45@packett.cool>
 <f9926203-ee69-4e18-b6c7-95261ba10807@packett.cool>
In-Reply-To: <f9926203-ee69-4e18-b6c7-95261ba10807@packett.cool>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|BN3PR12MB9569:EE_
x-ms-office365-filtering-correlation-id: 15487535-d17b-4543-7830-08df0e1419f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|38070700021|56012099006|4143699003|11063799006|10067099003;
x-microsoft-antispam-message-info:
 1z7yLmlg523tBpoea86zZJMyITUbm3x8lhwWTVn+fYiyHP5Ntlhg17DpusllGzbcNxqJwFIyvY/wl75LhiwOp7uqOGgomZEQBTlkpaZWq/zmAZ6ZbV3cHTU5QBDbiDpOdix3lT7Vc1XoJiPs3ZSVkImveGAaLmig5dxcItLRCGpDihzSQLnGIgol1GkjLMAklV7gU6CQFvr7BIgyE75UJbSpiGsWlkY9aTviKE9X0GovgXYbMNsKlRqHuJ91ecA7tGBqyUtWFjRnLMAtCFjRklpr9zXzQfJvUdHtRlRCh4W1RtVRI1qA2EpqoU2D4uefWjMQEfdsTyUGbDZhMieLvVmMcSNJxj0+a65NhafaLkhbrNTbni8Ugcc+RdwD0BHsEgqv7mJSv1tC6z0ecNlre4SLvhhwKC9j6P1miPhUwBs2aBml56eadfqPLSxyhpOQkb7dpb/dPODQSUe01arTnCM4DdhaTlf6Bi0CngnIKqHXfQlrDKqZDxBFqHvxzhB2Hht3DHyjUqJup7T+8doIPqjgxOPquMG6KVznTMvBDRcu1snwLeAwI9C4rNZVSvKUICNinYVm+cmGW8aFwy32/4rSpXk0Lf27Bfcsqb7O/s2bz8H0DzTLuGGNb12WnktG3YVz7itc3ubWqi2i6RocjQWAQfX+T6fWcG5CRKPX2PLD2uyAjE0A7H9T0n5RUM6E9cEWsV4Y+gH+7AhQjmNfA6Hv//AfWepqe30OGApiZv8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(38070700021)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZnBwdlZEazVvSE1oSFFFMVhyS1ZkSzEwZ3Biay9ydGNtemdUUStrNnhuNkRj?=
 =?utf-8?B?a3NEU0FWczZpZi9sNk9ONDFSb0NUMEpPSnJ4NHA3aFBtSHlqb0lxL2lzcFJq?=
 =?utf-8?B?NkdZTjZrYWsxTjRYeXFJR3ZOdnJCVUVCVEhGNnJ1UHByZEwzNWJBZGhtRjN4?=
 =?utf-8?B?bG5MOCt6ZHJlck5ab0RETlR5ZHRmSWVnb25zay9GRGdmRDEzZmovSmNHR2po?=
 =?utf-8?B?cDJSbTVpYkFxZFQvd3hRQnF2RUttK2w2cWIzQms0Q3BNQmJkRFcvTENWQ2N5?=
 =?utf-8?B?WEhqb1p5VTVYTEZEendTdHZHa09nWUVPUEVvSS9uVkZ6MkJMMzltTURLZTRC?=
 =?utf-8?B?ODVxZDQvMXh3bGg3NDA0ZjYzSzNLS0ppdDl3Q0VOL0xsSDByRGtNa0dMYkpn?=
 =?utf-8?B?eS9nUXdVbmNpNlFILys5ejM3MFNHeks5eXpRTVNsb28yc0ttcW1ZVjlpdVRl?=
 =?utf-8?B?QjN6UExNL1pCRzVRblFMZlRXVDc4RVhiRWVrL1dYZDZFOEI3SXRLbmNiMUlP?=
 =?utf-8?B?Y0c3STA1dU4yb0hreHZPUlMxL3doU2VqN2JGUUt5SzNxV0I5MmRzTnFDODU2?=
 =?utf-8?B?NG5tKzVxMVFJYTcrSU4vTnl4RHRaNVR3UzdLS3oydUt5SVR6c3lWM2RBOTFw?=
 =?utf-8?B?aUxBUlBoRkhwVS9wZ216cm9oSXpCeGlaL1dHV2Zoek81WmhpT0lKWjFaMy80?=
 =?utf-8?B?MTlyeExXUWxRdnpNNGRESlNyMlg0cm84NlpnVjE0b3FZUHdwUmhPUkxiZThh?=
 =?utf-8?B?MzViMzJuWndvQ1FoRlQzUHZpNnVZOVA5RjkzZnhIMDRMNHFxeHZBWkZ0SXN5?=
 =?utf-8?B?bDRQVHhlZHgydFdmaVFUZVY2OTZDY0w3cHMyc0tPMW02YUNFcCs4bkhtV0tS?=
 =?utf-8?B?QzNvVks3SnVFVTNsRFpFMWdIbFdaSjhQdnV6U2oxVzhFNFdQZ3Y2cStSd1A1?=
 =?utf-8?B?NnpzZ01leHVEKzc0Nm1yRXJsTEg2d3lrS0lsbXg1eWNSRjh1cU9zem82MzFW?=
 =?utf-8?B?RHdyRnJFOGVCbXdEUTN2UkQ3KzRseTJiOEtHYjBFZi80K0ZJaFZLQWxoU0cr?=
 =?utf-8?B?azJEb3ZhYzIyRHFrdWRDdElENTJrMW5QWTg0dVluRVFmZ3BIRGpNdC9MQVcx?=
 =?utf-8?B?QllkdDFzOXhNRTJrTXQ2a0dCNmdVemxFdkhwVUVrbElNNUN0UU5Bbnd3bEhF?=
 =?utf-8?B?aUVNOWNOd2l4ZTFGaDIwclBJZ0FYdzliVm8yQ2RQZU4vWng3MlUrNjlRN0M3?=
 =?utf-8?B?S253b1BzVWhuMkJSUDdmYnZUelBGMmRIaWFBNnNLSFpMVDlaSnJ3ejRLN05E?=
 =?utf-8?B?MjgyQjArZytwL0xrNjA5NWJtejZoWFJUWU4zV3gwUlQrR3psUWloaytNMUpH?=
 =?utf-8?B?RWlFQjdUcVVGM0F2djU3ZHpmaWlhdVJWbnZNdHE4ajJrblNCcXVRRkFjMDgv?=
 =?utf-8?B?UVpPL3BWL3kxY0RKQi9xWlowV1Q2MVJoK00yWXl6Zm5qMVhSSElGaEo2TUpn?=
 =?utf-8?B?ODVMMFhtdUc3K3g1ZWEvSEI2NWR6cnpvSFZFQmZNVC9zQlB2bmdYZlRveTdF?=
 =?utf-8?B?am5aQUJlcXFlaUZ2SklESlpMMXNCSVA5NEtVdzJZT3JrN1kxbEZrb1BuL0h2?=
 =?utf-8?B?QmtwNHNpbEF4VWF5aFR5TjRldEJzTk1XOUlhbnZtRm9MVXpvdFViOUZ5NVl3?=
 =?utf-8?B?L05FZVJ0ZUh1L0hJV3F0RmM2a05jdWI0UUFpczRIRzlYVUhHVHFqRjJBNHpO?=
 =?utf-8?B?c2dEcUNNdFh2ZWV2aDA5dzBOcEF5UXpwYzE3WmgrYzJCQjY5NjhJekxDYmdp?=
 =?utf-8?B?SFlPdlhxdkltZXl2WGtiSENkbVZOSGMvQS9wbThPUThyR0ZNeTVDWWxudWpW?=
 =?utf-8?B?aERzaXFPeGt3dzY4cnBVOFB6QzRzZFJtRDc0aUh1WUN4Wk1GRWVEeWNqS0xK?=
 =?utf-8?B?emdBeTMySjFIbTNJRHdMOHdzYzFvTTFWelFGNERKbU1LcFJXMDVSSlFqZ3Jy?=
 =?utf-8?B?cmNSTkMyRjB0SGZqalBOanc5NTlOOWd0ZkNVZmxMdjJHM0s2UE1RT3lRT0dI?=
 =?utf-8?B?RWFPeGtyeUozODBDSk4rVU5XV3dNSTdRczJjNkVpb0hHS2swakpWQjdaV1Na?=
 =?utf-8?B?eXMrNmFiQzlFN3p2VmFWU2hnMXBjVzM5UVU4UzhQcE02ak9RWEMwSW9KeHBG?=
 =?utf-8?B?Ulp0V0cwN21EMmE0UmpoUFNSUTNGVWpZNFYrZ3UwODIzZlh4WVJqNzFybXpD?=
 =?utf-8?B?SmxYZURjSzR3a3lZZ1NQSnlXSzdkaFV4ZGZaVHFqSE5SeExUR1YxUy9tU2NK?=
 =?utf-8?B?eGZuRDdnRkRWTUZqeDUwK1dxZ1RJalRKN05aRzh4N1lXckgwNkhiZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <41D29EC05237BC40994283B803285A7C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	4ZNmqbGIkcOEpl8gil1hviq4gwZ+ICEn2Ajm/yF26ckzboeVnylE47FN6Yl4KektmtfMxYVhbkV8n8d4Xle/juv6QPM75kZ0nNictLslY1933OvJhqv+rJ8PF1rowexB1vwnLBYTm3cVlr3QV9/HDo5QUzhibo5tPgJpFAtnmzlLJD6LCjBEw4ytOZKAtYa3Zw/MJbRDjj8HMo6MwRnMBE+WdyfMeTd3oiR7iLrhbFYbxM2+pl1pMaPODz5/cX3Ku0/DXMZS8yCYLXXAtrUUxagH9yAE2+oDHcBnZ8fRTReaLd2H8YPpC8HJMVmJR5KShXhw/uUj6TdM69PCT/E5Mw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	76meaRIfxWtp/aXnA9JGlQVXQkumDvASttDz8jj0V48JLrQE78sx9G0YwIlPEHgqmHu4DnYFFwXXNruLIzvUG5m/CV56sND575XlfaYDOpXdabvjZiMofN41DJrXWuDNu4CerW6U8WOnNgc5GlIKqb0ANsHRlaxg7QiLk5JUzAUV0dtdKCAaHwe0O3zhC7sNenjw+ODoWY44VRKd9+Fs9R+lQ6mAJhPd20o70u2pOxnMrEvgRY+VrENwD+jI8unJulueUFlDc1yNGTSnXVvhxTQ41x72ZOnYm/aSFNmzm4hXwjtOLDRRDpO4iqH4wTUpwImL4TCNRDQk7rTG51NkucjEH0gkzGHUF+MeAf1Wa35FKJkE4NM8xhKWZJ7fAGcAI1vV11Z28PJPclfGZDeGv6XH/k9aeYzHiCq/kWVZhF4RONIF1bsR7uMro5bvseDiF4LEngL1cJ062La2TYHk9zHBOVdMLJSPP29ajKjHnIfttg65TEEmOeN70LoZs9gKxTQuxhlRmvpGyWBHyBDNkG39RvLY6/EKkp6ZHcbWZQNoehQKXo7iC7tHV8vxoeTl5Aqnp3r+r7+Ob/ZznmVEJYy6YHuKQzr1fi6AGpzBh7yEMiPzo+4aBwrMne+ZPm91IfsoVgWmgSpWVgG9DXT9yA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15487535-d17b-4543-7830-08df0e1419f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 01:46:00.6275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z3M/uRbwdEvPj39jAGJ+ihgo8LtyCI5Ca+TvF/nfmLVYS9FTGkBRrfL7/rmaFQEg4NZ5GbbuMO5CsvVlb9r0Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9569
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDAxNyBTYWx0ZWRfX1GdoG1ZzQBuX
 elOuUtbzI40MaQIjENTFSlPwRNz2037k1hxvwu+PDDmbCHJpiXD7usFbQKROsC+OTvhPlKXiewj
 nnvLerCuCDRmArXbpOGu0AH4uaiDJ2I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDAxNyBTYWx0ZWRfX76tHRTtziVBE
 +FgDzQiWncpeDaVv/k902DS23U3LG/nUSzHEO5CPSDJ4QPmHGly1H190RStJD4sjlIJJy3BVUCu
 The7ujV3nKMmjl3lW8VhrQ0u5v3+e5f0nXh8AoNo07sXeFSiKXp8gDe2M/CWvpP9SXk/CtMp6Iy
 m7bz0UiQRV+dLVgOelBJXiuNc14Nc7pSUm5daVxcFeZQZ1FTVoJ2kfSVRLzpjp5vv2mQsnhC+gf
 BIEzqtfeFegfbttMcKNiSCFvo4ZkE+PpURKD+m0Nrl0ueZa2lzouX7av9L4m2MX9Nl0fOYUvkJC
 hSOcp/AFJl59R5iKA+q0uS9G6Yk1aN5Qcyh+A4kuvA1DG0d9TNVUD9lYHNUV0WHota/a5TvC8ck
 LUJdykojtwSpiloBtVnvy+/3PBlg+lasa1O2ffsWHGA6XV2WJHEk7lJlKUvlGiXwqli35h5wIZS
 H/lPSFwQgC+Xmdxg6vA==
X-Authority-Analysis: v=2.4 cv=b7KCJNGx c=1 sm=1 tr=0 ts=6aa0ba5f cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=iwFw3Zt73rG7tDFkAt8A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: EP-LFNr1i0eZHlbrCsa-Xk10WIbR3agC
X-Proofpoint-GUID: EP-LFNr1i0eZHlbrCsa-Xk10WIbR3agC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 clxscore=1011 phishscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609090017

T24gVHVlLCBTZXAgMDgsIDIwMjYsIFZhbCBQYWNrZXR0IHdyb3RlOg0KPiANCj4gT24gOS84LzI2
IDc6MzMgUE0sIFZhbCBQYWNrZXR0IHdyb3RlOg0KPiA+IA0KPiA+IE9uIDcvMjMvMjYgNzo1NCBB
TSwgS3Jpc2huYSBLdXJhcGF0aSB3cm90ZToNCj4gPiA+IERXQzMgZHJpdmVyIGRvZXMgbWFuYWdl
IHBoeXMgaXRzZWxmIHN1ZmZpY2llbnRseSBmb3IgUXVhbGNvbW0gcGxhdGZvcm1zLg0KPiA+ID4g
SWYgeGhjaS1za2lwLXBoeS1pbml0IGlzIG5vdCBzZXQsIHRoZSBIQ0QgY29yZSBkb2VzIGEgcGh5
X2luaXQgYW5kIHBoeV8NCj4gPiA+IGV4aXQgaXMgZG9uZSBvbmx5IHdoZW4gcm9vdGh1YiBpcyBi
ZWluZyBkZXN0cm95ZWQuIER1ZSB0byB0aGlzLCBkdXJpbmcNCj4gPiA+IHN5c3RlbSBzdXNwZW5k
IGluIGhvc3QgbW9kZSwgYWx0aG91Z2ggcGh5X2V4aXQgaXMgZG9uZSBieSBEV0MzIGNvcmUsIHRo
ZQ0KPiA+ID4gaW5pdF9jb3VudCBvbiBwaHkgaXMgbmV2ZXIgZG93biB0byB6ZXJvIHNpbmNlIEhD
RCBjb3JlIGFsc28gZGlkIGFuIGluaXQuDQo+ID4gPiBjb25zZXF1ZW50bHkgY2F1c2luZyBwaHkn
cyBleGl0IHJvdXRpbmUgdG8gbm90IGJlIGNhbGxlZC4gSGVuY2UsIGFkZA0KPiA+ID4gc3VwcG9y
dCB0byBza2lwIHBoeSBtYW5hZ2VtZW50IGJ5IFVTQiBjb3JlLg0KPiA+ID4gDQo+ID4gPiBTb21l
IEV4eW5vcyBwbGF0Zm9ybXMgc3RpbGwgZG8gcmVseSBvbiBVU0IgY29yZSBmb3IgcGh5X2NhbGli
cmF0ZSBjYWxscywNCj4gPiA+IGhlbmNlIGRpc2FibGUgVVNCIGNvcmUgbWFuYWdlbWVudCBmb3Ig
UXVhbGNvbW0gcGxhdGZvcm1zIG9ubHkuDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEty
aXNobmEgS3VyYXBhdGkgPGtyaXNobmEua3VyYXBhdGlAb3NzLnF1YWxjb21tLmNvbT4NCj4gPiA+
IC0tLQ0KPiA+ID4gTGluayB0byBQSFkgY2FsaWJyYXRlIGhhbmRsaW5nIGZvciBFeHlub3MgcGxh
dGZvcm1zOg0KPiA+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8yMDE5MDgyOTA1MzAyOC4zMjQzOC0xLW0uc3p5cHJvd3NraUBzYW1zdW5n
LmNvbS9fXzshIUE0RjJSOUdfcGchYW9ZMHBCMjdUbHhvM3UxUnpOendQSHBHc2p1QWdKV3RQZUtN
dkRyTF9fXzZnRVFiMjhldzhSZy1PMTg3N3hCSEI5Mlp2MmZZM19aYmIyYW9FUVkkDQo+ID4gPiAN
Cj4gPiANCj4gPiBIaSwNCj4gPiANCj4gPiB0aGlzIHdhcyBtZXJnZWQgaW50byAtbmV4dCBhIGZl
dyBkYXlzIGFnbywgYW5kIEknbSBzZWVpbmcgd2FybmluZ3Mgb24NCj4gPiBib290IG5vdzoNCj4g
PiANCj4gPiBbwqAgwqAgMC42MTMxODhdIHN5c2ZzOiBjYW5ub3QgY3JlYXRlIGR1cGxpY2F0ZSBm
aWxlbmFtZQ0KPiA+ICcvZGV2aWNlcy9wbGF0Zm9ybS9zb2NAMC9hODAwMDAwLnVzYi9zb2Z0d2Fy
ZV9ub2RlJw0KPiA+IFvCoCDCoCAwLjYxMzE5NV0gQ1BVOiAxMCBVSUQ6IDAgUElEOiA5MyBDb21t
OiBrd29ya2VyL3U0OTowIFRhaW50ZWQ6IEfCoCDCoA0KPiA+IMKgIMKgIFfCoCDCoCDCoCDCoCDC
oCDCoDcuMy4wLXJjMi1uZXh0LTIwMjYwOTA3LXV3dSsgIzE0MyBQUkVFTVBUKGZ1bGwpDQo+ID4g
W8KgIMKgIDAuNjEzMTk3XSBUYWludGVkOiBbV109V0FSTg0KPiA+IFvCoCDCoCAwLjYxMzE5OF0g
SGFyZHdhcmUgbmFtZTogRGVsbCBJbmMuIExhdGl0dWRlIDc0NTUvMEZLN01YLCBCSU9TDQo+ID4g
Mi4xMy4wIDA5LzE5LzIwMjUNCj4gPiBbwqAgwqAgMC42MTMxOTldIFdvcmtxdWV1ZTogZXZlbnRz
X3VuYm91bmQgZGVmZXJyZWRfcHJvYmVfd29ya19mdW5jDQo+ID4gW8KgIMKgIDAuNjEzMjA2XSBD
YWxsIHRyYWNlOg0KPiA+IFsuLl0NCj4gPiBbwqAgwqAgMC42MTMyMjZdwqAgZGV2aWNlX2NyZWF0
ZV9tYW5hZ2VkX3NvZnR3YXJlX25vZGUrMHhlOC8weDEwOA0KPiA+IFvCoCDCoCAwLjYxMzIyN13C
oCBkd2MzX3Fjb21fcHJvYmUrMHg1YTQvMHg3YjANCj4gPiANCj4gPiBUaGVyZSBpcyBpbmRlZWQg
YWxyZWFkeSBhIHNvZnR3YXJlIG5vZGUgYmVpbmcgY3JlYXRlZCBpbiB0aGUgc2hhcmVkIGR3YzMN
Cj4gPiBjb3JlIGNvZGUuDQo+ID4gDQo+ID4gQ291bGQgdGhlcmUgYmUgYW55IG90aGVyIGNvbnNl
cXVlbmNlcyB0aGFuIGEgZHVwbGljYXRlIHN5c2ZzIHBhdGg/DQo+ID4gDQo+IEFuc3dlcmluZyBt
eSBvd24gcXVlc3Rpb246IGV2ZW4gd29yc2UgbWVzc2FnZXMgd2hlbiB0aGUgY29udHJvbGxlciBz
d2l0Y2hlcw0KPiB0byBnYWRnZXQgbW9kZSAod2hpY2ggaGFwcGVucyBldmVuIHdpdGggY2hhcmdl
cnMgd2hlbiBEUkQgaXMgZW5hYmxlZCkNCj4gDQoNCg0KVGhhbmtzIGZvciB0aGUgcmVwb3J0IFZh
bC4NCg0KSGkgS3Jpc2huYSwNCg0KQ2FuIHlvdSBoZWxwIHNlbmQgYSByZXZlcnQgcGF0Y2ggdW50
aWwgYSBwcm9wZXIgY2hhbmdlIGlzIGluIGF2YWlsYWJsZT8NCg0KVGhhbmtzLA0KVGhpbmg=
