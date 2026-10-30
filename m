Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793372065;
	b=JqOd+cwvlDCPe8YxrxUPups+Vul7zeIq9aprHJbvLMRYC7EhvqE26ExDqOpjR3zY8U4C
	 3PivWg1OUV8kB///tumn/+pEi/i9MAQixam2NNg6Qo5GGL6lG7p75LODDQLIkqO2wJ9yG
	 Xa5hDystvONPvJs9xwpVwbziQx8WVx1YFRKImvh1L7bcn1CkYIyujUrYDaS/nxliwVOOo
	 uTxjTqEBGzkBF0emQL0tUk//oLoSTDFIAGMGN0d79tkAImyTugN1H5m9Pl26FopZPIPTi
	 6WfnhxD91ri7CSdB1bc0BTPJ9YLmaAVf+9TNSg3Y8pR280chz8i7UcJVjfmwHmVvw+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jMsUz0CmedXWqrdh2TheB4BjYFtAJcIsl6CPDLvVdyA=;
	b=MTDupEX4ktY35CSzVb+HMHsjqM6aB1pq5wJOBlO0dkIaVdUwfCJyrlAoVnSS79ep6hxD
	 CtTRut3xFnY91RcG619xbSalfXNW5hdnbrb63dePLMLosJANZnba/I7TPcKY37JObvcgS
	 0bNtTOIv/v8NV4SjYAr+Tnpgh8id2q2NZZn7+xmJylzg6veAaXPfetraAUiyHKcQjjO8e
	 /eZiiIAZuN4T9pGn6BziqZNBfQofVK6rdESUUytAxYhGptVb+HomofB8pO6t6+LuLsobF
	 KYZDiFbTxGTVLQbvjtDekrUvrlHmUsr6mJeEzpJs3bDAmjQBgaAjvUlK+gLNTFzMQyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=llSAjB83;
	arc=fail smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B506B606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B506B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=llSAjB83
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bfc2ae6e9dso643689e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:54:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793372063; cv=none;
        d=google.com; s=arc-20260327;
        b=Vh5AfiYIhXN3wAOFL9QHbSeOkUOxOKnJckreuEemQzpF3YXSjKBtxjirTJwRMSEYdI
         0vhn9pyYfLCFBixBZ83j6/q3Ms+oo5nQec6aACiF0kQhk7k1DuvPYvLQtZ2Wr1tUgSWx
         oKcJPoEwtJCy0fJ8cCefLsataV3HQjul4UExNdyJFj1RQfNSuDe/mJ7TZyTF5BPxAzuB
         l6RJOzBapVjlTXeTw7C1GyB2XU9g2rFIGQuNBZ0iUlQ+Kl+5mAlK0FK3k1bU8wWA6QYX
         gW0agIqOZN/DOt9ScnlApM5f5MBq6CBxvjqZIaJij0q8USH5NsjKeJz5kJsaqUgBVBem
         LTsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jMsUz0CmedXWqrdh2TheB4BjYFtAJcIsl6CPDLvVdyA=;
        fh=WDQN2y89SD8gBKha721/5r6md6feWCUBRCywmrVa1TQ=;
        b=OxRIkxewEjquaVCKHKpNiwt1yHX61qBKHWPCRg7xA89W738EhO30IsSjCx8Vm/Mthj
         lVjIsxtOs8jFCKQ86k+B5bwb8mhLyCSUxWpZbVUx9BTbYll8LQzmAk0usVBk1WBGSsm3
         3WvZQQL2H2ths6DIrHG/gAEanSHYtaAcTLmMJXpFooL412mqUNO25DsoAVcaLgHuauHQ
         23lBfbO/ilrBASUJVMoCboNzqlmm2hDHY9DL8v473AJXV1pJwdPpLm9xdTdVm8bBnarM
         z46gBNFx3au6wd5fUH2bCiOgyugsyAWQDcwoVVvebMnLSS9pKOWvjzeOqoKMaFHvnIaf
         1cEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1793372063; x=1793976863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jMsUz0CmedXWqrdh2TheB4BjYFtAJcIsl6CPDLvVdyA=;
        b=llSAjB8353GhiWJmW3lo0k47FpkVKUdOxkuIOEucyL686RRVtqlcVe+w6TaigBAncs
         RuBiEjJ5RrmdukHl9fbglfLqkd2Dg+gjSdyMfUNinYhI7lTg3SjhAWHlmdLd+D8lytl0
         M1Rn3HwniQdcK7QDZQC67l3ULytWecMDkddi/H2Av5rBgVEioLJ5lIUl6VdFcNi8F8Di
         ZlrBvbaHyHBGra4g6QxFHMA0e8cVrMPmfnPiJB8gTSMYPlzsJT2zqxQo9dExYOy/fmGw
         DBqyFbwKfTBpdLVueOJy00qtFaDWF4VRQSHd1hnmI3eyBv0v9uPa3/SYP6vznJSqPqAm
         FduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372063; x=1793976863;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jMsUz0CmedXWqrdh2TheB4BjYFtAJcIsl6CPDLvVdyA=;
        b=HN3ur7KhExR/CYvLIBrhBVg1hB/f0hrs7CZrIMexLWnejo2CYLGG4LV/+ohXKm7jRz
         POcrXh8Qf4A+xSjK0xKeeYgkl7wkr3PHDxKMV3B1/4EXxmBqCpIRH70yJUB9xY7erHL5
         3eOruvkvcwF0jVAzAPcTSC5I246J/b9g084ika2dBf2C4G3TEZBB+2IAwTkKzF5mImdO
         julAuIN0ySFlKehTr/W77FacJ0gLXAxII8DEQ3QhngwqH0yhZ22SB/8LCsodS/Hxakc0
         aqNGTMOXNURU8ooUP5V3mgRoQP8/jLdCz6MmfxGo+N/D/Zqlw/NLpnm2PF4nsU2adr04
         memA==
