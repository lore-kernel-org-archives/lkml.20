Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4D0416878
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 05:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788499824; cv=none; b=sFs+hjKoGy+QxpSFPas1pPHEqCD0SXpu+v0BYo8o+HVzNPIc+4ps5dqvuRHdAFfK3SZ0j5hBZBbhthtJGn1G2/O9OT230UCJ6N5Y5/5ccV0JOjyfi2tH/ZWiVxwUCLODIdloR8yLR3iNf8kcs2GlnJNdVngaWPZ1DOuw0vXumns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788499824; c=relaxed/simple;
	bh=DDsae5PYRHBzB8MMbUqjMxYCjTAfs5Wrghb8LnCGy4c=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=WQfCn7jNRS4gy/D+ieLJngWP8fdViKqFWWoMg92OCDy0jnvt9T30T+QXNz9rTAL8vmK+8H/GGGBZDBAiom+0tHWp9KD0NJgeBXVAXbEAB9eItfU/vm6Jys6h1HxI7eIOKMIfK13FrDzI4qjTwJr+Ophk98CjypXgzgl4QjZwCU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ferrisoft.com; spf=pass smtp.mailfrom=ferrisoft.com; dkim=pass (2048-bit key) header.d=ferrisoft-com.20251104.gappssmtp.com header.i=@ferrisoft-com.20251104.gappssmtp.com header.b=KfRyhIyo; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ferrisoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ferrisoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ferrisoft-com.20251104.gappssmtp.com header.i=@ferrisoft-com.20251104.gappssmtp.com header.b="KfRyhIyo"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so819566a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 22:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ferrisoft-com.20251104.gappssmtp.com; s=20251104; t=1788499819; x=1789104619; darn=vger.kernel.org;
        h=references:in-reply-to:subject:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=g4XHZarYyGiNGF21Yvcw0I+AYGTcuONz0i7wXp0V4/g=;
        b=KfRyhIyoYKgUVLg3FinxS6CDKv9PnKJXWAG/DKURb5chJ45YRhNnYQG2ahGMZw1gM8
         mg/o/Eey8a0NNqX33DT0cfgqNJVbZtEagxlYu8yvn4E4inaDGHPD0Cd35eBNuAQ/sGjA
         6p/tk+qbhAwABL5ebhMynMjeGw7RWHWn24ixPJ7ujIl/SuhINgD2+OkbdmxQF4c/xcBd
         B/+BhzhdkNiWaErQNZ7aoKgIq0hcIDDF0/mg/TjEyemLsaf2qRo72WO43mHP1odDas/E
         lOLrK94h9sxg2hNTxacWzgX69vUoDe/lcB2noG89Z7ZaYHaLUviZIsiWzNV/w5p+xaDC
         xwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788499819; x=1789104619;
        h=references:in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g4XHZarYyGiNGF21Yvcw0I+AYGTcuONz0i7wXp0V4/g=;
        b=GrA1+wxcXxAQmA3BNgIDt0VNpdid2XooOQ7Lru2xFm8qDXgK0o4o1V/lxTWXcNG9f5
         +3cjRXn3t30DlyJhIXimdmhctdJcCuBuNwXU5ap6LUhBJ1yd9nJOEJTVCFxK5s7cwsfg
         5k3CM5p6S3kcn8yAvswqijfWboofVNSEvK9Xw8B8MNqLJ+r2bMB+HsLnuhVdgGXwSnkG
         M/RFGggXZNTFQpIeli7qnW8bkw8GBq6Z66VsnUvP7ZswNU3H1acfsx+3P3lTgRUNFkAO
         6RQAsZsz+7KWqftWxGOuOn5e29BwuqgH2NA42AiWOhFp9QTyp1b74RZ5XVBnfn9x5rfW
         j3XQ==
X-Forwarded-Encrypted: i=1; AKwUvByqWx1FLreLZPzkCd4lLc+zRnwJTcmDx+j0g1GIpYcKOJVHqu7uKbsau1XiW6A1Q5ivum9Hg0kZQBOhSBk=@vger.kernel.org
X-Gm-Message-State: AFuF++mOwc7dGgfJ3k/RsIwOmhU7bvGANIiIWiIqeZJ2QxsnTONLWbFz
	n1JXzKq/QNmtWMcrQ48hIlhW4fBrUNNnUyFZZ02Wf5a5k/9sKraZvbJamLu3wo9by4Ug
X-Gm-Gg: AYBFou1ys8UXbrpa5BeWyrQh1NDXQ1IMCevf+tRBPID2mXLYG3ThQnSoJDGWtN1c/7x
	dzm6EaKDCcCtcxhIvwiWnuOcyzTLJXiySO6z1dAWx3Xcf0PmzNxDaYOzKMMplbD9vfJA/o1cd3G
	GUvrlvBXBC/F7ARhl25ysYR7rtbpu6LY26xToeH/dayn+/4+dmFtQ2BLl4WeivMoyYBNrcnK7gy
	ClBUmyF4ljWjT2CIrpzNM6xkimqzzxmT8+FhBRhwXCgL0YMYnYaBWNP4RAq452FKupzSylMMftp
	2eWbJ6kPG9HsgRIgZWs9pMtMgfs2spAgB/Weu/ucaHIljC9Dj6U3iqwG5XQ0se/UBnxVoqLjg+K
	iJ1bkdobgYGwQXhaHfWfk1ZKVFfKUJ+H3B4XZnCI4S5uCH9u/mHwebAR6RppQLMW/X6myy9TCS2
	GZBhHTZ/WemHFziGEwXngj6r58qgYmEYn4YX7eks+33czMPPixwsAXFjA4n+GIzqcD7rXvUj8Yj
	moFbAC3SevsGNjQUUZ4JJupP+7W3xv5e9Dp
X-Received: by 2002:a05:6402:3215:b0:6a7:ea53:f618 with SMTP id 4fb4d7f45d1cf-6a7ea541009mr554153a12.23.1788499819053;
        Thu, 03 Sep 2026 22:30:19 -0700 (PDT)
Received: from outbox-0007-reply-tested-by.eml (45-11-61-69.ip4.greenlan.pl. [45.11.61.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68e8f2fsm714179a12.19.2026.09.03.22.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 22:30:17 -0700 (PDT)
Date: Fri, 04 Sep 2026 07:28:43 +0200
Message-ID: <20260904072843.tested-by-bh-submit@ferrisoft.com>
From: Greg Ociepka <greg@ferrisoft.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Christian Brauner <brauner@kernel.org>,
    Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
    Matthew Wilcox <willy@infradead.org>,
    linux-fsdevel@vger.kernel.org,
    linux-ext4@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] buffer: fix NULL dereference of bh->b_folio in __bh_submit()
In-Reply-To: <20260902013357.2815214-1-joseph.qi@linux.alibaba.com>
References: <20260902013357.2815214-1-joseph.qi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Wed, 2 Sep 2026 09:33:57 +0800, Joseph Qi wrote:
> Since commit 8deae2284976 ("buffer: allow a buffer_head to point at
> memory outside the page cache"), bh->b_folio may be NULL.

We hit the same NULL dereference independently on real hardware, and
it is nastier than a fuzzer-only finding: on an ext4 root filesystem
every boot of next-20260831 (and every later tag up to next-20260903)
dies about two minutes in. jbd2's shadow buffers have no b_folio by
design, so the first journal commit after mount oopses in
__bh_submit(), kjournald2 is killed by make_task_dead() and every
subsequent metadata write blocks forever - journald, the flush workers
and eventually all of userspace wedge in uninterruptible sleep with no
block-layer errors reported. After an unclean shutdown the crash moves
into early boot (journal recovery commits immediately), which makes
the machine effectively unbootable until a different kernel is chosen.

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
  CPU: 0 UID: 0 PID: 357 Comm: jbd2/nvme0n1p18 Tainted: G        W  7.3.0-rc1-next-20260831
  pc : __bh_submit+0xa8/0x210
  Call trace:
   __bh_submit+0xa8/0x210 (P)
   bh_submit+0x24/0x38
   jbd2_journal_commit_transaction+0xb80/0x1ce8
   kjournald2+0xb8/0x238

With this exact change applied on top of next-20260831 the same
machine (ASUS Zenbook A16 UX3607OA, Snapdragon X2 Elite, arm64) boots
reliably and has been running normally for 11+ hours.

Tested-by: Greg Ociepka <greg@ferrisoft.com>

