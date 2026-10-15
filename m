Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D08545D85
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077920; cv=none; b=a807hJVRfHhKZODQCQ8xjnNRloY9KKK6fqKToZjmMF2IEJOs6XWrmpizB5US5OzlovnfYOjCY6S1olbHPN/1g7s55GJiq/E8ustwMIxwyUTQvyYQEk44LG56dux/BifjsNO5hbFp8Gz9Uk422HIQ4fWepGUc0rzudrrQf53y34I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077920; c=relaxed/simple;
	bh=wTJ/MKrksLVZQfu7+/axrVOiZqprXvPLXKzjnn+lofA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Obgdk0w1Y0CwL9KSn6woIecst1NxP/ZzLYGi/Uqt9gyqmkvPztSZoa6EzoRfyCSqOCYT1GHwMnSYtIM9Zl6PAmUr+M4llLkqJ03nR+Tj9kKjX4ssSYWsnbb/mapyPWva7lSMfhyegCP3fI3JazPwFxWcCtbmLqk0ut0yy7p0bhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kv7GoUfn; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kv7GoUfn"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso50709395ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792077908; x=1792682708; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hVLJrkxHho56UqRaVrS4STKkOiQZB4NXHbPAyATS9iM=;
        b=Kv7GoUfnzCQa1Pasy/T1XTAzDp0b3fQc9MWmLYiU91udQiV59I2elH/zMekLaaE6n/
         OvLDf3owk5QlQ4HVE/X3LWAsUpi53/lD4S8qoIGDh7oxT9VHSgCoOohLfkQeuQy/S+0O
         pxEH2oUeErWjSeNA8/iGnDu0hxtJmCFUe3KLzrEcicQDb/y8lrSZMVPmvnVuEmcWKOQm
         4P7ZMC0/msqb8MawPhOfFdlcyLhx8ajLAXigDuQC76PCE6svccdQSuFoGAAmzK4RjFMi
         vozEYjc2xJ+4xBeWjOJOX7xxA+JxFyMCUsqZ4lpZxJTClaUZrHaR820zkQlctnRmLVBk
         bJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792077908; x=1792682708;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVLJrkxHho56UqRaVrS4STKkOiQZB4NXHbPAyATS9iM=;
        b=qO2wE2o0rAakbM8/aGFlE4ilTd6ofrATnUU/IP2nDKrTLvSvXiqlNVV9g1gL4PYtke
         Or/+GsUit6RmwOW6oF83YoUeE4uOZlrzKXw3D4BnNWdLjn/su6OhXYTJ43Z+5SEYF//5
         mdhgqK6ELJPWXzkZnShLHlTKlZUi10C3PAe7ozM39c2g9UlWRkWOimvbE3Ps1w/bZX4Q
         MFiGb3XNCNHIZ7SaKxdBZ15Zo7q1mD1S1n+n1lN/Q5a2jce2XTJK1ReKdLGn8x9Je68L
         DV+sNpq7sagbrPwGYCRw79qIOinFUhZCaFbNBE1nN/AjMWymIjbSZq+IG/IaoxwC3KGl
         qQtg==
X-Forwarded-Encrypted: i=1; AKwUvByXEhAqooLriQdUtGIwV9uZ8FnhnInxIw34/UdhrasWc9ypt7gN7BX5RbVUzauHjW10SMYvtd+6ekAX3V0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCqrU4N4w3WvSN4Rolfn//BZvgXHQ18HBlXKdGY55DAyXbeXLy
	3rumCBzKLmbxy+oI85Zo8HTp0euJJMGmnWn7p9bhdkkUBo6MnHNXZEUrRIn3LSqQCe5RAHv8vzA
	GeTN/MPtbDA==
X-Received: from plje2.prod.google.com ([2002:a17:902:ed82:b0:2e8:21ee:f199])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19e7:b0:2e6:1a6c:abcd
 with SMTP id d9443c01a7336-2e84280a68fmr192641215ad.3.1792077907624; Thu, 15
 Oct 2026 08:25:07 -0700 (PDT)
Date: Thu, 15 Oct 2026 15:24:57 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261015152458.3541767-1-nkapron@google.com>
Subject: [PATCH] MAINTAINERS: add Neill Kapron as USB Gadget maintainer
From: Neill Kapron <nkapron@google.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, kernel-team@android.com, 
	Neill Kapron <nkapron@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Restore the USB GADGET/PERIPHERAL SUBSYSTEM entry and add myself as
maintainer to help review and maintain USB gadget drivers, core
framework, headers, and documentation.

Signed-off-by: Neill Kapron <nkapron@google.com>
---
 MAINTAINERS | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 65e8a4b5c90b..16560ddf7b7b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28220,6 +28220,28 @@ S:	Maintained
 F:	Documentation/usb/ehci.rst
 F:	drivers/usb/host/ehci*
 
+USB GADGET/PERIPHERAL SUBSYSTEM
+M:	Neill Kapron <nkapron@google.com>
+L:	linux-usb@vger.kernel.org
+S:	Supported
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
+F:	Documentation/ABI/testing/configfs-usb-gadget*
+F:	Documentation/ABI/testing/sysfs-devices-platform-_UDC_-gadget
+F:	Documentation/driver-api/usb/gadget.rst
+F:	Documentation/usb/functionfs*
+F:	Documentation/usb/gadget*
+F:	Documentation/usb/mass-storage.rst
+F:	drivers/usb/gadget/
+F:	include/linux/usb/composite.h
+F:	include/linux/usb/func_utils.h
+F:	include/linux/usb/functionfs.h
+F:	include/linux/usb/g_hid.h
+F:	include/linux/usb/gadget*
+F:	include/uapi/linux/usb/functionfs.h
+F:	include/uapi/linux/usb/g_*.h
+F:	include/uapi/linux/usb/gadgetfs.h
+F:	tools/usb/ffs-*
+
 USB HID/HIDBP DRIVERS (USB KEYBOARDS, MICE, REMOTE CONTROLS, ...)
 M:	Jiri Kosina <jikos@kernel.org>
 M:	Benjamin Tissoires <bentiss@kernel.org>
-- 
2.56.0.385.gd3acb90ef8-goog

