Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA963603C0;
	Thu, 27 Aug 2026 02:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787796710; cv=fail; b=ooGVXckpQFgLm9uXMLWZDAMy2wM8C5ZAVQSfjs5qm2LdfS0QU9oXfygIhRmReCS3C/acYg5bQO0CB9KgCtutxSnlOdff+uVbzvB1IjPNtPuOWOcYKWwXDrc2OonkNV89tYJ4I9oXnhpeMAEi/Mg6+56T7oV2Azyc79P+FZEDHSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787796710; c=relaxed/simple;
	bh=6eSWi31aneWEixMS9O+75VAmIoGtwa8x90anTC/LzTg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HjJQROZaMmgK8WabCO/YGzZAyFQTJPAcfFXP11Wwdl1mE/RkkLKegm2m/j5pAzTWAHnVCHgiWGIhrUCq8qSGs3azoQO3CjGlA0PH7PNMxnZsG/NhkyjaSSQn3eSdkL8OECLlsoDjEzug5sUiTczwkcMVCEDeoqLWToWECLUJHT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=e3hhlmMD; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=AedRO4cG; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ttpS3U32 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="e3hhlmMD";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AedRO4cG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ttpS3U32"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R0SAMD3868546;
	Wed, 26 Aug 2026 19:11:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=6eSWi31aneWEixMS9O+75VAmIoGtwa8x90anTC/LzTg=; b=
	e3hhlmMDljBcAjRV0sCnAKSTaOHz8ojOfqzcJak5QiMDooTTXYzOFK7wqjtzz7l7
	GVH/Ilysh2mw7SMvxREBxUEe4aNo4DInU6653f1fHjoJ7gAN1jKSwk3yVBNwAKuP
	M9Xuuc+XjQt8hY67AIuhXUFkwXsFY+mFt3KdSTbuiL1loaqx5XmSzUcMuJmU11uM
	XopK881LkHIxyvZG3E4SL+GdDV/CwU8k9eyk+oEA1zHmlQa4EHrtRfwuwnM4mUia
	YX74lt5xK+0oGE8Z7/yF387CJLsUnYTPt7YvVRJYSqi7szjxagLRpxEm45B7ttqt
	GM5KwMYLUZ62+QGWIlh5sg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4g9vrw7cbv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 19:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1787796695; bh=6eSWi31aneWEixMS9O+75VAmIoGtwa8x90anTC/LzTg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=AedRO4cGmzn9B6GFvq16NInk81jsO/0fssjdyulAOFS3/xaiJwZfd7vEl+w3l7ltF
	 gGsdodSWaVdsoaBkxapAQ5DJCZXgGZlFARRiFm9+dARx6OsBKOsbhqtVOlOs2UFzkQ
	 6Wtx9yzDV4LMQXbVSKWhymj1cnbkFVqzCKGaQB5jZ8hebNWu2eiFRl4bS5qU3qdxVg
	 cyqQ2ETDAwM+5WWlGcP+WZOHdooRhhs2te6Deuppmu5E4hE6K2xEzg5jeZym3/OeNl
	 6p6IM1tSsVw8PUEHzIXC3zZGJ4o8TduRVCIUj6MxubJ4nXlXYpokimTnyvVgLUTjTS
	 wbn9jnV2SJXPw==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A6294401E3;
	Thu, 27 Aug 2026 02:11:34 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 58F16A0068;
	Thu, 27 Aug 2026 02:11:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ttpS3U32;
	dkim-atps=neutral
