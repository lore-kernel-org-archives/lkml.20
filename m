Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794391875;
	b=DTv/PGmHrdwB/nfAOn+7AKK1O2wuG+QIm3GojPtnds1syjijlSRw5i4jieGvFOap87Yh
	 U+N6rxkuTsOV2Bp+kQ4pfnIoNDatIc6wNLT687JGD6LMzwCccPkcxrlc3P6KwQUF+UAYU
	 HYWeiNKz9inq0IraKqRh3gC0ifzxJ5SN8s2MdCdStnUZkb8Hkpoz05/Mn5NU03vn/rRbk
	 HeLVHeHybVhleUCw6pKrwhgoCrXx0Gj9a/97TmnkGvGedYYZeGzpbcwvDQGab0kldIGeE
	 TNdxPx45fJW2Nume5a+DenCjQtfl+7YX7O6NIebPJm13vXfbqqcN2rHmWGcR13opDlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PI3S2ZrdcZWAHT0KjRhcp1Lcqsuu9H/9P2vvfVhjnCk=;
	b=rEzQbEf9+/eNrbyWf/i2IoJXZkfnY4dd7IKz3ez+mEUs+t4xA/mpraXHy6tAKZ5KRn0W
	 2/KjHRZr4FJEBwKWOX/SmaImhdwTplLQcfTspHGtm225JyymVDyasoVmcWIT1mFRZ1flL
	 vnEL8qObHd8x1V6wUq+S7s8r83gFJHbFH3pfbZxXe5FP+7zC4gFalgQEZcnj8qOQhdeWs
	 FwhOOEElayN1CDRW4kJCF1iXw2ZAA2AonwYMqMHDu1QeoRUZDfM7KGfBYviY3SFk0jPul
	 Ft6vXVD78YZrgktlnN5I3hbcC69J9XIhBTXT3++7B23316pEpru3ZsZpkGRHhErSQ3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JZJTavdH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE145606A886
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE145606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JZJTavdH
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67c2c2ac1c3so4487741d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:11:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794391874; cv=none;
        d=google.com; s=arc-20260327;
        b=YkNW0ahTT4zjUfIGdmH1kPZM0Pmk/TT5OvzXwQ6BzTrpdXqVasQJFImvseFDxi/R6V
         YC9YRn7FoqY/PrfSye2pS/115HyqutA43S9xT3ZmQKQ2Ewc2kWAFOrvNovCrrOXLmdFE
         YgB0tV7AUdegmwoskclPvq+PkmizIfbhP231H8wyDMqb1vl6ZYI+uqJgPiEPTQhx0mDL
         i068PbXGh64oDep6MXqaj9/xzoUtd8EYHmk2XHt8MerpYr8d6aJ1doDLu6ju+LS5AuGu
         GvFOALtzLTl29M8KzvjSTNX0jhHCxOPWET14wb+VPNz/FEPlVEanVtD/Be8gJPXh2tkD
         Gadw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PI3S2ZrdcZWAHT0KjRhcp1Lcqsuu9H/9P2vvfVhjnCk=;
        fh=60VvfoWSCrj34+Jcjc59XMVEZN9egyBYn7zBvB71LsE=;
        b=UpQh7taOiqX3fT7qZRyLyRmXEOeSmQbydjQRUpkI+I0dINJwLImyjLQMDAkN7cukxW
         JThYLeF4JjCygBR1g4GPxNIdZdteUzcZuwsqr21+es0jazrSCL57ixMC+Mf9+PyBMFh8
         rSKHpQ0R9VQfML/UlWv2WzJxk9UeHUq2v8oc3EASlC66No+gq8iSBVNd0pIAlTyr5X//
         fPbTAC9iuhdZI+xzeY1K/bGeXwg7HpdFtZRziMuSyRij4sCQXHGM24jhzGWEuGvdB+YI
         1s5J4MTE842AzBH3DYBj7oohET6XvFKlL9fHgHg5xqVLCuzhq//nXeL0KhpRMlH3ReKy
         sc6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794391874; x=1794996674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PI3S2ZrdcZWAHT0KjRhcp1Lcqsuu9H/9P2vvfVhjnCk=;
        b=JZJTavdHaoKGocGKaGLfrlVak7JCvgIPrOHKj5b1ww2f1c5OZoc/KyaWWb5wxUK6W1
         QoSzyt7t943eZIIQnohBG2rfpXSWSHbYnCYzjQ0tkGgujt+Xz+xCn4A+P+htswUGJ2Ca
         sR2AIzUWBy5bRtL7AEZbAHA0Ta4nAKFatM4G6leE1g/V1Q12BGQ+9oDF6BkinaiN4tPy
         QT4O8Cgda3eSFRAvek+XT9RvDfP6Vf6zIv3hpUS2wBI4xwHXzW8QQJsVVengm+VCLybe
         HyGpBQJb3nol9eLgmK2YkG1XyYfT7cvZZ+66ZezcRj+4YNveX4dd1EUDur0sfzKQVEpJ
         qcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391874; x=1794996674;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PI3S2ZrdcZWAHT0KjRhcp1Lcqsuu9H/9P2vvfVhjnCk=;
        b=NicabbbBUPWwWt6Nh9SPuqQpKGh+cvbP7wHWA775ha0sYO4PGEZnSMOsA8pzhsTZXt
         6Z5PKe3N1AzbYJV3yqiEjtJvpjhfRJ4G1rhPysaGn5qSB23vhHCbivvg0moNdlI3OU6c
         IOGSaVvtKQ26PcBXD0YMvUSYsAzyDc8Np9hduBTNZdCbNe/c/c/y76ft+0iNf5cDPU/e
         OKlmAlSvCBbDvb0M3uYMUPKdUWibp2pgk8rsfDPsUaylYc967SdUGL1GFDGFG6+dcEb+
         WAZpP4nnBjyuENJ0MHl0YH14v3Bi53dtif//ABR4htpCiFk11bVA6lk3zJ2O8B8BM3Zo
         mXmA==
