Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC03489FC9
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 19:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790884744; cv=none; b=GdT01MGLePOi5WCl3mhST7e57J+7yvwQNXZuhI+P/ESiy0cBQYmOfMICWlvLyWFtrGRAo6Q1vJGToff80WWXUCxuxUmiNU3OMCxQZxB61s+Rc04CpIQhHtt/2peSNMv4vMUFp/vd9oowrTEa/tuVEJRs7I/mR//obviFpcvfEFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790884744; c=relaxed/simple;
	bh=ZcbqbnyKp/n0WpB7iv3NE32Z90PzMJn0VzjmrHwzo7E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uuRzqFjOet1k9zLlhshkqYJ/Ru4WBlsYuXdTdkm19QcT3EBGsgNPtVXmn0llaSN3U8eChOM7lofrU2l+5ieL5kxGYs4XZ69OLXQNxsjmG9FDZ4Ic2fg0RA/7ab2o4mtC3c/M2aHUSsc9qdxozFDsdsFehA3tDh02mATu7X8L4Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PvBIhhns; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvBIhhns"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a022e9cbebso7497765e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790884740; x=1791489540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j79G9x93qm3T0R3P1TfLErsNrxHPzMPCo5TuV1Ni39U=;
        b=PvBIhhnsEit6xcQz0XNs2cpZv1N21PkUONjbI1P+8mRsKy6OcD3FC0PISN5I9dHOl+
         pd18maols5p/q6fKps/RuzzWaqBQGo0B6mscIa2dBZ0kaoeTdUoNKLuHQbl1Wa8RaG96
         jvLPkTdtMx5oJPg8zh7ccRKjQyUeTXPYWHA4NMgYn3Wm0Jib+yrNxtn7nEjNLQRJIueP
         YjoxXs7A0ac8lCHeY75vwOrYKSzU9Gl3HbTR84Pw4iX00Ulmd7S7byDfYDnEiEGdq15t
         lr4cczp8ExRlIPK5EDgFIH7Q4jDMCVVdZ/+5ngF+OpB0kyEJYQpQtSGdX8js0XTORvhW
         /xKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790884740; x=1791489540;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j79G9x93qm3T0R3P1TfLErsNrxHPzMPCo5TuV1Ni39U=;
        b=X/8ln9RxJOnoi7g/RhgfdRTbV5D4fnrsktUuCP4kFbTUwBvvnWv1EKphm+EIxls2Bf
         sjEpYvt6ugkAtvSC2VaxQ9d9DoRt5/KHFWrt2WDOMLEPYgOZN1tx8VOd8UQF3kFHCIFO
         HkeiSVEcCD9hvZNCctYa2ZZbUVB7/cs6AmYnjsMYHFMPgzY1+n9WuaeA2xk1Yf3QXV+d
         ha83tT7FWu1yzMFnEFVtBAz3RIYrD0maZ4fTgzUxRO+45opmmRPBhBwUDw2hXplgbO48
         e9yJalWTfXN1Trk0CktAvXdDOTr+oUMe+DBJ+n70M172gduyqsDgVmy9piCBsfElWyB2
         u+9A==
X-Forwarded-Encrypted: i=1; AKwUvBx9ZPsT19g9LvzdeaNf89UW3AGmuLCKV0EOkJuslyjFpLKcGXXa/FIJdn66+g7xkLyLs8eS9UXjTKuK1CY=@vger.kernel.org
X-Gm-Message-State: AFuF++lYd6PumQdAO29+0b0mGX2/2qmHJpGUxApkK1y84tanPjLEkrZS
	YprPiAHagW+v05ECUJv49iXdjdZbb3DizKNBp/CjBW2BK+guWw0+yr8Z
X-Gm-Gg: AYBFou2WkfrTJ02b2JuqRAksfdEBExsgu6NVqbbuo8xpcIrBJJFQxKa3mPxoIZQKHm8
	a16QToOYdQT2SOf6/tm7wAKcrAb6dvqnE5QHSJrobGn3KW0H13wn2ymJJ5mwsNn9koUEzzhATOY
	ILQ+yuK2Uw50I4zNqnk2NzRzgpGFS41rOyQXxfleXIfml9Ji7z9ZN1VbHnXETxf/8+AHgl34mLE
	ptR7Yg5rSciqEHui2aFf+yPhieEovWG7NYTZtAMMFipwnFk0eq00hn1PHcZ3Xu2wfoDEmPd7s/s
	dyPG55PlXGyeEOICr92bf52+kltciIhjfpoL/H4F1St1TtPOeyKHRZXp/w5575bWwahaFIIJEVP
	QgEkQmsV82SEKLTIx3UDxTU4K1N0cbBAvUTHkVtU0dX2P80wuaABD9id4BO7KvvbsqiztP47HOS
	rXJviZZNokPBsb+32T/6LLXThpBCP9IOf0k6J0waqqAH5Zm8soOb+wOF5dwgE09J/KeTVIM4ne0
	v3i5a0d2odSNhIduSvaTXTq4g==
X-Received: by 2002:a05:600c:3501:b0:4a0:1723:2d8e with SMTP id 5b1f17b1804b1-4a0274f3bcdmr12096855e9.2.1790884740123;
        Thu, 01 Oct 2026 12:59:00 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276f92d9sm15031045e9.4.2026.10.01.12.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 12:58:59 -0700 (PDT)
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
Subject: [PATCH RFC v4 05/13] drm: docs: remove bootsplash from TODO
Date: Thu,  1 Oct 2026 21:58:39 +0200
Message-Id: <20261001195847.141192-6-maximpedraza@gmail.com>
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

