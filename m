Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7913F4829;
	Fri,  4 Sep 2026 04:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788496394; cv=none; b=P3FuhDJ7d2+kkWLEN1XnsGKfunOPMVJGucVsgMeJkXsS1mWzXzYdD7AX2GPp6FS2/Dk2+JCNx42f1l61a8EgJNdToNg5j3HSrARObjhsIx4aOxVbYc3acf80h/hs9W6xw/LkdmG4HTPZBl+5iqQpqBAeHRT012hF2iux0uq0hbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788496394; c=relaxed/simple;
	bh=S1wpIey1LIf3KW3c1ohWpFDjtvJ6te2Wr3CTsurDziM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwI7ivSoraUvL0xHV+NQQzRdSnSqsGL9VdC+rhSQcsU1Kq56R9g3Hax3my3P7y8TmMWx4L7eYb0GzDnVRZb8mHk2WJ2NzZNGVd0OwqCXONOKLmqt1A3vkSQKPYwEBWn5Vxqi5OmM6d6aPwdeMwXT5yNT7gSBM/CGyY/YE6WWwNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Q75l1nDA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q75l1nDA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 608B61F00A3D;
	Fri,  4 Sep 2026 04:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788496391;
	bh=i1fy+ptrE6B796HpcRl++4XXZqMSAzR4ZEF/kuOf2no=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q75l1nDAontnQnaQXiAir2oHpHYITXPV0CjRtjvG+DfxE9suk2rjMvTdhY+KXYjC1
	 hAZDPINxMHn/rSd6TuotAcRwABBcO6HZ+jjvQGbepo3WB/bmRoVZBFik8kDeDuGPFl
	 sCgJrWUkztQPznRMw2MO48dFKz5eq1w+P0nkmRs8=
Date: Fri, 4 Sep 2026 06:23:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: nicolas.giuliani@hotmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: use unsigned int in
 rtw_get_rateset_len
Message-ID: <2026090449-recycling-dining-ef77@gregkh>
References: <20260903-send-final-v1-1-e72dd23d65f2@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-send-final-v1-1-e72dd23d65f2@hotmail.com>

On Thu, Sep 03, 2026 at 10:31:46PM +0200, Nicolas Giuliani via B4 Relay wrote:
> From: Nicolas Giuliani <nicolas.giuliani@hotmail.com>
> 
> Replace the uint typedef with unsigned int in rtw_get_rateset_len()
> and its declaration.
> 
> This addresses the rtl8723bs TODO item to convert remaining unusual
> variable types. No functional change intended.
> 
> Assisted-by: LLM

Please read:
	https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh
why this is not a good idea for you to do be doing at all.

thanks,

greg k-h
