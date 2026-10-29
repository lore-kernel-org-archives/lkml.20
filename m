Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793296340;
	b=tsVHlpRvZvPlQzjdePg+ykEmYaKUUl3Vr2O15mqCefuZgBWbsknYZgzvmsxLwHVDW0r8
	 cXqyJzHzePwqpW1x/m0iSKSca11yM8U/UKmZ1eyDdXUVMKZu+21lDbn5PRhupSaMzJctn
	 x1OfFl7YktbOjV/UwL77IFEmpCnyzC9Znqmh1stW0R1vVLy95FaMVW/aVujVJrDoTdBek
	 fq3/Afoo5ZP17xlOi4doeZc9rQa6ycehgLfV3ohVeEo6FrQi65dnE0ORTW9k8rv/oqVaf
	 v5EJQOU9bWqEHPMde+Ni1QpCXlG2mem5Z3OYtBIIacHZy7IME5KOqz0hV5q01mz7PiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793296340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eHP3lvMyfxaZ/g2zhWAD3Ce4Z32+Q1vfa0Q0vH3pw04=;
	b=IjcIYXcfK5rKi2XLy6Iq4msW7FCbKIMObl3YRKsbHWmWCS5C1U2WQdcbEpiicdPGR/nU
	 q/7WjR2IknuTDNQ9+37zFE4Son7nmleanKKJpiw6HiOZTW/uvB0sBCxdRet3Fk51W3R44
	 2CkN7Dy2dtvu3Iwcty7yDxfbFf1yO/VwAZTBC7sOFz2EnXRSlTX0bIE8inaSR4kZ6H0ar
	 /Fm5WSv1J/car3FTVnKNVyW+Ekd4KlopvactnC2KXakHqvAD4I7SaMHNoCgIL8AUuvIPo
	 XsThUDD9Kh9sf82hx4ojebd7x1Xd4y+pMmpLwPyb97rFYu3mUHI4gXmkvi9Z//u05eQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rGWzaHLh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03097606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03097606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rGWzaHLh
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b125371596so8578147b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:52:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793296339; cv=none;
        d=google.com; s=arc-20260327;
        b=A+xgTrdOBn7tCBOi2G4cYIuu39lXC7fFsLQbxQY7m98dJZlgHOZIbyHrGDj7mDwYg4
         6foPY2tQuPhfeYztQpKNPUsCyC783cPEUjvTW4mnUU0bg6DMxVd36VvEKm41Z+4d3DH3
         GVfdj6jEaAARZM7/hZTNK4kOZgtQRhBQTDlvobdo8m8YRzdmv1YMfn4H+DyygccWok4g
         GW+1jchuBbmazjal5fCUK5aRwwhfqzsIhHfcqtay0XJ534jBtOUpeBAwaWquddjPbeYi
         90WSaJ1YBJ27aBfvEIA0bWRxwkGLVscr4BYKTbqeb6VKdFNtaKGnAuQuoS2enc13BOfv
         V3Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eHP3lvMyfxaZ/g2zhWAD3Ce4Z32+Q1vfa0Q0vH3pw04=;
        fh=yJA1Yg8ksnigg+tqBJDGfzeFWWhH10PW1GxYFGIQwRM=;
        b=EX/QXi2uKblYGf07CLZPaTAvw6vZ9vsVzGsubMsoepnPWb7PBTbJ1085L+kmgtAXcX
         B6x86ZOEguh6TYu1ytAuANAAlCYNZreWGuiA1d1yxlYrLi7A4ysKBBu82XOroLADjBsR
         Pd7qLahzTi2Lb0q5VgOqpw/1nJcwyssXsYpaCF3XlD7lmSzGXygwa8jTH4WzIemb+/6U
         IR5Z8tdTJI2OPdHzDUQi4wK2dhcSYc3M8dZyR+d97aVyV1LPOyqhQL7qYc9WPYsjePEF
         Rb1J81yWB4sXiIDUfwBqyTAwzcsup8y31R+9ljYiK3m1OPJK42BZYLNhGJiwtV6CZIvv
         xreQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793296339; x=1793901139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eHP3lvMyfxaZ/g2zhWAD3Ce4Z32+Q1vfa0Q0vH3pw04=;
        b=rGWzaHLhZ+uZelfho7rPr2TNRWspkDvfbqXDyKACwdP7zzXuHyyhCz8IQw/vO5rUW/
         QIg+lN6dl8+izCHFwmzKsXAIJ+9ZrE/ziz1DnNZWcg3muFkJCSOy3z0UJg2sskvAIYnd
         h1LNejdmKI9b13MzKV6OHsEKtkUrKw6A8PcB/rGXMjGwl+T+ZrMK98fXb0VPIMetLqu3
         Uq7Q7rOv3qP1LfC3sd5Pi40Ua5rqfjS9NhVM8Z5IJ7gyylvIaJKmACaq090qKt7qCfHu
         2FnXq+toQwW8C2yGXJ6qICrg3yOXwEtiwA/+JXCzVsnCVzRm324vbMVcPZVejsG7auNE
         lE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793296339; x=1793901139;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eHP3lvMyfxaZ/g2zhWAD3Ce4Z32+Q1vfa0Q0vH3pw04=;
        b=Hf74etITUhn2+IJEjlJ31JUbDfT8VswRT62FRJJvmp/UaywJLHEkObuVgvgEia0xld
         8LJsEgP9LTStA9/2/QOVShxIhkerGIIesnvLI4PSEvfGb+RqnpVTGHfApSV5WTMyDDv2
         vKIIkvzvL0pY8E6a9IuLdUJvwrPTVdD8HZ1EBF66I2Wik38ow5HOppJAGDtOOQDPjw2c
         7O2NdpwztQBXdR5RcspfgxKCD0vgTN9LQEh1vq4XjrpdGKjoaHsHP+xFt9yklDBBaAyS
         EmGA9agwC4LUncMR1tRJXlhSQj+RLqS8FDUJC9BNrvtCCdhzqTOFz5Z9hJUv8bA9Bsw9
         7VMw==
