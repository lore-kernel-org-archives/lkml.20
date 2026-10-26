Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793017340;
	b=bzqAIMrt6gPtQ1TFfWZK4QIP4T6bqiEKKMgt/7kkDs/yOrizqwmeg9ZXIrkqWqzOWQv5
	 Ef6LXMFpVoewAzBbggFRmB3EaP/lKbE5uq3ntBqsOYufTGG5fWYYfgUVEjDvZ+3U8PH1C
	 25nG0oyhMnC78TC46kV1qGHH/Ezq/0pDK72NdFxpsPMoKymOi2ridUsmu+Sn/Y3kb4F9H
	 bUvMhBDTxCKTm7aoHSoMRldGpwO59VMU/0+Ki5Xs9kiBhqefTgl/RFVUxOTkCWKs3VgtH
	 hMdmN+N7gAvzTnMXBZkZlvOSClTTiSIqpGDGtCTJg+W7mfzC7iRo1j1r2BDD6uzZOCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=PJP1r5/GuQZwv1AbNOj2FluY2esrMbEg2unT6FQO/Lk=;
	b=QnxkIamzR8jc3ToAhUcQgQbULoMuu6Onctxw0uOkTqAkIiLDuqyRgXKW6EzDtPmU3O+e
	 y5LKZW0c3bYbFQ1fnQh5l95ieAQhvCiOgPZ0miTFYzXsDcjCYYcOhjUrKWczcK4/xomis
	 jwM7zSJsQAjj9bCV6v4qO+iukLOpYXOk/ptyeS6NIPSCCb5djyaMzCMcRyynTZOtbh+wn
	 rGzVqB0oxJBE3ms8YDtsNtTFKsdRVVY5V20YWSL0bIDbvBNuymivoCf01KbFIXAHNRPAP
	 mHbqT25A3DXQcAmmpLXX74931KQwj8aH/DRLSRrFWZpfvMYIpNa+Cn99y6WUKyViRPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hCGtBGqE;
	arc=none smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFAF606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAFAF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hCGtBGqE
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9907fa1d2d1so495069241.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793017339; x=1793622139; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PJP1r5/GuQZwv1AbNOj2FluY2esrMbEg2unT6FQO/Lk=;
        b=hCGtBGqErUXyKcyFDWAEr7zieuwbCnJOQBfQ+KEuf/wRvp5C3X/kvgufga2Fus3+TI
         JGvipk6tTyEbL/E5aW73SSvEe46Cc5fwK25STI3XHB76CJ7oVUTx4+k+QlICIwJ7xR4B
         9wtDDFaj95vZWxTPnw2fPHJ9456MDK/plNxng2ACXpQia0w0tHr7Ygh8eKvqL7VtB6s+
         itlo2eDi5isgYaTFl9gNq3whanasFKQCtSv3c4BQ+XIyKxh7oyon+Pv2QcDti2TLC4Wf
         yoFC96+84vfjDF2noO/psLKp5R1CVDzqO0xTrGJ5Hid6J0eL74xYmmKahcui4IMSqr7a
         oeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793017339; x=1793622139;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJP1r5/GuQZwv1AbNOj2FluY2esrMbEg2unT6FQO/Lk=;
        b=yH2mb9c+4zEwH4K5F1k7/i9zvjQwOK6029iLT/cJ8UH1eQamHXlcMbGBFhIDZShd0r
         7k9xUMcNnr2wmA9n11DEhYbDooQo5t8j7UUN/fuYHBGFlNm7IlVa/QB0BWxkSCDF+L9H
         oHXBLbCQjZGsvw4KXoF5cCC60IvgC+um4bPwEVaZQjTFglAB+tfEneez4p4dI2pT71/3
         L/ktWB5kItRNTUGmaEs8vBldWU2Hcus8NrrslZ1DKyWwUAeiF+IaQ2kIlXBAjgQehbwI
         OoIEjuHTmRlcguCv7X3+hfa+GDUDdcjRsRWkjwb8/0o1vQpCZYDE+/FfnxQGv1Vxz38x
         tgOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwOYo5MT/GSMdPpg3Ack7Q5CdYoGl8DHTNyGDbSP3caTbjESwmUeFCY2f4fTsoSkEH713FiAr2fapn12Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJijnAJWqOvgHEjILVhjrjLqPDB/es22dW4ZCNvyM1jkNS1guh0
	0nd7riTNIRho5xq5uBatOrO1J2+8qdYzNdTJCHAhMNoiOxTqd/jZK/wI
