Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1C948FF6A;
	Fri, 25 Sep 2026 10:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.34.181.151
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331888; cv=fail; b=ASQ5meIkdE3S+VAtx1Rlm3ax3JsRoe1WKaPNXjhY2+oA+UsGv2vJWbymEMvNpADJ6Gwn5uxfCkYhMwr5XuZ4rkBv4hb7XV7kbFxuXXtMdPRnpqLoQc0+2EWkBhRhCFygFpr+vU91mCq5X4KVbDsb7NIvU4/hxwpURwv3xssvfpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331888; c=relaxed/simple;
	bh=J/i/Y0nPhDlPzhd9yL5G5bnReMdXqrY/McIkpbnHScY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gfWmcR2hNjI5LB91jJlLHE+tNdxWlfBHVxDZYT0d96YAVH1mZXpSR7qgCWQeOMqdcu7Ti/oWiWEGqoEOFbOYLLEsObfpxOOXqzmgERzaUxOSgOV4ck394dpFv9bt3IFCkDvquGzWVxeF3IMbEPqmu3L2eYEk8JrRN3intTWRMhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=ttQZ3jih; arc=fail smtp.client-ip=52.34.181.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="ttQZ3jih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790331886; x=1821867886;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5vrHKK2wXIq80+k1Q6gIa/NKdEv9mZ5B5ZkDUsD2RxA=;
  b=ttQZ3jihNbmv+2CWWeyR1Q1C15EET6KBys/9FCxWj1kgsKsAi1CTapzM
   mAPHZeql7dBZ4dAXZnM0BqGruatjHyUPqQijDXQcfVpp8oRKQz8XiqEB+
   /Nc3WEjPSkVk7NPIihzXI5fzjfy2HFWSwMmnT97prMITpSE0R/eeHTzkO
   3EwG3kPIKNw6yrZXSsLwgFzeFcFaGqS1uxpW4eyX5cdeBFd4Y+QpROISI
   HZqK/8ya7L48R24uWpBf5/y2Acu1JCbHD7ENVH8KKgMAw5tHb96TwEvwY
   paTx2yMmeTIIzNSG40+2KCeNJHpA0I3Cjfw9d/XEnTeql+7FQcLj/AyFs
   w==;
X-CSE-ConnectionGUID: Jk/E/QghTh6FAUPXuh4d0A==
X-CSE-MsgGUID: 8hVTuLnwRN+KhdWu7pDxFQ==
X-IronPort-AV: E=Sophos;i="6.27,122,1787011200"; 
   d="scan'208";a="29615324"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 10:24:43 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:5004]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.110:2525] with esmtp (Farcaster)
 id 96857ec7-60e9-4899-b681-4712c8755220; Fri, 25 Sep 2026 10:24:43 +0000 (UTC)
X-Farcaster-Flow-ID: 96857ec7-60e9-4899-b681-4712c8755220
Received: from EX19EXOUWC001.ant.amazon.com (10.250.64.135) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Fri, 25 Sep 2026 10:24:43 +0000
Received: from BYAPR08CU003.outbound.protection.outlook.com (10.250.64.238) by
 EX19EXOUWC001.ant.amazon.com (10.250.64.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49
 via Frontend Transport; Fri, 25 Sep 2026 10:24:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKG4bVs48/MSx+92Iy/uNrPjMrnHVEJ8muKZ8DiTHZcarcYc2ogDMGxL9dzO5XP+mIQd8ittTsdL/w09cAJzbWkLSUZKNbEhUvxQ5iz6h1nGkiG/RcDRPK0eB6++vtQSNPLe8oSBNys1+rK8qn9B8PsHcr2qgbDApTSaNvRdt0bgdZcq5Ccy3CMpOBH4BuxdNBWclaYj8RnOXY81axiXZ2mVtYBUyiGeN2xxpEWrf2Xh1IKA6m4IFGuLjUEEx3MRgDeRRUtvTybfOg3RP3NSlHE3UwO9sl9X6x6ja1dbce6PUnTPtwHLVT9PC9cDban/sbwFAR3E48o93t+ce2RCDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vrHKK2wXIq80+k1Q6gIa/NKdEv9mZ5B5ZkDUsD2RxA=;
 b=yjy20b2jgV1bYrKWFXyg8qOTnHgGPcNKerxL8E94zqSBwoCFof9sy75vodnlGQF1BUC2rlmpgUOWIK8PDzvLOcWVU5mrrfrm+yGKrvHN8SF2guFuVr3V77guL0FoMGJcopkUuX/SdM/SHz6oiXBgbV1/snepgfW+apUId4y4XOHAqlYShSpU1HYQYIZWZBpvAEVkNKGMda22pyoTSiquANxyKTjJUAoAx8q9fCbXah/aj65tK84t4oDtp6FMXewVtmZst73pNdyIduvF6H66GPkJz7SPkxIx5qpMRzrXWSOtGJJlTYgdnY8TVQwSCnMCj6qIlLeTAKgl2X4GzPGtJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by DM3PPF0C31ADAB2.namprd18.prod.outlook.com (2603:10b6:f:fc00::688) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 10:24:40 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 10:24:39 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Conor Dooley <conor@kernel.org>
CC: Thomas Gleixner <tglx@kernel.org>, "Shenhar, Talel" <talel@amazon.com>,
	Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 3/6] dt-bindings: interrupt-controller: amazon, al-fic:
 add error/fatal groups
