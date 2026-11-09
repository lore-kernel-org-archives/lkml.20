Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794189704;
	b=AW8JHPANOFxhJjeP8vwlo5bU6ZrdrmicSMOl04UDWvpuAsGuU0nAgrnHkGzA/rRIbULR
	 VZ+39dYlipsWpOnMVP3pk18zODwjaT9OJVqy4PXuZGWoA07RsLR1o9BzJsaowgFN7rIEM
	 ma6cBC5ufPZn33PGnkY/fJwvLB5Mm4bRCo91R7A1dglP2gnT5NeGMr/AerNLu8W669rTJ
	 QTM9EFDnxXkebuWG280PV3c8xb5KOqqS5oEAP0uyRW0TicPWPh1sx0lkMh7y2raL0UB/b
	 BKg0wXQPTp+1IZ3Va6gOkH6UCt2vWxE4+fanCrc/AvrOIBvGXXzO/t9b/gy3LPr0B+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794189704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=uTAW0TKjvfD7BsKN9xooVklRKfteW0KINt5lhZgJuiw=;
	b=is8wHjmf2zzsOLRrglMEaq9m+/3mV/71PpkBoquyd3SzRvbl2X6+POCmte5I41aHJ187
	 BevdrPtn8Z3LDQOmTVzP1L8ZaDHijF8t8fLblSLVV1+4ZAQH7OyozFxhbSbCvCu6AfNoR
	 R8kIXvUUxMyUv62JSPpYCCIuCClQKHsX5e3+v0DoELOy7UW09XNFi0ySUZIp9vrzNhQ+l
	 nMWlui20r+kROMDsHJPqj3ARpffbIei00Nj000rr9x0imeYwq9odCOaLtBZpnyXvwzO4y
	 d8fHiTY52abPU0RdTeq1eEZzk2A8FtKqzwi5nwsmN6odzKSuZbWoDRrZ+0/fyhNks0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JyATp1k5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4914E606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4914E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JyATp1k5
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6dd7070699eso230894eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 18:01:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794189703; cv=none;
        d=google.com; s=arc-20260327;
        b=QCPW0CoCM/G8q6VGVpZse80A+b7nfpwiNdQisAOGr18qnAT1HfzNSxztBiVLyzo3Wi
         AjzpnOk6BfoK5t4XihbhjjkFa0RxCCJ1UzwiqQmTUawXAe3Q/aO70yGudcq83dtNnvqZ
         wO/WST2M0LZ/5QSllC4WyFQdgusEsjp0wZayzSc6xZ0jUKjW+qJFEX61HQDR24B5kwML
         BozEhq50g9eT4jVYd/7gciB2FH+WIp2zmznR7JagXQWRYVjsLtm4eIZb0tksj1cao+W2
         AbzEKN63+jwlyaHgw/dXHm/dTLsYya4Er89zITfTcHEY6jsQJ8m/nWnYc9PSZaUj8LR0
         JydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uTAW0TKjvfD7BsKN9xooVklRKfteW0KINt5lhZgJuiw=;
        fh=Qfx1JyLZ2Xr0ggyMLhRIF0tm9vuBhU+VkduyHT0lZaQ=;
        b=cFD5UNrkrshZWv9OemH3cbX8QLq5W9V/g6AvI9gXLpIjVVqKIsnU7XUCsC4k976kht
         2HS3gYpXimqDv2jEbUR8MKSXzDNwjiqqGAqK7nu2/wWWA9gRCZu/41d0YCjXTzX2VghP
         lS1mmOgK1jB+xY0Hp5M4wqaaZyQJaFxoMcXxvoZ35nlLPHuZefv5lfH9wo1Lexo4hiAb
         pVGDFr2Tra4QHTJR6AZjj7kmx7afENpb5gCR5FrQeIGciqHalki/HuJM+Q/iPMRN4aRj
         RqyITyYMYeSIirJ23o2eaHSPnrFE9XO2e6WWlCe5obAAtNXfhi9Kg0+Yw73HXibimnD8
         nHkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794189703; x=1794794503; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uTAW0TKjvfD7BsKN9xooVklRKfteW0KINt5lhZgJuiw=;
        b=JyATp1k5tqswqOFMWVVJqWr3NIatcUZcQNLie2dcvJRmHgk4LuZ0gO4RKeGVqqCV/k
         EDuCHC+AmjS8xTjG158+4dp7PeLu0MOjlYoxsiPL/J6qmPj2RaYwcuIbTclxbrMozcEx
         p9pTxQGN5I+3Q97nZGK7hNys0/sfF3VZ0BclbBJWmv+iui2JjwLJ0RKzStZDYyPPEm4y
         MlogNbB7JwGXFNDrrSyzaKiMLiQe7KTnupcN8PVmBDoiMoVvbaTZrsxh3I7yt2BIyWQn
         jUzZ6QQ22zoM9mkke76nn0sge5VZDDrRaB3X38wiCCseznzR8qliZ0wlBjuNDWlipW96
         AKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794189703; x=1794794503;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uTAW0TKjvfD7BsKN9xooVklRKfteW0KINt5lhZgJuiw=;
        b=rkkaz1pttN/Ty3nQl+lqAHQemDI55MRi0TdEMHtPnd27ZwDMwoTRRGqUCSNp5byj6T
         70mvg4ssfFEC7MX36GsC0FO0qd8CDFe+YLmSge50Lim2kUERcVkvP//tc++xd5mpDWho
         G0KEqvugnuMOMn7oRZ2QZLMa1ie/R5VG8C5C/JAcseuFE2EEEwKuWd2caileNUrr6Svq
         LPKTQe0B+8I8NxqfHf4n9hs5J8RTXZ4zKdlTu1Vv8B92C7809wSS3etQvMNyUbhE+J9l
         wv3IRgcAkjDk0TqmF7aIErkIi47qPuxUw/FlJdaWhU1GnZNzS4X1CYDVoOgP7WYAeejL
         UGSQ==
X-Forwarded-Encrypted: i=1; AL+hErHt4E9UZTc+Cke/BzNxH46UGfUmJxdcgSAHMta6YRNnyhT6QnvCix2UBpZkSPRIxBmgcfUp3CcBGbr3aek=@vger.kernel.org
X-Gm-Message-State: APuU4Z87aj3VfPN4zdlTMGt53tnytHH5FJxIZlf1h134PY7p7AcOueZx
	5CtIYLnyPL3jGY92awerPkxhBQ6YPnut7UzVUHXCyhehoUPo66zu3Qem2tOXwBaGlel2M60XUoN
	d68FdC+lhiORUcWSGEG6gTAgvK0VXcUw=
X-Gm-Gg: AYBFou0STjdHiVwQZqDAQCTFIbosgOlgUhinzGe9oQgT4RTD1UOhb2stBEjNR2mdtoq
	LPr7SqE72dxtcx8rvmkmsWt+HPUm/hcAXXLx2LMOdYQYEBYcQ4KFDIvFCBKAhZqh9npSVkKYntG
	HvMXfvN6vrfTLh6DmHuyatkrkLCl4lpi7cYYXYCYopPE+x6KGvcAl3IeFLlZO7QLpqB/oAu+Vys
	cDgY6U0ci8780FAGjXKrwtighDHqvgdlQu5oGWrmZvSG7Or4ExTj6tKB6deO8POPi4WVORtGXjO
	uFXvgkQ+ixXLl2oW/bpU7F2NJG3XPwJLJtQaAiP39CIdRRzJC0k61rGrEWLtE8WWqmQTOkhxOH7
	DYR4G0dizHmHN9Xvc+SPM2SKO+2YzNJiN7pPaPck9mG0BmibOk7t2psQ4ApPMYAI6rIEtBdI=
X-Received: by 2002:a05:6820:858a:20b0:715:2400:9579 with SMTP id
 006d021491bc7-7170f310a90mr1162069eaf.56.1794189703071; Sun, 08 Nov 2026
 18:01:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <3bf4dd70-9771-497b-8c27-e925e0ef81eb@yahoo.com> <7ebd9453-4af4-4ebd-9cf7-8422755fc4aa@yahoo.com>
