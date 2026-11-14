Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794686413;
	b=dHgNxUi1EzLy9B6Q49G5TQfKDlJaCVE++sJo3Ag4aURpCWlXXXcK5zp1YJVYcp9pLGB9
	 HH3RhhmXLLWRR9zgYY1//WIYxzJwwUk4FYNzt3WKzbIcJ/LrtS0kidFPAi0sAbRAw+GcE
	 E//72R5uh40WwzUbynSLxElD/FgeqqC22nY7z0IvxXEEECCBgy3UsV+TR7AaKeM0qxO3w
	 iWVypMVbgwCOkXKhNxLaOrF1+o4/eqOdv+5lUc5CtS0CKEyFDmFbDO3yDf35t80BVmffq
	 Q/Ncj74tqXLn6DJarC0psuGiqxiDfQwiiHOTfBvVOFkbKdKKjfdmmvs1PqCSwXh3Tng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sOR+YhJV4utRWR4d1PAjqxQcUdv0HHDpc8pa5uwTO94=;
	b=Wap7EP14tlGF0uX5KvmrzyRmc/XOHWNgDdqlL5xUFRiyPUQF3t74PhsLIUUdJn34S1Tu
	 dBUDTE0jN7xQUj6VFs2vXbm6uVmtzKaab8nBLBCZSZ1tsvxs60XVdHI08C6kMDQsL86TR
	 p6cDrJBad/5PMGzIQU0LUNdTFqaKbYXdInJ90fnV8283FHkokT35UqTi5n8+v0JCn1VWt
	 vJjTs6BAOLLZLe4gnndkDo5s44+Uk0ZnfV7gcF0TpgSUuRT4zfN5H2ovvM7K2QfztDlPM
	 zOcSOsL8DBUmdyhcVT6xFcQFPM6/P/vwfhO25d2u5XhZX3u3JO9UdbQZ3HXT+n1j2jw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F6bgDG8a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02732606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02732606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F6bgDG8a
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c50bf13091eso59567766b.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:00:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794686411; cv=none;
        d=google.com; s=arc-20260327;
        b=PYAqnJEIjVAntrnpxqHqFnSZfvGl162hsK/CrOLyE/eyFKVJKtdAiNdDies3+ZfcKz
         ep+mQ4gx9yKaI1yXjrJN+nL2LfNbxZ5VrERpAVL7Q/49Ill1klHHJoIrbeZCyUk79CuH
         +RB4Djzr6atsSs/1xpUPnlFNXhYMDw8cOcKncwL/v1NsU2apXJQ6g78nN1ic5LL23/vv
         KuBFWVMVNw0OvNh7soLEOHgfUNTKI4TOFQBy+IZy3CwVBGfxQU0Q/b1cKJjSlQkyTwXV
         LaYpnAKjKhQMPvnqt0G3UKmGo+Sa2r2CQJ5WRKdDAdykOL0C5GnJ31yH6aIwwuhZ54Xq
         rIww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sOR+YhJV4utRWR4d1PAjqxQcUdv0HHDpc8pa5uwTO94=;
        fh=WW5tWskDN93rF8hx+cXj39Sid/4C998DnyRSESh00hM=;
        b=j1uij/gp6KVSRpQM8PAJtyK9tsV+uYmqJvxDA6RvXiBFhOEw0aEBIYWOZZMxlhigCt
         XW7ShkOuhJT3PV10qmY8I0FcqKumJ1/wfY/jlEkZLLs9wJPIEZ06gbQK5GGA6iYHJH3E
         oH0KGV5WKD+WFYkXnCa1GF7A3Jf5yQ8fmPg9UqfAilgu6i29dRmg3CIDb+hQ7GqWmcd0
         6xHL5u4vyVyDQfQwjK3vnltoxMQKPNQPMh0aa04WmV4dDhs43Wd8n8Iv1Q7oqXrLIl1W
         ZCFLgQEpBvsfMM0/IaeAwqxfcq8qtpu/V7bOjGyAH2KVqowjNrT7VR60v4ti2YgVb9Lx
         lcwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794686411; x=1795291211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sOR+YhJV4utRWR4d1PAjqxQcUdv0HHDpc8pa5uwTO94=;
        b=F6bgDG8aID4X8x/ig3Xrcn6e7ZClhGdyk6xdxWyySovPWsb9OO95LldK3X2rVNSLfi
         NgPWLaF0au4y9xeHqhieg1/tPr+Z1nurmaIwcCS+5UytlDBS+lWGUx31bVRMmRK6V82D
         GdR7g443JTr7wzFKk55B24f018pvWBdSzXHUFO31cVtn2CQg8Qw4BdzM5B9XsmDc7YDL
         NvpdUOc5qIF750U3EMqe1GpuwhR5ZFlhpHbQBC31IreeIpl+H0BVnsxJv4OxejFUOSPX
         n6VXJ4ARd8t4Sbu2XT75LkIdaH0Fhx1Yl9hJunP3+XBsql3Lh/hd6uurhFPmogOXanMK
         ql4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686411; x=1795291211;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sOR+YhJV4utRWR4d1PAjqxQcUdv0HHDpc8pa5uwTO94=;
        b=vfGdxTSJbetKwzV2JYvEg1OTGR+ijo3sErIjREP4ffoBiAAa7uOpWg+r+mWwg34dpR
         IpMS2XFP3Zu7pKB5btQw9mxFP+KAvsZg9uspkZSParB4KRzqhCopoIVzNtbcdKHorUUI
         PThxrDD31L6eLHVc1hPIIHrD7qucwpYPRDGg22/uoI9arNlck5nlEYSe5UoB4ksj3b+y
         85JAhKcnb2x7PQLlEbyCQg/XJN7Uq3M+WkRz6yDfrD1MBLs35WgVyu6IK7axOp22Cu6m
         qg/2kUOJCz8/Sto4TrA+zXIpQA2zDeOkflZk4+SsPNveouhZu8zU+CXmIwHTMjJgS37/
         GobQ==
X-Forwarded-Encrypted: i=1; AL+hErHiZd2z9TGBuFDJP4LcnAPvlbjmO/5Lyui64K+h68LaL2ovegcSbhzibFPvLjPhN0iscBn5Ih1WZDMFods=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YTCDdWG2RXCD+9r3B05EnVw8vRKU6JD8RjraSJwclouTvttjd
	lOK0AgRyC2ITZEGaEGFvYfJ2Vc3fh6TKsTVZFMUJZ2XP7+A2RHJHl5uZIf7t6iWGMCy3QlsLrU2
	jBBohIhjj2Ebbs8Qafd8NGGMUWyAGy34=
X-Gm-Gg: AYBFou0FIQ8RHcatj2hvV9xR4nXYMl4upxCHGJi32THkYgYXZNIcH6rw7GvqFGBkI0b
	A6Aeh1E29k9KszwUVTj+hz7hYUmzJ8Bv2VK4okuN/0ia50VUcyH1owkTgDhYoMCmVgfdyOM3yil
	hvaCBbDMqEbh/jWbeA8erSB7yRSVTrkpPgIhYpd19lM/060WXb2+byX9cWSxsPZEMM5v8gkqNz7
	MqoUHfNHDT/YbtrFtwa3cG/qnfRPvtVhtK2NYQTIYlvgj3Sefl1MLvZRlUpKa9wV6vyF+OCn0kt
	sTbq985fH/yYdi6nwVxr0HmqscFT/suI4LHsedg41edv46MB1hdHs6ns+/dA+KgsBen4wmEdYp2
	4KT7UV94OYuEI58qKcMsf1hHuv+lg6SXM5rLcQEYxCG+xzfUQtGlezH8sd2noGwGdHJHGDg==
X-Received: by 2002:a17:907:3e13:b0:c2e:3ed7:7db4 with SMTP id
 a640c23a62f3a-c5096340feamr485567566b.23.1794686411138; Sat, 14 Nov 2026
 12:00:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110151407.789960-1-nphamcs@gmail.com> <20261110151407.789960-4-nphamcs@gmail.com>
In-Reply-To: <20261110151407.789960-4-nphamcs@gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sun, 15 Nov 2026 03:59:34 +0800
X-Gm-Features: AclHuK9LiJKo4q2X-ldOljDTJeh41yrOvsNPTDo5hFk09bG_rGCM5-ExnL2Puq8
Message-ID: <CAMgjq7Cwb-hTx=36CB_gYObgN+Jm4VihKrxzjxQ-YujvJEhKqA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mm/swap: skip relocation of tableless clusters
To: Nhat Pham <nphamcs@gmail.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, hannes@cmpxchg.org, 
	david@kernel.org, mhocko@kernel.org, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, ljs@kernel.org, baohua@kernel.org, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
	baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, willy@infradead.org, 
	brauner@kernel.org, linux-kernel@vger.kernel.org, chrisl@kernel.org, 
	shikemeng@huaweicloud.com, youngjun.park@lge.com, sashiko-bot@kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:14=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> A stale reclaimer can reach relocate_cluster() after another allocator
> re-isolates an emptied cluster and drops its locks to populate the table.
> The cluster has zero count, CLUSTER_FLAG_NONE and no table, so relocation
> can free it again and dereference NULL in the DEBUG_VM empty check.
>
>     CPU0                                    CPU1
>     Reclaimer                               Allocator
>     alloc_swap_scan_cluster()
>       cluster_reclaim_range()
>         spin_unlock(&ci->lock)
>         __try_to_reclaim_swap()
>           swap_cache_del_folio()
>             __swap_cache_del_folio()
>               __swap_cache_do_del_folio()
>                 __swap_cluster_free_entries()
>                   free_cluster()
>                     __free_cluster()
>                       swap_cluster_free_table()
>             swap_cluster_unlock(ci)
>                                             isolate_lock_cluster()
>                                               swap_cluster_populate()
>                                                 drop ci and outer locks
>                                                 swap_cluster_alloc_table(=
)
>         spin_lock(&ci->lock)
>       relocate_cluster()
>         free_cluster()
>           __free_cluster()
>             swap_cluster_assert_empty()
>               __swap_table_get()  /* NULL table */
>
> Leave tableless clusters to the allocator under ci->lock. This also stops
> a stale reclaimer from returning a cluster to the free list while table
> population is pending, avoiding the resulting FREE-to-NONE state cycle.
> The existing cluster lock serializes the table check and relocation with
> population.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/all/sashiko-outbox-203018@kernel.org/
> Fixes: 07adc4cf1ecd ("mm, swap: implement dynamic allocation of swap tabl=
e")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> ---
>  mm/swapfile.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 32639f65f13c..9fd62e4ca7a0 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -815,6 +815,13 @@ static void relocate_cluster(struct swap_info_struct=
 *si,
>         if (cluster_is_discard(ci))
>                 return;
>
> +       /*
> +        * An allocator may still be preparing the table.
> +        * Leave the cluster to it.

It's more like the cluster is in an "isolated" state so we shouldn't
touch it, similar to the "discarding" status above, this comment also
looks to me. Huge thanks for fixing this!

> +        */
> +       if (!cluster_table_is_alloced(ci))
> +               return;
> +
>         if (!ci->count) {
>                 if (ci->flags !=3D CLUSTER_FLAG_FREE)
>                         free_cluster(si, ci);
> --
> 2.53.0-Meta
>

Acked-by: Kairui Song <kasong@tencent.com>
