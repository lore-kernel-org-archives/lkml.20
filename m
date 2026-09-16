Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA09C4CEE43
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580009; cv=none; b=H5OfV7WktUTu9Inn1eC5voRZJH9ZpodaLeoLxu6MErSZXF7KjRNre9wA2SbTrpQba4oJdu+PZI/rzpgPHCYsxHeo1snyeTHzNBbjG3lMij73pHcUthTELy5ucKj26YyOXguLF9UulKJIMd48CkIgqa15Cosr07Zz2uX2+UnAlv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580009; c=relaxed/simple;
	bh=GcTh15PW//gSMU/YsgyhcYFq7hKCflEMZCNpoIZgTes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nPnVkfVffX5lwJa3VuHDwZWT+Sg8glzIU0TVMIpNZu2lzjhXRyUm/EJ8BaisWW6F5BbqVn8pxtoAMdI5ii5ux/vp31I4fP0D6KXqcSnFCIui/z4PHPP4OnhNKpj1zQb3v6pzn1Uh4RdPxnR+MKq1KfkiBESB1XbEKlwp4CIHivI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRd6SvrU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRd6SvrU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB621F0089E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789580001;
	bh=GcTh15PW//gSMU/YsgyhcYFq7hKCflEMZCNpoIZgTes=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nRd6SvrUJPixWqiNVNs04n6wzX7HOjvgYITHaZIWIovGp5ADJ8mm1hVK+CmitSCYf
	 FoNS8APHaGCdQ3xmK5rM0AhPuBAHzw9+0UyYMNMTVmETontzaoUOWX4opZ/YG7nzY0
	 kXUi4TzWrLGkVdkBhXDzmhbPWUA3MfATUluVcZ+lizltBjpvOXrRGpx2Q94v3X4HTq
	 urNLtiydmj3DD28Qjw/PxHI7ZkSdP8iXW8MCSycUldY83SjERuVdT4pSgep9AxpohO
	 yK7gm2+ivfU6jV/ICE0bHdCY/AUOR8+KX0BvybfCjOcjYYPWw24yXY/qUBd8D8JeiT
	 9uj77DlPa9Weg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b88dc3bc02so1294091e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:33:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwcAXrBZKQxdOGhedyOhSTSNUUOfwLpjcpJ1OUkEtaZT8+m1wlgIPcj0CuRjr8odd3xG0kRP/d4DX3urQQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mXpEj2LysfAl3eQaIPHVm4RtAe6T/o8mx/iFpIy785MFCBWcLa
	FOxfzUr4ilXVYkokrjbxNzgskvFYTVVweOwG7fdbwAb4tN4nj8nMy+pmwKi2SxL0NvDnQ2o4uYs
	SOx0jG76+3hDuYbJd4HXf6VN64cTytC4=
X-Received: by 2002:a05:6512:124f:b0:5b0:c96:cc8c with SMTP id
 2adb3069b0e04-5b8b660c549mr1087879e87.12.1789580000228; Wed, 16 Sep 2026
 10:33:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916165055.2085246-1-vulab@iscas.ac.cn>
In-Reply-To: <20260916165055.2085246-1-vulab@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 19:33:07 +0200
X-Gmail-Original-Message-ID: <CAD++jL=oj_+WvvDqXK1GePJuBtQLOfU7vjf2HkYOTXgO4cFy-w@mail.gmail.com>
X-Gm-Features: AcwNN1WOr3a54NiznxoZ846KCk_kzFxY07htViF09enn8AIUZHYMsfgpfYGFaUk
Message-ID: <CAD++jL=oj_+WvvDqXK1GePJuBtQLOfU7vjf2HkYOTXgO4cFy-w@mail.gmail.com>
Subject: Re: [PATCH] usb: musb: ux500: Fix transceiver leak in ux500_musb_init()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: b-liu@ti.com, balbi@ti.com, fabio.baltieri@linaro.org, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 6:51=E2=80=AFPM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:

> ux500_musb_init() takes a reference on the USB2 transceiver with
> usb_get_phy() and stores it in musb->xceiv. If the subsequent
> usb_register_notifier() call fails, the function returns without
> releasing the reference, leaking the transceiver. The only place the
> reference is put is ux500_musb_exit(), which is not run when the init
> fails.
>
> Put the transceiver before returning on the notifier registration
> failure path. The notifier itself does not need to be unregistered
> since usb_register_notifier() failed.
>
> Fixes: 0135522c4898 ("usb: musb: ux500: add otg notifier support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
