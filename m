Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017715;
	b=3+79yi9vj9TZVG/K/St8U82IAjczP6taC9/LcgLVbW3yiROrpM79EvXm1ED8w+fw80Wr
	 VCD8lRXlMBxQPvm+f6KL8qgeRNwxJ0437bRJq1Eg6mGCfwYeOISjegfRcWq1HuHeh7tFw
	 f4bWCvT2qZybcY47cKaE8VM7hNJNO4fzjjr3rYWZgRcad4VO3wJspc3Jp5sg4BM0vJETw
	 ZCkIgEYDft/p3gy+zL/TCldsk5OOhgGmr4oLu8XI0RLz7gAj5/GM5nP58AmGdm0IQL5b1
	 t5aBwoBvKt3BkEta6NoM/HlDl0OIidSaLfCsKkaO9DstMYbT0rIsAR1K9JCuFnw6dNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dc9ewNRLy/KDUCgVc1zw7V1amTwtToITL8ldPoKTuCM=;
	b=LLYhZgP70MS3w+Y6bH8uoIPgmQFAOpKUPVJHzX7ze5cu4X9Dm1mcJzgTsLO/s81eMB3Q
	 YnGueqoGy3u2noiJDPNc2AwODftYt55+igr6exf2lKnX71s6uKIv+5GrxvGozN+6Sq5nM
	 qcs9wl+ybYgNrLhv/HH6hnOKCNqNQyjds0LEod4YNZVPSARFPksoEu0eIPKQjg/2maDgq
	 ftgWTVRDXtkI5FQhnq893KCajfuJ6RCc60GqN5hEPT9IVL0/dYtA6crrcB16mTYJdWstT
	 20RXdQohWbUok6rYNAyz2wTWgWhL9S05wRRumGWKD/O5Rs4p2UvqvgDNsyKaKAM8TgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rIaRJUt1;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80307606A335
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80307606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rIaRJUt1
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49134c8509fso1032881f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794017714; x=1794622514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dc9ewNRLy/KDUCgVc1zw7V1amTwtToITL8ldPoKTuCM=;
        b=rIaRJUt1BdlbukYtOlgR3hm025ZNxYq1nfZwPggR6pcX4cUfW1bglCbWsHSd+L52tV
         HfldkHEXIy5xOOmVeJNMVbBwBw/0j4C6+rZLgGNL8So6zZuq8zzQtJ/0cXKKtAFvpDBU
         2myzL2JNjUfhwPRdmFOizDPdbiphF2ebjRezj6BBWKc5zDn11Y5oQAnVNvto5HDh8hNc
         9kiZFkhTNmnO1W4Dcf6YFvC11fLhCvlKM0AWrovMXtIeWKuEpJdEkTHpR4tAs8bD+X8G
         Msz2L5oR6NOlBGlsoHP4dK42na52GbDAMsKSIW3MX/S4RmPwd02Akx3FVcKEZVYTPj59
         A8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794017714; x=1794622514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dc9ewNRLy/KDUCgVc1zw7V1amTwtToITL8ldPoKTuCM=;
        b=OiJnQntVqVioALvOcuyPPc32YvizOvIkDBbTnwwJUN8PYVj0oZpE241ANmtYom+57L
         z7qXjtQ8yFwVbKJurt1fSigP83IQ7boKZNTBaMeLI+tBoNimZSZdTE/j55kfILgOmu9O
         7ssn2FweWRLWufa84ap2z+DkW2ZVqAZn/zaWrPpVNNDU90cUCIK92kk+W6aGokkanMeb
         9GeeNypQMgqOYFWltC34JasTUenuvHsTgvtplIO9xvBlF7WSn9VJiFXcoC1DrkKLLMYI
         DlVNqMosuIW3fnzylYOGm7x3J5zUGcfXAP/Dt6LVlpA/NT0HHA7YlNVDPWZiLB/vt418
         SBfw==
X-Forwarded-Encrypted: i=1; AL+hErEIFthz8K5Ateg+Pgsy2nWBA8aR5XIEgGZiCXqZOcKh4IZ1DD1wOvRF+9fJIh3A7ts4K+8Nv9ZXikTFQgw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/byd7NOTPy/s8BVsFBauvMDEUpo7io+z1OPmnpRHL7OsP0v3yU
	RMu2LTQcYXIe0Okwn5rYCPS2ZNX0kwp3PmOvVX+cM85cEcVT0xzoU1On
