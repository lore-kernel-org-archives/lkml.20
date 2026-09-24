Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012007.outbound.protection.outlook.com [52.101.66.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6364A093B;
	Thu, 24 Sep 2026 16:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266482; cv=fail; b=YfoFxR/vlkLlwOKAuFzbgY3BwzqGdcevAHRJqAoBY7ZEm/PyYtI2mMD4VVn2zKZ1gc9JDptcVJGG1rb4fnhvgcn+BP5U1EljFC7ku0DaUPbgi75yiKmoFPH3X2dxkh5hTa5flcIJwEYWOq785HXQQ0juGUe11ldNbRMRRe4jZU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266482; c=relaxed/simple;
	bh=9YJcFGEkpZJJTQalp1H+2FiY8s47wLD+modA8IHKj9k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t5kttNdijaUWizrsefUC6vSVxTkkJBq94IQLJlY75Fs3n5dMl7EMrps6d34orSaaJobalUs/+GM7vrLIXi/nyjpsgdPGs70Magiv9jcB9mqcsq5PxfqUYvBfWRgRbLvLLeljfmpAJbysNlNW8urGo7W6t0+Kan2MjoKDph6lkLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K9ddfhop; arc=fail smtp.client-ip=52.101.66.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K9ddfhop"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPFJNEK16sqHkbK5y/iZyguUabba/OI2O5T/26e44Fs7ATNe8EaFR1dnSkAoOPINWBXiV1K45PdLl3oYW/z7WgZz/EQ0UN0p+pVld4vHfvTmcU8aVzXb2s8ZS3rW/kwXQdi6xheTxpbNI6BO9xu5ZPtRj0rCaUTR9pLrIlMncC8dG8xdk8sN1SDnj59NyMMrJt36MwPkmRc7kSYB4HwfLgFY5pjLLRJrSSdMKVADrA27et3IYfK+udDPPoczWjhtW9cEpoYFtZATsTOXwX2yZ8xWrRHgHnhUwDJeFZI5U6RcSMqQNuosOId8W8u//wKNxaCTYVcOigRlsKXHHQ2o6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Td+Wzjjv/ZyMFIFnZhzVfT4DSSUCOFtgjF+A7K27Vw8=;
 b=ufY17DvyndK+r9xtveN2fDgwj3mfMTFMXpHzASWk/Zb2J02SxODDCMQ8jlJO/3boMFvLoyAf/zx5xikNbBRJcZqbtbfqT2W4tYQxPAfwRmR/VuaNVG78YCuG5FX9Lyvio8PkingDVqrt+Lmb7+Xu/4X+atT7PEQ7blX0nyLwKfK0I3CxvN265hocQkPO0pgUNa1389yKOrtbcj3Dqo7I5zXojSg3ALHCeCcHqPsLFO88KqTwX8uEeOES4M0tPGIfTNcau6G9IXxxZykQSNjBqJ1jHByh11EUGLG5Wc9kLVQiZW0oSMEiGshy2ya4NXeRfNVl+dhMt3dgLch/O6PDfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Td+Wzjjv/ZyMFIFnZhzVfT4DSSUCOFtgjF+A7K27Vw8=;
 b=K9ddfhopH/KQlO/Rih90ERYj/npiMyhr0auW9fcXxBHv/W3aeLtdRYXG+Si8L74N6ALlJFXmHmhH0eUF4Bq+vKk7tLMq56slNoUg0scmdmZjrmpVuf7YJp/RkxLFCa842KARfzGtW7AK3PIDVwontszmUJugxuZbBCjBR138aOuzf9Ugp/tBBDlRumOHxIFs04Y2TB5cOUmdHix/UaRfdgIJeVoA9f3alBYi6loVcx2i9slmzwYnR62oo9SkPxo3BI+uRDh5UodTH0RO0qtHVUl9/MhN6u9aoCuDE3xVx0MyuAROtw06MYAqvrsu2EIsf2FHJWkUIFh/Nex6pbTNIg==
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by DB9PR04MB8267.eurprd04.prod.outlook.com (2603:10a6:10:24b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 16:14:37 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 16:14:37 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Arnd Bergmann <arnd@arndb.de>, "Pankaj Gupta (OSS)"
	<pankaj.gupta@oss.nxp.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Randy
 Dunlap <rdunlap@infradead.org>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v51 5/7] firmware: imx: adds miscdev
Thread-Topic: [EXT] Re: [PATCH v51 5/7] firmware: imx: adds miscdev
Thread-Index: AQHdRFLl6qj9FWHmWUa7nq3I0AMEwrbRMnKAgAzENoA=
Date: Thu, 24 Sep 2026 16:14:37 +0000
Message-ID:
 <GV2PR04MB122713E45837EDC3DE804EAB895812@GV2PR04MB12271.eurprd04.prod.outlook.com>
References: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
 <20260915-imx-se-if-v51-5-4a7dac612cb5@nxp.com>
 <2034fb2f-f169-46a5-85e8-fa723ddb0360@app.fastmail.com>
In-Reply-To: <2034fb2f-f169-46a5-85e8-fa723ddb0360@app.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Enabled=True;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SetDate=2026-09-24T16:14:23.0000000Z;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Name=NXP
 Public;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_ContentBits=3;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Method=Privileged
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12271:EE_|DB9PR04MB8267:EE_
x-ms-office365-filtering-correlation-id: 1e7e6902-3a48-45f2-58df-08df1a56ee24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|19092799006|23010399003|10067099003|56012099006|3023799007|6133799003|22082099003|18002099003|4143699003|11063799006|921020|38070700021;
x-microsoft-antispam-message-info:
 Ak4gTiZIALgrkg6PgWI1oP8UGV+4h6X0NpSiS2txzgdVXvgGbwXhwuhKYmHGspJYWFpQnV3lcSnq/h3LgMJdevOF4J5Z6t/yphp/yEGNZ5VR7V6sMpvmGSpMBGqY5wggV6Zz38+et7lhFrvpYNZ+/fHqMKLZSq2EDJmtmP0H0PNnWlaEAd84D1OXjye/vFd9ZVo59evmy3tYw5wKG0qCIXr6fwf9TfsJJMWMgOF5Jyz+k5UQASm7KUiI8ogStlB4O5Anc0rmfnMjZPKya2yRdxBiYfuyf6NvVrEJV/2yoqjMgVSKEp3WTeAJr5TnKhZ6ftNCQpUU1biwuw+fHDq1J2qM1rz6j47asmt3v8JQsdDP7BvxuLecUI58iwKZHmY/v9rE4vcqw6P0dDy2g7A0bVKPSfTYrw0uaxIGSjY31i8+B6cR7/cy31bBJa0/xc7kzutguSBO2B52l8Dk3pOyNvwu8sz9OVRfPHHR1KkQSgD06lot0ke1mLrYIpZgb6eymaWr1Sf+e1CEM5mvfjxdmLKz3yNo8IgZDMsoQFUcPsobjuQKLoZxVF4gYar3bjYhiJM4ljymbL8SXqlb4l6TExA7fHYaCYyj/9O6rJKAYGNlErtiN83BRQHtfO1jELeBov2HHta4BfYkulFtXRVnynFzPqAc34w1rVEOuVYTNUevsBbPoZ8+mybEmnQY2jA0bHp9DNxhh5liIh3eMWRf+bikmWqeZynUYDI4WuWu4QPxGeM0Q78gAhBAqzeiblTE
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(23010399003)(10067099003)(56012099006)(3023799007)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2JOHJFQmJ5MVhka8lOJ/dGJlrGzBa0/A5jKeQIrXxsjT5AvStHYFBUfkUCV/?=
 =?us-ascii?Q?cNgA8fWhMPVNpHiXgbqvxmokxpR28WcI+PBAcYgcHkYlH+eS+r8uSGiE88T8?=
 =?us-ascii?Q?0ZwzdP8g4OA3w28ETctQk3W+YK/a+i0aP7pSM9GzH2dnwQt3amSeoek52OJP?=
 =?us-ascii?Q?obZLTNtpxc3PbFwFUMS/SNIl+z0BtatRHNdJZHwKDnhUep3FccIV0ek9R60z?=
 =?us-ascii?Q?bPoRf3/X4cUGY5eimB4klB4P0a5rf9qabJuhWiuJSa40jcPRkD9GXKzMWgwT?=
 =?us-ascii?Q?d4inaH1ea57gmY59CnbtlNTilRDfeX7TnXcy5LvrjoZY7i9PEoDthKLP/38+?=
 =?us-ascii?Q?Cvx6rxIYzDeNmR5Ac7oAq1bao5lf1NTDRb72pmwP3pXyjw57wtjfZT5T2ysz?=
 =?us-ascii?Q?zOEG5C9bRTDiQUgtaTWksdrciApG2FYo+T5QiBkrKg3V5Dn83uAUYzYn4gK4?=
 =?us-ascii?Q?Jh0aswjUV4db4gzmdgQ4bpFkBIAlq4Oj2qkBPXG0a7bRsXb7u9ny7aHYV6RH?=
 =?us-ascii?Q?emNBg7SclYwFxpmpBp1aJJPgbvRTxF3y9yxcwFc/ad5rkoVWSi8hfoI7foCB?=
 =?us-ascii?Q?3+cQfErhBGMVJJzCqmi3YajHzRQtYBFI0x25ndmpFEH7YTxIzwChLEr4VVDx?=
 =?us-ascii?Q?Sz71rhtPasxkMN8Fa96mBlSTvc2PhZLqgt/3fksvuCXuBtGZfjFXhWCuFOY8?=
 =?us-ascii?Q?XQlVofH6BVFB0kNgUfUIPnOtXf+lzuMbzqlWHhaLk/m4sAxihr5JAJiPn2ao?=
 =?us-ascii?Q?Wdna+/y2EAYTD89WZRQd4wO3qF42d278kqOCvesf84RFJ2xEElAMRCPWf8en?=
 =?us-ascii?Q?PHcbPdcsHT7zS6PU729Rtst5QRFY5bVRvyfosKDBx19Tn0zM8IwtgRh7pPYS?=
 =?us-ascii?Q?zUiH6Iz9JLInV68k+1lec/lllyUhf0Sk4yw1cMAxFQ5/qFaGf/FPtGDYar9b?=
 =?us-ascii?Q?LyFBweKXMoJF6ZFJwHsl7TtRg5IIVnLoxku7c3rvjN1LQD3/WW7FzTVvnBX2?=
 =?us-ascii?Q?xRY1IA9GEjzXP+qy22B40OixvbosV4d4/LsrNX4yXF7SN2wNKHrOQogNUpa9?=
 =?us-ascii?Q?JsizFqOG0mQq4XVEs80+iNxTsV1+KVsX8p/C6Jk0hKQXn8w/7W1/Qi3LY96k?=
 =?us-ascii?Q?OjQ1eXJ9Nu5qJQ4AhKB0PavdY9bfMXg9rxpNYhfdvewUhcc6EMBeGJ+JSXo2?=
 =?us-ascii?Q?oNmqI21ST+ol2aZsMdAdICTSRiJiGE7rElDiY1FgJENc245ar3FH9+PY5aLJ?=
 =?us-ascii?Q?3fq9kVCypU5SCoDOddeFZj2F2M3pjRbaAP5nmcj34RWS3owBA3fSnZooiBBm?=
 =?us-ascii?Q?0l1HQ1FZagBU3X02pNED58+1lyAUDdtm3E6P/JDe98e3VRZeP1wdwZ7mE0SZ?=
 =?us-ascii?Q?eG0Y7lZ6pHb7Sa8Aa0KsCK4mZkxE3I+E2q59QPzU5XXSVqYv4Cre0Id69jO5?=
 =?us-ascii?Q?QCM61pOs/dJSCO39sDtve/luMO/cIC/ZxomYPHoa8gj0ZR/+XMT0R6ka+K+A?=
 =?us-ascii?Q?wQU0CnX8svMlnPVy3qK+jm+LXkbyzE1kubiAnObj/wI1v6zE1o9xSuF/ESfg?=
 =?us-ascii?Q?vdZqysYyZQ08UTrU3i8z1t6ME1GJssMsJG2xcYhK9VZMON9Ww/gokCivsUrV?=
 =?us-ascii?Q?fbpT4g3LPKMULiusD6TYEIK1Bed4tQxPrcNpQzIYstALGr1zfPr8CMuhWYjB?=
 =?us-ascii?Q?1YAk8VPymgRMcEnWs9co6bwJQCX5lODLtFXoZVvOprIvp/Dy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7e6902-3a48-45f2-58df-08df1a56ee24
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 16:14:37.4212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HJuOA7BU5KgLVJCaPf0Hieo85OV1M67J234q88V3I7JFMSfiwqvbCtQHVVdhukgI0yqr6ApXYxYPNvztL1g3dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8267

> - Who has reviewed the user interface from outside of NXP?
>   Since this is not a vendor-independent API, I think we have
>   to be extra careful and make sure this does not duplicate
>   anything that is already in the standard firmware interfaces.
>
> - Why is there a low-level passthrough to the firmware from
>   userspace? This looks rather irregular, since it is the kernel's
>   job to abstract the platform and provide vendor-independent
>   interfaces. In particular the bit about shared memory and
>   the generic send/receiv ioctl look like they should not
>   be there, as those would allow side-channels from userspace.

Let me answer at the level I think you are asking rather than with
driver internals.

On review from outside NXP:

- Marco Felsch & Sascha (Pengutronix) reviewed the interface
  across earlier revisions and I addressed their comments, although
  it carries no external Reviewed-by.

- Rob Herring's Reviewed-by on 2/7 covers the devicetree binding and
  Frieder Schrempf's Tested-by on 3/7 confirms the driver works on his
  hardware, so neither is a review of the ioctl interface itself.

On using standard kernel interfaces:

- I am not proposing the miscdev as a replacement for existing kernel
  interfaces. Where a standard abstraction already exists, I agree that
  it should be used.

- Fuse/OTP access is already exposed through a standard nvmem provider
  (drivers/nvmem/imx-ocotp-ele.c).

- Some ELE services, such as key sealing/unsealing and random number
  generation, overlap with functionality already available through
  existing kernel frameworks.

- The remaining functionality is the secure-enclave management plane:
  key-store provisioning and reprovision-enable, persistent key-store
  migration, signed OEM container authentication, device attestation,
  and lifecycle transitions. I am not aware of an existing generic
  kernel subsystem that models those operations today.

On what is NXP-specific:

- The cryptographic services exposed through userspace are accessed via
  the PSA APIs provided by imx-smw rather than applications directly
  issuing ELE-specific commands.

- What remains NXP-specific is the secure-enclave management layer:
  provisioning, attestation, lifecycle management, OEM container
  authentication and persistent key-store management. I would rather
  not define a cross-vendor kernel ABI from a single implementation,
  but if there is a plausible shared model across vendors I would be
  happy to work towards that instead.

On passing commands rather than abstracting each operation:

- The ELE firmware ABI is large, versioned, and evolves independently
  of the kernel. Defining a dedicated ioctl for every firmware command
  would effectively freeze those command payloads into the kernel uAPI
  and make firmware ABI evolution a kernel compatibility problem.

- The ioctl is a transport interface rather than a raw firmware escape
  hatch. Commands are validated and constrained by the driver before
  they are forwarded to firmware.

- The stable part is the transport API. The ioctl numbers and
  structures do not change per SoC. Per-MU differences (interface
  type, message tags, base FW version and messaging API version) are
  described by driver data selected from the DT compatible.

- Discovery ioctls allow userspace to determine the SoC and messaging
  API version it is communicating with rather than assuming them. In
  practice, supporting a new MU or SoC is a matter of adding driver
  data and a DT compatible, not changing the uAPI.

On the side-channel concern:

- The kernel's role here is to enforce containment rather than to
  reinterpret each enclave operation.

- Commands are validated before being forwarded. Commands that are not
  explicitly recognised and permitted by the driver are rejected.

- Shared memory is allocated per file descriptor, so one context cannot
  access another context's buffers.

- Userspace never hands firmware an arbitrary pointer. The driver
  allocates and manages the shared buffer and validates all embedded
  addresses against the owning context before transmitting a command.

- Consequently, userspace cannot direct firmware to arbitrary physical
  memory, cannot access another client's buffers, and cannot submit
  unvalidated commands. The interface is constrained and mediated by
  the kernel rather than providing unrestricted firmware access from
  userspace.

Thanks,
Pankaj

NXP Public
