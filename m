Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567A034F24E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814909; cv=pass; b=O+3tESElnXHbTB1P/MOay7PFb9VvDsGLUW5enBmntPzUn/Uf4ROmagXreEHJQS2Eh4FxxjbLhjqmje5xVYdxw5VDGLegklmf0KV1176FKGRgrXTCX7W09OoIpGxP4jSO653Httgg/U3ZBSz4LO+WxeU7Y96pNACAW9bquWZK4m4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814909; c=relaxed/simple;
	bh=0WX2/gaEkBEYMG8ABuo+LESxvmJs+8+1r4PbbT/7xLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sBCqoiY8/OycBkttKetM42LaOg5DrN2JIDx5gYf1gUv+HK5t7lLnwklws7G5wYDc6aa32QFpZJWdkHLUpexjaWRHClrXSUFJGnJJb4pNxKQhvlkQI4DNP7/fTIBRchnDR92oL/xmNvJQzdrWa4hM/cO4l3hEKDv0gJ9EebSTmpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g27dTzjt; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g27dTzjt"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so20232165e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:21:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791814906; cv=none;
        d=google.com; s=arc-20260327;
        b=n44c74B6inz13defNS0qmlCmm4VtiGbsCyY0eN/gpsglZOz+PsRO/Pjhj9D7KSBRK4
         7yMQ8rRHETBi5DdCss16YrenBgAVRyGcKbDSMy9/a0OMpdpRfeiQkEQ8jWeY4XnMldf9
         m3Re3Rs4FQ5LLXQMDnk/GNyDivN/ezdzZJDnpz8K+hePBehnaqPLjJ6uxkHGAfUf+0lu
         XCyWCBbKDMZFefyg7CetgEILB+Uca17S6Msj67Lq3f3a9v6SY+o7AUKJH48KGH/lzY0e
         OFxGTTD/xT22ESMJGclPDdRmEuu2WDGUZJzjcGLRJoOGBfKGvn9fl2hhp6AWPe/TEOu/
         VAWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0WX2/gaEkBEYMG8ABuo+LESxvmJs+8+1r4PbbT/7xLQ=;
        fh=0N0emrrKWelU98mo7vfTEjtNjHYzbo0WdmfIaFG+h+A=;
        b=DvC4X175XDldgP4qnC802nA4nPjQMJYifh9i+OmkRuroAmomPgeEgikbtdQK3nJaSp
         SjrTSx3KjdI63XQ+Xh0f/PatsgcgCDSF5YNG6AGfB+Vw3TpE6OqOlqvNGcJ5j3PAlfIo
         s7JhBzAs5mp8248uimG6QtAz2gZjg4hzqDm6hzJHTvYs1WzL5QpeEqmKKWHlIWOd0uLm
         V+Ta5WM0K/Avafn7uP7vawNkVOdEJG5oQJrme0GxfGbu/0An+HCywJVaRLmOny7IoGcc
         I7DARIHDCr6alnNy4ZClT/sGxkeXmX7KueJEe3KnjFAhGqWzUh21rf9Y7pxohJAtApJJ
         k15g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791814906; x=1792419706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0WX2/gaEkBEYMG8ABuo+LESxvmJs+8+1r4PbbT/7xLQ=;
        b=g27dTzjtGrUKj2fmpvaHyAscwme8kgseRG9WcbK348i0e9OAvFlNK91fCmUitdL+Zj
         ZNgbLmObq50cP10g0wo2B3+oBZM+XRSZImWWEsXMTeymSY/1MIlxFlKga58V5d/H1dnx
         Xw8N/yWMfJThGhxOtfRm94B5+22bq3/6g/ZllppxzF7vMJ0oVX6m2dR9rydwBsvLe3p5
         hKVzeO12lmxUVhNSWogd/CpCuTxSF4xa8g0dmQVOlJVci3mb2WmqeDL+0989GStMKS+q
         JW2wn9hp6x2kNXLQz5Op1wchGBTzHspoIRx9byLhFmRsu6H5dU1xPZYwEcmS7IS3QK2A
         dKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814906; x=1792419706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0WX2/gaEkBEYMG8ABuo+LESxvmJs+8+1r4PbbT/7xLQ=;
        b=udSCxkZo2QJuQbWMCDLd4RWQ+8BKcKYXorhC909CK4N0TzezC3LKjW5drFJfzbgYwe
         sFqDct+bBhkhfjLzD+CtqTVjBPneLbKhWyIZxCHDYmSKD8YSc+HASihBVdI/QH+eIuk+
         ocwJ8iVwTsz9dOUERMl8zALPsu0hGOzBPMZwaQzwfNY4b142XBo9iJTxTZauNiQ2mCEg
         b9WxicO1PySRH3vmf2oCR79Ri4OrCEPlipM5IQaZCCIvCa2TDdwqm414D2mn8dAqWxRq
         eIQb2OsyDr+k5aYoGY/YC3KwRMFwKxyiZtPcllOBsKTQ9BBgB2+Lsg3N4lz8E3abBWLt
         bpMg==
