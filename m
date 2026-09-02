Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4316D4AF9E9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788388322; cv=none; b=UevZG5AQw6B+BiCgCpToy4tMCAu9oia5gqq1JvQ5VYwFEvWACwVdihBkWJ9aboS4OrMKgLo8sz3NcbobkclOSEHgbrrDe3qDzZrBo1mnIiFRtbm1l/HK9j4nfy2SnWGL5MEMyvIeaj/4+kOt6+hQ8poQkVrjqZs2gvtB3yZeWF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788388322; c=relaxed/simple;
	bh=x8QTwaBEHlbhTlyYUzQ6IcB4eonbQnCoTFLiMiKbeBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9MdWRx5qGHhfpSIpO0Rufzj07lNtdKgg3KN63OmAPdxK5jL5Q1smyIuD+xdMNUYnErf1QCd0rOy+oSq1dCb0t5O+XWD4NMFb9Kg3XaXTr6NILMLxIdbHSv2011pU8mfUsI3dtWK1z49Qkz5YRuiToRVIchPhlbWe/T2GEMZYpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XrvpzSAS; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XrvpzSAS"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d72ae08fa1so15075555ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788388316; x=1788993116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rfj489snHAgcjqYCzxpw7R2gTXTEyikU7ldTqChZJq0=;
        b=XrvpzSASKQ00rbxTOxlq96kjdY7zgt96Q7c1PvhhbROuBQx6uQ+3/MffvSgRBcmBpk
         q+am6QEGd7IpTAHInsorsr0JUq/XUQxmbZYo1lqLfd7OX3aUogCI2QWjQcSrgGaMowHP
         N3FLIyPbo2vX0/rm+17v18TaSFvSTndTHNYWFdMfd54tPg1zD3GjExtzGDMlKeQcLnZi
         O9Z8ui2fCAeZBPG2sOqMp4P0XlPT5o3G2RMfsgryqhU9rTvwxseP9gW+NMhwSUKKNcVr
         CyfmedUn9DvsgXGxDTFJ3pT9QG18taJBiWDDtYBH2e5pPuA/PIMTKR8BIikXd+9yXf5J
         U7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788388316; x=1788993116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rfj489snHAgcjqYCzxpw7R2gTXTEyikU7ldTqChZJq0=;
        b=IlVWpEAYNC2g2qJUd+aXEzPBXGSv0Ju4FUer2xNku/CyNJpaoXwRs10DYa+20Sfs4P
         6TPylzqgZzWU+6mEBgacgSjfTuaMHe/R7FjgL1G2TRN7m9MRG8ZBd8y7sm9PkT4BIiNB
         PtZjrdGvRS/CxwrOwQAf45nBI9VdJ7M1y96ly3+C11TBKdJeqmwN9yG0hBhz22EKXrQm
         FpHQNkOF/NmAmv/O0QtV215PHXgJVZ9LhxkhtcIAVgkNVHdetjN06aj9TPdzGRPunEJQ
         Xl05OlOqOmw5mDxSM4scB983xJgkCl2ZgdvXoP4vpwIiFwr5nz52R8fAk/G8LN7QWfXa
         rO8g==
X-Forwarded-Encrypted: i=1; AKwUvBz2LpfdyLsXlXidej28m6CLkTyp8sQ4mAYBu/pAhRsfWDbrOdhXC6l+UEPSAu5VkCTTp1z8JDDD+Tx7Lwg=@vger.kernel.org
X-Gm-Message-State: AFuF++nI0QRwlbEGXxauW/mw5xXolDK6AJOWq7WZjJy6Pcvk8+r2Z0rn
	JyJ6ZDMVaD/sn3Dh7YcfKCyigEgfIAa660g9j8GZzC3AF8GhhpPomFAc
X-Gm-Gg: AYBFou1ML3OFoKmoDwuRVxP8ICTisD5T5oZxM0CajLX+ToG6cdNjNJgVY9OSAm7fBQx
	G/4zPH4Vqpifiy09DxD4vuLGNeXwo2rAjgvB/StDFDqdtHMTaxabGpPoolmNodIMyHn4G8I7/Er
	hw++6J75YoE8Gu7YM1TwMFvhdz/Pmw0HZKU/JdRO7iczmKazGshmSvXFU3Ldl9GkI4bjJfkhZH7
	OirgIIGv6O6d6egg75Na5Zago3cxav5Wo3ldwEPhYKI7PQIp4xjrV+kgskO21ls/yxohgNwcl9y
	0BUtvncDI4EAqu3D4s3a1aVr9KkQ09s7hwu6MQ/bkQ5dQZc9h46A1ZS9Khyy/EVdc4YTANW59+e
	TGsP4M99F3y/AServUjjBBpkSZTwV58tm/18fqiXawBFaISaGK0CtAT+oMDIIgmtJOu4j2ZTG76
	a0RZNykUAXP6gZfyFfqXNLE8d5MIJL1v/cBYQuI+TQiYZ2btEErWaI0GIoPko/Wipb
