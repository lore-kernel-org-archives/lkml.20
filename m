Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336595;
	b=D8zgNp4gQvG+/vx5hOEhwjaVRUdoNCm1a97MrA4CNVRuVOiNi258yRrrBiQ+Jk0i8wuS
	 nYAqrPZfTJx9aqIssipssGEEypOeOmVZ+9ROx7PFF8wLuX4yJ3Y9OdgR7WkIFU5VUgDzW
	 u6kKkjpUFabfonPFJeWtaE1r7bkeBwStQdp/VHQ8mTWRZ0Nr7Xs5N065C2NtJD6l9WXNK
	 +Ua3ztKQLVpgpGYYf/a+b0NIA/+VGkXuVzTtnH60/Zlnv9IbdOKxIzg66gNBhl3Ngmv6C
	 jjfO375M+y9Bm1hEQKvXWMrpSNsTwVX67MHpVDXMJwVkrnJlF7Rf7/OeSjgvw04XvdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qPkf5Dn97yVQ7A3K9LckCKOS5iiqVVbPOk75NoRmJew=;
	b=3fE0V1cuo0uQ/VGdl31CcoZHl91VG9+vuR90iYe/DRQ7GlR9qzUd93K7R1Fo4tI0dnmH
	 Tt0cLhd4NwrPny11J3QixJUe6OBHI3+yAZfC5gp/303tgytHbZisqGK1BZecaxuy51QKx
	 rs4zm2NHL8Hw5GNRkEKTFY3pxpK0Va72gowjcVoxOv3KTRvwFxyuNwZtQglvCY6T/V8wP
	 ykuAuKeNJCxwcf5SJv1+ixHz7MshIXHUbYl1Ai64f0Ln03CzEbfq57Do9lLLl9PVhD0ml
	 /fWTyTMgay7p9ADCQJdMORgdRqHvr+Yw7MLcTyoTVmFLSt8wQSpljZ8n3x7Ho6r+IjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="f5//jZDt";
	arc=none smtp.remote-ip=74.125.225.134
