Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3C84A99DB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788384722; cv=none; b=qp54tAbgaW9ivxPgmmw64w88xNwSPY52cJ8pQ6Eevq3TahpR2xZk+JufMiLgvD9Cewp3xdpcnsuwsPYSzYgSeBeNbM3bfr9+KS469WusX3v6L3/5yG5j6FcfpKq6AeJg1dIWHIXNalLKXs1ITSHVPwN9m7Q31skhevcu9HZuxd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788384722; c=relaxed/simple;
	bh=I3fvkvWoA8/WV4SQWhXYswOYzr/OzkLB5gLkIo8oOpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sBL4CAhgowJyB5Ofz/K7C7Ced54Xy+JVZHcu6DoVx06Zq3bJOqz1kIfjB+dSsuovBl51o67KT6n2ljtaWh+6yyJ8CYn0jHzhHcFdM/5K2BE676JU5WV06BNRcLovdCjlehOaZCsO7y/4QDQJ3DWHeW/KBuQhxuHVeIlYSj9Ylps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCz1OfjK; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCz1OfjK"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4843e397f74so478497f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788384706; x=1788989506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UaW+NnApz0iuwtAB6zb65SHy4anzMmX+6fXOJdC4/tA=;
        b=WCz1OfjKrHReTFkjvyE2IjEvRH2W7vCtsfCI8kQ0edo8bqlhmyhVZe6xQoT/rcCEKr
         nr4JhBKC7/qkV7rajpRUvVk5a0Zln3Krb0bKjFtPw8CYS6lhSC15JpiC11jyJoz/54/n
         iKDo9fhzcEn9n5iM+wEguHeQUcr66jDsxAglQ1njag9WJDKhUkBRM3VyBAFLfsd3hdxr
         xFbD1yvc9wG63ERkHAdrAl02UptjILWLbbic+wWmFbxp8rc97TW7ZnnHUp22kDOiunhY
         L+Lkaw4iG66Av3ELbuJ32wZrCg4KGTAImIs0hQLr9T4sIRmEqKJZ7c8+sPkRfe0OxPug
         e8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788384706; x=1788989506;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UaW+NnApz0iuwtAB6zb65SHy4anzMmX+6fXOJdC4/tA=;
        b=n+x0UTSId7OAq+2aictGNO3wUwTSiALTGkqxsmmTjGTiVXTd7MTtG1WZ8SA7Tvl2bk
         1SW9k7r8Md/VEhfKDdNLDd3YWIlgvAYham6BVAj2SZy29LPhuUMidaJvzPCKU/qdVuKs
         BQEKXQ433C3FeFEVXS1xDvNmcqE1onYmNMIUBg/qqvOAwspV3L9DCx5jmx3f5C1BDrth
         6m9U9xT7uz2fLljvQHCmSXgwLqjUjtJjNAvm7FKp1r52xvcgDjazTLEWwXLirJNaSfky
         M9dQV/Zq61WhKmu/xTLs7LNF9YiGGYs/+cWwSjkpDGOEk3sziiHrtj1rBYzzVRSxiAzh
         Fg6A==
X-Forwarded-Encrypted: i=1; AKwUvBzxyuTg8m/ajmmpg4RAjkatQqEhDWkW8mxUjsx/PP/VhMn/UwhhB5mg68Aby4/pV4aNtDjmWiLYjYC6bPg=@vger.kernel.org
X-Gm-Message-State: AFuF++ktVsirN65hdBYuHhmGU8+QpuFtPCe4c3d5yyluBHz7K/YY/5yo
	Vdzdb1wDn3wZrjgJMmVSaW7dFTHKKXptyyghnIL6SCZplkoCtbufTNxl
X-Gm-Gg: AYBFou2myJe9VRmFtfbYnUqJLS3LKm6Pzp7hbteuvMpaF1CA3SSoMXaArqbntcvccVm
	k/NFj1FD6An5WE/8S532/QiMfUbHghGlNwHqbA14lurbsH6EDZYKhlOoQavA0OKMmS1ZoGxrQnx
	X1a186XHB8QUZKrWDSeoAFdzCBC1drP2vaELuVyEknLKiqRw0pV4btQQfHvsKbvqaBBkn9hsax1
	C8HS9zHvItaR4gD3+bl3NcUASZnF8cesd+Hja/7fk+KbPbSLz0SA5qp4C3RaUBclJA+eSV+ZmL6
	4gf1hcJwXdVIYI8vJXFRGP48qOePuOlyrmYYAVXi/CyiwfEqrkgYoxraqiatVFxYAk2xHL3qAy+
	l11iUTB3DErwJ5RQawt5gpbbhbZ+p3Q52wh+AWJJo7t0kJRPuL4HUWkcZE0utGzym11KKPxO7JV
	ENC69aTY9KQ7eRaCsEZA14zOcF34gmpBziBsTaX/1sbvLo1syPad+/0WbA5CJluHm9fuibdUNbN
	xa1HrnH1BuHUpcA4m3J89tVnyNNGXR73YbvaNRb229aYuldLz+yG6VkBuzqUdod5NEbIiIFVbmP
	lK9Tr4xZMgL493HnEFFnSo0=
