Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794784926;
	b=TVPb8IikuO7PZWsHqXtKrb6Xi1o60V3tAHULlzIvZTKoysh/bnXG09ykRkTVie9Hh4p4
	 riP0HT/BGm7drpaJGcsexVOVQwoimD52/yKhhxz/H3qt+O+miJnIg/awJwkuJICSDV2KA
	 YBAORWrdnumGTjo/EdFhM39Itmk5RFR2/2mwJ2//HHEbhGgUOBMD8DHuboiS7/KiLnSdc
	 mGdSwcsvk+zx/WXGw2vmLyK2Ux+bo7H//UrBMRU6AK6KT76juxzMWQwOT0r2n5/PsCDsN
	 1lAif4qsv+QAOI/uaeUZ4VDLILE1d23Yb1bzHeUs9VJAc061WeoYedPAKiQvfqvVjog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794784926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2M6HoHkTeVcJIWfMAzqJ94aeV/R3TSw3Z3JZl8kxSXI=;
	b=qbxDUqH/30qybc+Ymulwt7U7eZ3kQ5BBCOqet8pqPFzm+HUGC5NBeWgIEhKDzMm/ddmN
	 gjwA1iZZ3jwecqoRqLVylgKW4QI/eIpd13ci4Qo6JuwuZAzw6n3gjyS5vv8jMcWT/UQ4H
	 OC7GdBR52jsgpU4oVQmiVQ9Ro/UqMQx+QYeFb6C4i9nNpW+QRiTE37MOmpTYd5EITJA/+
	 V22O+mU34IOKccKZqUZbkR1jSN2uXUEqM2yLsYVRbsrYOjVDhoQkx+O9yHzLRNaYRhX7t
	 XUuj8RcEFAxpHrWC99wqwA7MHrDyDKP73KQj2i71XT2TI621dwRCyYNbH6MhIAeNLYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASbX8W3B;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F5D606A88A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13F5D606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASbX8W3B
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso32384145e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794784924; x=1795389724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2M6HoHkTeVcJIWfMAzqJ94aeV/R3TSw3Z3JZl8kxSXI=;
        b=ASbX8W3ByAyt5NTODXjPhDEF/llLXL3T+KSc4VFkXSFgOapFIsx89vR4EdHZKzpZ0d
         9OM0B6CkzCWrddXddFfz01PXzxCoLgXIaBSau/cqNSaG/CksiioPlexZ00OVV9do2ufn
         16+eH+ODzHnZBHfhjCxkG7ZJOv2pbKYZ1BXXuP2CqJh+nz+aI2HpkBudQNFKQX1ILj0g
         S78ThpG5NCzY5IsLhI7Mlr+GrpbtjobJHvFRpPTSwjND4M78iyD+2cqOZBLJGEhz23sr
         oZwZWmS23kYNaRtQX44IMSquUhVG6e15QCQOy4AfKBDm+rsn0onfwkmRoyd26KDKjpwt
         a2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794784924; x=1795389724;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2M6HoHkTeVcJIWfMAzqJ94aeV/R3TSw3Z3JZl8kxSXI=;
        b=hki4g2KjZf1be8d/KYpK3quRc5q++8IXMoOWcOv/NxQ9MvGU5vgM69yuLV+dVA/RDY
         gduyhf9c0YzOtrP6y1L17Ea3dAPZY2etmsYGAHSBUnnYZiguuzoo/P3E6CMn2aiPyEvl
         PUQ/+FQRAY/03x8pzJmLAoZrlwK+ZrbDYY205V97L2iJhEzqbV8uMIdKnU9vWlvAQHJb
         SJfP1482pros+wRqt0lM839uu0Pb0/SVSGDn8i0ZXgMkweS0IYheW7UThEW4R6CoMGY4
         utDeNupd7/DpGVNIzlQepfZngc9eZDWu0DM7pc5W/LEljEuxDiKHovRcuhs4WYrF3Qu5
         XQMw==
X-Forwarded-Encrypted: i=1; AL+hErEwqMq/EFrMb5M6vo81xWX4Sg2XA6Pbuqq3ineDwhW+qaDRzJbh7Y/wNCUWrjUgYLfpCSo3Hs+aV+iuZQo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xDa3jt4z5j2RMe8jjmZQ72qihtgna1Zny02NLWA6YLP4y6sKl
	B16Mv+thjUB29W5rWy8b9tfq64v1oJhThukAwYuoIIO7RSm7yU2RFczf
X-Gm-Gg: AYBFou0F1j/D5oUlePi9AojaRjSuI7OqYC7HRsODb8DQtGIhRxjGZovzrEuy8ikA/cS
	g6ax+VJ/fGEkOCt6EvTkauBEqTlO4Xh401a1oMHHIbzsRz+PqKaIc8EH/APjeiqf5GkqTgKRGdd
	51fUbac891+sAj/j/+xtcfNt0KmhcJjq1I8Uv++05/Bvd1kVCx8lPAEcCkH85mmqdk1JVSTT2AG
	KOTIHUwennUxyDZMQE5BKhmfsGPL2N5xdC6VkkFOL7vQplFoQPfy0XAI7TrgMZLeb26wlTeRfNU
	gLFruiC9qyFGAlka9QrCA8G8cz0DnaouYfFhb1/3GWTAK53BGq19Wmoyc4Sg3/OJg5wWNFm/rKT
	RdGXCcE7kXE6dgsMPJRr+7/VKGH3Nl0Gmul5UDwaAft/inhB/5xhBSncE1SXwcNLoMWOzlhYo3A
	IWe7eCKsJi+ZunDDAd/JqRUvm+6IycEMRwg7QMPgoLE9MmybCBPYp0NAqpNFCaJXzSo2nuuOyiq
	fz8wSTV45KL+lcWeVpOd1H9whCu7Irg5rQNHzLJWO4aoe/dDYcq+BmpMMFVeMkrj/Eeugxiz8fd
	HJp9QqfYm/y5KpLzF0Qca3j1/6/UGFuKJtfPEFkWdJhRwtf8yMz6NWQ=
X-Received: by 2002:a05:600c:482:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4bb55a59c9dmr137490185e9.22.1794784924398;
        Sun, 15 Nov 2026 15:22:04 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f976esm127920955e9.3.2026.11.15.15.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 15:22:04 -0800 (PST)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
	linux-efi@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/6] drm/clients: Kconfig: indent DRM_CLIENT_DEFAULT with tabs
Date: Mon, 16 Nov 2026 01:21:51 +0100
Message-Id: <20261116002156.1027726-2-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261116002156.1027726-1-maximpedraza@gmail.com>
References: <20261116002156.1027726-1-maximpedraza@gmail.com>
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

