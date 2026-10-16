Received: from mta0.migadu.com (out-124.mta0.migadu.com [91.218.175.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195663845C1
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792128454; cv=none; b=AUmxOS5frUrXGl6LvSPdkUasxarLMbiAVJ1KHy2a0alKiJsgChk9XiAA9WV26Q4Bc8pbLtar7n3hE47D7iIhkGFFxA7t4hUYOtM1m4m1hGdxZhN0KIGS9UAQSImhkCui4hQ6IsmGi3ngA6fru2Mituw2jV1YHFRQb552VulCPVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792128454; c=relaxed/simple;
	bh=8RuKnhZ40mCLqtZODHDu3kxTqZdJn/bBLwgoyLRXSUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M/8hNOYdx9i1VcjNJ8BQPaeWl6/SBaOcOI4NlhqZYRwF1if8NVgjMVoyRbZ1aXxTPc328dn+cUNFjY5D6tt97sYCxSpZJ208SyIkhwTs9gbpHGOeS1cUww2q4C8FBRwj7/3uGvqVwxj7+cGI1Hdk+SOHDig7FcOFI0KMciWmrmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca; spf=pass smtp.mailfrom=justthetip.ca; dkim=pass (2048-bit key) header.d=justthetip.ca header.i=@justthetip.ca header.b=EHZytn0E; arc=none smtp.client-ip=91.218.175.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=justthetip.ca header.i=@justthetip.ca header.b="EHZytn0E"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8RuKnhZ40mCLqtZODHDu3kxTqZdJn/bBLwgoyLRXSUQ=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792128450; v=1; x=1792733250;
 b=EHZytn0EIXYPwCJsdC8UBjr6PRJp2i+1nWY4pHMwO//nwuT0Yzk2KsfL7/jJZ+rlj7VN3MqK
 X+1HoiFU+gBc0ydetzOx1dJMbiFxS0c4gh7t44/zf1vf6r+b8MwMzP90wF9rUuw6BmZG350554D
 LoNnQZ2EOQANJcQKxDNC4dhVuwEMWHrOBq+jQDTTq6+HhvDP0GNjrV9oNW7ho6tX1Ft5fR5TP9j
 huQzc+pudG0yrK0gmDnE7IikVPH1qH8yrvhXu6aBxsRzv1DDKYht6n1D2PVfDwPIVutd4KAkR03
 Ml/FrDQ0Y0+q/PgEFDnjQybszVE5XMbFTtKuxuEGzVPVw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fbda3602d4225860;
	Fri, 16 Oct 2026 05:27:30 +0000
X-Mizu-Trace-ID: fbda3602d4225860
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Jocelyn Falempe <jfalempe@redhat.com>,
	Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/panic: Accept a trailing newline in panic_screen
Date: Thu, 15 Oct 2026 22:27:22 -0700
Message-ID: <20261016052722.60051-2-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016052722.60051-1-lucid_duck@justthetip.ca>
References: <20261016052722.60051-1-lucid_duck@justthetip.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting the panic screen through sysfs with echo fails with EINVAL,
because the value ends in a newline. Ignore it when matching.

Fixes: e85e9ccf3f84 ("drm/panic: Report invalid or unsupported panic modes")
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
QEMU, 10 runs each, on drm-misc-fixes and drm-misc-next:

                                     before    after
  write of "user\n"                  refused   takes
  write of "bsod\n"                  refused   refused
  drm.panic_screen=user at boot      takes     takes

amdgpu, 2 runs each, 7.2.6 with Arch's source and config:

  echo user                          refused   takes

 drivers/gpu/drm/drm_panic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 29b1487de7ae0..7847b38ba9aab 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -839,7 +839,7 @@ static int drm_panic_type_set(const char *val, const struct kernel_param *kp)
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(drm_panic_type_map); i++) {
-		if (!strcmp(val, drm_panic_type_map[i])) {
+		if (sysfs_streq(val, drm_panic_type_map[i])) {
 			drm_panic_type = i;
 			return 0;
 		}
-- 
2.56.0

