Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F264B04A8
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791211866; cv=pass; b=nDjkC7h12zOGmw3GLySWudEqHt3HqEJKRAqV8FH/PwqAsw7zPzVg0v7dKEvuT6WzMxVWODHeQLajT2QLa/+UMKCNwkg+Kf0S2wKKacfX1hHriqSFWfZ2upHsxP7FazFdBIVM6loMWi5685dLeVcJrBiRKPfLiv0Ev2T7PPmITm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791211866; c=relaxed/simple;
	bh=YrLe/bgyFwpgpqiHffOcUv8w8epm9xRDZev+pTSWF4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eFvQZFYBayREc1w1TifC71x0wbL3HtonpHqJRX2iGmJOHWfKp+IamR7K5YRNW9a0x9M9FpQDy+Pns922HjqkpJx+TGFDoi/PHOM3bX1vbB/nXNm07kA74SZrIw1nKjbp+iHWYM/apHc7hkVz4PAbs5jlmjXyNYvM64siQR3hOIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AKaOuyIw; arc=pass smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AKaOuyIw"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a81350dd08so479761a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791211859; cv=none;
        d=google.com; s=arc-20260327;
        b=CylAc1PSsEpOAbncWZTfiTd1ofPb103T6wLE2u8GAqSK99bJ2yH73FbrYu0quxDzIt
         n95UIzcIchGAKvxc+aO//qKJ12g7gkv/OVpa7OAzOqGhgHh00So8qgBpmSJQqok6oX1Y
         NFuGhR+EFnRvOYO6xz9iQ5lZbd69PUsa/oWoFA1xjzRnMq+v3sqVcjtsVOweM2wv0BLE
         dCaAtMtRSfhpeVeB3uXkIkQD1IHqFa76QHPfmdbzUH8eL3Y9J9uWbcP5d8Gb4a6cXFe1
         /eL+HcBIdzva5kcVxeOrl/o1fOei+6Q20EcxGx4K64L426J8uP0NzNF+gElMeZwbyQZl
         XQUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wzyxtCc/xljY4tUYv36NHbjTq6FZebesi/It17iHYVo=;
        fh=n5CBXI6PjsmFZ2O9D9lUnrluDBcqtWeOqRZeAv80CWA=;
        b=nuAsE8iFdZPEwFTpjynQilGMTjO0gtlbcXwsljpIcV+TZY92xDv58sltmVnVQs2wmF
         X7GEU6uv+tDPViDN3+Ih3YOGbYXEu7FTy1+0Mw2FiAnswsVxbU/eK9JbFwRvLRGbgSUo
         FiocUaCeTur4p/j5BL5TlbLx+e3+DXG2DavGy1oQzuQeS3feZIolVNhTcQ6DtNNFiM8C
         Fxzy+KCYhLL22Yv0wGQ1O9hutRAjDcNoM73iXpaLrRQO+0HMRODDZX+0glK7TyYZ0Woi
         y503+u3A6zEzwyWG2MU1nuVVN20aQXzIWerB10UaYdkFOYaPGYxgwVIC9Dn+SI0h+o+L
         40tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791211859; x=1791816659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wzyxtCc/xljY4tUYv36NHbjTq6FZebesi/It17iHYVo=;
        b=AKaOuyIw9xtWePTbrp2gtdG/GwFA1317C6uISMvp4MkcuVRlYNvt1c8Yvbo0s6ZDZ+
         5QwB0hWzePNcowvxJCsGd3OrFJZS8b6fKOvcl83qkYHP9XrOX6SfFvcapDgNr55JsC5U
         E5DV0kS7T5oo9y3zLW9pb/svLwACR6NFk0HIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791211859; x=1791816659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wzyxtCc/xljY4tUYv36NHbjTq6FZebesi/It17iHYVo=;
        b=QGZffmTcPI30GlrtFZXu4ZW0Bkdnd9pqZmFYUITPBQRMr2CsD1OWEasHvBQL0WrrwY
         9SzqSX1bEET09HwX9Pknyn1oVtM1wOOF+aFfzmhjtvkPUb3JrMUmiK8Ffway88+qhAfR
         aFc5KNJMjtvAz4FBKdMWwP7l+H+crqXPT5VMlpnYwTyNVE5M7t27ZoPD2jSyuvXkNvug
         vJ6UW+y2ibMsClAcFs7abO9zFxSQJFwlQVtBn/KCUtZiVGYYDo5YTTJ0OgV/h6d7qieV
         IKwcdwxu22U5XYihPKSwEQact9thnzXp0lo4FhSdMBlZxR9heuNyCgm5GMMLbfNXm9EF
         cVjg==
