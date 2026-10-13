Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010059.outbound.protection.outlook.com [40.93.198.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAF031E84B;
	Tue, 13 Oct 2026 01:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791853490; cv=fail; b=bnV6eUYtwI9SZfV9ITD2c98Z7dwgUCUGlXNtcZIpGWolosGUHtg+VVbfi7ucsQ/koQLOtnG2bt2NHs66LGvklGh+HNTe9rgF6Ectfq+CAQZIBlre1vRe+QAtK1cVKypc8pZB3TcEQ9a6IIwSgWUGEE0Rm5FkLO0a+ODSclIZTGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791853490; c=relaxed/simple;
	bh=FW/I1eA0uf9SxGl4RPUA5HMr1+9SFTEdetiV7t+4Wds=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NMwNpG78b5Duc/rA/hfU1/CnLahiPYDWhAizNeIapMS7yHPJctUgwS63NMNl2fYD51LBw12CUwmGD9pM+XaK/xp9pp2pKNm53d9ynGqObgkkP9p+SW/gl1Vq1gmx8lWaA37gdlJv5Gw/OF93dNMPPsY+8FJM/gnYnO1xLPpsF+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Nv0SEj9d; arc=fail smtp.client-ip=40.93.198.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nv0SEj9d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMbBftgM9+iWh9Jx2LlkW3A3UkWdQF37uVERumk1MhAkoVKc6B3Obw5pSDojKslzahwkCZWHJvTa5FWpWvVOm/P4Cgyi2HxliNk0QxAri/FdW6u1n1XRVJvOAAzfk5Q5c8fnUdyBBqdMCTh2UINJYRUsmGn/aGlZ/XYeD3jDheo+0TvnSJ5lj1Im2tr843ygz2Yoowo3BWAnGJq5wH60/eSacXyTyuIPA2/nqeUnrHRiAW5V46n0pX+h8xZTNXVKWojvQsDfKNhLdnnwHBqU7f0DAMn34t+d6BE2uSQzg2olQK2e0NRQYnBR1dwo+iQbYpxPFTvzWIjvtsJzneSsTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0V0xbMn8ec8izVwBQOBeGylBVVQC6D0kk9KWLW7fUAo=;
 b=hkpTltqnZ0+F5gJLSFzVXOilHak7oj8tVHpwX5TZ8e8EbBfnp6SGJ0AsFSlEbd+xuvjgSlak6RG5wxrewR93UQtIy7ahU5UBZPcB7CeMYW4qYsmN6ehCuxm5FlFuuj7Agghkr6NoJfu7Kie7r0dhMcgIVIO8xkMBh1DyT1KPgroDzeBty2WESEdxWJLWMVvNIeL8NlZ/XasWBzok6g8KdbLbjRCVuImvZPwXlReWb9yeHghvqnlD5lIWZ6mFjCCXdLTAS+nMtn6VCp9zXv/KNkVlmPQi7rHDWpnmoD8y9YrxQ1gSwNkNeUs1YtEp75PIj+bxUZBGTDSncUfIOPVDLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0V0xbMn8ec8izVwBQOBeGylBVVQC6D0kk9KWLW7fUAo=;
 b=Nv0SEj9dp8IN6UoXwvd6sykFs1vUgiBa1pjyX+hYDPc8bblyCEsuOSGEGnT4SD9z4bi1gw3gm5bd52tLqr33bxntFJxJLxh8E+IA7/u93O7bKLDWygBx27Tox1xqhXJ59/J9Ndo2AFpxsckYnQfuhqQu4K6w1C5rWjGxr3B9KJeQj9ey2lAj3ZrwSsSkqJRAFX4cBzXvIV0QiCLJOFn4aDCWNScBa1iIL1H9ugkuod4nOE6JemG8gO2Nt8lNjR1Kdb4CDR1s1B0IOScf7XPAwH/eHkGlT8fHnv+AeDgei5I5VpNwOClYjSDT9Mfbgdvyd9dvOPq3qkvX3oI5arW2mg==
Received: from CY8PR12MB7290.namprd12.prod.outlook.com (2603:10b6:930:55::13)
 by CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Tue, 13 Oct
 2026 01:04:44 +0000
Received: from CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc]) by CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc%5]) with mapi id 15.21.0496.020; Tue, 13 Oct 2026
 01:04:44 +0000
From: "Qiuxu (Leo) Zhuo" <qzhuo@nvidia.com>
To: Adrian Schlegel <me@adrianschlegel.com>, "tony.luck@intel.com"
	<tony.luck@intel.com>, "bp@alien8.de" <bp@alien8.de>
CC: "x86@kernel.org" <x86@kernel.org>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3] x86/mce: Do not treat cache hierarchy errors as memory
 errors
Thread-Topic: [PATCH v3] x86/mce: Do not treat cache hierarchy errors as
 memory errors
