Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891450;
	b=Id+aM/Xmyi0pOak/IQBuAxXLD138jFCHXYBbxcmwO2Y/DvAKNrx6xwclHLAoYRKkJnIX
	 e7gpsYShXffROhkj02fD3Lz4qRQRmuAOYW1Ls7VyGvNSa6SkzSD3OXSct/vSXRlriRBzF
	 fT6PsuJTqe5+8bFzGDeeGZmdmIATS2l01eN1r/g0IxvnOiHV5JsDw1dqXPycNWY8L6OKz
	 vEW7jn8suLZ21HiMXVhZWVk7ThOpxnhIjsfwPres0XMRAtgvF+m8lO9/tTSlbbuDhnKwF
	 U1Io9ldplc0L0FOLKAn0JJNufJMnk8s4MVsXKuyie0pjrJTJroLZVOubem1k0bzdwPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xF2MyCPe1SO/SsRhlDuDyRpsUTowZ9eaIobnWhahWMM=;
	b=EnDs8uHu4AaRUfYtywYmvVqH2C2l6EWtsx9Gdc3wem//ascz59jMrrLhN4Ek8pDULcjX
	 xgUiPjEsanEjSTZumnbAk4pbBSGF3ufHTLn5HaJi+yIiAUKQ66bfpKLGZbHKsiaou/Z5P
	 UYuSqoM5kwDv6iiN6oMDxHnMGapZlf/dZ6cR/eGAaPiTsCXbCx03jxJbmP9+VOfO4FAQw
	 mbVhWAt0fb9IsDoEYC2CF/xh7m0YgzH8my6z6zxoLuFwoWjC+/Z43mZ+VXoxl0UDzUGrH
	 FyypsYjgPeyTbLGgmjJHmWPmJ6acIqXo7AjN9hPaY4u8x/8+VUTbmyPs4vXYWPwWspQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=c9iPqoR4;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19D9606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F19D9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=c9iPqoR4
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so18838535e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793891447; x=1794496247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xF2MyCPe1SO/SsRhlDuDyRpsUTowZ9eaIobnWhahWMM=;
        b=c9iPqoR4i2lU4A7xlKx39/EykYZWlgSIgjSKBV39DrsJnL0vLz2kjB/P0sqI3+j6or
         5bGEoX7xJXJOvg7Ign0tCZGTh2KkQUgZiboADtKYk/dm+T9jcudH4kZIcEbek+V+oZqO
         HB6wCgdOGNNw/26rqnVZiL8Bu4m8ba2VV5CCMEqv1rUhE/9QzVyJeItfpKD7h1hLOE2G
         bLp6CM1Z64s+7w0bn73ag9ezPHyZIePIOqYnXN89KNg39cZxGKWKfFahxAeDt0ZtvGUU
         SXayBvs7GqshctvcGKF9YmlYG5Lnf/VuD4fNfl0BWu1L1j9tREM6cgGD8st66a5ySJvr
         tFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891447; x=1794496247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xF2MyCPe1SO/SsRhlDuDyRpsUTowZ9eaIobnWhahWMM=;
        b=pAKY0Nvdx5y2KnxelBMpO6zAzORaVl69WCODiR2TJ8GVd8zva1MX8qXYpUZZj6yZhz
         sSHkKrf/bUkbP7/odP7gSEgxFjLxg2TpKVN0FyjRfUaG3gtK2tQ9QZ8cUwVPxjiJr+V/
         RWcPveSiOgm0X2kyjVhpNKykdtd0F2/N7NmlnMGxT0S0M63xwOWHOgo6BsZQk1yH98Hv
         s7WxcTbKmfWxFeCXqnxYHNfhZv75WW7a5N8bpNk7pzmgDEeM0W/ZL14vhM6e7wzTz1Xc
         1iUDB2rKlJXacl1hH+PxmhSCoIVeNEB7nSeGwmaQwH1vFIrHzKdwcgDqodjEI2a3RLMY
         536w==
