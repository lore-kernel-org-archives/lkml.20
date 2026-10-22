Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672464;
	b=Xwckt1lEYE9eVaHY9J0f2X4txRSv0WCYPL/HsyW0NyX76TeUP/hHxbZ0xjDjIFb7ClKs
	 zKxMTvUyjjlcAZjycJxVR4tig/IPMK3r9JHusKABocl8JM1XlQXxDmD9npyRL56dury7u
	 LkEWz3Rlh3EUzj/Xsnv4DJUx0WdDkN4ifzLeLIpE+S/7FmtZAvrn9pW3GaDRcSE/Gfqb9
	 85ZHFeyNiNnrVHhyfiLYh5biQs9q63Tko+RXtIHUODh4hiT3iOHAyBh5X2bEIZFDhZbEV
	 Jle26jkEqWs8b0QSeG0RJLLyk12XzOndR24TXTRW6gjTINj1+1Hnby0UY2Zhq1TE6qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672464;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GuRTRP+tWmDDUV9Gr8C/q+Rt7EjQK+r6xiZzyNtXQEE=;
	b=lPTAlA0TVugNCj9iW+XFZFM6GH8L1PSW9iblZKWPfmjEx13JTto+DlhYht+tbupvVVzF
	 6mbf0jzKcXkq1jfn0nrzv7bmD0znmVFvQcEF1iA0XWmkNQbMvWUM5D+cvIOHAzrwlDYTm
	 eF6soW9T7UlSuA5lwkYReYJX5IRIhmbwmFBRLXof1j3q0PNjthl9wZ2em87LAnPZ0p3vY
	 4o+Lgs63Bxi3TkDCMvK+YZb7gEnAkGGIaxdbzEubsAey5frEIpYY7o6qu9OmL22cI48TD
	 f1V+vfoAZ9OL8NISrtPYfv2Q3/SvMH+5ylyh54NYAakDz6UQXShP87JIL2Yk0zTS37g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aJLAzZsb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC32606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aJLAzZsb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32F31F000C1
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792672463;
	bh=GuRTRP+tWmDDUV9Gr8C/q+Rt7EjQK+r6xiZzyNtXQEE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aJLAzZsbwhfAkbBp6TvvueOTZoLZqHHdP0TcmUIQq2+KVcU7lDROqeNvzp3o4rvYy
	 0986rSNDP+TR/3JeW7qwVF0rR26mEWMTWy73+NMHjBXPozRp/8MlpXrk39kjDC3vne
	 KcboOKN16DQ6XfTuqhJOMAbTcXo4mnviQGESwytExHtuucH5kRSF2tHS96aveTQ9Oc
	 pi/U5iusFKb5bph94R2yGzCqnek9neRE6xIcNK9M+3cpvf6kf6iy6lXPLlfm0RG4V+
	 k8U8q0f1Zbg22L5DekMbo8eyCE2PwXCzCnWafJvRB700PrROm2CYPFbKQiB1ujFn3J
	 KgIjJqm98CvHA==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-49e5f85ce89so730285fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:34:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByMJsObnOaVKlhSN1NzQwwXOYYl7agIdewAE5YkTRTYMv8mI9B1smrbH+0fVPsOtAJykM2IhEVO1osQc40=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKR+XSyOgFUGRfzE3UUZsD8oNPjGg3fCoPFw5JOtFQF895bEjm
	1joi0uw9CUKZE+J/mIo+b9x9f/SFpQIvII0zwRvAycuNXPKjlCzQl8jdlBwRzkt0L3sVY1KxHxa
	R+NrP5qx1QWOxT7WG6dQ5x/VFu/VcJxY=
X-Received: by 2002:a05:6870:8112:b0:491:86d7:4ccf with SMTP id
 586e51a60fabf-4a7dc14b430mr3782819fac.15.1792672463060; Thu, 22 Oct 2026
 05:34:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <tencent_53CDCF8AA0022B75CF72A294CB9993D2FF07@qq.com>
In-Reply-To: <tencent_53CDCF8AA0022B75CF72A294CB9993D2FF07@qq.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 22 Oct 2026 14:34:11 +0200
X-Gmail-Original-Message-ID: <CAL4WiirNg+P9X3KxMJSPPgLmcZNFxRbKaUpxmvTV+DENYfpsDg@mail.gmail.com>
X-Gm-Features: AclHuK-yKPdl_9G1QZvnwsU-TznHvBSlt_rN2B7pK0yxpM3nsyJH4RIvlWVUYo0
Message-ID: <CAL4WiirNg+P9X3KxMJSPPgLmcZNFxRbKaUpxmvTV+DENYfpsDg@mail.gmail.com>
Subject: Re: [PATCH net] tcp: limit tcp_tso_rtt_log to a valid shift count
To: Yingjie Wang <1075151112@qq.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, ncardwell@google.com, kuniyu@google.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 22 oct. 2026 =C3=A0 14:28, Yingjie Wang <1075151112@qq.com> a =C3=
=A9crit :
>
> tcp_tso_autosize() right-shifts the u32 returned by tcp_min_rtt() by
> sysctl_tcp_tso_rtt_log. The sysctl uses proc_dou8vec_minmax() without
> an upper bound, so it accepts values through 255. Values above 31 make
> the shift undefined.
>
> A process with CAP_NET_ADMIN in the target network namespace can set the
> per-netns sysctl. With CONFIG_UBSAN_SHIFT=3Dy, setting it to 32 and sendi=
ng
> TCP data over loopback triggers:
>
>   UBSAN: shift-out-of-bounds in net/ipv4/tcp_output.c:2264:30
>   shift exponent 32 is too large for 32-bit type 'unsigned int'
>   Call Trace:
>    __ubsan_handle_shift_out_of_bounds
>    tcp_tso_segs
>    tcp_write_xmit
>    __tcp_push_pending_frames
>    tcp_push
>    tcp_sendmsg_locked
>
> Limit the sysctl to 31, the largest valid shift count for a u32, and
> document the accepted range. Writes of larger values now fail with
> -EINVAL.
>
> On a UBSAN/KASAN build of the net tree, values 0 and 31 remained
> accepted, values 32 and 255 returned -EINVAL, and TCP traffic with the
> valid boundary values produced no sanitizer diagnostics.
>
> Fixes: 65466904b015 ("tcp: adjust TSO packet sizes based on min_rtt")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yingjie Wang <1075151112@qq.com>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
