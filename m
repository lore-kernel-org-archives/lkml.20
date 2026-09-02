Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3044A9D7F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367396; cv=pass; b=LkDic8JMXUBuM6f7gTHRL/q6oaKeftpTrFyA/sLP2++2jNn2BBOY8p9qCRnskJ8KiklzJ9D36usCU0AA9sfQqdgoW0bqasJuixkKTFSfkj5J4IjpSTtzCPCOPmZxKpxG43Gqa4lV+mE6hxhEbspwiMf7Qjlbc6LTIdOlFM2If1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367396; c=relaxed/simple;
	bh=gPS8xPpxftd5m0qUB0pJRUJAoUIhG5xIYoObHIgKCXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JMdjoqLO56fo86rxA+1lB3EAyx/E2zOZBCSiotINBQT4+4HpJxoabuH0CTYgIHwEsytCb9xXT0dAnqxU1RzgonHjqe1+G5w/gITZetvojpKM1MTzD3xUQbpu/x8MORadB0guZH3opqy88H2zffIpjp6NBxoRgj8y0Sgy09VUKqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vg44FnCl; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vg44FnCl"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c20ce3c118aso14670266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788367391; cv=none;
        d=google.com; s=arc-20260327;
        b=LEQmVxPF1LKCMQbrNlRp89MrXUyNjoLRwQEhRJY3RgCxJ3CbKEeWtPk2Eh++HCr2Mj
         rE7K43kHDF4P+0/QQHX9UZ/nGJKgb2Q3R430h5NxpieBc8rtB+wbxN7awQBVPPNTWeI3
         Xqu0axnTE0cOYvzhLCXxUnbipShGIqywCYYTrWo745z/tymht5aJRV3rJDzKz0CFMumm
         lt5T5FcEvbWv5ULW9C6b4kKjrGQIWADwVj9jQ+BVhYuZmwbgj2lPg7J5lilJx7lFWLyE
         E2vpQm+Be4e5tfGNGIy/A4PO0Cy7IflJsn6RttBvA9rzqZFfuSlq8xDj2toDkun11EMU
         sTbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xamHj01VKWI6LV5czE0pHDzK6LRZaTCUiyHzG1X+Lyw=;
        fh=osnhNi9s3FPLpXRDewjyohfCgyuUbIknTn8MLPcbkeM=;
        b=G1Ku2xEikX5YMp4CKSjDa618WQxu7qJSq2ISTckinxahhxqR+OOnkH46vUZKDDYAZy
         +iMgpYcdaw/dY6juuU914SeoUVV/Q9lMCpO0MWjRlFTBiMNPk4ni+963tt0qoe+00zeH
         Gflsiihvvm0wd7B0xa6M73HLp4bCyZV+1hZIol8OFMXCTjC6A45+d9Vl6QKUKse12c7E
         N84COJgpmanAMnwrMNHeCW3LofZX+4tCBCNdFup5IP2raFDUP+YirG3jw61lNhsxFANI
         khKLuTcctzHjS5ruZSARnFaPzx7+6sZmDM3r87J3tCdTDL+suBcpSMxKRGMLNd2Gss+b
         oODQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788367391; x=1788972191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xamHj01VKWI6LV5czE0pHDzK6LRZaTCUiyHzG1X+Lyw=;
        b=Vg44FnCl079/rzGgHyjkXujx23xzhFhBziA5BFR9sY/vPC+0mVssCTGY8lSN+LLELl
         CPQWVAfnN/ISAR1uS+7DFIBrvbKsqBSHMhQ0DLO3rPOgOAsT1wZFH+seqQUHgTmSjQjX
         VsctB1j4hxRj8Wv6+Fuzr6eVNRKZVwDaYs91bIq/sQFDNj3rerivIvp+GaHdLtayadK3
         a8l5FACwLPf52e3qIW4xaGfKeoLgVk8lmvC0/xDMps6dj1ctOtMET3MdO3N70reswZFB
         RWgLLKEgB3D4BCIHxyZEQ6N2n6xEZm3ft2MrEf4YGc8R+N4JbewWIArJsWs5Xw0RlERm
         HTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367391; x=1788972191;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xamHj01VKWI6LV5czE0pHDzK6LRZaTCUiyHzG1X+Lyw=;
        b=NBcbzs/dEONlGjYd5E6Ts1H8Bvy8VHmpoI10cc4uVmexO9Y716iexaRYPoY76Ub9aE
         GuhGgAKFYsJD7rY6TixO4aP7hws0HKfnfgzltZb5QgMs1W4OYQg86o3qeFv96i0Jt/2p
         /xrohtSZOsa1/gGOnq+D3oVvb8uYm/+osUcZoiJM8DXJEQ+hs+xt8Yjwth+maqpz0nOJ
         je7sQkrxHHBoy7o4T5rFXcmPRR7zijQCXP4gk309CMvs7qrbxcC6mnRvZ9uRQrPFsO9F
         hROfeBMBFzKo95wQftouIZbQD7bngr0QinbsFmsLyPWtmkW29UJmpCl01e2tGqL01qXo
         ArMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCCTKH0P9TCCWioVhVgLEs/nroWetsL0iOYIq2KBSsokPozBmpS5Agm74gmkXGmBDLCrLJ6Mhw3SqOLLo=@vger.kernel.org
