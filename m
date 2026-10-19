Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013065.outbound.protection.outlook.com [40.93.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8474503E1;
	Mon, 19 Oct 2026 04:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792383199; cv=fail; b=G+DnPYta1viI66uYeSoWA/2ZBzVI40Cg61Cc8/axDDiDjVaOHz7BPAD4pAle9yeWX/mZ22wwuZTJBZFQE3AMrL73u8R/SFD7fGVr9tpCb86pk/mKmyvoVEpqjfEHxRWmBb5ZBoCqVGptlgOV1yHeB7S+0BwQRWL5+zftb8O1CSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792383199; c=relaxed/simple;
	bh=g126lOK/E/lhkzAae0ELMDUIyceokkgKOs5MCTxlXpI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b5xVHtz34tHkPyAm8LErv3NnFlIXoCaOLv07YoCblUoxPUBc1bkl6RDB4RU5ESoMliDfTO1tl4j2TMHO5ihZBsH7t5Pc4XPZ+HoeHV8sQ4LoVJ+j1jut8eWczrveOBYhICjERRYgAXbnDmi0s/v0yauM1iTamBDKgc5FcH1WN6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bNpGL3uc; arc=fail smtp.client-ip=40.93.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bNpGL3uc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=by7vaT7sFybke7+BbD3ns7oabUIB1HzFB5zAxRo7CAui4VjyuiaU6NyOFUQ2+HvuJoEVA1NNngWh3sLiOUKrPdHLjv+mqKJcYe2+xndvUL9zb7aN4IrWX+Jo0ofxwLZ410xGUUtUckAnchhfqEjqGgpa34FDwCzDL/g/1US2BG6YX5T9ermgcGh6OYHT7T0bWaRKe09bEVFNSDuq+H9Y8/nQ/6wA9Tj6P3Sn91ujshzKsjq8D8YOFIfzzhmQP3XIrJaKhYEchaN1o1m71x9aJbB6kuYaCPE6HfOSQmb36YEks57vqcQeKyOGOjAROLZ1XEXYklNU9bOCgb5WxCWabA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQT6Xq4JQ0ePYhJZS89UqF/XJhKtBBhhjeWH8JrQNMw=;
 b=Fax1YdXzLlkPefBhkRQPMA5Bp1xeVkvsxWq2XsAJNJ8bg/pVMlHe8SjRHNv6UkQlYzTkR8qSTzq9H2cWkAtQL6KdSUTU2XJn3vu7xmtR8z9qvbkJQOGFfb9CCgjX/hP2gFZ5iQsk3ETIFH2sJ0zySLZO45ahHW+rgfPqQ5HKnysS8jydJC19/6mtfX+9Tpqavlwe6pDtl7/RqXbNsr9UonxC85TfgHTQOq7cBzfwP1diYF42Vjh7OfWkjPdLgvuzqj97hpcoo0FupzJyjswfyjNXrhzK9bJJjHQDq4E464jgqPdExYJuUQbosL8vDsEqwm9rIEY7c0VE5ZXYK/wFug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQT6Xq4JQ0ePYhJZS89UqF/XJhKtBBhhjeWH8JrQNMw=;
 b=bNpGL3uc3l/soMBOuTj/nev13B+2wALQwptGofPFPAx3JLI3Fpr4zKtuq0Bv8O9xn2zb1OXNdoPXx1xPFBv2EdDrsakbwgnr2bTzNSKQCduPdI273sX5L7epdAkkRm3CRtx1ajfUk55j9zYqGqmSG4XlEXW4WpdGYsyud4OenvA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 LV2PR12MB5727.namprd12.prod.outlook.com (2603:10b6:408:17d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.13; Mon, 19 Oct 2026 04:13:13 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 04:13:12 +0000
Message-ID: <10308ea8-b054-4395-ab98-bd3cd1525d3b@amd.com>
Date: Mon, 19 Oct 2026 09:45:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 02/10] soundwire: amd: cache ping slave status to avoid
 spurious disconnect on timeout
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, vkoul@kernel.org
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Syed.SabaKareem@amd.com, Mario.Limonciello@amd.com, Richard.Gong@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261013085111.2009061-1-Vijendar.Mukunda@amd.com>
 <20261013085111.2009061-3-Vijendar.Mukunda@amd.com>
 <94e1b390-903c-4a34-bd9e-9c128b6c1622@linux.dev>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <94e1b390-903c-4a34-bd9e-9c128b6c1622@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:274::17) To CH1PR12MB9576.namprd12.prod.outlook.com
 (2603:10b6:610:2ad::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|LV2PR12MB5727:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dbad78f-0194-4739-06b7-08df2d974a5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tpSX4xOBm4EgkOgkrRkUtqNDsz132eq/K4vrbw096jmLC3SboIrR5O+bxzlY5VPXpeotPNQye6uq8yiChhyaj0kj7PD/ubPRcSXUodhJu0eKBqabyFx6hBZ8TCaMixjX0Qr0AL4WWkKTYzjBsWdYQHzQDy0VEO/mNq0RfGZiS/TKM+yLj5+84cD+rlPNIZXgz/75ztqHuP7VFGs3uTWTdvIdWCjT7O2gy/CwAik6Qydl/bG7eh/FUDBXl1GF6l1hhY/mwzMaCwJZYuoThFcnxQlt4aGl8cFKgxz4TYht1JZwJsfbDcmVpNR/7SVR1xDDCJ+wilpQ0FUS3jrx/UOPqJIppsWk/BwzbKQXJMfYKbXdF8rzB8/1TeqZNV3o4HpvR9WEK3GEY3gIhHUqUiL6IUGVREU2sBJuhIL3kjlOmcArDa5gV8Up8NBwe8vFzPK+VCCj//WXRrtQAy5bp+Cv39RRB4WelTFF7pVQs97bZayFRWAHMQ93w4ROo2d0tb6lNTmtUM1I3osPzWcdJZntktIsUz+cRNuJMT4WPl+E18W9WS9wgbyhDgPCzDrsXaZbGCTCYwhurFEFNgT+kJTHFxEnuKAteSSBJ0V+zIyO29rgUdPMXJPce9zwPVsDgjtdVWM/a2eGXDJ7tsoEwGxw3eljARMUFIeUOB7gF+UTkXs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFJtYVFhU0JCQ21VZ3ArbTZYajVFNnBEUjhlb0kyWEtsYUFiWWRCNlB5Q1pr?=
 =?utf-8?B?YXhTK3NZc0xyQmN2a3FoUzM4a0daY3U3N0tVSHFOQ1F5VElSOGI4aWVESi9V?=
 =?utf-8?B?aHRZNE4vaWI5VjJjMUgrMk1ZOWFRQUxwL1dkVFh6bnVtYWl2ZkRqNmQ1UXFN?=
 =?utf-8?B?eG5SMFBQUVhROXAxdG95ZXlCYi9ZQ2RWR3djUG5FQVVTMVF1YmFCd0ZYZFQz?=
 =?utf-8?B?UkdQOFJlc3ZRbnArcFVPYVJWYW44WGMwbEZRVExza3BLSFhiOFBpR3cxT2p5?=
 =?utf-8?B?SW5Pb2s2VmN0bWY0YzZmc21uc3pOeVJ2V295YStSWXBrbzZrcmppZmg2L09Y?=
 =?utf-8?B?elEvMHF3eUZjdUU0MkV5NEhsZzVsdmREYkRoTU9DZ1dldUFaNFlhZTlqU2wx?=
 =?utf-8?B?a2lVekhodXQwbWFXOWtFYVhId1pMUExxcmFTWkVBL3ErcHlGQWV0UHpyL0lz?=
 =?utf-8?B?MHB0b0t5K1ZadC9JbVFEWER5MTJ3WXBzZURKYjZJaFBDUHhObWJ4RmlqSUJG?=
 =?utf-8?B?dTFzbE5qK3IrUlJ5QncxeUhON2xnZ2NSczVCaHhWYTE1bnBLNWF6WXVSSW43?=
 =?utf-8?B?ZldhRENSQkFEcnZVKzI5WTU2OTk2aFdGUlJ6QStqUFVoZUkrYnYrZzZWaU9Y?=
 =?utf-8?B?N2k3WHlRcEZoN0pxQVY2d1FNaTRxaUhTekRoZmV5ZkFmcUkrVWtsb2xnVTJk?=
 =?utf-8?B?RWpRcDVDTmhlbzVRTWZZVUdhZFB0d3o0NHYxVHZ4V3BOSHZPRWhZY2diQmF5?=
 =?utf-8?B?ZE9QWU5UNDhWYkg1ZitlOWxseHZCZG5XZ3JWNVRoRmV0clUvbFRTbWNmaUs4?=
 =?utf-8?B?Zm01VnJjdEJQN2VZMHhVT2VGdE02VXU1SHRyK0RwVWtZZGg2VHR5bHBXeW9h?=
 =?utf-8?B?c3dhM2JYZ1Nzb2dubDRBY0N1blNPOGNGdExEWDYvWHRxTUwzbWVQNGRiQk5C?=
 =?utf-8?B?N0piWWd3MElMeHBGSmRLSzRaUWdQekxUREJOclRFMWo3T0JVdzFhTUVtbDZI?=
 =?utf-8?B?bUVGbnNWQ3NqMzVNUWk0Ulo2bC91aDhuYThOcHR6OHMrQjQrZjdEdFNKQ1Bx?=
 =?utf-8?B?cjdtbHhLMERlT1RIMkNETVpZVXlvQXd6N2NGaUFmQldDTW9mQjlNaThHZWlu?=
 =?utf-8?B?NCs3aldIU0ROcW9UcExKK3N6QWFvRzRJRUJCRVhVbXZzNHk0VENTRlRaMmpN?=
 =?utf-8?B?REZOUlROUC9RNFlmL3lhaFZKeXZQYWhrdWxFRG9xbEo4UE13UmduN2gzUzJB?=
 =?utf-8?B?ckZxenZEa2dTaElvOTlrZlhHMmd1WWMwUXRCcGZqNVZ1K3lZclB1M2twZ2FR?=
 =?utf-8?B?U0JWMWc4NmtCc2hocEFWRjBwVTVBVmpwb1B1VzFTQVE2eHpMdHVMTEk4U25N?=
 =?utf-8?B?bHkxVzhERnlzMlpVWXFKSDhVQm9qbjBaRTVQQS80TWpMbmlDdFlyMm9saCs2?=
 =?utf-8?B?bUxOazRVQWxtcmthWGhKTXYrUjdWRUhzTXkxUHVzYTNYeDdpOHRwSkQzZVBY?=
 =?utf-8?B?ZUVlVUkrdDI0RXM2RVk1Wi9BVmJ6eTBrSXJSbWRkRURYbFVtNVdadVNUK08r?=
 =?utf-8?B?V0JyT2VKRWhISWFodVl4dnNHcHNKMFdhRlBuKzVQdVBTRlV1aVB4NWRDcU5o?=
 =?utf-8?B?VXBNemRzVUhjQ1MrM3NXYkthdENGYU5sRDRZTU15K0NJL0MrUnd1SmZCdGEz?=
 =?utf-8?B?TXpncUR4dE54V3QvV243QThUMUNYa0pQa1ZXZzdhV2x0aGd4OVcvL01GZ0tK?=
 =?utf-8?B?OUU5WFpUWk9RRlNiK0xHNjFNNVNVWjhVcWNMdnV2aG5CMWZUd1lSekdnaTNn?=
 =?utf-8?B?UlQvWVBIZUVja1RaT3pJMnNIUVFjWWVNczhDRlFsaFh5MTJiR1FkQkRWUzV4?=
 =?utf-8?B?V1dSVWJ1VGNwSHBkY3ZweGNBNDY0WEcyd2hKc05OUzRjc2tFNmVDdFBVVXlX?=
 =?utf-8?B?S1FSNFN5cW0zNlFvNjk2UWRDVWkybzBOTjFQWlBWUnBUU1lmaWFDejk1a0tR?=
 =?utf-8?B?ZVlNbHZ5ZFBrdXhyelFhZ2oxaTc3cUxVWE1OUUNWQ1JPMGdxbENxUUpJeHBm?=
 =?utf-8?B?VTR2SSs2akROZ1k2aEVuQTh2bzZWZFQvL21YbjRnemIwYnRPdmNibFRnOHlP?=
 =?utf-8?B?SXIyVVJQOE1tN0FjL3lJVk55eXRQZkpvQ3EyTnExTVBnQy9Yc3BFd2ZNakth?=
 =?utf-8?B?OC9zeFppRVd6dTR6QUhQMTdjUkVkaFRxbllzVjRQK2xVdCtFZXc2cm9ESUhu?=
 =?utf-8?B?bVp5R253amJzZVVHWS80VHVQRlkvV3pWZWp4eCtpOUozVkZNcHQ3dXR4dUl2?=
 =?utf-8?B?SXlmNnc3NFowK2s0U0Zmc3g2SDJIYmhVUDZkNDgwWlNacGpWeGtoQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dbad78f-0194-4739-06b7-08df2d974a5f
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9576.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 04:13:12.7478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nx4QDRHV9waadjne5qZHpOZ+z4Dgz9jrFMhpIony1/6xqfoQpopM2J3nV9y4hx6Ueadf9HF1x4DEdzD5vwCbhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5727

On 18/10/26 22:11, Pierre-Louis Bossart wrote:
> On 10/13/26 10:49, Vijendar Mukunda wrote:
>> Add ping_slave_stat to struct amd_sdw_manager to cache the slave_stat
>> from the last successful ping response. On timeout,
>> amd_sdw_read_ping_status() returns the cached value (or 0 if no
>> successful response yet) to avoid the spurious "no peripherals
>> attached" warning from sdw_show_ping_status().
> I read this description multiple times and I don't get
>
> a) in what cases you'd get a timeout on a PING command?
The AMD SoundWire manager uses the Immediate Command mechanism to issue a
PING command. A timeout occurs when the AMD_SDW_IMM_CMD_BUSY bit in
ACP_SW_IMM_CMD_STS does not clear within AMD_SDW_TIMEOUT.
>
> and
>
> b) why the cached value of the last ping is a relevant concealment?
> You'd still get an error message on a timeout...Maybe this makes the log
> "cleaner" but still there was an error in the first place.
You're right. The cache does not suppress the timeout error, and that is
not its purpose.

