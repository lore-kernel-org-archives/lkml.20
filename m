Received: from mail-oo2-f37.google.com (mail-oo2-f37.google.com [74.125.231.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D244F6462
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.165
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790014583; cv=pass; b=Maq8KlfdvWsuAzpoaM2SDaNPNipZWp3Z+OwPKZniT8rUNbLtNZBDi2i3t0Cw9N0A3NWSjr5e4KJeOF+xn/p+rA0WNH1ciDXA2BXx1UhXW63QESdPKfzYAad4P459GhMWAr6ezqH8pACmgPdcLQ9INssRKoikIpjzInyr1NaG+cw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790014583; c=relaxed/simple;
	bh=kQtPYSl7bHhTOTgCW2i8m6SCW7df2sqm6ruQrNx24Ow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T0bZg91zW4jADzp7DTrtsDNAulVd4c7i3Dag7zo6BfsKHkzCcC1+9iRJKtTG+KHcgYc7qvwP59l711sYoy379WY1OX+nOy56ityxo45Ia/I+Xnf0RtFtXXxJ8zPeoOoja45Aa5E7wIWZsFvCst4UNF+D6+OHTXtS1NQzzF20uzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMzJlNC1; arc=pass smtp.client-ip=74.125.231.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMzJlNC1"
Received: by mail-oo2-f37.google.com with SMTP id 006d021491bc7-6b1ae721872so1497059eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:16:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790014581; cv=none;
        d=google.com; s=arc-20260327;
        b=LJ3HogHjH7hILjcvVNQR7YK2cwWjDYlh0V8BhiX2WlcQkM8Pn2JpZXNfJtz5B4uP+K
         tjnXjI8RdzMfw1KMWkDdN4hWiQbqd/bZaEOW4JIhjBbIXFFO/beCjn7/6wx8E+FgYEx4
         pOuI/Ng97gKce3kC0fYWXakntvwIjacKePGh9vyOMfR/X5/PYs+qgu9ohepEeUhCx4Ow
         1qzM658skYRGTt/ZcliqgYHdPwvvLmA1t2VXYuoR/fv2/hTehU/VlBVT2O7/3Dyb+1mD
         CcYh2hixclWwreVQIFrIPcsbB21SyZ9w67KXY0+S5OZ+d2Ov6VhmtcvnBAGjJhwFj9PZ
         prcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XoAohc/oZmCo8GVd+NHkqD6t+jhnykYm3ciXI8clm2k=;
        fh=2ngall6WUWRglsi0x9f2Bk4uXBpcbrdEq5HYdAssAo8=;
        b=j5ZUE5dhWnsL75TVRyiZSJ5v+MEUir0oNsQdrmU7oJHIJ3Q3SZmFDRD3cFrhEQHsGs
         QxvQzryXvlvDdJTm/4JoFMgsEMwAu+GQNgWDCMcInXrEHvOSRmc3xNFNchbfvFrGnFgi
         75r22v9Te4ULV2Jr8r04Y0g3gLmmaqoP1AdaGSEF5OhJ+jcwJaz/C2Qzw+yyARNjnwgR
         10t+ehjdlE8VfZhgrXKHB2m3I503VIL8sjHCNhOm6DSHRCH45Zs7hiEB7hYgxN4Sgmkf
         P+BAckwzrJnTTxWvTba89kBJYqEE62u2hrbXEXRMgMt2bd/+gzFOijwmXAHCDqb7R/Sp
         RwMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790014581; x=1790619381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XoAohc/oZmCo8GVd+NHkqD6t+jhnykYm3ciXI8clm2k=;
        b=nMzJlNC1W/OHnuKPpOydg/DkE45TFP0lpboOFRVudPbjjQ7j+lgtGX8R/oyKagAAyb
         wfNI6ZiG3zgkexrSyktv7BlJdfVZS89m3hWLf1CD7z2ICzTU3qG7FJxrBEvxZhAWbmMl
         FLviO6H4YlLmF2AcSCetGCYsv85ZC1iypT+jSl3CO9yP0ry0+ZUYwds3AlC/txwcyE48
         1usfkV6LCi2fVjB6ToUw6+F3purX0RSi/K3cAFBAYNBWxZabSg5rVBt0Dd/uofY1PSRj
         5K0W/qHPHnCFBgLqSvTCi4iJdzZ2f1vo5auWbHg70n5+9pVwV9VIIEvCSESN2m9tGi7B
         yWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790014581; x=1790619381;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoAohc/oZmCo8GVd+NHkqD6t+jhnykYm3ciXI8clm2k=;
        b=Z2GC/HV7Q6DKZfCQEbp/+D5o9pydB10vggeTgBeG1gRMnhEtB7KmTI/7NVUAWIyXZL
         o6j4Rll7E6iB3elpffgr2KY5kCnB5abOJcwIwifML5+2LeP0OvV5XdNHou7ETlCt6JZB
         5/H3KXHZIgI+SrQiE2Dl4KwhEsvFbvPFGqjHO3Ju06+qWMmMGub11AKhlnyQx462haDl
         DYrNfkrSaLR3BflGwiG46umE30pq1yyFtR2M+I8jSKbPAObxGCCzNuoyVheTiRjvrpZY
         Xk4Wq6AILJmgQfMG5954RMRf/Htt/p9lybgVA2CrWdtHcpWV1DHyoFOmTL//pplfbESD
         XBcw==
X-Forwarded-Encrypted: i=1; AKwUvByTZ2qLTJmUYoAFTy4SL9QuVGS5XSsN4FkuBe6po/6RYZMuRwHfZjPkjM76ciP+LUWWQOeBJhpDS8oEqDM=@vger.kernel.org
X-Gm-Message-State: AFuF++mfJVsJ02NzmXSRPrYnmUn0F/MqYD1G1VHuuVlqZDF2vcT9Uh1k
	RnBiXjjW5WBvQcawTPY9kf8xooANaesWCB/rYQm53JM0GIuei2hv8ehPdCgGMNhYb1aOS+O8L2L
	HRAsrQoow95qHmhQD2UK0JYjYU3veIj4=
X-Gm-Gg: AYBFou2HgkYiaJMOTPUNuVmviV/kQRK6QWtNxGJB9SybnBN22l1A2EeBsY8NjbipPcY
	G0NOupQ8VaAO9l6PbgacGG59ev12XEZZFnOR97Shd6JAouowI41kBKcYfDkshI6rl+F1fnxcanO
	SgVJ9CIcuuaJZXq+oHsjHbZfh3P60y6rzMvcp9usMJLnLfkFEmgX+jMBE6U+qOht4oqIp1830J6
	0zVSCCfJHKLr7DB63GR51aVrDyMsBZKaFSQ2nh+ULJxSSt07bAGAm+T4p7JVkEWKn2G1v0oalte
	boLhq+MMAqTKG9Z7N+7wVcxOoptq81O5/YRmIDWZUpAJbYSEyLKwo9NfId+yuVF12OB20Wga3A4
	ZcB3H4noEaM5ZbeOJgBYxR2XhXXSr96UM4kHWNt/M
X-Received: by 2002:a4a:ee17:0:b0:6c3:b78c:8e21 with SMTP id
 006d021491bc7-6ca9af40f37mr10327142eaf.21.1790014576770; Mon, 21 Sep 2026
 11:16:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787770110.git.jbingham@gmail.com> <e7ab836149f814b04017905dca2e07a4c94078db.1787770110.git.jbingham@gmail.com>
 <aq1GsO6dkS747OEb@infradead.org> <CAMyBmMA5bOaGK0TfPMGpmfR6oD0k9EdS4_R3RoJ7d5QTjm0bqg@mail.gmail.com>
 <arDTnjK84EGsIeYE@infradead.org>
In-Reply-To: <arDTnjK84EGsIeYE@infradead.org>
From: Jeremy Bingham <jbingham@gmail.com>
Date: Mon, 21 Sep 2026 11:16:05 -0700
X-Gm-Features: AcwNN1VhcUYnA_BgycWs1X0gtTYnMaQMUuvmZXTv_tc95zD8EYbwB3pOSB_oS8U
Message-ID: <CAMyBmMCAGFR5nS=SXA7rMRxxnnbyTAVnych=_1sxo7vGVugrWQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] minix: add iomap functions and definitions
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	brauner@kernel.org, jkoolstra@xs4all.nl, jack@suse.cz, djwong@kernel.org, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 11:50=E2=80=AFPM Christoph Hellwig <hch@infradead.o=
rg> wrote:
>
> On Sat, Sep 19, 2026 at 10:51:32AM -0700, Jeremy Bingham wrote:
> > On Fri, Sep 18, 2026 at 7:12=E2=80=AFAM Christoph Hellwig <hch@infradea=
d.org> wrote:
> > >
> > > On Wed, Aug 26, 2026 at 02:41:56PM -0700, Jeremy Bingham wrote:
> > > > This patch also wires iomap.c into itree_v1.c and itree_v2.c, simil=
arly
> > > > to how itree_common.c is included in those files, and exports versi=
on
> > > > specific versions of minix_iomap_begin and iomap_ops.
> > >
> > > Can we keep the iomap code out of this double build mess?  Just defin=
e
> > > some low-level helper in it, but keep everything else in an only
> > > once build iomap.c
> >
> > OK. I went back and forth a bunch on how to best do this, because it's =
*such* a mess.
>
> Agreed.
>
> > I had a lot of reservations about the way I had done it, but
> > it's so all around
> > messy I ended up there. When I refactor it I'll either move that functi=
on to
> > itree_common.c or craft a way to get that depth information out.
>
> It might be worthwhile to kill this mess off first.  AFAICS it was
> written at a time when branch predictors where much worse than
> today.  So having a branch for te two cases much lower down in the code
> should be just fine with modern CPUs.

As it happens, back on July 6th I submitted an RFC patch to do this
very thing. It dropped off the radar, though, and I didn't push it. It
may need updating to match the very very latest kernel sources and
strip out the extra RFC-related comments, but the lore link is at
https://lore.kernel.org/linux-fsdevel/cover.1783324260.git.jbingham@gmail.c=
om/T/#u.
If the general concept is good, I'll clean it up and send it through
again.

-j
