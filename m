Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FDF443C07
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789907089; cv=none; b=Lc24JfNNaWK2XoqsBd8KJmFj1dxdeIwhEfHjP2y9CVkDB2E5MMRsZe9BNbt+l/p1R2FgPdVFuS7IiO2vTbFg4v8PUYD0r2VF1U4nybJOiXFyPsJMvjgfmxoSP567jz0R9vOuLDH+I9Y64APeRxkpb2rBFZO/9Tv0l0O+01ak/Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789907089; c=relaxed/simple;
	bh=MnugXts7y5D535S+D6T/loR1mtSZRGqEmcfdulAt4RI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j5F/sxoQlJGcUSLMRzZF3TX3yGnc/LzcHOLziu4AAHlzmla+c41VBVU0DDMerlopPDKkUEpfIIFRCMpNWBmj2USMojdbFOI0ya06H6brgGnX1qPFz6Kc2D9J9t57untAzvQHGSY4Jp7ZK6tT2nT4rHsNb8EPL8z2TVH5OXDY2rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNbvaSVB; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNbvaSVB"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396cccbba92so1947230a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789907076; x=1790511876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RYqPAHe6dDWQaMD5MN6ftRH3n900tUiGNAP8+qEZJDw=;
        b=DNbvaSVBhs4oW1HJdTsV+38blMKvG4y2bLMimGoJt64bWLV5Ljx/ndhEbIUh5aets/
         2a7DAjqgVe/A8INAY9hLQHY1Aqr7NO2oyOjc4+9cO6r8TrTgCiHNRsTBfMNQVJsFTU3n
         kvQUa4fGxf6J5khsdZ04y5dyWwmYyKM6e0fkes0KbYInOJiFVK4Rs4DV6HdTSv3gHwST
         D38pYjMwb4TuWb9D7S+R3WbKgWE1xESQps7rkPWvVJsyFojiajq2xzymHpCJo3dAMzGC
         eblBbmDN5N81kZnWDmdrLul6JRyejG0wHEhPGQcrM1cX7RSGKXD3Y6mDZJoa5N0gPgJg
         BnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789907076; x=1790511876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RYqPAHe6dDWQaMD5MN6ftRH3n900tUiGNAP8+qEZJDw=;
        b=oZ+ujdmKYeCYB8US1y0SHBSMi7DFeUCFJQWO7i2tD2wgK4eUteE+vgdbgA0DKuMBdB
         7W47Tin2GzB/baqIAQxHVjbZTQ7ZHVwR+yy+9zeFOo5HaJR2Ry/ovUenkYICLMF3fYl0
         7rhJIEzxnjF9ll/shsI8PZTdy3fNq16zDhMNNFvQFSNoCUHHhIvh0Vl0dCiSB2s5Q9rS
         BwfSZXw0PmKzj0YjOAevc+CbpdGaE7eHK0dTqQczUHqZvE6sQ+Z+AVp6Z6iPiRk6jpHN
         dNK1wfAZuvrW/8Oo+8QcKC23B/c9POb7hX4/du7kxBBdjSIA8A6MzQyZNfVZyU/M45pd
         64iw==
X-Forwarded-Encrypted: i=1; AKwUvBy1K78inZXG7F6uF8IVaKqVDFGNefHbSeZZizWL5+E0iniOQ3XVIAdIGHq6jlxM62vESen8QcKQnf0RRzQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ncfTQ9RkWPC63B2FlCfrcE3VBVdIQYwXDEcYyaFkyGQ0XjBX9p
	nn0mUP7/GzzyWVxtlT86O0khOMS/XwSuT6+/agS1pTjfP/kgPy0W3AU=
