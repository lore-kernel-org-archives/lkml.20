Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com [34.218.115.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769FD2EA480
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=34.218.115.239
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231158; cv=fail; b=e08Z1mkYzdOEBzLk9NPYmje5jjS9bWZn25DuJ4B1WSnGt+pChmzk6jnVeBewBbpOcgl8CigLZEU3WQVAzFTsfGkZKlki/9ncDPHOje+NQ4ttoGnbFtwmaXklZb9eigFSPyYNT5Zf1zu/ouZyc7PEFviGE2HM2AMmJWav1rochlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231158; c=relaxed/simple;
	bh=n2PEfmZGW9hPLazGC+WyQU/ahXEbNmWpOLMamzwjGn0=;
	h=Subject:From:To:CC:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WecB4sX5iIfPlHU5qrrAvyK3fdfncMyHs5Nvu6cXiLbRf+JN6t8MBL/aDVLBeq8vOjLom7MPM1pwn4x6Q6eHfTmKOv2QfGyWA2CeE8noDpkCbRvxfAoF6j1L8VlyqAz9Qf0pEGKrRd3+SHzs0F/XVIewQw3WHcDm++5XppSTld8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=rBhtgKie; arc=fail smtp.client-ip=34.218.115.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="rBhtgKie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791231157; x=1822767157;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=n2PEfmZGW9hPLazGC+WyQU/ahXEbNmWpOLMamzwjGn0=;
  b=rBhtgKieZ4tfhgCZosVcYZieC1+TFiQdG+8SDlrmteIjt/LPaV8L9IaZ
   QjU5HFwPawgygke0huHK+Hbf9CNk113aLO8YliVWIbn6BkwlJnNKiO38q
   1JY35fdyX2mXAP9FBGz2DNlp77kb/6C4rokoFA6UBX8AaqV5u0Yj+Du9m
   n1xkOjre7IjXmGIeP0fk6RKMxhBAg2C/q83yoNB3pMfH2cnws41kjJm92
   ydJJmQQ2vI7ReWBjCZEIdXQ7zGwMqs3VB3eKnsEIvwjSGUPamElc2MPuU
   Gt/kJ7UP76+RiLxgGzgWyW+dbvNAp23LUqzgctKqyAAo4vcZUYESYHit5
   g==;
X-CSE-ConnectionGUID: JGojtNYESpqiZQP03tZvuQ==
X-CSE-MsgGUID: xoM5981WRKqZwQOZHIjQcA==
X-IronPort-AV: E=Sophos;i="6.27,142,1787011200"; 
   d="scan'208";a="30254758"
Subject: Re: [PATCH] genirq/proc: Fix missing CPU header in /proc/interrupts
Thread-Topic: [PATCH] genirq/proc: Fix missing CPU header in /proc/interrupts
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 20:12:37 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:2461]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.153:2525] with esmtp (Farcaster)
 id 44db21e0-bd75-4843-89f9-6396f03a76d7; Mon, 5 Oct 2026 20:12:36 +0000 (UTC)
