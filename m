Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505453;
	b=FniHr6IQLSxawDoKw46pByE916Sp19F5skLxdjMEO3qZg9jocr2uiocF9bnW3251mZHR
	 bsklam7C4aCR8r1qCO7PwpAh+u03rxIuclq4HVn380HG0OHQjCQtXup2vSxWk6JDvP6Ny
	 f3NpWWxrDMVR+d2BdF3W/g7I/VQVLMyDU035Gpe7rHXz2kW99W2QTyqjba6GmrcpmTUFN
	 JAUfdD66bXYZVIvr11yT+++vuGFBpVtkkAwVhr+0W/T0TU4yt8ozVziEPujkFdxbDluZ1
	 69j4BlSveXN4LYiqFKQSAd9zd6Ukv/TDwH9wJBzbIpDsMsXp9U6q2FRbrzDy9nYdWzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lrob9qv+VazU3d/PrmIK9skaKz2AB1VT250mGCPx/d0=;
	b=WaKlc1Sy5k8t00/FNbkmSv+ajostMHTY/AJ50IyX/NDnzvxS4djpDXBDbRfnKuy8dwcb
	 Pp2Fv0diIcUwMnv7a035toTsUefOAyyy7SCF9uMaqVf3KalaFB9l8ywhrAtdP7+cNoG+H
	 6QPjKGmU/sVrzjEv9sKziCw2UVLIfLQDCysFesZvPvrh6QZhOwzLkxUAfTB1+vjGcnh6w
	 VETJ5ZCl4clKmjegQh+udELibbdJp603xZspci7FJhWRi2iavHqBSJ75ScontTg3f/qIZ
	 kfMRMyb2lsR3I2jGIZQlbMzKrCVmARBQUfyTJCV913Y3zEyUhHrY+J/H7My432TgoNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m+dulpYm;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5275606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5275606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m+dulpYm
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c50604721c8so449202366b.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794505451; x=1795110251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lrob9qv+VazU3d/PrmIK9skaKz2AB1VT250mGCPx/d0=;
        b=m+dulpYmXdlynuPe1wdh9qEspo5Ziu2CO0ZeyexvZZnhqGjn8hm3gm4ntv/V6E0y/j
         v92qfCSfn+Tc1r7tUIGTt7fePZgkpLPorPHlv16m0SKp7dClCjHucS8lVRshFM9QRC9z
         OPiFPkC7Kncv7AFVvAkDdvhPNifLE4Nv7p0MQ/eGRQ4/5cR7R6NC3PZwc1mycKTarBqC
         vp96sg6ThQgP/OI7LnJ8RX6jZlUMv4GLAfSl9FNS61FYCnzkS9pHoZ2iU/kn+14nlEsu
         NDIZgVDUipga+HU5e6vqy8vHuDevVn4+1iX9UgenBndWHWkYuOlP8txSKEFu+Kgs09Di
         RRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794505451; x=1795110251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lrob9qv+VazU3d/PrmIK9skaKz2AB1VT250mGCPx/d0=;
        b=e20u9u53OvBf8UZ6/NrVayXSeMDj6I0OCk5LJX6fyFwAUfjGQZXzy22WOaEAV52tcs
         f1XpQo41m9e59TPQlC+n8MdphJRRPbypjSLnliNF8wuOjzQNudSa4bV5efdSWR678iOW
         vUzMxdGeBIIAtogamO9UrKecW+el8SXfcr8J3nmudwxgA1DFJc9zHyTBkZK2qj741aMJ
         owUxWNF6sp/nTn6bulA7LZe6+bGIuMpEnxyVWivhDpCmNWjTPCWJPXVQ9Wdd1d1n9k6E
         yhr/YnJGbz9S1kssmg0EBSg7TiTSZhnYgs9Mv4++ILoMvaC/5EsQ55kxdKeLySD65IJb
         7vRg==
X-Forwarded-Encrypted: i=1; AL+hErHQ4/ndQJ4semKaSoRnuXja75IGWiBmZDYtAD1PQw1eday4g/3fPYKLBStpAHjqU/cpQE8PrHsPij5eDqE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZjI6GL06Rt+Buz3CYj8a2JXsL4BEQp6Uw7OIjrQ/2Vl5MF/AR
	2QjPEPw2ziVFibUuNRmPE8GKWPoubdXI3bfABuF0L6Cj1WvUzSjaYAI7Pog13vys
X-Gm-Gg: AYBFou3EKk1oTVq0+CPynVRAwp1J3TV7MffcjB1qSaGF5y/ijQhzbIdS4kQhmMg2f4F
	m4MdwIJAi3Jd1a0HLFLBp9DySJLTzXB6zUmkFHVAvTSOlyxhSIASaKEQbpaf9HqahkXIwFGwD0r
	yexWvRJzFJiETR/i7+motWotRY8obslX/sUvwO3kkzPqXBEgvYgVlNQOCoshzN7SSLmHnTg45SI
	yxMbI3VGtFMoSe80cjr/6FoNX6co7eI6CCCKZedqiuJuM8nH0NjSJVHTDRAFEuc8TZGwm3HhDHc
	uJWGrg7XPFPzAWMRVoSSd4tzAUfSUlnWGSTNQ/CyCXiZC8I9bNVA70htGW5bYP4pJCo8yPjAE0h
	NJNDwanyR3qBmCxhjp4WIbCSPv7LnDNoV+wN+gWDKTOzUcNWqIq43zrLXUqUj/DIMMLVTnPpK9Z
	CdIj+F+nThbrtxJ5NM8iEPaIyqEj9uk29/Gwes/59c4OjBK3+ji3F/OPUvOu7wKl0bIhaqkIb7p
	mBikUqmcI079cxi9eSp0oriVuR5o0zzte9K0uWPW+6NvH7D5bEf2uxb40dx/Y7dvDj+SEWBek+S
	tBBM0Zw8KHSVB1y8Lk0tJtfbgSj2lHRzrB1viMGK
X-Received: by 2002:a17:907:7b8b:b0:c50:62ca:6f7 with SMTP id a640c23a62f3a-c5066aee469mr588548266b.25.1794505451147;
        Thu, 12 Nov 2026 09:44:11 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8fa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b79146sm2042066b.68.2026.11.12.09.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:44:10 -0800 (PST)
From: Kordian Chmielewski <kudzo51@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	bcm-kernel-feedback-list@broadcom.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 0/7] net: bcm4908_enet: TX ring and DMA fixes
Date: Thu, 12 Nov 2026 18:44:08 +0100
Message-ID: <20261112174408.391972-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112091323.3c685f8e@kernel.org>
References: <20261112091323.3c685f8e@kernel.org>
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

On Thu, 12 Nov 2026 09:13:23 -0800 Jakub Kicinski wrote:
> The AI review just got posted, please make sure you look thru it before
> sending v2.

Thanks, I went through it. The points on patches 1, 3 and 6 are right,
and v2 will fix them: the early ring-full stop in start_xmit() in
patch 1, the TX DMA that is not waited on before its buffers are freed
and the slot->skb race in patch 3, and the comment in patch 6.

I'll drop patch 7 rather than move it to net-next: its trigger is not
reachable with the driver's own settings, and dropping the frame did
not keep the DMA running anyway.

The review also found two older problems, a missing TX interrupt and a
failed RX refill. I'll send fixes for them separately, after this
series.

And I'll drop the nickname, as you asked.

I'll send v2 later today or tomorrow, once I've tested the changes on
the hardware.

Kordian
