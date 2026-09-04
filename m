Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C28C38E8AB;
	Fri,  4 Sep 2026 23:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788562958; cv=fail; b=iXnMyjWlqM6iRYXMb7iRJ6wPRV9Y4VIGcqMBleoi6cWrIPa/ZLa8kDv3JYYiCZ/xVqkh/8hnh7oGNWaiZ4qrP1emruUGQJMfnCtUUNR/efSb2R3uAFXzkx04Z0eBwKHNwCKK1ObUm+P+fo0d2MYM4EnrnsvO+xNo0RKDwwwazfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788562958; c=relaxed/simple;
	bh=JMVAd8kuYEIUKORq7hY1jTnzz9YB71ZZ5oE62M7t2Gk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HlVPibAuKCjJoqHRepbUEpLx51u/sdhUSS1iy/DgzQnhnMEhl1I/ArXJjJ+88emtK7+mf6iBH5mEDNPkgTQrTuoPEA0taQeWS7X4zEKT2FcYJqs4Mrx5Tqp3xjsY6g+I8+mrXzFoVjGntsPTfSnum5e7w27gNPF5Xy1Abb3zZ3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=S5W6ghgM; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=gIZrUH7t; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=A/XUcOfF reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="S5W6ghgM";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gIZrUH7t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="A/XUcOfF"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684Kd1SA3795107;
	Fri, 4 Sep 2026 16:02:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=JMVAd8kuYEIUKORq7hY1jTnzz9YB71ZZ5oE62M7t2Gk=; b=
	S5W6ghgMUcyJcEIAQEBIPD2bW9WmBQugrsax9tIgMLf/hnQXBbt25AYzYN/wCetq
	2Ux9AmImUqJPfomDHtpbgr3ifV0aadR7aTS8RgDUaSsMacbmkXFboLi/LBYfYMWm
	t7t0aTDqRVoM9AY3198uFWMIX3sHUwDuHNpZcn347UVHmGQ1rYhMxRoZdPk3CMwb
	+QWiD0e9QOYvWGUUQHelfORR4TkL4+ZQIEIxjkusCfPAtdM1cHAnjnhRI2EkOq7C
	EaLCoLqTx7Qtwti1OnhC0sRVcqHpf/eWn/Ode3agf62+YnenyobUIm/OtRJYCxkj
	Mx8JOfKjP6Wc9CbvR/pWgQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4gg076btrb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 16:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1788562948; bh=JMVAd8kuYEIUKORq7hY1jTnzz9YB71ZZ5oE62M7t2Gk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=gIZrUH7tjBjPPdxfhpcTOSJoqdpvFSTB1nKKMkj+47NjPjDruiNDm/hko58fjKnLw
	 jXXqbroFYolZ78GXKB0mJ8qT47EydTawTsmghXvAXJkbBxeQ/QBSSYpsrznRXh6gIJ
	 7c0KHl7R+s1K5B4ySgIsx4YGhmnPDir7bXNTzPbdkQ8v7UOuZWooiAUVdD3lTHy0PS
	 uYOMZug79CdKrzYHqY1NC6uUZUE9avmi3D1lX2qnNCoXLyX/5l5q8PszeHwR+mW4uZ
	 XIid8TQ6E1xiMFQlJ52rlzdcg3pZdc4Qmj8EQ44sYRq50CHzEleAUp4xB71BiBJwaz
	 m/t0H2sRZR6tw==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 74C5340136;
	Fri,  4 Sep 2026 23:02:28 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id D4813A0E1C;
	Fri,  4 Sep 2026 23:02:27 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=A/XUcOfF;
	dkim-atps=neutral
