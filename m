Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC6C519E15
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790682897; cv=none; b=XaaBMPcOSkx+6zZnGbkNwQzTZogZhQyLUtOzVVb3LDsMdJ1f1+sIDX6ny+7zJlNoRqdINxpiQPUBwhJjEd4Bx+EFkX5UmlQ7ywJQe7Q/4jbkXjSq4D3iKYC9j3I3Hye+IWepGRrOV26F1bAzBvzCkySd+Sc0qMc91+mKhAD3iwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790682897; c=relaxed/simple;
	bh=c60k/KOAc5O47x6RHXj43yPBfvEPoTV3R0UArwsoSYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HwxE/wBwMtPCc+XWjLc/pqw3Amw8bVgpfmHDaNRqvQRliXDMZ6dctp+hRIZLYAzRqzbBb4hc4KaXEWnIN813hf62TNTZwYTiuyOWFN/cSDxVZbXi9TiwNrM+1bKiV0FfnokNPnyPlNODKY+3+84shyi+gnDaatuw/5WrrrJ4QB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M10x7lp6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M10x7lp6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 027C11F0089B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790682896;
	bh=S0aLT5GhtdTKzc7SEqO4ZKrTggwJ/hbn3y4IvvHxkXI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=M10x7lp6AAYxWfozwpiVSaz6eD3KM81OR+04WgSLlTBECqAaypzptuVVr8yosWEDS
	 ysNwVNr7mvaJ4uRDRfYhP2nJpm+FR8kRBGI5aNKmMyixKmNf2Zx6v2ubfui7W5ggQT
	 0W/7fSnHaTOMKR4aeJOXCuPLtP8nes9Hd+/+OK2D/PVMnaBRjwNVio8/L7h2yt659S
	 +i3oBvdUaAHrRJd6mWR4UNMJj6lqokowPKaOdpfN3C68PiDXt096AudJXDMbogb/Fj
	 IJ0A2+h6fAtUeFHSPCehtQOykZQeTdD+mnX5gGStYdT0X1efVJV7D5iHkn0ONeOKpt
	 CBPnhLvi3Jubg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8f5ae6fa8so2184620e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:54:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByK8tJFqXov3XTEu7tIINQ277owmIeM2rS7slY6rd2MFtpvc4srz+sDxGD1piTsPrM+MGLnq5bcOA8m+qI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhs+inL2V5z7SD5Zsdm5gM4e8Uq4Z1gPLBPAQHdUb4hl11J6sL
	6mTIN8hLSQuiUE8RouV4n0SfYNXpVkfrg1rTwwNQ4pxbpJMFqSvJbw9+Qx8xWD4J51po7ndrgMm
	73ftLtgzxVEKfTznb+KcLl88p68M22Rw=
X-Received: by 2002:a05:6512:3401:b0:5b6:184c:7d99 with SMTP id
 2adb3069b0e04-5b8df093114mr5498654e87.34.1790682894230; Tue, 29 Sep 2026
 04:54:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-hibernation-v2-0-235f69f3ab2a@kernel.org> <20260927150257.c9558f807114f2ce9c6675e0@linux-foundation.org>
In-Reply-To: <20260927150257.c9558f807114f2ce9c6675e0@linux-foundation.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 29 Sep 2026 13:53:10 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jZnGzUOf6xsu-J-4cFOeY8yaLivNNUoBCnR4VJQisqHg@mail.gmail.com>
X-Gm-Features: AclHuK8pzzjTvTId2wLoBf-9vLWfrBr9lHS8pLDp-rGJYqJfLaSLwRr15r-Wayo
Message-ID: <CAJZ5v0jZnGzUOf6xsu-J-4cFOeY8yaLivNNUoBCnR4VJQisqHg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] hibernation: make safe_copy_page more robust and
 remove debug_pagealloc support
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Alexander Potapenko <glider@google.com>, 
	David Hildenbrand <david@kernel.org>, Marco Elver <elver@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, Len Brown <lenb@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 12:02=E2=80=AFAM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Sat, 26 Sep 2026 12:26:29 +0300 "Mike Rapoport (Microsoft)" <rppt@kern=
el.org> wrote:
>
> > When hibernation creates a memory image, it uses set_direct_map() APIs =
to
> > temporarily map pages that are marked as not present in the kernel page
> > tables.
> >
> > Initially, this was intended to support debug_pagealloc along with
> > hibernation on x86.
> >
> > With the increasing desire to use set_direct_map APIs for hardening
> > features and with their inconsistent implementations across architectur=
es,
> > using kernel_page_present() + set_direct_map_valid_noflush() to save
> > non-present pages in the hibernation image is not very safe, to say the
> > least.
> >
> > Worse, some combinations of debug features, such as debug_pagealloc and
> > PAGE_POISON cause a crash during restore.
> >
> > Keeping debug_pagealloc compatible with hibernation requires a complex
> > infrastructure for tracking free unmapped pages with a page flag/page t=
ype,
> > verifying that it is actually a free page that hibernate_map_page() tri=
es
> > to remap and making sure there are no stale or failed page table update=
s.
> > With init_on_{alloc,free} and/or PAGE_POISON on top, this also requires=
 the
> > ability to map and initialize these free pages on restore.
> >
> > This complexity does not seem justified for a somewhat niche debugging
> > scenario.
> >
> > Instead of a complex fix to support hibernation with debug_pagealloc, m=
ake
> > sure that copy_data_pages() and its helpers properly handle errors that=
 may
> > happen during page table updates, explicitly enable saving of KFENCE pa=
ges
> > and disallow hibernation when debug_pagealloc is enabled.
>
> Thanks.
>
> > Mike Rapoport (Microsoft) (5):
> >       hibernation: make swsusp_page helpers static
> >       hibernation: ensure secretmem pages don't reach a snapshot
> >       hibernate: handle potential errors in hibernate_{map,unmap}_page(=
)
> >       hibernation, KFENCE: explicitly map/unmap KFENCE pages
> >       hibernation: make hibernation unavailable when debug_pagealloc is=
 on
> >
> >  include/linux/kfence.h   |  29 ++++++++++
> >  include/linux/suspend.h  |   6 ---
> >  kernel/power/hibernate.c |   6 +++
> >  kernel/power/snapshot.c  | 137 +++++++++++++++++++++++++--------------=
--------
> >  mm/kfence/core.c         |  52 +++++++++++++++++-
> >  5 files changed, 159 insertions(+), 71 deletions(-)
>
> I'm not sure how to route this.  Rafael, wdyt?

I don't have a strong preference.

If you decide to pick it up, please feel free to add my ACK to the
patches.  Or if you prefer it to be picked up by me, please let me
know.

Thanks!
