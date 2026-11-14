Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794681620;
	b=Af15deEYxWSw/BCZV27vYisGmw4BPo7cx21Df66WiJle1UP9eEvwVzLtp+qrAfbK1V/G
	 3d809LDBlKVBA1wBwmy5TvBaIBLgV1V4ebPrNOHuNQEWzHvAdJ2ML3TdeZRfgVEYnQKzh
	 Pktd7nb2lmAECA6UgAVLaoSGe97sf44J51Ty/uwbFb+G3sCQiQ+eSkVrh2aO+gLyLB1YB
	 n2nFqBOu2ByErJ/bytc+1CqKmywsntD+TlXT0zSBBpWbiiI7PSBLDK4QfJ4NYE5pyLr0f
	 ateHqQDfbgt6p3sEuQdpLZleLYuTWbCWF4aQhUiJv5wgLHgvS+JEdFtXbbEajZZr+Mg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794681620;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ld-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Rgs10JO4E5WBMJdiO5CaCTuXqY2ghBF/h2jRTGKS5zw=;
	b=cabnjxiYw2JNjOM6yPCE37f/LzdA2otjbaf62rVnfPSKMbB33gEuPfmwwkG5tXm/x9KE
	 Dz/xeIZvg2B/goC5ISmAi30bLkcg/SnN/6crbBzM9KexntZ0+pP01Rty8fjMrxMA6R9ro
	 460s5XeAwZrjL0sMqQtrSkcoOtXcLYkZUH7nnAMVicOTnoM5uW9m5IpF5H6sN4w5tyixF
	 NfisgR/auETKHjVFZDCZYd28nPKojN+IO1G+c0sdIQOV7pqKwiUJno9fG96PYQA0/51IT
	 DUEdA7P8//PpQdUmstWgr77RaQkZEQ1LoaeQoX2uT5jEYgc48IoyHu7qqoiGqNLl0iQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leica-geosystems.com;
	spf=fail smtp.mailfrom=leica-geosystems.com;
	dkim=pass header.d=leica-geosystems.com header.i=@leica-geosystems.com header.a=rsa-sha256 header.s=selector1 header.b=Szke8n2d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.39
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011039.outbound.protection.outlook.com [40.107.130.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EA5606A32D;
	Sat, 14 Nov 2026 18:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1EA5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.a=rsa-sha256 header.s=selector1 header.b=Szke8n2d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GdJvSwZ2nh/4Xe+sJx4OiRErBCk9jubN4nRaMlce6014x2dsLcThFL0ejGcIAvygRY92ikJEXxd77K+mcopDbi7OXfbdElSwlPgM0kfC+oumV3V6YwniGLQ+SgdImF3UCNWngNHcxzz9Ey1igBTgPXLyxPpl5eNkLUJKJetmKx+5tGLarZIzH27KeOPBB41/1cayZ6tkD1yyRrNM9nv96uJdCthuNW+ICNOE+AbQX/rUa0ddxgJQsmqORG0xa3AQY27vIkGkYA8zhJeT025hhrWL9nwdFeD5au9plMH+HhMuMDtWOFU5B4bUVV8Q1ksqgQ+uaKVK/KTip89sKmRoEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rgs10JO4E5WBMJdiO5CaCTuXqY2ghBF/h2jRTGKS5zw=;
 b=OpYmVIEhnvKKPAjtmvGqkROPIoeCpwzOc5B/r1soyp2AOuo7rW1G5qJY7MMZFi6rWLy4TpM2KxswW7m3I4hVdKc4voYdnIrN2+4hOJwlgtSJziz+wZJ+STxuC9QTe8iS3lvfpMgq/8rysGIw/M+Dys7Z4TOaL7wFYjDlaWj7GYBnoRGyTONVx6eNbF509hPqZvKyyfI7MUt9m22Ui27OqVmebhyP+i4BNM43YHhNu2Xl5cnJ1wCMDZxpP9MbV/0i1MfuN3ywNaSRIMCUoJDy6DG9hwTZ2B2FuITb6YJfU72v/JrTZShjOxBrRdqmUPuYYR9+xZmA+EKqGxaUMhrG2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rgs10JO4E5WBMJdiO5CaCTuXqY2ghBF/h2jRTGKS5zw=;
 b=Szke8n2dKo6jFLPZZlUzYdUWEGk6DMYsF41U+vupJGzAqKL9IZPVaqnxb8cpMXdREsRABRAEyyr6j0isqBsvdO6My4abgXTB4IlOrH8DLg2sdH+MFo702u9x6RekSzn/1NxwBk9prpJ0kuDFDCR61DbgJPLUFGe8YmBgg/x/VoA=
Received: from GV2PR06MB946935.eurprd06.prod.outlook.com
 (2603:10a6:150:385::6) by DB9PR06MB11223.eurprd06.prod.outlook.com
 (2603:10a6:10:609::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Sat, 14 Nov
 2026 18:40:15 +0000
Received: from GV2PR06MB946935.eurprd06.prod.outlook.com
 ([fe80::6c6:1b3e:8a37:ea25]) by GV2PR06MB946935.eurprd06.prod.outlook.com
 ([fe80::6c6:1b3e:8a37:ea25%7]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 18:40:15 +0000
From: BRETSCHNEIDER Max <max.bretschneider@leica-geosystems.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: ov08d10: add get_selection support
Thread-Topic: [PATCH] media: i2c: ov08d10: add get_selection support
Thread-Index: AQHdWbp97kJFwSosak2iR6ujkOIPEbb5rewAgBH8Ve6AIm4oNA==
Date: Sat, 14 Nov 2026 18:40:15 +0000
Message-ID:
 <GV2PR06MB9469356C7B3523BDEAFE11E453D37E2@GV2PR06MB946935.eurprd06.prod.outlook.com>
References:
 <20261011-ov08d10-get-selection-v1-1-5debe6436765@leica-geosystems.com>
 <asywCh3X0yJVcxRd@kekkonen.localdomain>
 <GV1PR06MB83698BCD22508BA5DF19A0A1D3642@GV1PR06MB8369.eurprd06.prod.outlook.com>
In-Reply-To:
 <GV1PR06MB83698BCD22508BA5DF19A0A1D3642@GV1PR06MB8369.eurprd06.prod.outlook.com>
Accept-Language: en-CH, en-US
Content-Language: aa
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR06MB946935:EE_|DB9PR06MB11223:EE_
x-ms-office365-filtering-correlation-id: a75c81e6-e382-4521-ee76-08df427eb962
x-ld-processed: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|10067099003|11063799006|4143699003|261021121427099003|261022105027099003|261026140227099003|56012099006|261102123227099003|261028144727099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 XqSg0J3N2FmnvS8AsqmeSQ7b8JIHWnnmFT7sAz8pVgIyCGF3whbrhi0QLQJOUQiwIZKKCXCISJyHkQ+8SuyhhhwoERX0ynmDAt/ZllYMnJe55keFNBEulEvql3IcUhxzFAJBpmcTWgVmKPUSEU5znrzASR9ytQjpE4tPA8lWxBANYPgJ+Bv3CD1jhhVtW2mL61MuHs3FCntxBs8I7wpgdVJtGYgwv7/AIPL32TvN/92S3sQQRq0I0qkX7xZl2fEfGczf01NhszLaZOtYJ7mraTYPkwUDXa3gFqky/LPDoDGBOw0Tv/2JlpQP8AmwTuZI7V/LkFvZi7ul1tk3HypkhYL7vL1dk9hDbtK11Yz4+7kYWgWNSA87mMzG2uFoBgUiKIlxH1bo1uCr+VZ2Szd2nuCx2gKkwA+SSvcegqPczcGjj0ynZZPTwKMhUmF5DfYO1ihrtDoruMS+honJhgleJtbCQBMkPB2d2dTY+zUnT3Xcw1C3J1QL2ym5iZxxm0c5uEC5ktvOKm+H6gOdOxWuKoxUWzABfHVMcOvE8E+Jr3ku2dWOxfDlPzNjAVSLRQVHbouvt95BgzGIiR3SFM7h7yGgGhGTX2hlNZs7DH3DMGo+vtTaeUTJp2NW6dtq9iD819dSeWlTjPabbeHy7HV6FCG3jn/LS//nCBrantjzjPeaHrutc5Y2GHserjyIRrADh42s6z2dyugyA/8+wSspIfz6tkKiVUA0wOJvhYRaGpo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR06MB946935.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(10067099003)(11063799006)(4143699003)(261021121427099003)(261022105027099003)(261026140227099003)(56012099006)(261102123227099003)(261028144727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?f6Hk7MTurVHxEOe/PCsieZ3KjAXUOvb6bZoN9KA0mbAyeo5eGWRTym9f4Fth?=
 =?us-ascii?Q?miKz0kRhDSh9FIf50w/ZtSL1ZcbApauD8cCePzJ8mU6/tVYn5AlBpNgmXOnx?=
 =?us-ascii?Q?SvUu2SlxTy/j984In1fQgtkw+MOB4tNsqgy+HfV4dLonLfI61NZ8LeN6JQLi?=
 =?us-ascii?Q?g612QHkvvWAb5rXI1ADvUlhGxA9kkUV/dB7vpZbao2OVyVEHbvjo39eDZht6?=
 =?us-ascii?Q?DjCztEJzv6PL7or9xqH9n5T72TpB6ttDooGZcfy9sYngbnVxxb//PykfA0Hk?=
 =?us-ascii?Q?cvYvVjcMJsBSX7bVNa53x+3E5X0l77vwAFn8Buoed6DH4MvTLDQIjtH5N2qP?=
 =?us-ascii?Q?A0MS15cE0f/XkuGG0MSpsYoQtvWqMp6irICP1mj+wnuRUIVvNp10YRTunkNv?=
 =?us-ascii?Q?o9VjtLTqrbAEua519orxUmnw0UMHqSNjdv4C+omuerQUW4LWccYZJkULfsmL?=
 =?us-ascii?Q?XHd+0I8bYJEYfWNG6q30Ra8E7iy4XZjPX9B8R4HFzxX3u5Lf2xksScInBZEH?=
 =?us-ascii?Q?3s0bh/yjWPeZ+6bRSIyuxE/B/g+Uq2tBBXFv/X/+hq6mtBs+IcnXCQddeISJ?=
 =?us-ascii?Q?qehR8ZwuGB7iMqFlf2ni6ukn7XklaaOT2Hubt/zS80AIsa5mCSmZmCd7w58w?=
 =?us-ascii?Q?w69J6a4IMMH+1jwIY6V87/gu+rPb7J2Lvi0vFJXcDEOTEknCnY07fIcM+Dnx?=
 =?us-ascii?Q?8N/J4cMuzMlZae9uvRZQH7MSHRYnvGCgLOqjV2MrmIW0HPagrXOOi3+wjmwC?=
 =?us-ascii?Q?uMCPWeEpLZwBp9IoIhUi4DCImU+4G79t0rjyXHH3UOw4cM1JYPvLD7eUypYl?=
 =?us-ascii?Q?ua3xJbUomJxJ9lv5vZUQIVBeeeVNpQK23dTH7oRiqWT7YBCOjdd72peryHT4?=
 =?us-ascii?Q?QbVM1wNIcS/gfxpf30IANK3PbxdyCi8XKhDoH6pnDQj7RMjAp86Yb106jwQy?=
 =?us-ascii?Q?SetLz/SYnvMy2xDt76dyvVdPKzyPVT4Shu7WPxG8EvLo+BB6FR9sjCEdfUUV?=
 =?us-ascii?Q?vSCzGJ15Brc5/q+o1PX6wt/jsN1A+kx1oKYCktuTnytEjnvKSGM35Xh6L4N1?=
 =?us-ascii?Q?IrIP5PDDLf5PZmNeWkthFK5jV51CNHm+1hjDHvBvn0s034Hkl48/caqAqLhh?=
 =?us-ascii?Q?Vle7h0X23HubuXvDyEX1iQ0sUVKYBzlHd4Otv4w5kOMKxU/UDVse1MVl3E9u?=
 =?us-ascii?Q?u0QmqTAsinj7kCPp3gGF8ULq9HaCzdyOUJcqFRXXhda7gh+Dg2SwWvvx/XTP?=
 =?us-ascii?Q?L3vM60bvq1e+VuCyDh+rxg4NFZX2c2mJ07/MU/OueMmmWg2oHLZNQMO9WmeG?=
 =?us-ascii?Q?UkjJ/cCebUapAh9ffi8O+e6Gd2ZDS0KuZdzWXvcNDjRxtcuHyak3UxEQ75a/?=
 =?us-ascii?Q?56yIS9Ixw+hS3iQKjkxC8Mm3EuazbNCZqviH2v0isYattq+LjFkTUR+P4xzT?=
 =?us-ascii?Q?N3wryUrqjalwjSEMEBTUcYdq3dLi3u5wWkgEYXtdKsB2lT2UvQ+xgg3BhOsF?=
 =?us-ascii?Q?EKdFnEsrRer5H7TRSQvBg5Buk5NUX56dzPZB4bWUVpFrnxIJanxuHixNihgL?=
 =?us-ascii?Q?faB5XM7SZSGDf/gX590BQLQyXdsFk1AvI2MZHE8Bo0iepatZSArFep3Sr17y?=
 =?us-ascii?Q?T7oIBJZFfstcjaAB8AGV61TrjsUBSZSIK/Nw+o5/QL6J2TisZDPijdjsRwFS?=
 =?us-ascii?Q?UKiHPO+MIxmQFw8Z08RVozS3HMIPTOBVgMgVSJV/htoPCm3GATMSX8tpjH/t?=
 =?us-ascii?Q?qDQXNk9M/w1nD5rvhdjxCM1yLNZZQKo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR06MB946935.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a75c81e6-e382-4521-ee76-08df427eb962
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2026 18:40:15.2708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sTSA+rqIkq4bef8eaPwi9aK6AGthg1jmGdqzbV42VUhdciHSXAC81y4ZuGZhG4Jw8q5UIpKWToEsOA3FMqguFYMFuF6WS7ULuAyGUX3YrnRegl84fopgX5nk6zXnnGTO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB11223

Hi Sakari,=0A=
=0A=
> Can you test on a newer kernel? That being said, there are unlikely to be=
=0A=
> issues without that, but it's better to be sure.=0A=
=0A=
I have now tested this on media/next (7.4.0-rc1, bf6c63ecc, from 13.11.2026=
) =0A=
on the same hardware. The series applies cleanly, and get_selection, the =
=0A=
per-mode crop, the flip-dependent media bus code and v4l2-compliance all =
=0A=
behave the same as on 6.16.12. v4l2-compliance reports 52/52 on the sensor =
=0A=
subdev with no failures, and dmesg is clean.=0A=
=0A=
Thanks,=0A=
Max=
