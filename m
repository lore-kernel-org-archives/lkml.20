Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1BB2D780C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792112544; cv=pass; b=PRcDzOlJmkiNT0AxpS4gM+u9KNdSL1ZYdDYFgpadkq10a6uzeMWemshO3uoUXx1TNz8EtLOVOVSDyypn6x8dZMEgDCP2Q9MrZDJuWVqP6+dqvlH0Ufyr5DzE4mCdr5hI9izK/5T6zADzrlncoA06173eUVQ2SOT8sQayODtKxwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792112544; c=relaxed/simple;
	bh=wBL4SL95L+TQnICvrDYhAddbR+PbmE/yJ9gkoqY22Eo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S0Nyclfb7A8Nj+XD4FDwlaDbHPp+DttjhpKA2vTjVBzykqiUMg/QvCUxMobHKW6+GbIYNFPsZ2YBH7pj40pqS68Skqm7jzbsT5mEzdFLpY695HeSY/daGFYychyzuSmlL8XmR9xFzIMgDXqB7mGGZwuH981wbhPUGsGJkyv9GJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cT5brC7i; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cT5brC7i"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b0a28a720aso43613357b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:02:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792112542; cv=none;
        d=google.com; s=arc-20260327;
        b=pJbB2eYzR0YMRfLJw4yrOc3cPSy+po2oSwyGz5Ls87Sm6/tdYfetkLbSTLJa5OaPhy
         oYgymxVqlRFRJfG8HFYQdolKszzxlTra7KdVtjUomfwtdZBRUX4eujHsbxR0m/KhZRqD
         MdwB09tlgslqaP527yF8N7MNlp91eksRK9IjVLL/sDjrtpLwFnbHA1cdrCZbVjrtaO5g
         oSGRcDiueGtqnb96CDmVNYY8/0d1kyUxn8XGHoeQMhjvXlaRmHeWvjUc1JTQITBe/C6D
         bjzPMG/j+2P4ccX0yXF1X1vqvbPiBVW1jAry0+9uZ9jZIFqQ8IJFjeocgEwr5oTIW99q
         1XxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=61thaWeZT91miu29wfZjfnsN1VP7QHc+H0c4ZsXVYAI=;
        fh=cKu/eQF97Rxd0qfcfOJ8jkpR0PAXAg6LLZrHgkcjdlU=;
        b=hbzYqoOy84cvhI1Y8xH2JlAA01n2RCcp+tWHIjADvXSQkaDMClRvVPnJJT8ohSp7Ef
         eWtJZw9HocQah+R9LAeA/PCSOudWRrCNo/YYYY6TOP2YtFFar1VYaXOX5I2gGWVoSx08
         Q+1U7Ylp65rf16hKiOL1o52CuESWkayBxIsmwtj3zIwM3T1ytx/028Rz//7xv/WmP9C7
         b0HAEJ7HAcvHEcUezhLpYYJVV5HSm1y9d9cBckoHuTIxzCORBAmZoAbZ2JLUa+oUiifV
         gIEY8ufMysb6tGCb5+bubpvXCGlvtgptE5IqGVuDfFOd8VuOHBr489Vm2GL6lzhfRGIB
         e0lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792112542; x=1792717342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=61thaWeZT91miu29wfZjfnsN1VP7QHc+H0c4ZsXVYAI=;
        b=cT5brC7iOfTtQBvFyw4dnHmYWOoEB7Dt+mHjGTLshQCn8QQDwCEixuKLA8E+Kx37PS
         FB2JxyhUAtNSKDSE6D+ekborYkACTNrfGKd6RSG1vup2kXmpM43K7RiYOqFEzrJLeY32
         pmu1pu8WKTiiLh/+xSmqH/nYT3xCLEEm+oo7s40UJyn8hm59j0unxyqJfIXJ9dbUQ/ME
         QLoBcQaUqcGsrqPquJI1hGPMtM6iWY5JTNDQH9nFpg17kvT3CbYwh1qlFE6KOKMrvkv/
         k52EKqcELFrqoe/YPm7xNwZxRPLlfNktEqLer8a8+KkiHApF0BK4GhweDKSvlaiUIxVG
         wNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792112542; x=1792717342;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=61thaWeZT91miu29wfZjfnsN1VP7QHc+H0c4ZsXVYAI=;
        b=vpVAofptbzP8M4gxtU7WHEPso4gHU9A44WC09EHs+qkPo8IT/TG9o7uCpzWuedVp/Z
         CoSdyFswQTjY+4EVHE9vQ+Q+TkZGi+o+8+ybRY7TWnrKhyYvf3/0dvYfHD3uAMt3JXLe
         TNNL5/41rpw3tEHpKhUx2ADT4Zi1ij97al5wtHpV9ayrWONZAiWZMg/zMcEhYog0FWaN
         6Fo1Rro5c+FFPklE9TACUprQClYMZxjUv0F2xmRNWsQt4udMcu6d+zZazmeo3yc5YljQ
         R+n/xtZhaXzkWUeGG3vquKBIFaXmW8gb0A/0KUskWjKOwDNKq66bR3m4j27XuwE2bpe2
         /7Ow==
