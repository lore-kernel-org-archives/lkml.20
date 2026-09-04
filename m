Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8883B71B9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508306; cv=none; b=ShTOk5r+BZudB8qLSuN8iLNsbWP4rHdQ3svQYd2GKwEzjj0FFGDq6R6OFhe+Ei67uSKKq2cBqIx9kU+ObJGJgeOhq4c8GRZzh1WOUrbRT734O4ojTv6XjtB4+tJZnRH/UMtqVJkSZrfl1lA9SJVoR0na7Nn4Yrnmz+4OBnR6UEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508306; c=relaxed/simple;
	bh=nneXBwY8HKJPvinM0pRgTWfvkeMfpmqsCYtbYI4c2+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BMZvgTSG8jyxliSFXr77D/IxqYDpYyKkQj0OrlXB2K5wNPFawvmqB8QQw8ZhgL2Ss1it4DRiDp8xw/23X3oa/f0kwDIRa86w0Y7tADK/9/91fDP37a4GMfOBUYigdOXWzXZIVSa9bBvHZa8TN8eUjsN0ye8mXrSw9s0mnInVKeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=igMM4HSG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="igMM4HSG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788508303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gdBhk9sOhs+VzTAXh4Hh7u6l52/P77aXQhA3RXIaOjI=;
	b=igMM4HSGOWU1u7RHmdB6qKCWZNAZjGrlVkyMpz7LJwF7DgbW9Q9tKLUR/vVKwbAMWdbQMR
	cHAVeyVTNtyGNpLTEuNuIjbOMocQO508muEcELrktbjpGSj2YZw2Jk0lO3rXmipS3ljBvq
	ZDup+7R8rUXv7ovE99Sqbnug9qegGcA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-212-BQQesCthPEijmf79OqztGQ-1; Fri,
 04 Sep 2026 03:51:39 -0400
X-MC-Unique: BQQesCthPEijmf79OqztGQ-1
X-Mimecast-MFC-AGG-ID: BQQesCthPEijmf79OqztGQ_1788508298
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C7365195F14E;
	Fri,  4 Sep 2026 07:51:37 +0000 (UTC)
Received: from hpa-thinkpadx1carbongen12.taipei.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4A83E18001D0;
	Fri,  4 Sep 2026 07:51:33 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v2 0/3] media: i2c: imx471: Add line length PCK setting and calculate pixel rate based on external clock rate
Date: Fri,  4 Sep 2026 15:51:10 +0800
Message-ID: <20260904075113.125751-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

This patchset adds the line length PCK setting and calculates the pixel
rate based on the external clock rate.

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
  media: i2c: imx471: Add line length PCK setting
  media: i2c: imx471: Name the PLL registers in the OP domain
  media: i2c: imx471: Calculate pixel rate based on external clock rate

 drivers/media/i2c/imx471.c | 39 ++++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 10 deletions(-)

-- 
2.55.0

