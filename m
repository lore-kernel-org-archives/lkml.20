Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB45E3955D6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246875; cv=pass; b=m/58KQcjwOn1vfW5gRpgUm+NQdqz26/JyQKb8Muc+RBYrNsliaRMWxVFWWt1KO73zh0hUCykk/Fvd3rNlAK3+bNEu6dJGEYkmU5vZ62nD2vLycOdLQKAVgiFS8U54Qlzf+6o6CvM0kfZnl7sKBoO4QNoGBh92V2yTvKoofnxpfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246875; c=relaxed/simple;
	bh=qVW5jpU53u+WOGPSzR/4x2CVEnCD6anurBKIfDdxiIE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=q0oXHn5HaOrH714E02Fh6Vx807110Dp+AnefK6rfb/lcNv/neUPAG7Se4Zp3Ta79MD/l7EsPczNWE0PZL/osBr0a70Qy/EK6AUWtr38MMLW7pMDOdDEPio451/lMbY3Ay7poPE2+ScbI67dc9R5tf7vWX4lrT4eCeftJuoc8WkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fg0xZKNh; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fg0xZKNh"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so908146a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:14:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788246871; cv=none;
        d=google.com; s=arc-20260327;
        b=AkzZemQVQMzvx4rcQHODJS7Eh65tZkVc0KcOaSEEKV8M5Iva3+VzWsySyu7n0616zI
         rK0/2zZMyr+OjSBpPe4NfHf8DyRwJBUEOr2iYwetIrqd8t+zuUxsLhMkroswgg+//k+M
         SSLFFMc8irh2DfCrH3d77dGgdIi3D502hkBgsHTl70zOSWOSkLZ7HY5CiikoLesme4V0
         +UeOxzuteQBvAU6M9hIl+Bpby1nC77W1PH7T1P2FiyUzTmNsCKtFO0k1xZMiji5CaKre
         NwgaxYgw76Hlj1o98lunCyCWYXBdR+Yl8Sn7vAvftd4cm3seNKDKxdG2AMG5Go2SnKnE
         USIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=icLLWqIgxkuTGJssWd3FcH8s990MCC2TlPl4rp1IS/M=;
        fh=4/gywt6NP/uJqm9JWA0HN7hVZe2dB8RYK8IKcVUfmzs=;
        b=D8xaHkoOkJAQPXwk6yB0hh66OZ9gp+MUuD8trI+OLUOVRqOM3y911X0RnQF4Acm6KM
         aswOCfjLhVJMe4zEIIoxMk8GpA0jSE0OwJQTzLQXnzydmTNYq2G3Rzk5BBp9T/xM637w
         T7oZkxa4oI+ZPly3XR0+WcQvc8ASRjkCgVumuIw/UhS7nflv0x6gA3JQ/xgCtZlD+h0s
         83WUtbhOKHoXTjfNawSbYFsxB5ArkYa/+XTNIF3/KeNyp9ekQ95DrzNyvfaxhk7hyPkw
         A6UCl/GsETlgKwsbduAT0nf3dJao9FStXeUmw59PmEX7FYTes3VaVV9cpKaghiGz6qPI
         yV2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246871; x=1788851671; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=icLLWqIgxkuTGJssWd3FcH8s990MCC2TlPl4rp1IS/M=;
        b=Fg0xZKNhecfUoudszkziSlxcePv/qhlmOPbASbfLVog1zHNj2yyqSKLzIXeNB99U3+
         SPiCqjYv0Xp1SbQccaRACarC/iQYtV3U1rCmgNS9SUeg+X62/Wb7vRnznnYfqJvZuauW
         GuRPezGAn9h6CbWvf2EM74g9MYd/pz94aI9M4Zur7LMKQEunKMbIr8iknR4w+iTJGDjz
         h7e6f9ZCEjv10PC+xNczoBQDwoma9qwtKXh+PxqqRlQ6hGablb0GKuWBAOd3qoh06Gso
         ZPXY5cUodDIxiBGRECPOepS74O2oz27NE+Vxy9P9bIdxtOQrEAan2ZHS/AD6a9QO9Sg3
         vCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246871; x=1788851671;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=icLLWqIgxkuTGJssWd3FcH8s990MCC2TlPl4rp1IS/M=;
        b=Ik4Wc8uCRT0rm9D/HSKIpAsWtGkHAtZAaIMzlbDAks84W1p/Cjr/ylPT+tPphYbbX0
         sFDySn6P22ty1livSy1mG/jW0CCnDq7uOpH7MMyqob/Q5S2jLTWgQk6keycTk6oiSUWe
         I3vWPYh3GdODsBCrAKV8Hss2wAmlIMqMz87ynEnY8yACmvCVWY2xtxk8oq1MyQ3EpwXU
         QDaZbRGwQevKTBtEfQF6d/i9Fzwe+qZKomd+ES5hEAjA8KkBR2W3Anm/z1o3IWc4/AQ5
         jZc1Ux9wGX+TR9IMH51NMrcq1CfeOlRN4THvQF+GlWO/QMpUuT/MNdJe5ems3cyt43AR
         6QIw==
