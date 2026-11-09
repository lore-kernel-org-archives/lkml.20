Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794225544;
	b=Zq8TgCXJF9PPApLkT7I0Ub0hYERxiOze0p8S33ug+WcSm9xUBuvHKLmRXZJnOTKIlujM
	 gsQ9FBnMQf3a7Hdanknid8Xf/V1UOD98Jh7lQaM+Z9nTFtebD8pJxosYknra+DhGf/ufJ
	 CWzbOmGvQXqXVCNCRghrYwaeA5GPDe6Niw4Z9MapCNndT4oLH02y3Yxx4tnxr/eNcv2KC
	 mi4wDG1x0Xkv/3Ztd6+N/MhnJVXj/OF12ecLZFXvjE8ED1UrEY9f2LMwY9WRcC2TkT6ax
	 UuWS81v3FtWagPk7cq5YdfW8fkH1s1eXkGMlgGvcu+V8c9WyT+XfGysk2JEGIKuykDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=vZZFW3he6Y0yRjddi4hc6tYaRiQUxyF/kAa3QBDlw9I=;
	b=LGWwZvNZYXAjAq24Xu7pfREUaqXUzzJugvS89/vt5U5JeYIXHAdpztqDIiUSeEmrUKIm
	 J5I8+5AAnvFNDd354gylKGQBsp8YoABQO8g1YRoLER5GP4SVX5c8kHcWpReYntDhGT+v9
	 W6hZlTph74DONv1WQzElZs6r6cPH7M5pqDQsM7QBW85WL8mdqs+HIJG0MIjyrcgJe5jYI
	 Iez4cvUzzVwZmPGrENJPUVUnumYVD0XTOaDnty1OvXUrH8LJWiVgKfyvdCtB5mB79S85b
	 qPah2yC7NrblR3x/m3ybVBxishaJUORNcFuQjTcblgqJDgO+IGEx93HVaqPhW2R1Uvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GdsL4bPK;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F39606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04F39606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GdsL4bPK
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so11634695e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794225542; x=1794830342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vZZFW3he6Y0yRjddi4hc6tYaRiQUxyF/kAa3QBDlw9I=;
        b=GdsL4bPKUdd08M5DNVOGD9DHJE/yRBBxaeJ/brwPQBmqpKcY76ulrPxu41pndQsfJC
         MmwE0vXX5BRev5d0uKj9e/Hktg3hZPBcNqGgpdb4VSp5CygpsMXhF7UbEdepcI8sC7wU
         gJcXQn9F4g7xWB0U9PkFRwoI2NqirC5eAZB9ROfJtCW+94o6eKUhYH4tpKAj/Rf+3nxK
         1+qezhD4Dvkx4oG+Kr0Cx9u8U8PRSeFDS9qnhCJrSzhpz9WbVBuN/+TVPjPMI5+opp5U
         OVu5KXNieCXsi7k4Wz5/54TwAdUxEWVTb+xvE4kvdqdbiLPRtgqm2bvIORZQ43Tgx/dC
         Tv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794225542; x=1794830342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZZFW3he6Y0yRjddi4hc6tYaRiQUxyF/kAa3QBDlw9I=;
        b=GqI2NQhsmwJgDmI0F+sUP+y5TCsSAf7A/bHjjYB7iSZiHdveaHopwFyely1ddxcWL8
         6HsRa/8AOPlIi43n+JkFHTugunbvMruCteRWh6yeLJyDKB/sz0IDy5CaIGKtvk28jEtU
         U0eqdROcq6Dk8ypKijSHrKVEDxJlcFkX45k7mHO+UKqmMg+WCoCX2HvJiCwjK5X383+X
         QDQbvWsafR4tEaJdH2eDPAMw+Oz/KakLq6hSfJTUs2vA2ZypUxdbKaYzK3ehEplsRLUa
         CM2kWDKB0+xdv9rf8Ivfklb9CePwoWhseriLnS8ZwmPnHZZkAEbWq4zwzcTvvkjnJ2de
         mw4w==
X-Gm-Message-State: APuU4Z9klDtXotRBLHNF//fPz67+8Mgl1cXYl7ZMpn21FZPvFvrjMKcd
	CnADXJjEKeZTm64aU6TSWEEQNTLyNL0aiaYiLylRIb4AM/j+90Wc6c0g
X-Gm-Gg: AYBFou0R8UllOiph+TwyqETmNq7IH4gXMMjpG7a1Wqezz0kksRtzfQoSqrvcQ29vAXB
	mjXTLQZxEx5RURJkkeIHKkbAih1kCpCNvChRfe28Z5udWlHQYv9yzy7RmCG/7RLEZ3UgaY6KP1v
	iYuXIgcng5ZDwJ11wyfyNzA1CKAYUbBL/NmyZQiZqhcRMLdwRLD/KwDgh5acAqp+ZOqqUFjwrAc
	ZC8lymBkhboV07oOBnvWF4XISQ8gCYjM0EVukUNi1Yj9CAQInbbvEQL22Q38gyi4N/PvStK498x
	/5os+5SEnLDB5Tz2EvtANYiQdbOEQoHQPGTRihwDXV/rakoDSnzh0PlnwODZUwWnGHqNIXHQyep
	fl6RhFTc8eSyzb7nXlz5JHyjHrSzJKkxxmxd6QGuXXgm31ey5SWT4oZe7c4m0zDxVhhIaa693ji
	TBsJJWCByfGB4cdu48m7Ml7Mdg4Qv3CRap037XxNx76OXoYtKQAFC2gtVINhpSRkuADQubWOQIB
	U9ibtXBpyGR3+9UvGuS8AqRSWmJYgJ3JCECA+uHS/7rkth5OxVWxJ2sgC3dpoX21xn3ne/Yip+w
	DiEkw8jGki3iSZ2wDQ==
X-Received: by 2002:a05:600c:4eca:b0:4a2:5267:3cd4 with SMTP id 5b1f17b1804b1-4b94d762f4dmr67257705e9.3.1794225541502;
        Mon, 09 Nov 2026 03:59:01 -0800 (PST)
Received: from averion.play.pl ([2a02:a313:21ec:9380::e204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495e725c4ccsm6922419f8f.53.2026.11.09.03.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:59:01 -0800 (PST)
From: Daniil Demakov <t3127430@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Daniil Demakov <t3127430@gmail.com>
Subject: [PATCH] staging: sm750fb: make g_fbmode array static const char * const
Date: Mon,  9 Nov 2026 11:58:57 +0000
Message-ID: <20261109115857.19492-1-t3127430@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Fix a checkpatch warning by adding the second const to the

g_fbmode array. This ensures it is properly marked as read-only.

Signed-off-by: Daniil Demakov <t3127430@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 21e310274330..47d2917cc1d6 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -12,7 +12,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
 static int g_nomtrr __ro_after_init;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char * const g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview __ro_after_init;
-- 
2.56.0

