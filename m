Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA13B1A5B8A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787809581; cv=none; b=pt7ExkM3sMkmow1KYBgNwtHNavY2Ox1axfPmLZviHJk/EdXI6OrYJmbZXIPwZ01dMu/ifSSLfLNlBntdbofvzoP6YYCJH/3+PVKFFpzybrUgnANi42dB4bRl9nvQENBD4MkPkSE43UvvKsvyjVHzk6yFT4HeQFMIqdK+IMFVeMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787809581; c=relaxed/simple;
	bh=0VPEhvoXF3kJM8y7LAJCH67zt28BsvGlkTmc9R4QVkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAoijVja5jjc0Ydrxg2HuZPhz+vHvSXzYLHFIpLaIZDxguRSGpgeA2Jgpeke8+QhOe7vLV5Q1UgRWowyUS2hqBa1Oe+Bmam727N0Mj47CPEQFxuVqFn36buTsLWvCYE8L34llH/cq8Cc2D29pKeIkjwQQxd9RqcIMWQMxC7ppUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TqnV4uti; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TqnV4uti"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B03121F000E9;
	Thu, 27 Aug 2026 05:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787809580;
	bh=0VPEhvoXF3kJM8y7LAJCH67zt28BsvGlkTmc9R4QVkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TqnV4utispVImw3mSg25q9yKhmXj3Q48xL5CbV3RsdPIXSE4i7x6vgc+VRPBd1NH8
	 lQUYQbajNck/O5sF4oSUeFvs3hCgBwSACJjx/wxrryFuJgIfBsp/0Hhf3leuQ0Bs8C
	 1gplHqYt9WSILtDgRcZqZbKUYUsc3hOleWG9zUn8=
Date: Thu, 27 Aug 2026 07:44:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: 3237174131@qq.com
Cc: linux-kernel@vger.kernel.org, tglx@kernel.org
Subject: Re: [PATCH] scripts/spdxcheck: add friendly error message for
 missing ply module
Message-ID: <2026082709-splashy-flatware-2749@gregkh>
References: <tencent_DB8D234F4E3B341F73D78849C17E50D19B06@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_DB8D234F4E3B341F73D78849C17E50D19B06@qq.com>

On Wed, Aug 26, 2026 at 10:35:43PM -0700, 3237174131@qq.com wrote:
> From: Xia Zhoxin <3237174131@qq.com>
> Subject: [PATCH] scripts/spdxcheck: add friendly error message for missing ply module
> To: linux-kernel@vger.kernel.org
> Cc: tglx@kernel.org, gregkh@linuxfoundation.org

This shouldn't be in the body of the email.

Try using a tool like `b4` to send patches out, it's designed to make
this type of thing "just work".

thanks,

greg k-h