X-Forwarded-Encrypted: i=1; AL+hErHB07ZZFTwENY1ueaMumLlxy9ptHXRm/YYqDVD7zaEMgJWuwS0lgAPOyMl35kmJpeBSwNfv7iBXLQbmRnM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AmjEE/Z6/J8qNS7lrgE/NGFfsSe65lv27ZVx84U6sKvrMCIdu
	whG3JMwAHeLgBBmpKZqtQq/a+YZ74Xt31PbDVNcZi/NMAYQa3Xg/ZyjGtaubgqwFghiWO5YrpO5
	hqBG7z8FCWUUSxNileFwmik5o7EStxOE=
X-Gm-Gg: AYBFou2oj8Nn+65aN3CMAAeqiSV1QI/PXNkKxCvD/rlXaBkbraogemS6uuWB3886x9R
	HD1iMFAex5JI92ohhutMmtn6D8/Qbi/yL0Urz3mM0psMVHaO088B9JP9wtKsKMDXHymNVKP86Rl
	wlJKs9wRbdz4J4zbQL7L4JVBc98cDUyduXPTHD4wS8VlgNYw1PIRegt4Mgn43W+Ueh/aS2kN7mi
	clFuFk1DfaSGgJRZbyyu3TlcnLlsHtQl++bQU9u+U3mDuRvroarm46dqvzi2Hu3xP1avC8fKXaf
	u2o83czJRPJPUBLMakFypD3sjyv19+du4HcjYdoHqbD7Tc2IDc6mPCjuvH6KFIHU2sLQPPUo9Nw
	qPToFcjssz2GbjGdDn+/Pr6bRPT2iH+QLs0r7IUU5xz0feOlU2D20rE1rTDvQ2fNt9IZrsvaLu1
	QPT0MYzesIL7vs/K37dqXd6N4zGRxQWUoB0LPkwWY/oP/PRtAXxXEAHuhmxFaVSQYfPWbEMAurK
	oV9joHSgYSe0Y+PKReHpIFk3TGpdG7uupLpQFeo
X-Received: by 2002:a05:690e:4181:b0:67c:288c:f66e with SMTP id
 956f58d0204a3-67c67ff26e5mr1427815d50.85.1794391873864; Wed, 11 Nov 2026
 02:11:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-b53-bpdu-mirror-v1-1-f9f32e9d25db@telaak.dev>
In-Reply-To: <20261111-b53-bpdu-mirror-v1-1-f9f32e9d25db@telaak.dev>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 11 Nov 2026 11:11:02 +0100
X-Gm-Features: AclHuK_6Y14en-ccRQ5K_BRRAflyeXGtCHTTt0aIm8ieiGlfj0QCE2ctKc0UOmI
Message-ID: <CAOiHx=kTUBtFVgFhNqGhP135CdUmK8imCE_+pdk7qsdZKMqByQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: dsa: b53: mirror BPDUs to CPU port 5 when
 port 8 is not a CPU port
