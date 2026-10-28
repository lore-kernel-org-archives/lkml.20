Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793230741;
	b=SFbDJOqu7tSLaJ85GBJ0gyU0pSNmcm/mlqkYWY64e8Wb11I+KTWaE3EZXsgnr8kuy8Z5
	 Smo2ouuNGimj6TjtruW1D6lkraeM7E2lzB6SInZxgAezitn6Eayen4r7JlCii3S/u9mp/
	 SBD9cwt6Rl/tjWn1a9jLcQcypz4+CMk9qCnTi45N1WeEAZ3e/dt1h1984vN6Q9V89Tct5
	 8IQffqN+/tKwhjByXAEuQyfsWxr2VIbPzG1UvM95O9BydL7q5pG6NX5mAbIZgrC8aLJvc
	 LxMctWVu4qNLLo3obFKMTsAKguB3VioslLFqjUHbGGLQ4w4WIg+KFrrokfkeXuxCDZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793230741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=mUL9IvXJL2MT47NNFUWayhQpuNRP/QLpFWYDoVd8+3Y=;
	b=yLoSjma6WfYM4BqMIWsl4z+NhZ6+uW+uUbHouKwmYkbn6C3zxUF4KQDxs9dT5SsH/bwp
	 WoOwqoCCx9R8VSY8yJg0+nLDpUhlzPiNzClCBjLUSITxH32mPkQ1ns2EbdeMGP6UGJiNT
	 0ZU+xmtnTxzWogLznfepGRyXe0B4s5FEgR2qpQtXpAJ+vOfYA27g0FQ3+XpPY4nyoTRI0
	 QGVQjrh9xivB8mb1b4puekhpp6vUSqXy0fOV/FjQ0Xtz7IbZmxHghIoUfzLqvKRQL/K9w
	 87193W0tArYSbFEzwvupvVIcPbhb3RZ0G2vBujLp2mFGSwRvZumAhwU0qepA/wdhyzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jaWbVCnF;
	arc=none smtp.remote-ip=74.125.225.65
Received: from mail-wr2-f1.google.com (mail-wr2-f1.google.com [74.125.225.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D67606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28D67606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jaWbVCnF
Received: by mail-wr2-f1.google.com with SMTP id ffacd0b85a97d-48e3465b262so518837f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793230739; x=1793835539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mUL9IvXJL2MT47NNFUWayhQpuNRP/QLpFWYDoVd8+3Y=;
        b=jaWbVCnF1pxOi/ULigHFsR0CakmUVWy0YgruE1FGHbk9Ei1EZjhPy/cYOWIYC3jirf
         XoMtMdL7tv5+rRrpLeRYWqfLYxV2oIQXcnkUB9tusByN6IXBy5k3gFtIGOWxtmfOzc7i
         au6Lor9GVp/pnpFxLEZIfV2dODLRHnmiOqRjlVBwi1CtKYFFmFUnl0VxdeN2fI6UH0MG
         dpdcODpqFFxMLU8YrB1TQAWMAoimo9EMNq0Jvgf6d/EmtWb4qEL7KYGa7R+s97Ss2YS5
         PZ6CH0s5b2tU48aPRBQhJooE1SNpdcQIldns+n3hXpHFhFOND/kpV77WwK0zwXb/+SKi
         sdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793230739; x=1793835539;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUL9IvXJL2MT47NNFUWayhQpuNRP/QLpFWYDoVd8+3Y=;
        b=NrK//Ccds5jK3wfDVtfO7xo4E4nOayjWsqOddrQhtyuCbJWof8jmhxaiCfBvauXdVt
         5utbVBR8ll0xah1EhBtC63wMD8YhdnYO4C0uNc7EmXJARgfCLIsuWpH5x4fznSi9eH83
         h+DJSlb7o4nFmkH/n0yiC0gIyHEA3SiMeywxKB6Qn/VBkf/Y09HWs7Jo3qPqOun/6DwF
         PD9BOFnUSzhOzx/dyjAp2W16r58HerPRAvfh+fCQWx3P4JecpoCBP9spEkbnDhscM6J+
         iULeN+9XO7czhOytVLd0Gr7spxDg9lhO9/+lNBHOa9dWFfJg92G5+9qZhY31eaGSiMaY
         DJTw==
X-Forwarded-Encrypted: i=1; AKwUvBxlFaHd4iNkkb4kz8O8Nac4PrtOgwtUogIS3aZNGYaTd7HyuPGnLK63b+lYabOIM95NdDTmgpqTrE7Ra+I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQPHXXAbnq4SXPwlQq887bv7ScKI8oI9ga73BSTsBxgxyIKwP+
	tw6PbRTHgGe4DxyIKlSMmCbi3ZOFeiecTSoZ4gJNcJhcZGSCV7lV2yGp
X-Gm-Gg: AYBFou3ffgLpOyiUPbwznbVX7enKFyHFSHrsq9nUJxuwzB8HkwzWfAv/MnbHSPZqUhv
	IkRikhKmT9GiN2MxBXZuKcCxj/NNlbm25s92SSrSSUAsFpbSHnoFFiAGq3w+CtAqCTnDs63N5In
	ALhC8ph0Mmr9ELFxYNWyQvYQZCeUZl5V3LZa7P9bBC4xWTSJ1s5zh6thIb7T/Bayh5/xhW15r64
	KbeFCyc8etR0eMMnM/bljRSDZwpJzuA+cLAlfhl3B70iHFdwjJUiDTeCOitkCBnpfoXaeSn0KSM
	XpA9wrJ2d/Hf9oFVTmeq5/4yZc6+o+rtTkjxsiLYxrsJkVqbQdyOf6Ss8u4aT7cZdq7MQBjqv/w
	IpgnIymnPhOXSnwo44xpGExC4JdBhI68h9ESKC6pBjmirYQvbT8QDiEbaW/6CsQEJ2iB1BJw+Xk
	gq3vVwhBPbW9p2mq6tfEElkeeDPVeM5iCoh7A71/053FotwDpajicgfWsCwF4EJABguZT/w+x7N
	c0PLhruc39JG1bdu/9FLejLRjJXd6QZtksZzSde67DhBQguAKPZuS7N2MMzF40c2HWPMJGPb5Fq
	hIKqDLPeJlpQ0nRXJQPKUm33v9/Nibrtv8EW
X-Received: by 2002:a05:6000:26d0:b0:487:baa:aa6b with SMTP id ffacd0b85a97d-48e5d5df440mr7815534f8f.43.1793230739292;
        Wed, 28 Oct 2026 16:38:59 -0700 (PDT)
Received: from [192.168.1.12] ([31.94.68.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb90dsm29192908f8f.22.2026.10.28.16.38.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 16:38:57 -0700 (PDT)
Message-ID: <86cccaa4-62ac-4834-bc74-1755436b5be2@gmail.com>
Date: Wed, 28 Oct 2026 23:38:55 +0000
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
Subject: Re: [PATCH 3/3] drm/amd/display: report synced Apple 5K tiles to
 PowerPlay for MCLK switch
To: Alex Deucher <alexdeucher@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <3ff4ef96-9c59-4e8d-a0da-92a1ac6f5ba1@gmail.com>
 <CADnq5_Nn7+baU=Rdaa8QzOCo64H=ch9HeDaEwtmbQwW0kP00nQ@mail.gmail.com>
Content-Language: en-US
From: Richard Lane <richardlanedev@gmail.com>
In-Reply-To: <CADnq5_Nn7+baU=Rdaa8QzOCo64H=ch9HeDaEwtmbQwW0kP00nQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/10/2026 18:26, Alex Deucher wrote:
> On Tue, Oct 27, 2026 at 5:41 AM Richard Lane <richardlanedev@gmail.com> wrote:
>>
>> When driving both 2560x2880 tiles of an Apple 5K iMac panel, Display
>> Core's program_timing_sync() already aligns both CRTCs in hardware
>> during dc_commit_streams() because the two streams share identical
>> timings.
>>
>> However, on DCE < 12 (iMac15,1 through Polaris-based iMac19,1), Display
>> Core leaves pp_display_cfg.all_displays_in_sync unset. Because PowerPlay
>> is not informed that the two streams have synchronized vertical blanking
>> intervals, SMU7 prevents MCLK switching at idle or causes modeset
>> underflows.
>>
>> Report all_displays_in_sync = true to PowerPlay after committing both
>> tiled streams so SMU7 knows the tiles blank simultaneously and can
>> safely downclock MCLK at idle.
>>
>> Signed-off-by: Richard Lane <richardlanedev@gmail.com>
>> ---
>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 548f975c7324..384a81371f80 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -4788,6 +4788,19 @@ static void amdgpu_dm_commit_streams(struct drm_atomic_commit *state,
>>         mutex_lock(&dm->dc_lock);
>>         dc_exit_ips_for_hw_access(dm->dc);
>>         WARN_ON(!dc_commit_streams(dm->dc, &params));
>> +       /*
>> +        * DCE < 12 leaves all_displays_in_sync unset; report synchronized
>> +        * Apple 5K tiles to PowerPlay after commit so SMU7 can downclock MCLK
>> +        * at idle without modeset underflows.
>> +        */
>> +       if (params.stream_count == 2 &&
>> +           params.streams[0]->link->tiled_peer == params.streams[1]->link) {
> 
> This should be made generic for any combination of displays with
> identical timings.
> 
> Alex
> 

I have changed it to the following to make it generic:

	if (params.stream_count > 1 &&
	    dm->dc->current_state->stream_status[0].timing_sync_info.group_size ==
	    params.stream_count) {

Richard

>> +               struct dm_pp_display_configuration *pp_cfg =
>> +                       &dm->dc->current_state->pp_display_cfg;
>> +
>> +               pp_cfg->all_displays_in_sync = true;
>> +               dm_pp_apply_display_requirements(dm->dc->ctx, pp_cfg);
>> +       }
>>
>>         bool frl_stream_found = false;
>>
>> --
>> 2.55.0

