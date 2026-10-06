Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013022.outbound.protection.outlook.com [40.107.162.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891A223E342;
	Tue,  6 Oct 2026 13:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294938; cv=fail; b=gCFILrZ47pHr8s9oL3uc8kfA8NPZH/NkqSfSCIQqX/tU8kA+3ice7cetrZW/ySnB3Ft0UJ+4nNk3EnLI0dhw4gXbGBmRhbQuURGQDIbS7gTzltsSj453U/HAOegLvsBp6PJbEReOoFUfnOf8s/1NR30E4ko1QqCSi7JynhXGhnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294938; c=relaxed/simple;
	bh=dAKojlTpxUVHG/40abV9daA5DZK4OSdiRzcqtW3inP4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A+lvb8OK/OhJB0Ww/XQYQeP2Em0dCIiUaCzHpAhYKRY3Auqxjv4EqFyBXv2E7sl3fMTuNRqYwB913fK/A0RCfVqjOtuQsOwAneUMYTOIPTjGk2UIcH3Hv3eB5qxGW8eofZCn5e1Z85TUK/IWS9QGJW4wbSiJh0PqF5Xs+0QdZSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LvxE3/+C; arc=fail smtp.client-ip=40.107.162.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LvxE3/+C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qo6Ni2o6uPC7sW4Gy2Lm4s17XrKavvR7O4zobJURP+GhmnZmF6kMuYU4GgoTXqoIcSa9DJ4HsrRzU+Iqnx/mSc72CtRpdI9odqhqOReGLhiYNWmxgkNWYhsQOLF0FaHk+Fz0272JogDl2YyyhjzL6CpGaUvQIR22pq2MeUhvX0m3L1O2PSikjVIU4p9Kp50p62Dj8vcCAglHffzbVaepQ4w+QnwgOELKd/v2zMaMPKiC8eULzu8OBhsOX2aI6Ob7lWOqzOsq/IRIbZG0SSJo+DCG6wk+A2OaYfhb6KVCq3BWFMwMwcVxp732tk+YRNOuApPUjafZaqW+uJVOb6Gn5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Jwq2QTDrmq5atWwosgRrokgPC2wDfHBEMzGkLf8Eos=;
 b=yhKO2YEIzASFtW85un0oy1JK8rngsz3CV26voBBl4RjWUL/yZO51CESCGbrw39xLfhd+x1VKa9WnUhnRTanT2Q21swBw3qLI3XJKjBTDn6toHO8YEulgETiffIe7XihWu2AlLXH19n2lrH/gz3zpS1gzn5emh0WdPubo356AzyT8oY3VSsPmlWELTLJS4x+tAnn8yjrO+WtlSsaSDzgHTNgWmsc0BXc8D8oJpQtXm65UnkJd2+XxcldYISDHhyFS+5RY9stf6tlOs8C6fpS4zmelqGW79BjuQALRCMbFm0DB+tqVFAT1xawoxYZDOMWFvuTc6pyV5xZSr4xW9sPjnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Jwq2QTDrmq5atWwosgRrokgPC2wDfHBEMzGkLf8Eos=;
 b=LvxE3/+CyJ/Vacc9Fd3rAHBYM+U3sJ5Xh9DMGcSskqJEHTnVw/QusP01y+zmfVZ5gltAzNDj/PtcKdu5qq9LEbXTj7vgwlUpcNjxJxC0OGrd9grDFpUcykzWnrniNA0mZHVA+NuBSthLX69VGKbuDVsqXRHuy7N7bS1/LaEZpWL+izU5JZQFVfEDAIwMC2n1rUbGbHUSIMwFg7iBzaldb8UbzXQAmH34wGMp2k7j/DO7u2sl4pICZVwg7FMMnSsDy7ArvMHbQYv8yD+AmBZECF7UBsLAWsYsGkXwWqWI2wjiFhQro0OvjSOVYHqpkz7jSDbi7IsfXda5xzYc1MT2Lg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by GV2PR04MB11238.eurprd04.prod.outlook.com (2603:10a6:150:27c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 13:55:28 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 13:55:28 +0000
Message-ID: <577b34a1-4c2f-487d-a4fa-e7ede2b60091@nxp.com>
Date: Tue, 6 Oct 2026 16:55:25 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [RFC PATCH 6/8] media: i2c: ov2312: add Omnivison OV2312
 driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Rishikesh Donadkar <r-donadkar@ti.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, tomi.valkeinen@ideasonboard.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, kristo@kernel.org,
 mripard@kernel.org, jai.luthra@linux.dev, jai.luthra@ideasonboard.com,
 devarsht@ti.com, y-abhilashchandra@ti.com, laurent.pinchart@ideasonboard.com
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-7-r-donadkar@ti.com>
 <e469d168-39f9-448c-a7ab-5d02b79d8cb8@nxp.com>
 <asSk9KW-lzuiUJa3@kekkonen.localdomain>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <asSk9KW-lzuiUJa3@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P189CA0030.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::35) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|GV2PR04MB11238:EE_
X-MS-Office365-Filtering-Correlation-Id: 380be23b-02da-4a3a-c33a-08df23b17a84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|19092799006|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3GNkR0ngHhF7Y2UvUrdLQxMN4Aw7XNvGtNN7HEzL8vMnVbh8i5a7aqGfAflRve72p+T60FcMQvkskLUfdBoGvMLLUe75gXUtLsEk8fGWRWkvilXSf9wvfHupGAv3uiWq9tTZf8j/d4qlRKcOst4olCGr6V5RByZ4KG3v6SlstFVOervjVyRYOjYGmsxmn8QEkmiyY1HEvMkxwy3H6sUHHbZPr6uFcnaQ3hMggN4FZ/Q3GREyH9yfxhuo2f8jkglCaGmBeWkknWjaxPWQByw3Pmmdvo5YlCjDaENMogOWp/kY0Ts07iO1cjT5pHWLmWaGu9XPmn7M7m10YYMofF2MzEj8Etw4QUhUuOmSAfG0o5DB6nwdd5LK2aqoVNBDNcKhu9EGJZKx0fW5yI+mu4EXMFJ9gGZRZkI1MgjjLNlhN1jOE9dcpFOMMpmahsKAiN6i01qSdchfsN31WlyWp6a6sIWXnNqAfJLW6ZKIa6mmp+ijsA9WbVijvwvpjCTEwOiMFoedDv90INwiRdjcuyMPiCm0YdQsolFQWBOZhfEetvKHHJF93pZp0DghUbmMUdZjh+ceNH6XZfW5IQKm05L4dJOoaYvOODgY9hxSrGhG4fZ2C/663Ui9ztp1qTeBQcuXDFsEdi8nzcm83dzPrKiE6Zf/6m2CXvWHygOaX8HEgg8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(19092799006)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlVHTm1iV1pvUUwrdGMzSFk1b0RBdDFObHNEU2hmeW0vYkdxN2hjb3pVUjg4?=
 =?utf-8?B?NUtESjlzWUZoRWNXRU9mRTFXbWZ1dzA3VXo4ZFNmRG9Vb2FFb2E5b2xDOWNB?=
 =?utf-8?B?S3FyeHlERHZGOS84L0hnNS94RDZXbXk3MnhmY2U3VzUwYitUOFR2VG9qVk1w?=
 =?utf-8?B?Y0djVWUrNlEySnE0TFNQVFM0U3plY29hb29ZcDhsSFVoRmE3SThHWmhwU2ln?=
 =?utf-8?B?SVVkdVRBZ2ZDRnBjeDVuMC8zZUlNTlRiTGttMzJwVFpSYXV6OGpWWWFZaWNl?=
 =?utf-8?B?a05aRGIvU3IxMHlLbGsvRjNKSWpmYVFSQzl5QVk3QmFHMUxxWlBQQlRRaUhv?=
 =?utf-8?B?dEQxUFZDSXp1Y3pBZEc1bFdqSXVCZVdPZnorQjRFcGhUL2RGMFlVbXFxalEr?=
 =?utf-8?B?dWI0QW11aWFUb1pkMWhpeXZBMVRTZk42dmUyaUJFTUNvZ2VYTkNGZmFPQmN6?=
 =?utf-8?B?dnEwZGtCS0M1Q0YyRmpMVzdFSTJzNXRJaVJnNmpsS2l5MGZycSt2WlA1cEJ3?=
 =?utf-8?B?eHVjMTdtYzVVL3J1WmpSTXFwYjFlSlZYcjNydHJFa09GMkFJRHIxWE1VOWUr?=
 =?utf-8?B?cWZDOE9FU1ppK2R2Zmd3cWIxS1I2d0V3NWdXUDVCZmZWVWlVa3h2YzVTa3J2?=
 =?utf-8?B?ZXNKYk43OVRyVlNHM0dxWWQ4NlQvS2dGQWZ2NVFXTHN2dGUyRkJzcnRXOCtL?=
 =?utf-8?B?eVl2amRnaEIrVHI1TGRIa1ZVUDZaL1QwZks5VW9wRTVlMm1JSytiSWRqU2VK?=
 =?utf-8?B?MDBOWHpZOVlYTExhOTZIOVNZN0w2N0pSSWVIZ0c4dmhvNUt4eVhWcmw2T0Mw?=
 =?utf-8?B?LzlUTUticVpNcEtJZWRIYWtCVjIwYTdTUmh4Y2F0NWU1TmV1NFo5czlRT0FZ?=
 =?utf-8?B?TXFWZEZ6UVBXVFNtWXdUQldHWW51UmNxWlpQbEZkck9KdTMxNWw0NHJZUzZL?=
 =?utf-8?B?anNNbE5WSWtrT21Id1JHN3hyMkJmRXJLSWh4ckhnZGRVNWUwajFXNy9vKzdm?=
 =?utf-8?B?ZkpQMkRNRnhUNHZYMXNheVdHVnNNSGwybUpUc2hpc0NNYlZQMHllSDE3ZWZ4?=
 =?utf-8?B?SzZ0SkdRRkwyMUdrb1pNQzdFWVBlUjBUMEFsazR1dENXU3liMG96akh0MWdJ?=
 =?utf-8?B?L29Ickt5R3ZvTmEwSm8wcVJ6NlRCL0t0WENOUlRTdHZWVGFCSlkrS1pMNEYz?=
 =?utf-8?B?TTJYWUV6Nis4djlqU1lkQlI4MXJwUGlHbFBrVlgzckFSWTJ5dkdoU1hQYmd1?=
 =?utf-8?B?Z1pMRHVKSU5ibXJkZFV0Yk16SVZ1amI3ZUNSdi9BaG1qdEVIRVFmNFM1UlZY?=
 =?utf-8?B?WlcrSmZKaDBQaG1PN0xMY3JJRTVxMGRITzlucnd4WFprcnRUek9SZ250ZG1N?=
 =?utf-8?B?UkRaZ1VzWVdmOFBmcTJzSUJkRlpvclcwM3l5UnlVQzNTQU9JQWVIbjBzLzZu?=
 =?utf-8?B?cHVhOFViM0FtT1REWXpXOHFLZXFvUDlrR1NUYW51OW9rZkRHbjVJazEwb3JP?=
 =?utf-8?B?bXBLNG9IbWVHQ0dET0d0OWN3VExEeG5GSjZ3YWpFZDNxSWRQVFBsZUg5dlJ2?=
 =?utf-8?B?MmdDcGE5VUhKMEpOZXBuMGd2RzhNbk9nQ1Y4b2pPYlh1QnNreWNiY3VhUnNV?=
 =?utf-8?B?VjdKdjc2UU1rRHlScjgxdFVEQXI3RHdmRXhoZzZPbzdiaWhmZ2FBRmk5bHdi?=
 =?utf-8?B?SjkrQlBBN3V2WXhKWisyZzd4T1hrZTJFbCtwQ0JscVd4cVlyNjZocnhFb3hm?=
 =?utf-8?B?L0dTYlpRcGhEcGdLb1U1ZDRodWxhNGMxZ2RBbFdVNGk4RkVZT0YrSkJjeXFU?=
 =?utf-8?B?NUtJU0JJK0ozanhienZJcFlZTXFpOEIwMmVrTDlNRkQxS2xJUEsvaW9GRVdK?=
 =?utf-8?B?WW5aSFNhNEZTbVM2d3AwR1UvSFAxclArSDczTlVNZmkxRHdMR3lmT1NYR25w?=
 =?utf-8?B?akFHZnl4anc4ekpEZXNOeSttVDdnNUFXTmRENGd3UlhUQzFFU24vbmF4ZzVh?=
 =?utf-8?B?Mktzb0tIRGdYWjdqcGxxZlVlbU9yZ3dIaWY2M20zM2I4M0hyYlU4WFZQaWF5?=
 =?utf-8?B?b1lMRys4Qm84RnZCY24rRjd5RDZ4aW44QkpqNElHRHhyVUpKdUFaVHc3cklD?=
 =?utf-8?B?djcrNnc1anQ0cHRTZThvbEV5MCtkejZYcUJGU1BkRjZ4cE9SakJPVk8xUUVZ?=
 =?utf-8?B?SGR5MGt1RHZyVTNZQXlYbHhRdCtDRWJka0RYbUdWelBFLytFY2UzaWZaQTNI?=
 =?utf-8?B?QXJtc1NTQXNrT1M4SklXeXhoWjJjTHdsZlp2YmdnVUdZQW1wWGtLcnZBOTJs?=
 =?utf-8?B?cEptR1IwUWlNNWJvRlhtaitQYTFaVVdzOUVGbkwyazRoMWRHWnFpZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 380be23b-02da-4a3a-c33a-08df23b17a84
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 13:55:28.5201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqF0WK5lDIQjq5wa9lbXsQ8j1BqwFGSJOYzoZjz/QBu8R20yVDerxcWxI5upN4AxDtqyWb2WNZ5tknSXAl/3/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11238

Hi Sakari,

On 10/6/26 10:36, Sakari Ailus wrote:
> Hi Mirela,
>
> On Fri, Oct 02, 2026 at 07:16:11PM +0300, Mirela Rabulea wrote:
>> Laurent, Hans, Sakari,
>>
>> did you encounter similar situations? Any comments or proposals? The concern
>> here, to summarize, is: v4l2 control cannot be committed to sensor registers
>> right away (even when streaming) and we are also unsure when the right
>> moment to perform the register access may come.
> In practice there's little the kernel overall can do about this: the timing
> of everything is handled by the userspace. Drivers that aren't directly in
> control of the data path don't even have frame timing information and even
> if we did pass that to drivers, I²C writes always have some uncertainty
> (system scheduling, I²C access failures etc.), so one needs to be prepared
> to failing to do the writes in time, which would further complicate the
> UAPI.

On the kerne side, what would help would be a way to make an atomic 
operation out of an i2c read (the status register to determine the 
active context) plus a group hold update (a few i2c register writes). I 
don't know if that is possible.

On the v4l2 API side, I believe the current expectation is that upon 
s_ctrl, if the value was accepted by the kernel, it will return success, 
but user-space should not assume frames will immediately reflect the new 
values.

Traditionally, with drivers I have seen so far, if s_ctrl is applied 
while streaming, it is applied immediately (but fail in case of i2c 
access failure). Upon success, captured frames will reflect the values 
after N+1 or N+2.

>
> Do you have libcamera in userspace or something else?

Yes, we experienced with libcamera. I can also reproduce the unwanted 
behavior with v4l2-ctl streaming + i2ctranfer script that stress the 
group hold writes.

If we were to place the responsibility on userspace/libcamera, than 
libcamera should be able to handle this:

- after a successful s_ctrl, captured frames will reflect the values 
after not N+2 but  X+N+2, where X can be anything because we do not know 
when we catch the right context to do the group hold access

- do not expect s_ctrl to fail, unless the value was not accepted; i2c 
access failures cannot be catched, because we cannot apply the control 
value instantly

- a control value may get accidentally applied to the wrong stream; 
because VC takes effect at frame N+1 and exposure and gain settings take 
effect at frame N+2, if the group write timing is improper, these may 
get out of sync; so user-space may see frames optimized for RGB on the 
stream that was supposed to be optimized for Ir or vice-versa, as 
confirmed by RishiKesh and Jai on ov2312.

- embedded data information may help identify what settings were 
actually applied for a particular captured frame (if embedded data is 
available reliably)

Regards,

Mirela

>
> --
> Kind regards,
>
> Sakari Ailus
