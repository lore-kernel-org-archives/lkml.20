Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0366847535F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 19:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790884744; cv=none; b=D1Kregr/CrargFLyS1Zzmjhl0i398cNEn4c0/VkdW5ADuTBgfsm1OGwH/Yj1iRs33Iskba2DukHV5Mu5hGjdm6VnPTCqXz3GffMzoTP2qzzjEcRmMvg63VV26gFb00DGCZSeAWCtw3HHwCOZphbOlb226Xu51NWjQe3OblF2qKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790884744; c=relaxed/simple;
	bh=IonqSnhEs4XXh10/twKbHK1qxirAdAbOjc2/pjgee5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DBifLUa4Qb5j0fDAilctt1OHI2X2/GXlAo0UFTVlin1dsYDbqijVMkG2GK4Dfic05u03HzesxnwbyTrL+BJDIjuAnrlX2KmqCL9woEdFEZYi9h4o0jIUIvwXJgEBTtC8aQpIT9df0btEQOey8gZOaBTRDWI3Oi7gdjKZoqNros4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMgzg3mc; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMgzg3mc"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso37021005e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790884738; x=1791489538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gkbMt1iWPzKqAl5Y1iQuN/ShWwz04PZhQ+M6tBc7F18=;
        b=gMgzg3mcsdtNNW5sylmu4bcqOqL2TA7DsDHXFfujWK3ZTr2lNlOMryQxcw7Rri09JM
         uIK/YU6TKTd0nJafvfXyK5m4r4vPX11RgpGi5CXGSH4gQ9d9+O88doZfubti1rr22x/t
         ZQNsZ0TJP8teaQ/jCN+s6a08pkuHw+rMxlJrjOgPmQRIAzJfE33izVQgDt6TouMaDidl
         JnDHNY5l0hngwLbEJeGolbQ6OO0hd87W5VG/zGv2aVwqJioE478Q85oz9RbLrO11Durc
         tu6N+WjsSLXaPD3xkmkUrG5+aWg3bWQmUxQgSFnKdVgCU//7aVvNUZZq7jIgVJFm2mPG
         LADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790884738; x=1791489538;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gkbMt1iWPzKqAl5Y1iQuN/ShWwz04PZhQ+M6tBc7F18=;
        b=UJ1dIL6OiAJL6ycU4Co5EdpxZnUlJkeVFD2y4QT9WURLr0JZFg40h8JX2eMIlUSXcW
         Zy/rDvqnJ1cm27UJYb5b2S8rvpIw1lvg/PKeF4VcZi/oLjO7Sfv7cgvVbTew5xH2Frq+
         +S5nOBwxrIKqXMCsQvfLTOyjTpRXLriNzc5w44+Ntofb4ljt9GcLGRMB5POQE+LThnFm
         ibbCL5EdvOMX02xnq2TvGeWFaNuPpxI46Hf5YLcEcSG4nn1YeyUNI+OFwiBqkXV1WmcJ
         ot4/xfRiY80krYZXMbx8+tsG6b28U82wLDoX+0X6jEDrK8cMVrUIb0J/RLnr4MYYlI8y
         sxwQ==
X-Forwarded-Encrypted: i=1; AKwUvByh7Fba50xk6Qdvg3vbyctBRL5dpcky500LqDs5wSDn7mCTGvxJlaJxSemuqTt9UpMhd+Wua859a1ni5yM=@vger.kernel.org
X-Gm-Message-State: AFuF++lPoneVjMh50tm/xOsouDzWCpPC2mLn1lel3ywA9u4ygOwA5VjH
	cIBpSIjZ5Vh3EzYFME1MnStMGBIuWhHJJCd+BZFKrld6ph7MnCt9RS8w
X-Gm-Gg: AYBFou1L5O5X2xAiTIqk4Wk4idSuNZRj/yxKv7RG/t+nYeoCilTZ8/VyJ7vkK7NPGh2
	MJytBPJkv/stciQpZujhq+5xF/xYM5jB93h0vxYz7Kv9byNfo+APGGZ8EG4MHRSOGuway5iQGO1
	A8Uyn1AF9jqS+5BH+Wql/cw2fYvakw/F1SWrPRk92QanodQxWoSG+rHxKTUWAODa1O54oi4aoMl
	O6OryLVvq6fhDvf9fGqIP4IQnePerfdzTpPaT3bz9lqVMSfQKJWQpXUXO8yOZOl/JqJYDumubX4
	MP2RCSDGeEpo0tgz2rKN1NzMLugZCmxPn5EptVy0KEUSSHNY09zTXgQ71iNOAkkHZcaMksnpSiI
	xXWKctByiDkbsuq8+833lQLqVok1xjQhBGYX/YktaylkzRoonundNGFavV/5OOs/TaBKZHyIStW
	ROYy9Rxmu9CRVn6eHh2Gbn5WdpRXwqM3AXhQZwYk+Q27t012RJToVIfGnqXC+0cMGGQ+K5gwdYQ
	SMI+VkMXZWCLzWaIvHhAIW5yg==
X-Received: by 2002:a05:600c:6d1:b0:4a0:1d3d:502d with SMTP id 5b1f17b1804b1-4a02755f856mr8010975e9.10.1790884738342;
        Thu, 01 Oct 2026 12:58:58 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276f92d9sm15031045e9.4.2026.10.01.12.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 12:58:58 -0700 (PDT)
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
	Jonathan Corbet <corbet@lwn.net>
Cc: Francesco Valla <francesco@valla.it>,
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
Subject: [PATCH RFC v4 04/13] MAINTAINERS: add entry for DRM splash client
Date: Thu,  1 Oct 2026 21:58:38 +0200
Message-Id: <20261001195847.141192-5-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261001195847.141192-1-maximpedraza@gmail.com>
References: <20261001195847.141192-1-maximpedraza@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
index 4d108339f44e..44730414e5df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9155,6 +9155,14 @@ F:	Documentation/gpu/drm-ras.rst
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

