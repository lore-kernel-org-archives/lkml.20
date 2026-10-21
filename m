Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792563435;
	b=zIHVQllj4npLnTXtcSDpvADk1pZx5/2pqqNaeE8rmJbRpObBgeevGwH0AAXGSR8okaF3
	 cPu0RGb7Q3icuQeO1Oz1hIb6X86NO/IjYk5N4Yiviz1ehxaVHuUjquLLlh4TiJxci0zny
	 73SXllUenaBmviiKz6F+R4tEfBkB+DH07rz/33Fcy3yj/E3N3Nl+xYqpLhnE8jxZe6PJX
	 o0ICcooqSKRchb+sxQWtk+VBbvc20kG067kEhlYEmdDJ3zpJ+eLAGHaefqgVnZ6JL7gqU
	 2jdjSlSXjKhzXPMWBM5GAY7pck1/4Ctfd9Bv1fVXzWGrR8Nzayi4NRWf1VSoPl8FbRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792563435;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Vg2ShJMcjsC770hWl6oiFReH3M1VPeeK+ScU02AJ7ec=;
	b=zuS9sn6YLiXuOnj3LWKDTrWKM08g3P/2bH88wecJzAFIDAtpEBAurG6hf6XLz4tqoQ6h
	 NPSMwxPomXJIS+5dPoyBMcWbUIa16reFZma8FqDgmsXUkDkW/wN0+pgizVeoIz7n4Xu9W
	 SfGvZc7lV2CR3E3aIwrQLlvM68DUQW0jcRPCwiAcxZ7zs5m69OExWsWO7nmi1/rfP8nXR
	 +qzrPnAd+auHWrJbesQh96GILAsFUmyieqMd69u/JJS7Z2PeoXXXBnZntAScTKFDS8M4A
	 lY5MtfDTQyJQd5G4pxFhzRy7A4CIBkmxrO8/wkQYZ4BmbhYxa8OaWZMg/A9MMY3h77A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=B9UcNTf2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0756606A31A;
	Wed, 21 Oct 2026 06:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=B9UcNTf2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A004A1F000C9;
	Wed, 21 Oct 2026 06:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792563434;
	bh=Vg2ShJMcjsC770hWl6oiFReH3M1VPeeK+ScU02AJ7ec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B9UcNTf2K2J318a+qZ6ZLTWfC4QbPw8If5B7imtIGYKje7npzvljEyLzeHl2kng8o
	 qwuqNbG7LcIhYcSF84KI8Fe1eT+1ouZp2bWDZkxXUPeACfbOa9qDXXT/V1BpIBsTMq
	 CGb7g+kYl8ttF3GlDbGQ/hatHeqBSTgBW7xgtCo4=
Date: Wed, 21 Oct 2026 08:17:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: LiuJunyuan <2058432396@qq.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: fix crcsr_bus assignment on
 allocation failure
Message-ID: <2026102153-surrender-exhume-845b@gregkh>
References: <tencent_A9C3CCA9DE8FBE61A3F51944B22D1E7AC606@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_A9C3CCA9DE8FBE61A3F51944B22D1E7AC606@qq.com>

On Wed, Oct 21, 2026 at 11:02:22AM +0800, LiuJunyuan wrote:
> Assign bridge->crcsr_bus only after bridge->crcsr_kernel has been
> successfully allocated.

Why?  There's nothing wrong with the original code.

thanks,

greg k-h
