Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B00439150B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379222; cv=none; b=FOWAqddW09U2h6vxPXkACIS2lUNbK9z4ruPIFBmefeu7qUoOXhVbaPxCeSF2WMBU7wgLoFL38rAvpLrf2Z9RhCSE5gLiePELO+htPJJy0SvB9OGQYyz1gmWnOXEAMyCwQLHIcxT977PxtdoytrKBTF3W/gp8tXxr7SMNFMhpohw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379222; c=relaxed/simple;
	bh=InDs+YF8Rr2GVIXpPTwQq2qlM5wTAldEfN0J2IQdGYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TRnia4ltepNUfDtsrm3psEMiw8CnCLeSnFNkY4GmAnJB8w0aeurXkRpiXyGqFozE8FnsE1Mgzy0NelUZnJ37bUO5I0ZGMVu445L4vWMW0NG6BLIFk7yBGk6p+ZNNZU8hN/KL6RlZ/H/Nz6GAEuEErsXZsunZgC7N4Gw4SjW2i2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUaWQSMw; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUaWQSMw"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4ab70b882c5so1021529b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788379220; x=1788984020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=InDs+YF8Rr2GVIXpPTwQq2qlM5wTAldEfN0J2IQdGYA=;
        b=aUaWQSMwvBzwZySrhLChY7fL3N7BBxTnLROl/z1kUVxsOng8p395VveDiYV3HxAajI
         7ycSKtTdmdJNdn00sfVIOaz1a4e9EdtjBNylgFTGVh6JlUXqQdz8t2L6gmUS5ZRzXz0H
         CH9+V5mU/OKDbvrFohGWC64YabfnYKnzYQ67Lyuzwzp7myJF8ZLZe10IqK+AhY8wkbNY
         c1cMfI2MKDoC/84c030kbtU/n1bMuZFsXUkvC3Mntvmdb2P4WB/AE+dgD4KZJs25iPUN
         NPwrC+gubo0KaXXCMrdjb3TJJAfroecyUNgJFKPr8K06/dk5+JhOcvPyoYl911TDFMWr
         e7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379220; x=1788984020;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=InDs+YF8Rr2GVIXpPTwQq2qlM5wTAldEfN0J2IQdGYA=;
        b=mHwzjiUh8IvUe1bo+81nHsoFbnkpbRz51F7LznSGGY9FeHczx3oSjDF/fCdKWyg8RM
         VlqyyIlO7iDYQU1LvT5UxmIyZkoAoJ7KV0s9qMdXpf3olIhzN2PwiObY61m6wHuzrVo0
         subEM+HVotfj1B4OyrAYVEKn84r+TsuDM10eFTVkGTgHFPVgFfzAsFJYYd2bF4cMiIJz
         wguLKcQEwFIWq8NDfZe+QsXiaIuTx3BCDzJv2xAA7DvUlr9SzEQXiG0CTs8Tue7hNZaE
         jtrPRYv1QuJnlM0FrNEqdGI5ShlENLs08AZtcee8zd3UKaobKyjefSACYdSbq5EyOe2n
         W/vw==
X-Forwarded-Encrypted: i=1; AHgh+Rra5hmUxKkfpK/PqiT5/eF1SMYw/5lcjzQQf6WN7JZR59lIP6/3FRB1/L1k7oyJpbefoplus/pCwuPD7aI=@vger.kernel.org
X-Gm-Message-State: AFuF++nJFJS0+Y6HLl58ir0kkOoaBsW7l+JOYShgEVSpHFjelUX1C59d
	ybuaOMAhPZDpT9k0+q4rrM5GNLIPXyyNh3BJvu0nr1sZM1jnLChhICLQ
X-Gm-Gg: AR+sD13FRfxxExwUFBbeaVpExcw+2qGMPnd5aw1YDbRI1chTgR+XX+viYIc1B9uBV4/
	JPIpzLLnUI10VSR4623YwZxwXrGLkfErAhAgm7a375DTBuQi/sxcJBsoUVdvMqN6LZAYn0+Hr8n
	doQD1V7k48ZI+/1he3Qsq7WFlzIn+2KYU5kuGox6fryiZlcHNPGgNOhjRX6gYZNiG/yWFy09E2Q
	dT0tUhw2UZbq1yoyBTX39OoKlgMxR0Ylhd1bF85uuH3ukrB/RNwWZGdGEMVcUaVtStNnlmzacVG
	jnkuJOMLS8HBHjewTfnaVafghTuq/QUtrlgZY/gPlHbvQ1HWKcbRtDaPpe/XVfbs4XQzyVcy+Z+
	e7aPUpnGaAKXN3c+umFcIktq7vmIzbLRbB46HSNbhqrhMhADEhlMUuMfsN/CH/3dEarVHy0G4xg
	F3jeSDBUPAI8hOmAtYHrTOgbzZ5l2epSFeXmRWyVcYSq6d8X8WMna+rkgL2dbsMruElqJQzF4Cv
	shShDEP3z3N+RnguA==
X-Received: by 2002:a05:6808:1512:b0:4b3:79ae:1495 with SMTP id 5614622812f47-4b6bc65c863mr6085404b6e.5.1788379220030;
        Wed, 02 Sep 2026 13:00:20 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:f::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b69b214817sm2976454b6e.12.2026.09.02.13.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:00:19 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	cgroup@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] selftests/cgroup: Skip test_no_invasive_cgroup_shrink if zswap shrinker is enabled
Date: Wed,  2 Sep 2026 13:00:15 -0700
Message-ID: <20260902200017.3847858-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAKEwX=MD_EcAaLzMGnMytVJ_KTGmv=hpR2h-DD+w0oJRjzkg6Q@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 1 Sep 2026 14:04:22 -0400 Nhat Pham <nphamcs@gmail.com> wrote:

> On Tue, Sep 1, 2026 at 12:13 PM Joshua Hahn <joshua.hahnjy@gmail.com> wrote:
> >
> > The test_no_invasive_cgroup_shrink selftest checks that when a cgroup
> > has zswapped out more pages than memory.zswap.max, that it does not
> > trigger writeback for other cgroups. To do this, it compares the
> > writeback count in a control cgroup and makes sure that it is 0,
> > and compares it to the writeback count in a aggressor cgroup who
> > does expect to see writeback.
> >
> > When the zswap shrinker is enabled however, there is an additional path
> > to zswap writeback, which can happen independently of reaching the
> > memory.zswap.max limit.
> >
> > The writeback counter cannot distinguish between invasive noisy-neighbor
> > driven writeback and the zswap shrinker work, so the test becomes
> > invalid.

Hi Nhat!

Thanks for the quick review on this.

> I think writeback in the control group (zw_group) happens right during
> the first round of memory allocation, but there shouldn't be any on
> the second round (as the second round involves writing to wb_group
> only). So if we read zswap writeback counter of that cgroup (zw_group)
> right after that first allocation round, and make sure delta = 0 after
> the second round, then that should work for both shrinker_enabled = Y
> v.s N.

That is very smart and much better than just skipping the test, I'll
take your approach. I've sent a v2 in [1].

Have a great day Nhat! Thank you again!
Joshua

[1] https://lore.kernel.org/all/20260902194521.3652178-1-joshua.hahnjy@gmail.com/
