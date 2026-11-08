Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794154756;
	b=f8KhaMsHtUmtj2ZkxN061cLVBbtkCnVUSn69lz9rTcTuY0Qv6/zGwkcbCDNop88Kecdp
	 zRvqWJI3Ru4eSvj8Ry/VpTrlVuMaOuX4w32RQnJ0EFo3Z8IgJTcgNoLVwAGUPdBrcdK58
	 i4UKndTDluuVkG3ozAVLXeZINwNAyNSwNZof5RLiVFXEVZycPIONwQiMLQlqDI6P7NxI/
	 pp5lSusyMmdcFxgQumYDAtfQUBRgFinlbwjYhUzgWfn+qUrZvZJJ/1gp/8/na7QmEYiBA
	 vUNledPLjlmzkkRu0YcpimaF7kBNoUvICP8BKK3WfAASSgADJEZS62Xt7jvDld/3D5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794154756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=et3swsdOfldP0ujJDRmFWaImEh1vX8VO0MRX9DcXPOI=;
	b=TwIo0eHSuC1LKbjAk1GxBmCWQso6th/EwTaTVrudLnzuzv8GQ+7qO8KW7fCkNGLxgr7R
	 rDQT00ZDjA9n1B5sgWPWJCXUrHycRgp+pOm6zzUU0dJ91Hwfyv2SspVRiEDkGpiZNTLWH
	 ar/z16Usoh49WPWV2QkA69RUnGj8jQeMqvbc6e2oOuardSQvxkscw3Ntl5fgxevzmXSj0
	 Jway7bM8g2lBDrk2dtfvYPinuZPuyRAoODM2+LKVLEB1fqJpg7WpfxcRv8TgyMV6JjmMN
	 glGbCW7IKZd4akvji2ThDis2ZoL7Sl0TZfu7vDolr7UBFBznFmpTZEI7PDx3z5etCnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arista.com;
	spf=pass smtp.mailfrom=arista.com;
	dkim=pass header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=UnHJPzGX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48010606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 16:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48010606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=UnHJPzGX
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c247f6687dcso24319166b.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 08:19:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794154754; cv=none;
        d=google.com; s=arc-20260327;
        b=WrhnOJg51ubHSwswNu8ASt9e/YWA12FIUkds2MI5nhfW9kA/TVLb93vJ7B5ie5CO9j
         xXL1TOzjpDQVIIw4YhaUvSQfEQK2ko+m5RiI2Ui6DwzMl/cAnp5rvu4MsoQ7iSML+0c/
         SEx2dIr/r6nn3qkUQjnqYvpUGO4mOyCoOuDzfTZghJZLcT2ulbF8ZdO51gFhPFWFjX2P
         PFHNzsBeSb/JZ0EI6ROVoO9waPZdkOZysJh+rqsUf0y40US6pBtANMtkD8+nmq1d1ikf
         us7q1kFt9TfVXtk2lb076rrGFv6jXnlSk6gQeaItQqA8XBDB2mtNGTJ1W0tv9rgE7tkZ
         6WmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=et3swsdOfldP0ujJDRmFWaImEh1vX8VO0MRX9DcXPOI=;
        fh=6IUFXvMt0/o+iL2XL/1LqmyKShKh5u0DFzK03EpFRU8=;
        b=OReinCKUcLHXWQ+r1R+33auHPS3oMciOwCpRc6CmTHnN37YMDO6g9/AtYb+qippJqU
         AKx/Gz9oOENnhzoAXK95g+uJqsyDX+Z0rryRBuf1K5vQ5/hrHVedctwa6Rfs3ToBScfw
         A2A6ZrCeoSo7/E03veYJfzbBJ73ujlvJqXCIfg0gtLJJzFx/406WzktzkA896u0QmqXM
         U8w3axv9ZnVxn29Zfye+XtWKbfpOjuxC2duTE3VB2ZTvVSDhhSTsKdxs7H8zmTS+b9uL
         TTiw7a4rt4p74kOxZDtZUmpQ2ofRHxCPc67zuir+RpzDmlvS6h7hTj19djXK4ALrKjsM
         2yDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1794154754; x=1794759554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=et3swsdOfldP0ujJDRmFWaImEh1vX8VO0MRX9DcXPOI=;
        b=UnHJPzGXqtf5M6DSoZKrR6UHFBMfoWqYMQ1Rv17g7fWWT+sUOEqe3QB3lY70652EHs
         R4u9V0gcMFrFvvSx2428DKOdXjulw15zG2Gy+Qfh3Tw2JxCfbPsye6YS1qby+4Vh/LcO
         Xzdrbu808uhG44B8h5piODGDrpJo9JOx93iFfrb/IqbcGKOeWlNJGCJ0hA5eBs0PBuPf
         gCPhGndoxAT6kRnicgZ706hl6Gnyq556H8teishi0UUNNcmQmMprjdC/vEt+ztlS80Ks
         vDgdeb3d6MYYHH7yqg4ylxT4o6vYu9P0xtrKBd0wphb4zuKRPhhIaLnZx88GNjKCbx1+
         M+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794154754; x=1794759554;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=et3swsdOfldP0ujJDRmFWaImEh1vX8VO0MRX9DcXPOI=;
        b=JV86KO7+wsoLJxXod2sm/L3AHer0FBFQX8V90T/DSEB6IPcxOPuZLH3ujTfAS86ybI
         1BKBtcljYNTACXmrtWSWwOKnGSU/et6hj/M9P/s3BRtVdEF6ZwZ41HZtd9oBlsxOcfdS
         owo5mpWwpcNPM8LyWY3nkg+rsxXjWEBJmbVKHwZwBBLD1+eKn2rp9mQiVLyqGch/Y1G6
         M8nhK62Rq4Ve/BS45StACWiREC/7m0ewH7wvwrH/6FzcQq3vdI9+vsIvRiM6MuRxegJ6
         nlJbRAnueQ9hAzIR98k19gqnJL/T3D8m4cFrf3gvDQvMBTaiyqEM47ktDfc8NY6yDD4S
         afPQ==
