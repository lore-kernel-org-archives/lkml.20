Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357378;
	b=GTMO4QsswhVVvkhuLuOcaBQjx+ZjbZz5YkneYpF/VEvMAhKZG3fP4qjCAIuum9ekIpID
	 qXDdouj4Z349cc21+gAjanW4R9DCj1owRitwHDavwOZGJHwP2TmyuzBOkrweDJz3NAQS1
	 EKjWVhZrvWGs4KL472EoTivnVymxanGhPtFi87UYkuWvDGZtMT+NAYumAM4YsL/HIhysF
	 ywYQ92rJgAfS9unAQAgXAYeH2KJTes7bbIoxrTFJETIgJ0adrA2vpTZrduSQ2yaWWPjDY
	 NXiPqa16586i/rtXo8cb33+wbSzd+G8A+2HTJjh5PqMyH0P7mv6LK+s7eA783/L7r4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357378;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ge8hADgfac7MKFfaAfAW05gt3hYkAz9wTRvWiuoBv98=;
	b=i5Zmpiz2dvKhfEP6C+DeA0biUrFeBaogt+vhmaSP897O5XRq39Qxt1a4gNC9RsOBd0dm
	 yyx/yJlTqNjmAOnlmnAW1kMUPMWzFpXiBzGAUkCUXWpwkfzrDqxLhyKNTPSM+uLAKYL3S
	 anmX+Fl+11rtc1m+crj+kcngzoS9ApwfuQHpdyApsb6fIRk4wzrNH9jgBmAw+ewnrzGnq
	 tghSJduYC3tmZqwKkEcfAJlacdPSENK39eWk4A1L2BJ2cNgctuPkgB0blrIYO4C1hx+Im
	 WXvYeZklB+eeX/kfqmXX/anmDxtqnBmZSBH0tCdDJ0fdboV0BL5Di9Ql8bzTqNs34gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MduejGOR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87212606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MduejGOR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B3491F00A15
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793357378;
	bh=Ge8hADgfac7MKFfaAfAW05gt3hYkAz9wTRvWiuoBv98=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MduejGOR49bV/g+WDvkkka5dwZR6dPDtapJ4D0FcpYj0cjsNyTmxIkBQXoxqYj3cL
	 c2bF4g7TyB/95HyAxCNAZK8coQ6VMrTERDOPIFa1y6G+gI/IWsQWN6Pc5eMAanxVN6
	 0fn6+Rpd/JHSln8pg4D54Q2x7ar3vbugqQULQLlJ/95VEnqF9T4s187xKSJbcD6ogA
	 EuhA5qaDz8UJfXtL79EywR7xdfkRHTbB2Bsc3Q10BVe2LPd/kEYh1MyJOGhD5knafj
	 vQ1sQGVmBn3w1o0af/EswCFiE80uqyuN6clERzHxJQnt992zCmHYDG8C4Z9iC4i4Uz
	 bdo2mXumBu4Fg==
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93e503815adso49063185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:49:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy3aJS+3aHV5kHsoGdumdewgkVXkj9aBLJOZDMFVQkqc5atCujQnvyVoVXHY0ImFy4NwUxjJkU4O8nepKA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDdvu29foqrqe8a3l4z5ds41kZ0FoXGOaKuaRDyKdx/RUODEF8
	xzIP5NuBIXiKZMTocDL4g6COKwczsSKMs2uELFhIANaTAhb78qgk1SyA/ksLzEHEvDfhowqeQZV
	s+/BvU65OBankPJaffzrL7eA4VOdnPcI=
X-Received: by 2002:a05:620a:370e:b0:93f:6c67:152d with SMTP id
 af79cd13be357-9442175069cmr320613985a.38.1793357377323; Fri, 30 Oct 2026
 03:49:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179248830836.1744016.8424217811286616919.noio-mglru-rfc-v2@bytedance.com>
 <0cbd219d-f69d-4f72-aec5-43e1f2d978de@linux.alibaba.com> <20261022102726.56682-1-baohua@kernel.org>
 <fc302ca3-6bf6-4bde-b3e8-8d2e93a4e4ac@linux.alibaba.com> <CAGsJ_4z9GZkpV+mpoGogma4oSX4cHy+2UDzyUQSjjOLOfekEPg@mail.gmail.com>
 <4e647816-0b8b-4a75-8777-8580a574d752@linux.alibaba.com> <CAGsJ_4xVR53NcKuN3bA6v+O=37PeQ2Vnj-8WHo6ScYH96N4seA@mail.gmail.com>
 <179307231985.76444.4463824301717648100.noio-rfc-v2-coordination@bytedance.com>
In-Reply-To: <179307231985.76444.4463824301717648100.noio-rfc-v2-coordination@bytedance.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 30 Oct 2026 18:49:25 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zvbOW3kGDZF0iXxZyWbv-LJo56W+uMM_Btk-sHRf5aMA@mail.gmail.com>
X-Gm-Features: AclHuK8XCpEGNqAtN3doj9652by5qHmAXJ7EjWFLqe_stHXIVl1CGsrIrXfddGY
Message-ID: <CAGsJ_4zvbOW3kGDZF0iXxZyWbv-LJo56W+uMM_Btk-sHRf5aMA@mail.gmail.com>
Subject: Re: [RFC PATCH v2] mm: vmscan: avoid anon scanning for GFP_NOIO with
 low swapcache in MGLRU
To: Xiang Liu <liuxiang.277@bytedance.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Bo Zhang <zhangbo56@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 1:15=E2=80=AFPM Xiang Liu <liuxiang.277@bytedance.c=
om> wrote:
>
> Hi Barry, Baolin,
>
> Thanks for the review and discussion.
>
> I've seen the RFC v5 "mm: mglru: fix swappiness behavior" series, where
> Bo's patch 14/14 addresses the same GFP_NOIO issue on top of the new
> scan-budget model.
>
> Baolin wrote on Oct 21:
> > IMO, 'swappiness' and 'scan_swappiness' are really confusing.
>
> For a standalone v3, I plan to rename scan_swappiness to
> evict_swappiness to make its role clearer, keeping the rest of the v2
> implementation unchanged. The split in v2 preserves the original policy
> for anon aging, including the page-table walk.
>
> Barry wrote on Oct 22:
> > IMHO, this is confusing but this is a possible way to fix it before we
> > land something [...]
>
> Before preparing a v3, would a standalone fix against the current MGLRU
> code still be useful as an interim fix before the scan-budget series
> lands?

Hi Xiang,

It's a difficult question to answer. In the long term, we
hope Bo's patch 14/14 will be the final solution, but we're
not sure when it can land.

Your approach is a bit ugly, but it looks like a quick fix. we use
0 for reclamation to make sure we only reclaim file, but we use
the original swappiess for aging -  where all files and anons can be
normally aged.

 I think the real problem is that reclaimable type and swappiness
are too tightly coupled in MGLRU. In fact, they should be
orthogonal, except for swappiness=3D0 and swappiness=3D201.

Actually, the current get_swappiness() implementation has some
bugs. For example, it returns 0 when swap is full or close
to the cgroup's swap limit. But this is only a temporary
state: swap usage can drop below the limit again after
unmapping or killing processes.

However, once get_swappiness() returns 0, anon pages may
suffer from cold/hot inversion.

That's why I think we should avoid hacking get_swappiness()
any further.


>
> Or would you prefer to handle this issue through the new series? In that
> case, I can use my GFP_NOIO workload to help test Bo's patch 14/14.
>

If possible, do you think you could extract the code from
patch 14/14, even without the scan-budget-based model?
This might give us a chance to land it earlier as a
standalone change?

Best,
Barry
