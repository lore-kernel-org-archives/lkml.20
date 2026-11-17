Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794934688;
	b=BNaOvPQelN6oPhT1XtUShqeWP6MryK6VgqQQfqjscWja2r7CAGlyWmrsvAO5ZeYh30UL
	 m4Opy+5PEPFpg+Fqykh5mzIP4LPlr5x85PIwIU/24nk92HIS73S3SymNAk8lKAknApbNe
	 pdRZr1OwpnLJVhQo1G8Xedu69jsYQrtK5BKPkliDKDKWQ1HwG/F+xx4wtZRn9ldQDMEGS
	 g9JNQr0CvGnOuyEti0zxAclvLN8WlXbJOk/ZwxeOD6YNLI+ULmbN1rUL7uXn7g+8o2zT7
	 o70Lsbq0saj4T/+rFvnV2KE/FSKsHu3LkF6uCyguhYfkSMY5GOciiBF/PREcd0o1ejA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934688;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Nge4pP8XpGkAxcecF9enJhD1Hbto45A+Ya0d1Rf+P2k=;
	b=zQ7Ahe6wwM7/LXP9yzr8FobKrr6vsDY/Wmyx9Lk9SRzl0synlpeCIKIoPApA0i1L+udW
	 goXUxR6itmrW09MT+aBl7HKzhgT3usMLlQsD5x169I2U97NHi6nAA5IH0VkbGMJfgFwcF
	 m2HNaFpIrRVFTSd/VieTl+/OhiY0YhgYWIUgTEWEAO+iMuf/EIiWSA2B3kjy0yVDZubkA
	 MPS44NZMpiqLLxu12Aifkc7CBIAobD6i+JEG4WLOikuHwTs7wvor4F25pLp8rlg6ELd+t
	 aFwfje6DjhDkSwpjRgQ1kcbtAmUW9IZ8y/0zQS0K5CwuhwYtjPuznj9u64oWkCr/HKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=oNX67Pph;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.44
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D56A606A31C;
	Tue, 17 Nov 2026 16:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D56A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=oNX67Pph
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QcDZ/gvDvss371oO5TqZm8eFxdMqcK8k2sFvi7srz8BwGt0Jj9avm/BURldRfG7WDXwoke0KseL+jczlnawwannEOMEcmXyIaMiK7hrumTezx5ODaZKSVa2U64h67E+iPSu9IPCeToLHefEgWLDzP35CNl8cSFdt4O5VFLHorLkgsTD3Y6zHOV0qvFVTTMnW/tz/As+IOIXMjaiXX9/GFuWfLHgtPi+YFcDeh636TY/7vF3IRd0cu6Mn/6YAmhCpR6eZLTc0o3A7aeiEAhDBk8QZSHE8sg/6AmyRL54R44U2i6LbpyFvIsfch/454yCFOm0rVz4XvJ065tXURIWkdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nge4pP8XpGkAxcecF9enJhD1Hbto45A+Ya0d1Rf+P2k=;
 b=zIMJK9lHg0m/F5z7ddfbcA9JV9hrCDqV1vZmoPqirgFkwUfGTUFJ8K5x/NZWQA3yjg91FJOcAqyPbAcnZ/dYmtjZp43YyBdKDP06Qy2omx01AoL6GXUrlOUxofCki5BS0GD3Nj1ow16rFwVgbteyjrDJR/OSvxUEVFp0g0rEyg15eBr4aS3sQdAMqvDM93h1BAnc/y7GyyDCSlznvP9lY5EA54Lgcgy3wOLFXS8hHzIvnlxTlPhgPPObD0wc+Z8JkqBD/JCv26+cNOxyp5+sWECxLY1r0uRfT8xJgoRiM5u5Db30IIMTxQf/P/Z7mYmnbNPobN/9nGMp5w9TPLgoWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nge4pP8XpGkAxcecF9enJhD1Hbto45A+Ya0d1Rf+P2k=;
 b=oNX67PphF/zwm5B3w02/K/cdOtC9C0zGeXS3pYVC8LYTgvx/E56idSShl7sY7CdaU06FpC/GzQ2sQ5917WA0m/aPTrS3mvAKREFojhPt4Xfd+a+BzqJGpJ7/qMqq/wx9yCX66F0vdw0AyTeZa6KfaKhPLx6Db+ROkWc2Ac5razzvZVefjYbAQLJrrXSXaMlRthNwWtqw9KEz5oeBrWqmrnrJd3i6TINxMVElFOIksvNvZfJdf+O9Zj0DGAcGPQXEYeri6ytzs3iIN1kwcDP8VaERav8Ci5VEd4SWOfSGRZc/ycLHZKKAQv8RGuvnbjm+mjsxbVjDNPR1uGe3Yb68Sg==
Received: from AS4P190CA0012.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::12)
 by PA2PR10MB8818.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:426::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 16:58:04 +0000
Received: from AMS1EPF0000009E.eurprd02.prod.outlook.com
 (2603:10a6:20b:5de:cafe::30) by AS4P190CA0012.outlook.office365.com
 (2603:10a6:20b:5de::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 16:58:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000009E.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 16:58:04 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 17 Nov
 2026 17:58:48 +0100
Received: from [10.48.86.101] (10.48.86.101) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 17 Nov
 2026 17:58:02 +0100
Message-ID: <c936336b-04b1-4860-9eba-4d1ab002adff@foss.st.com>
Date: Tue, 17 Nov 2026 17:58:02 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH 1/2] arm64: dts: st: enable eMMC on
 stm32mp257f-ev1
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	<linux-kernel@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, <michael@amarulasolutions.com>,
	<linux-amarula@amarulasolutions.com>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20261115163432.2601947-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Christophe KERELLO <christophe.kerello@foss.st.com>
