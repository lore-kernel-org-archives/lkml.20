Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782253;
	b=sGfcpQAxhffSQn8GWBZ16DJPcsWcl0Q3ohy3t45c62bWKydYVXuQa2SxShf/FdwAzvfW
	 Xvpog+qagelqyClXUGdk/QqImIK7kqI6chyWCO5JCHJPERzYFzwLnMlN76wgFqD/mLU6n
	 E83JaUQzSK0VDQ9gNOQ/P+GDUZ13V5qLOgaxuXjHU5T2j6ZQKKfH3pE3TlN3UHJcynUNw
	 681bYCuaddZKcOuyXGaif2jqylGvHtQBTqrcfr02q3aLvU5iNE7AgazQ0UntcQBqVwfyl
	 YpT9ECy1PlFpMzMJKDtdpIc359dC2dOUZxvplt1hnP3imzDOsEDip8l8dcb1J/I8SwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=/uosKOFE+jLmcuWismvtv+9sAqcc+AKxPzq+cY150Wc=;
	b=y/wdSYjQ62xgRMkARGL3+NnZazaGCTa2T2NpWnYtU8EL5d+/5j173fmKBKTSqk8x9GQs
	 nC1veHfqZO4GdwzhQHeEWrWUBcGgPI22aJwMSrFbtUv1b1BDBSUKV+XFUr5GhHEokcEc3
	 7a70E8lUtM3Y+4qHvZplDsQJDz6tYccwJGcd0QmSdgChNFfDAGQCwmmf+0sR6oCyokawk
	 pGrrHLjUUHVYXDrRBjVJHfbcxjR9tqTumAfjPZoRYsEVoA28M8N+p+FJ3arBMj11QEUXc
	 HyYIPMd8/IFU9I9Dfst1iTYoX6HBesCZdl0gMfJgoLRnMX2tRRpSmpFe6TYeAYoSt2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=scWq5sHQ;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECA5606EEA4
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CECA5606EEA4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=scWq5sHQ
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so3823285e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793782251; x=1794387051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/uosKOFE+jLmcuWismvtv+9sAqcc+AKxPzq+cY150Wc=;
        b=scWq5sHQAcgmUxPsLyu0ZcaoR0jcClnGvEJhGMuKM1MqC3k0HqgYwvmdPBhpyAm4wO
         1sYPxlosiMGRZwdgczY/gO2jC0sDT+Ldu+mzVlzD59MndXPGLNVyvjcqa14GO2GfAZJJ
         CIizI8NIATb1lxy1IyRmo39M2cGBi//5bP1qwB7FNGf+q3GxKEfEy1p7BvQHFTnnKQFD
         nXyF4iFdc3ivPpr9L6QReYNVEd8J8RqHrZmMKNLBSG/gP6annAQlzqUsAKTpwNlQsIDO
         aNpJAgyM/4dr/RqcFE+Y/+pf4tEDxzticEUG/wr2EjD7edOj1BIUIJ6CJUk1woJz8B+i
         1Xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782251; x=1794387051;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/uosKOFE+jLmcuWismvtv+9sAqcc+AKxPzq+cY150Wc=;
        b=hxEjkxWUHw1LOKcmng7Crykv6V29PdkpQii43AXC7akmKif0JYnKW1fn2x0uM28qXK
         EYSA3oL/o682n6e0iQROBndLSSFDkpxLEnJ2uzQO57tB/WVZwwR7FXjgbUB2rFyViUxv
         uAQ2h0cs7DkQdzbGG8fkikGP34CXc19KwyTKsK6zo7Wp2BEmfF9VrzO0w81QrqK21ssl
         IEfGlYsBsRX4WIMfnMVgHh9VtgSUQxNT4l5M5OF8KhDNx+KuVs8Tltkhy6wXI6ynvJEe
         qS5Ad/RnPQzC1FKlxxGBM0IjOERAumjmwMVfkxvEJhE727HnKpIDdXP2QMZAajmkz+pL
         s8FQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlGmaMmNkgiUbpDfY9R2OxoAKcBBDVBtO9crudNE/9XtMFCS5W18+fGnlrI/XpB8Ab9yK4/7C+bOMedlA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9M3qkTworgWLqUZonRxnOcdn+FORgMoToUAgPMMEVf5fn1aPhX
	MfdjHr+IX3h/bC9iPhXW4cgCbaxkrGyS/RAjmrZvJOidlv5518TiUrfAW3+HNaIHiEU=
X-Gm-Gg: AYBFou2G8k40ItAcYtBtp3EYg0bQ9ihs2Z8F4FoifJKGNVdA1Azm3CnFZyPH/jdsD8r
	oQlJFBiteGJXxC0Goyqeq9+/ZsQhhZKUAqhtgenzYm59q6o0hlRz2BxPhb//NuAvc+O91UUS4Fl
	MZeianZMmG26OPuleGbvnUf2dtS0obT4iFqKb6iYgeSwYdOs1kwC98HL7Y2ysnO0JzwR9ANUXHG
	D5Z4iaSCYeQYFyZw72PlfDSgCUfnuWhGJCenz9yVSlu9ZwwUOQycMLx9cDu9UZnf/9IgBF9/VDo
	gR1EZpNa5SeHfb9BhwhfVwPFpUuZ3L60sXmDk7Od0uTOL6IK6lfCgzAu8i2OyO+n9j+GDBqDli/
	KWaArqbjnoiM4vSiqMOiZtevCLTInjkHz0fs24iAAEi3vGfp7cgYV96kLQnQR2mjEq0jlR/PPRf
	MOdH5QNZwWrWgg7TqpM//41w0QFEByKNSWK2Lb25JXGUbYKhLlE+IxxFEwiUOKoTtepOqv1riUh
	52Q+7O5I3xziAWLZN5vRcp+lS40lkW43G83PeWMkU0Idae4TmzIp1xM7tF78IGLvdqULwyl3ieM
	xG3OzmxX0sHjoKqLfNJPo3YDpKfVgjpnywVs0BGniYW6j7MnArBC8CrxgxwMvPEmK1lAgyOjjXA
	G6rfFxKctVFwCGjBXlA0UTjfxQoQ0jA==
