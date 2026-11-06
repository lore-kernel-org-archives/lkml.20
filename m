Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793984075;
	b=wYVBG55KCMjP9RuiSz30r1UYfL+OWBuTNsMt+LNVHQrZhKpG2LPjR8ZkIeJKrsL4Cqc2
	 3zJ2t7qo6Fpyh86JTsJw05BrYI8XPLUfN5S2g8unKPAF6g49ejm5pOWD5jF3f62MEWZug
	 3j+uR5ZOpTt7L0YV9KHZKAuvVdxL04BHgI904MsWqusxyRR6Ol0a3QQOknbRYwlelakBD
	 kOt9n7G1wsF/On2/TggbH90bHe/J4wKPzyuVHJ4Soz6r4PzvPk5QUDryXV4OwSV0sBrQu
	 LBA3pjquUKOaBhYKfarnkhAyaPMagk/6JPMVSv7G8ad70WgUGbKKR+drS76a6qqFteA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dkFzuHJuzHv5RFwHabaXe83i/n2wBUC3b7ZSZTt+kHU=;
	b=QQmT+RxdocQemrB9EYKa53giJ7wiyVw9bzqIJzSsMatJkft0ZAoFl3PEYhC6fiESX6AN
	 1ZQGlm+CMfbn/WbTabnSktO1KhdNn5PfDJpGr80zslL32Ze0n/0pzoJMMvrKHUr28lcf6
	 GFzla4KO/C2zNzN+8PJguB771FBzVla+5BeMQ2qMXtJegtWJueb2R0+aFHe7dbo+i4DTC
	 TXzrwemMZtpoG4DLtXjzo3Uhaeig/2Iyq+zIAUBMg1CWMUMjuA9444Ca8Pz1VExDVfuQN
	 K8x0yUMSAzGlkLStuvsyqjGUzH55xHiLZ38fySe+xoQSucB7mJ2Y3//bQWdLVPM8IMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZZ+ztJPy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547FF606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 547FF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZZ+ztJPy
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so868849e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:54:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793984072; cv=none;
        d=google.com; s=arc-20260327;
        b=lWGbpNgUDfhe+ovVMq4jJQnP4/25qvFiLBlPEW56eHn4eBKv3wrWPl3ZHmmsJjfRgD
         kOrfarV5GKJ5uTIEB53bd3SqQuJWG5wbGMIvfasmzkCk7DLRfYePUBIw4zv1iRzB/4A9
         8pgavRoU8DTD/UfWCWl7inmGP4IXitOvNlUxI1icpNXnp6OBugxx5Hvpt2tYlVrtOo2b
         qFtzfuCOLmIPaf//JvnKeZMWu21OqdobLP4A5qpwmRJ36iQCBJU1LXyM4SB3vu7GxX1A
         tyK/hVYDMKc4WRy0RNNFYZt5+u6RsT0nxUXhNEC6I77lFoEW7iNofZGv+aoHhQ+2+tSs
         Kf7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dkFzuHJuzHv5RFwHabaXe83i/n2wBUC3b7ZSZTt+kHU=;
        fh=Ba4Q9+bYsk3NdnUJXwrpSotZoc3Q0emr69m7UlNLRko=;
        b=Pvevj7v5WR7f5sHzWDFxR3FgXHT5Hp8tzmq/aQZrHwc9/4pXD422lmfj4rSuGBoGXM
         UBY2fLMoqRydKuTu9wZ8ApHme7OYI4OIvJ46g8XzjUUDtH5W9wFC+9U2Q4qLSmpPGmPJ
         kHhOfxqO/ns8T0Ty9LeSRV4ZJ+zvKSBNAiGFyg3cRo7reuhA2R3CixoRqxiG6wDK1Y+i
         iPFQDQSb4tjvp+I1qBT5REB7LN8ZNFGwTNXNNVF1NwYsslvtqYuscjo4+cCrqFdxdy9S
         wj3AFdiGQsBl6I1TQoo+lfDfg5KAurT1Az82DZReMtyhjWH7wkwOMF2dB+mxuzMQ4KR7
         5CmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793984072; x=1794588872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dkFzuHJuzHv5RFwHabaXe83i/n2wBUC3b7ZSZTt+kHU=;
        b=ZZ+ztJPybuGEZDjDgu29EnZYCNLMrx4Qz1zhAInaF2quJFv+yTeOBJR5AcJy4dV6FG
         DArFOitNv+XL0urRRS7nw8DyBASOAfCylSm5S3BraKZ6ZlyNoITijzVDXZAJf1qr8RuG
         A2umrMt2opRiqasRjGPe3srtriCn1cAdYRz+qMHy0XttlZqHLvVqbs2CWwgAFxkXHWtJ
         Mx9x9X9vkX339h/aZilD3laE+ec6c7hw29LPbLcQUVpz24Xcx5ncgtNZMrLAkFuATTHS
         xLCJUuBcIE55Z4gSObocZC+ZeUnyXeXY6Dj2D3CHoXu0cOMKM3TdbMOEkf0RQMOWm+cj
         gYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984072; x=1794588872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dkFzuHJuzHv5RFwHabaXe83i/n2wBUC3b7ZSZTt+kHU=;
        b=qpdel/A4D3IHE++RJIemHpTSnj/jS0JJk1E6u7A9WAZ+7PzVgQEOBBgqWR1FmbHgzz
         rxDhUWT19fjqk+Hk6h9fapcs/wW+4BBNamdK9KLiyjXqya7xjO8HEspG0WvznJaZVFDp
         h+2FOLPGXLOPS9Uk7hx4jLf5W48Z9bOhw2kESsU2fqsUcze6eoW/hpxo04OTvv7i/0w+
         qICzcaTHxTGRx+XZL3e0bvNug8y7Ad0OdyRzmWQCFk77VU9JIoD+78ORAiPTWIHOnRxU
         hZguJU+GJcOUceL1s5S1KbdDGSw81+0qc+/T5Nhji4hYJrOM3Lhc0MwrsbnOKiPrk9DG
         wIAQ==
