Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F0459B687
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658333; cv=none; b=WkbYQwchOBT0q8fuU8gvYutXe0oXinrG8ETWZha/yfcjjTt6BvYgDksSmqVDmJTDkL1mqCTkudLiAuF+I/NysRmN09tDB4I1OPId62220eID2/D5kbBiCKS1DTB1hyy34zjF6Vjmr7EG1bc+9Jk2reor5WLzw3BuwsU65sSROd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658333; c=relaxed/simple;
	bh=ei97T4Navrh7XZYuh9kk6IMlxOtE/I5ajJ7jAqFv5B4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=meiBMJypgf/xTaNGvCeczEF1Kh2GDfvSFBzWCJhv/ca3+N+mUxbQvZ7LrfpGq9u6Hug2lNbPvVWJGyTkJhj5Ox3x8ym/XuGYHzmEaY7n1ghD4UgIk76gIoIJO5ZcFrOugkGezAAY2bxzuNhEmNjiWxzRANMYy6se2t88V0v6VtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEMx/Zer; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEMx/Zer"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so723046a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789658320; x=1790263120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=an16D1BLDmpgdn+H3vzSxv0+HLMXqJ/V96lgL35ts2o=;
        b=HEMx/ZerTPHLwefRMu7XN+F97Wr3CHoygco/2SJvT892+UpFyaHSmd/9EdLOQz3HIk
         eSdpBrMcuGisjBk0XftBS7NfREdc0d8RjFNrcu8cOY3A06RsvYDVRPRSOpDvlFp8+/Bb
         PbsOl6HH9TUKs0lL+ydnaQazegZdsR9mR2j0j2HkY3ghvHnts/N/vLpQ+WxtrpQfIM3q
         jwN7XMWPARuMyKoZcF/p80c/j/KXgnmtao0+meUpukOJGJXeCmwVMNrSM/uXgUabxl8J
         NjoBHk4V4g9xYHgILphtyBKpoE5YoiW+cQlJa41E9OCrRJL4qiRVZNESVnk5+8R4eLIh
         ki8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658320; x=1790263120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=an16D1BLDmpgdn+H3vzSxv0+HLMXqJ/V96lgL35ts2o=;
        b=dTPuEyfydzBd3+OxpS0NU3zfTdxN4LzFmHY5GqDN136oFfeKucYt77H4pdxs7W+tB3
         l7HD2V7/HD0ap/EKBdOd8ABa0yS9hx5RZC06hjUK7ULksOhnkv1EUiPcYX5hlhmLGnys
         f/AFfBh/Y6aiIL50DIhPFBIHG9hzXrRHOMMLdIN3/Za7+hWZm+Nc0cDPDCigLmFEM92m
         OoQPGhcnWLiN4xMJkwYqARMGOJh/4awn+JB+sqpcHTw9F/6Uv/ZKoALpxhRB7hrJ/FUU
         gurse88UAkqRZufWx1rYNMeyz9h/9xa/OFQx4K0s+1m8hwqGshjOZCmoHyaChYQeqzdm
         lttg==
X-Forwarded-Encrypted: i=1; AKwUvBy6SkqWTyS1Wnj/xrEPXq4mu+H1fRukbSh5TNQhxVNl645gLp+srX6wgvE6KbZehjjacrk6GalKCpKuMYE=@vger.kernel.org
X-Gm-Message-State: AFuF++l4O3VMxjpMTSkSyFXV6HHJF+FAx0zUolG2looqhOb5nPa2aFsZ
	kHgml+kp/2UTau06VaibbTl4ng6xGHuFJTD6wR0CianMTbyw8yij41Km7FRs1hnl
X-Gm-Gg: AYBFou2BdNrickeC8C8VJ5jn2ig2gW+IiutUlmvR0+WU7jEcIxbEvvVzXchJpLppKTz
	9vZcCzaLrIr2nIkLRuU8YVys5EAF/FxOw5QPiBFcoofYxwRZo6mu0UbBUvK8E8fzcv53sdOlNRG
	LJUkMtJ2d6QK7Izapac/urDifHveuKeGOxko/bPG4t97ZYoG1CcsQP/b6ct49BqvzLW+FgkJN9u
	AZjN/+l+Wa7SiR3CXPzlbFo/y9DN12CpRU0r07mVZ8v4UNDHgHpefRkCjxT0lHdqO9Wapdp7BYb
	MytllgEXPvJ4JyJQEKhvkgdUpfkxX1HzQISyHH9SBvy5gl+1aGsGLqZDfYDh8tJG3rvVScUyfoG
	Q1BPtbhx0GALyOF0lmqt/twnog8TerDy6IUCpsg+QH+0pFCzBDRoXXr3BkiocOlBZ4oN4fEuTOP
	T2Na/0MReiaW/VX4ocXSbj7dD1GxhnKAkoysXhMVS8KWdaMjs6thFtDvlJhOw8QixwFMahvE10v
	g==
X-Received: by 2002:a17:90b:5848:b0:39e:3558:f91c with SMTP id 98e67ed59e1d1-39e3558fa60mr9348150a91.24.1789658319683;
        Thu, 17 Sep 2026 08:18:39 -0700 (PDT)
Received: from archlinux ([2402:e280:411b:ec:aa93:b1ec:5a6b:5fce])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3909d02asm1525287a91.0.2026.09.17.08.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:18:38 -0700 (PDT)
From: Adarsh Das <adarshdas950@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dakr@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	rafael@kernel.org,
	stable@vger.kernel.org,
	syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com
Subject: Re: [PATCH] kobject: fix uevent socket use-after-free on net namespace delete
Date: Thu, 17 Sep 2026 20:48:30 +0530
Message-ID: <20260917151830.89024-1-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026091756-widen-doozy-399c@gregkh>
References: <2026091756-widen-doozy-399c@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Sorry, I wasn't aware of the Assisted-by tag before. Should I send a
V2 with it?

For testing I ran syzbot's C repro with -smp 4 on master, with
multiple parallel instances of the repro. I was able to reproduce
the bug:

  BUG: KASAN: slab-use-after-free in kobject_uevent_env+
  Read of size 8 at addr ffff88800fa7f090 by task kworker/u16:5
  CPU: 3
  Workqueue: ib-unreg-wq ib_unregister_work
  Call Trace:
    kasan_report
    kobject_uevent_env+0xc71/0xd90
    device_del+0x7c7/0xcf0
    disable_device+0x1d2/0x260
    __ib_unregister_device+0x26b/0x400
    ib_unregister_work+0x19/0x30
    worker_thread
    kthread
  Allocated by task 498:
    uevent_net_init+0xe5/0x340
    setup_net
    copy_net_ns
    unshare_nsproxy_namespaces
    ksys_unshare
  Freed by task 63:
    kfree
    ops_undo_list
    cleanup_net
    worker_thread
  The buggy address belongs to the cache kmalloc-32 of size 32

With this patch applied, I ran the same repro repeatedly (including
parallel runs) and did not see the KASAN error anymore.