In-Reply-To: <7ebd9453-4af4-4ebd-9cf7-8422755fc4aa@yahoo.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Sun, 8 Nov 2026 23:01:28 -0300
X-Gm-Features: AclHuK9hcJpyGCPEGAR6IZqezV5G1cX2VmyhiUoC8VNQM5o45OKxqUZ-uP_TlI4
Message-ID: <CAJq09z6vOz5KZ2x_4xoyP444ks5LYhLDpe3a9VeMyCM8C0JVJg@mail.gmail.com>
Subject: Re: [PATCH net-next v7 06/10] net: dsa: realtek: rtl8365mb: use raw
 VID for PVID on family D
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, maxime.chevallier@bootlin.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Family D has no working VLAN member config (MC) table. Its PVID is a
> raw 12-bit VID in a per-port register at 0x0700 + port, whereas family C
> stores a 5-bit MC table index, two ports per register, at
> 0x0700 + (port >> 1).
>
> Running the family C code on family D therefore reads an MC table that
> does not exist, and writes an MC index into the VID register of port
> (port >> 1) instead of the one of the port being configured.
>
> Read the PVID straight from its register in
> rtl8365mb_vlan_port_get_pvid(), and make rtl8365mb_vlan_pvid_port_set()
> and rtl8365mb_vlan_pvid_port_clear() use direct-VID variants on family D
> that skip the MC table. They keep the family C frame filter handling and
> rollback on error.
>
> Also clear the family D PVID registers when the VLAN support is set up.
> Unlike on family C, where VLANMC index 0 is the neutral PVID, the
> register holds a raw VID, and after a reset it keeps its hardware (or
> EEPROM) default. Without clearing it an unconfigured port could report
> a stale PVID from rtl8365mb_vlan_port_get_pvid(), and
> rtl8365mb_port_vlan_filtering() would accept untagged frames into it.
>
> No functional change for family C.
>
> The family D branch is not reachable until the chip table entry is
> added in the last patch.
>
> Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/net/dsa/realtek/rtl8365mb_main.c |   9 +
>  drivers/net/dsa/realtek/rtl8365mb_vlan.c | 205 ++++++++++++++++++++++-
>  drivers/net/dsa/realtek/rtl8365mb_vlan.h |   1 +
>  3 files changed, 210 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
> index d69eed0..e82205c 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
> @@ -2360,6 +2360,15 @@ static int rtl8365mb_vlan_setup(struct dsa_switch *ds)
>         int ret;
>
>         dsa_switch_for_each_available_port(dp, ds) {
> +               /* Start every port with the neutral PVID */
> +               ret = rtl8365mb_vlan_port_reset_pvid(priv, dp->index);

We already have a clear and a set operation. Why do we need a separate reset?
[...]

> --- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
> @@ -44,6 +44,10 @@
>   *
>   * VLANMC index 0 is reserved as a neutral PVID, used for standalone ports.
>   *
> + * Everything above describes chips that have a VLAN membership configuration
> + * table. RTL8365MB_FAMILY_D chips do not have one: their PVID is a raw 12-bit
> + * VID in a per-port register, and no VLANMC entries are allocated.
> + *
>   */
>
>  #include "rtl8365mb_vlan.h"
> @@ -120,6 +124,11 @@
>  #define   RTL8365MB_VLAN_PVID_CTRL_PORT_MCIDX_MASK(_p) \
>                 (0x1F << RTL8365MB_VLAN_PVID_CTRL_PORT_MCIDX_OFFSET(_p))
>
> +#define RTL8365MB_D_VLAN_PVID_CTRL_BASE                        0x0700
> +#define RTL8365MB_D_VLAN_PVID_CTRL_REG(port) \
> +       (RTL8365MB_D_VLAN_PVID_CTRL_BASE + (port))
> +#define RTL8365MB_D_VLAN_PVID_CTRL_MASK                        GENMASK(11, 0)
> +
>  /* Frame type filtering registers */
>  #define RTL8365MB_VLAN_ACCEPT_FRAME_TYPE_BASE  0x07aa
>  #define RTL8365MB_VLAN_ACCEPT_FRAME_TYPE_REG(port) \
> @@ -171,7 +180,7 @@ struct rtl8365mb_vlan4k {
>   * This structure is used to get/set entries in the VLAN membership
>   * configuration database. This feature is largely vestigial, but
>   * still needed for at least the following features:
> - *   - PVID configuration
> + *   - PVID configuration (family C only, family D has no VLAN MC table)
>   *   - ACL configuration
>   *   - selection of VLAN by the CPU tag when VSEL=1, although the switch
>   *     can also select VLAN based on the VLAN tag if VSEL=0
> @@ -740,14 +749,51 @@ int rtl8365mb_vlan_port_get_pvid(struct realtek_priv *priv, int port, u16 *pvid)
>         u8 vlanmc_idx;
>         int ret;
>
> -       ret = rtl8365mb_vlan_get_pvid_mc(priv, port, &vlanmc_idx, &vlanmc);
> -       if (ret)
> -               return ret;
> +       if (rtl8365mb_get_family(priv) == RTL8365MB_FAMILY_D) {
> +               u32 data;
> +
> +               ret = regmap_read(priv->map,
> +                                 RTL8365MB_D_VLAN_PVID_CTRL_REG(port),
> +                                 &data);
> +               if (ret)
> +                       return ret;
> +
> +               *pvid = data & RTL8365MB_D_VLAN_PVID_CTRL_MASK;
> +       } else {
> +               ret = rtl8365mb_vlan_get_pvid_mc(priv, port, &vlanmc_idx,
> +                                                &vlanmc);
> +               if (ret)
> +                       return ret;
> +
> +               *pvid = vlanmc.evid;
> +       }
>
> -       *pvid = vlanmc.evid;
>         return 0;
>  }

If the functions don't share most of their code, they shouldn't be
lumped together inside a shared function with an if/else.

>
> +/**
> + * rtl8365mb_vlan_port_reset_pvid() - Put a port's PVID in its neutral state
> + * @priv: realtek_priv pointer
> + * @port: the port number
> + *
> + * On family C the neutral PVID is VLANMC index 0, which is the reset value, so
> + * there is nothing to do. On family D the PVID is a raw VID in a per-port
> + * register whose value after reset is not defined by the driver (it may come
> + * from the hardware default or from an EEPROM), so clear it to 0.

I'm not entirely convinced by this. VLANMC index 0 isn't a
hardware-defined neutral index; it's just a convention we use where
VID == 0. The driver treats VID 0 as "unset" alongside the ingress
filter. Furthermore, checking rtl8365mb_get_family(priv) !=
RTL8365MB_FAMILY_D doesn't scale well if we eventually introduce a
family E.

> + *
> + * Context: Can sleep.
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +int rtl8365mb_vlan_port_reset_pvid(struct realtek_priv *priv, int port)
> +{
> +       if (rtl8365mb_get_family(priv) != RTL8365MB_FAMILY_D)
> +               return 0;
> +
> +       return regmap_update_bits(priv->map,
> +                                 RTL8365MB_D_VLAN_PVID_CTRL_REG(port),
> +                                 RTL8365MB_D_VLAN_PVID_CTRL_MASK, 0);
> +}
> +
>  /*
>   * rtl8365mb_vlan_port_get_framefilter() - Get the ingress frame filtering mode
>   * for a port
> @@ -809,6 +855,68 @@ rtl8365mb_vlan_port_set_framefilter(struct realtek_priv *priv,
>                                   val);
>  }
>
> +/*
> + * rtl8365mb_vlan_pvid_port_set_direct() - Configure a port's PVID as a raw

The term "direct" doesn't give me much meaning. Since it has
essentially the same signature, it should simply be a clean,
family-specific implementation (same goes for the other functions).

Best regards,

Luiz
