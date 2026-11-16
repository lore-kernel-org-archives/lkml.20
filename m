Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794848677;
	b=hKAE808YXWH6B71YClIe2LnfpPRQDo3Rg+GeeRRmE6QlU1T7IVsi3yLUt+gTtm/v2eyU
	 54JU9CF3QmAwDscAYmBps562B2zOkvNOs1MwFTSS8IvpnITXnlmLirjPyCa8WmNakvmEz
	 I+YcWRYCzavlehm5rzMM0GfJ9LHJPMtbdgubBhuMy3S/pTD0cHHnsmy41UBmMKUZuDorT
	 TNTMgFEvPRcH5l+27C5TJOGfLobn7McdiGJU4wKB1Sk9eDilHiHnYrvvma9pETITlkBbj
	 qDMW+b6e2R1vQEBdih1g0tX2NJF4LxkQhRvGWoN6AxX4ZCB3h5SIDJm8R8cU49L3w3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OuuyAZ4IWLgVQrPB86XUEajs/Fsetiw6Rysz8jcKkt0=;
	b=WcQ74tk1OgWzgvTtE0giMvP7m14GecJw9VvIbQr8H76QFJNWi37NwdyT9/pIhITxSdRd
	 AoWDeLuGX4l2QXKNa1nE0sO/kEH9A2rgsX9Yilb/HSfRpUNlY2gRWqnnP57QiaGXp2La0
	 Ox15pOxN5SuhhOzcBvlVM/iU3zrPjdDxS6271xEbJo7toxSo1s3TisbK0Lacc2FP/VW91
	 iOCIL+W8GiSFJQGP4j46U9PM/QUgXZGXFJ/SpB+sD8Xo3J1jYfGWm67qbmoTPeTvq2WZ/
	 s9w/VoMnMRI+OqhxjMWTTPKmuNZ9VbMZpR8/9gzoQtpH+yUoPkKbaRjlWZO5G6TRTEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WZYY2r8K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0DB606A891
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F0DB606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WZYY2r8K
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4d07494b0so705247b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:04:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794848676; cv=none;
        d=google.com; s=arc-20260327;
        b=kkWMObL/bMC5RhLfkTYELxbxyCoC4+EeIpmVfxoMYPpzSKoJUYKYDjaxKK33AkEGHd
         B77rGsC/OnuKdEytVXkMImNBjdHfWtFHFtBbEcRtsKQMRQPKCBfSyBo4G7Me2I2G0246
         j0IWwbNsvTS52Z/xWMNdhIfZBUC6SEcx886jcD5WIOZ3Hdoz+HgfzP6QfjBovDdGgAGn
         sI+d72M9Tt5wa3ZrHCKpS7xvS0A7xJu1lfgh4DslXdE1GUjCRFLheN/fXJD4X0+IZ9lQ
         Y2Jh882lazpJHG9UIMkSGmXirnfvp4aHvYZtQb/jGJskch7naQkk8upu0PVwD+da66Tw
         kUbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OuuyAZ4IWLgVQrPB86XUEajs/Fsetiw6Rysz8jcKkt0=;
        fh=Zu8htiNWV3fM5bIfmSP92/WQXfxYG5C3jVNK68LdbWM=;
        b=HT3ILK6/Ll69zLreK5GnqymipYoBKMIEHxtdK2Xw1fHmkNJHTNND4QDI3xSr1XZK0U
         yQ0T+39FvC0NrwMtIlGK8HEwlVkNGj0o47/85UTYz8yQPP4ymlP/f6tiQ5vBoDTZLowO
         XsvoMsbh4Ffd3kkOlR2fDFge4GJflyKsFfoTqlJIAFdA4zoFnDuWUn9ywTthFPHh46ge
         7vYhyRfuvxB9rVXnpMsfNyGsCu3lWBr8X6yvk5EvCJwT5WGxbdInEvnFWWz2l0fxJDd2
         kVes7ckMCt9v68JVOaZsdYNrGNAuamvifrOd1N4855Lmv2FwCCCA+kkEfssUlaZa2+GN
         VMfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794848676; x=1795453476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OuuyAZ4IWLgVQrPB86XUEajs/Fsetiw6Rysz8jcKkt0=;
        b=WZYY2r8KgTyJC8YKopk67NlqvwpC1c5dZ4/uebpyAgqgLz7Uc/bMqiwjjrEI3xwkoV
         +VhQx82XFmQwmTJncIGsGKv4tFZM4AfYO7d0mx/KDjSYKbsSMEexaRRcyS5s26s059Ve
         TUKHv/A6NpzCtrL7atOzRURA1LFIwh+2swxki0IZzipXDtTzWrQjDbuWmS0LcnOPKnIM
         mD5Oo2li6ok9yYVXWD7LZugQesJkeQBHppksRD3FRdDmebsc4pu8/VvgC4E3sRjmXcA0
         7EHqvZbdaQd0Y6JJ/8XcPAEmz3lBpdyDSuT0uRdlKgHOPX7rBgQsA0a7RUSmh9qCJ26t
         CW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848676; x=1795453476;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OuuyAZ4IWLgVQrPB86XUEajs/Fsetiw6Rysz8jcKkt0=;
        b=xD7PrOonjQRog4bjFVNN0998/VUQ7o2LzjemYlrrV8kuyWc3gpvK1RLCs0RqLUSWiX
         +dff6hkkoLadsHwoLnOGygm4oieyH26TbMoJolCSi1EH1T6G1YW4Ex2wrEK4edZcrncE
         n69ZS5jA02jUxgMXEtY289XZmpJi//ST4Kl1kARBhkNOHEK1t7nFLjCqwEM43tfbk6dE
         ZNa+1RliHhRtgSyrsRTDSrJTBZ5bRSR3H5g/BIspAZGI0PUPboGqzTqg/qTl9ShbF+o0
         hh1RtkLpD6ZT9B6ljxlZqiXzlgn6qvs4Za4yZD51MZAR5d5hn6gVvS8lqA4Nxy7Z/Eq9
         CKDA==
