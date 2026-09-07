Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAB6468C01
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776773; cv=none; b=Wy6+O7QHqjmoZ1aIZYj3K8tJMN9k8bBZWLvMqsCQm+9lW3H4vRVtIQjsAQCndwtvU67Ku76SzYz8pmlsEIkHTXIpo2n0/k7ISJ1MHGPU1NJRd3bg87qu5AvZFIDSjHFaZ9kEYUr5Q+lvn3a/DfWtEgZNoMY/sJtpkMQyX1RBoik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776773; c=relaxed/simple;
	bh=DlfoCjWl1vqN7yL0k9I9v8zdeEDCwNgjR33R7Mexisk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iazu5dGCVNl5Iy0s03SYlI6OM7YAfjP0s+DWxKyfS/2hcZzn6iEGgB3bFof1+s6w6/FQa9LSv6PPqpDI6U3TVNQqf7jd8JKMNhaIaDOR9ebivZlz7ASU4leBg9zHnAR+FHkSLBqvAQ9PjIjtHDtSUomyuPhPd8lB4/ZcL2CgWOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PIsN4BdM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PIsN4BdM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788776771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kf6cO1d0b7MkQ0Nw3kIN/QTJhiVkoNUU5wdDzDB/auY=;
	b=PIsN4BdMlWMQB8iQoO6AwWE7+7ywSBU4yf59JFiUtxlAJ23v90w4+UgbiKt/xR4SSuppo3
	syayTW49NPgMmE9x63ImGksSWcoCgIJGEkeObB8nzYlJekXHYuHFPsX3D8u3AnUKwAK5fN
	tGyEB7SZz/hUzjxP1SSexU/+qj03cvQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-82-U51eYyZ0OOeKWqbKccmjMQ-1; Mon,
 07 Sep 2026 06:26:06 -0400
X-MC-Unique: U51eYyZ0OOeKWqbKccmjMQ-1
X-Mimecast-MFC-AGG-ID: U51eYyZ0OOeKWqbKccmjMQ_1788776764
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1723F1944DE5;
	Mon,  7 Sep 2026 10:26:04 +0000 (UTC)
Received: from hpa-thinkpadx1carbongen12.taipei.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CA7CC1800348;
	Mon,  7 Sep 2026 10:25:58 +0000 (UTC)
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
Subject: [PATCH v2 2/2] media: ipu-bridge: Add sensor rotation quirk for Dell XPS 14 (Dell 14 Premium) DA14250
Date: Mon,  7 Sep 2026 18:25:04 +0800
Message-ID: <20260907102504.60512-3-hpa@redhat.com>
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

Add "Dell XPS 14 (Dell 14 Premium) DA14250" to the list of systems
requiring a 180-degree sensor rotation quirk. This resolves an issue
where the IPU camera stream is displayed upside-down.

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2510889
Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98d6b..c9f749bd72d3 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -145,6 +145,13 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 		},
 		.driver_data = "OVTI02C1",
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 14 (Dell 14 Premium) DA14250"),
+		},
+		.driver_data = "OVTI02C1",
+	},
 	/*
 	 * The first four characters of DMI_BOARD_NAME identify the Lenovo
 	 * machine type/model. For example, a DMI_BOARD_NAME starting with
-- 
2.55.0

