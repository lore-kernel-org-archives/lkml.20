Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCD635C69E
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 08:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787990422; cv=none; b=mpUhfnDfXTI9z774NGva5VJe63dHNlMkYIFDdTVFMJNAvlGOd9sLWKKpn2aiNgyi3zriAZE88i1IEN+jsR2ga9xlILCxpyQUf+Hc9m8EGLtUY6rvx+nleRyXqt2Cy8MI+Dp4dJuY3x1j5iyKi/4R80DbrV9g2kN3/a2aCqKZQHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787990422; c=relaxed/simple;
	bh=wB8U03gd9RN50XLeJWDgo6MVyDP4QNykechOU8sct1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b+8DGWhmGKPN+YkfKPcBUlD4Fr1lYelI2dFWYJV5umjvqnt5OdUSdxBW7XG9p+Ja15/nEjByfGecpvbCec7Me0J0Gv9DHI0eNW9MGzNK8ohARQMXwZGhhpUN8ogQX9ZjXgNgourUrPAjWq77GOU/Pc+8nxYLCWRChcOB+kvxNEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHJ+KY0W; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHJ+KY0W"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so11886045e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 01:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787990419; x=1788595219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/2eNcAW1tigTpuqgp2s8g1GYZ7f9AJxKWb3CPCC/1rU=;
        b=kHJ+KY0WFUKsxWsjALekphbrawktgoxnBaVZyVpGh7oN8YKRmEFIdro094Mt17EdCE
         A7H2rv7g8qIV+7poiKPAikNtQty7j9+pn58E4DBo7UV75kgFMit3z7hHx/oWoGmGZeKY
         4rZUL4PS9l9AyKyaurWahL50BOvdv1Du42p6YxKieG6bk28jeXWN2Ju5XNklrf6cEQFw
         W1LSG9Kj+2hUNzF7ouDcCkFdhYInyzydo7Z/xvTN2lcMw7q2ujEZkx0imnLzPkRoBShQ
         lPKBYZKomdoF6aJ69ok1lLOIDS6gRLVWEERFEvu1A7uZvLC2kRWXlAFWJ8qL5Z40+t9q
         gunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787990419; x=1788595219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2eNcAW1tigTpuqgp2s8g1GYZ7f9AJxKWb3CPCC/1rU=;
        b=IuEQYfJOvwVhMPE4aqgPCBhd9NyU0lf6NIAqODCKnXc7bDOT2tWN7uGjNeUWlPMrgc
         AG0CB8cjDckqh1f+j6bVTVy6I18Ui7tBZPpLVQzJIYaWuQed+nZB3MPTejMhAtbbC0V8
         wRSXZrZuRrWW9pJvyPPoCbbV0IJ+lOJTkG1nPx/R/BDvOiRdVhPKbbWE/coOsbYOM39r
         mS+ic8/e69F5B2/H0yCscQs5mi/Pko4DNVoZnWgOP6A5892ZnMtufbMcGD+NJRUa0osi
         4RTulBuelLA2b3GrMcl208M9E0oymx7TCGVqSyJkrM4fmtAouDicQE/K0r7H4CFdtN3H
         twjA==
X-Forwarded-Encrypted: i=1; AHgh+RoboZj090xJHgTGvaj4kb68tPWghUHbIc2SGNdOWoPw6K/oBrsPT8PeoDTrgNYA3myL1eUKKu24roOng8Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kyWbe/KtlaHMZ1Zn8N/npUVmmy61A0eKCftlDELsomr+4eTIsO
	3GhpavWEyI2knqDgEShOCY82U/Cqfmd17PCWESNCbsa6568PqzW3tbYfXRrttAr3Wyivwg==
