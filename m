Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890103403E1;
	Sat,  3 Oct 2026 01:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790990650; cv=fail; b=pEUzwVBLQ+qIsozEHyheKIGgU3ia8GO51LDcvdm74AUG42PbTpla8cTE8OdtLYLV9QaUkL0g5Iwa5TB/NOV54p0OtkPtmfCIfGUKM9QxJIHatEM23ko19oP9Dx2lU1ZoQwSDpl4MIkozfYIaTHGQW2ZfSD2bSk1kZ5g65RsIG9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790990650; c=relaxed/simple;
	bh=0QJuTfuHadbiBymFUJmXbyEVHq8KzlSC2JTyTzNEnBM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OX9zs4vhCdrk4FZMZNQ8aIYJrc4QqkG0NGxLYIue8mcvLSwR3nvA0QjSOwIKYdzXiR9HquLhasIu4H9Ek+qzpzrEyUPUFgHP5wD93UGzkvTtVmLFAZtYiIm6tYLAxnLGSZLBAPuO8sG9pg9DPsEXUjqRAipXfPqOY6kTTrrh9I8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=RoONGm1C; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Otn8EfGK; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dNk1Asol reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RoONGm1C";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Otn8EfGK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dNk1Asol"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NfcvH994623;
	Fri, 2 Oct 2026 18:23:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=0QJuTfuHadbiBymFUJmXbyEVHq8KzlSC2JTyTzNEnBM=; b=
	RoONGm1CWn/Fjc58ZOKCg+xMvBEQzJWSJC6STOzjDn6wYtHX3hr+6T8eN7SRyydS
	1D9w0cIWwTsNhASBzOO2CRziUv19SIG8F9Es5ncQhtxOlAahClUsmTSD/v6tmGjN
	UL+MqbwYf76iqqHaW25YkyCGzf5Ec73bkWryInbUS9dKjEyy5r+p/J+WUab2qkqu
	IeI9MNGDKdmu4R7oEgV3HgVuFKOKYac27N8a9WLYI+G6jkNqU9iCRnho43uVfJJN
	agWjokVS7KYiLN9HC/YgwSi5E5iNAt7Kfkr+daUeehjSwf5W8MbC03kgeQ5aQKdH
	1WauwDX5NNr44+fwWvKAiA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4h28qyp0tt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 18:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1790990629; bh=0QJuTfuHadbiBymFUJmXbyEVHq8KzlSC2JTyTzNEnBM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Otn8EfGK9u4yvhStafKtae9VgrY3gJx8KsuNNhJbsnQcvokpUIl6SyKHDfXWo1XuQ
	 F5smc8+G3Ymh9t6QihherFUvDfaL85zuCsZQyClGIKNBmrsUF68C7RlVwlBYimsU/0
	 IdLnZIqg7vDNN3aH13ZZe+KwyorSVLulL1hOn4z/f9OVoMk3Psy4b4qT88nW9zB3P5
	 n9SlvOvKxXbkdyKCaD4Do0dAqVrcRjGB1ulECpjrU9ZnV9YJBMcYVAzs5u8bQrXeHM
	 PwRktjefFYO56t0oHlMcCGL3sJUdu16eSFTjzm0Z1DC/73BO7Db+hVpyvAloYtRtNf
	 u272WMnZ0+9Rw==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BCF8440142;
	Sat,  3 Oct 2026 01:23:48 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 76180A00C3;
	Sat,  3 Oct 2026 01:23:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=dNk1Asol;
	dkim-atps=neutral
