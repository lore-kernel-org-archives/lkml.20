Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536626;
	b=u6GI/dBw9mJ7FhHWMRyOUAWOfHEzwYIb52oRtP/qZ+SdpobtQjuyKlhZ8bbRjtYwxHFX
	 YmdnwbeaqQSTO0iALkBKqKOLCjSu9XUf9SWC33Sz/xQjuw6xbdaSCmgFVz6+pOZhk6zc0
	 92VAMu7qwT1GJ4IyqphMI1GVcDOm1PiWz2u5t9rLYnU1NBBFYeLqmGaLV7cTeXzVZ7AWL
	 GlzhLdP36w8djKRiJgLOgSSYXgrww0hJ5wPvXWL9kiXJSdWHGlazfm+hefmAdaLS0astY
	 DPH5Zqom4NimRKASYEVuLrf0NtLhEvnWPxOJ2R1tY58PKn2llg0LTg7A4TVIddS7vrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RGix8b+4rEGPx1vlWyRM//jxrhYNPw7VId0i+fn4vP0=;
	b=wIPSEjCRWefvNIRGoGxJ5+BNoPRIiunTEpt1OVAf2QVr8W//iFndkbbcee4RFvMsfj72
	 iKCQoRyJVAS0VSaPx/T7AX2f/nWBdxJKm2I4QyHUJoBy5eqeq2aE8e0ZofUM0Uc3shu0l
	 ugJkoT31L5XhjlCW0NjaIHgsTmNmfWjCjIS4/oh2YkUfa3wplS6xvX9Lx7rNZB01Vca8k
	 3O6UENvh4AlvmMIJGqpXu5rlZxfJgDHAReaMfNRdrKPHTXI1pgrwbOgvL132spBsn1d/D
	 SAOogSl6fP5ZB+4BCCbKbWeIMhX4roXuK4rkKEzZXlrbSyoYWFFLMsApSmLAWZfL/3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XSWdVIml;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744CB60A3813
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 744CB60A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XSWdVIml
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so703635e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536620; x=1793141420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RGix8b+4rEGPx1vlWyRM//jxrhYNPw7VId0i+fn4vP0=;
        b=XSWdVImlnN+o8KKG+n8FdqZKnJyuYzxymErOsSI8I+mbWj1WKZ6nzidsmjFU9HSrR+
         vqgDumIJaVanwgvDvCQZpDc1+Q+1Yu/ZQdO1TGAiSn7zcJ/EIXO9TapoqBvCQUeYh55v
         WMTSIU2/6hQWr/tKz6eoFUaAalDBOhpk+YSsWqwpACa/+ZoegBs50VCzkKidvsFNvIFA
         8b8xC9l3L0kISRpEfSfybZGw+SDyya9x5tRhhllwkNu3mXQxPtTTTCyYvUWq8HNKxR4k
         1BIjXTFJWfVyxgol7fAchZytRgSIxAlcYIjRkPsePysYOFssUU9c1tnMeQqsBVaXZh7F
         zevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536620; x=1793141420;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGix8b+4rEGPx1vlWyRM//jxrhYNPw7VId0i+fn4vP0=;
        b=AqMnaYqEw0Qcvskrknj73FVDf8cLBpK/FBZ+7Aml4kpo988Xe4MGhQukyron5ApH+W
         LqeTDSNiKLQe1gTNOPyaFze/dQyPyIsgF2ryfCvE0EGu2cztW+UYE10QXUXU8EXLmldm
         ouIxCFjIN77rmIfmo7BGzhRc45Iiz4cnKkBeyWh2Pob+XEWbsI/swUW7Z89wWE6NMpEo
         KfHSO5jec68IUnFjBVTMzdgWfWQtxAdq3YRKFxLKEcOYMsPza59a15G+x6bAZ650JkUc
         +6YAVYfIvc5zyjbO9CXDJcgOmAHNELiN7uJgIIZlNKNTM2BPxZbtR+bcPSDxVsyRHX/g
         wcnw==
X-Forwarded-Encrypted: i=1; AKwUvBy8b+izhClf8mcvss0549R7bJGhYn5JNwPH16ZlIS+L532yoAV5vjcykdumrbYRFQT/jABuDQOhjMhL27w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvhEey/iCTo801bEQbK1bnQVeieuPJXvmttP7thXhDiJfmi5Et
	qLu+Cge7BKEzwKNNF5T78q/oRJuXHqmTAUjcSnIbjUrimz2nU0JmG76p
X-Gm-Gg: AYBFou3kts27lQ4wOV8HBqXSlTU4UvkQng9j9eR17ClOdPBa8IkqyDzfwNmZdKVupQl
	8rMkxjC/slEVr3b+k1HwvTeRFshc7gRbu+OAJoBDoicI5S6UIKV77lGWHGmmYgJ7gF7KfE/meAM
	+2JWZTFgLYo1QgiAfjMYR4/++5ZnBlMHtYoCf2+RFsmiPfJZsc5vSnE7EwPYu4faGpKME1/lmH5
	rjA3HTBdZS01u3tTtrFTOT+4iIW25mu4raLHvYUMpBDDkM7bCGOJVsHEHTZ5x8nfwctTGyFSL78
	qO5aiv/qFEAi8ST2LOgo8dgM8QY2Swk46ck8RuA633Bpl72dAtYTdPbxHjSQIkuns2FiccfowPW
	oNpQ/tMEWVlTlUpBjQ6mDt/h1UF+WmfSxGSR+aYBpMHymFYG09l1pIkXQyHkB5rLgX/CSugp1SR
	5zF8HJ5t76J7MuEQ9OmcaDw0oQKLqBk9jAgW7H/Y6tUrhZY6hz4hItDqk6UfXYSg+4uYxa5x7XI
	/PXWEpvWiUqDuXSqav3ezhUZA==
X-Received: by 2002:a05:600c:3b01:b0:4a1:7c7d:8881 with SMTP id 5b1f17b1804b1-4a1fdb04f88mr2783945e9.13.1792536619814;
        Tue, 20 Oct 2026 15:50:19 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:19 -0700 (PDT)
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
Subject: Re: [PATCH v5 10/13] drm/client: splash: take the background colour from the image source
Date: Wed, 21 Oct 2026 02:50:05 +0200
Message-Id: <20261021005006.2341200-6-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <ad6a04b7-cf57-4b22-9c22-85a61af29f1f@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-11-maximpedraza@gmail.com> <ad6a04b7-cf57-4b22-9c22-85a61af29f1f@suse.de>
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

Am 20.10.26 um 13:19 schrieb Thomas Zimmermann:
> Please see my earlier comment in module parameters.

I answered on patch 3: I would like to keep splash_color as an override
for one boot, for a bootloader that wants to show a boot state, with
the default from Kconfig or the device tree. If you still prefer none,
v6 takes the colour from the node or from Kconfig only.

Best regards,
Màxim
