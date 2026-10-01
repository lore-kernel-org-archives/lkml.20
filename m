Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580523CB8E6
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857562; cv=pass; b=DD2DFZuFGu97iitbe6iHtM8d8uv18+0Gv8N8OYF1u4MiIydKauaLgq1iMaqkxqE93fgo7XitYdudPIv1A9XJTQixu+VhkKk1UfgjkX/HdrfDOGQ+2J8o4ffWryecF/kVcvnvzRdNC6NX5sYr+zEaIA4/omFUUjzvZb24OYWsq7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857562; c=relaxed/simple;
	bh=x+RqhDEFCJlDmSwDf7GB3PDW2yVZPJ21uczV8t+z28A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=evWDyNUXHJ3wgjH86j9XpNlZUGSrNkB2upBZDzO7kFm5pKTAXRWxt2+9Fwhz681sBNGhoGCpir7dIbjaUC3/qqlG8KJMf0hv4JBP/jydK4jm94vsl9xGWUTpQQc5hYBW1ZuyHPIhdJ2brQqb6x30wTyH0QwV9S+s2hlOCj+a6Ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Nq+DxrKU; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Nq+DxrKU"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccc02279so3732809a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790857561; cv=none;
        d=google.com; s=arc-20260327;
        b=mC6zBLyB+2MSPYLo2W9aZb4MAW3d0kHMPoyIj2WP34S+suH+lo5XmfhUr2hkbLOtFW
         hfU8T55GKxOMUUjZ3ROU/ViCFGgdcQQMsES5UWudmkkiDyJHIx73vpav2PV2mNh6etWI
         +4Tduaj6UmKSMTi57dG5FNsgpiEM01lH7NunixGOfqpwhx0xejoO3KJcMAyXt4ZrdcfI
         3vhKTc2sokV/TbZbgnE9K4ZPPiWgWTiEcOGDrWQpwvEou2cafR9Zj3kx2N+N+uHv3nO9
         Ni1CyA1XRef1iyuR75sdRBbxVSvCm1CbrZiCdtxbxOaxxLludykMuwGCRdSA5eGNX+zz
         puMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sHNsjDTZpfGR2H1l2JsSr6KfRDIP/MhvrrYNRy/u2yY=;
        fh=T348ZK3Dq7/bE3ZlKxZzW47obS2xyxMJHneh6GIshnM=;
        b=cfxISwzfCcKN4eUPFVxbJ05dD9DjTioWwxztTYJLKRPAq9n8I4eldadYAyIiwzMZfI
         HM5YpoaNQWpiArXDehQI+6nWHnWCXsNqvdQNLZNeJP7i19cNr8BLKivNIBy1CYeNT20P
         I56nHWKvZ14075O8jtkXvImLVsX2mV6GGmQQfttr1RwFmx585/M3tjX7ITWI01sGj6y0
         /V/VAAfDLIxwCkL7IPahUenJzWf8pTv/hGZ67zbhT3ROxF4Sy3BiB6htjW+2gDCUeHQ0
         JaCXXykqaJ6lBu3GKtWqGCKeCKe5wdp3AhcWScMnP+k7Px5Wu4zybiBeGsExiZSmhKwi
         2E4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790857561; x=1791462361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sHNsjDTZpfGR2H1l2JsSr6KfRDIP/MhvrrYNRy/u2yY=;
        b=Nq+DxrKUGKvNs17iv6Sgu9y/wyowD8TUW2b8lFLAfbZ6EKrhC3y36R3f4S0FWC1l9h
         HgB4JDn6J7yeS5Zf+HcChijIPxP0YhzWy3L8u1DKpaXSEhCe88XuuTzo21cAgmCJ0E12
         5Zj2+N2vg5ysSbyGQKKfAO01O1hYSX7ogzA0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790857561; x=1791462361;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sHNsjDTZpfGR2H1l2JsSr6KfRDIP/MhvrrYNRy/u2yY=;
        b=fH0DzYQcC2gcyOIB1u+PlkTXt4kCOS0nES4MFRYKsS7Klv4UK9PPt1mB/+jUEYwUkH
         iXG8zSQWegWR/sjXISU4MuH/ggLw+cU0MW7djISo33BAB7hyGcnOHn9jP0IdBW2mZ7n/
         sgC8dgYiMVaW0N5U5wwdH7gmws6jDWxNf1zmhyyGF11yDfxj7tZ+GkZwPSilfDpoAYmh
         cmmRzKjiwytIpXJuTm43wR13Nir75wqWPEhmT8j6teJcwAxoQGPjCd+7M1Cag1YpB3Ev
         sxpT9TKCgQjcXY72lx5MJkSMK6FINdNnXNjcG15W7AmZuG69ttXx2r1iRWufeQQV+fO+
         wezw==