X-Forwarded-Encrypted: i=1; AKwUvByzfmyhkf8nrrGyK5/9Lkijh2SzS03t1pqv0PXR8GqwmSc50xEpZYbuulXu+p3V9bNxFCrerCINGzmFkew=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAEYBe853j0ZxJb6jh93GoouDr878hcQoJYU0QHm8ajHt68/LC
	kkNqvIPCYq2NDhlRR2UlFtQffWDc1dcSfWpq7bBLJIhp6k7XWRfvaG3iogkDqCGJe9Nboi2WjpH
	M1TYc93NCtkDsxvqjXGXYOcvy8Sto5zOL6nmDDvc=
X-Gm-Gg: AYBFou3qqa1+CdED+owR+wyzVUzEgRRpa+XK02DA4ElcJNOFs/METUd+sRAon1TyZ+v
	h8MGjTUtN8a1hGEhCMqyUr/+p++/2+iS83gcU05PcMloWyN8pa1KDJukny6IFagkKFjxqTUfqRJ
	td+Xh6Bl1rsQAH01RKC6CiXwkL5H8YlBmhDct9DyB810ZT42GIPzeBBOgSCLdVFWs3jwtJzNNwa
	H2dPAOd+E2YGtKI4Tp76/UJosgQPjloxsDtSV+vxs2/m2mqKG8o6xU/821vcr358Zx6JeM6yf83
	7TykKV0MzmVV0EBAgx3VIUJhs5wUg48Z0rfmDFUOKFctNceOk295JHvKnCuX1D2vJCkRjlqFVlj
	9mRBdmciZvCtOTapWBXvkf1p6XjgNlc1j6VjE/zMNVcdwKdRuX4L4TzLcLzFiWRcMQBmajXw=
X-Received: by 2002:a05:600c:a404:b0:4a1:9945:98a7 with SMTP id
 5b1f17b1804b1-4a1994598ddmr77983055e9.0.1791814906228; Mon, 12 Oct 2026
 07:21:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007153915.53429-1-alex@ghiti.fr> <CAGsJ_4xyzgUH4uhKqpD7PTVuOzdsAkYgowsyn5iT1LHWiaYqqw@mail.gmail.com>
 <CAEmasaWQm6DPqAhmW_z=kuR+3LDWJ=h+yM0hAs+ryNoFQd6qmg@mail.gmail.com>
 <CAEmasaXa2pB_Jm_VgBZAWQwu1p75yUSY2=dr0Opt5okLgWk-YQ@mail.gmail.com> <CAGsJ_4xw+CLzrazOFxnvJCbvG0qoauEuFGR6OdtT3x78ef95pA@mail.gmail.com>
In-Reply-To: <CAGsJ_4xw+CLzrazOFxnvJCbvG0qoauEuFGR6OdtT3x78ef95pA@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 12 Oct 2026 07:21:34 -0700
X-Gm-Features: AclHuK_nMiNg-coFWoNQF0rahc9ryTutIxgwCK51zZOJ8W2ehwbLARYTQuobrow
Message-ID: <CAKEwX=NrMD1jpU=Kfh367mGArw_ju_8ku=Rh_v8TiLumx3+S3g@mail.gmail.com>
Subject: Re: [PATCH v3] mm: bypass swap readahead for zswap
To: Barry Song <baohua@kernel.org>
Cc: Alexandre Ghiti <alexghiti@meta.com>, Alexandre Ghiti <alex@ghiti.fr>, akpm@linux-foundation.org, 
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com, 
	baoquan.he@linux.dev, youngjun.park@lge.com, chengming.zhou@linux.dev, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, kasong@tencent.com, 
	ryncsn@gmail.com, chrisl@kernel.org, usama.arif@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 1:01=E2=80=AFAM Barry Song <baohua@kernel.org> wrot=
e:
>
>
> Thanks! This seems to be a strong indication that setting
> `page-cluster =3D 0` can also resolve your problem, even without your
> patch. :-)

If every tenants use zswap, yes. But we have tenants with different
kinds of swap backend in the same host (some using compressed
synchronous swap backend, some async IO swap backend).

>
> But I'm still glad to see your auto-tuning patch!

I think we need some smarter readahead work, for sure. I'm just not
quite sure what it'd look like in the end, though.

Doing synchronous readahead work in page fault feels wrong. I chatted
very briefly with Kairui about this. Kairui is trying to come up with
smarter readahead heuristics, but I don't know - even if it's 100%
hitrate, we're concentrating work of multiple pagefaults into a single
pagefault. That sounds off to me?

Crazy idea time - what if instead of skipping readahead for
zswap/zram, we offload it to asynchronous worker (only synchronously
loading the target page)? That'll cancel out the latency issue at
least...?

>
> Best Regards
> Barry
