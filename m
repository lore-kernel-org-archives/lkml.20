Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8261F38E8CE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788332842; cv=none; b=u7vuiZHz1U5bkjNklGmfb/p2jjkociBlgi1tP9Fb/mIwwyBCL487vyN2v346WUPdS9kXV8J13vHDJ2Gx9oyQPgZm7LPIgx32uyvGmCS7w9ykQDtNGI/jzwpWWTkWa22+1pnr8yOTVJc0+6K8DqbajHBQs/yr3uJSg1ZSHitbzlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788332842; c=relaxed/simple;
	bh=PDLxLdlP5gcJOxrz6bWr488d4FTMZXtPkhHYlG53cKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lqhegEu3mKUegg0OeJKtOliIWAFwormOmOzqqO/0auyP8B02pEJHOc9TcvSy3VNVwf4DDl2d1oK1pakLtNQaw5U1ycT0k+M0WVV205ieCbQQQrciwMi509ZfONEaWWQnv8GppPN0H3CGVeHagEHOlNVyx811fUGQT8gw7CKbHKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Md37+K2V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Md37+K2V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788332839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MP9PYHiaewFfh82ToUlmgBTheClxMuVqhAl5IkjZgAA=;
	b=Md37+K2VhFnarlA+KAiXX6ECX1Z0R77h5bPtANsHpyOZzdysxctNpFo2X9fdP/5QYkxtuV
	mTiGn9UdmAMegdmloQwG8d/bEGeo5lopAJG7klD2kn4R8rj6sKCMbt/2jwuXfjoYXigRX0
	Fsemqlc+h6iSrpBOCU6JNBvqcSGZFgM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-663-2c0rhef8OcSr82ddPNd26w-1; Wed,
 02 Sept 2026 03:07:18 -0400
X-MC-Unique: 2c0rhef8OcSr82ddPNd26w-1
X-Mimecast-MFC-AGG-ID: 2c0rhef8OcSr82ddPNd26w_1788332837
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E11EB1800146;
	Wed,  2 Sep 2026 07:07:16 +0000 (UTC)
Received: from hpa-thinkpadx1carbongen12.taipei.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E17071800577;
	Wed,  2 Sep 2026 07:07:13 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH] media: i2c: imx471: Set max analog gain to 960
Date: Wed,  2 Sep 2026 15:06:53 +0800
Message-ID: <20260902070653.29186-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

The maximum analog gain was previously restricted to resolve image
flickering and overexposure issues. With recent developments in
libcamera, this limit can now be restored to its original value of
960 to ensure image brightness is properly evaluated and adjusted.

Link: https://raw.githubusercontent.com/intel/ipu6-drivers/refs/heads/master/drivers/media/i2c/imx471.c
Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/media/i2c/imx471.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
index 4053aed84340..8d9c3d0723c0 100644
--- a/drivers/media/i2c/imx471.c
+++ b/drivers/media/i2c/imx471.c
@@ -41,7 +41,7 @@
 /* Analog gain control */
 #define IMX471_REG_ANALOG_GAIN			CCI_REG16(0x0204)
 #define IMX471_ANA_GAIN_MIN			0
-#define IMX471_ANA_GAIN_MAX			800
+#define IMX471_ANA_GAIN_MAX			960
 #define IMX471_ANA_GAIN_STEP			1
 #define IMX471_ANA_GAIN_DEFAULT			0
 
-- 
2.55.0

