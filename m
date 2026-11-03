Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793716542;
	b=KALlQ7IK0e/soEpKKdU8jLIicLW1m40L4dLX2i/1DiDPYsdypqnSIHdYzBtqr7ucsI0m
	 qJQ08N2wv4NNaD2GAlTDF9gFvOUROm8k2bJCmBbzeFLQa/CCwYNWZ1R14Ml+OiCb4Qy7L
	 Bx+hUy4bqGh/wVEYA3PEYUWILKuBdoai3AKr0cvj8iP3yOMpZd1U/LBMoJ1EWa6ebsSpE
	 GRSrAl2tOKyJAjrajT5p/yaGQG1Ep+Ajiwxx09Jk8g8WgDRVtCujCu0O81qy82T5xQgdk
	 btN9atE8v3IQFhHDQJ4NSCJqxTl/ApqMdb1o3vU17G5cFzCoghDkoelcKBjf6pXDuZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XR0Bzo9nCDXtzTFfI+PIJF4f5OVzgMjX1gFs5CwTiGI=;
	b=ZlLICzm5ZYynlI28N1TwxJpjOLrXTQzA0/OLdAbTEZYYwjVQLxTB+web9LeEoRuFXUoL
	 Ec2XXHRnrFstjFDpxeeLNgTWzBMWxusBJ2WAKKqt8bCMjhEREeSx/HCD5irDMROchQSY1
	 4IuufJO3DaJSkXXSVqEtMn3+0hZFGkc9sR2Lj1HMX1b6Hmwq2OnCSclQPyCtuAOYGxKdp
	 TGkM6iYBkl27xXtfxv70ZOyTXBdnrCyeUgcJ5LDu4fKB4BVDZbjUFmKyZmsOTkw8Mog6b
	 ngFzdusugsR5FbzJd/D0IDRKx477Llv1vZ2h0g2y2Fji+XhUP7zlzlUuCyVrve0wLvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zLE0sO8Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785DA606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 785DA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zLE0sO8Q
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-369fc2e984fso417837eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:35:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793716542; cv=none;
        d=google.com; s=arc-20260327;
        b=RWskATSScu708fqQHgoW2mdGzEj7d2We3OHOQZdng6oImYe2VsBCx/PETZuLuh0qDd
         fqWvwXp/i+pv9hqqq0zv7qS9qY5ulZ43I37e/NXvsRkdEmEXCWZ6sspR0JxHIGcmSLg/
         1NcAbQYfpLNV7SXrb/iEBZLGzp45SoElo4HDOx3GZlxRxmrNBxNaa+C7jU1lvHOK90r5
         PdwzIBxWuRyFljE1yJs6SI1Ws9hE+IWLk1rsoIRzOVSmTyoaVpUcb5KDwAInm9m8oHKG
         woKy9BtDZNqjn8ljlLgPvFEr7b/j268YhG2QCh0h7hOL3Zrv81GLOUGFEUSCWKMav0tV
         ecXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XR0Bzo9nCDXtzTFfI+PIJF4f5OVzgMjX1gFs5CwTiGI=;
        fh=c6KP5nEsB/yIACUQwMpaiRBiNkwe7LZerRIWFplyurM=;
        b=VT2iRXyDjoP7SKNsmiVInPQI7r2QBsw5k4yx4dUedHX79zhIMzfuHD+ZFqU8SdTJ5h
         xINM7mwHUcsaHhjTtwY8gPEh22ILT3kC/6Ql91zVePRdAkxZo1X2755JVfLmtBIAqyxW
         3i2o0YoUjfwmbMebShCndz/Az0TuJ/uFgKEiUNziFOaL+zOVgv+lvkKRVl31W3APtXyI
         Snh75Y7rxGuOvK7s0cf57zq+1SJGiDb0vn3oKaZNssDW9lQdprf7ykkcZuONFyOfmfd7
         b1Obq8smwzqk5KOPzb/e0pIPMpVZPwsU4h7pxzC0JyZWV3gu5kBhK9/fVlaCDjq76g72
         4PwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793716541; x=1794321341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XR0Bzo9nCDXtzTFfI+PIJF4f5OVzgMjX1gFs5CwTiGI=;
        b=zLE0sO8QtFlkINCRZEpWybWsYV+zaASJOU5WgsqQltXX43IkCug2ZzxtaoFKW3QI14
         zfznfRH8Zj1gTRvxrqElFnMtL7UnyUUp/HLxuU9gZ8QcueB4+BZYCb9JkuhYVe6mZTX6
         /qc5TpUrbGohbZsejgPfVJWP5HXmG1effABd3vFU79XCeTjTOvAIUO1I0S+EkryjMBzL
         0UfqRfCdioXX70Alqm4XfDKfppkAk06km31bdHLaJ3k/y1/ww8ZEiRyiBWzJRKmJggF2
         A7aTAcaxN8fUuE6muVFNlI7bBUD+rCMax0w9MQaDkf/WBHmkw9MQqIo3WWbx6KWnRjni
         xDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716542; x=1794321342;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XR0Bzo9nCDXtzTFfI+PIJF4f5OVzgMjX1gFs5CwTiGI=;
        b=BGyiYtVt9NvGtmg84i3ttgVs3U+uVUQycB5+H7sSW4j6Bx8Didq88rL4w3H4JjYEuc
         WbV7phrSV365HbnS3L/Mgwr0/AmrCN8c/KVka7m9tRm/WvFTgyXUTVDf3KX7mLcYwERY
         4Os39WtylpyeBfnQUG6pOjgvc6sp7EFcBcIscJy9pey4r2jD5y7ODZPxiE7sLcPGTOeL
         62XZyQluDB5HpkjqjiDyJXR55pOFO0gvBPKojDEznxfz1IoGgJSwKEZ1HulV6XTon+5T
         BRy+8Eg85ZPEsB2c7H4M2QpKP735V6ibHHs7RRqnmdvH/ZNCIt+k/ZKpBHHBzBZr1tfn
         XCMg==