X-Forwarded-Encrypted: i=1; AKwUvBxJ1768AVPGy/64LZl2MlS/gmNKSIfMUU5cnQgKdkykgJ5L4g6EgxjC8as97BwMPkSaQnFvVzt6FM8yytU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcfyYfxzKFFZHyz5BlnSNKbCtuTGAW9ltlkk/9d5GGqsiCEvHz
	NcBQjLuSg1mtjqhteK4kAVPzvh3qfuJcVxIBL9IPD1APRaZ241v8mVkQmDt3dG0c0+jIkP2+bTJ
	jgOVioE2uK+jMW9wSIuJO20v7sK8aEZI=
X-Gm-Gg: AYBFou31cryoEgVCw6JBNBWN1MxmaUU+Uwu1o3HO+1ocbC44LFHACNCO8it3FqUN8BG
	OO5HhVtLQRBzaQjrD9hGYJMOtfPVC29hgxvrloXQiR1uiKsgc7Kw2fvFjD4XbesBY5/zDUtrBND
	agmx7MeiBNyCuutJzp5IhWwxYGuxeMeTQ1e/iTJZe025VVSytNra2MV2B2uAE1/lamGBfKcppkO
	xTje0O87uacTDSOyIT1Eb5HPfoqWqhxRTfOW0tJlYAmYKnWJSanaOG5focR8YQ+2UDsoSWw/RTR
	bH0owAZXZ5jsfwPGOn1t70u4D3A2K3T0FPD3WcoV2RgxKcgdxAnasYIWsIOVK1kalwOvIjVs/4y
	C4UJUYzNnw7H+GJZN+BVHT8H8wwBD+CJ9iGDTeOzWjsx6xfKeQnWXwmAFumM7stUlkg/qzFX2Pt
	NoUXUAQU8956WcaAudvCC8
X-Received: by 2002:a05:690c:5886:b0:8b0:dadd:e578 with SMTP id
 00721157ae682-8b1c666e70cmr20250337b3.30.1793296338953; Thu, 29 Oct 2026
 10:52:18 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013032742.497402-1-cochcoder@proton.me> <20261029023235.1280321-1-cochcoder@proton.me>
 <20261029023235.1280321-2-cochcoder@proton.me> <7136cfd8f427b90d6d931a836e93dad5ea6164a0.1793296023.git.cochcoder@proton.me>
In-Reply-To: <7136cfd8f427b90d6d931a836e93dad5ea6164a0.1793296023.git.cochcoder@proton.me>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 29 Oct 2026 13:52:07 -0400
X-Gm-Features: AclHuK_Z5kTgop7vkeCslSF8nnLPmWeBsUMQ__mEMwL9udeL-MYLK_9x5od5VpU
Message-ID: <CABBYNZ+HWvU354tNkZmaHSdYZ_OF5TXFjL-_u7k-7Scd8bRkFg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] Bluetooth: btusb: support larger LE packets on
 TP-Link UB500
