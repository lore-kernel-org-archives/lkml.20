Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234574C650E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790626368; cv=pass; b=PjK1OH/vvs/r3UKgmXd1gtx2bRF5alj/p//WvvUvmEE5nzaZag+FtFV56OvxOPTu9RdMDzwQSP0TIv6QM1CqjzoUv62UovVxzJklpoN+Vd/OrIEHAegTpPQnigYAcyMrPkjYfJ2g6LUy1KyTFmm/wVlwZ0kCvSFku5Tb7tWCPT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790626368; c=relaxed/simple;
	bh=LYplrdyBy/ve1B9b3/A0Q3qNi6+XTJGeLMxYSFaxX+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SiZJcjRtcfDnvjCMN9dEaySoqO3sl2cb55qoZJJgHLjkPIGGMH5BIcpnsFLDwF+5/CD5SCsq/Ep29Fx7WU4dnplmAtYH03zKG2G+eHeqGrq7rZrbnz7/mXmcdKiObDeZ3GlwWrSrWW49a00QntGi+dQQzIcvy6cT5B73McFoVFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFd+iOdL; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFd+iOdL"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2afb4e9977so389908966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:12:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790626362; cv=none;
        d=google.com; s=arc-20260327;
        b=o2hegER4AW2yzMUdA/Qm2w44ut/ZvdHgqxwshqvYgw6bbSL0g73p1HR3ppLXbYYTkb
         YRPl/KgB0cndHY8nyBjJVkRchyOna8EBDqlQ97YJmoiMjRDnLYmBKMd7uRHipEcklOQi
         LZTLuxnjaqSMr/JvkfSJjOQ1+7qhyu0IspEfEewzoYimfVIq0Q3aw1OF8UOPWj6wD0Un
         G11Lc6ONyUD37AGznRQrbzxAFzfHygBQ9BZQeDgHHlAq+sO/F+x/l0DQgi+7s8lhe4xm
         zXig7g70gXynmOhyz2NjgWK2n65eGVph0WHCpwSuO57DZtHMbttqcq1OHkrXh3iltSS7
         Oe8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=op3YdKxjJPB63dQXpqOAe1ZN2m+ULaXvCzt5oEDNYyM=;
        fh=qak8qLwHvbgxRzQVbu2bauQa9YGElq7iKm1jAcYt+Pc=;
        b=k2An/QFs8E60SAhBDHrS0BL00mr5u16vyhMHOoxI1K5KDBeRrE0laWRChNquCF9tRT
         SAcXEyR+q7jfRxX9BCCzmpuDIN1R2RA9uMKHucvRUIcBowHN3JNO+z/mcYk1K2pgM5jC
         7GvIp062EHOtnpjWHI0q3Coq6SISP72MLBEIMoH9Ac8+yAe/3s5spiHv7kaPALoRWJgF
         HW7kx4EJzbsdBuJsMXRaoCpOuJe18LbZIoYOSRm8+NgG3bPPtPYMk4ZIrCMEpOqi2Npl
         Yu1NEfZGNQyTwzEQWxjOPxx2MrqDhJswUU/BjKFdcBFyUtm1tKNZLiOYkYe+2IBLv5cw
         Peow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790626362; x=1791231162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=op3YdKxjJPB63dQXpqOAe1ZN2m+ULaXvCzt5oEDNYyM=;
        b=cFd+iOdLI45sRnZVAbchIr3Yj+myKDsj5iXol4CaUTAd0+IT9u34qXPGCOmkOQjKtM
         Qid/vorez+NvJnemvwo2x2MWLzXCM3Xxsh/rnJ1LV7A5rNAG8ayU0ePQ9mjpolagtrWl
         GU+FIAUac8Gr2JfE6YqhQ8UugaeWOzCdJJkDbYBVafvk24vyYsWkWwXGKZPEhHZM6Lia
         OaPGHcX4RFzw1VUxmAT8LhaEKMV0MQCwXwdOoFLQbbEfT9PRYR3uJrCGuxwJ3pWOHyqZ
         yf7xtF2SBhqopJXiZFdQhChCd5Ycgcvd0h1F6/0B/LvLh6Yx12O6G8yM2HfBwpaQc3gk
         U3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790626362; x=1791231162;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=op3YdKxjJPB63dQXpqOAe1ZN2m+ULaXvCzt5oEDNYyM=;
        b=2BVWIxajWgYuOqzSAPm1YKaCqIFw/wRjv1eW/gJGNgnFe4OUVj0w5yWhJev8WiCzqU
         cg22dGegqYzD+FLmDDFzzpocQP3MX0s0RIMVm9zi/fRaDvBs5qPbqR4J3p4s0hLPVxks
         f6IywD70NTpIP2JomrxLY/HIcv2Tz1r01iOVM7iw5dvsKbFPjZBRLgbf3zOvvkQK5ry+
         i5Lq2a3uTxo62zfxPmn7nKvsz97jRCn9f1V7PQ96aN88GtzQLif0oXaWL9uNUvSIUM+1
         xIxBk7JDvGBcNGBGM5kfDRNCAB/6mjhGrr8ohY3daOQR5cimEQb0DKCuA1FKPMgIG8H5
         tWMw==
