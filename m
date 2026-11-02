Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632523;
	b=hgIWHGyaLl4d/JSc/d7WjjevxVkb+KmiskJCdAlFGz4hAoqftbZpo9jzEGmkdS9tX2mP
	 EI73PwiKwcZuKkmnhPt8NykPS2bYwQI5Dhsp81UDDjfFFribylp1OSIQuyyqiPqOMyWmz
	 n9F48OEtMl0W+hU+2SqRdi/us2Q4q4rZD7GN4DGF3lDpmIXVXl8Ig63cC1oyOvVQ6sgcO
	 i1ZCb+4bqIebbrkzGe2w+2moX8Tt16gkwSjYplch8xWHttHr2Ae7cknP3G8v+N3nTCmvy
	 MnaEHY2VSOv1CcLhYh6Ew6wQYlEoB3H4kxwQzVdQhwm9NBge9sCmGbW8+D4h33T91xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uslC4FnJpKGu4fXxxhRPOOfMsIJImwUJFmWZBF9HWbc=;
	b=Cu3HktIPfnXnm0AYyEd0IEbAAH8jzP/afr+rTeFWEjrBA43cCho9pZGCBpt6vfMBPaO8
	 N9oH+VIwnVeHodM8BQIV9fh7W5i9HUkFUcA1FKy6igIL1vCrnD+sSTeqdIwRuXCJrpexR
	 a6nahCxW7PZ+fWzNX8YuYoRSPoHeLf1ySdiBkxlo818pinvLTf8vwhTGbwYWoNWj83fNe
	 q2DYGEtxPqjJ1SRrDP7GYsYzGDxhWToIhCatPgDqqDhQGeruHBJAAGN2D+Dfwct9ecxGf
	 I9vTqt5vF08+PWXJ/LF4MufCwqa7JPofag60aAVHhG41WJK/8WKobjj957ExSOvIUpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bi9g4Mez;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F19E607993C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F19E607993C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bi9g4Mez
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso20849805e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793632522; x=1794237322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uslC4FnJpKGu4fXxxhRPOOfMsIJImwUJFmWZBF9HWbc=;
        b=Bi9g4MezSdGGdffsV9Jxm6mdsOipwdtZ+Hg6UwGAFq0Y3iDabg8Ue0XEyDAJzfhPa0
         zOhPtfQP1798j3q1sio5rLEJ2DfZHlDxKLOLaHrSc5w1xIyz0TYdRsnZtCKPYJDw5Jsx
         k825KJPOVjoxMdzDcHFx5ZlAE0z1WGGPDW/Wzpo6aPrS05rLZB9CkvUQnTbB6zZtW9pO
         PzQnifUYXvwGenymec7Pyu7IMQaP1JyCQi14CTPJQ+ZtDfwRSRVRDdHyI1T5y3KaOc6b
         8BlfkjV59e4DBpI2XGtviAxV/qOzq99YH1kXIMcLjk1JtzPl8ZC+vEFjS0NBDSa7skOw
         ke2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632522; x=1794237322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uslC4FnJpKGu4fXxxhRPOOfMsIJImwUJFmWZBF9HWbc=;
        b=qBWpkHx/4BmW0jzy26Ffi8+jePNZUcNFS5FvGsJ+em9NwITRsABHIJeW/YMxIB4SoQ
         SCzvp5qPPBZUivwnw8ncmmit9EsjFz2lljtI41X57LxsMJXnQNCwaBPMfEA5h3GPRxPd
         qajKugRAp2gNAgSvMYtq+fTut3JWJBIYpznS4qzk5q21g1BYJCiTjRJSmFb/KFRO3Bwh
         88E+Bc7CeySUwYg5jnEsbLbRiZgPBOcBkYuFtHmcyJxeZtXCt/1ppmC5N9Jliz8sWvoJ
         u1uPL5riiyYoHp4xeqDIPCrkvD2gXZSm3oC8Mrqw+OnwsSR1aYA8QDDYKstmR2pGfLJY
         dRGQ==
