Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794644429;
	b=Fy5GR3iFHqvrs5q+idsoR23H4gsLNkftD6g2zd/D/BgRmwsH+h+S03ckoA5TqsuNyxip
	 mieoH53qbeOWWn8g0M/Z1pcbyahrMUvPst5VB1ata8cWm3Xn+9l9wLPoaBfTfceQeKiSE
	 4fyDHrRu04J91Cv0wDMT4Vu0pPU5cP8skVsDtL8iNzpjV1sOouWkTvil/e9pW3NoY3TkN
	 1tUj2+fE+XUs76F6h2RWVM8KR+rwnrQDdCYvSoGPWFl1y4pwLhVbxOLHfzzQc4w/KNIt0
	 4h0njWIkMTj0kO3YIYOL+ozLcAh5rAJ3AYxUzA7Xv9jh0Lz2o6HI8gOvD1mF2y/gjqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794644429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SqXDyJrLwFkhi21RssicBQAdX6l60Qls8EPKvWmfnzg=;
	b=MRDa0zLjFKDhJF9w2HNisqRvhvSK7Fqbfh7YazrO0YpfdcM15TF4XPI2267VNaZqFb1M
	 B+9FM64Up4SLRFWb1l9dTBm0N8Okqtd3UaxoMl6f6fMagZq4L8wvIvJ5cIzTKOwHrHcAD
	 qVmqhU+JuwZcikM2kV70ARxPgoDlTcBT2tgSpJQScdJNjGJBPD2lzjIKWHN09sFakYDS+
	 /R7gpFytO+TFrYnn/uvHY7/LlPJSizGeY90X9RyuYj6OYj2jRw98dxBflv0ob7QpOypTi
	 eKr6mlmgybZhxuHwxnmFBOz42cz/1OEEYbV36c0yurvWltxxpyr2osR4B9oNl06AM5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OhsHwDct;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F6F606A883
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53F6F606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OhsHwDct
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-168de2167deso22848c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794644428; x=1795249228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SqXDyJrLwFkhi21RssicBQAdX6l60Qls8EPKvWmfnzg=;
        b=OhsHwDctsui8SfgxQeO7fC8WUblvjJqKKTFnTnFN/lOQGbrYHXiyeStOqGpcLAtVIp
         JHrH8E4WSlE9gfn8QkSX4Zjxs96v+RW9duU6XIfVdwtK9wRv3r8bOGdBt4NkfQumncoA
         rwhUaUKbnDCyf0PpcJDJTgLxEutY777peD1wee66IwOYXxeBZphnmr2BZA7kU6kyEwZs
         2wLrxZIEuIEHNiyZG07gNALCAAG7hfHejeF4bc0o0FHEsKYMpA+G5XEZGNKySk7hjjFo
         wMKXAZcHk+6TnjZLPg+sUeiJKMTa6Au+TQ88/ajwDXu0dVP64yyPPqeFSWoSUnJNIu7X
         IkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794644428; x=1795249228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SqXDyJrLwFkhi21RssicBQAdX6l60Qls8EPKvWmfnzg=;
        b=OoaFUDf0YRemb9KWsUuOjXNwHa9ngJc+zjZ4YigV3cnCBLlKsi+0lOpasYlkApEup5
         7oWqLetiVkqSw4Kw+m76aNpk/Mgj/Aq1miiMSFU5/YZJTIH2E9YeKJZGNmdJ4xwPwTVr
         kYOaqq8sd5b5HOjrf598p4O22Xm9rpbpc+AMHUxghzvn55wCLWVOnKYgnRNlfxoobqQF
         tENUXwcii8vfyD4AlSlla9AC+Tpzw59ux9ce0QR9rxIH4YNL2baUmcsW2QFJEfUJIw7+
         uAs88Zsv8yseQwX7D6DTIY77SSoA7p2X6Dhics9SJMKkWChNDWndJnlEV/gY1wIOkdaN
         P4AQ==
X-Forwarded-Encrypted: i=1; AL+hErFitFrtjLyMl7PFK+gemM60bv5Y3WqOC14uZ4a70bhpBPDaf2b9jXqRjtUGgaWKEjXauMU4vCPLCYhYKZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ATeFHEku0/08Hxd7kXq3PSnz87JKW60bfkGXN+/ojOKxq8nYo
	9IOv8Wx/48ykQgiOI/8ei+5Sz9gQ2WSo29TkwD2SOjh3VM7QF/a+wc5L
