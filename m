Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA80339399
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 10:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788689179; cv=pass; b=UqtG2MHUlq8n6yuhfNOoMwmsf9e26uNyAsfC/Du4j81BjeWtLVsK1gMDnyoJja8BYHiu3RwNYFcWg721tcJroGdhaykSrXrFDpLL+diWVoVd0Mfyxowyu1mIUclZIreL/RZqb8uowKbcKSz4nwFaIUO83ZtHCbaE+AzdDnnuaYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788689179; c=relaxed/simple;
	bh=8a2nj5ism2pVax2zk3vSFrEurXZWIpEdcPZTfWHJ5Zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o2TlRhgwh9/ufrM7MhMCCmsADHr8hR6KF3TTxjZDN88DGi97R6fTOAZDN4ISZQwgReyODa/gCibb0foqBKtwJrPgndHBQvh+xofHk1ZAb4VJbhQavo27HK5qQpijag2+xrL0P91sQJhWbBwJsHXhfUqQ7aRE2zrGOylLZqV9MAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PvBEIeea; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvBEIeea"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-66fc2844f0eso2315466d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 03:06:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788689177; cv=none;
        d=google.com; s=arc-20260327;
        b=NekKXmF1SyiHOF5H6Vnb4HOyHWJtMMCHVQgZsgFC8iTEcLE8lwaFW5i5GOzYFTYbHE
         ySHoxpsIbRVI2s19yt4DhLju47VyAVRfeU08PO0vLNnvQLwofnnx/kJLLTkVqo0L7/d1
         jgr/7isN1tg01EY49MusyGxcFXfIYX54/9oH8ak58oDjPQ4uC2eNa8luny40jZILwzXo
         6kmpsn9nngqlqckOGGKkRDLIjjVvLTX/KxyYMVlhrmT2F79m88yyf8TvIJs03ZjD+B17
         /7KSRcouSol0H+9f+jEM6/b6nv10MLJVAWu2/ylUHVumU2ffQHFUCk6vItpYYyRWATWR
         p7xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NUDZMLU37XLHOkBGVp205BWGzlrKXxw3l2yxZUP5mzk=;
        fh=TFwSXzFcnehoUw7vDQ9KRc2ogN0GH9OicLDUOUohpSU=;
        b=r/h5HEOOtnOAZmQViOcf+E5aC1xkglS0mufhnEgf4cUoWh4A/HSirwb++uoLHbOl5O
         s4RMRgCCMLCuiR5LXAbTOYEo+kTUBJOuM+jmHLOU57H7D7r83WO8cGCPFT1f5O24a3rJ
         xYrHNMk1ECvMuoLavpIwf8/SIj1ztxtJgbewJd63Pn05vdUX+7UY1ElfubWX5Fi/Bq31
         0WjKrVBBqo9IAFxP+hLiLf4RfA9JIj3eXUkMmU58zOOQjbQp7HCEiz8GXyYR+ea2PBZn
         bOwOYcHYz7kZJ+czE/rNSRyvBOyjc3tCslRaFnHfg01DlDtTGxlI7iKRKdDqF+LR2qAZ
         WExw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788689177; x=1789293977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NUDZMLU37XLHOkBGVp205BWGzlrKXxw3l2yxZUP5mzk=;
        b=PvBEIeearfYwFQ5zQRpSxyR7Z+fu6q6sO+rY6F4fdFLCMynO/zBAiE5JbdSkcPgmSy
         vvfi/DHEIM+cc5P44Dpho7EE1PZGewVNtrcNQn0N6po8jwL6VEio8vKPm0kVfX1jOAKF
         i13HRkgwRuVyPZ2mOnO+WvtYZmdDFHjwCbYt3uYD9s5CsNUtvD1Trh/RCGtTQhUjK3IW
         eqV2vj0NmyWmf/zAHNY01O5CD7YfRLr6CY3E1Sz933JYloh1LP6pI0/7DRowHIDAiJl5
         tFINolo15OMURfPtpWnLEsviaLI5Rzt361bEtcC0/zvezX18Ekl8CoZBMXhAPAS2ZiBZ
         G8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788689177; x=1789293977;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NUDZMLU37XLHOkBGVp205BWGzlrKXxw3l2yxZUP5mzk=;
        b=aUaOke3u37Q2cZS8uOeTnOkTcYFUY9t1F8gpP1kQHfHjwlQnwkeA3Fv7qvJUnOOOh/
         30Kwb4S/5DT9zmeq9VCpi+HmiUtZFy3y+h3w4nfDOhtGJmcE3EAgJJAf26wEMiMRIK71
         hZy4TUrLr41kippPUSrlkJvk17t7gj2UKJWbhC+a8KhkYaLFxROyNspPnSR1tWnC3P05
         Y1VTN7WtkMMbgjaQfeQK2dlhlWAhMbi4xAiJ9GZf2ffronbQoa+5aXkLNC+gtyanvlO1
         iYRxGJkP5+k4EeUfbQz1VzIQq0HckqUKlWqCzvLHgZGQ3/TUzV2i4AIy5KBVWiymF6UV
         EerA==
X-Forwarded-Encrypted: i=1; AKwUvByPJJfs51LeD2A/wQ5wq+PrmsoSzhL8IQYnMeTrxIvI08sJtH1cTkm6kuK3qiNhtwXrQvps5qlwp3YLZaM=@vger.kernel.org
X-Gm-Message-State: AFuF++meq23hte7fz2PWOwHFjJpnUGpb/v9Mzprtpswx1LINSlPIExG9
	3zdydwSukH5+Mz7UxVreGMpYG4gz645YVa+uhuEYZD3X6VSXNzQrZ12QMfwgK/mjVS26r2uck5s
	R0nOwtS6yE1ps3U10wUZYVvaQel/TCBc=
X-Gm-Gg: AYBFou0dQ2cpQoPJ5KYp3jW3jB06bd1o4mv4TSn8rt6F+3sE8eLDT7EdeyhOoSFGDEb
	wlL6hyuQXIzJQXP+iN+WnGzyp3uFVfWeU74d2NWT8jDxhWJEPOhiA6/WT40fYph859na51kyCDk
	yd0YdlOGEhdWdT8oCVq6JkQbtO0S1vTqylLZh3qBaahmbFhdDcCGse25qe+o4eDjSB25nVm4eEa
	bRYT67z/3mHOfbu35cXjxCqzWXxpxGNTrW/u5N8Qqy9XRVZTAldRv7QAXm2EXlS0k712KpF+Vp3
	fsaIngMIkTvT4gCIDF1gMuR/ZNUaetez/TW4R0BeWN3jGe/7eug9Sxyrsgq01XrBbEdYIEXgdaP
	QQ9ml41S4PLCzlwB0NRc/dWLE3vhuciA2boPutM91Yf+JeDonqWoYB3L/aWwQHiY83JAI2f3CrY
	/GoBH7YZLq
X-Received: by 2002:a05:690c:e693:b0:80d:f376:5ba9 with SMTP id
 00721157ae682-87127656993mr46931887b3.24.1788689176856; Sun, 06 Sep 2026
 03:06:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905013404.2712866-1-danesh.petigara@broadcom.com>
In-Reply-To: <20260905013404.2712866-1-danesh.petigara@broadcom.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Sun, 6 Sep 2026 12:06:05 +0200
X-Gm-Features: AcwNN1VW01k9UPlF2rgBbT3sZ1KrZVqsfWM92xFXCf1YwwGiT4ONQM9vjjTKilU
Message-ID: <CAOiHx=mhb64eSKVy-HH+dY=F-+1TkGmJOQcUg9UAfwKRNqO7Ww@mail.gmail.com>
Subject: Re: [PATCH net] net: dsa: bcm_sf2_cfp: fix NULL deref when port_num
 is out of bounds
