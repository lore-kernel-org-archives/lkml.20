Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB04936EA8B;
	Wed, 23 Sep 2026 07:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150290; cv=none; b=S5Is1XUniLnwQVJuv3eO53eY22ZrYgV9jnsKBRU0FCBZIsyC4Rc+vjyXleUmTBV6fBaSqOzk8Wu0rsRVsVYJAJnmpCwthXJu4FHaUKlkJLC8nw0h8wQUyOiKoLUe5v8PjfEQmMwf03c1xCqCz20PC5yaNxSlB6WhUGFBYP7M32g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150290; c=relaxed/simple;
	bh=PQQ8RAB/kAqB3+tKoXKY/xURETVxDsB277sEZljSE+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NM6ZtJyVoyFvEvc/bKORzx1oyJMgnO5LJoZPTmkyWPRxiwwtLNstHIw+HhoPDcBXDAcNGn9jpLLqpGvbQZOS+ITr8PT/GiTiHlY81LhC8fwY910u6RMK7PBOxl6pJ1/fcFQwNlvho+sc8cFKeOOzSCHtJAYH0TsxDfiAJ327xE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vLOa6uWC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=x3mIvS1f; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vLOa6uWC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="x3mIvS1f"
Date: Wed, 23 Sep 2026 09:57:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790150281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pG49VwgvTIWeKaBbuIExKT2xmYrcuotq6trV20fovMQ=;
	b=vLOa6uWCxxiVUyP9vouKWKDlm6bHqa/tmNsi3AbagWNqktdiYlpj7pFZdkLHfR81nR16vz
	Ll6d14MqxgYpfnwExHebbhEvIt1V4Gk8qIdtokuJGwhSI6A1y+mRCRJgdr+itJofHy0fll
	/lfASG/VtZh1AG/wh8uov7IItDvP6ilXBUXa4Mak/DaTvS2ZJGfMgeRgZTGvzJvBvKCHGu
	s6oAmqwcjUcEpYV/6puxx09JN6Qa/TEHSU6xUQCtAn+DyjSAiPOeHB8qJcV5MICqXZ6BaJ
	csMnuCyvoH3UI5hKtx/YiYjAL96g+RYKXTN2SXdZM97JWTH+TqBPvosBVMnQpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790150281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pG49VwgvTIWeKaBbuIExKT2xmYrcuotq6trV20fovMQ=;
	b=x3mIvS1fzOWO87C1goWKh/fz872JCu54A+SxQzYYMk88VFw0z5qAfV5SNxZeydkHNYKXlU
	lWM36D586esDpaCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Quchaosheng <quchaosheng000406@163.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] docs: kernel-parameters: fix a truncated sentence
 for preempt=lazy
Message-ID: <20260923075759.yP8afpmP@linutronix.de>
References: <20260923075304.584348-1-quchaosheng000406@163.com>
 <20260923075304.584348-2-quchaosheng000406@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923075304.584348-2-quchaosheng000406@163.com>

On 2026-09-23 15:53:04 [+0800], Quchaosheng wrote:
> The preempt=lazy paragraph trails off: "One preemption is when the task
> returns to user space." reads as if a preemption and a preemption point
> were the same thing, and the sentence does not say what it is describing.
> 
> Say which point it means.
> 
> Assisted-by: LLM
> Reported-by: Jonathan Corbet <corbet@lwn.net>

I don't want to drag this any further but a Reported-by is usually
followed by a Closes: pointing to the report. And I haven't this tag
until now.

Sebastian
