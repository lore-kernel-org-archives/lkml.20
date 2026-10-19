Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074743E0724
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792391789; cv=pass; b=qLQV8MeikQQcRQBUe3WfXG4nYZlpEJISDeqYMnq9O1M/1uHfW0FePSBWngzQ5OmsKPS7Orz+YfUnkaVyDhZDUoaLvg+kzZam3UBD+/XuHfnLc/Zgu/oWIgSYJOWUXgLM9CvaD+BYoEz0/EOrsSRRJJNvZImilt5IXzDeTNYH3e4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792391789; c=relaxed/simple;
	bh=6oVEr/4KliyQPSxat8l4eE3P0YthzSqxsxoIP3vxxmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XbpV7XcoMu9QC/+My+iXMEIbafX6gPX27DGzw5YQkxFu7VZi+hiLIe4HZ5CZ55W6egtowH92DdrveBXVqYQS8MR7S/yF+W4rCZ53aSFpNuIeKlI/nANHGAC26sv2A4/4yXMPyIaTBqM3ESuJvqxWXlqzLc7xucYRQAArr1JX1eU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pm6bDEbU; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pm6bDEbU"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso1398104e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:36:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792391785; cv=none;
        d=google.com; s=arc-20260327;
        b=oUtDEHUtWGdk2Gb5jTvXYl0qcc1F+Uufh3eS0k1ZunDaoXq1KzBqZ3AUZ7uFuX3B8D
         fcL8D2gtRAg3AvKTYCgGuJG9kCFLBcdtA1KthFxtTx6jdeabxqTxEnj5CzFkXLKhf5nM
         fQBsxZ3r8HeG0q9eJV7DP9T2RABxbwJG6lhdbfX33ml76lRPvjuV8p6FHcPbplWov4Z7
         +v3r0ym7pjL+zD2XCmLfJESziRa9uHMee/XbeIIOSJulVg157mwWXrg1fDvpi1/jTXa5
         yaCgODLdUBl1EB6etC5RGcfWV98zUrV6ESCUaKyIyJcmLSkUVLMwPVrgPIMvdHgigkxf
         r9Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U94c+785ttg3YXYwXun84olJnh2cjej2HRkwN79dUF4=;
        fh=U0vj4Whcw/EMCcK66Fh2vnanf6jnb2HGj2vBHCx3Io0=;
        b=TYqQFyR5NnI42HOays7ZdMRGucY49MFpASZ+WhUSY4Wv+eyHlqgtT+afyen2FcO9Vc
         g02YZxn+WzfZIq25JzzEJjwUvANj3UqHY07xfWnazfa+F2aOUNYKr6JqaBhukWQWiHR0
         TOgU/5+DpyzBMmzte+PLvPXtYn2iLItfjBdjGEi6XZmsjOfjDnLeMxbT3XQugTXlIWzC
         IAbE31+Rl4SbVjTST+RnmAgGopK7/RP99trmbNNvKQnH83ZUPKnqnTl3Db5+TW+ybwha
         s8fLG8TPEbttlLCMs0AjRBBXb8LD2FQpyCRWcDlffG3ScEbFMGLitmOTcLsIuJjJ3yxd
         DMsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792391785; x=1792996585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U94c+785ttg3YXYwXun84olJnh2cjej2HRkwN79dUF4=;
        b=pm6bDEbUV6rthblB3gbxRDCIMQUatyQJSY56jtzPjl5gBqWFKjOLpe2UwOzxzrxsGa
         n53DtueNsYFZKhkFGQkRbW8keNd9hODPGM+WtU93muiA+a0eGdCatGlgRo8XU2rb6uim
         qPncImxRYF3DqiP7eyWkXJYOQgtunVS7NNBkP7ovUaRXOPaZ3f3a8Pc7+2s+D5PEHe+V
         456I+Py/M4JHBQCf8QNeKig3TonSl7uy2cJr6DxBYnEFsAFy9WuvXJ0+UBwXI6+wi5Hz
         Q4s/Ky/ojH7B3/y9hL8Lw9dqd5SxIjy8kggd383uUaFWzFLT0ykPrQotiu6UEAgSaqGP
         wnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792391785; x=1792996585;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U94c+785ttg3YXYwXun84olJnh2cjej2HRkwN79dUF4=;
        b=uN5mu4/8o9tHGHw6CZf4UsMOcyBRj7CmZwXcdrJFr9WsfGZrOAu15g/9C0k8daryNL
         4R/0HN/AbC3xm5bolkmWwIN6j7Fv23nP65cPG6nqHG5EcDjH1rSleHgy3noBRQ57Kb3C
         U6HXMtxPQbgMofsdWXsDwT/lyfjijF5f75yifw/RRjqstwrLrMSVrOxeSiHvv/l93qxp
         95utewf6PAacGzz674v4WswjNcEyPTSQh9d7YnCh2whpUiwWtYVo2h8Mxv97KS1PxdFG
         4biXUxJMmcaM4eGMTUdCTgD3vnhQ5u/XW8OBldurDk4/hT9ViTBxHfkqowkGRJsJNbuw
         5B/w==