X-Gm-Message-State: AFuF++kGMyiqImCfGrKKxPWpCAmY3z04vAX5NNTnEeYtU1pScjl0fjn0
	RzWzCw7L/5bzSbLyaIWhd8tWrIACfKuoCii22jKvaiL/+LHkmokjh4vLegBNRwmhilT9WU1C5L6
	N2pmn/BZIe5+Ai4oEHT/xulQN10C5W54=
X-Gm-Gg: AYBFou0C6Y+oz+8RiCRoERDpwcKWSULNVVQNb0xyUZ+ylIRbgY6ZuGsPuo7IZYgN1Dc
	XB0bPc74SNRY215v0dvapAycNj1ibsqKtr6wTFIc3MACkEfJLzq6cjIajhG9ebDQKuQgAEDwl+M
	XGSDsTbT3G4V0C5iad8RUBeVdqVO4v8iOPd+YCkIFO5wkYfSbdA47vQhOWqy29nv7McKhA8NooO
	8xrFD8FTfCPu4HXjyXwyT5U7ik3L1l0PLWKb5L8zYuhzZJ4/zxZJnCsL7oM5P7FdpUv6GoZz3HH
	PMh6S7iL+W/yJj2fqxxBfOi3Ipxaa/nefHRnR1/cHS8y
X-Received: by 2002:a17:907:9288:b0:c25:3e36:acc8 with SMTP id
 a640c23a62f3a-c25efbe1685mr30515166b.4.1788367391342; Wed, 02 Sep 2026
 09:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902032353.16106-1-idotohors@gmail.com> <b8cdf49b-91d4-2e86-a8ea-04d1db119225@linux.intel.com>
 <a6bff161-0d6c-467e-99a8-2062f123a6f8@linux.dev>
In-Reply-To: <a6bff161-0d6c-467e-99a8-2062f123a6f8@linux.dev>
From: ido <idotohors@gmail.com>
Date: Wed, 2 Sep 2026 23:42:59 +0700
X-Gm-Features: AcwNN1Vj7rRrx-LnXXLhkLbjkfomsecCDmwbl60GuUPcPkoK-B4GKjYPfAaqN8U
Message-ID: <CAF-TU9b7htDRcar_3+uq+T-_3PgDpWjewC7wVHpxneJSpiLD+Q@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: asus-wmi: fix FA401 series keyboard
 sleep strobe
To: Denis Benato <denis.benato@linux.dev>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denis,

Thanks for the feedback!

That's a very fair point regarding userspace and kernel policy. I'll try to
find a more proper workaround.

Regards,
Ido


On Wed, Sep 2, 2026 at 6:54=E2=80=AFPM Denis Benato <denis.benato@linux.dev=
> wrote:
> Hi Idotoho!
>
> I tried to change the ASUS TUF interface for leds moving it to asus-armou=
ry once,
> I dropped it in the end, but I got these defines and bitfields right: you=
 can reuse
> my code code if you want, just leave the interface in asus-wmi.
>
> Also about this restore the backlight setting before entering sleep: do w=
e really
> want the kernel to decide to override a userspace decision to shine some =
leds
> in s2idle? My understanding is that if this is a userspace "missing featu=
re"
> (the ability to configure what happens to LEDs upon entering s2idle) it i=
s the
> userspace that has to be improved, not for the kernel to force a decision=
.
>
> Best regards,
> Denis
> >> +                                      0, NULL);
> >> +    }
> >> +
> >>      return 0;
> >>  }
> >>
> >> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/as=
us-wmi.h
> >> index 5cd4392b9..69d224774 100644
> >> --- a/drivers/platform/x86/asus-wmi.h
> >> +++ b/drivers/platform/x86/asus-wmi.h
> >> @@ -52,6 +52,7 @@ struct quirk_entry {
> >>       */
> >>      int no_display_toggle;
> >>      u32 xusb2pr;
> >> +    bool kbd_rgb_state_quirk;
> >>  };
> >>
> >>  struct asus_wmi_driver {
> >>
