Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AA83ACF0E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066406; cv=pass; b=PuaENoMCVpF5EWA/XrUhjHE2Dfl3xJwyikudHQ04j9/N8CCmV6BK4Nk/q0Nz74hoXPocqHsHFx6AtjSHRUqp4FlXVjR7hczIa/MRXWplUw8X0NMRwNR3ausXEpQWTRLk7P02zZrcdce+lFQFUy6TVqDDaZix8iUR4W57Giif9IY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066406; c=relaxed/simple;
	bh=VvXoNF3sMeo2fpv2qDY0aBbxOZBUbISC5Fqd+S82nYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MTG1DMVggJXwTOp0r1HQXv9wHHG0f92wFX1EHl+UNh4B9WYzpBGhCvDvIQhjgHujZLEYdpP7kpsrCCcJVTJJfH0dW9lECgPA8cpKxJ8jSY9enEY+tt+s7/ZMF+VxqgElUcbpGEMkvBVp835SS65BJyzbassz4Lmlt4TuWVECxCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMdhZ8K3; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMdhZ8K3"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663c2so18305166b.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789066397; cv=none;
        d=google.com; s=arc-20260327;
        b=n8rYqZTJmyR7o0IVesanaJCHP3nLhDh0omJ6nj8cSUkIjDnpeo8ezQax8gNGVwcLkw
         iyBJ/TKX155nC+Ee7bT9SCKe0YRpe1Xn0fW2pnJIdsksPcxJSEOd0ELggE5cL9NjY20R
         tbU18TxDgiCAVmiO93mf/xMwvIRnJzQMz/RfjzoSc/LaAGGhxRB2lLsDjFadLnK5OPzI
         khjDhfRwlNKqMSTRhbFJzYomX/x3wo6AOHMu9clEPYmc9I2xiBlz8OkEy55U7rGjsOLM
         9HOTcoQmOnanCymo3DRYd3sw3X+qVSBzs+Qzgwt5OvHxiG3x705VKp0QXyfNaoPKJrD/
         JO9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sJedgFbA0a5dZ7UM3Qt2A8RF0LRRqtbYOuDEXTxhdkg=;
        fh=v0Z2Lp6UjKOhtFJh7dSMPcbryxDhkwTCDAi40cim11E=;
        b=sUMprz92w0IA6Z+kQdIFeyxe2A4q4ccOR1J7ET37j3TyTyVaqxm42oTg/yt4trdSmp
         ta7w2Zuue1jc4UYbuMbtLklHLD5GN/Vaa4T78bRMThdwCEknUBkc1+KZYaWylfl3Qwqx
         +sMPVRTU+f3BLcWQ2aitLXPa4er26OtsfBK/TQDm42I/27M7rCKYK6GhSp6gEwZPiZKS
         YoeVJ0jJ5mD0JE8WkgJ+r97VWjsnpcbsrwDgtdI9DOLSJMIJL/8v6WeT8O7Cf0BJ/Ogo
         d3H6wmoavJ0GUQmIUvenCptqFoRh0OoBBQhxoOJi5ihpRaKeGnhLiR51Bpjb3NqdpL1F
         2Vgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789066397; x=1789671197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sJedgFbA0a5dZ7UM3Qt2A8RF0LRRqtbYOuDEXTxhdkg=;
        b=AMdhZ8K3Z/qcyQ0KXyhN9VufTLn54TfCpOZV4MHMe2MQRHj0s/b9KJqeT7sPyQOIXo
         JkfnshlGeOLSvYdZwn8fz/lJebqKRGPNrew5AgwQ5umh6X5l967lgkyFw2sL/YdifmNB
         0TvZM9pgkKlcSmH3UKZdfIN5n4qt7eU9xMgOC4xdsUxaVvqUFlxvItUShsN3bRi0zhFS
         3igpwt5MFVmLZ8D0Ub4qa56ngpjr/XI9iBaj09BFtWvflQTl0SuKE/IrW3sfJZnKmPQb
         Ftds0Vt6lKiyz5bSYtefWcfLqtbHBI6Ch/7OrwVbzAQcJCpR7ZfFjUelGEtgjTAb+W7k
         PxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066397; x=1789671197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJedgFbA0a5dZ7UM3Qt2A8RF0LRRqtbYOuDEXTxhdkg=;
        b=eBgMTYI240eEbSsCgnPHW7adGwp5YHl9RABB8NFc+qIpMM4ML4hjVcYudNI8YzQV/q
         mHy3Qv1WlyUOBCQBlfQsdZ1YOH2P7YvS+CTuuQyCKTa+IpbEa03iYuq+f9Tn+Hgzg4ev
         WTh83JDADX4A0GBDI2rYibT53HNhjKzgx7IeLJgk/XwG0gqUzBfY2iVCN1yY5KgKBbZe
         Tvxa2EJRUyyUO8rZxj5+FK5PG+uyxCXMEu0gXXtptZSaF7MffkMICvCXxpw9lTgOVUUh
         Jkwv+gz8kmXqiO5v2XiNyoUTiTY2clHagk1rJqoKRFmHPWTZb8M3LPhJFaTw9llqxUsa
         rpWQ==
