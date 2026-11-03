Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793726792;
	b=aPhi4wGd5XsL4kvMe59Oo95tYCZ33btMyo8xMxmDfSzCfSqei2hrxfEz7NvvzptNEZkb
	 VyWNHht7Ek4Hqv4ZrOYo3VCzNJxNdK/+kQUD0UdYmLRut23/R7/Ujz1KEEoxW8BKWdJ9G
	 qru6UYElg7hQ0DRae9GLVfo7ql193nUSFNigNKhdXPvX/sBKKmpBvNW/PYzhwip53celz
	 4XzXDdMECaGeV2uotkylXpBIFdOgnFcNHgo/bTVYCj2UvkPAhMvr3gHzZe8bnwKHRyibv
	 qHCxGVZM1VdlGygmXuwM9j7XjQkGhVU+8F8mRLPnTB9uRAnBiGbn7yPaQjSP95Cs5lA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Du1dYmAEIjU/wRMW/hT4/9ifPXt3v8U5t/U9Ga24jm4=;
	b=ai8Hrqkz4QOfXbveRP/oxM+Bcn5FZtSmYGaZUpbIIO4KOdMHBDQv7sUhUcOzGtawybtf
	 R26qVWF9p11hROZZH2lFbpF7Lon8kD5mUGHxfWVKkCYzoVzmu5QWbybLNmYGIxWer4iXo
	 Yggj89q3vntP/8uTM2SWdcZBi9hhxip5PjSL4jjd9FSLxNsodBzeFq0VPzu31FEVzSE1l
	 cHgyHvmfiV0fISJoNbHYNHSSSsf4gwH638uueA8O9u+KWEMiwuBlnxKKJ8oy0by5nkZjs
	 gq5Sfax0Vwz1DIJKZCxRH+5pJ0Y0msf0JU90gpzWJEFCwzK5kYUYqOTXIFS+R+rckxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LdDhUAWg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BE3606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7BE3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LdDhUAWg
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac6971aaebso551896a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:26:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793726791; cv=none;
        d=google.com; s=arc-20260327;
        b=kZNeNoES5ONtHdhWb4lWH6Ow4SQHFCxrFvqa6WQqMvbUz6NckqMAIRfxeYNp5joDgW
         CZtGe94Hu4ee6XmXg3vExTH9oVcduf0P/Z9SguELRi4nhwPiNB441W99Z1345k0kyaXs
         8vzIz2Z13SW270VyhEQZ4zZ5S7cuAAM3axTNXOf/I/psiXuiKREzIvGvK1BoxSxzUpT0
         mcoc29CEL0o9OhGruUVW+9pS8+zmcHpN2GDgZeKCBbDuGn5Vo6oSP4/M7bQ05JIQvzOn
         cn64rhgZclIDGL8oY7sMib1hb5bqc4P3qqe2u/uJL4XzADqWoj9QfBU1dM55IDbqMeWw
         6Pxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Du1dYmAEIjU/wRMW/hT4/9ifPXt3v8U5t/U9Ga24jm4=;
        fh=htito9t5jykNX77FkAFGJpmP91EGOOh3c42h3S1EZ0s=;
        b=B2htvGnTEKNE6RUa87+YQnKCnabKGIx2QFncR2BPEoWBOTBoln3eHg6gCbm126cF/9
         hhyx4+RcredaAW6Y2up8AkWpRU4ekhBmyCEk8eV5jEEmTHcfkhnzmdO0855fD+UoVzoU
         WFQLUEjCrq249kf+NuIIc8OaXMEULkXG0BvYwH74Uu48GWrxyUNzq6dSS/SX2gElaSjc
         4dT1cYyxlYHGRT7c2GbQ8ue7BXXYBghQHyOErbjCOjLCZKPWTHu7FUmBt4dDp56kJCRF
         FQZvwJRjKnbBQkTu68+O564J+StWG3Wd6ipOFi2+LmXy0en94USKD+HrhjD/L8+8q7PM
         akNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793726791; x=1794331591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Du1dYmAEIjU/wRMW/hT4/9ifPXt3v8U5t/U9Ga24jm4=;
        b=LdDhUAWg9QGFe1DmPvwvUwRDYjDatZYanXADA/NReZK6rcxQyiJT5jYH6lB56t67TI
         gJRb2xAkitTQ0vzRsYG0836o0MQyydWY7WGWrOE9hUxktayjRFiSfMsLwEgSyTsAtkUe
         WYoCo5dg3jaTjaz4stf8KWmMBUeNRAFBA+xS0MXSPaS433OTzLQPEBuTszrIWEQog4lf
         R8P1DZfkS/+6l0wGgEhTSWqFj3mfDxzQXnoH+i/HIKEyqn/ei6oVsH6vYasjOy5PFWrB
         FwVqNXk2OlFvjDYLVs4laV2/csUG1oOcyi4hoBEI1tB8GzakR8YcOK8OI3asgdS9+lX7
         F/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726791; x=1794331591;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Du1dYmAEIjU/wRMW/hT4/9ifPXt3v8U5t/U9Ga24jm4=;
        b=kTQ4VXo4z6Lw0oNRPijQcNZHkdwCo4iHwyR2zCuC1Kzs4AaoJG/pDsmwYOfRvCyb5s
         lg5L2PTszhuH4gXBN6RBMzxP2tyo1eCUwIN8IsiSnGxMHB+tcRnH6noFD9rKfi1wT6OT
         eKRkxpM7gEcJ+q4ELfr5QffuvOSlAd3ISaWAa1488NLwwCckNvItZnnT3huvew6zeMp/
         cnVJktkaZtlBUWzshXZEjlLtZuFUa0pLpOGH4H5GOnz9fY/5Ol0/tkdT6SRdSwpI0AQN
         aPRzF+DtakHt1FfhxUKZx28t0W2V/8BFSdd3TWU7g7oESWfMOj8XY/CLItyCpionmQhZ
         Noqg==
X-Forwarded-Encrypted: i=1; AKwUvBzUtf05nn1AweAz/GgBvOlMSMys5EVzH7rTGFV0VFwB2Z7+e8q4JwiQXRsF88HHF3VHHt/YMtpInHsGD+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UYKZdjHtwZfbBMT4rJvXsNz+dFBsRzUAn1a8LNHyxVM9KJaYH
	bT5n2ALEZeNfDTaI1Rh2eCBIJQL9yKnIRFSrL86eUQYmlpxVCcPFsJwvmqMgl5LceXkStV3Ajav
	LnTwfCAsQrDwVpiflyQUHHC94R7ld7Xg=
X-Gm-Gg: AYBFou3RwP2JVT4/CQ0rEeH47HGMrwOI8Ktq6slcqe5XugN6nX5z92tHnCM5l4H99XM
	8k+gN6tZG5/SuS8BMgiPg65RYL66rPyQYbpt+67cecyk2Y5ywvp/Q+/JiqWQ3SyO+YmFnYiBTO1
	i+3kcxFc4J035NUueXJIhDMdVTTNumvayY1+FDhR+Dy0Syqbbq4hQyxcvmKbOBsE1mCcOH35VW9
	wSVLO9eMLkeydgAFh2OrnL+PJ/mB/2t81y2BP+iJYlC0x9cuZI1QTcOFhO36qNwvau8NzGWRg9M
	mCRqhzu0NmW9OzVkYEC7fE17+3DWHEGpcRLkN3dBOjNMeUnoeauqkoyfT9Dz5lVPj5mZcKyZiHh
	rB2ZtYdwkW5sJy9enVssn7ydS3Uc1fCFA2zVLmcSiIl4V1sexXEIlSq3xeTZ7hH+ZPBDvpw==