X-Forwarded-Encrypted: i=1; AKwUvByIP47wsr+CMwLeBpfjv/Gi6CK2Y3XoL4o6V/9SKOkB3zL6lUQnuVmHsNhUu81+WyPj1xhrIYE2l9sjkME=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGZbQxFHqH2K2LYRV69hbv80pX4rW6wZ2xq4tbJKWUqQWKxo+V
	lF5MRWZG0DruA7h3duEQJqp8IrsEoJxqjA/0RGo5S6WpxtikAMb6+qB+Q5lIDPCMDdDJ+LzmE7v
	+vludoRNBJWcDnU1yX4c/dG9HDpEF3Ug=
X-Gm-Gg: AYBFou2CBXcUNPMJYBCb1513ToB6LPLLYKwKjVqDeBuCmoYKXkYIVnMdt6u7g2mLmPs
	fJxqhHyOLYTHgx99gq7k9/Fjz5zWgsFOdRcXXKqBKWC+IDECVwmK80iKMRgBQZCxk7WEbng8P5P
	ZQr3GxAkj0PqGpEUkDpfkFcQnEF60odGxc7ApC66J/ZSq/LgrMyMew9YMJGeRafhuvegAXvyMPQ
	pCQli0hFHyw++hSmpU6m7pHLobx5+IRJtwW7KkhZYVLiRyI0dvBgPNwA5ppeilQXjTEwWe1+uM8
	gqU0NRqoXsyz/4kXPxoVoQMlR3KZIuVg3m2g3c3d6X0LI6MH4chnWk0pbYQUw5SusEn7/x8HxzU
	8QFL0uE3YY38=
X-Received: by 2002:a05:690c:2605:b0:8b0:cf3d:7b19 with SMTP id
 00721157ae682-8b0cf3d7ef0mr21478237b3.32.1792112541667; Thu, 15 Oct 2026
 18:02:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-alsa-pcm-drain-wait-lifetime-20261014-v1-face1209fbc882aabda2@gmail.com>
 <87a4oe7sp5.wl-tiwai@suse.de>
In-Reply-To: <87a4oe7sp5.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Fri, 16 Oct 2026 09:02:10 +0800
X-Gm-Features: AclHuK-9sZJHv-N7sDN_4DU5rI3kpYqHnyhFgeQYS7zeI7kbuFwQvs7XDIngvOw
Message-ID: <CAFRLqsVKV7X665-HOu-SRjG4s+D7QrRciiD6SVZexAnS7pffgg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: pcm: Keep linked drain wait entries safe across unlink
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, phucduc.bui@gmail.com, 
	cassiogabrielcontato@gmail.com, cezary.rojewski@intel.com, 
	kees+treewide@kernel.org, yilinzhang@moonshot.ai, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, baijiaju1990@gmail.com, 
	jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8816=E6=97=A5=
=E5=91=A8=E4=BA=94 01:57=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 15 Oct 2026 19:10:29 +0200,
> Cen Zhang wrote:
> >
> > snd_pcm_drain() queues an on-stack wait entry on a linked playback
> > peer's runtime->sleep. After sleeping, it calls finish_wait() only if
> > that runtime is still found in the caller's group, since the peer may
> > otherwise have been freed.
> >
> > Unlink wakes the group members before removing them, but the generic
> > autoremove_wake_function() removes an entry only when the wake succeeds=
.
> > If a signal or timeout has already made the drainer runnable, the entry
> > can remain queued after unlink. With unlink performed before DROP at
> > final close, the following ordering is possible:
> >
> >   Drainer on A                       Final close of linked B
> >   ------------                       -----------------------
> >   Queue stack wait on B->sleep
> >   Signal wakes A: TASK_RUNNING
> >                                      snd_pcm_unlink(B)
> >                                        Wake returns 0; wait stays queue=
d
> >                                        Remove B from the group
> >   Cannot find B; skip finish_wait()
> >   Return due to the pending signal
> >                                      snd_pcm_drop(B)
> >                                        Wake traverses the stale wait
> >
> > Use a drain-specific wake function that removes the entry under the
> > waitqueue lock even when the task is already runnable. Preserve the
> > ordinary wake result. This lets unlink detach the stack entry before
> > changing membership, while keeping the runtime check around finish_wait=
()
> > so drain does not access a freed peer.
> >
> > Also hold the existing group lock from selecting the peer through
> > reading its runtime fields and queuing the wait. Releasing it before
> > registration lets unlink perform its wake before the entry is queued,
> > and can let the peer runtime be freed before it is accessed. Release
> > the group lock after registration and on the no-peer exit path.
> >
> > Fixes: f57f3df03a8e ("ALSA: pcm: More fine-grained PCM link locking")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
>
> This doesn't look needed / fitting for the latest code?
>
>
> Takashi

You're right. Please disregard it. Thanks for pointing this out.

Best regards,
Cen Zhang
