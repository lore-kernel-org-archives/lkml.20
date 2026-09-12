Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09132F617C
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 04:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789187385; cv=none; b=TtXJQ2TzMZwuh/8LD5AIfHY5VTWZfZBLv1twsIUZdRLEiHgppsgiN0+3jz/UYx6b/4vLcpsLGcO5xa3cplXBLqwXpghUzWUfkBY5AageBtYviN5Uu6ZLc1pjWMEgOsN/X79DMfrjr4gHUDH8Z6pEE5WXOGShs1Y/ZYPA/ZmI8z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789187385; c=relaxed/simple;
	bh=1h6I4wP56U4lHZawweTrmT28rbDD+IQoShOkCRjuxCg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s+CvyAfp8e9yWHb1O9tZ9P6LVmPmb9Cuz4K8o0heFI/8kjRiyN084SlouGMte7nfh6ycNf9dBboiG0FcrkAvh7yyZQq9ERwU2IkTeh9roSNUA5YyilYY719uCcUkvfI6jBOolHIXtw4oQgtfbwy++tcjIYK6NRCf9Luqo2fkmnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZExnXoPF; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZExnXoPF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Kc
	cE0UiOp1COOiUg0EVK/qdNpx8ppDmv8Bqqchzc+Qk=; b=ZExnXoPFhGE+t8F2pw
	6f62++2BqwvdN16Swsa0LuEgCTWVOFLJoaa5sjD1xufrrlwpNriYWhbk+FRORi8/
	4trb7aZQot5FewfKF0NRP5Lm7gyrv7o6NpEbrMKSrZJwgZODZ6yiGCN+5gYA1NCT
	exAAgflsSzkow9Kb8M+Hb+Ar4=
Received: from zhaoxin-MS-7E12.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3HzfU1KRqD3HRAA--.37306S2;
	Sat, 12 Sep 2026 12:28:05 +0800 (CST)
From: Xin Zhao <jackzxcui1989@163.com>
To: vincent.guittot@linaro.org
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	jackzxcui1989@163.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vschneid@redhat.com
Subject: Re: [RFC PATCH RESEND 04/10] sched/fair: Add LB_PROMOTE feature to enhance real-time performance of fair tasks
Date: Sat, 12 Sep 2026 12:28:04 +0800
Message-Id: <20260912042804.3403506-1-jackzxcui1989@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAKfTPtBRLNWu6KyLs_=uLh7fwZpc5fEsGCwcSV2dCXuf6UqucQ@mail.gmail.com>
References: <CAKfTPtBRLNWu6KyLs_=uLh7fwZpc5fEsGCwcSV2dCXuf6UqucQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3HzfU1KRqD3HRAA--.37306S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zry8CrW7CFy3Kr4UCw47CFg_yoW8tF1kpa
	ySvFn8tw4kAa4kta92yw4xZrWrur4fJFy3Jr15Gr1ava98CFy5tF4Sgr13XanrGrs7Za1j
	vF4Fvw1Dua4YyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRTKZAUUUUU=
X-CM-SenderInfo: pmdfy650fxxiqzyzqiywtou0bp/xtbC6BUuOGqk1NVaGwAA3l

On Fri, 11 Sep 2026 14:32:25 +0200 Vincent Guittot <vincent.guittot@linaro.org> wrote:

> > Embedded platforms commonly use CONFIG_HZ_250, and testing has revealed
> > that there are numerous instances of unreasonable CPU idle events on such
> > platforms. Unreasonable CPU idle refers to situations where the CPU enters
> > an idle state for a duration of time (t), while there are tasks that can
> > run on the idle CPU and are not limited by cgroup constraints, yet these
> > tasks remain unscheduled for a duration greater than (t), t > 2.5 ms.
> 
> Which looks reasonable with a 4ms tick
> 
> The ILB fixes this at next tick and we have a similar version for slow
> path wake up
> 
> Also you might want to look at the newly idle load balance path

I have already thoroughly reviewed the logic of ILB before working on this series
of patches. Indeed, according to the current implementation, the scheduling delays
in a 250Hz can be explained from the code perspective.

However, when it comes to using Linux for real-time systems in embedded environments,
I wonder why we can't do better in this area. As far as I know, there are an
increasing number of players Linux for real-time systems. Sacrificing 0.3% of average
system consumption in exchange for eliminating scheduling delay cases of 4ms or more,
as well as significantly reducing cases with scheduling delays between 2.5ms and ms,
should benefit everyone using Linux for real-time embedded systems. I believe it is
necessary to consider merging this feature into the mainline for embedded scenarios.

Of course, there may be better implementations. For instance, I initially thought
about replacing some of ILB logic with hrtimer, which could trigger checks earlier
and potentially yield better results. However, the existing logic in load balancing
certainly has many areas to improve real-time performance. I feel that these
improvements are not mutually exclusive; at least we enhance the real-time performance
under the scenario where the LB_PROMOTE feature is enabled.

In addition to modifying the wakeup selection logic, I have also made some changes to
the load balancing logic, as seen in the subsequent patches 7, 8, 10, particularly in
patch 10.


--
Xin Zhao

