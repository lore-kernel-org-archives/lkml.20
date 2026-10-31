Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793438691;
	b=BRrfvOYbeo8g/Wz4dHIS1aodz+aIToZuEynAPkOQxgJDpwvi79rMRcchttAnhKJic0eS
	 XS0+v3A5QYNxyYF2qWw7VXPW2drPj4o15Shx0bVnBLnyu9OJmFSnGv3K9AkYNCDh2HMNd
	 dTj/v8TZ04JcVW8FWaPx4AMmWt3Z/uGdU8PA8ShFn20r6pSrkuQvjk7NzuWmShYxB+0kk
	 QXg59HIlXICWN9P/hb8/XZqC/hKriAcKiNOcXYr2Ukc9MsHwqQC+r0jDJ34uGpvPXdSLV
	 StpYAlK4MEhINgjqTIo4ZdOeaf1iimO6sMnc1xr0AxGZLb1VIJ57SLdOhHtcBLPYs3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793438691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7mGV0uZGplmUGbGoKvDKONMnhe9hZPv3My8eZFnTQAA=;
	b=4Chb0cE+5hv2PFtGTXGgjb8fXCZYeq6d9uR0Nl3FlxrFQ5RjvrtOscQ43rAa6hroIUXX
	 xAFY1hhpZRUVq84PDMZTiJ+ybvMKUd2ILa5+zF98rb1Kb23HQN7aTz9KP4MJ3q3Pudh0g
	 OOfuvGRqnzSXZF+j8duSxJhb3pneC6CI6WA0LfEPqKx+cUIrF4AGAVNukHnLZVeEsk+AQ
	 j5idsAJZVTvW06mJSlBkVtC6Ajo2Fkdq5bmloDB9Yy7j3PePzfi6bj6gClp7MBqTTChN/
	 oAB53+OHmA/UBZ3dpEfPknUdUamF4V/BgVm1DGX9Isq668XsVDvOsTYOMh7d+raNs4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KlMxHt93;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9F1606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E9F1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KlMxHt93
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-369f33df08eso3021862eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793438690; x=1794043490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7mGV0uZGplmUGbGoKvDKONMnhe9hZPv3My8eZFnTQAA=;
        b=KlMxHt93SQGwhi/oVOX4uvuNJlDcpSEecmtodA9tfKes1O0FjTgBgcopZdTumKCFDZ
         N1ca02GtdIJL7t2v25A7D8SFJTwL0+sVI9dLmbkQdytBVOsyKOKWUEztjtg61vxy5gmx
         lhnPaO/Yz7HjBryLFSts5Kn4/4knogmq67IVd2ePtO8g1Zc3sW+pUxD1vKPsguE9cf+u
         JyceC7P6wrmNoGIpMRbBmbpb37+QzlZULWadwStYGN8eEVzsQ38BE7Qbq3wHyK0ER9v5
         OyPeAdVnjeqM8+D3mx7fjqEZEL0osa45BW5zEJOUGnCuI95CtUcpoNKOMX3hVDR8dh4q
         OPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793438690; x=1794043490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7mGV0uZGplmUGbGoKvDKONMnhe9hZPv3My8eZFnTQAA=;
        b=RIRsNxK+bFlUM28ZjanKtHxqm9NbYEGO4qZLz+xdq4OgdLRgiouLekejAaie2KQrCP
         P51fQ5xY6DwE1mMDdOG01fVl27tuYlA2fPjgJDKV1wahc+IwJemELa8dRmgiFPyvpsh2
         x/7rhhv2Um7srE12yZ/0VPHmIzDL85AH8KAhiUuzaEPLes7Om4+X62NhLdhLwpmbqUiF
         ggWdvSIjQ+p07x0wgijIAK9cVt3A+uoltAPbhTXpjnzvGztuOBut+8p/2y1OePj6ie/o
         IUjQnaOS+aeXyOUgBFZ8b/eQM6J9BtNoj/GqrQf5fWRyFbtQggRkv1s20GCdXIen4f36
         0uBA==
X-Forwarded-Encrypted: i=1; AKwUvBzqXGA5dkDrN42AQNAX6B+u1fCb4hO0ReGkuq8xhFwb2gUdtmbk7Ol8iIJfvtm7PyOYgHzyn6/amM9l8gk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJo3uwIZelFjDMdDxu204QBm9QAONtpuuKxEwJlGetyCZ65uX1g
	UQCkBxi89QIzQT5a3Ce3L8obp8FhddWjPPRkae7J2DFRaBW1/HOA8QqN
