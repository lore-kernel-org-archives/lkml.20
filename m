Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506405;
	b=1728G04ModVUGqVpKqVW3Fq9n/G+kUHMI1T4aHGisQCeyc6ukedwZfoh4/KWYexdhd0I
	 aquPdCaBd9OElcDEn7o2p25JfL2NgBKVF/Wx6vN0Xcg9bKYb8C1mCrWVZY+7EtVa8c5Nv
	 Ce4NAwDHZbJuAkO3NcEF1hIP2JUpqNy6WpReOzeeCmQ6l6dKBHPEi62H4cDXsdLf5T2ah
	 ZdnYxp+qMSp+mumwbvuvaHsM4prTz8WteDDNuWaD74GROPjm42ECDJkmVDHMnoTjbsLon
	 MSA6i4Ah3NMbBYZURTlUbFAb0Qnc4UicWXuylwEbBYhXjPwG/wx2E2Z5NKWftmtIgZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506405;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=9VZNqnxOEQTj++mPRtHjJD1jjjPwkguBzx/LIqemhIs=;
	b=Da/vIynZZnZTg0giDHPbF6XMPJ35YrxBUZfkNku6XuTc5YgxZzdeXdBust0MSRFlzLDR
	 /r53w+koR+UkyKvBWFTs8C2sX/3DSU/rZvh7YRDtyHxKqCvTNpzBYQ9u+Z8Uh/7GcuZtU
	 nB09MmvILAz7q9ryNAhaFQ7Sgurlpb0qQ6wWqGIFUXPdKE3pHXCDEBM93KTXzd2KJmwyB
	 hh/2Q1fjkermf6+CNgfAhxxdYvc/6mxunQc+cDXgot4V08M5+rypwBZ/s5/4QaSvPI0lU
	 EY5YGJZKKYaxaBsLfUVo8C/oCMMffP+MXsHNr059XhqtOamRRlIjlqVcEAjbe5six1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=OM13LXHE;
	arc=none smtp.remote-ip=115.124.30.99
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE165606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE165606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=OM13LXHE
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792506395; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=9VZNqnxOEQTj++mPRtHjJD1jjjPwkguBzx/LIqemhIs=;
	b=OM13LXHEmZi+hQxjbiqoXCPE8c9twId8TWdoFFS2dXJ4SGz7lDmTkFy4GxQAOlFURsRrX29O1/Ff9va0XVIFEQsCIIBlI6VL2fnN7dvUpG8cKRLvVRvLwIjhdvlyEhymMz6yA7+QjEkSvwedWjBw5QN04vNckSIvizGLNjYMQ98=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R331e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0XDDahPA_1792506390;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XDDahPA_1792506390 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 20 Oct 2026 22:26:34 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: sudeep.holla@kernel.org
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	atishp@rivosinc.com,
	conor.dooley@microchip.com,
	conor@kernel.org,
	guoren@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org
Subject: Re: [PATCH] riscv: Populate boot CPU topology on UP kernels
Date: Tue, 20 Oct 2026 22:26:26 +0800
Message-ID: <20261020142630.1680-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020-frisky-jovial-echidna-2d003c@sudeepholla>
References: <20261012131034.1026-1-cp0613@linux.alibaba.com> <20261020-unsent-commuting-91739a882031@spud> <20261020-frisky-jovial-echidna-2d003c@sudeepholla>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Oct 20, 2026 at 01:24:00PM +0100, Sudeep Holla wrote:
> Commit 4b3dc9679cf7 ("arm64: force CONFIG_SMP=y and remove redundant #ifdefs")
> removed UP support and made SMP default enabled.

Thanks. RISC-V still allows UP: CONFIG_SMP is a plain bool with no
default, yet arch/riscv/Kconfig selects GENERIC_ARCH_TOPOLOGY
unconditionally while the only callers of init_cpu_topology() and
store_cpu_topology() sit in smpboot.c, which is built only for
CONFIG_SMP. That mismatch is what this patch closes.

Gating that select on SMP instead does not work. UP would then fall back
to the cpumask_of(cpu) defaults in include/linux/topology.h and report
the same sysfs, but vmlinux no longer links: arch_freq_scale,
capacity_freq_ref, topology_scale_freq_tick and topology_set_freq_scale
all become undefined references.

arch/riscv/include/asm/topology.h binds the arch_scale_freq_* and
arch_set_freq_scale hooks to symbols that only drivers/base/arch_topology.c
provides, and those defines suppress the generic fallbacks in
kernel/sched/sched.h and include/linux/sched/topology.h. Making the
gating work needs extra conditionals at several Kconfig and Makefile
gates, and gives up freq and capacity invariance on UP, which is a much
larger change than the twelve lines here.

Conor, and RISC-V maintainers: would you rather force CONFIG_SMP=y on
RISC-V as well and drop UP altogether, or keep UP buildable and take
this fix? I would keep the current approach unless you prefer the
former.

Best regards,
Pei
