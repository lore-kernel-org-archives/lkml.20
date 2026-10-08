Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazolkn19011057.outbound.protection.outlook.com [52.103.72.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E175481A91;
	Thu,  8 Oct 2026 22:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498901; cv=fail; b=psJJCMtcohq9Yx/un7oc0SpixW5XppzZ3Rll+0kHVltt2lOIzxooNNmnBELkVMoEKMZeyz+fBqpQKr+gpiHPlXSd2Pn0X4Ef2HA+SellSJTfzyAVjSTyIN9d/gTKeQjr9BvU8e/WtgIpxJvyjEumlcbKusbox/atzCmEaz4tyco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498901; c=relaxed/simple;
	bh=ylB0uq43dJS2iwp3a6010Scr5p34WhY6QG0hz0NT6Aw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kPYY1TrR4T/LtKL4+SI2eem59YNWjKNw2lGw35TOT/q09+Zn+S3qfhsqGYlEWp6DRpEUdH0UHGNeaHFz6Qv11IquNBRX7Be/zABR2FckiB3y1wXXD88jyrWjSFYCi34PhNcBh9BVqCtYL5psb//7MFiUD5IGYqbbXuDWq+AJveY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=WrnxyfDd; arc=fail smtp.client-ip=52.103.72.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="WrnxyfDd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxRb09sD35+B3dQOMNON32v9zMRDYIKryicovh6GnpFcnoJ7d+OBK2ob+H0HPh6XuL7ziFBn4dpCFbOkWw/fn1xJzvNiZtYRa+4q5Gyu1JgVFigi73GvA1//yQNfJ1dwXPRJaKDU8JvarIWlyC4E2HjRXt9FmByrUgoAso1Dbg+jbconXp09gBb1XxNN0MgXCHb0r/QZd9Csh2Bdu4lLZ1WwynqGJ/xpK1LalZxXa+CLb5S17GBohU17DOi7zxczKt9SGamgbYVB5eCXlTbvhJ5aA9CSS6B0LT/Rhk6xVjy+Z4sDbG38nYqeX+z95hl5bCRtCiwmdI0O+WFEg/O6Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VUfjFI2qBYzPMjJHderR9tudc+tGmZs3+WAhFwyDQs8=;
 b=QtvWKbc2oA/t2wCh9K/fVOJE5Yhfw8jN3PaFkJ5uGsAiMGq6iSzLCKrMDiusgqiHa+dnPkq03/3fYPdrkPhoZMigmf9Ubxbou5v37DSYlre1VxBV23SfpHgpnf2XGUvsY1Mbrz5CUYevCzcStFg94kxUdMem87GDBAcDj1iSNnPBWqooOvj9V0XTebdpwn/44cyfB6OJMHDC7Z7lWdxtmhVxvpehakARPEjoTeMRDN7Zw1WcAUJntLMtZf1KHiP/OA6M0e16iM/7TBfNmNaqyTXgY1syiW0Vni7P4bspPwDd3PVVc06yv4ARxZa9Erf4tzRGoCW4bkD9f8E2ZB2Tbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUfjFI2qBYzPMjJHderR9tudc+tGmZs3+WAhFwyDQs8=;
 b=WrnxyfDdE6Qf8c/juSf0oyNqSNbbeKbVFJAhPkuIkI5IQUEvKqsAVVpTnXtzr7TlwZLr6KtQwK0t3XncmSUjt1vDz6/YYzXpfrbglLVClf1HAcMsBrve8mYhRY20a5+guDymglw8lh0Nx4C4h1tsH3WBc3Romj9z7VOi0hHmzI5C6PZnh5P+tI2Xecnj5tQH/OmDERytZYhK71P6Gd4H/Zq6sdNM5WCbD9bbgIr0R5iSWhcfm36hMd5a6gXiAnbUO7LjwCoFcEiabToFRfB9FPK9OiV2hRhRpU99sB0+SKFRJyUSWmg52L3EKNuqM4G3K1k7hkPTMbLSWJ8858nZlg==
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com (2603:10c6:10:32c::14)
 by SY3PPF346C5784E.ausprd01.prod.outlook.com (2603:10c6:18::40d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Thu, 8 Oct 2026
 22:34:49 +0000
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19]) by SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19%3]) with mapi id 15.21.0522.002; Thu, 8 Oct 2026
 22:34:48 +0000
From: Zhang Jiaxi <Z1529105815@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 1/2] dt-bindings: arm: qcom: Add Xiaomi Warsaw
Thread-Topic: [RFC PATCH 1/2] dt-bindings: arm: qcom: Add Xiaomi Warsaw
Thread-Index: AQHdV3U5v8zIaufGrEa+o9BQ6AFskQ==
Date: Thu, 8 Oct 2026 22:34:48 +0000
Message-ID:
 <SY5PR01MB10600378C49163D9D9C5945E5A1932@SY5PR01MB10600.ausprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY5PR01MB10600:EE_|SY3PPF346C5784E:EE_
