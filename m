Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFD841441E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789070352; cv=pass; b=XYPtx0UD4dRa+5XpRPU3IQAlFBK85bn1uwT/E32BtzxzsVK08/weASznFsIFbHft/6b2v5z2iMjEhYpRiJI7DWIcjd3jFFJz5VtCVVzfWMLfCn3u5hQJSyts7oOUFfJDfUj4bX39QXrF3ywZ97I87yQRktbpVGi5K2gW9eenLRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789070352; c=relaxed/simple;
	bh=ty91lziidXZxmAMM66DZHkOcSSsElmV5TL2zAt87H6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l1rbtOgdrWqgiivrjVphXeH+/AwvNcJaSdkaxVwPrxpOzygzzjPOD5HG6UzF0ar/bHZqTYjJGzGJQhsZLhfBDm/wp6XGTLZ6F1IUQX4sDREzLRWjHF/xk3I281BxlY8Y5wYvqIhq1FIJcIHVB6ZHDjql79Mz/pjG38h2XbmA7tY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mX+w3VK7; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mX+w3VK7"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-86cba60d4f2so669587b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789070350; cv=none;
        d=google.com; s=arc-20260327;
        b=halz2ex8BCjN5RoUxXluCW2u2wg+cW40SEItrrYsHOeFnULvYbHq4X9uR6QBVywYlz
         oC60+MaUTkbFTGGrfDsCeXU4Rr6RkQQNa8BD6IES7XedhLp/RkpqF1vV4K7nyeTxgYHD
         gdPkFEwa/g0fkZReQvlypFqEhmIGfJIHh4Xc/P7ZJKWztp6Rz9fhRh9XrW8EfNTF299S
         3QuPNjVRrX5SUvLKX80qKX8dlc5ITpChpYnzYkcauJn9yP8+VKxYu7ngHeS0ZDSWOE3/
         ACXBKkmqPgypmVID8vM7LbUT1Fn5EyVUTWZR/prgrsug7rrBzumVZogArOm/FwEcsKxn
         NZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x8V9Q/N2TETnzSfWfUpZ6dEVCEuKJUGf18w0ts5/6IM=;
        fh=glL33IqeX3o6GD+k0Ld6U0Uj6kr6LCFH9Bj6sd6bsWc=;
        b=GmTZqe8C3mRo/5BLT09AJheHWHnFRd0GDXdly8M17HbaD4AtktQc+awtY2ve4lCsX7
         eVsLDsrQVqEtROnBRJv80MgXzO3v+GyE/CmbGHQBJGQXWMKycoPkJNZ/yjfqc6mnnRj8
         CjBRWywGeLF7IlPBtetsrNd5TjQqNXfrIEBJ2cbwMhCCJGUonaQHuBCl3OKSbGDh4K5+
         woWlzaVESG69kpwUmT1BAlPSjx3jAFKpZfO4xmqkW/ieT6uUaNwD4jia4BSjctqwxVSo
         69KVEP5rIyLsFgvE8CKlju0aIr48K2vTmd6SoJLaDP3wDWJB6q4G+Fs9p72cPtckT/1g
         atNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789070350; x=1789675150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x8V9Q/N2TETnzSfWfUpZ6dEVCEuKJUGf18w0ts5/6IM=;
        b=mX+w3VK7+TYzXs7SulSpJiJMyww50y3L9PZeo57pIqkkJxyRApdCPWe130hI6zjMDL
         lrJxIx00aQVaIPIJMHz0XOonazmAoVCuSBF15gM2VHwzFojVF4JzQWNXou1G5hhWF6K9
         ZhdwVwUB1p0RNC92pk/eVY00ghEm90t67AGXn2b6PycEsTZCmYKHQeZQPFEMGCDFjq6t
         0xEXekyYbpl0E3YLP/ppbg01KoJdjzHGeoPRw5e/WlGHCdaHq5MIjBKgvusxvetQt8dE
         OXu12zNot/cxHWy6f12DRwXiSqHlUsMwRw14wutRy9ZyNVTtyi6c+3a92woPke1AA0ml
         cgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789070350; x=1789675150;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x8V9Q/N2TETnzSfWfUpZ6dEVCEuKJUGf18w0ts5/6IM=;
        b=GxEwxaNs1SyAFYnvYAI2J1ooTm0Uyt43gwTX97+EAVM37yDK40LGS4n1giN0VGVnu7
         h00+5c6S65JoJLLfzV70yVmdxK2FXzZEkrlGhhuIhD/rQ9EJNjilEPLtY+InimVhClhg
         WY5buzskvKG9AtgYFvdZLUtYZ5PW5sDX3a5r38Wb639U8Zs+BVF38hx0uzCotVJv7GFt
         loOJAx6i1lqxdo3ggkLrq88s9g1j+p6ZdL2ER1LuDReiEfIpzCsCPOapB3GdbegBXdy5
         DtAw5EFnjmXQQj1azWIuatCa6AZ2kF1Ld8Esi58bi2g61a7fOoyC3mXZPMvw6F9Vcq33
         ZQ/A==
