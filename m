Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A633AAF40;
	Wed,  9 Sep 2026 23:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788997515; cv=fail; b=RUGL+sYi0R3W0AZsCWbhzrsGqJdCYdwfwQk0eIZGh1wBwLFbzEqKd2tg7f90j0ho+ZWFHAk3QU7S0Dlfh2Ldps8k35S23lF2cudZVV6mxLpX36X7k8ZRUnoWbrdtNRaz1vsyf0s4cOhZvlECnbP+Fa8SjjOZB391mSPlPpMCPdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788997515; c=relaxed/simple;
	bh=7Tc+hZD8ypqr0lPY0iYy5zn9gP1rWkSQDwFKcHSaLr8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q6579YQ0sytjJKJyy2PLVsIbSRnppJdNT4y0DKo+KQ2j7oLFOBZe7G3o7JTO7ePsXRX29tdgnh4Hra5NFMQetQCxuiMJeNi6pJYheStMqzxIw/uukCYT0o41x45EHBCyMr3TWXe73AYIUACsE56r7WYcvVid5NeNFa/wPprbZ70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=pX+O0yJa; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DX6pVXMZ; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fgvhnk4G reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="pX+O0yJa";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DX6pVXMZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fgvhnk4G"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689M9SDn806045;
	Wed, 9 Sep 2026 16:45:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=7Tc+hZD8ypqr0lPY0iYy5zn9gP1rWkSQDwFKcHSaLr8=; b=
	pX+O0yJaQxLNt/79w3XpxE/lH70rQ4579Vg8l25cDAGsaO3dQ0NsFagiVvA5e3ZD
	iTZ9heItx1VKTsfp1DjzALiVRHJY3T+jH+0nzUYCcgH2Xqor+QFdXyLn7wfcZ7vi
	6zdFAqylZ9efG992d1q/0jnoaKclmJh/BtVIRJ08qx/ncl3VONw3sRkdsynSNmIv
	ZsNiU+UfH4KpX8n5oM+IokwRfcTINQDHDwtJomq115J70b67lz9q1C9tS73Vu7Gl
	2EU8NVM70Pby39wkEfssrWOK8P3gVxEjJfDQrypsbpxVLkDlybEwZELzDkwF5RtP
	PnLo1CGpqZxmpLf5GLBYCg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4gkcx029ah-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 16:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1788997506; bh=7Tc+hZD8ypqr0lPY0iYy5zn9gP1rWkSQDwFKcHSaLr8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=DX6pVXMZYxs6hGewDO87RlkbJinR/ixux66Rx3KD18AUPv/M45K6jCPvxCWObeyeG
	 y1c1C+eurijFzGd/WXDIxgaDxA1MmZSG5ySi0i/N5hhSo0/Vb9KFrPsLmKPdX0io4k
	 YMdavGqdZijNvLMt4cY2kRjJIdvCVYjnyG6H/FM64VGVL/3APYmiXOVRZgWiV60Szw
	 xgDL/zb7XhLq0d5YGK6678VZ2zMOPXMIzEkgUtYTWq15fBh+630R305xyHrHltivzr
	 K+vqxBQ+Q8QAlQ5ByMlAAnfhpyy76LmlHNWVI5S3TFsSCsaqTOptcjMC9fm8/7rUFa
	 lup4UUk/9tdqw==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5C49C4012A;
	Wed,  9 Sep 2026 23:45:06 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 900CBA0070;
	Wed,  9 Sep 2026 23:45:05 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=fgvhnk4G;
	dkim-atps=neutral
