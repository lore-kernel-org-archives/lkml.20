Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450FB48A8C6;
	Tue, 22 Sep 2026 18:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790103212; cv=none; b=JgPaZdwbv33c089g4/T2LEtY0jm8Ggjfrq0CyXdS2x0osu3Umv1B6OGrcv0jDLZFrRLP6evdA+BDs7MtvvOQaJtL2+aLLRQ3MRlaaOI+D5RAY4u+Thw1to8x7p/3ru0/on0MXFCNz9z/SuM8tynvfi+97q4w+fG0Ft9m/S2PpxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790103212; c=relaxed/simple;
	bh=CIIcSkzYwXi24cfovaSeHumuVQty0Ov8xfD/IM15JGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPtWJeDIG0w0sVOFQRyLll8eZ/+EWTbMNY3rWAPnKtfUJkiKx8bka5nx9cQB1/f+Je8DbFXa3xyuOa+ic7mumJAjhOu0jKXNsGpcXQ+XyDE6NrIur4OH+dffOL87R5AJAs7mL7GmNeqMInLhbbB5CKyfTFunFCSAc4U/D0zKZnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=U+nYSFiF; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="U+nYSFiF"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7BDDE40E01DD;
	Tue, 22 Sep 2026 18:53:26 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qckmCkf-qyAx; Tue, 22 Sep 2026 18:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790103196; bh=xW1UhcZHuNvGLgCiDvUvfUZYq9YVrwP+NhyvK6HeL1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U+nYSFiFDZHIgihnU03fCMxUK5/7N6xobYhMy9AkppAlept+6M5VBhMS6+Lgc79iV
	 ZQRwAaEM2kkgv+pewukoQDCUuM0FV6pOftSOOSbvpCLVA8dzyerdwabr6Z5Ri6sQPK
	 2q1qoOeqKsKaAaUAX/hWlschmRX1xee0Zn1IsvhXCWJmCOnbP41vkuKLOziVPkNX5z
	 CIwsvGs4WoUJQxwKzJg1HJmWnrTG50cb0c9xi9sqpn5Z8ZVz3zUAv4QcL32wUPKUpW
	 rAKAbedUs/eRMH9XoZU8uRfv4S/N56ICbzcboPGUX9M/MiwJeDtqreuuYWu90dw22G
	 aUZQ9ZX3LFGWrLomxFPhPZC36y36CpMLeWEeziebvdSKq3805trBQe3MNfjlbJOsLh
	 jFwe3rouKUA5gNHX51UY4CzgBXHqfHSNiqISMsotHdKirjKxHWjNfYLuVFRYgOTr5E
	 8B4eyysotkGycSipEcLfLnz7zQbnmgH+Widmv8QBfUmStxiLqGwZjnRAqi5NCZWPGx
	 LlsfbqMCc3fYirlrR5z9tEBugmFPA/EIqXgNsuF2d2Joa9zPr4NPi8Ha7sy6W5BUKf
	 fgxWer/8z8HMBTOVyLbq7sP8AZmspTYeodiSnkmEG4HqSyiCHdOw883CVzQ0Iy9sm6
	 StR3wqVU/aXS9miY7TDucoPs=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C897340E00E5;
	Tue, 22 Sep 2026 18:53:10 +0000 (UTC)
Date: Tue, 22 Sep 2026 11:53:07 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, qiuxu.zhuo@intel.com
Subject: Re: [PATCH] EDAC/i10nm: Fix mdev reference leak in
 i10nm_get_ddr_munits()
Message-ID: <20260922185307.GBarLOkzBqoqlD_mNX@fat_crate.local>
References: <20260916091251.1997522-1-vulab@iscas.ac.cn>
 <aqx5UOLpXdDnDsi7@agluck-desk3>
 <20260919053437.GEaq4e7SFEZqRzsjim@fat_crate.local>
 <arFVjp8k-3kvSkhf@agluck-desk3>
 <20260922045057.GGarIJMRAjfqj6mkhE@fat_crate.local>
 <arKX7O905e7yv3Ra@agluck-desk3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <arKX7O905e7yv3Ra@agluck-desk3>

On Tue, Sep 22, 2026 at 07:59:56AM -0700, Luck, Tony wrote:
> The "Fixes:" tag is a matter of fact. The "Cc: stable" is just an
> opinion.

Are you being serious here?

"CC: stable" is a matter of opinion?!?!

Tony, where are you getting this from? Please point me to the docs where we
state that, please, because I have never read it before.

Maybe I have missed that memo, who knows?

All I know is that stable folks appreciate and more or less rely on CC:stable
from the patch committers so that they can know to pick up the patch quick. So
CC:stable is actually a statement: this patch should go to stable.

Fixes: is just a tag that shows which commit it fixes.
 
> An extreme example would be a patch that fixes a spelling error in a
> comment posted on a Friday before Linus is expected to tag a "final"
> release in a cycle. A "Cc: stable" on that patch shouldn't trigger

A patch like that should *NEVER* get CC:stable.

> But if you want to add this patch to edac-urgent, then go ahead.

I want us to agree on the nomenclature so that there are no misunderstandings.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
