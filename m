Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794470678;
	b=cbS2MOCp92MFNXqzyKqeuGwSjqw6ZucIeEYExpEWIFOLeeshbmQ1C0ltak5WngEc2tib
	 +58yXQ8OTCsJlKhB2sBIOUSdS8tuATnkxv2XJslCjHdXvVYl2pCGSvyHsXV+9rNlxrkpB
	 nvadql+Oqg/tkTYFdrSkCifPGQjrlZF+tsw65M08QgbuDKxrfcwMKFv/jiNvVQG46Qmew
	 fDYteKrJspFhM+R9xOD9ZZ/31sy/cOe4YnLMBajVAAUtltJQqZPC6K22aqsn5+xn/FNOP
	 UvDURKpoXfLSS7EaWCjRiyvJscGP79i3bkqL0x1e7PTWL+8Od+YGe4mFAdzBh1hWoJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bZnjmRjaw3mt+xCJw0WA+CLEo0XUahYdWgL+JaOD3TI=;
	b=EI0ZANnDi+UYO/7EqwlIVz61xeRY0QcqVcrWSJPsckLAWgSNUD4PABFGt3XS0cXHRZb5
	 H1l0B7W6ZgUIGWTvRNRw+g6YOI3TQVz8OiAjHWz2YxUl1e7EGAi+1nbUatjybLN8snqYI
	 s0kUy1yBP2yqLJ0k0k+A9v1A5Zhzzk2ccH0IgzbqYFWXX7IyTK13SfxTTWQeO3PG/F6vA
	 SX3aYOWJgxExgVxOlDKMIrzCw1o1AFI6JtdKGxXnUF3OA6CN7BKH0BnbsdLfwB0bxqO3q
	 IWH/fcxa971uMCikLT0/6PoBhAgDZ5pqdCbK98crGsqgUEmFPAZOUzoMbtvlPeJHv/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gn9RirM8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4998A606A337
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4998A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gn9RirM8
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c00b0866b0so40255e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:04:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794470676; cv=none;
        d=google.com; s=arc-20260327;
        b=JFv6bCaPxiB7n/vFvXxBntN3EqhhZEsQA9Yn+pEbzJmr7t7ygDT6qhFMVlSYR/cgh+
         JY+RpjcmWrpIZ8Y6YmrBpROrmvgVq/191/T5Dvg962gi40CL5muzIuM+YT+rdivSkCpc
         dfBH48szz5eKycX9qovAm75iyWLID9JrZ6V+EsBN+whLe0I4kiHY6iZUI4wooJkt+8h9
         GOXVtbROTugfCwLTbfZxTCWVtk4IkNZUGIvzGx2DSex9CsC8z+AitocBMTbe4+LyYpmh
         JL2HOmpMvxWhGFaenDpDzGj4Ks2ed75AuiahMJIU4z1Tzg+o/jIqQ/PK0nnmxBgd63L2
         bwow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bZnjmRjaw3mt+xCJw0WA+CLEo0XUahYdWgL+JaOD3TI=;
        fh=FmnV/EvqZWvUG6PDXmi0PjE2ocm8F3jHZGNV9AHy7Vs=;
        b=hLDgyYhg6Wl+2/pciBnJ/C2gT1Q97oQtRKaiqWIS9Znp/1eSbBQbY5xhyDcRhmmfTK
         8uvOD8Yfz6xZ21ceCqHDRG1aNWKdVB31V3lX5QQnZ9IXfojgVSERMQLP/8lLAvMci2f4
         LVoM3VotUq28A5zrwR0XgSYDQPYoWywii1YicLnvSM+eV6OWwWvHP6feApj/EF4mtBwk
         FY9Z/9m3jig89li0IwQEzh8OWwvq9pKU0hwz/hiIHROTgauNhUICMyG8bgERXVOu/9IV
         dFcYbPlOGveUGXdwQ60pLw171r75wUPuF9uexwF7q6XAr+6NwzwIyKoM4AjbEiHf1Kfq
         4ACw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794470676; x=1795075476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bZnjmRjaw3mt+xCJw0WA+CLEo0XUahYdWgL+JaOD3TI=;
        b=Gn9RirM8U2arTn/6NHNyZyipF0JwIFlJ4Eo2m1fNgqipnAGKtzvhk3sNf9XQeTFBwF
         6LvO9XrAbIEEafglYS65PZ1f9ZWhNP4z1nNJyplYh16EGk0INNYLh4A8Ve5aXDOBU2qm
         xtUcK/XbiOCrEG93rJpcw4OhZjEjJnDpw+tWRAzwZWQg5kDbd7C64h38/fAsn1Bng20B
         Bc5odjDH2WVF5nhK6mHSMWljOysvNE0P7cuSfziP9lnQ1S4tS2GFJCbwId96xHewW4Go
         Si7MrSPmw0gOqQ3Lr9zJyvHnkV+MpZFSqnfGHDU9tHp3fouAF5zbmm/yK+8Dsfs2/A6h
         3JCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470676; x=1795075476;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZnjmRjaw3mt+xCJw0WA+CLEo0XUahYdWgL+JaOD3TI=;
        b=fUbQnoWJVnAbLTT+1jkBd7i0nraTaxpU2JKTf5FgMX4iUr9nY0b0QyzfSuiciEgwVk
         A0KQIo4aHXYLxtj1+daR7Y6c/3odGCpvjlR/yAEeMlTpTYXsnFMwcFZArK79yWjxjn/x
         5BxXcH8yJemUo0/kfcsQc2St6nYbOJudF/Ko+34vK6waZvC9U0AXjfYT/BzYytlGy+pl
         2QbHG42z8JgVcX+cnOMCMd816Orp2VwGEkx2HWl6EAX0YgOktBVwjc30vw0wAgtjwMJh
         5CvJI89x3f2GG8lUkbVRoRsGBZiNNzfyHfEDaPsxhelr4hxWxiEpsl6hA+YlUKgzEETq
         R3dg==
