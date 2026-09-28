Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BEB471CE9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588109; cv=pass; b=d8AuFADjgnUQOjsBXevtzQZ529uhoWMO6lVaC3GTCaEeBiYv/jXhkTwQwYN7yfqH9F0XAHDP2tXC+2OG3EVX+7Ku5eTP0uV1AVeNf7PTyzWq8KgXMPSFhyjnjvCIsoEyJw+ijgtReLJAkPDv8dBpwBwrs8P/fTfSzvaIGdlCQmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588109; c=relaxed/simple;
	bh=ccoxnOTnhnpq6LUQRFjL4NJ/6/zTWuObEY8FUXuRip8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pqslmf5+b8jBSBdMrmSQOg/7M/lKhxgUgD/w5Dh+r3FJ96A5I+P9kHcH9ZVolpWlbIqcUQC5kD36X7gSdxHOKTcfjQwgyebKLH6T65E5AVOr0LTRitZE/owGOCrCLYAA+UuUyBh88VUM2u29ZI3y51yx94TrMDI/3wK1AwSmlu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlgEBctu; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlgEBctu"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2dd363f57aso89767166b.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790588106; cv=none;
        d=google.com; s=arc-20260327;
        b=DYbvrQVubdjNgocdmOn4JlqRY+CHUgf/rnKpMWiwOCWkhSNKSPPLu86hxv+UFIkFXe
         d4oaUF7FzSv/it37KvlYuqdVf6T2/6hGodM9SO6zvG3Oxe4SGirkDWepdda0/YLOfooc
         pmpmY0ng+TRyKJiWNeehvdJZni/FJjpGzxNC+j+D2MS+7MVzWfDF/4w/vkvKUqGUCqKE
         c2cDUJQwG9iUBDU8zcdefvP9lcr5g5WgwnNCMAuLtNG9Aq1KbV7oBaSMC3vLIGFAKeNM
         syKLt0xmK/57ifxbEZXbbmV4Ly8ylVH10GOlkX8nc3h8oXjtBP436vtLsRdJmMZFJK32
         rFcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J7NixjEGofgkN3CS5IP+1OrrpCKUq/nSVKpFmSD6AB0=;
        fh=dXGcnd3rpXqJT7C6Gz9i+6MRb6OgVYrpZmAWKRzgEO0=;
        b=SpGqVyCGe9QbFEMQjk9LUETJbwFAbe9cWfeupeCwayUs8G9DDXXhjvYe21XpolnvjR
         73WePoJ7BaMxwXafJFXp7wqxmqCrGTJ7tZl5G0rUhBBP2BaT+25JARUQaOTEdeoM+WDp
         XM+SL35EKEH97YVA7qUCzRklg9EV+fOlq2bB1Svoll6xNzyrDdvk0VRq5cq1OwbI1kVP
         bdeUCZDPfiXuRP/Z72xDsXgfIZO1kCgzhx+X7ZXyHpJQNMd1CmpaLfwHoVK6UsKorzA7
         uiDpSLwFcLbYVd5mymAKzSpxeCaOFHtKQD78EgSEvcfc3OiAwa0Nzukk5htZkJ1LsXoZ
         ljDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790588105; x=1791192905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J7NixjEGofgkN3CS5IP+1OrrpCKUq/nSVKpFmSD6AB0=;
        b=KlgEBctu8040tRcI4JJ4z/lgw8m/xm5eAl8RMeOIXx7JpsVmJQYUqB9eMde8iISo/t
         WIPMtGAUW7FN1hSgHRICbGUopeOII87H1k9vWr+uhhQwjlECKMiCdvhzLLZs8f6NxrkH
         utFukPD17YPzJiQMNyKy3b7197ojQviiyZUXfg1BsEwWVp+3Yx3FlJ1tiRixN4dHodAT
         41XPdKXcWiaH4zMiO/FkXizKAMVrpvzZfQm9DEEsoQRL4lQiVGyB6hYiAGr6IKeI6OnB
         3pSyidg2i/6mtA25l1Go5VofvJV6+FmLMpAqVrTn9gKPBHVRsdgA23b/Fysoth7AVC33
         bOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588105; x=1791192905;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7NixjEGofgkN3CS5IP+1OrrpCKUq/nSVKpFmSD6AB0=;
        b=LjJt8aDb/FA8gua9tDS+ws49HgZAM9c7wXpo9d7xy1n91RnFADE/yWs/hXl3EYkZHr
         pbyTLr8pKmd7jwQhwvyI3pTwbXH38cuGkhx8e1YStolOnDLbgYLvjE74JJBR3+0plZNf
         GB5F3uQEoGKX0ym2qCUk6myq3qDxA5Dr506T097o/b13Lyp9XrMR0ISzfZqRjGR73y7k
         w2Edi9h1nw78b8Xw9fWu2NivLHW728eP5JgvXRG/zl8tfFRcUYwgX+j8K3yXAczkI6Pn
         oYxPModvnWfe82oAyWcEoOXSmCPBAli53PMBLJY761+w2WayumzyzddvhxyLTAI7/27o
         NI1w==
