Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599681;
	b=ysk1hpRj/FWh9CBhWFte6PSgF+o2z5dv8uGK+fe1JxcAvjw/61HVF3kB1URkEUjCkVKU
	 IYwa/yX5HIms8w8h/NqF59IOTukNsVv9Fx1TZZBJkKPC7I6W4+tz0R/ABfFVd+auPaXoH
	 g7lBTdkQACVgGlHV7w/XHj41KETz1K7rdQPllVDllsLVxNYzsgEwQLaV1x6JAAqlfvnG1
	 4UBqWic9+J4b7yOeWY7DJto4zwoLmXopJJz8yCoiWf1nzKl/R8/QuoUbFsiOjMg4Rnh2C
	 iBBe3pXrLtN1BNgsm6K5dfGnv3MvJ34zCgJbaRKQQjOxwUQAY1Qmi2pupV2APueHZyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IM+AY411aupxDfXW3rYEXZkT1F3AQsoQqb9ny080FQ8=;
	b=hWVrXF8mhBeMs9jZgvnZeVyvKDOdYVbDDjZkot6uDLmQTaz9BHUVjYrLZbsgHc3N/9YV
	 m4ajprkI9JnqZI3txX/xs5Rn9H99HZyDRy08Tp0ie40/PUp3YlKyXHFaJShHIfInmIOQf
	 J71PLJ+wEaTTpRjvHlpSmXaZ9nEf52IK316xuPpzttZpwdE7O4k2/7hJfnroVZzx/V8sq
	 9fXLomBkUsqQoIvtI17k5gV5tWuzPTgKpDHMB6oTy8Q5ymvzKm8BDCT/+KKIkoPstmHvW
	 v9Sl9zFl4edPhv0tiRSV0KqVbI217BMIOy9oLTwfJsPvkT0L2lMe8XqPwGbn8OmDaUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=XS0Qc4pX;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EA1606AE91
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87EA1606AE91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=XS0Qc4pX
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-94961ed97bcso33300585a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794599679; x=1795204479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IM+AY411aupxDfXW3rYEXZkT1F3AQsoQqb9ny080FQ8=;
        b=XS0Qc4pXETEIni8QMf6HeXP17xxPhjKQUkseH5it2DVmR5OSAc2pn0kDO2YdLAeeJ1
         Ws3Cc/V90uxFlwFUEafczugVEA7LsihseDXdYEmD+slDtG9Taul25UfVDN2UZ5DXcTQ8
         axLndUXZG8yma6eU0Q/4gPiO6/RW0ekgSMXH4T0t6CBb3h8Sb1MpsWleyrPTTYe5FSRD
         57RBPSluU9wHzeG6mc6cJ+jvtwVxt/ZbU887OKtH3vzjfhxZHFXuOEygJuDzwwd4AEak
         XLRMWu5Dy0ieSBRKl+oIU41B733Xc9OcqtmkVzblE2OPlPJ2yQ19OvoM46x6e/PYC4Ic
         EciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599679; x=1795204479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IM+AY411aupxDfXW3rYEXZkT1F3AQsoQqb9ny080FQ8=;
        b=uDpDikoF9f+5zeCul8Ksdy1mRoJ2/53voRp4mU5of8naJ/pfWpCdz7x+6od2sbP+5r
         iAjXjzcmDBH+T7VWx5fIGyCHvUeYLiIxF0rzJup8QLc3SITu5m0dhiwftIVv5vPcq3J/
         LcfarnfTZ1tMhZsO7+gZjyGwOmByu63uqptOk3ENlqUeu2KrbBUV79rJxtEBRuMy+dsX
         DQ6RRd2xF/5VXq3N+5H4NgSm8T4nFCaCnoRL5xvQBPioJUt/aSsBkM8kKgdwWBV8RkQk
         t0uFqMcNW2CfP3HXGbs9LLyKR/cxPv7Qkea1r6lYzgczuZOEDWVKfU+Vc9jd2z413GTA
         Xe5A==
