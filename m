Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780502192FA
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787883622; cv=none; b=Tc1iN3G729If+vwUEVLA68K+LB3flzQQTEd2sA2OsYnc/tjfdm+QcfCuCDWBEjtmjmx5Ip06QxhdXPHA8tZ2kRwFZxFtRQSwaROrpFgO6FFHtCnI8B7ZA86PkPdTsIS2vZeZJz8q2PclY7emnIay+lDdimJwfoEUsNoFDPqZmvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787883622; c=relaxed/simple;
	bh=4RDc/5PWm69XOy/hqz2EkrxyZhYW+EiQYgCxRkXTWlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zc6koTCwFZEKOqqxapD94HM4931Zj2hAMxJdfPkXu4me7/I8UgGr5uG/DEZFcL+/I5NhzucyRFy7BXzt+/ezkV1zFWKi9vn6Yn3HDfut2lHVyxoDxQW0q0hDR6E7rKGlg6aDpV3r/bY6WOx5PFYDShAR4jDeUx8ONIv6FdwOq3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6Zvgw2W; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6Zvgw2W"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2caed617615so3260685ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 19:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787883621; x=1788488421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VwJmvqefAZf9FEe3MT9znNGcJ67pRMma8SBW9NDPtAo=;
        b=G6Zvgw2WXEM6qk7DnGXGxQ+31LSMENnKaUNCBNvpiV2/eMTH+8ds8aBDPZWZEtfkMV
         FaTsiA97jxImIFXHKcqQpUJEbPPzQwuKe0cDzOQYs5UTX1L8bAaQ20YC/XteRadwZnoq
         oueucasuavR+aBuTBRC52ar+CGwfUCJwqn9LFjuUxt0oDsK/xlSwYh27Pfn3F6Oh/tU/
         OId1w0ECoxghxJWNDzv2d0gQJPIeYIMcHCcyIL60oRO/0MGxazE2m2jJAs/bVY5zdZ4N
         Wv/4wkjqyMi+b9AvwrYjCxYpRV7RkD4EaMcvBB37DamZGkkkiyr9b2/fipEXaAqCIb5o
         YC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787883621; x=1788488421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VwJmvqefAZf9FEe3MT9znNGcJ67pRMma8SBW9NDPtAo=;
        b=qhm8m81N91zwcg+aMoNomSVpFMVDyCxZ+vkjJRjFVkBGl71YBonmMggywdPODjRj0w
         QMiNJhp0EC4GNHSxRSEePIGd2M7YeDW79IlNPQNcpSd+us5588yEaK0cngSkdWr2NuOG
         35BCalfgquj3d3/rgPR4LTNkIVqV06gNgC1gAtQfMAdHd9dfXrxkhL/uamHKXNy/yqHJ
         ECTvucNQG4VVWtQDzlX6NxouWXAIBh7VmYrZn++qwZ3cOTOEDSwwGOwmhCAzXLiUvp1P
         uU+hjdOt6saR8OMQtzk9U1Qbi9oulccfb1Ed6GSpgUOh8g6eG+FvRMn5VEVQBSmNfhR4
         hN7A==
X-Forwarded-Encrypted: i=1; AHgh+RpHbheAtbwbO33F/OLf1WvlV2miGcb1wSxJk7XFlEfOFtgSF1waoP2FMlGPpXTRDIPZQMHBJY++q33HrdI=@vger.kernel.org
X-Gm-Message-State: AFuF++m/GHFZ38MTDSg96lU+K2P9VeZkY9j/Q/c0O3GjRQNaNCSe1KhH
	ZPKPRU/6rVveqRL7+JEhvoe2EXCkxCjA/cOyzinMj5/YuzDLvEAJc5a+
X-Gm-Gg: AR+sD11AXuIgEwBP1mLjGj7jx2FRZj136tfzoJSewYcQgcoP0UYxRegms3QwhMOHOuU
	pxAl7DY/GVDA3/zesQFTzzvcGHQcR4Rz3PMZjq4V+eMe2mPS8h2LvJ9rqwBj/B5LggXza/0YbkG
	8MRiddjWY+6wRmv05Fr0/rEC8Wd6n+E32xHEZq9acPkEOk0nTYoaENqrZavrszHmUBvml9iynX1
	SVBBR/wAi5N5SgtAcLm4TqW+aCB8n8ReljlWCv7s6YO0dmD7EUVkHIkbZB0N32M0W8OTp+Wlgv6
	Rgam2InxF1l8kopVVXKlG5q/ZCTVa/rktb5ItokJnk01/1rMT4kunWvIPa8nMUEK2iq+bN86y4M
	QTLeH3MgIN3oMy2gcI+C37Li5JEBadSCZm4/fOMMesjGz4II7OnDijiwrJpHpvvWmdBmba6Se8k
	tgEaNc6TTPIFau0NHWGvshYZ/P+dt8RZcw8ZTSmlb2lNN5RfJj/FJm6R+lg4O7lcp4K9zUCl0qJ
	JfH
X-Received: by 2002:a17:902:f549:b0:2d3:6fac:d67c with SMTP id d9443c01a7336-2d74dde1b5cmr47603795ad.10.1787883620793;
        Thu, 27 Aug 2026 19:20:20 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988cb5dsm949425ad.64.2026.08.27.19.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 19:20:20 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: tim.c.chen@linux.intel.com
Cc: yu.c.chen@intel.com,
	peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH] sched/cache: Keep nr_pref_llc_running in the runnable domain
Date: Fri, 28 Aug 2026 10:20:12 +0800
Message-ID: <20260828022012.936112-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <59e2b8265fc650266b93d8f523c366edfa912428.camel@linux.intel.com>
References: <59e2b8265fc650266b93d8f523c366edfa912428.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Zhan Xusheng <zhanxusheng@xiaomi.com>=0D

The ordering the skip depends on is not visible in the diff, so for the=0D
record: dequeue_hierarchy() at fair.c:8148 reaches account_llc_dequeue()=0D
through dequeue_entity(), and clear_delayed() runs only afterwards at=0D
8164, so se->sched_delayed is still set when account_llc_dequeue() tests=0D
it.=0D
=0D
The sequences balance:=0D
=0D
  enqueue, dequeue                   +1, -1=0D
  enqueue, sleep, wake, dequeue      +1, -1 set_delayed,=0D
                                     +1 clear_delayed, -1=0D
  enqueue, sleep, real dequeue       +1, -1, skip, no re-add=0D
  load balance moves a delayed task  source unchanged, destination +1=0D
                                     with sched_delayed already clear=0D
=0D
requeue_delayed_entity() does not reach account_entity_enqueue(), doing=0D
only __enqueue_entity() and clear_delayed(), so the wake path cannot=0D
double count.  account_mm_sched() cannot see a delayed task either, since=0D
task_running_on_cpu() at fair.c:12245 requires task_on_rq_queued() on the=0D
current cpu and the caller is update_curr().=0D
=0D
sd->llc_counts is right to stay on queued semantics: both readers compare=0D
it against another llc_counts value, at fair.c:11895 and 13228, so delayed=
=0D
tasks shift both sides alike.=0D
=0D
Reviewed-by: Zhan Xusheng <zhanxusheng@xiaomi.com>=0D
=0D
Thanks,=0D
Zhan Xusheng=0D