X-Forwarded-Encrypted: i=1; AKwUvByZZXygGl8oWRFqBx3Ldpj2L7dihhk1cPtbrbfrvG36i4Ia/Q7eBB+DiLas0/ev1ZmVgYW171ANROdqAa0=@vger.kernel.org
X-Gm-Message-State: AFuF++k5c9id2MQWTM1JvINWarNb/qKO9G5z5KuoQq8gozhtiwHBX1sJ
	IhVKDAVgysBQKLnOrdToiZs5UVeiHcXgqxNuIn1jp4a7TJymNMDmgTs04GBK1SVzFbqlg1jADa3
	IVB6nI3lonXarJBGlwQCdf7T1XyzfcXg=
X-Gm-Gg: AYBFou1O2DjbR3RLMhunwUgUEBXWLSMqW0C1bgUvb8nYf25D8aDSjaGf/Pm76XgPUTX
	SJDfj5opvTAXm/1ef5VA2L4EBpU/BHIj3wo/1PqvgUViRFhui4vAL2ufkyt5RDiyFH+7xEv8uMR
	O8AuA+RPna3ZtDlY92etFMh5Ijrtk5Jh6edw6A6fOjmaeeGpM9jbdjK5epSyb+XPuk3KXyT/RoT
	4c2Ji5Y5n0SMEEz9dEMGjG1rM3wsPFdAben+d5DKc+RQBkpPZTA7zgKMUsv0wUZo5JOgrP2LkIP
	bV89PZW4Fc+JzeEHHT8FbvDME8xv68MS9fkyifpeDmA+p98BBfPpl2mFN324ZVqxsx9zXyRIyjr
	BC45FkqL+C6U=
X-Received: by 2002:a17:907:9445:b0:c26:19de:9adb with SMTP id
 a640c23a62f3a-c2ac259cee2mr1036666866b.26.1790588105420; Mon, 28 Sep 2026
 02:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-mglru-fg-v2-0-f26e5cb26da7@tencent.com> <20260928091144.818739-1-liuxiang.277@bytedance.com>
In-Reply-To: <20260928091144.818739-1-liuxiang.277@bytedance.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 28 Sep 2026 17:34:27 +0800
X-Gm-Features: AclHuK-2Am0IrJwrtO2WIF-9sUUaEeJonX73QRQrUzGpc-JcUfmwQN43Q37uOAk
Message-ID: <CAMgjq7Agqr1FLcG3HqT_M_1s8cHc21qQKTM-JS67-3gfQ6azPQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 00/15] mm/mglru: frequency guided promotion
 (MGLRU-FG) and flag cleanup
