Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A19259C976
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792173801; cv=none; b=W84Z+HAzNL9tGETOydHdHvxyVgMTA/ZMGbUngmfvpMQ3rFVVOqkKdWdWJwjPYYxBKkjeWoSDbajGaUXvOwnqEqixHYf+kxTnvtTDS8lyzK4yYIXHQ+S08FJPjKKMRA2fk0moVuGBx1MxkN3FbW4ccxrQn0K9F6pbTZgjCH3wfL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792173801; c=relaxed/simple;
	bh=eM9ao6oAulDPYd6UEPWg93GZGjjztqDBossYWkJDlOs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kAh/oHkNHhMgFBbP6Ljc6AAqhhuvnrJj6eyc+RscmBDZCzzSYUQngyCNcEQvOevRtAvVl0yu7+i9YRktGKwXI+Mwo+okPfuS7GZP3FOFcpnqul4GgszLX9CrMzzVEID/LpzqcjMWpBvamuVd+Zs8Cf4R29hsgYrYgkSzY24Vilw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N4ZYmPtx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N4ZYmPtx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459D41F000C4;
	Fri, 16 Oct 2026 18:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792173800;
	bh=sY/vzPRyUSmg3b8tgu+9E+2fgPSs9yvbJDS5kTRiN3w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=N4ZYmPtx87e0hxQTvy+D4P2kH1NpwFHRyec9xKfSxnNZf3//khZBY4xEkRK0DIxI4
	 g2aEqW1jgZv+e8JIW8PQ7pT1qa0qNcd4sFcdVCA/NE8vuOg0Ylof0NZESaKUIQVHFi
	 jDT2Z+tvYI+b34Q4pcYcG45ugteipWujnt43JeaU6uA4RTVCvFtv4xz5KnTGw5j9BO
	 mt34iej5Iu+Ws5J40TUfGHlUoYBU1WKrINvpUPYR+vOxyinRWVabR7Y+yoPA1ZU5BM
	 fJPb9bSZr1832yOJWlj6aHcSMyfYEx3vGc6kZ10WsQRu6X8ySZX+4TCcazjKFpHUV9
	 U4zLlXVwbjI1g==
Date: Fri, 16 Oct 2026 08:03:19 -1000
Message-ID: <2da5c0871093ae68069e60889a0481ca@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v4 0/2] workqueue: Make WQ_UNBOUND the default behavior
In-Reply-To: <20261015140148.231126-1-marco.crivellari@suse.com>
References: <20261015140148.231126-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello, Marco.

The following is a Claude-generated review.

On Thu, Oct 15, 2026 at 04:01:46PM +0200, Marco Crivellari wrote:
> Currently alloc_workqueue() make sure one among WQ_UNBOUND or WQ_PERCPU is
> present. This is enforced warning and setting WQ_PERCPU as default when
> alloc_workqueue() without WQ_PERCPU or WQ_UNBOUND.

- 1/2: The description gives the future removal of WQ_UNBOUND as the only
  reason. Can it lead with why unbound should be the default, as
  dadb3ebcf395 ("workqueue: WQ_PERCPU added to alloc_workqueue users")
  does?

  Moving the defaulting above the wq_size computation is the one subtle
  point. Maybe add a sentence on it to the description?

  The new comment says WQ_UNBOUND is final at that point, but the
  WQ_POWER_EFFICIENT block right below can still set it. The first two
  paragraphs restate the if/else. Maybe trim it to the ordering
  constraint against wq_size?

  unlikely() on the neither-flag branch now marks the path that's meant
  to become the default. Maybe drop it?

  The WQ_POWER_EFFICIENT comment in include/linux/workqueue.h says such
  workqueues are per-cpu by default. With this patch, one without
  WQ_PERCPU is unbound regardless of workqueue.power_efficient. All
  in-tree users pass WQ_PERCPU, so only the text needs updating.

  Typos: "achive", "alloc_users()" (alloc_workqueue() users), "ensure" ->
  "ensures", "neither flags are" -> "neither flag is".

- 2/2: The description says WQ_PERCPU is set for WQ_BH "regardless of
  what the caller passes", but WQ_BH | WQ_UNBOUND is rejected by the
  __WQ_BH_ALLOWS check.

  "the only permitted flags" dropped "additional", but WQ_BH itself is
  in __WQ_BH_ALLOWS too. Also, "workqueueus" typo.

  The new WQ_UNBOUND sentence sits after the "useful for the following
  cases" bullets and reads as one more case. Maybe move it to the top of
  the entry? Also, "Workqueue without" -> "Workqueues without".

  The Guidelines section still says "using a bound wq is usually
  beneficial", which now contradicts the default. Can that be updated
  too?

  Nit: doc patches in this tree usually use the "workqueue: doc:" prefix.

Thanks.

-- 
tejun
