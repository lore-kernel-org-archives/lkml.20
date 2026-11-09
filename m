Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794236074;
	b=Ze3Sqqx1vx+2M+sIsArp8u0sqhSKWNufsMXH9zaYKAusNERB7q/ySBv2MtlTSqt7rpis
	 DgcDE4usdGl6ObeiEXpb9QBgPMGZ3okvLfMs5fk9b7z+x18XYbq6zePGPSkeLUS16cj5M
	 byHNhfpgDJKp6dyMh3QSO/xhxKGROtw9EfvOZ20EhnxLtNOd9FZ1u+1RlAHjRLXV7Jbmf
	 DiuGbPHw1YcfYG3skGlpjoKO5LOsLmyt1NP+NvOFSMJ8vlDU7NS8Ll8/1h1LfCBf5Y1dT
	 69pmatEBqgwgUXXNKOipfCJ94Snds5UK2t7kkmbbB11scIHoAbmwEbYTTCieTpnJZKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Uu2ycv9me8mHBGrXAn80H1Hsv9lPp2MX3pjtM0lSbsk=;
	b=ks6O51S4bia8n+ko7UWE0QURBU1BmSzXS+cCnRF94XLFyNB42CmjtdHzQFEYSDR6g7CI
	 9JGtSHElB77P76dPxKW+PlX082+J5b5t8mY70wC57rCnSnnvKz69DOGlwgwcYOTggJp7g
	 Dac5cjPjfdy43BTFU2Bmte+5ZdCkq/nVAqlgLS9nrSAhILHcKfk8bGnMIT3vzQ4b+JXTF
	 6Boe3vw7cgyweQf3NEhTpUl8C9VEw2Cjpi0du0fftAD9plgO5CAKQJzfjbe7polCttHIZ
	 9BvQ/3HTZv+bwPP/tc87civEVp1XhlORUXCntad9iuMWMhx5fJ0Y86TM0XafysWCNcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i0L239Ly;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A65A606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A65A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i0L239Ly
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-535f598d126so252921cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:54:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794236073; cv=none;
        d=google.com; s=arc-20260327;
        b=YO/OVetI5actGIrIK+SVrANpa5J9C/OxllZT+/ASxDYrHUTRTTaOONAH1EmYCN37KI
         8XAgl6ztChhhNNhAyoFXTrexHR3UTuKr4Cgr5OV6G/kVOAhMsOZCHR/VPbwVRqu4GTzt
         Oj7l8ZuwF5XT4lKfrwTwahEqMuSCiy2K5hEf8u58kWU/Leu8tvUGLu0Z6pgn7SMEOkB3
         leFuZ3X9M+4SnZ3107rgCZv/X4IIUurH7SzEW03yQYC49DMhdwGFCBWtRMLRA4nKjWrQ
         5uLq9Rmo8ZntvzhXWuiAC5EaWjE+sbyqRpe9SnPqi1/DFQTNim+MJPG4KjuUQm9DpwDt
         ikeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uu2ycv9me8mHBGrXAn80H1Hsv9lPp2MX3pjtM0lSbsk=;
        fh=ghPhR3mnyPRLPYyS1aPuybva9xbStil7LORZkv3fRRM=;
        b=ni3/KFPSGyI07gkBANetufFW4DVqSecBMyZDeoHBE5uqTcXOrTue4EZHzCcK9SPExu
         2DO6vAAz9KXGUZJ2NX6TTuu1f0156bYOqf79/rXrA2AXaRx8lbsCmdc7Gj/h8cISBl4G
         2itbHScsaROll07tJL7fXK+qPGDsG/uQ8xKst0drvfVBEG9lxyqUvUjQve/LndVIfz7b
         xcbBGpYa9YtdMQVER2PrEVJwqgfk4tYJ8I1guk6iPDDUfJ2LLH9CH9m8wHVf5VdjhjSJ
         e7zmADZ+op8pjGTmRUXHXW9YbUICqAoO8Ii5EdsME+TkaClne98ooc1lLQdbRapXeqaH
         UqCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794236073; x=1794840873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uu2ycv9me8mHBGrXAn80H1Hsv9lPp2MX3pjtM0lSbsk=;
        b=i0L239LyS5taVUuVZGIVY2/a1cXvU3Ff5r0hhHz/SBdHYeMYijNZuMUNb0oov1J8pZ
         dbjjtQBnhfo+wuQKQOIgh/EZSfqFrx4X3PJOlSi7RqKU8Ek/PcgcKr2bBPXMC/Q7LRYR
         ow0R5YhyxfEuZlewUbhuzmJAHVhrt52nILSGfBeCCWI3enl7aUsojsx5Ufb6zWPS/n/j
         Aa5FsAlInEbzIe5jJ3BWTYkNzs7c2uTb5oA6kD3SLfZBDVOj018FHHFDLMnEQdqg8/qu
         zq6KBT16hfP1p3EuLqzxYd3muF6BIGIMEg/HITgsWSBArPs44LhJ8Ayy019s4oS4gAqb
         XLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236073; x=1794840873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uu2ycv9me8mHBGrXAn80H1Hsv9lPp2MX3pjtM0lSbsk=;
        b=CXwjQ16S+x7U5p+QLkwRft4q9atrGIzDNR7qqqMMDYncQ9OQhRbC0DjnkaFj6y9hTL
         SmTl3mcRRRVlcrBhzIj+HB0md2rmTzGnpvRPxbYQKCpQI2JlbK2FJyxyxky+8zuh6fQk
         hd+EInRl5r5Lj0fxgvFAY94OVjLXZDrEl+CQNP68bKFE8BIXhtIppbQfeaj0UTVDfrv5
         xnxzHF+ITusCMjLoM3rFqmpwLh5MuKPxypecp7tJfNlfLvMqScUR6P/MRGbSHVbdMBm8
         DQlCvLfVq5hgw/+n0mDJsrDLPrHYp6heiK2iwUZ/iFSuat3ZvaHaTclwEaAy72QAEpm2
         RYvA==
