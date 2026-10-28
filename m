Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793183470;
	b=oE4zr86kPILxpiB8futg3dpZoDXp8ShiMIQyNahT2v2eLlIZZUit5ttC96FUi9KyBurO
	 Y9BH3eBJINWBk+a+jtkhwTW+Hq4PnKtddMqdytXrUTCJ4fUxssqh+rVOlNzDpOjU9Dk9R
	 8fruW7S01eSE8xBSrHJFQhRDoEDxrk+9geU87z7rtwD0lRLxzMt8Mx8vEqNpnMa+vox+c
	 B1MCwk4IhW07fxypicsXnAooeBvLiRspoQa9iYq0OtR3SQ34f9TSWcPGAPkWN326pU4Q2
	 /xG6ukgn80wfEIE/GHiy9BhDKyjR4MhPhvdOYBTE8188waG2YQ9SSEnWWGsHVQCrPxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=imedKiikY/nJ9ieNEErDb82QaTr2XE4LPwGTpWh9iBQ=;
	b=JVlcLuDUrnWpmH0Awdx1MUtuvxkmS0YX+jxXcMLNoMRfdpLPs/TTM37NLJrOaT5xmcW8
	 6zw7CQ9vkFKjhjNq8tBYdfZNU5Y5E78dAsTQ46mILzjWgXUl44j5Z5PTK+mdnckeADNZY
	 IC9nUJ0IYexxS95hS6nEr+uP89cYvbLnRfx3CHYM4fNWdw+cUI6e/bNA2UKzfBJoZG9xI
	 CAqe0SZrxY/Knf8DwTvzxXJB4+QFVMKrvycIJl8AG7lLdrNMkUR+NsL3pGY3flvZIJOM+
	 u9kVIR9nHjcvj/ff3Bctml+pg3LYdWkJgLN41xs4avMhsE8vzurdC2IM+RDzYJM7EkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="acd/2w7M";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAC3606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BAC3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=acd/2w7M
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b10ac6ab7bso6371707b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793183469; cv=none;
        d=google.com; s=arc-20260327;
        b=M8HtjVW+D5stej8aAIt/DifHo1zGYLHo+CMystA2d7y4zZ4uM6OpdltxILv7gYokcw
         3zxg0lecmUJ/5di77a50cHDdw84R0T56HEZVByIXaAaDP5fX41ROmiXDgZQWnhpPOAvF
         c45Q4L0jSk65pmAI2zKynbN/MvdLy3D9y37za0mUg1RLFIVfKu6HLhi7shNwo+tJwaEq
         neKkuQN/pd9oGAkAUN6CcBobJfK5VFsUeuroMk6hOyfarIl5g3tANBD37KG7rqp3CaDL
         JRY8OLqGgVggzrp4F06zsn5viWSlrUJbNi3W/tFyv4XowbpZIdvxnfwkl7ajhPQ7rpkE
         ySVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=imedKiikY/nJ9ieNEErDb82QaTr2XE4LPwGTpWh9iBQ=;
        fh=EPdBPW0wxw0rRm9mlKGvl+FTzJBlaxLFRI+2dGavmvE=;
        b=sPu2jRp1kRIbKZWm37GAbQr6Ht+FFCNyI5I8nZ7ZbAdGU95vVpanQqEP+/S7eVPcom
         /NkqDT+DZRuhgJKGpwjKnlhebCfs9ltYIRriYSxdlCvGZgL5R5b+0k4OATEX24+6PRe7
         C1QK+qTkwe7ZShwUE5Wf6lTvJa4pVmLRbFwaws7FzgmEeMLZkQsi7iOb2Wtm7MUGAdt+
         EnjLFsHIMBq5Y9N80hOjBAXTfAGDdoQnz+yKa+Mssjq3joamm0xCC5vjn0nnHsqdzUX/
         9UgM/N0vhiuf3Rq/MJXItgIu7mDqtVSiGfEr9oLd1XiDyB7PYk1y54cgEtxBEhCNUNfB
         p46w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793183469; x=1793788269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=imedKiikY/nJ9ieNEErDb82QaTr2XE4LPwGTpWh9iBQ=;
        b=acd/2w7MTsRZz2fFWnc39WSDc2rQa1UN77+0V71vGBIvU1BtdTJxa4P/P7EZr2AcY7
         Nwv7xwu0bGsj7QtSi5UsT8dbx5Wue8cf4bxRWlypcKhjIYbFwp46OBkIOBbwE9TWOaJO
         WYnQJ0snsSlcoyioYnXSIK+CdCtLMbq6jHCzWYUuLO9TzTkTDEHIFZ7lVeW6RfyJEaH1
         bPTI01p8rtEzyTmI81cFhoA7TM6Yppegg99Lsod3LSXmBgaItToTEJTZB8Ov35iECfKA
         eaTQXWObo9yF2TtcrzLzhMh4JFdL22+KcUWsK8amtIcyVf8B8fR6wUfsvGq1yj/w43/b
         JJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183469; x=1793788269;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imedKiikY/nJ9ieNEErDb82QaTr2XE4LPwGTpWh9iBQ=;
        b=Gjk6n2pjYayVcST23UU3VX3rMmUV2KdBoynC+jq4iGEPBAsw+eBvUGCiBzlNUOvqK7
         XXXuGS7VSxKyDD9y9qfEISHFuxWsB5/YfEw5fMyIvxS6croGm67UWCxAlu5ZYJ6eFFbQ
         JUMBzjZLQ5q6wh+zTHV2XMvHL8lXNDAexAgry4ddiMQM89aEO8OybPZPgZKCsgTytJqp
         eGPdDjR+Y6GGJ5rkipa090I9aCi1KEzFVYWQp8glX1N1e0B9m1oM3N0w0FQieJz4U4zF
         xW6vxO9X7YounvgozeKfrkwkL2dNx76hQLJDOEA1rtXuHVc2YyL9Iz3A+1Q+U9O0cs5B
         ZG3w==