Received: from SN1PR07CU001.outbound.protection.outlook.com (mail-sn1pr07cu00104.outbound.protection.outlook.com [40.93.14.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2887E4011D;
	Sat,  3 Oct 2026 01:23:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRaFB0Iy1XL9senROry8Py5NI3f3R4urrNS1bow2uhOTEt2ArsdVR5/tYotRhAhw031VAGUmfEvaTX8Zfx+hPIzYUBNCGbgPp+/LLQD3IN8lWq1DSlV0vOCb57x8axlBiEfyR6ZoQ90L1W+YconB8ZAWNIlUYNUrACu/nu0kmsc8Lu+FKsgl1FHlJCI8ngUSRai4NqxPaPGL3NyRcLU4N/7lkJ8AbLy9hz2Ipg5wAdmerjVC6xJtYXKJulh5qC2dLMcAK2wm3YyQK6wbRtW3tScDlPKAEV6QGnd8Grq6NBwqyujlurCxvqyGj43HaLaUBCyizaquq7oseGUjECN7Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QJuTfuHadbiBymFUJmXbyEVHq8KzlSC2JTyTzNEnBM=;
 b=LHhRFJaiJx/7AJRAEiDwyH54nm5LW61I4KceDQY0CcUrNhJkEPFNrhvUQrkp2beD4uk6nvKjPhLZu9sukE3FuoXYTm8IQasL5TjtBZLSM14Jx2UiKbL/Sclh+2PU1kHoirN9SrJk09+23DFfT7Y7Ac2kOSN22/nm8P7VsgqSMlOxKzMgQ1EjN5lGJR1ZPFuqmz/6h7UuUfm7SXA4eB1KYrsou7Ayy1Zw17h2TknjQ2Os6avPDGhj81x5uEIOhvAhVFnPXz+bgn1stDeNqW/69SUIia/3HVKcI/wIzH0GDeN0UU+sIVa/5pyz5lYazY5WJY4LG6TC7+qt8v9Sldrm+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QJuTfuHadbiBymFUJmXbyEVHq8KzlSC2JTyTzNEnBM=;
 b=dNk1AsolPOPBsGyjW6rO850P41W0WzvsW90gctsAxUckSaE/dpKa3vOGWxJAjcKBl3tYJzOXsnsfB8P7Bh3HHjOHMobGmT10QQH1XOmTh3mQQj2SmZlQrQLLRZ204V+1voOYyCvpRLP15xphvSsQtjv1gC/6Lp8VBFr1ICzB5HQ=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by PH7PR12MB6833.namprd12.prod.outlook.com (2603:10b6:510:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Sat, 3 Oct
 2026 01:23:42 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 01:23:42 +0000
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
Subject: Re: [PATCH v4 4/4] usb: dwc3: Notify XHCI core of tunneled status
Thread-Topic: [PATCH v4 4/4] usb: dwc3: Notify XHCI core of tunneled status
Thread-Index: AQHdUCrvvRd35DDQNUWg3whG8c09mbbrCyCA
Date: Sat, 3 Oct 2026 01:23:42 +0000
Message-ID: <asBMw-j0fxVLVW5Q@vbox>
References:
 <20260929-topic-dwc3_tunneling_state-v4-0-63e296346d57@oss.qualcomm.com>
 <20260929-topic-dwc3_tunneling_state-v4-4-63e296346d57@oss.qualcomm.com>
In-Reply-To:
 <20260929-topic-dwc3_tunneling_state-v4-4-63e296346d57@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|PH7PR12MB6833:EE_
x-ms-office365-filtering-correlation-id: e5ebcf4e-30bd-4134-e529-08df20ecf63e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|7416014|56012099006|10067099003|6133799003|4143699003|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 AxlCV4JIocw0B8NTAv2uKLZxOQUak50aNQTfifFfF7GImiVORupJZrY11hSmvumX5pnA3j7KbIzpl2a2ps+7PtnacVQtUU0dgdBaDxu62lIV8QvWtRoajbJ65K8F6jyCZUWOQHYcCdRlDBq6J0shBw0biGWD3xSH9EwzQqU0QroA0IdpJgOPCRN41/ePgD5nbX35tHKDy9nAqEg1AM10GlSN8tEc2PcrODHG2owuSYDAcDQiHdrzRJwYC1H/i+lAc1B+8RidypELNyVhoQtuUbUwpiZKYvsla61WEpKm2KFlmi76W/DVLnC0PISr25E+iyGTeTzKxWS+lkX3OrHVr8RPzM858HE6fWdEDMBz7SGtQ2dWyGLxhSL6WcM5Nd6gqeQ1GqODU2vWS7dNOWh5IUq67xZPeCbC5+6lFOQI9Lv4pS6MSwxIj7qoxsT0wHT5oMxm4n56ZDdt1ik81QF4Hr08IdUv9PZHEmr6pg53poBZX1U5UXLvfXM3u4906kcThzOUR9c4o9OwqU6UErIcLl0sa3KGaBn/pCW5duEGqdQ/e2W5uhAA64xa/V6mLznIMDQFKYAuxK+KHv3dVk8rdjMXKZzLAieCC74E04Kq45Lucw4QhEWrgg5IeeFRUVCnoMfKR1KoboTFGmKln2KZoQCfOa+jJYxr0cPEKLhTvF9rp6Uy6/IyDX3BupziLz9L3JutIeSzNTv09sLCHGgUYVe+hjscNMB7lDiAXAWAFAU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(7416014)(56012099006)(10067099003)(6133799003)(4143699003)(11063799006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dEs1T1QvVkJHOUV0anlEdkladzljNXZsT3lwanhUdW83bUYyaGtMSHJwc0F4?=
 =?utf-8?B?Y0Z0YWV4NWVwT0FPUGRXNWgwZlo1eDh5c0hrbk9obGhhbmIvMzVtSFRIU0Jr?=
 =?utf-8?B?WVN6anNNQTdyY0hVcFM3bzM0eHVxeDRjeWZhYkordEdwQ1ZYUGZiUmVVemtH?=
 =?utf-8?B?Si9qajZkTm1YanNqVG5JWWN1ckRlTTRLZmlScHFKQTcvNjY3REN5VHllcFZa?=
 =?utf-8?B?bVVpbmYzNjNxc0dVcCtBZVJhYVZYUSs0TWQyTklCeGI3R1N4K1MrbFovdkti?=
 =?utf-8?B?YlBHbDM0Q0xOY25sRHk3UzZtMTJIMEJEU2haUWZmVkFpakhUeW1jeTEzcVNR?=
 =?utf-8?B?OWVOTEQxRjVrUXBrSVFuRmRaNUVFWndxeURIUXRSamorQ0I4eVkvOEptcUFa?=
 =?utf-8?B?cHR4NXd4VW5SaTcxNDdQSnB1UU9mNDBFNzhKdUhGcnBnZlhRQ3pudEJOSFR5?=
 =?utf-8?B?bDRwV2o2WHdFQmZWanRXQTNrMDY1NUxtVTlkVExXbDJYTDJVR2JtMlNGTHN4?=
 =?utf-8?B?bG4zU3F5eGZvMXc3SzlXS2tUKzZtTkJLOE8reTVwZmtkeTI4SW9QdHRnVVFZ?=
 =?utf-8?B?ZVhOenFzYVgrR1FBNzRDYjdDOENJTVEyMEF1eENRSUJlT1F6WTBKeFpUZ25z?=
 =?utf-8?B?ajlQK2p3ZFJCVUdFdVFKNHZNOXI0SGg4NTE1cmxCNHJKdFBVNUE1S0hRZEtS?=
 =?utf-8?B?eSt0ZXBKcStBbytkZ0RiVHU1LzY5eWtRODdXT0xlYTFhRmQydlNoNVlHdkdx?=
 =?utf-8?B?bWZFdG5FRE9iSldYaFkyc3N2RGdpMFB4a21naDRzbkZlSnFIK0FiaGJCTjBH?=
 =?utf-8?B?d1NqUWhobDlmSk9yVkw2eEFWb0hDemhWN3NkVUxWMjUxNGhlSDgxT3VGMnM1?=
 =?utf-8?B?NU9Fb1I1eGgwTmdKRXZZWVF5aCtLUVR4V1JkbzlxcEpDOVcxeGROZDV6LzZh?=
 =?utf-8?B?UmFPM0RvM0dBclhrNjZ5NVJvVm9CTytPUjE2VHloUGc1U1EySVBDVHlySVEy?=
 =?utf-8?B?dFRQb25MRnRkdkFUSlRYSVVQQkxhSlVkU2JaSkJFQW13cURCSlJUaVVDVjdr?=
 =?utf-8?B?Sm1TaUxldnhER1NlcXlVWlNJNkx0OSs5YXhiRXpuL3NtS2RZMDQvYzFNRy9k?=
 =?utf-8?B?Si9NVHpxUHhCUkx4M3NjWStScG9BYjRjdXRBbU1iZnB2aDc0eTRpUjJpUmVN?=
 =?utf-8?B?aG1qSUdmUmpBQXBHb05Cbzk3Y1ppb0JGUHhuNlArcXR4SExnT2NoUVZHYXEr?=
 =?utf-8?B?dFVPN1RyU2cvNTBUVk41Yk8xT2ZpQ1drbURiM2xZS1hqMFlycFNEWW9mUmw0?=
 =?utf-8?B?NGVhZ0NTaXJ0dCthZDNGY0tnNHNURVR3SExTTW5renUvakhmZDduekpxRjY0?=
 =?utf-8?B?c1pJb29ZaVB0WE9mUVNJdFJVSlBKMHJOTkFzS1hxKzRCUnZjQXpZcW1VQW9s?=
 =?utf-8?B?SitmTDRFa3ZmZzUxUEN6K1A2azdjaDZ0VlBSbi9nS25rV0NZaXBUWUJIS3p6?=
 =?utf-8?B?UFQ4UHZuZnV1YXR0U3pzTHVjamh4SndoeE9teVMvZitmSG9sUzBnQnJlWWZ3?=
 =?utf-8?B?d2NydG1ISXRoUlVONVhtV2E3OWFPdEhhL0JIYUtId20rQ3NzcFU5Q2F5U1B3?=
 =?utf-8?B?L2V2cE1HUktjaUNDM2VRV3RNaVhodUtXMGFvcDJubGFjWmt3UENwc1REYUJa?=
 =?utf-8?B?WlpIQTlyWU9pM2N3WUZXTi9wQlduUEJHeEx2VXhJVUx2RkxjT2xSdGI5UEts?=
 =?utf-8?B?SGpQbVo4OHpIdU96aFppRThtRW9zZCtIMTBlR0FLM2FlVnp6dkE4YjRyYVlu?=
 =?utf-8?B?V3o3NXBJNFZqRFlPcWV2dHZINEN3YkNadmlsOCs4TmRpQ004TzZzVkNnWEJV?=
 =?utf-8?B?djBJd2F5WHlVdXZWWHVNbERoQkduUXgvNFhYb3NoNFhlemQyaDdabDMxbXo5?=
 =?utf-8?B?M3FJR0cvSTJNTVN1VG1IRzBGUExYNWRRcXBPTHVwVXNzYkRRM2EvYTMyMnNy?=
 =?utf-8?B?NjI1aFYraGkxRVZGM2Z6WS90UGVab0JZZGUwdHd3eUtMbktIT2luNUZOdHQy?=
 =?utf-8?B?cnVXUzdrYzViZ2YvdE8vTnlPdGRmQ1IvUU9KWjNLUWMwcnpML3RaSmVESVlS?=
 =?utf-8?B?N04vMUJhY2xoTEVKa1FqZ3JhTzdJbFMwWTBYc2dpVGhQSDlJL0RUMnA3VXNJ?=
 =?utf-8?B?RUhZRHpEVUVQTDBLMFdNNHlQOHdpQXMyMlZBWURUeUY5b0tPZEgxYnBDQUZM?=
 =?utf-8?B?cW12QUJiWmtvb0FQVXhBN3BaRS9oWHZKZ1RwYldvSVZNNGszWVphV3ZvT0VX?=
 =?utf-8?B?UytxSzdnVEtXZ1owekpoYlgraVF0a2VGM2E5N3M3ZHFOZlRhQmdMZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E50077C5E8B3BA40AA11E8D17B5E2894@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	sGyEZLFoC+x2bpm6JIDC8RBM+UFQwMOnuKEggrjEa6ErFnVF+caOM4WyjwZw+aeZAGmF4AW0ResNDVtwhroM3I4dnHV8BKG/tUmLOzgyOsOKVgwJ8CpV5CjOqPc1+0dXXjerGLMFlBbmsoxiiyfX6V4trliC9Mm6BSfD+pvwDjUwsK+CWLHapQrEeuHhaOV3r0Owvu17GhygyuApF2ih5B4wT4Wif9OHtAjS45YqB2HkolcM06yjaYQEzjeVIEXXMLCMKH59MHEKr5FJKUny8WxalkQCkWhRq2BW0ToFUqpsETQJfxV/MG1V2PKru1JcCb2JrRe1znUf2uCW4FtYyA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	x2JFVlyD68cs20GWXcpRoOTA9LjSv/DpnK5XsSyKCgvgMS7PfJ5469a+wESIq74LzPQjQgdCrdfl62r1mbxNf1AdJxA0L+rQg/KQn1GGc1PbQIffwr6Oaer/XcqsGwAruEE/WxeDLI+a40I+07bBkYZVIkhC7eae8RXtwAqlZNZXcIObzhJDDrAzIGMFcAW1IG9rC5BVyZ6kiTMOx5qE70upiOHecmVKfFQbirInOuPvCpTww2xlGIRK1BlHwesiuyhtDaM/14zWtvZsMWE3kGYCxazVC09P0/cSxHvHyGQQVsCTUv2pWkYLLn52+2FiPx/EVvZpns1L+5r7uc0VPIY4QLtxK3G26uM4B6SK68JjdL8j/rhM7wpE771xHaE0rhiK+7cRrZGzG7KbNG3WpY2I/cl76Rs4WN9QhB0Opg+MZcNPAHdYqNIWKK1iz7FeiO7rhHuceJK5841V5U8vZfYd6YmtIxGMKINdgygkttsJZSlaq/pQBd/rpdYqR2eDQOGcMDUH6i2I6+ztfK7ixEcvXK9Msqv1ydyfs+9ytGbHB11Egd0x4eW+Mm03b+y1mCnrP3jZCWpW/hrSzdN0fuZ+Ld4nQbNHufuBidwZGovuCx6xu0m/P0CJBAimLfy1Kx47NdXpBFtRK7RpQ+NUDw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ebcf4e-30bd-4134-e529-08df20ecf63e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2026 01:23:42.5423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3poX7avJWp4mNKwv0BEsCvi4bkoB70uSSsJcDrzu7BQw7clToLXcLlwEXk54aDPWriRQv0BfQotEAyU2BXWgaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6833
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwNSBTYWx0ZWRfX2wD6cFtILRoY
 ULXweISQrwCPZYhCZSPWb2MI2bu1qnnxuWFI0S9AbhT4CzwKcdT50RX9MB0v8sbo/0chK40mZC5
 ADGBvDP+K5bMAyAoHmSwO0/tgTcru5I=
X-Proofpoint-ORIG-GUID: goINj47CDdZca419-Xa8ZPthFI0b_kD8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwNSBTYWx0ZWRfX7gdhj93/gT2N
 4RTZDUhw8yXdSrI41YsYpzwkvs1d2YFPqt+IZJCioaCUq7PgnqaKIX9J7RTyKoQAWBeueJwyCXl
 xjDlyTm6nz+BBX5uwpZfIUm5cixF7HLjP0OrMbcbhmBAzpLsecEAKiDFGSGMCvxxCq4AyIBuTXQ
 lChiT5LlddF96myA85OUK2CRaY46XsQQctkE0F8lhLRlV9OQeyP9DeUwuYJAZmk37K4GzW9eTmf
 mKp+YQCR5WuSBZVUKG1I4vdzC8IP5/Xp+5IELx9+BXGLbc0P11w4JYa/RRlORxSNj0AugOkI/1U
 iYbF246/qEuWrLONqS+MKWFA4gqyh4aQSHmR6zkqD8e4xbsVTfD1fY9EmmpNDXY0PKqYsaKuNWu
 cJBsgies/Fha9bgVqJfe6I9fviKcA4GlF7lXC/9L5nC0MsO5oi16TwJC9v7nzRk9BAml5n1zY6H
 ubGPu3xM8vR4f1mY1Og==
X-Authority-Analysis: v=2.4 cv=Vrm2kO2n c=1 sm=1 tr=0 ts=6ac05926 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=EUspDBNiAAAA:8 a=zijEunHL2rleb8swGVQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: goINj47CDdZca419-Xa8ZPthFI0b_kD8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2610030005

T24gVHVlLCBTZXAgMjksIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+IEZyb206IEtvbnJh
ZCBEeWJjaW8gPGtvbnJhZC5keWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4NCj4gDQo+IFRoZSBUaHVu
ZGVyYm9sdCBmcmFtZXdvcmsgcmVsaWVzIG9uIHRoZSBVU0IgY29yZSB0byBjcmVhdGUgZGV2aWNl
IGxpbmtzDQo+IGZvciB0dW5uZWxlZCBwb3J0cywgc28gdGhhdCB0aGUgVVNCMyBjb250cm9sbGVy
IGlzIG9ubHkga2VwdA0KPiBydW50aW1lLXJlc3VtZWQgZm9yIHRoZSBkdXJhdGlvbiBvZiB0aGUg
dHVubmVsaW5nLiBUaGlzIGRlcGVuZHMgb24NCj4gZmlyc3Qga25vd2luZyB3aGV0aGVyIGEgY29u
bmVjdGlvbiBpcyB0dW5uZWxlZCBvciBuYXRpdmUuDQo+IA0KPiBBZGQgdGhlIGxvZ2ljIHRvIGhh
bmRsZSB0aGF0IGZvciBEV0MzIGNvbnRyb2xsZXJzLg0KPiANCj4gQXNzaXN0ZWQtYnk6IExMTQ0K
PiBTaWduZWQtb2ZmLWJ5OiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHliY2lvQG9zcy5xdWFsY29t
bS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgfCAxOCArKysrKysrKysr
KysrKysrKysNCj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5oIHwgMTggKysrKysrKysrKysrKysr
KysrDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2hvc3QuYyB8IDE0ICsrKysrKysrKysrKysrDQo+ICAz
IGZpbGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9kd2MzL2NvcmUuYyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+IGluZGV4IGZk
NWMyY2QzNmM1OS4uNGViNDMwZjU4OTgzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2Mz
L2NvcmUuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiBAQCAtMTYyLDYgKzE2
MiwyNCBAQCB2b2lkIGR3YzNfc2V0X3BydGNhcChzdHJ1Y3QgZHdjMyAqZHdjLCB1MzIgbW9kZSwg
Ym9vbCBpZ25vcmVfc3VzcGh5KQ0KPiAgfQ0KPiAgRVhQT1JUX1NZTUJPTF9HUEwoZHdjM19zZXRf
cHJ0Y2FwKTsNCj4gIA0KPiArI2lmIElTX0VOQUJMRUQoQ09ORklHX1VTQl9EV0MzX0hPU1QpIHx8
IElTX0VOQUJMRUQoQ09ORklHX1VTQl9EV0MzX0RVQUxfUk9MRSkNCg0KTW92ZSB0aGlzIGZ1bmN0
aW9uIHRvIGhvc3QuYyBpbnN0ZWFkIG9mIGNvcmUuYywgZHJvcCB0aGUgZ3VhcmRzLCBhbmQNCm1h
a2UgaXQgc3RhdGljLg0KDQo+ICtlbnVtIHVzYl9saW5rX3R1bm5lbF9tb2RlIGR3YzNfbGlua190
dW5uZWxfbW9kZShzdHJ1Y3QgZHdjMyAqZHdjLCB1OCBwb3J0KQ0KPiArew0KDQpNYXliZSBhbHNv
IGFkZCBhIGNoZWNrIGlmIChwb3J0ID49IGR3Yy0+bnVtX3VzYjNfcG9ydHMpIGFuZCByZXR1cm4N
ClVTQl9MSU5LX1VOS05PV04/DQoNCj4gKwkvKiBQcmlvciB2ZXJzaW9ucyBoYWQgbm8gQ0lPIHN1
cHBvcnQgKi8NCj4gKwlpZiAoIURXQzNfVkVSX0lTX1dJVEhJTihEV0MzMSwgMTkxQSwgQU5ZKSkN
Cj4gKwkJcmV0dXJuIFVTQl9MSU5LX1VOS05PV047DQoNClJlZ2FyZGluZyB5b3VyIGNvdmVyIGxl
dHRlciBxdWVzdGlvbiBhYm91dCBDSU8gZm9yIG90aGVyIElQcy4gV2UgY2FuDQpsZWF2ZSB0aGF0
IGZvciBsYXRlciB3aGVuIHdlIG5lZWQgdG8gbWFrZSBhbiB1cGRhdGUuDQoNCj4gKw0KPiArCS8q
IE5vdCBhbGwgRFdDMyBpbnN0YW5jZXMgaGF2ZSBDSU8gSFcsIHRydXN0IHRoZSBwbGF0Zm9ybSBm
aXJtd2FyZSAqLw0KPiArCWlmICghZGV2aWNlX3Byb3BlcnR5X3ByZXNlbnQoZHdjLT5kZXYsICJ1
c2I0LWhvc3QtaW50ZXJmYWNlIikpDQoNCkNhbiB3ZSBwYXNzIHRoaXMgYXMgYSBkd2MzIHByb3Bl
cnR5IGZyb20geW91ciBnbHVlIGRyaXZlciBpbnN0ZWFkLA0KaW5mZXJyZWQgZnJvbSB0aGUgY29t
cGF0aWJsZSBzdHJpbmc/IChpZS4gYWRkIGR3Yy0+aGFzX2NpbykNCg0KU28gd2UgY2FuIHJlbW92
ZSB0aGUgRFQgZGVwZW5kZW5jeS4NCg0KPiArCQlyZXR1cm4gVVNCX0xJTktfVU5LTk9XTjsNCj4g
Kw0KPiArCWlmIChkd2MzX3JlYWRsKGR3YywgRFdDM19DSU9DVFJMKHBvcnQpKSAmIERXQzNfQ0lP
Q1RSTF9DSU9fRU4pDQo+ICsJCXJldHVybiBVU0JfTElOS19UVU5ORUxFRDsNCj4gKw0KPiArCXJl
dHVybiBVU0JfTElOS19OQVRJVkU7DQo+ICt9DQo+ICsjZW5kaWYNCj4gKw0KPiAgc3RhdGljIHZv
aWQgX19kd2MzX3NldF9tb2RlKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykNCj4gIHsNCj4gIAlz
dHJ1Y3QgZHdjMyAqZHdjID0gd29ya190b19kd2Mod29yayk7DQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9kd2MzL2NvcmUuaCBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+IGluZGV4IDYw
OGRhZWI3ZWYxMC4uZGVjYzUxY2Q2NTA1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2Mz
L2NvcmUuaA0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBAQCAtMTc5LDYgKzE3
OSwxMSBAQA0KPiAgI2RlZmluZSBEV0MzX09FVlRFTgkJMHhjYzBDDQo+ICAjZGVmaW5lIERXQzNf
T1NUUwkJMHhjYzEwDQo+ICANCj4gKy8qIENJTyByZWdzICovDQo+ICsjZGVmaW5lIERXQzNfQ0lP
X0JBU0UobikJKDB4Y2QyMCArICgobikgKiAweDMwKSkNCj4gKyNkZWZpbmUgRFdDM19DSU9DVFJM
KG4pCQkoRFdDM19DSU9fQkFTRShuKSArIDB4MDApDQo+ICsjZGVmaW5lIERXQzNfQ0lPQ1RSTF9D
SU9fRU4JQklUKDApDQo+ICsNCj4gICNkZWZpbmUgRFdDM19MTFVDVEwobikJCSgweGQwMjQgKyAo
KG4pICogMHg4MCkpDQo+ICANCj4gIC8qIEJpdCBmaWVsZHMgKi8NCj4gQEAgLTEzMTQsNiArMTMx
OSw3IEBAIHN0cnVjdCBkd2MzIHsNCj4gICNkZWZpbmUgRFdDMzFfUkVWSVNJT05fMTcwQQkweDMx
MzczMDJhDQo+ICAjZGVmaW5lIERXQzMxX1JFVklTSU9OXzE4MEEJMHgzMTM4MzAyYQ0KPiAgI2Rl
ZmluZSBEV0MzMV9SRVZJU0lPTl8xOTBBCTB4MzEzOTMwMmENCj4gKyNkZWZpbmUgRFdDMzFfUkVW
SVNJT05fMTkxQQkweDMxMzkzMTJhDQo+ICAjZGVmaW5lIERXQzMxX1JFVklTSU9OXzIwMEEJMHgz
MjMwMzAyYQ0KPiAgDQo+ICAjZGVmaW5lIERXQzMyX1JFVklTSU9OX0FOWQkweDANCj4gQEAgLTE2
NTgsMTEgKzE2NjQsMjMgQEAgc3RhdGljIGlubGluZSB2b2lkIGR3YzNfcHJlX3J1bl9zdG9wKHN0
cnVjdCBkd2MzICpkd2MsIGJvb2wgaXNfb24pDQo+ICAjaWYgSVNfRU5BQkxFRChDT05GSUdfVVNC
X0RXQzNfSE9TVCkgfHwgSVNfRU5BQkxFRChDT05GSUdfVVNCX0RXQzNfRFVBTF9ST0xFKQ0KPiAg
aW50IGR3YzNfaG9zdF9pbml0KHN0cnVjdCBkd2MzICpkd2MpOw0KPiAgdm9pZCBkd2MzX2hvc3Rf
ZXhpdChzdHJ1Y3QgZHdjMyAqZHdjKTsNCj4gKw0KPiArLyoqDQo+ICsgKiBkd2MzX2xpbmtfdHVu
bmVsX21vZGUgLSBDaGVjayB3aGV0aGVyIHRoZSBsaW5rIGlzIHR1bm5lbGVkIG92ZXIgVEJUL1VT
QjQNCj4gKyAqIEBkd2M6IFBvaW50ZXIgdG8gRFdDMyBjb250cm9sbGVyIGNvbnRleHQNCj4gKyAq
IEBwb3J0OiAwLWJhc2VkIHBvcnQgaW5kZXgNCj4gKyAqDQo+ICsgKiBSZXR1cm5zOiBVU0JfTElO
S19UVU5ORUxFRCBpZiB0dW5uZWxlZCwgVVNCX0xJTktfTkFUSVZFIGlmIG5vdCwgb3INCj4gKyAq
ICAgICAgICAgIHdoZW4gdGhlIGNvbnRyb2xsZXIgZG9lcyBub3QgaGF2ZSBVU0I0IGNhcGFiaWxp
dGllcy4NCg0KRG8gd2UgbmVlZCB0byBkZXNjcmliZSB0aGUgVVNCX0xJTktfVU5LTk9XTiBjYXNl
Pw0KDQpUaGFua3MsDQpUaGluaA==
