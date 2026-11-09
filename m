Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239513;
	b=j4hC9wqCQhOxYnOegFTj+0pJTxYmTXxe+0C4qgrK0cwWyK7NNnTkDYJkHH5nJx7GREnU
	 Xdt2M9CElp2XgWlamznOojtSrHDaMXZg+Q19+UDb4rspdt/OY75YmiwGyP68AvbEcH+Ic
	 fo5zUXd/Y1K3SbsCw9t6U/KEfGH0r4u5a+YJ569pOSGEEOPhZ5r2V7l2sZ5yegmrA7mfU
	 foh/dgI581ZNkFEzo0/odky3jxFCrZKaFeKG63H1ZGevbQ2rZPoukyp4cF/v7hTreRbPC
	 xLrt3OZr/qaZSdX4JlbHBN06+H7rFq3rmId8m2Y9xhL0PEoDFfSkQC/WLTHUpXIRLtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Cc:References:
	 Content-Language:To:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=GqcUVOE8YZm1FPDzDze4+rCKgn8rK0xiBVztztTok30=;
	b=Vq1G5o5u0oMTZCEOrF+SIp/XHNeaPkp2x4dnW/CqMteaf+p50XpCpM14NuKl1/Pf+DtC
	 iJWVgCR2U88GJkaQTii5/nFGLB4OvoECgcJ1WUINN0B0A4twnEDM5wzBt3yPwJl+cuA6u
	 AQsQlMrzfRWvNodLz4R6dpiGvfDsNdi9xzlv1WF+v8vFB/7XWuUWHnKbiiqt3Z/7U7IYt
	 ePLMSVMoMlE/vt7JHs7d21k98ORYC8RK9eX1r+UcqEHx24+zT/7RnzV76vkQ4dhUjCVDi
	 dY0X1GKAEIOXoAjsglGuok37dt8MQl6Qeyr1jsFfg/G7PbUvJvdGaZBy0G2R/JqH8+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=I6Gf+TJ+;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2089606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2089606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=I6Gf+TJ+
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so674590f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794239511; x=1794844311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:to
         :content-language:references:cc:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GqcUVOE8YZm1FPDzDze4+rCKgn8rK0xiBVztztTok30=;
        b=I6Gf+TJ+xx28C6M6wGa7IriJIxP64CATq5xKa5KY4/dVEF70L68u8oNbC3qDhkhEI7
         7ia14iP5TbkPq0pUWtgTMNnR57unFzAtVelBZ6VlJdQ4CrgVYgxw4RobiXpnUn7hkB+D
         nzTyACD0+MFjBaqWPAWXlFUgKFrj/LJmZ6fQQvFA0wYX9Z+YdDx7xP/wSzXM8J7jhI3Y
         cnv1opUi8bNDC5CGiUC5RyhE5sufSwg94ps4g0+w/MIT3GHEM+nHtCTD6yBD+zcjVMzC
         KM6SnUFC/LBhWAJoh5/3RAr1pEMN+dTTDdPPEWzL92kIaF0QNP3pX9QYFDhi6xIlcLq5
         xWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239511; x=1794844311;
        h=content-transfer-encoding:content-type:in-reply-to:from:to
         :content-language:references:cc:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqcUVOE8YZm1FPDzDze4+rCKgn8rK0xiBVztztTok30=;
        b=MjjDbWymk3uiMvRnMRuFFOXO2efValzVuOE6A/eb1cwqynip9DqHqH89PgqsHAn2CD
         84nxjpH4mRfBquQNIaBabULqSYR7ueJ1HLGcn8Rbx0fmwKq8McprBcLhYGpDuIeAltaO
         aS80xCm2vqHe7rdKK4aNd4h7y1sK204c0RZy8F7xvU0Ajza7OtDqovUhMaByflForvzb
         BDwJIF7LmPz6VIA0OUm0F6bSNsxfnNEHi0pGNS0VWTbIgSa8jB7pW1OLpY/eTbMkgp9N
         8/abkvnapl8bQlUT/khETVOxclcXJJecM9uHPaMDlMPxD3AFqvb1qvTmRj5baiV/uwqL
         2yog==
