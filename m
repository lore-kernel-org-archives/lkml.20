Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264137;
	b=wKw+UoMo0zgANRT8r75MMgx7JVWJJnaEZi6/rYAbzg4m2OP82gsHxhYfhMbgEhmgg2Rl
	 wHN0M1+yx5l8nLJBZb5nyDXaLs7w5khnWdYcsvDwBZY8IuN6Pxw8CUqDVLrXwVw9QK7cJ
	 xnAkenh29lnJGnDWlpOeJ2muXufiTWF5kFFgFB0tw0WCkeac7loA2boqJYCCyCpUymMOT
	 GE882Hzq+VwKarJulCbhGmhFCkQOF0/QNApbbZPeWkUJwC95vfDpKmPY59Ml8U6W+RTSE
	 aIpUNbKkBY8HfP37oySfnzI6awRE+HMudq0bbrQZLEBH1sCbfKrrpiTbbk0xPbU3k2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SJ+Qs1F9becLbrkeskA6I5DrzSAtEWDWOgIQNFqJtR0=;
	b=Lof/c/mjpEwPrLYkWxYrKaJ1uwNFZHTW1tWPaJM6uWVOhuLn0txywCoxf1gWAKIJz6tH
	 drAcxbcJx46+Qc7eqSzM2rOcFo0gdx8NGoiKGzlH18OUVZWibrOQtz8eUnE6o5jLwjx/e
	 jJUk6q6VjHtEanwUBwfnEEt9UOACeLvHxZHZWh0WDbyr/FwKnYaFN8ipV+I0oaM/9tkfj
	 2Qs3HzrlWcaB2lIyWXThSOebf0h2O4IOIiiXwIa1UWzpT9ATu2mK/iFF9XPqz9j6bmCUa
	 0rp00wmS3ofBvmJoFcw2hmApsCk2wJYG/jE2mfGEknMp33GW9VAgX1QxzBgTXz/IVDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CUAbDu7z;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688AD606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 688AD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CUAbDu7z
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-19305bcb72cso1755983c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793264136; x=1793868936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJ+Qs1F9becLbrkeskA6I5DrzSAtEWDWOgIQNFqJtR0=;
        b=CUAbDu7zd9pgk67G2dFORW/sUa0itrLkmn+tPQHGP0AedhjL6GmoE32N1UH2VbTLD9
         hJL0iuCK5pHXatLlwrnh8vfg1uTY5KtQizihd9A6VxVWYX7tok0rMwpqO1vPG1IE3vRB
         MhRiT0gYAch/iDTAsJ0Vav6poA33BIiMP06rPkKCVv+cKOLDxtoPe4yAC3waKRCVl4s+
         Qlx6t42FALDj/jZEpN7d9JBKx2BYJ/eZtQ+R5ReDFZ1+yBjrswhMRvc6FDh2V7ufBUce
         8aAvYmvvoMsJAEIVGPHGFchBW1Ebml4EQuRPVGKGBVTzFM/83PjtspBzTaxyhvcvoXfp
         gSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264136; x=1793868936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SJ+Qs1F9becLbrkeskA6I5DrzSAtEWDWOgIQNFqJtR0=;
        b=yt3lTJcZHyK96CcHOZC+3Jw8RdoRrqxVnXmR24jdHlPoGyvAsqTqzO6YirNn5yZU4x
         6vgFX7lh4RC5v7J7Y5qs2hWhdPXOgy1Yuxk4PeZj984f8nmwgFGBRNx0/kcwJtApWgfo
         SBbrSLaS4oLUeQkqi86NwezyLWR7JufRcwSWfPq+rFuk85Tpt8VWDWehVJPjKjMNcuxQ
         pfyziigawQpDLOJ9maW/We0HOVLmO6LsoGZsimkPkXlQ6PpWdkeWGh9nsj4pttffdsx5
         fkfCCiIpDxG3tgwSQTMN1mwBx9IRERyjE/33hr8+2cBXx85oIiI/OVr/ALvfMqzccoZV
         RwVA==
X-Forwarded-Encrypted: i=1; AKwUvBykS6D2cRKwbjRw9fmxS+ohljjiYzBuUpigKsX1wJjXiO+Q69K21yJtAFQXvCCRHOvvYfGBsGtyngg4TaQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsJ0Wfltxub1dXo96sB2fxSL69+K68y+lB1A+ROkWRccxoAmWH
	bnSCdARAtBinvr/JPI3nqCdVZLWrejEx8qjW5Pf57bjmV2TfXPwlCfdq
