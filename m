Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636441;
	b=EpgBMXYuo3NRAutSgwpKag8D9D4CkltU8RYJOjCTmbloHIgUqdh1KVFm1g5RNg7LtT0A
	 QQMFe/P38hXzO+vaA0Gs7Xdo5tlH/FVWNXwUQW+iB5rfJzq5ieRemMMGLppkANex5witS
	 OSAtWUO19gSG1DkGvWkgFdeKGtnuLsrSfbrUWf6c0aMHSJpPyrR30Ul5uWvKKviFYdvMm
	 JMIZpUpDHkWUKPykVIi3ojirEPckgm7KVFKsLRJoKizjI7C4cvAfuzmgdNqAzUFRIFXls
	 Oe1t3NcfWr9dmNY09pGVlJ6jyedQMaavc7HFhI6J5h58yhBpT3TAkoz69s2KxwcTzwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636441;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tMCUd/PiRvvryn3P2Alsdrnn8ebAo+kqYgr1gYojjfA=;
	b=K4jdV3l/kJG1Sw9OvMmk+EzW8YhMbkupjAZGJ1FHL55Retkl0lNw2JsWpqkIJOk08s8Y
	 Tp5Gj3udJMzwYN2YyNz099OaIXigx5nch9yjY43CcDrhr8QPJnrhnamIUA7g2BM5v84g4
	 n8orLDaTi10RzuQjKJnkWWcxSc52FsWSJ15p3s4NK/bSJRUaNoEApAnS3eGlwa99RZEhe
	 RxZ/hlvfOAdVWt4e/Upr2RiXPQJ0QYTU3QrWhEzeOvyjvG9gzrnXlu8f6TuvGogK4Fy59
	 +Dlmo4JbfoYnKmDarQ59kZ4gYUxSxVesdO+ORcXCVOp3h/HQZHftDCvJRSHiGSc74QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=w+JySMGk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5776A606AB84;
	Mon,  2 Nov 2026 16:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=w+JySMGk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B001F00A16;
	Mon,  2 Nov 2026 16:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793636441;
	bh=tMCUd/PiRvvryn3P2Alsdrnn8ebAo+kqYgr1gYojjfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=w+JySMGkb0uYzwkd3pGh8N0Wfah9GlbT7XB21hTbI171Co8UJAdjM8+nRiytlHm/G
	 pas1G//hGZhAicjL5E3y5QJJO1+n3J9QnWMDmKBkpdCeSbpUL/wEYQmQr3/ipSuGzR
	 VtpxNbpQWwwxA+vC6g+RnGjwVZSdw8m7JBkVHPlE=
Date: Mon, 2 Nov 2026 11:20:37 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: David Laight <david.laight.linux@gmail.com>, 
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Joe Perches <joe@perches.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, users@kernel.org, Federico Vaga <federico.vaga@vaga.pv.it>, 
	Akira Yokosawa <akiyks@gmail.com>, Carlos Bilbao <carlos.bilbao@kernel.org>, 
	Avadhut Naik <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, 
	Weijie Yuan <wy@wyuan.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
Message-ID: <20261102-nostalgic-foamy-moose-f9c07b@meerkat>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
 <20261102093206.50b6c9ad@pumpkin>
 <20261102-smiling-binturong-of-gaiety-f64c1f@meerkat>
 <CAJZ5v0iOJ1r1OvYhV_KJSnHOJL+oVUrbOXizLk0kbGNiep7a6w@mail.gmail.com>
 <87a4nrfgjm.fsf@trenco.lwn.net>
 <20261102150535.6c5689f6@pumpkin>
 <87wlqvdylf.fsf@trenco.lwn.net>
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
In-Reply-To: <87wlqvdylf.fsf@trenco.lwn.net>

On Mon, Nov 02, 2026 at 08:47:40AM -0700, Jonathan Corbet wrote:
> > I certainly scan it.
> > It is also useful to have an archived local copy that can be searched.
> 
> In truth...public-inbox is quite nice for the searching part of things;
> I tend to use that rather than going into the email stream directly.

Also, we now provide and maintain kgl, which lets you merge both worlds -- you
can both search AND push things into your inbox.

https://korgalore.docs.kernel.org/en/latest/

-K