To: Joseph Telaak <joseph@telaak.dev>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 11, 2026 at 7:31=E2=80=AFAM Joseph Telaak <joseph@telaak.dev> w=
rote:
>
> A BCM531x5 can be connected to the host through its IMP port (8) or
> through port 5. With port 5 as the CPU port, b53_brcm_hdr_setup() puts
> the switch in dual-IMP mode, in which frames trapped for the CPU, BPDUs
> among them, go to port 8 when they come from a LAN port. b53 sets up no
> WAN ports, so that is every user port. On boards that use only port 5
> and leave port 8 unconnected, BPDUs are lost: STP never sees its peers,
> and a loop between two user ports takes the host off the network.
>
> Mirror frames sent to the bridge group address from the user ports to
> port 5 instead. The multiport address registers cannot do this, since
> the RoboSwitch data sheets resolve reserved multicast before them, and
> marking the user ports as WAN ports stopped forwarding between them
> when tried. Other frames trapped for the CPU still go to port 8, as the
> mirror matches a single destination address. The switch has one mirror,
> so tc mirroring is refused on these boards.
>
> This was observed on a BCM53125 board in real use, when both user ports
> were cabled into the same LAN. Tested on that board with a host sending
> BPDUs into a user port: before, none reached the CPU and the bridge
> stayed its own root; after, all of them did, the bridge took the sender
> as root, and forwarding between the user ports kept working. No
> selftests were run.

So on your board only port 5 is wired up, and port 8 is unpopulated
and no way to make it work?

Be aware that more than BPDUs are broken by this, as anything trapped
to CPU is not working. This also affects traffic on ports outside of
the bridge, other trapped packets in the 01:80:c2:00:00:0* range, or
IGMP/MLD snooped packets (or any other L2 protocol snooping).

>
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> ---
> Sent to net-next rather than net because it takes the mirror away from
> tc on these boards. I can resend to net with Fixes: 8fab459e69ab ("net:
> dsa: b53: Enable Broadcom tags for 531x5/539x families") if you prefer.
>
> Only checked on a BCM53125. BCM5301x boards with port 5 as the only CPU
> port may have the same problem, but I could not confirm it.

They do, though there it's "easy" to fix by switching to port 8 in the
device tree, since all three ports are AFAIK always hardwired in the
SoC.

> ---
>  drivers/net/dsa/b53/b53_common.c | 24 ++++++++++++++++++++++++
>  drivers/net/dsa/b53/b53_priv.h   |  1 +
>  2 files changed, 25 insertions(+)
>
> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_c=
ommon.c
> index a2a5754c413c..6b33775c7598 100644
> --- a/drivers/net/dsa/b53/b53_common.c
> +++ b/drivers/net/dsa/b53/b53_common.c
> @@ -797,6 +797,24 @@ void b53_brcm_hdr_setup(struct dsa_switch *ds, int p=
ort)
>                 hdr_ctl |=3D GC_FRM_MGMT_PORT_M;
>         b53_write8(dev, B53_MGMT_PAGE, B53_GLOBAL_CONFIG, hdr_ctl);
>
> +       /* With port 5 as the CPU port, a BCM531x5 runs in dual-IMP mode =
and
> +        * traps BPDUs from LAN ports to port 8. When port 8 is not a CPU
> +        * port, mirror them to port 5 instead. This takes the switch's o=
nly
> +        * mirror, so tc mirroring is refused.
> +        */
> +       if (tag_en && port =3D=3D 5 && is531x5(dev) &&
> +           !dsa_is_cpu_port(ds, B53_CPU_PORT)) {

So this should be extended to all dual IMP capable chips, because they
are all equally affected.

> +               b53_write48(dev, B53_MGMT_PAGE, B53_IG_MIR_MAC,
> +                           ether_addr_to_u64(eth_stp_addr));
> +               b53_write16(dev, B53_MGMT_PAGE, B53_IG_MIR_CTL,
> +                           (MIRROR_DA << MIRROR_FILTER_SHIFT) |
> +                           (dsa_user_ports(ds) & MIRROR_MASK));
> +               b53_write16(dev, B53_MGMT_PAGE, B53_EG_MIR_CTL, 0);
> +               b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL,
> +                           MIRROR_EN | port);

Have you tried a catch-all port 8 egress to port 5 mirror? If that
happens to work, it should catch any trapped traffic. May not work
while the port is disabled in software though.

> +               dev->bpdu_mirror =3D true;
> +       }
> +
>         /* B53_BRCM_HDR not present on devices with legacy tags */
>         if (dev->tag_protocol =3D=3D DSA_TAG_PROTO_BRCM_LEGACY ||
>             dev->tag_protocol =3D=3D DSA_TAG_PROTO_BRCM_LEGACY_FCS)
> @@ -2604,6 +2622,12 @@ int b53_mirror_add(struct dsa_switch *ds, int port=
,
>         struct b53_device *dev =3D ds->priv;
>         u16 reg, loc;
>
> +       if (dev->bpdu_mirror) {
> +               NL_SET_ERR_MSG_MOD(extack,
> +                                  "The mirror carries BPDUs to CPU port =
5");
> +               return -EBUSY;

I think this should be rather -EOPNOTSUPP, as with this setup we will
never be able to support it; -EBUSY feels more like a temporary state.

Best regards,
Jonas
