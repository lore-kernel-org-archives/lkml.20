Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913597;
	b=SaYWy4fql9CLCawqMSW+LoJA1fArFumzSE3Rm9b6cZfm/ilWmy2dXdI8Q8QvWOlGh3nZ
	 ChKIxc3vnowbS0zbS/Zms5EeOVAYz95SyaWg7/oiXTgtIu7ZZnHwcbewaCM2Ps+P0V/Dh
	 4GEBgekdG2aBTEhvECKek8LZlj3rCHBUJDpJxXcoBffNArEpERbKWIEGD3W3L6N/fW2Dw
	 zStV2tOLkZU/ZpFNfuyAtwX9Z8OR5BPM/KtK6Sp1tRtdoFvrRzAalgmDErYoUWu5mkBOV
	 aE3loH+G94nOr0RyoNkP3Boc8sP88reG78bQ3+iIjtIyEvZ7sBxaztELqOGWfqxxSeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913597;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=ErmcKCXK4Qc7kBuRGtWtZmp/Yc7eehLhKbwu8GKHMvA=;
	b=U7ewAdAJWDpNzqgsCH0UBEoJPjXMHHMyb2zZV2U7+wWq4LalVktd45XHnfz0lJU8aNMa
	 y8ztL4vjrDKF41cC4N9L7v3U1nOnb0eIcs+xjLs/TFC9WBOiW5Tl3ioPNA3hqlzeP2mH6
	 qCyyBXKwTt385b3xlg8ilny59QiuHB2pvLxHzVuw9a6gxH1EzCf/qb9CvLggs9DkdT7nV
	 ybIl5kbnbUD2kWnaRTBSVQz7oXUGcqJV2yNrFs+YQ4+HbLzhdiYwzegPcIE44dlRs/JIc
	 MznmQ7hQx0GDAn5rS0fTHdSaV8qvGflWrhZXlgZqyBjtAvN0I/FZI6zLwtmjV8rCdxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.org;
	spf=pass smtp.mailfrom=fastmail.org;
	dkim=pass header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm3 header.b=yvOtmGNh;
	dkim=temperror header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=PDrVvcfw;
	arc=none smtp.remote-ip=202.12.124.146
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA982606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA982606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm3 header.b=yvOtmGNh;
	dkim=temperror header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=PDrVvcfw
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 677ED1D0019F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:19:56 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Thu, 05 Nov 2026 16:19:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1793913595; x=
	1793999995; bh=ErmcKCXK4Qc7kBuRGtWtZmp/Yc7eehLhKbwu8GKHMvA=; b=y
	vOtmGNhItGkjkHRwkw/QRynci7++9MYE4P5HyfTxQRNzrB0NlH1ox7GwnDJtF7vh
	XKZUR7hY4Rr6HAiQznSk2cHUbEOLNXuOZpDQnKNptvY7EX6Z+jH8ZWBjgCjuIVc6
	L2kEXDhof/b8610exXZ3AOJN99blUajnd4IJ/rr5BQf9vxcw9ETeB6W6b7gulSM2
	zoKQhrN5xXWqpDgI3Gq2deiZImdobhll+dn1OMyBEqI/3OqgZLp4QWhYoDTnblvK
	MO483R78rOybjCqpk/7XyP45I43OC6COgDf5i3800d6eLJHXyXYSDR6gS7ojCyOS
	bqHJY/ftIOfZ58cEM/BAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1793913595; x=1793999995; bh=E
	rmcKCXK4Qc7kBuRGtWtZmp/Yc7eehLhKbwu8GKHMvA=; b=PDrVvcfwl0GuVRplB
	vDw19SGgVqY/r6iTs7+LOqSNm+1QLmEwob9Ae+SKtseIAqT2W/51V9Pt0r6hWxfT
	lu6Y/V7CQV4FRuuZYhyerJINY3Xcutqcj5wHaT+LTBhO5Ij/v3XSBJGJfrY9K8Y1
	HRFQsQ5HnVh+iBe4NjDCt892QVlkHfuzbnC2PgeuAphHEr3sxhCmCoYc8ck3pxJy
	wK+d/N1Eq8d4gcZOeMY24s9nlJeKOoc4VDTQQRTrqSJhDbwYy1mA8gfZB8aIoXde
	KfkLbLVmUrIP4gkvt2kaoN6jp3/RJFbAUxu5T6y251tsenUuQbVil5xK0EsoTk9F
	42iLQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=fastmail.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793913595; d=fastmail.org;
	mf=PGljYkBmYXN0bWFpbC5vcmc+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:Uu+y5hvtPdI/TWsLv88QxMQTOaWqha++qn7HhQosF0StmqT
	a7MK6C7c1GL403HfVvzZFjxYXu/3C8uRbPyddr9il5d3MQa1rlQUQ5iO4JZXwO1P
	uQjcNk/sk7q7setuWKU6YtaKNnwp8iIRBYFORQxd5kbPaQZD6reHpN1X9xUZnztd
	bKVwb8o/H117YMSDafpMfP0bWvTClsvP0W2rXTiFteHPL9+CKmC/wBodEsGSeYe/
	GNkCzWYCqscv1/F31bGrd2/N6PT+xYloO/RKSvncx3fdlmWcDMEbSZ8H/X8ldQ2N
	d7dyb7Ot3Q9qYMSZhSwp1FEiGArIQhscZQfwz+Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:35wEaj4pi6ZDXDE7lfdg/5WomGpWCIHDHyaBKCZHyw4=:ErmcKCXK4Qc7kBuRGtWtZmp/Yc7eehLhKbwu8GKHMvA=;
X-ME-Sender: <xms:-vLsas9McbPdC5V4lM89N2XBdDkTVw_IDIqNuGWTzz80yzp8bejQsg>
    <xme:-vLsaqslFlxCU-vWCNAEOy8b8od2w6sFQ0sLpYMK1dZAeiO9VfNmesVHRBQVk7DIU
    1mrcbhibD4580FeRpCBc2YhNs5WIDZxdSJR7lxBs1u9XKpECCimPC0>
X-ME-Received: <xmr:-vLsas0UqrIWZghU5QoXDsBpjlMH_D8vCtNflX0bYz8FwdE7CE17nWnH4WrkZetQ>
X-ME-Proxy-Cause: dmFkZTExEsqBxM9FjMdWDeIbhE8L3hVN7kMWAlv7iQ/fe/JS0XCEp7M4H8Ami50TZ1g4td
    Mmyc/EUMxi80QS+t/wPxIpxQKKsHlxwv5+ne5iya8ycP0pAvU/ch3En9g6Wv8mwsS59xEZ
    qh1ja1FcU/96gTK9v9TtOJ3NFRzfwXrwuWSPqNBH1XoMac1x4JQXQ3w0MFDvD5os8aIR2f
    KUQjs8Xo7cF3ZLF3Pe7riq9yAJzUHXlJLUrMU9DdHLlpB0gi4HmNXfX042ntXPUxZocFW8
    sxc9FJRcAE9oWljcE91EFivVkxOqhCMrqAXhj9EuK6NHVEpnCUzOWL+lXGIRnrUNB/kwEC
    xu7NicsouLgWqH/i1k+ZDugM09168lU5K4gAdMMe0B+54fjNcdx7xbhgPGug5rLzQ6xpkw
    +IpNzNNRfBAd6Ae/531qKoqkglwP7LPfM1fiXPpljRE/27Sy/ZAgdlq/vwI7ABdIqWLYnK
    rNY2/H4DTeHEqSwtmiZ0CocIOuWDB41DxYlUpiYCCE4RGtsbz1yvhuIeNv0J/JjvWRMVEw
    Fgt3wVJ718ALHpYRpYddNP4mfjON0Rn5intKwiukSuxUEwp7UNtg/thXbF/8QnkRYVz6Uc
    YNMN8vOItWLseFrEL/6y94BmlT8ZZKlCUhdoq0ahgpqTsqRVF1PJKIg8UkmA
X-ME-Proxy: <xmx:-vLsavQZiZYOMEiX8T3n1-I7Jq9446geueBP7AilclLV4TkuY6MqPw>
    <xmx:-vLsagcHHFTl1z1auImX3KVUV1JsMGrwzfCHtl88-0V1pGnEBuEFWg>
    <xmx:-vLsagfOK-2vqFo2OqU_U-Vtq0gXQjsrQKqwbLwckbD_80LRTxdVCA>
    <xmx:-vLsaq1Gg06dW_gpLfULdd8rYG7yimGG41uYh9Qdx5vkBd9Pyi-IFg>
    <xmx:-_LsaqIW29gxM5sO3loiWzGdh-y-HdxZCY3p2P9JsEiyo3-hwMeNEJnO>
Feedback-ID: ib53e4b78:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Nov 2026 16:19:53 -0500 (EST)
From: Ian Bridges <icb@fastmail.org>
To: Wahid Khan <wahidzk0091@gmail.com>
Cc: linkinjeon@kernel.org,
	smfrench@gmail.com,
	senozhatsky@chromium.org,
	tom@talpey.com,
	chenxiaosong@chenxiaosong.com,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ian Bridges <icb@fastmail.org>
Subject: Re: [PATCH] ksmbd: refuse to read a handle that is not open for reading
Date: Thu,  5 Nov 2026 15:19:43 -0600
Message-ID: <20261105211943.696696-1-icb@fastmail.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105173838.1882328-1-wahidzk0091@gmail.com>
References: <20261105173838.1882328-1-wahidzk0091@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Nov 05, 2026 at 11:08:38PM +0530, Wahid Khan wrote:
> Return STATUS_ACCESS_DENIED when the file is not readable.

Tested on ksmbd-for-next with KASAN. A READ on a handle opened for
FILE_WRITE_DATA | FILE_EXECUTE | FILE_READ_ATTRIBUTES hits the warning
before and gets STATUS_ACCESS_DENIED after. smbtorture gives the same
results as without the patch.

Reviewed-by: Ian Bridges <icb@fastmail.org>
Tested-by: Ian Bridges <icb@fastmail.org>
