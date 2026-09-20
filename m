Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE16318EC5
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789867332; cv=pass; b=bfFin0Ydew/knxXVaq8G9SvtQyFaljOYQ8d86eSzy1nWjjPfnNDaZwAYcKGs4HubJIvIWKiFxVvq7XQ5YbNoK7TNxZ44lDDIFVw3AkfXMk0FxymqxRYV00fgQVnjKot/vGpuY8wBl6FARcaX4xTZohvLiRfGMy1qX42GG072mE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789867332; c=relaxed/simple;
	bh=2VEm69UeAdHkIwbBU0Ergf1rGXkHAkJuOFSQAiSO0p8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vfnqf6meF4KJVnOw+G5Sc+JMWztiTPq+PKl+T7A63lqCBV89K/90S4HdnkghrCxBOu/dSa6/8wGBpSUusGFg7VAPGv0u8GfCjGZ3f/Ai1Hz6ZrW6rKysId3/56ch6/AS9bfXVXeRap3jhvv8UcjnJoGjZgwez32xMIwuLQnRuQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=L6O+ve67; arc=pass smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="L6O+ve67"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea50dc1so1120275a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 18:22:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789867330; cv=none;
        d=google.com; s=arc-20260327;
        b=i1q1QzamCujRBRIWTfzL8EZ1NtTMh0clnNe/1KykvshB1GWTVoX8by4I4mZKx7UC0G
         i1TKBTKrJxiDHwQGH1gObByf7HDIS4W+n+dr8cKyazU0mJrfeua59HvTLMCgeO8fjlQE
         7TTjPJc88quNTC7pczU3DxzGgRLizQm6XzlYAlnxDTYhev7KH1mfwo+pE6zho/xnHdXI
         tXbZacj76+O+iXcQ12xLNx1IufuSLsEjj2BH5eqcp9tmcV4dfgrjCw7IKX0D+/yy60KH
         h5H6rH4pr0Omnw/CkkHTqSNmKz4foaBgGzDJFqn9RyHLeV1iIzohowL+R9EXydtAfCOp
         02rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zXdKuOcPQjh4tFULSVStg5yQtDl5Sivh8Z/3KuFYKs0=;
        fh=JE6kNNagTlmMihKFQbNFjYOYfNY4u8T2qK1bgQjiXvM=;
        b=Sim7s4U8AhHhoiU5vj3b3JGsDT94BUKBzUZHgteCwseVrh1kLLuIEP6QUDKFyPLc+6
         rIhpguSfstwaLUjfArv8TR1E1iqHMsielNrtnPxvzRd++65EhoeRQOeYfGNvo3VZm8LD
         e+Wftq9aoEQ8w0knf/QOhyJO4cQfRnWNjl2iwBUn+Bhr5tsle5+q2aFJAR3v9imw7dpt
         Vmc4V2ege8dkkYbWlp7XW8BMwt4D75p7P6Dw2ScCRAaEuu53AtrNktSCXhYJ2QXy3dZC
         QFjatOJZv7lHPd8wBZe+m+OS3c2Q5OtnVG5OwJvRU5e3jZoiFYM3P1V6KjHooKEK12fy
         sNeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789867330; x=1790472130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zXdKuOcPQjh4tFULSVStg5yQtDl5Sivh8Z/3KuFYKs0=;
        b=L6O+ve675fqEPtcUxqXtqgUQOpms6zlKaUIVzibB6dwlz8UfhHs18NE2LQUD0Itsbq
         AmXaRpmqj59ev0o94mh3ukN0p/YT3QVdvoOrUJ1MdZT9J/lGPqVNQkvOsxD5rhN+A9eL
         LSsfQ6qJGaQTDNhZ2QQWWEBDV889TT7n/YsnabMngyUxuZlKl/P1C3y/n3UyrpfAOlcN
         MOBAOUOJScs7eRYBD8xg0ICP/+2B7tz/TIyD6q5N1RhFcabKg9Gkct3n4hjEokIhjm3X
         69PzVQcrIsgtUubhk1bGHZETjXsz2Or2LbKOUnyrb7IK1ddnqQG3J9tdZG88507MKWLH
         P/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789867330; x=1790472130;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zXdKuOcPQjh4tFULSVStg5yQtDl5Sivh8Z/3KuFYKs0=;
        b=Ze8bEtGOmLpzEM60pwTn3PPY9frPJSgMcEHkYiYBIRrbUvU8nzhbzUy7njTGPxdZnK
         6V6S8AmwXeyK24/LIFtjSBcnV2jCxROu0Twc3fFmF3uuNHV4+dAJB2XR8fzKV8m63+w/
         h8eSNvQgTr9fx9devSQ6aYB6NvLZ9seSyGBHUd+X3lS99ZL5pQ+4mcjqOz5qb3af5u6e
         M70dvLf3TaCkoujvZlm6BiKJlyMyPoMAJuaJ/TEPfNXPo30uuOTfFZviGZ/TgC7UVdaE
         v8f05DqCFo5YAmzXGwLIv/kqG5Ggjcv74iVfdAhYP4O/HLchHXetJgF4R5frZu24XuTj
         mp6g==
X-Forwarded-Encrypted: i=1; AKwUvBxv/4UD4nni/f6ddv7E9RatZbs/qHoFmpBqzYZkU15udUcD4J4gGW3lG1rufc4Vu8q57RlSwBic7BW9pLQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ltEgbLTrip3BCokzlJYbzo4n+n4fYKkaLJ5i3XOd6mTaPOkVKm
	h9NeQDt8mJUiwA5xnU2DqrL/eTNZ3NXlmp8JdDULTN2zKEBWVi91kIIB4X2qwv3Krp7BAp9NsL1
	v60hYm+wdVy9MUKvA0WA9ybDpL1MGcVpgYsZkgdRiKoDxJj3YjoSNKg==