X-Forwarded-Encrypted: i=1; AKwUvBz5QJ34E2Yv9Gqph4uiNkUel5Zo3GuqH7LWsa6qItsnxYhpXZYBtf2LRURWA5MpyAutxJlYpHdN7inbUkk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9l8G/9/Cc2mdKe/7i+jtPcJWSf7mXHRGWDxrt6aGripbe45WB
	sM2huNDRnQgFlShhrXLnMLASFwa2F6P/iWUIch5QeUKuzHC/dDpQaMUQrhTBh0hYvQrzj+8qypB
	PCY0Rkp/Dd2vbVUTxZDouL61Dluhh36A=
X-Gm-Gg: AYBFou3zZY3xI7BH91ool216f+Mj7QLpynro0eKHOCNyBpCim0Xz7yyO58M1JbdVM7B
	WxvzZvgWySIixgAAWYF2ZTfW1kBqt/nz9vERPKezppGQCT+awMaa/ebgYtJOUc0wd63osi3HIYT
	/W43OFSMv6TYa7Yl2d0IP5zLGQWtukIzxp42iQUzeTqUu1HAouR9dvmK+f2RcAeze/6AA6fDRXP
	/L75HCRoW2wn70GAIiBOhocOUPWEq5B0OC/kPB5NfTUzO63O4wz7r8wK89/ocdiUy4BOdz8jRBw
	pdSOj2Vc+EWSakD/lAln9mgdojGiThON+6nZO9OmUvN5rptXHFxkUgPb5J5hfyxcLPAumcyZCIO
	wgyOdqTKfesIELfnA8wGwYsQMGOF6GbZWtYfH/rl1RzZLOVifVMYHNIpNtA9te1nAlFMas3+WSf
	M8oYrDAAmkasU2o0naGb9tee+bBClbvFwwZNMO0lewpNoMuu7IdUVgNy3IlA6ihYwooDzpFkjTx
	Vdd
X-Received: by 2002:a05:690c:6605:b0:8b0:c5bc:e87c with SMTP id
 00721157ae682-8b1b5a56bf7mr12401287b3.6.1793183468970; Wed, 28 Oct 2026
 03:31:08 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028000912.2081659-1-florian.fainelli@broadcom.com>
