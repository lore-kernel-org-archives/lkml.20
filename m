Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E250368968
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495088; cv=none; b=epLu0+D2t3W/G4pNhJr7UvwA9KLBSUbhoyazDi8lxxqC7NRvrXujMo5cplqTq8FAvINLw1R2hsynhVILoJJehlMwtp2piCp8eBciOLcqcFunjhnPYhJhCwr2BGsnbdMbpYxSK+vyCQhqr9vG3bFLbwMNYUpT3zXx5MK/PicPvis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495088; c=relaxed/simple;
	bh=FpcB0kpub2fAPepSq3HX3yXszymBy81A3aqkeOms5sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gqPy+SJ2Bsyx2KMDdYgw4q5qoBk9Y8wWKG6BVvboNvBUIuAfJX2yEnITh90+09vZatRr+gxPy7Ed9qQkCgMV593DUczDBr2CGrcJNJsTWzKWWi0AmgNsh9Wd6Nz8xU0JRFq1e0/FloRkaRfThjdIJCNMQ/E9kdz5+vzatZ0C49g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SztJ4aEI; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SztJ4aEI"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c7e8a176c1so20481e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789495086; x=1790099886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FpcB0kpub2fAPepSq3HX3yXszymBy81A3aqkeOms5sc=;
        b=SztJ4aEI0HsTYYIuKgKDe/84lw9hZLsYt2dU57XhIp7wZ8mV0SJlsloSubuumYUB28
         gnZYFE5mz7S85Xh7JyKvA4x0kzSxELmLw1WDAtE4hJo7o2zO8+ayjc5QWYgD7zUxd0kK
         YGRrUSUCXkqUmQwdJAqiVVrqRz2mpLdbfQPUrQxosPbhX/SYNsbKx5iDzdCU6/+Ztd62
         ktbGOtvO8kOjwO/ItWqW7gKqBCM8s0DljB0CI5f9XeeeSRIdq889uBhv7AkkZ0iEZCeB
         G6bNvQoG5Dd24OVlfKG24m/k1+EP/KcttHP28qnn23eU1+Mo/hSCsPoJZmw7qbYkV7Wx
         czog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789495086; x=1790099886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FpcB0kpub2fAPepSq3HX3yXszymBy81A3aqkeOms5sc=;
        b=cgfVW5ONdpk0qy1FHQskPKXu3AIV0ext4FV2thk4IfKHS7hNuftp5HEgOE0dpvkowd
         4hzfM9QkEFZLThd85FNzn5bMOhzWoFiJdLV/Cs+9uEjR8h35XBPs6QlEwLJ3uLv3WbAx
         vRImF2ZSVQGhYfUotn8nm/vW3PNPrpRkPZWJzVli+XLu81lHHKU6rcdNOozTl0o7I0jv
         CWcKJRpDcQUeZBKZSoLxSeUE1rus35G26izMoThbQm+sjfcC/1d+ix9g99/H9QzxAoIl
         duhYxg51DjIRUHaJ2Eu6xb9+qTZguXWi4r/qXQbMP2qeTIwLZHPE9USJoP2ytncRCTLW
         F8kg==
X-Forwarded-Encrypted: i=1; AKwUvBxmB9iGwUbTuaACYL1UkD0dWEYZXjhminZxB2gK46RLpGsrDbpsh0fNEUD6x3Ct892ZWDNi6OOmM5dffRs=@vger.kernel.org
X-Gm-Message-State: AFuF++nsnNUifnlHKFh2gpRxfAnAeGqXQtXrygy3j8NDIg6wUe7LQo0v
	ACHo3YHWoMinwbXxRG6xFJu41JLKFtWIoC9CmxAiug7mHnoL7Cetg5L5
X-Gm-Gg: AYBFou0lA0Yj4bznn7z6085XPSjKpjjzgBzavDdlFQF0mMODt/AlijJK77Z6MfWhafv
	vuTsk3AqCXHd2A7MW+rI93CFHvDK7F/+tLfy/H+rb1CNEpf1sHeimKV8uQ8d+PNxmKiFx42murJ
	mF94uc/WzMsa14VfobHIrzVdMzWkc2VYJ2fmIOLYuCHWXPxBQlYWq5fwuCQ656m0VBbGPnXA19c
	aH2jzVweZKRUDrYpM8vK3qexMfLAgHIzdOBxZq5/NBl4+pa+Gubqsj+EHy2FSQOxjFQoPHFfZNv
	bI5wQiCD/afYRtRi+ggr1inReFUQxtxTrgj/o57Eus990REbWdkcC1AzQ6pCO5uEIV5Y0g2mWpb
	ZsYFJ8CEEBdZz7niMe8v9UMSdxdOwaBwMivcJ/Gvq1H5gUvmML3Uc27zV/1JzhKNphUE/m6A+Px
	xs06Rslein754xNgm5058c27oy9kGVm1i3TW5LSP8E0dAtlzOC8aBOwGRvDhsxGiRN5kyHwQljh
	2p28kFE6ExxkwTgk7J9Je1oJso=
X-Received: by 2002:a05:6122:d86:b0:5c9:54c6:b4c6 with SMTP id 71dfb90a1353d-5c981a92cbfmr11794778e0c.2.1789495086269;
        Tue, 15 Sep 2026 10:58:06 -0700 (PDT)
Received: from localhost ([200.151.1.221])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9831522ab39sm159391241.7.2026.09.15.10.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:58:05 -0700 (PDT)
From: Davi Chaves Azevedo <davichazbh@gmail.com>
To: kprateek.nayak@amd.com
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	chen.yu@linux.dev,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/cache: Refresh LLC capacity across CPU hotplug
Date: Tue, 15 Sep 2026 14:57:14 -0300
Message-ID: <20260915175714.2015751-1-davichazbh@gmail.com>
In-Reply-To: <20260911220229.1368887-1-davichazbh@gmail.com>
References: <20260911220229.1368887-1-davichazbh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Prateek,=0D
=0D
Thanks for the review and testing. I've added both tags to my local patch,=
=0D
with no code changes.=0D
=0D
Tim, may I include your Reviewed-by? Chenyu, may I include your Tested-by=0D
for the Ryzen and Xeon checks you reported too?=0D
=0D
Thanks,=0D
Davi=0D
