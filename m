Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazolkn19012052.outbound.protection.outlook.com [52.103.66.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D9D3B47E5;
	Tue,  8 Sep 2026 07:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854252; cv=fail; b=NI6qwYHBZxwBqD2ZN7c/7j/0mlYxdSBytKJt1YJoxEwxIsJQ8fUiGHkZrbMTevTUNI0gUGOrNyFs+WcIzfg7rmbEc94o0EGS6n/XTCjwhCdKT0oudGfGn50ezIXm169OCRmU7pRnQhYEViS8+8sbChLYjxl1eEgTJJWw4L8Bq5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854252; c=relaxed/simple;
	bh=ABCRoe37WlIOpISmUf+aRpQvI5l/d2O4pZr1gvy9X+M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=CltT/5donkj2cmfw3jRYvWSLZgK7Cu4oZmOhO5xK/gB5SLdkJ2je4Pjk3HLMTr7UfBVUOWsQlk0yN0b+QWdiD1SmPV+29MG7ySvxWv8XzVbKvFVJWzk/ZN24LyUeod3lBe/NfW7xX3ZPPYIz2H+GiXDUuCoeEurdwTgb7Di0ToE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in; spf=pass smtp.mailfrom=outlook.in; dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b=iCHj2s7m; arc=fail smtp.client-ip=52.103.66.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b="iCHj2s7m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XbuDpKubyEN+3X4ZupY6m1Vs5iq7S/+O+TzilU0KXGryHi67kpppnW4RI4zf7m/inZfe4LeYL1r+8SQV15cP2TolO0lliBY3q3U3akhwbuOIzabsELazZKIgZLkNaLwlg1C2vFU02p73jRB9X0umAtTPxu7477yrDVFszl3Hv7LYV/7rhDzhAtEyRIfgKSorrEaXGg9XZTdalHEk4gt6BgiOvflZXadJE5Ad9Uj3G4qt7Uck/VGFZvxtlF7nG4JIO+CyRYHsI/atkhK5z2T/9ehbkmjTgdNTiHMLebcq2hW+X+zwJFKazU/Fz0B9VC5KaJ8wkeuBjzRmbx7A3pqGNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABCRoe37WlIOpISmUf+aRpQvI5l/d2O4pZr1gvy9X+M=;
 b=hg9T/Y24TK83w9VY5BSW5IucQgDOExEWU04l2V0Pl794kdY3a2PxgQU2P4vgCnAqPIsXpurk3mEkHaCQJ1Juht/YebyCZffbS38J2yzXjaq8IK1siR9f/CpZHPlwmaBaf3iAz4LlLMDfkGuv0hrya2u7giD1UjazPouyeZHyNZSW3Kyq+oJjEEdAbY2+xZmHHzSecO5O9blv9kXNN6gxaw62G2DmPZJ9cLLz3+ArOmlykWlDg2iPn8KhXUbin/F9haZQ1ckIudE0606e9r4XLvOQ/8z/7kGhubQBymrZuRiSL06XkPe60+d1Oq81uTGcd3cQx6BCsVRcAWp+1b6QUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IN;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABCRoe37WlIOpISmUf+aRpQvI5l/d2O4pZr1gvy9X+M=;
 b=iCHj2s7m64tkPIWsHKkH/Tv8LxvNdZiDH63S89zbC0+/X9vtuSYwjXsX2NfwHGcLBSO3/qXj9H6ZkjTyDUmsv0dxOphhK6pZ8RydGbgykvm54tQ4Unuz9oCstmayFVFFA98WETBqDvNc0fuyl5LFyXkXhQsHzVhjTjQBXq/sQrch8kqHBntiz39P4AzJNwlQuiKGJ7Gr5+drr8c/stw4MgkEmZwDTDnz7iiSF5Vcrs/WSXaLVHFIUy+ZpKCiQmhodotf2AT8LxNkYJ1Y5d4u5fZIcaLggfK88MTAk3dHaUFkbuWt16t1GKn17Yn6F/0PCLAESmAjJKeaNLbiE+sPvA==
Received: from TYZPR01MB5131.apcprd01.prod.exchangelabs.com
 (2603:1096:400:334::10) by TYZPR01MB4966.apcprd01.prod.exchangelabs.com
 (2603:1096:400:26a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 07:57:25 +0000
Received: from TYZPR01MB5131.apcprd01.prod.exchangelabs.com
 ([fe80::8085:27fc:798a:5fa0]) by TYZPR01MB5131.apcprd01.prod.exchangelabs.com
 ([fe80::8085:27fc:798a:5fa0%4]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 07:57:24 +0000
Date: Tue, 08 Sep 2026 13:26:31 +0530
From: Shujath Mohd <shujath@outlook.in>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
CC: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_arm64=3A_dts=3A_qcom=3A_sdm?=
 =?US-ASCII?Q?845-sony-tama=3A_Add_battery_properties?=
User-Agent: Thunderbird for Android
In-Reply-To: <5enkadptjkxm5mmjjwtqehm4futxejzwewevoewlpeedjhszbb@dsfsfewasuiu>
References: <PUZPR01MB51418AF84C1FC5F640144D57C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com> <5enkadptjkxm5mmjjwtqehm4futxejzwewevoewlpeedjhszbb@dsfsfewasuiu>
Message-ID:
 <TYZPR01MB513102932A34B982696E2AD2C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MA0PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::20) To TYZPR01MB5131.apcprd01.prod.exchangelabs.com
 (2603:1096:400:334::10)
X-Microsoft-Original-Message-ID:
 <429BCA35-2194-4F43-B71A-F56B674F73A4@outlook.in>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR01MB5131:EE_|TYZPR01MB4966:EE_
X-MS-Office365-Filtering-Correlation-Id: 6750b877-d12c-4585-6494-08df0d7ed131
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|6090799003|23021999003|19110799012|8060799015|51005399006|15080799012|5072599009|24021099003|40105399003|2607281247196008|440099028|26104999009|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TC9Lc2hkTTNhQWpmM1RlWEhnZVN4b0lJSGEvdDE0MU9LUEdYbk5JWVVEUC85?=
 =?utf-8?B?cXY2MUFScHlZSXRaekx6elVFOThMeUNqQ1ZMUHpOeFlEcnk1N0Rkd0pRaVpI?=
 =?utf-8?B?Ui93S01lMzhVSVhlTHA5ZzZBR283Z1dCY3FhZUMycTVOK2U1TTdnblFxTVZn?=
 =?utf-8?B?MWtVc3JybWxYamJ0RlVMcUhtRGFzRWw3SXMybE1MOXdMYlArcFF4c2V4elly?=
 =?utf-8?B?cGhoR2FxbUZZQTRxTGR2NHZXd29HS2ZjV0cwOTNNZFI1OFRYdjNHbTRzelRj?=
 =?utf-8?B?ZW9EVGZ1ZVNFQ09pck1ReFdBWWQyT01NOXB4VnowVHUzUmdjZW56VjVUVi84?=
 =?utf-8?B?UmIrMWVVdENTUnlYVGhqOURUQnBRYmNnckVPeXhHSWN3aDJkbmtqTElxZGox?=
 =?utf-8?B?MzRsMVZhaWZyd3VvM2dlUVp5QW11TnBEMU5XVFRvNFgwVE1aYUliaTVhU3pX?=
 =?utf-8?B?MGV3Rno3eGUvUHFhMFRvZFBIN0Z1VUFhbDEvTWlkQzVIdi9IUDQ5Zkc3Ui80?=
 =?utf-8?B?MlNMZ1pkMEw1NTVBVnNKYUw4VXBnN0xZTThLTWRqazdFak0rTTRjQzh4Rkps?=
 =?utf-8?B?VHB5alBGSDhaZDFUZkp4ZmFuN1N6YzJId1pFczNZTjRIODkyM0h3UmVLNzcx?=
 =?utf-8?B?RWlrcjdEUXZOeEVUN2RnUjZhc1lVRW9Ic2kwa09DY0V3Z3BELzRGV3llOGc4?=
 =?utf-8?B?cUR4TEdDUnBQN0RkaW52bjJURlhYOHQvdzBVTGQ4Y3hvckJLTWY4N0JpY280?=
 =?utf-8?B?V3NnUU9vSjM0NFJ1cHd2blBzU2FPYkk5Q05jajFzQlI5RG9WbVpzc2ZtTmta?=
 =?utf-8?B?cTY2MWNhWG1VNDFVM0Y2dXhMb1VzaSsweHU5WXc1OHArVURRcWlMeDh4Z1E3?=
 =?utf-8?B?Mk5sM2RBeFBmaWwwdjJSNmdoMjBiQUIxVDFWcjV6dExqd1lFU3V0d25kbVBW?=
 =?utf-8?B?RzNKZlFsVm8yYUZTNThZZ1pUclRUV3lWYVVGU1lxclFIQktReGlyTVVjWGhs?=
 =?utf-8?B?VWVwNkw3UitHWXU5TDdMN2hBWCswcnhERUdFVDE4dWVyTlh5a05ZcHVyS2dY?=
 =?utf-8?B?anJhMVNqdHVQY1NZQWNsb0VWbzlTdWtCRlFYOWl3TjE2WlZVWFhFbXBaSE5L?=
 =?utf-8?B?MFd5dCswM0M2OVZ2SmRPTjBYRndtK2pUUU5RZDJKRUtXenpGVURzWmk0U3Vu?=
 =?utf-8?B?cU10SWd3c0xLbzlDY1NJUGcrZnhZOG1rczZ1M1pnakF6aWRHMFp1eWM0UVRL?=
 =?utf-8?B?WGx5eGJ5YjR1ZDFKNDlKMUxUbzkyN1RpY1pkcW5maGMrdCtzUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTJYcFNDNmxRTStFTGw5cXFGTEE4WTRsL2VCMUVzMVprMnIxaFNIZlFvb2Ft?=
 =?utf-8?B?c1hYOCtJUkM1dEUzMUI0ZU5kTWhMaVh2c21jQmQ2RnpYd0VyTCtYbGJCaWdv?=
 =?utf-8?B?SzR5UUIrckQvR0pMenlCQlFrTG5WK3JwbktvSXZjKy90MEZQQjh6MkpiSDNl?=
 =?utf-8?B?SjgvcU9ESHBQb1hybjMvaksxU213L0hZbEhvMTh1eGkrMU5jbW9zK05aQjBB?=
 =?utf-8?B?cXhSZGFDSzFjcjNrSXcyRTluSXNDMmlsOXhMNzVuVHR4MGtqZnVPVkpGVXc1?=
 =?utf-8?B?eFh5NFVPcDV5cDRLZ0YwcFY3QTZUOW9xeHpybDdFZi91S0F4QlJoNlRHUU1X?=
 =?utf-8?B?VndrYXM2d3BYemQwR042OGEvbnEzSmNza1RwT2tYeTIrWmE5ckNlYU1oQUk1?=
 =?utf-8?B?U09QYU5tWHJRcnE3QTArWFMySk1xVnBZQnhqYWtHOHlyQjhWd2JLTGpFRkZQ?=
 =?utf-8?B?Y2N4NkJMRHJLMWp5VGJPbGsxdjRvV01hZjRiQnFSTjEvYUlUMkRHUExsbTg2?=
 =?utf-8?B?emgxcEpMSmdrVFczVFk5aVBLWUpvNG1CTVhyaWY2aU8yTVBXd2N1aU9HSWR2?=
 =?utf-8?B?Y1FlaVpTRC9tRjROb3ZiZjFhRWNPVytQeHlPWUtCUDdIRnA0RElJcjYxekd5?=
 =?utf-8?B?Sjd2blVLb1RHMkdiWnZTK0tqZ3Z5Mzh4aDFYNHJVOUZVMUZCNms0ZlRBdlJ4?=
 =?utf-8?B?UzViU3pleDlwYmx4UUZ0MmRacG1MdVRuaU1BM0l5b0grc2dKaXRrdmdaN2wz?=
 =?utf-8?B?M2ZoelhqWDB3TVZLQXhZL2FudGpMMlJ4RVZsSE1wM1ZUNVlVbG1kQWNtZXZM?=
 =?utf-8?B?eEJLYk9JdWhVRXBXQ2ZucHFlRDVGRHhCNVZZMWoxdWd0NmpxdU1uc0RJZjdp?=
 =?utf-8?B?ZnRQOUx2TWloTkJUTkR2Q1haUzVFbFBpVlg3UkxVSDlBbkIyYVh0WXNJWFJu?=
 =?utf-8?B?RWJ3b3RYTC9lb3F4N0d1MXhicXdxQWV4Z0FhaFRta3hLTWgwQ0k3OGVENjV0?=
 =?utf-8?B?K0J2YjgrR21URDJUelBRWXZsVWhiemFEVWIybEh3MG5vWjVGcTdVNnNJQVQ2?=
 =?utf-8?B?UjNNbWk1ZU9FeGxMTlQ5R2N3eE00RWRIU0x0UWJ5TkRINXNQelVCdk1iOHhs?=
 =?utf-8?B?MktJK0dxNWdmcGtydlh3S00xTjZ5eTRLZWd2cVFnbit0NHowNm5OZnBDY01Z?=
 =?utf-8?B?LzZYR0V3Y0JrTVpQZURXdkM4YW5PM2xySmwvTHBuUnRBWHRIUmpmWTloOW1F?=
 =?utf-8?B?WUR5dnRLdVRON1lGbzJNdXo5Q1hmK3VqOXJaZWJTRk1iMXB3bmZXa25Qa1ly?=
 =?utf-8?B?S1FtcHlHOTB1RlA0V3dJT3g5cE4zRHh5U2lGTE5YTXA3cjcvblBSQlFFb1Jo?=
 =?utf-8?B?RWJnMEFOeDlUS0FyQ3dHZytqNmpSVS9NRkhpTDZ3N2NOM1JMcjVNMUNpWjJE?=
 =?utf-8?B?Vk56aEF4bWprcC91eWR0ZC83d1gwOFRXMFVYVHRzOHNONUFZK0ozc1JzZDR0?=
 =?utf-8?B?VEV5QmZMMmt4TW04UnVVZXg2bm01N3JxS1VwMDdRMW9hN1d6MTdtZXNEV3hU?=
 =?utf-8?B?dGNNOUxpeHYvN2NlV0hsWTlyVUZXS2tacDNnQmpJdFdoL2dROG9LM0p5ZVBT?=
 =?utf-8?B?YUg4eEpyWjkwcFN0MENyb1QyMGN1UU1wV0JTWWNlTmtRUENRNEE1Qk5yWVZi?=
 =?utf-8?B?NXdaN3l2cU9ldUo5K1hNUjF2R21jMmE3QnY0UzNvaFlpdUx3cVY3b2Z6MEVH?=
 =?utf-8?B?REZhbkU2UG0xTzI3dzJuajRtQ2NpbEJ4cno0SmRjOW9jWmNnaTFKdjhaMitN?=
 =?utf-8?B?SGR0Z3JkRmhWYjNBQXBwOFRjNnlsdDZQWDBZSHRqMDJjUXpCRi9VazJrM2pQ?=
 =?utf-8?Q?Cpp9QINl3pzx8?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-3e488.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 6750b877-d12c-4585-6494-08df0d7ed131
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB5131.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 07:57:24.2408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB4966

Just the commit message, nothing in files

On 8 September 2026 12:49:24=E2=80=AFpm IST, Abel Vesa <abel.vesa@oss.qualc=
omm.com> wrote:
>On 26-09-07 21:33:08, Shujath Mohd wrote:
>> Add simple-battery nodes describing the design capacity and voltage
>> limits of the Xperia TAMA batteries.
>>=20
>> The Xperia XZ2, XZ2 Compact, and XZ3 use 3.4 V as the drained
>> battery voltage and 4.245 V as the fully charged voltage.
>>=20
>> Signed-off-by: Shujath Mohd <shujath@outlook.in>
>
>So what changed since v1 ?
