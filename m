Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271E937F8AF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506571; cv=pass; b=JL91H9TcF9/JDl3YhGqs0wk6uAsyuH/sMq89DrU33k7AGa/mcdTHIh6Lrv46rKYQ5bJuS6l2fO2OdcfbBX5xlxfkcAcGmIP1uv+cXRnWLmP5wi5i0tBGkEgYSUvAI1ENjYEBvtGkMU5UrnVUM+vaVCbxfz+swf96AfPN/kVvzgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506571; c=relaxed/simple;
	bh=1QRE8JagBvXkhtro25uEoq7Fl1riQZiJGjJXvowWF9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qCqRQ+Sg2QrsAQadN60vZyfSWj6osbHACedAIM1PwCNvyjrOrL7i3JGo85eJXHfNin8F4dJQQB/9gdZTk4Tc6nmE6vUJ+Qjj8oNtGVkfsm6z0qMEZtbYeLka12QBi1l8uswZNfHR2ZNCHimGjOpgqMUUFWHdxVy29DZuqWmYXdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tEKHDM6F; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tEKHDM6F"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53012819c04so26671cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:09:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789506569; cv=none;
        d=google.com; s=arc-20260327;
        b=i2oyYqK3iYjCp3Xf3jHhnolb93lNGasHHYpuvQXVpGcH+x7svUCFhdMWNYecmxF5T+
         mcf3IepZfwscQlzyW/DX6qpvo35N3gy+xkDFxjeQvUHjOb5owtLy9odJDUYTZrxxJz8B
         2Sc2MbEizTNlYYaC1hCn9MBH63c8Cjkev7Wl5rA9JJpqCJDrWJbRSCANorJ97zKiBNkP
         wPSE3VwnuF3PMZsuyHrAvBVvDbnx+ZPyWyZnrUz0l+Uik+c/Ptit0NhytCwSsvYwG8a0
         adgHUyYNq46WgHHE5P2VYyH5b+PsMwERfDBU0+LCRpY+2dkTMYmRi6Hzgue06PJNg+Zc
         sjmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OAM/MHo0tjYo/TgHknUbcGsVAWd3749MCucVMwwVJms=;
        fh=s2Q63O3xcI4fgDKprqxR3wOV9C1D55eaDjAXfV2yilA=;
        b=o+l7Ed7/V1aSC0AhNlrThp93Jmht9Arzb/s+BmSAlaJX+ysSe+D9OIpXOQn3C1zI5j
         S56aQiX7IeBZ7sHawvriMATn/y8qO6z1GaRwVXGoGLhakS7CkmyQuCdmndCkU8Rx1vWn
         Mb5M48E+wf9ALyL17bOrnheu23nG8DADTnjyDOVMtdom7Ir3CGQA17YmoeoJjMZx0bJE
         FKuJOWVnDndNnPgA33+VX43JFCSBf80U9xx3TxR4zDe4CdiBRDYdGYyfp5syCFpA4c/Z
         Kxpa8aFJJHLGE3QbmKE8pY69baLWhQJhJ7+uqZV4cNNo+6cEeqwC2b4GafXk/Tuq4nWP
         8Dtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789506569; x=1790111369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OAM/MHo0tjYo/TgHknUbcGsVAWd3749MCucVMwwVJms=;
        b=tEKHDM6FifXwjFChe+TECRqENPdukEsPyRb9Ex50YFNTMwwTo6lTa27mxkxkEUYbGB
         gyHW7LFPO2k7FoJiraqCA70QZXHRE5jff3cg05yrvcs+vATQXBC1yLJWhitxMwyF/1kE
         cPJHdLc+AyhMvg/hwRauCuupEuVxzG8R73oOMQ3AziF2k5W4TjCGGftn4muqaTesk6SB
         nKaSGid6l7Lk9YW6oILo+A/iuqGXQEFlPo0BWNtwghj02TLreoyV9FhMknuBFR52cVX/
         noS13iL//5U4R/jij3Cvv0Ob403g9ZGHP4+9avqendkE7XgeqEeFFXzeSFXdCUDoDVHK
         pvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789506569; x=1790111369;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OAM/MHo0tjYo/TgHknUbcGsVAWd3749MCucVMwwVJms=;
        b=YCv9KvH+HO08Md7gxqfOnda2/e8aTM9dozQqzYxYiRK3htdE2KET8/Lpj98XKW8U2x
         1XCRoB5ALh+6uRrABwwjIIaozEB/MR7Pdjq4PRpIYXgMqwe6qBpNnb/4uM3u/tHvJGbR
         sOTTcwADIjtq8L8993HKQQ0se//PqW9WjiZL8U4gf9Z9n+NRmqp8KB5WkSBzcV/qdmlR
         AH5bYJ8a5lt4V6CwBBb+GRiALXWZMbJa4zt/WyDXmagvgw3/WGsWW5UakHw+DEihlnZk
         mBYByaeT42nVcvAF7lRuskUqmo1N83yDmprF2To5mPH/625oMwlavpbCI5h/b4ovgJvH
         3emg==
