Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012043.outbound.protection.outlook.com [52.101.43.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E672F4E3ED2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788454423; cv=fail; b=Rv5ynMLsfWOOJsg0xcwukK/ZflYB6yVvG4ufYhOrLQYx+tHQZDJ7OBe63qBOcU2oBbTH+0XH5eSr5kfvvJYqVDLWENSTw+6Tmxq/QdxdSCE4uBgkEZ7YqEL4H/giaiOl3AZP9K+aFIdn1Hsd9uWwPGK9ieVX3l5/hsWmHaIs1ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788454423; c=relaxed/simple;
	bh=Ex0QupfYpvnqZQhJMmFgdM9epww+JA1pDGUWdCTYXe4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=J8iHGjyb2zaboPeJpTxVIr6cLugLDOSL3duPOp+jOt/8Psk7TXTJQmN4ZaZHDUy9OGLUZ8MQiEhw6jnEdbkhbqT/dVE2XF1uSjviTQGKFeD85xL7ZnqvkQDADF/3QQZQJqjsftze2DVJOBOiz4EpqV0e4rJ2L0qjyv/fmpbFPS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=RvtC30pv; arc=fail smtp.client-ip=52.101.43.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="RvtC30pv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gW5gU6WnaRQTSgHcqa9EeuPMDdMgB+ZiZ52BmJ7HuXMoakRdAyCfdMo4Qabk+6Srx1c2IcEXGwc+G0phuyGVnSsUwqM0vyp8w8V4vo5OXnNLKyrT9dXemIChuS+rc7abOd1/kf+yKde5faF2tYut/oAXtGhKClFrGiIYMht7yOPD91LfoZ+t0eNmDhbSVAmAbzfEKPAUJSVznqVPTuhlavyyFWdaiiSMoNeGmonlgrbn9ApKIrDJ7Ei4Dg1GHCefy22R4pDgayPxzKDNq1RSyQI0ISbulJvGHr2OajyfevoXa7n8X4PWqyx/0/SNe5f999/Rd+q11x+s1WVDnzvr1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7e1ObmG5dNeJWQqUnMIbT7SJ68Uz9LihYe8UqtthoE=;
 b=RxMF6iGoL1KwjMNGUJ4NG+3ZCIMBTp2THoVN6WL2yuyDxpfChI+fXi0veqxdI27Y90MJBqgL0rb8KFYuDiZytRr9m1Vu39j7eNuJxkcX75cLmK4MLQ7u2eHe0XfOfMZMq8/G8mECZkFuWazUN3RjV9czs65u4cyh+F5UGtMIAUqNS9AyJmZNh7ktyK4l1KJUyqtxgE3MwI7iqGCZe3DTDLtk600SVw3dqn3fbmDCz0eCV+b9ghECC9ozBwbSM9keTTAE61QzzrqYaf25i0YECjb3ZcyGmIdsFHUn0OUocWTA5Tfv1agzzNJZuxW3zGjzqnO77FlaPgdmiYsca4NOUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7e1ObmG5dNeJWQqUnMIbT7SJ68Uz9LihYe8UqtthoE=;
 b=RvtC30pvrnw8n/eYI1uzlb1IV+i5KvaWKOubYwyuxZWG7tIv3kwadW8r/QXr/5aRE8ybYk1JkUSXjDbAMPeLzT0aS4BvFRPeb+zJyk+FJox/6IbAd2kkQLglGVRK9686xDC6vId2DV+zcnxFNJFCB1B0AdwUSjYbKKbBL3+8YE2gdsyuQtunuVtx/oRW/HeVBEdS0R8+0xrlVr2i6+dYUeDT66OlMebnqzx70qaKt22NDB8KKNkyHFGYHwUzUA7zsF1wqXs6Ae1Su+P0C/tUQ3xDnRDl7UdBU3HiIGAgYWVRCChPUpAD6ohuiA2lm7JrvKpXllzwl1WXUuE1+Iq+Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 BN5PR03MB8055.namprd03.prod.outlook.com (2603:10b6:408:2ab::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 16:53:37 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 16:53:37 +0000
Message-ID: <3a3cf5d0-56fd-4e3d-8201-79ab26922a4c@altera.com>
Date: Fri, 4 Sep 2026 00:53:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: stratix10-svc: add PSCI secondary CPU
 offline on warm reboot for agilex and stratix10
To: Dinh Nguyen <dinguyen@kernel.org>, linux-kernel@vger.kernel.org
References: <ab0bb836bdd80fbad772a49616b1edba372420b7.1784020512.git.adrian.ho.yin.ng@altera.com>
 <cdfcf658-c1c1-4b7b-8127-4cb907d4f51c@kernel.org>
Content-Language: en-US
From: "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@altera.com>
In-Reply-To: <cdfcf658-c1c1-4b7b-8127-4cb907d4f51c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:196::14) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|BN5PR03MB8055:EE_
X-MS-Office365-Filtering-Correlation-Id: 08ef3f01-3608-4116-f098-08df09dbe61e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|6133799003|55112099003|22082099003|56012099006|10067099003|11063799006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info:
	enTCBNbPekOLHNIvlJbjFEcrKjwsNzWWMlGvg9XKJFhERbGNwmJoaYxl1F88kXhMwhAoZEUWSHuX0J78KzrD9bCORu1hrGumVpFCVhY7SVOp+i2McAayfrOzwnV+XigU2x4qtp7xpHZ2RUhU58vj6T6N9worNBKAnnLnsKt/5jnyMrwLt1EIuQgPdOmlBzIS8+ctcnatU+yetS8Ly9kz1Mt6nP4hVFPh15+NNcLx4hng8CnEDWjPP4hsdmZRDqdkBCNZF8NOr9KO6upcxfLfzxxOhmIZzmADmBKvFQDT4QfLD1x5jv0CwFopT2bipEw9sFgJP97f0twrVpc3lHXIZ+iBD2PX0/MUEFOWTVCczdyf8+qcr5BKOP3Lb8gKmD7Dz2H95oIZigGrKwr6NZ1QAECPzSxIvehNZ/H1VdKm+G7QYCWEFsho152VGnWMcPzNPR0lGjVEC7WWzQVhlTuQmW2wViI3+QlQWnfO55+DGHIOk2NgXkrAyDx/JmsUnqD0BPYgYdI9Gdyoy1seh6bALN/vj/dYB7NcOZWSg3xjBye4ZEfICAFbo8CO4XZFfuVDOLuSEljkwVN0Gz/7UydZhdPLwsXK9zakROoWfLXLo5n3lWPZnsvjHXvNo476lwOk0ECsnEJ4gu+dDYkD9UZTCWR9DabPbihdDsmhOwPWVdo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(6133799003)(55112099003)(22082099003)(56012099006)(10067099003)(11063799006)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHVad04vK0dPdEJFNXVXUWlNQStCU1NQUXRQWnFnRVNITVdnckdiaXV5MDd5?=
 =?utf-8?B?VjNCRmM5QW8reTQwQ2w5U2RYekVoaXRpanFiN3VuRmk2ci9paSt6TE9CNGRo?=
 =?utf-8?B?L3dmWHhFcnJhdGRqemZ1ZXlKZUF0NEFYcHNGZm1SUjBVUEd0dUpFU21Tb2ds?=
 =?utf-8?B?TmpnV1ZNMXNsR2R3V0VCTDFmVWlwck5wQU83WUo1bDZSNjk1YlVmNUZYMCtP?=
 =?utf-8?B?TUQ2K0UrdUE1c1pqWWdQWkdqNGRsZ3ZUT01kTFkxQmY2aTBBbU1vRXFNd3cv?=
 =?utf-8?B?RHFON3ZVTWFJZll1bmo0V3dTWDQrSHQzTWVoMThTc285Mk9uVjRXdEM1ZmZm?=
 =?utf-8?B?MXlVSlg2SjR1eHhOdTFQRnRkdnMzUXNUTitKeXVjalhjV21FcTBNeWtoOEVP?=
 =?utf-8?B?M005T2FLSFVWYU5vVkJSZjZaNldpL08zWEhwMjFNdWtaeG5aK3RRalB0L3Fk?=
 =?utf-8?B?VVRzcFQxYmNXNUMxd01xZDFLUG9PRkROZktBQUZEem9LT0R2QlVGZmdHWlMy?=
 =?utf-8?B?cDFZNTdOZERCdEhQbUVKLzZweSswSXZOZ3k0THJNdFVLK0tiUUY3NERqR0dM?=
 =?utf-8?B?c3A4dHhrUXNWK3k5RjN5WndFM0dreVI1UW9FUDJWM2F2cU94WTlhZm8zSkww?=
 =?utf-8?B?ekg0cFBIWjlObW5ZTEFvY2N4bHNrTjNqY0h4UHRkOHl4cUJSei9qWVNVMFFm?=
 =?utf-8?B?dG50OE1BbjFDeVZhVm85dmtnNlJwd0hzaXpEYUNucysvQ1JIUDQvZVJFTTlR?=
 =?utf-8?B?Qnd2MjVpeDVSOElTOFBranQvODJBYy8rTHhvZElvc3BRNXU1OWIyUENyQ3lW?=
 =?utf-8?B?dHlFMU9MZXF6Zmp3QzdkV2dkQTFlRFIrQXI0ZHZ4cldTR2djQWRxczcxN1hS?=
 =?utf-8?B?TXk2SEV4UnRzblFqS0hYRXcrazgvVWhRQ3gxRzdZemV4M3BYdW11TER3cklq?=
 =?utf-8?B?eXZhT1ZESUtHdndXckF3SkxQQnpobTRKQlRwV2ttbUovNHNNc0U2S0x4dm95?=
 =?utf-8?B?Nk1INnZZc3VhdG5VS25DendYelpSOWR3N3JyblRicE9IR1ZCV3p3cG8zRVg0?=
 =?utf-8?B?OU5CbWZGQnZxRmhBMEdOb3hNb3J5UXVzZExxL1Y0OU5ZL00yekl1Q2ZORFQw?=
 =?utf-8?B?eWJpcmswWFMxeTdjcndrREhzeEFhS0g2clJ1cWIzR2E5L3k0NlZHaEVlVjlF?=
 =?utf-8?B?akhka0FYQk1BMHM4eFVBVjk4cVRXZ1VTcVBYbi9wcUtxUGRhaUFoV08rQ3NT?=
 =?utf-8?B?OUJTbldqd2N1emg0V1lSU3laNmtlQjlNWndySDFDNmRZNVk4RnNUQXg1RFR2?=
 =?utf-8?B?TTNzM2N4dGFsd0tZYStNYXNEejUvaGlXUnFRckJSenRMdGw0OHZRNnFRMXdJ?=
 =?utf-8?B?SDBHZEV0RmJlWkNaUXBlOVRLdzhXUDhDOEFHLzhMWUQ1UkNUdXlRb2VVdm9h?=
 =?utf-8?B?dmxXT1ZHT1FCb1NWZXJaNWNDNmlxZEUwaFQ5aVg5U2F5S1hpaGd0aDNOSWZM?=
 =?utf-8?B?S3U5M1BGUHltQnovSWhxQjNzQmYyOXdvaEtDcytCblZDNWZpMTVnR3k3MXI0?=
 =?utf-8?B?dUZuR0c2M1lsYkJIQmJ5LzJTSmVLbnlyS3VxTEVteXdETGE5dVFKUVhZOE1G?=
 =?utf-8?B?aEdkYzRsMkVTMkFIMVNMdWgyeWJWTzJMTUZ5cWMvRC94dWJrWHFnQyszVnFo?=
 =?utf-8?B?b2pOSCt3UC92TjdrNEJSVDdUZHN2eWZ3bnpYWWxlc09YcVl4YzJuRkg3NlBU?=
 =?utf-8?B?MEZrNjFBRCtJeVpOTmtrdUozSGRya3NFNFY5OUhaekk3eFNzdU5rcFlxYkth?=
 =?utf-8?B?dnV5TEFQSmFtYTF6NU13c2ZjWStaeG1BaGt6c3BaOGhTMGRBRzhmQk10T1dK?=
 =?utf-8?B?aVBiU2d0ZXVEQnEvUGpqTzhkQWIxSEM4dlpaOFFieFFjcGYwVVhVaWRXenUy?=
 =?utf-8?B?RmpyeTAwdi9BUDJmWEtyZzB2UVpQTWNNTlFTMVA1KzFCbXBaTGZwNG5nL0RQ?=
 =?utf-8?B?SStpQkJ4SURlQTdCQUNtZXNIcWc1ZWhqclU4aDZNWkVVVSt2azhnTGdocWk0?=
 =?utf-8?B?NGFwYmxaeE0wNDg1ZzlFemJLc3RPZkZqdEF0cXVJY3VUeHNPejM5cys5cUha?=
 =?utf-8?B?cFRVTnNnbUZ1T1orR3FoSUJmbDVFd1pJK3NIamVvc0VSNWlybWtnQWlHa3o2?=
 =?utf-8?B?NmZaMngvK0g0R2IzUTBkVytwRGlOQTNMS3U4TzdlemNsYnJZbHJVTE42NEVz?=
 =?utf-8?B?RGxxQUFiWFpONzFOWWZoY3NGZUtwMHp6Rmhjc1pocDdvTm9XOExCMjY5YTRx?=
 =?utf-8?B?VVIzcm9JYkQweE1yUkI1THM0NkRCMnI0RURyQTBCN1d0cEwrVWNocXZUSE1C?=
 =?utf-8?Q?EQxfCSW//swgKnbE=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ef3f01-3608-4116-f098-08df09dbe61e
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 16:53:37.6659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7ysipmJIycTPTgUhuAecPEDdAmrt5WrSvBbo+UcYs2Gv2wwv3cnHkvgPCskDr1nds+VrRp9xl4yZew0dlQFDXYpe+dfxgqbzs/spijEx70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR03MB8055

On 9/3/2026 7:40 PM, Dinh Nguyen wrote:
> 
> 
> On 7/14/26 17:16, Adrian Ng Ho Yin wrote:
>> On Agilex7 and Stratix10 SoCs, secondary CPUs must be offlined before
>> a warm reboot to ensure a clean PSCI state. Register a reboot notifier
>> that calls remove_cpu() on each secondary CPU when SYS_RESTART is
>> triggered in REBOOT_WARM mode.
>>
>> A snapshot of cpu_online_mask is taken before the loop since remove_cpu()
>> modifies the mask as CPUs go down. CPU 0 is excluded as it is typically
>> not hotpluggable. Failures are logged and the loop continues so the
>> reboot is not blocked by a single CPU that refuses to offline.
>> The of_device_id table carries a per-compatible pdata flag to enable the
>> notifier only on platforms that need it; Agilex5 leaves the flag unset.
>>
>> The notifier is unregistered at the start of remove(), before async
>> channel teardown, to prevent a reboot notification from racing with
>> driver shutdown.
>>
>> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>> ---
>> changelog:
>> v1 -> v2:
>> - Drop workqueue fan-out: remove_cpu() serialises on device_hotplug_lock
>>    internally so concurrent workers provided no parallelism. Replace with
>>    a single sequential loop over a cpumask snapshot.
>> - Fix CPU identity bug: get_cpu()/put_cpu() did not prevent task 
>> migration
>>    and the notifier can run on any CPU before migrate_to_reboot_cpu().
>>    Exclude CPU 0 (typically not hotpluggable) and offline everything 
>> else.
>> - Fix pre-count race: the two-loop atomic pre-count had a window where a
>>    concurrent hotplug event could cause dec_and_test() to fire 
>> prematurely.
>>    Eliminated entirely along with the completion and timeout.
>> - Replace of_device_is_compatible() checks with a stratix10_svc_pdata
>>    struct carried in of_device_id.data, retrieved via 
>> of_device_get_match_data().
>> - Move psci_cpu_off_teardown() to the top of stratix10_svc_drv_remove(),
>>    before async channel teardown, to close the race where a warm-reboot
>>    notification could fire while the driver is being dismantled.
>> ---
>>   drivers/firmware/stratix10-svc.c | 88 ++++++++++++++++++++++++++++++--
>>   1 file changed, 85 insertions(+), 3 deletions(-)
> 
> I had a patch conflict when I applied it on top of v7.3-rc1. I fixed it 
> up, please take a look at socfpga_firmware_for_v7.4 to verify the fix.
> 
> A few comments:
> 
> 
>>
>> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/ 
>> stratix10-svc.c
>> index de938ab2db0b..e10550237ea1 100644
>> --- a/drivers/firmware/stratix10-svc.c
>> +++ b/drivers/firmware/stratix10-svc.c
>> @@ -24,6 +24,10 @@
>>   #include <linux/firmware/intel/stratix10-smc.h>
>>   #include <linux/firmware/intel/stratix10-svc-client.h>
>>   #include <linux/types.h>
>> +#include <linux/cpu.h>
>> +#include <linux/cpumask.h>
>> +#include <linux/of_device.h>
>> +#include <linux/reboot.h>
>>   /**
>>    * SVC_NUM_DATA_IN_FIFO - number of struct stratix10_svc_data in the 
>> FIFO
>> @@ -96,6 +100,14 @@
>>   #define STRATIX10_GET_SDM_STATUS_CODE(status) \
>>       (FIELD_GET(STRATIX10_SDM_STATUS_MASK, status))
>> +struct stratix10_svc_pdata {
>> +    bool needs_psci_cpu_off;
>> +};
>> +
>> +static const struct stratix10_svc_pdata psci_cpu_off_pdata = {
>> +    .needs_psci_cpu_off = true,
>> +};
>> +
>>   typedef void (svc_invoke_fn)(unsigned long, unsigned long, unsigned 
>> long,
>>                    unsigned long, unsigned long, unsigned long,
>>                    unsigned long, unsigned long,
>> @@ -280,6 +292,7 @@ struct stratix10_svc_chan {
>>    * @svc: manages the list of client svc drivers
>>    * @sdm_lock: only allows a single command single response to SDM
>>    * @actrl: async control structure
>> + * @psci_reboot_nb: reboot notifier for PSCI secondary CPU offlining
>>    * @chans: array of service channels
>>    *
>>    * This struct is used to create communication channels for service 
>> clients, to
>> @@ -296,6 +309,7 @@ struct stratix10_svc_controller {
>>       struct stratix10_svc *svc;
>>       struct mutex sdm_lock;
>>       struct stratix10_async_ctrl actrl;
>> +    struct notifier_block psci_reboot_nb;
>>       struct stratix10_svc_chan chans[] __counted_by(num_chans);
>>   };
>> @@ -1981,9 +1995,60 @@ void stratix10_svc_free_memory(struct 
>> stratix10_svc_chan *chan, void *kaddr)
>>   }
>>   EXPORT_SYMBOL_GPL(stratix10_svc_free_memory);
>> +static void psci_offline_secondary_cpus(struct 
>> stratix10_svc_controller *ctrl)
> 
> ctrl is never used in this function.> +{
>> +    cpumask_var_t mask;
>> +    int cpu, ret;
>> +
>> +    if (!alloc_cpumask_var(&mask, GFP_KERNEL))
>> +        return;
>> +
>> +    /*
>> +     * Snapshot cpu_online_mask before the loop; remove_cpu() 
>> modifies it
>> +     * as each CPU is brought down. Always preserve CPU 0 (boot CPU) to
>> +     * run the reboot.
>> +     */
>> +    cpumask_copy(mask, cpu_online_mask);
>> +    cpumask_clear_cpu(0, mask);
>> +
>> +    /*
>> +     * Offlining is best-effort: if a CPU refuses to go down we log the
>> +     * error and continue so the remaining secondaries are still 
>> attempted
>> +     * and the warm reboot can proceed.
>> +     */
>> +    for_each_cpu(cpu, mask) {
>> +        ret = remove_cpu(cpu);
>> +        if (ret)
>> +            pr_err("psci_cpu_off: failed to offline CPU%d: %d\n",
>> +                   cpu, ret);
> 
> Perhaps use dev_err()e so that you can use the ctrl->dev?
> 
Will update to use dev_err instead. >> +    }
>> +
>> +    free_cpumask_var(mask);
>> +}
>> +
>> +static int psci_cpu_off_reboot_notifier(struct notifier_block *nb,
>> +                    unsigned long action, void *data)
>> +{
>> +    struct stratix10_svc_controller *ctrl =
>> +        container_of(nb, struct stratix10_svc_controller, 
>> psci_reboot_nb);
>> +
>> +    if (reboot_mode != REBOOT_WARM)
>> +        return NOTIFY_DONE;
>> +
>> +    if (action == SYS_RESTART)
>> +        psci_offline_secondary_cpus(ctrl);
>> +
>> +    return NOTIFY_OK;
>> +}
>> +
>> +static void psci_cpu_off_teardown(struct stratix10_svc_controller *ctrl)
>> +{
>> +    unregister_reboot_notifier(&ctrl->psci_reboot_nb);
>> +}
>> +
>>   static const struct of_device_id stratix10_svc_drv_match[] = {
>> -    {.compatible = "intel,stratix10-svc"},
>> -    {.compatible = "intel,agilex-svc"},
>> +    { .compatible = "intel,stratix10-svc", .data = 
>> &psci_cpu_off_pdata },
>> +    { .compatible = "intel,agilex-svc",    .data = 
>> &psci_cpu_off_pdata },
> 
> I'm not sure why you need this of_match_data to make the distinction 
> between the 2 platforms when both platforms are performing the same 
> function.
> 
We need to keep of_device_id.data rather than dropping it because both 
intel,stratix10-svc and intel,agilex-svc happen to share the same 
notifier path. A separate patch adds intel,agilex5-svc without .data
so Agilex5 does not run this sequence. Agilex5 warm reset is an 
SDM-owned HPS reset (REBOOT_HPS) that holds secondaries in the 
reset-release / P-channel block until ATF CPURSTRELEASE.
