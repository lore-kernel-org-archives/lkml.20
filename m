Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793291283;
	b=IXGqoCZL+bvE+uuhfcWn0q3ALUxnzulLjTWZ2cORjbk4exXvWH+XCeWXmTUVcuBfn/iX
	 sy/UwepuvuT+LfcD+EEQYSXRNyj+k7gq9b73e83vrWlkSUPF2v4aAW/QeZNkwgB6UYSKK
	 tMRpGpKFo1em9fxiVwbNj1T0UIiltGMHY54LUC45b83Z68NN3mzes7vxRWJKo3tz0kEmw
	 LPAHsTAubVI9ACKlqYReXU1HUCWXoRrFTIHfMPmshC2i9JN2L9T2ZRXfF2SohDzGrIu41
	 dpexL8W/0/+jbCy53H3izRJ5tbs+fY+68orIqNtL8DW9lGURLVBcvu0a7FKJmHyAccg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LQ37hPvquQn330cxCo8SGW3/WEute1UfVq1UF21kzCw=;
	b=hsa2yyxzAotnr3b61dPTCbfz8gk39r9cjIWw8B1b/5NgMQmufttxaBN9wbsU7llT50u2
	 +JbiIdahXMyxGc91u41TUB/6S/i33LMqaPOnxZ/fY4Kx1yRa0K40shLO8c64idslmOnAA
	 kP9gZc0YAqyKAHxalRaBIQeSd2Bx6gBIo+mWIF0rSZR1w/68eykVUtLSx1v78OqktRpHe
	 2SutAWUrFjw6QWFnD2CfuiBOKB327sllpvCNz8QJaorPwteaoKFmjzbRfpeHFzDEdSZY7
	 /vvJR4cAILbZQ/HOvz1wIWlaK5dSNul/NbED438tV5I+2kq8EHlIg9HACgdphOYmMfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HjoSan8/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01458606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01458606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HjoSan8/
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b10d24345dso22812367b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793291282; cv=none;
        d=google.com; s=arc-20260327;
        b=Zc4PE34Q4icEyuCdCoIDLYHiFjchP6EzxKy1cUv6vR1ZG3nHz4/giTcb7Rm+7eOIcH
         1lILyPPlya/UVrYvb/qW/KVdF3LjTzFIHI18XcAmuUe5ZWVgcSg1XOm0vxHEUm5PrlYG
         OiyLbwyxcYABCuwNkZa1E8EwbjzFCDaTP8+mOkzsPUH0aahk8fea2Ai2wJlM9lmPYfOJ
         TC9zxqpmvts+0YHnSiv5Zd3/G64MWlaQJf2AZ/y2jvIIa3iDv3tG8EgEik0/uDQEOebZ
         XywUM8VoE8jfvOl+X54MtifUXMDEzDggOp/o3upBQXwiML/WjEEkG6nLn3oGDNsHIhJC
         UkgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LQ37hPvquQn330cxCo8SGW3/WEute1UfVq1UF21kzCw=;
        fh=9BZZBCzk56+FSGxnJJAmjEvClX0RajEOqNhBNiqIksk=;
        b=sac1ns4FEP/KsQNs68HL8PS6ejxJv9/+mQPnpioKzMXQa+rWuU1q5D0bP6d50NoZsK
         SL2Y5aO+zcKhToiHTez1rzCyvvVVM3owqE/WoXfVb8kASBSOxIEaJmBhUhr91Qx5qnL6
         wluI3Rw0WonAujJ7AVq1NPtDxv/ATloa6Ko3B5QALrVkNIQB+e3HSU7CAJnxiSM3dSXu
         0he2MATK9lCjwYtt2kCvPcvR6te0wC+w35fmFHMSSfOvRkJQPbodSSvN2rWadCA82RU7
         Zmt6cR0R3edztoi4EtGXIzhHx1j6fkVzuxpQzKMcI84L84wsnpv4F2DlYSGe1bXvKtK1
         +zew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793291282; x=1793896082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LQ37hPvquQn330cxCo8SGW3/WEute1UfVq1UF21kzCw=;
        b=HjoSan8/zv52FMl4OuQXuVzj8JTJSp6j9wKD5+65byXrynFR74lCdsAoDxVmdJnPR8
         WxAUUtKnd+gjNA5sOV5pXkj2by7gF3+iblhP61asLLJB4/4+wts9YTkkdCV4957ZeCHt
         E1enKaP20QMf6OfBEz7aqGsjn6T9AdjP4v9YDb6oNq3Gp+uplfQGUq15z4L4F045nPbJ
         jeJDzp+zVlw+MTCCUI1sdxUPw615ahw2d+Oc0ET/gwIaRcihtqmjObXsEOrGgrXZaFgD
         yWkl9C+5I8nmx2S6p1XpuIFLMFlAJXB7vNcRcDi7hj0dWi4DdrWXmIVigfIFxDmjodIS
         OTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291282; x=1793896082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LQ37hPvquQn330cxCo8SGW3/WEute1UfVq1UF21kzCw=;
        b=dUEEy2MIGnXSUn/psohowuadx8IficOZo1Otgvg5lGyn2+C9onRuCwYgFG9VWzd1Id
         TLDtpz6gzbysmNTGWPAp/09MBvWL9LHkJCMFSqSHi09YKFo7HM4Re+5yL/08FY1hzzyS
         Y4vY+iSAWKcyIF3CDqBF/fn1Qp8gKxxZy2ZIdeb+NBaKFfdi4HMDU/VUf11iCAaDDDh0
         tkE980CERSnzS8i+0Ofj1JsDW78KFtYwfiBOdjl4z0fGQvU42g5WvJRgTCpUXBVBGKHf
         WeBjbbpHWqdWU4UEupIiruQzq8c/13puTgIACBDwncP5TLir7LcO+ePzGxKitYgVnJ71
         3LWg==
