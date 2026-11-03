Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719417;
	b=J/IRl00/gVI6nw944zSGUtztWZkRw73t47mWG2viel68BpPelYml2OP5JLV/x+hu1MJV
	 4ObBe9LaymZuCGDA1ozfqtTVEIwr/AumI74lXDmHaL6yhFzfzDfJmanyDx5KuDr+oejT7
	 yZ7bWkjLUaFIHGP8wi76IwLmtH0FFHp7hFsW/OaQmTS/8uDsx0um94KGl/Ntv/l4MYNUo
	 baJsWw7EGvy7+fOtYxIxT5f4+be/0t53tWhxnffvujNsgE0lthODoRccgHzXsY90iHJTA
	 hLoOdvEhteXsF8Oi75AbwKHnH7RTBweV5B6DOks4YCLbINYmnj3OYd0fghbZrJ+C91A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aEhs+Ogt/icl+YRDYfi1ZxUchYHst4mNo0H46BAO4iE=;
	b=g2QSjua44MiwMcBfLRjpok//ciPlBmP2Yx0Zw3weIzB753EzbKyLI8OZdZdtijCJMYjr
	 0CNlDlCtmBW7YP5+C3Pj/sDFxaX+ytGI6HCwkDC6WzvALYOTrp1TEiFf+3OUPwqsckgz+
	 4bQGQ+Z0X+FDaBFbFAYva4q6qRNrMSdL2/0U5fUEi2Ep5e1y30txbKbOw3J5vwDpCeQo7
	 5VsQoZezvm+3AmyOAvfGLqDNpANTeap9PI8EZ9RqCKNUvPSvACKHwUkXhhXa/YJxAi3Db
	 n8M5SHBEZKWV/7oPtRKznAGIToczBg1Dwcn4pqV+0ZRXUWxD2HXFZgnbJiCyxBS4ifg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="d/Y2SQSl";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9801C606A79C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9801C606A79C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d/Y2SQSl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so32745225e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793719416; x=1794324216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aEhs+Ogt/icl+YRDYfi1ZxUchYHst4mNo0H46BAO4iE=;
        b=d/Y2SQSlhhEd8F48J4ixHyo2+rKQg9fJBudoaOC+RmAT3n3mdrl0nAWPlkmCbjPFor
         MRCFFOtKBv2s+wEA2T+Mg8NiQSGcldN1bLEvHH12qIydsUQISQUA36DYECu13DzguXlX
         OfA2aJRVvcBs7Ao0Kk+3rf2fzTYpe7fD5bhcr01GuAY1hBbxQMQ8bHYimkXbH2e7Ux8K
         GaIWs6yTskXRTjcROB+zHSBo0VcciJ+0ZBTl0Qj/mwnm1ZWFdNHn1T9fLrDFg7QrVjot
         EkymyoH/HgvNDE+LLs1+172bpdVb+9u3v5g1Bv7EyQGHEZGTiqks4kfOmnCxKUtagnJJ
         joAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719416; x=1794324216;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aEhs+Ogt/icl+YRDYfi1ZxUchYHst4mNo0H46BAO4iE=;
        b=YJXsjfpPlQI6UlxIBWAvFx+M4nHXuAKP/+0EVLZAq0PkHVHFfmVcZlWPqcYwX2f61s
         yr5J+qtGPpvEWalLg6rWcF0eckTEXAb6UlkvPKYCMpxqNoLX0hdttbr63ZqljeSCBkjV
         N7ZWQPAWUMWgwd+AHz5ccDKNuvvZScifVaTfvztXGzQGBFHeur1Kj+08QqFyP+Ac0p9D
         YtwjEr8pb5ouuH2Eqg2SKHfi9ZN3XKtRttI0/6ogHsSUAsSzr5JUNxyvTUJa8xQVbq2r
         9zAYFYB68QZeO5czrLafi1oUwmK5wPX0nVKbI4eZbqB3ID7pbkR3iB/Z+ta7/3HT12KS
         vVjw==
X-Forwarded-Encrypted: i=1; AKwUvBw3YnmNS5re9JqkGn54Q7L7ArXcmljR/YDIbo5HZXZG87PZFoHpIIGNhZpZctGA9qXGQn5DBAvQeuWt8JM=@vger.kernel.org
X-Gm-Message-State: APuU4Z96N5MtlpINdE5U1mbsP55hExzTjUcD0VTXRihZ2MNA+7KGA3il
	jSrK7rRKwSEvTDdUvi1Jl7jzDmo38zK8OPOgKPAs/QhJpiANDYF5aBbD
