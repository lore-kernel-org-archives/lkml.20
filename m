Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793324676;
	b=wEbrWrxr9YL+brltMNyDt1tSg7cc+/vQHL9PYQ7Ke/EOUDVYmDbot+D8ayvuC2/KAj9i
	 znWkR1Qw2hCgSx/AlH7CYbxwwbO/xSMmkFYGvbQWZo4lxuOcHwT1ChwQaEx1oXN5JtqGD
	 2ni9KJ2ngLpXRnFvmE//R77oNU2tT42XMCOGDG3l8pAfl3+p5pwgZC2jnolG4WNjZdwY5
	 0VFo21o5TRrqBGZqWoKUxH/Gn97u8pcozsOKVNekljCpdZb19HylZVWCAKcbWnHhiGPfz
	 FkLPJTvjzTuacDVZt0LrBR+J15wn3KNy9MFWFo3scBGYLp24f8pGb4quzkzAwtGZ5Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324676;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Sy845HGwISavlYeaQmf+u9/fjCcYSx2djFzOl0UdI70=;
	b=p1PyKQgjK06DEWfPkseWkICgmUva3cKrBA0zKVFwERMpQKdETz3HRItYXVygoACjPjBL
	 hBJTqyI1/qHROS50LcTaObGsbb1Sxc+6HkVQxc2KmTCmDjMElxHvwlutuAlW9rOP9LhMi
	 tUUUzZ6bPil+NfsQAkgHaVnyden3wiC2kNUSDOwDhaWQ2NG05ExKFnmUhtwJShwYhKLLw
	 b8RWgYIgJboRc6MiT3SI1t42uZXvFv1iflTujGPL9OamZ/oWUpPnqX7VwKO3QudUW8MuL
	 eDas6XLk37EPxNzZTIJe+CIqucdazT8xrhfBoJHg43T/+ciO8n0YJ/aCihJe0L4cG4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=esFKCSp1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4ED606A31A;
	Fri, 30 Oct 2026 01:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=esFKCSp1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BF61F000C1;
	Fri, 30 Oct 2026 01:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793324675;
	bh=Sy845HGwISavlYeaQmf+u9/fjCcYSx2djFzOl0UdI70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=esFKCSp1iSydhGyP428rF4cixhOIxf6jlstxUct2+P1uhubwgXe/5G98eQYiN3km7
	 QW+wEVAWtbtrsw08fjiI3VjLgu4iAgtDG//875XEYVsqGhVRg9G+uxwV/V2BnAG5C6
	 OAothp1h0ceHp0szI6+ljDCUrvVb3EgfCmDAg1Y3jWT4qgDR++Nm0g5TP2D0hiHNu+
	 0JwSxoAKkYAViEC4S2qFB4mDtSCzKrzfkHPIO2MtxkCxbwQTkw1T/+pyMTClwzrkTL
	 BlZ2uT9+9eysoxneIniqzc99DyA3Q9I+Wj9v2GQURA3FFc256bAvnW6kjPhayX01Oa
	 McWm9WON9xa8Q==
Date: Fri, 30 Oct 2026 01:44:32 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Scott Collyer <scollyer@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform/chrome: cros_ec_ishtp: report
 EC_HOST_EVENT_PANIC to userspace
Message-ID: <auP2gBtZPtL_CDRt@google.com>
References: <20261029203008.419808-1-scollyer@google.com>
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
In-Reply-To: <20261029203008.419808-1-scollyer@google.com>

On Thu, Oct 29, 2026 at 01:30:08PM -0700, Scott Collyer wrote:
> When the ISH firmware encounters a fatal exception, it resets and sends
> EC_HOST_EVENT_PANIC over the ISHTP MKBP channel. Register an
> event_notifier callback in cros_ec_ishtp to log the panic, invoke the
> panic_notifier chain, and emit an ERROR=PANIC uevent so userspace crash
> collectors can capture the panic dump and handle recovery.
> 
> Signed-off-by: Scott Collyer <scollyer@google.com>

I'll queue this after -rc1 comes out.
