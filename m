Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566234A0153
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788288995; cv=none; b=Q6DerWPYZBr0HZ9rBYvqFfEzZYNp8vsVGzE/YfoX6R34FW6/qB8jMkDbkkBFe6Y/nEcgC82YkmVYSSbA6vozQSDScrLJr22XuCVO8AqIalOuWC8rCB36oCTsolNPK786oJrYbqq5r2gJV7NH0Fg5KboeWBACz9dHAdWCPI+/tXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788288995; c=relaxed/simple;
	bh=7KrXHOp6zx7Jw6ThttjXtk/cJjaQTyVHIQRYMzgXhRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EyyEm6oGn6HjXIeNJrZRK+HisGrBzE328tGR46mGQfbwi8od/LLQwFe2/1900A1Zl1te9KHXfwGtoDcONY8Ll9NBln2S/BoF0XgW87YG/Un8Y8tDZDzsN9u+4tGK9BGbUiZLcz952qzWeK4bpPghT+yVDp9KNV5zbi4Vt6RmbQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxG95JWR; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxG95JWR"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-446f87b6de1so229477fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788288993; x=1788893793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NDIKr9yFcCSAzvW2dhM+SCgv0HZ3qnZUYRj5rrauH8A=;
        b=BxG95JWRuDbVZwkeB5Y5c5kbAdHVZyPsZrnyTEuQMw+sto9v5T/sJQcuU9KQhpk+3K
         1nRCOfPFDDbYhEoejU9OUWHLV/NR2KJ4Vp6U0wm+1o27s3TaTLw7QMIe4nQ64t0wVYTn
         xLmRYaiO7UWYlf5+FmbwcT0syXpLXKlR1U9NXZCinvwYgL3xuBWYxsrDvnTkgZMVA9ar
         LEqLJL+S+IXU+r6atT4xfRg4Z+37uIdFv4VjZpki5yqRzbXzewdAKUmoWDIov4ElRl5G
         x5r23Fv0akaDYvzGXn5mtNRZwu14R4NX74bM+dZXW5yogMe7DMA7imOiWOMqtKAIuC+s
         3YyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788288993; x=1788893793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NDIKr9yFcCSAzvW2dhM+SCgv0HZ3qnZUYRj5rrauH8A=;
        b=QPUXBKXcKf9Mno8QZOD7VQvieckAcxZsprvDczWiqFHITI+qWCcfSg57F+CLn2TaWC
         VyXgl3ojXO1eXFJ3RANAIFk40YR7NJ+ETszIbC9tbVWzSg2M/c6Xd0bFJUsWYXwe7uaX
         AUazXIsQtE4EtkahTIzoIQL2ePubpGO4nNKSPlGcRyZHU7RkwAFdxZQRO11Ip5JitXon
         kyBdJK+8GcCQ2ie9sTHPkufdN6fQ7wcm2z0yMXPyxc3rmuO7HS5MXPfQu16ZyJLQZXgj
         jjQWzma+WgHSF0RX3bSu+iMBkTMhgoy3EtEFEC+XZ7FKmmwu5hVXWvkFzTqlPJ4JCnDi
         nwfA==
X-Forwarded-Encrypted: i=1; AKwUvBzC0wyxquJcJxrga71qwGhe/jzuAjgRfHs06DQ2FzEd+lMwK1Y7e5ClkKArQOzZEOnr+e7PJFFWUXaC7UA=@vger.kernel.org
X-Gm-Message-State: AFuF++meU0qJeAGLqdjNjfBXN7XsmLOk6mIXWsSrI8592jyu53m4rbPR
	mv+HefxdsCvZ8KiBVOm6GCqk6o3ELR9/O8ahsKoJr9i8SXmq7EfZKXCd
X-Gm-Gg: AYBFou3kV/7wWGz09PWlAWldxsOXSzfeMMyqcr/VEdR0eU/gdclF2OUr/aqcFLqN4/4
	A06zYyWaWTw5sIaX6P9q7+kP5H5ETOlv++Qi9pkVhZXrfT74L0tS1DwkdMZ+4wZKvt9tFCJ1ygb
	E/RWEbc+CK8nxgPyTwDVTS2qvh0MBM1RSbOTD7smEM7EUuxUS15crnZpTRi6t/AhVdux4KcH5ec
	xSIL86Q3zV66dioI8rDyGsC3RFZlTExE63Yh0aOthLjO3Vq+pfWP3VH3EkTyHQm4v6qXx3QY6F9
	26OTtzZEDB4DvgPs/3m/6n0+YK/lPRrqeQ6/asFXX4iZmAsqoIkrfkNVGbG/q27gJYAPemse5fB
	cwwLaauPdpHeorpdeRtC5TeCbRARxUs5Y3barOmbnrxzIqZLvCfsElNXa9Vzk1H4f7UlPDP5goY
	MRrL0ISU5MwUJojvjWUxq5tzCF2YmeLVa9vC5ni0dFaO0nGXkBgBQdHnMWlOp1WA30IGEFZNv3o
	6gIVQYCbn4GZLQTXVOXOqjsR390Fe21yVqkcKmmYxbS/bc=
X-Received: by 2002:a05:6870:c20a:b0:44a:e965:b9cf with SMTP id 586e51a60fabf-46af57240c0mr10645373fac.14.1788288993098;
        Tue, 01 Sep 2026 11:56:33 -0700 (PDT)
Received: from memorizer.localdomain (47-163-111-11.bng01.bytw.tx.frontiernet.net. [47.163.111.11])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f30baa0d4sm778124fac.6.2026.09.01.11.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 11:56:32 -0700 (PDT)
From: Yudi Yang <2000jedi@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yudi Yang <2000jedi@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] staging: greybus: audio_codec: fix stack overflow in stream name parsing
Date: Tue,  1 Sep 2026 13:56:00 -0500
Message-ID: <20260901185600.2725678-1-2000jedi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

intf_name and dir are 32-byte buffers. Parsing a module-provided AIF
stream name with unbounded %s conversions can cause buffer-overwrites.
Limit each conversion to 31 characters.

Fixes: 60e7327d54b2 ("greybus: audio: Find data connection based on id")
Cc: stable@vger.kernel.org
Signed-off-by: Yudi Yang <2000jedi@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 6daa4e706792..c3fefe1414f9 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -311,7 +311,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
 	}
 
 	/* parse dai_id from AIF widget's stream_name */
-	if (sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir) != 3) {
+	if (sscanf(w->sname, "%31s %d %31s", intf_name, &dai_id, dir) != 3) {
 		dev_err(codec->dev, "Error while parsing dai_id for %s\n", w->name);
 		return -EINVAL;
 	}
-- 
2.43.0

