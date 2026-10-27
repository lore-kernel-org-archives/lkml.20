Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793091339;
	b=xpnVmI589Fc+0yMk6U/9L7NWIW/vthEppBJSXTvXIDpBOhJq8EZMlg2wyEsWR70oJdZN
	 iRk0Q1//bbvzUDsmHOwYp4Tr6UQUfRf1+p2RE0WE95zA/Dx84hlqYaBggsWOe4UaOi2TU
	 Y4PWfVrb4XExj09X/YVQFs0NOEVFb0sfgM0ZXumWCeBxQinmqd4xZfLn+fOd6TAkCUIzW
	 +N+gZaIjJcvPshVMeeH0mJptkNyAlq+X8WTETDXzhI6CVrMTKBvUCQNo6IPZ40+LV2zNz
	 ZTwGTtgKyHccBDmDksAMAB9IGq5y1ov2f1y+3zwyCU4oUUDc9THrnZF0A0r5h/SgFWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ho9s6p1VYtelviR5lwhrV0eO33rHviRLYIfI2vUHdcc=;
	b=X3hW15gY71K0AOmg8CE8d3qQ4JHK5fSatqiFyyaMP7J+XV1TVbq7yvgy2+/rdEITnn2/
	 Lvcevj5EW9ILj+Y5vRPYzbNhsGorzZFJJFpOKintGDzjvdff65YQ85CztQXZkdKmk09HE
	 X9M5p82Oi0ejmlyQLFpOUju5nIF+W87Vysf55/Z/Cmn5yeGi/1FPppiU9iLAyUQYSdXDr
	 ulSmBPh46GrYTrG4BTxy3Q0eobQEPPurK1a2GWQFLihch2DbcnlMsh7ipAXuU4fW2ziNu
	 l9JZ71TJ/R0h8TKiA5D19PQiAuDWPdMwfIiQJn9V81tPSzrcrSXeBCrBFSMMn9TWdmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="b/So7K6S";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78DA606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D78DA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b/So7K6S
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so21201095e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793091337; x=1793696137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ho9s6p1VYtelviR5lwhrV0eO33rHviRLYIfI2vUHdcc=;
        b=b/So7K6SlEFKsKvpppdb0hN7X3ShpUHrDkEGpm+hdOpeXxye9etaE6J4sCSorRx3kM
         czfbxf05jtinPI2aiL8CJUaJjly9emI8ccsoyRnDlB0y/utbspCSYppB1MNcHPV9jGyh
         FUJyQwkeHy7tPIlYCOPYwSwuqAcKiYnb9p8e4vO6DoqVrdAoCSc8LHdqe5Fz5/Ajdid0
         HHXRDz1KMi6u1gdWUd1XyLiRq7erydGtwKm5Bus73oAdaLIEOf6z0IMjI+GLbqBKLZzv
         /pT74T2RTSe8g24UmLOQvAI9UqpdneqrpOjG/H42u4dI8pkQIqf3tFf6jrRXs9jtgNpq
         /q4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793091337; x=1793696137;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ho9s6p1VYtelviR5lwhrV0eO33rHviRLYIfI2vUHdcc=;
        b=QdQrJBE4FJXP0mE2uWn/d7TgKIv3lroL7G/tuJUhNf5xjzXHRcCc+ny9kJFP1dykYS
         Pw3ws8txAUGXlwjal4vy6at+HicXK3jjNsH3V8fNdrKeytnIPHRXJjUa75DfDwI4GGxj
         lp+JUxEIeZEch7sQdK4nD2VEuSf1J/pYG/JmWZNzyQFUGKRJgTGZpMpz5JYJ80zYbxnp
         LXHT6WfJl8B21h1drxLATyWPzUu7odBFSmnjmkIhlYl1S0GJe7rEEjDYPpwI7bXHwiIP
         BLMfQKkIOY26b7viMx91w4cFwbPS7h73fsmLXpCvNA9RvrjzkCk1zZrmoavGXyTRhpLA
         6BmA==
