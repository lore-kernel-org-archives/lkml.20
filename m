Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AF03CC9E9;
	Mon,  7 Sep 2026 16:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788798713; cv=none; b=OIpuIVlRgDGDmy8NXsPRLWp13pKGDoaLOu6Imud0Z1q7D8aj2/5iHqpHMXGqX+Uw2fVSIwWXppldmm+J2wtXS6yIt1HavAEdU44yUhiAqwmA4XXAV20NpohWRLGgCpeFfxIx7eMBVvHWnXEdQR9y1/ImYq81lJlMRdOcagZYjoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788798713; c=relaxed/simple;
	bh=eZXD/P9LluAzOazUf6+h6XyGb8Ys8HHx+knkE1GhQSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWWWkSO1IaKDPWp2S7PGq2kyjeHLpbJ8hstiklmAGQawOnCG7fhEvXSfWkQKkqqvaN4nbKWOntn0lViXEoJIzYucca83NTYuKnb+zu5tOhzSP9X6Aj1WymqYUeGaFJuPTApN+4TuAcY5FhEDRFMcC7kg4KRdUgukLznZQhsT2aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XjYB9khp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XjYB9khp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A321F00A3A;
	Mon,  7 Sep 2026 16:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788798711;
	bh=TjyaUJiP3lg09Bx1f6CD0MRFIthZ/KH570FKw2fR5bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XjYB9khpM+XIwt0WP6ZMHHayw2AjN+zdKDtfZtHaEu4lUaTJ5RpUy2B3pVAwvYOHj
	 d5+c0tfxn3SKZXnq8wbuKRlie13m1I60O9/iejap0vpJUkB7DfElalXS/ruH81jodE
	 Wuu/oexNY/mgw2kPzWupsj8lw+/eu8izwm/tiyGo=
Date: Mon, 7 Sep 2026 18:30:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix comment formatting for
 pintf_dev in rtw_io.h
Message-ID: <2026090744-jolt-unnamed-8d58@gregkh>
References: <20260905-rtl8723bs-rtw-io-comment-v2-v2-1-ee5791206cdb.ref@yahoo.pl>
 <20260905-rtl8723bs-rtw-io-comment-v2-v2-1-ee5791206cdb@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905-rtl8723bs-rtw-io-comment-v2-v2-1-ee5791206cdb@yahoo.pl>

On Sat, Sep 05, 2026 at 07:23:45PM +0200, Tomasz Unger wrote:
> Add a space before the comment, remove the stray space before a tab
> inside it, and drop the unnecessary parentheses around
> &padapter->dvobjpriv.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Dan Carpenter reviewed the previous "space before tab" comment fix
> for rtw_io.h and pointed out two more issues in the same comment: a
> missing space before the comment itself, and unnecessary parentheses.
> 
> This v2 fixes both, per his review.
> ---
> Changes in v2 (per Dan Carpenter's review):
> - Dan noted there should be a space before the comment, and that the
>   parentheses around &(padapter->dvobjpriv) are unnecessary. Both are
>   fixed here, in addition to the original space-before-tab fix.
> - Add an Assisted-by: trailer disclosing AI assistance, per
>   Documentation/process/coding-assistants.rst (the original v1 had no
>   such disclosure).
> 
> Verified with checkpatch.pl - no new warnings introduced by this change
> (and removes a pre-existing "space before tabs" warning on the modified line).
> 
> Assisted-by: Claude:claude-sonnet-5

Please see:
	https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh
