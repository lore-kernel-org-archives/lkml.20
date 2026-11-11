Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363590;
	b=YUW32W3pRRX3UxFuqCRKNTnn/pB5qH+iyTTum08Kb/6353N2mZWY/AooAO7GrG972NfY
	 FLZr5HSXBIYS9XFJvalo0rsK7Kr5Li5RzJ8ZVY/NzlKD2ccZeoZfD7mwxnZh0HhzN0vQr
	 aqovl/qcwon/5Z+BkL6OtUO6O/213MpMOX25NLgyOTkba5Zau5Q3ZBZrf85Mt7DXhJNbv
	 CQmjX/BvXCb7puIGvYXQU/KOxAMvzYo7josSmUChpZ0Tk0MpjI5cOUg71F1OykplAFJDy
	 xpfOsJL9E2oGcWN/YT+K2OnyP2HoaLtJ8WhIdo1MZQap9U0Z9WlhKeJZFiufa85Y0iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363590;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hqDLG5nke2eWUptj8CzHQrTSvJsbFZq5eNN4uCjv9Og=;
	b=j3wv+sJs8umH/F24Rjftd5vhXvf01w8QZz5ksGRBiRDkjpPSmXuUQeV/xdGOYAvzY4Ii
	 hPH/d/pyD7Q8i5Ic4DOL9k0nL/FKo5MvL5nnZogJ/dNPeFXZkLLF2d07IYJyHsSsGZb+D
	 TwDjejCllveZE9a0TMAT9tXms7GK+MAhyhSyA6kR5Ew5Q11yD+NFFu7rpI9Ceot6jFvhM
	 Eq+zKYxMsFCcAc5WFVjda6YN0z6rQxTvvfgURHHYR8YGZoTfhX+kjd7FAwkwD//B8d1b0
	 RZAYvNZCV7l4AozDRgimhUrePVY3ntwoQmdh43SET2Musrmikc7l2uGDpEEy8qaW7HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D985F606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D985F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 5965507cdd7611f19a56ed5b684f684d-20261111
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:9feff2f6-f5f3-4882-b931-a01fd0033328,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:a7851dff72ab5b088ff156a276a90d5c,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|123|850|865|898,TC:nil,Content:0|15|50|9
	9,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5965507cdd7611f19a56ed5b684f684d-20261111
X-User: yaolu@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yaolu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 635501697; Wed, 11 Nov 2026 10:19:40 +0800
From: yaolu@kylinos.cn
To: harry.wentland@amd.com,
	sunpeng.li@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: siqueira@igalia.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Lu Yao <yaolu@kylinos.cn>
Subject: [PATCH v2] drm/amd/display: Fix dm i2c adapter lifetime on teardown
Date: Wed, 11 Nov 2026 10:19:25 +0800
Message-Id: <20261111021925.63610-1-yaolu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261110070204.307887-1-yaolu@kylinos.cn>
References: <20261110070204.307887-1-yaolu@kylinos.cn>
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

From: Lu Yao <yaolu@kylinos.cn>

devm_i2c_add_adapter() only calls i2c_del_adapter() on teardown, so
struct amdgpu_i2c_adapter is never freed.  Since
commit 5b3eca05cfb0 ("drm/amd/display: Use devm_i2c_add_adapter to simplify i2c cleanup logic")
every dm i2c adapter leaks on unload.

The connector_init error path cannot kfree() it either: the adapter is
still registered, so devres release would causing UAF.

On the init failure path dc_destroy() also frees i2c->ddc_service before
dm_hw_init() releases the devres group, so there also may causing UAF.

Allocate the adapter with devm_kzalloc_obj() and release the devres group
in amdgpu_dm_fini() right before dc_destroy().

Fixes: 5b3eca05cfb0 ("drm/amd/display: Use devm_i2c_add_adapter to simplify i2c cleanup logic")
Signed-off-by: Lu Yao <yaolu@kylinos.cn>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 ++++++---------
 .../amd/display/amdgpu_dm/amdgpu_dm_connector.c   | 13 ++++---------
 2 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0ea45ab12119..5dbc00e6ee63 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -961,6 +961,11 @@ static void amdgpu_dm_fini(struct amdgpu_device *adev)
 
 	amdgpu_dm_irq_fini(adev);
 
