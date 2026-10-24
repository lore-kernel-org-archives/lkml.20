Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792818110;
	b=ZdFd+kVfh3Ks/ZDCR18yMFi2ohQDRxG97t291LwAtMBz3PJClPqYbJLad6Dx74af0TJZ
	 RzVcbT+ulWh8kpfKXW3DioGdw3Wxzes2gJrzxB+F2MFWRe7IrwvctvbZdBRyf2rDWcxRI
	 /G2L83aNn8PZvVIIqen/C5LX5jDfkIaqr0Dxr1RvteCLwAxbXX34VLc2S/zCd2rgBp0HO
	 y6+E9VpHREEOv5PpFMRM9O+acnoTfEdZaDH8pM22gcwXmrDQpSBd+ZLfIvlaW+EkHFwnx
	 MgzQTLV3OrKm2hko4+zyP1CfDbldX11LilofbK8qJ9iLHhxz6lsa1HlSUybT25MNIZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792818110;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=QjdAauPyNyPBOjCjK8ggMh8fHWrHZ3D6H489h6NAddk=;
	b=TgGwGVsMtD6G04PxP6Zf/Ea12IfnEtFn52T6PRyARcfYZMOklb03yQbID2oTnfI3ELgF
	 2wWKH9jCUA7EJqWaQLDd9HNyWrC6uEO2qvyxkd4ul7o76F05ZxQJX6bXwKQL6Ac/AWciR
	 IlcnSgthylaA667NkAHyCNSKcoKdcpboSa364paYve9Khz672j5d9kWheTQ6kKYcPHd6I
	 7+5Wnd0rsHn9tcnvQbayXJDTVx5a2rYhePoTO2JLk0zbOt3uWxUSGQo/zzt4dYh8KO5tq
	 WwdI8USgJOpw8pWuQN7rY9xxfK53stOeGQ9FiyTLbvExT+2oxabQ8RLmTXrBcLIivxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=TKQuzlH6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB28D606A31B;
	Sat, 24 Oct 2026 05:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=TKQuzlH6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6DC61F01825;
	Sat, 24 Oct 2026 05:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792818109;
	bh=QjdAauPyNyPBOjCjK8ggMh8fHWrHZ3D6H489h6NAddk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TKQuzlH6yJquisNkTupWu6dg4NhBRFh3mtF2EtlFlSStJgYOILdwQGF1uLU101/Gn
	 /TYfTjZQSbGb2QjJxz+/FKXpiSl1vLqhQkc1HI3NUd0T+nkLH+gTIWmKYoy4KIb8db
	 8pRTUtDLD1aT9d82JgBsiMvA01cLDTE2LDKGntmU=
Date: Sat, 24 Oct 2026 06:48:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lyude@redhat.com
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	A1RM4X <dev@a1rm4x.com>, Alan Stern <stern@rowland.harvard.edu>,
	Christoffer Sandberg <cs@tuxedo.de>, Kees Cook <kees@kernel.org>,
	Rodrigo Lugathe da =?iso-8859-1?B?Q29uY2Vp5+Nv?= Alves <lugathe2@gmail.com>,
	Jie Deng <dengjie03@kylinos.cn>,
	Werner Sembach <wse@tuxedocomputers.com>,
	"Stephen J. Fuhry" <fuhrysteve@gmail.com>,
	Nikhil Solanke <nikhilsolanke5@gmail.com>,
	Vyacheslav Vahnenko <vahnenko2003@gmail.com>
Subject: Re: [PATCH v2] usb: core: Add quirk for Gigabyte Aorus Waterforce X
 II AIO coolers
Message-ID: <2026102448-bust-thinness-a63f@gregkh>
References: <20260824195419.234898-1-lyude@redhat.com>
 <8b131d2c06adfaf9ce1d6e8cf6c09c749d0e4d1c.camel@redhat.com>
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
In-Reply-To: <8b131d2c06adfaf9ce1d6e8cf6c09c749d0e4d1c.camel@redhat.com>

On Fri, Oct 23, 2026 at 03:31:45PM -0400, lyude@redhat.com wrote:
> Friendly poke

It's in the "to review" queue, sorry for the delay.

greg k-h
