Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342BF1E5B9A;
	Wed,  2 Sep 2026 02:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788316982; cv=fail; b=K0OmIHP2f06wa9VqBOZG6z8NxKyC8P7ca2I9WrDUlE6KZ65xfyg1kL4h60S4Q/sTiGmetAzqM2lGa8POgZG/A5FVYJxMClpnO5i4CW7YqnGSspbFbobMIF6ZX9xYmgPNYT4v246oRaYAmBvJlh1cifFOJ+OTtwWTezvtzh2gLgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788316982; c=relaxed/simple;
	bh=G0wHmGEmTlzCKrFXuqN3nwn9o0aph2MfCpIv+z2QNxA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DHn3R56D/S+0lgqqok25Gm7JQ/F7u/pYcyIzElR8ASBSsz5LBWielcuVc9ZGP7e1sXuCdMjHsuWbCkGdSt36HPNg5Ccfm1zNVglq8qD0KU3caFgcF9vjPHN4XdjUb9pwXZKWXDxzrJY3pE1W7U2c9DmizoraqZsoT0ofKruKPVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kju76PsI; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=RgWqWCUT; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=K8EHBotb reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kju76PsI";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RgWqWCUT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="K8EHBotb"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681Le4Nd3242819;
	Tue, 1 Sep 2026 19:42:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=G0wHmGEmTlzCKrFXuqN3nwn9o0aph2MfCpIv+z2QNxA=; b=
	kju76PsIAfCscrwFMT8Omi8rprk1G6vXyW899ImT0s63o7XQwRklLpqrUhwSQPMi
	XCLkM5tlHBC+f6yw6maN1mzEU8qBsEQl/mReAIdekJLL9soXCSn2jz3RUaLnX7cl
	gO7OaAVy5d9xmGygoQi3jKGjAMPffKHtyjMyyBD5BRlqDxT5ubIHciPef2CB7rGO
	Hb1Xq2SgheGFlvU/GsFQIOvVJ7g5WeHcoVVI7aHnaGpYvVEd2j07SQIUqe7EwDeP
	DeNnQN3wJpjjC2yJ/cF4MKLdiAhRRQS02BbJlPvdosf5PvRY1vbKUWsYST+L52Un
	V2qlhUWfryka0qZUyQrz0w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4gdrdwhnb5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 19:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1788316973; bh=G0wHmGEmTlzCKrFXuqN3nwn9o0aph2MfCpIv+z2QNxA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=RgWqWCUTiET7Ce7bXbwWcqiJ4w+kRa29dnRCgTipLxZeD81XO+DHM5LuoG7Am4kuA
	 MxRQaTB+BgwmDX0ucpIPR4UPvCvyD38lAoc2kV5qdTx00zLg46RZRlHJYsP9PVPX2z
	 pl9I6VMQU5ZUxERV7gYITvmdRqBJ4ktU5z00sXwjgwd0Yu39pqAGlNMvxluXqeSfVf
	 GNV4jLTdLcFDvKdnI3YbLCrL48qTnu8KKzKkepImWuAmIfeT8imfZriIWfMdmHvCpZ
	 Ph0BQlUZQoqcc87QveYE9w6YReySdabtk627ReVtcTHmjSvnHB19JR7gto/fmlZjsO
	 BhU3mnjnYK4/A==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E910340593;
	Wed,  2 Sep 2026 02:42:52 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 9FA82A009A;
	Wed,  2 Sep 2026 02:42:52 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=K8EHBotb;
	dkim-atps=neutral
