Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794069156;
	b=47ixRWUxdB7Ya5oA2+8zcr1AxyxcjwGDqgVu4dcX92J13/1Kkh9sMHvSv3cUjU4a5vTL
	 3ehTttFzFRIg+LYVYDa6hMbVC2j/wj7Oaxz0FSndsjEOFq8R7HCJe2mE1bqUohWWVJ8xg
	 9OCxCWfkRX941NtAuMF1N/Ypxh66/vUjQlCvJ298b0aDsgJTVTIQDyJ9kE5/c82w6nrO+
	 R5hlzihq1j/7jVFP1y7dLGJZwg0fFMNCrHAb3Hua3xYy6UZpxBsBO4dp5mZmet6g5zij5
	 1/h10I3yaJKGnhB596DE4y2NMaP9wpQQxvVOWYvPc4W+WvYfiKDfAiXtFNP3n0+Jwew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794069156;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=LCEyDZ73p4Fs968T72/Rqpb4wVAi1uBgM0/d09J6zdM=;
	b=yZ1FIwXvlHTWEf9wx+lWnj/wL9etyHvbjlW/kDwLT+0KjJ4CYT5hqsblyYD4hMR+taXK
	 +cgiHY6N11rtz/IJbBqtJ5KFdmNY3JVkYS+PL/AVhjwpgXF0ze0kC2brAwWYQsUrOdJXw
	 oKhyHudAFPMX5cDVDhhF8Abiw3ReKIYFgHbF0lfJz8Iq+gbKUBo8EA1VkSsTHgwJjHAzZ
	 33S7zgUIT1pfHLWiEKfn+VQ6DP4SWeErGq+LWyzdd/Fr4FpM1/B9WAvn+dCPQaPh6q7cl
	 CKNFRKDuy5KLtBZHRQu9zwlmztXhYpldMTy5sLkZ0s7K4WerZTE93sgeYQcQyuwlSJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=000ty.net;
	spf=pass smtp.mailfrom=000ty.net;
	dkim=pass header.d=000ty.net header.i=@000ty.net header.a=rsa-sha256 header.s=protonmail2 header.b=j+3xt2sL;
	arc=none smtp.remote-ip=185.70.43.99
Received: from mail-4399.protonmail.ch (mail-4399.protonmail.ch [185.70.43.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66491606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66491606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=000ty.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=000ty.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=000ty.net header.i=@000ty.net header.a=rsa-sha256 header.s=protonmail2 header.b=j+3xt2sL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=000ty.net;
	s=protonmail2; t=1794069152; x=1794328352;
	bh=LCEyDZ73p4Fs968T72/Rqpb4wVAi1uBgM0/d09J6zdM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=j+3xt2sLk/ctI/by9AMqjkr61F8jmdh8x1On3AhwRMLz2RWyp5CC7BzB+18iJqukA
	 vKXTt7osfpnVNuktKPT5UJ/hT070wODUr1xGa9PDgjRxGuSMBFyTs65WSdPK25DeKX
	 8GW3awGEvx4K2YlPTr19xVUy3QxjrKSSLBwHKwT9lUWOB8NiXeQ05RImuipUCTgAKQ
	 /j/eejrgSOeyklzhVTFxfcL59irHW8HwR94trRV/HqjQnkjH1eh4NsVOSUv8nke0vw
	 4eCxI+tJLzTu05Jo5yOuLJE4DBux8JqVgwaYponCuCtOA2NtdfkfDDwhCcRlCN9Hlb
	 bUNmgAJU21kMw==
Date: Sat, 07 Nov 2026 16:32:27 +0000
To: fw@strlen.de
From: Tamaki Yanagawa <ty@000ty.net>
Cc: netfilter-devel@vger.kernel.org, pablo@netfilter.org, phil@nwl.cc, coreteam@netfilter.org, linux-kernel@vger.kernel.org, ty@000ty.net
Subject: Re: [PATCH nf] netfilter: nfnetlink_queue: unclone skb before writing NFQA_L2HDR
Message-ID: <20261107163218.1660-1-ty@000ty.net>
In-Reply-To: <au9O_KyLej8ckT5V@strlen.de>
References: <20261107160517.726-1-ty@000ty.net> <au9O_KyLej8ckT5V@strlen.de>
Feedback-ID: 168296199:user:proton
X-Pm-Message-ID: 6f06466dd41dda5dc2144efb1ce789a8866cd0ea
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

Florian Westphal <fw@strlen.de> wrote:
> Can you explain in changelog why full unclone is needed rather than
> skb_ensure_writable()?

It isn't. At the bridge hooks skb->data points to the network header, so
the mac header is in the headroom, and skb_clone_writable() already
checks headroom against hdr_len. skb_ensure_writable(skb, 0) is enough
and also avoids copying clones that own their header area. I'll send a
v2 using it and saying so in the changelog. I re-ran the bridge flood
test with it: the frame on the other port keeps its original header.

Thanks,
Tamaki

