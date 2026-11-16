Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794801190;
	b=lP4h7OJnvKl7kfPK/Zh4lgv7C8BsYz02tk3FiWy9WbYPVnSLMEEO57FdtlpUDxgp5Pgw
	 uS1QzZaz14TZdgcGzPVEc3WuDfxgStr7g7m6wi3pngXmw8vMcBHQrhS886KPnhGRaa0uy
	 O+pQ9roK56UgLSv7k5mP5XbZIXdgaGVPBDK6AvyoDKcoHqIlymIpUaSY6To5Ivy4Bg9zx
	 QrcUeClK9hsnyoHLeOchfuGYgZfpPqqAWkfIYqL6xDhJmhw4ktIVzJDVpW3E15805BBHD
	 cMGUzohZ6kR8c/v3Y3Jk6thyN8Xe6M41Ybt/XFf+lJv7XCAIo7BpUUaqvPrbwpc0ATQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4TL7rU67dcCsld58oJYx+NVlFE0fH5IBsAjLGvpEK3U=;
	b=LWl4VJv3IWOd+RX4ohZIZSduStXMMndCuGpMCp8BAC4slVsEvhSk/aZiStGeBG+ufcfE
	 aQWpe9nN+HoCkaG/1Cqup942aZtANL61lOlXUvRPtjvpnfAm/IOu6hofOJgMkvEiva0+x
	 0vyFV/4Tks7FXF6IROntsIivxsctr1WHM47sB22nhr6moliV8zvdtrSv7GYr4K1fBVRUJ
	 0eAvDsaPdPKqP6oA44aiM+vJtZ8IW7WSqBcg2+CERkcAl+gDGoNIX0B4jiK7CyMGSW2jW
	 yOYG1BQM9Nh8dIIyDYUXTcnZupvIiOm/y6fsIl6w+wa2fA1KGc9S7nhKzK1/4BObuEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GlzZcYad;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA32A606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA32A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GlzZcYad
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b807aab44fso865432a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794801188; cv=none;
        d=google.com; s=arc-20260327;
        b=pM0Y1RUth/Hg7hI2pIRSnu2MDHmYBjoyMkRSGMi/iV96shE9g3eMPSvLv6PVnY1h3O
         eXUO+0aCRNz6yFSUJGrFiqRQ61tji4O6LS4ftX/70ttA5x2r7wyXltOlxPK1BC1IIDsF
         hPzl03a1Nw057Pg9sfS6RZ+EwsgCHduhk/tQy+5bl+6crkjLoubnyfHsP4X4m1+VMJcU
         q/g5y7U0jtPIDBtOnvzeggrsdnVhjGuLNK9xV4eMXMvYn+z+ML0JGdZ6VwL016Rz9QAh
         YGic/0Y/kpI4t+ZJtGaTo1D4tjvO/lt22VJUO1CrsRzXyHQGlWmdk2j7c1c5XmqFnn67
         Rwzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4TL7rU67dcCsld58oJYx+NVlFE0fH5IBsAjLGvpEK3U=;
        fh=rH1G4Yvl6Gd5h84d0d8lAqwVo4rHO8Z3JZGpBxmzJVg=;
        b=RVzM2nO3Z4Co7I50cMNT9J0dZqzShSjbH6hOQr4SxnA2BpTz1hPjLoTPDxEjOgNy0E
         jil6Nuh1C59lqjVh9p+aPL9bHcldwcE1gRqUhN/l2Maff1In4laspGqbKPQxNlcoMyd1
         tPdndF6vWcfLWkfilS28PplbYiZu2L8beso0kecYb3kkYKZsSJKhIMiSmDyJOj9xtCgu
         qteWiZIt4w1PWhkVAtaV3HW7QekIAUoiCjead2hpHvmepm4ei05fL9jczA3/UGu7a7PS
         jreOiWsOGB+So3S4pxafh3hVhyeur8tQtSkIznRnuCc/PRt+MJMPDk6NveXhPxYbiQcr
         YY9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794801188; x=1795405988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4TL7rU67dcCsld58oJYx+NVlFE0fH5IBsAjLGvpEK3U=;
        b=GlzZcYad9U2QnRZPbzhrgqtyZrXsxohqUj/SM0uSbG1TpsUABZ5fJPAYjVegWFbAIp
         +8qwgSPtsBd3piM4aZXoo0K68A1rwmhwqPripIdONynDYwTCrgGI93lPrOH0zm5BEU7g
         b4O5CYPelNA5FDBudn6KbWt29SuVgkavIogy5/uwGa68mJ7jVOa03pgEB/DXETu1ag9i
         mat2ly6GJ32hGzwZH/7mFTMcskfoFbHbrDlwnGAJCuDw+v0f+Aei/GDfSJmOY0v/qj34
         bUz+R2+4f6f5s8nx3RbDtVV6z20QuGY0EzMpFO3Gs0XvgtHlKEG+pg/Epdw5mEomaYUj
         H6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794801188; x=1795405988;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4TL7rU67dcCsld58oJYx+NVlFE0fH5IBsAjLGvpEK3U=;
        b=yYPmh4/PdpbKeM//gJDVZLFlSCgXBUfTKq26e2EDH65ebszB3ZAtzX5f4BJqKAfZvj
         4Hg7t3Wy7kBZhE6+LLIeyc2Ng0TwDRSJ5G3Hm7qE906uY1WAqXEHRR+zI+KONPDiMe57
         eUD+nS08W83UdXv/ciTRHe2c8nXG73j3UlZpq4R+V/5mtqy0yNtBD/7nQEmT85HLcbXY
         A7AvjW2WURj0JbhmZyBzAJ5Rd+JUjq05ycFpL9/s+lsDaANviqmthxW2hKU1u7ImkjPr
         Y4oJeG3DB2gQOWP8B4DHgs4H+6r0KS6miUHl3fO4e+hhnlyDka1Q18H6LFsd4j/4lrpT
         KRqA==
