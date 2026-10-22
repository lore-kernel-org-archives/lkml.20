Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792712689;
	b=GHa9TzRRFnpT/0ZxXvb5YMKaA5v65CI32VhRgiiuyGHye1meKNuLws4KhfqkzrY7788A
	 cnH60sxch9X3hOmxgDpkGlbVebwnoJOZv3YG5OA4F3vBL2T1ODknn6xAtXCG6dxcgPg1F
	 qLKR27lm4N8nR8FZW8o6v8zcRR7K0LsvpwVKJL1C8IpUwYZ3qB99ptapBz3Bqqfx1ncBc
	 qZXzuQtQsp8JxZp2f/iN/FvHA4csrM2B9bTE4T40rLkUJdFtqXi7Auic1qiLUTTHkRJKX
	 ckfUoUBMZHb5vceeJkob4Nx4Tfbf5o9uHFYUx3lKHV3hozPCki00rJeMAMV0/t8iEZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792712689;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gPTkh4mxEbGe4+xjnuy1Tzbg/rRwgG4gayDZ5V98fvU=;
	b=UdePgIMGH+Lf5qxg18Fo3kP38MVNQH6gCoBlGIue74YscnnoHvt6eONHJtVaKqQZ/fBL
	 ijwNH08zX3xBPkUqU5Zk+nKUq6gYK/zk2dTc/4/24YntXyWS3IeUXWywv9derM4Zez4wJ
	 +nG/fiUR8l6186062AKxJaU4oQzfYqErHtFNzN5KgZUCfkFV06nSV6P8NwBIfjHMxh7BA
	 FqrYwxyW4uo6Nxxa+9BIA0hUSQ4+2x5DbG/Dy3xl2DV0qM3tGA5C/5HLrqAIPUt/8q15i
	 fVott5ezxOv8GDafrb6s18gTn3s9XLFuFSNG8cH7itfB7j9s+YgZgMWxdwYX5aPP9JA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=GC8U6mvq;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=GSv7k1ms;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=svUfGP2A;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3083606A31D;
	Thu, 22 Oct 2026 23:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3083606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=GC8U6mvq;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=GSv7k1ms;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=svUfGP2A
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MMDH6m1195966;
	Thu, 22 Oct 2026 16:44:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=gPTkh4mxEbGe4+xjnuy1Tzbg/rRwgG4gayDZ5V98fvU=; b=
	GC8U6mvqeis4slvqENyG1gr3d6YghoL/Upj/a51cnrsYOs4R3ikix6pwXVK7WZxk
	X6GpglprYn1elsIz9Uv/AbdLEWGtccHwmDHb+0tiMUC00hlrLCWHrtd2SYUg9tu8
	rji/crVJlvpHlmqFasjE2aXeFJu9oqOhZlKbgdQOFvV3dlHXRV1/+cuAZmlKPn64
	bpKz8DrMsRke4PRhp5MiPYZqQWSrwT+dbt5PxNVyRuNhl4sb3eAeUV3jf4xHt9Hi
	O7XKj6IaOD2yFxRvQGPyeozZxW71D2hORWuTP+g0B4b4fP83d9ik7pCbGnN6UoBU
	ZrKB9HGDJPwC3aMYegZ72w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4hfdqw88ex-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 16:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1792712671; bh=gPTkh4mxEbGe4+xjnuy1Tzbg/rRwgG4gayDZ5V98fvU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=GSv7k1msm6W/y/BqxEr5iCtpf1E+EVUcrMf+CH1hXnJqAYEVZy2NkiDwLN6d0yN/9
	 oBo9tS+Xv9rrnX4ZV70Yub8/dlNP5YAvldfqxc5QNQe7i3yXebZI0hq7vA/E5+eEg6
	 4QBHCdF/OFYj3lEO/d6+/5ABGpILTXBasXoIa4N4QUKAFfHYeLOdhpG29ZrazQgdu5
	 W9LphSmYNIA3yJJjmxVTKAdfAtomxEDiVoILhkbRlyi5jZDyfEXY3ajxOHpZlOAg8O
	 /6NBthW67lY1PeOzE/xkYwUgGN4ft4Yr7BqEtHOMoV+j27+4YZam/Ow6QCVvtlasL9
	 fVeXLRElsx5og==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6C641401CD;
	Thu, 22 Oct 2026 23:44:31 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 3A212A037D;
	Thu, 22 Oct 2026 23:44:31 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=svUfGP2A;
	dkim-atps=neutral
