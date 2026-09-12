Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475283A1D05
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789200648; cv=none; b=ZDYoHOw5WhxVVRi5ToLN+TaoRbErMbzIrWz5sF68NCGf4gr5prdWSmLBpnl8HxbnkDe0WsF3LF6yuhwl6cA4vnWhsiboE1uXqH57daF8a8sIuT7JOrg3zce6UL0CjSvVun+/bBJgF1ereiEmNp9NzH+rXdO8zApEyGLolOULL+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789200648; c=relaxed/simple;
	bh=mUKHHlQooGLT59Ah3RqD2AYxc1c/y9A2ALw5tBIdqtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E1kJZ8N8HaU3CqrHdEE462hti20tYFupXdKN+HTSrasAOblkDNyDY6yCwhAd8w+MQR8F5aMwajWlc9FoxpEMYbU0ovuOTIM3QEzbIbqKifvVUNZqBLuJaknocdMPx4/5ep3arO2RTmvqvdApgmLKtq+dWO8GYQL6LiIDsyYbDXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDeOOpX0; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDeOOpX0"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39d654f02baso302049a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789200646; x=1789805446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qekC0MqEXMTW5BJCD+Nqo9MkepvtatwwVDmZuLTl4rg=;
        b=FDeOOpX0FJG+9c1566VUXdQTzGODd7YY8f7YKjXJEz5g9eGwmueU6iFjvcZCV3+9n8
         d93l+nVpbYrrsVQ9rdBPZtWaVKfyHvJKvyVT4919NbsSG+0oxI576ju87SQfPl3ukiJO
         kfUWSr6wntmlp6d2b1K+7PAOEcGbueJRdzO9uerOURGRLoH5CydmanWVt/PuGqCcAt5H
         7HYBIwEi1M+T23NaSvBQTmwjjzOWxornarBLXVSRN7zlUzt2X9VPwm0SI2b6ejzc1WWo
         Li1dlloLvImVWUWC0/i6S/4hoxIjnq2DJ/ysgWEQBTh0Vw+AM8mHYWjaYWHcQSUIjLsh
         b9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789200646; x=1789805446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qekC0MqEXMTW5BJCD+Nqo9MkepvtatwwVDmZuLTl4rg=;
        b=MQfKwvEilWSUOd/5m0lWX+2j9gpHQbQyuvTRM7M8lPMQsJ8yUnwSP9dXzOSzqWXPfV
         YWlXeoy1yl6rPGHBf/CkH2IVriPuqVpVc7v2PExk+y8mPLfuqajs4kbcXa1l2VwJ6xlD
         UCdRDlcNt/7zmGMsHAnsrUPz5dXU82naUG5/hqbTRMM8QEFfgT0CdXbud7AZVP1ou5xl
         y3H4wntNPaVi0E2zSqXOSQrMnIRRL4gKptJBRtK9NTRsfChi8E1Sk6fIGRG9ySgehya7
         lhwP/HD+++fs5gadCkKe49JFDqphZk2QAWQ+lsTH4p8ZYBbP43u0eiU8jHEk5wpcyisz
         E9eg==
X-Forwarded-Encrypted: i=1; AKwUvBxU2US5qUGRbjzYgs7WUhmra06td0tmACJ+VnYf0UchLqBNNmVDedImKwfKiCNHsTCfXj4BX9p2qWtqkrM=@vger.kernel.org
X-Gm-Message-State: AFuF++kmd1GyKSRcVRfxskYqUKsLfoxKvBdEB682TQS0TiTRqEKpTduH
	z1PNjtkgjsJ3dt4Ta/yMCqEKxTOOTFoc2TYLDSWFJDuN2uuVMVAXKUuyGUuXnsuYbFU=
