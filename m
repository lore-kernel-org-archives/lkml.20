Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792605277;
	b=izTMA1JBSRXXGNem0CNMplTl9Knal6CKTv+PxSUjvafpzo+tGspIbkuqkEx76lmg42PR
	 07wNRRfw/RW/vIKNiiIX29rJ5j0hR3OYrWeEZ4QkplDaWDmqnYx0rj7OV/fSaIltDxSkw
	 UlltyoCgntUZxD9AjI3UYmGSxOgkVPrT9HugjeBO6ZmDCySAxsqrC7jWgLiIv3FRknr+I
	 ieGZDA7bGAtzFonvS6HqbjUCJSjLa7382Drt+4AODTjN1NryzTMiN71/8dLXOWn+2CT6b
	 6RMkWSZsMbiXBLAI1fS0tvwygC5EHzVxbTw04RfAHENSUqfybBWBD+rmHeuXkapFERw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bnSgzKVlIwUx1mAdgm8G7itOWlMwTusQYmRJS/QwgdQ=;
	b=luil4qWyNc7fQqkgC81btYEq0pk2JYZcMsRSQNu2oZDCvwq7tbmo/AKk2RUcmLYQDH3b
	 R9jz90Hvmoc+JZ3FShrmT7jFlGsEwWXdi8XU/HG9HDCR23nWi/hkP70MLIQ8MoDJqtT9f
	 NPTM8qBzIfThQyQ5i9MP60ex+3vgrlBr8nXe5vEGc39bnR1mZj0Eg5EChXVITPFXdozak
	 U4b23wJqVjD+xiSY1wHurMurfuJakHs4/+uGPNwBUE85x2bPs/+j7gUjHgeI+ySmRZfp+
	 vgOwWNOwYYIK9p7aQ9RA4uCKNbk7WLu8Brd1zelnveWAxAHWZUxc/QmpIaeCQlFA/qg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="YspD/xZY";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DCF606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16DCF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=YspD/xZY
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8d6fcbba0so5995ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:54:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792605276; cv=none;
        d=google.com; s=arc-20260327;
        b=i1YbAKczixwxOBhu4wZ3SOsPMDvAzqFkT3GbvWj1OgdS2VuoTaxVeteqQs7K1U8poc
         ttUbCFMB+N4AuqRC3P9iWqW9JZG5EnUdQ6zuCYODKP6DdSIPotrykVVpqSRi1hDYkIN6
         XpHFGI1Vcn6vcceZBjJWd/G47jBaWLNzUAKxk/cnHTKmtBt6fLMsDU10G9zDBYUG4ZEO
         Nva31RVKyQZWT69fCXXanAbYL+kaL5viIL+wI9ZYsChZ/9otlCZt5MsGgs7lGJVHKg1c
         MpkunXbO6Cm8PT9XpwnzeMdLnTmVLif+G6VLxYJdzIVc0xrAx92fUQYvob77k+H/abSG
         EDZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bnSgzKVlIwUx1mAdgm8G7itOWlMwTusQYmRJS/QwgdQ=;
        fh=FEvHzhl1BgKhBERmZXY8lW2w+XP66PJcapAoG5MUGZI=;
        b=qPWzPuCiWkLgkFSaDcMrD4p2iZ4rtakJiouShy3zDDtlyGRAZjrNYVtwlta3/lsJ8f
         jnnewF4yWok90orgf/R6Y/pgoHajg4ujVDXxiBenz7SE5dl/KfLS9aVvLIGxl3PI9DkM
         htmdO23SXAI0bDIgP3/7gdFhqah6ib7jIbmHixSi6qHxoUWoCj2aXjssaDCFN0HXJcS9
         flvNi3+3iNapfVEusDcwLZ4x3l/2RvidnGMfMrp5L0ETRn8RZPDCuJgy7ErEIF7RNcoR
         S4hAUO46q6ckPcAvNrs9OQAZwZ39P2AFZlMzbTcKw51raNmjop6nvZovA+mWliKDmHu0
         K6JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792605276; x=1793210076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bnSgzKVlIwUx1mAdgm8G7itOWlMwTusQYmRJS/QwgdQ=;
        b=YspD/xZY44fFV+FFHSZjF/1RlmBvUNuSfWoWWuFHud6JXIClp37+f+OlnoJN1eKOFv
         MQwoRZ1P9DqC2Qp2kHPovo9qAd0TufADjD0onPwpW7vRQHd7e4lfy43i9RbNf9+IekNM
         zlMvCbl+Gs+EP66/kfLB2hUtRPMo0cNKL27WtWxfeIRVgl1aztbKh+i3BhpMc8WkQmRQ
         OU8c6q+GZActMQnlEzInHLDDUC/nt438pE2N47e+HQN3Bbw84i7dNsQh0+pxRanzfcRC
         8HL2Vby3lni04TIOBHrddKZ7sdcx8H6SsjQP1K0p1tG5Sribwas8GMu1gQZTpsDxi+xT
         rVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792605276; x=1793210076;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bnSgzKVlIwUx1mAdgm8G7itOWlMwTusQYmRJS/QwgdQ=;
        b=T4cIavB/PP0HdVE41jW9jd+LhEL47HksA6DpeCAmAiA1Pj1UxhU/graViCoEJXEXwn
         TnScHH0wvdzzY7ditZxVtQfm9eMPkXRkYmrA84/eJIlVQMSo90OPmtaXZWBCmdQxDroq
         B0hNjOWybWBJZHayBd3+3o3lZywIluRigQEINY8x4LJHdAV42VUBpZxfusDKELnIgfZA
         tLjmz8HASCL6TgCo7Odir6jcchA1w6HzKho0IyE2biLyDfM1HktyHqPhNKJGUb40v/qS
         LbuGe+lhloCwck7D5rbN8RNtleoFlDzjxhlt7RSiahVTo0Ld7WkdKc2qNRumYJMXTFge
         EMkQ==
