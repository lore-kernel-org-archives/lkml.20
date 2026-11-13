Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528940;
	b=i52CdH8MSjn7/dq7W2XY5JQe8yPgBcnX7eL8IyJLilaCUMLYOcRYibpHvbo6PsTxdMWG
	 9cJ0SnS9fQp1kepo0ghfjmiJMmT5e8c0g30/repc7bVHSDY4zeS8FKw0yxGEhtKqBvlSA
	 FtYFBXbo3nqM3xZ3/uuwxJBCPVqr4G5Qce1O4VHAWkRVxuNSVOYiYFPlCfqPUdBMLYjZh
	 KVx2shxxVQL7tNNVHVxYr4bSVPpORJneUiPg/zlbcF7Ul4ILhbEzaObxZJlkeQQtZAQU2
	 xS3XDm669tYIsd+Dk0frHq2K/+2XQMeLEV19JjT0o8BQ7Yi5oMkJmU3FGrwnqZMmpRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7/bS5xYsjMkVnYMzljD0H/p8sgP2J5T4P4gKE/iJBI4=;
	b=ApIWI7OJXxo/Sf0vswcJTkDHWHmHNeJxnsEUYMmeKgTfzb5/9pIxKDGyAKkfRNRX3cc7
	 myeJNgOTg4Yir7QjdmduoYLy6kpQeSMj70/80SQdouVKheT4sL9T4o4FpZHSf4Qrk/GxJ
	 jC/4vLuIENkxSIotaBb0ZR9r4lXnx+jNkHFGyYR6eW4sudBLtRqlIeYlNlODNB8Dv/6HI
	 fTgHpIxoWFELQsAjX4eNYXmIwnUG13H2PPw1xT87E172kWKVMGWxDNVGXYvbGP2bsINFV
	 eLMjioUcLX9XwxwmjuSqrhrjsCEvtteeoR+DJ6k6GmmY9bXti/8bWWppfL+TIDvf1vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kuR+Q7Nc;
	arc=none smtp.remote-ip=74.125.225.137
