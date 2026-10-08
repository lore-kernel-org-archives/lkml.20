Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazolkn19011062.outbound.protection.outlook.com [52.103.72.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2934447F3B7;
	Thu,  8 Oct 2026 22:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498899; cv=fail; b=nFTsF0ZRg5Gh5sYnC0EsCOKH5rDA9HCI8scY80uz5kMXQPXGMFQghcnN3CLKvofwARnCSAYFU8TVUvGe5lpH6P7/3NJNuyr7lh+7gj7D06flaZFZ9gGuJtZM4FEwwrSGuJ9EI7TwksksGcIzre+RCyp9JvqO1Cu4oo3Yo0kX1ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498899; c=relaxed/simple;
	bh=CXRUnO4JD7GIr6gXDGDG6OMd9bFK+OhmuHQccmjMNMQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GDHFcSkq0nbF7aGHHaz/4lZp9dNQvzOInqnptbcCOI8tDXUMd7VIONmwcfFRmUHu0ePgG6tiJmCnecUc6iQgB9+83vHRBuRr60k0yXkGqjndV1Jqm3Ga1D/Tieinb01sPLeAStuS4lufWfNU6ifDkSl4+GbpmH835LQXnFfLhbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=nTZmCiuG; arc=fail smtp.client-ip=52.103.72.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="nTZmCiuG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QuH0wnyiSeToeRatzsy3TbyeTAIKnlE72pISWGMHGAJYRQZLoPTdhfmmA+S2aKVAdy8FM3Pz/7va6NXYZTcrEPFM09xGDVu3I9JFF3aBONDChBOLPLSbMlnDNJB1fZYhnnMRzf67tl5bbiyV0189M3oeeYmZJZ/u/7yorSBsLjufSiGfbf31jvfyjkTeIPkRuOeM6ko2yBB9V4TfqhbK4ClKrNwXJ0ou1IRvDdQayf/RYwgJ5aj4DrnFYOdkR5yR+bQW91sFcK5KFU5RTRfJELXHiC3WAoWEg3x1nmpfxfBStTQ0kVorZYQikv/8K43ZaEm7tQbR6yQO9fD9Kl8HHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jc/gV4A2u8i4BDYUWQzXqc9C4Eb5mtd/16mPhcbFpOg=;
 b=q9s6xUlZgfDqRb0HRiQyY2PS8a4zn7H2kEnGxvRKaGaqjdcoP+4D6lWijGeYdQWhigW/70tdX6fy8SuKftSdyvbqH4WnpHY5SkVjS2BDMONeiY4tYIi2Z8Kj0AhWAbX4OKPxF4Xgxumc/Ke2LZQnJXAn526/3KreOpWI2qJzi5ZtQEuotsL9YPfIKKCua1MlHG9dX4fZ4BRxyPg0/LRFtOCkKii5nxvxSaAxbuxNiDfm6dJIMOJRX/IQ5fakezpFHDgD9iFOZoJ22EyY+TBMvmcgpiH+F1vKo9lme0PawPw2KDzwwiwA9EFj+GC2uW9fJXgI8+tShcgYz8dMAV83OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jc/gV4A2u8i4BDYUWQzXqc9C4Eb5mtd/16mPhcbFpOg=;
 b=nTZmCiuGPCxtV7TNNo54QAuloxwdLdMs5vGNFDnLJ9NZlalS4j127nmcpjyez4PBrQc9HuF57ugiuG+O90p8T+hRFOF7fT8Lutj9kZm0/mfi+UrGWfKIgwFf2wJpK4TW5hdT2b+Nb44AlnjGGLkil8RGEFdorERKL8uSPTZkf7VvH49hu9zmdpZdVk+l4KWFnABbB10onsa1VO+VH4oyTllEtlngDH5J/wL92cLCDvSJinemJOlc5AkVBQsLBAzEKvQjKzVPKiab0sK9KfS+wKZ16FnfHKB0m2ZrXl2VtDw0s+NY4Yy6Lu7FcgLTmJYjnt2uquOxdj+MyxIWJoYb3A==
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com (2603:10c6:10:32c::14)
 by SY3PPF346C5784E.ausprd01.prod.outlook.com (2603:10c6:18::40d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Thu, 8 Oct 2026
 22:34:47 +0000
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19]) by SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19%3]) with mapi id 15.21.0522.002; Thu, 8 Oct 2026
 22:34:47 +0000
From: Zhang Jiaxi <Z1529105815@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 0/2] arm64: dts: qcom: introduce minimal Xiaomi Warsaw
 support
Thread-Topic: [RFC PATCH 0/2] arm64: dts: qcom: introduce minimal Xiaomi
 Warsaw support
Thread-Index: AQHdV3U5HK2vY7NSfkG95A8fXsC9yw==
Date: Thu, 8 Oct 2026 22:34:47 +0000
Message-ID:
 <SY5PR01MB106001DA99849C5FC61AA2980A1932@SY5PR01MB10600.ausprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY5PR01MB10600:EE_|SY3PPF346C5784E:EE_
