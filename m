Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A0418FC80
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 13:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792242056; cv=none; b=m2++PchsFNC8lg83SvLhawy6MUHRj2IjLKr30Or2QxXr2mmXiFhyRFb+wfZ/B5jsHYfFzchl4UY0Olfsz755QoI7E6+9k0nhAZQU+9Pq11Y1aVPUgM72ZoGDL8wXd32rlYoIO7DW5FeitrHg/OpNn7L0styttc7VegO9HwB6lKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792242056; c=relaxed/simple;
	bh=u+eQJbhLth+JIVkOlrxS5/92+zPHAqD9bsEscA6yckk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XMFhpXGZhaTZ6dYJ9cfrAy+fJEg88fxEhaLbNjrhtdQwri3BjfILwa7Yb/TJ2eWlVVOeNpLOgikuZxXcVNmvE4ASQnlRmOG871NPXBsTqUJ6Y8uhWHcMP7bTiVcpMjyWzLjDxzNFREMA0946AQwd5UsuLi5qY056TTb7pfCnE5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gY/1x8E0; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gY/1x8E0"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6aa046a99c6so131115a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 06:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792242053; x=1792846853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=legVIwX3VgSLwP32JW35R05ueTk+mHVnvshzarqz/HQ=;
        b=gY/1x8E0kqt51eeCNxvf/ympWhsO2XeifJPGPQcYHAf9X6ecQeP8XwbTUJd4LTQAmN
         c6yWxHi0Qn5rOtQHP7qTJ8/f1ON5eIOZ9JeSVcCVfud72Vbjig0cG3O1umAcEXxi95dn
         H6STDPb1vDjFAlVHfgt6zyy4K6M61H2Z2+eFmW1S+1AKMrGN8SOywwpd+l9mgyedwY+w
         HQjAexBw1P1a+P/ENXzQMiNbs8uSFyqKYHGrEAMyAsnZndCfcZOYy5TfeOISt8IGeQUx
         g0aIXT9SyfPP9hwEjfDHXljcKJZk4oQr/TwOWYJOETZNGKc9pVY0vpN1pWzR0Pr7hZJP
         02dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792242053; x=1792846853;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=legVIwX3VgSLwP32JW35R05ueTk+mHVnvshzarqz/HQ=;
        b=JeJMPdhO4KgXFTuqbaA2zYGeAq7kBWn2b/qYozPdo3oN3W8pju+meiIMSmqvUOJ1LE
         T+H70N2W1Xq9Hnri3JuSFk7mFzBrMcGUdZpI+Qb/iolXUuyki3He0VT3VZrhQO/EMR1q
         1ggmjyKkSsz/c2uXwyezPt8MysfwOjKf9eLzD+//HstxAvNiJMQYAP2r/rQUWSQlprMU
         87mtP3EWarjuaPsxlD2C9uZxzLMhcz48+wPY3BXrq++qiTGnUjXHYV4MM0QjkY9VKTAG
         PlWBgF/W1xkrv+5L9iVScVuIc0BdGwLpS1uqtugC8ujpDh5yNL/6nHCh4vVVsLCY2BYu
         JjFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlUxMH0fv3AtA3TremyY/+9AXXn8t1PJ0ZxT1nS7alehQbztgFizOkyD5ff3WFuBsYXV9yRwT/fwlU1GM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBAtHhmdloB0iEcnkk/jzZRxtmHOXVGS5enY0b9Jzs5fD2cM9n
	7mQd2m/1/RYhcO1YbDO3tnCnLjR/GEO/2UZ1dtkEnBinxOQUbMi3aAfx
X-Gm-Gg: AYBFou3K/tiHg9uurRsBvFEOfrpDYxld3bSssPX6VdSdTWv8nO/66g+6PwywVZWLOID
	nkjpN1qq6rig2NMQMF7EzhTlMSE3Yixwtp0d+4rcFLyR7x4sH6eQ1ciP7GZ4/EY7HP6NXFlnANl
	b8GPnGkLSATM/XWkFrcW2DjOLB2N1fmdDw0mQmM05jnJJAzKcPEbZPc0zZKU7ClR/fPrRhi16Rp
	VH2ki8PQMqbv6Ow4jK3TbZpgX4I+C/7HYRP9nxwIeVT9/L3MEiIMJ9AyPJ+sMIR+bVInlolILE+
	D07lUqVCFyp61AykxEng0ScxmtG4BGEzoENS0QfkNcdhbOWEXvtwbIyxhIjVMixH99wYNUa9JOY
	OvMShmmyqmp/iR4gZQoJ0q5A2IZda2LFM7ZwOO/9aZKJx1UX3ft80Zet3O9c3LcVABAL2Yma9Iy
	ZpmwzzTLo6PAXGsO5yug7UvU2MLpoCRrC4ovX8rYd5tKCaQZbKEiH09vQREoso8JqhcnTrK5+Va
	c4Z43ke9fwpvTI6k9p46g==
X-Received: by 2002:a17:907:2d87:b0:c2d:bbae:703b with SMTP id a640c23a62f3a-c419b917404mr204323466b.2.1792242052720;
        Sat, 17 Oct 2026 06:00:52 -0700 (PDT)
