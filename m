Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793021079;
	b=3HSd/a5SO6floWyKxxLdiZuJBrXpSsnIFs4EhkyFgpg7QV3aXsKq2aqdi6p3v/tp18wH
	 hqG42ta7jQJIGRaak3obylJhQ/iUjdznGxvEctC/gLPSW9OcvJ90NG+s4J8JcGDkLWXcq
	 3sTJHCnLIl3CvdiO1F50qqYmWmowuai1uoo7HKtt7Hzg7XAXk+cimScgoExhB+RjZO1Yj
	 GUpWZIko7xC/xVxyrTuTSxheNBer4G5zFf9P+UPtJu3xgA/DxNmSYwhx8K04xtBG4KC0c
	 +sxOlUQNpC/a1+drrWbJOXnx6AfJmeV3rLHTZeI9pW1uzr+0kFvFBhrQmA0fsPV/ypw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1akx8mxhc3uRZxvnnRf5cLwnJZH5AVzhLNQJJ8zSIso=;
	b=eaRRtn0lUEk9Lq3x+cM8iZvxWU96VBMsndjzYNq3dMk41WhcUW862LB4Okmu+PNkZYMz
	 66wuu2Tj/iB/C0FvlLCUyWb9cH1NOZ1ncf0FmjE0tkb3suyv3huAVeNQ/bbzFgVT3xuvy
	 8MzV0W2kvIEPTaI5pA7fFAvdMw5tQPawUpZnEDV33Cx2zFe43EJsTd8bGP1nWboHY4Dr4
	 RGrTkaodxCi0mYQ/himtIHpvImQXVrJbm7xp4GwPjxm7CzgAQV6XuCu8eMyve9tNo08a9
	 nXjARRaUXxxgLQA9hv3NN4QeEwvoe7rb+PHcHeFDBCQkKMyNthyF6N4+TpcS6leBXhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="ev8YhY/T";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E96B606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E96B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ev8YhY/T
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b3dc272dcfso3906448a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:24:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793021077; cv=none;
        d=google.com; s=arc-20260327;
        b=hpJYWidIv6StYJtQT0T9mkz+SyEk9eiSyGyAJTuk2I/yDMPmz5TE7zQbuqAa6t1tqx
         sn9JiPAqCmYrTvoh/qycjG8zWQuPLB14CTRpdET4DTCx0aco0AOl8h7hlKbUiyPMt0jS
         pV2eWht2ztyF57CBVCOKzWdeXKvvotjDNih6546gYySmY5DG+bBKeAi8FRzaNErKPfhh
         3ys0RAKikmrhwnp1TnidyCcmZzI46nAovVMI4FKy+ONhpODQ//56Wth+28Ui272s4tsT
         Iq3nwqJSjb99qzQ3lvsAGHogTvPEvanCUJMf9THcL5+LveWBMpV32R3Cty6FQOJU7g2X
         +7Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1akx8mxhc3uRZxvnnRf5cLwnJZH5AVzhLNQJJ8zSIso=;
        fh=vNDq8rkyLwEpOh5Du3vJXqCYGVjlfIGFA+8Jswve45Q=;
        b=AuGOMaoNXwmY1KNk+7a2lFbfc9zS1ep5OPcDOx+GNL8nz41ooP3eHETwEzSMrOpIiR
         zN0oM2hkXph83lYczuMmbDpHhBTZ7FebWft8iXaAGJhoR44AQBHgyEaoUzlGB8Y4QJPl
         zFQa0qak4s9rLwoe9kFgTWCj/uLmm8XJjTUi7DAqoKiUM41hUWkIA5sJhR+UTPW+dBNg
         XG0N+Jud00IDAE3b7RUx9veRuxeG9mgOP9u1y5JK0TKHFSd4NCAiNGAZQSuyARJXFWVl
         Zqtvvq87XEnCh4GjdtXnj0VTvUs6kLuWkp0IvvFIhFkNqOJp7KGWZllF6bve59D3lPEX
         WXHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793021077; x=1793625877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1akx8mxhc3uRZxvnnRf5cLwnJZH5AVzhLNQJJ8zSIso=;
        b=ev8YhY/T7Dlotkv6Muhfu6/Yvd6Gc0QOlpwg1/DLQHPioU3vGXLeUcaaoEibk3kKug
         R4NTJPIVcwxHZ7cYv5QSN2VoaF0SsfBAnPj/yF1CGXFKmD/Sg7R8NxaHjBAfmvaI+Oir
         QT5fH6Ldwd1c1zvoJtde7ipTAVx4sugNBfexBNG9+YcPdHyV8uL3evJG1CEHUiEGPrvQ
         6W58fPs4cgPTsqPBYuyfqB7Ow/73mr2weD2IHlB4bebxRBO9JzoSfvGGSWck8ZlfRu60
         l/RYlhy1N2Rtm57HTJnFVIgHeW74DlpIcO6Gk0sz70nx8Fa3zQrIUicSPsfvWJgoW/cS
         GwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021077; x=1793625877;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1akx8mxhc3uRZxvnnRf5cLwnJZH5AVzhLNQJJ8zSIso=;
        b=Z/UrmylyAgqjfssZLilxa+St9KvqJ2nOKz0w8HuSVhvSywRLRptMrAi6AeQYH044/A
         HYncLHLrswDQrymxhwRxJcqDdtGx0RMoCkh8bYsOh2TjXEkMlknNbEdMX67l0MUvM5XO
         68hp2eeroy3d+d3r94CPq9K+94VduveMqczYq60pIKT2x/yEj6SNp2e8/ySXg4mo6eu/
         t0EipPfqgkv3DqRQzUkPcyzArkw5fbdwZrtqlzV51XlVUki/y6OyrZ7AhmWdUMHG1Gy6
         uhA78on9+/3enpZ2zFCeSV0FfbFJoZxbIpEll01cMOVnh7CKcLrac+CAW4sqb3iZ3Sa+
         SSsw==
