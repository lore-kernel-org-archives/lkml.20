Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C04B3DDB07
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509600; cv=none; b=FU5/CQXRDkRIm/WzP3052kzuLrA+Nh5uIAIrThSkr/wDq29wX359zvMH7Li0IS0VqtSHegTF1U1dkNTm6LcDXArZNIAoqT1CN36aKumoTzM0NFah0y+FDMmOHYGH1dFPyeWA5ufG+WiPmveLhLV+Hm1xwC2WtHZC0wsW8ALSunM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509600; c=relaxed/simple;
	bh=ttsZXUpX/RbFo0lv4pHgTj09rIccNhb/+DkQ1zy3hw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RNFfoasxWIG+cds+2cd5Ao+oxOAa7pKwPBU5PMJktHsXJWx6x3rAH0ydw1otbnag5z1RPlE0o1YdamnT8urc7kwEw0TzrqmTQnon7uK3bO6kF5Wzgd8wcCWtIw8WJ39ihgZTs2gRVL1QCfcgQw8+f19VYH8a3/M6sEJlNbMdr40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNnMMvlX; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNnMMvlX"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8525efa7274so542920b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788509594; x=1789114394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0pDAJ5Zbgk6FV/+bTUIcqCISS5VxMKMSD1bvgwX22t8=;
        b=LNnMMvlXtXfLXE6U/RjfySygnXI/zK60bM5nRi/J4R147vkvb2KwiPLbdI45gHFFri
         XlNJFoL/gCloEuxwekNPbGQ9mGtdX7/NBffHFz8juwyGUC+vf08lP9Om3rIxyHSzU+Bc
         Du+YNG5sRmTs7onpR9mFQImz5I5FoFfwjEawuZIUlDPNwBwm1ulpTT5FaVVIBmSXmEz2
         IokMOjyjPboSAN4yLJBxiFYoZIS3UBX0fnqeRnZmjV/xO+lqAUaWxc6VYhDuzEISPaG8
         I77mn5FFrhFtmBSK68+0nxgfxfT+/urJMjywzT5nf5/Hck9w84NCH8OZKnfO+llmCS8s
         iM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509594; x=1789114394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0pDAJ5Zbgk6FV/+bTUIcqCISS5VxMKMSD1bvgwX22t8=;
        b=sujNB3i1ZgrNS5wmXmrNmrbuLgqfnDLxAtRMdUZ3NQjBT4Pd2yEY77+e4wGcjg1Rs6
         vwn3d3MLDHdgYzIOxB5lgiFRgVUXtDZ/jvKB2NJ5WTQ14ucn4h7s1QR2S4efKRdvldoY
         Z9PiozDHM4GHQ6K/hH/lqy+GVYvLpyq7Rkl8s5ke8EQFci52+AIshG29YdpjynC9EPi/
         rLmZXsEUztKVhluxEohdTjR22nlFecmf8AIDrgPYMqnz1yi3B/Hq2Yn9meDP95I5uXJL
         YcPqF+5DXalXtIzJ7sycVT5xlPEBiP3ZQ0idvv/LdUZt9UkzKbTTWf4PMuGclSCQU91q
         FRAw==
X-Forwarded-Encrypted: i=1; AKwUvBwCY53EG8WbthuEWScjbNwAK5ZoP7H6wnOPXDjCDoEqFEGJ6IYoc90GhGrndAGde3iALjj5SV77Bcx9PBc=@vger.kernel.org
X-Gm-Message-State: AFuF++kg0Z4OGYB6VN8gy9d8z/vZIxNFdbJCymyN1UuFM0e9mFnKG+x/
	06ESagM66XNo2+ulyJBiuZWaMwiIV09WDvs3+0qkyAZLIZJqdExTfsjm
X-Gm-Gg: AYBFou37FOFNtYuyn870BY2QD5b39EQOOK1m3uQkK54wuMEZ5x0vkuuFds6y7Rt0Bn7
	VQF6k5zBwXDa53DOr2lfHqtMXfIWktEPbP9jlRQL1S6Hy+2T2YwI8zBywOCdeIngmeZsineTNDR
	5q8Wi487f0uu/xoKzkrJQMe1t35nUEykJALdImWPeVhVQI0NyaUtSQYIGKH2b/Vw4nXcd9LcnwY
	12Do4Aowcxu9sl//b0eegUOuLSDGlgV2fmfGu0uWzgyhywMJWBDipTUo07pPSp7me+UsOh44Eta
	TM35423NHguOutFq4rXDklFANp8sRsSehEPrX4XLHKtYvXZCY2sDdy/fFA4F44DIBHzo19vmzdy
	boTArwqJtwKWb6OI1ca6Y99drKxCqjjNmqZnOs5QomKtk0WL0ey3F4yWsHXkrvoTkOQjh/wTQHk
	lME/KZBsVcrQaQjg4BYJ5xW3Z+Az010QQfoXy5jibdAfyyhpGhAphZXve669IytbRR+XoLmOxpy
	w+I/lIYDXxVFMIReuk=
