Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14625411FBB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788386910; cv=none; b=qSLp3riz5GdPagOZDvEKXj3gOXqHlYT47pTiYRXw6pc8D4v7Pt+Vn1vks1dfJU/7amDP7uuG3GKsEGBLSCit4iliELxIKLN874s6je+RXFp0DHQG/383gHZV3Xgl3oRCZe5OvGD3Ebg5bEenLcgN9PXAT+vFLgQUt/ppt5bSNmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788386910; c=relaxed/simple;
	bh=zioYbL0Tm0xOiVWZ/OcM1/hzX9Tycdl6ykoK3iDZOzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aSoHIpuJSxGpXPaySTnjuOYdGonILpcu4kBbxzSux043lR2gPIiapMZw0qxA7cvY6tvEOGUMFFrE/bOoJyLcCODitD8qObkn98kwKvlxIezAzWv+ZqOuqd4Ot878Yeh+zfJyzYzAC1OrDB7FRWWxtD3yVRdTwSp0HUpiIgz6jEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuHhDc5P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuHhDc5P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741F71F00ADF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788386901;
	bh=HXwkquCI6LmZGWEehEfPtdKpLqHe4vbF/JANGMpvusI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fuHhDc5PRndfYJsjaoKrh8YW800YD8LXwVGaGjOJXcXGwNjSeoF9s4w0hwDqtCsm5
	 nzzZnan34vN4n5y2ECh93wTNq7TWWLslr/MtcZUQzJliTV+NfudrZc0/vaQqqaobpX
	 EuvpAT7B+IBHv+Af/963EbQqd5ZtRMBFhXL/Hx9DyGAn0cOl386ZU4koJjBi6QKEzH
	 0GWkkCZuICrlSjG3Jsm+jPMlRa1G+xOhviGR6qzNvUALo4uIUXZeevQlqPPI9iBYno
	 fyxPTEx/Z+V1IyjhyU6oLhRY2Lv0CbSSczmVVDjm8Uj/Fc2N6YhvvKfSSqdXd2tr2U
	 XsQ6duomzawlw==
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-936e393176fso135572885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:08:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByZoO6Q/leZBjut2Vwha8J4uWscGgWqImejmu+NXTTBL/iMgL9G+eGtLlmxUKsmpN+0x08yyJHhsteGppw=@vger.kernel.org
X-Gm-Message-State: AFuF++kxRbDo9oICttaly6nUJrdat6AWBpd5vKduo7WKMyoSWBJAxwub
	DcSwCnKK87OOi1jpvsRVFLjKEUwlRkjTM3Q03xVweICMUNJcTokK8QFvXa0wWSFaQMwdCTdYp6/
	FzRv6LBXDRjS6H+jqgMwKQugrbgkYLyI=
X-Received: by 2002:a05:620a:3196:b0:936:31c9:6c57 with SMTP id
 af79cd13be357-93960cd1611mr870285685a.7.1788386900768; Wed, 02 Sep 2026
 15:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829074204.45304-1-baohua@kernel.org> <20260829074204.45304-3-baohua@kernel.org>
 <apfZQE1X6zGAsBb_@fedora> <CAGsJ_4z=A3EGajzL8F5H+0fwyzh3qqMNACEzo20J83m+T8bbZw@mail.gmail.com>
 <apf3ivSCu9kQfM9F@fedora>
In-Reply-To: <apf3ivSCu9kQfM9F@fedora>
From: Barry Song <baohua@kernel.org>
Date: Thu, 3 Sep 2026 06:08:09 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zfDJ2+qG-NHQoSi=KOPdsfi3YHL63gZytDGUhW1HOpvQ@mail.gmail.com>
X-Gm-Features: AcwNN1XFDhZ-DAqDQEdt5t8zknTH46vTp3nSSajFNh_qOLjujxTdo9wNIES4DYc
Message-ID: <CAGsJ_4zfDJ2+qG-NHQoSi=KOPdsfi3YHL63gZytDGUhW1HOpvQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm/mglru: make retry logic explicit in isolate_folios()
To: Baoquan He <baoquan.he@linux.dev>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, chenridong@xiaomi.com, david@kernel.org, 
	hannes@cmpxchg.org, kasong@tencent.com, lianux.mm@gmail.com, 
	linux-kernel@vger.kernel.org, ljs@kernel.org, lyugaofei@xiaomi.com, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	stevensd@chromium.org, wangzicheng@honor.com, weixugc@google.com, 
	yuanchu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 6:17=E2=80=AFPM Baoquan He <baoquan.he@linux.dev> wr=
