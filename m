Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793998790;
	b=IYOQP5g5vOvKAhYKCgrVOYArEX28KAbRfgykl5fAazXPjRYg19t+TELBFprJPeUeLA+Y
	 C9Dz8cA5QjrUuacrkUstZ0UU8VLy9B+UoMZBMigdYAwomRMw8u1+Lahm2WdBrd8mVIk9p
	 jnT8vqdJFbHr/w8raJDNA1z/YDYCQnG4x3jmk6iVoRtQwIBCsnpsz8agWSPpjGSpHHEhk
	 ZLJYQcqdsVnk8VMwJBnEtbvUs3uTNyNdp/gsjkyJCfXZ6KVbcmDlTIvqj8R/q1J95WSYe
	 S/YYqo8Lo4fTALY03t0Ji5cMZDIYC+cPpQJ6MMI6jNSZUjAaN9bGdxjmQf/o+N4QzwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=eK9wS1PQJuaruDa8ED9WMpeIWcZDcL+VTSMog5FV1LQ=;
	b=XPC8n9qeJiTv9EWqp1tf2qo/xdrNh/Yx/ExNbq4oaqQu3qa/c9YDq+mNZ7EW6b/+gSaU
	 xGvy9QwIWQBpLzdL20LuJZF/K21a+fTWW9x3IlNaZp4rumbD0aco8wthTmtOks8w5dHiD
	 yGAL6M0yHgXd9ma5gdo3ZmDW216QwRKQjdTxUbKLgUGNv/QDHyoS1/F2ZAu9LVBN1LJTn
	 cVsdbnd/goc14XVdIVbOLVJmnoPshoEddOnzmndp6RsCyVkMVNWrzW895bs2ybdpGBa1o
	 ulAOXIK1cyPeSMPe+BX8b+haTD33Pzz82DjzRPN8ikihxojIEc4HhuyITAD3TeeMnxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Cwf6HK40;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DF0606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5DF0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Cwf6HK40
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4ced671398so137721066b.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1793998788; x=1794603588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eK9wS1PQJuaruDa8ED9WMpeIWcZDcL+VTSMog5FV1LQ=;
        b=Cwf6HK40lU7xC/Aq+E18OIAD4vMigdTT5o4cMnerIWvLp6TYoR4YiZDzRFG20v5bTY
         lAkRSHgBUUdyqkv8ESyzn9pkoupsyjlBLKAy39kY815zaoEuP8x3vYIGDHvSQD9AaLLi
         Ld/1vpDC4o4/INtn6eIgliShhRgPntP3gl6fR8v/+aPKjExsL7O69vz3BNsiS9p1EZn6
         1+Ca/O5dqSuQqc1ZDIhf2UxNI2VA36XwpJYr3orF49JaaGa4jjLCdr0tCsm2ZFre4sjJ
         UzjfZUVNHr+q/guLz9RPTQ44F4/mNcwG4YcJ8zfDiPaOC/4Sw5dZmVxETgTeEgIvOGES
         iSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998788; x=1794603588;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eK9wS1PQJuaruDa8ED9WMpeIWcZDcL+VTSMog5FV1LQ=;
        b=AyjUKhKLgL3LqDN+o7NcFG7RPJCyQWWjLBvK4pmEXHFHdE98tWOBBkfzyDYMrNkxPp
         RihQG2CwaPzPIIf621IL3Yy2P/ikLyxs4VwI/eSAkSVTCS9DGCopXl1+ieo9hyBUeOFT
         o/FwNhQcPaUWZVzN8VTiVhj65k9h8X6d0E730P74fY1Sh5K+Gnu/3c5zQKRu+P8PuXqN
         f3H3iIkHqk3PYG9mI6ISvmyF8z4VC24Sp78JNdBA8oiWnghNugJJVo83Hd8Ay6cHhS8d
         xEQz437DXzX2cF5ofWgQ2nfSguW7ypMR8jha9sQzCEgpYy4Hd2W1XihRY5XJxF1iHMhe
         5aDw==
X-Forwarded-Encrypted: i=1; AL+hErFuXw7qotHaIFCP8bVbMVyl+9svgKh1FdF1Tj2sSXtby/d9Tt698/7YQLuogkm37MnDXEKVa99Xm0r5a3c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xY98lIKwO3tXNsvgR0xUGCpELy1qwRA9xX/0yV8aDVSaQCeK6
	1ZLPBGiJPx85B+ZMRHlWSYYYYT4BH+OdI7hEiPrJfAOR10EEoYfi4wgyIqM052WXwIE=
