Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21D1347533
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787903222; cv=pass; b=JcaAORjc3JojsiMi2ZFpfs8k9aXRZGr6K+av2PbrYJ6URbqHCWwUVv2jMS7uZLCm/qfO6oIFBRAMNwlF8DFBeoZ/PE06qB9VFOSZQsBs5TxoLjjNEkYQ+oAlVQnXiz+d1whYG+6CUr4B2RXhfhIl0uK0bvR2wf3KoWCJhtld+JE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787903222; c=relaxed/simple;
	bh=3GG5nCWl7CWNpEuPnh5H8CvcMn1R+QCVr+rkkOznzJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wm1eAUeD/ZTgH9irXGbhTo4e6P0B45qj/BiRCH5NG45b98r8UzLoLyvm9/+iTRQnX8p5CH1xsLwn1uhP/ysAqZmWBbfnE3gWGI7k/xubI5plw2hxfbxFOO2QzVC3XQb8gpgcNH3MYhFi/nxbEg85tkkjUdO+ad3rEDOtCWuleQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jVkasdu/; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jVkasdu/"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-52f2577ac01so5169511cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 00:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787903218; cv=none;
        d=google.com; s=arc-20260327;
        b=pIsSjC1w5bOQzE+CMS3dccsDnbP+Pf9+8woMUIde+A5V9OEVGFRaLxD56kwgVMwF8G
         eXYSrBJYhhFzixFH/E6GsQRXsKaAwFbdcr13BAYzpPMiQvWwoZLmAcNWYQVHPVUoH/T2
         kY//XF2XUh6BaZjk9ZR8meSLWRt07/X/3fMLufyR256VNqTskueMqTiEA8t1YQI2mpvg
         f5h2elk7hLbtEf4KMHMOix3T06XOgKU4EeRt0GFjfFgnDrC9Lhnxk86iBuOK3JcPfcKM
         wSJrhV5LwUNE94BoHDnczucqjv1kbkri7/kcqRzXuB7yQa5+/DrmJzz58MWPH159PV1G
         orSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AbXs5Y0cN9WnX4kVJwxocnUX7LwdYJ30DpFpjvFGAsA=;
        fh=rah/aF97pAuiNo7P+mJsblNYfQWhNxY18jPKbPsNntE=;
        b=mXSCsl3v7b55Kf5NJ1DYzuww2Q70/pY1sstkXbggz/6qvqJLX3ieUW1jpweVzSB066
         ptbqsK0Yx4BZ5eNxlxLMjGosYIAZb7BAygsmcBWQymDHPU5szUX/gHKI82JQ+05dyVSg
         k7huSF50DF12xEPhUPvwFf/yyVAmIVQDcFaIBrACjyNbI28qIBg0u68Ja5tZxaWVQd/o
         vLjJwEZcVG8phnMGgH2ff7Eb26b9hdmzR1Khzg2bhuVQXJo+h44B6K7wWM8L6IGM9FD+
         ZD7MeK7OOeSS8Hn0z+u7zsqLb9QZIk8uQFrSYNAXR2Xn2b4Nh5nogvQsKV3w5q7cgnRa
         u9MQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787903218; x=1788508018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AbXs5Y0cN9WnX4kVJwxocnUX7LwdYJ30DpFpjvFGAsA=;
        b=jVkasdu/PvIGpvmn3EQegG+aKoPXJGRvWh8ViJIKU3z1l8DEMiYbPNntZYWqO5vfRJ
         WuEZHwWEvvgPeGaKgLH7d/V4VFRbiovuprKJ+jn1Xe3FFP1asF7eTQFRsEM0WsQ+kdSL
         HcRCbnCEZtdTTLUjS03vbM6PJQgl9ff+K/JXhBAbLbMGplazYITSeZAchUTaxdexDix8
         a6Hqbi8iVCCgtUuL/Ytq6OtyPJ9gqdK/Ek21iPF5g41rxw4nHj9eohRG9toGg5jECWhi
         XMYbkBOBEnxQkNq/ZlFfDG51iaPwdUHDS+HRbQsKDw0d0N1470MsC5bkJrioG7gIHz3H
         THjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787903218; x=1788508018;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AbXs5Y0cN9WnX4kVJwxocnUX7LwdYJ30DpFpjvFGAsA=;
        b=MeMdeyjZ36tRCWMGvwgq2fcPO+69bYbCXOK75C1cP4JwNkxp1jyePMb+XXIgPHjmf8
         qGEmWXCkjGxxMLi/BFbSNjLWxbohNoyGwhkiJsdL9BDzm90Kr6M9iWisLc1TqBjpbeuL
         THXvZu444i5Y4IjY4SG+D6G6vfggbyNYnBkiUq1dpj0yrr2fQZZi9rz6DJJnyEXO9/aY
         vJvLxXjIBsogVavbqhFXug5/ZGSOqB7PkU0gsDAL6jNh0odY/rjfHDrkWh/Pq5ZFxbL8
         RpBU/I5/+xrPN0XxPI88ab6FxJquJwVisTTQ1RmrleHFqAzDZQif7b+/FxdoPV5qRyHh
         uOpQ==
