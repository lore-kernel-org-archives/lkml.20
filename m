Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1965035CB95
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774263; cv=pass; b=SkkdQp7lX7XzmgrPCrTIr7mL5je4YIjK4d5e533ADLTtIZ4Iz8jf5HSEv1oMN1eKGmEZ9j8UnHPQeRIceoZioj6xKILiWuWCYFBQTpdBo7icU0dAiFXZ7CsTprSXKyFitrTIUDKIZ7SRTHOCBTzq7DBgB5Wn8SehU8xbTAh+Mwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774263; c=relaxed/simple;
	bh=MI41XlQsowXvuVw3HoU1qvNe19RJs6EkCkyiQjsEXzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F9wuPBvl8/z7n9OgF7z4KVgFzC9EtCimrGZ9JbYGKGAlUwIh14qIC7GCMufsZCAP+DPvMUkvV4SY99xPSHSOhsMaEiOmECSMcQn0g3TKJuPso9tCAjxjJvs3MWUd8zCk+s60U++xbNMfn6Gm32nOtPiYC8wwW1IDoj0lF/gJl8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JSgew2yL; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JSgew2yL"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-39b24d114d4so3409749a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:44:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788774261; cv=none;
        d=google.com; s=arc-20260327;
        b=S1hO2x+C8fZPexFmJFn8wtpOoAMGl92hck8p0CPuC1HSULZFunPXaDYBnIXVQMcM6S
         4FCJyFsFDswpyz2fdbQH4FBtV6y0KkfZXQZPaS36jdtACT9MILJ99uQZSUWZFUH7TCgQ
         6fAL5KZxrW4SnYnZO6fC0ZUd+CrtBdd291tD7ROHxVrsErhDu+/a8nCMaB58Hn4aI60h
         +7phjF6FOqzXosFcPaC80Lkk2Es8HZpOGMu0+o1fTmFoxE3AvDCYlj5OiApLqz88/7Cn
         xeJc52BMVAyctEmGlqaPeF4DyYwvVDlsT+3goC7RFZvDm90FeuKAhsutBQU2Dpjlgyjh
         Splw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g/xnlyu8PQCnxo+4HJ8JoFUVnIyWkmOXZV+LXEWh1vw=;
        fh=wqff/Je7fdGgQOMk6/BGNMJPDAGtRGdN3rr0nPiZkdo=;
        b=gYp23wr9TQc2ZiVxD16T/JJazZhWShWgHOT2Z1c2JL+xmXSFh1ME2AGLKfnwU3UUUw
         zlXM5SwYe2hu/Js4sNDPExPMQIUoFg8HCOeVr59Z6RkzJuHV+6aUoiK2CTji1h/Br5p3
         Yf9/TbjphIWebiM9CbAHA/HV5r9kcKUa3GbSa2avNMVBPMWWHYaBqM+Zo8xcq43O5e/7
         A2E+yjINJUT8RzHtnwGr5DNhMySX0X3vMSm2QdLF+je1xuD4GRELrWPrZeSCasGONWcl
         p5ySb2Lxxmlx/X9qavniJMxXsdsKQziT11qE4TU7OypKW03nZDsggGaGk6hmsGkjBiuh
         UhhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788774261; x=1789379061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g/xnlyu8PQCnxo+4HJ8JoFUVnIyWkmOXZV+LXEWh1vw=;
        b=JSgew2yLj7u0lUxFwIByIy/i5ID1FC62+yxMZCCC5f1MUYVbFWrp2HMyrsCmQD8TeG
         VNUECPVeNGPbmBqO+/zMM7N4KgSYBLlx+r72WTK42uttdOK57CSYGOwDOYFvapQt9x10
         JjdjZGW/cp5yAjovVfa66XdG/pf4+Y2F7Bp6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774261; x=1789379061;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/xnlyu8PQCnxo+4HJ8JoFUVnIyWkmOXZV+LXEWh1vw=;
        b=Y/Z7UPcA9sVM8bxK0qDx8PqhUHLtA64HjmfWjVLWeIUOz2cwBYFQkt7cX0WOQ9lnTu
         MRDpaCxUicldFFye51oZEVLwAz/SGv21ht+YxvQdC8s2g6gJpHXUoIAa+XDKwMwcXrUP
         GoPiywnMuTKR5hUhgjxa6/Zwlj7fVnbsmxO4jBYsDGykr+Ap6gB1yhPrfUwCa4oQ+qpQ
         ILLol58chLEwTKgJCrNcefBgoH0AuJeDM4CQF/PaSu2eApzdrUUnl5T8IqYjO0jKKAwc
         Dbt1/dOe3bkgyqwjzUO9//LcAxNLl1vvVwldGVJsA66PfgR/l+JXquFjBwJV+FFw1I+X
         OEFA==
