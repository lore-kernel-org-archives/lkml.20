Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764728;
	b=todifXH65rIizvn0biJE6pv2mY7D38S7YWDHNmecFO+o9ODF7KW9g1SyZSKNxjLZDSOW
	 texoGIUjc3ri5bmfxMRR8St6JGKE/h3kzDb359gRENsG2H3UtHe79AFQ1z2W3AYj/skKd
	 OdpRkcLPayv8Io4BRhvtRnpLcRGvnUf0hBLHuu4Q4pvpmKfrGD5JFlYLWWgm3/NCWzvSx
	 ixffgAfBXBvVDz5B1t3ceWIzcelgX/g2NgVCDpIUkXPMyl+JgiRPb9hwkPgUicSLhF+mB
	 HNo/oLvwq5CfKKiB6Gzkn2/CllE5TE3g4VnRAjC9N2chHiEi3yw+gTXR0fa81o0iXmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764728;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Kk0NoSDdgz2sJR7FlA5aTIzdjS3cu1whr0BBJF5fmx0=;
	b=l6Xr9NS1jeSGmCzRZOxuLZ3+Uma87E30jbJgTuJPUi/lJvYN4yR0vGxXOtYX9/ksd8PV
	 103Icxspql23NqfQlpKR8i+bvVVcRRA952nV0/erMPNZXaID6V1Xp5x1GHfjC7bXrypdd
	 mHp+Fl8g/VtNlP2/Kw8xuKikFDBKn7OZ7LxhTHxGik3J2AxGwRAibfM+f/2Jo/0jyuaCN
	 ipSFx3ws6Nb46UkV7CbJZZf5LK8B3kJS1FggJa3AQ8tqzEnVQ+VjH1hd1IuorondNevam
	 TGeE8BCWHMWIPvQow9DZS4Jjix7TN4SDXwCHUsisAPPKUOyEkcp5vCECaeatAMAEQgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jt+3hZiC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F60D606A31E;
	Sun, 15 Nov 2026 17:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jt+3hZiC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B73B1F000C4;
	Sun, 15 Nov 2026 17:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794764727;
	bh=Kk0NoSDdgz2sJR7FlA5aTIzdjS3cu1whr0BBJF5fmx0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Jt+3hZiCY6RuUMnWSSSgaIn1uWg7b1oxpR1/rggo8+awXZJVUCfFQl2UT7KMUTiva
	 F6HBB2pNoM9L3rYox+NXWYKPj7pS7/oOh4EnHqsu8oFIQ6vn2YvN1TNKEq7z5J7na6
	 fHoIW1AybQyXSmd6ms385kxAItSDyW39R8w6FjqzZpoMpz8f9OplPbe7u3+ta/Dp2T
	 k7tPh3Py00TGTbEUcIAJJdQx21wEk7FgITZcA5gatAYZWPWt6erh/eads2c4jvxoWi
	 PyfmDO2ljtICroKb3oMNJZPovH+C0AxQmz+Hl191fc9aQcWcAKhmL7uGffs0dysJIf
	 UKo7+//0xrecA==
Date: Sun, 15 Nov 2026 09:45:26 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org, Randy
 Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, gregkh@linuxfoundation.org, Johan Hovold
 <johan@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>
Subject: Re: [PATCH v2 14/14] docs: netdev: drop references to the securit
 list in the doc
Message-ID: <20261115094526.16015a28@kernel.org>
In-Reply-To: <20261114190014.17826-15-w@1wt.eu>
References: <20261114190014.17826-1-w@1wt.eu>
	<20261114190014.17826-15-w@1wt.eu>
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
Content-Transfer-Encoding: 7bit

On Sat, 14 Nov 2026 20:00:14 +0100 Willy Tarreau wrote:
> The netdev maintainer profile asks reporters of bugs with possible
> security implications to use the public lists, which is consistent with
> the way most of these bugs are handled, but it says nothing about
> reproducers, and its suggested alternatives contradict security-bugs.rst:
> it points to the security team's address, and to the linux-distros list
> which must not be contacted before a fix is accepted. This text has been
> left unchanged since 2013 when security reports were not yet a problem,
> just because it remained unnoticed during the security doc refactoring.
> 
> Instead of making a special case of security fixes, let's just drop
> this outdated section entirely, so that readers refer to the usual docs.

Acked-by: Jakub Kicinski <kuba@kernel.org>

Thanks!
