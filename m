Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407BD3750BC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352418; cv=none; b=TmA2FGsIGDThYkroILhS8V3t5nBcujVp+2V29SDTEyZLfnNnwrIMF1nVYO33S2Xqlrm19AotqM3m0cJvghHb5fYaXIsaQC0w7GW9bidQ8cDvByyTuztBm/seSzBd+HjMAEOx1w7oBaKz4qW7T/B01aeYRYyq+X2dl0XbyAwFfp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352418; c=relaxed/simple;
	bh=q26wmfkHoN2RZBJDMbLrO8AiXKJ8/61WwheCXs9T6zU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l7MjOwkHaxunoIYTsWttoQNkCL3KoP+e2ASB3lwj4OCH/ujS7w6XhsVJGXhuXNc2UJYiaWgfROsIiY/nieO2iiyVjfrY84P05BDYwsB5CzfEdRlVBvCX+CsVJ3xm8gcZGGOkNj9g78iLf4+KhMwncs994zySOdQ7T+NU/fJBsmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hV842OQ0; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hV842OQ0"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3990fe066ebso762880a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788352417; x=1788957217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=khFd/jDnlTA/XKPvSSegUBessMbx5oK9ggDT+W0TX84=;
        b=hV842OQ0ZtOqORF0PAq7AswtDIVseCgJuJlgKTfa+TosCHgzfHvPzTQcaJ9nQIe3uj
         PJZq7fdBQv6ewASW7zOsJkhBnTHmZROoYciD9hTmBgVhb+D6TkHJDqzGCmF/G1MQhScd
         KsT+gjsqOti3gkmTyM8ab6/vEitiIbRI1AP87OROU4UJqB41LBSv1la1l0gMqw4dxmJZ
         3T+dEJ2FT6HxHjNlcokhRtjh15j5TIYrN0RF3rV+YRb+pAEsRyO0s2n9XOByGJOIF/x/
         EqHjAclYwqhmbc0RiEhYWz3U64aEbgExjGx7J9NTok0L7lq/aYejSlgbk2VEmUIbOzQA
         hcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788352417; x=1788957217;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=khFd/jDnlTA/XKPvSSegUBessMbx5oK9ggDT+W0TX84=;
        b=Xr+WCIRZDgyTUpLE18I3f0zUJC2CwF9cJK/GiO4sYhuD5S6lPN9tNxHv+L2IusnXQr
         dy1gsJ0kQBTf0oHpmiNr/qI2t7HYTsDRp2RiX3TbYqQsINcUa2/xHUaiTs4vsTVGJ3jM
         Ss+9XMEv/lllJ0y7bebhFSsXNB5372mXqEPGJHt0i+fbXCxOfPsnEXiIGs4hJ5qB3CqV
         dJNAzwADYyaUOl/OEvLh5UdEgzqrAhBssLteZ/5ayOT/3YxMsI3t+dCgK9LbO5s6syYq
         XKQgUN0+eA+SyMhba1fT3eSLk4x9YkzGj8XHrHhEgnNn1L8koqCTfr1pkYWPNR2OEQYs
         hf4A==
X-Forwarded-Encrypted: i=1; AKwUvBzAyvgR5P69qaXb/vR32+4ZtGP8z9RWU7U1Fq7hgDgkKh+OW0wscCUDMAEuPXfV1HiyP4pZglpwei5G+IM=@vger.kernel.org
X-Gm-Message-State: AFuF++m5+aU+QE1SKuZPuS98qdOKaxMmT7s/Y+xhXY60Xcl6O5I7I0+P
	5VjUrCK+2NzkXnyPiVzeXV2EM/VHuB6uoumkUQk59iBYMaTWLuA0wdf8
