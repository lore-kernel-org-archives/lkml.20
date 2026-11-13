Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794576507;
	b=wjyC/AqAGKZv3tOXQPfFO9KoI+XeJYsajaMzckv6phMsXq6iT9fSH60BT0P9MXzgkW3h
	 SCQqoSQKWujpoKlGXgT7Wj75jZ+EWNTk+pIfrHNFbTIW73cbekPzpq+BQTO2dtfAWW6lE
	 /aMfUWuI9c81r9Fx/LGRnvOVGsQTdIIL5PfVtoBAvx2Cqxs8q/TQ8PlTgszqUexmWQlWA
	 nSeH3g57kfgiK69s1X1Bc+qqXsBOpL6dTmEv6+X4vdP0pP5xa/aVn4NUDqANmyB4+aZ2m
	 g6NTPjbCE0P5DuJHrUw75AW42eqfNSY1tPUxHBTxvDbwqyOEgyp0ABeUUYx74J84BhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=V3E7C6Og+DeChlLLoXpHp4Nxx2su1Pk7XRniQiodBRM=;
	b=Ug/mTLQMSASFzZPShLfh5wULoVPhrSqrynY7zOR7ZDgYxaXFSCi+4CZtq3g3Vgxi3cSc
	 obn/mvGRpuhh09m/Y1oX+u9nZjYHxirzI85Sf0K8hq9OdSd+ORnhEu0+EgYyXkTQX0uQv
	 ZSTMxplCqITzjbNhodflCB+PJbHBTTqj1SwMx3lKwBTktrMGK0joEhI5YqmhPPQXCnK7t
	 Vb0l475Zr85RuA/FcgT/wY0b+acZG6AXxIho1L1kW7fVPBmcyNm9uDsDAboDqLy7l9vW+
	 I995br1N/F5FymdZPf5lN0Jvnz5A+lyD1uQTlPm9zQbohFAQWhUdPwAKhLD3Z0NlvEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=quzZYudL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E0E606B56A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2E0E606B56A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=quzZYudL
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6ddef424972so1580834eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:28:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794576505; cv=none;
        d=google.com; s=arc-20260327;
        b=ck6u+jGifzUTmthfgAKaO7Ytlu42s3HrViVDzwl9lK1uhFyDMSn1+4/+FlN/VaiYld
         GhKugcyzSrEzCTInv61WCRbQFCN5Y5WD+KccptzbOFiWIW4IZOBEfKIPiLeJQx8x2twU
         NkyF7R2eZBDokXpH4yVBT7ymxhiB3Sym+Hw/ruD1189KDEXyDAot/EaYKe9C1hDMffad
         udYdGl8du61fk5j4r5gAUKZPM+GyQnknVXfWlcgaZlN1Lz6Fgm+Bspo31KT78ZLVVBGv
         hBZdJyfDT6fsQOwZ7ekxGh6dIGkB1Ae8bpt8aFkCImLeJD5UZ3rTaoYkiLwezf9xeTGp
         E/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V3E7C6Og+DeChlLLoXpHp4Nxx2su1Pk7XRniQiodBRM=;
        fh=fFlKzzys7RYJ7qbsLsL00aQs8a1oOPyGlM5WUu/86k4=;
        b=CMetqHfCpIj291UuFKkWeRP0gF0URP+vEvwmst+ZCn7X14zDx/s30RCsWOwF0Q5aOe
         k6RsHGW1OlL5WKcvc1+hu9FqRoDolivgzd7ovSU26nLa2LPiiZKYUZ41kNtVN9pC6u/0
         ExrUr0Dm6CS3jKkps0kpV0rEYa3fvpFqjNBvrQpgktJzjO0so4zs9j+SGk2naz4gP/15
         95iwAIUHjTxCgFvIQTGvkqKXr8wr/wz17isxGMumdroV3hPxM/B0GGoHbhvgZtParIyG
         ITqxmAcCfOITIH+oFeMxVehaydzMHSomQ7zha9XaP7iS0+txc4bGtPRfQfdPskQrCAmm
         /E+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576505; x=1795181305; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V3E7C6Og+DeChlLLoXpHp4Nxx2su1Pk7XRniQiodBRM=;
        b=quzZYudL4QEK09mWsLJinRFBJwOVwfF2lwUHLoM3ZU+rElRTzu2b71r3ydsjjteBXW
         UP7IieqclbY+RJ8RCSirtt1Ew1ib2EqjyhGr3Ddr6LPhCdCaGhFyIpsZoJdVp4zr+ieB
         CiSN2KtPIyIw9MeKJvxeRa5TRtrBPTS+X/N5ZBm2AICkhvZaEJTTCmwHN3D3eUw7Rozr
         8Dr2of7G7Hi7MAYsPX/oL8p7KBjOqLQmwCFkiY66V6ZLPL9DruXtL/EiH9RqVHXIyEc0
         35W7CMHN3NL3z/5OmVsF4iW1nE1YqHPeN8lanUhAMuCPLkS3Y1mtog+gU4J3yRn2NzOj
         i/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576505; x=1795181305;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V3E7C6Og+DeChlLLoXpHp4Nxx2su1Pk7XRniQiodBRM=;
        b=AeI0tcux95QQW22MkoYScCbkj4N2PMng3Mp6K2AgxWnfRIntUqeG1+uxOStVuCTKO8
         q5N+b6MeFIQZ2kUgboaWYjUrVSpYg3QSf+uOonYURoH8xFuWYqqI9oNwDXrau6s2D5T3
         XhPbyAZ8t9owhGQtQKy8+Y1U+zYt0g7SfwgnjWU4T29Q4OVkaJXUyw1Pt+1IfDBAHq80
         wV4C0ASz73c3++4S22yLuyE79pMnEmcgmkPxXslfDcej9aQ/YWTbbh6Vt2z0cF/oKaCZ
         N+Styxh2qe38nlKAOxjWOA0Jf2KJ2Y8SgjcWSA/fT/WU2CSSgOdgpPwnRD26NuNWtV3d
         p9uA==
