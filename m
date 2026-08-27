Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10B224DD17
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787789475; cv=pass; b=Ht/wzclc9MFyklPfR2t0dNg7YfCiGPAqjHUJUwedb++Muz+botOZiQgu9S/FE8di26RdR32yuRgUG7sNyi1Te5j9CWHI+LWgKizlNGunyZPncoCFQ0qnZ4wI+qeSbgx+nw7y/MB5gzqLpZvS6DOxxngKS9uC65uS0dwOSthkfxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787789475; c=relaxed/simple;
	bh=q9fPaqLMvwojY1sDSJE1KOtBByV27/rWMVd0RMgF7LA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jUc+HVcq84WHVH33wa/1wmAskcFGCN1i/DcTnFprRpouankAtkJJYCdtVvcAyr3PajlN07sg34HgeNHwaHoywiD2mRVSKhRrDHeNh2iq0kNnjWEzE6Wii0f8HqcMbAXxq6T3r7JaTWbtdgDz8MA1kBTJKZ9BgSCSMhL+JTNm03U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DDHytNYH; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DDHytNYH"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-90ccbca8bdeso8406656d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:11:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787789473; cv=none;
        d=google.com; s=arc-20260327;
        b=khSjs79vkj9zStEsVDNMM+A9vrN70YT/3gIwOBteqsxUQDd2jsFOpcipVwyt+wK54J
         APWQetTLMfkGGz5sk0Ru0QU/Cm6HWuTmeHX/Z//WPtVOPePHCGpQKV6u3ECs8l0iWhGH
         AzXR+1OA8OPLRizdyCiWGUUJoKZJfTjxgqVX1Zt0R4cKFpAA7fQfPkL93PcQds3ICmfn
         I4DdKdnxxoyeUAu/VdgJ20xJJoSwT+lYihpZw1GWO61v7mjJ/ZVOhjKLFPsmW4gUb2z+
         hgkizPeDbPgs7FX9wBy7o/QEYs5RCStOpO1K4JWaOt1y99MPC6lT/9YlDRKDzgL1WPUP
         8l/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=AnLRTMnfrf4Gj+REZ5Itvxt0IiZsf+yGH35mZtX0wjs=;
        fh=VPNBPzIIr2ZDHGsAtkI3Jf5gmhgDSHG0rhAFoL8UMC8=;
        b=ZheVPqI0yb1LoOqrZmYStY9ATLo3Tv4jd5uAWwJGYvTy0+nRQldKdmHvwpwPhRJXYS
         Y/Y9Jf1ee1wZ0Y+dsw+0YdMl5cRTFXYXa7mm+lYpuFr3bnb0f34w1XoVYhA2qo43rXq0
         5ee7BQqrUcHUcQ8Q9oGJAZPvNMyUMh6cishfAFgSrLCkuga3G2BmfmuRZ3s5VMdX2NEo
         GO7QJuxqH/fHzo9v2mqFczGbJ2zqYOF5r8tpbZ7T0i8ZhngPFyMYkGP7yuBOElOfu9uo
         u+6//ezmeo7T0gSil4RaZF6I6uGOWBdBaqfLBIlMgnAZ2oUocdDUlh2Ea2jF8x4WtNVc
         5baA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787789473; x=1788394273; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AnLRTMnfrf4Gj+REZ5Itvxt0IiZsf+yGH35mZtX0wjs=;
        b=DDHytNYHmL8ZZFfUZQMn9dv9i2pHGtixDiXKH9NcxPc4aJG167NL84W4W1eFrg82s6
         K6FGfBmIu0OB/N4HK5JAFeA1UGR0z5TlKmc3aM+GLZARcczL7zef3x1NOk3gnKVBbErt
         xi4wq6VzqorqIOe3iRB2OmS6mFTNQfV99usutBR7zO4DRLOWqjr7mfDN5C7fBQb5JJdH
         p2T/sZgpckboyIVBPJAuAoTIcUqpQdX0fSP1tMUoo2TLb4tdTLhQG1ds/xrwWWn36i8l
         cCnl653nK2rd+DQLX4EaUe9yQIPUT0c7flfn4QVBnz+eNFPfHNpbIF014eIJsP8Ak4Tx
         3CoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787789473; x=1788394273;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AnLRTMnfrf4Gj+REZ5Itvxt0IiZsf+yGH35mZtX0wjs=;
        b=T3eXzGa3a4TZMrFoqWzR1cr8HNupoFPuL8Bs5n+qRnAVqWclhQlXtcC8gYtjuUVkY7
         bpndMiA5L5shkbBtQsHCznON9rAOtinLJVKSYupe+wpdnTLXjRU447fEZk5Y5v0JSkCY
         mFeGh2aGkPXAEmpuQtPiDOX3HVywjKXFC0EpqndUTfwcmPrjPR4D7d2cwfTyPWjcEMqg
         +reUSKP8M1yxOKlk0eyUWYyBUp8HU7aAUxjrtcJdmaUD2VbTvlzDVI4LRnOVQtFaQ4fq
         c6W/b7knC9IwcMQkdURchzZGIL82Rw9QWTOxlhy+SweUl2o4m8E7/Ly4Vp7KESJIMUFG
         Ckeg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/nmPqSwPFA20TPj1ntPrzMoxaiZ0mZKIpbofmSbGN/rHnBbVEo4aaf65uhUKynultHkimmhxzGGIMFdY=@vger.kernel.org
