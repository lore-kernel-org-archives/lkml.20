Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C132B1A268
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789173496; cv=none; b=Xsh5RdTfv7flfqliE4cFaKjup9D4YZOD0I3iTJhKQTWWbmUvOeOO80mgf7iIhBCsMPQ9QEJAmYDGs3e35k1jJ2vGA1i9jjyTsS7/hPRhuDOkDNtyOVCDvBn4Z0ARwD6iDkAFbKfGc3aBhwdLzL0HM6N7KEK27ftnBFMCpgcJwlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789173496; c=relaxed/simple;
	bh=4+pvpfnm7Y+kldzOhwF17EFvoIoCbYAxiP4iinuidC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PAoJA06LcfvISZoy1NC0GxqLTNl+GcK1tU78h+mK89L3+QkJgRwJowiTt7duccgyMCK7SI1JdG9Jq5Lmqz7LwTY8yXf+8w9z5zfVAelUclOf/4545xpz82lJWgNUQyibPHKS/wRlvPEWUcg0a/ZwEl0+n2/nufpIToxjVMXFvio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o6to8Gou; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o6to8Gou"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-381b831d535so2729773a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789173494; x=1789778294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZQfj7II/byHNXuSfY97UNVF+e/8Sy7W9P4BrNmI8r8=;
        b=o6to8GouIPEYZ/SzVdzTf2kZY983seN6a2br/R+4oqWau6Q9NuIMUMydqyb/zg03r4
         tPlGdC4fAFBPouQc1OKiEg4K9lZpawyD4WK6IUnaWouI66R+nfhUGevwBqjcVyKcPF6K
         MUKFmoWu11u841qPW1YkFvHI13ys2fZW/ekE45Dik3h3fLmrj8jmOqs2OOPVLRjAsB1M
         7+JMRFz6MVaSoRwzyCU3c1Kw3WVF/UPIitOk41s1RiI0EqQ1LiaLHJtCIQwxLxU0IUo9
         OeGMUKa1SZitP4dbVDkqITkt/+ctxFq6YiQm+FmFzFv5u3sbF1Fie8deghT5BYaIAc7C
         9fRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789173494; x=1789778294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yZQfj7II/byHNXuSfY97UNVF+e/8Sy7W9P4BrNmI8r8=;
        b=MKQVdKTOXtwBWevhjM2x2tEk7SOiTZkeaMyK7r33uMTm/u+Rj9CsGkQMnddNUt6Seu
         0Ux2Nhq/Dm4bh5kes+2urNmRpEhrQJby9nbj1U3qRxXkCTXoVc3YgiIb721CD2HQ4S1o
         nI/pmKPGjg/GQTmMI+7x7enMhoFm4gIMBFSBvTF9BCRXOxkpci3vuHdYFV0Ou9rrshR8
         XRoHtrb3bqJUNpDPSH/4W7fyNJMmNK1jJD9+wkZbvDejZwwuBQlxwxT2b9gRMNfn0xYg
         64+piKY1TknoZL1/7EtZ6FfbgPnS2n8etivfz566qWXh/STbMuH6tvIvwE43ChNONbBz
         us5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzFVh5MQUQnnSlPjIwSbCy6zSTjuRuEhtwMn7UVcSkE3Q8Lew9e2hpvR0f505u6GubGzKTwh3dp67Eg3as=@vger.kernel.org
X-Gm-Message-State: AFuF++ktG1LP5WF1cIcjmOquWrp06hLwVSL5kNKX3utb0x1zVagBDZ8F
	E2AW7oCPRpi1ekFFFp4XSwhFWO4+ihlKIrSlL4iO6BbXYZrjNQrMVdI=
X-Gm-Gg: AYBFou2KmtP2cqEVG4ri81SzWOXNCU6wG1bbGM8GiJriudAfz8ar2mteOnVXEDFye/p
	DMXza7LcY7Rkv9NpGE1rCglV9wZuy4M8/hTXfBcYWw8TaR8A3NQrvi0LA11My4NN5koL6K2mUQW
	q0zi1RHt4gAjkZIianvweBtFFXiLcRPW9hI+xJdh0WJS01tkOCyRcUtLoCg2CvCFJNbBvVviNqp
	MfrEVcG6UTpl8LsbLqUa94vsB3PgkpV6QryMRo5AzEBIW4qAanHXK81zCq5bzK2wZSHlfZzXQbs
	NIwgM3OelbzYZN1IFdjDJCDcgS5buj0iD+Es/+qp7VFjVUOM/EEekD432m92DGSOCWV8TdYoeMu
	rgbm34CQ7SJF0ubgp/m2Hp64G/AsNZbG4Sv81P4q2cWqsq+rDKTYjl7oFN4YDi12pkHns8lJyfS
	bIfWoE1rE7UP2kTrjKMyDpqSwqzatlIaIyLL6lUTzE0uru+OoXZQRfSQ4YSonIIFxfYybSNmtCn
	ej+IEpsR1gT2GyoiXodiNExjw==
X-Received: by 2002:a17:90a:e7cb:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-39d9b960826mr1728046a91.0.1789173494034;
        Fri, 11 Sep 2026 17:38:14 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39db113a3d0sm2808801a91.14.2026.09.11.17.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:38:12 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev,
	Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Luben Tuikov <ltuikov89@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sched: Free the run queues at the end of drm_sched_fini()
Date: Sat, 12 Sep 2026 09:38:05 +0900
Message-ID: <20260912003805.1900119-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910123736.6EB8D1F000FF@smtp.kernel.org>
References: <20260910121601.805032-1-donggeunyoo.kernel@gmail.com> <20260910123736.6EB8D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/10/26 21:37, sashiko-bot@kernel.org wrote:
> [Critical] Potential Use-After-Free of `sched` and `sched->sched_rq` if
> `drm_sched_fini()` is called with pending jobs and `own_submit_wq` is false.

The chain is there in the scheduler. drm_sched_start() queues work_run_job
unconditionally, and drm_sched_fini() destroys submit_wq only when it owns it,
so a timeout handler restarting the scheduler during teardown could leave work
behind that later reads sched->sched_rq[i].

No in-tree driver reaches it. Of the four that pass their own submit_wq:

  - panthor sets .timeout = MAX_SCHEDULE_TIMEOUT on both its schedulers, which
    drm_sched_start_timeout() tests before anything else, so the TDR never arms;
  - powervr refcounts the context, and pvr_queue_destroy() runs only after the
    last reference is dropped, which in-flight jobs hold;
  - nouveau waits on nouveau_sched_job_list_empty() before drm_sched_fini();
  - xe never calls drm_sched_start().

Both drivers named in the report are covered, for different reasons. So there
is nothing here for this patch, which only moves the run queue frees within
drm_sched_fini().

The one thing worth recording is that the protection is per-driver rather than
structural. A driver combining its own submit_wq, a finite timeout, and
drm_sched_start() in timedout_job would have to drain before teardown itself.

Regards,
Donggeun
