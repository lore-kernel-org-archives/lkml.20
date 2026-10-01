Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazon11010047.outbound.protection.outlook.com [52.101.188.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7023EAC71;
	Thu,  1 Oct 2026 09:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.188.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845516; cv=fail; b=rH9MNQkSDvONk6vqvuLm7VgfhMxDojXxwXBPfrVOvfxHKGBQ30CtRa/lSCK5s3VMHeiD8CfgiFP38+T01QGSLqNARYwSoC7NEzjJyhINRZlhHCeazDWsxUsu9yHAsXPx/rUX7OK+7rJEUsbDSC2FKglTa+F132kr/tl2amH6K3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845516; c=relaxed/simple;
	bh=6TOZBncuw8+H6VEdnl3TKYcwHdR3+Tsm/sWPjzV5X4c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IWE+RuCUxxz/KxBuzkZrAbl5jw+S3qPT53+tZHG/U/KMzUnx3KTUtpeSlkb7LRAnSwUGk2G4NK1z0ckf8q5csH4xCt0EcXMdgzsnMoi+hPQe+BT4iNkBB53dy/D1v9zw+HyxgMaNL993hmX+pJBkb6n7B485n/GV2z4Az2rlueA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch; spf=pass smtp.mailfrom=cern.ch; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=EUk2kbuS; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=EUk2kbuS; arc=fail smtp.client-ip=52.101.188.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="EUk2kbuS";
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="EUk2kbuS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPyYhC2YuM6YR8b84G0B+yhJmpsOmMqi6VO06Z/CtTzcTNqkuI8F4OBfzWMyQ1VspBzL83OyP7slrvYaVyR4k0URZ21/KHhCpiXyfuS1Onf1cfObDR3hSkrAvYHs5G604K+kUnSyFvvfVxLEBWHwbCPREjeGVnVIqqFSWGsx9cUAgJAE2klnqFdCOdxQceDhNAGdrMzcWheQP5zj8e1g72ElNNa2IFrBt2AaKHckdJxfnfIbNQkvYUy5M8V1234i4KWRxfq5jT4Io4eCbJcvIJ+uliF8irTtF5RcUk80vpdXKajPtqM/FfwnEUCrboZKztbU0Oh67uXD/08FPLj1Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBj/EwLJyOHFrE4d44OEdloLXFuOEZNzcSt8VlSfLQA=;
 b=OvStTC21gByLKHHsdV0BvYcB6/wUfpNtKYvELyXCfwYSuB6OztCuyWxSvR5TlayZnr6Pt6ahkhaPABQ5+2m9ya/pSn8/xWAscpRKTqFR7P4M1uZUSmL5Qn/EWmtYa+NVLCojEviNkut+NPQf5gv8sx6er0ZpzcKkuffabeZ4iZJlVhWUjsbo+0MF4lEOZCvgN7/jCo2X/3FAkasTPPJIgQonI4prNREnW7po4u5djoEzWuziyBU0IIGFeIBcJi+MrQlwDzAHkdMfB0ZwJL0wChV3mtXbPHJw9d8Ueo4EpFpcxAG3UhWqQSsikN/I+mcD5qW9IaH8qQj5MXI18BysHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 51.103.219.121) smtp.rcpttodomain=antheas.dev smtp.mailfrom=cern.ch;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=cern.ch;
 dkim=pass (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBj/EwLJyOHFrE4d44OEdloLXFuOEZNzcSt8VlSfLQA=;
 b=EUk2kbuSzyl4BQr7vMH9XttVWSKbmQUXdwJLzT7NRTpGQhH3f/btvHau6kYX7562o/pN/JuO/w2hr1+FJ6pi3/EGZptIvkuyYi2LR5+HFSKCL1Sepgdw2X4QEQ8EYUgGHFl0BNAGXraSF0a9rHHFiwElitekIIIwV/bsxD8JY50=
Received: from GV2PEPF00023955.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::352) by GV0P278MB1519.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:68::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 09:05:08 +0000
Received: from CPH1EPF00000522.eurprd05.prod.outlook.com (2603:10a6:388::1e5)
 by GV2PEPF00023955.outlook.office365.com (2603:10a6:158:400::352) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.382.10 via Frontend Transport; Thu, 1 Oct 2026 09:05:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 51.103.219.121) smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 51.103.219.121 as permitted sender) receiver=protection.outlook.com;
 client-ip=51.103.219.121; helo=mx1.crn.activeguard.cloud; pr=C
