Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BD9284690
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631084; cv=none; b=A/G5llMilVo3pHo+L+FFjca+y9MgdpMFk02Ly/yaD+ql9PcWE5mGA/wj7i1xiKtU/q6IdokGtY9vZKxHsYK72EvLpwMZ8IDmL8XkZ7chN+UVfkWuODZ/Wjp17f3Fs+0ClsnTPD9g3z8SZ1Vo7lA20j900HJvI+uwHEHotBz3zak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631084; c=relaxed/simple;
	bh=8Hw80TAgKPDNBf0vWklNUbq3jAIqiU6weeac3Z8w6a4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CpIFMNdSWYiWO+w4PPg4dnlt39gac/+Ztrwe6cuQamvTreJLA+mROSSt0lhsI5QRKhb0lrAb6eJhPDylBQhH2eXcD/cd4GYf7l2oE3O/nGHbo6ZV7JhkUMKfVYLt3j9L+Ikhkbt/AYpZ+APxQGpHPswB6Q7EYHxuOX0E9QmBU8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-78ffc0e2f23so189523137.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789631082; x=1790235882;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TZYjUR6uq0wvJ7yfCunhZRC4s2XoZDscTLrj+tpsIdY=;
        b=sQVej/L6W3KyDocm02vx+/60twq7a5o+WQzKQQi5D8EG2YHk0kQcYDAFyxwkLy1ogj
         JN4PRG66AQyKm76L8JQYJCuy1wjyAetY5nAVlSQKBMQy2FnHQ0BDyDniYl7vh01i7aUi
         ysMi4QFtbwUjDarM5xbqAmCjMRtdooTiex86u9QeER7ic4vR4NPpf8l9K8YMQKfENGTV
         S9ZpDDqoLWWcHyNLk+pBMzlPDuZw+8xlDv6hz2dKvZ5ImdPsYHH4lfBOQaPKeQqMOBi/
         j26jyOMvWje5tXr+4xQrv9gaJ1yie1LR69dCuQ2Qpl0zBq4mEi1uNI9auMmb7YYJOOdK
         k8Gg==
X-Forwarded-Encrypted: i=1; AKwUvBzaDO2JBga+ahonu/rujE2AcVaCFOzF8lrSUdXbLWO60RBV/67rr8c0Q+sKyDei0irbjtnfEFd48NaWWDo=@vger.kernel.org
X-Gm-Message-State: AFuF++lPoOzmuUMNVW5GVGeCx5kF1UrZu247/deWBeTIX+NHYKVEsnsx
	JUyDyfDfYNseaxX7z671VEQxJiYHi/hoztGmobztPL8KlIBo49U14FNBh0nBSr9Zs8E=
X-Gm-Gg: AYBFou3tEjHrzcmYR8u1v8hzdHEPBBYWBPpaKDH4BB4a8tERnR7I9goTSFBfDDmrG1c
	SpJRCGnrEfYbLw9VCTwHpOaBKTm9FV+2mGohlTfLDvtUDQdWyQQ0/1jA0b6xDS46+pvgZhkt+m+
	uxPh3gbIP2bPT6I+5N4v842hKUZ77m5uRn9ohYPfaEs4P6sRxDv6LctHEGDI4A0p/I7dxprrDDS
	4kX9Tm/gaekGP3woVxeh3i5cjQrhmPCnI9w6qaccKCYzRP1NC+iSbz9svtUfSfJ9f7OUZONYawM
	4HLrc1q9+HP/VpaJy8wI32MEKFXSJdP+/UC97o/KWYwXVsoJT9z3fVU0ZlMTRvo6XyhRMoROwXB
	LlTVloJGshImOvCTUbBjvH5gfmHqxr/zb3bOczP7jxk8GRQfR43niRF+VNb9S+1AFnHBJA0AqGP
	m5Hnuz9Fl/YMkBiGatpUBhTsm33ndorHhJSVrnaSvmgmfigCYzEMgsMkcc6qEhs5BLJ/XWrK8Q5
	4cZ3g7WSiy/xJ9K/5ndSb+VRkyDL7ep1a88
X-Received: by 2002:a05:6102:3589:b0:7a1:f951:f301 with SMTP id ada2fe7eead31-7a1f97114eemr1507217137.20.1789631081936;
        Thu, 17 Sep 2026 00:44:41 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7a1e2e3db86sm2467632137.8.2026.09.17.00.44.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 00:44:41 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78565a41a19so161518137.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:44:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzAeFUJsYKIck3wewFfhCMMet3A1j/xVrY5Mevfbi9JrmDOcaORSfYPJjANOyAMeOn3FTkNAXT/0N6AEws=@vger.kernel.org
X-Received: by 2002:a05:6102:3e0e:b0:79a:47f7:6cfb with SMTP id
 ada2fe7eead31-7a029f141f5mr6828795137.12.1789631081396; Thu, 17 Sep 2026
 00:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com>
 <20260912191442.99453-3-wsa+renesas@sang-engineering.com> <CAMuHMdVbYaUXiW11j+LKSuSaLLF2PRR2kAFsaj-ZGsx7nNjK-w@mail.gmail.com>
 <aqsMzXQ__BsWXUqH@shikoro>
In-Reply-To: <aqsMzXQ__BsWXUqH@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2026 09:44:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXBHeRj2tjjqc82MKCm+Tpm4KakrvGwn4q5T7mkTOmrXQ@mail.gmail.com>
X-Gm-Features: AcwNN1WFTEVxpdlneYZzV24ejd-9Z4yFFiZKF6ULft6pvA_51GkjVjhhS6OMQds
Message-ID: <CAMuHMdXBHeRj2tjjqc82MKCm+Tpm4KakrvGwn4q5T7mkTOmrXQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] hwspinlock: add list of locks to debugfs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 16 Sept 2026 at 23:40, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +static void *hwspin_lock_seq_next(struct seq_file *s, void *v, loff_t *ppos)
> > > +{
> > > +       /* Increase ppos here to avoid endless loops. Don't use xa_find_after() */
> >
> > Do you mean xa_find_after() may loop forever?
>
> Ehrm, it's been a while, I need to look this up. Which means the comment
> is not explanationary enough :/

Yeah, I'd expect xa_find_after() to do exactly what you want...

> > > +static int hwspin_lock_seq_show(struct seq_file *s, void *v)
> > > +{
> > > +       struct hwspinlock *hwlock = v;
> > > +       bool unused = xa_get_mark(&hwspinlocks, s->index, HWSPINLOCK_UNUSED);
> > > +
> > > +       seq_printf(s, "%4llu:\t%s\t%s\n", s->index, unused ? "free" : "in use",
> >
> > For easier parsing the output, you may want to use a string without
> > spaces, e.g. "busy", "active", ...
>
> I get the idea, but haven't found a nice word yet. "Busy" could be
> interpreted as "lock taken". I'll think some more about it.

"used", "bound", "unavailable", "occupied", "reserved", "in_use", "inuse", ...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
