Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43904280A56
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790725411; cv=pass; b=fpwFMqMwwsr8/ytn/6Y5ScQ+hTEe3ftEuB2zU935/WX6+tK6dFqmt4oOEpmbIHAdHA7dvGLQExKmEe5VJ9TSK8z9HHKzLKnDsd4hrOJF76mOCg7miyaVyXHjjrgT4sNm2yhByJtdzbyOEZEfjB5R8LK5g0PcPaJllHN8Oh/yM0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790725411; c=relaxed/simple;
	bh=6aXiepdryswLWdjUJAf83FGpheewF6hkHjQ+QVvQxVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fGWrrqQ6fCBjzGRgaffpYG1JolHvK/VIzcYEO8qEYOlcVfnb00ZSVBpLVaLCltjhtuJgnquBmFd8MIwRKl+UYjPc0joacno8g7WuUueKgMtQS7qCn6bOpq4RQimtzj7Nba4RQv3xiE09z+2TGraw2fbJWuYhTTgT79y65c8GDIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apt6wk0H; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apt6wk0H"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e1195040aso56115166b.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790725408; cv=none;
        d=google.com; s=arc-20260327;
        b=Wbfg741qQWcdNe+zAweda5gFYc8AjLHq6tdvORh2i98YgR6GGAGG+FtP67Lwyv/mEd
         Q+C5J1qEeMXtuWYrj12Us/p7Iar77hjv2zbmABXL/bPoOUPOn16RcHDVacigSvPT347V
         R9InNT+oF8gkDMUzMl7HWQZoAef07+AXznwiX8gdqKjVM+DD2hiz2LRBupRquMRSj0Vs
         HUI9XEjofSEtg/3bItS+0jhtWgHez1hRvrGu1kbj+pVNbgHYE2WsDbfEPAF1FH7UBdB1
         BkHoUtM5OhGr99mMNYnuU78V5KLlRL648YKFv4UIwZuGFq5l0FdHAwwQM9lMvcDMmf0W
         653w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VXrI1Si0krSdvB0KIZ0EYedlpAqkobs74EgH44E/76M=;
        fh=d7+3PeRPWEkRA7oGbdFqmjI1rIGQxWus0H+0yOUcBrI=;
        b=U7tTSkoa/p5jW00vgPWy3BrCis9vWZqIsQL1kXDF9uYwpBKGlxIYidM/4vxKL3lldR
         yP+lEdvg5Rv+FtH5rL3GlyOeaD2G0BX8unKja98dlQxP3reQunJcFFyhdn9NgYbqkCcJ
         H8sDAfeD9jLp8AE2/GhQ+bTnBlvZPn7EBwNgOMpRae4Pe+txsL3ozd33aRPUVGIQxxMl
         xWCObHH7gDZYE+OORC1L8qUvaMcY2KrRSiHjpdQPVvSnb6urG/IQYpz/9u/zG0hcTrS2
         PS1ne4xPN4lsBGhBnuSvnkQXaMeEP9LLNw0u+NG3z3ufAFSdynHgAtRbd0vSgM5FTIya
         1vLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790725408; x=1791330208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VXrI1Si0krSdvB0KIZ0EYedlpAqkobs74EgH44E/76M=;
        b=apt6wk0H9CKUKqnUvTFHWB1EkTbZ+Nv7DZ5jVg3ugiRV4uQ/hmJjY6u4kELs5IHF+9
         GB/r7VmJ9vr2EGhbbkFtGVQLWS526IWBk+kiL9YSmoDBL/T60zGqic+i42P/oH6PBKcx
         tIZ2YtUZCoZPbBYgqtZQgCmWHS2kNWK+N1ol1LIigim6NtJvAx0Fcce3aXDq24OLEjBM
         7SNm9jCj9rY8UtyzoAuQE7gJ4ru49PMGUsqdZ14tP3fzVuTYMJBs21O3IwaGaE8csSBV
         hED2id4/bD/fWw2/q/aNWdJ2evjr8gjpg5X5nHneIRAioYFqJRKm7nKxOi9nklWHed4m
         DLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790725408; x=1791330208;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VXrI1Si0krSdvB0KIZ0EYedlpAqkobs74EgH44E/76M=;
        b=CCHzWsFa4/Bmnxba7rcG3zhnuWPzqT8lqSIM9LupnPXqikO5VIah7a/aGd2kzQoTep
         BiSRtde6TBfNX3x3pFcZmA7rumH3zqf01ZxwxIwlPyv39ZI8ReXsTZStTksjn60dgxdb
         ssJ941CODXQjSKTq2LWYejX0pexU8wsOMGTExpxWvxaJizvJQLIXpqtjYswQMyhTB4+J
         G1buVdjEhJDClW/PQKL590xDo677eGzHCE5KQzDMpxexQpuRh5yoxKMgkMNpqo8oSgNG
         3cCNIkedquicorSwfH/9dcefr9KwZzvSu+tKFdDAsEeSNdrjEjr5hBWIOl81TniHl+Lp
         ajPw==
