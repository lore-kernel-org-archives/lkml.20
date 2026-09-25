Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2A04F55AE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790369698; cv=none; b=Y5g7FwHjzc285yD07mw7QcioTySp2UuwXGyTkiuEm9N2bhkBxFgfd7a5DQDgUioRgZS1OHtoKgwlDrn/45+imZRQI5ywBEeh8lmTO6L0lGQPDl90i5n5XDy/K3C5O3t8s9WEmfC3CmOMptWslFLmyw3/k85r7lnl8pZuRXLlJT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790369698; c=relaxed/simple;
	bh=w3FlHTyK81Tlr7c/mJgReWF0sV3jCKURpg/1/QYttMw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=l/OL6kwkB8JUsDKP57VCW/Z1Tyo7eRCMV00Uk+Oi3IiV8Blnvo1G5HXmGVFn1ZzMJ6IGk5VFjpR4/aujRw3KrWg5hLj2VME2uu1SpGuRzZc7DVY3f2zL5kQYyZobPJ5BMwdo0mcQqPvVowb1UsxzRXqVahuIpoTf8Mjng5y38qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GvK9nJJ6; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GvK9nJJ6"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a0ad137e87so1833405a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790369696; x=1790974496; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bdMFNTSejRCqI1rOR93/C7sNH9qJNtDawPM7MlpnxMU=;
        b=GvK9nJJ6fouJtVvHeWucwcY86Z9R6Z/mC9nbx1l/cZOlqPrzWFsf1RGfH5Eu5ESvAb
         0xET6K/7DVQmKHUEjDwk5lWtKQGg3pyxY/t4PSfNK16/wDZLT9wplI5A2bwMu+Orr3dq
         kyfILx1UmFapUEf5q1ZwpRTvKpO+5vFHekLUQHnSNJSIt2loPBw5YBx5g9AuXztWwqwH
         O2PODuYpB3XAz6soJm4u8ytuv8hqn4UQF8U+LU+gg75e+Mn4rx0jpJSs6Krodx3qE1vX
         r/DXc+8gez2RHe32S3GDef6u+YhmA3xo4zR2hhXSQqHo+xsWVZ3q+RyO26bjs5Blyh1u
         +tGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790369696; x=1790974496;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bdMFNTSejRCqI1rOR93/C7sNH9qJNtDawPM7MlpnxMU=;
        b=VFmbpIxKmRN5AkOpZfi/nI1uB0TyNEohkdfhbm5/9kltJBQdomW/X6e2jvoiNEcKim
         kXH8Q0L1i+jzzwEquISP47C8nNBmpYNSk10iy60iUf+mSqSmqnmLKh+EUMo7Pnkth68X
         FaRStH7ZpXfph/hbzJQT+1h04JvfvN/AvXyExJjtPUtKmVJRoOK9Wr8EnKRGVHPasIAY
         00TB7fA8OPQF18aR27robgvl2lo8bLMPE2rTDBk54L3ZCYUupYXxEGB+NQ0ZIbLABLdM
         lHne1VcVOs1o7ljLEnr2WNNbMdEGfyRr9s47UsDmMR9y/6KNlk/CxMyjVKGnV5U/9SM9
         kMpw==
X-Forwarded-Encrypted: i=1; AKwUvByj/YHsb8AcAV0zWvCDeJGWgbOIczBraP7mxY4IPtCjs01pZ1JIGMTaVLn6sIl+R2b1qGg31wTT34paoKo=@vger.kernel.org
X-Gm-Message-State: AFuF++nIuuoa7VnFWgr1ZLiBwWmgcdk+2X/ScP3MpqvMGFZ6B8sPT+oT
	s31yRLxLaZao3KQo7T8gu6PDEIXXLt7pxh0e/P4gyBkOAUDz1Zcny/7QvKE+FEz7rgDbYRyYyM1
	W
X-Received: from pjbkw10.prod.google.com ([2002:a17:90b:220a:b0:3a0:6f7a:7f86])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4ad0:b0:39d:b1bd:b384
 with SMTP id 98e67ed59e1d1-3a0985b949fmr6190618a91.17.1790369696074; Fri, 25
 Sep 2026 13:54:56 -0700 (PDT)
Date: Fri, 25 Sep 2026 20:54:53 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260925205453.93297-1-morbo@google.com>
Subject: [PATCH] fpga: Add __counted_by_ptr annotation to fpga_image_info
From: Bill Wendling <morbo@google.com>
To: Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>
Cc: Tom Rix <trix@redhat.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-fpga@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"

The 'const char *buf' pointer in 'struct fpga_image_info' is used to hold
the FPGA image data, and its element count is stored in 'size_t count'.
To strengthen runtime boundary checks via KASAN and
'__builtin_dynamic_object_size', annotate the 'buf' field with the
'__counted_by_ptr' attribute, pointing to 'count'.

All allocation and assignment paths of 'struct fpga_image_info' have been
verified to ensure that 'count' is initialized before or alongside 'buf',
and 'buf' is never accessed before 'count' is set.

Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
---
 include/linux/fpga/fpga-mgr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/fpga/fpga-mgr.h b/include/linux/fpga/fpga-mgr.h
index 0d4fe068f3d8..fb9b0978bd34 100644
--- a/include/linux/fpga/fpga-mgr.h
+++ b/include/linux/fpga/fpga-mgr.h
@@ -103,7 +103,7 @@ struct fpga_image_info {
 	u32 config_complete_timeout_us;
 	char *firmware_name;
 	struct sg_table *sgt;
-	const char *buf;
+	const char *buf __counted_by_ptr(count);
 	size_t count;
 	size_t header_size;
 	size_t data_size;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

