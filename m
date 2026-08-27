Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7017F279907
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815556; cv=pass; b=g/kon6wsSm5Rkh30VQvwVCAKDubO+UAJDtsJdcR9XxSurqA2TGfqJYTbwmkqkoOHK+qKNjyzZseLc5rdEKAvrJi6fLrAha7wYKrxhB3wi4/k3LOPqDKWv3nfARotJR7RekNGfCmgFIHUmVOgBeE7sez0HER3mIqv8FZto7vaERg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815556; c=relaxed/simple;
	bh=nqdYAE3DzNwx8Re7WzkaOLHuzM46BuJSDTWTl0D7N68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nN4tAYem4UASJ+MnE3YgR/E1649BTNI6n7qfFclwQDWaH00e7ifkXDYT29eJBN8yluTHESg7YjBD2v2/QjZ7nsE1C0Z7HjaEwapf+6RkT0GtDdnNaArq8N6FwRNIEvrHGES3i+/gqpBMQFV2cfQstOQHqxHNrXKddaj0yzt8/to=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4kivCjK; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4kivCjK"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso3047840a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787815553; cv=none;
        d=google.com; s=arc-20260327;
        b=jXBUAdHg1WU+xjVGHP8BGA5FwPxKLSnTj8DsVItGs9PBwMt8VDdydVWnb3GFtgJX7m
         G1bGECMCbK5h4yzQs+6FRjO2omJBnoypf7LSxACKjnsSLEp2+ubhkAEfeZRkiak3IEAO
         ONNsOBAIlesXJinHAy79n3zSNveXQ3YEQVrYm2twykAK0aU9+x0GcnakSCf20PWSLVm+
         tM0yKEBgR2V0zFuYqgJ7Y2tMKC34GqiFUnLh7l3lzXZGnRAXmf3BXfvGkhzWlRFnIszF
         BCvIX3PYURjHgxND0Cwh22kE69sc020j6sO4OGnVWKBayBIROsMwCLWpUGaC0yh8FHNN
         z8jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nqdYAE3DzNwx8Re7WzkaOLHuzM46BuJSDTWTl0D7N68=;
        fh=Pq8totMxK0UI2D0TS9FUT1cEDpHHeZf0LfmgV2LN7lA=;
        b=FnIcP684g6Gn2tj1KQQG9pF9oiGhVpt46oLraBiCyxywyuG00YUiCLkbDz13Ytb95W
         fq9pMdDKxGk1OUZ54FE1ANd4P2X+KpEFqsVa07n5hP/CCOosneDJV7vohGALwDpQ6Kuq
         UDSnNw+nWNFsLwp0lw6Hluz2/VC32PQjwKucD2Zqpq4cbngwShSScOJyL5mbJkQjfoMz
         OKYM0Y2wUVxvjFegzbq+dVBuDBpTmHnEZwN3euLQsaxsVWXy9hMzloqNgmeN2Aa8pUVA
         VMYUbuG2+llsKY4cxyHIQgkZ0lAWvgeck2rjQ47IM6oojZpWEJJfsgyGGVgiXALkUl7L
         udeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787815553; x=1788420353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nqdYAE3DzNwx8Re7WzkaOLHuzM46BuJSDTWTl0D7N68=;
        b=b4kivCjKzC+dQykp7f6eCYz9X6XVnbBI1f+v9c+zHaHLMsm/n8nJcJ76ADb1wLY95C
         2Y/VX73h/dxxD4lKBZTNgOxWb3oUBu01e25IOtChTxmqemf6RP6IMUX1qTUkIAv9oS/5
         NQKIsFS+NfE5/SSRZUxzKRt5bBQcXQm421xlYNe0JsUDFkKWayBkWhcCrNsm8ywGysud
         z+d1N/czbicxsQ5UtinU0RaFVAXgDtOGNoze7+j9ntylMaROlOWb8HzGzXM2B3dXLN9z
         RWpHQ8357qGKkL2C1depG5BTe+KKcKXNQztZOObhkbpv22oTYOma5EAfIq8W+mRe++M0
         P5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787815553; x=1788420353;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nqdYAE3DzNwx8Re7WzkaOLHuzM46BuJSDTWTl0D7N68=;
        b=l7MIYstEf7R0E4zszNvqdZWliMQEB9jpP63EtlW/QKKoPBi37lhLEuyDwd6K9LueLu
         5sI5TEZDKhg0NHxJ/FPmKDynysKeai0JUOW0QUE6eDB6Fy8fNc/lrKYLsYNEuvbDo/jX
         FYFz6Y7XwyAEVVULOILbw7Uuj27/JcsIZqwpFuWabbgUJ2E0XOCQ+2y2DEULLR/ZAq1f
         nS81ADt+9+0rYERKfNsF3kiFqPjmxzrGSKixjdVi2DbMk0UJlVjkpvRzddLqnPku/Y6A
         OHyah7lg8ug4/FvySBrF70O5vZFdyE7Kt39E23axPrYl75t8+n2PmIVPKPBxCMgpg9OH
         k+jA==