Received: from DM2PR04CU003.outbound.protection.outlook.com (mail-dm2pr04cu00304.outbound.protection.outlook.com [40.93.13.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6A19C4011E;
	Thu, 27 Aug 2026 02:11:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QqybXHehWssuFfB91lEWSxsNynJK5lJWt9L6o0r1V/bv+EKuPn/rpanBAiTyilH1/pLLfIU8o154jcLj8739rksmH1pmJSZYnG/rCT1l2Bd/D91JZXEKPjbILNDXpQkttcje5Feauv1z9tyIfbJnqWUY0M3xi2lZ8LEEv17gjhM/BmPXLR299hkLVlyh9GohH2WKWL4bshCXUeKjtfyHNqGsFHyxWmFXwAUs/WpJtVspjTVz2Ob0+hNypVh6comOscBb8usNGk28ZCmT3qIN4cpJQDxFpCa1Ws835sBxakES0SnNTx+9ISvno9RkCVWSghZl2RFZC+J0Qg5b9w+qsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6eSWi31aneWEixMS9O+75VAmIoGtwa8x90anTC/LzTg=;
 b=U3WjCU3kTioeWki3sRfJsdEgZ4359kBhRfDsLsFeag+QznXB7EvPiD/zyiMV+iG71TTMTcjQ76ZniblJ8tiywVdr/nVrWQ3cM0y0E1A0EJV47482sLrkbJGAXWRAWufN3YcaPROjZ/AZRzgBgtfjv4dvJJBY9SwNhEQPK6K7uvhWXBg63wqeybmDVvrEzWZnvdhS9OtvleucrIXqggYtCGMa/7/9EoUuUUSRysmQQ2M67FvNuINb/gulSMql+sq0TAJ8jFWVScBJYkZIll6DvZ5kV3mhm0vZ3XkdefLYXvsLVBFz9Fmw1bk7gaCR/2/j8mVEvIpF3Cd4kLiHmmVyxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eSWi31aneWEixMS9O+75VAmIoGtwa8x90anTC/LzTg=;
 b=ttpS3U32/E1CTKC5qylpI8ZOrOP3QJyoAzM7pcZyUc2x0c7hpk8rDIpxmj28fsa3nt5d4yLJGsSTcIc++aaFpxy9YzmWAPpLrTRy4oNRLUyjaRnWJfaNmDUk9R/q/cpN9uzOR3vEpLETzIx6FS11GryI8pg9RTnDlYYmJ4B5IpI=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by IA0PR12MB9011.namprd12.prod.outlook.com (2603:10b6:208:488::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 02:11:20 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 02:11:17 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Junzhong Pan <panjunzhong@linux.spacemit.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "troy.mitchell@linux.spacemit.com" <troy.mitchell@linux.spacemit.com>,
        "peixin.xie@linux.spacemit.com" <peixin.xie@linux.spacemit.com>
Subject: Re: [RFC PATCH] usb: dwc3: core: resume xHCI child on runtime resume
 in host mode
Thread-Topic: [RFC PATCH] usb: dwc3: core: resume xHCI child on runtime resume
 in host mode
Thread-Index: AQHdKXED67eHC94XdU+mjRf+FXKei7axP8uA
Date: Thu, 27 Aug 2026 02:11:17 +0000
Message-ID: <ao-QDVibwU90yPm_@vbox>
References: <20260811090817.109350-1-panjunzhong@linux.spacemit.com>
In-Reply-To: <20260811090817.109350-1-panjunzhong@linux.spacemit.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|IA0PR12MB9011:EE_
x-ms-office365-filtering-correlation-id: 63afd74e-8c7b-4105-da02-08df03e07aa9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|6133799003|3023799007|10067099003|56012099006|11063799006|5023799004|22082099003|18002099003;
x-microsoft-antispam-message-info:
 ylwtGAXbzA1unzJX1z3Q1x9KCAeHtJ6iYYJR7OpHWvrdm+ZBGLhT69ogNh5tb80JQy0h7DVpKFFTj8H4JX3IWUwp3Fs2O03qFRiHmfYBpJtu7ANBvoX+i99nFnCommP4nyUQR4QozhgSvIh3061w1nLMQewQvbgN3Mf+s5rPD3c0tPGaZCQ9vPsFlbErdFjSMaBm5cwqPCm49A56QKhRYUMRraNw3FElunk3q2OCifVhnpmXqizIBf1obPBOeCgtlE5euS7XLLEFC2XeUE09HqUZ+bjO1CATzWTSnlQPe/XGlTWaH06pw3bw/iJcINcIxR7C4Os2/GLFl0k7ueYD5AcScnBC6Lj9PIAJsXyWDtz7zTr8SnK4kNZNByziToRux8i2YHjxga0Pl/HVwxdyFPRTsx5Nb6kBf+zswrsszmSIDQqQYLL8vNR8Wd2F1pJWDa1YsKmrr/7rDIyooeua2m28Te1RkQ1qzsfgOV/Ea7OdmtJUSIFo7tIN7K8daoX190vsOG6RyO5dAsN9vEyEpVnjcre20vxeLky6BeVeG5iS/jz/8xW17eq6Og0zQqIo8V/fToneKsR2qw/GIr3FBMAUEPUOQjUwzlt05hLJc98b/s8fIu8QsYb10/0YRWbLRThwzouI5t9tNA1WIfC2SF8bMVi7U6jfNsyP9riD0zEW+QC8TqIqrM1vU4/wzsbypjiW+sacKUlf9pStxcmzhJ9dtrFRvG6QoWEXPjRNGZI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ejgrcnBnOXRZL3Q4TXpjM3pWYUxjYVRJUVdIMFhTUE9uc0U1YnJ0UnJZbFJk?=
 =?utf-8?B?TTJrZnpRYnluM3g3MUJmM3puVVlmejlhR0Q1alZLZHFiYjFNTVRlME1ZaTlI?=
 =?utf-8?B?U2hFWS94WUYreTRZV3dVdU5mY1hPS3V4d0ZIVXVWTzdrZytxWDE0bTZvRHFP?=
 =?utf-8?B?ZExoSHdIVUkzN2g3bWVtdkIxTTFCMFk5MnFFZkF1VEVqZFlsUy9td2FHUzdZ?=
 =?utf-8?B?WnJqY1NoSWs4VUk1ZkJqQmhrMU9EeGMrRkowWVQ1bG4vZ2wrSEFwZm1BYmZG?=
 =?utf-8?B?T21sZmZYTnNXTEF2VEhWUWtmOGVzS1REbHY4aUgwYkhlSndKS2hNRnVsYldT?=
 =?utf-8?B?cHIwUFBFcHdCeVlZL2ZEd3ZZVVB6RnJqYmlHR0VaUm9oSTh3aGZmOE5SeThD?=
 =?utf-8?B?RGE0S2k5NzJ2OHp5Q1hYY0VCeHFKTnRwZGlWdElHeG81bEQrdTljby9BOW05?=
 =?utf-8?B?djZlL1lzZDJTcFVSV3hBejNWSTFrQlRBK3Z2dDZscXRwZHY4MDkvL2lnVG1o?=
 =?utf-8?B?bHE5OWJNb3lSWmtRYVZOSVpiUG9xRFczdk1kVU9PbTFFdStPRlpKQWFUY29u?=
 =?utf-8?B?dS9ZNHE2MGtKNE5oNlVCdDdwSEdDbkNrQnFFSjBIQmVLVXErbDAvajAzR0s1?=
 =?utf-8?B?VUxqNHg5dGRyTUZXazdFMEN5VGZlY21ZeXRtNWk1MGR2S3k0eGh6VFNKcjQy?=
 =?utf-8?B?cktWVHNkbzlLbGpmQjVlYUFkQmxOMElsQjRBYTVCY01tNkZOdmp3WHVKMTIw?=
 =?utf-8?B?bWZ4RW1QU0JLL2xJcUF6UThFTERXWXVxNDVzb3liLy9pS3RKdm1qOS94cGdo?=
 =?utf-8?B?T1lDSTU1RDh4OEhCMkxWUU9ZREtaRk1MbU04b2J5WEJiSXdDZ0xtQmxla2ZK?=
 =?utf-8?B?eGVZMzdsdWJ5b3NTckMvY2xuSkJWSTJDMFlKSlJ0ZUFsQlBiSDM5VUw2aFA2?=
 =?utf-8?B?ZXlWQldMOWp5VjRKSStuUTNFcXdyQUwyOGtDZ0dLWnhnNWtveUpIMEc5M0dJ?=
 =?utf-8?B?cjlSU01NRVRqdit2YjNKYXRLZFpJYzMrVlBzZUNVWC8vNzNBNktkc1BvcnhW?=
 =?utf-8?B?cjZjRDFyRStkb21rUzZCY3ZHYUozNlpiQ3Yza05wNFQrbkMvZTJpNzQ4WVZt?=
 =?utf-8?B?WXNXTVYvTHQvMDNTRWtjaUZMWkEwKy9IdnU3NndYQ2hMRkI1Y1VFaklkZFZL?=
 =?utf-8?B?REpZb1B2cWtJS3RpKzVlNW16RkZsdldmZEV4Ri82UExCcHF1RUhvbE9FZG9N?=
 =?utf-8?B?Mnl6MDIzWFlSWXZKcU4ralFnMTc0bkNXWDNJTjAvS01JZ1FvcXBuSmsrWC9O?=
 =?utf-8?B?VW9VTTA3MVM3YXBJRTN4Z0V1R0hHWThPTmZRRlBIU2N2VVN1UjlVL1BiaDIv?=
 =?utf-8?B?bXhhczFQcWtMdWJONGErT3BlSVFBUnJkSTlxbkM3MWxWQkVRajNKYkN3bExC?=
 =?utf-8?B?TThWd3NjQnBQM2tsQ2pFcG1xdEJqRVdKOE1mcnQxUGFiWjJLcWdWRHptOVRq?=
 =?utf-8?B?MnJXcHo1bGhJSnl1UTBZT2NXZnc5KzAzdHlMYVlqdTVnc3h6THNWV2g4SHhY?=
 =?utf-8?B?QmJkaXplQkdPbjJFVGFhdjBGbjZjcjhwRTdLOERtRHBueldsc3ByUlRvS1dB?=
 =?utf-8?B?cmg2RkRqQmhvbkpMbDA0Y083SnFTcXRTZmw2ck9JaUVzUXM2UDhJMkZRMTFB?=
 =?utf-8?B?OWtLMk0rSW9aRCtsMTR1bHRWanhJZ1A2bUI2YmRtdDRLaWRERXpIZW0yOUxP?=
 =?utf-8?B?WUZ4QVI0eGV0WHFqclp6NG5WV05UQXVScXAvUkpPdzMxVVRvRWFCR3VGSW1D?=
 =?utf-8?B?bnh5UGhhV3MyYUhrWmcrZkFTU0dkcHJWb0hQSjVxcGZCYjQwQmtqV2lSVlda?=
 =?utf-8?B?eTFDVytPWlNiZ0VOb1psYmM4ZXIvajhLQTRRd25lZ2tKdmVkUDA2Ty9HRTlN?=
 =?utf-8?B?U0xQQUtFOTNYeGphRmh3WXpleEJBZ2dGNHIrZ2lHcTB0NDRGaEhHNmJGQ3pu?=
 =?utf-8?B?a1UxcndaZHNFSEVwRytqcU5lWHptaTR6UE1BZWlPeCs0eFBVN0ZBNXRBVUpk?=
 =?utf-8?B?ZXg2Z012dG1KTlF3NkI3SlZNaHpsSm9qaEt6ZS9pbWMwZS90Rmd2OVU5SnY4?=
 =?utf-8?B?S1VaOTIvd2JiNlZjZWZtY05lM3UxeEFJcUtZemN3SjFZMGdCSTZZbk9EMGtL?=
 =?utf-8?B?QkpkbG42WmNlaVlPOW9TUlJjN0lWUDVJK2IvR2tuVTRCY01YQkVOc1JlNzZr?=
 =?utf-8?B?cmVpeGE5UnFZeDRpNDQ0aDA2UDZESW9PT3NEUWNTN3V1aTQ4QjFhRTVkSGpm?=
 =?utf-8?B?VXJGYW5kR0w5bGN1TG4vd3FvSWxHRC82Tmw2UGhsWUNCV0NDOVJLdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <160919C0648648408893F21A6E828B88@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Vpoxi3quaU1M4HRmutJFr20BZ3gYwwGlhrc276BGhaeGuOrDUgdNCOt8wnyMNMaV4YzChtpZ+CNuMvWhhz6lfvCPM1CBqnF/HdR+nt6Zmphf6cAZaVgwMh4uHpe4c30TZjpukEi7kNNnuKh6BerILu5A8lsZXMC3YiS4hZuIIhGnpT5IEGYbp1eilkIohR2ESPl6t3e8gBdzRq2IIRdsLicXtVe1xuXVmCYKEsgr571QGbIW8JUr0lAfmEkbGXjEqVGNbRY8QyuuEZVLTA4OlnI50vlO0kt2sQ/aAx7H08AyGjx4R+nYG4K64/DTJmm4OyPr7GFLH59ov3A4Q3O4ZQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UvAz0Gv1a+08V1mVzw+MD30q3eRAyyInw8aphvnLsk9VFpJ8TpL7yFsbWgLFptpceYKX6+tcE+R0E0VBaiVLjiV/3cRF2aOIZ3bCGHhWx8bk/D62w4kKK2o4JGWMWHIWPmU5Q9ww5xSRsiyBI75pJbMAe/ZKay+YWgtlwQQUxBnqJRZigNiFYSEcOUQrp8emwdoSMFqKVGZVAVM3cnOC2gChewTOePzObdakGTMyYds4UKSOO2VPhLSiLLaD2wRgHxBQdpmfr5sI/4xuIOhvC3Z2ds/R2hRgux3IfUneaGlyGIW9FXXYaEAJUS6rAuft23JjzNhuTb5OfR32gEuJmD51V+3wQAANc5Bnl/t6+DEC8TDtm7TESqmWu4G2pt6nuqBq4rLqMQoTY58AtikVwn7NN1Sz6cVlKakGi2sK9ODl3pk9sGrq43v/0Gz1WJAp2XYr/+JGIvJxEQmdKlZkApkHAP8CKkbfpqt4HqB2C0jlcj38nBV2Wmi7D2r1s0Yj0xCsT+O5C7Df+J3n0HZFHHgMYN3yV5bIgp78sE6vikgnDAArfitoAcQNwPsFnmOV9HTzVY56z/WXsDSxybuVwwpLx5w16qJk2QakbJpJQ4Chwr/JZNz+7dVry4bi8CUYpyTZCTE1C4y/V2BJ41nNxA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63afd74e-8c7b-4105-da02-08df03e07aa9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 02:11:17.5242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0NTNfdtxB3nErJaM6hgqXaTGJjeXlVnfFMk0y1LkY0XRkgVy8S+Rxoc6tPrMP3m7dSk/eQpN/AqdTW5i0B/l+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9011
X-Proofpoint-ORIG-GUID: DANDVdhixXLpw9KFmCjTUSASXGHtp1HD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDAxNiBTYWx0ZWRfX475sseArjq2z
 Y/j9QncYwccWdmT3GaeQGQKPQPHkMnY6ifiCKj9/WkvVgFl6Mu6WojPKumTbaeSErCr0mbd2WUZ
 YjWItXk203acKiYTCSe+nablFTShu0C6rr2DQ4dSkvUABe1oBtZXZ8XWZ7wyB1V3T9ksNSIehEg
 CsCB0IYKlyKTuZP3k8vdZEEWruY75yf31QQNr9ZM8pEXzddNx47Vq1mGPswCtddQLEcTZBjuNLb
 MxA40gelStH8G+wlvuHSReecUQN8xlmfT00doLoLMvt1oIw4j2/LfZmHXiv3ywBQk/mTir6he0P
 PZOGL+OlcE+0QIvaG+JLUIXEsDf6fXPQSnv1rB2UIJBmACg0OwH7nx/hO0q7szPrRUb4Po9dhna
 IVE2GIh1jW/Eqq/vwR/ItGadsbmGDD9KpGnlu6zP5fpAPjkc82/iNC3dUyeDJm40rIkpssEf37q
 iZeP3aB/MwDHjlZFTng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDAxNiBTYWx0ZWRfX1HiDy7t9TNTs
 zdFRiCevf6gKdtb69FdyvDGZPJnFoJthKRCjZl127wc00AMiDUHFIjlYMFvJYOq4f0uBNTjnnkV
 y+/4ONS7TFLLJUBxcN+4nrsQyDANcuE=
X-Authority-Analysis: v=2.4 cv=MfdcfZ/f c=1 sm=1 tr=0 ts=6a8f9cd7 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=lv0vYI88AAAA:8 a=jIQo8A4GAAAA:8 a=3IDcxfhxT5zby_DEGcoA:9 a=QEXdDO2ut3YA:10
 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-GUID: DANDVdhixXLpw9KFmCjTUSASXGHtp1HD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_01,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 clxscore=1011 priorityscore=1501 malwarescore=0 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608270016

SGksDQoNCk9uIFR1ZSwgQXVnIDExLCAyMDI2LCBKdW56aG9uZyBQYW4gd3JvdGU6DQo+IFVTQiBj
b250cm9sbGVyIHJ1bnRpbWUgc3VzcGVuZCBoYWx0cyB0aGUgY29udHJvbGxlciBvbiBkaXNjb25u
ZWN0aW9uLg0KPiBJdCByZWxpZXMgb24gcGxhdGZvcm1zIHdpdGggY3VzdG9tIGNvbm5lY3Rpb24g
bm90aWZpY2F0aW9uIHRvIHN0YXJ0DQo+IHRoZSBjb250cm9sbGVyIGFnYWluLg0KPiANCj4gVGhl
IGhvc3QgYnJhbmNoIG9mIGR3YzNfcnVudGltZV9yZXN1bWUoKSBkb2VzIG5vdGhpbmcgY3VycmVu
dGx5LiBUaGVyZQ0KPiBhcmUgdHdvIHBhdGhzIHRoYXQgY2FuIHRyaWdnZXIgYSBydW50aW1lIHJl
c3VtZSBvZiB0aGUgZHdjMyBjb3JlIGluDQo+IGhvc3QgbW9kZToNCj4gDQo+IChhKSBXYWtlIGxh
bmRzIG9uIHRoZSB4SENJIGNoaWxkIChEVCBwbGF0Zm9ybXMsIGUuZy4gUXVhbGNvbW0sIGkuTVg4
TVApDQo+ICAgICBBIHBsYXRmb3JtIHdha2V1cCBJUlEgZmlyZXMgYW5kIHRoZSBnbHVlIGhhbmRs
ZXIgY2FsbHMNCj4gICAgIHBtX3J1bnRpbWVfcmVzdW1lKCZ4aGNpLT5kZXYpLiBSdW50aW1lIFBN
IHdhbGtzIHVwd2FyZCwgcmVzdW1lcw0KPiAgICAgdGhlIGR3YzMgcGFyZW50IGZpcnN0LCB0aGVu
IHJlc3VtZXMgeEhDSS4gQm90aCB3YWtlIGNvcnJlY3RseS4NCj4gDQo+IChiKSBXYWtlIGxhbmRz
IG9uIHRoZSBkd2MzIHBhcmVudCAoQUNQSSBwbGF0Zm9ybXMpDQo+ICAgICBXaGVuIGFuIEFDUEkg
Tm90aWZ5KEFDUElfTk9USUZZX0RFVklDRV9XQUtFKSB0YXJnZXRzIHRoZSBkd2MzDQo+ICAgICBw
YXJlbnQgZGV2aWNlIC0tIGZvciBleGFtcGxlIHZpYSBhIEdlbmVyaWMgRXZlbnQgRGV2aWNlIG9u
IGENCj4gICAgIGhhcmR3YXJlLXJlZHVjZWQgcGxhdGZvcm0gd2hlcmUgZHdjMyBpcyBlbnVtZXJh
dGVkIGFzIGFuIEFDUEkNCj4gICAgIGRldmljZSB3aXRob3V0IGEgZ2x1ZSBkcml2ZXIgLS0gdGhl
IEFDUEkgY29yZSB0dXJucyB0aGlzIGludG8NCj4gICAgIHBtX3JlcXVlc3RfcmVzdW1lKGR3YzNf
ZGV2KS4gUnVudGltZSBQTSBkb2VzIG5vdCBwcm9wYWdhdGUgcmVzdW1lDQo+ICAgICBkb3dud2Fy
ZCwgc28gdGhlIHhIQ0kgY2hpbGQgc3RheXMgc3VzcGVuZGVkLiBSb290IGh1YiBwb2xsaW5nIGlz
DQo+ICAgICBuZXZlciByZS1hcm1lZCwgYW5kIGEgZGV2aWNlIHBsdWdnZWQgaW4gd2hpbGUgc3Vz
cGVuZGVkIGlzIHNpbGVudGx5DQo+ICAgICBkcm9wcGVkLg0KDQpHb29kIGNhdGNoLg0KDQo+IA0K
PiBUaGlzIHBhdGNoIGZpbGxzIGluIHRoZSBob3N0IGJyYW5jaCB0byBjb3ZlciBjYXNlIChiKSBi
eSByZXF1ZXN0aW5nIGFuDQo+IGFzeW5jIHJlc3VtZSBvZiB0aGUgeEhDSSBjaGlsZCBzbyB4aGNp
X3Jlc3VtZSgpIGNhbiByZXN0b3JlIHRoZSBwb3J0DQo+IHN0YXRlIG1hY2hpbmUgYW5kIHJlLWFy
bSByb290IGh1YiBwb2xsaW5nLiBBc3luYyBpcyByZXF1aXJlZCB0byBhdm9pZA0KPiBkZWFkbG9j
a2luZyBvbiB0aGUgcGFyZW50J3Mgb3duIHJwbV9yZXN1bWUoKSByZS1lbnRyeS4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEp1bnpob25nIFBhbiA8cGFuanVuemhvbmdAbGludXguc3BhY2VtaXQuY29t
Pg0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IGQ1ODc3MmQ4NTIwYzdlZjI0N2M0Yjk1YzliZDc2ZDNh
MjVkYTlmZjUNCj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5jIHwgMTIgKysrKysrKysrKysrDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdXNiL2R3YzMvY29yZS5jIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gaW5kZXgg
Y2ViNDlmMmY4MDA0Li5iY2U1Njc2NWFkOTAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3
YzMvY29yZS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+IEBAIC0yNjY4LDYg
KzI2NjgsMTggQEAgaW50IGR3YzNfcnVudGltZV9yZXN1bWUoc3RydWN0IGR3YzMgKmR3YykNCj4g
IAkJfQ0KPiAgCQlicmVhazsNCj4gIAljYXNlIERXQzNfR0NUTF9QUlRDQVBfSE9TVDoNCj4gKwkJ
LyoNCj4gKwkJICogT25seSB0aGUgeEhDSSBjaGlsZCdzIHJlc3VtZSByZS1hcm1zIHJvb3QgaHVi
IHBvbGxpbmcsIHdoaWNoDQo+ICsJCSAqIGlzIHdoYXQgcmVkaXNjb3ZlcnMgYSBkZXZpY2UgcGx1
Z2dlZCBpbiB3aGlsZSBzdXNwZW5kZWQuDQo+ICsJCSAqIFJ1bnRpbWUgUE0gbmV2ZXIgcmVzdW1l
cyBjaGlsZHJlbiBvbiBpdHMgb3duLCBzbyByZXF1ZXN0IGl0DQo+ICsJCSAqIGhlcmUuIFRoaXMg
aGFzIHRvIGJlIGFzeW5jaHJvbm91czogcmVzdW1pbmcgdGhlIGNoaWxkDQo+ICsJCSAqIHN5bmNo
cm9ub3VzbHkgd291bGQgZGVhZGxvY2sgYmVjYXVzZSBycG1fcmVzdW1lKCkgdHJpZXMgdG8NCj4g
KwkJICogcmVzdW1lIHRoZSBwYXJlbnQgYmVmb3JlIHRoZSBjaGlsZCwgYW5kIGhlcmUgdGhlIHBh
cmVudCdzDQo+ICsJCSAqIG93biBjYWxsYmFjayBoYXMgbm90IHJldHVybmVkIHlldC4NCj4gKwkJ
ICovDQoNClRoaXMgbm90ZSBzb3VuZHMgYXMgaWYgdGhpcyBpcyBuZWVkZWQgdG8gYWxsIGNhc2Vz
LCBidXQgeW91J3JlIG9ubHkNCmRlc2NyaWJpbmcgb25seSBjYXNlIGIpIGhlcmUuIENhbiB5b3Ug
YWxzbyBtZW50aW9uIGZvciBjYXNlIGEpIHRoYXQNCnRoZXJlIG1heWJlIGFuIGV4dHJhIHJlc3Vt
ZSB3b3JrIGNhbGwuDQoNCldvdWxkIGJlIG5pY2UgZm9yIGl0IHRvIGJlIGNsZWFuZXIgd2l0aG91
dCB0aGUgZXh0cmEgY2FsbCwgYnV0IEkgdGhpbmsNCml0IHNob3VsZCBiZSBmaW5lLg0KDQo+ICsJ
CWlmIChkd2MtPnhoY2kpDQo+ICsJCQlwbV9yZXF1ZXN0X3Jlc3VtZSgmZHdjLT54aGNpLT5kZXYp
Ow0KPiArCQlicmVhazsNCj4gIAlkZWZhdWx0Og0KPiAgCQkvKiBkbyBub3RoaW5nICovDQo+ICAJ
CWJyZWFrOw0KPiAtLQ0KPiAyLjI1LjENCj4gDQoNClRoYW5rcyBmb3IgdGhlIHBhdGNoLCBjYW4g
eW91IHJlc3VibWl0IHdpdGggdGhlIHByb3BlciBhc3Npc3RlZC1ieSB0YWcNCmFuZCByZW1vdmUg
dGhlIFJGQz8NCg0KQWZ0ZXIgdGhlIGNoYW5nZToNCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8
VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmg=
