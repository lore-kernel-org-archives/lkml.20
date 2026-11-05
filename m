Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793899757;
	b=O6UI2+09nvMgbG10gNSv6VBSiN4f42qfGuBomv+pU2r87Qr+ZWjMtCqDtL3Yz9HwMvF+
	 X6g8sz3L7dln88zdkNvBR2fkXAp55/p3gFA6+fUVHG2oj2pZDC98NsMurx8Efdd58Cqj1
	 kGvdIQTbG2NNn2T8WV1JG+bNpSUj61otIH0XM22lmlkjM8Z4aVRSN0NnuO+3NJxApGL7l
	 0Z5uiKLwwCm0Lv48k78ppC73kUO+mbzDd79R4Jt/w5tRiWfMNHwOFDBC688W/e3H1jTgq
	 F8s382/dYl51rjBWsIWtYrHOfDcrolVGkv1aK+A4t4pBGt1qv7oA5FNhtEgFKUujhhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1OnqzRsvitQ4MyI4f27p0X1rJF88pgVycPeFzHfgJT8=;
	b=EACv2k4dShGLwGCpx2zQpjkYHwbBoLAUHz/AxHwQOs7U41s0e0OXpmr4ZDj4+shpL1Dt
	 Kqe7ia1AkWeR9rplATUmoK2qsNOhhmQ70vD7GWo3POVJxMN+IyzdsDCEqj5ZvjtKVrzTM
	 CTPSmdURgJy15vrjOMOErl76CcwtCH6KNdtfYFe8N+yfAeGA35r7pk5APhAwAXfcJzIUd
	 /qiaiHkkQBCIMw/lllBGr4O8P7uXBSFx7JriYSBbrQwHUW5mHsR+Ky2OqLiUvOv/yS7T9
	 sYZUFpLA9H5oZJ04qYJYwMwSTQxYHtJO2RQYekxtawnjX4tod8oF16UqopPZvQRxOqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AiicqOKo;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F60606D803
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0F60606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AiicqOKo
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso16597195e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793899755; x=1794504555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1OnqzRsvitQ4MyI4f27p0X1rJF88pgVycPeFzHfgJT8=;
        b=AiicqOKoHaR/wnplxh7tZic5GCFf0bJjuSByayhefFdUTwR3Y4+QtRcQt6KpCMS/4F
         li9JeUxeq92jDKHOKaByhLGOHb1g+x6GxI7jIE3Ld6cTNtguk41MNsSf9O6sXIe2b4j8
         pzeMdtVlRx2lZK3VoCHpgOHelRygmREIl4RVFF2aitFAf9dTDgTNgbZK3cTW8y2L9O89
         X2/eeBAyFe06+RK/MH+eSrAx/z2TBiYpsRZ7WaEbsK2RcG+gJqwmdK5TPPwaiosgYniL
         3ignaZsdRrO8jGFuqekY57xrHNTp6XvHtyWUO18DnsVw1ArJf29ytn121FYVbbwtOPHS
         tJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793899755; x=1794504555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1OnqzRsvitQ4MyI4f27p0X1rJF88pgVycPeFzHfgJT8=;
        b=s7QaZDumxYrULllpbTcxx+aqYAPbmP6ws3JhDodylvZANZyC1fyaKUZ16fh9O8SO4C
         sJP/EntiBFNwPswA0zNlw6qqVeX5RHHKIM+GwP/qxCZcSKK2aIizfM7tZxBhxgEAz14s
         A44Uv3G7aIxIeWHS0p/VgBg+sy79M7MOvfGt0Hcot1P40BluR8lXa0S8jFLHWPoMbVkR
         YZlEdm4YwgJifp4Do5H3aZcGJv9JwJb2i5xs72lj30xZPHeoOtoGbuNINChTnYIvkVRu
         7fTCt3/OLfx251MsJtk2QRT3DYoVW+NKdiTUi1Ir7AW2w8o7cI/pXC6GWXjqGdDZiL8O
         9k+w==
X-Forwarded-Encrypted: i=1; AKwUvBwvf4gnQIYew4733PNUJ6wG3AXJvz4XgBC1gU4nap+Un2cO/2eI+D3TLrfsFq/hR2269711MYjMZUC3pV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3ugJcLTB/TIHYnrBMGJoZS4QQBZ5n/uv1eo5Y5G/MrrHIvlVv
	2t/tiAv5VqFKrffLg2r/1uuCN8HgzHkwwM4+tib27+sij9wc7U0/r/ss
X-Gm-Gg: AYBFou2XJTKPvFqwdYTdd5iWyNlKFlEtnVZA9wBTqkg7IR4BtAzZJeNXbuJKfIevhyc
	4wsk6zVJ7jHr6mjBSaDbXsAud7udmX35qhkmsDLVgfEr98A6Zsy5naX1YVfC2Pkku4EFVbGs5SZ
	EHrycOP8rMaXsi176G9CNX3QC2GSSkpnn7ExFT/KdjIkQDEnyfj3nDDAfHoMuRhwYpToyjy8IBi
	YnGliTUHwFNPeFrw+6PdxPK3YYC3oOgcoPgZNnJ+AZPu4QLqOFa0z4NfxsU4eeQtQBfA9aEnCjW
	nfU/73M9g67Qx+sv4nZoS9QiYuL319dVCHsqnEI6FSXDHgdpCBXJIc6iEra3l5eYcjPajU0rErL
	fpWwwOQLaZ4jCsjQQfaYWMAo0Yjj+S/cmOjimNixZZsOp+aCSC6gdotntyU/kxMITlV4svY5sw4
	1cQIURDa7albdXFg5ehDUDcrOTk4CFZ63KitHueUfx+9zg9QZ7iExAxONBV5x+AzjVZWkystvmN
	hBIdXYWEIPtyjl7vWYKs3sBLFFzM4twUfjTeUoRUw6IZ65QwZH0Lq8iWZ7JyG0C3S2RlQn5++Hi
	oonyju1Em/0lTWnLDTWIZ5Vd1jkQkCGvrZ9OJIhwSo49nS3NJiKGRkx/0lsvXzV8TeO9d4tGDQp
	CQIGKH+g=
X-Received: by 2002:a05:600c:3b29:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4ac17d19aeamr401115205e9.21.1793899755121;
        Thu, 05 Nov 2026 09:29:15 -0800 (PST)
Received: from andreayoga.localdomain ([151.43.242.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae72dsm131080675e9.3.2026.11.05.09.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:29:14 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Waiman Long <longman@redhat.com>,
	Ridong Chen <ridong.chen@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Kayra Cizmeci <kayracizmeci@gmail.com>,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 19/21] sched: Clear cpuset_locked where the policy check retries
Date: Thu,  5 Nov 2026 18:28:58 +0100
Message-ID: <20261105172900.38029-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <a63396b0-9b0c-4d4b-9754-f503cdb84098@efficios.com>
References: <20261104211207.1392343-1-mathieu.desnoyers@efficios.com> <20261104211207.1392343-20-mathieu.desnoyers@efficios.com> <20261105164356.28913-1-parri.andrea@gmail.com> <a63396b0-9b0c-4d4b-9754-f503cdb84098@efficios.com>
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

On Thu, Nov 05, 2026 at 12:08:50PM -0500, Mathieu Desnoyers wrote:

[...]

> Thanks for pointing this out! I'll pick the preexisting patch into my
> series instead for v3 if that's OK. Then maintainers can feel free to
> pick it up from whatever route they prefer.

Fine with me, thanks.  Please keep it unchanged, with its tags, and
ahead of dl_accounting_unlock() if you can, so it still backports
cleanly.

Thanks,
  Andrea
