Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73184480DC5
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162977; cv=none; b=SmyaZPhclo9cyYrNEgd/4TfRSmskYnO7winVBVag50EV94zYlvciVdkTltWOQ+3iuvFmc2txoSdPNbo9Pge2+nthjd6gHPDksDAxv88RsM55q8k+VIUGRbDifVR42Z/dL4pbTIp+yBUutrUskhIaQJBQOS6DHBBaSsTCFV8TnYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162977; c=relaxed/simple;
	bh=a0xk3YajHywC9avjEozHZZ6A+/qySorCdfvxzKH59OE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ttzRRbwfEES29QaY71lOfckAiGyG+Gpu2oLEF7kGWQUKZFYJuMgHjCjasgmd/SfNpNxQ+h+iBuVeTUTkMh5i7VuCY+qfxCS0HWUkQM+kneI1Ym0a/l6dywF9TcG7/HHRSwvNOM4YqT9Tx2lPtAFzrnxC6CeKNZRMCcJ0HLuKIfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=Lh92sB95; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="Lh92sB95"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2KsdMqZ/1ceRn84FGYoGIscLqbckTFraJKhu+lRTVy4=;
  b=Lh92sB95t4K6czsgcQurd2CvrZs2aboH5WRgN9zjYWnZ0wsklbmX2pLT
   lbuLqMgPSchYZJlSfhbRL12WMnXev6iV/+O0AM6N1iOInIJhVeDnbGtFf
   Hkru6AeDafzoqXWn5gtxAyYPWApjBZyffPLNl/8FUgIJ4t8U5BLYCrUpG
   I=;
X-CSE-ConnectionGUID: BF1m2EgaQy2T6AEPjM9i0A==
X-CSE-MsgGUID: nr0tW7UuQPePXMT/kgGiLQ==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,162,1787004000"; 
   d="scan'208";a="300604784"
Received: from static.host-68-71-1-178.nrbn.ca (HELO hadrien) ([68.71.18.178])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 17:02:50 +0200
Date: Fri, 16 Oct 2026 11:02:49 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: "David Hildenbrand (Arm)" <david@kernel.org>
cc: tab-elections@lists.linux.dev, tech-board-discuss@lists.linux.dev, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    ksummit@lists.linux.dev
Subject: Re: 2026 LF Technical Advisory Board election - results
In-Reply-To: <9fae8567-0943-47e2-a04d-4e75e1c0cb6d@kernel.org>
Message-ID: <21b568a5-f764-97a8-26eb-9b7fa0468a9f@inria.fr>
References: <a7f69e8d-1140-44b5-baf8-bacb8c30c01a@kernel.org> <f6c986a1-b3b4-4b0a-bf12-d98357fbc4e5@kernel.org> <51d0a329-e53c-48ea-876e-98208575b770@kernel.org> <75387e88-a2f9-4a33-97dc-45774bd23a01@kernel.org> <419fd819-75e4-49c2-9b99-1155bb214b47@kernel.org>
 <9fae8567-0943-47e2-a04d-4e75e1c0cb6d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Fri, 16 Oct 2026, David Hildenbrand (Arm) wrote:

> Hi,
>
> There were 1,107 registered voters in this year's TAB election, of whom
> 261 cast ballots.  The results were, with the top five being elected:
>
>      1.  Kees Cook
>      2.  Laurent Pinchart
>      3.  Dave Hansen
>      4.  Miguel Ojeda
>      5.  Shuah Khan
>     -----------------------
>      6.  Mike Rapoport
>      7.  Jiri Kosina
>      8.  Alexandre Belloni
>      9.  Nathan Chancellor
>      10. Cong Wang
>
> Thanks to everybody who voted and to the candidates for putting their
> names forward, and congratulations to those elected!

Thanks for managing everything.  The number of voters seems comparable to
last year.

julia

>
> --
> Cheers,
> The LF TAB elections team
>
>