X-Gm-Gg: AYBFou196eLm2OIIBQ7kMggym8DkfKZZ2gOcMtYgQy8lT/B53PipXYY5XG/ktrilUpK
	tqmWa3AoXNqkiSEJMLMO4MszWZhngz1UHwr16gugkhlZtuxapFXDJ+GTYWgDLVwarNjoz+HQjx8
	H9w5jQq59sQAepAuGga2G+VVaoE/ICVZ1/iU/d3RaDTws72mHcLcdo988XFccSYrIl4GY6DUW9S
	Y79ji5DmDHzJtarnSRYNtfzNF6gU70VQp0za1GT8LpA/CG62BoJeQE88vFFUcDtI72sZ+F/ZjaX
	AsH0gsWzriX2A/bSixY+iGa55JwYzrJjaLy+6w4xQErN1wXxtsYuXLBprCIGFq6MXjV4aqwEApL
	nkJznnD89CyoHnI4VTZawQwgFzcmW7nV4BpZHolHGm1ofiM7Nr0n2qv+hJ1b56a90jDkcz6Moa6
	uElta6zbmjWebS68p+LyOmtfWg3IjKYVB8W+tKfLjVal9mympkspOK9f6Fzv0u2SU98jA6WFalM
	Y+GtqBAm4A6uOp0TaYXKDpW+0t114HlRWeaBPYmc+4Bg+U/D5A5ODf3m04W8IL4qcEvpbhaTbyE
	QtU2m0Sj4rvlOgAjmWVUDUJr1P7SH1ZfakHenlXE3SFVSEXCnXyNhBOGOXPqz08ndWx0fxiqg7f
	pYTP6d6LxEC/oJlfSVJQMjLs=
X-Received: by 2002:a05:6000:41c3:b0:48b:108:48cf with SMTP id ffacd0b85a97d-49275b1bcfamr7936541f8f.25.1794017713547;
        Fri, 06 Nov 2026 18:15:13 -0800 (PST)
Received: from localhost.localdomain ([86.124.84.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc5f11sm6367449f8f.49.2026.11.06.18.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:15:13 -0800 (PST)
From: Radu Toader <radu.m.toader@gmail.com>
To: Tejun Heo <tj@kernel.org>
Cc: peterz@infradead.org,
	mingo@redhat.com,
	tglx@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	linux-kernel@vger.kernel.org,
	sched-ext@lists.linux.dev,
	bpf@vger.kernel.org
Subject: Re: [PATCH 1/2] sched_ext: Add scx_tickbug, a scheduler that holds a task on an idle CPU
Date: Sat,  7 Nov 2026 02:15:06 +0000
Message-ID: <20261107021509.968928-1-radu.m.toader@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <au4HhnJoKvJ6GPJT@slm.duckdns.org>
References: <20261106094343.174905-1-radu.m.toader@gmail.com> <20261106094343.174905-2-radu.m.toader@gmail.com> <au4HhnJoKvJ6GPJT@slm.duckdns.org>
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

On Fri, Nov 06, 2026 at 06:59:50AM -1000, Tejun Heo wrote:
> Thanks for catching the bug. However, this scheduler is more of an one-off
> debug code and I'm not sure we want to carry this in tree. Maybe put it in a
> github gist or sth and point to it from the fix patch?

Fair enough. v2 is the one-line fix on its own.

Rather than a gist, the fix points at the v1 posting of this patch in
the archive, so the link cannot rot and needs no account:

  https://lore.kernel.org/lkml/20261106094343.174905-2-radu.m.toader@gmail.com/

One offer before I drop it entirely. tools/testing/selftests/sched_ext
already carries nohz_tick, which asserts that a finite-slice EXT task
restarts the scheduler tick after an idle interval on a NOHZ_FULL CPU.
The condition this scheduler holds could be asserted there as a selftest
instead of carried as an example scheduler in tools/sched_ext. If a
regression guard for this is worth having I will post it separately; if
not, the archive link is enough and I will leave it alone.

Either way, the reproducer turned out to have a bug of its own, which
the CI review found on the same posting: an untagged task pinned to the
target CPU starved in the shared DSQ, because the target CPU stops
consuming that DSQ while it is holding something and no other CPU may
take a task pinned there. With two tagged tasks handing off it could sit
until the watchdog unloaded the scheduler, which contradicts the "the
machine stays usable" claim in the commit message. Dispatching anything
with nr_cpus_allowed == 1 to its local DSQ fixes it. Noting it here in
case someone takes the thing out of the archive.

Thanks for the quick look.

Disclosure: this reply was written by Claude Opus 5 (Claude Code) and
sent on my behalf, in the same session as the patch; the patch changelog
carries the same note.
