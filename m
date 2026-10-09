Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD134C9DFD
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544068; cv=none; b=nODQXJbrTjf1D1o5u192NtYJLU+anfo4Uf7/MMwpjdH9w4UjufyCjgZkbOKeyDjkhVL7I3mPLdozYoBbrg0KUIVRSan6mzOOeoMLFZzPZ/Hv6fJkBMt5mQa7ww7EaYCQA603KBRlm9AY36bij23mGqLorupUeOpClCgGcRXz6hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544068; c=relaxed/simple;
	bh=/0/XU/+YZobH8AX9gxAFiI/JnBefCqsCMBtKQz/S/CU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/my/DfzTTHxJ3xLbjlnVNYjH7HONy9kN/lI1H0rLE6SZhlvfB6J0u7HbVmwPF2cLd0xcAeKqnEjfcAW6qLJcN1PxI7yHg29YStnaAQI7MwrJdYvyfUQiG/wdoJj4A3B/xF0sJjiLAYTW+YECyIJ2hWWXQVb3n+sKA3WhWxHmb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDU7cn51; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gDU7cn51"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C001F000FF;
	Fri,  9 Oct 2026 11:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791544058;
	bh=jFmWCi2up5vRqSBkWFUwHEbyNXCZg+vH8tf6YUwRZ+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gDU7cn51regFtSN9oMtRGZ+jprWSuvIKY6x1hSlPtwFlZjPUaI0yz40uNMQ2Wfjmz
	 VKZ9L64iEdFIoz0eox0QqJHZArTjAyNmW8QvxbwltRlrD5ZbUhbQdmZjR69ZeQhNAC
	 /gktJFy7HflqRMbMKAzYPxrpjvmxvX+QXHdjDvYNqwllodgsnUnUVPEH12AMnvWvr3
	 DwyCRHB07y7AKTVBo69yRYaKYvXGCtx/K35pVUGy4rvkBaTwhc3ykCzy5U4f8/gkjp
	 lnyB9vAKqt4lddMVYU6bh1idXculVyd4O8liGKAb7UQc8HEUutsbymVo4LAX4Afhza
	 vtoAiB05RaayA==
Date: Fri, 9 Oct 2026 12:07:32 +0100
From: Will Deacon <will@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
	=?utf-8?B?yJh0ZWZhbmlh?= Ion <stefion@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 03/23] cpu/hotplug: Avoid busy-polling on archs where
 cpu_relax() is a no-op
Message-ID: <asjK9JyBgopYxbyn@willie-the-truck>
References: <20261009100738.31288-1-will@kernel.org>
 <20261009100738.31288-4-will@kernel.org>
 <7ba9bf65e714a17657252a7fb267928f8215bc06.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ba9bf65e714a17657252a7fb267928f8215bc06.camel@infradead.org>

On Fri, Oct 09, 2026 at 11:46:11AM +0100, David Woodhouse wrote:
> On Fri, 2026-10-09 at 11:07 +0100, Will Deacon wrote:
> > Change cpuhp_ap_sync_alive() to poll using atomic_cond_read_relaxed()
> 
> relaxed.
> 
> ...
> 
> > +       atomic_cond_read_acquire(st, VAL == SYNC_STATE_SHOULD_ONLINE);
> 
> acquire.

Oops, I'll fix the commit message. Thanks. I think we need acquire
semantics here so that the AP sees anything published by the BP prior to
advancing the state.

Will
