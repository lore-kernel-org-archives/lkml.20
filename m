Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE963271464
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789251473; cv=none; b=T6pvEsa6D/+g6Cv794yjuHHA6ChzQX5j6Cck9EOxx9bcOD1Rs1g7q4VwbiHf+YuYPIzU4hf7LhAl1BfiZLWW/H7WGYZ+t8CirfpQ4eP3g9r144mV21aJaLVf3S04kIolHXMLHnf8BvdoeCZSMdzrTCN/VACrMJPDgUFYqJTG4DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789251473; c=relaxed/simple;
	bh=SwRn8/9NeLAbz6nfG4kgMkrwtXmvOH/ZMBYXsOoJln4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jFcz1l6u3+VyIF8VR2R09MLfYQLO7atg/66EMwK8qu3Kzg0s93JWZzgYHeAwBRbKh+zsqYoDbNDyEWVlWLK2NUBhTlHwl1SY+3+kSmKAX9UwuwZk+iXoLOoji+E91mlUtMUhpJCDE0SLPM2uxJlKYAlxJmvqiXS0AZVpN12gAyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4cB28xt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4cB28xt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A631B1F000FF;
	Sat, 12 Sep 2026 22:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789251472;
	bh=WmXwYIUyXpKQ9HcSqAimt/VWxbB+Cgj3dES1VF+6sWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a4cB28xtNHwBnp5sWr5mScOz+JZ4MrImdH8aIR9JYFvMyTTywOl6/W7ak96dYIRQx
	 xHDKIHqoCFkkCdksS8gGPc7NfuWRo/8eUVkoQDiW1V/T+t/6jrUQH8tcma4+p0Fk36
	 DvjLrx4DQzDXQBYyI3gX0iQ2uayRKdkxito+RmhA51K6WwaHD+8oB0CDVLzASU19EB
	 0IdEBRMYc8Xtj2tr7s35ak/49QhajodqDHMdyXtOCujNaioqOGzwL11VH5dnjPYn19
	 po3I5JIMaRdqHaWcEyrDHfg5ZgUj097ib4TLwlJL5A6qFrfKHKRIZRqU6wE7GLyy5X
	 EpYMODk95WL4Q==
Date: Sun, 13 Sep 2026 00:17:48 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Hyunwoo Kim <imv4bel@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	John Stultz <jstultz@google.com>, Ingo Molnar <mingo@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [patch V3 8/8] posix-timers: Handle exit in do_exit() completely
Message-ID: <aqXPjNLjQPeADjWi@pavilion.home>
References: <20260911090341.949101445@kernel.org>
 <20260911090541.947206186@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911090541.947206186@kernel.org>

Le Fri, Sep 11, 2026 at 11:09:44AM +0200, Thomas Gleixner a écrit :
> From: Thomas Gleixner <tglx@kernel.org>
> 
> Now that POSIX CPU timers cannot be enqueued on a task after PF_EXITING is
> set and process wide timers cannot be enqueued when PF_EXITING is set and
> the last thread in the group is exiting, it is possible to mop up POSIX
> timers in do_exit() completely.
> 
> This requires to cancel an eventually pending POSIX CPU timer task work
> right there because do_exit() invokes exit_task_work() later, which would
> be acting on torn down data.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

-- 
Frederic Weisbecker
SUSE Labs
