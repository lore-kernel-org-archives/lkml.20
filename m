Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE2E4A205B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379612; cv=none; b=LD/gnv02258dDrrAYHCLW7fG6aXs6n8xAZSde/HURKZhUBu/o6gCwUjyz3CGCNeA4PKJmGu9LMe64cnvxrBIbVLNZKOu9P4Aua9z6/bFK8GwaFNIfQ4Is14VpP4XTfJEnTb4qpZSxE1M3IgkCtzw+963slZpL8gnzPAIKiqKYTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379612; c=relaxed/simple;
	bh=Nn7GWfzkPeNtEopL+Xi4HZOi+o2YFBgqZLgq5Tuqr/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S4EulmjatAEHB+Hbm+0Veh51gNYoOAN3ECS4DBpPxD6bg2wcfd8pq+g3JFG4iyuEUDwZZ7u7RGS6ZT4NsJwrfrWbtrmQzoGM/rXf3Aw9LfKa2WVBaJCK1R+8QzZgXGJHhSoCkL+D2iJmjFHbxIp1jlntzib9CKrX2LrpFD2TOzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpvIKiJ7; arc=none smtp.client-ip=209.85.208.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpvIKiJ7"
Received: by mail-lj1-f196.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so27176571fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791379595; x=1791984395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NfnoS6laDtDOjlhPtBWxVPWGkEBbm6NCgizgXhR32xk=;
        b=gpvIKiJ711UQpWzlnRwHGae2xOEqAoqE8lff7unnCPK571FmygoKo01z+nY80mT4bl
         vUdW+2a1rfRLWGJaJSSUeytDSXaV6P9J6CosvTAed4HKpxmeV9sDiPTWhIr6WBo8QRpR
         O/tLyUYMvT8IdhNMqvmLUOzznhwlz2nOG99ZibaIKEUBqtsGdzDK3OWymgJ5NyGslAJh
         YpHosXEnAJfN8ssZCG8IexStzn68h9yZy5G+XzKxO66Bp1X4tT1UQbe5OVK23vwQ8GJd
         Up/m9PQKhTRXI5ial8hAJrz7aFJih+3iEdWxRwyQvnEgBEvVirfjjku7W1K1o/TkO8Bv
         qqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791379595; x=1791984395;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NfnoS6laDtDOjlhPtBWxVPWGkEBbm6NCgizgXhR32xk=;
        b=oIvkPAzvEZeSpVmNCZqqVUfYLFgIYjGfohOrQtHL/CIsiK4HFp8YTcBS5arJJov4Fs
         6ib/V8In7mPoWlIoYtkjM9cGfToQ+6UKlr44/v674X94tMuOvBf6YEx+cv8LZqFVutVH
         4sW6JBGdppa33un/kpkyskfhJzCnbrzvCqsG3IU64isZ+QVSJJEDX4v6upeEXuYEl10E
         l7Ap/EkUs0KvD94LQgOAXB0GG1nxzi+OLxkBiKsrmqnQbhFDwzqpGdg94V5tjjilbq82
         /iUiXOnYwwbjE3ao/nRGatUZMiDEem+7XPlNZ0YnV6wO97lIWxSWJWKgXRsPsPuG+3gb
         iGAw==
X-Forwarded-Encrypted: i=1; AKwUvBwye3LS1UrPXdy3h50V/MclHa/95IbW6LpYW24QCZMSvCOGoi7nAPxBq5WyCpLQiBykMxpQXOD5qISjUCg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0x+ZTPE/yVMXV4X9TcdIuhXtgUlimho0isaUKGbAmGb67RMmg
	zMHThQS4TA/ul7ho5gql3vvc06IoZcnyv8RketyGjcXz6cfoy4X2edLC
X-Gm-Gg: AYBFou3jqtPsczICKFLc7IKlEnTeeBK8pLWhfMWT8fZtOcDpXqb8fFP77llnQM3fM9V
	Ms3VIOtTT9PPeviLg5I7M7ZNIergQtRNVNyHrc8kANIdW+jiDU6NVqHByAFoFB1RjpnsdeV3F2o
	iWwQjgBuYeiQ4Mm0A+PQVbK95MkIs+Q5lQbkSNJR9g19xxr6GNQtpi8L1MHPpxOTGBmdTD45U6Y
	KybgpbM9iQ38aIUPHFCLWcB8hxvfmqd88Y6VurWRWSkOabrG/QLPdKp73mjklENUgGPyz2K3vLf
	TypVlEMzDUhJdRPIQadQy4DarI3PxCF6WmNAtRic7Ui4wqxSnwLOrvEp04pXP2J6cfmWlQ0xkGw
	XuijDZgPMG48GWYpyAWBKwcSESEM9l54NMbTa99YqlgQTnlz4YejbCUctYf9rHef0tPVOWzff2p
	zz+Ueb/0G6F6yE+PFpHwvJh8yJVhwcYS5v5GepL5kwztBhh8EFKL/gPufvs2v3j4I4H1PnhDbpi
	ksgMlFD6H8kbOqZP4uTfE809lU=
X-Received: by 2002:a05:651c:b12:b0:3a6:5c8f:857 with SMTP id 38308e7fff4ca-3a9941d9654mr13497871fa.8.1791379595005;
        Wed, 07 Oct 2026 06:26:35 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9a1d33f1asm6191851fa.11.2026.10.07.06.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:26:32 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Leo Liu <leo.liu@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Yinjie Yao <yinjie.yao@amd.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10] drm/amdgpu/jpeg: set no_user_fence for JPEG v2.5 ring
Date: Wed,  7 Oct 2026 16:26:18 +0300
Message-ID: <20261007132619.121324-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Yinjie Yao <yinjie.yao@amd.com>

commit 79405e774ede411c6b47ed41c651e40b92de64a2 upstream.

JPEG rings do not support 64-bit user fence writes, reject CS
submissions with user fences.

Fixes: 14f43e8f88c5 ("drm/amdgpu: move JPEG2.5 out from VCN2.5")
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Yinjie Yao <yinjie.yao@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit 3216a7f4e2642bda5fd14f57586e835ae9202587)
Signed-off-by: Sasha Levin <sashal@kernel.org>
[ Roman: Version 5.10 does not yet support JPEG2.6, so the fix is being
applied only to JPEG2.5 ]
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2026-63847

 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
index 8c84e35c2719..dfb96f052f6d 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
@@ -566,6 +566,7 @@ static const struct amd_ip_funcs jpeg_v2_5_ip_funcs = {
 static const struct amdgpu_ring_funcs jpeg_v2_5_dec_ring_vm_funcs = {
 	.type = AMDGPU_RING_TYPE_VCN_JPEG,
 	.align_mask = 0xf,
+	.no_user_fence = true,
 	.vmhub = AMDGPU_MMHUB_1,
 	.get_rptr = jpeg_v2_5_dec_ring_get_rptr,
 	.get_wptr = jpeg_v2_5_dec_ring_get_wptr,
-- 
2.53.0

