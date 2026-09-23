Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013012.outbound.protection.outlook.com [40.107.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF9047127D;
	Wed, 23 Sep 2026 08:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151754; cv=fail; b=hegTkslU9enleixZTvBF4TwoJiqpzwOljS1/iCnIO/g2onMNSSrlrJsH2w/KjHbXHZsXuoALoRSq8ens4MHYMwHokzT8jlXpwN5b2G2BB6gL6/8MdgEWMqeJcIgkv4lDfaNAqGkHsbZwH2BARlxP5IQJAAW0C77MQFFjGKfa+zI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151754; c=relaxed/simple;
	bh=MFMSZTQcrs8qFz7LeHGSBFZKAx79c9M5VDUjejZrJ8U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RpR7z+xwM90jDBeEq/mmP8RNVIDvcuY7DWkd7ttBbFnWSC8U/UBpM5eZbo+To5fmGjRH1rwUZgot9/kbNij9DMn8mA2FL4bRqch85n2pQN2FJ9wZbGr8X+6tUrANp3dzMiei7PGwmAIafdqm65o4wkL+fsEHHK+T7V22/C54jvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=s8SW4eaa; arc=fail smtp.client-ip=40.107.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="s8SW4eaa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n0DbauS19T5hESfBrDFa7f+1ervA8m4SVPSqpBtm4WZfuvMnWEqe9zzY1TsG4T9HcyFYFoRyjjbA/qWvA7TjEmOvGHMHaL00+qJqYCqKRVVB7QfRz8fVkA9edizh89OWSWLagdtq2LjqFW/lbPjktLsheyQvVhzcLCtC/4zMqWa04KMVUrVfWswy6fCp+Dj3qVmxmeZk8YuaM+daYeOgvL9X11c34O4uXojuaMGAUBpq9x0VTvUAC+fMbIPhzL9pLnVOO4edO037i+03WHhY1H6wmDzRb13Y7lAunBNx1zlKRayaVczvPL68SjacRXd+2ct8X6iMbM0D/PngkKlQ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zD7zf9e0FOolF0SSxll4oxuuL9pzMxuJFGoEgwLLyKU=;
 b=b+tbm+hHsTZ2RDmwm6BpztiwlOkiaQSOldbXKEl5hBZUYzJ5emnROwcYdbA+7mAtNywVuueZJyjZxEmoZEXQeEGk8YZOUbH+xTRFVLM1Pwpu+FmHJQbbABDlJwfD63HuEMSUq+1Bk+fYLz7RxLZ87GaHzkZ+V7W/3HLGIRqxtHiEmvvyDBLt3eGP6uHP79W+4PhWtHBurdtLmc2PAooZVbbCv7tT4KXEXAN93eEtjqYt0z5Vvzc7BiOJXGYgL72FZgxMODgno2p7CN6p+wedO1NNG3kj3N4xlxsP02Vq95OGWTWy+0vB4piiRQoh7CfEUH5g8KIqbZp1Br41+Tutug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zD7zf9e0FOolF0SSxll4oxuuL9pzMxuJFGoEgwLLyKU=;
 b=s8SW4eaaYWmORiNzfZgRm/EXXBBxc4V5TbiWsasCQL+Z3eFHt7PUqp8vgBIe539o8xOGH5xg1j520NrOHd+SUuVcmWa9+wa2EhDsB4M7nI1ybp6hUK4BMsIr3JppM31Xix2UDuPC/xYim2x6klH+IS3ApKsSBRl+InRhJcNt036hH01Q9gfG22LXg7FED5lmusqvXGe1/o8bplEXbflVlvl6PeS3PzdBmTDli0HSDrECHVS1NOiHrSkXYw4LnwfeT7M7hGa/6+mgeNtK6Q6gEIQoASvEJo+Zj9AAvRdLmQ4nZ7hbUa8LNoMNo7wXE9pFZ8LTZBQODRzbSNjX9IlZnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by BY1PR03MB7849.namprd03.prod.outlook.com (2603:10b6:a03:5b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 08:22:26 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 08:22:26 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] arm64: dts: socfpga: agilex5: enable eMMC 1.8V DDR on SoCDK eMMC
Date: Wed, 23 Sep 2026 16:22:08 +0800
Message-ID: <d9110a2bdecfe072310ec67b6f6cb96c1accb0bd.1790151203.git.tze.yee.ng@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7d1af1e8-7662-4b2f-dcd7-08df194bccee
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|11063799006|10067099003|55112099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	E25di5B68VrX82T6UQCv21CprHhg5JnRfZAPiq9ilCDj7/YVxxcfSW4jQMP9WEWbfdDEs8ZdMPPtdQJtzuFzOtrS//oKscg7RubSrL0Yn1Mh4BfMHyszCrN6ifPz7PWEp9L/T1B0cJ6g61472oxznbpQn26WMXoeJacg+9ZRt4ual1eze+Lk9yucQDDJYYnPF4o0Rl2rhvL7jOOlge+FOy1nPWUeHEyJou+yimAoO6TIXOIcvtToS6Z1e1VT4p1PLcQUPKFevL282xy4DW/3ErcfwpgaYWLffbOa2qyNr1ALH5TqMk33DMDQwSn/EiAlVmqzDI2RN9V2UFBrKgAK0KmVjV33hJoL6SEaPqOnVC2L8nGtPuWFSnhQAu+R2V9ML43U1JLhzpw+jHKLDCFGM6uzs5uI0yo6Ehcv5Tj1j2SFopDKiDIRSeeajMPRENc2BWOtPErmWGIv0oDpFBxO3LExxljNuP3wZwQU5fDUQRlFBAoNhb7gET591FcgMml7t2Nbb4q2wCFK6lcZ2ILlG7HAx9HqvFKOMqsIl3j+PUfDXgs+w5VduW+/kxz3gG1/dqtZESet1TGhysCcHCXskEhUHzrxX7Kv6pQEUCrKqmPdnftnGVj4SEnIBxzx0+SEVIkeTMqdhAr+Kzc3pBS3YPVllEEedJmTEmuI1Li4AFg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(55112099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aeC47xzjMlYc0Fh0/A66zxvWZ0A6Eh2AiFoRFt4L6TTzkDb2v7r028E8WYAA?=
 =?us-ascii?Q?BpBEzub82q1R6bvilPSs6QZGa6rUHbCqCxTZIOceBUTz1pvPbLsa/e0ZZc5c?=
 =?us-ascii?Q?T72El45yzXbqx0BKnEgq2r2vWMcPenKHS1gnZFWZmhU6TxfPk5A91TQz5Q+U?=
 =?us-ascii?Q?/Lmjq1oXWIrcgAQdFh/Btus08AvFghaBq832soyi0lBXjsisfqv+RajU1ORK?=
 =?us-ascii?Q?mNGKxS6VY7H9z3cUlKzBZ/JqEy3P8/N3G1QJpiR6amk1mZDn9UbQk5B5cC5a?=
 =?us-ascii?Q?D0hoG1Pg58CSMHhjK0u1EMuXTtxWv9j8gIyHFYHP9qJV95jto7k8+5Pmssm5?=
 =?us-ascii?Q?qsr29dpriiUJmGlynFnfK311uqARalXgdjUmlhlu7V3F/OB2U+D0+m06pbZS?=
 =?us-ascii?Q?YuOqhzNsByicSvebTZb6oF/AG9/HKZiwd+/1nIB/FJw+FblE7rtZgO24SBpw?=
 =?us-ascii?Q?+QF7qh98KoQUagBxWu7GQXlfHbx3obHIL5rP/RMfpGhz27KQx8x6q/Dz+WAG?=
 =?us-ascii?Q?4qG0gwg8x/GyuF8IQHx63rUNYmgs/46pNWnxsHYVprj1FOEqmF3WJlfqes7o?=
 =?us-ascii?Q?TPXGasNew/o4DD5x3S/EqpBbpLGPnugLBcbZJQhO7N5kHEALs04qenOy4ala?=
 =?us-ascii?Q?4ETRvdElQHwf3lPIUwHUOrQalZyExTBEMvdaXzpLKx6E5wklDdzMNDAE+3TH?=
 =?us-ascii?Q?Rvymc8bezG/ytXTEYXEw3ZkqIPTtHafuqfBdAgeBluBpCF8iwowbSLgBFB5j?=
 =?us-ascii?Q?UeUw4lo9zd2Ta+H2d5gWWazydINegwWi0g/akGr2VYM4BnabnZFaNKpNBYU+?=
 =?us-ascii?Q?3Jj9VJ206OOnMD/xtWoRNskNtRemPzQ0LON3XlXFrsyHvPtlgKqw9iD6Uz9W?=
 =?us-ascii?Q?rCI0YlMR98vMP8PGNdC1/wlo/+iwVtUipHh3Mzj2iKUgIDA5llBxTa0+PyQf?=
 =?us-ascii?Q?BMLw2f43RZZ6OeRpMHCIYNU2CgImErTCKxFzQJhBi0jzWNC7xFKjdh/zwG02?=
 =?us-ascii?Q?/FGZTtmIszSKNq3FZ1XQ5OOhltEU4d3NZOSZjG5SXPz2MhbXtDBrqNBW8+Pg?=
 =?us-ascii?Q?ParxthLC/Jb3mSnUboUz+ddg2InMv1e/sMTCGvb6nsaTVHc/y9QokWls/0An?=
 =?us-ascii?Q?yzVaiDJUpuYwCXIeUI1I0+dyO7JS95aTjaXBmUxJSHcEv+gMC8SlH9U9AnLz?=
 =?us-ascii?Q?aYLl7vhodLaJJm/EWoFQMcNTqEjztrWcIgi6TOIitJwrIb1Y0ib7SitRtWsf?=
 =?us-ascii?Q?GXrbP9KY6iULTWbh6bq8sIyysohCesRWdyEDpLpO8Sr6nP29eBV9AaV+rz81?=
 =?us-ascii?Q?PUQeT0dSlidbTfBnjB8B4wIwr5Zu5IiZwvTU7hH9HfArBZOlHr7GAlvKULPd?=
 =?us-ascii?Q?xNcEnG8aEulSvoL7N1Ho6FbelWxGURA4s1slRCPReJSw58fmRSlKQ2SsQ4I3?=
 =?us-ascii?Q?roXPeNrj70iUsf3dVwkGKZGEnBjLXuV48eBs9Bw0ZiJ6PhR0uoRQpQeyWxbQ?=
 =?us-ascii?Q?vOB5O0/PSiYv8ltf1w5uzoSIz5ZLd6TOh01e5tDbDpHvWXCJPIUcwHm4aUYj?=
 =?us-ascii?Q?LoANWNQMXB/mRHzEM+1+Yk1gUvibFsKGawB7YKAZCCo4161QvEDoqupNXvHI?=
 =?us-ascii?Q?AijKzWoPGr0qA7T22dYS9bbzemEqijk85hVIrSJlrDG08U6XUImjPiQMxEa/?=
 =?us-ascii?Q?hlL97TOTs0WmzPfg0+uOdEcQwveX82uVu1RSVbKT0Z3DNYHUY8Cek109UWkD?=
 =?us-ascii?Q?Yp80bkzXyg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d1af1e8-7662-4b2f-dcd7-08df194bccee
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 08:22:26.4800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbXOw/kIQg7pkGonSqnnHfsBASUDmku06yUTorOPA6s2ZIrisCjX+eMx5Ea4eR71LzpS7mBJHpNpU3qyiaMzRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7849

From: Tze Yee Ng <tze.yee.ng@altera.com>

Add mmc-ddr-1_8v to the eMMC variant so the controller can use the
high-speed DDR (52 MHz) 1.8V eMMC mode in addition to the existing
HS200/HS400 modes.

Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dts
index beb4f444c471..52e3eeb98e8a 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dts
@@ -63,6 +63,7 @@ &sdmmc {
 	max-frequency = <200000000>;
 	mmc-hs200-1_8v;
 	mmc-hs400-1_8v;
+	mmc-ddr-1_8v;
 	no-sd;
 	no-sdio;
 	non-removable;
-- 
2.43.7

