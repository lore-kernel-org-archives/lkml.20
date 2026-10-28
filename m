Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793199445;
	b=1qvtiv+/Hemhm+2VOqRFxkhjs4zsWXLJu5Fj1LklY3CCheQYTeYnUoNGfvf6+34z4pUb
	 EvmEJra5WkP5h6njeU0Zg37fzhOkfCPeneY1DuW4YEkPzx8wEmtbhcROhLv7aw+izOyyl
	 aL+SDZYm7uqBbUIP2Ougj+rv8E1AodgBIn/Utf62Q9rY0V7tXvjFM6mA+SvJeptIXt5UI
	 FcvBJJjND0quBVoxyK+arPu3sSqB9bTKfwNssJSw41a7AyyebTRjQoAgYp2OKaBBkKxwf
	 HCYa4X1+3jekG/5BVk5mLuQfUXDkFgdFD+3w6urNubQAaz/4fo1pXXfhd9NfoStLv5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HkdJq15PeTOeOIwo/oNTuxDSywz7Ta3febRygWDp2/s=;
	b=mk8YBqfEK/78HrEebmoJTmVbhzwWbQvJ9vjVibWGI81Q3WqtnchD73vxBgrr0NP9r1d/
	 QSlQxEyrCZQqvRZuFpkM66BVXa7jayIY+k2HGVGxnzG9AvqWerEDGu03+itm8iqX4xW+H
	 HTdtv/hTGV+wu7eg0lZoC0k2Wc1RVD+EqhrQ3PapGd5RF8RZ+jB+v9/UJpZ2skGMJzMz3
	 HWg5+0TC5B5Y3c5kiiJmUma1JDACLUF5OjLQYIsu/e9nI6y+yPWYmGyKatrXK5zNrqVIh
	 /lr9IoOzuBHKYWisG4bLzq5fb0WNJswlO4eJ9UkEOe/gyOmMOvJC/jv3TNpYxaP5WWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NnXByW3d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F3F606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90F3F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NnXByW3d
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b13c7bb0deso7824667b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:57:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793199443; cv=none;
        d=google.com; s=arc-20260327;
        b=alVsMC/LajTbA/pifJUpm4Nl4SBr2oXp5mper+kQhCwnLOQX0d+VBDgK8U4BslECvE
         004L1aL5+9PzHE1UWXOtxJZw6asdkKVX/T/Rb5HnzYXhlLmt4BftLO8c+x6LgGzHtL9O
         ZQe9WpMDaB6OEubiqOPglr3eVHh2xvfWZ5Aaztw5c7zh3qjc7cFE4OZpyM8ihfF9ef01
         W/WPtkvqqZQG/qQqSVC1q3Z3DKbBaCsO97MmWE7c05bPOlmBdewBF0nTAcykrQjzgaww
         L6w9EBaAhrcaj/0yyfFZzoQY6X5wOdhQ3X1XOUtT/lR5iH56wKSecVPsfAvCqMV9yzay
         SD0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HkdJq15PeTOeOIwo/oNTuxDSywz7Ta3febRygWDp2/s=;
        fh=mGak1dFN9wtnnw5WqZ/R+ZPZZSdSaz4YsDBzj5B1ZMY=;
        b=B8ygBsTO1cRThokx/0YdpimTbkz7v+3igUd9n+vmpbgzE95grcFcZHXbufSHON0sX7
         jgbunv0EoRaTQwIU3U49V/gsldxQP9UHjG84Im22I15xXvmW2byxq//B8eCT5gPFsTZn
         /rERZgRxqa1j3eg5Kq5IOoREnqmbr7c7YObWLrfwwdb+naoMO4egyiCB4aPyGAFnYfoi
         +6sw7X9bX0wbMyMnxzBLNqCzQfDVtDatDq2TGUZMLWfmu1ECXYwj0cJkxahl2xBaY01M
         J6Cnb/5LbfAaKQqSxRwvbcgZ8L3lf+AEUsx/eBRfb/h9EkbPyos6KL2qxYHJiuKE8qvi
         8BOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793199443; x=1793804243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HkdJq15PeTOeOIwo/oNTuxDSywz7Ta3febRygWDp2/s=;
        b=NnXByW3dLz3DZF4C3CaeNZ+pF/bMFDYI5ZgDtr+yMAwCtES4d+14t970NrsE41YPO/
         TMGhDAVnxvQLJZGZVc2Q4lzjeYurF1VRHecBn+PaXFKGsbi6tAE4JG+KtFS3t8IX/WR1
         R6cOx6lD46tA3lVqimf5J6YKArt1mocMs/SMeVxkAu44Qjv/1LXGn+wRh+LZm0JwaVKJ
         RdwjUN+APhJ3amqn8sAydRSsG2FoU6Q8u9fr9Z5cNQZ1poVmOe0vWsNrdCe4yYfvunvz
         qxU6/zOrwrDw12IuS3HPu6+vtJBWZ3RiBMUvTjmh9I+70VJBjWOKU35mmDUijB1QGWuy
         hqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199443; x=1793804243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HkdJq15PeTOeOIwo/oNTuxDSywz7Ta3febRygWDp2/s=;
        b=ymuy0nFy73v71Dpz3KydaCHpuSL9m9M1LSexJhPUuz/qCqR1PKEOgvMPugu1y2TVW9
         4dozz+BQzrhSQvreSazqUiMn2Y6ecdlObO38G74YtdjXT6u4kVPmbaVSrZH1RZj7DQuu
         TUDQpOEKChjnaywyhVRquNf6LDsuP8hIebwkdHuhOp/LlbsFB7eNPzvDgWbza2ThMw4w
         7eD9KsliYouzS2LJPftHpe8lOVQb4nmFifXmwWBFPak3T2oTF20xDfRE/jqu4qy+lvrp
         HSq7s3cPp/5Oru2EeCCYcYsiA21wQxq+dmK3AhCCM6BfBhnoqXsQ9VrGPJwC8/lj1xe2
         L1eQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5K+gNG9aCEccd+T2avrO6GlHQAsgiYC4KylrFtJQLdu3DxonpjnSUE0Lg8q5C0BlUh7QOzEBeqi2Fbp8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGyQajEKdG3qyGzyqcs/ciK62/jkaBWy5uQRA775cttCM97tvX
	4dmu+WoOeOivw0qZKP4BJy+O6TmbewMdEGkZgugglTckjW5rGjP0TIMWvT0RwzpairivApbkUai
	aXmSbLLKQDXDZMIXUOI1LdBc/48f6N7CjztnnV+s=
