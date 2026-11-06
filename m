Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994485;
	b=m3cBLJ2y/36Jr8TwukY7sLhPMmHqV65jhu92UVF6AHfppv5XP0rRq7sgXMO4KvDqXwNL
	 OVlsLLdnIDzAICuojCrph9NuwbM6ngU+5rzAR4BfczvPkS2BBNiPb+xTLNFZrLljfqS5a
	 +oT9HoIjliPsKwuBb26WXFK09ssBjO3rKGJGu58+rIKOX/oPK65+WSIWCO9TjMvlwUCEB
	 HuKf5XS4H85TcW0HxzOkhY/wSLHcaQIWPy8pO1uLoiUA7hPKlnUdS5ai8Bn3Qwh4fh/85
	 SzVvRzQbSkq8K1loVT7vlQDI4VNmZMbzEvsQkSzR1XEY5Bk4zL4oPjbzFmgWBCXrHgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994485;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=2ZjjcR7SiN1oMbRL50t6uRzYw3R/WTah0ZqCH51Nsh8=;
	b=nVV7iQNK8I8Gr+UJVj8dKrIF7CY3t/pLuX0ChYKuOAn5yfC0lp6psuRRe7GTRyYx8sJD
	 BGDhO480oN2rO9JaGdF32uXRDiPtyY1JrLBg6/D5KBVw9ilVMCS+LyGDuw+jy3h2eRDPU
	 iCyhVvy3lvMYITN0GzvukYFRq3StpTRaaQL6zAlNi/wohwcdcS6zT9eir2OEaUAgidVM9
	 l+VATBhDOnRvg7djeoUicOdxbDP+NiKhKVUTbWd1wNqWR4/TsxUlRjgV3rOkr1ugflj4/
	 nngB9JIdyvmJdjxC66mod2IrYMqJJJf2NNUtWrGzwV9vVnrIOA6T8gdX2r6SPeEACrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fa9M87U5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF0D606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fa9M87U5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23841F0089F;
	Fri,  6 Nov 2026 19:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793994485;
	bh=2ZjjcR7SiN1oMbRL50t6uRzYw3R/WTah0ZqCH51Nsh8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=fa9M87U5tVtCnr4niGFePfXQTYQmUiMejVXm09+MCmM4OFc1Oxq6u4VBWAf44eMMB
	 wkB7+FX3MB7r/MSWNoOQT6w0oRWIpg+Euurlm/xiyeIJDNHUFvB6pASknV/aPc7FYr
	 0KH6WP+c4o7hfuLBuw6pNStTle7zAz3njciyhshC2DlhsGy9F0INK9GsoW1HjAoKJx
	 SyZogzOqRSPm6cvEBff+062PbLtX3CC1RA4bJuadiyJ4ULOQktm/w1nsRyXYsW+7ZY
	 Ydn9D00dRvXmmyh9dguNTCfOCgCdfNZy1RJRUZIRFN/3WDUsxn/Kmif+uFjtdiCWsH
	 80z9sCRJiXxiA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id AB302CE04B8; Fri,  6 Nov 2026 11:48:04 -0800 (PST)
Date: Fri, 6 Nov 2026 11:48:04 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: James Morris <jmorris@namei.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Julia Lawall <julia.lawall@inria.fr>, Greg KH <greg@kroah.com>,
	gmonaco@redhat.com, ojeda@kernel.org, aliceryhl@google.com,
	gary@garyguo.net, namcao@linutronix.de, sashal@kernel.org,
	natalie.klaus@runtimeverification.com, willy@infradead.org,
	linux-kernel@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
	tytso@mit.edu, keisuke.nishimura@inria.fr,
	jean-pierre.lozi@inria.fr, ejratl@gmail.com,
	corinn_tiffany@alumni.brown.edu, kate.stewart@att.net
Subject: Re: Kernel formal methods mailing list?
Message-ID: <60e7a5f2-a1f4-456f-a24f-d53c441a0ac2@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <ed89f1ce-cdca-d6f6-3e1-f0fa34eac4d@namei.org>
 <4ea0f231-eec4-4f41-bd2c-e5484c0535de@paulmck-laptop>
 <b765a5d3-9844-fed8-4277-2a998980b33f@namei.org>
 <e788b576-43a0-461c-9ae0-d7de3a6866e4@paulmck-laptop>
 <fcadb228-c6ac-d97d-8f9d-0b05f44f112@namei.org>
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
In-Reply-To: <fcadb228-c6ac-d97d-8f9d-0b05f44f112@namei.org>

On Fri, Nov 06, 2026 at 11:20:09AM -0800, James Morris wrote:
> >From Chris @ LF:
> 
> > Hi all,
> >
> > This list is now operational
> >
> > address: formal@lists.linux.dev
> > archive: https://lore.kernel.org/formal/
> >
> > any issues or queries, please reach out to helpdesk@kernel.org
> >
> > Chris Hoy Poy
> > Senior Systems Engineer
> > Core Projects
> > The Linux Foundation
> > Perth, Western Australia (GMT:+8)

Very good, and thank you all!

							Thanx, Paul
