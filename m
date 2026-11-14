Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794665916;
	b=KwDA1ztDD7xa3+Al8IWL20JVV4Sz/U4HGQumWAumL69MSM2tmcXrRzmimwjiDqFnN2T0
	 LW/4W9oZ/mCvw7ZMY3BLjzu8QDekykSuA+UKciOLGS2IHzkPw+n9LwfMAYWKNj07KStXv
	 OvSVTnjW705aH0g6BfW2l2n4miiUA79JY3wZS0m65Cuq6ry1T6UJCT3gjpOLLtNAebmm8
	 DwEh2IQghml1w/mJzbsbmNyZO9rIAjUvOqgseA9CG+OwyWbHXyC9SW0R57VVljsnJrauc
	 HYwoE6OSUnm0oY8dzOGQCLePkfuDJ/xOCaT0z2dIn6yfqbGg+j/SPcL3XfZcx+4GvaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794665916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qCLn+aRqPlhKjyBNsbMK/eyxZvcZo9cm8uyQg9JeKqo=;
	b=PTS1po8EX+VA3XvWhz1DLG3Ya3M42hHxXp+3MaXVrEw2fGzOWlA5mN6x+Hot2IsUUr8U
	 0BKCyHjoneQLyp4UyPcAyPkvP7ECXkQmyLuaNbESMEkB6WpIP25Kxnlki0N7NGqeWi81N
	 j9qQyuXlUPUiHQGWtWeNWr2+NGCyrD4SiI7w9OCaX9Kz72QFHMnRp7Z6GklQgutQ6dODl
	 oJGRyvf/PWp3xeAPfNvISIb8OGkEawpflyQzpsF8igiJ8TUBeZnS9v89ydM5e8YKPwYNz
	 mKKbOc4q0V2jM8VPWXexCayidTOfiyC1o5QZYoSF+tbQkIM4TFaVFanBDAg4qkEbCLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zAu2wQbY;
	arc=none smtp.remote-ip=74.125.225.137
