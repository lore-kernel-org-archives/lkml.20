Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854920;
	b=c1LAi3mYRKUWh/TmipCAGTANPZFne9df4ZflVvryGF44vau9/gnLeQY7z8j4Hv7b1htX
	 6sZONMvEjUCi8qB0WGEqrXYfumvbNd9tnndL4h/PtKsRzPrmLHeqMANkWJUtHj2Y1FJt/
	 I4jshAJ8dqJaGWNtRwWQitkD9+p6czbdk07PFIALqCiz/vTUTxet2agSU75NQYmzYGZv2
	 2j8P8C+rZKclWRDCKY/RQeRPKqzN8PQoOte2hBjkn1eUWFc4ZN3CMlGKe2/+CN8ipwY7z
	 +IZ6E/4hSKjR4/dros8XKdcSEOHb5T6d4naK9hL1f7u5xFsL4bGEvDiFJqvpJxS//Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=RgLMlA+/WqjKCYHcmI1Fs0YnRe4NhBu4xadeUTCY6R4=;
	b=SrLoTMa9iou/8KUwY8FjK9qAKJ4teX8y2rjD39GkxHIbEyCOGQ36RpMguEbhLD+y9Npp
	 iQwSgSfyBHPNKlvEINSIb8C5OkDMawxSLqFFYQKSrLGmX/Oy642HtnTg72zyiyeObD+R4
	 a+QznvZNzBuKu2n5wmWzrct0RNEDnmx1wz2j+KFw2Rfgu5xQsxNkV8LnVHBeQutW01ZBq
	 CX0Gk9urcgSl0sCgqQ4q+X3qxF7virtQHWOs8QRv/rbkJ83/+W+hww6bzRt8ppckbwOtB
	 YY7plH+tUxTdHSdMt+0G43lEyZqkYppoA8xL1++kC99lExmqEkaTYwPxvIvHIA+ALnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="fcrTVk/9";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A6C606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1A6C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fcrTVk/9
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3855235eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793854919; x=1794459719; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RgLMlA+/WqjKCYHcmI1Fs0YnRe4NhBu4xadeUTCY6R4=;
        b=fcrTVk/9WBnf3uj+fJ2axx+VS67YNvi50qerkX7mJwWkk72ucUOkWN984tQTxbhQm6
         N8hq/1VO99NMvPI9gmMXSRRqLn7PUJFy3WZD3/3A1lNt5HpSRZJJ6spYsagERqM6h7mX
         E5Qz7Z9FunN8CFirRX6W4O9Yq+ZsCcjacuuvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854919; x=1794459719;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RgLMlA+/WqjKCYHcmI1Fs0YnRe4NhBu4xadeUTCY6R4=;
        b=bReOYHKU95h3mB4SWbyGPfwblbaEeT8nLs02cOQY7ilNvOMj9dcV1wzbXCcb9gLuhi
         FSewcmDDcAJ6Cgb1SS8w49+oxMT0jN/Q2B7Bi0c5Amk5nDlYAbnciHtywv9l/85dW9A5
         JBF2rljg5zl9DUAvqreNTnNImsqOglx5WIIVdVjcC9A5OzncTZXcjneKGiNRisNYg8FO
         2YUBkLfUF0p2y+LCDIdSgE2EsC+r7MkUDW71z8/dJOQKzXoa9H2wbkdeZyK2THDCFtdm
         OYa/y6D8JzIJsOKCky3SRFpsFuVo9A/Szs2N0JOa4rMnWO2mNUzwAPXSFoTTytEOj7YV
         fpWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzO0BdoOeHyCjqgeBWF4CScpqHbcVuQhj7PMpBw8xfqdqS9dG3T0fnV9Ev7lnmU/thAfY4ND+VMFwjBAQ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z99tGx8GpWsr8aa9IfP1hHPUENlDitwE8PSKQkQxONbWfkvSkDF
	oNnee2i41oNWskGaN/GENBfnb86TAxRX9nh7h8GvannstPQ+FHHZfbvN2hkOUVUGTQ==
X-Gm-Gg: AYBFou2Ma9x+rNRtx7tAU0iVOQBHEdBCp200ixvobbq6UZXHxPlCHPUMLQP75cBfiOu
	wzfxo762l1ChyDG0kQTW8L+qrLWeg4CF/3whAQoxVqUfcPIFLUJIJECMNqqih+ARAknFIrJczl5
	LITGkctoDyEdsZPrFFoNGfNKId18oH0GvBIHwSAsML54vdmcq7mJPjwMigmaPq/xxIi4hVnfB9n
	xrhLX9aDvStdC0ez+7qFDmT6IR7HLUu57rHdlfN0B+UPDM1seztEQPvfpH9r+eKNhpVC+BlLCmN
	nK51bYXvtnP3MO2ldc5Hh3W2F2tUInm7sVELpOs9gz29PqV0jOI0j/O4RcDc1IGSctHs2Dz7bF8
	9j8cEL/tjk6CMp9fC62eVGgXrmmbnYW4TLFl10Ddg5Ox9oR1UftStjvdXearV916y95oCKje7KZ
	nOAl58Q5mkqc+neogvOa91Rjjkwh75VNxEBErf+S5vymvHmnIQZkqCyMYzWhP0NamSYEIShdRp3
	pgA0/AAXzPuwgcCn0g34pj2f8R+KuSoIThS9I0rxgOBcKex0oieN3QYDs5DqZrJtSW1KbLhXEq/
	JqcgoFGb1ZF7rgDJoYbhy7T7HhxN3OzAscWeGiL5wdj+6IWrUY8nCxvbxPvze6mLl6I1