ote:
>
> On 09/02/26 at 05:20pm, Barry Song wrote:
> > On Wed, Sep 2, 2026 at 4:07=E2=80=AFPM Baoquan He <baoquan.he@linux.dev=
> wrote:
> > >
[...]
>
> Hi Barry,
>
> Agreed on the one-line change for the (1, 200) case - I traced it and it
> now matches mainline exactly (no extra third scan). I personally prefer
> the for (attempt =3D 0... ) style because I feel that makes logic clearer=
,
> while everybody truly has different code taste, LOL, just a weak opinion.
>
> For 0/201: my concern is that on no-swap systems (swappiness 0 is
> file-only), the same-type retry when the first scan is busy may be a
> no-gain run if the file generation is dominated by protected/ineligible
> folios - the retry re-scans the same sort results. But if you see a case
> where the retry does isolate folios on the second pass for single-type
> reclaim, keeping it for consistency is defensible. Do you have such a
> case, or should we drop the retry for 0/201?
>

201 only applies to proactive reclamation. I believe the retry helps
avoid having an outer loop. For 0, I ran a kernel build test on x86
with swap disabled:

# free
               total        used        free      shared  buff/cache   avai=
lable
Mem:        23991248     1315020    20554564      331312     2121664    220=
99256
Swap:              0           0           0

#  time systemd-run --scope --unit=3Dkernel-build -p MemoryMax=3D1500M
make ARCH=3Darm64 \
        CROSS_COMPILE=3Daarch64-linux-gnu- vmlinux -j20 1>/dev/null 2>/dev/=
null

With the following patch for counting:

diff --git a/mm/vmscan.c b/mm/vmscan.c
index bf2786c7247d..e8d5603cd56e 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4913,6 +4913,28 @@ static inline bool is_single_type_reclaim(int swappi=
ness)
               swappiness =3D=3D SWAPPINESS_ANON_ONLY;
 }

+#include <linux/proc_fs.h>
+
+static atomic64_t tried_isolated;
+static atomic64_t tried_not_isolated;
+static int reclaim_stats_show(struct seq_file *m, void *v)
+{
+       seq_printf(m, "tried_isolated: %lld\n",
+                  atomic64_read(&tried_isolated));
+       seq_printf(m, "tried_not_isolated: %lld\n",
+                  atomic64_read(&tried_not_isolated));
+
+       return 0;
+}
+       return 0;
+}
+static int __init reclaim_stats_init(void)
+{
+       proc_create_single("reclaim_stats", 0444, NULL,
+                          reclaim_stats_show);
+
+       return 0;
+}
+fs_initcall(reclaim_stats_init);
+
 static int isolate_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
                          struct scan_control *sc, int swappiness,
                          struct list_head *list, int *isolated,
@@ -4928,6 +4950,13 @@ static int isolate_folios(unsigned long
nr_to_scan, struct lruvec *lruvec,
        scanned =3D scan_folios(nr_to_scan, lruvec, sc,
                              type, tier, list, isolated);

+       if (tried) {
+               if (*isolated)
+                       atomic64_inc(&tried_isolated);
+               else
+                       atomic64_inc(&tried_not_isolated);
+       }
+
        total_scanned +=3D scanned;
        if (*isolated) {
                *isolate_type =3D type;

I got:

# cat /proc/reclaim_stats
tried_isolated: 12096
tried_not_isolated: 23061

So we see some cases where the retry gets isolated folios, while in
others we still encounter promoted or protected folios. But my gut
feeling is that even if we don't retry and instead go back to the outer
loop for another iteration, we'll still encounter those folios, since
they are still on the LRU. We would just reach those folios in a more
costly way.

Thanks
Barry
