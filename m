Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794662358;
	b=tsjomslQ1L1Gzk2VtAONznFfcps+8gKyGYVi3HNcxq6flJPavu9pj1nNfnaaqGsyiX7j
	 cD/RYcc1r+LgrjsHp5UyMOrI2arvFquEaFbGUOjJVEdVFdNuMhrLeGnhRXmptjUdFXeRE
	 VvDoeXAUYq9DicQfMthzyq9TTDxxhLynRYnHzFOCZpbY/xNw8Mby4hYmPP2lzii1j3tVv
	 eED6DUNu+kG00ED8DDV40sGSyXAfU6dYRknM0A0c4697PKC3UqhRAp1vJEboWmYFMhKvE
	 CH/xtvSulYAHoZbTgkB8BWd0L1vQYhkEzxmNlN7tCvpokaWkYxjRxzJe9CrXI/LnycQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=wxTYhvRvzFYh+gzRWgScWVeMkBBcGFa2zq2R3c9b1pU=;
	b=5edgYC3CHM/PtjpCbd4K14FZH9TJeNP3o1Grcc81v7S4Ktc3K4Khxh3PJ9Py04yTycwb
	 J05e0NOrzgFK5OM2VzbJoP8CsssjYxORBzzS/aLdT3thd8inhqYRZkD3uw/0lk+ra2/Yh
	 Kt6lpKRTlDIdhhEmaYC4s+ki7Wxmi8Q+ClBcf/QwAziQkOIXeU262TdSkriiS9LaQMdrB
	 cRq+y79VjkUK+vS9UK+ZevVBJ+UIdgzTVSBEeUFoqCXQiQ8qEoNXUvEz0HGYGoE2/O7ou
	 enBgliNHzECCzSexX6B0hJ1FhgcuWKkCbq/Ty9ojJpDL26EcbSRAEF4ZCB7vcFo39wA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grische.xyz;
	spf=pass smtp.mailfrom=grische.xyz;
	dkim=pass header.d=grische.xyz header.i=@grische.xyz header.a=rsa-sha256 header.s=google header.b=AIhhcIk8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3DF606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D3DF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grische.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grische.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=grische.xyz header.i=@grische.xyz header.a=rsa-sha256 header.s=google header.b=AIhhcIk8
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4697404c2bso296406366b.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:19:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794662356; cv=none;
        d=google.com; s=arc-20260327;
        b=NJUWYkQqFqDGCi+89bLUTe8yn9Qny7OGCt06Y94g65ZOl7YPEMgD7mqePFGFppIVSV
         KBK+HaLMz7WFVfhundhqntWv0TbJCYZTXijBTkwkVr/rS5ryOIOoBYDvppVAAzbiRsUt
         kc9c3zveVWwqfc6Qfxgqh5RMzTQC9suYBOMIZAGfjXdj0YvztO8dN1QMPfVvxtIb1Hhv
         kJRFqmbK5pFAVttE5T6uaTRXP6SXGMwNhrtUmu/ODggH5VRQ6NDPfxxGclsPF3FvXdLb
         QeqWO0xpB2hyWVT/IfpxYT21bNDlf7Oi9ZIEhNsTj+3SOCbV67VqOfIpRe8VRJmnay5p
         28Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wxTYhvRvzFYh+gzRWgScWVeMkBBcGFa2zq2R3c9b1pU=;
        fh=ehfKbS4ctVpmr233xfYvRwUSKqM9DFoT1kOAKOuFTRw=;
        b=Gi5+0greg1b0fKmb3+A66Qqy6c6Zo3dWrhd0td5EoB4giwYoFHi0f5u2QaPS+1cC6L
         5mPCO8LFlPc1OHa3lRxTsZJQNLVHwHj2ZjtVrCDcgDQad0qyzOd5yAtinnJa0dknE0eF
         Gn+0mzkihIWdBg0te5pnse/Jm6Ewk5umZg3Chah/GapYXxXkq2EHHClXsg4uNdmW8sfH
         XQd6Sib0eaXzh7xnRFWojKQw3ZfXr/068PTsojXobRNVwS0jCWrSxyRss3sKPNxCEm8b
         3FNL3OCopNZ/tlBFpdS4n+vonJYFY0GlOcZNqmDCF7kpwjQUnFQJhSJ9ys9WrdJLpSfN
         gV+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grische.xyz; s=google; t=1794662356; x=1795267156; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wxTYhvRvzFYh+gzRWgScWVeMkBBcGFa2zq2R3c9b1pU=;
        b=AIhhcIk85BpB5XYi6cQKrNiT+cwhJuJ1jWvI4eV3TZOOah99AEdPKxD0Qi3qUD1vqS
         pRwkjuvf66o/kCetMo/LYQ3YQqacYyIiBzGmz3Z50wqEcBxLPUXevRrE58C0b0nlHE19
         rM4F6FX0Z4g/lOcbUqCZx5+hWvwx+cdKZ/ctH5H8u+CPcnjZ0TYa8L6a+aDHLI6g1H3a
         DZPvtV6IiS7DzEti0DNFEUrwRXgAAPLZDuaYY/feNgGzDL1u6ERtphD/ewuSaNIqVBN2
         yTNVNqXW3PVlCzIaoVLUkxAmFwhutRm76yxDgwl/L6fRhnxPTKrTNOK/jyoyouFqow5Q
         aJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662356; x=1795267156;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wxTYhvRvzFYh+gzRWgScWVeMkBBcGFa2zq2R3c9b1pU=;
        b=OOuLqmdCR/LuV0lBx96+PG8xUqomoydsmu6ML6CYX6p2L2pnXJDQ2NlPtbQoOstxkb
         a9t9Fx+m9ij2E68XcncsZETZPlNKrsPlxyFvUNZNOhncENHjnym0AipEegYj62j7nPDu
         guB4VRS/23DXEz86qVMr36TsnIzz6SQS/UCCreMNWuaeBHbaQxVSCmlZYRjWUNKlOgve
         NuQWxMIGDI6QeflGma0TD85d5m5LAcKBvzF72SB+K9SMSbdmFE9FEsPDQ/09SsqnTRe1
         Kv1E16j34enyahShygMq1eAHO5N/9f09kaA8eWTi4WbI0BccZgY0Vpiv/IJRXzWRLq2h
         N13w==