Received: from mail-wm2-f9.google.com (mail-wm2-f9.google.com [74.125.225.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A65606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33A65606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zAu2wQbY
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-4b4e4d13850so6988575e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794665914; x=1795270714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qCLn+aRqPlhKjyBNsbMK/eyxZvcZo9cm8uyQg9JeKqo=;
        b=zAu2wQbYONxKZiHzBV5fXv5H4ugMc0TyiRLQEXFPZknpV/WE6nqtGviWMXssVSyQoa
         thmpZ0oefSb9j+UeHH+G9lQsEt7Et17yruwKrKdfhyJQNd6+BCaBNwtLyrPgk8XH9amW
         owy5jg1c4CJuzNlBM50AO4dJ0sowgH+TcYxyjs8vB0Yt+EqS+Id85ARDoPCghP38BA3h
         1t9ZBZ33G/AwOlQgSv3QmmT952Cqclp63s2XbzjFsvRKSuFLg6OQNYtfkoDoNGFywTBL
         S7MU0sdE5RY5zQYo2QCTFbaMrHJILdXSon14iyyRBZoVFKkm3dfy1UD8cYc/wNcyMAA4
         XNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794665914; x=1795270714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qCLn+aRqPlhKjyBNsbMK/eyxZvcZo9cm8uyQg9JeKqo=;
        b=0hjGrpqgz05VS5FuaMz2kbEK36FHrncGIynCjInf1k7Hv0wUmaVSasoOQIN6oNxC4l
         aDUDhOnjZYVGTFQLr5kQUuGCKlI+rOI2ZWhD1tOZE5z60d2W2ch9if/VAeCpZtvYXLgv
         vONMQ7LJy3yhicDagLfGGKP5edSRXHyc43XAp/voE9Ndvv5z/uZXvSu+TjVN7MgpAYwh
         s+E8JDWT2V+8uv4lBcgdSkSR8cJB3oEE+DkDoBqfnyh8euBVMrYN9+yeJ+RCkHeIaLNW
         orKt9aQyoMH7p8Vd8V15b+gCYj2KAduITQ8Bq11FAT+VsZcOwS7wJG1+XIeCv6p6k2BQ
         grcg==
X-Forwarded-Encrypted: i=1; AL+hErHMb1sTRWrSJVAUR3hniOloocsi0I5Ys3+9BCHxAficJBAU2WOTvZ+j3lccROV2TmgHS1nYz+Mq6YCyrPU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9O0hicxFm3H77C8Enhl12jBnhAhBH6iUGIkHAmzif0tHaZVQzW
	zxh2hl2jeRjIhRzKxXfHId3uM6fGDVhrZ9DY4QIhiFHstnv7+PTGE3sZ
X-Gm-Gg: AYBFou1W62EhGTuv12GRZVG1mV8dHfx6sp8YMJzbJjLJLJQ3KX8/Xz8XpT0u9MLdNIO
	fmt2Kyof5K3KV+J9Fzajyaz8Xn/vPCVtt7IeGqGcelBo2Nb5Iut91u5drbbiW5i+jftcDhTDME2
	JMdMLDSJ/SvACTB/sD08EN3QTivca8NqRpx7X+RE5LPCJQMm/UsoYtV6R4RU+psmoOVvu7AFDnb
	EZ3o8NG/2Ywcecnf9pziVAP4SxCAq9oPbnBXsF1O4iiMx0i8yw2lg1JRxDirwdPtAnMTc7NTFph
	mKRJm0h/CDm0e1oM4w+FHQFgtrvSxodv+zQqJ+h9IIsgMI6WIMKQm16a4pugCiBsgobCTfGx7K3
	xRawWS1Fknv9QuLZrpmdPgoxLjrWSXotXNb/eNq18oYwJQUE6kVeseJuJi4vjBn/DYuzuFB2IM5
	fWEqx3atdCMbpArfB4mP02ATUJ7e1MRfaRm3ZQ5FlV69xZnO9tWU2oFzjFX2IzqrTpxhEXv8EG1
	UC2gZKjUwXg7kjYc7xwJnTM7O3xIemJkDyWAl1UaNc6DOe099f+rUYpc+JHis0yfNjbb/98xm3J
	ZtRp9ubL3ZO7YFe9iCeOJmdo9naxLDvQjd4=
X-Received: by 2002:a05:600c:1f96:b0:4a2:150f:1601 with SMTP id 5b1f17b1804b1-4bb55a4eb97mr116556465e9.12.1794665914303;
        Sat, 14 Nov 2026 06:18:34 -0800 (PST)
Received: from [192.168.1.7] ([31.94.68.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6020bb0fsm10484086f8f.34.2026.11.14.06.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 06:18:33 -0800 (PST)
Message-ID: <5c3aeee1-1436-4b77-b742-ba916376b479@gmail.com>
Date: Sat, 14 Nov 2026 14:18:32 +0000
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
 <b9f69d90-73ef-4a22-a347-0d70f014a7de@gmail.com>
 <CADnq5_PZ3B863S238TkrGSubWa_VExySu9pkh5xDfrST11y5GQ@mail.gmail.com>
Content-Language: en-US
From: Richard Lane <richardlanedev@gmail.com>
In-Reply-To: <CADnq5_PZ3B863S238TkrGSubWa_VExySu9pkh5xDfrST11y5GQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/11/2026 14:05, Alex Deucher wrote:
> On Thu, Nov 12, 2026 at 7:15 PM Richard Lane <richardlanedev@gmail.com> wrote:
>>
>> On 10/11/2026 19:59, Alex Deucher wrote:
>>> On Tue, Nov 10, 2026 at 1:49 PM Richard Lane <richardlanedev@gmail.com> wrote:
>>>>
>>>> On 09/11/2026 20:34, Alex Deucher wrote:
>>>>> On Mon, Nov 2, 2026 at 3:31 AM Richard Lane <richardlanedev@gmail.com> wrote:
>>>>>>
>>>>>> When driving multiple displays or tiled panels with identical timings
>>>>>> (such as the two 2560x2880 tiles of an Apple 5K iMac panel), Display
>>>>>> Core's program_timing_sync() aligns the CRTCs into a timing sync group
>>>>>> in hardware during dc_commit_streams().
>>>>>>
>>>>>> However, on DCE < 12, Display Core leaves
>>>>>> pp_display_cfg.all_displays_in_sync unset. Because PowerPlay is not
>>>>>> informed that the streams have synchronized vertical blanking intervals,
>>>>>> SMU7 prevents MCLK switching at idle or causes modeset underflows.
>>>>>>
>>>>>> If all active streams belong to the same timing sync group
>>>>>> (timing_sync_info.group_size == params.stream_count), report
>>>>>> all_displays_in_sync = true to PowerPlay after committing the streams so
>>>>>> SMU7 can safely downclock MCLK at idle.
>>>>>>
>>>>>
>>>>> Looking at this a little deeper, the function bw_calcs() in
>>>>> dce_calcs.c already calculates all_displays_in_sync using the helper
>>>>> all_displays_in_sync().  Can you look into this and figure out why
>>>>> that is not working as expected?  My concern with this patch is that
>>>>> DCE and DCN have different logic for handling mclk switching so I'm
>>>>> not sure it's safe to call dm_pp_apply_display_requirements() directly
>>>>> from common code.
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Alex
>>>>
>>>> Moving it to dce_clk_mgr.c and using resource_are_streams_timing_synchronizable() also works. Is that a solution?
>>>
>>> I think that would be preferred, but in general, why doesn't the
>>> current flow I described work?  The function bw_calcs() dce_calcs.c
>>> already calculates the all_displays_in_sync flag using the helper
>>> all_displays_in_sync().  Is all_displays_in_sync() not checking
>>> something properly or is the overall call timing wrong such that
>>> all_displays_in_sync() can't properly calculate whether all of the
>>> displays are synced at the point that it gets called?
>>>
>>> Alex
>>>
>>
>> I think this could be limited to DCE 6,8,10 rather than DCE < 12 as in these
>> cases DC uses dce100_validate_bandwdith() which doesn't call bw_calcs() and
>> dce_pplib_apply_display_requirements() in dce_clk_mgr.c so
>> pp_display_cfg->all_displays_in_sync is unset.
> 
> How about adding bw_calcs() to dce100_validate_bandwdith()?  Or if
> there are issues there, just add the all_displays_in_sync() checks to
> dce100_validate_bandwdith().
> 
> Alex
> 

bw_calcs() itself cannot be called in dce100_validate_bandwidth() because
bw_calcs_init() only initializes dc->bw_dceip and dc->bw_vbios on DCE
11.0, 11.2, and 12.0.

However, adding the all_displays_in_sync check directly to
dce100_validate_bandwidth() (which is shared by DCE 6, 8, and 10) and
copying context->bw_ctx.bw.dce.all_displays_in_sync to
pp_display_cfg->all_displays_in_sync in
dce_pplib_apply_display_requirements() works. Is this solution preferable?

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
@@ -320,6 +320,9 @@ static void dce_pplib_apply_display_requirements(
 {
 	struct dm_pp_display_configuration *pp_display_cfg = &context->pp_display_cfg;
 
+	pp_display_cfg->all_displays_in_sync =
+		context->bw_ctx.bw.dce.all_displays_in_sync;
+
 	dce110_fill_display_configs(context, pp_display_cfg);
 
 	if (memcmp(&dc->current_state->pp_display_cfg, pp_display_cfg, sizeof(*pp_display_cfg)) !=  0)
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c
--- a/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c
@@ -692,6 +692,14 @@ enum dc_status dce100_validate_bandwidth(
 		/* TODO implement when needed but for now hardcode max value*/
 		context->bw_ctx.bw.dce.dispclk_khz = 681000;
 		context->bw_ctx.bw.dce.yclk_khz = 250000 * MEMORY_TYPE_MULTIPLIER_CZ;
+		context->bw_ctx.bw.dce.all_displays_in_sync = context->stream_count > 1;
+		for (i = 1; i < context->stream_count; i++) {
+			if (!resource_are_streams_timing_synchronizable(
+				    context->streams[0], context->streams[i])) {
+				context->bw_ctx.bw.dce.all_displays_in_sync = false;
+				break;
+			}
+		}
 	} else {
 		/* On DCE 6.0 and 6.4 the PLL0 is both the display engine clock and
 		 * the DP clock, and shouldn't be turned off. Just select the display
@@ -703,6 +711,7 @@ enum dc_status dce100_validate_bandwidth(
 			context->bw_ctx.bw.dce.dispclk_khz = 0;
 
 		context->bw_ctx.bw.dce.yclk_khz = 0;
+		context->bw_ctx.bw.dce.all_displays_in_sync = false;
 	}
 
 	return DC_OK;

Richard

>>
>> Richard
>>
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
>>>> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
>>>> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
>>>> @@ -31,6 +31,7 @@
>>>>  #include "dmcu.h"
>>>>  #include "core_types.h"
>>>>  #include "dal_asic_id.h"
>>>> +#include "resource.h"
>>>>
>>>>  /*
>>>>   * Currently the register shifts and masks in this file are used for dce100 and dce80
>>>> @@ -319,8 +320,17 @@ static void dce_pplib_apply_display_requirements(
>>>>         struct dc_state *context)
>>>>  {
>>>>         struct dm_pp_display_configuration *pp_display_cfg = &context->pp_display_cfg;
>>>> +       int j;
>>>>
>>>>         dce110_fill_display_configs(context, pp_display_cfg);
>>>> +       pp_display_cfg->all_displays_in_sync = pp_display_cfg->display_count > 1;
>>>> +       for (j = 1; j < context->stream_count; j++) {
>>>> +               if (!resource_are_streams_timing_synchronizable(
>>>> +                           context->streams[0], context->streams[j])) {
>>>> +                       pp_display_cfg->all_displays_in_sync = false;
>>>> +                       break;
>>>> +               }
>>>> +       }
>>>>
>>>>         if (memcmp(&dc->current_state->pp_display_cfg, pp_display_cfg, sizeof(*pp_display_cfg)) !=  0)
>>>>                 dm_pp_apply_display_requirements(dc->ctx, pp_display_cfg);
>>>>
>>>> Richard
>>>>
>>>>>
>>>>>> Signed-off-by: Richard Lane <richardlanedev@gmail.com>
>>>>>> ---
>>>>>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++++
>>>>>>  1 file changed, 10 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>> index 74cd88d8d580..b4531383437e 100644
>>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>> @@ -4777,6 +4777,16 @@ static void amdgpu_dm_commit_streams(struct drm_atomic_commit *state,
>>>>>>         dc_exit_ips_for_hw_access(dm->dc);
>>>>>>         WARN_ON(!dc_commit_streams(dm->dc, &params));
>>>>>>
>>>>>> +       if (params.stream_count > 1 &&
>>>>>> +           dm->dc->current_state->stream_status[0].timing_sync_info.group_size ==
>>>>>> +           params.stream_count) {
>>>>>> +               struct dm_pp_display_configuration *pp_cfg =
>>>>>> +                       &dm->dc->current_state->pp_display_cfg;
>>>>>> +
>>>>>> +               pp_cfg->all_displays_in_sync = true;
>>>>>> +               dm_pp_apply_display_requirements(dm->dc->ctx, pp_cfg);
>>>>>> +       }
>>>>>> +
>>>>>>         bool frl_stream_found = false;
>>>>>>
>>>>>>         for (i = 0; i < params.stream_count; i++) {
>>>>>> --
>>>>>> 2.55.0
>>>>
>>