X-Gm-Message-State: AFuF++md6thuHVbqHA3j+bRtS6hmSbFymt4L+wbtIzTDJGazqufp4wAk
	GCgWDzsEJGqoa28X95vee82kop3HCexBvMXxktZRmHsm0AfPCmZKbqDOUhgt915TUUwjTHPkQse
	njtRip9ype87526QDczdmmRuc8UMSXWQ=
X-Gm-Gg: AYBFou1uQ36ukOJPFavz9Qk6R/gjPWmKg7Z1rH6II/eGZS/eO4O8PX4/vDgXXYbfXYa
	ATplhPyh1REF1zu+ewcZF/DM/sx/K/zkUXEPYdNnlErI77LdSIe9jVNGksY5+QGuik0HddKMgbV
	uX6LHwk0H95e9jWo50Zg993PpvvVJQ7wr56p2WaWwPD+i6LKpO1oYuG5pMyUG/KLaGChmFSBR9D
	pt7MjsgynLNG17xePIvs7bYYeyzkUjmU008RPB/BHYDTTfOPuUHWTdaFqvMuBPnZ+yEfr31pLST
	c1/ilkkrKKoLEKJwEomVFahWLaTYwQ5WkckBnvQI73HaZv1EinsfWKk6u1PCYHdVoJXdFHKXwoi
	Jh1gZ28VNJx5S9ZYVOSEDf3cVnArXJIeGnrQUuebvyOItKbwE
X-Received: by 2002:a17:907:7fa2:b0:c2d:c060:169 with SMTP id
 a640c23a62f3a-c2e1553aa65mr71244166b.8.1790725408402; Tue, 29 Sep 2026
 16:43:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928221417.37875-1-ilya.gladyshev@linux.dev>
In-Reply-To: <20260928221417.37875-1-ilya.gladyshev@linux.dev>
From: =?UTF-8?B?0JDQvdGC0L7QvSDQmtCw0YDQsNGB0LXQsg==?= <uselessfire@gmail.com>
Date: Wed, 30 Sep 2026 02:42:51 +0300
X-Gm-Features: AclHuK9MtCYgY_WC1SyKUrce1qIeR384cfWa87e1JPtMUrTRInyIFGMovTVNysQ
Message-ID: <CAFsq4KDAC05VGx9nK-qTkViR4D2802KnkMC=a8BnwsqHEhSA4Q@mail.gmail.com>
Subject: Re: [PATCH v1] platform/x86: redmi-wmi: add display-switch key binding
To: Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	ilpo.jarvinen@linux.intel.com, hansg@kernel.org, qby140326@gmail.com, 
	W_Armin@gmx.de, vlku.milos.fun@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Anton Karasev <uselessfire@gmail.com>

Tested on the reporting machine (Xiaomi Redmi Book Pro 16 2024, DMI
XIAOMI/TM2309, BIOS RMAMT6B0P0B0B), kernel 7.2.7, by building redmi-wmi
from mainline with this patch applied and loading it in place of the
in-tree module.

Before: pressing the display-switch key gave "Unknown WMI event with
payload 257" and no input event at all.

