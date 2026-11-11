Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794368771;
	b=nE012upqUI3NMZ1vuCVO8qDnoFI7QVa6G2uTOizmryUqFDG7W3vkSU/y+NF0JsPI/G75
	 pSJ7MxMpoFUKrqlLJK0kc+WXpQNvkALKhw1vsxbh2deokkczS4tNZjYsRwcAfaYb2ubld
	 9pzVINC12tXvLhWEwZnbx0kdsUx7++Z7KPed1JEAtec20mP7IND+XXF8mIaCdg7ThUgBp
	 ksplPhZzpiq1QHgi4urC/HdfgzqIbDqVM4GBnFgsWd05SxZqgHfMlgOiHP1N19lr71wGB
	 JFIoSSqy5imDy4bC2M4t12VUfrTNGaxaGbCs4+czxoCWsFSp/wJ8VNseMPbsSYQp0Yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RXpnzG8jc2yYtoFLBv7ZARt98Mz5wOXGm+EBvSjKUfM=;
	b=aoTWrKCVILGCO+4cGRLcdgTa9N9OhSxXodH8pDTMOSAT+OWHuo8/bK+fUhFi4d7Y689l
	 /Oomu6knHcqoU3ihJ99lWdKVSrkVbfTZS2xvsXkG0gfgg7ljvZrdgX4OPZpshWqlTwYTF
	 IVBtg5TdJgfWRacQz4HxmNiRklaDUhXX7fUGFF8XAxJicVk3K69l6sAmb4ATGtxIQuu3x
	 Ih+iyW3ZMKVim/RYGDYaWnzuiGQqHh/sQfX1r1CsX9tlBUSZSLjsVtO1d+Oo4Q8pmw6+w
	 qWCKbZDeaN8YV8uHpeEIErj/6ZZgVMUjT1iiuvb6zx1l6IPa1owNfMREu7AWzaIQt/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wDmRvi5U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8686A606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8686A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wDmRvi5U
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67be4f2f4d4so3518651d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:46:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794368770; cv=none;
        d=google.com; s=arc-20260327;
        b=AX2syiB0NvHeT4EKErWIgxEPzcX+5j8MA4dd5q0PUARQEx8yon5dT1sh8A/g4v6rpk
         3nNx0HKShIG11XngMkIMPuUIPHL9iRrX+aDvSVh8Pkm9e8K5H2Z/oSpBeanD6WsAf5tp
         1Ij0GuNN52dHTdIEn1gmV/ZJLTAfbhfuG802zw9s7GY1kPyzYEIaayc3DGru8VYMPV4/
         XPohEALA+q7LWq6S0eZcrnpHvqAaQtVWR7RReFZmADanCTJVLTQ5tMEJv+h/KiTHCrhH
         qVWhJafOQ5aZk/L0zpd6Orp5iac8XpJVHLuNj9TQRvNJprm7Fe4P/xWOoIWR+YbberMA
         2Ovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RXpnzG8jc2yYtoFLBv7ZARt98Mz5wOXGm+EBvSjKUfM=;
        fh=aDeiniIoQvnYkiAbIgz/ze/4uEVHFBF1afju1RmLfmw=;
        b=ecDYYWxOEn4233YjaeGsmw1sy0B3XlsBKflDvg4G1u10kgZyvOH8r9jLlbHgeCkN7Q
         1NOHyfEzYyHJsR5T6q7pjJbL9Kikh5GKBzR5Dsrt33POV+HTvr3D+/ZUb81z4JQOG2Vh
         QLa1yP7y75T903zin0U0KaIrsqlxq5mg6nJANM8zxdjDDB6jhnD0Pq/h5kWYU3fSrDs6
         P4EKNOKaj+qxMnqKdWbpHIff5slgiyNfezYbwhVla6K/ELn3lCKo2XSHpXZcoy3ru2RU
         xH5PDjrVp+xBqJh32dTpuhjYdM7L7QwLfFy4E5t+g2WT6EcnnoKzHpgrAqKviViFSlQC
         1PKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794368770; x=1794973570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RXpnzG8jc2yYtoFLBv7ZARt98Mz5wOXGm+EBvSjKUfM=;
        b=wDmRvi5UDOHoU7lvv5PYFvNw/6ZCjkQMZd1A9CuYNK61SeWNpUw7SFVHSuXK81Jftx
         LqFrl+MMeAfNQ1dN4VgAkPSGL4mGMkvB85vU/HldNCWDivRC/cNo4PAavvHG3u6/x6iD
         NvRqkYXq0KioY9aYKfoeF3x7hZmb4oN/Cqv1MDDJdEPflYm+1hQTIMTqO/hDwl2WXw+g
         lbD5aDQpTz5+uWMvoBX+3lAEIgoX1bdI53Fov3ccsCW6voIrj/vZlzWrwWwJdofq3w17
         T8mGbovHjlrnUYPSCtJpVDvopcd/+XZlW3WKBxmeYfVmguC1aytJJ6cwhXCyv3d0lwMT
         X/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794368770; x=1794973570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXpnzG8jc2yYtoFLBv7ZARt98Mz5wOXGm+EBvSjKUfM=;
        b=cBlWC31QdZDgcRp/4gHm2f1Y8QAyr8M0lcmIMS4Bj2JCE58qkp4eSM7zAyMRV61HiR
         FUfz0yB1VVHdp2V8lK7b0N8kAjlS1DCnwD2rSp4T05J2s1iIZAx4FekpIfK7PaNuwEi6
         osOgCgvqJGn/vkeHZk23pHHhdEoVE7ncuxNqxNEIhr02f9D+bu6BGY9OI4vtx47OJM+4
         PTx/Ocg1TUbvDpOQSBNu466vnybgZBwFco6Pypya09Walb2lyL8rxetF/yt4b/cQ0eEk
         xLLsDIIts7KwF7OkZzPkKZwwtjr0c+fIqDge4XtTrJY89LBgsSKTg0KNFG7Pq3qkOf9M
         ny2Q==
X-Forwarded-Encrypted: i=1; AL+hErEDzNUcOKf9o9QRrmHqzn4XQmLfi25jqc1zkaOBRuYnL2k3EynZA4xACNHJDzJrdowOJJT+W5rsPuv6aJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9E1k+DjH7RnUTYV6YY+tFosdtpQBr1AiHrn1436bVev5dnjR5K
	fcVDkp71H8ImQNdfvfV3p+qUt6FWdfVj/UjoHXuKdkvOLJLP4qcDJYgejzj8x05buwdgnKfL0+Y
	WY2OpfVprzloIoPM8Nk/Itw3ECs8r58I=
X-Gm-Gg: AYBFou3pLHL74ZCrPkH5N1dMASSz1DwWIy3S2ZOnD8UWzlyy92xV14g2JkNZovErrE0
	hKJlixoRmqsXKAvKNzj6LyiDygb5troG/D3ZDCOU6cOSgrjTqcAdjFQmHOjbRilUpabyZ3KBoPO
	rbemLchw47ZaYtDVOFebNL63esp9djbD19d2EZkIyKktLhttA5thHNq/4cIcRqQzZ2n3vxZIEFx
	6OwdtIq8eAf1Gx7yt6K6e/SUgV3WyaFtixWrh94fsfAgH5BQ7dJWXH95yOpdt3H4CAz1Fl6t8Df
	zr4BHfSDaJ47XL3k9zJHTa7LPt8av49mTnXkqLQRNF7jDVyDHiXMPh38cUjAwHH152igj22E9Lo
	tZxXcXLiiJnynkPviMvUgE96ONANCyqZtkqbMKi5uQjgxas2NL2aFct7Xqxk2z11ACJU=
X-Received: by 2002:a05:690c:f04:b0:8b1:567c:e7ae with SMTP id
 00721157ae682-8b3a8114a85mr9107737b3.47.1794368770490; Tue, 10 Nov 2026
 19:46:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110032913.71974-1-laoar.shao@gmail.com> <3296ff1ecad6573e1719cb205d9128f7@kernel.org>
In-Reply-To: <3296ff1ecad6573e1719cb205d9128f7@kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Wed, 11 Nov 2026 11:45:33 +0800
X-Gm-Features: AclHuK_EYuNKM1uN4O291ubvtl6N0s-HDZmJBzZexNtlBKQbnavU5QXTx2HKC3E
Message-ID: <CALOAHbDqE5qD7y5_A25wxWR603QcGnSVFFoBe6iZ4TH7t4a_Sw@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next v4 0/4] BPF-based per-cgroup NUMA balancing
 mode selection
To: Tejun Heo <tj@kernel.org>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, akpm@linux-foundation.org, 
	david@kernel.org, gourry@gourry.net, hannes@cmpxchg.org, mkoutny@suse.com, 
	shakeel.butt@linux.dev, roman.gushchin@linux.dev, yu.c.chen@intel.com, 
	zhao1.liu@intel.com, tim.c.chen@linux.intel.com, lizhe.67@bytedance.com, 
	ziy@nvidia.com, mgorman@suse.de, bpf@vger.kernel.org, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 2:45=E2=80=AFAM Tejun Heo <tj@kernel.org> wrote:
>
> Hello, Yafang.
>
> I'm not going to engage further in this series until the situation
> changes.
>
> LLMs have made it much cheaper to produce plausible-looking patchsets
> for new features. That makes it easy to keep sending iterations of a
> feature which touches code that the submitter doesn't really understand
> or hasn't thought through in depth. The reviewer ends up doing much of
> the developer's work while the submitter sits between the reviewer and
> whatever the LLM produces. I think this series is an example of that.

Thanks, and I'm sorry for the time this has taken.

>
> Some examples from v4:
>
> - A folio belongs to a memcg and that memcg decides the policies around
>   it. That's how memcg works for every other memory policy, and tasks
>   belong to a memcg too. The series still splits NUMA balancing into a
>   task side and a folio side with different semantics. DISABLED applies
>   to tasks but not to their memory, and the two sides combine the
>   hierarchy differently.
>
>   On v3, I asked why. v4 moves the storage into memcg and keeps the
>   split, but doesn't give a high-level reason why NUMA balancing should
>   work differently from how memcg handles every other memory policy.
>   More generally, the major design decisions come without the reasoning
>   behind them, and asking didn't produce it. Each iteration only barely
>   updates what was pointed out in the previous one.

The task/folio split was my attempt to avoid defining a single owner
for shared folios. That was not a principled design choice.

Shared page-cache accounting in memcg is not a clean ownership model:
pages can remain charged to a memcg after the tasks that used them
have moved on or exited. That limitation is real, but it does not
justify giving tasks and folios different policy semantics, and I
don't currently have a defensible model for the split.

>
> - numab_memcg_mode() walks up to the root memcg and recombines the
>   requests on every call. The callers include every load-balancing
>   candidate in can_migrate_task(), every task migration, every NUMA hint
>   fault and every page migration including compaction. This happens
>   whenever any cgroup has a mode set, although the result changes only
>   when a mode is set or a memcg goes offline.

You're right: the ancestor walk is not an optional optimization. It is
on hot paths, and leaving it for follow-up measurements is not
acceptable.

>
> - numab_memcg_active() reads css->flags once and the comment says that
>   this makes the three state bits describe the same moment. However,
>   nothing synchronizes those flags with the mode. In the lookups, the
>   check is redundant anyway because offlining a memcg or disabling its
>   controller already clears the mode.

For numab_memcg_active(): the technical point is that the check is
only needed where the memcg does not come from a task/folio.

In the task/folio lookups, the memcg is tied to the object being
examined, So the active check is indeed redundant there, and I'll
remove it.

bpf_numab_get_mode() is different: it resolves an arbitrary cgroup id.
There is no task/folio context that pins the policy. So I use
numab_memcg_active() there to skip an unusable memcg and continue with
its parent.

I agree the check should not be in the task/folio lookups.

>
> A developer could cost reviewers time before too, but each round took
> the developer much more effort in comparison. That kept the effort
> balanced between developer and reviewer in a sustainable way, and it
> made sure that the developer learned and improved while working through
> each iteration. LLMs broke that balance.
>
> I don't know what the right solution is, but at this point shepherding
> patchsets like this doesn't make sense for me.

Anyway thanks for taking time into it.


--
Regards
Yafang
