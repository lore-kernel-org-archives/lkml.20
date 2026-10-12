Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3764BF949
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827697; cv=none; b=rzmSoth2hcPSJ/MZc+EZbLFHOUKV2H/HE35s6hDgzPG0NkS4/KkTuu3pNijbI9Vb55uAlbkCq1iG9eYTGo7obgW9xMhWZSQy8SdTwga/FhfnkNiBMWj5aPn/HW6BVRubvvy7PpAOmHlhcCEcnzwkE+GtyAcpXgHOqd4Gpq0AK6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827697; c=relaxed/simple;
	bh=FWRRxx6zY6F2irCAkFFw/Nvcl0T4Mr3IRI0IXDHJ8xU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h2FyR6hSwnLYUUgm/lsgFthv+X/6eKhi5kzkt68v60UNl+MRdE0WzphtRHWBMkf2eXnGmGNNuHNXXQ+yKgM5ZdKH+2QCr4Ulud7gx6RtSTmJx5sDr1cc3eQIRE/m7ShnUbeefSzM2t8YptT094KjoNlw/QasTe0zBwXs62qyjug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjPdSsRS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjPdSsRS"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49e73611928so26425715e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791827694; x=1792432494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ypEpjY8mvLe8TMwZ/eo1EKEIbLHoE0Uzn9acxsMI+c=;
        b=WjPdSsRSyHim4avEYzpkQsvws+Uv5cXr7J/YEHXnv2O0XKrzc67wPDihDO0aWNKKSn
         hjxtTSLH5ohVwKYjTovM1g/Efvb1HWyRrqsxsfIXmhwosahwK/2RT8HEhhb63Bzp8MmB
         C/Ome8takmnbTnPAjog5lGYQxMWBVi6LdeI+D2tIIIjyO3rkR4wc6NcS1mPXfEOctAog
         +QEL48HFEwfiFB+a0OKd6k7yaL90Fkk7N3Q1+TDH4JAPoN6I4bqKQlzmwSWadeOMi4v4
         2cPMRqPDjk44Xr4qILrbdR9QevYXDBDovhAThEHd6Em8C3eGExsfotQ1OTl0EHA+AcWP
         CLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791827694; x=1792432494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ypEpjY8mvLe8TMwZ/eo1EKEIbLHoE0Uzn9acxsMI+c=;
        b=hpaCzcBMgXmHQI9aRCS5Clg0gJI4jkSV524pw+JbZhM7VEmcMdPl5aEspC+C82a2lb
         DUo8N2942ryLLcG/lI0CQ9ve2lQGolihddr4oSz7iBj7MVbnuTwAMcTckx788eQ/25X1
         css6/aG814lhaYRN4nXbQTXsWpXeNbrtFAKSoOV8riPd4nLHrPZyAqTzUf+OcLM5MCDn
         Z/SBhXmN2OTXpEYD2s7tlkr1DzY+3LZVFhlHYxdy4YMs2YoNxC2xj8YSJ6O4ipvcFYRj
         shiqJszLqY/HWP6USyoGyMJ64KtX5iGAqWxLzCBblnbaUcA/yCWIQ1dM2eCPLXFLHPV9
         lprg==
X-Forwarded-Encrypted: i=1; AKwUvBz8BP/ws6nJIvJQO2pG++wWtChAR/Q1QNO13gMHZJMWX8HkLuvPzwGy7HKKiXvZ70GrOp71JM64M90Ql8I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZJ1w5h+0k2nMI5709V5EkGuN+/vvBAV34n99ytyg5RYmf7Q+w
	MV4GCyLvpubBC8l437E3QDGl+nTmorr0mQj3PkG1B5RQZ5c/izGvpAXZ
X-Gm-Gg: AYBFou1maWaWHYs5AHConSWqdcddoPpFfGIKdX8JcDxTbxV2iKDIPbaGX6Prep27nnJ
	WtOpsUuHln9J/7O/sYlyczVODPiA7C7GYAyvsr0kBARUEQZw0EQfW4p57uraWgPV3SSMUFQEmx1
	xCAqRClYxe8irUG/XI6hhCJx61hChJGeSOKe+F47wBqCyIftFDGx8kQeyvalVjw+2lEJyfA9KDB
	UWYEmhSPmNa/9QXRvZic39jk/22PuLBJwC697SVG1U+RdRzN37Jfi70sz70od5M08+a0U6wK1i0
	W+ZtnAYo3ZrDOfCtrMCZ1F5XjbGWqPHkL5yyho4npaVBnc40ljFgP2WLcdv2Rvi8a1i1hqEqUo1
	ASTQUDZsgt2XNJfcGMfq/9RZFUxEg1FhYcn+ieijTSRCK1InK4VH9c+o+xtr5DBEEKJkZ/s6TJc
	jSfNY9ZFfWMQWXnJz5V/3XMdSWhui5fY8k54JqZtF0m/AJCkIr4AFD5WUFuqn4IohHuYiPlxFAy
	LtPbeSNgapRFPbcBw4aN4C+hMPII1UC3al76INYDQntNtBP5HxWoI9gPEsVYH83wyo9f1C9
X-Received: by 2002:a05:600d:644f:20b0:4a1:88da:800f with SMTP id 5b1f17b1804b1-4a18dcc1377mr159038565e9.9.1791827694338;
        Mon, 12 Oct 2026 10:54:54 -0700 (PDT)
Received: from voyt-laptop-dell ([2a00:fbc:ef3c:5801:aaab:bea6:6711:8153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc7299sm518416f8f.53.2026.10.12.10.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 10:54:53 -0700 (PDT)
From: Dmitry Voytik <voytikd@gmail.com>
To: Kiryl Shutsemau <kas@kernel.org>,
	Chao Gao <chao.gao@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-coco@lists.linux.dev,
	x86@kernel.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Voytik <voytikd@gmail.com>
Subject: [PATCH v2] coco/tdx-host: add Kconfig description
Date: Mon, 12 Oct 2026 19:53:48 +0200
Message-ID: <20261012175348.1256363-1-voytikd@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the issue when the driver always gets compiled as a module.
How to reproduce the issue:
	make mrproper
	make defconfig
	./scripts/config \
	  -e CMA \
	  -e ALLOC \
	  -e KVM \
	  -e KVM_INTEL \
	  -e KVM_INTEL_TDX \
	  -e INTEL_TDX_HOST \
	  -e TDX_HOST_SERVICES \
	  --refresh
	make olddefconfig
	make mod2yesconfig
	grep '=m$' .config

	returns only this driver as module:
	  CONFIG_TDX_HOST_SERVICES=m

Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
---
v2:
 * changed per Kiryl's suggestion:
   https://lore.kernel.org/lkml/aszHlWi_aLIh8r9F@thinkstation/
v1:
 *https://lore.kernel.org/lkml/20261003223237.513456-1-voytikd@gmail.com/
---
---
 drivers/virt/coco/tdx-host/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/coco/tdx-host/Kconfig b/drivers/virt/coco/tdx-host/Kconfig
index 57d0c01a4357..fe018e00822b 100644
--- a/drivers/virt/coco/tdx-host/Kconfig
+++ b/drivers/virt/coco/tdx-host/Kconfig
@@ -3,4 +3,4 @@ config TDX_HOST_SERVICES
 	depends on INTEL_TDX_HOST
 	select FW_LOADER
 	select FW_UPLOAD
-	default m
+	default KVM_INTEL
-- 
2.56.0

