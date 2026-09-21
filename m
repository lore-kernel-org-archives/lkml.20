Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F2D4DEC32
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790009589; cv=fail; b=Fwo5VCDjwMolCyixLPW5OeU2iNUdebqyveAd/vt/8PET/BRDSh4x7B3pR72gDkT7Gu16P21gQrjFipdIy882WXIMYR+xQBxJONF+/hb6suxe5gRb6i0TM0Qg/ELXqPdgB9ycBjwCJKJvkqM2GvlmwCeQQOmSuWfw+ULUEX5dxrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790009589; c=relaxed/simple;
	bh=qPFe+ezSgijGSNxRzFzXTuPiyj4Fx9IgodaNAPWiGZU=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=n+n5T3ZKRVCQ8o0Jrz3ui+5wjWwryV73anPiRrlCLD6LyN3JU91l1gM8FGoBSH3aI+g+L0RrgV1tJvmNn47n1M1Cyp/XXbS9haZOtEE7Etp7k2HxukHV8DojfUaBLH1CfS9oWu3vPWV4X91iSN7w+GbLLjATuDaMf5NVgaT2z3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=MbbXzFhA; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="MbbXzFhA"
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LGfVIh2431400;
	Mon, 21 Sep 2026 16:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=N27xwLfOxyqnNGM/7BnXeTW/
	JFdb40x0TK1mrUIku1s=; b=MbbXzFhAiC2jZSHbCG0pCIYVat5dLiyCWNLq0cGy
	ge27hU7gY7LOVMG+69WpZENU+jdpT10uV86d4D3Fg4m/fBLZowuCMumU/T2aIOX4
	9gYY6wA2pd7uKLUYWh+cUiom3DIVuM4BZT5/qw43a99MVXu12V8/kxiPDzmtGDl6
	3+cGkby2yqlZkPFdbVtQDoMoDHJLSuwZnrInKgZ7mg/TFQnjpw75hvXM6bSUh85f
	ipQtSe5FDlnovWmaMX2BfbnoNlQey/1OlsGAFS6Nkbu1cdjucOtxLtkNodlFqGrT
	10QWRGmVxXF8S68B1/c8P/OdmmiJMys5cUFC4++RFj4HsQ==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4gu8ap84jw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Sep 2026 16:51:29 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 68C00800EAE;
	Mon, 21 Sep 2026 16:51:28 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 21 Sep 2026 04:51:28 -1200
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 21 Sep 2026 04:51:27 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 21 Sep 2026 04:51:27 -1200
Received: from BL0PR07CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 21 Sep
 2026 04:51:27 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uf5y+AOXshqkv6absdIT1/ZQz+zOlMUaA69GfEF2rk1QBn6mqpE98T7p9fHf9XqNALDORDjH6nYMASWvSkI0Ltb7RsXx+NgXiT4gsKtCJfBbadK33caMYxKo2oqSJyxc22FNPMSRqmreInSKLnfwjKOWm76m+8TW1lq3pEvaZxN21dBG8jElze8qBNnrEgMnR8dfuEhtIKcqmU9nWjxjlJJvdPlN5KczMzuN4Xj5ohFXXnLjT7Iy8hwFqn8mkaD5T0uAp6+PleOXE9rWDJAs5SvipDg6/7uSJjypmUjR0Zvb8SkhAQ4FsY4HU+lUL5R2dtWBP73YoKEphiZpaBk/Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N27xwLfOxyqnNGM/7BnXeTW/JFdb40x0TK1mrUIku1s=;
 b=hghuVghszw+TJZSEKnPlGEn/5hhkMieIryeWRND2MP+0H0QKRlQ9q2yQdz++99SNOftNCERASPekRGgDj4rQsOzLxmiti+HLLKKbPU/tye7BEck8gT92+tcG0PoIdytL6ph5JHapjZ4uCNRytg70AyWVJ270QLHZoLrszKN9Hgr5+8tij8O3IepyBputFFjT8HuFwz7M2ctzKcj2yWe3ODPUFt3toeH7Li+FSLLt+1c/xoWYyn1NXfrA/TbU8fH5zzEf/5g46LfikJ8fy95qpUnb8bjKIIR4WXqs6fMo5y0Pn2qIcz7X/N1zC9NkUS5U123Ozk02ffIRHy4o6XxBTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by CYXPR84MB3515.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:930:db::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 16:51:24 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 16:51:24 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: Srinivas Kandagatla <srini@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>
