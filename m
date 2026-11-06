Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793996473;
	b=PQzL191EYJjDb2jp7X/Aqfb+6EQEuBOBBKHf/A2jzAGbu3rMQ088d6dDcYypVXO5Toow
	 7zuAcJf4pyhWW0gEKwSVEL/mOHZN+/mlGahyGT9JB/jDA1yt4c1P40/w/R9qntZHlnDN8
	 /gdjWqYJwa5xgahemte4NkQlzx7nxGWEjFh/fedEQ92WBRnGSR0XVk/deNmOhuzgWdjq9
	 tkHYKLgxFvp5PNbsAK7uCWOOA/3cENlbJE0xaAtClviXaqMguRUB3KRBA7kOcreDKFu77
	 BZeAGiLTPjvvCYLEo6r5Lf4plTsAxW+Mx7E090k5G1NewFHN/GGR8ziSMQLMJJjANNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793996473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=959BkSk1iLBff7LPQ529CGwQXCG+nKTMirz/dSsXx4M=;
	b=ZVg9LBQdWNE0eMNOn7GAKzDCdpm5YHTwNnb1Hr1aAMMxyeXkFyZgM8ebGK5woQdT7lZd
	 hdjtV++zodVh3OvbLyJMIDWMciCPmk4PFzEwBC3xUF7DIIx7R8b6+ApR4UH8eqbGPLhX4
	 VDqcB4cWyXBGbcxex2xkFzFFud4jPmc2pfzH0548SpjIX86xhH0uCOPayxYG3QRmlHm7p
	 jeCD80jiPKAI1LwFnkYsOlc2x90zby7pCp1aaJInlvKqxegQQUIbSmc4kwsrdkCEh7sg7
	 RVgDD4SKAcMS5Kd845hNDIwfRmBNXYcIJaLMCg1HyqYB2f9bswYkDWEnv9/I+9xJ3Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t7A85JKW;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3AE606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B3AE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t7A85JKW
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so464130e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793996472; x=1794601272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=959BkSk1iLBff7LPQ529CGwQXCG+nKTMirz/dSsXx4M=;
        b=t7A85JKWAHrwaV2NDDfjT6j94ns+4EQEuPbv6LjFm7Pl1Lq4iltZ//g0XKX+q79+hx
         9q4moiD2bLg2DnqtWQUuNXYnHVUOfOemr6W4aUjyfb8NwusIHAslcfZa8bHiom3Ew25S
         hzUkpSMiwUeO2EPhCuazssJ9d4RghqllVytbdCYnn8l0YMOPONm+oLnrKHVRtzNSMdQC
         9dPBo48IrA2GGXXArP3NC8uXSev5XR5WKY4P8NpmCUPikQkoheTEuJWtPyORYzhbOn0g
         Ybxy9vdd3d64pI2qocDhbC3zSBnZaIYr5XM2S+Ee+11Eghs/Kvtrn2Vk/yWrT5LKYAb9
         PQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793996472; x=1794601272;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=959BkSk1iLBff7LPQ529CGwQXCG+nKTMirz/dSsXx4M=;
        b=Zi31kO627ZooaAOfdyBFPdQY57nSTkobqRi7QYk+j6MzGpmni53INQlcBNtLJRvEok
         yejcQAYExJXJYI4atdkxw6nTUakHtPQ3ZGnuQrMbvsWIHmQzGpznzbcUfHAOc2n7lpLR
         mW0aG79IAD+r9U26++4WWpop9edtf3QpPSNVipBdHecXOxU1FzwLrYaB4G4kxU9IaWN9
         Ie+FcmyvrbLop2fGRzEYpGm4M8bJH8e0YmcKu9E659HedIGooG9HbFLmI878iFGuJxes
         vABawXXPhoyN8WFJThdQ7ACNdpy/o5i/r6ilpb24YKvSH+163cdYQ1ptQEheNEaHE9MH
         kl7A==
