Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010043.outbound.protection.outlook.com [52.101.46.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B11498E20
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792173874; cv=fail; b=VjA9zSenvIhcs3K3/j4VtW91qKlOzZfOQyfxuXX9EEfiRwn/eT0zr9rWe0NOqJDAXDQmox7LZNNTk3CamflXu1RD2a8fGOQyhchbcjP8AWiEfY81D38jL/jRPq/mZ8b9bcIVO3FCQA9Kxwd6Ci7uMLnSshUBenBFwCBnIJttSAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792173874; c=relaxed/simple;
	bh=abBtl774RqOVUqNHntvn78LSHF9CKxjQj+hKY6y6e24=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QxzD2ms/PlfOgI1CPHNQgS8ICZNkmcTBwkMPRgGsgGA73GZabzF98FAzoMfNmo239vvdSI8HhBtlFql5P7XgHTaPmoeoeRlx9lTg+ieLjw2Z1ky39S7AOQb/Rh4CTaP1Q+bb60RP8I9yO8ohSemVrwQz+eJrdhR3amwx326ilT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=citrix.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=oDn/aGdv; arc=fail smtp.client-ip=52.101.46.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citrix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="oDn/aGdv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7h6V3YKevzs/XIy4ARr/hZbUBuPFaeCUxzLL3FLrrEyMyzA+fnh6K4cvHyTlAqlk6GpUGEQ6OtMq8Dosyc3JFC1CLF6KpRx33u/jQx6zLpSsoNjJUPmmfOnzjvSHhBJxDvq6vSneYZCt7QkecGy0DAXhNoZ81hMn/DDLLJfOreJ+ngenG4nZifyT2i2mi2m2dS6Rj5EVvgHaLRZDvEc6oc/Q4L7BIFADhdLzZqel/YF2Xlg9uOfPQKLWPgGw1v4IarZU5Vindeo2cwfKuHN3vSPQs4eASVnRIw0KS+9fgHpPGzpiIhENUdk1bQGt1d7QR0KXWRwUWYBGXzKmQ+Cvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abBtl774RqOVUqNHntvn78LSHF9CKxjQj+hKY6y6e24=;
 b=mwqpDv8/VC60TjNpb7GiNxN/MwK8CJZf2D0tQz89Np8rAH0QxgbPqdjvkfLqbvQZ3roz/NabOuiteYE35mDgBcBoW27puvHIu9OW+lYYLrfSf1jjiDf2aU0Er6mOcjuaXy1L5Je4Fk1f51j14N0/rKJG5+c2oNaLbuVP3IUM9kqM0UbUnNsuEj0E4HvWMm3QIe+T1gpImJCKgu/nZ3TkPUlkLAnhlC7pOUkdsxmM81NdyqreVTZgM2Stj7zoTGXCB6zNUnEHxhx0SUSrCYwKzsW39LRFaMeCSftLXfVGiVDJJaiVdfiNGQUx+27bJbi9FKNKlaqvgLPolq2l8bY+oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abBtl774RqOVUqNHntvn78LSHF9CKxjQj+hKY6y6e24=;
 b=oDn/aGdvOeQe+daZwa5w2NEW6buRfr6tNx1PUZgIi0Qv2OB2b/u+JrwKVQOpVONNwcfWii7VZXVI6PmSDU1Z1hzpgUmKuBirIDNJIyXIoEjbfu4y1sI5sPVMtIad8zeZOsRljwtyrw6lvL/day9H3v4rsn5VVluMJebvSGklWxk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5599.namprd03.prod.outlook.com (2603:10b6:a03:285::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 18:04:26 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 18:04:26 +0000
Message-ID: <e934ac9c-cf59-446a-9b1f-ddca4c43d1c5@citrix.com>
Date: Fri, 16 Oct 2026 19:04:23 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 David Woodhouse <dwmw2@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/8] x86/xen/pv: Don't setup runstate area too early
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <1792170295.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@vates.tech>
 <1792170392.8631fc262581453bbf619ec5b2062170.1a145adfbff0008425@vates.tech>
 <b2c02327-4d77-4ab3-855c-26b5d357f348@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b2c02327-4d77-4ab3-855c-26b5d357f348@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0650.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5599:EE_
X-MS-Office365-Filtering-Correlation-Id: 38ca53fb-c6e3-4196-192f-08df2bafea9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	wX5/QKQVAMxEUSxWYPA1qyhmg8GhIXaX3TPih3SUlTQxdp95MZXg3+Ds11qwSwa8RFGdD4NRnHiROXJyEB7FNLAjHH3uEAuTWgp6ffaI2zo8a9l6hnB8OxcFy8lVvZZ7HMrjHFvbQuS2g53+s/bdFjn3Qgup0HnT5dckwvQftJ6cHQdEjiDYYGjxzd1MjfUdBqOyawkRU0Pw8hmmJAzzx3taHwoYccvjmq8tMkq3suLdpHb9pm1MxJ/ixpB6MHOnGFfyEWfcgMZncMzupoS4ltdhh0z2sRhvFQIWNjZCUwj6YmUczxpLOSuccnOjrKGYn6oPx4M+bVglAc/GZvYQPetlM5lLDvl1OCV89XKlsm1vvHoRLzwaUjy3LtOW+gNjqrsMypsYdJLhIuMaWhyMy4Ad/sL/o1+bb6SbQAUJGK91BHByJFbfLuHYrmPG3R1NIpGKeBsjRw6aFF9Frd0i0sHjRWKlk1+Rtnyvp5mdhWzMvYiPfWXoj8ljT+FW0NgsU7Y05WATXHD6rI04rNIGH6hPKhLXkvKmRFMb85ZtKG3my+ZZmhGdW8D776qXNho5vYY0hgaX/Blk65c3gTwb2em8eVeuHTKm7f6fPfaa2u7nAqHhHUrlmOGjfZsdGspXzBSHT/y/JZXVtEtK0ZPcvhryC30+Vga1mdn7eRI62bU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vm15eUZMWk13bjJIUkk0eWc2TVp5cVJSNjJRam84YjNNckYvM1JLdm56SWdl?=
 =?utf-8?B?WTNvbDBvZ20rZ2FpZXRzNnc3YmRBcGFnZm93OFUwNjA3aWoyd1E3TjAxQnJY?=
 =?utf-8?B?bU54TUQwOFpibWNQcjBpL2ZmM0R0bENTamQrOXR2OEFtUXFDbjBlUGVJbTN1?=
 =?utf-8?B?T29odS9Ndjl5V3o5UW9GaU1hT2IvWlU4VDFwbjlFalI2Vi9XaGprcG9jRStz?=
 =?utf-8?B?c0tPc2lBekpWeWFpNUJkTTBwUlJ1dW15UmpwNThodnRYN2pBM2pNUjhHMTVx?=
 =?utf-8?B?MzZLOVBKWEpEbng3UVYyUXZDVnF3TVJaMzM1bFc2anV5WDdZdFZuNVcweGl5?=
 =?utf-8?B?dkwwY0JSRFlOUk1sNDFGNmtaQTNnbjRkUSt6ajU1TU5LZTAxdW51cS9xNEpC?=
 =?utf-8?B?MGpYakxLWjY1RUFKcm94eVE4SU9UMDBiRE5lRldTT2Iwc2NLM09IZXNWbW5u?=
 =?utf-8?B?cnBmUElzdW1reGFVRC8yckY4Qlo4d2h3czNqUWRMMFlVVkZ4Sktxbys5MmpN?=
 =?utf-8?B?SkhvbjhlY25NcDhSa3hpbWFTNEJ5d0lROVBoSWt6UGhDOEVwaldBMVJiVFBQ?=
 =?utf-8?B?d2twS2JETTkvNjh3RzAvcXNDSEVJQ0dYSkI1eWxOZFQ0QkU0dnRuRlh1SUpE?=
 =?utf-8?B?aUY0R05IV2E0SHhxbGd5c3FiR0dacy9KbkpRdFMwdHhiVnlVY0RPR0hBR2kr?=
 =?utf-8?B?K3J1Z3FMenJyYy9PWld6S3hPNmZ2MXdCT3ZaT3Ezd3BnT09FK0FsKytSbUpu?=
 =?utf-8?B?aGYxWVZteHF6S09kUzNPVjJ5S2NvdGRFcGIyWWs4UERxdWNFajY0OUxHaEw5?=
 =?utf-8?B?RGVEZUN2WEgxRE1zeXl2dkp1TU9tYmUzRHp4ZlQxekZGbGwyK0NoczJFMWF6?=
 =?utf-8?B?dFZHaWZmVlZZNCtPdXlXT08xWmkxbzJ5dlNoWTI2bHY0enhIc3hqL09oQ0RT?=
 =?utf-8?B?OFJVbUxmd3hlNzFkUG0ya2xkTDlURDYxak5hMFhiVFc1cmFRU3ZaZExQZndr?=
 =?utf-8?B?OHpjSmhiaDJsZjUyTkNuWGY4bDhCaU5ZWjhBS1pUVmFpMUhTRGxubEZUZitN?=
 =?utf-8?B?dVN6QkFMZnRKZC84NUdVN3FNZ3ZqVEExbXd4WDFmaHFQVUQ5eUxrbFViYnFu?=
 =?utf-8?B?azREMGg3d0Z3R1NkR0hRTlFabGFmTGNQTm1taXRVWGNwUHdRN2VJTFVsZGpi?=
 =?utf-8?B?dEpMZkhRcXY0bkkwZVlINXNzNjVDS3h5VkI2USs3bnMwSmFhcVU1Yk1FZHlG?=
 =?utf-8?B?UW1BbUJsdmRXVnJNOU1QQnUwUHdycm42c2ttOUhLYnF5MGVzbWdHdFVsOFFT?=
 =?utf-8?B?eVlVRVY0cE9KZytTb3RVcGlzTW5xYTFuVU1PM0JLSTJzaXE5MVJSQk5xTkJC?=
 =?utf-8?B?aHh0VjhjRzhSb0tEbmVVU3hGZmc0a3RVVFR6ZlFJME1VOHNsNjMwT054Tnor?=
 =?utf-8?B?Z2lQN2RnSDl1SHZhT3RkWnpSTGVNSmRKaDBvZDBSSVg0dld6cTlicTBzM2lH?=
 =?utf-8?B?WDdSTEV0VGExdllyZU9RY0trVHpFc205UUxFMHFCditrKzJZdWpiUld5N3di?=
 =?utf-8?B?ekpxZ1IyOUFXZXpVc2FUOVZKSXgwTjhkQ3paYVJTbUplTld4cmRZZWV6NWh5?=
 =?utf-8?B?VlJVbEVYN2dGVFdET2xwS0FobWhKQk12NmVOWjQxT0dTT2lVTmpQeG9rNEh4?=
 =?utf-8?B?dlNhaWVMUmN1ZmJjSCtGeXJqNlBTMmZpYUNlT1ptZ08rUkROejdUOSt4T0l1?=
 =?utf-8?B?czVXTjB5V29ZdEx4eVo5OGYwVW4xQmg2Q0xneWtjN01uRnI4cCt5NnJQYmRj?=
 =?utf-8?B?ckEvSEpnbWRNc1BZa2hhbTNibHV4b2ZZTFh1ejBoL1pqSnZwWEg3K3ZiUFFN?=
 =?utf-8?B?ZnU3VXJCSEVKZzI3RDhnSEhVSmxEZTd5NXVlSHZyck1JR3lSbHZxdWhidWRk?=
 =?utf-8?B?M1l1WmNRVkxFN3R6akpQQjNsVGsvczFZVUVjWElnRFRUVjhZNERrdzF0YnRW?=
 =?utf-8?B?eCtaWk8yREZGc2JEbThvNTl2NmpzYklRZzh4VklHRTZpMTVwRHFQK2tBaUFY?=
 =?utf-8?B?anh4R01RR1FpVzE3Q3p3cElwa3Vrdmg5d2hzQXd4anJvb0M1enZaSmRwQ2FD?=
 =?utf-8?B?QUZ1OUVSWlJtSElWampxaUFrSVlnWlB5Ylp6SWZBRjgrclI2QWNlc09QSWhK?=
 =?utf-8?B?Y2VXdU5YUzJINW9HaW5idHlpWXBZVVltYktwRzBsWXZqYTJ5dk5mS0hZQW5h?=
 =?utf-8?B?aE9VRTh6T054dk5nWGlpb3dCeDNFdER6RDdDUFkrZlh0YU1KMjFjUlBVcUdV?=
 =?utf-8?B?Z0hHS3I2WVdKcFdyazF1dFJLQVBYSlpobGRrcTk4cmhsSjJLYXUzaURGa1Vn?=
 =?utf-8?Q?UjXGihEg3PWUblfE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ca53fb-c6e3-4196-192f-08df2bafea9c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 18:04:26.7196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /M7nYzyOx56q4JFK18IOeZqG/phV4BVuOXRgXklnRfX7rVfLKG0GePfZ1hqH3CUb/SrYdSkjev3FocCpTQuQOjlm4PFH2WZhWTN6MedxF7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5599

On 16/10/2026 6:33 pm, Andrew Cooper wrote:
> On 16/10/2026 6:06 pm, Teddy Astie wrote:
>> This is no longer required since [1].
>>
>> At this moment of boot, per_cpu areas are not initialized, which prevents
>> using VCPUOP_register_runstate_phys_area as per_cpu_ptr_to_phys() would
>> misbehave in this case.
> This isn't really correct.
>
> The per-cpu area for the BSP is within the main image, which is why the
> logic functions today.  What's missing is the call to
> pcpu_setup_first_chunk() which tells per_cpu_ptr_to_phys() about where
> the BSP data is.
>
> I think you want to say:
>
> "A future change wants to use per_cpu_ptr_to_phys() in
> xen_setup_runstate_info(), but this call is too early.  It turns out to
> be no longer required since ..."
>
>> [1] 8a22b9996b00 ("xen: drop xen_sched_clock in favour of using plain wallclock time")
>> ---
> Missing SoB.
>
> ~Andrew

But this does pose another question...   Linux only ever registers time
referencing vCPU 0.  Why are the targets of the registration in the
per-cpu area?  That's presumably wasted space on all APs.

~Andrew
