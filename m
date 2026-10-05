Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493044A3F0F
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210697; cv=none; b=iXN4oofCmvH5+eONNW7MjHq284sfyAZVqZkQ8poDJkH2O1k0Xo2xUgvzlItKcqFhn4eWg0YT2JfwMWREWzfOp2/kWIIi67gJ6Be1IuYGsFejysSDGH4WHzpowjktRX2fIH9ADdayoRPNcGZuPd9jYcYzTXEju8MfmVmLF7t8MqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210697; c=relaxed/simple;
	bh=l1JoBUKloaJb1kbfFpz1C4YjLXf+2dOVeAmacrv5qVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tliEIvRStDeCBjffJVWFHdhjpxr1pt9hfGPob1cpfVButKFG0nNBoNKAjlpbaRMz1jNQbzql8HIvUDKXfhDZCdhnEhFuxxcl2IVUlpObs6KUCYU+nEazr2wn95nVuGCuQBFF98iCHkmuwk5B5wraZYHOSl+Td6oUJda0cUQkL+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pdHtuAZw; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pdHtuAZw"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so686461a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791210680; x=1791815480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=18Qwc+G8YmhrRLidaiejBD2N20M6mqSzRjIJfhvQ0oQ=;
        b=pdHtuAZw9GGGfk/x74GCNricZnAM0WseG+hT9W+2rIYdyXBZbQUnaMOdL8yFEeRkk4
         r9kyeeG5i0+rP096pcCadoBsIvawzIGDy5BGJSH7Rl5U4wVI+WaLv/lZu8g3tB2PZiee
         RlqA71Z1DV3CDUlyKdQnxowo+Tr/OSosRaMuXBMQOJovjaajQkOTKLiBavnGeGDPb9Tb
         DS2RObvAiDdJFXnbZYTldQSajBCFaFUkdjeQbNv1b5/R5nrTfjZOpYyegONXejx3ZGf8
         kvHfNTIKiia5SLatF4XOUUxVTZCWEjClrZjRuoWj2Rg30NQKIcEzcIT+cKzFSQC+daof
         GtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791210680; x=1791815480;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=18Qwc+G8YmhrRLidaiejBD2N20M6mqSzRjIJfhvQ0oQ=;
        b=G6F0JDZHDS2hQYSVoFnbIZYyJoqnpf9355vJg98AnIjzhcEk2cZ36OIDsnjv7HbRuc
         1fi+02Y4tusjRWEzHpiF0mid6zQAKkg+s0owb1Y2AZ+V51UD+Dvb27zHkxYbhEedqYwI
         TtivylMjB+C4ufrViOkfnbH4R85mes7D7nnepFcufgsN21LA9AOphzkz2TEzUb0iM+Wi
         LHIjgVW1nl9sQA/tSetdGSXm6EBohdbBpl+WnSSpnJOr9Ru3MJYMadjgFhpuu/Ncs/S+
         DZA1swlYUFP2Enf6gZqMm9mtYQIiZMHR7HV/rNt7RqGMuqDGrrbFdq/dxUfQnLI6HKh/
         xIEw==
X-Forwarded-Encrypted: i=1; AKwUvBxetwhNe18CpcenQB4rS03LlPwsnyx/3X0yvS4/YstZVZX5RwIGiBCiMiNB3SvlE9PjeTzpASpB0Mqdtcs=@vger.kernel.org
X-Gm-Message-State: AFuF++msdA4WJzv4ZqU/zQgpdIlKM3lgyI9DwK+OYOxCss8/WKRqXgzu
	coTyaO3wNQpKra8nBBdOHnM2PgDuKKVYLCAgxWVIpBo+xWUqeLOOKAHvQtKkNw==
X-Gm-Gg: AYBFou0E4WY/oG0xS9xbP8LP8Ib8YBdcypC3rkMg+VgCy2Ppb0nf8rkriLLLxDmFC6b
	dSoUcfKVyED3caoXlgavXUFkQ6n1D3/hBOJKMcXmEKSXW8cqzvEmKB7XDTApylS35F+ve73O4gD
	FVntepGl0AxP/4hWglRuZIwWyW8qZT5rx1qZM6Rw6zyrR8Yq/ixC/J/tRkGT3ZkgGfGDIjmTvDx
	MQlsRKUNat0bvSa9O7mIQXKkyArA2gQGEF3gAGjgAnKZzT6q32NFG2/svmdot6oZ99edz4Po6Wy
	AIdy2ZgFfJ+ckjcqa5HHVHO7to1Hr7IiItbRDA93QAXEAzhYhE4T10VDJq8L1eJTF57cMK+iJdP
	LdS7dU0g6JuuF7dNXLIZ9DR7px0QKyMm7xmpShGmgpflQCrcDSiG4R2/8it1Vh5pmM4ngh99ZcB
	NzmR2B/XFWfjtQaSKBNVisRVIvHGpe9BUfiKVh4rqIsaUH748KaXxjg/Kupouj6ytxM1+WgRcGf
	do2FKtYV9zLfPI0ZWriyw==
X-Received: by 2002:a05:6a20:43a9:b0:3cd:7ba2:e669 with SMTP id adf61e73a8af0-3e0d698c63bmr6556482637.10.1791210680022;
        Mon, 05 Oct 2026 07:31:20 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6e2af3e0sm1014440a12.26.2026.10.05.07.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:31:19 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
	Qais Yousef <qyousef@layalina.io>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/13] sched/fair: Remove magic hardcoded margin in fits_capacity()
Date: Mon,  5 Oct 2026 22:31:10 +0800
Message-ID: <20261005141200.1392044-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ac8a6383-3a8d-4fcd-bad1-dbb8dd6cc742@intel.com>
References: <ac8a6383-3a8d-4fcd-bad1-dbb8dd6cc742@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Sep 23, 2026 at 07:34:37PM +0800, Chen, Yu C wrote:
> How about x * 5 < y * 4 ?  The y * 4 is a left-shift which could be faster.

Works for me, and it is the smallest pair: 1280/256 = 5 and 1024/256 = 4,
so x * 5 < y * 4 is exactly the old comparison, same as x * 100 < y * 80.

Overflow is not a reason to pick either.  nr_running_avg is u64, so the
left side is evaluated in 64 bits whichever multiplier is used.  On the
right, get_sched_cache_scale() returns INT_MAX for llc_aggr_tolerance >=
100 and invalid_llc_nr() bails out on that, so scale is at most 99 and
scale * sd_llc_size * 1024 stays far below INT_MAX either way.

I will use your form when I post this, which I am holding until 04/13 is
queued -- before that the helper only moves an integer comparison out of
the fits_capacity() macro and fixes nothing.

Thanks,
Zhan Xusheng