X-Forwarded-Encrypted: i=1; AL+hErGyrcWDFVLLVXoStey3BCDQbf6rNCucjRLwJH3PKUWnAzcWTcRMSo5GXKTwOIfBNmbPCph+5zvrLqMG9/g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9M5yIC9hDh3iUtlvN6BI8fsNRTXwgb1bmOKjoBM6CWP1QWodGL
	Fyor1RQWZw3FETPYcmlKaU2z8oAxh64A4q42pZ7pMLmnjU4C6LMl1eyh
X-Gm-Gg: AYBFou1g8SCCit0M3MvssmRXDklHA6qAlZCByVgBWJQPRVAIDT9Blcz4Y4J8iC3F5Tq
	mBlhzTcM9KpT4qOH0J0w0YB8YgxdNDEBhBqI74FCbJs8OiQ1yjotRhXf2cWqmjFqbkiDCdbQIXE
	R68T5j8ulcUNYWOl2idMzfGZmXddg95dNTlwknDkW+rRGtYZ0d5F5Y3R3itPsCptwlGD20j87dg
	uaJeioMC4C7G+9XtCQObPEA2ycYq1nGNgByfw76EkNam28A3l7WO3T9M7KBnf/X+4aW2N67DaG9
	wOAzJC0uuUXoO9Ie67vq8qmWm1oVCBk6rUSanUvhVgPzez01uQgGf+ESNCFUfCpU2ZhEZcPtV/D
	IW82CiP2VN1kEe0L88AlWs4zLWOQfjVfaMtUNOTDmPoRBwuhWj51DeARGfp0qdiXLkaeLgrWOjg
	Vmg98MP6mUo/oaQjv9IRTXx+dcqm/po774z1lr/1DSKcjyZR0svmUDbVqNXzlI3Fbu5NTCl8vh0
	JNTRKgHwXWO0JHNtXwdy3Y41EVMg1szyUwWd2IOF9TyzE5wHKqXOEED7qj2dKoVTM/c56RfKcIo
	IyEDfBl9NWvaFrKJN5jOq+cfO/4Jo0pcRyU3WfqTgTuyBhXwvk8hBMmSJpGOitKt9+4iSFZTepS
	YKamMQWb6KPjtcYtZHG+m77+5G7sTOyHM8Zqh4RrlLTTyGKOGT8jv2W7OSKKwpjWyxaWYmrw=
X-Received: by 2002:a05:6123:106:b0:5ea:b04a:cefd with SMTP id 71dfb90a1353d-5ecc43bb994mr1885195e0c.7.1793996472087;
        Fri, 06 Nov 2026 12:21:12 -0800 (PST)
Received: from gmail.com (223.230.150.34.bc.googleusercontent.com. [34.150.230.223])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecc614d650sm2184819e0c.0.2026.11.06.12.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:21:11 -0800 (PST)
Date: Fri, 06 Nov 2026 15:21:10 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Willem de Bruijn <willemb@google.com>, 
 Kalpesh Solanki <skalpesh942@gmail.com>
Cc: willemdebruijn.kernel@gmail.com, 
 jasowangio@gmail.com, 
 alex.aring@gmail.com, 
 stefan@datenfreihafen.org, 
 miquel.raynal@bootlin.com, 
 andrew+netdev@lunn.ch, 
 davem@davemloft.net, 
 edumazet@kernel.org, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 linux-wpan@vger.kernel.org, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com
Message-ID: <willemdebruijn.kernel.2cb4407542f65@gmail.com>
In-Reply-To: <CA+FuTSfzzoJN+wsVekOWcn18RKKYgp5AqCOpxh4taG=YAOQ9kg@mail.gmail.com>
References: <20261101092219.1278751-1-skalpesh942@gmail.com>
 <20261106142421.17793-1-skalpesh942@gmail.com>
 <CA+FuTSfzzoJN+wsVekOWcn18RKKYgp5AqCOpxh4taG=YAOQ9kg@mail.gmail.com>