+	if (adev->dm.i2c_devres_group) {
+		devres_release_group(adev->dev, adev->dm.i2c_devres_group);
+		adev->dm.i2c_devres_group = NULL;
+	}
+
 	/* DC Destroy TODO: Replace destroy DAL */
 	if (adev->dm.dc)
 		dc_destroy(&adev->dm.dc);
@@ -1364,7 +1369,6 @@ STATIC_IFN_KUNIT int dm_oem_i2c_hw_init(struct amdgpu_device *adev)
 		r = devm_i2c_add_adapter(adev->dev, &oem_i2c->base);
 		if (r) {
 			drm_info(adev_to_drm(adev), "Failed to register oem i2c\n");
-			kfree(oem_i2c);
 			return r;
 		}
 		dm->oem_i2c = oem_i2c;
@@ -1406,7 +1410,7 @@ static int dm_hw_init(struct amdgpu_ip_block *ip_block)
 	/* Create DAL display manager */
 	r = amdgpu_dm_init(adev);
 	if (r)
-		goto err_release_i2c;
+		return r;
 	amdgpu_dm_hpd_init(adev);
 
 	r = dm_oem_i2c_hw_init(adev);
@@ -1415,10 +1419,6 @@ static int dm_hw_init(struct amdgpu_ip_block *ip_block)
 
 	devres_close_group(adev->dev, adev->dm.i2c_devres_group);
 	return 0;
-
-err_release_i2c:
-	devres_release_group(adev->dev, adev->dm.i2c_devres_group);
-	return r;
 }
 
 /**
@@ -1433,9 +1433,6 @@ static int dm_hw_fini(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
 
-	if (adev->dm.i2c_devres_group)
-		devres_release_group(adev->dev, adev->dm.i2c_devres_group);
-
 	amdgpu_dm_hpd_fini(adev);
 
 	amdgpu_dm_fini(adev);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
index b498fc5fbb14..2e262f8ffc5f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
@@ -3427,7 +3427,7 @@ amdgpu_dm_create_i2c(struct ddc_service *ddc_service, bool oem)
 	struct amdgpu_device *adev = ddc_service->ctx->driver_context;
 	struct amdgpu_i2c_adapter *i2c;
 
-	i2c = kzalloc_obj(struct amdgpu_i2c_adapter);
+	i2c = devm_kzalloc_obj(adev->dev, struct amdgpu_i2c_adapter);
 	if (!i2c)
 		return NULL;
 	i2c->base.owner = THIS_MODULE;
@@ -3499,7 +3499,7 @@ int amdgpu_dm_connector_init(struct amdgpu_display_manager *dm,
 
 	if (res) {
 		drm_err(adev_to_drm(dm->adev), "Failed to register hw i2c %d\n", link->link_index);
-		goto out_free;
+		return res;
 	}
 
 	connector_type = to_drm_connector_type(link->connector_signal, link->link_id.id);
@@ -3514,7 +3514,7 @@ int amdgpu_dm_connector_init(struct amdgpu_display_manager *dm,
 	if (res) {
 		drm_err(adev_to_drm(dm->adev), "connector_init failed\n");
 		aconnector->connector_id = -1;
-		goto out_free;
+		return res;
 	}
 
 	drm_connector_helper_add(
@@ -3538,12 +3538,7 @@ int amdgpu_dm_connector_init(struct amdgpu_display_manager *dm,
 	if (dc_is_dp_signal(link->connector_signal))
 		amdgpu_dm_initialize_dp_connector(dm, aconnector, link->link_index);
 
-out_free:
-	if (res) {
-		kfree(i2c);
-		aconnector->i2c = NULL;
-	}
-	return res;
+	return 0;
 }
 EXPORT_IF_KUNIT(amdgpu_dm_connector_init);
 
-- 
2.25.1

