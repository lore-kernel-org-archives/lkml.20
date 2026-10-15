Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E258950C2A2
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.202
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792063363; cv=pass; b=kBEAIWc2MhAXKJOKF80+XrboBkTug9ME+trdieGupjpaXFWzmialgTSSDZ7FBYWgXUcHyV91DJ2RwI6uCS0zHL+t/CcjGWlCThJiBzlcvV9pAUHrjjnbXR3U4AgTBpyjQYOAjZKEpJsvoZBwLSIIveqaiXaogJrdZUbWDGX9mjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792063363; c=relaxed/simple;
	bh=4ronku3FgG/grdupmxyuT7bUinJ8usDzhzYo0Yc2sn4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WxHj3ZWtRvzJd/73xeAdxlTmJdBvaDrPTt++052ORqD8xD2WJuTfiSyFM7WzOUyzpPbT+nVCYq+hRMFWTVs7VwcIgKFd2O8mY7/pskv1lDriyotXQupG6lYC7/WdtsOyYCioU3c8SZzzLDpFS2mm9SBVgcHInmmnR/2OCtrI40U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=peIo9XYO; arc=pass smtp.client-ip=74.125.231.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="peIo9XYO"
Received: by mail-oi2-f10.google.com with SMTP id 5614622812f47-4c3bb46aaf0so1893139b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792063358; cv=none;
        d=google.com; s=arc-20260327;
        b=fII4jefoL8Kq6f/rPAZKGDRXeMgkuOCZXlHxdqVFbECAqkVi25382NLAvih3ScebfU
         3AujwmYafImEGXX4sGORvbRrQVV6c2wcwgZImUBRO35T5tqscetLcxzLjRfALOO210+f
         AJP0qRBlsSepxkxoGkjcXCqK3iBEW5xA7hQLFz9kKazHlAvZzQ4ExoKV+fgbVw9rUFWb
         ETqJw177/b7m/HrIP/r51kzcCYzBYclC37NNZWt4nleZr8d2SVI7zWmHRGbrebJyaf4K
         h/SUSdJ6GUWiLM2GZr5LFTJ7xGKhXnoTm6pibS3dpS+sbLJJSvbL5rPzbdLf+YljUCQh
         GuYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=+KhDh+DCKXNAlBFw3mfZ5XMbYKVN/XAmTIjiDnW60pk=;
        fh=RE9ns8act8N7Qsc9NDWrI7wZVNiTQ7coug4DdHMxhp8=;
        b=blOmIfntbVLeP9HpW70VEXmakmBjof6rpyIpHer4mc5bzyD7lujUF5m2StniQ6xuH/
         modHhtJqjb/q71yTPGX9iTAVXZGGBdTQ/6J2kYmUiUgY4TM2HXpDj+WN3emVv3RBa3bZ
         Z3nJ3MHxHYWVp2L6AC7ls8hia1OP3+yKWGwuwPCCRBaRZ3EwBUqL1N4Sm3LoL6J9hPGp
         l5omUV29a+XWV8Y1JEcTZBI+q5SMPs9gE/sXj6wV8FXSNFuznU8ELHzBwTf7FjRJMiG3
         2uwkHaFraMQtp5LEM8V0vLKairwGfPc8Pvmd6jf8hoUrPcbGOIeYH7eVm4LVDfFab0c5
         8DHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792063358; x=1792668158; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+KhDh+DCKXNAlBFw3mfZ5XMbYKVN/XAmTIjiDnW60pk=;
        b=peIo9XYO3YYWYxIjPZWA2Tsvvzc66ptnbJW/qC6iyzIdhNgAiRrcKW0ZxlpjSlJgqt
         2vqD4t2gZrt5z9nygexfCecfFdrQ3Fo6Sp6Iy/b1NDTw+7vtM02vqbD311A/nUdg7O+y
         CIlrANw/gfA6P0Lm9mkttyUDMiFASo9AOjX5G1L6vAy/FJgVK7NCFbZYbkxrq5jXXABP
         6v6HV+oi+HVL7htnmLy3RzB4hfDO4vLrmXbidNNIr/yjDEzNZ6/NV7lJse/apQOap25Z
         pKFUNfmXDOkrNIqbzFcswVhlNVghUuP9lUqnK8gkUquWusBGKSdn3kGYAQU9So2aSDF5
         jo/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792063358; x=1792668158;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+KhDh+DCKXNAlBFw3mfZ5XMbYKVN/XAmTIjiDnW60pk=;
        b=KzBuC+fxJpA7X/SuAn0z0kG62dFMuDlfbb2Os7HaHS6QfANlbxxT7VImNZ+STT5cUU
         /0t5Hx7e8IK8ggGnaPNd19REIt8L2wFvwFBX10r/WrK6F0wQNCyOTItRQfav/b0oHb0c
         CNfxYXAMSPmReq8Ho5M6K6LFo7dtAR1l4EU/ZJM15p1ZXz6+SUNGQiVHTcLpGO3Q9RPF
         y0+78sEXLpxzeTEz8B53F15UzjvuieCCuZ3tfUdfxQmvD4cjWR696zfvQ8ITDVhxvKZs
         WkNPBMnOJDLkQYg5D/390TvpjRx/Y8VUJPqD1B0Ga+l0CikJJ5H1MsUbHkr5m+o2fX2q
         gl+g==
