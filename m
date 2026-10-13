Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D60E3F4DD2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883982; cv=none; b=RoHWa1Jnu5JEFFDPEVRu5Z7AV8echJg3xvN75ZicP7fj4RgQCeVqipzpTnegbdBkf3I6MhiKgGh6nw186HGwZkNQ64R2xaT3WSna0KRjey9CLg04kOQadpxnnxy+c82top8cvT/ZuStnBLTVGBOezcS9LrKHjIFf68ZCw35QK0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883982; c=relaxed/simple;
	bh=aRtwvMv9yIklUEfwA2tgF7gNewrgncEQ/GN8vn8QiY4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l34mfljgQydi9U9Owsh0H4H8JSWu5xvx5mvZSSJ2f5g5YSEw6vCiyCb7DLEonqqb+vmSzTXy6bkKTEX2IXMc6TQbhfpqmpAEEfXYF2VmL0uHRTXXkihb8ZafPjEHE8Ge5RRDXjxUiS3emr5jTx6ay0g1/DlNfBRqQ1CnHG6WEcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r83duQ7n; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r83duQ7n"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso1661300f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791883978; x=1792488778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6FMp4bmsFYk3mzSCH1/ElOs2cwgfyNFSJhXfclhOUCc=;
        b=r83duQ7nXCBb1NxgMViTUYQnb/tZDDGslK4TR5GAYdQxkBIPuLZNmr5Z166cduMhx0
         2VUQCwLEbbuJ6RSNG50hn3BZ60PZmFOcs9+Fh7PQEqS+tq+ow54LyDJE/J8hxjz3RTIa
         9Vk56WZKCvpihlA/fyZ1ZUYXQqIck02WKZDlUhjyV1VF2kcWZgt0lkKUtWbeCGhf/4Z3
         QJJqkUXHLJcELfmudn2bOKjvkKLOndN3/Uzl+m1YAXMvTaOU60JTtqill6b2LVgBU3Kf
         343TU7z3DQa6zu+u8474OAY6oZpI6GDJU12nGIsEntUZnGXDxbocZcoFJC042EryN4PH
         iu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883978; x=1792488778;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6FMp4bmsFYk3mzSCH1/ElOs2cwgfyNFSJhXfclhOUCc=;
        b=CzPZaYw6WheOL0vVsHaiuSmRd4qxOTmF7z/i8IxL2XBwFqfwjyh/xk9uwzlJKhgCZW
         dr9weVIZ7vsgBCX7u656v6nMAU7+tjsAH+XIbbcG4WjVHKHlf+vT5denVefoWXKtxXSr
         NYvVBH0hGRKBaiiNQfBK4Avvji3bhBCmcoGL7jphAiQfNlCkEY0Uh1XKzDc59L+1PG4x
         988DhiVnFxMLryrVNHooxAxWCzOqXGvvW7KvBQbZveh26y666rbOS5DYsJl2VlRt1Hyk
         ESt18KIfqhZ7Xzv/tLrhVIbgDoRJWcGnlEQCXIoI75j+g42ajqH+Wadj+rLUQ8SR8Nus
         qcuQ==
X-Forwarded-Encrypted: i=1; AKwUvBye+OMBWU7DhH1jS9gbP3qBDNHpgw+4Y8QIkAnFj22jaYVvTpRRP3LRaCjdkkIYW5iktKcdBnWpGhBuO2M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKU0J0z4vN1ghTrJ3hiKkX3G7EqRFko1ZX1bHWCiKgIyMboC54T
	a20BCcrZGTZLha7v1ScDuj5ZujrlR+dTFrJ92iKdfOVlWt4qzM2XynT0
X-Gm-Gg: AYBFou3EhSfduP1NTaUHjQfHeffEGumZWq45qbzJCU/zOhFmYSpFAR6blDUYWpg0ePp
	UcR8NUIUSvC9hFdOSbcM54N86TCRV6dVtUruupvKteP1v+FXfjoJirNatNSk4P/75puGCwHjUAX
	V4HeKwrA9EelG4aZNjO1BPFuAqbOXXZB1fazJ9V2Z1gLmsRRrNiZtxiDkAiLgI23P2WSanAJds2
	B77SEjS7ad89Hb4el/A+6BGYKP1KZrH3EA/cU7Qg3dorqiTqnTowvemzpJBEa+e+yEk/ZB/CskK
	Jbkoq4nCB1m0EknJNvbLEd7M1CAQaU6NbJcMzHOzl8s6nha8W4CdoKYl720nlTXMXtk6eBslgLG
	4/1YOZ1F9sKQaBlvKspZoMUR0BdZjDn4vSrjAmbF1TVY3rJxMI0YrzQFpdAI9dI65bdol6qofVG
	IAgAdCJzr/B0TnjQYHDOOVf4AZKBWpmhJn+7KVDJPbxDkIAdnCIGFbhcxsfttpZ4N1aVeddBEkx
	eLQdUtv65d5Wk6wuns4inNi
X-Received: by 2002:a05:6000:4313:b0:48c:77e3:6c8e with SMTP id ffacd0b85a97d-48dbacf4700mr22504037f8f.49.1791883978432;
        Tue, 13 Oct 2026 02:32:58 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm3986774f8f.48.2026.10.13.02.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:32:58 -0700 (PDT)
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
Subject: [PATCH v5 04/13] MAINTAINERS: add entry for DRM splash client
Date: Tue, 13 Oct 2026 11:32:34 +0200
Message-Id: <20261013093243.505776-5-maximpedraza@gmail.com>
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

