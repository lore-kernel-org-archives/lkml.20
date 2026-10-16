Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175C33E5A2F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141250; cv=pass; b=Kp3zyRXw7vL78I7HG9vqDd8u/fbZ3NqzrGQa4iwqb0nIRF/utzur1mUeflQUCP+WCXcWuTzFi3i0D+B0dWZ2d49uUeD4F3PMEk0bMRhoAkgD+mMETfAPjhhTyCMSaRM12usKgzt9H1wQhwBN+WWe5AgneSEn/MJydPirdQG4abU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141250; c=relaxed/simple;
	bh=nWdidaYaD/EM9Kvjs513vStZW9/Xbr2SiK+uWxRl9+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QR1ZK5ihA0cr+4UOBoJkUH4VXWL4pfQjyi59ktb6A6X4ES4gICasEb8FTUqr+1KNen8f90ud11CLWLhxMa1V9I3xbtDiLiBBvX/sGDPnDP7zDwAfO0tbjace7TzlpVIrxuay+8ttF2qxNPFkiUPdmESCEyMI1dBT3ASRbXBCVmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu; spf=pass smtp.mailfrom=wetterwald.eu; dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b=eboryDZ/; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b="eboryDZ/"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a808f09021so22637511fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792141245; cv=none;
        d=google.com; s=arc-20260327;
        b=h7o/tDNoRMj12MB0GwUrrm2uqOQYi6LR7bAKijqZAGWwT56u/Rpz6fCP01NOa5/Iwy
         7sDok6YSW9OidaJtdI1YDGQoleQ8WI+OwmTEedB2iGRkNY8HaUdJoMhQUp31uj+5Y6Kq
         roNVpHn/iQENnIkEw3LAh5hjeo0iSySc6KInIQyvwtPmns+mnFdwMguSy6ASQiCYYNSh
         zVWp53e6ayn3KvnRoXBUGI298TGjB73Os7R4vrLgQ7JWFmt2/yYLzJS/7MqmH3edGUDi
         VUfV5+R06VtwD2tBKoblmLo52kWpPYrQjYZsAAUlcLrPRrn63Sc+LBiqCfGkIA+38+Li
         fXLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YybyPuhgsnKy9RSuW90vvdft3eNm7NMwNdUR8p+bdAY=;
        fh=8kKSxCjxRa4k6u4DcCLLv6b3eS+i38e6/FrF+bhTX78=;
        b=i7ZH+6yMkl9GYCZPNTu0p4dXn10R+LaZXASYQHvwGnPCKVIf+kjBCrLG3M1zIHC0Zu
         iYWTEHnKIYsUpSulz7TkqTxdrVpl/qsy5V8m1Ly2qV/DiFs6EJab220rHIACuhR6YlxZ
         7NeyZOpvozcwAB07pLJOARha3eASbWjoEJegb5744nZxX93unPgSG4iwtNjyU8cAd1T5
         ld/sJGfRbBE8aolPWEGImRYpXsl9dtSS9mjp+8JBxMQdttRviMRtXYwJ5oVPGLxXbBXw
         m98MPr9OrXRHAzv22kra1XtjFJJRGSSAghTRN2gscN0oIShEwqZq9vIfklv0Dz+ixXJX
         EmTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1792141245; x=1792746045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YybyPuhgsnKy9RSuW90vvdft3eNm7NMwNdUR8p+bdAY=;
        b=eboryDZ/cFFJRuwyEPmzaMSa9yd+yZHLmMORQaR1/f91K1Mm6H86CzyGoLsPKm3xVR
         T8WU/ltdf/0yTIu6vBXK4sCI0n+eXoglAzx5GSr2ftwkuamN2EhrmezmSMGOHghSLF+G
         psCz0dpE/DRwmWRPqHXCq6HyvG7QVzOiUV0zn1eoY/10DqLAoCok+oqqyeTuYHAZenrJ
         zIX8mrvp5b1K0ZSYlZiMCqx9bI+EkWELVDYz5G3xk1E2rFYrWlnu/HlBXQ1IGqCfyks0
         zNwYugw/BVoNriPryRPDOCqPlVo3HRwOuljKJ7+q5aF0Su6m+HBvIokZou6EMzHV0wHg
         ZXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141245; x=1792746045;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YybyPuhgsnKy9RSuW90vvdft3eNm7NMwNdUR8p+bdAY=;
        b=XDiRn3srOsIn6rHmijmVeDW97Pv7ioa5oPp8iliYjqi739eGvIbSyI6/g6I5DKcvc9
         42S0RqPxOwhhCRiMGdEL1C7pnOOP/GCRYv1iHQFee8TrusMPb6wu2EX/WJ+W6Aoj+8nB
         pJ60lAyvEuyMjf//679SjRctm0M5995JKo1JOsiZb340KYjAdfiTj4bBAuzO7495s68c
         sfORAaEkZr9aejOhGAzfaD8XQhhyZv/mZUfnsSTFhqnbMdcq69thj0qEDLAr4shN5saa
         81MDL/79Gj5gbdcVIHXoQHpylNhHdqN79aCpuD3diQ5zqMviH38WO5gd+VdVYdeS52Yi
         FVuA==
