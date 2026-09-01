Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FE9436BF4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788232029; cv=pass; b=dn2tyWjVqB3o/OX/T6cggSNp+GB2GpmvJY+vOcvFE1eFyuZ8uq6BPlqX4jM0eDS/AHOo946U/CWnu6n8yoP6UCoxWJtRhLDg5IjJ3GFAL5OziXeZDinHDnsR2sdf6AzYoGASyZMVt/0FMHkfX5Mj8MmNcgpfjmbFU9un5AJonkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788232029; c=relaxed/simple;
	bh=E4g4P4Uas1wvhY+7wxoHD2a+ao0SimGdN25hIT/0+HE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XxzaFThzWPx28xMBB+Nrmi8mWI7Ogvo0IyEeehGS2vTPCVDD5e84rLrp1xPLvqd2aSTd70WRKBxgJK9r2QyZh7bAZzs0R4UHpjt5PxiWjw13cXt9ZZpzekU7tx3bypAjIEi3HzQqqgam6ZvOa75jR6J4XAiZJegF7BbJmYG1T7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E3sDJvxM; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E3sDJvxM"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso547857a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:07:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788232024; cv=none;
        d=google.com; s=arc-20260327;
        b=OXFMSkodcn9yEthhkR9pB5bJGT/po7eu/mz0woqU8eeZHfr8JZjy8f9NHPSHc+FRt6
         EeGNioL16hxm84ltDuuWauZzmielDPTfREMEubzZbFxm94ZMuv++zm3PDT/scrOgR+2v
         ttisvM6t11BBwSUoXcsLRNUvPRUBEd6UWMvWxHuyOv7s3lV3/9kQJLymTy4mDLpxyCQj
         aVrzS5FoHEfbbilok7qLFhnksxuFiOgaFJ1RJ16bFBuSEp68mrwCef3ivO1xzhhRXG1F
         7ZfpCTjbhkf1nE9xbHW6rVaSln0lEii+KPpoYxK623dhkFeJ5724JhIy4QinRkX917V/
         DRrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rV+PXaukkYgPfD2pL8aBLAu93sZ0O6nrJKBecZuhC4U=;
        fh=vsMcfi6xz7Szqkq9xxyHHI0Z0MDk05ZU9Eu+Ri6Qme4=;
        b=mr1Hi+ApTWwNDHn7unvd9uxMXyGc+RJ4WVV3bAgZQxUoUA4F+8Zw0zVosInVHlkTZf
         TDKT0Efdaw1Yc35oeKlGnq81JA7GSzWTwlX4Z2HACKNXwd/CJrVIS8CCzWOQ0ZdNTspu
         Ow6dyNoE7b/kYuoMXnHVmGBdxgCF1h5ruwIIRBLcK2ip56OZen7IZ6gVn0bt693TvKNL
         eOM/DhH2z94QPWMhdijQDiKPeCAnrEF/d0lW6azkZhFdhlF0ZABHoNq/mTgKc8s8LCJx
         nO/lN1wjOaoFL0WrFOugZPzIuFJaU4GC/0eufvvNjzOzC9Sal24dW6U9q5at2qr6+I41
         2dyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788232024; x=1788836824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rV+PXaukkYgPfD2pL8aBLAu93sZ0O6nrJKBecZuhC4U=;
        b=E3sDJvxMdUYqTFahEgzEDxdwPRUnbZJ4AFSBtrbAcr31uGZtIp8CPW1zuPAdI7UlXk
         ffkPBYqPWRAtE7c1KegrqFx+uq4dY5WUHtbjojAWfEqErWiw6cBrVKDfyljE40VfQhSx
         cayHRsPuwDdpXb/odQZ7uqHCFb1RUKNl7bGFD4Qc36Gb30F4cuWe/wczYKz0/Wdu6zIx
         9l492pndZtH+AqioVUML5ttI/zDsWfdT+k2BVzn5xDgEJ8WFagYGFyyU+h7oBI4mAGW1
         5i7S+T0ZmrVsxX9HjwZQbwZ7n8hCKe0SKkLxMRkxPudhIh8Pl48szQDr+KJThM3GMgVZ
         0gWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788232024; x=1788836824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rV+PXaukkYgPfD2pL8aBLAu93sZ0O6nrJKBecZuhC4U=;
        b=Q5K2edMcedIWvwWVUVwroS+9C6mzh+BQ+KG2fbijiVZJ8brCSto2rc0rMncPos04eN
         trbnKqNlb64ahFfYbuul5tgCsndKJXJZkwl37NcBNeiM7ILoLlCwyk4BHOKZDOQqk/po
         fxkpkya8qeb/PEymfvxDEckq/AZ8ou8FOamengZCBx1rUg+GYS4/nHJ1ZQ8xnrsBAWbT
         Pon2SgdgaXvU7V4qscWyELAEtYwGR07nx/tnSSzL6mkH7OfxTq0OBp8MSCxdXV2moASS
         zT1jwFgZOJxxzXiX0oDecNlh6JkryyRXWg2212qNK/UnDqsz1Oau3xjxE/jwicBWz+8P
         pdtQ==