X-Gm-Gg: AYBFou2kLwDjtiJ/DLdF7c1uqtzSaoY+rPIPCaLkAjXBcTYJDJ5whhvjQLk6OxqWTQk
	mYc83ljYGDywXrAIaETlJH6hozqAAO7RrTSZbyS2oCQSuZz65m5FFR9z3NzqiwkMid7FwPxDoCm
	WE0v8NP34pc5TpU1jYRh85oroR0viJgTsP4agvnrfKT1AGtTbAVR3pGsbU2f/ibo2LiJq344kgD
	jvlL3FyLjacZvpsQbU6xUL0AiUaCUEy1s3L5IFuwtjQW0SjZKfN6K5LCqqvrJ2FL62u6u2ELEpO
	nxTvjdzaf48dldiMlzvaYbsKCmaLRv8sQolZe82znUOlZ1U8D4u5dtRxNuZK1SaZhBkKbk1HtBc
	4hi7oTew3ruPXbkqtDNN3Ar6Qxse8YAAbTNIKfiJRd29di6M4oVByyb67wdQ3+QJDDkpX0jNe6t
	mMmxlEGP6UWAebXiGi2xsx
X-Received: by 2002:a05:690c:289:b0:873:5c7b:c10b with SMTP id
 00721157ae682-8b1b5b914admr14387097b3.67.1793199443482; Wed, 28 Oct 2026
 07:57:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013032742.497402-1-cochcoder@proton.me>
