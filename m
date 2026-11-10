Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278862;
	b=HVpMRvM4x6rvr9TWUTJaRkw+OBJJfM268q4WKSng3R6v0v4cAHNJBUnLDex0XwqiDUtN
	 ns0+gEOp5dA78lkunuZGbXP4Ng9Mc7zpNrm/jFKmzq7nkIR7EV6t9hbDnu+/zrgPy5bQ5
	 mk8rq4JeQwWVrsH1BQseCyC+eQMi8mlvalRpkCqpJHg/yxX1BVsMJ34djvlRk8sLKZs4j
	 jMGRqFO6dB1906z8EwGszRzkdCHoOcus/tjTN8imNUU8n7YZdgQj1dMHctyVCU4p7Ue5E
	 +7T7LJU195TGrKlW7A/3gcdvha112REOYa+kRlOQ/UpP7jpUK5JoVq7PaahIzeN8dYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=OGI87JTmKxRRfHEIswCBbT6wa5pP+uXrDb2vu3bdzdI=;
	b=vwIqhWvuBk0hC4e+1n68fpwiTH+HNIzx+SH3q+PWHQYwoV2XOQcydK6U62K/AOFObztq
	 KtFsBlMrv3u9ocUXyM8waaB45hPfxzKj+sJjU+abwWBkEy5OfclbtSAOAxadanEvbzx2o
	 NJSsf1Onl7i1lWP7E1sQop75JICzikYNyyG9fwRKowBdZTbFQgFayxB3dZhYQI9o79rbN
	 /SxnW1E8xz1qlnCuVjqcZ7z42PluNO/LrBsQ36qjjNnWRWOZq9I8SbYivau5z6QPajmw2
	 7et1I6ur8wFYdbASmAIkaV3i/DfE/XRJ/IHBW4zYOogDscmZnYK0oRt6WqgLqOO12EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xXDhpVPK;
	arc=none smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64CA606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B64CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xXDhpVPK
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7d2e1abf3eeso1206503137.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794278861; x=1794883661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OGI87JTmKxRRfHEIswCBbT6wa5pP+uXrDb2vu3bdzdI=;
        b=xXDhpVPKhEwmXYlSdgVQWRD0yKtOa/0Jw/dE9lGk+00h/qpIBRBu6nYBUWXUzsBIKu
         Mk8lf9mhxkiuZuVqgGV/DcNb6gN+cqUzzGaoVl5hEoVetgWT1Qa6qEvst+uqueb0Rluy
         rBpM45G0Kgmf7f7iLFzxPiXDygzfN35egxwAa8x2ibzfO5rHCUYA8aFVS8vz4Sid4MJh
         tx52lBzwWWNdu2Bllk8DdCHnir32H9HeDfZcmF9poJ44gPcpBRnEuLO/ceeQNmo9So/9
         ZnR5bGpZAXa1CAiDxN+3JKm0XU4q8b6B+hCLP1i5opauNmPLdkxI/Vd+TEPrE4qYv449
         BA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278861; x=1794883661;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OGI87JTmKxRRfHEIswCBbT6wa5pP+uXrDb2vu3bdzdI=;
        b=OVis3MIl6vJw8UvPOUFSaqYccOQ8XqELoHExksi/BMGoZCV9OkFcdQZgQdGzp1mzs3
         pOT1YkaWewp/X2+kSGZIRsth9YzMCliGQEj29tCgNvITE9tgHbowzilc8zU0T/fOIeyI
         6JzMUaiPulHy4i2jGCLhUjopcVDg2ogqN+ba+bhINsM2yVYyTtiUSUwDfYHbsVQRpFqh
         eCfBpqsfevDPYDk2brHQsxkzzdUOBqT+1tU9nQGyB72ysrA9/WsbzwphxYUvr7gWNuPe
         ZqaUTiQkE+pzS3tOvH3j/NK66xchiWdS4anZVym4u4DUmdKMNEyC6yG0cam1/BUIHhOc
         7LSA==
X-Forwarded-Encrypted: i=1; AL+hErHKB4Fid0hkkBxQwOQozDyBcrXthXG6j1H5Rk6SS+BFEhlUWrmkwGbAh12xPdUGkMsccAI96+DeQaH/I3Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gUL7D1qGx2N6z4DEfH8mH2pgNY0NuK14e+66MJPQM442gvMl/
	CvYiu1gg/QcGVx/jeqvw+PrPBBjerdu9CiBkWpQ91krqCtFB50d7zSSl
