Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794266992;
	b=twsL9k/81e1S6/DkKWZhW86xBmwP40sdvKMv8Nm33WXbratWN8bsBE0bJqnTk+Te5w/1
	 CjsPoLo40923nlf9MgYNr6M1EM4WFog85baTpITFFPSQEvuQzTAmmoXPfY6U9Wu4bUznQ
	 AvY1EQvve9R4MNxWKamDC2Go7X1EO4TFa9I8dH24eVoHt9uOQliG07Bx1M41HyAHTiuR1
	 1zdWCvLJ7lszDiWBsJuZuMgSVrOLw6c8mgw4oTQfl+1hySAcuNyKF+PtWQc9P1GMxChfT
	 btegL20FevLoPK6CK5NU7OotPy47znqIAzqbvmjaoSBrbX+LhXhWH0bDwQbzo1CdU7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794266992;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=hGY7SdMXqd8GDTXOY3teVBrqvVkE+aGkIkZBS3PPz4c=;
	b=L2EeVQ8aoMSQ22ACs757McZspNkKpNLuWmYhachjz2NXaZVTcMxGjJHzvdc+VOKupVn6
	 fVsdeXebEmTcDg+R6/ROe/1qU+y/BNWnl+92ZIdcinNmgf2GmzrZ4SLWJyiv48dQ81ToZ
	 TAgVJlFINW3NERhYpeC3aO0o5wFcPwyjvovnGPAHJpeFGGFoGnT/UZZ/ZLj9q8oSFeGfu
	 UroV31vnwDbZQ5m0bKsM5E6PXlrXbkC4qRQN4Yghjb8evUEbK3DMri8SBP+EQ7EF+ag8R
	 /FjL2WrN03AFXcFZ5ALhUW5Y5fz5SkQyKEVxpRGfL9sNU/eC4KUNUAnu0lS9vvbneyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=jblGhNPS;
	arc=none smtp.remote-ip=79.135.106.120
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D01606A334
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22D01606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=jblGhNPS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794266989; x=1794526189;
	bh=hGY7SdMXqd8GDTXOY3teVBrqvVkE+aGkIkZBS3PPz4c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jblGhNPSV/+x0ztQQQzXx7oBYf8YV+HRMkcxhqx1A5y7FYS50jIK7xpPU6uX9URHc
	 p0WxlFQTOpAv11QOIS1uCiFnMwirwNeTgtNQXeJMhbbNxdxvRKyHElJht4mwn9NAxe
	 HNbEYnAF0zV+eazZ8XrdfzA+W2ZZHCA3FCw1FxYEwPPhUOvt290M/6H2dNSAzCcMxV
	 9V1i2O8XFvCcgFxgonCmo8xbRQhXOjf5Rk8LUbdSIrYZbGQKHr/7M1MkCeth4YqDBr
	 bJVXaHRBh6Up+mgQPdsNR25nwOOdmlu922T/B8WY08oRSSDaNUdM+NDHJ33c6fDkCg
	 2Bop3YNTjkEtA==
Date: Mon, 09 Nov 2026 23:29:42 +0000
To: netdev-bot+sashiko@kernel.org
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: dsa: sja1110: pull meta timestamps before reading them
Message-ID: <vR-5YjmFwE38XCIdmhVSSiNb3gCjNtWfogYP02_9WJ-nX1e_FpC-fefQxKI6132LyAq66BxO6Y0i3Mi5vkZoEE740ydFwXTO_ccEaayPS6k=@proton.me>
In-Reply-To: <179426666660.994134.10642884311879085983@kernel.org>
References: <mnJ9l2Ebi69wyTB5k6FBEnjRESb0SmEnlqwaQAOEJ1x5qRQJ3ZMVAdX7Bn9-yWEnQ0iv_3KLoI1yUVCc88IJOVGGow9rOyG6Y54sPMeW0zQ=@proton.me> <179426666660.994134.10642884311879085983@kernel.org>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: 97320a67e324bcbe7192a8906259d898cc5cd010
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
Content-Transfer-Encoding: quoted-printable

Thanks for the review. Please disregard this version of the patch. Sashiko =
identifies a possible stale buf pointer after the new pskb_may_pull() call =
if the skb head is reallocated. I haven't independently tested that finding=
.

Noah