X-Forwarded-Encrypted: i=1; AKwUvBypHNFNumzCFAJtJ3cRJRpIuRrpP0vWRPuKjGH/NQV1W3kNYrwJ6JBzPpi85GcYYEJzKGQSHKtUVtmZ7n8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2I5dGfswjgfcx/ZDUwtrm5r6q+6Ttv+yc8seoxUyLbS0gPGTi
	tKo75Dd/ig3e4CiUkzqU02cZgiOpaup5+xszXS0BlkWBh/gIfMsvcZyDP2vxLI9LwNsICRnjn1h
	ujBsAxGTu4VnK/BJE2g3DQKdxddqDLWw=
X-Gm-Gg: AYBFou3g92oUuosW2Qi4I1cfa8Cl0avu6ysDZeaBoSGyBtuWOXS4cYCs+RlkISMOXkf
	PMh/U1LeOw7akD0Cw2eswgK9BhEAm4fPyuOPrAtVwYdOJ3ePGTeCcpxu8/NRWx4v4N+KyJRdpFh
	fJwDBYDMBLvuF3p5pB2uAOVN9WAJ6If2yZdXX74tCRxqdftbk6v4+rYQMtDXVX0c+0uXYyEAXnp
	lfUNKWe9iz+HU07nKCBcowPgZpXQgu6PENDqbsGKRx5m4Tmhsf6Hwy0hPJf/5Ux300VqRSSxzXY
	uwNzfSim8dQNDUY5+DNjoc8TJ8Nlwl9+jvySAYWOmwieJh+ZO3eKOH9QPbOUJKUBycWngCEf902
	sXadsyUst5Q==
X-Received: by 2002:a05:6808:5028:b0:4bd:c8be:1e00 with SMTP id
 5614622812f47-50c532f8a99mr18667751b6e.13.1792063358543; Thu, 15 Oct 2026
 04:22:38 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 15 Oct 2026 07:22:38 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 15 Oct 2026 06:06:11 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aveline Noir <jm5905938@gmail.com>
Date: Thu, 15 Oct 2026 07:22:38 -0400
X-Gm-Features: AclHuK8pqRoiNT7w7U-dNf7fj0OwyC4V2V6EvhaoiQUtuVnZ8GqlxF2C2ivtqcY
Message-ID: <CANOyQmHo94dwHVMWeUfQsks0b30uZT0wuV8mDQ9MjB-HL0yVnA@mail.gmail.com>
Subject: [BUG] DAMON sysfs: failed update clears tried_regions snapshot
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On mm-new commit ad9f2d463666, requesting
update_schemes_tried_regions after stopping a kdamond returns
-ECANCELED and clears the previous tried_regions snapshot.  The final
result collected before "off" is then lost.

I reproduced this in an x86_64 QEMU guest running
7.3.0-rc5-1485016-gad9f2d463666.  It used one PADDR context over
[0x400000, 0x800000) and one default stat scheme.  The paths below are
relative to /sys/kernel/mm/damon/admin/kdamonds/0/:

  ../nr_kdamonds = 1
  contexts/nr_contexts = 1
  contexts/0/operations = paddr
  contexts/0/targets/nr_targets = 1
  contexts/0/targets/0/regions/nr_regions = 1
  contexts/0/targets/0/regions/0/start = 4194304
  contexts/0/targets/0/regions/0/end = 8388608
  contexts/0/schemes/nr_schemes = 1
  contexts/0/schemes/0/access_pattern/{sz,nr_accesses,age}/max =
      4294967295 for each file

The reproducer then:

  1. Wrote "on" and "update_schemes_tried_regions" to state.
  2. Read contexts/0/schemes/0/tried_regions/total_bytes and counted
     the region directories there.
  3. Wrote "off" to state, then requested
     "update_schemes_tried_regions" again and read the same results.

The guest output was:

  BEFORE_OFF bytes=4194304 dirs=10
  STATE_OFF bytes=4194304 dirs=10
  FAILED_UPDATE ret=-1 errno=125 bytes_after=0 dirs_after=0

errno 125 is ECANCELED.  The snapshot survives "off", but the failed
update removes all 10 directories and resets total_bytes.  There is a
separate clear_schemes_tried_regions command for clearing a snapshot;
a failed update should leave the last successful one available.

damon_sysfs_turn_damon_off() retains damon_ctx for final results.  But
damon_sysfs_update_schemes_tried_regions() calls
damon_sysfs_schemes_clear_regions() before damos_walk().  Once the
context is stopped, damos_walk() returns -ECANCELED because its walk
control is obsolete, leaving the sysfs results cleared.

The guest completed with RESULT exit=0.  Reproducer, kernel config,
serial log, and build/run steps:

  https://github.com/jm5905938/kernel-mail/tree/195d7017352a3d0f4a0475b98f3b03650f5c14ea/cases/2026/damon/2026-10-15-bug-reports/01-sysfs-tried-regions-snapshot

Thanks,
Aveline Noir
