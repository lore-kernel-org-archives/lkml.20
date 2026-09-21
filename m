Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3206E335081
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789972146; cv=pass; b=b35rzFkdpFNd3kfePkrUhItCc/mnP6E0FYe2jioF+8GUylep9Zz87j5PCvZeckWgtv2jsL3FDKOXDjjm+4Rbb/BXMAHB2C9BRhHtNAooPMFwcf0O4ckF3mlFlLJ/UjDpThZFfI57kMpfjJXKwnCmnI3oho5CkpCcS5UmE9+zs6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789972146; c=relaxed/simple;
	bh=0Siashewy5HhEPnk9HS99tg2e28h1SWRdqME48VRI1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=srtxa9iOQMfnsgK3tSvk36QGnrXqjSqPtRKKTVjQeUpN0UprMdvCqL8QbYy6gHZxccfFdhpiUpPO0LdGArGJlJbwoNu7cbduleeB7EwZytFlKQiagn1DTXs+RIp+hMV41bb/7Pp3G3VJgh9kji0PSmnkI8qLpOe6PTKHcdrQEvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWvXvPS9; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWvXvPS9"
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-7f4f0d37f94so1489787a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789972144; cv=none;
        d=google.com; s=arc-20260327;
        b=SUDQvv8s9EOzypRh2u7+gnhCxTuNPp8K8vWGhk10gNaLm0fD0/qH7tmKukguU3NMba
         X19/lBgzxj2r0IwALy0hI21dlMZVG0Y0rEf01aN+4eIe5Qke3K8cFxXx6U6ISkrzv/1J
         lBv1jFcQmEMUxTiRMUxxhKwKOCXMUY2AOqR2iDjFRUM0nN/AngTCf/WmPOlmWbGUYKan
         OAthZZgv08CHvEPS8phZrzqoKyrMblr1s2ykRWN4okHxMz39b+MZMDzQXIWkMaMkiltu
         X1udHC5g7pZ/IFV7UvWBEwt6Kqi3589QEfjrqPS0Ce+3AEfxZLdSdY7M0ardOSFa8yKV
         5o0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4wszJZxcGrPvXsxoKIoCvqOUAPqt6rP310SMxZK2Rx0=;
        fh=WjVl1aQjY6LClKT/nO5tqPjHez0Z8PFC42OhZy9uiE0=;
        b=sKeRHDnCcvxVouUIqanZHF6IDh9SG+dSx6Rh73djlEX4bVKRLn4QDQkWMWLQFPhVID
         o8V3jNCwh4pROJ6Pnc1bUFoT9NKr1bOrfXURx7/ZSXASb6VQAceX0YSJ1w1A8gohBFFk
         GhP9jAgmcnVohCvLvz1GDR5Q4QPQE2vti/CXCmMeZOnhCegEO32IAnKllAIxk4pvy+Ut
         NV955rrzIarVS1zwuLvYanExSdjs3xx7cmWGFXkvAkwscyElXKxhoBmaCxhxfzPkjH1i
         RrOAKSQY5YXBzXxfYof3ePk5Kt56jM2WWq2M6D+0GZ7/3oVjzHT2MILXvaPPRRWWEZDA
         TU+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789972144; x=1790576944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4wszJZxcGrPvXsxoKIoCvqOUAPqt6rP310SMxZK2Rx0=;
        b=MWvXvPS9Rv2Mi5WEWoRs5vdkhLyIOEMvXVPPsRofBfG+93YFEROpc64c1Vu7yhbTlF
         1h+xahMqzMByWGFMahTNItzGD3fwG6f3eASCJHVOL65OTrx36BKTwYZ8l3tPGOt8lfy/
         uVPnXbc6oyUasX68XZrd1AD+dc4v7hpuwJEwxZ1H0lrdKKk3nCEq3gZNt/OmZgoJb4eQ
         XQWsHSVcyXRGzR5/2k5ZQWS0TrSCi0TePRSxXS+5MHsei8guon/IRqYGV2oAwyAknDFP
         eusolKdyZMwrVqITeTW82DfdD+cIFLhzt/gVkDjYHCQ/WDTi26Ti3s1Wgpw/SuoMYRtc
         mMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789972144; x=1790576944;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wszJZxcGrPvXsxoKIoCvqOUAPqt6rP310SMxZK2Rx0=;
        b=NrYw4ctrltAfPN84UAo7AVHk/mb5gMnUysZ5r96oSMyAjypI0EBJMRHBKYWeWm8CIF
         E5DkjENIHRPkxyqV1p6pFn5JWJi8yT9AVhWPFN5sb8/mYX3aOzTBfvpMakQm3tnS3rGL
         lfpXe+qAUSKfedZZ0f4/pl8HkCONi0G4nNfOpJmcUZqyjigrVwNVyESfPRGLkULbzUK7
         YoLuAOemhmcU1StJzy1OBOzih6empfJnTLHj/auaiJ8fWgHwdt92YWa7LuBk9rCNX7WH
         bSS+3L08YHfdV7eTsEMyorY9wJowD5D8G6QPnsOaymPTP66V9DFtAbVVqGMUCXyaK3kO
         8GrQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+QCWrJhveD8iMCDBdOhzJi1y0/Za1Tyk3uc9h95jsXhNphcb19A5aA7dPPfW6bSiaa50o0KgC3g0X8PM=@vger.kernel.org
