Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B884025D53B;
	Fri,  4 Sep 2026 23:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788562944; cv=fail; b=WhwbGSPye7qh419zLscEwnimJm3vyim/q+lXzd5V++uUtKme14EIUDfQVZA/z1Zmt9SP6hjrqXRPBngTFiGxPYZlHagdAm+9ysnY/ZCbvtlPeHG6i7EQ1GP/Wc+gM/zQWXOntupkiER0H7U1vaQo6AQS1pwsbjWZzhve2NelXRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788562944; c=relaxed/simple;
	bh=WC7Lr0w54aBOHNA4SJ12xgLFZpnTS/Q5mxqRNN0DVD8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ikq4G/0VONeY9iGP3Xj3v6uSNtI46XdfpK4IxogHhUpzuCHNxtiyXKTFVG93pKgdsqDEbQtX41h2yu74gLCPkk5UUuPYmZnJjXT0hl/w5TUJnoZN/sHkiyqv93oMf5kGOJQkMlzQHENcCv4Smo/5eyB8JiQjcIuXY8RrK6wtmJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=rmE+H94N; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cYSwoUvX; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=lvMVB8UJ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rmE+H94N";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cYSwoUvX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lvMVB8UJ"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684Kd0xi3795082;
	Fri, 4 Sep 2026 16:02:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=WC7Lr0w54aBOHNA4SJ12xgLFZpnTS/Q5mxqRNN0DVD8=; b=
	rmE+H94Nox02jbr1JigT9Yo8+nMQ/djPquIOQQeGC5if/qa9SDoremFe3CCGyhl5
	2TH6+TVM9B9A3Lomi+hrwmfqnHI3lsiAkLET+Xq02M8RmbzF+YwWQI33lSckSJhh
	CmzQ0o4+apN/QKOQflbQvfb3nHIwPfuDmLDzgV7I47Ki/fFZlRNFnTXQ7tFu2kOB
	Np2K5REMdiNRPb35uad1qRJuBpRY4xZZVxmPi5c0QkM/F50XEamcr7zOIw2J/POj
	X5UYIbO4ccvHS6qL/5pGFGndVXBtg+Apat9lFa84M2qy0mgy9XqXmrQ6K4FMy7XU
	TFcQ+RdJ//LrAMgE8eeZMQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4gg076btqa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 16:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1788562934; bh=WC7Lr0w54aBOHNA4SJ12xgLFZpnTS/Q5mxqRNN0DVD8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=cYSwoUvXt0SvWjZNFu1s465Ffect9Bd8R+hC5wyAYjSxn56eAyYtfUExwg7u06eHt
	 Ep1QEUpv72WxdV7VeyBnLIObfWN7leEET6bfTTqVs8SDhAnRptUF8MNmHnZvIh+90f
	 s7EhDpW+zviIVzWO+0uFA+gUJU79b7JLXofHbJWxO450VMskGXY1MtBgYmJtQqlJWM
	 7WYfCs/HWOH/VwyRDYYWw9ZLE/PFUFhmXxmHOCmiOE0GrZmHpBHHSuFS2avIZMLBMP
	 YQz4krjbJwTn+P/9l2AtI9oagI2NvCqmWcJZyVwAmVyNnjT5uTM2D48o+yfnFqnhG3
	 RItQSAkBSHG1A==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 92117401E0;
	Fri,  4 Sep 2026 23:02:12 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 5F6DFA0087;
	Fri,  4 Sep 2026 23:02:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=lvMVB8UJ;
	dkim-atps=neutral