X-Gm-Gg: AYBFou2Abez1SgICK//r5bZIqJ7r2v/eqOOCahkHesRvvht2EocaWJmgSKj3OYtjiuK
	QbL61H7ppEkal4LPc9mqroNS4bFjCTBpaZPBmq2eb1NxM3lx6We2iL8jbL7SYyInWLQYTQGte6+
	T0PCnecJ0AEViwJ5qhJESXLKJtGo62sFPwX7kGfKjwv2zk+Pjg09esUv+PCmKxR1rQu2B1pq4Bd
	UMa5NP/Z5q1fmDV9/fZDeBTjEJ90+OYl86UG0Z7eHPHdOVY8Bvtp8Oqxs/3301uGLiUgmFl9CtN
	Si4rWDXKIjIiGsMrAjQ0lMWOzvuIUH5Jg9nuf07SU2wVw7ps/9/kSse1GE+Bs9l6VxKshwsy2SC
	aFSAM8ddLfoz3rw8csrEnBI9PDqWAhL0YDtalcE7ypyK1rP0Vk/jk14HZic/XL3I7qCvPM+zsaX
	51yLJ4m39aQKu3x2eqArp8q7Rf+X9uzUj5qU2bXQH3yig6yRNNwPc5uMVrJFRtYBkCVNpfKOxgs
	sbvZ8DjkSMfCcV2B1yJKaEVYJ2AD/irvm0zbkoD5+V4SG6XaHJl4GCONuRbCSb/MMV03PBUGJnO
	GnFnIiIARFKu+Aoj7ypkxjJ5tvkSBr8zWBemLKS/Le/0df5LmWWe+tb6x6Q/yvAtOvMagpkX7FB
	ATXI=
X-Received: by 2002:a05:701b:290a:b0:127:def:dd72 with SMTP id a92af1059eb24-1b5030f8a7dmr6472366c88.2.1794644428430;
        Sat, 14 Nov 2026 00:20:28 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm19524043c88.9.2026.11.14.00.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:20:27 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] drm/panfrost: Hold a reference to the MMU context of a job
Date: Sat, 14 Nov 2026 17:20:13 +0900
Message-ID: <20261114082016.2454-2-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114082016.2454-1-arpe1618@gmail.com>
References: <20261114082016.2454-1-arpe1618@gmail.com>
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

A job stores the MMU context of its file in job->mmu without taking a
reference to it. Once the file is closed, the context is only kept
alive by the BO mappings that still reference it, and a job may be
submitted with no BOs at all.

When the file is closed while such a job is still running,
panfrost_jm_close() does not wait for the job, and panfrost_postclose()
then drops the file's reference to the context, which frees it unless
BO mappings of other jobs still hold it. The job interrupt handling
that follows calls panfrost_mmu_as_put() on the freed job->mmu, and
panfrost_core_dump() also reads job->mmu if the job times out.

Take a reference to the MMU context when the job is created and drop
it when the job is cleaned up.

This was found with an AI coding assistant, which also drafted this
patch and its changelog. It has not been reproduced, and the change
has only been compile-tested.

Fixes: 6e516faf0431 ("drm/panfrost: Job should reference MMU not file_priv")
Cc: stable@vger.kernel.org
Signed-off-by: Jiwoo Kim <arpe1618@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 7c348a0bf1ee..afda794e2aeb 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -331,7 +331,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 	job->jc = args->jc;
 	job->requirements = args->requirements;
 	job->flush_id = panfrost_gpu_get_latest_flush_id(pfdev);
-	job->mmu = file_priv->mmu;
+	job->mmu = panfrost_mmu_ctx_get(file_priv->mmu);
 	job->ctx = panfrost_jm_ctx_get(jm_ctx);
 	job->engine_usage = &file_priv->engine_usage;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 4ddf4b722ddf..7022b1b2e020 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -377,6 +377,7 @@ static void panfrost_job_cleanup(struct kref *ref)
 		kvfree(job->bos);
 	}
 
+	panfrost_mmu_ctx_put(job->mmu);
 	panfrost_jm_ctx_put(job->ctx);
 	kfree(job);
 }
-- 
2.43.0

