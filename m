Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.254.168.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943743;
	b=o4VN2G4DtPjK6DaohAF/yTdzWZDuAQ4mE+ofWdcERWYmCfRPFhrWvemPXIUZ4ycxj1Oz
	 06KPmOC5MaL6+YjC4S6NPEepZ8Vx3xzk66CRN8ApqecgW4vThiikLXzafSs/hqq3XcBk7
	 reY/Il1OnuV+uPmYv4GPrD+VKLN169NGdh42lwds/GfDcXDYY+1o8evEquj4bXxVvAPVh
	 /N3hIkWfL2xkIFdJBmqy5sa1NDSRkmEkSAnZ662DkJUs/oqOSvg63VCA6aiOX/CWwl99U
	 b+2vQOvIux/X1th2WgZwTgJuBQ0Ae1UP1q39gsnx6mPEqs18aG61d0bCPvZQ1wYOMSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943743;
	h=DMARC-Filter:Received:Received:Received:X-Authinfo:
	 X-Hiworks-Remote-IP:X-Hiworks-User:X-MailFrom-INFO:Received:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MNTWIR2uwNU8blRgrAJq9AARP3JcIBTfIYSp5el+RRc=;
	b=5sisGtlQnByNmKpqgCU6KtgA99aO0j+fmmwpIwvzaWUEiQ9hLIk7mbjc6k4Ocb0dCIaE
	 nFxBOtCrnk88JgAgge+LmMYduHwSRGHE2AMfYBUW01G4Z9a8b07r2GSVP7NXtKzrriImW
	 5XHPFzpAW9MEEz8UVQo2KKcDnFZJaA8fSkLXV10PCRFHqUsY2k5jBUFSqh32CeCS29ozu
	 fMLTed+Z38MbGKA6vwJE/YKfMMcOlIlrulrmigVZhjE+wT3xhzlLRBWaS45ZQF+9hDTOy
	 EaONu9rWJRU4vFlh2G5GbEKtE1hKzpOg8TjchRWRi/YLW9DK6IeEl0mg7H/b1PVQYUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=nirvanahyj.com;
	spf=pass smtp.mailfrom=nirvanahyj.com;
	arc=none smtp.remote-ip=121.254.168.203
Received: from smtp4.hiworks.co.kr (smtp4.hiworks.co.kr [121.254.168.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE44606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DE44606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nirvanahyj.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nirvanahyj.com
Received: from hi-smtp-node4 (unknown [172.18.0.2])
	by smtp4.hiworks.co.kr (Postfix) with ESMTPS id 4jLSk46nvbzfp11r
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:42:20 +0900 (KST)
Received: from hi-smtp-node1 (unknown [192.168.71.167])
	by hi-smtp-node4 (Postfix) with ESMTP id 4jLSk46fX5zQLCTP
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:42:20 +0900 (KST)
Received: from hi-total-node5 (amphora-3294b420-308a-4b9e-8a1d-bf25580dae1f.openstack.gabia.io)
 	by hi-smtp-node1 with ESMTP id 3nxulxlrsj5r3oel;
 	Fri, 06 Nov 2026 14:42:20 +0900 (KST)
X-Authinfo: HIWORKS SMTP authenticated <nirvanah@nirvanahyj.com|114.203.237.180|nirvanah@nirvanahyj.com|261106144220_6981351674>
X-Hiworks-Remote-IP: 114.203.237.180
X-Hiworks-User: (SASL_USER) nirvanah@nirvanahyj.com
X-MailFrom-INFO: <country_code:KR|rbl_level:0>
Received: from localhost.localdomain (unknown [114.203.237.180])
	(Authenticated sender: nirvanah@nirvanahyj.com)
	by hi-total-node5 (Postfix) with ESMTPSA id 4jLSk33fXvzSqYcS;
	Fri,  6 Nov 2026 14:42:19 +0900 (KST)
From: Young-Jun Hong <nirvanah@nirvanahyj.com>
To: 
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alexey Sheplyakov <asheplyakov@basealt.ru>,
	"Vadim V. Vlasov" <vadim.vlasov@elpitech.ru>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] drm/panfrost: only put powered shader cores in the job affinity
Date: Fri,  6 Nov 2026 14:41:50 +0900
Message-ID: <20261106054210.2893230-4-nirvanah@nirvanahyj.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106054210.2893230-1-nirvanah@nirvanahyj.com>
References: <20261106054210.2893230-1-nirvanah@nirvanahyj.com>
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

On GPUs with more than one L2 (core group), panfrost powers only the
first core group (panfrost_get_core_mask()), but the job affinity is
written from shader_present, i.e. it also names the cores of the second,
unpowered group (Mali-T628 MP6 on Exynos 5422: l2_present 0x11, 4+2
cores, affinity 0x3f while only 0x0f is powered).

Write the affinity from the same mask that was powered, so a job never
names cores that are off.

Tested on Samsung ARTIK 10 (Exynos 5422), Mali-T628 MP6.

The analysis, the code and this changelog were produced with Claude
Code (Anthropic), a coding assistant.

Fixes: 6e55d273708b ("drm/panfrost: initial dual core group GPUs support")
Signed-off-by: Young-Jun Hong <nirvanah@nirvanahyj.com>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c | 6 ++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.h | 1 +
 drivers/gpu/drm/panfrost/panfrost_job.c | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 6081b27829e1..420d224276a5 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -452,6 +452,12 @@ static u64 panfrost_get_core_mask(struct panfrost_device *pfdev)
 	return core_mask;
 }
 
+/* cores that panfrost_gpu_power_on() powers */
+u64 panfrost_powered_core_mask(struct panfrost_device *pfdev)
+{
+	return pfdev->features.shader_present & panfrost_get_core_mask(pfdev);
+}
+
 void panfrost_gpu_power_on(struct panfrost_device *pfdev)
 {
 	int ret;
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.h b/drivers/gpu/drm/panfrost/panfrost_gpu.h
index b4fef11211d5..78a6270b7fcb 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.h
@@ -13,6 +13,7 @@ void panfrost_gpu_fini(struct panfrost_device *pfdev);
 u32 panfrost_gpu_get_latest_flush_id(struct panfrost_device *pfdev);
 
 int panfrost_gpu_soft_reset(struct panfrost_device *pfdev);
+u64 panfrost_powered_core_mask(struct panfrost_device *pfdev);
 void panfrost_gpu_power_on(struct panfrost_device *pfdev);
 void panfrost_gpu_power_off(struct panfrost_device *pfdev);
 void panfrost_gpu_suspend_irq(struct panfrost_device *pfdev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 4ddf4b722ddf..33da86587db7 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -143,7 +143,7 @@ static void panfrost_job_write_affinity(struct panfrost_device *pfdev,
 	 * Eventually we may need to support tiler only jobs and h/w with
 	 * multiple (2) coherent core groups
 	 */
-	affinity = pfdev->features.shader_present;
+	affinity = panfrost_powered_core_mask(pfdev);
 
 	job_write(pfdev, JS_AFFINITY_NEXT_LO(js), lower_32_bits(affinity));
 	job_write(pfdev, JS_AFFINITY_NEXT_HI(js), upper_32_bits(affinity));
-- 
2.47.3