X-Gm-Gg: AYBFou28lgCKffibmIU2cfWGx21GE8u9JW3Qp0yhQWUk757y6/1cW2TgD6+rzpsih7w
	WTq0XOcQ2b41SvjITwePmvqKdHa2beYC3sPXYbVlT9nhJJ5CcXT1RQcgqlBNZB9PQqdyJyVlAtE
	TOOE0Dro//6UOrfOFgbHRPYiL0aUR6m7cXBpwwqx9kayNMVt5ib8+8tG5vqrzYcH3ydZl4EWi4A
	fy1cW6eIff6x8z8Bfnde5hphI+PJU3GdTM4Bgrx9H0RncEnUBO1C5QfAORwdieAXPy7IPbuDy7o
	QprHd0WUz54m3QGf3nzfJy6OzMhgatHraYltBBPwgzgMLo804QsRsCj56JmxLWsmi/zBA900g2V
	UfXvBFkjHb8Uz1XUg4jmv7HO0D5Di92vzFKSG6B4Rkjz2NlpTQuPQGKHa4ihZkJsTuFebMgUQSL
	oYmZ/QN3QmQBgMxjjylGswlqNdwYXPMkBNyFRjpmzYKrj5RZ3g7mdzOITCZ7CExq6cungWslaEV
	16ly97OJU6ApRlUQRYHvNk6Tmm4g6c7VK6fCHISqiBlv0hTXxUd8DHqxigu7r9LFwUqDKcGyhDZ
	J4QWUSNlCRAt04aIJXYk3ibqccqFVOyhCu4RSGHXQ1Xn8w==
X-Received: by 2002:a05:7022:423:b0:137:5b9d:cf87 with SMTP id a92af1059eb24-1a6c2e5b801mr8516804c88.0.1793264136250;
        Thu, 29 Oct 2026 01:55:36 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a76037e2b5sm19091828c88.21.2026.10.29.01.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:55:35 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: yu.c.chen@intel.com
Cc: peterz@infradead.org,
	mingo@redhat.com,
	tim.c.chen@linux.intel.com,
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
Date: Thu, 29 Oct 2026 16:55:29 +0800
Message-ID: <20261029085530.4054159-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <auMBWAGx04w5h80o@chenyu-dev>
References: <auMBWAGx04w5h80o@chenyu-dev>
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

Hi Chenyu,

On Thu, Oct 29, 2026 at 04:18:32PM +0800, Chen Yu wrote:
> Moving the capacity check earlier seems to completely ignore the
> task's LLC preference. It seems to be a trade-off between choosing
> CPU capacity and cache re-population on a remote LLC, and cross-LLC
> access latency due to cross-LLC migration. I don't know which one has
> more impact, it looks to be workload-specific. May I know which
> benchmark/platform you used to find this issue? I'd like to launch
> hackbench/tbench/schbenh/netperf(or yours) to evaluate the impact.

No benchmark, I found it reading the code and reproduced it in QEMU
with -smp 4,sockets=2,cores=2 and IRQ_TIME_ACCOUNTING.  A module spends
600us of every 1ms in an hrtimer handler on CPU0, CPU1 runs a pinned
busy loop, and the test process has one busy thread and one thread that
only sleeps (cache aware scheduling skips single-threaded processes).
It starts pinned to CPU0 and is then allowed on all CPUs.  I can send
the module and the program.

The LLC preference is only overridden when the capacity check fires,
which is the same condition as your reduced_cap_alb().

> May I know if the issue is because of the
> if (env->src_rq->nr_running <= 1)
> 	return true
> in alb_break_llc()?

Yes.

> If yes, to mitigate the possible impact, do you think tuning the
> alb_break_llc() would be safer?

I tried your two patches on the same setup.  The task still stays on
CPU0 for the whole 20 seconds, at about 1.8e7 iterations/s against
4.6e7 with cache aware scheduling disabled.  Without the early return,
alb_break_llc() falls through to can_migrate_llc(), which still
forbids moving the task off its preferred LLC here.

Thanks,
Zhan Xusheng