X-Received: by 2002:a05:600c:4e8c:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4ac1793ff26mr345895375e9.15.1793782251064;
        Wed, 04 Nov 2026 00:50:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:6762:47bb:1e06:ff70? ([2a01:e0a:106d:1080:6762:47bb:1e06:ff70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm2514434f8f.11.2026.11.04.00.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:50:50 -0800 (PST)
Message-ID: <399668f0-e97a-438e-b761-1ea6c18d904b@linaro.org>
Date: Wed, 4 Nov 2026 09:50:49 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 0/3] alarmtimer: Choose the wakeup RTC per sleep state
 from the device tree
To: iav@iav.lv, John Stultz <jstultz@google.com>,
 Thomas Gleixner <tglx@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261104-b4-alarmtimer-rtc-priority-v1-0-e996681b8086@iav.lv>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261104-b4-alarmtimer-rtc-priority-v1-0-e996681b8086@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 06:54, Igor Velkov via B4 Relay wrote:
> alarmtimer binds to the first registered RTC that has an alarm and a
> wakeup-capable parent and programs it on every suspend. On ODROID-HC4
> that RTC is amlogic,meson-vrtc: a register the SoC firmware reads when
> the application processors suspend. It wakes the board from deep sleep
> only, and only when the firmware handles the alarm; it raises no
> interrupt in Linux, so it never wakes the board from s2idle. The board's
> pcf8563, whose interrupt line goes to a GPIO, registers later and is
> never used.
> 
> Which RTC wakes the system depends on the sleep state and on the board's
> firmware, so the series lets the board device tree say it per RTC:
> 
> - linux,wakeup-states: the sleep states an alarm of this RTC wakes the
>    system from ("s2idle", "shallow", "deep" as in /sys/power/mem_sleep,
>    plus "hibernate" and "off"), or "none".
> - linux,alarmtimer-priority: a weight to pick among several RTCs that
>    wake the system from the same state.

This sounds bulky, perhaps it would be much simpler if we just added
all the available RTCs which has RTC_FEATURE_ALARM and can wakeup ?

Just switch from 1 single to multiple RTCs in a linked list and you're
done, no DT & bindings changes.

Neil

> 
> alarmtimer keeps each RTC that has an alarm and a wakeup-capable parent,
> unless an RTC registered before it, with at least the same priority,
> already wakes from every state it lists; each kept RTC gets its own
> "alarmtimer" platform device under the RTC. alarmtimer_suspend() picks,
> by pm_suspend_target_state, the RTC with the highest priority among
> those listing that state, the first registered among equals, and
> programs the alarm from that RTC's platform device only. The driver core
> suspends a device before its ancestors (dpm_suspend() takes
> dpm_prepared_list from the tail, in reverse registration order), so the
> chosen RTC and its parent, which drives the hardware, are still awake
> when the alarm is programmed.
> Without the properties only the first RTC gets a platform device and
> alarmtimer programs it on every suspend.
> 
> An RTC without linux,wakeup-states is taken to wake the system from
> every state, so that adding the property to one RTC, e.g. from an
> overlay, does not change how the others are used; a priority on the new
> one settles which wins.
> 
> Hibernation wakeups (.freeze/.poweroff callbacks) are not part of this
> series.
> 
> Patch 3 sets linux,wakeup-states on ODROID-HC4: "s2idle" for the
> pcf8563 and "deep" for meson-vrtc, so that alarmtimer programs the
> pcf8563 for s2idle and meson-vrtc for deep sleep. The patch applies to
> the current tree, but the s2idle wakeup also needs the pcf8563
> interrupt (GPIOX_5), which a patch under review adds [1].
> 
> Tested on ODROID-HC4 with v7.3.1, [1] and a BL301 that handles the vrtc
> alarm, waking by a CLOCK_BOOTTIME_ALARM timer, once per state: s2idle
> woke on the pcf8563 interrupt, deep sleep on meson-vrtc with the pcf8563
> alarm left unset. Without the series the alarm went to meson-vrtc and
> the board did not wake from s2idle.
> 
> Questions:
> 
> - Are "linux,wakeup-states" and "linux,alarmtimer-priority" acceptable
>    names, or should they be generic (no linux, prefix), given that the
>    states describe the hardware and the firmware rather than Linux?
> - Is the device tree the right place for a capability that depends on
>    the firmware the board runs? On HC4, meson-vrtc wakes from deep sleep
>    only with a BL301 that handles its alarm.
> 
> The alarm limit of meson-vrtc also depends on the firmware, and the
> kernel cannot learn it. Some API is needed to pass this information to
> the kernel.
> 
> [1] https://lore.kernel.org/r/20261020-hc4-rtc-alarm-irq-v1-1-b2b8c68d54f5@iav.lv
> 
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Igor Velkov (3):
>        dt-bindings: rtc: Add linux,wakeup-states and linux,alarmtimer-priority
>        alarmtimer: Choose the wakeup RTC by sleep state and priority
>        arm64: dts: amlogic: meson-sm1-odroid-hc4: Describe which RTC wakes the board
> 
>   .../bindings/rtc/amlogic,meson-vrtc.yaml           |   3 +
>   .../devicetree/bindings/rtc/nxp,pcf8563.yaml       |   3 +
>   Documentation/devicetree/bindings/rtc/rtc.yaml     |  29 ++++
>   .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts      |   5 +
>   kernel/time/alarmtimer.c                           | 157 ++++++++++++++++++---
>   5 files changed, 180 insertions(+), 17 deletions(-)
> ---
> base-commit: 348f54c435bf3177baa78201952810b255d44b30
> change-id: 20261104-b4-alarmtimer-rtc-priority-2e25131a2917
> 
> Best regards,

