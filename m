Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DFE415F08;
	Mon, 14 Sep 2026 10:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380813; cv=fail; b=OCNQvr2XdrQAMVhRJlBPRtfwjKBcs2NPBDUA4eODGYMgX/uaMb/8GR7Xnzj5++oTpWtJf40rJZiUzd3VTVIz/Tm/CVnTFXrXbDqvYyxJxj/kintGMeOqpUHcjyLEvVTx3ZLRj34TBoRscSvypE6ERsUiT6V1jZSLOnalnUuAbgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380813; c=relaxed/simple;
	bh=Vvb+RPQLn2QgVgfdjCJlUZG2+8hXsrDRAW4N4s+Rolw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TbODKgEPZ2DZUOZO4uAafNQnW6gbdD9a/eMbF/aRXBQ4GBlr10SeGGv+Cvl6JkNQaWt0Eqj7Uk8B4Parj82NNiwv5+hXnVGFVZIDmMgJe/dzTrq3hhP11jY9cGZf8YKa4nPG78jpReRN4tfsuu+GSrHP3IAcEc3/a0YwAbIuSis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=B6DdCbgj; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="B6DdCbgj"
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9mC8l2814634;
	Mon, 14 Sep 2026 06:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=tsKFl
	gOSa6TNRBqhh67BZcvTVi6kg39S7Scu8Z0bOG0=; b=B6DdCbgjS/smKbiMEIwKM
	t2HxFjT0PWApi1YQXljUKYTgY4C9xMADlV+LGgE3ZhlRujM4CBpKUrTTY/6slj3J
	D4Oi5gnRhu+OLbC1zVk1W9SnuZPI536wBsroZQtIa39aS/WwxhrjYA/NnyPi7i6I
	SlTmP+kWdbzn2vVA6oeA03rYcq0JWR3/obR1q7diXpFjHp5w9htUUs6wkxVApeh8
	WZ/55dkoEx/0BHylpY/KXMGi6Jcq2+4TUHybAWyAAUheyjEkzU+HAaQ0jEDMuV+I
	rE8/pxP+rcGkZHZ1i5QPzfFumm7BypDfuGejoPxjlUeLTEDLSDFs+c4Loa7N8Ozr
	A==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013047.outbound.protection.outlook.com [40.107.201.47])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gnrsfk743-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 06:12:54 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHw5D6G9wzIl9doNf1AJFjOZ/Hz2EpiAUe91jYIVy4uw6AvkU0vu7iA8wx6zOH3EFT9GEn06nPZe5yG1eV17mEszC4SOICXtwqX9GgXuUBl9VVHHwIJFmK9oOQfIcSsFLOQ8fB65zBpe4EeiQ7SUzRfTNYcO7eO0AAkcacYJQ1hNTDUDZXaWg5lq0PJ+QV41C/OVD/axs53y0h0/79uiY6mV+te6eVZ8OSShbIjKsmpDaIQ0PY2Poj1m8MMJUq2bMkOIsII5GMQoKFPAiJ3EFEUKfnpvoyRQC/diPjJfClvujncqnJQX2cE130Wmjlf2kRO3BBp6Fk/eSa4DO8l0VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsKFlgOSa6TNRBqhh67BZcvTVi6kg39S7Scu8Z0bOG0=;
 b=VYsbovXbTmOvpupxAx3+5v2kVcr/eWrL+zVfCtvTu7bJ6bS2rQplftdZF1//IaxGve1qWL6v4FDvi0YwTnNZzaBD9zilk/wcqmksKqk+Yt+OBBf1fjVudo69//yuTMKfzCynOVx2AvXVpcZ1iQ67PJbiLlXkkuvPq4wtEiLVcK2lWZd9CbXlbuJtWU47tnfKo0bADdWTK0gk/mB1YSRilV/dEEGyLNVYcqLAbFr9sL6w2C/AamBarHxAF+yMlY1qASi2osErFt/RL5uFwfu9xw+t6n47/p/IjZLZPZeOAnOXvO3Uqw5xUD+Driwvz8KHL3AO+7yT7njZjgNlGv9V9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by DS7PR03MB8243.namprd03.prod.outlook.com (2603:10b6:8:262::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 10:12:53 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%3]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 10:12:52 +0000
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
Date: Mon, 14 Sep 2026 12:12:36 +0200
Subject: [PATCH 2/3] ASoC: adau1977-spi: drop __maybe_unused and
 of_match_ptr()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260914-asoc-adau1977-fixes-v1-2-aa2f0cabd728@analog.com>