X-Forwarded-Encrypted: i=1; AHgh+RrdUoa//9e3Ipw9dxrKqaDfmcRpZGkClHlwTP1DRX/V44u/UzPPTtg0NBbC9YGlGGwA4Ij5VopKzLtMoBg=@vger.kernel.org
X-Gm-Message-State: AFuF++kqwS8N9dBMLLGsYxGvRPb1ubzfeQVQf7B2vUwo7c1CuBlhFJvK
	cIjdlG0O9m0yQUtwdq8SX2fBuQsgC8aqtYby5rMrSdZ9gJrOlj/GSvCQ1EZHcPlaJFdSvGTc5H2
	cljtBO2WxAGQyQBT8ZeUuWx8lCcYN7EKgGEG5oir+DX2zP0+pIVyEFdeez38=
X-Gm-Gg: AR+sD10wpceZz49OqxyIYtZlZq6NNEKD69Calg99RibA6/pN25c4pvsbi1lgdpxczg/
	LIRd2jzEqHASPXD06MRIiJLhFIg25Qc1ABwW9l9tNWPDzWtn42p2VfKsL+Gusk08FaiyGlyt2/p
	spmEknQxqmAQHCicIfvQ7BjEFwhxCKccn9fyUDg+J4OjgCDsATQPMbPxNEpb6klx8MGKX1Debh5
	lpx8PqwsFp2uriPGyUZ/stwLRbU4rWwuxC0fY35KX0qJ8ghg6tnTSys63jQxJkkyc/eMYzUkEPA
	dIspFrikJkm2CM4JX4ByJ/lY2XTZvTYTqK5SfOEkUdIicPYVEj0vK/x2i27hNaClp7GKmGItL8G
	97XP44eEsC3XbOf5NX9zZTzoSFkNMzkEp2jAruYKBuc55LEh+1iCRuO/kIPA=
X-Received: by 2002:a05:622a:22a4:b0:52f:b6cf:9143 with SMTP id
 d75a77b69052e-52fb972a984mr54680621cf.40.1787903217808; Fri, 28 Aug 2026
 00:46:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+0ovChS18paCd=ZE-7j_M-JtFF-N6+A75deKUqJ0Yy7ux=h2Q@mail.gmail.com>
In-Reply-To: <CA+0ovChS18paCd=ZE-7j_M-JtFF-N6+A75deKUqJ0Yy7ux=h2Q@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 28 Aug 2026 09:46:45 +0200
X-Gm-Features: AcwNN1UOB9k5TEE0jJdEjzh_hJz5U_4kim7pOPWMRfNF5Q5U3YnZhx0WKEOSVbY
Message-ID: <CANn89i+rDqRXaOO2FNpX57rbgVERrBsj6=OAoMU00aeejYk27Q@mail.gmail.com>
Subject: Re: [BUG] WARNING in lowpan_compress_addr_64
To: Farhad Alemi <farhad.alemi@berkeley.edu>
Cc: Alexander Aring <alex.aring@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, falemi@asu.edu, 
	linux-bluetooth@vger.kernel.org, linux-wpan@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 9:22=E2=80=AFAM Farhad Alemi <farhad.alemi@berkeley=
