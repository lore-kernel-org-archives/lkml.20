Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A04C456DF0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776754; cv=none; b=KwfmxJj9zk/Ob4EaJRcvenEcdxMs+JS83qRy++FB9qP9CeGsF/VGViEgZ88cw+RPr55Uc7+KazmBSq5F1sdA7+m6wgzIYfx0RuSmWHqtJFXBoZ3eQ7HxKmoJL6FH61RT3/3caMpSq9OFntg+j5DWUCFgJEJyfJfHPG+1lsFcMB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776754; c=relaxed/simple;
	bh=glsVYnwXgtsoc6JUftaSL2xYONgR6g83rYaqFdODRGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pE3h5GSF80eO67yaA48AlPtrwgbBMCwWO9fyuy+F/4LCnAnlV5ddgaCBB5cblHvYzeuaYS4I/nQmK6I2dqYK/KeEVSVoEGfQ2/0cz9A9hzzODVRo//D4OodP8bpYLftz2GSn2ERyZpr4JhHmuUKHxJQyoV+ukzQqmQZZaVeeqZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dI8EBuLG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dI8EBuLG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788776752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eUsPqY4JoWBmBYE8mM47Nm5hiu9mOUL44Al480RJ508=;
	b=dI8EBuLG04Bc7Glju9cO5nxqFXhp1gGoxQDwO1Fx33tPlQ50u/h4VHcMLEi7ck1mW/RE6V
	VA4UK4ULaNGl4SbTmP6P9TU1nAWMenMILz9yrlrMDjnj6lmwuUHrz8A8QLna30oQ/vBvgF
	KLjfwBT1eLUJjttPRy+wwU1OiUXeIm4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-459-fwPJY9RwPk279ISgaAc-VQ-1; Mon,
 07 Sep 2026 06:25:48 -0400
X-MC-Unique: fwPJY9RwPk279ISgaAc-VQ-1
X-Mimecast-MFC-AGG-ID: fwPJY9RwPk279ISgaAc-VQ_1788776746
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1BC62180255C;
	Mon,  7 Sep 2026 10:25:46 +0000 (UTC)
Received: from hpa-thinkpadx1carbongen12.taipei.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 854141800577;
	Mon,  7 Sep 2026 10:25:40 +0000 (UTC)
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
Subject: [PATCH v2 0/2] media: i2c: cvs: Add Lattice device quirk for VID:0x2ac1 PID:0x20d1 and resolve image upside down issue
Date: Mon,  7 Sep 2026 18:25:02 +0800
Message-ID: <20260907102504.60512-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

This patch series adds a Lattice device quirk for VID:0x2ac1 PID:0x20d1 to
allow intel_cvs to configure the device properly and enable the camera.
It also adds a sensor rotation quirk for Dell XPS 14 (Dell 14 Premium) DA14250
to resolve the image upside down issue.

Changes in v2:
- Add a sensor rotation quirk for Dell XPS 14 (Dell 14 Premium) DA14250
  to resolve the image upside down issue.

Kate Hsuan (2):
  media: i2c: cvs: Add Lattice device quirk for VID:0x2ac1 PID:0x20d1
  media: ipu-bridge: Add sensor rotation quirk for Dell XPS 14 (Dell 14
    Premium) DA14250

 drivers/media/i2c/cvs/core.c         | 7 +++++++
 drivers/media/pci/intel/ipu-bridge.c | 7 +++++++
 2 files changed, 14 insertions(+)

-- 
2.55.0

