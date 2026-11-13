Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794539862;
	b=EHSXgv55KNns1owQyzDmaVMbj3wBDcT5xEFfrHf6h/Y1b4rtJpc/edpJhTua8qS79tcm
	 AurPI73Ef2wDi0izRWe7xm1bmRSLgzCSM1I3eL+Vge+5L0oc7zSxYgjJCXER1bjp+3cYo
	 t1KInjEAs2S1oIgsGH/Vo34RZySUUf2RnolYIjGiDLxPXfrykXuuO9D/QSRUKSJivglN0
	 CFQdwQnvT3t9L20hfunij7Eyp9MnfSf+8A6O7YujBMM96rLX6Sw0H/jkBx5nFPH42imQ/
	 qDbm8MpCO1RLCreqLnnDXCARxZpguLaIkhRYN+DiR+L1x7S8/DsJUNk97FG5m5X179Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794539862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=n5967ZDHxZDdRDcuY4ilKzGF/DOGAuv3g8MurJqoARQ=;
	b=LGFpWBJXUu21NBfrlylN7bXxW+FkFu3FZSbyjhE85zolrEgtH2kvCD0doBazgbEKCMKD
	 X4CX7wk+dgAUlj5ufwmG90XYS9tl3k5Tv8OsveeVQpUOHE/KfgY0tHyqeHKL84bkPGcNt
	 30zf/HDrZVvhrB2TDpkSx6HJnXfln+wcGLAmqWA/PG50b9YuhQ9IiIeJqiC84IpeFUZtw
	 aSdqupNMDPnW0yFtcP4Y9bLtPV0S2A6J34rHB6R5kHwKNObeNVFLcvmW1B5oPvRhudxkW
	 kiPskFZ/fnT39eEPeF7C2TxELi1A4Byq7i/N+/lO2rb2urwDHi074aK3/D1hnUNhDUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kacws6zS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F206B606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F206B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kacws6zS
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5383c97c8cfso105941cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:17:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794539861; cv=none;
        d=google.com; s=arc-20260327;
        b=AsfPweGOTOSIRZ6FGnckzzUk6psU/hE0UVcThT3ILnPWqWw/N7cwC8J3DN8xiOCARp
         2Kg4CnUQLNZquJmO0gRw2dTJAZBbZPOWwEgtJTobH3MkF1gz+xEtmWkx5mS6YmAEdVKh
         a43nH1pytpR8YSwzqoEmmH0M11DhdwDluGTIoOtQT0NYCzWTsaaDj+FXn4kpT44eSlYM
         HiBzxSTknsBLft0lQc+Xu8fuFCDvd3+QrOsb9IpTYwm3I6XaetEKL1+FBLclKGl0f2SS
         pX09yhHwOuznu5U33H4ERQPg3ndGf09wfT7iwNIsZrpb66NELsPTlOVrpPxDtnIV8mof
         hlCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n5967ZDHxZDdRDcuY4ilKzGF/DOGAuv3g8MurJqoARQ=;
        fh=dni5XrcwRU9TEtA/9LVdpmP80RE9Z754j6uxYGyUSYc=;
        b=XIF0/hqfzRfMHe7vRNRcnQTWMVAM2WGOOSnqihB0/Iexz3n3+n5Bjq/lNB2Hy48lWf
         J+GiKc+bMFJuqs2YVuDtxUtSMd+lq9IMItBhbo9Oo3Bubl6TqqQj4sw8SDy7Yy98rtkL
         d7It+v8EqVaQoP72BQbndNbYDIfy6yTJss/fbxfTkVIRGqbw+v6kcZshUnoOlu1Qkgue
         32RrCKRbUtHCubt6b66Bwl0dzVHfFAlsesHSlM/dYDhcOyVM/MDBdV5aNEL++Do3neXg
         g40a2pdk5Fo6PIWYxpF+jrfR8PtMsjWqQ6/TF9f6lQHCsgNENfvS1T7GWGgxnRZAorSb
         ZTZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794539861; x=1795144661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n5967ZDHxZDdRDcuY4ilKzGF/DOGAuv3g8MurJqoARQ=;
        b=kacws6zS3CUOml5rgSdg5Iy/JIAu/IqgMh0TTw942+GgstlfOTYQXqmSOCcYRIMSSs
         By37LIJToULz2MSya5/aju0y8rtGK2ylVUzOQgiyxfP1rMNobgbhfSXe5BG4AE6y4ok+
         HtZMOySBK2CHpmTv+iJpW2X7KjG37HpTgrTpoelkd+r1T0TYDiPJRf+kdYeofRq/M4FS
         8Jfx+LTfeScilR+uMOTQfcnqe3srE5WbfnGY9NhHEXslham6nsM31YJIBGUPVQFgCKJ3
         xpIK0MyTqMkJVVcMKx/Os123vHcDqnBXFSZKxQCWt/ZkTAejO1AwDMUwWSKHeWvWiMWb
         ePEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794539861; x=1795144661;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n5967ZDHxZDdRDcuY4ilKzGF/DOGAuv3g8MurJqoARQ=;
        b=U0aR3tCYh+1bRBisrEHBZuuaaChOYdGC1ohZbW99M43kqI2sGR+iIO1Oiav+0oDp7w
         Inq1+lAiiG7iB1AI/TC1I94kdCtDdGFSVXmlVEx8w4tSScfEtEX5YF6PasURm+D5DqwB
         E0n/IYALfc+zt9sRWgIxNICGtEUM/GQYcQGwOCdUBUGlhIrjn8oN4gjr8kG+y6bCrpRk
         +MM6XdVp/+2MiJRXlE/8LTI7npTMI6dcnVbO9Ha1IANiKsD/b7oZSyro6QpgcEnsssg+
         9sheRNcUiLbEknmgevDSmc+SCn7oX7S0RGEXbnAs0FhQc57+TTQUP3bP3NPPe5nU1CnW
         aufA==
X-Forwarded-Encrypted: i=1; AL+hErHrOi7XKMW2fq6s8t027FQndRGpWCICl6x7OSpftfzPpQzqPtQoGi/k0UdY3JGpzMstxyUoEbiB1/HENn8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qS7lKC8+nAKTOzmvykteGH82twYM3A0VLgQU3Qx1ajuXcJusu
	isB31OVaSpiZtG+quAOseKsrgkI9FQy39AXNRGWqgLS0pXmQg2n6URlZOLjKcAYpSdM1Wpm9H3P
	/brtuKzf0FJX1zsqRvCiigdINNGYPwykW4L6CjkdChUh3FzL9dbaZ0TWhI0Q=
X-Gm-Gg: AYBFou2KxP2f53HxGlCtZ/F6c3kPkD+JoDDUiPmL4p+Q6t9UX0duP2Z7EK1jHNt4FXm
	1d5Y5I6VI1FnqzJLWLMbogyLrctT/wVxTy1emuzX5aVFbM4Z3Tigfg539gqEOC+FKX2oXa7Or/l
	2PixmbeZFwfwgQ/R48sjbNkq+SLt01IsCrTUw5KFXGjZ8pHfQFSPsmCJYL/04GL5ew74SzUu8uE
	yL9y1HUzQt1OIqMXDgla2nzH8VfnT3hnWl8T0ff2kHDxrmjTenW3WkgjPh4rnDo7gppRG19V12w
	aJ1m4qa54DWtXKcegxa5KkOpbd8R1frvfmpvfVHrBugMZfYuJYLC3wVxLYhrXLWvepIPQAU4arM
	e04szBMX3lZwWcJ0LSmOOB5ZPHQ0MOsamev/vYF0zL6pBgHEOCJtnMORIsx4tLKv6PgU0fRUuI+
	la3wb55pYjUkR1pvPr
X-Received: by 2002:a05:622a:408d:b0:530:e335:4ef with SMTP id
 d75a77b69052e-55ad7e74d7dmr3502411cf.2.1794539860114; Thu, 12 Nov 2026
 19:17:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112140101.647-1-adrianhuang0701@gmail.com>
 <20261112183727.68afda9533aff699eea12cdd@linux-foundation.org> <CAJuCfpEqQQb1_UkWH50tgbdVz9KZ2anfCGWsvvoYFsnC_KHcjg@mail.gmail.com>
In-Reply-To: <CAJuCfpEqQQb1_UkWH50tgbdVz9KZ2anfCGWsvvoYFsnC_KHcjg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 12 Nov 2026 19:17:26 -0800
X-Gm-Features: AclHuK_2-9zUyKpx_ep8Hdpnolqj806Xeb68SWZdKXrDA-5ZStmcnD2-HIkJzN0
Message-ID: <CAJuCfpH57DNEb5ckB_c4QTWiiHVGSHNhB=S6HFdjvJ6GgGNSnw@mail.gmail.com>
Subject: Re: [PATCH mm-unstable 1/1] fs/proc/task_mmu: advance seq_file
 position on interrupted VMA lookup
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Adrian Huang (Lenovo)" <adrianhuang0701@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, ahuang12@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 7:13=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Thu, Nov 12, 2026 at 6:37=E2=80=AFPM Andrew Morton <akpm@linux-foundat=
ion.org> wrote:
> >
> > On Thu, 12 Nov 2026 22:01:01 +0800 "Adrian Huang (Lenovo)" <adrianhuang=
0701@gmail.com> wrote:
> >
> > > Commit 5631da56c9a8 ("fs/proc/task_mmu: read proc/pid/maps under
> > > per-vma lock") introduced the possibility of returning -EINTR
> > > from proc_get_vma() when the VMA lookup is interrupted.
> >
> > OK, but what's causing the interruption?
> >
> > > When this happens in m_next(), proc_get_vma() returns an error
> > > pointer without updating the position index. Consequently,
> > > seq_read_iter() reports:
> > >
> > >   seq_file: buggy .next function m_next did not update position index
> > >
> > > The above buggy message is reproduced by the following command:
> > >
> > >   # stress-ng --vma 0 -t 60
> >
> > afaict "stress-ng -t" can send SIGALRM, but mmap_read_lock_killable()
> > only responds to fatal signals.
> >
> > So please clarify: exactly what is causing this to happen?
>
> Also I don't think stress-ng --vma 0 -t 60 command reads maps, smaps
> or smaps_rollup files by itself but I might be mistaken. It would be
> nice to get more details on how this gets reproduced.

Just after sending this I found
https://github.com/ColinIanKing/stress-ng/blob/master/stress-vma.c#L536,
so I stand corrected. Still, it would be nice to know how exactly this
issue is reproduced.

>
> >
> >