In-Reply-To: <20261028000912.2081659-1-florian.fainelli@broadcom.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 28 Oct 2026 11:30:57 +0100
X-Gm-Features: AclHuK_B_4dhiY1uBiy_8fsXbNuV7k79HWgTMcm0LExCnPUWVLwnCuYV7EcZt78
Message-ID: <CAOiHx=kKX0YWEkyp-HBahae_krDCXLAjO6kLPi1gJzpf7EOfMw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: dsa: b53: Enable IGMP and MLD control packet
 CPU copies
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vivien Didelot <vivien.didelot@gmail.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 1:10=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> IGMPv2 reports and MLDv1 reports are addressed to the multicast group
> itself. Once the first listener is installed in the ARL table, subsequent
> reports can follow that entry without reaching the CPU. The bridge then
> fails to learn additional listeners, although static MDB forwarding works=
.
>
> Enable the high-level protocol classifiers so that IGMP and MLD control
> packets are copied to the CPU independently of the multicast ARL lookup.
> Retain normal L2 forwarding by clearing the CPU-only forwarding modes,
> and preserve unrelated protocol-control fields.
>
> Handle the BCM5395's 16-bit register and different classifier fields
> separately from the 32-bit layout on the BCM531xx, BCM5301x and newer
> integrated RoboSwitch families, including BCM7445, BCM7278 and BCM4908.
> Export the helper and call it from bcm_sf2_sw_setup() as well, since SF2
> uses its own setup operation instead of b53_setup(). This also restores
> the classifiers after the switch reset on resume. Leave older devices
> with different IGMP controls untouched, and propagate register access
> failures during setup.
>
> The SF2 setup integration and BCM4908 chip gate were updated with
> assistance from OpenAI Codex in response to review feedback.
>
> Fixes: 5d65b64a3d97 ("net: dsa: b53: Add support for MDB")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
> Changes in v2:
>
> - export the helper and call it from bcm_sf2.c as well as spotted by
>   Sashiko
>
>  drivers/net/dsa/b53/b53_common.c | 52 ++++++++++++++++++++++++++++++++
>  drivers/net/dsa/b53/b53_priv.h   |  1 +
>  drivers/net/dsa/b53/b53_regs.h   | 17 +++++++++++
>  drivers/net/dsa/bcm_sf2.c        |  5 +++
>  4 files changed, 75 insertions(+)
>
> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_c=
ommon.c
> index 0880310c9ce3..51784432d266 100644
> --- a/drivers/net/dsa/b53/b53_common.c
> +++ b/drivers/net/dsa/b53/b53_common.c
> @@ -836,6 +836,54 @@ void b53_brcm_hdr_setup(struct dsa_switch *ds, int p=
ort)
>  }
>  EXPORT_SYMBOL(b53_brcm_hdr_setup);
>
> +int b53_enable_mcast_snooping(struct b53_device *dev)
> +{
> +       u32 val;
> +       u16 val16;
> +       int ret;

I'm surprised to be the first to say that, but ... reverse christmas
tree? Or is this not a thing anymore?

> +
> +       /* BCM5395 has a narrower register and a single IGMP classifier.
> +        * Its ICMPv6 classifier also covers MLD.
> +        */
> +       if (dev->chip_id =3D=3D BCM5395_DEVICE_ID) {
> +               ret =3D b53_read16(dev, B53_MGMT_PAGE, B53_HL_PRTC_CTRL, =
&val16);
> +               if (ret)
> +                       return ret;
> +
> +               val16 |=3D HL_PRTC_IGMP_IP_EN_5395 | HL_PRTC_ICMPV6_EN;
> +               val16 &=3D ~(HL_PRTC_IGMP_FWD_MODE_5395 |
> +                          HL_PRTC_ICMPV6_FWD_MODE);
> +
> +               return b53_write16(dev, B53_MGMT_PAGE, B53_HL_PRTC_CTRL,
> +                                  val16);
> +       }
> +
> +       /* Older switches use different IGMP controls, not HL_PRTC_CTRL. =
*/
> +       if (!is531x5(dev) && !is5301x(dev) && !is58xx(dev) &&
> +           dev->chip_id !=3D BCM4908_DEVICE_ID)
> +               return 0;

I would move this to top, and probably check for those that don't have
it. Basically go from oldest to newest generation code wise.

> +
> +       ret =3D b53_read32(dev, B53_MGMT_PAGE, B53_HL_PRTC_CTRL, &val);
> +       if (ret)
> +               return ret;
> +
> +       /* IGMPv2 and MLDv1 reports use the group's destination MAC. Once
> +        * the first listener is offloaded, ordinary multicast forwarding
> +        * can keep subsequent reports from reaching the bridge CPU.
> +        * Copy control traffic to the CPU independently of the ARL looku=
p,
> +        * retaining L2 forwarding rather than selecting CPU-only traps.
> +        */

Should this comment be also in the 5395 case? Feels like it would apply to =
both.

> +       val |=3D HL_PRTC_IGMP_RPTLVE_EN | HL_PRTC_IGMP_QRY_EN |
> +              HL_PRTC_IGMP_UKN_EN | HL_PRTC_MLD_RPTDONE_EN |
> +              HL_PRTC_MLD_QRY_EN;

I would also break out the "Copy control" part and move it here, to
make it more obvious that these bits control this, and clearer that 0
means copy to CPU instead of trap to CPU.

> +       val &=3D ~(HL_PRTC_IGMP_RPTLVE_FWD_MODE | HL_PRTC_IGMP_QRY_FWD_MO=
DE |
> +                HL_PRTC_IGMP_UKN_FWD_MODE | HL_PRTC_MLD_RPTDONE_FWD_MODE=
 |
> +                HL_PRTC_MLD_QRY_FWD_MODE);
> +
> +       return b53_write32(dev, B53_MGMT_PAGE, B53_HL_PRTC_CTRL, val);
> +}
> +EXPORT_SYMBOL(b53_enable_mcast_snooping);
> +
>  static void b53_enable_cpu_port(struct b53_device *dev, int port)
>  {
>         u8 port_ctrl;
> @@ -1334,6 +1382,10 @@ static int b53_setup(struct dsa_switch *ds)
>                         b53_disable_port(ds, port);
>         }
>
> +       ret =3D b53_enable_mcast_snooping(dev);
> +       if (ret)
> +               return ret;
> +
>         return b53_setup_devlink_resources(ds);
>  }

(snip)

Best regards,
Jonas
