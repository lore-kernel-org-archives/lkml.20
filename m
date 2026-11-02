Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634121;
	b=QTx5M6QTilgAb3nF8lPMBX6nqkEHpCxtDiOReJb6rrjR2cRAa/T3ZjoouZ+dlMpRxp6B
	 O2zF/TV8dYDdxUnBkbcbxCBpILYyUo0PCRa5JGZlypQcuqi0uZ7rt4Vq7YkPRoWHLEPNq
	 qnpX4t3Ek5ltStXV7M9wD06WzFxbZp5VAeKZLq+yrNX0F4jDFFNrts3L4rdOMRrxaAp1I
	 6vWi7fzie5Gr+rCmd17LyW19kLVthTrj8o0MesRjnxWX4ukjmuQgQgJMwz2arX5SDwz/o
	 fiq1WZi2KxZoYnSXf/Iw96Hgne8O5jA8DLOlO+haLnAqEOifJrcaPsceGN8vOggYTFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634121;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+JG3glGQRQPVFGCBIIL1zcMHB3LA7UiyiykG3wsLfoc=;
	b=qmNsB048b8QPpBKAu0HIvRs041awx382gWtXtROZUhCYmsvR3lHWf/Ydgka5r5+oyrwy
	 oQC7iCNJVDWt1i23SMaRWmJSON3W/bJsSnG7QzULcFLPSuXrKe4wtx4KfbXV7RH+auWbB
	 jQ1Pw8f+vjuB3IsqJG5mU8b3bI2GJfrYv5IUWH4wZ/UIAqq6UzC6CNiwip5ZJcnM+kO6b
	 fhQheoPX2j2f1ZgaJd9UMxcFbYNDkDfRlb8aYMBYI9LvhHGgFfLC3+Q0B0riZgZ4KOuw3
	 wrM4oUnXgMcLazhbMnijX9iIMG9+EA51m8f11RuXT4kLkwV+QNYATt27x5V8nf0Wr8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mt1wTyHx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D316076F88
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mt1wTyHx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7893E1F00A16;
	Mon,  2 Nov 2026 15:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793634120;
	bh=+JG3glGQRQPVFGCBIIL1zcMHB3LA7UiyiykG3wsLfoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mt1wTyHxcKpDBqXG3ONa0+k/qysAPkY+TnaIjFKEZpO9pkpGCJ8QjPveAD4oMciwK
	 CZWvqBXMvEVHK9zgYHsLW3xqrP6QlVDV6D8KVKhU0M2Yu2HYduYUEowKe6LyPwEEd5
	 aEXANeSH35ZSZEjgPsu9BImdWfK2qDf9H04mN967N0JxVAqdVyXrIA79cxCUw2NJiH
	 UI06lkVoKVbKvI6BTYVhSTWO6a18f28vCQHaKxxGtwAhtUTCQu5jI16N+3TmcNRGzj
	 6yVUiouRHYkI7yrcHR3VvIGUFWPFuJYSzo/AijXFF3ZgK5Cv7v9dNQdHI5J9LgpH3e
	 kCQo0T6GIa2VQ==
Date: Mon, 2 Nov 2026 05:41:59 -1000
From: Tejun Heo <tj@kernel.org>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH sched/urgent] sched/deadline: Fix stale rq->dl_server
 after a server pick returns RETRY_TASK
Message-ID: <auivR2mJzU7LqZm_@slm.duckdns.org>
References: <20261030221842.4071610-1-tj@kernel.org>
 <auUuuJnEI3HWkwYA@slm.duckdns.org>
 <auiU1kk009NDsT0L@jlelli-thinkpadt14gen4.remote.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auiU1kk009NDsT0L@jlelli-thinkpadt14gen4.remote.csb>

On Mon, Nov 02, 2026 at 02:49:10PM +0100, Juri Lelli wrote:
> > Ugh, please ignore this one. Sent out the wrong patch. I'll test Juri's.
> 
> uhu, don't think any of my recently shared patches deal with this case?
> :)

Yeah, this patch got sent out by me typing at the wrong claude session. The
original patch is incomplete and I think it'd be better for someone who
understands the code better to handle it.

Thanks.

-- 
tejun