X-Forwarded-Encrypted: i=1; AKwUvBzEQK0g/2pBOvWrGKxHlLYzB+DAqNHWhcwxrjA9gAhGVA/Nr6lHa5lGNXgcy7W/hFHpGEIq/pH1BZyUMhU=@vger.kernel.org
X-Gm-Message-State: AFuF++kgrv9gw34h/JSR9AZe0od8SElkoQBC0tdR1/onzr+odKIk8n/0
	3IKcfC5WQe2bWDnmUcxtAMPRC87+hI0ZG+VCsWhLMtOhdsY8CrksIUkSp7ApSFNpFfs0jAlbLv5
	8SlboFhKZF12Po9kUwdOP51QLJI4Vcds=
X-Gm-Gg: AYBFou0k1mI23SrM3YL6x3g5gTWFTwkrQ8sASr/wQ27FchDaaMskb7fahkUe/BLSA1s
	6gT2jjd5qPNS57Dfft5EosejSpyosJVVPI5svd5BIZ7QGb+mex2JHqi8NyyKt2T9KPfwZK3To2O
	FIRAhon+5JFmBisS32F+/Kyr17Bl7WT46aGNDAbCIEaqJPoFjC0J391G3AloJ5DyJXomrbjUBAw
	g5ciJdmx6xqsWsMuoAPM/bkYdB+/uU1qZapvpe3btl/QoKg420MCVmh3o6tsgaDnMijW2WzqZoI
	t5C8JyPfqdiZSNijJjDU9OivARb9hw866kAZpdH4EEDUluz9e2sT23HB4xSZUQUZYBFPM2grsvA
	Bz4pIqIvP5iMk5gL9mwZzQwqLsbhu7rhytjyczuI=
X-Received: by 2002:a17:907:e8d:b0:c29:f5d8:9c7c with SMTP id
 a640c23a62f3a-c2ac22cb147mr1134942566b.43.1790626361635; Mon, 28 Sep 2026
 13:12:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9d60ef62-a53c-bb13-ff6a-0a195cf2f6f3@linux.intel.com> <20260919060037.84602-1-meatuni001@gmail.com>
In-Reply-To: <20260919060037.84602-1-meatuni001@gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Tue, 29 Sep 2026 01:12:30 +0500
X-Gm-Features: AclHuK9JUTRFiE1kmA3vX9iGMdGDyovU-rO_D4_8LNq9x5prseHY4a5bJKiRjAY
Message-ID: <CADqcGBm5r0+t44E3fyN5Re4+nL8hm+XxY9knQVqGUy0WmqVh9g@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: hp-bioscfg: fix 16-byte heap overflow
 for empty auth token