Received: from CY3PR08CU001.outbound.protection.outlook.com (mail-cy3pr08cu00103.outbound.protection.outlook.com [40.93.6.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id D0C8040115;
	Fri,  4 Sep 2026 23:02:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVT01j+oC42nH7GmSaOgKoNPdG1/SAxVK5iPKi5TCABtQ1QQp1yiPGm9uGzkYb8wnDaK204ZDeLpmfU+dMnmDgbZcFrAA2ZdBfIFHN/bd3aMV8aKgZ8ffLO8HmmUAiagqBahgKt4ryGwQVpZxd0wQ//iVTAcaJX0ZIR+CTSUCH+6TMBqyOU7cV6f7q9iAHFWtP1WWj90ue4mOxgH1vzkKbVgnY8J8mKAtMzKUUz+M2ly4nqGbdhgEryzPuSMfacyEpnHb0p12EOkItSQuULcLABhzYLC4EqqOvMbc0W7d5MrfbSXb1dH+784XTghGim+BI9BZRsyL4Gx8hSGPPZx6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WC7Lr0w54aBOHNA4SJ12xgLFZpnTS/Q5mxqRNN0DVD8=;
 b=fRwtvdNXQRgZ0NK1dhahECmIFo+0rPPtPD5ewN007QTw2ZtD1it+Ig3moJmDHtUT0fyQx04ku6FjeLN1wB0goM8s5rXpCifbjojFC+FHU3X5Xzua6RBW6LB+gJZGzQ84U0C9GA158a+Uy+7FV3I2HXSaIKIoA/otS2ys394gsdQ3O4SvhWqfpOXuO64vETgv7E2974tTeeXmnG+jEnI+RkXBsZg+9Voco66SyeO0YFAkWYV8jWblMNTRoYZsQh9HVY5zk9MQvyxNX1+UNl4fDiaCS7JXtZx4ywxiJm9M6ihtsqCqOcKsvg4Xyw5j1eD2qZD9urnK/hTTiYSKD2G28A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WC7Lr0w54aBOHNA4SJ12xgLFZpnTS/Q5mxqRNN0DVD8=;
 b=lvMVB8UJXKJeXGI8FqgYx6EsFvGnnvzrEu2r1SHgtN4RzUr8+HeAXjC7sc0y+E075bEGEgZ0rSIFnfgUsKod5l+WOsZmXivhSHLqB00/tl+ScrJxKsMY8iGDJu9FJZnXlih1JD40Bej2S3+R/8N5EzeMq77PdVrP9+9EoE4fcbE=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by CH1PR12MB9669.namprd12.prod.outlook.com (2603:10b6:610:2af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 23:02:05 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 23:02:05 +0000
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
Subject: Re: [PATCH v6 3/5] phy: snps-eusb2: Set phy type to EUSB2
Thread-Topic: [PATCH v6 3/5] phy: snps-eusb2: Set phy type to EUSB2
Thread-Index: AQHdNXza+n2T9nQLsUmBRNz4oXMVCLa/F9SA
Date: Fri, 4 Sep 2026 23:02:05 +0000
Message-ID: <aptN1pnb0aOZtroo@vbox>
References: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
 <20260826-eusb2-interrupt-v6-v6-3-ae2601cfa80c@oss.qualcomm.com>
In-Reply-To: <20260826-eusb2-interrupt-v6-v6-3-ae2601cfa80c@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|CH1PR12MB9669:EE_
x-ms-office365-filtering-correlation-id: a6bc5d0f-1d8e-425d-51ba-08df0ad88a21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|38070700021|4143699003|11063799006|10067099003|22082099003|18002099003|56012099006;
x-microsoft-antispam-message-info:
 Er9E2pdmB4MFXpzqRwPhQ7Yrml4TeworsajEIHNSbEzt3uvCF0MXQailswjnAgz+aMb+PrGQ8wYuKseRqAbOXx1vHh5q20s2K9dihvMgu8Q8pUBklBHNihKc34J+pkbFliuW7yHbWnUVONP/DSRXyfLaOPahj8wRUloEo1PYcicsuPH7rvJlkb/wUxttSVfnmvLe05YJAGtngwqS3tljc1TBWPYKoj5jif0/ZYcutkbgihpjyi/HbgPheD7xOiacghosCKq638Nh0piRoUDuEbuozdp6Uw+amLGUNV7KnjeIjGEs9/+c8XvbwPXGKGKLF6e84v7HduJ5ZNfh5IO+gHBquDJGsSKN17DSKXQZbPX0hrcarbsr+76Ea3iuY395jRLbdEqlz62vwTB83ml8+FwoSPYOgVfW7H2tJY0f/LwstL/G221oWIne3EhdwJX7wloUibTsIv7mpSVzMipd4ZvR21fXNngq9zOas3vj9f9n/ByHa5eGFWSKvcxrCAbGINpszmSOXCfscoHLlooHm/HoU1Ke49PgMjR4eevxqbQnsjGSRRt20a6DpEjzdIhoGl3+jBrUDgABsKkI4q2yskCPMvuo8nA5q5w/reaf5vGpS+MAwGzQbRJYHe2ehdINIZktUOufWMBkp5KnYHDlBEJpNHoS787n9CPhji3OUWxaMcUObSe+wM2gD6Bpo4UnqGdkwl8m88HVFiXzXj59RoVsPnGTJlocGXqbxtsqKb4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(38070700021)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bG9zZGYwQnAwaGNReUFDd3dXR1FLaHBXRWNaUk5HS2NZQWlyTmdHR1FhZXF6?=
 =?utf-8?B?MG92U2c4OEZkYWJ4aUZKR05KMVFOcXRwbUpoWCtuSTB0d2E2cW9qSldaL09s?=
 =?utf-8?B?Y0ZKRTAyZmNtK0tBcHRpdlU2THUxZnM0UmZzM3NhdVNTWTgzYVJUMk9GOTBw?=
 =?utf-8?B?ck1mU0F3YzdXU21WQ2JCZjhaR0ZiM1VLSk1Ca1JmVUYwZWNhN3pzMHBPajEx?=
 =?utf-8?B?T2JpS1FtVEdPc3FVUGtkUDNES2plQmZvWDdpbnhwY0ltYno2bzY5bFptc3Fs?=
 =?utf-8?B?T3JveWJyMHorbWJOc09odzM0YWQ1MUhEYkRQRUxUbjljS25yRjBZZUxJS1Q3?=
 =?utf-8?B?OUYvaTM2Ny9TUnVKMG0rMDZsS2VLT2pVd1pQbFNwQjZObG5TZ0gyUTRmMjFy?=
 =?utf-8?B?R0VPbU9KSHRzVFBGRU96UlBIMk5OWk9kYXpTKytqYWVqVDFPYjJiOEhSK2V1?=
 =?utf-8?B?a0FFNUFOMVA0YkxERUNPaU1abHo2eE9DdUwveEQwN2tQODZ5M3orbmFSNWdU?=
 =?utf-8?B?Z3k0T2ZvY2hvQzYrSHAycG85V1hUcWV5SDFDelB3S1I3TDd3aVlPVTNiSWcv?=
 =?utf-8?B?WEIzamJJZWtIMk1pRGQvT2dCTkZtSmxoZFlnWGNtblRZTlhiekwvRU44WWli?=
 =?utf-8?B?blhEUnI5UEQza0E2VDBtczUxQUxhSnhtUTdueFJNdzMyaWJsUEc3SXpyVkVy?=
 =?utf-8?B?MjJBcDY0azZLcHlDZzNzWURwcUdVTS90TEl1OHVNeXRIM2toK2s0MGNtdjBT?=
 =?utf-8?B?UGpnMTBhY2xYYk5ZQW9HaEJrVmthL2Rra1h6MWpMZ1JLa3o4b1pudHBOU2JT?=
 =?utf-8?B?cXpxbkJ6NDFqSEttSUFjMDVHTEdoT0pjU3M0Ly9idnVyeFV1MGtqWW1DcU9M?=
 =?utf-8?B?YmhIV2xBeklvWkg2Tk94ZlJjWFJPWUtlZGdEVnRIVThrbmE3WjZSWkRFWE1E?=
 =?utf-8?B?RHdWd05odjRwbndSVTZnNUdwZDJWeXpmUVFLK1BCdTA1eE9qT0FsWFJmcEZE?=
 =?utf-8?B?VGN4S2xMb04zaXRtQWtVelhwYnJDZjJGQ3hWNWNDbHZGMzI2VU1ueG1iMUx6?=
 =?utf-8?B?cXR1Nm9VbTJLSjFDTlpPYVY4VXhYeW03NVBxU1Q3UlN4K05mZXZxSldON0FO?=
 =?utf-8?B?a3pXRHN0bThEOE9qWWgzUmZoL20zcGhuMkk3ZEdDdWZZYnVZa1p4TUVvcTNB?=
 =?utf-8?B?MDBYWUZQWXlHMzIrZkkzbVRSdy9pQkR6VkpzRitFQU1zZS9HRFdnSkxXOGc0?=
 =?utf-8?B?WHJPaEFjYTYwN3RjbTU1UDV1SzlBL0hCOWlrUzlSVStyeEZLZ1BrbWszb01w?=
 =?utf-8?B?MUhuemZBaHRza3lDWi9PT3FrU05uYkFucGthVE9GdnpQcURGaUhJUnNNbHJy?=
 =?utf-8?B?TC93ZVE2cHRkc1RJMHE0N1lROFRIaGZnZmx1SExCMThzdkFubGZBdEl6SElJ?=
 =?utf-8?B?MU13bEhrSXh0RDhXU0M3aHhVUGR0RkxSOFR3WXg5Y1c1TkUyNDY3NkhjMTlY?=
 =?utf-8?B?WFI3d0U4ZXlRUHM1OUNhSWxMWk5Hcmp2eGRPTmFWb3djWi9aQmQ3cHpOQW8z?=
 =?utf-8?B?M0dMb0U3dUxhNUZ5bjBQZ1MxM0Z2RjZHU2VHc0FmaDJKNno2NVNPSGVLN2tH?=
 =?utf-8?B?NlkwMytJQ0ppa254MUsrVHROMnliZklZVE93WnoydEdTODk3T1QwVG1XOW9s?=
 =?utf-8?B?MEk4azlJRjRHVEhYUU1waTFuWXdSVE1UOHJHUnc5OEpCUUs5OVNrWjVWU2V1?=
 =?utf-8?B?K0F3b3ppSHBWRENjY3hHVlFwQlRaZm5neDVyWkFRTFV4a3JtRG83STlDNG5u?=
 =?utf-8?B?c3ZDQ2tYTVN5RlpnODIxUlFNZlUraGYyV1dvYUtxTWdCY3ZTRnRVWUV3QjAz?=
 =?utf-8?B?ZGdKRlpuOTV3RDREV1FadmxNT1hoRmVFVWRKUnFnU00vaGlCMEdGN2U1ZEVH?=
 =?utf-8?B?K1BpZXRpQXlybTNpd05uWVpvMjVqaXpVVzRxY0RhV2ZScDY5ZnArakRhS05L?=
 =?utf-8?B?V1RlNjE5eGpPUlJyc0JzSFU5U1ZGa2dLeUNHeWhSTU9Dd3NFYjJJdTFmamh0?=
 =?utf-8?B?aDdvMGRVMkovUlpUOTZVOG5JQ3pGS3h0c0tBRUxDVTlQd0V2bzRCUWdnd29w?=
 =?utf-8?B?djR0NVJ3NUdTSjhyaWZOeXJTMFFlenJOUHIvWFpMQkVIVVJnaFFlOGJqOGdl?=
 =?utf-8?B?cVQ2cC9nSEwzSEhYMDZtSnRUUW1vV01TZ1lMTUVBSjBSRWJsemV6b1JicEts?=
 =?utf-8?B?ZUgwQUpFbU16dm93RUxLOWNWOEt2OC9qSTlZaE05ZHhLS2dtNGc0OXpMRE0y?=
 =?utf-8?B?T3dENVRYN3Y2b2o2dDQvOGZRUEhvWTRXZldFcXVEdS9Oem55c29yUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1DDAA7237F898B4FA4868B152B613CF6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	bp1b6UOtyCRASfX+eojF+CqN0E77QBiRBvFg0J1Lhln/3rtIxHIbEsFdrH8M/I6rziSsFcfzUy2OBOIAiDF6uf7704xtXNYaJ99uRJNK+o8Wus1xn4ei9Xe8p0WV6iYboqzcdxvr7WsGxC/WZPlb872s0zaer53MlFVreb/XcOZAt2ele9vlp6fqR5D5ZSEAwQLMzffWbvX6ioc7C31Zo6KzgA52w4T1dye0eijSOvTXPpm6DsW9zmez1ZX5XtjWZAFMw89DxxyzDcSBLEWJ3P5Wgev6v8iv28xfb3+ObInMaZcLu1Gw8jmeks+MhP/hho7mPKVFOLiPtokIQ0Gobw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7fq39RF6KGs7+Q8i/+uQ41tOquaM6tQ8uGcGrL/pQqfcpQYsW1qYEjCxFxAxIb5sr3MM+YhYbyB1dJXQAuabb175qyV8VEkLG5DVZlTqRvkn+uhi9W2oN+HXn7tBUxXiGWh0Pq6vpzKUEwZqz/mSdwH1mJVVnJ06lVOT5E5CzEH06AWjSO8Von03eVMKS+N2LvwM6f9R1CnubLisNng7lKwWrAdhUaPoX1RgHOnYIj9A/i8wkb9D5nQZEjeP/n98fm2lqBoBCLQTGUvDF9EbdvZAsdGUPLSahli/QHgbd5HucW4VLNtFJvwA7/HWjla8vojwg4f2s707uDnLat+C83Yyb3oJJHrgKVqvPmT9QelyqTLrTSp0yXazhgj69NM9jvNqjdl2DOkh0pSG60UfxJ4xjBoxGUrB1Xo4CVlBsuAPTIumt6FwiTuZG8MqYKfZcyLL0DVTOUQviNorc+rJ2xCTpRd5gX2wCCYVp/4c97KiawOrrXAUIJXvISLQGuoUTSerD8Y6Pu4e7n0av4oSsORct/dEo4LIvuduMWmZAzhqnSZZrfbG3JvvpviFQEFtx/lE8LdXI6pu4Gdrb9CuH0eScLrRzPSDdeBir4N6UrF8vOCZ+WO8g/oBcyNX2BPXO2gAk6cOBkg1y6ntk6PX+w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6bc5d0f-1d8e-425d-51ba-08df0ad88a21
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 23:02:05.6279
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 77c5cYkTg2TD01a5HUmRaSPGe+byMFJ53BY7cCRpw79HMGXQDtJQDGKmiuuTOZ6x2nf+vEYU65R42TkDhZQ9aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9669
X-Authority-Analysis: v=2.4 cv=P+cKQCAu c=1 sm=1 tr=0 ts=6a9b4df7 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=7d9xe0nQUoR4MhJgwTUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDIxNCBTYWx0ZWRfX2F6KtLoiS5JL
 HdoGKBPKpN2WzLOyQx3swgYl0yqZ07SVX9e3MlY6UC4z+BHXQQXKXWCcDVhc5JNvkhGG8RcvUrm
 QwNmv9h5yYrIAoH7lD3b/B76Q8Oi1QG0amqqFtDC2h4iDZzl42SxLWaxCYs5F0o3Be+2IZ2wLtE
 ub9fV5gbZ4NW//TOgY0Wvp4X8ues8rH/rr9niy+7RAQedJp0VSbz8Hrgfp0Po4njJ40WUapWt+J
 WILOO6AZSn2m/rj2+hA9NFUqMKip8I3KpIqb7JMoSI3Ruf+/Qc5l7gBZ5sOEKGNwg8E5GnpNBbj
 oxmwmO1D66lynZMxct6pucfJO38zErIM4eqrO0J26IYuPU1u0uZH6W/X87bdZEnfDjKsXYDDwq9
 P+R6a4BajvQpLnbftbUykH/m8n6on1Z34iM0Uu5kRSDZVE8T8JQpnhQsNsZnMIHsbN2Yte7BBv1
 0/hs2rh1n8dkGeMTe/w==
X-Proofpoint-GUID: FhF9JyeINYm3XPMdMi5hkOZnJzQy_jiG
X-Proofpoint-ORIG-GUID: FhF9JyeINYm3XPMdMi5hkOZnJzQy_jiG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDIxNCBTYWx0ZWRfXzibG+OlSH/Vb
 kp8CTj5uaekmtcE49A9Qf2yO9jknnpKlJL+LD3r1AYbAyjMeUzA7MBuiNTlVRargong+ONdUPyt
 EJSLAfeubwH8R70ylsmwyTUU5C553hU=
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
bmEua3VyYXBhdGlAb3NzLnF1YWxjb21tLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3BoeS9waHkt
c25wcy1ldXNiMi5jIHwgMiArKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGh5L3BoeS1zbnBzLWV1c2IyLmMgYi9kcml2ZXJz
L3BoeS9waHktc25wcy1ldXNiMi5jDQo+IGluZGV4IGY5MGJmN2U5NTQ2My4uZmU0Y2U5ZDc1MmY3
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3BoeS9waHktc25wcy1ldXNiMi5jDQo+ICsrKyBiL2Ry
aXZlcnMvcGh5L3BoeS1zbnBzLWV1c2IyLmMNCj4gQEAgLTU5Nyw2ICs1OTcsOCBAQCBzdGF0aWMg
aW50IHNucHNfZXVzYjJfaHNwaHlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikN
Cj4gIAkJcmV0dXJuIFBUUl9FUlIoZ2VuZXJpY19waHkpOw0KPiAgCX0NCj4gIA0KPiArCXBoeV9z
ZXRfdHlwZShnZW5lcmljX3BoeSwgUEhZX1RZUEVfRVVTQjIpOw0KPiArDQo+ICAJZGV2X3NldF9k
cnZkYXRhKGRldiwgcGh5KTsNCj4gIAlwaHlfc2V0X2RydmRhdGEoZ2VuZXJpY19waHksIHBoeSk7
DQo+ICANCj4gDQo+IC0tIA0KPiAyLjM0LjENCj4gDQoNClJldmlld2VkLWJ5OiBUaGluaCBOZ3V5
ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNCkJSLA0KVGhpbmg=
