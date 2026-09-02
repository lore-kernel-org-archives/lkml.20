Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B7E37CD28
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 05:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788327180; cv=none; b=Dy0h9bB/6gH/pQtE5U87mZsb8HKmzbBnrD1E8p56LMMRAtZDFnk0/y3+FsDQTHfq1fcRoCkfURHKIfbSHEPrtRiIuC8Edhhoea3QgJs6z6aep9RE1TxKLkAAk8otcVprzGMq0Clvx6lsg4feJ6TnNMcqWhFH5OdIeaB0Niu/KBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788327180; c=relaxed/simple;
	bh=eK2/nD0cipE7ctdExFcuzqKayHljOgBQrh/6KU+N2P8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PxCntQXdI+gn0ESWkhTR+Urp1UYtm9ZLmoYX+ZjR9n2s0FA/8YbdWXJUa3c5UFKvpcyRQNeZK0u7/A8mJRByg4eAxlBEyMIsum0ZQ2uDrb5AZCTbjhd9ZnQulZRt/iOVDYXBZlh6cOmNLUthIIwnxC+jLVNbUpzT0KSJ0GwEVvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qOtELc/r; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qOtELc/r"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d71ae3455aso9956245ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 22:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788327178; x=1788931978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ljdS7b68I6CSMzxXA6J/mAbLSjxMVryYz7zy2OGKE8=;
        b=qOtELc/ryddoFYFU9d2YIZpDg132Ge3km1FyDMh52YaO974mvqe82kwWCQu86ePzBa
         9XoLYHbqpI4LmyZObUvFXZuYyJNnO+lU+HRDcmFcV6kckG+uaLPNrAcphbax7WATHI6Q
         BIP6ui6QfvMNGcnIZSvbA2g1stzccN/uPoOAuTXNQziR/CkGWdL4aoSLXnlKegQzioYz
         Ddiol6jshIm+Uy8vet2NhK8dBk72mqYl3bSldzaGLNHs7Px7SKaXsLQG3e0jlzO9Xiji
         cZTushoOWeMiztVRWhEPBM3jis2xu1OCy4MWF9AFgZ3T1SJnXuVswpVZhB8Yuf3unyrC
         WrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788327178; x=1788931978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ljdS7b68I6CSMzxXA6J/mAbLSjxMVryYz7zy2OGKE8=;
        b=KQwxwhMik/hjefC0MQQzh7PUzcWvOrfa8Xv5QlQRKHlHLzyYLhiy9wXmppYXViriwT
         H01UZ4AEjHiFA7dlshB1Tbtdy62ylWFrLridta2JsxL46xzZ0TRUrbo7NCrBBYwl3Rvx
         NGuFQzxAw7Q6rgkPfGRM6J75AKzR+bqun3EMI8+452giOH3lnsViV0/hI/08XBod0eCd
         oDvUGPzJpwUB7ENKiGBE+WaDW2JV49DjWiGcu1RwBdaHRAguMozflEP3s77ZGJvAOogE
         e0p0L6s0zp3Nst4AD7WT9eC1VQWtMeau2YFaYn0L6pSsHOeRe9hbYVi6e35AK896BNZS
         7FOg==
X-Forwarded-Encrypted: i=1; AHgh+RpenOHr5OEvyqFdtGa5rjHuodYIPdx7fpAZiS3C4yVJ4ce/4R24/YJkmpPQ7Hq/TK/vwsNRb1UjUY5I+QA=@vger.kernel.org
X-Gm-Message-State: AFuF++kl7/zAp47oKAlTSALEWy6dwjx3c1zubUHfpj9yEMtSIfmkcUSn
	l3ycigQVnAaqEns4w4/2ntgPwCOtxUxjWzXYDFplI7thZeHMMeMHi06H
