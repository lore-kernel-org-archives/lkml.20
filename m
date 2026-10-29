Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266317;
	b=K5hq+QIokylFZnvdQp7y6fS7iJ7JTQTaA4udkHq73MEs+FrTsUAWcjIjTLcsQpGxTXEj
	 znDjwmFHY8cAyQhtC2FWgoSlvJL2xe0batD4wxYrllBxuLsU8yk3VFUNW6K8l3hZT3Ex3
	 lG6Dlf9BjaxNi12yqgPHJjVaKDBw+bIFPl1q9r5uPpwDm7orCKb2aS5haGG9qcUnCjJTs
	 Jqbc5TZOinUf27g8xLnhnVm3m7qpZd1qB2UewKsKznD/3Qw4bW6X6LniLXQSQ3WG+gZUz
	 +Nux+mDBNQ+8sUHhae3Ub4Xpn2q0CfTDy2nOi0pA7g8dLHOw/lnfd9+Ee0jdgtvnGBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SjLjM4WTEZWvZ7coJGmsXCtsM3Olzzp6MzqvL9sZXD4=;
	b=UoT0MhgxlQywQ2TPP/3W++kHhlDE0uasdFDmCtRbMyJKAB2ucXFPsU7DvBDZCiqpZFbP
	 NCWV5De0ReF/dQU9K92sgYfuj4/twsq54hvu83Zl859znbUnuAt/cT85LzwcgpxAXSB6D
	 FYP/MSXMPxhzlVf3fb1JPBgAN9Udtlr3J6yaEnCpBGIPXr3krZ8+2EkfxpFI0MF4Gu9FQ
	 f/tzXCn8crj5natWOu7r4XkyM0G2vhKOHqjTcXyB44XhjfEmeblQCuUXqWJp3PlYtBhru
	 8dZuf9VSilVbLDSYfsmbgwQar9z5ZVlO5cxTtnjzGxzJ0r/u1KNyH2JV37MQQHV7ifA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vBZsGoI/";
	arc=none smtp.remote-ip=74.125.228.6