X-Forwarded-Encrypted: i=1; AKwUvByY0IYYMDSEmoRkXRMPI2K+O8pkcDt+L5WsZLXvZVT9RZHF5UOlLY9S5WKo5NjDNkTQdOXcf+ETdowbDN4=@vger.kernel.org
X-Gm-Message-State: AFuF++ln8FmbBivbs7FfcfaOLhBeo2/gA/QLt+/ryF8P8R2sLGC8jclN
	jrW0NV/mavD/NV7eq6BQy4jQLVVnoTHcHKuqdIK1UuC4dHaH3jG067RIkV0yi0yJzeI+SjcS1cV
	jLd25gToIC3xZWcCPlU/czFsb23VK+WE+l1dw0Gsw
X-Gm-Gg: AYBFou1hyzsr1dPr0IU7J8eE/Dee/LcseO2T16nBG16nxn7HSFeepM6H1O4wpMKsusg
	awE2GkFHiE0i0X/eRHJ6Rk3vqW8MNCzqH82VRVdeDMTZZT5NYlvcl1ZzNd70FiplSz3pm8PDxqX
	YZhaLQObC21BBooy6FNXzkRuIwhbQIFdsLjZUbQ85kgkMz4h2XOyVmQIvJOulTwO31wBAL+6gBt
	SFfNvoXOg8D5HoA52uMO06NKSkgd0Gcwr0e19C8Zvn+GEAsoEay2nMtIsdQWQvZwGkT61hcJXeD
	+TyDN3V7ChAFcU2ORs/sgPTm1WZe3E/JIAokQKwbHCT9PqyHTGpNoNMuqyNXGCWS/7ai4sVR4Yb
	hxs0LCFtaAoBBCgFDEbGneAt49SXlMye+qQjTUT2+b/o07RnfXEgNaLQdsiFeFvzO0EmYDB13hN
	gGPQ0bezzfQph4
X-Received: by 2002:a17:90a:dfc8:b0:398:e1f4:bda1 with SMTP id
 98e67ed59e1d1-398e1f4be7dmr17139214a91.21.1788232023587; Mon, 31 Aug 2026
 20:07:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901024234.135119-1-ruanjinjie@huawei.com>
In-Reply-To: <20260901024234.135119-1-ruanjinjie@huawei.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 31 Aug 2026 20:06:51 -0700
X-Gm-Features: AcwNN1XRAJ9GG1DVk19njfLqbrvAH3RJBW-j57vaqgr-CsIXWc1aNtkHXfR6rkM
Message-ID: <CAAVpQUAR93t6CDrUzXt-v9qECSFHwYoofR4qinV5mty6LS7mJA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] Convert barrier pairs to acquire/release for
 better performance
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, bcrl@kvack.org, 
	tytso@mit.edu, adilger.kernel@dilger.ca, libaokun@linux.alibaba.com, 
	ojaswin@linux.ibm.com, ritesh.list@gmail.com, yi.zhang@huawei.com, 
	sforshee@kernel.org, pmladek@suse.com, rostedt@goodmis.org, 
	andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk, 
	senozhatsky@chromium.org, akpm@linux-foundation.org, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	willemb@google.com, jhs@mojatatu.com, jiri@resnulli.us, kees@kernel.org, 
	cyphar@cyphar.com, tglx@kernel.org, sdf@fomichev.me, nb@tipi-net.de, 
	liuhangbin@gmail.com, da-x@monatomic.org, jeff@garzik.org, 
	linux-fsdevel@vger.kernel.org, linux-aio@kvack.org, 
	linux-kernel@vger.kernel.org, linux-ext4@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 7:42=E2=80=AFPM Jinjie Ruan <ruanjinjie@huawei.com>=
 wrote:
