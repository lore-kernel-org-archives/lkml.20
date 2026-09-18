Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E225F332EBD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693949; cv=pass; b=XP5EZYBZc/RvDw0WQ4vXMiX27jDwpmZp3vNJiCXHfcDAry247Aj65MqFPOGAq4C3TTWhxLZXMbVupkycdtAWGPM+Jh0vx+abhoZcxsOkrECN6Uj0bsCnqR8cC+4OusQTFNoDGu2YVCwg308iB6IdB4wWtpY0DtqqaNXLOoi8ZTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693949; c=relaxed/simple;
	bh=59DjG7Ba/Synu3HWYr+dx4VKBXTxHzy5pOOnrA3rtp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a8cPF6VS3HZq9988J67Mcpsq8kkaYMkio9m4NMNUZHQImK5K1I7YJarFvxZ6hiKKoOYYzqmzGNm12f7nzzCpt6TSfZGEjWPdFdK8bvZBOivG7jMG1ar4g+EbOjahikuwKQ5rfhvWs/A+ek0E7EGdbXIEwS/LJnvk+N35HGThBn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lVLqegIL; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lVLqegIL"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-530f6bcc301so73151cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:12:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789693945; cv=none;
        d=google.com; s=arc-20260327;
        b=rAPyaH7s+FckVv1tIDRxBZ5brJuyRzIDePG7lLSgiaG47hUw0euD1UexhmnT5QEN1z
         mX2ZeQOejPhRc/sJmoIkXN+u6VMdh5/xy4GgOg4VERj9hz5m0GYmU8MERlFXQflBFVRz
         /3rJbOF4xaeL77GcFJAUtR1QQ+4kf8Xskq4Hn/MXUeUBNEpwwtywmuX0T5Uvf+ntP+wi
         DRNRUebI8OGSLKbH2Ft/x4PO905/AAxXNZk2soOgkB0TwrS6LUy6oe0BVMLXsYn+rkuT
         nAdm9kDwBvK5dm55NNpGe/8Rir4kCENiHzbCaER01uGMqxgcQOs8hHdQ+gjXQRKSw94i
         Lkig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8CaD0rfqQizy2B+GSoa1ONFRM1MKoZPF6ZVzgGYvBiY=;
        fh=eM1WfoHMMPKDHgHWAZk84C7/tXac4HOF8n0EHOyi6jA=;
        b=DVU8UuHkt2k/7IXY9FHLdk9wHoGrqYbruknWJ6S8sxg7heEpgISGk07RpQVxTYNflN
         cKnhDINvBzErdAJsZ2jEBdektZdtRpdVBNJbroOo30s1gwAyDAaTzLVOhchuTN+f9wQM
         OSS/rAatnoCVs+DzTFXl3n0tWledTc41hEH8oIhVKesONqNtXW/JJyZpfKii2xXTVlMR
         Nb2iC4SpBinT+qPIFe9rhrGeR9G2geJIVzLK0zbHgetHpNUalAYxKQc9OYn30x7dX5bn
         kAtoVARbHiLCPq9Mp+C+G5Uv/l4R//jywJNtyXxl5D+Xiul/mCDaff6yzUKw9mFNan0p
         QEBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789693945; x=1790298745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8CaD0rfqQizy2B+GSoa1ONFRM1MKoZPF6ZVzgGYvBiY=;
        b=lVLqegILju+hw11l+C/Iw5Shf5jMp6jDg9awwycuxGQggFRdas3PfE/HHiMtyJRFZP
         CCw/Vli1C25Cj/djNEE7RfDNgwLXwhZjSuoFbRW5Jldnv2CoZKrBA29+rh/IdUv94fRK
         OTDKrshjc+i9JXO9cgMtvPcrr/oMg1xmaXweAskfNMT6fsoeLk07WDPpPD/FvjQ/BUux
         Sr8Lm6TLwEcpEv5RQyXUOJdQ4NcofgxIivd5jwSMrhryxIBK7pmTG5vZnSsP9yrHoxNI
         w57pckW4imUEaif/rmWTYQHx2D8fy/pZrQvm69cWtJw5y8+tZo+dz/3OSGVYDwxidf6+
         f72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789693945; x=1790298745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8CaD0rfqQizy2B+GSoa1ONFRM1MKoZPF6ZVzgGYvBiY=;
        b=Tyd2FiJkFcMSZx6I/iCUfyJf4Ybk4nYgbPuPzV2mWMqXRNEaXa5qAPY+9zOWVADo+N
         pecRykIShWzcsfixo5voJ4ozGv0dGPLodBJ9geUGiF9+TvkhjkAJ1Zog28jq9xPg9zWE
         OxURvMitptPMcpVPzazAd5rC5xPZLs2uWQsoLAR3VawbgKc9R8hSfrRanLyTl5tCv+Kq
         UIQSUmmm2iqfvRQAWE/UksH+uzrq1VDKPMvEl3NmbzrugP3oPjW8fezBe/I0iwrWa9fr
         8UMH9g6Q+SoHapQn46c7HQPbzo8317H0oj9bbyAfhZwUUv6dSeUSzDM9L4u7e5snnnKX
         9Hag==
