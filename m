Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793381034;
	b=u1gXZNeGpTSO6JFC4EknpMxbu9hHb1hiXQnTOdwM0ic0QDV31p6k8RJANJT5U8eYLwHd
	 3KAVCGWkUuMEit/tPBunq1toHVbXWvV2/FZgdTlPo4xzEP1KZCF9LovtOTFeeDSlyW/ag
	 Xq7VN1iiJ5q8Y1tPjP8/Mo98rs24ILJDWDvmPzpO8CSUZZ4lYOS7xhjWpwK1Z32M2gf/X
	 S5DHI7qnBZGgVhIU4r1sMHiuy6gqxS+23m0paWbf9hAqkmxZMppEIeFYsPyZffgX4Kl+x
	 2oN4vhN+1toROV2k6wgO/LP/+910C6EF9+0GIPHce5X+jsT0g06C669+tncJdL/CTfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=S4N8TPIiWWlaffvzOsFOBPVAruHG0QeVKLuSe0btBn0=;
	b=1zc/hNxIwYgL31AxLYY5i0Df0efkYgK5C/7JPj6Gjk3dsD7iObyYsDQTYdoVB9PFFAmW
	 dx4x4x1cX8k7VOLhS4bVbAZBIZvdhAEgaMQwdzqnvgNMi2ZBfmh7bb3KItqo2IbaXEDvI
	 CV5WVSThgIOCBAkqpMl0x0G60vUvVUBWg85uUNSthnWiw04myP28rfAB+zwJbgWEv+lrr
	 SQqokyBKyGwh7qMrvB2Ow+k4NBNW8LdnO5dhqNbL/xk1vnilvVPMCSbcAUahLDkhNRq9v
	 e0MBjMI5dqZHrXBNxuXK2+S44/Da32fSCkdN/p5LN7SvLIO/UbC3vBzKGtgSBkiqMQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YTFGJS3v;
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0E4606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D0E4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YTFGJS3v
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-74ab99038afso634799137.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793381033; x=1793985833; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S4N8TPIiWWlaffvzOsFOBPVAruHG0QeVKLuSe0btBn0=;
        b=YTFGJS3v3/aVDq4+r1W98vA45nFikeEjXo8wFlXjxvzYjHxAamD00S60pVWGMr9R3y
         beKrWCJ0qWberEkhh0bByA0ycVRgNqWu0BXG65KC49jPqu8l/cFFZrpkkV+9MBj4VHQ1
         O61QSrAJShl4k7wjoMoQ1FNNzdXfb74iQ07MncyhUPfD7s4DPxAxUeqM+pfxpISs5whx
         z5q8onutacRwRE4rfvaQ5OHAB3fShOZDjunP6yrM6o2KKw88204Xtlb9mTRzk6UVHtwM
         H40OuU0oD/eOv/Cn/JgfyqWl1gmwMfz4Wo3qRf8OgvOCp9iuwPhyN7cYbzO/uTLe9SxW
         1PpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381033; x=1793985833;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4N8TPIiWWlaffvzOsFOBPVAruHG0QeVKLuSe0btBn0=;
        b=wX19dqSs2SR6jIBKW1x8OaUrlI6r+Y9GyyOPHnwXH+bHh95htNYejwCbMyHFn0B+8T
         haw9L4aIjsQGX5dHRqGfHUAd4J1o3PiVyarwSW8UEMiVGXvlyFYmXbl2cuIIYdhyCnIY
         +Yrp92rcPtg/iARm2Yt1WFBJKEBl6Yn4uPD6s7wFjjfHTut/umhk6LOTNJ3wycxwc67K
         /eyW+g8XFKY0hgvEfkuWnaL5B3+gh5Au8eFOMLsmFuLy4HhzE3ajPnhH+XeEdCrQnOrS
         tUDRcbhEv8tpwtX/EUYlUlqrvJrgvUtoGjpmiCr8MP+2seAsl/3HnLeTbjQsgMdWyf2n
         321w==
