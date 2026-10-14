Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C222349E5D0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966938; cv=pass; b=Hcquil0hZXKJ+uu71ZlpFUpoJ5mM2XdzF++9N8DyYj5Vz2rIN99Y9lSVR79eBlB0rth+YHyqFCTnqLviH7MCz9RQkETmT/gTGISDsx8vjTDmuPiLemOkeCxu0cqBywLnuQl1w+SQiMnmaW3piOtkP7/H6T5l5FmcHnqD+WLxlGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966938; c=relaxed/simple;
	bh=EOo4ek3sK6EryqudhrF3c1RJnay8BTHASgr1GNhq5uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nh2i3dC9VyooI3WZzUvPV4tv66uRGEunN1s+MUePK5GeEQc1r/I+G215qKykN1Xw0Z7L+bo/a+Us/jMDjatH8NS+e/4tDno8NmxLjaUb/a1uSj+Nmej5kAx2hCCRM3ML4LJ3DV143RO4zFuBMNuxIcfigrRuYXD6Aaf2UK51CKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZxsO9EWs; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxsO9EWs"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b0a921ee46so7481267b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:35:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791966935; cv=none;
        d=google.com; s=arc-20260327;
        b=SIDI5eEF8NgPCeu5h7GHXXNUmy5AXqURy4CzZqFN1M6EXdmMfhlxVC7oWRwg8khaMS
         qL6/d/SKSIWIlxid+5rkpOkrJHVaxChIgHWOAqYMDNYhzGtdeOcftSr5rdlkwT/+DWKx
         RE4z6PJdB0QLaikE5FOrqummZm76xV1dj99yeoRmjTHxBashTis9xiZWwaSskU6bvgX0
         9wrC/WNVPbA4+lYAQrOvQhza2wiU6dOrckzaoRGcuC2QkuXSSmbm5Fv+8VoXOnikvYsr
         tM06VDeEFlEqcnMfMIBMOWp/tAk1/nJ+NIpRvg761QynycpYWXKF48oaK2yyL/NU7dUQ
         lS+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ETcizyd6ycOmRvJMMDx15TzJljr7TKeRir1WfAEDwqw=;
        fh=wXHbzx2X27HqmhYYvWO+UfYkmlklxuVawhW7OIBGiww=;
        b=fwvVYcvbol0xIE8DQk11QWrp7KOITkXYaeUnHXLcXMoWkSdyF0tIaF56bjhz4Gap91
         r7EE8OxNJhb/BZP6xtV2thvWsU/8+d4CRtDkZcV/PdHwNx/xfH3Ef3GtDArhXoJnmkjt
         T6IoaW/d8URFyegTztz5S1TdUcmpBWKBEg5nssWqj1QdhcNlFdVhCxcaOCUQdZi0gNqJ
         kOp6pbW+7Jm3vmj4lWExOyQ8roD8Xz4cpZWcg9PzmnxE5xjFOsZnxAquOysG/X2edNpe
         16D1N5hhA5WOaSLa0BKCNJj8os933K988sF0U2GKK/ye+c38E6foPIOzcPQdvSE8mhX6
         r+VA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791966935; x=1792571735; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETcizyd6ycOmRvJMMDx15TzJljr7TKeRir1WfAEDwqw=;
        b=ZxsO9EWsUTYMGnvvQCpNC63zdBpwNHrjaE4jMOgtWqL31bfcKZiUiHD4mIvu9ttOG3
         v5S3oyT99MeWkg5gAAfYMHCEneSsYH2QJXftPUwHEO8x2Ef1Lt5ubgFbNcT+jVSIki1p
         jQ2JJP/MBJIFj/RlxYBE2QIKqDWlAm0Oj/pZ2LMMMxJn4XnFbS54/ekpXgFDkpHPtxvx
         hpuvIeYU0DkMop6FCqlW1aBZRN8zhZm2u5dZkwlZJME67MG1KVh8gY36bZ/1XMvIEl6G
         1VIxmsnNPjm78J7R/fzuwyH5hBycp6PURfM540HExetl68Vm65XySDoIRgEPwoRll5DW
         EsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966935; x=1792571735;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ETcizyd6ycOmRvJMMDx15TzJljr7TKeRir1WfAEDwqw=;
        b=FTPbxgZlyhkhg3kajjtLiJjQKUbwetOVkUC/PQQdwSw1jHu0VDGe2sQ+Oj/IcFgAaQ
         QR8sMXvT2GISK/BdbEu5AeHfnWAqYbToRRAcecR623FJoC/3yF/X6L3zZrWNfWHWnCSX
         JHyzX1fADf/kV7fnxJquA+sa5DQbgULwDBXgDGzEbQsx/V2i2c+3FFx+trrzn+Ggqikj
         HtQ2yWZbhwfZOzzE3VIxQxAbKroEaBUUXxvdOX3cRajkosd4ImNLCR/vhMQfyAzdFIVz
         AEkWx79oTdGymvSuZpReEQmCz8flSYZi0oWCabfhg/wm3vBkadh/m1E8oya8VnCc4rbv
         pDhg==