X-Forwarded-Encrypted: i=1; AKwUvBzkwbDz0kiDjPvOpQ7dVLRitIsJR4nQPRZbO2wE3I4ThbA2AVPi4COT3E7JDCeXZiWPdxuTmACvUZbZbm0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYQ3UO1bpX/bgI3YUbHDpsObn6Ld9NW656ftcqCBeiItWDp5m+
	uz5OgjM3slEeGLKXd3Paifxlz6TmfEJEtSaJkTSZbHkbhYZzXzKZD7yAdYmNcF1bouVAFevY4rV
	50A3V76KqPZgKN59DAlsEPZD9vaeRaV+I9mD1N6ih
X-Gm-Gg: AYBFou09TUMauIAiIZdrbn1jf7ZzIbtzMmv/Bf3bkjQsSbhSWjqtfT6iGnxbg8jshgh
	/I0ysVyJpwBeIah0YvCqbO0ARn9iQ+wx6qKlWiK5UljHbgn9OQGEVgXa1d3GWgawuiXT5CjrtO3
	8uveAmRgy5/Sp40pXaN5fIkMkLd80ZyjDHpTx9A/jqYz3L/ddddPDlvO6rfCaiB88XE4nNGSxdx
	nNI/ydwR4QQf46pyJQGjaf/bhdH5dKyjGw6pZ42H4ECSDAfV+Gss0EIothQltU6ZMD8gML6sQDl
	lRWUFRKZ0fn8JCMdVKwWpPGBbWJsZA/fcBjgzEw8fGbYRO1UkX/mHjbcIGQ7T0FCIifkDhmg5Dk
	pYcEM4h26dAZsig4VPrGAsLgf2ridmgVgzA==
X-Received: by 2002:a05:6512:3402:b0:5bb:7b2a:5b2d with SMTP id
 2adb3069b0e04-5bfd9566d37mr824353e87.35.1793372062806; Fri, 30 Oct 2026
 07:54:22 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026220546.3114241-1-skhawaja@google.com> <CALCETrXNEWQNPjtuHnTfVFOafeJ7APXq288Cq16Q5adDNYx9+A@mail.gmail.com>
 <auEksxfAi9lHFXmT@google.com> <CALCETrXDY2e8x2kdr-FQvFLs-Y7FwNozXGDvqqM6yvVA7QLV3g@mail.gmail.com>
 <auPKfqh_YjRU9Ui3@google.com> <CALCETrUEyfvaEGxMHo=c0ia3CDgSxg-YW0_=Z7T31Ou+pvicuQ@mail.gmail.com>
 <CALCETrVpEP=HxVqdSP_AgA=U7ignwAgjz5Vi9+Z9dZsX5DXeLw@mail.gmail.com> <20261030121259.GC3889730@ziepe.ca>