X-Forwarded-Encrypted: i=1; AKwUvBx5NC1c5EDaImTcOXVHKw5I3rMbsPL82zZsV4iI9fXA4mtt2al8A8YJd62BQjUCgSZIvjI4Kh7IjlgrcvY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTAqQ1BZaE7p1hs/wAcFNGmI6La4P2vB5h5h5ctqtMP1el06/V
	QebrK+RqYGLSSQjA2xUh8+buw/KZ0fMeP0aiR8LY191j0+/ySLLVuenAZlRy74fy7Dh72hSefrn
	P4Rl2SebzQ+Q6LRI+p7KpktqVxucs+cE=
X-Gm-Gg: AYBFou0Gu40Yjy5oHVpYS8zTa7IQVeylvc3vyuG01/URqsQLtUTwVXonTx25Wu4WaF0
	0VYCPhlidn/CRa9YRVXc9ew93JZyP1p6uVQuXXed40dg4C5whaCQJVMDrd2oRqyp4/r6s17HF/c
	jzTJv9lmmlE5G/NsvzcFoVwVdWZR42wgiThEkDGsVS1Do3638rXcUCs7kPU7DJwBe3RCt7wHnob
	C3yRV1kTsh0/VDRr/UBojrvwyricIBTeBRiowNh7yYRU5zVpPQ33ir2FwlzJdyxBNG3rDwyQ0al
	krrIof1ahKMszdF5j4KDHwrj4ECjgw8xE5utYJiPX6Dtk4pjd0DP1anmk1WZL+5Gu7+POdZfRNG
	gZ8+5nyMYOMEQFS+NpAzA/jhxxyAvfSM9igNdkmhXhN9hI8s1GR2wY2UcpCbv+mcUDYXCrQ==
X-Received: by 2002:a17:907:3e07:b0:c27:420b:7c79 with SMTP id
 a640c23a62f3a-c46bdec7fa6mr869390566b.48.1793021077106; Mon, 26 Oct 2026
 06:24:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-fixes_shmem-v1-0-703206d5fa0c@kernel.org>
