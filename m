Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536615;
	b=FBuKPvqZcFRPvltXWwi8ayhvreLFaZT4YdeqUUaJ+c4p7c6pJ8HTt+PhF1ieggueDfR0
	 OhlGJAGgaGEw3YUu0QN6v9pqYhEY3aMyeaoAVHa9mRj1O3arVV/f2y5J+WUVyCXtsO2im
	 ZeUrHr37CGI8QGQzZ6ISlTc5qU0Cnup/i6nmHY3AGn84vBb/hm7uLo0uTPq3vZXr1KFUt
	 xFYghlPHC/eebaPac1ADvTVQHCx+kgdD1aMiR5YQdq7g2cSOGZWqFkJ/FtgrcqKvMsScB
	 RDkBHW83ExMyS8a5xPafsc82WEqou0lRacSbzUsimKHeqFtkXueDuwH8F5Kwxjq4+vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f0vC8nTatz/VfjL47eh+tNgjT4mJh4syjFrv8ctbkr8=;
	b=0hSyvqQ57c0BhCuPFs+xSumF/5e4XJg0MHUgbAN9SuGokbxdwWUwA78jzuOeGIwFCnX7
	 gjpyQF5i7RYo22zYLodFF7wLSydOt/4da4XMYuXEqiEzsvrHEK3xbDes6jWjpXtF3xT0e
	 y8zjMxiNqkZj48Jc3BvuSDb+88ngw/865IAUPRCeAfIcY4OkFwAY067cQo3b1ZEC2aA1O
	 k8QkqNp8Hy8GOZSA8YTKwHJc+VZVLgrtQMZj7Ohbc4J1DgjcCX0RTi8C4HFx/lKiAsS/m
	 dL6PB7REtQVngCxA8S8bixMsLUiJGhdb1NM5cXc0vwhW3s/AA02/dlH6ojSLeJUbDrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED67606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ED67606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so658945e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536614; x=1793141414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f0vC8nTatz/VfjL47eh+tNgjT4mJh4syjFrv8ctbkr8=;
        b=ngk54pFOLWmfm72DmBQbR5ZFvu/68E0HsE/I5p7qjLhDU68EtREzXUUkOe1KdJtoJF
         CO8uj2ApOXtd4ggTGsgelwDkrse81BoWG6/B8j7zHrKz29Y2YVJtiMU8XsQ1V0rAN5ED
         74xyNd7xAR5wHmIF/hEm+j2q+/US/PxSOYg26nizg/eq0n0Qf+hcc88A4bVej//jOAhU
         JIN+3z8//MTou4wGoqrqTvmO519jPRA4rOt6hJlK3RntWR9pJpMGmWggWPbEV0Prwgh9
         KdomzFgOtRvIUay295YGeWpwSdA91x8jdDi30+Wild3BZCh6AF/DiaeZ2Opb6ZO5IZd4
         mehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536614; x=1793141414;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f0vC8nTatz/VfjL47eh+tNgjT4mJh4syjFrv8ctbkr8=;
        b=F7hZdCy8wUtImHopWygHSEcazegfy4EjkKCBsBxBEglPw67f9+6yuHWPOJTGk6Llfr
         UqJy6GFhVG53aJGi7ZZ+u/lVteIMd8SJ70UUN55LODVZoKYzA9wuYYdIH54FfhumtayJ
         B21sISfRUaoC1rWjZzCrJMDlOOoDCBx7V/YtDG9NuO+Ls2O4+tklwnAdle0DedxoXNU6
         X1klb3vCGPCNn98Nt+TkMMh4++bl9hY6nQZ53HsB7zqFIJ96j+o6l2a2IsLvu0cmthH8
         6bcffwyOKB1827213/oxK+exWl5ZQ5ukbv2qz7zhA9TGJzumSbJ4G7YYZwdGmWLIuJIr
         J6FQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJr/t+dzTTdmQYXmvdvGrKqMVClUJqBVX0GjZmVk4Dal8WJuOSUXM6ohJ8O4VNEJXfoxZGPDtIh13dhmM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEmoE3T6IoFYOS73f91DklNdHgtwe4jj/AXKIpNIdpIHX84/ff
	qGjBGhuMiU4NcGBJKgKzmejdEKT5abNOhNBnZf0gOaOSUyK2qflyhoe6
X-Gm-Gg: AYBFou1zkMFrtC5FUfW07LKn6foYF804sHoj6MmPJWe1WIgaVkLq/kAei90EGnLkWkn
	qsJ1AGSBglGQqckB0JanVEPWcIF7bG8d6deXAyyDBN/zjlFrI3CwhFEM+T19tKk11JSsSWeQVTi
	WcmYqJQScjUzLnAh4fpTz/+e9XawWYwvnvG4CXOc0uGhTjc9kkmtdujDJDfXt40QSlFF5TN6AiZ
	NUS/p21l7/GMG8rhnHxlPwpXQs94jwQJLM8tLX/3zngMrd0JjvCruE7T0NS32iMdrIhLUPFZu3D
	/wbtnG6sTIJzdjCdhnMHWpkoTojG0sffFPmQjN5bnL6ptaHmcYxfwoq/JvGeFaRs9x0ewrMX6iX
	n79C/Owhhd7g9GKwmvrwTw9JxeYCmzSAZR6NrfV8ma4jxTHWxZ+CN5IZZz5ppxldPTSvr5en3Mx
	VWJjGTFT9KJfPzOg1280hpDEBr/bYmslyNvvKXEAKtBO+F5LUyh1xn7RtA8DqcmT0nTCoTZEjAB
	I/NLuxg/6Z2U+vbTlcIvEuLzg==
X-Received: by 2002:a05:600c:a0b:b0:4a1:7bae:d80a with SMTP id 5b1f17b1804b1-4a1fdd245bcmr2271955e9.9.1792536613728;
        Tue, 20 Oct 2026 15:50:13 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:13 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
Subject: Re: [PATCH v5 06/13] dt-bindings: display: add a boot logo node under /chosen
Date: Wed, 21 Oct 2026 02:50:02 +0200
Message-Id: <20261021005006.2341200-3-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261020164651.GA4017884-robh@kernel.org>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-7-maximpedraza@gmail.com> <20261020164651.GA4017884-robh@kernel.org>
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

Hi Rob,

On Tue, Oct 20, 2026 at 11:46:51AM -0500, Rob Herring wrote:
>> +  image:
> A bit too generic for me. How about logo-image for consistency.

Sure, logo-image it is, in line with logo-position and logo-offset.

> This property is already defined in panel-common.yaml, so you need a ref
> to it. You probably don't want everything from there, so just 'rotation:
> true' here. Though keeping the description here is probably worthwhile.

OK, v6 will reference panel-common.yaml and list 'rotation: true',
keeping the description, as it turns the image rather than describe
how a panel is mounted.

Thanks,
Màxim