X-Forwarded-Encrypted: i=1; AL+hErGM3jMQRzKQu+vBZsexsueCZ5nHYaNQrhnTvsoZ2yP4Of7MvtBet8SluCK9nAbrEf5xHEkyrvldrTsR3RU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wq5yoHlRuDzW7zhPs5nruS36AWE/9ZzHZavzRfZyvfKS+CS+f
	r3utvUv2BsBXXxelBkcFgHxRYvMeaBKaAymcKEus3ahTz0mnWIUJrreNaf8Tr/oQe7JMfR3QyfC
	7kJqhrP3VQ15rdn5zc1bFsK7z9COlEEft7tU/Z606
X-Gm-Gg: AYBFou37vnW3dTRTlg9jP4EV8030aRU7N9tbgz6NdnWph5vh3O3hBhzQswlkUZ6voP7
	d7H4R7quR9TWBAIWFuAEijjQ7rHniaS3gxPOem8/Bly+ZUCLm9RPFhD9o5EHwd2AykwQm9wUyfa
	tOhXwgJhdU5cMM/RgdY5W6Q0BBuUQWVSrl95kTQFLzeDyuiuGJevMOFvyQItjuDDbTnFCVNyY8A
	fNfNQfkuWb4GvLF/aU7yzM24LVzNxNsaHglHzG8lZc+nWoUn+jTsRSQSUk/ojWMrN5NYrEx0tBl
	mFAIn2iDDPus4TfRNdW3UlCtu7OlhrpeExJTFljCm8MISSB6rxx1Mmwzp+wxU8o7OlI3cdObZH4
	6u9J7zOmHWEo3Rc4oLvvnvNsISzM80BUdk417Skt7lkauUce7BjIgV4u0hO0=
X-Received: by 2002:ac8:5c88:0:b0:536:934f:7da2 with SMTP id
 d75a77b69052e-54f9fd8f8d1mr38320671cf.2.1794236072272; Mon, 09 Nov 2026
 06:54:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103162326.3615979-1-lrizzo@google.com> <1cfe950e-50af-4120-87c8-375f67eb3e01@intel.com>