X-Forwarded-Encrypted: i=1; AKwUvBxmLS6vGMpD0iSBEIhw7okmXPEy2Dc+BCCDnvB43YBSSok0r0oLhccriFGAU8E6ftbPwwnIUlPdhEczy9g=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3181NRW5cWzNWKop+5jG7rcLDuIO6AGuRO9kyAYUOo6DTUEm7
	v3Z3imIHPU+iTuD9iLpfv1tTxn+rsWfexom+hF01M9NecgtofY6Hgp6kTUUJW6HCta4sRvk2+tm
	o9wctGetXPCAVeqJOCqEYKLuK1LIKUkI=
X-Gm-Gg: AYBFou06H1leU3vRgTx6If9YHdELb5x0/JSexPxb62unc6PJ13LXayz1ATShRZ29dhy
	NHIa4wSpOgx4UO/EfRLciwooLVvnyzDzL5AL0guHhIeO5ySFxgxjg5DF2qfnAdGvXE3UxGoKSFs
	RumSXk8Wck9Xpi9DBjZLiY5HyhfRnO9WetaS3n8nbdSySr/aY1fEfLaadLc7ovgPdog8Jg8LrEo
	/CVUG/EraoHq6HU3928nTRSXGKCW751icXRj7Yip5Vyi0AAbX3enO+o4ni0owsPiPl6pEBdX0B2
	b79abwEVVyUHlM+HgVzIa7ps1LUgw+0Vml+qLlT8YtnEo9sF0IQiY6/a6Q==
X-Received: by 2002:a05:690c:c684:b0:8b0:cc54:f0ee with SMTP id
 00721157ae682-8b0cc54f4fcmr1364507b3.59.1791966935614; Wed, 14 Oct 2026
 01:35:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-9c80f858ccc13b3de84d-v6-d4059ea2910fe5430f5f@gmail.com> <877bjkg35f.wl-tiwai@suse.de>
In-Reply-To: <877bjkg35f.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Wed, 14 Oct 2026 16:35:24 +0800
X-Gm-Features: AclHuK8EpU1F5sxfdmuxWTFmmBSQu87mqg4s6v1v80j8imeHsdfxPk56f1ZNi4Q
Message-ID: <CAFRLqsUH-ehHgXsqFGANE2h0-3WBkeNh7-AOvf5ymWAOH5r5Mw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: dummy: Defer hrtimer data freeing until runtime detach
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, sammiee5311@gmail.com, 
	phucduc.bui@gmail.com, kees@kernel.org, thomas.weissschuh@linutronix.de, 
	tglx@kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

>
> Hmm, it's not clear how this happens.  It looks like a typical
> obscuration by AI reports...
>
> Basically dummy_hrtimer_sync_stop should handled the hrtimer cancel,
> but maybe the problem is rather its lack at releasing?  If so, the
> patch below should cover instead.
>
>
> thanks,
>
> Takashi

Thank you for looking at this. My commit message did not explain the
scenario clearly. Sorry for the confusion.

The observed failure involves a PREPARE ioctl on a surviving linked
substream. The test opens two dummy capture substreams, A and B, with
the hrtimer backend selected, configures both with HW_PARAMS, and links
them with LINK. It then performs the final close of A while issuing
PREPARE on B. It does not issue START.

On the current for-next source, the close path is:

  snd_pcm_release_substream(A)
    snd_pcm_drop(A)
    do_hw_free(A)
      snd_pcm_sync_stop(A, true)
    dummy_pcm_close(A)
      dummy_hrtimer_free(A)
        kfree(dpcm)
    pcm_release_private(A)
      snd_pcm_unlink(A)
    snd_pcm_detach_substream(A)

So the close path already synchronizes the timer before freeing dpcm.
The gap is between driver close and unlink. snd_pcm_drop() leaves the
linked group in SETUP. The release path calls do_hw_free() directly;
unlike the HW_FREE ioctl wrapper, that helper does not change the
runtime state to OPEN. A therefore remains linked and in a state that
snd_pcm_pre_prepare() accepts until the later unlink.

The relevant ordering is:

  Target A final close              PREPARE on linked peer B
  --------------------              ------------------------
  snd_pcm_drop(): group -> SETUP
  do_hw_free(): synchronize timer
  dummy_pcm_close(): free dpcm
                                    Take link read lock
                                    Walk group, including A
                                    Accept A's SETUP state
                                    dummy_pcm_prepare(A)
                                      Read freed timer_ops
  pcm_release_private()
    snd_pcm_unlink(): link write lock

PREPARE holds the link read lock and the participating runtime buffer
mutexes. Driver close does not hold those locks across the free. Timer
cancellation waits for timer callbacks, but does not wait for this
separate PREPARE action. The later unlink is what prevents another
group action from visiting A.

>
> -- 8< --
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -2301,6 +2301,8 @@ static int snd_pcm_drop(struct snd_pcm_substream *substream)
>         result = snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
>         /* runtime->control->appl_ptr = runtime->status->hw_ptr; */
>
> +       snd_pcm_sync_stop(substream, true);
> +
>         return result;
>  }
>

Synchronizing a pending hrtimer callback before release is sensible.
For the linked PREPARE ordering above, though, I think an additional
lifetime step may still be needed. PREPARE on B can start after the
extra sync_stop() has completed and after A's close has freed dpcm,
while A is still linked. It can then reach A's prepare callback as
shown above. Waiting for timer callbacks alone does not exclude that
later group action.

Best regards,
Cen Zhang
