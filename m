Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D573F788A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790273235; cv=none; b=jYe5QUtUnfXZDqc9rT6lXeEj+PLcPnwq1In6mq43XhgDAPQXz8ifk/WL9Or/SAEnBr0dFN6sHLePqVCaIAwYHzSMaItkjw5oSk+yiaLZM07HrGrzdxbOzY5P6KKPBKWtlz5slaqvKLLvEBCVAWFqXth/3uQQGVKgOl0y57cjoMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790273235; c=relaxed/simple;
	bh=oMSGsZ7lxZQRzyztdSg+4IV9Xd7weKoKL7xlDtrWs1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JrvUfoNLCTUnpZMYZSx/fkhJx7DVEgnH0HspzsjIP4mosv2yuCSRnu6hfgsNLRgFK0LUzRYcCH5sDcXjPqUFChrNwS4FtBuw+a4JHqRnLakAsZmBS1jbX6eEy3uAr4oz6DWb3pvaUXmAiylRLVO2vFPSLXUsOvnl2z41De0uKQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lt3bG3pR; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lt3bG3pR"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85e68bdbcc1so1010947b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790273232; x=1790878032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IyXPJ6ar109HpW1pFcFHtHGaxU+O3cC1UHabunMwZ/0=;
        b=Lt3bG3pR9nddw6LgptA6UGW/6/8HX2IveZzQtC9qqneIlxOOqvcnT3umtIlE3MLMt4
         GEHDRBC21Ytt2GSure5c8T9mVIuap4k+TZo8I98Ycb91tYjUu/qGZH2WQv+u56Hdhdsr
         8ETXRuaWcuWvBD65/rg92ZIulPSDQEYWpzlX6K/KiaK77XkQd85B07+NP9AsSthSUUoB
         Hc8PSjg7vmc28ye6Z5kSiWSBRCefmmUly37oZrfG6pTaNohoAgMWsYbaCT9qk2SUi8T9
         e058QkDmOcHWpdyJrmOPWAWKS5fY3/A5x6IWp+CxWBv0qxNKf0iGUvBoG39JeOa+Ngt2
         ig8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790273232; x=1790878032;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IyXPJ6ar109HpW1pFcFHtHGaxU+O3cC1UHabunMwZ/0=;
        b=21k79f8XakbvZOUJ98uQ3BFnQo30Q9m44my9dW+MDnWV/QvkuQbrnPujyIEdrK1RNA
         7xpOrycFD8QnOKJVt1qIxakoZA6AUbPEJmeU14kW08DhIY9H7llZcKp6UrTqAEyTCSDg
         nYjPhU+Aatuq3Qqj+bTBcWztZXuJbj8kOExena23/imhqMY6MyCe2Ux+t5ENVzcFZP03
         MMF6C5VWpuRmZH3u8fAps24Qgov8GXhWlx20DBO8DGrjnf9eQDvmeuyFnQ3s03eN2alF
         C/y5k9NwMhZ1kY5mk0hGXY2Gii9LKPIkQmX2A4vJGe9yXwlge77KO1zQtcSpPqIZxChF
         lcwQ==
X-Forwarded-Encrypted: i=1; AKwUvByg09ZWq92W+yKN1MqLcMW20qkYp3FalCn6dyRj1iACYUuVR7i3jFYJ2dMmSVI8DrU8CBWr/pqAy4h9Sbs=@vger.kernel.org
X-Gm-Message-State: AFuF++nhUcag1GHXUU5GMlnYkMX5gB0XST4MW5tgTcOukSFZExG3g6bc
	8PxXy/xVVbdSSQqpe1uJJdDl/IRxi+xg7X8w0t1e7+CLYemNJn5lr2Bx
