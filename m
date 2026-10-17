Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4716F380FCA
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792253996; cv=none; b=coMQvu1lB6IoaTc2nVTnE3pRhYyg7X1HRPorsMSoSIqmB0i02NRLIH7Rn9lvIvrf6AuvCpYI8Dn3/DkmuJWHbHEtl7k+3W+2jR2nknpjSpWga3V2xSA/j/L2iWnBbxyp6h8VhD2Q10NTs2No8y5BEFF8QzhGn97V3qHIM4+DFLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792253996; c=relaxed/simple;
	bh=DaLhUwJQi73OokPqWwwSOIt4mf54hNVxby00V0i+MVg=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=E/tD0RY9r/WcZypLjAvj5yVyzq8CtgpUmkqiRgDgQPpeSQJPtEWXg/j+NujeKuOJHJg84cLeumaODoUC642Jogs2/SMw0Yi1nnZJkVke/buz5wdijwDa+qY3FmdbfXMhZDQsj+Z3iQXHY5Ru924cwMFmwG/iBodFnVL1QhKd6EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ubyZ2Wrq; arc=none smtp.client-ip=109.224.244.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ubyZ2Wrq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1792253980; x=1792513180;
	bh=yaDAKbPnX3HpuNTDLAnNxcR/jGoyDFB1q+z6ycJjZa0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ubyZ2Wrq4LqZ5/7guNFCrqMzJvxMK8RL1PM5Vyn+aJD/wnUfKHsvu3qY30yjfCtsc
	 ZJgPhlX4eGlz+YCTHrfY9wN4q6M5wegRj6Gj/jS8fRSdTQ+ndNX6BzXKDTsZ8JGH70
	 z1LVnkCD0HzH/Y9r8/Z7GKAfZywq1aSau2iG5Ns2AbDcCkTcYX3EtwZmAu41iCodNS
	 LsnD8wlB/PXH9bzbrYOc34BGNTw+MUMrPvCfbGqERv1q0HIN1vXUDjjX6IA4kJ9UNk
	 Y7cRl8abz+ychT2UCfOeTZa6IyXfSIE12CtGNi76uYO9qBaZNdRyJcmYp/jslqe0Wy
	 NgcP1cXzTvOyA==
Date: Sat, 17 Oct 2026 16:19:31 +0000
To: rppt@kernel.org
From: BernardoGV@proton.me
Cc: sourabhjain@linux.ibm.com, pratyush@kernel.org, graf@amazon.com, akpm@linux-foundation.org, guodongtai@kylinos.cn, pasha.tatashin@soleen.com, ritesh.list@gmail.com, kexec@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kho: fix global scratch size calculation
Message-ID: <d4c253f3-d36f-0253-f22d-43c9f397f6ad@proton.me>
Feedback-ID: 60703638:user:proton
X-Pm-Message-ID: 38ba154f675276b492e436a3eb2d748b1c610ceb
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026, Mike Rapoport wrote:
> I mean more fundamental code refactoring that takes into the account all
> cases (and I could miss some)
>
> - NUMA vs no-NUMA
> - systems that have global scratch containing lowmem scratch vs those tha=
t
>   don't
> - and of course fix global scratch over-allocation

One more case for the list: reservations made before KHO sizes scratch
that are never served from it. HugeTLB is already excluded. crashkernel
is the other big one. Sourabh mentioned it in the powerpc thread. Here
are x86 numbers from a machine that never asked for KHO.

Ubuntu 26.04's generic kernel (7.0.0-38-generic) ships
CONFIG_KEXEC_HANDOVER_ENABLE_DEFAULT=3Dy, so scratch is reserved on every
boot. (26.10 has since turned the default off. I've asked for the same
in 26.04 [1].) The machine is a single-node Ryzen AI Max+ 395 with
128 GiB and no hugetlb. kdump is set up the stock Ubuntu way, which gives
crashkernel 2048M high + 256M low.

Three cold boots of the same kernel, KHO on by default:

  kho/out/scratch_len   crashkernel   no crashkernel   delta
  lowmem                   760 MiB         248 MiB      -512 =3D 2 x 256
  global                 8,510 MiB       4,414 MiB    -4,096 =3D 2 x 2,048
  per-node                4,338 MiB       4,338 MiB         0
  total                 13,608 MiB       9,000 MiB    -4,608 =3D 2 x 2,304

"Memory: ... reserved" goes from 18,849,832K to 11,771,924K. The
difference, 6,912 MiB, is exactly the crashkernel plus 2x crashkernel of
scratch. With kho=3Doff it is 4,915,232K.

Both problems show up here. Without crashkernel, lowmem + global is
2 x 2,331 MiB and per-node is 2 x 2,169 MiB, so on a single node about
2,169 MiB of reservations get counted twice. That is the over-allocation,
and the total comes to roughly 4x what was reserved. crashkernel is
allocated with NUMA_NO_NODE, so it lands only in lowmem/global, at 2x.
If I read Sourabh's patch right, it would count NUMA_NO_NODE only for
global. On this machine that leaves crashkernel as nearly all of the
global scratch (about 2 x (162 + 2,304) MiB).

The cost is not only boot memory. Scratch ends up MIGRATE_CMA, so
anything that pins can't use it. Here that is amdgpu GTT on an APU. A
single process tops out at 107 GiB of a 120 GiB GTT limit with KHO on,
and at 117 GiB with kho=3Doff.

Happy to test patches on this box.

[1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2171297

