Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012057.outbound.protection.outlook.com [40.93.195.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9AA21ADC7;
	Fri, 25 Sep 2026 04:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790309755; cv=fail; b=daJV6xWexf6VN4hamaOG+lY5S5k1lZAFhoaYYD/OH8n9LLZymLuobsmcHYt1nKr7S5TjtTs+ld/P7DqiPnozSoJSfpu/MltM0JrQ4hpG7OARVT554fJZES+dt+d1nOLP/dH3ZeH7SDJP8hc1S6mXKU74HJv4IK8nS7yZL9TZS3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790309755; c=relaxed/simple;
	bh=DVlh2BMXLxPBvJ2+i8dh/TTOBI0B174W1x04ngty3jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tt5R0E4DgjtyKKCIvyBq2oh8at+vbpD/qw47FFIKIFJTEfslETHiLjV1Gjfbj89wrJpMsyFnoFE2DFVTrv3tPyt4RLsZgt46AVSR2f0XXRuctgH68J64/kLCeelMKPgbYYj5hBKTAIc16Nt+m1xQjuGUXmEXtrtdOIQTD/vvY14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Ic9wy2yM; arc=fail smtp.client-ip=40.93.195.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Ic9wy2yM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFizIvO/CZxeVEagH12LvRhr7NVBwHznMDU7Vd+VRN+/IyvhBNlkKR5dJzYROtg7ShIuabEtWH+PyxVlCedjZRIwrhxr/4qBk0fk09Q7ho1sjSvUizkAJ+e3Yoo5gJC6M1fbl4ZcNciXn4XvtE3wL5jKzJVJwRFj38QWKXz8lehkbQ94nr1tI27hCKs467IOD2VYnohtOuW5K4dHhf65/K8LdlX26iuWa2ONkmyBUl0DNCy9WCivy/PbwFLGhJbJ7MfreKEWy/FA5FwMb8fwKbepv17pmCaNf8+9n8t9CjFbnQ+4mHKaa4rEhQoMyJ+0PcFg4vPBxDLNL5uJm0t3+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3niXe+uSC0vOdB9FCrS1Rc3rq+UiyXEiJOvAXJvgucI=;
 b=D757CpuepmMOqEfPmV5xZ+9MPdw/bFIyRvuiHpFUBO5sJIttNJ4cJ6uU6j9f6nbokFyNBUPH+8tDUtw0SqmEuMKFs0yVveoIUW1lXL4Ypipbd2xSIow2PFs79eRUJ8S40nXx8w1TuGCeAxqfp8ofU+ksBXEx3N4EK5VMjfQj9IvRnCFWuZNl+WDSh8dQVtuY0UAnF2RKHjjH1zdEcS0cBzyyalMxLe7yrXdbQ7jDA7VRrFBbRD7rgw2KuEaRC3Hapd1gNdzWTOcoathSp1TCE3879wd7LWvmJAM52Vib9rFQ/ageZrKwv2JL74UCGWKd0MRI7hSafM4PWVP186fZfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3niXe+uSC0vOdB9FCrS1Rc3rq+UiyXEiJOvAXJvgucI=;
 b=Ic9wy2yM9V2iIUL4Hl0OzFhBatQQCEi7b4loE5QNUQCZGVVssBvyC+deFwqCZxrRoVGhe21MQJuVYLiu/rUZuOU11+7/LERAXYCQr8fTKYQWM9mdhnepS+kcd1+qT5LhbrFY0irs2p/05Cjyvoc/HtNE8YhOs/KKNibpTMjgZlq1YceHO51DGwpIn29pukrKkofHxCwslgaSALRKhiCyGEHh4rYYmuLhsJf2mLYfEz6nOAZhObpQvAEoJId7yWdoXaUkl3T6ITRGtKyYljRbLFGw59onJpK2U9D9M5Hky0XlcJ9orB92a/fNPyJ+QEwLZxp7C5YxJTHQOEhC5EeSQQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
 by PH8PR03MB989672.namprd03.prod.outlook.com (2603:10b6:510:409::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 04:15:51 +0000
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80]) by SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80%3]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 04:15:50 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Eggers <ceggers@arri.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v3 1/2] dt-bindings: eeprom: at25: add Microchip 25AA128
Date: Fri, 25 Sep 2026 12:15:36 +0800
Message-ID: <3f2d6a2b5a55.1790308304.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1790308304.git.adrian.ho.yin.ng@altera.com>
References: <cover.1790308304.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0001.apcprd06.prod.outlook.com
 (2603:1096:4:186::21) To SJ0PR03MB6581.namprd03.prod.outlook.com
 (2603:10b6:a03:393::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6581:EE_|PH8PR03MB989672:EE_
X-MS-Office365-Filtering-Correlation-Id: bf1e07a2-73b4-4755-3add-08df1abbaef5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|11063799006|56012099006|55112099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tTgQD+RjIQALnLBcuK9T6OIMvI7ljB1DslkpT+ikbpWH+ZQeWbqsw77TKq5Bxb2wHJMWNzm0EBInQizbQstHEcLusg9NJ0V09tkxgjLf6U3bDwGP+aNd8WRNwxfKxcI7VUSRP3LYNjuAUnHTFU9QZlfv7PQ/KfFqz5IXRw1Xj6fB8NugW4/JTRq4BLM04pqgROpEqqzJxS75xkbR1l59hhLIwu4K8+mKNqhCw8fH31nwul+se11chCSftDoTZPwSiEfERKhh4u0v1FbZNci0lOjd6EoGxfZWlvi2uEWWhRg2GXZgWtQZwAPFN6zDXPEMt+4s8+n7Oj/4IQyqShDmI03ZvRdTC1nACxZdvLCz7ifPjCy0lsW8wHy7H7ENvG0IraIrIa/2UK7MWa0PfCKNMCumIO2945vypU6we3Kz3oLLDeclACevyyXvRVAa/rQsYuva0W89qn6SYDV2Sxe3sd8ogpCx2H3SNuj/uM/ZdJtIflWLhz8tOeQwpb6AtM8G7il8ZjZ2XkB45naiMS3gBE5HERNXZHS/fr7j666fQ7jM9FVnox9UX/EVxHRFlwrCwr46xWBYIxeX2en5aT5RWOnKV9e9HHECELsXZAQAMTn6wQXhDNQhsSHAwMEog0zLcd/mvY89EXpFKx5XD1W5rzDiKgiO8q3Kb1dqKQSUvyg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6581.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vLdEdmKst3X4XdpDCf85y6+RJJt3cKylgjpL0NOn0CtVYGMAIo7mWodRr0/u?=
 =?us-ascii?Q?O+xeGw4WediJfAo7eB8nubaPh5UpmY159TaCzMph7DLHH6F/yVd28R+OHZuk?=
 =?us-ascii?Q?DCScMExNaTIOZVa4cyCfgNskX8x8sEQdIX6UxVS1dSBDQcw9HnDoKoHRwdqw?=
 =?us-ascii?Q?sOD7CPOInf07CecrwbufODvfGD+S5PRzFdebWpQQveDvlvQIqISjdCqWB4ca?=
 =?us-ascii?Q?fQeQ7Qo5/rKrwicqpPH2svxqtv6r0w4SDmnz3XqoYdHgU1tas+MjqKfWcaHd?=
 =?us-ascii?Q?FDoNsRt7Jm97ffftmn/FIrVDZ8H/YmrlpOCv9lx/1546LFwfHaVwp3Ic+fMI?=
 =?us-ascii?Q?DF3TcDGRMRALBJhnbzpZQ6NbVCPSRdbZkb+rrNhS7oUS6ieWVTXX53X+XZu4?=
 =?us-ascii?Q?Ny87C7zrv9DpNmROB0z9wqssjDkQsoYFEoORKPsF4JNf1wi57ha+3Akws2Qa?=
 =?us-ascii?Q?vH3eqNJIzCO7bq2ShAyK+Q86Wo4joJgiNkJ4mqZXrU3hGsh5Jr7/8NFaW6rh?=
 =?us-ascii?Q?O+R/sVeGL8EQ9i+rEWsBxH14XEatziD+2OA1mPtDcWoU+HpqqGa+2w04a4ON?=
 =?us-ascii?Q?dn2vwc63N1Jq0MikCBB0r/D3ZY/14P0XGkAv05rffB5H/2qfTL35vBC81lhh?=
 =?us-ascii?Q?7iTCbuI1HeNEh4vSJLa1KqQRXWJna1+n+NPSnq3ekPvml/SjGDpY7JERceh9?=
 =?us-ascii?Q?Zt/1cGJNuLAQc8DV4NAGS2MyyXZO4OOSzmtF0zL2Y3l+w40OBldMmGhEN/av?=
 =?us-ascii?Q?/SyFbTEysDChUNG62vwkq8rApOpR4iSXk+6YsAX+OpkQP4NA0yUF6qhs5MVN?=
 =?us-ascii?Q?MNB+qA/3xaYGy97gIekfvP1ATT2WTCr3I7ReXfB69ptbTcWt9oCibPqyUpiL?=
 =?us-ascii?Q?iHJv5wp11NraSjE0DOJ4F8SjabccRtd2kOrzbEzUgFmV/NsE7FMKUQYimSH9?=
 =?us-ascii?Q?3/hawBImyBNYJvOWA94Sq3wSpV3ANZHyf62ACo5f6rjSJXf8BH98kmw3WbiW?=
 =?us-ascii?Q?XMhIdH9U5tCf/hl6W8UrwqvA9f40/38P9Ex/nxfjBx8ropILcQu57oFmjxNC?=
 =?us-ascii?Q?8765FpfXh9spEfUGerBO1prbz4FaMLR5fh1puCWFujWsBv8P6Ug1MbMA3EtO?=
 =?us-ascii?Q?Bonb2lTC50QvCiIu3a7kcJSykQdmKZ5OlvTrkekNabwLkDhzxFyMvXSF5No7?=
 =?us-ascii?Q?9srZIXb5VPkJB/MQTSk9Pptpnk1mYCgaYY4u3WncokS9ayNd8UrIk49IQuIO?=
 =?us-ascii?Q?EuvqdHaMbUq9I4U4y3DjA6JiOM2AcPpZ7L8qNTh4cMTbmwqeeQNbI6Ki4riO?=
 =?us-ascii?Q?8THU5jYn/QSjwd5JZ/UCv30Ri4bH27XOurgOtBdP+SlUuMRYJEdl31sHfmQY?=
 =?us-ascii?Q?hGUhUpzXI1NzqPTNP5HvmVZXK/u0NVfxMf45YtW0vOX/5NnP+VX+Fwv5wMKF?=
 =?us-ascii?Q?LC+SNVF74R9K3u022G3FJlT3VfuErx/44Ab9sehppT1OUhZvFLpBucX/SFJ8?=
 =?us-ascii?Q?PjE0AaVYIZx/waf6BGVLcFIYIOxhxlfpkb7oBUeB1IUPWchpU5aDcYm4J5Zv?=
 =?us-ascii?Q?Ga4jT6/fG0y9obPZEhQnCh8oNoL+QZzIgQsSj6LWFLwtva35BdUADd0udadT?=
 =?us-ascii?Q?POtM7QVZeK/IJErCu9+QK71RkX/BlLc3rRayDP5mgA/xGRk4RXjU8tu3Umc3?=
 =?us-ascii?Q?i5FADU8PkEQRabqv2DMRLxl12usfHi0MdgEStuiNEImlJTCdFToegZJjxD6g?=
 =?us-ascii?Q?0i2Dp44mOcmkeN0g8HK+nXwsEEz6jXM=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1e07a2-73b4-4755-3add-08df1abbaef5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6581.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 04:15:50.9396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NAMDl282YoH41r4Ci0dfydK4zBp8NKkd1F/NG6o9EvL7jyNi84Plhbjv3t+uc8a/ZdBCSdtjT9DfoxYngaOe8ToO1H2WuZpMHisKBBqYSTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB989672

Add the vendor-specific compatible for the Microchip 25AA128 SPI EEPROM.
New device trees should pair it with "atmel,at25" rather than using the
bare "atmel,at25" fallback alone.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 Documentation/devicetree/bindings/eeprom/at25.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at25.yaml b/Documentation/devicetree/bindings/eeprom/at25.yaml
index bb78e12b8823..dda69e4d62bf 100644
--- a/Documentation/devicetree/bindings/eeprom/at25.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at25.yaml
@@ -32,6 +32,7 @@ properties:
               - fujitsu,mb85rs256
               - fujitsu,mb85rs64
               - microchip,25aa010a
+              - microchip,25aa128
               - microchip,at25160bn
               - microchip,25lc040
               - st,m95m02
-- 
2.49.GIT

