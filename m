Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D116638DC78
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788976037; cv=pass; b=L1xEcwzpBqM9+aFx0ucBfxLNyvUoFCSsbevK8DDSIZRXxd7KnE8h2/ehWOxpsgnVa/Q4RZbsa87d2RAxk6eGMWplG/+4OBNz6ABBiBXF0TrJTBITi/KTZtbXttJuqfT0rASvauLmsExtl2lS+ruFNuZ97TZuvjtGUZhCgtB8/mM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788976037; c=relaxed/simple;
	bh=hRHhNgr7L5x2Qzex+NhnB6McSSZGczX4V1lZLt3GATI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jvv5rseN1sILDTSMZzpiu/zGmuQcwy9+xC2Jng6vOI4nXEyT70VSuKeIssnJPPHzdkaClAwAIEUDKBoeb66ERtGMwdnU3D+fWoI/aK/FiW4N8PtfWNfZjKrmgpEtNgDQByG5JK4BMmoafbJTwik3TLCzkT7P+lBZyg7bwSVr3VQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iA8B8xGZ; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iA8B8xGZ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4843e397f74so73744f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:47:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788976034; cv=none;
        d=google.com; s=arc-20260327;
        b=YWxb7cti7f4ymM9wKqZHQfaAE+7YNQaepSmHWkpkaYyOwja1+VMQw58dxgq/gorxwK
         IFvugHRWqiuKMC9Gxc0NAjkk6ncc42CZsy5Iin9MA4B/TMCRisjFqocV0Q/fDK3cw27u
         UHVsOoHg1gBEF37jm3kA5yczflKJ+ax/OylTjIHsb75iK5KDeB9r0uBeUfWgZqe9hWcs
         nKKExCleqeKnkJ68p+Bu8BlPAcF3rdn8+DssuyuVKSbEO2Cf/I9+ZCvjv7MgjKsuK2Aj
         oj1jJrcMPIgn3Vbs+zWv/M2IBNmB5dk3AJgAxpmAD/09gJQcSRdcEWrmsI+/DePNuf3h
         RsjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cjBT/gijlT5nlkZYair5/Qqr3lqnucD6OCBJtzUzH/Y=;
        fh=7uAizYa3FAn75JWFNhSZ6JpF9xn+//ug9CVa21g+TbU=;
        b=Wbi+9+V2XHOEZkVMWd6iLx2nSfQ7zWkubHKRJ4YTcvgsHkw1DYmmDpO3/fgvaDK2PT
         yh8EJ84XAvcdKT3pMaSCZRTqhIPyUBsjSA6E2SHIzw29sNu5VSA/yQ4hy/eGOswbKW0g
         WP9CWzWCtilvOf8vC/g4h6feQrC1zj9JNXUmaCKk44Slx1mMjHir6+mGGK61H8wM/9qN
         YuEpdT0pPLQoamqZKRWOwPlWhzjvZr0X2l1LP6s18P198ER6oO/XPTUgkH2dxG9R5IGt
         D9QfgQ37kyuUMO+HOFDUyXgTkMxXw9+T4+NnpGRNolawl+UOmtTIK7mzrSFVVQFKk/FB
         iUgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788976034; x=1789580834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cjBT/gijlT5nlkZYair5/Qqr3lqnucD6OCBJtzUzH/Y=;
        b=iA8B8xGZoUgEd3TwUaCb9cZFEzDs3z3WI+vHB7hKD7wQUsG8+vWP1rgmKBVTNnr/sR
         sMkOu2q384Z+G7kvwjD84N/i5RqPkDzav0owndb1nCU+a2RT7eZSKd+vO/axQLGr2X9E
         xkDFHVLBOndWNGczBPzSiwfYXANqCdcjQUtyg5RT3axb87FiyevsbjulKDYi5VdATdFG
         g3xnr/1wW+HEva9edTjUxqldSucvCF5EBXkkKs0xTp4dhrAMFdAVWcEEQx7qQwmMU46E
         ZJXqJUw1uqUVHL/dVbF9W9hmLhBwk6roK1LzVZdVas6Ix9HV36Vpp0SCFWm/FadLTTO8
         tUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976034; x=1789580834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cjBT/gijlT5nlkZYair5/Qqr3lqnucD6OCBJtzUzH/Y=;
        b=o2uao92/5s/frQmlUNXdXgxx0FKSPojq2I1F2QQcfHFr2hdhIAL9nRtIU7XPIMKQhi
         QGFhU4nHBztF/tP6EiLSVLIHrlU6fKCXH8sFtqZ06FLcFOnqauNscR6su85lT4oB3AqC
         aB7rIYSsmJFQpd9BkcLW83//7capfaDx1oyduzGVYj33koI21imuyPVOkdEYOLeroJdm
         sFX0f1IyPXHo3Ei2y9tam2RO+pjKjOCkcUzCEJpIYplTz65rt1CloFfYpVnuJxi5jglx
         9gsK21aPMXS7IXx/yt45eL88raim/JWFN6Xozo/o+e/hNdfD0u7srxOkaqTYSntNCp7n
         oMDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqryNxfuHgnbPcKNjSt+h3yqeLohLsXB6XFkZ5wlLPxdlNr1XZVRMotXqIHKuW/0XooU4K0PpPKT0nlbQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kxYnsg0+M8kXBwKi9QIXwojNeL7OKeY0ZJVeYirKOMujTneL+P
	An5q4+L2dydpELzPWvSHDHXOzwx71fiROTzPw8UDjgeyJeGtTs3ILJUPM/Hv/qIPPZbsoIxHFTD
	2u77DD+aiR7rcUZbgAT+BtD07v/G+4MU=