X-Forwarded-Encrypted: i=1; AKwUvBw+kOGBMai7oC0hK6kvdsbk4g5nbB4z0ojyrw38AS3PYvSaU26bYE6znOfjs0QB5dPGBzHJ67W6En0p7gk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOGlpYAYBaOkGesVRj1okW2BvUJpwngBTO+iVuy05wFrKEye/N
	mPqn3mLc+4qBKe9xsDI+oWSU2yruojZ0htqORsqrcKa8oJle1N96xKYeVc1IIufPcXO28vSpLdc
	5+kAmirvwsznonlrUSpeg3Lpoq+Vn7Fs=
X-Gm-Gg: AYBFou2x1QXhgyQhPkQPowjTpD+VVgEF8iC6iwmosalu0vi6+t+Jj+IP5Whn8QW5aH6
	5qCNCk1QWi3WdaqGeVaehLC7mmWa2ijw+Yl6SjPsWpMN1wDVIK9QMuCarhshVTgunbx5kBsyAOP
	YRZAdN9Nop6xRBkcYJx2VAa6T5KVVQVZ1f/P8B06Qled0JadB52WlXDowcxRLvmjSXN+J/6pujI
	mwnxCxSKTuVRG0hQja3zFcNYCOxP2bob7a7dEUUBziUoztJGaHPO5/B62Ou4Ka81HbmV2YZZpdu
	ivttHpUY8nef0xPRr8cYi4Tru8IFUurNisNkYiELxg6DotNWmjzezOo/uD//Jk/0AKKmznbtQnC
	G8Oj215Ip
X-Received: by 2002:a05:6512:2309:b0:5b8:f0d9:98c2 with SMTP id
 2adb3069b0e04-5be50a65472mr2055004e87.30.1792391784655; Sun, 18 Oct 2026
 23:36:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930002133.10794-1-vishnuocv@gmail.com>
In-Reply-To: <20260930002133.10794-1-vishnuocv@gmail.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Mon, 19 Oct 2026 15:35:45 +0900
X-Gm-Features: AclHuK9fJIHNAGQ_7zL3gxv35C95pstuMV3JgF3k-f1Yjf7DKEdx_hICUUW_pCI
Message-ID: <CABxCQKsV49CKbvZ2m2556+P=+q-9DSMdanzXk_v-syzZ=uJ9WA@mail.gmail.com>
Subject: Re: [PATCH] HID: lenovo: add fn+F7 display switch support for X12 and
 X13 Folio
To: "Derek J . Clark" <derekjohn.clark@gmail.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mark Pearson <mpearson@squebb.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

A gentle ping on this =E2=80=94 any feedback would be appreciated. Thanks!

Vishnu


On Wed, Sep 30, 2026 at 9:22=E2=80=AFAM Vishnu Sankar <vishnuocv@gmail.com>=
 wrote:
>
> On ThinkPad X12 and X13 detachable keyboards FN+F7 reports the Super+P
> key chord, which behaves differently from FN+F7 on other Thinkpads.
> In particular giving a shorter on screen display time making it harder
> for users to select their preferred display mode.
>
> Newer keyboard FW is now available, allowing the keyboard to be
> configured by the OS to provide the standard FN+F7 KEY_SWITCHVIDEOMODE
> code as used on other Thinkpads.
>
> Detect if the capability is present and enables the mode if available
> on initial probe and resume.
>
> Suggested-by: Mark Pearson <mpearson@squebb.ca>
> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> ---
>  drivers/hid/hid-lenovo.c | 71 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 66 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
> index 3976d7b53b14..6b4b689c8834 100644
> --- a/drivers/hid/hid-lenovo.c
> +++ b/drivers/hid/hid-lenovo.c
> @@ -44,6 +44,7 @@
>  #define TP_X12_RAW_HOTKEY_FN_F10       0x00000803
>  #define TP_X12_RAW_HOTKEY_FN_F12       0x00000403
>  #define TP_X12_RAW_HOTKEY_FN_SPACE     0x18001003
> +#define TP_X12_RAW_HOTKEY_FN_F7                0x00000815
>
>  struct lenovo_drvdata {
>         u8 led_report[3]; /* Must be first for proper alignment */
> @@ -557,6 +558,34 @@ static int lenovo_send_cmd_cptkbd(struct hid_device =
*hdev,
>         return ret < 0 ? ret : 0; /* BT returns 0, USB returns sizeof(buf=
) */
>  }
>
> +/* X12/X13 folio Fn+F7 reporting mode: feature report 0xa4, [id, mode]. =
*/
> +#define TP_X12_FEATURE_HOTKEY_MODE     0xa4
> +#define TP_X12_MODE_DEDICATED_HOTKEY   0x01
> +
> +/*
> + * Select how the X12/X13 detachable folio reports Fn+F7 (display switch=
):
> + * a dedicated vendor hotkey (report ID 0x15) instead of the default
> + * Super+P key chords.
> + */
> +static int lenovo_send_hotkey_mode_tp10ubkbd(struct hid_device *hdev, u8=
 mode)
> +{
> +       unsigned char *buf;
> +       int ret;
> +
> +       buf =3D kzalloc(2, GFP_KERNEL);
> +       if (!buf)
> +               return -ENOMEM;
> +
> +       buf[0] =3D TP_X12_FEATURE_HOTKEY_MODE;
> +       buf[1] =3D mode;
> +
> +       ret =3D hid_hw_raw_request(hdev, TP_X12_FEATURE_HOTKEY_MODE, buf,=
 2,
> +                                HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
> +
> +       kfree(buf);
> +       return ret < 0 ? ret : 0;
> +}
> +
>  static void lenovo_features_set_cptkbd(struct hid_device *hdev)
>  {
>         int ret;
> @@ -739,6 +768,10 @@ static int lenovo_raw_event_TP_X12_tab(struct hid_de=
vice *hdev, u32 raw_data)
>                 case TP_X12_RAW_HOTKEY_FN_F4:
>                         report_key_event(input, LENOVO_KEY_MICMUTE);
>                         return 1;
> +               case TP_X12_RAW_HOTKEY_FN_F7:
> +                       /* Fn-F7: switch/extend external display */
> +                       report_key_event(input, KEY_SWITCHVIDEOMODE);
> +                       return 1;
>                 /* Power-mode or Airplane mode will be called based on th=
e device*/
>                 case TP_X12_RAW_HOTKEY_FN_F8:
>                         /*
> @@ -794,11 +827,22 @@ static int lenovo_raw_event(struct hid_device *hdev=
,
>          * Lenovo TP X12 Tab KBD's Fn+XX is HID raw data defined. Report =
ID is 0x03
>          * e.g.: Raw data received for MIC mute is 0x00020003.
>          */
> -       if (unlikely((hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_TAB |=
|
> -                     hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_TAB2 =
||
> -                     hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X13_TAB) =
&&
> -                     size >=3D 4 && report->id =3D=3D 0x03))
> -               return lenovo_raw_event_TP_X12_tab(hdev, get_unaligned_le=
32(data));
> +       if (unlikely(hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_TAB ||
> +                    hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_TAB2 |=
|
> +                    hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X13_TAB)) =
{
> +               /* Existing 0x03 vendor hotkeys (8-byte). */
> +               if (size >=3D 4 && report->id =3D=3D 0x03)
> +                       return lenovo_raw_event_TP_X12_tab(hdev,
> +                               get_unaligned_le32(data));
> +
> +               /* Dedicated-mode display-switch (F7): 3-byte 0x15 report=
. */
> +               if (report->id =3D=3D 0x15 && size >=3D 3) {
> +                       u8 pad[4] =3D { data[0], data[1], data[2], 0 };
> +
> +                       return lenovo_raw_event_TP_X12_tab(hdev,
> +                                       get_unaligned_le32(pad));
> +               }
> +       }
>
>         return 0;
>  }
> @@ -1366,6 +1410,12 @@ static int lenovo_probe_tp10ubkbd(struct hid_devic=
e *hdev)
>
>         lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_LED, data->fn_lo=
ck);
>
> +       if (hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_TAB ||
> +           hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_TAB2 ||
> +           hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X13_TAB)
> +               lenovo_send_hotkey_mode_tp10ubkbd(hdev,
> +                                                 TP_X12_MODE_DEDICATED_H=
OTKEY);
> +
>         ret =3D sysfs_create_group(&hdev->dev.kobj, &lenovo_attr_group_tp=
10ubkbd);
>         if (ret)
>                 return ret;
> @@ -1439,6 +1489,13 @@ static int lenovo_reset_resume(struct hid_device *=
hdev)
>                         lenovo_features_set_cptkbd(hdev);
>
>                 break;
> +       case USB_DEVICE_ID_LENOVO_X12_TAB:
> +       case USB_DEVICE_ID_LENOVO_X12_TAB2:
> +       case USB_DEVICE_ID_LENOVO_X13_TAB:
> +               lenovo_send_hotkey_mode_tp10ubkbd(hdev,
> +                                                 TP_X12_MODE_DEDICATED_H=
OTKEY);
> +               break;
> +
>         default:
>                 break;
>         }
> @@ -1526,9 +1583,13 @@ static int lenovo_input_configured(struct hid_devi=
ce *hdev,
>                                                 hi->input->propbit);
>                         }
>                         break;
> +               case USB_DEVICE_ID_LENOVO_X12_TAB:
> +                       input_set_capability(hi->input, EV_KEY, KEY_SWITC=
HVIDEOMODE);
> +                       break;
>                 case USB_DEVICE_ID_LENOVO_X12_TAB2:
>                 case USB_DEVICE_ID_LENOVO_X13_TAB:
>                         input_set_capability(hi->input, EV_KEY, KEY_PERFO=
RMANCE);
> +                       input_set_capability(hi->input, EV_KEY, KEY_SWITC=
HVIDEOMODE);
>                         break;
>         }
>
> --
> 2.55.0
>


--

Regards,

      Vishnu Sankar