CC: Chunyan Zhang <zhang.lyra@gmail.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Freeman Liu <freeman.liu@unisoc.com>,
        "Maxime
 Ripard" <mripard@kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH v2 0/2] nvmem: validate access ranges and fix SPRD reads
Thread-Topic: [PATCH v2 0/2] nvmem: validate access ranges and fix SPRD reads
Thread-Index: AQHdSelvk1abuTcjnk2DniOLty6YAg==
Date: Mon, 21 Sep 2026 16:51:24 +0000
Message-ID: <20260921165055.421933-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|CYXPR84MB3515:EE_
x-ms-office365-filtering-correlation-id: 02353052-7266-46dc-57be-08df18009244
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|6133799003|56012099006|18002099003|38070700021;
x-microsoft-antispam-message-info: cyckEeR5nnOVb0iSZKnzV0AHahYdWj1Q1iwL9sUoGDmNXqGXPY2/cN/Sge7tkl1fDVe6vs1isBa9c0cXh85/X/W4tej62oQZf3fR9Ti3KBOg00H9xVTN5kKQOpDiKAjwRO2wEEFs8dYg3ZtNy1WoFIRj1n4ocuzEx+iNE4yxbH1qpezvwXITZL5MXz8jusNCFhrgjXJVqijM8GMMZqUDlbs/hl9aa0OuNAiy/ysWf+xUHMO/r4qmilNGwL0lGoWDoLJkQCUI+n/6a9jSWfvYZnQoobIN3Hm3y5qiOnKRpsafwqAznsK6fkr/YdIyHccH7y02ju1BnAnwqAf/WezgYAf5HMEwMwBSSHSruOnjjO/kIr0jHeOccVI6hZFMkFSz/5nJ0KXmscfe//tFivLjFsbw7cY6x67/YfPFj2UqOWPAf7Mq+PF4KQjVBepToDfHQ65dAXYw8X/I+BuXah10CpWKQsjUt8DZt3TDmyRpwE6Jddu6W7bw4056CshDWXBAqXUGfW45F1QaeQex20T5bsLDGH4tKO2u2xF+TIgt9bBCk1HPKBTCCg89UdoQF80aKLAa9bJGtecbjEX6rhzcvd4uOyDh68mkCOfJamTak7MkswJJ/AgboA6glQGl+TsgftIJ878VzNj0ZdwsJXWIugbZxXyqEvkemQchS/hALqQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(6133799003)(56012099006)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sRoGYtFxlGpZK8SCxQylRrKutBuW/mkl/N9vbR+VNliKgn/EE/HsXmBmuZ?=
 =?iso-8859-1?Q?Avmd4sdnJSFC9SCTUJpvhJecCCUarmsPVX/KiMvBpcpSkHSUr+eiFFvkS+?=
 =?iso-8859-1?Q?R++Mc06BXC9rFAbkfQNEezS4GWbZeavMg6bgDVHjumorAaaD32q782Yip3?=
 =?iso-8859-1?Q?svQ8g5XAbUO5Mty0tuk0iCZk+P4Qzqqt9e3Pqomk0+N84CvNdAwRrJ3m9h?=
 =?iso-8859-1?Q?2PeWHUQc298otovnePuo1kbvprflQU42XgmcM4z0DsKLZ0Qcr9pmN2ZdIK?=
 =?iso-8859-1?Q?k7Lod7xrorgpPshn2Z4kXiVaeleZQvfwqir9aDNCW5/Pp/M2pA2NQz0Cvv?=
 =?iso-8859-1?Q?BxWJ3WdvtofIOtWhxrKxr/NnTrHuJ7KZcWnkYoDAUDN6QL41OZg4/2JEbd?=
 =?iso-8859-1?Q?YIQo0MxhUkJg5BhVqe2AgbuhQgOXFR/JIpuTf3J60RN6sgz9o4bbnSucTG?=
 =?iso-8859-1?Q?1z3nrewwfKtg7gCtQ5vph+br/lXTDFpkaEyDRY4SjbN+Y8rz4CYDeB5OQG?=
 =?iso-8859-1?Q?h9Pw3gzzvPGiNZnXo3VYTCYceXsdwnt7HktmamZM7tCmoucpg9AysPVUK3?=
 =?iso-8859-1?Q?3y5f2IZNe8Q5uRJYfEE7hQ4QddrFU4XH4hYnD4C1M3e0b4DEwnjeTPpucf?=
 =?iso-8859-1?Q?rJmHj6vj9ZljQkO87JDbXb+Ba59AeHXp/JB/2gT4zGEeXs/KYt/nY9y+GH?=
 =?iso-8859-1?Q?Y//VEgGB0fm5IjvyQJItrBBHD+rh+YsvMz9lPMPbpeCS2112/EE7SXNRwC?=
 =?iso-8859-1?Q?MLALDupJjlWUY7T4YMYNQuACbCj64rnbH4w/n/u9zCHAAMFcrDpwwekkBF?=
 =?iso-8859-1?Q?TqPl/+IKfLJsEBE3ToB6qEYyvoTm5hwYvJ8P4UIsBifRTtjo7PeBA69Db/?=
 =?iso-8859-1?Q?iIxxyBqGthdJbJKBnPZp+r5kAuCm/RNao6yuSwWEM4ZGFcTonR6neIYPAj?=
 =?iso-8859-1?Q?gS8kWxljD7S60MC+OHIstXV9aVzQHAv8YcHBY7Sw22XC2PiP9UTIACqJmY?=
 =?iso-8859-1?Q?ixDay+JORiYflBplkO4PaonL0Mg/LPJm0OA5FwPX2wERfmbCHrqFKDo7LT?=
 =?iso-8859-1?Q?kDkECwPmg//8viulDHBXxg1KznVpZJEYqDUemUOabf4NVNwFV60/3b/ycq?=
 =?iso-8859-1?Q?1tyoRTpZp7+Kq0rY9HF94DK5u1Si8GcpiSOLv4u5T15Fq7UIuAGaPoL1Fq?=
 =?iso-8859-1?Q?8G6LCv6iYiZ6ZIf9Mk7I0eUpqiQGf6b+vXpSQE5CslUgE1MSilTLJCIZ3u?=
 =?iso-8859-1?Q?fAOdggIpON77Zu4Gk3ADB8XwGUUML9P15RY+BvqYYu/9XENvYsIWKEDoyq?=
 =?iso-8859-1?Q?+VyQnzI0mioQvzclVuHk2XRzGFYLWGCM+TDb062WLZmIQSgiJnx8ghZSOe?=
 =?iso-8859-1?Q?i51TiDd23ZXChtGn3Y2AmAGtL8B1tAmAgRaBjpPlGfjUyYzuWzrXZZeC0N?=
 =?iso-8859-1?Q?4ClYVTKSqGIzB554j8FUP+tLSG+2gs4oZM0nqhbcbew8ZqvAU6KKnQTOaW?=
 =?iso-8859-1?Q?Rx33JTUPo5HBGr+AjI+V28wOENm3PQHidCPdM9Cj4g4472BnfeLZyg5D5T?=
 =?iso-8859-1?Q?4JbpG5LeRkVYo9+BIfviOcb+JIhDI12aoszbcPiX8JOTSk70sbZQbb6beq?=
 =?iso-8859-1?Q?9DimRXg+GVLKucKSBMeCBUMyLG7zFiL259f7+lX6/Gf2kJPrl/cmXHorq3?=
 =?iso-8859-1?Q?EtUUv2RO3JtkDxDY9XnmXIrSgccxEOvBQj4o42hh9sT52PMBeVLoP1tDlQ?=
 =?iso-8859-1?Q?paemcn84Mu9EZqkQaFM/xQ4tlcBq20rFlOL+6Xfzwnuw3Hzuh+fsliOle0?=
 =?iso-8859-1?Q?4m2OqplySg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Qm1//y1HgRt8ahWbISuTYohkcyQ9XpZIcDUqg90eS+JfkdG+0QR6eleqAj+4HuR1LCkH/MO8PeCFSSCThvCUo95w4aVUD/lscnmTcyTWJuzeIus3sw51UXTkL24DgaHXBYuxiY+OoKRXOkbEw9T2D4kBHhjb+659NQbh4j6TKEuNJPYo8wmpiMeQAH8/fHInxXc2ZD9Cr0shWz4avvdtKwLhukz4yy/F/LXyrSV9GUOlUFp5yzeobV1ZUDtXyh6GDf5fc8l0oOD+E9DJ0XZfqaCFuNLz00xoXPwnxr0TMkQKCfZpyLXRFthM6BBgUP5V0hAUnSXAVEVFyuDU7PQjVA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 02353052-7266-46dc-57be-08df18009244
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2026 16:51:24.2759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: riycD3H29M5RR0QBFRDbq0aCRYtWkXT80alt3Mim5xTax6wQBDzUYRyUwcbnVJHhkKGAf+F+Fe6bpJRN5V/zRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR84MB3515
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI0NSBTYWx0ZWRfXwTFPtujWy0p/
 aW2ZflcZKz356msQgXZ33YxKYFY+KfFY2sjvmDFX1WCAm1VfUajj4iSJ75BJ4CID018wem6tiRG
 HRzcYPyVVc8aNq+A5IH1pEa8/bV7mrk=