In-Reply-To: <20261013032742.497402-1-cochcoder@proton.me>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 28 Oct 2026 10:57:12 -0400
X-Gm-Features: AclHuK-ZpgUIA6SAE6L6fo2z8JJRtIA-USfWE7ISwEnjob9Wt4Uny0X2zEJyuiA
Message-ID: <CABBYNZJpEQt=Oef8W01EfM=LoNQCKoWkvK3roDNFm2oW666_XA@mail.gmail.com>
Subject: Re: [RFC PATCH] Bluetooth: btusb: use shared ACL buffers for TP-Link UB500
To: Kyle Pepper <cochcoder@proton.me>
Cc: linux-bluetooth@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kyle,

On Mon, Oct 12, 2026 at 11:28=E2=80=AFPM Kyle Pepper <cochcoder@proton.me> =
wrote:
>
> The TP-Link UB500 (2357:0604) reports a dedicated LE ACL pool of 27
> bytes by eight packets and a BR/EDR ACL pool of 1021 bytes by six
> packets. Sustained large-SDU LE CoC traffic exhausts the small pool,
> although this controller accepts LE traffic through the larger ACL pool.

Are you sure that is the case, or did you just assume it because it
worked? Those are 2 different things, it maybe the at LE pool is not
actually 27 and the firmware is reporting the minimal rather than
maximum for example.