X-Received: by 2002:a05:7300:471a:b0:36a:2382:7dab with SMTP id 5a478bee46e88-36a4232cda7mr25234871eec.6.1793854918611;
        Wed, 04 Nov 2026 21:01:58 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:37bc:b763:7ec7:65b4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b3b7esm12037974eec.28.2026.11.04.21.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:01:57 -0800 (PST)
Date: Thu, 5 Nov 2026 14:01:53 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Chris Wiseman <chriswiseman@google.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Xueyuan Chen <xueyuan.chen@vivo.com>, 
	Barry Song <baohua@kernel.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, xueyuan.chen21@gmail.com
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction
 budget-aware
Message-ID: <auwLksxxF3y-a80b@google.com>
References: <anVWZVOt-xeD0dMH@google.com>
 <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com>
 <anXJ-5_vO7-toSe1@google.com>
 <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
 <auKqt6b4AxCLziIH@google.com>
 <aufPMirl4cD7tz0X@google.com>
 <18e4542967ebdd10.3137322e32332e3235332e313736.1dfc41.0000sendgmr@google.com>
 <CAKEwX=MV_xEUvz91pz6uc4qXWnWOUDtXZ2zASdNVOBHBLeA60w@mail.gmail.com>
 <18e4ebf806e937ec.3137322e32332e3235332e313736.1bf52a.0000sendgmr@google.com>
 <CAKEwX=PFdgEbba+H3fEnJFDnfkxCTsvuHEb4numVwJRaiMgwKQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKEwX=PFdgEbba+H3fEnJFDnfkxCTsvuHEb4numVwJRaiMgwKQ@mail.gmail.com>

On (26/11/04 14:54), Nhat Pham wrote:
> On Wed, Nov 4, 2026 at 11:46 AM Chris Wiseman <chriswiseman@google.com> wrote:
> >
> > On Wed, Nov 4, 2026 at 9:57 AM Nhat Pham <nphamcs@gmail.com> wrote:
> > >
> > > Is this precheck basically checking if we can free at least one zspage
> > > of the size class before proceeding? Yeah the number looks good -
> > > let's add that, in parallel!
> >
> > Yeah, it just checks if a bucket has enough wasted slots to free at
> > least one full page before taking the locks.  Sergey pointed out those
> 
> You meant full zspage here right? IIUC we keep the entire chain of
> zpages around until the entire zspage is gone?

Full zspage page, right.

> > two counters aren't atomic together so an unlocked check is just a
> > best-effort hint - if you and Sergey are good with that, happy to send a
> > patch.
> 
> Personally I'm happy with it being a best-effort hint!
> 
> We can also recheck after we acquire the lock (but I suspect it's
> unlikely we'll get radically different decision?)
> 
> Sergey, how do you feel about this?

Well, I guess... I don't mind the lockless best effort hint.

I suppose another way could be an introduction of ->can_compact bool flag,
which we can set under the lock in zs_free() (that's where fragmentation is
created).  zs_can_compact() doesn't seem too expensive, but calling it on
every zs_free() looks a bit bad, we sort of want to do less work in zs_free().

> >
> > > Ah ok hmm. Sounds like internal compaction isn't that helpful, i.e
> > > zsmalloc already does a pretty decent job at packing objects that
> > > there aren't a terrible amount of internal fragmentation in the first
> > > place...?
> > > Should we do CONFIG_ZSMALLOC_SHRINKER (default to N or to
> > > CONFIG_ZSWAP) for now, and remove it in a couple of releases if users
> > > in the wild do not complain?
> >
> > Compaction still helps when we trigger it between bursts (freed ~21 MB
> > before the swap storm and ~10 MB after).  It just wastes time running
> > mid-swap when new writes are filling those open slots right back up.
> > Defaulting CONFIG_ZSMALLOC_SHRINKER to N (or CONFIG_ZSWAP) for a couple
> > releases makes sense to me.
> 
> SGTM, but I'll let Sergey chime in!

So "depends on ZSWAP" looks a bit problematic, because zswap has both
ZSWAP_SHRINKER_DEFAULT_ON (which can select CONFIG_ZSMALLOC_SHRINKER),
but then zswap also has module_param_named(shrinker_enabled).  So if
want to tie zsmalloc to zswap shrinker then we probably need to wire
in that run-time knob as well.  If shrinker_enabled should imply zsmalloc
shrinker (which I think it didn't so far).  zswap folks, do you have any
preferences?