To: Danesh Petigara <danesh.petigara@broadcom.com>
Cc: florian.fainelli@broadcom.com, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	vivien.didelot@gmail.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Justin Chen <justin.chen@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Sep 5, 2026 at 3:34=E2=80=AFAM Danesh Petigara
<danesh.petigara@broadcom.com> wrote:
>
> From: Justin Chen <justin.chen@broadcom.com>
>
> bcm_sf2_cfp_rule_insert() validates port_num against
> priv->hw_params.num_ports, but the bounds check was placed after the
> calls to dsa_is_user_port() and dsa_is_cpu_port():
>
>     if (ring_cookie =3D=3D RX_CLS_FLOW_DISC ||
>         !(dsa_is_user_port(ds, port_num) ||
>           dsa_is_cpu_port(ds, port_num)) ||
>         port_num >=3D priv->hw_params.num_ports)
>
> Both helpers call dsa_to_port(), which iterates the port list and
> returns NULL if no entry matches.  With a user-supplied ring_cookie
> large enough to produce an out-of-bounds port_num, dsa_to_port()
> returns NULL and the immediate ->type dereference faults.
>
> Move the bounds check first so dsa_is_user_port()/dsa_is_cpu_port()
> are never reached with an invalid port_num.

While in isolation this makes sense, AFAICT the only possible call
trace here is:

dsa_user_set_rxnfc(...)
{
        struct dsa_port *dp =3D dsa_user_to_port(dev);
        struct dsa_switch *ds =3D dp->ds;

        ...

        return ds->ops->set_rxnfc(ds, dp->index, nfc);
}

int bcm_sf2_set_rxnfc(.. ,int port, ...)
{
        ...
               ret =3D bcm_sf2_cfp_rule_set(ds, port, &nfc->fs);
        ...
}

static int bcm_sf2_cfp_rule_set(...)
{
        ...
        ret =3D bcm_sf2_cfp_rule_cmp(priv, port, fs);
}

Since the port is dp->index from the dsa_port from
dsa_user_to_port(dev), AFAICT it is guaranteed that dsa_to_port(ds,
port) will be non-NULL (else the user port's dsa_port::index would not
the user port's index, which would mean the data got corrupted
somehow).

Also seeing how ds_user_set_rxnfc() is
dsa_user_ethtool_ops::set_rxnfc(), I don't see how port could ever be
anything other than a user port, but maybe I am overlooking some code
path where it can be called for a CPU port.

The check for hw_params.num_ports is sort of valid though, AFAICT sf2
doesn't ensure that the device tree registered ports are within
hw_params::num_ports, though I would also assume it would break at
other places in that scenario. Maybe we should just ensure at
registration time this is the case so we can just drop the check here?

Best regards,
Jonas

> Fixes: 4a5b85ffe2a0 ("net: dsa: use dsa_is_user_port everywhere")
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
> Assisted-by: Claude:claude-sonnet-4-6 vscode
> Signed-off-by: Danesh Petigara <danesh.petigara@broadcom.com>
> ---
>  drivers/net/dsa/bcm_sf2_cfp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/dsa/bcm_sf2_cfp.c b/drivers/net/dsa/bcm_sf2_cfp.=
c
> index 84a086c3e99b..6ac5cf154f31 100644
> --- a/drivers/net/dsa/bcm_sf2_cfp.c
> +++ b/drivers/net/dsa/bcm_sf2_cfp.c
> @@ -867,9 +867,9 @@ static int bcm_sf2_cfp_rule_insert(struct dsa_switch =
*ds, int port,
>         port_num =3D ring_cookie / SF2_NUM_EGRESS_QUEUES;
>
>         if (ring_cookie =3D=3D RX_CLS_FLOW_DISC ||
> +           port_num >=3D priv->hw_params.num_ports ||
>             !(dsa_is_user_port(ds, port_num) ||
> -             dsa_is_cpu_port(ds, port_num)) ||
> -           port_num >=3D priv->hw_params.num_ports)
> +             dsa_is_cpu_port(ds, port_num)))
>                 return -EINVAL;
>
>         /* If the rule is matching a particular VLAN, make sure that we h=
onor
> --
> 2.54.0
>
