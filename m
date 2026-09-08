Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C22548541
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879915; cv=none; b=XdtlIgZPlwem+Wqw6SU51svJOjPqdLZboVPKMTyig4+WVz0Hjbfb5RqPB4DuOizpnmQT+dTjH41QqvDMS/3HE2vl0bVTBl8SaB+/P9zq+tzXiRQy2eBavdMPJ8pYjh4vGuIbxpXFlo5Q5mBJBkEwQ6BVriwoKdcoLV8HLGWod7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879915; c=relaxed/simple;
	bh=gqKpoVXrQFH4KOv6IUgmKs/r5/Mr4uEZZHx6oJP+fo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ugW6TepXPg00sYfFPq6316tI6lOSlH+bGazDZZcgzMI4V/ACimZJnb5oyHNJikFNCTFzlPIVhBIgACE2a5sajbt9qfWcmxSqr/lg0nP06c++/eCExEa+v9rFi76o7QODQUNwcDxEyJVUKpnFxfKR6AY/nQ6v3HEETFBD4DrhiHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OwuSUGgk; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OwuSUGgk"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 209781476;
	Tue,  8 Sep 2026 08:04:57 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB0A93F7B4;
	Tue,  8 Sep 2026 08:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788879900; bh=gqKpoVXrQFH4KOv6IUgmKs/r5/Mr4uEZZHx6oJP+fo0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OwuSUGgkh1ci2w4cPfRT3NKJhl8/g9f/5KML0M7eNCBh0F4jRsx9TkSWXINpLU49p
	 UdvnH1j0XeF5BbaZ9+vK16Q+RGmqEA1tikEW7Z/aWLqd4j1WJ2x2XbgIF5Ru2hfqKj
	 l+C9VT2oxCrxtO2JUnmThizWFfgvgAlBBnpdldgs=
Message-ID: <58adffd2-6ef4-4a4c-ba3a-3f510522d928@arm.com>
Date: Tue, 8 Sep 2026 16:04:57 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/arm-cmn: Fix {wp_dev_sel2, wp_dev_sel} limited to
 0/1 when MXP_MULTIPLE_DTM_EN is TRUE
To: "allen.wang" <allen.wang@hj-micro.com>, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, peter.du@hj-micro.com, andy.xu@hj-micro.com
References: <20260819105443.668784-1-allen.wang@hj-micro.com>
 <f97fa5ae-3535-4e1a-a164-77138a93cc89@hj-micro.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <f97fa5ae-3535-4e1a-a164-77138a93cc89@hj-micro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2026 9:15 am, allen.wang wrote:
> Hi,
> 
> Gentle ping on this patch.
> 
> Could someone please review it when time permits?
> 
> Thanks!
> Allen
> 
> On 8/19/2026 6:54 PM, Shouping Wang wrote:
>> When MXP_MULTIPLE_DTM_EN is TRUE, each DTM will monitor at most
>> two device ports. In this case, {wp_dev_sel2, wp_dev_sel} will
>> only use values 2'b00 and 2'b01 per DTM.

Hmm, I read the "each DTM will only use..." wording[1] as implying that 
the hardware itself would ignore wp_dev_sel2 (especially since that 
would seem to be the obvious thing to do) - are you saying that that 
isn't the case? (I've never had access to any actual multi-DTM hardware...)

Thanks,
Robin.

[1] 
https://support.arm.com/documentation/102308/0307/Debug-trace-and-PMU/Debug-Trace-system-overview/DTM-watchpoint?lang=en

>> Previously the setting allowed values beyond the supported range
>> per DTM, which could cause each DTM to select invalid ports when
>> MXP_MULTIPLE_DTM_EN is TRUE.
>>
>> Fix this by applying `dev %= 2` to clamp the selection value to
>> the valid range when MXP_MULTIPLE_DTM_EN is TRUE.
>>
>> Fixes: 60d1504070c2 ("perf/arm-cmn: Support new IP features")
>> Signed-off-by: Shouping Wang <allen.wang@hj-micro.com>
>> ---
>>   drivers/perf/arm-cmn.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
>> index 40c05c519a1d..13ccbf2a7345 100644
>> --- a/drivers/perf/arm-cmn.c
>> +++ b/drivers/perf/arm-cmn.c
>> @@ -1392,6 +1392,7 @@ static void arm_cmn_claim_wp_idx(struct arm_cmn_dtm *dtm,
>>   
>>   static u32 arm_cmn_wp_config(struct perf_event *event, int wp_idx)
>>   {
>> +	struct arm_cmn *cmn = to_cmn(event->pmu);
>>   	u32 config;
>>   	u32 dev = CMN_EVENT_WP_DEV_SEL(event);
>>   	u32 chn = CMN_EVENT_WP_CHN_SEL(event);
>> @@ -1404,6 +1405,9 @@ static u32 arm_cmn_wp_config(struct perf_event *event, int wp_idx)
>>   	if (is_cmn600)
>>   		grp &= 1;
>>   
>> +	if (cmn->multi_dtm)
>> +		dev %=  2;
>> +
>>   	config = FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_DEV_SEL, dev) |
>>   		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_CHN_SEL, chn) |
>>   		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_GRP, grp) |
> 

