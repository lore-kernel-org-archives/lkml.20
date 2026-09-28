Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCDC4D9F8B;
	Mon, 28 Sep 2026 14:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604830; cv=none; b=jX+xZCsc3QcKZWGsveHxyiW53JOZuO2HpRaTHfIzpUMOeQIuX7l2OvVd4kJJs9L1aSSAUwyxoVFosmH2zk4Y+Xr4nnQOepFgO3RLC2JPcfDS1nncdGS3nOnxG+HYz1BxR4V5lMMq9L+1E17J62XQkDZRb02KCK7Yt5M5Oqsgq3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604830; c=relaxed/simple;
	bh=V6TsRRrdjluTafdsXwTCiBNQWb1kZV90GnoliOvpVic=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gXhQo2RDNaoTxgPOqj/4rFXEDZL95wzOLBsgB880GEfIDKkAUWAkQXn8OZXGqR1N/XJoESTsmRc2jWddVQDVoGIjr4ZoGufmhWHQDzrYLDnoxKQvRmow3oNfmKcgK0YnC8cxcNKxRL+/k3qkppWCDMr7iO50M4Q67OrvE2YcO58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=XB7u/75r; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="XB7u/75r"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5FE75408DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1790604233; bh=zUwJv2tdW81fQQflEfwb7MPyWZp836AQCVxngFdoIVM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XB7u/75rMREAYx4kpfCVyRYsIAVWYDTfDlt3zsFkjdrJA8kh8B6ZvGpS5wrdOOsWw
	 BPdIv2LNrdbWiDMo0w9nZDUxy3k1KQF0Fd9rzLUZpwMldnF8k5V63dsY7qEVTb8OuG
	 bdWBiKZLiA3Mp61hx6/w/y13lXOpKc/nDQ6SrQMalysFwhIDRaFKlRU2csGkvIPzj6
	 QEfNnfl2jN0HmWMTliBVlO1fJ1zeL0j/E/y3Xa8sWDbgJL8FAQccScqB1tGP+Bbyck
	 U045Wr30ZVWt+NHcuYTWXF0pbLuP1ysucmFLA/FKrlem3pYr26+eTPDnLWTNge0Pjr
	 635/xvg0ZYJjg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5FE75408DB;
	Mon, 28 Sep 2026 14:03:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo
 Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Peter
 Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Quchaosheng
 <quchaosheng000406@163.com>, Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: linux-next: manual merge of the tip tree with the jc_docs tree
In-Reply-To: <arpymyOST1apXE25@sirena.org.uk>
References: <arpymyOST1apXE25@sirena.org.uk>
Date: Mon, 28 Sep 2026 08:03:52 -0600
Message-ID: <87tsn91nhz.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mark Brown <broonie@kernel.org> writes:

> Hi all,
>
> Today's linux-next merge of the tip tree got a conflict in:
>
>   Documentation/scheduler/index.rst
>
> between commit:
>
>   80c2913d0a06c ("sched/doc: add a preemption model overview")
>
> from the jc_docs tree and commit:
>
>   06a49ef784acf ("sched/docs: Document cpu_preferred_mask and Preferred CPU concept")
>
> from the tip tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc Documentation/scheduler/index.rst
> index d6d75421756ac,a43647b9706d9..0000000000000
> --- a/Documentation/scheduler/index.rst
> +++ b/Documentation/scheduler/index.rst
> @@@ -23,6 -23,6 +23,7 @@@ Schedule
>       sched-stats
>       sched-ext
>       sched-debug
> +     sched-paravirt
>  +    sched-preemption
>   
Seems like a fine fix, thanks.  It looks like we're running into the
"always add new stuff at the end" trap here...

jon
