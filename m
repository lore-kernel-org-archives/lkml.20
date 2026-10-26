Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018200;
	b=gRjXHSCcygEaUoNHcQkDYAVp5czejRv0vuNYJSZFA2M/vYcmNtIwHY84rzO/frvyE26l
	 qy4AYq1GqwHUYJFhvBgMUjGIr+xNsvniGxsSnX0CvNqDqujEKmhtFENdNocZc+1wURfIs
	 xJ5CLIMOU2BCmiWnwySrj9gtkeSZmwFKh4R/WgdKzqNzxE8dFSJ9IqWbQkg7sGFWXWYSN
	 koc6BK4XV/gH3S6lDdOFiTM+0xdhvs4pFZ7BSga65lo7QedD4I4uuSxG1mRDJzPPwEhGm
	 STnnRkmRZm1u2NuPNZUwTqhHgGszEnywA7lK5Sx4mLcBk4FVxorW03o4LYjPIiWchlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018200;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=lIwfX39/1xU2NA1XZwUTvUajjOaDvuDKqu8wPxFYaZQ=;
	b=TR63xcLBcV1MMwldYLxGbY2uSLekE0p9Wnf2FLHEiIULHv7awgcXqbAC04P4lXcB+Hpe
	 xkw1bnSJxX9e3Q3NR+6ORonKNqpkbHXSqeWWOvE0+i4l+JZWHktCBYeGdD78B97laYYf2
	 hcjtr7pfZK3/OeVQoi1ww4bW46JgVg1/ITcPtSWayxaVbo3ahIjvj4myou2C9q7wuW7n3
	 KBL540tYyN5LETfJ8jpm+9Ns6NUx/49dJxi72G6p0qPSVdkl1OOTC2j6+jgH36N3/8q0b
	 6RHZS7oTCUFqkdJju69bZZZVEPQLu7HmSnQMbwrs8FqUjlPOF7RDe3FgtAygwgDXbpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=uBMeGJL4;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C503606A31E;
	Mon, 26 Oct 2026 12:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C503606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=uBMeGJL4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lIwfX39/1xU2NA1XZwUTvUajjOaDvuDKqu8wPxFYaZQ=; b=uBMeGJL4afAOvzwTx3cTjiA5jz
	CzZF53gUcYSEEsWw8kW70v32vlp6yJ0uKq+n+GqqsntmJ3kvMuzA4FKG4UDJpifhPr7Qz/w7AqAvH
	WVwgVz/OflNGm4uJ41Tfopvv6Neh/+bgDm7bC7GFhCw/CRcsqkmi5KYR8ve357yIMabI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xLJwE-00CnRx-S5; Mon, 26 Oct 2026 13:36:30 +0100
Date: Mon, 26 Oct 2026 13:36:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: KAVYA M M <kavyamadarsh@gmail.com>
Cc: Prasanth <prasanth.padarthi10@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v8 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Message-ID: <e33a471b-5f4f-492f-9656-e19e0dbfa1b7@lunn.ch>
References: <20261002062933.26497-1-prasanth.padarthi10@gmail.com>
 <20261002062933.26497-3-prasanth.padarthi10@gmail.com>
 <CAMFFDGjmJTRR8GOX=S+kKnMA-bG+gbZP0sS8dG_d+taDPPRDZQ@mail.gmail.com>
 <CAD_a9mYKSYyP2TqeyjbQWYHdZgF3ggdrU6oTK6VWs2C2GSYMjQ@mail.gmail.com>
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
In-Reply-To: <CAD_a9mYKSYyP2TqeyjbQWYHdZgF3ggdrU6oTK6VWs2C2GSYMjQ@mail.gmail.com>

On Mon, Oct 26, 2026 at 10:04:05AM +0530, KAVYA M M wrote:
> Hello team,
> I am new to OpenBMC. I want to development image for the machine using the
> OpenBMC/Yocto build system, available firmware information, and readings from
> the existing BMC.

FYI

It is considered bad practice to hijack some other thread for
unrelated matters. Please start a new thread.

Also, don't top post. Netiquette rules apply to mailing lists.

      Andrew
