Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9557C54A7F9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078552; cv=pass; b=ugAO2ynEjxACNM5HKiE9V6TgQYCOOdyDl/CjMgxmzrzQHAzL91q+S+cl7MRz/IqESLmaMt92xcHx7edsTBEHy0k+gu5gGAEHksIRXK9L+8S5BFhgae/yo1UC2QXEUnkiOW/dBI6mhk1Kg476Gz73ABSGE1AYE+Fz0oNkd8pWt8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078552; c=relaxed/simple;
	bh=8tCMJ+7e6cvuGkvB8JAFDQBw/BIB2edtSCv0VjFkKpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LcZE1iETcaeElHotbeO/rGLhs+X+QOU9nJHHmdrcIato1U1o+wC8I+kvSa/iYN7+OipTr/9S0eMDHuSVow7zwi4XPMJsbwcDhysZZOkGlsuH8ptTO31DHY7wTIeqLNl7UYOGnSoMNHB2oGJNrnafzeSmaYh5pnt6+xd/XmgED6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFh34z1Y; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFh34z1Y"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8ab395abf79so44039967b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:35:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792078541; cv=none;
        d=google.com; s=arc-20260327;
        b=HzdGD+eu2KzEE41dpQyJrI1bN0vBYAghKRO4zfZXFhDO78StXvCS3yolwK6H4fTr48
         Hq5z2ijE7MEjK6qGedsEwlVh8s2kulNnHD31Nxl45Tl0V4xCu077FmmrSEw6rK5ya3m1
         9qh5a62BEwEiN06azmv3Jy5nFGaOt55+s3vIyC6Pe/FCp2msVrwVvQ/ZFvh/h+boYxIE
         Fe49lcg8wYy/Wrzwj89XKhb+KYXofUPuSYWptC2TAeKAlhH8kVKIvA5DGFEGz2l1zVz/
         f99TMnWU7knnjZS27kqSrPoc/vVwkWGss+Ea6HV+6rrRWdf/LvKYlDS0Ikx4yJreUwCN
         YTQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O9803NfCmeXmOQXfKm7bi/Kku7vL5xpYhTF2JaBKJP0=;
        fh=RGwTU6gd+JaM+H8NEOm/NzR1LcpW8Sw5wo9dBaem6W8=;
        b=UABrvBCupNG8BeCd23NXvMclenPP6NKZsIWfNruJxjmy9NOCP1B1DBocNhnq+ZU7Pq
         OUhQiOPqnrKwAb7M4I3ciLTnBXR28KKM3YwLTLMX32Q9o9vvx6OK77AIjVuqWICckuJ/
         7tz3789bn77H5nPYtSPVc2z/82OjfC07FA2ZyDTxefdbwoWPhd26OaDvS4DEW8mkFCjC
         wR13CbUdwbG+Gsp/UbA7YPBxZiELG3fe4TxmWaOAZT4mIAD15DqWV//cnyhFUASbv5Wo
         pDSXx9nKSJQRoWkCi9nHHgHT3L5TuaI99T6kw52Fqz6o4LOEoNvZsrSnlAnnJmil6cy7
         CqKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792078541; x=1792683341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O9803NfCmeXmOQXfKm7bi/Kku7vL5xpYhTF2JaBKJP0=;
        b=EFh34z1Yc3CxbWL3G1N9xB9GK41E/XE8KCfuTFrDUvSd3X/MIgbDe5nQ6hn6kuKrcg
         msUDv6NkyoEdEam3jKPdm6edcW3aX63WKc9Kpa6i0aP9XSjKz/mpnidMS8mf9afxEgHc
         mfw1ipCu+1nlqXcwYtTJzznRX8HskVU5Znu6JohgtJjxbZ8RRiJQKas11uZnga9XtoyQ
         tpc4+YzR+jjbdVwxDw2dvWNlbQhYtH4QtydStOgrqyIqtnOfzqi4a05WWOL4tPD1Jwr9
         3+MM9lWtSCFtrhPrEn0NGixCN/2NH9uIgqsfuWE76zzXvx19YJAjru4zfzdoDgp6GlSA
         EQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078541; x=1792683341;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O9803NfCmeXmOQXfKm7bi/Kku7vL5xpYhTF2JaBKJP0=;
        b=ELz4/iQc7KcFirqE6tQme8cN48H8qclkLtmNRAcoSHhyzOKhLDnJQkdpGAYuDOnqGa
         kyXz7RzswKs030M1yixZluE5e+NHJ33IgvHp4KwCeLyPNAKKRQUVpAW72DXYC2dn1CJO
         Q6+9YAR70rFjkDrBoG5T6x2savMmKUgK3vYEYDpwvD6hi6YfrcqlV99fAfrcgl5F7Cot
         F1F4ha+E2jY/FBSg1rLNhZNGFrGn96PI9wW3nSm4ByHj+4MfdDjn3j63jxOaccqFR3UK
         gR+A4sRuewfQNj6RjHRCidSClWJRIOpt0oXfx88kOAFwAOiYN2AUneqW4vY8EZCJk2Gt
         5BTw==
