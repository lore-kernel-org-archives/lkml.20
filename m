Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E61B3C3438;
	Wed, 14 Oct 2026 11:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978352; cv=none; b=qgF/YBp+SXELF9T0bmuAP3jlNyr83YeUV+KO+atAzJok3pCD35NDkVM4xJ1E4OAyZwhF86OMsFTGt/kA06DvruupMZLiQPe77smy3MrLd5UM/xSKSGa9ZW+UGguoSPA7idSRHXfsSspWZPqyrImbSvvE/vRUvTrAzZEIzNN9GJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978352; c=relaxed/simple;
	bh=H7vRFpwPbpjw9AD0kixUiQJNc9zZicO0QemgJirn5gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qA/nRcvTP8tEa0bqkGozulvbORvewUZJR8l6+D1kJ1HFe9qwyLzHXufSr65WmOVlOuArMlFiRU+h1mQfkYAriK0RwXvHzAdIAMtnrR6hU0USb1JHKbNyYRvuiuV3T1AFLmPk8a7VBNG9GLGfepsM1rNxToxwZMyZOIhdmOfiPec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pltTUsOv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pltTUsOv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3901F000FF;
	Wed, 14 Oct 2026 11:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791978350;
	bh=TlCOeKNhIPOTJ05V3kzGLevIxfAxvJ45OWn5EOuyj6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=pltTUsOvf1cera9RmZoxBfhhKKphHfkNkO+r32Zh+o96oNC+d2Z7rxiVqwU8FvQQv
	 tr/GWSUlpRWt1KqqchMS0ZYP8NkBUb1LCFa9/pwjuO7S+PyyTANK3REaR1zZ11R7rV
	 BLgJ0+MxBvD8QKeJPrdhFzrVO8CbSIMMT+3bYgow=
Date: Wed, 14 Oct 2026 13:45:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ayush Yaduvanshi <ayush37735@gmail.com>
Cc: michal.pecio@gmail.com, Thomas Winischhofer <thomas@winischhofer.net>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] USB: sisusbvga: avoid prolonged initialization on
 failure
Message-ID: <2026101440-dislocate-subject-8aa6@gregkh>
References: <CAPgWTUQ5tYtV_YR7SDV7SRsDmvmxsgV5xOdns7Aq93Uy1kg9iA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPgWTUQ5tYtV_YR7SDV7SRsDmvmxsgV5xOdns7Aq93Uy1kg9iA@mail.gmail.com>

On Wed, Oct 14, 2026 at 03:32:18PM +0530, Ayush Yaduvanshi wrote:
> Hi Greg,
> 
> Friendly ping on this v2 patch. It fixes a task hang reported by
> syzbot in sisusbvga.

I have no context here, why did you delete it all?

> The patch was tested and verified by syzbot using the reported
> reproducer, confirming that the hang is resolved. Could you please
> review and consider it for usb-next when you have a moment?
> 
> Patch link: https://lore.kernel.org/linux-usb/20260907074308.109603-1-ayush37735@gmail.com/
> Syzbot bug: https://syzkaller.appspot.com/bug?extid=3bc656a9271e7c8a5c6b

I have 2000+ linux-usb patches/messages to review right now.  Please
help out by doing reviews of other submissions so that yours moves to
the top of the queue.

And for syzbot issues, for fake devices like this (i.e. no real device
hits this), it's _WAY_ down the priority list for obvious reasons (i.e.
no user will ever trigger this.)

thanks,

greg k-h