X-Forwarded-Encrypted: i=1; AL+hErHkl2o5qlAKuqo4PfluBX1JAN4Ur5VJIU6lyz5CxS1m63rzZcw4sYWTeyMorCfPCGWIngof4aIVND2/rZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kXYNsBQjGRiv7S9Fl/M5b6K9bS3DJH/X/7dIrokKouHz1eLnM
	TpOmhLEBreBe6Vrs+4j1iW+LX7+dTGuhKEakLhtyIuqHSTW71+2oH3yeftw75WP3gV7HeFyqTqj
	6N/K7tADepto8JtgXeqDGDjcb+UJ4wMY=
X-Gm-Gg: AYBFou3y7BOIBDh/6i4PuVLEXUUO/jMj7FivMYRmo9TOd7GjGtwZfMncIuml/Ba/yZD
	ZRtMLrZW8ycZUtqkaKI4rBcb/jmhhv+5ZCk6bnrTXsisAIak6AjMe6A6nCQoY+R5z3p+PU+OUPb
	Ys/NqSOYqSsB4hFAw7tjr4ps3ftWn52rqK2d4KlX+IEvVtf4/XLou/L62hImes8QkHhrhUxXoj8
	jeqU0MMtJpslM8/PJ1MnEKTw+Wt+FfJwSubCKfRkZl7TtgCBcxhUA03nBYMJDJz6Rgav4szrm9g
	rvKxjVv3gsyyoBL3jtRapBpbkHTx7Fj1Md/uq0f//rAB5XCTfjZIvHPQkObsClvXeT3v30/0eeO
	tEF72evX5b8QZAPzmZK8ZBLwKFzaTUClJ7v+i8kNYQ5Vd/yohgtFcvy6bRasT9EK2b8dBeVwvVU
	AABcUL27CUorZF8Lo=
