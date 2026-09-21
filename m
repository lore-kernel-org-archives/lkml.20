Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDB850128D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790017226; cv=pass; b=Ivi5BMQCKrnfgRXaghqQNzl+Z41CrRb3+cobDOlu0hY3JgP/Y39i97HRLvikFeY5DiXpb2ynEk/l4s1FJ5IRzNPdaMSF15dNf8WG438dWaGYf8kh3p+ztmc5BAxyzuGY0WvWoSPDrlFZYVPeZFYkhGY2hRQwgzRJw8LhKYRYdsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790017226; c=relaxed/simple;
	bh=FeFO3AREa1i0Oy9rChHlku4bTopkweu2G7chupZtHVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r9+6hwRqMtm3nZ8dPbS6cbAeqjXH/gTH4HR5KdC5MmkW9ImrvgzeMIIsa8bpYMnvTthi5oOQEFDDpUXUkdX45K1iwjH5NvSTO+n/27SpVMM1uMNP5NWDdVRYU9XgQzxB1SlLSpME6ngoABKVnB8NGUQe1/vtyuX9d/d1XBZ/3A0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s2VS8VpQ; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s2VS8VpQ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so23228195e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:00:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790017223; cv=none;
        d=google.com; s=arc-20260327;
        b=HMQIY9erZyGHCkUssGxtS/GU+jn7ifwcQbVHWxQZYTyI7xsLo/hn1UWVI2k3lrXmCP
         W0pmctSwgNuB1Pra6pxE9V3q84UGVhMTL2EPbIUb3IGW5K1iSkpkmMQhDG3uMcU9agtz
         9eFW81wgRAKc8bDHZ0CQ0rEoJx13OiPKjMgDgqxsIVO0xhSjkpP5+mDmRqtI2jHpE3fX
         53+oopL8VoN48K4W/9uPiKILK0HcLOmxmBJTfllnxOrPBd8iFmkt62y/Pa9C0WU2OpWD
         oZSUXPwGZ42ufZ7ehpEHHBuZbCwHJwkZ56fLrqrB1eusnC6iejQQvSyVNeABmWCxnRl8
         OYdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FeFO3AREa1i0Oy9rChHlku4bTopkweu2G7chupZtHVk=;
        fh=KUHq+FgQ0zHjPdjP/EzSRB7zhMQtMchynS3p7xz/z/o=;
        b=lxejzO7BOtoGnUacIRtkFqMY0UqahLNGjOMo1Nq3sGCge0xuDW+XXrzX/ln9eDiPG9
         lekPn8fMGVe/fZfjq0/0XtZkNzXBWXqNLJwxlAv82b9BB9HNkw5lb2BSk6cWGcdvNbaA
         /YPLk49uBvTkBXOkLv1lT5GpM61o1Y5k22jf7XyrTPMSfHmM9sPxnBuJyz/Sqz5xWnU8
         g+jLgbJPWBU7cGpOHOPtaHkePnt58v85L8I5jqOJCX7FQXiUsHx2JHp32V31BzzHTmkw
         LpLuNmtGid/R3UtcLpbD3ApBM/QuZbVQRD/rQ6rB46SAhKyg/BHiu5UFCvCmNW3pdhO9
         5XMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790017223; x=1790622023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FeFO3AREa1i0Oy9rChHlku4bTopkweu2G7chupZtHVk=;
        b=s2VS8VpQ3eYssvPVlbaujURZpRWPAQGNU9KcTLSkpY+ZnnOY2jCaY14bXz3ALJJ15X
         pZGKSpmjq73FEGKs/djzCGNWNUInxox2FEt1uyC8tuTARtaaGYDCs3aWJBUZdtUXHEvY
         0sYDVVPlE+uhFMlUoRZtOT/jCowFnJOVrxu1ri3X4wYBghhcxp3A0bjeFhPiR9iUGSwZ
         meve8EPQ6BkFTMuVYn6dkrdGxYyIqGjUwacvYd597ByuUlvx0j8ybg+pF8jdiZDF1LD/
         Iz08xourpXAOUk8sP0AiroyYZK2/q/VXUeGMQ/VEVmGFiS4g66dgAOpE16Xg8mpnn40K
         q2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790017223; x=1790622023;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FeFO3AREa1i0Oy9rChHlku4bTopkweu2G7chupZtHVk=;
        b=L63keX7RYYkh2X+r5fJZRg69o/0qKkifh+JPtqi1sY88et1u4qAf5tF6X+rfPekTvW
         wGnSwQAFVYTC2lwcOu7tLVUWJR3eu0tm+pEthDRMrUmTgRggavEppLkUl1lT3Ywz2CwA
         L03xUCQdeIiMxMYQrGcv7BrqzFxuhwIoBO5iPlCciA14X4j8EXvQ0S+2sAcMxBDzB954
         ICO99sCxrotOrwn1uihXeaMhe1CMUlZAjJBy1/k/kmSBe4CpeNfA7W+nG7phj8gmSy9/
         zBufnivfKCbgSLBOVlNSK4UU787cw0JqjL41jNC9jFfjYQ3oxJgPjHdA1mMRV6SWZpiw
         k9YA==
