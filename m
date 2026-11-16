Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794829006;
	b=kIuWFhJF/jhb8Zmtg9PjSdLgn7fFOhH16LP9+Bv9xToTvpIqpbicBomYwrc/V+KKUwp0
	 Dq1LE4giUUNU6cXiL4VLOiU2Rg2jEfsOsrt+CsWr8pDGThwPnAZRsYOSmlLt7bQCBRGh2
	 jLMMrdFceEGbHAqjgjdJj1ngS/64rFjYS2VQ84iilQiMadkoeQwO76kR5/xWfWWTUJJEr
	 h12uhSxe0ab/7R27xva7M7pf0ZfXVnxFw7DpvpOCjghNkMQKNjnMn9DWQolH4KWYhZMt+
	 bmer3X+voRn44AUVmNYvT/aMDhRz5D5Ap053KB60gWlsmKUifXvPRHHfY/eILxfodaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829006;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jUfs4WgdIzDmVn5wGXTlrouKHvKM6sgDIsWXkQqxs8c=;
	b=bnYlHJBq/9w9LhBte+2tch4NDlrYCt27gjRSo9KX2sWW7VbKQ13HOpG45tNFFfmB2RJq
	 H5ibTXGRZWfaBwQbCz+uC2kjglm5j6fUafABfmi8fLamItro7nAEiZHBMImKMaOESH+bm
	 qVKJE4Xd/J+ogw/QBSEvwa2s0/vIt25L0EwM6jbnXdUfaCIHfrocxUhFDdkyaUBbw64u8
	 YdQFJ54bWpbv9+osL7PulxOsD3rMycbemUR+NHxxWzNsFcscEGlgTm4aignXKjNxF1osq
	 9ZYyDhz0YOxsKESyLAJntKmf2VNhurQLA/ysk0m5fotw5iinwEm8naWET6nZb2M8xLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=E7EXUvfR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.42
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013042.outbound.protection.outlook.com [40.107.162.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624D4606A323;
	Mon, 16 Nov 2026 11:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 624D4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=E7EXUvfR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WzC1DJzwrJKxdqhYX4QkrofcX0HGv+FRvzTwCkMLxjCNsWlIO3CDQWgMR7k6Vd5qA6Izi2UunBIzMR2uZI1BCYaRMpmUczQJaQt4GowHcCI0/57BC6E+Z4d15U2JgwYRVH3nBNCcRTPJ8E2vbIFl3tjHUfeLlsP65MYXDywRPvLmwtyGfLYX7LKl+g+LISJlzeAVbtD1YfUAfibSaNImY/hmwLk6DiWhgDprxGMqlXb9QAB9UJdU4quvcaC+qDimRb6hx0Jt/S7Uizcjmn23mzGCw4B0wkuQ35TAYLnCsrFl5KwwfXe36kqsmsNYpZbBAa2s3JIwPoHp/bTFqxgzIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUfs4WgdIzDmVn5wGXTlrouKHvKM6sgDIsWXkQqxs8c=;
 b=K2Pn5ByJrvfZo0bo+9NcSUZjfPhXHQBuNuWXRR7RvJg3fUualJ5dzukAlfSZcZfWaSpLHpr86rVLryxOh8kmqUO1oJDo1ivWJVzIT2gvnfbmDqKWzbtNWl7qM1mZgaOeJkEvxhayjDp/zwJJZ6iUynQQbKKfKnVrrProsfCbRbEo1dtzeNGpOxSkH9Ntz8baSdD0KJCwmVICEs3xgPTDTfo0LnpX/PrvYxgr/bs7X/fVx6mvlc1HzcMnJYDCMj8tNM+/Ws9Bk9LE1EstPorLHrtBhXw/OLj3Zdj5y9qJ4D+TvRsq/pr55kj5h5TEWawfdgjqzyRLE1v2GmJuIH06Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUfs4WgdIzDmVn5wGXTlrouKHvKM6sgDIsWXkQqxs8c=;
 b=E7EXUvfRDFd+UBKz9lAQuGtYlxShDsv3lKoO60nDTUd7FS4uLwb02vD2s5/AMzXgyGGWWVIXo5cpW2gYIIQRFa3asFkmM6FysvMve6tDWdwREWNcPP4RBy7wvKCt7w/juqxQK/I3WE+DaGxOyFMxvdcyvkSGUBBN590xPCIGB5NHa9hQpqcFJoCRgfqKq+3cx2XUQM6LM8e/Ihn88HlJaNQg+rqwsj4qCA0Pe7qJ7MvPgobjP13Gezk9d8qeMw/kJKbIDySjt+Xx66tNYXPHcQn26Hd+Thv0YDWgmV6XFat1+KTzDpT+2r54pkPRtw5pkW86BdN5DrnWxMDvp+x38w==
Received: from DUZP191CA0044.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::25)
 by WA4PR10MB866235.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:1d0:30::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Mon, 16 Nov
 2026 11:36:41 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::4) by DUZP191CA0044.outlook.office365.com
 (2603:10a6:10:4f8::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 11:36:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509E9.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 11:36:40 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 12:37:23 +0100
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 16 Nov
 2026 12:36:39 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 16 Nov 2026 12:36:02 +0100
Subject: [PATCH v2 2/3] arm64: dts: st: add delay on imx335 reset gpio on
 stm32mp257f-ev1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261116-stm32mp-imx335-fix-v2-2-5f2f8ce7e4eb@foss.st.com>
References: <20261116-stm32mp-imx335-fix-v2-0-5f2f8ce7e4eb@foss.st.com>
In-Reply-To: <20261116-stm32mp-imx335-fix-v2-0-5f2f8ce7e4eb@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E9:EE_|WA4PR10MB866235:EE_
X-MS-Office365-Filtering-Correlation-Id: 46a3ad46-1bec-4aa9-055a-08df43d5e18d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|22082099003|18002099003|11063799006|56012099006|261028144727099003|261026140227099003|261102123227099003|261022075727099003|261022105027099003|261021123027099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	fTo0/uGGkWel7ptGtVnb1PD1CD11AEiJb2ZGkEailwr5iMdWh452fdiKr2YqY3VMhbaxAzVZfD1LZajvHU7SIJ5wuDCyV7vvo3A57smaRShqAxmPEHx00aC5raprVJq/4OaOyloSIQ8nriz59Bcfhb47YjmKMqSTaWhpoZQOTVe2FmSHqiYgAY2y6AquVI36jP1Vk3JHiFYE2pRanT03/cmuO9ddqBdlRshzmmZROIF20+P0ZRhJGefwokYKnoYRATJ93IhwgotbnwSXcrFVBrxpi1W7M1q+GmyT07N9KpCMZQDG6w+mtGATWv64ZAc3uaMBEmhE0ZEb+m5utuNOiITutgpfWCL4isGDOFUY9RdIzROEgZsbGgf45wzgI5s5/jyuB4rxnUmmQcco1zgMmUlDGHS3qJAi2ltkFBtlfPJjIko4cT9xgcuL3xE/avVXbmTCwotBwAldw5kmu5qx6LSd9ov8MAN5CUrfz3EdXedOsTJBLcDz/6bjaflErrGiIk/6uNO2YQj18YbjMOuht8zP9sxhlouu3NZC8p64tjS9QuizE+CaE+NWVQT+lswavDws/yfcJ0nplDJWTPx20+JSQ7AIHZnl7SKLWlMt5pdXpdw/hAcTnUwmQxfJrSc77z1t29mTKB7Gm1dvGQD8bMH0AfSNolN6O9qt9gnjDpNAX8aP9ZIC3ECVbBqXm/CXd9iYew1D+Dt96X882zo8bw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(261028144727099003)(261026140227099003)(261102123227099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	du+lkaPboRkosLZrKE+8KQyyQw3bNHSSc0A65mQD0UXygrRhgvsNTuSdi+h8RFG1zZLIfQJ6YpCGxWgdMftY7Wwlxx10q/5FeHCmG4621Nese3nmQbhIQ9OQArC+p/qWPpkkacfSSNA/IUozlWFtUgp/5vPxe+9EvdXLWNypxpKMg0xjAIu7ZPgmhKhzXlaml6mW18SgkoqF30UHUOUyTBg6Mo9jYOP46d9w+ybQXUNXzQmS8K3Cse1m5bOWMjJd7R+a0mnI3X8BWJw0VVOFTGM8D0G33u3CiNBT74korOKvDE8ewbQH0Kw7UptMNOGOeZpCvLW2EETRmwtMJ3KdkRrceGq9XxAat3wx/fsYDgPunko0t14efZhr8p8+1R8heOn75e4ycJXHQ0pgm6RCoCuUrG16lNTyrv1mziqf+5Ynil8U4CE8YVusfMRc/YPr
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:36:40.0054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a3ad46-1bec-4aa9-055a-08df43d5e18d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA4PR10MB866235

The imx335 reset gpio is connected to the sensor reset via an RC hence
a delay is needed in order to take into account the time needed to
reach the level for which the sensor sees the correct level.
This prevent having imx335 power-on issues due to the fact that the
driver is trying to access to the sensor while the reset hasn't been
yet properly handled.

Fixes: 8df9bff27889 ("arm64: dts: st: enable imx335/csi/dcmipp pipeline on stm32mp257f-ev1")

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 782b4bb843ee..f40ae2293b3e 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -73,6 +73,13 @@ ddr_channel: sdram-channel-0 {
 		io-width = <32>;
 	};
 
+	imx335_reset_delay: imx335-reset-delay {
+		compatible = "gpio-delay";
+		#gpio-cells = <3>;
+		gpio-controller;
+		gpios = <&gpioi 7 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x1 0x0>;
@@ -259,7 +266,7 @@ imx335: camera@1a {
 		avdd-supply = <&scmi_v3v3>;
 		ovdd-supply = <&scmi_v3v3>;
 		dvdd-supply = <&scmi_v3v3>;
-		reset-gpios = <&gpioi 7 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+		reset-gpios = <&imx335_reset_delay 0 1000 1000>;
 
 		port {
 			imx335_ep: endpoint {

-- 
2.34.1

