Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5780A45FFB6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776766; cv=none; b=nr2Rm+GxNNGttox7ZspZh92a2qbQ4ekNuEHE/zBnZ1AuyzNm/sfnYbdtvt6Ad3jPUD9+QdfdId5WXQo6GH31VS9RhD3/Jx/Z6DfuqTsj+D+o9WcF/tSuYd5TrxfZqh5qiI0qMZPAbxh3CuGDY1Jf7amBoavxUcnHqXf9A3Mb5Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776766; c=relaxed/simple;
	bh=vsI3Az6PtAYAQ2R8ZZ4L6U4QNRzBfojx12v3oaqkM4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBmaYsPTASaKx67OBy0nuZu5xs4WAZgCYGa/vLFfUpw9mVZWc9fMcNzgQTRYV3PblnWMafCzfUaC6cSv77Wozh7TXlJyLAnQleexGxFSfvRPd4BDiPhhvQRZTUucLIDS/mClRfcxZ+WrxidVSAZtqnUXyMWTOJkSxy6fD3u42lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a3d6U0EQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a3d6U0EQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788776763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ge1qomVxwnUyR3gHiawBlAs7kARoXRyBci0Mn9ayFts=;
	b=a3d6U0EQixtEIPMsHdsG1fQ2rvhgUIQeYZ55GyqGss2Pfd8O9dMeDn6FgDUVF4UIuvjVND
	kDKlQBA0cemY7kFh9fMvrNb1VNgCCwecswHm/39jRQd1/fuaAS3/+KfUtCOXqELgBEbN2P
	kEJXCw5nMq23fRbpp5zE41pLUDJuyUc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-413-0ep0PltANlSPYu1RXF-MCw-1; Mon,
 07 Sep 2026 06:25:58 -0400
X-MC-Unique: 0ep0PltANlSPYu1RXF-MCw-1
X-Mimecast-MFC-AGG-ID: 0ep0PltANlSPYu1RXF-MCw_1788776756
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2991519540CC;
	Mon,  7 Sep 2026 10:25:56 +0000 (UTC)
Received: from hpa-thinkpadx1carbongen12.taipei.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 31AD71800348;
	Mon,  7 Sep 2026 10:25:50 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Miguel Vadillo <miguel.vadillo@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mihail Antsev <mihail.antcev@gmail.com>,
	=?UTF-8?q?Jos=C3=A9=20Mar=C3=ADa=20Mart=C3=ADn?= <jmmartinf@hotmail.com>,
	Leif Skunberg <diamondback@cohunt.app>,
	Samuele Angioli <samuele.angioli@inspect.it>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v2 1/2] media: i2c: cvs: Add Lattice device quirk for VID:0x2ac1 PID:0x20d1
Date: Mon,  7 Sep 2026 18:25:03 +0800
Message-ID: <20260907102504.60512-2-hpa@redhat.com>
In-Reply-To: <20260907102504.60512-1-hpa@redhat.com>
References: <20260907102504.60512-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

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

