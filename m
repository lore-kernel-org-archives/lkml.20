Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8797917B50F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789867555; cv=pass; b=gPu188u2OsRxU6FZibXNEXiFyzx4QZqcAG2za6AqqgXH4AtQ+wPRbnDZoZeJrDQL32ZtkEyMeCqCDdVqcVFjvEk3bnWPLDov4w7HXkGR802PNS9xEunvLvFiwjZylOiowPU/8A2VuLcOLpSbQtazsBHMI+1ZNXLhu4SDfZ/nJ50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789867555; c=relaxed/simple;
	bh=rE0jWmiH8mZl6rl9Yc+bmfiJlsxIdVsL+Q8JnRqVZlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YLo21NKbQ+M10FIjIKXj7qpa/cKpDYDUmCT7dxvCesfATWgBOfe7x4fWV0WBnCrEJldeVzHdKtQFpDLRXSEA8fGsDKp0aOzoaIvkLVSRrcYB63ussVeUuAFApiUUAzIH1hWvXeF23RRjIq/jv3otM6TmOJ1Hntd38CeCNnKGkCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ITHPYTFY; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ITHPYTFY"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8692a8568e9so1624898b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 18:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789867554; cv=none;
        d=google.com; s=arc-20260327;
        b=FALGdMSYGOi2ItQZ3mChIANLQE6xY1pLSIWFbjE7av0FZmrMN7Ae9RCk2ThnOPmkJq
         01dimTndtBCRSHnj8FAG9HVHtPpjOtiej3vg7JRGClrbkUwEtFR6uhiw6A9zVOM7mvZC
         GrB+nuNhGB+K8n5Qmtmmlrb2m0smg16uz4MwQtZhcOQXdl8fm6oOrAgZXdeNMqr9IYww
         P6c0aIaMs0crzUxDTvGofMB5zCW/xyWeBwKYIChxRx/BSPuRbTkkgle/jTj4Lyp5fhAl
         eSmYyx6FbYO3kenwLFEovFY7axYqJ02jHSW0Qqx/nOphbRqgOQUh0ija/+FUhWgaOXEX
         ieIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MNRnVH7wuWaValEcQugtvoveGgv+gdl3RdPnin3h+/k=;
        fh=SYURF1GWLgnbzCrDiexOtO4HcsYeMOZWIprHhAZFIgI=;
        b=IybJcIy+brnw5xIe0oxNDp8vlg80iix2hHQhzXlg9pMBNKS0qA3BZzDo7fZowEIvwg
         06XGV2GrviroyG46omfI7+E3c35+kDJF+w7Q5JJmydemnATzVhrL5iVoBYc9wzjTpreg
         e1WeZq39h8SivwmuRPU2e06XPytEalsADmjl1UGJ5HWLB8//2oLzZfTthG4bwt36/mQx
         Ahz2bj01674qZbUpNjs37ODZCCukZh0CnwL7CVTGv9mlA6hH8d5gyLuYV9z3AQzW1qQI
         QMeGE8VCcBLvMx2XfVmhDvsNdS27GMHVbOjkajK5Mn1IueV9Ktq1R6k96lqXAT9ZPlAZ
         nQyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789867554; x=1790472354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MNRnVH7wuWaValEcQugtvoveGgv+gdl3RdPnin3h+/k=;
        b=ITHPYTFY09cCVl7MzEnnEta1wLZ5p02SW98zHa6QunF+numSL9lPPU4myPxlSfOfLl
         t/JmSHSAVyQbDhi/qHx3XPUGYsX2gK9uHWaQH5Dv5foU3w0OYj15QfNQT3tmnf3v6QbV
         /Nu70CSbVpoEUYbdGO8NXLo1msD+kx6hEJ2YRa147gdHzQvzoE70kNUV0MTzy5Jfk3co
         z71fcZa0+7ecmLeuzQX7dR1BYgng87bqOJb4isuTy4Di0sUt9DSeaVotZ4iM5nZTKxC1
         YcTxV1NQOVFz4PJdbll8YVdbkiD84HvZoKnvGbRkPB3fBkPonGlF+qxs0SlgH07xShhX
         4Duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789867554; x=1790472354;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MNRnVH7wuWaValEcQugtvoveGgv+gdl3RdPnin3h+/k=;
        b=qB/564eP9e124iiPhiu9B1x4ej7iVJNYSDOdqb8uM3hB2KrylRJV22aappdaICUM27
         Nd4GQvcwqhZdpH4SxwOeWNqqjD95N/9GJtKRIrUuhNt1HNzXgKCmz17iHZKfPZt+jwGp
         knCg+3ticVa1G8XSeWjSObtOMb6nCfCXnqYGNE/j0ahK1XbHivZZuq6P5ASf9zqsfGsK
         Ovi682O4O0N/71AKnvJ62tb/ekU7v2cOHbKH1aslD7NUW9VwtCXM9Jt+W59ZIpCOrPRa
         RVUhGFfeebtpUGb3khJNBx+EnHjKAu8W23wf+SZ8wMER3m4I5mpCnRkbd+LAN1fFZZHG
         +/Rw==