X-Forwarded-Encrypted: i=1; AKwUvByChJu0guHkX93oS0d8aNOIjLpW0U7S5as19wZuoW0zQrK2n7yS9xJy5RRJEHqpoNZHQQGzgQINjdtzytE=@vger.kernel.org
X-Gm-Message-State: AFuF++nsbCyuCjOmYyoG4eoMXLlcznZqnBt4BrtxblkNBq2zajUJhpBr
	jVNxWHdKyI2jwX7cc4LD5oG/atFhPHYEvSlrfTWZDOsiHHbsv9UGAEmystBJni6lunJezqSIbvl
	KBb0pA1Or5mXlJ+spm0HxcNzLlX1/ut8=
X-Gm-Gg: AYBFou1ZoecKROK69AlCHSZiMAR534Uq/7uLPARIWMwxV0+yI/ObgKEoSC9l7PDYdPT
	WIk5UaklOFx5bTGf8pqFkpCEAtCgFD3fxlR2kooVU+jC09hr4yFAxxyvysij79Oyv1h4Q2EhsBt
	FIMo2ARGwOablu/JHNlaJ11UurHxc+p2e2/HVhiiI3lze0zArIYKQ314w4nKdyqIDdHnAkKIcWg
	iZ+4tEquGQO9QvzjD7es0dH4qMblbog+i0NKwK8f/4eKIDtTBONwkMwwLoVuWg1T90LpLbMLpPu
	MeHKC6NeOnBW+iHz7ZrgSPxb4ajMzR2UF2StBU4/Z0flcV0k+CE+HOjSgHm0Hb+yN5bGTKXv6o/
	mQOJkbPHxIT0=
X-Received: by 2002:a05:600c:c8a:b0:49d:433:c3b6 with SMTP id
 5b1f17b1804b1-49fc5743da1mr174500025e9.27.1790017222438; Mon, 21 Sep 2026
 12:00:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918180241.3424851-1-nphamcs@gmail.com> <6ab13438.71f81b7d.15fa6d.002c.GAE@google.com>
In-Reply-To: <6ab13438.71f81b7d.15fa6d.002c.GAE@google.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 21 Sep 2026 12:00:08 -0700
X-Gm-Features: AcwNN1VSiww_CbRe6xoCT3Rgd63gTKNcURFr8FJ8W6bVgDoo9VnivNDHr1UO828
Message-ID: <CAKEwX=NczHcGVrGsArjV34Viv95kKbV3jo+c57BdG9pHc087GQ@mail.gmail.com>
Subject: Re: [syzbot ci] Re: Virtual Swap Space (Swap Table Edition)
To: syzbot ci <syzbot+cid08c37b8dadb4c43@syzkaller.appspotmail.com>
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, cgroups@vger.kernel.org, 
	chengming.zhou@linux.dev, chrisl@kernel.org, corbet@lwn.net, david@kernel.org, 
	gourry@gourry.net, hannes@cmpxchg.org, haowenchao22@gmail.com, 
	hughd@google.com, kasong@tencent.com, kernel-team@meta.com, 
	kunwu.chan@linux.dev, liam@infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org, 
	mhocko@kernel.org, mkoutny@suse.com, muchun.song@linux.dev, 
	qi.zheng@linux.dev, riel@surriel.com, roman.gushchin@linux.dev, 
	rppt@kernel.org, shakeel.butt@linux.dev, shikemeng@huaweicloud.com, 
	skhan@linuxfoundation.org, surenb@google.com, tj@kernel.org, 
	vbabka@kernel.org, weixugc@google.com, yosry@kernel.org, 
	youngjun.park@lge.com, yuanchu@google.com, syzbot@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 6:42=E2=80=AFAM syzbot ci
<syzbot+cid08c37b8dadb4c43@syzkaller.appspotmail.com> wrote:
>
> syzbot ci has tested the following series
>
> [v5] Virtual Swap Space (Swap Table Edition)
> https://lore.kernel.org/all/20260918180241.3424851-1-nphamcs@gmail.com
> * [PATCH v5 01/11] mm, swap: add virtual swap device infrastructure
> * [PATCH v5 02/11] mm, swap: support zswap and zero-filled swap pages as =
vswap backends
> * [PATCH v5 03/11] mm, swap: prepare the swap IO path for vswap
> * [PATCH v5 04/11] mm, swap: support physical swap as a vswap backend
> * [PATCH v5 05/11] mm, swap: enable THP swapin for vswap entries
> * [PATCH v5 06/11] mm, swap: write back vswap zswap entries to physical s=
wap
> * [PATCH v5 07/11] mm, swap: reclaim physical slots backing cache-only vs=
wap entries
> * [PATCH v5 08/11] mm, swap: only charge physical swap entries
> * [PATCH v5 09/11] mm, swap: add debugfs counters for vswap
> * [PATCH v5 10/11] mm, swap: defer memcg_table allocation for physical sw=
ap clusters
> * [RFC PATCH v5 11/11] mm, swap: back vswap clusters with a VM_SPARSE arr=
ay
>
> and found the following issue:
> KASAN: null-ptr-deref Read in swap_entry_backend_has_flag
>
> Full report is available here:
> https://ci.syzbot.org/series/713f2473-328a-4c16-8bce-63005d15a338
>
> ***
>
> KASAN: null-ptr-deref Read in swap_entry_backend_has_flag

Ah I think the bug is in the RFC patch (the one that does the
conversion). I was too overzealous in deleting checks :)

The skeleton (cluster struct) itself is no longer freed (I just put it
back on the free list). But I do free the vtable when there is no slot
used in that cluster. It's one invariant replaced with another -
"cluster freeable, but if cluster exists then vtable exists" becomes
"cluster is never freed but the vtable inside it might be freed", so I
should change the check rather than just deleting the check.

Should be easily fixable.
