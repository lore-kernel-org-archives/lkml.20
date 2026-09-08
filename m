Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8917D563FD8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882446; cv=pass; b=UtsF+Ww5Es5v/qse0QnHj8thVGzZ1vrO20qsfIbKF9n6Sqlh6936EvIhyxn7I5W9hSRZOaKVQActOvPnMD3m4ViF8UVf2sQV8TahYcwQ4qfdmg5aRhwExOp7E0z1XqJdxlCkPvS2lfQU1r0tgQCNzMO27jyTfj3B2yrtfxtsaQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882446; c=relaxed/simple;
	bh=/gsnZQcsbiXQbrVg5jm8zjgIYcac93sU5h0gQJ8gm6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJ/dYjQrVImu8vmEu2yfOneAHKccXsL7yRUe3QS1A5B0ZXHzPea4mdP90CAJYVArCd/6IP/q7n1un0YYCWLMuoMUB08zDqXI5fyrgHSlCHjc1dKEXShXW5oW2MdrieXAGdodUBj2kXKPnXt3Uu24tPvdHjp2cO3lU67tVfc643E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REqqusUE; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REqqusUE"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-857ff9fef54so43921087b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:47:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788882443; cv=none;
        d=google.com; s=arc-20260327;
        b=YgODAVrUUo5+CQpjxJ/GubB507DM5zRviYNhW2/8zD6WL7uPmQ9tBh7aZHLboRWX3p
         T1lkE371nOH83ZkgUyEEaMVSeRcOL/idq0gzsKRJPIeo86XNJKI6ZK688ikbglIaOsm8
         eZw5gsaWSZK/xzrKhc8FnPAcm26JLnFYdMJ4k8LeN9JgM514RVlrck/anyOlu+mmjl2L
         D+aXditAvBf4XBsdAj83e7nqX3DylbMTVDxIRmwCPuk9A+dWFVlYA8SXEyyM5ZBiyc5G
         3YwhNEO18dnIpRZAeHD72mGmHGb2lTTt1Bec0wNvdgxm3r2tl0tb03E7wE1sidYJlg1p
         aYLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oLshI+8aYbyGh7S/ZjJf7W8M+Vq4mxSjxpZV6utkZX8=;
        fh=V2WTeJXVOwGL5ui3ygZVglTPOgaAD6b96E7HMpxMI94=;
        b=kFMb1ovzccsOEDwsCiPckXizZWTn5fvDJRqo1fEkJLJeDaZtrILZZcgNKXgwRYbLS+
         3bQcW0ID3mPpBg2hjpqEAeJRaEoV3KIFROBmRTyPXz8mCVDZjs6mooZblvpHDPFP7XCw
         mFnqEIh7Rfp6E2BYOlzExPdv4fFPyT4HdsCUKgxmYdactn6oKpiEYsRUIhdzSQzaP3za
         yW/1jiYPoyWoWXdCf/YgsBDmZMzxEk7iuYIk2o3iuUQp+Q6LRC0eIcmTdOFCFFqs+v43
         ycNMTJ3CeQS0CVpFi56deKa+7cazEUDrVA1ejK0fg/JaaraouHYTtq1vTOcgC5htgwEe
         3A9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788882443; x=1789487243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oLshI+8aYbyGh7S/ZjJf7W8M+Vq4mxSjxpZV6utkZX8=;
        b=REqqusUEeskwGd+LEKzhBh1ImPb6DL5KbhYncIBsghAjLBfIfc+EJWwYHuvNaxXcl/
         3Ocmr26b1uzGxNm++mfJ0PV7sWM+MY9Sx4azx3BZe/zl77HGi4A2ild33Uu6O7QBusve
         WBstiaaHUOKbUfd33bHMB03nccN7Ywmsgn4VNxFwGJ2YB9IOJ8RHZ6NgkGV7rnlM51Rw
         uq+eTt0Czp/v3Xz0vTRnB1hxsvOlx7P6PwvY5DLJ4ftEy3UE/Z0V1kyQJHDPLrJ3oeLi
         KgIE2RTH81WLg6bohLHjdTe3POGxi92OIix/K29czbgaqoer3EknXJYKSYYYwFo9mWfg
         nReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788882443; x=1789487243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLshI+8aYbyGh7S/ZjJf7W8M+Vq4mxSjxpZV6utkZX8=;
        b=gWXVhZmGwhHiEARtGb4jqoh3woWqZApTTNso/9T1eUzw5NZMshAGoO0/FGu3CmEWL1
         ooZ42fsd6zg6uvGW8T5NqtYNL14bOIYVECWVqnF46JiNXpoA6fUsNxXbGO8ptxZ1fBR/
         uTOtgQZ9KQm02ANAln8eLHR9ei6qf74uvcnouHUDiL7upEpSJxVQOqxfBTV0dTlB8qGI
         Ws5Nngd1d6EbyTWV7lVHom12N66uGDnqFj1ibvbf6CLqI1HhXFN6JUsTPRi1USfRsZlV
         0T6PWKpIHqjSOv0sIxJNVFZrjXWKmU8kTrjPTH+fQwSPdoDv5XePVvfX5uu5bWczbYgP
         8zHw==
