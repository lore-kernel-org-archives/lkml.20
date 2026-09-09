Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375ED562609
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788972707; cv=pass; b=rnYe3SFiDHrkFgS7YDD/ilDCb39hhNt909JBj2nM5nvgSjEkyD3HsF2maOcQs7sDqtR5GITAD4+Df8SrRnbBxkoqBBrSYhsKV5qEdT8Ib1YkuQdxrUeQUEgb2zAzq8u2/xl3UQw63zI6bzqckrVxGDCM+O6iwoVj8vzDf5H7gf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788972707; c=relaxed/simple;
	bh=jwhwaE8fm/pKLXVZub7vb/BlaHn8D/Z2l9jwB86QuTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PG99sCUex3a/NV8NgC+CN97JRd2NPzf+7tZBeS28nioY8crPcnTo5EqqF0YlfyD02VU9n7rml6zSgYnrXWwKn2w84yzFM3vQnYhIfhz9nEmCj/+pEr30TmeSx/kcZokN37PdGfF7Nb/XSUJwpPrlJhZivhZsuWCebddgaIWdEls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8pRRfVm; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8pRRfVm"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6b1ae716892so571319eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:51:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788972703; cv=none;
        d=google.com; s=arc-20260327;
        b=AgsVHmx+76aQ5AuMelKYTr8Agx+G/WUx4X6ydHvk+CGKWXcBaHo5EUo0jmIBJHrBEe
         WDCuz23+gx4m0lyhntWRS5bNinX+b827aWMTj+9aEsLGSqMA+KTh+dIlQkibnNwOICSF
         ehdgmV84sLcSJT5q5iMWTfQxN0D9cbvPu+Nao8jntF2u0egMf4zXQr4QfVaGyTaDlMQg
         BcDEMO+s5cKg1VHNwoS/4pFs9yGdFW5ezitmqWc02OUdlJI6cb0at6kLQJYb8XgNoNnD
         02Aji7BIlp6zLDry9fgvQ5IqkVqgg0eKVVfnJHwjIcgdGgywsDFYzYXsKVXqfy6lsQAq
         XH/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GZD8fQwzWOIg9aQ+I6SUCLi9VoyglW27yql9EbnGC8s=;
        fh=TTVqYeq+A8S4LqVFUtIbPR7NFMTn9MMjROnpdzxbYQA=;
        b=Bz3nfEasPnZxuKxRfi/mJMF0UBav/35vPu+TO/IIB0gERP8ptej/E5zjTBtixUerYW
         +bzCg7BJSru4knA7q14W0kzIybh71A9e/Hi1FgBo8IVKrAjfcOUE5cr2k2KCPCZAzWLA
         22wtHIiyRcXN1AssGbzLRXj9/n/I+WWouIaWMKYHaJ+eCtBQXx4sL32EiWGaQ2Y+8bkb
         qerGYlCoQLjTYB/n5CmqVXIaLW1jzXQFskUCiEzRfj7HqzllKEvnkwAUit60lD/1VLJ2
         xQ4KUR1/Y9dKl1O/IJhWRFqbPwmBWB4qHqGIARQlqg9oD2aI/Yb6x3/Gk2/E5RLwFCjW
         XdTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788972703; x=1789577503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GZD8fQwzWOIg9aQ+I6SUCLi9VoyglW27yql9EbnGC8s=;
        b=R8pRRfVmQb4VJbktUWfkRCbBcOlcsJ9ztkOuY1LXzvdEP7hqNCPJGJt7XUK4TfTRHa
         waHmNJpJWe7r0nCZjEmBOU//KuCNl5U7+jfh8PvnXy73RmhuKYjMiQ8IBPO/DeZE1LGm
         ndLbUP2rV1H+hohyNnBzvy6euGR9Qz8llhHztdcnLmNSYr3juQqJrKDvG02FSEXZw8w2
         I8Dw2guHuL6hh9CVdYToPq6QOXIlLqiVBUmmA6NpgF3ITQ57KdmgogHpVAFJ0ON7Cmjd
         oFEfuCvtRoXvYyUf1zpsV6DtK9aiaWyDQvXLTt7fk4a1ashWWK7L3//VqMBUDGqKLZRN
         rGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788972703; x=1789577503;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GZD8fQwzWOIg9aQ+I6SUCLi9VoyglW27yql9EbnGC8s=;
        b=j6q5QszePgq3YLHQzGX/2FF1rbUB7Zgvq66HOwvK5qETZdfaXZBbOaaQft/KR5kNc/
         WELqwVgAxvwIz6iq+RFEICXmjXcF7X/JIGeToclVQ+mMNYSZvwOI+fItoIKANfR+QIuv
         /o/OIloReLbtE9McTyJ3gm1Tv3Y1LBd2cJu4voZwr9gNcXwIbsPS0WFVFsPccp7wKmwk
         xF8O3HO3ThoFlsyCTuII7wr3/YQ0FNSZZB5kratbrGltcYOXTzzmw5apqpIn8IhnAFsp
         NwNr59FFvnd+HkYGLopBvdXZTvpbdvOJvkMeg7Bz8hdVvgEoH2QXXmam93S0+IeoFH1T
         f9Vg==
