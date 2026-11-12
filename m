Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472429;
	b=nt1j31xQSUOU0XWzQmgY5nWnvabYmHA2dUHyWY6lfF2nOQ9+2JVea+gc/MxUgykQnZZo
	 QVPh4xi4vJSWHI9A6E6U8B6kOt8YkASurik+uH936yvntSjmjKtrMZuIJ4ABjLheCuwBG
	 iqhdixFEkwGydmGUNsxD8sg3cdmkY2+xer0ql44L25mRnuAMORPKrHZwL5XOOARtowKce
	 fOQY9lcdKrzikwVvKy8+p3BrIL0IcQXtP0CVhecqXuvt8fISeQ1Xo5lXg8b/tjqhklSWm
	 W7/k+zqdqu5k5bUst755vWjyN46f9tFyGuDn++ICQQ+kZBwWAn802AkKkfkLZ+MAUew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uOYvxf+M0Ap4noHF2nmW81cSBmYvF6P+PnsYCByXef8=;
	b=4LvJ6/pJfkNY5DT8lKAzyRHb/S7fm4ZB7jtZxUTDC9OG9hTgwOAsXIgmWZ4w9ZgqzEku
	 T/e35Nq4wyecLez8XQBOSpp2GSN70jRuw+NGtgL5bG7aaU4tTPA/MbrvrKLQXUih5RbX1
	 rmxeO/4jwMycJCzvxQdwankjn7PtrJJqXHyBxWtTdiSHHzTX3XDbD8Kt8Yq5G/h4txxHv
	 WJpzE+G1eyeYXMJ/9Jqr4v89HF90S7OfF5cloVKQICYWiM2evEqCE6Fn8QttWcN4Mxn4D
	 CZmGDfhSt2Vd3cKAslRuisnCSNm1UMeLSwJ6uLNFvWj+6Am8FVDls8RhWfKqp1TtVDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oi8b8PLn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D59260734AB
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D59260734AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oi8b8PLn
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-702dedeb70dso2209132eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:33:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794472428; cv=none;
        d=google.com; s=arc-20260327;
        b=pwDnOq3D7DjWAKfh2mVaAPBOsic/8Wi+mw+aLHV9gUrrIhMH/9DzNCTK6kcqo1S1c+
         Uk1lJXFefq52L1YEXq6J55fIRhfKrBopCFvwQYsu2ZWzdvc+iQWp4hhYL/9hVW5xQHaf
         G0X1DLwR9of/NsGU6NDtWPPBtfHZ6P6CfnWW8g7dpPzBpOksD94pnUJYO+kE5bBycoUE
         mirwYJoosQZyyietLgADf5XfIUyVR/dtrpSEemE60AGDa+Bssq0/3unG1Tp0oRk7K8x8
         a69rIbsZNAaMq5/ejCw0yfwzxq8EGK18VVn6OnyZINFKq6Y2KFD78u1bgPd5EYOlTK3v
         YmUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uOYvxf+M0Ap4noHF2nmW81cSBmYvF6P+PnsYCByXef8=;
        fh=a3fVZb5rc8ircNjRSPkOWn2uhyTggXNVMqlTYy6d69U=;
        b=EZ8teIQMHau1gJBEr+UHGWWcDWFbRWQKW7Nf87Jr6ppb02ZJmnHApmCAmk0uuOwTin
         TwDK/nfhjMPxCyPxFLm5uiLGdA2NzLpJ8NaubwfcQL9S5e61c23tjWZV/74pu7lCCfTH
         Rn2Uxq+vroIWCk1teB22pNaJMcJl2p4a0AweDI8fRUQI64KIseRSo8D84mPUhgm82YfZ
         gDcOJX4b5PoaeG8H7rnYjWOYloUi3IDDh1Q756FaEfjxOEdGG9lZBQeTXdDgpJOPEq0I
         pzMKDF8uSf7flGErjWap5PsOc7m5hpc/T51yIg721R2lWTTSlZjE32y3JEkCcNs9QMuC
         ikbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794472428; x=1795077228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uOYvxf+M0Ap4noHF2nmW81cSBmYvF6P+PnsYCByXef8=;
        b=Oi8b8PLnrmaQ64bFFPurb/0NRJSzOTgERT3w52aHLchDiGE24NvNc053MGzsM+qWdL
         ab6xBre0Y27SWz0NmrywKH21t/466fyW7knd2Doyzxy9qhiNmu8hkmno4/lsE2WZxlzH
         22p9C4gSoYQpEuV2L4h42JiLHb7tpw27dm67IQiaIuePmeBEJg6W/XbL5OHHBuPAlJCI
         tu8qeYoLlHJf4HiWDS3uu5OIG+pmyFXb+l1gKtpZgQdPdyaeJLe6UZf8HBUW6dA3vAfS
         gdzKhEwM4a7ocp3W88w62eMBgYlyvTCne/5bB0mwVJwyZ0Rx5kM1dCLfo8OxSdQh7aZp
         ba2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472428; x=1795077228;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uOYvxf+M0Ap4noHF2nmW81cSBmYvF6P+PnsYCByXef8=;
        b=WI+73E5aQ1XyBE65ed0OLdI/ip4d1rhbe2YDXwouXFZY12K/AN9sMZm7ComQ6vrns+
         Bzet1Rl1kcflmoyNY/FcYGuiP9iO3RPRWEhfMpbxl2DyetIQZLXM7am2agFwHwhIsc6l
         mkkE4t/gn0om06EzcBVZKBZNJyuM/T+Rw0YVrQad6gTjUubXs1eN5MqUuyCwwj7RngfU
         LcY3Y3/uYGjCY6WpFXIglIoVQ4DrR+KeIgKM/kSo2MX+8ugoEBNCb4mECqP28Z6jvNGA
         nOG/04g0ki3FhzQ9dg/8PueRXEQN4zTgwObOiBIqy8BhyXI8tuumLbxHieWfmTLtkv+S
         fbkg==