X-Received: by 2002:a05:6000:4a1c:b0:47f:ece1:1eca with SMTP id ffacd0b85a97d-4857e3cafc3mr4353499f8f.1.1788384705864;
        Wed, 02 Sep 2026 14:31:45 -0700 (PDT)
Received: from ip-10-19-79-40.eu-central-1.compute.internal (ec2-35-159-55-138.eu-central-1.compute.amazonaws.com. [35.159.55.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e7f8f9sm9018342f8f.9.2026.09.02.14.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:31:45 -0700 (PDT)
From: Nikita Taranov <nickita.taranov@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: futex: private hash can stay on the shared atomic refcount indefinitely after auto-scaling
Date: Wed,  2 Sep 2026 21:31:42 +0000
Message-ID: <20260902213143.3426531-1-nickita.taranov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902075604.A_-jz823@linutronix.de>
References: <20260823150046.204417-1-nickita.taranov@gmail.com> <20260824160337.0IvfKx8A@linutronix.de> <20260825170605.2462933-1-nickita.taranov@gmail.com> <20260901230559.1978876-1-nickita.taranov@gmail.com> <20260902075604.A_-jz823@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> How bad is this in general? Do you have a workload where you fire a
> process, create 128 threads and then seconds later kill the whole thing?
> I would imagine that in general it is long living process and once the
> "final" privat hash gets installed, it remains…

The problem was originally observed on a synthetic benchmark that pretty much
did what the first repro does. On that benchmark, it was really bad as you saw.
I've never seen it on a real workload, so cannot comment on that.

Speaking of the benchmarks again, by "never recovers" I meant time ranges
comparable with the duration of the benchmark itself (few seconds).
For example, running the load continuously and printing throughput every second,
v7.2, 192 threads:

  9.0 3.4 3.4 3.2 3.4 ... [169 seconds at ~3.4] ... 3.5 24.8 34.6 34.7 34.8

So it recovers - after 169 seconds. Six further runs of 300s each, same
configuration, time to recovery:

  14s, 33s, 165s, 280s, ~300s, and one run didn't recover within 300s
  (it peaked at 6.9 Mops/s against 35-65 in the others)

The pre-sized control run at the same thread count is flat for the full 300s.

So the accurate statement is not "it never recovers" but "it recovers after an
unpredictable interval, sometimes seconds, sometimes several minutes, and the
process runs ~10x slower until it does".

> It depends on v7.3-rc1 and should keep new waiters blocked until the new
> hash is installed. I also added wake path assuming they will continue to
> matter what. It might make sense to do this on the wake side only.
> Does this do anything?

Yes. I built v7.3-rc1 twice on each machine - stock and with your patch, same
config, same LOCALVERSION.

Stalled runs out of 8, per thread count (auto-scaled vs a pre-sized control):

                          stock v7.3-rc1        + your patch
  Xeon 6975P-C 96c/192t   8/8 at 96,128,192     0/8 everywhere
  Graviton4 Neoverse-V2   see below             0/8 everywhere
  AMD EPYC 9R45           0/8 (never stalls)    0/8

On the Intel box the 300s continuous run is flat at ~36 Mops/s with your patch,
against 4 Mops/s stalled on stock. No hung-task splats in dmesg on any machine.

Graviton4 needs more than 8 runs to say anything, because it only reaches the
state a few percent of the time. At 192 threads, 24 runs per configuration:

                          stock v7.3-rc1        + your patch
  threads all at once      0/24                  0/24
  waker creation over 3s   4/24                  0/24

I'm guessing your patch was an early stage draft, but just in case let me flag
one problem I saw: on the Intel box the futex selftests regress:

  stock v7.3-rc1     14 passed, 0 failed
  + your patch       12 passed, 2 failed

  futex_requeue      requeue_multiple:
                       expected 10 == futex_cmp_requeue(f1, 0, &f2, 3, 7, 0), got 0
                       expected  7 == futex_wake(&f2, INT_MAX, 0), got 0
  futex_requeue_pi   2 of 24 fail: broadcast_owner, owner
                       "Test terminated by timeout"

stress-ng futex was clean, so it is specific to requeue.

Happy to test any following revision on these three machines.

Regards.
