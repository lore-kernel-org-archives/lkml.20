Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792548087;
	b=Gp+PiGrQhIbnvoKr111ldYtVZ67YTvnHAnfzzI/Q5pSWt4myPiv3MUQm5On476rvzofb
	 6AIIXao+6sfbO0PuTechu7k+okuykaklSMKYIvTyCv5OXGYFPl9ZZC7/dsTYWIgQPMXB/
	 K7TTenWbcVL5kzSzColSVXFXtUVqYP5JOpYNPTx/Hrru215U799NxU8h2OQQW6e74GRe3
	 laBOHG+vmP1RdT22eofrEX3mwiM36+FWLCDNwAv4ulH2hhU2yXmVwVxk9hEy80aax/su4
	 y/hjQUSeNu5hTOr2K74h83gqqHyme1GlNFp1zZTqUjWoMQ85WilBXqV/OzlmnQCJA3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548087;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AmMfJPB7tQ4Lk61+E8whNdHCjDTFfmF5kBmcLp0Y+dY=;
	b=MNpBpgAQZ/SEnsLnROH8e4Jw+xh9q7iwtC9Tb49TDacoXgA1OY5CdmrkJI7DK0eMnCcO
	 r0TPFgnaE3G/kxSzgRO/4aU1aCq73ZcV+bFoEa3kdq1bqaQl09xnFgtnjgOMfyuSroOYq
	 gUDQjHtkA4jQCNHCmvuLMnJ6rhIdfQA11iAZcocEeLu81lB2+Ltn+oZ07s537hn1DqTkB
	 zLSRpzVAXYE4XMxMETwt6gyuDHLuftPGj/ze48IqvuRlMCevI9N3JV3axnKsYzppbKV6q
	 kmxNluX2Rs3FbgNqtOdbx74jKElILnKTpmTN+sKVmSW5gY0aREJMjq0gemFb9f7XxEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=INkJ8iv6;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=Oe0F8sdG;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=GOngDBXv;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E274A606A31A;
	Wed, 21 Oct 2026 02:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E274A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=INkJ8iv6;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=Oe0F8sdG;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=GOngDBXv
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKwuva3684524;
	Tue, 20 Oct 2026 19:01:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=AmMfJPB7tQ4Lk61+E8whNdHCjDTFfmF5kBmcLp0Y+dY=; b=
	INkJ8iv6oUHYL5Zhy/9UC8Kw9MhvXIranlyfxUFUrrml/tQ1es25hhIhNQFsB/Dj
	JjStGaf6LyVawzvMfyIfLA/in4HwIGfGSLw+Rn45AXFvU3O2cC4tEZT5TqhUgPGx
	dBa2zixI3EHHEwWem1vpaZbTewrNulN2HzZXURTQYxNazeu85ocp7aJAPFNX+WkA
	BBc9DSSAVl1KDZ2aTofgkq1Ky8eZABj6bwthmBLMsWlj7AiKQQ6q34DnrYvAOgW8
	IG5ywQHjG2eWiXVjGbNDkFu4wnj2i3jVzdoknbK/YHVocxacTEJ/+zmMacLodQrl
	UJ5vdqmpTIwnGplJpO02sA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4hdw70gnuy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 19:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1792548081; bh=AmMfJPB7tQ4Lk61+E8whNdHCjDTFfmF5kBmcLp0Y+dY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Oe0F8sdGPbATGHDb8JfcgSnUzb8RRkoLWfkBeRCHw1KgAc87DrpcK4/0EzzANqyiP
	 d7G9c/FE9fMabkDc6tlD085ixjuyhQ7GhJV2kwTRmRZzEez5ENyWlKzTZkN6dqledJ
	 DTfL8OxQ95ZuQhB8L9wGiBkZfAifBN1jjXSuGXkSxo/pGLN7wKvPDpreSTJjnpCEP4
	 8Myu8LX3traDqFLopCQIe8HZNKuSW1hJ1qo9GpkEKQdOQqavkaPGcu3bz/EgBEFpVh
	 A1YtPdADmH5LVUhVjj8w25DipsAsNlpyk7VB2QjlOqtBaZh1yeFRsqniYTtXrGxOIh
	 PzHjL6M482H2Q==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 15A74401DA;
	Wed, 21 Oct 2026 02:01:20 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 93B57A00E5;
	Wed, 21 Oct 2026 02:01:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=GOngDBXv;
	dkim-atps=neutral
