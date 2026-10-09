Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010029.outbound.protection.outlook.com [52.101.84.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF90F3DDB00;
	Fri,  9 Oct 2026 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537793; cv=fail; b=QGzQxQhHdmVbB4RNHnb+oLaIgVJ+uNF1TBGRRemk9D4bMSe2Q7SVRfdfmzIBVsuS4VoEalA84NlvkeXbCbpeZGyHKqgpp6hvN1P1p5nICcoUiGIOpGTnuYgKT0V+hDAPBDKhsW9j5pHeVkbw8gutAB2HuoAkbeDtpUi/gqXEDo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537793; c=relaxed/simple;
	bh=iLqLI7HI+qaivHB3xPYUm5yyZgAPzVvU2JTH+XWY6e8=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L0s2Qc5kQCDZiASYy0s1u1LKWBWGsMNg9r4A38sMvHGTnO3mx9nj1eTg2w2Z/i4BrVvQ9zMWJ0vML5qeAL7a7AI4D46vkgnVAFdVi3L3zPs7R0Z4TEK6DLGVJ4IKeu2C2WjOHq6PqQx9kQjaNbOGxCcT+OwA2riymTR/2X54EOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=JzH765Fz; arc=fail smtp.client-ip=52.101.84.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="JzH765Fz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcIvPiguj68ikuiGcVNYd/0Tfq+w+4lyQCxz/hf8Fy8yehPp/XlUX0I/Fk0IvjsxKeeIhD44jL7UrhXCFjtAX8/19bob1JnXMTqHCI1E+Y4lAUxMxtnypiv7L6XJ/7i6RZ6F6h1eLAV9kuJ23nrRjsHU2Io9ip8XS/k5eLff5pHBYU/knhoyQfkbkId9BSwbA267JAwA65Kib/EGPcrfN0CsHar5AovB0bSdJDRaEVJlYOP+1ZFUcHvwIlGkJ5ei+NCg32YXcKdXDhBekAW1SkisHgO5NpIoqXuRNCL4xNLtkUA0ZuRSwbaY2S9uP8X88zxEGSeoyybxw6WTRnBZqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLqLI7HI+qaivHB3xPYUm5yyZgAPzVvU2JTH+XWY6e8=;
 b=GofO8D9fsB7k9Y0+w67hU9UMPOPU7nJQf/jkI86GmUXtexmAjanxiA2U5RUmLpuvn02Rd40Y7zJwoPplcOrzXqa+zblEyzLzZ8zr3/NQgWnd4JA3sShrN3IkFXAfKwFpoLu/Pim6B1REWVHNZJK1IgHGohZgGz3dyH4Ex2M6U0G5vLcb1y77s8g32lx10laBnS5iscpIFCGTbxPhkkVbBv3jw060h/yNPxxwbe7zIyoeSLf0Tphk3YAPOiL0HkoQJ+lfdtuo5iaz70k0NpbHjvfckK86jUVBV9f/LaELMMDfpb67mmMfsKTBw75iWgyCYYISPnxm9xdrxN482XGaMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLqLI7HI+qaivHB3xPYUm5yyZgAPzVvU2JTH+XWY6e8=;
 b=JzH765FzpduSlf9dd0hWPLJJw8caxA4XUcpaZ1t5B8hlR7vHwB8tql+wBNXeAnDedgQQDnD6ssKeo9wxjseqqo7u0yBN4FQnxffZVQWHCkjS5rPwep2FJshQmI80XtGiAJjbJ/zS65qA+MMV09GUUrNGK2TdgOQ/ZnUTaM5S7ea75jx33PWXjNqlF8oPhQeK/igQgUEOYWQ/yLJJB6mBGIvz8h7a9EXSVE1FCNbAOeUQTup07Uws9tx2bW4urx5DBtGQwonoKrEmZJnHq54882wFXo1E9yUfUL5qprcxSw+xGYWsPjDvSyCY9Rn5GlyXYI223ISS6IOYRlDwnrCinA==
Received: from PA7P264CA0333.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:39a::27)
 by VI3PR10MB839436.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:374::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 09:23:07 +0000