Received: from mx1.crn.activeguard.cloud (51.103.219.121) by
 CPH1EPF00000522.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Thu, 1 Oct 2026 09:05:07 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=EUk2kbuS
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17012048.outbound.protection.outlook.com [40.93.85.48])
	by mx1.crn.activeguard.cloud (Postfix) with ESMTPS id 3ED32FCE58;
	Thu, 01 Oct 2026 11:05:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBj/EwLJyOHFrE4d44OEdloLXFuOEZNzcSt8VlSfLQA=;
 b=EUk2kbuSzyl4BQr7vMH9XttVWSKbmQUXdwJLzT7NRTpGQhH3f/btvHau6kYX7562o/pN/JuO/w2hr1+FJ6pi3/EGZptIvkuyYi2LR5+HFSKCL1Sepgdw2X4QEQ8EYUgGHFl0BNAGXraSF0a9rHHFiwElitekIIIwV/bsxD8JY50=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5d::11)
 by ZR1P278MB1060.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 09:05:00 +0000
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c]) by ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c%5]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 09:05:00 +0000
Message-ID: <733b6ad9-6a91-456c-a847-dc8bcbe57860@cern.ch>
Date: Thu, 1 Oct 2026 11:04:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] arm64: dts: qcom: Add hamoa Samsung Galaxy Book4
 Edge devicetrees
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, marcus@nazgul.ch, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, abel.vesa@oss.qualcomm.com, johan@kernel.org,
 konradybcio@kernel.org, kirill@korins.ky
References: <20260930212421.4810-1-mstoretv@cern.ch>
 <20260930212421.4810-4-mstoretv@cern.ch>
 <CAGwozwEgiynMJ=DBcuyLR+1CdDuW=aV1td9Cx-k8=4SDn159nw@mail.gmail.com>
Content-Language: en-US
From: Maxim Storetvedt <mstoretv@cern.ch>
In-Reply-To: <CAGwozwEgiynMJ=DBcuyLR+1CdDuW=aV1td9Cx-k8=4SDn159nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0105.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::20) To ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:5d::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR2P278MB1053:EE_|ZR1P278MB1060:EE_|CPH1EPF00000522:EE_|GV0P278MB1519:EE_
X-MS-Office365-Filtering-Correlation-Id: f79762b8-e2ba-4bf0-503f-08df1f9b1724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|786006|19092799006|1800799024|23010399003|7416014|376014|366016|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 yXzKzY+wBk8/u4zsiOFnmqGE3fJ5sKGeuKF7XYfThPYU1/caNrPI7j7eoQ/r5rOaFuBwhzaOnvkTVm9fS24lMI/HDQKjfjsmNzeNJe51yYwt5xc0mus3RmXDhvM2TuVJNCYZj/n1eVlmEjWsVvgSqgMmazjEd3eqSRaPtG+vatFeVwd1X4sIeH6xU70qXbvVBoy0KVfP/pWXpe6SERXg6iLc7lof3l9+mzAtlzTF02PYrkPos2wZZL9bIPOqbO8Pnirf5WWnlC/ha5UcmNRvIJc1+aerNHGqpt/Q88LqxTD2KW8InaTK5GYP8AIjR8A3zLtHboHR5OhZNibha9P4/eY/mFeX++FxKSjMTij74diybwdDzUG/RN0fTGTD3kEJJBQpO+efpSJEaNIr1tW9dgG5D8uZH8hliwafuIUfJrFA4sf88F/FKYvvHN5iidQJp6A1KhnTLTVDFPlt75dR3SWl0aLbF3mtOVbwA3n03RxMrpoQ0mvtuE9haEocf4ptmfsGSzIgFCKWj6fn+n45Ci2iDTgCFrEnvnM6Qr1DQsaiBQPbI5Ma5e73RhgEOKpJTkzv2+WZyG3blOZ1mZmW5cTacf1NUb1IRD1UkS1zFkI8i+HTZoWNf/3FelhUac0xRxINrACozVrEfFb0BI7MJ1iiEQ4JCDBpVjy6eqsvYzg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(786006)(19092799006)(1800799024)(23010399003)(7416014)(376014)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 oThFRwrYWx2HUDHna7Nm/dRhiL6j1eMZcXPPE0dREI7uIeL48POmv/YScnxUb74LStlKAIW7IbCRk4tvm4D4QXLhZ24urbXdJfvhCreYqiWDgHQcnm7Mezx2E2uecaWQ5ZkgaQSctUTwpiDDrA8GvLEf2fq+yMXV65DkjBkWGwYRO65+JII+mFWt+V9r5yza6q0ddn88WIl2elGP2dxsbu7+z+04uWV4kGTA1BM5SxCMHH67IF+n0pPD3tVQ4GjXXlY4DdcDCP/QePwXV8ZdzWsj4dICFz7xpb0jZZHTqegqbC97C35cd3u3QpBfVM/RHbb4ZrqkOWY1JnbAl5eJZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1060
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CPH1EPF00000522.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	26f8e6c7-84d8-43c9-c4ec-08df1f9b1222
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|786006|19092799006|14060799003|36860700016|1800799024|7416014|376014|82310400026|35042699022|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VYmS69FDcYLGItVQgF9DDBg7r7QasB7+aiuhGn9ZK28UMYghywx2frNN4abqzuotUrZB8w4UhG1syjziAkGED2VtiaztCJ5mls0hTRIu9acjfu9OqjagsirWNbTPUlYmBOEgwb6B8ZWT6ge6OvEfLfoPymQkQO8/m3QmsSMTJhfVzoXN7NO+k8VzTSNPbHQgUC69pgnoftKfPENTIrLB4RGlVVLmUBQYEhTRdmSe4HHmn2IgRKfGHRcTP2vf5RM/sncIWR0KnJvz966PDxXNHL7XutxcAvT6+gOlnbzEg9uH9kOIumnmhu5VbwBdR3f+j4fE5JuLA4+0M9YzC1/GXxNHZdCArOEm++PfHSjD5yBsZyZ4kM7EAkNt9OHsOq1l3OIZb6Np/8eiQxHzf4bJZpnyV+ak8RxSCh8KziwFXoycNue8vLwlJoCah+0A5dvpaUi/8ZmrdKdHtkT5lNc1tNKOoGI45IyN3nafGOxOrb5/Grm2LSrUtJY8DWUbPEkUvHx8S8SRxW2fyxRa3xTc/Rd//J5I6UvqJoQR5yoNhFbAdJG6ZvxVzcHn5rdf0tzcXm9DTV2ytx91qSbFY9UngQu9E6+i2jmIm0T//0l7mXBMqW9Irxrv3MzqdqsAQvTaZtBHHzBLROs30GloKn1iYb8aa22FF0gPz+a95QfiMy8UQMJKX2PGrvQxxTJNFuozFmunj2aVwAcEntDdTTEBpg==
X-Forefront-Antispam-Report:
	CIP:51.103.219.121;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx1.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(786006)(19092799006)(14060799003)(36860700016)(1800799024)(7416014)(376014)(82310400026)(35042699022)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BE3dFhronYGKtKY1WCI9BclYEAVluZ8bn32/YPwtEZX0pL6HHtzut1kojSk0dHOyLtajd27qXi/uGsxBAmtifXFp/pex3TCeHKM0duz7kLgKJbUEB2y1nXHXevvGEpBq7LMRpH/TX51JPP6kous7PVWXIEK9pDonWvCFGnGEHPjyQXtnU2wd/T2UI45OlBQ1KWJJxu+EMtJQNENWtEM5TxBcVeZI0ynl1NApMDhB1qsZMABl4j4RfzcTD86QK+DgiVgVGooqSuc0IqwES4Z78e4bQ5pdzNXC3DuAVlQZ2mXOL+rNY2N6PTdoMctStKpFtmTkKl8tDADtJfKztcic4ahNeirxMGmEWMTF7n/Kmo+u96PruWQbePXeC0mzZQgpT9+zEiCyCqg3IM1vAehCL0+cYSjbRoNaCNr1JsripJhlyHriwCFiY04Vgm8ifiLe
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 09:05:07.7632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f79762b8-e2ba-4bf0-503f-08df1f9b1724
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[51.103.219.121];Helo=[mx1.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF00000522.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1519


On 9/30/26 23:39, Antheas Kapenekakis wrote:
> On Wed, 30 Sept 2026 at 23:24, Maxim Storetvedt <mstoretv@cern.ch> wrote:
>>
>> +
>> +       /* Still needed until there's a proper driver for type-c controller */
> 
> What happens if you remove it? the device has no pmic-glink and
> registers an invalid driver. Can someone suggest an alternative?

No display/drm and blocks boot shortly after. Not much in dmesg ("failed
to acquire drm_bridge"). Something's not registered/probed(?). Probably
still working over in your dts since its EmuMC driver re-adds what's
missing in the chain.

> 
>> +       pmic-glink {
>> +               compatible = "qcom,x1e80100-pmic-glink",
>> +                            "qcom,sm8550-pmic-glink",
>> +                            "qcom,pmic-glink";
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +               orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
>> +                                   <&tlmm 123 GPIO_ACTIVE_HIGH>;
>> + [...]
>> +&swr0 {
>> +       status = "okay";
>> +
>> +       pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
>> +       pinctrl-names = "default";
>> +
>> +       /* WSA8845, Left Woofer */
>> +       left_woofer: speaker@0,0 {
>> +               compatible = "sdw20217020400";
>> +               reg = <0 0>;
>> +               reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
>> +               #sound-dai-cells = <0>;
>> +               sound-name-prefix = "WooferLeft";
>> +               vdd-1p8-supply = <&vreg_l15b_1p8>;
>> +               vdd-io-supply = <&vreg_l12b_1p2>;
>> +               qcom,port-mapping = <1 2 3 7 10 13>;
>> +       };
>> +
>> +       /* WSA8845, Left Tweeter */
>> +       left_tweeter: speaker@0,1 {
>> +               compatible = "sdw20217020400";
>> +               reg = <0 1>;
>> +               reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
>> +               #sound-dai-cells = <0>;
>> +               sound-name-prefix = "TweeterLeft";
>> +               vdd-1p8-supply = <&vreg_l15b_1p8>;
>> +               vdd-io-supply = <&vreg_l12b_1p2>;
>> +               qcom,port-mapping = <4 5 6 7 11 13>;
>> +       };
>> +};
> 
> Review the speaker setup and consider moving it to individual dts, my
> devices do not share this setup.
> 

Speakers not tested, so this setup might not apply either. Perhaps
better to remove the nodes for now in that case.

Cheers,
-Max