X-Forwarded-Encrypted: i=1; AKwUvBzYZ7YBXH+6apSgsfSWTQi/oD5qemj3HhBwGl+6bOPRmia8Zfw/JgzU1tNfGEWi3lhjO3FcaOp6bV7kYu8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlLjUMMc622YE+JOQDLxAspaDNxK+fA/xUSqq2mmqHb65Qzekw
	6r4Kr2vgQ4asOSG8fsv+1li1/UvF6PsWV7Xo/Q8zRGn7ETdWLAOxuG3x
X-Gm-Gg: AYBFou1HrMxlCOTGgEEjQcYbT3D159nc13xPP6nDHZBnw1mT9hJDznjND1vW295WPwc
	B+bE/D89hD6ADVGPgqFRPwF4NEQwZUXea1MYVFgax3Z0jYKnvzoNzLxDGbumCA8FBvzyM2gRUKI
	taa1YmQyj7LURUoFKBwJem95lSNlZh+v+u14qRchOatM4s+Ez2zO+Uwux5MM8KPrkVjfIFaKEIl
	hUbhu3VaSobtL++wIHYIyjDMLcVTH53hEAxrDL9BEKPlkUT0SRa5YkGTkFbAp3WLFo2XTYsYhB/
	+AsxAXZlNs/pX219WRyxsb1CupxkEI//ZRu65yA5NxAAgH8TN9XMOCFdHF2dHDiKr/ZsixJ98Ld
	qQ4dZFnqmDS9Kv6FuiBiXQmDNnmZLdHT3uZ1mnz9xufwGhNyh+8aFaED6lsUi2LK6i8K0qY/1La
	KVDVT2SDp9bce/tOHcgygcfuQcrdHPJCckfESFYtcjRpOD86irm3AMF/s/YB0lRVQVSES1POA7D
	8gewuWoauUyUa9QakTb852IgxtzN+oiL910FUWl0ID2hGyBrE2rcXrcY1Lj/ff/jUpW1a7IMHw8
	pKWugSix
X-Received: by 2002:a05:600c:3544:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4a35acc6b74mr187900455e9.34.1793091336983;
        Tue, 27 Oct 2026 01:55:36 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a09434esm249835425e9.0.2026.10.27.01.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:55:36 -0700 (PDT)
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
Subject: Re: [PATCH v5 03/13] drm: client: add splash client
Date: Tue, 27 Oct 2026 09:55:34 +0100
Message-Id: <20261027085534.1746021-1-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <645c1c2b-9aa8-44b4-8a67-dcd7bfbe8fbd@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-4-maximpedraza@gmail.com> <fafa7327-e624-49f2-98b2-83fd602a0ad7@suse.de> <20261021005006.2341200-2-maximpedraza@gmail.com> <645c1c2b-9aa8-44b4-8a67-dcd7bfbe8fbd@suse.de>
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

Am 23.10.26 um 13:26 schrieb Thomas Zimmermann:
> Please drop the parameters for now. If we want to give status messages
> from boot loader to kernel, we should first evaluate how to do that
> correctly.

Fair enough. They are all gone in v6: the colour and the BMP's name
are set in Kconfig only, and the patch that let the command line win
over the device tree is dropped.

> Oh, I just noticed that my comment got truncated. I meant to that "i
> should likely by unsigned int as well".

It is in v6.

> At some point I'd like to have a nice, shared drawing interface that all
> the clients can use easily.

The image is drawn in two steps in v6, as you suggested on patch 9:
the BMP into an XRGB8888 buffer, then that into the framebuffer's
format. The second step should move onto such an interface without
much change once there is one.

> It's probably ok to address things in small steps.

Thanks. v6 rebuilds the scanouts on every hotplug and keeps the old
ones on screen until the new ones are committed. I will send it
shortly.

Best regards,
Màxim