X-Forwarded-Encrypted: i=1; AL+hErEdeRc3GwHR+mFSxdmqWJ7L4CfQKTZlID9j6hdfRHKwCCXALHlaXgvLJd60V/28DuEXht4KsnCV0lrrY6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vSGldJHQjZCYOgcDk8PqpthPnqCs3ciewdnd00+15U6ss4IMf
	zEw9rB66U8JK/y/WwFQCEWN91y1D1wQQ12pFvg7V9TFrPpZbfDi+sZRpI9pszHjmw34=
X-Gm-Gg: AYBFou3Yf5S2hHQUAPNaeG2ZwxZXTY0RkLKdNPHRFypTBjRUdCMFnPC7Sv6iFfB3XDB
	3XECgS4kLseoMLSkqva0SLvGb33THu8wCNvNBHCKMDDotLX3UOGryfVv/KPGF7azDdDcupFy3BQ
	pA75rtBvEs0OYbAGXQ8kgAEIzixsUq5jakS2rpSG2/lPLg+p/3YttaUeCQwXWoEATCl9jPeiWsz
	tRgqbv9WCyYBeRcVgxq0P01aksvV14Y0aqoRUN2U4MOcpgPuYUksSetpitec4qDKEwRrZTX8nw2
	zANb9m1ozfTZ+6kfcSQ+cyPJpUoCq2gzK9niW4OTAbYBZoy4VYWgFl+AcuqJ7HsJuyOgB8oDbwE
	mX16ZUBBJZ6vQAX7Cp1mkTM6dfPY+zvrobgVH+UdxxXxxwxVneQDY15hknP/PI/xiunVih7Y4dB
	knlJnpDkz26vo1/+6hi2CvgbfEC5Wzvp2Au05dnuFsvFhp8wjlC5IiSnnAJQ4vuObnuL60oYi6u
	hLko2VxmFC+SXdzqCctLE2Xt4k3vqLA2v94awswzrB0Rtu+/Z7XVEBOEj3YBb1lngf9xf5jGVXD
	l1bNhj1AsncQxB3KrPwQ+HXsjVNlzA1yLY2f83znIX+u8J9kLj2IO/7oRqPeDS/dPgxeW9fL0E7
	+g7IxQQg8iWtwnV0=
X-Received: by 2002:a05:620a:414c:b0:947:84e7:f617 with SMTP id af79cd13be357-9494bbcc0f7mr614745985a.64.1794599679506;
        Fri, 13 Nov 2026 11:54:39 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c870ad4sm252867985a.26.2026.11.13.11.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:54:39 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	lyude@redhat.com,
	dakr@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	balbirs@nvidia.com,
	akpm@linux-foundation.org,
	stable@vger.kernel.org
Subject: [PATCH] drm/nouveau/dmem: free migration arrays on early fault returns
Date: Fri, 13 Nov 2026 14:54:36 -0500
Message-ID: <20261113195436.2659094-1-gourry@gourry.net>
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

nouveau_dmem_migrate_to_ram() leaks its source and destination PFN
arrays when migrate_vma_setup() fails or collects no migratable pages.

The arrays used to be local variables, but THP support changed them to
kcalloc() allocations without updating these returns.

Route both exits through the existing array cleanup. Preserve
VM_FAULT_SIGBUS for a setup error and zero for an empty migration.

Fixes: c32287471077 ("gpu/drm/nouveau: enable THP support for GPU memory migration")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index e74d7bb975a8..4cfc7b16d445 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -233,10 +233,12 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	 * than just one page on CPU fault. When such fault happens it is very
 	 * likely that more surrounding page will CPU fault too.
 	 */
-	if (migrate_vma_setup(&args) < 0)
-		return VM_FAULT_SIGBUS;
+	if (migrate_vma_setup(&args) < 0) {
+		ret = VM_FAULT_SIGBUS;
+		goto err;
+	}
 	if (!args.cpages)
-		return 0;
+		goto err;
 
 	if (order)
 		dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER | __GFP_ZERO,
-- 
2.56.0

