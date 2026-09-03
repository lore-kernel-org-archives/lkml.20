Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29CD4CC27E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448623; cv=pass; b=KXUTrBpu4A3X9XCz1djA3VosqVxsa0r1uVRq7w0IegTKfz8OgPn2GKmXNPonvdnpWAjB4dOy+zfA5eC/HsK3aU14ShLrVyIkpDcuMyZCQjPpItm/8eIOPqJKxepMLeR1HEglOcMwkJJd75rnQUXCbnIX2JCU9p47BCiqiVh01lQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448623; c=relaxed/simple;
	bh=3nO+ybbrISHzWCE/RSykvCpqbQJ6kWVwwUOLxAq6PRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FDg1DhWqYXtHwdB3H8Lfb5CLe7VsVZD+0vCral0oGkArsevLu75ov7vaNZ2CB/mOdYHFzSlWOovdKFox0YD1G5O1WdmoHaMgONaHv2+0E/N4RjxLqvQMDzqMm6zJOl5P7ePY0Zn7r6Fa7GJCDxABlrHvusZBFk6iDLVe/rLFa1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4CA+vyA; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4CA+vyA"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-85b293528a9so11775407b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788448619; cv=none;
        d=google.com; s=arc-20260327;
        b=ZO0VZGt5KpZx0Jf+hONKvkexNJreABJOPMSDa6jkn9X1e3cC/AAh0mhdd85RlqujXn
         yx6jtyBE9d78NAy7EBJcDnTttZiHewWphNfdqkNRHmSD6G/uYvFEoQpFyra/6s1b3UNv
         VbK16y56yTW+v6eCpkLrTMHSYTXBR994PahvsYAS+spUwDc7vK405SeoRGt6sVGBwC1n
         oodv2XbQ8ax6bR6g98uFmZehcqqoExG+cUykfXwnVRaFvypW6hLMLVEcn+lpgaM9Mh5c
         /4c0PFJ5mxgbPX9wl1P67hTfOOFdUPM43j7txlLES4FHO1w9/Mzl2ioMCaDsFNBrd2Hi
         WGWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=REvth/bA33eH5i15g/1PkWYeT0j/pthj0cdPzhJU/B0=;
        fh=b2+hdYzJoDdehcUb5dcsHbU+XqoWSCHcuobYtZkhv6E=;
        b=fzvXZXz13OXqB71AUz4fBSlr6ktizSa20Ica3Hqm7VNO+X7N56OPLVn465RyVvvJzM
         vW0c4LpHdzbGDeWiqxsMyF1OpGPfN+Klos0pW2ZTJfIK0Ey+biXHK4aB9TOcSUkcIPEb
         TYgSz5lC4p/bUqDCN4V20I4qphXjlO96xRtv4471gPZIUbTMqau3XLv9rG52NdhfxEWI
         yT/6BpAES9upRd8YHo1JRps/MmJg/CgTeyQMhMjRHyIcn79j9lWsgxqH12HS7RisqXvX
         OSGse1+2mRlpKsAwdXx3xaJsVEuJtjQ78zJJlTeBcyxZ9SPKQ4jcKqSHlarfnavPGblV
         UJGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788448619; x=1789053419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=REvth/bA33eH5i15g/1PkWYeT0j/pthj0cdPzhJU/B0=;
        b=a4CA+vyAGGi80T9bVirYJlh2u7aeDOVvD7YpoHGNRaT2zSGRWS6iwtXjNgOG4Q04fr
         9zZ6qD8H2Jnchw40qdgrB/FC3gBMvXRw1pH5cJUZhAWObZU0FMPwVL/Uem44VJNdMr/7
         4V0ZhoaTS2hben68r07SB7NziEuJxRbWp2TyEOwDgs3VwyFduoKce9ivVyB5PF/CE9ta
         D5BDlXgE9PYvgMJFBBgb9abdXs+zVIFJvxmp+JWJbc7irmzl5zsY0+VKpwpz7U61Pzoi
         J13NVjAjY37RhyqX3nSMlNUj7KrrZVBwTG3C7UmfvbpRrIVjZFGD1YpJQcwfSkIDVNjH
         3uuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788448619; x=1789053419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REvth/bA33eH5i15g/1PkWYeT0j/pthj0cdPzhJU/B0=;
        b=gTbY+MW4WzyjzJsv1Jzrba4Xad8AEGKBjifOL84N8vKQwBIl+7j5iyqovop1mY4APC
         xuUPs3NCsYTEiHPNPy2TvLCV0NsDSqBCgj9tWZpQDKKmstsrcz3lodck2qk9q3FVWkFT
         CBMdSQJ5RBm2s+GU1euGJ/koYUKfBUixEdxH/02XuJOpyxm+16HcATlvNd8tDzmmLlku
         XaG5x6g2ypj+ma7PwLo4Xn+7mQlk0yvherfXn6NOP11/FXw/eTzk0dMmJTCnL2g8Y1BH
         5B803C+2YdokvAzcSfI5EujLwNXTaFT9yT8Zumx9724GiNb7hUdueXY9CM6EUp5x/mii
         HCqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnCDwGW5xj84fkD+UMVhNwtWa254ktFucuqEVxseQopgsJ3VxmY2Udg2iZ2VYZNmcbEVWhljmmUntV+80=@vger.kernel.org