X-Gm-Gg: AYBFou2pp6DuJ7RMqj8IH1GcF6eON/bF2dCQx+ToiotVjQI9fejDvTW2m4R1j5x+DXE
	vs9iDlNg6cffh2Gq+Qke0m47ngNJ1tzQ+KwlMnqBB7j9Qj+hl2GaHVdMf6vsPkMBevaxq0Jsx4/
	Kk1VP6jAhMI6MWGVOYLpQcKIsqCvERVjoxdc1oLDWmeL9C8Vni1DmL5gS6y9WWOF7tOw6NXvb3r
	XOMenFRilD1G87WtSEY3Lyu6Nq5uclThjlqjlkBwIEYUfzYUeIqV/l2OKAejSpv5sWPbBDzd4w5
	pce0pCvDRR10qxlpMqniHHmToaWLp/BGZvqWZOiilqkxBsz7CJuzPbH7yXB2QF+G+RpjZKW1IOe
	AxyNzVFua0JYX61q0OOn3MD4PB6vbZWu3SVMMm9JzSztyPlyt88QX2ibDN9UNen7/KH3+TdWn+E
	HfVn2ryiKVT73bDGzGw5rt1b5rnIfEnZzfXTNRwUb2a/oDcYkxc/qDVQDiW0FhtEqL4lfJeDiUI
	jkBvdh4rEUmVEI1ExKEJIbx9kU=
X-Received: by 2002:a17:90b:5281:b0:3a0:3673:dbbf with SMTP id 98e67ed59e1d1-3a03673dd7bmr2099459a91.59.1789907075684;
        Sun, 20 Sep 2026 05:24:35 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:e0d6:4b87:c472:c9ae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a03bcecdd2sm1173362a91.1.2026.09.20.05.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 05:24:35 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH v2 1/3] mm/damon/core: prevent size quota overflow in the temporal goal tuner
Date: Sun, 20 Sep 2026 21:24:30 +0900
Message-ID: <20260920122430.610257-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920103714.47722-1-sj@kernel.org>
References: <20260920023111.2466265-1-donggeunyoo.kernel@gmail.com> <20260920023111.2466265-2-donggeunyoo.kernel@gmail.com> <20260920103714.47722-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the detailed review.

On Sun, 20 Sep 2026 03:37:13 -0700 SJ Park <sj@kernel.org> wrote:
> Let's break commit message lines with 72 columns limit.

Done in v3, here and in 2/3.

> Why 256 MiB, not 429,496 bytes?

They are two different numbers.  429496 is where the multiply starts
to wrap, and every size above it is wrong.  256 MiB is where the
wrapped value lands on exactly zero: 256 MiB * 10000 is 625 * 2^32, so
on 32-bit the product wraps around 625 times and ends at zero.

> So, the way to work around is updating the size quota to smaller value,
> correct?

Correct.  v3 says so.

> But why a sane user would set such huge number?

They would not, which is why v3 no longer argues the 64-bit case in its
own paragraph.  The threshold is now stated once, as part of what it
takes to reach the bug: above ULONG_MAX / 10000, which is 429496 bytes
on 32-bit and 1844674407370955 on 64-bit.

> Because this patch Cc stable@, let's make super clear about the user
> impact [...]

v3:

  Triggering this needs a scheme with a quota goal, the temporal goal
  tuner, and a size quota above ULONG_MAX / 10000 -- 429496 bytes on
  32-bit, 1844674407370955 on 64-bit -- so it is unlikely to be hit on
  a tested setup.  Nothing is corrupted and nothing leaks.  The scheme
  makes no progress for as long as the goal is unachieved, which is
  easy to notice, and writing a smaller size quota restores it.

> > Bound the conversion, so a size quota it cannot represent falls to the
> > ULONG_MAX the function already writes for a scheme with no size quota.
>
> I don't understand the above sentence.  Is the grammar correct?

You are right that it is hard to read.  The sentence was too long and
tried to say two things at once.  v3:

  Bound the multiply.  A size quota too large to convert now takes the
  same ULONG_MAX branch as a scheme with no size quota, so the
  effective quota becomes ULONG_MAX / 10000 instead of a wrapped value.

> > Widening esz_bp instead would reach the consist tuner [...]
>
> I don't quite understand above.  could you please elaborate?

Sorry, that paragraph was not clear.  It was meant to explain why I did
not simply widen the type.

The other way to fix the overflow is to make esz_bp wider than unsigned
long, u64 for example.  But esz_bp is not used only here.  The consist
tuner keeps its own value in the same field, and
damos_goal_tune_esz_bp_consist() passes it to
damon_feed_loop_next_input(), which takes unsigned long and returns
unsigned long.  So widening esz_bp means widening that function too,
and the consist tuner would change for a problem it does not have.
Bounding the multiply is one line, and only the temporal tuner is
touched.

I dropped the paragraph in v3.  It argues against a fix nobody
proposed, so it only makes the changelog harder to read.

Thanks,
Donggeun
