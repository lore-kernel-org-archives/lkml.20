Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE673749FD
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789198191; cv=none; b=Urtm8cVVB0mvGCMEOQq6o/cC8JURzn2oYq4rNTc+2Dxsdzf5CIFNyFQyoWTWRKWx/YKtOQOqtYM+IscyWNAYQQzaQ6AVZOZMUtO620tHYUC+od3NQ+ZYTbygWoVBhiLS7SrT6DVh5pnZ5L4kkDRS4is4bLMfPFUosNNO0RhJytQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789198191; c=relaxed/simple;
	bh=diLqbQwh2pevhcRrWRzog+TbgTs/wMvuiFsegk+Vs9c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gWJxbbymjOSM7vwS722E9q7S4+NG+4WwNXOrWQmDmEMnzlHlp0TaLT2mYc5ezVHKWyC1u3azISI49lkzfhcyFBoW8+5wx85ANmAk+02EvnjYXhtktN1Y3ZgdsuKAZ1fsILo8qcKubG3QlTgzbH5uxSZcsHznKvLSb46MhefCrbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PvpveBer; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvpveBer"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso12517635e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789198188; x=1789802988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PXc+4SKfKNKk/rs+2uET25nPCHn0nrmdn1gdEMSeqW8=;
        b=PvpveBer50KnEb9vIfEGeXDLI16VWgnSVjstzJmoQUI+FvjhJW1Uz26aSOCXhAKJRj
         XDkDb3HaM9N6rUcBW9EOgGRhBECkhAgbMYL2BI7kZfB3YBLlEPVUd59AtX+XAkuV/5Z4
         CKlHq/KYQ1+SlV1QG9kq5rJGcosvqaSvb5tREO6j/2WmPpbMnJZyi/8QzD5+JJocISfR
         XAuOgmy/G3p3Q1osSetdeaK1uFSb8EJ6kdVIYskvLXGxcxPbLG9mcJbQo9Pv/YNDJRhK
         bgp5pO+DjW1TcUfX0PzEH5yElDJodrFm+RHe6CGjsIwdf/8TvbDIs+LUN6DNMixUumC2
         QYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789198188; x=1789802988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PXc+4SKfKNKk/rs+2uET25nPCHn0nrmdn1gdEMSeqW8=;
        b=G8DFPRfVMhHOvTnjIona2qVA6O9YNAytKd2MEcX+/d5ghO+9pN+EpxW7w6VAEo9nGk
         R7favk2cfRjdJM4NHRdzQO0/0fwLXVROIJetU34L+XO4/yNtuczesiI7plrZhovIg0Df
         FtPy4dEcACFveeC5RfW2x7ibBnJeiw8S93otvkOMAiYeOz4ZtIKylZXuiU1B0Qll49oT
         FyVAcG1YzaIl+Em1alt6KAG8HfB670OOki3pzvgZbF41AfjmFcJLcg7IydiFdlv9CJzm
         /y/t7aVZUH5czq4F1apZ5jeaPjaKH2RGbTFHlTBwWSeyv46oxZfRKrjp8W2643gMq2nE
         EnYA==
X-Forwarded-Encrypted: i=1; AKwUvBwE4dJVDnn5RCMXqPS+3axNeUpAABsEmUgvbSU20mH8smAgvNSWEIDQ9AxR53HeAMmTxmkOlqcf6zqbGNU=@vger.kernel.org
X-Gm-Message-State: AFuF++ms5+i1AUPg64XyZen5CQwz9d+dVSRnDGOXoMuNJXyIXMiuhtSX
	+MXYjOLMRgAaUFHLBZrv0X9HmdcHZFttCxpPOmWhMtnIUCWN4TCEUkaC
X-Gm-Gg: AYBFou0YBIgj2eQ31BdLKAgcnfwQrwbGlgDaoCivEKghHgC7SCRe6rqOGm2Qj3IMt8i
	IDQfC4hxauKCBgXP2sl1/9ITKCcsK2unmWxKKZFYcUjEXcoR3YGXq3502pPgTwbWg3AFoZsArgg
	jCt/RVcE0SlawoEFe3tHbfcs0EnU0RUqyBfE7wpjVmQsBw3G/OkkZN5Yt+Mlv1qNaQegFIKhZiG
	qZcwOGXnvryBqRqlAxwYl/Sp7vPi14f27pD80qeint7J4Sm7X10M7+hcJZdWiW6qG5qA/beZNov
	MCam/mNcIWOPb25aDXC8+N4Kjqip2a7cq0gdqYKK4l87Pquv1SleD6cLXTIexR7UNp1w1kXZ5kn
	2yLoLtUPuqFVu5pO841SWpnNHnTpsrpn37lqORhXoX197LwUK+GcOZ25zB93btBkXOkrOLpKYTt
	DHAK7y3NXXOgpSmd7eTUq2J3askEiSs7vPyFKhuyN1Q8bC96CiOTW9y1j+GqQ5rfwvjYMxsTs0j
	X2pfq9/sn9auHZVDlvHdrV4zqp3NAmxJAxa6gJ8z/A1c/mxY4niHcRIVnYhJ87hMQ+mozGb6EIo
	COTA565TGvo3+rHIyc7LF4YY71nmEN6mQ/pNp088ZkhR1jcR8koim+kuudoHrs7avPtyLlA/Dg4
	CmlzMTxk=
X-Received: by 2002:a05:600c:4714:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49e61988b9emr84737275e9.10.1789198188447;
        Sat, 12 Sep 2026 00:29:48 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6499d57bsm171373105e9.3.2026.09.12.00.29.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 00:29:48 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Suraj Kandpal <suraj.kandpal@intel.com>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/display: Fix DPLL reserve and release references in kernel-doc
Date: Sat, 12 Sep 2026 09:29:46 +0200
Message-Id: <20260912072946.50769-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The intel_dpll_state documentation still uses the former reservation and
release helper names. Update the references to intel_dpll_reserve() and
intel_dpll_release().

Fixes: 2b3b9a8faf56 ("drm/i915/dpll: Move away from using shared dpll")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.h b/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
index d408ccf6f9025667177e411e5c2cef72cc30aae9..cec6208fa7535ba77c203999bc75b3c077a94a5d 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
@@ -302,7 +302,7 @@ struct intel_dpll_hw_state {
  * future state which would be applied by an atomic mode set (stored in
  * a struct &intel_atomic_state).
  *
- * See also intel_reserve_shared_dplls() and intel_release_shared_dplls().
+ * See also intel_dpll_reserve() and intel_dpll_release().
  */
 struct intel_dpll_state {
 	/**
-- 
2.39.5 (Apple Git-154)

