Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9839C3F23C5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179654; cv=none; b=BStML/4rmWAOFYfOD1cu46uf40jTOgdMjJmm8yNJ0QFOnVBcR5j0GNQobtZjQj3sNj43/Gb2oJngkZ8C+BHUcNJihPxYNFi4lB09Y9BlNP5SDylwuPJVTNFdL+9Yiezq/N11qgxlZhW19kegK8wbjSFNK8metM4u2alDWtfBurs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179654; c=relaxed/simple;
	bh=Jodhr/tKAjxUnP7ZRiyHtp8mamlXTfQT7NtdWh8XbSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RrJk/qV17hwtncZQx5xhyLShJtIJRm6blXa9dgOOprz3iY6lIZ9VbnwrPGYwr5KL7d0am+xvkryI11MGFJrqYs5OYOWj3BLgP/ACfdaL5PqZoCfEWI32NzYV5vNCa7E2Q0zuN44IIzW2M/kFFVGRD7wQ2xYRluGOocUWkrYmTg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnjhDIYO; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnjhDIYO"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a1a631f6aso138709066b.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790179651; x=1790784451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p5jcS04GHIJRKuzdHI5fQPxE/Gjcri6O1kLmUfhhrCc=;
        b=lnjhDIYOS1borpMSe3MFcPkaxW0ZgC0fe+mCjU1KJc5w0qvMfGaQfzmIZMu2KX/asd
         /h9E5Qd7RRCpX7AsRhADCgvkr6nOWOYMMmRDZezhMpsEPhnUR0P+6ihJW6wkKJwlzogR
         KC0l6nUPozwiNIF7WXltLejD+ftRycul48Tx9MuV5lAM5EZqsrLFLNsrDZJfEKmq9s9C
         42V3pBns+f+77MLki6yw8MjuQ2r1CA0Z98UhRbkGaJM791Pz1TgzdIsw6u5SKTH5SqIr
         TqN/rNXgjFW6008bBJMFg9ewJ2w6m0X6Sx5RSFMpRulWLpbxDGQZG5R8yjYkXxEasN3a
         5qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179651; x=1790784451;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p5jcS04GHIJRKuzdHI5fQPxE/Gjcri6O1kLmUfhhrCc=;
        b=aRKHFV8FWcsu5tfixmkZ+BJEmzf7xebyRapU8xgFSAoS3+paMYqMyO+LdRXC4HRQzB
         dGMUHIl3jB33WX2m7qQr7arXgvsASoy645OHUxSKZV99Yzd7kuvDuvWH7Enir21QSaD9
         uXd/kj8tOUt0IFz/BQwn7igAwcRxbgYr8pgcTYWtpqBJ0S7++vDtJm0flI2hko4vdnR9
         /ZYpPwxE5AblCISxQI8o+wa5xv/LzEJoHzQ6oWhjVFrVT5YkBAvdgIo3/AwjyAMHy6BY
         hmj8i7jlJVUb5/heicpQVVW1iBdp/uZZYdBkH3QywImSTzhx4wYbDkT20FNBtBFaZ/6w
         m5UA==
X-Forwarded-Encrypted: i=1; AKwUvBxzUlJcPu+XcedM/B1Zk274mysNdpSwrhxAt2RN2UGmIZKcGV+hfWzHFtomASf/Hgd6lpF1SO78GXBDC1A=@vger.kernel.org
X-Gm-Message-State: AFuF++n07w4WJT7/fE5dDZIW/g4dNx7yoiasDOp2pWRnTjVVPfAHE9FQ
	LbXswLTJZ+k49dUR1oivz27t0QZPkdU+65Up5CcdMfy6Naf5Lavtu6Vc
X-Gm-Gg: AYBFou1g5TUbc29TgxyHE66Yl0xGFsY+mBrUcUmhDQ75PkCQDHj7YtAEIVVNXLAY823
	j4bZ8OtHB+bn6O32zzQY73zH4lgCcHTwvWio/JI0tkfY5iFbRwUYfeNS7Cvs8jGSmx3TWB8fBbn
	+S1mWnxAGPrMYgHVKIz8Dd/Nr1Ht0d3yMPdLqWI8iRT9WCiv8JJ/R7v3Qypji1xTf++8RQsTeP0
	N93F68bSpwpO+XloMAl0Tt0xZFtyMT5jYeIMXAFoondqh8YgMFV9xdhH/FYuTXGbUzLRi51bimd
	XxsNalKtkY3Hq7p2HOQP+NBhbyDmSkOmOU3HRGqBSSEImojxtAKqgFPZdBrcs/0EFsssmF2SDg+
	pNnvYe2OH5QLRCfwyz29i4bcarNQ0at034PEp3KqLoiNSSlTGCGF1nHwKIhhAkaWR7SIdN+8reL
	L0JJ9nanWbNfLNbvAwXlg+Zge3ddsIcIHrKx3A0he+vlKO/yoRrqPEV/EWELuivCFedh29T1xAy
	gRA6xY=