In-Reply-To: <20261115163432.2601947-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000009E:EE_|PA2PR10MB8818:EE_
X-MS-Office365-Filtering-Correlation-Id: 729e8629-4f29-4ebc-f710-08df44cbf223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|23010399003|261009223027099003|18002099003|22082099003|261026140227099003|261026121527099003|261021135927099003|261021121427099003|261102123227099003|261028144727099003|261022105027099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	daqYJR/0IGYhGcOBHzSqJDD+XXf2r8mQ2f6L4/7pUCt41tn7JXYua5/2YCC4VUSXRTVFFMWFBlbEw1t8ypG5z4ZrmwrmJjIaI/O70+WQliUswB0zrCjEm3u2lBRSimTHVnVn5aHiJAWPcT40TKZ8kWGghfy1PqgybWFN5dJhP+a0tailwl8ZLHCJgJjDIVU/Rq6CF2vtJvCC3WWOiRMD7zDgrrEK0A2SPMes7mVtK6G0xk2y0NH3xbIcdx9eRYQmUWk8De+hcLCVBXLUwIqQLUW4Tme91E17JRLSc/T2kRnFtxhZArhSZMbF859fCn+CiOZboUYIR2pI8/0yU/U0SzEHghBoRrz4pl+4X/a2zrnh4dnqlU5MhoARsT+kDGOweNCx7I6dmeGmZHdJVvWikWMrJ2TiFFDTazwURjMmqBpLtkeb0SAFUE9vbCnRO0BUIqe2YZSXMCk7Epmx2U30cjZiy56nMtp6DtpEESrETUfmSfHXSQnlgvFFZHLoUlsQ7yizbEL+fHq088VAPPrsfpdZ29sA6KTGynt3WuaiouTaKB+cBZsCEw0tJN/CzJhqNYY3TumEOpUqSQnnSxA84B8ddJFPwdFXhAK///U/eDIpjhCqqPg3U6xnfAsDAjTyow4W+dZ7yoVAuiOumwVCimMgvr8DFlaUCqyVNY4wijDXDgxFEAioLm5UajmHsOdax3YGP3pi1+N03g0tYAvDGw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(23010399003)(261009223027099003)(18002099003)(22082099003)(261026140227099003)(261026121527099003)(261021135927099003)(261021121427099003)(261102123227099003)(261028144727099003)(261022105027099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Bnt57D8/L03KsHl3YyYDUBsMZXHuQsQelpuCXcyexKRxzM9d0UZkBgereMard6FwRVh3cB6E0KBg4Xik2rMN2T53TcrBJD+1cm3SpIyMi31Y4L5k4EPcaH7LGV9rNquiSZ+gR8GfaXoNtyyDTqA4J6A7xHgXgfW2lKHrh+lNnUUVfqJFL6YdMoH2J6GFSw3tRJiXNwMnzRo1ZMcDyxeYtaI6aqiGjeBqFqFDdjcDYQM58W6y44n+bXRUKzvN98QIPNAFUFYS3qJ9iqRIJeJOSfw3NdCU5RSA3SPghB6nMm1M8mRNoT1PXC0S9wBWI4B9IYYiwj/X4wiAMKlTXu7sZCsT4Aqj8/zRQlpnBO1rEWiaiRQGHdRNKk+4O5JCtf6v7Wnu/oFxSvUFfJXmqGjJg+RvxNrrf2N+GcJli7lxCZICSoP8v2HnjSlgWY+DW82W
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 16:58:04.0608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 729e8629-4f29-4ebc-f710-08df44cbf223
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000009E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8818

Hello Dario,

On 11/15/26 17:34, Dario Binacchi wrote:
> Enable the eMMC connected to SDMMC2 with an 8-bit bus on the
> STM32MP257F-EV1. VDDIO2 is tied to the 1.8 V rail on this board, so
> the DDR52 and HS200 modes are enabled. Tested in HS200 mode at 100 MHz.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> index 782b4bb843ee..9c38c4fe0c1f 100644
> --- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> +++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> @@ -431,6 +431,23 @@ &sdmmc1 {
>   	status = "okay";
>   };
>   
> +&sdmmc2 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
> +	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
> +	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
> +	non-removable;
> +	no-sd;
> +	no-sdio;
> +	st,neg-edge;
> +	bus-width = <8>;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	vmmc-supply = <&scmi_vdd_emmc>;
> +	vqmmc-supply = <&scmi_vddio2>;
> +	status = "okay";
> +};

This source code appears to come from ST's downstream Linux tree. When 
upstreaming from that tree,
please preserve ST author and Signed-off-by tags.
https://github.com/STMicroelectronics/linux/commit/d00ddc95c630ebf948ebe9c22fcbca145d771afc

Regards,
Christophe Kerello.

> +
>   &spi3 {
>   	pinctrl-names = "default", "sleep";
>   	pinctrl-0 = <&spi3_pins_a>;
> ---
> base-commit: 23c62304dde29abe92013d85910d03a77dada35d
> branch: stm32mp257f-ev1-emmc-aliases
>

