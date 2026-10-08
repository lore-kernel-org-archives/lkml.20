Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952AD3A5E84
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791479341; cv=none; b=GjCkfAwNeAk6Mig8j9rLRKcf6iY11G1PpHv66PVQu8tIEaKRRkJDSGYBMvNuXQ+vRVoLr+lJ9bfSWCl199qnGcvHhltfsL39tYLg23H3AKfj4wIbnPTWcqkV2eEwbTZtJ6b8Mu/yw1q/VQHsOeAeECHt31WwtSSshO/YteTge1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791479341; c=relaxed/simple;
	bh=uzc5djF85E//odOYdOjPt2GittKhdyE9SqtN99W2ky4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ohhHvUxUk/g2VCb9HuxD8q1YPUkbz82CnH9vhhEz2rFFHpYrj3Wdry9QDcamnK6akwt3Eg70K7KrInjRtudQJyRH7rfiBgRElnHLhl8n7PgOTjTZ1K+bhQ7BdZF11/Gg3Y/kNd0y3ipiVRqgbAk+kbfRRpcAP7TjJL4N1Sh/REY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqFU6Tj4; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqFU6Tj4"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso11553055e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791479337; x=1792084137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZzFC0Gnqf5rubheTFydiqJ9yK61ie2+Ek+jk+ivkUU=;
        b=OqFU6Tj4844RAtOXRiQZFhIuhvFiFgK+WcpGkkPJyrbx8Cgw84W0UgzxhguYVnxfIg
         Y9pAuO3Vbf3B4rdD40W5eXr2Btytke94hePBtgLAOc1pg48/HAnYZljSGaptcQXhz2L+
         c5k3lWu3e4JSJrlCjmvaEGM6Pdzp5QXOHuXu4JRnfz3c/N2TgFATwup5SZ1xhULaZAmJ
         3awzf0lH3rjHYYnxShE6NXamrzWb0amqE5zCxhmep1qxRb+mdgILKwH7X9RyaPgjWN94
         /tPS3VEJQwtKr6NvrSkkmnW8l9DojPDsYoRjbFkVgtGx9uoQCQ/xpepXD/av0IZ4LEq0
         x5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791479337; x=1792084137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZzFC0Gnqf5rubheTFydiqJ9yK61ie2+Ek+jk+ivkUU=;
        b=SnWihb/RPPtKjLJ809GImPWfFvU0NGkAIdSR7bz88XgSbItbnF3fGWEL18J5jInmZn
         uW9DKkiHqTuPO9fEFjmXQt6HZaK5d23No3tVO9whtzkqqum6H8Grsh6VPjWvImq6OhST
         Xze4K6/g6/V8bIYUZ24Wh6AN8hqjobgj1z6U5nuY80GJaPtnlgelELfzNJBryaIfY3eq
         Sn0S4y0PMEa4ve+WyzkwKRE6N6Ms/2PHmNy4iSeFgvS9wLgUTUAIa4NiEMkaiPWpbEm3
         YfJZQeCTxeQHMKM7b9FiC2hVwtZGF4OX7c7l0hfU3Eh0fr8KJ5Fcs6hZBvGYW3M/DnDN
         GvEw==
X-Forwarded-Encrypted: i=1; AKwUvBxohIeR3vbkafV4G9g/xnOlO30TX4vbWGsSu1w0oT1kbvT76zQSnIV+xJ0eempxqT72fa1iQpqn2dB0BLU=@vger.kernel.org
X-Gm-Message-State: AFuF++lPqnRtyjJHlCQSgsiUQjAK2hwbAxNvmso/+VF7roT3d7hUgJfQ
	+yvOiY67PVMmwaNPgRIhTyzp5aphZKFKhtzNpJFLUL8E8p2nS71v9M4W
X-Gm-Gg: AYBFou1o9CikEc6k4oA7DkZPtUH91M58Bl3uaJZTzF9FcdZhofzB4vnWo+/wRCqUNfp
	gsjHnf4sTmoBjIM7Ti3XF7JdMOkb43ysgBOpiCQzcMdXcp386c07fEl0e/RwtkViUZgZTgzQTye
	tNh0HpKPU4QXDfhz7KDSpc27NYEIfC/5hfKT+OD0wNw+P1wwUWR0wPNN2MbRj9ty0+rFdtk4cK7
	6lzc/0UMNR9xjQKNNH3/zi22XBsHtS0aSfCha962rvCjg5kScEOvDxg2m44h0Rvqr7SP1tDWDCI
	emKkWcl0mdpG1Be6QljfSP9WuQdKs9m8ONI60NEFumSaB37F/eNkB/ntdQLS7/AG8UqI8d9O4C4
	Tz48vwM3YRreoBBZhSC2L3dW7x4eSKsZlNSXpBFEMFmHU5r7Oip6gypNqnlzgiuEuN1XdgIVw6K
	96CSb93uFN7mSuavX5M4QbrUm3UYXyS+t1bKlSpt0zwmqIbmZpuoOA+rujdIGsYgSH3+0WQ45xF
	bZVzyewMCN0ykuIWH/DKDqTTjqCz1iAqE1ugmVTpO+GZw==
X-Received: by 2002:a05:600c:4755:b0:4a1:8963:b865 with SMTP id 5b1f17b1804b1-4a18963b9aemr17251305e9.1.1791479336435;
        Thu, 08 Oct 2026 10:08:56 -0700 (PDT)
Received: from ubuntu (ip-86-49-251-138.bb.vodafone.cz. [86.49.251.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843cb261sm84563085e9.3.2026.10.08.10.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 10:08:53 -0700 (PDT)
Sender: Alban Crequy <muadda@gmail.com>
From: Alban Crequy <alban.crequy@gmail.com>
X-Google-Original-From: Alban Crequy <albancrequy@microsoft.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Alban Crequy <albancrequy@microsoft.com>,
	gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Peter Jung <admin@ptr1337.dev>
Subject: Re: [PATCH 7.1.y] Revert "tracing: perf: Fix stale head for perf syscall tracing"
Date: Thu,  8 Oct 2026 17:08:31 +0000
Message-ID: <20261008170831.49376-1-albancrequy@microsoft.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817150000.2@kernel.org>
References: <20260816133101.83109-1-admin@ptr1337.dev> <20260817150000.2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sasha, Peter,

Another data point: Ubuntu picked up the same backport in its 7.0 kernel (7.0.0-38-generic), and it breaks Inspektor Gadget and bpftrace in the same way. A BPF program on sys_enter_execve or sys_enter_openat only runs on CPU 0; sys_exit_* and sys_enter_close keep working on all CPUs. Reproducer:

  bpftrace -e 'tracepoint:syscalls:sys_enter_openat /comm == "cat"/ { @[cpu] = count(); }' &
  for c in $(seq 0 7); do taskset -c $c cat /etc/hostname >/dev/null; done

Only @[0] shows up.

I also tested v7.1.13 under QEMU with 4 CPUs, using a small cilium/ebpf test that counts per-CPU hits of a tracepoint program while running 10 syscalls pinned to each CPU:

  v7.1.13:          sys_enter_openat [10 0 0 0], sys_enter_close [10 10 10 10], sys_exit_openat [10 10 10 10]
  v7.1.13 + revert: sys_enter_openat [10 10 10 10], sys_enter_close [10 10 10 10], sys_exit_openat [10 10 10 10]

The revert looks right to me for 7.1.y, and for any other stable branch without 57918341dd19.

Tested-by: Alban Crequy <albancrequy@microsoft.com>

Alban