X-Forwarded-Encrypted: i=1; AKwUvBzgzjLVO08hdIfssQBmSOTv/d58aYzLA4CWspasrQJ2W6I4VguRy8TtGvghKumEA3PTgHlnXJ2MqcOzLAU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvXGo7LcikJEzQwWUDdrA+G3guGTDJxLw7VlP3JvRwDgaETCOL
	lHlSISPT+iyd5hHMUZBBkzqWk1cJz5OXxJ9MBGu6DY5SSF4pKKR7WqXjOvJkGkHTQMntuj9Y880
	ay37MFrugAaTlsDmabwEMfS7jnIi3FzWjct6HNiSfj12g3jaJp3MBR6m9uJwG
X-Gm-Gg: AYBFou1oJD+dP4NQysc66P0AxPVC5C6weRWt1Aq4h/UX8ioklr6yFPpn9kb0JXONv4h
	6u+gLBvPn2FyXImMBqBqjV5G2RN6jPyFH0gKJzDUd3DJ5uVNcOGJO8sQmzBg8fC0MoRiaRe96im
	9HXY6ulphQiBA3d3ZiPHDyyAxZs8oXs82G9CY2NI5EZ/0Tl4lXok4GNf3p1yElfxuTM/awYmazw
	9gIQjjY9n0bkJjSOu/C6Uobd8JDGMz2DtpYf1of7I5L/cNhkKNrZpDCEbd+zt7fBkdjPiKNBi7Z
	+rx73WBiYd9PqgJ5VW0KRhAsVl2Xg04NpWVQKuIMuTmG/57hzStszhROM/7ft3s+PatBXvQhkIk
	FYf+VJ20sqbE=
X-Received: by 2002:a05:651c:19a4:b0:3a9:c1de:852a with SMTP id
 38308e7fff4ca-3a9c4ebaaa7mr54573451fa.3.1792141244894; Fri, 16 Oct 2026
 02:00:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261013131435.1454019-1-martin@wetterwald.eu> <DM5Q9NKRO89O.22R04QM8YBKWM@gmail.com>
In-Reply-To: <DM5Q9NKRO89O.22R04QM8YBKWM@gmail.com>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Fri, 16 Oct 2026 11:00:33 +0200
X-Gm-Features: AclHuK-lXXEn4ydNCXPutfEMfjozHKlcvNq9MgkrJnOYo8wz6ecB5WmDos1rbFE
Message-ID: <CAFERDQ12QwtC6cCVWQGU1b5KCv988kAvahNKwosxG2z8Mzm4sw@mail.gmail.com>
Subject: Re: [PATCH] platform/raspberrypi: vchiq: register bus at subsys_initcall
To: Gaston Gonzalez <gascoar@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Umang Jain <uajain@igalia.com>, Kees Cook <kees@kernel.org>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 11:25=E2=80=AFPM Gaston Gonzalez <gascoar@gmail.com=
> wrote:
> Hi,
>
> For Raspberry Pi Zero v1.3:
>
> Tested-by: Gaston Gonzalez <gascoar@gmail.com>
>
> Test setup:
>
> - Branch: patch manually applied in staging-next over commit ec1ecf4f23c5
> - Setup: RPi Zero v1.3 connected to a HDMI monitor
> - OS: standard raspbian with the desktop environment enabled
> - Driver built both as a module and built-in.
> - The following command was run to test the sound: 'speaker-test -t wav -=
c 2'
> - Result: Both HDMI audio channels worked correctly

Hello Gaston,
Thanks very much for your test!
It's great to have variety in tests because I don't have the Pi Zero, and I
didn't test it through HDMI, I tested through the Headphones jack (which
doesn't exist on the Pi Zero).

Did you also also reproduce the bug without adding my patch?
If the bug is present, cat /proc/asound/cards should reveal bcm2835_hdmi an=
d
bcm2835_headphones are both not present. And you should see this in the dme=
sg:
> Driver 'bcm2835-audio' was unable to register with bus_type 'vchiq-bus' b=
ecause the bus was not initialized.

Regarding your test: there are two ways for the sound to go through the HDM=
I
port:
- One is through the bcm2835-audio driver (using VCHIQ)
- The other way is through the vc4-hdmi (bypassing VCHIQ)

  # cat /proc/asound/cards
   0 [vc4hdmi        ]: vc4-hdmi - vc4-hdmi
                        vc4-hdmi
   1 [HDMI           ]: bcm2835_hdmi - bcm2835 HDMI
                        bcm2835 HDMI
   2 [Headphones     ]: bcm2835_headpho - bcm2835 Headphones
                        bcm2835 Headphones

Can you make sure that your HDMI sound is really using bcm2835_hdmi ?
If your sound happens to actually go through vc4-hdmi, then you are not tes=
ting
my patch. If you can't see the bcm2835_hdmi, you just need to add:

  snd_bcm2835.enable_hdmi=3D1

to your kernel command line if the driver is built in, or to the modprobe
command as module parameter.

> I=E2=80=99d be happy to run any additional tests if needed.

It would be interesting to test other "clients" of the VCHIQ bus (because I
only tested bcm2835-audio).
But I've just noticed that bcm2835-camera doesn't exist anymore (it was usi=
ng
VCHIQ via VCHIQ_MMAL).
If I understand correctly, if VCHIQ_MMAL is still there, it's because the
bcm2835-isp and bcm2835-codec drivers will be upstreamed in the future, but
there is not current "client" in the kernel as far as I understand.

The only remaining thing I can think of is /dev/vchiq (CONFIG_VCHIQ_CDEV).

Thanks again for the tests!
Martin
