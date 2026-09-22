Received: from mail-wr2-f30.google.com (mail-wr2-f30.google.com [74.125.225.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA84944F54B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790098389; cv=pass; b=GPf+Osuv2P9YWX4XafoLtaQgFDcSwchWLaaoVnUqHl3fBJC5q1GzSZonNG/aEIrlHeMdWYjXhTIlMFbAOOzPJZM0IU+KupxjVk/k2DYFYS/BZ9oqpMYzSbKW04viSW1RoZeBNvk016t8QmKmp2jqRKpS5Lcn6m9V0DZ0wrsp21c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790098389; c=relaxed/simple;
	bh=6wfVY0cj3I+ZyoFfhOD2M0rQu+6sC7TkY/5LoCxxQ7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QzWkTWty+M5Avb54XMnTkwmwHTf2fuojtl/r/PrtXyAYpmBw1Apc3T7uIPVRSX4ud5nPIv6BE8lxV/uTaPKM1oZ1zZcaIJbTQneLl8jcIlABXF9tD9gO8wNN+6QvR23bFMpKfEUX4pZu2X9pBC8qk6Ftvr0VucmqvB3vfPKHZxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bqo5f6rQ; arc=pass smtp.client-ip=74.125.225.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bqo5f6rQ"
Received: by mail-wr2-f30.google.com with SMTP id ffacd0b85a97d-48439feca17so167437f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:33:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790098379; cv=none;
        d=google.com; s=arc-20260327;
        b=M/FoRa9Z45ySVAilvpCHUg1L914NNCtieoiXhoXOe4NJXuBF3XIn2Zde69CMKgLUur
         5Yk19PHZze3wBBPkAiCHDw9FnZ6qIrr9gV2tCWDgvxM89adYGFBye7zT8OBpBy0P9R9e
         wAyLPj7CCQugPzL2VPg5TihSlsTwznfbPHOWIREomAOoVvDajbnGRUpWhcVTcDZmzpqh
         Q5ybRPg6uk55MGxnSEVJH+eKwRFZccAzc+VFk6YEiSMq/WHg3HBXAGA1ZucAdDyxdQa0
         V0Fg+VGA4h6GqM+YXvbklVbJhvGgs/reMrcu+kKSi6RdKXZ3Pg+AoNRhTAzHxu7BXNTv
         M3nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6wfVY0cj3I+ZyoFfhOD2M0rQu+6sC7TkY/5LoCxxQ7g=;
        fh=fwu/sPhKMH6R9Sfnq8CACOcSUbqzHx3dCwUjqkFC89E=;
        b=JkwoMv0SeKEJQf9x7iH7q2KU1SC1e3rRk9haEB0y3dl4QKxxurqAxEb+Pe7QwZm6XN
         ennx8jcrzS2zwF5qBHqRq/sRBWwqFOH4Vzo8OpYhduLqBmwE3vg4+JG9wuyoq2NypkjV
         WlZZd156F8e0jqXqQyYiBclJ4RTMfvdDfCAsKkb2DNDnAOzzUB1+StYA09HAFH8BBG6g
         Xj0fOInZHIDkO2rcpXORl+7KJzWzcHyHf57JHrJt3idbHqUIiPOoXDnOumVis355cRr+
         ICReXcU95ZQV7yM6P7BlD5WDqXgKXuekHYKWv5KqlgaL29Wx1ElOrI9aI074CK6OTe9h
         uE9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790098379; x=1790703179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6wfVY0cj3I+ZyoFfhOD2M0rQu+6sC7TkY/5LoCxxQ7g=;
        b=Bqo5f6rQ81SdJcMHzW6h+aCRwcL9/oII0H/XLS8t6j0vgloBmj4IaGLms37CVBWhOh
         fWGrDNwzlE44dRvX55bjReJ2ot9ZSbwjfHV80rnOO1FBzWwd20o4JJmO/3QCDtDo+KTw
         SAF7WAZxa6myBRPr9mxVaiotHwXghC8owapv6VmoL02WC5DKDs+LuZDKIoWulYqH9AcW
         yeRanmuHXW55eYCd95qNpYsfkEcSLVqlR4x4P9g5HIRGQIjXiXQtM5ZcS38GH/JS1fWO
         8ztBqKVqsfU0WZa/4m2e507cELXCtF8nloCvNtK0HPvGesNL1DM80hjXVLCT2sgMFPHi
         CdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790098379; x=1790703179;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6wfVY0cj3I+ZyoFfhOD2M0rQu+6sC7TkY/5LoCxxQ7g=;
        b=xb+82/m8vfVhj6XyW3dhMKr3lefE9kTTx5BYgNZ767nHgnwl/TwrE82H2RZmleQp3m
         60piZuvPOJVtu3YPJu8d0Vg4+UAFmt44AKSu5N38CdcTJYL9fHLw4BBNwlozmUBoq0vk
         c3BV7qohpF+ILJ9efbS24MgVjhn9nDzpgYtCGHzflYxfQfQ1FmODRg2Qgzw5KOBzqABF
         BgVK/7M8anx8ItR1EyIsvtmQcFnA6NIq2sdNWGuKoES91t118oropgfSLgt1LJasIaoX
         QHO8TgFnCj9JZRtYFr4yf+lionf48SaBc3yYSCBFL7aoILAmk5NSAbV0zosbAlk9pZsu
         ZSkA==
X-Forwarded-Encrypted: i=1; AKwUvBzt7qR1sisdvpZ6ASfX3BhDOT0svbUNdX5I4qx9rP6uvu6T2CURdDK6zdFxo6CjwgsQ0eckDEKxsXzs1Vc=@vger.kernel.org
X-Gm-Message-State: AFuF++kwhlhcykCCzVSDb1a8v22hULmFSSR4Vzt8mkuqNfN4zL+ewhNp
	r+oUJyJaqVNYyK1uhYtmjdvhnmEJ0hIztu6HB7wHlNdVeGDmv+3IY/QmcCjStA15NMHzJBamg4H
	lKyCR7cPJ7gteK2Gk7TyPtqlXMMNfn8Q=
X-Gm-Gg: AYBFou2Ki7GmKu1PcWQ1wanu/uxgWkPg6F7UBbGSNyNH3k46AkG1M+JgJ9gvZqbx9oQ
	CWeNRvCq9m9hWwOwR33d6YMudlck2KC21c0rb/wEudolP0II1u8V9jT0KVZpAkPPItsMy+tnT74
	Xd9z5uO64YSs4WKkXRsQtJa2vSMiTXzOHKeBnjVnx4m54xW2Q1R10HnnuKhjTwk8ASQd4tQY2am
	AM6t+FUxbZvql9rQSAh90/AtJ840cF1zWmBwBcpR9Mh2QkMZUb1RSgqvqouzIWDey/srPLtdIOH
	lIClECQ9ovltgRJuoavsRma1hPgYAD/Z7CJREuUAp51xMta3cRUyvg7Y6se9Bn9JtbKdhXQnUKi
	erHMjQ6295cg=
X-Received: by 2002:a5d:5d08:0:b0:485:ac35:5c5d with SMTP id
 ffacd0b85a97d-4886705d7f2mr561509f8f.15.1790098379271; Tue, 22 Sep 2026
 10:32:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <aqJXx2vtbKaRLt3x@fedora> <aqLi6cIjD2wJwk0B@cmpxchg.org> <CACePvbUG1ApMzMdEzf-63rpjgGVNsRk21pT72OQGJpM=OtRUew@mail.gmail.com>
 <aq6cVXPLUUwJA7-2@gourry-fedora-PF4VCD3F> <CACePvbVaPDnva8X-Xmz84r7j5HjTuih-w5phpw7cerK2uPnK6w@mail.gmail.com>
 <aq8dja2-timYBwyB@gourry-fedora-PF4VCD3F> <CACePvbXudjxQ5vrrY4D1nOXKaFNQUn-tL+p3O0zfxtHXK99ojQ@mail.gmail.com>
 <e879ac65cb0940325736df7984c737edf1c6be94.camel@surriel.com>
 <CACePvbXThspPYD8DZkAeiJtYuMV79vGgC1SGhpMwhn4COWOtcg@mail.gmail.com>
 <785353ef79844e81a8cd97e87b00ef1f785b15e5.camel@surriel.com>
 <CACePvbXZ4i-DsmbQdNtBQb79y59uwZC9J8qHD2wTWpcYaet3LQ@mail.gmail.com>
 <83539be885f15bb567b30264f5f62e718f4a9fd0.camel@surriel.com>
 <CACePvbXZQERwLF_f2FYTHsv--kq_-Aw2vVVFF+z+ovdnsHy1bA@mail.gmail.com>
 <a75b2eac4297ca6b238dde6f9246d2c1807b935f.camel@surriel.com> <CACePvbW_-6M63_a7Cp+09dTmpHeMEdj9VDQZf8g8qoYKQD=wvw@mail.gmail.com>
In-Reply-To: <CACePvbW_-6M63_a7Cp+09dTmpHeMEdj9VDQZf8g8qoYKQD=wvw@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 22 Sep 2026 10:32:46 -0700
X-Gm-Features: AclHuK853Cv8o08iYHDa9EpXynqoJX_zkfnKle6O-lWkCRkEdpUZ-YCtbcciUuw
Message-ID: <CAKEwX=NrN7-u7gnGvWX3qfHaBQcN6FKsFP-4-k76F=sxM1LJqg@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Chris Li <chrisl@kernel.org>
Cc: Rik van Riel <riel@surriel.com>, Gregory Price <gourry@gourry.net>, 
	Johannes Weiner <hannes@cmpxchg.org>, Baoquan He <baoquan.he@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Wenchao Hao <haowenchao22@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Kairui Song <ryncsn@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 8:23=E2=80=AFAM Chris Li <chrisl@kernel.org> wrote:
>
> On Tue, Sep 22, 2026 at 4:59=E2=80=AFAM Rik van Riel <riel@surriel.com> w=
rote:
>
> Yes, I can agree on what you observed. You are using anon + zswap on
> that app alone. That is not what I originally asked.
>
> My original request was for the whole system: what percentage of the
> total system RAM size has been swapped out to zswap.
>
> Because when you have 100% of zswap out, it will likely trigger
> different kernel code path on allocating memory. You might suffer
> global memory pressure you did not observe in the single app memory
> pressure case.

What does this 100% figure refer to? Pre- or post- compression size? I
legitimately cannot tell.

"Trigger different kernel code path on allocating memory" what do you
mean by this? This reads like you're referring to post-compression
size, where one cgroup eats up the RAM of the host, affecting other
tenants in that host. But putting a limit on the virtual device
capacity limits the PRE-compression footprint. It is a very
unpredictable way to prevent the effect you're referring to above,
because compression ratio is unpredictable ahead of time.

For post-compression size, I can make arguments on why we should not
also gate it, but regardless we already have zswap.max and the global
zswap pool limit.