X-Forwarded-Encrypted: i=1; AKwUvBwWvLtW4TDPPSiNPEsNMj86AHWKscpYQYLs8aX/Nwq/WHNXU95Uvwz2dWwwEZlOE1ypQ5uOy6bnHIQB7Eg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B89litnaAkeR56zZNNb7iSG+WuP5gAgT5Jo7RI9z2EzIdleSU
	aGnAZhy0jOTQWkZga/6/EjtCIO84A73KEmrjLFaWlnFAWIWEq1QcDdE51GHbCNyUE2IxlOjXAsP
	rub1KpcKFMz5Hqp12b+WW+FAjPyl8pvk=
X-Gm-Gg: AYBFou2uX+4OZDgrh1Fi7N33dN2osxkhhE408MiIjQFgKCruZFw1PyeTQqpzSKQkFvf
	HxE7e9uhi7NZOw3ZD8BV1FH+tgSj17RyY1N+MgUEx2T53Nw5AOOtwtLG2O2EWcHsRJkFAAn1F9+
	J/rWsj18a/6tOglIK0H9JqTVpTAeugbiv38z92tdcmMJJcBrazBI7rQWLYWxaivE7P5OSt2wApL
	BPau6ERLIBsmsP2kIfWZAq4CU80Zk0swWXMc8pmAAh876NtVLSHzvcQvOS5kQHQoF59h324G3yc
	iVxvXWg9zopkexm+jllgojJKY7CVthSvsQbXDtHM66w3OndE0wamJolHkLUEK1X3H8+6VX+9/uM
	gEAjp7TqwujgFW2467kSowIxY2fevAKdheBnJqgPo3s7ZsPtK73w4YYLvCfpCtlaV4L1onLbxRk
	jp6E9QFtfik+uPFWOQNnj8oog=