X-Gm-Gg: AYBFou2WPz9wo0axCbCe/jXwMneDBTt9jAlbfKXnw3eW9MfsAsFemvNJPVtfRBQzJyA
	VeUh2z4M3z+5+OKKsLUA37+2ZU6w4q3LPXwYCAdUhl4yWc6fJb65QM8UhRGwmtilBvDYHuxQshO
	EMGj27EM0qj6d1v0ppazGcmXOGmFY6INMIcKlpaEl6ZvWBVqv/rFrmi082lpN+pdD5OC98tmSgN
	3vWWOCIizaDysMmjqz+8hbQInOJUoXcH2eGeFMAkrySwCEzbpiQchUs8Bo22sba4WMsw4l9NXHw
	z9sHBecdF1VNwTass3J7+qZ/x0qEgWkfLGkAiLFBdLwLwDfEvtuT/LE+ztemxevkSiQZq9Ld8f4
	JIHZPz13AGiqJ2cgsBQg1iINGbpFVKgGUQqzUYhOBv68M25t/3/BoTjpZ8SZye+ChUHCWuOlpUM
	tjgoib2z1cUg+XabWq7Yje5VJXjYwDsPw56KiR/39AsxepDg7FWhbOZiYzV/N2O2396U4GN8OCj
	daXDlCCmOhplq92wsJGpITDFpb68y1wUOhTl+XYIdpmXrxazvqQLOmyu4Fi9Ev+zYaFTNla1AN7
	2wj2spF1dcEc0RMXC4Ek/MIgkfyCnGj+Hyjf0qsDSXGT
X-Received: by 2002:a17:90b:57c6:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-39dbbeb57a5mr3434433a91.7.1789200646524;
        Sat, 12 Sep 2026 01:10:46 -0700 (PDT)
Received: from 0xiviel.ip (122-63-135-80.mobile.spark.co.nz. [122.63.135.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39db7ae6d25sm982474a91.1.2026.09.12.01.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 01:10:46 -0700 (PDT)
From: Eva Crystal <0xiviel@gmail.com>
To: Min Ma <mamin506@gmail.com>,
	Lizhi Hou <lizhi.hou@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Eva Crystal <0xiviel@gmail.com>
Subject: [PATCH 3/4] accel/amdxdna: release the chained command BO when vmap fails
Date: Sat, 12 Sep 2026 20:10:11 +1200
Message-ID: <20260912081012.2274075-4-0xiviel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260912081012.2274075-1-0xiviel@gmail.com>
References: <20260912081012.2274075-1-0xiviel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When amdxdna_cmd_set_error() follows a command chain it takes a
reference on the BO named by the chain:

	abo = amdxdna_gem_get_obj(client, cc->data[0], AMDXDNA_BO_SHARE);
	if (!abo)
		return -EINVAL;
	cmd = amdxdna_gem_vmap(abo);
	if (!cmd)
		return -ENOMEM;

and drops it at the end of the function under "if (cc)". The -ENOMEM
path returns before reaching that, so the reference taken by
amdxdna_gem_get_obj() is leaked and the GEM object is never freed.

amdxdna_gem_vmap() fails only if drm_gem_vmap() fails, which needs
memory pressure or an exporter that refuses the mapping, so this is a
small leak on a rare path rather than something a caller can drive at
will. It is still a leak, and the chain BO handle comes from a command
buffer user space can write.

Drop the reference before returning.

Signed-off-by: Eva Crystal <0xiviel@gmail.com>
---
 drivers/accel/amdxdna/amdxdna_ctx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index c24bf1c..7a61e83 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -170,8 +170,10 @@ int amdxdna_cmd_set_error(struct amdxdna_gem_obj *abo,
 		if (!abo)
 			return -EINVAL;
 		cmd = amdxdna_gem_vmap(abo);
-		if (!cmd)
+		if (!cmd) {
+			amdxdna_gem_put_obj(abo);
 			return -ENOMEM;
+		}
 	}
 
 	if (abo->mem.size < sizeof(*cmd)) {
-- 
2.53.0