Received: from Nuel20.localdomain ([105.112.97.113])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e328780sm174827366b.6.2026.10.17.06.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 06:00:52 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	paulmck@kernel.org,
	rostedt@goodmis.org,
	ast@kernel.org,
	peterz@infradead.org,
	gregkh@linuxfoundation.org,
	emmaonana18@gmail.com,
	abo@medichon.fr,
	skhan@linuxfoundation.org
Subject: [PATCH v2] drm/amd/display: remove unused cgs register accessor typedefs
Date: Sat, 17 Oct 2026 14:00:46 +0100
Message-ID: <20261017130047.42080-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <981f01e1-0c3b-4854-9d72-8bf22af9fc64@amd.com>
References: <981f01e1-0c3b-4854-9d72-8bf22af9fc64@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

kernel-doc reports prototype mismatches for the cgs register accessor
typedefs, e.g.:

  drivers/gpu/drm/amd/include/cgs_common.h:89: expecting prototype
  for cgs_read_register(). Prototype was for uint32_t() instead

Each of the four typedefs is used exactly once, as
the type of a struct cgs_ops member, so they are merely an
unnecessary layer of indirection. Drop the typedefs along with their
kernel-doc comments and write the function pointer types directly in
struct cgs_ops.

Suggested-by: Christian König <christian.koenig@amd.com>
Link: https://lore.kernel.org/all/981f01e1-0c3b-4854-9d72-8bf22af9fc64@amd.com/
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 drivers/gpu/drm/amd/include/cgs_common.h | 60 +++++++-----------------
 1 file changed, 18 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/cgs_common.h b/drivers/gpu/drm/amd/include/cgs_common.h
index f40b6a03fe63..1750401c7d08 100644
--- a/drivers/gpu/drm/amd/include/cgs_common.h
+++ b/drivers/gpu/drm/amd/include/cgs_common.h
@@ -80,43 +80,6 @@ struct cgs_firmware_info {
 
 typedef unsigned long cgs_handle_t;
 
-/**
- * cgs_read_register() - Read an MMIO register
- * @cgs_device:	opaque device handle
- * @offset:	register offset
- *
- * Return:  register value
- */
-typedef uint32_t (*cgs_read_register_t)(struct cgs_device *cgs_device, unsigned offset);
-
-/**
- * cgs_write_register() - Write an MMIO register
- * @cgs_device:	opaque device handle
- * @offset:	register offset
- * @value:	register value
- */
-typedef void (*cgs_write_register_t)(struct cgs_device *cgs_device, unsigned offset,
-				     uint32_t value);
-
-/**
- * cgs_read_ind_register() - Read an indirect register
- * @cgs_device:	opaque device handle
- * @offset:	register offset
- *
- * Return:  register value
- */
-typedef uint32_t (*cgs_read_ind_register_t)(struct cgs_device *cgs_device, enum cgs_ind_reg space,
-					    unsigned index);
-
-/**
- * cgs_write_ind_register() - Write an indirect register
- * @cgs_device:	opaque device handle
- * @offset:	register offset
- * @value:	register value
- */
-typedef void (*cgs_write_ind_register_t)(struct cgs_device *cgs_device, enum cgs_ind_reg space,
-					 unsigned index, uint32_t value);
-
 #define CGS_REG_FIELD_SHIFT(reg, field) reg##__##field##__SHIFT
 #define CGS_REG_FIELD_MASK(reg, field) reg##__##field##_MASK
 
@@ -137,14 +100,27 @@ typedef int (*cgs_get_firmware_info)(struct cgs_device *cgs_device,
 				     enum cgs_ucode_id type,
 				     struct cgs_firmware_info *info);
 
+/**
+ * struct cgs_ops - Common Graphics Services operations
+ * @read_register: read register value
+ * @write_register: write register value
+ * @read_ind_register: read indirect register value
+ * @write_ind_register: write indirect register value
+ * @get_firmware_info: get firmware information
+ */
 struct cgs_ops {
 	/* MMIO access */
-	cgs_read_register_t read_register;
-	cgs_write_register_t write_register;
-	cgs_read_ind_register_t read_ind_register;
-	cgs_write_ind_register_t write_ind_register;
+	uint32_t (*read_register)(struct cgs_device *cgs_device, unsigned int offset);
+	void (*write_register)(struct cgs_device *cgs_device, unsigned int offset,
+			       uint32_t value);
+	uint32_t (*read_ind_register)(struct cgs_device *cgs_device, enum cgs_ind_reg space,
+				      unsigned int index);
+	void (*write_ind_register)(struct cgs_device *cgs_device, enum cgs_ind_reg space,
+				   unsigned int index, uint32_t value);
 	/* Firmware Info */
-	cgs_get_firmware_info get_firmware_info;
+	int (*get_firmware_info)(struct cgs_device *cgs_device,
+				 enum cgs_ucode_id type,
+				 struct cgs_firmware_info *info);
 };
 
 struct cgs_os_ops; /* To be define in OS-specific CGS header */
-- 
2.43.0