X-Gm-Gg: AYBFou0P+niZbobC5qmeRw2aw+aanqCRbgS3BZOAJZlyf3xI3EymG1yWR3FsUa9ANco
	x78/Yu6Vm8/9fUC/6Plbj/VfPbBgt89eg/nTQ+ge5tGIlrJOopZQ3rWI2DLoYvPA5R3rQe7fhTY
	4IZ87e48TgN6p/wxax6PdOIuzKCCVHd+a1H6zaDjLH3wPyTJDVDaEg59+a54ecyVzrohSStJhSm
	NJjVHp89X9aG9Z2tbWOXLie8BNgunzcLa93FtL1lB9mQJIy97TEZDClFFLabLySurG5qf/iRGlB
	IrBXNnecHC45YjVBtSzzuSs+npfHtCiYSSjhNe83JwX1u0u/Y/01GT2f88k1m+Lmjpwca+MjBdv
	tsK8wjVx6BgKTeXBosvLpMR0cZo8eUtjCXlYs8wVjjIyk2H3r4SOpiRQNfu1+71LgGODJcm92aK
	l3YoE+OXW1DMJ1Z7Nx4jawNfBl1r3gpfX7Zi1lqhm4ThnL6U3wRq9g1Vt+i8pV3A==
X-Received: by 2002:a17:90b:390e:b0:398:9be9:ab8e with SMTP id 98e67ed59e1d1-39aee124474mr5272135a91.19.1788352416561;
        Wed, 02 Sep 2026 05:33:36 -0700 (PDT)
Received: from fedora ([223.184.183.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d4a1732sm11343190a91.7.2026.09.02.05.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:33:36 -0700 (PDT)
From: Sajal Gupta <sajal2005gupta@gmail.com>
To: rubenru09@aol.com
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	noralf@tronnes.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Sajal Gupta <sajal2005gupta@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] drm/gud: fix out-of-bounds write in gud_plane_atomic_check()
Date: Wed,  2 Sep 2026 18:00:57 +0530
Message-ID: <20260902123254.36987-1-sajal2005gupta@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The plane property loop uses req->properties[num_properties + i] as write
index while simultaneously incrementing `num_properties` inside the loop.
At iteration i, num_properties has also incremented by i, so the write
is done at `initial_num_properties + 2*i`, skipping every other index and
advancing by 2 per iteration.

With just 2 connector and 32 plane properties the last write happens at
index 64, one slot past the end of the 64-slot (indices 0–63)
allocation. A USB device can trigger OOB by advertising the maximum
number of properties.

Fix by dropping the redundant `+ i`; num_properties is already the correct
running index, as gud_connector_fill_properties() fills the preceding
slots.

Fixes: 40e1a70b4aed ("drm: Add GUD USB Display driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260821071812.16500-1-sajal2005gupta%40gmail.com?part=1
Signed-off-by: Sajal Gupta <sajal2005gupta@gmail.com>
---

Verified with KASAN using a raw-gadget fake GUD device reporting 2
connector properties and 32 plane properties:

  BUG: KASAN: slab-out-of-bounds in gud_plane_atomic_check+0x1352/0x1ba0
  Write of size 2 at addr ffff88800d029a9a by task temm/270

  Call Trace:
   <TASK>
   kasan_report+0xfa/0x120
   gud_plane_atomic_check+0x1352/0x1ba0
   drm_atomic_helper_check_planes+0x2f2/0x9b0
   drm_atomic_helper_check+0x72/0x140
   drm_atomic_check_only+0x127b/0x3420
   drm_atomic_commit+0x124/0x2e0
   drm_atomic_helper_set_config+0xd9/0x130
   drm_mode_setcrtc+0xcfd/0x1b20
   drm_ioctl_kernel+0x167/0x2d0
   drm_ioctl+0x53f/0xbe0
   __x64_sys_ioctl+0x137/0x1c0
   do_syscall_64+0xde/0x4b0
   </TASK>

  The buggy address is located 0 bytes to the right of
  allocated 666-byte region [ffff88800d029800, ffff88800d029a9a)


 drivers/gpu/drm/gud/gud_pipe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 5ef887d8485a..54adc401bc1b 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -562,8 +562,8 @@ int gud_plane_atomic_check(struct drm_plane *plane,
 			goto out;
 		}

-		req->properties[num_properties + i].prop = cpu_to_le16(prop);
-		req->properties[num_properties + i].val = cpu_to_le64(val);
+		req->properties[num_properties].prop = cpu_to_le16(prop);
+		req->properties[num_properties].val = cpu_to_le64(val);
 		num_properties++;
 	}

--
2.55.0

