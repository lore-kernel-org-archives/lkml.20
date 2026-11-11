Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794366511;
	b=plAcHXyDUUhb3CSKy3wBIkKlibh6N2pS0cA0cjmR70QFlGhg5rCOeuDlIFhwMnTwxJqc
	 FDT2NnwDrJUIXZhEYnKUV+KVwpsQ0ML/3siKp0Pu6xvMfZGL+FjMcde6k858pXpMH7NdZ
	 42DxEZNvtzNjzFiETbJgWCo7k2Hhgs/JE+usdC4UZkeJRO3kch7DtJTLGn2YeWz7vYDuH
	 7/3pqKaIDa3AJMCuawuNhTehE5ABtHWRQNGlnoVrBmUIdp6UbT2MRsA9rt2KRTeH7CHuh
	 8dESUxysD77jdzb4akzEN458B9dq87q/5PBkb/uEWisqwJCMEKzdAAe0rX9oiH9uZAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UWUQRFbmRLGQnDyBGsNebPidDTP9HqGva0/1QMumkOA=;
	b=XjN2BCMgNOo/1Ci1dz43DIRDFREj7XI3hbJbbj3II/iBuRwqbdD/OOKVW9RbCHcE9BN6
	 oYq/V8UrmUO765ATTfr+XKExWBLb/KMwdYsIgFjn4MZFczMZwlskn2y8X0pkZRw5Qj1YO
	 t9PAT2beevroiuGX4UoRro16a5UKz/vPqPJ8zpiiRX5HINdXWYvaACfb9F0ey7pZWjNr2
	 3K0YDtPEtwOVfeu2yPGVWq6FJKL6nnlJ2L53m7UK7x389R7/4OYc2PRlqZKQF880aJ4qx
	 KJLjamVEucDB3LFerQcGNpTwCSihhDDeP8jCXUDiwMW3i6dw7ISl64xXrTRPn7E677w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CAsOp4/1";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C26606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1C26606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CAsOp4/1
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so16235695e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:08:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794366509; cv=none;
        d=google.com; s=arc-20260327;
        b=RcA9nE3gdcluh4bdLW/KxNdDWY/ycJ0HTVf67eV1pYGrOs7O0q/O7ENwPvq2/U6E6A
         J+qXBwHmnJ5kJRK7FmyCaoiOfdmeWgEEKM9ZGHLA23Ex8O1mjKdqodnOpoTp5Oe+De7f
         ZT3KVn7djm1+lS3QDmcJgwzZyS6z+ZEWlYFgjvS/s17Z9uMqwnU+YnejuE5fszKX44a1
         iiVgdWUmdjRzaf/bgG/h1dTJOO7VICfCfSllNZUT/eokwTfg/H+DaiSn1/G8e5ogK9Uc
         vRCfIhuIxkUc9rwW1x6dEpJTX5zF+G20JG7bAtpVcWbju8OiZynWBn8kjWjCZ1+53scD
         NHfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UWUQRFbmRLGQnDyBGsNebPidDTP9HqGva0/1QMumkOA=;
        fh=jr3wva3NHYVV05pKbO5yj8ICEdadxAdQZ9GyJiU0P/c=;
        b=JC+jatvIGyL7Nhfgrur6MXIg6IlHMtdc2WZuLsiegRiuH/9t4VHMTXAypJqrZORs+4
         Bxipd/zkVu8tXGmzZJvuojkUyrtltYxt9f/nSb88BeXPxHml9q+mXZfsdinvwoZ169g1
         mBSLWGdYCA5eEd+S3G49EFzVA3E9bp5Hp13BOl02UXB0qboWI98blHcPb9/4G5oGPCh4
         PgxHwZ79I6l5UkcRDDKFtPmCWem+OT6GHUm9mzhTtjCk+Ytb0tLKmRS45e1OG5T5d0aW
         fzKR4MRWQKzT1XBO0PKv4jtJ7eEa0ImI341Em+6R696TEw+41nS/mxgqlnDlKAXKG7uI
         e9uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794366509; x=1794971309; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWUQRFbmRLGQnDyBGsNebPidDTP9HqGva0/1QMumkOA=;
        b=CAsOp4/1HRHqdn+CupXBmBds6mtUnozoeGdbz5q+T9aBC+I/F8WbCHsO7qxTY7vRBq
         cStPnMdf2E3a5j8x/3D/SFOTMyWoh9OwxOYf2geKDiwiAha07wPGQCL8bEHOm0HbEub/
         Ct7kyVsWjr1zk2swRNzsI1O/JrlZRE5sDXYF+Km+AlWJ10keZ4mXV1MGMFwNi7W1MsWz
         NLo6FW47Lvh5dhXBK+PE6heTPl18gS3XtpPp2z8myVVIoh3TQtvYm/gZoMdww9Ytlq3i
         D5m5CBltUyhqOknLfxKoX+JIfcl8SlXM09WA71m9ITlpVu7MouXGtlRKyt0Jw4AutniB
         Woww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794366509; x=1794971309;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UWUQRFbmRLGQnDyBGsNebPidDTP9HqGva0/1QMumkOA=;
        b=fDbzh9r0zO3T6gv5cYQJYYWsWlthmDLli5imYx/+EcC6A5GksUQC3KHK2y7goI4dwn
         pfc8R39dozcBkbwOSQ2wBK5f8TY1Si/z85ZO+wqroL8McjPqh/t/9mLJ3cGnyr0V3/+P
         ToxRSLH4X8WKI0EE9nfh/zfpqZZXRV9uS1ET8u/KgWL9phiox5Wl+fe3+7zKLSs7n7wX
         60Ui/8N82bLyDxcnmkiNkX/CVzJgn7K++iLERFBGu/a+0bwTEXDRRMfemzpuYQoMH01J
         NvookayMQBvDOQM/iqg1HeK3FrRwcClJdatEwM58nYDR3MDyrgZ5EaiC1BnOPyHyLOam
         1rUg==
