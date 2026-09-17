Received: from mail-oi2-f43.google.com (mail-oi2-f43.google.com [74.125.231.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413F84F93C4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789665651; cv=pass; b=ieicKjsmkBog8P6Qa7L16PEf1jvsnZMsOWh8Lq/46t2yBCKn3z28RYoCqZSK5t+RFZzXXaNuK9RvMw7KgM4Bt3P6Xq+enNHL9pNjb2TgB1ts4av/0schbnIdPBH9zP1mb4wDOPP1vmHTIUibt1i6OPH3hdBGeOGVe+aKDVFnE0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789665651; c=relaxed/simple;
	bh=eoYJ5xDGqNtDO7sqA3Su1dLhzmqkzi77Q527I8JFJOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eKxo34X8rzED47lB31GCyXMGHtfv3Fe/nt0/r8Ym7NFsI9aD4dRkBrLjkurg/NyMIhCqJIssmxZbknDuKiud34HQOSQz6nzazz2YfqKf3aaTlJ3i/RQITtEc4tO3xaD5psF9D+p5k0UvVhV6jUK4ETfuSrxpYurPE5fbjAFodxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZGv0WbB; arc=pass smtp.client-ip=74.125.231.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZGv0WbB"
Received: by mail-oi2-f43.google.com with SMTP id 46e09a7af769-80489b6011bso74336a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:20:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789665649; cv=none;
        d=google.com; s=arc-20260327;
        b=AsC6YgFLKXJ1HqrWOokt7oR11jOPWf8vx6dixeWq+VVfNYdOBTGUF7vfUy7zKxHJzm
         3SXisAP77saRh1+A04kKNB2tkP6ZoVl5pilLgND1VGy7QoTeYFkNUBrxMkW56TdxPoFs
         kG4QlIgE3ajMWmAGoygsjI4U0PonJL8QIoNIpTDMhiXKV691Y9oBYmB2r9cnjHAeNyfK
         H/R3wE9mLdvJF+EVHu4lxsyTxr9VAFXI/zE6z/rPFFa9Lzarg7WhLOt4zt0S5LAtrBXt
         esFYaaLxFqgJmqXNXA+Y9moPomHa+/JlabkAR5JQoGVs1nN0hd+0tZIMkBF+0HPX9dfD
         +Owg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eoYJ5xDGqNtDO7sqA3Su1dLhzmqkzi77Q527I8JFJOw=;
        fh=h+5V19tVXnz59fbS6adBcuVYDse9/S3cDNaHNjrIH+E=;
        b=KEx56VcsKxhs+7m0nB6fyFA7W8a6jMKx+a6gY9Ty05ZKUOVUkHRmpQKSP3jCM8GFH0
         rPdWVzcwH98N+8iU6QX0bJMAmbenngc9EiQbW3EVnk5U78MyRcBQ8jVIzEL6c1UxM8Pd
         AeSBv7Q2T7HPBgSdc7S7FCPSsnD3qG85gZauh0jiTNjxRmBhU80m52Hr/a4atEZcHBKz
         uXey/sWs3/6ngJX0H65fEiXvVpiMJ12gr2CCFEDElItvx5gfRvqKFzD9aUZXF64hIOqw
         xMqX9wjQGeUS4jmK7AmCjQkYk13p67xUlsn6sV4H/6elodhttqp2m9iPvplY5Qi2Pqmv
         qe1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789665649; x=1790270449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eoYJ5xDGqNtDO7sqA3Su1dLhzmqkzi77Q527I8JFJOw=;
        b=aZGv0WbB19sNL07qw148majRsvlpOMAp0PZ8NemJT97gYwh4DjbT71mqMjF5UsoNi6
         tHbkLRnDqFe3mWRkv/zJ7Xlnllfo3SHMOhrPXEBvZeFvjXMN5SR4Mka/Mi/JSpO5E09c
         A9oZsO8wlbXTYPl9HjZltzt8xQ+HlBsOqOefL6pWKLwAzBXWEsyiUOKr+5kk3EmVYPXo
         P/H5BmKUNPJn4BpQSineeC78UezotGkMi8gcNbQfKO0lfz83QM3s0lf87OADIN2PB8O6
         ZyS2mE163qKyktJG882x7wj62Czcoc0blwAeiCtN0/gNm2RidimGyZQu4VsIE7eJcdq1
         XhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789665649; x=1790270449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eoYJ5xDGqNtDO7sqA3Su1dLhzmqkzi77Q527I8JFJOw=;
        b=gG6kuYnTleKp9D2sf7/PKDi+1xUbtyQb4fnbs6FbbvWY41BkI9sRKRgD18T8ieoMQG
         w1cTGjIQVaV7CmKGHtowLYp6Qf6QDNEuLDQNXNbdrbIUW9Vwi6RkNCB0kZ6j+AJ0si+e
         Y/e+/Z5Jxqg1kQNcnNqbIyi5pKtpMr6cADDHptsNFWvpM1PgxLZtcJFKyAadHLao5LAJ
         TlzRPamuZSAi26gJ63R+Oqp0wvJT3JtAojbpxhfAw0Nmj5BkD1rWJrk4OfAqywYYi7VZ
         8zGUYlQx3FZhPCI/6NBAZ1h8B2+SghKAqEhOsGmmBywVofxH2IUzjB/qlXfGaoZmxEAF
         r7RA==
X-Forwarded-Encrypted: i=1; AKwUvBx/wRnIzklyYj44fa5UmukW68rdbj5b05A1NMvt6RYAhqxxBdBRh3B81DZJwIGYker5yM2iL+9u2matl3o=@vger.kernel.org
X-Gm-Message-State: AFuF++mA4zxYDr6uCfg1Y2Z29ExP5sawPUVIVmEYFNHyVLZtUgXv7EDO
	vhUSWJx/KHRU+yTOKBqEjTYt1kgmF6vfA/hpO9XTNO1UXNg+mTFjs+/sRloIs57ajXi/oyzmoPU
	W6qWeujHIHRqf6GpInyReAAyYUuBztoA=
X-Gm-Gg: AYBFou1ui8X9cqHcfXJDucn/FN0kAKd/YvMrPqDRsVrff7Q3eDAXEkUaTYwGo85Xsk3
	cWM+J7hUEAc0dmujPbJZIB2APBlLlvCJDaLkyRQxMInnVreAUBKjqJnauprw3vnB1ylBGP44/UG
	9syb9ZedWBBS4YLuqPEFmLksmjQRhNcT/baaoUDYpJJaue2QCMOf/xc9InKdJ/0ZvJyp/5WYmI2
	UG3zYWeqDkMx8mA3ARxdY07yNfnju41WY6qDRtxEQ5vnsc90hk38MwolVVnRWihBIf9QHivXlv9
	V4rAAXz/grz3smSPhEBsrwqzkZ78VZbPnDML/ZmXEzHeI9wgGNQvJzKxYH0rPKC6M7A=
X-Received: by 2002:a05:6808:6801:b0:4c6:9ff2:60fa with SMTP id
 5614622812f47-4ca4dc2e425mr8353795b6e.4.1789665648935; Thu, 17 Sep 2026
 10:20:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFKhL9eUM91rtywaz_7Mz+4mJH2b2csmOmc3+86ii3a0Ka3Q6g@mail.gmail.com>
 <c335085d-a824-4632-ad3a-c06715258c81@suse.com> <CAFKhL9f6aLZgerw_7bohbQWvzMxSfd-m-LFcuNP1_p1vWkN4=Q@mail.gmail.com>
 <1320caa3-85b5-47dc-aa2d-56d3b003c6ef@neukum.org> <CAFKhL9eTD7DxtxMSMuUVP9cDG7Nq4jvrkTCjYfwr9puZfuC4Gg@mail.gmail.com>
 <20260915233818.5881ad97.michal.pecio@gmail.com> <CAFKhL9fL++S1xh+aUCuYbk6EkLQnfUn95y7TBoWaGnPAVP1gYA@mail.gmail.com>
 <20260916204713.22c4f575.michal.pecio@gmail.com> <6041fdad-78b9-4310-a86b-f9931563de19@suse.com>
 <CAFKhL9dmR1KDaBQGta=X5xDCGirzJ8t7u0rH4HUgBoFqN152DA@mail.gmail.com> <20260917185650.7fdea3cb.michal.pecio@gmail.com>
In-Reply-To: <20260917185650.7fdea3cb.michal.pecio@gmail.com>
From: djraszit <djraszit@gmail.com>
Date: Thu, 17 Sep 2026 19:20:37 +0200
X-Gm-Features: AcwNN1UJX3PvQvFK2HgF1bYsrTMlifgQJ-OJQYhbALmZUi0XC1JTauHMlQGyfhE
Message-ID: <CAFKhL9dYWLYhkj_687Out_hS3fxORgpCpggag2NwoVYbapyvYg@mail.gmail.com>
Subject: Re: [BUG] uas: JMS578 returns reproducibly incorrect data after host reboot
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Oliver Neukum <oneukum@suse.com>, Oliver Neukum <oliver@neukum.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal, Oliver,

I have just completed another experiment which seems to make the VBUS
behaviour considerably more suspicious.

I inserted a Genesys Logic USB 3.x hub (05e3:0626) between the
Raspberry Pi 4 and the original JMS578 enclosure (0080:a001).

The topology is:

RPi4 / VL805
-> Genesys Logic 05e3:0626
-> JMS578 0080:a001

The JMS578 still operates using UAS at SuperSpeed (5000M), so the hub
does not cause a fallback to USB 2.0 or usb-storage/BOT.

This particular Genesys hub can operate either bus-powered or from an
external 5 V supply. I have previously checked its power wiring: the
external 5 V input is connected directly to the downstream USB VBUS
rails, while VBUS from the host is connected through a diode.

Therefore, with the external supply connected, downstream VBUS remains
supplied independently of the Pi.

This gave me a useful A/B test while keeping the same hub, port,
cable, JMS578 and USB3/UAS topology.

First I used the Genesys hub without its external supply, i.e. bus-powered.

With:

USB_MSD_PWR_OFF_TIME=3D1000

and starting from a known GOOD state, the first reboot immediately
reproduced the BAD-data state:

Alternate GPT is invalid, using primary GPT.

The direct test read also returned the known BAD hash.

I then recovered the JMS578 to a known GOOD state and connected the
external supply to the same Genesys hub. No USB cables or ports were
changed.

With USB_MSD_PWR_OFF_TIME=3D1000 and the Genesys hub externally powered,
I performed five consecutive reboots.

All five were GOOD.

I then changed the bootloader setting to:

USB_MSD_PWR_OFF_TIME=3D0

while leaving the same Genesys hub externally powered.

I performed several more consecutive reboots. These were also all
GOOD. I could reproduce neither the BAD-data state nor the "Cannot
enable" enumeration failure which occurred previously when VBUS to the
JMS578 was supplied by the Pi.

So the current comparison is:

USB_MSD_PWR_OFF_TIME=3D1000, bus-powered Genesys:
-> BAD-data after reboot
-> invalid alternate GPT
-> BAD direct-read hash

USB_MSD_PWR_OFF_TIME=3D1000, externally powered Genesys:
-> 5 consecutive reboots GOOD

USB_MSD_PWR_OFF_TIME=3D0, VBUS supplied by the Pi:
-> previously reproducible "Cannot enable" after consecutive reboots

USB_MSD_PWR_OFF_TIME=3D0, externally powered Genesys:
-> several consecutive reboots GOOD

The important control is that simply inserting the Genesys hub does
not prevent the failure. The same hub in bus-powered mode reproduced
the BAD-data state immediately. The failures disappeared when I
supplied the same hub externally, keeping downstream VBUS continuously
powered during Pi reboots.

This seems particularly interesting together with the VBUS waveform I
reported previously:

VBUS off for several seconds
-> VBUS on for about 130 ms
-> VBUS off again for about 1 second
-> VBUS on

I still don't think this proves that the ~130 ms interval itself is
the cause, because an externally powered hub may also affect reset or
link behaviour. However, continuously supplying downstream VBUS has so
far prevented both observed failure modes.

One additional clarification about my GOOD/BAD test: I am no longer
using LUKS, device-mapper or ext4 to determine the state.

I read a stable 512-byte sector directly from the USB block device,
specifically the last sector of the MP3_FILMY partition, using:

MP3_FILMY_SECTORS=3D$(sudo blockdev --getsz /dev/disk/by-label/MP3_FILMY)
sudo dd if=3D/dev/disk/by-label/MP3_FILMY count=3D1 bs=3D512
skip=3D$((MP3_FILMY_SECTORS-1)) status=3Dnone iflag=3Ddirect | sha256sum

The known GOOD hash is:

4755035f51940c4bbe13c596ba55e4eb278c13d9a24cfca7a9530e1f788f71eb

and the reproducible BAD-data hash is:

4fc3036031ecaa505dc82e38ca996d9615d12780fded2ebad35fb58e44f7efde

So LUKS, device-mapper and ext4 are no longer involved in determining
whether the returned data are GOOD or BAD.

Regards,
djraszit

czw., 17 wrz 2026 o 18:56 Michal Pecio <michal.pecio@gmail.com> napisa=C5=
=82(a):
>
> On Thu, 17 Sep 2026 18:02:02 +0200, djraszit wrote:
> > shutdown Pi with the enclosure connected
> > -> disconnect USB after shutdown
> > -> boot the Pi without the enclosure
> > -> wait for Linux to boot completely
> > -> reconnect USB
> >
> > I repeated this three times. All three tests were GOOD
>
> > USB_MSD_PWR_OFF_TIME=3D0
> >
> > I do not currently reproduce the state where the enclosure enumerates
> > successfully but returns incorrect data. Instead, after consecutive
> > reboots I reproducibly get the "Cannot enable" failure described
> > above.
> >
> > After changing it back to:
> >
> > USB_MSD_PWR_OFF_TIME=3D1000
> >
> > I repeated the test twice, starting from a known GOOD state each time.
> > A reboot reproducibly resulted in the enclosure enumerating normally,
> > but:
> >
> > Alternate GPT is invalid, using primary GPT.
> >
> > and the previously tested block returned the BAD hash.
>
> So it's a boot issue. I think it would make sense to determine whether
> the problem is caused by bootloader actions or the kernel.
>
> Is it possible to configure the bootloader to wait a few seconds before
> booting the kernel and connect or disconnect the device during this
> time, or to never boot the kernel at all so that the device can be
> disconnected and tested on another machine?
>
> If it's the bootloader, and things seem to be going in this direction,
> then you will need to sort this out with the vendor, obviously.
>
> > Regarding the Raspberry Pi 5 test: yes, the enclosure was connected to
> > USB 3.0/SuperSpeed. The Pi 5 uses the RP1 southbridge rather than the
> > VL805 used by the Pi 4. On my Pi 5 Linux exposes two xHCI controllers,
> > xhci-hcd.0 and xhci-hcd.1, each with a SuperSpeed bus at 5000M.
>
> Thanks, that's all I wanted to know. It's some other xHCI controller.
>
> (I looked it up, it seems RP1 uses Synopsys IP).
>
> Regards,
> Michal
