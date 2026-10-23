Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740537;
	b=if6Kdpi8d4RkienraW3GLmkZQEa71B5nVb4Y3Q9qsbVdNJuzNdFdvPtI9j+ainoi1/oG
	 gt3XluFZ2jCbVTrBSVQkSzEMl2F6/DWKQNF1pxSIbpslS12GtN9A+s+2ub3dfNmk/T4Hw
	 hW/P0Vv6EqPgfb2Pfv9koUFWS4w65SA37fRC2MHQsyrExwZWuT5izHhgtG8m55j6SoQbS
	 2PQNGueL98CnLsTs9j2lV2MHMo4Dv+Gm3MWbYO7K6z5zIfKh5senE3T0cgDF4J4/wcGlq
	 /WCxgIcQzjkYsQZ35PrDJ8DRTtWmDcRunllIckMpF7SIJZkiOAvW8GEC7TXw/VL66qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740537;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=BRW6JbfIBewSRrs6cwpy1UkfXfBy3mR2z/T5ohaWkwI=;
	b=4YjCRHw4OT84KxEI8OWW+XlP9h9hK86KRtAB+lPgSV2NEjwlIx/PjOJTRv0gofknpw7P
	 n+KuJgjwlGCSWa5GSE1WyfHz9yt1fH/nd4hRJhjaxzyy3k4xhtp/5Eq+yL10X+W7mFISC
	 t93j+KD3i+i98NY366shmbtLLAbmLOFJX4yPLlBHahG9kmWz31G28Y/sWutyrm1V4Xp7x
	 fe+m9b5B3kSGrT3yGcjt1Pk29ccLvZ4C53HI4mkLpJeGd9dCe3zAM/K39Do2NTZMBMt9q
	 wp5sJZwBBbrJG7+GvY+IMIACSU2GApU4pM6NVnfndrAQ+9TbjpKLshgk+TH/mrHWbTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fbxCJFxJ;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AABF606A31A;
	Fri, 23 Oct 2026 07:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AABF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fbxCJFxJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=BR
	W6JbfIBewSRrs6cwpy1UkfXfBy3mR2z/T5ohaWkwI=; b=fbxCJFxJ9Cfqbdddyy
	M3aoFYxGWH5vvz/LtDSMMotMxOi/lXSrl6BaiDEx+YTdGI3m3X1QNAUf0sXsevGF
	e/n52vz1H/SCRN2LfbTQ7TDzjHIasKL7p3fVxU0I23bKxKmqx+AMGsiWUFedq63m
	uH5Q4r2f4izyB5QUZR090wWYI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD394d9DNtqgRCoBw--.25139S2;
	Fri, 23 Oct 2026 15:27:59 +0800 (CST)
From: oushixiong1025@163.com
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] drm/msm: Report primary minor index as gpu_mem_total gpu_id
Date: Fri, 23 Oct 2026 15:26:44 +0800
Message-Id: <20261023072644.542364-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:_____wD394d9DNtqgRCoBw--.25139S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFyUGFyfXry8JF47JFykuFg_yoW8XFyUpr
	ZrWa4qyr18AanFvayxGFsxuw45W392qayrGryjv39rWw18Kr1q9F95ta4Yyry7Ja97CrW5
	X3WDGFWUXF10vw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jn2-5UUUUU=
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbC4R+zwmrbDH8TYQAA3-

From: Shixiong Ou <oushixiong@kylinos.cn>

Both gpu_mem_total emissions hardcode gpu_id 0, so events from multiple
GPUs are indistinguishable. Report dev->primary->index instead, as xe
already does in commit ce3d39fae3d3 ("drm/xe/bo: add GPU memory trace
points").

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/msm/msm_gem.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 130ae27ee00b..46dada0b2fa0 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -28,7 +28,7 @@ MODULE_IMPORT_NS("DMA_BUF");
 static void update_device_mem(struct msm_drm_private *priv, ssize_t size)
 {
 	uint64_t total_mem = atomic64_add_return(size, &priv->total_mem);
-	trace_gpu_mem_total(0, 0, total_mem);
+	trace_gpu_mem_total(priv->dev->primary->index, 0, total_mem);
 }
 
 static void update_ctx_mem(struct drm_file *file, ssize_t size)
@@ -37,7 +37,8 @@ static void update_ctx_mem(struct drm_file *file, ssize_t size)
 	uint64_t ctx_mem = atomic64_add_return(size, &ctx->ctx_mem);
 
 	rcu_read_lock(); /* Locks file->pid! */
-	trace_gpu_mem_total(0, pid_nr(rcu_dereference(file->pid)), ctx_mem);
+	trace_gpu_mem_total(file->minor->dev->primary->index,
+			    pid_nr(rcu_dereference(file->pid)), ctx_mem);
 	rcu_read_unlock();
 
 }
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus

