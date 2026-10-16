Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B4544724D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177506; cv=pass; b=dGzWdzOr5cuC6spBPERftYXSz+UWM+ezc2naHcJ2ggC+kPDgcJLWnLlB54PItK4OfbqdX7B7XN5hW7jr3mtD9npNqirpqqPvZLBmLwcuxKBgLF+8eBwHEXB/ZPJv3/EXZ1r/+GEg1K4J8XDWz8jFLorAhAJ8uRHsZGF6c1JCoY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177506; c=relaxed/simple;
	bh=M6p6HiXD6ueH0boimsmVmlWWlfyQBggD43Es1j4k350=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lVlV0kXWnF3J/Co9SS+3ZHeMC4fmZ/jE8yRbt+u7rdy2JPbXmwtK8tSJ7FMIVXci6NC5c/zHowZBi/dJTP2eelbJ0NRE2A8RSgp+Ii9Be+AuTVMfpbPfGK6ovjt0HHaA4gIkNVqnlPNdrPwnWf9ynfCUU78vndZv3/FSE86MT+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dElp7kYZ; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dElp7kYZ"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be4c78e8caso230080e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:05:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792177502; cv=none;
        d=google.com; s=arc-20260327;
        b=s4aUfq2p+J4PBz68nkprVrwmHlEYWzCyAp2VWWWBuRw/qIHHfk9StyyGKDbeDA/8KL
         nI7xFyL87CvSHQIvk6m3LYUSiCJz/5V146UVEIHud4Iq5bU/7GFo3MFzbzexDOzMi+/X
         Ho49ldhrN03JLfYkVvVlSZ9dJXILuk2Nq/tja6i0dRdoCgSHenRO0bfNACZIntxqQPkk
         +3lnpMSXeOxuLIuxsrk5TIGexDJXXFGhEeEC1Sgt+P7Gg+tMeTCwoeg3AxUM0tiGbEgH
         Cwgck9YaM0sDnAiIS/kwIQHT0xcRJiJcmfzhed2/3FVpbrBUJisalKLdsfp6+7URICMP
         ic3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eFr5a0FeYIfPj3OlM5ijOjEBoPrB3ZZlxk7SDs3PmPw=;
        fh=ClzoSUVn8Yxn3FIK/8NPxaRixeKTuUffwKkpzLtP+z0=;
        b=lT33YVGWKlBQQFLkTMZ2FCR5vV6OyBVzmCdo/WmxXdoBqbV2LdfudMH5Df/TLkrDnx
         df3OLpXdGhDmy0qPjhAal0slZlZmFFzHq/Ig6dgaD0CUK/j+cvxVHtmdgAs1ElUbJcx5
         1/i5i/n5lzNXYuGSyuZsKgIjEYzPWEDaLnhC21HZiM2PijOTiy7eV5BILkImebXNXVsz
         AFVWoSLJvsH4xawKObm3byUL3Q0dCKtqBQzgqy+prntQMIWppRieW97GtGgO9IPVpwaU
         j8dUSAuIT7wyExqy8SY0x1rX9mwreT8EasT1JNkDybjZ2FEfTSGwbClm3p27vg2m6G4m
         RaaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792177502; x=1792782302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eFr5a0FeYIfPj3OlM5ijOjEBoPrB3ZZlxk7SDs3PmPw=;
        b=dElp7kYZQoZBicmNW470HTN0awFsXpWFqPwpQwN8xRBUZkPfoj5EhFKRLmBXLCPdiC
         yG5y9QXK3EyaIS1vyMVAB2pxO+xyOQB1Rg9k+SvTBy9tG0lYvJ2ESQDgUR2wZOj5O82C
         w9XehSrA2201cUmPZtL1WCfpREsewxtszXiD+Qd8KLIexrEbQirjEiNdy+xrvDx4lZwH
         VkxVHfM6IimUG7YvgtEgo0jKlqh4iRq8k8xcKfAah7reYbElufYRDs7LkXqUytmghPVn
         KAJdtuTWltm60GO1KGG6vYuJ3PNWk1dwumYbNtkd6+plWYLuT3+wrvyutS8lBUaNJugk
         9zTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792177502; x=1792782302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eFr5a0FeYIfPj3OlM5ijOjEBoPrB3ZZlxk7SDs3PmPw=;
        b=gGzrDE7Ia8B4qkkWFXMhWAXKFtEk4e9SvLgxuP8/VS8wcXXb6vWm4zO7ZmT9Kss29a
         yLpdcTK2743ZAteVYO4XiMi9aQ+UoGiQ6EHkSZEYBAjQ/8UOzIXIEClB1yMbEtg+8Mce
         2l5DjBZXo1KNcgUoqjBy/h3YLkalp11pWpv+V17TwpwV9RzLdtGQrd1s+saOalBUQCMI
         g8ZpmwO51QIg1ydSZoM8pcu8To/FPSHkTUkODdN3Wentl4a3BOHpKq+vrqa7IXfgcE27
         ZjBIdJwqGPnyevA1i5ezfuFNtgJJpYPxCObArsuPFcRvkj5BEJp+gIRq9h4nzItVqYeH
         kaNA==
