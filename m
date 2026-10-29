Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793289051;
	b=3Ut/rWGY5tfZldas4lloo4ZC1Gcj2ovV0GZxJLT7rhuz1bJAwQQmXRUBbeJfwxpMYwWm
	 DLJlnsUBI314dmTPF93xH35LIzSJ1BKVyyg25nQaS1JvX3dYIRtOlF1NwxysA+YHeOcUL
	 AREtY/DQWHnpq0gXkrkHbZxiiI32ZaFYCoWfpfr1JMbGkW8d95LTtT5k4z+HltoUXnqjO
	 A1FmxE4Qc8gkZToJYGG9rHUoDC0ICXgyWm/DX2ETAH7egg3GPvdJSV7uTTZiber+TdTht
	 ON9QGjUfHS9Ej0xR0VfFDFyCELFBmWjvcwIlmQS9FswlCLW/Tt8iHgh9TzJMUsXj7Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289051;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZGVbAria0Qqiedh4pyoA4PlNAYwcnbIuCp+A1N8+bTI=;
	b=erTwd3ZMPBHtIDEXXsPo4S3ADBgMZ/Q0G9GR4jPjk2ImOft/x6dEW2GjFmkSurjYKapv
	 btvBCgvjA7+xyZxItmkro/5aHS02gOe2fqHkxpk1kgdKWvEuTWHcWQjGauDNFNfdSG75J
	 PqT6A2Zfihu/LlvsZQpdisTCr12N53KtCZBVoWWI3w87R4HQMGHsrVeI0X5CEVxLxEQYY
	 teU8Qnw1SxU3mIfrGhuwVlxPh6t0aKd1cOtxVeHdSiI5TAMJJkQEAh4j/gK3Xr4XLl8SF
	 wNNZHJZKIfLjYnvzOhJ5sZFubflvZBjYiXNt0jBvVlQgoD2Nj6NzrpHwznT4OwcnEsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=A9KLBjkV;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E299606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E299606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=A9KLBjkV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZGVbAria0Qqiedh4pyoA4PlNAYwcnbIuCp+A1N8+bTI=; t=1793289050; x=1794153050; 
	b=A9KLBjkVV18JvImOKBqQB4Zr5RiiS3EpmLVZC7L96H6rdgFoF6ORnrnx7BM1RpgrYNogC7P+tlx
	cXMeA48etVLIEKea+R4MOVnCXb5nNhVINSRORopBIgfoj0Bu8C82KHb3ej4mS8sE/obVhuvHFpES1
	Gri4Gh67sV5NMBUnCmJb4AmMebODLHPFqNMM6yxEuyNK7Wq4KJ1D2x4GgPJs+nVpvu0irs22M2woj
	7fdPdOuiSSDvkwuoTzmhUAbpBv4bxjPe0qemM8f9Uo7HQhnhRUuVtj/YZ3L8zuph40gfReF0DaVki
	QRGrAqQmm+pgeMIy6Zi2rvFBlHrV6E/LNsGA==;
Received: from mail-dl1-f41.google.com ([74.125.82.41])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xMSOw-004ZUf-0i
	for linux-kernel@vger.kernel.org;
	Thu, 29 Oct 2026 11:50:50 -0400
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-156cbe59524so2573653c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:50:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz4Q+gX7/mN8Yu0LGWEgVPlciIhc5pvxUB8aU1efQLz8JBOhwIfSGwTunO9QnvH/LdwkJLJe7XKnfEWcOU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsxWNcyC7Uyh5p5xTEp/g31WgJM7e41XtK/iMbREhZ81snPj8u
	GBWRsKoqLjjWRemZRHoGvlUE46NNzY2kQbLVrAcgiooO6d3AATj3A5Dx1zA3QUHFr0Ccmeh5kM4
	A5ebzxPN7eEWKbh9rEkuupXLWIhdTEBI=
X-Received: by 2002:a05:7022:4396:b0:15c:20b8:796e with SMTP id
 a92af1059eb24-1a6ce208ad1mr9947732c88.22.1793289049038; Thu, 29 Oct 2026
 08:50:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <attzI4sj2Pagmvkd@casper.infradead.org> <20261027192014.844878-1-nickolai@csail.mit.edu>
 <auNdNjH4zo7OYbe-@gremlin>
In-Reply-To: <auNdNjH4zo7OYbe-@gremlin>
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
Date: Thu, 29 Oct 2026 11:50:37 -0400
X-Gmail-Original-Message-ID: <CADGQE7EtDGs=g7p5=_m2LieLcEj-k4LyupOFWt96Aw9py-gYaw@mail.gmail.com>
X-Gm-Features: AclHuK8yS5TxpZVU_n3PpHxl-8IBYZs67giAAwk7Tv4-zhBVnjxpmpu0FOC9ZHE
Message-ID: <CADGQE7EtDGs=g7p5=_m2LieLcEj-k4LyupOFWt96Aw9py-gYaw@mail.gmail.com>
Subject: Re: [PATCH v2] xarray: clear the new head's parent before freeing the
 old head
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lorenzo,

On Thu, Oct 29, 2026 at 11:03=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
> It's pretty 101, but please don't send new revisions in-reply-to older
> revisions or feedback [0].

Understood, will do.  (I was thinking that applied more to
multi-series patches, which indeed gets unwieldy.)

> Also, if somebody replies to you, reply back. You, not your LLM.

Indeed, I've been replying personally, though in a few cases I sent
the response in the notes of the v2 patch, in an attempt to send less
mail to lkml.

For context, I use an LLM to write Lean proofs of correctness, which
seems useful for cases where the patch is non-trivial (e.g., [2]).

> Also, you are flooding the kernel with patches, 5 series across 5
> subsystems over 2 hrs:
>
> https://lore.kernel.org/all/?q=3Df%3Anickolai%40csail.mit.edu
>
> I already asked you once to stop doing this [1]. You've carried on.
> [...]
> I'm sure you're acting in good faith, so can I please ask you to engage
> with maintainers instead of ignoring us and treating our time as valueles=
s?

Sorry about that.  I'm happy to send bug reports with clear userspace
reproducers, instead of patches, for any bugs that seem particularly
significant.  I'll also get in touch with the relevant maintainers to
see what, if anything, might be useful to them, rather than sending
individual issues/patches.

Nickolai.

[2] https://lore.kernel.org/lkml/20261027125210.843589-1-nickolai@csail.mit=
.edu/