X-Gm-Gg: AR+sD12NB+eM9S7ZFhnCavVDEVb/mTzAhKt8w7y30vhuqkgOajC0IGQrNyJYaTae84J
	8recD1McymlQLAsg5CiXdds9c2krNPt+UBzDq5NEYlnDlh0RosxZiWTpRQkgIi7FQbqqJdNuLHK
	96GI4IpgK1CFR4LyRoxmmabgGb4r7DN1mHDPbeYh6ZaLwWiX3censth1V0Zxcq86s6KalmceIEv
	cr+zpeydK1zqTDODKiQuOXBsBaL1Ex9YT4TE+SNPCbNSqhbBPqUSJUvkvPzPVInGMHoEkBIM9BJ
	AfbdqH8S4Pkgx5y9AJHvYsR6S5lHDnlc3vLeCUULirdRRPNp+P9VUoYhf4EDQJtwtV3slUpNbEl
	Lo0cp+iVhDP//qyJYMAMRCFdQSHMnZuXjt8pA7mH/lQT8uJY/aAs2yXgP4fH2KmIZWbCSUk3EkG
	lQZVU7Z59lsRtNh+6zqAt3MfFF4QGAK93AQvdSNL/4TfFSIBoX7+4TUoo5/MkPPHh8L9YW4Vo9m
	mYaOeKIIPSJe8VHdW8PhtVKG3TqQNSlL79EaPGH4ZFPSOL38FIFY8yomRK0zmyGQ8JHuDbkTA==
X-Received: by 2002:a05:600c:620e:b0:49c:c0d4:53d9 with SMTP id 5b1f17b1804b1-49cc0d4545emr106478415e9.14.1787990419277;
        Sat, 29 Aug 2026 01:00:19 -0700 (PDT)
Received: from drago.hgw.local ([2a00:1d34:e90c:f900:e29d:3a79:ac40:9edd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b945816f2sm136345955e9.8.2026.08.29.01.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 01:00:18 -0700 (PDT)
From: Deniz Aydogan <denizaydogan1902@gmail.com>
To: lizhi.hou@amd.com,
	amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Deniz Aydogan <denizaydogan1902@gmail.com>
Subject: [PATCH] accel/amdxdna: fix NULL deref and GEM object leak in error paths
Date: Sat, 29 Aug 2026 11:00:16 +0300
Message-ID: <20260829080016.10002-1-denizaydogan1902@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amdxdna_cmd_submit() does not set job->cmd_bo for internal driver
commands that pass AMDXDNA_INVALID_BO_HANDLE. If arg BO lookup fails
after that, the cmd_put cleanup calls amdxdna_gem_put_obj(NULL) which
dereferences a NULL pointer.

Separately, amdxdna_cmd_set_error() acquires a GEM reference via
amdxdna_gem_get_obj() when handling a chained command, but leaks it
when the subsequent amdxdna_gem_vmap() returns NULL.

Add a NULL check in the submit cleanup path and release the GEM
reference on vmap failure.

Fixes: 3ba13f5e7180 ("Merge tag 'devicetree-fixes-for-7.3-1'")
Signed-off-by: Deniz Aydogan <denizaydogan1902@gmail.com>
---
 drivers/accel/amdxdna/amdxdna_ctx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index 31a414c3f..c0444454a 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -183,8 +183,10 @@ int amdxdna_cmd_set_error(struct amdxdna_gem_obj *abo,
 		if (!abo)
 			return -EINVAL;
 		cmd = amdxdna_gem_vmap(abo);
-		if (!cmd)
+		if (!cmd) {
+			amdxdna_gem_put_obj(abo);
 			return -ENOMEM;
+		}
 	}
 
 	memset(cmd->data, 0xff, abo->mem.size - sizeof(*cmd));
@@ -676,7 +678,8 @@ int amdxdna_cmd_submit(struct amdxdna_client *client,
 put_bos:
 	amdxdna_arg_bos_put(job);
 cmd_put:
-	amdxdna_gem_put_obj(job->cmd_bo);
+	if (job->cmd_bo)
+		amdxdna_gem_put_obj(job->cmd_bo);
 free_job:
 	if (job->mm)
 		mmdrop(job->mm);
-- 
2.55.0

