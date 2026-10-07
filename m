Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD592C026C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791349332; cv=none; b=rgG5TWoOrdWRqD4niO+l1SpyOi6k9jJytxYPYmNxYhJ/apCkIlbcv65eYXgIcEYRyBQ7WAH1xRnCTh2a+VVk3sYs7YRCgspX32BqIc+zU2lkG51IrGQytZR4ROhwmn2GpiyLPZ0+6WSyZV4BhAHvY5DGnNmiTLVR92B/rH28tWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791349332; c=relaxed/simple;
	bh=kP/OXlQrMRdGLEKk7GUu/hc5ANbnL5z53qh4gK51sJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pfstc2h+PiHnB1etFbyDagqIRaWOXLdG6aUinCdxa3YDLdjc1iRszANmkNtjmGXgAT7Wbxb+YmE73TNoNxH+KFRIZHpGYrdtvNoDpwyxRN5BDf3V/cQ163+c0RQrown7+QBgXxt5QRV6/nImgHWLDCDn0WlUvNWoOKo2f3MW3bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WyZ7bJ/v; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WyZ7bJ/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791349329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YJbSdgMpDk9KdtBTsjYRvYzB90/hAxQvCL2+cHoJDyI=;
	b=WyZ7bJ/vOkCrjXAuA2RlLsUaXDwDtt/ePn3M3Le6Z/KcUhbZhv8nq/vjuE6JYQaQiUVkZx
	9nXg3rrhPdZS4mFuraoOcuU4bNtzXhXUACXcWhK6EvUGRcsi3C9l4QNdmYp6/qLTGBj/VY
	q/D1Wf73OxLDn/nVVzn8dKrmBVL1868=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-483-1DDeeeBtMLW1ZXkLGrUdLw-1; Wed,
 07 Oct 2026 01:02:04 -0400
X-MC-Unique: 1DDeeeBtMLW1ZXkLGrUdLw-1
X-Mimecast-MFC-AGG-ID: 1DDeeeBtMLW1ZXkLGrUdLw_1791349323
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CA5DC1933359;
	Wed,  7 Oct 2026 05:02:02 +0000 (UTC)
Received: from hpa-thinkpadx1carbongen12.taipei.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 136B830002D6;
	Wed,  7 Oct 2026 05:01:59 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Christian Murphy <christian@themurphys.eu>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v3 0/3] media: i2c: imx471: Add line length PCK setting and derive pixel rate from PLL configuration
Date: Wed,  7 Oct 2026 13:01:37 +0800
Message-ID: <20261007050140.26604-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

This patchset adds the line length PCK setting and calculates the pixel
rate based on the external clock rate and PLL configurations.

Changes in v3:
1. The line length PCK is set with the hblank control.
2. Define symbolic names for the PLL registers.
3. Fix the register size for the PLL registers. (0x0300-0x0310)
4. Derive pixel rate from the PLL configuration.

The discussion of pixel rate can be found at the following URL
https://lore.kernel.org/linux-media/CAEth8oHj1Jon9m_4aFzRGoKcdopUMym+MyV0JxTo6F+AUFOLoQ@mail.gmail.com/

Changes in v2:
The patchset contains three patches:
1. Add line length PCK setting
2. Name the PLL registers in the OP domain
3. Calculate pixel rate based on the external clock rate and the PLL
   configurations in the OP domain.

The line length PCK setting is added to the sensor driver to ensure the
pixel rate is correct. The pixel rate is calculated based on the external
clock rate. Moreover, since the sensor runs in the PLL DUAL mode, the
configurations of the OP domain are considered.

Tested with libcamera 0.7.2 and the patchset mitigated the horizontal
line noise.

Changes in v1:
1. Add line length PCK setting

Kate Hsuan (3):
  media: i2c: imx471: Configure line length PCK via hblank control
  media: i2c: imx471: Define symbolic names for PLL registers
  media: i2c: imx471: Derive pixel rate from PLL configuration

 drivers/media/i2c/imx471.c | 70 ++++++++++++++++++++++++--------------
 1 file changed, 45 insertions(+), 25 deletions(-)

-- 
2.55.0

