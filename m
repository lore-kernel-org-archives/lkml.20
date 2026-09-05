Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F0627057D;
	Sat,  5 Sep 2026 00:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788568226; cv=fail; b=m4C9OedRywN3r3pSD1x1zZ8CuPpB2h6wPIZgkQyJApOKCHQAPOI7LEG33J3OQ3kdS4QJ0mHQBl8NlkQdrogYOcPopoU1nrx8PgOCKRWc8ceCzltHlZYljsFdPRYAZPrzej6oUBx/K4a32KMyGnYvYE3WsnYNezTYJSda1MhX4xY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788568226; c=relaxed/simple;
	bh=8Un2TjyOtgmFFRN4JdJXx08MBJruzIbMrxHFTSr/0/4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Dvix742RagkOqLQ5I2b0K16obQ7XDacHiETZIvoETfGmQ85Hr5x6yZSKTQTAl6QdvTY3kD7hECmjr4j2iPnh/6ZXDf7u/6bnhBcDIEXhRKJvF1VBCSaeq3eZ2CQLDp8unQcYn9DzQUQfKL7UtAAA9FK4xGHhCV1FexYSl4kPWBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=C7rC++VW; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YhKY/hJf; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=MCoUyqMQ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="C7rC++VW";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YhKY/hJf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MCoUyqMQ"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684Kd2FX3795125;
	Fri, 4 Sep 2026 17:30:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=8Un2TjyOtgmFFRN4JdJXx08MBJruzIbMrxHFTSr/0/4=; b=
	C7rC++VWYYDe6L1WrlYS2/5SLuAdl+yery2IT7FuJEYLtCMuyA5yV4Kiu7NVwe+/
	pYw7oqVdJaICMn797gbimAmKZsti4RvwEPgU0l3+9tauhX37DqgSEGzZ2/ZDZsMO
	p8HxlNGpr5tShfuafsRaWg/5dSCJtqgsBMuesByL/yLaPzCg0x/rNY4q+BLqeqAR
	gXTCa7JrrPQnzYRk8t52m63Iom2o3/Mph/wph+uWIsxxr2YmB5MXLrivq3Jl27aR
	a5a/QxqJzG/dexkG+ank9/3t1LL63qMAy4e5nllxZPPiDLxDE2B3CvLGmJhljwMe
	Sm/pwYwGu+qmZa0GJufnKw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4gg076cat8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 17:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1788568216; bh=8Un2TjyOtgmFFRN4JdJXx08MBJruzIbMrxHFTSr/0/4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=YhKY/hJf+fok0aKokpHSRGKJsDOVpnuTZMs4WfyfE+a7cXX/Mm7Yf8/o1pE0HrB92
	 NNB+iERfzGxDxF3QcWA7z4jI1LbSrys9TNNOdwhlKrDgCDBVnjVLF1D94+aaJrJZ0L
	 Gu+k5tiZcLWlx4SM9D+O/SnnM/Ij8mZYMiXBaNsltAfvTUPJc0lGSFjBFRGG9anZHx
	 pUMcwDOy2u77rU3Wbk59lVDSzRf2/+4zjPoMvgDMxYD8joHdV47Tznp/9qr6ZiZIQX
	 DlT+P785CbNk+hFZhEhC58U2CoopXLB1yx238FS0xIIk4u5SrSbk85CMQ8WFAwWvcb
	 Wkj8/r0Qzi2Rg==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0AB454012A;
	Sat,  5 Sep 2026 00:30:16 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 3D927A009A;
	Sat,  5 Sep 2026 00:30:15 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=MCoUyqMQ;
	dkim-atps=neutral
