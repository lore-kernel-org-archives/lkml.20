Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794446107;
	b=zQnVd8iL0zgRA7VkXZ8gIQxTZXsT7QBRqbfJCt2BxxJ2+rq/1rnIngMljUwSAev0F+uv
	 ZKdLigxZJXH84LFHRiXYnR/lZMxCizNkxYRdNQ+mV2z8AstGDJAFNt4f2P/jXLTrdZRWH
	 oMuibUZ/PiiAByNVMAfOmwUZNScKjV5UEj7+F7f+T+RemTYMW4N/gyW64Ldt46fK0SWZZ
	 Nibw7L6Kf3wpAgpNT2qAQLjGi8myOo9/2gDfPOcbsRn1tLQg3K5d89T4RCBDTjzhndT+/
	 BVTj9m9G3RlJILouHJb6/0caJiVprGl8MsSBqFJhUaaqfHGZe9aeDZnL/aQ9go20Z7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446107;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:Received:DKIM-Signature:Received:Received:
	 X-SNPS-Relay:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GVwdOc0aNf1VIyjvPSDkiT9J7yJTUCVntonl8yLLP6E=;
	b=mHaIDQJ9AgJIgKaHc504EOoOvss1CPbRCFRZpdomDd0TBiLIK+T7sm2Cxp03TxQddOzd
	 FWpWUja3I8oVbKNlOtqcR8NrqqvMqpa9d9hWcWYEWtD1oX9oVfMRl2of136Ud3N7zcm8P
	 uLvj8Dxu9/9gxXXbPLURYWKoM32BlqpoSJvrsU1xOd9cmYIFIRH17Hc/2alIIcpFbuHHn
	 6FQ08iUWVwtpzfaBI8kJb63kuPs4T/XPmvc+3zCJzaPT7tVP8yUw7q19rIy5bz06gPDPe
	 MoCLEQoSujrK3NX0XnuC3JxuSJZvx5Yge9JOYCB3LxmGfSyam1LicuFslJKx7QY8A2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=XKmzrve5;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=MtKbgcuL;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=l+OqUBLB;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161C9606A31C;
	Thu, 12 Nov 2026 01:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 161C9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=XKmzrve5;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=MtKbgcuL;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=l+OqUBLB
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABMbx031629448;
	Wed, 11 Nov 2026 17:14:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=GVwdOc0aNf1VIyjvPSDkiT9J7yJTUCVntonl8yLLP6E=; b=
	XKmzrve5jR/EQRNWBqzCEwQVEx7fIy3dFGq8hqG60lbRtOvRGrCGGHMsfYiRboMH
	utNm/qNDkFhdvgMthzl3OYxct/99qWxdVxAgcDnaKjd6E4225G0pMQFu038VSz0w
	Q+UGjWbcd8d/1EvyiEOQNbnHHDmyPn4ysy0/tGtYoFursUf8VfGO4XyakTYrdCCT
	uwbuEPKIxxaxNh6jzsu2EqpNoIUN+oY4CpfEcaBjNjKs0HAJPCguPWJsOj2jMRuG
	fPD1jtA6vTmzOHkqdl59mvkMRWQCVXDVByVuD9xJrAubuVhLI7bEhxZZnOXxkqDX
	lqS6FDwp+4ZP3p6JSAeuCA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4hvv7x35e0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 17:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1794446094; bh=GVwdOc0aNf1VIyjvPSDkiT9J7yJTUCVntonl8yLLP6E=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=MtKbgcuLjTkBHhqDyIHekRfl3kOa8jHQCwHFWcjDT/P2or7uk2nfneF7YMy1pFJeb
	 tPsMCMp/L/9mrKBkdni10buySCf642Wh2LEpbQtqRbntyJf4lOjqaI/UMX/sFxlUDA
	 +W6ArI/IyoSaANtJd7CzKwF1MxmQdd9H78N6T1AYLtbrYS84g5ynPOGELGGc2Pbiyu
	 v7TlKTZUCW4CR1QqC/6qLtS6s3/WdcnBvq1bFRO1emeHY4+RB6WFaAIeYBslVjEd6D
	 3tYuwuVvLRBcKft0GEA/lGmGi/mlvdb6kLOc8enpnlvOFKeQ1EKfZNv2t0j1KqJIPc
	 JRvVIfo8qwnmQ==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7A6D84054A;
	Thu, 12 Nov 2026 01:14:54 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id C6857A006F;
	Thu, 12 Nov 2026 01:14:53 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=l+OqUBLB;
	dkim-atps=neutral