X-Forwarded-Encrypted: i=1; AL+hErG+YvdzkAtMnsdVOmu1iYP0Vsz/s+lxLL88Cry265m6luY97IoIN7CezE91b1WTUdPHXMaF4Xo/twO49VA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yeb3jElpTJZPQ+nWMCe4PYjAxEDi88nC2wF9ZO9xcf60qWt1D
	QSPO1dMlIvs6Qa6gVCRYm7Kok4c4e7jFz2QTqXJo5+1OerfSsaLADLlJ13QeFZnNhjU990AWagp
	nqSB3+eHw6aT2y2AUj8+d8Zfk9B7W530=
X-Gm-Gg: AZFdTZet/Dro3vZ+j06+/Y5psSiJ2Ff5bMAaq1xDY0zKAD9985vRuFUk7OfvbLUsvX9
	BA0tCRMAMN+oocJ88XuMJSAdXH8Y9GqwnjcONK4y5ueQLmsUhVdAQw2f+Wlo/aD1+PqiHMvjdcw
	7nvsm9s5tDEcELiYFlwMr7izTH2a9P/tb0KHcMbS0M1SYfMU4e7ChAp4OP/XJSbADKFE2W7A8rZ
	/eRt6eZ9H0fmc/IerFDU5W5bh6h5hTUAxkbpGW+X70JtPMJc19b/RqLflKK1twxYi0Eli6baUKS
	SPAYFNZMEzD8BbrTl50EufSeeZYdICRO/S/net15EYvwS9YTNlte0iNylPWFaaYn2b/nouQpusV
	2msfuq5NfJ+2tws5/u21piqu3kRyPVphT2mp72tcq9xSGsdAVaWnGpxcsfZIV7hI9J+wWiDsuV0
	nTuUmO/Kw1MxFdAtq/P0A6QTM/AJqIOSFdeDVpgOYfuljZFMlDt7ChuMyH
X-Received: by 2002:a05:690e:4145:b0:679:97d1:439e with SMTP id
 956f58d0204a3-67dc76a3aebmr61822d50.2.1794848675703; Mon, 16 Nov 2026
 09:04:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115115341.316484-1-ngocthang2710.1999@gmail.com>
In-Reply-To: <20261115115341.316484-1-ngocthang2710.1999@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 16 Nov 2026 12:04:22 -0500
X-Gm-Features: AclHuK-7mHIMY0CY3JZllTpHy6nwtTontz9GqLEJ12QCe-O4w2_0-LpJPkaVhfo
Message-ID: <CABBYNZLEONoqo+mdnNyv19pd3HxyfHAyHTPUpi-et0RFMctN6Q@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: L2CAP: don't reserve an ident for L2CAP_LE_CREDITS
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stig Hornang <stig@hornang.me>, 
	syzbot+9dc8780713b11155dd74@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nguyen,

