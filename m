Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662688;
	b=1AgtXQm+VbjAS7lm7focs2BUeqS2Q59VcdZ3Wcfdz99E0TjxN9NAQwPbcVrj0CA79L/1
	 KRYBiCehOPiCjZQ/53DxPe4eYT4ZY6TEpbIHg9j6+OdqEbFUs6sWCeuv1Er/FB1RqMEo6
	 kkXiTE3fCKoXL93uueBilrlnKKzKmU9EUzhT4GN/bOmlAHt3vumlirMqGRtdnGEUObYt1
	 T1WP8C8av1w46guwQ4JL8pqL4O5UVgZX3YW/NroxL+eJvjR254MrX8SF1ObuIFn3U2O1R
	 XDYJDkpj/L8pfV7GTk7Hyurttjud8U+cY1bmEecvPPbL7VOLxC3UJ7Aid1L7Mb+U8Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=VgQ+KN2VyFhEnUQIyYXKW6M1JeW0WUnB3l+NuZRm2I0=;
	b=wUdlUYXp+72tO5J8YXWj1ecUAmC2gLuA/hQHmxAMeAu/UwNwTAYATGKakxoY48XPwk3v
	 dsNoYadIu+wssHKs4dnrzz4YMYqUIqGvcga+16grOSqWIi8nRSyMVyST3pl+EP1OJmRB1
	 GuRBejM7/lFjsOGeJIYS/ooNzFN7nqYCisctbVLVQ6qyTKCW+qgCjaAODqcmtSN0Lzr77
	 9DDFpHwsihwOa7FUjvwHGvMSZNLxS1XZoSF4xpNLGOXT2c6aDy4rlbJ2pKDyyOAVqEPp+
	 TwG7LKOcMLCOhJaehl1Ti9W+xPfP+2SDsHMbqt0hBbuDszcEQVNzoHEk6aI0u4npGnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DwrWH4g5;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A90606A33C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75A90606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DwrWH4g5
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-35dc2af1f2fso1468899eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793662687; x=1794267487; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VgQ+KN2VyFhEnUQIyYXKW6M1JeW0WUnB3l+NuZRm2I0=;
        b=DwrWH4g5a2ySoC+GOC6eDg0PYRp7kGP9JqdiDDKQU+vGcurm0exab5wPwxJ0QyOwWT
         2Fy1qABOHcYH4XtCS9N93PB3f5mLk9h1CqWwZKRqQOE0783eu+1pjl+5aBSA8aIDUT5y
         kRsrGrXLGooT2yuPKu1NHWCBJ8t8DbWXvJHSr8qpg7OenSVvzNivb3UVHBsv8XUuzv3d
         EFEs/jZg5QvPXc78m9V/s4lPqx8NYIz1h4wQ2paI/UL85bH2HHR5x0gwnKVWe5NepVeM
         npoBHLbHCq2DQ4oqarJVcLy1iMxKK3M4BZkpFG4cdgyiRfVDfKbEiy4SLaa+Z8J1JNQU
         F6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793662687; x=1794267487;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VgQ+KN2VyFhEnUQIyYXKW6M1JeW0WUnB3l+NuZRm2I0=;
        b=oBSIIeCekB3MDfq+t4AerhQZA3bH3xOKF41z6js2nkRf19gMZKUF2QWmJE0guTnApH
         cJNqFrxSEMD8y8uTn2CycvfWa+fJdUQ9yZgls03d+DI4G4AVK1zeMf1Bfq9tQgO9K6tF
         pEjNoWeJqOngL9sgK5C6yQ0MeYIDKG5JLVg37crZQ8TXmjSn2fSSKVuny3OhZF+KtxAX
         ghFsasPbP2b2Wwp+LM03ESE7A2G2X4sEAtqfGCmgFeKnHb2DdJ90a5L8WjhytbLvf/Ax
         VnHiYoOcQBVLUp5y4vc6TibSgTarMkI86joGz2tpKVq9qrXyAfh1Y4WlZq5ztgUjXfR6
         Rbpw==
X-Forwarded-Encrypted: i=1; AKwUvBxzRJ+lTAKauCF6IOPrg94fU7xNv/KtQArzhMmgI6KZTLtPGdlvMOxgEQNYq9TrMo1vfaGHlZcAcrKhxes=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WtK3/c35grBNa7TTZJP1P0FerB540dqyP62dbQIxbHu9mfKnN
	efYo7PmPr5L6ltjCFDJIEzNHvNLyMDdzzWh6B0yTHR2wN7TRaB0kYiXo
