Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012024.outbound.protection.outlook.com [40.107.200.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C655563FC2;
	Wed,  9 Sep 2026 15:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966984; cv=fail; b=g0x/nhgEUtw8+aumbjlSYXvuJbVwnLU5akwyGp9JPBsx1Td6GLZNPjpCl9w/O+T8kMu9zkQbF1MSbzqfGsrSIin2BTK6S3oGPfIwywlxIplflZKydfLUntqGfzSqpXrifUqg3kG8ScI5rBZKppL9H3CnzK+6uwdwCx83brzlHkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966984; c=relaxed/simple;
	bh=uSWLPjPKG0m5Y9vtepHgi+6cKhRKwZT3+7ou28N28MQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sn2RpkWVnKGDExxgk88kO0e+hR3OeV00hIF+Q+faSE8WWDXQFjutfJep2wmjXa2aT/qFjUS9R3cPYWEnIJSC/cBFWn3jfHuQR9/I62c1vqr9rKk/fl+NjMjyKdijNTZoE11qsLwOU3uLCXw1ByQ8RafMTQYeguPBFzyS9FJrDWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Z6PWinkq; arc=fail smtp.client-ip=40.107.200.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z6PWinkq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qgtaAPdq4Accdg92wFCIZ3cDWlTLYx7kbAxgtisIJOM0SifPSQLFF7G9OvmfekdKkDKzXxg1m0FlJLdqIEz9EeeG7WdQ6ulNCz1+wtyOZmDRkzHI9yOYj6iiIr6otTQCsTXuNW2Z3y3hb5A9Cti+Xn+OUw8CQHbw4cP0cfiifO9ClGu/uX0lGVqdALvvMf5Xl5LBRzB1yUd7K9SVV5Sbbk6y0LsLMvk2PML0nvxPpezC4WKc8EQJXcjjrR+vkQbU/mCXdCxuVE0oDby7jy7ojzWKQcPNJriXu/zvulI/Ze7brbaCYyibyu8ABCBwhBacq80rTMah8JinfWrtV2MXhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyqu65YQUF9h9h8ZKAUjMXV6t9ggdGc54PZbeXmuWes=;
 b=py4DloncbKXgdbS/0zKXnCRuoPzyRrZw52t+TAL4BkHcE0YMKcHpz9Kf3tbx8HWVdDfXSdLZp0iyF/faHKQjRmTwOP5hs4FOAMLPSu8FxwdsxW3Y4wMWJXXo/3ZTAKDWlTL+HfaNdHMCGRbTUaToTMpx4aggjpXcGtblx1bNsU4gvM7TeV6mXtNcKcCzrdxHT0w1oactCdx8fOthLw51lM9q4GbC66XKhm4aHjvIv11Gu9R/bk8SqzrezzWc7GVIDBEuPXqRdb1aB7ttw30QkwYd4AY0sNGJZJ5Vy08vztPNqLWx5LW7wdKevMUIbK09c8cXwG3rhpapc3y+ncrJ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyqu65YQUF9h9h8ZKAUjMXV6t9ggdGc54PZbeXmuWes=;
 b=Z6PWinkqZ7OKkAv4ASJFgZgqBfaJyxLxh/VupdfPgvxyONF6BEzdxA9ek+TaDkB2bRPq6VXqsUD4POoKlXZ6VXghLHjLqY1TzKMDMtq2BGek8ya9S3OuZS/dzmIyblW3sty+AWnk3OZko7l1D8GxH/FrYPpzF28jf2a4PpkKgdpuQoY/HWvQc+slAeiCG4PoLN4+xAdVHHlXn4l+4Jvq6gKbYy0+y/wEyoQvGfp8Y4vnYqQYjFbFkew2CDhWQo0BuMLec03ai2AxWNStHojWNa9b3R/5+XO5JehDBGXbvX8nHb/KfUJ5D7+MuD6AXc/SPt3fx+SpDivzGG7vvNQDxA==
Received: from CY8PR12MB7290.namprd12.prod.outlook.com (2603:10b6:930:55::13)
 by PH0PR12MB5629.namprd12.prod.outlook.com (2603:10b6:510:141::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 15:16:15 +0000
Received: from CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc]) by CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc%5]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 15:16:15 +0000
From: Leo Zhuo <qzhuo@nvidia.com>
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
CC: Leo Zhuo <qzhuo@nvidia.com>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] MAINTAINERS: Update my email address
Thread-Topic: [PATCH 1/1] MAINTAINERS: Update my email address
Thread-Index: AQHdQG4oBWj+KZ5gc0ajhRCUEVZKig==
Date: Wed, 9 Sep 2026 15:16:15 +0000
Message-ID: <20260909151531.69074-1-qzhuo@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7290:EE_|PH0PR12MB5629:EE_
x-ms-office365-filtering-correlation-id: 166c1a90-1232-43c9-7b8c-08df0e854aaa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|11063799006|10067099003|56012099006|18002099003;
x-microsoft-antispam-message-info:
 heQnTUDlzLHIhYCuZTxYKsqyHSjGQgS/AUmKfImglhvTrILDvMjgnuy1ReT3G1YCXi5JDrADESZMs+7G/Ptj1hOG3IznQxwIK9HS+B2AfLUoXmcrt3/mGJ3KkAVreS1C4pxJD7zcCn+vcvMvO1Ql7qzhCwle7fRRPHm6NKEx0micJTajTaK2KP6GMnOuBX2KUTCNFKurAcDuPF9fwPXLxJR+kiQGN3Tb47QxyY/zhzXbq7WOBd1AD1qbGxMe4zG+qqteRsdJvTOD4LHj3NOG+K1vqQeP2gnOvXP3nunl20uT2FKOGJEFIzXbH3S/PGsPlk12zwdJVNaKImRTn1hpENf32Vtgqd4YMqnPBkzaXl3JILU/oKIx+d9bg4FfWrM2DA3NcY+QpNSdDkqT+nZdMWBwKXSBNRUI1z0bJt/RWlgd89XFmWM1HGyo1OJFIRhAJhDFNg2N7CdC5E7gtSf/etpT+PPP3Bdp5D9G18GqUXg341MXNaPtNHMammgc52dfLMYf4DU1+WcsGzMUag5pJ3QGadvMszwhhifqXKso/z8J6yitrLv4hznefCe69Oq3APB84ET7WOpMahJ2oj4F9QjNkzG+TfaUCGLpyJRPMRJ/ZJj6fGNzR35SUbaLghzpg4WZHxcU63/+FOfkTePGY0FrbqyBEBFCk8jK9sPAvKv0EcoWgMQDdtR8NFAyTXOOZ9Wol/TVsx3qqEycfCzX1VRTm1w+mzWZofUzXIkI28A=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7290.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yvqyFN2IhQpqfQrSaw5botIzszt8tcny9UNmKJsrYBQhY3oZ20ZIecY1wT?=
 =?iso-8859-1?Q?xrqXItj+HfwGI155qHqyoYAosKiO4Yx5bToTYv4FbjOEgr36RdHcywH6RW?=
 =?iso-8859-1?Q?KuL1i1YhlZHvDue2oYwtAH4LiCjVG4W6mS2YPLWUC0g9g3fN8ZnKcWZvtF?=
 =?iso-8859-1?Q?xJdSD+jQdMvPjlr9OcjmfReJE3jjpcLLt1dRUbi2pmOoZW8CoXPiNf9Lhc?=
 =?iso-8859-1?Q?pDqkIpWUmbpULuvZf/yvk5vVdzo2PTwjjBRnRt3ml49BPquUhUmfnKR6hk?=
 =?iso-8859-1?Q?cAsZzCaJTLWl1EqbOUUhsiWCcJ1shZ4F5lgFDsfxJ+SvgJE6kpFvQyt9y1?=
 =?iso-8859-1?Q?KIxRlfjwCyRXUPb4xOpdpok0V5h7V1u26lskbVS4Fwmxo3pGfvTh4Arl5s?=
 =?iso-8859-1?Q?TZhyNhd434cr9r38cocRX4t0VdVNgmdAKuy3N0qHEmei2RbDoVVfMmu704?=
 =?iso-8859-1?Q?ST7DdDU8OmkT/ZAgLiXRQiWX4Q1J6rzZwZ90hGJJk7VlV63PA4L0x7Lipf?=
 =?iso-8859-1?Q?JNl1V+wfzUe1b2Um9DrEMdmpyHBQB7Qx0YnZGX56FQlg75PNzz5tOGOqfP?=
 =?iso-8859-1?Q?QN1FIiIO6rau08e8P/jbuTK8qCreRQ02YiAi7JA2zNObya6mAyavx+g/45?=
 =?iso-8859-1?Q?6dwi78afKfxHMPxkTM/ILTzv/ocoEZO6ByAGUIz9pxd+F1Lld6XsSEs8CL?=
 =?iso-8859-1?Q?4V8nnH2Q/sYZyu1pf4BcD/yuNk2LvZ88WNJ5X3hsLeB/oF9/UCB5Of7ImK?=
 =?iso-8859-1?Q?EKwtcoVZOeAs48Y73GYK9WJIQc2gi6K2jcb5jaAoWq4zZ0OqgVioZ2UA4P?=
 =?iso-8859-1?Q?66XsZxMV91dpNzfDVVqOKrtaytWjbdEgiH4frwmn04p7YaO9b38a6aey6e?=
 =?iso-8859-1?Q?KFtSRS9X9xJGe+GsaTOCZBmapW4Dh6C4Fl6i3QTOnXxs6NCS73NTx0dJEM?=
 =?iso-8859-1?Q?kUL6hrnLOkH3b5gMkvpix7jPCMimyzBvqfd+SIvsmA39Gth0SXse2ZoMw2?=
 =?iso-8859-1?Q?7iTudrJsbaDhmPRlcPjuEPE5I+qvEzS9gpnIa2cItHZQzBUtMkS/16BjHH?=
 =?iso-8859-1?Q?2gbJDsuDalWFQoW+AYmb1o8BCjibwcS5f2T9lq3I9iNx1kYgQ8xYK6YAgj?=
 =?iso-8859-1?Q?IF3voFjasgRAkK9OaNWc0Kjlhq6P4EYowwUnwhyBAYjfSx8sU0v5hBfiS/?=
 =?iso-8859-1?Q?BAmVmxTLhkA8clrgcUAp9/sezaoMnZSMSVyKoMUpjAnK+1DOS+lZkXVB1L?=
 =?iso-8859-1?Q?9BzkgBagGluEUkNxPLDUiQRg+UbmEI4FMbJW3EEc90HCSf+ojFje60eLsX?=
 =?iso-8859-1?Q?PYK+7I7JJpeZmduBABEUxCoi2v9sIsMAfyxybC30V/HLFJz18gTon1zFlI?=
 =?iso-8859-1?Q?DkXl2zf9suu7Lfel1lNkxHIOP1GBkOeGopU0+fh64FHcK4PXwKSrsAUcLQ?=
 =?iso-8859-1?Q?jAm7Ivu54C4PJD3oiaw2ukSvXU9Sm7s5XZ+QQ9AiDKFgSkWJHunsd6ZrTe?=
 =?iso-8859-1?Q?IM6DukYzz/xVwzzS7mQ9I99xUIdLOrgVAO5XYlE8+iFPyfHXabq8Uw2Qgk?=
 =?iso-8859-1?Q?FXPH+FG5IYos4VlmmIZ+lXZwEu79eHvcpUgNW9NEVEowqCQeFBPFiSV0T6?=
 =?iso-8859-1?Q?6s1oJ+IFHG7ramMreDqtIDlli4a4QhEcdpkXjCCxZterdJals56rQx8EV0?=
 =?iso-8859-1?Q?6yItpf+Ii5M07+vMhxDp1L1oHYEke7DUKUswDXf3hJEnfOh9fGi7Q7hVug?=
 =?iso-8859-1?Q?XHZP3eduIjUmpudslRQxGa8yT+Aj9pTmNqxtkbjMVtk6KX?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7290.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 166c1a90-1232-43c9-7b8c-08df0e854aaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 15:16:15.5607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xqbhq3FDZxGecBcB9nmx9VCurVBh7a5Ar22JzDK9oEshV3BOcJdnhZJtmMBZBt2HVB9ZxapaO+c+goPC9WKBBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5629

