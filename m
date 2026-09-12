Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3822430C372;
	Sat, 12 Sep 2026 01:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789176289; cv=fail; b=NhNG5RDU+us6nWNcOthOQVnkxYddnTQeHjnNhJ5PhFPgktQWx0ZiZT2iCaWLNnJrHKg5DAyCC+9/RmXpaz7QPb6djhJNlsng7vIeRxpTIR1gI7HLyB27H+xJ+EoASj1Uw+7ZqqsGo+dn2FDQxSqHKfDL90k7Bre027JZp4QtPUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789176289; c=relaxed/simple;
	bh=LPREGgPcFNopxIQHcNl2qDzxX8jpetrBdTgCs9+peuI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N0+b5Tsn1KbqqJiIToAYXP4XUcjDVdwZwuFTMiU+usinQmfMD3V0Z1gBKSnt7F5ZpCpIi0tEQH3Pi94oD7G8t6m7eyGnaqnL5S9JH0+us09mvl2o/6v3svbKIRzNolYWKzlyIQmffl4ZjceZYDpizo55EsC0FTvr1VxUpsw95Kc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=BSvGSoFL; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=AwfO4OoQ; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dfGzD0II reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BSvGSoFL";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AwfO4OoQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dfGzD0II"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68C1JY2X189775;
	Fri, 11 Sep 2026 18:24:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=LPREGgPcFNopxIQHcNl2qDzxX8jpetrBdTgCs9+peuI=; b=
	BSvGSoFLSYRA/k+U2rXMR9KJ59CbjUwVj7z6yhEwCSPmYeeegL6ARiafdg4YCMXg
	qPphp8DDDy0QlivtzbRrZk85aShIWorEXoP1rcZiXQz5wvflurZ3t8GMxrAdE5oE
	0RcGfnFt8QnOaZng2ut5I8BuwV+x2XE71WLTF45FA/KKc2n1D4jgAdOLlErDXFab
	qSpCf8IyDa36oGx0wBakTYURC1Z5dr122RLoSb0yb0/eELVlbtpbTYxlvlB8NRGN
	HdJfYsPKm+HJC2a8HXAmLHK7qda/3Yf3+rFopSEv1OwS7UfJP9gJCgzemhK81xP4
	5pfFTMdcKf/bWOM6pmNcWA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4gmvyrg0fx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 18:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1789176276; bh=LPREGgPcFNopxIQHcNl2qDzxX8jpetrBdTgCs9+peuI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=AwfO4OoQXux+PNj+NsiPn3j4N35+87ID0gdOhE1AkNOdnv+aE2xsh6tL0VDtiwUVo
	 6D6NMGi11l1d2g45XU+MnC9ZY2vb013MwMky3Bp+njkPyuvrc41VHjnw/X0uXSKHq/
	 DbjdLN5oLrCCWxhXwllZ1csEC0tSXgzDewmK4P/c36B6iOJACbYysXwI1rfKx925NU
	 mSmYA2P5jqrPS7aunf9Gb3VIuS5vF6xOPypt8zhA2dcUo48xRFGMQVTLrg0ACQQ5ZQ
	 TliE1Vk8M7FP1oGiyaWCoZGED5KoG43KH6OzNcgRrqu6mhTnKBJQuMcHnv0GCd9XMq
	 7U2Lyk4Zxtn/A==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7610F40136;
	Sat, 12 Sep 2026 01:24:36 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id F0402A0582;
	Sat, 12 Sep 2026 01:24:35 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=dfGzD0II;
	dkim-atps=neutral
Received: from CY3PR08CU001.outbound.protection.outlook.com (mail-cy3pr08cu00106.outbound.protection.outlook.com [40.93.6.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id E17E04017C;
	Sat, 12 Sep 2026 01:24:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9wNIV4LMtOscU1AqhihT15msm7gs7DNH3p53d0SZLwgjhCIS5dD0HbzKU3+71jDnQosgYPytSUfGrXKvIzafPOATXCNAl7cKj6PWPX4IXiOia2Sn9+C9R151/t90DFr2pH0EfFhB4WRJZVtMyjIP9UIUO4CV7vpwz1dHjzSsNxSuQWR1bwSZjNcTioaVBsp58v21kv6boyNgLJ0gK5H4iIibmN1nIIfH5axvpTI7JkXrY4B843hZ4FqIhvbCh6cAsw6o7Co6L9yd1FOFRTMYmfiYS1W2aAkLp47myp+sN4jCutuXeww4NNjiMSHR2bkRFi6BavDmoGEJS0yL8uqRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPREGgPcFNopxIQHcNl2qDzxX8jpetrBdTgCs9+peuI=;
 b=ho2NoeioqhsRGXsch5dUG9mmdZw0C3TPccSsIypq1C4Yo4E8bXR0WTvIJUnBnXvKRY23YkPrECK+PX1bgMzSEsxj3qisv3iOJ5pRwDBALEmaUExKMOB5+mVr5ThY5GysbbZ5sreCybPR71ZtejitOCo/ibfwS8SzVfRVJotWdXV16nvBTGZHSFbc5h7vzABlcsjarn0k3vvwV6DN0PTUeoRNztYECoXrFfocYlRJU4YlJTOIbLpxzwTanyRyZS2x4ZNWrg2cHtVMxGQrZE4wfwiF7YCHp+Ihhr4ThZU7xBj5zDVjZA42HRtdg0HjF4EfvoaAAvdYgRjOwVc4Kj9I/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPREGgPcFNopxIQHcNl2qDzxX8jpetrBdTgCs9+peuI=;
 b=dfGzD0IIodxMfO7KdKzGpLugZcnFL4qxAUFu8AdprgDLZm20qTR0yEyXto7wkrWMDhVdC7znHanXsQiPxmQKKjrez2WZnSnjEKTyvwRU0nOwD/b/EA+Y1x67X10k78ff2emVXs/F3RAG8ILiottWs8XprP44uH63ptQxTVoFEqo=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by IA1PR12MB7712.namprd12.prod.outlook.com (2603:10b6:208:420::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 01:24:30 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 01:24:30 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/7] usb: dwc3: qcom: Support broken suspend for
 SA8255P
Thread-Topic: [PATCH v2 6/7] usb: dwc3: qcom: Support broken suspend for
 SA8255P
Thread-Index: AQHdO7pjiLdy5HkKqUCEUx6/wGdZprbKM3SA
Date: Sat, 12 Sep 2026 01:24:30 +0000
Message-ID: <aqSlItc22hV5XBoY@vbox>
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
 <20260903153827.3463313-7-faisal.hassan@oss.qualcomm.com>
In-Reply-To: <20260903153827.3463313-7-faisal.hassan@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|IA1PR12MB7712:EE_
x-ms-office365-filtering-correlation-id: 01ff8d5d-1235-4221-adc4-08df106c97f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|38070700021|10067099003|11063799006|4143699003|56012099006|5023799004|6133799003;
x-microsoft-antispam-message-info:
 3D1XkyRZqwR0h4J7qjoQIViHG4tuNthyNechtdXqef7oC5PLdNcb8tJCtPB5LflHRBx/jpLIxdhQf2t9Nz3Y3vzl3AEa9KlyDJOGbzOo1FlNdxArw3BWg9/tj9+vHtVPfFp0DrRJBiQk6Pjw6MxA/qnGP5Mrnz/3UYIB9v0RnwfMRyyh7gjJixoEyxErw8n+w022WVtaoRHYxeyhranbM4pbGjPn6kTyKQ8Bf2CuDVnFMldR3RfxivAQP/iS3Gp1UIG2aYxZM1z96YXY6evCioVXw8PFbhLK5aT+Am1fUZrTLof6Y63MwaMC25zLW2e2ytE+RA4yJMkG/N/sS8raF+hhWYGUBH3dZzFkPiK7s3WqlNdOw2t+OVfkzxG4dUsc54KUXLbQoLJk2znD6xSJyXssZkWS7s3R1jliixh/5Am2Q5Olpt9yXlPeXhK5YxAe+6We8zTbOyJbXZSa+AVxWc5QxBQ1Y8MV7I5iGoYtCGGx+IJK+Hme6zz7xgyDh+0V+MkvTiXmo3UXp/CLKPL0PGCSt+/WQiq2Ux8W7Lg1KOIAmiMcdfJYo8ietapiQHkkqAhBVw/qX/SURvfTSfSys1RByIScuccqn1Gnx3FDxCAJlGvgtl52IClJCBHgUelwrur3zu11KD6CCJ1ME4qML1sd58HHyUOM7M5mu4JdzkCM4I/pyw1tqtcGoH1QLlDPmR5sn+DFesB4CQfPSYYsSSe8D+5U7m0qpKe93f+64Zw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(5023799004)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V1g3M2pWc2QxQU9LM2pUZjd2bTgwTkNsTUJkaHJ4OWRyYVBVYjZaTURsTTJv?=
 =?utf-8?B?d1JEcVZQRkdHclh6bUZrZHp5Nm1CaUxEWlJWTGgvZkNRNEM5R1Vwa21aOFI5?=
 =?utf-8?B?TVJuRnBpdVEvU3luV2ZweTZkd2pKa0VXS1BOKzY3a2t4Tk0zeFZ0ZGhDZ3ZR?=
 =?utf-8?B?bGtWTmE4U0VrN3ljTXBjUThNMVFxMVQ3Nm5GY2FnQmVuM2I0MWtwcS9NSlVh?=
 =?utf-8?B?NnVvdkVVbU9GeXhuV015NVJJMklERC9OZkhvdm9DV2dpMGE5S1dVblFhRkV1?=
 =?utf-8?B?cVhjV1pRbVFiejFyemppd1pmRHFzcXkzaFZ1ZnJwME5sUWI4WklQWkxpSzBQ?=
 =?utf-8?B?QTdSdlRGa3llMkdvOWtJZW4zdkVMVm8yUk5ISzhYV0w4S0xnOU9PVE9odGg2?=
 =?utf-8?B?MGVMd0R5eGR1ZHVDdExZQkVSOXlCRmVYQjQ4dmpmbERteXg5Q1htTC9sWnVB?=
 =?utf-8?B?NTJjMk8zMzlPaGhhUWtMeTZ2V2k2d3FsaFl2VFNGWEdtT0dvN1lDRjRteW03?=
 =?utf-8?B?Q01lN0VheUE2cVM4d2ZaN2xFVGFtNnFZekZhcE1oQzZCL1JJeVVESVlsLzFH?=
 =?utf-8?B?QjlaalQyWHBabi9LOE5UQWJTbGY1eG01OE1wbWhmMGswdTFmZUMxall5TG1H?=
 =?utf-8?B?aHIzNzVqUmhpbStEeEFzZGFaTVhVSUd0NVJuN1JXVTc4UHRDQVZ5MUsyVVJh?=
 =?utf-8?B?NTl3SzRtc2t0UXFMMVpNVktianFCcUc1RHoxWjloR2N0cnRxdXBOWUNQaUZ1?=
 =?utf-8?B?SHE0dFV1RW9jYmhCd3pza25RcFBicE4ySzJLRWdkcmM3NzBlK3RWVXhpNXlT?=
 =?utf-8?B?S0pETlNTVVBxa1RTSENHQldieUl0N0QrN1FpRmhDOGdVVzFXMzk1MS96Z2Rn?=
 =?utf-8?B?eUQ4bXlZUkZzdmpYUXpoSGsrcDhucEF1RkR3NWplL2Uwc0daUVVLaTlPVFpQ?=
 =?utf-8?B?ejBYZEpQSFJsQVpLVHgrdDgwU0JMR0dqa3hsVENnUHU3WXRYTnR0a0dvM2Vy?=
 =?utf-8?B?eWFiNFFWNmFiRWE3TWRwMzUwdW1NeUFUT2lLWVBJM2swSUpDSmk1elVxVUhW?=
 =?utf-8?B?V2QyMDBJL3kvaTh0akYrM1NQMjkyU1ZqTEtRaVBhanIyOG1qSjVOOTdpWlJV?=
 =?utf-8?B?MlNwb0JZVmphM3BlSDVVMzlXcHRhZHV0bWlDV1ZlNmVVLzA5N2d5cEExY3BV?=
 =?utf-8?B?cG5nLzE0NXltcms4RDk4MXAvaWZDZnhoTlM0YXNBSHFtZktENWhTUlVlLzhO?=
 =?utf-8?B?K3laUGo3V0sxZTUySjROUk45aWVTVThDcWUwWlorWTIya3RkZy80ZTkzUUIv?=
 =?utf-8?B?b3RGdnRFQXVjNU4rSTE4dTI2azdjazlIODdzNHpDUmRVM2plNkxyK3BGUDhJ?=
 =?utf-8?B?MFBMcEk5ZkFYNkZYc2VoaFF5YStGQ09Na0hTQkxxOUdONEN0ejNDZWd4NnZp?=
 =?utf-8?B?MENWZnVmUm1jTWNoUE5RMG1xU2FCZ203Vkc4YWlJODNsd21vTXowd1VBWFRk?=
 =?utf-8?B?NkZXR3BjUis0djhZWW9sNXRrcndyZzBUY3MrVGVXQnArbUhTczZVK0VVbnVG?=
 =?utf-8?B?c0FUYnQvM1NYSFJQMGZLRmdOeC9zVEN5Vld5Nzd6WlhkbC9hWHpITUFMZzhU?=
 =?utf-8?B?enZtQ3ZGbndMLzBqQW91M3NuMlZHTHdKSTlNTUdpTkxTTk1XNFFDUUNYSkk4?=
 =?utf-8?B?Wk44eFBsbG04Qllya2liV2wvcG5mVkxsdWdEcCt1Y2FDdXdzUWEvMkM3OG5O?=
 =?utf-8?B?V2dQRU5ia3JFU1lCZjJTQTg2QytwL2NjcmhVSDRxeFltR08rNUVjbjEwZkto?=
 =?utf-8?B?eld4S3B5eW9UYTBMa1Y3VVZMRjZIaTAzeUxTMlNBRnVZUWlDMzU1cVZBRmFk?=
 =?utf-8?B?bFJEL0U0bzltUndhYXhWZmF4RHpudWZjM0lmbC9lQlJJaUtiZ25EeGY0dUtw?=
 =?utf-8?B?SFR5Y1N1Sm9aRFRTVWtXSzY2YTkzZXFnOCthSUhTUG5rc2xoZ0lHRldkdkpW?=
 =?utf-8?B?a2FnRDdiSGVDcVpuMVJ2K3psM3lJUmRtdDdPcVM0Z2lmK3N0WU5IMDlrbkpF?=
 =?utf-8?B?SlhHdzlva1VRQnpmdE00b3Q3bWo0YkZ1bDlPbVZ2ejlqc3JReWxqS1E4Qlpv?=
 =?utf-8?B?LzRNWmRXVkc1Q0NSeXg4alpYYStkcEtoM2VYZE1Ba002WGJxQWtnVjVQZzJQ?=
 =?utf-8?B?Szg0SlVEMkhMNjVHRjlaNnlSRXBGZmJNS2hEdlBQeDlQQXJLb3FTcXJPaXdU?=
 =?utf-8?B?MWtWa21qSk9wRHFiMm15N0hnVDJVU1pYK3k2WUJVR2FBREx3SGZKd3hmVyt3?=
 =?utf-8?B?NFVkekFITmthUEZETkppbFE2TVRrN1dKcERnRXpZZGQ4dDZLV1REQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34EE65F16DE5C04BB25C762285991FDE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	0zkJuiUZGlY6CMnZ0xKWbBN29BhiexWHPIsCKtD9J7R60XsyEi0ZQdqDHVpKFv7HEEKqgLW9Hmra67E4W15HnR7SCmkKFeRxNlc+3gtMTLzh1T847RciP5eOWJmaf/a5EkTXiUhvbspttFFjR0YhKUS7Z3oSKPo/u3ou4xeSyTw7+uGF62OTFF/w2v8rFsgzacL7SqXnPau0KHhqy94WuWEhBD519hj8Ay9Sfwrr3UaKdF/e7dZLKaSVis7vNWwP1v+tYpHIBVylxIfxAA0VjKspYYDRqghMxooIHF5RtshnlM0/k1VcJQVYZVswnCcYTA26nVHs3x4X790/Sa7rrA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	G1rrzAjra/6SmKmLs5n/wyjcHxenGsI/C0hZwKhSk38WQsSCTXQHbmubcugXLzwF7KNYgXC+YhDvcn7o/D+xuL2QBzciqqM6FRYVwKNRklwihns+lbyjv4sqh719b6zRKTx9YpSPiUD5rvgfXIEJ5IMOn+trQpQf4L3kRmCw44/oqqdAjXA6FeEBJQrJzm5GU1HsKeXvjWo5nfVTDdbeupLCyMDyD3sXhaZP6fC3NCt2M9FqnBVGHSrkBqqPKS3rPtX5LURzC6PtpX8Em2xEMDHjh5J0vxYhSN9Lrj6nptKn+WxKQmc57G4CFSbzcH3vrTMWeDiCD4NtcLDv++hoVEQgY/2UpE9F0nHUG0uNA1M2dreWbxHKmd10wLf6eqCK8BkXcB6d4lXvCCPwufrA/2LiNy0tPgxQuJtjikpuI9BeweEDJSgLDodJ4wgnXp9KX/b/PAFcDCAEonEmFMgI33aBPS8zJzDBdEiFOhmjVrU+qwzsBwEPKw21N195sEqQuPbVOyIm5piWsXol5686i6XG5uGDHwOLEeR/73v25gI7zIRXtYOp7IGgsbxBwc6qK5Sas+Xhi9RfFKEMfesS17co5wGZPYlNGsB+THyrZ3DFvZTOFh8MzTtLzlokIrh3jYx1nuf/RICxqXx94XiGpw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ff8d5d-1235-4221-adc4-08df106c97f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2026 01:24:30.1815
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: itj1k94bFn2k4Q3sFo2QotBDuNk0PojmW/EG1X31xlD54DufCF5tyR9ReNqaJ23DgH31jW0l/VOHJjb03bQNEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7712
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDAxNyBTYWx0ZWRfX3Zed9E9B+Pd8
 RP/T7N5o9d/PFwc8qwoFlkGiSMyd02DW16WW01I95Tr6YHgD0oKRESEU3aZThqI0X1FWY+p42KU
 7jxJs91gce9aeqcEy0CFJJVqeXj8S6U=
X-Authority-Analysis: v=2.4 cv=A9r5rKWG c=1 sm=1 tr=0 ts=6aa4a9d6 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=EUspDBNiAAAA:8 a=BmvojRKN8zh3WvTxwbgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: CUJeRc3BQ4jPwamkS97bOMzmnwaCw9rk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDAxNyBTYWx0ZWRfX4tg3RurLfnJF
 PfEW5tDujla4r1B0uUbiR3xGb/tGP9xBWADSDDrYyi9qdqcXiRIWIIll0bn360V4gq7UcdbxO0+
 ks4aTS/4rzOiNGMI+c5ryUL5ObN2xTPWoCATKkTvyyTzwCN53L8I3YYoKrYh24lGZAmOQLHG5o+
 UeDhWspiwhRmo0Ael0OFt5IqNV0Im8BMVwHhcDQ3czbi72MWG6LGlqF8Zd2R7qgMfTYNbBnyMIW
 tOXiGBvDk4XVGzdbozT80+ugFVNCkn3P199B2dcK8hCzYJ5BXbCRNaTivUXWwLZYXdz6i8Btd7y
 VAqZGLEWtTbZra1A3YUObwiwpipeEgrRfiFFja4byHtYeftOqZzGq3uKVCZCmpEZ1sqda0mTneE
 i4JcRSSzSTaBlaHKU/aaJhZOkPDjxzM5ffkeuniw5BguTczyUivjWHATOzh7XZqVdAw48qlIlrX
 ks/MvQBeN8evIkTs4Cg==
X-Proofpoint-ORIG-GUID: CUJeRc3BQ4jPwamkS97bOMzmnwaCw9rk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_01,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609120017

T24gVGh1LCBTZXAgMDMsIDIwMjYsIEZhaXNhbCBIYXNzYW4gd3JvdGU6DQo+IER1cmluZyBBUFBT
IFN1c3BlbmQsIHRoZSBjbG9jayBjb250cm9sbGVyIHVuaXQgZGlzYWJsZXMgYWxsIGNsb2Nrcw0K
PiB0byB0aGUgQ1BVIGFuZCBzdWJzeXN0ZW1zLCBjYXVzaW5nIHRoZSBjb250cm9sbGVyIHRvIGVu
dGVyIHRoZQ0KPiBQb3dlci1PbiBSZXNldCAoUE9SKSBzdGF0ZS4gVGhpcyByZXN1bHRzIGluIHRo
ZSBsb3NzIG9mDQo+IFFzY3JhdGNoIHByb2dyYW1taW5nLg0KPiANCj4gVXBvbiBBUFBTIFJlc3Vt
ZSwgdGhlIFVTQiBjb250cm9sbGVyIGRvZXMgbm90IGhhdmUgdGhlIHByb3Blcg0KPiBQSVBFX1VU
TUlfQ0xLX1NFTCBvciBWQlVTX1ZBTElELiBIZW5jZSwgaWYgb25seSB0aGUgSGlnaC1TcGVlZA0K
PiBQSFkgaXMgdXNlZCBmb3IgYSBjb250cm9sbGVyIGNhcGFibGUgb2YgU3VwZXJTcGVlZCBvcGVy
YXRpb25zLA0KPiB0aGUgY29udHJvbGxlciB3aWxsIGFzc3VtZSBpdCBzaG91bGQgdXNlIHRoZSBV
U0IzIFBIWSBhbmQgbm90DQo+IHRoZSBIUyBQSFkgYXMgY29uZmlndXJlZCBiZWZvcmUgQVBQUyBT
dXNwZW5kLiBUaGlzIGJlaGF2aW9yDQo+IGRpc3J1cHRzIHRoZSBub3JtYWwgb3BlcmF0aW9uIG9m
IHRoZSBVU0IgY29udHJvbGxlci4gU2ltaWxhcmx5LA0KPiBpZiB0aGUgY29udHJvbGxlciB3YXMg
b3BlcmF0aW5nIGluIGRldmljZSBtb2RlIHByaW9yIHRvDQo+IEFQUFMgc3VzcGVuZCwgYW5kIFZC
VVNfVkFMSUQgc2lnbmFsIGlzIG5vdCBzZXQgYWZ0ZXIgQVBQUyByZXN1bWUsDQo+IHRoaXMgd2ls
bCBjYXVzZSB0aGUgUEhZcyB0byB0cmFuc2l0aW9uIGludG8gdGhlIHN1c3BlbmQgc3RhdGUuDQo+
IFRoaXMgYmVoYXZpb3IgZGlzcnVwdHMgdGhlIG5vcm1hbCBvcGVyYXRpb24gb2YgdGhlIFVTQiBj
b250cm9sbGVyLg0KPiANCj4gQWRkcmVzcyB0aGUgaXNzdWVzIGJ5IGVuc3VyaW5nIHRoYXQgdGhl
IFBJUEVfVVRNSV9DTEtfU0VMIGFuZA0KPiBWQlVTX1ZBTElEIGFyZSBoYW5kbGVkIHByb3Blcmx5
IGFmdGVyIHRoZSBzeXN0ZW0gcmVzdW1lcyBmcm9tDQo+IEFQUFMgU3VzcGVuZC4gVGhpcyBpcyBj
cnVjaWFsIGZvciBtYWludGFpbmluZyB0aGUgY29ycmVjdA0KPiBvcGVyYXRpb25hbCBzdGF0ZSBv
ZiB0aGUgVVNCIGNvbnRyb2xsZXIgYW5kIHByZXZlbnRpbmcNCj4gdW5pbnRlbmRlZCBzdXNwZW5z
aW9ucyBvZiB0aGUgUEhZcy4NCj4gDQo+IEFsc28sIGFzIHRoZSBjb250cm9sbGVyIGlzIHN0YXJ0
aW5nIGZyb20gUE9SIHN0YXRlLCBtYWtlDQo+IHN1cmUgdGhlIGNvbnRyb2xsZXIgUmVzZXQgaXMg
cGVyZm9ybWVkLg0KPiANCj4gQ28tZGV2ZWxvcGVkLWJ5OiBTcmlyYW0gRGFzaCA8c3JpcmFtLmRh
c2hAb3NzLnF1YWxjb21tLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogU3JpcmFtIERhc2ggPHNyaXJh
bS5kYXNoQG9zcy5xdWFsY29tbS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEZhaXNhbCBIYXNzYW4g
PGZhaXNhbC5oYXNzYW5Ab3NzLnF1YWxjb21tLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9k
d2MzL2R3YzMtcWNvbS5jIHwgMTI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMTAwIGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQ0K
PiANCg0KWy4uLl0NCg0KPiAgDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHByb3BlcnR5X2VudHJ5
IGR3YzNfcWNvbV9wcm9wc19icm9rZW5fc3VzcGVuZFtdID0gew0KPiArCVBST1BFUlRZX0VOVFJZ
X0JPT0woInhoY2ktcmVzZXQtb24tcmVzdW1lIiksDQo+ICsJeyB9DQo+ICt9Ow0KPiArDQo+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IHNvZnR3YXJlX25vZGUgZHdjM19xY29tX3N3bm9kZV9wcm9wX2Jy
b2tlbl9zdXNwZW5kID0gew0KPiArCS5wcm9wZXJ0aWVzID0gZHdjM19xY29tX3Byb3BzX2Jyb2tl
bl9zdXNwZW5kLA0KPiArfTsNCj4gKw0KDQpUaGUgInhoY2ktcmVzZXQtb24tcmVzdW1lIiBpc24n
dCBhIGRvY3VtZW50ZWQgRFQgcHJvcGVydHkuIEl0J3Mgc2V0IGhlcmUNCmZvciBtYXRjaCBkYXRh
IGp1c3QgdG8gaW1tZWRpYXRlbHkgcmVhZCBiYWNrIGJ5IHRoZSBzYW1lIGRyaXZlci4gQ2FuIHdl
DQphZGQgYSBmaWVsZCB0byBkd2MzX3Byb3BlcnRpZXMgYW5kIHBhc3MgaXQgdGhyb3VnaCB0aGUg
cHJvYmUgZGF0YQ0KaW5zdGVhZCAoc2ltaWxhciB0byBob3cgZHdjM19nZW5lcmljX3BsYXQuYyBo
YW5kbGVzIGl0KT8gVGhpcyBhdm9pZHMNCmhhbmRsaW5nIHRoZSBzb2Z0d2FyZV9ub2RlIGxpZmVj
eWNsZSBqdXN0IHRvIHBhc3MgdGhlIHF1aXJrLg0KDQpUaGFua3MsDQpUaGluaA==
