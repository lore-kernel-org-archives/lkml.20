Received: from mta0.migadu.com (out-17.mta0.migadu.com [91.218.175.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55563468C27
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383451; cv=none; b=Q7mzWqkVc5mo1DfqWnI7A/ahSXMvZ1kOyfQ2aZjXOYIopQyhOvWJzXpcUmgTgAvYK/rI2nMh4aAdPVY9ygN446+Z8KlGkvNpb8Dt5A9sGoJDC8XGqtazH26XZ+Z59eG/m4vyR4tBKriPzhh8EoRTg6dW/f31R+bG6uhjUDZlSb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383451; c=relaxed/simple;
	bh=k9AnQ5XvJt8ZcIfhZU8VWP5jz5T3cT4ex6UF/oaPJlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OEekYm8jfRIYumWYefvzmKjlwwfyaFC0kfw4xr244Q44gjBgdHEA9YmOZJ2YxMjmz7tngUOx8Q99D0u/4dH+qutV/KTxyznskvdbSzYtCDJB7fgOsjoHYl14bi4D+6/rhlSd2MB1NFAhnklC5rJKdImX06aJH/HsxOSDMxnvTCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mary.zone; spf=pass smtp.mailfrom=mary.zone; dkim=pass (2048-bit key) header.d=mary.zone header.i=@mary.zone header.b=kCRptUWU; arc=none smtp.client-ip=91.218.175.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mary.zone
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mary.zone
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mary.zone header.i=@mary.zone header.b="kCRptUWU"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=k9AnQ5XvJt8ZcIfhZU8VWP5jz5T3cT4ex6UF/oaPJlM=;
 c=simple/simple; d=mary.zone;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791383439; v=1; x=1791988239;
 b=kCRptUWUrIdISXwM/8ZyXEvARlLscGcc8JXqzcu3ibTjfv0I7RF7itx9wS5nmhPDDiOK9k1l
 M9vLk+dhD0Dq0zqDL8CJH99QpFwmgO8QQkBZXLqBVfitvcRJG9GTNlNzxxuLIhTPiW6WO2kf12O
 ZaUZY+YBA7JbqD+rOpFOHfGfCNKUlmrTnVHtueidqTrQO2SxyEsMSTaLnb3o6acgy8kC7cqiMCO
 7gxK9lkYHck7wTBDRr/aStwpmckvdP8+JnZYlJEuLH2RG/KIixHbouD/HtgVRisRj1M5ZK/ry2N
 sfwBNi3Yctd/BYGuMSurMZ8ut6dzjn6wi/NAZuuWg45pQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c8ba96c4795c968d;
	Wed, 07 Oct 2026 14:30:33 +0000
X-Mizu-Trace-ID: c8ba96c4795c968d
X-Migadu-Flow: FLOW_OUT
From: Mary Guillemard <mary@mary.zone>
Date: Wed, 07 Oct 2026 16:30:15 +0200
Subject: [PATCH] drm/nouveau: Skip the Turing CE workaround object for
 non-GR channels
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-turing-async-ce-fix-v1-1-12ee6ccd1a3c@mary.zone>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvyJ7bkFFkvpKdBDdbC8WWlGEf086z
 sDMC4UyU4FRvJDp4sJbaqA6AX51KRJyaAxa6l5JafE4M6eIrjzJoydc+EajSdmBtA3GQSv3TE3
 /12mu9QNVwD9XZQAAAA==
X-Change-ID: 20261007-turing-async-ce-fix-42e179e27d4a
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Mary Guillemard <mary@mary.zone>
X-Mailer: b4 0.14.3

This workaround is here for the old Gallium driver and predate async CE
and NVDEC.  Instead of only skipping it for NVDEC, let's only apply it
in case of GR channels.

This should make async CE work properly on Turing by stopping the assign
of a GRCE. (here CE0)

Signed-off-by: Mary Guillemard <mary@mary.zone>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index e907c1d07887..e876f154963d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -488,7 +488,7 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 			goto done;
 		break;
 	case NV_DEVICE_INFO_V0_TURING:
-		if (engine != NV_DEVICE_HOST_RUNLIST_ENGINES_NVDEC) {
+		if (engine == NV_DEVICE_HOST_RUNLIST_ENGINES_GR) {
 			ret = nvif_object_ctor(&chan->chan->user, "abi16CeWar",
 					       0, TURING_DMA_COPY_A, NULL, 0,
 					       &chan->ce);

---
base-commit: 70456f05d4b6396b22048c4b8cd3cb98ecf9f9e3
change-id: 20261007-turing-async-ce-fix-42e179e27d4a

Best regards,
-- 
Mary Guillemard <mary@mary.zone>