X-Gm-Gg: AYBFou0XA6hrllvrW8WctUbw9pQTyXZlTyZLxtgIYutVEUTKcKTkTmLioABNcFlk01g
	UTlkH++aXTs1+wObIoHroG/wqNyz4NFAEwkyEToRN7nyGYJFr0bHtr6NOnhncp+Z9Xi3pJ3n+9g
	hcm5vVFSiirPtNckkxSjLXGruaGBw7+homrJ4bWr11eHCf3vSOenG0GFsxip8MJ4I0zVWWrbX1B
	1o5WOq2YvRStmsI0OJhzjjR83Q7yMzgDfKsq8MfNSiFfQwlj0XJvnin11g17TFPJ1ClVqcz2NK0
	xUUTrBzFPWxcyIWMYg+Jb1lJNU28UAOjkYkmWYPt1dyY5Vi7eIG2vT612A9zLF6SQ9snEJU/yYA
	0PwiuEPHq09le/gDl0e15+30SvDblN/TgZFOkCvTbhqc2Du9lL2Kfx7pM+XMH4d5bDkf9QGL86e
	tOp1FUtKoregWGmd9tjNRuNQFUZdK3Vz1LnTJdDQLuD7YaBaLCLH0tTDw67hk42FEGDiUAOT84y
	KkV9a6Zb4AqyDRCLb2dprUsoM34V0cb/NCZMT79ehWvCsCWYywsIKJbvFjqy0ZkhD1gNo3+mh6h
	d3YrEUfIUnzLVIZQwXQ/J2DcOFzZ5KNAEuKrrmViBduan3U7ITifOWhoHf1kAQaRBk5R5O7XFVu
	/3M8I4Yo8qqjvlNIM2Wm16/+jX66Fh11vjqvOvau7RE4nvESHPSW7UwsNn0NwC29KvQGChQU=
X-Received: by 2002:a67:e116:0:b0:7d2:d876:fb3c with SMTP id ada2fe7eead31-7d3011e2755mr389213137.35.1794278860666;
        Mon, 09 Nov 2026 18:47:40 -0800 (PST)
Received: from gmail.com (223.230.150.34.bc.googleusercontent.com. [34.150.230.223])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c2019bf87sm1116873241.11.2026.11.09.18.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:47:40 -0800 (PST)
Date: Mon, 09 Nov 2026 21:47:39 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Xia Yan <yanxia@cmss.chinamobile.com>, 
 netdev@vger.kernel.org
Cc: dsahern@kernel.org, 
 idosch@nvidia.com, 
 davem@davemloft.net, 
 edumazet@kernel.org, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 willemdebruijn.kernel@gmail.com, 
 linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 yana06070@163.com, 
 shuah@kernel.org, 
 linux-kselftest@vger.kernel.org, 
 willemb@google.com, 
 tpluszz77@gmail.com
Message-ID: <willemdebruijn.kernel.2c8d7027641a5@gmail.com>
In-Reply-To: <20261109014400.9025-2-yanxia@cmss.chinamobile.com>
References: <20261109014400.9025-1-yanxia@cmss.chinamobile.com>
 <20261109014400.9025-2-yanxia@cmss.chinamobile.com>
Subject: Re: [PATCH net v3 2/2] selftests: net: exercise SO_MARK on connected
 sockets
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Xia Yan wrote:
> cmsg_so_mark.sh sends to explicit destinations, so it does not test the
> route cached by connect().
> 
> Add -k to cmsg_sender to connect first and send without msg_name.
> Check connected IPv4 and IPv6 UDP, ping and raw sockets with equal,
> prohibited and zero per-message marks.
> 
> Add an exact mark 0 prohibit rule before the connected cases. Connect
> with an allowed socket mark, then require rejection of a mark 0 cmsg.
> 
> The same test fails four IPv6 cases before the kernel fix and passes
> all 54 with it.

nit: empty line before Signed-off-by block

> Signed-off-by: Xia Yan <yanxia@cmss.chinamobile.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
