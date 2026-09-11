Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020098.outbound.protection.outlook.com [52.101.229.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7FA439F62;
	Fri, 11 Sep 2026 07:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789111871; cv=fail; b=YbucIcaEtRtt/kU0VYnDaV7Z0R4Rnw4LKkKdvD6VopfnguORJjb/2OKMZzS5FEJs5NL0oRhqaXW+A1kD9jF6xNuqrUmArK52yhIeo9TQeu0WCbJv/kAaYvpgtwxsJJhsUlQJ7f/IrprDQFYSvRfdxRaWRkAYyh6iwGknoN5jG+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789111871; c=relaxed/simple;
	bh=+yVXQgjoDnrkAJHNZqG85ynEFbtazV23G1p8af2nVuU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fPJHYXA6o7Lhc0uXPOpC8rx7eUwSPSOqlyPFjdW2jwsACwQ+BU5VE85qBwbN21sW6WlzQBByAWKzIlHXBfQUP4DWXJgtbxMx02i2a8FLw6ed0tH1X0svt8aZjMOXQvfvvQazpbGK5XnZFUt90MSocmqJ2C+kEAf+TvPpvFGc68Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=X7KafPch; arc=fail smtp.client-ip=52.101.229.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="X7KafPch"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6NfhOQaZZr7zJnn/QRN/b748ZtYpt1Cej/LrK6E/wS+UthIP9jU3lQQF/RFkPWnMgoYdN6zmjTHhy8NXlvPdB0GABTUAYY8sIQ0WYWp8e8x4vAib0PrwLn7CH+9CV5hXZxBRm53pqebxMPc9gx0uXjTTZnC/StqqDEfblSvT8O4vLZLaDtXYj5LgwJ6hWqfE2BKOMy0elaY7q2UXpyAcRXsuoGZo00Ws084rJfZ3UjziQ7vqANCVtMeP9kdTNGr+65IPQX2Xl8xmA+3hmxpIwCOGzozh5dN8w5A1cciMnEzltUKi/WGzgii2PH+gjUI63HukK31HwMvxJEjCzqWmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=py+JeEmHvWgeYQ42jV1wceinU0NN0sVOFgt95BcLLmg=;
 b=CJ/E1sYBiDGxF27wmtJ8jfKdOW9YK4DolRaM+u9naV3grcACOZxK+GpnxjDIMH2AJc/n621ycN5Erk5zdusy+/7NA+FlxFwhBXclhmWhAf9Eb2Vn+cUmRqIndhug05kSGrJUYs7C+or45tMfaQKJcyxShs5tJb5B2+YiCbd9jfYkvX/mQIXlWIX2K3no2xC7e7gPYDInizHlUp5zdO0yUVtouvb8hIsPmP+nCHiVYOH+SovUPIvUyAiqsD3ER7+pWORGZf9AqQAVIYjLZ4qZfCfCJJPExr93fP7aGutDt2zHDddgKdf3vJ3hW15LpLcSy/WQkeom3B6Tofk2jukQpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=py+JeEmHvWgeYQ42jV1wceinU0NN0sVOFgt95BcLLmg=;
 b=X7KafPchoDJdu0daulsWAuKZakpHhpLlA/0lPFMPTxfGiu/TYTfXGSFIywrWVp4a7IPZ3bNWjgBMAX54sR2DOkFC4Zv2ZiNWXRQA8KS7XzZ30/fsZUF86JZFOZ2G6Af1SNqn1e2XwMhHdrt5fnDxcJvBQUNvpeZCH4jSCRKJSnI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYWP286MB2040.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:177::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 07:31:06 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 07:31:06 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a779f0: Set UFS lane count
Date: Fri, 11 Sep 2026 16:30:58 +0900
Message-ID: <20260911073058.253000-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0074.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYWP286MB2040:EE_
X-MS-Office365-Filtering-Correlation-Id: d86f2e04-38c3-4563-5ed0-08df0fd6a444
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|23010399003|1800799024|6133799003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	D/W0NkvwOHKPVuQTyGv4JVfrfMnrqWQpi2XEkSl7jm7m/BkvTMfmM3ate/2b0/rR7uRfINgRcvMlL/fV76hmBwKQxCNn7LJtQlCipVrSjA5kgFXIWjJENfc1Bo5Xz3UgAjTxGycVdMX9ogyPq5o82/F/LUc2hDtb6U4hc+ZioIEaxbULDx5fA3ghmIQfmB6tz/KokhADbvJEOmvt2pGtfPtu3UaBE7/sqK4VUrsPCgu1KTqS+jTIVVjfTiDXpofmj6mzQiPBmPo6HZUE0vI5LQOrHvXY8XmmaF6V5B+vlerY7+wq8bAnx2Ug3UQuvvVTHrNVbM7sItzh35CyGx5zVVuOzgVvT/TVU89HitjinRAJCfjPHxHIA3Szmjqw55GNpimw6DSbxN4wES8tZjgPVE7M6PX+M+a05967iM4eWnA5e/4BS1oaYA4RARzpo9Jr+27HY04uj3Gpr06AdtzZHl/rPieOrRiR5FDhzsMd5Yew1boMzjtIwAkZQ5D6YcZIQd+Co3YRiwP/HcC+dw/QZyGMET9tytS7PRVtKQeaaoE3RRsCZujkw09TA33eSDCztxD6a8iQ+p/Fj85dlvm+4yNnYAC7OJygKH1ELuvCUpc930NDhiN6+aD3ExYYF9rhhtNylud8i5x9Qew901quqaSl+UhHFIzMjJn1uPYydoE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(23010399003)(1800799024)(6133799003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1cuOadZtaIS0Ov/fsljRwA4gEovwbXco5rRWMwiQ391DblqmjDKoRk52CUeL?=
 =?us-ascii?Q?v5uNZqDHETcz7S0JaagJvoVTJ4ElIg8+Cq1keVgKqQIT6dmFvZJd33ybCOJc?=
 =?us-ascii?Q?sVte4SYYGXnDsfTvlGyj4B02DWMhCgYrOELB0PEijulbudmy3t00xDudwyIf?=
 =?us-ascii?Q?qmswzmLR6XfiFOb9Hw5m8HIVLQrgM3KhDEOpe1ljN+6SNzJtIj9Jl+Xzk3En?=
 =?us-ascii?Q?O84+J+h1liLUPcU3mhyqLYcV/KNKYj/D+dn2gShUc1gWZcpMD2ilH83+c8od?=
 =?us-ascii?Q?GOh214UtJeJAPvbPg1eNWh3ssnzY6NKUm91D5pd4sscj6iPlAb1zsdm5X3zK?=
 =?us-ascii?Q?wIQDbKZAVhPymC98vKTYTZlmZsp/r6TvL19XwLsIvGeEFCl8tOyYbmv8tCrY?=
 =?us-ascii?Q?qDHm+JMKpBMy1roEkNu0sxP340exvTaxCpWPcimrSKaBxxryy/dd2Wlp3GZh?=
 =?us-ascii?Q?iLoq04g7e1ceoiAi/j08f1eTUHvZr7T6iogNwPdMhmnvoiGON/evWlpoIUJ0?=
 =?us-ascii?Q?FfZSEKPO0fA44S4e0Tk9dcoys1Mu8uCG9cF+m7GGQzGQuH97g0YcZNyqLlDC?=
 =?us-ascii?Q?ioD1eO5CcWgHRGtGMXo+WDHYhCgHDrYkFL5cvWeqTpeHkYecjBEXl5jabG8h?=
 =?us-ascii?Q?vvWrLHWv1HaeQ5Nbf9PYEdnC5A+TWSPhPunGF89jjRGyyb7AOYIsfmGJdJld?=
 =?us-ascii?Q?Q0Sgm20W85LweXqi73RgOlJUzGwfg7rI4E4WuQaa9iIW70dJQBXqfLNL6UUT?=
 =?us-ascii?Q?F0MTQPXBFcRNJoLrxiQD5UeFNwJJyjRxzL9e7o1WL3l/Q6cX3TZGyN6PxIbo?=
 =?us-ascii?Q?w/BKqf9Bg6WTZVoJyaZMJqdp6AN4kP/0Jov5Eo3BbITqsMBIC6G0pdyTWGhg?=
 =?us-ascii?Q?8rgGguuIwlBjky7eBndokj2VVPwsUTxIeDtwjwsAP2sbf2gyebkz7Ka7loH8?=
 =?us-ascii?Q?AUku72VFO4pT/+RQq55Etze6W03ieTBjRIEzLsoQD7azMUPFkYe6+6cneOcG?=
 =?us-ascii?Q?YS+U97MduAnzXH5iG6U7tfxzhvhJzXmChwHVmw2x1osxJCpq8nO9DQUl2Lth?=
 =?us-ascii?Q?0WFC8eb0N4pB2OgDE3/67luCJ0KCW759Bt5ZrGj0rJBwGzhQP0W9PsRYIYan?=
 =?us-ascii?Q?h2jl0XURrKd+XJ4DXRad0C2OGS+4xgcsqi6qiIcFeXS3wOYaKKYqoM4hMhg0?=
 =?us-ascii?Q?pXseVVkEv1MEQUjEDrwlROiwlmkZWS2Stst+r7xPoSXORu7DMc5M4m+LzXxl?=
 =?us-ascii?Q?i2vqhUPWtqh9NEldT7+A/vPdQX9ceFLg08J1hZL9k8lMOWqdpTytLqTn6lTW?=
 =?us-ascii?Q?tHdiS/GMmw4ZK7iyIb87zVZH41TZlpcZ9gYYs19NFeZ47OXSKhSPyTBN/ycv?=
 =?us-ascii?Q?mcA6rD3sT9rOwaCbGwHmqH0jI8M9lqLE4TwUuwzlRTM91UKsofupDFaMZKSM?=
 =?us-ascii?Q?izHEFyvYA9ABBh6XCEtU/SU3Fwc38FpuhryiaP+jJt3w33MY3jBhvGfQyeJl?=
 =?us-ascii?Q?+diQTYQo5RrYDCYzdns9pLMpyec2hcNgfvTXTQ+wd8HxLN8FsgnuJj/HGRJd?=
 =?us-ascii?Q?CDygkaNEoLqtM8ILy7Vg2jVYF6FcrfqZkjyyWdsZIsAyn7Ic2xpeApY/nccm?=
 =?us-ascii?Q?/SlwxO10/cZYy37HwXZTKAd0otTXcJI8CZdqJFXU5k9xZ7053sone3GsSogz?=
 =?us-ascii?Q?hjAL6sb5plK/9syF6N7QYnnSi6tB3MQTW9rwXJkyrksvweegbLrIcZF5vghR?=
 =?us-ascii?Q?mzFIjUh/vt/vAmLm5yFLmckbJXDyw6GjULKuHlauc7N9gRva8Vnv?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: d86f2e04-38c3-4563-5ed0-08df0fd6a444
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 07:31:06.4761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5IM7r2FYKJq3CJNgYIpDrzZejV9DUjIVfJwQ4dRAXm0BfdAPIWMSBDSKlLIcuFHTJEigGsrwgzUrG1V48sVTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2040

Since commit e72323f3b09f ("scsi: ufs: core: Configure only active lanes
during link"), the following error is observed on R-Car S4:

ufshcd-renesas e6860000.ufs: Tx lane mismatch [config,reported] [2,1]
ufshcd-renesas e6860000.ufs: link startup failed -67
ufshcd-renesas e6860000.ufs: error -ENOLINK: Initialization failed with error -67
ufshcd-renesas e6860000.ufs: probe with driver ufshcd-renesas failed with error -67

R-Car S4 has one UFS lane per direction, as described in section 152.1
of its hardware manual. Without lanes-per-direction, the UFS platform
driver defaults to two lanes.

Previously, the core used PA_CONNECTEDRXDATALANES and
PA_CONNECTEDTXDATALANES to configure the link without checking them
against lanes-per-direction, so the missing property did not prevent
initialization.

Explicitly set lanes-per-direction to 1, now that the validation is in
place.

Fixes: 5235d551779d ("arm64: dts: renesas: r8a779f0: Add UFS node")
Cc: stable@vger.kernel.org # 7.2+
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 69c247b7f0e2..1aeafa1b96e2 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -901,6 +901,7 @@ ufs: ufs@e6860000 {
 			clocks = <&cpg CPG_MOD 1514>, <&ufs30_clk>;
 			clock-names = "fck", "ref_clk";
 			freq-table-hz = <200000000 200000000>, <38400000 38400000>;
+			lanes-per-direction = <1>;
 			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
 			resets = <&cpg 1514>;
 			status = "disabled";

base-commit: eb3aaa2249eb2f4224bc27874f5d685471653142
-- 
2.51.0

