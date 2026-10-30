Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.32.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793351848;
	b=vd66qdyCzy/M+IYPFaODt/3FY+iCBhj8dgfWqjSd0eMzV07j/k4WQiDqkrNoFTGB+GeR
	 n9ELy6D8npHO0heGHJWsB/Vqp6TZhoE2u9g50TbRZbSlB4AuXbDhJoU2bzw1b9abtaljk
	 2NNgA0ZafajIxw3h9zeRgOZpGUNXkFz0uaJNKyzu19w2swLAXuxAL7oKthuHpKsiKMzN6
	 36jpvbAXcZZEh9fItttRpnEnDww/L6AJb1H9MxboFOV0HE3xnXYGGyXYO2NZf19cw05H9
	 3poBnwA/uDFuGcfHFGBt3LvHtqdfYuBTlSazXEZ/YpJnVCvFXRlP2/BkWSu0ZuhjxOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351848;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=7fHWV7ldncawd9c0kbI+KAzZqXMDST2/nuZ1qT2y2wo=;
	b=4sFKPo9V5ABR1Fufy9Qh+MhVajVb2WM6pgSb3fE8U7bJHmKRwOSE90usg3JE3tOx4/sd
	 BPmpLeyriZyblcV4KVk2daUnD0tVUhN9jSG7djvTecoTrmtzHOcjKKBTUKjapkFoAnERq
	 W34GZsTbPTqekCwbWMacF2FsvxBY42xuPsI0JUMjOw4dMIsGXHiRxe3+Powk93Syk0UrW
	 cjUOgSUbwY1d/9/+rgj0HYNp5m83yNMdZoM7LJExyfWPPiGJW9bcIRDl0N6dCGVHCsiBW
	 S5fOy2LjgOxkxx3u7LVuEPKSa/4PEkvP/P9j0w38d26j23Rh3pbhDWzUecsktx8N7bA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b="b+SG/Y+L";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.32.14
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazolkn19012014.outbound.protection.outlook.com [52.103.32.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ED9606A31A;
	Fri, 30 Oct 2026 09:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1ED9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=b+SG/Y+L
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3rHuwJhtmO9Wj5wvdVY3R8/dcCc9F9Jet0ywQQ0A5slh+dU8mftI8v6oJCjlfrTnxjdFB25T3lmf99URcn4pigRAyzFHsYVJbSAZzK6fpkqGeQoj1U9mtVbMl1d/7UmjeOJ8fJDFHOPNIvV/2BwaYx/QHkSxaY9EA/HgLQoiMuzcMDkEYjE//EQNYNbnHvD2ntk/b9O7z8TNw0z1EkraVJUpp7PEhCTCHPDbCdgskhUN8FDad6vif9saMqNdFrlmcCrmLBHk5vrECUfq/1uQ54sr0GZWb7nCwgK7lNaAJ64fGEW9YCH0sFiQhF1TM6dERk4Hqv/SdxsRbOHdADByg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fHWV7ldncawd9c0kbI+KAzZqXMDST2/nuZ1qT2y2wo=;
 b=VIC96AbcLu/eSXCmNU0CwzzF0B+YQ6lo8kLlpTQAfwuYhQI7dHXCF2AOL0ItdipR44ZzyOdEIMpkdwKwnOugD980DcAyDAn3+E/6825nVVjKQBVUmLIzpgmdgngu8X9SuO9OpIHtzhFOavwj0SIpcz/aUnm4RtuYtLFN7ry4v18nDGexoVbAcxcrJ3Tslig2ogj1O9NhJroe5bA+k1ag072dl92/fZ3L9L/SPQSHRK02PBBhR0lAZBxmfmOX5NheRukedelH9O47mBk/KGUwUrKqmO8azgx5sLJKvLFtS0h1EM8mQ9WaokwM68O3zOt5NMJ/uqtWmuRPfIEO0nmg6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fHWV7ldncawd9c0kbI+KAzZqXMDST2/nuZ1qT2y2wo=;
 b=b+SG/Y+Lx1puqUTo/9Fweoqvcul0wp+zJi2GDzqtnEDg9Rxv0W2mI5xL1maWKgtn2qocmH1ZDNVXndlvsoc7tC5Ji1txcOIL4BbYN3lgnItUBaGq4JD+qW809ldzPMLbBztjmE66hY0RJYfWjrTQV/N/rlTYov+5LmI13iiarkCObyev+NarrF590uxfVQTS+t3Mot33IDcU8ZMCOWki5o6ZwiQFyuMZgHEamObJQwgiU8CkgUxuOKxveQHSiizTtTqDzcn2VVtvqjyN9oHckr3/uWbenDuCNeiz8RsRqAindSQFc+v/l1CrJ2CTC2AQdTfBKDwztXdeagqDGwtnSQ==
Received: from MRVP191MB2786.EURP191.PROD.OUTLOOK.COM (2603:10a6:501:5a::13)
 by AMBP191MB2773.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:6bc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 09:17:24 +0000
Received: from MRVP191MB2786.EURP191.PROD.OUTLOOK.COM
 ([fe80::5bfc:1039:b3d9:e202]) by MRVP191MB2786.EURP191.PROD.OUTLOOK.COM
 ([fe80::5bfc:1039:b3d9:e202%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 09:17:23 +0000
From: amine-ayaou@hotmail.com
To: nkapron@google.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amine Ayaou <amine-ayaou@hotmail.com>
Subject: [PATCH] usb: gadget: legacy: ether: fix RNDIS for Windows hosts
Date: Fri, 30 Oct 2026 10:17:06 +0100
Message-ID:
 <MRVP191MB2786AD66C3EAB9F32E5B84F9EF6D2@MRVP191MB2786.EURP191.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0137.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::21) To MRVP191MB2786.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:501:5a::13)
X-Microsoft-Original-Message-ID:
 <20261030091712.1518415-1-amine-ayaou@hotmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRVP191MB2786:EE_|AMBP191MB2773:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ab55e78-2b76-4aef-c1d4-08df36669b65
X-MS-Exchange-SLBlob-MailProps:
	9IecXKUgicApcBHgIkF1u3SRiU/lhwt0ZR7y1Vs7u+aWBwJDDnKHtA6cuVHazrcMJA8U3BLABRq9PGFwBH4m8qCgz4tddW/S7LBmidVOtuA++W+05VRj7H61jd6dRQqhhmkTr1I+XuKca6bj/9U4O/X2OQ56i9tNn/GmQQ1/5Rgp9lVLkz02hTTmAG0r/GqTqDSI1UVy/lhkW4hzQSL49qBs+1l9bBl7B3nSfPCd0wl8EiovkzWBlX+6kdC/N14NjzJS1TE2w9l9VOh2bBeUu85pqeiVYz4FHcpR0YVGwWwWyJhephgglhic5nATNjybG9ldvAx6DwNmKg351jfVZRVs3yuNVLTK7qo1Aga+58OjF4X3BhVcm30RWxLsWR9b/p2Vy89JC9b+cbvRlOHuAVA6Yt1hl0r6CL7QgU+J8PwzKz6mZ/GOhMnTZE6/mjQ0mC/q8gHtX961L9f/KIVcUui9jAWw3aBvPv0RCjz9oc0MmwczpX8/toiMKS9ogepDUZEqm9w233lAxj5jE7zg7N4BHWPPye8ZjBCjpoA2sDzn6GQWzpE9JamdsqAO9Eb0fgG5tyJM7szT91zkA8wL/WcOWCVhIXC+JVX/5DleXjAD6qhMpPgtvXCfjhKCe1plcYE8nLiU26vzIz5Rdq8KN0FeNObAhK9GmbzFfJFQbCi/2VxSfWB1/Snktc2Jd/EirqQKDLqqW2Mx4OKAW48t7hiDoLd1UPfogwMEkHYtCzgS7NLWQ0Kn0A==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|15080799012|16041099003|23021999003|5062599005|19110799012|8060799015|260925184616899003|24021099003|25010399006|4140399003|3412199025|440099028|40105399003|53005399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S05fyNX044/o23EX5NnBC+E7jek0gArt0G77UcKLiPwuABecROqj2hEuGiy8?=
 =?us-ascii?Q?Gk+soHeswKFZUbHugFLnJ/FO0Qkcnsf1/GYxQ3cIdQPfiS0V+yAB030RN1Re?=
 =?us-ascii?Q?hbKuO83r9LRmG+7tnfJg0EN6WRQc3pcA0vYREAghaHdmpemZ0OY5N6R/2Rln?=
 =?us-ascii?Q?nB4Peyq0lFRteUIjauS7Z6Gi05L6GRtnTZvcT4dZd3Ig5TtZwfcmWTYNdX2C?=
 =?us-ascii?Q?fyLG65IqOD+xHEI5BLoPhQiNzMoGfF89l/T1Tkr7cjlHNuXtsFe4iL/IZMWU?=
 =?us-ascii?Q?zqozsj6N+5X2bsAWx1bGrEQeHX40iD1JM3Z2BGZBymnVL2OmcJQKIWJUQYCF?=
 =?us-ascii?Q?SNDzdGWSzJXeNPeB3tV2jwBZKAalOybkli+JhbHfUcA7F+Hh3CmraXejsU3p?=
 =?us-ascii?Q?CywKTI3YbR6QptgNQbjj+9FPf1wdePnSqxiFyFP0T2+NpCG0JZU7ALUsPJgj?=
 =?us-ascii?Q?ClRwSY0Gk1tnt4XSgtLKKms+XbYANsllOivsqpBWEKFGdCMYF2rapiVTKybr?=
 =?us-ascii?Q?PB7XK7ApCSjNSekEy5Yvri2f0UWxsqJkNfVXkvbfLWMf7/ky9UiSnVY3mI2k?=
 =?us-ascii?Q?HcOcw+aueJ+nwWLuMBVT6oVxy8BcSfPvYdVl5sZm99+9N+faFOdolJeJuKjD?=
 =?us-ascii?Q?lEsFWX7W9J84E9483IjRQ0S5ejbBITM0lgan+g4r1O/vQWlH5bcipKizE1zs?=
 =?us-ascii?Q?yxII5rcEZ6QCzgxzon+61bmOIvjuj3NTGePGxeSJcR0gvSSAlHH2mEtJz3DR?=
 =?us-ascii?Q?3kKt7vsCv3Xr1w63ZTQRcHIAxfVkJxs4S0YDV0dLOTLPQ8hoGdbpBqsGNDyM?=
 =?us-ascii?Q?T0uk43kvkCgJWiIEKrRBy7NIQAo8YsQs1pRm5u6EsKuMckfDjI8UK72U53A9?=
 =?us-ascii?Q?amNMnDwEaFYcSVyLA4zLyAaO0qxuWS8gk9MIQNHukCBd0GSTuRwgxaUm8Gzy?=
 =?us-ascii?Q?+vbDKhK3gK6QE3/++YgRpxUFSyszfPLSgjP0fZyPA1j0z0ieTtvuZCgxXrs1?=
 =?us-ascii?Q?B3ksjDJO6dFtxVS2xGg9/b48q0q4fyZv9lpf2BstNUasQIQ=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hkS987pn1maSzpNj9Km3bvaxgv0zZYPiOlyrppJLDWoUopqF0Oie3nAIKQQE?=
 =?us-ascii?Q?l25cpYbsXld4avxcS45jf5MlDR7nzpoF5dWb7a4Oa5+7AiWiFerhdjGg1m8C?=
 =?us-ascii?Q?fzw0cnhVoH9RVsbVJQBNGUCLNS/FT1KILeQzQvY3vcg8PCL6wPGb4+uv0PDM?=
 =?us-ascii?Q?8KRILFP36OD9UQSh/6JWwYCq4W7b4yBIlMPaEJWof6chc8wW19aqct4ih7wL?=
 =?us-ascii?Q?LvrmPVadQ4D/34wC3eawnyDZ9PhN4SnurhNV8WG8glXYqXXglF65+ZgjRH/P?=
 =?us-ascii?Q?9WYgu3asSPrIQydJXHsSNNJq30dY/T8DUsXIhqEnuythYoyEWvOInQpTVyuJ?=
 =?us-ascii?Q?WjE6DiMP+w1ObWrHlnSgeZUn0jESB25LurI9fsUKjNW9TDHx77i0QAwd3fAG?=
 =?us-ascii?Q?ZLYDBP09HvcVIOwdKWkZ5/1pRq7MuoFc9rVuXVME1AaJZwwViVIv2AKgwG8j?=
 =?us-ascii?Q?pPAxTd1S3nqAJoT4jsVmWh8UF++LUrN+Ty/I85ima3QG8wbl2UR/KWJCoJsz?=
 =?us-ascii?Q?Li4DuVyLTyPV9F3SHr8zy3222mk4NPdGR7vC4GNlDG5lKOX+f2QGuanYzSyy?=
 =?us-ascii?Q?Q4GVJ8HDgABdN1PNaMaicH3fJ38IkROnSCrQs2t4oXsWSrIw+Dq5l2kghKQT?=
 =?us-ascii?Q?GICTPwFPy40D+VcisbC5o/Fz6au50Htbl3qh5t5zTLHExZ7kHoYngba8pBs0?=
 =?us-ascii?Q?jvCzEEn788cOd29yK+gs+FxCjYi9X+VNQb7elC+weyjNsyPBSHneWntO52lp?=
 =?us-ascii?Q?4aSTOrioyjBEXmeySqd4EbQQZVkFQ1VFILbxxDWNTyBG8v2kODotdjtrEnG3?=
 =?us-ascii?Q?PgNLSaGYbcR/emndmJJ8WsOX3p72+eBIQmYCZCVJwonGpFkqVYVO3HVjcxWd?=
 =?us-ascii?Q?DZtbYL5V2Mwva5XSi7ZLNNh6XgUhDfSZdTCVylskPUg26TCsUMeA4wyn+wd2?=
 =?us-ascii?Q?ojx3NygLYAF9iJacZrUABdCuJ75PowOFVXw3gmegIK/eSdtDkwakMgR9mfUR?=
 =?us-ascii?Q?zvbz8Cqwl8trUEyeLMj9eSAuZTkCQthqgXIRw2dYkP/N4eIic1f4lvlW5M/f?=
 =?us-ascii?Q?7eTiF8zkDdYWIRHX9+oDXcjC/4nr4Cx7qdgzNyqi8yrNKdpRPeD67KZayzDp?=
 =?us-ascii?Q?3G6LJVLmrVhDCZ4RcbBF8q8yTArTLsZQ7UbeiVZotFIpF00g7TS64UsnB3T+?=
 =?us-ascii?Q?jqrG1a1mVbzlNKGbSoVrEn6nddq0177CZDY3qbkDKKEH3MICVfkLLJW2JcAD?=
 =?us-ascii?Q?QkcSLrJEeuzn+2kbJC7pBYLh/gqJYQf1S7VGzdONQKkg+nCMQLtFJwbrJBEX?=
 =?us-ascii?Q?roarkLCXJgwoc88c6Wi0GHjwCVwGRL39Ub3O127gQR5vxKU06LqNHPBYZmaw?=
 =?us-ascii?Q?Z6l4lZgXtNA/NSF6YWBIHQtqjYAJcJTUCD3wmwx5bROdR5BHzmo78Q/M/3em?=
 =?us-ascii?Q?aPd32L3tOJSunXMwUoJFLhuxn4gZd4RN?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-061ba.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab55e78-2b76-4aef-c1d4-08df36669b65
X-MS-Exchange-CrossTenant-AuthSource: MRVP191MB2786.EURP191.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:17:23.4948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP191MB2773

From: Amine Ayaou <amine-ayaou@hotmail.com>

Fix RNDIS for Windows hosts by adding Microsoft OS 1.0
descriptor that allows Windows to identify the RNDIS function.

g_ether currently advertises its RNDIS configuration using
the legacy NetChip VID/PID and the RNDIS control interface
class, subclass and protocol values provided by f_rndis
(02/02/FF).

While the Linux rndis_host driver still recognizes the legacy
02/02/FF RNDIS interface descriptors, modern Windows hosts
do not bind the RNDIS driver to g_ether.

Use the existing USB composite framework support for
Microsoft OS 1.0 descriptors to advertise RNDIS when the
RNDIS function is enabled in g_ether.

Use of OS descriptor does not change the existing device IDs
or RNDIS control interface descriptors, keeping compatibility
with older hosts.
(It only adds a string descriptor at index 0xEE and handles
the associated vendor request)

Signed-off-by: Amine Ayaou <amine-ayaou@hotmail.com>
---

Notes:
    g_ether's RNDIS is useful when a network interface via USB
    is needed early during boot, before a filesystem is available
    (e.g., nfsroot).
    
    Alternatives for having a network interface via USB during
    boot are configfs and g_ncm.
    Configuring the gadget through configfs requires userspace,
    which is unavailable before mounting the NFS root when
    no initramfs is used.
    NCM (g_ncm) is not an option on hosts that only provide
    RNDIS support.
    
    Tested on BeagleBone Black with a Windows 11 host
    (Version 10.0.26200, Build 26200)
    RNDIS automatically bound with the patch.

 drivers/usb/gadget/legacy/ether.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/ether.c b/drivers/usb/gadget/legacy/ether.c
index 99c7fc0d1d597..70de686fa56b7 100644
--- a/drivers/usb/gadget/legacy/ether.c
+++ b/drivers/usb/gadget/legacy/ether.c
@@ -11,6 +11,7 @@
 
 #include <linux/kernel.h>
 #include <linux/netdevice.h>
+#include <linux/nls.h>
 
 #if defined USB_ETH_RNDIS
 #  undef USB_ETH_RNDIS
@@ -92,8 +93,8 @@ static inline bool has_rndis(void)
 
 #include "u_ecm.h"
 #include "u_gether.h"
-#ifdef	USB_ETH_RNDIS
 #include "u_rndis.h"
+#ifdef	USB_ETH_RNDIS
 #include "rndis.h"
 #else
 #define rndis_borrow_net(...) do {} while (0)
@@ -364,6 +365,8 @@ static int eth_bind(struct usb_composite_dev *cdev)
 
 	if (has_rndis()) {
 		/* RNDIS plus ECM-or-Subset */
+		struct f_rndis_opts *rndis_opts = NULL;
+
 		gether_set_gadget(net, cdev->gadget);
 		status = gether_register_netdev(net);
 		if (status)
@@ -387,6 +390,18 @@ static int eth_bind(struct usb_composite_dev *cdev)
 		device_desc.idVendor = cpu_to_le16(RNDIS_VENDOR_NUM);
 		device_desc.idProduct = cpu_to_le16(RNDIS_PRODUCT_NUM);
 		device_desc.bNumConfigurations = 2;
+
+		/* Configure Microsoft OS 1.0 descriptors for RNDIS. */
+		cdev->os_desc_config = &rndis_config_driver;
+		cdev->use_os_string = true;
+		cdev->b_vendor_code = 0xcd; /* arbitrary */
+		utf8s_to_utf16s("MSFT100", 7,
+			UTF16_LITTLE_ENDIAN, (wchar_t *)cdev->qw_sign,
+			OS_STRING_QW_SIGN_LEN / 2);
+		rndis_opts = container_of(fi_rndis, struct f_rndis_opts,
+					  func_inst);
+		memcpy(rndis_opts->rndis_ext_compat_id,
+			"RNDIS\0\0\0" "5162001", 16);
 	}
 
 	/* Allocate string descriptor numbers ... note that string
-- 
2.53.0

