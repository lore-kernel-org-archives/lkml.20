Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA27B33DEE9
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 17:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790530747; cv=pass; b=H22IyANtRAvJrIo+HLFPaeI5BIu5/VLKMt+MRqLdKfJceEOYnyD2nPJGxqiU8UUVAS5VS6rt1JLcZylrAoJiAIyhEUqxu0KEgaOZroCM0R3XdMBFLoS6heu1bj9hKyPXUjm2QLusluWQf1keZr0Is/8MeVRWlA5X2LTg8VaGgPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790530747; c=relaxed/simple;
	bh=65o3xxcusmIWSeGEM0t//FzNskDTAGQHiGU4SotKb3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hcx3xct7eu3RK+z6r2VFmRGvLZmETgmz8NOe0+zejov76pdclJK9UxQdvyRsZ0PTebqRAEDP7rE5gvJEhKpO0dj7EGtDmFwZJpvwcrf+4i4ARcrGg309N86w2lIDSgy0MrH3DRR4f4VJTmr+Z5tCpQlPsGyWmAjfHmD/VOQH8S0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=hyqD0kee; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="hyqD0kee"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2dbdcb4f59so142307566b.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:39:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790530744; cv=none;
        d=google.com; s=arc-20260327;
        b=ju2ePn9obobx3y5IGdKrs39OzaupushU3EugF5yzP9YbIAXlcTKCxZUD4vHmJeOlSG
         JHo7qpXdxcApRq+Vcg3lLIbgeOKGN1GIRRchHVDgdDvUVx6bNVYL8P5CnX+ZtiX3GK/P
         H4SBgvLLDpjKcEYXoJfs+I3oCkeFMO7fEFEyqL+Kw8hetsTfiNhioJiOfRE0PLzlz0Kz
         uW3J9jw4P2kJPbNZE5MibUuTho3l4zbd7t6YqN9bdVKyfq0CZnPYMV9gL03N9qjMxWwm
         2dzSO8GsZ38u4VRTeou3V72cJspAzx+5crZv4Y5GrBbkxhpfKuRcwNo08R0rymK6ZajU
         Mlpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=65o3xxcusmIWSeGEM0t//FzNskDTAGQHiGU4SotKb3Y=;
        fh=37jqJNyLdrZi33IYtVtrfCp5AvZZfhFa++tjpMLsvJ4=;
        b=ShoATJ7NsRLdl1aqKiqupzkknLQgv2++sqqh8IJ1hE7mCWPbvpQdT+QZiYa97TFCJn
         4Y1ve6iwblafdT88ws+B13QE83eLu9JFwvmQpwTiCkaoE404l1Hq9Ybrl6MG8QKHXL1o
         OfdSRmIFfbU7dZIoIuwtA7SR238/IwFOTc4TF37T7cmI1nN6NuSx0SwGFIcbuC+PfrL6
         nj/V4woV4TfcEsVXBaMraTbngzVwMQCrVRQfHJESHOciEyA8WRLSHC/LIyC0+Znf6Ufu
         CKRHSZOcOyw8xbMSTPxG1SVODBCJW5ezgw5vDcvXzksZZ3s6gMKnEjRix/rmzH42fJRr
         gCeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1790530744; x=1791135544; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=65o3xxcusmIWSeGEM0t//FzNskDTAGQHiGU4SotKb3Y=;
        b=hyqD0keeH1+oWg9PY3v8f35fP5kaXp+j+Hd58HEXt7pe3qasUbdUhlst/hSXx3U7As
         bwF0kBOs7YIcJH5C2WhFk7U/QtfhDirLQFJLexvqObGB0zyNsn5wr/ZcX4ILrhKESKGT
         dYuO/S/U5paoWpXgP+xJnHAlFG6pqlrx903uJNiL5ST6618o5OLMMJUcVv6bfL3VxLSw
         jfa32xUG3+t6dt/zzGib6aAQcd+2aPxhgwaXps81CrwA9a1nC+kojS7YyUZGJ0xocxzK
         8rzLNct8lelGqypepHL5Rbh+zRvQw0WCGKguQJ6ydDFO/d/oFQecGrQ/d0H6a/B86z4r
         Bzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790530744; x=1791135544;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=65o3xxcusmIWSeGEM0t//FzNskDTAGQHiGU4SotKb3Y=;
        b=aiA3tvhaRvkKyJMmf2XuHEDegLc37J9sOly1Z/vdN2W7vW+ufFzgq6ikZ12ykQQRlw
         imMpCh87032rlemvze5Yd7GZlL5LxNJ46+c+B43T5ZqN6PAhtDT4L3PUMW+5YsFpLnCp
         S90kuAYVspsI0d1h7zdPRC4VYotWBygcSB6nFk43EBlak2t5zZH7aldmbPLBOAov98yx
         Lw7kUelCP0rRNC4CSnFS4gNuvtD+KSsBSMEJ26OW1TItaRYGnDIAtVS+aR3SE4lSJbs3
         hAJVLGQ/HWMg4uk0Lki7ZLuKV9oMx99+4cBjM/Bu3cmXoP9UgnQNYFNVh+tvI5piKXy/
         YiJg==
