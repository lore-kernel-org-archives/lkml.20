Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636DD47F785
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253673; cv=none; b=AR2Xcxvw/J/ZP55MjD20uU1jjXJQG1OkXB/cY5GhQE338PMF9uoyJ41dpfnGCtzdzsUfGIEHOb3uyKMZBNetGXZxeBJPZs8b+FYlOuTSA2Uv2ydv08UuWO17o5Vut1nbSii/GPdMpG2EOD3C50ZpPCJLCVir6ib0NLvS9DD6Rms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253673; c=relaxed/simple;
	bh=0lQB1A6p8+X7aK18vQ2T7xJjipK5Cs4nvBNiXn5k5hE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lNk7UoJASpkTGNzq9D5+g7AIQw9J+e/3iXyHa06dDY49YZxbbaMjkFwXJN1CdnlEnPnapG2HMnmYd1OPT+BYF1ow612/SW7mBItUqUQNGvmaz8ydJCFZ1N6iqPnwrm1s3yYsdbIuufA/nMY6+j+mmoEwMfFLJG+JQc0Ob+RJIvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ef6uSAnN; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ef6uSAnN"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so11432395e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790253666; x=1790858466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m+K9xI1+b45+Hx50rEe06X/tskVciHAk+ndafWRnnYs=;
        b=Ef6uSAnN1G23WQfE+lhtOb0XuJdoDKeMU3FC4unVrPCFnGpUELO7+iSnm87cFobZEQ
         vrBJuhed/4G4BJuc07lAVQLzhND4cDXfxmJ9OU8PgNfKh7FULDp1JbDsOaSp2PEfxekW
         0n/0dG99ZwPfrKjiFWq1jBtiVv0ApgmuqnanaA1w33mEGa12NqylqyR3Bxd9e5k15z4y
         I9d+7CkuxmHcBF5hKJxwkmA30kNUNAalh9XMzPjiUF7t6bctA+NcRiD4d/IrdARpih+J
         p/3cc3zmUsx/QQ+nJPxD4TsIr2kuOXEIr+ExHUkWm95kROgz/Jn20n0tZN+j3DRwxHNx
         jfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790253666; x=1790858466;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+K9xI1+b45+Hx50rEe06X/tskVciHAk+ndafWRnnYs=;
        b=NZzb5g9Rdr561AWKdT6YnzT7oSHcFf2TJnxAo6yQ56dcn/dLlLuQi8BRaJrprxU5UO
         eya4wMoS5eo7rQrZBwBda+Uxw/T4KOM0jvKLW+oG/bW+HB8YKgoBq5uOQmKbzSO7nsMI
         elCAoCGApIMX3WgsYkvjD677YgOtWYpzBKmfH6pw1qGVW7ulzHpRA+PkxXKLou3Z5pU9
         tsgAtgjXFiQCVD6TdChqT/GDo7Ai6dcjXvfFIFIUkCnUroVxjyCuwk68PkbFmCuPI1kH
         9yCEyaU/z9sVIGsPbQiy7x457ODqG+hYE7noAWwlQMDvweSc24JjhyrbNBk4OTARcq9v
         pBvQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8y25Ba47AXrH9bDJLXh1mrariViCvsQefx3fQymMF5KR8EWTeo3NG5VUhm0T0y9h7dWLNntid4cQ2Abc=@vger.kernel.org
X-Gm-Message-State: AFuF++mC8wm2k8dqsy6ttKE13GxSCOow92oLBx9BxbRillmBul1bA4qA
	DzN2Pu9OFvoDuSnGSl3BxBRVtX4L7pRCKwaPRC0/TKACm3pjCNV7Hh5rcWx2KI7u2gI=
X-Gm-Gg: AYBFou1KsHOVDfBZfLdSyxjfwz80U11oVFKMytBEfVZOLlIztJ7UWvE0bor3Zw6bxpg
	VNTqSBcJRYZ39Okfe+xOdyRwYC6lCwxryZTt9PAEoJxGuWC26ARndrkOwOZaspJ/JYYo/5XK9GZ
	RJC1+pxLL7KsvZubhHmep+ZuK67hKAeLguTgknDWG8LSd2k2/B0jRPYbMHEQQxkRZ0+APhRS1av
	hCPuTD6O/w5klkdh6FVS54srgmaMncTCYEDcfv4KInBaKHfffRgBPhqaAljN8jdPC9h90HNFkZx
	cI1/wuAajB8PLabsWOEm+G2AQhgkeN8wPkBqc15iLlliO57SsDfI04uGGqSXzpcjjlEhmmEfvGh
	iFCuRHosZtVv3iLS7SRbg0Jtpbti7iMm+5XosBs6a5uxcR0MJxcQxLjEPp1YPPwJJQGZGOQ47uQ
	49520j+00t+ChTueGxsDUjwAZz3kj07crWtXfnZiBp28eCM/YI+OBow/9Mcvr/H24zieRatNT5N
	HPHf5nOowUViZKJAZkWk1JjJhToWYsLSXM=
X-Received: by 2002:a05:600d:8642:20b0:49f:e8bf:c38 with SMTP id 5b1f17b1804b1-49fe8bf0d97mr19384015e9.34.1790253665749;
        Thu, 24 Sep 2026 05:41:05 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cbd77bsm78152645e9.8.2026.09.24.05.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 05:41:05 -0700 (PDT)
Message-ID: <f3b91a89-2733-4159-98b4-129e3127e7e4@suse.com>
Date: Thu, 24 Sep 2026 14:41:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drivers: Replace __MODULE_STRING() with __stringify()
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Ian Abbott
 <abbotti@mev.co.uk>, H Hartley Sweeten <hsweeten@visionengravers.com>,
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
 Aaron Tomlin <atomlin@atomlin.com>, linux-watchdog@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260922-module-string-v1-0-c18766690185@suse.com>
 <20260922-module-string-v1-2-c18766690185@suse.com>
 <cc03390d-8fc7-422a-bbcf-93bfbb82276f@roeck-us.net>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <cc03390d-8fc7-422a-bbcf-93bfbb82276f@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/26 7:21 PM, Guenter Roeck wrote:
> On Tue, Sep 22, 2026 at 03:32:22PM +0200, Petr Pavlu wrote:
>> __MODULE_STRING() has been an alias for __stringify() since "[PATCH]
>> MODULE_PARM support for older modules" [1] in 2002-12. That change also
>> moved it to the graveyard section at the end of linux/module.h
>>
>> Replace the remaining uses of __MODULE_STRING() with __stringify() in
>> preparation for its removal.
>>
>> Link: https://git.kernel.org/tglx/history/c/136839a1b4 [1]
>> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
>> ---
>>  drivers/comedi/comedi_fops.c                          |  5 +++--
>>  drivers/gpu/drm/drm_fb_helper.c                       |  3 ++-
>>  drivers/hwmon/fschmd.c                                |  3 ++-
>>  drivers/hwmon/nct7904.c                               |  5 +++--
>>  drivers/hwmon/sch56xx-common.c                        |  3 ++-
>>  drivers/hwmon/w83793.c                                |  5 +++--
> 
> I don't know how other subsystem maintainers want to handle it,
> but please send the hwmon patches separately; I'll want to apply
> it through the hwmon tree to avoid the potential of merge conflicts.

Sure, I'll do it in v2.

If other maintainers would also like changes affecting their drivers to
be split into separate patches, please let me know.

-- 
Thanks,
Petr
