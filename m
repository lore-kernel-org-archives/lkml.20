Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509594;
	b=lHiRU5XbGFqypa3SrC2R95au7WsowmZieEIE578twWnHAzc/NBvVE09vb9bBf4bZRgjJ
	 oX0bPhBioXqGdPnrJr+Xk2npmxU/sHRgLgvdd4ExqNKlJrXmtJGVWJIRuhGgDYFfNZjVf
	 vSUg78PI/QMAIUtrZfCisuyy4icJjk43ciC4N8mbXHlE5fcwQIv4ZO66d1tFFF3JIbbY9
	 oc+Dp0J2qHg0XuQb+xQXk7E7jBi/ASBh/XBxiNHWg+5ceMxZa1bK+ke31oHcz2uzZVd59
	 43jTFLK9rslyXIzxWaWS6d6+vqjNazreE9HwdkFh3ANJYbSa02XoA9r0KmP7vfJuJkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KlEtfhBXUX7O98YWsvuju/yUjikM5NzbWYCqPri8rV8=;
	b=G/AsB35Cz5RxaeBYuGIerq6qZXzcP1Oq3V5k2cwh2oMusCKy17asdgnt4ZWsRsaJ3Xe5
	 blOCplCucMLbqlXn6jKPhDN/AVEHREbU2aTdCbfOV8D4PN0TUM8sGZcLfWgHbVC1Zyy6F
	 8NDK8x9trZOb+fg+NDlTpGX90aWkShM2K5H84bn1upPPiJgKhEytbH39CTaF3hiBd78Xb
	 KX0NCChUGhCLVk2OdluGqOYWaBxGMg6tk6tasUoQMU+O+WxIqn2qTQq7lVPzqiKvhhlI6
	 U7SHtoHPF+MznIdLO2EjtFJm6yWR77AzgAecnkrIKfuuaxStgzdagH6AdvuWDOEU2tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=neat.no;
	spf=pass smtp.mailfrom=neat.no;
	dkim=pass header.d=neat.no header.i=@neat.no header.a=rsa-sha256 header.s=google header.b=fd1yXzNs;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888A860A2607
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 888A860A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neat.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neat.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=neat.no header.i=@neat.no header.a=rsa-sha256 header.s=google header.b=fd1yXzNs
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1921063f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neat.no; s=google; t=1792509592; x=1793114392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KlEtfhBXUX7O98YWsvuju/yUjikM5NzbWYCqPri8rV8=;
        b=fd1yXzNs5SfwVSM9nkh/zVTaxDiR4kYgztjVWLSA3SQ7g0RJ5ylVBvbB6DeRBZnf9p
         VBw27X80urL5rAT2jWx96gdYrlV+kz+EXTAxkNBbL+sjeV3xT/tKK2IwoSYQIz+J1CsQ
         hG2e4tji4ITMRawJ5+gVkACLqe+91bfxtBEHjeuuim5YQ/NUmzOnTFibnvfd9QHo7Qqu
         yS6AUYYPxONMzGHJ2NZZTU7t07Nuj+V7cu5gsDh5fTVRN9SkQ0RavYWCFEPKkc3kZlYT
         vFuqRCibWoa12CvSHgQBWvCqNhNzv/8hnklnaOx57DdmlZ2NGUDFlN7iYrBHmm0asgww
         /H8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792509592; x=1793114392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KlEtfhBXUX7O98YWsvuju/yUjikM5NzbWYCqPri8rV8=;
        b=GUhKPKgt/ZyYpuNGcQKxT2/fFMloQtLKMounFzCOil4qTJN6obqEeMgV0z5B6juoUg
         VdKrhmYFMaQx5Zmn8RK5uIQpJsZd3epccd8SZgGGrW8KOJJPGKWDTypV2yCd6ItSQHJQ
         cCJsivsmsO9RUc5QJp1C9SL+td2OU0gpcL2Te9h5wGg4sOLtzgXB5mVAOO/3UVhpaUjp
         TBrzrqG84BwlUuceafh5Hmxt3K1OW9ELqbbB9SusljoK1PZKZ5xfbGI9bPulF0DpTmos
         ix9Ujs3xmhNRZ8oDzxC5j+g/ZjujAAoplmlyeAY2xjw/d3sBZuYBIsBKQTg84Dwftbfw
         obZA==
X-Forwarded-Encrypted: i=1; AKwUvByPHdw2PRNQYPs7sXBZfaTOiEEZLd0rPIC0eZ8cjZQzdEumwxmXTCHZctD1HKbpeGMnGDDmbwsN2AASJnY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHio79IloczKfkq0YblO7AKLA1vkxP+o1s/VWkYiGjA7oXXgTw
	9viJ2QTMWXMmmlKs+L64HOOffT8o9662K1hEgF8RcLglrPTRB5mrIGN1LS0L5gBv0Dug2pGlH1V
	hx4sjvJxeiQr6mI6pKMn/U0Mr3wTuzxfKTVzcC1aZEGGXaup8/AAFvESaqqqjhjUHru+qDZfo9u
	JDAsfDjW5/0nKeq0il/o10dblszviq6+UMV/XpwEshG6G7l7Lv/bPLeGjNqTdOG6R0v2XygrdcS
	B6U36Hx3HM7ME5Ivag=
X-Gm-Gg: AYBFou1/xZjPBgqPGS9Y79njZma9jXLP/kbIcwKWLh4NMyuO9+WW/qt5VzeHF8Nnvv8
	IjE1U+l38Kc0PitfwGFBDpEH6H1kh/sDlWuUs0du6Rskva9kswGbNs7UbdlfSdoBr1iSSMUCE99
	qSrIFCbxySqvk4kIqStjEnbFpuzBQ+XjOfP50DA2taBcLweMPd9vEFE6ntvmzxNeb6aRxB2vgKn
	BsN1+N5rwxsARwFfwabwzbIww50qLp+AuDJymQtJs9gQcS3q1Ln0Nr+9+pVcDfFL2Rp9s3czY1I
	3r3m3hkG39WSHxaYx5FgvF5yrmrqZ68UA8B8Tj5iTVJ0yRAvArxzNKHBpJUZu3BLUOI8zcBM+bM
	bSOl7QFjrjoIo+0gXYuNGkZE8fHONClqm+Dpa0+bcbo9dIE6AC95WfbFXnk+jSLGPPn1c4D87d6
	x+ywH56BNQ7uojn97gk+6JsDet25HjsM8LrbC1gxCgOQDprPtCuDqrhgEKIIUXv34htcLIEZT0u
	ufc+Xs=
X-Received: by 2002:a5d:61ca:0:b0:48b:10af:f85c with SMTP id ffacd0b85a97d-48e07fcda0dmr14392093f8f.37.1792509591741;
        Tue, 20 Oct 2026 08:19:51 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d817d80sm7410663f8f.26.2026.10.20.08.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:19:51 -0700 (PDT)
From: Lucas Tanure <lucas.tanure@neat.no>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Dom Cobley <popcornmix@gmail.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] drm/vc4: hdmi: always cancel the scrambling work synchronously
Date: Tue, 20 Oct 2026 16:19:47 +0100
Message-ID: <20261020151948.83459-3-lucas.tanure@neat.no>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020151948.83459-1-lucas.tanure@neat.no>
References: <20261020151948.83459-1-lucas.tanure@neat.no>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The scrambling work re-arms itself every second while a scrambled mode
is active. When the output is disabled, the work may be executing at
that moment rather than pending, and delayed_work_pending() is then
false, so the cancel is skipped. The running instance finishes after
the disable, sees the sink report scrambling off, writes the SCDC
scrambling and clock ratio bits back on, and queues itself again. The
sink is left configured for a scrambled 1/40 link that no longer exists
and the work keeps running until the next enable.

cancel_delayed_work_sync() handles both states: it waits for a running
instance and blocks it from queueing itself again.

Fixes: 257d36d493e9 ("drm/vc4: hdmi: Add a workqueue to set scrambling")
Assisted-by: LLM
Signed-off-by: Lucas Tanure <lucas.tanure@neat.no>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 2cc46036f11d..4a386e053d3f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -843,8 +843,7 @@ static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
 
 	vc4_hdmi->scdc_enabled = false;
 
-	if (delayed_work_pending(&vc4_hdmi->scrambling_work))
-		cancel_delayed_work_sync(&vc4_hdmi->scrambling_work);
+	cancel_delayed_work_sync(&vc4_hdmi->scrambling_work);
 
 	if (!drm_dev_enter(drm, &idx))
 		return;
-- 
2.56.0

