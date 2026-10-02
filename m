Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED35463B62;
	Fri,  2 Oct 2026 23:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790985368; cv=fail; b=oKpKPqkXnUH2CDHnib5aC+3C5wXalR4Tncv608wo1embnQ7tgAs7wFW+RYkTGCUA61KyE20fPSYfQfBuxEsbxOY95ReqKYoffQwaIzP718OHrb+bWGCKvgJzSYBj4/Hs4kWEB36XB7vjE2KtOtqhNIxfLd2pX0zHGxxvQOWDDZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790985368; c=relaxed/simple;
	bh=0e3cqHbYX3mQJW+GNyQWUlG0igRoMXRCsp7Egyc1kjg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lLMRO7t0xyJnNKbxLdWuDJUK62xNgMZ+1PXvB3p+ybVF70q/0ngQ99k4+Cav2nQpT3OMF0s+5Wp7fEEbZwAsgFqCC7YGIFN51WRDCgRF6m79ZhuqABboVYk+cVC2bc8WZqq6xUU94b6AZ9fignar/0/TD3s7UCaMGFF6LLrDRkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dPVYvkiX; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=LgGWGz4U; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Y1EY4222 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dPVYvkiX";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LgGWGz4U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Y1EY4222"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Nf9oS993889;
	Fri, 2 Oct 2026 16:56:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=0e3cqHbYX3mQJW+GNyQWUlG0igRoMXRCsp7Egyc1kjg=; b=
	dPVYvkiXrbmpGRovdcNObqnODULBDx16G9d+QUHk0AGc5mtVUNXD4bIOwHve//De
	hMRf3sjQYbnsGLNw/urubtCqJhhto61hmxI9N5DG+KA/37Xa85Sjr/iwPqf4C2FX
	jOUUvu3Ud2VuD+oCnSOAGFOxZGzG6FSgTySuEvsB2Bg+CzwgqaG/pH76s+tgJNtv
	xdReSo483r+Hpw6jHygZBnyp+OnpuY8/zdqoxpl4/xdaw2W+ZgzalZELRo3YYbg0
	tNcrMjhTvlSbJ4WZyU5K1crnnd8tPycMzq8FelfMOGJZngQ680iT5jKDoFvX46Tz
	R2qZcp1owASNYHKVijC7tw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4h28qynne7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 16:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1790985362; bh=0e3cqHbYX3mQJW+GNyQWUlG0igRoMXRCsp7Egyc1kjg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=LgGWGz4UKcotXkE4bsFqvgkUIjyVAFCBhksM9725A9iC2mYrD2Jia+RG3KOiFuX3w
	 MBnZEmydIN6JqiBMz2UcoIjM8E2HtyflnvBSaZ8eTo+8rrlSLE+UGXiP4UfV7lx/yD
	 cJFSnVHTjQEyMG6ohEtd1vGvzfb0gIY2gwHBNgD0w7cUB2C21hiCS0w3O160C3ztve
	 zzL9cSfqGtMMFQNwhdy6M3zgfDVJIJuMuayB4cpeTvHj5Ye31BbJw5eu4D0JkApBBk
	 C9YEdHCkHnK7zds1vsrv15YPa5rKFPkNyxEYi5Ig0Vs6i369ePlilQ+WNLN2qk2Vvn
	 P3GZW/kZNAX+g==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 23786401DD;
	Fri,  2 Oct 2026 23:56:02 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id D13CAA0258;
	Fri,  2 Oct 2026 23:56:01 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Y1EY4222;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00306.outbound.protection.outlook.com [40.93.12.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 020DC220A3E;
	Fri,  2 Oct 2026 23:56:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kWa8mPHJc4GEk7Oefa9/g0dOGOYAZoPDQkZDQFnlUtNTQ7rpDJvgJ2rL6IONSmyxILK1aaNKVbzh8CuOba89KPRTSeigtTWNRHVNqGH5jhLCJwE2wkvNr0SpXJgSJ4egIJmiRVkSgo7hB+yJXG/4tNYH3P3xhc8XZ8D3gkcqgOfVir/O/WdQaRZlWx6yHMHU9jYl86xBTu488x188fn3AqOIF1ayjjWG+uPuqOGvgMovEMOC75b9VoVicPLITXM/Vsniyo9HADdUqiyFnBC3+0eza5U3Er3/2cnOAt2xLY4nSSRaayRvho53Dn3WVHVdCulFSPNokF13+Kxu57N2NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0e3cqHbYX3mQJW+GNyQWUlG0igRoMXRCsp7Egyc1kjg=;
 b=hl6TT9Zcj8FyJWIu9xggZAvHstLpG3KIDhbgjUAp7Unwg4xHjv92MQEvHgUhZgcNWMmheKLUEgv2xCnxB8FjLmD2iysdzSdRxW5Ct2vh6BPg3bBzhLz4mRA2jmLcp9tPBP4RmSn9fuQ4eovs/oWLQv5QYoZnauR0VQ2Z6VQ+Y61YClWZX+sL6t6rBOXNKSQU3oEzYEl6JhMayUSGLadjFI0ii6n7xk/Wa2/8OcykFFbMLbpo9x5O2rUiNJQlLt6ChDNtoN1qZdlT4cFoxXF2Jr+e1Ef9Obu8DA26YtBuApJ5J/Uu8eRHdYzj9oIxDw/5c2NWVoKbpJqzLEOpIjsgow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0e3cqHbYX3mQJW+GNyQWUlG0igRoMXRCsp7Egyc1kjg=;
 b=Y1EY4222xiPBWCWkTSvsiJd4oc8K9/CKTNig6TxwLyZdfvBCUqzPSknwwr5OBWYRznAmCZ+a7cb7t60/Ah0G4OLxrbhSzu/4sFsFz5aPRfgu6MJIQK5QPaCBW7TQ4q4h3X6u/U/GCJA5Jy+sY+ySc9BzZwPauL/lo9MRYsR+DvM=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by SJ1PR12MB6027.namprd12.prod.outlook.com (2603:10b6:a03:48a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 23:55:53 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 23:55:53 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "fabricioakio@gmail.com" <fabricioakio@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: qcom: Check for L2 only when suspending a host
 with wakeup
Thread-Topic: [PATCH] usb: dwc3: qcom: Check for L2 only when suspending a
 host with wakeup
Thread-Index: AQHdT3WDXselBKVy60uhtkbWhfiMJ7bq8/8A
Date: Fri, 2 Oct 2026 23:55:53 +0000
Message-ID: <asBCjr6vlkQSe1jN@vbox>
References: <20260928-dwc3-qcom-l2-check-v1-1-43c5c6e97922@gmail.com>
In-Reply-To: <20260928-dwc3-qcom-l2-check-v1-1-43c5c6e97922@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|SJ1PR12MB6027:EE_
x-ms-office365-filtering-correlation-id: 74ecb245-fbdd-4e49-cb90-08df20e0b184
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|38070700021|6133799003|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 HTFE7x4toq39d42R0cOlSJXDzhDVwYJ18+KHtMGa8tK5BKi3pDu/LF5KdZCcEK/k+l6OkRweJ0NV/RqOSrWq5NnFA79Vqro2ux1bxF7YuzaFyP5f6Bq61G/W4AK+JBKy6xSC+GJJKLFSCHzYI0NUfFBM1Rle8hkIXMc2GpoHeug8fOqoRgRLnExD++Y8HyQtvADE8AbPKlfNZUlYzybMMGiZDo7Apg1B9fKlcCwNLQx5Uh7zeoCArFVgk3hTJ0/YoruOCmV60wNet3dVAEj2l1Rq6YB724f8U89rw64tcV8CsONg7k6swQY1Cagg2ni+d0rb4IERx5q2NUyEPkiZgSxMsPZflQTto9i1k8lsUbh9rNkvOxDKlfaDt4Tpr4oOG7ImAV07sW3l/2q/Af5W8IkCGz4t3rGDjKr1tGSgHZMQ21e+ByStD/QWOzi8BPbFfeMOYtkiSTfcqzboQPD4oKtzFovg8MVoIrBseun3Gtr9nocwp4+hMnLzx+LwMTIo7wFmZroYMixm/+kDPK7iMDrLjsqQoGcFryszdO/OKLyQ2DK2CugjNVWui8rRe7XLfYdGq4iWC0N9mhrpzALs/OpibYKz3le0vZkVPbpkWYWSrMLFAS8WZG6+8l8gomxqRaUHvr1iQxHR6rAhI9fxXe5QKaA6GpDWfEJPSNeu6DygzUKzd8KGKYTpS0aEqH+tSGVFmA0VYGIUOYRPOj8T0db78xQIwq33kgYc05rY2JU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(38070700021)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NnFmZXJMTUdnaXdqVlRyTkNzV0ovbThnRDFFeXpVTWMvY3p4MmwrNlgwNlpU?=
 =?utf-8?B?OHlyM2lqWEljU2FDRVBLVUZxL0pDeEQxYXR2ZzIzVTA0a1FmRStHVFBONmFp?=
 =?utf-8?B?THAxRmlRSCtUT1lLLzNWNkZ6OElqOE1Way9jQXBmazBkaFppMkVtd2E3cW1p?=
 =?utf-8?B?UExJOVorRTZZNlRzckNoajk1T3kyMWJrMjE0M2Z1RE1sR1BpMHRRYjc0bmVp?=
 =?utf-8?B?aVFMVlZKbTIzSjU5VnZHTFVieWdQOFk2ZDk1dWNTV3FvaTVCbWxjZEc4R3NP?=
 =?utf-8?B?N3dua28ydmI4d0RBbUV6SDExM1lnU0s3ZUQ5dEl1aGhpbjRBZmJHY1N2alBJ?=
 =?utf-8?B?cTZDSXhudEIwT0ZUcXd6ZENxYXpwYnNkdjB4QytXTnR5S2Rrd3lXTERJeGZM?=
 =?utf-8?B?ZGF0ZWJHaDFwa3lMdHRmTEdWS29qUnYrTkVBc1MraEljb0gxOFFrRWpSR1Mr?=
 =?utf-8?B?dDBYVktoT2M0RmlQbXVZVlY4S0pZR3d4cWNOS0NUSFlSeVJoN0pOeXV3QlI5?=
 =?utf-8?B?RWQyWm5jeCtlUnFraEM2NlRxT2ZtdHU1cm1JNmh3dWRUWm1WUjA5d2tPazhp?=
 =?utf-8?B?QVg5RkdpUVRKVmROTFFFZXo1cnVrMGxvN1d2SnhkWWVWYllmWTAvNjN3Vmtz?=
 =?utf-8?B?eXVSWldiMXZ0cEZONXY2U3A4MmN6TFZVSDczWTVERXo0dzV4K0M4cVhRM25C?=
 =?utf-8?B?UlA0Mmg5SlJlSUVtRkMrZS93ZDFxb2x5eDBHZ1RXdlJ3bjJzZ2E5K3NJRisw?=
 =?utf-8?B?U0Y2dlRzQ01hNU5ZdEJWMHdMSG1GRUdweHNlanZSN1JFSDFuaXFRa3FjaHA5?=
 =?utf-8?B?bG96amZoU2RtVW83TTZPQVJ0Vk5FVGtIcVVQUENJQWxncHBLaTZKSE9wWksw?=
 =?utf-8?B?b3EzZCtHcjZ2ZlRTcThGYmZqT2ZUUGNYUWtXK0RoaXVadHkvUnZodm14aklW?=
 =?utf-8?B?RXdKWXBycVZmek1pQ2MrOHR3bDFrMWZuSDdzOHpIKzJMZFhiZllSZVFKRWo0?=
 =?utf-8?B?dmpGZG0zUlhkOXBCc1hYWmx3b1BVNUMrOXJxKzBGNGxqNTVnZkNRYUY4cmsv?=
 =?utf-8?B?TVpvclJSQnlwTWdIc3N4RkN1eFlpam0weHBHK2RGKzFJYlFBMVBzamp5ZUdM?=
 =?utf-8?B?aFpEeEJ3enlkcGZ4YWNkOW1pL09LbkRzc09pKzlVVHgxSDJ2Y2M5VHUvQVZS?=
 =?utf-8?B?M0RTcGo5b29hcTFuREZCcExqZlZOdkkzODlKS1VIV3JoWld6YWh5UVk0L0lM?=
 =?utf-8?B?QjU4NXFNRnludlZVZDZLdENlRXJQTEYzNzZxdWJwOWx1VG43UFVERzBuSytM?=
 =?utf-8?B?Z0hNMGpCUmdKMStiQ0R4YmRWamFtcTZYRkJqYVNOMmFNL0ZnSk8vcU05ZFZB?=
 =?utf-8?B?RWlmUEFMRk5LUlJmSVMxR2I3dnFpTFBjVGxDWjVuTFE4ZWxlb0x0eEE4NUxZ?=
 =?utf-8?B?YW1qamlTYmh1OTB5SStzd21zQmdtY1RWMHFnT3g0Smg2a0pISnJzQ2tWRHB1?=
 =?utf-8?B?THdIQUh4VlNpRVMrYjJoQkNnR3ZubXFSajFJZXZnOHNVd2V5QldDT1NjWmNS?=
 =?utf-8?B?YVE3TjdZd3J4cTJtVFBURlEvWk84ZHJpR2JRbk96eGZHRmpoSVAyVWZUdktw?=
 =?utf-8?B?VDlTMWU0UG9KMTdrZFRkb0x3MWs0dC9QWVhZMGdRK3ZSZkJYR0FWWFVSUTBC?=
 =?utf-8?B?Q0lLeFFCRCtsa2xEMzk2WlJJY3U5aWwvRG1CK0l4K3hLMGFjSlJyMzJYNGla?=
 =?utf-8?B?TWlWQ2dwZzE3cmwwekpqVWJHQzFKQjU5QjdaSGl1anRPOU1XV2FpNExwU3Bt?=
 =?utf-8?B?NnNFTHZCR3pEa1RHRXRHci9ua1M4aUUxcUNQQnlNMGRXUFRBYlgvZE1adlVw?=
 =?utf-8?B?VHB3TmpaREZ1MkR0UFlwdXVnNTFydkZ6TDVlaDVvNVpzT0RZeGcwSDhjNkZR?=
 =?utf-8?B?WHhsQlBUVzJlNHFVT1krTW5qZHNxbVB5QmJzTVdQNElWQmlNdzRWVkVHVk5P?=
 =?utf-8?B?TlhGWjB4dmMvRFNnRlVvSW9mTFd6TXdSKzU1ZTB2MlZ0MnNRbkVMeEpKcWtL?=
 =?utf-8?B?N1hyS1YyNDlTWGw3Q1NlWlAzb0xuLzM0SGFhc1luOE5MYTQ3Y244eEVRV2Vi?=
 =?utf-8?B?S1J1elJmTTNoQ1NqZWdBRlJya1NVWGl5UG5UWWNQSjg2amNVdDhqT3lMTWhq?=
 =?utf-8?B?dUNtRElIelFaNCszVmVWRFd4b0dRZ0lyazRqRG0xZXI3Vlk4KzZOZUxTelVP?=
 =?utf-8?B?YmphbDZPNFBNd1puM1pxejVIY2cwbi9WS2RuUmluckJGSitHSThZK2pnYis0?=
 =?utf-8?B?Uk5HODgvWWROMElGaUt0ZU9ibWN2MGIwQzJSZE9oOW9UQWNicnRxdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5C6AB1B93B6F44E833D77381D61FBED@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	SEwf+RFXr9QSd1OOVFFugBUeVL+u3i+UO5LztiemBEWMcTrsrBpyyzNhJoGtl+1dkZR9b43QaHQAEFR1XH83TpCCw67h/iQm5H1GLJv8mtBy7TdWyMedwzUooBhoNwPhPKCshKi+4LDXe/lkz1xWLHSH009bwBgrfXci/SiLz8hRclCnYULeGZzCsRAeQskfiDVFNblAhFPjFf+X6ujCx1ickCTm+XgNIkhlRb+nx8b2U8ck147U3QBxWsRCU8vOilR30FEVP3jscgUQyt3Z7n3coobvF3qqfVdfSQ8peyG/B9hcFnJfOi/JmPaYRVGXefuhqGrfWHNozzmOFRZOlQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	domdlCRvmjSO5SRxQCJu3vw1Rd3kGpmhBDMR9rnIWswtiqdgyR9KfgGoD7U1wLr3iBbHbafSfTzjhDZXHdEqKn/do+j3zYPWhoOKF3BN2MCfDlX8l/VZ28WkLKWEGO7m4QS/H3Btxn3YEgIwH5XO/TCNS2iTXeZLgVUxp5c7g+9PPYLlYR8UBpVPbAQoamo7ZbTsqntl3QQCnfpI4BlDQojCWx0O9OzKFmZWvmHRK0Fx338+jM3ydY9tml2x5F/8+OiOmtKZJEypYdApnfBkD8gx3g+q0a0oZljhxv3Qp0EttvRU03WM+GxhlEkWFpdhnZwS0UZPcT4fZvTIva6zrzRuKqk9PRmttDvchuXEqMgPcXguDphMl6ZBQOZ6HKwpvvgLICTLIme2VWa+HqouNBTBZYPNT7B3sHQtrOm1FqxBrpMzcsKJaEXxz/A5urPfO4O7eDzC/VMWHn75blqkqTAaPA7UxY2t2PQZ0hMlt7alAc2t+b+jMoJHHCzezh+k96smZqLx5cAd/+dxJl7RakubTX421br3e4Ve1wdRNpBPM9wuYtfXzj3A9YEGf1gG5qAvIcvRSFyUefK+RwuXkeGYRKV/H6cK4QYbfwSm46ZYaG/g0n4MGo1TCHpdLUo/wc9j93+clIy36iFZMBIr3w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ecb245-fbdd-4e49-cb90-08df20e0b184
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 23:55:53.2886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aNigA/Oizauw1r2ZM1uXQ5rnyQ46Ndz9oD3zZivMXMqDwoEsGrqMSIUxFf8rO5F0mgOh/oLOZgxkAnsk7lNTdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6027
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA5NSBTYWx0ZWRfX/65WqdacjwTQ
 n0f9C0XlU11L2y3OzH2o4gF0XKTJHHaqGYCEss7YBfVPColoveIgaJfKAqW8frnxwHP5KAo4xOA
 3vfXZ8OVNQu9A9/jY4py1IS3sVoivqA=
X-Proofpoint-ORIG-GUID: hljTctu-dCmUhGfOIYbLJFGe35NEK3e3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA5NSBTYWx0ZWRfX1MR4svsCPUpa
 99hO07MzL044BqZAaLBCPp3jmAKxJvCiHHDI9MbnB4KaXHpx256ledGvjCFOrOXDNhiUIussREz
 ymnQbXV1s6YrrhQWn//aHG7SbcoiLQfrb9ZY0jQOsB1ELGrFVKiEx5ar8+YM7eaWILSafzFfOg5
 lHn3Gl4Sm47PAQXZfXvIbtd1BUYM74lV/UpCMJjVkSZPhXe+A4DnrF657RoIAs0Hdb14QEcH/LT
 w1Wwm6DOU3ZAJGJHW48Eo2eqO53VHGOPdR4Q9T0MPg35muqdjpfCxe0lnMhqBMLj6pu8yVTSb6R
 wbsh1gMIgHn68LlC7Cn58rvvz0enPU+fVryCkn9BvxN2yIJp9DmkYW0TYdV34GzZa0aa+YJ/I1h
 eMr4HRn2pctTpo+4SvgeARCMZtVFP+ZAwux/Wlfz3L5OJbchlWGF5wtzDKRmWyHbH4PvE2xwh+M
 X85Th3dFXUiyTNNNcNg==
X-Authority-Analysis: v=2.4 cv=Vrm2kO2n c=1 sm=1 tr=0 ts=6ac04493 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=QFNGBFAix9GFkXGs:21 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=qPHU084jO2kA:10 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22
 a=jSPayVjLy6xbsuKauFBc:22 a=pGLkceISAAAA:8 a=jIQo8A4GAAAA:8
 a=8bAhPbq83wmzYvflLKkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: hljTctu-dCmUhGfOIYbLJFGe35NEK3e3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2610020095

T24gTW9uLCBTZXAgMjgsIDIwMjYsIEZhYnJpY2lvIEFraW8gdmlhIEI0IFJlbGF5IHdyb3RlOg0K
PiBGcm9tOiBGYWJyaWNpbyBBa2lvIDxmYWJyaWNpb2FraW9AZ21haWwuY29tPg0KPiANCj4gSW4g
cGVyaXBoZXJhbCBtb2RlIHRoZSBjb3JlIGRpc2Nvbm5lY3RzIGFuZCBwb3dlcnMgdGhlIFBIWSBv
ZmYgYmVmb3JlDQo+IHRoZSBnbHVlIHN1c3BlbmRzLCBzbyB0aGUgbGluayBuZXZlciBlbnRlcnMg
TDIgYW5kIGV2ZXJ5IHN5c3RlbQ0KPiBzdXNwZW5kIGxvZ3MgIkhTLVBIWSBub3QgaW4gTDIiLiBD
aGVjayBvbmx5IGZvciBhIGhvc3Qgd2l0aCB3YWtldXAsDQo+IHRoZSBvbmUgY2FzZSB0aGF0IHBh
cmtzIHRoZSBQSFkgaW4gTDIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNpbyBBa2lvIDxm
YWJyaWNpb2FraW9AZ21haWwuY29tPg0KPiAtLS0NCj4gVGVzdGVkIG9uIGEgTW90b3JvbGEgTW90
byBYNCAoWFQxOTAwLTYsIFNETTYzMCkgd2l0aCB0aGUgc2RtNjYwLW1haW5saW5lDQo+IDcuMi4z
IHRyZWUsIGluIHBlcmlwaGVyYWwgbW9kZSB3aXRoIHRoZSBjYWJsZSBhdHRhY2hlZDogdGhlICJI
Uy1QSFkgbm90DQo+IGluIEwyIiBtZXNzYWdlIGFwcGVhcnMgb24gZXZlcnkgc3lzdGVtIHN1c3Bl
bmQgd2l0aG91dCB0aGlzIHBhdGNoLCBhbmQNCj4gbm90IG92ZXIgdGhyZWUgY29uc2VjdXRpdmUg
Y3ljbGVzIHdpdGggaXQuIEhvc3QgbW9kZSBpcyB1bnRlc3RlZCwgc2luY2UNCj4gdGhpcyBib2Fy
ZCBydW5zIHRoZSBjb250cm9sbGVyIGluIHBlcmlwaGVyYWwgbW9kZS4gVGhlIGJvYXJkIGJpbmRz
DQo+IGR3YzMtcWNvbS1sZWdhY3ksIHNvIHRoZSBzYW1lIGNoYW5nZSBpbiBkd2MzLXFjb20uYyBp
cyBidWlsZC10ZXN0ZWQNCj4gb25seS4gQXBwbGllcyB1bmNoYW5nZWQgdG8gbmV4dC0yMDI2MDky
OC4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS1sZWdhY3kuYyB8IDE2ICsr
KysrKysrKysrKy0tLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMgICAgICAgIHwg
MTYgKysrKysrKysrKysrLS0tLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCsp
LCA4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdj
My1xY29tLWxlZ2FjeS5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20tbGVnYWN5LmMNCj4g
aW5kZXggZDNmYWQwZmNmZGFjLi5iYTNmNzBkZWE0YWIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
dXNiL2R3YzMvZHdjMy1xY29tLWxlZ2FjeS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdj
My1xY29tLWxlZ2FjeS5jDQo+IEBAIC00MzEsMTAgKzQzMSwxOCBAQCBzdGF0aWMgaW50IGR3YzNf
cWNvbV9zdXNwZW5kKHN0cnVjdCBkd2MzX3Fjb20gKnFjb20sIGJvb2wgd2FrZXVwKQ0KPiAgCWlm
IChxY29tLT5pc19zdXNwZW5kZWQpDQo+ICAJCXJldHVybiAwOw0KPiAgDQo+IC0JZm9yIChpID0g
MDsgaSA8IHFjb20tPm51bV9wb3J0czsgaSsrKSB7DQo+IC0JCXZhbCA9IHJlYWRsKHFjb20tPnFz
Y3JhdGNoX2Jhc2UgKyBwd3JfZXZudF9pcnFfc3RhdF9yZWdbaV0pOw0KPiAtCQlpZiAoISh2YWwg
JiBQV1JfRVZOVF9MUE1fSU5fTDJfTUFTSykpDQo+IC0JCQlkZXZfZXJyKHFjb20tPmRldiwgInBv
cnQtJWQgSFMtUEhZIG5vdCBpbiBMMlxuIiwgaSArIDEpOw0KPiArCS8qDQo+ICsJICogT25seSBh
IGhvc3Qgd2l0aCB3YWtldXAgZW5hYmxlZCBrZWVwcyB0aGUgSFMgUEhZIHBvd2VyZWQgYW5kIHBh
cmtzDQo+ICsJICogaXQgaW4gTDIgYWNyb3NzIHN1c3BlbmQuIEEgcGVyaXBoZXJhbCBkaXNjb25u
ZWN0cyBmcm9tIHRoZSBidXMgYW5kDQo+ICsJICogcG93ZXJzIHRoZSBQSFkgb2ZmIGZpcnN0LCBz
byBpdHMgbGluayBuZXZlciBlbnRlcnMgTDIuDQo+ICsJICovDQo+ICsJaWYgKGR3YzNfcWNvbV9p
c19ob3N0KHFjb20pICYmIHdha2V1cCkgew0KPiArCQlmb3IgKGkgPSAwOyBpIDwgcWNvbS0+bnVt
X3BvcnRzOyBpKyspIHsNCj4gKwkJCXZhbCA9IHJlYWRsKHFjb20tPnFzY3JhdGNoX2Jhc2UgKyBw
d3JfZXZudF9pcnFfc3RhdF9yZWdbaV0pOw0KPiArCQkJaWYgKCEodmFsICYgUFdSX0VWTlRfTFBN
X0lOX0wyX01BU0spKQ0KPiArCQkJCWRldl9lcnIocWNvbS0+ZGV2LCAicG9ydC0lZCBIUy1QSFkg
bm90IGluIEwyXG4iLA0KPiArCQkJCQlpICsgMSk7DQo+ICsJCX0NCj4gIAl9DQo+ICANCj4gIAlm
b3IgKGkgPSBxY29tLT5udW1fY2xvY2tzIC0gMTsgaSA+PSAwOyBpLS0pDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFj
b20uYw0KPiBpbmRleCBhYzY4YjQyMThiNTYuLmUwOTIwZGEyODBjZSAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3
YzMtcWNvbS5jDQo+IEBAIC0zNDMsMTAgKzM0MywxOCBAQCBzdGF0aWMgaW50IGR3YzNfcWNvbV9z
dXNwZW5kKHN0cnVjdCBkd2MzX3Fjb20gKnFjb20sIGJvb2wgd2FrZXVwKQ0KPiAgCWlmIChxY29t
LT5pc19zdXNwZW5kZWQpDQo+ICAJCXJldHVybiAwOw0KPiAgDQo+IC0JZm9yIChpID0gMDsgaSA8
IHFjb20tPm51bV9wb3J0czsgaSsrKSB7DQo+IC0JCXZhbCA9IHJlYWRsKHFjb20tPnFzY3JhdGNo
X2Jhc2UgKyBwd3JfZXZudF9pcnFfc3RhdF9yZWdbaV0pOw0KPiAtCQlpZiAoISh2YWwgJiBQV1Jf
RVZOVF9MUE1fSU5fTDJfTUFTSykpDQo+IC0JCQlkZXZfZXJyKHFjb20tPmRldiwgInBvcnQtJWQg
SFMtUEhZIG5vdCBpbiBMMlxuIiwgaSArIDEpOw0KPiArCS8qDQo+ICsJICogT25seSBhIGhvc3Qg
d2l0aCB3YWtldXAgZW5hYmxlZCBrZWVwcyB0aGUgSFMgUEhZIHBvd2VyZWQgYW5kIHBhcmtzDQo+
ICsJICogaXQgaW4gTDIgYWNyb3NzIHN1c3BlbmQuIEEgcGVyaXBoZXJhbCBkaXNjb25uZWN0cyBm
cm9tIHRoZSBidXMgYW5kDQo+ICsJICogcG93ZXJzIHRoZSBQSFkgb2ZmIGZpcnN0LCBzbyBpdHMg
bGluayBuZXZlciBlbnRlcnMgTDIuDQo+ICsJICovDQo+ICsJaWYgKGR3YzNfcWNvbV9pc19ob3N0
KHFjb20pICYmIHdha2V1cCkgew0KPiArCQlmb3IgKGkgPSAwOyBpIDwgcWNvbS0+bnVtX3BvcnRz
OyBpKyspIHsNCj4gKwkJCXZhbCA9IHJlYWRsKHFjb20tPnFzY3JhdGNoX2Jhc2UgKyBwd3JfZXZu
dF9pcnFfc3RhdF9yZWdbaV0pOw0KPiArCQkJaWYgKCEodmFsICYgUFdSX0VWTlRfTFBNX0lOX0wy
X01BU0spKQ0KPiArCQkJCWRldl9lcnIocWNvbS0+ZGV2LCAicG9ydC0lZCBIUy1QSFkgbm90IGlu
IEwyXG4iLA0KPiArCQkJCQlpICsgMSk7DQo+ICsJCX0NCj4gIAl9DQo+ICAJY2xrX2J1bGtfZGlz
YWJsZV91bnByZXBhcmUocWNvbS0+bnVtX2Nsb2NrcywgcWNvbS0+Y2xrcyk7DQo+ICANCj4gDQo+
IC0tLQ0KPiBiYXNlLWNvbW1pdDogNjM3NWU2MWMwMWU5M2UzNWVlN2FjZDMzNmE2ODlhYzFmYWU0
YjUwOQ0KPiBjaGFuZ2UtaWQ6IDIwMjYwOTI4LWR3YzMtcWNvbS1sMi1jaGVjay1lM2I1NWFjZWZi
NjINCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gLS0gIA0KPiBGYWJyaWNpbyBBa2lvIDxmYWJyaWNp
b2FraW9AZ21haWwuY29tPg0KPiANCj4gDQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5o
Lk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5rcywNClRoaW5o
