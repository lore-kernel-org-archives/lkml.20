Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328660;
	b=YQ3BE5JSpgXsZpL2g0E40K+B52gUJwROU1HILb5e0jjQFpR0z6kJCRe45HP0ree9j9Js
	 PeGq3Y72jzH9SLbJeYKlvdYVW/dgbS96rNzOa9dKMxWvmCG8GpbI9ICieHpOAF4NHtC++
	 LfBkzXTR+fPDemeKOsM+0WcGgG7cLKhH8El9o8WjEIkX0Bjc5MMiGEcOSDxb+o9FdzWYN
	 0EDui6AinMVxkRQPQIbmevXw7rzK8tVc82n2gWoCYTH+a2nMcHKct5PIVtqHJmyl4WDTb
	 hOyYnbj63RqjmQSs+IIzNa8VAx2msMB4a2Ga2j8pz0Qlyzyhbe8zkcTAnEbNYWkRK0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328660;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mdHUO0VGLnueGxzHTpyhsQE1fh1WvgBQfjWRPSJDDzY=;
	b=pCdZXhwXB2B38ojUBb/4FSROijfrQn/bKd3zCIc0QbRLyZJ57BA/vzHeZ/CNjqepf3Yy
	 yhf5WO1WjtzPixIJG28ekR3jmZK00aRmONYVy5EMq/2NrN47LdBoauJu3BeqvZI2p/6Wn
	 JHfRCY72L5c1B/xXZgwRnefC7zLIEKPupfr8BG78EAUZQkOrzFfsMO35JzCMt09WnQ2Gu
	 mQ0K7NDdkrRznOxbFASwlReJqr3OkWkKRBr5L05CdY79441bODy5NH2/8WxvIo7WZcZMn
	 VQxM7QmGncvxk+3lXmktaP3qYl/MSdxWzf4f+HEkSX3os17x+hSQywWf+odUWm+isLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zx2c4.com;
	spf=pass smtp.mailfrom=zx2c4.com;
	dkim=pass header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b="ZDZr0U1/";
	arc=none smtp.remote-ip=209.85.216.101
Received: from mail-pj1-f101.google.com (mail-pj1-f101.google.com [209.85.216.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E7D606A216
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58E7D606A216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zx2c4.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=ZDZr0U1/
Received: by mail-pj1-f101.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1253854a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:37:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328659; x=1794933459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mdHUO0VGLnueGxzHTpyhsQE1fh1WvgBQfjWRPSJDDzY=;
        b=hSfkTAO/TktUqs0f+vm1Zzvkp335iDMxwXL5+aRVO6xckB8sx7L5/KSsdzDbXIP/L2
         CxRn/wACWlY7imlUZMSkgcXUPaqXXIsTJKw56j7eU50qcjFpULN5j724sUPAfzvycbk1
         VTZK5rk/2TDaKB75ZINEpInUMexsZ2NOXh2oFvH+ZCXiH31L0u17Rh42zpGBxjBFn/s9
         iSCdVvEgTqU5n/3pTTdItlY15/xbYXban5C+68aKqAjIpKv5ol0H+pbPQBjNk3tX8Xar
         kvPWr2tcihOSOWrygLGxMOCaUonjcgslxhfX7LGNnwCVL5TevSPMJ3HBrYpaENv51e5Q
         zecA==
X-Forwarded-Encrypted: i=1; AL+hErGrtLlpExmw77S4sslUY/Pn8gkxf0l8AaU+5O/JRw+ziaQz2eDRH1udPeDLeAavdhqxk52zTrtJhpn+yyc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zD9L3i882CuC3N66+k3TOYD2K4u5EwpDU17NnS/SP8XPSRLsD
	B0x2IjcokDq67+G1zUQl5O+sakCHAupuIwG2qQFZiJIE5bP8vPyYoO7XN7ccZDPhTZaz/AG2mHS
	epU3H/1A3Q67iS3S2hGWdLC08sv/Lush6YaJScaw=
X-Gm-Gg: AYBFou2Tzdsz9o31o/EFoSPtcxkV1/fKv1uLxLWwrhqcjhLOQH76Xdu90wLhyWi+9Cp
	JckXIJkpKH5sYJBzlOko6kFVcb/O21VIOynuZ7qUBWqww+zAOZQsv8TR2exqE1+7bpMHqhW6nJ6
	F7H3C0G0bJoJzPC7MwymoE9YTXTs8yqtVC8rkMQun8L3C4tOy+1jMz+V+3kkAEwq5a3c8GVVCa2
	tAWe2tDh23SyG6H7llyfQmLgoqp/iRM7qCuhFVNx+fRAtRD2HaMPv75yWpDV7rCPeP3tdxPJk7C
	K8B79TfHxCnn7ZNZYenk1dCMYBGw6/D4axT2t8NHAc5p/zS43AMR5+xjfzwIWYElHyBEwhmO7ZH
	XfA==
X-Received: by 2002:a17:90b:4cce:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-3b166aef2b6mr3328097a91.3.1794328658562;
        Tue, 10 Nov 2026 08:37:38 -0800 (PST)
Received: from zx2c4.com (mail.zx2c4.com. [104.131.123.232])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b168f056e7sm995427a91.1.2026.11.10.08.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:37:38 -0800 (PST)
X-Relaying-Domain: zx2c4.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1794328654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mdHUO0VGLnueGxzHTpyhsQE1fh1WvgBQfjWRPSJDDzY=;
	b=ZDZr0U1/pHeEMipCNGli2iMRTX1nXQLbpRmDwcZEDOQ+B4SQBTWVNZw7weGFZUxjHl3Gs6
	CMtZfiW5dbFxczAM63Wv9EWm5qrgXInVmcuokvE6TMadLQ6zQieK0QropTRsBjZ8DRH+nq
	xTO39zvfYLBDk4s02DwIKPTGdFI373E=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 07eb770e (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 10 Nov 2026 16:37:33 +0000 (UTC)
Date: Tue, 10 Nov 2026 17:37:31 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Andrii Pasichnyk <apasichnik9@gmail.com>
Cc: netdev@vger.kernel.org, wireguard@lists.zx2c4.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] wireguard: peer: free packets left on the per-peer
 queues on removal
Message-ID: <avNIS67grg_Qc5Vy@zx2c4.com>
References: <20261003201625.4572-1-apasichnik9@gmail.com>
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
Content-Disposition: inline
In-Reply-To: <20261003201625.4572-1-apasichnik9@gmail.com>

On Sat, Oct 03, 2026 at 11:16:25PM +0300, Andrii Pasichnyk wrote:
> Reproduced with the WireGuard selftest VM (x86 KVM, 1 vCPU, net-next):
> remove a peer while a UDP flood keeps its receive queue busy, re-add it,
> repeat, then run the selftest's created/destroyed object check. Over
> 2140 removals the unpatched kernel leaked a peer and its keypair 5
> times ("wg0: Peer 27: merely created"); with this patch, 0 times in
> another 2140.

I'd be interested in seeing your adjustment to netns.sh so that I can
test this myself and validate various approaches. Do you have something
really minimal? Also, is this a test case that could be implemented
minimally enough that we could integrate this into netns.sh permanently?
