Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109242;
	b=wvErR1wMF8tsM39YFXuF6wRPo+xodsq026cJqmfOPOe2Lj4aPjIcp2gUOEUBhkasmhUx
	 SkXp84o3zSMbhZz44LLSuGFUrsFrCcqM+VQKU2UXMrDrzfC49mM9t66CIRnJFZKoc4UnW
	 2D/cDy1tqMRze8QY/C0VGxPepoJcrdChAhqjb56+5qdHzyWMzQJxyVSdRuybWgULmNGNy
	 OiEYHp8RkRynA5zWvQE0Wmq3rSm40X0u9UfdaFXycTnWs6Pk05eUXQjSeUA7xWRGR3zSK
	 rVUlOKm3uQfITbn2c3rGW68oe786pH2u7Mme9HvegPrhW8UBVqx9TD94w6ej6umnRCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=udMEtEpdximcj4tmN6XEoXZYcbf6JGtTIKRmg964qrM=;
	b=imV1ly+ikdkjzixBn/8zOsFlsWSISFXksa7HFMoSEjyz79ae/a9+IDlWvmwS6+hAi+Bg
	 fMSHtAzDUiDkBBjj6tsP5/655VeJk/l2mecXbm0exum2R0vrmqJrQawAZEE7hzwUXaZQ/
	 ynAN3+OO3xtkrTsWELiNmFSjgNvtBTzGUQakXcHTkUB3QYuGIhWOHuLSc3XMlFJBQwaPW
	 zBXYQ4S2C8TbjPMNGojMEGc2dUyrOqFUrszOQcTN9Qso3er4vuC3piF78BqqCa3Ja/YK+
	 h/kx2BCvqZ/CYg23jUSyEXg8pFcINgRjgEZ1xlhaNBfkgvZob7hFU4qx2DRTzARSTtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oimiZnio;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD42060A2638
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD42060A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oimiZnio
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1990545f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793109240; x=1793714040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=udMEtEpdximcj4tmN6XEoXZYcbf6JGtTIKRmg964qrM=;
        b=oimiZnioitMUEnEBSrenFhRbAKwenXYmVyqgKmWsRYCXK/JKGbsa6e1hchO+K8E4AP
         aKqtDi+/aJJxJ/ZpulCQo0A0FFLFB/P4ruAZvVuMg/2UK5Qi5nmFDuEhOUZtyGtwcLe2
         Cy+j4nHDSbUeCVSFCVw+TcY43hi62SLj4fCqzF/nem7rtyWJ28BtO6lO/RiZua4Xss0f
         IIxPsaHdtd5IKWoq+iFATJQSwz14z2HjyaC167tn5z93TbWRuy2QukEXN6vuiDh6h7kH
         IjmyOEcbEQ6slNZxbs92lcTHtMkLRShklgeyiQ3bXndapKr3p3emUgxr1TirGAYeVUY0
         6x/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109240; x=1793714040;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=udMEtEpdximcj4tmN6XEoXZYcbf6JGtTIKRmg964qrM=;
        b=whdHNxnooaquZtHvHhSQhYAuRLiO4sIsHPMJyUazYHhH2U0sal1Ku1ZEN+0I8YiJ8U
         sC0MlA7le2q+7HU3vMOG+NM06+KfUsYX7WNO846AH8yUrTxCK0y/78yj2s7ZfvacHgvy
         NO4vG36auNhG6hqKLOeDty15xWO1B+NnYAFBVJSjjRq8uitkwn5wfgA8cvqLpavnB4t2
         bG0hktg28oQgnO+QH0e2BT1dITTBJ2XAEWNNzVzobb94c7nSp6T634FXR7riVFDZQyW4
         Is+CSHOxcYP5Wgjbn1ODxC+4gx+9+I7EV4YHly8FLQSEZ5Itz9eJvDx+kGooxR3jN0gP
         0Wsg==
