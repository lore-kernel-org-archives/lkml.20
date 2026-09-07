Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazolkn19010007.outbound.protection.outlook.com [52.103.20.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14668513542
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.20.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788800672; cv=fail; b=cFVWgXYWOzvnDVjpJV5a6+BGUEn5qlBmgSVrxFTvqqFWjXI1kBq9Sh4O2Jv2LXd6AdZAcKQv5sTiSl2SGDGuzofd0yrwdEN0nef56dS/ZDiJJSj5InFALZGjF+NqR9D+KBW5jiGSbHBZFQT4y5jdyui3lOxLwFokxLYIVBCCQ2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788800672; c=relaxed/simple;
	bh=j/FFyRZbq+78V7CNhU3wYfbInK4FHtwMxUKqSFzooik=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=T0JoO+bCB3aAl+hloW9clhrv03jSPK49sTNEUp1i/8JvgvBmACNO/6xe40B3JqDDujDb4MRdqT6huFdAtp+2n4P9El14uCtKMZqCm1bTxdJhjmkwTd97OBZ4AR3+N0WajzT41c42YDnj/qAe6VXLc1cs/VaaIH/ime4V7eSo5is=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=TpFn2TRz; arc=fail smtp.client-ip=52.103.20.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="TpFn2TRz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Asicby5nerEdEVERv0umrrw9Au9z3uj7w+DSvc4bov14CPElH2+8SdXPSmXZ1ZKYZJeaZPJDNyPru9/Eam/Ag5ZalaVbJ3Wb0MnJUngDvyKjmcco4jsGkjuiqEXLDQ6eO3aMgP4HNg1yatyuwfRV7T9ds/eiXO+dHhTMmjZeoIno5a0YzcvwuPHBYhCu7OFoR/uiLjSWHCR0dhjC10DWO60t8fBkuAv+0HBWLgTNh1DpEAffZ5Y74lXHbWIvY4TD8dxKdnCxbNN8xNtLFzJkia/Tk3At+2Xme3pooIuoeNkMfdHrTpQ0vkZ8wsUUmRJ5ehRSEKktJAhKH1NtlPoqtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLZn+964CfGRLlJpn/cU29AW7gyY1VqH77yRDlK0Hvo=;
 b=SKRSGcAwZTcH1ZaDAI6X0htNUgjt1yRM40XczNdcd8QdfRAQpRFEP0Wq3uqyRt1CvTqfOAtJK/cxpyKnGbuPJCPupB3A6TbYE5aus9Ovw1XydRUkj5sqTDX/H+++v365MXr6yo8euoQ7DFVo2J3l+cnC+fk0Kr4ZOviPaxguQZfvBT4W1p2P7N7E/Q0Nci+KasyBYZI8YcSZQ1qs5lFZpexwoK2Vxw9PD4uzGCm8F8P3Kb2TQ5v3xQnrO3sNaRPl4WMWGmvutUs/AofDJ3cnRf9KuHsxdblCDla/p0ZhQXSud2/GyuC8FKpqil1n7mJrgEBDzia2H96OdLHTw4zcJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLZn+964CfGRLlJpn/cU29AW7gyY1VqH77yRDlK0Hvo=;
 b=TpFn2TRzgYIT3HV0HqOylmkAUmq6N4H+BrAPdfYraNR21Em3shHR/0MX10Ceg6l3Pg2ODfW7bKKiQRiRr1lG41JnyKIEDpzkF0xtRu+ldWxm5mKDRu3mja8v0XSpkpXfIiugAvvY5yXIMEgi351vgZAaoVnraGX8XNCgGrgyrPtGqgR+wMHz2k4JvaeqYHQHYfJTxfDa25XXzhw8reCIjwlMy3PVoKBLuEkfbLNjUiD5lDRxWYjz7fITM+PQ+FUMVMNf5wqWk5yN3bxljqBsKD6+ERsyuoAyGdBZrinJgIJFQtSZ/RsIS9l8Z7qgeGm4u/3URMcx7txL8/5P1Nob6g==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by MW6PR02MB9933.namprd02.prod.outlook.com (2603:10b6:303:239::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 7 Sep
 2026 17:04:28 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%3]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 17:04:28 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Will Deacon <will@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, Eric Biggers
	<ebiggers@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Catalin
 Marinas <catalin.marinas@arm.com>, Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: RE: [PATCH v2 14/14] drivers: Kconfig: Simplify dependencies on ARM64
 && !CPU_BIG_ENDIAN
Thread-Topic: [PATCH v2 14/14] drivers: Kconfig: Simplify dependencies on
 ARM64 && !CPU_BIG_ENDIAN
Thread-Index: AQJDZ/XkbCW1P3Cdcng58zC7z9yYqQKUIy/4teJkgtA=
Date: Mon, 7 Sep 2026 17:04:28 +0000
Message-ID:
 <SN6PR02MB4157A1AF2387A36BF8731E55D4B22@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20260907163726.17104-1-will@kernel.org>
 <20260907163726.17104-15-will@kernel.org>
In-Reply-To: <20260907163726.17104-15-will@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|MW6PR02MB9933:EE_
x-ms-office365-filtering-correlation-id: 03d6403a-7c93-4d53-a385-08df0d0213df
x-microsoft-antispam:
 BCL:0;ARA:14566002|37011999003|25010399006|4140399003|8060799015|8062599012|19110799012|55001999006|24021099003|15080799012|13091999003|31061999003|440099028|3412199025|102099032|40105399003|52005399003|2607281247196008;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?2kAsDLjiU7wE1qmDienbfR1XBWRtuVpaFKsBIt3ViYS3uIOkrui21CUu6Ky2?=
 =?us-ascii?Q?OMtdCQpwhOIKZnpeTFCPd7nx1kVhnEtCDZqvBp4dRZDfO0Z1JkA4Fh3YwhDe?=
 =?us-ascii?Q?OFalTdWpryRFNFCfCy5Nj7dEt3zHWhJ1VKiTot0ebKgyUzc7ELWp5z2lCUQr?=
 =?us-ascii?Q?RFJMRcKxlVs6zco3BYYNdrLpKbLNaXlYVb0Srb+jcoSddelOCCXMjuYicAmp?=
 =?us-ascii?Q?bmyeCOv8OU6Ay3waVKCBtso1PqfzRfDYpZqebQh25VottrcUMx9Lyd8f+Omr?=
 =?us-ascii?Q?WyeG0k01Pn20fn4qiB15Kj8ZSj2kKBxgxuV02IHXVS2w+hyq/g6F0W5z6hj3?=
 =?us-ascii?Q?Y4Et7ac9SCbFXk2noECtKHAgDJmrnJPnuahbH1qiCZqd4qmVcqPVNlWm7Rn3?=
 =?us-ascii?Q?n1L1tzPDhNUADU6RklpaAJxN/DGBop8jUjDuqy7ygl5vw919GO8QqmITHZKv?=
 =?us-ascii?Q?mHTMsy/22MnPF8Pm5DLbmx3mIZf0XRPhVRWm/0mxsqbJ6qsegrmrodYPQSui?=
 =?us-ascii?Q?f+G0asbpn4Wt3ZDmOOvx/EKGAi9buEDJsO+8IAI41WB7YR5AomiRjrOtyno1?=
 =?us-ascii?Q?W0bfcUuWMrjtnR7mxR04C5qNsEMG1Ol/ej3NMGtx8Ahi1tzrJUPsUqtfrPPz?=
 =?us-ascii?Q?Zz6yGS+qogy7ljhRnIWYDg403ls9CEZ45h9imoJYZZAvkyknrgACEuBJXWjX?=
 =?us-ascii?Q?QGyeJARQqYMUCy0XCWpzPOmB84+fCUJM2V1Po0HrzN8lJc9MopIvt5hTBmG/?=
 =?us-ascii?Q?WO7EmxyiaAdFgoj8fRqb1IosUv9q0WtVkh0AX4q9JDobjkuKAujSsp1wC6UB?=
 =?us-ascii?Q?5RcxpYgh1y3qZoDvWbs0tMeBTsm+Yvd937+1MX22lYHHA0hkUBO6QvkpBjr9?=
 =?us-ascii?Q?UynPjp4vHUd2OTjK+t+30nnRu41Ntfa2ljGGyui6Vi7v/sRxaGcRQayWQbU9?=
 =?us-ascii?Q?qtQW7ag9r2wqfbYaRP01tNzKS1qIaOqSuOJTq2vZfoipWTXox80imk6vW0F8?=
 =?us-ascii?Q?Zo/I2XrtdEd5rsXv3+tfqAiGUg=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4+YEFdN09qGIsUeZwUSMiRyHXnmpQ2unL3x1KuQsMG9n3ZspLNSgpjaVilug?=
 =?us-ascii?Q?2hnmbLVsBM3G5H5ZwwJqWdmMTqNry6e8sgQ/Cs7XKTsCjpLKYidDrZpxjCp0?=
 =?us-ascii?Q?nBERX50YuoM3KP286PTxSN/PB4TeaOVZRsQWsvxKckxL7vU8MkeKdutbC6mQ?=
 =?us-ascii?Q?CVmYiNoWcIQUBnMV8+fNohaPca7xlU9UOng9VnhTd+w5/q/3shOC+/W+UMwe?=
 =?us-ascii?Q?L9rhQ4D7wWGb4X+lu11I8mv0/ztQ4MqYMjpPfJIqbDfcQi+nuvCTVwHZvSk1?=
 =?us-ascii?Q?Alau+eW5z1hW3ihlcNDRefw+ZJEQWW3fMqcsvHU3nYt4QYr1Jy13shm7bdcH?=
 =?us-ascii?Q?/Lec10ewdaBO4/FETi/E8NPm9AcNhBNWdLM4BXso1Yt9EnZjgEUJ/BKzTTr2?=
 =?us-ascii?Q?0TdSlu7xE2ApSDHkGLrscAefDV+2IkGNF8GkuWatl7CQrICDKyx5zy6eJ/+P?=
 =?us-ascii?Q?ZWVSiurg0q9szcbg3wB62iJlBnpCOMFBgXWh4ggBTZNfeyzfl+LaLDLp/5k6?=
 =?us-ascii?Q?kdeekT+UUmZDsnqrFGw14YGuMnNbHfNy1V462Nw9LMBvMoPTUGAWHUalnIF1?=
 =?us-ascii?Q?FlcDRJDhNo2cHee51adZKeY5KKpTDmDDIUC4qJiWRDNlj7jNKftQ1/HedTPA?=
 =?us-ascii?Q?xeLxkPvtnOCcy2WNPm4C9dWDbHqhUgEOTUTRPE6peg7Qfx7oocI5hRH80Sja?=
 =?us-ascii?Q?6uTlhQ3hyxC092qRT9sifzHBUSc1wvVlSN2smfZzyeN4YoFUpAOcG/3bvc5H?=
 =?us-ascii?Q?LsnRKr03r10NpuP+XwkN0xUJjJfgCSn8AnJIbzoyzYtl47rU2R0gwNSaO3Rx?=
 =?us-ascii?Q?/4kyBptSQZLkl67N8d2GXNy+23AZIbCFzYxzb9g8BMvn7FajngomjDdpa4f4?=
 =?us-ascii?Q?NaDvoEHJZSNbmJ/XY3CRsKe3dl0qFrTQasjgQI2w6i6uvcJH2SGWb5ry90Ad?=
 =?us-ascii?Q?FkRg0CB+ON7NGvwAjZVk5ZPWWCP10VDY3FPW868D2z95IDWzQlPMeBv4tjTq?=
 =?us-ascii?Q?UVosHozJLs0YF0/hWLwvMrqEkccJqrz6OPG55VrORv/r/Cavu3nhgpZ3nCxE?=
 =?us-ascii?Q?RzZqR1bNKTag2AVr3JFfjRCEhiKJz4chpwbuhMZ/D08CbdEQnjUvhvRFHC8I?=
 =?us-ascii?Q?7kSZmJOQP4dA9zqmEYaamnvTqAvBgGq1ENjQKUGPrGiMznyOHFkJtghnTXqr?=
 =?us-ascii?Q?eSQa5/36ma95+wtZT/ShPEdNhgwCvl/apBbkCoQaPfntFP1HzNhZdAk2tcho?=
 =?us-ascii?Q?2+/6VgrhwUls8nQ9uhIETfp70Az56X341OtsjdZmAgnz3fIrWaJWVjBtsZ3W?=
 =?us-ascii?Q?Kwq0DmugoKd1+xQsIEKwCdhECFP+U40gwZsuuaV1BGeWCRIw//iugmZrGuT7?=
 =?us-ascii?Q?53GFeeY=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d6403a-7c93-4d53-a385-08df0d0213df
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 17:04:28.3971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR02MB9933

From: Will Deacon <will@kernel.org> Sent: Monday, September 7, 2026 9:37 AM
>=20
> Now that arm64 no longer supports a big-endian kernel, simplify some
> driver Kconfig entries so that the dependency on a little-endian kernel
> no longer needs to be called out explicitly.
>=20
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  drivers/hv/Kconfig                     | 3 +--
>  drivers/misc/vmw_vmci/Kconfig          | 2 +-
>  drivers/net/ethernet/microsoft/Kconfig | 2 +-
>  drivers/soc/tegra/Kconfig              | 5 -----
>  4 files changed, 3 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
> index aa11bcefddf2..36445c2619ed 100644
> --- a/drivers/hv/Kconfig
> +++ b/drivers/hv/Kconfig
> @@ -4,8 +4,7 @@ menu "Microsoft Hyper-V guest support"
>=20
>  config HYPERV
>  	bool "Microsoft Hyper-V core hypervisor support"
> -	depends on (X86 && X86_LOCAL_APIC && HYPERVISOR_GUEST) \
> -		|| (ARM64 && !CPU_BIG_ENDIAN)
> +	depends on (X86 && X86_LOCAL_APIC && HYPERVISOR_GUEST) || ARM64
>  	select PARAVIRT
>  	select X86_HV_CALLBACK_VECTOR if X86
>  	select OF_EARLY_FLATTREE if OF

For this Hyper-V change,

Reviewed-by: Michael Kelley <mhklinux@outlook.com>