Following a job transition, update my email address to my current work=0A=
address. I'm willing to continue reviewing EDAC patches.=0A=
=0A=
Signed-off-by: Qiuxu Zhuo <qzhuo@nvidia.com>=0A=
---=0A=
 MAINTAINERS | 4 ++--=0A=
 1 file changed, 2 insertions(+), 2 deletions(-)=0A=
=0A=
diff --git a/MAINTAINERS b/MAINTAINERS=0A=
index da3e42d2d190..a5e72e64797b 100644=0A=
--- a/MAINTAINERS=0A=
+++ b/MAINTAINERS=0A=
@@ -9485,7 +9485,7 @@ F:	drivers/edac/ie31200_edac.c=0A=
 =0A=
 EDAC-IGEN6=0A=
 M:	Tony Luck <tony.luck@intel.com>=0A=
-R:	Qiuxu Zhuo <qiuxu.zhuo@intel.com>=0A=
+R:	Qiuxu Zhuo <qzhuo@nvidia.com>=0A=
 L:	linux-edac@vger.kernel.org=0A=
 S:	Maintained=0A=
 F:	drivers/edac/igen6_edac.c=0A=
@@ -9524,7 +9524,7 @@ F:	drivers/edac/qcom_edac.c=0A=
 =0A=
 EDAC-SBRIDGE=0A=
 M:	Tony Luck <tony.luck@intel.com>=0A=
-R:	Qiuxu Zhuo <qiuxu.zhuo@intel.com>=0A=
+R:	Qiuxu Zhuo <qzhuo@nvidia.com>=0A=
 L:	linux-edac@vger.kernel.org=0A=
 S:	Maintained=0A=
 F:	drivers/edac/sb_edac.c=0A=
=0A=
base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8=0A=
-- =0A=
2.43.0=0A=
=0A=
