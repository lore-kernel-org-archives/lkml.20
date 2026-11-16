Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794855366;
	b=gCLgtn5b261JeLNsgVijHPw+YMFvUfvcOVYNFZDemZ2aMaIVf06/vypOh3IJKppEuTv1
	 zdSLhkGullG4PqnAYRWMMA/dLXUdORnOnWW5Sd5hwIgG3wtNXb7NUG2icy6J64fzRJeJ0
	 dX5Nc1qXeJAIjjxFzIBu86hwfw/ksinXiTM3t1OX3CaO5V8mXNWMWmOs4hRSNB51h3NoD
	 lEGL9TMEYzWWb7zCAhqdeqs4H+We0VbMEOH6hytqoB7HYIi8fSAYgtUDM5ttoFHBcooAy
	 gBVxGL/MyflWAciliA/ARHhP3RN+tRh+Uu3vG7wmxyJuriP+cZPBYRy5TrH/mIe0vwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pJ3VePYLXSQe6BrY0Rbuq9cNJKXVi3VErXRi88A5vGY=;
	b=jM9Rs58R5sp2WAH9jFHZ2BavZrr9J77u/ulubD9LOXW06U+OqR3CMWiiuenZ/rJlMyde
	 CFYPiX/kXFzNMBogb4lsU8wvIEZSwxpkJaf3jh3ihakHEyg5N0v7/HYTAqsmpp9MF0St2
	 QU4B1N0Mj+/d6TtXLrxBxg/foBib4pUT3V6oSlx7hBacYK7vFJs8FvlnA9ybdQp71x0Dx
	 qZy0mABwGtH00mkh+MVl2UR3o83G9DAN/+QMs/aBsCCdC3Oa+MZpXlcVlpbJL47aNts8c
	 M3BlDJxQe+wk/5dBj3TdMoVJBTZ2Q/paqM2hAi35SVCNAlI/JuKjgTkC+3WnT9x6TaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=f4j2uwvJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ACB606A891
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99ACB606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=f4j2uwvJ
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso1175889e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:56:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794855364; cv=none;
        d=google.com; s=arc-20260327;
        b=mzspStn5CQIJaLRodmC4UApAQ0naASUG2TLjuyq98HO/UVzvuII9ll7DNaEA9/FDuo
         vHrgB9Mri0VxVQuJWeXypMIXvqvoxcNUf5GYpfgD91QNkmW+nT74fOr8rN0N/xoayGNn
         KvtsSdcykanWSJGZnv8w00F+9Qoc72/VNNuv2zj+GVy7NNiHSlWVxKj8AXG1m/t6JxQy
         5VK7qTuhKtyRQA2mGr2I0hZJkhcCwEH1o7oYzDe2G79qHB59ZHdHrx9U04GhqKnObQRP
         t7mA5Q5ozITIgYz+n0Qt8jkOxbR+PVaOqCLXpvLrvguzCrkI6y2sxmrGui8nOjj16Aky
         Ns4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pJ3VePYLXSQe6BrY0Rbuq9cNJKXVi3VErXRi88A5vGY=;
        fh=ey3EkyyoGK2OpMgIt/KC7DeK4dd15Ze8zNesjWydD54=;
        b=GVhvqbJI/2OSWdaDcDTm+mzoZ94zqsfLgS2Oa1JclY4HC5jb9edXVbUPRDj+yWQey+
         xMAUhZAOpG/vWmqGHMFDiSLrmecMO3/WkakNNtDLX05wcdrVQup0cxcnCrR+J11GGJm3
         R+ZfUqGtyo4Ype5Zgow0YhcPxRn2Agiu+VMMAesVWeIMDaMVuMWn/RkT/8IAuECtFruK
         Mucvl5W+aCIle4vwv4TsbGzG4PMiGmniklB64hmRr1u3ww37iv16r5CIvtIIR6n1UDEr
         8a3OlQ6ktdG9nwmyV0xpiEDZOeHEYgyH8yXck/+IZ5tm1byOOWdUQj7czin/lPPwWvmD
         1hQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1794855364; x=1795460164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pJ3VePYLXSQe6BrY0Rbuq9cNJKXVi3VErXRi88A5vGY=;
        b=f4j2uwvJ+lHyrTAK7E5Dtl+M5bvamBrr6tzEfQoknmihhN2xaDOFSeiFQC7EokOwp9
         FkbrM0aMK7Smc4PSIjTgdcY8BHaxQ9mPWaS1UpPgIoSfLWYHXfhpCxX4eTSZNcmr5OTX
         o7cNGzWKceJXCB1lcrkgJs0NokQ3DC4lK2Txcbw7nVY0k8FUEDlWkVtXA0GpvFd+0xMg
         iHLiy63ly8w3NByFVDUXRalIbK4skjf70Mrr3u6qupmTZx6mxSuWIuwiyWzMyhnhQ4hh
         eaBj7LQV6a0E/pELWEaHa/PlhMPXLKUjdX34CtmYWWpn8c3dl15vksdun+k2C03nAQA4
         mi/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855364; x=1795460164;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pJ3VePYLXSQe6BrY0Rbuq9cNJKXVi3VErXRi88A5vGY=;
        b=M7T+VwrVBgGodXa2n7RJthPtNxbvUXfMVKBEktqncPjIEgrcFSwdRKsjDsgSrqeQYB
         fdqXAlKhDWajWVI8gJ561tfIX/+rvnrK8go1YGEjQqfIggsUncxNogJHngj1YmzPQXhG
         F6CfEeHpEPub901rxFyZf254JjOxGRknBkKdVp4e92Xy0atYLoBf0IiKYw3w71XOwsC/
         DtLJnsOumUijHgoXTHW6HFCaJ/xBheNt2+gxXlV+gjejkS4cawzlh2TXCVqPrAtb3AkX
         uz+yoqAZW9tuLBEhe8gK/7m9fRy51GXB2DKfuNdUcUPCRIg2RW4NDt7leHTJATSP2gi6
         bKzw==
