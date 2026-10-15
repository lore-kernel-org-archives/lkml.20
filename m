Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7AE443E3B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099550; cv=none; b=GH19/PntG7Us8lQikO8vgk+vf5rHYPl6wlre9pGddgslV+sS0hsEYgYSBSneFoQV0k/hAF57AuneMJEe3PNxeEN+Bg7kv/4YPGFK28LKCe6ETQTxqwcKBlOi2wS2vmX+yaL5BON6BlAzOD5tYdP1M2H28xuMpV4cXD94cHcKiKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099550; c=relaxed/simple;
	bh=Kf30i8cGqP3IPHZ3WCA4IROcb1QglSnTECh4JWUUq2s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FTdwYwGzWs6aF8EcRYzicaD3EhAU2IF89VyVsiCuldNtVMxSKprQh9GEsvftONdwMZTNnNYJVtpOQv2nuNHtBEq5+R61e3YEFp0Blq6PRsWKGDZtC9V7aFNwyI1OTUgbU9PuHhTXIrRxiO4yfATuADCRM6DqgXM8spB/rLrqI7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bf5bdYdv; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bf5bdYdv"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5d866bac1caso179605e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792099548; x=1792704348; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hmU7byQJ7V4GqxfEroCMT0quvOeWGZm1zt5/8tVd594=;
        b=Bf5bdYdvKY7nV4dkqXEDreBTZJ3KlMngethc8GClcJCp4qy+xuVKpHMe1oDyIF73qC
         rgCbO6q9A9qBaDu7iSNEELtqg/ZZb11DQ4rnEm9MgfXgcryqLnVULzKfgHV5t2gOMaLZ
         Mn0mUhbspr99Ur8wLGx+mKMCXu3sT+jgFqEuFQycaVfT0okdRT3VUr9zIV396sijTHD/
         JtaciTU/R1IAVtKde6tIXxQBnfSjtOFsAZyYAqY1tdD8W30koZpYW1Hwhyeh20wVNztF
         suoUUHMeXUv8oxI1uvosi/v0W1sfnyXD16xXhMAzSkAj23fZbqG0nkxWkfa8Fw5dZp8p
         y02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792099548; x=1792704348;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmU7byQJ7V4GqxfEroCMT0quvOeWGZm1zt5/8tVd594=;
        b=yXbictxHQfKhBVHWZqipEXYy0fj2NtxW6W+KwyfUiOwSe5AKhav76RWwpEBpD2s4+i
         7cBnoXhyzpmy3Wfs6J79+6/wznmpits0VaHDl1YOxVsut1PMYH6yW2HA0hGC/HAKAE5A
         TrFmWrdegiTqfM2OAsNIhoBWWkDp1dhVmRgRIBq/xGKl0m8ygoD04IM3qsgOWhiHQl5R
         ogwRz2gXEOa1yApt9lT5FuC0KrparbBLK2LDj6OJouHuuD7Ci4VKTomrB1MrOwS0+9Lt
         Vfesy6/9oXUa0j6r+XhfYHP9v+WwgnqtQCplyy9o0cl7Ufn2tFm71TXeifLv3CRrgQID
         Od8g==
X-Forwarded-Encrypted: i=1; AKwUvBzycbkT+TVOx89eVZMR/9szJSG3jDDzpaFnRLhfNI3UXu+Mu1FMMx3drxQU2lWhR3uv8gAYRVLiRIrGk50=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1Ve6GMDpTaZrx5sIt4AKNhcuXqi+JL6nD3osxiT8+BCYeGu9e
	NY+dGLryJIRNmLOU7rF4POrAmc6QIwebd0vEBT9B9d2QHlJhw6BlzUW1
X-Gm-Gg: AYBFou0N2xmUvbAvYWteMwi02G0xbamhne983fXDWb4Q7dkgj7P20jf8zSFPfkROQpR
	VPWawxpIqBPcBic4meLGAL8fM5pEfp9qf+Msj6VFlZci25qs2BpjUnsdodmqQYwDHfKTRqxeN0B
	mUd7fq9WboaCsQmFoP0RU57SqDu1k5NaAWTI5yg2/4cY+DO4Pe84A+sI0kUXHUS42SXV95YnK2b
	rDqrAx2DfntyB7knvrhDnFay9MS2eHPHdornz+bdwZVQ6bWV6hGycX/1BCxQZjO8dYicaeqvf9k
	OpDgRAnSaxG9ZRC1wkMoxS6qBUSVyV5ZDZpm7QFAjecxJ9jzuP96d4w4y4l5PcUrMMrrX/PlXbB
	Hk53sjzkqAUMI5nSCA5alKqNY8JbIIj9w7qhWLzchH9bn9jYQrF9mC+z0JvKZyabjb+MYVlPw9N
	PJ00ZIjcWE49h4zxY2pZzzZW7/+H8IbHG0+UDCbaG8MRtl1aeLFPkVZ0pWXmzoxxIrqA==
