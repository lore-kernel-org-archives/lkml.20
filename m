Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD53334C3D;
	Thu,  3 Sep 2026 03:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788406612; cv=none; b=VV4C0hKX6TsyZCCWngEKSt0MwEcXtPTHsncB7gL1uRBBNsj8uhDxeKOGFJH5vAo+gGPrwqm5P8Q2yMbMW4vT8QfmCxoxQanfubbhT9Vf+n9P8OyOhKwBnmPQUEspYOXKuGHx1rw1wRJzmPeBCJIsgmu9qslOhFLJr2pu+kapu8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788406612; c=relaxed/simple;
	bh=XhxBwDfUE4P+jO2J/XzoYbh5m+LywYasvNw8FgYhV4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d0bSQXl1R/HSmWN52UE1FeG2LRfGM1pRNqlUF8nj+rGyOCmzEKYy2nBschG2n7Ayp5mIuv3wvBTFA/6+plBu+g9eaUBnB5ERG0oKtWfmOKXUle1tyfowZdDDSC08uafBhAF3uM37YwbcdUASO3guKy7O3vKGT4rqQh72omN8n3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SKlG4fos; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SKlG4fos"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=2jK3EFka/duw445W9YVD+lZA1TtvuE7+SNQ5AWGQYsA=; b=SKlG4fosJbGQSwGprWAbGFA2xi
	d9EmODOoYyRzRLfkH7fN1YU/RCXAiEFY7AQMASxBCc/ruU8z3/MFPxWhczdJU+kK2smWZ5GrXUPBM
	HPsEekqcAd4LEXjiwR8gGC+itwCboCcYh5LkOG0G3m80gOzwtN32jMVTNFEOZt1OIaT6YK1opJqqC
	/GHhD79GgB2bjYVZh8rv6jB8TvBCEKN4fWqsuyK7V+WFYoiq1X3/GG7KOIZkD85ItG27KSxTPxh1F
	3VBYcA7QqIPndaDnjH2IRE15F3BCHSPGAywG5L/uK0l/N5IS9nGRCmgmW8CcvSozZxuzH4NE+hYHC
	Yt0rLdag==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1yFo-0000000GHl3-08lA;
	Thu, 03 Sep 2026 03:36:44 +0000
Message-ID: <deb7eaa4-99fe-49a6-adfe-17184660e0ea@infradead.org>
Date: Wed, 2 Sep 2026 20:36:42 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: arm: nwfpe: update stale document
 references
To: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>,
 linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org
References: <20260903025334.44666-1-diegomancera.dev@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260903025334.44666-1-diegomancera.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/2/26 7:53 PM, Diego Fernando Mancera Gomez wrote:
> The NetWinder FPE introduction still refers to README.FPE and TODO,
> which were renamed to netwinder-fpe.rst and todo.rst when the
> documentation was converted to reStructuredText.
> 
> Replace the stale filenames with links to the current documents and fix
> the accompanying grammar.
> 
> Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/arch/arm/nwfpe/nwfpe.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/arch/arm/nwfpe/nwfpe.rst b/Documentation/arch/arm/nwfpe/nwfpe.rst
> index 35cd90dacbff..b6ef46ff0f4a 100644
> --- a/Documentation/arch/arm/nwfpe/nwfpe.rst
> +++ b/Documentation/arch/arm/nwfpe/nwfpe.rst
> @@ -33,9 +33,9 @@ double precision and extended double precision formats.  The port of
>  SoftFloat to the ARM was done by Phil Blundell, based on an earlier
>  port of SoftFloat version 1 by Neil Carson for NetBSD/arm32.
>  
> -The file README.FPE contains a description of what has been implemented
> -so far in the emulator.  The file TODO contains a information on what
> -remains to be done, and other ideas for the emulator.
> +The :doc:`netwinder-fpe` document contains a description of what has been
> +implemented so far in the emulator.  The :doc:`todo` document contains

I prefer this change, but either ways works (same html output):

+The netwinder-fpe.doc document contains a description of what has been
+implemented so far in the emulator.  The todo.rst document contains

> +information on what remains to be done, and other ideas for the emulator.
>  
>  Bug reports, comments, suggestions should be directed to me at
>  <scottb@netwinder.org>.  General reports of "this program doesn't

thanks.
-- 
~Randy