X-Forwarded-Encrypted: i=1; AL+hErHb6cSl/fBuhuedp8v3uajP8EBwtbxB/v5GwKKk2OIaeYbqbRkyami1Z4jajP+ijpjhULFiNl+dp3UZRR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1ICeHkw0wUEF02prbKF5jFFhL57skXBBhPM6ouMKbUp+kH+2i
	+2f10bifSfjQ4QC64MBgtjosbqYnX399vwUSRrw586Y1oF2VvlGxefHCHGXFgzQvvleJn6uVUte
	/yXvfo2K8PJvTutWTMaiz8nd76YxlMfbZ0Mktj86UbA==
X-Gm-Gg: AYBFou3wukGbGdbCFpVYBhA+Nbh2m/jTAAFd20EjmiQSbnbSShOJQ9Ez7saGdK4oJFF
	tCIo6PK1wLOlunXrSp9Mj6pIBVlkY9OugKpNSLqBaydG/6OCagG3ZSYxUeIhxp0eoqzqKjNXiRc
	OerNS3MwIRwyiYbkJjLov0As4udVHTI2PbEGtjTp440B510e7AOafuI6/74zMtXNmsFZv+WnSJL
	F8yWQrpahuxtBGiC6NgRcu5ala34PWJM4pRE23y6uyxWVpZNIZp4bQ6QlpqomF4iXcHybPd3a91
	/8iGTKIHf/uwKmBXSr1h0JNR2NIBTQ1DfjJu4Bv4k6NMkvTgIelwekq8/Cj2yn0708dggIyl3xx
	uYG8eLrzNfar3PTnpubWSh4A8vZbFqkzXrEaagITi+PXOcgcQFKkyBSHgUlf3ODlUz0bxl5A=
X-Received: by 2002:a05:6512:228e:b0:5c0:62:7fc3 with SMTP id
 2adb3069b0e04-5c15d65ace3mr1565808e87.5.1794470676380; Thu, 12 Nov 2026
 00:04:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-sun50i-iommu-prefetch-v1-0-43428e792ef6@gmail.com> <XuGVSzNrS7KQLWfGI0rB-w@gmail.com>
