Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011015.outbound.protection.outlook.com [40.107.130.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72752361964;
	Wed,  7 Oct 2026 07:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791357398; cv=fail; b=BCu8ZqXZtYkvIen1eDu/wfz7qPH5a6F6i8Iy/L5On+Zfls9ZC32YfrSuYJl0v/Helf6NsK839mS50Ioa4UZ51MO6gjtTmTnmIOz3htAFPwF/IQUvC9DcIPBUzJfhA546h+boEYAgO3AgmIWXYgJ2ZwBkO8ZJhsuGZInxWL97gn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791357398; c=relaxed/simple;
	bh=BJk9FptdLyGQE4SxtOivNcKm7/zL2HBfK60lWYtxWxI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Tzd5njDDUKGAXHy3TLhOuOWB4VcEaR76xXn8M+w8GU16Er6/lxTKgFdDwqlezm+Sg0yA1Ahibn6XlJlatToAJyNjxjmcajHhn81bxcEsxxYHzj8WL/bDgfo+LKYTqxFnZQk6P9QVGMYHOKiv/rSpNswQX2J6CUNggDUOdl8i/q4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=h7AyGos4; arc=fail smtp.client-ip=40.107.130.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="h7AyGos4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFkiQG49F+QS6gVuXjzN/LHEPIveEtYOugZjapVfJNsG0qfyqB4/FxB0dgqyONsYYCXFX+ml5k2gAMFNLCwBqyAT09UliwFK7+n4M6wr6rAOxqFi5yjue+hW9d4swb8a/XJ2fMnrix4lH4yeRNpVmXOzYHaIN/MGwW8HifCvAaImHczPfcYgJJwUeZwnfrjBBs/rwu9M3ii7d6ZPdQVVXdiYklF8fwij4KOpgAq5fmFw4puBY75aIHtN7azNYfMXrNMXSEtFj6nI0e0bf6tKs9PqY++rbofJsZPsTuLwITrSMWKgpBqz0/3AnSwsfy3zXlMEgDFbxmIcl6jo4zU/nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHeuMxTuJqZn1zGccXkKFl+IyCRzhnx2xP7y7UTEPRA=;
 b=WbYHIDKOnbsOTGIChefyBcBlQTuNBUrUAD68j5P2pP48H5qK4Hfany0k0L2tJniR+5lkd62qXDkS5APqndLcWLAC6BOJZeO4GpuuV9xQkJyoK2IlvyjS4nwUD20yLvh46dDGLb4GAii6mvIwlbT54HR3vwVgJG76eTYjOzlxglA9HmR2tqK0QiUGrh5cbv49E0/A0fAfo8koj8Li0Djm6rTlaNsvYOkI3td3h8Fazqf28iWKcENlLhK/tAhPoJfNW3ZDoWIhIsoK1Qgk6JHNpZ5FDI9dN4xVrT5djYwtjs/w33uL0T96RYwxuqU2VYE+ylBeuhe0n5OKQN+MEMnpGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHeuMxTuJqZn1zGccXkKFl+IyCRzhnx2xP7y7UTEPRA=;
 b=h7AyGos4dDbtUeWai1MuPn/reA0yMZsmdni4IXAN6FbGrNTtOZTG0N33f7L64aWU4HoTjPXmKA0diAS7LLlJLJ3EcY0wr9ISGTqnRIrd4VpOE37WQBkioMCSmxvVGNdzyWxHxahkMnKkRKqIPMsht6tXUQf/9PiRg4VU++SFV84KU0Rg7ntcVKivbz7AkUzi8/Qi79Pc315ytXuXUHy/7ilAo0uPl89/5dOqxPTh9aPinZihFJ2GHp7cG314NGF9xiyFa94ufLP4psc//ZS562rUumY7IItVP4+is9TD32kdVasWBD+EP50k9AylY4a4gaUN+hdsFOGHjQVobV4nTw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by GVXPR04MB10539.eurprd04.prod.outlook.com (2603:10a6:150:21f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 07:16:30 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%6]) with mapi id 15.21.0472.016; Wed, 7 Oct 2026
 07:16:30 +0000
Message-ID: <cd0d4f4e-f3a0-4849-ad93-09dafbce1df5@nxp.com>
Date: Wed, 7 Oct 2026 10:16:27 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: Re: Re: [RFC PATCH 6/8] media: i2c: ov2312: add Omnivison OV2312
 driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Rishikesh Donadkar <r-donadkar@ti.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, tomi.valkeinen@ideasonboard.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, kristo@kernel.org,
 mripard@kernel.org, jai.luthra@linux.dev, jai.luthra@ideasonboard.com,
 devarsht@ti.com, y-abhilashchandra@ti.com, tomas.babinec@nxp.com,
 daniel.baluta@nxp.com, Frank Li <Frank.li@nxp.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-7-r-donadkar@ti.com>
 <e469d168-39f9-448c-a7ab-5d02b79d8cb8@nxp.com>
 <asSk9KW-lzuiUJa3@kekkonen.localdomain>
 <577b34a1-4c2f-487d-a4fa-e7ede2b60091@nxp.com>
 <20261006153728.GA622105@killaraus.ideasonboard.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20261006153728.GA622105@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P192CA0012.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::20) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|GVXPR04MB10539:EE_
