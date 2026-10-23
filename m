Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792776275;
	b=RoKBTAso3It1Lw8UN1j3rVzAUb19/L280fqQTVaAkoYBCysCL0X1n6Yh5BQABIJUuP+D
	 v4muoHdnSe033sxm4GJR9Z0hdEb8CqXBez0DMTiIR2MckZ0tkjUFUiAT72GI/U64d65pB
	 orJ4P4xlDRtD+2nTwe6A/ibB6xj4uicjY/39VgHmB/B0p8O9G2TSjqg8kLyBAKf01F0Ci
	 wAc9cL+HVCktRDVthdJsclh5wjFUTH9OzNecqvHiheoti+fj6ZAZjL3fLhN5jefOPhcNb
	 2reTC7/RmdvWlGaro0SpeKJzWdE58UM3oUbIlLTkpoYLoq5Ttd5y0G985yULBinyGRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eals/84abdHEOTEHYo1O4S1OdoccFJaWdA/VZnmG1HM=;
	b=DCQZwa6rY4JLxzygQKKAbUoL3mIQCfFhbP/HoPf75jLaxwftOgDxIiyHxgdB0Xj3864f
	 m4o5LPUXC/UReE3GVKtJpNta1yUYqKLwpp0Ok/6rkjZ2WYKcGc693t4KEFE6iLblQcSmO
	 8ZfNCa7afb2upQ9Au+CpMob6o0E/0fI78QpoN78XxaCcAGZNJZlDbBLcgCKVO+K+OH52G
	 qWWBrx/ztrdhuRrsFgYE/rkCdH+utTPxxqw0a2nL+2tJro1XsH6W8Xv571nj6CKcjmyno
	 Wht7RVoAbqXNJXjv+JmdQkpEHJfyiFhbssWUadsygUVOtYMTWYxvC8C0yr/4GPWhTVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P9y7fnPi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02695606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02695606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P9y7fnPi
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1182281f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792776273; cv=none;
        d=google.com; s=arc-20260327;
        b=dEJD2CaD76tolHMPJ05I+b0GWmS3hmFTS4hHLRT+KDaIXzEGIs/yL8dXeNmjmUKZBl
         uAE0A9vTPPxrSODBgByOiFeTYdZlJ9H9lUk7R38xHdNWuktRV4l9nEAPX3k+PGj0k48Q
         VZrRhqSEEUWw+kcUM1vMxw1DZHYrIfgRVcq5B+sX0vZ49A/9GeXobPv65PGlKJOlmwSD
         ADHhSA97279umspVoCLsLBTqYDNlxLxxNTiDkvY0jZs9b72pGfNV0rs+AmbNZK0hbHd2
         VJNtd7rW9A/83d3mbBK8XiA/pROpCINehY6aur9YdgSQdgjcXvMKJ/8nEi5MJiDHc0Tg
         YvhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eals/84abdHEOTEHYo1O4S1OdoccFJaWdA/VZnmG1HM=;
        fh=+EhZ48Oh585pPOxF5Lsnr7odo12wwVD51kGiaAU3mOM=;
        b=AAMjhU1ZQq8pb58YFekCz7elyRyRGsWXBWbkOIJUy7rUPObUy7AqjsvPgB75ki6gSE
         IfsaKBL+mxNq+dCXrAOQhSSqEkl7PQP1jc/0BUAfKYw7FV4E5eCyTCyge2sCSGnTJwv+
         +e3m6QhRWZNNyXh0SYr8YYTx6DLJq+//LYdWksQ2oEFNgxKAI4EiUOzgwG0nGhZ1g3Tn
         gCXSpHVA4GjYA4Gnw/xW/NijYdf1KQ5h9SjRgn85UJki7bfo+i5K+3oNEBX9ECa97Thv
         N2wT9EGBmYj7+9Kg3qZk9bxHLnVU6rBD2Olvo41rNh2YP2UzMkrWuNaXBrbn7/3K2iP6
         r/hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792776273; x=1793381073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eals/84abdHEOTEHYo1O4S1OdoccFJaWdA/VZnmG1HM=;
        b=P9y7fnPifOtWSrrXNHRkS797j5HZKJ6sBgMscYlD4DTb0DK/L5+tIiA2eHEdC+cwQ/
         fyJozZAgPWWVs3PbPl6pn8ZG4sS5UVHydDltzJ9VdBsIhu+3g37QDav1luMYBANFoBFl
         4c+Jh91093EhKdeGYgMd/e9LnCkl01LByP+L7FM2SHkPe1DFHNbytLyFuA3alN0WL+XF
         GVts5NNnDezu8yoKBHxAjfClvieimnE9k9WwfB8PMgEc9BEPm6hIHfIEIsH1qEi7ujbU
         ePKXFhXW3jtKCw5NHAzXXg0dnDY98CD1ee+ZoWZqfcpmJcbH4fn82UTcPdnr8HdEDgag
         Y/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776273; x=1793381073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eals/84abdHEOTEHYo1O4S1OdoccFJaWdA/VZnmG1HM=;
        b=olYFhLpg8rvGQFXxD+cil5FW9j2JR1ZoS0fQWI45BwnSgSpaHSsI+5I3A4Z+BlVvon
         ImqH7QoGUuuaPvXuhpSRJJZsyxyIZm5tBwhMGOsmH/9pmgzTisfzp07SONMFtU1dv548
         SpTzMFNhBQH82/xV6tpQIu1Mth4cZStds4kdOVy85f73hhvWt7KCgyGGxoVG147WYAuN
         VCbRKwCHpkgH1LdOF+GWOszQaDNmOF1bn8hM8WHsgytpxcSy4a+aJaVdEXQUmJxOtzHd
         igHwnkcFY6HQgoFTYzJReIneCLadt1kow4aRnKfjATBC8TTjQfzf0wZmABAF9fmiJLbT
         U1kA==