X-Forwarded-Encrypted: i=1; AKwUvByRHL7+0aBLzWS7csDKtpLWQtD+ofKVVXd15bYqowelJqXf/lmnbOm4g0YQdezxkCtRdrsKHm9q/UjcTCo=@vger.kernel.org
X-Gm-Message-State: AFuF++kk1UivJt3hrJREhibfyDUT08yXNNGiUBLpuApRubjsXY4X2bB3
	kFt9guuTKPTBXYvg/OJdoJAfI+l1BHPaoSlyFbYdss/qLIx0n9kX/dQgO8+MWMcewi8B2JSH8rq
	qVcLeypGsHkNDe91WhE8bOGPr88JNNyEf+CLO
X-Gm-Gg: AYBFou0whrIjTdURD4j8KxVpVd8Far6HIDA2fCcs6iLVteaDw32v0bTESctlu2kVGj0
	ciY2NwiGuFpYsa/VkEt6Iz46352tXqo5CfvbMWDuVsXzQdROr4Z+Sb7wIzk9XmRMoZfncSvy1pu
	myv/zBE+1K8bHyC63vC78cUU6P+ChxKmT+U2+21VGgsH1rYJTDBiRVK6rNgpR+Qk2kEN8izYCst
	k0ZIbJl2Zwy07Ap3oDBbWBlUcY0fgMmZeXquiYoParh+7PUc9g+7dkEAh62ziHO18cVQtB30i8P
	0NLdRabgocCT94Ja9LoDuNiXaMHN1NwLDg0Ic/2elZb92tV9jo5yOBCy8/oCJIHzoMRe1L2ifUk
	hZiHOg+SIJkmYVbBANeVsxU7nypvdYvTSkwp7jqmOhA==
X-Received: by 2002:a05:690c:6e87:b0:841:773e:8d86 with SMTP id
 00721157ae682-884aec92ac6mr5789117b3.15.1789070350256; Thu, 10 Sep 2026
 12:59:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820140547.1148128-1-lidaoxun25@mails.ucas.ac.cn>
In-Reply-To: <20260820140547.1148128-1-lidaoxun25@mails.ucas.ac.cn>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 10 Sep 2026 15:58:58 -0400
X-Gm-Features: AcwNN1UcCn1NgQQZghiLaxTYFaiVVwdXbhlLm0BkXgLeWRgYGH9EZgSOBXNocPM
Message-ID: <CABBYNZ+meesuqnY1KUzT=khvi6b5V77U58-0ZzrTzgFvVECAPA@mail.gmail.com>
Subject: Re: [RFC PATCH bluetooth-next] Bluetooth: hci_event: Use General
 Bonding for ATS2851