> Add an explicit HCI quirk and enable it only for the tested USB ID. When
> set, treat the LE buffer as shared so the existing HCI scheduler uses
> the ACL pool. Avoid inferring this from buffer sizes globally because
> other controllers may have legitimate separate pools.
>
> Assisted-by: OpenCode:gpt-6.1-sol
> Signed-off-by: Kyle Pepper <cochcoder@proton.me>
> ---
> Submission review notes (not part of the commit message):
> October 12 N8/UB500 no-quirk trial opens CoC, completes START, DLE
> and 2M, but sends no audio frames and logs two watchdog stalls. The
> host advertises MPS 23 instead of the baseline 512; peer MPS remains
> 168. Firmware pool semantics and simultaneous BR/EDR/LE accounting are
> not established. Keep the quirk device-specific and this proposal RFC.
>
>  drivers/bluetooth/btusb_main.c |  7 ++++++-
>  include/net/bluetooth/hci.h    |  7 +++++++
>  net/bluetooth/hci_event.c      | 22 ++++++++++++++++++++++
>  3 files changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/btusb_main.c b/drivers/bluetooth/btusb_mai=
n.c
> index 71d8dccb2..5e1fb26ab 100644
> --- a/drivers/bluetooth/btusb_main.c
> +++ b/drivers/bluetooth/btusb_main.c
> @@ -70,6 +70,7 @@ static struct usb_driver btusb_driver;
>  #define BTUSB_INTEL_NO_WBS_SUPPORT     BIT(26)
>  #define BTUSB_ACTIONS_SEMI             BIT(27)
>  #define BTUSB_BARROT                   BIT(28)
> +#define BTUSB_USE_BREDR_ACL_BUFFERS_FOR_LE BIT(29)
>  #define BTUSB_QUALCOMM                 BIT(30)
>
>  static const struct usb_device_id btusb_table[] =3D {
> @@ -872,7 +873,8 @@ static const struct usb_device_id quirks_table[] =3D =
{
>         { USB_DEVICE(0x2c4e, 0x0115), .driver_info =3D BTUSB_REALTEK |
>                                                      BTUSB_WIDEBAND_SPEEC=
H },
>         { USB_DEVICE(0x2357, 0x0604), .driver_info =3D BTUSB_REALTEK |
> -                                                    BTUSB_WIDEBAND_SPEEC=
H },
> +                                                    BTUSB_WIDEBAND_SPEEC=
H |
> +                                                    BTUSB_USE_BREDR_ACL_=
BUFFERS_FOR_LE },
>         { USB_DEVICE(0x2357, 0x0607), .driver_info =3D BTUSB_REALTEK |
>                                                      BTUSB_WIDEBAND_SPEEC=
H },
>         { USB_DEVICE(0x0b05, 0x190e), .driver_info =3D BTUSB_REALTEK |
> @@ -4748,6 +4750,9 @@ static int btusb_probe(struct usb_interface *intf,
>         if (id->driver_info & BTUSB_WIDEBAND_SPEECH)
>                 hci_set_quirk(hdev, HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED);
>
> +       if (id->driver_info & BTUSB_USE_BREDR_ACL_BUFFERS_FOR_LE)
> +               hci_set_quirk(hdev, HCI_QUIRK_USE_BREDR_ACL_BUFFERS_FOR_L=
E);
> +
>         if (id->driver_info & BTUSB_INVALID_LE_STATES)
>                 hci_set_quirk(hdev, HCI_QUIRK_BROKEN_LE_STATES);
>
> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> index 1641d879d..d39a64663 100644
> --- a/include/net/bluetooth/hci.h
> +++ b/include/net/bluetooth/hci.h
> @@ -375,6 +375,13 @@ enum {
>          */
>         HCI_QUIRK_BROKEN_READ_PAGE_SCAN_TYPE,
>
> +       /* When this quirk is set, LE connections use the BR/EDR ACL buff=
er
> +        * pool instead of the dedicated LE pool reported by the controll=
er.
> +        * This is required for controllers that expose an unusably small=
 LE
> +        * pool while accepting LE traffic through their shared ACL pool.
> +        */
> +       HCI_QUIRK_USE_BREDR_ACL_BUFFERS_FOR_LE,
> +
>         __HCI_NUM_QUIRKS,
>  };
>
> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> index c055d16cf..9936f6365 100644
> --- a/net/bluetooth/hci_event.c
> +++ b/net/bluetooth/hci_event.c
> @@ -1227,6 +1227,24 @@ static u8 hci_cc_pin_code_neg_reply(struct hci_dev=
 *hdev, void *data,
>         return rp->status;
>  }
>
> +/* Use the shared ACL pool for controllers whose dedicated LE pool is kn=
own to
> + * be unusable for sustained large-SDU traffic.
> + */
> +static void hci_le_use_shared_acl_buffer(struct hci_dev *hdev)
> +{
> +       if (hci_test_quirk(hdev, HCI_QUIRK_USE_BREDR_ACL_BUFFERS_FOR_LE) =
&&
> +           hdev->le_mtu =3D=3D HCI_MIN_LE_MTU &&
> +           hdev->acl_mtu > hdev->le_mtu && hdev->acl_pkts) {
> +               bt_dev_dbg(hdev,
> +                          "LE buffer at minimum (%u:%u), sharing ACL buf=
fer %u:%u",
> +                          hdev->le_mtu, hdev->le_pkts,
> +                          hdev->acl_mtu, hdev->acl_pkts);
> +               hdev->le_mtu =3D 0;
> +               hdev->le_pkts =3D 0;
> +               hdev->le_cnt =3D 0;
> +       }
> +}
> +
>  static u8 hci_cc_le_read_buffer_size(struct hci_dev *hdev, void *data,
>                                      struct sk_buff *skb)
>  {
> @@ -1247,6 +1265,8 @@ static u8 hci_cc_le_read_buffer_size(struct hci_dev=
 *hdev, void *data,
>         if (hdev->le_mtu && hdev->le_mtu < HCI_MIN_LE_MTU)
>                 return HCI_ERROR_INVALID_PARAMETERS;
>
> +       hci_le_use_shared_acl_buffer(hdev);
> +
>         return rp->status;
>  }
>
> @@ -3939,6 +3959,8 @@ static u8 hci_cc_le_read_buffer_size_v2(struct hci_=
dev *hdev, void *data,
>         if (hdev->le_mtu && hdev->le_mtu < HCI_MIN_LE_MTU)
>                 return HCI_ERROR_INVALID_PARAMETERS;
>
> +       hci_le_use_shared_acl_buffer(hdev);
> +
>         return rp->status;
>  }
>
>
> base-commit: 964430c038967fd06643e866f68115664e1a1bd1
>


--=20
Luiz Augusto von Dentz
