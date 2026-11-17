Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=63.182.176.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925672;
	b=FPEfgb4yl/zKHVfem5OwzQ6o39aMb5Hus+tVnzyxDB2dEjxe8R9NfKH3mhsx2fV8X/xH
	 QQUlmjKjpfkIvjklf/A7PH3tira86krFIrtO9+Tf2W8YmpTv3acPI9sWmA6mIPl1ZG1pr
	 /Y0wn2gA0NzrQnQa47PZi/YRozQ+ZdlVSOuh+arw8SuTZG+4tQMSWjfUswqlB5DJkee9Y
	 eLMXKyauOX0HbxbKbO2IEIaHo4v9kUa+qR/SSTJZpC+1GsQYReCIL4b3m972bA7DrnHIq
	 W4KHa0WbZ3ep/PWYltqGv4AEYDfEegmUwqbDOnxcb3O2TznPHw4eyIo8WpPZ5z/OQYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925672;
	h=DMARC-Filter:Received:X-Titan-User-Uid:DKIM-Signature:X-AuthUser:
	 Received:Date:Feedback-ID:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:X-F-Verdict:
	 X-Titan-Src-Out:X-CMAE-Score:X-CMAE-Analysis;
	bh=wTIQg8CGUTk1dk7+W5hG976U4hy0/qIw0vNf4m67zQY=;
	b=3XC9H5Nod8oPaUqtIoAtTzG87xbkE+7OrRI7RQnvyoFi/n/Y7AVmEgNkAGUsXg33i3KT
	 JJAagShKFLJLXjvB/vjcYVF7E485a9E8YHZepGdp/M5ukAau5yLqdZRbWcucGKQGVZVpL
	 CdfZaGBo8lCQ/EYidSfrZFyEvw7OgbQ9C7k39PhfCpNUosLoobJKScNfruGWS8D3+WwtM
	 9zk3BopAhOxNhRHJf4ROF5eigHA6roiOHGsqOE97sGXrIO+F9EPxYB/D9aLbXyMXJR63W
	 0cqU10npCG9ISdUfVdfhqJTo0xCCJRiqduoz+9lmJOih3qhT9F1avmtO5tjOhc0JeFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=techsingularity.net;
	spf=pass smtp.mailfrom=techsingularity.net;
	dkim=pass header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=OEKwMgOR;
	arc=none smtp.remote-ip=63.182.176.48
Received: from mail299.out.titan.email (mail299.out.titan.email [63.182.176.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70100606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70100606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=OEKwMgOR
Received: from localhost (localhost [127.0.0.1])
	by smtp-out0101.titan.email (Postfix) with ESMTP id 4jTRsC13C0z3wYY;
	Tue, 17 Nov 2026 14:27:43 +0000 (UTC)
X-Titan-User-Uid: eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..5h6N_gEV1PSbge4J.L4AOEpde78rsmxg1zRB5AndRK7Zz-xNKQqcQgEk5oKf2kUhFIeYOkgnyu8MXmKzISpODhCTEHeY35BMNAmqzbuDH0rv86DOjHgFKD5GVSihoKVMHAzGJscSI1g.ZQYjx4wl6HIIuY5DE_1YUQ
DKIM-Signature: a=rsa-sha256; bh=wTIQg8CGUTk1dk7+W5hG976U4hy0/qIw0vNf4m67zQY=;
	c=relaxed/relaxed; d=techsingularity.net;
	h=subject:date:to:message-id:cc:references:mime-version:in-reply-to:from:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1794925663; v=1;
	b=OEKwMgORNMd1oUuavzBjiebkAqJMlSIsyWFYKKDB6RaDN/g6r5fqPobMMMmyXTf55gHt8Saa
	6aSq7kYNKoZMLjON8RFx/3cR/GbJm+AkoqczpPQnpWJh9vl4zP3S8bYcohFKkuaAZoSKVYfI0cR
	tuC4cTMnQG9cTdbj3NxxBUYY=
X-AuthUser: mgorman@techsingularity.net
Received: from techsingularity.net (unknown [84.203.211.233])
	by smtp-out0101.titan.email (Postfix) with ESMTPA id 4jTRsB3d6Nz3wYH;
	Tue, 17 Nov 2026 14:27:42 +0000 (UTC)
Date: Tue, 17 Nov 2026 14:27:38 +0000
Feedback-ID: :mgorman@techsingularity.net:techsingularity.net:flockmailId
From: Mel Gorman <mgorman@techsingularity.net>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Seiji Nishikawa <snishika@redhat.com>, Mian Yousaf Kaukab <ykaukab@suse.de>, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] sched/rt: Do not account migrate-disabled tasks as
 pushable
Message-ID: <avxht-AL1t6I6IXA@techsingularity.net>
References: <20261113160655.2909479-1-mgorman@techsingularity.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <20261113160655.2909479-1-mgorman@techsingularity.net>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1794925662911733064.2081352.1330428813606927922@prod-euc1-smtp-out1004.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=KNjj5FFo c=1 sm=1 tr=0 ts=6afc645e
 a=Rj3czHVBIg52I/sUK4DjVQ==:117 a=Rj3czHVBIg52I/sUK4DjVQ==:17
 a=Q9fys5e9bTEA:10 a=CEWIc4RMnpUA:10 a=-duorEnrxMLTQgzcNaUA:9
 a=PUjeQqilurYA:10

On Fri, Nov 13, 2026 at 04:06:55PM +0000, Mel Gorman wrote:
> RT_PUSH_IPI is intended to minimise latency and rq lock contention when
> migrating tasks to balance RT task distribution. The problem is that
> if a CPU is rt_overloaded but has no tasks that can be pushed then IPIs
> can be fired continually at the same CPU but fail to move any task due
> to migrate_disable() on PREEMPT_RT. A specific case was "pgrep" running
> at RT priority, its CPU being the target of a continuous stream of IPIs
> without any task moving.  While the pgrep can be bound to another CPU by
> the application, the underlying problem was that pgrep is spinlock-intensive
> which disables migration on PREEMPT_RT.
> 

I know the rate of scheduler patches at the moment is completely insane
but is there anything else I should do with this patch?

-- 
Mel Gorman
SUSE Labs