References: <20260914-asoc-adau1977-fixes-v1-0-aa2f0cabd728@analog.com>
In-Reply-To: <20260914-asoc-adau1977-fixes-v1-0-aa2f0cabd728@analog.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MM0P280CA0067.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::34) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|DS7PR03MB8243:EE_
X-MS-Office365-Filtering-Correlation-Id: 073db4b8-d52c-4df7-1afa-08df1248bcf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	joVz+cZCpNlXFb83DLT8tjdgRDm1lB3J0V++YEdInP2ggs6ec22jPyMX+dS12cDmSyD5TjreE/eToW3B5VAiQcRTZ70USJS3rVbfsPEhuziyxb279BtgGLJIamhXjVZQ12O9bN/MWJ+MB8DB2mJw7g0wpM0PWi9sfvSBdVise9MqYMq5fs5orvTBxBxaEh7GztEMJoAbInKt2mTEm19DKhMiZ1ZfXAwRAopbSZpujKUtGKho6Tqj0iLHBL9xhlhYJiFQUqkl9tiKI1fI5GoDUmOF93rcyaq46zIIA7Ku+WpwwvhTUabR22RUypg1eqzFM4OZW1D0qpZPG0F8fsVxVRI8nDDmz4WC3DhvvhYd3Sjx9T7jR8USNUTOz6pG5FO3YLTsgPKZSa/rOidFbtLa5+NqrWT6d/WWqJrxEum1VyN3NJ99jyYfk92IzPSxwJvhRiyP5PO46DstBprmRyx36vMtmJeusSMVySX7UvTI5VP94aVW4ctSBRM4hOnlSP3gsw/tRDU6XGnRs5egqyaHr2A+OjaGMYeQqJ0cx2Wo6DSw6edj5YkuPkurLjDaxbrePypFfzbG8uQmfZZRRqipPI4NEgVb2CeoG0S2s9oQmJf32gSLcbnFOYo3RJ/2UqW6H0f37TCM3xqj2Tck7yrJsHAhbR5AEAdnEViA1SNWA7c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTJnT1paZ3laOE83cGpLN0NjTllUdnJ5MkJLK2dORE5obnQ1L21NY1BMMkF1?=
 =?utf-8?B?RnVEZDZoUVJNanRaZGdSOENKOFJKdXVZQjJ3MC9mZWFMOU1aWE82UzdWcmp0?=
 =?utf-8?B?Snl6d25JcHdPajJlS1d0eklNbExaTHQ0RTdELzE1RDFLUDZMTnhJQ2JtTHlQ?=
 =?utf-8?B?TEovU2VWRy9QMHFiN0FvSlBacEVFRmZxTmVvOTJIN2s0eUd1dWtnU0RtQ2tz?=
 =?utf-8?B?NmsxQTVIV3ppWnFPeS9mQzdhR3F3dHJTN0ZqcGd3S1pVOVRsd0lZbSt2YzZH?=
 =?utf-8?B?TFJKT1Y2dVRsUU45Q0xUQXg0UURtTUFZblBNQmZLNWdwRjZJbFdtdmFxK0VC?=
 =?utf-8?B?UmU0eFJIeGN6aXVKQk9jZFltODJzR25yM05aRDBPN3JDMWxxVkRGNHVONStL?=
 =?utf-8?B?SEozODhvSlAxaExlcitBSnY1RHhsRjA5M0NXMjNIOHpycjRVdllLMU84Sksx?=
 =?utf-8?B?c3JMZFdOcGVBa2Faak9BbWRQdk9zSS9wY2dxTEFIYytCdnR4NkRZZ1FiSTkw?=
 =?utf-8?B?WDU5Um9GeGxncXNGR2Z2dHFkTEVhQ1V4K3B1NE1LbERtbXB2Y3ltUVN6TDFx?=
 =?utf-8?B?d2t0NGxlQi92SnFzaFdRaHp0WFVRL3h2R1k4bVNqdnM5NmNPRk9SbXJnODA5?=
 =?utf-8?B?cmJBcGFBMVRFYmNzM2V6U1YyTGdwWm5ZY3NFSkhBZ3ljRGoyRUVrbHlIK1Vp?=
 =?utf-8?B?bnNBS0xHK3hQRk15VGhLL0ZjdVpLUFZHT2NZZERCL1p3VXU5VENnVWRGRy9s?=
 =?utf-8?B?TFdlMGNwc2gzcGZ3bXR1UFpuV1Z1OE8zcTRlQ2lIdTI1QkZUMHZVZm9wNEt0?=
 =?utf-8?B?QlBVZzNQbS94M3ZWRUNzRmFpamtDUUVIbkVycnJydlk3Tld3NGRaYTUrUWdw?=
 =?utf-8?B?a2drcUlheisyWWVETVB3OHlveW8yV3FScjFrazdRclIrdWlTeUN5aWI3aVNr?=
 =?utf-8?B?S211WlNmSGZ0bEdBMVhNbHdDOXdHQkc1NVo1d2ZGRFQ3WFlZdUtMditaMkcr?=
 =?utf-8?B?Z1ZEQXNOdUpXUUs1ZzZjSkRVL0xFc0hzQldURG4yZWo4Tk5nL1FESGNTMk5B?=
 =?utf-8?B?cUNlNDV2Ry9zVUFRellwVUNlZmxKSUZyajc4eTJJQk9maTRGU3BXUkhnUnJG?=
 =?utf-8?B?QUl6aEc0ZzVTUGxSanZXc3BxZzY3bTlVVi9mdlRWUkVaeEdvWXNSdFI3OWR2?=
 =?utf-8?B?V3JaajQ4SWZBck5mZVhtNWVML2JJZGtXQ3R2Y0JSTW5YeThNR0RvcUlVRlVy?=
 =?utf-8?B?Q3dnRE9jVW5LMHRQV3FPN0ZnOUt6N0JIMXJnNTJvOU82dzZNeWVJMmdIV0Ju?=
 =?utf-8?B?QnZQQmhXWkVwNVNIcXI1bVRKRDIzNHhUUXIyOU05N2JWaFJUL1FkR0dqanZR?=
 =?utf-8?B?NXV5L3dXQ2tlbHZ3SEJiY0s4WUkwTmwvSTRRcWJTbGhhSi9CTFZkaG1FVjVw?=
 =?utf-8?B?NWRXaU95U1MrMklxalFTWWVQYkVXK2Y1eFU3NGJZVjlUR3dIL1VlZExzVEk5?=
 =?utf-8?B?eS9FaDlyUHB1TEk3eXRham43ODJESmxEVStHVXVJUk1LQ3lGeituSjFyMURC?=
 =?utf-8?B?ZVBjSXM3MTFoSy9nK1hRaTVyMXVzVm05WTVpYXVkcjNZQ2V6WVhpRTFMcmpv?=
 =?utf-8?B?ZTZGWTZOZGZsNDMxVU9ycGNvTUlaVHpvRTRsNDA0elZ2ZHpCRTJCWm9NQXcy?=
 =?utf-8?B?cEJ6T0p3b1pFTHBhZ1hGaVIrK1BZZytHMm1qc2NST1RIeDVsNWFjTG9oZ1Vt?=
 =?utf-8?B?VTFHTW9tK1plVG5XQXE1aUhQbzZTV0ExWmlCWWp4VUh5ZXd6djh2VjN1UlhV?=
 =?utf-8?B?amMyaS8xK3FqeTR2T2xEeFI3MVJ1eGF0WlQzSlBWTGZMYWw5VmNoMWI5Skov?=
 =?utf-8?B?a1ozSWZteTFRUzRxWTdocE54NlNrU1cwalVyVk1qcnpMcGFBZ3MzekJReHEy?=
 =?utf-8?B?eTljRjJPamtwMzVpbjRPeURkWmRPbS9MV0tNZ2hXWE9BVWpCdjhPemhiZFRX?=
 =?utf-8?B?RU83MUtVdmcrZElTSlRIdHNIUjBsZlNva2NsVkFOR0s3aGZiV1k4M1I4bVo3?=
 =?utf-8?B?MFZBT0xLaDZScklYMkJUdTVXbmVuSzVnMmltcW9DYnJUSVNsZXZacjJsNnVJ?=
 =?utf-8?B?bjdWT3BsWFk4UjdlN2QybVNoSnp0bjZFL0lxcFJlaG9yRERBZjFWaG8vV0ZL?=
 =?utf-8?B?eVlzcWREV3FhN09JbkxQSERNcjdMT1RvYmlCU0E4ZUxBWTlHQWtNRlFFTXVv?=
 =?utf-8?B?NXYyNHJSOGtmbGpzL01JZGMwMjZjbDIxMUFZOUp1cW1aZCt3UjY3SFd2aWRm?=
 =?utf-8?B?c3pmUWJTTDJOYzdaL2I5bTljVFdTOW9UNnplNlNQVmtnN2lJcDUydz09?=