X-Forwarded-Encrypted: i=1; AL+hErG9jXl2vP2Wa76bSpw/OdAwZW+iiH/eXaMwWn1NwfM8Wts9IMWDtGtjvrQ3cnGOSod+IukFI4kZ0YIjT9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZzWPlreUt4PoFD7AgwT7J6YhL+iI+Ade7llax/GiiyhsPYtbW
	eJaBkV9nNJkub7aszrCWL3pVh329ipnAgcbC5AWQ6CEV6UZ9KINn+4iWFVQdlkrx1HIZnsQ1XY9
	3x3pyzOK48TJhUdN0KquJVaP/PuhEEIQ=
X-Gm-Gg: AYBFou2fh9vmbEmrQ1wxMnTqwCVfon0lCvpP5IBUw8Yie3v0stJpY8DGVGJqM+N8Aoq
	/jkhDwcKsJsc6YW1JUaY+vZHVu8Io+JfBJQ9/nbOFp3QGgcXiPCDSFpHsG7nAIP88NduljRIaNN
	oYlVYA0TI8f/UVyQYtsuW64DXocL424cHaeoaaZb28FVqw5wIqkmukRPOFL+T2fp3yArt/oq55o
	x779baPvXP0ONJyGGefcFbZDNcoTypfxYCZPFHQFkW6UgB3I8ToBmgLY0W2F05865+lOWJ/qGaJ
	/o9hhDWZFStHixL9fHym01V8g7R1DufM0gvVjs7yWH5XgkmwLg7/tQ+d4E1S7FO6cu7uewbTS0W
	v7FQHFoSNbcTjLzt7XjlMdShDtdY8WUc4owbaUHn3No24iKiarcUBPbvNqJ5k+KKr23q8W3gSxL
	8oE+OOSu1i9WOajg==
X-Received: by 2002:a05:6820:8912:b0:70e:78ba:1193 with SMTP id
 006d021491bc7-71917852a66mr2642193eaf.27.1794472428165; Thu, 12 Nov 2026
 00:33:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109100437.331423-1-amaan.cheval@gmail.com>
 <20261109100437.331423-2-amaan.cheval@gmail.com> <CALuQH+Uee+=2NyhCXVmmESwXxSqDYKY3Foj70KM2qY6g5UsOXw@mail.gmail.com>
