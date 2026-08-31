Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9FF3EDAD2
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788178566; cv=pass; b=rW4/6NZFIW2bV8Acs8PGo/VyaeZRayTz8IFk0mNgmYW3QJPiOodSMdd1DPf0vhpN0zrU8Y7dhvlVNrD3YNlh5tKVdhtnIL6W2M4Q/3PqzK+3c0eUHgsPXErAY5RoTRZt04n6py+Vnk3sW1up++wnNHO3P2onqW9jm22EEEEfhzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788178566; c=relaxed/simple;
	bh=mmERPczqrfVQh8tUhnvaPBll2oUM/xpRVzVN+xWRmPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JzUqEelU4s9zAkoPl0MmRto3u8P6r47OsebsEVKEmz/E8It8l4FLF8iWi8uP8cDQRXhC0oSUFAHGQh6xavKMKEtoiIz5VnKAgf3jBY/VARG+U9E/SsR3XuI/eUzf7GLxeMXCPocJfuYCE/X4xuK9eb78XeH4sobg7h5E1bFx+a8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=YhdV+TDM; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="YhdV+TDM"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a309f92daaso23102101fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:16:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788178563; cv=none;
        d=google.com; s=arc-20260327;
        b=hEljEvBYnixtEEsT22/xIDVasDXhdRDvxd9nbEp9bzDe2r84FHxBl1Cdxgh8AwuY5+
         Nos13BDKscZDML8/EfeFtj9Wfm4twRULJhSKxJTcHLhq/oQqu42QlrYRGwUUIFIcKc5K
         1joF+LmR8sXtclmm7z1OCOUz5GRZjto5U/pVqm1/jzXYpHLPqGR/QErznSodP5/9aI0H
         yDi0ZX34Hm5aQ3YcyDCPlMynTyEsUB6sbTHNOaFCVCLYZXNKGF7yeLwP0CtmMikLfCM9
         CH4TBtG7z2cYxBhCwHPiF0LeaeLlk+87fV5KUAU/FlL370LlE2ykMbtn2z2NVgThez0g
         4yyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E2fspwe7pTek3z4ZZ2gaIFnlooj5wzCDQHD2ngploqQ=;
        fh=W5r223fVzFEyqr/X1ZpdPDpghEdb1aIDZssp17IIQpE=;
        b=sxO2z5I4q2qcxsb5uhw2KdR2uvPKdVCTJQ3YEX66xgTbcqqN5q3WwsD099PxTRIGaT
         mLNWEXNpnQA/QJJBezxvFTrTryldWKg781ACG50jAFkNP+1gj9EFBFDYJdGNpzRrTpvs
         w1WCKwIs3odMpJ7LYo+JYOL5zr7c2LBlvJUSV2UoPRsHbfQ04wVnJRYEk2pvsHHxHL3n
         /d1xHJCIzyKxCvSTmqBhpMJtIrd+rxxka0fZWVE46W55XS45Dz5FngJne4FCKW02Ap40
         b4oClZpBG8ePo0nNlRhcnIbPzxtNTLasJeAAppT5MwOeLnyMtaITiGThg/8gzzkMSWOd
         0WjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788178563; x=1788783363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E2fspwe7pTek3z4ZZ2gaIFnlooj5wzCDQHD2ngploqQ=;
        b=YhdV+TDMZOi2hS/Llj4tvZ9jvMK1ld9JgNg6+80IHzXcRLiualv+0rKV92iA+Wmllw
         NcPPvumaPEm8ucBHgYYTBZBrfFgEaa9Xi1iEEr7mqt2Qs0A9efZTLOeP2Gq6v7fofVDi
         g3TdE+oKZiHoPCJGHZpLEzTdRvkOGSnPAecNeQGagdfQb54lvQjyRgkg/Kdj8eODbGD+
         W2fNT8o6KM7tkrX/LP+b07Sn7zz05dpPfXv1Nwf44eIheQRTK1mIosex4YfcTa4q7AXF
         b3mlUtjQLGOFSQXRpFc5KWs5MBp5VsQrTjGvsCGzsV8nz5AhrFaKd6cnpsnM6wgScdoU
         0O0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788178563; x=1788783363;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E2fspwe7pTek3z4ZZ2gaIFnlooj5wzCDQHD2ngploqQ=;
        b=G0V+GMgYPLTd3L7VZTsm+DswPK/H/0Y26QX8CkfyKWIJtyBg4UOuuK9HoWDe1ydmbl
         jWmSmIJqSiO+2pFWz8M+ViFxnL3RYkDR5/e28LGX6KRhnE7fD6apMUz1H5w8Kk7+0yxJ
         poXHKXnIbmpOTSFosWbEy2m5HeU7mMezLFIpfKrPm9jjNjF5IO3yoeOr4uhsnKd9HWib
         npibiBRbinThoIgdoU2MjofplLlxufNgOAhycA8XUbsckAdc21KSm2zQxdKRVu+mVSGn
         TS8/JnnEeMhAPoQjdGRMhn9QrcjqoB2JDfdryF44MHGOToYdVD6o+uyaN/zLOKrEFXQf
         OdBQ==
X-Forwarded-Encrypted: i=1; AKwUvBz26LQOdujbG7fUlg0kfPm05T1zCZAHpJKG7GuYSmJcHlN8tJZ+DaHWPPtu3e0F3Lhl8Oq6A9RIDwOtYBA=@vger.kernel.org
X-Gm-Message-State: AFuF++ndraPF7wWtbMYih5NmlqXBS5CVo2eG9/Jy2WRSaTx8bXDr5sZM
	OpR3melM32qU6UIaXhD+joOJ9zEYuo2cks38xiZeNFo3ZG1HtQQyUFDZBbRRtkl48ZO7QPiPLhJ
	WuUEua57IqATJrvS/I9TwMYsDxV6fGG8k9f1I3dZILCEMrRbubA/8GweKw5FEuQ==