In-Reply-To: <XuGVSzNrS7KQLWfGI0rB-w@gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 00:04:24 -0800
X-Gm-Features: AclHuK-rZwZBd82aiWDx-zqymsN3quC1b31liF4avq8uA1RRs7r6BZowIVjwmt4
Message-ID: <CAEy9hNUi0EmC4BC=TjpahO=jyKXBnAxHz-0C1KYPb7ZYfxDN_A@mail.gmail.com>
Subject: Re: [PATCH 0/2] iommu/sun50i: Don't report TLB prefetch walks as page faults
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jernej,

On Tue, Nov 10, 2026, Jernej Skrabec wrote:
> First off, display engine isn't in merged yet. Second, I don't observe an=
y
> such issues with my wip H616 code.
>
> I think it's best to wait until driver is merged and can be retested and
> merged then, if needed.

Agreed, thanks. In mainline the only H616 IOMMU master today is the video
engine, and the faults I saw came from the display scanning out a
framebuffer through the IOMMU, with the out-of-tree DE33 code I use. I'll
drop this series for now and retest once the display driver is merged.

Out of curiosity: does your WIP code map the framebuffer through the IOMMU?
In the boots where fbcon takes over the display, the fbcon buffer
(1024x768, 3 MiB) is the first IOVA allocation, so it ends right below
the top 1 MiB, which stays unmapped, and the prefetch walk for the page
after it fails.

Best regards,
Arun

On Tue, Nov 10, 2026 at 8:04=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne torek, 10. november 2026 ob 07:05:16 Srednjeevropski standardni =C4=
=8Das je Arun Iyengar via B4 Relay napisal(a):
> > On an H616 with a display scanning out, the IOMMU reports page faults
> > with master -1 at the IOVA right after the end of the framebuffer: once
> > at the first fbcon frame, and then once per frame for a while after
> > each TLB flush, e.g. while a video decoder frees its buffers. They are
> > failed walks of the TLB prefetcher, which the hardware flags with bit 3=
1
> > of the page table interrupt registers and no master bit. Patch 1 stops
> > reporting them. Patch 2 makes the remaining fault messages say which
> > walk failed and what the interrupt register held.
> >
> > Tested on an Orange Pi Zero2 (H616) with HDMI forced on at 1024x768 and
> > three 4K H.264 decodes through cedrus, on 7.3 kernels with and without
> > the patches:
> > - without: 214 "Page fault ... (master -1, dir rd)" lines;
> > - with: none, no "Page fault" line at all, and no decode errors or
> >   timeouts.
> > Since the patched kernel prints every fault that is not a masterless
> > prefetch walk, this also shows that the hardware sets bit 31 for these
> > walks.
>
> First off, display engine isn't in merged yet. Second, I don't observe an=
y
> such issues with my wip H616 code.
>
> I think it's best to wait until driver is merged and can be retested and
> merged then, if needed.
>
> Best regards,
> Jernej
>
> >
> > These patches were developed with Claude (Anthropic) as a coding
> > assistant. It investigated the problem and wrote the code and the commi=
t
> > messages; I reviewed them, and they were tested on an Orange Pi Zero2
> > (H616) as described above.
> >
> > ---
> > Arun Iyengar (2):
> >       iommu/sun50i: Don't report TLB prefetches of unmapped pages as fa=
ults
> >       iommu/sun50i: Print the page table level and status of a fault
> >
> >  drivers/iommu/sun50i-iommu.c | 50 ++++++++++++++++++++++++++++++++++--=
--------
> >  1 file changed, 39 insertions(+), 11 deletions(-)
> > ---
> > base-commit: 2cf4be57b301ed2d7af82e70cff5dfd96894d8de
> > change-id: 20261110-sun50i-iommu-prefetch-85cc9ecff559
> >
> > Best regards,
> > --
> > Arun Iyengar <aiyengar1990@gmail.com>
> >
> >
> >
>
>
>
>