X-Forwarded-Encrypted: i=1; AHgh+Roz4UApLfudAGrdXAkE20/P8EmxXpclDRXgsT2MCoHpBVnX1CyGWJx1PK6ae8ZwHXwKxSgRveLe11Y9G/A=@vger.kernel.org
X-Gm-Message-State: AFuF++mRYRpOwl7to91fyKknNgmbyiroAFiBPTg7LZxsoZn2MnFkhxxs
	1sviGevEtIgj/+AscvRDCiWN4SfjrrhrrW2w5Yqxnd2plqu/iB1KeUkjTgmjvF+eHPn+6SW8qTE
	Zl99YUMe8AvfMrZSxl2h5utA5aZwnXSw=
X-Gm-Gg: AR+sD10HyIBqfJwQcEZN34QFflq6IPuACMGaMdehDhxNPnn2ZB4CLrQz5tXk8oDSMGC
	iV5PJ6+61blcjE4ZXIh7CKdwW4xeKwbYNMxEUqo1kdnYOd0yoliEZxB58aGn039XpueZ1quk1Hd
	oVW7+ZxVXNDuLOTmTyTNck7OgaFSsiylY687qILYhDk5FnVgt6iq87I3LjeAsq8MjyJQ/tQcu0T
	4C/bP2rLBiUlvwwHCwFtAZmUeOLOf/t8CebVqKSEJs4z3XDuqkKDuw0iO2ztRxLBbJRprlcRS0n
	YgawrwiRr42pp8fH8+UJL/0nMRICDf8ZUZ4Iig2LQLL2NaWfHMlN+o4INCGbaOBz026lNjxHw6V
	cDamx5AMZkoI=
X-Received: by 2002:a05:6402:4508:b0:6a1:f895:1ba with SMTP id
 4fb4d7f45d1cf-6a5df66c303mr12950074a12.12.1787815552468; Thu, 27 Aug 2026
 00:25:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820045603.68809-1-baohua@kernel.org> <7e897a4e-2075-485a-8cc5-5bb928fba437@linux.alibaba.com>
 <CAMgjq7DFpKU=QdT4QNAREL8oLg-OAxM6zMcYkCECBVg=U5ECsg@mail.gmail.com>
 <56b8e283-f849-4fd7-9c2a-64b604176a82@linux.alibaba.com> <CAMgjq7Aemn51JRVx1_zxG=Z3ZhTBUW01erEpgHfDWT=BPGBLMw@mail.gmail.com>
 <CAGsJ_4xyurha07UNXB91jP5De+syHuVi4EyAXfMpMWZvr4n1kw@mail.gmail.com> <70133332-966f-4bd2-99da-cfc5ad5fb6b6@linux.alibaba.com>
