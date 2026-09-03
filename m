Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE62F43FD28;
	Thu,  3 Sep 2026 08:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423153; cv=none; b=scViezmluYWJQc2gXAaz01G5pEy/v40SJ1at/yww9G+rRN5X+Oz53x9bx5v3XXQoh58bEj65pVdkKF6i6lKDJfkFNvwaxo6qge4XT4OwlgXi2DRMCgjC7HuX9ndXT9bEddUJ+Rdj32N+yed4qFmoXXopYf2yH8H4YWv4BCkcz4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423153; c=relaxed/simple;
	bh=tz9XPpuI0b7AYHXwPKUoDm7SFXA8No3EHko/grgUczE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DiRTldNPNMgC83DCqYBG6+9Tf1nh6PGkhcUE3/CHAoXEk+sakqAxpnRAE4/WR00/FGYFOx8v6yh6tWzCQe9IczRy9X033ixrZe0LrHMA4uNCOvr9tFU0bUFSHH8HqMRKdw0HW+265bh5lbY+IFxIPmbiyA5fBdEFkFhHwJuOjL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mE09lqjo; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mE09lqjo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ue
	bTddbVzrLISkrRXXIKFqExXWpCGFfSEsgXC3YKE2w=; b=mE09lqjoyb+gBpLXR1
	3lUhlm9iyfb0eDE+0FhizAvtrs59H13/VZAJk90rSDcUgjAe34rdS6Im0uvk7FKw
	0v8lxH5nFxBEtw32rIVr1tHWAbKHs1Zv5FQgiU5JT4pfwH5v16L1ZK1xcAKPEN/U
	UJlpgQahtH3kl1Q+qhm8Cc340=
Received: from fedora (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wC3ruLLK5lqppBiAQ--.54802S2;
	Thu, 03 Sep 2026 16:11:56 +0800 (CST)
From: Kean Ren <rh_king@163.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Kean Ren <rh_king@163.com>
Subject: [PATCH] media: uvcvideo: Add quirk for Luxvisions RGB Camera (30c9:0122)
Date: Thu,  3 Sep 2026 16:11:45 +0800
Message-ID: <20260903081145.8382-1-rh_king@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC3ruLLK5lqppBiAQ--.54802S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFW7XFy5KF45GrWrArW7twb_yoW8Gr4Upa
	n0kFWFvrW8GrWfCw4UWwnruFyruan3G3y2kFy3C3yqvFn7Aas3Ja4IyFs09rn0yF4kZw12
	qw18twnIga18tFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi_cTkUUUUU=
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC4Az+rWqZK8xCdAAA3d

The device binds cleanly but delivers no image data; USB autosuspend is
suspending the streaming endpoint. Disable autosuspend for it.

Issue found on Lenovo ThinkPad X13 (codename Zelda, Intel); confirmed
working with this quirk.

Tested-by: Kean Ren <rh_king@163.com>
Signed-off-by: Kean Ren <rh_king@163.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index e289cc71ba98..32bf353013a1 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -3216,6 +3216,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
+	/* Luxvisions Innotech Integrated RGB Camera (Lenovo laptops) */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x30c9,
+	  .idProduct		= 0x0122,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
 	/* Intel Realsense D435i depth camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
--
2.40.0

