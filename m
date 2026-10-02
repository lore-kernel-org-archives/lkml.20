Received: from mta0.migadu.com (out-225.mta0.migadu.com [91.218.175.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E548D4052B8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 06:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790923498; cv=none; b=DZ5KJtPuzVAoDfDHfNzt3eKGEKbA/JxwY2/w5p4JSPGtTFq0giu1Mk/vIMIIMTAApFYjJSz5C1OUya2rrWb2JGJJb5d9turTBIRIpX+4lQ3z5I2HaqpmV1GQmcwdUUsZMh7svbug7oYD1UwMhXtkK/KBBKPKnuf093xypwopXwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790923498; c=relaxed/simple;
	bh=FG3G5EHQ/BDjiLxln/wtrqjYmH9Jopa4k1oSLbYIXqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p2RCvVlQMBIma4DejoMrBeyF9sHu2cgRZ+T9HS5Y6DU+D68HZj627WrWTkQIm/jSu/0dDHIF0gX9YA9z+3OLAJJBf9J8ZpKzYp+AWOgT3utDuxiEqrT71ZWPTsiDzGnkDdqp1algiIsWwPT3SIuRhDRIdaKSTLKFb5emXPCrccY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=it2hXpzA; arc=none smtp.client-ip=91.218.175.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="it2hXpzA"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FG3G5EHQ/BDjiLxln/wtrqjYmH9Jopa4k1oSLbYIXqU=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790923494; v=1; x=1791528294;
 b=it2hXpzAI7mDrsm4l005nY7fODmI1+cN9RDTcGlUGv5zHw0XC4h2Uu1tvws7L8cZcfC3dtqg
 VzXhi0twRd6mWKgwwDUxwzBh4dttcoy9FXiFewuP+cAZb9+5s5MHSKIxawqoGfy0Ipl2PgEPPA2
 MqSZ/Me0BnGI46uimsWl+rrSZtU0Nmlvkl0ZpO2lBplIWPDG/1YnmK9yJ3SQrHwIUU9s39eOp3M
 Y6UzvE037DolVJoTACuyaZlg1skfKdeVaPELYipUHcudOPFLohKkRoc+v4Gwn20jWxlHoLsk26y
 MpojPwWhQ0kAb3c+My3uGg3PUpUT1B/NSzV6xsR690M0A==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 36942001d6a6b8cc;
	Fri, 02 Oct 2026 06:44:44 +0000
X-Mizu-Trace-ID: 36942001d6a6b8cc
X-Migadu-Flow: FLOW_OUT
Date: Fri, 2 Oct 2026 14:44:32 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn,
	si.yanteng@linux.dev, srcres258@furdevs.cn,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_TW: remove the unreachable plain-text
 translations
Message-ID: <ar9S0Oi7_G6uDJHO@wyuan.org>
References: <20260929131109.266535-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929131109.266535-1-chenyou910331@gmail.com>

On 2026-09-29 21:11:07 +0800, Chen-Yu Yeh <chenyou910331@gmail.com> wrote:

> These nine files predate the move of the documentation to
> reStructuredText.  Sphinx only reads .rst sources, so none of them is
> part of the built documentation, and nothing in the zh_TW tree refers to
> them; they can only be found by browsing the source tree.
> 
>   zh_TW file                          English original
>   IRQ.txt                             core-api/irq/index.rst
>   io_ordering.txt                     driver-api/io_ordering.rst
>   arch/arm/Booting                    arch/arm/booting.rst
>   arch/arm/kernel_user_helpers.txt    arch/arm/kernel_user_helpers.rst
>   arch/arm64/booting.txt              arch/arm64/booting.rst
>   arch/arm64/legacy_instructions.txt  arch/arm64/legacy_instructions.rst
>   arch/arm64/memory.txt               arch/arm64/memory.rst
>   arch/arm64/silicon-errata.txt       arch/arm64/silicon-errata.rst
>   arch/arm64/tagged-pointers.txt      arch/arm64/tagged-pointers.rst
> 
> Beyond the format, two of them no longer line up with the English tree
> at all: core-api/irq/index.rst is now only a toctree, the prose IRQ.txt
> translates having moved to core-api/irq/concepts.rst, and
> io_ordering.txt sits at the top level although its original lives under
> driver-api/.
> 
> As proposed in the zh_TW scope discussion and agreed there, remove them
> rather than convert them.  arch/arm/Booting was also listed in the
> proposal as a translation whose original had moved; being one of these
> files, it is removed rather than relocated.
> 
> Link: https://lore.kernel.org/linux-doc/CAKspUhJAbCWoxgh2eq8R5g_MiNK=oXgKPUWqGOpHh0w1-Fv74A@mail.gmail.com/
> Link: https://lore.kernel.org/linux-doc/ap5xEtMdwXS8Pvcf@wyuan.org/
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
> This applies on top of v2 of the contact-block cleanup:
>   https://lore.kernel.org/linux-doc/20260929115956.229610-1-chenyou910331@gmail.com/
> 
> That series still edits IRQ.txt, io_ordering.txt and the arch/arm{,64}
> plain-text files (3/7 and 7/7) so that it stands on its own; once this
> patch lands those hunks are moot.  That also answers Jon's question on
> v1 7/7 about handling the old files together with the wider update:
> they are removed here instead.

So please don't forget to check the sequence when applying this. :)

Tested with 'make cleandocs && make htmldocs', no extra warnings caused.

Acked-by: Weijie Yuan <wy@wyuan.org>

Thanks.