To: Li Daoxun <lidaoxun25@mails.ucas.ac.cn>
Cc: linux-bluetooth@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 20, 2026 at 10:06=E2=80=AFAM Li Daoxun <lidaoxun25@mails.ucas.a=
c.cn> wrote:
>
> Actions Semiconductor ATS2851 controllers can stall BR/EDR Secure
> Simple Pairing when the host replies to an IO Capability Request with
> Dedicated Bonding.
>
> This was observed with an Actions controller at USB ID 10d7:b012,
> revision 88.91, while pairing a Sony WF-C510. After the host sent
> Dedicated Bonding, no peer IO Capability Response arrived and the local
> host disconnected after approximately 30 seconds.
>
> Sending General Bonding instead allowed the IO capability exchange to
> continue, followed by successful Simple Pairing, link key notification
> and encryption.
>
> Add a quirk that substitutes General Bonding in the HCI IO Capability
> Reply while preserving the MITM bit and the connection authentication
> state. Enable it for ATS2851 based devices.
>
> Signed-off-by: Li Daoxun <lidaoxun25@mails.ucas.ac.cn>
> ---
>  drivers/bluetooth/btusb.c   |  1 +
>  include/net/bluetooth/hci.h | 10 ++++++++++
>  net/bluetooth/hci_event.c   |  4 ++++
>  3 files changed, 15 insertions(+)
>
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 2bae85b001..e82cb0c44c 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -4384,6 +4384,7 @@ static int btusb_probe(struct usb_interface *intf,
>                 hci_set_quirk(hdev, HCI_QUIRK_BROKEN_READ_ENC_KEY_SIZE);
>                 hci_set_quirk(hdev, HCI_QUIRK_BROKEN_EXT_CREATE_CONN);
>                 hci_set_quirk(hdev, HCI_QUIRK_BROKEN_WRITE_AUTH_PAYLOAD_T=
IMEOUT);
> +               hci_set_quirk(hdev, HCI_QUIRK_BROKEN_DEDICATED_BONDING);
>         }
>
>         if (!reset)
> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> index 1641d879db..ee01795ea5 100644
> --- a/include/net/bluetooth/hci.h
> +++ b/include/net/bluetooth/hci.h
> @@ -320,6 +320,16 @@ enum {
>          */
>         HCI_QUIRK_BROKEN_WRITE_AUTH_PAYLOAD_TIMEOUT,
>
> +       /*
> +        * When this quirk is set, Dedicated Bonding authentication
> +        * requirements are sent to the controller as General Bonding whi=
le
> +        * preserving the MITM requirement. This is required for Actions
> +        * Semiconductor ATS2851 based controllers, which can fail to con=
tinue
> +        * the SSP IO capability exchange with some peers when Dedicated =
Bonding
> +        * is used.
> +        */
> +       HCI_QUIRK_BROKEN_DEDICATED_BONDING,

I don't think that works out, though; dedicated bonding is used to
persist the bonding, usually triggered with devices like the
Device.Pair() method, so I don't think we can really just switch to
general bonding and expect it to work.

>         /* When this quirk is set, MSFT extension monitor tracking by
>          * address filter is supported. Since tracking quantity of each
>          * pattern is limited, this feature supports tracking multiple
> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> index 2f5e21ff97..5496913d8d 100644
> --- a/net/bluetooth/hci_event.c
> +++ b/net/bluetooth/hci_event.c
> @@ -5386,6 +5386,10 @@ static void hci_io_capa_request_evt(struct hci_dev=
 *hdev, void *data,
>                         conn->auth_type &=3D HCI_AT_NO_BONDING_MITM;
>
>                 cp.authentication =3D conn->auth_type;
> +               if (hci_test_quirk(hdev, HCI_QUIRK_BROKEN_DEDICATED_BONDI=
NG) &&
> +                   (cp.authentication & ~0x01) =3D=3D HCI_AT_DEDICATED_B=
ONDING)
> +                       cp.authentication =3D HCI_AT_GENERAL_BONDING |
> +                                           (cp.authentication & 0x01);
>                 cp.oob_data =3D bredr_oob_data_present(conn);
>
>                 hci_send_cmd(hdev, HCI_OP_IO_CAPABILITY_REPLY,
> --
> 2.43.0
>


--=20
Luiz Augusto von Dentz
