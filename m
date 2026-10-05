Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021092.outbound.protection.outlook.com [40.107.130.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2B632B116
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 08:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791188390; cv=fail; b=kK4ISAQb2At/orNWwR8MT5YgFe+FtBImWw51ebFVJ6feNrIfJMaQY85Cha5vdmlC+79BCBl+DI4HhBDd+plYW5UD7TVbMNdWk1VRCZHYwLidXjUbggEqqL1XXQDBrfe1o06q7F+5ScNnnB3uwU2uumZhLnLEHVVvo3u2e931gFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791188390; c=relaxed/simple;
	bh=smcVTxvZ78s3Disw4pHxoiLnQXo5P5Ka60Z+O0B1eYM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QK+vmhVJaUd29K/WuxHKoOmsAvpOdtLEkTekLHKNK+lTIpYj3Y6FxrQfML9kGdOLOFSv99CUZlIkAOK+P8j4liZhd4aB9UlaF18+ZKrEdOY/AgxJLoJccqAFjj0On6MSLcIoY/uAJwIFlGqsACHcBkd26jY+LMb7GcKhDopLIk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=eVMDK/O+; arc=fail smtp.client-ip=40.107.130.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="eVMDK/O+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJDbMkJlnlM+9Ije+xTfr0PfE8EbYw0zcazELytCVt6cWU93w4Kg3kcJZw2HqBbrid/IEFV6qeZvl7X54o86BHVdWRPzGk3Ikks8nRLkEgSqsCaHm9batRUkJGnsQ2Y9Q1WAlYPfzrTMYxGB+WYnru9GwLUxpLOsqi/8FWAcpWpTDbPUYUCWzFfBq6VxZEc/6xepyoGSi003fKOF/fDkYsLDEGXJRTuaQS82t98sHXwSH/P0zW7iIn88jJSd573DZi9jwaP8fyJ12KOhCeEsJpb5n+wO3b/0QcLFiype4E8ASP08tUwZclZjFU32GgISF/8NKRNHg5nf8dPA9SZUiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smcVTxvZ78s3Disw4pHxoiLnQXo5P5Ka60Z+O0B1eYM=;
 b=OS3rKkcy+fQoVkijygwFsSglHj3H37a/h44m5pz6HHAqDXZSekiTMDU9jsDi9sXfwg0epPd6pjht3e/VyTgFIsyoEAenqo5Jyj+54juDGuttzu8eh6du6Ts9FDjHfbv0MH4hdX4pHxJXJWCi6HbTVCfey7gmcBQrCJzzngvNQ24ratmX8XUoIsLnGjPBlswZb9+kcPXfaHEddx96sdikr3MfA+/nDmWIoggtwWJ1OVDQ3ol4AT6ud40Vp3cYxjKkTQ4ByriKbOykNt6/RhUgAWA/8FWdaY0YdH4V62MrE+aA+lHMKIdLP961tjkd+QAI1R0NS271FdMOVkaPCoMApg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smcVTxvZ78s3Disw4pHxoiLnQXo5P5Ka60Z+O0B1eYM=;
 b=eVMDK/O++2ZsPkDzl5TLKUxexNiW2o/g0dcvbaaAu1Yal6cDE14vQ06sgZjHUEbvSi/U7tUB8vG7flrBtMuv4rTMaYCBtnU7KTFwYzvO5TjlFAICeB89riCeoLwFXOWeInrQdBzhMErK0dtLA+QJqsTtvak80u1tn+cJ8fVNgp+wF2qK3d/R+Xq4KRxv7ckFeSDTS0TyklvX+eNQohJ77o4Stgtq9XwQLma1O4rIO13W1NEyeJQpvRMKiQXu5DjaO3bue9emSSTy/cPIJXWwuxtORph4rPXi4PUnKmS7uJYtiwDpvo5Kl/GVAkqHSzbQI3s2fWvzBcxkwiZzAbnJZA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::23)
 by DU4PR06MB10267.eurprd06.prod.outlook.com (2603:10a6:10:621::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 08:19:37 +0000
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17]) by AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17%4]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 08:19:37 +0000
Message-ID: <1e1a097b-bc64-4ca8-a499-e6bc3cf4c502@vaisala.com>
Date: Mon, 5 Oct 2026 11:19:35 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/9] serial: max310x: wait for TX to drain before
 powering down in shutdown