X-Received: by 2002:a05:6820:f00a:b0:708:d449:478d with SMTP id
 006d021491bc7-71ab51a788emr1392842eaf.74.1794576505497; Fri, 13 Nov 2026
 05:28:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106150225.3700205-1-stijncleynhens@gmail.com> <20261106150225.3700205-3-stijncleynhens@gmail.com>
In-Reply-To: <20261106150225.3700205-3-stijncleynhens@gmail.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Fri, 13 Nov 2026 10:28:09 -0300
X-Gm-Features: AclHuK_DYMKGxpkqaRwaCC0GjU6zRm9Sz_5o55jDfUGytW9JL3hBFbxFlvCEoDU
Message-ID: <CAJq09z7G1YKfv92Rj=7iH5NzN5kwmcrQ6K1qHZ6Pxna-hpeKaA@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] net: dsa: realtek: rtl8365mb: keep the neutral
 PVID in VLAN-unaware bridges
To: Stijn Cleynhens <stijncleynhens@gmail.com>
Cc: netdev@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Mieczyslaw Nalewaj <namiltd@yahoo.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> The switch looks up its forwarding database by the VLAN that it
> classifies a frame to, and untagged frames are classified to the port
> PVID. With configure_vlan_while_not_filtering, the bridge PVID is
> programmed into the port also while the bridge is VLAN-unaware, so
> untagged frames of such a bridge are looked up in VLAN 1. DSA however
> installs the FDB and MDB entries of a VLAN-unaware bridge with VID 0,
> so these entries never match a lookup.
>
> This breaks assisted learning on the CPU port: when a station that was
> first learned behind a user port moves behind the CPU port (e.g. a
> wireless client roaming between access points), the static entry that
> DSA installs for it on the CPU port does not override the learned one,
> and unicast to the station is dropped as a hairpin until the learned
> entry ages out. Clients that need a DHCP reply in that window do not
> get one.
>
> Keep the PVID requested by the bridge per port and only program it
> while the port filters VLANs. Otherwise keep the neutral PVID (VLANMC
> index 0, VID 0) that standalone ports already use, so that untagged
> frames are classified to VID 0, the VID that DSA uses for the FDB and
> MDB entries of a VLAN-unaware bridge. The per-bridge EFID keeps these
> lookups local to the bridge.
>
> The PVID and the accepted frame types now both follow from the bridge
> PVID and the filtering state. Replace rtl8365mb_vlan_pvid_port_set() and
> rtl8365mb_vlan_pvid_port_clear() with rtl8365mb_vlan_pvid_port_commit(),
> which programs both, and call it whenever either input changes. The
> filtering state is passed in, as DSA still reports the old one while
> VLAN filtering is being toggled.
>
> This only covers untagged frames. Tagged frames in a VLAN-unaware bridge
> are still classified by their tag, so a tagged station that roams keeps
> hitting the stale learned entry until it ages out, as before. Fixing
> that would need the switch to ignore the C-tag on ingress of these
> ports, which is left for a separate change.
>
> Fixes: 336e3e4a1ab3 ("net: dsa: realtek: rtl8365mb: add FDB support")
> Signed-off-by: Stijn Cleynhens <stijncleynhens@gmail.com>

Hi Stijn,

I reproduced the issue in my lab. With vlan_filtering enabled, the
CPU-assisted entries have their PVID defined normally, and the client
can successfully roam to and from a switch port and another CPU
interface bridged with the switch (e.g., a WLAN bridged with LAN
ports).

root@archerc5v4:~# tables_dump l2 | grep 64:70:02:cc:27
IDX1300: (UCST) mac:64:70:02:cc:27:69 cvid:001 ivl:1 spa:p0,0(lan4)
fid:0 efid:3 age:6 sa_en:0 auth:0 sablk:0 dablk:0 pri:0 fwd:0 l3:0
static:0
IDX1520: (UCST) mac:64:70:02:cc:27:50 cvid:001 ivl:1 spa:p0,7(CPU)
fid:0 efid:3 age:1 sa_en:0 auth:0 sablk:0 dablk:0 pri:0 fwd:0 l3:0
static:1

