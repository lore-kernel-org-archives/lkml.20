Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D02E3B14CE;
	Mon, 31 Aug 2026 11:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788174447; cv=none; b=LF5KljmAq0rhLvkyVkKN/9HixZ9SQv1i0V5PTTql5itIpvDtsaxvowqJTfL0GG8eaX9AGOpmEQ+v+FmzTDAo4Uv6JoYF+plhjPfZfRU0SEyF9kHZ7CG78XGqmPxR9+7OfWItoA9+krwrPWkLwhQxRE86EaOlSE6kyUpU+gPg81w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788174447; c=relaxed/simple;
	bh=gMlpRe+PdoANGtU697DlQ7kGgSpcpQgonKGUEANMT5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DkSdV9PRsgdqO0PMwwAmRWXsDMDiC8WP7n6SLui59QPyDQdg5/FZsqYXmIEdoIJtHhZqmaU6Q79f5WfDhAI+jWbW5fKW6/xEXWuX22WrQl+jG+X+gnzn1j+MTlUkgwGOdYMyjvKX3hjywTdd25u5UhhwLHQD+47nysOxwQ7v23I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sllqzIG0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6mVtd1/9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sllqzIG0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6mVtd1/9"
Date: Mon, 31 Aug 2026 13:07:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788174442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L6OFCBbMNQARR8IabZt3/6uiu7EvXvEKzkuuJ+QsZ88=;
	b=sllqzIG0nkcKX/6Zyibc2zEx7X2xIYGCLghh3k1Zn4B8UKHqqItivTCEKS1RPbLnC441hn
	3O1aZA+DwcE+TtRDNq0FunDxyYgchiZEhecX67S1ivMECY6n3zOcaegKG/vPt0pRIKUXUv
	sJ1ok8mn3S389fCJPZndl7Y7sh0+EPzTq8aaHQLlYDyg16wlarQqEE+XsZ7rktQkuritj2
	Ub1WlGLFkMaATA/1odlT8RD8hbiMRzuyqO30NQZMIl45oCc3UM4Ag2ve985dBp9aoN0kUm
	jJV5zT86ZwAEXsvHjgPaB74CYeJXM9c7H3uqplhLqcK63l1cjvzjbg+TuTJIFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788174442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L6OFCBbMNQARR8IabZt3/6uiu7EvXvEKzkuuJ+QsZ88=;
	b=6mVtd1/9wn/YscGrjwPtOE7LsN2TivBreqKIYT1EwThQ3XsJB7K5h5OtLkhEOv3sUHDEBi
	t6pZVTam8g+Ju3CQ==
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
Subject: Re: [PATCH v2 1/2] doc: Replace dunticks-testing ocurrences with
 cpunoise
Message-ID: <20260831110721.2o3u-edi@linutronix.de>
References: <20260831092118.124576-1-marco.crivellari@suse.com>
 <20260831092118.124576-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831092118.124576-2-marco.crivellari@suse.com>

On 2026-08-31 11:21:12 [+0200], Marco Crivellari wrote:
> --- a/Documentation/admin-guide/cpu-isolation.rst
> +++ b/Documentation/admin-guide/cpu-isolation.rst
> @@ -353,5 +353,5 @@ Some tools may also be useful for higher level analysis:
>    latency and noise in the system. For example Documentation/tools/rtla/rtla-osnoise.rst
>    runs a kernel tracer that analyzes and output a summary of the noises.
>  
> -- dynticks-testing does something similar to rtla-osnoise but in userspace. It is available
> -  at git://git.kernel.org/pub/scm/linux/kernel/git/frederic/dynticks-testing.git
> +- cpunoise does something similar to rtla-osnoise but in userspace. It is available
> +  at git://git.kernel.org/pub/scm/linux/kernel/git/frederic/cpunoise.git

We usually do https:// here ;)

Sebastian