X-Authority-Analysis: v=2.4 cv=SoYFe/O0 c=1 sm=1 tr=0 ts=6ab16091 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=RtSn8ETxjE2H05FtM2s8:22
 a=VwQbUJbxAAAA:8 a=MvuuwTCpAAAA:8 a=OUXY8nFuAAAA:8 a=m9qre7F2fBnpaQQeOvQA:9
 a=wPNLvfGTeEIA:10 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: KDbEYltZ-570TlW2SjftZbfVupis4KwM
X-Proofpoint-ORIG-GUID: 6u3v51Our9e4ynkKTMSWEFeaN09-GyXx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI0NSBTYWx0ZWRfX/BqM649yojMv
 8bP99+Gf0h3XB1xofCnchQPHo+zWKWXJZkxGCoY0nP5YrVU8rZRp8JR6E/uqrHKnPMm2d4OHBTw
 DMPwDQPo6J5mpp6/AAJ9pOTmTYQ+zf/kwbQn2gdB5LBzYDxYKeYbzrr+z4OXOYP7WJRTKO63sVX
 yf+u2Q7IhbAhzlipgXiTL8RllUlAUMfbDj68OcVda5xqF1JbJEBZaaKWSwnqP/KnJOoqtd1ZreD
 aGlIHUCg9dQFYPNAvHWE0MVYjqEzBrISrlpMGyoy3NkydJBk071p5gCgg23tHRK/gqr18oC3c8A
 B5r4AH5CPpir3IBY820Be7EYZ1QclefIoU8p4DVWxWMBBLtYLBFpXfM8EXihYzltdwk0r/pE1sC
 dLMei8iAEbSg+r/Ln+23SLgwHLf3bZJRZY94PyaLWqkQuZAX22Zjmfk4Ydy8q7IruilAfvkCnnv
 d5PFgTOMRR79lfbTM+w==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 clxscore=1011 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210245

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Patch 1 adds a device-size bounds check to the two nvmem core read/write=0A=
functions, so an out-of-range request is rejected before it reaches a=0A=
provider. v1 open-coded this check in the sprd driver; this version puts=0A=
it in the core instead.=0A=
=0A=
Patch 2 fixes sprd_efuse_read(), which reads one four-byte block but=0A=
copies the caller's full length from that stack variable, and never=0A=
advances past the first block. Its provider-side range check is removed=0A=
in favour of patch 1, so patch 2 should be applied after patch 1:=0A=
without the core check an out-of-range in-kernel request would let the=0A=
new block loop read past the eFuse region.=0A=
=0A=
Both patches are compile-tested only. No Spreadtrum eFuse hardware was=0A=
available for runtime testing. The bounds check intentionally permits a=0A=
zero-length access at offset =3D=3D size and rejects all ranges extending=
=0A=
past the device size.=0A=
=0A=
Link for v1:https://lore.kernel.org/all/20260904003815.462352-1-sanman.prad=
han@hpe.com/=0A=
=0A=
Sanman Pradhan (2):=0A=
  nvmem: core: reject reads and writes beyond the device size=0A=
  nvmem: sprd: fix out-of-bounds read in sprd_efuse_read()=0A=
=0A=
 drivers/nvmem/core.c       |  6 ++++++=0A=
 drivers/nvmem/sprd-efuse.c | 17 ++++++++++++++---=0A=
 2 files changed, 20 insertions(+), 3 deletions(-)=0A=
=0A=
=0A=
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935=0A=
-- =0A=
2.34.1=0A=
=0A=
