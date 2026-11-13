Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794595872;
	b=2eRfipvj+IPH7xRrRhOZDh8EWmDcquRAlfXM2tI7rluUiMYlgp72osUFRDQi/hUVLizp
	 vCX67ReIiesEgqYjxRmCuysIpoQHdkNxgmCHhqRfa0g36+aZt7rdkPsB/NQFFHfBJyian
	 IqCj98o5VbhikHdoGRZ6IUD1zhS3ewz3dhnuELpn9NRGdJbPcxUM+24gUcHNPnzq1o/gD
	 0bTGQXgIZqWTfbS+JOYK3dA+g0ClEZFh95V92CzP7eGbHMlk01N0PWryg++8S+iOmtC1/
	 IpqtjD1W5e9BvCiWykY69R0E/p5z+3ayJ+qmf8SH+j/ei6aZZGywdoQfb0OL+GzLwZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PG96/Jcs6VqZrpoFOO7d4fr+8hgP9c+7Ydjha4gz5aA=;
	b=2t4+p1ZBQDg+E3xskGPO/cjXaYSsRfZOehvyv/WY7Gn+/eKiIlmNZuE9OjM0IyEzHwAm
	 tIRqm9SocbmqXRcmWOwZa0Oeqrr/659ZT4To25X8ICCHh2dZROt0513COQ+iyfK1OUMhd
	 w9D4r+smQtK37si9V10p21+kWjr2odNt9LCrKlqdlId13aROj6z8iFqO3NcPbiYlitePH
	 iTSvaXckUXr1z94hA1BQrZwyJ0T0ug51ZEHNiAxpEsIt8pSpIjkcSw1a/REN/NIrNh9g2
	 RlnZ88LoyrxFqcBxo4JvkM5+Bq4gL8amXcbKPKjpHQZDezQCwDwSlfUTRnRZH5EMPtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hSAWBETR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB18F606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB18F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hSAWBETR
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so14205455e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:51:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794595870; cv=none;
        d=google.com; s=arc-20260327;
        b=NUpw8bQ2VJTEjgSrA0glDyldGDSjgk+B41/l61nA/nr0raNEfuD8DmzasD6Vm8a4eG
         i2QmlS3mCueli3n63N+cCPtepJ08w7DWjBDpFRyJB+orLjnhigfC4s3agj0OHfZRQe/e
         wsOrY+mNM9yBw+7PmQohDSY6A1qp49dDtPC4pesDxbDcqwtXbCP7sd5Oxo4b9Zegrg7l
         cka6cM0Wt8aJ1xTIgmCK/JwYtnf6twGNcqoJlUI32y8vK19imcXdNOeg5YjESlBDcVIw
         Dll8DsTJrE3JHwosCxJ223TomI20c+7yC5qZWRBkl4mO7XHxXWYbBq8u8FH85MmM8U26
         tf1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PG96/Jcs6VqZrpoFOO7d4fr+8hgP9c+7Ydjha4gz5aA=;
        fh=D3A9PJ/TKTzwzTh3jtVjZrwUIlVWe60WglosgrKq014=;
        b=cwScL5QObLt495r83U63gti5etE7cAodpXXS5Ouzi+GVP56dlK/hW/p8EDMgIZCszE
         iIvwKcW3thV0FqmPn4d2cWL0z43ApQwQFQwtyITTOcsJT12SdOQP2zGLbIYNlqYMN9Td
         bHB5NaFcESHf1lmRyD8ICnKukB5VCTt55dsvX0ASGHDrvPOPAgW8ULiKKST7xv7BhOJi
         pB7e/hqlLltfhJ33sF4MP4XU6MKrKV20V+V9x90qEGR4Q9qTycPBfmBW3fjYTzwnhqFq
         P6mIW2uMm7XGH+kJlYPcIBFUc350elnBnK1ayVtXG3N4erCb+O8wNJE/cXh5fHwySPWL
         fbsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794595870; x=1795200670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PG96/Jcs6VqZrpoFOO7d4fr+8hgP9c+7Ydjha4gz5aA=;
        b=hSAWBETRKkqPK67oyLRJKiYO0TrhYJhC9rGLoSRSMCbB3NtqvaLFLO/1KtEtZgKQCR
         kl4Rt06CZf9sft4pzMC5jBe46pBoyU9i4HdZPx1a154GeZcfwCV6N3yOWptR4I/xFu0F
         IKsOWXXo57nC71HfIJD1rd9VSPPKxrEPfTcoTUBz5LJdhRWm8DXHBkrvt0Jce/PS+5Lz
         eOFfMvKdAmcZ3D72A8T7P2LJJmndLcH85QdrIEeyYeEBxkVdx2aZiSr02A+NwVQc8MBI
         rNtZISQF8Dd9OIuDthSHYhEfbo7mq7BereKBjjNptoTkMLlkeO/0FtMyyVKMOqMUm14D
         58iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595870; x=1795200670;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PG96/Jcs6VqZrpoFOO7d4fr+8hgP9c+7Ydjha4gz5aA=;
        b=21cu2/4ABsNfSJe/pg+uND5XSg545ZxaxxRy6hzF5oAxpAQ+MiKFsstjqyt+1k8y1j
         CM9RA215NIJaf+hOsE6Za5lb2toFFlHf3BWVKxFIowOrUx1wEi6XLtKs+Zm75krV3UQC
         AiokTKifh9OVGaiZAS01cbmViksafQQDGC7QCsEEUJic42c8aJIOp6eMiCm11tKSY06U
         RHVypuk8tsGBxTHMl0mcHF49Y6uPZsArETaGSbnQ88/iY25Pp1uKSoQ57ydEsMIszqko
         T3EanJjYyXWunU4kXhVl/Be7aGplqGISiiXfY/yhAXlppybIk9k7l/x6Brds9mBp3UuH
         R0VA==
X-Forwarded-Encrypted: i=1; AL+hErF0Av44EhEdXDflVYIDaEy4QWxg6tmbSiEs5nPvzLOFa7kbnIpicbOWUvIaYhunLX2FjKOJMfFyk7Wa1ik=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2xi/pZNbZmTlYQzhRC5Rwj51GHIzx5BMmvaBQc5rZUsbvzMyB
	7Z/YRsqIho9hPbu9lr8ipsvkDClSIYtD+Vp5FeHqcvfvz8aeEjduBR7aRsdjFMrW1PDI9tNPbEb
	qoM15wXDQh0Nn6DnRxThWNfWh9+A+eHGvW5+6gSo=
X-Gm-Gg: AYBFou3ar0O3fAbYFPeHgQZDXZACi2jHdi3U5AprWm/7r3VeHB2o9AfLRma99/x9dS2
	wedZgt9BwQuI77CrKHl/0tDBKq7Ly2mmOPjVJUZXDxYj1XJNN9xdfXQPg/lSoZYGiIn8xCHs/Tz
	vHkwyrXD0pNW9BeddM7JLdnOFfb8kJeSrMLX8ihZVo8ggg4gUYzlOoT8rI+n4OUCAS3mbRvqEAC
	uNdLutFyRDsDuW77OSn7RnpxrM7AIG46XWULSQ9j0crOk4BbF4NveEmqmD82efEOxkqnZH8c/3n
	a06VB4kqtl1nbHk/O5q8FW0St4M6gds0mGjTYd1vvWQoRLPawAIAJmps9w2/1ajaFEOleovfUI7
	iZKV5w5CaKZUCMthAmGgS9zAA9fVmWMnGMQZfPIsfHoCGPVZ76X2kWdzsWydNTO3LrP6Cfkbh8i
	Ic4lOjcraTdmZmZCN2Mic=
X-Received: by 2002:a05:600c:a596:b0:4b5:d95c:2380 with SMTP id
 5b1f17b1804b1-4bb55a86fb2mr37797165e9.11.1794595870121; Fri, 13 Nov 2026
 10:51:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260817131843.45121-1-husong@kylinos.cn> <CAO9r8zPqJncFKQbF3tGe1d4sg-4dLQ3dQRGze_vab26wWrXTqA@mail.gmail.com>
 <179438454803.6.16655549133383619919.zswap-rstat-counters@gmail.com>
