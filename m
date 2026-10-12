Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9FC3E765A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791840870; cv=pass; b=f36G9OikDxDHqRx2AxEm2bEROJipQyMdYnlqpxNI0Ev5S3tdALy/wN8DvkRto6vKe8dLDinqtmf3lIX7+ehzq6WYGtpCu8WyiDeAmiK6mJYMaVtSL/59/mz8/AV2Cemzy0mPg+iiRqD8ql57FAaHHhkV8UgR4gr2pecTFILb83w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791840870; c=relaxed/simple;
	bh=/bJ5PQP4uoYZBIo22Fzx5lB/ygVpuCF+t05OUgq3nrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T80bGwGUoIXpI7g0iMvjraXkM7PJA+DKah9O9CiVWATT96c0ysntvt5Lks9x6wTNe/G2ltruQCVnbddkvRfbZYFuCtAnK7RZp8XIZvS+lY5e9KumgldhqPeQAy65MBwLhQOxxCcwcE38tV+S3ROr7S7VzMnOv0bi5jGb9+7QojM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=hyslrloe; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="hyslrloe"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b09e07e149so11983387b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791840865; cv=none;
        d=google.com; s=arc-20260327;
        b=p3PAuAVK/WwkbFj1ubbU3Uaq/ihKMTLJI+r0/IkbjtVot+pKp+276yLBpaqLxvzuKL
         yF1M86lK0lRhUPVkEw5dAcB8axSRjXq0qq5dcvJVslzNW3/1E58oZxD2+NMXC0uHdFlr
         ep27aN7uqX5QEOl4vewqhXgpJvryIbd18EJm0JH/q0omBfFgCLN/5lishi5+Juh7aOuQ
         FQ8bccJdtSjUQf0kzXa4tE40HRzBwrBdJcPXDZWkcrs99r5+a17T0EzN29dkoNquNJUQ
         FVnLB1uvbsexSJDgNjmZ13ODK8B8pwf/WFOoaPai+F0V/vOdOallzCO6d64RSWXtIJXq
         ElOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ysmRiqiC15vYpG/lYmDhf4jWZxZpBo2Htczu87XzkBA=;
        fh=4pDyneEacBnOZCAWI4eb74Ag9Ed9tRxvba3/VlRTDvM=;
        b=r9s1lmap3gnBl5Q2GyVwuxobRpzM72CRkxzH3LsvtSNGU0ylqrf6zZTQ5ch9vNBvgt
         GBYpowZmRCP/da2jEE6D6LTZkWJ2eJVgsujzVYjpKZ6nxrgys5fhJM72qSyCaABgvw8t
         6t8RAsivZsdXqXeWW7V4zRA9hvl4wyATMpaZKugFBfvpf/MHGh2fYRZY9AQHVCDKA304
         YGDVOxXdky7UpgvFjBh1g1zmjZK3uOkTkAsuDJR+8W7Q8mWybLBTn0t/UWdaOxD3l3Oh
         nPRiYEAhisaqXpQrIjpskIJNc/x3CDskD9n/b5IKXHdf1geTnb5i7Blp5MdnnXLwfWe+
         C5vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1791840865; x=1792445665; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ysmRiqiC15vYpG/lYmDhf4jWZxZpBo2Htczu87XzkBA=;
        b=hyslrloec1zhakASu16CVHaH1MEMPk4jP+epSDIEaD3BxKb48lqPSzFO9cJWpZDqiP
         lw25luTM7J8GC2qkLio35jeqIm/ZbsJqVEH7NsP+qAbYjFmn8fVwtkL3+7AU2GNkgMy+
         yq3L9M4ZyCdiBOHVJORO+Wg7Seutmz64XxSn+c2LHcyqFcnrpxovLrCWyG8R7I2XEUYL
         2L5ZpstCoKqyVcOP1ygcCzWdI8nrma0/lBgMd3DIi6htavNicO6PkmmiLp4KGzYvg7Ig
         8DY+Tqj81qtuMxTP0k18k/w6we/1jHfUO25ZVGwolJk75uS+w2Q71IZGYpHHz+bCD5N9
         TebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791840865; x=1792445665;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ysmRiqiC15vYpG/lYmDhf4jWZxZpBo2Htczu87XzkBA=;
        b=KylABdGpGkhJNpufyJudcT/dbMc3MZsiOhQaXdrYyEZPfSxH2xJrKEEWIHbeAPob5/
         2+o9UOq5fTeOLoXYs+Ahx56pe93mVAzf5j6qj9OUtFYqpywmtA5GUxn8KDOhgJMDBrM8
         DKbvl+i6p/HWs+jANDu0x6qCdKKaR54VBdG3V0fS6xUJYXsJ6hut5qrRH6wybZ4Dzw8j
         ci85DzJiZXRk6BAj7Dc9z1+xcOIjkS4hoGdCqpXbN+6VdU0ndRByo+73R2RhqNJRFmDn
         ZvoxmLeGs45YnzLy2fhq4li/gim0QgBgh4xrOGjC7sOQ9Kg9W3g244tbjZjZu+t/uLig
         tfeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPedNfxggy3JmTCkZRWv19Uoy/wbovVMjvxbb9IOGyl4RZyHHyYkSqDS7PqD3PlAitZpc9xTsW+TMT/wk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpLotrINb32YJDqRRuMqZPoaF9CJh/k9TMKi7JGbwjHzarnHdV
	uEKijmC82b8r+qVqdzFgEHqM+wR3VAI5tJ9kp8lmFi/AVWWdNJa16h1S4Str/nHVbXzXqDRWD+P
	yUm7Hg2hdSc+emWeD926SPPuOHXtoAOm+KAPOCw0nNPOPXlEBmCUr8CCl