X-Forwarded-Encrypted: i=1; AKwUvBw86j8Xjcfamwjlr8DWs2R8E+mTlyXeEH9TaSKsvn2wGBVBFH4br3IDBfhPE9khPuKihXqyQoAbpqACgQE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcy5yNna8Ld8efBQrHooKKu+i004FKf9BOadNTLseuNLWwrTh0
	TFsA6+Mm9/UQGlsjanJ1TFYPIoaNC3xMWmuw7ZteYVfACGLhSmCccCrrP5a5dcLOTWmOib7ha6B
	TLU7fEEgWfWP+E5y9f1OhspmhFC1x6fNWjJIB
X-Gm-Gg: AYBFou1PhQFl95o61Uu1IHyjaHRJxeqCUFnngbELUtI+BhgJFzw5rJZsPMYhUuTMHhq
	WBV+NKjveQ3a5ldrgu5lER32dKg2J3nuth+9+4joxvlkC1WCloZ6wiGQbDW+ixcaJMmnq0OdFgZ
	/Kb7dPzSv9h7LdvE9Z/SZjO08up5XXK3+Y25dMlamKQKyYxQi12T1xkZ4FivOXQegXseavDZGC7
	mYowvbXhfAW0TSg7Z5DoD2touv7nE/c7t/cu5q/wYO2GxqWzEITqDazig6eMDju+1iolxi8tHr4
	CTWx5V96gBiIysgG5XwaMyAzXo7BheFb5e218PapxLyqKxp2tmu4W4M=
X-Received: by 2002:a05:6512:3d1e:b0:5be:4d3f:bcb with SMTP id
 2adb3069b0e04-5be509f6406mr140553e87.6.1792177501725; Fri, 16 Oct 2026
 12:05:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008182814.27450-1-kanchanapsridhar2026@gmail.com> <CAO9r8zOHtaeo5jhHkHB8Vtb9+KZXO+DH74v+7Y84W0v=tatRqg@mail.gmail.com>
In-Reply-To: <CAO9r8zOHtaeo5jhHkHB8Vtb9+KZXO+DH74v+7Y84W0v=tatRqg@mail.gmail.com>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Fri, 16 Oct 2026 12:04:49 -0700
X-Gm-Features: AclHuK9MIvQEnJq535pIpXHoDNUv0NJGjcL6pnvPWj57xwMyrngG-QJeAgr-Nsw
Message-ID: <CACpmpofN-JfCgJtW9D0wNu0_pL1pRWGfNphUQnE9Bse-P5tHpQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/8] Batched zswap_store() with compression batching
To: Yosry Ahmed <yosry@kernel.org>
Cc: hannes@cmpxchg.org, nphamcs@gmail.com, chengming.zhou@linux.dev, 
	akpm@linux-foundation.org, linux-mm@kvack.org, herbert@gondor.apana.org.au, 
	davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 9:14=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Thu, Oct 8, 2026 at 11:28=E2=80=AFAM Kanchana P. Sridhar
> <kanchanapsridhar2026@gmail.com> wrote:
> >
> > v1: Batched zswap_store() with compression batching
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >
> > This series is a spin-off of "v14: zswap compression batching with opti=
mized
> > iaa_crypto driver" [1], and focuses on the generic crypto_acomp and zsw=
ap
> > compression batching enablers. Resuming work on this series following a=
 gap