In-Reply-To: <179438454803.6.16655549133383619919.zswap-rstat-counters@gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 13 Nov 2026 10:50:58 -0800
X-Gm-Features: AclHuK8qDdaLN3_3l5l7WveJFIgdzXS_I6AwWx-xXQnBC1wCSuS09VZUPCEPOi8
Message-ID: <CAJnrk1YzYswBKv5F3=FF_o_4Pywgw0ifLq0tXYSWO7TARnFRJQ@mail.gmail.com>
Subject: Re: [PATCH] mm: memcg: use ratelimited stats flush in obj_cgroup_may_zswap()
To: Chengfeng Lin <lin2530632123@gmail.com>
Cc: Yosry Ahmed <yosry@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Song Hu <husong@kylinos.cn>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, yunzhao@cloudflare.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 12:12=E2=80=AFAM Chengfeng Lin <lin2530632123@gmail=
.com> wrote:
>
> Hi Joanne, Yosry, and all,
>
> With existing rstat updates retained, hierarchical per-CPU counters reduc=
ed
> single-worker PAGEOUT CPU by 44.69% and whole-program CPU by 21.78% in th=
is
> bare-metal test.
>
> One worker uses MADV_PAGEOUT on 32 MiB of compressible anonymous memory i=
n
> a private cgroup, with THP disabled and memory.zswap.max=3D64 MiB. The li=
mit
> is not reached. The host is an i7-12700KF with 20 online logical CPUs,
> full preemption, LZO and zsmalloc. Unlimited controls change only the
> zswap limit to max.
>
> A matched parent/commit/parent test of 0efc297a3c49
> ("cgroup/rstat: avoid disabling irqs for O(num_cpu)") showed:
>
>   CPU time, ms / 32 MiB         Parent A   Commit    Parent B
>   PAGEOUT                       17.180     24.464    17.316
>   Whole test program            46.215     53.419    46.235
>
> PAGEOUT increased by 7.216 ms (41.84%) and whole-program CPU by 7.193 ms
> (15.56%). Both versions stored 8192 pages and performed 8192 limit-check
> flushes: a finite zswap limit forces a stats flush before each store.
>
> To limit interrupt-disabled time, the commit
> releases and reacquires the rstat lock after processing each possible CPU=
,
> with cond_resched() in between and cpu_relax() if it does not reschedule.
> Previously this was conditional on rescheduling or lock contention.
> Per-page flushing repeats these extra operations.
>
> On MM baseline 2967f3ccdb5f, I adapted Joanne's hierarchical per-CPU opti=
on
> [1]. The limit pre-check uses dedicated counters, retaining MEMCG_ZSWAP_B
> rstat updates and the IRQ-latency protection. Extra updates are included:
>
>   CPU time, ms / 32 MiB         Base A     Counter   Base B
>   PAGEOUT                       23.903     13.113    23.514
>   Whole test program            49.247     38.569    49.363
>
> PAGEOUT CPU fell by 10.595 ms (44.69%) and whole-program CPU by 10.737 ms
> (21.78%). Stores were unchanged; forced flushes fell from 8192 to zero.
> These two comparisons use different baselines.
>
> Both comparisons used fresh A/B/A boots, two warmups and nine clean
> samples per condition per boot. PAGEOUT return drift was 0.80%/-1.63%,
> with maximum within-boot CV of 2.82%/3.55%. PAGEOUT measures worker CPU;
> whole-program CPU includes preparation, re-access, verification
> and cleanup, but not external cgroup setup or host-wide background work.
>
> A single-worker unlimited control changed PAGEOUT/whole-program CPU by
> +0.41%/+0.86%, with PAGEOUT CV up to 4.74%; there was no clear difference=
.
>
> A supplementary A/B/A test compared the MM baseline with the counter
> derivative, with eight workers pinned to different P cores, each processi=
ng
> 32 MiB (256 MiB total). Their shared cgroup had memory.max=3D2 GiB and
> memory.swap.max=3D1 GiB.
> The zswap limit remained 64 MiB; compressed usage was about 18.75 MiB,
> below the limit. Counter-kernel means follow, with baseline-relative chan=
ges:
>
>   Eight-worker metric, per 256 MiB   Finite limit          Unlimited
>   Summed PAGEOUT CPU                199.238 ms (-84.04%)  196.272 ms (+1.=
17%)
>   Summed re-access/verify CPU        215.365 ms ( -1.36%)  214.950 ms (+0=
.09%)
>   Whole-program CPU                 663.404 ms (-61.39%)  660.535 ms (+0.=
24%)
>   Whole-program elapsed time         94.618 ms (-58.26%)   95.183 ms (+0.=
99%)
>
> Both kernels stored 65,536 pages. Finite-limit forced flushes fell from
> 65,536 to zero; unlimited controls performed none. Counter-kernel PAGEOUT
> CVs were 4.51%/4.91%, with baseline return drift of +5.10%/+0.97%.
> All nine finite-limit counter samples were below both baseline groups,
> but baseline drift limits the precision of the gain estimate.
> The small unlimited increase does not
> establish a regression. Re-access and elapsed-time CVs were at most 2.81%=
.
>
> Elapsed time includes preparation and cleanup; it is not summed CPU time.
> The re-access metric includes reading and verifying the data; zswap
> decompression was not timed separately.
>
> Both kernels passed bounded leaf/ancestor-limit, dynamic-limit,
> cross-CPU-freeing and cgroup-offlining checks. Deep cgroup hierarchies, C=
PU
> hotplug, and 32-bit systems were not tested.
>
> I hope these results help assess the benefit and update cost of dedicated
> counters while retaining the existing statistics. The reproducer sources =
and
> the measured counter patch are attached.
>
> [1] https://github.com/joannekoong/linux/commit/9092e0057f038ffca43ae3f35=
faf58c33b1d7c9b
>