X-Forwarded-Encrypted: i=1; AL+hErH86RHXiYsfqmdyKzIt3jlWbE51+sYqMrvHkxjwJNkvc+C8BHlNK8i9BZ0pfGNI9r4nHgBnutxAWWVeTQ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GWNHlOmHqyPY8cctWXQ8sX8cv9UIxdymR5BtBQTQpy6C5t4Hl
	r71Q5vOl01AkGDsPTp56tU+LQvptmNzzHMLzg7nwfnPW8Ga59wcUMqTt4fnaXNU0X4NvKdCyneR
	vzlfDs8cYoxYG/4hwpomp+ca2t8lGNQw/HjgplmnZvQ==
X-Gm-Gg: AYBFou2G2SNDLpOkxKNvkzsBZebwytff7wYuSr8PimNJ2N6pCsRaX94XmtdgAbJGIqv
	PIlu67w5H1I0sa+4r5pCSOPYHDeWf7jeS5sGzddFTonk30zDTMQyp1OSS6waVC7L0J/oR4fPQlz
	9KbbSJYaqIpSR/oi1ej3/nosCJC9o3GoEausxzLoDd0bXgxBa+61D5kz1+OZnHpLsPYjcWHHaA1
	D5rTRI999mj0OaAetAc16zkSdVVL9F2RYBwfPtmeUIJqa3urXoR95z1Y9h4AZSdY76MecLOt13K
	UKzWkoHIWIYl8s6ajMURJjHQ6LZ7oXy2NbKvtN6us/HthRyioPFRa5YEa5bVMln5qJCS0jyy6iP
	lkHY6SxMPBqQFeZiE9QOYhnDwHRusjneaw/Rzkwhv+Iuzuh0ALfmXo8sXcRcyxghzLlVk5LU=
X-Received: by 2002:a17:907:9622:b0:c3f:dce3:20c5 with SMTP id
 a640c23a62f3a-c50968394b6mr566230866b.44.1794662356386; Sat, 14 Nov 2026
 05:19:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104151914.2651241-1-opensource@grische.xyz> <20261104151914.2651241-3-opensource@grische.xyz>
In-Reply-To: <20261104151914.2651241-3-opensource@grische.xyz>
From: Christian Schmidbauer <opensource@grische.xyz>
Date: Sat, 14 Nov 2026 14:18:51 +0100
X-Gm-Features: AclHuK-t4Vi3tD5hB2DBl1bIr6nwi9vm4FOrc1kbogOcAMqHwa7CaPoB_seqTKw
Message-ID: <CALsH2cy0OUN+6EA3Jt0e8B5JGGhVpyR=EuFOaJvxOv-LnfOOvw@mail.gmail.com>
Subject: Re: [PATCH net v2 2/3] net: stmmac: dwmac1000: don't discard frames
 with only a checksum error
To: netdev@vger.kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	Oleksij Rempel <o.rempel@pengutronix.de>, stable@vger.kernel.org, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@nokia.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Replying to the Sashiko review [1]:

> Suppose the MAC sets ES on an oversized frame with a valid FCS only
> because of bit 7. Is that frame still dropped here?

No. In threshold Rx mode it reaches the stack if it fits one Rx buffer.
It is marked CHECKSUM_UNNECESSARY only when Rx COE is on and the
engine reported no error for it.

> The giant-frame status is also no longer recorded anywhere.
> [...]
> Could the status parser be told what bit 7 means (Rx COE enabled and
> its type, ATDS or advanced timestamping)? Then bit 7 could be part of
> the mask whenever it means Giant Frame.

Dropping or counting such a frame needs a new argument for the
rx_status callback, which all four descriptor implementations and both
Rx paths use. I would rather not change that interface in a fix for
net in order to drop an intact frame, and I have no testing hardware
on which bit 7 reports a giant frame.

[1] https://netdev-ai.bots.linux.dev/sashiko/#/message/20261104151914.2651241-3-opensource%40grische.xyz