To: Kyle Pepper <cochcoder@proton.me>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	marcel@holtmann.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kyle,

On Thu, Oct 29, 2026 at 1:47=E2=80=AFPM Kyle Pepper <cochcoder@proton.me> w=
rote:
>
> The TP-Link UB500 (2357:0604) with RTL8761BU firmware 0xdfc6d922
> reports an LE HCI packet length of 27 bytes and eight packets. It
> separately reports a maximum Link Layer TX data length of 251 bytes.
> Direct HCI user-channel transfers verified intact reception and
> completion of sixteen 251-byte packets, with one outstanding at a time.
>
> Use 251-byte LE HCI packets automatically on this device when its
> reported values match. Limit both the initial LE credits and their
> refill ceiling to one, matching the verified number of outstanding
> enlarged packets. Leave BR/EDR buffer fields unchanged.
>
> Skip the override when the reported values differ instead of failing
> controller initialization. A different firmware revision can continue
> using its reported HCI buffers.
>
> Assisted-by: LLM
> Signed-off-by: Kyle Pepper <cochcoder@proton.me>
> ---
> v4:
> - Skip mismatched buffer reports without failing controller bring-up.
> - Limit enlarged LE packets to one initial and refill credit.
> - Submit as PATCH v4 and shorten the source wording.
>
> The first two changes address Sashiko review 219856:
> https://sashiko.dev/#/patchset/20261029023235.1280321-1-cochcoder%40proto=
n.me
>
> Validation: baseline and revised btusb_main.o compile with W=3D1; strict
> checkpatch and compiled callback regression controls pass. The earlier
> raw-radio capture verifies 48 intact payloads and completions: sixteen
> each at 27, 167 and 251 bytes, with one outstanding packet at a time.
>
> The Link Layer maximum is not a measurement of HCI storage capacity.
> The revised callback has not been exercised on hardware. Sustained audio,
> mixed BR/EDR traffic, other firmware and exceptional congestion remain
> unverified. The override applies automatically only to the matching UB500
> device and the observed buffer reports.
>
>  drivers/bluetooth/btusb_main.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/bluetooth/btusb_main.c b/drivers/bluetooth/btusb_mai=
n.c
> index 92a78a7e6..b32d3acc6 100644
> --- a/drivers/bluetooth/btusb_main.c
> +++ b/drivers/bluetooth/btusb_main.c
> @@ -2972,6 +2972,21 @@ static int btusb_setup_realtek(struct hci_dev *hde=
v)
>         return ret;
>  }
>
> +static int btusb_ub500_post_init(struct hci_dev *hdev)
> +{
> +       if (hdev->le_mtu !=3D 27 ||
> +           hdev->le_pkts !=3D 8 || hdev->le_cnt !=3D 8 ||
> +           hdev->le_max_tx_len !=3D 251)
> +               return 0;
> +
> +       bt_dev_info(hdev, "LE ACL MTU 27 -> %u; LE packets 8 -> 1",
> +                   hdev->le_max_tx_len);
> +       hdev->le_mtu =3D hdev->le_max_tx_len;
> +       hdev->le_pkts =3D 1;
> +       hdev->le_cnt =3D 1;

Setting this to 1 would make transfers awfully long, as you would only
be able to send one packet at a time.

> +       return 0;
> +}
> +
>  static int btusb_recv_event_realtek(struct hci_dev *hdev, struct sk_buff=
 *skb)
>  {
>         if (skb->len >=3D HCI_EVENT_HDR_SIZE + 1 &&
> @@ -4715,6 +4730,9 @@ static int btusb_probe(struct usb_interface *intf,
>             (id->driver_info & BTUSB_REALTEK)) {
>                 btrtl_set_driver_name(hdev, btusb_driver.name);
>                 hdev->setup =3D btusb_setup_realtek;
> +               if (le16_to_cpu(data->udev->descriptor.idVendor) =3D=3D 0=
x2357 &&
> +                   le16_to_cpu(data->udev->descriptor.idProduct) =3D=3D =
0x0604)
> +                       hdev->post_init =3D btusb_ub500_post_init;
>                 hdev->shutdown =3D btrtl_shutdown_realtek;
>                 hdev->reset =3D btusb_rtl_reset;
>                 hdev->hw_error =3D btusb_rtl_hw_error;
>
> base-commit: 1081a6ef8f1e0661fd52eb3f878691b0b96cdff9
> --
> 2.56.0
>
>


--=20
Luiz Augusto von Dentz