X-Forwarded-Encrypted: i=1; AKwUvBw0GVRUKDgN56YNSi43UST+sgVcmNJ9h3r4gv7ZsylSULPuVzEwHau4KYaIY13FCgwWAskB65d29P5SUko=@vger.kernel.org
X-Gm-Message-State: AFuF++lVn+32HyGT8+1dVCsVVGHCG0cROjhCWFpbooZyBvelYvj2snQD
	x/SW3ALlf5j1WvdF+Sud3/nhrUTaepSyOKJJg8mFeHRNW+GLfZZHPAGEVC+0U4FrWrmfXKmXgkB
	kop9brTLXzEtQeXLtC0j9GoPFoN3cLUy9GYeQDd2f
X-Gm-Gg: AYBFou0KtkuYi5GVz9pjxAF2toqE6KSkH6qFqLRCEYJdBlok6s2xQlHCbplDeqgvSq2
	F2007S9SIFwiM0OQ5MpRCXgsfAV69lMDd40LiWNVnyJbD5IRaQMnL/ztkuHycF/JMhkUMmjI0qe
	VHg3rI0qLc4MmdLfDpFZEO4QGFPct22psfCZbTLTRUT76QNuosn9mJG3vB7/R2hhVhIWg6A5R7J
	YIDkiowp43Dp6p9QFpOrX5hi55D4OiUJY4Yqr5DEKoR09kWY6MFC0sO6bcy88s3raPdK71zYW9Y
	Htaq+B0XO1cASbdzFXZeWrOhvf9Usi7IkfRvd0gtu82CzmuGsWHH1w==
X-Received: by 2002:a05:622a:649:b0:52f:9ed4:8d74 with SMTP id
 d75a77b69052e-5329d7ebce3mr7824921cf.14.1789693944193; Thu, 17 Sep 2026
 18:12:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916075557.121316-1-hao.ge@linux.dev>
In-Reply-To: <20260916075557.121316-1-hao.ge@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 17 Sep 2026 18:12:12 -0700
X-Gm-Features: AcwNN1XNY6AqvHO92sUp1uSClBs9D9k4LNE8UFQHN5IMJcofHqzZ4rP2n34CQxs
Message-ID: <CAJuCfpFSP1oq_ANWqVbhS_3kzdLkK76aGUf6S73_rC++NTL-CQ@mail.gmail.com>
Subject: Re: [PATCH] mm/alloc_tag: account for reserved tag ids in the kernel
 tag check
To: Hao Ge <hao.ge@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:55=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> The tag ids stored in the page flags include two reserved markers.
> Id 0 means the page has no tag and id 1 means the tag was cleared,
> so real tags start at CODETAG_ID_FIRST. The kernel-side check in
> alloc_tag_sec_init() compared kernel_tags.count alone against the
> addressable limit, so with the count at or just under the limit
> the last tag ids wrapped into those markers. Pages allocated
> through them then look the same as untagged pages on free, nothing
> is ever subtracted from the real tag and /proc/allocinfo shows
> that memory as still allocated.
>
> Add the missing CODETAG_ID_FIRST, same as tags_addressable().
>
> Fixes: 4835f747d3ed ("alloc_tag: support for page allocation tag compress=
ion")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hao Ge <hao.ge@linux.dev>

Nice catch!

Acked-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  mm/alloc_tag.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> index cfa0fc84b68f..cf100e7a852f 100644
> --- a/mm/alloc_tag.c
> +++ b/mm/alloc_tag.c
> @@ -629,7 +629,7 @@ void __init alloc_tag_sec_init(void)
>         kernel_tags.count =3D last_codetag - kernel_tags.first_tag;
>
>         /* Check if kernel tags fit into page flags */
> -       if (kernel_tags.count > (1UL << NR_UNUSED_PAGEFLAG_BITS)) {
> +       if (CODETAG_ID_FIRST + kernel_tags.count > (1UL << NR_UNUSED_PAGE=
FLAG_BITS)) {
>                 shutdown_mem_profiling(false); /* allocinfo file does not=
 exist yet */
>                 pr_err("%lu allocation tags cannot be references using %d=
 available page flag bits. Memory allocation profiling is disabled!\n",
>                         kernel_tags.count, NR_UNUSED_PAGEFLAG_BITS);
> --
> 2.25.1
>