X-Received: by 2002:a05:6a00:4289:b0:852:38ea:3fd with SMTP id d2e1a72fcca58-861676b276dmr6641062b3a.11.1788509594279;
        Fri, 04 Sep 2026 01:13:14 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:8929:bbae:36df:3680:44d3:b5e1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152c2a52asm862512b3a.30.2026.09.04.01.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:13:13 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sj@kernel.org
Cc: aethernet65535@gmail.com,
	akpm@linux-foundation.org,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2.1] mm/damon/core: fix false positive in damos_quota_is_full() when esz is zero
Date: Fri,  4 Sep 2026 16:07:41 +0800
Message-ID: <20260904081324.3972-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903140521.98604-1-sj@kernel.org>
References: <20260903140521.98604-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 03 Sep 2026 07:05:20 -0700 SJ Park <sj@kernel.org> wrote:

> On Thu,  3 Sep 2026 20:41:48 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> 
> > On Wed, 02 Sep 2026 17:33:50 -0700 SJ Park <sj@kernel.org> wrote:
> > 
> > > On Thu,  3 Sep 2026 06:31:38 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> [...]
> > First, I would like to clarify my intention to avoid any
> > misunderstanding.  My actual goal is to fix the semantic of the
> > qt_exceeds statistic, rather than necessarily changing the underlying
> > logic of damos_quota_is_full().
> > 
> > Currently, there is an issue with how qt_exceeds is incremented.  When
> > the quota is set very small, qt_exceeds increases frequently.  This
> > produces a statistical trend that looks almost identical to the
> > continuous increments caused by the Temporal Goal being achieved.
> > 
> > The original intent of introducing qt_exceeds is to let users easily
> > notice if the quota is too small.
> > 
> > Commit Messages [1]:
> > 
> >     mm/damon/schemes: account how many times quota limit has exceeded
> > 
> >     If the time/space quotas of a given DAMON-based operation scheme is too
> >     small, the scheme could show unexpectedly slow progress.  However, there
> >     is no good way to notice the case in runtime.  This commit extends the
> >     DAMOS stat to provide how many times the quota limits exceeded so that
> >     the users can easily notice the case and tune the scheme.
> > 
> > However, under the current behavior, users are forced to manually ignore
> > or filter out the qt_exceeds increments that occur after the Temporal
> > Goal is achieved.  This adds an unnecessary burden to the users and
> > contradicts the core goal of making it "easy" for them to tune the
> > scheme.
> 
> Still I feel the problem is unclear.  Why the users need to manually ignore or
> filter out the increments under what situation?  Knowing specific and detailed
> case would be helpful.  Are you or some people you know doing that and feeling
> it is too much?  If so, what is the real use case?  For what purpose and how
> DAMON is being used?  Why and how the ignorance of qt_exceeds is being done and
> how painful it is?

First, I'd like to clarify that this isn't a problem encountered by a
real user, it's just a scenario I came up with.

1. Users sample qt_exceeds periodically (e.g., every 10 minutes).

2. Within this 10 minute sampling interval, the counter aggregates both
   the real quota exhaustions and the increments caused by esz==0.

3. When users notice a high qt_exceeds value, they eventually realize
   (perhaps by reading the code or documentation) that it includes the
   counts from the esz==0 state.

4. To get the actual quota exhaustion statistics, the user is now forced
   to perform additional testing and implement external filtering to
   separate the esz==0 increments from the real exceeds.

Even if we explicitly state in the documentation that qt_exceeds
includes the esz==0 counts, it still burdens the user.  The user still
has to figure out how to filter out the esz==0 increments externally to
get the signal they actually care about.

Honestly, I struggle to imagine any valid use case where a user would
actually rely on the qt_exceeds increments caused by esz==0 to make
decisions.

If the only purpose of qt_exceeds is to let users "easily notice" if the
quota is too small, forcing them to manually filter out the noise
defeats that purpose.

Best regards,
Rui Yan