X-Forwarded-Encrypted: i=1; AKwUvBxsHMeJPbLv9L6CrMitIomb/BvmXmmZV2Quyls0100vgFQZuCfj7l55hSnH5V2tGu75EwMXe1A2JL7P8pQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjUgjSXZl6sg4airt4p6rSE3gijG3EE7LlrHjxsyFutGwl/yro
	7KLdoVpSOT8I8VnJfVLQunAWar7YAH/vDz098FxMxCtqCsJstrB1FKTNRcK4li/ysTDl70Bda8r
	I8zcLvk8bsheVxiduYyfhJwOVwhglMXWgBP5vrNgn
X-Gm-Gg: AYBFou2xr6uTT0dwHKDL8qri56sAN79jYqsKoazQoQtxuTzQrvkzAccIGMzzQBHUv3s
	jfSElw86p4b+6LV8JA9zSBmrPtpjTwO8SdlyG7qyIJuUjFxLyfuPDDtstjJR5VFL0CJ7E533ib8
	IsW9lwsfX6nNDL053G3NseMNJzQ1y6IhSs0L1IEaz2FatBPKOZKfgofkLJPS5euxacA5ItR8O0F
	RTdfCwk4/A/BqhOw4W6LjQ6OoF0iNe8Vy7KY7Fl/Rfrd2JvnNZ4w0Mi3Dh7xbTrsqgC22boOgb9
	WvSLh7Tyy2A2rlzXV0Douj/KAJO362fTEADnnpJ/yWETlr8oMRtiaQMY/jDPUP4soVKje4ppbIk
	G4cXith40BpURATkySQ==
X-Received: by 2002:a17:90b:1c12:b0:3a4:9f7f:8cc1 with SMTP id
 98e67ed59e1d1-3a6ce75d149mr10175210a91.24.1791211858800; Mon, 05 Oct 2026
 07:50:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002200108.399258-1-mhun512@gmail.com>
In-Reply-To: <20261002200108.399258-1-mhun512@gmail.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Mon, 5 Oct 2026 14:50:47 +0000
X-Gm-Features: AclHuK_mpqiutglUoj4b9ypzT5hG7wQQ6C7TSD5Rqh4e7VfHWJcwxGbEsSCz5v4
Message-ID: <CAMMMRMc7ZfanRcM_i8dCS+51Q5-dpTKnMvFJuEsvgF5V80iwHg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: cros_ec_typec: Stop altmode work
 during partner removal
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 8:01=E2=80=AFPM Myeonghun Pak <mhun512@gmail.com> wr=
ote:
>
> DisplayPort and Thunderbolt port altmodes queue work to deliver VDM
> responses. Partner removal and port teardown do not drain this work,
> allowing it to race with partner driver removal or access freed port
> altmode data.
>
> Disable and drain port altmode work in the common partner cleanup path.
> Partner drivers can still queue responses during removal, so keep the
> work disabled until they are gone. Clear pending response and DP status
> state, then re-enable it for the next connection. Cancel the work before
> unregistering port altmodes during final teardown.
>
> Allocate list nodes before registering altmodes so allocation failures
> also use the common cleanup path.
>
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code.
>
> Fixes: dbb3fc0ffa95 ("platform/chrome: cros_ec_typec: Displayport support=
")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> Changes in v2:
> - Quiesce port work in cros_typec_unregister_altmodes() before removing
>   partner altmodes, covering disconnects and discovery cleanup.
> - Re-enable work after resetting pending response and DP status state so
>   port altmodes remain usable after reconnecting a partner.
> - Cancel work in cros_typec_unregister_port_altmodes() during final port
>   teardown, following the review suggestion to use cancel_work_sync().
> - Allocate list bookkeeping before registering an altmode so allocation
>   failures use the common guarded cleanup path.
> - Drop the v1 Reviewed-by tag due to the reworked cleanup paths.
>
> Previous version:
> https://lore.kernel.org/all/20260917204209.97699-1-mhun512@gmail.com/
>
> Validation: apply checks, whitespace checks and static source review.
> No build or runtime testing was performed for this revision.
>
> Remaining review point: an in-flight port active sysfs callback may still
> queue work after the final cancel_work_sync(), before the port altmode
> is unregistered. Please confirm whether that ordering needs additional
> synchronization.
>
>  drivers/platform/chrome/cros_ec_typec.c      | 27 ++++++++----
>  drivers/platform/chrome/cros_typec_altmode.c | 46 ++++++++++++++++++++
>  drivers/platform/chrome/cros_typec_altmode.h |  9 ++++
>  3 files changed, 73 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index 50a68819ceb7bbfbd888ca919d678d4c75237c26..2d6cbb7f51445fde4b4e83390=
81e921a9a143a92 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -282,11 +282,19 @@ static void cros_typec_unregister_altmodes(struct c=
ros_typec_data *typec, int po
>         struct list_head *head;
>
>         head =3D is_partner ? &port->partner_mode_list : &port->plug_mode=
_list;
> +       /* Partner drivers can queue port work until their removal comple=
tes. */
> +       if (is_partner)
> +               cros_typec_altmodes_set_enabled(port, false);
> +
>         list_for_each_entry_safe(node, tmp, head, list) {
>                 list_del(&node->list);
>                 typec_unregister_altmode(node->amode);
>                 devm_kfree(typec->dev, node);
>         }
> +
> +       /* Port altmodes are reused when a partner reconnects. */
> +       if (is_partner)
> +               cros_typec_altmodes_set_enabled(port, true);

Have you considered fetching the port's altmode using
typec_altmode_get_partner()?

        const struct typec_altmode *pdev =3D
typec_altmode_get_partner(node->amode);
        if (pdev)
                cros_typec_enable_altmode(pdev, true/false);

This allows implement cros_typec_enable_altmode() eliminating
unnecessary checks and the additional loop:

        struct cros_typec_dp_data *dp_data =3D typec_altmode_get_drvdata(al=
t);
        if (enable)
               enable_work(&dp_data->adata.work);
        else
               disable_work_sync(&dp_data->adata.work);

>  }
>
>  /*
> @@ -366,8 +374,10 @@ static void cros_typec_unregister_port_altmodes(stru=
ct cros_typec_port *port)
>  {
>         int i;
>
> -       for (i =3D 0; i < CROS_EC_ALTMODE_MAX; i++)
> +       for (i =3D 0; i < CROS_EC_ALTMODE_MAX; i++) {
> +               cros_typec_altmode_cancel(port->port_altmode[i]);

That won't be necessary, as the work queue is already canceled in
cros_typec_unregister_altmodes().

>                 typec_unregister_altmode(port->port_altmode[i]);
> +       }
>  }
>
>  static void cros_unregister_ports(struct cros_typec_data *typec)
> @@ -901,24 +911,23 @@ static int cros_typec_register_altmodes(struct cros=
_typec_data *typec, int port_
>                         desc.mode =3D j + 1;
>                         desc.vdo =3D sop_disc->svids[i].mode_vdo[j];
>
> +                       node =3D devm_kzalloc(typec->dev, sizeof(*node), =
GFP_KERNEL);
> +                       if (!node) {
> +                               ret =3D -ENOMEM;
> +                               goto err_cleanup;
> +                       }
> +
>                         if (is_partner)
>                                 amode =3D typec_partner_register_altmode(=
port->partner, &desc);
>                         else
>                                 amode =3D typec_plug_register_altmode(por=
t->plug, &desc);
>
>                         if (IS_ERR(amode)) {
> +                               devm_kfree(typec->dev, node);
>                                 ret =3D PTR_ERR(amode);
>                                 goto err_cleanup;
>                         }
>
> -                       /* If no memory is available we should unregister=
 and exit. */
> -                       node =3D devm_kzalloc(typec->dev, sizeof(*node), =
GFP_KERNEL);
> -                       if (!node) {
> -                               ret =3D -ENOMEM;
> -                               typec_unregister_altmode(amode);
> -                               goto err_cleanup;
> -                       }
> -

Do we really need this?

Thanks,
Andrei
