Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793046016;
	b=mzb03uf0J1ROgD6Khul7ujTDP7T8AU0/L8TTJQDSK7tCwbS0FtLfHikNpFkuOdDYmLmF
	 DmQigntI9S8fKeORdWZQdYcza71jDEop8Jpjg6xf6IHLQ+rfjkZ9JTo2/IfdINUoCTMuZ
	 +FCfZVg2PGUHcEIFN8Iy294j8v0AwsBNIU59b8/RAsOSv+dYS50h9oq6Kgmjj42DhQEYD
	 Jt2O8Vmcb0hOH/tON0pG1MBHK/mw33+cPvM8UvpBmiJ+NYPtChLa+ca5QyBO2QAdclspN
	 +06+XR2OeeOa5nFuHIoTqCYJKgTrUB2RCPdmcTEhq9LLjWdvIf8WgSU8ObQIUsWSkyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yI8NIYe0+Bol/gJ1EMhySkKlLvDK0pmA/Aq2O12eoFs=;
	b=pJEmzBYeaepN/avI4LUKN/w2jg6BYZC8syKWEi4+YNQmfW4vcTAwNRfi2xqMHXwk+P2Z
	 JFxp5hX+rppHEQX/zcHIRaIutx6AJBZiY1mSkCbUzFBXpyYhe2wlCwWzFjrWBCNKafoLc
	 gkDnJCbzGeh0N66MgDfEHnH4OMlIq6jTfWV8f8texgnKUPdFzmiy7Ilc6oDgXWSnPz5Dq
	 0Pz7+WCTCQvugbDdtwGE54oBRYUq0YK9k7e2Df9GdMUpl5/KIdSLG+p9PYcnwa0MclU6d
	 MPU3tnGEmqds+4z8FeZUsQZjdahhQeuwzZ/s7qm9JS2AsfCTG9EeC1AhL8RviBcD/6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=Wqv7FHdS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87A0606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E87A0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=Wqv7FHdS
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6df5e315bd1so2394926eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793046015; cv=none;
        d=google.com; s=arc-20260327;
        b=XGA8VfFfYIOL7b7FTMijUIEzZXO/K/W1JOjgPYOo2qzkoQUwpW72fM4WlFz3OvHkZF
         5LibgfG4/QNIYJyWrTkQpiE18AbJhcwaAjCtU4xxvsHEWhfuiMcjqtvI7r2EVH3WunJ+
         M3ZdR9jgts1+rqiOYJcG7Ow0ItVJwFA9Wk/UIOzjPN4eZ0elIFX/fwV2/SFLUOd5K1aA
         tdeKcuf56YbJEDygpzgAz7bnxrl0ZdN96cEyKNZfL/I5lhfePeJCDmdCIfCUc65zYg5V
         cgA52kwt1pWc3zwfLt0/ukx+TxZu04S41zedS2wHnZ7cCOMytnTZKmmaeDFh9YU0Dm1/
         6Pvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yI8NIYe0+Bol/gJ1EMhySkKlLvDK0pmA/Aq2O12eoFs=;
        fh=JI1jiNReDQoKsph6cm9Kvq6/w7pY+zyynGKscLhU1xs=;
        b=aNGYrpaZ9XOuqxH0sRq0UDo9h+rHUfX79+iqdcO2zFRNA4d1JldYRGLaSEsHFKKKGX
         zDyLxE5Tjqq3zjbWjpvb2phjpoSWvVzsIi4jL+AJ/cmwqJs6yeSUmkUNlQurKSvotFcA
         hs+yj7JmXsq9YmXlTfeE1bzmZBTvNQEpLuLboZ97y4GyfDckAri8wfUVSnsfuQrBbD9u
         OAwk8ZY9MoWhXuTW1FTr14uq/74kWkHw08JbwPfaQbMSmgzTsH6fg7exuZ9nQGgUzAc0
         ofXJ3JONeLdbbnb8PSQG4afoSgW6PqYKShP6K4bycFmrr1CKq+tO3CF4MJ8uFWU234RM
         jghw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793046015; x=1793650815; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yI8NIYe0+Bol/gJ1EMhySkKlLvDK0pmA/Aq2O12eoFs=;
        b=Wqv7FHdSbmnkEZWZKou0EVbamRgUMbEnMjQsHQ+t0skYJ8x3TOVbvI+C6pyF3OeIvE
         /HaWcIaTTF2pHq+sO31WaVjYwZSrWvJVHHfnKQl7jvDrClGRz0DiixoGp5BKNmGUMEVd
         d2i+0GXhnyeJwUSHUEqgxUr8YKDn25xVaOZ7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793046015; x=1793650815;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yI8NIYe0+Bol/gJ1EMhySkKlLvDK0pmA/Aq2O12eoFs=;
        b=v0LOBcnm8fuip2jamGbXOUXrB0hZp9I7maakhr0g8/VN9ZWa6KQ5cH4qAmpj5a/EEr
         ZFc7u8/rm0FSoDVZc0qbDoLVlqkz0lO5DnYfkXDBZJsDp6/CsZT5PXRoZYbmBxCrZ/yp
         GD+NRiuqvcszJ4J+3bC/mrrpiX4vSWyjTzwZRjOluKE2f1K/JgBz71870vWibrfnEJNu
         WSvw37jaFcJOvEkglxBZg5QZrqHGJPIsX7NPM6U2UaZ9smAGHEGM2McKVjBtPVc9/Io2
         Yx4TM8dYvmA3SAcJX9W/9Kp2SXuF4PqeIoWp2ABn43Bk1sN8G5Kk3cyuEq3sZW2Tnejk
         MEOg==