X-Received: by 2002:a17:903:1a0d:b0:2d8:d4d3:da50 with SMTP id d9443c01a7336-2daec7a70a2mr111190875ad.20.1788388315442;
        Wed, 02 Sep 2026 15:31:55 -0700 (PDT)
Received: from celestia ([2402:1980:9c5:2de5:8b4e:3f3c:b637:4ca5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafe0e24basm1215945ad.2.2026.09.02.15.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:31:55 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sj@kernel.org
Cc: aethernet65535@gmail.com,
	akpm@linux-foundation.org,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2.1] mm/damon/core: fix false positive in damos_quota_is_full() when esz is zero
Date: Thu,  3 Sep 2026 06:31:38 +0800
Message-ID: <20260902223203.14871-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902144804.88298-1-sj@kernel.org>
References: <20260902144804.88298-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 02 Sep 2026 07:48:03 -0700 SJ Park <sj@kernel.org> wrote:

> On Wed,  2 Sep 2026 22:22:31 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> 
> > On Wed, 02 Sep 2026 07:10:00 -0700 SJ Park <sj@kernel.org> wrote:
> > 
> > > On Wed,  2 Sep 2026 16:44:45 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> > > 
> > > > When setting goal_tuner to 'temporal', if the goal is achieved,
> > > > quota->esz_bp will be set to zero.  In this case, damos_quota_is_full()
> > > > will always return true, even if no regions have been tried to apply at
> > > > all.  This causes qt_exceeds to increase unexpectedly.
> > > 
> > > To me, this looks logically correct.  Could this cause any user issue?
> > 
> > Yes, I think this might cause unnecessary confusion for users,
> 
> If it is _might_ kind thing, please ask questions first, or add RFC tag at
> least.
> 
> > at least
> > it did for me.
> 
> If it confused you, definitely we need to fix it.  But if it is just confusing,
> let's try to clarify by adding documentation, rather than changing existing
> behaviors.

I agree that we should avoid unnecessary code changes if the issue is
merely a matter of confusion.

However, I believe a code change is necessary in this specific case,
rather than just adding documentation, for the following reasons:

First, this distorts the semantics of qt_exceeds.  It is a statistic
meant to track actual quota full/overflows.  Incrementing qt_exceeds
when the quota is completely unused (because the temporal goal is
already met) misleads users and could break user-space monitoring tools
or scripts that rely on this metric's accuracy.

Second, considering its original behavior when it was first introduced,
the recent changes [2] have inadvertently altered this behavior.

When qt_exceeds was first introduced [1], the conditional check was:

    if (quota->esz && quota->charged_sz >= quota->esz)
            s->stat.qt_exceeds++;

Later, to handle cases where 'remaining quota < min_region_sz',
damos_quota_is_full() was added [2].  When this function was added,
quota->esz was replaced with !damos_quota_is_set(quota).

    static bool damos_quota_is_full(struct damos_quota *quota,
            unsigned long min_region_sz)
    {
        if (!damos_quota_is_set(quota))
            return false;
        if (quota->charged_sz >= quota->esz)
            return true;
        /*
         * DAMOS action is applied per region, so <min_region_sz remaining
         * quota means the quota is effectively full.
         */
        return quota->esz - quota->charged_sz < min_region_sz;
    }

With the introduction of DAMOS_QUOTA_GOAL_TUNER_TEMPORAL [3], quota->
esz == 0 carries two meanings: "unlimited quota" and "should not
be applied".  This overlap causes the damos_quota_is_full() check to
return true incorrectly in the temporal goal scenario, leading to the
false positive in the statistic.

> 
> I feel like we also found similar case that people send patches to change some
> behaviors that confusing them, but not really problematic.  That sometimes
> waste unnecessary time for understanding the intention of the patch.  Please
> feel free to ask question first, if you found some confusing behaviors and
> don't know why it behaves in the way or if it is a real problem.

I will ask questions on the first in the future when I encounter
ambiguous behaviors, to ensure we are aligned on whether it's a real
problem before drafting a patch.

[1] 6268eac34ca30 ("mm/damon/schemes: account how many times quota limit has exceeded")
    (Fri Jan 14 14:10:202022 -0800)
[2] c7ec7d5f6b3d1 ("mm/damon/core: handle <min_region_sz remaining quota as empty")
    (Mon Apr 27 18:33:50 2026 -0700)
[3] af738a6a00c1f ("mm/damon/core: introduce DAMOS_QUOTA_GOAL_TUNER_TEMPORAL")
    (Mon Mar 9 18:05:19 2026 -0700)

Best regards,
Rui Yan
