Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020085.outbound.protection.outlook.com [52.101.84.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D5248550F;
	Mon, 14 Sep 2026 15:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398034; cv=fail; b=EU8xmhwo55iS2irynOSrYd01rCuAco779AHjklESseTzbDdak6NI8Ial6f610xr96kJ3nAQoo1CG7AtktMBsTylR7r2gMbabXjPCVNOIb1XlRYII4Sv/zc1S5dpMbL9EgsMiT+zbxFux9rlem/pwganNvHZLLIFK8jPrjYfIyks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398034; c=relaxed/simple;
	bh=GWI4TMNwupUpEPLyruzWs+qgJXaJ1/s3kSP+kbwCJKE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G4pPISlWo0+XhC7D5USdmuU7SrN1PW8ZU18YCY2WCaxRf4P7ZjLtT6iwhEC3yQ/PfgJOmxk+wCmI+qwJNmdVld/nk28b7MYHYsHA01NOEzda6HemFPL2FcEdAebm1uZYT/qtAdUpx+8ojKjVAdtUewPOneN+3zaqqB4+rlbRvmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com; spf=pass smtp.mailfrom=variscite.com; dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b=NFdYqSnz; arc=fail smtp.client-ip=52.101.84.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=variscite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b="NFdYqSnz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flsegGecGIEP8Em4jS9a4sqikbXumdCh/6bpGRP8wEo+QMrKSV5e9fZq1z8nAIAhuR6bN2XbiTx9G0cZajHXQJ+34GAhssbZLvV/IsHQCM5fb/2FVEd1b9CsUANho86HBPFP7SI1qvsCtKzatiaIjVmlJMnxkLNGn0/jzUM1bwlTwII9jMHdjQ8RXkLD0WAJ2GKv2n+rDJlwUXTLilwi6CYqLFp5PpHjaX+is7z8piuW1fFOYpFIhivD8N4yjTtLt+5rUZnSN7+VZ4RBnIX28zEo8fuJfnuKyTtMcpTgJSjX8XjLZLj1Lk6pAiVKzVKzAw0VVEIfa4Ui7yrK8Ztc7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWI4TMNwupUpEPLyruzWs+qgJXaJ1/s3kSP+kbwCJKE=;
 b=MZZwLMtmW8nkmfpL9PWWh07WarwJvmUv0zhtnhIg56VSuifdhfjcIbSX7oZ0lUAcJe9XbG9dGQjmYq6N6jlh+FBKZYjdg6Mkb83Xl4rL3jLKasc8enlqKycHN+ZRRn0ScAWHhOfHVm02DmTp/nks/lyN2A6UUKzRroXuXVji+xIpjIZBS2V3BPOLjNeVVI+qWyKrecB/1EJoWDF5koVysiQJJc4Y1xY2c2NSTJQJpPXEsiBz6CAyoY+LgwnVXgTGpsJwObTeksQbSHX8CujlLsHf80c7I18Nf2eMomlGsfO/Ge9JEc0O1FTMe6QL4B1Wbu3fcSWdxRhgZUPAQffwIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWI4TMNwupUpEPLyruzWs+qgJXaJ1/s3kSP+kbwCJKE=;
 b=NFdYqSnzmHjGoIW63+9QvQBcA0UR2PpH1PQdOpSipiDVdRb+ceR4iasFYGA8eIUsogKQ6Ukm6VSAwLv57veeVD/HZYBu60BKQw0/q8h61mPH8cimKxqEmPn7wkWcDwqQxQ5CcTlVbGFOTYEZ1GWrxY3dPdC0a3caAaiD3iER23IikkBtTsljRBj9CzlHQK2vGMBcvmWp6PX9rLIUN4J9jEw7geesqQoAzKGMZIZWwhBvT88nR7N7x1CUvgtU1qBiwN1RWfWf3+v1s63ZjplH2yOBTx14Xfue5VnafqLwXTD5b0S0zacew0CLgKOtdDm3q+r3aGE1q+d6QHOQYrk07Q==
Received: from AM6PR08MB5256.eurprd08.prod.outlook.com (2603:10a6:20b:e7::32)
 by BR0PR08MB185883.eurprd08.prod.outlook.com (2603:10a6:2c8:2a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Mon, 14 Sep
 2026 15:00:27 +0000
Received: from AM6PR08MB5256.eurprd08.prod.outlook.com
 ([fe80::5caf:2af8:a051:9b55]) by AM6PR08MB5256.eurprd08.prod.outlook.com
 ([fe80::5caf:2af8:a051:9b55%5]) with mapi id 15.21.0428.004; Mon, 14 Sep 2026
 15:00:27 +0000
From: Stefano Radaelli <stefano.r@variscite.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Garrett
 Giordano <ggiordano@phytec.com>, Wadim Egorov <w.egorov@phytec.de>, Robert
 Nelson <robertcnelson@gmail.com>, Tony Lindgren <tony@atomide.com>, Nora
 Schiffer <nora.schiffer@ew.tq-group.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
Subject: Re: [PATCH v4 13/15] arm64: dts: ti: k3-am625-var-som-symphony: Set
 SD clock pins as OUTPUT
Thread-Topic: [PATCH v4 13/15] arm64: dts: ti: k3-am625-var-som-symphony: Set
 SD clock pins as OUTPUT
Thread-Index: AQHdQKUGfNsOMZWmUU6u1Rb3bF+Uz7bOL3eS
Date: Mon, 14 Sep 2026 15:00:27 +0000
Message-ID:
 <AM6PR08MB52560A98F8B0816810B0EB3AE9BB2@AM6PR08MB5256.eurprd08.prod.outlook.com>
References: <20260909214743.899477-1-jm@ti.com>
 <20260909214743.899477-14-jm@ti.com>
In-Reply-To: <20260909214743.899477-14-jm@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR08MB5256:EE_|BR0PR08MB185883:EE_
x-ms-office365-filtering-correlation-id: c5a31ef7-3b37-4d19-3556-08df1270e97a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|7416014|38070700021|56012099006|4143699003|10067099003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 rcY2LQSCtkw6CumUsf9vt72QxQqJIth4/BLKkisOoF3DHP+33qWfHYr90pbrTJWPnpLc6iz1VqAvBqqWDNeLC55UTAk1CTSpOpYMPlK7o+fgr494eBUKDguHWAqzZnoPEhv0us7W3LWkSPJcyTK5ssDLClJS5ax3Kh1uFK1z5WmYmU0mDIkyGKeFPm38bScnOl8P6A0RWIEeLRGg+6ZYbUfQ+Rb9fCCHUb5oeqf+MFCRnJZ9r3LqyLGYcN9yL7Reg2BM2wvIEIJ+Dv/2lStpeJNRH6C966J1v7b42tl5jm5EcXUiVmj2RfPYMRHAHjvd8nw0edaPcM1CzjvTRN2jYpTtWFsB0kljNuY4n2Lw/lIiIHhRZzoJvzl9mvd5Oo1ueA/LgVKu4qkZrsFtZG09COC+tnq0UbtMdmIUt6JMXQRR6L3Ro+KvJNMKjZNQzlAJq+Ja1zCBulvxvcagiyfrmIkB8RSBvtpEClM8c1pgh0GHedEq3AwDuz4DQGSND/OHHd1txz/JHKEodwf6T5bZkFFt56G6BgUtrlEA4aM1Jao0rOBaIuBOK7TyrHkvwMpckpterajZxwQb15s8toxi+O2WZKvao4SOVwSjZxWE6c3vOtR6cydM+OUMQK6nkADmk9tg7TUXssY4//rHUHJ048DBtmynSVZl6BHZK/GFyieQWiVc++Cr3G76UA/O3aOHgIzQGtOIdCqisnxap0QSYmmNky7ZkR1BkNbKTEfYz2U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB5256.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(7416014)(38070700021)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?qKWBoPTLdjHi8KN8IEQlibqE9G8IyNz0krToJC8KSyWTIhTy8sk2VK74qE?=
 =?iso-8859-1?Q?OJvFhAlA38k00I6YYXNVNnAtMOLDvFKoMyNsLjb1DUVRivjHqZTxMZbVSp?=
 =?iso-8859-1?Q?VWm6m9LzGIWIkjL7trBa+8TZ1+AaPrFc/ZG5ZDFsiTGNYItZTOXHjNcPE7?=
 =?iso-8859-1?Q?kpZwRmxMAzRJyYmWDANurB3nduFHOKXc9DixbJSzbiD92KCLydGl//eLGT?=
 =?iso-8859-1?Q?3uyvGDCsaN+Kfs/4sKzRhSDfAVU1HCxgp38v5KSpp0PuzpGW1spkLn2a3Y?=
 =?iso-8859-1?Q?QJaxFSHa2t8bNYtd5vZKFdirRozHiZC+sNRh0GEtXbJiPMDwcy2i5DBNZx?=
 =?iso-8859-1?Q?UE3fStWn4PyN9591MohCMEsvGpcK2tjzsALagy3wSXuQLKWh9xUFKH+VY4?=
 =?iso-8859-1?Q?BeVT0AJcp0+exxBymW39Zsp72tM7JKxWMa4VQE2FrqatIQmKryEEopAJ98?=
 =?iso-8859-1?Q?t8yEyGiEamd0Q74iZdTzggUhzgtX33YljR63aDeEOnOrKeNaiKujtSjoiv?=
 =?iso-8859-1?Q?/p2ynYbxs1YeYEjwlZEi3qVvNA8uBsZWBHOBZ6zWfzdyHakxeOu/JbVI+1?=
 =?iso-8859-1?Q?gxlGr81v5qCatJ9vqFv8Yn4AtMHjy3NSZD3xyjSJ50mt0tg04LWiZmQikJ?=
 =?iso-8859-1?Q?U2AOHh2h6fJNx7U3DfQ+oGVxJu6b5vY9Xs9KtXmBR4XfhTbhbxYPf4l66I?=
 =?iso-8859-1?Q?cUVjBA6A1/pPJOCYEFVftmqHbaX+Evi5Vuu23SGgQZfUr5hR0E5ERzULGN?=
 =?iso-8859-1?Q?jajBoNf0i6xTjszweqXUFXtZCx5Eqd9LaXDKwwVVYZxX7f+nh+OedZn2lY?=
 =?iso-8859-1?Q?OwrjozaK3CQrJrvgUiQ/OZ9CjxqPhCY9SNbl4PQenMCF4xT2D7sUukTQX5?=
 =?iso-8859-1?Q?HEoakDAVtpiNjiZ7WsRC35lO0TcLgZIdstQPRs4MHGLCAGWEaz3JDoDSkt?=
 =?iso-8859-1?Q?WXiCU3KhOZ4DW4irjvd4VpzR74gdmRgO0gYas5+6E6QzvQCPfCSq5EhLZ6?=
 =?iso-8859-1?Q?sdtmMzc5uop1sunIbUMHOtQ8a9TFrjbf0BR7XuS3v1gQJuyIadNAB2synk?=
 =?iso-8859-1?Q?pmgK+u7SZBxubSIMm+5/fsUdEkxfo6faaT0BaivwYeEFgTlCtvdPTfgTxm?=
 =?iso-8859-1?Q?edUK37JaLDIKIw+qw/CivRcFaU4KyDJ8C/SmoQJsknHK38a8qX5TusBo+0?=
 =?iso-8859-1?Q?kKG8YToNj8ml8mcvZcEAcjj4BMCT7FZNxTYJQMfrv1UGLwtffkHBGX+ylK?=
 =?iso-8859-1?Q?N9XlfIxw8DpT6oni73sVxuMnB7VmKSqDa8JwIVKPMy3ERVUwzdD7UdRPH0?=
 =?iso-8859-1?Q?nRtFicYNOQvo+xEYTtX/1+Jh99rmO2T73Z0zfVw4jAJNd1GHN33icY2p+Y?=
 =?iso-8859-1?Q?GVuHLFyPIRYEFNgCiTn+fEVDsd4EPpu2ae8u8kfgaf8qiD/WTtHKFCjr9T?=
 =?iso-8859-1?Q?SJlnGot4S48hvCp7UocKCCbqt6c5Rv/euDz6vWHE055OvwIU3JL7f6nbuG?=
 =?iso-8859-1?Q?dbPVueDHTOPCda9ZjWupVoHJz3yfsyufvdrzCA2xRBw09X14X+vAYRBeg0?=
 =?iso-8859-1?Q?1bQ+3SO/+pOg3Z3lmk4G7uOeYvdi1qdIx7OM0fHCTfivb7EFffOdJeDJAA?=
 =?iso-8859-1?Q?3wuCdtbezoDXZ9e5Q2OzGi/z7BdmcGQcE+lQXAOWXGekMOMKKZpGCOZB+b?=
 =?iso-8859-1?Q?g1Jwku6TpQTsREHBSX+HxdKyrPp+n5G+ezzuXXWGpSw3rMsWdTSr88FWyE?=
 =?iso-8859-1?Q?g0143OIu+LsvbgdVHXg6rPlJgwclmwRt2Wa1eHScaWEAmnq7KGIVQwSQLD?=
 =?iso-8859-1?Q?62S54mgbOQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB5256.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a31ef7-3b37-4d19-3556-08df1270e97a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 15:00:27.2013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Ovzvh6NFh9BZYFTmYknRrLQBKSaDIjqYb0G1d+e054/CPEiv6kSmx3I77SZcJeypXg3b3DuXJOvCJpT1UtWig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR08MB185883

> MMC clock pins must be configured as OUTPUT-only per TRM [0] with=0A=
> receiver disabled (RXACTIVE bit =3D 0). Change MMC CLK pins from=0A=
> PIN_INPUT to PIN_OUTPUT to match documentation.=0A=
> =0A=
> [0] https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O S=
ignals=0A=
> =0A=
> Fixes: acb4cd35dbd2 ("arm64: dts: ti: var-som-am62: Add support for Varis=
cite Symphony Board")=0A=
> Cc: <stable@vger.kernel.org>=0A=
> Signed-off-by: Judith Mendez <jm@ti.com>=0A=
> ---=0A=
> =A0arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts | 2 +-=0A=
> =A01 file changed, 1 insertion(+), 1 deletion(-)=0A=
> =0A=
> diff --git a/arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts b/arch/=
arm64/boot/dts/ti/k3-am625-var-som-symphony.dts=0A=
> index 7951d7ec952b5..082bf81143dcb 100644=0A=
> --- a/arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts=0A=
> +++ b/arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts=0A=
> @@ -391,7 +391,7 @@ pinctrl_mmc1: main-mmc1-default-pins {=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bootph-all;=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pinctrl-single,pins =3D <=
=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AM6=
2X_IOPAD(0x23c, PIN_INPUT, 0) /* (A21) MMC1_CMD */=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AM62X=
_IOPAD(0x234, PIN_INPUT, 0) /* (B22) MMC1_CLK */=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AM62X=
_IOPAD(0x234, PIN_OUTPUT, 0) /* (B22) MMC1_CLK */=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AM6=
2X_IOPAD(0x230, PIN_INPUT, 0) /* (A22) MMC1_DAT0 */=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AM6=
2X_IOPAD(0x22c, PIN_INPUT, 0) /* (B21) MMC1_DAT1 */=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AM6=
2X_IOPAD(0x228, PIN_INPUT, 0) /* (C21) MMC1_DAT2 */=0A=
> --=0A=
> 2.34.1=0A=
=0A=
Reviewed-by: Stefano Radaelli <stefano.r@variscite.com>=0A=
=0A=
Thanks!=
