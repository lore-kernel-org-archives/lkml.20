Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668578;
	b=ehvcOcYaKdlWyFrFrKLB2fc9vKmYjEHW/IEArZLso6WKq1b0boSFsxT4tAov1sKLBQz0
	 oidWl++Jx0CnrIPkhmuC6ouF5FFfi0gpjN3UA5gfcPSmaE8BNfJshSxpRrnab/3qPyKJ8
	 MJ85Q2uK2r6Ec1tCU/GiwWkmpW8VWKvUpEqB06ROMhjjem1q7yDQP+TX4F8tapC7yDqh+
	 HZWBNolUcP/hp382GcMIccj9Tuoxx+1cmWa/04jnq5TbjHfbTmgkWsB/LABiljENfdgVR
	 0H9U++72QAqqafe5Td8uX5owio1kte6cJCJ2dqODtdajOkReRgOugD5GPz91ZPLNQ8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668578;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jyMS0DMkuv+G99LzuqSMRRxkPq3RRst5DDHRs1rjojc=;
	b=GVxi9gB9HpMQLHbmm9mVD43EaNGQcczqEkDAJluuCTtI7F21mxC7sru0TwWohxTBg1WF
	 aI8yr6INl0IGovAQGYL6WBP0uiwrFtdyonnfEUNI0OPR+8Aa1SWEAmaxw2iFddSGfnboY
	 rc4sWCqtQNpSdHgEHb/J/w4lUwQT+VT9pAiW0KoEQ+BWc7LuRTF8OvFHgU/G0/MywIJ2j
	 wrVmFp9SyEQHZEasH3npSTSxJYJcrsDJRHY39IJ0dDB1MwENEJXJnmAe0+wb/V64ERRKK
	 o26BB5AI/uUzq2wz5bjKo4liUp4Woz1y3s/YkljRElkH6xc2RFs2CePpvRsoauIEB3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=moAlhdiA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176A6606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=moAlhdiA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E5D1F000CB
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794668577;
	bh=jyMS0DMkuv+G99LzuqSMRRxkPq3RRst5DDHRs1rjojc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=moAlhdiApeCm3EGyM7DiSrwycY0XBr8qGjJXGKWIas8mk/0e/APtwW32SQ8o1U550
	 6QupfkSMRDCne1c1++QQCbqhjPGNWzw7ZcjR+UmpMYmWvqbOqGAxUFwaTMUTkJ8N5v
	 U80XC0H8YmXPGpaxYbWHmTYBwMU0SwtumcN+K6x07G9fRgzFszJUG/PxbvxEf5CWSO
	 ow9toQYhn9fnv8APslSvChuN04lCFz1KLamuNFC4mk5XOijGVPddKDjWpdHKXQet2L
	 LdoiA3Mw0eQCWGZAw1ZE40ijkuEBnNclQ/JsKzaynSFWcYeyFAHW/uYdBsB0wOZ3f8
	 u18WEU00jIHaw==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-716d052dc23so731934eaf.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:02:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHOFbonOG65eIvlNMMoc352WglX+tt8shBqUuvNKsZjzCy5LjgZQjnrSqadfVxIS6RrEPuK/HT0wE361iM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6WTELlnrME0q7JUk/IOWOgITOARpJpTskG+awYB1e1RwLrBBK
	M8EHPSpVldG6Ntptbx80psMAGMW7bs9PQDrtQOaVfO5DEciCX+Uvqqih632b1qvdJidFlJ8u26n
	GKoOOkEC/j725XnHzV6KOUjtH0sua2so=
X-Received: by 2002:a05:6820:55c5:10b0:716:d376:1620 with SMTP id
 006d021491bc7-71ab4d117d1mr2298892eaf.8.1794668577228; Sat, 14 Nov 2026
 07:02:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111174704.24312-1-juanagusnicco@gmail.com>
 <20261111174704.24312-2-juanagusnicco@gmail.com> <avgNl96dmc23KOrW@google.com>
In-Reply-To: <avgNl96dmc23KOrW@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Sat, 14 Nov 2026 16:02:46 +0100
X-Gmail-Original-Message-ID: <CAL4Wiiqe8FETHHiWoTdK=fDkCzGWQ6ROUpryEXrPij5ut0HRgA@mail.gmail.com>
X-Gm-Features: AclHuK8s3pBSKl_JDPVFO1SWzDNENx63z4-YVcQmox4V8t9XebjFvVAd3FaacpI
Message-ID: <CAL4Wiiqe8FETHHiWoTdK=fDkCzGWQ6ROUpryEXrPij5ut0HRgA@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] tcp: Fix the SO_REUSEPORT bind cache admitting
 a conflicting socket
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Juan Agustin Niccolini <juanagusnicco@gmail.com>, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, ncardwell@google.com, 
	josef@toxicpanda.com, jbacik@fb.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 14 nov. 2026 =C3=A0 08:28, Kuniyuki Iwashima <kuniyu@google.com> a =
=C3=A9crit :
>
> On Wed, 11 Nov 2026 12:47:03 -0500, Juan Agustin Niccolini wrote:
> > When the port is in the FASTREUSEPORT_STRICT state, inet_csk_get_port()
> > skips the bind conflict check if sk_reuseport_match() finds the new
> > socket's address covered by the socket cached in tb->fast_*.
> >
> > This is only safe if both sockets match on everything
> > inet_bind_conflict() reads. The cache misses some of it:
> >
> > - It does not record sk_bound_dev_if or sk_reuse.
> > - It records the family and IPV6_V6ONLY but never compares them with
> >   the new socket, so a cached v6only [::] (or 0.0.0.0) socket covers
> >   a dual-stack [::] socket.
> >
> > As a result, an unprivileged user can bind and listen on a port that
> > another user is listening on, for example a dual-stack [::] socket on
> > top of a 0.0.0.0 listener:
> >
> >   victim:   bind(0.0.0.0:P), listen()
> >   attacker: SO_REUSEPORT + IPV6_V6ONLY, bind([::]:P)   /* fills cache *=
/
> >   attacker: SO_REUSEPORT, bind([::]:P), listen()       /* should fail *=
/
> >
> > Only take the fast path when the new socket matches the cached one in
> > family, IPV6_V6ONLY, bound device and SO_REUSEADDR. Identical
> > SO_REUSEPORT listeners, the workload this cache was added for, still
> > skip the scan (binding 16384 of them: 9.80 ms before, 9.86 ms after,
> > 5874 ms with the full check every time).
> >
> > Fixes: 637bc8bbe6c0 ("inet: reset tb->fastreuseport when adding a reuse=
port sk")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
>
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
