Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109240;
	b=qCJkPSsOc8pP873X743a7Oq9Cdb8bJQWlqshfpUDUdMgU4AivHNs61ExNFFhoj90QbKh
	 jq7Ps9m0PW8JX7FGbVzIhixtxmGkAqA8CcwZlYUPdLYLBD2brL6OXQfNZa3zWxlGS05/x
	 uSw1e//mnAK/zLsdgm5vnIpBhwidBX37Vp3Fbmwh2NCF/Qv5ZD1oR3ASJiI/zFHOmxTtj
	 PHXFgrDGrRaG6GehUovErAW314FvkKpvT85J5Vuw4N6WxzDmb27BrIP+Aoow3aSbVBmln
	 OCR1dCYZL0Affuq+oxCZnc5XqjYrCPOGLMOh58wEp7QkMg220faZMxpe4LGMGjp0S4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6FMp4bmsFYk3mzSCH1/ElOs2cwgfyNFSJhXfclhOUCc=;
	b=UkWEXPZJuGwLV+kjadMEhm9oe7KKR82gJ8FJOX06Rq7zcIRy1mOQXE3QrS5FrAU2hpoM
	 QYmrBPwpkZydD7Cedh8HXJwV5kAPscTEmIAVm2DnH3btN88ENu5AZT900Y5x4hzfHJwPT
	 1B5kv6ISwMF59DY2xQnY4rwuzoFfcMhXgZ+S4cslLfbE4mgLBz6CQCoZtdjMsYrM2d8fN
	 5xWwxWTQF8iJnN5fUOG9rw6Oa7yosZzivtiobMpULRWGaEQupFATO7Rza/0pm7uLloKoh
	 MrcsJS51WGzzxkDmUPgMObK45yowZfUYVXdpCnXZ1ieCKZTOCvnFV9EszKYD4aMyZ1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBF0TdNK;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B0A606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8B0A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBF0TdNK
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so24563975e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793109238; x=1793714038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6FMp4bmsFYk3mzSCH1/ElOs2cwgfyNFSJhXfclhOUCc=;
        b=EBF0TdNKiZev92JTXZUKMNM+bikjTpnl6F+xtg1lO25YQMK6ahE6FtSlVFxjBHIfIJ
         2tDrWqG50yvBgr1XKRETOm6kWMHgVeuJM7lBibOyLXXDYgMKX1OPJwSjhZhLALr5KYEc
         Q1SCgLNw6BDYwmvXk5af0SJUgK8tAcDbAMVyUsW6eeK4lI9ZJ/zeaLnLSL3QXyaOHP9c
         3LAIk0jo9oQzD/MXMTG9cVzn0VCwjdkQ/RQrhNaRSRhrf7RTxJJ4NNApmMPopv82MM0Q
         ZP99MlLYSNoqXjI22Xh68F20Jf0avL8oolZjogdrqlkKurBxko1tjvuPerYh9ooefJAS
         w38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109238; x=1793714038;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6FMp4bmsFYk3mzSCH1/ElOs2cwgfyNFSJhXfclhOUCc=;
        b=JsQ7etW0Ks7sljuosQg28NiaQg3LVkV/aSodFTSdzufsdd+fYduLaqku/4n8glRepi
         es7sTM0YNQSmm20Rc9veGLWJLO0TRKlglRN0kauBKzCwqHTVjHREid0/AWUHlcPRwKD8
         5GhEubuq8SnG8qh9lQN1TBMJHkqctjiAcQknS9Q7yy3/i9gWZjDkQO9xtrnseJOLMhN3
         v6tf/iNzXHCJD2eizylJGVsTkCC2u//562vzVQTDewfADljf3yAG81DgWCzw3KKe/KsW
         yPfv/j+p0oZ6F1hDyNOQBo7CzAbDWs2p1GbrI6/ex4TWhGBExJvr5lfKvbJo4nHZUJeR
         /E+w==
X-Forwarded-Encrypted: i=1; AKwUvBw/pDhUk80Gy7feuEvp2Zgi2a4Lto//HnzudUsrISHL8ecETqSAk+j9Q097B2LGTcR506eTmsEVLU8vmdk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJI/zq+ysL0DxzzDPIYZRxkpW9miIcDOlnIlc2fYQCoZFkz40D2
	BpKo1DkpTGTdsgZBOPN3gtzASYi5ZpXHJ1Bj2hQjWDFH+I2SIwNyomVi
X-Gm-Gg: AYBFou3TdpDhr+xgpuSFPchTT71PbI1nrxVGg842KjiAlHTZc4HTSSqu+o+Fh7e06C9
	VW6Rgbvvid0Lie0QKeb9gfXUnUlhV6I58w4STDdri/AKU4uxW4sKkgtgtPxjdnL5Ub30UYL/YAE
	akUOr/c5YJWZ8+90ScHPNOQatj0dLTVHD/KMHprt9ajyAlGLWJAG5EVuDhbZaKbVUGEd/cAwL4W
	3bk/SBgk4ELU4FrO41Eof4tITp59uLbehVAhDyr7bz3qCtz9KIFOG01L959jSqdBrFE9CcXgMUE
	bjoGS+D6LagxI/hcV7TJbLctEE3hI4Q6y3I+47Dgff6hIE2B0AvVyU5NNfj9vAXT/qzPy3RjY8E
	nYOS1AArE1gKymKObzAA3KRNt+jhASOCMY9voz52eu4vGrJ0mn3k1ABp29nBDNKb42UiLmLv3sr
	xwWdXnONnymiP7W5DImIMduBrTVtNI6CfPdLZR/HhGR005zkzXb4cysKGI4NwYDP3ZQaBhyJXlE
	ucAcQqO1GVBGpVDvX9xfL3+1Po3/EqZDE1wDrP1UfwBdMYNtaZguJPiU6M55oD7aT0JF1hJsukZ
	+7tTulI=
X-Received: by 2002:a05:600c:524c:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4a35ac8bdc6mr188823805e9.8.1793109237982;
        Tue, 27 Oct 2026 06:53:57 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:53:57 -0700 (PDT)
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
Subject: [PATCH v6 05/15] MAINTAINERS: add entry for DRM splash client
Date: Tue, 27 Oct 2026 14:53:32 +0100
Message-Id: <20261027135342.2003632-6-maximpedraza@gmail.com>
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

Add myself as maintainer for the DRM splash client.

Signed-off-by: Francesco Valla <francesco@valla.it>
[Màxim: add myself as co-maintainer]
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a08087fb6e67..321ecb9f5b5b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9168,6 +9168,14 @@ F:	Documentation/gpu/drm-ras.rst
 F:	drivers/gpu/drm/drm_ras*
 F:	include/drm/drm_ras*
 
+DRM SPLASH
+M:	Francesco Valla <francesco@valla.it>
+M:	Màxim Pedraza Padilla <maximpedraza@gmail.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/clients/drm_splash.c
+
 DRM TTM SUBSYSTEM
 M:	Natalie Vock <nat@pixelcluster.dev>
 M:	Arun Pravin <arunpravin.paneerselvam@amd.com>
-- 
2.39.5

