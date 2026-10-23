Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792733252;
	b=yQQ7bRUnvdYwMGgcQ2Ai4+sMgsJL3V+ceIwH1OyyP7FaN+H/SjYhZnhS9nFP6NpcLHTu
	 1Wei/XGv7DW5+m45GWM3fyFDibP2aUfPK6W6Wd3BNVJCv8vx9KWDFzjKuUQ7fuLt1V9f+
	 UqlicbnKuz5zir/1Jx8gJYGlF0R3jtvYjxTZy5QuGFQMxf2F4dXXLxxud0FpW/g/fMjLc
	 Bipt0l9PR+f6UkoBLJonK53XtoZLg6wJ4SyT5azOyJcQ2nQP+0fIegcNhEeHoQ87Wovtp
	 ivMQvvKWf/Hs1HljLvDpezOYdrJJhKRqHmBu+GLG14vE3k8hE6d0TXV2rpZd39asf3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792733252;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HY73xKggEzfIdIfNeMh50oTUfXwZiTldS1Pkgz9mLq8=;
	b=Nh3zjRkl4YWPfEYl8SdEX2iZcg98VqNGOdH27p214hQaWHBkZO6TWFgGvxqogxA5QIvF
	 3c0pFiFndzsYx14ZrYdNWAOWQi7FHm6qEQAoBRLZuezpS8uVoKoF+5pXYm+f41qYBoWWk
	 mllf5RE6gafQvkFJiuZN1zu6EgCpiC7R5Uri4B2DjiHCytm9rtw1T6Oz7IURZdvbmk1vU
	 WrlehLsTqTJ0ja61wsDiZr8zXBeudgX7+putjuOY9US9nuq6F0Hl9RzaJyIfSrHIgrnpV
	 a60OgvPFGUfzdligLsfJ2GBcdvCrNt/CkXL+B9r75FWaZR40KhCKOdPvWF+NSWBFevg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=VIh7nUx+;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEF3606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFEF3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=VIh7nUx+
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DE333402CB
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792733248;
	bh=HY73xKggEzfIdIfNeMh50oTUfXwZiTldS1Pkgz9mLq8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=VIh7nUx+JRehjUimnHmLeWrKIsxe2VIhNKw4tQ2ktK7i7q30f9uFSvy+eZwpAAvwG
	 sMTpAvxIymhawyl9XSc3uX7odUD9pviFLswdr9EqWoUTe309F1V9v9dUZJbTgnSdQz
	 4xzS+elw+aPneNGFtqWsbAtOyDXbyz1HyhaPr8nh4RJXICOBk+ICJBXgEXzHx9IHns
	 ooNXtEsMt39m1CxIuG+lTISX3s7Vx/bsMwuMqjGMIUANJON65H5Gl246g6XsLs1ixc
	 z42h9EBrQzEvafT1ljSZt6Q32pCDxMbkbbY+FpJEk4IwrZhKM00iYJd7L6uj3XXg79
	 cAUMa9IGFr2EybBlp5MUbedr22ORWbcVnOHBjCoPI9hsVNCrU4hNvCLpeJV14lkJVY
	 YcSICQZwFiZFUHwueGr0lFNb25XZNvR6hiSoPt5n+iqHfp09pcjqcc5sM7ZZp35QsI
	 3Kcss2nNb4I74xyyYcH8PjRo2uLicEEOBrTZqSGItkv9e8+YU2US5LqxT3EXzCxdNf
	 xpU+vJ3z3cdFASx7CNQ6z7QtldwQIVa2ZgCsMlwi8hdcSC5GTQP7edgtda1sR4GJ8t
	 dVd6VPAFDiSvMs4pvVG/PX8a/BLDTeKYV+HaumDC8fG7yiDfWidNujhlY8tjt//dsD
	 QIWiUlftosM8Y8iZCjCgaVwc=
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-361c38aa269so69846eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792733247; x=1793338047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HY73xKggEzfIdIfNeMh50oTUfXwZiTldS1Pkgz9mLq8=;
        b=ID5Pff1y1R9woI2Y7k2x0PYNf/VIvIgwQKsBX+jYHIiCG/Y6k/BQ1IrljCyGWba4o3
         bzzxhXbcSXaropPLeuN7fMFlD3pYkWAk/Y8nIgHuJl70BdWM3udlY3r1QYlGqTfjFc3Q
         2ZcDtIb+pXx64l3EzJ3CmgG0YMKvHAzrSZxDVmXKhZsyb7xkK7wgtnAp2kFpFCvM/FSP
         R27WzNdrOwoZ3DZBkAwDHj6fqd6DktgN7XlLIyy8eY8sxIZrlDF9eXZ87fhec/J1zxYc
         jeLwTJnbQpwDMFGx0G05hVDbOaggN+ggF+AaJeGI95cqbSmeUHZIraElsln8n/f90YAd
         vrOQ==
X-Gm-Message-State: AFq9FYLiyGVF9vIkRUMODzwX2v1102ErK8yZPXqxvuRwFey6SVsGk+/1
	GFlXETvspPJQx0+1Q5vYGX5IJxI7OhLVPDbxJKgu/SZFtD49aegW8Xj8OrDJEZpqdW4vHaS5NWx
	54Vw6YlxWEVVfFV0v9d8wXIR+s+IaeN8oy6IkQbz/XapEcLMcV0YX25PUBTBvazIy7KYKO4cioS
	iWe5X0EQ==
X-Gm-Gg: AYBFou29GONlPU34GtH/NmQ2Xa8HdurMZ9ps7P8k2/+Q8nSov5F/GxndWIm38Cco0QM
	pLBbKQkruJsDDGNgclZza0IzHD8VjnO7jR6SksrPhHFRBoitb5adqdh3xrZ1Rm3nW2mryn8CNLx
	kG5mtyoU8TZDfylotNOGEz37wxc4KgyWk//1Bk7bXJqQUaDB/472xyouhFrgdX8xo0wjotSx+mm
	T56VH56ACNGy/W3DCr7ty6S67uFVmOmMXPx8EJeVFcjsprLuxaWHVHweOc3gz6dxsfL1X+41llI
	sZ1DX0uQnlW5Lp7UZUhWMP0QgN6UW2ZXGvNrmxtPK4RyjrNnSI8Jz8YCQw5rP9hBIeLOnTojyQ1
	v+XmFUMWtH+A1nHaMOz+Q3TDmKa1yaw0k3mGOgYm4g4/4wPMGJ9/OfQ+mo45KZWmEaip5xijc2R
	aL5p0ECW2fSXGRLaIYDB59PCCfRLxIQ3aFH194ecSTVHd/8X7iU52LgDpHYjg4y4lxdsNGJRDgZ
	CLEYW+WtetUp7aWEbYHtYEWKC1ougSDs2PidLPEYZo=
X-Received: by 2002:a05:693c:83dc:20b0:35e:d21c:f33e with SMTP id 5a478bee46e88-369d9721136mr2912010eec.1.1792733247167;
        Thu, 22 Oct 2026 22:27:27 -0700 (PDT)
X-Received: by 2002:a05:693c:83dc:20b0:35e:d21c:f33e with SMTP id 5a478bee46e88-369d9721136mr2911955eec.1.1792733246659;
        Thu, 22 Oct 2026 22:27:26 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-b47a-213f-cf99-45b4.dynamic-ip6.hinet.net. [2001:b011:2008:445c:b47a:213f:cf99:45b4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9e1a085sm3590098eec.29.2026.10.22.22.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 22:27:26 -0700 (PDT)
From: ChunAn Wu <an.wu@canonical.com>
To: linux-serial@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	markus.probst@posteo.de,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com
Subject: [PATCH v3 0/3] serdev: handle devices without an ACPI or device tree
Date: Fri, 23 Oct 2026 13:27:14 +0800
Message-Id: <20261023052717.2577234-1-an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver-created serdev clients without an ACPI companion or device tree
node currently have no modalias and cannot be matched to a driver:
their modalias sysfs read returns -ENODEV and their creators force a
bind with device_driver_attach().

Backlight function on dell-uart-backlight is not affected: that class
device is registered independently and gets its own add uevent. The
user-visible breakage is the failing modalias read on an existing
serdev child -- Checkbox dkms_info_attachment aborts with
"OSError: [Errno 19] No such device".

Resolve the two long-standing serdev-core TODOs by adding a creator-set
modalias and an id_table, modelled on the SPI bus. ACPI and OF match
first and are unchanged. Convert dell-uart-backlight and the Lenovo
Yoga Tab 2 Pro fastcharger to this path and drop their force-attach
workarounds.

ChunAn Wu (3):
  serdev: handle devices without an ACPI or device tree node
  platform/x86: dell-uart-backlight: Bind through normal serdev matching
  platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: Bind through
    normal serdev matching

 MAINTAINERS                                   |  1 +
 .../platform/x86/dell/dell-uart-backlight.c   | 18 +++----
 .../lenovo/yoga-tab2-pro-1380-fastcharger.c   | 27 +++++-----
 drivers/tty/serdev/core.c                     | 54 ++++++++++++++++---
 include/linux/device-id/serdev.h              | 16 ++++++
 include/linux/serdev.h                        | 34 ++++++++++++
 6 files changed, 119 insertions(+), 31 deletions(-)
 create mode 100644 include/linux/device-id/serdev.h


base-commit: 9e947d96915af63e28896caae85a81b74855621b
-- 
2.34.1

