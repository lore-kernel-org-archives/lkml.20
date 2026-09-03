Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE14E2E7380
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 01:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788399514; cv=pass; b=mF9Enw5BoUbi1XGcXgTXbRdwLdwOtt6mYi4/R3iNP9e5uoDonRA6lM6KWTQ38f6Hr2c8cFUtRXLxbRax2YPjcd9tfHN5ydX+YOQ2Rarjrohk3tJMGgwQQ69uDJHklCbM5Y6s0GFHSoLQnN9T/RuCeGvh/X7vyhf5RbwNeiDJie4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788399514; c=relaxed/simple;
	bh=Az8ML3xziSsQ3jStY9KH6BKlBem4EKxqSIFS0wdqnVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PdQK7lcHHTvCN1M9gkVbP7GnD1zGDv+cDeKVARkomKixl83M3jDIJVPRqIBHmQgI1xoDJUQ/PdEY1buwIxAKKP36+ZvqvIRyqxTqkh7nYOksP04F0kIw3ddjf2MYdSVzv9tqmedxxCFfG6Hi4Dx+3WotRoHPFBparLRzbQi2rZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ieMt5XrW; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ieMt5XrW"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so2198730a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 18:38:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788399512; cv=none;
        d=google.com; s=arc-20260327;
        b=d6vs2QUQG8nXv1XnOk78fAGttjZBB1jFgCdGHgC+MZiZDtN5MqiYTRnCvGtKKKI+Qy
         uT2qJdqKhNWLfJOB/2cHhBS01g6vi8cqOdbTi00Ub7sYDtEpTmZVwECylo1E6gKLnRTN
         3wbHS9XzkvqiT7YqG2IYKuEWtlBOwZLxpSkFXt5fGF7s6cxQLDvCtoYOuALP1Zp2QTJD
         1j2M/VugAsvc2mQ008H6GXUJGh0dYQk1PiahWEWFcVOmMawkbYb0DvzersHn5Dv/UiXu
         wPPuw0d/8KAA4Q5eRPswK0JpD2G1jj+DMT9pSv4JPDIw2d7KOomtTNviNs6emSG4kO1g
         8Oig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V64QR1IsR8MyGUl9CMimjz0m+06sJhfAIW6p6kz46nA=;
        fh=7u/s2NNmMN+txaY9sxkuaH8aCUR301vM/KB9rp/bxbA=;
        b=DXO11QEPJT+ogolw3SFX2DLjG3RpVrkW5tcnrrjE/chFzHAR5FKjAMGeS5uhoreOZB
         KiZfU1USW+ouxpjXAaQ+vtNPJb70HBCyc7X8JQJmxZ92IEHI1sYOMpGyPAfoECE+qgxq
         iY4rWc8INYQCVmHaVaRgAyb3xcR2vQWRxPbb7XV5YxM/iAIJcJjGglyT+/INK14w16p5
         8CJ2ctywyG91VHMtGqhldQjkzSBzGVIdgDgiaG3QQsydJmFo45HeRoKU1r/EBbxdBh3w
         hY4YwDKUqXXiMumDlv9ZEotyOYjyawRCWdX90N8QA+Fa+DhrJadr5M/p5zAZFTcLbWFZ
         Hk8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788399512; x=1789004312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V64QR1IsR8MyGUl9CMimjz0m+06sJhfAIW6p6kz46nA=;
        b=ieMt5XrWd/F2asW2oeONrumun9WGXZFvz32TcoQYBhzLUd9Eous5nDRCsjE1gkIJow
         euZTRZWFfh1FxrazNwawDR2EopRRy9oHytGWh/gperNGNBFMrEygCNVSIY/M8O03STQL
         eH4xRrkIzUObT+5CBkWcSRrg/A8qG4fGUGu9fPS+tuWX+J1Hy2p5Dvq7lGBX750CA7l+
         IN4RmV3hvXc/nVPoY0oc6qpebwGuI3l3JemGo22AowhZclmnZdDEvLNVJ7bi+z7QDCDi
         j3Hgc2lawmfIFkLotCEUhwZur5FI7n/wCNPAUQXa2nvIj1lJugj5MRlCBfoGd+FCzEq7
         nALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788399512; x=1789004312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V64QR1IsR8MyGUl9CMimjz0m+06sJhfAIW6p6kz46nA=;
        b=Q3ThfaNGHV4sVG8AsOgUs2W8RAy4+yGUkeb6i2g3kNN/UzqFWBgUa7/38TGIle3cjv
         WOMxhlis2GbRyKJeh7BzFGdWnWXiAd7AQSbVdbuoe76db0YqgUkiHiVIz4zS0whTIHTD
         HzOinLoOTYzadBSM+B7t/zpwEgUGM/LLd4yTeCVRI5znBxBXcslY1SGElNglRBaaugyZ
         ZVGi5X0ANwZrT5iKEZU+NasQZPkvLNTfKyncBXLrqgXZpCz/1fFp6SsIfPGIFRi3/0X8
         xZbwPPzYsYcgKDRIBMugtVWcEoLGYQF/tZfAjsbdI8vdT6plaBNYDa+sLCtCjrB011RJ
         COUg==
