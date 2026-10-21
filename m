Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536612;
	b=Vv/X0L5BSG1v7UeJR3FmlIwAsemk+A41mUHVzSbTnrH4qFCykeRJAo44pD8KPymR7kR2
	 fdAng8tJWZD5w37a0CDEaDKTHL0DnDXTL7XuCjLUuO85grkHiUyOhoM3g1XXOV8ylnJ6D
	 8mvPZo47Oi/P7goRMREj0fnr/QLNC1Ds4MNTp0skLwL0q8I3tUXDBmUpGzvFN4QD6LQCS
	 1fUzfri1pIsB/enV4yR5PSGA6uFbSXa+GgkKR9xsSNUVZYFZof1xl6UEpu6vmrL3yM1Pr
	 KFCKIO3bl7MmEooOyOK4oOipq3jIQneAwDxe9V0TG8JL/A/4uhJeH7b//thpvEV7ORg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=fTuhXEhm4uQNNaPcVdFpwpAupMps3PVyoq78rLHpKEo=;
	b=a42q/KMZTcJvfguNis2qLM91GNowLZ3dTpJFbFXaYDLaQQxOsjBIQgMGHoreS1LiQIe2
	 gJ1QF90v2kwZs21Ij1gTUg1Ptjomu3EU9jUDe6ZrzwqwD/sXp60dUJVLchNmQ9L4pWZLK
	 wOUWkmdGTFEecSsgfo0k701KGlqA1j1tx9F++v/2eJcr4BqMja5qZ657QKhExc8Scy751
	 tnj8yW9mucNsGNvQATuUcjYBdb0WARz2sqKNo4SxUSTwIybI2R6N843XsNmZjCiYndI22
	 jdSWXTlWCB8AwNJkC36pXbYsobXzFa0AIp5HLkS5u3ksdZGXDvQ14/hPkG+Jekfx9TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oMGtStFf;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF0E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CF0E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oMGtStFf
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so715565e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536610; x=1793141410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fTuhXEhm4uQNNaPcVdFpwpAupMps3PVyoq78rLHpKEo=;
        b=oMGtStFfhGsL+mBjIIOXSVYiVGOUixhfa02bRsi991TkgCyk0GIcCTt75OwAWONrt3
         XyxUVpHQ6hS5K1bIte6yGRRfPJrwKq/BdNHY4/MKwW98pomtO8eR32TcUmg5eRs3vT0j
         4vfj4Qati0/E+qbSKz2TDX3+AUdBzroKUb9HFKxqMw8GIyTxIZfMV18nnUmzSg5hXoWw
         By4JWTOxBRV/qp54N78Use+YIBtMTyBYI2FcGlVPxD5AjWw10AE1hZ7OeZPBF9JSBynK
         LIMboApvT8TOGuMsl/r9aUKdQNAAF7XKW/RY7q74qIswfthHsRlqDyb2ZzjsqPp/ZYRr
         s8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536610; x=1793141410;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fTuhXEhm4uQNNaPcVdFpwpAupMps3PVyoq78rLHpKEo=;
        b=RYeEjwSM4+jDrhwSZQ2h/FQvup8kW5Misz7KcKoc1LgbgneRbXQ2toEmgxR9TZuy9D
         tu+8tywQm+9DxArkGnXibO4pmYRrsW9Eh86lOE5/eb+xBU32QTsXJcyiOhFINN8OszK/
         /wdZOi/r2OQziUQScTxRJM2pnkf6+8iTx3ZuVDT564WMOwlj45XhhyhB6sge6mQqINWo
         yq31wmIcJkLSTWq3XGQMVE6aPGmkkDPdKULV/8sqngccPVPsb2cIvFWC0NUxM6O8x4zS
         ZUTg/l1oah6BMgLsxo8XgkpscKdHO6rHs/7NNFEzixHuE6nk+TpoSOQNRx+YG6YS2wfs
         GnfA==
X-Forwarded-Encrypted: i=1; AKwUvBx0C+oxWIdyPJeqxGJMN3Ns3p9ZhcKSAJM7GfcV/nnV7y/LEW6EivH5s7q1kNC9W03FFzeDElNr28JELXk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSm+aI+4G3F+XAUyJ4bNBHbuK0ztpBMhpU14p6zmVpGY5yCj8l
	wVdaERA8LBp3/bd+XFDNWvVXnFg9a76LMLGwuaeAfxtIk7fNXfivImEj
X-Gm-Gg: AYBFou18EhhBIKafhP1szcJLVbVSRwgPPYYiPKUhokbdQeNkFCpGd7jf6wv7w8rf3sN
	M7JCe6AtG0uxyXeJFvnbhXo24JQEXM0dcntnAl/qQJ5pg53tpuQOuDNh7u2OvjoyNMMrPvrWq3i
	kn2DfXrTJjFqpnSj5/kq0/AiNgeU84AQxwBrSGve5PwYsDNohDO/FFv3OHrWXwau8L5lR3p/4KE
	iN72Ndbk70nNHrNTpKjnNoUlDOcSu7SBZ6ADmXBg+ED4giQw350cx1B9FwbZqUxMj2MO907lj/e
	bVLPy1FUq17P2pWznEDqlLySYfEsBqN4TCb3+cNT+nw69SV0bNDpzlPgqSQLAzahR2xxbFn9bIR
	NpunFldKipnTAk9tnSD3322p90PIAB8dzQg4mbGK317zlsKSSQrUY98Dy9mlrUVCxSOfoAIsHCe
	IbGZqyosV8IzZnqbPsXvTch5oz6Rv2P0xEEyRAEwLV4D9BDEkqY+wWY4Ec+9fSSeuaHGWnBHAS5
	T4fMH8RoOkLIQabtyzfNrwx
X-Received: by 2002:a05:600d:82c1:b0:4a1:811c:8069 with SMTP id 5b1f17b1804b1-4a1fdd20c2amr2908965e9.8.1792536609700;
        Tue, 20 Oct 2026 15:50:09 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:09 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 02/13] efi: bgrt: add accessors for the boot graphics
Date: Wed, 21 Oct 2026 02:50:00 +0200
Message-Id: <20261021005006.2341200-1-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <1d3aecdb-2537-4f08-a4d2-22c81ebaca03@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-3-maximpedraza@gmail.com> <1d3aecdb-2537-4f08-a4d2-22c81ebaca03@suse.de>
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

Hi Thomas,

Am 20.10.26 um 11:13 schrieb Thomas Zimmermann:
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks! One change since v5, so you know before I carry the tag:
efi_bgrt_has_image() now also checks that the image address, a u64 in
the table, fits in phys_addr_t. On 32-bit kernels without PAE an image
above 4 GiB would otherwise be reported as there, and
efi_bgrt_image_address() would return the truncated address. I'll keep
your Reviewed-by unless you object.

Best regards,
Màxim