X-Gm-Gg: AR+sD103ZtcyevtkqBMec19J8Q5BWou3Hkx1uUXcfoQw2b0nDZNy0RdLFk9jnlp8BcJ
	w3da/Y94C8tFiRVTeUgvYl1dKjA1uCHYSV/F3s/YoK8fxmtb95w5Mdk/5xDqkzqkn8k0jLwKuh/
	cu6C/bdzf/cvt3gg5iEmF9TjbyhrLd8FM4Pqo9DY8B1qXHPcGKholM7w1EeGxxjeDMEXK04k0T2
	xP8YnI+QPO9TfiGb8yTohz0qkie0G/7yMHvMM3zeM919aPrmtZWXE2uWuHPd6VVakfRyp4WP7GK
	miBWS/bEOMgxCaJaZ3yd+e0wfZCAa0YxCDVEHoodEukiETk80FjZiMq5Phhjm4IP6mWzp68RlYg
	ITRh+1s4EX0j9L/v/OGU9J1+Z00+OCcywY4fsId/OGSRZoRwnBhLlpewTqrpkRvkvy5FtCLPU1T
	oUE4JaELUSua7WeW1Cu79eSsCvc46jKQniM5dp60F7SyLR8z6a7MlKDv4l1+gZoLgZooqd5cdbR
	z0BAw+hLTReuKJSU6tURVA9ITNpP3FhQtIr5vAYFjHTa4soU2q3jF4=
X-Received: by 2002:a17:903:b06:b0:2d9:383a:30f1 with SMTP id d9443c01a7336-2daec5dfde6mr38882195ad.4.1788327178433;
        Tue, 01 Sep 2026 22:32:58 -0700 (PDT)
Received: from lima-xfs.. (174-126-236-85.cpe.sparklight.net. [174.126.236.85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd4a999asm7113905ad.60.2026.09.01.22.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:32:58 -0700 (PDT)
From: Eric Peterson <linuxinstalled@gmail.com>
To: Dave Chinner <dgc@kernel.org>
Cc: Carlos Maiolino <cem@kernel.org>,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	eric.peterson@hpe.com,
	Eric Peterson <linuxinstalled@gmail.com>
Subject: Re: [PATCH] xfs: add per-mount read/write I/O completion counters
Date: Tue,  1 Sep 2026 23:32:30 -0600
Message-Id: <20260902053230.4073608-1-linuxinstalled@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <apSgHPl4er6Jy9xi@dread>
References: <20260828033429.4070267-1-linuxinstalled@gmail.com> <apSgHPl4er6Jy9xi@dread>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Aug 31, 2026 at 09:38 UTC, Dave Chinner wrote:
> Hence I'm asking how this new metric is supposed to be used and
> correlated to observed/measured application behaviour. i.e. what
> insight does it give you into application performance that can only
> be derived from this point in time snapshot?

My apologies - it wasn't my intention to come across as patronizing.
I was unsure what background was or wasn't common ground, so I erred on
the side of more detail.

You're right about the sampling limitation: a slowly-sampled
point-in-time queue depth value cannot characterize bursty,
sub-interval concurrency. If the goal is to resolve what happens inside
a 10ms burst, this is the wrong tool - per-op tooling (tracepoints,
histograms) is the right one, and this is not meant to replace it.

The important part is that this is a property of the sampling rate, not
of the counters. Nyquist-Shannon says that to observe a phenomenon at
timescale T you have to sample at >= 2/T; if you sample slower than the
behavior you care about, it will be missed. This is true of any sampled
counter, including the existing submission counter - in your 10Hz pmval
example, xfs.read has exactly the same property. The sampling rate is a
policy choice for the user to match to what they're trying to observe.

Answering your question, it lets userspace characterize filesystem
queue depth over time. The places where this is useful are the ones
where the desired signal persists across multiple sample periods,
leading to a representative measurement:

 - Sustained/steady-state load.
   Database, NFS server, VM image store, etc. Outstanding I/O is stable
   across many sample periods. Most capacity and health monitoring
   lives here.

 - Long-horizon trends.
   Can show if queue depth is creeping up over hours or days as load
   grows or cache becomes insufficient. Leaving per-op tracing running
   for this kind of timescale is the wrong tool for the job; persistent,
   low-cost sampling is the better choice.

 - Sustained-backlog alerting.
   Consistent elevated depth can indicate saturation, a stuck consumer,
   or cache thrash. Filtering out small transients avoids adding noise.

 - Coarse steady-state latency.
   When load is steady, sustained depth over sustained completion rate
   gives an average latency - enough precision to tell 0.5ms from 5ms,
   but not tail latency. Histograms would be the correct tool if higher
   resolution is required.

For higher precision you'd want a time-weighted queue depth, but that
requires two clock reads on every I/O in the hot path, and the cost
grows with I/O load. This trade-off is the core motivation: the counter
is a near-free, always-on aggregate for the common steady-state and
trend cases. It does not replace per-op tooling where higher precision
is required.

-Eric