Received: from CY3PR08CU001.outbound.protection.outlook.com (mail-cy3pr08cu00102.outbound.protection.outlook.com [40.93.6.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 757B3406DB;
	Wed,  9 Sep 2026 23:45:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKOJFpXxZyAoMrkAf6hOh9AXgoWLYuwcFzPl14ibDWKhWPVbR2kMrEwsajNo8O3AXk16jNGElxAwscsrCTP0LOR1qkFu3TePKlyLCmpzTPgWg4cheZ3X5Vt+An0OXPBNT7yoiwglsXd4ewLFZMXvwPxEs0l9MKc9QN4MMc+N2fyN5p0hLSE/+MTPJXtmcSnJAzRA6y5cNVeA8SMHvxmmHw1XejWmUqpaZjE5/NufF+YRHBhjH70FCrknodVFKSPBBWWCXkWcbFJWwatqxpRJhS+vaf0IB30LjF3md6X8kZRiQMZFklwet0swopi5cYlkvMx4qctIJ6nM21NsENTRCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Tc+hZD8ypqr0lPY0iYy5zn9gP1rWkSQDwFKcHSaLr8=;
 b=oyp1HdmOYAgcxBQws/380c+TXqsBtmxewmJFp44yyP3GurFM0Ew/cMEuV90ZBw1/T9eIxERGcEIb4VXylACghHvpcAQyuurnUkrBJG/3yb5kFz0OnwWdbzAmUbN25vNBWMbVLfxQKrAm9KV7VfSrEJULOYFjyUaZRyHuyQYlM7bjQdpfKfMlqeOPsiuiVTWFbno82MFdwokNQmE1VjGY0rlMxtXdVuEIEdk7JQxHnkoRB1NDvczAaxRUDD8Iz+nzmAp10fDrP8ny5OoRuAm47LwBd11KzZnOo4a6BmbffyXCXPDlQ7MyewcooSlA/Mp4yUpwWdjHryLpXskLP/R1xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Tc+hZD8ypqr0lPY0iYy5zn9gP1rWkSQDwFKcHSaLr8=;
 b=fgvhnk4GCKX2AID8HzGagz6hoOYxhrm1ZQHgc4g2EhNIN1+Dny0+++qSLxDmTtb3TlGzKaLl4luKAsQoMrNNwUGvcfTAPxdAMna9xIMPTQZbtVExFaiROFJOZa9EuDAr8sP6HP7pX719h9Kj2Fx8nAxaabaqz4jZMl/aew0Gh60=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by SJ0PR12MB6807.namprd12.prod.outlook.com (2603:10b6:a03:479::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 23:44:40 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0406.007; Wed, 9 Sep 2026
 23:44:40 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Val Packett <val@packett.cool>
Subject: Re: [PATCH] Revert "usb: dwc3: qcom: Add support to skip phy
 management by USB core"
Thread-Topic: [PATCH] Revert "usb: dwc3: qcom: Add support to skip phy
 management by USB core"
Thread-Index: AQHdQECBROkkguUN006QY+l7J3LsS7bG6dqA
Date: Wed, 9 Sep 2026 23:44:40 +0000
Message-ID: <aqHvHR5EEHb1FSx3@vbox>
References: <20260909-xhci-fixes-revert-v1-1-7cc97fa0f307@oss.qualcomm.com>
In-Reply-To: <20260909-xhci-fixes-revert-v1-1-7cc97fa0f307@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|SJ0PR12MB6807:EE_
x-ms-office365-filtering-correlation-id: 3fef661a-5710-4fea-056f-08df0ecc50e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|4133799003|56012099006|11063799006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 0KZfiHHrSZVMr2VCs8oKaEXei1ueyBaNEWnaS3IMvRe/GM/rFQUc5zTVXRyMsXhGhWvflv+uVI+hUF0CieTmjdekyeUPtqs62T577SqZcwDWdgbXDkBaZpTlZq6j3eA9tTJccSJRR9gOuy5ydwtkaPx0owFSW2owLKosGngfMbKhO3zwmuKplF7hlbfFNOvy58nfNibLluf+wtdvpLcqIcWpGp7sUC6vjihaKYxQJWS+Ci13yZiEoTLMRYS/8Jp1R4eBDH/ig1BIagTutYCLbZZgqhWN89NndcU46VZDlW0lkV4BLPAArcdc69BeEg6nE03O5oOTtxJq2PBARdhLY6jBuoLpdQr/wYl2Kw7FyPHRvSgehGj0aRFAw9ur2WKFGj+e9s9XjVew0oI3foh4NEeWBj3nCx/KUrvVNzk7xEWyK/S/jdwlq20U93jQ2MPjs8ypO5XQ1HY/mjm+WrOcRuTDku0XoRLNRtVz0B2C1NbuVNbglXaElo6VkSoL9SEyN4+XyhZzuJwlfX1KlqVF+1VhCk+oIJBWERjB0SYF5rt/TJUxekh6HvTMTAnFblsp4RzKvln/36wKd6VuPHyJaecFyoNI0rHMlQZlK1lkVGnjNpOB8vY9qkjaWxKrVcs8rwpYBA9/56J2E9XxXzx3ut1NvTvwi7SEaQ6RwUbxKiG/k45xx72rFsgyrqzWqRftJGKYId42B7qJius6zsaohqG6maFZjyl4rBl/VeAK3NU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(4133799003)(56012099006)(11063799006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?emZPWlZ4djVXbjA0OEU4czZHUmc1bUgrZXEyR3NscE53SncxNnN1RjZkbGdW?=
 =?utf-8?B?eHZNclFZbnRVVzB6OE9HR1JuMndYS25hWEVUSG9RdS8vaE9SNnVvVm9OZzRM?=
 =?utf-8?B?MGljeFdsaytIeUV1N3JDYzRTa0ptQUZRVUdxdFNxUlBNakNidGpNR0hkeVhq?=
 =?utf-8?B?dnV4VG9mMHZhZTdUK0RCTjNLalFWRXd2aXY1OWFPWnM5UEI2VzV3dUJvOEtE?=
 =?utf-8?B?MFYzekJ3WVVYSGZacS9ET0tOU3FVVFFqTHp5MW4wTkFOWXBGK2VkR21tWkpq?=
 =?utf-8?B?dmtBZUFTU1lMYWRlbzk2MnBuQm90Z0t4RHRGY0k0ZFcxQVVlU0dzT0VIL2VG?=
 =?utf-8?B?V3hzWmNGQ09DZVN1THJhN3dTYlk4Zll3QmRFMDY1bE1rczVYWGpheTNIelFB?=
 =?utf-8?B?blIxOFdqS0RxN0plL0pIdWVrVnpNNTVYNFFDaDN0WVVRQ0dvVDZZRlZhbG1l?=
 =?utf-8?B?MUhpSzVDNXJBNldOQ3JOWklqdCtURjBpUHJnUVVXUkQwNUNQT0xMZ24yS2pO?=
 =?utf-8?B?b2xwSmpFb01LMUU0cnBWZHRPakZmZzF1aEl4eUh3R2ZLRWhKajJpK3Z0Kyt2?=
 =?utf-8?B?a0J4L3dxdkZOSDdZbVNSRmlIb0lZLzVaaWYwT2Y0Slk1SW52Yk9ndjRBb3N1?=
 =?utf-8?B?N2NrS3dFTEJxaEdHRXZENlRGOWRrTUt2VEFTMnNyODd0c25GQVJNMVZwaFlR?=
 =?utf-8?B?bnorcENycE1TcC84djcvQy8wbzN5YmhSNVNUMG0rdkxjKzFQUFc2UjVCZVhr?=
 =?utf-8?B?VXhuTXUzYnRLTEdyNEJQUjQ2R0R1WmI5eUdpenNOeFhPWG43TWR5eDBQZzZK?=
 =?utf-8?B?NmFGbWRXU2hmMmtZVkxVZWwwRXArQWFRRHhvTmY4YWFkVW5MenVJdGVXMWww?=
 =?utf-8?B?M1pSUnVkZlZzMm54NTJFRnhqTldXN1hnY2dFWGdsb05peUtNUnhHdkxXUk9l?=
 =?utf-8?B?TkRSSDUrMzhMTnFYOHlwQnJmUS9PUVhiQnN2MHVkTlQ4RkhPQ1NuaXpkSTVx?=
 =?utf-8?B?TDdsdkJTQkZyby9mdUd2R3VWYkd2OGVWL1lncXFaT29wcUF4UFlqMnd5bFln?=
 =?utf-8?B?d0h3SXdyRlFubWZXMVNaMTZVNWhkVngwQ1ZWWHN4YkQ3Qkx6ZFZwbXkzUWdT?=
 =?utf-8?B?MXVPOU5pMlpWTTQ4U21uaUl4eHd1ZlNmVTIvcGlLUDFReVVGODdRQ3lUSG0r?=
 =?utf-8?B?bU1ieEhpOVJoeFpGaWZBV3V3enR2c1BEZ1VYcy9JMTNUNkczK3ZodSt0bjJv?=
 =?utf-8?B?ZmpzMFJObW4yMG9ZQ2FlUkZOeWd5L3J5V0xaV2Z2VUpMamtoeEV1VlJmc3A0?=
 =?utf-8?B?NUd0Z0VyT2xpSGlZNnA5QTBudHFtbmtjOUtsdWFSdC9yT1lFdDJGQklqcEQw?=
 =?utf-8?B?eWVOQ1pGdEVCOW5xNElTNGswKzFyZldHR3ZIS09lVHFsUVZnQjgyT3JUNXRM?=
 =?utf-8?B?Z1JwcnlMSGpZLzZCZGY5NDJWUUVRZDkvUFhWTytvUUpBVVUxYzBLNmlqS2xO?=
 =?utf-8?B?NXlJeHNMUVhoZzdnRmU4NkZCL3NtUkRFeENXQ2ZUdlY3ekUyWmpucG1jYmd5?=
 =?utf-8?B?dVFHYmgvaElQZGdIb2lWUHpXcFZUVDRlTzdXOVVSWmVlQmtwNnhUU2h5RlU2?=
 =?utf-8?B?REZVWUlqSytONE9tZDJUZEorMHJPL0JqN3FKVlJ6aFNvK1BBRWZPeTYvY2dZ?=
 =?utf-8?B?NElDc1haWTJyNFVkRGZOR2FEb2J4dnhmbGVLc0FpYldQQ20rVGV5VGJnWWs5?=
 =?utf-8?B?YmVKam1kVE10eGhxU3ZsWFFuSXllQUwzRVowSTN1eGJlYlF5eDByMnUrRmtm?=
 =?utf-8?B?dSs2R0k5SGQxbVV6eVE5V0hkYlFIWFVDUUtabHRQdytMdXoyZDNUSFVwa3NG?=
 =?utf-8?B?YUdFdzhHREk5RHpYU283SWhLOG8ydEpKdDM0YTZWTkN4MXp4VXNZdE11SkJo?=
 =?utf-8?B?cUFSaXA4dDdmaHVTU0dYMU53ejk5NU8wR0N1b245ZmFRaFZSRmswOXFYUGwv?=
 =?utf-8?B?QkZwSDluTDBvWEhwSE5rQ2FYekJ1RUl2NVpXTitjZlJtamt3eU56cDVUZGZQ?=
 =?utf-8?B?OFVyK2FWV0xxc1lPeTVhNlhFdSsrZk9PVGp3SFBjY01OcE1CclovVVNjWW5k?=
 =?utf-8?B?azR5azFJVjNwY3Fjb2V0RGdBM0pvaFVHTytmanZRNHcvWDQ4anBnWW9TaCsy?=
 =?utf-8?B?VVhrTytYOFRVaUlGejBKdlFnUE42NDJEWVk4aDV1UnpYZ0EzYTFndlhhdUJY?=
 =?utf-8?B?UHlLSTUwL1czdXQ2dlFGOENUaHVpZWRaZjlpOVRyL3RROFUxNlR5Y3VaSTdk?=
 =?utf-8?B?U0NTS2xRbys1ZWVzdDRtWlZrVTJTOXh3WXhLY2hXeUc0MUlDNVRGQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE122EB92C3EFE4C88EAF5F7E7B29ED5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	pDrCjim/TvUfwOwfOmCYYvDtcPK2njiSNS3PyTrYsQykFUPWKMq25+dfZ0yITTp8JzMC5PwuNqsx9lgVE27aI+0FRK2TOq+krOGrxVF/vl6QzIbID59o/KNHU0Gj+zjwbYYGlMKQ/3dz1LkATVDVkuXcbNhDRKThtc8+xZYEyUL4rEBYxsdyyXcA9oyNchHLDm7c6jjlB1FPnJcRaCo+vEAyk7qh/SyKNzfBOiFWrYoEallPmfqdOOvFusuWlAtbbxNzdEUy/DJtwBhu8SZP3WF4bYH9kXb68OhxG8d82O0TmwRrJAiovDCsUkQS7oe9AVu0NrXHItouYFzcQmA6Mg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8TZMZBZEUpnh4zzpohAXfn6cOFW4NkdlJ6Xxzdt1M9cyrflYBtz6akVdTtDCHgSphAMa/7QRY0DPseIUrdGYgTYzEKQI7pB9r8YcgWQL3SuiEsALE+EEThuEV9DhJ9I4Y0a1/c9LAovVbrDVO6xMiEGIhe89TKWpout5HRF/6RWfTNNcuKgDro9RbDSD6up3r4wCTkWRUgkE2RDk/NqRfJnzwq/gapOUxPFBge5bo8yVLphtt2orHvYI3rzCu6JLFxIetRcZPjc/C+DpP5pz7PJnBuJ84n0qYRuqeufYTFSXDskfBBCJI+YJ16JxbP7EoKO4xw0o7YOXuO6Cu27EIhN1OtAmx5dSd16MLm/LEl8Sgj+tjGFGx6WJWUEpq2m3TFdoO2R9ZotFct7mqRTXOga5BOgSeHXGWI9hOz01hibW/Zd746xSpH0kDqZUXAuBhJ1MUSGW5bJlaRenFXJShsn2Z5yb1kg8q0fRG2tWZObN4LpsBQAMh03HKGDXfIUfC5VwoUy5uHEip+SrQTUWcGL+sO2KaiiI1i5K3CiY0HuAvBA/fcmQmGC40y1MYFvdAw15K4n5L6OQ0pHUR7ajtmPRzMKUBb0pdZn5OZTKAwZWOtX6ctOwm7JxdJxfS3y2xR22DyEe72tbulyJmJiBtQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fef661a-5710-4fea-056f-08df0ecc50e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 23:44:40.2672
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mUS628BxLICLTNR2YE8Lk2dR/UhTct3qJWyIrxU1z5qp7pzNCAmvROcRzEbVt7/C3B1UD8G3FvZQwh8Mnd5k6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6807
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI2OCBTYWx0ZWRfX4zeWmMkO8bgK
 h1F9cGBNnes6ZlRHmLrodUpNCIJPYAM08+yMzhwItBiOZqqmgR9alht51UnQ4Z42hi9zH5LtPeZ
 wMDaVe2z1U0v7HRoINcVLgyylMwSjpU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI2OCBTYWx0ZWRfX0u2Ix3WSuDAt
 UjNAO7RQ7ro38h1XSdG16zk361gTC3sjCQITk/I/sEwJFhHZ+y72+vz2gMm/eUGs8ghPrhqIIO4
 c7kc67pV/vSYqqL1ULGwzzdxKj5MqiSJTs1EEIyaYr2EhACebC+w4yC4CNuC75Horaqh4YRLzcS
 NZkYjg2da7cOD9JGRy3VP4nWNnCeFAPIRGj6k11q8AyL9G983nNM/90mfBQz6vLx2cdzSKtA2XZ
 isO+v0VAG8I97LEzAKsxnuVwzbLbpvKy4mmItNeWJyiU5tPrrtmTAP2SYTECT9X8ZmLabI+b3Mf
 Kz9sbfu7OS38dMVPoEME8zcZasyBOnq0w6QpvRvNICt/8kTKvKBY9kVpaSP2/61Rz+NU4xI7Pxy
 +skmVRBDTux+c1uHf8+56IP5ezQM/FFFfrUZZRCEDxzubm+ey2KNc91pNkhs2KNv18rrhv2lQM7
 dh5sAkyKvXXrBq11wBA==
X-Proofpoint-GUID: KAhCP9olc73MLjjRJRv45Af4mlVt3wgO
X-Authority-Analysis: v=2.4 cv=MuDHeGae c=1 sm=1 tr=0 ts=6aa1ef83 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=18rzLyZ0tFcJ6Np8f_0A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: KAhCP9olc73MLjjRJRv45Af4mlVt3wgO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609090268

T24gV2VkLCBTZXAgMDksIDIwMjYsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IFRoaXMgcmV2
ZXJ0cyBjb21taXQgYmU3YjFjNjhjZDNlNGZjMGY1YTRlMWI4NTY5NmRlMTA1MmYyMWYyZi4NCj4g
DQo+IENvbW1pdCBiZTdiMWM2OGNkM2UgKCJ1c2I6IGR3YzM6IHFjb206IEFkZCBzdXBwb3J0IHRv
IHNraXAgcGh5IG1hbmFnZW1lbnQgYnkgVVNCIGNvcmUiKQ0KPiBpcyBjYXVzaW5nIGEgcmVncmVz
c2lvbiBvbiBxdWFsY29tbSBwbGF0Zm9ybXMuDQo+IA0KPiBEdXJpbmcgcm9sZSBzd2l0Y2ggaXQg
dGVuZHMgdG8gY2F1c2UgdGhlIGZvbGxvd2luZyBjcmFzaDoNCj4gDQo+IFsgICAgNS42MjA5NTFd
IHJlZmNvdW50X3Q6IHVuZGVyZmxvdzsgdXNlLWFmdGVyLWZyZWUuDQo+IFsgICAgNS42MjExMTRd
IENhbGwgdHJhY2U6DQo+IFsgICAgNS42MjExMTVdICByZWZjb3VudF93YXJuX3NhdHVyYXRlKzB4
ZDgvMHgxNDAgKFApDQo+IFsgICAgNS42MjExMTddICBrb2JqZWN0X3B1dCsweDExYy8weDIzMA0K
PiBbICAgIDUuNjIxMTIxXSAgc29mdHdhcmVfbm9kZV9ub3RpZnlfcmVtb3ZlKzB4ZGMvMHhmOA0K
PiBbICAgIDUuNjIxMTI0XSAgZGV2aWNlX2RlbCsweDFkYy8weDMyOA0KPiBbICAgIDUuNjIxMTI2
XSAgdXNiX2Rpc2Nvbm5lY3QrMHgxZDgvMHgzNDgNCj4gWyAgICA1LjYyMTEyOV0gIHVzYl9yZW1v
dmVfaGNkKzB4MTAwLzB4MmE4DQo+IFsgICAgNS42MjExMzFdICB4aGNpX3BsYXRfcmVtb3ZlKzB4
OGMvMHgxNzANCj4gWyAgICA1LjYyMTEzNF0gIHBsYXRmb3JtX3JlbW92ZSsweDI4LzB4NDANCj4g
WyAgICA1LjYyMTEzNV0gIGRldmljZV9yZWxlYXNlX2RyaXZlcl9pbnRlcm5hbCsweDE3NC8weDI5
MA0KPiBbICAgIDUuNjIxMTM4XSAgZGV2aWNlX3JlbGVhc2VfZHJpdmVyKzB4MjAvMHgzOA0KPiBb
ICAgIDUuNjIxMTQwXSAgYnVzX3JlbW92ZV9kZXZpY2UrMHgxOWMvMHgxZjgNCj4gWyAgICA1LjYy
MTE0Ml0gIGRldmljZV9kZWwrMHgxYzQvMHgzMjgNCj4gWyAgICA1LjYyMTE0M10gIHBsYXRmb3Jt
X2RldmljZV91bnJlZ2lzdGVyKzB4MzQvMHhjMA0KPiBbICAgIDUuNjIxMTQ1XSAgZHdjM19ob3N0
X2V4aXQrMHg1MC8weDcwDQo+IFsgICAgNS42MjExNDZdICBfX2R3YzNfc2V0X21vZGUrMHhhNC8w
eDM3OA0KPiANCj4gWyAgICA1LjY0NDUzNV0gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5n
IHJlcXVlc3QgYXQgdmlydHVhbCBhZGRyZXNzDQo+IFsgICAgNS42NDQ2NTddIFdvcmtxdWV1ZTog
ZXZlbnRzX2ZyZWV6YWJsZSBfX2R3YzNfc2V0X21vZGUNCj4gWyAgICA1LjY0NDY2NF0gcGMgOiBf
X3BpX3N0cmNtcCsweDljLzB4MTQwDQo+IFsgICAgNS42NDQ2NjhdIGxyIDogc29mdHdhcmVfbm9k
ZV9wcm9wZXJ0eV9wcmVzZW50KzB4NjAvMHg5OA0KPiBbICAgIDUuNjQ0Njk3XSBDYWxsIHRyYWNl
Og0KPiBbICAgIDUuNjQ0Njk4XSAgX19waV9zdHJjbXArMHg5Yy8weDE0MCAoUCkNCj4gWyAgICA1
LjY0NDcwMF0gIGRldmljZV9wcm9wZXJ0eV9wcmVzZW50KzB4OWMvMHhjMA0KPiBbICAgIDUuNjQ0
NzAzXSAgZHdjM19nYWRnZXRfaW5pdCsweDIzMC8weDdiMA0KPiBbICAgIDUuNjQ0NzA0XSAgX19k
d2MzX3NldF9tb2RlKzB4MzE0LzB4Mzc4DQo+IFsgICAgNS42NDQ3MDddICBwcm9jZXNzX3NjaGVk
dWxlZF93b3JrcysweDFiOC8weDUzOA0KPiBbICAgIDUuNjQ0NzEwXSAgd29ya2VyX3RocmVhZCsw
eDFmYy8weDJmOA0KPiBbICAgIDUuNjQ0NzExXSAga3RocmVhZCsweDExNC8weDE0OA0KPiBbICAg
IDUuNjQ0NzEzXSAgcmV0X2Zyb21fZm9yaysweDEwLzB4MjANCj4gDQo+IFJldmVydCBza2lwcGlu
ZyBvZiB1c2IgY29yZSBwaHkgbWFuYWdlbWVudCBmb3IgUXVhbGNvbW0gcGxhdGZvcm1zIHRvIGF2
b2lkDQo+IHRoZSBhYm92ZSBpc3N1ZXMuDQo+IA0KPiBSZXBvcnRlZC1ieTogVmFsIFBhY2tldHQg
PHZhbEBwYWNrZXR0LmNvb2w+DQo+IENsb3NlczogaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9f
X2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9mOTkyNjIwMy1lZTY5LTRlMTgtYjZjNy05NTI2
MWJhMTA4MDdAcGFja2V0dC5jb29sL19fOyEhQTRGMlI5R19wZyFadXd1T3pYTHdtLXBhbW1IbnJq
SnBmT0RZTEw5S0xndW00UGlQZEltdENGNzcya2h1VzlqeWNRVzRIMklWWnNNeFlpSVk1MmpmVElm
eC1EZlhLVUE0aUJlTDNOYnB0Zm5sY3c4X0EkIA0KPiBTaWduZWQtb2ZmLWJ5OiBLcmlzaG5hIEt1
cmFwYXRpIDxrcmlzaG5hLmt1cmFwYXRpQG9zcy5xdWFsY29tbS5jb20+DQo+IC0tLQ0KPiAgZHJp
dmVycy91c2IvZHdjMy9kd2MzLXFjb20uYyB8IDE1IC0tLS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDE1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNi
L2R3YzMvZHdjMy1xY29tLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jDQo+IGluZGV4
IGJhMjZlNjFkZjkxNS4uYWM2OGI0MjE4YjU2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9k
d2MzL2R3YzMtcWNvbS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4g
QEAgLTE5LDcgKzE5LDYgQEANCj4gICNpbmNsdWRlIDxsaW51eC9pb3BvbGwuaD4NCj4gICNpbmNs
dWRlIDxsaW51eC91c2IvaGNkLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvdXNiLmg+DQo+IC0jaW5j
bHVkZSA8bGludXgvcHJvcGVydHkuaD4NCj4gICNpbmNsdWRlICJjb3JlLmgiDQo+ICAjaW5jbHVk
ZSAiZ2x1ZS5oIg0KPiAgDQo+IEBAIC00MjAsMTYgKzQxOSw2IEBAIHN0YXRpYyBpcnFyZXR1cm5f
dCBxY29tX2R3YzNfcmVzdW1lX2lycShpbnQgaXJxLCB2b2lkICpkYXRhKQ0KPiAgCXJldHVybiBJ
UlFfSEFORExFRDsNCj4gIH0NCj4gIA0KPiAtc3RhdGljIGludCBkd2MzX3Fjb21fc2V0X3N3bm9k
ZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+IC17DQo+IC0JY29uc3Qgc3RydWN0IHByb3BlcnR5X2Vu
dHJ5IHByb3BzW10gPSB7DQo+IC0JCVBST1BFUlRZX0VOVFJZX0JPT0woInhoY2ktc2tpcC1waHkt
aW5pdC1xdWlyayIpLA0KPiAtCQl7fQ0KPiAtCX07DQo+IC0NCj4gLQlyZXR1cm4gZGV2aWNlX2Ny
ZWF0ZV9tYW5hZ2VkX3NvZnR3YXJlX25vZGUoZGV2LCBwcm9wcywgTlVMTCk7DQo+IC19DQo+IC0N
Cj4gIHN0YXRpYyB2b2lkIGR3YzNfcWNvbV9zZWxlY3RfdXRtaV9jbGsoc3RydWN0IGR3YzNfcWNv
bSAqcWNvbSkNCj4gIHsNCj4gIAkvKiBDb25maWd1cmUgZHdjMyB0byB1c2UgVVRNSSBjbG9jayBh
cyBQSVBFIGNsb2NrIG5vdCBwcmVzZW50ICovDQo+IEBAIC02OTQsMTAgKzY4Myw2IEBAIHN0YXRp
YyBpbnQgZHdjM19xY29tX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJ
aWYgKGlnbm9yZV9waXBlX2NsaykNCj4gIAkJZHdjM19xY29tX3NlbGVjdF91dG1pX2NsayhxY29t
KTsNCj4gIA0KPiAtCXJldCA9IGR3YzNfcWNvbV9zZXRfc3dub2RlKGRldik7DQo+IC0JaWYgKHJl
dCkNCj4gLQkJZ290byBjbGtfZGlzYWJsZTsNCj4gLQ0KPiAgCXFjb20tPm1vZGUgPSB1c2JfZ2V0
X2RyX21vZGUoZGV2KTsNCj4gIA0KPiAgCWlmIChxY29tLT5tb2RlID09IFVTQl9EUl9NT0RFX0hP
U1QpIHsNCj4gDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDogMzRjOWM1NTE3MDMzYTc0MDM5YTU0ZGZh
YjI0ZTdiZjc2N2E0ZTBlNA0KPiBjaGFuZ2UtaWQ6IDIwMjYwOTA5LXhoY2ktZml4ZXMtcmV2ZXJ0
LTU5ZTY4ZmUzYjY0MQ0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLSAgDQo+IEtyaXNobmEgS3Vy
YXBhdGkgPGtyaXNobmEua3VyYXBhdGlAb3NzLnF1YWxjb21tLmNvbT4NCj4gDQoNCkFja2VkLWJ5
OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5rcywNClRo
aW5o
