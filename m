Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109229;
	b=5RyvRY/B/vgww8mp64BO3FLsGEP1ZuJ1ggqS/EAAhGX4KtF4V3Nfocr7v2vFowbaEW8X
	 P4CkDQDWLSfwnDwMzifddSOjn7TWFSDHF3SEK6BWQ4Z993r0SAlpXjWt/F3Sew4XG79eT
	 +dqdB6kSLZ4BSwJTxW18z20tSG9Cjzm19pNuvH75duHUKjbJFwXUqT5t/5iSVrAn+G8y8
	 Lb4QI7jClBiTFlk9Es5g1iz1brsRUG0aSLZbp6qZd781tChN5iHk5pZkVck/SpwNnLB0C
	 3w9Ru8l1ZT7Oxa8vdIhA29fUJ1uegtift3C0wcGMl4nwGQAc51eF1nF/suPuHsNbdAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/ggIeAF8ymqQPticOc6wmD/qoAjkwXyVLKkCNBrapmc=;
	b=cDR9e9FeAeeFHTKGqFrZBwUWiNsFNLwqQoFBwYUUvzTn9cYYoJmECMXq4Cmvq8ewJj0h
	 d9STML3tKfSP6knai+TrgkjjIL0mcbCb8PBnG80fvJUuyFx0R8WR8eNiLIQvELTveaiRl
	 BHhb07sxUgk4vKAQJKO2DwjtfVACKl8oXEfKNCyV7ztvNyEXMV7d3C9RpqU8uzOVgzYto
	 aKz2XpQcxDVqJqKFI3NtEUCSMNZ1DgqPxuuyWK/9sV1F7bmLWFJprhzEJ9yhyRTwo8fHh
	 KaBp5B9C3qiid3YUR4C4eO1IHz+dVHfSEHH61yLA85ijOpoEySOhBUAVOTWSjUstTrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J9EdSbtg;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC8A606A331
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCC8A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J9EdSbtg
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e00eee27dso2712375f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109227; x=1793714027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ggIeAF8ymqQPticOc6wmD/qoAjkwXyVLKkCNBrapmc=;
        b=J9EdSbtgiLFlXq27G6BCfiLyCUmgTmamz/0X4sPuWGR7PI4baQHTwUqiGYuOjNv+Zw
         1+lFWIFT+YbazTtQ73hJYOUYzJ3Z4g1NZE2eOsEyEZytb/i4LPOqbzR0IbSPSNEytzDz
         1hHhw/E32QerKbf6y9ivfV/PqizTxvtDena7LjediVrmbjhB5EjOWBkPv/tNqmWrG319
         Ql3I/u4j6qJosxpMmd/ho6YxJ26kxYdNzdxIqPRZcfKDqva/aEjEcEyumDsrF2yfWlTf
         74MjiDyd35Jl7TGIWolX3bWIaH1dYsBJ625xdzWOV1luCLOkhS12QU6RQOgcVXRjuHtC
         2PGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109227; x=1793714027;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ggIeAF8ymqQPticOc6wmD/qoAjkwXyVLKkCNBrapmc=;
        b=lZsy0C9hj+4YPKXErHdeu9sBF0BgIMDIrC04NL3nvbeoy2bfFtsZjHcHvK6AnkMP2w
         gLRAQ1cRIij93pCSRmpqeabi2sAg5bUTMVKyEJco1/g2d+ORJXUXogS9DUUcXCjXJcQx
         YmjAFkHQ3Zr7OOGrFBAcrZ+dGW27jeicob/o+NH5sjI9VP3GWEv8z8PHTMBBaEZtGFsJ
         E5kUV7PBVF5ZB3ufCKZZkgP9b3JHzfirzrRHpQfkNS6PO1vHfO0e8z0/spF7ehcWkmJm
         t1W1hMdBnGR1rYmWYPiBxWwPmPrn0beBweASTW9uc1RttosYmBG8ndkwlrJ/lPtOW6um
         +naQ==
X-Forwarded-Encrypted: i=1; AKwUvBx79ZNuugAIgoXptjkKQlej6JGqf+gZqxt2DOWr1Alos1neLSjHv99+3fDIebnsqHwOxQ5rLJ0S1ao6W6Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxCHY8HIyjH7x/Qdt7MZpAYt8cWEpP5K9ymXa9O24ImhyZs6JA
	Q9gFbXH7UCJQ8egjm1Rgc6YchIv+QJiGQ4A6nIG9Gsimk8CD/Fv/UOLc
X-Gm-Gg: AYBFou34ja9rHiddkTlvZUiYQ7kAUdRI1WvO0En8Wkbhd43AgC68AFsbsNPVjQBGAlh
	R3QR8C1lPDd8FHRIgeGok+vyL2PKMTEv5ZCrEq8lfw2Qu4n0O3ujd8mGfO1i3mrx0Xox4s2+T9M
	OR6zrl16iWbAuCtDOhF8VD4/9yCgzCnALrCgdWePDETHnznOoBFs0avICHEM7qWek/AhPObdRcO
	z+Pb7wGQrQHAT+STtOql0wdMXn5/JBMJ+Sk7KbaoCaPnmGboVma+d5ohUKyLsx9hB3BVCoV37+n
	hVEq3FSPYMNN/JlmxzuzR9VSn+aKsD5BRJjmRhnGle3iqKLcFRuwD0uBvHN53UEynT2n3MwROP1
	FtnLvXGCcj515Yo/+l4SLhaW/YsJhANWtM4Fb2aGBEiihUlyIDnfysW5xP0Z+0zakzWGCozHVo8
	7IbIs0sYtHg0nkG1Au0d0JYQP8IvyICLE9khiYU0WWgxpDfVy6xWh3bhW2Uk57KFJ5rXe1nW6G4
	VOgI8at4sss8SD8FfShvh2+KR0c8ULAuGk5L7V6GtX8eH6tOhTeQ2PQsZkz0T7u6SA0I/nm6xvk
	T2/BZrpynm41sa9vDzpQ6bn9W+NT
X-Received: by 2002:a05:6000:43d4:10b0:48c:77e3:6c8e with SMTP id ffacd0b85a97d-48e3eba1660mr15009254f8f.49.1793109227175;
        Tue, 27 Oct 2026 06:53:47 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:53:46 -0700 (PDT)
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
Subject: [PATCH v6 01/15] drm/clients: Kconfig: indent DRM_CLIENT_DEFAULT with tabs
Date: Tue, 27 Oct 2026 14:53:28 +0100
Message-Id: <20261027135342.2003632-2-maximpedraza@gmail.com>
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

The body of DRM_CLIENT_DEFAULT is indented with spaces, unlike every
other entry in the file. Use tabs, so that the next client added to the
list does not have to pick one or the other.

No functional change.

Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/clients/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/clients/Kconfig
index 6096c623d9d5..8d8bc37ec9f2 100644
--- a/drivers/gpu/drm/clients/Kconfig
+++ b/drivers/gpu/drm/clients/Kconfig
@@ -114,10 +114,10 @@ config DRM_CLIENT_DEFAULT_LOG
 endchoice
 
 config DRM_CLIENT_DEFAULT
-       string
-       depends on DRM_CLIENT
-       default "fbdev" if DRM_CLIENT_DEFAULT_FBDEV
-       default "log" if DRM_CLIENT_DEFAULT_LOG
-       default ""
+	string
+	depends on DRM_CLIENT
+	default "fbdev" if DRM_CLIENT_DEFAULT_FBDEV
+	default "log" if DRM_CLIENT_DEFAULT_LOG
+	default ""
 
 endmenu
-- 
2.39.5

