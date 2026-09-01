Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8BD4248CE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278225; cv=none; b=e1VY+eJEB0GjswGCcm3HUQ7br7PStHnHrJwBtqLrrVu13B0ATwNXWPBjhP1o2eoTYKu7z5qn+qgPLa3oemC3uYR3MYnZrZ2gV3LTIjvgidwPEXAjiTSSO4EWIcdMSyCZOxfQTNif/59ulqNnNTVNSEi3qlhoGGikTliJH8qZhm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278225; c=relaxed/simple;
	bh=c+uuVaAaH8tbxx/bcqzH/xGsyu/HXBAsl2FrUJBBnn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=frNfTZ7B14pFfgeWN/+y1xzGVHE5p7wvc7OytX6c57wi3hyPdzojDP2pDwqnydM04YX6jdcDnp4W8+VQGr+B/CBxcfjxt8iL0qN2eeFdIAM/BfZparazwpBma8pxKFwVPUqM2/KAhbcR9zXM8Y21oY8bUI39mwMwkGSosWe6/9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=crl4vuGJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="crl4vuGJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 747D11F000E9;
	Tue,  1 Sep 2026 15:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788278224;
	bh=mU4gAgmMQhVlYgTaNp7mo9amtEOGIw8VjGsdXPMuTOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=crl4vuGJz/mwUS3LQBRT7AhaEQT9gjZmDs9UJyA5fWUK0/3iTwz8EHkncTXlmewxF
	 KhotLkd82/yWzgORrzYR1gyyiLntK8dr9iRWbvDCCk9h+oYhePj0w37fZj/Ska+knD
	 +TbQZAVGTOoR2EFmh6o0UQELXNJwn0BV0/FfxZVE=
Date: Tue, 1 Sep 2026 17:56:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Anh Khoa =?utf-8?B?VsWpIE5ndXnhu4Vu?= <khoavna.tin.2225@gmail.com>
Cc: jirislaby@kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: phantom: fix open file UAF after device removal
Message-ID: <2026090133-gladiator-cover-9488@gregkh>
References: <20260831151326.131296-1-khoavna.tin.2225@gmail.com>
 <2026090121-bloomers-egomaniac-776b@gregkh>
 <CAK5ebCne_H-p9yaastoJnMk7k8SXtiaRohZruXN3xZGvsRa8zg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK5ebCne_H-p9yaastoJnMk7k8SXtiaRohZruXN3xZGvsRa8zg@mail.gmail.com>

On Tue, Sep 01, 2026 at 05:30:08PM +0700, Anh Khoa Vũ Nguyễn wrote:
> Hi Greg,
> 
> Thanks for the review.

Hi,

Please don't top-post, or send html email, as that is rejected by the
mailing list.  I'll be glad to respond if you fix that up and resend.

thanks,

greg k-h