X-Received: by 2002:a05:7022:b053:20b0:144:fd17:3b21 with SMTP id
 a92af1059eb24-1ac500d67e6mr32546852c88.0.1793716541521; Tue, 03 Nov 2026
 06:35:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024162109.307247-1-dev@deq.rocks> <20261102232450.61301-1-jahs@jahs.net>
In-Reply-To: <20261102232450.61301-1-jahs@jahs.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 3 Nov 2026 09:35:29 -0500
X-Gm-Features: AclHuK8qKEQ3sadc6FgPVgIka6386fD7xEODSenxCq71uFCEpk0SM6ipVCbP90w
Message-ID: <CADnq5_P5Ly4Pb8WqPaN28yDHG8jSjoEHAfDKAqSgTrSj14Pr1Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: use the VBIOS trained UCLK levels on the
 MacBookPro16, 1
To: James Skillen <jahs@jahs.net>
Cc: Andre Eikmeyer <dev@deq.rocks>, amd-gfx@lists.freedesktop.org, 
	Alex Deucher <alexander.deucher@amd.com>, Kenneth Feng <kenneth.feng@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jesse Zhang <Jesse.Zhang@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 3:21=E2=80=AFAM James Skillen <jahs@jahs.net> wrote:
>
> On Sat, 24 Oct 2026 18:21:09 +0200, Andre Eikmeyer wrote:
> > The Radeon Pro 5300M and 5500M of the MacBookPro16,1 (Navi 14 boards
> > 1002:7340/106b:0210 and 1002:7340/106b:020f) stop answering SMU message=
s
> > as soon as UCLK switches into its third level.
>
> This is the hang reported in drm/amd issue 6005, which has the
> umc_info analysis and test results from both boards:
>
>   https://gitlab.freedesktop.org/drm/amd/-/work_items/6005
>
> Could v2 carry a Closes: tag for it?
>
> I tested the patch on a MacBookPro16,1 with the Pro 5300M (1002:7340
> rev 0x43, 106b:0210, VBIOS 113-D32207P1-019), on linux-t2 7.2.11 (Arch
> v7.2.11-arch1 plus the t2linux patches) with this patch on top. The
> userspace pp_table upload from the issue was disabled for these boots,
> so the corrected levels came from the patch alone.

Can you try this patch instead:
https://patchwork.freedesktop.org/patch/765668/?series=3D174386&rev=3D2

Alex

>
> All at DPM auto unless noted:
>
>  - both "UCLK level ..." lines at boot and again after every resume,
>    pp_dpm_mclk 95/496/598/736
>  - forced pp_dpm_mclk switches through every level transition, idle
>    and under memtest_vulkan load (57 switches, every 3 s): all landed
>  - UCLK pinned at level 2 (598 MHz): llama.cpp benchmark and 180 s of
>    memtest_vulkan, no errors
>  - 60 min soak of llama.cpp runs with idle gaps, and 30 min of normal
>    desktop use with the soak running
>  - 8 deep suspend/resume cycles (rtcwake, lid, systemctl suspend)
>
> I ran these with the internal panel on the iGPU and again with the
> Radeon driving it (apple-gmux force_igd=3Dn). No "SMU: No response", GPU
> reset, ring timeout or DC errors in any of them. With the stock driver,
> level 2 hung within seconds.
>
> For the runs with the Radeon on the panel I also had
> amdgpu.dcdebugmask=3D0x1. That is for a separate DC issue (the MPC pipe
> split on the 3072x1920 eDP plane makes DRAM clock change unsupported,
> so UCLK stays at the top level). It is not related to this patch and
> I will report it separately.
>
> Tested-by: James Skillen <jahs@jahs.net> # MacBookPro16,1, Pro 5300M (106=
b:0210)
>
> The testing above and this reply were prepared with help from
> claude-opus-5-5; I have checked the results and the text.
>
> Thanks,
> James