X-Gm-Gg: AYBFou1V18i24Ptx1KX1Wd6yJnpOPmX0p9CxcFUJoCX+Y0RowUOhRllQdySz9p1xLLV
	O8To6zV3Xlx9RNvxTP3d/57FwHuh94Oh6/R+0YaeE8f/A6FW4QTwt77xzvLiA8RJUBUtX/Yvp5P
	RlVIclFmtHwP+190wftzo0ffkjthhrb/w6eRYclNl+3c293JYj3fUUdfWUBG+ZwRPq2vsTa6s0z
	F9lugB1VK2y6pZeavFNIyISC6WeuKvavbYsL8ISBbawlsymGnFh+WzoaAFmsDghPEMNrfeTVug4
	O1LSuBTx02jVLXjXXN/uo0HJGMUDPwOvZJQJN/qtzZV5LE+JxLVE2ZWqnnwR3nyShmEO9WH3qjK
	G3soAdOy4Jjg=
X-Received: by 2002:a05:6000:470f:b0:484:4779:bcd6 with SMTP id
 ffacd0b85a97d-486e0f6c735mr589913f8f.15.1788976033902; Wed, 09 Sep 2026
 10:47:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <CAMgjq7AHRzBsbmGOx0s=TQFBwcn=DEU1naR443sO6x+pJd6hAg@mail.gmail.com>
 <aqBT_35E-eSoN_zj@cmpxchg.org> <CAKEwX=N4aaq_oD2agTUNrUNXhaYGeQ9vxu+dywFvEFgWFi4uQg@mail.gmail.com>
In-Reply-To: <CAKEwX=N4aaq_oD2agTUNrUNXhaYGeQ9vxu+dywFvEFgWFi4uQg@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 9 Sep 2026 10:47:02 -0700
X-Gm-Features: AcwNN1UaR9pHD2h6-LXbXZDQ7w46sDfAFt5QkIQi55ban0K1e2MIGYElY-fudaA
Message-ID: <CAKEwX=NYoMH8pTKeCvA=XHFmmNVMeDz3mxbhp5q6-PxSTJ5wOg@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Kairui Song <ryncsn@gmail.com>, Chris Li <chrisl@kernel.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
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

On Wed, Sep 9, 2026 at 9:41=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote:
>
> On Tue, Sep 8, 2026 at 11:30=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.o=
rg> wrote:
> >
> > On Mon, Sep 07, 2026 at 01:51:31PM +0800, Kairui Song wrote:
> > > Where I've ended up is that unbounded growth is a real concern. On a
> > > host with no memcg limit (root cgroup, and most desktop and embedded
> > > setups), an unlimited pool means usage can keep growing, with no
> > > admin visible ceiling at all. I'm not attached to xswap's percent of =
RAM
> > > knob specifically, but I do think some kind of bound makes sense.
> >
> > Swap space is just process virtual address space, no?
> >
> > Swap entries already have one or more page table entries pointing to
> > them, which in turn are managed by trees of vm_area_structs. That
> > means rlimits apply, overcommit protection applies, and OOM killer
> > attribution works as well (oom_badness()).
>
> I tested this theory. I spinned up a process, and let it spam 0-filled
> memory + swap these pages out continually.
>
> As you predicted, oom-killer picked it up eventually. The host was
> (and is) intact otherwise :)

Oh digging through dmesg - I did find something quite interesting:

[12462.749663] ------------[ cut here ]------------
[12462.749670] refcount_t: saturated; leaking memory.
[12462.749817] ------------[ cut here ]------------
[12462.759267] WARNING: lib/refcount.c:19 at
refcount_warn_saturate+0x1b/0x70, CPU#17: zeroleak/76075
[12462.759276] refcount_t: underflow; use-after-free.
[12462.777208] Modules linked in: sch_fq(E) tcp_diag(E) inet_diag(E)
act_gact(E) cls_bpf(E)
[12462.786790] WARNING: lib/refcount.c:28 at
refcount_warn_saturate+0x42/0x70, CPU#25: dmesg/76074

Seems like it managed to oversaturate mem_cgroup_private_id:

struct mem_cgroup_private_id {
    int id;
    refcount_t ref;
};

We should either fix mem_cgroup_private_id to use 64-bit refererence
count here, or hardcap the swap usage to below the saturation point of
refcount_t ref. I'm leaning towards the former in the long run.

This is sort of an argument for handling all of this transparently
though - expecting users to know what the cap should be based on a
myriad of architectural and arcane implementation details (which can
change arbitrarily in the future) is very unreasonable.
