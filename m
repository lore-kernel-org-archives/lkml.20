Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAFC32AADB
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 16:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788625924; cv=none; b=jJ+9ZnnkV0J5SyL3AAXLVUv+yspQLPedDMTEnMABCr3XkgSwCy+nerVHZUQ240xeB+Kcz2DXkfRQCTdcOi6DK7a4hmiKZH1mF9ywLYyTnrrj1ZNkOw7MII5qI3QmHhR89DmFXuFh3KnNYBBSB41Cl2HHrNmatKXlhhJkDrRJvFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788625924; c=relaxed/simple;
	bh=A9g8zgH3L3y1v+iasAIcKw9F3bfJ+k3kxNILnBKDalY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=asOy2VWE082EoCwYwuEV657BAHybpU/Bt2cfhDJFLKBd5KtOi/2fu+w/Fz4cbaY8m936GKYoF3QEQtZdiVf7hRZXALqaso3oaq8PDTJ28ywqdJP1yzXnxmYeK6xD4cGdc9qajUe82mJ0Dnwc9CJmZuy+LiB4HyK3nEWtYIdpbRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWK6kvWY; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWK6kvWY"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so1432348a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 09:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788625922; x=1789230722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tKVHrL8n9+eK06z6dZ3CMW+ik7hM+TIs7LDRylnIPWo=;
        b=XWK6kvWYou64Q7/gp8bkBmiVdLL9/6bf4ljoMiv8EattJGUCDLxqdgimUoKI/LuhBy
         5V4UghlEhFd6+JF07rQdVu/VfybSMVzDNhDRlDg7s6CZpM8qW0YUoLpZUGS/qmsWGCGU
         2wB9KEXZSLpzae/i23oGpVRwphfM14NDCZetaLcy3IfaLVUsvDsMdeQaP3MECiMjIuoW
         VkY/UhAWV5NFlmK1CGDvszwnCVbfDZTLriy2FyNf8AQ7TJkpN+tMohEffMz0iI7AzZOr
         tCNHkoC8Cviq7ESlegoOFTIzWbDkJyvQ+M38z0Hi77iSl285ybbMniWqopIeiSQR8hbh
         EAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788625922; x=1789230722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKVHrL8n9+eK06z6dZ3CMW+ik7hM+TIs7LDRylnIPWo=;
        b=OZq6J9jFV7JLkDv1TMUYYA9lx7hVs0euuo4okDurQCKm8r1qmClbWMY7LePXetrvce
         iUX6Rln4sajZ6IdKoyKFgT2tn/4UvYENmqYadTfwBauHYI5zUrvWdP4F7EkkBT1O8/LB
         yOwHn6D0UiI2DyxQ4XPZXThjkjF3mDLas0GRiyeLqpGB6e2BiFgVj/NkDj8SsYO6+LZ3
         8lvm07uKjieCOJpJDezylNmXbPzTdGkGMb5JaQNmRxM5WvTOioUfMcrD3+0qDrZEYttq
         VYFqAeKYXrAG8v/3B+5LZcgucyg/+kG10b1es+1FrlXy2f3mI033Iexa4gHRkBoUAfYc
         6FAQ==
X-Gm-Message-State: AFuF++nGEnosa2kLjENBMriYVz0i3X7cp3cfSW+W/z1I0qvgol7x4xlN
	hcq+Ta83VJhd+rBEGWHpUVXBjTT4KNVjxa02gqBC7I5TU7jDAaj/RFy4
X-Gm-Gg: AYBFou2njTd9vUzCIClnSrbDqtUGlAdBKmI5NDyfzH5xKw8bgB4CsIo+he8JBx9aRE0
	nSk2cWKg+llG1i8qS7cTye6GZ/n1A9/X1M0DJHUfIh4tBrmQfjGO8VoWCRbJCbPhU/VWnyRrZaf
	7CKOhtHYiphhQZ27PMByO/Uxkl0ML0kev9Afy63hfVWpA0zS8DXIuhO49/26iiozpqiZuKguQYX
	2iUpY/DFOzTZ1+XXaUwuht9dx+s0XGFF0UQKphjHbA9cE50H49z9lMbZE7g3BlDvCGGMk8S6KYK
	IOiH7WEZAcOR4lzeC52GyDhs5hyJGX8crhDWw6MJ+4JdKvoixF9gmhWRJvijc86V5wlJWS8SYEO
	F0+rQw4+MLCS1SnQSLDDDohxzY/Pjj0iBAVa0SV/yCTrIikW7iQR3JroVuSjivEL+dyiYijRwkP
	wPgiZztOdp3ujwLKmfWeWpP9vyMMzGw34jJDK9tVpNrE7wU4wDT5s4TT0qWFsvq9Sobt8uc0Fc8
	MliAVkqVYmR10lNP0N2nISdXx3WsJJcHSQVCu61Yi/UzbDlyqoUjEYcO2rHbjbSsRU=
X-Received: by 2002:a17:90b:2b8b:b0:398:c0ad:711c with SMTP id 98e67ed59e1d1-39b26272f0fmr21323072a91.15.1788625922125;
        Sat, 05 Sep 2026 09:32:02 -0700 (PDT)
Received: from codespaces-1adab9.ktkhmpmw22vebpok31ngjx2qsb.ix.internal.cloudapp.net ([23.97.62.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b3312f9a8sm8348354a91.2.2026.09.05.09.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 09:32:01 -0700 (PDT)
From: rivaldihormat-debug <rivaldihormat@gmail.com>
To: intel-wired-lan@lists.osuosl.org
Cc: linux-kernel@vger.kernel.org,
	Rifaldi Hormat <rivaldihormat@gmail.com>
Subject: [PATCH] i40e: fix integer overflow in i40e_dbg_command_write()
Date: Sat,  5 Sep 2026 16:31:44 +0000
Message-ID: <20260905163144.17069-1-rivaldihormat@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rifaldi Hormat <rivaldihormat@gmail.com>

Signed-off-by: Rifaldi Hormat <rivaldihormat@gmail.com>
---
 drivers/net/ethernet/intel/i40e/i40e_debugfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/intel/i40e/i40e_debugfs.c b/drivers/net/ethernet/intel/i40e/i40e_debugfs.c
index 0b52509cb14c..74e75504fdda 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_debugfs.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_debugfs.c
@@ -722,6 +722,8 @@ static ssize_t i40e_dbg_command_write(struct file *filp,
 	int cnt;
 
 	/* don't allow partial writes */
+	if (count == 0 || count > PAGE_SIZE)
+		return -EINVAL;
 	if (*ppos != 0)
 		return 0;
 
@@ -1605,6 +1607,8 @@ static ssize_t i40e_dbg_netdev_ops_write(struct file *filp,
 	int i, cnt;
 
 	/* don't allow partial writes */
+	if (count == 0 || count > PAGE_SIZE)
+		return -EINVAL;
 	if (*ppos != 0)
 		return 0;
 
-- 
2.53.0

