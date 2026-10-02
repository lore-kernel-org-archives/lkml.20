Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68C9399018
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790963825; cv=none; b=pdvlUUPBncvo3sBa9zoNeGQUtq99J3RmtD7KsgP7drvbEVjy7xQ170abOebswHQS7/CjZDKnzxEZ1bICpCHwXuhQYDUXVeM6je8Yr7+p9WknDWRP2xGEngWN8nw93y6854hE/R1HDG06y2gQPxxOU9X/o5wB05WBVXrhij4cjfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790963825; c=relaxed/simple;
	bh=39BCaKIS2a4rsGcJLQO0o1OjODWMY9BGj2pmo1ZKneE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tH7QKaYh4zQlHgh6byl7GU77yvjAxIydvdhzZKblE0zb5zx/8iUm2217gPNJhnab9itGApHy5/E4q7guLLH55QtXfvdb11XaPIMH99+LiR1TtfWvIheefJT3uxXnZTWAutk/Wgc+po7Nv44t+yLgHzboNl+fcCQILmZQBXryNWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truenas.com; spf=pass smtp.mailfrom=truenas.com; dkim=pass (2048-bit key) header.d=truenas.com header.i=@truenas.com header.b=NYhsKqZv; arc=none smtp.client-ip=74.125.224.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truenas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=truenas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=truenas.com header.i=@truenas.com header.b="NYhsKqZv"
Received: by mail-yx2-f39.google.com with SMTP id 956f58d0204a3-6755a6109c1so258953d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=truenas.com; s=google; t=1790963820; x=1791568620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xxaI2OMOwwuqBrxKvOI44CslxEdzYP5+0cKedVWBK0M=;
        b=NYhsKqZvx0TufQd4i2gFpuCCbh5ixRqToSIL4dQI/oQ48+kJC5E//QpGtVMviMEH/l
         dRHBBnP24KmMXXhtFfEkHL16JUdCxa/x/sr7iMaVHb0w58xkuXlzMXtGcmFnltPOQppg
         6f0sZdaxjZWFLYA2TF0Es4ov/jZtWBcR1eGCZJInrLPOFZVKEARF/itLqD9pdQ3wuaF4
         AUgYucYbKN6lcLxU/IVujwfGrY7X4MelD12QaRzi4omEWdf6QB471nEu1YecW+EFZi7r
         m9UBiIQlgquh2c8yi1jew3a4H1dsr5OjPOJaPaXCIwx9lRRUoWeD5QwspAmSY8moUMxD
         +uNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790963820; x=1791568620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xxaI2OMOwwuqBrxKvOI44CslxEdzYP5+0cKedVWBK0M=;
        b=IkJf8KtzRLK7EVG921/B2Hc4ICFZsv9f9GKoJYFfQfY+y/exFbLzaZv8XgzCnUJZlf
         QRX62J5jE5Xjsedrg6F97rt6+QpgKL0PirERT9EFoESJ0SRdI3Ok6FYWsjWM2gp8mg+K
         yNnFFtcq/ojYlx0W6LRYBAJvDCl0HQ/jRJPpqrQPekcCnEdcUQltx9oxj0TYbskfVSwi
         uy25o1p1Qhie2yXHi4VYE1FxJ//SOqq7cSUdAy7XtXqg+EzLMH02KqC+lAR6ERyI/4pT
         Cew5oAfbqOkDmleOSd1hAdkV3HlcxnhCzxAX947hsJ74tuHxWTxWVVIBPz5KX9N4+ZQ5
         QXFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzKId5QwvDTqfFeulz01bd1Q+cPOG3O/SzKLzNkFhzyxWI1IYi9A8f44zCNjg/OU4+y69aMbAuCTICIZg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZNHNuXtEaVJb8xt8myh4JGzxR/dz5c2nZPcDW2jU7JG96RJHS
	IvEzUigPJdgnOKBVjopzbSOEyqio+SxVbnnz3yCmZBNM76GZkYMDMZ2Su8KIZlxU/K2yxS8Ls06
	0uFmfqPws
X-Gm-Gg: AYBFou1Yc2WCdD4llMT3URHVBsQrhh5jKi5pty/OqGD3hvBas3hsaESFEQtIqYzKssu
	/DeikEmaRiMr3FUWu1rxctKq9NfChyjfxFVaBExGGpW6th6rYUaQqa8XXC5Tmc3C38bs5B1k9lb
	DQhPTq5dw+7ErMiSHVPldieiyv2d5i7Vnn5PjSi9gqFuwERDApDB+kwN5vPHB6a0rv/J6tRuF5i
	CMSCNiJOd7GlHkVQ3SiwUDsU54N9jQP1LptuUMaODnnKH8Dgo1w6qfCPUIKkPoQHxKi8ldcwVt1
	Mdkmn2KjMqXslwMMD9G6TzW9GdqBDAkc9dnoSa5HYhcQpmAQhXyMTApkDrcbOx4gHLBr0KzEPD9
	gkjtATHQnczh1F+Y3H8hK9tjpyRZEECQNPFhdLQgpHZGwibEsF7W4wMixLnaJsfCugD6FK7QeKh
	fEIPz4lEkh3fSc/aKXLqp7RPHzuGvWOEDQLFff6WZdB9GtZxUm/slpbAYgBc6h2LjzslM1tA==
X-Received: by 2002:a05:690e:4291:10b0:676:8641:27d2 with SMTP id 956f58d0204a3-677ac0944c5mr1330447d50.40.1790963819897;
        Fri, 02 Oct 2026 10:56:59 -0700 (PDT)
Received: from hamza-PC ([124.29.197.38])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677ac63acc0sm1368439d50.20.2026.10.02.10.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:56:59 -0700 (PDT)
From: Ameer Hamza <ameer.hamza@truenas.com>
To: ljs@kernel.org,
	rppt@kernel.org,
	peterz@infradead.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	4ncienth@gmail.com,
	sashal@kernel.org,
	alexander.motin@truenas.com,
	caleb.stjohn@truenas.com,
	ameer.hamza@truenas.com
Subject: [REGRESSION] secretmem: SIGBUS on memfd_secret() pages while perf record runs
Date: Fri,  2 Oct 2026 22:56:51 +0500
Message-ID: <20261002175651.811343-1-ameer.hamza@truenas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Since commit 97d34aa65c29 ("mm/secretmem: properly account locked
pages"), in v7.3-rc2 and the 6.18.52 and 7.2.5 backports, touching a
memfd_secret() page for the first time fails with SIGBUS while the
same user is running perf record, and read() into such a page fails
with EFAULT. This happens for root as well as for an unprivileged
user running its own perf record. It reproduces on v7.3-rc4 and
6.18.52, and the same test passes without the recording or with the
commit reverted.

The commit charges secretmem pages to the per-user user->locked_vm
and checks that counter against RLIMIT_MEMLOCK, with no CAP_IPC_LOCK
exemption because the fd can be passed to other processes. perf has
charged its ring buffers to the same counter since 2009, up to
perf_event_mlock_kb per online CPU, and only what exceeds that
allowance is checked against RLIMIT_MEMLOCK. sysctl/kernel.rst
describes the allowance as not counted against the mlock limit, yet
it sits in the counter that secretmem now enforces. perf record sizes
its buffers to the allowance by default, 516 KiB per CPU, so on 16 or
more CPUs one recording uses up the default 8 MiB limit on its own,
and on fewer CPUs it leaves correspondingly less for secretmem.

Reproducer, as root on a 16 vCPU x86_64 guest with the default
ulimit -l 8192, while "perf record -o /tmp/p.data -- sleep 300" runs
in another shell:

  fd = syscall(SYS_memfd_secret, 0);
  ftruncate(fd, 4096);
  p = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
  read(open("/dev/zero", O_RDONLY), p, 4096);   /* EFAULT */
  p[0] = 1;                                     /* SIGBUS */

The commit closes a real hole, unbounded pinning of unevictable memory
by unprivileged users. The question is whether the perf_event_mlock_kb
allowance is meant to count against the RLIMIT_MEMLOCK budget that
secretmem and the other subsystems accounting to user->locked_vm
enforce, or whether perf should keep it in a counter of its own, which
would leave the hole closed and secretmem usable during a recording.

#regzbot introduced: 97d34aa65c29

Thanks,
Ameer Hamza