X-Forwarded-Encrypted: i=1; AKwUvBzlqxen+IDI9Yxu3mZl+8hpJzis8PcUCfAUhaFhs+ePGPEhI7QB+uV/MSP+gZQX0P14ymOJHWGFHwr4pJQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k3tz20wad/1ZCkmd2WIATSX3cU0jDUghMVzMnoe/k0WtOkRFNO
	2nDYMAcl9d/z6e2fz8YSwYmSxJhFIqn5Ar2D2eB6jsCF2icB4MbUL7UI3eN+cSYzkHSTffXQBUc
	WtT0fJD1QVGNp5K4FZ5GOAFTK0oNzcDQ=
X-Gm-Gg: AYBFou1GWT97lHEnv9E4EnYr+o1ERcdn+JiY6261G0PQepuc5ocJQuFMAXMpaPatUmz
	KnuZzZa/grGOsbj9+wY/lmWssV5feGH+MeaLFdw7H8CXUhWIpqbtVj2L9KrAtLr4ZuhiPpgocID
	D17de2swm7W1vnKUW71aKICfrvFY6x9RKsmqxk2NEZ2qVC1y4EsSvGZ8BgWLMShSqD8q9rxoE2y
	WPpC90DGABc41CUZLL1bTxAuJsw3uyIDsbe+ZUXM40B3Zs1el8SWqL0YqkY/UGqxRyCc+2zoG7+
	Vc+F6E+XaW5LBcdfopR9s7NpC0Iyd9f6HnLyx2qajx0eYRERXTigtQLcwD4d8fbSGFW62bYiONU
	eOytz9I13WaF+t9dfZgqQY3nNIi1saSjE9zSUUc0=
X-Received: by 2002:a05:690c:e3c1:b0:86f:c1db:14c7 with SMTP id
 00721157ae682-8712259664fmr96188427b3.7.1788882443248; Tue, 08 Sep 2026
 08:47:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-btusb-skip-non-hci-ifaces-v1-1-32dda494122f@nordicsemi.no>
In-Reply-To: <20260905-btusb-skip-non-hci-ifaces-v1-1-32dda494122f@nordicsemi.no>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 8 Sep 2026 11:47:11 -0400
X-Gm-Features: AcwNN1Wm1DJTXl1SSHT0RevS3ilTVO2buaToGeTZYyevXQPtMnXLDkiRvgpGU78
Message-ID: <CABBYNZJ1FHSfrvLCVALdbYJ_Sn6xMZ1p-zbJdDbq=Exfa=xfWg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btusb: do not probe non-HCI interfaces
To: johann.fischer@nordicsemi.no
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johann,

On Fri, Sep 4, 2026 at 6:24=E2=80=AFPM Johann Fischer via B4 Relay
<devnull+johann.fischer.nordicsemi.no@kernel.org> wrote:
>
> From: Johann Fischer <johann.fischer@nordicsemi.no>
>
> If the driver selects BTUSB_PROTO_H4, the second interface (voice
> channels) remains unclaimed. Then, the btusb_probe() is called for the
> second interface. It misidentifies the interface as one that supports
> legacy mode and fails with "failed to enumerate endpoints".
>
> Signed-off-by: Johann Fischer <johann.fischer@nordicsemi.no>
> ---
>  drivers/bluetooth/btusb.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index dfefb43fb792..44f0db347643 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -4293,6 +4293,11 @@ static int btusb_probe(struct usb_interface *intf,
>                         return -ENODEV;
>         }
>
> +       /*  Skip interfaces that do not implement the HCI transport */
> +       if (usb_find_common_endpoints(intf->cur_altsetting,
> +                                     &bulk_rx_ep, &bulk_tx_ep, &intr_ep,=
 NULL))
> +               return -ENODEV;

https://sashiko.dev/#/patchset/20260905-btusb-skip-non-hci-ifaces-v1-1-32dd=
a494122f%40nordicsemi.no

Afaik it is possible to have devices implementing just H4
mode/altsetting. Perhaps we should claim both interfaces to avoid a
second probe?

>         data =3D kzalloc_obj(*data);
>         if (!data)
>                 return -ENOMEM;
>
> ---
> base-commit: 88a8184cb44c8952e6a6fd21e250445300d1c7aa
> change-id: 20260904-btusb-skip-non-hci-ifaces-b52ea298677b
>
> Best regards,
> --
> Johann
>
>


--=20
Luiz Augusto von Dentz
