Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526553B27D4;
	Thu, 15 Oct 2026 02:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792030342; cv=fail; b=o4X93LeXCj/8C9SrPFjd+LoAMi8NJ4H66I9edFtDhfM4N0GfJndq059pTo/Ft3Q9la3TghUFnYX2UOPX8qgoXcxau0wFleru2eKR4wO8o4gTqHHRV950G44Bf/M422e6ZIopRnQpSjvJ6kFNvmSC0b+MbeDMk8m49J/WZNlDxTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792030342; c=relaxed/simple;
	bh=4dRNduSVfRQSFVwW1BbnFiOjFVn1N8YjHjF4Su9BVdg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Oz44Y9kShqAWPdJGYTKA/sM1k3DcGq2pxVxBaDEUI/fTcZbJBr4NzhsupHyZH6VvN7HQGQut0ZOOCCaxzNJwWuZAqFRyVn/rvwHU2zKwP+E2xoFxxP5SDpfDz7kpsHLDziJL5ajTLpAYO8leWyZoL12GfCRuBeQhE0yOJNesdIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Oey/yiGY; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Fv1QnzJn; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EKwxBMCV reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Oey/yiGY";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Fv1QnzJn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EKwxBMCV"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F0M8oG2819864;
	Wed, 14 Oct 2026 19:12:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=4dRNduSVfRQSFVwW1BbnFiOjFVn1N8YjHjF4Su9BVdg=; b=
	Oey/yiGYl0ibzVYatoP08ILUgdYvZxQeNgGvXaohoSFlG5VydDlarMJqvrO1OH/9
	BH22nItC9Gk/oVy2ig7l+mOSREjqq4zptSnrx5s0IXbSOUvn5aex1Uq6kgJMercb
	ztQ+JhQzRf1Knhc2myXlGD07uPncnl9hMDZTFWKWBbqmHVe8yqY9+GBt4SxQDzTJ
	VDSPfZBcmrgNZA46ypqTuOtMK3Fyqn21hNglPtlElCdWfC2lDJRKJlQimjALLMe8
	A9Nz8Gz095Yi7hxM2bty7wcYPEGhIFKWC7AcT4pJFBvYpZGoXy3BMyhgsgymBXGl
	NnbB79TY8ZNbOO/UH3hqVA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4haeut2a3u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 19:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1792030328; bh=4dRNduSVfRQSFVwW1BbnFiOjFVn1N8YjHjF4Su9BVdg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Fv1QnzJn+HVZ46LplET+kGgAw/ej0uP8o/ZI9WtTNPIZZnFg2UncYhGbwkm/mDi2t
	 LdpobzxhAGwNFyE+yPJ/YWE+IkvCJUEQH7I25tiU3irMccYvfTKwsMoockZnZ19vpB
	 +q9ivRTPKFcmAJPDNCES2xl/X9Qe/wap60Wan5s7zKEkVKORGbP0eMRV+oFttIeUJM
	 XZ+z2gOQa0sE5qDVyHtRvcfkJF02k8BFrKi2fat6dwwsSx0RTjOEUSAkI6mP2160Ai
	 JRz99KeAcVPaP/7OtXrMHnANgzbgoUw/c/bVF3C977gLZTAshspWm6DgF0sEr8DntF
	 gwCuEZVBhoCsA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0EB5A40136;
	Thu, 15 Oct 2026 02:12:07 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A91EFA02EC;
	Thu, 15 Oct 2026 02:12:07 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=EKwxBMCV;
	dkim-atps=neutral
