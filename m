Received: from mail-pj2-f36.google.com (mail-pj2-f36.google.com [74.125.227.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5013D0907
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790062973; cv=none; b=gYmacwzKmvC7oqLL+L8r+gwjwUVusATFfr0CWPsVCFV+51FPcUpek14OqfRdRXXG7ns5X0oNUK80HwEGHdQjk8v5fhjSSLDSnIimwGDhOu99gK6rmut7wr1sV5CXw5WF8Yf56rw1leNe2iiqyq2e4t0RgdNCeoXoKHgS5zcmriA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790062973; c=relaxed/simple;
	bh=6mIcN5UR5Jby1K67kSg7q6vCQLLiQj+bsnPcHyWPHXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GqfkKH2ILed+fve5fZCG6PCDd5KKM5ORtp+q/wDKMIVcYyVQeDCl8vy1Zx4yEFPMUwkenm8e5YWQLnH/MN5N9+26BAJ1SZvIBg4+UJPNO2aTyqFe26l2EgRUqNPmuyU5rkT6X9zKIkLokXaJzBCW+6HbWBNG98SuYj/R9BL1zao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=newp8E6P; arc=none smtp.client-ip=74.125.227.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="newp8E6P"
Received: by mail-pj2-f36.google.com with SMTP id d9443c01a7336-2d8fdc579daso42710715ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790062972; x=1790667772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T4bXv4ioTNcgEst1EUu0msleevfYTOmr0PXPd7ZaOJ4=;
        b=newp8E6PQSiBq7JbvDujX7GXrvi4EgGUlvyIx9af2uRw077RSCpH9XzOnxRRHsPfGx
         0R8VK+a6ZuxjvTIHJmapSDY+KAz3AMR15gNYjDEhHxp6Mq6BfMRUEK2eEn27ZpDx+5IO
         Ls7W6xessLJw1MSxxQb4u+qKxr+luopUJOOk5tSCCHO8DtB6yg6Cv+rbTpmAkJgrtG9K
         yvB55fMoOxOjBNE1ADMVK5MrWxB/ATQqvccOVX4DkUZrewOtdPMAmOuTWDYMZWHAx9fp
         MhEUbr/+1fA1u8Wiq0wady8H+j0cZV6AtX3bfDQ8syeda3qVCJNBzhcUVMB4uHa4ntVl
         GhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790062972; x=1790667772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T4bXv4ioTNcgEst1EUu0msleevfYTOmr0PXPd7ZaOJ4=;
        b=MpWZfHdAPBUVxDniV4fcDej2jG8QhNJQdS7h/CLp5kpHrySv+Nwx7MDnM8DkBTor6W
         1iDiEFXSrJ8rrOwEFJF1nt2jK60GsNQ+lIg2IjOOhZZAIzifJJ6noqziExVbP3pcMjaJ
         q95Oty6BRy9Hc0JqdqGZUvKjaXMvjH2luMGaXN10oTuQ3+QBjkRtSKnFnB6lmwveGqRT
         tNpxeBoq934MFLWw71PfNAnsBbApz0odK7AI1wn4dQJEX74FiY+sKb1ZZeKR3PTPgbtP
         nCdUWAnFOaXjEhguigiXpqAq09WXj6oS08r/Y5Q0Ca3CncmcLjDQI2FAOEqHARNbPkqJ
         0mzQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2D/V2Y68Q/B6fgaEtgPZJ6ZQXy2O3hWHgwIlFOGK5T/xzI6UkUJOn5YU7aon8/i0slPN5XAOTzgsdOoY=@vger.kernel.org
X-Gm-Message-State: AFuF++lk5+3NnS4Fcm+gWuUnISk1Q/rz2o2ZqkJ8duk4meqlKUzUaA5N
	9q9zfpJzUUXC/prBoeyXUQxCm4CNF3HKHY3sbey9HcDbAPAVcNvP1QGhs/QWjPhTqR/iQg==
X-Gm-Gg: AYBFou3h51NKxZ5XurlZM7qBkT7l6ID7OPHe/t7dTq70dlsjlh7Ty8u5bbG7eY5zmqI
	5hMXCf9UW25aoLh1mVU914bOm1nk6fQ6z3xVcMQO+O0dtLa+G0YPZ+p4yG0XamvRJaLcnO/37+A
	ZxnDd1bzWpR8qcWkwZkM3qUsGjqsRaxYjYCMofFmtmmpWJ7jy9pQ+8WKT3C36po/u8kTX2gUBuF
	0xwHgwVzpdxp+iPSp0noB1bhflnxdCpM60sW5Rla36ipqQzzs5+GnVfMA2Msiv6vIDGh8DZ4YSh
	vHWjFJddRxFaFWrKsl3dSHL4jYYmc6vaLjS0RrYTst+OdwYfs0rUG8NeBTMq+2UwEK0to+KXfy/
	HB6T5yz7if9eERb4d7FX4PfPp+CIl011xMFdAsoEEyU9Y+C3p8/h7L80Qz3d+GEtqXoebfQXZCp
	yNIVtF5AnRzfT9fXpZj3/ojQ+9vt2zcqGE2eRniKInL4gi+MGj4NsWcltJ443yCcosQ8y1MTE2P
	sZJk95NobjUX3NZXmadzLYNDgjheJkEFIyhxQuCem2BxKS6TdnVQMHw
X-Received: by 2002:a17:903:2f48:b0:2dd:c100:3131 with SMTP id d9443c01a7336-2df60b4cdc6mr3361165ad.45.1790062971717;
        Tue, 22 Sep 2026 00:42:51 -0700 (PDT)
Received: from localhost.localdomain (5.240.104.34.bc.googleusercontent.com. [34.104.240.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d05602csm5215005ad.65.2026.09.22.00.42.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 00:42:51 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com
Cc: netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net/mlx5: HV VHCA: Fix the agent registration race
Date: Tue, 22 Sep 2026 15:42:46 +0800
Message-ID: <20260922074246.20411-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mlx5_hv_vhca_agent_create() drops agents_lock between checking whether an
agent is already registered for the type and publishing the new agent, so two
concurrent create calls for the same type can both pass the check.  The second
one then silently replaces the first one in hv_vhca->agents[], and the agent
allocated by the first call is leaked.

Hold agents_lock for the whole registration.  While at it, read
hv_vhca->agents[MLX5_HV_VHCA_AGENT_CONTROL] under the lock in
mlx5_hv_vhca_cleanup() as well, since that slot is written under the lock.

Fixes: 87175120defd ("net/mlx5: Add HV VHCA infrastructure")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/lib/hv_vhca.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/lib/hv_vhca.c b/drivers/net/ethernet/mellanox/mlx5/core/lib/hv_vhca.c
--- a/drivers/net/ethernet/mellanox/mlx5/core/lib/hv_vhca.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/lib/hv_vhca.c
@@ -228,7 +228,10 @@ void mlx5_hv_vhca_cleanup(struct mlx5_hv_vhca *hv_vhca
 	if (!hv_vhca)
 		return;
 
+	mutex_lock(&hv_vhca->agents_lock);
 	agent = hv_vhca->agents[MLX5_HV_VHCA_AGENT_CONTROL];
+	mutex_unlock(&hv_vhca->agents_lock);
+
 	if (agent)
 		mlx5_hv_vhca_control_agent_destroy(agent);
 
@@ -270,11 +273,12 @@ mlx5_hv_vhca_agent_create(struct mlx5_hv_vhca *hv_vhca
 		mutex_unlock(&hv_vhca->agents_lock);
 		return ERR_PTR(-EINVAL);
 	}
-	mutex_unlock(&hv_vhca->agents_lock);
 
 	agent = kzalloc_obj(*agent);
-	if (!agent)
+	if (!agent) {
+		mutex_unlock(&hv_vhca->agents_lock);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	agent->type      = type;
 	agent->hv_vhca   = hv_vhca;
@@ -286,7 +290,6 @@ mlx5_hv_vhca_agent_create(struct mlx5_hv_vhca *hv_vhca
 	if (ctx_update)
 		WRITE_ONCE(*ctx_update, agent);
 
-	mutex_lock(&hv_vhca->agents_lock);
 	hv_vhca->agents[type] = agent;
 	mutex_unlock(&hv_vhca->agents_lock);
 
-- 
2.43.0
