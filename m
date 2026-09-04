Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF15221F2F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788493450; cv=none; b=jI2YdMpEPN2Xpz7uT06rjxyrzaO1DV0h6F0NeAjP8ANmBcdvOyKVNhZz9CjkPVuaN7tJJ+FqkvCEc74tQCqWL0ScQvug3JRISYazCQ7jNjIov59Oc9ajc6czeplM4Y4MVHopc1rm+nsFSDW/E5beiqWboBF3WMS+mJPa6mN8awQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788493450; c=relaxed/simple;
	bh=vsI3Az6PtAYAQ2R8ZZ4L6U4QNRzBfojx12v3oaqkM4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y05jLEAZceWwZJOBWFqg+LYETMECa/ZAvhrH4mSba9MA1B3m6e991Hj8GBt2JL9ZX7/J6cBaX1ZyPGPTVRQWsrfxE0rSv3R7hzEq82GLFW6eBeJaqyD9NalpQ/xeaIG0WF/VCJ+yspNBH3VaPKWeGWr2Fjs+RW/7fYHweGtLMWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DvU6f886; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DvU6f886"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788493448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ge1qomVxwnUyR3gHiawBlAs7kARoXRyBci0Mn9ayFts=;
	b=DvU6f886vYZK/quNHmguUNatWqNQXe+eoetyEwiAM8O3DmYT/gaEjKMjNgpUVW6C7g0bwN
	HwHUXgONJmYecSFGVjdFC4hIPN9lj8acOivWOan6XOQZDigmgBLZRCrWddS4c4m8AEYYtT
	W0/LxyZ0jaCxTzJC/FZChprtyLz7pTU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-73-zjKFvbxnNw6otAT5LwsaBg-1; Thu,
 03 Sep 2026 23:44:05 -0400
X-MC-Unique: zjKFvbxnNw6otAT5LwsaBg-1
X-Mimecast-MFC-AGG-ID: zjKFvbxnNw6otAT5LwsaBg_1788493444
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 068F519055C7;
	Fri,  4 Sep 2026 03:44:04 +0000 (UTC)
Received: from hpa-thinkpadx1carbongen12.taipei.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6345E1956049;
	Fri,  4 Sep 2026 03:44:00 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Hans de Goede <hansg@kernel.org>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH] media: i2c: cvs: Add Lattice device quirk for VID:0x2ac1 PID:0x20d1
Date: Fri,  4 Sep 2026 11:43:44 +0800
Message-ID: <20260904034344.105034-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On Dell laptops such as the XPS 14 (DA14250), the IPU6 camera fails to
initialize due to a missing device quirk for the Lattice device. The
kernel logs the following error during probe:

[  7.299665] intel_cvs i2c-INTC10E0:00: No quirks for device (VID:0x2ac1 PID:0x20d1)
[  7.299976] intel_cvs i2c-INTC10E0:00: error -EREMOTEIO: get caps failed
[  7.300026] intel_cvs i2c-INTC10E0:00: probe with driver intel_cvs failed with error -121

Add a matching quirk entry for VID 0x2ac1 and PID 0x20d1 to allow
intel_cvs to configure the device properly and enable the camera.

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2526246
Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/media/i2c/cvs/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/cvs/core.c b/drivers/media/i2c/cvs/core.c
index d4a3b9c3bab1..acf8a4f7e79f 100644
--- a/drivers/media/i2c/cvs/core.c
+++ b/drivers/media/i2c/cvs/core.c
@@ -70,6 +70,13 @@ static const struct icvs_device_quirk cvs_quirk_table[] = {
 			  ICVS_NO_CAPS |
 			  ICVS_NO_FW_UPDATE
 	},	/* Lattice NX33 */
+	{ 0x2ac1, 0x20d1, ICVS_NO_MIPI_CONFIG |
+			  ICVS_NO_CAPS |
+			  ICVS_NO_FW_UPDATE
+	},	/*
+		 * The Lattice device was found on a Dell laptop
+		 * XPS 14 (Dell 14 Premium) DA14250
+		 */
 	{ 0x06CB, 0x0701, ICVS_SKIP_FW_RESET |
 			  ICVS_HOST_SENSOR_PWR_CTRL |
 			  ICVS_HOST_PRIV_CTRL |
-- 
2.55.0