X-Forwarded-Encrypted: i=1; AL+hErH1+6L+Rf35aYtuKnQCLBkJm91U7f+Duj/KrVJN1Ci59VN1f2WnN3eb4X/rilgpMqSf+h1x3VNVX3RwTNM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VJavoB0EjqbMkKfaN7HwsVb0MadocLeJ8Ce9yTeIeQ8hJG2eK
	79fLJzQPSd/WaTy/V/5ABsZpdykngnzD1xAxQSjEuvKO0WyRuA3GDpRTYiKuaOr8MVV4HSf1nb/
	o4VjxL6vmR0UalgsWD9rX2TVFyd/pVFA=
X-Gm-Gg: AYBFou1vpgXn2gSDxyS66A2aAn7mGHKhnohQ75qzxrdg1M2bhr/1aGkLU0DikiEcP5G
	9wZ7dhNsF3kU9SQn8JargyKTAzWedzKtICqBJBs6CXyZK6tljzfESZZbP8oCaQ9R+dPhoeRxh8Z
	YLd1gSufQZExZPhA6NmNniSG35RScYzPAR1tZxibL7rxQO+xx18AMkoAM6JfLHJTg7roqNZ1e2S
	Aioo00bbagP8nD1uB0OCR1HLnT7w5wCWOPpBNcd4DLe0j4LhTyyIXUnSBwopk9k1iDWMYeMHKSE
	2FYm+ZG0Gq3jFmHh8tVHwB8NAs4r3ucI605wg6E5sJA9R174jCYiWVqUeI0H2pEKG/s240p5Qjv
	I4GsNYGET9+i4qDCoTVq1yY6bIGJWJyingkCmkLxCsL4x+ymd8GjK9fXFm5E/dCHFiWFTPg==
X-Received: by 2002:aa7:d94d:0:b0:6b6:ef7f:600d with SMTP id
 4fb4d7f45d1cf-6b7c0bdfeb9mr4989199a12.21.1794801187760; Sun, 15 Nov 2026
 19:53:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794666741.git.lianux.mm@gmail.com>
In-Reply-To: <cover.1794666741.git.lianux.mm@gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 16 Nov 2026 11:52:30 +0800
X-Gm-Features: AclHuK-rF5dWOJJFyqz4l7zmtSSFEl92bKNMjIKJVssyOdhF23YiFc9B9U-bN9Y
Message-ID: <CAMgjq7Cq5OQWdompBbEpyJTG3PhtdSLFUdb_Dtht3qH+u5HVhw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 00/18] mm/swap: introduce priority queues for swap
 device allocation
To: Lian Wang <lianux.mm@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Jihan LIN <linjh22s@gmail.com>, Kunwu Chan <kunwu.chan@linux.dev>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Thomas Gleixner <tglx@kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 10:48=E2=80=AFPM Lian Wang <lianux.mm@gmail.com> wr=
ote:
>
> Hi all,
>
> This is v4 of Kairui's swap priority queue RFC [1, 2], retaining the
> original authorship. It separates device selection from device-local
> cluster allocation to support integration with the ongoing swap tier
> work, while preserving existing swap priorities, the swapon interface,
> and memcg swap accounting and limits.
>
> The global per-CPU cluster cache couples device choice to cluster
> locality. Moving that cache below device selection gives each device its
> own allocation hints. The available plist's shared rotation is then
> replaced by a priority-ordered array of same-priority device rings, with
> per-CPU starting offsets and quotas. A task-local cursor keeps each retry
> walk stable. Rotational devices retain per-device sequential hints shared
> across CPUs.
>
> This remains an RFC. The current scope is global device selection under
> existing priorities; no tier ABI or per-memcg device-selection control
> is introduced.
>
> The series is organized as follows:
>
>   01-04: Parameter/error-path cleanup, device-state boundaries and
>          iteration helpers.
>   05-07: Locking, writer-serialized publication and accounting.
>   08:    Restore per-device per-CPU cluster locality.
>   09:    Keep cluster metadata population out of direct reclaim.
>   10-11: Introduce the safely published queue and remove the avail plist.
>   12:    Bound order-0 synchronous discard outside the allocation reader.
>   13-14: Preserve priority-aware throttle selection while removing the
>          active plist and unused plist_requeue API.
>   15-18: Reuse reader capacity, advance cursors directly, bypass singleto=
n
>          rotation and redistribute reader phases on membership changes.
>
> Changes in v4
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The device-disable and discard paths have been revised following the
> review of v3 [4], including Sashiko feedback [5, 6]:
>
> - Complete writable/off-list/availability transitions before releasing
>   the management lock or topology writer, including intermediate patches.
> - Run bounded order-0 synchronous discard outside the allocation reader,
>   holding a live device reference across I/O, then restart selection with
>   a fresh cursor.
> - Handle discard queued by late reclaim scans, with at most one
>   synchronous cluster discard per swap type for each order-0 request.
>   Preserve large-folio same-priority retry and split handling without
>   foreground synchronous discard.

