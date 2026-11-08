Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138459;
	b=z1ST9Y9dJzEG4ermGB6hxMzwzDrs+x2Rev9tJoY/tAJqMe8gfrbzJuCn85HCGeBaq1yW
	 /3TMGWQWzRaHlNtyd4lx4WMSOaHl38ijGj2Rf+34TtVDvGuN0OXJ3MZH9zBr8E/u/JB6M
	 WlTUyV/oIMmm9j5aljAUA3evnlBGHfCAjnPhP10GEABC03zNILRNRBV9uSDNBCicxGyEw
	 kRXHrpDNlxwl+ZanppfJsPrBI1y+y2mjQ3T54JNQK756YIuWI6tQxUnIXoJZZ96WotvgN
	 df+2StyEyz754Eq3yPWnOmnLBMt34QW4FSflfO+fnR+SdatVVg9PexinczefkOnzfpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H6Hvjmx3E6u8slnggZfsBaEM6lqcy8rkOeo4cE7U+mg=;
	b=GLQWxnaobUja+EWPsbYGD2xO1tbMe0zVPqwc/ar/hqvUB0w8rAE5PKq0ylQZc+bGKI8/
	 xRWO9eOSNL4CPLGCGuS5ly7FS7eBGZc4UHsvkJLopa+DsPrbmfTaw3EghwhvtEermqrRs
	 /VdozyVOL5S8QRWYFnzcqIM0R7mX/TMwelqbXkaLyNxDE2Sdk5MW66+WkuM6CvuGrP8Oh
	 A5HyzpQNSmU4QyF2YFby98N3vJiZNDWB1Uz+KkPZPAxgfaN1/5g+HwTT2wtcE8AxwMeVJ
	 KniCQ8iXhsFjG4F/0pHFF3aXLz0p3O8Y7QZSY4R/hizvZuw9vglJdbs7QwMtrof2bMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xGhIG1Tp;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA2C606A326
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 11:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EA2C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xGhIG1Tp
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso7901366b.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 03:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794138457; x=1794743257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6Hvjmx3E6u8slnggZfsBaEM6lqcy8rkOeo4cE7U+mg=;
        b=xGhIG1Tplo1kH9dcB87zNLRAt3n/9K6PYwIBoLwd1L4PGtDHMoa8ORQHH49CXGl9AY
         KHDU+thupviKWfIb5fg6X0wyKGPB0wQ7sQps9IcQQo1QTs8nRmtX/dxj8AlW/IfZg+XC
         LZ2UmmtM+0M1xXmprmFruUDKQxNtQZU4cczvKKk3Gug42TgbBgxuUJpJki8AwO4mvdtl
         Ni7PzH/PMnw/Uqr9wrI9TqtH13nkEFfPNaLr3M0mJGNQ9afzY7CWJ4R2g2xW6h/r6OT1
         7I2mxijr2UL9YS9ccTF2nIpOnqXrwXBosMfmzJcTAfHNvR/fjqpNC0kSZrzl5Rxy9UnI
         QkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794138457; x=1794743257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H6Hvjmx3E6u8slnggZfsBaEM6lqcy8rkOeo4cE7U+mg=;
        b=UBZtLZLo/zX4+AQavb9Un49AUIedeys+Pfr2EDBg0ZcPr6yBqH6OqP3HeVMyiyNdn4
         qDOKg3TS5qOlajCYWzBKslSL69qyotiShal6ztF6WMSYo45FUAxh81OPPUK+8rAmgkOV
         c+lmi+O4QAQHCuF30x4UJeRmYKE+FRq1OMp75v+SAxfZ279YbTkOevO2eGY7w1Q47gCC
         emmbnm7/L8GzweArauM2Nt+rLjX7P0rdlZ8wgz8k8RRXH/CTS+u4cgfjC1KE85sCjWsN
         K+CReC3ifYftCUx+CB4rpAuiDLnafkYxel4b2+xiHBEb3aS5maTFGGDxDziD5Z4cnUKl
         nEaA==
