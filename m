Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AD244BC94
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751586; cv=none; b=PAcSHcQbNao8V5m31oxxhkqcyVps7pIkItXAnl+E6VC0UHl8OekmPR6un/mdY3ubtwGRh3wi8BHOsLtF620jZ89UPFxdC7BtVWRNRnKDI7zRLH3opjwcI8uO7jNhoiPpXYFBse096XSP6lsTrRhLfW4gKpoRUj1UE69lhbQzh7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751586; c=relaxed/simple;
	bh=zGQ6oA9FdiLwaGDeIJ/lMi9ihRSaaxgnDKhhGJ7zVIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nEcznwyhptLeZxRDlc731YNvjeMA9rBgVlNrTYgZfqsrKGIbXpxvlXBotccp03Qk/gadfp+sGbKxr77m17VaCI0olZphNim7/cXSs/WKM9GNqySTLLWz6eaJZiJoGGi+2HuBkYWxGHzE0ey+cShYWYtxVNGK1bU53ZYDW5PSey8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MspFUoW5; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MspFUoW5"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d747ec6188so23966615ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751559; x=1791356359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XY/E2j9XnFuNBK9WaF/nFTrbzu9uvpf+6HkIq2bPSfU=;
        b=MspFUoW5A/RFeFFuPjzSbDxh071aZl0nNu8l/YK8BrNfoiRfq4PgI2kpdrtpgl0mgs
         N6oL9FyuFoX/vBOkDfsBnkbPIVojhGd11E9E652Gr9YLHf8Pfuu5feRBtcaowosZWH1c
         CTaCrCGFpXS1AhKzZDyU195vnms3coN2nl51O56sfI0/COuLHiiz88uLOHB9YhftTNJc
         m7MrfiPAcknPQ6wmtyfOvlqYdGM5UJ2eJmwijHT1cx7Q4B1/9SW/97dZAykcS6Zvhe/7
         Y3tge84NV0u0+tGUwcD8nUZNw8ZieJh2f9x2DichxFWhlpzkj39EcaMlQECL/avpniw/
         2qhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751559; x=1791356359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XY/E2j9XnFuNBK9WaF/nFTrbzu9uvpf+6HkIq2bPSfU=;
        b=PYQVPnYZE532cyuFFqGRHnBFXPrPECZaowSQMBePXs5Kxgjlh8T4kjW0medPygtfq2
         W/ncI88f7qL2QsZjC0VHJ8IvmfXBNlw/sZ9UV0QN+/xkd91VdYpHpe5/XcERwxQMqXZw
         +AWf34oe4wXEE8OF5m4uQQIneqda8d32RkNAHOR1X6HCY2SHYngVc3P1S58gGjUIFJel
         OOmznJvIxC9KZwK2PycZ1WnR6RHej+Q14zFdBaAUtXqi8mLqoo6Q8zny78Lu3m49LrOb
         kaw+IvTmQ7Zx1tVfU6f0xe97r2kEoKDlB+0JrJg4G3uXJgkFlGXVyeg/txazpLwmNdmN
         gC4Q==
X-Forwarded-Encrypted: i=1; AKwUvBw3nNqVIQDt4TfxrsC7A26qzcJZTHiQ8e9kYIeZ8PWsL42Dv1622fib5GrcK3XH+qVocBjB2fGB0Jhj8QU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzCCe2OCn7uJ52laBd851ZXx1/oHMHcQCFby7ROl15ev1ccV0f
	92B6KPRmogGGfYYU/U9cm4xKkSxL14iJ6P12JTDM/1vliHNIQ+8QLS9L
X-Gm-Gg: AYBFou2FUgQ+Mpit6cmiFJXItX2JAc7BErUYWsIGfKyrWbBaf8g9V8uF7qJSWLwVFtp
	AEZ7zdMyQiu9jL9Ytriwzt8GmIUe6FQ0IkkUQhNnziTAmFKLADeElcPSJQz29HkbgXZJ4eceJYu
	qFCm+9B+xzwzKB5P83GQRZ3GI1tci7k9S23BFaoCUB+P+5mxi3dWTsa8DkXaPH6SOyM2FlTZfPp
	KlG6phaeuQhTlo7022so3wS7GHqy8haLE6koOfiIDJZVgPcTXmlwM1blVjdAK0M2zczc/5Ruifc
	MXp/gtjSpyW7VRhFbh0Ifo/mWpc10LDyO/4r+KS1NCI/t53wduQOgv+9qzAN3ai3HmpmXCCKCgi
	cU+5/PcbVIPyBFjL7itQblp3f2UmI8OBk4ARnCoXab+wQlYrd4Kl/z55s6MtrddreyXobPbgEgx
	mitdEHHgQ5srdYVWBoZWHgFkXsBrZf72lWE/XcVWhwXQhAmgbpKlA2Cl3/wmkTpNo4J7kbVNWnk
	kSWY4a4QkhbLKTrUme1hF5G2Po6XWtX8KTNGk3GzZXYfCZRqVFuUfG++gGpyXJ8IYc5oO0Ol5/o
	Hluyj7Y2qA==
X-Received: by 2002:a17:90b:1e42:b0:39e:6c69:f476 with SMTP id 98e67ed59e1d1-3a4d18c21bfmr485055a91.53.1790751558947;
        Tue, 29 Sep 2026 23:59:18 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4cae9ffaesm2010442a91.16.2026.09.29.23.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:59:18 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v2 3/5] drm/gud: Prevent shadow_buf UAF by flushing work before reallocating
Date: Wed, 30 Sep 2026 06:59:12 +0000
Message-ID: <20260930065914.393939-4-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260930065914.393939-1-benquike@gmail.com>
References: <20260930065914.393939-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In gud_fb_queue_damage(), freeing gdrm->shadow_buf on framebuffer
dimension changes while the asynchronous worker gud_flush_work() is
running causes a race condition where gud_flush_work() dereferences the
freed gdrm->shadow_buf during a USB bulk transfer, triggering a slab
Use-After-Free (UAF).

Flush any pending background work (flush_work(&gdrm->work)) prior to
freeing and reallocating gdrm->shadow_buf when framebuffer dimensions
change.

Tested in QEMU against Linux 7.3.0-rc3 with KASAN enabled by queuing damage
on a resized framebuffer while background USB flush work (gud_flush_work)
was actively reading shadow_buf: on the unfixed kernel KASAN detected
BUG: KASAN: slab-use-after-free in gud_flush_damage(); whereas with this
fix applied (flushing pending work before vfreeing shadow_buf), 0 KASAN
warnings were generated.

Fixes: 40e1a70b4aed ("drm: Add GUD USB Display driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
 drivers/gpu/drm/gud/gud_pipe.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index aa7792966287..f9726e3d849f 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -397,6 +407,16 @@ static int gud_fb_queue_damage(struct gud_device *gdrm, struct drm_framebuffer *
 	struct drm_framebuffer *old_fb = NULL;
 	struct iosys_map shadow_map;

+	if (gdrm->shadow_buf && gdrm->fb &&
+	    (fb->pitches[0] != gdrm->fb->pitches[0] || fb->height != gdrm->fb->height)) {
+		flush_work(&gdrm->work);
+		mutex_lock(&gdrm->damage_lock);
+		vfree(gdrm->shadow_buf);
+		gdrm->shadow_buf = NULL;
+		gud_clear_damage(gdrm);
+		mutex_unlock(&gdrm->damage_lock);
+	}
+
 	mutex_lock(&gdrm->damage_lock);

 	if (!gdrm->shadow_buf) {
