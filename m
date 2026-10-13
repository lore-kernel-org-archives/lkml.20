Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA66513568;
	Tue, 13 Oct 2026 13:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898829; cv=none; b=EDIUJz0Pv8PDoZs1L7VM0eE7G86mdVYf5HXFrYq63lv39ED8AiiY3ELD02aQxmllk/w3jL5M0VBYiooQ5GVEMMN4qEhXO44kcja6rympwA0mNGFR/jfCU/InQHWPYGH/BjMKO2F3UcBEn/ild3ALM9QBHtu/YtlaGIwSwyTHhrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898829; c=relaxed/simple;
	bh=uje7o0BIMPxA5SvurRoEEawiGseQbDd1enGPyMeeYpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZ8fTkMZ2MBPZpjMdQkpusBoPPDyXXMDlAgFnfyZ43n4HIZwNFnI8mejRQSD4DUPet43IM/lRckCVzx4HXGi9Z/dftrfmMLqcTBxsJyju1QidrOuyBbVnB2/y3hUjv9j/z1GONxYpgm6WXH5CQU1N4OzgUA5Dv0SGjQ20nx4cdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PxhHALwQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PxhHALwQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC121F000FF;
	Tue, 13 Oct 2026 13:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791898828;
	bh=WTBxKRgzBzRkJC2FzfhVOVxvKNan9l0/V2ygI6GkHDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PxhHALwQciW5+qkMsIi3oQqE1PYgqNLn3ftnLI/0TeaBwOcby7ey8j3sXtVgcZn/I
	 by8/V7V4M9jq9YlUoDXhoXVMXhXiaGg00NCfgJewbvdXhrBzbgjitFifTJor5wpRKl
	 drV//BPiIwJVbhPVEm7EB61SZBEAH1NABi9Ma+l8=
Date: Tue, 13 Oct 2026 15:40:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Riccardo Oliva <oliva.scorza@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: avoid iterator variable access
 outside list loop
Message-ID: <2026101322-reexamine-astronomy-d4bc@gregkh>
References: <20261012034020.100737-1-oliva.scorza@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012034020.100737-1-oliva.scorza@gmail.com>

On Sun, Oct 11, 2026 at 10:40:20PM -0500, Riccardo Oliva wrote:
> In vme_slave_request(), vme_master_request(), vme_dma_request(), and
> vme_lm_request(), the list iterators (slave_image, master_image,
> dma_ctrlr, and lm) are accessed in the err_alloc error paths after
> exiting the list_for_each_entry() loops.
> 
> While the iterator variable retains its pointer value upon hitting a
> break, accessing list iterators outside the loop body violates modern
> kernel coding standards.
> 
> Fix this by referencing the dedicated allocated resource pointers
> (allocated_image, allocated_ctrlr, allocated_lm) in the error cleanup
> blocks instead.
> 
> Signed-off-by: Riccardo Oliva <oliva.scorza@gmail.com>
> ---
> Hi! This is my first patch to the kernel. I am learning the submission 
> workflow. Any feedback is very much appreciated. Thanks!

How was this found and tested?

thanks,

greg k-h