Thread-Topic: [PATCH 3/6] dt-bindings: interrupt-controller: amazon, al-fic:
 add error/fatal groups
Thread-Index: AQHdTNgRRepjaZTOqUC/TzSfSAzaZQ==
Date: Fri, 25 Sep 2026 10:24:38 +0000
Message-ID: <BY3PR18MB4722BD55C256787423DB5CE7C6802@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20260924062311.37308-1-farbere@amazon.com>
 <20260924062311.37308-4-farbere@amazon.com>
 <20260924-majority-amazingly-58df3d86190c@spud>
In-Reply-To: <20260924-majority-amazingly-58df3d86190c@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|DM3PPF0C31ADAB2:EE_
x-ms-office365-filtering-correlation-id: c470d547-d954-4e0a-93e3-08df1aef34cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|11063799006|5023799004|56012099006|4143699003|6133799003|3023799007|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: CMrTbq/lj2ldR7qH4/AnaSznMZHIJYosWxz3yMbOsccD3Sg1A3gDUBPPiCjt0zLqiKRel18w8eCg5d4pgrhspc+ir3sVktMTVpiSanTCNXGL2b1Lky4BaQxIUOowklIEvk1YTpH6tC456fbf9iNrIKF5VztZz6tacY51weugHskPhVXjyNSA0oemmLzQJmPAR+I29v0zxcjP73utf4Pz8HYZGMy8wxXDbMuHsUd5u4Gt7J4zDr9UzxCLn80Yjlw82bMSqUvXBKG+ISOqrq1pm7p8jWBIhIUiZA3Wb7woh3V5GPCXY6O55pk9h78mpR6UvP/EmXIqXnCoNd3v1xFU6PsW0jmDaql9TsKE1BUc6xzXUjXSESuXUBnm+JBLLz1rnRulgMO/qNeFz105TnMsyZ9AbqlwgMxqCiRTgCWGUP5MEWb31bYiq6dHsCCYJIkdoRttNcpdSfsHZmvivDKjflY0MvUdfZ47TO9FCOBj21J9C+bhtuF5Ym+4ScCvQVScsmerCXVeQvjeLL9qlv67Zeal2lBbDulrbWAm5x844dLm0tqxzKNrHlG37zLtVZYLfaTsB79ZsMT4aOWtCsimByAOQXImsVABYLZnSRjI5J1wNpP9hZ6DRmRvo/hOkhMUpWYdcNjZ71eOfBokXaxpP7VcW2QMsL/rwJuitJ9LKSugRV0YAcg4C1cugppCZPMkUJOJ2FoFnVlchpfZwB5UopraRJvGG6unMJTtvdarvCk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(11063799006)(5023799004)(56012099006)(4143699003)(6133799003)(3023799007)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CpqyVY6aogm62rELGvGLHbo9MNis7Dk8pZ+92PJ+Sgn9vm/TGuaaMx6DkZl/?=
 =?us-ascii?Q?IEZ0dy0hSNhcwYv/fUim0cwN62wffuug/BRxVWr29mWlzcSrB5yGH9yPujwx?=
 =?us-ascii?Q?kjft5y4eICSL1bLffG+3BQD1aKWN6SlWHewkp/+zKRQf6Rm4BJSEK0PF9uKm?=
 =?us-ascii?Q?yHbH5Dc5tu/t84Vso5wMcsZSZofZXUL3x6jGrAaTynb3LADWa9JABkYP029f?=
 =?us-ascii?Q?6coYYNz8bOeWvrs6tNPdGo6zWlURKsG2z0sOxvOQAncHKTKTWvwnVC7O1Z44?=
 =?us-ascii?Q?t0QwsJecB4lyDmxGZD0PG0u6G3fRqqt0luzZh3G+u8oAcdQ7S9EXpVKiifIi?=
 =?us-ascii?Q?HsdmEFqTO37mnKGTGkhyWLEOO13H6D+UgYvRXolVwIZx+tj1IrG7yi06zycR?=
 =?us-ascii?Q?FBRAzfIVF9OmMT3cuBzjhiKJyXtTKQIsJErX12NTQgVOeuK7Ja2HVDwVKqhC?=
 =?us-ascii?Q?8vN3tW2XtB04XZfdqYctg3I4QJSA/EwuL1oS+8eBObDxn56XcfiTRDe0Blji?=
 =?us-ascii?Q?jTQRLLcIRZwMEabHQTVAkT8Rg0AsdJ2Yp4D7cA0O+pe49TsI52qoBNv5pNaZ?=
 =?us-ascii?Q?1LkTImalJ5HO+8fR9lhbq5m5VVH2SDu+3K8v457Tr1bGpMLZ+8nQVO/Sadp+?=
 =?us-ascii?Q?HLwoBr1y6atIU/IImPcQW4pmvw283sjNdns16AAiLImBFqsv7zvPjD4hgqoN?=
 =?us-ascii?Q?OjHER516nOUqwM/u0anqO+gykMr/V/3Dn4JgwfOmWNnGtE5nRZSHwq/q3dvX?=
 =?us-ascii?Q?d5nXWdQF3r9wLTueiIItkQsRsIMb5D3w6+dRqGZtlKFHuT/aAFiymQYh+TQ5?=
 =?us-ascii?Q?1gh40xh/75OXDDmVzUcH16BkdgsUwCRjO0trXJIcDBVoTBxnoZ6CKq/4lCy1?=
 =?us-ascii?Q?6MoqiInmWumbufc1PQccghCKGGUgiE1tA1zDHBErPGTkbh+EBxtpVEAkCpQx?=
 =?us-ascii?Q?tDbc4V88rC/l6X8jbZml/DNV5ZswZylrfqcGvla2jeEgovCgZBTwHDi19R+p?=
 =?us-ascii?Q?JUodSavDPVkZu5pVtKjitig78gb60TwvX/Dwzf0LsSk93p9e82GZEcVdOP/0?=
 =?us-ascii?Q?5vmMrvff0z6eSxESPhxlVpL+9RjiuCIWtAiduxPDvwdSwIHX8WHZ1G9KGxbp?=
 =?us-ascii?Q?iPI+NybpSp6u/V1Gidl0BPT00HHvvKhfrLfDsDGhABvHYjeESl7jdjjI0eRE?=
 =?us-ascii?Q?kuxx79uzsSvp/6OJ49XYdTM3Q/ZTGW9h2vWe0+81u9flTSX9BOUsHUy3upmb?=
 =?us-ascii?Q?qY0+JPQFs9zDS+cQX55tx9p7Dx+5GWv2NKV+9pHuHXyqPjVRb3X3knuylq3S?=
 =?us-ascii?Q?ZIgQqJEKFxzrh38Wtj0Dco1GNhpJzKplgYD9a2sCFRyh8wFrfr5I6gtSKoPz?=
 =?us-ascii?Q?tgSitKGa9V/P5PzMfW1zY7aTSNjfjaeUQ8pdxHr/PJwnrDVDForvuFteeIRH?=
 =?us-ascii?Q?4LjPeRmSJPnT0qQFb8hUtjMETbUZ7XqJv8lEAKQgF3kTLGTphiNRilWD4SpF?=
 =?us-ascii?Q?m/emEa4UnfWpFqfUndUBn7He584jqmjKbWe7PknpF1ltO1+3vrLvrv9ioIF5?=
 =?us-ascii?Q?PvdOiv1/Y/vN2X4B9MFK6SqYV/NdfhzeGtRhyXnT11tMQJjLcZUrmC+JCw0w?=
 =?us-ascii?Q?3Caz0A8s5eskilb9q2MiqtBJE9GillxzwSkblXiHTAXsulD6VoRuRror6AEf?=
 =?us-ascii?Q?IrBOZXouba8D13LActYjfVkR+eMjTI2+RBlOdcEs2qaJV6lf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: vFchYi5nNR6yIxLScBJNoeAoCm0a3qBxluS+iY9WkZwn+XPPwWdZhh5EiCBmhPvL+Q/v86xkEuyCkbOJHgGduPanBc85CGLWP49l7mS/i76SxIX5jcMt0iL0A/NpUdyrkfs+XRNgjKs/1FGloPOe4seEB33hLa9j4QNtqSKD0cWYCkOMxII+yUxurVSzuUYjlGp2JbBP0eu2K7Y3KmrT6JGVd/gj6WtA+XEtAVcbROtNDP9/aWxlNDg9tYkE0RrIgWLREJUF9q2ShF9bm2kZ9VoALBIErskRoZLiF4a4SricdoWCKNhxUhifGciI3IiT4CB72rEJyXYvYslbDTuMOQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c470d547-d954-4e0a-93e3-08df1aef34cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2026 10:24:39.5019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 08laiAIqHjtSQ1CZ0439p3AwYsVHXaRB8E021jJFY89Oeyx46tvh+L0ThVFk+oxSe5P8SaD+ox4FfGqwQyoBqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF0C31ADAB2
X-OriginatorOrg: amazon.com

On Thu, Sep 24, 2026 at 06:13:52PM +0100, Conor Dooley wrote:
> Without any explanation relating to hardware, I find this very hard to
> understand. Nodes and compatible strings are devicetree concepts, that
> portion of the commit message should explain hardware detail.

Agreed, the message failed to describe the hardware. Here it is, and v2
will carry it.

The block that this driver calls a FIC is the generic Annapurna
interrupt controller. It is built from groups of up to 32 triggers. The
number of groups differs from one controller to another. Each group has
its own 0x40 register block.

Note the granularity, because it decides the shape of this binding: a
node here describes ONE GROUP, not a whole controller. reg points at
that group's 0x40 block, and the 32 hwirqs of the domain are that
group's 32 triggers. A controller with several groups appears as several
nodes, and controllers cascade when a tree needs more triggers than one
controller has.

The group registers:

  0x00  cause
  0x10  mask           gates the INFO output
  0x28  group control  revision in bits 29-28
  0x2c  error mask     gates the ERROR output
  0x34  fatal mask     gates the FATAL output

A group has one cause register. The mask registers decide which output a
set cause bit drives. The classic revision has neither the error nor the
fatal mask, and neither output; the revision that added both reports 1 in
the control register, and every group reports it in its own.

The SoC carries INFO, ERROR and FATAL as three separate aggregation
trees, and a unit is required to keep them separate: mapping one event
to more than one severity is forbidden by the interrupt methodology, so
a group belongs to exactly one tree. A group in the error tree has the
controller's ERROR output wired towards its parent and its INFO output
unused. The error tree terminates in one dedicated GIC SPI, the fatal
tree in another. The two trees differ in trigger type as well, error
being level high and fatal edge rising.

> What this sounds like from your commit message is that you have a new
> revision of this block, and instead of adding an al-fic-v2 compatible,
> you're using two new compatibles to describe the new features and using
> the old compatible to describe the common featureset.

Not quite, on both halves.

There is a new revision, and no string encodes it, because of the
granularity above. The node describes a group, and the group reports the
revision itself, in its own control register. An amazon,al-fic-v2 would
put a controller-level version number into a node that describes one
group of that controller, and would duplicate a register that same group
already exposes. 4/6 reads the register instead. v3 reports 2 there, and
differs from v2 only by an erratum in the two new mask registers, which
is why 5/6 is four lines.

The strings name which output of the controller is the one connected, and
so which of the three mask registers the driver must program for this
group. Nothing in the block reports that. Cause, control, revision and
the 32-trigger domain are identical in all three cases, and the choice is
fixed when the SoC is wired.

> Without a dts, I cannot say for sure.

Fair, and there is nothing in tree to look at. The driver and binding
landed in 2019 without a devicetree. Here is the topology, which v2 will
add to the binding as an example:

    /* group A and group B of one controller in the error tree. The
     * controller has a single ERROR output, so both groups reach the
     * parent through the same line.
     */
    err_fic_a: interrupt-controller@fd8a8500 {
        compatible =3D "amazon,al-fic-error";
        reg =3D <0xfd8a8500 0x40>;
        interrupt-controller;
        #interrupt-cells =3D <2>;
        interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
    };

    err_fic_b: interrupt-controller@fd8a8540 {
        compatible =3D "amazon,al-fic-error";
        reg =3D <0xfd8a8540 0x40>;
        interrupt-controller;
        #interrupt-cells =3D <2>;
        interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
    };

    /* a peripheral's own error group, cascaded into bit 6 of group A */
    interrupt-controller@fd8a8580 {
        compatible =3D "amazon,al-fic-error";
        reg =3D <0xfd8a8580 0x40>;
        interrupt-controller;
        #interrupt-cells =3D <2>;
        interrupt-parent =3D <&err_fic_a>;
        interrupts =3D <6 IRQ_TYPE_LEVEL_HIGH>;
    };

The first two nodes are what patch 2/6 is for. The groups of one
controller share that controller's outputs, so a real devicetree has
nodes on one parent line, and a chained handler can only be installed
once per parent. Cascading adds more of the same, since an aggregating
group collects many peripherals onto the line above it. I will say that
in 2/6 instead of "on some platforms".

Thanks,
Eliav