X-Forwarded-Encrypted: i=1; AKwUvBw/YQvNxhOiWCCS6OXlCnQVF+VnbK6EjFw5JaLx+lCLzYYFjwoLsbepnHBfQ7iwJnLaCNnCoq28KE5qv6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+08w7oUNDgww5mP9GD8b/v7CfER8ZW6d/SmxnwMz69javFYrzK
	dK7PWL86Eiq2E6LUWKjnHzJYl+VOmWXzJu4cCL5yxYfQJJDD9lFvP6P3xhkvx3y1lJc=
X-Gm-Gg: AYBFou1h/0rJkdwjZxXiMaKjKSOeY6T+G+c3ZasgZyX2JdK7+lmYi8Au4//Bn1nx5r/
	SCoa/Atf0y3Obtw2xt4PX3NXJ8zj8ywNVp6diGA4qb8DJTrsBwt0KUvRbkOgFkzM+YXXA14OCDg
	phjhGfetma5CSXYkFxGoMZypaW1QKirTIcOYfTo9DpivcdQQb2/I0fzso545iv8QHNspBVgDKRX
	TiFzMr3BehSWfjJTEAErBmox5TZIeyBMNTIV4r/kcGmZhhy8nCH/SwEGWS1k51ST/ScF0smVM+G
	am+FvwRw3oVyxOUCwq18SOyhwaFW8tMtDjIIAszn62d21ppQCqFjNHGugRR29L/LqGjcF4RrRw/
	q5qP44jdKn6FPrlpEmrbz+3jk0LbVTSGsQSTLrHE+J0mDyy+P40AFt5jFPx9V/DLcrwKOZLLkhF
	wSXG4PtGGV525tkfJw4b5SGQagznyOTDghfHXvGskX4Gao2Eh9hysZ8CPnNz61u7Y/PnjfhplR3
	6Lh0hx3aoXKwJRI6JKgTxeYVh+3GFN1VDHK4zCFvsvE0Zc9tQApcTzd4vHtLU0mr/nOgyjj8oUC
	Ec0gNuSm863NI0Gq77y1gqYiVZ0wNNaqGeKjjtVE6r2tBgHvumTAQw==
X-Received: by 2002:a05:600c:4752:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4ac18e5d4d0mr449585315e9.29.1793891447318;
        Thu, 05 Nov 2026 07:10:47 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcc6sm132091435e9.2.2026.11.05.07.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:10:46 -0800 (PST)
Message-ID: <f7b19834-dc88-4431-a383-4b73edc5dc4d@linaro.org>
Date: Thu, 5 Nov 2026 15:10:45 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] perf: arm_pmuv3: Add pmuv3_event_implemented()
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Amir Ayupov <aaupov@fb.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Daniel Pereira <danielmaraboo@gmail.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
References: <cover.1792907332.git.aaupov@fb.com>
 <cover.1792989860.git.aaupov@fb.com>
 <23ffe461b8d7b04f78118154dfc9ea1d2a14978a.1792989860.git.aaupov@fb.com>
 <a876b77b-c4e4-4019-868a-af12c93f441f@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <a876b77b-c4e4-4019-868a-af12c93f441f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05/11/2026 14:54, Suzuki K Poulose wrote:
> On 26/10/2026 05:48, Amir Ayupov wrote:
>> Drivers outside the PMU driver may need to know whether the local CPU's
>> PMU implements a common event before relying on it, for example a trace
>> unit driver checking that the PMU counts its external outputs as
>> TRCEXTOUTn.
>>
>> Add pmuv3_event_implemented() to the arm64 asm/arm_pmuv3.h, next to
>> read_pmceid0() and read_pmceid1(). It reads PMCEID0/1 on the calling CPU:
>> events 0x0000-0x003f are reported in bits [31:0], and the common events
>> from ARMV8_PMUV3_EXT_COMMON_EVENT_BASE in bits [63:32] from PMUv3p1. Move
>> ARMV8_PMUV3_EXT_COMMON_EVENT_BASE next to the event numbers in
>> linux/perf/arm_pmuv3.h so it is available without CONFIG_ARM_PMU.
>>
>> Suggested-by: James Clark <james.clark@linaro.org>
>> Assisted-by: Devmate:Opus-5.5
>> Signed-off-by: Amir Ayupov <aaupov@fb.com>
>> ---
>>   arch/arm64/include/asm/arm_pmuv3.h | 19 +++++++++++++++++++
>>   include/linux/perf/arm_pmu.h       |  1 -
>>   include/linux/perf/arm_pmuv3.h     |  3 +++
>>   3 files changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/ 
>> asm/arm_pmuv3.h
>> index 8a777dec8d88a..acd62c4f16743 100644
>> --- a/arch/arm64/include/asm/arm_pmuv3.h
>> +++ b/arch/arm64/include/asm/arm_pmuv3.h
>> @@ -173,6 +173,25 @@ static inline bool pmuv3_implemented(int pmuver)
>>            pmuver == ID_AA64DFR0_EL1_PMUVer_NI);
>>   }
>> +/*
>> + * Whether this CPU's PMU implements a common event, as reported by
>> + * PMCEID{0,1}: events 0x0000-0x003f in bits [31:0], and from PMUv3p1 
>> events
>> + * 0x4000-0x403f in bits [63:32], which read as zero before PMUv3p1.
>> + * Must run on the CPU whose PMU is queried.
>> + */
>> +static inline bool pmuv3_event_implemented(u16 event)
>> +{
>> +    bool ext = event >= ARMV8_PMUV3_EXT_COMMON_EVENT_BASE;
>> +    u16 id = ext ? event - ARMV8_PMUV3_EXT_COMMON_EVENT_BASE : event;
>> +    u64 pmceid;
>> +
>> +    if (id >= 64 || !pmuv3_implemented(read_pmuver()))
>> +        return false;
>> +
>> +    pmceid = id < 32 ? :() : read_pmceid1();
>> +    return pmceid & BIT_ULL(id % 32 + (ext ? 32 : 0));
>> +}
>> +
>>   static inline bool is_pmuv3p4(int pmuver)
>>   {
>>       return pmuver >= ID_AA64DFR0_EL1_PMUVer_V3P4;
>> diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
>> index 02d2c7f45b527..792283d29d7b5 100644
>> --- a/include/linux/perf/arm_pmu.h
>> +++ b/include/linux/perf/arm_pmu.h
>> @@ -124,7 +124,6 @@ struct arm_pmu {
>>       u64        reg_brbidr;
>>   #define ARMV8_PMUV3_MAX_COMMON_EVENTS        0x40
>>       DECLARE_BITMAP(pmceid_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
>> -#define ARMV8_PMUV3_EXT_COMMON_EVENT_BASE    0x4000
>>       DECLARE_BITMAP(pmceid_ext_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
> 
> Could we not avoid this change ? Or why not move both of the definitions ?
> 

I don't think you can avoid it unless you redefine it. But the place 
it's moved to has similar event number definitions, so it seems ok to me.

Moving both makes sense though.

> 
> Also, I would need an ACK from the arm_pmu maintainers to accept this
> change via coresight tree.
> 
> Cheers
> Suzuki
> 
> 
>>       /* Only to be used by ACPI probing code */
>> diff --git a/include/linux/perf/arm_pmuv3.h b/include/linux/perf/ 
>> arm_pmuv3.h
>> index d698efba28a27..c21f185a283d6 100644
>> --- a/include/linux/perf/arm_pmuv3.h
>> +++ b/include/linux/perf/arm_pmuv3.h
>> @@ -78,6 +78,9 @@
>>   #define ARMV8_PMUV3_PERFCTR_STALL_SLOT_FRONTEND            0x003E
>>   #define ARMV8_PMUV3_PERFCTR_STALL_SLOT                0x003F
>> +/* Base of the common events reported in PMCEID{0,1}[63:32] from 
>> PMUv3p1 */
>> +#define ARMV8_PMUV3_EXT_COMMON_EVENT_BASE            0x4000
>> +
>>   /* Statistical profiling extension microarchitectural events */
>>   #define ARMV8_SPE_PERFCTR_SAMPLE_POP                0x4000
>>   #define ARMV8_SPE_PERFCTR_SAMPLE_FEED                0x4001
> 