X-Forwarded-Encrypted: i=1; AL+hErFWNgQ7aA5t401D4qt3hPEhPRl3F0ORJ/f4cdbDFHNSUEds+xwDBzNHsrjcHlaa5QrIh592UBPvKtodo2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z94UPszPF3XF8N17oyXu5dn1cRl8OkNxIHmtc5gW8GlTsUodrGO
	Jz5XeKurJ8CBcb5aBatyIX6yCWs+5l0dmN4oJ6fWAXAggriIKW5yvRd1YVSTojUAwFj0acv8o6M
	RAHL0pWUnP65EELChxJ28TLXre/1e0RQZx/8yuwjt
X-Gm-Gg: AYBFou3ujVs1mXnojYbr0rA0SoKePByjI4XdRalV91TGUa2AOyqG6fNbJWtUcQvmC5u
	SOgOmwajkIYzxgNT0320Nahn0SVfXikJvS8So5zu2TQwj7K1r9gc/RuVhBtw/g0uvuYehTro+3b
	GBi07HkpKgK0xcsEvUsrvu1INe7DG3Y52a5UFHgoayr0g61l2/4PJfk0Kqt7LSrGnx1ClZZU7D3
	7bcKcFpYSxyRxfOGsh25PdllI/G/j0LPiZmAD1uvjXhpZ+9ASvNf8ssAHUHReiyqoaWBdU5yA25
	0EYf134yXbzQS4PdxcIlJyILKv81aYjU/yTVSJfJQPZezLyTNVGDYZpos18te4wJu0aE+RU4x1p
	MHeNSpV0Mp69ZBLW2ErT7LXjm8Knx2rIAt7/srpP7ly2Nz//Zrlsi2/e9VWM772X+Q6B6ksbc6d
	pDGfqJwvlmBRickdMJGXebY6Q/QmzNLEEJf6O3oXuJzQdMJRZVrkbjfRneZfozSNheTC545XFpY
	jarYLbWjXBFUHm/
