Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010025.outbound.protection.outlook.com [52.101.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22082345EA3
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 23:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791416894; cv=fail; b=T8Ak52QwDWqVR48TED8ezjThI8ngDor49la5S7ydBCRYGb68i7nZ7n0e5s8ex96sZKht8ZosLlt1WX5Qi7GOemXESJWLbSxX14cG75yh7qL0BCC2rwn40oa/1mmuZfrKhnXamWnk9QKOTuHKoqwP6/xAX7RHylMLmfAhxYqrCl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791416894; c=relaxed/simple;
	bh=C8cakYqe1Z2NbS/oMRl0Bf5MFIT9C7XFWWQ8GMm3uYo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MwT3UjUTNPhwaG0JvQdpGKSzH1wX3X88HTZd30ttoQrJ1RQdlQZwfOnfWQ7dLqcnwtFTcwX35PJsHCElC8DQ8pcMv3xtLQN3GO0gCdiiT5GR8w7EsfpMNV5EKsU7XD5wHYp26cCelShnC9LdgleWEbcAarlyZLLhKx0hcO9CLn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=ML0F8o92; arc=fail smtp.client-ip=52.101.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="ML0F8o92"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krKjOp4/0xX+wAmv+e/O3bn6366zIsQFXFCfM72XcfcRmdC5V+ldN1irWwcdhtneK9/LPcOvrYiwBXyCjEgz393vsGhGWM28xBzOFM6KynoxpPiAZAfog8+XvuYXfz6p0CX46Q12WI9+T/L/kCXyVi9vSZEhPqiFzJEr4oXigbu5TlVT5ognw23pLPleZXWTLNIU+sCaDWJj0yd+V0BMKCD32C1GlLw4x7n4cANVkBuHpIjeddAXCGQ54Rf/CFnnDMB1RL9TTLXjxTHyXD1onI087q7caVAlpBNA5uh3bS20zqYlN7BIuJawG5xlXWPL1qImjOTgImn/8frHsdafEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8cakYqe1Z2NbS/oMRl0Bf5MFIT9C7XFWWQ8GMm3uYo=;
 b=if7qdmb9DtlsYTwE2qHtX62fXQgREtneWvWNaBjTBKt7tGTZ+MgZ/jdQlo6TmxcDcpuNtrqugeyaL4t3jMkUqbDC0/b4Wy/zINT281cPeNJMARZRuuAMnRO1s+WVg9wwnR8fb/pXsUefoFYvau+aglR8wT4J+7Ce31Q8V/ssB+NNseoDxwt6cPycHaCH7xJ79Rh7QnFjZSzRMxw1Q0Vua24L31nzLoTTiO8Du4dy/EsVdK9EjxpzJ4Oi1FrMHFe2dlMG3UWbaz18s+SE4lKNM+113mk+el6PcE30Isc63Abe9WbzRQavnWSHzZxylUunAf8Z7oU2+/jIzgPBDfgKlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8cakYqe1Z2NbS/oMRl0Bf5MFIT9C7XFWWQ8GMm3uYo=;
 b=ML0F8o92TJieyZaX4GaHI355gTL8+l7NFpc7knrnQHnVn8Dkf2upcRUbx6er/CC0rqsy1+xlao3U0CAhsYjBmgJNtYbrMn05Ko07d9DljaqVW0HC/AnOCHzut8I1tEPLWIrlVxqgllBxoBsXH1oXGsYr+QWxCRGX1uAQWsBfyy1NFQZnSboCFn7Ak/jKnwC7caQWAhkvvNL2LhNHgo8epp26fZtkEup/xw/P228FgAQaAo9FFI7utjueTkDif4+pVNClgm/jWzsMICH7T8RNaiDwqOvH9L07BZtorznOfa9QRdNpKt89oV/lpJsmQZyWLfzl84Dl6JDZqtRTT2kdIA==
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 (2603:1096:405:338::19) by OSZPR01MB9583.jpnprd01.prod.outlook.com
 (2603:1096:604:1d7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Wed, 7 Oct
 2026 23:48:09 +0000
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957]) by TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957%4]) with mapi id 15.21.0496.015; Wed, 7 Oct 2026
 23:48:09 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: "Ben Horgan <ben.horgan@arm.com>" <ben.horgan@arm.com>