X-Forwarded-Encrypted: i=1; AKwUvBwSEarAt3oesuBc5bLJRYo85YS6mGNak6P7Cz3Eg2VJg4lRKL72/X2Yck4utbDDHQ3c4TNRjEwnTkPABzs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbRkYkH5gFV9r72ShiVacZjGK4tsubWJLYJtTYQT7yCEwK4F0L
	eVf85YZKUEyT137tg40zg0yCGbnYKLXn5M012G6JPRMcvznCFZBGmoMvjiApWNASXmWduX1RmKz
	WRrseH0eoLkbISEnqtEQXcTTup6V/lXs=
X-Gm-Gg: AYBFou2pdpIwBwnzPho4cyGeZv/Z3nq8V2FAvwiNY9QfkjuC6O0IPHJiyCWleE0bCSg
	8lM+6FzRbhuHVUFjNR5mZpxwIvL1MXxlJ63Z7ddmypOV30ezga9k8MdcoaO/EFe/vbXN9rOmWca
	54Z3w7OLi4oazNAXRRCkE0xku78s+rj2wPBnyHgNklxKLQm633CCW+DBB1JH0BjMUDIYoS2WzIK
	R4M6xDGCKxB7nWYywfhBXZOmujS3xJkFCSrxOIf43jrfqiCfym7u/niJKaxzT/b8Pe43f+lK2Sq
	O/tklA92GnITvJXx6SoMc0PVOSXBBvASSD+87JmGA+0XewOmWnVs/viLHw==
X-Received: by 2002:a05:690c:9990:b0:8b0:cd2b:a43c with SMTP id
 00721157ae682-8b0cd2ba992mr14814587b3.53.1792078541372; Thu, 15 Oct 2026
 08:35:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-9c80f858ccc13b3de84d-v7-fcd8c7aa0e837bf0b036@gmail.com>
 <87zewgcuhy.wl-tiwai@suse.de> <CAFRLqsX6Yz2dv_dV4BvV6_F-16WDWYTAk5ikC9WY7ZySkoJKUQ@mail.gmail.com>
 <87qzhrmnz3.wl-tiwai@suse.de>
In-Reply-To: <87qzhrmnz3.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Thu, 15 Oct 2026 23:35:30 +0800
X-Gm-Features: AclHuK_eycqSwROe97zxxEkUuLQ2EqQMdmAcg7LZi_wxsmSqn9aHYMRQWbevAEs
Message-ID: <CAFRLqsUY+RhE=CsMHAvcQtUmwE_hd4_WUhJKSJiwdUUE3a--Yg@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: pcm: Unlink substreams before releasing them
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, phucduc.bui@gmail.com, 
	cezary.rojewski@intel.com, cassiogabrielcontato@gmail.com, 
	kees+treewide@kernel.org, yilinzhang@moonshot.ai, sammiee5311@gmail.com, 
	kees@kernel.org, thomas.weissschuh@linutronix.de, tglx@kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8815=E6=97=A5=
=E5=91=A8=E5=9B=9B 15:18=E5=86=99=E9=81=93=EF=BC=9A
>
> The patch I submitted yesterday is such an attempt:
>   https://lore.kernel.org/20261014141212.316223-1-tiwai@suse.de
>
> Unfortunately it couldn't be reviewed by Sashiko, as it's based on my
> latest tree.  And now I noticed that there is still a potential race,
> and fixed now.  Will resubmit v2 patch.
>
>
> thanks,
>
> Takashi

After read the v2 patch. I also have a minor concern: is there still a
lifetime window between snd_refcount_put() and snd_refcount_sync()?


Suppose drain(A) has pinned B's runtime, and close(B) has completed
unlink and drop. Could the following happen on two CPUs?

  drain(A)                         close(B)
  --------                         --------
  finish_wait(&rt->sleep, &wait);
  snd_refcount_put(&rt->refcnt):
    decrement count to zero
                                   snd_refcount_sync(&rt->refcnt);
                                     /* sees zero and returns */
                                   ...
                                   snd_pcm_detach_substream(B);
                                     kfree(rt);
    wake_up(&rt->refcnt.waiter);

Here rt is B's runtime. Since wait_event() can return on its initial
condition check, could the final wake_up() access the embedded
waitqueue after rt has been freed? A holds its own stream lock at
this point, while B has already been unlinked.

Best regards,
Cen Zhang