X-MS-Office365-Filtering-Correlation-Id: b83f1eae-a8b5-4274-6b3d-08df2442e8a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|19092799006|1800799024|56012099006|11063799006|5023799004|4143699003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	wk8SMVdGqOfWTALW7PJEnbTLceMxLGKE3dUdqoTqQa+iOu+3IDLGhEqKEu1TwentN1FM4gOFlz01UukNb56D5FNEeMTEfHobKG72L6XGCzX0Al+pn0i8IGQQonMaH2v21XCdmBy8HQp7EEWMWR1+fv8GhypaYkfisJX2YSHNlZElukn3fflRw7z7Meu8k48CzwTDsSlrijlNRmZLWwEFSL4NQ5/ywjOswfb2JFukRnFGpRSxYx3m5Lr4Ga+RAhEZW/ykTUUijtdxnJkYvlD6qXYGl1gNs8yOej79yTSVcS75hNrayal8nKPWJfDyqVYc9bd4NMbYhrGySu/gHAXLQWVrzZ7AcW40Rcclut3zYBEME6TrLFNEVBqpVHXw5ouxlJ/xh46tXc9WYjCNEDHhzo7LfeMPC5wD/l/Jz3em/Ro6yQuhJ5tKwxP+2TVfct/LZUgJHgZIvTGmiJdhGNt7vRsEdgNFUHWyygGxvTrAUn9qVPHoX2dTE370WP64CeyHH8l/6A0SN/JY0evXcBiiGH+BlfE+VhYnLZ3Z22CoF89OrU1FJvO0p88lk0hIp7FWEk8ExvC0/flbFnU8u9kPZ0ead6olcTto3d7b5wV6HqlYPvcIwqYVg5naOUIczz1oLhzvv2MRNQaT7In1TDnlaqXKj/oEA5j2x7B/JgnXUnY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(19092799006)(1800799024)(56012099006)(11063799006)(5023799004)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2xUdlZhM0toWngyZGN5MkNFd3ZMRjBBMFo5RitGNU9LajFaWjhCL21yczJs?=
 =?utf-8?B?R2dMTENDU0c5NjlKRXNxSDduY1RoNThUY3d6SSs2ZG1sYUc0UXd1V3RSa2Zt?=
 =?utf-8?B?Q0hJdmpxVlA5dDUvRTYwUXBzVEdSVHdwaEZHYWJ2TFBKaDFIMHVONmloYTNO?=
 =?utf-8?B?UXlFQS9pWnZhTmhRcEVYOWg2czNPNmdJL2IxbXlKblUrNWtaeDFXbkRXbWxr?=
 =?utf-8?B?eHFzYWVNWWlOcHNIcVBKVTM5U0hKVWdhRS9wU0tjTy9NQkxxQ1ZYVEZwVWtH?=
 =?utf-8?B?OG5MN2E5OEtyVzc2ajVZUFo4VXJDWVNaQndSejlWdjlFUFRMZWdIaW9pMUVY?=
 =?utf-8?B?SnBHRWI5WGgwbkRoU1JuTEgrNm84NGFiMEZ6NVFpYnhSVXd2NlpXMlVOcm1K?=
 =?utf-8?B?YnZla3ZPSEdFYVhFMkRJa1pOUUw3UVZaOHl1SDVJQ3E4RkhJYlcwc1FxMzJm?=
 =?utf-8?B?b3hpU0tjdVBRdGhrQXJ4MjJCZGRadlJneS9ROE5UR1FOdW1yVEZMSWFFMVBv?=
 =?utf-8?B?R2I3bVM0VjE5NDFsaVd2dSthVUxMcE50bDNwd2kwU1hEUlFJOW1zekdaUCty?=
 =?utf-8?B?VzJYeHVIeUE2VjBObEQwbnAvR1RGVis1dTZSenZZTjREenNlUkdMODlhUDF3?=
 =?utf-8?B?TW84UjY4V1g0N0NUYVE5TTBQSjdFb2s0VUorVitjYmsycVAvSHhvRDNsYll5?=
 =?utf-8?B?RndqdHN4S2g5SGVaM0RHMjJaYXA2YnFBcjNwZzJuREVpNGRYVGRMTURqOFRP?=
 =?utf-8?B?MmpITnhTUzkxL00zQzNFdlREYUp0QVdRN1NnRUZyZ1RwaHQ3VFJzZ0Fibmgv?=
 =?utf-8?B?VkdHSVI3VDlLUlFiNHNMVHZGVEwra1RkTkZjV20xbnN2bHN4aEZsTzRNRE1E?=
 =?utf-8?B?dXE3ZmFRWUMrT3FpenY0THBiR0xhQXBFWm5IeEwyeDdtUXVoNUxqMm5SUGRL?=
 =?utf-8?B?TjdCS1NTWmpBbndMUi9Kd0VJblJ4WTd2bFlsbEVva0xFWHRpL3E0Q2ZJak1p?=
 =?utf-8?B?N0VEL09WTnhNNUtQMHZzOVY0OXJQMVYwczlRTTBHSDJiQVVLZUlyTXd3UjBQ?=
 =?utf-8?B?d2tOMzFGZVhpbTQwQVQwRStIZUhoK0FUS0NTNW1WNVJ5ZHkrVXhhNWg0Qnda?=
 =?utf-8?B?bUNkQ1JqaEhEaTUvbUFUeHNwVWNPbFBNdXJ5bFFrWUhPYU9SUURSeEZ3RWdp?=
 =?utf-8?B?UEhBcXVaVmlybEhnaTNPUmVGQlhoY2U0bnpkOWg2MGwzTGZ6VzZYa2JkMDR5?=
 =?utf-8?B?T1hEcHVkTHNqeWNJaStuNkQwZjVOSjBsOFBGWVpDdHNjRmVtVHY5R0JHYTls?=
 =?utf-8?B?M3d4dXd5Q1NTRHI0eFJURFF1TGdQZEl6TXMzU2JnMjFQU3lpc3gvOEY1WXJU?=
 =?utf-8?B?YllQb2NSR2dVL0xlV2c1U1oxT0NWS2xMZC9oL3lkQUw1cEQrUzZzMjMxSFdr?=
 =?utf-8?B?cHRaYjFCaTRkcHUrZmJ3bFNzc1A4M3BSQjhJN1pXeGg2NjJJYzFEV2JvdnpM?=
 =?utf-8?B?Y1FNcHBJMVlpYS9TU2QxaEtObFlzaElFOHY3aW9LdGc0ZUlNenp3Nlh3TUZ0?=
 =?utf-8?B?K09lRGI4Wm9lLzlDa1ZLeFFNUW9JUUdqU203dkk5SFBHUnROdTJ3SXlhQ0ll?=
 =?utf-8?B?MFpxTXVYT0lITi80YkJiSVdrK1drUUsxVnRqQ2twRC9yVTJnMXVYSHp5TVQ5?=
 =?utf-8?B?ZFVtdWlUcWpKWk5hRU1yTjJ4NFNMenFMM0hya1VzMkdCd2hPVCszN1BFTEVM?=
 =?utf-8?B?blhZWnM0eW85MFpxVi8zTGhnZmZTM0IxOTZkY0hSYXVIT3NRL0hlTHZZbjQ3?=
 =?utf-8?B?UExZL29vNXo5aldybGQzQVpZWHFqUzZkS3FOS21YSWtxV09lZm1qOUllSEFs?=
 =?utf-8?B?dWJRckc2OWtUZDRXb0Q5OGQ1MkQ0L1kvaTBwNldGQ1g5VlFmMWRtVWFUTXlK?=
 =?utf-8?B?eHNCVHB2MHJYT0MrY0ZJdWVIR204TElWZnFBK0FoRXMrQ2pVWnVBNGRJMnBs?=
 =?utf-8?B?QXg2MGxJNEcwclR2dVlEd1ZWM0YrbGt2emkwQ09XRkVwVU1iZnhkOExLeW5Y?=
 =?utf-8?B?aEsxSW1iM2J5T2xqYVE3SU1FZDdxWGdZK3FDU3JZZEJzQWRVZEJlVmp5L3FE?=
 =?utf-8?B?aG9kVG9pazBmSUovZ056NDRBeHhPVHNwc3U1OXpIVmJxSGx5aThmVFNBdDFh?=
 =?utf-8?B?TE51cTB3c0xhbS9tRmxYL2pQYVBBSDZEaFNYcVhoUzlzQjYzTmpnV0V6b21H?=
 =?utf-8?B?U2dXWXJtaVRRSXFVRDI1ekhJTngxVDU2U2FETE9XQ29oSjlOa0tWQ09FVzly?=
 =?utf-8?B?UFFYMElibUROVzZvZUJjeTJYU2RXenNWeE8xcVZ4ZUZQVVZONGY1Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b83f1eae-a8b5-4274-6b3d-08df2442e8a1
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 07:16:30.2224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4OuxO/9CQBktgoyjEyd6Y7aUMJyUzyv0scGXOK48PMpS2/9q1H7zxZL7XmNAPomTVrPGLSRwqVmIcSLzQ5MT5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10539