X-Forwarded-Encrypted: i=1; AKwUvBzT1kNNJTCDXuqocNagsmyUOyy6lFpNZk0t8Bbwlf81beRk09e8jYlBtZRmt5t/sQcQvLJX+3jsD3oMMYM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3XXOiN8ECYg0oBIq4AeBAAojbfnn5ISa5argEaJGySyDhGuzr
	+3+tWloTeCukacwIKBe34k17WmbSHl/TX3U3k+6mfMnKgnTg1FuMuI7QmUEa+A76t5kUkQf/kEH
	zVt1uq8ezsnh8UBlgXoc7szmKRz7WgJ8=
X-Gm-Gg: AYBFou0oRHMFy2ncusx0OJKFP0xPTqIRFAjPmS3bo0mqVkPlM98eligqRYKvHfpC8gy
	r4lYUeAh6RF4FirK4uyz94DcVY2ASTt+oVZSdwFKcFgj3wyoJ/vlf+RbUqqvdv2+9HX9zaDQWWV
	DFhmHlh2JM9G4UnaikUSaRbwJnbHazXvKLd0kDt+WKSFulnoMwccCIl0FhqUeBr9gKULQu49NlZ
	jG9FknZVaw5QlEbK9XAVDF07uqjeZQbPyDWG2Guwv82HNVm7GmHEKGYf/Tc5ms/oB1tOtExMFfe
	5wt04u0ZJLmf9OHF3FDhPLXLx5JkOtnaukaA1dHIhH6vhKL0WXWLdS8c7LDul1b1cCkyzNhlYiO
	mTXg2Q63iCrcEDN7BBP21uK3Mg+XDFJ6CWLA3YoaNA71bN5/vgy6dLBFLSS1/njR5gjw4ncck4f
	2GYkpJw0DLUpDGMy5Iu3/VJK8QENKuygHDlzRZocc3vD5uB3UM5vKIJD41hPfgZ1Mrko70jgj/s
	g==