X-Forwarded-Encrypted: i=1; AKwUvBwXP6n2vfV4oesYxeWHIIyT0hGLkFKnoz5iLGQNIy/oty1Y3mRVv6nwCC+0cKcm1byD2UaViIfAGMNy1Lc=@vger.kernel.org
X-Gm-Message-State: AFuF++n5y/IMdw/lneFUBzs5lm9y4SdV+avCETwcwMn5BnBB1dsjovZN
	SnW1S6zVVlC/o4Jvdh+s3BGfEjd/xQWyVhK7HK+qRE57lG7dLoRwZ4L1hHKWWkVpoh2oJ28boEM
	JKGVwBu71iRSEFyMrMKai7k9l2p7EM42pTg8Y5vePpk6gA2a2Cq9ctkypm5U=
X-Gm-Gg: AYBFou08O6dEYZ5HGSpSE4qFR0OKbpx2L7fFEA4b7wSE63UC/fPgY3TFrzn4i1HyyvL
	dZD9098/jMDOnS61bQYymR7S2npDLLG8+TGzMyfr+Q00BVrD8KeMaETb6JZo7qvp+bIaiviQqvr
	sik2S9etFXjz7W6tQgk5RDVmBxTquSCRO0/i4Lk73yYQhhTBd4EWwJxSJLFD/NY5mDwrMttuvvV
	z+ZoIx33gZH8MAcYcxpuSvnR29GH05utXpUHBIyp/bDDEWqwS2tP3yzftpQ9+OR/6/SgfIXu6AW
	L4piI/t8ys6K5Lq1ExRDXGNrMfUt0GbkzhGqqSqJMu6LEKhqMsavpY72bwoqJjDsl3O0DAWC0/k
	oUCcxrK/5wSEt3S5ncDGYFc2FitOUuX8h0G7uT0gD0nMNq2XRyh2yS1L+mmAeCbVj0lIQ6YielG
	M0H2RUo+50Fi9L
X-Received: by 2002:a17:90b:3fc7:b0:398:9be8:ea69 with SMTP id
 98e67ed59e1d1-39aee251837mr14335412a91.22.1788399511412; Wed, 02 Sep 2026
 18:38:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAE3jtcL0b8YsNiJpcXkUVoZRxFetU9o8z=JVNUCnDXN=seUmg@mail.gmail.com>
In-Reply-To: <CAAE3jtcL0b8YsNiJpcXkUVoZRxFetU9o8z=JVNUCnDXN=seUmg@mail.gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 2 Sep 2026 18:38:18 -0700
X-Gm-Features: AcwNN1V2Dk1ZXSLu1Azh2xjqw6dIZJAN5we8KwxOa0fvJ97gB8WYOupXivWTtro
Message-ID: <CAAVpQUC6RHs+ODtKtgSDy=oxV12azk5QkjO50yUDJpOAHiv3qA@mail.gmail.com>
Subject: Re: [RFC] splice: add wait-all semantics for socket-to-pipe reads
To: =?UTF-8?B?5aSp54u8?= <rockeet@gmail.com>
Cc: linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, brauner@kernel.org, 
	viro@zeniv.linux.org.uk, edumazet@google.com, ncardwell@google.com, 
	alx@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 8:53=E2=80=AFPM =E5=A4=A9=E7=8B=BC <rockeet@gmail.co=