X-Forwarded-Encrypted: i=1; AL+hErFmQgxGbpXd+QPECuyezRI9cw+oscGXGXPT8wwdchynEAhOvFi8/UQUPIcPPOtwmQ/asJhcfFeT1Xe8MlE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EHS1O/+PJ/RzG8xJ0y9SpPNkvminEDMWCq3vfZx9jYPN+KhNk
	Wvum5YggcQksh7Gp8e1ElYqn38vi/kdGepZvPOiFwFiaA0LzsNbeAKygYZ/qylfDK+U=
X-Gm-Gg: AYBFou1c3tykcJLq2JRTWsi29duf+1yrjd9dODhz7Kiajl04NWpb+pJ0tOj3caS6sER
	nbLTPqKUriXDahKyqzqEvFJl8rhQhC5IdbR6Pszpe4BNfP4e4X3qJ7nRAyU6Ir9eoFF6HQca0PF
	s9qxYEGKw8lNo2gGLqdOSaE+EhTCIeOzSUobAfMy48s/acXvJSE1b13M3hLRK2KtzTdDS2wY6/A
	Ex4mh04ebYtCBAOX/JPKw3Y7l56CyC3dpL/tHXgrgS+u7f+8ukX8cKLN7jNuXPHtEBaVUL/kAl6
	MwJJy3sZdxlCitC9mdlToYEBxCGy0rAxLnqTP7ZNYJkyMr3unZreECCdl1tgWPq+XF2AwqVFjNt
	KUtnY3htHobvDbqTC/4n/+osna3qvD+7fOMRmgQkL2LW3GaGJUPEjUAX9XCvOuJMWosE/qJHvK5
	4TbIonbdsgAI8GMlzDNXl7Bd4ITAxjObWUW18vVyTcD4Jwod7IRO9SWFm1CqvVzkLhpbGl/lRQ3
	ZuQ8hunaL1x+h2PgVozlHJbalX6i7/A9RemCIzQD7g8H6tTu6gu387xduJ4pec9GWN642JbXeSV
	UBXhbO6xoPriHF0hp1HYbxvvNpe8y+1hfOuXawIZlQgeLsb+j6/sgJI8Dzt438ln
X-Received: by 2002:a05:6000:25f5:b0:492:e1a6:90eb with SMTP id ffacd0b85a97d-49582e8e516mr8245452f8f.10.1794239511204;
        Mon, 09 Nov 2026 07:51:51 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597186eb9sm10435718f8f.35.2026.11.09.07.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:51:50 -0800 (PST)
Message-ID: <a190f981-d668-4208-8148-f4e50adb31a6@suse.com>
Date: Mon, 9 Nov 2026 16:51:48 +0100
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
Subject: Re: [PATCH v2 0/3] Remove obsolete __MODULE_STRING()
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Ian Abbott <abbotti@mev.co.uk>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rudolf Marek <r.marek@assembler.cz>, Andi Shyti <andi.shyti@kernel.org>,
 Chris Snook <chris.snook@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Duncan Sands <duncan.sands@free.fr>,
 Chas Williams <3chas3@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-watchdog@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261002-module-string-v2-0-fc7438acaf4d@suse.com>
 <2e88806e-57dd-47e0-a9ef-a8507d22aa3e@suse.com>
Content-Language: en-US
To: Petr Pavlu <petr.pavlu@suse.com>
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <2e88806e-57dd-47e0-a9ef-a8507d22aa3e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/26 11:36 AM, Petr Pavlu wrote:
> On 10/2/26 10:31 AM, Petr Pavlu wrote:
>> __MODULE_STRING() has been an alias for __stringify() since "[PATCH]
>> MODULE_PARM support for older modules" [1] in 2002-12. That change also
>> moved it to the graveyard section at the end of linux/module.h
>>
>> Replace the remaining uses of __MODULE_STRING() with __stringify() and
>> remove the macro.
>>
>> Apologies for the wide distribution. Acked-bys are appreciated.
>>
>> [1] https://git.kernel.org/tglx/history/c/136839a1b4
> 
> I've queued the second patch ("drivers: Replace __MODULE_STRING() with
> __stringify()") on modules-next for v7.4-rc1. Thanks for the Acked-byes
> and reviews.
> 
> The first patch ("hwmon: Replace __MODULE_STRING() with __stringify()")
> should go through the hwmon tree. Once these changes are in mainline,
> I plan to pick up the final patch ("module: Remove obsolete
> __MODULE_STRING()").

v7.4-rc1 no longer contains any __MODULE_STRING() calls, so I've queued
the final removal in patch 3 on modules-next for 7.5-rc1.

-- Petr