Received: from MI3PEPF00008480.eurprd02.prod.outlook.com
 (2603:10a6:102:39a:cafe::46) by PA7P264CA0333.outlook.office365.com
 (2603:10a6:102:39a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 09:23:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008480.mail.protection.outlook.com (10.167.240.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 09:23:06 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 9 Oct
 2026 11:28:58 +0200
Received: from [192.168.8.15] (10.48.86.45) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 9 Oct
 2026 11:22:51 +0200
Message-ID: <a40c8b88f6da867f5c5411f9a4ca7ec5326cc364.camel@foss.st.com>
Subject: Re: [PATCH 0/3] ARM/arm64: dts: stm32: align watchdog DT support
 accross STM32MP15 platforms
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Fri, 9 Oct 2026 11:22:50 +0200
In-Reply-To: <20261007151358.1166329-1-antonio.borneo@foss.st.com>
References: <20261007151358.1166329-1-antonio.borneo@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008480:EE_|VI3PR10MB839436:EE_
X-MS-Office365-Filtering-Correlation-Id: f2a72c5e-694e-46bf-decf-08df25e6ed6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|56012099006|11063799006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	M4dV1OcACG1RpOOsunnbwSw9c5JiYYpr0pAxBQoy0qHmKV60Fci7u8cjBIqc9MQkqEMFstR+m1IRgsZ4SlANs+TrY6T9Q2XtDu/BGLrWSE5caH8TpGc5qUVAPRxdxUUIWqyg/8gCW8jx0S/Ldr2+a4wXAURBIKirRi02kWzLfQkFzLdHOOr5MolV6eO5CBYJiSY/hfYloLlc4EBgdOJBKyDnYGnm3L1NeQQ93/bONkr2MXfuzsNg2+olTomNrigj1/h0N4iF4eUFye32cUwXMXwILXr4SQHb3Tr82c3xu/rgXBqjaHHyToy/RmQBw4EQVRmFzvYzsIq7JRWrbn+/8joheYnx2OfDYHJakWjUZFn9u8M3DBamQLp4+Us+b7AEzh7aJZatjzgrcrsgUUk4UwmKcUadOMnHzwe9HfRG5izcaAQmhblPCySTxYl1Umiw5AUUSazJb7bpnsFId0PUM0waSbPCFlxgNQdSMnyDyghZGsGfzJmG3VXR5Nx6nsmzqJPizS2ehTDIA3uwQm6imdT4qQtNfZV0wbr8gOz4bYki3Rm0bPTzNku7UPic0XwXSUBXP6RObu5bTgUfzm9hT9q20asEeWynIgqmM+szDVYWZj4YWTVA0hZz3bASu+vBzshvK4MCSe1dHji/kX8rD0hzYAin6y0/4nZNjXydt+gxF7pDDt1o3+YV0HXakULjrgxEubLSUaO+mVaZbk4lEQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yfoIkwVyylAOlpTPGmUxGXd3iAV08f9e/SLf59wrn0hExzZxiPsrggFSDftnXcqyQBSgPjIdI2nf/Rku/E628cyZ0NWLtB5uKDx9MxlMBYt4g51p7luiS3w8EfvMYkEdlbMT+wFSfIMrMUv8vk88bG3dtVQHvkYYUWFaiyqG6Xe/W2lazH/8cTEPvBbLP+CnFBXUVT+UzMD6qWqpO533T91niW53iHJscDf2b6bZWtyLrXKaqpAPmiP/Hry2jGv2TUx+AGxOOKV1ydh1KE4iNlAROA4QBVbXtZ6Z8epY6StmcdjdxU4eKnoM2lKCAS2SF0B+/ueMbFnpDanvtdHIPB/Mws0YUGXqU42Cn0SGj2WneW2SiTAl2hOjvDSEF1r5zp1n5uMykfX1b+Fu4upkhd3tD2+ZJOPKlYLdMPrSzflpVDG9rueiXtfCYjpWLZzI
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 09:23:06.5289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a72c5e-694e-46bf-decf-08df25e6ed6e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008480.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI3PR10MB839436

On Wed, 2026-10-07 at 17:13 +0200, Antonio Borneo wrote:
> This series updates STM32MP watchdog DT descriptions to keep them aligned
> with the actual secure/non-secure watchdog integration used on each
> platform family.
>=20
> Two watchdog access models are used:
> - On ST STM32MP15 non-SCMI boards, IWDG1 is exposed as a non-secure
> =C2=A0 watchdog. In that case Linux must register the watchdog device and=
 keep
> =C2=A0 it pinged once it has been started by the boot chain.
> - On ST SCMI-based STM32MP15 boards, the watchdog is handled through
> =C2=A0 secure world services and exposed to Linux through the ARM SMC wat=
chdog
> =C2=A0 interface.
>=20
>=20
> Amelie Delaunay (2):
> =C2=A0 ARM: dts: stm32: enable iwdg1 on STM32MP15 ST boards
> =C2=A0 ARM: dts: stm32: enable ARM SMC watchdog on STM32MP15 SCMI boards
>=20
> Antonio Borneo (1):
> =C2=A0 ARM: dts: stm32: move ARM SMC watchdog to STM32MP151 SoC
>=20
> =C2=A0arch/arm/boot/dts/st/stm32mp15-scmi.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 4 ++++
> =C2=A0arch/arm/boot/dts/st/stm32mp151.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15 +++++++++++++++
> =C2=A0arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts=C2=A0 |=C2=A0 5 +++++
> =C2=A0arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts=C2=A0 |=C2=A0 5 +++++
> =C2=A0arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts=C2=A0 |=C2=A0 5 +++++
> =C2=A0arch/arm/boot/dts/st/stm32mp157c-ed1.dts=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 5 +++++
> =C2=A0arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts=C2=A0 |=C2=A0 5 +++++
> =C2=A0arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi |=C2=A0 7 -------
> =C2=A0arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 5 +++++
> =C2=A09 files changed, 49 insertions(+), 7 deletions(-)
>=20
>=20
> base-commit: f831584128ac2a36fb4fa62fe106793d08c2dbf1

Please discard this series. I will send a V2 asap.

Sorry for the noise!

Antonio Borneo