X-Gm-Gg: AYBFou34jVSigub0aubnXYntKzzWlZJcoH0CBKy9xN1y9DrXRJ+cmFFkK4xMPguMoEw
	qswJE6WRp9o0szoFYEcFAs+/wzoaExHGnJtUZQyjHh6Gw79D8wwwS7OBxVfwxUn7VIvHM0dV8Ns
	QOlloIRJ+ee0W7f6Z0sJ0Y+t4VkZxxIGO9RpBCl3IcnYA6nyOlgkqCmStxYSMfUQyu48EWMq29D
	ztJiMZBcvwu646Mt5EEWAOBynt+Z/E3fSzR0SH9MntdxE/QDtdigcjK1NffLZeBctp/gtucbRam
	HtYRDnP6SgER3dAdmUBFbDdNgL1DAqMHelYFklg9S7Q9Gy/nfkJbCOvj9I7DPpjsY/vjbkWRCCt
	pqnqDvprIyTDywp16CKUj
X-Received: by 2002:a05:690c:a652:b0:89a:63da:fab0 with SMTP id
 00721157ae682-8b07ee4c479mr23157817b3.107.1791840865295; Mon, 12 Oct 2026
 14:34:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783352430.git.sean@starlabs.systems> <7acac70a471452a6ccf23b7ccc557f3c3861e0ad.1783352430.git.sean@starlabs.systems>
 <20261005103011.03175826.michal.pecio@gmail.com>
In-Reply-To: <20261005103011.03175826.michal.pecio@gmail.com>
From: Sean Rhodes <sean@starlabs.systems>
Date: Mon, 12 Oct 2026 22:34:14 +0100
X-Gm-Features: AclHuK-f_thTWraeWd7Wac9OHXbR64A-8Mn1b6vg99UV8M_3MiTAJtpOrwS45N0
Message-ID: <CABtds-3t+ECCPeFShq__iNa9niRAge=WOED4cHtNZAFVw6kPzw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] misc: rtsx_usb: avoid USB I/O in runtime autosuspend
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ricky Wu <ricky_wu@realtek.com>, 
	Lee Jones <lee@kernel.org>, Roger Tseng <rogerable@realtek.com>, 
	Dan Carpenter <error27@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> How is the driver supposed to detect card insertion after the last poll
but before the reader goes to suspend and can issue remote wakeup?

The reader uses remote wake; what hardware are you testing on?

On Mon, 5 Oct 2026 at 09:30, Michal Pecio <michal.pecio@gmail.com> wrote:
>
> On Mon,  6 Jul 2026 16:40:43 +0100, Sean Rhodes wrote:
> > The runtime autosuspend callback currently queries card status and
> > clears OCP by issuing USB register accesses. This can run from the
> > USB runtime-PM path itself, which is the wrong place to start more
> > device I/O.
> >
> > Keep a cached copy of the card-status bits from normal status reads
> > instead. During runtime autosuspend, use that cached value only to
> > preserve the existing Memory Stick autosuspend deferral.
>
> How is the driver supposed to detect card insertion after the last poll
> but before the reader goes to suspend and can issue remote wakeup?
>
> This is exactly what happens now: if I insert a new card within two
> seconds of the "card removed" message showing up (which itself happens
> up to a second after removal) the insertion is never detected and the
> reader enters suspend with the card in.
>
> It seems that not only was "starting more I/O in the runtime-PM path"
> actually a good idea, but polling should only stop when the parent USB
> device suspends, not the child MMC host, because there is a two second
> delay between them. And even with this patch reverted, insertion never
> works if USB autosuspend is simply disabled altogether.
>
> Also, does anyone know if there is any way to utilize the interrupt
> endpoint instead of polling? I tried submitting a URB to it and got
> regular responses, but only zeros. Can this be changed?
>
> > Do not treat raw SD_CD as an autosuspend blocker, because tray-based
> > SD readers can assert SD_CD with an empty tray. A real SD card is
> > protected by the SD/MMC child runtime-PM usage once powered.
>
> Sounds like the proper condition is to ignore the card if and only if
> it failed to initialize and has not been swapped for a new one.
>
> Hence the question about interrupts: this would vastly reduce the risk
> that a swap for an actual working card remains undetected.
>
> Regards,
> Michal
