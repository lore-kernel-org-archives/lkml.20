Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A264D0A16
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052420; cv=none; b=SUi/rNmZ593FyxtzNdSUfO1NMFKBxeLjJb0rayf2Z9O1sDU0FcZJe5jAP1w+n61I8ZVOHrU+NJ91YcvrHlfbeLJmLtvA5RKAzcme7/xNLd2VkFL/sqO1jToyGg+4Xb0Vth7+th1GY64JPor9kI3ZhrOoikKuEn+HXup1i7FozzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052420; c=relaxed/simple;
	bh=KVOZ2lLgrzuWZgZSB9rwBDkQhvmCwD1PiXcl7UDJl0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ay5/2ukqhi6Iq+cTuJqP+7QyLID+HY60qcHEpVw6jGPoOKJrx/dmp4bYNrzb+e6jVz08vC4Dg1dXPo0UwQUwcFmJX0+u1d0XQTM495saJM45E+czq1koNPZCHGrTF4IYI1yItdTsOILPzJN+lfPSF/pTA5l/OHuBIwcZnA/q4yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYlnVwTR; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYlnVwTR"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48afe75f055so156360f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792052418; x=1792657218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dGPhNShpJ5TEx2EGucqMdtalYIrKk9jaQj19DVUtNbM=;
        b=GYlnVwTRNXFc7A7xiu3fSpYFhXISvaNhuvyIeBJ1WfCxJxxa+CmiphFqgx1MpPQLH2
         ctC+PtQBwNuXms35ZmEtQdcs8AxDN61JAfY/tmJuYU8VTh4PFjUnSz3dzR3XaPverm0D
         W/ZZQZswtSRU4d1P4ucuidDfvFe+3mKbQbrqRui3yWUghQPxredD9EbEX/EqaZIcuKtL
         /ZsPBQmZnuk5M6DFAHKJilFzqo+vYmUDSTXmU06UJQnFFcVag8i0b8g3aXK2JYOyi7UJ
         oDsbfJJAmq8nOMChSXCtAKnpOrRE1hFVbLVtclGCHNrnWpInTzZaPcg/yLa2zS+daXvK
         29/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792052418; x=1792657218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dGPhNShpJ5TEx2EGucqMdtalYIrKk9jaQj19DVUtNbM=;
        b=1O+wnzn5gNXWGtyAMMUplDGDEbRflSizjdPanJoPRPt6987hGXDMijifYrr1sU9Lnq
         Lhcq5oF/J+z1L5aDvYAKbIJdSSY+PShHn4D62iHbxbSvrpj46nL8spRvGwiZ9pyL3rbs
         Kn12ySDPAo4xcglfHJHnQ0hr/OZq3uRuVi19vy9r9y+R6FhmfPZVZMAm+/MWOze0yGSx
         fDdwK/EGgjsVBRNUqQZbfGuy9lfDiaRZcj7Queqb1TrAoslN9bWReR4Pv5E7kJf6PNmX
         Eb5Drp+Bja2k0qvMlMbBg/+JfsZfimFqLY+9OKGt+mvLAmzJnvGydkQyuYSo2Y/SwKIA
         w9oQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/k9EqO+yax9UtM2XT4MzUX84RCqiDT0gd9RKiqzpUWkDKXZxCMpcLMB1YdWl8p53WisVTinaVdz+uH5w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEIclz4bAng8S/82XFbPfuPenjEeuaXwmN0j4mN60H8xUas+Uh
	VfwClWlZQnu7t+UQ/VmrYDqUkhfXfPljnwdEC+ytuBEdyV3UQZYpPswl
X-Gm-Gg: AYBFou2uz0Duil+QGVi3l1BogOSRWSV5wKxsVTBJTT3TWyN19vol3Znit2WxH7XOCHq
	j42fbQtvH91naSCL2cIZPu6ocqptbd7+Avu6hZAdTyOfdZuTTk6AnPf3zOcuiHDpWbEUlDsb15q
	gA6+L7J0xEh7e+VcYIth8kR8FvW+0IBnb2zQ74yCsMtwPC1xlH9cFPsMNBhqa5J1enfavCXtRGk
	2JCoL/XHEfLwuHOaaUD2U6aoNJ7et+Nhmn9/yCgv5m1DkvKh8v+RxrzqbJqHMY5PGH4oZs19wDe
	RBm1StjXO9epFevDiVx8TQyCT8B2l/VAZFo1E8S1AYFjsFC8GAT27mAU72pB1ZUZBcTCPmgmAR8
	d+FLHhqaqjJTPQTFXOp+KRWzff8EyKLZY+VQHmPjScOLJUwmOY23+vLABeBdsfMNGZmDiGP6sGG
	QLd43XbeYIH4chKp9WIf0moicikK3eYe9sdqfkWnFVVmrKstUpCgAbXyaKsV22tED7n+YsfhWKd
	Lz7ZLG/ICNsYrAjut2T0zu5fNyXvxWBPIWrxsI0nXUo0A==
X-Received: by 2002:a05:600c:83c7:b0:4a1:7733:5102 with SMTP id 5b1f17b1804b1-4a18e4a3fc8mr349752215e9.15.1792052417094;
        Thu, 15 Oct 2026 01:20:17 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.109.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b35a6sm49003545e9.6.2026.10.15.01.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:20:16 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jiaqi Yan <jiaqiyan@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] vfio/nvgrace-gpu: Drop the usemem length check in open_device
Date: Thu, 15 Oct 2026 10:19:35 +0200
Message-ID: <20261015081937.405320-3-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015081937.405320-1-parri.andrea@gmail.com>
References: <20261015081937.405320-1-parri.andrea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvgrace_gpu_open_device() sets up the fake BAR registers and remap_lock
only when usemem.memlength is nonzero.  The check exists for fallback
mode, which used to share this open path.  Fallback mode now has its own
open_device, so only devices with ACPI memory properties reach this one.

For those devices usemem.memlength is never zero: an empty region from
nvgrace_gpu_fetch_memory_property() selects fallback mode, and probe
fails when nvgrace_gpu_init_nvdev_struct() rounds usemem down to
nothing.  Do the setup unconditionally.

Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
v2: New patch

 drivers/vfio/pci/nvgrace-gpu/main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/pci/nvgrace-gpu/main.c b/drivers/vfio/pci/nvgrace-gpu/main.c
index 208463c218088..8dc792b4fe7ac 100644
--- a/drivers/vfio/pci/nvgrace-gpu/main.c
+++ b/drivers/vfio/pci/nvgrace-gpu/main.c
@@ -185,10 +185,8 @@ static int nvgrace_gpu_open_device(struct vfio_device *core_vdev)
 	if (ret)
 		return ret;
 
-	if (nvdev->usemem.memlength) {
-		nvgrace_gpu_init_fake_bar_emu_regs(core_vdev);
-		mutex_init(&nvdev->remap_lock);
-	}
+	nvgrace_gpu_init_fake_bar_emu_regs(core_vdev);
+	mutex_init(&nvdev->remap_lock);
 
 	/*
 	 * GPU readiness is checked by reading the BAR0 registers.
-- 
2.53.0