In-Reply-To: <70133332-966f-4bd2-99da-cfc5ad5fb6b6@linux.alibaba.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 27 Aug 2026 15:25:15 +0800
X-Gm-Features: AcwNN1XzEIBdrYx_8QnqfHlcDN8ximssQJ-i7s0PfqTykhhYNXebXL6gRC8BgT4
Message-ID: <CAMgjq7DudvXYMLD_1hnbK3ivPY0j6jUiO9b0JWdRg24B8vA7VA@mail.gmail.com>
Subject: Re: [PATCH 0/3] mm/mglru: clean up isolate_folios and scan_folios for
 readability and clarity
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Barry Song <baohua@kernel.org>, akpm@linux-foundation.org, 
	linux-mm <linux-mm@kvack.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Ridong Chen <chenridong@xiaomi.com>, 
	David Hildenbrand <david@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Lian Wang <lianux.mm@gmail.com>, 
	LKML <linux-kernel@vger.kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, lyugaofei@xiaomi.com, 
	Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Stevens <stevensd@chromium.org>, 
	wangzicheng <wangzicheng@honor.com>, Wei Xu <weixugc@google.com>, 
	Yuanchu Xie <yuanchu@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 2:21=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> With the above changes, I can also reproduce the slight regression with
> NVMe swap (set swappiness =3D 100) mentioned by Kairui (but the zram case
> still looks good):
>
> Before:
> sys: 757
> refault_anon 5554715
> refault_file 3867998
>
> After:
> sys: 765
> refault_anon 5791349
> refault_file 3939552
>

...

>
> Thanks Kairui for your data and anylysis.
>
> I mostly agree. But on whether we should fallback more, I still prefer
> Barry's idea. The current patch might be a bit too aggressive, cause it
> only fallback to another type when the oldest generation is fully
> exhausted. I've always felt that falling back too easily doesn't really
> respect the PID's choice.
>
> Of course, there's also the concern you raised about the limitation in
> try_to_inc_min_seq() when updating the min_seq. I think we can address
> that together later, so that we respect the PID's choice (i.e., try the
> reclaimed type as much as possible) without ending up with a tailing
> draining generation that blocks aging. That may not be simple, though.

Actually in the long term I think we should get away from the PID
rather than respect it more for eviction choice :), and use a actual
calculation that respects swappiness and IO cost (we can still use
the data collected by it though).

There is another series form Barry (and the clean up here is extracted from=
 it):
https://lore.kernel.org/linux-mm/20260812121658.69965-1-baohua@kernel.org/

To achieve reasonable swappiness following the PID and aging
protection idea, we will inevitably increase overhead, and PID is
really bad at protecting the cache anyway.

PID controllers generally correct long-term linear statistic well, but
they aren't well-suited to reacting to abrupt workload changes. While
MM workloads are full of such bursts and phase changes. What's worse
the design aggregates folios into tiers based on access, and the
limited high tier means folios staying in the same high tier can have
dramatically different access behaviors.

I think PID still makes sense as a long-term reference: it can correct
cross-generation behavior over time, but relying on it as the primary
mechanism for for single type eviction or protection is problematic.
In my view, this is also one of the major limitations that has made
MGLRU difficult to generalize across a wide range of workloads.

See: https://lore.kernel.org/linux-mm/20260804-mglru-fg-v1-0-4d8dad39dad6@t=
encent.com/,
by softening PID protection (still used, just with a much lower
factor) and using FG protection, zipf and real workloads gets a much
higher hit rate (much higher than 10%, and dramatically better in many
cases, the basic 10% gain is end-to-end gain diluted by the overall
cost).

So in the long term I think: For promotion, we will use FG; for
eviction (the issue being patched here and in that Barry's other
patch), we will respect swappiness & IO cost based scan budget
calculation. Currently, the IO cost is just the refault count, which
seems fine, this is similar to classical LRU, but ignores scan cost
because MGLRU's scan is special, full of lazy-promoted folios that
already offset the scan budget well. PID can stay to catch long term
characteristics, at a weaker factor.

(BTW I know that PID have a way to be more adaptive to bursts;
however, that's really hard to tune for MM, and doesn't fix the long
time cold folio stay in same high tier issue).

Maybe I'll just post a series soon for the eviction part.

>
> Anyway, personally I'd prefer to keep the original code until more
> impact investigation is done.
>
> Just my 2 cents.

No problem, I'm OK with this change for now.