X-Forwarded-Encrypted: i=1; AL+hErGDDTa27P64kmaAqIk7iVjkHor9zLqccM0vBiawBD2pah61yhRLuD4F1F6vI3koDIqDQCH9bjiFSOWED6E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FY4I2v07EVDVWuFwk6sV9emsbVojR6vCwbWywB1oWxfk39NRm
	UrH2lhMF9X4YfMKkhbl2mzsUVIuhH8mrWJBwJ2SCAxt0RFn0eNTy9w5nr7J//EaWz2lmURM/9an
	+p84luagw4YyrLI41D7mWG48pM7Cujq7Q+owNy9vmow==
X-Gm-Gg: AZFdTZc9+71pNXRQR0jGL206tWjqxG/mnBg9vGH9pRyxO5iGGVnn441vtupOhrGPXIv
	PDUKVeLrlU5uz82nmKJ05vm2yW/Wy/NGOpG53HpHB33rzad8HL2cxGtn/HWg4i9TUXRDO7czHYq
	U7vBwf0uzp+gsjajr6XQs0EwUw2N8/74OZ9Km67FTCqZMK8gOv7Ma748iR9DdTlFcZ8q9qJqaZD
	yiUH4oVTovOSajom/bK1XDMnsbgRTq9vGylNpsnoijhoZM+n24gmdY9hR1Z1w0NCUra8wH5Uwsl
	yyXN6wy70YeMqaQ+rIJpM36+J8jKhSN6kt1w5mJiX8AkhS7tjFYl9jtPv1mqIv2Jk6CzbX2Mh2U
	mJsu4X+rf90/bHmmFy9G3jWqAPcCOfVnh7vnkmEjZa8kjXDs4ExcXMGy98jLjID3RVU/48zKKfT
	Ys60tpJSmTYV6h9xGdszaypLGorJI9lJ4Viv121PfprI/B/6pe2xJuEtzUaQzGNMyKVylwZLsXV
	WiOxXJJnPNXus5gDfGvZgFUXA==
X-Received: by 2002:a05:6122:4215:b0:5ec:3e18:a912 with SMTP id
 71dfb90a1353d-5ee34a968e1mr3829197e0c.14.1794855364480; Mon, 16 Nov 2026
 10:56:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112232444.2865382-1-rjethwani@purestorage.com> <179461232334.2199510.12258955725199996955@kernel.org>