X-Gm-Gg: AYBFou0qNEVxCRekhrTosNp8Hy0wFJhugohpCdjYmh0+VX3jN1BrUavaGCRWODsRWWU
	amCUVVH+n21lp5p9p3YaBt5G+g9l7kIfIpeLOQZMSdy/7H0rLdtQ0isCQGFZqtvaI+fNh/JwyUd
	L0ZnwFf2PD1xCjnIMx3bMmh0d9qcldtnuFmlVaUnE/yKIWjKuF7YliH+yHtmUqkiEKlqxE/9F23
	calacdQkOjO7cj/ZYLE5oZJ/+UejBiS038iIwVvM5+2e+mVGLigYjaDlIzno26emsar0DHLhDLx
	CjCCdTAdpJElr6oVk866bbofwQLrJDndadw69NCROXzpEFM8QIgvF/K/aFrhyphTKX8xoe/N2JS
	l+aNdHfzGHxCwVJFpy6KIAlOXaL6IS3qCoehxl8F0Sp1NmLjKdgzLNQNx+Ze2skQtqZ1tVQHcTX
	ec9gYZIjpv3/fpfOxvdFifeVn7P7PKpfKzkhQYUJrMlkZyTsBf0ONSexnwA/LkIG5UmEeRpz6JI
	vwQ8xvxIL3Rsa3c03a+fZCVO7PKgFdFyVoam81zK0o5uPLBMo/Ei9lN5Rlz28tx4v2dybCQxWeY
	g9yrskZs5Dd1saHQQs7zv16dw0pHsqnMU4iBkwRUvQMiyEmBXUOR5NpsbQ==
X-Received: by 2002:a05:600c:5295:b0:4a1:e92b:ae4a with SMTP id 5b1f17b1804b1-4b3c3545146mr11911275e9.21.1793719415715;
        Tue, 03 Nov 2026 07:23:35 -0800 (PST)
