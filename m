Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870769;
	b=RpBWQO1gLV/pCOVoLgk1vANBvZGvhWh/VaFAUKNn9XhIxvZYXEZJII8WqGbQEygsBQFV
	 CsHoLZlieMCn3ze4j6KT5RKG0hxtCeCG0A0vwfc5FFd1nRRdiko94LoTPlGa20YqPBt12
	 thW2Qm0YdYDg80RRNrOMqC7cESAeLYoPjEDTP29UMNKWcww0yuvDeQyJ4BhBuE7G6E4ls
	 AyTn0oJq5bpAv5Xu8tD6z49Uo3XS/cwZURVluleZfuc2T1WUA6cH7rKQHbACgDND7bj48
	 sVPLvt/a6RVm9u6G8qo8VmSsdcePnU3gocnMvObANTpKXE28ZEdT7zSCRZz0HWMhzDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870769;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=I0dEorKxIuOBQU8LzcLrRYEGW9tcxCw8ISIbslP54Ss=;
	b=YoxMYMhJ1cn4VL9eiMkoNpVdWXx0dsV2aUPH1gmHkXG1AlI6QTqt0yCD+YZKpVEHF4/f
	 VGqBzJsLAsc6lvNbfxrelwhUklmN6qGExkQkFCCiw9bZtoVg5YBRRdJLTY8RDbkTvivUn
	 tXNSSBHAYIhW/Le/+v9zIudz++YjtaSfamkZR2yuhdOjxHTP02yoSeqR1KXuGNc0d69Lo
	 lZHCUn6v5bEjzOfwRqUwLF8wSlmUBKw4HbOsVpWmVXQnJocY12CyDHRD89N2TMXmz+RK3
	 4F6IurzLZspY+lKSpkFkN+XXS/DcEtWZNezFu/DnRJw53/JodTTXsiilzzF31gPQbtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YTteEw6m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A60D606A33A;
	Mon, 16 Nov 2026 23:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YTteEw6m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE9A1F000C4;
	Mon, 16 Nov 2026 23:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794870769;
	bh=I0dEorKxIuOBQU8LzcLrRYEGW9tcxCw8ISIbslP54Ss=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YTteEw6m2wXFQM5AGnL3dZXk1ReIngVab/EblhSnDRUu8z5wnscQAnQFRM9d/RHP9
	 NdBiWPjjovjrdrrL70BbLXhK5e87sXbOOoj8L7yq5Gb/61e/tIzG+wLQmIuyMWW03l
	 045o73Sn4zBGQveSgkI53sBM5HqoQL5XR+7vae/p1aDvgsBJacXtVV2a8zz0DoA7PG
	 iF/B9TP16GaTaEtLmPb+rILhNEOGlYI3OoWOmlYG0N8MTXYP71nmOqP5U+GoiBWFhE
	 iz0lSQE/Sf5kIVDqKLOGqa33jfo9vLnX+l4PvikLNoQFYu3Ot9TVpQMKwqbggLhvnc
	 vjon0ykDBZ0ZA==
Date: Mon, 16 Nov 2026 15:12:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, David Ahern <dsahern@kernel.org>, Ido Schimmel
 <idosch@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, Kuniyuki
 Iwashima <kuniyu@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 0/4] net: make moving a device to another
 netns cheaper
Message-ID: <20261116151248.6dbfe7ba@kernel.org>
In-Reply-To: <20261109-bug-net-netns-move-rcu-barrier-v3-0-6084b02610b3@linux.dev>
References: <20261109-bug-net-netns-move-rcu-barrier-v3-0-6084b02610b3@linux.dev>
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

On Mon, 09 Nov 2026 03:18:11 -0500 Qiliang Yuan wrote:
> Moving a device to another netns waits in rcu_barrier() with RTNL held.
> Container and sandbox managers move one end of a veth pair for every
> new network namespace, so this barrier limits how fast such namespaces
> can be created on the whole system, to under 80 per second in a 4
> vCPU guest however many threads create them.

Given AI feedback I expect a v4. Please drop the Fixes tags and review
tags from the next revision.