x-ms-office365-filtering-correlation-id: f10dd872-451f-4506-5b2c-08df258c5bbf
x-microsoft-antispam:
 BCL:0;ARA:14566002|39105399006|8062599012|19110799012|4140399003|31061999003|8060799015|25010399006|22121099003|25031999004|12121999013|15080799012|38102599003|24021099003|16051099003|102099032|2607281247196008|440099028|26104999009|3412199025|40105399003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?VTLOaJuInXoFrY7D4PU9i+vfBiFIJbqheIsHGdLvASPwmUnbJMrlQsmB4g6E?=
 =?us-ascii?Q?eUaDqVZKwhBWGUhFuujxh+CAhWZKdZ/ErTTyI7jrKiVzLhpP8TR63vP0ovcF?=
 =?us-ascii?Q?fyYNGPxPFxTxkDdbJYWDu5F5EEHwjoj95vWGmQMG8+o3nZkHjjzH+n3FDhyP?=
 =?us-ascii?Q?lsG3IXP5U7oIjN07GnLbD+0xBQro7Rh+BBGEBN17j6yTem8k+hle7sNdNu1F?=
 =?us-ascii?Q?yrm3z1h8sEctP3kUuSOJ+NDa0a1CATJDFuHDNo0QBu5eXfZITOHiBwqg21uj?=
 =?us-ascii?Q?mrrg39z/R0g3i5MTz5J9EhPS+iJyBYQKnRgtcA7fa/rYGYwNqASaR6mtiEJH?=
 =?us-ascii?Q?klon7j4IFjiQbqVIa//gjRc2lKvcnDn7aIydCdpd6/OvoAjxBZtIyJfRDPUR?=
 =?us-ascii?Q?wsM3etqUp7QJGXcxvbRT1SyrrdxKmBUwMj5Bv9tARbF+yBbK/c6EUFQ0yHpN?=
 =?us-ascii?Q?7WEQfwScK5CwM/aOJ2H6cjrvQWFTXE6vegnsWwg/qih76c3ogy74Dy33ZaCw?=
 =?us-ascii?Q?ZlT1OyZkz7R/HHISMXFa8WMXGTeGGuaE/b/v1CFdW5R/5CxPkE07gEUS68fN?=
 =?us-ascii?Q?1rVanFZ1DvrDwfwbiQja8JPSJ3bDD4LHQNSyjGC480Ws8ZA25CYyNWpk7X0v?=
 =?us-ascii?Q?4T7kwC8IUe5/HHzngHzZDdeNcJZXl6YlY+UxdfVQYG0Wv7OZ3mvRhyj59iBw?=
 =?us-ascii?Q?v2WnY4DNFxxBJG1JvA/3YGwxphUibeDI/6dZormmJEmcAt43Yd46dL62w2xG?=
 =?us-ascii?Q?tnsfhDnnpmf0bbdKrRCjmkZmSoe99jjyC+JOsCrFG76zx4Q+JtHI0l0mbeF4?=
 =?us-ascii?Q?6scotB9dPqY4unxD5CbOJLxvD4Yd+qLw4CtlRQKUMTlR8km4mbdc8dcZu0jR?=
 =?us-ascii?Q?Xjw6llmnp5hYYjyNWruao50VBoLVuDKsiUDUtX98dRCxYuKYJ5IbjY73q/gI?=
 =?us-ascii?Q?j0bpZAVLhvcRR8DQoE+68E9A/yb+0XM8m+fvzvgNjR00IVedsWuniScAcq+L?=
 =?us-ascii?Q?GYsHoJVMeA+ew8949btf1o+IFCDkaBNYUvi1vn30/AIF5+3NAOzcNuWtsa5t?=
 =?us-ascii?Q?ycMgA2Y+jX5vpwEgCmcJUSS3ySXWAw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xPO8mAz2/p3FoXEuykyHbB8B3C48RGJrpElq7DuOKmNzdUogGcF3qhcnGuHa?=
 =?us-ascii?Q?0i2bOMS3HmqLM5iVJuAi+wNJ3WCRi7/9YAXJ7gG2fMBVFg1xOq2QJ/49Tvdt?=
 =?us-ascii?Q?VtKMFcgANGqyyXmW2oIj0mVS/W3ECw/79QRpXqd7fG7+XMJrkFZy1LDuEQl2?=
 =?us-ascii?Q?SX+aHB/aDzhq6vAUM+CyrkibTsNKxCPsAFpNVnzHMc3N5LkihSHzwnpZefmT?=
 =?us-ascii?Q?M0U99hmHgsc1YpPPY+ApUGhCBI8ql5ONsn9RJ+6dNZqkEPjVBmFIlLNFlN55?=
 =?us-ascii?Q?ZBht28XoWdH4fe/lD+F8ojhnSrqaFO2ycTSkb8VxBCE9fJwO48WTtG+FV0bU?=
 =?us-ascii?Q?hWbJiwe6C+PNytv3cOqxzcFpZS3ucFDyKKJQy73T6pl2C8OCO9pmlfTQ4oov?=
 =?us-ascii?Q?jW4HkGOUFtqsca6TdBylMjTCK28CRKQRWGp6tx3I/BVN6HUidb+jUJVn5WJk?=
 =?us-ascii?Q?3LkMuQmoBKeHq/aGquqSgNoDtYGJqSAn0qs1uSaeWOJ5pjYNzVhY7OSQwQA0?=
 =?us-ascii?Q?pqLHcFi4zrwXfLTon51vP6PlmelNv5korQNJwrFI7cKWP2u++Osoo5aGnGRH?=
 =?us-ascii?Q?weuqYY/q7AdLk3fz0TRen2L2DRds3MRfZHYcl9BjfIOnO+Mo9u7vBYNKh45s?=
 =?us-ascii?Q?zF3MFIGJxzb8aayUR0ZZKisxriwdGKcIVwO4/mwykKayWA+Sokh+kq5Vjc6B?=
 =?us-ascii?Q?ebeV35fVKbht1ZNIAI6T8px7tSqewDIRgRfO3hysks4DFO/N4Ijwd3leX+j2?=
 =?us-ascii?Q?ML17y6IDDCeBreC7GTdOjeSv4ZxFMbWTZUp+oiWUBNyMbWZwCs526tQ8kPCN?=
 =?us-ascii?Q?EaANuF+hXnZFiEkRE9jHK0SpvWuMnw44f1ttFSAp+fndYSGOar35jU99C+ap?=
 =?us-ascii?Q?P0g97boQupJsMQUjU9k+NY1U9lzS4bIT/9DIgs94/9mS6igF4EW5TC6AQvIX?=
 =?us-ascii?Q?GQ1CCz+Sny+doV7cRUiZrYfH2wOMlAB/pNwcsjkEGULs4M3V9lf3iYF5KM6p?=
 =?us-ascii?Q?ugjo8A0Q55UEFPMWo9kc1quRCMxxLaGm6qEpRk5H/QKGPPozMK20JEbZ1Iem?=
 =?us-ascii?Q?jr2Izo0VytUlGjj+dz/JRwzofrkw8LGy2E3sU+0vWgopGU8xJup/eC9GfkCB?=
 =?us-ascii?Q?9LYJgXNbuvvRyRK2vcn67E3BG+IR2VHqTExZS/et+dxrLuCuFZZQ+wldx9SR?=
 =?us-ascii?Q?d3ITc+71WKdxCy0B+eBFjZMEdQ5Xz+HnJcQ443ytaOSAYygFZx4akIVTGba3?=
 =?us-ascii?Q?IZ4/02i+8XHZbT7xbTqVfp6FC8GyvpyzGwxrTrkn+P1tVbU6ixgPfYzs9/a+?=
 =?us-ascii?Q?HSHZ0zmdj2TjQkUnPR8gYlHmOBAxRLYTuiabXIf+bAjc4bPeskFLE/EQmTCD?=
 =?us-ascii?Q?KcVogD+wqk6seRVODyBzq76krC+s?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY5PR01MB10600.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f10dd872-451f-4506-5b2c-08df258c5bbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 22:34:47.2818
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY3PPF346C5784E

