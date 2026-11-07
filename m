Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017719;
	b=leIV26yV1KgflRf+WIszw+bxUCw6vUHr+JB51iPGhVvl3uV+crJr3VvpzjffBXHVyOD9
	 zzu7fCsRM8aefucvmqrJcZGD0mPSKWGcv6fqHj6gcoeIkfijBzI8gp8S0fWBPP2nQMBdg
	 gvnugskNDBCghpLHL9LQSgDGBLPXDNnWKxoz6N6KgOzTWGPrB6u5sZbjd/ZuUNsOAXNbn
	 BuAyCGogk0f8xyYcdTPYN93UFcxQ4vAoLd+tCVcq8w0X5wnZvwQmUrvgTD89cvLCMJlfg
	 K67lWobYCZ4PK4IyZbOvYhCQFz0NF88awRh/+GQkaduD/N3XwNp5QVqmMsjWvZ/TIjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vkNpnDXn7v7FcqEceWtawbzUhjqzoj0bXsK40kYeEvM=;
	b=X+alSVQ0Vq/3Pkm3onf7EfdBrsB2z6l52XV0x5pF79SSI6C9OP/M73uEhL/XzGtV7oxy
	 HgbvZy0PSr1EKS0P266QHbXEOS4HDE2GrGqfb9SWAJvS4p1fG6g9rJX+lLsV0epms4JcX
	 wKe1axXOwdmdNi38pp03TuxHkicuxHJVmPbVAciwEZvpNv+g0nB3bw8i/aK7ZpKxtx4Pg
	 4L4w9jU18o8kY4VK3+1bypyEp+vHB/9f6sl6CySL1kZ+GU4CRAkJZM0tn97WX8ZSreWdY
	 8xQAo2ZWLyx1P39TB6Hjr79aUhVOd5yrSteKJqa5tiTYc7G9md38yjs/EJUde9hlBYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w+tq5SXK;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F85606A338
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80F85606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w+tq5SXK
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so12894025e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794017718; x=1794622518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vkNpnDXn7v7FcqEceWtawbzUhjqzoj0bXsK40kYeEvM=;
        b=w+tq5SXKnfdvsqGHzcQK4MV2Idg8X9GCuyFRHpjBKAZaJMv0TTG/wMQnL2CNt7IWr7
         l1+vz+bTwouMfbb5xf+u0jWyMI8JmPq0DFEL04DVY6IQeiD3mqGQzHiBu7gW30siKxzA
         n5W0fwMTRfKfKJ31/BDjBKKoFZrSFN+IZVlQyatztlEtJKnVU4D4nqTIRLj/0D4Y57WU
         UBUqj4Vkgw8wK4vozw1uEhLZP5fY63ZxjZDQA369X8lGLcjrT6/7VyGTltVoyAd5BLMP
         biUWJ1x4O4BjR8Yx6UCc1v6AunT1YiAc/3oiysr6MBZ/ALuHlT/hhnAsL8lrrhysU1pn
         63eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794017718; x=1794622518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vkNpnDXn7v7FcqEceWtawbzUhjqzoj0bXsK40kYeEvM=;
        b=JdMdIHPW7uA7h12XZINWDNzaC9DTKir1HnbE7KkxgPPkoOSMyf0dYznoQfr7ffT2AU
         NrxM+2UF9ERZUMGHCGYwtCM4wSaKPAfnqa1Myg1QSJIiPpOC3t/d0cwEeYiQDYpuHkQG
         BYbhxT+D7ntRy3DFhyFSkqnC1u3PVMMQLVwR+4dGRhjjvSOVToo9Jy8cNW89DYdrl3bD
         XQ+fHa3DPfSvV/2JxqavJaXVozsjDEeVGxkWvZL+CUvIb6bL18TVOdVDQnwPYZKSqMd+
         4M5TC0x87T7o4GNJg7OXCsaYKKpRf4iKoPkOnVLSiBIEVn8REzWmi97X49liavoHkTpw
         Uamg==
X-Forwarded-Encrypted: i=1; AKwUvBzKUOu1aV78wzR9Nry7WaC7M0YcLmP+BRA+hkR21c5mICWDlyOJCotlQGrCqAsIzBtoP9jYm3Z90vUVU8Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z81fBeueLGqx0JhcKVdrQU7hjnGaHIdzMf6ZT4lIl5JZvKaMofc
	IuX1nZDr9UPsFRHLBTkGz7LCWmOHSI2pDvECjR5in14UVwuEnCeAOfXr
X-Gm-Gg: AYBFou2AWW5qblM4fSrCryM4q4jfcBwxynXwW/aTHNUvQvv3YG5al74Yf+OEbOZOgra
	LYrPKidxb7bH3UEmiXDRTCW5d3nDCqxkHoVSuafvQUiA9qD86WP0h1keEa5sbdaAK7jV1MYU0IO
	vWfJIKlIec/SEUJCOtNaIBAbSkdZaRrV7X73Fqnjn7Q17TQnSHreVYdNGQYCWVlf0Et3V4dQr+J
	zfVwenAVb9dlkE+gXgeZgUzco6WEzzDJXc9FuEe669U96BOYjQ9UZjWfQhfrHBVlIAQBiH1zI1u
	Zy7POL+cudg5bNKy8eISqrzXL49dRFBBkjGodYdPIirm/ebXOeyPNf/O1NeXVy9ll6orvVJhpHu
	ev4MuC8NxmnuG7/cUKwB4RDowqbqAb220DAnDMI1o7WsojGqu03P5tS0GtXJQkGueWg1spRfDpD
	1sI+R/siBgX8xOPT1N3TZ7XmH6q/GM+bt5Vf6qtleIxCA1xUO5PHpI97GiNPHyVy1ckuJkPUZGh
	1B0ijLtjksRfmVOhYkfAtAXT7wu7V4qTOAXEu/UcbKnTQY31cUD46wb9WzFiAJHFdYjdj/Phji6
	3OhcmZvqTQm+525j55bNeHZFmqrMIWWiKCj/QFyCLmm68fL1qsXjsPmcjUbvxL9D4ryfbvqHJK4
	YCQ==
X-Received: by 2002:a05:600c:3495:b0:4a2:150f:1610 with SMTP id 5b1f17b1804b1-4b6dfba86f0mr71877255e9.23.1794017717990;
        Fri, 06 Nov 2026 18:15:17 -0800 (PST)
Received: from localhost.localdomain ([86.124.84.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc5f11sm6367449f8f.49.2026.11.06.18.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:15:17 -0800 (PST)
From: Radu Toader <radu.m.toader@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: peterz@infradead.org,
	tj@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	linux-kernel@vger.kernel.org,
	sched-ext@lists.linux.dev,
	bpf@vger.kernel.org
Subject: Re: [PATCH 2/2] softirq: Treat an interrupted idle task as idle in tick_irq_exit()
Date: Sat,  7 Nov 2026 02:15:08 +0000
Message-ID: <20261107021509.968928-3-radu.m.toader@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d8c4fb5ce3e465c9c9e562c851d586ef8e5cc43d85d61998f63f2c48d431778e@mail.kernel.org>
References: <20261106094343.174905-1-radu.m.toader@gmail.com> <20261106094343.174905-3-radu.m.toader@gmail.com> <d8c4fb5ce3e465c9c9e562c851d586ef8e5cc43d85d61998f63f2c48d431778e@mail.kernel.org>
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

Both points are right and both are changelog-only, as the report says.
Fixed in v2.

On the first: PF_IDLE is indeed set by cpu_startup_entry() and not by
init_idle(), which I checked - init_idle() sets PF_KTHREAD and
PF_NO_SETAFFINITY only. So the gates overlap rather than one containing
the other, and "strictly wider" is wrong. v2 drops it, names the state
that is no longer covered, and says why nothing is lost there:
TS_FLAG_INIDLE is only set inside do_idle(), so tick_nohz_irq_exit() had
nothing to do before cpu_startup_entry(), and nohz_full CPUs stay
covered by tick_nohz_full_cpu(cpu).

On the second: injected idle is now named among the newly covered
states, with play_idle_precise() cited and the reach beyond sched_ext
spelled out - intel_powerclamp and cpuidle_cooling via
drivers/powercap/idle_inject.c. Peter Zijlstra raised the same point and
has a reply of his own in the thread; the gap in the changelog was real
and is closed.

No code change in v2.

Disclosure: this reply was written by Claude Opus 5 (Claude Code) and
sent on my behalf, in the same session as the patch; the patch changelog
carries the same note.
