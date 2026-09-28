Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3C248034B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585273; cv=pass; b=CeZCBFMBOsdbIXsiO55zl/oVMIGy4hbpUHt4z8OhY7e6anIHGzH7OVlUCZ9RaCf51RXPnS6143xaKiC6X/FHIRkFUIag85uyXT5ve5cSNgl5eDCOmnvfkaXaDMPXEyxJiTO4G5b7D1Pk7zd8hmiot+kG5Nkr/bGUJmo0Tsx/z6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585273; c=relaxed/simple;
	bh=dJKpOVv6fqiFc8ddNiCOZUDl7GePNfYcxXC4eyDXn28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XAsDu4DOrPYmKay4vSTguHnI+REWBLyij24SuPJQ5ys4V2TNfzyErfq/DnIWcsHgYwdCj43n0W81kFgeY19wovTDkVwS7/Tfng+WwGNj5lUuMHtN+AP7oEv6+A9ebJtRNFTnjNUaDqcywWDAylSi8h9fLOf26ryuJJeVcibf5rM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kYHDT28z; arc=pass smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kYHDT28z"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d747ee1f9bso12420735ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:47:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790585271; cv=none;
        d=google.com; s=arc-20260327;
        b=WWStKqXA4gmXQRetYcYwDDCTL/gK7vdDoSjk78xvJ7TOxOUfCIj8/uNIkDCFE7CJqR
         DqirFJr5O/N9XjTV04zoe63+W3QIcNanKG4M+ruz+aByKWG0maw4hdoh3h43M/flo5lG
         fbl53aKaYxv03FCgc2ntSmABxnfCRA+oKSzs0dt1WMUVPdjVwmaDZqnKd1AbktvLZ8WZ
         AU26Rw3i3YC5BPQXmrxLKUXhy2ozipFdvz+9sWmZn+1f/5qr8LZKMiThNVBk14PO9X4p
         CMPHVKyPW8ZhZYmy8/B4VDEIGhEPu/ZiKqpmLdT8UEKYwjeiIjRVFH/RRGrf3uVpFrlD
         iwXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mYUWucSS/+zmzWz3eV15/EjWdNuEkuuWYSgDXuT5k/Q=;
        fh=IY4elC9kBPkrJYpu7/LLdkNrP2/gTIsr7kSttuat7hY=;
        b=kaSWDgAr6QeJYe9k8sMh4Ikta5jaqRMWgA09SidNkKM252TSSp5M4CH+PK0W8xV7En
         o+BRtew0Y5QgZEgzk2ZbjAu8M/68X1xetPe+G+jb5p1j1txvtVgzNp9fgyrburVw3+JY
         rzashXZ6B/i1F0yX8IYxvUGl9voeP7KethhPXpAv02prjLKZJI87+H6nzclETnT1g/P2
         1Q/ytkGwFpKJnMjth7TuxqCEwkTEp6VcjHeLja12AX9cog9Ai1qwRajxdmcLbIBdIG++
         xZ88SIprJ988WQp2lzeTP3LYbQPBVGLflMptt0z97NJ/NBt1KeLu8D1j3Pqt5rVPo+sp
         zY/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790585271; x=1791190071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mYUWucSS/+zmzWz3eV15/EjWdNuEkuuWYSgDXuT5k/Q=;
        b=kYHDT28z+Lf1Zv2PVtZwV+bex6aVsL6C46lBcLxOJEAUAzRQjRdHqte6WC0N3k4mDU
         DA/XrwMMq8a1udP0hcoFnlrQaa1GQ5jomydyXeaNhgHJs4MuWa2OH2h0Rzit9QyjTdc6
         X+KCWkOeCEXJ00EgyTL7rWhlmt2TuP2OzIaVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790585271; x=1791190071;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYUWucSS/+zmzWz3eV15/EjWdNuEkuuWYSgDXuT5k/Q=;
        b=hmdlg2gNyXn+7XwIzKrM9UlhmxpAtotpitvT0H2Tkjm6nvGtDOu8ONjDMmC/EvI/Xl
         2dsRgTVTsgtUdceTf3hxJEtqLeJutjImuDSANi+VZg+Av/mZKCGYn8kpkeAYMp9DkWuv
         I/Bfh7Ynk39imx6OWGfnUxakUErfax8++mZmGhlv95et/D7Ed7j7NIrm+XYSSCpinNCS
         kf1wW1mdZjdVV1InWPDcQ9SusizkYiSQac9OPLpHWGvwif2PzP8osT+gEuTwlNYvhVcy
         rRz/7JNpGdOVneMCwL/z3h3wVQ/U6jEYb5VyJmQSTHhsqtVagXCd02I0fSF9/d8YOyC4
         1vMw==