>
> Hi,
>
> This series converts some existing smp_wmb()/smp_rmb() barrier pairs to
> smp_store_release()/smp_load_acquire() across various subsystems.
>
> Background
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Many architectures support load acquire and store release instructions
> which can replace explicit memory barriers and save cycles. As noted
> in the ARM architecture reference [1]:
>
>   "Weaker ordering requirements that are imposed by Load-Acquire and
>    Store-Release instructions allow for micro-architectural
>    optimizations, which could reduce some of the performance impacts
>    that are otherwise imposed by an explicit memory barrier.
>
>    If the ordering requirement is satisfied using either a Load-Acquire
>    or Store-Release, then it would be preferable to use these
>    instructions instead of a DMB."
>
> On arm64, a typical seqcount [2] read loop requires 13 cycles with DMB
> barriers. Replacing the read barrier with smp_load_acquire() reduces
> this to 8 cycles on an Ampere Altra.
>
> We also observed significant barrier overhead while profiling Unxibench
> syscall test on arm64: a single getuid() call is ~8ns slower than on
> a comparable x86 system, with the dominant cost in map_id_up()'s smp_rmb(=
),
> which is a DMB ISHLD on arm64. Converting it to smp_load_acquire() allows
> the use of LDAR, eliminating the measurable overhead.
>
> This motivated a broader search for existing barrier pairs that can
> be converted to the lighter acquire/release semantics.
>
> Changes
> =3D=3D=3D=3D=3D=3D=3D
>
> Each patch in this series targets a specific barrier pair where the
> publish/subscribe pattern is already present:
>
> - Writers populate data, then publish a flag/count/pointer via
>   smp_store_release()
>
> - Readers load the flag/count/pointer via smp_load_acquire(), then
>   consume the data
>
> This preserves the existing memory ordering guarantees while allowing
> architectures with native acquire/release instructions (e.g. arm64's
> STLR/LDAR) to avoid the cost of full one-way barriers (DMB ISHST/ISHLD).
> On architectures without native support, the generated code is
> generally no worse than the explicit barrier pair.
>
> The conversions are mechanical and no functional change is intended.
>
> Testing (arm64 Kunpeng HIP09 server)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> 1. UNIXBENCH syscall
>         Baseline: 715.27
>         Patched:  718.83
>         Improvement: +0.50%
>
> 2. fs/aio (fio + null_blk, 4 jobs):
>         Baseline: 1441k IOPS, 86.46us
>         Patched:  1452k IOPS, 85.80us
>         Improvement: ~0.8%
>
> 3. soreuseport (wrk, 8 servers):
>         Baseline: 162.6k req/s, 452.5us
>         Patched:  164.2k req/s, 449.4us
>         Improvement: ~1.0%
>
> Both improvements are consistent across runs and align with the
> expected savings from replacing DMB with LDAR/STLR on arm64.
>
> [1]: https://support.arm.com/documentation/102336/0100/Load-Acquire-and-S=
tore-Release-instructions
> [2]: https://github.com/torvalds/linux/commit/d0dd066a0fa26d55c19ace9e89d=
edd9504c5bcba
>
> Changes in v2:
> - Fix pre-existing issue for ext4 and 8021q [3].
> - Fix missing copy_mnt_idmap() udapte [3].
> - Drop nacked isotp patch.
> - Add test data.
> - Add Reviewed-by and update fs patch as Jan suggested.
>
> [3]: https://sashiko.dev/#/patchset/20260825095422.3166067-1-ruanjinjie%4=
0huawei.com
>
> Jinjie Ruan (12):
>   user_namespace: Use acquire/release for nr_extents synchronization
>   lib/vsprintf: Use acquire/release for ptr_key publication
>   fs: aio: Use acquire/release for ring->tail publication
>   fs: Use acquire/release for fdtable resize synchronization
>   pidfs: Use test_bit_acquire() for attr flag tests
>   super: Use acquire for SB_BORN check in super_cache_count()
>   ext4: Fix out-of-bounds read in ext4_get_group_info()
>   ext4: Convert group-count barrier protocol to acquire/release
>   soreuseport: publish num_socks with acquire/release
>   net: sched: act_gact: use acquire/release for tcfg_ptype
>   8021q: Fix data race when publishing vlan net_device pointers
>   8021q: publish vlan_devices_arrays entries with acquire/release

Please post networking patches separately with the target tree specified:

  Subject: [PATCH vX net-next] soreuseport: ...

8021q changes can be posted a series.
