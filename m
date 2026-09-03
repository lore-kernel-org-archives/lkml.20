Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161F84A6CE0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445047; cv=none; b=eDsJIgWoYqsA1a5qcHJPFz2vKKhQP0eUGZOH9abZ6onbmXJVflEnjEpwU7JCj/R8IN059CefgpFB4GnOJmvN+Xq5PFMZPt8y/xwvXnn/SGnDBiK3K2het93oCHq3iw14wm+RcR/jbwog2jyhvbinIvJee+pw+R+CIcYGa1bHMA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445047; c=relaxed/simple;
	bh=grbSD99wnbBQjbz5a/guFkZGFX6aK7WNXYkMNE/JzbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sx3hW/UY1kDWTkyshMEyTl8jphtukIlGH8G1qx74/Cf9M9yEhCP4xTcgJ+UIr5G0pQs+nydW/bpTsHvHoaUUwUkXoTY0xjzDQIohqu/dW4mwcxNzJLZtKLJI0Rmg7CyZWNE0dPXDA44evQ2AA8gbataZRI33itU20jrHL/xfe6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOYurI94; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOYurI94"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6b1497f0453so1561273eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788445037; x=1789049837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zcCW6+/z3gty5vQ5bRmZgnTdisuOcsWk7AuFt/Gu6MM=;
        b=QOYurI94eBhCsm7GIovBe1qbVZIqPNiHvos/4RtFCcBOjOZ12nAzHNP14mwKrqYgnH
         pmAzOfjVcAFAesdrH0FgPpLqafI4FZc+Ex3bDHHM9VmKgpnGv69jftLgt4q2NSh3cvIp
         xV3v2UYGckSQrno+u6Lf7IS7UkP/LAEtmEMHUuJqBBNn0NEH1gS5f2FgkvQjRJ8DI/je
         g7fcDC5gniABI9l9Uo0RlCpvC/DeTE16o5QYQ8CVXsLWkbrk4S01gx/dZdS0u9NolutW
         bWZZQwW/dZIDmqMumyUWAW5xsskT77U6gDRnfhvc/MiVHoeqwF4r4eElOAgn8F9AL/IE
         g04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788445037; x=1789049837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zcCW6+/z3gty5vQ5bRmZgnTdisuOcsWk7AuFt/Gu6MM=;
        b=QQQzWqhA+7aBbJjc3CViTJwIrglXZTO61Kb2WMkYD7SCVJT/1V55T/qMF6tX1fCc9K
         Yx2j1tIpKq1zueWAAO4e1tWe4ru27GVTHgUBdKbNDy+QCShSTCeSCUF7yqDR6bjrCZVp
         FHqfTDGQZc7xBJk++L69UrohNJuxWl7SjxZRVyxjQ6h04bHm7f6HesubmzkREhfDkvJ/
         CWFZIm7fINvihZQ4gD7EzRbrFALW92J5XhjyOP+NYOR/YKiglUoaXCfoQEmKaZ1dn1hT
         WJ6Qrfh4WU3oyloOlbOsUKvmgXPu+YU2P6PDr7Y8SZI8rXiszBarT9pHFkpvpV7KC9gF
         kUbA==
X-Forwarded-Encrypted: i=1; AKwUvBwb5byPneo5ghDYJEibNc2akNb//xNuMOGZjLUKQu2uZKiBZ9vvaL+Lf690LkB/RfPEDlRpbJ49zmHEu/A=@vger.kernel.org
X-Gm-Message-State: AFuF++kLbGO9gKZdzFX8uBXn0pdpCcyuiN3HcY+ohYSUGSg4UY4pBmXu
	ClI73zcrF21pAu63X6PJ8WvvRdZAqfRv2ObiKeL+3BJgLWNYya23rcZk