Thanks for the updates!

>
> Rebase
> =3D=3D=3D=3D=3D=3D
> The series is now based on mm-unstable 24231596edf2 (7.4-rc1).
> The base includes 53a6f71c147a ("mm, swap: stop cluster list scans once
> swapoff clears SWP_WRITEOK"), so the former standalone scan fix is no
> longer required as a prerequisite. Its si->lock serialization of
> WRITEOK changes is preserved.
>
> The metadata allocation paths have been adapted to the upstream
> allocator-lock reacquisition and publish-after-revalidation contract,
> including -EAGAIN handling and the tableless-cluster relocation guard.
> The upstream free-cluster preference and hibernation-slot semantics
> are retained.
>
> Test results
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The tests compare the unpatched baseline 24231596edf2 with the same
> baseline plus all 18 patches, fbb87083afcc, on the same x86-64 host.
> The kernel configurations differ only in LOCALVERSION.
>
> The kernel-build tests follow the v1 workload: eight 8-GiB ZRAM devices,
> make -j96, and 12 fresh-output builds per revision in each of the 2-GiB
> and 3-GiB memcgs. Both revisions built the same workload source
> (4dbe24720eb3), using x86 defconfig, bzImage/modules and a fixed toolchai=
n.
>
> The BRD case used twelve 8-GiB devices and a memcg with 24 GiB of memory,
> 64 GiB of swap allowance and memory.zswap.max=3D0:
>
>   usemem --init-time -O -y -x -n 32 1536M
>
> There was one complete BRD invocation per revision. The BRD capacity and
> memcg limit are host adaptations; v1 did not specify those parameters.
>
> Mean system CPU time, seconds:
>
>                          n/arm       Before    Queue (v4)     change
>   kbuild, 2-GiB             12     4372.4983    4417.2192     +1.02%
>   kbuild, 3-GiB             12     2314.6025    2322.6550     +0.35%
>   12-BRD                     1      143.5700     137.9900     -3.89%

Nice, but what does n/arm mean?

>
> Mean elapsed time, seconds:
>
>                          n/arm       Before    Queue (v4)     change
>   kbuild, 2-GiB             12      168.8092     169.1100     +0.18%
>   kbuild, 3-GiB             12      136.0650     136.3500     +0.21%
>   12-BRD                     1        6.6500       6.5100     -2.11%
>
> For the BRD invocation, mapped throughput was 7391.28 -> 7550.23 MiB/s
> (+2.15%), calculated as the requested 48 GiB divided by elapsed time,
> not as a sum of worker rates.
>
> All 50 invocations completed successfully, reported no memcg OOM events
> and performed swap I/O. There were no warm-ups or profiling, and all
> samples are included. Before ran first on a separate boot; the 12 builds
> are within-boot repeats, and the 32 BRD workers are one invocation.
>
> The kernel-build runs show small increases in system CPU and elapsed
> time. These descriptive results do not establish equivalence, absence
> of regressions or a stable performance gain.

It's worth mentioning that the global cluster cache is gone, so tiered
allocation will have a much better performance.

>
> Cooperation with swap tiers
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> Device-local cluster hints remain below device selection, so a future
> tier policy can determine the eligible candidates before those hints
> are used.
>
> The current revision keeps the refactoring under the existing global
> swap priority model. Integration with Youngjun's tier infrastructure [3]
> remains follow-up work. Device membership, swapon/swapoff publication
> and lifetime should have one agreed authority. Within-tier priority
> semantics and reader scope need agreement with that work; this series
> does not define a competing tier or memcg policy.
>
> Youngjun and Chris, I would appreciate your feedback on the integration
> boundary and ordering.

It seems the sashiko review is all green, which is great, let's hear
what the others think about this.