X-Gm-Gg: AYBFou32yjy1pTiSSyGDhqB3Q1yYdJI05y1HY3KV6NugwICLfVnj5+5SU5AadhrGONd
	G6VBx/zrivQG2EjjgLwPmxJqPl5lv35PeDj5RaHbXH6uYjfpSR8DccYW14XncVQNVxz+A5QbgxQ
	D/+cqL3XjSCPY1HuAtR6928TUrQXzs71PmZmckJAC+suvrdh+8pBs4RnHWHqi49iJJ7YlPfYda8
	WbkgBNAChVvnWcstjvJns0jIWsYBhvT9q0m6Zd8dlTFtEBbUcD6vZnKLXOGyw3qFikTqW4gD8fd
	QecJMj/8FMTHG45bAEOJcXQH7p89lAl0plvde1o1HeHImqm0lOdubJAVSpQ+OIFbIkZT9geYNPW
	Kk6KKzaDztJiJzsAADn7uKw3EtnB/5TQhckLe19B78unENFc8xpsfrSP4RMSzOrQs/lCoj4+8JJ
	57pmyJtcx9+2lInA5Rld+IlJNQw+Xe3y5s2wJ6lvO7DU2hFy99kAVvgXLjrt8Ue58hJozRzMEe2
	Sy1lGg/nHdgHFlVq+g/3vF0yYcOOZTmCkLcdHgeV3DaS+RZDwgtZukih0iRYrDrHKjvIbRVNYHy
	Ahwlz+VKcfhHqmYDPlbendCxD9WuFgxV/GWgXU76xueqUm/Vy0BQ7qM9KKAf7uNUZqD0V1KsWpm
	gJLTXh7zY
X-Received: by 2002:a17:906:9c8a:b0:c4c:b4fe:c9e8 with SMTP id a640c23a62f3a-c4d35505ef1mr307307166b.38.1793998788172;
        Fri, 06 Nov 2026 12:59:48 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3562df86sm104305466b.24.2026.11.06.12.59.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 12:59:46 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: David Keogh <dkeogh@amazon.com>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	David Woodhouse <dwmw2@infradead.org>,
	netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Alasdair McWilliam <alasdair@mcwilliam.dev>,
	bpf@vger.kernel.org,
	Nimrod Oren <noren@nvidia.com>,
	nh-open-source@amazon.com,
	linux-kernel@vger.kernel.org,
	kernel-team@cloudflare.com
Subject: Re: [RFC net-next 0/6] net: configurable extra TX headroom for local egress
Date: Fri,  6 Nov 2026 20:59:39 +0000
Message-ID: <20261106205939.95366-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <au4j2nQdOwr90ffh@dev-dsk-dkeogh-ai2-36d3b9a7.us-west-2.amazon.com>
References: <20261015235335.4162993-1-dkeogh@amazon.com> <b8914a523b4a6b80424c5001d3d8012c6a98fd04.camel@infradead.org> <bba453eb-769e-458b-88f7-8cc9bcafc1db@nvidia.com> <a8f2f84e-7dc0-473d-afb1-af710d621f69@iogearbox.net> <atW00dwVpYS4WO5a@dev-dsk-dkeogh-ai2-36d3b9a7.us-west-2.amazon.com> <au4j2nQdOwr90ffh@dev-dsk-dkeogh-ai2-36d3b9a7.us-west-2.amazon.com>
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
Content-Transfer-Encoding: 8bit

Hi David,

Thanks for the review, and for testing it on x86_64 and arm64.

On Fri, Nov 06, 2026 at 07:00:42PM +0000, David Keogh wrote:
> Tianyi, you have a second use case for this: an XDP program on a veth
> peer. Please describe it here, as it bears directly on the points
> raised above.

At Cloudflare we run some services each in its own network namespace.
A veth pair connects the namespace to the host: veth0 is in the host
and veth1 is in the namespace, with an XDP program on veth1. XDP needs
XDP_PACKET_HEADROOM (256 bytes) in front of each packet. The packets
that the host sends into veth0 have much less: 2 bytes from a UDP
socket and 64 bytes from AF_XDP. So veth1 copies each of them into a
new buffer before the program runs.

Raising needed_headroom on veth0 is not an option. The v1 cover letter
has the details.

> I suggest you post v1, with patches 1-4 from me and 5-8 from you, and
> the cover letter under your own name, since the veth XDP case and the
> new measurements are yours.

I am happy to post v1 as you suggest. I will fold in the points
you listed and post it on the latest net-next. Thanks for the TCP test
as well.

Thanks,
Tianyi