The cache prevents a PING timeout from being interpreted as a valid zero
status, which can result in sdw_show_ping_status() reporting that no
peripherals are attached. Instead, the last known valid status is
returned while dev_err_ratelimited() still reports the actual timeout.

I will make this distinction clear in the next version.
>
>> ping_slave_stat is initialised to U32_MAX in probe and reset to
>> U32_MAX under msg_lock on entry to the POWER_OFF_MODE resume path,
>> before any hardware step that can fail and return early, so that a
>> partially-failed resume cannot leave a stale pre-suspend value behind
>> for a subsequent ping timeout to report.
>>
>> Add lockdep_assert_held() in amd_sdw_read_ping_status() to document
>> that the caller must hold msg_lock.
> that lockdep_ add is a different improvement that should go in a
> separate patch - it's not related to the timeout management and the
> suggested use of a cached value.
Agreed. The lockdep_assert_held() change is independent of the PING
status caching and will be split into a separate patch in the next
version.
>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> ---
>>  drivers/soundwire/amd_manager.c   | 21 ++++++++++++++++++++-
>>  include/linux/soundwire/sdw_amd.h |  4 ++++
>>  2 files changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>> index fa3f4e797edd..a57b59609bfe 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
>> @@ -453,6 +453,9 @@ static void amd_sdw_read_and_process_ping_status(struct amd_sdw_manager *amd_man
>>  				    amd_manager->instance);
>>  		return;
>>  	}
>> +	amd_manager->ping_slave_stat =
>> +		FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response) |
>> +		(FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8);
>>  	amd_sdw_process_ping_status(response, amd_manager);
>>  	mutex_unlock(&amd_manager->bus.msg_lock);
>>  }
>> @@ -463,15 +466,19 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
>>  	u64 response;
>>  	u32 slave_stat;
>>  
>> +	/* Called by sdw_show_ping_status() which holds msg_lock. */
>> +	lockdep_assert_held(&bus->msg_lock);
>> +
>>  	if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
>>  		dev_err_ratelimited(amd_manager->dev, "SDW%x ping status timeout\n",
>>  				    amd_manager->instance);
>> -		return 0;
>> +		return amd_manager->ping_slave_stat == U32_MAX ? 0 : amd_manager->ping_slave_stat;
>>  	}
>>  	/* slave status from ping response */
>>  	slave_stat = FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response);
>>  	slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
>>  	dev_dbg(amd_manager->dev, "slave_stat:0x%x\n", slave_stat);
>> +	amd_manager->ping_slave_stat = slave_stat;
>>  	return slave_stat;
>>  }
>>  
>> @@ -1087,6 +1094,7 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
>>  		dev_err(dev, "mmio not found\n");
>>  		return -ENOMEM;
>>  	}
>> +	amd_manager->ping_slave_stat = U32_MAX;
>>  	amd_manager->instance = pdata->instance;
>>  	amd_manager->mmio = amd_manager->acp_mmio +
>>  			    (amd_manager->instance * SDW_MANAGER_REG_OFFSET);
>> @@ -1414,6 +1422,17 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
>>  		}
>>  	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
>>  		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
>> +		/*
>> +		 * POWER_OFF_MODE tears the bus down completely; invalidate the
>> +		 * cached ping status on entry, before any step that can fail and
>> +		 * return early, so that a partially-failed resume leaves the first
>> +		 * post-resume ping timeout returning 0 rather than stale
>> +		 * pre-suspend data. CLK_STOP_MODE leaves peripherals attached, so
>> +		 * the cache remains valid there.
>> +		 */
>> +		mutex_lock(&amd_manager->bus.msg_lock);
>> +		amd_manager->ping_slave_stat = U32_MAX;
>> +		mutex_unlock(&amd_manager->bus.msg_lock);
>>  		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
>>  			ret = amd_sdw_host_wake_enable(amd_manager, false);
>>  			if (ret)
>> diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
>> index 470360a2723c..d0e97007e3ff 100644
>> --- a/include/linux/soundwire/sdw_amd.h
>> +++ b/include/linux/soundwire/sdw_amd.h
>> @@ -76,6 +76,9 @@ struct sdw_amd_dai_runtime {
>>   * @acp_rev: acp pci device revision id
>>   * @clk_stopped: flag set to true when clock is stopped
>>   * @power_mode_mask: flag interprets amd SoundWire manager power mode
>> + * @ping_slave_stat: cached slave status from the last ping
>> + *		     transaction that returned a response;
>> + *                   initialised to U32_MAX ("no valid reading yet")
>>   * @dai_runtime_array: dai runtime array
>>   */
>>  struct amd_sdw_manager {
>> @@ -105,6 +108,7 @@ struct amd_sdw_manager {
>>  	u32 wake_en_mask;
>>  	u32 power_mode_mask;
>>  	u32 acp_rev;
>> +	u32 ping_slave_stat;
>>  	bool clk_stopped;
>>  
>>  	struct sdw_amd_dai_runtime **dai_runtime_array;