Thread-Index: AQHdWoCS6utJ270nGkuMKrZA/eZg/Lb6qEDw
Date: Tue, 13 Oct 2026 01:04:44 +0000
Message-ID:
 <CY8PR12MB7290EFD53AFBA1A474BA86EAD19E2@CY8PR12MB7290.namprd12.prod.outlook.com>
References: <20261003222012.19685-1-me@adrianschlegel.com>
 <20261012193305.38931-1-me@adrianschlegel.com>
In-Reply-To: <20261012193305.38931-1-me@adrianschlegel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7290:EE_|CY5PR12MB6108:EE_
x-ms-office365-filtering-correlation-id: aa67065d-6b32-490b-a8d6-08df28c5f7f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|18002099003|10067099003|22082099003|38070700021|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 zwLEnD3AeFSGzZbSkJYQxXF49+ksbnRn+o/Oz25b68LYbQn4JzECgh4zwFtYOGfk/gS1vA1IOVvrrb+EYkKyB00b+II4zlckO9RaW5k9rk5wgy71Bm1vjyc1GeE7kcisC3BEMqpZZjqmO16wEok04b8+PjkXpBukiJaQQbZGXQlEYMG81RSx4B3WQjONkG4e5q9OroXhNDo7wss+4/wnqxoOnj6PBhe+1PGN6BI5mzPxGDyoWK6N7eEtV1nEBiUwyBTQqybjTFvew6wfTMfUVCzqMJ1ahGUlRzQ+o9i1rM5rUzQVcQgRZlrlvZN8zcJRGtRPsDCPUqUCP6jfa+tJwNoYm9k+1+mg6WGqt91ASHYXg4VU7Jk3VmaiUdcLBcx+2XbN3eRGZA3HYf59V7DlNBJypa16SsyUcyHFF0wJw0HgwX0EfGllVFU4GgY3Ga4QCqKdfQ68omOgClzwpyaD1NZsYvWaHj6ki8eo+IkNLnmEVDGfLcNN2WYZEgmzDH5qBsmj9TMVm0lU9VL9lYqniiwkEjQ28qZ8St560WRYx/wyyiI8cY/urw84CbmEbxtmQbPBpSOUblD+e8nzY/Mxwseb6enij/6/f2Zfn4OLMwuD8aCmH/UBmz3jQX3IGM69+IJONd8MzQRVaVWh88EOu0GhhWcVCSXiG7MsSOeiQkqx7/Y3N2S2f6bOOpANNbfyGQuQCb4s/ODuhTxw8JCgyas5qXZOu52fyHroIiULIGI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7290.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(10067099003)(22082099003)(38070700021)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kL7FYKHhFTt/n9wH5RAXvEzZ1rGMSITywb9ymfuSblJrQhArfMoGObRTjZSK?=
 =?us-ascii?Q?kU6WWxHGp0qcBeRSH/Fcv2pYiGRwfGI3VvCJ3Ge5q6QOJiLcKM4zXeuRObU8?=
 =?us-ascii?Q?S0PiDNo/jIgp81aHGh49e99koyXFfCWsOauDHn+w9n0/40ToYIivsYLiAeM1?=
 =?us-ascii?Q?7fe+16gBviIk3MOKk6OZXDmsFD0Sm2zrOPPnJGHAeYV4Ko3U5VbTHl84rPx5?=
 =?us-ascii?Q?sn7fd0xrRJtu7nqGfJy4Ztpg7/7w/n8e3+yByNSdj/9CMS9lmGqWCugiAurI?=
 =?us-ascii?Q?Yl8+X4BvDey01Vkd6yjxxjw96Au90kd6GsxyGCkSuP0Q0F8BQglZtXqjR9i4?=
 =?us-ascii?Q?H8JEY6GVsqG2F7NaBloxQy+G+EXQ5ISNAFv5p3MEEo07ztflPHnjeOy7Jtk1?=
 =?us-ascii?Q?N6jSNYCHjf9kNYslC3xCql8xOac7MIZFhGkdFaBPpIg3irTzKEdO+2t+lh7A?=
 =?us-ascii?Q?jg2eSa8wRajVVYQBSRFU065ymj0j+Qpo6R5FKkWJaynU+JsTR3zZnAPcWtgv?=
 =?us-ascii?Q?hw2rYBPrTKQCbO32GLkE5KGGQqyZP0QGS2Zr0DWpddN239+wdNLcp9Khq2UI?=
 =?us-ascii?Q?WKmzltVjDzc6v5GnZncn/+O4xhIeiMKO047MMA3BSx0ZkaZq4yfIybEZzfGM?=
 =?us-ascii?Q?YMZPMXc5PQR/OQJbX0yllGyqu5dlHRXLz5RHDb9y38OjANPWyNM7hAH1slVM?=
 =?us-ascii?Q?rYT4W1Zk12hnGyc/XzFbo0Jfi54xu/i80BLgUhWfwOfi0m+yVBHIGw86aXPQ?=
 =?us-ascii?Q?Wqy9Q8Tb++VtWDX0o51XT92XLpJtJnNETm5mdocZPXdEje0DinpZWm2GWh7b?=
 =?us-ascii?Q?Z8NhwhVN/vDAUCSU2r4m75rz3i3a60COUTnnhbur8+88JbfC8mUr0QYTcU5q?=
 =?us-ascii?Q?3n1bFtXOhAMh6o7A3ITeerz9iAGiuf9ifRlwcv0ramVNpc0QYFfUkr1uxSY4?=
 =?us-ascii?Q?y9eHWe87nLBEE81Tzr6ocDdwfEnm4JO/5l5LqCAu4q1OiLxnwoAZT6afElV1?=
 =?us-ascii?Q?ZZDoUf51QlDuR3/iFy4BK1gQpm8sdzrO37rwwQrjEozxcTxVWlT1XRoGrzNz?=
 =?us-ascii?Q?NVMk6nKiJ4c6ROlPuEU7VEPepxMP9dABZqpT2fzsNVEGkvHUtbWyUj+pAa3V?=
 =?us-ascii?Q?oVu73KyPpNPEsWBybn5vAI5nOAOcWwN9UQm7bgj5H7wJgQ467L7JhScBc8Uw?=
 =?us-ascii?Q?KyVn29o9iMN9vxHp9hjCgC3VSf4iefSZHRU0QTMEYfSJDOnuZEVFwZeVSn5k?=
 =?us-ascii?Q?mqgJj7ISAu3gaUYcF+O5yHEJ7zHvI61GU1H3KMOwix1nb2LTD4G5tNyR5ClF?=
 =?us-ascii?Q?Num9hoPNuSDFt/EPRQmJSf7TJAprtmnvjlKCkNGLFn6kOzk3LwrJdxL7lXBf?=
 =?us-ascii?Q?iU67bbPodojSOs6gEwBMsTPBMCBQ1uoc1TR6wkh2CnWIOda+i7lraabR1i3C?=
 =?us-ascii?Q?sAOw3iuHMAMFowJ0NUrmo2lYzE5eqhX0JX7OQx9SpRMxQI4ENDiDKimRdOrk?=
 =?us-ascii?Q?vEAaWkdjHzXtDBQC8T7evm3UBnAYUTae2rTLu3VvZzqbxP7E0YLXEKhR27FS?=
 =?us-ascii?Q?69MaFdYEjiSMYN0pIUQJso0ihHY03Vp2Yx4N7h8SJP6XM82hrvC9YiiPhMet?=
 =?us-ascii?Q?eMYyO0iLd59o1AJG7ixPuFQuma7a7raAsmiVkDjyqvWcpFhMB2X9pnmUICjJ?=
 =?us-ascii?Q?K2vk5B8uJ6W+nZOpjYXF0UVZIsYxT6M/bcriYe7IOFpXLc1s?=
Content-Type: text/plain; charset="us-ascii"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: aa67065d-6b32-490b-a8d6-08df28c5f7f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 01:04:44.2692
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8u+0xgpHKPbbO1yXw+QYU5avkb9kRRRNiLywo9BTUVpedfxKOgburd81O7SAGtsFADz65GOnFl30+4sBEAN8MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6108

> From: Adrian Schlegel <me@adrianschlegel.com>
> Sent: Tuesday, October 13, 2026 3:33 AM
> To: tony.luck@intel.com; bp@alien8.de
> Cc: x86@kernel.org; linux-edac@vger.kernel.org; linux-kernel@vger.kernel.=
org;
> Adrian Schlegel <me@adrianschlegel.com>
> Subject: [PATCH v3] x86/mce: Do not treat cache hierarchy errors as memor=
y errors
>=20
>=20
> On Intel and Zhaoxin, mce_is_memory_error() also returns true for cache h=
ierarchy
> errors. All callers expect it to report memory errors only.
>=20
> The CEC uses it to count corrected DRAM errors. A corrected cache error o=
nly
> names the cache line that was affected, not a faulty DRAM page.
> With a faulty CPU core, the CEC therefore soft-offlines healthy pages.
> On an i9-9900K this caused about 500 soft-offline attempts per hour.
>=20
> Report only memory controller errors on Intel and Zhaoxin, as is already =
done for
> AMD.
>=20
> Fixes: fa92c5869426 ("x86, mce: Support memory error recovery for both UC=
NA and
> Deferred error in machine_check_poll")
> Signed-off-by: Adrian Schlegel <me@adrianschlegel.com>
> ---

LGTM,

  Reviewed-by: Qiuxu Zhuo <qzhuo@nvidia.com>
