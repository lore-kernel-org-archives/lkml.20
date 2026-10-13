Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8406C3F65E0
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883984; cv=none; b=AYD/Sip4y6XKOg3eXo9GqZvZdrIVfhpZB97S++gi5ehR5cQCmsv3PLsZchz9W3xAd/AwHJmtGmLcuIQAS+JW2cK6Z+5Qo5PJOlHudIAu4aNKWfr1dUoBpRULLALsWSaD+MVKCf6N6VAVvxgbOavjUoyOirL+uTcjGMlcAnhRYcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883984; c=relaxed/simple;
	bh=ZcbqbnyKp/n0WpB7iv3NE32Z90PzMJn0VzjmrHwzo7E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BSqyWc37VNChsdTOesxKJoPTi8bGvJQBk9PQuVZ4Mvirj5QHdTpLpfInb0ozMBORQe4Yu/aGvcof3X2/2I9oWmH6Tg+SBsGk9GpOpoBa5jy8Q8Tt3o+Pqj6Dkrp7jVTT5plQ7NTRXg+zggof1A4fglipM7gQG43Dmx/BYeEzyl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YO4IuQrp; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YO4IuQrp"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2652789f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791883981; x=1792488781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j79G9x93qm3T0R3P1TfLErsNrxHPzMPCo5TuV1Ni39U=;
        b=YO4IuQrpAgMQ1QTHYH+FbmHY5hdO3sxVdQQVqHeFHVFwm9xWq9m8WyfZ4PqVGPUXfG
         vmrcKP2z5UV+OR1qnnld2DWRRX1/UEoG4aR0xoP7+3MIAvbWrqCxMR6WhGj6Nr2t5fry
         Z62b6rLKlgAG1muWc5OLvQcimskiQaOo0KFxQdDbFkx96r9q12IWDyL5DGO//A7aF4+g
         uREQ2SEwB8Sm45g7xOvsF+3nGva3w+Pgdw4sxJMD1NL67NhKAG0o41XCJO4wXWIRDoYp
         CbLDC9d7a0DStT5PbujUfMtIl6kbkuUn43/efTThkbV8MJ4+tbm4+jxE6NlRKLuY8r8H
         VwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883981; x=1792488781;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j79G9x93qm3T0R3P1TfLErsNrxHPzMPCo5TuV1Ni39U=;
        b=h+U3QP+J0Ix9jpFZyPHgD9xnn/myaIzdfzNx4gtKYsfQ/nQTB10aoZpbld74M17pji
         bCP6fc8yB5vq5ihpjkOL9veY1WrSxKdPP+KcbeF0hxizIdd7HJybux+PqiDyYkj8p33H
         whq3HWiaepfJvH5pwsf3sdvvtG6mPY1IGGw6ozafBXH2RN/OmTjjz4cvRZCM+s7VAJZL
         EyBIvKEXV1pKc2wB23woLVXNTTH9DrFDUt93NgdRLNYAIoFHLDQJvzxO7Wvc8+y0s9EE
         ZHvnaGolfekB1Li9B+PokW0JgnQu4M0cj3GPFrQlRPOwZSXWoA6ddTK/pVkh1v1lYnG8
         FC8g==
X-Forwarded-Encrypted: i=1; AKwUvBykJW0NxQzktBVYVcm8ZHpXnBFxosRVOO3CkdwMS3p2r56yz+r65y0dasuLqfOIj4ZtN8zcpatsi6Dv4lk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSzJTtA7hCs6u6A+G+hVxWm+P9rOu51KgqytHHFg+rpP/H0rV/
	7w9er+CW8bWmgFGbjx/fX1xHr2+AveFo5PJ8WfMaNGFcmNAwTuv2T19S
X-Gm-Gg: AYBFou2YtvX3yBJWLUjU7JMx1j/r41IIg3LX3QaAqKszF80EevaYBtvQdnTVQka3K5I
	Gc45DGKc2a3Hxm5lU+0H1xY9JZaU+Iumjf3i/zEGyt+hASNopmhT/1VwtZvF/JhTuvu0UjUFr8b
	zBrJ/tuEhGm23CsNoRLWB7iNMga0Uq7Mq8D5VSmfIoCkI2lG1fUu0sG5iLET/0aZeN/FGFq1Ex7
	IdfPPqVZUM6pngpSuU42JA7RvW9h8MO2kEq3INeOYnCXAtxkTMnz2d4wd0iqgFmYFw7O6bN4Wvd
	BmniGMDsXO1i9JfypQ+VXiTcHlXwpzEQAkzTn5185zOZry4FDBLLUE7OHyLFYhASdTBD5WXiDGx
	BZTs7hpHFfaALN3HQ8GIH9gNyQZP4Ddivf7N1HYCfD70FOar6t48ADoxDOAt6MZry+fdPG63t7R
	meB/5PszErBE/alZl/Xl5FiTwjnkr3D1o+PNFjoDppTC++/ogUflCOyDXCgs7FjXJwJLUVtvIKX
	S35DV+J1KN/R1lqyudoNo1Q
X-Received: by 2002:adf:e712:0:b0:488:7927:9ca2 with SMTP id ffacd0b85a97d-48dbace0e05mr17961496f8f.49.1791883980607;
        Tue, 13 Oct 2026 02:33:00 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm3986774f8f.48.2026.10.13.02.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:33:00 -0700 (PDT)
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
Subject: [PATCH v5 05/13] drm: docs: remove bootsplash from TODO
Date: Tue, 13 Oct 2026 11:32:35 +0200
Message-Id: <20261013093243.505776-6-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261013093243.505776-1-maximpedraza@gmail.com>
References: <20261013093243.505776-1-maximpedraza@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
index a437ae5c71f4..e77de5e2a24f 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -773,23 +773,6 @@ See drivers/gpu/drm/amd/display/TODO for tasks.
 
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

