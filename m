Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E382E7F39
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311009; cv=none; b=AUI6dccFVm0+sjVVSEjmRykG4thtZ6FBPc+I0+8TQgwuRXEKX1yn4wXVPtzzsBYQk25YxVrym6H7/RbM8TS5AWKmtX4snsCmjk5QlTx0YpcTZ7X8ZoWXOuEURuGv1CEvzray8f00O8aTnPW9LtSHA0o7GkoHIItDpEsFtTDTfPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311009; c=relaxed/simple;
	bh=Clj/Ouwd0dLN04eWZNySPzYuAllNrDtuMX3q2A156eE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AMQNM3lvWMBjKcpjH4oa0DCm3V3waB/aUqykajdNbmAv1y+IteHUlEgw2ZJKfw3x3JhOy54BPPfvAbI5SSJSZ8oS1A+rZIBtMk7CW7WPcdAMBNqCaH1uwdbY8ZS9sYUfWJYQJcFwImFnp0CEIOsU0Rv2cjYcaeng6/sVPS10CY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qCdfVcVT; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qCdfVcVT"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b965f447cso7987575e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311003; x=1789915803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81asV8b/fnkXYfig/nnujoqba+Y5BqtppTUW9bEFFN4=;
        b=qCdfVcVTppuEsLa+D676p/InGo3GNUkXfxB5IiFS/bsc4OiyX3YrE7yNOu0oBaHHjg
         MpoT7aJXUMv/SCbTnFV0mloEu61Mmxh7VRC4TwA7x8X4B/vAyHsFcvQ+CVEtD1jdYTlJ
         dtaVZyyg7gkOZ7eGCkeANG4FZwAj410y3LDCHUrHYMcs491oc5P4qvW8OKXJGufH5zh9
         TWJx71rPCw3/7rhbDIIeQdUOLPIkQj6wZDdmfht9+5/CfWpXcZFrmbXwvvUC8/WgoMJe
         X0XMyGcpFEYHzl3szcIGZM06rc33z6G1kz8nPbcqLEResblNzIQHaYYCz3bB/zLO+11B
         UqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311003; x=1789915803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=81asV8b/fnkXYfig/nnujoqba+Y5BqtppTUW9bEFFN4=;
        b=hsCITJq/HOndAXfcY8HIf4ZCwfl+4zAGfsou5MmrL9o23h05VwdSDT9srYHI/yFBv7
         LM12dLDSh0Vv/oGu/vzPIwHvwadSrxOueyNwP7oK39IjprN11VHxa5QXTQ4KOOjvM1+N
         M1j13NmyD0yO3fltRb7W91gWIgPFdjJZKSx5LBo7ovwvP3HoQHjHd2jxKJnh+jLs/MbF
         yU0C9TPeqbiky760Z4Jtcc0z5JlikukO4Hgq6UnqX8H6/D683KzZh8vjAnZMRvZGAn31
         LaAAegAWtXyUaEoP0j/3z4xiZ8oXkQs5ZE6GhL3cEKMmZdTM8JZJecHFkwYEF7/h2c5H
         NRCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRE6kosrCJrYNTenozVMSsjl1922Un2nxquktlP4S9IRyhRDgKXGFKv/aTjcpheJp2Ok2qe1qvthndmKA=@vger.kernel.org
X-Gm-Message-State: AFuF++nJMGMAd9tHC+TdaDYCjd4pv8hT0wSQALnoOHXacrwLWy/m32Xn
	FdFQ9ox/+8ckLl2vBN8PzhCKK5mWKWI6olJuzPqLHRqLbgtKXmcB6Vt3
X-Gm-Gg: AYBFou1i5iNo3SFPRnUS1p+n0PPWLqIjvMvt5bkguyvMGpUttFwHbgC5het+P1XuQs4
	hZ/ybQJCZgDZtnPSQkSSnvRovgPCsyq1sow+NCCAnuYg1ra3T//p80tYQHsSHNexhlwwZ35XJBh
	rDbI9pV4QHTIVE9MBjAwJwycoE0Ofjbcp3BzKW4j3eFZG5zAGvGLBTPQPNEWkcNIYq5R1ChulVa
	A/KeqYDEbA4qQovBmBLdg2M+Wxo/6N6ovGqJdEhsWa45rgNsCHscxZdIFMd8O9XGbd0nbI0VGKk
	LQ1xUdd1MgkOG8p1oDvZ1bKoSLLT5LJ9K+iCt1XkFlVkz7w23bBJSCZHbR3PlNnleqwpmoSD52L
	XNkC1PEmaGpEB+PT909V8wBQQMDzvaISPWINW+PelhD5HXSCS+vqu4ue7WerhokbhB3j0gnsEi+
	cExnAvRRfc2yQ9g4qauBYsHp7DbPBkH/jTlsK38W49EXTroiRUFYsHoubVC7MbrHl+kroU+fvoR
	Wv3449eG0jnBhSV9/lFdCFKdWoDBYGf3Q4hRkCqdpM=
X-Received: by 2002:a05:600c:5489:b0:49d:16dc:e721 with SMTP id 5b1f17b1804b1-49e6cc0ab17mr57452735e9.24.1789311003081;
        Sun, 13 Sep 2026 07:50:03 -0700 (PDT)
Received: from f.. (cst-prg-84-1.cust.vodafone.cz. [46.135.84.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6420de77sm109534235e9.3.2026.09.13.07.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:50:02 -0700 (PDT)
From: Mateusz Guzik <mjguzik@gmail.com>
To: brauner@kernel.org
Cc: viro@zeniv.linux.org.uk,
	jack@suse.cz,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH 08/10] fsnotify: use path_clone()
Date: Sun, 13 Sep 2026 16:49:15 +0200
Message-ID: <20260913144918.1606123-9-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913144918.1606123-1-mjguzik@gmail.com>
References: <20260913144918.1606123-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional changes.

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 fs/notify/fanotify/fanotify.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/notify/fanotify/fanotify.c b/fs/notify/fanotify/fanotify.c
index a208a7ec1692..84b4c505dbe3 100644
--- a/fs/notify/fanotify/fanotify.c
+++ b/fs/notify/fanotify/fanotify.c
@@ -559,9 +559,8 @@ static struct fanotify_event *fanotify_alloc_path_event(const struct path *path,
 		return NULL;
 
 	pevent->fae.type = FANOTIFY_EVENT_TYPE_PATH;
-	pevent->path = *path;
 	*hash ^= fanotify_hash_path(path);
-	path_get(path);
+	path_clone(path, &pevent->path);
 
 	return &pevent->fae;
 }
@@ -600,10 +599,9 @@ static struct fanotify_event *fanotify_alloc_perm_event(const void *data,
 	pevent->hdr.len = 0;
 	pevent->state = FAN_EVENT_INIT;
 	pevent->watchdog_cnt = 0;
-	pevent->path = *path;
 	pevent->pos = range ? range->pos : FANOTIFY_NO_RANGE;
 	pevent->count = range ? range->count : 0;
-	path_get(path);
+	path_clone(path, &pevent->path);
 
 	return &pevent->fae;
 }
-- 
2.53.0