X-Received: by 2002:a17:907:3f82:b0:c2a:ad55:b3fa with SMTP id a640c23a62f3a-c2aadeb4b50mr259256666b.7.1790179650477;
        Wed, 23 Sep 2026 09:07:30 -0700 (PDT)
Received: from [10.194.248.89] ([137.122.66.156])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae60e4c8sm152921166b.26.2026.09.23.09.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 09:07:29 -0700 (PDT)
Message-ID: <696580d8-cf2e-47aa-8616-7d930c2f5b82@gmail.com>
Date: Wed, 23 Sep 2026 12:07:26 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DRM] amdgpu: HDMI FreeSync not exposed on Samsung S22C31x
 despite AMD VSDB
To: =?UTF-8?B?QXRhIMSwbGhhbiBLw7ZrdMO8cms=?= <atailhan2006@gmail.com>,
 amd-gfx@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260923002718.5915-1-atailhan2006@gmail.com>
Content-Language: en-US
From: teapot <huangalex409@gmail.com>
In-Reply-To: <20260923002718.5915-1-atailhan2006@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026-09-22 20:27, Ata İlhan Köktürk wrote:
> Hi,
> 
> I am investigating an issue where HDMI FreeSync
> is not exposed for a Samsung S22C31x monitor on
> an AMD Picasso/Raven 2 GPU, although the monitor
> advertises an AMD FreeSync range in its EDID and
> VRR works under Windows.
> 
> Hardware/software:
> 
> * GPU: 03:00.0 VGA compatible controller [0300]:
> Advanced Micro Devices, Inc. [AMD/ATI] Picasso/Raven 2
> [Radeon Vega Series / Radeon Vega Mobile Series]
> [1002:15d8] (rev c2)
> * Kernel: 7.2.5-200.fc44
> * Compositor: Sway (Wayland)
> * Monitor: Samsung S22C31x
> * Connector: HDMI-A-1
> * EDID serial: H9DX100210
> * Kernel command line includes: amdgpu.freesync_video=1
> 
> Observed:
> 
> * swaymsg -t get_outputs reports "Adaptive sync: disabled" for HDMI-A-1.
> * Adaptive sync remains disabled at both 1920x1080@60 Hz and 1920x1080@75 Hz.
> * The same monitor exposes and enables FreeSync under Windows.
> 
> The EDID contains the following AMD Vendor-Specific Data Block:
> 
> Vendor-Specific Data Block (AMD), OUI 00-00-1A:
>      Version: 1
>      Feature Caps: 0x01
>      Minimum Refresh Rate: 48 Hz
>      Maximum Refresh Rate: 75 Hz
>      Flags 1.x: 0x00>
> The HDMI VSDB therefore appears to advertise a 48-75 Hz FreeSync range.
> 
> There is also this message in dmesg:
> 
> amdgpu 0000:03:00.0: [drm] Failed to setup vendor infoframe on connector HDMI-A-1: -22
> 
> I believe this is the -EINVAL path from
> drm_hdmi_vendor_infoframe_from_display_mode() for this timing and
> is probably unrelated to the FreeSync issue.
> 
> The part I am currently investigating is amdgpu_dm_update_freesync_caps().
> 
> For HDMI, the driver calls parse_hdmi_amd_vsdb(), which
> on this DCN configuration goes through the DMUB path:
> 
> parse_hdmi_amd_vsdb()
>    -> parse_edid_cea()
>       -> parse_edid_cea_dmub()
>          -> dm_edid_parser_send_cea()
>             -> output->amd_vsdb.freesync_supported
> 
> If the DMUB parser returns freesync_supported == 0,
> the driver does not expose the connector as VRR capable.
> 
> What makes this interesting is that the DRM EDID parser also
> contains the corresponding AMD VSDB information in
> connector->display_info.amd_vsdb, while the DMUB result
> does not result in FreeSync being exposed.
> 
> I am wondering about the following:
> 
> 1. Is the AMD VSDB layout above expected to be accepted by
> the DMUB EDID parser, particularly with
> Feature Caps 0x01, Flags 1.x == 0x00, and no MCCS VCP code byte?
AFAIK the driver will consider HDMI FreeSync unavailable if MCCS VCP 
code is 0x0. HDMI FreeSync needs this VCP code.>
> 2. If the DMUB parser rejects this form of AMD VSDB, should amdgpu_dm
> fall back to the software-parsed connector->display_info.amd_vsdb
> when determining FreeSync capability?
The amd_vsdb struct is currently only for the V2+ luminosity fields, and 
don't affect FreeSync detection. I had added FreeSync fields support and 
those changes are in drm-next, but haven't made it up to the Torvalds 
tree yet.
> 
> I have a working kernel tree and can run diagnostic tests
> or test a small patch. I can also provide drm.debug
> output or DMUB-related traces if useful.
I think this might be a case where the Windows FreeSync detection has 
diverged from the Linux detection, maybe Harry would be able to provide 
more insight on this?

The monitor's EDID would probably be useful too, I'm not quite sure how 
to make sense of the edid-decode output since there's a few guessed 
fields in the AMD VSDB block and hasn't been updated since 2024.>
> Thanks,
> Ata İlhan Köktürk

Best,
Alex

