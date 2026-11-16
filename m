Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794838440;
	b=vIHw2BoCVQabIOkdpfTMg/4+zXd9MaqxoP9SjKPYnjGrfdnCL5d3tRPfVK9QSqTI3EoH
	 tZ2INmAVvFfa0t7uhmC+K5H8w5RofqAk1NM8wVM3zjbs02hw5vUloyebFPovpg1+fUJ3n
	 qFwezMCEkWN7yXq/aVuAF8nwIdcREN8GrDI0M06qvagkBBCd/fGrnG8rPXHL2GAj2qRfg
	 5+L9nUO0S5qRGhz7KVQcAE6bwCRwe7y7XjSJviFkhoaAKpuadGSls0pGRnhfxNkSaZJ5Q
	 geOb4GUYCyN1P2EstTnyhAl1BURac6lJCXyU/ine04STXRdik/3ahSmWn2GG/XZh/VQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mE4PFLCBDD7N+5kMo0525pvsFFzxkaRFBGntpezo6s0=;
	b=AwVn0HHrlIWoKDruThC1fybAZ1jrhVPOY+lZrVGwQKuQsQqPddYUlVaTVxNLmh5Fwpss
	 buxlvfsT1yK2lSQXLYaIP8K177XQXrNMGlFXY2bmGs7cMRFpXerPK7Rfp3pxYp+YLL0+w
	 qpvKTuB3jELGDX/8v1HHgryxQ0/SUAfymh5LxCsmVaxQuwdwhbqKzauHFinJ1KMTorI+O
	 HKzlCKqUr2c1JMRA9m+hokgmSttkWG29LzGsYzoBy6Z6PIW4G1TgD84seFDJfeOAbz7Ei
	 iMxN/cqPYjThOKgyEuge3UaiV+Ni7kNEJEamnxV/Hsj/ZtbGCTWrBbfCJH3VGcEBcHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NNbLYEE7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB829606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB829606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NNbLYEE7
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49412eb1474so1727040f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:13:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794838438; cv=none;
        d=google.com; s=arc-20260327;
        b=qeS8Dfmh1zwR7AOcjDBLIdaww0rH7L7R/spZNIJ86vlz6KjQscBiJzt5MlMqaL7jP6
         dd435UHxJqY4yNjasiYTWRwl57Nz1biDVOay/442C9B5DFcwJzxlTmYIf/XKHQZchyin
         WK+aB1I1N6FNCc6+K7l+SI/FMcjg00RHx8UhXRbxzfKbKsQ0fPF4Z4UoOEXycFNjB5xA
         QisT27jwxHyFLjzXFwF5rdn/j9e0cNoOAYvzv+jf1QoNlsiEc3ZS1s9GlB5rdwUC4Tzv
         Q9d39Z31XpanhNXw8EL+XCCg+bQLsgJ8h7yNBfOmcnxmmw5tisQoZDMuPdqThBDrGlLy
         7iJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mE4PFLCBDD7N+5kMo0525pvsFFzxkaRFBGntpezo6s0=;
        fh=dZsGuXMsukFv8weVhYwJJCuv4uWzcUNUDWT5xwZZmRA=;
        b=UyuFoIoqaEalHHUk4VXvhNZyUFzZWJvmElRSkXDJyI20ox1R+hkhO3faWK2vnawMFO
         xjgv7CflsjDpgoryVpsM6NdugOE+P5tNzXeIenotRhNfXgI+/TO0KAU1jE1rryJt4nlN
         fLcXFG+tuDyBmn6yU/rHeFt6AkbZzktjnmlrseMfLc4xpg0DHWqJ1pTnKbEGUFta+86G
         udtODwcPSn2btINh06BYYh5d309exE2N/nC727Wmmcxe5ddtEbc4BJ+sAaJ9HE7KGrs9
         79NHl34TXcMYfXMZ2UJ5vNtbZIOhUYsw0e5mP7yL8lfV9MHLlx0wAlGNcLSDlIhZfiEo
         orJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794838438; x=1795443238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mE4PFLCBDD7N+5kMo0525pvsFFzxkaRFBGntpezo6s0=;
        b=NNbLYEE7oDLii472gysZjYrI4ucISl9mt96P2z/OGqu/ZsjrYEr3uHaHVzcWUzTo0A
         14D7T4RowjUPGjFvGQ7alC4pgUtLTkMqIs3x8bhCHzouXVTdYjWp+lXePnr08spveTYO
         JtKuDMpxbF3Q13fLACjnvLTxZS/gqxteZtAaViITZFrq67ZMUG0ZrIeq+z8gS0NnL3du
         GXuMgo8XKyFkQvOaB1GgAmfPB9N6X3a+pcmZsZStl+7q8wuD8PFaFKao1MoC2NuLyWcV
         EnulOQYHtZhbPhaWBV3WVbccHCKL4yShukgIgYxPV41D204POa7FzhWg3RgnqK+rYsST
         VscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794838438; x=1795443238;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mE4PFLCBDD7N+5kMo0525pvsFFzxkaRFBGntpezo6s0=;
        b=x65lT4jeq04AaLXvF0QRsaBg4XQRBcFmOyc2WOTNGw2R1s1Co3uMzIvG21zupk+Zus
         d52S0gOltXxKs0yyJG24ZKyco5IlNp3H5oYdJRzfv1LV21jaYS+QdN9pu8JZUsyFzXE0
         1+lp22TMq7w+6D+g5Imd0NAdxTOkYJmgI9gWJlnUMILCvUfMvZ+8dz8b/V64jfxpyX3c
         1xsHph3QdNrjzyZwpgWwjxwhxb8Q5yFnRuUbO0gcVpv7OI6s7Ex4fkpy8iOCSDHwlKvv
         D/ntGI43peI3I8appMnSPoRnOlSghfHkAOy4nVy5P2uS4/yJC+5SVFoISqy67RQhfcru
         SjXg==