x-ms-office365-filtering-correlation-id: 40715e90-12d0-45ee-3d45-08df258c5c2c
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599012|19110799012|4140399003|31061999003|8060799015|25010399006|25031999004|15080799012|38102599003|24021099003|16051099003|102099032|2607281247196008|440099028|26104999009|3412199025|40105399003|52005399003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?jOcN/rcaaf9UXd0G+Dt17/SF2cPHq1PRrR4Qe4MUIbTxKPSbkuZNSAGX6tai?=
 =?us-ascii?Q?nPtEH+hrazj9LP0IuLvMmpXGMj8zjdnpfN1nY8ZhPOqfYjUATFJzEzpYR6v4?=
 =?us-ascii?Q?UNayy1rJURV11JyohZTpZEG5TQ29JQNKR1CYNhVR5+Vo/292KSqM8Qa0xjfK?=
 =?us-ascii?Q?BrH226Ik9TZvw+W6YvXrpd12T0QVdAqpDJklj/0nLW9UbM+TSGrozdNlMUrJ?=
 =?us-ascii?Q?C2JH61ZzGwtPB2jbCU2fNOGcSH2BBj607vr8AUvXHWqScKcVwLFss0Hc1EDq?=
 =?us-ascii?Q?uf7k0Bzp/07ZmUzhgfWVg7JGf2RzmWWyyRD11YJaFxws5hP6Wr4xYeawn7eb?=
 =?us-ascii?Q?7KZ9tj4RhxxyuJ8C33BoRHrJHI48rqAcX+bXjwp489+ORGrlXDJsyTiSxB0d?=
 =?us-ascii?Q?pRUEyTDxe7TIQEMcRvouX9mgc+BhPQmX3Ti4cehyil6/GyG/Z+B1P6kXjtNk?=
 =?us-ascii?Q?LK4dBnxXys8EwRTQbkyfgGq7JzW5snETq12XShW3rQjdMa6/n34VF0BJsGCr?=
 =?us-ascii?Q?RBMp5R6Ibr1jGsGiUIEfuY83OPZmt/gt/IlDy7yrcbe9SDbFXToibVZA7yUC?=
 =?us-ascii?Q?LmuZyxOuBixmEcsKQCYmPVhvVjZPejNfx77bU0DjQaxvsAZhXGUt2gDQ2mtg?=
 =?us-ascii?Q?tJz6wFLP6Huvz2JMyyeHdQ8Fd4nX8pMZJTAC22n5upM+D2U9ArQhuhJ6FxUm?=
 =?us-ascii?Q?jiSuk+vQFHm+7XQOLtKdZ/r/OAHesa8qQ2i7FCfDvaEbFH1k9vXW0WU3Lzm3?=
 =?us-ascii?Q?HlVx7E5nVR82FPTXKNZdDlaL5mMQ+w3pvFjJk0EDEBOHKvIsuk0fQsOpdUw9?=
 =?us-ascii?Q?6KR6xGMRxx5EfFJN5EMArsl/AK+HZo7MXu8xJ3sUOk2pY+8+Tx7y29R+r6jL?=
 =?us-ascii?Q?ySqUugJVe12nUH4fP/3q8iC475AybtEMS+Y/hmNhdrsqFJhf1oR5kc6gALgT?=
 =?us-ascii?Q?fe1yOPna/vbefgBojFfjeEp1AJlwmEy2N5mEPcHK6XGv7aW3Fpd0VWyHx/Ss?=
 =?us-ascii?Q?/xoFKJsi4tF8FNfQpDftZ+12wX0UGE3z/EwVBxXFJPXF4dM=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TyOw8zMD8HNz2ei5lcl0IafZE/z7PvxpGsbMXNabdyNQ1lROZKivtLOFrHhz?=
 =?us-ascii?Q?iEreWBn0he8URNNfiqKTBGyotGZOCt0j59FaVUBjTTLt0DBm8I160W9Y8Qkp?=
 =?us-ascii?Q?WEbcdPYEVWgIFsw7W5/w7PItii7c4zA+k74VyQZjfgOvqFiy6pfXijNyPG1V?=
 =?us-ascii?Q?2tdN/lOgYWSoowI6K9yCw6hYGeYgIWpklMqo1nCWdsNT4mpwUVu3mOBvzUuM?=
 =?us-ascii?Q?tq6Tm35I/55DUvBSuWPgnMVsVit1BFPBkHl9ZmKQNRsIBi/ydZK34Xbj34Cv?=
 =?us-ascii?Q?pmUT1jPJbB4Y1M6IIRVS5Uei1D8MwZxz/36AYI9TF3YQm7tqNPO8uFT1BixJ?=
 =?us-ascii?Q?epruU/T2Jvt1tQhJfhoDFpC2r0Ai77A/0N+Ds7Jey/4WKPtII6sP9SnNGYZy?=
 =?us-ascii?Q?0ibmQAUk4I3un5PLi+zApvCGDW65EFmwJRevl3HHp0PxmIkSu9oan0nqHC02?=
 =?us-ascii?Q?Dfp4aCeYe+WaWpyVgVoYWCgba+5/g3JtMas0wKbv9qxj869hEBWxYkLfzQTB?=
 =?us-ascii?Q?CPTNBLsSZPCXyv52r73v7Vhz52XcDb8aNOOrPOdB/V40m7X9DijuJLCxz7iS?=
 =?us-ascii?Q?TYSBjBVAcQNPH6/raIE0Z49P5G9qq64TiYyt+DnarFqGOjztSPjLAc+bngDh?=
 =?us-ascii?Q?ztgOSp1Z/x+QkcIQhB8irCGrCEJp/C7UqVIKNO5VQgvIvKK7L4jor4S/r/xI?=
 =?us-ascii?Q?lS/wMNpgVkb7k4xblIcPE14qfBsk3SM56a6I48gPAFhAH2iRoFb3yLSMyEri?=
 =?us-ascii?Q?v814Z0QRbDitNDpYFwoEVfA9LkPl6ModOMnvZQxjVbKstUj8NOWqhGOrHlkw?=
 =?us-ascii?Q?SqxYCFIQyxUnIAOGxraMFgY9FMFH5d5/yHPbCAKdCTj5HbQqeY2uJwFwjRQ3?=
 =?us-ascii?Q?U0NrqFR3jzdRj+2fpvVNuwfmZmIDw2HOD5y7oOIlIq66OBqqRASMQg4o2SDO?=
 =?us-ascii?Q?9PtvRtXxOiIDLNmNxlA/WTnB5prnKAa5kFSopWEa1sYiXpoCv962IxN9SPG2?=
 =?us-ascii?Q?mits+CQ3hpiMVd9NmRH/e+g1ptHT16CCS7vAJkf2IPgsCeoX2dQVhlsvZrfv?=
 =?us-ascii?Q?wIi6Nf7OTV9buOVAMinUzY+lE61S8JXE2Y6UTaKu9Vav5FsQ1UYCaW/snuax?=
 =?us-ascii?Q?ZI+CTXSU3JrI+GCjABRgy89bqs5yCZUrGjE7jpCwB2o+tOkCrmTiFv2TibtS?=
 =?us-ascii?Q?L5JGH1PLX44HSzQ4XQTmGISb7Fn0uGSkATBZzZK+dqry16UPcWIYY4IHS3RB?=
 =?us-ascii?Q?4/y055vr9vS2mCEUVVg/xriFh7/ZbZMLaInE+LOiXsYUXlBspcZDSTacrkqU?=
 =?us-ascii?Q?/ktInC8zlxJkqkvAA1qH9aUQ5raqGyDi/toY92jZV51ERC4pKESqSlUAbomZ?=
 =?us-ascii?Q?Tl6pkuD0sMeuhmnukcKJRdNs6jCb?=
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
X-MS-Exchange-CrossTenant-AuthSource: SY5PR01MB10600.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 40715e90-12d0-45ee-3d45-08df258c5c2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 22:34:48.0578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY3PPF346C5784E

From: Jiaxi Zhang <z1529105815@outlook.com>=0A=
=0A=
Document the Xiaomi Warsaw SM8750 board compatible used by the=0A=
existing downstream board description. This establishes the compatible=0A=
identifier; it does not describe bootloader memory fixups or certify=0A=
that the minimal board draft has been boot-tested.=0A=
=0A=
Signed-off-by: Jiaxi Zhang <z1529105815@outlook.com>=0A=
=0A=
---=0A=
=0A=
diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentatio=
n/devicetree/bindings/arm/qcom.yaml=0A=
--- a/Documentation/devicetree/bindings/arm/qcom.yaml=0A=
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml=0A=
@@ -1170,6 +1170,7 @@=0A=
           - enum:=0A=
               - qcom,sm8750-mtp=0A=
               - qcom,sm8750-qrd=0A=
+              - xiaomi,warsaw=0A=
           - const: qcom,sm8750=0A=
 =0A=
       - items:=0A=
