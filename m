Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B04043DEB8;
	Thu,  1 Oct 2026 05:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833893; cv=none; b=WvL2749p/+cXlocCBPv0jjJVUGje5pgl+2qHT7tJk25UtczDd3DFCNkQ2+SjXB11cqeuIqLDzWJqK+DqchT08OlghDwH4FddUKbRk8aLyLPUwUIKj7/KvvrTbNWlUBAUlWql1tOCG3d3D6WAJpOzOmk6umYPGRcOUly9Y95GUMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833893; c=relaxed/simple;
	bh=YELVkFDokR2KWFvbp6HkPlRrm4/0YZ2LDqKCVyz6VRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W2hYM5O92Jgpeydp4DrT5dERG+6j42fKqb5dzCeLEk9SJjfDLoAkXp/Wg0elLbV/vXmHtMIxvD9tYv3smSfxaPXA5FH7EQx1VjZ7n0ayiUmMte24TdqpnzqZZDjvPDUAHLRrWFuMZ0QOhsQmga0Kxa42KfMhB01huOvmH3C/dk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kMPyCEJm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kMPyCEJm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D8A41F000FF;
	Thu,  1 Oct 2026 05:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790833892;
	bh=WEKPCKsB16FQAY1Rt/eVtRhRYZsqze82LTR1IAOfE98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kMPyCEJmUKTriK4L6vrcICRqX9wRqIOWnQUVu2/SBTL64NOKN+B6hhun91BcIwMlH
	 8FooqUWtVpL+8AKrenPm6gPFnGBYyviFb+duljDqtFSkYEyYR9cjut8UXjBE9Uj1Og
	 Ptnva8w3y97BVwfIL6t/dX/jHvuqtsXzbVtnDjmY=
Date: Thu, 1 Oct 2026 07:51:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtl8723bs: return bool from check_pending_xmitbuf
Message-ID: <2026100152-fructose-debating-2f1c@gregkh>
References: <20260919163857.23772-1-matheus.aalmeida@inf.ufrgs.br>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919163857.23772-1-matheus.aalmeida@inf.ufrgs.br>

On Sat, Sep 19, 2026 at 01:38:57PM -0300, Matheus Alves de Almeida wrote:
> check_pending_xmitbuf() returns only true or false. Use bool as its
> return type to accurately describe the function's behavior.
> 
> Signed-off-by: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
> ---
>  drivers/staging/rtl8723bs/core/rtw_xmit.c    | 4 ++--
>  drivers/staging/rtl8723bs/include/rtw_xmit.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 

Shouldn't there be a "staging" in the subject line?

And why not also change the place where this is called?

thanks,

greg k-h