Received: from mail-pz2-f6.google.com (mail-pz2-f6.google.com [74.125.228.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFD0606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AFD0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vBZsGoI/
Received: by mail-pz2-f6.google.com with SMTP id 41be03b00d2f7-cd60c90a67aso338222a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793266316; x=1793871116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SjLjM4WTEZWvZ7coJGmsXCtsM3Olzzp6MzqvL9sZXD4=;
        b=vBZsGoI/fPG4VXPt7d1NN52UzkxAR26gMuYQsCSqyjqvxmrQ6PIfYhHOqnH0nlUXdB
         tRrdUzpYQrLQHotcnNSwj78MZh0jkiA/mGyjZ1GqxEVoaRP8TVLEhIZ3PCXNiRXdnj9A
         9GNE7zwJfc+8squ+nAHgeHVtLACGKNtiv21evPMbyIfcU2xxE5+L+V5l5v9k7IL6ovfx
         5LjvixArNGV4vitz1HRavByo8IJWrOc9Wyj2zQgmXyWEm/1Q7eZQWqM4JGb4GBS3d6k5
         Vy9p6L/tZep1yl7mIcS5vjpKlZ9+GJffzMWTgaJGUcTlM2NdCJA6duWPssxv+oIlOLSy
         uaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266316; x=1793871116;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SjLjM4WTEZWvZ7coJGmsXCtsM3Olzzp6MzqvL9sZXD4=;
        b=Pi7IksnWLevwT/rGupfXf4OoZkvD2FLLuZSvW6ftU8siH5OIwbTfDHZmA6EUXO0mze
         0Lcixa3EsAXDLA4lUpXTUpEhv/4jTeATYPTU4jcsuEAGZ5Bz78co0TmMwk91PpBzKY/b
         P8fg+TUEPTLw/UjTAWEjGquDRq/JQui0C83loghW3Iy/x+umPLO6ka2/adpSrshzK9pu
         uMJQHBYut9HV5y5T/LaBiXjE8GuY3vhYnOlcwVVcb1XWjJ2JgRwTGMvYhYQO2FzTgb6u
         AIWhNrEl8rJP4hDSD+/zIkFnXTUvV7ebOugGY9Ob1hFMWlqihye7/bJUO8wVVDLK5Ubt
         4JFg==
X-Forwarded-Encrypted: i=1; AKwUvBwyR6RliuxEbU/HO2D7NXbHqNDfZlQr535QNk1IlSTelnD6ry9RftdIBXaE+k1WSreAn5aIjsFh8Q4OKXo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNtBv8TwfHQJ1L/mHQ9F31fhn/RcCmu0tToIcG6yVoGMGLfkRD
	BIboJ9Ay8iHXoHDtkvqrtOEsTmLqznDIH/5+lxlbjlh+6hrW4JV49wVV
X-Gm-Gg: AYBFou2lQGuRI9TRwFpWEgkPscIrLPYCPDcSGglfiQGbEz9dy83nfF7nr20xuZT8ydp
	1xm6X9XvQoR/O5d3S3v7bRa7fQ1cpFgH0XOjmBJDELeB1cV5OJcVBJrG/C6wk/Odr7a7uGiBPD7
	V7kamM+Nxt9cysuZhsgiRdTHMAYz6bRIv4Cvf1fArxlhM6+vr4k/NrMLTfWY/kt3YygY461ebbS
	QlQnyyjGdcKGdkHp1C8GgvGCZ217WffKFmaKapKb5n8uKAQuC90aOiCmgDwEGSe3/jrMGZMZVK4
	oqPyTat8SSqe9O8KunILs01DpxC7U/CqWB0P4SNU3o99ljSKQhHm9L4y432kuOKeqeH3RK9NLXq
	7wgz1OfmmsIp/QZov3tm7CyqYD6ExVWualK/fWLirm/VwA/q4Jp0JNgeyhyvIzmV6FQKdvVvf3u
	wPqQFj71WaMDuHkUo+sql2YYJuuPRSHkrv4q9nD0zkP+YTvxBlo1IqEmCWNH7pLJawKDY5hRmHK
	WWLaPUDnCW+d+81UfiS9gusmRcH+QvltBJGZ9CZH8ngqfIYD2nANBp75mPo7occk6aCbnrsNRc3
	vjAwQ58kWNe/sqpoVSDBvRwjM1j0HNDkMhc64VwMCTtsVvfnej7f4gbD
X-Received: by 2002:a05:6a00:2a03:b0:8a0:7ba9:93c9 with SMTP id d2e1a72fcca58-8a6e6536df6mr3745170b3a.15.1793266316271;
        Thu, 29 Oct 2026 02:31:56 -0700 (PDT)
Received: from lima-ubuntu.hz.ali.com ([47.246.98.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a7b786b4sm2101937b3a.57.2026.10.29.02.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:31:55 -0700 (PDT)
From: Qing Wang <wangqing7171@gmail.com>
To: kayracizmeci@gmail.com,
	kprateek.nayak@amd.com
Cc: bsegall@google.com,
	davichazbh@gmail.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	tim.c.chen@linux.intel.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	wangqing7171@gmail.com,
	yu.c.chen@intel.com
Subject: Re: [PATCH v3] sched/fair: Replace random newidle_balance with Bresenham accumulator
Date: Thu, 29 Oct 2026 17:31:44 +0800
Message-Id: <20261029093144.2469124-1-wangqing7171@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <auL5Yok7oZrX79GG@scheduler.schedules>
References: <auL5Yok7oZrX79GG@scheduler.schedules>
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

> IMO, I'd like to keep the current code if there are no numbers.
> It isn’t worth it.
> 
> The test results of Prateek on this version don't reflect v4,
> since they were taken with this bug.

You're right, there are no on-machine test results yet. All I have is
the output of a Python program I just wrote that compares the accuracy
of the two algorithms.

It re-randomizes the ratio to a value in [0, 1023] every 512 calls
(the actual update interval, since newidle_call is halved after
each update) and runs 20000 windows (~10M calls):

                      Bresenham      random dice
max per-window error  0.5 attempts   41 attempts (~16%)

Bresenham has a much lower error.

the python program code
```python
import random
random.seed(1)
W=512; NW=20000
pos=0; maxerr_win_b=0; maxerr_win_r=0
for _ in range(NW):
    w = 1 + random.randrange(1024)
    ideal = W*w/1024
    fb=0; fr=0
    for _ in range(W):
        pos += w
        if pos >= 1024: pos -= 1024; fb += 1
        if random.randrange(1024) <= w-1: fr += 1
    maxerr_win_b = max(maxerr_win_b, abs(fb-ideal))
    maxerr_win_r = max(maxerr_win_r, abs(fr-ideal))
print(f"bresenham: max per-window err = {maxerr_win_b:.1f}")
print(f"random   : max per-window err = {maxerr_win_r:.1f}")
```

Hi Prateek, I'll send a v4 soon that fixes a reset bug — it just
drops the "sd->newidle_window_pos = 0;" line in update_newidle_stats().
If you want to test before v4 lands, that's the only change needed.
Could you please re-run the tbench tests on it? Thanks!
Cc: K Prateek Nayak <kprateek.nayak@amd.com>

> BTW, this patch removes sched_rng() which breaks the build on Linus's
> tree and tip:
> 
> kernel/sched/fair.c:8663:55: error: implicit declaration of function ‘sched_rng’ [-Wimplicit-function-declaration]
> 
> Thanks,
> 
> Kayra :-)

Sorry about that. I'll fix the build in v4.

--
Best regards,
Qing