Received: from mail-wm2-f6.google.com (mail-wm2-f6.google.com [74.125.225.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A7E606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9A7E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f5//jZDt
Received: by mail-wm2-f6.google.com with SMTP id 5b1f17b1804b1-4a35d5b19baso4577005e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794336593; x=1794941393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPkf5Dn97yVQ7A3K9LckCKOS5iiqVVbPOk75NoRmJew=;
        b=f5//jZDtKK02V8eR8mpdCFDFbnVmVKniTu4kwBXWGWP6yS44Ri8CWupwJ8EuG+yNkv
         y3x2epNv143R+FWQr7yTyWgFLCweIXvfmTSln9OjuANTLKMlNJCYPyCcrGDHaREQ3Ynb
         2OcFmpjgLqeZuT1jjdHSCcWuBD9Bquk//S5bw63Ti4WPoB8UDjcT9vWX2CDUJMFvRoY7
         1lE3+rsikEh104WGVQP0h1kkBrodY3qZD+zGWEJCNuEhIWS7SEWkFykOZ21N6EH+UDGq
         pZEI7gtqbxs7aP+USMbvDvljB0FQHTKF86LkkYWYZwRwpWxJNPFLWZztBwJTFjeorPL3
         mq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336593; x=1794941393;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPkf5Dn97yVQ7A3K9LckCKOS5iiqVVbPOk75NoRmJew=;
        b=I906e/n4KIc6LlklzFwMdwJhdhfU4eHCFM5A4/kYnrfttgsyemVZUegw1R0mTRMsZG
         YAeOL1gLpceLXLmGdrdBLet2TOQZjkudcJ9OCMcK1j2s2G5XLm/W9NRBti0v6dEHBRlJ
         sWyEH8x33yLGGeTVs7iFQ5j1kN57vjXW02eQb4UKaLG/l4L9MfBk+g8Wb9I6soQ5yML5
         vshoJa4/qvrkA7BfA0ztkT+ZC5gWtO5JcSaz36RDOyyDazuC9K2cBO5vxaQhM+7JGFK5
         7DJKID0httF16GYijf3fifY3grNwUYPdkkuSXYVttP0HoCK9JE24eMEtIMhwXkNfrHYe
         fMGA==
X-Forwarded-Encrypted: i=1; AL+hErG1uwgxV+W11WjlwmGe0gqEfLJA3RHw9tj9ytnrP05h6ju3JHoRmTmm7kz60qLT+0GTCYzCGwRXQphRtOU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JiyRK4S8WI4HwxvKa2J5YpgRPt9HIqTmqY259TDBtsxHWz7sj
	gdW0DA5dqc9/IX6VBAednNLmC3bGaMJjHxW4mDy9Rzi12PCY4UiO4hTf
X-Gm-Gg: AYBFou2V0Vs2m3LwhZsnqoGelDl1Po/gB5xmZpAJr3WkAtrKkh2iepWPZKxkxjpH1iA
	M9LUBHqyYge4XmY8KurC+3mpUyGmUMaJvFo4JV9Gz0SlZQdTiWjMTbeWNQeB0XWxDbwlsfiz9B7
	sPqhHrXqYEwWT1+j9DRRfmmIzrkDvabZbTPcsFL4MqdR+8GykRpyfo+aauq5vCr2DY4WJAVSOCN
	mKH9Df8vqlh4iQ/EqyzBwIkgpbseXapiCb9VbwbW6R+vn27CfgpnZvGlkNwjXKmTr7j2n+6b6kU
	oAUpVgb0vB7X0w5D77AttUZh0v1yQowERBYRV9cWFUANxOIzBcqwHXNicfoGY3p15CUYwfSZnog
	WkFlIex6RAudWcVi4CQcfYFJnEpVR4UhFW3kG4OkSrYQmx5eZPoiPQksCFfcaqmUNAJPTxLjLJu
	coQEYigaDgeZMUPN5X/rXrTAYbmnqswuNBwvbbno1KNGXT5Gpk8djWse3nPcS+6BG8/SQuFx1JQ
	IZg5C6vLszc1nN/3nqy1fxsxOGt1u3s5EZ231tgX8bXYKYkms5qSyBXvDwX/Vd0CYtyjR5faawo
	0Yxib/NvSVPnb1kZW4xerH6D+GJgitq8yJkQOc73X58YzREYrYltLyqp
X-Received: by 2002:a05:600c:3544:b0:4a2:1655:87e2 with SMTP id 5b1f17b1804b1-4ba0938dbf9mr328175e9.19.1794336593063;
        Tue, 10 Nov 2026 10:49:53 -0800 (PST)
Received: from [192.168.1.7] ([31.94.68.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba023a1fcfsm34094085e9.4.2026.11.10.10.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 10:49:50 -0800 (PST)
Message-ID: <a6093dab-c38d-4dad-af3b-7173a6eaa78c@gmail.com>
Date: Tue, 10 Nov 2026 18:49:48 +0000
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
Content-Language: en-US
From: Richard Lane <richardlanedev@gmail.com>
In-Reply-To: <CADnq5_OrGuMJT4Tvt+wktPzTYEopdkCjyqq8sSdvJou40-HoKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/11/2026 20:34, Alex Deucher wrote:
> On Mon, Nov 2, 2026 at 3:31 AM Richard Lane <richardlanedev@gmail.com> wrote:
>>
>> When driving multiple displays or tiled panels with identical timings
>> (such as the two 2560x2880 tiles of an Apple 5K iMac panel), Display
>> Core's program_timing_sync() aligns the CRTCs into a timing sync group
>> in hardware during dc_commit_streams().
>>
>> However, on DCE < 12, Display Core leaves
>> pp_display_cfg.all_displays_in_sync unset. Because PowerPlay is not
>> informed that the streams have synchronized vertical blanking intervals,
>> SMU7 prevents MCLK switching at idle or causes modeset underflows.
>>
>> If all active streams belong to the same timing sync group
>> (timing_sync_info.group_size == params.stream_count), report
>> all_displays_in_sync = true to PowerPlay after committing the streams so
>> SMU7 can safely downclock MCLK at idle.
>>
> 
> Looking at this a little deeper, the function bw_calcs() in
> dce_calcs.c already calculates all_displays_in_sync using the helper
> all_displays_in_sync().  Can you look into this and figure out why
> that is not working as expected?  My concern with this patch is that
> DCE and DCN have different logic for handling mclk switching so I'm
> not sure it's safe to call dm_pp_apply_display_requirements() directly
> from common code.
> 
> Thanks,
> 
> Alex

Moving it to dce_clk_mgr.c and using resource_are_streams_timing_synchronizable() also works. Is that a solution?

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
@@ -31,6 +31,7 @@
 #include "dmcu.h"
 #include "core_types.h"
 #include "dal_asic_id.h"
+#include "resource.h"
 
 /*
  * Currently the register shifts and masks in this file are used for dce100 and dce80
@@ -319,8 +320,17 @@ static void dce_pplib_apply_display_requirements(
 	struct dc_state *context)
 {
 	struct dm_pp_display_configuration *pp_display_cfg = &context->pp_display_cfg;
+	int j;
 
 	dce110_fill_display_configs(context, pp_display_cfg);
+	pp_display_cfg->all_displays_in_sync = pp_display_cfg->display_count > 1;
+	for (j = 1; j < context->stream_count; j++) {
+		if (!resource_are_streams_timing_synchronizable(
+			    context->streams[0], context->streams[j])) {
+			pp_display_cfg->all_displays_in_sync = false;
+			break;
+		}
+	}
 
 	if (memcmp(&dc->current_state->pp_display_cfg, pp_display_cfg, sizeof(*pp_display_cfg)) !=  0)
 		dm_pp_apply_display_requirements(dc->ctx, pp_display_cfg);

Richard

> 
>> Signed-off-by: Richard Lane <richardlanedev@gmail.com>
>> ---
>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 74cd88d8d580..b4531383437e 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -4777,6 +4777,16 @@ static void amdgpu_dm_commit_streams(struct drm_atomic_commit *state,
>>         dc_exit_ips_for_hw_access(dm->dc);
>>         WARN_ON(!dc_commit_streams(dm->dc, &params));
>>
>> +       if (params.stream_count > 1 &&
>> +           dm->dc->current_state->stream_status[0].timing_sync_info.group_size ==
>> +           params.stream_count) {
>> +               struct dm_pp_display_configuration *pp_cfg =
>> +                       &dm->dc->current_state->pp_display_cfg;
>> +
>> +               pp_cfg->all_displays_in_sync = true;
>> +               dm_pp_apply_display_requirements(dm->dc->ctx, pp_cfg);
>> +       }
>> +
>>         bool frl_stream_found = false;
>>
>>         for (i = 0; i < params.stream_count; i++) {
>> --
>> 2.55.0