X-Forwarded-Encrypted: i=1; AKwUvBzsJ3BGDrdC+xx62N/0aeG34lNyPFU1PAYBSUf1Xxq7Tr6+4RbGVzlQdPr5v9McU//bLDpHDJS0E3IzVV0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3Gfy5qMTTaOAuWl1jmiF91POtWfmqa3Xj2W9PdeqqfnjH2KmT
	Y5pMLxQtCw3SayGEgYiiKCD7/KTRMMEO9VOdoV89P2pWRaAlHuaQGIOaXxEybZpFZTh6TQwOG+7
	Gfoc5Vp5uim5+zpCAy21ltkhpAwiTmT4=
X-Gm-Gg: AYBFou02zKZlSpWG7pGM6CaJH02JzN8fuHQaS7YzH6wYZxKAF6VpnYXALGTei02Q/uR
	DhL5b/bvHztWDfNxrcShsZXsY5LnJZ8UyAJVQkMsZzFvNVWXBCKsCZHfVEzZm3rJLA12zZxfAyJ
	0O30h8dbQLwMoMOaXzbFBO4kiQ/3YB90/daZXE8Zc0+2U3Z/IwwPc9u4fCnGvaLVyT4e5IM+oui
	e0nRNwQ2ZSsuzS+sE8C+qo2qOMeGyK1b5O939Lw1CqQ4PDNemM0phRsMWnJy5VNLk0JLbYG2baY
	0UAkL0BYiHXxdu8tljlFjv9ZVTz2H/lwH2c+weABDe0CurhvipjySe8ekGzFqtd+gYczsLtUfrK
	QP4T4l52I9qGAv4CPx4fAHhXA9XMQwv7VCxzO72AWDQ3JT5KQvWRERSkD4yQnTzo2I91KIro0bf
	3OrM3BYC0apraKqkDVb2ScxCzvCBL13HT1Zk2L9Qkyc80=
X-Received: by 2002:a05:690c:e3c9:b0:8b0:e680:6157 with SMTP id
 00721157ae682-8b1b5d0f2acmr47617697b3.39.1793291281718; Thu, 29 Oct 2026
 09:28:01 -0700 (PDT)
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
 <20261029023235.1280321-2-cochcoder@proton.me>
In-Reply-To: <20261029023235.1280321-2-cochcoder@proton.me>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 29 Oct 2026 12:27:50 -0400
X-Gm-Features: AclHuK-NgM6Qw5Y3C2mGCjEAWYJbcX_bTgC3W0mleGrwBRXFkQrCU6Q6Z-A3hJw
Message-ID: <CABBYNZK7wGJwAsVLWNhLfLXqGLtA-gtj9ZLYww20FpVL0Kcobw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/1] Bluetooth: btusb: test reported maximum LE
 length on TP-Link UB500