X-Forwarded-Encrypted: i=1; AKwUvByuxVWQXlwKnAQ8wSChOSDavNmTIB2Idui3IsjPgGv6+Obl3n6clPFywxTsBmDL3jaud3LZxAppRJXwaC0=@vger.kernel.org
X-Gm-Message-State: AFuF++nTKI4j/1dcUcjLCiUIPw9RIbEfmVmP/isMRFN+4bP1Vz94/HZK
	1sBzFd4DgCN19cL0ACn9kVU5FeyiyNOxjxi7SUUdDWXIovEBPIbA9vP209AJQy/oFDTpZY0D4+C
	4DUPBbMJQpx3w/IsOMYTFQ4uhGdPwPaEfrzvd72c=
X-Gm-Gg: AYBFou0s6jysEhHaOKN8xZGNEkqeGAOsp3Ej+rL6VAUybEy5nK4GU4/+7cXY0VIiHvC
	fpQFjBvxpYBh1wpbbQ4AUHG9TQThWBVeP1WOIxlx6YXZRPl0Tswz9GXdyGlB/uI0QzSQhkhxf3l
	gkP87YVjQL1APXviLClwXQqAIAxILLLa8lnXyB4ApfdsSicCuzLOFUXDWph3tLEu+yk1ZJBn/67
	4U68XPBeM+yM3Kwso8P8/BcEBN/cxDbVjeV9f6TIyS7KSi21siHpqcH7nxXmhPLmivUPzzedjAp
	0Y3bbJRNxv8KTbGB/g1w6TEAF07kF0lJp3AGuu6XEhY0niILiGK214lHsrsBSDT+sAJ3IDCgHmN
	ZmIQqDc1njb1Y
X-Received: by 2002:a17:907:97cd:b0:c25:b706:e59 with SMTP id
 a640c23a62f3a-c29666f49e8mr191366b.17.1789066397017; Thu, 10 Sep 2026
 11:53:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fa3cb42f7b58c1b3022d8208969a81882783a5ec.1788868602.git.lee@kernel.org>
In-Reply-To: <fa3cb42f7b58c1b3022d8208969a81882783a5ec.1788868602.git.lee@kernel.org>
From: Ping Cheng <pinglinux@gmail.com>
Date: Thu, 10 Sep 2026 11:53:05 -0700
X-Gm-Features: AcwNN1WtBzIj10yYVWNSv1D2MgnrM6PZMOlbKADR-R4JWexEKJoN-9DMVJ_y5ok
Message-ID: <CAF8JNhKJES5xkXd4VQxwp_sV_jUsgLsqFz+OJADL0-neY-W1Cg@mail.gmail.com>
Subject: Re: [PATCH v10 1/5] HID: wacom: Use hdev->product in wacom_setup_touch_input_capabilities
To: Lee Jones <lee@kernel.org>
Cc: Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Aaron Skomra <aaron.skomra@wacom.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Peter Hutterer <peter.hutterer@who-t.net>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested the whole set of v10. Status stays the same:

Acked-by: Ping Cheng <ping.cheng@wacom.com>
Tested-by: Ping Cheng <ping.cheng@wacom.com>

Cheers,
Ping

On Wed, Sep 9, 2026 at 4:27=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Replace the lookup-dependent 'wacom_wac->shared->touch->product' referenc=
es
> with 'hdev->product' inside wacom_setup_touch_input_capabilities() since
> 'hdev' is already available (via container_of) and represents the touch
> device itself.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
> v7 -> v8:  New patch
> v8 -> v9:  No change
> v9 -> v10: No change
>
>  drivers/hid/wacom_wac.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index 8feb8027be95..7cf2b4de52be 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -3966,8 +3966,8 @@ int wacom_setup_pen_input_capabilities(struct input=
_dev *input_dev,
>  int wacom_setup_touch_input_capabilities(struct input_dev *input_dev,
>                                          struct wacom_wac *wacom_wac)
>  {
> +       struct hid_device *hdev =3D container_of(wacom_wac, struct wacom,=
 wacom_wac)->hdev;
>         struct wacom_features *features =3D &wacom_wac->features;
> -
>         if (!(features->device_type & WACOM_DEVICETYPE_TOUCH))
>                 return -ENODEV;
>
> @@ -3976,9 +3976,11 @@ int wacom_setup_touch_input_capabilities(struct in=
put_dev *input_dev,
>         else
>                 __set_bit(INPUT_PROP_POINTER, input_dev->propbit);
>
> -       if (features->type =3D=3D HID_GENERIC)
> +       if (features->type =3D=3D HID_GENERIC) {
> +               hid_dbg(hdev, "generic touch setup\n");
>                 /* setup has already been done */
>                 return 0;
> +       }
>
>         input_dev->evbit[0] |=3D BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
>         __set_bit(BTN_TOUCH, input_dev->keybit);
> @@ -4010,19 +4012,17 @@ int wacom_setup_touch_input_capabilities(struct i=
nput_dev *input_dev,
>                 input_dev->evbit[0] |=3D BIT_MASK(EV_SW);
>                 __set_bit(SW_MUTE_DEVICE, input_dev->swbit);
>
> -               if (wacom_wac->shared->touch->product =3D=3D 0x361) {
> +               if (hdev->product =3D=3D 0x361) {
>                         input_set_abs_params(input_dev, ABS_MT_POSITION_X=
,
>                                              0, 12440, 4, 0);
>                         input_set_abs_params(input_dev, ABS_MT_POSITION_Y=
,
>                                              0, 8640, 4, 0);
> -               }
> -               else if (wacom_wac->shared->touch->product =3D=3D 0x360) =
{
> +               } else if (hdev->product =3D=3D 0x360) {
>                         input_set_abs_params(input_dev, ABS_MT_POSITION_X=
,
>                                              0, 8960, 4, 0);
>                         input_set_abs_params(input_dev, ABS_MT_POSITION_Y=
,
>                                              0, 5920, 4, 0);
> -               }
> -               else if (wacom_wac->shared->touch->product =3D=3D 0x393) =
{
> +               } else if (hdev->product =3D=3D 0x393) {
>                         input_set_abs_params(input_dev, ABS_MT_POSITION_X=
,
>                                              0, 6400, 4, 0);
>                         input_set_abs_params(input_dev, ABS_MT_POSITION_Y=
,
> @@ -4052,8 +4052,8 @@ int wacom_setup_touch_input_capabilities(struct inp=
ut_dev *input_dev,
>                 fallthrough;
>
>         case WACOM_27QHDT:
> -               if (wacom_wac->shared->touch->product =3D=3D 0x32C ||
> -                   wacom_wac->shared->touch->product =3D=3D 0xF6) {
> +               if (hdev->product =3D=3D 0x32C ||
> +                   hdev->product =3D=3D 0xF6) {
>                         input_dev->evbit[0] |=3D BIT_MASK(EV_SW);
>                         __set_bit(SW_MUTE_DEVICE, input_dev->swbit);
>                         wacom_wac->has_mute_touch_switch =3D true;
> --
> 2.55.0.979.g7e5102b832-goog
>
>
