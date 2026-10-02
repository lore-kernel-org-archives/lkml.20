Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1DF3EC689
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968240; cv=pass; b=Pt1HrzbeRiQwS9euxwlv/Ke51uogJMnWxCiKYBQjVrcVB20uRxSGtXEJCJMfJcRGzXGBTnVrO61OnxNTUjSKlMTxea31C/RNnErBA5bJbkk3LjKr6VkRJl0jZ4bE+oXAvK5D8/Mlfkc/HXGGFMM4jSiosH1hhbQMol03DPCPdf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968240; c=relaxed/simple;
	bh=bsxydAaPsvIqgzCDdgepFd5N8ZM77CrkcYUouC6m0XQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SzI4vn45DP6rqQeTy+DHA48WmkERK5FJBjLJKHS7xeSqOuCQTNwR3KjP27rhees8mwNBpKaCuLHmN78R3sFUS1gNffhQSXgz6f5kKEvrIRJhazNI6hZG2wddvk77ySPsgbbdKk6dEUWq/QewHYKpmKaahLzA3HRbnNCbnzqZ/AQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MpWUieh5; arc=pass smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MpWUieh5"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-7bf18d0c220so1073641137.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:10:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790968237; cv=none;
        d=google.com; s=arc-20260327;
        b=TMBJRKIgO538tE7zCmyXLN8MsmpjZ7Dh/Dfg6mF8Ro1XFA72PgG78yelh1gzpRl6JT
         9PrTxqvKZigtrRc4OxkgzCkityDb6ZQNoAdkzMl5iUg7r+CRQRU9BiJnd6X6KxtuBNF9
         8dgcZZxjHVsR5YaPeONx8XZdkxVCYEdk/fHocrnSK0fArRyw3m28xfkT4YaJdkYszf15
         Uch+YRzicFMMMIXYEfFticCrnI9ub5Lb6r49BmQZgJbB7Z3yVXJ+GOJJIPpFvmq8RfbD
         CCdH/Ti87wi4zrK7fBxMphHP5BURV+ZZ321aYG3mFOFH/RoJZhfYdcEq5Wzlie2dfiPQ
         oZGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1g3omsTMsYA6NLMPlVoAQ+bgFVlwbEDqlJ8MBK/lW3M=;
        fh=aq4hAYQXkIq3cau5a7sraLRtZ6M/qTRt6ExBjmPhKLM=;
        b=HzyUBooFW9x4/Pg19KCF9aXG6G0hNpxAEgCHP1Ovmdx2xOXl1DuIzWQpLySqNngGET
         3GcYGGlibC23VIQ4tG8jiGnhqzFVhMpuXJd6l7drTFdBj57jQP7eQFOSBrJY9IKcl0s+
         r6EiSKBS1k6rVzW3fr1sTJaYgi7iUqCBtFSDxTnkz9g8wFOTlPMI/1Jnbewa3WONN4uI
         F8J0uN/CBB24J6VtIe5BOIrZliORZRE1Kzu+QS2FqMw5ydgMx4D5SV4UVOYnYjh0lQ9r
         n/IVy5CeJkHtKCYJCjtTZ9PH/k29drY9p9x7+6W2tHX5POBODNBskPLQgAziWhghtPx9
         JvJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790968237; x=1791573037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1g3omsTMsYA6NLMPlVoAQ+bgFVlwbEDqlJ8MBK/lW3M=;
        b=MpWUieh5KV2AG+IQIUSpElS5gIlw8r9GB3j/emKZ2T+UAwxcPLdIPMYqDP2I7FK7k4
         I62j9w0rfucSGqTGSn8CVwvj5biGK5bIjNmJSanbRm+xoMviqve7fvujZsmrAF1nVm7R
         xe0Gq3Xno/AJm1/NvpyFz01z2PfjEShFwEwbvmql+sdF4hK8AvNF2okxL2MQzOKtPVGr
         bZw/xN4hNUdXGTNZzsLlO+9YwTlYZiD2y8knzusoKcU8LEKVtvJU/GK+VeLcMcm5dEjK
         ezgQGE+yFuNK1AgOzCHyvZewbuKvQ5WiVcWt7G3TbJRLSvD05V7IXkGBsNt0GsJllpZ4
         B5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790968237; x=1791573037;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1g3omsTMsYA6NLMPlVoAQ+bgFVlwbEDqlJ8MBK/lW3M=;
        b=s+4d0jopyG4YW8CkcwtnPwybn8rTPFy/khjy09AutUU1wfWDZ5waPNjsgry7fsM2uc
         4RuLmr2UHwjVkNBQH7Kl6MB9cxriTBvT34Ttfk67IZ6TwZLUexzoK7S0rkbBs/ndo62C
         L9B1LGpTxGV1ybNFthnPE3aK1kj3GWHZs98KHGZ4MidYK7mL+wdLGM7uRiPtsLBvmJ4r
         pTw6PqrRY+kwiGhRSvps77LdxeaD8DoSRXEko6sj6KlKc0LueCQjZBl/SB5b14RFQPht
         /cC0O6eXPNV5nccQbz6UlSREpuxq9RcguEOVoLvkemNMb1eoVYl+7/3DW/vw6qRRSsF+
         HWig==
X-Forwarded-Encrypted: i=1; AKwUvBzLjM8UasU8HwRW0qhmBRJYR7SzSRndCI2tUaAp39xmz34haqoa2M3xQo1ismOv9k1rPD7rE4mC6Rcoh48=@vger.kernel.org
X-Gm-Message-State: AFq9FYKApm45HQfvXLimZIdQelk5aZR+CJgyQOj510iSLeKS6Z0vi+R2
	yU3ztWHz2iUM4ZYht5A+3NUSjdy3QOYJQAmY9Xf+cPyQ5duYa8FT8338MAyjCroHGpK0yqNuEyy
	XCB02unQ3ps4qfWqfEYotcQE8CRkk+PKtm+YI