X-Forwarded-Encrypted: i=1; AKwUvBzIFTxpOv4PJSF0SRelCAP6Dl2FIgq6zsN4BHL6vKAkBWGCOWz02z7T/lFRqTAvdAANBiGpaUzJTF0jsQU=@vger.kernel.org
X-Gm-Message-State: AFuF++lIiUuIpxcJh7xJFRAPQFWmCFC5gNE/1vbt+SvCujwRQ+Uo0cpj
	ovn3Q6s6rtv5BGrqTBovQExIrRKkOR4cYqPfOoaMaYf8t4hnnz9wMwiWhESB6PIlJ/wxz5WEpNm
	mLR+BBsHsyGhybOjokOh7I7pToShGzlM=
X-Gm-Gg: AYBFou048m1fzLpitc1nyhWCLhATQV9Am69fJ5d0lh1D8DKgFoq8OVS0Ru6YMbdYV7F
	eua2cecT1YPd5FxDnMHugy4ExChXNXjhIniZCInJFcSkHkAD1igBt6SwKKiWU/AF5bQJkqi4gdV
	P9otVYn6I2EF1eMvxG4RRUynsol25MHGGReZp5tNbXx+1qwF4EH1Y6N6VwbsdZ/mSwxjCfIrDv2
	zm70FRS7o7HLaJxOFninyIGd8I4ijLkJL0USGkRW9Q0zn0IsmstQqHhG/w2ZdsIgy7AupMx7yoN
	rfKjO0ujjt+lGY5JMoMs+mONC8yItJE+Ri2OCr7FFUqkhpXMbrEXm77xdokVGZTblilpY6dbyTP
	u4lpmU9B1yjDXVey7tpXqNIw=
X-Received: by 2002:a05:6820:169f:b0:6bd:b31a:4b1f with SMTP id
 006d021491bc7-6bdcd33f307mr6766100eaf.29.1788972702909; Wed, 09 Sep 2026
 09:51:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908083614.2210505-1-kyle.switch@motor-comm.com> <20260908083614.2210505-7-kyle.switch@motor-comm.com>
In-Reply-To: <20260908083614.2210505-7-kyle.switch@motor-comm.com>
From: David Yang <mmyangfl@gmail.com>
Date: Thu, 10 Sep 2026 00:51:05 +0800
X-Gm-Features: AcwNN1V3yEM_moDVfXugny-9Dlzed60W-aZlQNUB-4tiDGKqJS-aEdnH2Weggcs
Message-ID: <CAAXyoMMLpaD5B4QojC0OKHxOFfPfFGpsS2nxCMT9e=nJeo8beg@mail.gmail.com>
Subject: Re: [PATCH net-next v6 6/6] net: dsa: motorcomm: Add support for
 Motorcomm YT922x
To: Kyle Switch <kyle.switch@motor-comm.com>
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ming.xu@motor-comm.com, xiaolin.xu@motor-comm.com, 
	jianmin.wang@motor-comm.com, wei.zhang@gl-inet.com, sijia.huang@gl-inet.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 4:36=E2=80=AFPM Kyle Switch <kyle.switch@motor-comm.=
com> wrote:

>  config NET_DSA_YT921X
>         tristate "Motorcomm YT9215 ethernet switch chip support"
>         select NET_DSA_TAG_YT921X
> +       select NET_DSA_TAG_YT922X
>         select NET_IEEE8021Q_HELPERS if DCB
>         help
>           This enables support for the Motorcomm YT9215 ethernet switch

Not sure, but might be better with NET_DSA_TAG_YT921X ||
NET_DSA_TAG_YT922X if that does not cause an error.

> +/**
> + * Initialize serdes configuration based on interface mode.
> + */
> +static int yt922x_sds_init(struct yt921x_priv *priv, int port,
> +                          phy_interface_t interface)
> +{
> +       int addr;
> +       u16 data;
> +       int res;
> +
> +       addr =3D yt922x_sds_phyaddr_get
> +               (port, YT922X_PHY_REG_TYPE_SDS_COMMON_EXT,
> +                YT922X_PHY_REG_SPACE_SGMII);
> +       if (addr < 0)
> +               return -EINVAL;
> +       /* write protect */
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x4be, 0xd);
> +       if (res)
> +               return res;
> +       /* CDR */
> +       if (interface =3D=3D PHY_INTERFACE_MODE_100BASEX) {
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x406, 0x0);
> +               if (res)
> +                       return res;
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x416, 0x3458)=
;
> +               if (res)
> +                       return res;
> +       } else {
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x406, 0x800);
> +               if (res)
> +                       return res;
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x416, 0x4558)=
;
> +               if (res)
> +                       return res;
> +       }
> +       /* PLL */
> +       if (interface =3D=3D PHY_INTERFACE_MODE_USXGMII) {
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x43a, 0x1006)=
;
> +               if (res)
> +                       return res;
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x43f, 0x3029)=
;
> +               if (res)
> +                       return res;
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x42a, 0xf070)=
;
> +               if (res)
> +                       return res;
> +       } else {
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x43d, 0x207d)=
;
> +               if (res)
> +                       return res;
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x43c, 0x207d)=
;
> +               if (res)
> +                       return res;
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x43f, 0x3032)=
;
> +               if (res)
> +                       return res;
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x43a, 0x6);
> +               if (res)
> +                       return res;
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x42a, 0xf070)=
;
> +               if (res)
> +                       return res;
> +       }
> +       /* VCO */
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x439, 0xC0);
> +       if (res)
> +               return res;
> +       /* Vdac */
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x492, 0x7f7f);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x491, 0x7f);
> +       if (res)
> +               return res;
> +       /* Eye */
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x454, 0xf14);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x497, 0xa44);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x4cd, 0x0);
> +       if (res)
> +               return res;
> +
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x4af, 0x45e3);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x48a, 0xfff);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x408, 0x7c00);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x4d6, 0x7f);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x44f, 0xff08);
> +       if (res)
> +               return res;
> +       /* FFE */
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x48e, 0x7d00);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0xd, 0x60f);
> +       if (res)
> +               return res;
> +       /* CTLE */
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x4b0, 0x804);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x4b1, 0x7774);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x4af, 0x45e7);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x3, 0x5603);
> +       if (res)
> +               return res;
> +
> +       msleep(20);
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x492, 0x7fff);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x492, 0x7f7f);
> +       if (res)
> +               return res;
> +       /* CTLE */
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x2000, 0x40);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x2000, 0x0);
> +       if (res)
> +               return res;
> +
> +       if (interface =3D=3D PHY_INTERFACE_MODE_SGMII) {
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x1042, 0x48c)=
;
> +               if (res)
> +                       return res;
> +       }
> +       /* soft reset */
> +       addr =3D yt922x_sds_phyaddr_get(port, YT922X_PHY_REG_TYPE_MII,
> +                                     YT922X_PHY_REG_SPACE_SGMII);
> +       if (addr < 0)
> +               return res;
> +       res =3D yt921x_intif_read(priv, addr, 0x0, &data);
> +       if (res)
> +               return res;
> +       data &=3D ~(1 << 15);
> +       res =3D yt921x_intif_write(priv, addr, 0x0, data);
> +       if (res)
> +               return res;
> +       addr =3D yt922x_sds_phyaddr_get(port, YT922X_PHY_REG_TYPE_MII,
> +                                     YT922X_PHY_REG_SPACE_USXGMII);
> +       if (addr < 0)
> +               return res;
> +       res =3D yt921x_intif_read(priv, addr, 0x0, &data);
> +       if (res)
> +               return res;
> +       data |=3D 1 << 15;
> +       res =3D yt921x_intif_write(priv, addr, 0x0, data);
> +       if (res)
> +               return res;
> +
> +       return 0;
> +}

No one else, except you, can maintain this stuff. Drop it for now and
discuss it later.

