Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104F046A61A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145765; cv=none; b=WvxeBuuYXev85KphE7xeVJAkNlILBH1ay/HBGOU5iwukWIT+qKw/CKGu8NozJZCTeZvzMa2U5bZPwNpvsKdRe5tmJbqZKc07HYuKMDX2NURrcheQd/FNJ5YkzdCmjlB1rw42Ba/BeiAAG099syG1LhrKAnb/X4mcvstdle1GMck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145765; c=relaxed/simple;
	bh=G2XY5mbE08vqUsJiWbswLBTOR5Dwtz7xnSrdAI1wj3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jYWjWvFVxDgykrEpEIAkCi45FyD8nZrMZFoCAIvbpvCQr1fSCz7VrwFlgQToP3ZCmvTyis+Gu8JV46iqq3vzslV6by24l7tqyxOfT/nOdpXbVLfcjlkuS7o97ceUusQwf0JBZX5OTemWIdf+Jgku39L0Vs5JJrMPnQHxdFtNIO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDd7ko8L; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDd7ko8L"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35ef6b49813so3901534eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792145763; x=1792750563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EkQ2fSP0Uv8z7vsyAAy4/OpXnLsDXMhIw27wTwsr6Bc=;
        b=bDd7ko8LszPmSRnu3zDnTEN8Pl/VrbOqtnDGuoANevPiRGYZJLWZ+jDqwmalQiViZQ
         D02wl144dYWfeOAuk4dYoAFW3W2Mc0YM17rjfIs0q/qoeCA2D//chMATs6qi84JqqwVX
         S7OP5qrR3jC6lPqfgRyyXlZ9GLK4/Ejh+cMirddRvD3nWN7ojIRLPKDb0QUHr+DaPbw4
         TAsrVt8s6aNTCCvDzG93xZ81Uzq9rD8YmmCIqNmZ1QXURjQEgE+qgTAJsfZ/vPjZgs9O
         eOAqr4HnfUrrS4J6eEcWdirFnzswUoiAHz45gjQY2l+ec4J2g5SLkgmPTABxwGsS3Znk
         V+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145763; x=1792750563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EkQ2fSP0Uv8z7vsyAAy4/OpXnLsDXMhIw27wTwsr6Bc=;
        b=NLDJncqECDwNmo1QLXg47Zh/FBttxL1ok30J0d66Br23mpoeyEWS34EpZN8UkEGN+4
         FOMTY4oa4SMsUvy+VE/3YLNvQO3kTKpPqDcmDAC976ZK8nwtvpwrdUT3mj+fn33Z6FdK
         r+MatDD0V1p58/qaAfRbrXgB+EOVaQQttZDIhH/2M6Uouj76BI43PPhm9acbAsrtPECW
         VbxH/PkPzwm41S57o64+iQAfZXXwmScEF/zj6zddEoZPdB7IiPNgWPmFLCXwPedfrXsB
         SOIdPDuHqAeNuEG56Dl04tKrwBeLjWceqvuJnYkohBa3vmI1gO8rfM7t4PKzwq9B0Hb/
         AhuA==
X-Forwarded-Encrypted: i=1; AKwUvBzkgoTdPgu5+JkngYVneHxxHpvZ9+GogvdjAKbuOlJ8xOk6ZxAYa+AG94zsRBfwfA+B3oZtjGGbbk4Km6Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzx0hK+HVvISeQrDW9/q/SxRaJMecUwVs6USnY+4Gl+2TLbcyR
	btQrKppCaPcQpMQ/+pXUhC7A/+frZutPj5Nnai0mQNKy3OD5Hf3NyZAN
X-Gm-Gg: AYBFou1LSF6+VX7I8/MNyI7PCO7MjjWmF8jcNXM7Z8VbGj3SX5/pGzzMBdi2KtgwkF+
	/AWiK+k6yTTvKoihmCkZZD6CnABMKlXInq0pYvD/WsSPca5XO7Hyyfj58oSui3T+D+0+/lyq6uQ
	so7HPCfSjJ6dhQIjO8h2I2sEDOHZGQtymEGUCrSCTbnrimy4FzqNWWD+FYxizT7RR+9XjyUwZGH
	kXldUVH1Xu8HRzRQMwntibX+vRsqAWt7rOigpV5AfMlxXjb18HSR4f5XSUC35AbdENaaV+OINFx
	R/31TEOJhR6FpGyfPV8APFSHzJZBU/X/OvYfuh+LiFmEhnOWmjs/J36aUAXzvms6wcTovIJgWP/
	yLnTuQh6GZOrnkSSJYUs36JTWraTvCetKiyac6s6TXO63xZWM+8IfD/CLgNY3w1Ic3d3BxaCec4
	DXGZ/E3tAv5UNTq7GqEkYGrtX5REG5KRDOpDEHeK/YF/XH0hFyE0Uep/N4DfEQu0erg/xnZRfUt
	Lz7aFof/TD7objb1bgrYYBmRApeq5wCn5vwY0OuDorVuwLf9mvGMl4nycmwLkcLfYlpeJUA
X-Received: by 2002:a05:693c:60d4:b0:359:2f0b:aa89 with SMTP id 5a478bee46e88-3592f0bc083mr26553110eec.10.1792145761800;
        Fri, 16 Oct 2026 03:16:01 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:1467:1666:71b7:b993])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm9389619eec.28.2026.10.16.03.15.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 03:16:01 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Oded Gabbay <ogabbay@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH] accel: ethosu: Fix kernel-doc for ethosu_gem_cmdstream_create()
Date: Fri, 16 Oct 2026 15:45:49 +0530
Message-ID: <20261016101554.14231-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment documents an exclusive_vm argument the function never had, and
leaves out data. Swap the two so the list matches the signature.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/accel/ethosu/ethosu_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 9afe2549e..2b89f70f4 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -712,8 +712,8 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
  * ethosu_gem_cmdstream_create() - Create a GEM object and attach it to a handle.
  * @file: DRM file.
  * @ddev: DRM device.
- * @exclusive_vm: Exclusive VM. Not NULL if the GEM object can't be shared.
  * @size: Size of the GEM object to allocate.
+ * @data: User pointer to the command stream contents.
  * @flags: Combination of drm_ethosu_bo_flags flags.
  * @handle: Pointer holding the handle pointing to the new GEM object.
  *
-- 
2.46.0

