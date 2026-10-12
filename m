Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC8430ACF1
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791781091; cv=none; b=ToaFcBx5BYas9DHgIQEo8ZD/fqYmZ6aoFQVCBdcS5YLVFNRvgWv7qON335HyCScf0hBbpY9ummgyngyDxWyy5DiN9x1w6qMOx/zS2stDXHOZ+7+6vTt711ySXTCiRqVNp9/dEO7wA/D/lIceeSa6UOhkO023dFH/BG9EIPPW9dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791781091; c=relaxed/simple;
	bh=unQ8Kv3Fy+buE9N5m0DeZVnQ6loHexCxxXoC2t0MmFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k7boYM7xKL8oyk5HV0FnrN0NSogSIwwEJ/jkABNP81X5lJ9ebq3Jy+caBBQEeUsCn2xIn5JifHvPyucm6tOyWu8r8snctSZ8ZTwuOaMeC8tGUslpgnzklaW8R6kEjc8fKf/7bRrbVQyv3iWI99dht/pNtmIRsEaGwHeMyaZW/to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yp2cRVit; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yp2cRVit"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35943f55c06so1027485eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791781089; x=1792385889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OPxwWFgnfVFbchTbdw0or35TN+U5yCxRRFvUU5bcKZM=;
        b=Yp2cRVitNSlNqdGxhTzqznvtp50R0HC7g+MqHapP8Ur7R4J95+RCUhOHeSqa1dduR+
         cwmCQVTQOReAMbHovTYBraiOTXwNIPy0LUAssjdFTGlEU3Ua0eAxrnFrAHj/+IweXkIl
         ScF+9p23+ZkQa8+wno0ExUprSKDWdElK8Qa101YL1KWsMsJkdpr6i95nXKeCE8evhtKv
         O8SksGt9Q2SwJ6w4k3r+Hfs/4kLxq1IdqtGIBvYShFnUWH4wR2ZdNKal1V2NSnAe9eDE
         G9QweBcpMnAuQYe9U/p5prP9nZoEbnalnX6WL1jiBuYY40BEUP3oe2dGFW87m+t4tgnf
         vC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791781089; x=1792385889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OPxwWFgnfVFbchTbdw0or35TN+U5yCxRRFvUU5bcKZM=;
        b=MFmPpqDhXLDGmrLEpXyNyZCyuwQyoQGJQf4SwwTzejIi9q7N/HLp7pTbI6V2Cyhb9/
         DwS24yDuwObNMK1Ae7NWehVFKnoKR2dMfxHCdmVtGHGUkHBBSvuBD8O1Ql3KdYTgjumr
         NFtuXUcgjRtWHHKjSOmo5b9B1acEHVzxPb/l2LQkdQB/97ar0qf8MBKQJZHmYnMoy0hb
         EhIOE8D8CfY9Tyd+VX1ICGnzqmjHZ2NrHFl0X1aC7f7njxrGNgPgksk8+GkxNIdLAQo9
         PxhfyW73vjTo/0vGP6YUgXcritFYZhignlPjAyi/aaBgs0GFWk39cQ+ubuuJS1SySCQe
         +LbA==
X-Forwarded-Encrypted: i=1; AKwUvBz/BWosuJX2i0N7SsRc+cUuh3AO3pP+IiNjVSdGKW4+Vk4VlmBJ41JVHZKQDQEfdkoTfUv6oY3l8rx3tWA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtieSSfsJURYAtmPqtIcO+M09Az+2H9Da50jpGg1ye2Vp6BYpa
	2dpzDDfoPqGOdhP3oyRT6n9xENVgklGKCgtl3KG1bglfRkNv9K87vC2s
X-Gm-Gg: AYBFou1MbKUdUOirW2+XQJnH0bbtZTh8kW0SuISkZkqd04YxGjql1O5+hJAsz8LCgHT
	elZGW9vBPPjoDm5KdIHqFIiw0ibdgsWxjmldW4SCOl5cLwbNaR+ogY+2iMYQ0XZlYYL7DHkQwhv
	Pi6tUgyyTp9QfHyCaN89Mji/E9LeD6OdviIsI1TPGuFnQCi7Ru//tZ92BFqAnOlQDqXnxkMIfNy
	2jpK7ROu+xviaVed5EXMQUCzuyK47MoetXuLa7siVPt191LB1tn9RpT8PrAiG7qjWpOSRkhRT+6
	yMSF8Sz8FlQJzIJhDN9Y2Z86m0tN7uKIJlFNChcbe6nWDAUvh0Nw5sC5sMICNJNmAs3fxzNkA9V
	GmCPpXhebmM1BbE+YmUcCgeOSqNEWQ72QtEnVRitpXfIbNnYdtpphHFAgJsmmHISnjan9Kol+iY
	mTETjeJLhBuMNdqXUT2igMnZGnrS9eS9w3SWRa/Eq4VUIWV6vP5VnQOQ2NaBWf0TRY3cEEl8eAv
	OuCGIZuxIsM0mKEwhwgIhvLv337YMtDyKEXS2qxm5s03WE7VOqn5QlDuNQtOMsSPnIF9RX8nTaD
	UZ9NJqn32JTvgAu3JhEwmjqH/1sRjwcFYb6pi/SW9ZPgPTxM4AJYy9wChUb659y8PPK1bJwZkOp
	AdLgSB23TRtp6peyeK00Sct/tpzJmLErfoP6aYDo5NY9DeipYDQLwSSE=
X-Received: by 2002:a05:7300:fb8a:b0:353:82a3:eb86 with SMTP id 5a478bee46e88-35382a3ef76mr16701172eec.0.1791781088584;
        Sun, 11 Oct 2026 21:58:08 -0700 (PDT)
Received: from FT6N242TWK ([223.181.119.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm32829284eec.3.2026.10.11.21.58.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 11 Oct 2026 21:58:08 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] tcp: keep the route window metric when SO_RCVBUF is set before connect
Date: Mon, 12 Oct 2026 10:28:02 +0530
Message-ID: <20261012045802.47339-1-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAL4Wiio1bAsM_Z2LEQz9r0-ehHoWpzTneWy49hd2FGeoVVEQhQ@mail.gmail.com>
References: <CAL4Wiio1bAsM_Z2LEQz9r0-ehHoWpzTneWy49hd2FGeoVVEQhQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 11, 2026, Eric Dumazet <edumazet@kernel.org> wrote:
> Note that we ask to not top post on netdev@ mailing list.

Understood, replying inline from here on.

> 1) "TCP_WINDOW_CLAMP 4096" only holds until the first data segment.
> ... What the patch really restores is the SYN/SYN-ACK window and the
> window scale. Please say so.

Agreed, presenting the clamp as persistent was wrong. v2 says the patch
restores the window and window scale advertised in the SYN / SYN-ACK,
and notes that since a2cbb1603943 ("tcp: Update window clamping
condition") tcp_measure_rcv_mss() recomputes window_clamp from sk_rcvbuf
once the scaling ratio changes, independent of this change.

> 2) "no window scaling" is not accurate: we still send the option,
> with a shift of 0.

Right; changed to "wscale 0 (the window scale option is still sent,
with a shift of 0)".

> 3) This also fixes TCP_WINDOW_CLAMP being overwritten by a later
> SO_RCVBUF on a not yet connected socket or a listener. ... worth
> mentioning.

Done - v2 leads with the SO_RCVBUF-before-connect / listener case as the
common one, with the route metric as a second effect.

> A packetdrill test covering the SYN window and wscale would be nice.

I'll add a packetdrill test for the SYN window and wscale, with and
without SO_RCVBUF set before connect, in v2.

> It seems to be a net-next candidate ...

Will repost as [PATCH net-next].

Reposted as v2:
  https://lore.kernel.org/all/20261011111606.14753-1-jain.sm@gmail.com/

Thanks for the review.
Shashank
