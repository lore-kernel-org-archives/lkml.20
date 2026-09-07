Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5BC503BCB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788809209; cv=pass; b=f2NlZO1YihPwhjy/vIIopvP1d7PHn8uwTTpLSLsP3nm82MfzkLaW6h+OreOvuap7ZHndAJylNp9O8km3XZE0/Sp+o2LoefsvAlcJqfHuiTMn3lHmeinM+I8IhpihqOAaGEYi8wx3PX63hkMU1gWoqib9L5lnRsEW+pWKPlHzNws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788809209; c=relaxed/simple;
	bh=DmILtzqZDzEUGV1I4V8TMYjsJF/IY1peGYXwFN9ey4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DwaS+sic3uZF4/SJ475ENnHnCi4yJOq2Nljn8ZSUghqQYpd83To6tbz0AXwvXK+9cCBdh27vsqS9eLAkEtI9WCVt9PM0wXiOc1Ym3LiKSZcY2x0CJHYfPpOnTDYvGIwPh27sMoC0FCwrb8xx9quZd/R7RA541hkfmxNAGj5yMys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fq18f210; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fq18f210"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47de0093c42so3745016f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:26:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788809205; cv=none;
        d=google.com; s=arc-20260327;
        b=KqzR4MqP2lYgrzfElcCuj7cDPH2afIgDL0TCnFAljLDlg7PR2Oihxk4Aupj4QoYOE2
         JMbjY7hlimKNHYxjBrmTQf4XUKb9uCyUNuvirawMaYFFW7lv8VC7JaU39bXOH9Bej752
         iwz32r8GGZsq1oQ23y49bxJ3pgdKnMVJ9N+LM4ul8a3WravebDR+DZxoGoUJP8pcVElZ
         5V6genzhnvlR5OqDpKn8oXEUAk3QrDDX+33WmLKuF7iIij2a0XpFha8xFBU9QkpCLKtC
         kYJ8CvPsolOYLhtWrDgSieMVmLadL2L4895D6gB8LopA1+7p/7vZi5+xhllGjPcOpcMk
         tchg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kBhKUAdBctYk4OBLe+242bptFLWaOmD7/1s701If7kU=;
        fh=YuNwgBix1zLJM3+Hh8t/EssV4IMigBEmJGt9+7Dv2Tg=;
        b=FhQpvcaIZfalbwIsVa9T7F/d6SFDDv1ap8XHPHFJei/9VchhUkQmsyJUgLM+bh8dUB
         bgKU/XTriVcOt4xHYrrEBO7UNxT27GFmDON/nyk9cJz2bF2NYiQ5XUwTEpBX2WxCgGDU
         qmLsONWN1g9zFnaecny6rbsRro1pROdoe9rQp+LXzg4L9t1KDu4aM7CsV0ytB4DFIxbX
         O3AddZMfLDGOTyeCa25EdYU1U0+IYS7jJae/qF01mlFXFbdQvRt5jCJc9g4oexYRFzXi
         6DDz4GqayRYbGwhcV8EqvZl4XBIfLbIPHqAipiIIw4osO2DjOPFsC3x0RDWCMRf1JsoK
         YoFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788809205; x=1789414005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kBhKUAdBctYk4OBLe+242bptFLWaOmD7/1s701If7kU=;
        b=fq18f210MM3m80kQ2Uea52OvkX+yulhV+P5OEhS7K4mi8w7ZGBtOLUMGkLknSrA5os
         eJT1JBZ4bGLPhzuoZGRcOmWuYczYzVUfTo8hD2vqbjcJOSiCZJO6BV6q2dI0hUE/xBjA
         QvZMqncGlOfVhpoF0SwiUdarZeRwvjoCZKKhs0PgjZx8dV/3dfOymoHUmtDb8YC6ucAv
         VJiEZR0G7gWK89vgBZTkAMhcB8xCVyLC0iqc7tHNs4VNUGCnwDn6Ybus4tRAJ5QHVsgO
         S11Pf9zpRxtM1k5y9AQQMwUvAGIxX67xQF2OmwpOwzVMtPRUZ/rp160LEIiXdtL0Ylqr
         xLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788809205; x=1789414005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBhKUAdBctYk4OBLe+242bptFLWaOmD7/1s701If7kU=;
        b=ihJShxjR/TVfNjUW65tqSH26eFn7jimNRefSAYkMZ065Zyxu74N+jXchNL9igztkTw
         2j1U5bHqfth/wl0SwBavvsgpANdKjogN9aA7zisUtd4YVDL1CzlgAIbXhZQGFFU4LDgH
         ez2wZtyGda9f4R85ClJtk152dOMDoPRSCpt4ExtNI7zxdQ4qLFCiXr1kOSBQWWph1Xbk
         bXfLG3vQrWhZu8Gm4Whb6HlFzcaAanq2VXLLObLQ/ClZRKyAmwsR9PvZ9VMbQVAzdnJQ
         tkl24XPEnkT6RW0aMpZaqpJz6w28KLMhhMuCJrMpQtwrysjKJoOUuDMMWPiw5Ifz7IvL
         O1PA==