X-Received: by 2002:a05:6000:40dc:b0:48d:f5ba:fb02 with SMTP id
 ffacd0b85a97d-48e385cb0cemr4762440f8f.49.1792776273056; Fri, 23 Oct 2026
 10:24:33 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org>
 <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org> <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora> <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
 <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com>
 <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org> <20261014195354.GA371161@cmpxchg.org>
 <CAKEwX=Mwc+D+AN-B5T7p=80fqCDijdsiJjd6aN_3YMrEQjyvwQ@mail.gmail.com>
 <a24ca7b8-8b42-43f3-ad72-afe62f97f76c@kernel.org> <CAKEwX=OdbOrFbdihntP3rmcWJUyM1UpYa5n+pYjt_feMQwx8yA@mail.gmail.com>
In-Reply-To: <CAKEwX=OdbOrFbdihntP3rmcWJUyM1UpYa5n+pYjt_feMQwx8yA@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 23 Oct 2026 10:24:20 -0700
X-Gm-Features: AclHuK90U31JbVkPlQ2JhTCxhfOcbXN8AAPY12NmqFk3jj-EPn44-86VqmxU4HI
Message-ID: <CAKEwX=PCSyCEAqxeOH6CkCMu1eB3xUn3iz5XNuTbpDM3EmWYAg@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Kairui Song <ryncsn@gmail.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:35=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Mon, Oct 19, 2026 at 5:28=E2=80=AFAM David Hildenbrand (Arm)
> <david@kernel.org> wrote:
> >
> > On 10/19/26 14:24, Nhat Pham wrote:
> >
> > I'm traveling this week, so it's a bit tricky. I cannot make Thursday m=
orning.
> >
> > On Thursday I'll be traveling back from Cambridge. But hang on.
> >
> > My plan lands on Oct 22, 11:10 PM. I should be home around Friday 1.30a=
m - 2am.
> >
> > I could just naturally join that day.
> >
> > So one day later would work for me.
>
> Would that be too rushed for you? :)
>
> For everyone's convenience, this would be the time slot:
>
> PDT: Thu Oct 22, 5:00 PM
> EDT: Thu Oct 22, 8:00 PM
> Europe: Fri Oct 23, 2:00 AM
> China: Fri Oct 23, 8:00 AM

Hi folks,

Thanks everyone for attending - I didn=E2=80=99t realize swap was so well l=
oved :)

I took the liberty to summarize the points being discussed - please let
me know if I missed anything or misunderstood any points:

* Swapfile sizing: Kernel kept swap slots after read faults to save IOs
if these pages are swapped out again, and thus needed swap occupancy
(and hence static size) for a heuristics to trigger reclaim of these
swap-cache-only swap slots. However, this is not useful for fast
compressed backend, and zswap invalidates its compressed copy on page
fault anyway. Vswap does not need this heuristics because it just
frees up the swap slots eagerly on page fault for in-memory backends,
and rely on the existing slot reclaimer for physical swap backends.

* Logical footprint limits and charging: cgroupv1 allows logical memory
footprint limits (unique page tables). Cgroupv2 controls physical
memory and swap resources separately instead. While virtual swap
entries continue to count towards memsw, cgroupv2 counts only the
actual resources they consumed - post-compression size in
memory.current, and nothing in memory.swap.current. While cgroupv1
continues to be supported in its current state, a cgroupv2 transition
will present a problem for memsw users that still needs to be worked
out in some form of overcommit control.

* Swapoff: this was brought up as a request, but we ran out of time
before we could discuss the motivations and use cases behind them.
Folks interested, could you explain as a follow-up?

* VM_SPARSE v.s xarray: no performance difference between vswap v.s
part 1 of the xswap=E2=80=99s patch series. With all 3 parts, there is a wi=
n
for xswap, according to Baoquan=E2=80=99s testing.

Let us keep the communication line open and coordinate on the next
steps.