X-Forwarded-Encrypted: i=1; AL+hErFMTMSA3NH5WM92u+coDOo1S2cTR+svgVpQk1ernrV2BYAKr6k9hySFY72wNgwAzFUZwOsHw4GJh0DTl0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1pH92PfmW/d9Dttz8BWpJzmDTgx8SZnMEG3Wcd+rywiDuEBwT
	cy+YaqWsOTNFAjbot8nqvAsMron27SE0/enlBmTw1K9DPnQ3MBdvGneMXm4bmKO44fngagZ8uQe
	F0/ZkD/RdUDluDMMcZYCI2UvX95S39h/MoIM0Z8+H
X-Gm-Gg: AYBFou2rdTjp2z6CuDdY8YXQ4kkMn/pvnxnQuU1j0NZL+StBT6931ignKj5xfxGYK3k
	q1swknO9HeydKNT+uBPXwKUq4Jd+4Sy4/RKMgrE2XAACW4wbtTZdLZQRMkg4DanMe063ixg+26A
	JQOKDPTDshb2uZIzYWS+tcgXAXEA7CQazR8UEetj9nTZTXLtIxKD+LoXiwIvBhzBh0klC6dEl0A
	3e7JPG6NUk/nGsVeuYKgqo4M5sTNvbZX71ZNJtbYf63fC205fLlSyTShiwLD1QG0CULHsK1j+0g
	4JMzszTq4gpuLOFcCB/UZwSJmNqh7TZ9TzM+m7MiAEPQFb9PRoFsMkcG7QoJKj4A+GHRCAWUwbg
	K2WicUNIG+FOMBVN/tRB66W8LMF3TtyomOrV/BNmGLhf4rsxLp29CMm8phLBVYIPFNNIjrBvSo8
	RBkdItnPwox1IUI+tvIQ==
X-Received: by 2002:a17:907:3f8f:b0:c46:7ec3:fdfb with SMTP id
 a640c23a62f3a-c4d6d1af6fbmr112340366b.7.1794154753715; Sun, 08 Nov 2026
 08:19:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107224733.1104094-2-Jeremy.Jean@oss.cyber.gouv.fr>
In-Reply-To: <20261107224733.1104094-2-Jeremy.Jean@oss.cyber.gouv.fr>
From: Dmitry Safonov <dima@arista.com>
Date: Sun, 8 Nov 2026 16:19:00 +0000
X-Gm-Features: AclHuK-RlKB8cK6nkN9idStz4fDt7ECu6dP4yCWsCwUDnlTQSNjJu1k9KvIrby8
Message-ID: <CAGrbwDQFY8gBtEKi2RaSMUSEvLLVADspgoLLppwNt5XQgd-hxw@mail.gmail.com>
Subject: Re: [PATCH net v2] tcp: fix authentication bypass via unsupported TCP
 auth options
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Salam Noureddine <noureddine@arista.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 10:49=E2=80=AFPM J=C3=A9r=C3=A9my Jean
<Jeremy.Jean@oss.cyber.gouv.fr> wrote:
>
> tcp_inbound_hash() parses both TCP-MD5 and TCP-AO options when at
> least one of the two features is enabled. With TCP_MD5SIG=3Dy and
> TCP_AO=3Dn, a packet carrying an AO option reaches the disabled
> tcp_inbound_ao_hash() stub. That stub returns success, so sockets
> configured to require MD5 authentication end up accepting
> unauthenticated data. A forged AO option skips the unsigned fast
> path, which is the only place where tcp_inbound_hash() can return
> SKB_DROP_REASON_TCP_MD5NOTFOUND.
>
> The inverse configuration with TCP_MD5SIG=3Dn and TCP_AO=3Dy has the same
> problem for an MD5 option on AO sockets.
>
> Note that TCP-AO depends on 64BIT: therefore, every 32-bit kernel with
> TCP_MD5SIG=3Dy is in the vulnerable configuration.
>
> Make the disabled stubs reject options for the unsupported
> authentication scheme. This matches the real helpers' behavior for
> sockets without keys. It also means that kernels with TCP_MD5SIG=3Dn and
> TCP_AO=3Dy now drop segments carrying an MD5 option on unkeyed sockets,
> as kernels configured with TCP_MD5SIG=3Dy already do.
>
> Fixes: 0a3a809089eb ("net/tcp: Verify inbound TCP-AO signed segments")
> Cc: stable@vger.kernel.org
> Signed-off-by: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>


Acked-by: Dmitry Safonov <dima@arista.com>

Thanks! Nice find.

I think TCP-AO patches tried to preserve accepting MD5-signed segments
on !CONFIG_TCP_MD5SIG kernels and AO segments on !CONFIG_TCP_AO ones.
That's why the default stub was to accept the segments.

And I prefer we don't add prematurely ifdeffery to tcp_inbound_hash()
as long as no-one complains on this changed behaviour under kernels
with disabled auth options.

Thanks,
           Dmitry