.edu> wrote:
>
> Hello,
>
> As part of the kernel research at ASU's SEFCOM
> lab, we hit the crash below. Crash reports can be found here:
>
>   https://github.com/farhad-alemi/public_bug_reports/tree/main/182-warnin=
g-in-lowpan-compress-addr-64/
>
>   WARNING: net/6lowpan/iphc.c:937 at
> lowpan_iphc_compress_802154_lladdr net/6lowpan/iphc.c:937 [inline],
> CPU#0: syz.9.76/13660
>   WARNING: net/6lowpan/iphc.c:937 at
> lowpan_compress_addr_64+0x4be/0x9c0 net/6lowpan/iphc.c:952, CPU#0:
> syz.9.76/13660
>   RIP: 0010:lowpan_compress_addr_64+0x4be/0x9c0 net/6lowpan/iphc.c:952
>   Call Trace:
>    lowpan_compress_addr_64+0x4be/0x9c0 net/6lowpan/iphc.c:952
>    lowpan_header_compress+0xeef/0x1ef0 net/6lowpan/iphc.c:1242
>    lowpan_header net/ieee802154/6lowpan/tx.c:234 [inline]
>    lowpan_xmit+0x4c6/0x1420 net/ieee802154/6lowpan/tx.c:282
>    dev_hard_start_xmit+0x23b/0x620 net/core/dev.c:3904
>    __dev_queue_xmit+0x11e7/0x3250 net/core/dev.c:4870
>    packet_snd net/packet/af_packet.c:3082 [inline]
>    packet_sendmsg+0x3d9b/0x5150 net/packet/af_packet.c:3114
>   Kernel panic - not syncing: kernel: panic_on_warn set ...
>
> Our reproducer.c is available upon request.
>
> Happy to test a patch if that would help.

Thanks for the report.

All these WARN_ON_ONCE() are bogus in modern days (panic_on_warn being
used by fuzzers)
Developers probably used them to catch unexpected packets.
Guess what, fuzzers do exactly that.

Also lowpan_header_create() seems to incorrectly return 0 instead of an err=
or.

Can you try:

diff --git a/net/6lowpan/iphc.c b/net/6lowpan/iphc.c
index 37eaff3f7b6940b73924c38c360adf482d6cceab..dec04f63f1b2599a7291d020e66=
2f4d129333c14
100644
--- a/net/6lowpan/iphc.c
+++ b/net/6lowpan/iphc.c
@@ -180,8 +180,6 @@ lowpan_iphc_uncompress_802154_lladdr(struct
in6_addr *ipaddr,
                                        &addr->short_addr);
                break;
        default:
-               /* should never handled and filtered by 802154 6lowpan */
-               WARN_ON_ONCE(1);
                break;
        }
 }
@@ -820,8 +818,6 @@ lowpan_iphc_compress_ctx_802154_lladdr(const
struct in6_addr *ipaddr,
                        lladdr_compress =3D true;
                break;
        default:
-               /* should never handled and filtered by 802154 6lowpan */
-               WARN_ON_ONCE(1);
                break;
        }

@@ -933,8 +929,6 @@ lowpan_iphc_compress_802154_lladdr(const struct
in6_addr *ipaddr,
                        lladdr_compress =3D true;
                break;
        default:
-               /* should never handled and filtered by 802154 6lowpan */
-               WARN_ON_ONCE(1);
                break;
        }

diff --git a/net/ieee802154/6lowpan/tx.c b/net/ieee802154/6lowpan/tx.c
index 4df76ff50699ede5c187c9cca6f0cc10b19d2123..9bffe01cc448fcb993883748f35=
9cc71b879a729
100644
--- a/net/ieee802154/6lowpan/tx.c
+++ b/net/ieee802154/6lowpan/tx.c
@@ -47,7 +47,7 @@ int lowpan_header_create(struct sk_buff *skb, struct
net_device *ldev,
         * if this package isn't ipv6 one, where should it be routed?
         */
        if (type !=3D ETH_P_IPV6)
-               return 0;
+               return -EINVAL;

        /* intra-pan communication */
        info->saddr.pan_id =3D wpan_dev->pan_id;
