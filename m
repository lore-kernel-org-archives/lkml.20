Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426987;
	b=2YlcussJwEtAMQ43/otmah1M7WuL5Qub0vE5RCy8QECiGLcHTIhWVp54bk9yC8p44GFE
	 g7ydTnPb6gGm5HE9UgqtcZbclnOt0ra6VlKGKCfJDTg/gpNz5G4Z4u/Cb83/bTpfIqPEA
	 SPfRjFwYv2kaYsGZNFrlAVFweXSjWGToJyZoAEv0fQ9nO2Nz2O84j6iN12Nc9L1RHZRdS
	 mKe/Ip8wm0VSiw7h5pFaJo7Q3XYXH3cXMZaVoEEu5JJ2mGgYEpNNdoe0XhU14s3qHjohB
	 TnwLh8qS6eg6ZxSYVHE11cDhVqATNSUQnrkpLQS3uFfyZ8IoLMnJocjTug+W+LY5mqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=c2mdiRnTGW3Gwps9rTf99dl9KpELe38/AhZ0uri7Zbk=;
	b=O6GCpYinqtU2hFYp2noLKED9YTNuBMYxAmmMBnGnIbcsvE3p3bbZk2OucWQKQfTI0qN+
	 qYSawZNRRhDisUBlIXgv+dn6nD28d+k9zqoWqZ1DImxXVbyac2KLG5V0eALR2tsJOXjWH
	 h8cHoMsN/YpOnZHwXUBg2NU7nou5IEZijUx9AzEORvRF34qCqV2huxW6DymjZsuJRMk3D
	 +tGhEVgTKXAAR6Ouf7oKrcTv4KKdmlFLHHy8MxZ10EFTiRl4XSzsb8TgddAjTTJlEmCiy
	 1BAZ7dIIRDeBVy+Wuxud/ajPvQAGMfXqRwsPJZ17/jm9MLiZ+K+lGDqmVwnTtkOm6Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KMMWTx7X;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0097606A8B4
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0097606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KMMWTx7X
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so1191909c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794426986; x=1795031786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c2mdiRnTGW3Gwps9rTf99dl9KpELe38/AhZ0uri7Zbk=;
        b=KMMWTx7XNrJc0FASemx2jnpRfXqKIqX5CRrqhz0yI/WmYbBQxRu5YZV38bENsM3vOX
         5QhYjS7gsv8KFlU3rnDdcRVxzw3vIo4Tsp5EMeVXVehuYMdCA7VRPZCIsGbuZY4j9keZ
         02bes7rDTA7ab6STvh0T5QZDBcHshnOP1oZ583sMUH+FhlYcdPomwyz5u5tfn54hdKLI
         ZefCLlNyyhny8+7X2qCtLXkIvuv3vM1shMicC9BEd6qwwGaY4nOyB1bS37PjSGPxO/qL
         6T8o8exTuTjfSilbikdwQgaEyMQfTIk+Xl4CIdqtE3sYqbMkIHwlB/g7DJkmzLbBGvhD
         cTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426986; x=1795031786;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2mdiRnTGW3Gwps9rTf99dl9KpELe38/AhZ0uri7Zbk=;
        b=HHlgAUdGPlNSL2RZ+yNNAy3r/q10M+MvgR65/S5aqxtz/zcB7i2S3K5yIysnXTCJ9e
         TGeKGRm2c5PcO5tp14TVqrpRzn27ib4+hXO3SNgfX3tohcM7xGoqKw5MHJJ9JjAEH1Gk
         avZ3EwTjHhOl+C82TqSbulndblbdP2sd94shELy3sInkgoE50VEHGDvii20Ji8J0Cft1
         O8AcblWLEFJy2nHDmG0V91EtwrDPbIeBRwaKT4isR2saq7rmwO6PvQQjkpZfur5u44kJ
         BEgQwUYza6DrzT+uzOiwLEkDLF8VtCNIiGJZXqOrvvSpFVJHiUzajhTADuxz6eLBGgCF
         L7SA==