X-Forwarded-Encrypted: i=1; AKwUvBxux0R+5GvCieLEWBmMw/QVblmn3GJ9QV9T6TTLbnoYIlNvAIS73NBju7UL+Ycz8bbgF01GKs91ErQ8mkc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHBnHLPwvgaChZf0RSMi45GxVgOh1DEtYayrwj3qf7O/TEBmY3
	0b3+XH8XxHBVoTB/F2p2Xb1BUGvPed1XPvyz70o0iPs6bVBk2wYskENuZHF5ZunlZYjcPV+ait6
	qdCmFJC4F8dw7CiZzgWka2pD3iN2Oei8WylUd1XNx
X-Gm-Gg: AYBFou27aYCY6so3U+0B8JYJlvMlkLeni3y4n2QFBTUASwXdjjFypqMw4rx/BVmZrH/
	PAZkEpJDwNVPWnV8np10z/zHLqo6hewACochYLiUFydL8RaHkntPd0NJAYUjWSYmBpPPjmZxuw2
	lHGoPiE0Vu1k68Yyy8MF2K7WTe/LaSKvVvqciuzbhHUMYPwfuiGLgKpc9mp081qmHteewYk6DDF
	Uo03HH6h8MOOtbh8AdLiSOAGn6l5DtddIi1VSGIlGB0CCIRbGzVbmh06NCrtRAja7NwWFcgblyK
	ViZd8CJclEXlSGoPuj6un13NirA05dIwCxwwQpnwRS4ZbcA/nkMGZ41Ru+kwfP6pwCI8qhp+fz8
	NKSEqEAE=
X-Received: by 2002:a17:902:f549:b0:2dd:c053:e662 with SMTP id
 d9443c01a7336-2df7dc37080mr103063685ad.40.1790585271422; Mon, 28 Sep 2026
 01:47:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927021649.8967-1-cnfourt@gmail.com>
In-Reply-To: <20260927021649.8967-1-cnfourt@gmail.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Mon, 28 Sep 2026 08:47:40 +0000
X-Gm-Features: AclHuK_CwEL7lxywAL9tW9lf7X78Ed9Y6yHTJv7brK-cGmDSjgzxO9Ta_DmbBfI
Message-ID: <CAMMMRMeX9-r_coX1zbUNoMGU+GUW56o4iY_jfyE5_ovFYs6UCA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: ucsi: Skip CAM query when partner has no alt modes
To: Gris Ge <cnfourt@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>, Jameson Thies <jthies@google.com>, 
	Pooja Katiyar <pooja.katiyar@intel.com>, Hsin-Te Yuan <yuanhsinte@chromium.org>, 
	Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 2:17=E2=80=AFAM Gris Ge <cnfourt@gmail.com> wrote:
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
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.=
c
> index bef3f9b71d71..71b28e4df470 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -360,6 +360,15 @@ void ucsi_altmode_update_active(struct ucsi_connecto=
r *con)
>         u8 cur;
>         int i;
>
> +       /*
> +        * Alternate mode support is optional, and the PPM is not require=
d to
> +        * support GET_CURRENT_CAM when it does not support alternate mod=
es.
> +        * There is also nothing to update when the partner has not regis=
tered
> +        * any alternate modes, so don't send the command in that case.
> +        */
> +       if (!con->partner_altmode[0])

Should we move this validation into ucsi_handle_connector_change?

        if (con->partner_altmode[0])
                ucsi_altmode_update_active(con);

All other call sites are already guarded by this condition.
Besides, I don't think we need that comment above.

Thanks,
Andrei