Received: from DM2PR04CU003.outbound.protection.outlook.com (mail-dm2pr04cu00307.outbound.protection.outlook.com [40.93.13.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C1B6540130;
	Wed, 21 Oct 2026 02:01:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IE0yt8gT8a4HIkqRtXhxacyh9Es5NW04D6Wu/qbPQg11FC1h1OWIaK4AEgWYahvNaAtNw71/Wvrk4suwk+VaxPwOdLAtvwmnbSJeQ9qID2nG2FCDt8er9rEe23yJ729X2kmGSVFHBpUL0NXr0l9A5W/HKH/iXKpaYdQg/l4xGJTBIxzlERopPoevocK2xbS0pZaGqOQ5bZpzozIL3oF1tu39g/D5A3AOon/Z7PH9bUBCgD0xsL7/lR5dQmbc97/Lmtc57VCvGJRnJxWeVhD3pDYNLVLbqaM7jeV2u8CcxRoaVYYpuYZC1lVMZzaY3gbAs36wXhbkZvZLMjSqaZ5zgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmMfJPB7tQ4Lk61+E8whNdHCjDTFfmF5kBmcLp0Y+dY=;
 b=y4TmqiXjbvohUrtUxUcfyO09xQkmGEVDmaGchzh34ayQHW7WuQyJedPbi0N0YyLAOG9zWcvy+sgj/9GYOgHoXk/cs3f2yohMzNMRi55urnIcYF+4os5muwCFgONW/8+2B5FWOorrA0jmvQwkpJ7iaSNiosQs714YbxHePB0F3itu9c1k8DAf057kTfwOnXmOyNPwwBNFHkywSyMm7RRTIm0m4OXuhLYk1nO8swzN1Rac3r/xpSCyPjbZ/B1yYa1cneDZsAKTvjUHe7qRzo3APVtYoMQCM9/UgDDZm5o/dWlbLlRBBKCeQu/lPmULzr8nKuF/pJuNABWFW5f04RpafA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmMfJPB7tQ4Lk61+E8whNdHCjDTFfmF5kBmcLp0Y+dY=;
 b=GOngDBXv3ba2puNO2Vg2Yf90tM3yaX9Wk5DowYd0VL2rmfCc2ptCqezwHhbLe9ru15ngC/SGLZSWD8miIxHO6+XIXaaQOAeQDvQHMoQFhU4eI86SS8W5zRfoTCpQWCL0cOAfvdLy1HfpHoPlsCjKPhn0jJy8mrU7mEDh3pMLfcU=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by LV2PR12MB5872.namprd12.prod.outlook.com (2603:10b6:408:173::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 02:01:06 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%5]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 02:01:06 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3] usb: dwc3: core: Fix RAM interface getting stuck
 during enumeration
Thread-Topic: [PATCH v3] usb: dwc3: core: Fix RAM interface getting stuck
 during enumeration
Thread-Index:
 AQHdT9IiBPnGUogw2kOy03ybke34C7b7PVSAgAEeJQCAAJqmAIAA/0WAgAASi4CACVh8gA==
Date: Wed, 21 Oct 2026 02:01:05 +0000
Message-ID: <atgaF8VoapljDa2f@vbox>
References:
 <20260929-ram-interface-stuck-v3-v3-1-0d1a54db233c@oss.qualcomm.com>
 <d45f758a-8d00-4f76-aef9-7364156f4ce3@oss.qualcomm.com>
 <as7c1LHrOsqAA4Nx@vbox>
 <94c4056d-7f7e-46ef-97cd-dd12621260bd@oss.qualcomm.com>
 <atAuSs9VTveGwzpy@vbox>
 <526b4857-4a4e-4ebc-a367-bdcf9a9c9a53@oss.qualcomm.com>
In-Reply-To: <526b4857-4a4e-4ebc-a367-bdcf9a9c9a53@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|LV2PR12MB5872:EE_
x-ms-office365-filtering-correlation-id: 61d6420f-2383-49d6-56e9-08df2f172ae7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 HOPBGuHgLeAzeHFrtIoZ9TakURuBvQv2tV6d0ys735bmwod8YaTwiNOnXp3KBhEq1s6Pyfx/HmOGYtSawQu4uUFB4+SUVyF5zSo6sUWIV+5k6r1+RN69Knpg1VfKNAxAjE+CvdMtRj+xCB93E06wjhpcDVQqOOvrPeL5BIbxmEU3lPTGJ0LLwcf9wlAbCPBDPfMkWBnEovPFnKJ851MY6yJQgQ80G8Dkae8WfNBxtsVMZob2nU8wgIu6qyNzPnj97YmGD67bToIud/zKgAHU2WOJM590DGzJvTOzpk+aXgP2d+8MowdvZ/bnZlwlELhjIqJi42xoDoaHPJq2/e+GhywuEEXoTaYbBz6O6HmAiO/SxR7BrXNUolud3W0wzBNDZy2fS5XF8ByARx3AJcg1MhHpwVP93kh7zZjkOs6gZcMpjtR2HBlYBnIwpyWWsn1RbAJ9QkOSCAHwu0T5QeB2tqTuo/IXm9DzqxS0wpm8OKbamwL/FxV6ItpvNu4mpo4Q17O66upTQe4ciUMmDJDKLLgVC8cblVymCywqDTN5/BO9CgEgdp5LIlwBRRnoEcp2zeTFco0oeP79ITSGiQi2h1bwbFgqDRJ2spFiJJb6mizpTBiIK+vdxASO3sgn/RB7QZLtE0mIIONUFdIKJG0NUUxY8zgx6/2ZF2XPdlwF4uTxyjGiRz3Yr3bj1HEWwjNDv8MglzYy76afD+rm2Vj2ICKQK0L4E5eNKHQPT58i0G8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YlhPRFFZL2hNUkFsdU1wcFBKdmNCYW1nL3k4T3FLaWVoRERldVZVdDhYSDlH?=
 =?utf-8?B?QVhFQmcvSTk0VEs5NFdnN1NTNjRFUnF5UWFuNHlFSHZVancvZUM2WDR5aFl5?=
 =?utf-8?B?bWdBS1NJNjg3cG5wcWZ6OWhua0h1T2FDSVNKeGR0WjM4Zk1QU3duTTJKcFFS?=
 =?utf-8?B?QkVUNmNvaElZYk44d05ZVThnVTUycjJkYWkxZktldFlLa2pFR1IyUEtwcE9O?=
 =?utf-8?B?WFhqSHdmUVUyNE82UWJ5WVI2KzUrUkY4ZWdZeG5SZzAvUHJpNjBuOStCU05q?=
 =?utf-8?B?Q1BXSHBwcUhFbWtvaWF4NDNNbzgrN0ZPYldqVVpDdHdyTGwwTjNGNS84d2pp?=
 =?utf-8?B?VHZzSUhaK0pKQUZjN1ZQcUp2QXBDYlJaa2prMXFtM29VN3VJOXR1ekVKZjNx?=
 =?utf-8?B?WWxrUlJtOHo2MHBod1ptVmt1dGg2akVIWHJwUjQyQWt4eEtYajJIbGJCbU9p?=
 =?utf-8?B?blRnUUxjT0JkcUhMQVp4MGJYU1dONVVZR2dwVTRVOHdCUFVYMzAwTVp3RUVK?=
 =?utf-8?B?SysyeFlPeWpkRTB6bEdQUFlLS1ZOMXA4K0hKNEhleCt2cFZSWHVGWkhhOWFp?=
 =?utf-8?B?bEpITVRkMXNELzBmbW5mVkZORnY1bmtCbmowN2hNZlI3VFkzR2VXNDhOSmt5?=
 =?utf-8?B?R212eHp3ZzdnNGdLYkJMbEZBY1NQQzFsVEsra3RHRU1uZ09zUXNxTlV6K0hx?=
 =?utf-8?B?c1d5eE8zUG5tOEZWTHN2eHhQVktnTURFemlHRkdPdkU4b0JUUkRDV2RnMlRo?=
 =?utf-8?B?YXgxWlBDUVdJNUtCNXh6K0p6OEhEMUFReVdRUE4vZTZaTXIzd2pxTzJ1aU9J?=
 =?utf-8?B?NGRBaEpzS0YreVRNeUY0Y1VVS1hHdkhwcHdESHMzVTB0eDNUR3VTOURDSm1Q?=
 =?utf-8?B?cEZoSHJtSEdacitBZnM0U3FYTVl5aEtXOVlwMDVGQ3ozWmdIWDlnOTY4bjNK?=
 =?utf-8?B?enh6SVN0dC8rUWdrK0JBOUpLYXJ5aUh6c1orVUhYd0FHN3FmcmdRT3E3bUQ1?=
 =?utf-8?B?SGtPdlhaZG5Sb0JuK2RlTkw0UzQrUkFxVzA2SHpvekRQTlBVV1BJZjJTZDdt?=
 =?utf-8?B?T1prUFRzMnZYUEE4K3psQXplL21meWNweFNtdFRVTVpmcllqQmRmQTdJTGZn?=
 =?utf-8?B?enU4VUVyVUYwQjF5YmFHOFEyLzJKQnozS095UmNndnBsOUhqVW1TNGFjNEVw?=
 =?utf-8?B?dDFqQUVyOHd2VThqY0dXSHVQZHh3YWRaN2FQdU5sY2lCWmVyWnE4N1JueWdS?=
 =?utf-8?B?YXdkOVc1cEliajBLZHlmNXRHOXFESlRDVjJUT2N6N1RDMCtWR0RxRDFBd3hF?=
 =?utf-8?B?dWp5endoMXZaVlBvZjNuZ0l6QUtLQ0RxNmZ0U0VWRnBnVVFxNE5GeHNBRnBD?=
 =?utf-8?B?SkJ2amM0SGZ1MjVOSE5EWGc5MzdtQjhQM0JkRnA2bnE2S09pejN0Y0xBRXMx?=
 =?utf-8?B?UndXRS9YeXdoMktXOTREeVpxVmx5MXFybDNBYzRIM1ZKRUNwVjNRblNJNE9o?=
 =?utf-8?B?c2pZNytrVDc1TngrcUR4YU1nU2pmNHJPa2M4QmJDRmVGV3NBelpOK21LWGtm?=
 =?utf-8?B?U3NSc3RUT0Qza2wyL1pwMG5XSjNscnZaRnZtZmt5L2VQbFlZRmNwcXFscENw?=
 =?utf-8?B?K28vQVBlT1ZxMWN3dXQrdFAzSWprMXkxT3lPdDlqTDJhWUpYcVRHRGNZR3h2?=
 =?utf-8?B?bXIxeGppRVd4RVVKZFRHT2VkM3hxaUFBL2pLQTFQeVNkVXcrUlVzbkluUUo2?=
 =?utf-8?B?MnlzY3BsaTNUZm1IMTNsbGFXSzdRNzlFN0VVT2pZRW1VMVhVOUJtbHhvUlF3?=
 =?utf-8?B?MS9NV2dwTE16b3QzN1FpMTNSUFJnSVBIK3FPd0NCejZKRWYwaGRRazNYM0Ni?=
 =?utf-8?B?MFQzajVwajFhY2JxZmNDenM3WGxOZ2ROamE5aW5YMHAwRzh0WStuOXIrNE9s?=
 =?utf-8?B?ekdYcitWRmdXbDlDUDZjbWIrNjhtcXFWMnZ6MXVOMklaNkZxRWlYYXVOZUl1?=
 =?utf-8?B?TS9uSUYzeTgwZXZpdkQ3ek9lcEdQa05KKzZLVENtaGJaYVB6bmloaVZLbHNI?=
 =?utf-8?B?UWJ3YmxHMjkxdU9QV2RiYzZFYUFTdHZ4LzVuVDFJUTBWNHFSSjhmdGEyWHpn?=
 =?utf-8?B?U1FRd0JZZkN3VmtubkNPWFdFOTNDaUdjeEhLdDNNTWtyWXdpdG14NFZXYUp0?=
 =?utf-8?B?MUhQa2QrWWdPYjlwT0RBbFdRTWR0K2E0Wk5uZzhLbFBVc0h4dmsyb0JEZ0E1?=
 =?utf-8?B?dFV2YTBPMC9vUHJmUU9Ic1dZZVc5Um9ac1hmanplalVtU2VOem9hMmExL0dI?=
 =?utf-8?B?N0xwQ2xHRXdwZ1h2TFFRUmpYNFVaRzdnODZyZWRCWXFlYmNscEdtdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <37228F87F4A9D640BB39B760B756FE34@namprd12.prod.outlook.com>
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
	sRroF5yQ2YN14vWPcUFgOnS8bOiTHoCFJqx+8K/P2AkBKT3PxdcSklj6496IsczwhBv1zL3inr9Jaf2PcrAMSWF3ljjwVNkPX46CyZ902PJ+2ddcwjCnCkWbwFzFKCWB4x9Kdbrk0nJuWYePDt/KyU/In+Z01vWYRwnBosytr9Dg4DlfDISLXyR4FHXtpCPXPlXTYeDqPJJECmXgpOsFJwEgJmsBdw71R/vpJ1UODD1yBnE+v3e9tKPhDx1rkkZUyjeSj5pWiBDTUlqLd7j8zJoP99etvU1+jsnzqEc6g9zpSN9k3oXIoGhpKnCciX0R81IdxvbNKM2S/zeNNDamUw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	A2drrXeWeUdRY7MVIeu6hNizHGgUScc2plUxL5OEou2cGTSGoQ8F7CgpwUC56BuK2BovPYbrMWXZamutyQNGOPLo5vRe8kne74QoFQbJp3h0aJ/XX7QP14LYKHMd8LqTJ0rXwF2bAtYWagRlKAXwq1f9RIhvY3IFVn4rWKh2EQo1FHRYV5JteovmOucaG+g+mIUspvImCH6MSLLnzse/jnhaV5+L5T9NJjvI/pMvIE+5/YQjnjsnznKu2IlxdKVq2KNbUvjleGBaGW+0eiMmTGnOBwbKy7lJ+6tDdksCkhYt+Yrmbp3mg4esvRNbvKOtd21CGKX4g8osfoKo43sLma10sV0EKerq7j4GedzxNpkTOYYBSuZ9KSk/uzK/DngpjN5Quq9bCK6rDkoyOMaVSxGumOjF7lvSDKNtpOPseuUx+xCNalHLww2bQEcqTaI9Yq9XobsO1jPVbVe6khLR1sxQj+/OFGaR5pXknYXHQjK6OF0emcKl4+UKJx0TYbBHd5vyuptvpHYC/18jp+GWoVBincY914eOC9BkHzKcjCZmKD2mJisAxM7mKhOcDQCihWIKwZh8ssxpOI/oiaRhHokcvPyi+MKWx4bfFri4TdMzo994925XL/rhrg7ql2V6AeoVtCKRst0pP17OCA1Fug==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d6420f-2383-49d6-56e9-08df2f172ae7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 02:01:06.0358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pJloiVercfh05wGin0TQBWtIr7jGBTZ2bXzOMbU9+gWORq8h/q94/WxcXLkoor7iLAQq5HBiZMCyzXchxm2uEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5872
X-Proofpoint-GUID: RqIpGtsvRPDdKqZs_CDKf7GESGKRn-BQ
X-Proofpoint-ORIG-GUID: RqIpGtsvRPDdKqZs_CDKf7GESGKRn-BQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAwNyBTYWx0ZWRfX41aH2B2RrsXH
 bPuFd80Wo5uMtGad5xRvopVaebTMp2nB9s/af9CVfcvX93zgZkL/oOwAFTkRqKf8R5rCj3OfiO1
 cKZgUMN8x3Xwpb3xZjZfQcjPMrNU2uFbqAOFDCSfvrzFE992Q+XZgLP+KM96p4RfMfIAoDE5Off
 gYQN5UVBMA+MyaeZjGTXlmw8KufvJ+wpuOBunv6gsKtyY/N0Q2ZfkqGRyHOydi9B1+a20JiNDGW
 2fWJdsPydYUyzKc9j9wOexLb++dE4n6RgM1TpYG/ikjbRKggCeQnnG8i3R1igYvYair1P1PC3kR
 7sX7w9hUuJHE5aOfBlLXwKKHu/i7ZbxFE/5zbqEMGOwwIRZPkidGv7TnzAge0YfQJTASaafkng9
 sq7dIPZZ11qtq4a4E+sV8BpOxrYWvpDXELFSSANV/cmh3cWGbZkNqOtNfdw7MEEHK85Zqm0D78f
 Nk+yAF5DXHeG+kJq3GQ==
X-Authority-Analysis: v=2.4 cv=E8RYNqdl c=1 sm=1 tr=0 ts=6ad81cf2 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=EUspDBNiAAAA:8 a=dm1kJQjh0Q0bfsdKSKAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAwNyBTYWx0ZWRfXw1Cwmb6EnxD0
 wXHqXowStovkpVUzW2XnH/rzqKuKAdnQIwfWl5dzR22UdsVuLe+kxKzomPVYK5Qyd8lwmL0jsOn
 +tu/A9KqfE0/NDVfdwrXZrZgB/cCgls=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 adultscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210007

T24gVGh1LCBPY3QgMTUsIDIwMjYsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IA0KPiANCj4g
T24gMTAvMTUvMjAyNiA3OjQyIEFNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gV2VkLCBP
Y3QgMTQsIDIwMjYsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+ID4gPiANCj4gPiA+IA0KPiA+
ID4gT24gMTAvMTQvMjAyNiA3OjE0IEFNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gPiA+IE9u
IFR1ZSwgT2N0IDEzLCAyMDI2LCBLcmlzaG5hIEt1cmFwYXRpIHdyb3RlOg0KPiA+ID4gPiA+IA0K
PiA+ID4gPiA+IA0KPiA+ID4gPiA+IE9uIDkvMjkvMjAyNiAxMDo0OSBBTSwgS3Jpc2huYSBLdXJh
cGF0aSB3cm90ZToNCj4gPiA+ID4gPiA+IER1cmluZyBwbHVnLWluL3BsdWctb3V0IHRlc3QgY2Fz
ZXMsIGl0IGlzIHNvbWV0aW1lcyBzZWVuIHRoYXQgbm8gZXZlbnRzDQo+ID4gPiA+ID4gPiBhcmUg
Z2VuZXJhdGVkIGJ5IHRoZSBjb250cm9sbGVyIGFuZCBhbGwgQ1NSIHJlZ2lzdGVyIHJlYWRzIGdp
dmUgIjAiIGFuZA0KPiA+ID4gPiA+ID4gQ1NSX1RpbWVvdXQgYml0IGdldHMgc2V0IGluZGljYXRp
bmcgdGhhdCBDU1IgcmVhZHMvd3JpdGVzIGFyZSB0aW1pbmcgb3V0DQo+ID4gPiA+ID4gPiBvciB0
aW1lZCBvdXQuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IFRoZSBpc3N1ZSBjb21lcyB1cCBv
biBkaWZmZXJlbnQgaW5zdG5hY2VzIG9mIGVudW1lcmF0aW9uIG9uIGRpZmZlcmVudA0KPiA+ID4g
PiA+ID4gcGxhdGZvcm1zLiBPbiBTTTg1NTAsIHRoZSBkZWJ1ZyBsb2cgaXMgYXMgZm9sbG93czoN
Cj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gUHJlcGFyZWQgYSBUUkIgb24gZXAwb3V0IGFuZCBk
aWQgc3RhcnQgdHJhbnNmZXIgdG8gZ2V0IHNldA0KPiA+ID4gPiA+ID4gYWRkcmVzcyByZXF1ZXN0
IGZyb20gaG9zdDoNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPC4uLj4tNzE5MSAgICBbMDAw
XSBELi4xLiAgICA2Ni40MjEwMDY6IGR3YzNfZ2FkZ2V0X2VwX2NtZDogZXAwb3V0Og0KPiA+ID4g
PiA+ID4gY21kICdTdGFydCBUcmFuc2ZlcicgWzQwNl0gcGFyYW1zIDAwMDAwMDAwIGVmZmZhMDAw
IDAwMDAwMDAwIC0tPg0KPiA+ID4gPiA+ID4gc3RhdHVzOiBTdWNjZXNzZnVsDQo+ID4gPiA+ID4g
PiANCj4gPiA+ID4gPiA+IDwuLi4+LTcxOTEgICAgWzAwMF0gRC4uMS4gICAgNjYuNDIxMTk2OiBk
d2MzX2V2ZW50OiBldmVudCAoMDAwMGMwNDApOg0KPiA+ID4gPiA+ID4gZXAwb3V0OiBUcmFuc2Zl
ciBDb21wbGV0ZSAoc0lMKSBbU2V0dXAgUGhhc2VdDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+
IDwuLi4+LTcxOTEgICAgWzAwMF0gRC4uMS4gICAgNjYuNDIxMTk3OiBkd2MzX2N0cmxfcmVxOiBT
ZXQNCj4gPiA+ID4gPiA+IEFkZHJlc3MoQWRkciA9IDAxKQ0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gPiBBbiBYRkVSIE5SRFkgaXMgcmVjZWl2ZWQgb24gZXAwaW4gZm9yIHplcm8gbGVuZ3RoIHN0
YXR1cyBwaGFzZSBhbmQNCj4gPiA+ID4gPiA+IGEgU3RhcnQgVHJhbnNmZXIgd2FzIGRvbmUgb24g
ZXAwaW4gd2l0aCAwLWxlbmd0aCBwYWNrZXQgaW4gMiBTdGFnZQ0KPiA+ID4gPiA+ID4gc3RhdHVz
IHBoYXNlOg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA8Li4uPi03MTkxICAgIFswMDBdIEQu
LjEuICAgIDY2LjQyMTI0OTogZHdjM19ldmVudDogZXZlbnQgKDAwMDAyMGMyKToNCj4gPiA+ID4g
PiA+IGVwMGluOiBUcmFuc2ZlciBOb3QgUmVhZHkgWzAwMDAwMDAwXSAoTm90IEFjdGl2ZSkgW1N0
YXR1cyBQaGFzZV0NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPC4uLj4tNzE5MSAgICBbMDAw
XSBELi4xLiAgICA2Ni40MjEyNjY6IGR3YzNfcHJlcGFyZV90cmI6IGVwMGluOiB0cmINCj4gPiA+
ID4gPiA+IGZmZmZmZmMwMGZjZmQwMDAgKEUwOkQwKSBidWYgMDAwMDAwMDBlZmZmYTAwMCBzaXpl
IDAgY3RybCAwMDAwMGMzMw0KPiA+ID4gPiA+ID4gc29mbiAwMDAwMDAwMCAoSExjczpTQzpzdGF0
dXMyKQ0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA8Li4uPi03MTkxICAgIFswMDBdIEQuLjEu
ICAgIDY2LjQyMTM4NzogZHdjM19nYWRnZXRfZXBfY21kOiBlcDBpbjogY21kDQo+ID4gPiA+ID4g
PiAnU3RhcnQgVHJhbnNmZXInIFs0MDZdIHBhcmFtcyAwMDAwMDAwMCBlZmZmYTAwMCAwMDAwMDAw
MCAtLT5zdGF0dXM6DQo+ID4gPiA+ID4gPiBTdWNjZXNzZnVsDQo+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+IEEgYnVzIHJlc2V0IHdhcyB0aGVuIHJlY2VpdmVkIGRpcmVjdGx5IGFmdGVyIDUwMCBt
c2VjLiBTb2Z0d2FyZSBuZXZlcg0KPiA+ID4gPiA+ID4gZ290IHRoZSBjbWQgY29tcGxldGUgZm9y
IHRoZSBzdGFydCB0cmFuc2ZlciBkb25lIGluIHN0YXR1cyBwaGFzZS4gSGVyZQ0KPiA+ID4gPiA+
ID4gdGhlIFJBTSBpbnRlcmZhY2UgaXMgc3R1Y2suIFNvIGhvc3QgaXNzdWVzIGEgYnVzIHJlc2V0
IGFzIGxpbmsgaXMNCj4gPiA+ID4gPiA+IGlkbGUgZm9yIDUwMCBtc2VjOg0KPiA+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gPiA8Li4uPi03MTkxICAgIFswMDBdIEQuLjEuICAgIDY2LjkzNTYwMzogZHdj
M19ldmVudDogZXZlbnQgKDAwMDAwMTAxKToNCj4gPiA+ID4gPiA+IFJlc2V0IFtVMF0NCj4gPiA+
ID4gPiA+IA0KPiA+ID4gPiA+ID4gVGhlbiBzb2Z0d2FyZSBzZWVzIHRoYXQgaXQgaXMgaW4gc3Rh
dHVzIHBoYXNlIGFuZCB3ZSBpc3N1ZSBhbiBFTkRYRkVSDQo+ID4gPiA+ID4gPiBvbiBlcDBpbiBh
bmQgaXQgZ2V0cyB0aW1lZG91dCB3YWl0aW5nIGZvciB0aGUgQ01EQUNUIHRvIGdvICcwJzoNCj4g
PiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPC4uLj4tNzE5MSAgICBbMDAwXSBELi4xLiAgICA2Ni45
NTgyNDk6IGR3YzNfZ2FkZ2V0X2VwX2NtZDogZXAwaW46IGNtZA0KPiA+ID4gPiA+ID4gJ0VuZCBU
cmFuc2ZlcicgWzEwNTA4XSBwYXJhbXMgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgLS0+IHN0
YXR1czoNCj4gPiA+ID4gPiA+IFRpbWVkIE91dA0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBV
cG9uIGRlYnVnIHdpdGggU3lub3BzeXMsIHRoZSByb290IGNhdXNlIGlzIGFzIGZvbGxvd3M6DQo+
ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IER1cmluZyBhbnkgdHJhbnNmZXIsIGlmIHRoZSBkYXRh
IGlzIG5vdCBzdWNjZXNzZnVsbHkgdHJhbnNtaXR0ZWQsDQo+ID4gPiA+ID4gPiB0aGVuIGEgRG9u
ZSAod2l0aCBmYWlsdXJlKSBoYW5kc2hha2UgaXMgcmV0dXJuZWQsIHNvIHRoYXQgdGhlIEJNVQ0K
PiA+ID4gPiA+ID4gY2FuIHJlLWF0dGVtcHQgdGhlIHNhbWUgZGF0YSBhZ2FpbiBieSByZXdpbmRp
bmcgaXRzIGRhdGEgcG9pbnRlcnMuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IEJ1dCwgaWYg
dGhlIFVTQiBJTiBpcyBhIDAtbGVuZ3RoIHBheWxvYWQgKHdoaWNoIGlzIHdoYXQgaXMgaGFwcGVu
aW5nDQo+ID4gPiA+ID4gPiBpbiB0aGlzIGNhc2UgLSAyIHN0YWdlIHN0YXR1cyBwaGFzZSBvZiBz
ZXRfYWRkcmVzcyksIHRoZW4gdGhlcmUgaXMgbm8NCj4gPiA+ID4gPiA+IG5lZWQgdG8gcmV3aW5k
IHRoZSBwb2ludGVycyBhbmQgdGhlIERvbmUgKHdpdGggZmFpbHVyZSkgaGFuZHNoYWtlIGlzDQo+
ID4gPiA+ID4gPiBub3QgcmV0dXJuZWQgZm9yIGZhaWx1cmUgY2FzZS4gVGhpcyBrZWVwcyB0aGUg
UmVxdWVzdC1Eb25lIGludGVyZmFjZQ0KPiA+ID4gPiA+ID4gYnVzeSB0aWxsIHRoZSBuZXh0IERv
bmUgaGFuZHNoYWtlLiBUaGUgTUFDIHNlbmRzIHRoZSAwLWxlbmd0aCBwYXlsb2FkDQo+ID4gPiA+
ID4gPiBhZ2FpbiB3aGVuIHRoZSBob3N0IHJlcXVlc3RzLiBJZiB0aGUgdHJhbnNtaXNzaW9uIGlz
IHN1Y2Nlc3NmdWwgdGhpcw0KPiA+ID4gPiA+ID4gdGltZSwgdGhlIERvbmUgKHdpdGggc3VjY2Vz
cykgaGFuZHNoYWtlIGlzIHByb3ZpZGVkIGJhY2suIE90aGVyd2lzZSwNCj4gPiA+ID4gPiA+IGl0
IHJlcGVhdHMgdGhlIHNhbWUgc3RlcHMgYWdhaW4uDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+
IElmIHRoZSBjYWJsZSBpcyBkaXNjb25uZWN0ZWQgb3IgaWYgdGhlIEhvc3QgYWJvcnRzIHRoZSB0
cmFuc2ZlciBvbiAzDQo+ID4gPiA+ID4gPiBjb25zZWN1dGl2ZSBmYWlsZWQgYXR0ZW1wdHMsIHRo
ZSBSZXF1ZXN0LURvbmUgaGFuZHNoYWtlIGlzIG5vdA0KPiA+ID4gPiA+ID4gY29tcGxldGUuIFRo
aXMga2VlcHMgdGhlIGludGVyZmFjZSBidXN5Lg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBU
aGUgc3Vic2VxdWVudCBSQU0gYWNjZXNzIGNhbm5vdCBwcm9jZWVkIHVudGlsIHRoZSBhYm92ZSBw
ZW5kaW5nDQo+ID4gPiA+ID4gPiB0cmFuc2ZlciBpcyBjb21wbGV0ZS4gVGhpcyByZXN1bHRzIGlu
IGZhaWx1cmUgb2YgYW55IGFjY2VzcyB0byBSQU0NCj4gPiA+ID4gPiA+IGFkZHJlc3MgbG9jYXRp
b25zLiBNYW55IG9mIHRoZSBFbmRQb2ludCBjb21tYW5kcyBuZWVkIHRvIGFjY2VzcyB0aGUNCj4g
PiA+ID4gPiA+IFJBTSBhbmQgdGhleSB3b3VsZCBmYWlsIHRvIGNvbXBsZXRlIHN1Y2Nlc3NmdWxs
eS4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gRnVydGhlcm1vcmUgd2hlbiBjYWJsZSByZW1v
dmFsIGhhcHBlbnMsIHRoaXMgd291bGQgbm90IGdlbmVyYXRlIGENCj4gPiA+ID4gPiA+IGRpc2Nv
bm5lY3QgZXZlbnQgYW5kIHRoZSAiY29ubmVjdGVkIiBmbGFnIHJlbWFpbnMgdHJ1ZSBhbHdheXMg
YmxvY2tpbg0KPiA+ID4gPiA+ID4gc3VzcGVuZC4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4g
U3lub3BzeXMgY29uZmlybWVkIHRoYXQgdGhlIGlzc3VlIGlzIHByZXNlbnQgb24gYWxsIFVTQjMg
ZGV2aWNlcyBhbmQNCj4gPiA+ID4gPiA+IGFzIGEgd29ya2Fyb3VuZCwgc3VnZ2VzdGVkIHRvIHJl
LWluaXRpYWxpemUgZGV2aWNlIG1vZGUuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEtyaXNobmEgS3VyYXBhdGkgPGtyaXNobmEua3VyYXBhdGlAb3NzLnF1YWxjb21t
LmNvbT4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBUaGluaCwgQ2FuIHlvdSBo
ZWxwIHByb3ZpZGUgeW91ciByZXZpZXcgb24gdGhpcyBwYXRjaC4NCj4gPiA+ID4gPiANCj4gPiA+
ID4gDQo+ID4gPiA+IEhpIEtyaXNobmEsDQo+ID4gPiA+IA0KPiA+ID4gPiBJZiB0aGUgQ1NSX1Rp
bWVvdXQgYml0IGlzIHNldCwgd2h5IG5vdCBjaGVjayBHU1RTLkNTUlRpbWVvdXQgZGlyZWN0bHkN
Cj4gPiA+ID4gaW5zdGVhZCBvZiBpbmRpcmVjdGx5IGNoZWNraW5nIERFUENNRCB0eXBlIG1pc21h
dGNoPw0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gQXMgcGVyIGRpc2N1c3Npb24gb24gWzFdLCBp
bXBsZW1lbnRlZCB0aGlzIGNoZWNraW5nIG9mIERFUENNRCByZWdpc3RlcnMuIExldA0KPiA+ID4g
bWUga25vdyBpZiByZWFkaW5nIEdTVFMgaXMgYSBiZXR0ZXIgb3B0aW9uIGhlcmUuIFdpbGwgc2Vu
ZCB2NCBhY2NvcmRpbmdseS4NCj4gPiANCj4gPiBBdCB0aGUgdGltZSwgbXkgdW5kZXJzdGFuZGlu
ZyB3YXMgdGhhdCBhbGwgcmVnaXN0ZXIgcmVhZHMgcmV0dXJuIDAgaW4NCj4gPiB0aGlzIHN0YXRl
IGFzIG5vdGVkIGluIHRoYXQgY29udmVyc2F0aW9uLiBIb3dldmVyLCBiYXNlZCBvbiB5b3VyIGNv
bW1pdA0KPiA+IG1lc3NhZ2UgYW5kIHRoZSBkYXRhYm9vaywgR1NUUyBpcyBzdGlsbCBhY2Nlc3Np
YmxlIGFuZCBDU1JUaW1lb3V0IGlzDQo+ID4gc2V0LiBBbHNvLCBvbiBDU1IgdGltZW91dCwgdGhl
IHJlYWQgZGF0YSBpcyByZXNpZHVlIGZyb20gYSBwcmV2aW91cyByZWFkDQo+ID4gYW5kIGlzbid0
IGd1YXJhbnRlZWQgdG8gYmUgMC4gU28gdGhlIERFUENNRCByZWFkIGJhY2sgaXNuJ3QgcmVsaWFi
bGUuDQo+ID4gDQo+ID4gQ2FuIHlvdSBjaGVjayBHU1RTLkNTUlRpbWVvdXQgYWZ0ZXIgdGhlIENN
REFDVCBwb2xsaW5nIGluc3RlYWQ/DQo+ID4gU29tZXRoaW5nIGxpa2UgdGhpczoNCj4gPiANCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3
YzMvZ2FkZ2V0LmMNCj4gPiBpbmRleCBlZTgzNzIzNTYzMGEuLmZmNDk1N2E3MzExZSAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ID4gKysrIGIvZHJpdmVycy91
c2IvZHdjMy9nYWRnZXQuYw0KPiA+IEBAIC0yODMsNiArMjgzLDggQEAgaW50IGR3YzNfc2VuZF9n
YWRnZXRfZ2VuZXJpY19jb21tYW5kKHN0cnVjdCBkd2MzICpkd2MsIHVuc2lnbmVkIGludCBjbWQs
DQo+ID4gICAJcmV0dXJuIHJldDsNCj4gPiAgIH0NCj4gPiArc3RhdGljIHZvaWQgZHdjM19zY2hl
ZHVsZV9lcnJfcmVjb3Zlcnkoc3RydWN0IGR3YzMgKmR3Yyk7DQo+ID4gKw0KPiA+ICAgLyoqDQo+
ID4gICAgKiBkd2MzX3NlbmRfZ2FkZ2V0X2VwX2NtZCAtIGlzc3VlIGFuIGVuZHBvaW50IGNvbW1h
bmQNCj4gPiAgICAqIEBkZXA6IHRoZSBlbmRwb2ludCB0byB3aGljaCB0aGUgY29tbWFuZCBpcyBn
b2luZyB0byBiZSBpc3N1ZWQNCj4gPiBAQCAtNDMyLDYgKzQzNCwxNCBAQCBpbnQgZHdjM19zZW5k
X2dhZGdldF9lcF9jbWQoc3RydWN0IGR3YzNfZXAgKmRlcCwgdW5zaWduZWQgaW50IGNtZCwNCj4g
PiAgIAkJY21kX3N0YXR1cyA9IC1FVElNRURPVVQ7DQo+ID4gICAJfQ0KPiA+ICsJcmVnID0gZHdj
M19yZWFkbChkd2MsIERXQzNfR1NUUyk7DQo+ID4gKwlpZiAocmVnICYgRFdDM19HU1RTX0NTUl9U
SU1FT1VUKSB7DQo+ID4gKwkJZHdjM193cml0ZWwoZHdjLCBEV0MzX0dTVFMsIERXQzNfR1NUU19D
U1JfVElNRU9VVCk7DQo+ID4gKwkJcmV0ID0gLUVUSU1FRE9VVDsNCj4gPiArCQljbWRfc3RhdHVz
ID0gLUVUSU1FRE9VVDsNCj4gPiArCQlkd2MzX3NjaGVkdWxlX2Vycl9yZWNvdmVyeShkd2MpOw0K
PiA+ICsJfQ0KPiA+ICsNCj4gPiAgIHNraXBfc3RhdHVzOg0KPiA+ICAgCXRyYWNlX2R3YzNfZ2Fk
Z2V0X2VwX2NtZChkZXAsIGNtZCwgcGFyYW1zLCBjbWRfc3RhdHVzKTsNCj4gDQo+IEkgZG9uJ3Qg
aGF2ZSB0aGUgYXBwYXJhdHVzIHRvIHJlcHJvZHVjZSB0aGlzIGlzc3VlIGF0IG15IGVuZCBjdXJy
ZW50bHkgYW5kDQo+IGV4dHJlbWVseSBkaWZmaWN1bHQgdG8gcmVwcm9kdWNlIGF0IGN1c3RvbWVy
IGVuZC4gV2lsbCBzZW5kIHRoaXMgZGlmZiBhbG9uZw0KPiB3aXRoIHlvdXIgc3VnZ2VzdGVkLWJ5
IHRhZyBpZiB0aGF0IGlzIGZpbmUuDQo+IA0KDQpJJ2QgcmF0aGVyIG5vdCB0YWtlIHRoaXMgd2l0
aG91dCB0ZXN0aW5nLiBUaGUgY2hlY2sgYWRkcyBhIHJlZ2lzdGVyIHJlYWQNCnRvIGV2ZXJ5IGVu
ZHBvaW50IGNvbW1hbmQgYW5kIGltcGxpZXMgdGhhdCBDU1IgdGltZW91dCBpcyBleHBlY3RlZA0K
ZHVyaW5nIGNvbW1hbmQgc2VuZGluZywgd2hpY2ggaXQgc2hvdWxkbid0IGJlLiBXaXRob3V0IGNv
bmZpcm1hdGlvbiB0aGF0DQppdCBjYXRjaGVzIHRoZSBpc3N1ZSBhbmQgdGhhdCByZWNvdmVyeSB3
b3JrcywgdGhhdCBjb3N0IGlzIG5vdA0KanVzdGlmaWVkLg0KDQpBbHNvLCBsb29raW5nIGF0IHRo
ZSBvcmlnaW5hbCByZXBvcnQgYWdhaW4sIHRoZSBzdHVjayBzdGF0ZSBjb3VsZCBzdGFydA0Kd2l0
aG91dCBhbiBlbmRwb2ludCBjb21tYW5kIGJlaW5nIGlzc3VlZC4gVW5wbHVnZ2luZyB0aGUgY2Fi
bGUgdGhlbiBnYXZlDQpubyBkaXNjb25uZWN0IGV2ZW50LCB3aGljaCBibG9ja2VkIHN1c3BlbmQu
IEEgY2hlY2sgb25seSBpbg0KZHdjM19zZW5kX2dhZGdldF9lcF9jbWQoKSB3b3VsZG4ndCBjYXRj
aCB0aGF0Lg0KDQpQbGVhc2UgcmVzZW5kIG9uY2UgdGhpcyBoYXMgYmVlbiB0ZXN0ZWQgYWdhaW5z
dCB0aGUgZmFpbHVyZS4NCg0KVGhhbmtzLA0KVGhpbmg=