X-Forwarded-Encrypted: i=1; AKwUvByNywDNvcUjR30VHinfJ/IIP3ptSfpcIwNrCCh2NbjNRdjSHNzrRK177NUMdGpWCFGaHwMsYqXen6GVuxs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuYVfQK4vvrPmfkbOa1S3XrA6Hgewmc5XbGVpDdp8dnj/eJXO0
	Gnv5UZbFPl4BGgRY6agmIJTbAh+NmvzZjgxIUE6V0s+zFJSzSNyp/vi3
X-Gm-Gg: AYBFou0iY6ore3pkzj041m1YyaqAIeJQEOqvIX7VZ+7pUU6C0FmLiQ+kNLjDTP5444r
	qc1AMLFzuGHvB5BAv7Bqe/bxwQvKaexpqwuj6wy+drAJ3K5ZcwIt0e7U+IjporNQX/hEfVUyjRI
	hhP8UG897rG/9su9mqjWhnTukIZ3/h7fm3oNmiaVNh0jq8eI8VszMKFNHutSdgMw3JuDjSQHkyq
	9GAxhtYnjHtdSoE3Iq/Kjle1dts2uniDjBVTDI9YBDz0KtmOzOksgVkQbdxmtfxU/mSQoJiaMVZ
	etXkSGKGK7eViqV6baZpoTzpiiA6Dn90wIIHvYJoVNAQnGN7UQni8P4pQDBUHarg4V/dglFIoqX
	757jg7v/2mFV0G/7DHoDrYxvIg0MY+7TZlZpID5D1Ot0VLwRhg7WvYpI7pUchsACD1OVNrOfpmN
	pHY3DT379TOfINWFaAL5JweRKmyFnmhTEp8GtliSKCeMjO+OZmBZbsP1kBtuc6pcFjncJnlyEBj
	2Hasvoya5QL1JJX24u+9Hy6D9IN8sC0lAgxWc4IoBF8NHjRS6Dtt/C3wIyTlz1vGuOiWMARWANr
	doeUPHHJ5yFdhrXammpnahA/ezeQeuULfpOaywtYYtpG9L/qsmyAyxlpW5VyHTiQaJT5OHJQn4c
	=
X-Received: by 2002:a05:600c:4e14:b0:4a5:a5ca:de1d with SMTP id 5b1f17b1804b1-4ac187a80bfmr242034965e9.30.1793632521391;
        Mon, 02 Nov 2026 07:15:21 -0800 (PST)
Received: from andreayoga.wind3.hub ([31.189.68.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723bfsm19309800f8f.15.2026.11.02.07.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:15:20 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/deadline: Fix spurious -EPERM for migration-disabled tasks
Date: Mon,  2 Nov 2026 16:14:56 +0100
Message-ID: <20261102151457.364631-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <v5c3zc2sy66bsummtsvw6ciri65kc5tphm6xs752ifh5eujn6k@qflvq77fph5d>
References: <20261102135420.244745-1-parri.andrea@gmail.com> <v5c3zc2sy66bsummtsvw6ciri65kc5tphm6xs752ifh5eujn6k@qflvq77fph5d>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 02, 2026 at 09:45:30AM -0500, Aaron Tomlin wrote:

[...]

> Do you mind if I include your patch in my series [1]?

Thanks for the offer, but I'd rather keep this one standalone: it's a
stable fix, and it shouldn't have to wait for the debugfs series.  If it
goes in first, your 1/6 just needs to keep &p->cpus_mask on that line:

	if (!cpumask_subset(rd->span, &p->cpus_mask) ||
	    rd->dl_bw.bw == 0) {

If the maintainers would rather have it in your series, I'm fine with
that, as the first patch and with its authorship and its Fixes and
stable tags unchanged.

> Also, please detail the LLM used as per Documentation/process/coding-assistants.rst:
>
>     Assisted-by: LLM [TOOL1] [TOOL2]

That tag is gone as of v7.4-rc1, which this patch is based on: commit
1e035297ffda ("docs: remove Assisted-by references") dropped it from
coding-assistants.rst and checkpatch.  tip/sched/core is still on an
older base, where the docs have it.

Per Documentation/process/generated-content.rst, the tool was Claude
Code with Claude Opus 5.5.  It helped find the bug and write the patch,
its changelog and its test, and I reviewed the result.

Thanks,
  Andrea