Received: from mail-wm2-f9.google.com (mail-wm2-f9.google.com [74.125.225.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B268060A2637
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B268060A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kuR+Q7Nc
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-49e6eb11e9cso1707115e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794528938; x=1795133738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7/bS5xYsjMkVnYMzljD0H/p8sgP2J5T4P4gKE/iJBI4=;
        b=kuR+Q7Ncmcmkw9nFvWbCyZmS19GKa8f0nPbP1R+xyzjld7CGdkvXs9BB+UB9Vcf+0L
         MGxEvCIbFmAOs2K+CtWLQy6Jn1wvDeNzRIa0+BNtOH/9fwEOnc86KENI7QyquhxF+ywJ
         xZriczIT8Bo4Io6tRVIwmdkjBmDJFImMmYe1dMYMgfikQ4q3q2La6DHZPJRFgsWXdLtr
         XJKYQ4kbxkrX+oBV5jmlaL3C6XbXH25JKFa/SiInDFcnrss87/Sr7Ddb8yYi4rYIQA9m
         Jlk+OuyCz0/8/q6mLk/LsmynoG0k7052MiMJubSQ2lbyTHz3qOD6/qOq4LflBTcxG/zF
         Uwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794528938; x=1795133738;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/bS5xYsjMkVnYMzljD0H/p8sgP2J5T4P4gKE/iJBI4=;
        b=t4htZ0KuzZn6FwjEGJFB/odAAEOcspoN1jXICXWYLxMckH9NR9JM2fw//zkuxeKSmg
         tr/bxRSkWgMVhzJRByHGDOBCQl4lvHR/VSYSspARDDvclPiDnhxDOp+frVk1FAcfTn8X
         Lb1NTHL+H9krIyiRhRn5ultdqOFcsF8+fmqJab/LFY2Y3PSD+mDq58TLUw05tS+8E8so
         W0x13c9Y9Z6d3h7ad5Iz2LosfTAF9hZnI19V8fuoRUNB7CZbMtBph38N/bqDhOwA/gAC
         PkfofK79/8Frh4ddTBS1tX/iCypCj275bJhvTkR/ZRYQ+9dzDEon6xEtQZWFB8ntmcXY
         oRDQ==
X-Forwarded-Encrypted: i=1; AL+hErG5MGrIDraYIMNg/le6+TeWnMiLIhunp5cNsf1j18XmbvPazCP7VsYMvhsPuJsvDvRdgD6e+Sux3HoQoEg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YDnwm+qvl6JqxjjxmMGPIH6L+dMF+9JkIGIQZ9dDeIv+1dmgx
	sKSKckW5PphdrwVHPFMAzdn9dYDs6Uk6lkOQqJlC4L/FZFtszRypmUZD
X-Gm-Gg: AYBFou2UFUzQJo4XNNqv7s0Ur6vVJpnSk46WLpjNCqQBYQWu8hcLTv44SqQCQE0EYPu
	bNNPn078Gsijecpt2gadXCC1eSm4OrU/ncSCD4ceR/dncziNOHEnLoTRSbfra6Vnzs27q8T9UII
	NVL2nvKEV2DHf962Lru1QNXd953gN59tSjT/rqurL0ab58f9TXdpXDCwEKLzSWV53IsX5abGGiq
	JfO1pHqTUkJ5H3/K+yLlXCrgeWIoyb/pFUjM4hvVn5OkGTo4qccrsXuCY8Aaj+97ALAiRoq8lrb
	JD+JnaAU2AFVxUtCTKyAW7fl3uHNYss9pCvb6GZthRr0h0EFWCoBJaqTUJT4UPB+laqHWr0LvL3
	dsPryEX990x1vsFxpzKbDXTmLHBMMw6oUudkOsonK+gVuR0EK6BuTPlaZTQR6j518t327BX6qtn
	Q6541DtrY17mKcFD5z6Lvy4qBkXCBjE5iaHvr+GAlSEaGP98pej6A4jc2Q8ZEHDTaMVtUrV1qxw
	NtWNhtA5qpfodrQjk8ljRQfkzDPlShF0zONDRd2IIHQsa0W1QdH77W0Mw0cJjPz+fBGNx8ALFy7
	ud7ULhuV3DFZqIpA/ug3HTjS8nYVh1WzQ+xt
X-Received: by 2002:a05:600c:8b66:b0:4a4:7a8d:c436 with SMTP id 5b1f17b1804b1-4bb55c5f567mr16787315e9.11.1794528937859;
        Thu, 12 Nov 2026 16:15:37 -0800 (PST)
Received: from [192.168.1.7] ([31.94.68.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb52bab8bbsm52641475e9.13.2026.11.12.16.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 16:15:35 -0800 (PST)
Message-ID: <b9f69d90-73ef-4a22-a347-0d70f014a7de@gmail.com>
Date: Fri, 13 Nov 2026 00:15:33 +0000
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
Subject: Re: [PATCH v2 3/3] drm/amd/display: report synced displays to
 PowerPlay for MCLK switch
To: Alex Deucher <alexdeucher@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <8eb61179-c5b8-41df-a466-8b5c388b6b41@gmail.com>
 <CADnq5_OrGuMJT4Tvt+wktPzTYEopdkCjyqq8sSdvJou40-HoKw@mail.gmail.com>
 <a6093dab-c38d-4dad-af3b-7173a6eaa78c@gmail.com>
 <CADnq5_MRA2bQG5x9xiGAT5ddh0jHMqg=u2OhCPvJxPr3ddTurA@mail.gmail.com>
Content-Language: en-US
From: Richard Lane <richardlanedev@gmail.com>
In-Reply-To: <CADnq5_MRA2bQG5x9xiGAT5ddh0jHMqg=u2OhCPvJxPr3ddTurA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/11/2026 19:59, Alex Deucher wrote:
> On Tue, Nov 10, 2026 at 1:49 PM Richard Lane <richardlanedev@gmail.com> wrote:
>>
>> On 09/11/2026 20:34, Alex Deucher wrote:
>>> On Mon, Nov 2, 2026 at 3:31 AM Richard Lane <richardlanedev@gmail.com> wrote:
>>>>
>>>> When driving multiple displays or tiled panels with identical timings
>>>> (such as the two 2560x2880 tiles of an Apple 5K iMac panel), Display
>>>> Core's program_timing_sync() aligns the CRTCs into a timing sync group
>>>> in hardware during dc_commit_streams().
>>>>
>>>> However, on DCE < 12, Display Core leaves
>>>> pp_display_cfg.all_displays_in_sync unset. Because PowerPlay is not
>>>> informed that the streams have synchronized vertical blanking intervals,
>>>> SMU7 prevents MCLK switching at idle or causes modeset underflows.
>>>>
>>>> If all active streams belong to the same timing sync group
>>>> (timing_sync_info.group_size == params.stream_count), report
>>>> all_displays_in_sync = true to PowerPlay after committing the streams so
>>>> SMU7 can safely downclock MCLK at idle.
>>>>
>>>
>>> Looking at this a little deeper, the function bw_calcs() in
>>> dce_calcs.c already calculates all_displays_in_sync using the helper
>>> all_displays_in_sync().  Can you look into this and figure out why
>>> that is not working as expected?  My concern with this patch is that
>>> DCE and DCN have different logic for handling mclk switching so I'm
>>> not sure it's safe to call dm_pp_apply_display_requirements() directly
>>> from common code.
>>>
>>> Thanks,
>>>
>>> Alex
>>
>> Moving it to dce_clk_mgr.c and using resource_are_streams_timing_synchronizable() also works. Is that a solution?
> 
> I think that would be preferred, but in general, why doesn't the
> current flow I described work?  The function bw_calcs() dce_calcs.c
> already calculates the all_displays_in_sync flag using the helper
> all_displays_in_sync().  Is all_displays_in_sync() not checking
> something properly or is the overall call timing wrong such that
> all_displays_in_sync() can't properly calculate whether all of the
> displays are synced at the point that it gets called?
> 
> Alex
> 

I think this could be limited to DCE 6,8,10 rather than DCE < 12 as in these
cases DC uses dce100_validate_bandwdith() which doesn't call bw_calcs() and
dce_pplib_apply_display_requirements() in dce_clk_mgr.c so
pp_display_cfg->all_displays_in_sync is unset.

Richard

>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
>> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
>> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
>> @@ -31,6 +31,7 @@
>>  #include "dmcu.h"
>>  #include "core_types.h"
>>  #include "dal_asic_id.h"
>> +#include "resource.h"
>>
>>  /*
>>   * Currently the register shifts and masks in this file are used for dce100 and dce80
>> @@ -319,8 +320,17 @@ static void dce_pplib_apply_display_requirements(
>>         struct dc_state *context)
>>  {
>>         struct dm_pp_display_configuration *pp_display_cfg = &context->pp_display_cfg;
>> +       int j;
>>
>>         dce110_fill_display_configs(context, pp_display_cfg);
>> +       pp_display_cfg->all_displays_in_sync = pp_display_cfg->display_count > 1;
>> +       for (j = 1; j < context->stream_count; j++) {
>> +               if (!resource_are_streams_timing_synchronizable(
>> +                           context->streams[0], context->streams[j])) {
>> +                       pp_display_cfg->all_displays_in_sync = false;
>> +                       break;
>> +               }
>> +       }
>>
>>         if (memcmp(&dc->current_state->pp_display_cfg, pp_display_cfg, sizeof(*pp_display_cfg)) !=  0)
>>                 dm_pp_apply_display_requirements(dc->ctx, pp_display_cfg);
>>
>> Richard
>>
>>>
>>>> Signed-off-by: Richard Lane <richardlanedev@gmail.com>
>>>> ---
>>>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++++
>>>>  1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> index 74cd88d8d580..b4531383437e 100644
>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> @@ -4777,6 +4777,16 @@ static void amdgpu_dm_commit_streams(struct drm_atomic_commit *state,
>>>>         dc_exit_ips_for_hw_access(dm->dc);
>>>>         WARN_ON(!dc_commit_streams(dm->dc, &params));
>>>>
>>>> +       if (params.stream_count > 1 &&
>>>> +           dm->dc->current_state->stream_status[0].timing_sync_info.group_size ==
>>>> +           params.stream_count) {
>>>> +               struct dm_pp_display_configuration *pp_cfg =
>>>> +                       &dm->dc->current_state->pp_display_cfg;
>>>> +
>>>> +               pp_cfg->all_displays_in_sync = true;
>>>> +               dm_pp_apply_display_requirements(dm->dc->ctx, pp_cfg);
>>>> +       }
>>>> +
>>>>         bool frl_stream_found = false;
>>>>
>>>>         for (i = 0; i < params.stream_count; i++) {
>>>> --
>>>> 2.55.0
>>

