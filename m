Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1751A6836
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550808; cv=none; b=Ri4tjv9DY1z/V7aW4s5OVyAR2xm4GlHnZSKWBdlgk0JyetMZH7B4NAa1ycwj7cMotJU/HSuKTmz8uguzKrtuUnM2s9vp5kfAinBu0mzCZ7n1UMkpCsinjHVPHlm8SBgEPFzdJTEXW8h7zR7xN6vRBLrlL/S24bbmQb31J5aQYbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550808; c=relaxed/simple;
	bh=ZhDAGP4z/j7L+5BsPP4VT1lZa9LlLvsZ2hIhgEn+s28=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aLMlwDzBQOpZ5rMgaK+HwYLC5UdfwCM2/rWHRwUABAjb8JlXx6NSuqKCb2eeGCjJlsCjejbgqYOWQF/fDx6qrTmxIb4k7hT7neKquQ76uZxv6m1HMb6kqQ2FFq2Pi7GR7YjY4hq8Kbf2hDQDdfVJNIjhmMQcGiVfyNcGd38SO2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=QWbhKT5i; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="QWbhKT5i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=5gPYh1PILLBPua+4FUFKvlxAAj8zmZ69ciB5o+SLKtw=;
  b=QWbhKT5iWIGuHfxxJzDorPq6aTgz/D3TXjLwxSylAR1JtNbxDZ0MhDzg
   aiTUkCT53PdrItik6di607mkTZTLqgxW7JMr7NaYKa/WIauG9gI6yvZCb
   dk5aFeA0+uvhSDVjlQF31xLWVQVR4vz62RiMcIbXabJBgSLewzrk8lhcM
   s=;
X-CSE-ConnectionGUID: ixZEMsjWTpqqRP/tFEQe/g==
X-CSE-MsgGUID: 9YN/MSkWSSeYMCYm06vuyQ==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,103,1787004000"; 
   d="scan'208";a="157066679"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 11:25:28 +0200
Date: Wed, 16 Sep 2026 11:25:28 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Johan Hovold <johan@kernel.org>
cc: Joshua Crofts <joshua.crofts1@gmail.com>, 
    Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, 
    cocci@inria.fr
Subject: Re: [PATCH v2] coccinelle: api: add a checker for pm_runtime_use_autosuspend()
 usage
In-Reply-To: <aqpflCAorrufh1i0@hovoldconsulting.com>
Message-ID: <2267e5c2-2ebc-398b-b95-a92dac549ce5@inria.fr>
References: <20260915064327.1377-1-joshua.crofts1@gmail.com> <aqpflCAorrufh1i0@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 16 Sep 2026, Johan Hovold wrote:

> On Tue, Sep 15, 2026 at 06:43:27AM +0000, Joshua Crofts wrote:
> > Add a checker for ensuring that pm_runtime_dont_use_autosuspend() is
> > called in a file if pm_runtime_use_autosuspend() is called and its
> > devm_* counterpart isn't present.
> >
> > Without _dont_use_autosuspend(), removing devices causes resource leaks.
>
> No, as I've explained repeatedly elsewhere, it does not cause any
> resource leaks. [1][2]
>
> The autosuspend setting leaks if you will, but that only matters in the
> theoretical corner case of someone rebinding a different driver (which
> will soon also taint the kernel).
>
> So don't exaggerate the impact, this is essentially just a cleanup,
> which is fine in itself.

Thanks for the feedback.  Joshua, please update the patch accordingly.

julia

>
> > Assisted-by: LLM
> > Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
>
> Johan
>
> [1] https://lore.kernel.org/all/aqpd3viN1UoZBkgL@hovoldconsulting.com/
> [2] https://lore.kernel.org/linux-iio/aow51Nk-cet9qaUQ@hovoldconsulting.com/
>
