Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83E534752D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789019174; cv=none; b=VbGsXqEVcgIKt4pNVgLmtthf7guf/AIGvBDTkNh9VLzW8lT8FI6ZsD+AxpI+6M+qnGLYw8gZWWo5z36Vh5s590R5BWnJwEEXueNu3Z6GGfn56Ug65xx6QVd5iazswVyGgOxime26EEgWVfDLft5WcycnumUFYWCbMgjF03LCbww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789019174; c=relaxed/simple;
	bh=fnx/8AcbTnHH8l1xfCXH1t30VnijkM4gl54BXgr1S1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=erB1vkloMgL8jTENfKwN9gBfa6igLz8x2+HXZiNJH/JOnSwlB+qJ71qKDdsMyz+TSqmm80MFsHPpNvLJYD7A0AOAn+U0izdjs2WHoBcYbmr5AG18/zwa2wonzH+iiIIO/lXjoKbnMy2aA/hMwf/qrkHLRjaD/wJEnkWNJo96be0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fiyTwTVv; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fiyTwTVv"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso791745a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 22:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789019172; x=1789623972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lE5bmYQSEcccsYl1AnANvihWUXVywi9TBbBYgSROwSo=;
        b=fiyTwTVvnXgcM9xzwQeZjk7Jlawo/hh1+7mnEJJbWxdluNOQ8lVCCXPX1z/+MLY/4C
         19rL2Cvwsi0iJZ7+DHqhJttB5Fa+47opHiRmwqSCE0ebKpBl5JkvE+J5/ysggVfv/arM
         qA+nzukveLjqnzTIibGjlgvmUhBZUltDk1m0a1EH65uxbdCzgeukYqDFFewjFyif/Jpn
         VW3416iAh/2gOP/mlI+ApronND8IRPwkxnpwAnchR+p3J1c6azkEQH7xCRoeMGKzObQi
         1v4lNG/+K6kQkQ+Q1J9QH73xa0/5hTeuTgBGc+2MGEBpWDSN0I1Rl2tPKYsspOdf/gPC
         piyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789019172; x=1789623972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lE5bmYQSEcccsYl1AnANvihWUXVywi9TBbBYgSROwSo=;
        b=W/70SSEDwe5t4qxxRC5BgkYAp2inbxGrkL0QMu8FQRrwJd8hJGgmkZ0XTU4lqH5BXQ
         DsfUoiRoCkroOHrD2rjyxwbW+Kkrg2LdH45xRmw3TKGASpMWnXALE2Cq5jOBj1mUEDC9
         OS0DUh2UopbJHMcgEuax3rFJCjy+Rq0XCzaAVZjqUopa/JWA4BXXtUEMqoFxAE+UWzjZ
         JY8PmTbUCvJy/hAPvPHBxetAAiKTwVJQgYK5r5+Vj9FzZ1dZDaex9FKyx7qkWP+3vHaQ
         ySH1WEUZOSO6XVSSXJt+XhZLKKG88NTbZgrZIVAgaz+fu0RIYJU8SWVWdnxEuz03sEnH
         1mFw==
X-Forwarded-Encrypted: i=1; AKwUvBx6eDMGXa9IOkSBr2fbfMsjiKBTWcguy5rFlj907oG7JTvYRWCkoBJCTX/EAjEdkd3drmt1hLeX/vwWUtc=@vger.kernel.org
X-Gm-Message-State: AFuF++nw5aKvnu1Sf7hl9bsQci7Vc9jmfMaSWLhZmhFqoJnCYUuhfH9T
	wM3mWLbC1YoZEtJcHMyygAQqA49txqIQHSQWr1P9L7+b167av2gA6XwTa75E5Fw=
X-Gm-Gg: AYBFou09xnaz5+kObhMqh3Z8Ikfr7gVHaWJlG08eKVho/ovE1wPJIEV6k9S6eQ4RTxA
	Riamnc69e95kqS1BoWlj2kd0ZqpyEeaQT1XJdU/FMZk9VwmXw44NeFFPYbbbzPCi1kqwZnd/FcZ
	Z0LtczpZ0LZf+p342t7EJfi5fhoFT6yUubWDGk05oVzPIQHFpkwzHhZu2p8mwungNMKveDa8zse
	OMtzfWlL4X50mdHQSY5GqaIhcxlN6bobS5fajcJMVPIZWT8tfLy1DTFdb3r5MZytkJvVAfXsVBP
	6mg1yy0d9z3R1oz9a405hdgWhSngGY98/lBYtn7PUvNknPvzqS9mPO1aKKxR35ek3AEYitsCAKN
	e06SeCaUe/q8iT+tusvnZpZk0dDxGDWvKWpXRPx+K6NSe/IM9CcfXqw0wL91xVoqlAjYFZZMaJx
	uMmrfCj2isL40rHUJE2elmdIoUQohg5dgVBmMwgXc2P5PhXlKW/dBquzXNIdWRV0Hz6j+rNpfUt
	tCpnLLyJQrPtXtz1cyVBReMkA==
X-Received: by 2002:a05:6a21:6487:b0:3d4:52bd:b89d with SMTP id adf61e73a8af0-3da3a0b2671mr57967347637.23.1789019171857;
        Wed, 09 Sep 2026 22:46:11 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f04:fd2a:f01d:1dc7:1e5:47d8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc455451b46sm7572279a12.18.2026.09.09.22.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 22:46:11 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Luben Tuikov <ltuikov89@gmail.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: drm/sched: run queues freed before the TDR that drm_sched_fini() waits for
Date: Thu, 10 Sep 2026 14:46:05 +0900
Message-ID: <20260910054605.634135-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Philipp,

drm_sched_fini() frees the run queues above the two steps that wait for
users of them:

	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++)
		kfree(sched->sched_rq[i]);

	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
	wake_up_all(&sched->job_scheduled);

	/* Confirm no work left behind accessing device structures */
	cancel_delayed_work_sync(&sched->work_tdr);

4827d6d83f07 ("drm/sched: Remove racy hack from drm_sched_fini()") did not
change that ordering - the kfree() was above the wakeup before it as well,
and has been since 56e449603f0a ("drm/sched: Convert the GPU scheduler to
variable number of run-queues") made the run queues separately allocated.
But with the loop body gone there no longer seems to be anything holding
the free up there.

A KUnit case that keeps the TDR inside timedout_job() while drm_sched_fini()
runs, with the callback calling drm_sched_increase_karma() as amdgpu does:

  BUG: KASAN: slab-use-after-free in _raw_spin_lock+0x2b/0x40
  Workqueue: events drm_sched_job_timedout
   drm_sched_increase_karma+0x138/0x3e0
   fini_uaf_timedout_job+0x4c/0x140
   drm_sched_job_timedout+0x1b4/0x620
  allocated by drm_sched_init+0x49c, freed by drm_sched_fini+0xec

Moving the loop down beside kfree(sched->sched_rq) silences it, and nothing
between the two positions reads the run queues. Is that the right fix, or is
the intended rule that the TDR can never still be running at that point?

Resent: the original did not reach dri-devel - I was not subscribed at the
time. Apologies to those seeing it twice.

Thanks,
Donggeun