Document the Xiaomi Warsaw SM8750 identity and add a small board DTS using=
=0A=
the SoC/PMIC includes instead of inheriting every MTP peripheral. The DTS=
=0A=
contains reference clocks, keys, firmware-reserved GPIOs and the inherited=
=0A=
UART7 console route. Touch, display, storage, USB and charging wiring are=
=0A=
separate dependency topics and are not enabled here.=0A=
=0A=
The fixed baseline is torvalds/linux=0A=
6c377d19d4a5116d9bec5203aa3c6c11523e7898. The 108-line DTS built as=0A=
qcom/sm8750-xiaomi-warsaw.dtb; full processed-schema validation reported no=
=0A=
errors. The unchanged compatible binding's earlier meta-schema checks are=
=0A=
reused. These are build/schema results, not a boot test of this smaller DT.=
=0A=
=0A=
The inherited SoC memory node has a zero-size placeholder. Usable memory=0A=
and firmware reservation ownership must be supplied by the bootloader.=0A=
The larger development DT boot does not establish the same fixups for=0A=
this description, so this is an RFC for the board identity and minimum=0A=
boot contract. No captured memory-bank list, Android command line or=0A=
private firmware reservation addresses are copied into this series.=0A=
=0A=
Jiaxi Zhang (2):=0A=
  dt-bindings: arm: qcom: Add Xiaomi Warsaw=0A=
  arm64: dts: qcom: Add a minimal Xiaomi Warsaw description=0A=