In-Reply-To: <179461232334.2199510.12258955725199996955@kernel.org>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Mon, 16 Nov 2026 10:55:53 -0800
X-Gm-Features: AclHuK9aI72Wzc15wwlEEJSue0Lw3dqJipNrakxflrQi_c6kzLHMREGXD0OoOA4
Message-ID: <CAKaoeS2yeZ3WciKNtdp8ee+n+v+xc4+QAcwZU3-fzG6J28-5dw@mail.gmail.com>
Subject: Re: [PATCH net v7] kcm: reject TLS on attached TCP sockets
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, stable@vger.kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	ncardwell@google.com, kuniyu@google.com, john.fastabend@gmail.com, 
	sd@queasysnail.net, sagi@grimberg.me, hare@suse.de, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 3:25=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The Fixes: tag covers only one of the two defects the commit
>   message says it fixes.
>
> --
>
> kcm: reject TLS on attached TCP sockets
>
> This patch makes kcm_attach() reject TCP sockets that already have a ULP
> installed. It also makes tls_init() reject sockets attached to KCM, using
> a new kcm_attached flag in tcp_sock. The kcm_attach() type check now uses
> sk_is_tcp(), so raw sockets created with IPPROTO_TCP are rejected.
>
> Link: https://lore.kernel.org/netdev/3108e934-ec00-458b-8720-450554b35b55=
@linux.dev/
>
> > KCM calls read_sock() from its receive callback in atomic context. With
> > kTLS RX, this reaches tls_sw_read_sock(), which can sleep. KCM and TLS
> > also replace socket callbacks, so detaching KCM can discard TLS handler=
s.
>
> [ ... ]
>
> > Fixes: 662fbcec32f4 ("net/tls: implement ->read_sock()")
> > Cc: <stable@vger.kernel.org> # see backport requirement above
>
> [Severity: Medium]
>
> Does the Fixes: tag cover both of the problems described above?
>
> 662fbcec32f4 added tls_sw_read_sock() as the read_sock op, which explains
> the sleep in atomic context. The callback replacement problem looks older=
.
> In the parent of 662fbcec32f4, neither kcm_attach() nor tls_init() checke=
d
> for the other, so the two could already be stacked.
>
> If KCM is attached first and TLS_RX is enabled afterwards,
> tls_sw_strparser_arm() saves psock_data_ready and installs tls_data_ready=
:
>
> net/tls/tls_sw.c:tls_sw_strparser_arm() {
>     ...
>         rx_ctx->saved_data_ready =3D sk->sk_data_ready;
>         sk->sk_data_ready =3D tls_data_ready;
>     ...
> }
>
> On SIOCKCMUNATTACH, kcm_unattach() then writes the pre-KCM callback back
> over tls_data_ready:
>
> net/kcm/kcmsock.c:kcm_unattach() {
>     ...
>         WRITE_ONCE(csk->sk_data_ready, psock->save_data_ready);
>     ...
> }
>
> After that, TLS RX is no longer notified.
>
> Before 662fbcec32f4 the TLS_SW proto_ops also inherited read_sock from
> inet_stream_ops. So in either order, strp_read_sock() would call
> tcp_read_sock(). KCM's strparser would then take raw TLS ciphertext from
> the same receive queue that TLS parses.
>
> This seems to go back to c46234ebb4d1 ("tls: RX path for ktls"). Stable
> selection uses the Fixes: commit. Would LTS trees without 662fbcec32f4
> (6.1, and 5.15/5.10 while they are still maintained) skip this patch? On
> those trees an unprivileged user could still stack KCM and kTLS RX.
>
> Could the Fixes: tag point at c46234ebb4d1, or could the Cc: stable note
> say whether pre-6.6 trees are affected? Right now the note only mentions
> the 8cc3aef0cb198 dependency.

Agreed, both problems predate 662fbcec32f4. Before that commit,
kcm_attach() only
checked sk_user_data, tls_init() only checked the socket state, and the TLS=
_SW
proto_ops inherited tcp_read_sock() from inet_stream_ops. v2 changes the ta=
g to
Fixes: c46234ebb4d1 ("tls: RX path for ktls") so pre-6.6 LTS trees
pick it up, and
the commit message now describes the callback clobbering and the shared-que=
ue
reads. The stable note still flags the 8cc3aef0cb198 requirement for
older trees.

pw-bot: cr

> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261112232444.2865382-1-rjethwani%40purestorage.com
