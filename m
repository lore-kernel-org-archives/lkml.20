Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DCF2DFA3A;
	Sun, 27 Sep 2026 16:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790527244; cv=none; b=C9ehOrRgfFe/QbUKOuMnOhkB1uEQk4Q8/HAryhhII0vnb2KAeoN2I+MAN4L8FBu4+5mi50Cp8VIUjHtr3gF5uYwvL9+tK05oWvswc4kaBjAEteUPBXVDn5pnBVRumVk7i2k7jsIdgYHkcUsA89zMo374mT/ry0FSnmlolBi4wL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790527244; c=relaxed/simple;
	bh=+c6jvSBjJKUoRoWIDllGQAot7LTNhcv0Sv4yg8kD/jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JD/Eg7NvF2iBdalynQeLrkBnKcqD0LTArwDvL9i9XJq2fg9b8Q7Di3pRMpSnITK/SHKxSD9VH0RPxhLhi5cxIfmSUa3X6uUeJEA5qsiupHenIK4kw43pWT5vCu3Hh6CfpHU7xHbk+O3H+vs6mfGkCKxvPwQo9a97X2Irsed2yas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JhWCk/UL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JhWCk/UL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD3281F000FF;
	Sun, 27 Sep 2026 16:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790527243;
	bh=hdSxhCJW5r+p08ucSTWCv//oBwOMAXPTnGrUabM0kNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JhWCk/ULHXEpOzqRpFHtcCMH/uZf4qL/teKrH/56kZUJDkP5BVRt9Oauls+cRlKSX
	 u70B6y29EXZqogvct1+yFFfnjXfRPmw+ntRVqtByl/WOO1TE9VesqCHX6y4k4sJltV
	 pl6vdSrORQXN2RT1sPcCS5wyC/3CNnr9h8E6kIjI=
Date: Sun, 27 Sep 2026 18:40:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Artem Shelenko <artem.shelenko@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: use unsigned int in HAL interface
Message-ID: <2026092727-ought-capsize-fb90@gregkh>
References: <20260926125150.161466-1-Artem.Shelenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926125150.161466-1-Artem.Shelenko@gmail.com>

On Sat, Sep 26, 2026 at 03:51:50PM +0300, Artem Shelenko wrote:
> The rtl8723bs TODO asks to convert remaining unusual variable types.
> 
> Replace uses of the uint typedef with unsigned int in rtw_hal_init()
> and rtw_hal_deinit(), including their local status variables and
> declarations. uint is a typedef for unsigned int, so this does not
> change behavior.
> 
> Assisted-by: LLM
> Signed-off-by: Artem Shelenko <Artem.Shelenko@gmail.com>

Please read:
	https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh
