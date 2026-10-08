Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0572F3C19
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486968; cv=pass; b=V0LEzPJ700knAFkswg3RGXNARCZQUmUANUpWBLkROmjNvjHOkIxbet6lwNoBCKHZ/mJMlHQ30wuNR+Ldwh3A27SR6LBb96WAZSaQeIVFDtTsfZrM3S3MGZdpKmN46jOcJnz5MWPoes1XLoZjAyKDOC4BKXkGqBsXlkNMXAZ5vtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486968; c=relaxed/simple;
	bh=K5Lzp/jJC9s1zl3hyzvLKMRSNcWeuGGp7Gp8oRt5eRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AAUxDkcWG+GK6admQBAHnqil+xqwH6b4sPjXsMEyVRtGoL7JZZhZaT46x0EFsZRT7Zg3jlFbyXUv+sHECw0sGhJXym4UGNcKccLf7pFejf7rGViwMgeRhUFY+56jRLDRSgHb+L3LKPa0x+aceWqauK6ddfcdJdRgXnlI5PhihXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SIjPqiW2; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SIjPqiW2"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a9787a15bdso27416511fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:16:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791486965; cv=none;
        d=google.com; s=arc-20260327;
        b=d2HsgNa5ZdQ4tirCa6Q1DrWHlppmtrGfXw9rGUMYpN4XD9Ivtu5sugkXrlycUTKAnJ
         hyNIFRkqvrURm4xPQkywBsPFqIvVSBqkA8DzEjMa/uEKuREG52qMBjA7o72eJEfO6hnR
         /q+oivbSTCJOv/AHQxH9ECpW27kQKz53BKB4gmxp8b2tzdClHc1Nd06NYbgNEQIUbYFB
         804d9nCWvlOrUM9gOKicl9/Yozdf8GPt9+pwbsjHVXTLE4AppmK6//aG1LBo5rSQFKzt
         ZhswQJnVZ9jLK0Y71KqzDwvDr4ErlBzQ5J3HLytL+tty6Dii+FkLk0OEtwwo9wGyuAZy
         XhlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vHNgfkuwp3jFs7mDECGk1Qye3hSH8mafgl8fIqaQf2c=;
        fh=SlhajDnRe2KqIluplm6eZLRbuPa4yAioEyM4K85ZoPs=;
        b=iPw4aPC5M+Ew8JoDbbc/4iwD8d5tfPtJa5s5lOdjN+QRGOLtldUQGbBZq6pajfvikY
         SpRv5i4RdO4krpBw1r2CVMsZDp7IcHur27A/Yq4T7F26rRpOh0yRd7nRGK0VwNTMAfN6
         ylRgY+jgerQQvTOmMU5I7D+hubLBr9mhq9jivkXjKNAnS/yW/DsSDFymJyhAlVDQv2Fx
         cjHquPQwovFvVxOkrH4Ese28fo86fVqOfv+fNbYh1xGRU+tEbAhsKop1RzL/vEkdSksU
         YYXvEowSEw2jUM9ObJjcgFKFR6Lo5LhLiBJjdUq0oO1pZ3lYxgRfnCzrUeSoPV8NF3/2
         USZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791486965; x=1792091765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vHNgfkuwp3jFs7mDECGk1Qye3hSH8mafgl8fIqaQf2c=;
        b=SIjPqiW258jkLCEAMGeTh/xiMEMS+VqcxARxVOdX64oFJXbBKBptE0zcJBUJs+azEQ
         257u7b0dg/NGcoDyb4A/LTwGtpZjozI4fLs5mJypal7D49UgtoZV31R+gbQaKpqxgsx5
         UZvRHPD4NyXL09+cexuMjMXeKH0lyegGs9Gv50xkEzgQSfA4UDygmfe/tkBSAQey5cHM
         ZNEW7L6jukNOyf7I9q7dqudktgfqvPjwRzoVfG0E0dsXuBLUz/o0FPx1gxvXgNWWBseL
         c/taudb8FK52JKtbGBsQcghG/+m8bLuVT8e3f8O6dLiwlSRR2dq4NHSaA0wZeEaB6/Gw
         gbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791486965; x=1792091765;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHNgfkuwp3jFs7mDECGk1Qye3hSH8mafgl8fIqaQf2c=;
        b=OIappEfnsLHoZQOLFjNeDAULdS2HyjHcZTslkwuXx7zO8ViBh2TA/gr4lx9boQHaqW
         ry4hDJowOdoUCjMDtOoOELUFZvg8wtjPWm04IjCUC+hDJATLEJQgpIv/+6S0pn+T8Pb1
         uJib1WzUm9NpA/rjY0v/CCiFfWOvoHaNqpNVTYN6M5FMZHgfxfq3MKP6+wFn89cKzDet
         VPd6fOBTzueT/cB1leAp2Ky2X1kBjn2wt9JIdZKpdjgLn7AN7JSCEqNIwJFz2X+gJ8nA
         YyGKsLoTvg0CJ+Lj0Wsc2qceWcWpPiiZH9WPVDt/2BIZsKi+Tt6uKrQZlpd5IgH/mxKK
         RfJA==