To: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Josh Snyder <josh@code406.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping.

On Sat, Sep 19, 2026 at 11:00=E2=80=AFAM Muhammad Bilal <meatuni001@gmail.c=
om> wrote:
>
> hp_calculate_security_buffer() special-cases an empty authentication
> string and returns a fixed 4 bytes (sizeof(u16) * 2). But
> hp_populate_security_buffer() does not special-case that same input:
> for any authentication string that does not start with BEAM_PREFIX,
> including the empty string, it always builds "UTF_PREFIX +
> authentication" and converts the result to UTF-16, writing a 2-byte
> length header plus 2 bytes per character of "<utf-16/>" (9 characters),
> 20 bytes total, regardless of how long "authentication" itself is.
>
> The caller, hp_set_attribute(), sizes its kmalloc() buffer using
> hp_calculate_security_buffer()'s return value, so for an empty
> authentication token it allocates 4 bytes for the security area but
> hp_populate_security_buffer() then writes 20 bytes into it, causing a
> 16-byte heap buffer overflow.
>
> The authentication token used here is the current admin/setup
> password, which is an empty string by default until one is
> configured. Any write to a writable BIOS attribute while no admin
> password has been set reaches this path.
>
> Fix by removing the special-case early return for an empty string in
> hp_calculate_security_buffer(). The generic calculation that follows
> already accounts for the UTF_PREFIX correctly, which naturally yields
> the same 20 bytes that hp_populate_security_buffer() writes for an empty
> string, avoiding duplicate logic for special cases.
>
> Fixes: b2715aa2e135 ("platform/x86: hp-bioscfg: spmobj-attributes")
> Reported-by: Josh Snyder <josh@code406.com>
> Closes: https://lore.kernel.org/platform-driver-x86/20260402-hp-bioscfg-o=
verflow-v1-1-6985f8c9e67c@code406.com/
> Cc: stable@vger.kernel.org
> Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
> ---
> Changes in v4:
>   - Straight re-generation against current mainline: v3 was written
>     against a tree state that had a duplicate "authlen =3D strlen(...)"
>     assignment (one copy meant to be removed, one meant to survive),
>     which current mainline does not have. That mismatch is why Ilpo
>     needed "special trickery" to apply v3, and why the manually-applied
>     result ended up with no authlen assignment at all (reported by
>     kernel test robot). The v3 diff itself was fine, as Ilpo confirmed
>     ("authlen is not uninitialized, so only the early return should be
>     dropped"); this is that same one change, regenerated from scratch
>     against the actual current tree so it applies cleanly without manual
>     intervention.
>
> Changes in v3:
>   - Remove the special-case return entirely instead of adjusting its
>     formula, avoiding code duplication as suggested by Ilpo J=C3=A4rvinen=
.
>   - Credit Josh Snyder who previously noted this approach.
>
> Changes in v2:
>   - None for this patch; resubmitted as part of the v2 series.
>
> Link: https://lore.kernel.org/r/20260803143037.93105-1-meatuni001@gmail.c=
om [v1]
> Link: https://lore.kernel.org/r/20260812111829.172273-1-meatuni001@gmail.=
com [v2]
> Link: https://lore.kernel.org/r/20260818191120.38556-2-meatuni001@gmail.c=
om [v3]
> ---
>  drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c b/dri=
vers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
> index 4d94e48..abf8ce2 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
> @@ -47,9 +47,6 @@ size_t hp_calculate_security_buffer(const char *authent=
ication)
>                 return sizeof(u16) * 2;
>
>         authlen =3D strlen(authentication);
> -       if (!authlen)
> -               return sizeof(u16) * 2;
> -
>         size =3D sizeof(u16) + authlen * sizeof(u16);
>         if (!strstarts(authentication, BEAM_PREFIX))
>                 size +=3D strlen(UTF_PREFIX) * sizeof(u16);
> --
> 2.43.0
>
