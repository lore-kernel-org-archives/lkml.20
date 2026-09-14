Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB45F40F8ED
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376152; cv=none; b=YWpg7Ue5A+h15INzPkUfiXIo/Xwb0XVfsBJoxVTNiyvkbHs3qwY2VyAOP8tEm2xXCGxTNEj7j/7FEP+ahaFnsXx0vTpyRgbIhcIuqNWbJjOAlOe6yUmvEeDqeOHEWyTmMAmCN36OHlzMOMZNSjDKYppOmF+w8TXtQUr9BQG3Abo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376152; c=relaxed/simple;
	bh=E0I4+1zjVaGtHBBgVF5m2R5LFqDQLIExOzrMaDAt7Jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sSe0ENgAK1zwrIzsB6NtWXcUx3QaATjCDRjy0rSJkWw5qM2QAPDma2/sUfR32RJbZHbObXAokczm1f8KbdNLrBtlvsXo8IYdWpwO9eNhycfnveGRdGEtSPzSrxX9HBQz3ngTm95l3/sVISzikNAJkkwQYzMYvVtMT5WD/7yxCo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=gSgIJGF8; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="gSgIJGF8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rCSDCI54rDk5QxqbHLAUTAiw9+q7sYSzEssr70c74NM=; b=gSgIJGF86MBPrCmR4ME2td6ZYl
	Mn2Q+fT6F+U1OTWErEkV6MikSeHHRtlD2iwOTYO4wIkIgsNznXD4FL45ciWf5eSy2uWQKWrfyElfJ
	wJJB3NA8PYcQy0NU6X8zF0/eGVESEa6GVsocbgZ4q+n1VR+xTCyuQ08KB9/FfVzOhNItzHF6hROL+
	lKbg5FP16ye7U8au5nA5m3zsL4a6ArDDq+oI7DPwcm+F6OPI4yZDZkoeqoZmOCcIC2TkP01oviEzz
	EFxtDdh4J5XU36Ds2hIVcWfjsBiMLkwNAu0IIEFKMC+ezO1GxQCVIdE5LCwynEwIo4k2sIIhKA3v4
	9a3776XA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x62TT-003V4V-2f;
	Mon, 14 Sep 2026 08:55:40 +0000
Date: Mon, 14 Sep 2026 01:55:36 -0700
From: Breno Leitao <leitao@debian.org>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: tj@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tools/workqueue/wq_dump.py: Add busy worker
 inspection and BH pool states
Message-ID: <aqe2MTga350uAoos@gmail.com>
References: <20260911210625.535285-1-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911210625.535285-1-atomlin@atomlin.com>
X-Debian-User: leitao

On Fri, Sep 11, 2026 at 05:06:25PM -0400, Aaron Tomlin wrote:
> @@ -176,6 +202,40 @@ for pi, pool in idr_for_each(worker_pool_idr):
>              print(' strict', end='')
>      print('')
>  
> +    if args.busy:
> +        for bkt in pool.busy_hash:
> +            for worker in hlist_for_each_entry('struct worker', bkt.address_of_(), 'hentry'):
> +                for _ in range(3):
> +                    try:
...
> +                    except Exception:
> +                        continue

Is a bare except the right scope here? It swallows all other silly
exceptions, so a typo anywhere in this block makes -b print nothing at
all instead of failing. 

I would go for drgn.FaultError and LookupError, these two that are
actually expected.

--breno
