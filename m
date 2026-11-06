Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.99.196.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793925746;
	b=omFEhM67xx0R9j45ZVFTJE9PORZ5fc/HQf/mUmMvUDZkAEOMNycrqwnR+61E5tZy5D0g
	 OQeaZi+3tJHCVc2ITu7ZCWSRT0DZm9zf+Np5K+351eJgaVXSGdXYjZFAIKQr2V5JHYsaF
	 /pRWxVnbqKe7V/+ioOXnPTJfWJz7UXGUqmh9oJtsyPIRSZ16AJdQ3wtm2W9e78PaNwRyO
	 CVjbPWRhmDdwd+1Pgj7L3DbbqqfODEQK7p9hLT1/Ajp6Fvph3rALwo7cB9lnP02pAgrAp
	 NYlAzpOH60W1ajS/xLQs1NlGfqOP9g08DIOOqTUbcLm5KqostVWpFC6qYptXnXo+5pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925746;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Date:From:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=SdhPgjzQAfuk8EqFUv2PiaCELFJYLAJbE0sdHtSJTxs=;
	b=vxWin/HWzwSvEkpb1xihlhdIYB6XSPTVm3VnujRPZU3DvJ7lXZpYj1UArdCHNLD5FGht
	 1eJD276jRR/o5l1VuT3mNQ/Tq9yczloSA9bFbOkSG2f3qXqRXostL4IY+eHWpPkpPPpdT
	 AhXOJxpsSB4gjmCMS8NRId94f726iR4myqky5xlc06QFdto+5SZU3TEZD3AIYKOHLv9Ac
	 4kxi/0X+ms++mdmYP6kJ9NfB8uUlFe9Wp71RfZ4U+wHlQNFXpNxuRS7rn8HSS1IzU+VDJ
	 Io5b4YhyBwBHy+Cwsr0ddWvP23OLwDMrAprRPOFCUr+tgysYBAmZj42gnPUvbvixMkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=namei.org;
	spf=pass smtp.mailfrom=namei.org;
	dkim=pass header.d=namei.org header.i=@namei.org header.a=rsa-sha256 header.s=2 header.b=FBBEjkwu;
	arc=none smtp.remote-ip=65.99.196.166
Received: from mail.namei.org (namei.org [65.99.196.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73844606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73844606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=namei.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=namei.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=namei.org header.i=@namei.org header.a=rsa-sha256 header.s=2 header.b=FBBEjkwu
Received: from localhost (localhost [127.0.0.1])
	by mail.namei.org (Postfix) with ESMTPS id 8CB68308;
	Fri,  6 Nov 2026 00:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.namei.org 8CB68308
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=namei.org; s=2;
	t=1793925737; bh=SdhPgjzQAfuk8EqFUv2PiaCELFJYLAJbE0sdHtSJTxs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FBBEjkwuHmqH94FfCs4SREwC/bxsHOiKZZKs9FYvLmkgS4Tajt5uksUVop38WlNVa
	 0iPsPYAUai7oHBOBzyynd9rjfeX8Fu66uPFDnx60dhE0hzhi5yKqEU1LDvgfvZgVSA
	 udSyNx8Zr4O0s9GGHIdbTf9NoYFNDFF327M8Y88c=
Date: Thu, 5 Nov 2026 16:42:17 -0800 (PST)
From: James Morris <jmorris@namei.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
cc: Christian Brauner <brauner@kernel.org>, 
    Julia Lawall <julia.lawall@inria.fr>, Greg KH <greg@kroah.com>, 
    gmonaco@redhat.com, ojeda@kernel.org, aliceryhl@google.com, 
    gary@garyguo.net, namcao@linutronix.de, sashal@kernel.org, 
    natalie.klaus@runtimeverification.com, willy@infradead.org, 
    linux-kernel@vger.kernel.org, Paul Moore <paul@paul-moore.com>, 
    tytso@mit.edu, keisuke.nishimura@inria.fr, jean-pierre.lozi@inria.fr, 
    ejratl@gmail.com, corinn_tiffany@alumni.brown.edu, kate.stewart@att.net
Subject: Re: Kernel formal methods mailing list?
In-Reply-To: <e788b576-43a0-461c-9ae0-d7de3a6866e4@paulmck-laptop>
Message-ID: <64fb6976-6e86-b172-22ed-15bfc0cfbddd@namei.org>
References: <ed89f1ce-cdca-d6f6-3e1-f0fa34eac4d@namei.org> <4ea0f231-eec4-4f41-bd2c-e5484c0535de@paulmck-laptop> <b765a5d3-9844-fed8-4277-2a998980b33f@namei.org> <e788b576-43a0-461c-9ae0-d7de3a6866e4@paulmck-laptop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Nov 2026, Paul E. McKenney wrote:

> On Wed, Nov 04, 2026 at 12:56:30PM -0800, James Morris wrote:
> > On Wed, 4 Nov 2026, Paul E. McKenney wrote:
> > 
> > > > Thoughts? Would it be worth setting up a mailing list?
> > > 
> > > We do have (low-traffic) lkmm@lists.linux.dev, though that was intended to
> > > be specific to the Linux kernel memory model and its formal-verification
> > > tooling.
> > 
> > That's a possibility. Would the mm folk there would want to keep it domain-focused?
> 
> On second thought, I have to agree with Miguel, so I suggest instead
> subscribing lkmm@lists.linux.dev to the list.
> 
> But it could be a good fallback in case the Powers That Be object to
> creating a new email list.  ;-)

Ok, helpdesk email sent, adding all who responded as requested owners.

-- 
James Morris
<jmorris@namei.org>

