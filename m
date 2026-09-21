Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E091FC0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789957120; cv=none; b=pQJcoqPU1kM0B8N8wNuVvz69xgS9BJ0FbnlL7Ncy3ShnpWK/UxhDwfAFof1g74bD513bGTczZ+1BMpcuuT2syHn4sKSSFtnburg7zKVcED69+wXnKuwhqzDtjnkVMWjRBtyGY6kmmxZTKaQwws2943U+1SSYl2AoKGMMoxhseRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789957120; c=relaxed/simple;
	bh=4/sCw9uP7g+QOnJazpheqyGPE9Vkt6XAzTsovP1hny4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IMyw458cKA0GzWK3sWsTM2K+a+8EKaDtbSJU44YFKPEq9o6LschNjJx/bpv4E1uAu6TDUVRcLtFKoE2hcUodfMkBZTcdp5Xr7oML5qOMHqqxTq3uhOdJzO2jzzegAqUMiFDsHP7MmwhhH2KmHsnpQdoGi8Qogs1p4kG2/4uYl/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=diHNMIvA; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="diHNMIvA"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-52ff0eea420so21384481cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789957118; x=1790561918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JCNvGicwp/n2gu6AKfWbf4m/nOxoNC2oM7QFIhvZcY8=;
        b=diHNMIvAASHGylHw3YUpsC4ET1wP7wgSttSQFr4ha3aHMxlorc4IDiUUJsjbe/BEIr
         V/9kj0Giqsd/TqatzAVXgnfT1G5WlH/8xrG3EIg6myfiTYUkMQXVI6tByaKw/c0lpt2d
         mvJYMGSpvuRHMBdk2lsGtwWy5zECHI5br4heFqznE5K8Wi/NLn6iCxbmO8kJXkmAJFUM
         8mf6bTlvJ12kk3nspDqkoou/HO0vA4Kx0r3SUKVq8+72PbYxS6XRPG4658+I5T4+PMHF
         43WjCpPsh01MNPwf/SAQL3nL/7LYyCK+7Sii1YhYGEz9z2y5+eaQPrqRlvz1+0yvzZgg
         qNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789957118; x=1790561918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JCNvGicwp/n2gu6AKfWbf4m/nOxoNC2oM7QFIhvZcY8=;
        b=t25IkVD2NO+prTGHoSZa88hMvHKaJ8HnQYmEzMZAAmwCXYkH0wCoj9iuk33SZJ5bkf
         9hve2JGTnRD95dLHpNwSR3KkwGy/0VfCApccjIYRJR3l5tjqLAAe7tg3ns88sNbMRgPC
         VhSFCn1DDZTed3nSA5nvtS2eFE4D37gGOo+S0RLzxFgEc+/m+Lnm4Gd5o5U3zEamCuih
         BO9Xv5I+871ThZrn+Cee2faHNJdvOZOI2QSC19TdFkaWJLiu0yzMSEIK8hISKtF4LKGu
         Ed+B8IcemAqLCLwgTkec4DuQ84tnH0npJEsfa4w7XwLkZgHv2VGfSnK3gJcY2jj1khEi
         t2Sg==
X-Forwarded-Encrypted: i=1; AKwUvByQEWuLAy3YWQ8pwIeuV6YQe9Brjy3JYsH2DKY2GqIiHT/JVb5NPGe/sXP0UNpSgJ95ZNljqijQIX8snE4=@vger.kernel.org
X-Gm-Message-State: AFuF++k+BRcwpqnxjv/DLEiJF0qee9ME15jGFKIg4unsFigs9Ug9H1Zb
	zNdSHeleQEsoGKH6JvCpGUDhXcbRu7vuMNQ/JNc7bNr4EECOSEDGBqs=
X-Gm-Gg: AYBFou1MJsRNdE+A3mDW30aZxERropP/DXaSdW8tT9ISCXzVB8nInHutoVnN3RaS39w
	ZO78VFSPzdQV4gmW2D4bY9IHGsroOhZyyuTJdDlaSIXd9EnnIYtHSOWYJrFwLFmkh5NFyP6V9jT
	/nl71er3bWyQ2cLIahRZB2xhEyffBEOhhiioCriiQMkIUGeD/+1zynjdUZ4/lAxVOtrWQuCuzUA
	Bxa4ihK32t3Ax/LlujXHzF5ZTvdIxSiJg0T87CtAszcIl3KnwDod4whKqVJxh2lF7qau21xQecy
	V8axwg9pelVCXvpGGqCamXgXoPvZi9EeL7tOSOmIawM4a4xkAjGMZAOpZG2cWWNHTzs4dHzf8Mh
	CYPmMSWA/+AMPl8Czro7BFexjpuCLR/3iCWvo5DEnzradpiio7b/gryXOpqHig1ucpZjNM/tUvk
	fRKLHEa35N6euVK42NpzP+ekCK4e3Zfa4uUGWJaxntgyIDOiWDLVlEAzHS+qzjFHM0fS7fmpbzf
	rIHl2SDV4Qpv5Cb3rjDRPjkVFrjKQyrvalt1z0VVXcP+Wo52qPUjpfZwyEllqjmLv8xfOlBF+tM
	c+Jwe2EjS+r9JdDc9HA8f4rpMjpOywjyfyQLMEc=
X-Received: by 2002:a05:622a:2cd:b0:530:d98f:6caa with SMTP id d75a77b69052e-532b71d98d8mr85282251cf.2.1789957118506;
        Sun, 20 Sep 2026 19:18:38 -0700 (PDT)
Received: from localhost.localdomain (ool-18ba9fde.dyn.optonline.net. [24.186.159.222])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260aa15cdsm56221876d6.41.2026.09.20.19.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 19:18:38 -0700 (PDT)
From: Justin Vargas <justinyvar@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	jlee@suse.com,
	corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev
Cc: W_Armin@gmx.de,
	krishna.chomal108@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Vargas <justinyvar@gmail.com>
Subject: [PATCH v2 1/3] platform/x86: acer-wmi: Remove unused platform_profile_support variable
Date: Sun, 20 Sep 2026 22:17:18 -0400
Message-ID: <20260921021720.5976-2-justinyvar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921021720.5976-1-justinyvar@gmail.com>
References: <20260921021720.5976-1-justinyvar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform_profile_support variable is assigned during platform
profile setup but is never read anywhere in the driver. Remove it.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Justin Vargas <justinyvar@gmail.com>
---
 drivers/platform/x86/acer-wmi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index d3d741aad55..657d23c8f9a 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -859,7 +859,6 @@ static const struct dmi_system_id non_acer_quirks[] __initconst = {
 };
 
 static struct device *platform_profile_device;
-static bool platform_profile_support;
 
 /*
  * The profile used before turbo mode. This variable is needed for
@@ -2219,8 +2218,6 @@ static int acer_platform_profile_setup(struct platform_device *device)
 			&device->dev, "acer-wmi", NULL, &acer_predator_v4_platform_profile_ops);
 		if (IS_ERR(platform_profile_device))
 			return PTR_ERR(platform_profile_device);
-
-		platform_profile_support = true;
 	}
 	return 0;
 }
-- 
2.47.3

