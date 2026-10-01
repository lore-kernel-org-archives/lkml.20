Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B3F4DDB38;
	Thu,  1 Oct 2026 09:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790846361; cv=none; b=WOfz6qSym1A5dmbuzmPprPxcQ1FVh+R3E+5PA4sa3ALgjdyD1QnRU90oXWNesRDyeFV8Mia5u82OdyYjgn8eNS94l/GAcQG9INE58OaL5U5iJCn3No2uY8a4CyXGRH0J0tNP6OiXZTLrbCJBUAmiHWx93qvUqbHPsEDxHq/pMko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790846361; c=relaxed/simple;
	bh=1f3ayNH92AQGA+d6NX/xxygpywxEN7rSWbZQ+o8yCBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cISzY9JRm1Lv54hA69E130k15J7JWJVATk707VPhFRKkjFuJHP6swNLykhHW+obi5rVouQ9Q++TNcq5cYq+NRyHNr7Dt+wLnQn9zYUiWvAnha+DYmmha9dPsnBAL9FdjNhoz0beyyuukwCoInr2Rcsnd9YtjGb+S/1drI/UMysg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Fr16Gz5l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Fr16Gz5l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8481F000FF;
	Thu,  1 Oct 2026 09:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790846359;
	bh=rkBCGv8X8EgsQbqyaFsSMbFPbzcaxb2OzoA7RbNiWdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fr16Gz5lTOZlHnbl+NqdkswFG6oCnbUyLgm42UIIeuFwPWoNDb7W94rn5ltW+3IuA
	 ig1a5MtC1dJ+zncgeRD9BqS7VY1SnHioIGZvfkRs9iQFRTuXW7C6LSxeQUlaIYRBO1
	 mJgb1CO5shddH5na52O/F7R8EZp5Ii61Je+mN2Gk=
Date: Thu, 1 Oct 2026 11:19:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ashutosh Yadav <yadavxashutosh@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: add missing newlines in sysfs_emit
 formats
Message-ID: <2026100159-hacked-encourage-fe18@gregkh>
References: <20260925205328.59183-1-yadavxashutosh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925205328.59183-1-yadavxashutosh@gmail.com>

On Sat, Sep 26, 2026 at 02:23:28AM +0530, Ashutosh Yadav wrote:
> According to Documentation/filesystems/sysfs.rst, sysfs attribute show
> functions should output a single value and terminate with a newline.
> 
> Currently, gb_audio_module_name_show(), gb_audio_module_vid_show(),
> gb_audio_module_pid_show(), gb_audio_module_intf_id_show(),
> gb_audio_module_ip_devices_show(), and gb_audio_module_op_devices_show()
> call sysfs_emit() without a trailing newline in their format strings.
> 
> Add the missing newline character to each sysfs_emit() format string to
> comply with the sysfs documentation and silence checkpatch warnings.
> 
> Signed-off-by: Ashutosh Yadav <yadavxashutosh@gmail.com>
> ---
>  drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Please read the archives for why this patch keeps getting rejected :)

thanks,

greg k-h