X-Forwarded-Encrypted: i=1; AKwUvBxErD4Zc3tshun2EBr9DMKyPKsPL3uoQU7GYofT8JTVo2L53yF1Je2d+htcF23VtZo9y+bYAnej7a3AoFs=@vger.kernel.org
X-Gm-Message-State: AFuF++nUvicO6VH9pddwzX5jn3z99H1Zm1k48HMfAh5GlJCD+saY4xza
	Xs3s5KWcxceiIGYalYRFremEyzLAli+rUXSR0zcZtm6fkPXCiK28rFGI0Z8HWd6MNiDNIQcwMDs
	j45cDWgDW+lzAFt8U+pRMwMcF6+0GlAU=
X-Gm-Gg: AYBFou0VME+/Tj0X2ZAmkXE1lJKUoHX6DYybPO2Bnj6btyXPHgjrsVNGQh074o/oOb2
	XM+MEvig9GDxwaKfu8uqqVXjGN8MaRK3ctRE+tM2AVADyT3tHvGqaXlfTvLMBcE/fhX1z1Mk9sv
	SVRc8q8pjrarhuwqidTRzZXv+2INVUqvYgDe/I6ro6YytFUfDzpQyafJiaABCZPXexkGxAIKypc
	lj0/agb9/m1Pwyefazfi7qcZ2I1CyWckffl/X7XlrTBODSpRUGP6j7Mz696I/i2afVYJG7ExxKb
	lMqqipTucgVrUxqISsgX3Yq3vt+jhk9qS/s+T8WkHVuFE84gU57bXA==
X-Received: by 2002:a17:907:d409:b0:c26:1648:a069 with SMTP id
 a640c23a62f3a-c2ac24f9cabmr931512166b.36.1790530743927; Sun, 27 Sep 2026
 10:39:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919151840.24371-1-arc@gmx.li> <92b1eece-9dc7-4b33-9ec5-fc94300038f1@gmail.com>
 <arlOa9a0obceb9Sm@khmer.arcnet>
In-Reply-To: <arlOa9a0obceb9Sm@khmer.arcnet>
From: Faaris Ansari <faarisansari@googlemail.com>
Date: Sun, 27 Sep 2026 18:38:52 +0100
X-Gm-Features: AclHuK8OYETb_mZ-_XTvsUAg9oCvW-tkae3q94i2L5K2DdxX912dLXzjicyyAUM
Message-ID: <CANBVYRAr8iFGFDgdTcDXuQyXt5M4TddZetsG9o1wbFao03R0yw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add Audient EVO4 support
To: Christian Ruppert <arc@gmx.li>
Cc: drabik.p@gmail.com, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, mrwillporter@gmail.com, neil@androos.io, 
	perex@perex.cz, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

> I'm afraid this is not going to be the case. The patch set doesn't change
> anything with the pre-existing controls except for renaming the 'EVO4 '
> master volume mixer to 'Master'. As a matter of fact, I made a similar
> observation to yours when testing the patch set on the 'sound' kernel tree
> and the (very sporadic) issue did not disappear after applying the
> patches.

> Unluckily, I didn't have time to investigate and as it seemed independent
> from this patch set and was never observed on my (vanilla) 6.18.x
> day-to-day setup, even with very recent kernels, I forgot about it. I
> suspect this might be a regression in the sound-USB core modules or
> possibly the the alsa core.

I was able to find a work around to this specific issue, adding this
below line in modprobe.d made the hardware volume start working
correctly again.
options snd_usb_audio quirk_flags=2708:0006:ignore_ctl_error
I've reported this regression separately here:
https://lore.kernel.org/regressions/CANBVYRCL=8QdLxGg4S6qrahrFtwJxhv-aSGpW7-1S=+iOe4ZGA@mail.gmail.com/

I also was able to test your patches alongside this workaround. All of
the system controls I was expecting were in fact available within
`alsamixer`, including phantom power, mic gain, etc.
Both mic inputs still seem to be reported as stereo even though
they're mono - I think the other channel is for loopback or something?
I'm not entirely sure if this is something the patches are supposed to
solve.

> The patch set doesn't change
> anything with the pre-existing controls except for renaming the 'EVO4 '

On the note of the UCM config, I had to patch it due to the above or
else PipeWire wasn't able to directly manage the hardware volume knob.
Adding the PlaybackSwitch part also allowed the hardware mute to be
used by PipeWire.

46c46,47
< PlaybackVolume "EVO4 "
---
> PlaybackVolume "Master Playback Volume"
> PlaybackSwitch "Master Playback Switch"

One problem I had with this patchset is the settings I have don't seem
to save with UCM / PipeWire. When powering off the interface and
powering it back on again all settings are reset except for the Master
Playback Volume. After a small discussion on the PipeWire matrix
server I was told that these settings should live in the UCM config
too which I'm assuming they do not currently.
Muting the microphone in pwvucontrol also didn't seem to use the
hardware mic mute. Probably need to add `CaptureSwitch` for the
microphone in UCM too.

However, the current state is by far better than how the interface is
being handled by default - thanks so much for your work on this!

Faaris



On Sun, 27 Sept 2026 at 18:12, Christian Ruppert <arc@gmx.li> wrote:
>
> On Fri, Sep 25, 2026 at 11:18:33AM +0100, Faaris Ansari wrote:
> > Thanks for your work on this - there is currently a regression on the latest
> > kernel versions (7.2 onwards, as well as LTS kernels 6.12 and 6.18). Trying
> > to set the volume in software like wpctl, or pwvucontrol causes the software
> > volume to be pulled down with it - I think it's something to do with "sticky
> > mixers", not completely sure.
> >
> > I worked through troubleshooting it here as I originally thought it was a
> > wireplumber issue:
> > https://gitlab.freedesktop.org/pipewire/wireplumber/-/work_items/1022
> >
> > This patch should hopefully solve that,
>
> I'm afraid this is not going to be the case. The patch set doesn't change
> anything with the pre-existing controls except for renaming the 'EVO4 '
> master volume mixer to 'Master'. As a matter of fact, I made a similar
> observation to yours when testing the patch set on the 'sound' kernel tree
> and the (very sporadic) issue did not disappear after applying the
> patches.
>
> Unluckily, I didn't have time to investigate and as it seemed independent
> from this patch set and was never observed on my (vanilla) 6.18.x
> day-to-day setup, even with very recent kernels, I forgot about it. I
> suspect this might be a regression in the sound-USB core modules or
> possibly the the alsa core.
>
> > and avoid the usage of external
> > kernel modules like https://github.com/vanzaho/audient-evo-py (which you've
> > based your work from)
>
> This one should be solved with the patch set.
>
> > I'm not exactly sure how the process with kernel stuff works, but
> > considering a regression on current mainline as well as LTS branches for
> > this device - is there some chance of fast tracking the merge of these
> > patches?
>
> The best way of supporting this (even if it only solves half of your
> concerns) is probably to test it and reply with a Tested-by: tag to the
> patches.