X-Received: by 2002:a17:90b:4fc5:b0:3a8:9db2:a59 with SMTP id
 98e67ed59e1d1-3ae891891f1mr19517383a91.0.1793726790902; Tue, 03 Nov 2026
 09:26:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAH78GvvERK9_hkKDa=Td8vK_89kZ4SPRb9J6UW5L0sMRPiUOBA@mail.gmail.com>
 <20260902160138.74264-1-q.h.hack.winter@gmail.com>
In-Reply-To: <20260902160138.74264-1-q.h.hack.winter@gmail.com>
From: Qihang <q.h.hack.winter@gmail.com>
Date: Wed, 4 Nov 2026 01:26:18 +0800
X-Gm-Features: AclHuK--nKWXdJglkScekuK5_WWAKnmqv-ZdrsU-pmle2Fh4cRLayvnTLKLphX8
Message-ID: <CAH78GvserydO+NtvgeRsgBwdc7XxrodQpcdV23xCdjWSnr=aQw@mail.gmail.com>
Subject: Re: [PATCH] apparmor: make unpacked rename and attach strings owned copies
To: john.johansen@canonical.com, georgia.garcia@canonical.com
Cc: apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,

Just a quick ping on this patch.

Thanks, Qihang

On Thu, Sep 3, 2026 at 12:02=E2=80=AFAM Qihang <q.h.hack.winter@gmail.com> =
wrote:
>
> unpack_profile() stores the optional rename and attach strings using
> aa_unpack_str(), which returns pointers into the policy blob.
> profile->rename is later freed with kfree_sensitive(), causing an
> invalid free of an interior pointer on the failed-unpack path.
> profile->attach.xmatch_str can instead become a dangling pointer when
> the original policy blob is freed after compressed binary policy export.
> Use aa_unpack_strdup() for both strings and free xmatch_str with the
> attachment.
>
> Fixes: 736ec752d95e9 ("AppArmor: policy routines for loading and unpackin=
g policy")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
> ---
>  security/apparmor/policy.c        | 1 +
>  security/apparmor/policy_unpack.c | 7 +++++--
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
> index 94b4a7e727cc1..e9993cd53c903 100644
> --- a/security/apparmor/policy.c
> +++ b/security/apparmor/policy.c
> @@ -281,6 +281,7 @@ static void free_attachment(struct aa_attachment *att=
ach)
>         for (i =3D 0; i < attach->xattr_count; i++)
>                 kfree_sensitive(attach->xattrs[i]);
>         kfree_sensitive(attach->xattrs);
> +       kfree_sensitive(attach->xmatch_str);
>         aa_put_pdb(attach->xmatch);
>  }
>
> diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy=
_unpack.c
> index d9dcff167c480..9b534d56e38a5 100644
> --- a/security/apparmor/policy_unpack.c
> +++ b/security/apparmor/policy_unpack.c
> @@ -1120,6 +1120,7 @@ static struct aa_profile *unpack_profile(struct aa_=
ext *e, char **ns_name)
>         size_t ns_len;
>         struct rhashtable_params params =3D { 0 };
>         char *key =3D NULL, *disconnected =3D NULL;
> +       char *rename =3D NULL, *attach_str =3D NULL;
>         struct aa_data *data;
>         int error =3D -EPROTO;
>         kernel_cap_t tmpcap;
> @@ -1159,10 +1160,12 @@ static struct aa_profile *unpack_profile(struct a=
a_ext *e, char **ns_name)
>         rules =3D profile->label.rules[0];
>
>         /* profile renaming is optional */
> -       (void) aa_unpack_str(e, &profile->rename, "rename");
> +       (void) aa_unpack_strdup(e, &rename, "rename");
> +       profile->rename =3D rename;
>
>         /* attachment string is optional */
> -       (void) aa_unpack_str(e, &profile->attach.xmatch_str, "attach");
> +       (void) aa_unpack_strdup(e, &attach_str, "attach");
> +       profile->attach.xmatch_str =3D attach_str;
>
>         /* xmatch is optional and may be NULL */
>         error =3D unpack_pdb(e, &profile->attach.xmatch, false, false, &i=
nfo);
> --
> 2.50.1 (Apple Git-155)
>