In-Reply-To: <20261026-fixes_shmem-v1-0-703206d5fa0c@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 26 Oct 2026 21:23:59 +0800
X-Gm-Features: AclHuK_NnGMoCvEgkVlwGinh-S4Fg9jmm7mGH3lQNtt4b6ijBwpE8tzVis4U-Rg
Message-ID: <CAMgjq7B19MT6t3-BisvQ_V8xoxkZyQXHXNH457UT98kwzVMGKg@mail.gmail.com>
Subject: Re: [PATCH 00/16] mm/shmem: various (urgent?) fixes
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Gregory Price <gourry@gourry.net>, Zi Yan <ziy@nvidia.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Vladimir Davydov <vdavydov.dev@gmail.com>, Michal Hocko <mhocko@suse.com>, 
	Hugh Dickins <hughd@google.com>, Lukas Czerner <lczerner@redhat.com>, 
	Carlos Maiolino <cmaiolino@redhat.com>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Daniel Verkamp <dverkamp@chromium.org>, Jeff Xu <jeffxu@google.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	David Stevens <stevensd@chromium.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	William Kucharski <william.kucharski@oracle.com>, Chris Li <chrisl@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Chris Mason <mason@kernel.org>, stable@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>, Eva Kurchatova <eva.kurchatova@virtuozzo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 5:44=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> Hi,
>
> the fixing fun continues.
>
> This is a handful of fixes for shmem/tmpfs. I sneaked in a related
> hugetlb fix that stalled upstream.
>
> Some of the stuff is more urgent (patch #1, F_SEAL_EXEC, truncation
> hangs), others are less urgent but still rather unpleasant.
>
> The majority are fixes from Anthropic that I cleaned up or reworked.
> While doing that, I found a bunch of other issues and tried to fix them
> somewhat cleanly.
>
> In general, shmem + swap handling is a nightmare. shmem_undo_range() is
> such utter garbage it makes me want to cry. I mean, really, WTF did we
> end up creating there. Does any expert here have time to clean that up an=
d
> make it *actually* maintainable.

I had a nightmare understanding what is going on there when I was
trying to fix a few swap related bug... :P, and hesitated to clean it
up... I think we will have a cleaner codebase on this part soon as
Baolin is working on this.

> The following things are still broken in shmem_undo_range():
>
> (1) Truncate/punch of a single page of a large swap-error marker
>
> We don't split. Consequently, read access afterwards will still fail
> instead of returning 0s.
>
> I have a fix to try to split (which can fail), but I don't consider it
> that urgent, really. So I'm not including it. Might send it later
> separately.
>
> Truncate/punch of a partial page can obviously never do the right thing,
> as we cannot poison parts of pages ...
>
> (2) Truncate/punch whole pages within part of a large swap entry
>
> We try to read the entry, but if we are out of memory that might fail.
> Consequently, we will not free up swap space and a re-read will not give
> us 0s but the previous content.
>
> AI proposed a nasty NOFAIL patch which has too many nasty side effects
> IMHO (allowing users to force-read pages and retain them afterwards even
> though memory.max would disallow it). This needs a proper thought. Likely=
,
> support for splitting large swap entries (and large folios in the
> swapcache, which I recall is under development  by Kairui). But splitting
> can fail ...

Right, will post something on that swap cache splitting part soon,
what I found tricky afterward is lazy reclaim of swap cache so I think
a bit further clean up of THP splitting is needed first for better
swap cache splitting.

For shmem side, we don't have to swap in at all when truncating
page-sized holes for large swap entry. There is nothing complex from
swap side, just lock the cluster, then put/free these sub-entries, and
everything is good. It has to do a swapin for shmem right now just to
make the shmem part easier to reuse the folio entry split code and
better synchronize, IIUC. Nothing is blocking this except that we
better cleanup for the large shmem entry splitting code too?

> (3) Truncate/punch of a part of a base-page swap entry
>
> We obviously have to read the page in, in order to 0-out the parts to
> discard. That might obviously fail.
>
> Maybe we should install swapin-error markers if swapping during
> truncate/punchhole fails, to at least tell user space on later access
> that something went wrong? We might affect unrelated data, outside the
> requested range, though. Anyhow, these are long standing issues and
> I don't consider them urgent.
>
> They need a proper solution.

This part is tricky though... perhaps swap side needs to provide some
helpers to trim sub-page sized content on the backend (not sure). If
that's too complex maybe limiting the trim window to just 1 page a
time won't be too ugly?