To: Xiang Liu <liuxiang.277@bytedance.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Yu Zhao <yuzhao@google.com>, Barry Song <baohua@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 5:12=E2=80=AFPM Xiang Liu <liuxiang.277@bytedance.c=
om> wrote:
>
> Hi Kairui,
>
> I tested the complete MGLRU-FG RFC v2 series on an x86_64 machine with
> a SATA SSD. I found that the LevelDB Scan/Get result changes with the
> relative intensity of GET and SCAN.
>
> Setup: base commit 9958290885035431e2494159f555e332c3c14906, about
> 28 GiB LevelDB, 2.5 GiB memcg, swap off, Zipf 0.99, SCAN length 10000,
> 240 seconds warm-up plus 240 seconds measurement. Each untraced ABBA
> sample used a fresh database copy, page-cache drop, reboot and cooldown.
>
> Untraced ABBA results
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Workload                  GET/SCAN   Baseline       FG     Delta
> 1 SCAN + 3 GET                92.5    4688.62  4425.82    -5.61%
> 4 mixed workers, 99.5/0.5    195.2    6200.60  6385.57    +2.98%
> 1 SCAN + 7 GET               237.2    9574.97  9831.70    +2.68%
>
> The first workload is the original four-thread layout: one continuous
> SCAN thread and three GET threads. The second is a custom workload in
> which every worker chooses 99.5% GET or 0.5% SCAN per request. The third
> keeps one continuous SCAN thread and increases GET threads to seven.
>
> In the original workload, FG changed GET throughput by -5.74% and SCAN
> throughput by +6.91%. The two ABBA position pairs were -6.21% and
> -5.00%. A separate 5 GiB memcg repeat was also negative: -9.07% and
> -7.67%.
>
> Traced results
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> I ran one fresh-boot baseline/FG pair for each workload. To limit probe
> overhead, I selected about 1/1024 of file offsets using a stable hash of
> inode and page index.
>
> Initial placement of newly loaded GET folios
> --------------------------------------------
>
> We tracked new file pages loaded by GET requests and recorded where
> MGLRU initially placed each page: the oldest generation or the
> second-oldest generation.
>
> Workload / kernel       Sampled   Oldest        Second-oldest
> 1S+3G / baseline           1452    186 (12.8%)   1266 (87.2%)
> 1S+3G / FG                 1371   1052 (76.7%)    319 (23.3%)
> Mixed / baseline           1782    199 (11.2%)   1583 (88.8%)
> Mixed / FG                 1662   1312 (78.9%)    350 (21.1%)
> 1S+7G / baseline           2719    469 (17.2%)   2250 (82.8%)
> 1S+7G / FG                 2677   2107 (78.7%)    570 (21.3%)
>
> For example, the original 1-SCAN/3-GET baseline run sampled 1452 newly
> loaded GET folios. Of these, 1266 entered the second-oldest generation
> and 186 entered the oldest. With FG, 1052 of 1371 sampled folios entered
> the oldest generation.
>
> The same change appears in all three workloads: mainline places most
> new GET folios in the second-oldest generation, whereas FG places most
> of them in the oldest generation.
>
> FG promotion was active in all three workloads:
>
> Workload              Later GET       Moved to the promoted generation
>                       changed gen     during reclaim scan
> 1 SCAN + 3 GET              38              548
> 4 mixed workers             32              558
> 1 SCAN + 7 GET              70              936
>
> However, FG also removed more sampled GET folios before another GET
> reused the same in-memory folio:
>
>                          Removed after one GET      Later reloaded
> 1 SCAN + 3 GET            81.5% -> 88.4%           44.7% -> 48.6%
> 4 mixed workers           73.4% -> 90.2%           48.3% -> 52.7%
> 1 SCAN + 7 GET            84.5% -> 88.2%           56.2% -> 61.1%
>
> The arrows show baseline -> FG. "Later reloaded" means a later GET
> demanded the same file offset after it had been removed from page cache.
>
> The request-level counters explain why the final results differ:
>
> FG change per request       GET cache miss   GET I/O wait   SCAN cache mi=
ss
> 1 SCAN + 3 GET                    +2.29%          +6.87%           -15.97=
%
> 4 mixed workers                   -5.68%          -4.19%            -6.93=
%
> 1 SCAN + 7 GET                    -2.89%          -0.32%            -8.26=
%
>
> FG improved the SCAN side in every workload. In the original workload,
> the GET miss and I/O increases were larger than the SCAN gain, producing
> the 5.61% total regression. When GET was denser relative to SCAN, GET
> misses also decreased and FG became a net win.
>
> My interpretation is that FG introduces a cold-start window for a new
> GET folio:
>
>   first GET -> oldest generation
>             -> a later GET promotes it, if it is still present
>             -> otherwise reclaim removes it first
>
> The outcome depends on whether GET reuse arrives before the continuous
> SCAN stream consumes the oldest generation. The trace shows that both
> promotion and early removal occur in practice.
>
> This machine uses SATA, while the positive results in the cover letter
> used NVMe. Storage latency may also change the timing among page-cache
> insertion, LRU drain, the next GET and reclaim.
>
> Is this cold-start window an expected trade-off of the current design?
> Would limited initial protection for refs=3D1 folios, or a decision based
> on observed refault/reuse distance, be worth testing?