X-Gm-Gg: AYBFou1Wqs58Bn7nuYEiNMA2Z0fGiNAKeHMpXfthIzvb8gElMw0iWWgUBVrIzZ7rB4O
	i+ohJYmJBT5E7/Mx3VNjhXZ5Y16bheTyX929R6iYR/ELCYWX6uhObIcfOZACNCDSdXZ2JLnrx1a
	PCIZZAB5qEqwqjrQoGhmSQZDZY+JoF7zcJM9VB/VuJb+GeNSqhliuaZRJczLSDXlqec5sCm4B6k
	JCcMXwMCmGgxKXuMjUA1CCxHP62o+e55k8qlmCmKA8escAgF0JEg8h6cmzQ5P/xF/QLJMWwxuZx
	pKgKLiunNCNEDPIYe34aJC88SQMe4ElgtdU2mnl6nJLEuecEPZ3cyZJZ07m+pndixtu1omkvZfk
	Lv7D4NPZiOrozrGvSJipcebg9lHcoiSEMJHQDmBV9o3oqEp33xmwlHuYbrD9fm6lXeKgXpw6eIC
	uKzDw9cXbQW67NZ8YJDWtCf1l2FPG1FmEH1i2apknvD225RJNjMnGd/1weMwdWNhGd86uBkpBi3
	uwR9kmokTft+cNGEM5GR23KNyFj55CIn4pwYcy7RJbrs6hXxX7OkywIO47nlWWmnHrNuiFxVGEf
	ow3KZ8Pm/xhYpeW5MzWjiw==
X-Received: by 2002:a05:7300:c7cb:b0:36a:214f:169e with SMTP id 5a478bee46e88-36a4238426cmr18543511eec.21.1793662686396;
        Mon, 02 Nov 2026 15:38:06 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:41::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4239ca83sm1701518eec.0.2026.11.02.15.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:38:06 -0800 (PST)
Date: Mon, 2 Nov 2026 15:27:23 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, edumazet@kernel.org, 
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com, sdf@fomichev.me, 
	bobbyeshleman@meta.com, asml.silence@gmail.com, daniel@iogearbox.net, 
	razor@blackwall.org, leitao@debian.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 4/7] net: devmem: add a per-device netmem TX
 frag size limit
Message-ID: <aukb2qxV5Y0b3H0N@devvm16445.scu0.facebook.com>
References: <20261102191438.1059771-1-sdf@fomichev.me>
 <20261102191438.1059771-5-sdf@fomichev.me>
 <CAHS8izP6BmNJLUdKR0DpqieOVXreR7ycKWmVbtbBtP-kHy7HOg@mail.gmail.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHS8izP6BmNJLUdKR0DpqieOVXreR7ycKWmVbtbBtP-kHy7HOg@mail.gmail.com>

On 11/02, Mina Almasry wrote:
> On Mon, Nov 2, 2026 at 11:14 AM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
> >
> > Devmem TX frags are bounded only by the net_iov size, which is about
> > to grow up to 2MB, more than some devices can describe in a single TX
> > descriptor.
> >
> > Add netmem_tx_max_frag_size, U32_MAX by default, and cap devmem TX
> > frags to the limit of the device the binding is attached to.
> >
> > Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> 
> Abstractly LGTM but I'm not sure why this is TX-specific. Didn't we
> add non-PAGE_SIZE rx net-iovs? This should have been a problem then.
> Either you know what you're doing (maybe document in the commit
> message) or we need some more alignment on RX and TX.
> 
> TBH I was dissapointed when LLMs started reporting that
> binding->vdev/dev are treated very differently for RX and TX and I
> have to write a cleanup that consolidates this:
> 
> https://github.com/mina/linux/compare/devmem-teardown-v4...devmem-lease-bind-map-dev
> 
> I think maybe my reviews and yours maybe should be more mindful about
> keeping these memory things consolidated and as much as possible not
> RX/TX specific.

This patch is mostly a bandaid for bnxt which can't express sizes
longer than 2^16-1 in its tx descriptors. And rx is even more restricted
I think? Up to 32K HW GRO aggregated?
