Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814846;
	b=1xRLwJO9B4qJ9KlBfpSz8bP4wOGVdIDW+DcoLS8aGH64+BdV5YHDaXfejLwN3qhxpi3C
	 hpRxNWdpTl6DZKgNZmYeWiFolthr8+9eCBPdCXWDmen6DB237KTl+7iiOLKjm+XFqnzgK
	 mE2J59+bV/ZVWH80STi1J0p0Xq8cNzUvvOiBZhQgCrX8EAcwKC1caTIwN67pGkTo0BauS
	 1iiYRKxaNFpXTXEq9z9gn3D1BpY2EYPAwKYkjQbIhfG4mtz8MLtHax3w3kn/cJo+Uiuha
	 2O1JdS2j1GV82V1TFHrkTcbesRxlGXslFYyWhn1I9/F/UL54aWCJ5RBH0QIb5NOCDcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814846;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=uM/ZUhyiT9gZJ8o0GzhsbTXqLkcOCOieldBWVKuxt8k=;
	b=fJMdfjzhNZQSX5eVov91bP+G54QHUxKy0+kfP+g5QKmxI+u8CYSIzVX59OzRDHDXo5Af
	 3yQ3Ob4O+yYA7rwrdI8s9C5/68n9d/+mBUck6Z8Xbe6gpgdW1VXIiMlhYfRcmntLgfa0K
	 /NmMPA8ckc+FAKhqrPn6nQtK5ggOU+SXoHDJcc4ZfiEtVmRIxID1d3U3ye1u2xqVGi62F
	 DtwxK9XixYmI2lY0+zHhaDVLCtQFJDVoWswqrM5R/egTB83you5+NAovDJ23gWkZFWyn1
	 49Gi2jNMlq5HxAEcWarXKsqUl3a9ymQyK5nIllkLKsIZHIKEqAv8yQZiYAxqYxPu+yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fFkKf2Vk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234D060756E3
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fFkKf2Vk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF291F000C1;
	Wed,  4 Nov 2026 17:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793814845;
	bh=uM/ZUhyiT9gZJ8o0GzhsbTXqLkcOCOieldBWVKuxt8k=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=fFkKf2VkT+s6ahOaX9xZWlsCT8t5Kv4C/fnLwxUlw+uIsbGM3As6ba/XVSXlwFSqA
	 G0Eod7jC3JoNiWBT+UDH3XuFHFUPQKU05bfBQm0mAsxvWc+GWt9qXUH5R0rdDscltb
	 q77P1sXC8I0ruvmmllOF+DzS/eYJYlI1aYBTLqVLLer7TPL2jB9MMRG2g5FMjnY7K4
	 QuhfsPehYfaCY/3JBaphFNXYJv7DsGx5QL6LdBsX9JJgaiku7fXvUGzvplXeLEcIQ6
	 HPJkRp9YejQwhPy6O+xBF+coJY2DZx42VfeO22IHciMks9/+oznbpsslb+NIAcY6Aq
	 IQ1tCeavW082w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 6B289CE09CE; Wed,  4 Nov 2026 09:54:05 -0800 (PST)
Date: Wed, 4 Nov 2026 09:54:05 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: James Morris <jmorris@namei.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Julia Lawall <julia.lawall@inria.fr>, Greg KH <greg@kroah.com>,
	gmonaco@redhat.com, ojeda@kernel.org, aliceryhl@google.com,
	gary@garyguo.net, namcao@linutronix.de, sashal@kernel.org,
	natalie.klaus@runtimeverification.com, willy@infradead.org,
	corinnt@google.com, stewart@linuxfoundation.org,
	linux-kernel@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
	tytso@mit.edu, keisuke.nishimura@inria.fr,
	jean-pierre.lozi@inria.fr
Subject: Re: Kernel formal methods mailing list?
Message-ID: <4ea0f231-eec4-4f41-bd2c-e5484c0535de@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <ed89f1ce-cdca-d6f6-3e1-f0fa34eac4d@namei.org>
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
In-Reply-To: <ed89f1ce-cdca-d6f6-3e1-f0fa34eac4d@namei.org>

On Tue, Nov 03, 2026 at 03:59:52PM -0800, James Morris wrote:
> Hi Folks,
> 
> I've tried to include folk who are known to be working on formal 
> verification for the Linux kernel. Apologies if I've missed anyone and 
> please forward as appropriate.
> 
> Several Linux kernel developers & researchers have been experimenting 
> with formal methods in recent times, I think largely due to the potential 
> of LLMs to lower some of the costs and barriers to entry.
> 
> Examples I'm aware of include a presentation by Corinn Tiffany at LPC on 
> her work with XArray [1], and Christian Brauner's linux-formal repo [2].
> 
> I've been experimenting with formal verification as part of a hypervisor 
> research project [3] (which is admittedly not the kernel).
> 
> I'm interested in learning from what others are doing in this area, and 
> sharing potentially useful findings, especially in terms of identifying 
> _practical_ approaches for verification of low-level systems code.
> 
> I suspect there's a lot that can be done on smaller scale, well-defined 
> projects, by developers who don't necessarily have specific expertise in 
> formal methods, but have deep expertise in the target subsystem.
> 
> Thoughts? Would it be worth setting up a mailing list?

We do have (low-traffic) lkmm@lists.linux.dev, though that was intended to
be specific to the Linux kernel memory model and its formal-verification
tooling.

							Thanx, Paul

> [1] https://lpc.events/event/20/contributions/2540/
> [2] https://github.com/brauner/linux-formal
> [3] https://github.com/orgs/beryllium-project/repositories (WIP review snapshot)
> 
> 
> -- 
> James Morris
> <jmorris@namei.org>
> 
