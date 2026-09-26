Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583E438BF7A;
	Sat, 26 Sep 2026 10:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790417920; cv=none; b=ZqBkL14b1GXFtgXDXgKoXqRMvedWvbm7I93NXCf3kJEH1shhWj6RnJTwpPeAfT00ZRydG5/oxzNh1z2a5C4JxtA1fx+X78StZyap5foGJE6wsvxrcXzhrQaZBGpukebuROCS2KeGhy9XeRi9A1xEcU35rZA7wuvdSZiR9D77TLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790417920; c=relaxed/simple;
	bh=koxNS8eQLTZC4Hkw1erNLLgpHyVN30inKtmKLYfV75E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKLLlPQRhx1kmMAaauQBlvXTIGWeGqKUu3Xc6v3u8n4seZZFZ+jesRzOkymaV77Uh8jGtbsT2p8GwIVlmbYIPqcp3PGwEGKrB8Qp/Nd/MZ4fy2kl/FkgE3hAZgQci0gWj7wAXUQZKtLrenwxv+jowA/DBkFpKTNMMfZs4Epnhdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RNnd0DUU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RNnd0DUU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E441F000FF;
	Sat, 26 Sep 2026 10:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790417918;
	bh=wEhsOn0MHBgu2cx4PsskVvMaQBB42FGNHfwp0REKX5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RNnd0DUUeoHEfPWrWyS9Ff3XsS4+4XWF/EC2XhRRP1d/6HBSazGHOT8Z/O5HSLCIC
	 l8WDmDdI4/pGGhkzgI5DNnjGYUt3HKlF3FQzovgnOeoC3wAWLJ9NJceryz0ZGqmrmA
	 fwtgo2zdmkV9wgownjNbtepuvC5tD086Aty3JEag=
Date: Sat, 26 Sep 2026 12:18:33 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Jiaming Ouyang <jiamingouyang13@gmail.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, alexs@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, si.yanteng@linux.dev,
	rdunlap@infradead.org
Subject: Re: [PATCH] docs/zh_CN: add Chinese translation for usb/ohci.rst
Message-ID: <2026092601-fretted-humorous-c207@gregkh>
References: <CAMnqnYyO98AEDOHfm32Cb4uGBDucLiZ8gKZ5S+jVf3DDCoFA5w@mail.gmail.com>
 <cfc9cb8d-d13a-4dd6-809c-1ecf3bc9c758@hust.edu.cn>
 <CAMnqnYxzfUUaeaGTG=pESVN+2yeue4b_7N6d=xMGNE7qdrNbYA@mail.gmail.com>
 <2026092601-reassure-darkness-229b@gregkh>
 <CAMnqnYwDoNc5=RjEkeRB3-yB+HJvYkrcTBHpPo6cxydSfRMphw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMnqnYwDoNc5=RjEkeRB3-yB+HJvYkrcTBHpPo6cxydSfRMphw@mail.gmail.com>

On Sat, Sep 26, 2026 at 12:10:16PM +0200, Jiaming Ouyang wrote:
> docs/zh_CN: add Chinese translation for usb/ohci.rst
> 
> Translate Documentation/usb/ohci.rst into Chinese Simplified.
> 
> The translation covers OHCI driver overview, hardware protocol
> differences (OHCI vs UHCI), improvements since 2.4 kernel,
> queueable interrupt transfers, and non-PCI support.
> 
> ---
> Changes in v2:
> - Correct the date
> - Correct the layout
> - Add specific details for it's contributors

This goes below :

> ---
> Signed-off-by: Jiaming Ouyang <jiamingouyang13@gmail.com>
> ---

Here.

Also your v2 should be in the subject line, right?  Again, take a look
at the in-kernel documentation, it should explain this.

thanks,

greg k-h
