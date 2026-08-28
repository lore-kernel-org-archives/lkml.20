Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CECC3812DD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787887370; cv=none; b=a95xhfb+EhQKBVoDimu0b/mtJmfV4pvEgGBUzZufkhd0dpZVr8/WEAZVjQK6s0Bw3L7yPN0iGMoou/meUEIgOzBuoWrY9WEbPvKQ4ReX98Hc+8bAYnsgRHtbz2mpmAu51nKmfdNCx4W4fInIT/LiQyVCyjSeeNvnUMJr4Yny5kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787887370; c=relaxed/simple;
	bh=a09LuCjVegQOs2yTOsnOYKFJHptgCvO4V9YxAt1yjks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b0XxWTnMBwZv90eXgaw3veTqX+LJGFZP+3T75r8DG0U0pzLaOL0PalO4ygL/QrRdk697QXmAQ/AeM+Jsh60j4hAt/mAe8v79+9u0rQoO5M0HmRqVey2SDmI0NJUNa9mPqK/7nUcM49ItSZ/LsqOEfltQoODHx7g4NiiXiPd21Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XWLJLsUC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XWLJLsUC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0771F00A3E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787887368;
	bh=Q2rIqjHXEHIXM1/7XBYn0i1tnPA1wSPEhavY57zxMC4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XWLJLsUCyt/mi1UexhRrGi2Ygje5PLuZAhLARUvOZZ9LfihTY6XGdKyKURi9HBtwt
	 OVT2H2hYc21C7YnMycNu8Qbi9IYtmAn0IsT6Wtmq50x+06whCoqmjJ/mc8tGYBqloG
	 HaCVAWxpwKjdB2f5pSjDEKk+Ffc5ewj72FVek/lCKzxfN4TeSRfuE8xILfFvnEBcBJ
	 cDSlnwkZHpqZ+ymv01IV6mXiQJlEfcgoIouZyy9xMOPbF80g6ynhEaHizfIGbZisuc
	 EdTxmXM8wqDSuMnt1QAyjVojhMnJTkEmA9n+WFCpLAegQ0R4bSpFuxfpFUIWcvgrsN
	 CxRDGraWT3Jww==
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-90ccbed6edcso5102816d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:22:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RriJ2+T+C3UoriBo/Z8dxGy6K460cVQCe10UR4pkZ3Tf+G/hy8+NFS1KOP91yvXycXZO19EWqHAyLzHpnc=@vger.kernel.org
X-Gm-Message-State: AFuF++lQumzaZglgQSbkO6XqqyUqov3Qj/4raunaNhTTfKHBvqQmAdcB
	dKVKpLt16mph86PiRV+vS7Dm3AuEUxUvQ3YagwNSAszOdEJBTLJq7vrFI+/SBGrbIO5DdRt5uCk
	4UNPznGpz2yYdsv2B9zpmmuWGRCFGOY0=
X-Received: by 2002:a05:6214:e84:b0:90a:3c0e:a686 with SMTP id
 6a1803df08f44-90ce0e75afamr47565626d6.8.1787887367953; Thu, 27 Aug 2026
 20:22:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820045603.68809-1-baohua@kernel.org> <20260820045603.68809-2-baohua@kernel.org>
 <apD9QqyFGRoGxyZA@fedora>
In-Reply-To: <apD9QqyFGRoGxyZA@fedora>
From: Barry Song <baohua@kernel.org>
Date: Fri, 28 Aug 2026 11:22:36 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4w_c2mf6X7PXHc7W4+jQ57un+eewfh9K1dXha29Hw12rg@mail.gmail.com>
X-Gm-Features: AcwNN1UoQm-6s632B-aENk04GESXEsjpOWWCttgK-XNaJ8utFIu10DT_GtcbU5g
Message-ID: <CAGsJ_4w_c2mf6X7PXHc7W4+jQ57un+eewfh9K1dXha29Hw12rg@mail.gmail.com>
Subject: Re: [PATCH 1/3] mm/mglru: improve readability of isolate_folios()
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

On Fri, Aug 28, 2026 at 11:15=E2=80=AFAM Baoquan He <baoquan.he@linux.dev> =
wrote:
>
> On 08/20/26 at 12:56pm, Barry Song (Xiaomi) wrote:
> > From: Ridong Chen <chenridong@xiaomi.com>
> >
> > The for_each_evictable_type() loop in isolate_folios()
> > is misleading: it does not actually iterate over each
> > evictable type. Instead, get_type_to_scan() selects the
> > type to scan, while the iterator `i` merely bounds the
> > number of attempts.
> >
> > Make the fallback behavior explicit in the code and remove the
> > opaque for_each_evictable_type(i, swappiness).
> >
> > Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> > Co-developed-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > ---
> >  mm/vmscan.c | 46 ++++++++++++++++++++++++++--------------------
> >  1 file changed, 26 insertions(+), 20 deletions(-)
>
> The subject doens't reflect the truth. This patch changes the behaviour,
> but not improve readability of isolate_folios() only.
>
> I also noticed the confusion of isolate_folios() implementation, and made
> a patch to only change the local variable and added code comment to
> explain it in my local branch. Surely refactorying is also good.
>
> +        * Scan at most one type per evictable type (anon/file), starting=
 with
> +        * the type get_type_to_scan() picked as statistically colder.
> +        *
> +        * After a scan:
> +        *  - isolated > 0:  got folios, record the type and return.
> +        *  - scanned =3D=3D 0:  the type is empty; fall back to the othe=
r type.
> +        *  - otherwise:     the type has folios but all were hot (or los=
t an
> +        *                   isolate race); retry the same type rather th=
an
> +        *                   switch, so positive_ctrl_err()'s refault
> +        *                   statistics stay unbiased.
> +        */
>
> While in Ridong's patch, the 3rd case disappeared. It doesn't rescan with
> the original type as the old code is doing, but return directly.
>

right, the 3rd case comes back in patch 3/3:
https://lore.kernel.org/linux-mm/20260820045603.68809-4-baohua@kernel.org/

so i guess we can rename patch 1/3?

Best Regards
Barry