Received: from CY3PR08CU001.outbound.protection.outlook.com (mail-cy3pr08cu00101.outbound.protection.outlook.com [40.93.6.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9610B40298;
	Fri,  4 Sep 2026 23:02:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UirdbUU/EOggRIVrWOluxCttj4HyFiIWelUm7UksDQqlHKRSAgtRWA8xSFpHAIsVuQAiA9HegKjgCq9gNqdSCGiCT2ZaKp3NyX3t3UeKomKw17UosuViosQE8OvhExoZvMjMiU0K9h1ZFiLcUQ565u7Qcxq3ga/9HF8HriJh4aWrGKkj85S3Ai+keK3e8v7EdTmpoEb6zZN9kM844ujABklSv0cuEpQESv15IpyO6Yj5+RRmeLXs2iQOOGef5I6dSj6DA4oLHT+Y8ia4wnF09b924AI8jsD6PT1KC/05f1xKMpoD4P+rbPr2zF1LUjjy5eIIFtmgedqTc1hGINicLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMVAd8kuYEIUKORq7hY1jTnzz9YB71ZZ5oE62M7t2Gk=;
 b=kEgdAPcTG6MhjHwOMWINX1i7LzVRY6sNpBOXwjbKIa+24vAeWjy92zlWTxU6TA68ZiB4J4dX9vgQ/s+lvit6QHPXPywIw+ezas9TIpLuXb0AZ5vzQ/6WDga0oVMMD0Nob8Jvj7vaaDfjfki5WFrSPAgNaYJ4gl6on3t2RrcMR93LVbC6qfhR1bNbtw9ldbfPAhJtspN01HOMHJzpOvIT5ice4++NoypqTprbHtVKiUiTHJuy+ECxgKGC6JKIHPb4rdAd8uIZ1hMLPyLPiL1zSc4NAuSpx1JLnolC8JsDfy6Sem9RuXoYHedbZpgDKW48+HTsRHU/p7pdWXSJKbiw2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMVAd8kuYEIUKORq7hY1jTnzz9YB71ZZ5oE62M7t2Gk=;
 b=A/XUcOfFJXEPOHTqYnK8CRF+Lf6ltVZJl7iM15+p3XtZ9bRYD845ZbfsrNV233UGwuxksgd+PbT25iMUuToTJEjQp+KoRTqxxzSzjZlI1yr4etaBb0crMaZYjSPbqAa1/auA6MenmXJn63/H21/9cf4lSocUDvs09denfzy3wUo=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by CH1PR12MB9669.namprd12.prod.outlook.com (2603:10b6:610:2af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 23:02:23 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 23:02:23 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v6 4/5] phy: qcom: m31-eusb2: Set phy type to EUSB2
Thread-Topic: [PATCH v6 4/5] phy: qcom: m31-eusb2: Set phy type to EUSB2
Thread-Index: AQHdNXzfuTvGoY7dzEa7szPlpt3mRba/F+qA
Date: Fri, 4 Sep 2026 23:02:23 +0000
Message-ID: <aptN9W2ktyFcQZe6@vbox>
References: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
 <20260826-eusb2-interrupt-v6-v6-4-ae2601cfa80c@oss.qualcomm.com>
In-Reply-To: <20260826-eusb2-interrupt-v6-v6-4-ae2601cfa80c@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|CH1PR12MB9669:EE_
x-ms-office365-filtering-correlation-id: 9fd6edbc-9085-4aff-29b3-08df0ad894eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|38070700021|4143699003|11063799006|10067099003|22082099003|18002099003|56012099006;
x-microsoft-antispam-message-info:
 72bNh+n5uFCILesxrLUyIovEXY2htvWOQL9nPGaJBB0GViw4LsY7YwkP2fP7+Jn9opfeArBDF26xej5MQt7PQviXOkXzNpRbnEZ7XgsU539mypoRwJww69/k8XpYvc2+iYlEo9E+oUxFd81llXdZxn8PhYMiIBx4A6O52i2b1r16EE+L6kmhjpnFuk4pRy+tFk/E0xxqOzWn7e6IwzWTeDQQXq8IlAl+WyKNai77aVfO+yakXshJxZjyj5/qUNdXYfWpl3BUj3leiGJgbkGiYJUqX0eCBF0O3oa4ZTrGhbRe17V7BXwy1j524pQb2Wt4tAa4YHHLgGcxpZiF3OY2NLxA2KUkyl0iRf4NWxmXLmm+9D2SGvHmGTeM45qV4nSmHS58GJN8emNVNMQ5RdF+j7xYpZThKDhN6dt1e6hopVNDlaBemCuI/j1CWzc/yQCd45oZ9CKRwxMsi7XUgbV3gYN4ofYORFqBoCjuO9NMK5ieKdGV2Gndjsi9w4QhzZPFq8MAtLGvAXdWKBYPeq9CclDnIkXslrfxr2IArwSuChmFjvu1FtLwtBWoxz90lacQfByrNNfMaQ3vhnDiaHcDYwNzue4D53fvT15gwFyhxWeJp7acGPkOIirZum5YYugzoaZX+eiGUeRUtVjenjC/sZxkn5YSTLRMdlGSFbR/kaRstasM3WcnI743BdUWse/UEIdoWBEdzvvSK9d6Hg8HScvTJSC/YK901U+3aEpa7+k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(38070700021)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cFZjWW1BZS9FSUY1aFU1d05MQWVyODkyYXRxN29uNGk3V0FTeTg5MnhMZEZF?=
 =?utf-8?B?Wk9FaWZmZEpVV0V1STdiTkNad3k5MFlLVjNnc3BlRWRnNmpnRThEK0QwWXUy?=
 =?utf-8?B?aHZ4M2tLazV0bzJJdjVIL01rMTJXOVJUVnJtM0VQMExreWNFM0RSajNjbmVu?=
 =?utf-8?B?QnpXaFlaZzV4aXVDejlDZCt3Y2kzUmFzb20yb0xRc0xQYkljUnB3MGxJYllm?=
 =?utf-8?B?UDBaeEF4aTVpZ2F3VGZOeG8vVjBhZ21xVzdBbE1rTzl6Q0M0ZzM3VEVqSjBO?=
 =?utf-8?B?MWxyNStjZzcrU3pXaVBPdndHbklmWlFXRGsxczBSdVhvU0NZdGl6V1NvbUVV?=
 =?utf-8?B?UldLMzFYeExpd1VPVFdBRC9jblNhVzg5WFF6cUlxZ0RWekJVMHRkSzhpaTVB?=
 =?utf-8?B?aDdnNHY0RGo2emhNNVpaY2RRVm85WGJLeVExYnZNcFZhRnJzcGtJaFNXVGRS?=
 =?utf-8?B?dE5mUEJyOHpKU0JDdkFKb1RYTUdVeUF5QWVRWW9QSEdzS282WE91Nys0RHM2?=
 =?utf-8?B?WE1aSkNYNThXbERUTHdkaHhnV21vUENtcUdvS1RscjRJUm9jQ1ZXbCt4aGQ0?=
 =?utf-8?B?azliSnVTeVhGNnY4QTRBeUZjeGsxWXZOOFA3SW9ueXNzanJtU2NJSmo1R1p0?=
 =?utf-8?B?SUFVR0ZHWlBLbVJoTjVOdFFhYkpLanNZOElsTkZsVGFQZzh0TG5nSk1KRTVD?=
 =?utf-8?B?VkRSQW9zSDlXTUs5dHdLejRMUWcrWkZTYU9kTlQyd0dzNWMzSVNhdFkyeWpE?=
 =?utf-8?B?TGNRb1BDVi9KRU8zaE1VL2lFVFg4cnMzQUk2WGtzK1ZpWWlpWXN3L0RQaFJG?=
 =?utf-8?B?SGdJVTNxVUgwTXRJOWozQ0t5OWdOaWUwWVNnTlFVUXMwZDFkUnhycU9DanpG?=
 =?utf-8?B?b2tMbzFVYUVMMU81WHRrRmlWdHNXMEphazVkejBLbm83bDEzakVUYUVpTFJ0?=
 =?utf-8?B?azRaazg4RDgyK0pPeHNtTjhkOEpzS3pMdTF0ODBjcWVsaXhkZE5zb2I4b3cw?=
 =?utf-8?B?UVVYc3dFTDJTb1lvT01mRjJBTDFta1puajgvL0ZXaTB2M09QY1lQNlZ4TWxq?=
 =?utf-8?B?Q3RmZk1CaXRZUnZqOGJNa3Nvbi9PMXZJNDdKYnc4blV3YmorQmZvbVA4WXUr?=
 =?utf-8?B?K0kwdGd2bEY5dzgzT2x1QW5COUl3bFFSbHQ5eHBvN3MxK1p0QmhCT1RsdnIy?=
 =?utf-8?B?UytrdkZlYXMra21QR2orMmV2ZWNjWHIrSFk1ZHJuaWtodUNYejBJOTFuMnJN?=
 =?utf-8?B?NDA2dU5FS2c0V1dwSE1tQ09DMk9oRmFLVTZPTVNya3ZLck0rQ1VUam94MWxi?=
 =?utf-8?B?YUdUc0J1WHYxQ1pZYm5FVSttVGhreVBTbDhTbFJoR1Z5cXg1RDB6Sk1nMk1G?=
 =?utf-8?B?ZFgxQmo4ZnVoOWVuOUlBWm1URnRXQ3Y5a09IbFpJeWw0NDA4UXB6cE0ya1BN?=
 =?utf-8?B?SG9HY3VoUU83UEZ2L3B6dFJiYndnWlZPWHk1dXZta3Z6R0srWnJmT1c1NFdK?=
 =?utf-8?B?NzJUcW5aMnROUyszbFZtaVlaK3FrTnNwNWx2UVE0NFBuMUYrK3ZRbGdjWlFt?=
 =?utf-8?B?ZWFNMmk3MEZpeWR2YWE0NUxMMkh6UWlFYXlWcEZMT3VkaEE0Q3Vlbk81MDRv?=
 =?utf-8?B?VDJoSzVENUo5S09MR09jblQvbmlPWWhtNloxYnBDM0d3ZzFyZlR5TmRmSTNZ?=
 =?utf-8?B?MExvcEFwRUFKMFlaaUxVeDdZdVJGdUpjYmZWQ2dUQkk1RlRDQTlRN0g2WklO?=
 =?utf-8?B?aEdWY2dYY2k4dzRQQ3F2WjFFejkxMXRLelRNRnZCbDJWbThmSGRJNmR4cGlV?=
 =?utf-8?B?VGpsMXgvY2JpODFVUy96SXcvbkdQb1dQcFFMbktlNVU4dXhqWkk2TG03Wnd0?=
 =?utf-8?B?RVAyY3JUNkpKbTlrdWU1ZDBwZFB5TFVIZWZQaXp6RCtuR2h1UzMrSmorbGxO?=
 =?utf-8?B?TUxlSXduWW9DSWhRNTU0OW5Pcnk2clJQN3ZGRVhFc3IrSi9YWG1BaTd6Y05r?=
 =?utf-8?B?OGRVQ2dMSWwrMGFGTmt2WS9RdnBEa1Y1N29zOU9Fd09MRWwzVVVqTnJqQ0t1?=
 =?utf-8?B?Zy84Q3VOOUxLMjZsYTYzdHdMVGE0YTJITW12UXU5UnB1a2VsbCsrSkl3TjR6?=
 =?utf-8?B?ZUg3c0lac1R5b3pzR1hGK2FNSk5rSm44Zm5oTmtXaFZVUzlyM1d1VnBtaExn?=
 =?utf-8?B?MVJUZHNGY2NZbWJENElhc2NMTGhwUFNlWDJTRHQ1bkNxa2FteFlFSWdwZk1V?=
 =?utf-8?B?Z0V3U3MzbkZBVHZwYXNFK3U1QzlGREdHZUFkekdIKzFLTFc3bE5GUHRNdXov?=
 =?utf-8?B?NVROYjA4cWpKUlFKelY0MTMzbERkYzEydWZ5NkhNb2QyalhSUTlZQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDA6D33910B930449F479B92BFECD284@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	2Zj1Qp9M+UIbQ9KQCmSuYoKxaG5ciVfGElxPzFbf+FrDlnQZ49CM7B/RQazXIUBtzDsnD9s4WQOeal//KtKZApwL+GrgpZxegFLvnmq+cAHxiWjn4u1TnYOhIO8Lii2/Mf7IoPdfwljVMC9vT0YLscBa5+dphyI2lMRgzpt9dmk0jqkOOG2t80/oQBtlFegnP22fznjaHDzXWorLR/9JntFt9eM0GnV8cASnZ+U9yEznlFCeaJhXLLM1nF0TdGWbSuw6B7bAolHZwHhDy9QBI39aXl3eqIGGV6mTgMtPMPjARXyN5S63jW4avRX4/XnCTwk7zA6Q2xKFoEPJTAe99A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	S44++n5r+n6QVq52wZc3+wkQvyU0OB4StmUwqogaN78G+1j6iiYYB/1L/5AhcOY45nDySl5nI6/9f2rBpTkDVJpkzWrhOMGv1mZJPqYbMDKXuc0rcSwaeCi781ZMtchQb7LWBaK1n5BXyj2cbQP6UcbL89sBa4V+SYQDJij7QkoxqZjxLBzHUrBbiWbGLEBKOktel2Urdms7Ve5mPiJ9ynW8kfdurhGymXeSDFuyUQRvCKkehu40txPxzhgwX92aoAMz4ScBGnqk2zeDkX7oXvv3zAcchDmiVLpuifkJpPHWtaXxkdup3WBZDRjrr30S4KrWBOFr1wk1xnaIQx6K4iGordbh7ahlZAGQEG77Ylncgdz/9MPj6ihw2MB1/qKnAEA2jgMCXKKudwE6uUsBYaQMXoHwEf7Anj+G/OGRUxZNRmbkNOQ3LURID9OVX6iB0wLu111/APdsEEzcI0AVjmxYUNhCBBGMDeit5v/Yer90rjXwMH/DODqCCN1ao6nuOtIa5Q2+zKosp87PdHOhzZj2wNwleUKyIP7wuzpc18TnId8shw5EmIho4+qOhBE6itOd5UgZ8ane4Sdqz8GNDZK3UV/xGzwlRDA/CD1dzB88S/BVtKPHx5TgbsusywBxFCWrAoHJBaGG6YC8jPaJ6Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd6edbc-9085-4aff-29b3-08df0ad894eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 23:02:23.7076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X5rBE869RWqSKG9DiozEEq7vIXXcgJwm8MiBosGsTBFb5OoomqBxgFZPZrg9X1E9VEBM+xsFjjXUSlR8zuMxHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9669
X-Authority-Analysis: v=2.4 cv=P+cKQCAu c=1 sm=1 tr=0 ts=6a9b4e05 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=v-Mogfb3BDEPKJCCZ1IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDIxNCBTYWx0ZWRfX1IQ5l3MKx8N3
 Pc114F+reYVCGrBAxaSSbgBejhA5UBYUyvnaSw7GYDox2RZg0WmHSTCYcradhodm4aq8H+mYIiB
 G1U11Wkhz32nqFyLAIncMfmBCPxlsTL6bh81CXp3RNLP29RH8TRGFos0mxqLIwuW59OJPN2RhjH
 TG3UhZRcWYbRqhtRyUjloBcd4j2KXGDNx2RCoCOp+4R2jS7ymc0A5voqYDv6gYRdhKSc2tNu3uY
 LRtP0GMxgDuG/r3IVYR7EaI6LlPpjXeiF8npQixkiyL3e93+Fh3rSZhUBWotCjBqqNQf2apJHzK
 sHZ18M0AjOQcvmiI3AU+hNVHpVn2FYeNu1CE3ccbcgRdetKYi4Q8yNplqQVdIlRvpdD7tNqOflB
 ZPpmVQ4V7+WrFElYP1bubvGIzUVy39FNRhoDCmbdT8YqC+bQtkSbVOF+8ZeYoqGKAg0EzFeu70C
 EwMperPhQ6paxH3wHKQ==
X-Proofpoint-GUID: E2fzxhD0ulH5Smi8SnAeK7rjSFgzELKb
X-Proofpoint-ORIG-GUID: E2fzxhD0ulH5Smi8SnAeK7rjSFgzELKb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDIxNCBTYWx0ZWRfX1ZtE+asKaE/6
 WmR7KhGhJq7H09YVvP2rposNdUzSzPzw+num07SEXJZ5yjZPqtbNGT9zoxYrWmCrxZttQDNBnNh
 x3MhS5iaspjIGO/Bp2OcnBkquvOe/88=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609040214

T24gV2VkLCBBdWcgMjYsIDIwMjYsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IFVTQiBjb250
cm9sbGVycyBsaWtlIERXQzMgYXJlIGFnbm9zdGljIG9mIHRoZSBraW5kIG9mIHBoeSAoVVNCMi9l
VVNCMikNCj4gY29ubmVjdGVkIHRvIGl0LiBTZXQgdGhlIHBoeSB0eXBlIHRvIEVVU0IyIHRvIGxl
dCB0aGUgY29udHJvbGxlciBrbm93DQo+IHRoZSBwaHkgdHlwZSB3aGVuIHF1ZXJpZWQgZHVyaW5n
IGl0cyBwcm9iZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEtyaXNobmEgS3VyYXBhdGkgPGtyaXNo
bmEua3VyYXBhdGlAb3NzLnF1YWxjb21tLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3BoeS9xdWFs
Y29tbS9waHktcWNvbS1tMzEtZXVzYjIuYyB8IDIgKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BoeS9xdWFsY29tbS9waHkt
cWNvbS1tMzEtZXVzYjIuYyBiL2RyaXZlcnMvcGh5L3F1YWxjb21tL3BoeS1xY29tLW0zMS1ldXNi
Mi5jDQo+IGluZGV4IDBiZWM4NjU3MTQ5Yy4uN2U2YjE2YjY5NTJiIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL3BoeS9xdWFsY29tbS9waHktcWNvbS1tMzEtZXVzYjIuYw0KPiArKysgYi9kcml2ZXJz
L3BoeS9xdWFsY29tbS9waHktcWNvbS1tMzEtZXVzYjIuYw0KPiBAQCAtMjc3LDYgKzI3Nyw4IEBA
IHN0YXRpYyBpbnQgbTMxZXVzYjJfcGh5X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQo+ICAJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihwaHktPnBoeSksDQo+
ICAJCQkJICAgICAiZmFpbGVkIHRvIGNyZWF0ZSBwaHlcbiIpOw0KPiAgDQo+ICsJcGh5X3NldF90
eXBlKHBoeS0+cGh5LCBQSFlfVFlQRV9FVVNCMik7DQo+ICsNCj4gIAlyZXQgPSBkZXZtX3JlZ3Vs
YXRvcl9idWxrX2dldF9jb25zdChkZXYsIE0zMV9FVVNCX05VTV9WUkVHUywNCj4gIAkJCQkJICAg
IG0zMV9ldXNiX3BoeV92cmVncywgJnBoeS0+dnJlZ3MpOw0KPiAgCWlmIChyZXQpDQo+IA0KPiAt
LSANCj4gMi4zNC4xDQo+IA0KDQpSZXZpZXdlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5
ZW5Ac3lub3BzeXMuY29tPg0KDQpCUiwNClRoaW5o
