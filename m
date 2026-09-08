Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E090560AB7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873253; cv=none; b=IK1wTcNalpgqSNZQJVAaxrJe1cAvnktb698EZkrL+IlsCkAYCerNoZU6dM8p7pGcHSEMit0Hpw+Q52tEClkDlwtOWcoUCuwWgVeuOp6NXSp5smP+lEdg9ZRbYS+reXhEXr1j6wOi9XERd0T+9Zf8xZNBqxWRlwb0UaDZdSGM2d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873253; c=relaxed/simple;
	bh=4Gmxb5iLpVzmxwtAiwm50Wo4ui0NNmlc4p4QOsCkq9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nstl2ArOOtukdeiGsqJApqqVOYaSfR8LrAT3Nj0B6BqG5vaGhZu7QI4l8yVdEea4tPYcLlsBb/DB6A6DmVOBuFpsS3r5BJt6pq8BASX3Z9XbfyAcpAO4YBMoU7ugbQie5elld7vK0wvTRkfEKMjZ1xXjnTUb4FKhqAO25UgD7Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZypczUh; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZypczUh"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c253425b253so675116066b.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788873240; x=1789478040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpzGXcywvBcmoPFLpe0sjmmkxn8qreN3FEfttSNZISw=;
        b=dZypczUhnUIa2UAc0aeObyI5RgfI1TIRtY3iFfYGFY+2CFQTkwstfzR7zQEzEpEsRd
         +48L31fqc4GIFdNW8MaqkEy/Nrow31jH8k+ZnBvZvQZa2AV8ppwNBr/8SmWLvhrZgGUL
         /WkP+/Uw2yJzMR+r2ixkEUNShOP7VorhS/Rv+cMHREEaSKqbkgEnVTB8h/yBR3wUiSIR
         /Nk66lgbKR1Eci4QXJ0QhxdBjWNUi5KTXsde+j7srYt/18W9JnktoERNse/0cJe5Itak
         3+aWXQ2NCSpTDYiBD0xfN2i5/wWOw1RCgoklQVKPTgGrMAVkDFJTaGOShtzY25ExfipA
         lTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873240; x=1789478040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qpzGXcywvBcmoPFLpe0sjmmkxn8qreN3FEfttSNZISw=;
        b=K/ZiSnvdcgD8Uwg6Z0+qaCwW9L6CTdHM00qkeUKz6PulJlXMwJLfMLkY+E8bRlbZpj
         uOeAXfIPDSNN+BMEZp5BpM2HTmRJAa+3MS49gjo31IvjHDB7/vXpP3W3zAPivpYU3Bzm
         kfBrIpiJUuVL5sH9Vlgz5kwbMbmsvRa9qt/B7UzM1I2dGLQB4ZwfeGqi5k0qO/x23n9o
         aeH5gsZ7HCHZ/rLgkx7fm69WA481xlqJ+18txWs85xDmxgfw7ZNeCqbX/H3nHFYyRI3j
         0hOOl6Qvg1o/rVrJKBRqqtdesRcJxSzO4pFY6T+XU1N2zm4D7KHX/Q0e8HDTtEOGVIS8
         ASRA==
X-Forwarded-Encrypted: i=1; AKwUvBy10mBPrJLI+INezHe5qQLGq3dSiIZfQY4DHdXEjWBF1Or2bM9V0DH0+8HnY0kyEmlEKL6rH+Pt5/O5c+g=@vger.kernel.org
X-Gm-Message-State: AFuF++mv/T2mZVIHBb3Wy9LGHotiaTgbrJmlC7hrMJFiEG0A3TN2W44J
	IDybtsS4UcbGCld9aC+RVBmsHNsT6gEcDZ8vNx7saFd0Giw6bhI4JEwW