X-Forwarded-Encrypted: i=1; AKwUvBzXf3NNQjpLfuIMgbI0D2pQTbA/hJRPSuyIzvOhSpNyYktUZ5EATGmLMQXEgTy+alYdkYZ5XCuJS/vJFjA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7cP2jDK4J6VGfyERT1z9Q8ZSWoxBrSMIcMcudHph3pyVvs31t
	kNo1Jf8w4R9jS7/xDfNK1a5sboNOl/XjMX9SvBdFzeaJp89zCaH7p5F+MdHlCpr9F3w2PuQFtzB
	DsWUyEpH+6Uzbkitxud3Clprixzc8k0nPy2F3FoSp
X-Gm-Gg: AYBFou0uzL4oLW8AgDpjfWOKaPXkffgcy+3FOVg8WZbFOfmw6ejwGJxe7/RfsDXYzgD
	4IIhABo4llqii3GhtklRSHxByocZu3V30wOMRRHAVNzgPoM5tFb6548BWubkQkhhA9wq7Vgxzzq
	JWRhrfvFY5d3AzUzdy5bCuPTty5VtXSx86eV3ZeLHGXf6G4nUHNudsWVOxU1QpkhvodB1rR3ZFA
	gMVFPZVKYE9xVht/7MdE4DoS9YWBkBfnlTijDZgCpiixWUn4KgBknlvByJG2lXBqz4M5JB/XREr
	EJYS5dPqPOd8jLCo+v5tg2xAjMg0DnEzZsvgfLcyu+13SZCUiukHpdXtRqL2D9gmJLGv6nupWUx
	mmxOGB4E=
X-Received: by 2002:a17:90b:2787:b0:3a0:bbd8:5ba7 with SMTP id
 98e67ed59e1d1-3a4d19263b8mr3982449a91.62.1790857560613; Thu, 01 Oct 2026
 05:26:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930234611.468765-2-cnfourt@gmail.com>
In-Reply-To: <20260930234611.468765-2-cnfourt@gmail.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Thu, 1 Oct 2026 12:25:49 +0000
X-Gm-Features: AclHuK-BxU7MmUHAcZP4PHaPh5sL3Kfkf4dW_oEhBdzZNS6_OoOhRdYuvai3_LY
Message-ID: <CAMMMRMe1Nph0cOtVsJcKGJgsnNarj+9fEizMh50RqXZP+cHoPQ@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: Skip CAM query when partner has no
 alt modes
To: Gris Ge <cnfourt@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>, Abel Vesa <abelvesa@kernel.org>, 
	Pooja Katiyar <pooja.katiyar@intel.com>, Jameson Thies <jthies@google.com>, 
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 11:46=E2=80=AFPM Gris Ge <cnfourt@gmail.com> wrote:
>
> Since Thunderbolt alternate mode support was added,
> `ucsi_altmode_update_active()` is called on every Connector Partner
> Changed event.  This made the driver send `UCSI_GET_CURRENT_CAM` to
> PPMs even when the partner had no alternate modes registered. Firmware
> that does not support the optional alternate mode details answered Not
> Supported, which produced a spurious error on every partner change:
>
> ```
> ucsi_acpi USBC000:00: GET_CURRENT_CAM command failed
> ```
>
> Fixed by skipping the command when there is nothing to update.
>
> Fixes: da87d45b1951 ("usb: typec: ucsi: Add Thunderbolt alternate mode su=
pport")
> Cc: stable@vger.kernel.org # v7.0+
> Assisted-by: Codex:deepseek-v4.1-flash
> Signed-off-by: Gris Ge <cnfourt@gmail.com>

Reviewed-by: Andrei Kuchynski <akuchynski@chromium.org>

> ---
> v2:
>   - skip the invoke of `ucsi_altmode_update_active()` in
>     `ucsi_handle_connector_change()`
> v1: https://lore.kernel.org/linux-usb/20260927021649.8967-1-cnfourt@gmail=
.com/
>
>  drivers/usb/typec/ucsi/ucsi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.=
c
> index bef3f9b71d71..c392afdc27ae 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1519,7 +1519,8 @@ static void ucsi_handle_connector_change(struct wor=
k_struct *work)
>
>         if (con->partner && (change & UCSI_CONSTAT_PARTNER_CHANGE)) {
>                 ucsi_partner_change(con);
> -               ucsi_altmode_update_active(con);
> +               if (con->partner_altmode[0])
> +                       ucsi_altmode_update_active(con);
>
>                 /* Complete pending data role swap */
>                 if (!completion_done(&con->complete))
> --
> 2.55.0
>
