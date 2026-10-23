Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773949;
	b=CHTZjYf5+0oUoUYpCY/0Dack8LiZZFlcExV7rQm/3aDKHftA/wFaLli6n4iNX/rvGfit
	 1BCSSmsgEnnmhFijv4TzjFcHtLyH2NdCNJeQFRoAbEk+mC1iAQxksiNoLkuEbBA3EwjDf
	 hWR6DoKMwganUTTAYOwMU8ptR6djEhcAnub33UBP7noOFQGEaXAgz2XNpAnTTZn8GsPMv
	 Mhb2PEtlCSqD51sRo2RcqeAL2JV+V5sP8MBKPjax5NbsBLeZbobfLBn9icINwrkBxxwkb
	 Qtsi1eKZ7ho8xY4dDmDEAmoxAPOjDo1ciDmLj+jVFkJoTGx31vOVjtHqpJgBbsCp6Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773949;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=movuaMkbpEE81Dn7E1kBKs6AhP0LUPbmy2HaKlbLKWg=;
	b=N05okIJP4YTgQ1/ZixyWGfa5OpE4fQas71ac7YezLv0g2IvhcAhgny16Yv5szbPqEPun
	 kXDYQ8TjEuzp5MkuBVITKwxLgNyEPvt0iD7MPlALb/igEXwuyyWVb2yOBkPxIHkg9GM73
	 BhIaPePndAOvYNu+PYjMAat1VhS0If+ZoX0r5GOvkWQXo8G9cIRDOTEcaEJLNZXbnGHnz
	 YsFZdW4lxmTOEimPvgD7qulDGGnEMnSt0j4L+bgaNYpVYeESAXMjrBFfpi3TTbJPa2vue
	 BAHvos72KeL51d9Z8iAxKsI8AqixK6aYr/bU5pkbfL6/xSTEkc9HQVoFiWKlDOt8vxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cxj7YVzy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E705D606A31B;
	Fri, 23 Oct 2026 16:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cxj7YVzy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2A91F01828;
	Fri, 23 Oct 2026 16:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792773948;
	bh=movuaMkbpEE81Dn7E1kBKs6AhP0LUPbmy2HaKlbLKWg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=cxj7YVzy6zuDfEsOYQTX2esaMGf5tEXfvxSOWXdHjjm3uU5ZmCkm9wzOKXMPPu7xd
	 ti/xFGFRXag+zDGdQkAOAArasEM1neSRbmqUd/n051uRj3rYvbQjU/jHHBkY0dCFwk
	 tWkIQC9YZ0MSgLQcp8htNps42L7AZezy1ZyCZtpVsUyBmYugu1NKLYPzbgYoy9nbcp
	 VvbOTJIENA3yIcmvBUq1+aRf2Y7J3rh1dPH+Ee+10UQVA8Vz0k3p5Xrr6tHmXQq3WQ
	 rJBMc7N4avd0Mnnj0I8yC85/C9bwaSd2LZxsL0MNmTfAbc2WF2dT2/f4TtxQ80JQ5N
	 q8uQob8HKxq6w==
Date: Fri, 23 Oct 2026 06:45:47 -1000
Message-ID: <dcb56290d3d9342958397ee75f915528@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Wilson Felipe Pereira <wfelipe@google.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuhao Tan <tanshuhao@google.com>
Subject: Re: [PATCH 2/3] workqueue: expose per-workqueue stats in debugfs
In-Reply-To: <p973h5idt9qm.fsf@wfelipe-west1.c.googlers.com>
References: <20261022155352.1293020-1-wfelipe@google.com>
 <20261022155352.1293020-3-wfelipe@google.com>
 <atpzgIOeEecUN9Qu@slm.duckdns.org>
 <p973mrs5tkuc.fsf@wfelipe-west1.c.googlers.com>
 <fa32d01cf66a6ca9818425f33bed0c96@kernel.org>
 <p973h5idt9qm.fsf@wfelipe-west1.c.googlers.com>
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
Content-Transfer-Encoding: 7bit

Hello, Wilson.

On Fri, Oct 23, 2026 at 02:46:09AM +0000, Wilson Felipe Pereira wrote:
> That's fair, I thought it could be useful to have a file interface
> exposing these stats, but BPF/BTF is simple enough as well.

If you want a file-like interface, look at BPF iterators. I'm not
necessarily against adding an iter/workqueue target but it isn't really
necessary either. A userspace program can talk to the BPF side and
expose the data to the collector however it wants, e.g. a named FIFO, a
tmpfs file, whatever.

> If you still think the other two patches make sense to you, I can send a
> v2 without patch 2.

The extra stats the patches add can easily be gathered with BPF hooks.
The in-kernel stats are there because we don't want to add hooks for hot
path events. For cold path events, it's easy to add monitoring to
whatever you want. An fentry hook on pwq_release_workfn(), for example,
sees a released pwq's final counters, which is what the retired stats in
patch 1 collect.

Thanks.

--
tejun