and:

root@archerc5v4:~# tables_dump l2 | grep 64:70:02:cc:27
IDX1300: (UCST) mac:64:70:02:cc:27:69 cvid:001 ivl:1 spa:p0,0(lan4)
fid:0 efid:3 age:6 sa_en:0 auth:0 sablk:0 dablk:0 pri:0 fwd:0 l3:0
static:0
IDX1520: (UCST) mac:64:70:02:cc:27:50 cvid:001 ivl:1 spa:p0,1(lan3)
fid:0 efid:3 age:6 sa_en:0 auth:0 sablk:0 dablk:0 pri:0 fwd:0 l3:0
static:0

When you disable filtering, you'll eventually get:

IDX1300: (UCST) mac:64:70:02:cc:27:69 cvid:001 ivl:1 spa:p0,0(lan4)
fid:0 efid:3 age:6 sa_en:0 auth:0 sablk:0 dablk:0 pri:0 fwd:0 l3:0
static:0
IDX1736: (UCST) mac:64:70:02:cc:27:96 cvid:000 ivl:1 spa:p0,7(CPU)
fid:0 efid:3 age:1 sa_en:0 auth:0 sablk:0 dablk:0 pri:0 fwd:0 l3:0
static:1
IDX1768: (UCST) mac:64:70:02:cc:27:96 cvid:001 ivl:1 spa:p0,1(lan3)
fid:0 efid:3 age:3 sa_en:0 auth:0 sablk:0 dablk:0 pri:0 fwd:0 l3:0
static:0

In this case, lan4 will not be able to communicate with
64:70:02:cc:27:96 until the lan3 entry expires. We could find and
delete those conflicting entries once the CPU entry is added. However,
the IDX1736 line is fundamentally wrong: even if it works after lan3
expires, it is only because the switch is flooding unknown unicast
addresses. Learning is disabled on the CPU port, and nothing will
teach the switch where that MAC actually is. I haven't tested it yet,
but I would expect all traffic from lan4 to 64:70:02:cc:27:96 to be
flooded to all bridge ports.

However, the way this patch solves the issue feels a bit off. It
forces all null PVIDs to a (defaut) bridge PVID when VLAN filtering is
disabled. According to IEEE 802.1Q, VLAN ID 0 is reserved and cannot
be used to assign regular data traffic or configure a normal broadcast
domain. The rtl8365mb driver uses VID 0 only to indicate that a port
does not have a PVID. Ultimately, what actually enforces this is
ingress filtering (by rejecting untagged frames). Any real use for VID
0 in both VLAN 4k and VLAN MC violates that assumption, suggesting we
might need to rethink some driver strategies.

AFAIK, when VLAN filtering is disabled in a Linux bridge, the FDB key
changes from [VID, MAC] to simply [MAC]. It explicitly ignores the VID
in the ingress packet, effectively leaving the lookup VID always as 0.
This means a frame with and without a VLAN tag would collide if their
MACs match, regardless of PVID or VLAN membership. This differs from
how this patch handles it, as the patch avoids collisions when the
VLAN tag is present.

It seems the best way to handle this is to use hardware SVL instead of
IVL when VLAN filtering is disabled. What do you guys think?

In the code, I wouldn't change the VLAN 4k VID 0 to enable IVL.
Instead, I would focus on adapting the driver to work in SVL mode when
vlan_filtering is disabled, for example, conditionally setting these:

uc.key.ivl = false;
mc.key.ivl = false;

And setting L2 FID/VID to 0 (isolation is handled by EFID) as well.
Moreover, since the VLAN 4k table is shared among bridges, this might
force us to use vlan_filtering_is_global = true, which carries its own
implications.

I don't know if we would be able to emulate SVL with IVL enabled, as
we cannot control how the hardware will learn dynamic entries with
VLANs configured (a consequence of
configure_vlan_while_not_filtering). Anyway, it might be a common
situation for all DSA drivers that use
configure_vlan_while_not_filtering.

I'll leave these thoughts for discussion.

Luiz
