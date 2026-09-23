Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013012.outbound.protection.outlook.com [40.107.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B443F4718EB;
	Wed, 23 Sep 2026 08:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151759; cv=fail; b=PMjVxtKPG74dEKQ5E5iDcmMQhytIvKBw8CzlgjdRROSWoBGifXuiCuUywOxiFJFviNri6vUHo7DU4i0xamcSTxfloiuAbBN0t02FVVCto1+fPWUsVBkiRYJaTSKVQDhLCtHLTMauF4clnILT0/EbjTKPKy053+lPCfqEPoUrNcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151759; c=relaxed/simple;
	bh=lI0Bm0y1rts7sb8mVNiDTFUkdlzzMtlD+p4fA8oX47g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZZ0nLkabNxZKCPwrqxv349DBhAWEhoY8SyoxJ1s7kXE1FhWJucMP1BzCg+fACHwZfv8mfQ5gwWybWvLGx91eV5E8SerkO8kVw5GNXJ+vpF7Of3ZFyQt0fwiwENPx4n5JFChrJC6sEgLHwR8nwOGwXI0bm409761lAbq9sYvZBxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=eV9GcBRL; arc=fail smtp.client-ip=40.107.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="eV9GcBRL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzpHInq/btH/+EJkmjER4qP8+0aqQ+4OyM5klNFuYFW6z4zqFWfYfv+K9U4Lb6sn8dlQC2JgC4PzR+4kQP0nrHhVVX/TDCA6xweeZVkLB0R1DjEjZCBHz+li+1mS4lNAPAk9Bzic0FBR8yz8VeMku8lmR30FqOWh6pJg8SCqKCOuz4Im6jBy8llvDf7UH3LIWVwJTvH4j/pwHZ2er5RhcpM3IqiAxCbUFbYM88G0DWPgTZglNUbr/5b4yPGr1/LwDu/zrxdxzYKfvccD4vHtVGYfBsz4baIAeQCzmLzt9EVIpjvlOvDieNjslfI9Lvhx4I7iFP6nIE0mgzUQ9sgHxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58JRfkKQzBk9KC0flyUaaf4l+pZrAN5QQJo6RpEREJA=;
 b=LhNCWPijq8RuWvNF/sX+OYSCVzclzrb6lnltUSZHtBCFaUDYUXxn5WtUaLROPu1G54879BW/nJTsbNW9cIzzQFBxbdPAfD5pa0TpRWyPqHyrbbRXUBAisnnPN6Sznz3f3ukLRyajw8a1DRN71u8Suh4UeBxf/lxt4GoT8QExPKgIcGrQ5eDbPA4ueYX2FgMC1QrMhJyGzIYCeS3XwaJEJyGJPoK+xxBtstfwmnYjr8GS9Ce/8yYcomuJmEAp2N6qFTRbnmpZs16l2x5KKbwhoS55Zdqv5x07apxQJ3eEDbvY8XNQ9Igyy4vRZbJOb5ekSMe3hBj3lE754NvdvTvSuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58JRfkKQzBk9KC0flyUaaf4l+pZrAN5QQJo6RpEREJA=;
 b=eV9GcBRLX51AwgUIJRhvOdsIypgXJEPgr9tPHKVveU4pEv5nnsIdkQv50LpcsXx9Fj9kjWqew2HaatRvezD7jV8w8C//V4Hgpckne3zmrvMas8c719Id6abnSG9QBb+Fmv570Uc87JBonCZSMNFTMlSAfMX0AkwWJpl7KFzR2h4TqtQ/o9Ph+w1/7M+3COJr82G8HFaty1y5mpJLXV+8HHfLMdED0dGvdwHDYn1aBX67/ShaNmus0Ln/EutYgvwDP/15oCs76xmuRAdX+C8psvdXfbi0bYNS1HCUca8MBqwd561Q8AUIafC+N8BeyXKCUfsuDESWoPTlm5xm9Y750g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by BY1PR03MB7849.namprd03.prod.outlook.com (2603:10b6:a03:5b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 08:22:34 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 08:22:34 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: socfpga: agilex3: enable SD card on SoCDK
Date: Wed, 23 Sep 2026 16:22:11 +0800
Message-ID: <eb022d8694b3645fd96bfdb193cc5ba09713cc47.1790151203.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1790151203.git.tze.yee.ng@altera.com>
References: <cover.1790151203.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::8) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|BY1PR03MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c97a8d6-7ec2-44cf-067f-08df194bd16e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|11063799006|10067099003|55112099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hms/Go0JM8rINTbLb3iiPdCxmZmp61cVJ+OX6nWkhURe1k8oWV4HzwN66VCxZiNjSTgEznewmnB5P++ljcLFngr0g8mDKzgu0nbC4t5GGg/oHteZroYJvh1JNJoRT7sjt4zMrMroO0r+wU0WZ2G1pUEeLjz5YfI0YUPSFeRk9K+ps7Lss2cysgPDqJrEthDcmZhRoF/DyfsBiPcNUJVvqujGGYByQxDVXKcWqNdtW4l5Rnn6g6RerVUSL1M6ETlseJb0MaAbl0Ybptx1XtX2QrxF6uCooaygbq0aQ3pgAE3tPF+ySNyHPcLH8fk3VEn9ZoCo7e5QhPo6aAIONiFb6njpRwU/BTHR1Wi0X8J3IwOYyeBiNEcA6y5vjN2TBwssL9ixpYXuKOskWeQLHDOibRf7gwHjUolHdpm21l/8oy8uKdjxR/DSyYRnWUhISSRRtD/gbdfR0b4ZoX2KUrs2NFgx5wQadtXkBP4KTtcVYbMQEraaQp6HdJaQoPtrXTiCkNaLcQoFmjC/6yi/RkAP8M88nlDLQ6MNVSq5zY36Uu8S7f9rIU09boVeQLc7BUuIZ+qH9cj3DF6R2gr/KOyohigT65OemLzOiK6QUIZGHpCRDauWFu0rzKgFpJuwv4mShWrrRZDou028zJj/JneA9ktJ5Mu9A9R4YTDtJC7Dr1M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(55112099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SzGXNUgxqG8KgQxzMAGxm9TFv9nTrtzD5aJwZM4gXV/TZ+8shgN6pV9YcDO5?=
 =?us-ascii?Q?iK49L9zbgpQ288XQ4vMcOiDjLPcYsDTN+zPc13VGu/eDH0FahKCDQyTFIIyJ?=
 =?us-ascii?Q?Py8Eucb11Xoe7WKI1zW7Y7t9+AdPPzwma5LheHgK/V4Sgcc8pw1jkInb+kWm?=
 =?us-ascii?Q?hYm26J6pXTvkBc1TxdqeLv5JPL8+8oUz6aeFt8Pg5LVhZ4qZStCyx9Hx9lAm?=
 =?us-ascii?Q?ci03bvn/36pcCAunzaOKlBWzCUbGepEd85YiSg8WdqYtLcAc6uJa78XSRyOA?=
 =?us-ascii?Q?ESdZFvixKV+kwNU6ymLqtFKa5Mmcn0tcS1hgc/mOifDDRC5x882QSuSRQfg3?=
 =?us-ascii?Q?nGnpt6ftbocYG6j0GYrbHO4Vw9nw4LcX5nPZ1CXFRxJXS0xFGbR5Yt790a7w?=
 =?us-ascii?Q?GTM4Nz36i+w4eF6O38sOZL4AcNjprsZnuh3STTK8OBLxd4OokU5cBid+K06A?=
 =?us-ascii?Q?kGI2f/f2LoJMuD60QiHGOuCbqA2meoIFghqsnNcb0gnK8G1zY0RtQ1d1aR0s?=
 =?us-ascii?Q?UW01APISpXOGvjmuH25rIvmR2wk5hUjKp7YY4uYL8l6B6tqQsc7Nhond01Ie?=
 =?us-ascii?Q?p15oKNI7h4p/mg+fFLJmK0oODzJY24wV8z2FbXE9dkjqOD2J8vZ9EF15J++/?=
 =?us-ascii?Q?uyRoz4uvdbJjNfzi6iLlojG07JJBj4632h+J+LntiPmW9+UiSAG8aKccqIXA?=
 =?us-ascii?Q?s5lrD0MDLw+JRzTeMv4UhE9h3BL23ipFUqR7nzmE7PWc4WFrJadc60YD1H43?=
 =?us-ascii?Q?hRI70M09DhsjsRw9woAxLQDkm4ZA3TcODqZE4B1Q4moUptKFxd299XSYqtUI?=
 =?us-ascii?Q?NlJnD66ch0ylbdNx0/Q+lo/iK6rPXH9jVmIhrJWPlyYNYRq8dFJX6zsfX8C7?=
 =?us-ascii?Q?Jkg7H9R5kCPfISgKAT15splKlgCOQvKZwQf2N8wR9PQQY1W82qhGGQAnLzxG?=
 =?us-ascii?Q?HJKF5vbKZTWdiIp4hezpi8Rg98jGDw3Xx6ZNdE0+kAS801Y4BiDmq1+UOKLl?=
 =?us-ascii?Q?EHRr8u0ui95jmNqHbDS89s/2FB8bbRULYiFLjWy7WyUpqq0QIv66GCsCMmg7?=
 =?us-ascii?Q?5I4CFXoDf88MA5LY+hy/byTnHzegR9hukEa5j7PXi+cME3GgQkeCwuzBmyBk?=
 =?us-ascii?Q?cVswaw9xSGo6VeF1OIC9dkezj2GvewCwcxP40sNThzSYD9tXUtjMN2j2LI0w?=
 =?us-ascii?Q?Mjea76hC/kWEJWhh4cm3Ido2cdVcf4Mi0ip70Gt8EJbD/tfXAvqS8KKcNp14?=
 =?us-ascii?Q?J9/lBDT1DMuNuonXTBfu/yzV3u/CxKg0R/DTZIyBz/uD4MaEUvs2gfN4HsTh?=
 =?us-ascii?Q?sUDWDa7IwFMyDmpmScyB+Qqz6GRA0tRdmPLQwP/Kg2N/tuWh2UEVZJx2zZDy?=
 =?us-ascii?Q?nglVIQrcRrfraB/0ItcH+7LbHOpFv25jnaFoNC4KEtcFBoU1yluKTnBTZN3P?=
 =?us-ascii?Q?cBxxn+IjTvTELCMmzjHN9OC0605tBKC6PVFTJ2WP0WwiFxwqU+8OqDRnYHcx?=
 =?us-ascii?Q?434+V7zCKmXWN3hhHh/rQJn1d0PrHvHBERw1kgLKWQnTHR/R1uZjAzFANPhb?=
 =?us-ascii?Q?WcGUI9Rljn/iFUjhO2lBROPjjB8evd1mvkyx8iSfTX0mRECqKF0ANjASmzuI?=
 =?us-ascii?Q?ZY6Up/LfzPgHwTlLQ08xUJf0ULb3Jm6fPWK175qfkDIDD5Gjisdykj1dj2WO?=
 =?us-ascii?Q?+PTWWaxlC3WrikDMiiNUkw77wAWsEXQylpRXs6ic19edr01n91ke4BQQWrXw?=
 =?us-ascii?Q?DbWCI9Mpaw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c97a8d6-7ec2-44cf-067f-08df194bd16e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 08:22:33.9812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2aQ4Dg25OJHvG/XbBuS9ddwF2VF2MdOwFo7T+Pz12ybEnGQT43jL0b4KSjsAWNhUvpK/K9s7sRONI9C0AOazKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7849

From: Tze Yee Ng <tze.yee.ng@altera.com>

Enable the micro-SD slot on the Agilex3 SoCDK board:

  - Add the fixed 3.3V card supply and the GPIO-controlled 1.8V/3.3V
    VQMMC I/O regulator.
  - Enable the sdmmc node in 4-bit mode with SDR104 and DDR50 UHS-I
    support and wire up the vmmc/vqmmc supplies.

The board includes socfpga_agilex5.dtsi, so the DDR50 read-path tuning
defaults added there apply here as well.

Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 .../boot/dts/intel/socfpga_agilex3_socdk.dts  | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
index b40f28519334..f46e5c070c0e 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
@@ -45,6 +45,25 @@ memory@80000000 {
 		/* We expect the bootloader to fill in the reg */
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
+
+	vqmmc_io_reg: regulator-1p8v {
+		compatible = "regulator-gpio";
+		gpios = <&portb 3 GPIO_ACTIVE_HIGH>;
+		gpios-states = <0>;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "vqmmc-io";
+		states = <1800000 0x1>,
+			 <3300000 0x0>;
+	};
+
+	vmmc_reg: regulator-fixed-3p3v {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "vcc-sd";
+	};
 };
 
 &gmac2 {
@@ -121,6 +140,20 @@ root: partition@c00000 {
 	};
 };
 
+&sdmmc {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	disable-wp;
+	max-frequency = <200000000>;
+	no-mmc;
+	sd-uhs-ddr50;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vmmc_reg>;
+	vqmmc-supply = <&vqmmc_io_reg>;
+
+	status = "okay";
+};
+
 &smmu {
 	status = "okay";
 };
-- 
2.43.7

