Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD21C4EBAC1;
	Thu,  3 Sep 2026 16:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451900; cv=none; b=FF+xAKj23gDicZI2iHodN2lunF6E0jKXDSp8bF2TqdK9M2fq+aJEvaojk5GCtcEtqsoAQzmrOe5D6Pcb6dXiJmZA/naSOa8JddGRc6x2xEHT1Ab5Fl8I6qilZFPS1SHnFzkJPGtJmsIPWMGDVyrbOPHKAiVHVf2t7xFTC3hpIi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451900; c=relaxed/simple;
	bh=7zVtRm1NEDIYKsOZ6ADBgCUoB8FdH0b1+13dugt/0BY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ki0cQUutCLzdF7NxIl+YX/+ltcY6wrxzmUXtCdfJuFrlvwGuXobp82WfZ6iZ+LsYmn3zWiHLFoWsxGHINguenC54fbaWCUD+alBmGMAx5HGavVvAKX9VPMXUPaI+7fWSbwCOp3cEN5zKTQmWHyqkvHw9x/26U9DKlr2Wof6N+ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DLwZzZ8d; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=voRj94yu; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DLwZzZ8d";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="voRj94yu"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hbPjb06DCzKnRy;
	Thu, 03 Sep 2026 18:11:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788451891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=svi1ggILW4Mv3CIMN+p0lTo381ICzKT26uBQmK6xM4M=;
	b=DLwZzZ8dD/+Zv9IbdPnbDCvbKMlmR8n9pgJjdLl/a/zlIWvD4jF8B8qTbnPJolw5P8ydef
	Ai5I9oraGfXQNB+TzmyDTpKDiNjBbgN3eaC90zEIQj8MtqVYqpg+fcPT3l2PwrRTFWo8qZ
	rdG6VI4OZNe4cu3XquBik6wzIzUu4BXkEv+cXPH0syDktKDAP0M9YNyZQ5L6HJlTAYxIMY
	OdtB8xoNenXh5KJrzD/WcQuc5pKnCScRSyVHblTBv9umF9ZZtjn2MaW5rTSp54vxtF4VoU
	/eEWUyZH4dRv1bvDVf0m4kMuX62RcZPsVl4BYy84r7CB7eZof8pyUt4xYXupFg==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788451889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=svi1ggILW4Mv3CIMN+p0lTo381ICzKT26uBQmK6xM4M=;
	b=voRj94yuSXd7BUv88LQujGUziZK5SDNy4rwInM8MWXdq5+UdX+Hz1hAriFJhZIjwbRHFR+
	N2A91lszoyo65F7r/ZVdZkaMhoADACdlwis95IdYMzmvV3fpiX2NFPi+37ET87SnhqeqiI
	i1W8uHeUbN+7OVSgsAPtaKQh1AGZNCEmZdN4HPoIWYylnpvRzZa0OTrPXk1rgd8QHDz9Lk
	tY8PP5/NxKwumW+O0bsUJdsKVJrTuGO9UwtrFDqnoT5DAt/SQo88FVpTy2hpuhpRuPZJjy
	A/qPMg7q26+BVvplG/uXVAtIBQF2QHhYnGlAm4X8LzOk7hZJGIrXhxH/v8+qOQ==
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH] Documentation/gpu: Fix brackets
Date: Thu,  3 Sep 2026 18:10:05 +0200
Message-ID: <20260903161006.735038-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 7khs7mwymocfwygepsxtd7gbx5951f3t
X-MBO-RS-ID: 0a3e879bd0546b84173

Remove needless '(' and add missing ')'.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/gpu/drm-vm-bind-locking.rst | 2 +-
 Documentation/gpu/nova/core/todo.rst      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/drm-vm-bind-locking.rst b/Documentation/gpu/drm-vm-bind-locking.rst
index a345aa513..df6cf0132 100644
--- a/Documentation/gpu/drm-vm-bind-locking.rst
+++ b/Documentation/gpu/drm-vm-bind-locking.rst
@@ -170,7 +170,7 @@ submission is therefore preceded with a re-validation section:
            validate_gem_bo(&gpu_vm_bo->gem_bo);
 
            // The following list iteration needs the Gem object's
-           // dma_resv to be held (it protects the gpu_vm_bo's list of
+           // dma_resv to be held. It protects the gpu_vm_bo's list of
            // gpu_vmas, but since local gem objects share the gpu_vm's
            // dma_resv, it is already held at this point.
            for_each_gpu_vma_of_gpu_vm_bo(&gpu_vm_bo, &gpu_vma)
diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index d5130b2b0..a01c362b1 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -33,7 +33,7 @@ A good example from nova-core would be the ``Chipset`` enum type, which defines
 the value ``AD102``. When probing the GPU the value ``0x192`` can be read from a
 certain register indication the chipset AD102. Hence, the enum value ``AD102``
 should be derived from the number ``0x192``. Currently, nova-core uses a custom
-implementation (``Chipset::from_u32`` for this.
+implementation (``Chipset::from_u32``) for this.
 
 Instead, it would be desirable to have something like the ``FromPrimitive``
 trait [1] from the num crate.
-- 
2.54.0

