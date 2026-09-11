Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FAF3C3443
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789165312; cv=none; b=kIvvm1D5mLs6QZyV8AMsOjwX3x4SAkYPCXX95XWglG0BeWZ9y3OS7w3Ba62mjI0zlelpK10hhpLtp95HZN1a/8HpRjFW03QqttR2oKZCvJxMPLtCxUr0u2ODBhEmbvtsAb8mEIQN9hk4FqlCKzVGsCl/WrTXjM2/501gT2ob5jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789165312; c=relaxed/simple;
	bh=0bKbFA6rTlExsl6Cq0rBiqoF5/Pq5eHAPxz7mw8aMnE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VFYXSShYe1hI5jgYauQF3uO94uwAltO7PlWP8VdslxFHU4U7B/o4tNs/0mORkY178R/43KXnCcPPyGcLLjgVjpxr0gqNp4rqRrg7KeSOQUf0FfgAISLWQgkFIu1dRr5CsxE3/tqtVH+J6xrNfsuCxw+zQZKiK7Tvwb6Iqv2su7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APGJMt4Q; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APGJMt4Q"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso609485e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789165309; x=1789770109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PMkIufKt71ok5WIE343MhLBROfiL7lwrRjMZxsGxKkw=;
        b=APGJMt4QgHMzMOE4xcI6+4gSS4HmwrtEyg0+4J28w8vfNxzbAk40kg3JUneJUZLFr7
         wK9Wx/U39a6NZTAYraMBCf6a1AsTgwk3xBGURwa32NvDdnh0oN+Vs3SW9hA2o1Cy2Opi
         5HHHP321mZv7p7VBBURS065CAchUfl1Ko6pVhpwAiZy4xNKl1SJnlPO0fXiqWT4LeNcP
         +d5pvN5hVi18WJce6gPGs08qE8mP7o9eWahdWramXGNyMIsZwMIZ7X2GdJabE+HTBPsI
         dXdBxk5J1d3It1IdG17Tfp9a/p1nZEh/mDqPEIFWTgZJmXKPfYvAMQRWbSonay64/KxU
         +6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789165309; x=1789770109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PMkIufKt71ok5WIE343MhLBROfiL7lwrRjMZxsGxKkw=;
        b=eeVeOL394+Lc6qS8ivPOWbVnZO2AJzrM7MqVEtitjI8+vav8uGixhIOwpqovPURM+9
         psGms0c2kTviwSDHyv5CCEVCKv8CXTSYf5lMzjG1s5CglCZXJ89XmieCwC2+FQEjzIG3
         /DGy5sFlRhaeeeWa+ZgxelNUPcTQ0a/kx3a1tX5ROILvvGz5+r6wvdwJNLgCC1P/KCXi
         B4yKbuirPLe7KAd8ymefdw+tgnfr2zTXsgvIz5ac+PxS0B8JzBg3GOdTzFW4SpEI15jC
         oGRJWb9buAf4Ohb1lQHRdZCYsuy993efs+XOo8Ey+v56cAEOP8aThuLtJ1Q0NVBGBiD/
         VsxA==
X-Forwarded-Encrypted: i=1; AKwUvByxinY+8eu+6TtsmdfhYUHYTTizNArTpSmAY9fAZX0glJ3wOVn5mrF4MiSEVHRueboLTm53vLXVCsb281o=@vger.kernel.org
X-Gm-Message-State: AFuF++m4CUewyBZM1V3xV6y7uFBpcn8ftby7k/jlDx9QQcpt88nHhjVZ
	duDRTWd8AKGC48lYHaVmzMr9rpKTYu8+aY5cyXbIkaRm8hqCVBqH5pS7
X-Gm-Gg: AYBFou00p8OsiOHDm+fvrkx8d2HngjIQCcM4pmfDoUtKUuL14C3yqp0wIaNb7QTvGq6
	U/iYDS0eLNdypZPaij1eiv+FsBKnRvMGGivZrVDwmyiQQ17/D7S9Ae5JRGyWeyQU7xYUXb83E3r
	KhquyuvIlQSt4IHugxrnbzn3cf7g06mDQnaXCMn5hzODPZABydw5dz1UKGQH0egRIJSxMXrZOQb
	NqcIbiUVOtUx4JLzKJX+D1a8QMnjnZL7xUHz63d+tVygG+0wvN8ZIoIRPB2Otm8DVfUtH6wxF1c
	B4Vq43N/D4uOX2CGmwQwSJA9cuKmjsXpEzfyDQKydF2dwJOIPlx01o2ukIf0dOvj0nOrVJ7kxap
	W7ABu+/1qc6VWAZmC1XK8bO4NhWADKk2vmpSjfdLDgxjf0Wy7Ya60JmyctqzzTVaK0P/6SXQk7U
	zj+p+MHUHQ0xV62/bnSch8ASw9/uzK3RKVhThdzg1dEkeQqQlcvI1ZJD8P9t/g98wV6CuRfXFCH
	ToHKYoLA/a/YL0wU+QJQEYY583E3SowJcSqKKzz+NVD+APwT9Z3DDYPoN7zGjTB90w6hvqJXjtQ
	r3eDxiepFi+gVdbqvCDI70wOjY8FsgPLc+W7
X-Received: by 2002:a05:600c:138c:b0:49c:fa21:1c84 with SMTP id 5b1f17b1804b1-49e6cc078b0mr1148525e9.25.1789165308867;
        Fri, 11 Sep 2026 15:21:48 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf2esm9720604f8f.2.2026.09.11.15.21.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 15:21:47 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Luben Tuikov <ltuikov89@gmail.com>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kobject: Fix the kobj_set_name reference in kset_register() kernel-doc
Date: Sat, 12 Sep 2026 00:20:29 +0200
Message-Id: <20260911222029.7267-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc comment of kset_register() refers to kobj_set_name, which
does not exist. The name is kobject_set_name. Say kobject_set_name.

Fixes: 1662cea4623f ("kset: fix memory leak when kset_register() returns error")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 lib/kobject.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/kobject.c b/lib/kobject.c
index e7b010a989fb9e4a4ddb105989ced638ce02ccd6..942ee439f06ef8962386ac9b7b37ce60b29e83a6 100644
--- a/lib/kobject.c
+++ b/lib/kobject.c
@@ -855,7 +855,7 @@ EXPORT_SYMBOL_GPL(kobj_sysfs_ops);
  * kset_register() - Initialize and add a kset.
  * @k: kset.
  *
- * NOTE: On error, the kset.kobj.name allocated by() kobj_set_name()
+ * NOTE: On error, the kset.kobj.name allocated by() kobject_set_name()
  * is freed, it can not be used any more.
  */
 int kset_register(struct kset *k)
