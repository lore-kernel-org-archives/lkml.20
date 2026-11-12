Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496941;
	b=Y05ifL4uHrqrr66eKguHWuwrjbB/ZcvDpD0anWUEuhwwi3GbUvcdnM0Qei7afdUeyi3E
	 48bKFphjusAJNdwSktZUAgDEbdsTBr2WjEjoXDhB6857kFF5agzoZzN15qgaATN4jhpy5
	 pnQSv5pgYtt0ct/7fDvQ16BDQPGexxLMyk9iXs75KTM25+XakxQwvD77ufMJKvuxagAXg
	 ZXCqQFjO8FS0DgnbZZ9SgEnvtNV4K4ErnRIpO9JEqsF41+DLHpNFx14I1hGsjWu1sDPIP
	 NE6sNigGuDYWc7cssIXFSAMzJwb1Botz7lqvFWorEYyhxkbbkxGycJGW6t06jPFvbBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=E8QRxqca6MPKKmYjqBq9RkAfrZBWcYxQ/ymz9RyAO8Y=;
	b=koPkel9z4vC6aRSfrYXB3MqPap3CFTaVIm519jkESnvxuhkGw9GPZIPzHS+X0Iky768T
	 khO3iv4t4P3V/0yLVIQO++6+4xbiKVw0Zj9ebqPgMbttMVAvcdkCZ0LqWO3wcoBIY5/Ne
	 pULLZeBHwN3QmhXRD75Zv04Vl6vUD8J/jEq1ybUih3LSx4NDC1QNpubo0k2cNlmwUXwdZ
	 XSFvBqJnfSFiOFUqBwKf7prmAiCAKTBpzHYWIFMfpnMwrhOOspQskWFXKB1X9GJR1DMA4
	 oxCWsSN84mLrV0k7Nsdn1IXhi6nrr1CUhz6P+SLddsU9DSYXIb/bUvYIWVEOX/C0Jzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFNCS1RQ;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7767360A5BDE
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7767360A5BDE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFNCS1RQ
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so2971288f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794496940; x=1795101740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E8QRxqca6MPKKmYjqBq9RkAfrZBWcYxQ/ymz9RyAO8Y=;
        b=CFNCS1RQhtbSxMwdv4RT7HaDOzw5D755nrRVwkL4k/OwRxOF9nDaPmGgbE6aBTSXWH
         msk1dQ3pVIxMk4yUT4CG9M7TNrpwaoIvNpJ3/pm/e0iSCd4XEBJKI8p9xJEwtSIfutCC
         stsi/5l34qljqB3RcnE4mIfJDNGptsv048CrwnBwOr0aEQYAk0b59wCbdRvQ6o8OL+fb
         cvAtr7bg4Ikai7/soQQ6V0PODVJ4pPFSeLLwUnbQMGtni8xKfY3UKMvp3w+fEstsPVjc
         i5FAdugW53dj2trdg9Fn6RkfhC18gt5RpmdSGsBIKL2h48wr0gH7pQH+a3qJOwITfh9h
         SU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794496940; x=1795101740;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8QRxqca6MPKKmYjqBq9RkAfrZBWcYxQ/ymz9RyAO8Y=;
        b=DDsJY5qWUohXHKlSxw5dSjU1lON1Q2kpVaJtFInnvF1jJPu5Sd4XW5STwZh1bNFule
         NeS6efFGZy9cmpYJnccsE17ElaowWyMk3otOqrx31atJniIfTByecUYWq7wE+c7tT0qd
         g8k9jIyCNvxuJFSL7dFAwHPkat+fQTZKJZhOlUJ1YI9SiQ9fT2d8DOljPLfc4TKlQZcX
         JL/xyBdC8VxG8O243Zv/ROEsfJOP/KrwAdZWJl388L5ZRI3EJMKB7PhLh5KvFPYtKEhW
         UOBD/MKW37RruWtrgPrtlNOZFI3Uqis9P5qX8KMuU3EeSU/hiTb7cb2ywh9e67YUEyUV
         W9JQ==
X-Forwarded-Encrypted: i=1; AL+hErEJXQXd9qtNkBtd2q+PKQaXGQfQfVEqTqxYP0ytOvQf+GgwVAWVwUINi5b5O0l9ECvfObfGBm3u98sg6MU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/z7jvKAxUZ36f/oERmKsSxrMvMl7/GkZnF4TIaFMB0do3gI0j2
	SF7/mkyr2IQwLMPzNz4U+p+eCWWlFaylty9qah5M4dKMk3KeoyXS49yN