CC: "james.morse@arm.com" <james.morse@arm.com>, "reinette.chatre@intel.com"
	<reinette.chatre@intel.com>, "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "dave.martin@arm.com"
	<dave.martin@arm.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>
Subject: Re: [PATCH v2 00/12] arm_mpam: minor fixes at v7.2
Thread-Topic: [PATCH v2 00/12] arm_mpam: minor fixes at v7.2
Thread-Index: AQHdVrWVcXFyvzsajE2+rYmx+9EnorbyvnME
Date: Wed, 7 Oct 2026 23:48:09 +0000
Message-ID:
 <TY4PR01MB16930E04DA8439F2C36AED4558B942@TY4PR01MB16930.jpnprd01.prod.outlook.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
In-Reply-To: <20260917145617.2202986-1-ben.horgan@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-10-07T23:48:07.840Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB16930:EE_|OSZPR01MB9583:EE_
x-ms-office365-filtering-correlation-id: c6f1bfbb-3e0e-408c-203b-08df24cd712c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|56012099006|11063799006|10067099003|18002099003|22082099003|1580799027;
x-microsoft-antispam-message-info:
 1hNxVUCH/x+FW/9t5VhNt4brAiL04wC6bYWFi6WLndQDh4TGo7YB//VD5X0+LAp5wVDj/z5fDx0S3Jci0G3+p2sKuQrzgHVRH+mvqH3EjbJlUO6rfcdUVUx+sBKxvHzns1MzvgSa3uyiJEUZLodXWW/IJYOkl2e2ldKOoifc+xisKnU92nTv2C6maeXr1uItcbExheDllFYyGC+ew4N8lRvSJK3CciS6lHvtPD7+SvI+7EkTdi+Sxw3DflbkYwBLAFLTRTLEVBDx9mTcYim5pUo0ipdwZgjGgojaTarVCeykElAKlpqRn+YVRVQkewVLHzoHBZV9EV22hH3n4FSKbjOyetcXgcV+HSYBbKFCreU6oKhNC5nTZXhykCEfCbYZdUUF9N1myJFH+g7izAgRvNMQY0bCJd90O9KaIxNXlWhY/fM5OE/o2sle/dcOtgC2CZJjAPk1OdEzJmYwDRebDvJ19waBTFzm6myeIw54HcXt5dUREE7OBG1VDrRx0RLcN5gKeWOl7wl2ORVQHicD4w5t2uPaKuvffcY/bosYtrt2SbYsYO8c2/KlwtAuheGQHO+3J4fwCVcP3iV+fhZn2vEBB/XK+Sfp6bizAVzQ853iFeYXbDH0T8cJbNrkZdg5VNOuP0szL0F77THKWHnWBhDpG9wvDQR9ke/UyboLPLhKCxlsKT13sZjwo5JQG4bGxm8IjeWt1R0GtW+A1WAQWl2CUhe3Wk8ETTuFMvxs7nQwlyYiqB3dSYmQORrac0++
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB16930.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?ZWI5dXVPRkxyRXlobjJ4cVQ5K1BZa3B1R0pDT1I1dWtEYmJ5OHFOYnRQ?=
 =?iso-2022-jp?B?V0JTL3NNZjlRTHUvY1NaZ3hNUmpCZTNNOTNFdkFmcnQvKzRkdVdsUXBY?=
 =?iso-2022-jp?B?UWdBdWFQUWxXekkxUHFmeDh5RCthS2dCUnlCMkRkQXdmWGI4MDIwVVl2?=
 =?iso-2022-jp?B?S2FtdXdLVVdNQmR2VGNhN3R2ajZZaVk2bVNReDR6T2V2eU1LMExhTldQ?=
 =?iso-2022-jp?B?cThtZUg1aUVQZ1g5Mm5hYnJMOHdxcUh4eFFRQnBwZXpJWW1neXF3ams0?=
 =?iso-2022-jp?B?RktRTGw2dkswKzRxQzJOb1hVREQvcWhIOXRhejNxeS9SR1dGNmZVOU9j?=
 =?iso-2022-jp?B?YmVpOTBZVEUvVEhBOFlXRDJWSjV2MHh1V0RCVmZyR2tqV291RTFiRnlZ?=
 =?iso-2022-jp?B?aVhrbHpkTUpmZDJNQmFzemdWUTduU2tVSjYxQjdyY0JxdDFIWThQU2t4?=
 =?iso-2022-jp?B?TDhLQjQwZEVwaEcyVGYvb054MGE0aG9MMERNN0k0aDllZkxZQzhZMnZl?=
 =?iso-2022-jp?B?bVMzQmx4ekdTR0ZYZ1hCcHZZYTk2R3Vza1RFYit0cUpvU1hFUm9BMWNT?=
 =?iso-2022-jp?B?V08xRkJqajRDdm1MQ005ZmNoQ3JuK3pyL0RxT2s2TWVrQU45Ulh1bzA5?=
 =?iso-2022-jp?B?Z2NuNFFONjZuNGdPNEkvV0piQ2lXMUc4UW5vUnhVelYvckV6LzhtOVRM?=
 =?iso-2022-jp?B?T0tudHNzeFUxaWhLeHBhSk42RVBPWExNV3ZabDJkb0FWVUVsb0orSHBk?=
 =?iso-2022-jp?B?Vk1EUW53TTc5UWJEb2Y3WmU0ODR6MFJNaFI0Vyt1Qmt3N0xBZTdEQ1pO?=
 =?iso-2022-jp?B?KzdpdUREK3RJN2Y2eFB3MTd1NFF1QVR5b2lSeUxVODZnYStacC9QWFgz?=
 =?iso-2022-jp?B?SFVUQXNvbCtSOU5KVHhGS2kxZm0yZFcyaW9aWDI2d1JramZPTjQ2Nkdw?=
 =?iso-2022-jp?B?OWsxMFh6MHdwZFhENWU1TjUwUHhyNFpqV1VnTFQ0bFYwdEJ1ZnY2QlBQ?=
 =?iso-2022-jp?B?UFRXSGZFdkZhOXBEelVSUkNhaTR3OEFyMzkrRDZCeFFFbE5US2l1WXFD?=
 =?iso-2022-jp?B?c29HcnVqWTY3RU1lL2owREFaN0lteUk0YlhyZ2tWNVV1WFNPWXNHdUxC?=
 =?iso-2022-jp?B?d1lscWFaQXM0clhyUHJ6WnpwdWM1NVQrNlN2K3UraVlkcnlwb2Y1c0Z1?=
 =?iso-2022-jp?B?dGIwamJtbW1rQkxBVHVYWlNPWjRKNU84OU83TEVhVHdGNllDZEtIYXA4?=
 =?iso-2022-jp?B?T0xSenRwb3dJWlFQbXI5SXBTbmZENkJnODJoUDhTWkx0UTcrK1lOQ1Nk?=
 =?iso-2022-jp?B?UlBNQytabkNNTVhMTTZmRnJIcEc5NDhRVlczMDBSV0h4MTRsdjFsNERy?=
 =?iso-2022-jp?B?RllINktzSTNWbE03YVFpa3RKbGp0dFdTQ2JvQk50eWloZUNrWEJ2c1Z0?=
 =?iso-2022-jp?B?R3lyZGVhdjAwTmZGRThPbFF1aVZodUljNjJVb1IyNExaWEZ3MEZXcWlE?=
 =?iso-2022-jp?B?cmkxUmhTT29QZDhjVlRlN3F6Yko1ZGszMG16dy8vYmhuMDJsUFluRE1U?=
 =?iso-2022-jp?B?a3ZzQkY0Kzh3SU0wNzVJTzdBWEVpcDM0VVoxRHVrMkpwK1IyMlNheUpO?=
 =?iso-2022-jp?B?SEdNbmpTMlVsMEJIR1Nkc1lhdzVYYURlVTlaWlNGbWM1MDhrZFg1TzBP?=
 =?iso-2022-jp?B?dnZFdXdVa2xLeG0xT2g0ZDV6Mkk2eHg5NzVJNUlvdEoreTBHVU40dlFZ?=
 =?iso-2022-jp?B?SVNVRE5JTklpVENCeWNyTFpGRDJLK1dlMEppWnV1L0x4Mk1lZFdIZUVa?=
 =?iso-2022-jp?B?MHY0R1JYM082WGpHWFRKSlJRRUlEY2lhSjNUV3REb2FKbmx5T2tQa0NJ?=
 =?iso-2022-jp?B?YVZvM2pTYUJMQ01KaVNBUWVENnVpYzJpakxqdXExRGQ1aXR2UjhYN0ZQ?=
 =?iso-2022-jp?B?RWdUWEo5UHFNNkdZS25vTWt2aE41ZHcramRnSitJSU5yelYzV3JwZGp3?=
 =?iso-2022-jp?B?Z2k1eXVJaS9zcWxCTDYyRmx2QlpYQUkrN09ySWV5elR4cEh2a2J1cmlv?=
 =?iso-2022-jp?B?QXBUeUR6VWtNRFZYSGhZWnJWR1p3ekJ3TDdwK0dTdkljT0U0MU1MTXVX?=
 =?iso-2022-jp?B?WHhBSVBVNHZvSGhHbUZidENDRTNnaENTdGoyTXR1Rk92QUxzeW42NDRo?=
 =?iso-2022-jp?B?ZWg5TFIyTjRpb1pMejMzcFZkNFpaNHFsdlF1bEFjU2hEbDQzMisxdDlw?=
 =?iso-2022-jp?B?S1VpU08zSE5EN0xra3B5c24zdzVFOTkxMVF4NysxVEx1ZVZoalNQNzBJ?=
 =?iso-2022-jp?B?NzFVSjBZZ3g0Y1REQUo5Y1cwT3Y2bGpYeUJKWkQxRjNQblo3TFNWU3hs?=
 =?iso-2022-jp?B?QXBKVnRUdm1PeS8vQStLTC81SURmd3pjV3Q0WlZUbmNtNGFHN3RtWlhD?=
 =?iso-2022-jp?B?UUFucmFjem5yNUJCOWNUVTBTT3hWMVVVSldVYWVWbDV3QktBNHFneHgr?=
 =?iso-2022-jp?B?eVdrWGlSVHVlczBQZE92Mk51UVFTbTFxRkQ5Zz09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	cgl2/0QPOS/kQEr0VRrGUWSbVZqrfw2au+RLdEwIy07FgEY715Z7BnTwBSqSPRWm5ZGx5JEyBl7WZ2GFYluwFiwIobbsoTzGkmlkRt42XuOWAoJURD1DvTpW3CbgQgkde0gvjRGuTzo0V5GzaxHnAIk3+23CAd5omM2Ap/XeAqUi2TssrGj/yICcxbhxen9dekkJQWG5CKhUCyR/UALfAPyI0rKBbaxWVzUtTTQIOvpDQzBZ0/i4asO7PZdD00sffMTOD9L9AncXGmmhLPiVblGa1QnQtWP6Jws3D0cHM6DjuNvkbOiG0VvX+ko0sVWtzmjW08BY4veH5uPZjcuE8Q==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB16930.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f1bfbb-3e0e-408c-203b-08df24cd712c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 23:48:09.5438
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JScKx7pwQmHA0K81u+SjApzQGFf/m3iaOg5qz1JluSHHftwyBAQsgkOntAWXOnfBPoaFKHxGGYjJ+yn+pUBge/oT45XTRRkVicZfiDmZfCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9583

Hello Ben,=0A=
=0A=
It looks fine to me.=0A=
I tested this patch series on NVDIA Grace and there is no problem.=0A=
=0A=
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>=0A=
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>=0A=
=0A=
Best regards,=0A=
Shaopeng TAN=
