Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0050934750F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792117926; cv=none; b=XNwj+uGZ44okFtDo99dQtsKy2rXmAP+haczdyXDKQZI10NBtegUm9g1Bzg0YTcqPsdTVkHTGN2jICpe+bC+4q1cKlmq5hhqvWgsus6OBzSpYa+laY3e9bre105pc5UT8ieGqgVhUOrnOtOCeaPWJn8ykdsybCyV1ukMjSJCiGfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792117926; c=relaxed/simple;
	bh=f3DORJrJpkP6ZRkP19t1XIOYLbgIcUWXGly+WSIdbaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lT127mR70ip5iHf22vA4JjDWQZ6T5M9i58Qh+eFcy46prqabgd2dkTY9hz+biug6w5uemqJak5akiLD0Wjq1p+9yuUWPwwWW5xI7ClHwDdq/Qn6i73ovXJ7q8HXjrTVybbuxBNoYGrKf9JgdvKe6oTX46fGGEpgDe+rvwK3VUGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=Lb+yK4lq; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="Lb+yK4lq"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53394bffe0fso7305321cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1792117924; x=1792722724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=myFazyiklnuqy8xHfQCBKX5TKL0fchWKCY5jJRzEhZ4=;
        b=Lb+yK4lqkt2BfUfCOe7Bt8yvghRl9MUpErEBMAEYfXa1prT4eNcmwhHcy/WnNaPDQO
         31DJne0gjcuj66Lit4Nol8wJDO8rnFNowtS4Spgwo40BY1lZKdo1R5Ls/kDGu16/fKU2
         k24jLb6tQvVlbnbhmLrCYBWKLBcbRmFg1966I2EAhK8fKsdjGEfhQ/Qb+Juxj0wxSZB9
         kO7ipFOUMgtn9A1pw/ad9moHelbQU0e1smRYinSMp3Tvyeny3pmltDV2KB3aVdwwb4oi
         wm5zyQZ1YlX7FFT2bkQ1Gab+gFwDh3Z+lnvYS82ITjprwO+MflkNaueAtIJv1xJu7a4y
         pMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792117924; x=1792722724;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=myFazyiklnuqy8xHfQCBKX5TKL0fchWKCY5jJRzEhZ4=;
        b=jBVuqTA97IZzGLEnu1zTL3G0dJB4Xj1pkkesFjW1E4ZLni2UxPLxyeiTsRMBjBmwHe
         tp1THvsv92iQkhBsA/ehR43jU4tIN+ogUcVQa7T+qD3Tnqdd9/xqRWEhsGUmtV/mTZV6
         5ipNY6Y2527xtvA4vfwNfxbdJchKxfUthCsq6k+uZR0+7SjNzzzStlx7NxgpHLud3eXC
         eD+CvzeyvwbdSB89nUTIyGZ01uSW/k36f2bFLO443ymeLIA2qjuKVm0AQJzHT0zoHdIy
         rUJtnKWW6waJ6T3N45w88EOWUA+smCZNQzXjmUJpB6V9iFvOrBngOBY8RxZMr6EAbEJs
         yhPA==
X-Forwarded-Encrypted: i=1; AKwUvBxG0u5t+T0WQlZCuVkqV374V7rMHrZdf1nBBIuwuKtvRP0drEK7aHjnmcHHEmlJxiibDKa/cewJ5BcMRGQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaAl1I18dhZk0PPlX9CI6ZarCdO1iIQVwH0pn1KlSkxc5KB9qz
	RcRZAEj6VocOtdklKC6AoKsBhMhlez7fvoKIVsD/4pMwW4dV2mjeDS/jLv/92gAgrYbydJgKdpt
	lWkMb3A==
