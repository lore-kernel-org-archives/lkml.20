Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792853551;
	b=tJZvvzlmPsDT+3PhmQbQuU7VcZvWw1QB1GgKYUlTTxwN9axsn4NJylDfFZ0WA4uVYlmS
	 eIJBGYGkDi+DEb/YjwrOtpZCezoHW2Eco1gz7iM9N3c7p2VuWnuhL5cYDHxNCZ+84IiCz
	 Q1iXJk5H83D1Db/FvG/jPfIL5z2pGtEmzYA5t0hELUvQg9ODYIEoYxFtTZupPjD5hVb9d
	 qvpq5XY9DtWHw46NKXzmc9W29J3lz6vLnqXYsTA9bM4HqTQqFPs3UFAyOJM+mhQjLCJHz
	 R+C5p0sTS/Wb1N+AZdjhc5AW1lSI8rUxK6M15HABuTS/YrEpIkkKxQ81xYGtD577Uew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792853551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=57cgpKzuG8iviQVEnNlM9P5mTIL8ivtwm96zaTpUOVU=;
	b=ekdm6M0QIrQV7CH19zrSQfPcZCYPSlvdPGJzX5Q9zbxJC0r4oU6u4eGBc+opw9l3KbQe
	 C5tu9/8QwEgiwk4eizq79qJv1A1LEqEMDZ7/41clfzJCIEbnEMF6ttJA7glXJwGJoOmWx
	 jRh4MqU3km7jB5aVY+p5kqoCkK95YsE5ngkGi9GHIW5X+/lBzKNaZWwRHJRMFOvQcit9W
	 sZyyGNo2mfjVlvhR7JqBvv6F23BwAJlzTAyj2EP8AaHlcT0vKlJXPt8ozUfWwjrFPwcH4
	 hTsjZOltssxYnu9AcjBFk5CUvFdRJITD6+90cF3+TewZxx6n7BlHZ7VCfXVsOyuKluQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jgcdehew;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF4F606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CF4F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jgcdehew
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1356843f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792853550; x=1793458350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=57cgpKzuG8iviQVEnNlM9P5mTIL8ivtwm96zaTpUOVU=;
        b=jgcdehew+sr/+8V1Btu38dbiwFtLdTNE9TZ3tmU+N44ZSZTi1BxT8br4h6ahD8PhHU
         /QL/nEdevW0b4FCzIt9oIDWJOwnMg1pya4GMg/Zvx52SJ29vYNZS9RJ+l08+nHypgEVI
         fZjKxC4zrmhK5N5xwiPTtrMSBoUUYeIBC4ED6UlGypYopXyArmamPNgxZdJ51mylvYio
         j4LjHdMt5Z6ZDJSFXtZDUhiHXYDzcfzGyablfEdcIUnuAmqjAEjTZlZKSIJWcDdWxNBR
         VZ7D0JLH4E+vfSJ8ADHXT6EL1yzOZseuRuIwPzXHzFmDjcvwNxzGsXr8xOcNj6QwpLdU
         fteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792853550; x=1793458350;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=57cgpKzuG8iviQVEnNlM9P5mTIL8ivtwm96zaTpUOVU=;
        b=wXeRi4isauVh4zvTrU67ZaybpwIU4x1+PZ0TASBhvzkTln38dR6S4bMXuzXtHs9AGE
         zPtK2e9KcCfyegpoCaCKATmdDZM5l4aFB4L/dDTIP7FvIEcKqQaWiXCSrHfyh+Q4RxcX
         w9EYGzDa7bI3OpB6bT+ny+9GdqXt9er6bBqE7evjy1MZUafSmilm+dcK2h+r5tEjG7R0
         ndyMBRzYuQ0d4W9iVfoSeSOYNzWkeb57cDsAWqwUf3i69tM1j/TLR+Ks6VPO2e30x+tf
         Hcu9IGedaaT+sqEkYRJHeKQv16ZziU+oi04P4kBmcl96vNA54XeMXGIkXrM+dZyLVGFV
         VRUw==
X-Forwarded-Encrypted: i=1; AKwUvBwY7E1fKbXU8C93bUJRB6UcqdjdQ6Re4n1vbqtbx3dxP3CV0gpU4CzE/vPgdI+nkuvIqFnUZk2o95+l1Tw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTQIcsCL3Geme2c1axRfwGiFP2txHGS71nEwXtM6cNj9V8aZeY
	CZetgw6CgiFvJe1cfSsTl36DdY57jPrWJyattjU1hpLXUUTon3M4RZ59
X-Gm-Gg: AYBFou1L99adfxnO5bd0g3nr/uPicGCUjfgUwSy0crlyOwCCoExNffWAnj6n45CFUnW
	238MFbzvy74EUu5X9TD24NHOPdClwbx4hXycJyo3FugHafDceg+MjPp1ej/5QwsMucqbTQJPK6T
	cfHc/mjYJ7hwkoZtZNSuID5IrCDbm+4efPPfx7suvgL5UM2crxybiyVL5EPV7Lx/t+A1ypObk+5
	kN5h5/HVV4OPUlwMNHGqd5vzBzXV6jQqh2uxjOoydzYELYfYfgYuo434nSwGk5mgkQCEB/fj3em
	Mew7NH0rCDdASu6GMOguLAFsOAmig4z4R0PWMea10glpvQau+zOQA539BeYdhrnttJJyx6zx3qn
	KfaeDMMSZ4Aap/girbenhP4rOdTN+WhqLUH3FyLdSzhtKM7AT9NgiAHfhGv3efHxW/2765zBrhz
	ugYwd0MCvgFmD1rBnIjPvcMQ/bvzJKzOyPDrBjBa+IwLdAtLzcRBvuu55pDcGpaxD58+a76RqJD
	VhBun3I2th0gh7kViuQmCmzdFPm7O9IjiutM2hFPCrhd0CsKtlqkQ==
X-Received: by 2002:a05:6000:41cd:b0:48d:f36e:ccc0 with SMTP id ffacd0b85a97d-48e3eab5794mr3799228f8f.0.1792853549728;
        Sat, 24 Oct 2026 07:52:29 -0700 (PDT)
Received: from localhost ([5.83.201.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f248sm4620940f8f.6.2026.10.24.07.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 07:52:29 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sti: hdmi: make char * const array en_di static const
Date: Sat, 24 Oct 2026 15:52:27 +0100
Message-ID: <20261024145227.1193775-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only const array en_di on the stack at run
time, instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/sti/sti_hdmi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 7ba9e0b7ba6c..63418732daaa 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -647,10 +647,12 @@ static void hdmi_dbg_sta(struct seq_file *s, int val)
 static void hdmi_dbg_sw_di_cfg(struct seq_file *s, int val)
 {
 	int tmp;
-	char *const en_di[] = {"no transmission",
-			       "single transmission",
-			       "once every field",
-			       "once every frame"};
+	static const char *const en_di[] = {
+		"no transmission",
+		"single transmission",
+		"once every field",
+		"once every frame"
+	};
 
 	seq_putc(s, '\t');
 	tmp = (val & HDMI_IFRAME_CFG_DI_N(HDMI_IFRAME_MASK, 1));
-- 
2.55.0