X-Forwarded-Encrypted: i=1; AKwUvBxjLvOQXEgp621zT5VMex53a/LJ37JTH2qlmE5jds0oQnWdXO8t3cOUyosI4N5pLBgGSJQEvSzx/z3nCcU=@vger.kernel.org
X-Gm-Message-State: AFq9FYISUp/eLCtM0nKWHLhbiGfAq6aFEU6cVtFBLT+vIoY0D96BB9ZT
	bPQg71t0V+2gpLT8dNdC6jMT3zZojnliHMPB7BuTXyjeM+n+5xtrCSPZ
X-Gm-Gg: AYBFou3R7Aj6tIk0EYmXwc0ff+ptKowvbt6C76j28kZKoZ3QkTMpvI9Zf0DHIUPqHao
	3gdeYKKpfxnD8GqSu6gWHHW4QOjVXp9i/4KcTulXV7BPCbvZWlxPkEAcsutkcBQ0hr7UIVo7YVn
	6XMS+YKMq/xSdAcypSc1xh/LLip64vZONuOV4JCpnboo4LLtqWkhfSz8yqBykpZjo0E1rKlt7f/
	W5pvBe4Lm7vYhlk9cQps/MF/GpCn2WN9pPnk/dt5nJO/sXgpZAY2BbjfVveQ+M4FzF1vE0TIEOa
	b5CF3YyYXEUI8L0ZsXCgQzpsjFt4Z4mKS4Ru+WkiDVRCbKRIMQi4mnLcBMugNlc8X1myDR2QRjG
	dlTo2FneI3yy9QQMftHBtmBWIS5qp+xGv+wY35YLSgwxhf4oqlLAjR8j4s3FgCEi3sKbcl0JtPs
	S19XStmEKJmU1q9fTamfmqQgbiV8j+EfvZfEEKNTWpmiaBVPOQENPzekagNng1axtMJsxuqJH1M
	mn9ZtAYAfENIBuo7hCxzx6BE/SGbmwg0LkM3y2Php321dsDn87Y7lyPnxT6HCtku0BTzUQEibWU
	iZeBxnIsX8OOaJafCErEWiP2UlDT
X-Received: by 2002:a5d:5e8a:0:b0:48d:f56d:be56 with SMTP id ffacd0b85a97d-48e3eb7642cmr19483905f8f.13.1793109240024;
        Tue, 27 Oct 2026 06:54:00 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:53:59 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Helge Deller <deller@gmx.de>,
	Peter Jones <pjones@redhat.com>
Cc: Francesco Valla <francesco@valla.it>,
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
	linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 06/15] drm: docs: remove bootsplash from TODO
Date: Tue, 27 Oct 2026 14:53:33 +0100
Message-Id: <20261027135342.2003632-7-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261027135342.2003632-1-maximpedraza@gmail.com>
References: <20261027135342.2003632-1-maximpedraza@gmail.com>
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

From: Francesco Valla <francesco@valla.it>

Now that a splash client exists, remove the bootsplash task from the
TODO list for the DRM subsystem.

Signed-off-by: Francesco Valla <francesco@valla.it>
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 Documentation/gpu/todo.rst | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index e6d36f8da086..5e987e18bfcd 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -756,23 +756,6 @@ See drivers/gpu/drm/amd/display/TODO for tasks.
 
 Contact: Harry Wentland, Alex Deucher
 
-Bootsplash
-==========
-
-There is support in place now for writing internal DRM clients making it
-possible to pick up the bootsplash work that was rejected because it was written
-for fbdev.
-
-- [v6,8/8] drm/client: Hack: Add bootsplash example
-  https://patchwork.freedesktop.org/patch/306579/
-
-- [RFC PATCH v2 00/13] Kernel based bootsplash
-  https://lore.kernel.org/r/20171213194755.3409-1-mstaudt@suse.de
-
-Contact: Sam Ravnborg
-
-Level: Advanced
-
 Brightness handling on devices with multiple internal panels
 ============================================================
 
-- 
2.39.5