> > since v14 (January 2026). Please note that my email address and affilia=
tion have
> > changed from kanchana.p.sridhar@intel.com to kanchanapsridhar2026@gmail=
.com. I
> > have retained the original Intel sign-offs on prior patches for histori=
cal
> > attribution while signing off v1 of this series with my current address=
.
> >
> > To summarize the main contribution of this patch series: Batching is in=
troduced
> > in zswap_store() of large folios: we carve out a large folio into batch=
es of
> > ZSWAP_MAX_BATCH_SIZE (8 pages) for software compressors, and store each
> > batch. Moving the fundamental operations that need to be happen to stor=
e a page
> > to now work at the granularity of a batch offers opportunities to optim=
ize them
> > from these perspectives:
> >
> > 1) Utilize existing kernel API that minimize obtaining locks for bulk
> >    operations, e.g. kmem_cache_alloc_bulk()/kmem_cache_free_bulk().
> >
> > 2) We keep the working set for each of the core store functionalities (=
alloc
> >    entries, compress pages, store pages in zsmalloc) to be focused on a
> >    batch, thereby minimizing cache evictions and benefiting from cache
> >    locality.
> >
> > 3) Along the lines of (1), the main zswap_compress() batching routine o=
btains
> >    the acomp_ctx mutex lock once per batch, and releases it after it ha=
s
> >    processed all pages in that batch.
> >
> > 4) Any zswap store functionality that works on a batch can potentially =
be
> >    parallelized as a next step, to further improve performance.
> >
> > Performance data: usemem with 60% over-commit:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Validation was done with mm-unstable as of 10-3-2026 (Baseline) and wit=
h this
> > patch series.
> >
> > Testing was done on a Chromebook with a QEMU "vng" VM running in Crosti=
ni.
> >
> > Chromebook Diagnostics reports:
> >   Intel(R) Core(TM) Ultra 5 115U (10 CPUs, 4.200GHz)
> >   RAM: 16GB
> >
> > vng setup:
> >          Memory: 7G
> >            Swap: 3G
> >     Pinned CPUs: 4 (E-Cores: 4,5,6,7)
> >
> > zswap compressor:
> >   ZSTD
> >
> > mTHP enabled:
> >   64kB
> >
> > vm-scalability/usemem setup:
> >
> >   cgroup memory.high: 3G
> >   4 usemem processes, each allocates 1200M anonymous memory, reads the
> >   Silesia dataset [2] from a pre-fork-allocated buffer into the 1200M,
> >   writes to each unsigned long in the 1200M, sleeps for 10 sec, then
> >   frees the memory and exits.
> >
> >     usemem --read-silesia -w -O -b 1 -s 10 -n 4 1200M
>
> What is --read-silesia? Is this a local change you made to usemem?

Yes, this is a local change I made because I wanted to get compressed
lengths besides 565, which is the only compressed length of data
swapped out from the original usemem.

To replicate my setup:

1) Setup Silesia dataset to be read by usemem:

wget https://wanos.co/assets/silesia.tar
tar -xvf silesia.tar
# concatenate the 12 binary files into one
cat * >> /tmp/silesia.bin

2) Modifications to usemem:

usemem_orig.c is
https://git.kernel.org/pub/scm/linux/kernel/git/wfg/vm-scalability.git/tree=
/usemem.c.

diff usemem.c usemem_orig.c:

75,76d74
< unsigned long silesia_bytes =3D 211938580UL;
< char *silesia_dataset;
103d100
< int opt_read_silesia =3D 0;
166d162
<       "    --read-silesia      write memory with data from
Silesia.tar to allocate the pages from Linux kernel after
malloc/mmap\n"
209d204
<       { "read-silesia", 0, NULL,   0 },
352,373d346
< static void fill_buffer_from_silesia(char *buf, size_t length, const
char *silesia_path)
< {
<     size_t bytes_read =3D 0;
<
<     int fd =3D open(silesia_path, O_RDONLY);
<     if (fd < 0) {
<         perror("Failed to open Silesia dataset");
<         return;
<     }
<
<     while (bytes_read < length) {
<         ssize_t res =3D read(fd, buf + bytes_read, length - bytes_read);
<         if (res <=3D 0) {
<             /* Loop back to beginning of silesia.bin if allocation
exceeds ~210MB */
<             lseek(fd, 0, SEEK_SET);
<             continue;
<         }
<         bytes_read +=3D res;
<     }
<     close(fd);
< }
<
613,623d585
< static inline void copy_silesia_to_buffer(char *from, char *to, size_t le=
ngth)
< {
<       size_t nr_bytes_copied =3D 0, remaining_bytes;
<
<       while (nr_bytes_copied < length) {
<               remaining_bytes =3D min(silesia_bytes, length - nr_bytes_co=
pied);
<               memcpy(to + nr_bytes_copied, from, remaining_bytes);
<               nr_bytes_copied +=3D remaining_bytes;
<       }
< }
<
638,642d599
<
<               if (opt_read_silesia) {
<                       copy_silesia_to_buffer(silesia_dataset, (char
*)p, (size_t)bytes);
<               }
<
1053,1054d1009
<                       } else if (strcmp(opts[opt_index].name,
"read-silesia") =3D=3D 0) {
<                               opt_read_silesia =3D 1;
1263,1268d1217
<       }
<
<
<       if (opt_read_silesia) {
<               silesia_dataset =3D (char *)allocate(silesia_bytes);
<               fill_buffer_from_silesia(silesia_dataset,
(size_t)silesia_bytes, "/tmp/silesia.bin");
