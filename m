Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A6C2E266C;
	Sun, 20 Sep 2026 05:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881296; cv=none; b=eiDEz/LhGjtq5x8KgJIEZdGuW9fNd3J5hQEOR/dpJX89u/+4iBH6+0Q2QEctSOkF/62DUtkQzY13sF//G8pjpxnChpwVMuJk3qBA3hNNtDUbctQFOP9d5s6fHiYQdeFVK7EhIKGbI2P5ziXIGv46eXaCQj/nm4pWx/FXMnQXjV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881296; c=relaxed/simple;
	bh=SIRfcLHOoC0iFIkptgKEo6TeqlwI+zQC9UBKjEZDlvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6QNTuv4Vj1xhBf72HlCBXhJQ2E2VhcF69J0fB/qKjhlNsHizj/3cxNMynzpciVJTJRqNf5Z9EmJpuuVfTi4VAuPh/GOQDc/DeOspZERntIBs12vLJYvbC3l8/s9STIFsGcU0m5GrBdTfYCgMpWaCSVJRyjwgeibJ8axb/cp5Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Oz5ZBaFu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Oz5ZBaFu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D051F000FF;
	Sun, 20 Sep 2026 05:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789881295;
	bh=89Tu6IFCyaknx7gRn+I3jzWGe3j0hRHsUrVcwt7MI/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Oz5ZBaFuKuFoKn0Vbma3EynwD+efxK/w2F08jKuMWBc+Z3LKRJ8HpAUvNFRpuKXsW
	 E9PpfPBk4TNfWc4BmTLpKkgcsL7IRzLz3lwNOkknJdLG/rgkCwAXi9ZXtC2pBFUMKU
	 KSfKPl3Fskzn6HIW7PElobAQVfrDEkGyEOSjOmN8=
Date: Sun, 20 Sep 2026 06:12:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Hui Peng <benquike@gmail.com>, michal.pecio@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: fix descriptor parsing OOB, port/bos locking,
 and devio/ledtrig races
Message-ID: <2026092024-illicitly-battalion-852e@gregkh>
References: <20260919223518.3890208-1-benquike@gmail.com>
 <0bc9c10f-6b6e-429c-a625-d34b12aaf2ef@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bc9c10f-6b6e-429c-a625-d34b12aaf2ef@rowland.harvard.edu>

On Sat, Sep 19, 2026 at 10:21:33PM -0400, Alan Stern wrote:
> On Sat, Sep 19, 2026 at 10:35:18PM +0000, Hui Peng wrote:
> > Fix multiple memory safety and locking bugs in drivers/usb/core/:
> > 
> > 1. In usb_parse_ssp_isoc_endpoint_companion() and
> >    usb_parse_ss_endpoint_companion() (config.c), check remaining
> >    descriptor size before dereferencing desc->bDescriptorType or
> >    subtracting desc->bLength.
> 
> I have lost count of the number of LLM-generated patches we have 
> received trying to "fix" this "problem".  Try asking your LLM whether 
> this change is really needed.  (Hint: It isn't.)

Yeah, I've started using it as a "test" of new llm models/frameworks, so
far they all fail on it :)

Hui, please slow down, learn the codebase of what you are submitting
patches for, and the development process better before flooding lists
with tons of patches.  That way will only get you ignored.

thanks,

greg k-h