X-Forwarded-Encrypted: i=1; AL+hErHnBIZOekCXTCVjUeCGaoV+Ksw+FCqAv7Ni2sgFfdDZVLWWv20xQq84K2Uzo60S6gcxbBCwATptZiS6v2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Kmic94JW/noKtxBi92gXWsaAxJDOPFd1m8fhuPdjXKlO1a9iX
	XeXUN0kRGayDzeL2JlMp1+5QCjp2nXf6dRIzesGMdqejH8a81lImT2s3H566x0h8QA==
X-Gm-Gg: AYBFou2MKuP/EIA8iT/vqT0Fi28U/h284CtuJSwyRFEd6ccdjAceYGpoBb/nRI9jYGA
	rFpV8RTicvH4qLZOH+pgYI/2dGmBLEnQyBCSbMjuS2soqeNCvGzOgte26NMxFlIVoYGHFl7ox8L
	85BUHQLn1gXcvmgDSXSlAeOwKYJ4TWHnjXP4R/wF2u4JEqxQXmCn+uFGBAVzi+bTDNOC9LzyRA+
	OdBqluQPwV8OFPNBo8OaTXey0AvmkW2PedVP10otprTjDub6vY/NTBXfiT7CGZYYSnhFcq5Jhvb
	C0okY1kuhrR6tndXrYPuZEp4K9/7oShHs06gDX5FD8qdHVVyjHTTaOIuS00wl4XUaz8s7YWBuv/
	dAtubISwasKVMSinRmg24ZHHkGsQD8MyLfBeAjzAAC4L7+CJkTSbmfGT8RpnEhN648na0ainGap
	D/xtPpUJJA187d31zBB6ab3Qd5qbNly1i/D2zeY2f9IWkRlcWGy9aoOOFccs3IwnJCX1ylcWznX
	nADDBcQlj6nAEc8oxvJae6TDIvlitZ5vq6vDjUY/u6MYz4/SnMUyqbrid/ddTSejYssMyHfIVZF
	S08jF+4P4OWQmJw7bFzCWsTtEkdHzt4HAdblaa80JTlSrdTOlTBIWGODPOy7aTtNqz0oQD/jSEz
	N6Eqpms62n/ES8sw2/5QARy9VsZGQGRW2SG3CtmRV97GeD+Y8fopTRsmEzoQb+m+30+uv/Wpey0
	8ocgQKIo/xssdCvvHYJUEeuhQs1TWlY4o3ik66t9OGp43zMmSa3iYwW3yCKDwkVJWsqJQB+JqAp
	FsFGG1zejRx1YDrlj7AZciGzb3SlI4xaNQ+9y2tEGhtQz4sgPsiI+OFVSvQKbzJ7GxE10akqeGt
	DWvtof8ZZKzlYcHrEA==
X-Received: by 2002:a17:906:4792:b0:c4d:31c5:e30 with SMTP id a640c23a62f3a-c4d6d7ced04mr87104766b.49.1794138457495;
        Sun, 08 Nov 2026 03:47:37 -0800 (PST)
Received: from Desktop (p54afff19.dip0.t-ipconnect.de. [84.175.255.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ed3b32sm490083a12.23.2026.11.08.03.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:47:36 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev-bot+sinfo@kernel.org
Cc: razor@blackwall.org,
	idosch@nvidia.com,
	andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	olteanv@gmail.com,
	netdev@vger.kernel.org,
	bridge@lists.linux.dev,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/2] net: dsa: fix host fdb refcount when an entry roams
Date: Sun,  8 Nov 2026 12:47:37 +0100
Message-ID: <20261108114737.124573-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794134495.git.julius@bairaktaris.de>
References: <cover.1794134495.git.julius@bairaktaris.de>
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

> - How the issue was discovered, e.g. hit in production, hit during
>   development, syzbot report, manual code inspection, LLM or static
>   analysis tool scan.

Hit during development on a Xiaomi AX3600 (IPQ8074) running OpenWrt's
qca-ppe DSA switch driver. A station roaming between a DSA user port
and a Wi-Fi AP port of the same bridge logged

  qca-ppe 3a000000.ppe: port 5 failed to delete 02:5a:0b:a2:1a:46 vid 0 from fdb: -2

3-6 times per address when the two ports received on different CPUs,
and not at all when they shared one CPU (4 runs each). The dsa_loop
harness described in the cover letter reproduces it on net-next.

Julius