X-Forwarded-Encrypted: i=1; AKwUvBzmA9alOfbXT4qSN6RYbTZgewc5aKdlsb80/MMVMXYd56McspNxqPw5OCtfFj3EpmqNESe5nos+5uFcjbQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nwkM4egt1dJw12W0th/hdyoeQzhWgyqLKvWR/Zc7ukBdhTE0dP
	IAAoUQ1nb8EutuhXe31zHjmRmbVYCqS4SHPxzM14xs6uouFkCm608rwDmifbxSqvnt1mk3Bkc5g
	cXkt9KmEK6xJOQ5BXUCeQ9KYuLlKEYbpzCTMBnd6a
X-Gm-Gg: AYBFou3rT/q8mpkARJ9sRkbA3uYC6jRmfYdGuf3+nNlO7QOpQHeOf3qfZzeNzWHr/Cm
	sKKAPiGQFGfgz3nN+lDGOvI0hoka5aygqAVqZXWdgJIu8ftpwz/EGmsCtPW8OfP9PYewPc0DuwW
	zZdpG3zhC7ADUQ7PI2Mup4I5z6u1Q4QR1NHfmC+LZnbUCh/MJvhIujrMh3nhbiMxWu5Ctqg5pMI
	vTHndPaQ3qy9j5dCWa1raio36DD25neIxjeBy5vdML+4tYmE564lMAlnNI7QdHXYxvMxQEYGxtL
	zlE6RCp59FBd6luzUlyCN8nigYxHyyyQ4+tD37dA09qyNrMPAAE1gJv9DAelHiWu1B0Rqf4fbW6
	YnCfAELpNvy8=
X-Received: by 2002:a05:6a20:7f8e:b0:3dd:a196:907a with SMTP id
 adf61e73a8af0-3dda196a7a5mr6025808637.68.1789867553821; Sat, 19 Sep 2026
 18:25:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919215243.3472150-1-benquike@gmail.com>
In-Reply-To: <20260919215243.3472150-1-benquike@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 19 Sep 2026 21:25:42 -0400
X-Gm-Features: AcwNN1UUreSec9NyLkvaWFAQ9DB9RVlT6GgTGCc3Y8l3T4QYDUJMKR-P4SIbpMM
Message-ID: <CAHC9VhSxPmufV8Xve=kFX3kH6aBztyH9+tSynrXUEXcgTuw5Sw@mail.gmail.com>
Subject: Re: [PATCH] netlabel: cipso_v4: reject empty MLS level/cat lists and
 zero tail in cipso_v4_delopt()