X-Received: by 2002:a05:6512:b1e:b0:5be:3720:1393 with SMTP id
 2adb3069b0e04-5c003adf778mr1037616e87.51.1793984072100; Fri, 06 Nov 2026
 08:54:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101092219.1278751-1-skalpesh942@gmail.com> <20261106142421.17793-1-skalpesh942@gmail.com>
In-Reply-To: <20261106142421.17793-1-skalpesh942@gmail.com>
From: Willem de Bruijn <willemb@google.com>
Date: Fri, 6 Nov 2026 11:53:53 -0500
X-Gm-Features: AclHuK_c_DfsmI33CCc1Uir_OkECB369Wp3N4hEOCBGMuQ9y0dY5VqQSiKnHFFY
Message-ID: <CA+FuTSfzzoJN+wsVekOWcn18RKKYgp5AqCOpxh4taG=YAOQ9kg@mail.gmail.com>
Subject: Re: [PATCH net v2] tun: disallow setting IEEE 802.15.4 link types via TUNSETLINK
To: Kalpesh Solanki <skalpesh942@gmail.com>
Cc: willemdebruijn.kernel@gmail.com, jasowangio@gmail.com, 
	alex.aring@gmail.com, stefan@datenfreihafen.org, miquel.raynal@bootlin.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, linux-wpan@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 9:32=E2=80=AFAM Kalpesh Solanki <skalpesh942@gmail.c=
om> wrote:
>
> A userspace application can set the link type of a TUN/TAP interface
> to ARPHRD_IEEE802154 or ARPHRD_IEEE802154_MONITOR via ioctl(fd,
> TUNSETLINK, arg) because tun_get_addr_len() explicitly recognized
> these types.
>
> However, TUN devices cannot function as IEEE 802.15.4 radios (they
> lack wpan_phy, channels, PAN IDs, and MLME operations), and tun
> never initializes dev->ieee802154_ptr or dev->ml_priv.
>
> The IEEE 802.15.4 subsystem operates on the invariant that any
> net_device with dev->type =3D=3D ARPHRD_IEEE802154 is a genuine WPAN devi=
ce
> with a valid dev->ieee802154_ptr context. When an unprivileged user
> creates a TUN interface in a user+net namespace, changes its link type
> to ARPHRD_IEEE802154, and issues a netlink dump request (such as
> IEEE802154_LLSEC_LIST_KEY), ieee802154_llsec_dump_table()
> unconditionally dereferences dev->ieee802154_ptr /
> ieee802154_mlme_ops(dev), triggering a supervisor null-pointer
> dereference / general protection fault. Similar dereferences occur
> across net/ieee802154/nl-phy.c (ieee802154_del_iface) and
> net/ieee802154/socket.c.
>
> Rather than scattering NULL checks across every site in net/ieee802154/,
> fix the issue at the source: validate that arg fits within unsigned short
> (rejecting arg > USHRT_MAX to prevent upper-bit truncation), disallow
> setting ARPHRD_IEEE802154 and ARPHRD_IEEE802154_MONITOR via TUNSETLINK
> by returning -EINVAL, and remove these unsupported types from
> tun_get_addr_len() along with the unused <linux/ieee802154.h> include.

I don't think we can do this.

TUNSETLINK is a weird quirk. It never intended to fully change the link
layer. IFF_TAP still only supports Ethernet (calls eth_type_trans).

