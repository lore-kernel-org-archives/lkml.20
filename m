Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72993955C6;
	Thu,  1 Oct 2026 12:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857494; cv=none; b=ubI7B9aSFcLTEfFflowQA+b2UY322xz8dJLLWsGpCHLZGSYxKM5c9XAHcdP7n6wX7z129MiK10szLS7TpKkM7WrF77xx+OnmaP0yKHndOUaDjgVRQO7GTyZSA6N0Jmzg5yoW0vsrdnu/GueO5GWiP/ZrIWeHo755co2sil5iO8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857494; c=relaxed/simple;
	bh=secNTpv1/TPBfWQDostshxPd2pl7FZieOi6AXduT0E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flQwcVZejtXLZlox9VE6cErJUrdePVBTFK6Ii46wIDDcBHLa5jm3iwLSnhdhAOSUMH+F5d73r09bhkJfEZ9882xzwidE7wR1203mUbsB3zeyR7glPzlmyLCqJ3cFyUgXaXJxGqAOlSPsK90q3+wGniEfIzGEsNAven0tTGAXOgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KAdobPQz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KAdobPQz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254661F000FF;
	Thu,  1 Oct 2026 12:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790857492;
	bh=pivXs6aVmlz2vueibMPxsnFXnkdBJDAjs5lF5QmTTm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KAdobPQzHkc1Kwm4WKLhFJhOZzXwbRbgjA5pBEwBwlGhm1YtHsc0V8/9vMoVNAnN4
	 ne7oWCUL7sALbkgP9LQXoDhPulHcXfwZVaMM2V1E9KbreJOmblD79nJWOPaUupR4KX
	 lyhjOQRjk/gDAHEViNzZKX2SaPwxWR1ImTrhCecY=
Date: Thu, 1 Oct 2026 14:24:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ronit Gupta <ronitgupta138@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>, mgreer@animalcreek.com,
	johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio_manager_module: Add missing
 newlines to sysfs_emit() formats
Message-ID: <2026100118-banner-casing-56e0@gregkh>
References: <CAO=9wt733yd9Z6nUbV7awHoQPuu-4eAHWnH10k-OMhRrW1bs3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO=9wt733yd9Z6nUbV7awHoQPuu-4eAHWnH10k-OMhRrW1bs3w@mail.gmail.com>

On Thu, Oct 01, 2026 at 05:43:48PM +0530, Ronit Gupta wrote:
> According to Documentation/filesystems/sysfs.rst, sysfs attribute values
> 
>       should terminate with a single newline character.
>       Add missing trailing '\n' characters to the format strings of all
> 
>       sysfs_emit() calls in gb_audio_module_*_show() attribute callbacks.
> 
>       Signed-off-by: Ronit Gupta <ronitgupta138@gmail.com>
> 
>       ---
> 
>        drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
> 
>        1 file changed, 6 insertions(+), 6 deletions(-)
> 
>       diff --git a/drivers/staging/greybus/audio_manager_module.c
> b/drivers/staging/greybus/audio_manager_module.c
>       index dc90cc2d2..5737f2a32 100644
> 
>       --- a/drivers/staging/greybus/audio_manager_module.c
> 
>       +++ b/drivers/staging/greybus/audio_manager_module.c
> 
>       @@ -75,7 +75,7 @@ static void gb_audio_module_release(struct kobject
> *kobj)
>        static ssize_t gb_audio_module_name_show(struct
> gb_audio_manager_module *module,

<snip>

Something went really wrong here, please take a look at the email
documentation in the kernel for more details on how to do this properly.

thanks,

greg k-h
