Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013069.outbound.protection.outlook.com [52.101.72.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56853E49DE;
	Wed,  7 Oct 2026 09:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365103; cv=fail; b=XETOBNJ5LNduf4ntDOadE70AjBv1MeikpD8haggQ2EOY9kZDErrR6WMhFih0+6IcutdKX1bRU4wzBmtH7A2uPIF4vbOg/ROrnTVLD8cI8/1JDrhXx5sW0A2i4Pa++3goaliG2mQbHD9LBcrR8nyNVj/NVNfl4Ma6OvUqrcaoLgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365103; c=relaxed/simple;
	bh=+fJRGxzawRMGnzpfr9cuvz0JA/VJbvkFtS9iGiQXfo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=vFSC1pB2JOBL6ZqUWIF00m5Xqhkj1wsV4Wv8r4nDuDIINJ6emNzgb27Ad3A78qCpwUHF5G9E/i7GWeYq1LjFaUjqRgHbbqHcqKxwo/oETf5/Akw7KLKX5KHize2Wo/OHMLqM498F/tZcj00IxWeiFhRU70oZQBcw1xDNxIpFxlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=O4KJG2LW; arc=fail smtp.client-ip=52.101.72.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="O4KJG2LW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGdPIW7ZyJPDeRE/ypIzvHJ+Ftwoz+ni4MCip3oHfxgFKnfK8LSkjswQK2Rsu1MTQaKMxjKMtiGydYmluC0dSBNTsIbIGHOAVai22ZwOYEnz7odVarMqWGkyXf58Kf3zyMoXQnzDHbZBGiRCjF3IGJ+myTNSd/KAI4M3ClddpdnAy5UpCelxCYhfZ4AxdomEBE7tCtvHJf50SGCx+Sd3G7mrbUKaZvJGTbsIrRm+u7pGtTspImMEjn5BseK0Q9Vs3WSgdAtOZ3VULl2TfhEkzCPcVmv8vCsjcgY3tRvf2ZmuwxfOEf7PMd8GCi1+svmfjwrFjDgUrAVkdPZqCh7Ynw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRdBv+nbbB3LqW8IGEmJflLgbeF/mKOrdmKWiivMSzs=;
 b=XfhzF1+PX5WczWnrzeqifr2s29Q7kkXCR2Itx6uLEAhasVLxuxzfpIVReuawonH065rtGHcB7lWyyl0CDNfJBuANH6fhTqNipCwazFTCldKV45tIpqwTkSff0n5PdwJYeeeQWCrrIH8Gu3a02eX7NmeJbnp67AjWc6VqfZcCiV9BvJRjiFltidHGKqq33QINPfsVz8i1jFz6/zQgW4mvBFsflPMzmbUvmbxMQ/MtjFHtHE+tgCBpkbOSVVgNBCWAj3s0H8SFXD0vtGUiztmm6wWmeTC+gi6zTp14LHhNdbTzSE3qLJyXXPuQrERG4cfAZoov7E+zFht6Pa66Iwf6Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=posteo.net smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRdBv+nbbB3LqW8IGEmJflLgbeF/mKOrdmKWiivMSzs=;
 b=O4KJG2LW351/lTYuAyUJTljDkw0xVHPXHpQGmPoGseGBig9gkG/h+zf8HL+utG7co/Y76yr87m/8JoBq0UW+0thHVpd688gqf046Nas+WUGVKO5MxtO7ApzUS/RBJ+IIXt8O2nUxVz8j9zDSsZwHtuJ9kM4p8ugojdorqGnoJ8cOJ/kmASX4F6k0Kq59wwbolz/E9v71C1strlIRGTt+NU/GehNG1rbKt5sH+l/kqn3POMsJElJRQsBkP5wzTkxMkaTW1jbyXBPsoDpGxdEOIquafMBxbrRJHlgPKcQcUnkc8bjVNMPcjgypbuJBtItS8YWKLHlzOv57nyweqipWKQ==
Received: from DUZPR01CA0198.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::29) by PR3PR10MB4094.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:97::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Wed, 7 Oct
 2026 09:22:16 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::5b) by DUZPR01CA0198.outlook.office365.com
 (2603:10a6:10:4b6::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 09:22:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 09:22:15 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 7 Oct
 2026 11:29:00 +0200
Received: from [10.48.87.100] (10.48.87.100) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 7 Oct
 2026 11:22:13 +0200
Message-ID: <aaedc962-63ab-431b-8b27-b4ac9c11d16e@foss.st.com>
Date: Wed, 7 Oct 2026 11:22:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: mark main supplies always-on on
 stm32mp257f-dk
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261004112421.47158-1-mateusz.nowicki@posteo.net>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20261004112421.47158-1-mateusz.nowicki@posteo.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A01:EE_|PR3PR10MB4094:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eb7740c-f02d-4549-9860-08df24547a7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EVmZrfzPrG/41njHHBLe9iRfWlOjOzFK6tGA3wTyUy3FfWLc2xm9aEsv4/UB8DPLuXFym5qJ/49fTfrYYppZvLiB7ljnPgsQ79uUkMgY+STAYLZ+B7PyvmiWt8uj9CqWucy+zeNEOaybnp3LIJYnGaKwoaZlcU8bqAs8y4NZO5Q3Nbi8ssc+u1laolDFKaeSQBrcSUQNdzweWmFnu9QpnpkWrxR8vf2/Qw4Zv+KphBsqhiGyIggX7U6Uvt68GnjeUwNmGs7tDujkUWFBdkApQY840+MhT/CF07+Hdbei2HOuOwcRJVSn5FB/oEpZrCiQZpsKQ92EUYNFSS+8T2PL4tvOe16cAOHu3OuTEN2Bdupk3ONPt/2Ha4uRIlqgdHgyl7KWx72Z6UI8gjJYTXJAE/JQ4Eh+BJZxUHRFB5NQvItWcOQpM3gb6rOM1rtjIkivK2QAsrLBuTCB0yvs7ipUkYxot1d7IsLAxP7jJ/oACUUBk9AHUZwLzZlhYuEgjKX1AgriJDaN6BY4vEKJYL6+Gn4apf/GSZk7RmsCzc+/VfkR7G5zmMOzbQAcEJwhNfOKLTs/RqvYz9w2LlfntdkUp0kG63LeaLL/qGmWt8W39qkHHX506+5IUgVAeF5XLbD0f4NLeeqNyFOA/SZAcesahG/1jyU/OHEELQZ4S/LGffp1o2bsTFxEMcMuGu6T0f/cf7zIOCoORJUyjEE+KF7fYQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	g6uzQhUgKigdyWjvZykgxHK+G0/Dlo0A3EBYIIyJ9LG9ApHIaM13ECaermfeHzXvDF4b39W/PbQUmikgi1a0Q4WE9mdm0UkZLgyascm15S3Q9ELm/YuCUkBA48ZJmJ/BiciOHy0uwCaUP4qMQjNFQvoU7Yy4GlV6v7CdcArXNpmKTc4mgbN+Le/Yd96MXKrmrlcbier4YWt5mZ45uwAhm45GhkyeNPA3RZJQT2c7diyTE/wRWEsVd/lW2PvV9oGWPVhRAuJ15N8Ygi14XmjEFolOSxFiYf8TsYxLsHPJ7RxqXohlj8wBJ2qjjmgdOTQNV+l2hCEy/JSiOGPrq3B3Q/Lpo3VINY7hSuBK+gmPyzc0YQD40m2yA75dxmMYA4DSfxbQXfxgDB+X5YtCmPhEaWomO/Fs1yRVMQ/I//P65bvZaGoXrrQxBUWCWJyW2dM2
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 09:22:15.9335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb7740c-f02d-4549-9860-08df24547a7a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4094

Hi,

On 10/4/26 13:24, Mateusz Nowicki wrote:
> The vddcore, v1v8 and v3v3 regulators have no consumer in Linux, so
> the regulator core disables them 30 seconds after boot. They supply
> the SoC digital logic, the SoC 1.8 V analog domain and the 3.3 V board
> peripherals, and must stay on while Linux runs.
>
> Mark them always-on.
>
> Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
> ---
>   arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
> index a8f18508db3e..7a837e6fd578 100644
> --- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
> +++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
> @@ -310,14 +310,17 @@ scmi_vddio1: regulator@0 {
>   	scmi_vddcore: regulator@11 {
>   		reg = <VOLTD_SCMI_STPMIC2_BUCK2>;
>   		regulator-name = "vddcore";
> +		regulator-always-on;
>   	};
>   	scmi_v1v8: regulator@14 {
>   		reg = <VOLTD_SCMI_STPMIC2_BUCK5>;
>   		regulator-name = "v1v8";
> +		regulator-always-on;
>   	};
>   	scmi_v3v3: regulator@16 {
>   		reg = <VOLTD_SCMI_STPMIC2_BUCK7>;
>   		regulator-name = "v3v3";
> +		regulator-always-on;
>   	};
>   	scmi_vdd_emmc: regulator@18 {
>   		reg = <VOLTD_SCMI_STPMIC2_LDO2>;
>
> base-commit: f831584128ac2a36fb4fa62fe106793d08c2dbf1


For STMicroelectronics boards, the STPMIC always-on regulator are 
managed on SCMI server side in OP-TEE.

So no need to manage this constraint in Linux device tree.

This always-on  regulator are exposed only for information or to be used 
are supply for some IP.


Regards

Patrick