It was added in commit ff4cc3ac93e1 ("[TUNTAP]: Allow setting the linktype
of the tap device from userspace"), seemingly exactly to be able to process
other protocols.

Kismet would write captured 802.11 frames into a tap. The device would be
labelled ARPHRD_IEEE80211* so that tcpdump or wireshark interface would
see the "right" link type for processing.

> Fixes: cca8ea3b05c9 ("net: tun: set tun->dev->addr_len during TUNSETLINK =
processing")
> Reported-by: syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D9ea34da5ca6100593c90
> Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
> ---
> v1 -> v2:
> - Instead of adding NULL checks in net/ieee802154/nl-mac.c, disallow sett=
ing
>   ARPHRD_IEEE802154 and ARPHRD_IEEE802154_MONITOR link types via TUNSETLI=
NK in
>   drivers/net/tun.c, as discussed with Andrew Lunn and identified in Sash=
iko
>   bot review. Virtual IEEE 802.15.4 interfaces are properly provided by
>   mac802154_hwsim and fakelb; TUN devices cannot function as genuine 802.=
15.4
>   radios and lack private 802.15.4 contexts.
> - Add an explicit bounds check (arg > USHRT_MAX) to prevent integer trunc=
ation
>   bypasses when casting 64-bit ioctl arg to 16-bit dev->type.
> - Remove ARPHRD_IEEE802154 and ARPHRD_IEEE802154_MONITOR from tun_get_add=
r_len()
>   and drop unused <linux/ieee802154.h> header.
>
>  drivers/net/tun.c | 45 ++++++++++++++++++++++++++-------------------
>  1 file changed, 26 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/net/tun.c b/drivers/net/tun.c
> index dcec7311e60..f2915e929e3 100644
> --- a/drivers/net/tun.c
> +++ b/drivers/net/tun.c
> @@ -70,7 +70,6 @@
>  #include <linux/bpf.h>
>  #include <linux/bpf_trace.h>
>  #include <linux/mutex.h>
> -#include <linux/ieee802154.h>
>  #include <uapi/linux/if_ltalk.h>
>  #include <uapi/linux/if_fddi.h>
>  #include <uapi/linux/if_hippi.h>
> @@ -3183,9 +3182,6 @@ static unsigned char tun_get_addr_len(unsigned shor=
t type)
>                 return 4;
>         case ARPHRD_ETHER:
>                 return ETH_ALEN;
> -       case ARPHRD_IEEE802154:
> -       case ARPHRD_IEEE802154_MONITOR:
> -               return IEEE802154_EXTENDED_ADDR_LEN;
>         case ARPHRD_PHONET_PIPE:
>         case ARPHRD_PPP:
>         case ARPHRD_NONE:
> @@ -3362,22 +3358,33 @@ static long __tun_chr_ioctl(struct file *file, un=
signed int cmd,
>                         netif_info(tun, drv, tun->dev,
>                                    "Linktype set failed because interface=
 is up\n");
>                         ret =3D -EBUSY;
> -               } else {
> -                       ret =3D call_netdevice_notifiers(NETDEV_PRE_TYPE_=
CHANGE,
> -                                                      tun->dev);
> -                       ret =3D notifier_to_errno(ret);
> -                       if (ret) {
> -                               netif_info(tun, drv, tun->dev,
> -                                          "Refused to change device type=
\n");
> -                               break;
> -                       }
> -                       tun->dev->type =3D (int) arg;
> -                       tun->dev->addr_len =3D tun_get_addr_len(tun->dev-=
>type);
> -                       netif_info(tun, drv, tun->dev, "linktype set to %=
d\n",
> -                                  tun->dev->type);
> -                       call_netdevice_notifiers(NETDEV_POST_TYPE_CHANGE,
> -                                                tun->dev);
> +                       break;
> +               }
> +
> +               if (arg > USHRT_MAX) {
> +                       ret =3D -EINVAL;
> +                       break;
> +               }
> +
> +               if (arg =3D=3D ARPHRD_IEEE802154 || arg =3D=3D ARPHRD_IEE=
E802154_MONITOR) {
> +                       ret =3D -EINVAL;
> +                       break;
> +               }
> +
> +               ret =3D call_netdevice_notifiers(NETDEV_PRE_TYPE_CHANGE,
> +                                              tun->dev);
> +               ret =3D notifier_to_errno(ret);
> +               if (ret) {
> +                       netif_info(tun, drv, tun->dev,
> +                                  "Refused to change device type\n");
> +                       break;
>                 }
> +               tun->dev->type =3D (unsigned short)arg;
> +               tun->dev->addr_len =3D tun_get_addr_len(tun->dev->type);
> +               netif_info(tun, drv, tun->dev, "linktype set to %d\n",
> +                          tun->dev->type);
> +               call_netdevice_notifiers(NETDEV_POST_TYPE_CHANGE,
> +                                        tun->dev);
>                 break;
>
>         case TUNSETDEBUG:
> --
> 2.53.0
>
>
