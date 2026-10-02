Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D399357CE0;
	Fri,  2 Oct 2026 23:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790984404; cv=fail; b=SgD155DIW6CVmgOsxLlWcSYF/sWbeA6fho9HVYJR0pC50eKXhnUbjBn8v1D1GFwHZmwkyB5arajT26vMWfUEBl47LtSXMvvpNZ+P2iemFtCAc1gcQLmSBR+gNEEK35QZgaSI2Ppe6wqvOISA5h6xrcV+xjbhZIP3glork7GbAjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790984404; c=relaxed/simple;
	bh=Kad/OA2cTrP54dFj6c7fSQs/pd1k2l1FHreHGCyqtSg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lCeoHrDIAf3sQQcXpaQaCcT7/xJADGgec3273ldisXu30AEi1qSjnGSjpSB9gg6RDm0hYHRbSSzIb89TG8IeuIfLW5zGImxnGh6jF/UeMZFInxTsmUJld0Dq3wdjTYKNs61c9/vqbeTwvatV+iTlQceHMsV8zMJgPZlmPsdv/lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZUGwSBd/; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Vg5KHbVN; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hhA+ok1N reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZUGwSBd/";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Vg5KHbVN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hhA+ok1N"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692L8eEO710868;
	Fri, 2 Oct 2026 16:39:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Kad/OA2cTrP54dFj6c7fSQs/pd1k2l1FHreHGCyqtSg=; b=
	ZUGwSBd/HgK8fMg5XuaY5Ce6I4WxWI1S5QbL6OQHv0mRDj1dpsM9+e8fIjQ0lbcv
	QywN6EbgisYOQG0fcVl2LD3QSIguc+oMf5Pl8Iv+pWBkKQRKEaqa+W5LrcAGDi1I
	Cz0Xha9rXD1iGzZIVOKd52VqmuacspCCwHJz6myvU2Ze/oZgQmKYVfD97yF7CLSY
	j/6v8a1EYigw0l5vxuldJ0iwGVHHJPanii9qSZEcMeAT8/GBop2veCZiYk9TTDpt
	szKs3CNhp5OHnDbtbnCA4w77YbMwh6fw8VQTXf2Nu0LHfN84iz6CuZ3HmU6l6IfN
	LS4hxitqzFx7q1RTqW2hyA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4h28qynk7w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 16:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1790984367; bh=Kad/OA2cTrP54dFj6c7fSQs/pd1k2l1FHreHGCyqtSg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Vg5KHbVN3PHx7R/UScQIhFeHVN5dAQIBBYXKa3wFAjvs9FKqd17k5Wnzpn+PCPT77
	 sjMnhtH1G4Qqm2cjzLUjvUKAIVWyeavP7efjNve4FlE7LhBcIiDz9LI0ml2udxNiTh
	 3m26n9qlD451diVWX1wtev6d5fDW5wV9pUt0zCSc1TFmQlIN4vk21/ds8JroN9T11h
	 hAqp7Pg6MVsY/l19kPm6asruDZaqixSe9Mox4Ko9olpEZGcIrzje6t5s53DdjD9cRq
	 qCC5UsJI8/9KPJLM+tjT2fVpQHslq/uUAt8t9PCG/5fL9x75UyL6SoF+D2032jO9Pm
	 vUjQ3fqP41QJw==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4CFBF401EF;
	Fri,  2 Oct 2026 23:39:27 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 66F2FA007C;
	Fri,  2 Oct 2026 23:39:26 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=hhA+ok1N;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00103.outbound.protection.outlook.com [40.93.13.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 073D3401CB;
	Fri,  2 Oct 2026 23:39:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5IPfwOVAVb1OPKUcqc4JR66pbvg3k4/4V659zRTbStf43nyAbg0JXW+UmWuy6bLRPJlxXA+DtzUdyFqL6xKKo9nzfS8t3XhnAS3QiMkdCeRMNx6pMAjTosddnfAWsS8LX4wxNBxTm+OVPSVDBGY7CGR5Se3/pze8NHfIyMF/cTjT6yR3Y818EkC61WZ8CqN1yzYmmzFGwAW7M+LwrqLz8tWRl4q1a5wUWsp/sh7ULW8uFpEJXv0ysJOCSZBWlKV/TADZEScKNCsgaMyKaEgO152oI6Wc2WrwbHAa5SOtqgjeP9rLm91Me5s9FNoKfAfyY3HyvLTPduwQEXvJwyJAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kad/OA2cTrP54dFj6c7fSQs/pd1k2l1FHreHGCyqtSg=;
 b=uQL31fw1Oz+Opu9xgBpAKskuPOipzyK8RPyIYel+wLYLOV/QSXsLfNwvUkud/pkKFxNktGenNWJM5foBjyIYVlSyUTJ2FdnjggFoPPGgR/L2GjxVy75+x54WfVHmgDB5Gs5FKPreyuak6gvZ/Wez8wBCj3YqRneR58YHp5QXkfYpPqFV9rcLOVnBKpgcJFVXUT12vVT3vITjTzhM2k2I3ingxv+9JGd9KuNSaXSXR0CBI6hLoohtzz1PGGKOOtfoDKKx1HOLbiB/6KVN3ppHm1X63iBAvgXhMlV5b/3zZfAMuJ4yMEFnUcEHjxRrbmyy3XXSin0faXH1irRhKILhSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kad/OA2cTrP54dFj6c7fSQs/pd1k2l1FHreHGCyqtSg=;
 b=hhA+ok1NjyloyLuIct6D86W4u+2uLgTsfTBQFjMpmF75GQSD9mCresL9brpVRO5tKwzJSR3JfqAhd5prTvau8Y+h0nVDoQS/BlkAk4tW9arwJ4Ur5S+DQ0dLfN8xOCqU3egLs90u03cJeuRc5K2ENSGMcSe3qXlwYd6dnsb6W40=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DS4PR12MB360321.namprd12.prod.outlook.com (2603:10b6:8:4bf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 23:39:22 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 23:39:22 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Igor Paunovic <royalnet026@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH v16 4/6] usb: dwc3: rockchip: support PHY reset
 notifications
Thread-Topic: [PATCH v16 4/6] usb: dwc3: rockchip: support PHY reset
 notifications
Thread-Index: AQHdTEnQH06YhjnbuEu/Y2OeS1TAnrbq9beA
Date: Fri, 2 Oct 2026 23:39:22 +0000
Message-ID: <asA211DtVMDPAuAL@vbox>
References:
 <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
 <20260924-b4-rockchip-dwc3-rockchip-glue-v16-4-126a2e9133c3@collabora.com>
In-Reply-To:
 <20260924-b4-rockchip-dwc3-rockchip-glue-v16-4-126a2e9133c3@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DS4PR12MB360321:EE_
x-ms-office365-filtering-correlation-id: da824764-c5e1-4cba-8590-08df20de62fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|22082099003|18002099003|38070700021|4143699003|6133799003|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 OsmDunzpmHJLLZtHGc+sqDgH8BZSULtygKTaqdqlaMHX6piwhTsSvrcmBhotbaEkggrDSbAhett3rhAAG5bOHxdxt62bDDVuQtRvD9EWlQz787blbJ22BgIcjFTeDV0BSe8EpsLGsTvm3aCXz1Fm6nZdf4d0ZaG1pb+XV3DUCWDYKeumVNT95kImQaLXBBwV4mkIDLgxKp+ywIM0YHGFk+9vw32VPlKRxGLm+mvogdV37oQCosXNnj14zLQpuzutJrJpxz3wx+H97vJOMy0sBdqc2EEE51Zk3hmTMPbUxUhks0zyrpU7y8yrUyngmyfrrXDtR1BCzBkg4QxO+qpUefBAun2+x0FUh6RGTvugWyazOBSInGq7Y2IpOUPi6LSw9ME1lAR3W9E6Bzf+CZ3QxBUuiQc6UvN9HGqZCgsZlMmvgSJi8l+5WNSO1aRMJVe9dtGV//RksL9ipuEMKq450Uh5pW/ivbuSCQVvyQ3wDoVZmsuiy70APSfZ8dnnn8p6pmwF8TIIWLXDP0WHfqXh55LRv+Hppbc/2eMxd9o4jdlUm0KN9w2kjFzdTkyfbsx3j7NMNl+pbEWRSoB4ZAGilCnz0Phh9xUON7XMOGrWSVShl9Am44EDwRB0wHD2xIaDu5ZN9FFHJEc+80q0EBQ/IbYMJbWh2RA58QZxYIdPXNHPE9QOjssZ1wSmP3jzY/HVGUKTG8vXdfPX8aI9zlmXHKWpxCj0pGAICL5zRoHjm/4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(38070700021)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T2dyZjV2NFFoNUd5UVIzbWQxTGZlSDVpa25GSWU2RTFUWVVLOW9wYlp5Ly9S?=
 =?utf-8?B?M2xKWWJSQ1lkS0drVHFoYkNRUVk0WU9lako5MGtzU3BaWUt4eUNmTWVuZEtQ?=
 =?utf-8?B?dHhrTkhBaEt2bjNnNXJFczBQM2ZzWkFhQmRLUnFVc2lQU1IxS3RZWVVISmxz?=
 =?utf-8?B?Nk1ObXlGVkJOdHVEeFdkYW5jSXZwTVN2NVpkNjBiYk5XdTA1ZEYyL1p1eURR?=
 =?utf-8?B?WXlyOEgzbDY1dUM2ajlaQmVDU3Eya0lwT3I2ejJDbytTUTdXaFIzMHlPczBl?=
 =?utf-8?B?THNwNjU1MkFmaklGcFFSWTFXSkJ1cXJjZEYzNmRoU1MvL0o2NG5sRDdwRXpU?=
 =?utf-8?B?YVJHZkErREw5RGIwM3hPTm1XbGxER1ZJTEk0QmcvSnF5NmxaRFROeUdIQjd3?=
 =?utf-8?B?aXY4aVBETytRbFpKNlB2Q3dvZEtRUThqOXBKbzV4c2FhNkdPbVEwaHRuQmJF?=
 =?utf-8?B?SVhadGloVDNLL2tYYk9YVVZhbHRLRXlraHVQRE5UdlFZMmJ0U3crREIzcnRw?=
 =?utf-8?B?SG1xa21lT1c5ek5vRWxBaWdXU09XUmwrK2hVVXgvcUJJUm1vSUF4M3ZDVi9J?=
 =?utf-8?B?cVVzeGErdFUxSkdpdGF0NmR3WXdQZTdHbXlGa0RSSWhnVit3OVBmc3NZbmdD?=
 =?utf-8?B?WWtweGJVQ01jb01UTEYyR3VMRGFNeStkc1dZUkIrUUZxRXJXcUlJdWZoTnhL?=
 =?utf-8?B?bTArc2p0Nm5RWDNFOCtrTTkyR2pGeVJsaFFka0VNaUtqaHArekF5L2J5R3hw?=
 =?utf-8?B?NTJHTU5RdWdaOFJEWDhLeVRoWUZsQWhiWmdqbi9vb2hIK24vT0llTU1RcVV2?=
 =?utf-8?B?dkUrckpuejhsa0hZY3FnbDhwSlo5SUhXdkdCQ0JOdllUUDZkSFVaNDUzMjJS?=
 =?utf-8?B?YXg0SEp6bGg0Yk0reGtxdmxQOU12SE5JdXFYWk5zM1pxUkxhVXdOZ0Zzb2R2?=
 =?utf-8?B?MWFWWGhTcjkvSUhPaGkwaHNaa3hjYVlFclF3TUhpdWFwOWYrcU5ZTWJacEp5?=
 =?utf-8?B?MGJITzNORDNDMFpOTWdXYUJweUxsODZJRmp5WGVvMGZYS3cweUNGNXVZZjFY?=
 =?utf-8?B?eGRrSXA5U2o4SFFOd3dCaXZjZkYrejBZZldHZTRleVY2TUVpUUhMZHF6b3B3?=
 =?utf-8?B?a2N0bVhZZFovUnltV0hyWEVvRnFLa0ZnNSsyWGdnOTJBdm5NelZzdlorUWI5?=
 =?utf-8?B?RldKNCsxREtWd1lnMlkzVjJBRCs2ZjM1QmFNQzFxd2drMVlHazFTZURXRGpn?=
 =?utf-8?B?bVpVUy9hWUpjWS9xQUFwdWliSWh1RnNCS3cvNVNlT2xwSkRUb0ZZa09Lbmpo?=
 =?utf-8?B?c3dEQjVMSi85VHp3KzN2WmZ6RGZRMHZBVkJwZ0lSUkZHTGlrdEFRaytwbFdX?=
 =?utf-8?B?bWZWTXkyendJcGpRVDM0T1JYN21VZmJNUWI4aEpQMWJ5SlRIa3RGeWFZRVVO?=
 =?utf-8?B?VTZtdFRRajQvTlhvU0l0ZFRoakg5Y1FVZUlOWHpLRHJkUnFpMWN0SzY3bU5B?=
 =?utf-8?B?SlJSendmU0h2eDN6SHB3UlNyaURzSEhHa0pER1pTUkpQVXdFNHFSczVBTmxL?=
 =?utf-8?B?bmtseElmSnpoa0ozS2s1bnRGRHFqcWFIam4zU3FQRlVEeWNMU3JSUlR0MU9l?=
 =?utf-8?B?Tkk0dTZZczdzemVxZGtDeXVSdHRRMWJYWEM3dHJEdWwvQ2Y2Vk04YjdxUzlZ?=
 =?utf-8?B?NkVpTnhTeVVEVnAvblZyd2VITlZxc2duMUF5a0U3ZEpNd05PYVc5eDVPTmdD?=
 =?utf-8?B?WWh2TGl5eWs4aUVTOGUzalRFZDhSRTFKNzcyQ200N3N2elRvNEJHQlEwdG41?=
 =?utf-8?B?RTlJK3A0SGJFK29sd0M5bm9FNGhyN1AxNnJiMmRDTSs5Yzlyb2ZPZlFDR1kx?=
 =?utf-8?B?UmIzbS9ReXkrTnYyT3VhcTZIa002NmloQWxZd3BlRUsrWHJuU3JxenNwOXM1?=
 =?utf-8?B?ZkhnK0cyMmZEVEtrQXk3czRLQTFFeEdqV2RQWkRrendVMStjWUxQemdlK212?=
 =?utf-8?B?Z1ZLTTRPaDFRTGY4Sk9BR0ZJMkJaVnB4b2wyOWV5YkxLRHhzTjhiTVNkY1VT?=
 =?utf-8?B?Y3VXRC80QnBNc09qOXk5UHROQ2c5VXlGSDNZdnN3Sy84MTFBUWtQMEQ4b1cz?=
 =?utf-8?B?K2NaWE54cDZDQW9wWFd6dzY0UDU5Q3hsdGVDUm13WkVGcFdGOGdQbmtyY0JD?=
 =?utf-8?B?amszM2ZJcENUZ3gwc3BjYzA4QldtQmwwcHNlWjhFU3dSNzVIV1ZzbWgremZt?=
 =?utf-8?B?d0VpWnVuZnI0OW5hb21uQXBxRS91YkdQM1J5ak9zQlNMNmE1QkJlbVNLV2E1?=
 =?utf-8?B?QUVWQ3ZIT1VRQ1RqMTErckpJV2ZONkVpWWFiM2NkWHUxbWZGVGY1Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4915D5B471382C41B5367922E62E761D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	H9LaaNTNgfnS/9ciODIhGuTMNUhRvnvqBvAKCIHIIVcsOJZ4dJmw6CZxirBc+ILa984qyhxccILcKCqgwe7ovP7BNwujdzJZY43Xr+1B7vcvaVxGo+cYtVdBT1N32A4Sn1sd0H4sNI0YeNlR2BjzY808sRg94gcZReK0qV7H4d8WI+dc36S5sm0rzjNgYa/MW8kIGMMcT8XUySXpsfMJATUH2E8VMwdZGFfwBY+K5XENktoZONhqPsD8MqWglZu5Gk8Qj7b+r+yDYv3TLip0oxZVlRbpiQ/JLgBMbtsKVW03kaILsBwvZhS066aywPA6Hoxj9XfMa5D69+A1OJjKCA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eNnsqU8Ea1FQgvR6aCSY26qjBd+fqTicThhWLBXWP9mtAUS1LfMWtXCxw4Y/nTGHgtSekdAqU3M5ZxATfAKl0unQ/J6wGYDIZinLdFqf16YF404PEa/tvepjwN3MXllFchvRBMlm+LG6ueJ0lMn4g3d9oX43DiMfC9VO+SUPSoR198Rmy2ZnykWyFR42ztu+geA+lwD33bl20zDVEegZW6VtaNSARWN4zElAo31xCT93t6MbF2STYcCPTqANieYTuOwH2BalOmC6Fu0doF9WL/mB7bB6535w7cXBpr/+fCYJqskngZBM6598V2FQpLfKpdo500pmgbwZrTp4hAg26KYHcBSq6LW2EWfWf+BA8K1rO1+e6sKx2HaUhXJFhBYyHur5NvuzRsRX/B7Vxjgv1WR86H5icNKc9Dp5+a2GPJvBhZ6DBR9Ali08StYL+MiwPw59Ce2rJX+iHZa7oH0MVGdxz2gXvQ/meEGzYCTQpv2vAaRiFjZk8Mu3PcPgtMgKo0zhkTq5Po4523h3tWD/L7tV2diPenzvph+O0Z7Z5KyI6G+k1qRMGeNtQIRq2+i0p5Xiecp1Q07ybhD7Ljprf+Nj8SewkREr0IL6eA66y4kY6u3m9l3PRTI+WjyVHq5xcvYyQ1Jswa4ivUXmFmjr/g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da824764-c5e1-4cba-8590-08df20de62fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 23:39:22.5018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o8D0sRjjHVbbiJFBgmkLDxPf7jIkVmGWFJbyMMGDSQYX/s8pBF5VgLDIYFqLVgkZeeeGYqnlcMhwFTw+8fOD7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB360321
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA5NCBTYWx0ZWRfX9sleBMmG7HJe
 r66f5olV737483RoPkO5FwNI4yQBCXCbgxA9LAQssoYN9FQn93UGwWKeMMIsPdxUrgOeRJYpL5I
 rPhWU+WxEWMtOelloJ8M4qoAmXuG138=
X-Proofpoint-ORIG-GUID: DDafFrbpb35fh2M1PX2YuuTToVQFEf3f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA5NCBTYWx0ZWRfX8qbLInzgK5oJ
 8gwdo7srPbEOoCTtvxUP2kXWb11qZJUIO2KfIcWi9SkUvJOXKDmmgrwIVDjtnDvJKlUYE7jbUh6
 woze4zPdYMn7v7wNz8H0xJNJqJ92M9S8yAw6/BnSY1qlHTTywHaKgR5rKN9b5HQYiG2dWaW+98C
 6usls2vYM6/GQ8biqaf2XYf7P6JiYMdmrDzS4d75aZwyZ47KosPbSH0urfGhfGcNYz8mDAOlSDu
 odAElCtvVILlikWaN5ZlzePJsvIJX9gLurxiKrVP6tp54T/S0Rn+OXvMyEyNFe9DrSMyCqEV7/x
 2W1xbiknUPiBwLGrS7cGkghYve2j51HtvKclZnsjA6oQ0Wsgsv6e17IBRf+9XQNA75hAU298WL2
 Fxjq+zPbLty7fV2D9g7jaw9FTZJRZTr44FY2hXC2GPuaGXOdx0Hj3hMJXkSvnX/wkRGHZL3Uo9v
 F9nV0v99ZnA+0koDgNw==
X-Authority-Analysis: v=2.4 cv=Vrm2kO2n c=1 sm=1 tr=0 ts=6ac040b0 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=pGLkceISAAAA:8 a=jIQo8A4GAAAA:8 a=QX4gbG5DAAAA:8 a=W2M8NIFbcosXO9OoIpIA:9
 a=QEXdDO2ut3YA:10 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: DDafFrbpb35fh2M1PX2YuuTToVQFEf3f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_06,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2610020094

T24gVGh1LCBTZXAgMjQsIDIwMjYsIFNlYmFzdGlhbiBSZWljaGVsIHdyb3RlOg0KPiBPbiByZWNl
bnQgUm9ja2NoaXAgcGxhdGZvcm1zIChhdCBsZWFzdCBSSzM1ODggJiBSSzM1NzYpLCBEV0MzIElQ
IGlzIHVzZWQNCj4gd2l0aCBhIFVTQkRQIFBIWSBwcm92aWRpbmcgVVNCMyBhbmQgRFAuIFRoaXMg
UEhZIG5lZWRzIHRvIGJlIHJlc2V0IHdoZW4NCj4gdGhlIG1vZGUgY2hhbmdlcywgd2hpY2ggbWF5
IGhhcHBlbiB3aGVuIHBsdWdnaW5nIGluIGRpZmZlcmVudCBVU0ItQw0KPiBkZXZpY2VzLg0KPiAN
Cj4gSWYgdGhlIFVTQkRQIFBIWSByZXNldHMgd2l0aCB0aGUgRFdDMyBJUCBydW5uaW5nLCBpdHMg
aW50ZXJuYWwgc3RhdGUNCj4gY29ycnVwdHMgcmVzdWx0aW5nIGluIHRoZSBVU0JEUCBQSFkgbm90
IGJlaW5nIGFibGUgdG8gbG9jayBzb21lIFBMTA0KPiBjbG9ja3MsIHdoaWNoIGVmZmVjdGl2ZWx5
IHJlbmRlcnMgVVNCMyB1bnVzYWJsZS4NCj4gDQo+IFRvIGZpeCB0aGUgaXNzdWUgdGhpcyBhZGRz
IGhhbmRsaW5nIGZvciB0aGUgbmV3IFBIWSBmcmFtZXdvcmsgcmVzZXQNCj4gbm90aWZpY2F0aW9u
cywgd2hpY2ggd2lsbCBhc3NlcnQgUEhZU09GVFJTVCBiZWZvcmUgdGhlIGFjdHVhbCBQSFkNCj4g
aXMgZGlzYWJsZWQgYW5kIHdpbGwgZGVhc3NlcnQgaXQgb25jZSB0aGUgUEhZIHJldHVybnMuDQo+
IA0KPiBUZXN0ZWQtYnk6IElnb3IgUGF1bm92aWMgPHJveWFsbmV0MDI2QGdtYWlsLmNvbT4gIyBP
cmFuZ2UgUGkgNSBQbHVzDQo+IEFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBz
eW5vcHN5cy5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFNlYmFzdGlhbiBSZWljaGVsIDxzZWJhc3Rp
YW4ucmVpY2hlbEBjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdj
My1yb2NrY2hpcC5jIHwgMTI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LQ0KPiAgZHJpdmVycy91c2IvZHdjMy90cmFjZS5jICAgICAgICAgfCAgIDMgKw0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCAxMjkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1yb2NrY2hpcC5jIGIvZHJpdmVycy91c2IvZHdj
My9kd2MzLXJvY2tjaGlwLmMNCj4gaW5kZXggNDEyOWFlZmQ2YThiLi4xN2I2YzJjYTllMTkgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1yb2NrY2hpcC5jDQo+ICsrKyBiL2Ry
aXZlcnMvdXNiL2R3YzMvZHdjMy1yb2NrY2hpcC5jDQo+IEBAIC0yLDExICsyLDEzNiBAQA0KPiAg
LyogQ29weXJpZ2h0IChjKSAyMDI2LCBDb2xsYWJvcmEgTHRkLiAqLw0KPiAgI2luY2x1ZGUgPGxp
bnV4L21vZHVsZS5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiAr
I2luY2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1l
Lmg+DQo+ICAjaW5jbHVkZSAiZ2x1ZS5oIg0KPiArI2luY2x1ZGUgImlvLmgiDQo+ICsNCj4gK3N0
cnVjdCBkd2MzX3JvY2tjaGlwOw0KPiArDQo+ICsvKioNCj4gKyAqIHN0cnVjdCBkd2MzX3JrX3Bo
eV9uYiAtIHdyYXBwZXIgZm9yIFBIWSBub3RpZmllciBibG9jaw0KPiArICogQG5iOiBub3RpZmll
ciBibG9jaw0KPiArICogQGR3YzogYmFjay1wb2ludGVyIHRvIHRoZSBEV0MzIGNvbnRyb2xsZXIN
Cg0KSSBtaXNzZWQgdGhpcyBmcm9tIHRoZSBsYXN0IHJldmlldzogZHdjIGhlcmUgaXMgc3VwcG9z
ZWQgdG8gYmUgZHdjX3JrLg0KDQo+ICsgKiBAcG9ydF9pbmRleDogVVNCMyBwb3J0IGluZGV4IHRo
aXMgbm90aWZpZXIgaXMgcmVnaXN0ZXJlZCBmb3INCj4gKyAqLw0KPiArc3RydWN0IGR3YzNfcmtf
cGh5X25iIHsNCj4gKwlzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sJbmI7DQo+ICsJc3RydWN0IGR3YzNf
cm9ja2NoaXAJKmR3Y19yazsNCj4gKwl1OAkJCXBvcnRfaW5kZXg7DQo+ICt9Ow0KPiAgDQo+ICBz
dHJ1Y3QgZHdjM19yb2NrY2hpcCB7DQo+ICAJc3RydWN0IGR3YzMJCWR3YzsNCj4gKwlzdHJ1Y3Qg
ZHdjM19ya19waHlfbmIJdXNiM19waHlfbmJbRFdDM19VU0IzX01BWF9QT1JUU107DQo+ICsJdTgJ
CQlwaHlfcmVzZXRfYWN0aXZlOw0KPiArfTsNCj4gKw0KPiArc3RhdGljIGludCBkd2MzX3VzYjNf
cGh5X25vdGlmeShzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLA0KPiArCQkJCXVuc2lnbmVkIGxv
bmcgYWN0aW9uLCB2b2lkICpkYXRhKQ0KPiArew0KPiArCXN0cnVjdCBkd2MzX3JrX3BoeV9uYiAq
cG5iID0gY29udGFpbmVyX29mKG5iLCBzdHJ1Y3QgZHdjM19ya19waHlfbmIsIG5iKTsNCj4gKwlz
dHJ1Y3QgZHdjM19yb2NrY2hpcCAqZHdjX3JrID0gcG5iLT5kd2Nfcms7DQo+ICsJc3RydWN0IGR3
YzMgKmR3YyA9ICZkd2NfcmstPmR3YzsNCj4gKwlpbnQgcG9ydCA9IHBuYi0+cG9ydF9pbmRleDsN
Cj4gKwl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiArCXUzMiByZWc7DQo+ICsJaW50IHJldDsNCj4g
Kw0KPiArCXN3aXRjaCAoYWN0aW9uKSB7DQo+ICsJY2FzZSBQSFlfTk9USUZZX1BSRV9SRVNFVDoN
Cj4gKwkJLyoNCj4gKwkJICogSWYgYWxyZWFkeSBzdXNwZW5kZWQsIHRoZSByZXN1bWUgcGF0aCB3
aWxsIHJlaW5pdCBHVVNCM1BJUEVDVEwNCj4gKwkJICogdmlhIGR3YzNfY29yZV9pbml0KCkuIEEg
Zm9yY2VkIHJlc3VtZSBpcyBub3QgcG9zc2libGUgYXMgdGhhdA0KPiArCQkgKiB3b3VsZCBjYWxs
IHBoeV9pbml0KCkgcmVzdWx0aW5nIGluIGEgZGVhZGxvY2suIER1ZSB0byB0aGUNCj4gKwkJICog
cGh5X2luaXQoKSBpbiB0aGUgcmVzdW1lIHBhdGggdGhlcmUgaXMgYWxzbyBubyBuZWVkIHRvIGJs
b2NrDQo+ICsJCSAqIGFzeW5jIFJQTSByZXN1bWUgb24gb3VyIHNpZGUsIHNpbmNlIHRoZSBQSFkg
c3luY2hyb25pemVzIGl0DQo+ICsJCSAqIGZvciB1cy4NCj4gKwkJICoNCj4gKwkJICogcG1fcnVu
dGltZV9nZXRfaWZfYWN0aXZlKCkgcmV0dXJucyAwIHdoZW4gc3VzcGVuZGVkIChza2lwKSwNCj4g
KwkJICogMSB3aGVuIGFjdGl2ZSAocmVmIGhlbGQpLCBvciAtRUlOVkFMIHdoZW4gUE0gaXMgZGlz
YWJsZWQNCj4gKwkJICogKGRldmljZSBhbHdheXMgYWN0aXZlKS4gSW4gdGhlIC1FSU5WQUwgY2Fz
ZSBQTSByZWYgY291bnRpbmcNCj4gKwkJICogaXMgYSBuby1vcCwgc28gdGhlIHVuY29uZGl0aW9u
YWwgcHV0IGluIFBPU1RfUkVTRVQgaXMgc2FmZS4NCg0KVGhlIC1FSU5WQUwgY2FzZSBpcyBub3Qg
bm8tb3AgaGVyZS4gTm8gcmVmZXJlbmNlIGlzIHRha2VuLCBidXQNCnBtX3J1bnRpbWVfcHV0X2F1
dG9zdXNwZW5kKCkgaW4gUE9TVF9SRVNFVCBzdGlsbCBkZWNyZW1lbnRzIHRoZSB1c2FnZQ0KY291
bnQsIGNhdXNpbmcgdW5kZXJmbG93IG9yIHRha2luZyBzb21lIG90aGVyIHJlZmVyZW5jZS4gU2hv
dWxkIHdlIHNraXANCmlmIHJldCA8IDAgdG9vPw0KDQo+ICsJCSAqLw0KPiArCQlyZXQgPSBwbV9y
dW50aW1lX2dldF9pZl9hY3RpdmUoZHdjLT5kZXYpOw0KPiArCQlpZiAoIXJldCkNCj4gKwkJCXJl
dHVybiBOT1RJRllfT0s7DQo+ICsNCj4gKwkJLyoNCj4gKwkJICogQXNzZXJ0IFVTQjMgUEhZIHNv
ZnQgcmVzZXQgd2l0aGluIERXQzMgYmVmb3JlIHRoZSBleHRlcm5hbA0KPiArCQkgKiBQSFkgcmVz
ZXRzLiBUaGlzIGRpc2Nvbm5lY3RzIHRoZSBQSVBFIGludGVyZmFjZSwgcHJldmVudGluZw0KPiAr
CQkgKiB0aGUgRFdDMyBmcm9tIGludGVyZmVyaW5nIHdpdGggUEhZIHJlaW5pdGlhbGl6YXRpb24g
YW5kDQo+ICsJCSAqIGF2b2lkaW5nIExDUExMIGxvY2sgZmFpbHVyZXMuDQo+ICsJCSAqLw0KPiAr
CQlzcGluX2xvY2tfaXJxc2F2ZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+ICsJCWR3Y19yay0+cGh5
X3Jlc2V0X2FjdGl2ZSB8PSBCSVQocG9ydCk7DQo+ICsJCXJlZyA9IGR3YzNfcmVhZGwoZHdjLCBE
V0MzX0dVU0IzUElQRUNUTChwb3J0KSk7DQo+ICsJCXJlZyB8PSBEV0MzX0dVU0IzUElQRUNUTF9Q
SFlTT0ZUUlNUOw0KPiArCQlkd2MzX3dyaXRlbChkd2MsIERXQzNfR1VTQjNQSVBFQ1RMKHBvcnQp
LCByZWcpOw0KPiArCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkd2MtPmxvY2ssIGZsYWdzKTsN
Cj4gKwkJYnJlYWs7DQo+ICsNCj4gKwljYXNlIFBIWV9OT1RJRllfUE9TVF9SRVNFVDoNCj4gKwkJ
c3Bpbl9sb2NrX2lycXNhdmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiArCQlpZiAoIShkd2Nfcmst
PnBoeV9yZXNldF9hY3RpdmUgJiBCSVQocG9ydCkpKSB7DQo+ICsJCQlzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZkd2MtPmxvY2ssIGZsYWdzKTsNCj4gKwkJCXJldHVybiBOT1RJRllfT0s7DQo+ICsJ
CX0NCj4gKw0KPiArCQlkd2NfcmstPnBoeV9yZXNldF9hY3RpdmUgJj0gfkJJVChwb3J0KTsNCj4g
Kw0KPiArCQkvKg0KPiArCQkgKiBEZWFzc2VydCBQSFkgc29mdCByZXNldCB0byByZWNvbm5lY3Qg
dGhlIFBJUEUgaW50ZXJmYWNlDQo+ICsJCSAqIGFmdGVyIFBIWSByZWluaXRpYWxpemF0aW9uLg0K
PiArCQkgKi8NCj4gKwkJcmVnID0gZHdjM19yZWFkbChkd2MsIERXQzNfR1VTQjNQSVBFQ1RMKHBv
cnQpKTsNCj4gKwkJcmVnICY9IH5EV0MzX0dVU0IzUElQRUNUTF9QSFlTT0ZUUlNUOw0KPiArCQlk
d2MzX3dyaXRlbChkd2MsIERXQzNfR1VTQjNQSVBFQ1RMKHBvcnQpLCByZWcpOw0KPiArCQlzcGlu
X3VubG9ja19pcnFyZXN0b3JlKCZkd2MtPmxvY2ssIGZsYWdzKTsNCj4gKw0KPiArCQlwbV9ydW50
aW1lX3B1dF9hdXRvc3VzcGVuZChkd2MtPmRldik7DQo+ICsJCWJyZWFrOw0KPiArCX0NCj4gKw0K
PiArCXJldHVybiBOT1RJRllfT0s7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIGR3YzNfcmtf
cGh5X3VucmVnaXN0ZXJfbm90aWZpZXJzKHZvaWQgKmRhdGEpDQoNCkJUVywgd2hlbiBkb2VzIHRo
aXMgZ2V0IGV4ZWN1dGVkPyBDb3VsZCBpdCBiZSBleGVjdXRlZCBhZnRlciB0aGUNCmR3YzNfY29y
ZV9leGl0KCkgcG93ZXJpbmcgb2ZmIHRoZSBwaHkgYW5kIHR1cm5pbmcgb2ZmIHRoZSBjbG9ja3M/
IFRoZQ0KcmVzZXQgbm90aWZpZXIgbWF5IHN0aWxsIGJlIGNhbGxlZCBpbiB0aGlzIGNhc2UgYW5k
IHJlYWQgZHdjMyByZWdpc3RlcnMuDQpDYW4gd2UgbWFrZSBzdXJlIHRoaXMgaXMgZG9uZSBiZWZv
cmUgZHdjM19jb3JlX3JlbW92ZSgpIGluDQpkd2MzX3JvY2tjaGlwX3JlbW92ZSgpPw0KDQpUaGFu
a3MsDQpUaGluaA0KDQo+ICt7DQo+ICsJc3RydWN0IGR3YzNfcm9ja2NoaXAgKmR3Y19yayA9IGRh
dGE7DQo+ICsJc3RydWN0IGR3YzMgKmR3YyA9ICZkd2NfcmstPmR3YzsNCj4gKwlpbnQgaTsNCj4g
Kw0KPiArCWZvciAoaSA9IDA7IGkgPCBkd2MtPm51bV91c2IzX3BvcnRzOyBpKyspDQo+ICsJCXBo
eV91bnJlZ2lzdGVyX25vdGlmaWVyKGR3Yy0+dXNiM19nZW5lcmljX3BoeVtpXSwNCj4gKwkJCQkJ
JmR3Y19yay0+dXNiM19waHlfbmJbaV0ubmIpOw0KPiArDQo+ICsJLyogUmVsZWFzZSBhbnkgUE0g
cmVmZXJlbmNlcyBmcm9tIGluLWZsaWdodCByZXNldHMgKi8NCj4gKwlmb3IgKGkgPSAwOyBpIDwg
ZHdjLT5udW1fdXNiM19wb3J0czsgaSsrKSB7DQo+ICsJCWlmIChkd2NfcmstPnBoeV9yZXNldF9h
Y3RpdmUgJiBCSVQoaSkpDQo+ICsJCQlwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChkd2MtPmRl
dik7DQo+ICsJfQ0KPiArCWR3Y19yay0+cGh5X3Jlc2V0X2FjdGl2ZSA9IDA7DQo+ICt9DQo+ICsN
Cj4gK3N0YXRpYyBpbnQgZHdjM19ya19waHlfcmVnaXN0ZXJfbm90aWZpZXJzKHN0cnVjdCBkd2Mz
ICpkd2MpDQo+ICt7DQo+ICsJc3RydWN0IGR3YzNfcm9ja2NoaXAgKmR3Y19yayA9IGNvbnRhaW5l
cl9vZihkd2MsIHN0cnVjdCBkd2MzX3JvY2tjaGlwLCBkd2MpOw0KPiArCWludCBpOw0KPiArDQo+
ICsJZm9yIChpID0gMDsgaSA8IGR3Yy0+bnVtX3VzYjNfcG9ydHM7IGkrKykgew0KPiArCQlkd2Nf
cmstPnVzYjNfcGh5X25iW2ldLm5iLm5vdGlmaWVyX2NhbGwgPSBkd2MzX3VzYjNfcGh5X25vdGlm
eTsNCj4gKwkJZHdjX3JrLT51c2IzX3BoeV9uYltpXS5kd2NfcmsgPSBkd2Nfcms7DQo+ICsJCWR3
Y19yay0+dXNiM19waHlfbmJbaV0ucG9ydF9pbmRleCA9IGk7DQo+ICsJCXBoeV9yZWdpc3Rlcl9u
b3RpZmllcihkd2MtPnVzYjNfZ2VuZXJpY19waHlbaV0sDQo+ICsJCQkJICAgICAgJmR3Y19yay0+
dXNiM19waHlfbmJbaV0ubmIpOw0KPiArCX0NCj4gKw0KPiArCXJldHVybiBkZXZtX2FkZF9hY3Rp
b25fb3JfcmVzZXQoZHdjLT5kZXYsIGR3YzNfcmtfcGh5X3VucmVnaXN0ZXJfbm90aWZpZXJzLCBk
d2NfcmspOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgc3RydWN0IGR3YzNfZ2x1ZV9vcHMgZHdjM19y
b2NrY2hpcF9nbHVlX29wcyA9IHsNCj4gKwkucG9zdF9waHlfcmVnaXN0cmF0aW9uID0gZHdjM19y
a19waHlfcmVnaXN0ZXJfbm90aWZpZXJzLA0KPiAgfTsNCj4gIA0KPiAgc3RhdGljIGludCBkd2Mz
X3JvY2tjaGlwX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+IEBAIC0yNiw3
ICsxNTEsNyBAQCBzdGF0aWMgaW50IGR3YzNfcm9ja2NoaXBfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikNCj4gIAkJcmV0dXJuIC1FTk9NRU07DQo+ICANCj4gIAlkd2NfcmstPmR3
Yy5kZXYgPSAmcGRldi0+ZGV2Ow0KPiAtCWR3Y19yay0+ZHdjLmdsdWVfb3BzID0gTlVMTDsNCj4g
Kwlkd2NfcmstPmR3Yy5nbHVlX29wcyA9ICZkd2MzX3JvY2tjaGlwX2dsdWVfb3BzOw0KPiAgDQo+
ICAJcHJvYmVfZGF0YS5kd2MgPSAmZHdjX3JrLT5kd2M7DQo+ICAJcHJvYmVfZGF0YS5yZXMgPSBy
ZXM7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL3RyYWNlLmMgYi9kcml2ZXJzL3Vz
Yi9kd2MzL3RyYWNlLmMNCj4gaW5kZXggMDg4OTk1ODg1Njc4Li44YzRlMmE3YjE0MmUgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvdHJhY2UuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9k
d2MzL3RyYWNlLmMNCj4gQEAgLTksMyArOSw2IEBADQo+ICANCj4gICNkZWZpbmUgQ1JFQVRFX1RS
QUNFX1BPSU5UUw0KPiAgI2luY2x1ZGUgInRyYWNlLmgiDQo+ICsNCj4gK0VYUE9SVF9UUkFDRVBP
SU5UX1NZTUJPTF9HUEwoZHdjM19yZWFkbCk7DQo+ICtFWFBPUlRfVFJBQ0VQT0lOVF9TWU1CT0xf
R1BMKGR3YzNfd3JpdGVsKTsNCj4gDQo+IC0tIA0KPiAyLjUzLjANCj4g