X-Received: by 2002:ac5:c001:0:20b0:5e9:4e2b:4c9f with SMTP id 71dfb90a1353d-5e94e2b4d71mr3032400e0c.4.1792099547922;
        Thu, 15 Oct 2026 14:25:47 -0700 (PDT)
Received: from localhost ([2802:8012:9f:dd00:c85b:fc61:635f:8eeb])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b53cfdfsm190902e0c.15.2026.10.15.14.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 14:25:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 18:25:40 -0300
Message-Id: <DM5Q9NKRO89O.22R04QM8YBKWM@gmail.com>
Cc: "Broadcom internal kernel review list"
 <bcm-kernel-feedback-list@broadcom.com>, "Jai Luthra"
 <jai.luthra@ideasonboard.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Stefan Wahren" <wahrenst@gmx.net>, "Phil
 Elwell" <phil@raspberrypi.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Umang Jain" <uajain@igalia.com>,
 "Kees Cook" <kees@kernel.org>, <linux-rpi-kernel@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: Re: [PATCH] platform/raspberrypi: vchiq: register bus at
 subsys_initcall
From: "Gaston Gonzalez" <gascoar@gmail.com>
To: "Martin Wetterwald" <martin@wetterwald.eu>, "Florian Fainelli"
 <florian.fainelli@broadcom.com>
X-Mailer: aerc 0.20.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com> <20261013131435.1454019-1-martin@wetterwald.eu>
In-Reply-To: <20261013131435.1454019-1-martin@wetterwald.eu>

On Tue Oct 13, 2026 at 10:14 AM -03, Martin Wetterwald wrote:
> Since the VCHIQ interface was moved out of staging, its bus is no longer
> guaranteed to be registered before its client drivers. bcm2835-audio,
> still in drivers/staging, registers at device_initcall level and now
> runs first:
>
>   Driver 'bcm2835-audio' was unable to register with bus_type
>   'vchiq-bus' because the bus was not initialized.
>
> Register the bus and the platform driver at subsys_initcall so the bus
> exists before any client driver, independently of link order. The
> platform driver probe already returns -EPROBE_DEFER while the firmware
> is not ready, so probing earlier is safe. When built as modules, this is
> equivalent to module_init() and nothing changes.
>
> Tested on Raspberry Pi 1B rev2, 1B+, 2B, 3B and 4B with VCHIQ and
> bcm2835-audio both builtin and both as modules.
>
> Fixes: aa125180c673 ("platform/raspberrypi: Destage VCHIQ interface")
> Reported-by: Martin Wetterwald <martin@wetterwald.eu>
> Link: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R=
272j6Bs4tg@mail.gmail.com/
> Closes: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio=
5R272j6Bs4tg@mail.gmail.com/
> Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>
> ---
>  drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/d=
rivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> index e78641703252..d35f5ac5c2e2 100644
> --- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> +++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> @@ -1462,7 +1462,7 @@ static int __init vchiq_driver_init(void)
> =20
>  	return ret;
>  }
> -module_init(vchiq_driver_init);
> +subsys_initcall(vchiq_driver_init);
> =20
>  static void __exit vchiq_driver_exit(void)
>  {

Hi,

For Raspberry Pi Zero v1.3:

Tested-by: Gaston Gonzalez <gascoar@gmail.com>

Test setup:

- Branch: patch manually applied in staging-next over commit ec1ecf4f23c5
- Setup: RPi Zero v1.3 connected to a HDMI monitor
- OS: standard raspbian with the desktop environment enabled
- Driver built both as a module and built-in.
- The following command was run to test the sound: 'speaker-test -t wav -c =
2'
- Result: Both HDMI audio channels worked correctly

I=E2=80=99d be happy to run any additional tests if needed.

Regards,

Gaston