To: Hui Peng <benquike@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 5:52=E2=80=AFPM Hui Peng <benquike@gmail.com> wrote=
:
>
> Fix three bugs in NetLabel CIPSOv4 handling:
>
> 1. In netlbl_cipsov4_add_std(), an empty NLBL_CIPSOV4_A_MLSLVLLST or
>    NLBL_CIPSOV4_A_MLSCATLST leaves local_size or cipso_size at 0, causing
>    kcalloc(0, ...) to return ZERO_SIZE_PTR (0x10), which bypasses NULL
>    checks and installs ZERO_SIZE_PTR arrays into cipso_v4_doi_list. Rejec=
t
>    0-sized level or category tables before allocation.
> 2. In netlbl_cipsov4_remove_cb(), also inspect NETLBL_NLTYPE_ADDRSELECT
>    entries so IPv4 address-selected domain mappings referencing a removed
>    CIPSOv4 DOI are properly cleaned up.
> 3. In cipso_v4_delopt(), zero the trailing cipso_len bytes with IPOPT_END
>    after memmove() and pass opt->opt.optlen - cipso_len to
>    cipso_v4_get_actual_opt_len() so stale tail bytes are not re-parsed.
>
> Fixes: 96cb8e3313c7 ("[NetLabel]: CIPSOv4 and Unlabeled packet integratio=
n")
> Fixes: 389fb800ac8b ("netlabel: Label incoming TCP connections correctly =
in SELinux")
> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>

Generally speaking, unless multiple problems are tightly related, one
patch should focus on fixing one problem.  As you have identified
three potential issues that don't appear to be related, please break
this patch up into three patches and resubmit.

Thanks.

> diff --git a/net/ipv4/cipso_ipv4.c b/net/ipv4/cipso_ipv4.c
> index a05aa075de1a..4ac1a4965abe 100644
> --- a/net/ipv4/cipso_ipv4.c
> +++ b/net/ipv4/cipso_ipv4.c
> @@ -2025,9 +2025,11 @@ static int cipso_v4_delopt(struct ip_options_rcu _=
_rcu **opt_ptr)
>
>                 memmove(cipso_ptr, cipso_ptr + cipso_len,
>                         opt->opt.optlen - cipso_off - cipso_len);
> +               memset(&opt->opt.__data[opt->opt.optlen - cipso_len],
> +                      IPOPT_END, cipso_len);
>
>                 optlen_new =3D cipso_v4_get_actual_opt_len(opt->opt.__dat=
a,
> -                                                        opt->opt.optlen)=
;
> +                                                        opt->opt.optlen =
- cipso_len);
>                 hdr_delta =3D opt->opt.optlen;
>                 opt->opt.optlen =3D (optlen_new + 3) & ~3;
>                 hdr_delta -=3D opt->opt.optlen;
> diff --git a/net/netlabel/netlabel_cipso_v4.c b/net/netlabel/netlabel_cip=
so_v4.c
> index b080e666523f..9bb28236b8fe 100644
> --- a/net/netlabel/netlabel_cipso_v4.c
> +++ b/net/netlabel/netlabel_cipso_v4.c
> @@ -185,6 +185,9 @@ static int netlbl_cipsov4_add_std(struct genl_info *i=
nfo,
>                                         break;
>                                 }
>                 }
> +       if (doi_def->map.std->lvl.local_size =3D=3D 0 ||
> +           doi_def->map.std->lvl.cipso_size =3D=3D 0)
> +               goto add_std_failure;
>         doi_def->map.std->lvl.local =3D kcalloc(doi_def->map.std->lvl.loc=
al_size,
>                                               sizeof(u32),
>                                               GFP_KERNEL | __GFP_NOWARN);
> @@ -260,6 +263,9 @@ static int netlbl_cipsov4_add_std(struct genl_info *i=
nfo,
>                                                 break;
>                                         }
>                         }
> +               if (doi_def->map.std->cat.local_size =3D=3D 0 ||
> +                   doi_def->map.std->cat.cipso_size =3D=3D 0)
> +                       goto add_std_failure;
>                 doi_def->map.std->cat.local =3D kcalloc(
>                                               doi_def->map.std->cat.local=
_size,
>                                               sizeof(u32),
> @@ -680,10 +686,21 @@ static int netlbl_cipsov4_listall(struct sk_buff *s=
kb,
>  static int netlbl_cipsov4_remove_cb(struct netlbl_dom_map *entry, void *=
arg)
>  {
>         struct netlbl_domhsh_walk_arg *cb_arg =3D arg;
> +       struct netlbl_af4list *iter4;
> +       struct netlbl_domaddr4_map *map4;
>
>         if (entry->def.type =3D=3D NETLBL_NLTYPE_CIPSOV4 &&
>             entry->def.cipso->doi =3D=3D cb_arg->doi)
>                 return netlbl_domhsh_remove_entry(entry, cb_arg->audit_in=
fo);
> +       else if (entry->def.type =3D=3D NETLBL_NLTYPE_ADDRSELECT) {
> +               netlbl_af4list_foreach_rcu(iter4, &entry->def.addrsel->li=
st4) {
> +                       map4 =3D netlbl_domhsh_addr4_entry(iter4);
> +                       if (map4->def.type =3D=3D NETLBL_NLTYPE_CIPSOV4 &=
&
> +                           map4->def.cipso->doi =3D=3D cb_arg->doi)
> +                               return netlbl_domhsh_remove_entry(entry,
> +                                                       cb_arg->audit_inf=
o);
> +               }
> +       }
>
>         return 0;
>  }



--=20
paul-moore.com