X-Forwarded-Encrypted: i=1; AKwUvBzo6TvgK6quKnTPFKhkvzCMR55rKtF7yb4KPoj9foFsNjC80LmX+h2Mricq2PEvIw/76v5/xOq81MsHMyU=@vger.kernel.org
X-Gm-Message-State: AFuF++kL/7pRUhEuEuoJ1YfO5BLUD5aNRHBDi03papgy2pNcgexKvIeh
	hbfmVZNST5Puirw9xekMY11yE0Pw/bWIHa85iLGN9YXoL3CRNgPVk8sLkCUl7xsJiLPzZYuKDoK
	oxM7F4l13FnOoCti7KzcrrvG5MAh2zg5SyJwbIPfu
X-Gm-Gg: AYBFou2y93KLTyvi4FWf2w8ARN+e22oSkIlN/KxbuJ5tQhQd9SjzcIBa+jODLIdxRHP
	Yn9Ql0+Nzm7C7uPOZNGNh1YRaZOSaoRvGqxsH5T2ticcRn2DWCT9urYn7HDJS/WArHB8m3+Y9O7
	gydyjGOjQFMpfuxaA6MrUP4eObcgdMYGVmj9NH/cOFR+vnxcBUoI4El7zpM6NaO56bcNeWWsN8g
	Lu5LHKGpeEPrD98Y9xyDJmErPelPhIxBxP8lOf31IIulDtczlvHMNug1WhoXZFjc9Jw34SO+Wwz
	ZxoOLLfE0d5+QcF9qiPQDT5ueZIiyYsPHNwih0yuHI6qsdkDBotDVV71CzD5zLDj0RXF1jOwbw=
	=
X-Received: by 2002:a17:90b:5106:b0:37f:c22a:c188 with SMTP id
 98e67ed59e1d1-39b260feb03mr32280186a91.4.1788774261208; Mon, 07 Sep 2026
 02:44:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904234401.2339633-1-jthies@google.com>
In-Reply-To: <20260904234401.2339633-1-jthies@google.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Mon, 7 Sep 2026 11:44:10 +0200
X-Gm-Features: AcwNN1WMY3fqhnicN71CEKCWOY9vaZG4m4eQH1V9NiV1awWwS6rAM01YuF7ygVM
Message-ID: <CAMMMRMd-7=hzAiMASAkgUxxG50+sNQQUQN2=dNOS_THVjDmxxw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: displayport: Fix OOB altmode array index
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bleung@chromium.org, gregkh@linuxfoundation.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 1:44=E2=80=AFAM Jameson Thies <jthies@google.com> wr=
ote:
>
> The UCSI displayport driver indexes the connector's port altmode array
> with the GET_CURRENT_CAM response after checking it is not 0xff. The
> port altmode array is UCSI_MAX_ALTMODES elements long. If the PPM
> returns an invalid GET_CURRENT_CAM response above UCSI_MAX_ALTMODES and
> not equal to 0xff, the kernel may crash with an array index OOB error.
>
> Update the UCSI displayport driver to verify the current cam is less
> than UCSI_MAX_ALTMODES before accessing the port altmode array.
>
> Fixes: af8622f6a585 ("usb: typec: ucsi: Support for DisplayPort alt mode"=
)
> Cc: stable@vger.kernel.org
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Andrei Kuchynski <akuchynski@chromium.org>

> ---
> Changes in v2:
>  - removed 0xff alt mode assignement when GET_CURRENT_CAM returns an erro=
r.
>  - return -EINVAL when alt mode index above UCSI_MAX_ALTMODES is returned=
.
>
>  drivers/usb/typec/ucsi/displayport.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucs=
i/displayport.c
> index 7067f2561b84..572da7bbd29c 100644
> --- a/drivers/usb/typec/ucsi/displayport.c
> +++ b/drivers/usb/typec/ucsi/displayport.c
> @@ -71,11 +71,14 @@ static int ucsi_displayport_enter(struct typec_altmod=
e *alt, u32 *vdo)
>         if (ret < 0) {
>                 if (ucsi->version > 0x0100)
>                         goto err_unlock;
> -               cur =3D 0xff;
>         }
>
>         if (cur !=3D 0xff) {
> -               ret =3D dp->con->port_altmode[cur] =3D=3D alt ? 0 : -EBUS=
Y;
> +               if (cur < UCSI_MAX_ALTMODES)
> +                       ret =3D dp->con->port_altmode[cur] =3D=3D alt ? 0=
 : -EBUSY;
> +               else
> +                       ret =3D -EINVAL;
> +
>                 goto err_unlock;
>         }
>
>
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> --
> 2.55.0.979.g7e5102b832-goog
>