X-Exchange-RoutingPolicyChecked:
	pTt6AJizon9enZ3Zg8Uy5MI38B0/DGSHBzsbf9RnHVor0/hcMBypcV6+i45AqRrmskFe08/q96pM7GsiY0P+5A/kET48EmlHnIRB8ePyhE9JrWt6tpsmrjW3r7ki5DFq1ZA/j4IKSrLcqx7MHUYHZUZaH/hw1L3GaNcaNg7pJe3owlIT8RY/BVX0eaqjTDZQhFJNUkmFjHSQTD89ZyJwO0IhVUw9wCpC3LrBqpFKWKJ7UCRhlbentnyBxW6eVU/ysWq69pHzoSSGz1Rumm1yP/KKDBB92yejbNqi2lcPpA1CqanA5ObEadaQwiUVlmirbjuQsi8mbi4OFZ6oKj19QQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 073db4b8-d52c-4df7-1afa-08df1248bcf1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 10:12:52.8728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P0wQANGxBqeIBg43Wbr2NKRRdFitzIkjQg2an7tQAhmGJ+FOwx0wzUIBdhGUA7vMDpZIKU7O2pHeo5OLAZJ7rWprT5f+WKYJrkzlZiMHr18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8243
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0NiBTYWx0ZWRfX9kyCwbavc5sO
 bUdwQ4IkYdOOl/ehuWHnDujm+sxlOP5XaRlYKac9uGlxOi69551stHdujikO1XggNThb/wS7s7W
 4b5JRs5LKLloIWFxaqOiaygmO44JRhT4ZZgjgt1sIMflrfQSQtpN
X-Proofpoint-GUID: eLmOYxCgid3NKkXt2ICk0jIqTX8xCT8p
X-Proofpoint-ORIG-GUID: eLmOYxCgid3NKkXt2ICk0jIqTX8xCT8p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0NiBTYWx0ZWRfXyHvCY4y15sCm
 uMOJ/VrjmMo3ekneKMLdXCmzg9Ojf68bcPjrU0o7XCLusGwduD0tsZ6ZnBtBns9Z8YzErCim4aC
 Q8StfDuqzGBnkttpPLxGYXXkBfUp60nxLjlJog7cFKx6OxVn/BNSWmYaF2HTEwFbRfy8z41yQuf
 HJCuYtjyTeaJTK8ptZOk65TKtKnLsxFeWTA5a9YHJPWpGZxsweMcUEodOLEzMkhN0bQuz0UezDS
 u+oiHB5uxOQaiv2QrBHG8zw+MRyPc5xcJoKkfCcqo7tbQB8yH0BOaMjVdKd1mi0CdbpewDTnwVx
 PQUwUdSHO+c0tpw5OLAYOmfXHJqqKkM3xsiMNwsyXZZaL2vjlwiJFzZsjcKLXce/73+ccJpgadp
 iaUxmTOp3SVk44grvkr0Ut5SFrqIkzaNLVq+wt/8Lm1IMfeBGUvPAhuSmwepTgjda8KAL+iQOwB
 uIgRBOHCcNiTvV0PO+Q==
X-Authority-Analysis: v=2.4 cv=IKqXmQvG c=1 sm=1 tr=0 ts=6aa7c8a6 cx=c_pps
 a=2P5E0MqkZ2zb1j7CzKDU6Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=iZSIUCweCk2Oy3QsdGPA:22
 a=gAnH3GRIAAAA:8 a=UXg5lJFd8W1Xsh1bpr4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140146

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a match table and
the data isn't discarded by the linker even when the driver is built-in
and CONFIG_OF is disabled. Drop the of_match_ptr() wrapping so that OF
matching keeps working regardless of CONFIG_OF. This also means we can
drop __maybe_unused since it's always used.

The entries in adau1977_spi_of_match were also erroneously indented with
spaces - replace the indentation with tabs to conform with coding style.

Signed-off-by: Alvin Šipraga <alvin.sipraga@analog.com>
---
 sound/soc/codecs/adau1977-spi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/adau1977-spi.c b/sound/soc/codecs/adau1977-spi.c
index 878cde9d1014..c98da5ba9e9e 100644
--- a/sound/soc/codecs/adau1977-spi.c
+++ b/sound/soc/codecs/adau1977-spi.c
@@ -53,18 +53,18 @@ static const struct spi_device_id adau1977_spi_ids[] = {
 };
 MODULE_DEVICE_TABLE(spi, adau1977_spi_ids);
 
-static const struct of_device_id adau1977_spi_of_match[] __maybe_unused = {
-        { .compatible = "adi,adau1977" },
-        { .compatible = "adi,adau1978" },
-        { .compatible = "adi,adau1979" },
-        { },
+static const struct of_device_id adau1977_spi_of_match[] = {
+	{ .compatible = "adi,adau1977" },
+	{ .compatible = "adi,adau1978" },
+	{ .compatible = "adi,adau1979" },
+	{ },
 };
 MODULE_DEVICE_TABLE(of, adau1977_spi_of_match);
 
 static struct spi_driver adau1977_spi_driver = {
 	.driver = {
 		.name = "adau1977",
-		.of_match_table = of_match_ptr(adau1977_spi_of_match),
+		.of_match_table = adau1977_spi_of_match,
 	},
 	.probe = adau1977_spi_probe,
 	.id_table = adau1977_spi_ids,

-- 
2.54.0