X-Gm-Gg: AYBFou2SO0moK+N5H5XE6ABLqOz32D3dwzQJMXGMQ9/x2y7S2VpdO1LoBD1OqHYJ0lq
	eZecpmD7IIeP9WHXpYfaTJcXhuHISFLmYzOLy4woGaNj3zA82XYkS+tL9W5n3cVv4JijEgqfC6C
	fd3UNVjKSKDkiPIraF+S9ZFOreTkPgH08tEWmirv+yzFTxXy0y/iXufy5VDatp6AhmFxnhFCqNT
	DSY3KWH3D+fJyvANb9b7kXIezarmUtyk36dNyQFjoT7tjYe7EpKTR8d7tkKTVaI52uktHBp7zkF
	Xc76Sw62tFf9V1b83hZjDgJ6SisJqe/DthtDU0oXZ1Zyn4RpZCcKWePP9AUfPtsGDqUJxJHvUtR
	Ls1atL9ftU0g7SjJfAongmwyNXda1zXsV2RqoZ39WFuYrR5Wsav/i4dsV5gw7OsWgHFjYxtRQL5
	jxP+X5l3HM80VgYSRKqFh4Cgq3s6y3HWDmxPY3APZ6rOjkG97JoA==
X-Received: by 2002:a17:906:c116:b0:c26:19de:9add with SMTP id a640c23a62f3a-c2619dea99emr1021645266b.28.1788873239627;
        Tue, 08 Sep 2026 06:13:59 -0700 (PDT)
Received: from [127.0.0.1] ([2a09:bac6:37a9:1e5a::306:1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6e1c93sm625170866b.63.2026.09.08.06.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:13:59 -0700 (PDT)
From: Caleb Kan <calebkan1106@gmail.com>
Date: Tue, 08 Sep 2026 14:13:40 +0100
Subject: [PATCH RFC v2 07/11] drm/locking: preserve deadlock diagnostics
 for trie-backed stacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-stackdepot-trie-v2-7-1996d5cef732@cloudflare.com>
References: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
In-Reply-To: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, Vlastimil Babka <vbabka@kernel.org>, 
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Oscar Salvador <osalvador@suse.de>, Caleb Kan <ckan@cloudflare.com>, 
 kernel-team@cloudflare.com
X-Mailer: b4 0.16.0

From: Caleb Kan <ckan@cloudflare.com>

When a modeset lock acquisition returns -EDEADLK, DRM saves the call chain
and prints it if the caller later attempts another lock or drops its locks
without first calling drm_modeset_backoff(). This diagnostic currently
fetches the saved stack through stack_depot_fetch().

A later patch allows persistent stack depot saves to return trie-backed
handles, while stack_depot_fetch() remains limited to hash-backed records.
Use stack_depot_snprint() to format either backend. Keep the PAGE_SIZE
buffer and leave the warning text, existing indentation, and backtrace
unchanged.

Signed-off-by: Caleb Kan <ckan@cloudflare.com>
---
 drivers/gpu/drm/drm_modeset_lock.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modeset_lock.c
index e14814c30d8c..f48b02379b71 100644
--- a/drivers/gpu/drm/drm_modeset_lock.c
+++ b/drivers/gpu/drm/drm_modeset_lock.c
@@ -94,16 +94,13 @@ static noinline depot_stack_handle_t __drm_stack_depot_save(void)
 static void __drm_stack_depot_print(depot_stack_handle_t stack_depot)
 {
 	struct drm_printer p = drm_dbg_printer(NULL, DRM_UT_KMS, "drm_modeset_lock");
-	unsigned long *entries;
-	unsigned int nr_entries;
 	char *buf;
 
 	buf = kmalloc(PAGE_SIZE, GFP_NOWAIT | __GFP_NOWARN);
 	if (!buf)
 		return;
 
-	nr_entries = stack_depot_fetch(stack_depot, &entries);
-	stack_trace_snprint(buf, PAGE_SIZE, entries, nr_entries, 2);
+	stack_depot_snprint(stack_depot, buf, PAGE_SIZE, 2);
 
 	drm_printf(&p, "attempting to lock a contended lock without backoff:\n%s", buf);
 

-- 
Git-155)