X-Gm-Message-State: AFuF++k/c0js508q42qACyDkHJmHjcXxOk9f+DqbAUNyXuU4rtlrtWEQ
	lyY9WkOx7lu6IEM8L+F89egk8MTHe3sTUZIBoztYOqzYxO3px/RgUPCVUHTsFUJ5E9WY//WpocB
	EZ9OvgRf4FbhtCnPblvBbc0qvyuFzm3WZ4f3zYkba
X-Gm-Gg: AR+sD13jhvAdkIfwZw0zyDU21qKdMwP/BzMjOAmYnJA2PJnn6m70N0sb7JScWjS1r4W
	/sgAKcHuTkOeYbKvErdjHsPkomHjUCa9tTOQ90+9NW0edV20Btt1jMVXhjPy705AE9cXU8MODDI
	c9R02iJ5J2+cay66SrfzUTJxVfbIjhLCXnDPkAVvt5UmVsFzVSkXdHpUTfxT2Gg9aph262nQlWx
	GMX5a+cx0Nefab4Nv3UJACuyVrpb6WFWK3vKpmei22Rr5zRADHn7DFtLM//+oib1SyAXAyVbsI7
	oL7s9CFcjSkE8Pkk9x/F0S7BvgVBSP2fFB5FUj3qiTW6FyvXbjTUoqJUfoaq59myN3suEdZWmYv
	PuVU=
X-Received: by 2002:a05:6214:4602:b0:908:98fa:f374 with SMTP id
 6a1803df08f44-90cc7858733mr168107566d6.6.1787789472172; Wed, 26 Aug 2026
 17:11:12 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 17:11:11 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 17:11:11 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ao8pCI3AaUssIO8S@google.com>
References: <20260823-memory-failure-mf-delayed-fix-v5-0-d97a5703e45a@google.com>
 <20260823-memory-failure-mf-delayed-fix-v5-5-d97a5703e45a@google.com>
 <8a99f753-0713-4194-8eb5-90da0724e647@kernel.org> <ao8pCI3AaUssIO8S@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 26 Aug 2026 17:11:11 -0700
X-Gm-Features: AcwNN1XfQOKyfEIZtdcwN4-zBTAXGB_PV6TdJFFinygb6qNke6evcDePz3wbfQE
Message-ID: <CAEvNRgHAwAJee6_ra9-zioDh_BqHM9Lbu+TGXxWHbG7za=g5Aw@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] mm: selftests: Add shmem into memory failure test
To: Lisa Wang <wyihan@google.com>, "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, 
	Hidehiro Kawai <hidehiro.kawai.ez@hitachi.com>, Rik van Riel <riel@redhat.com>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, rientjes@google.com, seanjc@google.com, 
	vannapurve@google.com, michael.roth@amd.com, jiaqiyan@google.com, 
	tabba@google.com, dave.hansen@linux.intel.com, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> On Mon, Aug 24, 2026 at 03:00:47PM +0200, David Hildenbrand (Arm) wrote:
>> > +++ b/tools/testing/selftests/mm/memory-failure.c
>> > @@ -20,6 +20,10 @@
>> >
>> >  #include "vm_util.h"
>> >
>> > +#ifndef fallthrough
>> > +# define fallthrough __attribute__((__fallthrough__))
>> > +#endif
>>
>> This doesn't belong into this test.
>>
>> rseq/rseq.c selftest already uses it.
>>
>> I think tools/testing/include/ already provides it.
>>
>> Maybe
>>
>> 	#include <linux/compiler.h>
>>
>> does the trick?
>
> Hi David,
> Thank you for replying.
> Would it be better to change it to /* FALLTHROUGH */
> like the rest of the mm selftests?
>
> If we prefer to include <linux/compiler.h>, we can
> certainly do that, but we would also need to update
> the Makefile and fix a redefinition in pkey-helpers.h.
>
> --- a/tools/testing/selftests/mm/Makefile
> +++ b/tools/testing/selftests/mm/Makefile
> @@ -37,7 +37,7 @@ endif
>  # LDLIBS.
>  MAKEFLAGS += --no-builtin-rules
>
> -CFLAGS = -Wall -O2 -I $(top_srcdir) $(EXTRA_CFLAGS) $(KHDR_INCLUDES) $(TOOLS_INCLUDES)
> +CFLAGS = -Wall -O2 -I $(top_srcdir) $(EXTRA_CFLAGS) $(KHDR_INCLUDES) $(TOOLS_INCLUDES) -I$(top_srcdir)/tools/include
>  CFLAGS += -Wunreachable-code
>  LDLIBS = -lrt -lpthread -lm
>
> --- a/tools/testing/selftests/mm/pkey-helpers.h
> +++ b/tools/testing/selftests/mm/pkey-helpers.h
> @@ -22,7 +22,7 @@
>  typedef __u8   u8;
>  typedef __u16  u16;
>  typedef __u32  u32;
> -typedef __u64  u64;
> +// typedef __u64       u64;

Removing this u64 typedef seems to be unrelated, the layers of includes
probably has some weirdness that needs to be ironed out.

If the weirdness is not too complex to iron out to be in time for 7.4, I
think we can iron that out, if not perhaps using /* FALLTHROUGH */ is
fine, to be aligned with the other mm selftests.

>
>
> Lisa