X-Forwarded-Encrypted: i=1; AKwUvBxwbbD7GZVY1QWbBcW79B/EY9kC2rq4aK4NEZzGuRLcS5fzYCgCKrwmGiJDEtJDBpOsm5Ox1ztBRUyY3ko=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCZMkVniDxeQMVFieLHwpzSFJIRr4cWVXo7yer7c41TaICtCls
	i0rxDIWmc6ta+GhiUzw9dsxPBA5y8DVc1T1jWiWDlqzjoZ56ffeQJuk+wE2cdGlg5ylk8yb5sCW
	mRe1gqnOwSGwLIdwaO2dhcdUo81T0FgosGJQogAQ3qQ==
X-Gm-Gg: AYBFou3wSLiQThR8jQiLU/PZY46ZzvyotA8UPGfVnSjxfGNlAr2vALIzxi8W6CoFob5
	6itIlSQpeIot/wBz1oGsCdhG1xwPRw/lhWnEH8BebentcNCLim20pWGgunbpK/L3nWPYYLUjpha
	d5qRcEbwmL8qgusiNyLjaJwpTIGW1tdw9WFJJczrQgWhMtw0gi7CzMwFuBi+jJjXnhxO3GF1x8y
	/PZTx5VOHJC3rPz7wnipZPmX9iI28bCdiwEQNiq+AtSpQOwRGpCjrlIZ4ivF3ji6S7wU9dT0IPL
	c8O1C80P4Jbsy+VdYawBmzFZQbLrfBonU9gGlmqRagudgXpi36eKITyGeDpTD3YRkHWWJtdy0Wx
	nY4PDT6vAU8EmSYMYMC5RYNuX1ZfwUfk2hvqOwt/S2iHTP3DewTpKoUj15hCV3DExCa0xGMx4/1
	PhysTiC2s+upAHgnIbbD1oQAlkxw==
X-Received: by 2002:a05:6820:80f:b0:70d:1692:14fa with SMTP id
 006d021491bc7-70d169217b8mr2719253eaf.13.1793046014871; Mon, 26 Oct 2026
 13:20:14 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026102101.224568-1-qby140326@gmail.com> <073e6aaa-12dd-4fc1-b7dd-4d27cb4e27b6@kernel.org>
 <CAAcRvKNvBKwVcPQ6vv-+OGZdL2Gxd-ocNyvZO_q-g083QNfR5w@mail.gmail.com> <f2dd98be-0551-4857-93c7-59ffad1d3e88@kernel.org>
In-Reply-To: <f2dd98be-0551-4857-93c7-59ffad1d3e88@kernel.org>
From: Chris Taraszka <chris@miget.com>
Date: Mon, 26 Oct 2026 21:20:03 +0100
X-Gm-Features: AclHuK_C4jDOc7B5wvmudpU7dTFOTFpoeFnKoV-Igr14sdRWVz-SPTC7zmvQT8M
Message-ID: <CAAcRvKNYkXr+eor3JAYwO17vckeVAmYT+Dp+-wMobMmL40ukBg@mail.gmail.com>
Subject: Re: [PATCH v14 RESEND 0/6] Merge redmi-wmi into bitland-mifs-wmi
To: Hans de Goede <hansg@kernel.org>
Cc: Mingyou Chen <qby140326@gmail.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, KentoNion <kento@kekto.ru>, 
	platform-driver-x86@vger.kernel.org, ted eric <ericted8810@gmail.com>, 
	Armin Wolf <W_Armin@gmx.de>, linux-kernel@vger.kernel.org, 
	Matias Civadda <matias.civadda2342001@gmail.com>, =?UTF-8?B?6auYIOS/iuaWhw==?= <btx342@gmail.com>, 
	powerfullz <wleizc7319@gmail.com>, =?UTF-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>, 
	=?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>, Rsplwe <i@rsplwe.com>, 
	Bozhen Peng <bozhenpeng93@gmail.com>, Anton Karasev <uselessfire@gmail.com>, 
	Jame Jao <jaojame6@gmail.com>, Serhiy Shliapuhin <shlyapugin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026, Hans de Goede wrote:
> Hmm, I wonder if this maybe sends some scan-code on the PS/2 atkbd
> interface? Windows must get an event somehow ...

Hi Hans,

It does, but only the plain Space scancode: Fn+Space gives scan 0x39 /
KEY_SPACE on the atkbd device, the same as Space alone, and Fn on its
own sends nothing. So there is nothing that tells it apart from Space.

> Ack, this sounds like a case for calling platform_profile_cycle() if
> platform-profile support is present.

I can send a patch for that on top of Mingyou's series and my TM2424
patches.

> Hmm, if the value-low toggles I wonder if the firmware also mutes
> the mic itself ?  This may need some special handling.

It does not. I played a 1 kHz tone through the speakers and recorded it
with the internal microphone while pressing mic mute, with the PipeWire
source forced unmuted: the level stayed the same with the key's LED on.

The LED is driven by the firmware and follows its own toggle state,
which is what value_low reports. It does not follow the OS mute: muting
the source from userspace leaves the LED off. So the two can get out of
sync, but nothing in the audio path needs special handling.

Thanks,
Chris