X-Forwarded-Encrypted: i=1; AKwUvBwhn7dmfW2403YFnELki08LmFC7EWVWQP4k/JV5U0bA9QB6+YNzo+k5+da/0C+8vQrn/E7QI2VFPQNrzXw=@vger.kernel.org
X-Gm-Message-State: AFuF++k1+Ugh7biWR9Q3IXkSx6mZCH9YezCKr2PwB2jGrsUnZOAp21EX
	D75KBy0KTdvgkrTFTYQ4drwaaNO6guRuLa4X4ZUqX2QDyb9A34L9KseL+eLI8BJrAdfkxbudzk+
	TRcW+ix3VrIU7uZZg+aER+oP9CP09aws=
X-Gm-Gg: AYBFou0y1U96KRynpdQKVwxmSaMCD73mJltSrVNn3JYd/YznaoAxtla88sq47yHRmHW
	ynjh+S/dnax0PQ+TiwPOgec2n/suke3CeFO9RpKjCqVpDtu4FsxBdya+6g5Blxy9DOOKttqWGAc
	ccOC+h/+6BmIPkWl0MvILP3SiN3SIXcLgT9F+UTZkKmv0f73ZUai0xBsplBZVbQQ8W8jnAh5tcj
	ucNytOMG48RDx9hx8XQz/lNYZxQsn0IjWJ5uAw9o0kJBCHCzrMPA38+QQDnWfXVVS5ni8FLbVZI
	l7eesg+/atcmkOUhZA6keojSdNG8eS9r+Hw2qtYKTnSpndMNRLJhjAClPTYyEQCfTNtaBRNQ3m/
	D
X-Received: by 2002:a05:6402:2088:b0:6a3:ec0b:d626 with SMTP id
 4fb4d7f45d1cf-6a60d39515bmr17760685a12.11.1788246870761; Tue, 01 Sep 2026
 00:14:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: powerfullz <wleizc7319@gmail.com>
Date: Tue, 1 Sep 2026 15:14:19 +0800
X-Gm-Features: AcwNN1VBiQt_cCxQXuasU0olvquoN20wH6Asi930VZL-EvJuuuwJxUu3bXEprCU
Message-ID: <CAAC2M2xn7ESd-E57smPvd71VNp_AiQP0HbTZF-L+p4jZ3ZNR0A@mail.gmail.com>
Subject: [BUG] platform/x86: bitland-mifs-wmi: performance profiles
 unreachable on USB-C-only models (RedmiBook Pro 14S)
To: "qby140326@gmail.com" <qby140326@gmail.com>
Cc: latform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mingyou,

Thanks for getting this driver upstream -- fan/temperature monitoring and
keyboard backlight both work correctly on my machine.

However, the platform_profile implementation makes the two high-power
profiles permanently unreachable on USB-C-only models, and this breaks
power-profiles-daemon entirely.