In-Reply-To: <1cfe950e-50af-4120-87c8-375f67eb3e01@intel.com>
From: Luigi Rizzo <lrizzo@google.com>
Date: Mon, 9 Nov 2026 15:53:55 +0100
X-Gm-Features: AclHuK8TskNldJ9T-2m3-q5kqcKrV-1RZ0T7vtN0-Um1ktY8-kpgA25IyzuryKc
Message-ID: <CAMOZA0KTYjRGuD3axNKaNb-o5=c8Zt=zG4Q3JFxPbWuBVu5MKg@mail.gmail.com>
Subject: Re: [PATCH iwl-next v3 0/2] libeth, idpf: use GFP_KERNEL for the
 initial Rx ring fill
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Luigi Rizzo <rizzo.unipi@gmail.com>, 
	Brian Vazquez <brianvv@google.com>, Joshua Hay <joshua.a.hay@intel.com>, 
	Larysa Zaremba <larysa.zaremba@intel.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 7:08=E2=80=AFPM Alexander Lobakin
<aleksander.lobakin@intel.com> wrote:
>
> From: Luigi Rizzo <lrizzo@google.com>
> Date: Tue,  3 Nov 2026 16:23:23 +0000
>
> > libeth_rx_alloc() always allocates with GFP_ATOMIC, including when a
> > driver fills its Rx rings at open or on queue reconfiguration. That
> > fill runs in process context, right after page_pool_create() and before
> > the queues' NAPI is enabled, so it may sleep, and GFP_ATOMIC is
> > needlessly restrictive there: it can neither reclaim nor compact, while
> > the initial fill can allocate tens of thousands of buffers across all
> > queues.
> >
> > Patch 1 adds __libeth_rx_alloc() taking a gfp_t parameter and turns
> > libeth_rx_alloc() into its GFP_ATOMIC wrapper.
> > Patch 2 switches idpf's initial Rx ring fill (both splitq and singleq)
> > to GFP_KERNEL.
> >
> > v3:
> >   - rename libeth_rx_alloc_gfp() to __libeth_rx_alloc() and put the gfp
> >     argument on its own line in page_pool_alloc_netmem() (Alexander Lob=
akin)
> > v2: https://lore.kernel.org/r/20261019210604.2433620-1-lrizzo@google.co=
m/
> >   - split into two patches (libeth helper and idpf consumer)
> > v1: https://lore.kernel.org/r/20261016151835.2500807-1-lrizzo@google.co=
m/
> >
> > Luigi Rizzo (2):
> >   libeth: add __libeth_rx_alloc() to specify allocation flags
> >   idpf: use GFP_KERNEL for the initial Rx ring fill
>
> For the series:
>
> Reviewed-by: Alexander Lobakin <aleksander.lobakin@intel.com>

Looking further at the problem, gemini pointed out that libeth_rx_alloc()
is called in a way that makes it easy and robust to tell when it
can use GFP_KERNEL. This would greatly simplify the patch.

Alexander, do you like this version better perhaps ?

cheers
luigi

diff --git a/include/net/libeth/rx.h b/include/net/libeth/rx.h
index 5d991404845e6..38c0e5066f0ef 100644
--- a/include/net/libeth/rx.h
+++ b/include/net/libeth/rx.h
@@ -104,10 +104,17 @@ void libeth_rx_fq_destroy(struct libeth_fq *fq);
 static inline dma_addr_t libeth_rx_alloc(const struct libeth_fq_fp *fq, u3=
2 i)
 {
        struct libeth_fqe *buf =3D &fq->fqes[i];
+       /* fq->fqes is zero-allocated and pre-filled in process context for
+        * indices [0 .. fq->count - 2]; slot fq->count - 1 is first alloca=
ted
+        * in NAPI. Use GFP_KERNEL for initial pre-fill and GFP_ATOMIC afte=
r.
+        */
+       gfp_t gfp =3D (buf->truesize || i =3D=3D fq->count - 1) ?
+                   GFP_ATOMIC : GFP_KERNEL;

        buf->truesize =3D fq->truesize;
-       buf->netmem =3D page_pool_dev_alloc_netmem(fq->pp, &buf->offset,
-                                                &buf->truesize);
+       buf->netmem =3D page_pool_alloc_netmem(fq->pp, &buf->offset,
+                                            &buf->truesize,
+                                            gfp | __GFP_NOWARN);
        if (unlikely(!buf->netmem))
                return DMA_MAPPING_ERROR;

>
> Thanks!
> Olek
