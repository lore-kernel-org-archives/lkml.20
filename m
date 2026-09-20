Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F933AF64B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789876259; cv=none; b=iATol0m2dzaWHba9wvcRaTnzDPuKF11+dSF8LKxuzDHoxuh+zdoRmQ0h6XQrJojYc4sdkihzNlDV6y8IrizKy95InTX1BrUgIuWM5DfGHanMOd64YRDApmOVqW0xDEs3ktpu2MIwaCx0VziILqP9KB7ffoxX+0ydqALJWloG34A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789876259; c=relaxed/simple;
	bh=VimQxhA3EWWFBobr9adhaDBrUGxNVsr5r7vWkZqI9JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVyTFFyVzFGlUXv5Hv+v2WzAbZ45WTs/hlasGgUBF81C4g9Ysoa80fs1IQzObTRRo5goGLrIDDzfI1CYaifOYWbQnlMrRByqm8bN68FA21Fsn0gGAAZtmzAxHRvvFDe3IfmDIDl6DLSAZv5ug6sP+UdwCY+cyus1DbSigxa3iGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/+xao43; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/+xao43"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B431F000FF;
	Sun, 20 Sep 2026 03:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789876258;
	bh=g6bmSytLuuBsemIueYJvvknOEo0NHwTWS3h67EnatE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l/+xao43wkbLlOq7KCMmGPwSjUGKYUweeLh/7217lntKXi1lLQKb81LgbWK46Llju
	 oCrOtScwUj7eUm+018l4s89EQcgv/Exy1DXUFgESkAx+/7pnrIIGnSgajJ1fh8vRZR
	 iPbemN37gNFb7kZtj2vaKf/EPHOX+Kbpjprz0svMPlJjkSASxyXfsXddy1ajctoKJ9
	 kKigWGU1Gy6zF64o9avn3Pb7gvWIoaVh5ji8hLNcW4m7PSxsTEKKRwZwui8kQAJF/9
	 Nj7ZZ9EaVZZhYzczqEwYpWqxLJS6JtPfyBXQ1cQsq2Eu5r3SY5v5YYCViU0+yNzNBO
	 6RIszS6eMpQrw==
Date: Sat, 19 Sep 2026 20:50:57 -0700
From: Kees Cook <kees@kernel.org>
To: Hui Peng <benquike@gmail.com>
Cc: Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] seccomp: restore knotif->state when
 SECCOMP_ADDFD_FLAG_SEND is interrupted
Message-ID: <202609192050.D1E0CD96@keescook>
References: <20260919203514.2580997-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919203514.2580997-1-benquike@gmail.com>

On Sat, Sep 19, 2026 at 08:35:14PM +0000, Hui Peng wrote:
> In seccomp_notify_addfd(), when SECCOMP_ADDFD_FLAG_SEND is set,
> knotif->state is transitioned from SECCOMP_NOTIFY_SENT to
> SECCOMP_NOTIFY_REPLIED before dropping filter->notify_lock and waiting
> in wait_for_completion_interruptible(&kaddfd.completion).
> 
> If wait_for_completion_interruptible() is interrupted by a signal before
> the target task processes the kaddfd entry, seccomp_notify_addfd()
> removes kaddfd.list from knotif->addfd via list_del(&kaddfd.list), but
> leaves knotif->state set to SECCOMP_NOTIFY_REPLIED.

Are you able to construct a regression test for this so we can catch
this race if it ever gets exposed again?

-- 
Kees Cook
