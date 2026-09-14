Received: from mo-csw-fb.securemx.jp (mo-csw-fb1802.securemx.jp [210.130.202.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693ED33260B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.161
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789368294; cv=fail; b=JGhEnEDTEW6HXjMIInr71yu98sW5aq4Sd8Y7h87Jm8VO4VNLy+ur/5Qa9ftJuF/VoyvXW/3keLx4vAFDJjzyG4yAsp0zVXgzrl6hcWIn0zE7UdvRaAD2Y4mvmHtwZNsggvHQnhu2GfnXW5qToD0JP7rZugjcyWIfggA1W3+8nYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789368294; c=relaxed/simple;
	bh=9WtXfnnUrAZC8Yui5ffSkc1/An+wrDjCoSTjLzzJjzA=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I0zfkBiHbtxE8Wva2dGePPMYpGNI9+KF1LpLozQD8drd+semUHMEkg0zAs4VThvf/yuqvJgU1lUss7D1N72DnxpmS8lAAxW2Ge7ep263sluZNEkp8onC7VVZjmBYta5CxtqH691XF2ZsxrXECtHZzcV72AFVrLy0M1TJt84Jt3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.toshiba; spf=pass smtp.mailfrom=mail.toshiba; dkim=pass (2048-bit key) header.d=mail.toshiba header.i=nobuhiro.iwamatsu.x90@mail.toshiba header.b=jaXN7sMq; arc=fail smtp.client-ip=210.130.202.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.toshiba
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.toshiba
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.toshiba header.i=nobuhiro.iwamatsu.x90@mail.toshiba header.b="jaXN7sMq"
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1802) id 68E5gdf31152013; Mon, 14 Sep 2026 14:42:39 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=mail.toshiba;h=From:To:
	Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=nobuhiro.iwamatsu.x90@mail.toshiba;
	s=key2.smx;t=1789364544;x=1790574144;bh=9WtXfnnUrAZC8Yui5ffSkc1/An+wrDjCoSTjL
	zzJjzA=;b=jaXN7sMq7pu9SisrqJlfbhSGh0lkpUVEhxy1zr+8lakL90k3B97ZJOHRc3HUJzE1bqe
	a6kjWz0tG6pecYNk+sQkXucb0x7eVuCOkz/9SNTxlP/CYytBF4yCg/nkrY7jVXxUKIOP7mBSIDu0j
	WkzQ9N5qHT3MdzjcQUrINuvA8llrwnuMzKX9UP1xt8rE++Ed63S+G+wa0+UbMo/VvWVmhdhDJw/dg
	fRGfTe3VjHP73Y6sbnlUGbeksqXt3CMDAgSyZmdDGT8cJ3aXbByqGOvuz2H7I7qOI8XyNvqRDvjEw
	ewpcDprRDhmRiJ6RxATVnMEqzFmJ6GEA5FLwtaROWjrg==;
Received: by mo-csw.securemx.jp (mx-mo-csw1802) id 68E5gNv62010045; Mon, 14 Sep 2026 14:42:24 +0900
X-Iguazu-Qid: 2yAadI9PqAua5c0aB9
X-Iguazu-QSIG: v=2; s=1; t=1789364543; q=2yAadI9PqAua5c0aB9; m=Nvo9TRO0qwONQZouwdmum+i04FQcTkPEahiM6POpeKo=
Received: from imx12-a.toshiba.co.jp (unknown [38.106.60.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4hjvDb4qpjz1xnZ; Mon, 14 Sep 2026 14:42:23 +0900 (JST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhvTokKbMrv9lVYfhAgepLAKauUizEVkyT004ClMmRDu7B3kPZeggGHO8rThfNbnhUQEWoJiG+gcrZELYE5PnkblPd3pQS60OjHgovMVoJybJUkjBaLpb1glXGGfN9+cDuLmI8NYNiCxpsi6sMoDgLtSoXV4bEY2J/L1XrIsQuElXbDSeCuPTa0c/kim7O+F8uibGCdg3AJoXu/fXPKqr+jD+0rJkmr975B5Sa6GhiiPLxV/JYyvS0v4UrrJFwq19uFBiStPy+cdPWv6jZwQodZKB8xLXoiz3UGq+CVo3bD6HNdHTrCGgPiS9hspX5smnfbnh6WuEyBWg4PLGFDZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iHoTy2jf92p7FXd8nqZfqJ1vyHzfX7f/mZGsIb9yAI=;
 b=DJ9mmjowS1+zfper9M5nAMWHJt6PskFjkkETGW5zhtFK3jfd7k3e7sf2EpcJ272D5DQd2bnGbhNNePd6VdnF4zaDLzo2DX1me5RGLCU7dYRCkKMk+A2ER6SV6ay2G0aykPx9n3D6aIrOAyk113KWgyD7/H6NymxR8ioARKjLDMFY04aM4G2sD5YHGoVd1fOXhYjrbUW8TVSdcizsOhx+61o4g4kfnFhU+1dB4Pm3zy/Ef0MByMGytbzSBPS8wEIAG5azPK1RE0jdvtqJNMGVZZH0PlhdN4vkSzIlGbILcwBE/t96JqGbE3+koab9DEKhytT1lahOIy37E7vd1E+Ucg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mail.toshiba; dmarc=pass action=none header.from=mail.toshiba;
 dkim=pass header.d=mail.toshiba; arc=none
From: <nobuhiro.iwamatsu.x90@mail.toshiba>
To: <nobuhiro.iwamatsu.x90@mail.toshiba>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] MAINTAINERS: Change ARM Visconti5 architecture
 maintenance status to Odd Fixes
Thread-Topic: [PATCH] MAINTAINERS: Change ARM Visconti5 architecture
 maintenance status to Odd Fixes
Thread-Index: AQHdP5S2AVYuhGWJz0q/lUMFytZWsrbNmEJQ
Date: Mon, 14 Sep 2026 05:42:20 +0000
X-TSB-HOP2: ON
Message-ID: 
 <TY7PR01MB148181BC3D5484B3754EE4FF1CDBB2@TY7PR01MB14818.jpnprd01.prod.outlook.com>
References: 
 <1788873566-7765-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
In-Reply-To: 
 <1788873566-7765-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mail.toshiba;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7PR01MB14818:EE_|TY3PR01MB9997:EE_
x-ms-office365-filtering-correlation-id: 5cca9b85-082e-4c76-3ee8-08df1222f204
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|10067099003|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 MJs5ZIwmYn18FkGZRliAg7dHdUQyG8qdd7EKJ1OxpZRsl6O6vGfq66+/eZDlUFgcxFrr1Tb/d2dkSPupk6oL6owwCA+0Mjp80YguOxDBJ5vMbi9Z/bum869f8rW1IKj/TOpEPc1f+j1TZb6cFobGbAxcZFnT0LgtMBYcxQycr1SDjCusSqfb2sdsGl0Cd91+7yaTIZ/g1VgDmMrszcgC+ZRq+qfulsbxAdd7rIn/06+1U0zrR8IRBN+q86hv7ghe679DdkJDAmc4CZfg0oPsjS+uAFMwpnSW7zff1v6LLoawx+dnukbrVd59D85Ws0EtR9hB1CKAWoUSFcZbv+5GidUhwW9YrsSZNg/kBZ3Idf0HNxgakmq+yv//wtpJtwyQKvfihgGdepLp4WGVvjbKGYUYT2QYvM6GabN+aW3Yj2LIrlnR/fjOtZja0BfxGARLK6l1xjTVbMHE53kSoctNdx9C7P/9G/i6/2bdt9ZXeTACeF7I8jFYsTjdmbu+/g8YJ3YDMCeXqVbbllbd3SGnh5avcdpuSs9HXDoldPQZivzpSGL20CYkWm2QB7i3FOguY44TaO6brNDKJh9a2ptPDs7Hrc34yhCg0g/kA+kc/+tpetLw8F12b8IFmdClddWz2LaZG2KtJY+q907GO7+XC6rlsS7/Kg04bniiqAkPYzG/mg3nrGw0SraxkLGNrD9fuuEzEwQUflfMiM+a6wH5iOLGoRQErCMsoo12/Pc6HCI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7PR01MB14818.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?N1dyUDF1WkcvSFQ5cnhRT2tTQ3VDS2EzUWVzdXovcjRWalNlRk1LbE9J?=
 =?iso-2022-jp?B?QUxaMFVEbWdHNWlXeGhSeDl6R0RhYkF2eFFvcFNGYlBiRVdKY0NleVRB?=
 =?iso-2022-jp?B?eDd6eUc0WVdjd1ZoVUxyRjJta09qRkJGblkrMzFCRUM1TjlGYzBZMEcy?=
 =?iso-2022-jp?B?dTJ5NzBuNEMySUNFc1QzeUJkejFmYmx1N3NQUktad0Q1QTBTbmhMSDlN?=
 =?iso-2022-jp?B?Vk92QUpLbk5Pc1ZRcENzTzBWMWptdVRNUkFQWDJWVE1KSmF6aUxxcDFH?=
 =?iso-2022-jp?B?U3FSNnYxUVg0QnhHemN5VWg1RVZ2Zml6TjBiUHNPOUVqT0gwS053M0h6?=
 =?iso-2022-jp?B?aWdscFhIcWZsVFNhTTM0WE12cTVSWjJSYVQ4MjVNYUkvWmk5cWw4aDFS?=
 =?iso-2022-jp?B?cHRzYlRnUy9OeU1nNHNCajVKU1YvRXVUb21WUjFkTU10ZXpTUU8vRWx0?=
 =?iso-2022-jp?B?WVk0KzhKVG9TckJCU1FieHR0eUFmSU5ONDVvUm5RUEJDSEJNYVRvcktQ?=
 =?iso-2022-jp?B?NDI1eUZ6cVJuTnpBcml2UHpIMzZLRFB3RDJkSWdoQXo1TWhTV3NPdWww?=
 =?iso-2022-jp?B?SEtna0lPa1dyamJkeWhldjdnZzlIZ25CdXM0akEyUzF2SEkyZHlHSmtj?=
 =?iso-2022-jp?B?TTFqN1VKWUlVOEpIUi9WR0lmcUhtZmx2TU1zNkt6dHpjK2ZhWWplQmhI?=
 =?iso-2022-jp?B?ZU56VVFiR2JGRk1YQUZuQTl0K25VSWtlRFE3dmJDQTBtZmRGK3ZjRE5Y?=
 =?iso-2022-jp?B?R0hQN3FmRkdTdFZsYmFLa0UyVmhMbHJ2cE4yc1dOaGx5Ylhia1BCeGFQ?=
 =?iso-2022-jp?B?NGFVQ3BHNURkcERjVjl4SFJDNmU3eGZiSzhTVzlPN3RRTy9LemF3RDBv?=
 =?iso-2022-jp?B?TzJoNmNPekhXTWo3ZHB1VDgzWlJ5K1o1ak10UHJWaHlwVUorZDlWU2ht?=
 =?iso-2022-jp?B?YnlEdW5acWx5NVNvTmcvRUJLUGhIRHFoeGEwM2M3Vm5PcFB3cU90M0Y1?=
 =?iso-2022-jp?B?VjV1YUhQZjM2OXZlZ0M4NW41a3BxSWtNUXFLaEpXTmQyTXRMK0VGMFlE?=
 =?iso-2022-jp?B?NDZMQndlOHJOQVFUNHNGa0xXZE40QlRMcFlpNG9Xa0hoVWNSUjBMcG14?=
 =?iso-2022-jp?B?UlY1SDBua25RVVdMUEZGRDZRVzBIUXlhcFRreVR2THJ0dStTa2lUYjgz?=
 =?iso-2022-jp?B?Ylp5YW90RE9hNWRZU3kzNU13VzVoRlZMUUpsVlVoUUN2c0FPenNBOW03?=
 =?iso-2022-jp?B?Q1BWSzJUVFZ3Wk9rMXdNaHhTWWpscnFwN1o3TUx1TnhpUDhhdExPTE00?=
 =?iso-2022-jp?B?RHQzdW1ad1Nka0hRWVRmWTc2NzZoZ3lrdS9GQUxEMXpUQkZ3YUFxdE5W?=
 =?iso-2022-jp?B?OUlkb3p6RjI3RjFNem9JdHNLTG1jRzFuMGl4Ni9ZanBZK1dBeGF3cTc0?=
 =?iso-2022-jp?B?a3BFNnRRUkdPRXlmVVd4cmF2NFR5QVJhMTZ4dlJxZjFveGhzV3hWSGY0?=
 =?iso-2022-jp?B?QTNTZDZsVDBTSjE3c3pwTi81Q3FvQVMwWFlXRDVDRWVXSmRxNVVRM1hu?=
 =?iso-2022-jp?B?TE9sVmQ0QjNzREtidzNlenVUck4wdGx5eFpaVVRsSU02NmZSeGptbEJH?=
 =?iso-2022-jp?B?RHJXa0pkTkY4eTA5RDFCRnA5QkxRT1R2YzdHcmtzTFdubWpjRDdhSVhM?=
 =?iso-2022-jp?B?VHUwd05KRDkwbVF6bDhrbDc4b2RWQjM4R0RUS21XV0dWVDJJLzNSN3p0?=
 =?iso-2022-jp?B?eVFNczhoZkR0ZmZzMEYveGNNSXk4WUtCRXhZMDZxdDZuWUE3YkMwMVU0?=
 =?iso-2022-jp?B?eUxJTkJkeW96SXQ2Mlh4WFVOOE9VSFJNZ29xSlZCM0Q3QmJMcGdyYzVM?=
 =?iso-2022-jp?B?ZlZXVmdIL2JueTdMd1NNSVErM1lyZFNLbERzTGhsZjFPakJKTHo1MExl?=
 =?iso-2022-jp?B?UVpkdzdwRDJOQzN6eFJLbUV0eHVTaTBaM0dMMHFuRlpZcnZkTTRzVHVL?=
 =?iso-2022-jp?B?T2JSbGt1ZjV6elJZTCtuUEEvWE9PMS8yWHBscThqaE5KK1NlT0h3OGpn?=
 =?iso-2022-jp?B?UGRqd3YxaFJPanpPa1FKZStibndUOEZueThzUkNDVzBLYVZSdmtuZ3hM?=
 =?iso-2022-jp?B?U0MxcmF1TkdGYnBnU3hMMzFhMzRDYUQwOGVsTFA1Rmc0aW5xTjdkcXNR?=
 =?iso-2022-jp?B?bDA0NSt0c1lNSHN6M0w4ZWsxVncyaTdDdVVJNW9USjNUNm5BaW5DbFV5?=
 =?iso-2022-jp?B?N2V3SEY5VlBJVGh5cXkrcWVOQ2RZSHlSQXE2dSs1UkYrZVNNNjdUemhj?=
 =?iso-2022-jp?B?OTcvREpxbkFsZ1EwOWJBN0VRSlJ6aUthYUYzT1g4eEhlRWZkQ3VKVGsr?=
 =?iso-2022-jp?B?dGdvY1lKZHVuUklpV2VSOEQ2a2tQdm1MZ2hpalpmdVA3bkdEb0E1MVdL?=
 =?iso-2022-jp?B?WmtHWkpVRlU1aWFyMFkwOUptRzYzTW4xekpPODBWcVJaNU9BbCsxQ2JG?=
 =?iso-2022-jp?B?R1k1b05OMkM2VmNjeWF3bllFaTZBakMxdjhxRmhGd0JQK2FoazR3eW1o?=
 =?iso-2022-jp?B?VzBSTWdUST0=?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	EIXsPWHuVZRGRXSuP7BP6qltF+1t8n6gZhiDi62z11sQgENl90MkcWcEniM1Z9HJuLodaFjM1snn4IFECUHEHY4KmFJ1y7YS+Ck7/f/F4Gl9OCB+56NYIO4+5VdLA1juxasZ98NlUHeoFSWJv9yPtx5jtK4h6uNhRMFXstKGfdSUoZ368cIlsFMhjSGdYmX3CKwNK8Gv+AxnDcKB4Jhhxqqfld2E05JM/HUlwsezdFETuPb8XtfaWzX1sMP5FVfBIiBw9zfTpGNiEBxZM6+vZvvV56ncnK4aCZ9ojV4w+frl0sNeN7avJ/pDoOEsLkixvhr3szWem2SVapaPjNwonw==
X-OriginatorOrg: mail.toshiba
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7PR01MB14818.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cca9b85-082e-4c76-3ee8-08df1222f204
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 05:42:20.8192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YhddowK3szegc5J0w8Pu/BfEkjLZFNk9/qLpuzdePBBm3LkJadK5MSJqVG4lQtPq+y1Oc0fLVpffpBWIhKBDTI+9iWhJPFesY9rmOX/bitlD79njD+A3xdocDjv4x9Lg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9997

> -----Original Message-----
> From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
> Sent: Tuesday, September 8, 2026 10:19 PM
> To: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Cc: iwamatsu nobuhiro(=1B$B4d>>=1B(B =1B$B?.MN=1B(B =1B$B""#D#I#T#C!{#C#P=
#T=1B(B)
> <nobuhiro.iwamatsu.x90@mail.toshiba>
> Subject: [PATCH] MAINTAINERS: Change ARM Visconti5 architecture
> maintenance status to Odd Fixes
>=20
> ARM Visconti5 architecture is not currently actively maintained. However,=
 if
> patches are submitted, the fix would be applied.
> Therefore, this changes the maintenance status to 'Odd Fixes'.
>=20
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
Applied to my 7.4 branch.

Best regards,
  Nobuhiro