Hi Laurent,

On 10/6/26 18:37, Laurent Pinchart wrote:
> Hi Mirela,
>
> On Tue, Oct 06, 2026 at 04:55:25PM +0300, Mirela Rabulea wrote:
>> On 10/6/26 10:36, Sakari Ailus wrote:
>>> On Fri, Oct 02, 2026 at 07:16:11PM +0300, Mirela Rabulea wrote:
>>>> Laurent, Hans, Sakari,
>>>>
>>>> did you encounter similar situations? Any comments or proposals? The concern
>>>> here, to summarize, is: v4l2 control cannot be committed to sensor registers
>>>> right away (even when streaming) and we are also unsure when the right
>>>> moment to perform the register access may come.
>>> In practice there's little the kernel overall can do about this: the timing
>>> of everything is handled by the userspace. Drivers that aren't directly in
>>> control of the data path don't even have frame timing information and even
>>> if we did pass that to drivers, I²C writes always have some uncertainty
>>> (system scheduling, I²C access failures etc.), so one needs to be prepared
>>> to failing to do the writes in time, which would further complicate the
>>> UAPI.
> I think an API to group multiple writes in a buffer and trigger the I2C
> operation would be useful. It could be software-based, but it can also
> be useful on platforms where the I2C controller supports hardware
> triggers. I have been told a while ago that some I2C controllers can do
> that (I think on Nvidia chips, but don't quote me on that).

I agree, I think s_ext_ctrls would be a good candidate to fit that 
purpose, the  problem is currently it is unavailable in the subdevice 
interface. Since most sensor drivers are implemented as v4l2 subdevices, 
at the present they get only the simple s_ctrl callbacks, so the sensor 
driver is unaware when a group of controls start or end. If we address 
this, we could also add a context-id or exposure-id in the group.

I have also experienced a bit with control clusters, it was for a 
different purpose, I was trying to keep single and multi control values 
in sync, but it might be another way to achieve a group. Benefit from 
the fact the v4l2 core will try/set together all the cluster (either all 
pass or all fail), and try_ctl/set_ctl is called only for the master 
control (first in the list).

This simplifies a lot the problem of the sensor driver managing group 
holds. It does not help though the issue of synchronization, the fact 
remains that the sensor driver is unaware of frame start event. I heard 
some ideas on that during yesterday LPC BoF session.

>> On the kerne side, what would help would be a way to make an atomic
>> operation out of an i2c read (the status register to determine the
>> active context) plus a group hold update (a few i2c register writes). I
>> don't know if that is possible.
> What do you mean by atomic operation here ? From an I2C point of view we
> can probably guarantee that nothing will perform I2C access on the same
> bus between the read and write, but only if we submit both operations
> together. Changing the values to be written based on the read value
> isn't possible.
>
> But I don't really see how that would help. The issue is about
> performing I2C accesses at the right time, not about something else
> preempting the I2C bus between the read and write, right ?
By atomic I mean that we need to be sure that between the time we query 
the current context (via an i2c register read) and the time we update 
the group hold (via a series of i2c register writes), the context does 
not change, otherwise we will update the wrong context (userspace will 
see the values applied on the wrong VC). This is a problem we observed 
under stress test conditions.
>
>> On the v4l2 API side, I believe the current expectation is that upon
>> s_ctrl, if the value was accepted by the kernel, it will return success,
>> but user-space should not assume frames will immediately reflect the new
>> values.
>>
>> Traditionally, with drivers I have seen so far, if s_ctrl is applied
>> while streaming, it is applied immediately (but fail in case of i2c
>> access failure). Upon success, captured frames will reflect the values
>> after N+1 or N+2.
> The point at which the control will take effect is device-dependent.
> Different sensors have different delays for exposure time and analog
> gain. Increasing the delay when interleaving two groups doesn't seem to
> be a fundamental problem. What is crucial, though, is for userspace to
> know when the controls have taken effect.

Is there a way for userspace to to know when the controls have taken 
effect without embedded data? From ISP statistics maybe...I'm not an 
expert on that :(

Thanks,

Mirela

>
>>> Do you have libcamera in userspace or something else?
>> Yes, we experienced with libcamera. I can also reproduce the unwanted
>> behavior with v4l2-ctl streaming + i2ctranfer script that stress the
>> group hold writes.
>>
>> If we were to place the responsibility on userspace/libcamera, than
>> libcamera should be able to handle this:
>>
>> - after a successful s_ctrl, captured frames will reflect the values
>> after not N+2 but  X+N+2, where X can be anything because we do not know
>> when we catch the right context to do the group hold access
>>
>> - do not expect s_ctrl to fail, unless the value was not accepted; i2c
>> access failures cannot be catched, because we cannot apply the control
>> value instantly
>>
>> - a control value may get accidentally applied to the wrong stream;
>> because VC takes effect at frame N+1 and exposure and gain settings take
>> effect at frame N+2, if the group write timing is improper, these may
>> get out of sync; so user-space may see frames optimized for RGB on the
>> stream that was supposed to be optimized for Ir or vice-versa, as
>> confirmed by RishiKesh and Jai on ov2312.
>>
>> - embedded data information may help identify what settings were
>> actually applied for a particular captured frame (if embedded data is
>> available reliably)
> We could decide that support for RGB/IR stream interleaving requires the
> ability to capture embedded data. Some people may complain though.
>
> --
> Regards,
>
> Laurent Pinchart
