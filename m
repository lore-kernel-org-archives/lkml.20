Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F9B3B5F48;
	Mon, 31 Aug 2026 08:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166478; cv=none; b=tJQhVDqr0ERjqVLqWYGrXNOdiSk1/8Eg3+xWHyeRg7Y8zlg8pgXZxMg4Kh9T8eaV7DckKGsWk1FL3zkIsUKoeyyR+r+KDR1G6gRFcT0qwHHSvBcNTL7OfARzRg9RWRttnsc9UwQd2MbMdfbKoQBjW19VGhwGcUq8ldQDYc8oQqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166478; c=relaxed/simple;
	bh=HxEi4w6S5uEAvinKngqNIXWrl7LYpZ6IRzfLopXqHr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ojqAGW31r/gNzZ+2i4eOa1DX0Z6cOudM0mA5+XRtAyx6WfavE5plELT7vNP7W0D2e6Hjsr6ho0sDYz7qnxSS2Fh2JcTzxjZ4S9MIpkxAda664784kaUuc6Nr0gVKrbYgbdAXlw0PxBmBaWbYWchoGA2vBKL/PQdXh2AHc5rzh2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0uYKLPQF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NvY87dtr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0uYKLPQF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NvY87dtr"
Date: Mon, 31 Aug 2026 10:54:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788166474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+9l07j+XrE45yygaX1SZLSGPig7JJ7yggHVg3vvZVqk=;
	b=0uYKLPQFG+W5FfDjGApELmS3bgGXwHOFq15JwKTll6muN/XCtTyOBx/utjaM143rhpmKSR
	7ZLz0SToK6/arRQtR+eegwL8c9GyIWQHyXepcU4gC+PVxBDUGg8Yf4CH4EKmUPnYoK0ZJs
	o9eDDIvdH7fL2u5J5OtTVDPKwBjpRYt3jXYYi9gnLXgrrXkEyFnk8yipoZ6yiWfOS5Dab1
	g+A8WJ54l3JwOkHFrQJQ+I/uIWS4GTJqNqc5I4bjw0aOUX6dQj0pzEXT7aHa4cl45WAoTd
	g5Vcmdk9ygYMAbLaXdWkH4bnTBBuGgW/ULuQjexLtwPgDCuNB6EnsiQokSB/kQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788166474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+9l07j+XrE45yygaX1SZLSGPig7JJ7yggHVg3vvZVqk=;
	b=NvY87dtrmvLFhFbTFw5tdYoqDcLQzUJ6EbhUUSicIwzgLttQq8MeQt/4il60LSCzNzVrPz
	N/3b/2jCR+os4zCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 1/2] doc: Change dynticks-testing repository name
Message-ID: <20260831085432.HdW_Nrqi@linutronix.de>
References: <20260831081823.67972-1-marco.crivellari@suse.com>
 <20260831081823.67972-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831081823.67972-2-marco.crivellari@suse.com>

On 2026-08-31 10:18:08 [+0200], Marco Crivellari wrote:
> Currently the documentation still mention dynticks-testing.
> 
> Recently the repository name and the tool have been renamed
> to cpunoise, so fix the URL.

(as of https://lore.kernel.org/all/20260815083728.15470-1-marco.crivellari@suse.com/)

> Cc: Valentin Schneider <vschneid@redhat.com>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  Documentation/admin-guide/cpu-isolation.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/cpu-isolation.rst b/Documentation/admin-guide/cpu-isolation.rst
> index 8c65d03fd28c..6d8f91d2d761 100644
> --- a/Documentation/admin-guide/cpu-isolation.rst
> +++ b/Documentation/admin-guide/cpu-isolation.rst
> @@ -354,4 +354,4 @@ Some tools may also be useful for higher level analysis:
>    runs a kernel tracer that analyzes and output a summary of the noises.
>  
>  - dynticks-testing does something similar to rtla-osnoise but in userspace. It is available
Shouldn't this "dynticks-testing" be renamed to cpunoise, too?

> -  at git://git.kernel.org/pub/scm/linux/kernel/git/frederic/dynticks-testing.git
> +  at git://git.kernel.org/pub/scm/linux/kernel/git/frederic/cpunoise.git

Sebastian