After: the key reports KEY_SWITCHVIDEOMODE. The keymap read back from the
device contains both forms now:

  scancode 0x101 -> 227
  scancode 0x10101 -> 227

and the desktop reacts to the key (KDE opens its display-switch menu).
The other hotkeys are unaffected: 0x201 -> KEY_SELECTIVE_SCREENSHOT,
0x1b01 -> KEY_CONFIG, 0x11801/0x11901 -> KEY_ASSISTANT all still work,
and nothing new showed up in dmesg.

Two notes that did not fit the fix, in case they are useful:

1. The merge series "Merge redmi-wmi into bitland-mifs-wmi" (v6,
   20260929134503.17249-1-qby140326@gmail.com) drops redmi-wmi, and its
   combined keymap only carries the long form:

     { KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_RESERVED_1, 1, 0), {
KEY_SWITCHVIDEOMODE } },

   With WMI_EVENT_RESERVED_1 =3D 1 and WMI_EVENT_TYPE_HOTKEY =3D 1 that exp=
ands
   to 0x00010101; the short 0x00000101 has no entry there. If that series
   lands, this fix is lost again on this model. I am replying to that
   thread separately.

2. Two payloads are still unhandled here: 0x00000901 and 0x00010901. They
   are not key presses -- the EC echoes back the Caps Lock LED state that
   the host itself has just set (third byte 1 =3D on, 0 =3D off, the same
   scheme as the Fn Lock events). Verified by switching between windows
   with per-window keyboard layouts, which changes the LED without anyone
   touching the key: the events still arrive, 200-500 ms after the LED
   change. On a system where Caps Lock switches the layout this is a
   steady stream of dev_dbg lines; KE_IGNORE would silence it.

Details and traces: https://bugzilla.kernel.org/show_bug.cgi?id=3D222062

Thanks for the quick fix!

Anton

=D0=B2=D1=82, 29 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 01:1=
4, Ilya Gladyshev <ilya.gladyshev@linux.dev>:
>
> As reported on the mailing list [1], on the Xiaomi Redmi Book Pro 16
> 2024, the display-switch key emits 0x101 as a WMI payload. Add a
> mapping for it to the keymap.
>
> [1]: https://lore.kernel.org/all/CAFsq4KBXCB=3DaK8ENHx__6+RcC-ybT7eKjcgsa=
3TgcJ54x-PLEg@mail.gmail.com/
>
> Reported-by: =D0=90=D0=BD=D1=82=D0=BE=D0=BD =D0=9A=D0=B0=D1=80=D0=B0=D1=
=81=D0=B5=D0=B2 <uselessfire@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D222062
> Signed-off-by: Ilya Gladyshev <ilya.gladyshev@linux.dev>
> ---
>
> This patch conflicts with the unification of redmi-wmi and
> bitland-mifs-wmi [2]. However, that patch appears to be stuck for now,
> so updating a single mapping in the old driver seems acceptable.
>
> Cc its author, Mingyou Chen.
>
> Also, I can only test that it doesn't break on my hardware, so any
> additional testing is highly welcome.
>
> [2]: https://lore.kernel.org/all/20260816100813.300450-1-qby140326@gmail.=
com/
> ---
>  drivers/platform/x86/redmi-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/redm=
i-wmi.c
> index cc82ef502002..155777bf90f3 100644
> --- a/drivers/platform/x86/redmi-wmi.c
> +++ b/drivers/platform/x86/redmi-wmi.c
> @@ -22,6 +22,7 @@ static const struct key_entry redmi_wmi_keymap[] =3D {
>         {KE_KEY, 0x00000301,    {KEY_ALL_APPLICATIONS}},
>         {KE_KEY, 0x00001b01,    {KEY_CONFIG}},
>         {KE_KEY, 0x00011b01,    {KEY_CONFIG}},
> +       {KE_KEY, 0x00000101,    {KEY_SWITCHVIDEOMODE}},
>         {KE_KEY, 0x00010101,    {KEY_SWITCHVIDEOMODE}},
>         {KE_KEY, 0x00001a01,    {KEY_REFRESH_RATE_TOGGLE}},
>
> --
> 2.55.0
>