X-Forwarded-Encrypted: i=1; AKwUvBxwFN9kszOJIVGBtcE0kVMRqq9AVeyHcrT0wmlBRU4qJvaFYOTQaqYOBc2ag32Sb6ILNUQJR3O4RENV4uk=@vger.kernel.org
X-Gm-Message-State: AFuF++kHRvXeoCFgHv3kyxxu2xxNjqtx50NEqTKDEw39WhD665L7srKn
	4FuAeAJ0WtVCn1gT8sex/6GBXe4KTPw7xNtTf59HT/5BQTLIseiTsSemWyB3ePf+LsdrHzzM4D3
	9hsT/dUi6jxdPA3/qFYGNJwSuKjgJLiVTu2hWEOeYGg==
X-Gm-Gg: AYBFou33cAB1kcLZIyOz4WXXlM4yrtNkSICJSTYtvNmRUe2f1thUw3UJIBCJrFtYTE3
	eUAPTg4E4R0gjhsul/Pe6xikdMfzdtzPKAS3a0xpf1P8SV04RAbCiLs37MfpZ4gVXyw+ilncfsN
	R8jP+BKcJw2LZSYkZoOGstfcbvsl8YDYPeTrEVXJPWAX2DhkT4IFegEITyl8KWRwd7n/zAPnJzn
	oBGvWYDSgp38XYsei3ltJyrtsCic6YUe7osk+MXcOHaNxs/uUD2iS2TpcJLMUr80s7zenAi03Qu
	TULbcBHzGly5vrLLFKvq0p8f+pqtj2T8NJbxMhAq1Ycj8BheSNsXxRpu7ie0H+vEuvfp53rJxAW
	SDSbY9j3zT0O6cCgBqnuxf/IaSqRCaM7m
X-Received: by 2002:a05:6000:704:b0:485:8c16:5eea with SMTP id
 ffacd0b85a97d-4858c166202mr24838505f8f.36.1788809205349; Mon, 07 Sep 2026
 12:26:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rzn1-miic-fix-array-v3-0-3f7dccffaf5a@reliablecontrols.com>
 <20260902-rzn1-miic-fix-array-v3-1-3f7dccffaf5a@reliablecontrols.com>
In-Reply-To: <20260902-rzn1-miic-fix-array-v3-1-3f7dccffaf5a@reliablecontrols.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Sep 2026 20:26:19 +0100
X-Gm-Features: AcwNN1VUA3S6ZAAGYKSTEqV8ikrWj4M6EW9VSx8IWuQuy8lbnm_o-FkNlvIGfjI
Message-ID: <CA+V-a8tqFCB=c0_74=pdOT1ujz6w+SUVLmNVy98qyzd5FrusiA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] net: pcs: rzn1-miic: Fix config array initialization
To: khendry@reliablecontrols.com
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 7:55=E2=80=AFPM Kyle Hendry via B4 Relay
<devnull+khendry.reliablecontrols.com@kernel.org> wrote:
>
> From: Kyle Hendry <khendry@reliablecontrols.com>
>
> Fix memset parameters to initialize the entire DT value array
>
> Fixes: f39e968dc168a7bd ("net: pcs: rzn1-miic: Move configuration data to=
 SoC-specific struct")
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
> ---
>  drivers/net/pcs/pcs-rzn1-miic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-m=
iic.c
> index 2b72fa98ddf1..c50b65d064fa 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -683,7 +683,7 @@ static int miic_parse_dt(struct miic *miic, u32 *mode=
_cfg)
>         if (!dt_val)
>                 return -ENOMEM;
>
> -       memset(dt_val, MIIC_MODCTRL_CONF_NONE, sizeof(*dt_val));
> +       memset(dt_val, MIIC_MODCTRL_CONF_NONE, sizeof(*dt_val) * miic->of=
_data->conf_conv_count);
>
>         if (of_property_read_u32(np, "renesas,miic-switch-portin", &conf)=
 =3D=3D 0)
>                 dt_val[0] =3D conf;
>
> --
> 2.43.0
>
>
>