Subject: Re: [PATCH net v2] tun: disallow setting IEEE 802.15.4 link types via
 TUNSETLINK
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Willem de Bruijn wrote:
> On Fri, Nov 6, 2026 at 9:32=E2=80=AFAM Kalpesh Solanki <skalpesh942@gma=
il.com> wrote:
> >
> > A userspace application can set the link type of a TUN/TAP interface
> > to ARPHRD_IEEE802154 or ARPHRD_IEEE802154_MONITOR via ioctl(fd,
> > TUNSETLINK, arg) because tun_get_addr_len() explicitly recognized
> > these types.
> >
> > However, TUN devices cannot function as IEEE 802.15.4 radios (they
> > lack wpan_phy, channels, PAN IDs, and MLME operations), and tun
> > never initializes dev->ieee802154_ptr or dev->ml_priv.
> >
> > The IEEE 802.15.4 subsystem operates on the invariant that any
> > net_device with dev->type =3D=3D ARPHRD_IEEE802154 is a genuine WPAN =
device
> > with a valid dev->ieee802154_ptr context. When an unprivileged user
> > creates a TUN interface in a user+net namespace, changes its link typ=
e
> > to ARPHRD_IEEE802154, and issues a netlink dump request (such as
> > IEEE802154_LLSEC_LIST_KEY), ieee802154_llsec_dump_table()
> > unconditionally dereferences dev->ieee802154_ptr /
> > ieee802154_mlme_ops(dev), triggering a supervisor null-pointer

Apparently a similar issue affects ARPHRD_6LOWPAN.

> > dereference / general protection fault. Similar dereferences occur
> > across net/ieee802154/nl-phy.c (ieee802154_del_iface) and
> > net/ieee802154/socket.c.
> >
> > Rather than scattering NULL checks across every site in net/ieee80215=
4/,
> > fix the issue at the source: validate that arg fits within unsigned s=
hort
> > (rejecting arg > USHRT_MAX to prevent upper-bit truncation), disallow=

> > setting ARPHRD_IEEE802154 and ARPHRD_IEEE802154_MONITOR via TUNSETLIN=
K
> > by returning -EINVAL, and remove these unsupported types from
> > tun_get_addr_len() along with the unused <linux/ieee802154.h> include=
.
> =

> I don't think we can do this.

One exception is if this has never worked. If this was a NULL ptr
exception from the start, then clearly no userspace can depend on it.
 =

> TUNSETLINK is a weird quirk. It never intended to fully change the link=

> layer. IFF_TAP still only supports Ethernet (calls eth_type_trans).
> =