X-Forwarded-Encrypted: i=1; AL+hErGszWdLbuQqyAOtHEjxFw8LGgTAizKxbj8l8Vzjdppg+5cP2GnO4tWYvMgDgPewfea1Z3zrkQlOBrUzcC0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cQTzL8C77/zwioKzcj4PqW1t17bnS7iRjfSb3LIlqtywqjvJL
	Ry1YIi5ewjGtCbvpYrBbULqwD/wXTSOL9KZ1Yhk67ROVK0IJsNxFSdtA
X-Gm-Gg: AYBFou3buqihLhsry5lSEyNmDCp22C++huxV205pXvkJrVZBxm2uyQZfUgAOIae5BlR
	hKgSeURlr/9EFQwulpFKAyPbsOjNGtAlJLaQE/YcGE8iCh3XtBtyFhnSi7ZHjgfC4GkjABvh9b1
	lGp0wWzgfkOXA9AeEms4esg1dw+FSTiTUcAFaJ5goQVy6LW4cPRDFUcnAbaSPjcNThvNwMrMW8V
	8EVuJmcrl1K5shO7tgKfFXbClwlnhsqkaAdBDGaflbTpb1q14HN3BtrSmqUJUo8P4K2RCPJ8ttJ
	A8G9eCT+J22MFVEviNlGQ2Kpn4XrZmG3SF7ve4KqiNQ64/gBMQ0wjDKtLHEfN53MH0fSGJ2BjQd
	UCOBipMB51ap0r4H60LZ7hySD9f0N5J70xODFgL0e4tSmgAN4HezR622orrMhL/yu67wL3CyEOu
	H8cvDGMx7JTw21Ix2T8LQEGkKd6Ta8YxIVrxdQb+fkbnYvBV5DnppD8w+FhGlzV5JGJJnRn7Rt2
	OV7d5ClkLt/7AylnsNQhw0q4MkLd6hZpO6D8w3wTc68x3l75nm4964UZgDvnDByXpTv0NXyeB9b
	wS7yDUTY9DgGAFw0B+5EiFlendZkT1g8e4ZWp+5MsViQvIUyZwQk5ji/UKZ8hgi3ydhYtvhwv+v
	GmwuJbOmEF5YRFGsYpr98rbS9gg==
X-Received: by 2002:a05:701b:20ce:10b0:1b3:a05f:8929 with SMTP id a92af1059eb24-1b3c034b506mr3343896c88.39.1794426985566;
        Wed, 11 Nov 2026 11:56:25 -0800 (PST)
Received: from smalls.localdomain (ip-198-145-71-161.az.bambroadband.net. [198.145.71.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212ec002sm21273012eec.26.2026.11.11.11.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:56:25 -0800 (PST)
From: Hunter Laux <hunterlaux@gmail.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	Paul Boddie <paul@boddie.org.uk>,
	Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Subject: Re: [PATCH] MIPS: ingenic: Let Config.VI tell whether the icache is virtual
Date: Wed, 11 Nov 2026 12:56:25 -0700
Message-ID: <20261111195625.2694287-1-hunterlaux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <BA039439-3960-4865-B6D4-17B845BD77DB@goldelico.com>
References: <20261110-mips-xburst-icache-vi-v1-1-efba689606dd@gmail.com> <BA039439-3960-4865-B6D4-17B845BD77DB@goldelico.com>
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

Hi Nikolaus,

On Wed, 11 Nov 2026 18:00:47 +0100, H. Nikolaus Schaller wrote:
> it appears that this looks quite similar to what had been sent to us by
> Zhou Yanjie 5 years ago for testing and we integrated it into our
> out-of-tree kernel but it never arrived upstream

Thanks, that's the same change, and good to know it has run in Letux
for that long. v2 will credit Zhou's patch and link the Letux commit.

The other half of that commit, the UserLocal part, is needed too:
XBurst II implements UserLocal, and the override hides it. I have a
patch for it on my list, but I'm still looking into it.

Hunter