Hi Xiang, thanks for testing:

Well I mentioned this in the cover letter:

=3D=3D=3D

Interestingly, mainline MGLRU already beats CLRU on this one after a
recent change in lru_gen_folio_seq that bumps new folios with refs =3D=3D 1
to the second-oldest generation. That change accidentally gave random
reads a higher hotness level while making sequential reads much colder:
sequential reads involve many readahead hits, and readahead folios start
with refs =3D=3D 0, so they're already in the oldest generation, and
folio_mark_accessed() on a readahead hit has almost no effect on generation=
s
in mainline MGLRU. Meanwhile, all direct-hit (random read) folios start
with refs =3D=3D 1 in the second-oldest generation. As a result, the scan-g=
et
test natively protects the "get" part and sacrifices the "scan" part.
That's not the best solution though. It's unreliable because it depends
on LRU drain timing, and it hurts workloads where the sequential part is
actually hotter (any workload involving a hotter large file and many
small cold files will be affected).

=3D=3D=3D

That actually mentions commit 6cbdd9726fb50. Before that commit, as I
mentioned in an earlier RFC, the LevelDB test is doing a lot worse in
mainline, which also matches what Tal tested in that cache_ext paper:
https://lore.kernel.org/linux-mm/20260502-mglru-fg-v1-0-913619b014d9@tencen=
t.com/

It was like this:
GET/SCAN LevelDB [2]:
Classical LRU: throughput_avg: 993.64 Ops/s
MGLRU before:  throughput_avg: 951.12 Ops/s
MGLRU after:   throughput_avg: 1344.72 Ops/s (+41% faster)

After that commit, MGLRU beats CLRU for this test, but that's a side
effect. (And also I made the test run much longer to let both CLRU /
MGLRU to learn the hotness info more so in V2 RFC the ops/s is higher,
also reduced the RA window as RA window dramatically effects the
result).

6cbdd9726fb50 strongly favors the GET part, because of scan readahead:
non-readahead random folios (GET) will not use too many RA so they
mostly start with refs =3D=3D 1 before landing in LRU (stay in percpu
folio batch, so also due to a time window and unstable) so they are
put in 2nd oldest gen. Sequential reads, however, use RA heavily and
start with refs =3D=3D 0, landing in the oldest part. This creates a
strong bias toward reclaiming the scan part, which coincidentally
suits that benchmark. But it is just not right, assuming sequential
read is colder than non-sequential reads makes no sense. And it does
caused regressions for many other tests, e.g. some data base like
SQLite, and for example a recent report for other people:
https://lore.kernel.org/all/20260901180704.168106-1-ehab.ababneh@intel.com/

With FG, however, it will actually learn the hotness. If you check
Tal's paper and code there is also warmup phase for any algorithm to
take effect, so I'm already glad that with NVMe, where the warmup
window is shorter, FG is already doing great, and even if the window
is long, there isn't significant regression, and more like a balance
issue. I believe this way will lead to better long-term performance.
