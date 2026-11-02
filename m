Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636630;
	b=YUWWcKKSv1S/ZDD0xSZplpf9rQOnSzNB8NWQF99FWrgV21CKBJYa72nKDF17kwp1kzeT
	 TRfJLH+PoREt+Qj2UutXL7f0bBeKbdr0gjNgjtPWwM6tdqhIcrWW9KUAfUNb9dOK+1+bX
	 b/pek1vpOaPJkhFv1kvEzyiq1DPbZsHEeD9dt8pCgxNMz2CM/1gdJmU/iAQsdbOwqGbt5
	 6wVH+JCdYLQRBpIy9331QWhsSBi+vcOJDivZQD8jwghVSq4NvZ3GFiQ7aATe7oDSMAY3m
	 LkI0F9ffEN22epsypZYdkylvIYBui5jAz8D2mgW3tYqeLrah2dG7LX92c6F8IGdUWmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636630;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KDWgrUHj+jyBRVnwgShPCYRfQjALrFqYZse5PQHakOo=;
	b=Yq2D6CNBAp9J2Ul74rYCjFIjFyODT8cNQEHVa7d+5yA7floqz4P50nKIONwWmg5djLKh
	 fW7EIrazlJYaNuGSzmD+DHZq80WLtD3HWUxGfkVJP+7es9Fcw8XoPmp6o924Uy6qC/FMN
	 EWoeu6aWpWdSBNNjp4nqBnFLAVVGOW6U7/xBIUIXfetqMoNoyzg6oCQGNmAPDQtUwx1SR
	 1Wvqs35AsraZV7ZrypEH5xFICpUmJrALLOqtIMzmhcsxExneNjRTCWPkXB1lAJWw8W5Bv
	 gFTzseEUYNklAPHv1Om81sTIwcGDlSor9U1GW9lAHDVxvO6NXwGXSJEX+UMBfVYidgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=N4QGgROO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBD9606A91B;
	Mon,  2 Nov 2026 16:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=N4QGgROO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4811F00A16;
	Mon,  2 Nov 2026 16:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793636629;
	bh=KDWgrUHj+jyBRVnwgShPCYRfQjALrFqYZse5PQHakOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N4QGgROOAfJ2oyv4NefUAOAWFVTHcPhWBmF2J4fJcWm44VGcGK6nSdfqcLcE+lmdP
	 P5CJib2Na+yoM6X3wGnmm1w6HDBxLw/sDQL/zTGDHkLGP0TehnGXLl5BZQl75oOTKQ
	 XkxlXjPGnNrjay2IyAPtUWGE7ovnFHwvkEiq1tRM=
Date: Mon, 2 Nov 2026 11:23:45 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Joe Perches <joe@perches.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	David Laight <david.laight.linux@gmail.com>, "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, users@kernel.org, Federico Vaga <federico.vaga@vaga.pv.it>, 
	Akira Yokosawa <akiyks@gmail.com>, Carlos Bilbao <carlos.bilbao@kernel.org>, 
	Avadhut Naik <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, 
	Weijie Yuan <wy@wyuan.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
Message-ID: <20261102-rapid-vigilant-heron-4dabf3@meerkat>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
 <20261102093206.50b6c9ad@pumpkin>
 <20261102-smiling-binturong-of-gaiety-f64c1f@meerkat>
 <CAJZ5v0iOJ1r1OvYhV_KJSnHOJL+oVUrbOXizLk0kbGNiep7a6w@mail.gmail.com>
 <87a4nrfgjm.fsf@trenco.lwn.net>
 <20261102150535.6c5689f6@pumpkin>
 <87wlqvdylf.fsf@trenco.lwn.net>
 <762ca14700309938ddd1b8ecb1a8767fb07b719c.camel@perches.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <762ca14700309938ddd1b8ecb1a8767fb07b719c.camel@perches.com>

On Mon, Nov 02, 2026 at 08:10:57AM -0800, Joe Perches wrote:
> MAINTAINERS/get_maintainers is public and requires
> senders generating the correct mailto: entries.
> 
> Maybe undo that and make lore/vger create all the
> to/cc entries using a single kernel mailing address.

The trouble I have with this approach is if we're down, nobody would get any
patches. The messy approach of sticking everyone into to/cc has built-in
resilience that continues to function even if someone knocked kernel.org off
the map.

-K