To: sashiko-reviews@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Tapio Reijonen <tapio.reijonen@kolumbus.fi>
References: <20261004-max310x-rs485-sw-delay-v6-0-3a0ef13ed9e3@vaisala.com>
 <20261004-max310x-rs485-sw-delay-v6-5-3a0ef13ed9e3@vaisala.com>
 <20261004122835.92E741F000FF@smtp.kernel.org>
Content-Language: en-US
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
In-Reply-To: <20261004122835.92E741F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0301.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:85::10) To AM9PR06MB7907.eurprd06.prod.outlook.com
 (2603:10a6:20b:3a6::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR06MB7907:EE_|DU4PR06MB10267:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a52b775-6a05-4ccb-93b1-08df22b9652f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4tG6JDFLWJBoHREKolDuu6JF+DuXhfQwF4E+9I2GPSBI4rQJa8K/AYB+9h7pGIr/jxUjQ+HJzJaJW21aYQArEDGNDKAiQbcAWJcNERVVD9zw0wGLWkoSbwRKGJ1C+6xXl1siBSaBbaaS8sg249XlfqaSeyJ7VN46SNfSBEqBpoPh0cQagcu9cyEF0feO5O6kED1P/R3+66NxfUfVspBBkLkSkspRBaatEoBEnfOiMmKekBB+Vst5NSE4GaGfQyRAnpLXj2uA+UHVpbZYzBxzNyj2yDauiXf8qHWdk9I/tYq3gvjrx9ZyqhT8R0qN/UnVo/1MLmZcS9X8/TT4qNPeICd8FNzsqUnLKrOmW1L0JkldN4Q+Jtm5htW/LURI7CLJ5q7OmZcqorjYQPOv42rOU0GI6JSfUDhmq1wDBHtPwnlOgw99RFXOQGfSBewGe4JNX5X9Sa7XZY2RaPtaq4y5SfOOFdUNKn6nE27SQOpIgsNKG2AHXzdHeqlPNWUIFBLrLYNuQUZbnXKMZarlPEURKSg/JlqxP8DufZ9IZHAvEgDcIq9HHelvIRbB6NsXGSY5HZafCPNREEg8pIJlwVSu1/lXgPdS9xnm3UoyaB+OhrZcgbLmdt0AguKpE/szmrMRnSRF9HLrMnVffOEGfO4CeKd5YnXsyaidaN+Ej0w+500=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7907.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0did2h3UnFwNnh6ZjhtVXJYY2sxMGMwc1B4OFZRN2VoUE5jR0graGtvS1BC?=
 =?utf-8?B?UmtRdkdiM3NVTTdOWEkwTC9hU2x2T29Zakl1M1U2U2dhaUhPMEVQUnRkSVBM?=
 =?utf-8?B?K0U3TWVxbmF6K2FiQW9xRkhDWms3Yi9CbHhvREd6UlNvTzhFWGRzT014OVVG?=
 =?utf-8?B?Vkx0bFA5SVh5ZEpNQWUrM3hGUFZ4VkcyMWZmc0ptdFg3Ky8vTjJoVjBON2wz?=
 =?utf-8?B?M1BLN3pDVHBqeGMyQlJtTWVyVko2c2dlZ3pwbGxPUXhFdXh3ZGZMOWNYUHIv?=
 =?utf-8?B?eTU3YlBBQlNjaVZjME5mcThjZnFSc2dVeThnSDZGV2JDZExpK1NON0xlRzFh?=
 =?utf-8?B?UmNtN296Q1RJa005TzRUanZGZ0RjMWc4UkwrRVZZNEltdzM0R0tEcVdVUGtJ?=
 =?utf-8?B?L1lPbkxsRjRmOEkvV21pK2RLeElWV0JqUkpXQWFEYjFDekgyaVNCUDhLOVpU?=
 =?utf-8?B?SHZOWkFtTWEwc1VTbVBQczZTaDNkNmx3aGZ4RkVmK2Q3NXUzRHFyVVlnT1ll?=
 =?utf-8?B?Y2VzcXkzc0VGa3dIbU5OQkpha0lvaFVuQURPU3hlNjRob2d6aitmWTNOd0t2?=
 =?utf-8?B?c3d2Y2VQejJ0b2lreDg4NGN3SUJ5WGw1aDluZm5Vbzl6WmhNQ3MwbUhyU0Rx?=
 =?utf-8?B?SW5lcHkra09OTERiaUwvNXlnQURQWGpxSXdYZEV3Rm5jMnVWYUlXRUlYQ3lJ?=
 =?utf-8?B?QXZ5eHlKaVhZYzVVU0hTd2VpRmo5QUNrNWIvSUVWZFFUQWpaNHprN2tKNk9K?=
 =?utf-8?B?YTIrckFqZEV6VW52WEJ3T3U1ZTIxN2IyZVdoUE56OUUzUjFwcUFoMmxVekhp?=
 =?utf-8?B?NzJNSGx4NzlCc01UWXlmSWFIbHlvaStyTU9KNjg1R0VmUGg3OUUyMVNsWENr?=
 =?utf-8?B?ZzJ2QnJyVWdQdTdsQ2pQR0xSb1lZamFwcEpkdmNRTkltU3VUYUFmZVlxRXhr?=
 =?utf-8?B?U2FGSW5XckNvZkt3VExLdWpYaXNQTEY2Vmh0UjBVbktwSlBMWm5Vb2ZMTThn?=
 =?utf-8?B?cS80MHJGYTNXUHVWTlJPMXp0a1VHeDR0MXpESzY0R2tSdEdXSjJQM1o2eGYr?=
 =?utf-8?B?bWdVa1NLRFozZCtycUp4NFkvN240MWp4TTNUT29nOVRsUXhKV0cxd0EybnQ3?=
 =?utf-8?B?L05tOFZFRG5rREVQZzBDVTJiUDhzSWpHejdvdWlaL25CUk13NStldU5Cb25F?=
 =?utf-8?B?ZDJOM2huaE5SbG9hV2RCTFZtWHF1K1crYi9DVDZPV0o2WHh1dHFzZUQ5UmhI?=
 =?utf-8?B?NzhHMWRKRHRlR3FDM2dvSk1Na1VyclhncFljNnNKdGprKzB1ZGFCeDFCNVgv?=
 =?utf-8?B?eU53Rm1mRWhiKzhvaGI3NWxhaHNROUxnZGliUUlBRmFpODRwbVpQYitaQnp4?=
 =?utf-8?B?UFB5cWd2eW5wZy82VWN3MlNkc0tURTZZdysySkt5c3pFMTRKT2ovejJ3ai9F?=
 =?utf-8?B?ZGgreWRBejZUU051T3I2ZzQ1UW92WnJjWjlvQzF5VkhJV1dyUkN0T05OZlRD?=
 =?utf-8?B?OG9CdThEOWh1TEkxSmtnR2pHdi9OZkNqVFdyTkUrcEJ2TkFpb1ZDcVZxZ2JY?=
 =?utf-8?B?SmRqcU0ycFhKL1JXVTdTRkNHaW5GWXVvcFFBS04ydDVJTU9oYk1GQXVwWCtY?=
 =?utf-8?B?aUNHMjRBRW1PY0d4QjNySUJDN2crZThjWExwZlFoZUZuOW9JWDU3UWowSFZV?=
 =?utf-8?B?ZnE0cmlpUW5QNHJ3ZHI4MGFLb01yUGZUY09Wb3ovaitMdkpSaW1hOGJ6SXdQ?=
 =?utf-8?B?UmRlQTBZdHRoR1M5c0src2ErZ3dRRngxNDRYWlYzcEtKTDhUaFUzSjRMNTZK?=
 =?utf-8?B?dUtEQVZUMDh2enhNVUJ6MmljTEs5U2FuYms1VGN6YWZYMTl5bm02bDBjQ3gr?=
 =?utf-8?B?MEwxak05c25SeTBOb3hEYlovRWgwcm82LzFaSEZYQVhxT3p2Ykw5K0duRHRr?=
 =?utf-8?B?SGJNdVRRNXpkYVpZT3VIUUpnSEt2bXN2RGt4Y2p0Z2VueFo4RGVMWUE3UUxR?=
 =?utf-8?B?MVZmY2tiZlN4aW1CWDJRMjBjZENESFdvWlNLVlRtWVQvQjJVdENnaTZLY0o0?=
 =?utf-8?B?WnFKamE3SG5MbzM4eUNibnY0TU1hK1BGWUd0YUE0NG5ZUEN6bUVSNlJtVEtB?=
 =?utf-8?B?TTNMY3VpaHhTSHU0UENJVlFpL2c2L3U2RG5BRVBsMlpnV0hoSml5OGZwZlc4?=
 =?utf-8?B?K1lkU1hucFpJMnpHOFdoWVZyWDcyZWZKZmc2MXRGMzFheVhvUHpXcit1MEZJ?=
 =?utf-8?B?TWozTFVEOVh4YlMrVkNsc3F4bUprVEVydGd0WUIwWXlZdlR5ekRqZGY2RGlF?=
 =?utf-8?B?c3BNc0NuR3NmT0hNUFAycC9HRG4vMDlDTWw0ZXBQSmlDeU5Ja2JqQjgzU09k?=
 =?utf-8?Q?EM9jTYqwn1VU1DwE=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a52b775-6a05-4ccb-93b1-08df22b9652f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7907.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 08:19:37.3743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+4GZMuosB2qDqjk4HiaRolrIZ8alaSCUne0onG6RZWMFSeaclyidVnvgMDJmp0J/LhIp96lLnWFfM9JEBKlreiNXiLc75ZZF49gzdFmM0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR06MB10267



On 10/4/26 15:28, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Can this loop be used to cause a local Denial of Service via an
> extended D-state hang or Hung Task Panic?
>
> If a user opens the TTY, configures a very low baud rate (e.g.,
> speed 1-50), disables CTS flow control (preventing the TX FIFO from
> draining), and closes the device, max310x_shutdown() could call
> fsleep() up to 129 times in TASK_UNINTERRUPTIBLE.

Agreed, the loop waits on data, so a blocked FIFO makes close() pay
for it. One precision note: the baud rate generator floors at
uartclk / 16 / 0xffff, tens of baud with the usual crystals, so the
1-baud / 20-minute case is not reachable - but ~26 s per close() at
50 baud with CTS blocked is real and bad enough.

v7 will rework shutdown() to stop the transmitter instead of
draining it, following what imx.c does: set MODE1 TxDisabl (the
character in flight completes, the rest of the FIFO is abandoned -
the next startup() resets the FIFOs anyway) and honour only the RTS
timing. On the auto-RTS path the FIFO is also reset, so the engine
sees the transmitter empty and releases RTS before the power-off
freezes the pin. The wait is then bounded by one character plus the
configured after-send delay, independent of how much data was
queued: measured on a MAX14830 board, a close() with a second of
data still in flight at 50 baud takes 0.23 s instead of 2.4, and the
CTS-blocked case no longer waits on data at all. Data the tty layer
explicitly did not wait for is then truncated rather than drained,
which matches how other RS485 drivers close.

Tapio

