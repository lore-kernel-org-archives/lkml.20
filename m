Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD46951A137
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109837; cv=pass; b=qgS37nyMJnTzmmblL3jRFIbnHjmlVBUT/SyR7+GqJ0Lty9iReV2Uv0f8is54G4hLsBdUI6WWEbBal/IzJSu3o7y3oqPuNxPD3l7u/AqNk5b0CmFl0DneqCQW+ehp1lM5MVLRBFP8pUNEYddmISkZZCu8Ue/8dasvvXxTCWOSZhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109837; c=relaxed/simple;
	bh=p21WGTeF5sTqb4Jtihp5eAQjvRYAP+4+Ui1owmVnpJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KSQJEExmkahLeQBFvlrQgc4nBWlHbzine96i7Zi7J8nga8SoMWtryx0c4vZCIUYDeZJqnFZvl1ns5vczz3PARY4q+phBuNHwx4R1A26JetsgqcEPkGQiLFdQ9IaY/7dZrvxVdc2ZGPHLSKFLQrauSFx8f7fW0jpFP4/UDEhSMKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KahFfhVA; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KahFfhVA"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-868a9c48f9eso280324b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:43:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790109818; cv=none;
        d=google.com; s=arc-20260327;
        b=QAUavBoQ5DOMrfWciD5JzdefcjQpqVK0OlOx5OyhvJtC3jHqvsptjYhdKhkq3oVy6M
         raXigo8KrS0W+cfWusHPjoC1aB6UYdohVkdKSMg/yiiry7sD/Ffj2MUOV5k96Wl/H5Mg
         15lAuM5ObZqv5hM3ed6yPBYRGW2zVvf+Pd/ndQKvEMD9KZHaSxuK/J5wjYLIX/TwUc4y
         YYhUjj6tVl3KnQtQCWy2uYnUCZryPi3LNnHgPHDNqZP6X2Sj5WZqpDitSSe1RvU6kz09
         IGJj4e3SpjJi5SexJ49nalnhcEdUJh6YUOm2x3n3wz6yMVfBnEHZ2PnCjJEDlfxTOjlm
         wV1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MfcOIqK9du/rFNRW98A9Zkgq23mL6C9Bh17nvMfYECA=;
        fh=msEyxs0O2BXQEXRDtWwAZHNSsJlvibpz0n5VilGCy2s=;
        b=Q/lC94Wtj/Wfv0PZJgNNs2ga5IGtBwucLPGqB+ziu5osVO3wURoDLU6kc/oTRBN8UA
         pCWQBBOSbGix50nrEnYCDKjrlydpwIgB23eoK7OlmWYK17dl8I1tdqC2gQ/a/y9C71K9
         2QES5nap8Q6WlJeBwuIcSS7TzMiMq+7Y4EtwuZuSyIkopPXmbtoPQwEPNtYVxOOhEgIA
         Ndj41SilOi7nf8jlqPEV1uguKj2eFDlX2/zN6iZgdBN7RgOMQHJHYf7pLnTBPZkJ//GR
         Xums3QR0l8hQQhqUTSlFNbjMllahqSrpAipO4mQIjkAbX3Il+KXFc5MU8gDcdnWBXLAS
         QeoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790109818; x=1790714618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MfcOIqK9du/rFNRW98A9Zkgq23mL6C9Bh17nvMfYECA=;
        b=KahFfhVAl1zOli4/f84UtPothikHnIrypswEjYPe+dRdYAEigooZilfTr7SFP9NFUG
         7pep1gMTIXj34rHWMSZ5GI6UT8oTXrSoIT0PijLBS8zex5XIjVb5qKW4uYBPPedAZvpy
         PlygzzcRzt2eGe3feCBETaFYJkp/EIL5QycMtiFt1oufRbMFM9vLY0etZfyS9iMe3XKb
         8AUndaKPeR3Vay9BNHBJBtSb3YqnZHNBW52bAzwrga4kt++tF/JHKctz7RasW0GxlM/s
         oXlajhtzwgqVaodFrbCS0SpKJzdl0YMzlW/4qY+CnVqmSUVS9AQLkWn929LbxCLOHYni
         gvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109818; x=1790714618;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MfcOIqK9du/rFNRW98A9Zkgq23mL6C9Bh17nvMfYECA=;
        b=uXdL7Lsn0jbok/hYp4fiDzjwz2CoUjB/fVt0XCDv2kmO9R9R52L8gw16TxlRKEj0xA
         PFypUy/Qq+DKXhcF9GdQ/EgK38vssuT14YaLQ0J3V8cEaIKLN+lQ6IHXjR2IDJdHlXtN
         wpNNZEKGMAIKU7CfCVmQu74OW1lNLEC0TWO3u9AFyCQVKmYksHDiXd1XFpUcTeJoOi59
         ALaLNnCQcmEWnFrEJethXmwFSLYXydGq8m5s2yj338n2hMEXi16k5xg/amxfNvk3t8u1
         NUHcn/QTXPwDreDDT63DwAWLwPXOeUJ/VCamEJST5bVgHbdRRnjhy2bsOSUSA/1i2EW0
         yppw==