In-Reply-To: <CALuQH+Uee+=2NyhCXVmmESwXxSqDYKY3Foj70KM2qY6g5UsOXw@mail.gmail.com>
From: Amaan Cheval <amaan.cheval@gmail.com>
Date: Thu, 12 Nov 2026 14:03:36 +0530
X-Gm-Features: AclHuK8jw0nrbYX6MTsSZqQlwj6_5UHh4mClUVm7LQtL7_VDZNXktjTz3rcpg6s
Message-ID: <CAG+wEg1fWbnaWmEBeCA0RcwYvMDrAcacX4qCO++bsNK98FS=Vw@mail.gmail.com>
Subject: Re: [PATCH net v5 1/2] gve: refuse XDP on queue formats without XDP support
To: Joshua Washington <joshwash@google.com>
Cc: netdev@vger.kernel.org, hramamurthy@google.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	bcf@google.com, jordanrhee@google.com, przemyslaw.kitszel@intel.com, 
	maciej.fijalkowski@intel.com, pkaligineedi@google.com, maolson@google.com, 
	csully@google.com, willemb@google.com, yangchun@google.com, npl@google.com, 
	awogbemila@google.com, shailend@google.com, nktgrg@google.com, 
	maxyuan@google.com, bpf@vger.kernel.org, john.fastabend@gmail.com, 
	hawk@kernel.org, sdf@fomichev.me, daniel@iogearbox.net, ast@kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 1:16=E2=80=AFAM Joshua Washington <joshwash@google.=
com> wrote:
>
> On Mon, Nov 9, 2026 at 2:05=E2=80=AFAM Amaan Cheval <amaan.cheval@gmail.c=
om> wrote:
> >
> > Commit d8a8ca14c937 ("gve: add XDP_TX and XDP_REDIRECT support for DQ
> > RDA") enabled XDP on DQO-RDA by dropping the queue_format check from
> > verify_xdp_configuration(), which until then refused every format but
> > GQI-QPL. Nothing replaced it: gve_set_netdev_xdp_features() advertises
> > no XDP features for DQO-QPL and gve_xdp_xmit() rejects it, but the core
> > only checks that ndo_bpf exists, so a native XDP program, and an AF_XDP
> > socket on top of it, can still be attached on a queue format the driver
> > does not support.
> >
> > The DQO-QPL RX path was never written for that. Its page accounting
> > assumes the driver keeps a reference of its own across every handoff:
> > gve_xdp_done_dqo() passes the buffer to xdp_do_redirect() and then
> > recycles it with gve_reuse_buffer(), so a redirect target that releases
> > the buffer synchronously, such as an AF_XDP socket in copy mode, can
> > drop the page's last reference when pagecnt_bias runs out. The page is
> > then freed while it is still DMA-mapped and registered in the QPL, and
> > the driver posts it back to the device.
> >
> > Refuse XDP setup in gve_verify_xdp_configuration() whenever the driver
> > advertises no XDP features for the current queue format, which today
> > means DQO-QPL. A zero-copy XSK pool bind is already refused by the core
> > for the same reason, and a copy-mode bind never reaches the driver and
> > is harmless without a program.
> >
> > Fixes: d8a8ca14c937 ("gve: add XDP_TX and XDP_REDIRECT support for DQ R=
DA")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Amaan Cheval <amaan.cheval@gmail.com>
> Reviewed-by: Joshua Washington <joshwash@google.com>

Thank you for the review and guidance!


>
> > ---
> > v5:
> >  - Check dev->xdp_features instead of queue_format, and reword the
> >    subject and message around that (Joshua).
> > v4: https://lore.kernel.org/netdev/20261106114551.212675-2-amaan.cheval=
@gmail.com/
> >
> >  drivers/net/ethernet/google/gve/gve_main.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/e=
thernet/google/gve/gve_main.c
> > index 2437cd8ba633..fe560f5c5408 100644
> > --- a/drivers/net/ethernet/google/gve/gve_main.c
> > +++ b/drivers/net/ethernet/google/gve/gve_main.c
> > @@ -1723,6 +1723,12 @@ static int gve_verify_xdp_configuration(struct n=
et_device *dev,
> >         struct gve_priv *priv =3D netdev_priv(dev);
> >         u16 max_xdp_mtu;
> >
> > +       if (!(dev->xdp_features & NETDEV_XDP_ACT_BASIC)) {
> > +               NL_SET_ERR_MSG_MOD(extack,
> > +                                  "XDP is not supported on this queue =
format.");
> > +               return -EOPNOTSUPP;
> > +       }
> > +
> >         if (dev->features & NETIF_F_GRO_HW) {
> >                 NL_SET_ERR_MSG_MOD(extack,
> >                                    "XDP is not supported when HW-GRO is=
 on.");
> > --
> > 2.47.3
> >
>
> Thanks!