Received: from CO1PR08CU001.outbound.protection.outlook.com (mail-co1pr08cu00104.outbound.protection.outlook.com [40.93.10.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8599B40133;
	Wed,  2 Sep 2026 02:42:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+70y8/Gf1aQlV3kvYTjnpIyJs9E2UL8e6chWdcqT7VFhCAnxkqzS0/dhCXOZdWcJJZiLavJ9GmUgb6cx29+Om2jVvjj+K+fZsMOvkThGfD/1YG2d42YCyiRaOkoettnIgmzfXdOVjgexBoN9RF6WjrNoFuQWNXZYr7E6nHbP0S/K/hFdZrhlC75bRtj1Sjd9o685KwLtx8XMVpfOXLkcQKpxOJAHz+BfYMnu3fZCzXrzno0BUdr81oZZSA9yUYVVX7tNzIVf++Ki4UJk8SZgNn8oATmQznHVTcu4b45/yTNcb/yigY0rHojibGr+SfJSQjE0fXlik7TqgIDtQNIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0wHmGEmTlzCKrFXuqN3nwn9o0aph2MfCpIv+z2QNxA=;
 b=ocUxvGRsXF9syVSXYUTawAnY0f3bAZXaFx1foiVxvPPaR8z95PmkIeD0I1az/aDdOEKm/SsCEskJkgxi1NbBm1J7sKFrn7HfwQb+b1+lTTJf1rs4M4V02Ya7fvUXcicN3253g8HRxOVhALHyEmYpISUWzJH9/uDxsUt+/fFEXYVcVH3ot7+uYsgvx+jMcIpEdqVZVOiwB//DG5HTcWbJv9/2kiYr13vYDbEJfeq50tu/Q29U/dijok5ibtcZ6570/8FXyTtic31c/PffoAUPn6337Esaw15rZTXN0iI2vCMijcvZwifYCCrfJajPXEMZitCbTPj9KlJkF/Bnvj0JgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0wHmGEmTlzCKrFXuqN3nwn9o0aph2MfCpIv+z2QNxA=;
 b=K8EHBotbwuUFOFSVc402FrAmXcykBufjVE471CcTiDMUWlmSU3hSnX0N3Vo39Ee93DWaep1lgkT2Tqd7LNypvpz7Xzxt+9YbFOyd6SE2f/cgW5qMyS10FwOiwHao/vvMeYe1JIoJgpIN0hnU1Yw8go+YPwNwBzH4DVHAXZDQfdM=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by SJ2PR12MB8783.namprd12.prod.outlook.com (2603:10b6:a03:4d0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 02:42:40 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 02:42:40 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Matt Eaton <linux@divinehawk.com>
CC: Michal Pecio <michal.pecio@gmail.com>,
        Matt Eaton via B4 Relay <devnull+linux.divinehawk.com@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] usb: xhci-plat: add xhci-no-soft-retry-quirk
 device property
Thread-Topic: [PATCH v2 1/3] usb: xhci-plat: add xhci-no-soft-retry-quirk
 device property
Thread-Index: AQHdN/GWvxUp/w8EEkev+FI9G3Xcvba2sSoAgACmvYCAA0GmgA==
Date: Wed, 2 Sep 2026 02:42:40 +0000
Message-ID: <apeKnh72CUPjwMkQ@vbox>
References: <20260829-xhci-no-soft-retry-v2-0-0efe22f1c2f8@divinehawk.com>
 <20260829-xhci-no-soft-retry-v2-1-0efe22f1c2f8@divinehawk.com>
 <20260830165934.34e5b82f.michal.pecio@gmail.com>
 <CABUBpLf_mA8GmjAn8+-xgz8H5XOvBCr9DRWU8Eqc9=BW9m00Bg@mail.gmail.com>
In-Reply-To:
 <CABUBpLf_mA8GmjAn8+-xgz8H5XOvBCr9DRWU8Eqc9=BW9m00Bg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|SJ2PR12MB8783:EE_
x-ms-office365-filtering-correlation-id: 72426e64-ade2-4f26-9d64-08df089bdb64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|56012099006|38070700021|6133799003|4143699003|10067099003|11063799006;
x-microsoft-antispam-message-info:
 3zcftMt3Ux8+Yo/xCUCYkuNu3dBgnZ8iS2U2M6RrnCWQgZPfOBaBMLeNHLMeXXXPAbgweuN2DPvcey36speu4XYbJJLpWt20EcEbO3TYouqt5VqTIfURGaWtBCLUTMF8kI4UP3ChTiC5hTGr0tg5NQ67UDEpRaxowLOcb3G1axWi7kmNMJhL2aYnrr9GVv+Hkp5V/QXl/8zeSd1+PFnAiMWRJtP4zexEIJUtRXcQzG+/ronbGZ1Yl55N/O2jiYz6i4g299oPg0J/mZAxG9736mkMOM0W/ndzZkgw7/4m8dg8oX0OXflRc5tB75fG/WaZTZ5a1rPqubPm+hTdmYBH7A7s57cNZb2rlRfx7B3cmGxG853FOIABsZ0kQjjLNLD2hrNBYIfKXx9X6wdDkNj6qlIfYKKfseeokeNV4GA7kosJxZ3kz2ry8jMYypmMB9os5hQ56D5G0S3DmB1uJ0cuNHcS92iuKamhsp6ZozFajFkvMP+GaaE+Lci59VK0XVVkBbRxh16EjbU2IgTpOhM/BgOE0fy88GjkXnoQQfRDnhFXJIcIq2rySUL2JSI0qTIZ8U4n9GWDudCFmcYL0oyCOUjEVXAAPgQ1oesya4LWPgYC6uMAtWR4gFD/c80Dr/3Lab/uHWs307js3HX0748b5/QMg6pfZL425WwsLdNjwDCaJv+LITuF2ag8fqs1z7g/x+7WWz4hNlnb0BuL4Tm26ZujgKrTnEoHO0pOTP7OcuM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(38070700021)(6133799003)(4143699003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZG91KytSMjlCNEF3cGxsdGh6ZkVJNFhKMEJwVTFra3RHOElHbFJONEhhbzNr?=
 =?utf-8?B?SkVodGtjN0Y1WEJLd3JsdXBxR3pYSHhSSUowWUludFpxOUNYVG05SUs0b2ZF?=
 =?utf-8?B?bFIyNlFtMXZFY0FrN2RwWDQ0TWYxSWtlei9XRWlJNjZQb0J0dUErNGNnaWNX?=
 =?utf-8?B?bVVnQld3d08yMXQvNFRRbVZLcVVZdzNhMTRQbnFQS01TRXU3Q1VmS3N4ZGh2?=
 =?utf-8?B?TlJpRTNzTnNUTDFaNmZweURiQXJURmVFZ1JlQkJsK0l5V0ZUNlZqZSs4dGZK?=
 =?utf-8?B?UHMrLyt3OWNVV3Vqd3BRcE9aVGJvNlpWK2M5ak4yV2ozWGFicDJLSFVySkRT?=
 =?utf-8?B?VThnSEd5K1pVZ0xHbE81eDlIM29CVXIwWFpjcFdtaEErcWNLQ3dlTWhzU09W?=
 =?utf-8?B?eXNoVkExTHVudW1YQUEyc0lqVENGWWN3MC9lQ292SG9KMXBsamFGS0F0eE1N?=
 =?utf-8?B?endMcVhrUnN3RTR0dmR1Tk1IWVlVWDBsM2lRZFBBUCtTTWJGYjVYL21tWXlQ?=
 =?utf-8?B?b1ZsNUhiMTE5SlZkb1Q3bm0yVHJjeitiQmNzM0JEeWd5bG9DdzRwTEdHT0tW?=
 =?utf-8?B?VXorcXcva0xpcUVPYmIxaDBGZFR4YUY3dU95Z3haK0UzcmxObmhJTkpsZTk1?=
 =?utf-8?B?UFVrQjFJLy9qbyszbzhKMDJ4a2NZT0hmRFhLYWYrdS9IaUM2dS9EWWg4bi9V?=
 =?utf-8?B?YURlc2V2ajVFVElSZlcvNHBCMHFDeFlFRHZreUY3VDF5SFNHQml2cVRnTW5w?=
 =?utf-8?B?L0VCL2ZKUGk3VnY2b3VZSkxQNUpzN3pkSlhEOUVwOEVIZnF2S0Y2WUQ4eTFl?=
 =?utf-8?B?RGxUTWNCYkZSdzlJVkNnNTdNK3RkdzBaNGpOQmFMd2IwVUM2c1htc3U4VndI?=
 =?utf-8?B?bHY4eVhxZ0JCcXJMbFpoNXR3OXcxNHdoeHJnczExUWNEZ1k1b2tlU1dtQWc0?=
 =?utf-8?B?K3lMNlBUWkY4R1BaQ1FGcHFrUmN2cDhxY3VwVlBaZDFTNkI5S2FWd0ZjdUpL?=
 =?utf-8?B?bDY3d1J0eXNGbk5RTmUzZmE4akViQzRuQllLRkkxeVk5L0d5bW9YRm5tRW9Y?=
 =?utf-8?B?ZUVvZ25GamlzMzRYcXF3TlNBNUdXZVJIMlBLcFNRZFJTaU53Y29oQTFLcFZN?=
 =?utf-8?B?RDZndWRZQ3V1MXRUdnZHOWtZN2Y1d1BHYmF3ZkROaWR1eVpBdVN3MGp2VFdG?=
 =?utf-8?B?ZldNNklZVVI4UjhnRkJlalZnc1NTdkdSYlFUN2Z3aks5TmorcjhiS1NKRlhu?=
 =?utf-8?B?UUh1c1VSVzN4TTUwUWVyOE5TanZjVXVSNmQ5NGFDZlV1Z0cxb1YrRUIzcjVi?=
 =?utf-8?B?cFA1TnZzYkdjY2ZqSmdyYXJQazBkbDA5TzZES2xwQ3JCdzFSSlZ0WFQwSlFw?=
 =?utf-8?B?ODRPQStIUG9UQlR4ZUNyR0xURCtiMldnTE1zbUxqS3E1M29nMXlibW5tek91?=
 =?utf-8?B?M1M5b1h2ZGNoVzdpZHhaZC9TbHNGTlZacDdRQmE2WkRtVWo1T2JsSStmTllz?=
 =?utf-8?B?YmpMSGJLVzczZE1HSFFOTXJzNlNrZFNtVlkwT2xwSDJCVHlEdmlTVURIQWdI?=
 =?utf-8?B?b2oyRXhCUGFNdkdJanlvR28yY3dsdS9xbzNpSmFVQ2ZsUm1VVUVpbnRYRXBv?=
 =?utf-8?B?bjVKN0JaV0loYzhzUXY5MEYyK2dWRmo0YkZFeUEvUnVkcjJNNWFSYkMxR0l5?=
 =?utf-8?B?c25zU2ZRZVh6U1ErSmt3bno1N3BaS09aeEorUnZaNndBekNJb0xwMEhJemN0?=
 =?utf-8?B?cGlaUVJubFNBT2NKdlFXaGt5OFp3OGNEeXhSSFpOeUFaWCtuZHpWRTZuc2pN?=
 =?utf-8?B?WGw0RFVnbFgxMVhDOXVuRTF5MC9zRGt3WE5IRnBoalRBSittZFQvSW9aYU8v?=
 =?utf-8?B?WklwRVk2Y3NFTGQzRjdvM2wwMThZam1RcU1veHJXMUFtN2pGN2M0REx4ZnQ4?=
 =?utf-8?B?TnlYbEM1cWJjcTVGaHFtTFBOSG5YNG1rTXRwZEFrV3ZleE9KclNETWtuS0hy?=
 =?utf-8?B?ejczRHZoWDZhVnJEZHdnOWQ1MjJIZkJQVDU1aEs3NW50cnNhMlhiKzg1dWwx?=
 =?utf-8?B?MXllVHlhbWpiL0c5d0JmUmRiZE9LK09qWlpOVTNIRmtETDJJc3hvNERSbUZ3?=
 =?utf-8?B?T205N3ZmZHBRQittWlV4YVpsbC93WkJUbnkzMEYxeHA2U2U0eEhDT01iR2Mx?=
 =?utf-8?B?M1FtcDBxV1lXVENlSkE2MTdyN1V3d3BZRnEzZmgvMW5rZTNZTjAxY3pjTXN2?=
 =?utf-8?B?bE9tN2d2djJBd0UyaG1oSkFWS2JrSCs4dFRWaC9zWWhHUVJGK0hEUC9sMnlZ?=
 =?utf-8?B?UThTVHhVcEE4aHdrbCsrOEdCekZUamRYc2VNL1I3OVhCUm8zcGNHZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AA2A7DF57B7C94CB645146FC9752EB9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	f2yKM8fxdRfni8DMkULB4K3IBLLgOw1VyCBx6X91pJCvarAXlo0LbRvRHSOFmnNdECogzBcWfJTi13BaRIqJD2sCWlKlzdoxSZnnku6o5PWCiLIgLbeQvxXeEJTx8zTwU73BPJY9MTBVjhxUDOTSLQ0zEvsSvuA11dQew9fnZCAiLHqsJnWPJYqdMtLQt5QKBmW2EUbpwGX11jk3j9KFQsp3mDj8krCR/wTexxLAQdNqI4O9/i0p1L+y1V8atNOi4UIF+gJh1q/KlNty9JayPEvjocWoeLx5+q6mRaMXDUmN4Ybd0W9aMV8JyKCnG0eQrx6U0FQfOwSzo2L7r+SvMw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2a5G+7Hj8dneeAjeSKsibQ7udEsV0dzgu7R/x8kiSwOdfSOKkKr0Rf8VZN4RreGgKZy14UBFi9szMXv9eHRmmuO5zinW2KQ7RW2WPFhzWfZpr99AHGG4xnnE1XBLaEzEvuhljkS0jQKKX0ibvl1CCztFBB4DinOQoUk7A1ee/kDFzoqcpB75iGHyDC3a1iGXBwnnCZYybCkRcWVTCPZcQxu2+WtlywxEJARJG1NHz9boksATEaSD+2gdd0ech7FwEAFrWxwGebCQyQh6ADuO8PGizuJbUJMEZRLxfLIfFwiNyvzosDnehmv4D77jv9nWAFMsL/LGWjk16e2n2GpIwyGczHHVbUTyU8GgT/Im4+dpHF4ahJg+buxXgPYAOCG9jEcRYBYOy1RulxtFlob64NkoPvVPLr/99JaGVmCjEJNPXO6PSOZ7EMLyZZJtuUW7vcOVkLTna49OLbCJhFzIbzN/bdwrQ7+i9R682/P0KSsgayBpHvlw52F4wdasnRb9gSyL4XfAsYmAfdRbTWIoDpkv0o9ImdIg1FHiPnBZKLLNXb3VInEvZZMYVcixDp/utEt1znMX0G1/jRFKpCYqMehlrY7dD3s0Ucp1oL9/tr9+bM5esFtocEsKfohFCUDyTyDYYkjjAjW6271dZJQADw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72426e64-ade2-4f26-9d64-08df089bdb64
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 02:42:40.3369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hy44krn6PxS0xMMqtaRLHPqtgR4e3cmW40uyCm8HpKjWgyeE1m1A41s5avPmSzlzBTSoxraZMh2Sw7t307zm+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8783
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDAyMSBTYWx0ZWRfX7evyhQTK7aHm
 js5Or/2yh2K8jnXp1CkJ7CMgJ6ilIhrk+PhHOnMHmLC0e9Uulg5mm+JZDsh9ajV1OkP9fYi0amV
 MO/JC+zwbwYQ1R07JC2Z38ZOmD1A0t8=
X-Proofpoint-GUID: XXhhIuWUwOmoSfYL2Xk4Su2EWUsTOt1C
X-Proofpoint-ORIG-GUID: XXhhIuWUwOmoSfYL2Xk4Su2EWUsTOt1C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDAyMSBTYWx0ZWRfX8DEiuGtstm1q
 rcquAsAKpWzxjYQzNqYYvp19awsl5wnkYBS9pFmnoFlhFHcbnKnEVFKPDS+RhRiJT03cSAi9x3S
 H870xG+UPkmcLyP77aMtB4noa4MF+WCdTKBPJPfj/Z4hpQikBhp8QHs+4x3jLCLoQC0KY5Fbud3
 XE/U5rWqSNZD9ECUVEJZ4p7vm8wVKYvrk3TgW+isi3HoslzUazWuI3WMeAv6nWU0UbLCPMD3/gM
 WcJgtQnfRRJPCpMEIHbXgl3QNSwc70WGeEymOWWnhKWZKT4VQorqI+OL1zXPiJenJ7Xs4RRmSay
 oCRq8d7ERSfwU5avwRQAbQx1Sa7BMNPP9d3tS1To47iSjDXeVypn+h+7QlvfB/d+4yMCC6+O5vn
 CzMr7WncrN3g/ECpjfr5K6SrqJTB6Nmv6UcFL94V3GXFoaAwQld3Tk/7CjtxJI0o3FC1/WMmYBM
 977MD9kHL1TOCw6eBgQ==
X-Authority-Analysis: v=2.4 cv=UaphjqSN c=1 sm=1 tr=0 ts=6a978d2e cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=pGLkceISAAAA:8 a=Chss0xDGAAAA:8 a=9ymSwHc0i2JT2uC_zGgA:9 a=QEXdDO2ut3YA:10
 a=VZ1z_dUGxXw8Qzmhq9nZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 suspectscore=0
 clxscore=1011 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 spamscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609020021

T24gTW9uLCBBdWcgMzEsIDIwMjYsIE1hdHQgRWF0b24gd3JvdGU6DQo+IE9uIFN1biwgQXVnIDMw
LCAyMDI2IGF0IDU6MDLigK9QTSBNaWNoYWwgUGVjaW8gPG1pY2hhbC5wZWNpb0BnbWFpbC5jb20+
IHdyb3RlOg0KPiA+DQo+ID4gT24gU2F0LCAyOSBBdWcgMjAyNiAyMjowNDoxMCArMDIwMCwgTWF0
dCBFYXRvbiB2aWEgQjQgUmVsYXkgd3JvdGU6DQo+ID4gPiBGcm9tOiBNYXR0IEVhdG9uIDxsaW51
eEBkaXZpbmVoYXdrLmNvbT4NCj4gPiA+DQo+ID4gPg0KPiA+ID4geGhjaS1oY2QgeGhjaS1oY2Qu
MS5hdXRvOiB4SENJIGhvc3Qgbm90IHJlc3BvbmRpbmcgdG8gc3RvcCBlbmRwb2ludCBjb21tYW5k
DQo+ID4gPiB4aGNpLWhjZCB4aGNpLWhjZC4xLmF1dG86IHhIQ0kgaG9zdCBjb250cm9sbGVyIG5v
dCByZXNwb25kaW5nLCBhc3N1bWUgZGVhZA0KPiA+ID4geGhjaS1oY2QgeGhjaS1oY2QuMS5hdXRv
OiBIQyBkaWVkOyBjbGVhbmluZyB1cA0KPiA+DQo+ID4gSGksDQo+ID4NCj4gPiBEb2VzIGl0IHN0
aWxsIGhhcHBlbiBpbiBjdXJyZW50IExpbnVzIHRyZWUgYWthIHVwY29taW5nIHY3LjMtcmMxPw0K
PiA+DQo+ID4gU2ltaWxhciBwcm9ibGVtLCBsaW1pdGVkIHRvIHRoZSBzcGVjaWZpYyBjYXNlIG9m
IGRpc2Nvbm5lY3Rpb24gZnJvbSB0aGUNCj4gPiByb290IGh1Yiwgd2FzIGZvdW5kIG9uIFJlbmVz
YXMgUENJZSBjb250cm9sbGVycyAoaXQgbG9va2VkIGxpa2Ugc29tZQ0KPiA+IGludGVybmFsIHBv
d2VyIG1hbmFnZW1lbnQgaW50ZXJmZXJpbmcgd2l0aCBvcGVyYXRpb24pLiBJdCBzZWVtcyB0byBi
ZQ0KPiA+IHNvbHZlZCBieSBhdm9pZGluZyBTb2Z0IFJldHJ5IG9uIGtub3duLWRpc2Nvbm5lY3Rl
ZCByb290IGh1YiBwb3J0cy4NCj4gDQo+IEkgYXBwbGllZCB0aGVzZSAoZnJvbSA3LjMtcmMxKSB0
byBteSA2LjE4IGtlcm5lbCBhbmQgYXBwZWFycyB0byBmaXggdGhlIGlzc3VlOg0KPiANCj4gY29t
bWl0IGUzZDc1N2RjOTI1Nw0KPiBjb21taXQgMDQyYWFkOGQwZGI2DQo+IGNvbW1pdCA3ZTBlZjQz
MzJlZDkNCj4gDQo+IFRoZXJlIGRvZXMgbm90IGFwcGVhciB0byBiZSBhIG5lZWQgdG8gYXBwbHkg
dGhpcyBwYXRjaHNldCBub3cuIFRoYW5rcyENCj4gDQoNCkdvb2QgdG8gaGVhciB0aGUgdXBzdHJl
YW0gZml4IHJlc29sdmVzIGl0LiBTZXBhcmF0ZSBxdWVzdGlvbiB0aG91Z2gsIGFyZQ0KeW91IHN0
aWxsIHBsYW5uaW5nIHRvIGNhcnJ5IHRoZSBJUFE0MDE5IG1pZ3JhdGlvbiB0byB0aGUgbmV3IGZs
YXR0ZW5lZA0KZHdjMy1xY29tIGdsdWUgKHBhdGNoIDMvMyArIHRoZSBEVCBjb21wYXRpYmxlIGNo
YW5nZSk/IEl0IG1heSBiZSB3b3J0aA0Ka2VlcGluZyByZWdhcmRsZXNzIG9mIHRoZSBxdWlyaywg
c2luY2UgaXQgZml4ZXMgdGhlIGxlZ2FjeSBnbHVlJ3MgcmFjZQ0KY29uZGl0aW9ucyBhbmQgZ2l2
ZXMgeW91IGEgd2F5IHRvIHBhc3MgY3VzdG9tIGR3YzMgcHJvcGVydGllcyBmcm9tIHRoZQ0KZ2x1
ZSB0byB0aGUgY29yZSBpZiB5b3UgbmVlZCB0byBpbiB0aGUgZnV0dXJlLg0KDQpUaGFua3MsDQpU
aGluaA==
