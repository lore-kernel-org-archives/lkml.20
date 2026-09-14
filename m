Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17730486623
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399078; cv=none; b=YiA0QhdHztobHFZUbwMierMoEgiuRXd7SdUsd1vPpe8LL17tmzaE0aZTEpkFHAnRHD9qaJnwUREmUpA3cIZiaqC8jpA4/O1+/s0U+WZeLnTkJDcKnTDKlwQolXkr8ecpUXU9pSCpMdVYv/1bz6WFK+1aqQPWKmj7W6EtxA976N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399078; c=relaxed/simple;
	bh=4p/8dZs3srvNdXw7b3ULfSddGC0LGh/Qqm7QvfIqXWk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JfeULGlELmxlfNs7C5iE7RpMG4d1UrjgP3AL4CuL/PDw/aNQcOQWFtwKMqjkMD49ECO6tTvEvAuvZdUbi8xOtSshowpbEbTMt83PFfsj4RNJFckfNXGbqNa9QNWNJZ1lg6MXKt7vQC1ApnaA2bL0KdqDY91b29XrmZ6eG6pvxWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=LbmJlt2+; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="LbmJlt2+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=nw3JdVVxhS3CaRpnvLvEKJ55A6VPfmg8Te1wru8Z/pA=;
  b=LbmJlt2+vlzXa5t9WMj3zDqCorbtlG167dOPiOWz0Br1TxyNKNIt65at
   BDD4cqpEGoZ4urJzrUNbGbjiSpZ3GtusZ7SM4jMeYohp+xUABWN9d/0PM
   /NqUa1YrjTWAhcSPZOJpLfEyZV2y5Dy/wN9bwm/9Ipv9WoReQHpv5HRaX
   0=;
X-CSE-ConnectionGUID: Ca7JoidZRAi4Kc2aX3gJqA==
X-CSE-MsgGUID: OTWdthLKTcmIwUpd8ZGk8g==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,103,1787004000"; 
   d="scan'208";a="294886045"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 17:17:44 +0200
Date: Mon, 14 Sep 2026 17:17:44 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Joshua Crofts <joshua.crofts1@gmail.com>
cc: Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, 
    cocci@inria.fr
Subject: Re: [PATCH] coccinelle: api: add a checker for pm_runtime_use_autosuspend()
 usage
In-Reply-To: <20260914151145.1328-1-joshua.crofts1@gmail.com>
Message-ID: <c737384a-aad6-8ebd-a633-4ab354991c28@inria.fr>
References: <20260914151145.1328-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 14 Sep 2026, Joshua Crofts wrote:

> Add a checker for ensuring that pm_runtime_dont_use_autosuspend() is
> called in a file if pm_runtime_use_autosuspend() is called and its
> devm_* counterpart isn't present.
>
> Without _dont_use_autosuspend(), removing devices causes resource leaks.
>
> Assisted-by: LLM
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---
>  scripts/coccinelle/api/pm_autosuspend.cocci | 62 +++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 scripts/coccinelle/api/pm_autosuspend.cocci
>
> diff --git a/scripts/coccinelle/api/pm_autosuspend.cocci b/scripts/coccinelle/api/pm_autosuspend.cocci
> new file mode 100644
> index 000000000000..2354396d9344
> --- /dev/null
> +++ b/scripts/coccinelle/api/pm_autosuspend.cocci
> @@ -0,0 +1,62 @@
> +//SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Confidence: High
> +// Copyright: (C) 2026 Joshua Crofts
> +// URL: https://coccinelle.gitlabpages.inria.fr/website
> +// Options: --no-includes
> +
> +virtual context
> +virtual org
> +virtual report
> +
> +//----------------------------------------------------------
> +// Detection
> +//----------------------------------------------------------
> +
> +@has_use@
> +expression dev;
> +position p;
> +@@
> +
> +pm_runtime_use_autosuspend@p(dev);
> +
> +@has_dont@
> +expression dev;
> +@@
> +
> +pm_runtime_dont_use_autosuspend(dev)
> +
> +@has_devm@
> +expression dev;
> +@@
> +
> +devm_pm_runtime_enable(dev)
> +
> +//----------------------------------------------------------
> +// Context mode
> +//----------------------------------------------------------
> +
> +@depends on context && has_use && !has_dont && !has_devm@
> +expression dev;
> +position has_use.p;
> +@@
> +
> +* pm_runtime_use_autosuspend@p(dev)

I don't think you need the position variable here.


> +
> +//----------------------------------------------------------
> +// Org and report mode
> +//----------------------------------------------------------
> +
> +@script:python depends on org && has_use && !has_dont && !has_devm@

In this rule and the next one, you don't need to depend on has_use.  That
happens already due to the inheritance of the metavariable.

julia

> +p << has_use.p;
> +@@
> +
> +msg = "WARNING: pm_runtime_use_autosuspend() called without matching pm_runtime_dont_use_autosuspend or devm_pm_runtime_enable()"
> +cocci.print_main(msg, p)
> +
> +@script:python depends on report && has_use && !has_dont && !has_devm@
> +p << has_use.p;
> +@@
> +
> +msg = "WARNING: pm_runtime_use_autosuspend() called without matching pm_runtime_dont_use_autosuspend or devm_pm_runtime_enable()"
> +coccilib.report.print_report(p[0], msg)
> --
> 2.47.3
>
>