Received: from CO1PR08CU001.outbound.protection.outlook.com (mail-co1pr08cu00101.outbound.protection.outlook.com [40.93.10.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7397B4048B;
	Thu, 22 Oct 2026 23:44:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGJq381Nxf/dSxvMNgY3bVaeTQGV0zL+wQX7xFOnp1Fy344QkTop3on925TPZNDB8SwVn0/K1+AfxpnSpXciBrqLfXyB1v0LK3jWbqzkVWHSiVRmYXvOWuPyba21pgz/TdQFNeSMC/ghVxpirawOgLMoe0qXIBV0UUV3GTVbqxhy4OjgxGQQ6Pdn8RYAIAr2O/UQWmk9ViInULL3x5fK4HrFfhZciSjWmOif2I5ux1c/GQGIBZvs1rVQBYpunDScmYAyEU2XvOv4FYlb1ul7dYl3VCWufphZBbOMx02v4ZmtjCCMVXPQe8MQj49XFM51x1/YXrLOKgYPizaeC32BMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPTkh4mxEbGe4+xjnuy1Tzbg/rRwgG4gayDZ5V98fvU=;
 b=BpVXcq2RE+3YGRyN3DDf5SFv9F+i3RlPT0PMkEyqT0SKKREAMMVXZowFtyRswSiDNjuj/PsZokMAPI348oCxkCUQ6v9ztCKMEuo2G6uJ2tyMD1bykEWkjYmB3tt7CbiVB07k8EpRG4/wSXfwqborwK0Y7LNQUY+HPfE3QOA6BIW34x8Iuu1Nd2ZP+73DkYDQsLrZDjfrkDSP7CtGfikWUDZCR/S61ndF8sNUGfcadRRaag90I4dPMrGrqG/k3lO36Mdmn20IxuEn6+Ft5cVim+38tr8S/hLm2XCLhbfX8whNQzCy93ZICmhcy2yBiGePEqMsXIn5BEFy5Vqvf0a+bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPTkh4mxEbGe4+xjnuy1Tzbg/rRwgG4gayDZ5V98fvU=;
 b=svUfGP2AjhXIcAa7BoSxPkd4Xq/KGhBbAgh6bss8gvP+MCCrI8ZkQqwj/4YXXhQC9WNUdEu3NhQdHcJlA2XmKazy5qT8rHjhmkzCNgDaRDvwSTJboMWTwRyymcQP8pfLAzGz013HEA2jAQaYq71rUV7foyJVMmSzPI4NQ5KvtxI=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DS0PR12MB7510.namprd12.prod.outlook.com (2603:10b6:8:132::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 23:44:25 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%5]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 23:44:25 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        "fabricioakio@gmail.com" <fabricioakio@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH] usb: dwc3: qcom: Check for L2 only when suspending a host
 with wakeup
Thread-Topic: [PATCH] usb: dwc3: qcom: Check for L2 only when suspending a
 host with wakeup
Thread-Index: AQHdT3WDXselBKVy60uhtkbWhfiMJ7cIJccAgADlswCAAVQjAA==
Date: Thu, 22 Oct 2026 23:44:25 +0000
Message-ID: <atqdCfSLOD_g66i4@vbox>
References: <20260928-dwc3-qcom-l2-check-v1-1-43c5c6e97922@gmail.com>
 <7eb8f0f7-9e5b-44e9-971c-54bfdab23c30@oss.qualcomm.com>
 <atmChJYMtjPtW_ZE@hu-petche-lv.qualcomm.com>
In-Reply-To: <atmChJYMtjPtW_ZE@hu-petche-lv.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DS0PR12MB7510:EE_
x-ms-office365-filtering-correlation-id: 05a0d4ba-916f-42c9-01b9-08df309667af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|56012099006|4143699003|11063799006|261021121427099003|10067099003|22082099003|18002099003|6133799003|261022105027099003;
x-microsoft-antispam-message-info:
 /j5TAFX61DBeQ0t+6NL79lrkjsek0nkX3iVbEbJd/puH8AyXqwmDYZMErSsxqTb4lReLpdCx3j4oi2cQP15+g+odbb2anEMAo1EsZ185VHOhNfB4DMbENhCRJ2wwoPxnlD37NKZeo5weA+ub0YWKNGyZjJm1lyV9JNlmTy9K0GMqYNrykiC2XG/8XygTdI06587z0olU9j1qrHfexwhAszTAGFFAZsXub6QM9+4mNeBz1Y97uQeKNj2X9I4KYV9t/iOYw/TgYHnqiOHQ9vC0BHlS8tOQQqq7jCdAAMnHaGmiH+/SzWf4HHi83Bc+qSXBYshN9WlpRIOAxKGhKfCEds432/yKcDLcGK5P6dDdGb5Takq6oAnFFQRzet5a43TC/eLill8xe6Ik7FcGtuReEdXUDp89lliSSh+TV5PAw5ezD5JTjlkUNZKbhtD564wusFFr5vrdqDQc4iz43hUjY9nqqIUp5/aWGwiFJuN24zK6O/PO98Dbc3tP6gdFfuRDuz0fILOYYWuCpLiBuk9eaAzosPHXFioTnAVyhCepp2DocRNVAI2ZprZQXXJFVe1xjPJ6TG2TXkebvt0LLrEvTCJLKsrVy78G+eiEJfoH16XVfsnaWPzsZG42cSH/UTWkNHU3z98K6avlZ8W4kfuxVHuK4XDc55hkmcLE5sPq7JMtjffW+Xqom4X0eTWdyu+RTMDDAoqTHgPhKlVBaElvRoBQtUiEiY3YAMqqRi0H6oE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(56012099006)(4143699003)(11063799006)(261021121427099003)(10067099003)(22082099003)(18002099003)(6133799003)(261022105027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VUFFNVFoUE5nSkdyTmVKMG5IeFhvQlMwL2FKdlV4b0FvOGQwdzI0bU9pMFhG?=
 =?utf-8?B?L3hEMEdPNm4vSlBwcHREczZrbHpmUW12SFZxOFpac2xpMXVPNGtxRW83VU1s?=
 =?utf-8?B?d0VKMnBkZDJ1Y1dlbUpBQS9yUTJrMmQzeGFBaEpoMGh5U1F4QW1COEt5MlpE?=
 =?utf-8?B?amp1TkRLTVpSd051ZFdXOWdPa3JjcGdnOEgvQTMzZkptSitUN3RkVnpveWtz?=
 =?utf-8?B?dHppNmduY2xMRmEzU1U4ZE1iYW9rQ2Nmb3VkMXUrY3FudU5FRlFQSWJwcllZ?=
 =?utf-8?B?dUN2OHZJaGFXYzNLU3U5TUlad3d0NTVqS1hycUkvMVRxSjA5MkoxaHhqeXZj?=
 =?utf-8?B?aGw2WUVzaUtGVDhkcVRSVXpMcTFTSlNyS09IOEJrcVNmbi9Ec1QwWGhjMEk4?=
 =?utf-8?B?a1d2Yk5ZUnNpL3NhUnBvaHZFL3Iva1Y2aGlMMGN0N29Sd3ZvaGN2MHNvcG53?=
 =?utf-8?B?eXUyc1Qzc25ESVFWaldxdGg5K1dTVDcxWlFBdzBjQlFGQ0NGMFBWZ0hROEVZ?=
 =?utf-8?B?L05EUVREamlHckVuWmRLaEl3dzlkUE00a3hxSCtKRFB2eTF2N1RZSmhmUUdP?=
 =?utf-8?B?ck9OMWZhMitmV2JDSTN6R2lqTDJiNSszY2Juc0luUnZkSk9oSFdMUW1QNkkv?=
 =?utf-8?B?dXlLVnM1bXVYZEt3L3Q0TUJPK0Q3VzlFaGFyMk9DQkRRa3paNVNQQ1BOMGMv?=
 =?utf-8?B?OVNMVU80R2VTY2JjTmtseXpUUitKZXVFM3R1QXRJY3hKUGdGYzZpWHdibVNk?=
 =?utf-8?B?Z091eWJSSDBSbzZMcTBrd1g1UDl6YlA3TkhGdlozdmJJNlBLeWVBZ1U4VzVL?=
 =?utf-8?B?SkdIWDVkNktwTVV5Y0JtUUdXdDcrODdXbGhYd0xpbStFR0RSY1lXaVI1Y21k?=
 =?utf-8?B?Um5iWmJ1QmtleTVpT2FCN2VZU1FqTThwQnhUazQyT2ZqVkF5Q09DNXNNUVlN?=
 =?utf-8?B?aWZPcklvQk42cVpidFpmRlVjM29Kek5HSmJFd25OaWp4aDNRRzN0YWt3M1Bs?=
 =?utf-8?B?TDZDYzZnbWxqbDVQZXhBNEVEVzVHOVkvS0FxbFlTTFJtRkVNa28wTVBTRFc0?=
 =?utf-8?B?bnUwd29YWHFmRC9lQzJiaTZwZHY2UTMxclVzNGg4b0hkUVpGUVZyTGVSdlM2?=
 =?utf-8?B?aDEyZEx4L2hLUHpGZ0F0TkMwZENhV0ZBbVhJdnFFbzJwRjBIai9hY2FjSmFj?=
 =?utf-8?B?RnhsTWhkc0hBakNKMXhrREU5TlR0TFdXQmJucmFZWmRaby96RDUrV1Z1aitL?=
 =?utf-8?B?bGlDTElKS0RkU2VBYTgxK1AzRVB3M3U2NldsMnVCQUpmU1d6MUFyRkVvRTVh?=
 =?utf-8?B?eEFkV2w2cmZKOGNLU3VDMWFzQklOOHQ5L2pQNWVIRER2RE9ZYVN5aCtIaXFZ?=
 =?utf-8?B?czl6Qk92Z2dOc3U3VnRvNElvVzZub1h5cE1ZaVhIbnUrRDJLek1lVXI1eVpY?=
 =?utf-8?B?Umg1OFptVDF0eGdFbHk3UmdUUTcyNEtVcUhhYmwyeHR3UlF4WDcvTUs1VjBF?=
 =?utf-8?B?ZnkzM1dKeThobkVoWVFBaXpEMnRWdWk2ZUlvV2JsaFpxem1LbjNzbHVUUG9E?=
 =?utf-8?B?ZmtVdWI2Um5RTDkwc01kNlBtTFRxWXV6RHlnTVVIbFBZNENQa1UzcTN4N0lx?=
 =?utf-8?B?NWUzY1craGhTTGxMbWlSZnR0MnJPT2JNT3BFNnlsRlFuUTRVOE1GMWJOQkhE?=
 =?utf-8?B?Nm1hL1duTFViT09WY2grSlF6UWNmWHkwcEJyVkxOaHdHOFAyb3dyUFVRSDY2?=
 =?utf-8?B?am1rRndWOWI4MTd1alF5VFZVOExkT2gzcVNwdGpMdkJ3cDdyVlo4aHo3RjM0?=
 =?utf-8?B?YjMxeWkvTUdTRjZuZS9OTFQ2NitQeVN0VEYzUG9qb0ozVm9Jam03dFVVNlVO?=
 =?utf-8?B?UGgyVjJKMWd1L3pSMXBaUWN2RC9yUFJNV0RVSEwvTTVIZGZVbndNKzB2RFln?=
 =?utf-8?B?bjc4aUNNTXU0ZTA2OTBXK1MyRnpHSjVVQStpSktKa1RwZ0Nac2lhc2QzMDhG?=
 =?utf-8?B?UnZxNEpOODlxRVhOWGlNd1RCK2pET01MU01JVDhRVlUyVHNFaE4xYWFZQWQ3?=
 =?utf-8?B?RER3ZTl1RDdqczU3U3VQWjVZTjdwUmxNVzc3RDYvNlY2OG5TN2tTR1JvUzMy?=
 =?utf-8?B?RUdRUytHdVJkbnlGNW1hTUdDUUpTVUtUZU1TV0xCRWtKNDk0cE5UL3VOMlR3?=
 =?utf-8?B?bnlpY1E4VDhsRDVtTnJtRHY0ekJ6eElSb294NWdTNlppVkgrTGxvTm5vN0tw?=
 =?utf-8?B?VU5GTTVpN2tVaHpBOC9OQm96OFVLN2kwTU5oSzdDWlBOQmRtTTlNOVA5RUFt?=
 =?utf-8?B?K29MRnl5K00zbDJoQWU4ZzlNazNqcnQ1WEhsVUFyeDlxNGU5TGFBQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <29B133634EE90C43B4F47B77AFAD9E6C@namprd12.prod.outlook.com>
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
	NsUGLHlu7i0VIxv8nthkBQLUhEtmLYCfV9Q6pp/105aMyTFXTBsfbfyPKq0zP0U2VOJiZB7jfBZJ51NnKlOyW7JRVud9Ie1G2a2bLRHa/o+6kejCwahwgfGbZZhdinIbysjkaFMvVFD0+4CbgVL7PFMD9Gg81ai2Vzgcxpid9VkygKJ3HyGvxmCmV+THNdg7cqtsLKKzPwRcUiWU7k1/otQBMVfBMukGRk310j/MMXDFk3MwWbStvRy5pGpb6f1QJwvtWB0C28U++EZ6yoRsHw1L3/h609tjjoH9leeELGdcsOY/6ENKJXq3v9BsqJc5k5SoHQ9LGJScKtsiLtQmbg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UMoSBLYm13hCF0jtcX2vFnu+AdqI/8CogJS/Xt0y/QmL4PYfVn2JSCf0I78rexbIXFAlQMIW4YyN3aosH74buceOdJpqwp0EBZ+Xb7FlIeTSztzy9QVapxTKFfytxbARWl0ccrhbNNDC+9R0umzXahmhgy+xUt1K4pc+kVk7FfR789GpRBWFrv/fD7Y0RM013DITScWuybOUYzIkdMqabgpi6G1PFe5ig+jT+hy8HiLwn/qqnHy2dTVLet9wWpnCctUSUa1jHNcjDO51i7Rmr71xTDU9WPuek97EV6pTBtFqhT4PlJMY86ia8WHrzrhDfG+BGwZgu7ENhxmvf8aRO40S1d4C86gsd2bMP1D1y0gBy7Wad+VC4JEleyDIaWPEnL8gD8AT893RINyuFx82cOPjkuJHVj4vXyykcTIjHw1YxzzgqySEm0N4nGq7iZqVDukX63t22mLzqochw23d8a+3DbKSXxv9aFSAYHbJ0IhlCJFkIlIhgTRur65fkpdmyATvADa+lY9gTlZMSmlKu6iblFaxI8JEm7eAUlZAHki1UBAKlCkQz2dkDcsMQLfJlCr4ZZrgbho5oearf54pBImdatFjSI+ixkIvbfhxLGx2Jp/3CeT+5HmZ+rGKFhlRj//kv0nlf1TyCgcJXm3+aQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a0d4ba-916f-42c9-01b9-08df309667af
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 23:44:25.1842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ywc7GzhIlY96SA+hAL8jFgd1sjDPuczzJYPNzgfz2J0LgbGk6ROb0gr37sXWaRpJRjaMI0OWNAomSH4mrgoUZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7510
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA5NCBTYWx0ZWRfX4U/Pf45wrTKv
 pKfTk49N+6+27YrRqjrIEtMvdjhE53oH7TCHPs3xWG5nsBzCBgJtw5WDLNDKz2Vlrp58DFVr1aM
 V41gGlfZI80j6pKMe0GQmFwvnU2ilsM=
X-Proofpoint-GUID: s16iJLw_SG2gQ_VPQ571z9QOxhPGuMd3
X-Proofpoint-ORIG-GUID: s16iJLw_SG2gQ_VPQ571z9QOxhPGuMd3
X-Authority-Analysis: v=2.4 cv=HK9WhYtv c=1 sm=1 tr=0 ts=6ada9fe0 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=QFNGBFAix9GFkXGs:21 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=qPHU084jO2kA:10 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22
 a=jSPayVjLy6xbsuKauFBc:22 a=pGLkceISAAAA:8 a=sSfTRGjrgY6hU4bfQ7YA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA5NCBTYWx0ZWRfXwx0fiKvwBQa7
 awTTqR/5v40N2XV3ZXtC47+biAbv7n9O9V3iA+xSiRsbJYK1LN4HlNp1PwAnMSkYXIvAnNLfDTg
 IntMkA668GpyCijy+FI7c36yxOr2Rt4UyniIz4d0NlMSRIzJpNWaWlNKqFFujTa5Ncz2l8auOT2
 Z8FBsJoMPXCikn6mYL74Cb8zEsfq8//zzokg3hZQOY9PtxE9GqlQg0lgj/a6/SQ56NGyXiQ3Ndz
 UScrhUGCDBfIgiD4MoJrxeVdbp4hvk6BjHep+CaiubpCupwHCNVBtoKKxSdrPH2SZvm0/lzMgdj
 5B6YNMx62t0pavLAa1xaoZzyU2Ez+lUp+BN/aQ3LFKuNYmFrHHBUQ5/07OPCUOPR7J1wx0yiLU4
 iyufjXbhfToDJqOWfHT3ZzfVGfLM1C/KLJCPxjE50RHPdjpR8iAKslQ+ySAAi/n3HGjp6XAYweb
 9m5Bx5aeDg2QcLS8X8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610220094

T24gV2VkLCBPY3QgMjEsIDIwMjYsIFBldGVyIENoZW4gd3JvdGU6DQo+IE9uIDI2LTEwLTIxIDE1
OjQ0OjUyLCBLb25yYWQgRHliY2lvIHdyb3RlOg0KPiA+IE9uIDkvMjgvMjYgODoxNiBQTSwgRmFi
cmljaW8gQWtpbyB2aWEgQjQgUmVsYXkgd3JvdGU6DQo+ID4gPiBGcm9tOiBGYWJyaWNpbyBBa2lv
IDxmYWJyaWNpb2FraW9AZ21haWwuY29tPg0KPiA+ID4gDQo+ID4gPiBJbiBwZXJpcGhlcmFsIG1v
ZGUgdGhlIGNvcmUgZGlzY29ubmVjdHMgYW5kIHBvd2VycyB0aGUgUEhZIG9mZiBiZWZvcmUNCj4g
PiA+IHRoZSBnbHVlIHN1c3BlbmRzLCBzbyB0aGUgbGluayBuZXZlciBlbnRlcnMgTDIgYW5kIGV2
ZXJ5IHN5c3RlbQ0KPiA+ID4gc3VzcGVuZCBsb2dzICJIUy1QSFkgbm90IGluIEwyIi4gQ2hlY2sg
b25seSBmb3IgYSBob3N0IHdpdGggd2FrZXVwLA0KPiA+ID4gdGhlIG9uZSBjYXNlIHRoYXQgcGFy
a3MgdGhlIFBIWSBpbiBMMi4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogRmFicmljaW8g
QWtpbyA8ZmFicmljaW9ha2lvQGdtYWlsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+IA0KPiA+IEkgdGhp
bmsgd2Ugc2hvdWxkIGJlIGFibGUgdG8gcmV0YWluIHRoZSBsaW5rIGluIEwyIGluIGRldmljZQ0K
PiA+IG1vZGUgdG9vIHVwb24gc3VzcGVuZCwgYnV0IHRoYXQgbmVlZHMgbW9yZSBwbHVtYmluZyBv
biB0aGUNCj4gPiBjbG9jay9nZHNjIHNpZGU/ICgrQ2MpDQo+ID4gDQo+IA0KPiBGcm9tIHdoYXQg
SSBzZWUsIGR3YzMgY29yZSBqdXN0IGtlZXBzIGdhZGdldCAoZGV2aWNlIG1vZGUpIGRpc2Nvbm5l
Y3RpbmcNCj4gd2hlbiBkd2MzIGNvcmUgZW50ZXJzIHN1c3BlbmQuIFRoZSByZWFzb24gaXMgcHJv
YmFibHkgZHdjMyBjb3JlIHdha2V1cCBzaWduYWwNCj4gKHRocm91Z2ggLmR3YzNfZ2FkZ2V0X3dh
a2V1cCBvciBkd2MzX2dhZGdldF9mdW5jX3dha2V1cCkgaXMgc2VuZCBieSBzb2Z0d2FyZS4NCj4g
V2hlbiB0aGUgc3lzdGVtIGhhcyBzdXNwZW5kZWQsIG5vIHNvZnR3YXJlIGhhcyBydW4sIHNvIGNh
bid0IHRyaWdnZXIgd2FrZXVwLg0KDQpSZW1vdGUgd2FrZXVwIGlzbid0IHRoZSBsaW1pdGF0aW9u
LiBUaGUgaG9zdCBkZWNpZGVzIHdoZW4gdG8gcHV0IHRoZQ0KbGluayB0byBMMi9VMywgYW5kIHRo
ZSBkZXZpY2UgbXVzdCBzdGlsbCByZXNwb25kIHRvIGEgaG9zdCByZXN1bWUgb3INCnJlc2V0IHdo
aWxlIHN1c3BlbmRlZC4gSWYgdGhlIGNvcmUgaXMgcG93ZXJlZCBkb3duIGFuZCBpdHMgc3RhdGUg
aXMNCmxvc3QsIGl0IGNhbid0IGRvIHRoYXQuIFRvIHN1cHBvcnQgdGhpcywgd2UnZCBuZWVkIHRv
IGltcGxlbWVudCBkZXZpY2UNCmhpYmVybmF0aW9uLg0KDQo+IA0KPiBGb3IgcnVudGltZSBzdXNw
ZW5kLCBjdXJyZW50IGR3YzMgY29yZSBkb2Vzbid0IGNvbnNpZGVyIGxpbmsgc3VzcGVuZCBldmVu
dA0KPiAoZWcsIEwyL1UzKSBhcyBsb3cgcG93ZXIgZXZlbnQsIGFuZCBkb2Vzbid0IHB1dCBkd2Mz
IGNvcmUgZW50ZXJpbmcgcnVudGltZQ0KPiBzdXNwZW5kLCBzbyB0aGUgbGluayBpcyBhbHdheXMg
TDIgb3IgVTMuDQo+IA0KDQpSaWdodCwgZHdjMyB3b24ndCBydW50aW1lIHN1c3BlbmQgd2hpbGUg
Y29ubmVjdGVkLCByZWdhcmRsZXNzIG9mIHRoZQ0KbGluayBzdGF0ZS4NCg0KRmFicmljaW8ncyBw
YXRjaCBpcyBmaW5lIGFzIGlzLg0KDQpUaGFua3MsDQpUaGluaA==