m> wrote:
>
> Hi,
>
> I would like to ask whether splice(2) could gain wait-all semantics for
> blocking socket-to-pipe transfers, analogous to recv(MSG_WAITALL).
>
> The concrete use case is a high-performance S3 FUSE client.  Once an HTTP
> response header has been parsed, the response body length and the exact r=
ange
> requested by FUSE are known.  The body is moved from a TCP socket into a =
pipe
> used for an fd-backed FUSE reply.  No userspace data buffer is needed.
>
> Today userspace has to loop around splice() until the requested length ha=
s
> been transferred.  On a fast local network this commonly turns one logica=
l
> read into several splice syscalls and scheduling transitions.  In one rec=
ent
> profile, 3,475 S3 GET requests caused 25,463 splice syscalls (7.33 per GE=
T).
> The profile contained no poll or setsockopt calls in the hot path, and 80=
.86%
> of the sampled CPU time was in the kernel.
>
> The obvious workarounds all have undesirable properties:
>
>   - looping over splice() in userspace adds syscalls and wakeups for shor=
t
>     positive returns;
>   - poll plus SO_RCVLOWAT waits for data to accumulate in the socket rece=
ive
>     buffer, adds another syscall, and couples latency to an advisory read=
iness
>     threshold;
>   - recv(MSG_WAITALL) requires a userspace buffer and loses the socket-to=
-pipe
>     splice path;
>   - increasing SO_RCVBUF does not make splice wait for the requested leng=
th.
>
> The current TCP implementation is already close to providing the desired
> behavior.  tcp_splice_read() obtains its time budget with sock_rcvtimeo()=
 and
> loops while data remains immediately available.  However, after making an=
y
> positive progress, a later iteration that finds no data returns immediate=
ly
> because of:
>
>         else if (!ret) {
>                 if (spliced)
>                         break;
>                 ...
>                 ret =3D sk_wait_data(sk, &timeo, NULL);
>         }
>
> Would a new flag such as SPLICE_F_WAITALL be acceptable?

The use case makes sense, but I think it depends on the numbers.

Another aspect would be whether we want to add a new (potentially
buggy) feature for a single user in this AI era.

It would be great if the change is proven to improve performance
of the official client that has a lot more users worldwide.
https://github.com/awslabs/mountpoint-s3/


>  For a blocking
> socket-to-pipe splice it would mean:
>
>   - keep transferring until len bytes have entered the pipe;
>   - after a short positive transfer followed by temporary lack of input,
>     wait in the kernel with sk_wait_data() instead of returning;
>   - use the socket's existing SO_RCVTIMEO as the total receive wait budge=
t;
>   - still return early for EOF, shutdown, a pending socket error, or a si=
gnal;
>   - on timeout/error/signal after partial progress, return the partial by=
te
>     count, matching the usual stream-receive convention; otherwise return=
 the
>     corresponding error;
>   - retain the existing behavior when SPLICE_F_WAITALL is absent.
>
> SPLICE_F_NONBLOCK/O_NONBLOCK would remain orthogonal: WAITALL would not c=
ause
> sleeping on a nonblocking descriptor.  The destination pipe must either h=
ave
> enough capacity for len or be drained concurrently, as with blocking spli=
ce
> today.  For the motivating workload the pipe is sized for the FUSE reques=
t.
>
> The important property is that data can be spliced into the pipe immediat=
ely
> as TCP data arrives.  Unlike poll plus SO_RCVLOWAT, this does not require=
 the
> whole range to accumulate in the socket buffer before transfer begins, wh=
ile
> still keeping the wait-and-retry loop inside one syscall.
>
> This appears implementable as a small conditional change in the TCP splic=
e
> read loop plus UAPI documentation and selftests.  I am sending this RFC f=
irst
> to confirm whether a splice flag is the right interface and whether the
> SO_RCVTIMEO-based partial-return semantics are acceptable before preparin=
g a
> patch.
>
> The userspace implementation and CI profile that motivated this request a=
re
> available here:
>
>   https://github.com/topling/ngs3fs/commit/4b8f5a69ceebd9211021a5d1149637=
3d63f2e43d
>   https://github.com/topling/ngs3fs/actions/runs/33586457571
>
> Thanks,
> leipeng