X-Forwarded-Encrypted: i=1; AL+hErEtaDgyrpLSjp90SuDTsMap5zzgXCQwKwx4P+Hrli2vpTcxd4IJvzeuSQLjJ4SXlrEDvSaQISyHKVyGfKM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AA7qR9042GD7QEz9pIZzDrbyTSxLTNQZ7RDPDx1hUAQnjmdYW
	tD9A1Mm4s/IIThZupvWbnTSx4x4hSaOHi4OpC/ZZ4NFSrnW49bMjN/8bb4QE8rJpRiD58Aio00m
	0aLiCt85RaJF7VYvmNW960TuUbmny4oM=
X-Gm-Gg: AZFdTZdslYWCzGUIYEZpN9rHUR9ErB9iTOPflFghmqiT9NecgDz5hwcH1Tu1nXXX077
	xIJHwTBAbtZTYBZoXDF+lMoH7t4kvoiR9mLIxg2O22QsidOehpEIBiTCa6sht+wyu543KEd8+w/
	ArCT71ZVMLuUNhXMIBoKk7JyZfuer96626Ch+2pNDHJHpR5OuzlEAAqQf2FsBi/KRMcNQWIKTfH
	q0bdwyBvq41rEZvagDzmSiBS8YQ/s0zviDkTTDgQkXeqzfhCbbkbpwkStlHMfHuBY28rXDi8EkP
	JnCcko6qXAZAf+SOiMt5i1fj0n/FP45ImNdrblKKZmzN0h4OdXZpA9HKXXdjMW66KvQOK6icoXf
	vpQJhcO+D5t2ypdPLxiJAE8hkwGbC7mszv+4KeWHZLrkBhVbQfpvMKzo9DFiuXoe5hT7OaEk0Fy
	Zn8aRl7UIO94g7uJLna7BU2mfcqE5GaCeFRWSOST6QRU6eazQCXykWFz4=
X-Received: by 2002:a05:6000:29d6:b0:48e:d7c:4bc8 with SMTP id
 ffacd0b85a97d-49dad032b01mr11487696f8f.7.1794838437977; Mon, 16 Nov 2026
 06:13:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116110122.309748-1-nakixii@gmail.com>
In-Reply-To: <20261116110122.309748-1-nakixii@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 16 Nov 2026 06:13:46 -0800
X-Gm-Features: Aa3M54omNEMN1jWto9qZ-fJE2BPU-EGOtdYeDpXDgUWMj8prRt7WmPFciW1q0iM
Message-ID: <CAKEwX=M64ZmMLBRiAQ6FiiP8f=jkA4m=HM8rgQo-cir2SENPnw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/16] mm: add in-memory compression of reclaimed pages
To: nakixii <nakixii@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Yosry Ahmed <yosry@kernel.org>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Barry Song <baohua@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>, 
	Suren Baghdasaryan <surenb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 3:03=E2=80=AFAM nakixii <nakixii@gmail.com> wrote:
>
> This is a proof of concept, posted to ask whether the approach is worth
> pursuing. It is not meant for merging. The series is based on Linux
> 6.12.23, not on mm-unstable, and has not been ported to the swap-table
> and zpool changes that have landed since. If there is interest, the
> next version will be rebased onto mm-unstable.
>
> memcomp stores reclaimed anonymous and shmem pages in compressed form
> in memory, using the kernel's compressors and zsmalloc unchanged.
> Reclaim replaces the PTE, or the shmem page-cache entry, with a
> swap-like token that names a 16-byte slot. A fault on the token
> decompresses the page and maps it again. No block device is needed. If
> swap is configured, cold entries can be written back to it. The sysfs
> interface is under /sys/kernel/mm/memcomp.
>
> The implementation uses 16-byte slots, a separate owner domain for zero
> pages, per-key storage and bounded metadata aging. Memory-cgroup
> accounting, cold-page writeback, asynchronous compression, precise
> residency reporting and mincore support are separate patches.
>
> Refaults follow stock workingset accounting. The first reader claims
> and clears the shadow under the slot lock. Feedback runs after
> charging, outside the PTL and slot locks, before the page is read and
> installed. Consumed feedback is not restored if the read or the
> installation fails. An mTHP uses the shadow of its first base page and
> clears the shadows of all its pages. Swapoff returns payloads to the
> pool without building user pages.
>

What's the motivation of this line of work?