X-Gm-Gg: AYBFou2ryQ9F3RzHdTzga2zBdLaew0SkQiy7QqLDfrTM3gQ7tEhPl+sBmhQfgANWevJ
	yG05qTHNJ3EflAsWY4kEENrgoR3UVmza91DxxAbJw3EORdhSUD4HHIU/nAgYwHDo/FQMHJ3mgUN
	OoDIgiSCFip+uintiqcY5Okwa9+izAQpNLWxSJeLBDN5vLOc0Hgc+ds0xpnZUNlh07+00Qiz0aP
	2od5hxpYeiaLzkYa2NgfiDsidNDfh4Sb0fR65lAhwwHMeGiMLZIZhN/A/2MNuYaF1tYFeNvWwMC
	MPQIqCAXvj5LKbYe+W0rsIAlDIRQjBVDXYsd4ISEiLR8FPVij7Y1W/7Pxc1wp+4/aCRnDQx3ALJ
	Q9KcHQrafxFWJKNdbQIz0EQjEfh92ZwQFqElqYVcnP6KH0Tb66UbX5qFSKvrJ7rTbrEpsb4y3E6
	ldUDQm4jBQALE+gW6xX90hi7jW+n87cw944K+ZpZ4H2Yanops0R14wwTXGyEDTvGqLMcHFSqTVM
	t6YAbdx+umrrfc1ZvcnajNilLcqrZl071Nxh3FzU4Uy+KOr2K/oJzANjcDQ1pRbtsWTt0HeIMhB
	HJnJsxnQSgzXNssCz7osuKbjxBT85/rGj6G79ZbZ5souUEdTmNvNTOBtuE0da+W6TAQeryAs5MW
	1akNIOeN5sYB/jlAkbmH9FNpQc8y3OzG8mDPTohFzGFa6r2lf8AfPyH/dEvDywoU=
X-Received: by 2002:a05:6102:14a3:b0:7cc:28a6:ee1c with SMTP id ada2fe7eead31-7ce5ca1e4bbmr1974187137.2.1793017338558;
        Mon, 26 Oct 2026 05:22:18 -0700 (PDT)
Received: from c.1.0.f.7.a.5.f.d.4.6.5.7.e.5.4.d.7.3.9.0.c.2.a.3.b.1.0.4.0.8.2.ip6.arpa ([2804:1b3:a2c0:937d:e94c:8101:376c:4b55])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e6cfb52sm8155548241.2.2026.10.26.05.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:22:18 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Matt Johnston <matt@codeconstruct.com.au>,
 Guikun Yang <yangguikun19@qq.com>, David S. Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net] net: mctp: free reassembly head skb when key_add fails on SOM
Date: Mon, 26 Oct 2026 09:22:13 -0300
Message-ID: <179301733329.91976.14585535037608378942@gmail.com>
In-Reply-To:
 <426ef7428413b8d05b6cc3ac22e24b1927ab5aca.camel@codeconstruct.com.au>
References: <179287946888.17431.11219154409333681184@gmail.com>
 <426ef7428413b8d05b6cc3ac22e24b1927ab5aca.camel@codeconstruct.com.au>
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

Hi Jeremy,

> [merging two threads here; Guikin reported the same issue, around 12
> hours earlier]

Thanks, I hadn't seen Guikun's report. If a v2 is wanted I'll add:

Reported-by: Guikun Yang <yangguikun19@qq.com>
Closes: https://lore.kernel.org/all/tencent_43A65D51143E18518EA968DF9323694EFD08@qq.com/

> We could just defer setting skb to NULL until the mctp_key_add() has
> succeeded; there's already the common error path that cleans up any
> remaining skb.

I think that one needs care. For the first fragment, mctp_frag_queue()
stores skb_unclone_full(skb) in key->reasm_head, and if skb is a clone,
skb_unclone_full() frees it and returns a copy. The kfree_skb(skb) at
out: would then free the original a second time, and the copy in
reasm_head would still leak. Taking skb back from key->reasm_head on
failure would work, but the explicit free looked simpler to me.

> Alternatively, we could change the semantics mctp_key_unref() to also
> free any pending reassembly, but I'm okay with the current approach of
> being explicit about the state handling.

Then I'll keep it as is. Let me know if you want a v2 with the tags
above.

Thanks,
Joas