X-Gm-Gg: AYBFou1ihpttyZT85UtLI2QWb4LvnTd5hMAPiA0KiUmS672oGmO6wEhw8eF3M6Q068O
	n75kBGtySzHZlFuwKzbuZjZURRhhstZFftVhLL5WHN2IC4/P8wJlufNW3Pc67OpGAyI/6Ciudj7
	3yx4GQ8EHZsNIv5pe+4u/fjTbrzKPvqwZsyRW6fcTX0k7nkPnApqqBHaGDctw55rSrmRXEIY65l
	ohKNoY+bIXalj4KYb3defRB6jIBeUA3np5PgtrTuyFRb8l4wYIg5oERKqID7mX6DzBYOZ4jzXx0
	n26hMuvWQUStvuom4+Ejj2qH01de1Q6/e1QbaSKjIR0i9fr9sEvzHagyv7Tnnn4TEgQqdqe/XKI
	a1xvc9EvPH01+vx3VLYFrCrlrqoGAOrJTot8++rOZWEVsXfEdqwu16yhJRGleBb5bHkFEZAmtwg
	dWQM2Gi8VNuUdgB4hs5HVIkvdz9n1zlhXoa9LkGOKI4yA0fmaZdpY2d9FEKQf0itw56o0p22J68
	ifxId1rvu0=
X-Received: by 2002:a05:690c:e149:20b0:81e:f5ac:e40 with SMTP id 00721157ae682-8a64707b472mr18946227b3.20.1790273231962;
        Thu, 24 Sep 2026 11:07:11 -0700 (PDT)
Received: from ?IPV6:2600:6c5c:6b00:316::23? ([2600:6c5c:6b00:316::23])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86102bbafsm308787b3.39.2026.09.24.11.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 11:07:11 -0700 (PDT)
Message-ID: <42cccecf-ff14-41e1-811d-e5a44f3d1aab@gmail.com>
Date: Thu, 24 Sep 2026 14:07:09 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-net] e1000e: fix flow control stuck off after link
 partner reset
To: "Craig I. Hagan" <hagan@amazon.com>, anthony.l.nguyen@intel.com,
 przemyslaw.kitszel@intel.com
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org
References: <20260923235832.473-1-hagan@amazon.com>
Content-Language: en-US
From: Matt Vollrath <tactii@gmail.com>
In-Reply-To: <20260923235832.473-1-hagan@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/26 19:58, Craig I. Hagan wrote:
> On an I219 (pch_spt+) copper with jumbo MTU enabled, a link partner
> reset (e.g. a switch reboot) can leave the PHY's pause advertisement
> bits dropped. Nothing re-asserts them on link-up, so every renegotiation
> resolves flow control to none. rx_crc_errors climb and traffic stalls until
> the interface is manually reset. Observed on I219-LM (8086:15b7) at
> MTU 9000 behind a switch that was power-cycled.
> 
> In the watchdog, detect a completed autonegotiation that resolved
> to no flow control despite pause being requested and the pause bits
> missing from the advertisement, and schedule reset_task to rebuild
> the advertisement (as ethtool -r does). Remediation is limited to three
> attempts, 30s apart, until the next link down.
> 
> Remediate via the existing reset path rather than re-asserting the
> advertisement on link-up; a root-cause rework can follow in net-next.
> 
> Fixes: 79849ebc0e06 ("e1000e: initial support for i219")
> Cc: stable@vger.kernel.org
> Link: https://github.com/systemd/systemd/issues/25925
> Assisted-by: LLM
> Signed-off-by: Craig I. Hagan <hagan@amazon.com>
> ---
I was able to repro this on an I219-LM laptop by link cycling with MEI
runtime PM enabled while the NIC runtime PM was disabled.

At 1500 MTU flow control still doesn't end up in the right state, but
traffic otherwise flows normally. I don't think traffic is stalling
because flow control is off, I think it's stalling because
e1000_lv_jumbo_workaround_ich8lan didn't run after the PHY reset.

I didn't try your patch, but there's a four line fix. Where the watchdog
resets just the PHY when the MAC exits DMoff state, set FLAG_RESTART_NOW
instead of resetting the PHY, then goto link_up. This works for me at
both 1500 and 9000 MTU.

If runtime PM were enabled on your NIC it would reset anyway and avoid
this error.

See:

https://lore.kernel.org/netdev/20190628224932.3389-16-jeffrey.t.kirsher@intel.com/

