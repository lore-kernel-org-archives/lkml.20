Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023076.outbound.protection.outlook.com [52.101.127.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D79F3AEF36;
	Sat, 17 Oct 2026 04:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792209661; cv=fail; b=tHDIWd8Nq42ZgsDVhD/qhUvbW+3OhdoC8T1e/8nGqLYiFeT6K2gcJjipB+gUpolzVqP2ndsSRREp5l1IiMf9TLWOjxKqMQ2RHEe4p6PPqH9Z2YO6n++LWHa3Bkqem7oqeq8ctnADsSSOHeJp8fFgAd2jwL4NFJJfhNd8n+xvGR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792209661; c=relaxed/simple;
	bh=2u6DgMSKTHAX49fygbZSOPbkPNlHwm4ALGVISQmqngU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MQPr6y7SPuVViA7/5UbKqbKNR9+herQmcSjqA6ug1rb/SuR+8UabKkyg3GSGnRcq8Wvkwnla44PXV7csoQKiJt9/qzjhX1cpoBpeTxWVZldqkuSlZxAPzs2pR1Z1buV/9ACYYTMFDmAXqfYt/Rr6PjgATl8Lc7xzzH3LjoaUZ7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=khadas.com; spf=pass smtp.mailfrom=khadas.com; arc=fail smtp.client-ip=52.101.127.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=khadas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khadas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMM+h6meJkYB/5dI2Qo++W1QfAkiKO7UaLinfRRuX213ys4RpqqHuYmmsyaCiewDBL21T3C3dqB1KZ2q6yql4JLyoJnXfPTCxFWmPIbXGdPwjTUgwbonaz6IzO25CGwkWJjT8WUbnmIvgEGFPrupN8EUrHqDFuqmQz6VuwS64caON26xB9i6S6WvkzzJ3e7acFIpYAZDvHCNo64JgFh0sHBZz4AanLsvQ+SvYfs0bKFsnDlFYJtEDbgmI2kNUa92DYq/SVBGnpywvYE2RWqmaLxfaBj+q1pUcyDltUocXE6I3jg3WUnT4ox3LJvT44AslZsyO/dFHt7bqpnMEZea0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuCzbGwfzqJh7CbB2ZV6E09uNZxNfhJso8o7caEjKsQ=;
 b=fqpm60cmuggz4ESFY9idr/G1S7FK03jC3VUBGoD9RzZwCyCzBhoh+npB33tIFBi2VIjPo1TQPjVMqQuOAo1QCcoQe3osNnEhoycdVoVU2a+uR9go+uLmYFHaDa6CgYAPxtQ/iRGCGaFv5jf7dB7oomykKUd4708b2GysmCn/TWVZolyQeTAKWNSDTJyJLW+XLhyPxF17Z+89rGCWS7pFyVdSP4EksJ7alQ8V7cP39ib0zd9nVKlB8Ptv9iTFA7zlV2XfaCtSRT+CGywRTZqf2oFaIpYSb+OtGLeeg9vFc2MPF0hVJ+vVUXVRtU9At84YLMgmf4yNmOpgBjPf5vk2yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from KUXPR03MB10477.apcprd03.prod.outlook.com (2603:1096:d10:6e::13)
 by TY1PPFAEA8AB8B7.apcprd03.prod.outlook.com (2603:1096:408::a66) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Sat, 17 Oct
 2026 04:00:55 +0000
Received: from KUXPR03MB10477.apcprd03.prod.outlook.com
 ([fe80::889e:504a:790b:aa74]) by KUXPR03MB10477.apcprd03.prod.outlook.com
 ([fe80::889e:504a:790b:aa74%3]) with mapi id 15.21.0522.016; Sat, 17 Oct 2026
 04:00:55 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	christianshewitt@gmail.com,
	xianwei.zhao@amlogic.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xieqinick@gmail.com
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: Add Khadas VIM 5
Date: Sat, 17 Oct 2026 12:00:37 +0800
Message-Id: <20261017040038.3702428-2-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261017040038.3702428-1-nick@khadas.com>
References: <20261017040038.3702428-1-nick@khadas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0030.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::15) To KUXPR03MB10477.apcprd03.prod.outlook.com
 (2603:1096:d10:6e::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUXPR03MB10477:EE_|TY1PPFAEA8AB8B7:EE_
X-MS-Office365-Filtering-Correlation-Id: b1afb518-60ce-48b4-5b1f-08df2c033e75
X-LD-Processed: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|1800799024|366016|7416014|23010399003|38350700014|56012099006|261009223027099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
 SBq+CRkOG9AC3e/fjY04dGGKuEELhGiqZXZXwOTOAqpshHcMkpgssKoTXGTmt5mPrMorMINqZHE06QOeptAD2xDYRiOIJHhe80/TBLUy6J6fRneQx5Z5GeufFR4xLyle6uequiMFcOZ3MVaZj/5c24fINV4FKp2sOm5bi3ctQIeG4dFqxXfNNHx0dsN1h9npN7OOkHhsSlDRISUcMBMHshpn9LGeIQsY09nW/Nr9Y2kefWsYDFrN5sHsc8x5RwMNH2xo+W2jSBLTHBeYCo+Tc/Lq6IHNzv3Xc/56MovPRK9mrwzUtzQdIawEC6YJo0PYf9nb6Oc+EIlvlwa5vwgHrbrOO8CoRCOpOfcwDiLx9TwRbgjvuCoNKvoedtcGOQGPDTK5OZF+pgHWnFxh0B+08pXnM3xA4RlTKBRvEpkGpAHgs9UpD7VpFBIYlbK7eA1+I+oXRWlXMvd1z9HtrnlMrtHvHtNbcC8hJMum7HmJNgImt+UovkCEVomnC37F/rEQ73qf4xYKQS6sGiCF7OD/UDVHq++iLTBQYQCV52qjmemCKJvvYB5bhBNmIKP3gI4TDvQHj1lDoEmlISP+hsCL5jj/7aOKXwQADV5p83y6upWB5ba44OpNrnC+HLCg8coN9ic1+Mi4hypTFvbYUnMF0sl9pGkq5Upqqb4y9RL4+UAJj4zTlJ983GFDmYgS2SeaL9Qf5MozUOhnR5aibB6WJtf2U72g0IBJOeTq30616Io=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUXPR03MB10477.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(7416014)(23010399003)(38350700014)(56012099006)(261009223027099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?r5mlR9OBxN67ihRZpa5CCD+RCo8qKACEDna9sG3UkkClbGJjSOlTOWUxfx9Q?=
 =?us-ascii?Q?V5+psPEO+o6Ggm5gRzYnWylpiGRuehQLafUGH/dy6o7c5BfAwxBQlEdjhxrf?=
 =?us-ascii?Q?fdORL73XI3SXCb4K2SeNJojfOk19RbE2UnuVb4oxeLCD168fkFMbc763QsBX?=
 =?us-ascii?Q?zQQzBD45kwuMmNsBf57c3yVuB6g7q5P8Fyc2NfsM/jLnU/Lk9pTD9ZlF5pIb?=
 =?us-ascii?Q?kUnb8ifTCcPGp4ORhgulHzaHr6qe7h4rd4ZjEShYEqvLam6rRVAAjkVWZ+gU?=
 =?us-ascii?Q?gFssz50OJxL9SWVNYJ0P0T8zPWzdbTP6q7zPQwOuuESDiRTrJry/EjZQ4tNE?=
 =?us-ascii?Q?NMLpgxXTWNtTpDr+8p+bIad+xjdEiTqQxfKn2Rn+fdMW2zBNfBavvG/VcHyp?=
 =?us-ascii?Q?xUs55NwpHKwH/Zl4oxxLh0l39l2cxfWfuQwqMplrSQ6o98H9L1IOyUzSpo+g?=
 =?us-ascii?Q?mn96z/UzKv+GLrGXwuyIod+NxiHOI1IAAMJkgR+pyQHTZGrwQ0DXWFOwug5F?=
 =?us-ascii?Q?UTYCAGR6CGsW0LDHCr/+ajRnZe4+sHM76Na+cyMpdNetP8gu2LuK2WS6T1/G?=
 =?us-ascii?Q?/oPqQeY+7zK5Zmz1uS3F42cpx9v9O/XvwgqIgvvInjBh9orQIImKGINJCqSF?=
 =?us-ascii?Q?STc6vCcrPvQTGQ+1rIvX4HK39Z5AnVnN0FwygwONPdhgy0WoIVO9nBuW7e63?=
 =?us-ascii?Q?jYa1ssEixRG3y6wcWlYZ+uAhXePjZAxc6nWsBqIRyRTfAnYzOXBKVYXnxSmo?=
 =?us-ascii?Q?FYNKI0r8BWJ6SpnRw5TN/Oxl3GNyBGQGqaKTMMN5/j1ztu0F8MY2ew7CSuII?=
 =?us-ascii?Q?nUkt5eNknjGBLdgBC5MXS/fdYKwOSGHe37n0sMra4wpmqkbOaE7mEhMzZCeT?=
 =?us-ascii?Q?qGUfCkKc90byncv6vUnyHBDFJ/QL5wBHBED1FsjgjSHFqUxW8EvT0nhk/cZu?=
 =?us-ascii?Q?4S9xXrSNEC4Ck7WbQkGgg/ga6bxvD7kED7ySBPft5hQKoDFmtorCwESbLqS5?=
 =?us-ascii?Q?EnKknLD4dUCpLVV0dB46CQwoQM8yvGQ1S+D3ObdHIKO3iTjiz0gzu12x0gwK?=
 =?us-ascii?Q?WDkr4z8A+a/+na+zbFXYQVKc91bEre+40zb7UT8Y1TrKQZFkLe7jJlzABHnB?=
 =?us-ascii?Q?uIc2uCPCa0SG+g5h0ko83/+rvepnpZ1yhj0L3lsXG/Ot1oF8kU1O+tebygQT?=
 =?us-ascii?Q?VFinLBH94HDLmzFgKUS4HK+nyMGoq9KA7v/dHCmigytSGXeww7PUkW0tfBsh?=
 =?us-ascii?Q?5tAVU8HA2WM02BCHF2FQF+8OcGPN6mt9LYdiaMHjG9en58DFeGt0HyWarboI?=
 =?us-ascii?Q?qlDbS5VaK8T2UQbSL9Maa7XLMRtdgsu2SRBhAE+NF5bbO8Tr7p2lxxuSrDTH?=
 =?us-ascii?Q?wbSeWf/qapqdgms7T96JZ2A/ooRTYbVx2IGutiT6vo4NRJ0fxitGm9aTlT9I?=
 =?us-ascii?Q?2VUnS5Qoo36tbpxV+CEfuiJAF/G5qcO2vHFAK8Smieb4vsJSJCUMd3wx3kmc?=
 =?us-ascii?Q?JbY07Qs8YxI2zIZ4kVhofb3Z67sa2MjwcwNevnogJZp1FE18OWXilAtVcdap?=
 =?us-ascii?Q?f+NpZMCPg0z3IaqL/oE2FcA0RKA3R9IYMaZ5NWgB7vNodNK41smLc9kTryO4?=
 =?us-ascii?Q?NJQBRzz+THEZUlI6AHFJi9SxSu5reJDtwoL7vLWY6m0Qm5+Mz218b/rMnMYB?=
 =?us-ascii?Q?iXoxt4ZqqSsB+zkCz9zKgHOZUIfoml0o2aqd50TD0HNGzK0X?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1afb518-60ce-48b4-5b1f-08df2c033e75
X-MS-Exchange-CrossTenant-AuthSource: KUXPR03MB10477.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 04:00:55.6138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +l+zlXUWg3JfdbzDi2Z3s/LNTx9+6KMXQtQfRSLsK020Gu1xGvO/Oza+YLshc9fa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPFAEA8AB8B7

The Khadas VIM 5 is a board based on the Amlogic A311Y3 SoC.
Document its board compatible.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 9f73a0054fb21..e2b258ae8a4c6 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -238,6 +238,7 @@ properties:
         items:
           - enum:
               - amlogic,by401
+              - khadas,vim-5
           - const: amlogic,a9
 
       - description: Boards with the Amlogic C3 C302X/C308L SoC
-- 
2.34.1

