Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD11041D127
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 11:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791027493; cv=none; b=MK/Ykx6szW46AQFN+bCZ67uQVMBKssYyC5yiQ3OiPX5LxnBy4ZnNsk6TSftjp0c3iWY7V/fkEcgJCPKiluZoW+hxYT5YNaPNy4EG8ZT+SbdR1dHWPAyapcz0sJl9EmesrWcORtI7HXGmxNuSXEHuXMnM3trEpjCfvesdhN2ZUF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791027493; c=relaxed/simple;
	bh=uerJt+4yR9QzWt20vwlKwGlwW4vH7uUnQJSh3W+kvnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kq6puz3Gct/sqVkkU5wCGeRJ+Hxx8rIR5EBHi1GVm2WHyt939UlIQWafKWM3EguEvU2UWWx8mOGt6G/64IRzlkAjrhFMHNEcYrCZADy3OpXwFwbpxS5fWBdUdhJvovwQr1gmPnpsDPZltaimP2qFZM7LQ5X4K0CeKxLz+SwdGa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rl9kZVef; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rl9kZVef"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD7A1F0089B;
	Sat,  3 Oct 2026 11:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791027491;
	bh=o+BISIME3G7NZS+CI9NJSVRGkLJDdvdIG5S94Nfrv8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rl9kZVefqXLCWBp0pGoayoDK/z6SOr/NmaR7j1TKDZfkylXuN/UbxCejzCRavDBam
	 CH0/0CdMrJf96uhCd9jAQD6K+dWuJJjrBqV407uHoTQOQMRRWcg+eZe8SSQBKdrqu9
	 a7DYTtFtMFgIXGjKim/0SJ71Gme8U7xRUbOzDYc8=
Date: Sat, 3 Oct 2026 13:38:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] Char/Misc/IIO driver driver updates for 7.3-rc6
Message-ID: <2026100349-latch-unsure-27f1@gregkh>
References: <asDpAk0A05UF8LLN@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asDpAk0A05UF8LLN@kroah.com>

On Sat, Oct 03, 2026 at 01:37:38PM +0200, Greg KH wrote:
> The following changes since commit fd73f4a6659897191fa0d40695fe370925dd3780:
> 
>   Linux 7.3-rc3 (2026-09-13 14:38:02 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tags/tty-7.3-rc6

Argh, no, this was the tty pull request, will regenerate it with the
proper subject line, sorry about that....