X-Forwarded-Encrypted: i=1; AKwUvBy46fwYciVSaDXJfCjqOFfiTY3luOauz60ZXJxBj+sK66IqKYqZyvguJyXwihs53inD5ONBcQeUXAOYJvw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1b7c1cO1dgFa3bFerWLVnm4m4Ub7SmAI5KmHZC0DQnf26Tmqr
	YSYb4DGtLKQGUcN7Q+nHV1OdbaTZgoZnnT9WnrW7NZqRzwWF0MeKwQdabPjB9PLoOme0mykWBk0
	MqE/ia4YXHUUjOgTIgGABpoXyDCB9m4U5K7yvHEW8
X-Gm-Gg: AYBFou0WtGgV9JqfHUZCSccOZkGlNxLmXMYjEGy0SZVM4a6IZcCEtqTxXGmz5/tVTR9
	EAPTp75Pfvq/UFTszr0s80QIxSckNnt6qn63mL3JzVsVX/9Y/mzK1q+dBefFJGfQTDh5LJEPiJj
	JUgApYRDCL/YNaFWvlUeMWabOvCd0pS7yjll7a0+UVk5cf/eSjk+XGkSITCza8FU31XS4zjqaQE
	sJ/MOR7BKx/adoTT6ROO1MCrY1wUiA4GqGJE8Sq5IVAGq2ufGnCAjHGo/79tAigAvJI0FPzPEDS
	ZupJylAQZQlkz6wP4eY41ynZilQipF6mGOcAjTE+kP/8tqFYT8zVFsyGOQv9lg7YJRDsEWlUlOx
	XRdTLTNb3eDTgkzzGxJPHkvffenkkYEqvp+80lD0GXRHmKzkC42Vvv5kR9cfX1+524V3fQPnVeO
	c/xajuGOoHCAb0DFEPay6EBvrvfEDZSOfJiam9
X-Received: by 2002:a17:903:1c9:b0:2e6:f400:5655 with SMTP id
 d9443c01a7336-2ea1ad93c36mr12625325ad.3.1792605275821; Wed, 21 Oct 2026
 10:54:35 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <AS8P251MB0001135AF3233180DC42DCD1C8672@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
In-Reply-To: <AS8P251MB0001135AF3233180DC42DCD1C8672@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Wed, 21 Oct 2026 10:54:24 -0700
X-Gm-Features: AclHuK8DF4cNZdOlsLxmOPiqNQYOfIZsIcUlIaWsQRwFpFNtX7VrcLCvRlNCrbM
Message-ID: <CAEAWyHeByLa9ONLzb+NiaavjVSpuNHbEgM_u9uzyVGV3w2zaHw@mail.gmail.com>
Subject: Re: [PATCH net] gve: fix out-of-bounds read in gve_get_flow_rule_entry()
To: Aamir Ahmed <elb12345@hotmail.co.uk>
Cc: netdev@vger.kernel.org, Joshua Washington <joshwash@google.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 3:33=E2=80=AFPM Aamir Ahmed <elb12345@hotmail.co.uk=
> wrote:
>
> gve_get_flow_rule_entry() checks the requested location against the
> first and last cached rules, but rules_cache_num can be 0 while
> rules_cache_synced is true: GVE_FLOW_RULE_QUERY_RULES returns the rules
> from the requested location onwards, so a request past the last
> installed rule - or any request when no rules are installed - returns
> zero rules, which the driver accepts and marks as synced.
>
> The next query evaluates rules_cache[*cache_num - 1] with
> *cache_num =3D=3D 0. The zero-initialised cache does not trip the earlier
> comparison, *cache_num - 1 wraps to 0xFFFFFFFF in u32, and the read
> faults about 352 GiB past the cache. ETHTOOL_GRXCLSRULE needs no
> capability, so an unprivileged user can trigger it:
>
>     BUG: unable to handle page fault for address: ff240996c4c64fa8
>     #PF: supervisor read access in kernel mode
>     RIP: gve_get_flow_rule_entry+0xd4/0x110 [gve]
>
> Treat an empty cache as a cache miss and re-query.
>
> Fixes: 6f3bc487565d ("gve: Add flow steering ethtool support")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Aamir Ahmed <elb12345@hotmail.co.uk>

Thanks for the patch!
Reviewed-by: Harshitha Ramamurthy <hramamurthy@google.com>

> ---
> Reproducer available on request.
>
>  drivers/net/ethernet/google/gve/gve_flow_rule.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/ethernet/google/gve/gve_flow_rule.c b/drivers/ne=
t/ethernet/google/gve/gve_flow_rule.c
> index 2c80cda..db8b9a3 100644
> --- a/drivers/net/ethernet/google/gve/gve_flow_rule.c
> +++ b/drivers/net/ethernet/google/gve/gve_flow_rule.c
> @@ -206,6 +206,7 @@ int gve_get_flow_rule_entry(struct gve_priv *priv, st=
ruct ethtool_rxnfc *cmd)
>                 return -EOPNOTSUPP;
>
>         if (!priv->flow_rules_cache.rules_cache_synced ||
> +           !*cache_num ||
>             fsp->location < be32_to_cpu(rules_cache[0].location) ||
>             fsp->location > be32_to_cpu(rules_cache[*cache_num - 1].locat=
ion)) {
>                 err =3D gve_adminq_query_flow_rules(priv, GVE_FLOW_RULE_Q=
UERY_RULES, fsp->location);
> --
> 2.55.0
>