X-Forwarded-Encrypted: i=1; AKwUvBywrOwid5Z38AlWNjrdo0O9OiJ6FWSg8g9ELVO1XGly9KDnmUTPwuzYg615ziNsB6OLG7p75/Yis3+xdFc=@vger.kernel.org
X-Gm-Message-State: AFuF++m7s4RzmlRHleaexYbzYvD+GFFnxAiyzVEH0dQp/7Gyousp82OQ
	+EAzefwvl/+uNIV3LmAtzvpa8U08OP6JmsaJfZTrAw9YjijIIzb59JTsOKmxGS3jnCGkj1haHyq
	TLkdIMzCDhN3C4BqUybIKJWQj796tDBNAJvhj52WB
X-Gm-Gg: AYBFou2EaGBt7tbXXpbkvy2YA8CvyW4XC2K8TfkpjQXnUT9H46M08ZsQq0coiB48bv+
	UCnnARpmUcCSKy8OxPtWqL7AaoZjv0RVqk4S53gSAFWC7YqvgZps0A3RVietXplCrDjvZ98Bqyd
	2Gz9pSA44/YsT5RagCzOY3meb0reCXYa+ddWjGAT836PWrTC7L425NtdTBgclLsL4S2+gmuPfud
	XkhCscKzEqteCv6mny5NOfSJ1MQMdhzTOZgs+5cnvjUAsg2a53dw4ZEzP4ULn2/KesHxLJsarj1
	zSEquzbqE3nSCKBCmOM2qaQ9iXEltp5rXIZJHsMj1DzMaNWWoc7r+L5JQo/rQsM6n1kZenkdxGH
	3hgRuTDSgd1czwlaHDCRX
X-Received: by 2002:ac8:6f0f:0:b0:52f:9ed4:8d75 with SMTP id
 d75a77b69052e-5327ea623fbmr753851cf.15.1789506568256; Tue, 15 Sep 2026
 14:09:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915070001.113559-1-hao.ge@linux.dev> <20260915070001.113559-3-hao.ge@linux.dev>
In-Reply-To: <20260915070001.113559-3-hao.ge@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 15 Sep 2026 14:09:16 -0700
X-Gm-Features: AcwNN1W8v3TTrRxzwemLVzpv82f0jC7eBKsciqbn6XlLizQdqhzOL-UqObB-lQI
Message-ID: <CAJuCfpHJSwNhgotMVpmjVvdv=m52_7Kvzpztf0WcN0AaoSeGGw@mail.gmail.com>
Subject: Re: [PATCH v10 2/6] alloc_tag: clean up the populate failure path
To: Hao Ge <hao.ge@linux.dev>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-modules@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 11:59=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> The reservation is already stored in the maple tree when
> vm_module_tags_populate() fails. A failed load never unloads the
> module, so nothing releases the entry. Release it and roll
> module_tags.size back. Without the rollback a concurrent load that
> already passed needs_section_mem() can reuse the freed gap, skip
> vm_module_tags_populate() and write to unmapped memory.
>
> vmap_pages_range() may have installed some PTEs before failing. A
> retry to populate the same range would BUG on them, so undo them,
> but only if vmap actually ran.
>
> Fixes: 4835f747d3ed ("alloc_tag: support for page allocation tag compress=
ion")
> Fixes: 0f9b685626da ("alloc_tag: populate memory for module tags as neede=
d")

If a patch fixes two other patches, it likely needs to be split so
that each part fixes one patch only. But read on please. I'm not sure
if one of the fixes is correct.

> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  mm/alloc_tag.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> index 2070e682fe10..95ddf5b743d0 100644
> --- a/mm/alloc_tag.c
> +++ b/mm/alloc_tag.c
> @@ -804,6 +804,13 @@ static int vm_module_tags_populate(void)
>                                      next_page, PAGE_SHIFT) < 0) {
>                         release_pages_arg arg =3D { .pages =3D next_page =
};
>
> +                       /*
> +                        * vmap_pages_range() only runs once all pages we=
re
> +                        * allocated, and it may have installed some mapp=
ings
> +                        * before failing. Undo them.

If vmap_pages_range() failed to map the range, why should we need to
undo it? If it indeed leaves some partial mapping when failing then I
would argue that vmap_pages_range() should be undoing these partial
mappings itself before returning the error.

> +                        */
> +                       if (nr =3D=3D more_pages)
> +                               vunmap_range(phys_end, phys_end + (nr << =
PAGE_SHIFT));
>                         /* Clean up and error out */
>                         release_pages(arg, nr);
>                         return -ENOMEM;
> @@ -947,6 +954,7 @@ static void *reserve_module_tags(struct module *mod, =
unsigned long size,
>                 return ret;
>
>         if (module_tags.size < offset + size) {
> +               unsigned long prev_size =3D module_tags.size;
>                 int grow_res;
>
>                 module_tags.size =3D offset + size;
> @@ -961,6 +969,8 @@ static void *reserve_module_tags(struct module *mod, =
unsigned long size,
>                         shutdown_mem_profiling(true);
>                         pr_err("Failed to allocate memory for allocation =
tags in the module %s. Memory allocation profiling is disabled!\n",
>                                mod->name);
> +                       release_module_tags(mod, false);
> +                       module_tags.size =3D prev_size;

Yes, this one is a valid fix. It fixes 0f9b685626da commit.

>                         return ERR_PTR(grow_res);
>                 }
>         }
> --
> 2.25.1
>