To: Kyle Pepper <cochcoder@proton.me>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	marcel@holtmann.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kyle,

On Wed, Oct 28, 2026 at 10:33=E2=80=AFPM Kyle Pepper <cochcoder@proton.me> =
wrote:
>
> The tested TP-Link UB500 (2357:0604, RTL8761BU firmware 0xdfc6d922)
> reports maximum TX and RX data lengths of 251 octets through LE Read
> Maximum Data Length, while LE Read Buffer Size reports 27 octets and
> eight packets. The previous RFC demonstrated 167-byte HCI packets
> with unchanged LE credits during ASHA playback.
>
> Use the reported maximum TX data length as the next experimental host
> LE ACL length instead of an ASHA-specific 167-byte constant. Require
> the observed 251-byte maximum and 27/eight buffer reply; preserve LE
> credits and BR/EDR fields. The maximum-data-length value describes
> Link Layer capability and is an indication to test, not proof of the
> physical HCI buffer size or pool layout.
>
> A direct HCI user-channel experiment sends sixteen whole packets at
> each HCI payload length of 27, 167 and 251 octets from UB500 to a
> MediaTek receiver. All 48 payloads are received byte-for-byte intact
> and all 48 HCI packets complete, with zero pending. This establishes
> 251-byte HCI acceptance separately from the reported Link Layer limit.
> Only one packet is outstanding at a time; the experiment neither
> installs the revised callback nor streams audio.
>
> Keep this a TEST ONLY RFC. Eight simultaneous large packets, larger
> HCI limits, mixed BR/EDR capacity, other firmware and sustained audio
> with the revised callback have not been established.
>
> Assisted-by: LLM
> Signed-off-by: Kyle Pepper <cochcoder@proton.me>
> ---
>  drivers/bluetooth/btusb_main.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/bluetooth/btusb_main.c b/drivers/bluetooth/btusb_mai=
n.c
> index 92a78a7e6..b654cf5be 100644
> --- a/drivers/bluetooth/btusb_main.c
> +++ b/drivers/bluetooth/btusb_main.c
> @@ -2972,6 +2972,19 @@ static int btusb_setup_realtek(struct hci_dev *hde=
v)
>         return ret;
>  }
>
> +/* Private diagnostic: test the reported Link Layer maximum as an HCI si=
ze. */
> +static int btusb_ub500_test_post_init(struct hci_dev *hdev)
> +{
> +       if (hdev->le_mtu !=3D 27 || hdev->le_pkts !=3D 8 ||
> +           hdev->le_max_tx_len !=3D 251)
> +               return -EINVAL;
> +
> +       bt_dev_info(hdev, "UB500 TEST ONLY: LE ACL MTU 27 -> %u; LE packe=
ts %u unchanged",
> +                   hdev->le_max_tx_len, hdev->le_pkts);
> +       hdev->le_mtu =3D hdev->le_max_tx_len;
> +       return 0;
> +}
> +
>  static int btusb_recv_event_realtek(struct hci_dev *hdev, struct sk_buff=
 *skb)
>  {
>         if (skb->len >=3D HCI_EVENT_HDR_SIZE + 1 &&
> @@ -4715,6 +4728,9 @@ static int btusb_probe(struct usb_interface *intf,
>             (id->driver_info & BTUSB_REALTEK)) {
>                 btrtl_set_driver_name(hdev, btusb_driver.name);
>                 hdev->setup =3D btusb_setup_realtek;
> +               if (le16_to_cpu(data->udev->descriptor.idVendor) =3D=3D 0=
x2357 &&
> +                   le16_to_cpu(data->udev->descriptor.idProduct) =3D=3D =
0x0604)
> +                       hdev->post_init =3D btusb_ub500_test_post_init;
>                 hdev->shutdown =3D btrtl_shutdown_realtek;
>                 hdev->reset =3D btusb_rtl_reset;
>                 hdev->hw_error =3D btusb_rtl_hw_error;
> --
> 2.56.0

Sashiko flagged 2 problem with these changes:

https://sashiko.dev/#/patchset/20261029023235.1280321-1-cochcoder%40proton.=
me

Both seem valid to me.

--=20
Luiz Augusto von Dentz
