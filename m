Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D53A35A3B1;
	Sat, 26 Sep 2026 07:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790406813; cv=none; b=qXBm/5fFRkRlBpG9/ZLMt9lXYGLLULFlyz19GDDhlgJWD4sjO8MAIzCIELZdmHvWuf6BIU586RGOOQz26IlZMCecUEHBCqWPk03CT+y4nSShoLmLDAWRfDyO6uYC2yQG5sKePqAemh3XMv/bGRnKLd6p8vLDn8tTW1tEwv+ExkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790406813; c=relaxed/simple;
	bh=1qfEqhjSld0puSnrHhyZu4W6RPie7ALX7LYjfzk4F7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cljvYbyxJib55fBea0Cj3JFSpV6CIhHYfeRNDIXorsQbmtRkBOtjJv7sVqIp2HFcJIfEnDgCIdhh/nsqUxgIJHdufpsr7fQ3/14KtetfB/blwDtqODx8KpsPEaVgCbZpOfzvdzPBhno0UXDcXTZmcKNbfwXbIkWoxAVXwlzXCs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kwExNFGV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kwExNFGV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0D61F000FF;
	Sat, 26 Sep 2026 07:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790406809;
	bh=w4/up1OCvUJRCaiSeFTKMeUF7yD1oTUG/HImNfXyUhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kwExNFGV/p8GCw4sEELdW+uLi6oU9nZk8iam2O7p3JUEM6u+xdCUyJBN1r7jhU58T
	 FX1KE4mXdCtBh/eIWvKZqYI+RvsC9gZYicMmYiiZ+Zi76agx8YeREuKNjnWNA9pOfr
	 /7ZyKRSTFM5xFDGH1RzbD7fqJyM0q/OY+/T/IRtg=
Date: Sat, 26 Sep 2026 09:13:26 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Jiaming Ouyang <jiamingouyang13@gmail.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, alexs@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, si.yanteng@linux.dev,
	rdunlap@infradead.org
Subject: Re: [PATCH] docs/zh_CN: add Chinese translation for usb/ohci.rst
Message-ID: <2026092601-reassure-darkness-229b@gregkh>
References: <CAMnqnYyO98AEDOHfm32Cb4uGBDucLiZ8gKZ5S+jVf3DDCoFA5w@mail.gmail.com>
 <cfc9cb8d-d13a-4dd6-809c-1ecf3bc9c758@hust.edu.cn>
 <CAMnqnYxzfUUaeaGTG=pESVN+2yeue4b_7N6d=xMGNE7qdrNbYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMnqnYxzfUUaeaGTG=pESVN+2yeue4b_7N6d=xMGNE7qdrNbYA@mail.gmail.com>

On Fri, Sep 25, 2026 at 05:28:47PM +0200, Jiaming Ouyang wrote:
> Subject: [PATCH] docs/zh_CN: add Chinese translation for usb/ohci.rst

This shouldn't be in the email body :(

> 
> Translate Documentation/usb/ohci.rst into Chinese Simplified.
> 
> The translation covers OHCI driver overview, hardware protocol
> differences (OHCI vs UHCI), improvements since 2.4 kernel,
> queueable interrupt transfers, and non-PCI support.
> 
> Signed-off-by: Jiaming Ouyang <jiamingouyang13@gmail.com>
> ---
> I have modified according to your feedback

Please provide proper v2 information as the documentation asks.

thanks,

greg k-h