X-Forwarded-Encrypted: i=1; AL+hErFiya4YEzHsIUG5qYtSSMArO/Ar+e92g/Prr9qN1HT9XEFuWeOuvFoSXZBolcj7xRIcdND8+YY3HCKkd8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VKUsDnDTbtx53ZhKPtqXUtj+bF7fgOqaFkrsuOAqc3mWl8Bo8
	T263tzxj6zxi0rro4YbPPGpyUHEdBQcfJN81cjtCh0qX2ScurmpXkhL5cyD+Mb2s5MeLcMWqE0G
	+UzsaagBGkT2H63KfBD02PTV/0hHn2/Q=
X-Gm-Gg: AYBFou3i+PGcVKkOiBHjEGuGW+ZyydQTu6xBNBJiK36qHpGmrOKeMbbT+zRLeOs7JIg
	1jj3cmN6IG6Vem18Fp4OoQ3XWqBHOWdABqdC/2mVt+H7SvWpDOPySQYatfFCoP7UVMsbgwfXhAZ
	uONbf6DID675K42BAcUqy+Jf7OaP+F2x0M2LMDk7tlYhzMPmW6JUuU4o0rBuNkAmqagxOG6iIJX
	4JvEH2lSgE/96Rq3VrNzsEyWgsXgSm0LYw/CHG44R/E4PpqPNhW71yAR3FjzwyxNq2/v8H+1rye
	FnL7ggf2UL9mc4gOqVRkGPdWFTMur5eb7h6kxcELkT/QFQA2HfHaK7U9ucKpGeYtmw5pPYTaNps
	5vjWzBQTCu15E2+6l2e5KCE3HfZqIaYlWCCvbPA==
X-Received: by 2002:a05:600c:3f06:b0:49e:6581:7baf with SMTP id
 5b1f17b1804b1-4ba0931ef17mr14337115e9.2.1794366508821; Tue, 10 Nov 2026
 19:08:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
 <20261108230842.3a77b9fe2d4bfc2a04b355a5@linux-foundation.org>
 <CAHKocdGWE9OVA5pJh33U-FYnNkUqRS0pzFt=rCwXWzY9w-QXyw@mail.gmail.com>
 <20261109140206.GY9176@e132581.arm.com> <20261109092404.5441d8bf9c4494ed008162fa@linux-foundation.org>
In-Reply-To: <20261109092404.5441d8bf9c4494ed008162fa@linux-foundation.org>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Wed, 11 Nov 2026 11:08:17 +0800
X-Gm-Features: AclHuK-m1Jv5Lpg8e2HNShd2BigzuuDvNRyTpoQSxJNGTZo8P3hgc34a2sG_LX0
Message-ID: <CAHKocdG1pvZfo=fxX9OJZxCOnZt6nBYwtRV7rAxPfdukDy6cCw@mail.gmail.com>
Subject: Re: [PATCH v12 00/10] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Leo Yan <leo.yan@arm.com>, catalin.marinas@arm.com, will@kernel.org, 
	urezki@gmail.com, linux-mm@kvack.org, baohua@kernel.org, dev.jain@arm.com, 
	ryan.roberts@arm.com, anshuman.khandual@arm.com, david@kernel.org, 
	rppt@kernel.org, xueyuan.chen21@gmail.com, chleroy@kernel.org, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, ajd@linux.ibm.com, 
	jiangwen6@xiaomi.com, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 at 01:24, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Mon, 9 Nov 2026 14:02:06 +0000 Leo Yan <leo.yan@arm.com> wrote:
>
> > On Mon, Nov 09, 2026 at 07:07:23PM +0800, Wen Jiang wrote:
> >
> > [...]
> >
> > > > Do we have sufficient ARM review?
> > > >
> > >
> > > Thanks for picking this up.
> > >
> > > On ARM review: Dev reviewed the earlier revision in detail and
> > > his suggestions are folded in. Leo Yan tested the large vmap() path
> > > on TRBE/SPE. We'd welcome more ARM review from Ryan, Catalin
> > > and others.
> >
> > I confirmed that my Tested-by tag remains valid on the latest version.
> > The improvement is consistent with L2D TLB refill reduced from
> > ~16000+ to ~500+ across multiple runs.
>
> Thanks.  I added your t-b to every patch in the mm.git copy of this
> series.
>
>
> AI review found a couple of little things:
>
> : In [07/10], vmap_pages_range_noflush_walk() uses an int nr
> : index, now shared by the high-order mapping path. The previous
> : high-order path used unsigned int i, nr. Beyond INT_MAX base
> : pages the new index overflows and pages[*nr] can go out of
> : bounds. On x86-64/4K that means an allocation above 8 TiB,
> : within the vmalloc VA window but requiring a very large machine.
> : Please carry unsigned long or size_t through the direct walker.
>
> The vmap(8TB) limit is already well known, not sure that we plan to do
> anything about it(?).  But the patchset seems to drop that limit to 4TB
> for higher-order pages, which can't be a good thing.
>

Right. I've posted a fixup for [07/10] in reply to that patch, switching the
index to unsigned long.

> : In [09/10], nr_contig < 2 can be dropped: the loop guarantees
> : at least one page, and vm_shift(..., PAGE_SIZE) returns zero
> : for a single page. I withdraw my earlier NULL-page objection;
> : I could not establish a legitimate producer of that input.
>

The nr_contig < 2 check is redundant, as noted. It's just a cheap
early exit for the single-page case, so I'd lean towards keeping it,

Thanks,
Wen
