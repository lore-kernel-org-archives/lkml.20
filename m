Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48972448B9D
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791361866; cv=none; b=euxLaLisMwrP7d7bfzyGYwzZRgBxMk9TF93s4juMHgPqAEOjN6tvdpS8uzcacINDPmRXl1P2fMXve+LwQxpdeJrp5zXE5nf9WmK0FxIUoTcjO7i6spXtP/uuJoMmXhxsc+VFD8vngtjXm8zC/0Kvnxl5znB8czNHw4k9vTZKOjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791361866; c=relaxed/simple;
	bh=9pfrJQvbXPTXAs7usrGS/ac0n1oyVbNYxeq49UVm6fY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMfdOZjOs/CHYgpQFJ+8yOGHdDUAsG8O1LF+RXacx1mZSswdWHsp2yRs1pr3qcyywjDNOpHrcbbJ/f/EGrCT+VOQPto0/kiFFMVHsiL9FjfZuqdoGFqM+O+bgRZZNmmNB4QzJcu1kbO2PbjhsqR+x2B+wkz40X6AXZRP1gUqPj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H90rS2lD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H90rS2lD"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so36102985e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791361862; x=1791966662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z1JaVbIvVyJ1UmpioILy1Ttyxf2JZ8HMV5yk2EbJ/oI=;
        b=H90rS2lDz93Zrh390HldScEfGzTf16enLdqivL11kq/PxQ6o0x2eeJIiRCW5m7FAyM
         /nkhkOop4w3HQL2cw557AfPW6dgKAnvnBaXS6ODX90PiomD4mKcpSPJTyY+XmIsBJQHo
         7XIOjRVlmhRtPNklWNqjqMDZAvcYuWAnV6lWZ+QlgppWD0YCNDp8OuctFaAV4dhPWWaO
         Q3e42346PIMAB0Y8W2lsqcE0B2XL96yyOHZSqi6NevCBiebGBmJ7HnLYXD54X9TcuOBo
         DF4tEZZP3wG1Mx4HhzSdHDFYoso8z2/unslWpIpZQlU+hFk9RIp6KDw4pP6USmWCUXG5
         Xx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361862; x=1791966662;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1JaVbIvVyJ1UmpioILy1Ttyxf2JZ8HMV5yk2EbJ/oI=;
        b=t2klI82hn2rZujUZhxvKmpBZcYP3AsvHHu3Qggm28Vvvl4N28cNV83kn2NqE8MkhJI
         JoYuJt7nKFX0dD451UU64a3tbVgcxuZdyGZjAxcz25KhvIsQVinlekDuEyNzTAoNKx+/
         qVN6mAn/EE095F+zb2hbcgdTxOw/DXyQf1N7oVmRC37EfRVF7D2zDrIDBE3kem0tn5mF
         BSMIjXkpJdJFRYMJD9NW9lgqfW6C5UH/vIGGFNJNk0i85Z+f+weRRLFbbHQjGccbv1XU
         XIGo3KU1sbKfblP1mJwapkxJka/LKyuSvFQrjhjd5JnR2VK1/qaJnLgEqc5Ht8BoQErV
         MK7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzE1vHPsvxZcupf/XXv7LA0tD7zjGHse3+jxQh4Dk4e7QnfvDHUNreZfKewM7c5TfwOAa8rJaL/Frz+Y6g=@vger.kernel.org
X-Gm-Message-State: AFuF++ksUMpBeUDLzTr5An7seclLqUE0fkTMgDZGPVTO8MjLZs3NSZ9k
	+a5nhN426MXH3xREC5RNM0Wq5c426JlBFKx9d5vptTfYVStX1iNPOLHF
X-Gm-Gg: AYBFou14DJunnqD8aFBQn7fY0aJO7MWF/Rmh+z0W70TxHc8PHUJ1BOxegBpCULgvpkc
	pPEkDDqUaXGeD0DkputhMIxewujlxm6jrh5K8gytXiqsaDx8LRzyh662l4y2J8dm21PLxaUGkvu
	6pwk6EfOgPhkOx7Q7+efyC5NwsODkq0ktKz7UO9XnQjn4VZ1zUOA1L0ZmCT4B8FRpuixxLo7hEk
	892giWQIPJij+pINx1duouBWBYElVAJ2vTn/c+klcs4uh6F+2RAMSMNuJK23JWy2y7fJWRiHbAm
	Qa0b3Z2Jix1X4PC6WeNfuq9LLC8mD30wIvzjhmC5NuDMHzA2WDBnzk6rV+mt7ttuzLszqdop+wS
	Y6sfL87gM3HRlPUOibNCMqcURI9r661Yf2u15wnmbLb+CeH62aLDAuocXUX6RrP8T/KNE9V5R66
	8Ri4jKxgh7uXewgzitcH2B0nKVyXiOFF8h0jw2WFVMW+7VVOMVyNZN5Mq5zKEYbmPPoxGCLgufi
	2kRVw==
X-Received: by 2002:a05:600c:3f14:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4a1802eab45mr23342815e9.8.1791361861821;
        Wed, 07 Oct 2026 01:31:01 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f653d7csm49071365e9.14.2026.10.07.01.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:31:00 -0700 (PDT)
From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
X-Google-Original-From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Wed, 7 Oct 2026 10:31:00 +0200
To: Namhyung Kim <namhyung@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: Re: [PATCH 0/6 v1] perf test attr: Fix the re-enabled test
Message-ID: <asYDREqTrh9ZDUhm@localhost>
References: <20261006161309.3078488-1-acme@kernel.org>
 <asWLmvF-3YtoKJ7j@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asWLmvF-3YtoKJ7j@google.com>

On Tue, Oct 06, 2026 at 05:00:26PM -0700, Namhyung Kim wrote:
> On Tue, Oct 06, 2026 at 06:13:03PM +0200, Arnaldo Carvalho de Melo wrote:
> > From: Arnaldo Carvalho de Melo <acme@redhat.com>
 > The test passes with 'perf test -vv attribute' on x86_64.  The AMD
> > encodings come from the amd_pmu_event_map tables in
> > arch/x86/events/amd/core.c.
> 
> On my machine, the current tmp.perf-tools-next which contains these
> changes fails like this.
> 
>   $ tools/perf/perf test -v 82
>   ---- start ----
>   test child forked, pid 931585
>   /home/namhyung/project/linux/tools/perf/tests/shell/attr.sh: line 20: python: command not found
>   ---- end(-1) ----
>    82: Perf attribute expectations test                                                 : FAILED!
>   
>   === Test Summary ===
>   Passed main tests : 0
>   Passed subtests   : 0
>   Skipped tests     : 0
>   Failed tests      : 1
>   List of failed tests:
>      82: Perf attribute expectations test
> 
> The below patch fixes the problem.

still without your patch:

root@number:~# perf test attribute
 82: Perf attribute expectations t: Ok

 === Test Summary ===
 Passed main tests : 1
 Passed subtests   : 0
 Skipped tests     : 0
 Failed tests      : 0
 root@number:~# grep "model name" -m1 /proc/cpuinfo
 model name      : AMD Ryzen 9 9950X3D 16-Core Processor
 root@number:~# uname -a
 Linux number 7.2.7-200.fc44.x86_64 #1 SMP PREEMPT_DYNAMIC Mon Sep 21
 18:25:57 UTC 2026 x86_64 GNU/Linux
 root@number:~#

 I reproduced the build failure in an ARM64 Debian Trixie machine,
 applying your patch to try again.

 - Arnaldo