X-Forwarded-Encrypted: i=1; AKwUvBwG7Dov9c4tMM5ZPbY2mQ+ItVS6hVRYKJcYX5VIdHpw5CJKFqyTRc9rRn3YAR5cZCbeoq7D8saWKMJvCAM=@vger.kernel.org
X-Gm-Message-State: AFuF++kQ2BKh9cDEJsjM7DGnal3RyL/AusgIedCVAQGWKoxsbYLs4SBA
	A3sHfiks4xTpGeXYpP5o5QluHK9l+oQEIJ3S2QoH0uB36G3Khdh1HXa1zqJWBMmJw8AmToH89ma
	WzhseayQaaYcA6tFFgeMpPLVY/GNUxlk=
X-Gm-Gg: AYBFou1T99gVOsJj2UwN+ISTDF3vjO70IkGqHLmuTKhI/yJje+i6vCmSIMbVlzn+/qf
	STpGqTGlt3ATsbw9Ww6rFiUO/9ebOy0eyimTw0B0Q8bJXsFiVjgS+P9ZhjW1qnuZjMaaVp8nDkr
	ujIfhFQhaCSCB53MffVwEOgdLNKlEv9wdo1Wx7mS3Ekfsf0IKqr25qqIfvQ0rX7b8XJM0QtUR8P
	sCfbImc7TIkn6RT1gYzMCB8Ih6snQT28XJZqDfCkPL2sOj+qWeAiCdgw1feKLf+WmjznyLk7DiF
	T5Wh7zGNqyM2BI0HtvUEKRfLmEvCbLDKHeSAjOgGBhJsnc6ovSnfAUk7hUoFXEeo/7r4f9dnNbZ
	pBWZs94knKtVqEMLJrjvUVSO4eyORxuC9Ht7/Grw9mbRJ9iZmPFG0IbTeWn8gImbB
X-Received: by 2002:a05:6a00:3d4c:b0:873:2525:9a00 with SMTP id
 d2e1a72fcca58-87d178966c3mr805402b3a.0.1790109817966; Tue, 22 Sep 2026
 13:43:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921145655.3167436-1-i.maximets@ovn.org> <20260921145655.3167436-6-i.maximets@ovn.org>
In-Reply-To: <20260921145655.3167436-6-i.maximets@ovn.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 22 Sep 2026 16:43:25 -0400
X-Gm-Features: AcwNN1XXS07Kn-HMsx7mvoCbQqlPeyYonKF1juQSv29HAtUDdVHgyk--e7m0r5w
Message-ID: <CADvbK_d1zZp6ajv9p8S_AaWZpH2aw7WPF5=TomCFxX3yioVw_g@mail.gmail.com>
Subject: Re: [PATCH net 5/6] net/sched: act_ct: remove 'add_helper' dead code
To: Ilya Maximets <i.maximets@ovn.org>
Cc: netdev@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Aaron Conole <aconole@redhat.com>, 
	Eelco Chaudron <echaudro@redhat.com>, Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, netfilter-devel@vger.kernel.org, 
	coreteam@netfilter.org, linux-kernel@vger.kernel.org, dev@openvswitch.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 10:57=E2=80=AFAM Ilya Maximets <i.maximets@ovn.org>=
 wrote:
>
> This variable can only become 'true' when the connection is not
> confirmed, but it is only checked when it is confirmed.  So, it can be
> treated as being always false and just removed.
>
> Fixes: a21b06e73191 ("net: sched: add helper support in act_ct")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
> ---
>  net/sched/act_ct.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/net/sched/act_ct.c b/net/sched/act_ct.c
> index e72143d36b119..f62051ec9d57d 100644
> --- a/net/sched/act_ct.c
> +++ b/net/sched/act_ct.c
> @@ -986,7 +986,6 @@ TC_INDIRECT_SCOPE int tcf_ct_act(struct sk_buff *skb,=
 const struct tc_action *a,
>         struct nf_hook_state state;
>         int nh_ofs, err, retval;
>         struct tcf_ct_params *p;
> -       bool add_helper =3D false;
>         bool skb_is_ours =3D false;
>         bool skip_add =3D false;
>         bool defrag =3D false;
> @@ -1096,14 +1095,14 @@ TC_INDIRECT_SCOPE int tcf_ct_act(struct sk_buff *=
skb, const struct tc_action *a,
>                 err =3D __nf_ct_try_assign_helper(ct, p->tmpl, GFP_ATOMIC=
);
>                 if (err)
>                         goto drop;
> -               add_helper =3D true;
> +
>                 if (nat && !nfct_seqadj(ct)) {
>                         if (!nfct_seqadj_ext_add(ct))
>                                 goto drop;
>                 }
>         }
>
> -       if (nf_ct_is_confirmed(ct) ? ((!cached && !skip_add) || add_helpe=
r) : commit) {
> +       if (nf_ct_is_confirmed(ct) ? (!cached && !skip_add) : commit) {
>                 err =3D nf_ct_helper(skb, ct, ctinfo, family);
>                 if (err !=3D NF_ACCEPT)
>                         goto nf_error;
> --
> 2.55.0
>

Reviewed-by: Xin Long <lucien.xin@gmail.com>