X-Gm-Message-State: AFuF++kZ1+YueXkriYDORQsoJy13KSFECRysdX3129CCOjuaI4yWjDk4
	JYKosOaTtU8QQ3mYYHb3+WBbR6RH4lOiLZaHHZvXbMkyEV4M0fXb2LQSahHxcOoqzkRRCJIDRx9
	nOZ2v7YdFhgbnmb2p37xGxr4/v4M/GbPcQUAgrVsQuOzZ
X-Gm-Gg: AYBFou1V8zWq0EFDKNdeb0HvPRUe/pVh5wGJ2KjOfGY93rQlh3FbVJCzF/Yi0bOfzg2
	ZxDSvgmGW8mMYrRtavxhr/foZh0FRcyQg5ltCDYqW3b0oeZy3R/9yGesGvt06KrX+WG2wlPxDlS
	jd9ZR68gbK7T6N7t8pvu76Lsg1+bYCtblFXEcZXcwwjOlopI5/0RlEbsk3tTkaiM9STnV/929Ge
	ONgdNE0IoJnLQD6g3P3aCWAP6vATw6SMUPam+xKXNoTk5OAHOG2nWhNAtLM525WgjNn+5iLzDCH
	kD3TWa2rTvH1r86Sd8uoJdcK5ELMbvykbGVs1qKGKZdAfFuZB7CUbm5GwCPuBU0M1ncTbHbO4mw
	BYWvPQsulIK8VRgr38pVWN1hOkZTMmz/o+pEgf90+YA==
X-Received: by 2002:a05:6830:2b0a:b0:805:98ae:214d with SMTP id
 46e09a7af769-80de33ecd00mr10242435a34.23.1789972143862; Sun, 20 Sep 2026
 23:29:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915070119.45143-1-skokovmaksimevg@gmail.com>
In-Reply-To: <20260915070119.45143-1-skokovmaksimevg@gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Mon, 21 Sep 2026 11:28:50 +0500
X-Gm-Features: AcwNN1U8r60wVh6GjLPev53mlYoIMZzkkVTykoSGJW9ylpZ52PDeMXNGWieYPeU
Message-ID: <CABXGCsOK6Cpxskgu93oNW6SvRenpEMhgYTmYNCpm+btoqkFPkQ@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: RFCOMM: free the skb when the DLC has no owner
To: Maxim Skokov <skokovmaksimevg@gmail.com>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 12:02=E2=80=AFPM Maxim Skokov <skokovmaksimevg@gmai=
l.com> wrote:
>
> rfcomm_recv_data() hands the skb to d->data_ready() and returns 0
> without freeing it, so the callback owns the skb from that point on.
> The tty implementation frees it when the DLC has been detached from its
> device:
>
>   static void rfcomm_dev_data_ready(struct rfcomm_dlc *dlc,
>                                     struct sk_buff *skb)
>   {
>           struct rfcomm_dev *dev =3D dlc->owner;
>
>           if (!dev) {
>                   kfree_skb(skb);
>                   return;
>           }
>
> The socket implementation returns without freeing it, and the skb is
> leaked.
>
> A connected DLC can have no owner: rfcomm_sock_destruct() clears
> d->owner, while the DLC itself stays on the session until it is closed.
> Data frames that arrive in that window still find d->state =3D=3D
> BT_CONNECTED in rfcomm_recv_data() and are handed to the callback, one
> leaked skb each.
>
> The leak does not stop on its own either.  The remote runs out of
> credits only once RFCOMM_RX_THROTTLED is set, and for a socket the only
> place that sets it is rfcomm_sk_data_ready() itself, below the return.
> rfcomm_process_dlcs() keeps granting credits, so the remote keeps
> sending and the leak keeps growing.
>
> Free the skb, as the tty side does.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> Closes: https://lore.kernel.org/linux-bluetooth/CABXGCsPe5wykd8Aj-hm+SJ7S=
GQyb8yoGNnx3XDpPmBathj+EGg@mail.gmail.com/
> Cc: stable@vger.kernel.org
> Signed-off-by: Maxim Skokov <skokovmaksimevg@gmail.com>
> Assisted-by: Claude:claude-opus-5
> ---
>
> Notes:
>     Noticed in the v3 thread of "Bluetooth: RFCOMM: connect the session
>     socket without rfcomm_mutex", where the same leak is described.
>
>     Found by inspection.  I did not manage to produce an orphaned connect=
ed
>     DLC on hardware: it needs the socket to be destroyed while the remote=
 is
>     still sending on the DLC.  A kprobe on rfcomm_sk_data_ready() over an
>     HFP session (RTL8851BE, btusb) counted 31 frames delivered to a live
>     socket and one rfcomm_sock_destruct(), so the window does open in nor=
mal
>     use; no frame happened to arrive inside it.
>
>     Built and loaded on 7.3.0-rc1 with KASAN, UBSAN, PROVE_LOCKING and
>     DEBUG_OBJECTS; HFP and A2DP sessions behave as before, and none of th=
e
>     sanitizers reported anything on the RFCOMM paths.
>
>     v2: no code change.  Removed the trailing whitespace on the blank lin=
es of
>     this section, which git format-patch --notes adds and gitlint rejecte=
d.
>
>     v1: https://lore.kernel.org/linux-bluetooth/20260914173044.5249-1-sko=
kovmaksimevg@gmail.com/
>
>  net/bluetooth/rfcomm/sock.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/net/bluetooth/rfcomm/sock.c b/net/bluetooth/rfcomm/sock.c
> index 958081adb9..82aa38715c 100644
> --- a/net/bluetooth/rfcomm/sock.c
> +++ b/net/bluetooth/rfcomm/sock.c
> @@ -48,8 +48,11 @@ static void rfcomm_sock_kill(struct sock *sk);
>  static void rfcomm_sk_data_ready(struct rfcomm_dlc *d, struct sk_buff *s=
kb)
>  {
>         struct sock *sk =3D d->owner;
> -       if (!sk)
> +
> +       if (!sk) {
> +               kfree_skb(skb);
>                 return;
> +       }
>
>         atomic_add(skb->len, &sk->sk_rmem_alloc);
>         skb_queue_tail(&sk->sk_receive_queue, skb);
> --
> 2.47.3
>

The mechanism matches what was found in the v3 thread of "Bluetooth:
RFCOMM: connect the session socket without rfcomm_mutex": for a DLC
whose socket is already gone, rfcomm_sk_data_ready() returns on the
!sk check, and rfcomm_recv_data() does not free the skb either - its
kfree_skb() sits on the drop: label, which that path never reaches.

The tty side has been doing exactly this for as long as the two
implementations have existed, so bringing the socket side in line is
the right shape of fix.

Reviewed-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

--=20
Thanks,
Mikhail Gavrilov.