X-Gm-Gg: AYBFou0kZ/jzAUAfbzBBceuqZsjAMdX1iMBqRzdoYwOScfvuo5tBkXBmIhlUO1zmIcH
	CdzieTOI7yTnP/sXFpKBA+8nrCVAMwRFgars02Rdn5d3avKDSbCISIxuAyvVgFoyhZRi6JDd1tw
	+OIYLogIo+fqVvKNkUyITEtR0xhthgjvt9H7ZKxlj7ADS+YL1outdU11PK07MwCDzgEPZbdhVkn
	GlEeRm8FIhQif2U+YMCmYZ4zmxUK7CUmXN70Q1Pwyk93jmrGTP+vN+OctMXN2r+fP2OTBMkDM6I
	fqYUieotsIQ7K7JpkhTkaK3224pvCf43jgSqRdNI3ZGIP4vzCvfnoSWx+H/ens9oWWaVZW/WiXt
	awzqjpbBZYbo6a9IpqYeym+kiv7TI2vZM3itgNhNiHmDZVvfeMIfHoa8lph+dDlQH8H4QfcU8fD
	QbWYkprZZUYRQAj9nnr9ZjSieiz6BKDRNaxj48tRD+fM7SBGhViyqmsNF9/XheyAxdBLhSSjLj4
	brma/YvaE65i1m37uI=
X-Received: by 2002:a05:6820:a0e:b0:6b1:4fe1:9464 with SMTP id 006d021491bc7-6b47dfac321mr10573094eaf.22.1788445036581;
        Thu, 03 Sep 2026 07:17:16 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:1b::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f3292c0b0sm7715350fac.12.2026.09.03.07.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:17:16 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Krush Chavan <krushchavan@outlook.com>,
	"Chengming Zhou" <chengming.zhou@linux.dev>,
	"Tejun Heo" <tj@kernel.org>,
	Michal =?ISO-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	"Shuah Khan" <shuah@kernel.org>,
	linux-mm@kvack.org,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v2] selftests/cgroup: account for zswap shrinker writeback
Date: Thu,  3 Sep 2026 07:17:13 -0700
Message-ID: <20260903141714.595256-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902180408.05b925ce05359cd4d7f96894@linux-foundation.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2 Sep 2026 18:04:08 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> On Wed,  2 Sep 2026 12:45:20 -0700 Joshua Hahn <joshua.hahnjy@gmail.com> wrote:
> 
> > The test_no_invasive_cgroup_shrink selftest checks that when a cgroup
> > has zswapped out more memory than memory.zswap.max, it does not
> > trigger writeback for other cgroups. To do this, it compares the
> > writeback count in a control cgroup and makes sure that it is 0,
> > and then checks the writeback count in an aggressor cgroup who does
> > expect to see writeback.
> > 
> > However, when the zswap shrinker is enabled, the victim cgroup can see
> > legitimate writebacks not triggered by the aggressor. In some Meta CI
> > tests, we have seen this failure mode happen.
> > 
> > Instead of checking that the victim cgroup has 0 writeback, compare the
> > writeback values before and after the aggressor runs and check that
> > the victim cgroup did not perform any additional writeback. Note that
> > this can still lead to probabilistic failures if writebacks take longer
> > than 5 seconds, but this should fix the systematic failure case.
> > 
> > Fixes: b5ba474f3f51 ("zswap: shrink zswap pool based on memory pressure")

Hello Andrew, I hope you're doing well!

> Thanks.
> 
> I do support backporting selftests fixes.  We want selftests to work
> well in the kernel with which they are shipped.  But, as ever, we
> should include a clear explanation of the userspace-visible runtime
> effects of the bug.
> 
> Seems the short answer is "false-positive test failures" but we can
> perhaps do a little better than that.  Quoting the failure messages
> would be a good way - very recognizable.

That sounds good to me. Unfortunately it seems like the selftests
aren't too expressive in terms of why it failed, so this is all that
I was able to pick up from the selftest logs:

ok 1 test_zswap_usage
ok 2 test_swapin_nozswap
ok 3 test_zswapin
ok 4 test_zswap_writeback_enabled
ok 5 test_zswap_writeback_disabled
ok 6 # SKIP test_no_kmem_bypass
not ok 7 test_no_invasive_cgroup_shrink
ok 8 test_zswap_incompressible
# 1 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
# Totals: pass:6 fail:1 xfail:0 xpass:0 skip:1 error:0

I'm not too sure how helpful this will be, but maybe it would be better
to amend the last line of the commit message to say:

...
than 5 seconds, but this should fix the systematic failure case
and make "not ok test_no_invasive_cgroup_shrink" less likely.

> > Reported-by: Krush Chavan <krushchavan@outlook.com>
> 
> Relatedly, is there a Link:/Closes:?

Unfortunately this was detected in our private CI workflow and raised
by Krush, so I'm not sure if there is anything we can share.

If there is anything else that I can add to make this clearer, please
let me know. I hope you have a great day Andrew!
Joshua