X-Gm-Gg: AYBFou1cbzS23cjnrDfW3nHsLDsfxC9rpjcVpWeCDlsJDXgPQA7mcxpvnhhZU55DtGb
	9ZD7GC4OpKhjTm89AqGd3iYC6XbeEHo+p3g5ltZ/otbadWpKaWGvd7ltEwMTEKlePtx7bIkHBgH
	Fx0V+iTbpX2InVW/cfUskE/kQGXeRwkJt9riCgQvwsecSbD7awyNLuWUMSDRyxWGkq2USSlLmEb
	DOzrhzMB1NKklQNh6JLqPwN9rBGbP1kJPgww9y9grQfJV4IBNBmj3WNIYXLuuG0lUxDSY1BI1oB
	XERBD+T7j3fN60G+0FOfHdtBc1uAMmDlJyFDGuToAQwqQq6E34q2CzL8wqwg55myHg+r6Q9cAiQ
	RFvIPsffxM2Y=
X-Received: by 2002:a05:6a20:144d:b0:3dd:a008:dc39 with SMTP id
 adf61e73a8af0-3dda008e131mr6498106637.39.1789867330527; Sat, 19 Sep 2026
 18:22:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919223438.3883567-1-benquike@gmail.com>
In-Reply-To: <20260919223438.3883567-1-benquike@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 19 Sep 2026 21:21:58 -0400
X-Gm-Features: AcwNN1XYIQ_wBn8i5ggt4CeI5Ch8V6l0HMTPG10aIvqe5hBWEiugJPjmk6GI8NQ
Message-ID: <CAHC9VhS7sZQaPaRswKQ1ETrReEPB2f5buNAMGSXqZ1iBKTs+bg@mail.gmail.com>
Subject: Re: [PATCH] netlabel: calipso, x509: clean up ADDRSELECT on DOI
 removal and check AKID len
To: Hui Peng <benquike@gmail.com>
Cc: dhowells@redhat.com, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 6:34=E2=80=AFPM Hui Peng <benquike@gmail.com> wrote=
:
>
> Fix two issues in netlabel CALIPSO and X.509 key parsing:
>
> 1. In netlbl_calipso_remove_cb() (net/netlabel/netlabel_calipso.c), also
>    inspect NETLBL_NLTYPE_ADDRSELECT entries so IPv6 address-selected
>    mappings referencing a removed CALIPSO DOI are removed.
> 2. In crypto/asymmetric_keys/x509_public_key.c, guard against zero-
>    length signature/AKID fields before key matching.
>
> Fixes: cb72d38211ea ("netlabel: Initial support for the CALIPSO netlink p=
rotocol.")
> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>

Thank you for your patch, but as NetLabel and the kernel key code are
in two very different subsystems, please split this into two patches
so they can be properly reviewed and potentially merged.

> diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric=
_keys/x509_public_key.c
> index 25cf8ac7f257..5c9165a83f91 100644
> --- a/crypto/asymmetric_keys/x509_public_key.c
> +++ b/crypto/asymmetric_keys/x509_public_key.c
> @@ -53,9 +53,11 @@ int x509_get_sig_params(struct x509_certificate *cert)
>
>         if (sig->algo_takes_data) {
>                 /* The signature algorithm does whatever passes for hashi=
ng. */
> -               sig->m =3D (u8 *)cert->tbs;
> +               sig->m =3D kmemdup(cert->tbs, cert->tbs_size, GFP_KERNEL)=
;
> +               if (!sig->m)
> +                       return -ENOMEM;
>                 sig->m_size =3D cert->tbs_size;
> -               sig->m_free =3D false;
> +               sig->m_free =3D true;
>                 goto out;
>         }
>
> diff --git a/net/netlabel/netlabel_calipso.c b/net/netlabel/netlabel_cali=
pso.c
> index e1efd888b4a2..3756193b1c49 100644
> --- a/net/netlabel/netlabel_calipso.c
> +++ b/net/netlabel/netlabel_calipso.c
> @@ -283,10 +283,21 @@ static int netlbl_calipso_listall(struct sk_buff *s=
kb,
>  static int netlbl_calipso_remove_cb(struct netlbl_dom_map *entry, void *=
arg)
>  {
>         struct netlbl_domhsh_walk_arg *cb_arg =3D arg;
> +       struct netlbl_af6list *iter6;
> +       struct netlbl_domaddr6_map *map6;
>
>         if (entry->def.type =3D=3D NETLBL_NLTYPE_CALIPSO &&
>             entry->def.calipso->doi =3D=3D cb_arg->doi)
>                 return netlbl_domhsh_remove_entry(entry, cb_arg->audit_in=
fo);
> +       else if (entry->def.type =3D=3D NETLBL_NLTYPE_ADDRSELECT) {
> +               netlbl_af6list_foreach_rcu(iter6, &entry->def.addrsel->li=
st6) {
> +                       map6 =3D netlbl_domhsh_addr6_entry(iter6);
> +                       if (map6->def.type =3D=3D NETLBL_NLTYPE_CALIPSO &=
&
> +                           map6->def.calipso->doi =3D=3D cb_arg->doi)
> +                               return netlbl_domhsh_remove_entry(entry,
> +                                                                 cb_arg-=
>audit_info);
> +               }
> +       }
>
>         return 0;
>  }



--=20
paul-moore.com
