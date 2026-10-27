Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793072208;
	b=OULC8yGMlVZ5E5pHuI9Yfx8khIKqgxNuP8b3elaA6Yg8ThghCsyF2fvSkqMgo/ApOirS
	 wDiTVFeGPORVzp4Mh+9AcnLRm6onh6Evke2TLif6TLw7jKBxTmyggb4OZR6OH9tvMn1LK
	 UEs3WU3hng6MKAFI2c8sPYPfseSCpXkx4tQoZ7//HOjrZ96kI/PA4j9QIzr6wXklDIFxu
	 h4BD9Jsvat8SjVl4SxBC3Yzwo1P7LNuLCvTLP8sARLHrHxWKnde/LecGac4Pxtpwa/Dsj
	 fBr4Ah9oiVxFjm2VlxFBG5MfEgcQMH9eBWtfnEOorQWJWEetsUtoWxj51sL3TFFu72g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793072208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6c7PKsG38+tOfTfvUEgpG6Qz3gpdcpa+17ieiPJrhz0=;
	b=K2dJTgwln1oLqw4dP6zmFGdwPK73SwGXhZabksqjRv2TFyikIIYgvUc4TnFx4GsD35sg
	 Qdj7vTyzwb4+GL3Q4exHB8HujOp7SJv0AFgPcl+7hqducJezse4/ai4HdttfM9+VVslzB
	 I5sHu3WV3QWQr++YjgCdGhWx+M1H8MTW9oTtskLrSkErZ8K8PQlWC8p1M5zm67JDTfdAN
	 Nk76zIHHebtCIaDGyzmmo41OXmR237meihUG4wPYSz+DSiyxYa7+GukHasImh/q7ew02w
	 wn11knoFcfhZjEEDpY0XqX0dvrjLRZSskdWWMfuo5M5AbC7NdelMlLCReR1NmcQCYdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MRjOpxl+;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A447606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A447606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MRjOpxl+
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48afbd2c386so2216028f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793072207; x=1793677007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6c7PKsG38+tOfTfvUEgpG6Qz3gpdcpa+17ieiPJrhz0=;
        b=MRjOpxl+8GGg1ztN8ltrKhRXrV7iJjTqadrmooRNsM27ZIJ/xqV2fYpzyT2XflNm3Q
         ozVNLb2fIDRVTO4Rv76j55QenRfaX9SC62L55NNTTlfZnH4aR72dupaG+Pmz0fEkMTfC
         VafkbS+bxJ7pJjb50JKYUWAU+NHgP3lQHOe4mLqgrn8yoBFPAJ5T531ckfGWRWHBQquM
         60OCmE+UYDwlP47vPduh1/64QZO3rBvDpeB/NqdYbKTctZv9lpzovkgP0pKcN9/p/9Y9
         U4wNgOg/Y+xgPl1AK1KBrUUaoZSKl+t0j2ORpry9qBzK7KxLix/9PWv4wgI3cEJw0Xzc
         cL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793072207; x=1793677007;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6c7PKsG38+tOfTfvUEgpG6Qz3gpdcpa+17ieiPJrhz0=;
        b=M9AcYNI54ME3FObx5Z8puVJRdtbzJrMcDxeN2KiDDjDDabtnt+3+Ra3MVrjDwD8Dsw
         tZ8prN4ymnv1bG2wzHv5AvjbRu0dhIBwWQ9vRqlYpJbeP1FMrqN4RsMDI59S21sDRZzg
         3gkFTkqSA8Z1BWffF8PFvSAwAtERU3KMVzjTWVxFjvuDvKRJ+DhTFCMgMoqJvLfc71E/
         w4LP1Sdqs/dvWXRPxF8S/pUoSmYASxp5dBQnLdRx1kgJYs0JVaOHd5tPk9WvMo2RAUPL
         QsqbdPQ47ZBPCo4xf3eaz1bSDIfKXgWCpRdaWhMl315sFcAZO2mCNlrgYEBgQAT0jZOf
         CTaA==
X-Forwarded-Encrypted: i=1; AKwUvBz+ZhJOThchkzkioNeP4ZhJf6JfngEw6T6MfwshB2hES79+sI06BbQgcjO4VhbPHwTH6TFtgO9D4TI+rcs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpANo+G1F9A8Bt/y9GvlgMKHpVTZZ+3m4vqBFDBvR9aHAgWEMJ
	ywg1sk9xithcCigOGGjoyjjKV/aj64iYfoTvuOvZunrmhRBxSItgscI6TsGeV5dCfFg=
