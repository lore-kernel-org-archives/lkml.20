Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871880;
	b=fXotdqsbwm8GXOQsvRJWHO7Y6VJP8UW7agQ8xHEXN+C64X0xORGWG1Hr6/sPG6vtzUmb
	 EOMZrF9ggPy9B3z2mWOOifNjpe7MbmIwzrp6dGz1AWB1LOi3hgGAktb4ZxhdXTNqPCBin
	 Rk8S8/tzxqHwRY6LyPmXaRRDhz7664Wa2QHhSWsjeO4GJgj2RtHN2L3+w+Ttq5mabPMLf
	 9hk2WTya5z7iZcy9OfzrzDEVDsscpbJk1pbW6ZXo/emmsX5qjLth9QAewspOzP2q0b0Lq
	 yN7TTUnyixVyKuaB8SDdhcqR7EywfFFRayRgnotNY3iSVj56iiPm1nLVGXtaHUnZF7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871880;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=xfMs+Qf9XdOxHXeSqXFaYB/VT0nJ0LMrNDOzxuv8Ri8=;
	b=MyOIuqMeitvY5VS+ejCP3Sit/6CwSzBQkYu287gu5CKucobu1dW9yi3EbBWOWb5LsaBq
	 hzjk0JWmCWoOq6va9ZioCwzkJKir9N6mhoLKphETB1f0Jzom8Qs4Ghs398XE7nq8XdA6W
	 soUoHemaR71CqTktDzINT0E0uFRDNbgyvwgYaGhHgLHO/tv3N5aTIc+niJGSb1aw7OZwE
	 FNKEYhURQiuYWnfuiu+8OBSDFs/Hq+eLT9fPdDokYl0psNxX+y4JUm991A+adXzCdI0EY
	 VDMN5BwE0AdtUqWx+QXqerHtmBCEn7u1Njx4vXmxgnm8InVty8lqCMaQeRg6IuOv/5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iAOeq0Xp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8BA606A31C;
	Mon, 16 Nov 2026 23:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iAOeq0Xp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48D21F000C4;
	Mon, 16 Nov 2026 23:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794871880;
	bh=xfMs+Qf9XdOxHXeSqXFaYB/VT0nJ0LMrNDOzxuv8Ri8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=iAOeq0Xpbmml1zZXbNmyAOrGrOTKX4aUya82sPHsuuue5nbJSkFwMNwXX1CQImAI6
	 2lgNwwL/t1ImlVbJc+8tYNlmYuQIDzS2Dkay1y50CYxMbyNemoq+WGtF8TPvfg4eTJ
	 IXc8Z+dN6Sz/e4HsjM6ZWv4ZDADpNMMVUjqdJlqMbBekCq++28qMUdCSKY6YSh3651
	 6ONvakqti4xCeuqTV9SPjN3YgffAMsUUThrrDc1n1OqUehwjJyM6hQVDOcqmntn1OF
	 sPYAdkruhJBhp+l8Opu27l0CWfRo0B4B/82Ojo1ulnTmAmN8KAxwv0XeSQl1Yr4Xb0
	 zOqxR1qagqzRg==
Date: Mon, 16 Nov 2026 15:31:19 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Gustavo Luiz Duarte <gustavold@gmail.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH net] netconsole: harden the enablement through configfs.
Message-ID: <20261116153119.617c24f0@kernel.org>
In-Reply-To: <avXe0feXzRL33bzs@gmail.com>
References: <20261112-netcons_double_cleanup-v1-1-d5ff8167e05a@debian.org>
	<avXe0feXzRL33bzs@gmail.com>
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

On Thu, 12 Nov 2026 07:45:13 -0800 Breno Leitao wrote:
> On Thu, Nov 12, 2026 at 06:04:58AM -0800, Breno Leitao wrote:
> > ---
> > Given this is not super critical or hardly faced in production, I am
> > sending this to net-next, even with a 'Fixes:' tag.  
> 
> My tag ended up being 'net' instead of 'net-next', sorry. This patch was
> made on net-next, and that is where we should have apply, ignoring the
> `net` tag.

Since it doesn't apply to net the CI won't handle it at all.
You'll need to repost with the right tree tag.
-- 
pw-bot: cr