X-Gm-Message-State: AFuF++mHPQP7ZLPJ09n9zOoxAEsJNW6CUPjR8TNnep+f6Fn7517Qkvf1
	Eu5GUTwNUkcVPOBhwzbpgP5eVUAi+TKKd0eb+cMvpuL2cJb5Y+zbdXdFA2GLQE7SlSpbl34TWLo
	uYck0OQ6RmbuZzFgFI8YZmEMZpYJlOGk=
X-Gm-Gg: AYBFou3p7nVerKTnE71yno0PlHvuwXtfF54Uonix1bxRUjh2uOo3jJFgJltCfLt9/RJ
	XsYevXNNDpmKFHib7o/BOyjBtSbxI4MBHIiv06461AYpucJ58oVZYXA1P2zFAaZNA4zeYv9kdiJ
	pMZPzBPALcHCZEzOz/RqSTdZ750LEx1wgj07MeD1n/EtEGA8DgbollQDnwJzQMXQODZ7fQo3UBG
	q4sxT7OlRXQkZkPRA81h6pLROTVymGZxY38N3LhsbheuZDsUX6iJFs3+LzWxTEkMDXHw1dqYPZv
	+9lWLs5Cazm3etRYMLkxP+5eAtDRQnIQUea5ogmIxNpwJU8fn8prLR65ZiDXlxwU9AIpAxlxBF8
	ijGEWJSsNfcINf2uPLss5flbl6anVDP0=
X-Received: by 2002:a05:690c:dc9:b0:7ef:9fd9:db07 with SMTP id
 00721157ae682-86e6fc68c34mr35588107b3.12.1788448619242; Thu, 03 Sep 2026
 08:16:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-vendor_hci-v3-0-015d62a57c91@oss.qualcomm.com> <20260903-vendor_hci-v3-3-015d62a57c91@oss.qualcomm.com>
In-Reply-To: <20260903-vendor_hci-v3-3-015d62a57c91@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 3 Sep 2026 11:16:47 -0400
X-Gm-Features: AcwNN1XsAEB8Wh4URhk1xImIPD5ruvxRdIZQ2leJ_KFm59hMlg7ME_SltA7IF48
Message-ID: <CABBYNZ+1PqFXSqAPNC3krSaTccv4VT7ERNRWkO-pCg3k+qCH9A@mail.gmail.com>
Subject: Re: [PATCH BlueZ v3 3/4] doc/hci-protocol: Add BT_RECV_VENDOR_PKT
 socket option for HCI_CHANNEL_USER
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Zijun Hu <zijun_hu@icloud.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zijun,

On Thu, Sep 3, 2026 at 10:47=E2=80=AFAM Zijun Hu <zijun.hu@oss.qualcomm.com=
> wrote:
>
> BT_RECV_VENDOR_PKT controls receiving vendor packets over HCI_CHANNEL_USE=
R.
>
> Disabled by default to avoid regressions for existing applications.
> ---
>  doc/hci-protocol.rst | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/doc/hci-protocol.rst b/doc/hci-protocol.rst
> index db10b35df736..53734a0037a9 100644
> --- a/doc/hci-protocol.rst
> +++ b/doc/hci-protocol.rst
> @@ -131,16 +131,34 @@ Example:
>
>      uint16_t mtu;
>      socklen_t len;
>      int err;
>
>      len =3D sizeof(mtu);
>      err =3D getsockopt(sock, SOL_BLUETOOTH, BT_RCVMTU, &mtu, &len);
>
> +BT_RECV_VENDOR_PKT (since Linux 7.3)
> +------------------------------------
> +
> +Control receiving vendor packets, requires hci_channel to be set to
> +HCI_CHANNEL_USER.
> +
> +Default is disabled.
> +
> +Example:
> +
> +.. code-block::
> +
> +    uint32_t enable =3D 1;
> +    int err;
> +
> +    err =3D setsockopt(fd, SOL_BLUETOOTH, BT_RECV_VENDOR_PKT, &enable,
> +                     sizeof(enable));

I don't think we ever applied this socket option to the kernel,
though. Anyway, I think we are better off adding another channel,
e.g., HCI_CHANNEL_VENDOR which can then allow packet type rather than
just the known ones.

>  RESOURCES
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  http://www.bluez.org
>
>  REPORTING BUGS
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
> --
> 2.34.1
>


--=20
Luiz Augusto von Dentz
