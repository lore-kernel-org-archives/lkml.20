Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A2161FCE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756593; cv=none; b=mi92rWuIyRPHLhaBIn25SCy3lvp+juT31nmJCdy8hYake9lJUWdMT8LkPF8kyrH5nARxxew99BmNxCEujs2Yy9h8ETN5OpQWpuDPGNGLhv31ImM49K1dirNlV561jDyoWdsQH74pV2PTjw/TnwCQrCAiJ61AOKt4h1jDr441Qag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756593; c=relaxed/simple;
	bh=kUqvJYmPAeHmEQLK0LbbqKY8SPfxqMl8bBWx7arv2PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JESum88f12ZaXjs4RU84mXcSb9p9ey8HpDPvgVF36xaOHDLgZ5aj3IcTAJ6cy5iXnyk2rnALHTelBDoabGhd3mrDwwWewkowo8M/AO4bioSfOfzo/CgUw+CayP/QwEjS3kZ8cuLROGPdRr5zX79CL571bcWYhaPYDcbacK3f1uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVjkQAvE; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVjkQAvE"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d6e954afbdso19102385ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756592; x=1789361392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2CfE3tFMihN3EBImlkt3G7IMkI+PLQD4mkC8iY3FVKU=;
        b=SVjkQAvE85LQkmaCZKHf98RWOtsDZmImF5KzIZMIplYXr2dYxenvfB8dlAsFDZvOZa
         CLal6oxcnlEK77XrkhGa6P1/5S9Gi2HpEuK5U1IMRw3hpk36BrPaPV6h6ep147d3QMss
         BCzr0S4DdB8h7uRfubhjYR1pLFVtyLu6WAc8UJZdw8kLla/0dGEWrLw3iGJzQAtCUI/A
         YD7dgC/2AoXwiR5Zzk6lmcovJ1v3uyslSsOuhn3De9ClIj5oICENOisuWF4iI5Gvv7XV
         lRgb/cCixsyJNTlb5OQjmJb7qRHikBNDaRq6I9YdFJouCuFoT1k3VQIAKw2Ps8Ea5JiQ
         T63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756592; x=1789361392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2CfE3tFMihN3EBImlkt3G7IMkI+PLQD4mkC8iY3FVKU=;
        b=nul3K2i8OzmMZFWuASjjf0e54ODGfCWkan789I/QOp4UJM1oigHLc4feoCSeXFoCz5
         6t02NnJXYDqHwkFR1B5sWUckp1e5boPI1iVgKQFaWZQAn2uyMaDiVebTw8H3NNdC4rRW
         Ltav7/X78UY476W8KX5DAI+m2q5d7PvRIWjQep8vGVrMBSEPx/vxO+3G14+Q671fK8P8
         7Sa3jfpKJj+ETHwgx8mHsgRvx5y7RxwfwOjGH9wdMXoVesBaPDIJ6B2KukYtWADHjx4I
         OZpFDNnk732AX1lPDy7myXhPtOHqNVthlF8ATdqWhPGgCGyAxzMc9w6BXLrkhvWcS2nV
         lB0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxFmxXZkjmL7rm3lV1rgixa2h3GU83RgIZCRs2YtKCrrGZXvx620XOTDcucLTTbLxDTWO43+PF19Ntz11Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mKMpMa/7jm3JuWZEEyA6pzzIsY4RyQqgj1HwZHgFQe+Kk8iSLN
	BtsOZYx5EsQsm7keUAtxCfdftcDl5lKGfCT19Gh1X61FBGkrnzxftRVp
X-Gm-Gg: AYBFou3Tgl51E/1HZq0/c5N0MuQTfbZJBrAza2RKTfCymM50qIW6zcaIX0CjM3+jx8u
	/bCniFwVm9Y1FBXq53sQHCXBnKVSRCJb+zTPr6t4bZpy29I0HIHbBVCglBZJQCeAZeQdikbuXB3
	xicl9loxgixxJhkuREs5NwFzv/56z1Nsq2O5KZ0yEvclCjqDkPMiXoIqPm5zc6voQlE1o1OndEg
	NdZXSOMLpxzYSVhxqMwNF4La5DzX9v4f3TSNmr5lZg6XRurN2qKJu59RLDBGNXdNy1MD0of0HR9
	62ne0UEOKw2jG3j2Dv5YNwiuYryh3/9jTJ3vSjB21mjIQ7ldty8BzfFzSNHci8Z00X6IwDGETj6
	oe1LEab+OtgOlcL+J7Oe6DRmifyBz2/isK+erlSXhVmG3tfLeeL6KrStlJBt33iffM5MkMtePy6
	R9i6mVTI/sXqUAxQX7/5+mrdNnSwaAqb4lJn69iuFz+jAw8ljJZZbEZvR1Gi33jJctBJAH1GSaW
	oDxgDf0iFNJ8dAgikNl0Tr2
X-Received: by 2002:a17:903:1b47:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2db124ca14amr305686505ad.9.1788756592084;
        Sun, 06 Sep 2026 21:49:52 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm21501484eec.6.2026.09.06.21.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:49:51 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>
Cc: linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Drivers: hv: fix typos in comments
Date: Mon,  7 Sep 2026 10:19:44 +0530
Message-ID: <20260907044946.10813-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the spelling fixes for this tree.

Changes since v1:
Subject prefix of patch 1 corrected to 'Drivers: hv: vmbus:'.
Michael Kelley's Reviewed-by tags are picked up.

Only comments change; no code is touched.

 drivers/hv/channel.c        | 2 +-
 tools/hv/hv_get_dns_info.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