X-Forwarded-Encrypted: i=1; AKwUvByOyEA5Fm8SsrC9yrVp9se6whBlPloRuiFvBZ/aEvkf2D2Z+xLVuP824NEchR2omWxWDDErgPIj5O4ogts=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgUUj2v8K3R0ha5dqP7FdGCl+vHToSH2pcgiEMtVNprBOGCaul
	RHDgBglLK/hugJlnJFCn+6tTTASD3vDNZBxcMGHDKzbH7yX8mfg+TE5BeQ38hF3e30orc880/Uu
	+QqO/a76dlCz8LX1nwxKD8pQDQ8lmNuiDTtys+848
X-Gm-Gg: AYBFou3KT6IVyiPLMBaTdMbBoC5Ep0ocvNupWpeOqKM/pGos/j2BcNLUu+c85TZSQv2
	zo+mRoQIj46P5LChzwUGbBvOIadcwePCLrLjlyYPOtnO3od12m2iYqOs9rM4UU96ekQbkCtIoa/
	wLEwIxBGDfojUPcVp8GVfKtnY8m1n3WULkxemixEmwz1cT1t5KCfp8w5Os9rWjsdUhdZ6s5d8fT
	zSAyKIA7PR+NmvxB99/aXl8JhomFI1LowVW1J9LgKTNWxntL/7Gd1Oc2/9L07Gd0Vdaz4ZyAb7d
	wGEK3Y/TU0BqXU7trFAfGZgqV5MVnzF9EEzEp+Vcy6E7ZJnNA3B5rD9gtaNyBHwBPGwE4EJ7zSe
	sgJnaQAm3O+gB76PsA4j+ntfQKKQAi5nRq2p6XrFprw==
X-Received: by 2002:a2e:a7c1:0:b0:3a9:849c:b169 with SMTP id
 38308e7fff4ca-3a9a2ccce5emr14774661fa.26.1791486964690; Thu, 08 Oct 2026
 12:16:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008173334.2881475-1-brianvv@google.com>
In-Reply-To: <20261008173334.2881475-1-brianvv@google.com>
From: Li Li <boolli@google.com>
Date: Thu, 8 Oct 2026 12:15:51 -0700
X-Gm-Features: AclHuK8hC5pBINOHNd6sNHM56enXqSpYjYbwB1ohtsEoxneiKD6Ai1AkI3QhDQY
Message-ID: <CAODvEq4UbfswP9fQdbjOvwiDE2bopLPxiBHr-5+e40p=OVpkrA@mail.gmail.com>
Subject: Re: [iwl-net PATCH] idpf: wait for the reset completed state in idpf_check_reset_complete()
To: Brian Vazquez <brianvv@google.com>
Cc: Brian Vazquez <brianvv.kernel@gmail.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, intel-wired-lan@lists.osuosl.org, 
	netdev@vger.kernel.org, Madhu Chittim <madhu.chittim@intel.com>, 
	Pavan Kumar Linga <pavan.kumar.linga@intel.com>, Joshua Hay <joshua.a.hay@intel.com>, 
	Shailendra Bhatnagar <shailendra.bhatnagar@intel.com>, 
	Sridhar Samudrala <sridhar.samudrala@intel.com>, linux-kernel@vger.kernel.org, 
	David Decotigny <decot@google.com>, Emil Tantilov <emil.s.tantilov@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Li Li <boolli@google.com>