> +static void
> +yt922x_dsa_phylink_get_caps(struct dsa_switch *ds, int port,
> +                           struct phylink_config *config)
> +{
> +       struct yt921x_priv *priv =3D to_yt921x_priv(ds);
> +       const struct yt921x_info *info =3D priv->info;
> +
> +       config->mac_capabilities =3D MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> +                                  MAC_10 | MAC_100 | MAC_1000;
> +
> +       if (info->internal_mask & BIT(port)) {
> +               if (port >=3D 4 && port <=3D 7) {
> +                       /* port 4 to port 7, internal utp */
> +                       __set_bit(PHY_INTERFACE_MODE_INTERNAL,
> +                                 config->supported_interfaces);
> +                       config->mac_capabilities |=3D MAC_2500FD;
> +               } else {
> +                       __set_bit(PHY_INTERFACE_MODE_SGMII,
> +                                 config->supported_interfaces);
> +                       __set_bit(PHY_INTERFACE_MODE_100BASEX,
> +                                 config->supported_interfaces);
> +                       __set_bit(PHY_INTERFACE_MODE_1000BASEX,
> +                                 config->supported_interfaces);
> +                       __set_bit(PHY_INTERFACE_MODE_2500BASEX,
> +                                 config->supported_interfaces);
> +                       config->mac_capabilities |=3D MAC_2500FD;
> +                       __set_bit(PHY_INTERFACE_MODE_USXGMII,
> +                                 config->supported_interfaces);

By definition internal_mask is PHY_INTERFACE_MODE_INTERNAL only. Move
other modes into external_mask.

> +                       config->mac_capabilities |=3D MAC_2500FD;

Duplicated config->mac_capabilities |=3D MAC_2500FD;

> +static int yt922x_chip_detect(struct yt921x_priv *priv)
> +{
> +       struct device *dev =3D to_device(priv);
> +       const struct yt921x_info *info;
> +       u32 chipid;
> +       u32 major;
> +       int res;
> +
> +       res =3D yt921x_reg_read(priv, YT921X_CHIP_ID, &chipid);
> +       if (res)
> +               return res;
> +       major =3D FIELD_GET(YT921X_CHIP_ID_MAJOR, chipid);
> +       for (info =3D yt921x_infos; info->name; info++)
> +               if (info->major =3D=3D major)
> +                       break;
> +       if (!info->name) {
> +               dev_err(dev, "Unexpected chipid 0x%x\n", chipid);
> +               return -ENODEV;
> +       }
> +       priv->info =3D info;
> +
> +       return 0;
> +}
> +
> +static int yt922x_chip_reset(struct yt921x_priv *priv)
> +{
> +       struct device *dev =3D to_device(priv);
> +       u16 eth_p_tag;
> +       u32 val;
> +       int res;
> +
> +       res =3D yt922x_chip_detect(priv);
> +       if (res)
> +               return res;
> +
> +       /* Reset */
> +       res =3D yt921x_reg_write(priv, YT921X_RST, YT921X_RST_HW);
> +       if (res)
> +               return res;
> +
> +       fsleep(YT921X_RST_DELAY_US);
> +
> +       val =3D 0;
> +       res =3D yt921x_reg_wait(priv, YT921X_RST, ~0, &val);
> +       if (res)
> +               return res;
> +
> +       /* TPID check */
> +       res =3D yt921x_reg_read(priv, YT921X_CPU_TAG_TPID, &val);
> +       if (res)
> +               return res;
> +       eth_p_tag =3D FIELD_GET(YT921X_CPU_TAG_TPID_TPID_M, val);
> +       if (eth_p_tag !=3D ETH_P_YT921X) {
> +               dev_err(dev, "Tag type 0x%x !=3D 0x%x\n", eth_p_tag,
> +                       ETH_P_YT921X);
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}

Isn't it just yt921x_chip_reset? Please reuse existing functions.

> +static int yt922x_cpu_port_set(struct yt921x_priv *priv)
> +{
> +       struct dsa_switch *ds =3D &priv->ds;
> +       u32 ctrl;
> +       int res;
> +
> +       /* cpu tag mode */
> +       res =3D yt922x_cpu_tag_mode_set_8b(priv);
> +       if (res)
> +               return res;
> +
> +       /* Enable DSA */
> +       priv->cpu_ports_mask =3D dsa_cpu_ports(ds);
> +       ctrl =3D YT921X_EXT_CPU_PORT_TAG_EN | YT921X_EXT_CPU_PORT_PORT_EN=
 |
> +              YT921X_EXT_CPU_PORT_PORT(__ffs(priv->cpu_ports_mask));
> +       res =3D yt921x_reg_write(priv, YT921X_EXT_CPU_PORT, ctrl);
> +       if (res)
> +               return res;
> +
> +       /* Setup software switch */
> +       ctrl =3D YT922X_CPU_COPY_TO_EXT_CPU;
> +       res =3D yt921x_reg_write(priv, YT922X_CPU_COPY, ctrl);
> +       if (res)
> +               return res;
> +
> +       return res;
> +}

Move this into chip_setup_dsa() to align with existing yt921x functions.

> @@ -1007,6 +1108,8 @@ struct yt921x_priv {
>
>         u8 acl_masks[YT921X_ACL_BLK_NUM];
>         struct yt921x_acl_blk *acl_blks[YT921X_ACL_BLK_NUM];
> +       struct yt922x_pcs pcs_port_0;
> +       struct yt922x_pcs pcs_port_8;
>  };

More reasonable if pre-port "struct phylink_pcs yt921x_port::pcs".
