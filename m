Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8B14D9548
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066400; cv=pass; b=qg62taumh3Fxw5wBl2tt7FmyN89tI4A9weFD8CXzM+f/QdvHzcTHWZdDWgPMdMpJrfgegITmD3SvvnqvoDxfJQBKGEjhEbYBiTdUu++9U/9+6Tkp4PcBJWai6V2IVlWmeNNHtakkqr2eiI9hY5WEIe1jcoQSSqoPWag6+F/cpEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066400; c=relaxed/simple;
	bh=PfWD4VpdWtdSjVgCMYbGy7PflI7LLghvMi+QrsP2eAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UFz2VIZqyReJqr36irVKGaDMDXSWtWL3V9ufCnaTGkpIcqPSh+QXDUsxVb2/ZzuZLblSay1U2CrQvUsAC2b0hvmQZYewiIzTyH/Ptts9GKlNlzPhZw/xbQlA8XPSwFS12Tiz2vG2I+cVLmxxaP5y4zN8p6t6V6VQ7kajshujwQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFUv0rFw; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFUv0rFw"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bccc73eea4so2712724e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792066397; cv=none;
        d=google.com; s=arc-20260327;
        b=JvpInNI3TvlFp5zZvqejFmA2bxtM+VvQ59mSuOEnWTChqhVAyKEzyyyysVf6CoBF40
         kYm0ppNsyC7YVORG2IvsAkHfVH04E7OX25yApmjo10DDairQ314gJCoCytrPtIi3/5bg
         D6XkZayhU+QmZdkLNOzNGoh+e06krKBqV6nSzgrLhZLrYXf/7vmVeQqa+MgQnajKHzmm
         fC8Zxo24taHNSJ/Kbh33B/KZJCWypFwC6PKynGSMwMIOgXDxxX7NsFEwPbESLkZpMFmp
         W+DqldLt9+g8gPISpZjmeP0vzdq536UeCBzBG/r/2HbsVlXuZM11cFTJU9PsyfDy0ZcG
         dbyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PfWD4VpdWtdSjVgCMYbGy7PflI7LLghvMi+QrsP2eAY=;
        fh=/1+l813R+LVD5SZvpjexiyhtima3ubhgZeQrYJPMlrc=;
        b=WKL+p0b4GYyLdQvUd0ErkFTVIlEAxcx/xkRQzUgWlb12yaN4wrVV+4Nxr6au60NfEN
         BUdR2gucy7STloQ9uEipHQsCyDvWrNP+l8/GTi+lz3+TVpXJ9ujPhSAuTPcDAdMp02aj
         a9Jr0+P7O2UHxe7PKXANzI4KkNER9gtvGI7qAWK9WThP6v09F+TRsVkCBwpQD3Q3GamB
         5uI4qZJ81OBt7ZDgWDU7YGRH5W1VNmiyrKOyZIs4IsT1J1tMSt4i2CmrXN+Gr1zcLweD
         HpXPGs37mzdaSnycCOICeSpFDMrMQMTYIESE9VXW6SJddjat+3hpn/mMzjl/fvvlaNjS
         l4hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792066397; x=1792671197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PfWD4VpdWtdSjVgCMYbGy7PflI7LLghvMi+QrsP2eAY=;
        b=MFUv0rFwkY46TMBt7X8wNlMgYfH2YjM20arVDogzgWTSRu/Y6LyM+DTrbXsuUU4IIM
         KMefd9j1ptRsfqlo0pBgpWwYnuwS7fgCGXKEckghBS+1MbY5V0k43XFCPQfNBRIo7rqn
         7ogA4wk4yI3JLiTiW/wgvj+yXuLzs7al5YO7pu1bm4MGoB+M3Ehh8qJsKATWAJkHuduv
         PK7Sw7a+CUJ3u0rQgaaMXwZoRqciyvgFJdV9v6dr96LtRVBOr1510olmTRyInjU3Gj5i
         ycB+cHUT0QzW4clXhHZ1Tr619ClxvRi78UB0NIs+BHrDyy9A1FwE0I9Iucm1YJ3qhBiM
         Q9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066397; x=1792671197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PfWD4VpdWtdSjVgCMYbGy7PflI7LLghvMi+QrsP2eAY=;
        b=IX7DwJpB9bv+VcjWx/PlQ/qI+VcjJHJjOacHKlZKop7g3Qwssi3c2BLLZgt8z10edo
         uhMPw/nsnI1s0HEWV78ZwetvMaQpDbC58LIIpq2TVEZm0wIi32wdUGrFxhLhZdAIWRY/
         RaNQWfRzmbHbHnfahYUEMThaokaeKKIiTLH0zPb5o4IYl9/0s2Sm8iuQonwZfTJ7qmjX
         yPBe3qY8eaMSgTu9jNnM0Xp1T+W8dUof1Q5HEFlxex8B15+Ha3hgOsIzy20bFHRwaXJI
         HLYwgdOoSEsrW2VH3TkDjPvhcMtusffOsHmAqoOWzF09LYhB620/0uIuKdS3MXvIbvze
         jFXA==
X-Forwarded-Encrypted: i=1; AKwUvBw551GvZpX+Cmh/fGGhx3L94DOAir3klOw/Udv2UpxX4DGkfolKGq/2/Jj/MdwmFzq5D4E19JfAOsf6DUY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrlBx6lXIQIRkk29vGBsMSKS5eI3lQGZ0l1m/b93ukiKB1O86J
	QrY2y2+pZKHkUUfNGXEAk/cMAtU4WwiVcw8ev2VzsTDYmJ/u87VRwNDKlehsWCR7UkuslS8qSbJ
	1LSF9OyBlsSmAbwXJLjRUxMuFS/ye8Us=