X-Gm-Gg: AYBFou3E9/rvJ0IpgrJskYSfLYmeVVlFp9mVALZUkCKX5Jagz0j/Zn+SV8T04QfZVBY
	kZ67yH1+/rph2UrvZ346xo7IjX+c2MK9w/jPo/kcwM0E1indhfDv3Hg0L61Gfc2k1CDnsqpBnwp
	yMz1d2Xw7nKMdgfFzGnQ9A7zA/0tHPpTCSyUOH1m6de+sANS3ShDNcrcJ/Biu+6lizLnPYhxTDp
	+an7suYUIuEJYreF2/2q7Cn2WqArEu9V400BC6C6F6su+ZCL4AzkIhcYkwWQqhV/hpx1WuCkqEf
	qNJiwLw/3VURgA+C1waw/ltsoSrSrZzbh5+gTKchywpHyf71dgA1Y1s5FSsYiA6UO4RB/BuKmHP
	NC4bQHVW8JXFWGSMFv870wuF1ZQxrdgT+lxRhLGmTB2wobYUL4XGxpDmUtTZR/LWQNP9wPGZglw
	XnkwTYQcftX/ZWF8IxCa3pztg8vnJw+2f5VKavQApAWK1pFtF5STg8aZYLT1UTfWkvIknpKcpRc
	8kwGpG9Y9ag/7W2aFJwwnIZWyoAeSL+XozMafpZGEa3631dqAe/ZEkVDNZG1dxKLtPj8hjMgkAF
	i3UDAtCAlNWZ0g3dJ2RVC77IzvlXg5RsOMB+CE1qoFA5XAPf76pHugM=
X-Received: by 2002:a05:600c:1c0d:b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4ba093a3cf9mr132094285e9.28.1794496939343;
        Thu, 12 Nov 2026 07:22:19 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm84746205e9.2.2026.11.12.07.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:22:18 -0800 (PST)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	Francesco Valla <francesco@valla.it>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Helge Deller <deller@gmx.de>,
	Peter Jones <pjones@redhat.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/15] Add splash DRM client
Date: Thu, 12 Nov 2026 16:22:09 +0100
Message-Id: <20261112152209.3297409-1-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <066197a1-aa2b-455b-84d8-4e2215fad764@suse.de>
References: <20261027135342.2003632-1-maximpedraza@gmail.com> <066197a1-aa2b-455b-84d8-4e2215fad764@suse.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Thomas, Javier, Francesco,

Thanks a lot for the reviews. I'm answering everything here in one go.

On 11/11/26 14:52, Thomas Zimmermann wrote:
> So shall we merge patches 1 to 6 and 8 first? You'd have something in
> upstream already and not chase a moving target. From there, we can merge
> the other features in the coming weeks.

Yes, that sounds great. v7 is ready and holds just those: patches 1 to 4,
6 and 8 of v6, with the MAINTAINERS entry squashed into the patch that
adds drm_splash.c, so six patches in all. The DT binding, the placement
and rotation, and the connector orientation will follow as a separate
series once this one is in.

What changes in v7 from your comments:

- the Assisted-by tags are gone from every patch (Javier)
- MAINTAINERS: I'm listed as M: and Francesco as R: (thanks, Francesco),
  in the same patch as drm_splash.c
- the firmware source is now DRM_SPLASH_SRC_FW, and the Kconfig options
  DRM_CLIENT_SPLASH_SRC_FW and DRM_CLIENT_SPLASH_FW_NAME; the BMP decoder
  keeps its name, since the BGRT goes through it too
- the drm_splash_fw_load() stub returns 0

On the CONFIG_X86 around the BGRT check in patch 4: it comes from efifb,
where efifb_bgrt_sanity_check() is x86 only too, and its comment says
that all x86 firmwares centre the image horizontally. I haven't found
that promised for other architectures, and there the check could reject
a logo that is fine, so I'd rather keep it as efifb does. If you prefer
it on every architecture, or gone, I'll change it.

The issue Sashiko found on v6 (a restore deferred while the device was
suspended) is fixed in v7, together with a few more that a later Sashiko
run found; the changelog of patch 4 lists them.

About your Reviewed-by on patch 4: since v6 the work has changed quite a
bit. Restore now leaves the commit to the work, a hotplug while userspace
holds the display waits for the next restore as fbdev does, and
unregister waits for the work before it looks for a pending firmware
request. Shall I keep your tag, or drop it so you can look at the new
version first? Whichever you prefer.

I'll send v7 shortly.

Best regards,
Màxim