Hi Chengfeng,

Thank you for benchmarking this and sharing your results. Would you
mind using your setup to test how this compares to the hierarchical
per-CPU option?:

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 091401cecf39..d2b0db311a7d 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -6324,8 +6324,7 @@ bool obj_cgroup_may_zswap(struct obj_cgroup *objcg)
                        break;
                }

-               /* Force flush to get accurate stats for charging */
-               __mem_cgroup_flush_stats(memcg, true);
+               mem_cgroup_flush_stats(memcg);
                pages =3D memcg_page_state(memcg, MEMCG_ZSWAP_B) / PAGE_SIZ=
E;
                if (pages < max)
                        continue;

I ran a quick test on this back in August and saw these results:
"Quick benchmarks at depth=3D4 with zswap.max set at every level, 20
workers on 80 cpus:  rstat forced =3D ~7,600 stores/s, rstat unforced =3D
~300k stores/s, and hierarchical per-cpu counters =3D ~440k stores/s.
The hierarchical per-cpu counters outperforms rstat unforced on the
stores given that it removes the flush, but we already see massive
improvements from using rstat unforced over rstat forced". I'm curious
if you see the same results on your more-well-thought-out benchmarking
setup.

I don't think the flush needs to be forced here for zswap. The
kerneldoc for obj_cgroup_may_zswap() describes it as an "optimistic
pre-check" and I think it currently already functions as an estimate
rather than an exact state of truth. imo, it'd be preferable to go
with non-forced flushing than hierarchical per-cpu counters, as it
incurs zero additional overhead on updates and is code-wise simpler.
For fixing the writeback problem, we're planning to go with this as
well instead of hierarchical per-CPU counters [2].

Thanks,
Joanne

[1] https://lore.kernel.org/linux-fsdevel/CAJnrk1YO5E6ETxn9RmM-LWRQSRxwF9iE=
akAPz6veMPjaKMAEOQ@mail.gmail.com/
[2] https://lore.kernel.org/linux-fsdevel/CAJnrk1b5asARJ_g176DsoNCvf+iFqzPb=
OtVveeuPxTPZDmnuKw@mail.gmail.com/