Received: from [192.168.1.50] ([81.196.40.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm101068505e9.3.2026.11.03.07.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 07:23:35 -0800 (PST)
Message-ID: <24567f1d-1ee8-4a1e-81dd-1225da9bcfd3@gmail.com>
Date: Tue, 3 Nov 2026 17:23:32 +0200
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
Subject: Re: [REGRESSION] rtw88_8822bu: RTL8822BU unstable/disconnects on USB3
 with newer kernels
To: Tor-Arne Forsmo <torarneforsmo@proton.me>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <1ZyN-kxUvoIDfNiCh2Ro6EooWLDGuN7Jwm8yKK8c1ZAeNrcmCia0aYwIDZs77lZtpppfBohrqEI6q4dwxAfcQRJa0JkjcQBO7mDZ7ACyAKM=@proton.me>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <1ZyN-kxUvoIDfNiCh2Ro6EooWLDGuN7Jwm8yKK8c1ZAeNrcmCia0aYwIDZs77lZtpppfBohrqEI6q4dwxAfcQRJa0JkjcQBO7mDZ7ACyAKM=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/11/2026 13:10, Tor-Arne Forsmo wrote:
> I've experienced new issues with a TP-Link Archer T4U. I've used this the past half a year without issues on a ubuntu server install, but recently I started experiencing disconnects on three different linux devices with two different Archer T4U (I bought a new one). The final fix was to revert back to a 6.18 kernel. I have never reported a bug before, I hope I'm writing to the correct e-mail addresses (I've gotten some help by AI). I've instructed ChatGPT to write a report of my findings, I hope this is helpful.
> 
> From ChatGPT:
> 
> 
> I believe I have encountered a regression affecting the rtw88_8822bu driver / RTL8822BU when operating over USB 3.0.
> 
> The problem is reproducible on a Raspberry Pi 4 with a TP-Link Archer T4U v3 (USB ID 2357:0115).
> 
> The important result is:
> 
>     6.12.62+rpt-rpi-v8  - GOOD
>     6.18.50+rpt-rpi-v8  - BAD
> 
> These are Raspberry Pi OS kernels rather than vanilla upstream kernels, so I have not established the exact upstream regression range.
> 
> Hardware:
> 
> -   Raspberry Pi 4
>     
> -   TP-Link Archer T4U v3
>     
> -   USB ID: 2357:0115
>     
> -   Realtek RTL8822BU
>     
> -   Driver: rtw88_8822bu / rtw88_usb
>     
> -   Raspberry Pi OS / Debian 13 (trixie)
>     
> -   Adapter connected directly to a USB 3.0 port
>     
> 
> With 6.18.50+rpt-rpi-v8, the adapter repeatedly disconnects and re-enumerates when used directly on USB 3.0. After reaching the SuperSpeed bus, it falls off USB again and this repeats approximately every few seconds.
> 
> I observed the device numbers continuously increasing as it re-enumerated. The pattern was essentially:
> 
>     rtw88_8822bu: Firmware version 30.20.0, H2C version 14
>     usb ...: USB disconnect
>     rtw88_8822bu: Firmware version 30.20.0, H2C version 14
>     usb ...: USB disconnect
>     ...
> 
> This continued for minutes.
> 
> There are also -EPROTO (-71) errors associated with the USB2 -> USB3 transition. I understand that a single -71 during this transition may be expected for this device/driver. The problem I am reporting is not that initial message itself, but the subsequent repeated disconnect/re-enumeration loop after the adapter has reached SuperSpeed.
> 
> The adapter works when limited to USB 2.0.
> 
> I then installed 6.12.62+rpt-rpi-v8 on exactly the same Raspberry Pi without otherwise changing the system.
> 
> With 6.12.62:
> 
>     $ uname -r
>     6.12.62+rpt-rpi-v8
>     
>     $ sudo modinfo rtw88_8822bu | grep -E 'filename|vermagic'
>     filename: /lib/modules/6.12.62+rpt-rpi-v8/kernel/drivers/net/wireless/realtek/rtw88/rtw88_8822bu.ko.xz
>     vermagic: 6.12.62+rpt-rpi-v8 SMP preempt mod_unload modversions aarch64
> 
> The same Archer T4U then enumerates successfully at SuperSpeed and remains there:
> 
>     $ lsusb
>     Bus 002 Device 005: ID 2357:0115 TP-Link Archer T4U ver.3
>     
>     $ lsusb -t
>     /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/4p, 5000M
>         |__ Port 001: Dev 005, If 0, Class=Vendor Specific Class, Driver=rtw_8822bu, 5000M
>         |__ Port 002: Dev 006, If 0, Class=Mass Storage, Driver=uas, 5000M
> 
> The JMicron USB 3.0 disk dock shown above is simultaneously attached and operating at 5000M.
> 
> I then connected the Wi-Fi network through the Archer rather than merely leaving the interface idle:
> 
>     $ nmcli device
>     DEVICE  TYPE  STATE         CONNECTION
>     wlan1   wifi  connected     netplan-wlan0-Rasktnedikanten
>     wlan0   wifi  disconnected  --
>     
>     $ ip addr show wlan1
>     wlan1: <BROADCAST,MULTICAST,UP,LOWER_UP> ...
>         link/ether d8:44:89:03:3e:29
>         inet 192.168.10.71/24 ...
> 
> The Pi is therefore actually carrying its network connection over the Archer at USB 3.0 speed under 6.12.62, rather than the adapter simply surviving enumeration.
> 
> So far I have seen no USB errors or disconnects with 6.12.62.
> 
> For comparison, under 6.18.50 the same adapter, Pi and direct USB 3.0 connection entered the disconnect/re-enumeration loop within seconds.
> 
> I also have two physical Archer T4U v3 adapters. Both exhibited the direct-USB3 problem on the Pi with 6.18.50, so the Raspberry Pi result does not appear to be specific to one defective dongle.
> 
> There are some additional observations from x86 systems which may or may not be related:
> 
> -   One older Archer T4U v3 has worked reliably for a long period on an x86 Debian machine in the past.
>     
> -   The same older adapter works on another current x86 Linux machine over USB 3.0.
>     
> -   On a different x86 Kubuntu machine with a newer kernel, the older adapter failed during/after USB3 enumeration with rtw88 errors including -71 and -110, register access failures, "failed to read hw feature report", "failed to setup chip efuse info", and a USB SuperSpeed reset.
>     
> -   A newer physical Archer T4U v3 works on that particular x86 machine.
>     
> 
> Because of these additional results, there may also be some host/device sensitivity involved. However, the Raspberry Pi test is the controlled comparison I consider significant: same Pi, same adapter, same USB3 port, with 6.12.62 working and 6.18.50 failing very quickly.
> 
> On the bad Raspberry Pi kernel, the relevant modules were:
> 
>     kernel: 6.18.50+rpt-rpi-v8
>     
>     rtw88_8822bu:
>     srcversion: 594B4CB53E28BF8F6458E02
>     vermagic: 6.18.50+rpt-rpi-v8 SMP preempt mod_unload modversions aarch64
>     
>     rtw88_usb:
>     srcversion: C08071F92A5EA09279ABA16
>     vermagic: 6.18.50+rpt-rpi-v8 SMP preempt mod_unload modversions aarch64
> 
> For reference, two Ubuntu x86 kernels I checked used:
> 
>     rtw88_8822bu srcversion: C04D1014EBE0F8F11E65854
>     rtw88_usb    srcversion: B5E531378AC65924BDEA496
> 
> I have not bisected the regression or tested intermediate kernels. The Raspberry Pi is now being used as a working system, so I would prefer not to repeatedly change its kernel unless further testing is particularly important.
> 
> I can provide the complete dmesg from the failing 6.18.50 test if useful. It contains the repeated disconnect/re-enumeration sequence.
> 
> Please let me know if there is any other diagnostic information I can collect from the currently working 6.12.62 system without changing its kernel.
> 
> 
> 
> Best regards, Tor-Arne Forsmo

You could keep the 6.12.62 kernel and bisect only rtw88. It's not
too difficult to compile it out of tree.
