Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E02F4C6803;
	Wed,  9 Sep 2026 13:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961995; cv=none; b=myOiuyz9cm0K+/qYFhzYihP55gR5K1H/m+wvGh6kILVraqfQdgdoky4F9J/2y7feuQCR+HeT5zE8U2f1tZGwfxVPkpqiuGVlsoPjuk7M4wH417mOeDTCnnTwsl/4zR90F2v0PPtCIwNseFaB6WXwK7C9XQxRYySE+5Y0bWJnXTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961995; c=relaxed/simple;
	bh=6AoUbS90Cz+O96DFJFkvxoQrUSNwwRtPy1soc2vXfgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YSMn8nWaAoP2yX1cd4aI9cFuYV9TF4pXnTrzuj3i9wVTRd2z92YcwdLlm70ndg/LJs5PTGOzUxb16TxxW+f1iVQsMuUY8C+LF4ojEjWjwJs1OEdL1v+O+o1KcPH66qUllWuMNSt1mja7RSnbxiTsghU/vqDPcvY+dAZJdyw2JgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=sXawcu+9; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=b9Q4YJ6B; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="sXawcu+9";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="b9Q4YJ6B"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hg2MB5r8GzMlJr;
	Wed, 09 Sep 2026 15:53:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788961990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iuJQiHvs9iP3PQ03RHys/Ar1s5GNOF4lhn09HnTAQd0=;
	b=sXawcu+9waCVaP7TSgWjwW3DjhbtBP7mpZzo0sV2ex6EmOrgco4n9ZyPmQ9lHmz4hX1Grk
	fcunJ7aP3ef+NsMDl+r/HSVnSsSaRVcyq5u2EOLTzLEO4aGXk2w2oG16BWK146WEjzSTVQ
	H4swSmhlqwQrNURfcNnQbOo6alrCw2uJLQFBj5Kq34gnmICk3cHZVnNwNU+RTvK/RUwI2P
	m/Fxl3IVB8hJDkgeqqlyvlr/mVKokszggNpFnxQOAQkgJVN644h/k2q5rNURgVtGGshDG3
	G85ESssSnzmvsiI/F7dlUvusoh4W+JkjJnX3hw4OltTfoc6VMd7/k2EOFuACtA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=b9Q4YJ6B;
	spf=pass (outgoing_mbo_mout: domain of manuelebnerli@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=manuelebnerli@mailbox.org
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788961989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iuJQiHvs9iP3PQ03RHys/Ar1s5GNOF4lhn09HnTAQd0=;
	b=b9Q4YJ6BDbbrtZBPJ74ddbSs3qEZOz2jk2O5p0FXFpij3T2tUFq0LazqWNMVLDNy1/VZAY
	Vn1FhIP3Xr2jMv3k6qMv5csuADVvseL+sdb+IkKOlh/23uLnp9yWHQ8D6UPpMrrvVE7FRJ
	LM+EZKXMACwfwG5mNWqCb+bpEOTiYfttW8zShtcwOAs2V/lztonrOpS4nxFQVriYwT/6hX
	fKa3qHnYap88y4KwoUOaLdgMkgXcq1pSL0su1zDbIzTppy0uoUIJ0xjqxqdPiPXbpb+Ybg
	PhJbXrdanVjN2DHpLtEyZ6V9y7mhsTHu5w3RosPbi5T6Srro1f7bqwcQ02NyNw==
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH] Documentation/gpu: Fix bracket
Date: Wed,  9 Sep 2026 15:52:33 +0200
Message-ID: <20260909135233.1364650-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: mhwupi7m53zinn4efqm6apnsbpajmcsm
X-MBO-RS-ID: 454f5675d07381df421
X-Rspamd-Queue-Id: 4hg2MB5r8GzMlJr

Remove needless '('.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/gpu/drm-vm-bind-locking.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.54.0

