Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87D03AEB2C;
	Thu,  1 Oct 2026 12:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856775; cv=none; b=Xuz2QS0GJnmpcbOmQ2BuwEmlE3+TyURkdTiH/VYLyXAHzAChrgXTuuQUKH9AvP5TQOdfo0Fhjtp4/mKs8qIqU5ruHmvf/MlclpGdG4O2ERuaAE5JyIUdViM5qVEMwAp+kzV5KGBOWGwp7CGF2Byet8XWKrglm5MRqqHi6UJp6vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856775; c=relaxed/simple;
	bh=T1zMhamb/BQIoK0olKONGgyWxP2u3iDZ53oDWu2v4w4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9hGytbx813vnCHUlVyaWKSLalMJf4xHDCFS7SOSi4+RChsuOANSve30RN9h/6G1Cc/IyoHIeszFij2Y+E6GKB0DAjndcSEjVyo7k5WcqJil28JBBzrNYEukADsjMDLtR/upiq6KKLu4nwkn2g/hYk2pVuVznrqCoS0j37lhj9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BubYCJdU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BubYCJdU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8AB31F00899;
	Thu,  1 Oct 2026 12:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790856767;
	bh=VkZNPWlxbIj1LUkjyrcO1ALaG3qP5IA4k43VSRD7fGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BubYCJdUcMpFA5wC/zmRFZJ/CxqeVa5WYxXfbpXHeaQ/52KxSHjNJSQRh8IJiwjQL
	 tqIp21AltbaTc6LAghM4rLuJ97jPIifvtCPoVSoo6an7zd4MVxxQl3NhKY4wybOdeZ
	 AE69tEpI/RoepFTecHS7or2glkfvj0uF8gDE9ZBQ=
Date: Thu, 1 Oct 2026 14:12:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: use errno in
 rtw_register_tx_alive()
Message-ID: <2026100136-perm-morbidity-b952@gregkh>
References: <20261001100319.6228-1-dennylin0707@gmail.com>
 <2026100153-barber-financial-29f4@gregkh>
 <CAGEkeHcpZeHhpF2omgRx1wgLRxVoJJ90H-1t8FEJohMr_59b6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGEkeHcpZeHhpF2omgRx1wgLRxVoJJ90H-1t8FEJohMr_59b6Q@mail.gmail.com>

On Thu, Oct 01, 2026 at 04:56:43AM -0700, Hungyu Lin wrote:
> > Why are we returning success if there is an error?
> 
> The original _FAIL means the firmware is not ready for TX yet.
> XMIT_ALIVE has already been set, and the buffers stay queued.
> cpwm_int_hdl() uses that bit to wake the TX thread once the power
> state reaches S2.
> 
> _SUCCESS here lets rtw_xmit_thread() go back to waiting on xmit_comp.
> Returning -EAGAIN instead would stop the thread.
> 
> I should have explained this in the commit message. Would handling
> -EAGAIN explicitly here, with a comment explaining the retry, be
> appropriate?

Please do.
