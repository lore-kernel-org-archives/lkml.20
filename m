Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277A82D73B6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790646313; cv=none; b=dpF497D3OVNwyUSBIPYN/vp+kclIzZe6pZbUATuUoCshoyOc7wNGEIiHc3eUBHO8hPsgHJTNQDzk9BUq6W9+lzoUtHhCN3nNcXZ5MNP8kMv/MkwxCPngA9pRkF0XrPYQxoGc69A28MVXlcAyboYivT314v+AxTYVW/aDlioIvpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790646313; c=relaxed/simple;
	bh=3zlm+JCPbgHhq7pDyIj5hTssujz2Hb4VbFqnyA8KWfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u2aa5IZLIgGj/nmMaqmTUpFto3s/z44EyJb6Byac6h7b9sc/YK3R3xWY79g1u6rSl5LvGY3LQIZ8GXr1NZWCZsld6WU2m8diI5clLk9j/7gqoj9VkibHEb1ZLQRw9/JPcfK3Tdz6W5vmKN1jMomkSFhiv4v6FXUdyGV91d0rNBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCSXR79q; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCSXR79q"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2dfaf76605dso8660315ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790646311; x=1791251111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BbPZBkG6EW7o76TGvb+IbEd7phIKmf02Hwna+vyhxaI=;
        b=CCSXR79qrcSDPSn7XdxsGgbqCoXfr6javSUKO3GrGW+rCPgs49JAbZqr/+JHOEYxFV
         oSzsAzvsXJjngd9Urz2JUVHJLXWpqmj7FabizlApZebq97Iy6as0nu4cnFUUkGk4u0aM
         7EADnfAWx1uP0+rTXJhE/8B6tmJO8gefwf2bAKpteeU/+zan/stah2nI+2hjmNV/if0p
         OVHsT96n4rxHN9A6fKkDeh8AZ553UY+pRc9216KMMzDL9zamUjI/wl0xbvsIaDqw2Qcm
         WRb3/j2dwAfPZBi8mopif4UaFV0W1Seh2yRc2gH78zKWLGE5XLp0VUnmeVJfhTK6fExo
         mkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790646311; x=1791251111;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BbPZBkG6EW7o76TGvb+IbEd7phIKmf02Hwna+vyhxaI=;
        b=NOnBVD8nH+/+UPDZo5NI6DrYXP71z4VTtYW9KEOSsPLe+hL/9N7lxZXArFZVMiwkhB
         RCCWOQ5v4hBnVgrYTXbqArEGbCoPf5bR3YO/4t0PDY5MITTUmWJzYaAaoKVnxqJ9o5l3
         nSVkvDKismGjQsWiJK9tmbHndENIREwWducLTG2x0nDas4FzH5MzaI77sKgNv6as29I1
         eeP+b9wmlQF4uFJdt3s8ivmbOZtZV48HAaIVyIZmwVBBSfi+cwcujBcFM4lN+C0svE4e
         RJcReVly7VJ31ufHKVT4v3mPzOFCMR5bNmk0ZXnhACnp7UbUlXfL05tQDuqotK1QIl+J
         OylA==
X-Forwarded-Encrypted: i=1; AKwUvBzr742DXn3tkSBMhAxbbTdyFl1iYduW8eI+fJNustYIeMiE0wQiIAoExxHEUZDxbbJ4I1q/zfF45rgFGjw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1ejHPqP/LQ6TQD1tnzL+altYGzmvXSWgPN1ClzjC6J2KzfvVh
	7ZVfWGk/5GUBXsUQ4FsZvtbe66LIWKKcCv57bFDw4tAekEQswNZNWPBF
X-Gm-Gg: AYBFou2OmIbr/kfAUvEvygcQ5Isjr/iiXhaakZLbC5qb6xWTbJxlOArIDyAQF/911bi
	1lr2yOZygBRKaFTX0PDczXvoqWtRwAEWdp0jQDCrnSE/4uTCnMWtMq6kN1mhITuKJahtPif5srp
	II3MEmqP/RpqYwSr/yLWcBX1rmm4PVB6rPID6KxDoGI+ZfbJc1dC2sWLYAwphaG1B1u3aiQUGW+
	Z1HZwY90LpI4mytOho/8tolLjona3NQmfl7dWWGCa5kiom7R44FHJlZObDp/gAQ8oHRM+Fd2Isa
	OjRr7i3nFNk5wKGtmB0gftmkL/4hRkbKo1TgvHM17XVBko5aCaZ+HukTG5R3zuvf5kvL5VbNwGH
	70LmsgkpnMlL7HyUF0CekxnX5CdMhLp0Gpz9yFIPsDy68+QbcrDJEWvsLQEsbM0QTXZdCdH19Ue
	2atzpzfldpusc3GBEEoM+uZSX/f905bUyO669+Mck/xbLjno89Y/+h2y5xuDogpdoAa9fW6PtCd
	kI57yjW5oeCdn+5Nw/M4KBm34HyUpVGHFmcpvyEDTNYjZ9WWzi7B1c=
X-Received: by 2002:a17:902:ebc7:b0:2df:9625:3ecd with SMTP id d9443c01a7336-2df9625400fmr82748415ad.8.1790646311363;
        Mon, 28 Sep 2026 18:45:11 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913dd8d2sm48984825ad.20.2026.09.28.18.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 18:45:10 -0700 (PDT)
Message-ID: <ed35ac8d-ebcb-4f7f-aafd-c1b1eb3616b7@gmail.com>
Date: Tue, 29 Sep 2026 09:45:06 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/7] drm/verisilicon: fix DC8200 primary plane disable
 clearing FB_EN
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260918030125.315978-1-a0987203069@gmail.com>
 <20260918030125.315978-8-a0987203069@gmail.com>
 <4a7b271d2a90eff94c27dec3bf24114ce44df1fd.camel@iscas.ac.cn>
 <1d988dfb-c930-4c17-ae77-47b93ff9f159@gmail.com>
 <cb30f57c0ac124aac85efad32626e6182b9f1369.camel@iscas.ac.cn>
 <b589c197-2297-42c4-b017-3594cdd1cd56@gmail.com>
 <fde43d758a66a8feefc50274f3573e33a67d43f2.camel@iscas.ac.cn>
 <fc425e648644d94276bce7d3d4dac8b0acd4c5d8.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <fc425e648644d94276bce7d3d4dac8b0acd4c5d8.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Icenowy Zheng 於 2026/9/26 下午 12:48 寫道:
> 在 2026-09-25五的 22:55 +0800，Icenowy Zheng写道：
>> 在 2026-09-21一的 15:49 +0800，Joey Lu写道：
>>> Icenowy Zheng 於 2026/9/21 下午 03:30 寫道:
>>>> Maybe it's better to just make it the 2nd patch in this patchset,
>>>> just
>>>> after the binding change.
>>>>
>>>> Waiting for something into drm-misc-fixes again will need another
>>>> fixes
>>>> pull and another RC back merge, which can consume weeks and miss
>>>> the
>>>> current merging window.
>>>>
>>>> In addition, it's possible that `drm/verisilicon: introduce per-
>>>> variant
>>>> hardware ops table` also gets backported for a more clean primary
>>>> plane
>>>> atomic_update disabling fix.
>>> Understood. I'll fold the FB_EN fix in as patch 2, right after the
>> Should I just apply this revision of patch with this reorder?
> Oh I think more fixes are coming.
>
> There's one more DC8200-specific problem (which might be problematic on
> DC8000 but I am not sure): The vs_dc8200_panel_disable_ex sequence must
> be executed before vs_dc8200_panel_enable_ex, because some timing
> parameters seem to be latched when the value going from 0 to 1, and
> when a stale state is programmed before the driver is loaded (e.g. a
> firmware driving the display) and the timing isn't the same with the
> timing of the first modeset, the modeset will fail.
>
> I'm thinking about sending a fix patchset first, which will pick the
> FB_EN fix here, implement a fix for the stale state problem and maybe
> implement fixes for the old state dereference problems for hidden
> planes in their atomic_update callback (although this fix will
> introduce a helper, which will then be moved and renamed in the DC8200
> ops patch).
>
> Thanks,
> Icenowy
Understood, happy to hold the DCUltraLite series until your fix
patchset lands, and rebase the ops-table patch on top of it then.

On DC8000: its panel enable/disable path just toggles a plain
FB_CONFIG_RESET bit, not the staged PANEL_CONFIG/PANEL_START latch
registers DC8200 uses, so it doesn't look like it shares this specific
ordering hazard from the register layout alone. I'll run the tests again 
after
applying our variant on top of it.
>> Thanks,
>> Icenowy
>>
>>> dt-bindings patch, targeting the current vs_primary_plane.c
>>> directly,
>>> so the ops-table patch just carries the already-corrected code
>>> forward
>>> into vs_dc8200.c. Agreed that's faster than round-tripping.
>>>
>>> On primary_plane_disable_ex - I'll keep the "_ex" suffix. DC8200
>>> still
>>> has a real per-variant operation there (clearing FB_EN + commit),
>>> while
>>> DC8000 leaves it NULL and does nothing, so the suffix still
>>> reflects
>>> an actual per-variant difference, not just structure introduced by
>>> the
>>> refactor.
>>>
>>> While testing the cursor plane, I found the same class of bug
>>> there:
>>> the disable register write was being triggered from the plane's
>>> atomic_update() invisible-branch using the old plane state to look
>>> up
>>> the CRTC/output, which can be stale or NULL on a plane's very first
>>> commit if it's already invisible then. I've fixed it locally by
>>> having
>>> atomic_update() derive the CRTC/output from the state it already
>>> holds
>>> before checking visibility, instead of falling through to the
>>> old-state-based disable path. Just flagging it here for now -
>>> vs_cursor_plane.c isn't touched by any of my patches.
>>>
>>> Thanks.
