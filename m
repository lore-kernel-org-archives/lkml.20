Received: from mx0a-000e4101.pphosted.com (mx0a-000e4101.pphosted.com [67.231.144.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D756447DFA9
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.144.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792016410; cv=fail; b=ConpKHgRwecj/BtKpIdT51spMetDI6MQu4b5W0JNMJAYgcByfTo2L9s45ivinombNFTp9TGYMXCeZ9I6+APvHYsTb8NGiG4hdBpNHMUfGvwIHdPvhpvc31Qjiu1knBaaH6FgLID9DL2seaLq13A5XLcKvlvNROW4NkJdXxYrxM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792016410; c=relaxed/simple;
	bh=1/3ZLEWtrYlOOYxOQU26gxBqxVTahq/46xRLYKNDFqo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pFAJphvRejKKFEK3Fa7vaavLBF5OjKnXZZmQY0uq7QHEljp/G51MYMwfZ0V2Gn2Wsb0YooGgp/C4PAkyFvN3eB+jbLNb8vYZ0eX7pEAT00j8z4ekd9XHtj34UlhoUAxbk0buYJybemyKuVmVP0oBWKRVjUH7RpRLzbEdzGaiH78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=JohnDeere.com; spf=pass smtp.mailfrom=johndeere.com; dkim=pass (2048-bit key) header.d=johndeere.com header.i=@johndeere.com header.b=aqXRuTK5; dkim=pass (1024-bit key) header.d=deere.onmicrosoft.com header.i=@deere.onmicrosoft.com header.b=QWNY5jp0; arc=fail smtp.client-ip=67.231.144.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=JohnDeere.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=johndeere.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=johndeere.com header.i=@johndeere.com header.b="aqXRuTK5";
	dkim=pass (1024-bit key) header.d=deere.onmicrosoft.com header.i=@deere.onmicrosoft.com header.b="QWNY5jp0"
Received: from pps.filterd (m0093294.ppops.net [127.0.0.1])
	by mx0a-000e4101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EL72sA4040748;
	Wed, 14 Oct 2026 16:58:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=johndeere.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S1-Feb19; bh=dyFd7xyVouJ6WiyMaTLToq3KmL5a5D8whet3YG+yiTk=; b=aqX
	RuTK5lDL0POouEUkmFHES9T/OzTDVT+fLfx/8H7Wx9Oycne7JJKPsrWbV0KWSJdg
	tnvdmWs5xwhW39yFdHCE9TXz5OtncMMP74G16TgQTQgbnOICteWduYrWHX141+BI
	sUjaStWmznhuQDtFAzfwBR+wih30u+BL7s8yOt5WhMWLDEYQWzZxGQcdXI8qpN+7
	ptuqViuCRZGMFGZtCnm8J8QwCGsHRstYHBOcVpPERlDjs0OH30/62H/1ndtn8azO
	aM8DwxelwWYDUbZoikaNqwqT3DGPNmxMpsl6dK5C4DF2k/oeRnPGlA8VOVqM+O+5
	mhCflPyqITT2T6aYHxA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010071.outbound.protection.outlook.com [52.101.201.71])
	by mx0a-000e4101.pphosted.com (PPS) with ESMTPS id 4hahc0gck6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 16:58:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lV/oUh4/ks6dBGrlipJINiZlTsfnrHENkV+zqNacbx8lWtfF8wLMQ5K1SP5XvK3d0GDyJaaOn3aHTVmNFVwe4/2x4rBJutUDuuLwQ+5YA18JbDh4v/CtLRB8Cn+veWEggw7n7Qruwkhsk0g3YJASbny7jrFMs541AUJkuHNYeeCrUNAQeomnVgQ8lhaZ450yVy6th3bN7tRj3aM6TJus+JZXyqqTcWvEKiBe5KmM2DFvV7lJuZpHYwShrssRbUCAHSC4BsbdzI5jJvruPXeaEK67/OmsU7WGU0LxIJ5xAQQZ7HZ+QFTzGGFY4KrZpiKeqFZ7a9kgidZuuLKTrybTrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=dyFd7xyVouJ6WiyMaTLToq3KmL5a5D8whet3YG+yiTk=;
 b=i5tkDZt/PVRtrgdHArLTFJY7anmzkl1pYTlcK53uYIABxHP/l5ti7nAs9GwsJyDPaK4tMvlC8DrwOa222/3UE9Cnfde0Y4EMHZIpCoQFY3tQ27kTp02YCYN3mUIbX8MOwPaVvWkWG6bKDNdaQPAcSm/pqf2xMUAoLW9f7Rnm1bII8zXJVUUMBcrhCmw9KikYKQsKOOib9ZJHd8h0XP5iyQJT07+4xqBKRvzpjupFqjwHfniSCQZhrHdUp4jSIFHm4ShuUb5SmPx3wozi8ibILl5IhkomeCuKg1n7tBFx/F01UUJZc2XoImklG8Adje7TqLK5mil7OrKwL664BE8dzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=johndeere.com; dmarc=pass action=none
 header.from=johndeere.com; dkim=pass header.d=johndeere.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=deere.onmicrosoft.com;
 s=selector1-deere-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyFd7xyVouJ6WiyMaTLToq3KmL5a5D8whet3YG+yiTk=;
 b=QWNY5jp0PMBvGAlJDOtywJ7ON25uy5XMSHcEH5HlPjW2slUwbDIZIWRkjf0e5nojFtmPffeMb6fFHMrQC0FsVnJrMNJtTfHELuWNy/bHg4wCuGSwHxavOjEcm+xBs2de8Ew6OvX1zXs6VOuqv+yhLLd0hMxK9FoH7LXaol3udWs=
Received: from BY3PR05MB8260.namprd05.prod.outlook.com (2603:10b6:a03:3b7::5)
 by SA7PR05MB998619.namprd05.prod.outlook.com (2603:10b6:806:4cc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 21:58:52 +0000
Received: from BY3PR05MB8260.namprd05.prod.outlook.com
 ([fe80::ed38:9dcf:7ed4:13f9]) by BY3PR05MB8260.namprd05.prod.outlook.com
 ([fe80::ed38:9dcf:7ed4:13f9%3]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 21:58:52 +0000
From: Alexis Bouzigues <BouziguesAlexis@JohnDeere.com>
To: Michal Hocko <mhocko@suse.com>
CC: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "liam@infradead.org" <liam@infradead.org>,
        "ljs@kernel.org" <ljs@kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm: nommu: set MMF_OOM_SKIP in exit_mmap()
Thread-Topic: [PATCH] mm: nommu: set MMF_OOM_SKIP in exit_mmap()
Thread-Index: AQHdW7DJydgmGYtttU6KWwNLmih5sLb9lhN5
Date: Wed, 14 Oct 2026 21:58:52 +0000
Message-ID:
 <BY3PR05MB82607AF910C023253C48CD26A09D2@BY3PR05MB8260.namprd05.prod.outlook.com>
References:
 <20261013-fix-nommu-exit-mmap-oom-skip-v1-1-cb957cdbfcc3@JohnDeere.com>
 <as80Rpm-VHhP14aK@tiehlicka>
In-Reply-To: <as80Rpm-VHhP14aK@tiehlicka>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_029374dd-2437-4816-8d63-bf9cc1b578e5_Enabled=True;MSIP_Label_029374dd-2437-4816-8d63-bf9cc1b578e5_SiteId=39b03722-b836-496a-85ec-850f0957ca6b;MSIP_Label_029374dd-2437-4816-8d63-bf9cc1b578e5_SetDate=2026-10-14T21:58:51.755Z;MSIP_Label_029374dd-2437-4816-8d63-bf9cc1b578e5_Name=Public;MSIP_Label_029374dd-2437-4816-8d63-bf9cc1b578e5_ContentBits=1;MSIP_Label_029374dd-2437-4816-8d63-bf9cc1b578e5_Method=Privileged;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=JohnDeere.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR05MB8260:EE_|SA7PR05MB998619:EE_
x-ms-office365-filtering-correlation-id: f660658a-cc96-4433-955d-08df2a3e5598
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|56012099006|11063799006|4143699003|18002099003|22082099003|10067099003|6133799003;
x-microsoft-antispam-message-info:
 d3yErZYWXvN0KVaOSS1AQ4g50g+tYx5O3cVDlWbzRH/4N/FTwp3iEelPHwCA9HT2dQR4uXwPmJzP6d+R1Z9h9HKga7DbM2OZmu0Csba2pxGGbzUX0h8Jy6F/HLvoNX9oW7G4X6BEickjqgoYwKRxt6zlxFyVpPV61CgFkGky2AXjHaeGyhh/ZQesWRVZBlVSnKTj0Pua+nPGJSCkHK4bewY+sl/TLjNwfEIHDxE7Xjn/imhUAUiUiyziUV1E8X1/+AbZVAOB5FEPDFQRquOKxVQDEfgDsgCl5jlvGBuF772Sl1YlEVIrVUa5WtZofuTnNaFgQuzt7EY674NPg8DEpKUFvrr8GAfEPqcX5NN1qcnOhD1GnDzcgeqO5+/DSvjsnYYUQotF81rMijPoucPBiANOUn3fLIYcs/3Cm2bC2OcPGXIwckrByv0KiNZpRpCV6l3ZNbnEodCKcO1eT6IF1SXwNdWs3ojmSi8l4P5zdse+iZDrqQX4CnSNCzg54R40Kyyu6ueNrdLpdSfkq+pHTz2RZ7PkxClVJATe2SedCwUa5oAUZdlojX8/FOoJO7DRDtpTrKbagf7xiU9AutH8fX7euYWbTnQ88EirELIhmpl62Crq8XONUSdlA0IKl+71RCO94yGxfjCfk/BSKlE2ktHaKvxjyJR9QYxa13QZsWKBpCwhYZfgWEF2SxMlI0vxqU0XIOI4fXT0eG+Fdrn8QdAFpp+msk3KRJHI0/+jOYc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR05MB8260.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(10067099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?IIjb5WK5MPINuA2f5r4QG+tu6QLLEhxATDmyMeE1fwz8e/lRXeNwx9g+zU?=
 =?iso-8859-1?Q?wtQ3N2hccEPIiN42s3yY2zwWSFRNJrbNm0+cd5Vcrc/wADCwh0xh+MyfFj?=
 =?iso-8859-1?Q?gotQnya57fZxHx/PkFX8ubdAgITdv+5Ue8CoyDmNpw9G8xLGPUff3zlfeO?=
 =?iso-8859-1?Q?A6eyUpRt7En+Xm6exgNqg3WqL6LA2yYr+Kx7cSoudJOU5MQ76tGufQn5Ws?=
 =?iso-8859-1?Q?GbwRIbzbTTFHa3x8H0qhYbgkZS5L18Ns8sOQDYP21fJRT+sxIYoFPa4ll3?=
 =?iso-8859-1?Q?sWA1ThuwrZ4KUmeELSyztmrowqKRAvwJF1q/gi1mEC4B26x70txBWkGJMO?=
 =?iso-8859-1?Q?C8LBBQQMCKAFhLTb4KKLvTRkAIlNJPty07FUK5wVC75Vv8hN/9j6VAtyYH?=
 =?iso-8859-1?Q?uT64LoRQJkxh6bAPKY5C+D7yTBj+ET1RX23rlHhydO0IjWhriyDjFcjZH/?=
 =?iso-8859-1?Q?25dqMmxIwfsQkzcnU8qCCQOOuUBHnRyJW+DDgaWgodyiFynqTFMMWw3Wyt?=
 =?iso-8859-1?Q?kd7s0i3EPYwd3xJu3ntgIfEbVW798IT6u4ygj2WLOVNaGBJBS7RNYNvnXN?=
 =?iso-8859-1?Q?6vCUH5uWXMnS8wao2OCMJ2o6cWahihsDhvbSY/43aaIwIru0pJU0c52mdS?=
 =?iso-8859-1?Q?bG53wF4NXXtS9rzCiiX4K0g/sOD+NQ0/wXbbzYMsnBxR2Ntb6u5Nwp8PBo?=
 =?iso-8859-1?Q?T/iR9iiaudWMAG4H74Nq4F+/NADUkMjE6TKcMIjPLom68UhCOneBUztB1f?=
 =?iso-8859-1?Q?BnJVE4ZrmkUJo6KcymWM+ZDUc0D40RsvoU6PxRuqDHO+0w+7NQcZu8TPrZ?=
 =?iso-8859-1?Q?07uST8H9Y3jGu8ZCJYTBGt3GFipP2I8Xh6pwr27eeaYzZe9nTxt2qPD3iA?=
 =?iso-8859-1?Q?hrvZTE2URv1nSihIg+S25UNhxTIR2K/Z9kpTRxXwTIIDJEe3Um1nmp88HP?=
 =?iso-8859-1?Q?oq0Om3oCZLsJZZSIHdzrLmKxKoHW79AY5yC+fwfE4WNXsloYgOJAx12PHX?=
 =?iso-8859-1?Q?SHBYXyJynlaS8wMTOYmf70vpBK0WaJHKdhKiNWqIujyWgioLNLXpA+Kv+v?=
 =?iso-8859-1?Q?OwwwXHb7UWZN9uOvASq5dCOVmO7/5rfRYHSEIm4v1Tnwicr41Y0KO/iDWS?=
 =?iso-8859-1?Q?hHc4s/yCtdR1gyb+8JadiFz5KNv1x5yVca1TLHn6e18JDf5KEi5IHqBk6V?=
 =?iso-8859-1?Q?Qz399aGf2SJ8uOTK4IGOc6t6bagjFADtzMfVydkbPxaNfaVK/wIbcxfAe5?=
 =?iso-8859-1?Q?T+yMRPQT/xQLZLSQA977n77wJuvJfKdXJeRPvXEJWsdCHUnVt4ZwKqh2ZW?=
 =?iso-8859-1?Q?ynmvmZNJ7xRe/m8TjW8KQMvWl+zREgSeMQAtfcmIt01E8MBZ+TAVsw7f//?=
 =?iso-8859-1?Q?liLOmgp7uNPa50NchFXWSdhf5XMb84ggWDrKr3hMtDE6cCLZE4HN9kSB6S?=
 =?iso-8859-1?Q?3ZUvm2pTPCJBP79YjolbYGucy+l9R7Q3C6mKPNjAQixQ3W5d3Jt/GABJl7?=
 =?iso-8859-1?Q?+9yTzu3JRmxnTPy6BEHn7uCxL01mRnHFy5P6c7UDgx8ukxtBWwivgt7C6Q?=
 =?iso-8859-1?Q?/MTdvoXwdhxOcZxWuKwj8VNhAlrN42Hod0qiUxhz04ae2JQOJmDFHW+9mg?=
 =?iso-8859-1?Q?HsN6z+U/47Dt89siXI+kaPs6owNDb22GpOREiHNigVKoXHPGkM/YWUGrMX?=
 =?iso-8859-1?Q?rU8znIsrESexGJyqsT02sMuk3gGC1SxbrMsCxlO43b8VW7G8Hr5jn5Yw/c?=
 =?iso-8859-1?Q?9J5N99IGZHBbNVhjmpHjDM//yfjtC2lxCI069vTuNKRbD2Lfqj0saKS1vd?=
 =?iso-8859-1?Q?eRWUenK2FQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	P8k6QSY9JHKUJKkx774+FZyD5RU2rBeMhWWHzeGNjP7yFu1bTAwvNeDGz/E+WfVlLsqN4kfn1RacDbXxlNE7UoKVDg970JcKvJvTwmPDczydPX5HVniPzcJWrLU2Z6vSdxStuIpAOh9iSr0/TVd60fpZQQF8gOKLdlbqW/M1JgaGQmxarWL7MTmwG6RTrxTI+0I5xFef71KJieNUhCQUVWYVGUQrJkdRAIL75QpfJWcO0B43iHQrrD9j4tr/fS3X/MpibSt5mckToFLiZHlfK8OtDIfI+2IafsEkNzYYcON9dygNYecIzQXHP+aKl0OxmkYkL79nYxIs77jY+CFaxA==
X-OriginatorOrg: johndeere.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR05MB8260.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f660658a-cc96-4433-955d-08df2a3e5598
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 21:58:52.2244
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 39b03722-b836-496a-85ec-850f0957ca6b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AKYAhPuhhQ57Pd/VfDU1ErUaVbpd8V/ndBGqqm90qqJQ4XGqGy2exSt7Y5DM6EQhJA+rfKmCgSK3k+K1hGT+cc/CG7Nf1Yb+Tk3miM0Am4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA7PR05MB998619
X-Authority-Analysis: v=2.4 cv=bJqDs/+Z c=1 sm=1 tr=0 ts=6acffb1e cx=c_pps
 a=zi9RuwRnjJAIHZVcFFhnlA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=660iZSQnnn4A:10 a=1NsiIDWdgNUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EwEtIDNmD2uUauncVptr:22 a=nn0ctdE04EhFDL24aSBo:22 a=zQGcAJzb7uQ71HtdeRUA:9
 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA4NyBTYWx0ZWRfX1G4547//zcwN
 cyZVCFMbZcWpF4UllMaJzqf9XpbOqYk2Y/B75iu30hODuHLW1VZd73KBfI1stJpX44FBaAR4nYB
 FmX+osBuE2bjU1T8TY5DeO8gw+Ngh8sLzUab9m1q1cLlRC2Akhaf
X-Proofpoint-ORIG-GUID: vWf5CQYd-YkuFibrVXeGgVKyjiDX9uDX
X-Proofpoint-GUID: vWf5CQYd-YkuFibrVXeGgVKyjiDX9uDX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA4NyBTYWx0ZWRfX5g1xDAoHvRHo
 +DGHPmHrgXvfDgF1/J31ZA3/Qvrab5T6JFiujFsWWsEKtHMmR8xj/pTBBAjljlOB4gjEQQHOptu
 UjIuveTgDQ1sjmyPLzUsRljRmXvohWXSWgEkjJGlEJcc9UQOQsiUPHf21Mu5yw7Eb7XdJ8YIFrk
 xmKbmtYFlYWuVDkU/U70KV64BBlBnjxF9D1vLMR5/6gGADVnht5pjJKc+YaPNnkW1Z57MYJrFqb
 2tX4Qd/67htdMVSrtXj308c3ePZTLypJqwivY1bvtJwsxNiXgTukvVHjBJ+tfYhGBraJ2VkfSDj
 fnUJM1Xe0djeV38yRxNAIu/xnrzEiQ38esoP7w+t6RUV0ffQT/1GHLD5/IkWIqPHX6WKLS469+n
 zyZPgjK+vDgvwzyKOoHymE2NI9N9XEqKD1cBq4JHDeGPQeYIX6DkFzPVcPr97JOppPpyuntpJuq
 TNnObVniPFjLciUXZlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140087

On Wed, Oct 14, 2026 at 09:50:30AM +0200, Michal Hocko wrote:=0A=
> > Set MMF_OOM_SKIP in the NOMMU exit_mmap() once the VMAs are freed, as=
=0A=
> > the MMU version does.=0A=
> Is this a real problem that you can actually hit?=0A=
=0A=
Yes, without this change the oom killer can fail to make progress to=0A=
resolve a global oom. This gets seeded by a parent PID making an=0A=
allocation that triggers oom killer before reaping an exited child oom=0A=
victim. The parent pid expected to reap the victim indefinitely retries=0A=
in the page allocator because the oom killer does not mark a new victim=0A=
until the old victim is reaped.=0A=
=0A=
A /init reproducer is provided below. I tested this patch on both the=0A=
reproducer and original benchmark where I encountered the livelocks.=0A=
=0A=
---8<---=0A=
#include <poll.h>=0A=
#include <stdio.h>=0A=
#include <string.h>=0A=
#include <sys/mman.h>=0A=
#include <sys/wait.h>=0A=
#include <signal.h>=0A=
#include <unistd.h>=0A=
=0A=
#define TEST_TIME_MS 10000=0A=
=0A=
static char *self;=0A=
=0A=
static void hog(void)=0A=
{=0A=
 for (;;) {=0A=
  char *p =3D mmap(NULL, 4096, PROT_READ | PROT_WRITE,=0A=
                 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);=0A=
  if (p !=3D MAP_FAILED) memset(p, 0xa5, 4096);=0A=
 }=0A=
}=0A=
=0A=
static pid_t spawn(char *role, int *rfd)=0A=
{=0A=
 char *argv[] =3D { self, role, NULL };=0A=
 char *envp[] =3D { NULL };=0A=
 int p[2];=0A=
 pid_t pid;=0A=
=0A=
 if (pipe(p)) return -1;=0A=
=0A=
 pid =3D vfork();=0A=
 if (pid =3D=3D 0) {=0A=
  close(p[0]);=0A=
  execve(self, argv, envp);=0A=
  _exit(127);=0A=
 }=0A=
=0A=
 close(p[1]);=0A=
 *rfd =3D p[0];=0A=
=0A=
 return pid;=0A=
}=0A=
=0A=
static long wait_eof(int fd, long timeout_ms)=0A=
{=0A=
 struct pollfd pfd =3D { .fd =3D fd, .events =3D POLLIN };=0A=
 long ms;=0A=
=0A=
 for (ms =3D 0; timeout_ms < 0 || ms < timeout_ms; ms +=3D 100)=0A=
  if (poll(&pfd, 1, 100) > 0)=0A=
   return ms;=0A=
=0A=
 return -1;=0A=
}=0A=
=0A=
static void parent(void)=0A=
{=0A=
 int fd;=0A=
 pid_t child =3D spawn("child", &fd);=0A=
=0A=
 if (child < 0 || wait_eof(fd, -1) < 0)=0A=
  _exit(1);=0A=
=0A=
 hog();=0A=
}=0A=
=0A=
int main(int argc, char **argv)=0A=
{=0A=
 int fd;=0A=
 long ms;=0A=
 pid_t p;=0A=
=0A=
 self =3D argv[0];=0A=
=0A=
 if (argc > 1 && !strcmp(argv[1], "child")) hog();=0A=
 if (argc > 1 && !strcmp(argv[1], "parent")) parent();=0A=
=0A=
 p =3D spawn("parent", &fd);=0A=
 if (p < 0)=0A=
  return 1;=0A=
=0A=
 ms =3D wait_eof(fd, TEST_TIME_MS);=0A=
 if (ms < 0) kill(p, SIGKILL);=0A=
=0A=
 int status =3D 0;=0A=
=0A=
 if (!(waitpid(p, &status, 0) =3D=3D p && WIFSIGNALED(status) &&=0A=
       WTERMSIG(status) =3D=3D SIGKILL))=0A=
  printf("Parent pid exited unexpectedly\n");=0A=
 else if (ms >=3D 0)=0A=
  printf("Parent pid was killed\n");=0A=
 else=0A=
  printf("Parent pid was still alive!\n");=0A=
=0A=
 if (getpid() =3D=3D 1)=0A=
  for (;;)=0A=
   poll(NULL, 0, -1);=0A=
=0A=
 return ms < 0;=0A=
}=0A=
--->8---=0A=