X-Farcaster-Flow-ID: 44db21e0-bd75-4843-89f9-6396f03a76d7
Received: from EX19EXOUWA002.ant.amazon.com (10.250.64.216) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Mon, 5 Oct 2026 20:12:36 +0000
Received: from EX19EXOUWB001.ant.amazon.com (10.250.64.229) by
 EX19EXOUWA002.ant.amazon.com (10.250.64.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Mon, 5 Oct 2026 20:12:36 +0000
Received: from CO1PR08CU001.outbound.protection.outlook.com (10.250.64.206) by
 EX19EXOUWB001.ant.amazon.com (10.250.64.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49
 via Frontend Transport; Mon, 5 Oct 2026 20:12:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+X15LDavx/NGBSmQN8y/0FZQmg+3NIGVlxTBI+uZKkP/xgtv4YdaolNq7WspA8hwJVsXCEXITtCRDbroOktR2BpLyKsy8nISYMBzkwUzrPbxJZs0ra0f2SexfkMdRSsTS2wjCYH/5XwzkRGS5bid2Y/N21Dt0Ng6d+Zbm7BErXZw87yPQ/yZO/oZJz2uSSwTZCK0KGxYeIcf96KGkoSQfWlYhxvLWdeB3jJWyNudFnreEs8IBuv/VlqV2O7Aex0NoUG8fGqjgP86gcY/CPpIlhDnZa4VIj4ypR2l5Je6GuhXUcnvyyyI/Cewv8jixuK2HML6XyUA0D8xMrbTxtSvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2PEfmZGW9hPLazGC+WyQU/ahXEbNmWpOLMamzwjGn0=;
 b=T6y0+jwMe2lNMW1z6fHxCdLrzpO8xTOBPF2HRikKeDH7vwrH4kk+3pSNfFJXfjqqIQcoicP2SG95gn8IwHIbbq6u2cspvE+DVFyROug7SUDnj/j42RGKj7vLwqManj8CQKgRDz4MlF1loOtXOZsDgJergWWOkxsFLDdJfF467dY/oj2k/ajZoai4teKkBJnHibcU6Y68Dun4joKrld5DdYeChAGLXwSHZrUvIADMre7KKlwWF4yT+qjRB3Iz6345CvWsHJudBc/1H35sdxrKfad1xATDnRgyCMv1gtVMpc5M6hj3IWNCnGJayc5nlRwg7H57QOTPRmVtivap1UAFmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from MN7PR18MB660231.namprd18.prod.outlook.com
 (2603:10b6:208:5f3::23) by CO1PR18MB4699.namprd18.prod.outlook.com
 (2603:10b6:303:e6::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Mon, 5 Oct
 2026 20:12:32 +0000
Received: from MN7PR18MB660231.namprd18.prod.outlook.com
 ([fe80::97fe:4c12:b98c:3b70]) by MN7PR18MB660231.namprd18.prod.outlook.com
 ([fe80::97fe:4c12:b98c:3b70%4]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 20:12:32 +0000
From: "Okanovic, Haris" <harisokn@amazon.com>
To: Michael Kelley <mhklinux@outlook.com>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>, Dmitry Ilvokhin <d@ilvokhin.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Thread-Index: AQHdQhvpTXj4uWvh7UCW09xtood/NbbZ1RcAgBWxmoo=
Date: Mon, 5 Oct 2026 20:12:32 +0000
Message-ID: <MN7PR18MB6602317E0C3F1E7C35356B0307A8962@MN7PR18MB660231.namprd18.prod.outlook.com>
References: <20260911-dev-harisokn-proc-interrupts-fix-b4-v1-1-f9ff208efcfa@amazon.com>
 <SN6PR02MB415743EDDFEB5B52EF1DC698D4832@SN6PR02MB4157.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB415743EDDFEB5B52EF1DC698D4832@SN6PR02MB4157.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN7PR18MB660231:EE_|CO1PR18MB4699:EE_
x-ms-office365-filtering-correlation-id: eb32d1be-31c2-4649-6240-08df231cfd55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|38070700021|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: RSVPCejQ5xgcstO97FZMUAFzsGyIZxkpXqjpqfsGDuDvyh9GcMtfCalXF3/DPruizkJ6rD6DUlrMgfznASZyWzDXQEh0zUIFzZHrY0xkDCMaeVgc6d+aJ/IImDt/MYGpI2iD+VwEMeriacjyueq1fmioXBAHhxxmmAWd6+TiijlNz9LUTMSYr1XvTeQTEo21T4uXCiYGUxzTeNkpO31sCF+dMEl9Kbm1H0sGA+8Mmeg8B3e7EkBQls/zpPGjKK6LC2ZvAWUhk7TNP9SrWlSQNnMZEkgqVKa2+rOkwyNdp/KDL+OiiMuCzJqmr0ARcAgBqIu18hTD7TtV8jCrG4y0bc6ozVqCc5+VaLNU0lKQNtavu+h5IYvxWrHqJCqoacJXo/BmqsOy2cXbjCZyj+U6f0HgIdrYo6+uOzTSbJaj+LmS9XE1GuBpBvJ/w88c7ICTPZyZaQUn0beInkyn21FftFcMXXguvharZ2OLscRtq+aNYqCAijwT1dXfXf/T5b2Qmzm2MqbTx1+hoEYTiWYg1bgDimr7qzUcMs0YsaDIZQuvRJBmSPH/WIpUyMi67T621OZz4kIZZ8c0yn4USeXQzqrUJYIPmlPQrj4/1UOxznt8e9oI84iRvO91ThpU0MqR2Cf8pwwcKq1R0nTcwA6M0flxnOBKhxBssWqzr6RrpE0ahymdbm8mI/XaDiSwaAyIEpFuwo6w07bUxJ/Kv9xRjQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN7PR18MB660231.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?lYw6Whjy2aQ8Ym4Gf3p2tuJx+Jjmy+ifb7xcBJTCnpV94fj88dW+DmjAn+?=
 =?iso-8859-1?Q?1fHvlGiii9MIrcIEpJPfnxv41cqGYkSYioL9maPTMJp14yls/+p/qFBP7w?=
 =?iso-8859-1?Q?DhNjrTmtJ4RdNRxX/Zyv6e9sncOpJpOS0x63Mf8CsLM7CeXDkJNvXrZGVt?=
 =?iso-8859-1?Q?Q8mb6BroN7oT0/lD1LsaJJk2JTZFEU7ivrcfCfKFarhbgdG2lP8NA3UpEx?=
 =?iso-8859-1?Q?WMI8flICy+2xKc1I7UM2Ye3YHdnxy1HtOfRP7OijIuBtmsyfUM6nntEIrT?=
 =?iso-8859-1?Q?F4uqqM+IQIlOvZIvH5PIl/l0tu/3dNUYInZUTMS4JjDZOQMTyNMfLZyF7a?=
 =?iso-8859-1?Q?mXc/tE/BsCEK81XS3KlxLVWDFQZLH5IL9JVwiFTkmk8LwgMmsvvx+K8mvy?=
 =?iso-8859-1?Q?lxighNaLORU1ttKuRvuIwoT6LOd9JU2ZnIepRBa26xVE5KihPMvPLS4tnm?=
 =?iso-8859-1?Q?gs995qVOWNtw7flwbEN9stB/RGvE5BXuH8tgyLjjnQ8SO6+ou4tvkPfuOK?=
 =?iso-8859-1?Q?3n9Urcxk53plKkfdyHzH1TD8kOwmBdf55/LB3bNI8R2evaehlkWV74PkMg?=
 =?iso-8859-1?Q?8ea/TL9NPZfZhyBJNfea5HJyKWRObFUAnB80zZ2HS2+LUE7brc4C4dBs7P?=
 =?iso-8859-1?Q?UQLbCewE4FABBSMxEInmuKNgGiYPIS/UO3002i6iJcslW2fOhIae5p1zt7?=
 =?iso-8859-1?Q?fkwDTz+44rKffrzDkn10GpGv01t9BcbnwXHFmmijVpVA+M/1/v/qk1wlHN?=
 =?iso-8859-1?Q?vkcEhuz8d+Qh2kAeMcG/q8gTrX+KqjlFYZTD/s27JxkgGzRRt8VO9OPz32?=
 =?iso-8859-1?Q?kBNzh3r/2VlGB+oC5mOGpATzc4wcGlzvsSJYdTal+tVK4WHwyjZDmuaS+Z?=
 =?iso-8859-1?Q?oBeaZ7MH/DGur9Dw/amlADO+QMK97NGgfIysEp+DVJWnTah9yT13J/lAsK?=
 =?iso-8859-1?Q?4FsbyThho1+VjpdsX8N964OJaLlaBUvp3GA/W+EJ2YNsmUB2fcWCc6YtAT?=
 =?iso-8859-1?Q?XErl0ZcBjRGMzjAXLmrezMm58aVNHLl6U+s9wwTCuc1hFYeHNwsq7NR7e5?=
 =?iso-8859-1?Q?lu72EoHVU2uvWRNr3C/WRLQOo7vgAGnIQxgFBnRs2KWgst+MNCr6MPXS5M?=
 =?iso-8859-1?Q?bucUSU5J+oNyUwLPShFdD4Gi62gWWvNLaMiZrpbF3a5ufif/73FRUReGZ8?=
 =?iso-8859-1?Q?nNtlQ7Sm4xX4rcxT5Sqs6E3lZZzY9h+ez4q3VWp7SfZXZF7vsXG4oLq/To?=
 =?iso-8859-1?Q?RZnhL913fElQXMU1Ed3QNNpf6oRflB2OXFl0LzotP5dGKn2g3G1zlxHABR?=
 =?iso-8859-1?Q?xgfIWsufU5gg8LXQf0GFNe1F7ZRBoZYPNbcLwgB4I3FUQv0HYloXWrKZUE?=
 =?iso-8859-1?Q?FJd5lPr83lOkB7DPRJp7mDMVVhzV/PxAhHVBQ5rqiRO5rHk0bs5LuyRdyE?=
 =?iso-8859-1?Q?1HFxoPmqbWhdp7LtbJbOx+413z1KIqq2QI0DQpzLFFkFrjJF/y3FzhpgZ2?=
 =?iso-8859-1?Q?oooIW7ZqzCP3RacF4yzqC/kMnGLodpGktjPu/YgiCv2VJsKnCVe7exEMnd?=
 =?iso-8859-1?Q?5SyGw8UiK8buhPSZ1kmTUrBFaP6ekaTMlhbSpESvyyxsAma3l5q1YwVEb9?=
 =?iso-8859-1?Q?wBJ9ZVh/+kK9B7eU3FPTBRwNC4yDJkfGxpfjT03VueIbY7wd2XFgay4mrv?=
 =?iso-8859-1?Q?SjxSgVrEC1DAzvWAHNNoDYWJTqBiYBlcSLkVpHSOtqmvxd2u/8BgYOeXUm?=
 =?iso-8859-1?Q?Dd+e0oyvPSbaVTTLfHAZXFlVeugGddQYmzL7tVp96ekV7L?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: M6Rvg1umiGbg8Tyg1RQ70S60ZFaRhNMIaYskqJ8jUXgjH7AQOub3PphvfYUBT+xs1qJaRYzANYACmhPxrucFXwxdu6QvFA1U1lGJBFgWYC7jauzkSk4XLqcohyrbl18kEATkrFajX0PLOCAcsXyn15f8r8loC9furZSJCMWcZxuLSV36S3bLaCBVzuY8ETDkR1n4xpt+7z3jtfV3gOYSjrJaaUNy9VYhETqX899BTEMpAnmbr1v+nwU5mY/ehuudliPjW6q6Yc++nV6kWXDbnjhNtk/k0zogIz0sLqiKS9lv5kk/j2q21HEpvwAKOuNd21i5dZvetaGCBqBoEbF6sg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN7PR18MB660231.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb32d1be-31c2-4649-6240-08df231cfd55
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 20:12:32.5957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zn5ybNGIVd16zNU5Xz34OpOwk9tx8g91LaCf61wg059cL1mwDg8Tn25mNYOGGxiQQfbisD81dzK1YyKFFQTNzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR18MB4699
X-OriginatorOrg: amazon.com

On Tue, 2026-09-22 at 00:52 +0000, Michael Kelley wrote:=0A=
> I tested this patch in an Azure x86/x64 VM with 416 CPUs. The "CPU"=0A=
> header line is missing without the patch, and it appears when the=0A=
> patch is applied. I verified that the 416 "CPU<nnn>" column labels=0A=
> are correctly shown.=0A=
>=0A=
> I have not reviewed the code.=0A=
=0A=
Thanks Michael, good to hear it works on other platforms.=0A=
=0A=
-- =0A=
Haris Okanovic=0A=
AWS Graviton=0A=