X-Gm-Gg: AYBFou07fw4ScpF8X6D4KbrrojWVoiV/ts5qGmGGEtz5K7Tso8BK3+dVdJhobLo5FNO
	7wgie1P0Id7pOkss+4nUNyqai/qtTd6lTaetKXVDP8CGEc0Un9z6AdmHbPPMgRfbbAoplOLrA1R
	oR/VFmbBQ+dq1kFESrtLi5V8dlW6aC1+shMQdKRCAwA5LerqfEAde+xAMYLug2Twzl4y1VQFM6A
	65KH6QepwjEOkl9zqeaLwCQ00DIBflFTd9kM/LyEAbq1NJLYEAwkVNxWdlb/vBU3t5JuI83Wpb8
	utGNbJiYEuVQxXOsDiJxg/sNkEUq0hs6x577xRiSWdZyJDSQuL1lkIAvzJWy6kZIkQHKngfKzS0
	b
X-Received: by 2002:a2e:a550:0:b0:3a3:476:2e37 with SMTP id
 38308e7fff4ca-3a304764657mr47943831fa.6.1788178562237; Mon, 31 Aug 2026
 05:16:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787982246.git.zihanx@nebusec.ai> <0a00492a13038b268c1e0a219c138d07cfab92b3.1787982246.git.zihanx@nebusec.ai>
 <20260831110647.GA3202627@shredder>
In-Reply-To: <20260831110647.GA3202627@shredder>
From: zihan xi <zihanx@nebusec.ai>
Date: Mon, 31 Aug 2026 20:15:49 +0800
X-Gm-Features: AcwNN1VxMrcdoN8MorTbHscYSmLJXYJbfD7TkDzZUF5Xn6YLbbDtN9fpaNcxbz4
Message-ID: <CAANe3eSrMbEiuBEeanOHomSGt=y+m58pwVyHGBfe4GaG0mXOCA@mail.gmail.com>
Subject: Re: [PATCH net 1/1] ipv4: fib: avoid quadratic table ID lookup
To: Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Ahern <dsahern@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Patrick McHardy <kaber@trash.net>, stable@vger.kernel.org, 
	Vega <vega@nebusec.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 7:07=E2=80=AFPM Ido Schimmel <idosch@nvidia.com> wr=
ote:
>
> On Sat, Aug 29, 2026 at 06:24:57AM +0000, Zihan Xi wrote:
> > fib_empty_table() probes every table ID from 1 until it finds a free
> > one.  Since IPv4 tables are stored in a 256-bucket hash table, a dense
> > set of IDs makes the probes repeatedly walk growing hash chains while
> > RTNL is held.
> >
> > Count the existing tables once and use a bitmap for the bounded range
> > that can contain the first free ID.  This keeps table-ID selection
> > linear in the number of tables instead of quadratic, without changing
> > the lowest-free-ID behavior.
>
> TBH, I wasn't even aware of this "table 0" functionality and I'm quite
> certain it's unused nowadays:
>
> 1. IPv4 specific:
>
> # ip -6 rule add from 2001:db8:1::1 table 0
> Error: Invalid table.
>
> 2. Not documented in ip-rule man page:
>
> "
> table TABLEID
>        the routing table identifier to lookup if the rule selector
>        matches. It is also possible to use lookup instead of table.
> "
>
> 3. No kernel selftests despite ip-rule having good coverage.
>
> 4. Quirky. Requires dumping the rules or listening to netlink
> notifications to discover the allocated table ID.
>
> So, for now, I suggest bounding the maximum table ID that can be
> automatically allocated. Something like [1]. I will add a deprecation
> warning in net-next.
>

Thanks for the review and the suggested patch.

I wasn't aware how unused this automatic table-0 assignment is either.
I'll drop the bitmap rewrite and send a v2 that just caps the
automatically allocated ID at 4096 as you proposed.

> FTR, I did consider storing the tables in something like xarray, but:
>
> 1. We would still need to keep the hash table given the analysis Jakub
> shared in commit 759ab1edb56c ("net: store netdevs in an xarray").
> Xarray only starts being worthwhile at around 1k tables and most
> deployments never reach this number.
>
> 2. It requires adding per-netns xarray for a functionality that is
> unlikely to be used today.
>

Agreed, bounding the auto-allocation is the simpler fix here.

Thanks,
Zihan

> [1]
> diff --git a/net/ipv4/fib_rules.c b/net/ipv4/fib_rules.c
> index 4edb0dca7be8..2e8629df34bb 100644
> --- a/net/ipv4/fib_rules.c
> +++ b/net/ipv4/fib_rules.c
> @@ -214,6 +214,8 @@ INDIRECT_CALLABLE_SCOPE int fib4_rule_match(struct fi=
b_rule *rule,
>         return 1;
>  }
>
> +#define FIB_MAX_AUTO_TABLE_ID  4096
> +
>  static struct fib_table *fib_empty_table(struct net *net)
>  {
>         u32 id =3D 1;
> @@ -222,7 +224,7 @@ static struct fib_table *fib_empty_table(struct net *=
net)
>                 if (!fib_get_table(net, id))
>                         return fib_new_table(net, id);
>
> -               if (id++ =3D=3D RT_TABLE_MAX)
> +               if (id++ =3D=3D FIB_MAX_AUTO_TABLE_ID)
>                         break;
>         }
>         return NULL;
>
