Received: from iad-out-013.esa.us-east-1.outbound.mail-perimeter.amazon.com (iad-out-013.esa.us-east-1.outbound.mail-perimeter.amazon.com [34.198.218.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B8D48A2BE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=34.198.218.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685060; cv=fail; b=Ww2Y9SNIKMqH2nIMzrNWJkuAJIPIMdi0ehx5x2996ATHATk1Khv8+vg6FkCkrJHezBltyZtY3P0snU0XwLDUvZWipJwodVdX/Gn+MXrAm7fDFBZexDbjuOkYCq+zbtd+t/FF8oOlBkaV0aaEa5nesG8IDBvEXcVns10KvyaiwBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685060; c=relaxed/simple;
	bh=BC+DIi1ypx7TVlPriGukMFRS/wUmQCTvYX7dpBASaxA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s8iEo2RsQtjcZEKZTV2LzOSBKMaaUp4xjkgVpd3WaMFSBt1rnNWUcFFB7gklg/BUp/irbj6GN61w2jko6evV84FEL95asnsDmBne1c/5D/9/god5F8+qnzAP72e3baMuuvG09VBhRWjHrt3pb79X+7WU8j9Sqiv3+B5tmIir4Rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=O7gMRqZG; arc=fail smtp.client-ip=34.198.218.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="O7gMRqZG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789685058; x=1821221058;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=g+TLzroVpTBVEIYKDzCihNd1NCed+CMMq5xcSl3tYn4=;
  b=O7gMRqZG2er1lOU3hceSiynwoAXZRcxFVuZdyL95xdnutyk6uRf/+o8X
   eP7UF4glML2lPKLQ4JT5P95sYngvqhgQszSftgs0gqSF6j+5a9DHYrYOj
   XTx+3IwBfU8ap+H0vaYFfsJGZG9qJXRAUdyEk/smAzx0tiQoRHBfwb02a
   KHnk6+LrtoRh+z6DKVBTGnU7CTDymnlas6aJHKRZWKvhEdXSnAI01GUPO
   KpIsiR5E6X0/uQEx7hwE5hCtNejuHj8CHZa0dX9dBSwVA/s2Lv1dyUkDA
   iZWoy2nmNCBvU9zLn5hkw522UT/u2r5qOmnU0rmKSZe+cbRAbsm0eHMkr
   A==;
X-CSE-ConnectionGUID: BOk5LQi3R+W1xEcd9vtE1Q==
X-CSE-MsgGUID: YAxQxFuIS7mAr78WB8o8Jg==
X-IronPort-AV: E=Sophos;i="6.27,103,1787011200"; 
   d="scan'208";a="27062492"
Received: from ip-10-4-10-75.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.10.75])
  by internal-iad-out-013.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 22:44:17 +0000
Received: from EX19MTAUEA001.ant.amazon.com [72.21.196.67:21316]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.34.106:2525] with esmtp (Farcaster)
 id 13450350-a0a5-4c0e-8988-578198325656; Thu, 17 Sep 2026 22:44:17 +0000 (UTC)
