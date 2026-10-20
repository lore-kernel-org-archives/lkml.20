Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792466519;
	b=MC3fNr0prO8wBobkTYHbCkNlJS4OaVk6JG0NS0saRXVT6ZrolSHx92aXW7k8b72zk0Nc
	 qH9CswK1XXFXEEEV4pSR1G25W2L0rCk7QB9UX6bbsTX3jf2S/m+H0P3HZ7Ckn9GkgKtn3
	 ygGtL/GnIDNleXVP4iToTDLynJApSLKuydOp8tokD+nmprTojcY0Tmapr+he08hBgpn1n
	 OTFOKfSFlnmeLq4H9PK+0I7fKYG4o+kdMdMA2NZ534gJssY2h+tTVyhtCC70MjHymJaqP
	 frFZUZo7J7aQM80UzBJA3IL2ckJsEGiBx0aNzvKwSitcVwfeuQDH/xnUad8d/HZ8BSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792466519;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gnzh+m64uMxXKaq6t/vdpcSaRLdFTK11HDMv+R6rWJw=;
	b=34wBLuCuXSYT2OBgWzhnjxrSNcfw8MtAB1aey66/WKG+1/NeeM6CxHXnZJAN8rMix60E
	 TNSrkLLSZ8QTm1MxE1IWkkfhusbheyrIM6IC958iR0KAsDM0h3EyDSSGLSd+5OtSFWihe
	 rqEC/zG45srIwekuzV+a+5YN8ORMkjsTGqE0dA+S6kmDo9atFRsT+AAWwoDP/wsHwiY6s
	 ojj8K0fyIQdZfdlWU0OuL59Coihu99fW2vF73qTZCCfY0CwkU1lxZMN59G8bnqJ9Q79QD
	 4wxYUeCjx8KV/FKrBkBigb9y6TUSpPQfwUezWa5XCOmHmtyvtgTND8Ue4vm4bGNoy+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=kDc6S37x;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B43606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09B43606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=kDc6S37x
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 243D13F97F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792466516;
	bh=gnzh+m64uMxXKaq6t/vdpcSaRLdFTK11HDMv+R6rWJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=kDc6S37xhECSvMudc/RhaZruUmgJQZ59vTHoUlXbAZ8Lpj3OWnewB0PLTXndtT3EQ
	 bP/McniTomXZ2Iz3RlOnsjDv9wNrhQA8M7OoED0xr7AVLQ2s9dTB6MxvJA6r/19JnS
	 WB5PlGu3D/aMbMToo4BKlnGcfiohPNIlz1lwK4PI6uIshR+dDYBiUkFbiKEUQocTY3
	 BX1FHO/akvKAotDM6+ekNUAZAG7iOT5FHa3XFt7t0kJRgl55aUslj627hR2gdyoPnP
	 Nk58zaqrBxKfoWxJSYIpkOgighw9M0Mpd8NWf8I0g1rcWIFwlsivZmyWyxqeLgebHE
	 E+nxINK+aurvuwzx8ttji5xg5lXyagGHfKxfM/mDfBTH/YBrw5KlRVCL2F49DADPsF
	 Sw5mOAZbCgI8rU5hD/7olDWsMA3JIW5UShwhyY7H15IBqMzD6H0xFgQShCnD2tUoPr
	 migebZ6FHKPp/U8KwAk3etew5MzHHOfw/4CPKo62V8YNKh7H7Za7OiU0hZ1gsrPj2p
	 T7oeXrCDggEaCB+sqy7bzsyq41NXwn3LW6ZEzcRm7LJXFkntTnZe1WtjmqETBmFSbz
	 Ucto73ThKs74N3O0s5x/TrIJKK7QqkTBKsRSEF+pSFe9mg4eMtsBebwxf1O+OZOqYx
	 GOIWhjgFLba8O52BEpMtuJuw=
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e617b5e9b3so16622825ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792466514; x=1793071314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gnzh+m64uMxXKaq6t/vdpcSaRLdFTK11HDMv+R6rWJw=;
        b=cikCocFP+w6zM3845du3f07EJLlrd/gyMUTEM3dkiXyYZVDnYuYIjIkcPM7/F3fNLJ
         k+nv1U1jlnDRTN3DHZluW5H8vX5g9Vrk7qXFyKZTcfwnfG12PhOz+pyTrxFc7rEo8Fqm
         +bWFKVRpjf2Dwy6LNP17VfoX8044b1CmYdq+387J7ESmmnz76awSmgwtH0CyIe9nlTUw
         dfVzH3xtK3ViRkuRiAylBco9n5rl/ahea8VBCgTCVEaRNhuBmQENTuO2wc5Ai29lGBaO
         cZdKArEn1JSYZQz8FMJ1uAzd7f+7pYaguEBBrUKoxokSk/NbU/NfSmWKTbDO1OXnF/Bn
         reHg==
X-Forwarded-Encrypted: i=1; AKwUvByxDIOn1GZCSNFlg9KsrKEuzwh8acN9f/HlGzi+OtYUHv4UOavNcjr6cObQ21O/JHL68zU4oqH9pLHsJLk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1lJMn2J5/g2w5Mj5Afmx6v1MrOG0yMx7PF2HEVXiH/kcOeU7H
	eeebBRtRqm1tvHO1DBLlN1dg/Pm6SSrOKfiIEnKC0PsPaZWtEZvLXy6mqztdq5my+Nuz/UAodPM
	FsZriRdV4Z3E9mWosEmEp7AOz1WOm75n6G5bVNKSCoQgWcZ/4Mc3dicS7dGTs3DrXTOIS3Zipvc
	oxkPGKqQ==
X-Gm-Gg: AYBFou0ga4EHaE9yeymWJJHpCNUOPiWl9Fg1RHtKyjbuceWRJqTLAJrHcoMbDCwURKo
	mBdK6RM4KCLxh2+LgYoMTW8fotoSBKL9HW3CRmwhsEuxBBRZf3rxgRcR3cHLDOZA9TZdeTTSKlw
	6oPxDRrWwcWE1Y5+UYT9MrXBjGJA8o4KiYQG+8nWeL/q4l1XDiEqZFHtTCP0jdM+mA1J3c2h7Dh
	nDFqSzX9dQdJlJrkWRRuiXOSHM6xrx87kGlSoG8PicM7Q0DNSnSyNjayPxS8mg8LpYKeYXIb70K
	SymIVoqCmx6yeuIcEHF7ccQ1Lz2WnPchXRyZbuWy0v2ZYzFqUPyQw1KglyAyLkmIE2TNasae1Sq
	50OXrCpF7qg==
X-Received: by 2002:a17:903:3884:b0:2e9:6972:54d7 with SMTP id d9443c01a7336-2e9a7058929mr78152865ad.52.1792466514272;
        Mon, 19 Oct 2026 20:21:54 -0700 (PDT)
X-Received: by 2002:a17:903:3884:b0:2e9:6972:54d7 with SMTP id d9443c01a7336-2e9a7058929mr78152665ad.52.1792466513956;
        Mon, 19 Oct 2026 20:21:53 -0700 (PDT)
Received: from ZBook.gateway ([123.208.39.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea14dfb7absm7674745ad.38.2026.10.19.20.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 20:21:53 -0700 (PDT)
From: Changwei Zou <changwei.zou@canonical.com>
To: herbert@gondor.apana.org.au
Cc: changwei.zou@canonical.com,
	davem@davemloft.net,
	gaurav.jain@nxp.com,
	horia.geanta@nxp.com,
	iuliana.prodan@nxp.com,
	jeffbarnes@linux.microsoft.com,
	stephane.debusne@cynove.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lukas@wunner.de,
	martin.kepplinger-novakovic@ginzinger.com,
	pankaj.gupta@nxp.com,
	sahil.malhotra@nxp.com,
	sahil.malhotra@oss.nxp.com
Subject: Re: [PATCH v2 0/2] crypto: caam - Fix RSA destination buffer handling
Date: Tue, 20 Oct 2026 14:21:44 +1100
Message-ID: <20261020032144.961571-1-changwei.zou@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <asdIf-bbjjSHRNh7@gondor.apana.org.au>
References: <asdIf-bbjjSHRNh7@gondor.apana.org.au>
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

Hi Herbert,

Thanks for the review.

> If a caller provides an unaligned destination scatterlist where
> req->dst_len is larger than the actual RSA output size (such as
> key->n_sz), the bounce buffer is zero-initialized and sized to
> req->dst_len. [...] Could this corrupt adjacent data by copying zeroes
> over the trailing capacity of the caller's buffer? Should this copy
> only the actual hardware output size instead of the full buffer
> capacity?

There is no out-of-bounds access or adjacent-memory corruption: the
copy-back targets the caller's own dst (orig_dst) and is bounded by
req->dst_len, the buffer length the caller provided. It reads dst_len
bytes from the bounce buffer (sized ALIGN(dst_len, cacheline) >= dst_len)
and writes them into that same dst, so neither buffer is overrun.

That said, copying only the actual output size is a sensible improvement,
and I've applied it in v3: the copy-back is now bounded to the RSA output
size (key->n_sz) instead of req->dst_len. The hardware writes the full
modulus-width (n_sz) output - the RSA PDB has no separate output-length
field - and caam_rsa_enc()/caam_rsa_dec() guarantee dst_len >= n_sz, so
the trailing capacity of the caller's buffer is left untouched.

Another option, if keeping the full dst_len copy is preferred, is to seed
the bounce buffer with the caller's original destination contents before
the operation (rather than zero-initializing it) and copy all dst_len
bytes back afterwards. The hardware overwrites only [0, n_sz) with the
result, so [n_sz, dst_len) still holds the caller's original bytes and the
full copy-back leaves the trailing region unchanged. I went with the
simpler key->n_sz bound for v3, but I'm happy to switch to this if you
prefer.

Kind regards,

Changwei