On Sun, Nov 15, 2026 at 6:53=E2=80=AFAM Nguyen Ngoc Thang
<ngocthang2710.1999@gmail.com> wrote:
>
> l2cap_chan_le_send_credits() allocates an ident from conn->tx_ida, sends
> L2CAP_LE_CREDITS and then frees the ident unconditionally, since the
> command has no response.
>
> But the ident is visible in tx_ida while the command is in flight, and
> the remote may answer it with L2CAP_COMMAND_REJ anyway. The RX path then
> releases it in l2cap_put_ident() under conn->lock, while the credits path
> runs from recvmsg() with only the socket lock held. Whichever ida_free()
> comes second hits:
>
>   ida_free called for id=3D3 which is not allocated.
>   WARNING: lib/idr.c:594 at ida_free+0x24c/0x2d4 lib/idr.c:594
>   Call trace:
>    ida_free+0x24c/0x2d4 lib/idr.c:594
>    l2cap_chan_le_send_credits+0x17c/0x29c net/bluetooth/l2cap_core.c:7113
>    l2cap_chan_rx_avail+0xb4/0x134 net/bluetooth/l2cap_core.c:7126
>    l2cap_publish_rx_avail+0x110/0x168 net/bluetooth/l2cap_sock.c
>    l2cap_sock_recvmsg+0x280/0x7b8 net/bluetooth/l2cap_sock.c:1317
>
> Worse, if the ident is reallocated for a real request in between, the
> credits path frees that request's ident instead.
>
> tx_ida only exists to track requests awaiting a response, so a command
> without one has no business in it. Give L2CAP_LE_CREDITS a plain cyclic
> ident instead, which never needs releasing. The ident is still never 0
> and never exhausts the range, which is what commit 6e1930ece855
> ("Bluetooth: L2CAP: fix tx ident leak for commands without a response")
> set out to fix.
>
> Fixes: 6e1930ece855 ("Bluetooth: L2CAP: fix tx ident leak for commands wi=
thout a response")
> Reported-by: syzbot+9dc8780713b11155dd74@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D9dc8780713b11155dd74
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
> ---
> Tested in QEMU (x86_64, KASAN + lockdep) with the syzbot C reproducer,
> 15 runs per kernel:
>   base (origin/master 23c62304dde2): 31x "ida_free called for id=3DN ..."
>   patched:                           0 warnings, 1200 LE credits sent,
>                                      none with ident 0 (ident wraps fine)
>
>  net/bluetooth/l2cap_core.c | 44 +++++++++++++++++++++-----------------
>  1 file changed, 24 insertions(+), 20 deletions(-)
>
> diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
> index 7dcb0586a10b..0b861ced5703 100644
> --- a/net/bluetooth/l2cap_core.c
> +++ b/net/bluetooth/l2cap_core.c
> @@ -1028,21 +1028,36 @@ int l2cap_chan_check_security(struct l2cap_chan *=
chan, bool initiator)
>                                  initiator);
>  }
>
> -static int l2cap_get_ident(struct l2cap_conn *conn)
> +static u8 l2cap_ident_max(struct l2cap_conn *conn)
>  {
> -       u8 max;
> -       int ident;
> -
>         /* LE link does not support tools like l2ping so use the full ran=
ge */
>         if (conn->hcon->type =3D=3D LE_LINK)
> -               max =3D 255;
> +               return 255;
> +
>         /* Get next available identificator.
>          *    1 - 128 are used by kernel.
>          *  129 - 199 are reserved.
>          *  200 - 254 are used by utilities like l2ping, etc.
>          */
> -       else
> -               max =3D 128;
> +       return 128;
> +}
> +
> +/* Ident for a command that has no response: it is not reserved in tx_id=
a,
> + * so nothing has to release it and it can't be released twice.
> + */
> +static u8 l2cap_next_ident(struct l2cap_conn *conn)
> +{
> +       u8 ident =3D READ_ONCE(conn->tx_ident) % l2cap_ident_max(conn) + =
1;
> +
> +       WRITE_ONCE(conn->tx_ident, ident);
> +
> +       return ident;
> +}
> +
> +static int l2cap_get_ident(struct l2cap_conn *conn)
> +{
> +       u8 max =3D l2cap_ident_max(conn);
> +       int ident;
>
>         /* Allocate ident using min as last used + 1 (cyclic) */
>         ident =3D ida_alloc_range(&conn->tx_ida, READ_ONCE(conn->tx_ident=
) + 1,
> @@ -7081,7 +7096,6 @@ static void l2cap_chan_le_send_credits(struct l2cap=
_chan *chan)
>         struct l2cap_conn *conn =3D chan->conn;
>         struct l2cap_le_credits pkt;
>         u16 return_credits =3D l2cap_le_rx_credits(chan);
> -       int ident;
>
>         if (chan->mode !=3D L2CAP_MODE_LE_FLOWCTL &&
>             chan->mode !=3D L2CAP_MODE_EXT_FLOWCTL)
> @@ -7099,18 +7113,8 @@ static void l2cap_chan_le_send_credits(struct l2ca=
p_chan *chan)
>         pkt.cid     =3D cpu_to_le16(chan->scid);
>         pkt.credits =3D cpu_to_le16(return_credits);
>
> -       ident =3D l2cap_get_ident(conn);
> -
> -       l2cap_send_cmd(conn, ident, L2CAP_LE_CREDITS, sizeof(pkt), &pkt);
> -
> -       /* L2CAP_LE_CREDITS has no response so the ident is never release=
d by
> -        * l2cap_put_ident() - release it right away, otherwise the tx_id=
a
> -        * range is exhausted after 254 packets and from then on credits =
are
> -        * sent with the invalid ident 0, which some remote stacks ignore=
,
> -        * stalling the channel.
> -        */
> -       if (ident > 0)
> -               ida_free(&conn->tx_ida, ident);
> +       l2cap_send_cmd(conn, l2cap_next_ident(conn), L2CAP_LE_CREDITS,
> +                      sizeof(pkt), &pkt);
>  }
>
>  void l2cap_chan_rx_avail(struct l2cap_chan *chan, ssize_t rx_avail)
> --
> 2.43.0

Sashiko flagged a problem:
https://sashiko.dev/#/patchset/20261115115341.316484-1-ngocthang2710.1999%4=
0gmail.com


--=20
Luiz Augusto von Dentz
