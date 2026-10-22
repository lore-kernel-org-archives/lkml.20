Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664255;
	b=tdoXshrNABOj7k60Jf3twgdGIVg3eW2t6eImwchmEV7nNrtQvu0ITO1w8rqbnNfMC+DV
	 zZd/TKXOmZVof5MRvSh5zY+D4JBE8EtP+D/BizD3uYadzZLIuVnhuKDsQ5xzmX9Arl7Aw
	 0kwdB0bDqE2+k9JuBbcS1u28IFItsCX3wmYtqigd+xlwOzxzrNNFZam3d3J/1bBIFCNw7
	 jIcLwLUDzMNdW9oGyHqNl4QfQ+iKvIR6sgGfkfv4pEAm4eJCBYVBCBC8/eC8pLhqxLNCp
	 AYFcFaJVVLoHqvNOe62+BQcoAteZ7w0MnD/uZp/0JPT3kehmaczbz+/xFQicJKCQREA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664255;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=R5p2WmOaJnvxgZOZD0MkthgtYxLLU9GyJMWgEtJn+Dg=;
	b=nWPbSAELxMFn5Ce7oQTzToRmaFL8EFCdrZoky4qQD+cqQigxbBIzmV0KQ7vs2nMPUBLO
	 zOsQzbr4wqIy65IOfPw/metgl6C7f7c7C/IXJerkseHNJabCMs+KxW8ivorWoQUCJYWEX
	 sgv6Se2C9Yy881Sf/vPSDsVueTklo4xtjir3cefOSbO+Q3bPKf3Aeq/6ymaHxmc0JiRIA
	 uLTsvAgor6do5g0ZULtdjr3b1dPVI2glnEeqXMbpYPQM5y+cZYRhkHMtOYMetzQLXmo7X
	 OQim9OigFuZm10ESDYCGN5JjbfOzZrWaYK/WAKnCZS5OEXKB3fBJPJX5/QmS/o6ARvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GGIuB3pk;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B448F606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B448F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GGIuB3pk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=R5p2WmOaJnvxgZOZD0MkthgtYxLLU9GyJMWgEtJn+Dg=;
	b=GGIuB3pkPzCWMkSuWeeuPIgDWB9YxclAbA6LmX4qApUvooUOj8Gxypx4EYh4Yu
	G4/48Rb+VfigryD+jcpGthyb4LDui9i+7YOU/U/uZX9oPZJmlncxQZxC8Yxb9RT7
	xuXKp+CLEqpVwARzC3+CDh6ukZLAD1XzW43YpbZDKU8lc=
Received: from localhost (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCX2nN74tlqAh6PBQ--.39516S2;
	Thu, 22 Oct 2026 18:16:28 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/pelt: Fix truncation of the PELT period count
In-Reply-To: <aa72774f-ad04-4733-8faa-0853a32c2e4c@amd.com>
References: <20261022034930.225042-1-sh_def@163.com>
	<aa72774f-ad04-4733-8faa-0853a32c2e4c@amd.com>
Date: Thu, 22 Oct 2026 18:37:31 +0900
Message-ID: <20261022183731.e4cd6c7848e5-1-sh_def@163.com>
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
X-CM-TRANSID:PygvCgCX2nN74tlqAh6PBQ--.39516S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOsjjDUUUU
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6RzoSGrZ4nx7HwAA3c

> Probably needs a:
>
> Fixes: a481db34b9be ("sched/fair: Optimize ___update_sched_avg()") # c079629862b2
>
> I would actually favor changing return type to u64. Since
> accumulate_sum() is only called in one place, and that too within an
> 'if' condition, I'm sure compiler can optimize it similarly.

Thanks for the review.

I will use a481db34b9be in v2's Fixes tag and change accumulate_sum() to return u64.

Thanks,
Hui

