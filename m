Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5DD39E18F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 20:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788897617; cv=none; b=IZsMr+vosb4xvJmCAWBfqPCkY50g21w689FxnRVCs5/4rUVy7sf7x9k9ogLoowpWM6BjQnM9haDjBXXTqM4lrKR5CEG+eAzfXAESZ2nMi36hZ3IQ9/QsizrCDIj0UoxdH77R0ShO3YuWJU1pKVOdfRKJ/cKjqhKMVUFW82URvB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788897617; c=relaxed/simple;
	bh=8EPOpJQG1mY0VHiccEtXuZTrOmJVktNSErD014DuW34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tpJMDOtVhoRhUL/2ehibi07ekqiRQE/OCfoYuQWiKJdQBa7e5St6XcluCjxtKQtM+wPdl9EjD89bNaJ4b8x/+z1LUssN+TqcVcs7axDdEwu6gPPYhQheSIuDiArn16TkFShyr5xm9TY55TH7KE7A9c5qaDEfQ8we5z0tnDaWKH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=nDininVL; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="nDininVL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=ZMEWZWXTXy0juUhCP/VyyM3JVOauhXG+wy/tuimbToY=; b=nDininVLMc5mMXDKjwlnZEW+t5
	5Xw81cbU76TOGCDu9EPI/j6qbrVfutRABD9THlZlii3RLb+v/xP6CUyXhu1tMSfyi0NtgnjkowXRK
	sWthtG28KM4WX/hWcRLKZ+M0T2J/ABIxTvnEfp7zn8YJuAEm6ttmuyV7GloouowYKvqikq27hTSWG
	dR393y/7JxWoeThKqK4ictdoKqAm7KRXCn8b3mjo72zG/qToBWYOCX3vzjmlvKZmF+rsNF/bYgv9a
	8w57+wx3yzON6qBjtyo6FiaJYLZZOiiL9uXiUGGzAk3e8kjQLvdm5pxwF2mbc6tqnM9P+SI/umYHe
	M7MuWWBw==;
Received: from 179-125-79-245-dinamico.pombonet.net.br ([179.125.79.245] helo=[127.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x41z9-00Gfaw-PE; Tue, 08 Sep 2026 22:00:04 +0200
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Date: Tue, 08 Sep 2026 16:59:51 -0300
Subject: [PATCH] Revert "drm/amdgpu: debugfs: avoid extra EOLs in
 amdgpu_gem_info"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-amdgpu_debugfs-v1-1-3b659e744691@igalia.com>
X-B4-Tracking: v=1; b=H4sIADZpoGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwML3cTclPSC0viU1KTS9LRi3SRT48QUQyPzNGOzRCWgpoKi1LTMCrC
 B0bEQfnFpUlZqcgnIFKXaWgB0cmgjcgAAAA==
X-Change-ID: 20260908-amdgpu_debugfs-b53ad127f36a
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
X-Mailer: b4 0.16-dev-62088

This reverts commit c119d05a36a884482decc67e55944648f8cba97e.

It removes the newline even when there are no fences attached to a
struct dma_resv, leading to multiple BOs being output on the same line,
making the debug file less readable, not more as the commit intended.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 5d9d137209b6..1b6c32a177fb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1701,9 +1701,8 @@ u64 amdgpu_bo_print_info(int id, struct amdgpu_bo *bo, struct seq_file *m)
 	if (dma_resv_trylock(bo->tbo.base.resv)) {
 		dma_resv_describe(bo->tbo.base.resv, m);
 		dma_resv_unlock(bo->tbo.base.resv);
-	} else {
-		seq_puts(m, "\n");
 	}
+	seq_puts(m, "\n");
 
 	return size;
 }

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260908-amdgpu_debugfs-b53ad127f36a

Best regards,
--  
Thadeu Lima de Souza Cascardo <cascardo@igalia.com>