On Thu, Oct 8, 2026 at 10:33=E2=80=AFAM Brian Vazquez <brianvv@google.com> =
wrote:
>
> PFGEN_RSTAT[1:0] / VFGEN_RSTAT[1:0] (PFR_STATE / VFR_STATE) encode the
> function reset progress as a 2-bit state, not a flag:
>
>   00b - reset in progress
>   01b - reset completed, written by the control plane
>   10b - function active, written by the control plane once the function
>         has completed VIRTCHNL2_OP_VERSION
>   11b - reserved
>
> idpf_check_reset_complete() tests (reg_val & rstat_m) as a boolean, with
> rstat_m =3D GENMASK(1, 0), so any non-zero state is taken as "completed",
> although only 01b carries that meaning.
>
> That only works if hardware moves the field to 00b as soon as the reset
> is triggered. On the devices tested it does not: PFSWR transitions
> PFR_STATE to 00b only when the field currently reads 01b. When the
> function is active (10b) the field keeps its value until the control
> plane finishes the reset and writes 01b, which takes a few hundred
> milliseconds.
>
> Consequently, on a hard reset of an active function
> (IDPF_HR_FUNC_RESET) the first poll sees 10b, returns immediately, the
> driver re-creates the mailbox and sends VIRTCHNL2_OP_VERSION while the
> reset is still being processed. The control plane tears the mailbox
> down underneath it, VERSION is never answered, and the driver sits in a
> 60 second virtchnl timeout (-ETIME) before going through a second hard
> reset which then succeeds.
>
> Make idpf_check_reset_complete() wait for the state to be exactly 01b.
> This is the stricter reading of the register definition and it does not
> depend on how the field got to its current value: functions that are
> still in progress (00b) or active (10b) keep polling until the control
> plane reports completion.
>
> Fixes: 8077c727561a ("idpf: add controlq init and reset checks")
> Signed-off-by: Brian Vazquez <brianvv@google.com>
> ---
>  drivers/net/ethernet/intel/idpf/idpf.h     | 2 ++
>  drivers/net/ethernet/intel/idpf/idpf_lib.c | 3 ++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/intel/idpf/idpf.h b/drivers/net/etherne=
t/intel/idpf/idpf.h
> index 470bc23c844c..ce8a1bd0ec8b 100644
> --- a/drivers/net/ethernet/intel/idpf/idpf.h
> +++ b/drivers/net/ethernet/intel/idpf/idpf.h
> @@ -166,6 +166,8 @@ struct idpf_netdev_priv {
>         spinlock_t stats_lock;
>  };
>
> +#define IDPF_RSTAT_COMPLETE            0x01
> +
>  /**
>   * struct idpf_reset_reg - Reset register offsets/masks
>   * @rstat: Reset status register
> diff --git a/drivers/net/ethernet/intel/idpf/idpf_lib.c b/drivers/net/eth=
ernet/intel/idpf/idpf_lib.c
> index 2c148377540c..a827e0fa67c8 100644
> --- a/drivers/net/ethernet/intel/idpf/idpf_lib.c
> +++ b/drivers/net/ethernet/intel/idpf/idpf_lib.c
> @@ -1870,7 +1870,8 @@ static int idpf_check_reset_complete(struct idpf_ad=
apter *adapter,
>                  * register for us yet and 0xFFFFFFFF is not a valid valu=
e for
>                  * the register, so treat that as invalid.
>                  */
> -               if (reg_val !=3D 0xFFFFFFFF && (reg_val & reset_reg->rsta=
t_m))
> +               if (reg_val !=3D 0xFFFFFFFF &&
> +                   (reg_val & reset_reg->rstat_m) =3D=3D IDPF_RSTAT_COMP=
LETE)
>                         return 0;
>
>                 usleep_range(5000, 10000);
> --
> 2.56.0.385.gd3acb90ef8-goog
>