X-Gm-Gg: AYBFou3qw9TvBnVEtCT0+ZI4a7s5wSPJdaZSibdAF+S/dqAGqYMXgafYPTsmuHgHHf0
	i2WsQkSpecJa+NXXtAXRzb0LUiHF962jw6INimcsrLrazEsYAW2Ez00F6mgE/op25g7XKpQO7Wc
	vjRHu8C/8YywrDFEotTugNAEvx6t5HnsQeNaUZNzCwF8gO91ygRs6D/9e9MHOfyWLt8qNND5CAP
	xeVOguLqoihNWYMPvwt1rE69gktRJPhrxR07zK/f4iU5o0Pg4/cAacqDqeawIvJXJYYMpinOY6/
	6l7wkykWLwkf06z0/O8qejd+GXL4BwpL4rKu3GO8lCzhtvH08zPvefB1NTaejI8cSgIPukZoU2a
	n2ljgTvwhkyzkI0zVbb5T8NMALtHoxlOFJHG9dAYa+dnlNlgFnXxIV660E6ywSt0XkondfbecOo
	Mf+tPPC7YxJjWumqAOm4srUctXKMzdXo8dwJf2umYvkeg8VXl+rNg71Yvwh3ki6wcG7/s3FxYgQ
	bT/pMuaSDXDxOFVIs754HOQlyRaAHvuivAOciRDXLl5BrTMYbvPHrUOnqJAL4nzyb2+Z0Sk0fqy
	+x9jT4/VwW2jRNkqun64+rbBKlr5th23JtiduMOuq3jzkrM=
X-Received: by 2002:a05:693c:20c3:10b0:36a:12c4:8bd6 with SMTP id 5a478bee46e88-36a423ea9ccmr6954881eec.22.1793438689949;
        Sat, 31 Oct 2026 02:24:49 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a98f65sm14693862eec.28.2026.10.31.02.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 02:24:49 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: tim.c.chen@linux.intel.com,
	peterz@infradead.org,
	mingo@redhat.com
Cc: yu.c.chen@intel.com,
	kayracizmeci@gmail.com,
	kprateek.nayak@amd.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH] sched/cache: Check reduced capacity before alb_break_llc()
Date: Sat, 31 Oct 2026 17:24:43 +0800
Message-ID: <20261031092443.574996-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <93e3e1388b3d4512818e7f1e19003e0feb4890dd.camel@linux.intel.com>
References: <93e3e1388b3d4512818e7f1e19003e0feb4890dd.camel@linux.intel.com>
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

Hi Tim,

On Fri, 2026-10-30 at 16:24 -0700, Tim Chen wrote:
> 1) There could be other idle CPUs in the preferred LLC. It would be
> better for the task to move to one of them, through the idle balance
> on those CPUs (via same reduced capacity check), than to move to a non-preferred LLC now.

Right.  With CPU1 idle and 60% IRQ load on CPU0, mainline moved the
task to CPU1 in all 4 runs.  With the patch it went to CPU2, in the
other LLC, in 2 of 4.

> 2) There could be ping pong migrations.  Cache aware scheduling could 
> move the task back to the CPU, because with only IRQ load on it, that
> CPU is considered idle. I think this would also need to be dealt with.
>
> Could you check nr_migrations in /proc/<pid>/sched, or trace
> sched_migrate_task, over the 20 seconds on your setup
> before and after your patch?  A run with 20% to 40% irq load would also help.

It does ping-pong.  nr_migrations of the busy thread in the 19 s after
its affinity is widened, CPU1 busy, one value per run:

  IRQ load  mainline      patched             iterations/s
  20%       2, 6, 8, 20   8, 11, 12, 13       4.2e7 -> 5.2e7
  40%       0, 2, 2, 10   5, 9, 16, 43        3.1e7 -> 5.1e7
  60%       0, 0, 0, 16   7 to 36 (7 runs),   1.9e7 -> 5.0e7
                          327 (1 run)

At 60% the extra migrations come in bursts of 0->2 and 2->0 round
trips about 4 ms apart.  A kprobe on __active_load_balance_cpu_stop
shows the 2->0 moves run with LBF_ACTIVE_LB_LLC, so they are the cache
aware pull back, and the 0->2 moves are this patch.

So the override needs both of your conditions: no idle CPU in the
preferred LLC with more capacity, and no pull back onto a CPU whose
capacity is reduced.  I'll work on a v2 along those lines.

Thanks,
Zhan Xusheng