System information
------------------
Model:     RedmiBook Pro 14S (dmidecode -s system-product-name)
CPU:       AMD (integrated graphics only, no dGPU)
Charging:  USB-C PD only -- this model has no barrel-jack DC input
Kernel:    7.2.2-zen1-1-zen (Arch Linux)
Userspace: power-profiles-daemon

Symptom
-------
  $ cat /sys/class/platform-profile/platform-profile-0/name
  bitland-mifs-wmi
  $ cat /sys/class/platform-profile/platform-profile-0/choices
  low-power balanced balanced-performance performance
  $ cat /sys/class/platform-profile/platform-profile-0/profile
  balanced

  $ sudo sh -c 'echo performance > /sys/firmware/acpi/platform_profile'
  sh: write error: Operation not supported

  $ powerprofilesctl set performance
  Failed to communicate with power-profiles-daemon: GDBus.Error:...:
  Failed to activate platform driver 'platform_profile': Failed to write
  to acpi_platform_profile: Error writing
  '/sys/firmware/acpi/platform_profile': Operation not supported (15)

'low-power' and 'balanced' work fine. Only 'performance' and
'balanced-performance' fail, and they fail regardless of whether the
USB-C charger is connected.

Analysis
--------
In bitland_check_performance_capability():

    /* Full-speed/performance mode requires DC power (not USB-C) */
    if (!power_supply_is_system_supplied())
            return -EOPNOTSUPP;

    ret = bitland_mifs_wmi_call(data, &input, &output);
    if (ret)
            return ret;

    if (output.data[0] != WMI_SYSTEM_AC_CIRCULARHOLE)
            return -EOPNOTSUPP;

WMI_FN_SYSTEM_AC_TYPE can only ever report WMI_SYSTEM_AC_TYPEC on this
machine, because the barrel-jack connector does not physically exist.
The second check therefore evaluates to true unconditionally, and
PLATFORM_PROFILE_PERFORMANCE / PLATFORM_PROFILE_BALANCED_PERFORMANCE are
dead code on this hardware.

This looks like it was written for the barrel-jack gaming models
(Redmi G and similar), where gating full-speed mode on the high-wattage
adapter makes sense. The thin-and-light SKUs share the same MIFS WMI
interface but not the connector.

Secondary issue: API contract
-----------------------------
Independently of the hardware question, advertising a profile in
->probe() via set_bit() and then rejecting it in ->profile_set() is
problematic. Userspace reads 'choices' as the set of supported profiles,
so power-profiles-daemon loads the platform_profile driver, offers a
performance mode to the user, and then fails the whole transaction --
which also prevents the amd_pstate CPU driver from applying its EPP
change, even though amd_pstate alone would have worked fine.

Before 7.1 this machine had no platform_profile at all, ppd used
amd_pstate only, and performance mode worked. The new driver is thus a
functional regression for these models.

Workaround for other users
--------------------------
    sudo systemctl edit power-profiles-daemon.service

    [Service]
    ExecStart=
    ExecStart=/usr/lib/power-profiles-daemon --block-driver=platform_profile

hwmon, keyboard backlight, hotkeys and the gpu_mode/kb_mode/fan_boost
attributes all keep working; only ppd's use of platform_profile is
disabled.

Proposed fix
------------
Patch below simply drops the connector-type check and keeps the
on-battery check. Rationale: the EC clamps the power limits according to
the negotiated PD contract anyway, so requesting full-speed mode over
USB-C is safe -- it just yields less headroom than a barrel-jack
adapter would.

If you would rather keep the restriction for the barrel-jack models, the
alternative is to move the capability probe into
platform_profile_probe() and only set_bit() the high-power profiles when
the machine actually supports them, so that 'choices' stays honest and
->profile_set() never fails for an advertised profile. I am happy to
respin in that direction if you prefer, and I can test either version on
the RedmiBook Pro 14S.

Thanks,
powerfullz