In-Reply-To: <20261030121259.GC3889730@ziepe.ca>
From: Andy Lutomirski <luto@amacapital.net>
Date: Fri, 30 Oct 2026 07:54:08 -0700
X-Gm-Features: AclHuK8DrMlKsyKpQjiDV0_C05DMTWGTaa3ilPqU973TM9OhhHNjeL5jGLxSymM
Message-ID: <CALCETrW6RUgTGFuqx+cxV0c+Oq4d-P5C8AQ2ja0ESMP_8JGpxg@mail.gmail.com>
Subject: Re: [PATCH 0/2] mm/memfd: add F_SEAL_PUNCH_HOLE
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Samiullah Khawaja <skhawaja@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Jeff Layton <jlayton@kernel.org>, Chuck Lever <cel@kernel.org>, 
	Alexander Aring <alex.aring@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Jeff Xu <jeffxu@google.com>, David Matlack <dmatlack@google.com>, 
	Pasha Tatashin <tatashin@google.com>, linux-mm@kvack.org, linux-api@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 5:13=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Thu, Oct 29, 2026 at 07:11:25PM -0700, Andy Lutomirski wrote:
>
> > I can't shake the feeling that the problem here isn't so much that KHO
> > + iommofd doesn't like this but that the behavior in question is
> > nonsensical.
>
> It has been this way for ages, like David says if userspace shoot
> itself in the foot it should not be surprised by this illogical
> behavior..
>

I dunno, a couple weeks ago I tracked down a 20+-year-old bug, and now
it's fixed :)

> You can get the same nonsenscial thing with just mmap too, you don't
> even need a memfd.

I feel like there are multiple levels of footgun here.

mmap anonymous (or MAP_PRIVATE), pin the pages, munmap: okay, mmap
creates unnamed private memory, and munmapping is maybe like unlinking
a file -- if someone else is still accessing it, it's still there.  In
fact, you can mmap, fork, unmap, then mmap in the same location, and
your child process still sees the original memory.  It's not clear to
me that anything is wrong.

mmap anonymous, pin, MADV_DONTNEED: okay, this one is starting to be a
small footgun.  But at least it's pointed at *your own feet* (unless
you've forked, which in which case maybe it's pointed at a related
process' feet).  I would still argue that the kernel could notice that
it's false that I "DON'T NEED" the memory and fail or ignore the
request.  And the kernel's pages are still anonymous.

mmap a named file or memfd, pin, truncate or punch hole: who says the
footgun is even pointed at my own feet?  If I mmap a named file,
SCM_RIGHTS it to you, and you mmap it too, and then I punch a hole,
the rmap machinery had better invalidate your mapping along with mine
(and get the TLB flush right!), and it would be an unambiguous and
severe bug if this didn't happen correctly.  After all, what you have
done is to assign a *logical range* within the file an address in your
address space, and nothing I do should change that fact (except,
sadly, truncate, which can give you a SIGBUS, but your vma still
logically refers to the file).

So why is the kernel exempt from keeping its own mappings coherent the
way it keeps user mappings coherent?

What if that memfd (or tmpfs file or whatever) is shared between
multiple processes that don't trust each other?  One of them can cause
it to become incoherent from the perspective of the other one's use of
kernel APIs.



P.S. You can access the offending APIs from a VM guest using balloon
in typical implementations.  If the host userspace does not strictly
enforce that the guest doesn't balloon memory that is not ordinary
host memory *and that is absolutely not in use for any sort of
kernel-side pinned-folio IO*, then the guest may be able to cause the
host kernel's or hardware's view of its memory to become incoherent.
Heck, host userspace could literally use a memfd to share memory
between the guest and a separate host process that implements a
device.

P.P.S. It's possible for there to be a legitimate security boundary
between user or guest code and a future version of *the same*
userspace or guest, via DRTM.  Someone should build a guest that sets
up some form of host-kernel-pinned-folio IO (IOMMU or simply a
host-side emulated device that works this way), then
DONTNEED/REMOVE/hole-punch the memory, then do the DRTM dance and
attest to its state.

--Andy


--=20
Andy Lutomirski
AMA Capital Management, LLC
