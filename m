Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793256846;
	b=vHkaPmdgPuhxxAfJNNHfVqW1DBDJx57HEvSDnUSQosuWQY2nGXcAiAAdLHL9UHu0YHWM
	 Urn2A93JxwdJx2lrqutCIxm/waBAq+LUSRlbSzZ6Pr4sXmoTks5K2A4cZDrCrh/qtCGPp
	 +ca0LA4/bGCnBZ6auxrt1BIZvAdj62qGKs3SzhGdtI2kY7JlwnVBBIViPJS+aPY3YSBsA
	 PkcKvHemo2nUGuDoedAwDJE5GC5rWdisalbaXh2CihjaQcxwTbA0ACFYnIeNW6D1QV2nA
	 0wrFGvSmBl2kt5Gg5G7bG402y1lRIGVepiWIXNkcNiXxKd3Y6C+6MozMW6tZKzdpPQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793256846;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Nrt2MHmmyL0EGLrj5sKuJiNd3KbCufFNQHr5Yh2LzD0=;
	b=FzoKcSsIuei3Kf4nPXHAumy62TF2TABckKobj7cT/0hbdYbg7T/Gex+58QHjbxnkv6MX
	 Qmps97HxzX6UHU7mswd9IEbJpq42tGkzj9Ho6raPD1M4uBcxuTQAElL52TaU3cXMcpfrE
	 aaDyKE9oLqDtgJ5krv0pq2TRJvrJpqaKxF2fjsDeflA60fDCZ3/w3YdsW0SLy78Owd55M
	 Cvl+7CKz0XCS7jO+SDgYgu4/SL9XdrkNmxS/bvbExZQB3eahhbtXnJQCSP+nF2Guht9yW
	 S8Wifkcsg2ZqAehI0f/RogqIXz1I58s7xq1y8Wah9FVPSrd47CSxLWMqk/UgtUILyEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=p7KrGyiy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC974606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=p7KrGyiy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28891F01825;
	Thu, 29 Oct 2026 06:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793256845;
	bh=Nrt2MHmmyL0EGLrj5sKuJiNd3KbCufFNQHr5Yh2LzD0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=p7KrGyiyFbD9sM4Rlwusp5lHcU8a08mSX+AQ093gw0/dLPiWE0vPL4ZX2HX3RRCvv
	 6beyLoiZw1o2Uelx6CBDIt5rgfXwnQkEh0/V/ZjsSdFVSNDOTuQ4Hs4/44vpCy4smO
	 F3vs9lsyRx0CeZR/3tObC2FxvHNaZhdG82aANyJY=
Date: Wed, 28 Oct 2026 23:54:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: mt4022@columbia.edu
Cc: Mani Tofigh via B4 Relay <devnull+mt4022.columbia.edu@kernel.org>, Oleg
 Nesterov <oleg@redhat.com>, Christian Brauner <brauner@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, tz2294@columbia.edu
Subject: Re: [PATCH] exit: use READ_ONCE() to read mm->owner
Message-Id: <20261028235404.2a24aa50c06556eaf77a033b@linux-foundation.org>
In-Reply-To: <20261027-kcsan-exit-v1-1-7c0429a29bc0@columbia.edu>
References: <20261027-kcsan-exit-v1-1-7c0429a29bc0@columbia.edu>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Oct 2026 16:09:23 -0400 Mani Tofigh via B4 Relay <devnull+mt4022.columbia.edu@kernel.org> wrote:

> mm->owner is written with WRITE_ONCE() when ownership moves to another
> task, but mm_update_next_owner() reads it with a plain load.  The race
> is expected, so read it with READ_ONCE() to match the writer.
> 
>   [   14.915975] BUG: KCSAN: data-race in mm_update_next_owner / try_to_set_owner
> 
>   [   14.916154] write (marked) to 0xff11000004471b80 of 8 bytes by task 71 on cpu 0:
>   [   14.916204]  try_to_set_owner+0x100/0x140
>   [   14.916302]  mm_update_next_owner+0x177/0x300
>   ...
> 
>   [   14.917246] read to 0xff11000004471b80 of 8 bytes by task 75 on cpu 1:
>   [   14.917293]  mm_update_next_owner+0x2a/0x300
>   [   14.917396]  do_exit+0x575/0x18b0
>   ...
> 
>   [   14.923906] value changed: 0xff1100002ec04180 -> 0xff1100002ed3a0c0
> 
> Found with KCSAN while fuzzing under a deterministic hypervisor that's
> currently under development.

We don't want older kernels doing this either, so I suggest

Fixes: cf475ad28ac3 ("cgroups: add an owner to the mm_struct")
Cc: <stable$vger.kernel.org>
