Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2482475CF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791557705; cv=none; b=nBBbHdPUDtWpjGM8VjUJFLziKiU/1A42P748XWL2nNte7L6asAUUiTRFCblLJ2Tn71CD45dGJ6WXxto3bvY6QblSRSE9HhW4OB38MYWJAQkxXuImHORABo52ec/EKTHIFAZLmBL8KwUh/L4vWW8lPabWbDtYVAKir3KhO6YaDcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791557705; c=relaxed/simple;
	bh=xpzkyPucdK9WH//fTcjat/wSJgPqOYgSFtsenisWwSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xy5XDKMkpZzulRau7P2yStcb1eoeXSjGsoE6P1Tx9lAivWqLrck1S6MDOqvEbdgfWxMcgX2stsH92d/8iOrXbi7xCnb8VQaZVxScG6zSl6Nx3SqlbE43+9teOlrghEs0Fwj8lx92wP/4A8xcIoday51rDWrUTWNiPHlwcvIZyjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jPz/9Oq3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jPz/9Oq3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926771F000FF;
	Fri,  9 Oct 2026 14:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791557704;
	bh=bTYxgiFUGSaDhEj0Dz2NXjhRbwFYnDB5Dn/K02OWAwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jPz/9Oq3pXT2u8cHNBSKDR+ldBoOKRt5c9QGdJ7ZHVjoBk0vQw7caaBOwJ/+0l9Tk
	 y5urKeCrWn6UjIE3yreMQis94FzRN6hxeegHwl7Su1Q1pdSIsdomaZGILDTHzKkXeO
	 goQ7763sB4mSsSKqV3tocMA1bp131ho1XvnjdolI=
Date: Fri, 9 Oct 2026 16:27:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH 0/2] misc: fastrpc: fixes for 7.3
Message-ID: <2026100954-region-resigned-e211@gregkh>
References: <20261002101220.1084101-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002101220.1084101-1-srinivas.kandagatla@oss.qualcomm.com>

On Fri, Oct 02, 2026 at 11:12:18AM +0100, Srinivas Kandagatla wrote:
> From: Srinivas Kandagatla <srini@kernel.org>
> 
> Hi Greg,
> 
> Here are few fastrpc fixes for 7.3, Could you please queue
> these for 7.3.
> 
> Patches include
> 	- fix double-free in fastrpc_map_attach() error path
> 	- allocate entire Audio PD reserved memory in probe to avoid
> 	  userspace-controlled alloc/free and unbounded heap growth
> 
> Thanks,
> Srini
> 
> Jianping Li (1):
>   misc: fastrpc: Allocate entire reserved memory for Audio PD in probe
> 
> Yifei Gao (1):
>   misc: fastrpc: fix double-free in fastrpc_map_attach() error path
> 
>  drivers/misc/fastrpc.c | 192 ++++++++++++++++++++++-------------------
>  1 file changed, 103 insertions(+), 89 deletions(-)
> 
> -- 
> 2.53.0
> 

I'll take these for -rc1 sorry for the delay.
greg k-h