X-Gm-Gg: AYBFou0CVK9BMpf6xiXUpIy5iIBkQl7Qj0gD6HaEdJsJiEyYZblw7s0HyU5B81jYz3B
	M8AHZ7Zs7/CCWEX5m2kLLAKnOjus3Q0x9WNhneGWrjFRg3WZrBBVFvjaLi0K8vnbBOXCgI96Du/
	BeMANEgBg2QjRVDzlZG9sgXwCY+usr7Li4MMaMRuSRvF6gefuxdRHhthu+poyDI2Nc/wE8GhFzW
	qWjd/lbxv+OXA7ksMzEIRLDX2Zg2A5GELQsz36FdRENNbw/ONTPzP9MHdeOfhukDruJZ5Hq9bB7
	oV9F27YIfU+QE5L1Ka5Srztqq0SmdSm6pIu1yrI32aLpvKcNPsyIcznpcrar2zEYS5H7DgJFcku
	nRcdYFXFo9jBcoGhG7MbH0BOhSnmIrSPBYQ==
X-Received: by 2002:a05:6102:e0a:b0:7b5:4700:3a58 with SMTP id
 ada2fe7eead31-7c0f54adbebmr792755137.31.1790968237259; Fri, 02 Oct 2026
 12:10:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815-null-fixes-v1-2-0df9dda951fb@gmail.com> <20261002171818.281885-1-Capitain_Jack@yahoo.com>
In-Reply-To: <20261002171818.281885-1-Capitain_Jack@yahoo.com>
From: jim.cromie@gmail.com
Date: Fri, 2 Oct 2026 13:10:10 -0600
X-Gm-Features: AclHuK8zRY0hMOMSSnnxlFny3tvMylToD5uT6sSAGguetyweFEx6Xv_BTi4bCcs
Message-ID: <CAJfuBxwGvKQrT_CVtvk7xX7pbf8WyE+LS=KAFyc9zSxD=v686Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/nouveau: Fix NULL pointer dereference in
 GET_ZCULL_INFO ioctl
To: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Zhenhao Wan <whi4ed0g@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi Daniel,

thanks for testing this -
I didnt want to screw with my firmware,
but you're clearly prepared to do so.

I just sent rev-3, with another null-ptr fix I need locally.
Im pretty certain the patch you tested is unchanged,
but if you could test rev3 that would be marvelous.

fwiw - mine is a GA107

01:00.0 VGA compatible controller: NVIDIA Corporation GA107M [GeForce
RTX 3050 Ti Mobile] (rev a1) (prog-if 00 [VGA controller])
Subsystem: ASUSTeK Computer Inc. Device 125c
Physical Slot: 0
Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
Latency: 0, Cache Line Size: 64 bytes
Interrupts: pin B disabled, MSI(X) routed to IRQ 101
IOMMU group: 10
Region 0: Memory at fb000000 (32-bit, non-prefetchable) [size=3D16M]
Region 1: Memory at fe00000000 (64-bit, prefetchable) [size=3D4G]
Region 3: Memory at ff00000000 (64-bit, prefetchable) [size=3D32M]
Region 5: I/O ports at f000 [size=3D128]
Expansion ROM at fc000000 [disabled] [size=3D512K]
Capabilities: <access denied>
Kernel driver in use: nouveau
Kernel modules: nouveau


On Fri, Oct 2, 2026 at 11:18=E2=80=AFAM Daniel Campos Ramos
<Capitain_Jack@yahoo.com> wrote:
>
> Hi Jim, Lyude,
>
> This one repeats here every time.
> Setup: an RTX 3060 (GA106) passed through to a VM, kernel 7.3-rc1,
> Mesa 26.1.6 (Debian testing), firmware-nvidia-gsp not installed.
> nouveau probes with "gr: firmware unavailable", so nvxx_gr() is NULL.
> As soon as KWin starts, Mesa's NVK asks for the zcull info and the
> kernel oopses:
>
>   BUG: kernel NULL pointer dereference, address: 00000000000000f0
>   RIP: 0010:nouveau_abi16_ioctl_get_zcull_info+0x17/0xa0 [nouveau]
>   Comm: kwin_wayland
>
> kwin_wayland dies with it, so the whole session goes, not only
> acceleration.
>
> With this patch alone the zcull oops is gone, but the next NULL
> dereference follows right away, in GETPARAM with
> NOUVEAU_GETPARAM_GRAPH_UNITS:
>
>   RIP: 0010:nvkm_gr_units+0x9/0x30 [nouveau]
>
> With this patch plus Zhenhao Wan's "drm/nouveau: prevent NULL deref of
> gr in GETPARAM_GRAPH_UNITS", there is no oops: KWin starts and
> composites, and NVK refuses the device cleanly (vkEnumeratePhysicalDevice=
s
> returns VK_ERROR_INITIALIZATION_FAILED).
>
> To reproduce: a Turing or newer card on nouveau without
> firmware-nvidia-gsp, then start any Vulkan or zink client.
> Both fixes are needed for a desktop to survive a missing firmware
> package.
> Whatever helped find it, the bug is real, it repeats, and the check is
> the obvious one.
>
> Disclosure: I did this testing with an AI assistant, Claude Code
> (Claude Opus 5.5). It built the kernels, ran the VM and read the
> traces under my direction; I checked the results on the hardware.
>
> For this patch, tested together with Zhenhao's:
>
> Tested-by: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
>
> Daniel
