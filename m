Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DB24086A;
	Sat, 29 Aug 2026 12:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788005796; cv=none; b=m2jS9zVW5WR2guUklzE1F8f79/H1OgSwB5+NZ8ISuEU0cV6oRFxMwUWRpkNzO0jjZAIXREyZN86tR+iRzsblSuI3wuDvmfx3jhfu1yFNu5hnFh+QvMWQQMOvbX5DSfMwoo6OQz7lpZynySxHjTLkkjKz9dAmdOu3l2MKeODvZYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788005796; c=relaxed/simple;
	bh=fV9C95FqgTKeympLz7XKem9s810UqytV6pc9rD9JlOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ao1F3/MY1BRxuiHVPfX/7ztGw5tPWtqfgtvuniQmG85W3LtFgSj8Vfw83a0lIQeW6Cs+hayiZGysH5HkcJJGqzNxdctAUHwsDF+j4aH3wa1GynhFF93mcPd6z3f4b7YFHs5gxtLA5CKCpT84rLZ1wqNU9C3qpVp8OLZMpkR4bHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mvWJKGZC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mvWJKGZC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B5E61F00A3D;
	Sat, 29 Aug 2026 12:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788005795;
	bh=LniAEPU0/0kBq6AXwUqtR2Sg6Rwr7ZlvYlMlK8Bdb9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mvWJKGZCbBVQnn8WOXxALvjLBKgd5HW6FaVSlHnt6tyvhDSCzQiYx4+aDZnLYQAqk
	 0/NJi0aH6GACgyoSwok5l31CNSyGl5MzJrax6FN+Li1pHeSInMimsuyk2oM1UIrXM3
	 TN9kUFHByHcy+qT/bH8MAEdWb3GP/UcG8zL1R9So=
Date: Sat, 29 Aug 2026 14:14:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kaden Vaughn <sciproj486@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Kaden Vaughn <sciproj486@gmail.co>
Subject: Re: [PATCH v5] staging: rtl8723bs: fixed formatting issues in
 rtw_security.c
Message-ID: <2026082918-hamburger-barrette-41cc@gregkh>
References: <20260821210722.143845-1-sciproj486@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821210722.143845-1-sciproj486@gmail.com>

On Fri, Aug 21, 2026 at 05:07:22PM -0400, Kaden Vaughn wrote:
> Signed-off-by: Kaden Vaughn <sciproj486@gmail.co>
> 
> ---
> Hello, this is my first commit!
> 
> I'm working on spacing and formatting issues in the linux kernel.
> Please let me know if I need a v2 or need to fix certain things!
> Please disregard all other versions UNLESS there is a v6!
> ---
>  drivers/staging/rtl8723bs/core/rtw_security.c | 1539 +++++++++++++++++
>  1 file changed, 1539 insertions(+)
>  create mode 100644 drivers/staging/rtl8723bs/core/rtw_security.c

Again, this isn't a valid patch.  Please take the "how to write your
first kernel patch" tutorial on kernelnewbies.org before submitting this
again.

good luck!

greg k-h
