Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794521528;
	b=Cw7ovdr3lzIIA+Knfyk1mo5f0bpsMn9ajodoBzeN84YTc513ZJUATzj0LWLuEtWgcScR
	 U7XK6NFe7XkGAyxCZGF2kGj8xximsXGwwK4CIk2VvM9M9v22d2gNJDP/hVAaxGP9L26Tr
	 eVOfDxauX/eGqkPOuVrXe4qlOHDlaDfbNhvMNAD760+isgBaHpW/sJhkJNfEBOCwd3CnL
	 +Owv4CZaE/cetSdKkbwRtqfXSyhFqDKsCaIOpQzxfrhsKTBk4dKCQyIlY1U8lH7QVu+lN
	 Cfz1TdPR5lv7rz26kpx4EwcmnbBq80xU9SNfLAhdBFizndiGzdjCgo0Gysn1yiSBnhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794521528;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=t00do0jJ4W8smIEqCmR7k5PqPqH32OiueXWr4IKc+gM=;
	b=fSstx5mazd7qUBEG4/Dnjocd6N8NoKynyuwu+pINwbPfCAARmR+iewXbVaZYLNEDZwUj
	 L29unkBiHrA4GSE6iuvjjLdtOQEEnUcZbum+r6XtBienNiKk9aiBsjKJi742sJ0FTdnJf
	 Q8N1yVGvdnW+F7jie6bbGUqBTU5I+PYEBV4OJTNl90E9SS7xkiMMDzHnjjO6KGp9K9g9U
	 LugfF6bgOKwGt++qD0rxyj2Y95R52A5SaE85Hv/9T8XZA3N0vF8h0cpCEQRrMGAGY3RhR
	 aHrpVYDPfJeo+4bmjjRv/BOT9RxMEIVAqHdDCFqPZehdpGOtZrVkVhFUYQMOEV1He0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E1VyRmI9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B203E606A31C;
	Thu, 12 Nov 2026 22:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E1VyRmI9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5703C1F000C4;
	Thu, 12 Nov 2026 22:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794521528;
	bh=t00do0jJ4W8smIEqCmR7k5PqPqH32OiueXWr4IKc+gM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E1VyRmI9g3+1qY+epWD1f/m8KECBHUQoraDUIqR+VX7TkrsF2SWRcl6nrzXAmSasV
	 rbgFqWvawRLppzkucb3dVShvlzaJgiLIHeln44L5VMqyA7WXgVeM1ytSOCd2uCGV3E
	 Ck3Svl+rrInl5R6NrV0csjswggbb2yw+WhLafBaqvijrl3h+fP5g7YINzU+X2Cg+Ez
	 aff/XMllIi0O6ndZEQ/AF57yAnd5xucSbWkepSATPzZoR0MskG2dDvc2/3x2EMQ3As
	 eyjZ7CeiD0IzZLxQ0f2LdAl5GrVT2uaID74KtGXfz1SJ6OtD2lX2cHrbVgV3LfCvMU
	 cJZJvQzH6Vr6g==
Date: Thu, 12 Nov 2026 16:12:05 -0600
From: Rob Herring <robh@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Grant Likely <grant.likely@secretlab.ca>,
	Grant Likely <grant.likely@linaro.org>,
	Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
	David Daney <david.daney@cavium.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/6] of: teach overlay code to keep /aliases in sync
Message-ID: <20261112221205.GA1425386-robh@kernel.org>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
 <20261105124030.GA1449284-robh@kernel.org>
 <DMNRHQBO1JLB.3IO0N8NYJML4G@nexthop.ai>
 <20261106132432.GA2551143-robh@kernel.org>
 <DMOE1TFEAB6G.EC2KYRBTZR9@nexthop.ai>
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
In-Reply-To: <DMOE1TFEAB6G.EC2KYRBTZR9@nexthop.ai>

On Fri, Nov 06, 2026 at 11:51:52AM -0800, Abdurrahman Hussain wrote:
> On Fri, Nov 06, 2026 at 07:24:32AM -0600, Rob Herring wrote:
> > What I would like is aliases are not supported in overlays (applied
> > after boot).
> >
> > Don't we already have consistent naming on hotpluggable devices such as
> > network adapters? All that is solved in userspace. Why do we need DT to
> > solve this here?
> 
> Netdevs can be renamed, and that is why userspace can solve it for them.

I don't think that was always true, so if it can be added for network 
devices, it can be added for anything. But netdev is a bit special...

> i2c adapters can't be renamed.

I didn't say rename. /dev/input/ has unstable indices *and* stable 
paths. IIRC, udev creates all the stable symlinks. Disks have links by 
uuid and label.

> I'm also not sure "after boot" is a clear boundary. 

I mean bootloader applied before Linux is entered.

> Overlays applied by
> drivers such as lan966x_pci, or for an FPGA on an x86 host, are applied
> during probe. They describe fixed, soldered-down hardware in the same
> way a base DT would. The same /aliases node gives stable numbering when
> it is in the base DT and is silently ignored when it comes from an
> overlay, even though it is written to the live tree and visible in
> /proc/device-tree.

How aliases interact with an ACPI system is another aspect I have yet to 
consider...

> If an alias is a request, as you said, then honoring it when possible
> and falling back with a warning when it isn't can't break a working
> system. Today such a request is simply never honored. That was the
> regression you were worried about, and the fallback covers it.

Right, but there is no fallback for some cases. Having that is the only 
way this could work.

> If you still don't want overlays to set aliases, is there another way
> you'd accept to get stable bus numbers for hardware described by an
> overlay? I'm happy to rework the series in a different direction.

Stable bus numbers is a solution to your problem. What's the problem you 
are trying to solve?

Rob