X-Gm-Gg: AYBFou0uLhTwkPRxDqUHfwmh6o27kEj2mwYIztf6IoZpcuE5wvNq1r4sAKt4HGTHSMS
	RbuC4URWg5TgjvFWMBtkv2f5LrAmiZwVQAHZ4U7P9cx7kPTWa4c17Q9168xoNs3kVxuE1O74V69
	zIcnRf+5JPlZcP0E07wDE7HzkY2Oj5ipdnnY8MwLB8SjGcvjnpHc9wC0x0fVrpZyYcl0ucfMzGE
	14HjI+EHfKcza4y0jvEdqaA8dzY/jRv/EHoNNHQz663AikdMYRMsMpw5yKws4kA11nAQmANadBZ
	kF/tYcNwAtWfILSzYlBl6tVoEUFL7CWQ+D5wXpWGdbXBqprCVbIzHF+4Q3ph9fyFtzc8UGpPQZj
	PUtdPMGkfK5Q5188W0XXSGJ1LooqA93+TMGS5vWtqoHQT7MYs2fEacInq5lPZ6Jt8QaGLDw==
X-Received: by 2002:a05:6512:b1c:b0:5b8:e9cf:daa6 with SMTP id
 2adb3069b0e04-5bcdd4f080cmr6853474e87.10.1792066396625; Thu, 15 Oct 2026
 05:13:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013103906.2660384-1-wferguson@cloudflare.com>
 <20261013103906.2660384-3-wferguson@cloudflare.com> <877bjk893u.fsf@cloudflare.com>
In-Reply-To: <877bjk893u.fsf@cloudflare.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Thu, 15 Oct 2026 20:12:39 +0800
X-Gm-Features: AclHuK9xypnzrrqwCcprd2CwQO7kzSIQ141D-bgf0CuqS7x-S8jo7RzifyoP-go
Message-ID: <CAL+tcoBjfDEVGvvSXZHkiMjq5jat+5OJE-7uJr3MvtFyzn+KUg@mail.gmail.com>
Subject: Re: [RFC PATCH net-next 2/4] tcp: add BPF_SOCK_OPS_TCP_TS_ID_CB to
 assign a TSval identifier
To: Jakub Sitnicki <jakub@cloudflare.com>
Cc: Willem Ferguson <wferguson@cloudflare.com>, netdev@vger.kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, ncardwell@google.com, 
	bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	eddyz87@gmail.com, memxor@gmail.com, linux-doc@vger.kernel.org, 
	corbet@lwn.net, linux-kselftest@vger.kernel.org, shuah@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@cloudflare.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 1:51=E2=80=AFAM Jakub Sitnicki <jakub@cloudflare.co=
m> wrote:
>
> On Tue, Oct 13, 2026 at 10:39 AM GMT, Willem Ferguson wrote:
> > Let a sock_ops program pick the identifier that the previous patch
> > encodes in the low bits of TSval, for passively opened connections.
> >
> > The width is set per network namespace by the new tcp_ts_id_bits sysctl
> > (0 to 8, default 0). A listener opts in by setting
> > BPF_SOCK_OPS_TCP_TS_ID_CB_FLAG, typically from BPF_SOCK_OPS_TCP_LISTEN_=
CB.
> > tcp_conn_request() then runs BPF_SOCK_OPS_TCP_TS_ID_CB once the request
> > socket exists and before the SYN-ACK is built, so the SYN-ACK already
> > carries the identifier. The program sees the request socket, the SYN
> > (bpf_load_hdr_opt() works on it) and the available width in args[1]. A
> > reply that fits in that width is stored with the width in the request
> > socket and is inherited by the child, including Fast Open children; any
> > other reply leaves the connection unencoded.
> >
> > The callback is not run for SYN cookies, which have nowhere to keep the
> > identifier, or when the peer did not negotiate timestamps. It is skippe=
d
> > for connections using microsecond timestamps and while the sysctl is 0.
> > The width is captured per connection, so changing the sysctl does not
> > affect existing connections.
> >
> > New /proc/net/netstat counters report how often an identifier was
> > assigned, declined by the program or skipped. TCPTSIdEchoMismatch count=
s
> > third ACKs whose TSecr no longer carries the identifier, which shows th=
e
> > echo was rewritten in flight.
> >
> > BPF_SOCK_OPS_ALL_CB_FLAGS grows from 0x7f to 0xff. The tcpbpf selftest
> > used 0x80 as an example of an unsupported flag, so move it to 0x100.
> >
> > Encoding makes the timestamp clock appear 2^bits times faster to the
> > peer. That shrinks the real-time span of the peer's PAWS window, and
> > peers that keep ts_recent for the RFC 7323 24 days stall connections
> > idle for longer than 24.8/2^bits days. ip-sysctl.rst documents both,
> > along with the lack of TCP_REPAIR support.
> >
> > Signed-off-by: Willem Ferguson <wferguson@cloudflare.com>
> > ---
>
> I think SOCK_OPS are considered legacy.
> We probably want bpf_tcp_ops struct_ops.
> See [1] for an example.
>
> [1] https://lore.kernel.org/all/20261006192601.1875100-11-kuniyu@google.c=
om/
>

Exactly!

Thanks,
Jason