X-Farcaster-Flow-ID: 13450350-a0a5-4c0e-8988-578198325656
Received: from EX19EXOUEA001.ant.amazon.com (10.252.134.47) by
 EX19MTAUEA001.ant.amazon.com (10.252.134.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Thu, 17 Sep 2026 22:44:17 +0000
Received: from SN1PR07CU001.outbound.protection.outlook.com (10.252.135.199)
 by EX19EXOUEA001.ant.amazon.com (10.252.134.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46
 via Frontend Transport; Thu, 17 Sep 2026 22:44:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4aRxmKYGx0al520QQq+gnseTPTVnJolakHBU7+7rEcJH8ovR8x/AQeqzgXEkDM5m7bwhoXKm5a/edzAJrT4bbH/NUvuS5RGDHUBb8IQ3X9nWt4hh+53ev/ILiaw+aUoIY/LDXwpseuzZYqVH33vD+6qxjNQ3p9W9zbXAkruKIpvx9MmugJpqCdFQj1eRVHNe+8ajyxFdzpZvW7bfVA89HvQphRI0CLmv+yv+gpyq+l+03feDo3GMLb9G6rAw78iQgwa5tavBwaU9QfTk79JHQXmh+56uQbI8iMKVu1XKdu88Bb7QDZDymshD7yJ9KLU1KLEpty/3RmKIbI5QJFE1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+TLzroVpTBVEIYKDzCihNd1NCed+CMMq5xcSl3tYn4=;
 b=exwiiU0xA8m/30qKv8q6Hrhaz/5qfSkOMuOHiw51mBJRwGu9RnRNemfMbxXhKyOK8dX20sfLsJiQAyJoF7gkdEyFASOtVp5w+X4zZUh0O/vv8/2v4DrNGpnwQf+WdIzKnkCMTw4NEAEwEvi+/mzZPFuB1Tb3ag0HcWoneZLk7MJQ+2bknqzaSA8Ds1tsYNdhRUewYImHeC/3OBtdfXpVk/msGHxKYiDK7Na+3KfmyN1u2GMP57ZQhzFl3OoJFUbYnftMnKESViqQEExeuXJk9t3z8LvrzcgdehmuxAf3OjUroF9IhXIRCGmoiVOM1nSDtwT8jp5M4JbB4uonddFsig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from MN7PR18MB660231.namprd18.prod.outlook.com
 (2603:10b6:208:5f3::23) by PH7PR18MB5331.namprd18.prod.outlook.com
 (2603:10b6:510:249::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 22:44:11 +0000
Received: from MN7PR18MB660231.namprd18.prod.outlook.com
 ([fe80::97fe:4c12:b98c:3b70]) by MN7PR18MB660231.namprd18.prod.outlook.com
 ([fe80::97fe:4c12:b98c:3b70%5]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 22:44:11 +0000
From: "Okanovic, Haris" <harisokn@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, "Dmitry
 Ilvokhin" <d@ilvokhin.com>
CC: Michael Kelley <mhklinux@outlook.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] genirq/proc: Fix missing CPU header in /proc/interrupts
Thread-Topic: [PATCH] genirq/proc: Fix missing CPU header in /proc/interrupts
Thread-Index: AQHdQhvpTXj4uWvh7UCW09xtood/NbbTZilI
Date: Thu, 17 Sep 2026 22:44:11 +0000
Message-ID: <MN7PR18MB660231A09335B498AA658E953EA8B82@MN7PR18MB660231.namprd18.prod.outlook.com>
References: <20260911-dev-harisokn-proc-interrupts-fix-b4-v1-1-f9ff208efcfa@amazon.com>
In-Reply-To: <20260911-dev-harisokn-proc-interrupts-fix-b4-v1-1-f9ff208efcfa@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN7PR18MB660231:EE_|PH7PR18MB5331:EE_
x-ms-office365-filtering-correlation-id: ce83f4ae-b447-44f1-d18d-08df150d3166
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|22082099003|18002099003|38070700021|11063799006|10067099003|56012099006;
x-microsoft-antispam-message-info: LQAFz4c47vkUzohP+5LH66nwQBoidnxuYJry6IU5qTtOMkNVALfAoWb0a1VcVCPW4xF9VRG0Txktiwg4jWx2pXtxp9UAPQTspTSoe6P/7EDBTZobZesPoij01RrajKs67buUgFzfzJHu56NKeDjzaF9+nuSgEVGYj5b3liVDmvNjITlsdGaMzaOgPkVPu/Iqf9bJA0HLWdbV9x/u67zxs00KhEBUrw5Ge3PbS0ZLMXR1/xqGqYrbOecA4wxJkEXOqJInMbByeSGtKW6xwIuRQAYwS/bo+Joqqar5j6KCjb/VwVYyfjP80moAtybz+GmWg2jDc9wxqUkJTZGylcxT+8V/Ue4czGw0Xr4valQiluUp2aLh1h6r4Dmdnvj7Sybe695foKb/DxO0wUZVS0JkBBE3DWE32O4rIZsf1S5SEXe3iv0s63Q0bPUYLMf3Y5gKAdW8W/XMBwgOD2bgpx6OPhOx/yaku7PovGOIoUDzLEemKSyeRzm2iLGiBA7ktHrimkHZAuhIJzwQU9M/+9XqymdNoglOODU2yrreAmIWRWhtpUxV9WeYDyCX8UaLhbNKUGyCksea1sFo1K2OYO/e72dBVxHFQed0Khn5RDhomB0sPojZrzYq3F1n9YjQkCGDf9/EfNYs5/4L0jGdES3AUYVV6jPOROl2QvZCrFFLxb4LNF4ceMsOsC1hzb/zCAMKrd4+EDNi2Fi/Rs9lqNEV+XPkw0Ad3O7gPP4TZrqfa/0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN7PR18MB660231.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(38070700021)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Qzh2q1FBP7T4NzO9C2ztFLCibHU3ovSltRryN6iQhTtdNiVNyZxcUAhC0y?=
 =?iso-8859-1?Q?L/J9FM8RV27IhAXsmZyLMblhs0D3oWex5Htrp14hC/JOpBMLkNfXm01mLl?=
 =?iso-8859-1?Q?PtlP85PyL0FTQYFfmIHsfgs5hKmoqdw3/cFdlypLRX6S9+iNXfo1G7cync?=
 =?iso-8859-1?Q?EhQIz+axSv8jBE4L2fiyRs7BaW9eJVa3QrVU8nTFJ1Fyhlanhsue12/qHh?=
 =?iso-8859-1?Q?LtZy9kUZfF+B2XH4GnDmpEYka1RBtgMeV+s2F10VwywpmnG/F5gPtPqcwG?=
 =?iso-8859-1?Q?dKBua5eU0g++M4smiAui4epeWqz+0f6lxCVy/bLWhSiWi0c6SCOmAaf/Ov?=
 =?iso-8859-1?Q?hJlnHlqzUCJZgkfn8t/jxqCUXPXaqieBt8c7zdcelM4la7lqFh+Jg5bvq6?=
 =?iso-8859-1?Q?hG5H8UGOUuHrEZ2Y4ySnWltxmZeusbcdFkjAfmdYRu+H2lo5g3BeDSCLbT?=
 =?iso-8859-1?Q?CcYq8rn12879KvGCeEtHMQSsvfsRUj5yyGNhZVEJIhsm0yR5QDY/FO3866?=
 =?iso-8859-1?Q?LTQGL2eVJsYwFX4cTvCaQ8sdYpDx7CLWsB8T06AKT/FYeyUatBbMnyc9Qm?=
 =?iso-8859-1?Q?kgt27A59YcDrtOpe57YgxGFSubBwig8lB2MvzjJOTSnInIa8UcaXcOoXEt?=
 =?iso-8859-1?Q?HNkoR7H3Wqw18XKG/vcG4buXFRNwsVmsqMcjAtbHsV2Ma5XuNdXI6vUr7n?=
 =?iso-8859-1?Q?HFR/EWsqx4Gcjz1WnTpEK8QJW/YTjblrB9q9/+pD/e3ko049rKj/ymYyR+?=
 =?iso-8859-1?Q?erj50dshX3wpkLoWgxgxDH9bMSrJAEjgGyF+NZox8JBIwm4H5NyLEbYLXf?=
 =?iso-8859-1?Q?NlOOXhPSiI/zXW4yA0q4ezVssLypApPfcoajFs1aJOvrMKNG/8DEdhcrx7?=
 =?iso-8859-1?Q?Kts3MpMiOfFoUKnXl9VFCPkEktD0P1/E9Nu6v4NrzlHGndLdPYnwD6Bc7Z?=
 =?iso-8859-1?Q?Lv2zSCf7DRdfWG3HwMILImRx372gr3kPiQTPdI+wQKNmBnPVw6GCnThomh?=
 =?iso-8859-1?Q?6E7FrR+XPgs97aabkPZiGFz/wv/C8pXKCwPtkFAJDdbBmrSqDXM5+MhnwT?=
 =?iso-8859-1?Q?6OCYVemJpOMq5LmQ/625C5fqBqErg2I4A4BMj3egdpY0BYYU8+8idNSfLL?=
 =?iso-8859-1?Q?ne72THgP2qmezOrGUbwsOQpe5yxudWzEaJTetqoAYHYrfv7ITnbioeC89G?=
 =?iso-8859-1?Q?rxVh4UB3Dnay4Fk+YIi5lrX86K+usFVgGlqOGP0BM1jUqbZtNa1d2tPSD3?=
 =?iso-8859-1?Q?qLEIhJ3u6JesIwuDVKM3lC+uBjargmcXE0xO/yEMwb+KohVDFjrQrX4Ot7?=
 =?iso-8859-1?Q?AbjUr71htX70bNJnAX0vzN3DXtAyU7o51gYiOdry3MSuW9Nnv+HNHH+b++?=
 =?iso-8859-1?Q?4TjQ4jGaBzmWCGM7JwBOSH1VmJdW1K1kvkuHh6VKRBGae2HSKCk2eiUANP?=
 =?iso-8859-1?Q?szTcHGy6rWL98W8IF5vHR2xOUevjVlQkWAKwi+UAjN7Bs8TVtVR8fAi7iD?=
 =?iso-8859-1?Q?3t2yebh9OTdSrEww/PbIUF4vA5p1Gt6HqZVNViOnhkycGAk8gMIvueKkIK?=
 =?iso-8859-1?Q?xc3cmr6msQZuOWCFv07KGWT9/6U8jTmmd3I7OP2TE3FGVF7KQ5ctNbfFtW?=
 =?iso-8859-1?Q?YYR6BgLBaJysIM352hnA96qviEtyDkyEA70DQcqtrRZl0U0NxUPKf7o0gP?=
 =?iso-8859-1?Q?Jylcr0mMRGR+elA2xRFZobgpeJgiojcP06nKyTtaFLyyb0+UAxjmHCIt9N?=
 =?iso-8859-1?Q?7GWBv9wqk7cqHss1aSTioa/YiWxQd7NysyxrZGQn2sDrGW?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DJexa+Oo0u/m6eioJfEJjTtxEA1hHaLfSyuWSrXGUBhChvtKWS85Lck2eeYy4qUc1OCfFozpIUH8R/EzsbEWehFYj4vIHMiVFpzeg0wmm5X51y8MZ+yKEKnVyfR7/g4Q3ZC+E0Q+Yw05N/GmB1FUtP0ZqxS8C/LmRDwzbBQdoUEcEZS+k5MmGsy8FY2CS81Y48qXPyDCjFkrJ1HsKmhrhnD5jHGAY3Xnp1m7xLsELdh/Tt2cwyW7UqlNTCSB7mii4c5fQM/HvmbCsfZl501yIxvUub+nd54WtPEwb+OJI/407LQSD6q0WjTwzd74kpMBQS0zuuSQpBq4IvLnOLmuzg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN7PR18MB660231.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce83f4ae-b447-44f1-d18d-08df150d3166
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 22:44:11.7353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M9TT3nPjtepgxhIAHNrygE4RwGbgkxBRCWztIZ6Kr8LmusMLzg08Erro/oBmF/BPTo3AiWULRrodcbA4cBeoBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR18MB5331
X-OriginatorOrg: amazon.com

Gentle ping on this one. Any concerns with the approach?=0A=
=0A=
We'd like to get this in before more distros pick up 171cc0d9eed1. Losing t=
he=0A=
CPU header is a user-visible format change that breaks tools parsing=0A=
/proc/interrupts, e.g. aperf:=0A=
=0A=
  https://github.com/aws/aperf=0A=
=0A=
Happy to respin if you'd prefer a different fix.=0A=
=0A=
Regards,=0A=
-- =0A=
Haris Okanovic=0A=
AWS Graviton=0A=