X-Forwarded-Encrypted: i=1; AKwUvBwHInJ9NmaPqFYi4gbsN6fTsgFKPHyy04a+3pBPtBYgMOhcSHbzUl6Q23LVq4j+yx9TcOmYMOi38/kEKb8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4rnY6DGd02WgPK7Q7kTUjo5+s+2TVPoI0yYGn5iyG50vVEo6F
	9N0iO+8OsjyQE8BSJu/IxGZNSLVl+hdRTedGWFlkdNWPiY3yXzWBXDk7
X-Gm-Gg: AYBFou04Nvcv3P23IA1ROWq9RGLNFxogwQIUdXV36bH1nFfLiHMfjicXyfwzKC8HF8A
	poEKnI8zps7NTDxR2gXttAZqIBK977udig/jpIWvoB87FwhCERE8dk9x49XfXYaZlQsLPlILmvC
	b9BhXPGfmaYUlJFirkBECFycVGR5FCLpkZmVKZGMVDPpzT0PHe52mwMKffkoLPHGuPgTmxJR+hn
	t4IquFO/sA34s1+ZZl4VeZ6U1Jn0vwJKABtMJ3JmHt6yFD5+VocQK6fOdUTEVnydQ1IWJomZu9r
	TEDP8b5T96qfX3LCFyYfaIM9L9/O2N6YidlP22htXnP3ZyaFpntQdu3HEVWbUfXfJE77gYoEHfm
	nGfs+w8aB62GG3SPeWoVunwgFzYCJxo3BIxvhlynGayAfEMt306WBGJZGLMM1lNC+RFyI/w4bcQ
	R4lG7ZbNjKErSznJNW2PtaZc2aV1RZseu53Ed3X/OtQsA6onqfgDhk1W185O1tX9NvkrJJ2fMr4
	41sgHkdI4pN9riIU35BGfQVToFLMecpAWI+FmMzadp6GkvG9nGpheiTe7CEUgLNwY/pcCKV8Xbs
	opbrTKPL8NQDfUb9Sr/ipwC5besuMpOhKcl3MYj//INFiUN79efDUxm6zPyxb2byuCN/K3U6xGN
	RxlB1/pArXdJvNW7YCVWZWU7Fhlv2O7nvHsDZOvnp+2bkqnpt2mdtO3/jd64PGS4hqkZbjGcWTU
	m407ve+KGtOLrNWOHqYATNqS5ctjgLWLDexB8Qgxw=
X-Received: by 2002:a05:6102:8092:b0:7cc:56a:58d3 with SMTP id ada2fe7eead31-7d07279cd1amr1615059137.31.1793381033093;
        Fri, 30 Oct 2026 10:23:53 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2804:18:15f:b9ba:756b:b70a:a34a:8232])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07754c1b4sm2990154137.4.2026.10.30.10.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:23:52 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: =?utf-8?q?=C3=96mer?= Mete Kaya <omermetekaya0@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Mina Almasry <almasrymina@google.com>,
 Hangbin Liu <hangbin.liu@linux.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
 David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 syzbot+88435e204734072bf39a@syzkaller.appspotmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] netdevsim: reject port addition and clean up
 ports after a failed reload
Date: Fri, 30 Oct 2026 14:23:45 -0300
Message-ID: <179338102577.65907.6165293008000000698@gmail.com>
In-Reply-To: <20261030001444.289973-1-omermetekaya0@gmail.com>
References: <20261030001444.289973-1-omermetekaya0@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, Oct 30, 2026, Ömer Mete Kaya wrote:
> nsim_drv_port_add() does not check devlink_is_reload_failed(), so ports
> can be added via new_port after a failed reload.

I sent a fix for the same syzbot report a bit earlier, which only
deleted the leftover ports in nsim_dev_reload_destroy().  Rejecting
new_port once the reload has failed is the better fix, so please take
this one and drop mine.

I tested this patch on net/main (94cea342e891) on arm64 QEMU with KASAN,
running the syzbot C reproducer.  Without a fix it hits the WARNING in
bpf_offload_dev_destroy() and then a slab-use-after-free in
devlink_bus_name() through the leftover netdev; with this patch there
is no warning or KASAN report in 3 runs.

Tested-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