Received: from BL2PR08CU001.outbound.protection.outlook.com (mail-bl2pr08cu00104.outbound.protection.outlook.com [40.93.4.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id D0B0240139;
	Thu, 15 Oct 2026 02:12:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYv33TsJyQCj6dY4IlzLEqKEddsq0YyL70b+M41rRmmCld/QMbZUxnpLcQgb/je6cYMy31GZtJjJFeMokRYN/9nzLygxnU6iH2qklMg6YMv+5m8hb3Sc3GoDSy5gu/O3f3UnGeWHO41b6yePDUHrm4vOHfXwje0Jw7OBE45jG7FDhvN5L7COrjKK62D/vWX8DU1nq0BYdtkSLfr64xrL5gzU4kvw+6i+np0imCXapJcJjZMGFVXUH2N7sDjRekFqpLreROEkGqkCyJdsPEf6+8xU0L6qRpIbQBG3fWpKQylFyVlo0lCC5znRgfSS7rRg1X6Z0NDqZn+rGeMV3aapDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dRNduSVfRQSFVwW1BbnFiOjFVn1N8YjHjF4Su9BVdg=;
 b=pk1E5lAp0RPlfTDO+GIih35h3oo0nij/mBvc7sMYrQ7nm77akhWPgy3EXA+Yx8Wi3CdfTBKwQVQ3+LQ9MzLjuSazVpvlAMaLVbos9lgZP/fh0/pw/xI2S3cShOOO/RyazBs9Lm3ikQh08H0fcb5eRK51Ib6tEFLdUlQZCZU2yaKC7E+PbBSOJhNfRnDril2YzGibOEmzdj3hhBNfwm1tcy3sFyISGlvqPa4tQuT3cYNN9L8ug9JjdFr1s6Hl1qtvKDbdDtrNekrnrZhw1JXexUjjkA3C+5rW/Lvix2yElYaU2KvPhRsjUczdqWolM62SO2c/XWt2qbxwBkLV5T1l4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dRNduSVfRQSFVwW1BbnFiOjFVn1N8YjHjF4Su9BVdg=;
 b=EKwxBMCVHEbL21eaKnKIEf3HmHjUD+ALDYUNrJy9oTAOHRJwWvpnFx2pAsIbq7UzXuayzrSS54j/v1TkRnhQq12uZQ2v7Gcf+hm3q8eX5/Akz2gB/csrVKyLEzFcnOEV1D9C/7t/+5StnTNsAO2DdnNu6rLjMYdu8+PB4hHm6c0=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DS6PR12MB754991.namprd12.prod.outlook.com (2603:10b6:8:4d2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 02:12:01 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%5]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 02:12:00 +0000
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
Thread-Index: AQHdT9IiBPnGUogw2kOy03ybke34C7b7PVSAgAEeJQCAAJqmAIAA/0WA
Date: Thu, 15 Oct 2026 02:12:00 +0000
Message-ID: <atAuSs9VTveGwzpy@vbox>
References:
 <20260929-ram-interface-stuck-v3-v3-1-0d1a54db233c@oss.qualcomm.com>
 <d45f758a-8d00-4f76-aef9-7364156f4ce3@oss.qualcomm.com>
 <as7c1LHrOsqAA4Nx@vbox>
 <94c4056d-7f7e-46ef-97cd-dd12621260bd@oss.qualcomm.com>
In-Reply-To: <94c4056d-7f7e-46ef-97cd-dd12621260bd@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DS6PR12MB754991:EE_
x-ms-office365-filtering-correlation-id: 82e3c835-f17f-4180-f923-08df2a61b2ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|22082099003|18002099003|10067099003|3023799007|4143699003|11063799006|261009223027099003|38070700021|56012099006;
x-microsoft-antispam-message-info:
 JOvcAvv7FtFvD19/i8CClOuwTzxbwIId//5I15m3gS63mFb1pKi/jnWjrMEwvQCil7dUzkr5uGX4uKG7mKi5DUU49A4724rrX+Mk4nXt8iXgh34uZkcbS49kX0neTUEYoyVC+HY60y3/PW3H8nxP8+6s0VWJqh4c4UCN0uw26E5oSzPHFENYriJFcyVPvGVwmMwBk6DN/W73oQZbH0Nw8WNvVh8xSKlmk0gJbcfY11wJQkwEiB8YCJ9mhdo8A+4tBQGqWxe8idO/sx0cdkQhlzfhaYSQC44sa5QF+mOmH9vAa2GZHV4yxcqq8XNT0cV/Qmh4NccvX0o82vNA8rIHW0ODS8fMfNHcjy9vbqMzMrFxJp5PmPScuDfcxnQmDahd2x8LVWWBfXbSF1iQjBXgPUaU3uIiSvwzbiEHmnABHM9+KY8PfpbGMv+UT1MiG9OYgH02TR+msZoxmCHMzJ0ZfA7StxaF8BCJ5PYwtLLRjcghQnJeO9W/OM6o3ynY0QBU6DPwEXgHUzZX2LLhHmgHx+2JPL6hWYz8oYy6LjGh6tlTVwtl1KxLhZiCFrOrSVxbsXguxej54LKXPQaRLdcmWQXYMZKgm/cKveMjWDrM6RoI2LhefKuzXKF59K3V6hEnWt/q+XlYfuEKefarmMDlMevEl30RDvNfMCtm5bdFxdHT35TRZEBd3rXg+IR9vA9A0EihuhCLEVgiSuqsNzq5tOYOTDZ9BT7ulFu8gahGxPc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(3023799007)(4143699003)(11063799006)(261009223027099003)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bG1KR3ZZOUNJVm1acjRLN3c1WTM1TkE5amRmeG9qRktYN0Q1K2hJQnlLKzRz?=
 =?utf-8?B?dTFoQ28vNFpqUEpMbnVuZGNiZlQyeHY0V0RsT1V1TDlUSEEwaU1tQkN0M0xu?=
 =?utf-8?B?Q3NiaHEzajJJMVNIcmJrQnpHbXk4Mi8vUVZuU1Q1ZjRmanIvVVdOVTZzSHho?=
 =?utf-8?B?N3hIelRsZklpWTJUQ3ViRjVYSEN5ZjZpcW9pUHpIdnRxUTM1Mko4R0EyTnRk?=
 =?utf-8?B?R3RIS1RDUFZtODR2ankwL0U1N1hrMUx0VHZNaUExMWJDMEltclVwRlY5R0JN?=
 =?utf-8?B?RmIxTUVPaGVrUXpnYUMvcnlOK1BUemRFVmQwZlJXeUpzUGJUWUR0bEthTkpW?=
 =?utf-8?B?ZG1mMjI2SEk0SzhxdDNOSDF6VDlRT3h6cFp5aTZrNUtzNllDbGVLK1d2SkZa?=
 =?utf-8?B?RitEaHduZGhTZ28zSmtkcGExZXZUSFQxUHhERnlyY3kvV0wvUldUM1dXWkVR?=
 =?utf-8?B?Z1l1SkhpcFd0b3AzdkpOa3ZGY3FZdW14QU9mbjVsSW02b1FUTG5xNzgwNFYz?=
 =?utf-8?B?aWpVek9TVnpoZE9uY3NnS3p1dElKdEU4OEFBcE82SkZnY2psbDFjc3BuR0NV?=
 =?utf-8?B?QUF3TFhwNHdNb0FvRktHUnB5SmNDMzFHeGFRTmlmSjVIUmxhRW5NSlhTaXYx?=
 =?utf-8?B?cXFnNE5HTVlEMHNjeDd0SjFZeVFVS2M5MTViRHkvVHhSb01USmFDUTY0UTQ0?=
 =?utf-8?B?eDYvQkdUYmlvQTZQd2tycjlHZkNWOWRselVhZzNycVA0aEYreDhZM0ZaYzdn?=
 =?utf-8?B?cElHTTVrdTh4UlZ2TTNkcnY4c1ZiMVYrcHhiYStya1NBaUFiWDh2Y1hydkdn?=
 =?utf-8?B?ejE0aG1lWEhRUllvMUxsZkRjNmNoTGE1Vy9iZnFtRjV5WUJpd3ltME9qSU5t?=
 =?utf-8?B?MUZ4NGxUZzdqVDVUMzBkOStaVGRZL3FDcExEYSt5akx4OG5OSkJXRFJVbldO?=
 =?utf-8?B?RFdkenlVdFQweDQwdzhOaC9aTWE3c1U3VnAxekRjQ2tQbERtRXRIN3huK3pi?=
 =?utf-8?B?OC9rMENta1pObXp6cGdsTnZPVVl3VjJ2V0JpaDA2V1JKaXhOUGk5UjVsejNS?=
 =?utf-8?B?Vm15Y29UM0l5ajhHRHVqYTJXQzFtMW94djIxTDBqT1VtKzk5dDBLQ1cwTEJp?=
 =?utf-8?B?M3IyR1BkNk9LaS8raHBROGhueVVjRWZDWGRVMlQvY3FmVmlqVDVuNUloZDgv?=
 =?utf-8?B?NUZpUWIxTVBXa21aV2wrbng4S0RHa3BLMlVrd2xnRGU4N05XZHk4dEdBbWlG?=
 =?utf-8?B?bWVCaDl5TERCMWVEOUFxLzdXdHMyNnJ2b016NDRoTWlKV0QzUkNjc1FRMjZV?=
 =?utf-8?B?UmNwM2Evb0wrVThPaC9JZ2lVdXNvYmYwNlcwd294a0tGM3JtTjg1TUVIREhL?=
 =?utf-8?B?MEwvcmcwMFVrdmJOZGJNaGxwM2NRSTh5bjh3S2tQTGgrS3oxSVJnMlpMb2N6?=
 =?utf-8?B?NWtzVzdMOXFDei8rN3daUlNPdDduMkZodlRDcmdPMGZ3UDRla1BKR00wUWxz?=
 =?utf-8?B?VVdWWGhxaVU0OFZOdUFBMjZ6azY4a0llMzVLZEh4SDYybGJUQ0xQbWpwU2lp?=
 =?utf-8?B?RXc4QVVrYVRrdkpNZzErLzZkTGNzWFBVbUUwN0FMakZEMGs2dlZwSzhaeU83?=
 =?utf-8?B?ZnF1Z0o0RWpIQ2dDN09VYUV3aFlFNGd2QkUvd2UyeEZHbUdGam1OYTZteUFU?=
 =?utf-8?B?MUlhelQ4cWdoVlVkalIwZjRTYWIzRm50VTVpNXhSWHZXQjAyUkxBQXp0aEFQ?=
 =?utf-8?B?Y2FkNS9ESTkzaXFzNU5VcWZ2RVNDTUxNcTdQRHdmdTlrK2VQM0YzY2wvZ2c4?=
 =?utf-8?B?VjNmdWF6M3N5UHJuSEpyYTNuVXArRWdvWjZYYlFPbWtKOUVzRUp2V3AvZVVa?=
 =?utf-8?B?Nk11NVl3NUZTZWp0cjB3ejd3R3FhalVNR2hxRjB5VUl0MGRIVnN3a1JucWxy?=
 =?utf-8?B?ZEQ0dnVNdkN5amVKQXBoR2R2VmFHS2hwZTVyRzRXT3VaMVlXZEV3ZU5FUWll?=
 =?utf-8?B?NVRpNGw4MmFLWHNuNU5rMk1SY3hmMzRXK2o1MzdnSHgrTUFhMFdacFBzbXNw?=
 =?utf-8?B?VExOcVArVEIyeE9mTkJtcFRXQVRyczRodWJhck1qdXJobFdGV0xQY0xKOUVl?=
 =?utf-8?B?YmdGOXdQVXhsWXJjRTR6VVZCQnVRaVdrRjJNdmdsNWtxSG9WNzJqWndpQXRI?=
 =?utf-8?B?SFlFamt4Y3BHQ3ZwS1EzcXVHZ1RPVDRPQVpLU1JTWGl2cGY0ZVRqek90TUVC?=
 =?utf-8?B?Q0k4MGhlSVR1ZmRNYUVsZW83ZlgxVXJ3WDQ3aWxnMFVuQVR1NHpoelFEZXBt?=
 =?utf-8?B?eFo1QTVJbXVWMFU4NDlTb1Byc3hIV3FPWEt6VW1YMUwzQVN0ZjhVQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <47740F1A082A6D4893FB963244AC4B8B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	jvnE+nkyl61ImhzOYiyDskb11V47ZO4olnbQ11fyJzEAPUemnAAJ48ih4v+JSEOB7P4rWG/ir8hs2ywjeeBxdxI2JMyia8LINxff3s5dJdYD28b6P7lTDyORe8CTVp+C4Qe+SsrmwtJWLd5jo5qhppfrmaCN5wW8Qcxfr/hmLKYM48aYbbgGeXwMQwEs5P068TeFU0+9BTK0n8fe3fXdc/vezdYDMuldNnJwRGBzdR12ZsZSejLnVSLdh/hZunoIXuDfmdELwZGfs82DaguGO9oHVCeJgBJ/6+TUF+4In/9jRAPT9Rq/nqwr3Ne47qgbPGzYYqHDxycpfMlfovlOoA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PIFuQjW9Uyz1+gy6rjXgINRulyRfNd+XN+Rl0ClJJ1yjkAo698LoEpovQsnPge3X275A158VdSSRX3KH4xUjskdCv+D4rcxS294jkA55txgNIv85El81hsUqGxvpfMWZ+wta7MIX+PRr232T22rzgYNe2T8iUF4YuZPT9TDcNpN2fpDpwTnvoXEyg1DudA5iE6bpcSbi1Gbeuc7Wbik9wWmbr9cRLsipOqEAVLyrxDvW6qJ1YvPrBhibqh/WAQpXIt2XqPY7edCAhRBsviMKy+zCDxloZ9OLGnzcgOLBaP8C8GYL9TSqvSJMjSBJcBfoVOLuk5SJaCquSoo32Xjk0MjWJLSSfNAbynE0MvU/dNNeo1YNa4Ph1clogBy0JSD1LFWzOJNc4+sQteqDO9l3YKMr647Wt1BxPsjj65yQWoZognSmfaiSadQ+6HKo0T+v/ZAiRjvhhn84Mz2avfkMKRaifEOMs189o1fUbhrw96KBnFUSfmmVtNt/TVcubFZvBANe/PY2mLWBpseLKyJmGfErYUt2iM7Rl2d0W72NYlGbaQno8q086aELpZAPSLWeQU4Hpbj1YSkPZ17k82u8NcS4Pa6rOGjXvWiE2q2cMs0f3g/ejWtiiafqEOI17dYVyHVwPiCpoC02VIt4pbBEfw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e3c835-f17f-4180-f923-08df2a61b2ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 02:12:00.7754
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I2mSgGxMWl5XD2K7uHP0PysbnDEWW7TRMrrLTvykr24fSpfPTeF7GQvhOKtelk+r5KknyM14laDTq4+xLe4EJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB754991
X-Proofpoint-ORIG-GUID: _VAXzPHfOkCSHjXx1Ow4IMkjAPqMSJH6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAwOCBTYWx0ZWRfXyACe3qP8Zze2
 WbbRuXtfDrl9i9dIk1xEkD8OgXQzZnByxvuZ8kljX9faWHIIAr/ur2biBB05Cj9TqW6n+H33TRN
 /phJMyirJ48YTJhHscxiWHnenkWmivA=
X-Proofpoint-GUID: _VAXzPHfOkCSHjXx1Ow4IMkjAPqMSJH6
X-Authority-Analysis: v=2.4 cv=FvaQbGrq c=1 sm=1 tr=0 ts=6ad03679 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=EUspDBNiAAAA:8 a=JtSX8EK4_rVzDTH50H8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAwOCBTYWx0ZWRfXzAdSN+WcoGa3
 UkG97TMZdcukCEH4kUW+kWu36oJ6qGkb5XMlDeQDzhWW9JiJgfe99WOKsgczVIdO+DmA87OXb5E
 109TWL5VzkWTjmnIZu3j3VY7FigsRvPlO49DEQc9K4Zhgmg2qQrLi+GOB9RGo8ZcXfs3ckppdSJ
 vh/eXJBWS1Yykzc/qBflp9D9DkBUHvuwLb0rNVDt+VICyII0vEP4e/QUCwW13UNiXoY72yXnSum
 yhP66gQp59VX4F5yHqauxJcK77yQ35MB515suspKbip+AUfjzU8fsqHGT4m7iuwIzEHulHGerRj
 Gdvx4+n1NquuEv6TaQawtl4Q8wBXCUuCAZW7WrxwogzjTcDrQqbTFAEd0YUBDGxkDHsfBQGXqCz
 wwjtcBJqf04HUn/n22s5BrGO70zx9BU30Qxyf0wpDF6zCBpGODvLi6qWdcQj7OLlsBXF45IBUyT
 F7K1y6pX2RrsHH3bDSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610080000 definitions=main-2610150008

T24gV2VkLCBPY3QgMTQsIDIwMjYsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IA0KPiANCj4g
T24gMTAvMTQvMjAyNiA3OjE0IEFNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gVHVlLCBP
Y3QgMTMsIDIwMjYsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+ID4gPiANCj4gPiA+IA0KPiA+
ID4gT24gOS8yOS8yMDI2IDEwOjQ5IEFNLCBLcmlzaG5hIEt1cmFwYXRpIHdyb3RlOg0KPiA+ID4g
PiBEdXJpbmcgcGx1Zy1pbi9wbHVnLW91dCB0ZXN0IGNhc2VzLCBpdCBpcyBzb21ldGltZXMgc2Vl
biB0aGF0IG5vIGV2ZW50cw0KPiA+ID4gPiBhcmUgZ2VuZXJhdGVkIGJ5IHRoZSBjb250cm9sbGVy
IGFuZCBhbGwgQ1NSIHJlZ2lzdGVyIHJlYWRzIGdpdmUgIjAiIGFuZA0KPiA+ID4gPiBDU1JfVGlt
ZW91dCBiaXQgZ2V0cyBzZXQgaW5kaWNhdGluZyB0aGF0IENTUiByZWFkcy93cml0ZXMgYXJlIHRp
bWluZyBvdXQNCj4gPiA+ID4gb3IgdGltZWQgb3V0Lg0KPiA+ID4gPiANCj4gPiA+ID4gVGhlIGlz
c3VlIGNvbWVzIHVwIG9uIGRpZmZlcmVudCBpbnN0bmFjZXMgb2YgZW51bWVyYXRpb24gb24gZGlm
ZmVyZW50DQo+ID4gPiA+IHBsYXRmb3Jtcy4gT24gU004NTUwLCB0aGUgZGVidWcgbG9nIGlzIGFz
IGZvbGxvd3M6DQo+ID4gPiA+IA0KPiA+ID4gPiBQcmVwYXJlZCBhIFRSQiBvbiBlcDBvdXQgYW5k
IGRpZCBzdGFydCB0cmFuc2ZlciB0byBnZXQgc2V0DQo+ID4gPiA+IGFkZHJlc3MgcmVxdWVzdCBm
cm9tIGhvc3Q6DQo+ID4gPiA+IA0KPiA+ID4gPiA8Li4uPi03MTkxICAgIFswMDBdIEQuLjEuICAg
IDY2LjQyMTAwNjogZHdjM19nYWRnZXRfZXBfY21kOiBlcDBvdXQ6DQo+ID4gPiA+IGNtZCAnU3Rh
cnQgVHJhbnNmZXInIFs0MDZdIHBhcmFtcyAwMDAwMDAwMCBlZmZmYTAwMCAwMDAwMDAwMCAtLT4N
Cj4gPiA+ID4gc3RhdHVzOiBTdWNjZXNzZnVsDQo+ID4gPiA+IA0KPiA+ID4gPiA8Li4uPi03MTkx
ICAgIFswMDBdIEQuLjEuICAgIDY2LjQyMTE5NjogZHdjM19ldmVudDogZXZlbnQgKDAwMDBjMDQw
KToNCj4gPiA+ID4gZXAwb3V0OiBUcmFuc2ZlciBDb21wbGV0ZSAoc0lMKSBbU2V0dXAgUGhhc2Vd
DQo+ID4gPiA+IA0KPiA+ID4gPiA8Li4uPi03MTkxICAgIFswMDBdIEQuLjEuICAgIDY2LjQyMTE5
NzogZHdjM19jdHJsX3JlcTogU2V0DQo+ID4gPiA+IEFkZHJlc3MoQWRkciA9IDAxKQ0KPiA+ID4g
PiANCj4gPiA+ID4gQW4gWEZFUiBOUkRZIGlzIHJlY2VpdmVkIG9uIGVwMGluIGZvciB6ZXJvIGxl
bmd0aCBzdGF0dXMgcGhhc2UgYW5kDQo+ID4gPiA+IGEgU3RhcnQgVHJhbnNmZXIgd2FzIGRvbmUg
b24gZXAwaW4gd2l0aCAwLWxlbmd0aCBwYWNrZXQgaW4gMiBTdGFnZQ0KPiA+ID4gPiBzdGF0dXMg
cGhhc2U6DQo+ID4gPiA+IA0KPiA+ID4gPiA8Li4uPi03MTkxICAgIFswMDBdIEQuLjEuICAgIDY2
LjQyMTI0OTogZHdjM19ldmVudDogZXZlbnQgKDAwMDAyMGMyKToNCj4gPiA+ID4gZXAwaW46IFRy
YW5zZmVyIE5vdCBSZWFkeSBbMDAwMDAwMDBdIChOb3QgQWN0aXZlKSBbU3RhdHVzIFBoYXNlXQ0K
PiA+ID4gPiANCj4gPiA+ID4gPC4uLj4tNzE5MSAgICBbMDAwXSBELi4xLiAgICA2Ni40MjEyNjY6
IGR3YzNfcHJlcGFyZV90cmI6IGVwMGluOiB0cmINCj4gPiA+ID4gZmZmZmZmYzAwZmNmZDAwMCAo
RTA6RDApIGJ1ZiAwMDAwMDAwMGVmZmZhMDAwIHNpemUgMCBjdHJsIDAwMDAwYzMzDQo+ID4gPiA+
IHNvZm4gMDAwMDAwMDAgKEhMY3M6U0M6c3RhdHVzMikNCj4gPiA+ID4gDQo+ID4gPiA+IDwuLi4+
LTcxOTEgICAgWzAwMF0gRC4uMS4gICAgNjYuNDIxMzg3OiBkd2MzX2dhZGdldF9lcF9jbWQ6IGVw
MGluOiBjbWQNCj4gPiA+ID4gJ1N0YXJ0IFRyYW5zZmVyJyBbNDA2XSBwYXJhbXMgMDAwMDAwMDAg
ZWZmZmEwMDAgMDAwMDAwMDAgLS0+c3RhdHVzOg0KPiA+ID4gPiBTdWNjZXNzZnVsDQo+ID4gPiA+
IA0KPiA+ID4gPiBBIGJ1cyByZXNldCB3YXMgdGhlbiByZWNlaXZlZCBkaXJlY3RseSBhZnRlciA1
MDAgbXNlYy4gU29mdHdhcmUgbmV2ZXINCj4gPiA+ID4gZ290IHRoZSBjbWQgY29tcGxldGUgZm9y
IHRoZSBzdGFydCB0cmFuc2ZlciBkb25lIGluIHN0YXR1cyBwaGFzZS4gSGVyZQ0KPiA+ID4gPiB0
aGUgUkFNIGludGVyZmFjZSBpcyBzdHVjay4gU28gaG9zdCBpc3N1ZXMgYSBidXMgcmVzZXQgYXMg
bGluayBpcw0KPiA+ID4gPiBpZGxlIGZvciA1MDAgbXNlYzoNCj4gPiA+ID4gDQo+ID4gPiA+IDwu
Li4+LTcxOTEgICAgWzAwMF0gRC4uMS4gICAgNjYuOTM1NjAzOiBkd2MzX2V2ZW50OiBldmVudCAo
MDAwMDAxMDEpOg0KPiA+ID4gPiBSZXNldCBbVTBdDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGVuIHNv
ZnR3YXJlIHNlZXMgdGhhdCBpdCBpcyBpbiBzdGF0dXMgcGhhc2UgYW5kIHdlIGlzc3VlIGFuIEVO
RFhGRVINCj4gPiA+ID4gb24gZXAwaW4gYW5kIGl0IGdldHMgdGltZWRvdXQgd2FpdGluZyBmb3Ig
dGhlIENNREFDVCB0byBnbyAnMCc6DQo+ID4gPiA+IA0KPiA+ID4gPiA8Li4uPi03MTkxICAgIFsw
MDBdIEQuLjEuICAgIDY2Ljk1ODI0OTogZHdjM19nYWRnZXRfZXBfY21kOiBlcDBpbjogY21kDQo+
ID4gPiA+ICdFbmQgVHJhbnNmZXInIFsxMDUwOF0gcGFyYW1zIDAwMDAwMDAwIDAwMDAwMDAwIDAw
MDAwMDAwIC0tPiBzdGF0dXM6DQo+ID4gPiA+IFRpbWVkIE91dA0KPiA+ID4gPiANCj4gPiA+ID4g
VXBvbiBkZWJ1ZyB3aXRoIFN5bm9wc3lzLCB0aGUgcm9vdCBjYXVzZSBpcyBhcyBmb2xsb3dzOg0K
PiA+ID4gPiANCj4gPiA+ID4gRHVyaW5nIGFueSB0cmFuc2ZlciwgaWYgdGhlIGRhdGEgaXMgbm90
IHN1Y2Nlc3NmdWxseSB0cmFuc21pdHRlZCwNCj4gPiA+ID4gdGhlbiBhIERvbmUgKHdpdGggZmFp
bHVyZSkgaGFuZHNoYWtlIGlzIHJldHVybmVkLCBzbyB0aGF0IHRoZSBCTVUNCj4gPiA+ID4gY2Fu
IHJlLWF0dGVtcHQgdGhlIHNhbWUgZGF0YSBhZ2FpbiBieSByZXdpbmRpbmcgaXRzIGRhdGEgcG9p
bnRlcnMuDQo+ID4gPiA+IA0KPiA+ID4gPiBCdXQsIGlmIHRoZSBVU0IgSU4gaXMgYSAwLWxlbmd0
aCBwYXlsb2FkICh3aGljaCBpcyB3aGF0IGlzIGhhcHBlbmluZw0KPiA+ID4gPiBpbiB0aGlzIGNh
c2UgLSAyIHN0YWdlIHN0YXR1cyBwaGFzZSBvZiBzZXRfYWRkcmVzcyksIHRoZW4gdGhlcmUgaXMg
bm8NCj4gPiA+ID4gbmVlZCB0byByZXdpbmQgdGhlIHBvaW50ZXJzIGFuZCB0aGUgRG9uZSAod2l0
aCBmYWlsdXJlKSBoYW5kc2hha2UgaXMNCj4gPiA+ID4gbm90IHJldHVybmVkIGZvciBmYWlsdXJl
IGNhc2UuIFRoaXMga2VlcHMgdGhlIFJlcXVlc3QtRG9uZSBpbnRlcmZhY2UNCj4gPiA+ID4gYnVz
eSB0aWxsIHRoZSBuZXh0IERvbmUgaGFuZHNoYWtlLiBUaGUgTUFDIHNlbmRzIHRoZSAwLWxlbmd0
aCBwYXlsb2FkDQo+ID4gPiA+IGFnYWluIHdoZW4gdGhlIGhvc3QgcmVxdWVzdHMuIElmIHRoZSB0
cmFuc21pc3Npb24gaXMgc3VjY2Vzc2Z1bCB0aGlzDQo+ID4gPiA+IHRpbWUsIHRoZSBEb25lICh3
aXRoIHN1Y2Nlc3MpIGhhbmRzaGFrZSBpcyBwcm92aWRlZCBiYWNrLiBPdGhlcndpc2UsDQo+ID4g
PiA+IGl0IHJlcGVhdHMgdGhlIHNhbWUgc3RlcHMgYWdhaW4uDQo+ID4gPiA+IA0KPiA+ID4gPiBJ
ZiB0aGUgY2FibGUgaXMgZGlzY29ubmVjdGVkIG9yIGlmIHRoZSBIb3N0IGFib3J0cyB0aGUgdHJh
bnNmZXIgb24gMw0KPiA+ID4gPiBjb25zZWN1dGl2ZSBmYWlsZWQgYXR0ZW1wdHMsIHRoZSBSZXF1
ZXN0LURvbmUgaGFuZHNoYWtlIGlzIG5vdA0KPiA+ID4gPiBjb21wbGV0ZS4gVGhpcyBrZWVwcyB0
aGUgaW50ZXJmYWNlIGJ1c3kuDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGUgc3Vic2VxdWVudCBSQU0g
YWNjZXNzIGNhbm5vdCBwcm9jZWVkIHVudGlsIHRoZSBhYm92ZSBwZW5kaW5nDQo+ID4gPiA+IHRy
YW5zZmVyIGlzIGNvbXBsZXRlLiBUaGlzIHJlc3VsdHMgaW4gZmFpbHVyZSBvZiBhbnkgYWNjZXNz
IHRvIFJBTQ0KPiA+ID4gPiBhZGRyZXNzIGxvY2F0aW9ucy4gTWFueSBvZiB0aGUgRW5kUG9pbnQg
Y29tbWFuZHMgbmVlZCB0byBhY2Nlc3MgdGhlDQo+ID4gPiA+IFJBTSBhbmQgdGhleSB3b3VsZCBm
YWlsIHRvIGNvbXBsZXRlIHN1Y2Nlc3NmdWxseS4NCj4gPiA+ID4gDQo+ID4gPiA+IEZ1cnRoZXJt
b3JlIHdoZW4gY2FibGUgcmVtb3ZhbCBoYXBwZW5zLCB0aGlzIHdvdWxkIG5vdCBnZW5lcmF0ZSBh
DQo+ID4gPiA+IGRpc2Nvbm5lY3QgZXZlbnQgYW5kIHRoZSAiY29ubmVjdGVkIiBmbGFnIHJlbWFp
bnMgdHJ1ZSBhbHdheXMgYmxvY2tpbg0KPiA+ID4gPiBzdXNwZW5kLg0KPiA+ID4gPiANCj4gPiA+
ID4gU3lub3BzeXMgY29uZmlybWVkIHRoYXQgdGhlIGlzc3VlIGlzIHByZXNlbnQgb24gYWxsIFVT
QjMgZGV2aWNlcyBhbmQNCj4gPiA+ID4gYXMgYSB3b3JrYXJvdW5kLCBzdWdnZXN0ZWQgdG8gcmUt
aW5pdGlhbGl6ZSBkZXZpY2UgbW9kZS4NCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IEtyaXNobmEgS3VyYXBhdGkgPGtyaXNobmEua3VyYXBhdGlAb3NzLnF1YWxjb21tLmNvbT4NCj4g
PiA+IA0KPiA+ID4gDQo+ID4gPiBUaGluaCwgQ2FuIHlvdSBoZWxwIHByb3ZpZGUgeW91ciByZXZp
ZXcgb24gdGhpcyBwYXRjaC4NCj4gPiA+IA0KPiA+IA0KPiA+IEhpIEtyaXNobmEsDQo+ID4gDQo+
ID4gSWYgdGhlIENTUl9UaW1lb3V0IGJpdCBpcyBzZXQsIHdoeSBub3QgY2hlY2sgR1NUUy5DU1JU
aW1lb3V0IGRpcmVjdGx5DQo+ID4gaW5zdGVhZCBvZiBpbmRpcmVjdGx5IGNoZWNraW5nIERFUENN
RCB0eXBlIG1pc21hdGNoPw0KPiA+IA0KPiANCj4gQXMgcGVyIGRpc2N1c3Npb24gb24gWzFdLCBp
bXBsZW1lbnRlZCB0aGlzIGNoZWNraW5nIG9mIERFUENNRCByZWdpc3RlcnMuIExldA0KPiBtZSBr
bm93IGlmIHJlYWRpbmcgR1NUUyBpcyBhIGJldHRlciBvcHRpb24gaGVyZS4gV2lsbCBzZW5kIHY0
IGFjY29yZGluZ2x5Lg0KDQpBdCB0aGUgdGltZSwgbXkgdW5kZXJzdGFuZGluZyB3YXMgdGhhdCBh
bGwgcmVnaXN0ZXIgcmVhZHMgcmV0dXJuIDAgaW4NCnRoaXMgc3RhdGUgYXMgbm90ZWQgaW4gdGhh
dCBjb252ZXJzYXRpb24uIEhvd2V2ZXIsIGJhc2VkIG9uIHlvdXIgY29tbWl0DQptZXNzYWdlIGFu
ZCB0aGUgZGF0YWJvb2ssIEdTVFMgaXMgc3RpbGwgYWNjZXNzaWJsZSBhbmQgQ1NSVGltZW91dCBp
cw0Kc2V0LiBBbHNvLCBvbiBDU1IgdGltZW91dCwgdGhlIHJlYWQgZGF0YSBpcyByZXNpZHVlIGZy
b20gYSBwcmV2aW91cyByZWFkDQphbmQgaXNuJ3QgZ3VhcmFudGVlZCB0byBiZSAwLiBTbyB0aGUg
REVQQ01EIHJlYWQgYmFjayBpc24ndCByZWxpYWJsZS4NCg0KQ2FuIHlvdSBjaGVjayBHU1RTLkNT
UlRpbWVvdXQgYWZ0ZXIgdGhlIENNREFDVCBwb2xsaW5nIGluc3RlYWQ/DQpTb21ldGhpbmcgbGlr
ZSB0aGlzOg0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZl
cnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCmluZGV4IGVlODM3MjM1NjMwYS4uZmY0OTU3YTczMTFlIDEw
MDY0NA0KLS0tIGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KKysrIGIvZHJpdmVycy91c2Iv
ZHdjMy9nYWRnZXQuYw0KQEAgLTI4Myw2ICsyODMsOCBAQCBpbnQgZHdjM19zZW5kX2dhZGdldF9n
ZW5lcmljX2NvbW1hbmQoc3RydWN0IGR3YzMgKmR3YywgdW5zaWduZWQgaW50IGNtZCwNCiAJcmV0
dXJuIHJldDsNCiB9DQogDQorc3RhdGljIHZvaWQgZHdjM19zY2hlZHVsZV9lcnJfcmVjb3Zlcnko
c3RydWN0IGR3YzMgKmR3Yyk7DQorDQogLyoqDQogICogZHdjM19zZW5kX2dhZGdldF9lcF9jbWQg
LSBpc3N1ZSBhbiBlbmRwb2ludCBjb21tYW5kDQogICogQGRlcDogdGhlIGVuZHBvaW50IHRvIHdo
aWNoIHRoZSBjb21tYW5kIGlzIGdvaW5nIHRvIGJlIGlzc3VlZA0KQEAgLTQzMiw2ICs0MzQsMTQg
QEAgaW50IGR3YzNfc2VuZF9nYWRnZXRfZXBfY21kKHN0cnVjdCBkd2MzX2VwICpkZXAsIHVuc2ln
bmVkIGludCBjbWQsDQogCQljbWRfc3RhdHVzID0gLUVUSU1FRE9VVDsNCiAJfQ0KIA0KKwlyZWcg
PSBkd2MzX3JlYWRsKGR3YywgRFdDM19HU1RTKTsNCisJaWYgKHJlZyAmIERXQzNfR1NUU19DU1Jf
VElNRU9VVCkgew0KKwkJZHdjM193cml0ZWwoZHdjLCBEV0MzX0dTVFMsIERXQzNfR1NUU19DU1Jf
VElNRU9VVCk7DQorCQlyZXQgPSAtRVRJTUVET1VUOw0KKwkJY21kX3N0YXR1cyA9IC1FVElNRURP
VVQ7DQorCQlkd2MzX3NjaGVkdWxlX2Vycl9yZWNvdmVyeShkd2MpOw0KKwl9DQorDQogc2tpcF9z
dGF0dXM6DQogCXRyYWNlX2R3YzNfZ2FkZ2V0X2VwX2NtZChkZXAsIGNtZCwgcGFyYW1zLCBjbWRf
c3RhdHVzKTsNCiANCg0KPiANCj4gPiBBbHNvLCBzaG91bGRuJ3Qgd2UgcmV0dXJuIGFuIGVycm9y
IGNvZGUgaW5zdGVhZCBvZiBzdWNjZXNzIGlmIG5lZWQgdG8NCj4gPiBzY2hlZHVsZSByZWNvdmVy
eT8NCj4gPiANCj4gSSB0aGluayB0aGF0IGlzIGRvbmUgd2hpbGUgcXVldWVpbmcgcmVjb3Zlcnkg
d29yazoNCj4gZHdjLT5lcnJfc3RhdGUgPSBEV0MzX0VSUl9SRUNPVkVSWTsNCj4gDQoNClRoYXQg
b25seSBibG9ja3MgbmV3IHJlcXVlc3RzLiBUaGUgY3VycmVudCBjYWxsIHN0aWxsIHJldHVybnMg
MCwgc28gdGhlDQpjYWxsZXIgc3RpbGwgc2VlcyB0aGUgY29tbWFuZCBhcyBzdWNjZXNzLg0KDQpU
aGFua3MsDQpUaGluaA==