> It was added in commit ff4cc3ac93e1 ("[TUNTAP]: Allow setting the linkt=
ype
> of the tap device from userspace"), seemingly exactly to be able to pro=
cess
> other protocols.
> =

> Kismet would write captured 802.11 frames into a tap. The device would =
be
> labelled ARPHRD_IEEE80211* so that tcpdump or wireshark interface would=

> see the "right" link type for processing.
> =

> > Fixes: cca8ea3b05c9 ("net: tun: set tun->dev->addr_len during TUNSETL=
INK processing")
> > Reported-by: syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D9ea34da5ca6100593c9=
0
> > Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
> > ---
> > v1 -> v2:
> > - Instead of adding NULL checks in net/ieee802154/nl-mac.c, disallow =
setting
> >   ARPHRD_IEEE802154 and ARPHRD_IEEE802154_MONITOR link types via TUNS=
ETLINK in
> >   drivers/net/tun.c, as discussed with Andrew Lunn and identified in =
Sashiko
> >   bot review. Virtual IEEE 802.15.4 interfaces are properly provided =
by
> >   mac802154_hwsim and fakelb; TUN devices cannot function as genuine =
802.15.4
> >   radios and lack private 802.15.4 contexts.
> > - Add an explicit bounds check (arg > USHRT_MAX) to prevent integer t=
runcation
> >   bypasses when casting 64-bit ioctl arg to 16-bit dev->type.
> > - Remove ARPHRD_IEEE802154 and ARPHRD_IEEE802154_MONITOR from tun_get=
_addr_len()
> >   and drop unused <linux/ieee802154.h> header.
> >
> >  drivers/net/tun.c | 45 ++++++++++++++++++++++++++-------------------=

> >  1 file changed, 26 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/net/tun.c b/drivers/net/tun.c
> > index dcec7311e60..f2915e929e3 100644
> > --- a/drivers/net/tun.c
> > +++ b/drivers/net/tun.c
> > @@ -70,7 +70,6 @@
> >  #include <linux/bpf.h>
> >  #include <linux/bpf_trace.h>
> >  #include <linux/mutex.h>
> > -#include <linux/ieee802154.h>
> >  #include <uapi/linux/if_ltalk.h>
> >  #include <uapi/linux/if_fddi.h>
> >  #include <uapi/linux/if_hippi.h>
> > @@ -3183,9 +3182,6 @@ static unsigned char tun_get_addr_len(unsigned =
short type)
> >                 return 4;
> >         case ARPHRD_ETHER:
> >                 return ETH_ALEN;
> > -       case ARPHRD_IEEE802154:
> > -       case ARPHRD_IEEE802154_MONITOR:
> > -               return IEEE802154_EXTENDED_ADDR_LEN;
> >         case ARPHRD_PHONET_PIPE:
> >         case ARPHRD_PPP:
> >         case ARPHRD_NONE:
> > @@ -3362,22 +3358,33 @@ static long __tun_chr_ioctl(struct file *file=
, unsigned int cmd,
> >                         netif_info(tun, drv, tun->dev,
> >                                    "Linktype set failed because inter=
face is up\n");
> >                         ret =3D -EBUSY;
> > -               } else {
> > -                       ret =3D call_netdevice_notifiers(NETDEV_PRE_T=
YPE_CHANGE,
> > -                                                      tun->dev);
> > -                       ret =3D notifier_to_errno(ret);
> > -                       if (ret) {
> > -                               netif_info(tun, drv, tun->dev,
> > -                                          "Refused to change device =
type\n");
> > -                               break;
> > -                       }
> > -                       tun->dev->type =3D (int) arg;
> > -                       tun->dev->addr_len =3D tun_get_addr_len(tun->=
dev->type);
> > -                       netif_info(tun, drv, tun->dev, "linktype set =
to %d\n",
> > -                                  tun->dev->type);
> > -                       call_netdevice_notifiers(NETDEV_POST_TYPE_CHA=
NGE,
> > -                                                tun->dev);
> > +                       break;
> > +               }
> > +
> > +               if (arg > USHRT_MAX) {
> > +                       ret =3D -EINVAL;
> > +                       break;
> > +               }
> > +
> > +               if (arg =3D=3D ARPHRD_IEEE802154 || arg =3D=3D ARPHRD=
_IEEE802154_MONITOR) {
> > +                       ret =3D -EINVAL;
> > +                       break;
> > +               }
> > +
> > +               ret =3D call_netdevice_notifiers(NETDEV_PRE_TYPE_CHAN=
GE,
> > +                                              tun->dev);
> > +               ret =3D notifier_to_errno(ret);
> > +               if (ret) {
> > +                       netif_info(tun, drv, tun->dev,
> > +                                  "Refused to change device type\n")=
;
> > +                       break;
> >                 }
> > +               tun->dev->type =3D (unsigned short)arg;
> > +               tun->dev->addr_len =3D tun_get_addr_len(tun->dev->typ=
e);
> > +               netif_info(tun, drv, tun->dev, "linktype set to %d\n"=
,
> > +                          tun->dev->type);
> > +               call_netdevice_notifiers(NETDEV_POST_TYPE_CHANGE,
> > +                                        tun->dev);

If blocking this proves safe, prefer as little unrelated code churn as
possible.

> >                 break;
> >
> >         case TUNSETDEBUG:
> > --
> > 2.53.0
> >
> >