Received: from DM2PR04CU003.outbound.protection.outlook.com (mail-dm2pr04cu00306.outbound.protection.outlook.com [40.93.13.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6CEC340112;
	Thu, 12 Nov 2026 01:14:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vl1amWuL/9AOi2St9BhQKeeWJrFhbJUqHYDDO9gGhnopdPUEmeKlpqxLkxIdEd0Jxy50QMypg/Q6gOMqsKsVeZuX/nDigQLtZ0GzXC6PAZ0d8c18+ArEVe3khAelLrjVjWQBeqbBSUTT+WJi5vEnzaDKMCNriVlF6xf5KYaw28MofF/MhXk4SEClUeB7COQLcJnUGlHzHlHzZAKFn+T0e9WuQjxqxjFa3RO35GlGj8LtTB8qiRx1PmNeXUe2pKZTWUsAO86cwXjDMt3JsWs7nuSe5LjcoVef4Ua8WEZNqefV3Ojth2xSZDO8Hqb2/MlLQuJd+kHDhKXrPmcqY3RIQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVwdOc0aNf1VIyjvPSDkiT9J7yJTUCVntonl8yLLP6E=;
 b=GyR9FP00MYOX2RBhcqq8c8TxM2zhPqGyZX59RD+vmWVo8WnPUp4+ofYECxOFyYYB5opPglTkaiviK+UoQRKeUE8v0fzhPv2uno0ttYbi0niltqHd8dJAVXqqlXmh5k58QWHqS+PxompNgLkReSNYPp+tTGNpfqSohPZBnITzNfk8xJWpTRPUlZyH6jCHTvCewIa1zCpq0M12higB9ioYUbs5kCh+jKaLnPHExu6XUPbpsW/YnFHj16By59a9v2TWUAIQqiQrOerqoES0Knb/yXGhiSxio06oUHSqTuWNVdT+T2a6sJOdQgIzTMt0B5x9qvcJVAxv4tOE5bKqXXKURg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVwdOc0aNf1VIyjvPSDkiT9J7yJTUCVntonl8yLLP6E=;
 b=l+OqUBLBzr9ydMVjNKFlJDNfpERffk4MY+vT/iTE+3pmp7cmYgFu/7mfyDAqHolt6oSwmdBPP6IAHPMhOALQEK9l1PggfGAUAiUfs0/UKQ3KcPRwLPollT4UkKQ6AYHsUd5j2PnK+/wENZ+qTPEfDJnNoCIiKzaz4uZCf+c5AhE=
Received: from SJ0PR12MB7473.namprd12.prod.outlook.com (2603:10b6:a03:48d::8)
 by IA1PR12MB6385.namprd12.prod.outlook.com (2603:10b6:208:38b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 01:14:45 +0000
Received: from SJ0PR12MB7473.namprd12.prod.outlook.com
 ([fe80::fd38:a665:ba4:95d7]) by SJ0PR12MB7473.namprd12.prod.outlook.com
 ([fe80::fd38:a665:ba4:95d7%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 01:14:44 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        "cros-qcom-dts-watchers@chromium.org" <cros-qcom-dts-watchers@chromium.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/1] usb: dwc3: qcom: Keep wakeup option default off
Thread-Topic: [PATCH 0/1] usb: dwc3: qcom: Keep wakeup option default off
Thread-Index: AQHdcPT3jDI2RZxA1kqryJC1NkKLu7cppHuA
Date: Thu, 12 Nov 2026 01:14:44 +0000
Message-ID: <avUMs981FKk7Kr3a@vbox>
References: <20261110092157.2989350-1-peter.chen@oss.qualcomm.com>
In-Reply-To: <20261110092157.2989350-1-peter.chen@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB7473:EE_|IA1PR12MB6385:EE_
x-ms-office365-filtering-correlation-id: 2130bcd0-f82c-40e0-380b-08df405a5631
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|18002099003|22082099003|3023799007|5023799004|11063799006|261026121527099003|261022105027099003|261026140227099003|261022075727099003|261009223027099003|261028144727099003|56012099006|261021121427099003|261102123227099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 5yhqZDba1kLp5AjnMkjBJXcz9mEFs454JGFrfAZTfvc2QIA/jRV+uyuQJnHpCaN6KpP67DeBBlUZUgmxe0WC0K57GtYEwH6V22tMCrTeDz8ZqbDzxeC2JItYxXfftA2tyisYSqm8A06d0iGlOV95RnpsXPHZqyoSsnREzjdd+lQdQJlNfQ9olUTK8kpd8ODBpgop1RnJPb9IOn2y/Rwn/Y+xRk2lzMiAhUNuIm28l7UUolWKIP794Vejwirn6FQqH2YUy+RrAUFB2a2jfusnBDMMu7Wzo6GmX0ZD0EYtT9dW8V61j11KU3okllYW5QebV/x5lWfkfftUXZ3Qhw2sBHkEAtKALXTNzXJ2r/YvrH2Hr/wTHKwRGM9TbSAICu0gJEfx3h3qxhOLHXO3++N0KGs7bXb1EjaKy1O6OLd9Wyn6FrNTG9WUzOPTnUw5Y1guoLIm14trvSswbfyvXtBP6KgK9Jtka/M1DL9cTHsPV9aiN3fD32r5X4pYipJjLcWShCt8mPdHbYQiojhcEltJ9qTiTLTg41jNK24/6yGRyTQ+eNvj5rC2feNvJoTKUjXk2Ib6S8JILhHBU31qOmBoGIzA5ar6Vzi8tJj8yK7EboTvlObNYUxYRbpVN56E7xehch/W9N3YvS6Suth4W7ov92qwebSqFcJwFwHQQ9KjBK9M33+f/jn+J0LUouH34ht9LJPSGnpcQzS2QZervNFGGA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB7473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(18002099003)(22082099003)(3023799007)(5023799004)(11063799006)(261026121527099003)(261022105027099003)(261026140227099003)(261022075727099003)(261009223027099003)(261028144727099003)(56012099006)(261021121427099003)(261102123227099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SVdhOHNlZ3JPR25qMzJqUFZneGJrZTR4ckFGRjB0dnVmVkVUdlAxbXZTMm0r?=
 =?utf-8?B?bVBNUlB3aHlQTExsOG9tVzQyenFtejArd0lza0dBSHlMeFd3VEViQTMzMEFJ?=
 =?utf-8?B?UkcwRlhNWFBBWWtHbVErcUljVm1qeFFtdGtVN1BtTExxbFlIaER0UzlXckcy?=
 =?utf-8?B?NDcvbSt4L1d2MkIxN0c0R0h1ekdmeFdSTE8wbFlLYzlsTytabGFWMndCb2tU?=
 =?utf-8?B?VzMzVzRDSkU1Q1ZXaWNjRmZIdjVhbHZtaDBPWXU4c0lSc2crUEpaM2JLZkNu?=
 =?utf-8?B?QUFiYndrQzdQK0dDU20vTzhIeTJpMDM0ZHpkc0ZqVjc3YW9CRUZsSTQrUUxy?=
 =?utf-8?B?ajh5VzQraEI1QnAzNURpbGJ5eWNXd3hJV3BGbVhya3A3VnhqWE90VGxxeHpR?=
 =?utf-8?B?aXJ5cTdzN2hkMVNYQzN1czJqMTdCWjJQQVRreU1vVSthVzgvbEJSQm1FRUFH?=
 =?utf-8?B?d2NNOHI5WGxYNTkyWTJSeEkwenY2YlFwZ1llbXRoTHhiUEZxd3VIUW0rMXpY?=
 =?utf-8?B?YTZyTUQzVlNtMnZsNXd5VjlKVnZxazQyYUgvak9yMFkzbmRpQ0ZhSTc4VnNB?=
 =?utf-8?B?NkFDbDNiR2x1U2ZJRXhVU1BNekd5UVhqbDZwQ1Fnc1kwVHhXUnVHMTJWUnRQ?=
 =?utf-8?B?dkd2OS9zZ1ROVjhIeUZ4UjFwYnBSOUx1Ti9lWElTbU5FN25kMzRqU1hlUysz?=
 =?utf-8?B?cTVLbnNYU2tUTFNKSzhEMU9XOWUvVDdJRWVLTVQwa0ZySGVPNGcvOGQ2Tndp?=
 =?utf-8?B?b0dRbmRYQldPYytxN0lDVDBqL0huSjhNV3JGQ1R4ZGpsMUZka1hWeUs2VVNH?=
 =?utf-8?B?REdSYXViajJ0OWQ1Z0oxWExxMHRaa0pKWUxuVWlURE92WlBDZFlQY0JRdW1U?=
 =?utf-8?B?NGpybyszRXRzYzlFYTFXWUp5NzNwUURrbjFkSktBMXpuc21aYm1NOFRBZjFR?=
 =?utf-8?B?L2tRcmNZVVFHNlRBRU8vbTNPVXZTUk5NSXFZSjZQMklSQWl2L3Y1UGg1M0JG?=
 =?utf-8?B?aEF0TVpQOTFUR3NWdXk1eHhLRFFySHQremRWMHMyRXlHTkttUUFTR3UwSERB?=
 =?utf-8?B?TmV6U2t3TkZNekhjUlgzMmNkbDlvZnQvWVFsT1hYRWVoLy8vYlEyZTh2NTY1?=
 =?utf-8?B?eFF5YlFEN3BFZm81eHFtTTVzMkJBUU9hSXgyZ0JNSDk3MUNWOHVyd0syaWJO?=
 =?utf-8?B?b3Z1d0J0VVExUW1JVEo1OFZtaGRuRWRqOXdhT3AxczcwdkhtSWQrZVE1MG5j?=
 =?utf-8?B?V3JTU1owM2FZL0FBbTBwbTE0alZoeG5LUzZPZ3J2K0RaZlJrVk9URjVNWHl3?=
 =?utf-8?B?YW85SzNNVHZWTkVkK1RpR2FsYTNxYzZPTEhCSW51TGdyQjZWMFZrY0s2QTNH?=
 =?utf-8?B?aXJycG9oWlpvcVVRSkNwbDRuaHh6VTZra2VWeDdXMXRSRFFBS2pQMG8rVTJq?=
 =?utf-8?B?NzdtQVo2cXE0YkdYcElOMjZOd0F6WmNwWTB2REcwRm0vdHZ3UUtxN2h6WHBO?=
 =?utf-8?B?YzhDdVM1aEhTcVY0RUhjaDFVVEZ2cllRZ0FocXJyRlEycjJTZDRQTkc2OXdB?=
 =?utf-8?B?RVBTZTh4NktJemtpWFlVbTRyODZKVTdBYnVNbTlpTHFsckcwTXFrZm4zaVYv?=
 =?utf-8?B?UE5aVG9XQVhMaW5obm5Ocmd4WVdwUlNlUXpvRks1UExJQ3YwWWhWbnhJaHpY?=
 =?utf-8?B?WGcrTXNSMWp2dWhoM01nN3hTRUU4NWJIVFFSV01NcWIrZE92UTllZ3Y1dERT?=
 =?utf-8?B?NGtsNFcvSVd1OWFlWDQ0bzhlNnM3TExqbzJPVXp5K212Z01kakEzK0FIQkRv?=
 =?utf-8?B?ZTcyQmxlT0V6bk5idjhYMG9FWGdJU2x3WEtCSVduQWpma2FmWW5Oa1FxejFQ?=
 =?utf-8?B?dEhsNTd1YVVac05HWVZ4WXRJSzFiL2l4TmR6Q2JkS3YzQW9pNGc0bGVGeWxZ?=
 =?utf-8?B?WmZKaEFKa3F4WjFHRW9aTytlblF0bm43MFA4V1h2RW92K1FYVXQ5V0RBWE44?=
 =?utf-8?B?aXZ3KzRWVEVycHpKMFl1TENPalNheS9PclkrY21qNTRUMWo4QjRuNXJNT0VL?=
 =?utf-8?B?ajNkWUdKbE9sNWRScDVWcTZiU01yby85djZZalhLTmpaOUlJM2VzTVFXRlFI?=
 =?utf-8?B?dC9IMjBRMlhmUWplSG54U0h5T0VmcWI5QWV5bU42Y1IxMnM2cEIwUy8zQWxC?=
 =?utf-8?B?SW9NMXhkRVMxKzErbjFXYjU3czhXSDBXMlZLcVBBdVJUNXFPN2NzUzRzaWlT?=
 =?utf-8?B?V1ZxcFBMdVpoZWxXQTZoSHBUcXVqRWo0cExHK0E1OVNvMnowb2IvNHJjRTRW?=
 =?utf-8?B?RWxuazY1REVNcjVMdXg4RVNhQ2JVbjhua29WS0JJVE93SzIwR1FEUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D3A87326C44B34F8A910AF6CFFB03D6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	TvZbsVcAzybR2GTsV8qEutT8NlTdjfcd9Ma1rBGZN73h+SMA/dZP0p2cBuZJdDpPGmR7YIzHXQlQq8CG8e5cco19hCUvENI0bY2x9r2dvZZF2GkmeT4JewpDkTyLsDmSI3eOj93r7noHJohAjAj2T1PwlieGNF5xI9FszHGAnwD+nnCS0cZL3rUVdZpD6x8OkFJGRoqt8sUdhB5ytHPYKkEHrLD+XtpvO0bAJ7BBqk4peZjC0+qAFIXPUAl533isEgjrmOflKdx+avs08++WVaAfjeHhG+T+SCQz7mHl52VyVmA/ogRr6iCkg0IyL1HoYbWZBpGADLtO3JD2cjtSuQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	y8akS7MU3ar6XBQw6LAUz2p9E1/Uj+fqjB0Te6/vnzVEzk44s2PBHwYpgcvXBhdxCXgtNJ0O5xrPOTCHfIIjc6gyAAwTB2bF4Vo/nklNTkhZnRJNvZoEdk1yA4bxAyq7Ql4i+PLGLs55sfQuSClIYAjeuxXkopjVT+zdKsaZTS/Wgi/90qGZprLzlqmGUl9eCtJvJd6hdW5L43kti/xKBkeRgdyTU1ejCtz7FSisLZffB8NuVJaD1vVU6t5B91sqCILrtNqoULUsDz8yDnv2AW2EDCB3gQ0ZW0bLYzbnL66v8yYN+9cKAS0cG/pMM7axz230QNpb9XqsWlZIGFrTXUCb4iE8P2oE4ekBT4jtPik2wynXg2sCXTCDe5uvHfX3X2hjeDLBKBKtne9FTpBU7x94i1LBeJhk75LBNevdhVxJLQrgytM7Jd7IDddUJ+Tcd4k9kqd8xioJ0uvuOsxIj4J+IqntGMTUUnUvNLuldPHPPfikJ3X4AqzJeRjqx2D/hG0kWcW/nvZACCZeRzLhGSc3M7L+Bd4ulSgehUek8SC0UIP7H6afO+0SAJ1j0tAUrmpum2WXJsYP5NiDY8QZqMFHEUJh5eLcJTVJ0+RL+gRkRuMRLU4tqXqCdeOxdNR1L0cfuTTH1Glsv+TVqv2rgw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2130bcd0-f82c-40e0-380b-08df405a5631
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 01:14:44.6591
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YmRPyxnGhT7NevcU11Y4vFuumTNeaaMWcIUH+GPVbnL/yTTFRsiW8B2V7uTiKJv6KNeRxbZnJkRNhKu/Vxl2pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6385
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwNCBTYWx0ZWRfX9+skxNOuBglZ
 wDEI49hkac+GejCIMPDiHSjUW6AJ9JTJ9+AhauwN8egGYCNLbhTkQ7MDBC3CvzwUQJ5fomS5LQk
 iVD4unsThgtiDUbVXIEe7r4bRLd9h3ODFimrCOsoAGZux+UGe34WQkwywb8n+hO54GjQZ/G8M6I
 H//rCmtHg84aGbk+WbRBNP7tcZPtHq8YH8snDqlAFjGrLMhJtXUhhn81ROBQIsKSBZq+nChXz2a
 k2YAkQWxnUO/fn5WBYB1vjPupiGYWjR4ClChrq3P34QBh4A75cVu5btKP0E0/oYlkwxnT30xSNQ
 YH9sVv78eyDNAqcjpyGXk2UmIM2Uh9VLu1VqACD95PoPtc2Lxd/L3C/ho85VdG+H+iPeCBjI6kA
 InEUcYWZyQUTYg8XGgPdPXp2pUJIuiDBvUA7yOdJlUgPE9324yLuCM5HHX0kSanKnI6oberWOoY
 Enj/PZ95qn1ec8mEaWA==
X-Authority-Analysis: v=2.4 cv=IuaL47/g c=1 sm=1 tr=0 ts=6af5130f cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=0IuIwsqmi4PtZByHH-gA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 2-yrrvgQj7pIN3oog6WrCMy27Lf0mcUL
X-Proofpoint-ORIG-GUID: 2-yrrvgQj7pIN3oog6WrCMy27Lf0mcUL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAwNCBTYWx0ZWRfXxPHQwBe01pZd
 BevajQi9oqOHY4NIuDlkrhOP0LTO9q3nrjGOfnv7TddicTPNJl9P59A4ux/z5GjhKLKXKEW0vFH
 oii4X+9dzSu911qYt7hDAMln2TXq8lk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611120004

SGksDQoNCk9uIFR1ZSwgTm92IDEwLCAyMDI2LCBQZXRlciBDaGVuIHdyb3RlOg0KPiBDdXJyZW50
IHBvbGljeQ0KPiAtLS0tLS0tLS0tLS0tLQ0KPiBXaGVuIHRoZSBjb250cm9sbGVyIG5vZGUgaGFz
IHRoZSAid2FrZXVwLXNvdXJjZSIgcHJvcGVydHksIGR3YzMtcWNvbQ0KPiBjYWxscyBkZXZpY2Vf
aW5pdF93YWtldXAoZGV2LCB0cnVlKS4gVVNCIGlzIHRoZW4gYSBzeXN0ZW0gd2FrZXVwDQo+IHNv
dXJjZSBieSBkZWZhdWx0LiBVc2VycyB3aG8gZG8gTk9UIHdhbnQgdGhlIHN5c3RlbSB3b2tlbiB1
cCBieSBVU0INCj4gaGF2ZSB0byBkaXNhYmxlIGl0Og0KPiANCj4gICBlY2hvIGRpc2FibGVkID4g
L3N5cy9kZXZpY2VzLy4uLi88ZHdjMyBkZXZpY2U+L3Bvd2VyL3dha2V1cA0KPiANCj4gUHJvcG9z
ZWQgcG9saWN5DQo+IC0tLS0tLS0tLS0tLS0tLQ0KPiAid2FrZXVwLXNvdXJjZSIgb25seSBkZXNj
cmliZXMgdGhhdCB0aGUgY29udHJvbGxlciBpcyBjYXBhYmxlIG9mDQo+IHdha2luZyB1cCB0aGUg
c3lzdGVtIChzZWUNCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3dh
a2V1cC1zb3VyY2UudHh0KSwgc28gd2l0aA0KPiB0aGlzIHBhdGNoIHRoZSBkcml2ZXIgb25seSBt
YXJrcyB0aGUgZGV2aWNlIGFzIHdha2V1cCBjYXBhYmxlLCBhbmQNCj4gcG93ZXIvd2FrZXVwIHN0
YXJ0cyBvdXQgImRpc2FibGVkIi4gVXNlcnMgd2hvIE5FRUQgVVNCIGFzIGEgd2FrZXVwDQo+IHNv
dXJjZSBoYXZlIHRvIGVuYWJsZSBpdDoNCj4gDQo+ICAgZWNobyBlbmFibGVkID4gL3N5cy9kZXZp
Y2VzLy4uLi88ZHdjMyBkZXZpY2U+L3Bvd2VyL3dha2V1cA0KDQpUaGF0IHdvbid0IHdvcmsgaW4g
aG9zdCBtb2RlLiBkd2MtPnN5c193YWtldXAgaXMgcmVhZCBvbmx5IG9uY2UgaW4NCmR3YzNfY29y
ZV9wcm9iZSgpLCBzbyBlbmFibGluZyB3YWtldXAgbGF0ZXIgZnJvbSBzeXNmcyB3b24ndCByZWFj
aCB0aGUNCnhoY2ktcGxhdCBkZXZpY2UsIGFuZCB4aGNpX3N1c3BlbmQoKSBjbGVhcnMgdGhlIHBv
cnQgd2FrZSBiaXRzLiBNb3ZpbmcNCnRoZSB3YWtldXAgc2V0dXAgYmVmb3JlIGR3YzNfY29yZV9w
cm9iZSgpIHdvbid0IHdvcmsgZWl0aGVyLCBzaW5jZQ0Kd2FrZXVwIGlzIG9mZiBhdCB0aGF0IHBv
aW50LiBUaGUgc2V0dGluZyBuZWVkcyB0byBiZSBwYXNzZWQgdG8geGhjaSBhdA0Kc3VzcGVuZCB0
aW1lIChwZXJoYXBzIGluIGR3YzNfcG1fcHJlcGFyZSgpPykuDQoNCj4gDQo+IFRoZSBtb3RpdmF0
aW9uIGlzOg0KPiANCj4gLSBVc2VycyBkbyBub3QgZXhwZWN0IFVTQiBhY3Rpdml0eSAoY29ubmVj
dC9kaXNjb25uZWN0IG9yIFVTQiBsaW5lIHN0YXR1cw0KPiAgIGNoYW5nZXMpIHRvIHdha2UgdXAg
dGhlIHN5c3RlbSB1bmxlc3MgdGhleSBhc2tlZCBmb3IgaXQuDQo+IA0KPiAtIFBvd2VyIGNvbnN1
bXB0aW9uLiBXaXRoIHdha2V1cCBlbmFibGVkLCBob3N0IG1vZGUgc3lzdGVtIHN1c3BlbmQNCj4g
ICBrZWVwcyBQSFlzIHBvd2VyZWQgKGR3YzNfY29yZV9leGl0KCkgaXMgc2tpcHBlZCkgYW5kIG5l
Y2Vzc2FyeSBsb2dpYw0KPiAgIGZvciBkZXRlY3Rpbmcgd2FrZXVwIG11c3QgYmUgb24sIHNvIHRo
YXQgdGhlIHdha2V1cCBpbnRlcnJ1cHRzIGNhbg0KPiAgIGZpcmUuIFRvZGF5IHRoaXMgZXh0cmEg
cG93ZXIgaXMgc3BlbnQgYnkgZGVmYXVsdCwgZXZlbiBvbiBzeXN0ZW1zDQo+ICAgd2hlcmUgVVNC
IGlzIG5ldmVyIHVzZWQgYXMgYSB3YWtldXAgc291cmNlIGFuZCB0aGUgY29udHJvbGxlciBjb3Vs
ZA0KPiAgIGJlIGZ1bGx5IHBvd2VyZWQgb2ZmIGR1cmluZyBzdXNwZW5kLg0KDQpTb3VuZHMgZ29v
ZCwgYnV0IHRoZXJlIGFyZSBzb21lIGNvbmNlcm5zLg0KDQo+IA0KPiBDb21wYXJpc29uDQo+IC0t
LS0tLS0tLS0NCj4gICAgICAgICAgICAgICAgICAgICAgICBDdXJyZW50IChkZWZhdWx0IG9uKSAg
ICAgICBQcm9wb3NlZCAoZGVmYXVsdCBvZmYpDQo+ICAgICAgICAgICAgICAgICAgICAgICAgLS0t
LS0tLS0tLS0tLS0tLS0tLS0gICAgICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiBJbml0aWFs
IHBvd2VyL3dha2V1cCAgIGVuYWJsZWQgICAgICAgICAgICAgICAgICAgIGRpc2FibGVkDQo+IFVz
ZXIgYWN0aW9uICAgICAgICAgICAgd3JpdGUgImRpc2FibGVkIiBpZiBVU0IgICAgd3JpdGUgImVu
YWJsZWQiIGlmIFVTQg0KPiAgICAgICAgICAgICAgICAgICAgICAgIHdha2V1cCBpcyBOT1Qgd2Fu
dGVkICAgICAgIHdha2V1cCBJUyB3YW50ZWQNCj4gVW5leHBlY3RlZCB3YWtldXBzICAgICBwb3Nz
aWJsZSAoY29ubmVjdCwgICAgICAgICBub25lIHVubGVzcyB0aGUgdXNlcg0KPiAgICAgICAgICAg
ICAgICAgICAgICAgIGRpc2Nvbm5lY3QsIG5vaXNlKSAgICAgICAgIG9wdGVkIGluDQo+IFN1c3Bl
bmQgcG93ZXIgICAgICAgICAgaGlnaGVyLCBldmVuIGlmIFVTQiAgICAgICAgbG93ZXIsIFVTQiBm
dWxseSBwb3dlcmVkDQo+ICAgICAgICAgICAgICAgICAgICAgICAgd2FrZXVwIGlzIG5ldmVyIHVz
ZWQgICAgICAgb2ZmDQo+IEF0dGFjaGVkIGRldmljZXMgb24gICAgc3RheSBzdXNwZW5kZWQsIHJl
c3VtZSAgICAgcmVzZXQtcmVzdW1lZCBvcg0KPiByZXN1bWUgICAgICAgICAgICAgICAgIHF1aWNr
bHkgICAgICAgICAgICAgICAgICAgIHJlLWVudW1lcmF0ZWQNCj4gDQo+IFBvc3NpYmxlIHJlZ3Jl
c3Npb24NCj4gLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQpUaGlzIHJpbmdzIG15IGFsYXJtIGJlbGxz
IGZvciBtZSBhbnkgdGltZSB3ZSBtZW50aW9uIGEgdXNlciBiZWhhdmlvcg0KY2hhbmdlIG9yIHBv
c3NpYmxlIHJlZ3Jlc3Npb24uIFBlcmhhcHMgeW91IGNhbiBhZGQgdGhpcyB0byB0aGUgY29tbWl0
DQptZXNzYWdlLg0KDQo+IFRoaXMgaXMgYSB1c2VyLXZpc2libGUgY2hhbmdlIGZvciBleGlzdGlu
ZyBwbGF0Zm9ybXMuIE1hbnkgUXVhbGNvbW0NCj4gYXJtNjQgRFRzIHNldCAid2FrZXVwLXNvdXJj
ZSIgb24gdGhlIFVTQiBjb250cm9sbGVyLiBXaXRoIHRoaXMgcGF0Y2g6DQo+IA0KPiAtIFVTQiB3
YWtldXAgc3RvcHMgd29ya2luZyB1bnRpbCB1c2Vyc3BhY2UgKG9yIGEgdWRldiBydWxlKSB3cml0
ZXMNCj4gICAiZW5hYmxlZCIgdG8gdGhlIGNvbnRyb2xsZXIncyBwb3dlci93YWtldXAuDQo+IA0K
PiAtIEluIGhvc3QgbW9kZSwgYmVjYXVzZSBkZXZpY2VfbWF5X3dha2V1cCgpIGlzIG5vdyBmYWxz
ZSBieSBkZWZhdWx0LA0KDQpUaGlzIHdpbGwgYmUgdGhlIGRlZmF1bHQgaW4gaG9zdCBtb2RlIGZv
ciBldmVyeSBxY29tIHBsYXRmb3JtIHdpdGgNCiJ3YWtldXAtc291cmNlIi4gV2hpY2ggcGxhdGZv
cm1zIGhhdmUgeW91IHRlc3RlZD8NCg0KPiAgIHN5c3RlbSBzdXNwZW5kIHRha2VzIHRoZSBmdWxs
IHBvd2VyIGRvd24gcGF0aCBpbg0KPiAgIGR3YzNfc3VzcGVuZF9jb21tb24oKSAoZHdjM19jb3Jl
X2V4aXQoKSkuIFBsYXRmb3JtcyB3aGVyZSB0aGlzDQo+ICAgcG93ZXIgZG93biBwYXRoIGhhcyBu
b3QgYmVlbiB0ZXN0ZWQgbWF5IGZhaWwgdG8gcmVzdW1lLg0KPiANCg0KQlIsDQpUaGluaA==
