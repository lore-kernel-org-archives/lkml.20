Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE934A99C4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790273486; cv=pass; b=LhSRrh9HAJnnQINksMs+LAHAx/5rWwnRv66lJdlppnQy/Husddvm5HrnOH3c7Ctuo7lfPaiDVopCPug1PWgzYTheLSmbPADCkKupyrJotBCrT5v9CX6TBGs8d2ReQtn9lHt/1N7/aixtSwbwKE7wlHdG/hC4FpBh0jEQ5tA5KVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790273486; c=relaxed/simple;
	bh=ylClgdA4qjN8YjgAXTrojrPeuTeRxcjN/yXHiltT8+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oJamq3qkZrEO7J6cKlAtKNUc7FjvanjH4bP4ePP8vMTU4x071qY2/oV1vbtNVpREBFweomAzpVnMCBs9yi6kEAunkAUbFwzIQk5J3SIz1FRoH6q83N90dWZjQ905uOLpblXJEzqwcnFtz4lx38CIfIhvE5xMldcTqvgyKLkeQVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=Awnez2wU; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Awnez2wU"
ARC-Seal: i=1; a=rsa-sha256; t=1790273453; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d54TQ6UeWywUn8/3muW7cN9ztxVf5vmiGbqO9DK5KOro7OsRtcYYWu5LxCGaeyIuTSCaCJcfXzHAbc66NhswMcj5V4h2dyt8iYaemq44WuZIPolbjhgUHWJvUfi3s9GsE1KeX3e2HrL6goXlRDlePQNR5BtRhKp61gopjFQTZus=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790273453; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rne2vTyla1RUI4gVDThBMRFsSeWjoijKTX5hYO0ZMA0=; 
	b=LJON/idyglAqfjVj57uRR8+2D9aBxtgzUGFIqETUPuGMIhc+wZF5X1U1QrduK+UOKmRah6Gih7v5QYU0PdmMolF7hdOshwDs+97LZ9SpQm5Poi1OFb0jUSdWS1Rlzsf59R7OmsmdDa+JnLVjPJceeE2WNkwMxhyBmr5BSbZ4RDk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790273453;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=rne2vTyla1RUI4gVDThBMRFsSeWjoijKTX5hYO0ZMA0=;
	b=Awnez2wUiOPOE3vfAOZ5Dd8SyVY2L804wRPInqCCNTt/DWYu5vG0gIwkugJsx4hz
	+IvBMykIm5OEBgkE+Hvztz/9YU9YmcE/o38ahoOge5YWNQs/RvliCt1pVywLK4nd93x
	ZgWIy/EXVzyIijDjpcDxXfv+ng8VTgZyy6rB7x+0=
Received: by smtp.zohomail.com with SMTPS id 1790273453071413.66637539009946;
	Thu, 24 Sep 2026 11:10:53 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Thu, 24 Sep 2026 19:09:30 +0100
Subject: [PATCH v10 13/15] drm/panfrost: Avoid cache flush after perfcnt
 sample in fully coherent systems
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260924-claude-fixes-v10-13-755929b3cc19@collabora.com>
References: <20260924-claude-fixes-v10-0-755929b3cc19@collabora.com>
In-Reply-To: <20260924-claude-fixes-v10-0-755929b3cc19@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, 
 "Marty E. Plummer" <hanetzer@startmail.com>, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt <eric@anholt.net>, 
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Collabora Kernel Team <kernel@collabora.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=ylClgdA4qjN8YjgAXTrojrPeuTeRxcjN/yXHiltT8+A=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqtWdZlu3A6rVuhWiSZjmaLZTsGTxKgiaoLTIYa
 81H6KktgcOJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCarVnWQAKCRAOJn5M7lND
 Pd6SDAC9FivzQjyum+mY0vUF9A7OV4wl/CJ7SR+kuSi8AeUp+42vLyMgmmvTAcfUMcM9ExKj/rP
 h0DQ+Jbdjj3UxLLB2W8KhfzB+IjO4emt7sIcUAIU4oSwcEpC+VyF+zh2YWw9DLDwC4tSnOcjSuG
 mAD3cSNgxFGzx8pf36EjN+HyNJtky44gz3oH6NaOyWCJFyxe2IfqqfijHuw9y3cUC/eHo0AHwFX
 TCYa0Zg/yEQFdRZYfh67H/YDLyJEMtX+f+/L+IQHNpwVNM4DyyK9mIVvjbio6/G3M7qMPAm14sV
 g+Hu1WFrlE8vEQrqaJ94SKcrBzvAkRiuF/fT2GrkBpn5UFhS2Ypu+S1N/u+57hzLi/ChUgwZa9V
 fFLXByCxrLQCuZKY7O+4fs5/vhLcockp7nY8fwOKNxX2r7HxTbIfF6mEDUwLJwOU06REdJB2J2P
 0Vlg2bE3UA/2dzOGsP6/sJGHpfToAlG5izWLXeeS8WEgLsSc/5alhgMO3iN59U5RjvKgM=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

If the GPU and CPU are fully coherent, then there's no need to flush the
GPU caches after a perfcnt sample is made available.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index ffc77121070e..b3f71d7fd82a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -52,7 +52,10 @@ void panfrost_perfcnt_clean_cache_done(struct panfrost_device *pfdev)
 
 void panfrost_perfcnt_sample_done(struct panfrost_device *pfdev)
 {
-	gpu_write(pfdev, GPU_CMD, GPU_CMD_CLEAN_CACHES);
+	if (pfdev->features.selected_coherency != COHERENCY_ACE)
+		gpu_write(pfdev, GPU_CMD, GPU_CMD_CLEAN_CACHES);
+	else
+		complete(&pfdev->perfcnt->dump_comp);
 }
 
 static int panfrost_perfcnt_dump_locked(struct panfrost_device *pfdev)

-- 
2.55.0