X-Gm-Gg: AYBFou2/iLU2RhsOl0R/hB0s18oCZxYINZUA+QEL8a49JnuCielMB0CBXThZ73DMvVj
	waEpyXVpA50gY2aMHnNnp5jepuvTcRp2iqNHa2xXasLTD3fNDOQQEBTKmX4+mgUJWFZfXHuhQsA
	QbtjdaLyORze9SBIl9MCcXUkYCGFk+jT1Kj0vi5HbiOWLrRoPj+suoFWAkgszyPaItyFZzfqQJx
	vnTHMRwJkM79u1IClEQxXhcTVW7lCXQkLtFmSRQ/GnR1KkWmwoVQhsp/kQev2bW9jlNCsrWN4Oy
	61sUl/SjEaUcmacZHIzSfWf7lLCGSNSb6hL8gnKTzTHnLL3RdXAVkbfohMMleq0eGA+52Vw36hI
	hY7MYQIU4pc7IOoY4RK02zNpL8XJVjO91mOKIvnPdkNDFlaWQdzsRb5f6nWgcs5fosRfpMtQ2pT
	R77pODiYxGPKoHKG2Aqh7+Kz/DhF84MEdeii65VihFQI8d9YPtpfmlyMsX2KrsrQ7rrnSlmPgrm
	I7w4eKLNVFA6Rt1Zaql8IlF1rZYGdw4tHfI0E5VY+tJCQajYb/07EZe7BGUoaHXVTYUBWdKNgfw
	M8I5Cilf6LLpxkUJAa5WN83EJoTXkn30rmVEmjNrR630O73fupPPEy3YaSuxpyqqSyMXqWWXegP
	lsUpmcQFjXEetwgA1XVVKBa75R6fX4BHYLaETcU6nr2C9YYU280/Tmib7kHEnq4oKTuO8b5EY25
	d6vAbW/ps929WP0d0lKZyrwxei
X-Received: by 2002:adf:eb4e:0:b0:48d:ef7d:4b4c with SMTP id ffacd0b85a97d-48e3eb936e5mr10274220f8f.44.1793072206749;
        Mon, 26 Oct 2026 20:36:46 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-b2ac-9b01-6900-1f92-d182-4435.310.pool.telefonica.de. [2a02:3100:b2ac:9b01:6900:1f92:d182:4435])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd39a9sm20409291f8f.46.2026.10.26.20.36.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 20:36:45 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Shuai Liu <847807867@qq.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-spi@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] rust: spi: add SPI driver abstractions
Date: Tue, 27 Oct 2026 04:36:32 +0100
Message-Id: <20261027033632.77840-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <tencent_66EE264CDD33A4355946E42D9ACA7019C409@qq.com>
References: <20261027030352.615926-1-847807867@qq.com> <tencent_66EE264CDD33A4355946E42D9ACA7019C409@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> +    pub fn write_then_read(&self, write_buf: &[u8], read_buf: &mut [u8]) -> Result {
> +        let n_tx = u32::try_from(write_buf.len())?;
> +        let n_rx = u32::try_from(read_buf.len())?;

Could we check n_tx.checked_add(n_rx) here? spi_write_then_read() adds
these as unsigned int when sizing its bounce buffer. The individual
conversions don't prevent the sum from wrapping.

On a 64-bit kernel, VVec can provide two disjoint 2 GiB slices. It uses
vmalloc, so the kmalloc limit doesn't bound the inputs. With a bound
device and a successful 4 GiB allocation:

    use kernel::alloc::{flags::GFP_KERNEL, VVec};

    let mut storage = VVec::<u8>::zeroed(1usize << 32, GFP_KERNEL)?;
    let (tx, rx) = storage.split_at_mut(1usize << 31);
    dev.write_then_read(tx, rx)?;

Both lengths fit in u32, but their sum wraps to zero. C then selects
or allocates only SPI_BUFSIZ bytes and attempts to copy 2 GiB into it.
The allocation size has already wrapped before kmalloc sees it.

The C helper is intended for small transfers, but this safe wrapper
accepts arbitrary slices. Bound doesn't constrain their lengths.

Found during source review with AI assistance. I haven't compiled or
run this example, and I don't know of an in-tree caller passing such
large buffers.

Thanks,
Karl