X-Gm-Gg: AYBFou1/EoxpkRQeGg9/auVzdU2hir6GHf3YNwpyz022eHuyKFSnOXEPgsQ1LIMfxjO
	ClgY5DgDbqEs257JgZnnWmlLrYiIvHI7mKDqcEjUdXTxJlriZRSybmIWijNeUrvdT4v4USAuPxX
	vRfL/kGXo+pTTSpxy1NyKlmqmUvtPmqn052Ye1gjnufyThvdhoKdabGPx4KpSxq2aGCuIsLd762
	/k98vWROghFQex+io03cyrcFbdlFCWLjfZMFafZHEFEIHiO0cPxur1gCg1yHXZWSEBsHBYJAKk5
	9L14Lc/z0qclgU/jlgzoq1FIfa3Srb1EiMMicHWcHpt9ASquAsXN0buMLDjLuhhBiPUDcZnNBag
	ppXviWznB9YuRQFbcpi86gl6sLo0rneFPMWI3WembZoGjQDJ3/NzGslxCIRrd+Hs8rRHEhY0LLn
	J5Ct9SpObl5DO3R3tIe0iUUPdgDkdaenVfWl8PLU2qC+TCvvpEEjkDslXnrHYGgQcfcvdQMMpDn
	jouyQzmCGfsDCUfWMfc
X-Received: by 2002:a05:622a:1dcb:b0:535:fdd7:b490 with SMTP id d75a77b69052e-53626d2623dmr35175501cf.0.1792117923761;
        Thu, 15 Oct 2026 19:32:03 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bce8918bdsm6778646d6.48.2026.10.15.19.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 19:32:01 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: slava@dubeyko.com
Cc: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] hfs: avoid reusing occupied CNIDs after deletion
Date: Thu, 15 Oct 2026 22:31:25 -0400
Message-ID: <20261016023125.2271361-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <45b692cfda51e3b10caa27ae51609edc34efb0d0.camel@dubeyko.com>
References: <20261015110114.1649059-1-hengyul@cs.unc.edu> <45b692cfda51e3b10caa27ae51609edc34efb0d0.camel@dubeyko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Slava,

On Thu, Oct 15, 2026 at 12:58:14PM -0700, Viacheslav Dubeyko wrote:
> (1) The goal of hfs_correct_next_unused_CNID() was to fix the volume
> corruption issue. Have you run hfs.fsck tool to check that volume is
> valid (not corrupted) after your fix?

Thanks for pointing this out. I have now run the additional checks on
v7.3-rc6 with this patch, using fsck.hfs 540.1-Linux:

- All 14 normal-volume images from the original tests passed
  fsck.hfs -fn after unmount. This includes the reproducer, CNID holes,
  missing optional file threads, concurrent operations, and reordered
  leaf node numbers. The checker did not modify the images.

> (2) Have you run xfstests (especially, generic/736) with your fix?
> Because, the patch had goal to fix the generic/736 failure:

- On a freshly formatted 64 MiB HFS volume, I ran:

    ./check -i 10 generic/736

  All 10 iterations passed, including the filesystem checks after each
  iteration, with FSCK_OPTIONS="-fn". A separate fsck.hfs -fn after
  the run also passed. There was no "invalid MDB drNxtCNID" error.
  The unpatched v7.3-rc6 kernel also passed these 10 iterations.

- I repeated the minimal reproducer on a separate fresh volume. The
  first creation of c failed with EEXIST without the patch and succeeded
  with it. The surviving file's CNID and contents were unchanged, and
  the patched volume passed fsck.hfs -fn after unmount.

For completeness, I initially ran generic/736 on a 256 MiB HFS volume.
The test body completed, but the final fsck reported:

    Invalid map node linkage
    (4, 2048)

I reproduced the same failure on unpatched v7.3-rc6 with the same volume
size and tools. The catalog had 6129 nodes, while its header map and
single map node covered only 5984 nodes. I then used fresh 64 MiB volumes
for the runs above; their filesystem checks passed without repair.

No KASAN report or kernel BUG/WARNING was observed during these runs.

Thanks,
Hengyu
