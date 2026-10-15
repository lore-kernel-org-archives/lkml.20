Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092193B47E0
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792089033; cv=none; b=tcJMSmI06xXI9DfYh0h9d6ToLq51T6feezpxTMHR1g54pKxgyWihdewzmO08hLwChHat5qfiBRvlxp57kZENAce9RWmj8RlPQlPIxMP6VmADlZQApe+4Q47XvqgKx2Ixhzr8ndBMLyIAvUz6HS4CZrpqds0fP3EKd+O0vg7Eu0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792089033; c=relaxed/simple;
	bh=P6/dvSz7qneGgfTy8nKL/yEy6vMoWyvQKJylEVWqeVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=SR8nJVD94Hp4mO2RDIxDOV0ZDpnE7jh2pixkMdQmYIzlp6zNfyBBBt/6DeG8//HNGOyo3OuY8kwce95m660NzxTvgGQFHUsLALpJ1+Rijjqqm9RBwDoHXUyHe/5dG9u+ooplKzHKJSJA38ZqOOxnGK5Z48aRQItVIOUSEyba+OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=KsdNJgAK; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="KsdNJgAK"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261015183022euoutp01f3e239aa3b815a9d77a97273690cf86c~ex3imeVnz0698006980euoutp01p
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:30:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261015183022euoutp01f3e239aa3b815a9d77a97273690cf86c~ex3imeVnz0698006980euoutp01p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792089022;
	bh=x6Lm/7Jf9p49V05YIXOEdlVtzYgWkqbSiTYrDBfJ3Gc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=KsdNJgAKPsAEP1NxDTUwfPouqhHYs/SxPJ8AeJVbAPFGRtlJlMQYQLhDY9EiJ+nz4
	 LuPFc+1Eoo9n0mQabnzlcl489dyOf15Mv4cHkApS+P4LlAMNiTda3gkyd7j1H3L3Hy
	 /Bb43XMLwJqaZWANqq6gmEy/3w1heN/OAGuoJ8sA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261015183022eucas1p10d5777e112c34458f4b360407d2228c4~ex3ibJmez0417304173eucas1p16;
	Thu, 15 Oct 2026 18:30:22 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261015183022eusmtip222c5dcfbbdbde3e98c6c15f6604fd951~ex3iOgxaP2603526035eusmtip2Q;
	Thu, 15 Oct 2026 18:30:22 +0000 (GMT)
Message-ID: <c2bc1478-5999-455f-bd67-8b536c452215@samsung.com>
Date: Thu, 15 Oct 2026 20:30:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] ALSA: pcm: Apply sync-stop at SNDRV_PCM_IOCTL_DROP
 ioctl
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261014142454.320703-1-tiwai@suse.de>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261015183022eucas1p10d5777e112c34458f4b360407d2228c4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261015183022eucas1p10d5777e112c34458f4b360407d2228c4
X-EPHeader: CA
X-CMS-RootMailID: 20261015183022eucas1p10d5777e112c34458f4b360407d2228c4
References: <20261014142454.320703-1-tiwai@suse.de>
	<CGME20261015183022eucas1p10d5777e112c34458f4b360407d2228c4@eucas1p1.samsung.com>

On 14.10.2026 16:24, Takashi Iwai wrote:
> When a PCM stream is stopped via SNDRV_PCM_IOCTL_DROP ioctl, it calls
> snd_pcm_stop() but sync-stop operation is missing.  Although this is
> usually no big issue, let's add snd_pcm_sync_stop() call, just to be
> sure.
>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/core/pcm_native.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 6c379068b54c..7ffbf2c0ea92 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -2332,6 +2332,8 @@ static int snd_pcm_drop(struct snd_pcm_substream *substream)
>  	result = snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
>  	/* runtime->control->appl_ptr = runtime->status->hw_ptr; */
>  
> +	snd_pcm_sync_stop(substream, true);
> +
>  	return result;
>  }

This patch landed in today's linux-next as commit fdf9a21cda78 ("ALSA: pcm: Apply
sync-stop at SNDRV_PCM_IOCTL_DROP ioctl"). In my tests I found that it triggers
the kernel bug about invalid context for sleeping.

It looks that thissnd_pcm_sync_stop() should be called outside the scope of
the guard(pcm_stream_lock_irq)(substream).

Here is log from one of my test boards:

--->8----

root@target:~# speaker-test -l1

speaker-test 1.1.3

Playback device is default
Stream parameters are 48000Hz, S16_LE, 1 channels
Using 16 octaves of pink noise
Rate set to 48000Hz (requested 48000Hz)
Buffer size range from 128 to 131072
Period size range from 64 to 65536
Using max buffer size 131072
Periods = 4
was set period_size = 32768
was set buffer_size = 131072
 0 - Front Left
Time per period = 0.030588
BUG: sleeping function called from invalid context at ./include/linux/dmaengine.h:1326
in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 1691, name: speaker-test
preempt_count: 1, expected: 0
RCU nest depth: 0, expected: 0
locks held by speaker-test/1691: 1, last CPU#3:
 #0: c22ad2a4 (&group->lock#2){..-.}-{3:3}, at: snd_pcm_drop+0x30/0xd0
irq event stamp: 10920
hardirqs last  enabled at (10919): [<c0dcda30>] _raw_spin_unlock_irqrestore+0x5c/0x60
hardirqs last disabled at (10920): [<c0dcd5e0>] _raw_spin_lock_irq+0x60/0x64
softirqs last  enabled at (10832): [<c0113ab4>] vfp_support_entry+0x98/0x400
softirqs last disabled at (10830): [<c0113a44>] vfp_support_entry+0x28/0x400
CPU: 3 UID: 0 PID: 1691 Comm: speaker-test Not tainted 7.3.0-rc6-00238-gfdf9a21cda78 #13903 PREEMPT
Hardware name: Samsung Exynos (Flattened Device Tree)
Call trace:
 unwind_backtrace from show_stack+0x10/0x14
 show_stack from dump_stack_lvl+0x6c/0x8c
 dump_stack_lvl from __might_resched+0x198/0x264
 __might_resched from snd_dmaengine_pcm_sync_stop+0x8c/0xac
 snd_dmaengine_pcm_sync_stop from snd_soc_pcm_component_sync_stop+0x3c/0x98
 snd_soc_pcm_component_sync_stop from snd_pcm_drop+0x68/0xd0
 snd_pcm_drop from sys_ioctl+0x508/0xc2c
 sys_ioctl from ret_fast_syscall+0x0/0x1c
Exception stack(0xf1da1fa8 to 0xf1da1ff0)
...
root@target:~#

--->8----

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