Received: from BYAPR08CU003.outbound.protection.outlook.com (mail-byapr08cu00301.outbound.protection.outlook.com [40.93.1.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id DED2C404F3;
	Sat,  5 Sep 2026 00:30:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUs5OGqc6R05ylTYt4PRZXgjgSL6mg8xbKTOuY3UsmnnRZcNuOJ6P1wVoTzcU/vMKqrItlpln8TN/q5JnqRgnWWUCuN6DYiIR8Kt5TG1uihXEn6wvN7NY0ObwSq9FhvFCe62FxAVAlBW4VcuHsJueOne8dVIl9GtzyRo//euYRjaJZopNfeTAVh6ZNykO4jy3BRBid+82VArTJyErFU6e+0K4N/8yNa1rh/QiSt3areDTJhffoIB/C5fwg0KjHdEZZVMq9o6J8ncoWcFmmbMlmSJWDpkPU3ghIRJ8WrdVzmq7PGJYVf0pRS7AW9v9uNN7UGlJk0g+YXHvug7b4sb2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Un2TjyOtgmFFRN4JdJXx08MBJruzIbMrxHFTSr/0/4=;
 b=hBWwLPY5P1ovr6V6RtkBBCAJwD7x+9FKS6+NEfvpk5hQbl6MsWRleEZEJmWxeRGKt47Rzf+Hz1sWUqjlGvUISLM2SP9XUIS1fdPXNYxbNOt5zZWdG+6i54LkznOHfNSHMKVqYujL53fcWB9fq8dXXKUuHcEhvLHJKJjsNkfajtrKDxi0QC+kWIWNTyKyOvfH32kLyQ0wCVnLq+orlDQpBjScJJy3wUTDtXqa4QyzKf2/Xl5/6laOkqdhHtO54NEE7UvoS8NOVAzJpqt8VE2U+qdJrTOnBIrlfvrxdqhCoib8CcVRfmStvhpADg00vkwnn6anXkUYButa+APfI5FraA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Un2TjyOtgmFFRN4JdJXx08MBJruzIbMrxHFTSr/0/4=;
 b=MCoUyqMQ2kwJW7FEJG6qOVSsLNGKkoj4La+HlMFsWVrZ0cACcWYZ5HhfgB/e2ldCSz4xhpRummx61a7IXLr8Iyz8PvNMwu2LZ8uktAY8BZo+Kjk+HmGRs8KHNqYLetTlahoZxak93rLp0geEDqXRcsY7QIZT44OpECAM8Luk7no=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by CHBPR12MB515368.namprd12.prod.outlook.com (2603:10b6:610:33d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Sat, 5 Sep
 2026 00:30:11 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.008; Sat, 5 Sep 2026
 00:30:11 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Konrad Dybcio <konradybcio@kernel.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sven Peter <sven@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/4] usb: dwc3: Notify XHCI core of tunneled status
Thread-Topic: [PATCH v3 4/4] usb: dwc3: Notify XHCI core of tunneled status
Thread-Index: AQHdOfmE1tgnFQ6/IUaWmqd4YKhkwba/J3cA
Date: Sat, 5 Sep 2026 00:30:11 +0000
Message-ID: <aptiahtWcH4PtQ0X@vbox>
References:
 <20260901-topic-dwc3_tunneling_state-v3-0-22fdced8de55@oss.qualcomm.com>
 <20260901-topic-dwc3_tunneling_state-v3-4-22fdced8de55@oss.qualcomm.com>
In-Reply-To:
 <20260901-topic-dwc3_tunneling_state-v3-4-22fdced8de55@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|CHBPR12MB515368:EE_
x-ms-office365-filtering-correlation-id: 9709d4f4-3b4a-4510-6f1f-08df0ae4d892
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|23010399003|366016|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003|38070700021|6133799003;
x-microsoft-antispam-message-info:
 27bPirg/e/Xst1E+TJd5VcYodXiEFq6GK++z92i38I99iqDWjrMLjH7Ln2kyKXrmwmX2Z7SnZs+EjzgeriWR7TG82PmM8i/C/B2ml/iRrmNLfP0IiD0VTBlHJb2r5Do5olSSazeasLAQ65fZ/MreDLnzWYQQawtldBPNcz21rL79kCpzIqbAOtD7FCmrlWFoc/+pPHjuqFCKw+lnA6eQSBZtcv/1eqffjDlw4E6LBaVRAAAgXN4YfsLk8k5fFhNuzxnLS8NMgSa35oQC28YFwbZTnO/QBDn/zMcTLHPKglox71tPWwYLuW/4NLjTQHV3iC0IMPBhGgRHDgRDTVgO03jomQv4j7Eh+TxwZOZ2kntbS69Lqu/g+CPsgo8IGcxV0y5PbqQi2QMvUz72sJ8eWlmq/lfHy3iSONFXq1VN5/U2Qs93FBTLeDGRFYnQyxX3kNHtIXbY0nWBeHn00lYpX20a0k5b/yvSoZurUlGPqJcMCCPbpveCJpkoXlfY0YSDTxgVlAkppJ3urFjdjgZKSKx3ivhr4vT8mi09J/iolb8J/ZdbRoy+QzUGq7BP4XdkO9y9R/r3tk471CdbarPrJKTazVESzJ1d7+CP3wBGUPyS6rN8yrKyt0TG+XZ/CyfgHI1oIhAIFgz066oDS+hEgeiib7nO6gC4+JPGorjNqD9xjDWtM3iJ6Md+9GHDKVNX5CmFi5dFYgl4TrJ/Z1ENHT58Jmv0Nv3RxrzSc4VqlyU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003)(38070700021)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aDF6ZDNaaVBkN2d0WnNweGRtczI0TkNhczlpTHlTaVBjRDRYRWcrM3oyWWtN?=
 =?utf-8?B?dEg0RUROWms0cGZ5dERvbUNQQXZ2WkFXQjRNLzZ2N2MxaHk4RERWUjZxQ25M?=
 =?utf-8?B?Z3N3K1FFcmtsRjlqc0hIclhFdTlJejJSaUFtUHQvMVJ5VGtkUHpSYzZEZXps?=
 =?utf-8?B?eSsxREhOMnZPS1JrQmJuZ0N0bDNVUHhCS1UwZUUwTHJ1SitkTkkxTytSRGI0?=
 =?utf-8?B?eEozMjgxeE1EVzJ1OWNZazdVcFQ1Rlpyb2diWERaVmFlMkxUQ0VCbTEvRTdS?=
 =?utf-8?B?Mm9FYWRVMlFmOXZkUUQxUXNxb0JOSUFBYTR3VlRUTnBDZ0RFWW9ITk9YcTV4?=
 =?utf-8?B?bktPOXhrbGJFeTZheWRQWnE0bytuRExFL1IvbW9QZ3ZDTEtVVHRUWG5paXkz?=
 =?utf-8?B?YWpzbjI1UFRrTThSL3NNTnZUU3k1M1NRelRoTklWZUdwVkp6RmRIVWR3bW1M?=
 =?utf-8?B?eFF2RjBubXY4LzRxbFdnZGI4MXhScC9tbjRwbFV4cjlvQnhmN3ppeTNsRjRz?=
 =?utf-8?B?VlUwUUwrcDdwSWRpSnBCdDVKeURBT1R1bW5Eb203dFIzSXh5dEVDNUZOQUtL?=
 =?utf-8?B?UUE1WGNuMC90QVM2cUJXd0E3TSsweC9KcnRpRGVlem1kSXovWkJ0N0x4RGNp?=
 =?utf-8?B?eEdBWnZieUpxQjlsbGdsK1BXT2JETjN0c09zSFRLQmxSTjgra2FCT0s1UjNY?=
 =?utf-8?B?MG9hR2pRQ0REVmVheTBONmh2b3RzeWpZMmdUSTlmcGFibmZhQlF6bTNYNm41?=
 =?utf-8?B?Z1ZFWDRyTVY4cUpQbjA4SkVzUE4zV0M0QXZDMEwrV1pFWWxCSjFnNHVZTTlv?=
 =?utf-8?B?SmFzdjR5NEJkQjlxRDJiL3BaMHFCS095MFBZMFJTand4M1ZlOStmMzUxUU9i?=
 =?utf-8?B?bDhnc2libElydnZiLzI1bHVFU0k2c0NNTmd6NE9CZGZSczkzMGpQRWVqMnlz?=
 =?utf-8?B?ZVM2WllUVFJDNGY3QnJtRnZHWUpod1FwRGx5NXdERitxNC9zcENsVzRJU1Jo?=
 =?utf-8?B?dldLcVNrSzBIM21zeWRQZGxwYlkvWGNSVHZ1SkdmQ01EYmJVS3FkRkdwMW5i?=
 =?utf-8?B?UTZDeEZhelVtVngyMHRCN2VjNStXRGovWXplRTJPRGVhd2xyRERwTDZCZlB2?=
 =?utf-8?B?ZEw1UXVDSGFpY0kzcDhwL2ZBRTBlS3d2dU1FK1BRMFNtMlF5VHdYR09yT0xT?=
 =?utf-8?B?YlFrNWhUaFg1VDBBSlRQMkEzTmtrODJVc1dRemV2SEw3ZEVEVmlEWm5xVUR2?=
 =?utf-8?B?U29WMmpsajJTNmN2L0pVWHdrbkZCTk1BSUFLYzhCYS9JWlpyV2RxU0NEbnht?=
 =?utf-8?B?bThPMzB5Zkd3bEZsV3NFd3NON2Z5SWhieGtzSG5VWUg1Q0ZrbnZKYWlPTEdz?=
 =?utf-8?B?TW55K0w2V3hPN29TUTVrMUY0RHN1V1djTmJneFowemxZVDJNbVkwbnVKditz?=
 =?utf-8?B?Z1EzN3dBcVE3L1ZCQnFvRE9BeWMzUVJNSk9jWFhCZ1pHMS9uVVRFM1FLRkRo?=
 =?utf-8?B?bFQ5Q2hralZUaXJWaUZ3cFQ4UnpKMUFYM1gyS3BKUFJXbVNyRWxSbUhzNkRi?=
 =?utf-8?B?cVRPMGphb240dlNTa3FFWHpOOEplNk55dFprbTJKMGhPbGV6YjFueXV0dGli?=
 =?utf-8?B?aUtjWVFCelVyQnoyNU52Njl3bWo1aktWa2xBLzRPeFdPb0o0N3l5YlNVWlhp?=
 =?utf-8?B?NzNURU41L0YzRFQ5bVp2QndCZkpOSi96UGhFcWtndkJlNlRFL2phQ29LSnFo?=
 =?utf-8?B?eFEyK1h3U3BwVFN1SjB0ekV2V1Mvbk4xQ2dmZ1R6dWpLSEI1dFIrNFpMTVdM?=
 =?utf-8?B?a1J1NDgrWmtFYkV1emR5cWtUTDNWR3pwcEhvclVJUVdOOVdIczB1VlBJY2JT?=
 =?utf-8?B?MWRaWWJVVkpmUXJ1WnJ1c0NWODhqSHZ0VVkvTExEbW1MQ2JHdTlHVmJaYWI0?=
 =?utf-8?B?ZE9ERng3KytVcUFuRDRuR2gvaWV5LzRLVzlJS04veEQ5Qzh2QVFIUHJMSzE1?=
 =?utf-8?B?U2Znb0F5SzhUcXhwN3ZGY0VyOG9mUnl4WFBxRFkvZ0JpWkhKUXZZZUlaLytr?=
 =?utf-8?B?eTBxRE93WDRJYXN1U2k0MVdMWXViQlZyT0prV0IxbTNhanRBRkhPRG9EM2lB?=
 =?utf-8?B?eDdjK2wvbXEwalFVT3NJMkVRMUZBaTUybzIvZzlkaHB5U2EwYnRkeUFqNTFp?=
 =?utf-8?B?RGlGSVRjRzcvTmpLbTVHMkxwNTIrSExWQ0hEeGRvZ2wrK3VUTE5PcVZXdXhn?=
 =?utf-8?B?MGVRT3hlbmlYN01PRUJxMEFIK0plc25qVE4vQ3ZyQXBBelIwZmYwN2pPaDJO?=
 =?utf-8?B?UlNtdTIwOFgxSDVVVjJydlZvTUNEQjJOVWk5cnYwdW9DUVZVOE5sUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <202127A58DA73E40B07D91E12D0FE40C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	0hIp4v2N0jTbIlNw01UoDku4nKRZZ0Mo/gnW95yfQsoBcoudpx+soU4H2zIqB8SuhbsjsBYwNZ8Et+qyVYB/VHdiI6I9ymnFolR6+b7OH+GDHHezlopq/rUjOuzRvhWoP+MyavUv9DYmVesTLuXO1CvgZ4B3ln7WS9wXWgYHWbMjm+ypTzMW5Q/ZRqCnzEdSM7QA8PcGMYav2pytc1L9Ywh7vo60QZojplb+v3r6xbKll5ZMKnIWuLLyYh3355tZp5Gvsq738jWDcUCcQ2sV4IQzSf5jwCSc9p0DvqfRoe1sJ0zcBM4MTyDBWdTzP58OSxdlFB22O+m0qUHLKA6fmA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qDmxJL1zoV4teleevEqIfpG67i6vpqDcORnblH7+WVFhU6LpC+0yopWWJY+8L0BSVlD3n44AC1uCeCH3975IyGql0iMR3XZFmSgzKg0RpFHJxr4txZtjxZoSPCV1QRNE3ku8zvw8xHWpwM8pq4m+mo9mre3hDbEi9Wel0sohW1N47XZezS6ol2rqlVPDuvaGkxLtqaso7oEqWEoCJPI2vNalNUInmtDdqmbtr3y/RSGDVH/99pfF8Y6MEDx1/67PduvQbXW70Qk/gZiEgPLTYext+opTZXbeT+i84wkQt82hwuaqVcXeH121rPyD7cqCtmeeoBWDTpd+A/pPJK3JJ3ds3ZYQEffelcBNPF1lm0+UhrIFqDbSFOPoh9iyIWPwqi4D/0iIeTvRnyfmnDIoFml0i3jlbv37U6Kd/cE3uKNKnu24EwoPbmjvibYbJAWSY68gp1jsiVnPOO1DUatIo6hpmmL42NlHUlFG5LzegU6QiaVbd6DoxUbY8KquWI2+RJcvb9wwDI79QhEMZfiFroadH/Xamq/Fb0bxUwrEGl2lTSuAdg/B6qIF2/TLgNI/gdwHqxgW2s1AIF0L34BOGLG9cz9KaRG7HFwBW67n8ULa4/X7zBoMcLc22RTM7YMW9WoSLcQ9f4acdcWqLNfjGQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9709d4f4-3b4a-4510-6f1f-08df0ae4d892
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2026 00:30:11.2168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jzfKHkMetGhV6mDyZjbMfb7Lu4Chew5zlu24OHNAQ4BxtWLQEqf0+ZhZV7uzd4qHZhQCtoOaWv33kdxAbDDa6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR12MB515368
X-Authority-Analysis: v=2.4 cv=P+cKQCAu c=1 sm=1 tr=0 ts=6a9b6298 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=pYQFO-_BfOuyAyQcWI4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAwMiBTYWx0ZWRfX6+sjk2w9AEkp
 THkGCsbqES6XSn+NKEGT4ZkJg8z7pyyq+9osgAAZeZu9zVB06WK0LDRwHg8k5OLXd2oMyrS7UPw
 qwjd07YQ4HHOvbmJo7hyB80DBm3SZ8yhhfU0znB/B1T6NX79yXEMhqR5AtEI7KKZ6QY1V4H4BxO
 WbSlEuA6aduJbC6VDltZF2zUHVn0lyU2BbUO8pu1iNjlt+gHmNmZO9qsBLpacN50LI+XM9rwycZ
 bHAuUXCIUMDoJz+7+Cf2BiSd0eGWXQyOE2xJJbDYYeY2+DesiPWomxxs3WWlqWWeFkhatbFjNWP
 urfeyN7KemlVLimdXtPluxGKegGwWIL5NWTi1/9KXczrBKWonTc6bCOMYxYeLOPg9Wkr+mwNWSh
 Vx9xsJdrKffaPAG2vrzxIS7VQSU+VTYOLYU76f8OVYDB/LcunoSbaKv+vMYa1yDK1vnjwYXt4MG
 vpL8juETC2vSoej8hfQ==
X-Proofpoint-GUID: Y34VvEfzCc6kC5Lsbz1Ci3HGHcwLXwev
X-Proofpoint-ORIG-GUID: Y34VvEfzCc6kC5Lsbz1Ci3HGHcwLXwev
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAwMiBTYWx0ZWRfXwD6ShKoJA0HY
 h4VrvkRCJ67ySVJ8gf+xBzRnHjD32mms9pogjhjTr+2PBn6EMbPWnFgojQv+b6WDvlbqM25HieI
 skZr5N6cIps74iX0IcLXin54qaIxlIw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609050002

T24gVHVlLCBTZXAgMDEsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+IEZyb206IEtvbnJh
ZCBEeWJjaW8gPGtvbnJhZC5keWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4NCj4gDQo+IFRoZSBUaHVu
ZGVyYm9sdCBmcmFtZXdvcmsgcmVsaWVzIG9uIHRoZSBVU0IgY29yZSB0byBjcmVhdGUgZGV2aWNl
IGxpbmtzDQo+IGZvciB0dW5uZWxlZCBwb3J0cywgc28gdGhhdCB0aGUgVVNCMyBjb250cm9sbGVy
IGlzIG9ubHkga2VwdA0KPiBydW50aW1lLXJlc3VtZWQgZm9yIHRoZSBkdXJhdGlvbiBvZiB0aGUg
dHVubmVsaW5nLiBUaGlzIGRlcGVuZHMgb24NCj4gZmlyc3Qga25vd2luZyB3aGV0aGVyIGEgY29u
bmVjdGlvbiBpcyB0dW5uZWxlZCBvciBuYXRpdmUuDQo+IA0KPiBBZGQgdGhlIGxvZ2ljIHRvIGhh
bmRsZSB0aGF0IGZvciBEV0MzIGNvbnRyb2xsZXJzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS29u
cmFkIER5YmNpbyA8a29ucmFkLmR5YmNpb0Bvc3MucXVhbGNvbW0uY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvdXNiL2R3YzMvY29yZS5jIHwgMTYgKysrKysrKysrKysrKysrKw0KPiAgZHJpdmVycy91
c2IvZHdjMy9jb3JlLmggfCAxOCArKysrKysrKysrKysrKysrKysNCj4gIGRyaXZlcnMvdXNiL2R3
YzMvaG9zdC5jIHwgMTIgKysrKysrKysrKysrDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDQ2IGluc2Vy
dGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyBiL2Ry
aXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+IGluZGV4IGZkNWMyY2QzNmM1OS4uNmFmODkzNzUyNWZm
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiArKysgYi9kcml2ZXJz
L3VzYi9kd2MzL2NvcmUuYw0KPiBAQCAtMTYyLDYgKzE2MiwyMiBAQCB2b2lkIGR3YzNfc2V0X3By
dGNhcChzdHJ1Y3QgZHdjMyAqZHdjLCB1MzIgbW9kZSwgYm9vbCBpZ25vcmVfc3VzcGh5KQ0KPiAg
fQ0KPiAgRVhQT1JUX1NZTUJPTF9HUEwoZHdjM19zZXRfcHJ0Y2FwKTsNCj4gIA0KPiArZW51bSB1
c2JfbGlua190dW5uZWxfbW9kZSBkd2MzX2xpbmtfdHVubmVsX21vZGUoc3RydWN0IGR3YzMgKmR3
YywgdTggcG9ydCkNCj4gK3sNCj4gKwkvKiBQcmlvciB2ZXJzaW9ucyBoYWQgbm8gQ0lPIHN1cHBv
cnQgKi8NCj4gKwlpZiAoIURXQzNfVkVSX0lTX1dJVEhJTihEV0MzMSwgMTkxQSwgQU5ZKSkNCj4g
KwkJcmV0dXJuIFVTQl9MSU5LX1VOS05PV047DQo+ICsNCj4gKwkvKiBOb3QgYWxsIERXQzMgaW5z
dGFuY2VzIGhhdmUgQ0lPIEhXLCB0cnVzdCB0aGUgcGxhdGZvcm0gZmlybXdhcmUgKi8NCj4gKwlp
ZiAoIWRldmljZV9wcm9wZXJ0eV9wcmVzZW50KGR3Yy0+ZGV2LCAidXNiNC1ob3N0LWludGVyZmFj
ZSIpKQ0KPiArCQlyZXR1cm4gVVNCX0xJTktfVU5LTk9XTjsNCj4gKw0KPiArCWlmIChkd2MzX3Jl
YWRsKGR3YywgRFdDM19DSU9DVFJMKHBvcnQpKSAmIERXQzNfQ0lPQ1RSTF9DSU9fRU4pDQo+ICsJ
CXJldHVybiBVU0JfTElOS19UVU5ORUxFRDsNCj4gKw0KPiArCXJldHVybiBVU0JfTElOS19OQVRJ
VkU7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyB2b2lkIF9fZHdjM19zZXRfbW9kZShzdHJ1Y3Qgd29y
a19zdHJ1Y3QgKndvcmspDQo+ICB7DQo+ICAJc3RydWN0IGR3YzMgKmR3YyA9IHdvcmtfdG9fZHdj
KHdvcmspOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmggYi9kcml2ZXJz
L3VzYi9kd2MzL2NvcmUuaA0KPiBpbmRleCA2MDhkYWViN2VmMTAuLmRlY2M1MWNkNjUwNSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gKysrIGIvZHJpdmVycy91c2Iv
ZHdjMy9jb3JlLmgNCj4gQEAgLTE3OSw2ICsxNzksMTEgQEANCj4gICNkZWZpbmUgRFdDM19PRVZU
RU4JCTB4Y2MwQw0KPiAgI2RlZmluZSBEV0MzX09TVFMJCTB4Y2MxMA0KPiAgDQo+ICsvKiBDSU8g
cmVncyAqLw0KPiArI2RlZmluZSBEV0MzX0NJT19CQVNFKG4pCSgweGNkMjAgKyAoKG4pICogMHgz
MCkpDQo+ICsjZGVmaW5lIERXQzNfQ0lPQ1RSTChuKQkJKERXQzNfQ0lPX0JBU0UobikgKyAweDAw
KQ0KPiArI2RlZmluZSBEV0MzX0NJT0NUUkxfQ0lPX0VOCUJJVCgwKQ0KPiArDQo+ICAjZGVmaW5l
IERXQzNfTExVQ1RMKG4pCQkoMHhkMDI0ICsgKChuKSAqIDB4ODApKQ0KPiAgDQo+ICAvKiBCaXQg
ZmllbGRzICovDQo+IEBAIC0xMzE0LDYgKzEzMTksNyBAQCBzdHJ1Y3QgZHdjMyB7DQo+ICAjZGVm
aW5lIERXQzMxX1JFVklTSU9OXzE3MEEJMHgzMTM3MzAyYQ0KPiAgI2RlZmluZSBEV0MzMV9SRVZJ
U0lPTl8xODBBCTB4MzEzODMwMmENCj4gICNkZWZpbmUgRFdDMzFfUkVWSVNJT05fMTkwQQkweDMx
MzkzMDJhDQo+ICsjZGVmaW5lIERXQzMxX1JFVklTSU9OXzE5MUEJMHgzMTM5MzEyYQ0KPiAgI2Rl
ZmluZSBEV0MzMV9SRVZJU0lPTl8yMDBBCTB4MzIzMDMwMmENCj4gIA0KPiAgI2RlZmluZSBEV0Mz
Ml9SRVZJU0lPTl9BTlkJMHgwDQo+IEBAIC0xNjU4LDExICsxNjY0LDIzIEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCBkd2MzX3ByZV9ydW5fc3RvcChzdHJ1Y3QgZHdjMyAqZHdjLCBib29sIGlzX29uKQ0K
PiAgI2lmIElTX0VOQUJMRUQoQ09ORklHX1VTQl9EV0MzX0hPU1QpIHx8IElTX0VOQUJMRUQoQ09O
RklHX1VTQl9EV0MzX0RVQUxfUk9MRSkNCj4gIGludCBkd2MzX2hvc3RfaW5pdChzdHJ1Y3QgZHdj
MyAqZHdjKTsNCj4gIHZvaWQgZHdjM19ob3N0X2V4aXQoc3RydWN0IGR3YzMgKmR3Yyk7DQo+ICsN
Cj4gKy8qKg0KPiArICogZHdjM19saW5rX3R1bm5lbF9tb2RlIC0gQ2hlY2sgd2hldGhlciB0aGUg
bGluayBpcyB0dW5uZWxlZCBvdmVyIFRCVC9VU0I0DQo+ICsgKiBAZHdjOiBQb2ludGVyIHRvIERX
QzMgY29udHJvbGxlciBjb250ZXh0DQo+ICsgKiBAcG9ydDogMC1iYXNlZCBwb3J0IGluZGV4DQo+
ICsgKg0KPiArICogUmV0dXJuczogVVNCX0xJTktfVFVOTkVMRUQgaWYgdHVubmVsZWQsIFVTQl9M
SU5LX05BVElWRSBpZiBub3QsIG9yDQo+ICsgKiAgICAgICAgICB3aGVuIHRoZSBjb250cm9sbGVy
IGRvZXMgbm90IGhhdmUgVVNCNCBjYXBhYmlsaXRpZXMuDQo+ICsgKi8NCj4gK2VudW0gdXNiX2xp
bmtfdHVubmVsX21vZGUgZHdjM19saW5rX3R1bm5lbF9tb2RlKHN0cnVjdCBkd2MzICpkd2MsIHU4
IHBvcnQpOw0KPiAgI2Vsc2UNCj4gIHN0YXRpYyBpbmxpbmUgaW50IGR3YzNfaG9zdF9pbml0KHN0
cnVjdCBkd2MzICpkd2MpDQo+ICB7IHJldHVybiAwOyB9DQo+ICBzdGF0aWMgaW5saW5lIHZvaWQg
ZHdjM19ob3N0X2V4aXQoc3RydWN0IGR3YzMgKmR3YykNCj4gIHsgfQ0KPiArc3RhdGljIGlubGlu
ZSBlbnVtIHVzYl9saW5rX3R1bm5lbF9tb2RlIGR3YzNfbGlua190dW5uZWxfbW9kZShzdHJ1Y3Qg
ZHdjMyAqZHdjLCB1OCBwb3J0KQ0KPiAreyByZXR1cm4gVVNCX0xJTktfVU5LTk9XTjsgfQ0KPiAg
I2VuZGlmDQo+ICANCj4gICNpZiBJU19FTkFCTEVEKENPTkZJR19VU0JfRFdDM19HQURHRVQpIHx8
IElTX0VOQUJMRUQoQ09ORklHX1VTQl9EV0MzX0RVQUxfUk9MRSkNCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdXNiL2R3YzMvaG9zdC5jIGIvZHJpdmVycy91c2IvZHdjMy9ob3N0LmMNCj4gaW5kZXgg
YzU2NzQxNjFiMmIwLi4xYjljNGY5NGMyZmQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3
YzMvaG9zdC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvaG9zdC5jDQo+IEBAIC03OCw4ICs3
OCwyMCBAQCBzdGF0aWMgdm9pZCBkd2MzX3hoY2lfcGxhdF9zdGFydChzdHJ1Y3QgdXNiX2hjZCAq
aGNkKQ0KPiAgCWR3YzNfZW5hYmxlX3N1c3BoeShkd2MsIHRydWUpOw0KPiAgfQ0KPiAgDQo+ICtz
dGF0aWMgZW51bSB1c2JfbGlua190dW5uZWxfbW9kZSBkd2MzX3hoY2lfdHVubmVsX21vZGUoc3Ry
dWN0IHVzYl9oY2QgKmhjZCwgaW50IHBvcnRudW0pDQo+ICt7DQo+ICsJc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldjsNCj4gKwlzdHJ1Y3QgZHdjMyAqZHdjOw0KPiArDQo+ICsJcGRldiA9IHRv
X3BsYXRmb3JtX2RldmljZShoY2QtPnNlbGYuY29udHJvbGxlcik7DQo+ICsJZHdjID0gZGV2X2dl
dF9kcnZkYXRhKHBkZXYtPmRldi5wYXJlbnQpOw0KPiArDQo+ICsJcmV0dXJuIGR3YzNfbGlua190
dW5uZWxfbW9kZShkd2MsIHBvcnRudW0pOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHhoY2lfcGxhdF9wcml2IGR3YzNfeGhjaV9wbGF0X3F1aXJrID0gew0KPiAgCS5wbGF0X3N0
YXJ0ID0gZHdjM194aGNpX3BsYXRfc3RhcnQsDQo+ICsJLnR1bm5lbF9tb2RlID0gZHdjM194aGNp
X3R1bm5lbF9tb2RlLA0KPiAgfTsNCj4gIA0KPiAgc3RhdGljIHZvaWQgZHdjM19ob3N0X2ZpbGxf
eGhjaV9pcnFfcmVzKHN0cnVjdCBkd2MzICpkd2MsDQo+IA0KPiAtLSANCj4gMi41NS4wDQo+IA0K
DQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpU
aGFua3MsDQpUaGluaA==
